Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 05372601F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 17:34:00 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id fb4so7855738wid.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 10:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mnryooh0h2EVZA3wXxCqKaxdwFsB1WB6O4webwtr/zs=;
	b=elACImihcGHoj3OeGzH3kLjPekMQ+69HNx6YJBVz4ajv2XUg2Lg6Fn6vbIn6kvz7fh
	fYYGPGIBJdwXCLBUzw1fpGIYdn/uPzjX+KBx6gZR1SYo4EN2uSkuVgvCJs6LFpEtIhi1
	QlvZSiFvfr3JZY3CvBbv1/FzjBsmAQ19SwXfQlls49EPmkjgk3k7HJ+mrcMRHSZKCXA/
	9WW4ne2iA+z6spz+mI0b6xoDt70kaYgcIYT1KSIqYIvns0bZdRdxZQHAqi+Mz7Kj3+Ii
	5ITA06JSwh/Tuf7kGKY/OlatzY96zUzfQjX54W1UYwb2++X/fnicUSJcpfMiki98ltM5
	H+MA==
X-Received: by 10.180.88.68 with SMTP id be4mr22008924wib.36.1413826440902;
	Mon, 20 Oct 2014 10:34:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nf6sm10335658wic.11.2014.10.20.10.34.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 10:34:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2014 19:33:52 +0200
Message-Id: <1413826432-483-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1413826432-483-1-git-send-email-Martin.Jansa@gmail.com>
References: <1413826432-483-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][WIP][PATCH 5/5] qtwebengine: backport patches to fix ARM build failures
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
X-List-Received-Date: Mon, 20 Oct 2014 17:34:02 -0000

From: Jonathan Liu <net147@gmail.com>

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...upplied-by-environment-variable-NINJA_PAT.patch |  4 +--
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  4 +--
 ...0003-functions.prf-Try-to-add-_moc-suffix.patch |  4 +--
 ...e-to-empty-string-if-mtune-flag-is-not-se.patch | 34 ++++++++++++++++++++++
 ...ix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch | 30 +++++++++++++++++++
 ...QMAKE_CC-when-extracting-C-compiler-flags.patch | 34 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_5.3.2+git.bb            |  3 ++
 7 files changed, 107 insertions(+), 6 deletions(-)
 create mode 100644 recipes-qt/qt5/qtwebengine/0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0005-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0006-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch

diff --git a/recipes-qt/qt5/qtwebengine/0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch b/recipes-qt/qt5/qtwebengine/0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch
index bd4e867..915d3e8 100644
--- a/recipes-qt/qt5/qtwebengine/0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch
@@ -1,7 +1,7 @@
-From c2defbfe5946a6c483e3f9df37fb16bdffeffc31 Mon Sep 17 00:00:00 2001
+From a6802bc4528205a9d3839a1f22d4fca32154f5f0 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 20 Jun 2014 09:09:12 +0200
-Subject: [PATCH 1/3] Use ninja supplied by environment variable NINJA_PATH
+Subject: [PATCH 1/6] Use ninja supplied by environment variable NINJA_PATH
 
 Signed-off-by: Simon Busch <morphis@gravedo.de>
 ---
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index b5fc71d..d043714 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,7 +1,7 @@
-From 32f3b53d0b5861ac3e277552b04a579d8bd16558 Mon Sep 17 00:00:00 2001
+From 7266e333c6568fec1e2ebbf0c2d68c4025397b2d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH 2/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
+Subject: [PATCH 2/6] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
  anywhere in patch, but at the end
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-Try-to-add-_moc-suffix.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-Try-to-add-_moc-suffix.patch
index 173f7f7..2e2c177 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-Try-to-add-_moc-suffix.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-Try-to-add-_moc-suffix.patch
@@ -1,7 +1,7 @@
-From b0e844967728edf814d611bb1c69d320a8a6c64d Mon Sep 17 00:00:00 2001
+From 8e540a678a796d78ff9a98986d747afbca7f63be Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 1 Jul 2014 15:58:16 +0200
-Subject: [PATCH 3/3] functions.prf: Try to add _moc suffix
+Subject: [PATCH 3/6] functions.prf: Try to add _moc suffix
 
 * otherwise moc generated files have the same basename and do_configure fails with:
   core_generated.gyp:QtWebEngineCore#target has several files with the same basename:
