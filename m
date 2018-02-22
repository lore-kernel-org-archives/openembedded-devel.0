Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A1A0C78682
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 14:46:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t74so4407627wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 06:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kz4cYcG6+MZ7fBEVat9wrwX5jlSDBJs60KpIM2pG7+o=;
	b=SzLv7KxfsQKv9++iiVmobUhmE05+Vr2p5EB9L3P9MhbntxNkUIQ+lGYMZzmLaZQTP5
	zSHpEyde5hPs22vISNhTamBDBw2/M6o2TiooF7v6JNKZPWtlOpGpPHNQsrBZbBidxCud
	qfaufb0FEDnNCR23rDW1dg9Zy9fscqMJBEc9et9rgs7oQJnGUoPjt9hXltSRqPVe6b7X
	72MX2fHQIyfPsw10okRef/5+ZbkYySS5ffVjwgl85Ui5Vv44BVj7Av6+fyolZLNbdyPV
	HuHqp9LwBPrCDH3GiBKjyU8MzwaYR/Ho/n/W0zTqj1Cq58oNRJL2jvY/FQXbYujiaoZ4
	7tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kz4cYcG6+MZ7fBEVat9wrwX5jlSDBJs60KpIM2pG7+o=;
	b=U/n3KjMxy1dFzRfNGUSHVLcwBsKVwlE/f8zvURRmJW3hBte4UEytQNBPcFuH76eANT
	io/I/B5wh4ctjEBRvshSUmGrKGgbtTd/KUGtZGAxoY0OKjBOdAM+Acm4Hgncv+1iClQp
	5t5ogh561LfrXDNmHWSTa5pQluyNFtmztOpXKo/eYt6bMflUL84kAIqJUCxWNH954SGv
	8ZhLX2PMkqWa9XCQB4ykoYMfBdc+rq0Bi+iTwOrXCXRkxtWB0dIeeSSYMwNRao1FzAx9
	CV4jmiWv53Gx8Uk4VzFPZy72cNkAG55ilBknxCnBw5JcoiK6m6a0adldUxU6OsD3vykq
	cEgA==
X-Gm-Message-State: APf1xPBcjETEbakhtXvp4yq3eML6Pb+iL9oyPD4f8+D/HXoSbAK+vwLi
	P+tP7asvl5/Yi91hfb5/yrCb6Q==
X-Google-Smtp-Source: AH8x224y/qq2sxX12CDMvdkLFqwMWQcjcie/VJ0cCgrO6XNsh1bElew5V72qA48dJPqvgphO1LuzTg==
X-Received: by 10.28.234.8 with SMTP id i8mr5674398wmh.44.1519310811949;
	Thu, 22 Feb 2018 06:46:51 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id k11sm299692wre.81.2018.02.22.06.46.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 06:46:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Feb 2018 14:46:42 +0000
Message-Id: <20180222144642.24589-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-qt5][PATCH] qt5: refresh patches from meta-qt5/qt* repos
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
X-List-Received-Date: Thu, 22 Feb 2018 14:46:53 -0000

* apply:
  0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
  also for nativesdk-qtbase as the comment says
