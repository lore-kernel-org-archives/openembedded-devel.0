Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 488EA737F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 19:43:17 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NMI00GBN3ZL7P60@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	08 Apr 2015 13:43:07 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=KaRlarcG c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10
	a=sozttTNsAAAA:8 a=pGLkceISAAAA:8	a=t7CeM3EgAAAA:8 a=HihYlcsHAAAA:8
	a=rksKdP4n3Swv4fL_r9oA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BC38D2016F;	Wed,
	8 Apr 2015 14:42:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 08 Apr 2015 14:42:56 -0400
Message-id: <1428518576-11800-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1428518576-11800-1-git-send-email-denis@denix.org>
References: <1428518576-11800-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] ltp-ddt: bump to version 1.0.0
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
X-List-Received-Date: Wed, 08 Apr 2015 19:43:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ite-Make-sure-to-include-generated-header.patch | 34 ----------------------
 .../ltp-ddt/ltp-Do-not-link-against-libfl.patch    | 31 ++++++++++++++++++++
 .../ltp-ddt/{ltp-ddt_0.0.5.bb => ltp-ddt_1.0.0.bb} | 34 +++++++++++++---------
 3 files changed, 52 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch
 create mode 100644 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch
 rename meta-oe/recipes-devtools/ltp-ddt/{ltp-ddt_0.0.5.bb => ltp-ddt_1.0.0.bb} (68%)

diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch
deleted file mode 100644
index 56b0333..0000000
--- a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/0001-wdt_test_suite-Make-sure-to-include-generated-header.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4a8f24892514cd5e4d11b9105c843db49eea921b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 Feb 2014 19:41:33 -0800
-Subject: [PATCH] wdt_test_suite: Make sure to include generated headers
-
-This makes sure that its using the generated headers
-and not the raw headers from kernel, generated headers
-are built for the given machine already when kernel is
-built and are available in configured/compiled kernel tree
-already
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/ddt/wdt_test_suite/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/ddt/wdt_test_suite/Makefile b/testcases/ddt/wdt_test_suite/Makefile
-index 90a6a90..22a1cfd 100644
---- a/testcases/ddt/wdt_test_suite/Makefile
-+++ b/testcases/ddt/wdt_test_suite/Makefile
-@@ -20,8 +20,8 @@ INCLUDES        = -I $(KERNEL_INC) -I src/interface/common -I ../utils/user
- INCLUDES        = -I src/parser \
-                   -I src/interface/common \
-                   -I ../utils/user \
--                  -I $(KERNEL_INC)/include \
--                  -I $(KERNEL_INC)/arch/arm/include
-+                  -I $(KERNEL_INC)/include/generated \
-+                  -I $(KERNEL_INC)/arch/arm/include/generated \
- 
- #List of source files- Update this on adding a new C file
- SOURCES := \
--- 
-1.9.0
-
diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch
new file mode 100644
index 0000000..3e4aa73
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl.patch
@@ -0,0 +1,31 @@
+From 5bda9c0af56869c6ff2c25d38ea087179c946bc6 Mon Sep 17 00:00:00 2001
+From: Chong Lu <Chong.Lu@windriver.com>
+Date: Tue, 11 Mar 2014 14:47:22 +0800
+Subject: [PATCH] ltp: Don't link against libfl
+
+We have already defined yywrap function in scan.l file. After this, we no longer need to
+link against libfl and so no longer get errors about undefined references to yylex.
+
+Upstream-status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ pan/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pan/Makefile b/pan/Makefile
+index 4cc6466..a4b575b 100644
+--- a/pan/Makefile
++++ b/pan/Makefile
+@@ -31,7 +31,7 @@ CPPFLAGS		+= -Wno-error
+ 
+ CPPFLAGS		+= -I$(abs_srcdir)
+ 
+-LDLIBS			+= -lm $(LEXLIB)
++LDLIBS			+= -lm
+ 
+ LFLAGS			+= -l
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.5.bb b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
similarity index 68%
rename from meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.5.bb
rename to meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index db62ac6..d028e88 100644
--- a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.5.bb
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -7,18 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 PROVIDES += "ltp"
 DEPENDS += "zip-native virtual/kernel alsa-lib"
 
-RDEPENDS_${PN} += "pm-qa"
+RDEPENDS_${PN} += "pm-qa serialcheck"
 
-inherit autotools-brokensep module-base kernel-module-split
+inherit autotools module-base kernel-module-split
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "903f70a11eb77cbad62d7ecbe7dcbaf61be8ff99"
+SRCREV = "f086bed6cc88bf102eaad0e96cb7ebe79944a8ad"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-           file://0001-wdt_test_suite-Make-sure-to-include-generated-header.patch \
-          "
+    file://ltp-Do-not-link-against-libfl.patch \
+"
 
 S = "${WORKDIR}/git"
 
@@ -58,16 +58,26 @@ FILES_${PN}-dbg += " \
 FILES_${PN}-staticdev += "${LTPROOT}/lib"
 FILES_${PN} += "${LTPROOT}/*"
 
-do_configure() {
-    cp ${S}/include/config.h.default ${S}/include/config.h
-    cp ${S}/include/mk/config.mk.default ${S}/include/mk/config.mk
-    cp ${S}/include/mk/features.mk.default ${S}/include/mk/features.mk
-    echo "${TAG}" > ${S}/ChangeLog
-}
+KERNEL_MODULES_META_PACKAGE = "${PN}"
 
 kmoddir = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"
 
+# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure call.
+# we explicitly force regeneration of that directory and pass configure options.
+do_configure_append() {
+    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS})
+}
+
+# The makefiles make excessive use of make -C and several include testcases.mk
+# which triggers a build of the syscall header. To reproduce, build ltp,
+# then delete the header, then "make -j XX" and watch regen.sh run multiple
+# times. Its easier to generate this once here instead.
+do_compile_prepend () {
+    ( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
+}
+
 do_compile_append () {
+    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
     oe_runmake modules
 }
 
@@ -75,8 +85,6 @@ do_install() {
     oe_runmake install
     install -d ${D}${datadir}
     install -d ${D}${kmoddir}
-    cp -a ${D}${LTPROOT}/share/* ${D}${datadir}
-    rm -rf ${D}${LTPROOT}/share/
     mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
 }
 
-- 
2.2.0


