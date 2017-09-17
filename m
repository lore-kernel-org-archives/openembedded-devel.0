Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 05E1B65CB6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 09:43:15 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r136so6230563wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=V3W1QOmSEf9jcTq7TjjSaTJFJZbzbHGIxcNJdb+7ZRU=;
	b=JJuCE2IaO4hYb9Eds0bE3OUz/6NbjSCOp/9WTHimcrbQ7OCr2IscY/LPTERAkXIBVV
	te4bH1WHHjMThGzBSylwe0Gd+LLxF4017S+cz0V+9piGf1OHo+GAvHlatCu/JB3h6ksF
	+SN0NZwikLCV3QSHRn/3BYekM6DfSwDmvxwMlj4ptOcyFmmXFZOP+wlK5E6M7EDYbCwf
	pZLez4WRm6h3j0aCIcHa+2mcA0ydndFEn+8Tv+jlasb2BerN+kBfHst6vETJY5YAOlO9
	9M1D3PtAnvXUCKDrhrpUL45CkmpR99VDYERf+mPqMhlwP7vp3BgnTOQye8KdlCeNKYsE
	QGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=V3W1QOmSEf9jcTq7TjjSaTJFJZbzbHGIxcNJdb+7ZRU=;
	b=ckyQR/fyKDCwwiMVRIeSNRsqLx4Ph6oNyi+xBM2oNlesB94drqouvhuuaTxeweFaw1
	YWXB4RMsKMGsv6Ab8VNAyfoCFgacRcsOXhtBnN+GcOBVv5VV1z0GI8ha3I8x4zRmCxBe
	nLRxj2gpygVH2u9lUoq4uFc9zAPqG7HYKDyk9KdTR7oq7zULB7aX8b1Dozdo4tZx5bfJ
	8Ztjv7kORifxSD/nQ7Vb2uwbftVboI//HRZ6PfUI/hnjCxRigOgJ6IMBgBvy7uSI37yu
	PaI9OYwLOjhHUBHhD4Ngg0C2nT2WOJG5w1jLfu4vf+E7KCBBm1NSwfGNi7+a6Gdmdkek
	M4Nw==
X-Gm-Message-State: AHPjjUg09JY8wLow0npO64Ys4q4OVLjuKgf/fsfb5P4ydVTrtf+u82I0
	BQPB2sSPnLBybY3f
X-Google-Smtp-Source: ADKCNb6IHLVQSHr2ma0yYf5mPleVDegpPVlAfjpFTan7ipfhS40CuxDUsMHOeQkoVhHdSoNF2Kgc9Q==
X-Received: by 10.80.144.102 with SMTP id z35mr24968769edz.302.1505641396201; 
	Sun, 17 Sep 2017 02:43:16 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58])
	by smtp.gmail.com with ESMTPSA id q5sm2525414edh.24.2017.09.17.02.43.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Sep 2017 02:43:15 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Sep 2017 11:42:56 +0200
Message-Id: <1505641376-16402-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-qt5] [PATCH] meta: drop a useless file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Sep 2017 09:43:16 -0000

From: Ming Liu <liu.ming50@gmail.com>

A useless file was added mistakenly by commit ec80b092:
[ qtbase: Add OE clang specific mkspecs ]

Drop it.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 0001-qtbase-Add-OE-clang-specific-mkspecs.patch | 178 ------------------------
 1 file changed, 178 deletions(-)
 delete mode 100644 0001-qtbase-Add-OE-clang-specific-mkspecs.patch