* drop unused:
  0001-Add-missing-include-for-struct-timeval.patch
  which wasn't removed in 5.10.1 upgrade

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  7 +++---
 .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   |  2 +-
 ...2-Fix-BlenderDNA-for-clang-cross-compiler.patch |  2 +-
 recipes-qt/qt5/qt3d_git.bb                         |  2 +-
 recipes-qt/qt5/qtbase-native_git.bb                | 10 ++++-----
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  2 +-
 ...make-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch |  2 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  2 +-
 ...ump-path-length-from-256-to-512-character.patch |  4 ++--
 ...-unknown-features-instead-of-erroring-out.patch |  6 +++---
 ...-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch |  2 +-
 .../0007-Delete-qlonglong-and-qulonglong.patch     |  2 +-
 ...08-Replace-pthread_yield-with-sched_yield.patch |  6 +++---
 ...-Add-OE-specific-specs-for-clang-compiler.patch |  2 +-
 ...-Invert-conditional-for-defining-QT_SOCKL.patch |  2 +-
 ..._qlocale-Enable-QT_USE_FENV-only-on-glibc.patch |  2 +-
 ...on-gcc-base.conf-Use-I-instead-of-isyste.patch} |  7 ++----
 ...atch => 0013-Always-build-uic-and-qvkgen.patch} |  6 +++---
 ...=> 0014-Bootstrap-without-linkat-feature.patch} |  2 +-
 recipes-qt/qt5/qtbase_git.bb                       |  4 ++--
 ...tmultimedia-fix-a-conflicting-declaration.patch |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 .../0001-Allow-a-tools-only-build.patch            |  2 +-
 recipes-qt/qt5/qtremoteobjects_git.bb              |  2 +-
 ...Use-external-host-bin-path-for-cmake-file.patch |  2 +-
 recipes-qt/qt5/qtscxml_git.bb                      |  2 +-
 ...01-Add-missing-include-for-struct-timeval.patch | 25 ----------------------
 .../0001-add-noqtwebkit-configuration.patch        |  2 +-
 ...ols-cmake-allow-overriding-the-location-f.patch |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 .../0001-include-sys-time.h-for-timeval.patch      |  2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |  2 +-
 .../0001-fix-build-without-xkbcommon-evdev.patch   |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 ...quickwebengineview_p_p.h-add-include-QCol.patch |  4 ++--
 ...romium-Force-host-toolchain-configuration.patch |  2 +-
 ...-dependency-to-QCoreApplication-translate.patch |  2 +-
 ...um-workaround-for-too-long-.rps-file-name.patch |  2 +-
 .../0003-Force-host-toolchain-configuration.patch  |  4 ++--
 ...sl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch |  2 +-
 ...sl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch |  2 +-
 ...use-pvalloc-as-it-s-not-available-on-musl.patch |  2 +-
 ...-chromium-musl-include-fcntl.h-for-loff_t.patch |  2 +-
 .../0005-musl-link-against-libexecinfo.patch       |  6 +++---
 ...sl-use-off64_t-instead-of-the-internal-__.patch |  2 +-
 ...ium-musl-linux-glibc-make-the-distinction.patch |  2 +-
 ...sl-allocator-Do-not-include-glibc_weak_sy.patch |  2 +-
 ...sl-Use-correct-member-name-__si_fields-fr.patch |  2 +-
 ...hromium-musl-Match-syscalls-to-match-musl.patch |  2 +-
 ...sl-Define-res_ninit-and-res_nclose-for-no.patch |  2 +-
 ...hromium-musl-Do-not-define-__sbrk-on-musl.patch |  2 +-
 ...um-musl-Adjust-default-pthread-stack-size.patch |  2 +-
 ...sl-include-asm-generic-ioctl.h-for-TCGETS.patch |  2 +-
 ...sl-tcmalloc-Use-off64_t-insread-of-__off6.patch |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |  4 ++--
 55 files changed, 75 insertions(+), 102 deletions(-)
 rename recipes-qt/qt5/qtbase/{0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch => 0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch} (91%)
 rename recipes-qt/qt5/qtbase/{0012-Always-build-uic-and-qvkgen.patch => 0013-Always-build-uic-and-qvkgen.patch} (84%)
 rename recipes-qt/qt5/qtbase/{0013-Bootstrap-without-linkat-feature.patch => 0014-Bootstrap-without-linkat-feature.patch} (92%)
 delete mode 100644 recipes-qt/qt5/qtserialbus/0001-Add-missing-include-for-struct-timeval.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index fb2f76e..efcb82c 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -26,7 +26,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.10-shared
-# 5.10.meta-qt5-shared.1
+# 5.10.meta-qt5-shared.2
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -39,13 +39,14 @@ SRC_URI += "\
     file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
     file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
     file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
+    file://0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.10-native
-# 5.10.meta-qt5-native.1
+# 5.10.meta-qt5-native.2
 SRC_URI += " \
-    file://0012-Always-build-uic-and-qvkgen.patch \
+    file://0013-Always-build-uic-and-qvkgen.patch \
 "
 
 # CMake's toolchain configuration of nativesdk-qtbase
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index 40a2f5f..66c8017 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 0ed3e6bbbb83bb7325bddb7d088ef36224af3680 Mon Sep 17 00:00:00 2001
+From 05562960b7a3ed7753c9a39a7032fea873fc4098 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
diff --git a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
index dc338b6..3357fa3 100644
--- a/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
+++ b/recipes-qt/qt5/qt3d/0002-Fix-BlenderDNA-for-clang-cross-compiler.patch
@@ -1,4 +1,4 @@
-From 2dd0f90d77969aa8c6a64bf4002355877f2fcbac Mon Sep 17 00:00:00 2001
+From fc23039612ab9aed4f994b4390016e71ceee8165 Mon Sep 17 00:00:00 2001
 From: Kim Kulling <kim.kulling@googlemail.com>
 Date: Mon, 7 Nov 2016 17:19:49 +0100
 Subject: [PATCH] Fix BlenderDNA for clang cross compiler.
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 4dd8aee..dbd1b27 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -12,7 +12,7 @@ DEPENDS += "qtbase"
 DEPENDS_class-target += "qtdeclarative qt3d-native"
 
 # Patches from https://github.com/meta-qt5/qt3d/commits/b5.10
-# 5.10.meta-qt5.1
+# 5.10.meta-qt5.2
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
     file://0002-Fix-BlenderDNA-for-clang-cross-compiler.patch \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 5fa24d3..36eeae8 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -21,7 +21,7 @@ require qt5-git.inc
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.10-shared
-# 5.10.meta-qt5-shared.1
+# 5.10.meta-qt5-shared.2
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -34,19 +34,19 @@ SRC_URI += "\
     file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
     file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
     file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
