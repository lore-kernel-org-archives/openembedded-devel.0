Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.9603.1589532656483615487
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 01:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04F8otB1022272
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 01:50:55 -0700 (PDT)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 15 May
 2020 01:50:54 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 1/2] libldb: upgrade 1.5.6 -> 1.5.7
Date: Fri, 15 May 2020 16:50:47 +0800
Message-ID: <20200515085048.26381-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libldb/{libldb_1.5.6.bb => libldb_1.5.7.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.6.bb => libldb_1.5.7.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.6.bb b/meta-networking/recipes-support/libldb/libldb_1.5.7.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_1.5.6.bb
rename to meta-networking/recipes-support/libldb/libldb_1.5.7.bb
index cc24863c6..da77a2389 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.5.7.bb
@@ -33,8 +33,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "fc58ef432c1fcb03fc3bb6cccce08977"
-SRC_URI[sha256sum] = "ff82474d0bf109e415a2d50334bde5715f486a53ff4bb8c7f74459dd229e975b"
+SRC_URI[md5sum] = "4d72bbfe7c7fcdf592482a98c853d222"
+SRC_URI[sha256sum] = "b9eeb77ecb94f3b53caeff7cbc1850b6294fa937be4364c53a92a62c6548c001"
 
 inherit waf-samba
 
-- 
2.17.1

