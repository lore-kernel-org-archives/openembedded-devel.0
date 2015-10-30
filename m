Return-Path: <philip.balister@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA61770DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 18:13:41 +0000 (UTC)
Received: by padhy1 with SMTP id hy1so74999634pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 11:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=VozanX3N30uGNBEvrhNDMYVpR7m11uoWyiMKG+yRlxk=;
	b=dsPR6X8pBtxY7Mv+3bRQxlRiA3VK61ZHwlxrC++Etunh/IN0XxtG++oSIrTpywEv2t
	DxInw/ccI7Oola40sIN2SCxJ8OqDge01Aj0/bkb1wcXKA9e+qictcuGFCg0ad3nSguA+
	ICw5u2eMEJN6ICmMfCo2EYVwH4F8MUSWYFo0sc/xzKqAX9u6aNKynPUgU85B4VfPq/Ep
	rO8/PLq8iXhcaL1aUN/XRcIafyxyYARdreFsdNbnKrBukwiXx2/aWLKmdKOQQwGjr4sO
	CBYyn+QkXFYk2sVsJIB2FYdK28K4C75ziYITdWC7YX3gmK9lThjz7c6Z78U+mvDE/vFJ
	Ecsw==
X-Received: by 10.66.66.196 with SMTP id h4mr10068857pat.113.1446228821364;
	Fri, 30 Oct 2015 11:13:41 -0700 (PDT)
Received: from localhost.localdomain (207-114-172-147.static.twtelecom.net.
	[207.114.172.147]) by smtp.gmail.com with ESMTPSA id
	ro3sm9387080pbc.69.2015.10.30.11.13.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 11:13:40 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 11:13:28 -0700
Message-Id: <1446228808-18756-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.9.3
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe][PATCHv2] llvm: Add recipe for llvm-3.7.0.
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
X-List-Received-Date: Fri, 30 Oct 2015 18:13:41 -0000

From: Philip Balister <philip@opensdr.com>

This version builds in parallel with the 3.3 recipe. I had to use the
mesa llvmpipe driver, which required updates to llvm and mesa before it
worked. With updates, I succesfully used the mesa llvmpipe driver.

 * Move the licence file checksum to the version specific part of the recipe
 * License changed for 3.7.0 due to year change and adding related software
 * llvm source is now compressed with xz not gz.
 * Disable compiler version check since it checks the host compiler.

Signed-off-by: Philip Balister <philip@opensdr.com>
---
 meta-oe/recipes-core/llvm/llvm.inc           |  6 +++---
 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb     |  4 ++++
 meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb | 24 ++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index 04c87aa..c9a4ce4 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -23,7 +23,6 @@ HOMEPAGE = "http://llvm.org"
 # 3-clause BSD-like
 # University of Illinois/NCSA Open Source License
 LICENSE = "NCSA"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=d0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
 
 DEPENDS = "libffi libxml2-native llvm-common"
 
@@ -32,7 +31,7 @@ inherit perlnative pythonnative autotools
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
+SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.xz"
 S = "${WORKDIR}/llvm-${PV}.src"
 
 LLVM_BUILD_DIR = "${WORKDIR}/llvm-${PV}.build"
@@ -46,7 +45,8 @@ EXTRA_OECONF += "--disable-assertions \
                  --enable-libffi \
                  --enable-optimized \
                  --enable-shared \
-                 --enable-targets=host-only"
+                 --enable-targets=host-only \
+                 --disable-compiler-version-checks"
 EXTRA_OEMAKE += "REQUIRES_RTTI=1 VERBOSE=1"
 
 do_configure_prepend() {
diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
index 60a2221..f1562f6 100644
--- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
+++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
@@ -1,8 +1,12 @@
 require llvm.inc
 
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=d0a3ef0d3e0e8f5cf59e5ffc273ab1f8"
+
 DEPENDS += "zlib"
 EXTRA_OECONF += "--enable-zlib"
 
+# Overwrite SRC_URI from include file since older llvm uses .gz compression
+SRC_URI = "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
 SRC_URI += "file://Remove-error-output-from-configure-if-CFLAGS-is-set-.patch"
 
 SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
diff --git a/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb b/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb
new file mode 100644
index 0000000..813b185
--- /dev/null
+++ b/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb
@@ -0,0 +1,24 @@
+require llvm.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=4c0bc17c954e99fd547528d938832bfa"
+
+DEPENDS += "zlib"
+EXTRA_OECONF += "--enable-zlib"
+
+SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
+
+SRC_URI[md5sum] = "b98b9495e5655a672d6cb83e1a180f8e"
+SRC_URI[sha256sum] = "ab45895f9dcdad1e140a3a79fd709f64b05ad7364e308c0e582c5b02e9cc3153"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[r600] = "--enable-experimental-targets=R600,,,"
+
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
+
+# Fails to build with thumb-1 (qemuarm)
+# | {standard input}: Assembler messages:
+# | {standard input}:22: Error: selected processor does not support Thumb mode `stmdb sp!,{r0,r1,r2,r3,lr}'
+# | {standard input}:31: Error: lo register required -- `ldmia sp!,{r0,r1,r2,r3,lr}'
+# | {standard input}:32: Error: lo register required -- `ldr pc,[sp],#4'
+# | make[3]: *** [/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/llvm3.3/3.3-r0/llvm-3.3.build/lib/Target/ARM/Release/ARMJITInfo.o] Error 1
+ARM_INSTRUCTION_SET = "arm"
-- 
1.9.3