-    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
+    file://0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.10-native
-# 5.10.meta-qt5-native.1
+# 5.10.meta-qt5-native.2
 SRC_URI += " \
-    file://0012-Always-build-uic-and-qvkgen.patch \
+    file://0013-Always-build-uic-and-qvkgen.patch \
 "
 
 # only for qtbase-native
 SRC_URI += " \
-    file://0013-Bootstrap-without-linkat-feature.patch \
+    file://0014-Bootstrap-without-linkat-feature.patch \
 "
 
 CLEANBROKEN = "1"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index f10afa3..07fc2f7 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 92c19451f9ce3f16a8c4524446cc9d07c4056406 Mon Sep 17 00:00:00 2001
+From 1ed7a2e9a883fe1240d89b7b70fb0f296bb2b54f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH] Add linux-oe-g++ platform
diff --git a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
index 7ec35cf..fa59883 100644
--- a/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
+++ b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
@@ -1,4 +1,4 @@
-From 48a86543e8069c6dcb37cea1e49d621da1d39150 Mon Sep 17 00:00:00 2001
+From c7dd4e5de1fac8c35df79a86418b6cd552024bd0 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
diff --git a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index c3d404d..cc0a330 100644
--- a/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From d9134737f9bd07f09df6293e9a8bcd5e09d05764 Mon Sep 17 00:00:00 2001
+From f1d359e60e76867cee1df636c5c834fe829f5316 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
diff --git a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
index 1a95080..5a3dfea 100644
--- a/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0004-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From 403b891b3f1ef3e9c92a88856a46f6237065c8de Mon Sep 17 00:00:00 2001
+From cb813ec552f965208ecfc9750a0fbf10841322fb Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH] configure: bump path length from 256 to 512 characters
@@ -15,7 +15,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.pri b/configure.pri
-index 83c0dee..d60ba84 100644
+index ea48255..0699701 100644
 --- a/configure.pri
 +++ b/configure.pri
 @@ -796,10 +796,10 @@ defineTest(qtConfOutput_preparePaths) {
diff --git a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
index cf239a2..2e261b8 100644
--- a/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
+++ b/recipes-qt/qt5/qtbase/0005-Disable-all-unknown-features-instead-of-erroring-out.patch
@@ -1,4 +1,4 @@
-From 642496d2ecd9b322c5b2e68ba9d9190c999d1d56 Mon Sep 17 00:00:00 2001
+From 6cd8e808e0eb8fa26976da66dd3dfdd58c1d026a Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Mon, 24 Oct 2016 09:45:18 +0300
 Subject: [PATCH] Disable all unknown features instead of erroring out
@@ -10,10 +10,10 @@ Change-Id: Ib884fe33cac74439f9592b145937f6b75ced8447
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_configure.prf b/mkspecs/features/qt_configure.prf
-index 1ba9676..5b5bcdf 100644
+index d5dcda2..501151d 100644
 --- a/mkspecs/features/qt_configure.prf
 +++ b/mkspecs/features/qt_configure.prf
-@@ -1238,7 +1238,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
+@@ -1251,7 +1251,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
                      error("Expression '$$1' is accessing field '$$var' of non-local feature $${feature}.")
                  return($$result)
              }
diff --git a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
index c86a8f3..cf1a716 100644
--- a/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
+++ b/recipes-qt/qt5/qtbase/0006-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
@@ -1,4 +1,4 @@
-From 124a1ff230304dd89baeacb33a6f4794d2006b2a Mon Sep 17 00:00:00 2001
+From e3fe48be51aa67227ac1b34c01e4c913d82866c2 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Wed, 11 May 2016 15:20:41 +0200
 Subject: [PATCH] Pretend Qt5 wasn't found if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
diff --git a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
index 03500db..fd9a9e5 100644
--- a/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
+++ b/recipes-qt/qt5/qtbase/0007-Delete-qlonglong-and-qulonglong.patch
@@ -1,4 +1,4 @@
-From ebd2e15f86d48924dc1b74960345bd85834e5a39 Mon Sep 17 00:00:00 2001
+From efaae3535a1ac006ec1b3003258b83d905265fd3 Mon Sep 17 00:00:00 2001
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Date: Wed, 7 Jun 2017 21:00:49 +0900
 Subject: [PATCH] Delete qlonglong and qulonglong
diff --git a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
index cda88de..81269d2 100644
--- a/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
+++ b/recipes-qt/qt5/qtbase/0008-Replace-pthread_yield-with-sched_yield.patch
@@ -1,4 +1,4 @@
-From 25717f64a1cc8ec236372230d65895f21f3301a8 Mon Sep 17 00:00:00 2001
+From d79fecb4e8d2040efdc295d06c5e24bdf3cf6b60 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 27 Jul 2017 08:02:51 -0700
 Subject: [PATCH] Replace pthread_yield with sched_yield
