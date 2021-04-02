Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.13570.1617354652647180959
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Apr 2021 02:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1329AUbQ013654
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Apr 2021 02:10:46 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 2 Apr 2021 02:10:35 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 2 Apr 2021 02:10:34 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] freeradius: Upgrade to 3.0.21
Date: Fri, 2 Apr 2021 17:10:33 +0800
Message-ID: <20210402091033.5930-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Drop one patch at the issue is already fixed in new version
(307678b268 Fix rlm_python3 build)

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...python3-add-PY_INC_DIR-in-search-dir.patch | 58 -------------------
 ...eradius_3.0.20.bb => freeradius_3.0.21.bb} |  3 +-
 2 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.20.bb => freeradius_3.0.21.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch
deleted file mode 100644
index d63023162..000000000
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 733330888fff49e4d2b6c2121a6050fdd9f11a87 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 6 Feb 2020 09:32:04 +0800
-Subject: [PATCH] rlm_python3: add PY_INC_DIR in search dir
-
-The configure option --with-rlm-python3-include-dir is used to set
-PY_INC_DIR which is never used and it fails to find Python.h,
-so add it into search dir to fix it.
-
-Also remove SMART_LIBS from mod_flags because it introduces rpath
-to LDFALGS which causes a do_package_qa error:
-
-ERROR: freeradius-3.0.20-r0 do_package_qa: QA Issue: package freeradius-python contains bad RPATH
-/buildarea/build/tmp/work/core2-64-poky-linux/freeradius/3.0.20-r0/recipe-sysroot-native/usr/lib/python3.8/config in file
-/buildarea/build/tmp/work/core2-64-poky-linux/freeradius/3.0.20-r0/packages-split/freeradius-python/usr/lib/rlm_python3.so.0.0.0
-package freeradius-python contains bad RPATH
-/buildarea/build/tmp/work/core2-64-poky-linux/freeradius/3.0.20-r0/recipe-sysroot-native/usr/lib/python3.8/config in file
-/buildarea/build/tmp/work/core2-64-poky-linux/freeradius/3.0.20-r0/packages-split/freeradius-python/usr/lib/rlm_python3.so.0.0.0 [rpaths]
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/modules/rlm_python3/configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/modules/rlm_python3/configure.ac b/src/modules/rlm_python3/configure.ac
-index a00320f..adbdf19 100644
---- a/src/modules/rlm_python3/configure.ac
-+++ b/src/modules/rlm_python3/configure.ac
-@@ -95,7 +95,7 @@ if test x$with_[]modname != xno; then
- 
- 		old_CFLAGS=$CFLAGS
- 		CFLAGS="$CFLAGS $PY_CFLAGS"
--		smart_try_dir="$PY_PREFIX/include/python$PY_SYS_VERSION"
-+		smart_try_dir="$PY_PREFIX/include/python$PY_SYS_VERSION $PY_INC_DIR"
- 		FR_SMART_CHECK_INCLUDE(Python.h)
- 		CFLAGS=$old_CFLAGS
- 
-@@ -114,13 +114,13 @@ if test x$with_[]modname != xno; then
- 
- 		eval t=\${ac_cv_lib_${sm_lib_safe}_${sm_func_safe}}
- 		if test "x$t" = "xyes"; then
--			mod_ldflags="$PY_LIB_LOC $PY_EXTRA_LIBS $SMART_LIBS -lm"
-+			mod_ldflags="$PY_LIB_LOC $PY_EXTRA_LIBS -lm"
- 			targetname=modname
- 		else
- 			FR_SMART_CHECK_LIB(python${PY_SYS_VERSION}m, Py_Initialize)
- 			eval t=\${ac_cv_lib_${sm_lib_safe}_${sm_func_safe}}
- 			if test "x$t" = "xyes"; then
--				mod_ldflags="$PY_LIB_LOC $PY_EXTRA_LIBS $SMART_LIBS -lm"
-+				mod_ldflags="$PY_LIB_LOC $PY_EXTRA_LIBS -lm"
- 				targetname=modname
- 			else
- 				targetname=
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
index 608d66b1b..864a4e944 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
@@ -26,7 +26,6 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
     file://freeradius-fix-quoting-for-BUILT_WITH.patch \
     file://freeradius-fix-error-for-expansion-of-macro.patch \
     file://0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
-    file://0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch \
     file://0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch \
     file://0001-raddb-certs-Makefile-fix-the-occasional-verification.patch \
     file://0001-workaround-error-with-autoconf-2.7.patch \
@@ -34,7 +33,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
     file://radiusd-volatiles.conf \
 "
 
-SRCREV = "d94c953ab9602a238433ba18533111b845fd8e9e"
+SRCREV = "af428abda249b2279ba0582180985a9f6f4a144a"
 
 PARALLEL_MAKE = ""
 
-- 
2.17.1

