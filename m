Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhlX7-0004hM-Rc
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 18:46:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2011 09:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,209,1309762800"; d="scan'208";a="27701921"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.182])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2011 09:42:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2011 17:42:05 +0100
Message-Id: <ecff458fdec23038c7ccfc46b08e89ba60572ce0.1310748001.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310748001.git.paul.eggleton@linux.intel.com>
References: <cover.1310748001.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310748001.git.paul.eggleton@linux.intel.com>
References: <cover.1310748001.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 3/5] libgcrypt: turn into a bbappend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jul 2011 16:46:34 -0000

The only meaningful difference was a BBCLASSEXTEND so move this to a
bbappend file.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/libgcrypt/libgcrypt.inc    |   32 -------------
 .../libgcrypt/add-pkgconfig-support.patch          |   49 --------------------
 .../recipes-support/libgcrypt/libgcrypt_1.4.6.bb   |    3 -
 .../libgcrypt/libgcrypt_1.4.6.bbappend             |    2 +
 4 files changed, 2 insertions(+), 84 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgcrypt/libgcrypt.inc
 delete mode 100644 meta-oe/recipes-support/libgcrypt/libgcrypt/add-pkgconfig-support.patch
 delete mode 100644 meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bb
 create mode 100644 meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bbappend

diff --git a/meta-oe/recipes-support/libgcrypt/libgcrypt.inc b/meta-oe/recipes-support/libgcrypt/libgcrypt.inc
deleted file mode 100644
index 8eb78a9..0000000
--- a/meta-oe/recipes-support/libgcrypt/libgcrypt.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "A general purpose cryptographic library based on the code from GnuPG"
-HOMEPAGE = "http://directory.fsf.org/project/libgcrypt/"
-BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
-SECTION = "libs"
-
-BBCLASSEXTEND = "native"
-
-# helper program gcryptrnd and getrandom are under GPL, rest LGPL
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
-
-DEPENDS = "libgpg-error"
-
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
-           file://add-pkgconfig-support.patch"
-
-inherit autotools binconfig pkgconfig
-
-EXTRA_OECONF = "--without-pth --disable-asm --with-capabilities"
-
-# libgcrypt.pc is added locally and thus installed here
-do_install_append() {
-	install -d ${D}/${libdir}/pkgconfig
-	install -m 0644 ${S}/src/libgcrypt.pc ${D}/${libdir}/pkgconfig/
-}
-
-ARM_INSTRUCTION_SET = "arm"
-
-# move libgcrypt-config into -dev package
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${bindir} ${libdir}/pkgconfig/*.pc"
diff --git a/meta-oe/recipes-support/libgcrypt/libgcrypt/add-pkgconfig-support.patch b/meta-oe/recipes-support/libgcrypt/libgcrypt/add-pkgconfig-support.patch
deleted file mode 100644
index 24a5978..0000000
--- a/meta-oe/recipes-support/libgcrypt/libgcrypt/add-pkgconfig-support.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Index: libgcrypt-1.2.4/configure.ac
-===================================================================
---- libgcrypt-1.2.4.orig/configure.ac	2008-03-19 22:14:50.000000000 +0000
-+++ libgcrypt-1.2.4/configure.ac	2008-03-19 22:14:58.000000000 +0000
-@@ -807,6 +807,7 @@
- doc/Makefile
- src/Makefile
- src/gcrypt.h
-+src/libgcrypt.pc
- src/libgcrypt-config
- tests/Makefile
- w32-dll/Makefile
-Index: libgcrypt-1.2.4/src/libgcrypt.pc.in
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libgcrypt-1.2.4/src/libgcrypt.pc.in	2008-03-19 22:14:58.000000000 +0000
-@@ -0,0 +1,32 @@
-+# Process this file with autoconf to produce a pkg-config metadata file.
-+# Copyright (C) 2002, 2003, 2004, 2005, 2006 Free Software Foundation
-+# Author: Simon Josefsson
-+#
-+# This file is free software; as a special exception the author gives
-+# unlimited permission to copy and/or distribute it, with or without
-+# modifications, as long as this notice is preserved.
-+#
-+# This file is distributed in the hope that it will be useful, but
-+# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
-+# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-+
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+
-+# API info
-+api_version=@LIBGCRYPT_CONFIG_API_VERSION@
-+
-+# Misc information.
-+symmetric_ciphers=@LIBGCRYPT_CIPHERS@
-+asymmetric_ciphers=@LIBGCRYPT_PUBKEY_CIPHERS@
-+digests=@LIBGCRYPT_DIGESTS@
-+
-+Name: libgcrypt
-+Description: GNU crypto library
-+URL: http://www.gnupg.org
-+Version: @VERSION@
-+Libs: -L${libdir} -lgcrypt
-+Libs.private: -L${libdir} -lgpg-error
-+Cflags: -I${includedir} 
diff --git a/meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bb b/meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bb
deleted file mode 100644
index a592437..0000000
--- a/meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require libgcrypt.inc
-
-PR = "r0"
diff --git a/meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bbappend b/meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bbappend
new file mode 100644
index 0000000..d9172b4
--- /dev/null
+++ b/meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bbappend
@@ -0,0 +1,2 @@
+BBCLASSEXTEND = "native"
+
-- 
1.7.4.1



