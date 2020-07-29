Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2485.1596015345173783223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 02:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06T9ZCKP022326
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 02:35:34 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 29 Jul
 2020 02:35:18 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 1/2] libldb: upgrade 1.5.7 -> 1.5.8
Date: Wed, 29 Jul 2020 17:35:12 +0800
Message-ID: <20200729093513.6782-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libldb/{libldb_1.5.7.bb => libldb_1.5.8.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.7.bb => libldb_1.5.8.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.7.bb b/meta-networking/recipes-support/libldb/libldb_1.5.8.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_1.5.7.bb
rename to meta-networking/recipes-support/libldb/libldb_1.5.8.bb
index da77a2389..199db797a 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.7.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.5.8.bb
@@ -33,8 +33,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "4d72bbfe7c7fcdf592482a98c853d222"
-SRC_URI[sha256sum] = "b9eeb77ecb94f3b53caeff7cbc1850b6294fa937be4364c53a92a62c6548c001"
+SRC_URI[md5sum] = "d9b4bea8b48cd4c4d0c492e65881164b"
+SRC_URI[sha256sum] = "ddf7f770643e0a0dda60f2818913f883caeed37fa1e8d6eda0dfe9588c1e3a83"
 
 inherit waf-samba
 
-- 
2.17.1

