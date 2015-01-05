Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 414967213F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 09:06:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55541207"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2015 17:02:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0595Uc9010999
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Jan 2015 17:05:31 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 5 Jan 2015 17:06:03 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Jan 2015 17:01:53 +0800
Message-ID: <1420448513-21578-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH v2] linux-atm: add recipe.
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
X-List-Received-Date: Mon, 05 Jan 2015 09:06:12 -0000
Content-Type: text/plain

Drivers and tools to support ATM networking under Linux

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../linux-atm/linux-atm/install-from-buildir.patch | 19 +++++++++++
 .../linux-atm/linux-atm/link-with-ldflags.patch    | 38 ++++++++++++++++++++++
 .../recipes-support/linux-atm/linux-atm_2.5.2.bb   | 22 +++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/install-from-buildir.patch
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldflags.patch
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/install-from-buildir.patch b/meta-networking/recipes-support/linux-atm/linux-atm/install-from-buildir.patch
new file mode 100644
index 0000000..d1380eb
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/install-from-buildir.patch
@@ -0,0 +1,19 @@
+install binaries from builddir not srcdir.
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+--- linux-atm-2.5.2.orig/src/extra/Makefile.am	2010-12-21 05:07:22.000000000 +0800
++++ linux-atm-2.5.2/src/extra/Makefile.am	2014-12-22 10:56:04.458563269 +0800
+@@ -9,9 +9,9 @@ CLEANFILES = pca200e.bin pca200e_ecd.bin
+ 
+ install-exec-hook:
+ 	$(MKDIR_P) $(DESTDIR)/lib/firmware
+-	$(INSTALL_DATA) $(srcdir)/pca200e.bin $(DESTDIR)/lib/firmware
+-	$(INSTALL_DATA) $(srcdir)/pca200e_ecd.bin2 $(DESTDIR)/lib/firmware
+-	$(INSTALL_DATA) $(srcdir)/sba200e_ecd.bin2 $(DESTDIR)/lib/firmware
++	$(INSTALL_DATA) $(builddir)/pca200e.bin $(DESTDIR)/lib/firmware
++	$(INSTALL_DATA) $(builddir)/pca200e_ecd.bin2 $(DESTDIR)/lib/firmware
++	$(INSTALL_DATA) $(builddir)/sba200e_ecd.bin2 $(DESTDIR)/lib/firmware
+ 
+ %.bin %.bin2: %.data
+ 	objcopy -Iihex $< -Obinary $@.gz
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldflags.patch b/meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldflags.patch
new file mode 100644
index 0000000..62fad2a
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldflags.patch
@@ -0,0 +1,38 @@
+LDFLAGS_FOR_BUILD should be required when doing link for qgen.
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+diff -Nurp linux-atm-2.5.2.orig/configure.in linux-atm-2.5.2/configure.in
+--- linux-atm-2.5.2.orig/configure.in	2010-12-28 23:36:07.000000000 +0800
++++ linux-atm-2.5.2/configure.in	2014-12-22 10:25:23.830510932 +0800
+@@ -66,6 +66,7 @@ else
+ fi
+ AC_SUBST(CC_FOR_BUILD)
+ AC_SUBST(CFLAGS_FOR_BUILD)
++AC_SUBST(LDFLAGS_FOR_BUILD)
+ dnl Add -d flag to bison/yacc to create intermediate .h files
+ YACC="$YACC -d"
+ 
+diff -Nurp linux-atm-2.5.2.orig/src/qgen/Makefile.am linux-atm-2.5.2/src/qgen/Makefile.am
+--- linux-atm-2.5.2.orig/src/qgen/Makefile.am	2010-12-28 22:29:31.000000000 +0800
++++ linux-atm-2.5.2/src/qgen/Makefile.am	2014-12-22 10:23:51.914508318 +0800
+@@ -5,7 +5,7 @@ qgen_SOURCES = common.c common.h file.c
+ qgen_LDADD = -lfl
+ 
+ COMPILE = @CC_FOR_BUILD@ @CFLAGS_FOR_BUILD@
+-LINK = @CC_FOR_BUILD@ @CFLAGS_FOR_BUILD@ -o $@
++LINK = @CC_FOR_BUILD@ @CFLAGS_FOR_BUILD@ @LDFLAGS_FOR_BUILD@ -o $@
+ 
+ #TESTS = $(check_PROGRAMS)
+ 
+diff -Nurp linux-atm-2.5.2.orig/src/qgen/Makefile.in linux-atm-2.5.2/src/qgen/Makefile.in
+--- linux-atm-2.5.2.orig/src/qgen/Makefile.in	2010-12-29 00:06:11.000000000 +0800
++++ linux-atm-2.5.2/src/qgen/Makefile.in	2014-12-22 10:23:51.914508318 +0800
+@@ -106,6 +106,7 @@ INSTALL_SCRIPT = @INSTALL_SCRIPT@
+ INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
+ LD = @LD@
+ LDFLAGS = @LDFLAGS@
++LDFLAGS_FOR_BUILD = @LDFLAGS_FOR_BUILD@
+ LEX = @LEX@
+ LEXLIB = @LEXLIB@
+ LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
new file mode 100644
index 0000000..4c0345b
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Drivers and tools to support ATM networking under Linux"
+HOMEPAGE = "http://linux-atm.sourceforge.net/"
+SECTION = "libs"
+LICENSE = "GPL-2.0 & LGPL-2.0"
+
+DEPENDS = "virtual/kernel flex flex-native"
+
+SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
+           file://link-with-ldflags.patch \
+           file://install-from-buildir.patch"
+
+SRC_URI[md5sum] = "d49499368c3cf15f73a05d9bce8824a8"
+SRC_URI[sha256sum] = "9645481a2b16476b59220aa2d6bc5bc41043f291326c9b37581018fbd16dd53a"
+
+LIC_FILES_CHKSUM = "\
+file://COPYING;md5=d928de9537d846935a98af3bbc6e6ee1 \
+file://COPYING.GPL;md5=ac2db169b9309e240555bc77be4f1a33 \
+file://COPYING.LGPL;md5=6e29c688d912da12b66b73e32b03d812"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += "${base_libdir}/firmware"
-- 
1.9.1


