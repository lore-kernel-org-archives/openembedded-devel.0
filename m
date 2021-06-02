Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.9215.1622612766344975396
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jun 2021 22:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1525k37k016547
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Jun 2021 22:46:03 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 1 Jun 2021 22:46:02 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Tue, 1 Jun 2021 22:46:01 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] debootstrap: fix runtime failure on nativesdk
Date: Wed, 2 Jun 2021 13:46:00 +0800
Message-ID: <20210602054600.33711-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While calling debootstrap in sdk, if host does not install dpkg package,
the full path calling will fail

Do not hardcode the full path of dpkg, then the sdk's dpkg will be used.

In Yocto, for debootstrap, only dpkg is used, so the fix do not take care
of other utilities (such as /usr/bin/udpkg)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...o-not-hardcode-the-full-path-of-dpkg.patch | 33 +++++++++++++++++++
 .../debootstrap/debootstrap_1.0.124.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/debootstrap/debootstrap/0001-do-not-hardcode-the-full-path-of-dpkg.patch

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-do-not-hardcode-the-full-path-of-dpkg.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-do-not-hardcode-the-full-path-of-dpkg.patch
new file mode 100644
index 000000000..2a5f23316
--- /dev/null
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-do-not-hardcode-the-full-path-of-dpkg.patch
@@ -0,0 +1,33 @@
+From e735fb23f46f0c3c7a1144ba6b4050bfc0015a05 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 2 Jun 2021 13:34:35 +0800
+Subject: [PATCH] do not hardcode the full path of dpkg
+
+While calling debootstrap in sdk, if host does not install dpkg package,
+the full path calling will fail
+
+Do not hardcode the full path of dpkg, then then sdk's dpkg will be used.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ debootstrap | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/debootstrap b/debootstrap
+index a3cf3af..5e96c3e 100755
+--- a/debootstrap
++++ b/debootstrap
+@@ -538,7 +538,7 @@ fi
+ 
+ if in_path dpkg && \
+      dpkg --print-architecture >/dev/null 2>&1; then
+-	HOST_ARCH=$(/usr/bin/dpkg --print-architecture)
++	HOST_ARCH=$(dpkg --print-architecture)
+ elif in_path udpkg && \
+      udpkg --print-architecture >/dev/null 2>&1; then
+ 	HOST_ARCH=$(/usr/bin/udpkg --print-architecture)
+-- 
+2.27.0
+
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.124.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.124.bb
index 300c98f91..4fc59adfb 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.124.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.124.bb
@@ -8,6 +8,7 @@ SRC_URI  = "\
     http://http.debian.net/debian/pool/main/d/debootstrap/debootstrap_${PV}.tar.gz \
     file://0001-support-to-override-usr-sbin-and-usr-share.patch \
     file://0002-support-to-override-usr-bin-arch-test.patch \
+    file://0001-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
 SRC_URI[md5sum] = "8a5e97f60236c3a63f715c056a5f0e29"
-- 
2.27.0

