Return-Path: <philip.balister@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6272960657
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 23:24:56 +0000 (UTC)
Received: by pabla5 with SMTP id la5so8615667pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 16:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=DJ2Z1aHJ8xMEG9VSJ6biwNYG6UEOyF6FwLZwofMr/MA=;
	b=vU7wKqhXBJ1EsMqa5jhlTgnuGY8vKGa0Fx6ZxkETXajuNZWa0xLJIZv0qI+Je9KsbP
	Lzo3ew3A8cXmRS7RapkEW+t4OKYLQ3tsgV6HURzO0uqZ8+p7D4IiVPaGwmm2612mzXa/
	UQ/zvx5RcT0AvWaN4zmFiSwEnSUbMSzjLnf4OwUs80ttCzEcnlApsz+fkLqh+CS6cz/Z
	2NFlBhpOlDKGG3LSKoiofIveLK+UAh1j47AITwIes2taT9UHGbPJqTmMExeQJ3hMz8FB
	7bGxFQdPJlnujyNqrHAfiSXC2MIOVO/RHWV43/dfDDWM+tgwMOE0Fb74UQsgyT+b9OeQ
	uCqw==
X-Received: by 10.66.253.197 with SMTP id ac5mr24263314pad.136.1445901897046; 
	Mon, 26 Oct 2015 16:24:57 -0700 (PDT)
Received: from localhost.localdomain (207-114-172-147.static.twtelecom.net.
	[207.114.172.147]) by smtp.gmail.com with ESMTPSA id
	qy7sm36048049pab.37.2015.10.26.16.24.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Oct 2015 16:24:56 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
X-Google-Original-From: Philip Balister <philip@blister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Oct 2015 16:24:46 -0700
Message-Id: <1445901886-17887-1-git-send-email-philip@blister.org>
X-Mailer: git-send-email 1.9.3
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe][PATCH] llvm: Add recipe for llvm-3.7.0.
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
X-List-Received-Date: Mon, 26 Oct 2015 23:24:57 -0000

From: Philip Balister <philip@opensdr.com>

This version builds in parallel with the 3.3 recipe. I had to use the
mesa llvmpipe driver, which required updates to llvm and mesa before it
worked. With updates, I succesfully used the mesa llvmpipe driver.

 * Move the licence file checksum to the version specific part of the recipe
 * License changed for 3.7.0 due to year change and adding related software
 * llvm source is now compressed with xz not gz.

Signed-off-by: Philip Balister <philip@opensdr.com>
---
 meta-oe/recipes-core/llvm/llvm.inc           |  3 +--
 meta-oe/recipes-core/llvm/llvm3.3_3.3.bb     |  4 ++++
 meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb | 24 ++++++++++++++++++++++++
 3 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index 04c87aa..7df4f4c 100644
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


