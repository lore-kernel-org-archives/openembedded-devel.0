Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.2548.1605178602904666294
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 02:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39606 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kdAHQ-0006p6-O1; Thu, 12 Nov 2020 12:56:41 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pandas: Upgrade 1.1.3 -> 1.1.4
Date: Thu, 12 Nov 2020 12:56:17 +0200
Message-Id: <20201112105618.23773-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112105618.23773-1-leon.anavi@konsulko.com>
References: <20201112105618.23773-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.1.4:

- Fixed regression in read_csv() raising a ValueError when names
  was of type dict_keys
- Fixed regression in read_csv() with more than 1M rows and
  specifying a index_col argument
- Fixed regression where attempting to mutate a DateOffset object
  would no longer raise an AttributeError
- Fixed regression where DataFrame.agg() would fail with TypeError
  when passed positional arguments to be passed on to the
  aggregation function
- Fixed regression in RollingGroupby with sort=False not being
  respected
- Fixed regression in Series.astype() converting None to "nan"
  when casting to string
- Fixed regression in Series.rank() method failing for read-only
  data
- Fixed regression in RollingGroupby causing a segmentation fault
  with Index of dtype object
- Fixed regression in DataFrame.resample(...).apply(...)() raised
  AttributeError when input was a DataFrame and only a Series was
  evaluated
- Fixed regression in DataFrame.groupby(..).std() with nullable
  integer dtype
- Fixed regression in PeriodDtype comparing both equal and unequal
  to its string representation
- Fixed regression where slicing DatetimeIndex raised AssertionError
  on irregular time series with pd.NaT or on unsorted indices
- Fixed regression in certain offsets (pd.offsets.Day() and below)
  no longer being hashable
- Fixed regression in StataReader which required chunksize to be
  manually set when using an iterator to read a dataset
- Fixed regression in setitem with DataFrame.iloc() which raised
  error when trying to set a value while filtering with a boolean
  list
- Fixed regression in setitem with a Series getting aligned before
  setting the values
- Fixed regression in MultiIndex.is_monotonic_increasing returning
  wrong results with NaN in at least one of the levels
- Fixed regression in inplace arithmetic operation on a Series not
  updating the parent DataFrame
- Fixed bug causing groupby(...).sum() and similar to not preserve
  metadata
- Fixed bug in Series.isin() and DataFrame.isin() raising a
  ValueError when the target was read-only
- Fixed bug in GroupBy.fillna() that introduced a performance
  regression after 1.0.5
- Fixed bug in DataFrame.info() was raising a KeyError when the
  DataFrame has integer column names
- Fixed bug in DataFrameGroupby.apply() would drop a
  CategoricalIndex when grouped on

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pandas_1.1.3.bb => python3-pandas_1.1.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.1.3.bb => python3-pandas_1.1.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
index da1ffd0b6d..78730b46af 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
 
-SRC_URI[md5sum] = "f10372d83a1c55cae217e8c05bf9bc5d"
-SRC_URI[sha256sum] = "babbeda2f83b0686c9ad38d93b10516e68cdcd5771007eb80a763e98aaf44613"
+SRC_URI[md5sum] = "594e6a429f297c77470e37d3510cccbb"
+SRC_URI[sha256sum] = "a979d0404b135c63954dea79e6246c45dd45371a88631cdbb4877d844e6de3b6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

