Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.14845.1627870306433654207
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 19:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1722BiCq029318
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 1 Aug 2021 19:11:45 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 1 Aug 2021 19:11:44 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 1 Aug 2021 19:11:43 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH] apache2: upgrade 2.4.46 -> 2.4.48
Date: Mon, 2 Aug 2021 10:09:22 +0800
Message-ID: <20210802020922.14691-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../apache2/{apache2_2.4.46.bb => apache2_2.4.48.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.46.bb => apache2_2.4.48.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.48.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.48.bb
index e84f7eaa2..3a851167c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.46.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.48.bb
@@ -26,8 +26,8 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[md5sum] = "7d661ea5e736dac5e2761d9f49fe8361"
-SRC_URI[sha256sum] = "740eddf6e1c641992b22359cabc66e6325868c3c5e2e3f98faf349b61ecf41ea"
+SRC_URI[md5sum] = "a7088cec171b0d00bf43394ce64d3909"
+SRC_URI[sha256sum] = "1bc826e7b2e88108c7e4bf43c026636f77a41d849cfb667aa7b5c0b86dbf966c"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.17.1