@@ -36,7 +36,7 @@ index 076610a..cb8431f 100644
              QMetaType info(tp);
              if (!info.isValid()) {
 diff --git a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
-index d7c8c8c..d4a2407 100644
+index e45eda2..e64f329 100644
 --- a/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
 +++ b/tests/auto/network/socket/qtcpsocket/tst_qtcpsocket.cpp
 @@ -78,6 +78,7 @@
@@ -47,7 +47,7 @@ index d7c8c8c..d4a2407 100644
  #endif
  
  #include "private/qhostinfo_p.h"
-@@ -2129,8 +2130,8 @@ public slots:
+@@ -2136,8 +2137,8 @@ public slots:
  
  #if defined(Q_OS_MAC)
          pthread_yield_np();
diff --git a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
index 324cf1e..c210d64 100644
--- a/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
+++ b/recipes-qt/qt5/qtbase/0009-Add-OE-specific-specs-for-clang-compiler.patch
@@ -1,4 +1,4 @@
-From 3be18ebcfc3fa18755bad83664b3cff7482e0fea Mon Sep 17 00:00:00 2001
+From aaeadb4326f1f9df7bbafa0b9fa6937504a1c035 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 09:11:44 -0700
 Subject: [PATCH] Add OE specific specs for clang compiler
diff --git a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
index 9b6d5b0..5fed2ff 100644
--- a/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
+++ b/recipes-qt/qt5/qtbase/0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch
@@ -1,4 +1,4 @@
-From acc6c1d784aa7fe412cb175609e4286941d4bb55 Mon Sep 17 00:00:00 2001
+From 7c7545fc64e78b2a4a411aa392df6f424ee27c5a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 09:44:48 -0700
 Subject: [PATCH] linux-clang: Invert conditional for defining QT_SOCKLEN_T
diff --git a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
index b5323ee..a0aaa52 100644
--- a/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
+++ b/recipes-qt/qt5/qtbase/0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch
@@ -1,4 +1,4 @@
-From 4ea227cda2a18b291b5da374600eb912959691e8 Mon Sep 17 00:00:00 2001
+From ba70f3ca46d921c20bebb5cb9d4b41e64bd02d8b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Sep 2017 10:11:50 -0700
 Subject: [PATCH] tst_qlocale: Enable QT_USE_FENV only on glibc
diff --git a/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch b/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
similarity index 91%
rename from recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
rename to recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
index 44e9009..fe1fcf5 100644
--- a/recipes-qt/qt5/qtbase/0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
+++ b/recipes-qt/qt5/qtbase/0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch
@@ -1,4 +1,4 @@
-From 61c858474804fd772d612e6c5b4bb6df261d521a Mon Sep 17 00:00:00 2001
+From 81fc64f7f3a8b0554fd8d1b96b113bc04b5f0b5c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 14 Feb 2018 17:08:43 -0800
 Subject: [PATCH] mkspecs/common/gcc-base.conf: Use -I instead of -isystem
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/mkspecs/common/gcc-base.conf b/mkspecs/common/gcc-base.conf
-index 234f71d495..ee3da023e6 100644
+index 234f71d..ee3da02 100644
 --- a/mkspecs/common/gcc-base.conf
 +++ b/mkspecs/common/gcc-base.conf
 @@ -46,7 +46,7 @@ QMAKE_CFLAGS_DEBUG         += -g
@@ -31,6 +31,3 @@ index 234f71d495..ee3da023e6 100644
  QMAKE_CFLAGS_YACC          += -Wno-unused -Wno-parentheses
  QMAKE_CFLAGS_HIDESYMS      += -fvisibility=hidden
  QMAKE_CFLAGS_EXCEPTIONS_OFF += -fno-exceptions
--- 
-2.16.1
-
diff --git a/recipes-qt/qt5/qtbase/0012-Always-build-uic-and-qvkgen.patch b/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch
similarity index 84%
rename from recipes-qt/qt5/qtbase/0012-Always-build-uic-and-qvkgen.patch
rename to recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch
index e63f61d..3d40515 100644
--- a/recipes-qt/qt5/qtbase/0012-Always-build-uic-and-qvkgen.patch
+++ b/recipes-qt/qt5/qtbase/0013-Always-build-uic-and-qvkgen.patch
@@ -1,4 +1,4 @@
-From da00a0790c28615ba6b7f8e0e9d62d1ae6dbdeba Mon Sep 17 00:00:00 2001
+From 2ea3a1612452f1dc9c2febb4ae610194f67e39d6 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH] Always build uic and qvkgen
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index a2064b1..9fae335 100644
+index a73729a..c7668b5 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -211,7 +211,7 @@ qtConfig(gui) {
+@@ -213,7 +213,7 @@ qtConfig(gui) {
          }
      }
  }
