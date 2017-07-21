Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42A1C7838C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:35:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6L7Z6O6025503
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 21 Jul 2017 00:35:06 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Jul 2017 00:35:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Jul 2017 03:34:46 -0400
Message-ID: <ff2dad5f77c0d207342b99799e11888a13a2d600.1500621886.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500621886.git.hongxu.jia@windriver.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 09/10] libtar: add recipe 1.2.20
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
X-List-Received-Date: Fri, 21 Jul 2017 07:35:06 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libtar/files/0002-Do-not-strip-libtar.patch    | 25 ++++++++++++++++++++++
 .../libtar/files/fix_libtool_sysroot.patch         | 19 ++++++++++++++++
 meta-oe/recipes-support/libtar/libtar_1.2.20.bb    | 21 ++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtar/files/0002-Do-not-strip-libtar.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/fix_libtool_sysroot.patch
 create mode 100644 meta-oe/recipes-support/libtar/libtar_1.2.20.bb

diff --git a/meta-oe/recipes-support/libtar/files/0002-Do-not-strip-libtar.patch b/meta-oe/recipes-support/libtar/files/0002-Do-not-strip-libtar.patch
new file mode 100644
index 0000000..31c0d29
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/0002-Do-not-strip-libtar.patch
@@ -0,0 +1,25 @@
+From e9fee689430af7791b932a1ee3c2cc103ccf290f Mon Sep 17 00:00:00 2001
+From: Stefan Eichenberger <stefan.eichenberger@netmodule.com>
+Date: Wed, 2 Nov 2016 05:43:43 -0400
+Subject: [PATCH] Do not strip libtar.
+
+---
+ libtar/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libtar/Makefile.in b/libtar/Makefile.in
+index 7c6f1bc..80bb8d9 100644
+--- a/libtar/Makefile.in
++++ b/libtar/Makefile.in
+@@ -20,7 +20,7 @@ SHELL           = @SHELL@
+ 
+ ### Installation programs and flags
+ INSTALL		= @INSTALL@
+-INSTALL_PROGRAM	= @INSTALL_PROGRAM@ -s
++INSTALL_PROGRAM	= @INSTALL_PROGRAM@
+ INSTALL_DATA	= @INSTALL_DATA@
+ LN_S		= @LN_S@
+ MKDIR		= @MKDIR@
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/libtar/files/fix_libtool_sysroot.patch b/meta-oe/recipes-support/libtar/files/fix_libtool_sysroot.patch
new file mode 100644
index 0000000..178a970
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/fix_libtool_sysroot.patch
@@ -0,0 +1,19 @@
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 4623100..1c6b43d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -13,6 +13,7 @@ AC_CONFIG_MACRO_DIR([autoconf])
+ AM_INIT_AUTOMAKE([dist-bzip2])
+ ENCAP_PKG([], [postinstall-encap])
+ 
++LT_INIT
+ 
+ dnl ### Load subdirectory modules. ##################################
+ PSG_MODULE([compat])
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
new file mode 100644
index 0000000..60710f4
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
@@ -0,0 +1,21 @@
+SUMMARY = "libtar, tar manipulating library"
+DESCRIPTION = "libtar is a library for manipulating POSIX tar files"
+HOMEPAGE = "http://www.feep.net/libtar"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=61cbac6719ae682ce6cd45b5c11e21af"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz \
+           file://fix_libtool_sysroot.patch \
+           file://0002-Do-not-strip-libtar.patch \
+           "
+
+S = "${WORKDIR}/${BPN}"
+
+SRC_URI[md5sum] = "6ced95ab3a4b33fbfe2dfb231d156cdb"
+SRC_URI[sha256sum] = "50f24c857a7ef1cb092e6508758b86d06f1188508f897f3e6b40c573e8879109"
+
+inherit autotools-brokensep
+
+PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
-- 
2.8.1


