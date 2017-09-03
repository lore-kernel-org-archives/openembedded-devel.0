Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5F43677AB5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Sep 2017 18:10:48 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id v22so3125364pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Sep 2017 11:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PohjMTmyb03JHKgRhnu/D7+QgCRc2SLTZ6L/HMBLBOw=;
	b=ePR+ryKxMvGmNuSM0MYjZ7Jh/Lj0udFbrmmKYedGGhCf9hmcIBCfQq9p0J1b12feol
	yBfamhIKQInSd6665wGaKZZso88AWvpZZbV4zHWA0JbZcXLkvF8F4edeWFaULZ4PAahD
	3Z9aZq14C1qx8W7xkW3be1pB4abhIZFst/m52cwjH4l9k+4Eiy47B37jCEXoj1Dym2pT
	tOgBNviYqwJaZB2DYkftyRj1/s9JVjkYgEJmqzgPTO36i4ZDf2Fh6EEX4vflfpPEtIBf
	cEFzsNBeFQAqu0u1GYGaCYfMna6YqbvXHn2vyJ5J7UhCRgeL5YLdKkrYI18XWIKQ/J05
	NsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PohjMTmyb03JHKgRhnu/D7+QgCRc2SLTZ6L/HMBLBOw=;
	b=PfQARjG0aPKCbv/CCqVV+Tfimq1ZNlP45OwBmudey26a8wqAYdu49Ldk1YlHdqunZt
	fWjM3GcQY1rXY/qIGiozwu2LCQUFTm3sXWejI66L82Cx9vM4/0O1R2bnMQ2XloHBrKs/
	d0vZUzL9SJoi525c2mT1uQHlkq+W5Pp2tf1xkmY+WWcLhgtYSo5emR/LqKA4NcFYbCrw
	2EZLL1tnHElyUMxgVTn2ZPJLqKF1cYLae8gU9YiXXGlvWcT25shLB41GqBvS9DXwCk4P
	CpwkS6LazteZFSL6RuZgc1XE2hdzVedfmhiFOsYqX5hiqe4uDesFAIfBqbB406FCesQq
	TejQ==
X-Gm-Message-State: AHPjjUiqg4eusexfyitavw0S3h0EFbZZcvTcNvr8EYCWRD7ybUR+0dPR
	mqeVa6zCVuywpdBC
X-Google-Smtp-Source: ADKCNb6YyeZ+eqVN2gSmelo9tMEWMNbZZjyxu/4zR3woVNMxqVGtu8XDcH1tCE7Az9DHb0IfpUZEjA==
X-Received: by 10.99.1.85 with SMTP id 82mr9307475pgb.392.1504462250013;
	Sun, 03 Sep 2017 11:10:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	g85sm8141483pfe.77.2017.09.03.11.10.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Sep 2017 11:10:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Sep 2017 11:10:35 -0700
Message-Id: <20170903181035.23138-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170903181035.23138-1-raj.khem@gmail.com>
References: <20170903181035.23138-1-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qtbase: Fix build with musl/clang
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
X-List-Received-Date: Sun, 03 Sep 2017 18:10:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 0001-qtbase-Add-OE-clang-specific-mkspecs.patch    | 178 +++++++++++++++++++++
 recipes-qt/qt5/qtbase-native_git.bb                |   2 +
 ...-Invert-conditional-for-defining-QT_SOCKL.patch |  35 ++++
 ..._qlocale-Enable-QT_USE_FENV-only-on-glibc.patch |  28 ++++
 recipes-qt/qt5/qtbase_git.bb                       |   2 +
 5 files changed, 245 insertions(+)
 create mode 100644 0001-qtbase-Add-OE-clang-specific-mkspecs.patch
 create mode 100644 recipes-qt/qt5/qtbase/0011-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
 create mode 100644 recipes-qt/qt5/qtbase/0012-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch

diff --git a/0001-qtbase-Add-OE-clang-specific-mkspecs.patch b/0001-qtbase-Add-OE-clang-specific-mkspecs.patch
new file mode 100644
index 0000000..99c5331
--- /dev/null
+++ b/0001-qtbase-Add-OE-clang-specific-mkspecs.patch
@@ -0,0 +1,178 @@
+From 75aeb71530c456b9800bcc83c104e3906e47e9e4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 3 Sep 2017 09:29:02 -0700
+Subject: [PATCH] qtbase: Add OE clang specific mkspecs
+
+We can not piggy back clang anymore on existing
+OE mkspecs since starting 5.9 the configure is
+asking compiler for include paths and it needs to
+know if platform is clang-linux or g++-linux
+
+Fixes:
+ERROR: failed to parse default search paths from compiler output
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ classes/qmake5_base.bbclass                        |  7 ++-
+ recipes-qt/qt5/qtbase-native_git.bb                |  6 +-
+ ...-Add-OE-specific-specs-for-clang-compiler.patch | 72 ++++++++++++++++++++++
+ recipes-qt/qt5/qtbase_git.bb                       |  6 +-
+ 4 files changed, 87 insertions(+), 4 deletions(-)
+ create mode 100644 recipes-qt/qt5/qtbase/0010-Add-OE-specific-specs-for-clang-compiler.patch
+
+diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
+index a556f4f..8e1fe20 100644
+--- a/classes/qmake5_base.bbclass
++++ b/classes/qmake5_base.bbclass
+@@ -1,6 +1,9 @@
+ # hardcode linux, because that's what 0001-Add-linux-oe-g-platform.patch adds
+-OE_QMAKE_PLATFORM_NATIVE = "linux-oe-g++"
+-OE_QMAKE_PLATFORM = "linux-oe-g++"
++XPLATFORM_toolchain-clang = "linux-oe-clang"
++XPLATFORM ?= "linux-oe-g++"
++
++OE_QMAKE_PLATFORM_NATIVE = "${XPLATFORM}"
++OE_QMAKE_PLATFORM = "${XPLATFORM}"
+ 
+ # Add -d to show debug output from every qmake call, but it prints *a lot*, better to add it only to debugged recipe
+ OE_QMAKE_DEBUG_OUTPUT ?= ""
+diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
+index 54a0b78..72b977d 100644
+--- a/recipes-qt/qt5/qtbase-native_git.bb
++++ b/recipes-qt/qt5/qtbase-native_git.bb
+@@ -38,10 +38,14 @@ SRC_URI += "\
+ # 5.9.meta-qt5-native.2
+ SRC_URI += " \
+     file://0009-Always-build-uic.patch \
++    file://0010-Add-OE-specific-specs-for-clang-compiler.patch \
+ "
+ 
+ CLEANBROKEN = "1"
+ 
++XPLATFORM_toolchain-clang = "linux-oe-clang"
++XPLATFORM ?= "linux-oe-g++"
++
+ PACKAGECONFIG_CONFARGS = " \
+     -sysroot ${STAGING_DIR_NATIVE} \
+     -no-gcc-sysroot \
+@@ -79,7 +83,7 @@ PACKAGECONFIG_CONFARGS = " \
+     -nomake examples \
+     -nomake tests \
+     -no-rpath \
+-    -platform linux-oe-g++ \
++    -platform ${XPLATFORM} \
+ "
+ 
+ # for qtbase configuration we need default settings
+diff --git a/recipes-qt/qt5/qtbase/0010-Add-OE-specific-specs-for-clang-compiler.patch b/recipes-qt/qt5/qtbase/0010-Add-OE-specific-specs-for-clang-compiler.patch
+new file mode 100644
+index 0000000..b019f67
+--- /dev/null
++++ b/recipes-qt/qt5/qtbase/0010-Add-OE-specific-specs-for-clang-compiler.patch
+@@ -0,0 +1,72 @@
++From 3a46fb7b47d19c5261e1590f8d70fe41443def64 Mon Sep 17 00:00:00 2001
++From: Khem Raj <raj.khem@gmail.com>
++Date: Sun, 3 Sep 2017 09:11:44 -0700
++Subject: [PATCH] Add OE specific specs for clang compiler
++
++Signed-off-by: Khem Raj <raj.khem@gmail.com>
++---
++ mkspecs/linux-oe-clang/qmake.conf      | 43 ++++++++++++++++++++++++++++++++++
++ mkspecs/linux-oe-clang/qplatformdefs.h |  1 +
++ 2 files changed, 44 insertions(+)
++ create mode 100644 mkspecs/linux-oe-clang/qmake.conf
++ create mode 100644 mkspecs/linux-oe-clang/qplatformdefs.h
++
++diff --git a/mkspecs/linux-oe-clang/qmake.conf b/mkspecs/linux-oe-clang/qmake.conf
++new file mode 100644
++index 0000000000..ffc9f051db
++--- /dev/null
+++++ b/mkspecs/linux-oe-clang/qmake.conf
++@@ -0,0 +1,43 @@
+++#
+++# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
+++#
+++
+++MAKEFILE_GENERATOR = UNIX
+++CONFIG += incremental
+++QMAKE_INCREMENTAL_STYLE = sublib
+++
+++include(../common/linux.conf)
+++
+++# QMAKE_<TOOL> (moc, uic, rcc) are gone, overwrite only ar and strip
+++QMAKE_AR              = $$(OE_QMAKE_AR) cqs
+++QMAKE_STRIP           = $$(OE_QMAKE_STRIP)
+++QMAKE_WAYLAND_SCANNER = $$(OE_QMAKE_WAYLAND_SCANNER)
+++
+++include(../common/gcc-base-unix.conf)
+++
+++# *FLAGS from gcc-base.conf
+++QMAKE_CFLAGS                += $$(OE_QMAKE_CFLAGS)
+++QMAKE_CXXFLAGS              += $$(OE_QMAKE_CXXFLAGS)
+++QMAKE_LFLAGS                += $$(OE_QMAKE_LDFLAGS)
+++
+++include(../common/clang.conf)
+++
+++# tc settings from g++-base.conf
+++QMAKE_COMPILER = $$(OE_QMAKE_COMPILER) clang
+++QMAKE_CC       = $$(OE_QMAKE_CC)
+++QMAKE_CXX      = $$(OE_QMAKE_CXX)
+++
+++QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $$(OE_QMAKE_CFLAGS)
+++
+++QMAKE_LINK         = $$(OE_QMAKE_LINK)
+++QMAKE_LINK_SHLIB   = $$(OE_QMAKE_LINK)
+++QMAKE_LINK_C       = $$(OE_QMAKE_LINK)
+++QMAKE_LINK_C_SHLIB = $$(OE_QMAKE_LINK)
+++
+++# for the SDK
+++isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $$(OE_QMAKE_QT_CONFIG)
+++
+++include(../oe-device-extra.pri)
+++
+++load(device_config)
+++load(qt_config)
++diff --git a/mkspecs/linux-oe-clang/qplatformdefs.h b/mkspecs/linux-oe-clang/qplatformdefs.h
++new file mode 100644
++index 0000000000..880c927b21
++--- /dev/null
+++++ b/mkspecs/linux-oe-clang/qplatformdefs.h
++@@ -0,0 +1 @@
+++#include "../linux-clang/qplatformdefs.h"
++-- 
++2.14.1
++
+diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
+index aaa59f3..25d99e8 100644
+--- a/recipes-qt/qt5/qtbase_git.bb
++++ b/recipes-qt/qt5/qtbase_git.bb
+@@ -26,6 +26,7 @@ SRC_URI += "\
+     file://0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+     file://0007-Delete-qlonglong-and-qulonglong.patch \
+     file://0008-Replace-pthread_yield-with-sched_yield.patch \
++    file://0010-Add-OE-specific-specs-for-clang-compiler.patch \
+     file://run-ptest \
+ "
+ 
+@@ -160,6 +161,9 @@ QT_CONFIG_FLAGS += " \
+ # since we cannot set empty set filename to a not existent file
+ deltask generate_qt_config_file
+ 
++XPLATFORM_toolchain-clang = "linux-oe-clang"
++XPLATFORM ?= "linux-oe-g++"
++
+ do_configure() {
+     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory" during configuration
+     touch ${S}/mkspecs/oe-device-extra.pri
+@@ -188,7 +192,7 @@ do_configure() {
+         -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
+         -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
+         -platform ${OE_QMAKE_PLATFORM_NATIVE} \
+-        -xplatform linux-oe-g++ \
++        -xplatform ${XPLATFORM} \
+         ${QT_CONFIG_FLAGS}
+ }
+ 
+-- 
+2.14.1
+
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 72b977d..5137dee 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -39,6 +39,8 @@ SRC_URI += "\
 SRC_URI += " \
     file://0009-Always-build-uic.patch \
     file://0010-Add-OE-specific-specs-for-clang-compiler.patch \
+    file://0011-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
+    file://0012-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
 "
 
 CLEANBROKEN = "1"
diff --git a/recipes-qt/qt5/qtbase/0011-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch b/recipes-qt/qt5/qtbase/0011-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
new file mode 100644
index 0000000..0c7fb87
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0011-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
@@ -0,0 +1,35 @@
+From 8394ad48f454aa292e4da57b3b75a3701dadcf96 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 3 Sep 2017 09:44:48 -0700
+Subject: [PATCH] linux-clang: Invert conditional for defining QT_SOCKLEN_T
+
+This helps to make sure that QT_SOCKLEN_T is defined to be 'int'
+only when its glibc < 2 and not for other libcswhich may define
+it as per standards but are not glibc, e.g. musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mkspecs/linux-clang/qplatformdefs.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mkspecs/linux-clang/qplatformdefs.h b/mkspecs/linux-clang/qplatformdefs.h
+index d29225f12f..a0cdb57343 100644
+--- a/mkspecs/linux-clang/qplatformdefs.h
++++ b/mkspecs/linux-clang/qplatformdefs.h
+@@ -84,10 +84,10 @@
+ 
+ #undef QT_SOCKLEN_T
+ 
+-#if defined(__GLIBC__) && (__GLIBC__ >= 2)
+-#define QT_SOCKLEN_T            socklen_t
+-#else
++#if defined(__GLIBC__) && (__GLIBC__ < 2)
+ #define QT_SOCKLEN_T            int
++#else
++#define QT_SOCKLEN_T            socklen_t
+ #endif
+ 
+ #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
+-- 
+2.14.1
+
diff --git a/recipes-qt/qt5/qtbase/0012-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch b/recipes-qt/qt5/qtbase/0012-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
new file mode 100644
index 0000000..a177625
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0012-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
@@ -0,0 +1,28 @@
+From 30076434a9f651614db8c3e5db32d4acae54c600 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 3 Sep 2017 10:11:50 -0700
+Subject: [PATCH] tst_qlocale: Enable QT_USE_FENV only on glibc
+
+musl does not have feenableexcept function
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/auto/corelib/tools/qlocale/tst_qlocale.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp b/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
+index 10d78b1f2f..a59f358f80 100644
+--- a/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
++++ b/tests/auto/corelib/tools/qlocale/tst_qlocale.cpp
+@@ -46,7 +46,7 @@
+ #include <private/qlocale_tools_p.h>
+ #include <qnumeric.h>
+ 
+-#if defined(Q_OS_LINUX) && !defined(__UCLIBC__)
++#if defined(Q_OS_LINUX) && defined(__GLIBC__)
+ #    define QT_USE_FENV
+ #endif
+ 
+-- 
+2.14.1
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 25d99e8..dce2d77 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -27,6 +27,8 @@ SRC_URI += "\
     file://0007-Delete-qlonglong-and-qulonglong.patch \
     file://0008-Replace-pthread_yield-with-sched_yield.patch \
     file://0010-Add-OE-specific-specs-for-clang-compiler.patch \
+    file://0011-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
+    file://0012-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
     file://run-ptest \
 "
 
-- 
2.14.1


