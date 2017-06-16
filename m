Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id F3275784BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 14:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id AD8D12E697
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:50 +0200 (CEST)
X-Axis-NonUser-Spam: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id X5W_oyFFlyjb
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 855F02E705
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 716E71E088
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66B471E092
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 5B573174
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v5GEFn2Z028463
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:15:49 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v5GEFn3G028462
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jun 2017 16:15:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 16:15:44 +0200
Message-Id: <20170616141544.28415-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170616141544.28415-1-pkj@axis.com>
References: <20170616141544.28415-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] kconfig-frontends: Update to 4.11.0.1
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

No longer needed patches have been removed, and one patch has been
backported instead of using the submitted patch.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../files/0001-Fix-installation-of-.pc-files.patch | 28 ----------------
 ...sure-frontends-exits-before-writing-into-.patch | 32 +++++++++++++++++++
 .../kconfig-frontends/files/missing-mkdir.patch    | 37 ----------------------
 ...s_4.10.0.1.bb => kconfig-frontends_4.11.0.1.bb} |  9 +++---
 4 files changed, 36 insertions(+), 70 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch
 create mode 100644 meta-oe/recipes-devtools/kconfig-frontends/files/0001-Makefile-ensure-frontends-exits-before-writing-into-.patch
 delete mode 100644 meta-oe/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
 rename meta-oe/recipes-devtools/kconfig-frontends/{kconfig-frontends_4.10.0.1.bb => kconfig-frontends_4.11.0.1.bb} (89%)

diff --git a/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch b/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch
deleted file mode 100644
index 57ea42e4b..000000000
--- a/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Fix-installation-of-.pc-files.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 80c16b1f39402e8ce33600e5f297920a6d603090 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 27 Apr 2017 16:57:06 +0300
-Subject: [PATCH] Fix installation of .pc files
-
-They go to prefix/pkgconfig/, not prefix/pkg-config.
-
-Upstream-Status: Submitted
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 058690a..f9e9b7b 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -107,7 +107,7 @@ EXTRA_DIST += \
- 	libs/parser/yconf.y.patch
- 
- # libs/parser/kconfig-parser.pc generated by AC_CONFIG_FILES in configure.ac
--pkgconfigdir = $(libdir)/pkg-config
-+pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = libs/parser/kconfig-parser.pc
- DISTCLEANFILES += libs/parser/kconfig-parser.pc
- EXTRA_DIST += libs/parser/kconfig-parser.pc.in
--- 
-2.11.0
diff --git a/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Makefile-ensure-frontends-exits-before-writing-into-.patch b/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Makefile-ensure-frontends-exits-before-writing-into-.patch
new file mode 100644
index 000000000..a5263c6f8
--- /dev/null
+++ b/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Makefile-ensure-frontends-exits-before-writing-into-.patch
@@ -0,0 +1,32 @@
+From 780b0b8e48551ba49b011caeeb09101a09c14a61 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 26 May 2017 17:11:32 +0100
+Subject: [PATCH] Makefile: ensure frontends/ exits before writing into it
+
+As previously, if GCC dependencies are not being written and the build is out of
+tree then frontends/ won't exist so we need to create it.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+(cherry picked from commit f7986375129d1ada7dc6abeeec5b9d00ef6f7149)
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1baa110..434db5d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -171,6 +171,7 @@ if COND_kconfig
+ bin_SCRIPTS += frontends/kconfig
+ 
+ frontends/kconfig: frontends/kconfig.in
++	$(MKDIR_P) $(@D)
+ 	$(AM_V_GEN)$(SED) -e 's/@KCFG_LIST@/$(kcfg_list)/g' \
+ 		$< >$@
+ 	@chmod +x $@
+-- 
+2.12.0
+
diff --git a/meta-oe/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch b/meta-oe/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
deleted file mode 100644
index a11186e51..000000000
--- a/meta-oe/recipes-devtools/kconfig-frontends/files/missing-mkdir.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From ca05ee2fb6db5b3b1edc16dba6150a2c6078a6cf Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 9 May 2017 15:30:00 +0100
-Subject: [PATCH] Makefile: ensure utils/ exists before writing to it
-
-Since utils/ was changed to not build recursively it's possible that in
-out-of-tree builds the utils/ directory hasn't been created when Make runs the
-utils/kconfig-tweak target which tries to write to file inside utils/.
-
-To ensure this can work, mkdir the directory.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index c8e96ef..1baa110 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -173,2 +173,3 @@ bin_SCRIPTS += frontends/kconfig
- frontends/kconfig: frontends/kconfig.in
-+	$(MKDIR_P) $(@D)
- 	$(AM_V_GEN)$(SED) -e 's/@KCFG_LIST@/$(kcfg_list)/g' \
-@@ -348,6 +348,7 @@ EXTRA_DIST += \
- 	utils/kconfig-tweak.in.patch
- 
- utils/kconfig-tweak: utils/kconfig-tweak.in
-+	$(MKDIR_P) $(@D)
- 	$(AM_V_GEN)$(SED) -e "s/@CONFIG_@/$(config_prefix)/g" \
- 		$< >$@
- 	@chmod +x $@
--- 
-2.8.1
diff --git a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
similarity index 89%
rename from meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb
rename to meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
index d427e98c9..df08b8b11 100644
--- a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb
+++ b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
@@ -13,12 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
 SECTION = "devel"
 DEPENDS += "ncurses flex bison gperf-native"
 RDEPENDS_${PN} += "python3 bash"
-SRC_URI = "git://ymorin.is-a-geek.org/kconfig-frontends;branch=4.10.x \
-           file://0001-Fix-installation-of-.pc-files.patch \
-           file://0001-Switch-utils-kconfig-diff-to-use-Python-3.patch \
-           file://missing-mkdir.patch"
+SRC_URI = "git://ymorin.is-a-geek.org/kconfig-frontends;branch=4.11.x \
+	   file://0001-Makefile-ensure-frontends-exits-before-writing-into-.patch \
+           file://0001-Switch-utils-kconfig-diff-to-use-Python-3.patch"
 
-SRCREV = "f8ffe5e1c6f183cb7d5d515aa9381b7557de654e"
+SRCREV = "f22fce3a308be1c7790ebefc6bbedb33c5f7c86a"
 
 S = "${WORKDIR}/git"
 
-- 
2.12.0