diff --git a/recipes-qt/qt5/qtwebengine/0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch b/recipes-qt/qt5/qtwebengine/0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch
new file mode 100644
index 0000000..a3842ec
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch
@@ -0,0 +1,34 @@
+From c99aed6ef28c4ac9c00024a40222331c0e682d28 Mon Sep 17 00:00:00 2001
+From: Andras Becsi <andras.becsi@digia.com>
+Date: Thu, 18 Sep 2014 18:22:37 +0200
+Subject: [PATCH 4/6] Set arm_tune to empty string if mtune flag is not set by
+ toolchain
+
+Since the default arm_tune option applied by chromium is not
+recognized by our gcc toolchain set arm_tune to empty string
+to prevent chromium from setting a default. Our toolchains
+set the arm version which already implies the corresponding
+mtune option anyway.
+
+Change-Id: I0291bd4f0e5706597d37f914e4eeefbd75397bbf
+Reviewed-by: Jocelyn Turcotte <jocelyn.turcotte@digia.com>
+---
+ src/core/gyp_run.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/gyp_run.pro b/src/core/gyp_run.pro
+index ed592e1..4845af2 100644
+--- a/src/core/gyp_run.pro
++++ b/src/core/gyp_run.pro
+@@ -47,7 +47,7 @@ cross_compile {
+         !isEmpty(MARCH): GYP_ARGS += "-D arm_arch=\"$$MARCH\""
+ 
+         MTUNE = $$extractCFlag("-mtune=.*")
+-        !isEmpty(MTUNE): GYP_ARGS += "-D arm_tune=\"$$MTUNE\""
++        GYP_ARGS += "-D arm_tune=\"$$MTUNE\""
+ 
+         MFLOAT = $$extractCFlag("-mfloat-abi=.*")
+         !isEmpty(MFLOAT): GYP_ARGS += "-D arm_float_abi=\"$$MFLOAT\""
+-- 
+2.1.1
+
diff --git a/recipes-qt/qt5/qtwebengine/0005-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch b/recipes-qt/qt5/qtwebengine/0005-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch
new file mode 100644
index 0000000..943f671
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0005-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch
@@ -0,0 +1,30 @@
+From 1331c66c937f1c3e10e193932db2037dc38434e9 Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Wed, 15 Oct 2014 17:02:16 +1100
+Subject: [PATCH 5/6] Fix ARM NEON detection for -mfpu=neon-vfpv4
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
+index 4845af2..66e97f4 100644
+--- a/src/core/gyp_run.pro
++++ b/src/core/gyp_run.pro
+@@ -64,7 +64,7 @@ cross_compile {
+             # If the toolchain does not explicitly specify to use NEON instructions
+             # we use arm_neon_optional for ARMv7 and newer and let chromium decide
+             # about the mfpu option.
+-            contains(MFPU, "neon"): GYP_ARGS += "-D arm_fpu=\"$$MFPU\" -D arm_neon=1"
++            contains(MFPU, "neon")|contains(MFPU, "neon-vfpv4"): GYP_ARGS += "-D arm_fpu=\"$$MFPU\" -D arm_neon=1"
+             else:!lessThan(MARMV, 7): GYP_ARGS += "-D arm_neon=0 -D arm_neon_optional=1"
+             else: GYP_ARGS += "-D arm_fpu=\"$$MFPU\" -D arm_neon=0 -D arm_neon_optional=0"
+         }
+-- 
+2.1.1
+
diff --git a/recipes-qt/qt5/qtwebengine/0006-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch b/recipes-qt/qt5/qtwebengine/0006-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch
new file mode 100644
index 0000000..920dd91
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0006-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch
@@ -0,0 +1,34 @@
+From d242c15eb961fbdee69c0a0989cd100d174a25db Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Wed, 15 Oct 2014 17:01:06 +1100
+Subject: [PATCH 6/6] Include QMAKE_CC when extracting C compiler flags
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
+index 78b1190..37dd615 100644
+--- a/tools/qmake/mkspecs/features/functions.prf
++++ b/tools/qmake/mkspecs/features/functions.prf
+@@ -14,7 +14,7 @@ defineReplace(getConfigDir) {
+ }
+ 
+ defineReplace(extractCFlag) {
+-    CFLAGS = $$QMAKE_CFLAGS
++    CFLAGS = $$QMAKE_CC $$QMAKE_CFLAGS
+     !isEmpty(ANDROID_TARGET_CFLAGS): CFLAGS = $$ANDROID_TARGET_CFLAGS
+     OPTION = $$find(CFLAGS, $$1)
+     OPTION = $$split(OPTION, =)
+-- 
+2.1.1
+
diff --git a/recipes-qt/qt5/qtwebengine_5.3.2+git.bb b/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
index 9c65d7a..99150e0 100644
--- a/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
+++ b/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
@@ -14,6 +14,9 @@ SRC_URI += " \
     file://0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch \
     file://0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0003-functions.prf-Try-to-add-_moc-suffix.patch \
+    file://0004-Set-arm_tune-to-empty-string-if-mtune-flag-is-not-se.patch \
+    file://0005-Fix-ARM-NEON-detection-for-mfpu-neon-vfpv4.patch \
+    file://0006-Include-QMAKE_CC-when-extracting-C-compiler-flags.patch \
     file://0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch \
     file://0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch \
     file://0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
-- 
2.1.1