diff --git a/recipes-qt/qt5/qtbase/0013-Bootstrap-without-linkat-feature.patch b/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch
similarity index 92%
rename from recipes-qt/qt5/qtbase/0013-Bootstrap-without-linkat-feature.patch
rename to recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch
index f01b283..c733c15 100644
--- a/recipes-qt/qt5/qtbase/0013-Bootstrap-without-linkat-feature.patch
+++ b/recipes-qt/qt5/qtbase/0014-Bootstrap-without-linkat-feature.patch
@@ -1,4 +1,4 @@
-From 91aabedce5859fed0c6e3efa4901ccac2231fb05 Mon Sep 17 00:00:00 2001
+From 77365eda4dd1c4c26803b3f0d1f411b7416ad531 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Fri, 24 Nov 2017 15:16:31 +0200
 Subject: [PATCH] Bootstrap without linkat feature
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index eae3597..6144c14 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = " \
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
 # Patches from https://github.com/meta-qt5/qtbase/commits/b5.10-shared
-# 5.10.meta-qt5-shared.1
+# 5.10.meta-qt5-shared.2
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
     file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
@@ -30,7 +30,7 @@ SRC_URI += "\
     file://0009-Add-OE-specific-specs-for-clang-compiler.patch \
     file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
     file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
-    file://0014-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
+    file://0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
 "
 
 # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
diff --git a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
index 2022d57..4fb0f72 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-qtmultimedia-fix-a-conflicting-declaration.patch
@@ -1,4 +1,4 @@
-From 04d1a3141dd001ca66b233b5faaa8d0c99bf5207 Mon Sep 17 00:00:00 2001
+From ec1740a7bce48435e65ede530e0b96593ac619ea Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Thu, 8 Sep 2016 12:18:13 +0800
 Subject: [PATCH] qtmultimedia: fix a conflicting declaration
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 1d4527d..2cb1bd5 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -26,7 +26,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 EXTRA_QMAKEVARS_CONFIGURE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', '-no-gstreamer', d)}"
 
 # Patches from https://github.com/meta-qt5/qtmultimedia/commits/b5.10
-# 5.10.meta-qt5.1
+# 5.10.meta-qt5.2
 SRC_URI += "\
     file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
 "
diff --git a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
index 720693c..19b526c 100644
--- a/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qtremoteobjects/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From a309565af88e0150dd0fa1c13f494a2b6af24aa1 Mon Sep 17 00:00:00 2001
+From 6235a3fdd0807205c818d70582033970ee008013 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 7 Jun 2017 15:17:12 +0300
 Subject: [PATCH] Allow a tools-only build
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
index 3f3275a..e70579a 100644
--- a/recipes-qt/qt5/qtremoteobjects_git.bb
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -12,7 +12,7 @@ require qt5-git.inc
 DEPENDS += "qtbase qtdeclarative qtremoteobjects-native"
 
 # Patches from https://github.com/meta-qt5/qtremoteobjects/commits/b5.10
-# 5.10.meta-qt5.1
+# 5.10.meta-qt5.2
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
 "
diff --git a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
index e0ba291..e734cf3 100644
--- a/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
+++ b/recipes-qt/qt5/qtscxml/0001-Use-external-host-bin-path-for-cmake-file.patch
@@ -1,4 +1,4 @@
-From 7b7bb9057d701c0e75474f9ed99a1df9c2552733 Mon Sep 17 00:00:00 2001
+From f83817b29477f33ee3b4abf8468a7b01bb347d2b Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Tue, 10 Jan 2017 15:28:26 +0200
 Subject: [PATCH] Use external host bin path for cmake file
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index 1ef461e..feb333f 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -13,7 +13,7 @@ DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 SRCREV = "d9b2f8c56d162c108d5427769a8e496dd7a3b62e"
 
 # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.10
