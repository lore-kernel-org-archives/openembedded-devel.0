Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id E0A476E6F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 06:10:13 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id up15so1471081pbc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 22:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xcSEbYf0oaR2/IO40LsYp/k1PGN4Hx/Cecck1ZJd6l0=;
	b=vu7VgyCHU9hTlNu877j+cmdzYpLe+J6zP8VwXnX9Epm0fUo8bn6z+PpLQ32Q1Kto7P
	E/wTTrAUIYAjAXzHIU8n2d8rQHEHkEwfrUAgo6j7h6SYXPTrHF/rO6OjN8KVfoLKecN3
	PuUhT+cyAEuN4/Euoi5ih8m4txPF+bAnJrU1ab5X/R7EsqapuhHXZ0yz78mNoxMNXuEm
	ETfsG0ocd/lg7Ay3geivZRN2na7IA+TaC8FcSmeOVWay+AXq5flAVkibOzXoz13eMInn
	w7epknHz3OzitWfT21zo84APGrTcABuyqePevk0bw0xsxle4cYqv4a50NS8iRjr7xyQn
	sgng==
X-Received: by 10.68.171.4 with SMTP id aq4mr2576pbc.150.1392876613594;
	Wed, 19 Feb 2014 22:10:13 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id ns7sm7007572pbc.32.2014.02.19.22.10.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Feb 2014 22:10:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Feb 2014 22:11:23 -0800
Message-Id: <1392876684-2422-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][PATCH 1/2] ltp-ddt: Fix build with newer kernels
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
X-List-Received-Date: Thu, 20 Feb 2014 06:10:14 -0000

Update to latest git

kernel internal headers has got resuffled so adjust to that

split modules out into packages of their own otherwise
debug split logic gets confused when packaging the kernel modules

Package debug info generated from newly added test cases

Put .a files in staticdev package

install modules in usual location

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...in-modern-kernel-should-point-at-toplevel.patch | 40 ++++++++++++++++++++++
 ...ite-Make-sure-to-include-generated-header.patch | 34 ++++++++++++++++++
 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb  | 22 +++++++++---
 3 files changed, 92 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch
 create mode 100644 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch

diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch
new file mode 100644
index 0000000..0b4ee64
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch
@@ -0,0 +1,40 @@
+From e0fc5bea466c16b9d754a8ac8d0453e396678a2c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Feb 2014 20:28:07 -0800
+Subject: [PATCH] KERNEL_INC in modern kernel should point at toplevel
+ kerneldir
+
+Reason is kernel headers are not only in toplevel
+include/ but also in toplevel arch/ dir
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 031d8bc..73e9b3c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -245,15 +245,15 @@ endif
+ 
+ modules_edma:
+ 	@echo "Going to compile edma test kernel modules for $(PLATFORM)"
+-	cd testcases/ddt/edma_test_suite/src/kernel; make CROSS_COMPILE=$(CROSS_COMPILE) KERNEL_DIR=$(KERNEL_INC)/.. PLATFORM=$(PLATFORM)
++	cd testcases/ddt/edma_test_suite/src/kernel; make CROSS_COMPILE=$(CROSS_COMPILE) KERNEL_DIR=$(KERNEL_INC) PLATFORM=$(PLATFORM)
+ 
+ modules_gpio:
+ 	@echo "Going to compile gpio test kernel modules for $(PLATFORM)"
+-	cd testcases/ddt/gpio_test_suite/src/kernel; make CROSS_COMPILE=$(CROSS_COMPILE) KERNEL_DIR=$(KERNEL_INC)/.. PLATFORM=$(PLATFORM)
++	cd testcases/ddt/gpio_test_suite/src/kernel; make CROSS_COMPILE=$(CROSS_COMPILE) KERNEL_DIR=$(KERNEL_INC) PLATFORM=$(PLATFORM)
+ 
+ modules_ipc:
+ 	@echo "Going to compile IPC test kernel modules for $(PLATFORM)"
+-	cd testcases/ddt/ipc_test_suite/src/kernel; make CROSS_COMPILE=$(CROSS_COMPILE) KERNEL_DIR=$(KERNEL_INC)/.. PLATFORM=$(PLATFORM)
++	cd testcases/ddt/ipc_test_suite/src/kernel; make CROSS_COMPILE=$(CROSS_COMPILE) KERNEL_DIR=$(KERNEL_INC) PLATFORM=$(PLATFORM)
+ 
+ modules: $(MODULES_TO_BUILD)
+ 
+-- 
+1.9.0
+
diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch
new file mode 100644
index 0000000..56b0333
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch
@@ -0,0 +1,34 @@
+From 4a8f24892514cd5e4d11b9105c843db49eea921b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Feb 2014 19:41:33 -0800
+Subject: [PATCH] wdt_test_suite: Make sure to include generated headers
+
+This makes sure that its using the generated headers
+and not the raw headers from kernel, generated headers
+are built for the given machine already when kernel is
+built and are available in configured/compiled kernel tree
+already
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testcases/ddt/wdt_test_suite/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/ddt/wdt_test_suite/Makefile b/testcases/ddt/wdt_test_suite/Makefile
+index 90a6a90..22a1cfd 100644
+--- a/testcases/ddt/wdt_test_suite/Makefile
++++ b/testcases/ddt/wdt_test_suite/Makefile
+@@ -20,8 +20,8 @@ INCLUDES        = -I $(KERNEL_INC) -I src/interface/common -I ../utils/user
+ INCLUDES        = -I src/parser \
+                   -I src/interface/common \
+                   -I ../utils/user \
+-                  -I $(KERNEL_INC)/include \
+-                  -I $(KERNEL_INC)/arch/arm/include
++                  -I $(KERNEL_INC)/include/generated \
++                  -I $(KERNEL_INC)/arch/arm/include/generated \
+ 
+ #List of source files- Update this on adding a new C file
+ SOURCES := \
+-- 
+1.9.0
+
diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
index da81964..8e170ca 100644
--- a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
@@ -8,14 +8,17 @@ PR = "r1"
 PROVIDES += "ltp"
 DEPENDS += "zip-native virtual/kernel alsa-lib"
 
