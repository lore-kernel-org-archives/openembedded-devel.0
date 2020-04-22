Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.65.1587556917055907154
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 05:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,414,1580745600"; 
   d="scan'208";a="89494488"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 20:01:49 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 525F846B5FA5
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 19:51:11 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 20:01:46 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 22 Apr 2020 20:01:54 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python][PATCH] python3-cachetools: upgrade 4.0.0 -> 4.1.0
Date: Wed, 22 Apr 2020 13:01:37 -0700
Message-ID: <20200422200137.84487-1-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 525F846B5FA5.A405B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...hon3-cachetools_4.0.0.bb => python3-cachetools_4.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_4.0.0.bb => python3-cachetools_4.1.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.0.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-cachetools_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
index 50d0f2573..7411a749d 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_4.1.0.bb
@@ -6,11 +6,11 @@ Python 3 Standard Library @lru_cache function decorator."
 SECTION = "devel/python"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27f7518eb6f7dc686d0f953b2f28dae5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2d1e1bf0ccb26126a230c51f997ce362"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "6a88df13467e80eb61dd2bedad19b83c"
-SRC_URI[sha256sum] = "9a52dd97a85f257f4e4127f15818e71a0c7899f121b34591fcc1173ea79a0198"
+SRC_URI[md5sum] = "4468da43443115a00c02c126cf601ae0"
+SRC_URI[sha256sum] = "1d057645db16ca7fe1f3bd953558897603d6f0b9c51ed9d11eb4d071ec4e2aab"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1



