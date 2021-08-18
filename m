Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.52287.1629279659537195264
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 02:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57436 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mGI44-00018Q-GS; Wed, 18 Aug 2021 12:40:58 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pandas: Upgrade 1.3.1 -> 1.3.2
Date: Wed, 18 Aug 2021 12:40:36 +0300
Message-Id: <20210818094038.21474-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818094038.21474-1-leon.anavi@konsulko.com>
References: <20210818094038.21474-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.2:

- Performance regression in DataFrame.isin() and Series.isin() for
  nullable data types
- Regression in updating values of Series using boolean index,
  created by using DataFrame.pop()
- Regression in DataFrame.from_records() with empty records
- Fixed regression in DataFrame.shift() where TypeError occurred
  when shifting DataFrame created by concatenation of slices and
  fills with values
- Regression in DataFrame.agg() when the func argument returned
  lists and axis=1
- Regression in DataFrame.drop() does nothing if MultiIndex has
  duplicates and indexer is a tuple or list of tuples
- Fixed regression where read_csv() raised a ValueError when
  parameters names and prefix were both set to None
- Fixed regression in comparisons between Timestamp object and
  datetime64 objects outside the implementation bounds for
  nanosecond datetime64
- Fixed regression in Styler.highlight_min() and
  Styler.highlight_max() where pandas.NA was not successfully
  ignored
- Fixed regression in concat() where copy=False was not honored
  in axis=1 Series concatenation
- Regression in Series.nlargest() and Series.nsmallest() with
  nullable integer or float dtype
- Fixed regression in Series.quantile() with Int64Dtype
- Bug in read_excel() modifies the dtypes dictionary when reading
  a file with duplicate columns
- 1D slices over extension types turn into N-dimensional slices
  over ExtensionArrays
- Fixed bug in Series.rolling() and DataFrame.rolling() not
  calculating window bounds correctly for the first row when
  center=True and window is an offset that covers all the rows
- Styler.hide_columns() now hides the index name header row as
  well as column headers
- Styler.set_sticky() has amended CSS to control the column/index
  names and ensure the correct sticky positions
- Bug in de-serializing datetime indexes in PYTHONOPTIMIZED mode

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pandas_1.3.1.bb => python3-pandas_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.3.1.bb => python3-pandas_1.3.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.3.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.3.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.3.2.bb
index 95fd1fc719..55700b51cf 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.3.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f23c5c092b74d245d48eeef72bc3fd2"
 
-SRC_URI[sha256sum] = "341935a594db24f3ff07d1b34d1d231786aa9adfa84b76eab10bf42907c8aed3"
+SRC_URI[sha256sum] = "cbcb84d63867af3411fa063af3de64902665bb5b3d40b25b2059e40603594e87"
 
 inherit pypi setuptools3
 
-- 
2.17.1