-inherit autotools
+inherit autotools module-base kernel-module-split
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "46e8aa7d0dd095300709309301e1c79f0003df40"
+SRCREV = "4f77e2e33357d2b23211ecd22f27f521aa01469a"
 BRANCH ?= "master"
 
-SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
+SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
+           file://0001-wdt_test_suite-Make-sure-to-include-generated-header.patch \
+           file://0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch \
+          "
 
 S = "${WORKDIR}/git"
 
@@ -25,11 +28,12 @@ EXTRA_OEMAKE_append = " \
     prefix=${LTPROOT} \
     CROSS_COMPILE=${HOST_PREFIX} \
     SKIP_IDCHECK=1 \
-    KERNEL_INC=${STAGING_KERNEL_DIR}/include-generic \
+    KERNEL_INC=${STAGING_KERNEL_DIR} \
     KERNEL_USR_INC=${STAGING_INCDIR} \
     ALSA_INCPATH=${STAGING_INCDIR} \
     ALSA_LIBPATH=${STAGING_LIBDIR} \
     PLATFORM=${MACHINE} \
+    RANLIB=${RANLIB} \
 "
 
 TARGET_CC_ARCH += "${LDFLAGS}"
@@ -44,8 +48,10 @@ FILES_${PN}-dbg += " \
     ${LTPROOT}/testcases/bin/ddt/.debug \
     ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
     ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
+    ${LTPROOT}/testcases/realtime/*/*/.debug \
 "
 
+FILES_${PN}-staticdev += "${LTPROOT}/lib"
 FILES_${PN} += "${LTPROOT}/*"
 
 do_configure() {
@@ -55,9 +61,17 @@ do_configure() {
     echo "${TAG}" > ${S}/ChangeLog
 }
 
+kmoddir = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"
+
+do_compile_append () {
+    oe_runmake DESTDIR=${D} modules
+}
+
 do_install() {
     oe_runmake DESTDIR=${D} install
     install -d ${D}${datadir}
+    install -d ${D}${kmoddir}
     cp -a ${D}${LTPROOT}/share/* ${D}${datadir}
     rm -rf ${D}${LTPROOT}/share/
+    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
 }
-- 
1.9.0


