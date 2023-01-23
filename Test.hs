#!/usr/bin/env stack

import Control.Monad.State
import Data.List

main :: IO ()
main = do
  -- ([1,2,3], 6)
  print $ runState (mapM (\x -> state $ \acc -> (x, x + acc)) [1, 2, 3]) (0 :: Int)

  -- ([1,3,6], 6): 数列 → 累積和
  print $ runState (mapM (\x -> state $ \acc -> (x + acc, x + acc)) [1, 2, 3]) (0 :: Int)

  -- ([1,2,3], 6): 累積和 → 数列
  print $ runState (mapM (\x -> state $ \last -> (x - last, x)) [1, 3, 6]) (0 :: Int)
