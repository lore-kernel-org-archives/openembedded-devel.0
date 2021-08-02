Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.14773.1627870319148431841
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 19:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1722Bw9g001377
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 1 Aug 2021 19:11:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1722BvR6000743
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 1 Aug 2021 19:11:58 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 1 Aug 2021 19:11:57 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 1 Aug 2021 19:11:56 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH 1/2] nginx: upgrade 1.18.0 -> 1.20.1
Date: Mon, 2 Aug 2021 10:09:34 +0800
Message-ID: <20210802020935.14749-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: Copyright Year Updated

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb | 6 ------
 meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
deleted file mode 100644
index ac303e47d..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
-
-SRC_URI[md5sum] = "b2d33d24d89b8b1f87ff5d251aa27eb8"
-SRC_URI[sha256sum] = "4c373e7ab5bf91d34a4f11a0c9496561061ba5eee6020db272a17a7228d35f99"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
new file mode 100644
index 000000000..32d375542
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=206629dc7c7b3e87acb31162363ae505"
+
+SRC_URI[md5sum] = "8ca6edd5076bdfad30a69c9c9b41cc68"
+SRC_URI[sha256sum] = "e462e11533d5c30baa05df7652160ff5979591d291736cfa5edb9fd2edb48c49"
-- 
2.17.1

