Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id F352F784CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 14:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 9221F2E676
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:50 +0200 (CEST)
X-Axis-NonUser-Spam: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id FNHhfZKMuhCx
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 797482E697
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B4921E08E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 469C11E088
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 3B09EC8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v5GEFnO8028459
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v5GEFn5m028458
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jun 2017 16:15:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 16:15:43 +0200
Message-Id: <20170616141544.28415-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] kconfig-frontends: Add recipe
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
X-List-Received-Date: Fri, 16 Jun 2017 14:15:50 -0000

This provides the kconfig infrastructure that is used for the Linux
kernel as a standalone package. It is not, however, intended to be
used for the kernel itself, but can be used by other packages that are
based on kconfig.

This is a verbatim copy of the corresponding recipe in OE-core since
that recipe is being removed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../files/0001-Fix-installation-of-.pc-files.patch | 28 +++++++++++++++
 ...Switch-utils-kconfig-diff-to-use-Python-3.patch | 26 ++++++++++++++
 .../kconfig-frontends/files/missing-mkdir.patch    | 37 +++++++++++++++++++
 .../kconfig-frontends_4.10.0.1.bb                  | 42 ++++++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch
 create mode 100644 meta-oe/recipes-devtools/kconfig-frontends/files/0001-Switch-utils-kconfig-diff-to-use-Python-3.patch
 create mode 100644 meta-oe/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
 create mode 100644 meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb

diff --git a/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch b/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch
new file mode 100644
index 000000000..57ea42e4b
--- /dev/null
+++ b/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch
@@ -0,0 +1,28 @@
+From 80c16b1f39402e8ce33600e5f297920a6d603090 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 27 Apr 2017 16:57:06 +0300
+Subject: [PATCH] Fix installation of .pc files
+
+They go to prefix/pkgconfig/, not prefix/pkg-config.
+
+Upstream-Status: Submitted
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 058690a..f9e9b7b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -107,7 +107,7 @@ EXTRA_DIST += \
+ 	libs/parser/yconf.y.patch
+ 
+ # libs/parser/kconfig-parser.pc generated by AC_CONFIG_FILES in configure.ac
+-pkgconfigdir = $(libdir)/pkg-config
++pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = libs/parser/kconfig-parser.pc
+ DISTCLEANFILES += libs/parser/kconfig-parser.pc
+ EXTRA_DIST += libs/parser/kconfig-parser.pc.in
+-- 
+2.11.0
diff --git a/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Switch-utils-kconfig-diff-to-use-Python-3.patch b/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Switch-utils-kconfig-diff-to-use-Python-3.patch
new file mode 100644
index 000000000..b8f890481
--- /dev/null
+++ b/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Switch-utils-kconfig-diff-to-use-Python-3.patch
@@ -0,0 +1,26 @@
+From 3b9b0f82c33f793a14d44bf06b6c8136bc3fc4bf Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 27 Apr 2017 16:48:42 +0300
+Subject: [PATCH] Switch utils/kconfig-diff to use Python 3
+
+The script supports it, but continues to refer to 2.x in shebang.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ utils/kconfig-diff | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/kconfig-diff b/utils/kconfig-diff
+index 0db267d..19189f3 100755
+--- a/utils/kconfig-diff
++++ b/utils/kconfig-diff
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python3
+ #
+ # diffconfig - a tool to compare .config files.
+ #
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch b/meta-oe/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
new file mode 100644
index 000000000..a11186e51
--- /dev/null
+++ b/meta-oe/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From ca05ee2fb6db5b3b1edc16dba6150a2c6078a6cf Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 9 May 2017 15:30:00 +0100
+Subject: [PATCH] Makefile: ensure utils/ exists before writing to it
+
+Since utils/ was changed to not build recursively it's possible that in
+out-of-tree builds the utils/ directory hasn't been created when Make runs the
+utils/kconfig-tweak target which tries to write to file inside utils/.
+
+To ensure this can work, mkdir the directory.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index c8e96ef..1baa110 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -173,2 +173,3 @@ bin_SCRIPTS += frontends/kconfig
+ frontends/kconfig: frontends/kconfig.in
++	$(MKDIR_P) $(@D)
+ 	$(AM_V_GEN)$(SED) -e 's/@KCFG_LIST@/$(kcfg_list)/g' \
+@@ -348,6 +348,7 @@ EXTRA_DIST += \
+ 	utils/kconfig-tweak.in.patch
+ 
+ utils/kconfig-tweak: utils/kconfig-tweak.in
++	$(MKDIR_P) $(@D)
+ 	$(AM_V_GEN)$(SED) -e "s/@CONFIG_@/$(config_prefix)/g" \
+ 		$< >$@
+ 	@chmod +x $@
+-- 
+2.8.1
diff --git a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb
new file mode 100644
index 000000000..d427e98c9
--- /dev/null
+++ b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb
@@ -0,0 +1,42 @@
+# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Linux kernel style configuration framework for other projects"
+DESCRIPTION = "The kconfig-frontends project aims at centralising \
+the effort of keeping an up-to-date, out-of-tree, packaging of the \
+kconfig infrastructure, ready for use by third-party projects. \
+The kconfig-frontends package provides the kconfig parser, as well as all \
+the frontends"
+HOMEPAGE = "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
+SECTION = "devel"
+DEPENDS += "ncurses flex bison gperf-native"
+RDEPENDS_${PN} += "python3 bash"
+SRC_URI = "git://ymorin.is-a-geek.org/kconfig-frontends;branch=4.10.x \
+           file://0001-Fix-installation-of-.pc-files.patch \
+           file://0001-Switch-utils-kconfig-diff-to-use-Python-3.patch \
+           file://missing-mkdir.patch"
+
+SRCREV = "f8ffe5e1c6f183cb7d5d515aa9381b7557de654e"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+do_configure_prepend () {
+	mkdir -p ${S}/scripts/.autostuff/m4
+}
+
+do_install_append() {
+	ln -s kconfig-conf ${D}${bindir}/conf
+	ln -s kconfig-mconf ${D}${bindir}/mconf
+}
+
+EXTRA_OECONF += "--disable-gconf --disable-qconf"
+
+# Some packages have the version preceeding the .so instead properly
+# versioned .so.<version>, so we need to reorder and repackage.
+SOLIBS = "-${@d.getVar('PV')[:-2]}.so"
+FILES_SOLIBSDEV = "${libdir}/libkconfig-parser.so"
+
+BBCLASSEXTEND = "native"
-- 
2.12.0


