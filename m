Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.5663.1614165923062889975
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 03:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56972 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEsIB-000137-JK; Wed, 24 Feb 2021 13:25:20 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pandas: Upgrade 1.2.1 -> 1.2.2
Date: Wed, 24 Feb 2021 13:25:09 +0200
Message-Id: <20210224112512.31406-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224112512.31406-1-leon.anavi@konsulko.com>
References: <20210224112512.31406-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.2.2:

- Fixed regression in read_excel() that caused it to raise
  AttributeError when checking version of older xlrd versions
- Fixed regression in DataFrame constructor reordering element
  when construction from datetime ndarray with dtype not
  "datetime64[ns]"
- Fixed regression in DataFrame.astype() and Series.astype()
  not casting to bytes dtype
- Fixed regression in to_pickle() failing to create bz2/xz
  compressed pickle files with protocol=5
- Fixed regression in pandas.testing.assert_series_equal() and
  pandas.testing.assert_frame_equal() always raising
  AssertionError when comparing extension dtypes
- Fixed regression in to_csv() opening codecs.StreamWriter in
  binary mode instead of in text mode and ignoring user-provided
  mode
- Fixed regression in Categorical.astype() casting to incorrect
  dtype when np.int32 is passed to dtype argument
- Fixed regression in to_excel() creating corrupt files when
  appending (mode="a") to an existing file
- Fixed regression in DataFrame.transform() failing in case of an
  empty DataFrame or Series
- Fixed regression in groupby() or resample() when aggregating an
  all-NaN or numeric object dtype column
- Fixed regression in Rolling.count() where the min_periods
  argument would be set to 0 after the operation
- Fixed regression in read_excel() that incorrectly raised when
  the argument io was a non-path and non-buffer and the engine
  argument was specified
- pandas.read_excel() error message when a specified sheetname
  does not exist is now uniform across engines
- Fixed bug in pandas.read_excel() producing incorrect results
  when the engine openpyxl is used and the excel file is missing
  or has incorrect dimension information; the fix requires
  openpyxl >= 3.0.0, prior versions may still fail
- Fixed bug in pandas.read_excel() sometimes producing a DataFrame
  with trailing rows of np.nan when the engine openpyxl is used

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pandas_1.2.1.bb => python3-pandas_1.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.2.1.bb => python3-pandas_1.2.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
index ae8a55f847..7529237866 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
 
-SRC_URI[sha256sum] = "5527c5475d955c0bc9689c56865aaa2a7b13c504d6c44f0aadbf57b565af5ebd"
+SRC_URI[sha256sum] = "14ed84b463e9b84c8ff9308a79b04bf591ae3122a376ee0f62c68a1bd917a773"
 
 inherit pypi setuptools3
 
-- 
2.17.1

