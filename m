Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id C59D272667
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 20:56:17 +0000 (UTC)
Received: by wggz12 with SMTP id z12so22785975wgg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 12:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bgNY2aWWXvos8LGOj9dWJOiwLlAtFE1d0zgaMGJqQII=;
	b=N6MeyQggdCZPpL7dnYg9fJvtQNYkUeQFDeQfYdMbvKCpgcQ0Pno4pycEurQN3vXukE
	2pYfl9xmJMDi2kWdMIcfM9ja9tsv/DlIuf5XsALtkasftTmDM3tK25DEMZjHZsI2AfyW
	w3/t5W990S/1Us9ERD9Rsi4qO/smrTVFO+ZbAxejRJT0OnKBA2dmQIu6xuV2KkCiHu4T
	2Pto2swynS1j3ASCA2xWeelV4tENN7RrUr3s5KMvMBY9Nieg18DFtEPsMX5P0teUFJUh
	e2xPpGFSJx7dr6ArSNpNFoKdfdfjEA+QpB97/FTWiHypWL0UdCbxp+9KAAIGINoTsN2X
	dxhA==
X-Received: by 10.180.74.39 with SMTP id q7mr10084076wiv.73.1425070578654;
	Fri, 27 Feb 2015 12:56:18 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hl8sm4311104wjb.38.2015.02.27.12.56.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 12:56:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 21:56:28 +0100
Message-Id: <1425070591-28158-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
References: <1425070591-28158-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 4/7] qtwebengine: refresh patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Feb 2015 20:56:20 -0000

* drop 0001-eLinux-build-ffmpegsumo-as-well.patch which is already included in 5.4.1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...e.gypi-include-atomicops_internals_x86_g.patch} |  8 +++---
 .../0001-eLinux-build-ffmpegsumo-as-well.patch     | 31 ----------------------
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  8 +++---
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  8 +++---
 ...s.prf-allow-build-for-linux-oe-g-platform.patch | 12 ++++-----
 ...ure.prf-don-t-fail-when-libcap-test-fails.patch | 26 ++++++++++++++++++
 .../0004-dont-fail-libcap-config-test.patch        | 13 ---------
 recipes-qt/qt5/qtwebengine_5.4.1.bb                |  5 ++--
 recipes-qt/qt5/qtwebengine_git.bb                  |  2 +-
 9 files changed, 47 insertions(+), 66 deletions(-)
 rename recipes-qt/qt5/qtwebengine/{0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch => 0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch} (81%)
 delete mode 100644 recipes-qt/qt5/qtwebengine/0001-eLinux-build-ffmpegsumo-as-well.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0004-dont-fail-libcap-config-test.patch

diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
similarity index 81%
rename from recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch
rename to recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index 032fe4d..b4a8852 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,8 +1,8 @@
-From 41b142ec46c61d075b5cd95a88b57f0db74cbf31 Mon Sep 17 00:00:00 2001
+From 21d008c31a262ddcaeb3a8457de49061361ed882 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
-Subject: [PATCH] base.gypi: include atomicops_internals_x86_gcc.cc when
- building for x64 arch
+Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
+ when building for x64 arch
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -23,5 +23,5 @@ index a5a990a..af30cfa 100644
                  ['include', 'atomicops_internals_x86_gcc.cc'],
                ],
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwebengine/0001-eLinux-build-ffmpegsumo-as-well.patch b/recipes-qt/qt5/qtwebengine/0001-eLinux-build-ffmpegsumo-as-well.patch
deleted file mode 100644
index eb80afd..0000000
--- a/recipes-qt/qt5/qtwebengine/0001-eLinux-build-ffmpegsumo-as-well.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 72ff0b7d9600db642e2d2e95c78c70454bbdb5e7 Mon Sep 17 00:00:00 2001
-From: Zeno Albisser <zeno.albisser@theqtcompany.com>
-Date: Fri, 30 Jan 2015 13:10:15 +0100
-Subject: [PATCH] eLinux: build ffmpegsumo as well.
-
-This will only contain free codecs.
-
-Change-Id: I021b2c121bf146abb24b7a90dd1c3580638b1058
-Reviewed-by: Andras Becsi <andras.becsi@theqtcompany.com>
-
-Upstream-Status: Backport [ 72ff0b7d9600db642e2d2e95c78c70454bbdb5e7 from https://gitorious.org/qt/qtwebengine.git ]
----
- src/core/config/embedded_linux.pri | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/core/config/embedded_linux.pri b/src/core/config/embedded_linux.pri
-index 4000625..773bf0b 100644
---- a/src/core/config/embedded_linux.pri
-+++ b/src/core/config/embedded_linux.pri
-@@ -1,7 +1,7 @@
- GYP_ARGS += "-D qt_os=\"embedded_linux\" -I config/embedded_linux.gypi"
- 
- GYP_CONFIG += \
--    build_ffmpegsumo=0 \
-+    build_ffmpegsumo=1 \
-     configuration_policy=0 \
-     desktop_linux=0 \
-     disable_nacl=1 \
--- 
-1.9.1
-
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index 4587219..46a1e00 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,4 +1,4 @@
-From 41f9b2c1521950e1e3e1f01260f18e698d948814 Mon Sep 17 00:00:00 2001
+From 005fabe4148c78e8393c50ca6ebc9d0c2151c3cd Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
 Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index acf15a8..08b2642 100644
+index 4c2547d..64c08ad 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -84,8 +84,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -87,8 +87,8 @@ defineReplace(findIncludedMocFiles) {
  defineReplace(mocOutput) {
    out = $$1
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
@@ -25,5 +25,5 @@ index acf15a8..08b2642 100644
  }
  
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index 58218a5..173a58b 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,4 +1,4 @@
-From b36aeace50dc429cccbb9b84a6e538ebcd12ade9 Mon Sep 17 00:00:00 2001
+From 323f3d4fbd00b8655a1928c389d5f05ef4526044 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
 Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name to
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 08b2642..0123336 100644
+index 64c08ad..b46478b 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -82,7 +82,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -85,7 +85,8 @@ defineReplace(findIncludedMocFiles) {
  }
  
  defineReplace(mocOutput) {
@@ -25,5 +25,5 @@ index 08b2642..0123336 100644
    out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
    out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index b19556f..bc8a070 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 69e05cdc9000a1962101b2859d0ae3d77bb751d7 Mon Sep 17 00:00:00 2001
+From 762c943fbe1bee878275788f376b33abce46e25a Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
@@ -12,18 +12,18 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 0123336..5cea82a 100644
+index b46478b..6205bf4 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -7,7 +7,7 @@ defineTest(isPlatformSupported) {
+@@ -10,7 +10,7 @@ defineTest(isPlatformSupported) {
  
-   linux-g++*:!isGCCVersionSupported():return(false)
+   linux-g++*:!isGCCVersionSupported(): return(false)
    !isPythonVersionSupported(): return(false)
 -  linux-g++*|win32-msvc2013|macx-clang: return(true)
 +  linux-g++*|linux-oe-g++*|win32-msvc2013|macx-clang: return(true)
    boot2qt: return(true)
  
-   warning("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation".)
+   skipBuild("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
 -- 
-2.1.3
+2.3.1
 
diff --git a/recipes-qt/qt5/qtwebengine/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch b/recipes-qt/qt5/qtwebengine/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch
new file mode 100644
index 0000000..71ee4fe
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0004-configure.prf-don-t-fail-when-libcap-test-fails.patch
@@ -0,0 +1,26 @@
+From 1306df17fccb672e95911398740d48408488035a Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 27 Feb 2015 19:51:55 +0100
+Subject: [PATCH 4/4] configure.prf: don't fail when libcap test fails
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/qmake/mkspecs/features/configure.prf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/qmake/mkspecs/features/configure.prf b/tools/qmake/mkspecs/features/configure.prf
+index 6e74b55..b91fde8 100644
+--- a/tools/qmake/mkspecs/features/configure.prf
++++ b/tools/qmake/mkspecs/features/configure.prf
+@@ -20,7 +20,7 @@ defineTest(runConfigure) {
+         qtCompileTest($$test)
+     }
+     # libcap-dev package doesn't ship .pc files on Ubuntu.
+-    linux:!config_libcap:skipBuild("libcap appears to be missing")
++    #linux:!config_libcap:skipBuild("libcap appears to be missing")
+     contains(QT_CONFIG, xcb) {
+         for(package, $$list("libdrm xcomposite xi xrandr")) {
+             !packagesExist($$package):skipBuild("Unmet dependency: $$package")
+-- 
+2.3.1
+
diff --git a/recipes-qt/qt5/qtwebengine/0004-dont-fail-libcap-config-test.patch b/recipes-qt/qt5/qtwebengine/0004-dont-fail-libcap-config-test.patch
deleted file mode 100644
index 897e7e5..0000000
--- a/recipes-qt/qt5/qtwebengine/0004-dont-fail-libcap-config-test.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -u -r1.1 tools/qmake/mkspecs/features/configure.prf
---- a/tools/qmake/mkspecs/features/configure.prf  2015/02/04 10:24:55     1.1
-+++ b/tools/qmake/mkspecs/features/configure.prf  2015/02/04 10:26:52
-@@ -20,7 +20,7 @@
-         qtCompileTest($$test)
-     }
-     # libcap-dev package doesn't ship .pc files on Ubuntu.
--    linux:!config_libcap:skipBuild("libcap appears to be missing")
-+    #linux:!config_libcap:skipBuild("libcap appears to be missing")
-     contains(QT_CONFIG, xcb) {
-         for(package, $$list("libdrm xcomposite xi xrandr")) {
-             !packagesExist($$package):skipBuild("Unmet dependency: $$package")
-
diff --git a/recipes-qt/qt5/qtwebengine_5.4.1.bb b/recipes-qt/qt5/qtwebengine_5.4.1.bb
index 11096ca..4b21f32 100644
--- a/recipes-qt/qt5/qtwebengine_5.4.1.bb
+++ b/recipes-qt/qt5/qtwebengine_5.4.1.bb
@@ -8,7 +8,6 @@ SRC_URI += " \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
-    file://0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
-    file://0001-eLinux-build-ffmpegsumo-as-well.patch \
-    file://0004-dont-fail-libcap-config-test.patch \
+    file://0004-configure.prf-don-t-fail-when-libcap-test-fails.patch \
+    file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
 "
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 2f10e13..8d1f171 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
-    file://0001-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
+    file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
 "
 SRCREV_qtwebengine = "8eefc3a0658d1b10de12f43534cfd63af825ebc8"
 SRCREV_chromium = "be4ec3fa64a4c6c2b641830a9811ab7847c7dd39"
-- 
2.3.1


