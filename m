Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web08.42209.1609134898418273699
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 21:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,454,1599494400"; 
   d="scan'208";a="102979365"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Dec 2020 13:54:55 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 54A834CE601C
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Dec 2020 13:54:54 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 28 Dec 2020 13:54:54 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] giflib: upgrade 5.1.4 -> 5.2.1
Date: Mon, 28 Dec 2020 13:54:51 +0800
Message-ID: <1609134891-90011-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 54A834CE601C.A72BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../giflib/{giflib_5.1.4.bb => giflib_5.2.1.bb}          | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/giflib/{giflib_5.1.4.bb => giflib_5.2.1.bb} (58%)

diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
similarity index 58%
rename from meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
rename to meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
index 21fa352cd..8d3f3f1c9 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
@@ -3,9 +3,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
-
-inherit autotools
+SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz"
 
 PACKAGES += "${PN}-utils"
 FILES_${PN} = "${libdir}/libgif.so.*"
@@ -13,7 +11,8 @@ FILES_${PN}-utils = "${bindir}"
 
 BBCLASSEXTEND = "native"
 
+DEPENDS = "xmlto-native"
 RDEPENDS_${PN}-utils = "perl"
 
-SRC_URI[md5sum] = "2c171ced93c0e83bb09e6ccad8e3ba2b"
-SRC_URI[sha256sum] = "df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
+SRC_URI[md5sum] = "6f03aee4ebe54ac2cc1ab3e4b0a049e5"
+SRC_URI[sha256sum] = "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77a6d9acf0077879bd"
-- 
2.25.1