diff --git a/0001-qtbase-Add-OE-clang-specific-mkspecs.patch b/0001-qtbase-Add-OE-clang-specific-mkspecs.patch
deleted file mode 100644
index 99c5331..0000000
--- a/0001-qtbase-Add-OE-clang-specific-mkspecs.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From 75aeb71530c456b9800bcc83c104e3906e47e9e4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 3 Sep 2017 09:29:02 -0700
-Subject: [PATCH] qtbase: Add OE clang specific mkspecs
-
-We can not piggy back clang anymore on existing
-OE mkspecs since starting 5.9 the configure is
-asking compiler for include paths and it needs to
-know if platform is clang-linux or g++-linux
-
-Fixes:
-ERROR: failed to parse default search paths from compiler output
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- classes/qmake5_base.bbclass                        |  7 ++-
- recipes-qt/qt5/qtbase-native_git.bb                |  6 +-
- ...-Add-OE-specific-specs-for-clang-compiler.patch | 72 ++++++++++++++++++++++
- recipes-qt/qt5/qtbase_git.bb                       |  6 +-
- 4 files changed, 87 insertions(+), 4 deletions(-)
- create mode 100644 recipes-qt/qt5/qtbase/0010-Add-OE-specific-specs-for-clang-compiler.patch
-
-diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
-index a556f4f..8e1fe20 100644
---- a/classes/qmake5_base.bbclass
-+++ b/classes/qmake5_base.bbclass
-@@ -1,6 +1,9 @@
- # hardcode linux, because that's what 0001-Add-linux-oe-g-platform.patch adds
--OE_QMAKE_PLATFORM_NATIVE = "linux-oe-g++"
--OE_QMAKE_PLATFORM = "linux-oe-g++"
-+XPLATFORM_toolchain-clang = "linux-oe-clang"
-+XPLATFORM ?= "linux-oe-g++"
-+
-+OE_QMAKE_PLATFORM_NATIVE = "${XPLATFORM}"
-+OE_QMAKE_PLATFORM = "${XPLATFORM}"
- 
- # Add -d to show debug output from every qmake call, but it prints *a lot*, better to add it only to debugged recipe
- OE_QMAKE_DEBUG_OUTPUT ?= ""
-diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
-index 54a0b78..72b977d 100644
---- a/recipes-qt/qt5/qtbase-native_git.bb
-+++ b/recipes-qt/qt5/qtbase-native_git.bb
-@@ -38,10 +38,14 @@ SRC_URI += "\
- # 5.9.meta-qt5-native.2
- SRC_URI += " \
-     file://0009-Always-build-uic.patch \
-+    file://0010-Add-OE-specific-specs-for-clang-compiler.patch \
- "
- 
- CLEANBROKEN = "1"
- 
-+XPLATFORM_toolchain-clang = "linux-oe-clang"
-+XPLATFORM ?= "linux-oe-g++"
-+
- PACKAGECONFIG_CONFARGS = " \
-     -sysroot ${STAGING_DIR_NATIVE} \
-     -no-gcc-sysroot \
-@@ -79,7 +83,7 @@ PACKAGECONFIG_CONFARGS = " \
-     -nomake examples \
-     -nomake tests \
-     -no-rpath \
--    -platform linux-oe-g++ \
-+    -platform ${XPLATFORM} \
- "
- 
- # for qtbase configuration we need default settings
-diff --git a/recipes-qt/qt5/qtbase/0010-Add-OE-specific-specs-for-clang-compiler.patch b/recipes-qt/qt5/qtbase/0010-Add-OE-specific-specs-for-clang-compiler.patch
-new file mode 100644
-index 0000000..b019f67
---- /dev/null
-+++ b/recipes-qt/qt5/qtbase/0010-Add-OE-specific-specs-for-clang-compiler.patch
-@@ -0,0 +1,72 @@
-+From 3a46fb7b47d19c5261e1590f8d70fe41443def64 Mon Sep 17 00:00:00 2001
-+From: Khem Raj <raj.khem@gmail.com>
-+Date: Sun, 3 Sep 2017 09:11:44 -0700
-+Subject: [PATCH] Add OE specific specs for clang compiler
-+
-+Signed-off-by: Khem Raj <raj.khem@gmail.com>
-+---
-+ mkspecs/linux-oe-clang/qmake.conf      | 43 ++++++++++++++++++++++++++++++++++
-+ mkspecs/linux-oe-clang/qplatformdefs.h |  1 +
-+ 2 files changed, 44 insertions(+)
-+ create mode 100644 mkspecs/linux-oe-clang/qmake.conf
-+ create mode 100644 mkspecs/linux-oe-clang/qplatformdefs.h
-+
-+diff --git a/mkspecs/linux-oe-clang/qmake.conf b/mkspecs/linux-oe-clang/qmake.conf
-+new file mode 100644
-+index 0000000000..ffc9f051db
-+--- /dev/null
-++++ b/mkspecs/linux-oe-clang/qmake.conf
-+@@ -0,0 +1,43 @@
-++#
-++# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
-++#
-++
-++MAKEFILE_GENERATOR = UNIX
-++CONFIG += incremental
-++QMAKE_INCREMENTAL_STYLE = sublib
-++
-++include(../common/linux.conf)
-++
-++# QMAKE_<TOOL> (moc, uic, rcc) are gone, overwrite only ar and strip
-++QMAKE_AR              = $$(OE_QMAKE_AR) cqs
-++QMAKE_STRIP           = $$(OE_QMAKE_STRIP)
-++QMAKE_WAYLAND_SCANNER = $$(OE_QMAKE_WAYLAND_SCANNER)
-++
-++include(../common/gcc-base-unix.conf)
-++
-++# *FLAGS from gcc-base.conf
-++QMAKE_CFLAGS                += $$(OE_QMAKE_CFLAGS)
-++QMAKE_CXXFLAGS              += $$(OE_QMAKE_CXXFLAGS)
-++QMAKE_LFLAGS                += $$(OE_QMAKE_LDFLAGS)
-++
-++include(../common/clang.conf)
-++
-++# tc settings from g++-base.conf
-++QMAKE_COMPILER = $$(OE_QMAKE_COMPILER) clang
-++QMAKE_CC       = $$(OE_QMAKE_CC)
-++QMAKE_CXX      = $$(OE_QMAKE_CXX)
-++
-++QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $$(OE_QMAKE_CFLAGS)
-++
-++QMAKE_LINK         = $$(OE_QMAKE_LINK)
-++QMAKE_LINK_SHLIB   = $$(OE_QMAKE_LINK)
-++QMAKE_LINK_C       = $$(OE_QMAKE_LINK)
-++QMAKE_LINK_C_SHLIB = $$(OE_QMAKE_LINK)
-++
-++# for the SDK
-++isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $$(OE_QMAKE_QT_CONFIG)
-++
-++include(../oe-device-extra.pri)
-++
-++load(device_config)
-++load(qt_config)
-+diff --git a/mkspecs/linux-oe-clang/qplatformdefs.h b/mkspecs/linux-oe-clang/qplatformdefs.h
-+new file mode 100644
-+index 0000000000..880c927b21
-+--- /dev/null
-++++ b/mkspecs/linux-oe-clang/qplatformdefs.h
-+@@ -0,0 +1 @@
-++#include "../linux-clang/qplatformdefs.h"
-+-- 
-+2.14.1
-+
-diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
-index aaa59f3..25d99e8 100644
---- a/recipes-qt/qt5/qtbase_git.bb
-+++ b/recipes-qt/qt5/qtbase_git.bb
-@@ -26,6 +26,7 @@ SRC_URI += "\
-     file://0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
-     file://0007-Delete-qlonglong-and-qulonglong.patch \
-     file://0008-Replace-pthread_yield-with-sched_yield.patch \
-+    file://0010-Add-OE-specific-specs-for-clang-compiler.patch \
-     file://run-ptest \
- "
- 
-@@ -160,6 +161,9 @@ QT_CONFIG_FLAGS += " \
- # since we cannot set empty set filename to a not existent file
- deltask generate_qt_config_file
- 
-+XPLATFORM_toolchain-clang = "linux-oe-clang"
-+XPLATFORM ?= "linux-oe-g++"
-+
- do_configure() {
-     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory" during configuration
-     touch ${S}/mkspecs/oe-device-extra.pri
-@@ -188,7 +192,7 @@ do_configure() {
-         -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
-         -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
-         -platform ${OE_QMAKE_PLATFORM_NATIVE} \
--        -xplatform linux-oe-g++ \
-+        -xplatform ${XPLATFORM} \
-         ${QT_CONFIG_FLAGS}
- }
- 
--- 
-2.14.1
-
-- 
2.7.4


