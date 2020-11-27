Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.13685.1606442669646667709
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 18:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101800768"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 10:04:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8781A4CE5440
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 10:04:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 10:04:15 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] nghttp2: upgrade 2.41.0 -> 2.42.0
Date: Fri, 27 Nov 2020 10:04:13 +0800
Message-ID: <1606442653-117241-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8781A4CE5440.A0A96
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../nghttp2/{nghttp2_1.41.0.bb => nghttp2_1.42.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.41.0.bb => nghttp2_1.42.0.bb} (90%)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.41.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.42.0.bb
similarity index 90%
rename from meta-networking/recipes-support/nghttp2/nghttp2_1.41.0.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.42.0.bb
index 29ab0b75a..d24b0b475 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.41.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.42.0.bb
@@ -11,8 +11,8 @@ SRC_URI = "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[md5sum] = "549db3507a7637b28ca467c7f3e9e023"
-SRC_URI[sha256sum] = "abc25b8dc601f5b3fefe084ce50fcbdc63e3385621bee0cbfa7b57f9ec3e67c2"
+SRC_URI[md5sum] = "c38f1d230af8cec480ff9dd60c9e0db0"
+SRC_URI[sha256sum] = "c5a7f09020f31247d0d1609078a75efadeccb7e5b86fc2e4389189b1b431fe63"
 
 inherit cmake manpages python3native
 PACKAGECONFIG[manpages] = ""
-- 
2.25.1



