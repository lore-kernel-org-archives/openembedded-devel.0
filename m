Return-Path: <denis@denix.org>
X-Greylist: delayed 3607 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Aug 2014 02:26:12 UTC
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF3C617B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 02:26:12 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NAK008O8ZYQ3ID0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	19 Aug 2014 20:25:48 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F00D420092; Tue,
	19 Aug 2014 21:25:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Aug 2014 21:25:33 -0400
Message-id: <1408497933-11310-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] ltp-ddt: update to the latest rev, bump the version
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
X-List-Received-Date: Wed, 20 Aug 2014 02:26:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Fix KERNEL_DIR vs. KERNEL_INC properly, drop not needed Makefile patch
* Pass CC and KERNEL_CC to preserve the necessary system flags
* Tons of other fixes and new testcases

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...in-modern-kernel-should-point-at-toplevel.patch | 40 ----------------------
 .../ltp-ddt/{ltp-ddt_0.0.4.bb => ltp-ddt_0.0.5.bb} | 20 +++++++----
 2 files changed, 14 insertions(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch
 rename meta-oe/recipes-devtools/ltp-ddt/{ltp-ddt_0.0.4.bb => ltp-ddt_0.0.5.bb} (85%)

diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch
deleted file mode 100644
index 0b4ee64..0000000
--- a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e0fc5bea466c16b9d754a8ac8d0453e396678a2c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 Feb 2014 20:28:07 -0800
-Subject: [PATCH] KERNEL_INC in modern kernel should point at toplevel
- kerneldir
-
-Reason is kernel headers are not only in toplevel
-include/ but also in toplevel arch/ dir
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 031d8bc..73e9b3c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -245,15 +245,15 @@ endif
- 
- modules_edma:
- 	@echo "Going to compile edma test kernel modules for $(PLATFORM)"
--	cd testcases/ddt/edma_test_suite/src/kernel; make CROSS_COMPILE=$(CROSS_COMPILE) KERNEL_DIR=$(KERNEL_INC)/.. PLATFORM=$(PLATFORM)
-+	cd testcases/ddt/edma_test_suite/src/kernel; make CROSS_COMPILE=$(CROSS_COMPILE) KERNEL_DIR=$(KERNEL_INC) PLATFORM=$(PLATFORM)
- 
- modules_gpio:
- 	@echo "Going to compile gpio test kernel modules for $(PLATFORM)"
--	cd testcases/ddt/gpio_test_suite/src/kernel; make CROSS_COMPILE=$(CROSS_COMPILE) KERNEL_DIR=$(KERNEL_INC)/.. PLATFORM=$(PLATFORM)
-+	cd testcases/ddt/gpio_test_suite/src/kernel; make CROSS_COMPILE=$(CROSS_COMPILE) KERNEL_DIR=$(KERNEL_INC) PLATFORM=$(PLATFORM)
- 
- modules_ipc:
- 	@echo "Going to compile IPC test kernel modules for $(PLATFORM)"
--	cd testcases/ddt/ipc_test_suite/src/kernel; make CROSS_COMPILE=$(CROSS_COMPILE) KERNEL_DIR=$(KERNEL_INC)/.. PLATFORM=$(PLATFORM)
-+	cd testcases/ddt/ipc_test_suite/src/kernel; make CROSS_COMPILE=$(CROSS_COMPILE) KERNEL_DIR=$(KERNEL_INC) PLATFORM=$(PLATFORM)
- 
- modules: $(MODULES_TO_BUILD)
- 
--- 
-1.9.0
-
diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.5.bb
similarity index 85%
rename from meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
rename to meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.5.bb
index a70d5b9..d0b84ad 100644
--- a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.5.bb
@@ -3,21 +3,21 @@ HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-PR = "r1"
 
 PROVIDES += "ltp"
 DEPENDS += "zip-native virtual/kernel alsa-lib"
 
-inherit autotools module-base kernel-module-split
+RDEPENDS_${PN} += "pm-qa"
+
+inherit autotools-brokensep module-base kernel-module-split
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "4f77e2e33357d2b23211ecd22f27f521aa01469a"
+SRCREV = "088356602220dd8b48aeb138d4976c05c0879574"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
            file://0001-wdt_test_suite-Make-sure-to-include-generated-header.patch \
-           file://0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -28,12 +28,16 @@ EXTRA_OEMAKE_append = " \
     prefix=${LTPROOT} \
     CROSS_COMPILE=${HOST_PREFIX} \
     SKIP_IDCHECK=1 \
+    KERNEL_PATH=${STAGING_KERNEL_DIR} \
     KERNEL_INC=${STAGING_KERNEL_DIR} \
     KERNEL_USR_INC=${STAGING_INCDIR} \
     ALSA_INCPATH=${STAGING_INCDIR} \
     ALSA_LIBPATH=${STAGING_LIBDIR} \
     PLATFORM=${MACHINE} \
     RANLIB=${RANLIB} \
+    DESTDIR=${D} \
+    CC='${CC}' \
+    KERNEL_CC='${KERNEL_CC}' \
 "
 
 TARGET_CC_ARCH += "${LDFLAGS}"
@@ -63,12 +67,16 @@ do_configure() {
 
 kmoddir = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"
 
+do_compile_prepend () {
+    do_make_scripts
+}
+
 do_compile_append () {
-    oe_runmake DESTDIR=${D} modules
+    oe_runmake modules
 }
 
 do_install() {
-    oe_runmake DESTDIR=${D} install
+    oe_runmake install
     install -d ${D}${datadir}
     install -d ${D}${kmoddir}
     cp -a ${D}${LTPROOT}/share/* ${D}${datadir}
-- 
2.0.4