-# 5.10.meta-qt5.1
+# 5.10.meta-qt5.2
 SRC_URI += "file://0001-Use-external-host-bin-path-for-cmake-file.patch"
 
 do_install_append_class-nativesdk() {
diff --git a/recipes-qt/qt5/qtserialbus/0001-Add-missing-include-for-struct-timeval.patch b/recipes-qt/qt5/qtserialbus/0001-Add-missing-include-for-struct-timeval.patch
deleted file mode 100644
index 519749e..0000000
--- a/recipes-qt/qt5/qtserialbus/0001-Add-missing-include-for-struct-timeval.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3c9a3e3bdb220c6aacee1db04a3f997e08dab161 Mon Sep 17 00:00:00 2001
-From: Samuli Piippo <samuli.piippo@qt.io>
-Date: Mon, 11 Dec 2017 14:39:34 +0200
-Subject: [PATCH] Add missing include for struct timeval
-
-Fix build failure with musl libc:
-socketcanbackend.h:88:38: error: 'timeval' was not declared in this scope
-
-Change-Id: I4089f5a906095c21b2790d35ad131d9a0713ff3b
----
- src/plugins/canbus/socketcan/socketcanbackend.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/plugins/canbus/socketcan/socketcanbackend.h b/src/plugins/canbus/socketcan/socketcanbackend.h
-index 50976b1..b49d267 100644
---- a/src/plugins/canbus/socketcan/socketcanbackend.h
-+++ b/src/plugins/canbus/socketcan/socketcanbackend.h
-@@ -50,6 +50,7 @@
- #include <sys/socket.h>
- #include <sys/uio.h>
- #include <linux/can.h>
-+#include <sys/time.h>
- 
- QT_BEGIN_NAMESPACE
- 
diff --git a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
index 1ae99ed..7a081a1 100644
--- a/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0001-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 75570ed9ac805373478fdc76cecca8bdaae3bc97 Mon Sep 17 00:00:00 2001
+From 9557b7b0100c335b42503c3f3b6a9a193c3bf9cf Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH] add noqtwebkit configuration
diff --git a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 99498c7..a4909f7 100644
--- a/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0002-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From 3a4fec39855d0e3bb694917658393bae2cfb1bda Mon Sep 17 00:00:00 2001
+From a260d3a5b1664027e09c7de368ee5e94d22ff8bf Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH] linguist-tools cmake: allow overriding the location for
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 8d47738..df15d88 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 # Patches from https://github.com/meta-qt5/qttools/commits/b5.10
-# 5.10.meta-qt5.1
+# 5.10.meta-qt5.2
 SRC_URI += " \
     file://0001-add-noqtwebkit-configuration.patch \
     file://0002-linguist-tools-cmake-allow-overriding-the-location-f.patch \
diff --git a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
index 18609fd..1e50d5a 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
+++ b/recipes-qt/qt5/qtvirtualkeyboard/0001-include-sys-time.h-for-timeval.patch
@@ -1,4 +1,4 @@
-From 43853e727b41f7a1efc642396c0e963ac66fc28a Mon Sep 17 00:00:00 2001
+From d479fe395566ed84cde2579011e2ca2358f22c41 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 12 Jul 2017 23:59:52 -0700
 Subject: [PATCH] include sys/time.h for timeval
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 498917d..0029170 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 # Patches from https://github.com/meta-qt5/qtvirtualkeyboard/commits/b5.10
-# 5.10.meta-qt5.1
+# 5.10.meta-qt5.2
 SRC_URI += "file://0001-include-sys-time.h-for-timeval.patch"
 
 # To enabled Nuance T9 Write support, you need to provide the licensed components
diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
index f6963d3..04ae7e0 100644
--- a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
+++ b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
@@ -1,4 +1,4 @@
-From 477e20becc2253629734ef51e5471500eb55635d Mon Sep 17 00:00:00 2001
+From e41bc392aa79073926aba917796e836f5b0d9f32 Mon Sep 17 00:00:00 2001
 From: Raphael Freudiger <laser_b@gmx.ch>
 Date: Tue, 10 Jan 2017 15:49:55 +0100
 Subject: [PATCH] fix build without xkbcommon-evdev
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 75b0cef..91ffcd7 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -40,7 +40,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 SRCREV = "db36bc0d9ccae21e84cd54be3e18ae539542eadc"
 
 # Patches from https://github.com/meta-qt5/qtwayland/commits/b5.10
-# 5.10.meta-qt5.1
+# 5.10.meta-qt5.2
 # From https://bugreports.qt.io/browse/QTBUG-57767
 SRC_URI += " \
     file://0001-fix-build-without-xkbcommon-evdev.patch \
diff --git a/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index 46e01f9..a324dc6 100644
--- a/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From b5808d9ad3573f5af3b51d8366c8b075598c0d87 Mon Sep 17 00:00:00 2001
+From a70b6d2183934e4d9a3ad00167acfaf0a78a90a9 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
@@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index bd9b290..1c13955 100644
+index 1b8edc8..03d6558 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
 @@ -59,6 +59,8 @@
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
index 66b1838..69e0566 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From 0d33ce775fdd1ee1befe2016ea3f6860d4c6e389 Mon Sep 17 00:00:00 2001
+From d760fcdd764985f05a480ba475855f92844a6f0d Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] chromium: Force host toolchain configuration
diff --git a/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
index 0f12c93..e41636a 100644
--- a/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From aeb7699d5ba148e0f057aa559b64f7659572a2c3 Mon Sep 17 00:00:00 2001
+From 838bb0afe93321ae3d225988728a5736cd4844fc Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH] Include dependency to QCoreApplication::translate()
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
index da93ccc..592a30f 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-workaround-for-too-long-.rps-file-name.patch
@@ -1,4 +1,4 @@
-From 6b6b67a8c3fee39470185b853e8fae7b8334a858 Mon Sep 17 00:00:00 2001
+From d76853bd469881625bedc85afabc69d36ecb05ed Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Thu, 30 Mar 2017 11:37:24 +0300
 Subject: [PATCH] chromium: workaround for too long .rps file name
diff --git a/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
index 772197f..84e430b 100644
--- a/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-Force-host-toolchain-configuration.patch
@@ -1,4 +1,4 @@
-From 13db17d0281ed7e0aaeeafb0f6caa6b0b6fb97af Mon Sep 17 00:00:00 2001
+From 36657d556e4f97d06aa44d874d7256c970cdad3c Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Wed, 15 Mar 2017 13:53:28 +0200
 Subject: [PATCH] Force host toolchain configuration
