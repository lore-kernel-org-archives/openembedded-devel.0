Received: from david.siemens.de (david.siemens.de [192.35.17.14])
 by mx.groups.io with SMTP id smtpd.web09.5469.1612430252048173084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 01:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.14, mailfrom: andrej.kozemcak@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 1149HTgO006781
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Feb 2021 10:17:29 +0100
Received: from dev.vm7.ccp.siemens.com ([144.145.220.57])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 1149HT1N020674;
	Thu, 4 Feb 2021 10:17:29 +0100
Received: from dev.vm7.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id F105B307A979;
	Thu,  4 Feb 2021 10:17:28 +0100 (CET)
From: "Andrej Kozemcak" <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][dunfell][PATCH] libuv: fix CVE-2020-8252
Date: Thu,  4 Feb 2021 10:16:35 +0100
Message-Id: <20210204091635.11847-1-andrej.kozemcak@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../libuv/libuv/CVE-2020-8252.patch           | 41 +++++++++++++++++++
 .../libuv/libuv_1.36.0.bb                     |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libuv/libuv/CVE-2020-8252.patch

diff --git a/meta-oe/recipes-connectivity/libuv/libuv/CVE-2020-8252.patch b/meta-oe/recipes-connectivity/libuv/libuv/CVE-2020-8252.patch
new file mode 100644
index 000000000..dd99b4487
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libuv/libuv/CVE-2020-8252.patch
@@ -0,0 +1,41 @@
+From 0e6e8620496dff0eb285589ef1e37a7f407f3ddd Mon Sep 17 00:00:00 2001
+From: Ben Noordhuis <info@bnoordhuis.nl>
+Date: Mon, 24 Aug 2020 11:42:27 +0200
+Subject: [PATCH] unix: don't use _POSIX_PATH_MAX
+
+Libuv was using _POSIX_PATH_MAX wrong. Bug introduced in commit b56d279b
+("unix: do not require PATH_MAX to be defined") from September 2018.
+
+_POSIX_PATH_MAX is the minimum max path size guaranteed by POSIX, not
+the actual max path size of the system libuv runs on. _POSIX_PATH_MAX
+is always 256, the real max is often much bigger.
+
+This commit fixes buffer overruns when processing very long paths in
+uv_fs_readlink() and uv_fs_realpath() because libuv was not allocating
+enough memory to store the result.
+
+Fixes: https://github.com/libuv/libuv/issues/2965
+PR-URL: https://github.com/libuv/libuv/pull/2966
+
+Upstream-Status: Backport [https://github.com/libuv/libuv/commit/0e6e8620496dff0eb285589ef1e37a7f407f3ddd]
+CVE: CVE-2020-8252
+Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
+---
+ src/unix/internal.h | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/src/unix/internal.h b/src/unix/internal.h
+index 30711673e0..9d3c2297f8 100644
+--- a/src/unix/internal.h
++++ b/src/unix/internal.h
+@@ -62,9 +62,7 @@
+ # include <AvailabilityMacros.h>
+ #endif
+ 
+-#if defined(_POSIX_PATH_MAX)
+-# define UV__PATH_MAX _POSIX_PATH_MAX
+-#elif defined(PATH_MAX)
++#if defined(PATH_MAX)
+ # define UV__PATH_MAX PATH_MAX
+ #else
+ # define UV__PATH_MAX 8192
diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
index deeaa2b15..757720731 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
@@ -5,7 +5,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
 SRCREV = "533b738838ad8407032e14b6772b29ef9af63cfa"
-SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
+SRC_URI = "git://github.com/libuv/libuv;branch=v1.x \
+           file://CVE-2020-8252.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1

