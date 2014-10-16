Return-Path: <net147@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id A704460DD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 04:31:08 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id r10so2478122pdi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2014 21:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=B8A5Nuae4UQN3eSUyWSaE7Dss8JWNPE7ItGFAePsoKo=;
	b=jEpwcZRioCP1W+HEUmmJETu9UcZGj+U2Xn0OaQwZDv8ml5qYm/mQ3CNGbn68RWBvFk
	itmz9x1IT6VWAiifNJboc5zvdvy+gFcWUH6fQ7HVVZvk3FZi7BhkyPzb+SA40Omt7qRc
	/8zyiFqHK9pRRBQwWfG4Rbp4gdCgZIY0jYQkkB7V/pXLe9c8DByWYdN64TTa6ZWjlQ2a
	rAjbTSegp8c+T6oPlKwgXVVUvbfLwKwS0+BmzXo1QdrEAmpJQwd52ffXocBf8ff4lGOo
	iv2oKK25UhHDNT/gaVBlJI8Dt9DoSy5y59f/paeIaoVoRkM91eUqZg6VyaRBwQWHJemF
	bt7g==
X-Received: by 10.67.30.72 with SMTP id kc8mr17489130pad.13.1413433870210;
	Wed, 15 Oct 2014 21:31:10 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id j9sm14861180pbq.61.2014.10.15.21.31.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Oct 2014 21:31:09 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Oct 2014 15:44:05 +1100
Message-Id: <1413434645-13943-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.1.2
Subject: [meta-qt5][PATCH] qtwebengine: backport patches to fix ARM build failures
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
X-List-Received-Date: Thu, 16 Oct 2014 04:31:11 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...ix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch | 30 +++++++++++++++++++
 ...QMAKE_CC-when-extracting-C-compiler-flags.patch | 34 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_5.3.2+git.bb            |  2 ++
 recipes-qt/qt5/qtwebengine_git.bb                  |  2 ++
 4 files changed, 68 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine/0001-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0002-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch

diff --git a/recipes-qt/qt5/qtwebengine/0001-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch b/recipes-qt/qt5/qtwebengine/0001-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch
new file mode 100644
index 0000000..f0b8d1a
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0001-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch
@@ -0,0 +1,30 @@
+From 6b64f42363308a80044cc85ae8ba6c9bf1aac8a7 Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Wed, 15 Oct 2014 17:02:16 +1100
+Subject: [PATCH 1/2] Fix ARM NEON detection for -mfpu=neon-vfpv4
+
+Upstream-Status: Backport
+
+Change-Id: I972d3560d6aa2640a2702f219cf802d2476b1c6e
+Reviewed-by: Andras Becsi <andras.becsi@digia.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/core/gyp_run.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/gyp_run.pro b/src/core/gyp_run.pro
+index f79972a..026e3a2 100644
+--- a/src/core/gyp_run.pro
++++ b/src/core/gyp_run.pro
+@@ -69,7 +69,7 @@ cross_compile {
+             # If the toolchain does not explicitly specify to use NEON instructions
+             # we use arm_neon_optional for ARMv7 and newer and let chromium decide
+             # about the mfpu option.
+-            contains(MFPU, "neon"): GYP_ARGS += "-D arm_fpu=\"$$MFPU\" -D arm_neon=1"
++            contains(MFPU, "neon")|contains(MFPU, "neon-vfpv4"): GYP_ARGS += "-D arm_fpu=\"$$MFPU\" -D arm_neon=1"
+             else:!lessThan(MARMV, 7): GYP_ARGS += "-D arm_neon=0 -D arm_neon_optional=1"
+             else: GYP_ARGS += "-D arm_fpu=\"$$MFPU\" -D arm_neon=0 -D arm_neon_optional=0"
+         }
+-- 
+2.1.2
+
diff --git a/recipes-qt/qt5/qtwebengine/0002-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch b/recipes-qt/qt5/qtwebengine/0002-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch
new file mode 100644
index 0000000..01f8d2e
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0002-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch
@@ -0,0 +1,34 @@
+From 98a079fcf7e12d17414ef27289a03cfb923be7a5 Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Wed, 15 Oct 2014 17:01:06 +1100
+Subject: [PATCH 2/2] Include QMAKE_CC when extracting C compiler flags
+
+This fixes cross-compile settings detection for cross-compilation
+environments where the C compiler cross-compilation flags are set in
+CC/QMAKE_CC instead of CFLAGS/QMAKE_CFLAGS (e.g. OpenEmbedded).
+
+Upstream-Status: Backport
+
+Change-Id: I0a7b0f6c47a00775ec18073a16359c8351363285
+Reviewed-by: Andras Becsi <andras.becsi@digia.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ tools/qmake/mkspecs/features/functions.prf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
+index 789af9a..06713d4 100644
+--- a/tools/qmake/mkspecs/features/functions.prf
++++ b/tools/qmake/mkspecs/features/functions.prf
+@@ -35,7 +35,7 @@ defineReplace(getChromiumSrcDir) {
+ }
+ 
+ defineReplace(extractCFlag) {
+-    CFLAGS = $$QMAKE_CFLAGS
++    CFLAGS = $$QMAKE_CC $$QMAKE_CFLAGS
+     !isEmpty(ANDROID_TARGET_CFLAGS): CFLAGS = $$ANDROID_TARGET_CFLAGS
+     OPTION = $$find(CFLAGS, $$1)
+     OPTION = $$split(OPTION, =)
+-- 
+2.1.2
+
diff --git a/recipes-qt/qt5/qtwebengine_5.3.2+git.bb b/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
index c9a6ea4..57469d0 100644
--- a/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
+++ b/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
@@ -21,6 +21,8 @@ SRC_URI = " \
     file://0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch \
     file://0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch \
     file://0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
+    file://0001-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch \
+    file://0002-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch \
 "
 SRCREV_qtwebengine = "21f6ce84ecca9a4ff2aa980b21d2e5174c78d14b"
 SRCREV_chromium = "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 360a1c8..ee7a83c 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -16,6 +16,8 @@ SRC_URI = " \
     file://0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch \
     file://0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch \
     file://0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
+    file://0001-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch \
+    file://0002-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch \
 "
 SRCREV_qtwebengine = "4ffc07ddb8739da9e94a2b23b03c63fd7b74c09a"
 SRCREV_chromium = "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
-- 
2.1.2


