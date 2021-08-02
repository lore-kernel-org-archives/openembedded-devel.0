Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.14847.1627870319276540283
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 19:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1722Bwpb029322
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 1 Aug 2021 19:11:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 1 Aug 2021 19:11:58 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 1 Aug 2021 19:11:57 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH 2/2] nginx: upgrade 1.19.6 -> 1.21.1
Date: Mon, 2 Aug 2021 10:09:35 +0800
Message-ID: <20210802020935.14749-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210802020935.14749-1-changqing.li@windriver.com>
References: <20210802020935.14749-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: Copyright Year Updated

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb
deleted file mode 100644
index 16c80cd09..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.18.x branch is the current stable branch, the recommended default
-# 1.19.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
-
-SRC_URI[md5sum] = "0be1d90b45b1bdfcf8339f299e74063a"
-SRC_URI[sha256sum] = "b11195a02b1d3285ddf2987e02c6b6d28df41bb1b1dd25f33542848ef4fc33b5"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
new file mode 100644
index 000000000..b69fd7dab
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.20.x branch is the current stable branch, the recommended default
+# 1.21.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=206629dc7c7b3e87acb31162363ae505"
+
+SRC_URI[md5sum] = "7dce9e2136ec32dfd823736e871815b1"
+SRC_URI[sha256sum] = "68ba0311342115163a0354cad34f90c05a7e8bf689dc498abf07899eda155560"
-- 
2.17.1

