Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.30789.1611161591552284556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 08:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54830 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2GjD-0007OW-Pq; Wed, 20 Jan 2021 18:53:08 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pandas: Upgrade 1.2.0 -> 1.2.1
Date: Wed, 20 Jan 2021 18:52:59 +0200
Message-Id: <20210120165300.8588-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 1.2.1:

- Fixed regression in to_csv() that created corrupted zip files
  when there were more rows than chunksize
- Fixed regression in to_csv() opening codecs.StreamReaderWriter
  in binary mode instead of in text mode
- Fixed regression in read_csv() and other read functions were
  the encoding error policy (errors) did not default to "replace"
  when no encoding was specified
- Fixed regression in read_excel() with non-rawbyte file handles
- Fixed regression in DataFrame.to_stata() not removing the
  created file when an error occured
- Fixed regression in DataFrame.__setitem__ raising ValueError
  when expanding DataFrame and new column is from type "0 - name"
- Fixed regression in setting with DataFrame.loc() raising
  ValueError when DataFrame has unsorted MultiIndex columns and
  indexer is a scalar
- Fixed regression in setting with DataFrame.loc() raising
  KeyError with MultiIndex and list-like columns indexer enlarging
  DataFrame
- Fixed regression in groupby() with Categorical grouping column
  not showing unused categories for grouped.indices
- Fixed regression in GroupBy.sem() where the presence of
  non-numeric columns would cause an error instead of being
  dropped
- Fixed regression in DataFrameGroupBy.diff() raising for int8 and
  int16 columns
- Fixed regression in DataFrame.groupby() when aggregating an
  ExtensionDType that could fail for non-numeric values
- Fixed regression in Rolling.skew() and Rolling.kurt() modifying
  the object inplace
- Fixed regression in DataFrame.any() and DataFrame.all() not
  returning a result for tz-aware datetime64 columns
- Fixed regression in DataFrame.apply() with axis=1 using str
  accessor in apply function
- Fixed regression in DataFrame.replace() raising ValueError when
  DataFrame has dtype bytes
- Fixed regression in Series.fillna() that raised RecursionError
  with datetime64[ns, UTC] dtype
- Fixed regression in comparisons between NaT and datetime.date
  objects incorrectly returning True
- Fixed regression in calling NumPy accumulate() ufuncs on
  DataFrames, e.g. np.maximum.accumulate(df)
- Fixed regression in repr of float-like strings of an object
  dtype having trailing 0’s truncated after the decimal
- Fixed regression that raised AttributeError with PyArrow
  versions [0.16.0, 1.0.0)
- Fixed regression in pandas.testing.assert_frame_equal() raising
  TypeError with check_like=True when Index or columns have mixed
  dtype

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pandas_1.2.0.bb => python3-pandas_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.2.0.bb => python3-pandas_1.2.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
index 0cb631990..ae8a55f84 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
 
-SRC_URI[sha256sum] = "e03386615b970b8b41da6a68afe717626741bb2431cec993640685614c0680e4"
+SRC_URI[sha256sum] = "5527c5475d955c0bc9689c56865aaa2a7b13c504d6c44f0aadbf57b565af5ebd"
 
 inherit pypi setuptools3
 
-- 
2.17.1

