Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id F1B436B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:37:17 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x55so1656687wes.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eTLtOPGh5/VcZJ1uGj8OL1jHyfQ0tsMVb0heooQZwAc=;
	b=iZRx3OjlUpJcwpgBTVrjUpX+45T3ZAG5MyecNbRJinhwbbxcr4favDpEiemylqPUx3
	XdPZOPxl6R+QokeTK2tzoE94AFaD5J0im4qJnWM+Eh4joX5dsIGX3KSbv6BoI24QIu2I
	JPco/SHlL+MxOMywwBAkrzM29WDPONzwcXOUDC18hN+aR3saJ78TJXv/Q6D/yHDSm/Is
	tgVqPfYG+LmnSXjjoZkszlsRlOwWB1AlBgqTzg6PJxSwfNlJm4W+fK2ebDdSZEpbB0KQ
	JuEtgVos3JFCZJKApJd3wbVDEe49XhY1+PnhiHbEbZ+XSIRxxKyvGoW2tsaviCNQnP46
	zr+g==
X-Gm-Message-State: ALoCoQkw6DAx/649fwODw/VZsPyeXMjh1tjyKunf4Ne2RAvDWLDWVCU3RCgKBC6pD/h3DEl+9eB9
X-Received: by 10.180.205.162 with SMTP id lh2mr1679059wic.57.1389785838663;
	Wed, 15 Jan 2014 03:37:18 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ea4sm9087026wib.7.2014.01.15.03.37.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 03:37:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 11:37:09 +0000
Message-Id: <1389785832-3120-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
References: <1389785832-3120-1-git-send-email-ross.burton@intel.com>
Subject: [meta-oe][PATCH 2/5] llvm: don't do out-of-tree builds manually
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
X-List-Received-Date: Wed, 15 Jan 2014 11:37:18 -0000

cmake.bbclass as of oe-core 783fb88 defaults to out-of-tree builds.  Use that
functionality directly to clean up the recipe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-core/llvm/llvm2.inc |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-core/llvm/llvm2.inc b/meta-oe/recipes-core/llvm/llvm2.inc
index f683fc3..a1f6ce8 100644
--- a/meta-oe/recipes-core/llvm/llvm2.inc
+++ b/meta-oe/recipes-core/llvm/llvm2.inc
@@ -20,13 +20,8 @@ LLVM_RELEASE = "${PV}"
 
 BBCLASSEXTEND = "native"
 
-LLVM_BUILD_DIR = "${B}/build"
 LLVM_INSTALL_DIR = "${B}/llvm-install"
 
-# llvm *must* be built out of tree
-OECMAKE_SOURCEPATH = ".."
-OECMAKE_BUILDPATH = "build"
-
 # other architectures require X86 available,
 LLVM_EXTRA_ARCH = "X86;"
 LLVM_EXTRA_ARCH_x86 = ""
@@ -73,7 +68,7 @@ base_do_compile_prepend() {
 
 do_install() {
     # Install into a private directory to be able to reorganize the files.
-    cd ${LLVM_BUILD_DIR}
+    cd ${B}
     oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
 
     # Create our custom target directories
@@ -101,7 +96,7 @@ do_install() {
 SYSROOT_PREPROCESS_FUNCS_append_class-target = " llvm_sysroot_preprocess"
 
 llvm_sysroot_preprocess() {
-    cd ${LLVM_BUILD_DIR}
+    cd ${B}
 
     # Fix the paths in the config script to make it find the binaries and
     # library files. Doing so allows 3rd party configure scripts working
@@ -118,7 +113,7 @@ llvm_sysroot_preprocess() {
 
 do_install_class-native() {
     # Install into a private directory to be able to reorganize the files.
-    cd ${LLVM_BUILD_DIR}
+    cd ${B}
     oe_runmake DESTDIR=${LLVM_INSTALL_DIR} install
 
     # Create our custom target directories
-- 
1.7.10.4


