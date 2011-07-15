Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhlX9-0004hM-8T
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 18:46:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2011 09:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,209,1309762800"; d="scan'208";a="27701934"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.182])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2011 09:42:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2011 17:42:07 +0100
Message-Id: <c4b7c85a0e7aeec26071047ab8a9131e0cbfd84f.1310748001.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310748001.git.paul.eggleton@linux.intel.com>
References: <cover.1310748001.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310748001.git.paul.eggleton@linux.intel.com>
References: <cover.1310748001.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 5/5] libgpg-error: switch over to a bbappend
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
X-List-Received-Date: Fri, 15 Jul 2011 16:46:35 -0000

Updates meta-oe to libgpg-error 1.10.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../libgpg-error/libgpg-error-1.8/pkgconfig.patch  |   53 --------------------
 .../libgpg-error/libgpg-error_1.10.bbappend        |    2 +
 .../libgpg-error/libgpg-error_1.8.bb               |   26 ----------
 3 files changed, 2 insertions(+), 79 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpg-error/libgpg-error-1.8/pkgconfig.patch
 create mode 100644 meta-oe/recipes-support/libgpg-error/libgpg-error_1.10.bbappend
 delete mode 100644 meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb

diff --git a/meta-oe/recipes-support/libgpg-error/libgpg-error-1.8/pkgconfig.patch b/meta-oe/recipes-support/libgpg-error/libgpg-error-1.8/pkgconfig.patch
deleted file mode 100644
index 49e47d8..0000000
--- a/meta-oe/recipes-support/libgpg-error/libgpg-error-1.8/pkgconfig.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
-Index: libgpg-error-1.8/configure.ac
-===================================================================
---- libgpg-error-1.8.orig/configure.ac	2010-05-06 06:01:08.000000000 -0700
-+++ libgpg-error-1.8/configure.ac	2010-07-21 02:20:20.923261305 -0700
-@@ -140,6 +140,7 @@
- AC_SUBST(GPG_ERROR_CONFIG_CFLAGS)
- AC_SUBST(GPG_ERROR_CONFIG_ISUBDIRAFTER)
- AC_CONFIG_FILES([src/gpg-error-config], [chmod +x src/gpg-error-config])
-+AC_CONFIG_FILES([src/gpg-error.pc])
- 
- 
- # Special defines for certain platforms
-Index: libgpg-error-1.8/src/Makefile.am
-===================================================================
---- libgpg-error-1.8.orig/src/Makefile.am	2010-04-14 02:16:44.000000000 -0700
-+++ libgpg-error-1.8/src/Makefile.am	2010-07-21 02:22:36.655012496 -0700
-@@ -37,13 +37,15 @@
- bin_SCRIPTS = gpg-error-config
- m4datadir = $(datadir)/aclocal
- m4data_DATA = gpg-error.m4
-+pkgconfigdir = $(libdir)/pkgconfig
-+pkgconfig_DATA = gpg-error.pc
- 
- EXTRA_DIST = mkstrtable.awk err-sources.h.in err-codes.h.in \
- 	mkerrnos.awk errnos.in README \
- 	mkerrcodes.awk mkerrcodes1.awk mkerrcodes2.awk mkerrcodes.c \
- 	mkheader.awk gpg-error.h.in mkw32errmap.c w32-add.h w32ce-add.h \
- 	err-sources.h err-codes.h gpg-error-config.in gpg-error.m4 \
--	gpg-error.def.in versioninfo.rc.in
-+	gpg-error.def.in versioninfo.rc.in gpg-error.pc.in
- 
- BUILT_SOURCES = err-sources.h err-codes.h code-to-errno.h code-from-errno.h \
- 	err-sources-sym.h err-codes-sym.h errnos-sym.h gpg-error.h \
-Index: libgpg-error-1.8/src/gpg-error.pc.in
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libgpg-error-1.8/src/gpg-error.pc.in	2010-07-21 02:20:20.923261305 -0700
-@@ -0,0 +1,10 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+
-+Name: gpg-error
-+Description: a library that defines common error values for all GnuPG components
-+Version: @VERSION@
-+Libs: -L{libdir} -lgpg-error
-+Cflags: -I${includedir}
diff --git a/meta-oe/recipes-support/libgpg-error/libgpg-error_1.10.bbappend b/meta-oe/recipes-support/libgpg-error/libgpg-error_1.10.bbappend
new file mode 100644
index 0000000..d9172b4
--- /dev/null
+++ b/meta-oe/recipes-support/libgpg-error/libgpg-error_1.10.bbappend
@@ -0,0 +1,2 @@
+BBCLASSEXTEND = "native"
+
diff --git a/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb b/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb
deleted file mode 100644
index 321c7b8..0000000
--- a/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "a small library that defines common error values for all GnuPG components"
-HOMEPAGE = "http://www.gnupg.org/related_software/libgpg-error/"
-BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
-
-BBCLASSEXTEND = "native"
-
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h;endline=23;md5=83c16c8f5cea85affa1ff270a6f4fcff \
-                    file://src/init.c;endline=20;md5=b69742f2a8827d494c6f6a4b1768416c"
-SRC_URI[md5sum] = "1d2005268a2f096db28cf9cf77b3229a"
-SRC_URI[sha256sum] = "bdfbf2677147239d2d26d4e37f44635d9fd97c133c9ef9fd9793a12a059508c5"
-
-SECTION = "libs"
-LICENSE = "GPLv2+ & LGPLv2.1+"
-PR = "r0"
-
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
-           file://pkgconfig.patch;"
-
-# move libgpg-error-config into -dev package
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${bindir}/*"
-
-inherit autotools binconfig pkgconfig gettext
-- 
1.7.4.1



