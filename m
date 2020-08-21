Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.127423.1597988054250929534
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 22:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; 
   d="scan'208";a="98374599"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 13:34:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C0DA648990DD
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 13:34:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 13:34:08 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] leptonica: upgrade 1.79.0 -> 1.80.0
Date: Sat, 22 Aug 2020 01:33:55 +0800
Message-ID: <1598031241-3582-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598031241-3582-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598031241-3582-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C0DA648990DD.A7ECA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2020.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../leptonica/{leptonica_1.79.0.bb => leptonica_1.80.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/leptonica/{leptonica_1.79.0.bb => leptonica_1.80.0.bb} (72%)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.79.0.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.80.0.bb
similarity index 72%
rename from meta-oe/recipes-graphics/leptonica/leptonica_1.79.0.bb
rename to meta-oe/recipes-graphics/leptonica/leptonica_1.80.0.bb
index a6de1f795..a861bba5b 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.79.0.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.80.0.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "A pedagogically-oriented open source site containing software that is broadly useful for image processing and image analysis applications"
 DEPENDS = "jpeg tiff libpng zlib"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=34aa579294e8284b7b848c8d5d361e8f"
+LIC_FILES_CHKSUM = "file://leptonica-license.txt;md5=809b282cea2df68975fbe0ffe02b560f"
 
 UPSTREAM_CHECK_URI = "https://github.com/DanBloomberg/leptonica/releases"
 
 SRC_URI = "http://www.leptonica.org/source/leptonica-${PV}.tar.gz"
-SRC_URI[md5sum] = "a545654b1dae7d29e2ea346b29095f84"
-SRC_URI[sha256sum] = "045966c9c5d60ebded314a9931007a56d9d2f7a6ac39cb5cc077c816f62300d8"
+SRC_URI[md5sum] = "d640d684234442a84c9e8902f0b3ff36"
+SRC_URI[sha256sum] = "ec9c46c2aefbb960fb6a6b7f800fe39de48343437b6ce08e30a8d9688ed14ba4"
 
 EXTRA_OECONF += " \
     --without-libwebp \
-- 
2.25.1



