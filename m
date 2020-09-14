Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.60954.1600089354756678804
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 06:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52716 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHoKn-0000ED-A2; Mon, 14 Sep 2020 16:15:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-pandas: Upgrade 1.1.1 -> 1.1.2
Date: Mon, 14 Sep 2020 16:15:34 +0300
Message-Id: <20200914131536.6072-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914131536.6072-1-leon.anavi@konsulko.com>
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.2:

- Regression in DatetimeIndex.intersection() incorrectly raising
  AssertionError when intersecting against a list
- Fix regression in updating a column inplace
- Fix regression in DataFrame.append() mixing tz-aware and
  tz-naive datetime columns
- Performance regression for RangeIndex.format()
- Regression where MultiIndex.get_loc() would return a slice
  spanning the full index when passed an empty list
- Bug in DataFrame.eval() with object dtype column binary
  operations
- Bug in Series constructor raising a TypeError when constructing
  sparse datetime64 dtypes
- Bug in DataFrame.apply() with result_type="reduce" returning
  with incorrect index
- Bug in Series.astype() and DataFrame.astype() not respecting the
  errors argument when set to "ignore" for extension dtypes
- Bug in DateTimeIndex.format() and PeriodIndex.format() with
  name=True setting the first item to "None" where it should be ""
- Other bug fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pandas_1.1.1.bb => python3-pandas_1.1.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.1.1.bb => python3-pandas_1.1.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
index 63ae69e3d..1eade9884 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
 
-SRC_URI[md5sum] = "bb796b56c276ecea1a6a227010e9c56a"
-SRC_URI[sha256sum] = "53328284a7bb046e2e885fd1b8c078bd896d7fc4575b915d4936f54984a2ba67"
+SRC_URI[md5sum] = "b4ce7c64f549ed48b47877fc64281031"
+SRC_URI[sha256sum] = "b64ffd87a2cfd31b40acd4b92cb72ea9a52a48165aec4c140e78fd69c45d1444"
 
 inherit pypi setuptools3
 
-- 
2.17.1

