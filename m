Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0E11977AB5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Sep 2017 18:10:47 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id r133so3178784pgr.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Sep 2017 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CtufEsEQE1fdPEF9hBzm/4tOJucC1clHlszNOJI5nLs=;
	b=khM9+vb6pNFGbtmVYv65r6mLqb6lgIlN/bZcNxIuMTIvhNBw7EWyTOeymctWvOMpBY
	1n3+XiDHQ2yLjSWI1YDhDTkNWKLGcfziW2Nk/kAMMPD7jGB7UUVaFfCrpEhU9zuXlLaO
	uqu5Bw1+Dm2E3oBulEk8ALkb2BUkmL2ExvOPYtQKpz5/ErUMofHmehkFCZ76scvEzDJK
	M3mIZbMGNepBCEoQGm+I79JJq/X7ImVhsfsWB2L2ewJRorCEWpAkutsZT5wh6DRB14mt
	2hi915PsoRJ7KNeXoU7J318ZXPDFy/Z+ieK8EQQytlqBJENPaSeDSvk3n7GX1dKho5Ye
	OxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CtufEsEQE1fdPEF9hBzm/4tOJucC1clHlszNOJI5nLs=;
	b=NOu3eNN+rk76QNwkFBWNtuWna80wdk3O+pwx9NWVNudzoX/YQwnlW6z3oEzyP8n8IS
	tArUbzv2BHpI/R01ftZQXZxAkQ3cklQZnVKn+6O507w/DowU1om433fIGo6DgE5MYKVg
	1Msa8xVW5bpgL9zE5mPXkvnwXzzKjjnj0n+rz4PTaVSBd2llIcjtSIXI6SNE9z8kVHoJ
	cSoJpik8EUfPk2eGxtntVpbYEAjod9bnnTh58DxI8VupbU0EUcbX0NKFDi2q33Jmtsml
	zex1+BpQS325y8WghlvWSs6rglrdZ0uHLGOGkb1PgRxWup9ewNdiZD7/ODtVIIPg8m5d
	LkCA==
X-Gm-Message-State: AHPjjUj2xvcXTzXRizFIXksShWLErEwJ4X/0tUbKdTH5JklP426FWdyH
	w/l7bhDSUWXawxgV
X-Google-Smtp-Source: ADKCNb6/BHHkaIT7i0yZvLgsf9lvNEt0NRVLUxgEZMJ08nHmX29kEP0lq6mz/3VeS6s0a99sVM8vNg==
X-Received: by 10.99.49.8 with SMTP id x8mr3913933pgx.385.1504462248914;
	Sun, 03 Sep 2017 11:10:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	g85sm8141483pfe.77.2017.09.03.11.10.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Sep 2017 11:10:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Sep 2017 11:10:34 -0700
Message-Id: <20170903181035.23138-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-qt5][PATCH 1/2] qtbase: Add OE clang specific mkspecs
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
X-List-Received-Date: Sun, 03 Sep 2017 18:10:48 -0000

We can not piggy back clang anymore on existing
OE mkspecs since starting 5.9 the configure is
asking compiler for include paths and it needs to
know if platform is clang-linux or g++-linux

Fixes:
ERROR: failed to parse default search paths from compiler output

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/qmake5_base.bbclass                        |  7 ++-
 recipes-qt/qt5/qtbase-native_git.bb                |  6 +-
 ...-Add-OE-specific-specs-for-clang-compiler.patch | 72 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  6 +-
 4 files changed, 87 insertions(+), 4 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase/0010-Add-OE-specific-specs-for-clang-compiler.patch

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index a556f4f..8e1fe20 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -1,6 +1,9 @@
 # hardcode linux, because that's what 0001-Add-linux-oe-g-platform.patch adds
-OE_QMAKE_PLATFORM_NATIVE = "linux-oe-g++"
-OE_QMAKE_PLATFORM = "linux-oe-g++"
+XPLATFORM_toolchain-clang = "linux-oe-clang"
+XPLATFORM ?= "linux-oe-g++"
+
+OE_QMAKE_PLATFORM_NATIVE = "${XPLATFORM}"
+OE_QMAKE_PLATFORM = "${XPLATFORM}"
 
 # Add -d to show debug output from every qmake call, but it prints *a lot*, better to add it only to debugged recipe
 OE_QMAKE_DEBUG_OUTPUT ?= ""
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 54a0b78..72b977d 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -38,10 +38,14 @@ SRC_URI += "\
 # 5.9.meta-qt5-native.2
 SRC_URI += " \
     file://0009-Always-build-uic.patch \
+    file://0010-Add-OE-specific-specs-for-clang-compiler.patch \
 "
 
 CLEANBROKEN = "1"
 
+XPLATFORM_toolchain-clang = "linux-oe-clang"
+XPLATFORM ?= "linux-oe-g++"
+
 PACKAGECONFIG_CONFARGS = " \
     -sysroot ${STAGING_DIR_NATIVE} \
     -no-gcc-sysroot \
@@ -79,7 +83,7 @@ PACKAGECONFIG_CONFARGS = " \
     -nomake examples \
     -nomake tests \
     -no-rpath \
