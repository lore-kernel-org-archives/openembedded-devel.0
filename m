Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.8954.1625731691260612921
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 01:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 168889tJ026807
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Jul 2021 01:08:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 168889qc021501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Jul 2021 01:08:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 8 Jul 2021 01:08:08 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Thu, 8 Jul 2021 01:08:08 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][meta-webserver][PATCH] nginx: fix CVE-2021-23017
Date: Thu, 8 Jul 2021 16:06:57 +0800
Message-ID: <20210708080657.31094-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../nginx/files/CVE-2021-23017.patch          | 46 +++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch
new file mode 100644
index 000000000..a70803377
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2021-23017.patch
@@ -0,0 +1,46 @@
+From 7199ebc203f74fd9e44595474de6bdc41740c5cf Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Tue, 25 May 2021 15:17:36 +0300
+Subject: [PATCH] Resolver: fixed off-by-one write in ngx_resolver_copy().
+
+Reported by Luis Merino, Markus Vervier, Eric Sesterhenn, X41 D-Sec GmbH.
+
+Upstream-Status: Backport
+CVE: CVE-2021-23017
+
+Reference to upstream patch:
+https://github.com/nginx/nginx/commit/7199ebc203f74fd9e44595474de6bdc41740c5cf
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/core/ngx_resolver.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/core/ngx_resolver.c b/src/core/ngx_resolver.c
+index 79390701..63b26193 100644
+--- a/src/core/ngx_resolver.c
++++ b/src/core/ngx_resolver.c
+@@ -4008,15 +4008,15 @@ done:
+             n = *src++;
+ 
+         } else {
++            if (dst != name->data) {
++                *dst++ = '.';
++            }
++
+             ngx_strlow(dst, src, n);
+             dst += n;
+             src += n;
+ 
+             n = *src++;
+-
+-            if (n != 0) {
+-                *dst++ = '.';
+-            }
+         }
+ 
+         if (n == 0) {
+-- 
+2.17.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index de080a2b0..a4583ed8f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://nginx-volatile.conf \
     file://nginx.service \
     file://nginx-fix-pidfile.patch \
+    file://CVE-2021-23017.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd
-- 
2.17.1

