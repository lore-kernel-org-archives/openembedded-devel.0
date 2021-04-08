Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web08.271.1617899822237825033
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KVWlclDf;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so2916213otn.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=E9DJ+d6sQWxE9rIliBPxgc7vPxmcNetDYGxTkUcpYBo=;
        b=KVWlclDf2eMPm0XZzRGkJ+KY9uYzU4pqNLmiZxt8K0yENa3ZZAsDKCrSN+Oxwz8Q95
         oDN191lGskP7JPsYXG4jbTA1vVLQAYUayHACF4/ZlW3c/GvicX7P1luGB48dg5f1HJqP
         GEcS2mlNhC1Z0dydhIuLWFPSKqD/+Bcl7yKCKCUfOz5tE2XH8u/pvO0M/4zvtBCvqjXJ
         RhL7bPXUAxFXdqZEaaeSSF3xN1rFURWZKqXnWHvM8shfY8JOQgzxEEPrIgWnKQEkjTZ/
         49SZyA3vtN4zmDIROKPaXVO/hDmLXQay/3CxDI5a393kO0P4lafLT2h5Z/SNA5LdM1A8
         RJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=E9DJ+d6sQWxE9rIliBPxgc7vPxmcNetDYGxTkUcpYBo=;
        b=XyYehJUehB2PtDiNIx5G03OMEzNDyvI9QrjFOTsJ+NYlVCpRE8bIxqxBryxwHb/dYz
         1QKPcT4dlFDXEZsmIpldB1yqBtdahAZuwaBi0FbmxwILK10LlKrqQ7VIcf71tGSpu/8L
         Kj2PafhwhdGJUmxlVeBAZsJYqRMmzy9s4ciRvHlz5hMTNyppRhHsUyX9kKqUs9Iu41Ao
         hPFWJ37J3P7nc0t+KYD/XxaBMhMFC+WxfyVS3iTdK5vCKLO7SyACqdkUgmL6vSfeudN0
         KUMjAa3b4BPhrRXIvCXwOuHMJgW5sz/M80am86I6Clsl7IfAW34sY5jcmg0da43cpNzg
         7wmw==
X-Gm-Message-State: AOAM533rBNh3GaN1XhR1XJ2K2LeTWguT31ji9ZLn7Mbq+tf4AbrTXo58
	seFvWDGlIZBoSnB+81lHfUASSOUX1dw=
X-Google-Smtp-Source: ABdhPJy2YlXSRrZXIIMPeXIZYpM076NbViebv5ERS8mfOepSSql16qMfz8LGtaNG4hQlREmQOhoA1w==
X-Received: by 2002:a9d:7545:: with SMTP id b5mr8179729otl.223.1617899821423;
        Thu, 08 Apr 2021 09:37:01 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:01 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 52/64] freeradius: Upgrade to 3.0.21
Date: Thu,  8 Apr 2021 09:35:59 -0700
Message-Id: <f282f0829a4deb8e9ae215819b972d27fac0f7ac.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Drop one patch at the issue is already fixed in new version
(307678b268 Fix rlm_python3 build)

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ece4e7d4f06581b2e68b9f662bc208b050f76cf1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...python3-add-PY_INC_DIR-in-search-dir.patch | 58 -------------------
 ...eradius_3.0.20.bb => freeradius_3.0.21.bb} |  3 +-
 2 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.20.bb => freeradius_3.0.21.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch
deleted file mode 100644
index d63023162d7..00000000000
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
index 608d66b1b38..864a4e94470 100644
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

