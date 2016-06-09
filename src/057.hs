{-
Problem 57 「平方根の近似分数」
==============================

問題
--------------

2の平方根は無限に続く連分数で表すことができる.

√ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
最初の4回の繰り返しを展開すると以下が得られる.

1 + 1/2 = 3/2 = 1.5
1 + 1/(2 + 1/2) = 7/5 = 1.4
1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

次の3つの項は99/70, 239/169, 577/408である. 第8項は1393/985である. これは分子の桁数が分母の桁数を超える最初の例である.

最初の1000項を考えたとき, 分子の桁数が分母の桁数を超える項はいくつあるか?

解答
------------

第i項をRiとすると、漸化式で以下のように書ける。

R1 =          1+1/2   =3/2
R2 =     1+1/(2+1/2)  =1+1/(R1+1)
R3 =1+1/(2+1/(2+1/2)) =1+1/(R2+1)
Ri =1+1/(R(i-1)+1)

Rationalを使って愚直に調べる。
-}

import           Data.Ratio (denominator, numerator)

main = (print . length . answer) 1000

-- 第1項から第N項までで、分子の桁数が分母の桁数より大きいものを列挙する。
answer :: Int -> [Rational]
answer n = filter gtDigit $ (take n . iterate drilldown) (3/2)

-- 分子の桁数が分母の桁数より大きいか判定
gtDigit :: Rational -> Bool
gtDigit x = (length . show . numerator) x > (length . show . denominator) x

-- 次の項を計算する
drilldown :: Rational -> Rational
drilldown x = 1+1/(x+1)