@@ -57,7 +57,7 @@ index dd0d3e3..70161c8 100644
  "  nm = \"$$which(nm)\" " \
  "  toolchain_args = { " \
 diff --git a/src/core/config/linux.pri b/src/core/config/linux.pri
-index 6f7b27f..1b9434b 100644
+index 1ce3ea8..23d0793 100644
 --- a/src/core/config/linux.pri
 +++ b/src/core/config/linux.pri
 @@ -91,7 +91,7 @@ contains(QT_ARCH, "mips") {
diff --git a/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch b/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
index 4d885d3..1fb85fb 100644
--- a/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-chromium-musl-sandbox-Define-TEMP_FAILURE_RETRY-if-n.patch
@@ -1,4 +1,4 @@
-From 70dc51bd11ab6a9870d8576ecf183a5a09e85751 Mon Sep 17 00:00:00 2001
+From c6e7171bf8f5ecb8b82d911581a45defe93854e1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:01:12 -0700
 Subject: [PATCH] chromium: musl: sandbox: Define TEMP_FAILURE_RETRY if not
diff --git a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
index cb5a5ec..5dbd07f 100644
--- a/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-chromium-musl-Avoid-mallinfo-APIs-on-non-glibc-linux.patch
@@ -1,4 +1,4 @@
-From d3484a466fa398308d0b03c7519bceae5baab050 Mon Sep 17 00:00:00 2001
+From 104d93f24a44dc4a1939d6e2c99f346526a5a7d9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:09:06 -0700
 Subject: [PATCH] chromium: musl: Avoid mallinfo() APIs on non-glibc/linux
diff --git a/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch b/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
index 87bb2c2..76160d1 100644
--- a/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-musl-don-t-use-pvalloc-as-it-s-not-available-on-musl.patch
@@ -1,4 +1,4 @@
-From f1fd296e97938e681984bc03fc2231d6fb92ca08 Mon Sep 17 00:00:00 2001
+From 1a23cb4027692535aeace4c6070864af672de70d Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Tue, 12 Dec 2017 16:06:14 +0200
 Subject: [PATCH] musl: don't use pvalloc as it's not available on musl
diff --git a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
index bb135f7..e0a3f80 100644
--- a/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-chromium-musl-include-fcntl.h-for-loff_t.patch
@@ -1,4 +1,4 @@
-From 8571461c4a6a86a90b25017076c304259b6e6d40 Mon Sep 17 00:00:00 2001
+From 1e51c5e3a299213b632dd2d448c86dabf45b2258 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:37:49 -0700
 Subject: [PATCH] chromium: musl: include fcntl.h for loff_t
diff --git a/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch b/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
index ba00405..45a45f9 100644
--- a/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-musl-link-against-libexecinfo.patch
@@ -1,4 +1,4 @@
-From c2878f35c98b413a456fe2df9b7ce05c86020bc0 Mon Sep 17 00:00:00 2001
+From e735b0adfa9b1dcaa93e3ce65d9cc01255ab340b Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@qt.io>
 Date: Thu, 14 Dec 2017 11:28:10 +0200
 Subject: [PATCH] musl: link against libexecinfo
@@ -10,10 +10,10 @@ Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/core/core_module.pro b/src/core/core_module.pro
-index 2409ccb..e41e5a9 100644
+index d21985e..eeebeb4 100644
 --- a/src/core/core_module.pro
 +++ b/src/core/core_module.pro
-@@ -45,7 +45,7 @@ else: QMAKE_LFLAGS += $$NINJA_LFLAGS
+@@ -54,7 +54,7 @@ linux {
  POST_TARGETDEPS += $$NINJA_TARGETDEPS
  
  
diff --git a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
index 09e5e06..f8c4150 100644
--- a/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
+++ b/recipes-qt/qt5/qtwebengine/0006-chromium-musl-use-off64_t-instead-of-the-internal-__.patch
@@ -1,4 +1,4 @@
-From 89291ef96916239c1c3a90dd39d52f9939464719 Mon Sep 17 00:00:00 2001
+From f0fba131a285144c5d71dad8b98ff0f15ce454ad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:38:37 -0700
 Subject: [PATCH] chromium: musl: use off64_t instead of the internal __off64_t
diff --git a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
index 1d80626..fbff288 100644
--- a/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
+++ b/recipes-qt/qt5/qtwebengine/0007-chromium-musl-linux-glibc-make-the-distinction.patch
@@ -1,4 +1,4 @@
-From 6ab246f27b626205539f762fa8acaccaf34c705f Mon Sep 17 00:00:00 2001
+From 42a0586aa7040caef931db8657b2ac8d345e4dd3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 14:54:38 -0700
 Subject: [PATCH] chromium: musl: linux != glibc, make the distinction
diff --git a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
index e3b380e..d040057 100644
--- a/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
+++ b/recipes-qt/qt5/qtwebengine/0008-chromium-musl-allocator-Do-not-include-glibc_weak_sy.patch
@@ -1,4 +1,4 @@
-From 622c9055e2401f03ded977f03b39a2f68ce5dbb1 Mon Sep 17 00:00:00 2001
+From ff7af7ff21d259cfc580541b931d478e3d604f01 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:09:02 -0700
 Subject: [PATCH] chromium: musl: allocator: Do not include glibc_weak_symbols
diff --git a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
index d0d0df5..c2a9c8a 100644
--- a/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
+++ b/recipes-qt/qt5/qtwebengine/0009-chromium-musl-Use-correct-member-name-__si_fields-fr.patch
@@ -1,4 +1,4 @@
-From e385de79d8caca9672cb41132450bb0751779208 Mon Sep 17 00:00:00 2001
+From 74171f47edb76dc89edcc7116cd33d234e0e0490 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:12:39 -0700
 Subject: [PATCH] chromium: musl: Use correct member name __si_fields from
diff --git a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Match-syscalls-to-match-musl.patch b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Match-syscalls-to-match-musl.patch
index 8a20886..7be83c5 100644
--- a/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Match-syscalls-to-match-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0010-chromium-musl-Match-syscalls-to-match-musl.patch
@@ -1,4 +1,4 @@
-From f2f765369ea6f3972f5dc78f86e0d4679795357a Mon Sep 17 00:00:00 2001
+From ce23b6a6e5a5ebae15dedeebf7044ac9a0249a80 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:24:49 -0700
 Subject: [PATCH] chromium: musl: Match syscalls to match musl
diff --git a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
index ebb49d2..9b27491 100644
--- a/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
+++ b/recipes-qt/qt5/qtwebengine/0011-chromium-musl-Define-res_ninit-and-res_nclose-for-no.patch
@@ -1,4 +1,4 @@
-From 67184dcd748867020ccbbae6aa5664a06e0f01fe Mon Sep 17 00:00:00 2001
+From 1781911655bddf8a8352f9bd0a7ce4867df6981b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:27:50 -0700
 Subject: [PATCH] chromium: musl: Define res_ninit and res_nclose for non-glibc
diff --git a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
index 319e6ab..e686325 100644
--- a/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
+++ b/recipes-qt/qt5/qtwebengine/0012-chromium-musl-Do-not-define-__sbrk-on-musl.patch
@@ -1,4 +1,4 @@
-From c090be70d6a8bff1f5bf5656be1704d95460c1a6 Mon Sep 17 00:00:00 2001
+From a968ea31e3ac6a007fd157c61faf9f6f632d8230 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 15:39:57 -0700
 Subject: [PATCH] chromium: musl: Do not define __sbrk on musl
diff --git a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
index cf4a71a..c1d6ec3 100644
--- a/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
+++ b/recipes-qt/qt5/qtwebengine/0013-chromium-musl-Adjust-default-pthread-stack-size.patch
@@ -1,4 +1,4 @@
-From 7f54603006d3f394c7c0043ad3a94ef26b37d002 Mon Sep 17 00:00:00 2001
+From a56debd9f26bacf76f0d734e98191485deba03fa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 16:41:23 -0700
 Subject: [PATCH] chromium: musl: Adjust default pthread stack size
diff --git a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
index d054d4d..81e71e7 100644
--- a/recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
+++ b/recipes-qt/qt5/qtwebengine/0014-chromium-musl-include-asm-generic-ioctl.h-for-TCGETS.patch
@@ -1,4 +1,4 @@
-From 5021549021554f2a0d13c8818bab51af4214a540 Mon Sep 17 00:00:00 2001
+From 5809e73146cdf43d13aa1b3789bfc7ff2ff723af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Jul 2017 17:15:34 -0700
 Subject: [PATCH] chromium: musl: include asm-generic/ioctl.h for TCGETS2
diff --git a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
index 9afa28f..03aa77a 100644
--- a/recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
+++ b/recipes-qt/qt5/qtwebengine/0015-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch
@@ -1,4 +1,4 @@
-From e0e9081da84362af4aa98bac960cc3f2cbfa8d3f Mon Sep 17 00:00:00 2001
+From 0aca8610a03cc100464d0d52a2c5425c52ab1e66 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 8 Jul 2017 09:08:23 -0700
 Subject: [PATCH] chromium: musl: tcmalloc: Use off64_t insread of __off64_t
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index bd06a0b..db089c1 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -124,7 +124,7 @@ RDEPENDS_${PN}-examples += " \
 QT_MODULE_BRANCH_CHROMIUM = "61-based"
 
 # Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.10
-# 5.10.meta-qt5.1
+# 5.10.meta-qt5.2
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
     file://0001-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
@@ -137,7 +137,7 @@ SRC_URI_append_libc-musl = "\
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/61-based
-# 61-based.meta-qt5.1
+# 61-based.meta-qt5.2
 SRC_URI += " \
     file://0001-chromium-Force-host-toolchain-configuration.patch;patchdir=src/3rdparty \
     file://0002-chromium-workaround-for-too-long-.rps-file-name.patch;patchdir=src/3rdparty \
-- 
2.15.1