-    -platform linux-oe-g++ \
+    -platform ${XPLATFORM} \
 "
 
 # for qtbase configuration we need default settings
diff --git a/recipes-qt/qt5/qtbase/0010-Add-OE-specific-specs-for-clang-compiler.patch b/recipes-qt/qt5/qtbase/0010-Add-OE-specific-specs-for-clang-compiler.patch
new file mode 100644
index 0000000..b019f67
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0010-Add-OE-specific-specs-for-clang-compiler.patch
@@ -0,0 +1,72 @@
+From 3a46fb7b47d19c5261e1590f8d70fe41443def64 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 3 Sep 2017 09:11:44 -0700
+Subject: [PATCH] Add OE specific specs for clang compiler
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mkspecs/linux-oe-clang/qmake.conf      | 43 ++++++++++++++++++++++++++++++++++
+ mkspecs/linux-oe-clang/qplatformdefs.h |  1 +
+ 2 files changed, 44 insertions(+)
+ create mode 100644 mkspecs/linux-oe-clang/qmake.conf
+ create mode 100644 mkspecs/linux-oe-clang/qplatformdefs.h
+
+diff --git a/mkspecs/linux-oe-clang/qmake.conf b/mkspecs/linux-oe-clang/qmake.conf
+new file mode 100644
+index 0000000000..ffc9f051db
+--- /dev/null
++++ b/mkspecs/linux-oe-clang/qmake.conf
+@@ -0,0 +1,43 @@
++#
++# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
++#
++
++MAKEFILE_GENERATOR = UNIX
++CONFIG += incremental
++QMAKE_INCREMENTAL_STYLE = sublib
++
++include(../common/linux.conf)
++
++# QMAKE_<TOOL> (moc, uic, rcc) are gone, overwrite only ar and strip
++QMAKE_AR              = $$(OE_QMAKE_AR) cqs
++QMAKE_STRIP           = $$(OE_QMAKE_STRIP)
++QMAKE_WAYLAND_SCANNER = $$(OE_QMAKE_WAYLAND_SCANNER)
++
++include(../common/gcc-base-unix.conf)
++
++# *FLAGS from gcc-base.conf
++QMAKE_CFLAGS                += $$(OE_QMAKE_CFLAGS)
++QMAKE_CXXFLAGS              += $$(OE_QMAKE_CXXFLAGS)
++QMAKE_LFLAGS                += $$(OE_QMAKE_LDFLAGS)
++
++include(../common/clang.conf)
++
++# tc settings from g++-base.conf
++QMAKE_COMPILER = $$(OE_QMAKE_COMPILER) clang
++QMAKE_CC       = $$(OE_QMAKE_CC)
++QMAKE_CXX      = $$(OE_QMAKE_CXX)
++
++QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $$(OE_QMAKE_CFLAGS)
++
++QMAKE_LINK         = $$(OE_QMAKE_LINK)
++QMAKE_LINK_SHLIB   = $$(OE_QMAKE_LINK)
++QMAKE_LINK_C       = $$(OE_QMAKE_LINK)
++QMAKE_LINK_C_SHLIB = $$(OE_QMAKE_LINK)
++
++# for the SDK
++isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $$(OE_QMAKE_QT_CONFIG)
++
++include(../oe-device-extra.pri)
++
++load(device_config)
++load(qt_config)
+diff --git a/mkspecs/linux-oe-clang/qplatformdefs.h b/mkspecs/linux-oe-clang/qplatformdefs.h
+new file mode 100644
+index 0000000000..880c927b21
+--- /dev/null
++++ b/mkspecs/linux-oe-clang/qplatformdefs.h
+@@ -0,0 +1 @@
++#include "../linux-clang/qplatformdefs.h"
+-- 
+2.14.1
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index aaa59f3..25d99e8 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -26,6 +26,7 @@ SRC_URI += "\
     file://0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
     file://0007-Delete-qlonglong-and-qulonglong.patch \
     file://0008-Replace-pthread_yield-with-sched_yield.patch \
+    file://0010-Add-OE-specific-specs-for-clang-compiler.patch \
     file://run-ptest \
 "
 
@@ -160,6 +161,9 @@ QT_CONFIG_FLAGS += " \
 # since we cannot set empty set filename to a not existent file
 deltask generate_qt_config_file
 
+XPLATFORM_toolchain-clang = "linux-oe-clang"
+XPLATFORM ?= "linux-oe-g++"
+
 do_configure() {
     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory" during configuration
     touch ${S}/mkspecs/oe-device-extra.pri
@@ -188,7 +192,7 @@ do_configure() {
         -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
         -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
         -platform ${OE_QMAKE_PLATFORM_NATIVE} \
-        -xplatform linux-oe-g++ \
+        -xplatform ${XPLATFORM} \
         ${QT_CONFIG_FLAGS}
 }
 
-- 
2.14.1


