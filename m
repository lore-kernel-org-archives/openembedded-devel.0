Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UFtPZ-00015L-Ft
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 22:40:37 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Mar 2013 22:23:46 +0100
Message-Id: <1363209826-5929-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] xfsprogs: fix compile with uclibc
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
X-List-Received-Date: Wed, 13 Mar 2013 21:40:38 -0000

Uclibc doesn't have aio.h, which xfsprogs checks for.
However, xfsprogs doesn't use aio.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../drop-configure-check-for-aio.patch             |   99 ++++++++++++++++++++
 meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb |   10 +-
 2 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/drop-configure-check-for-aio.patch

diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/drop-configure-check-for-aio.patch b/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/drop-configure-check-for-aio.patch
new file mode 100644
index 0000000..a1c6042
--- /dev/null
+++ b/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/drop-configure-check-for-aio.patch
@@ -0,0 +1,99 @@
+Upstream-Status: Pending
+
+From a38bf800a655ea32cbddd6504e15c2f18597fd13 Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Wed, 13 Mar 2013 14:40:13 +0100
+Subject: [PATCH] xfsprogs: drop configure check for aio
+
+It's unused and breaks compilation with uclibc.
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+---
+ configure.in         |    6 +++---
+ m4/Makefile          |    1 -
+ m4/package_aiodev.m4 |   37 -------------------------------------
+ 3 files changed, 3 insertions(+), 41 deletions(-)
+ delete mode 100644 m4/package_aiodev.m4
+
+diff --git a/configure.in b/configure.in
+index 664c0e9..f7d35f1 100644
+--- a/configure.in
++++ b/configure.in
+@@ -46,6 +46,9 @@ AC_ARG_ENABLE(lib64,
+ 	enable_lib64=yes)
+ AC_SUBST(enable_lib64)
+ 
++librt="-lrt"
++AC_SUBST(librt)
++
+ #
+ # If the user specified a libdir ending in lib64 do not append another
+ # 64 to the library names.
+@@ -91,9 +94,6 @@ AC_PACKAGE_GLOBALS(xfsprogs)
+ AC_PACKAGE_UTILITIES(xfsprogs)
+ AC_MULTILIB($enable_lib64)
+ 
+-AC_PACKAGE_NEED_AIO_H
+-AC_PACKAGE_NEED_LIO_LISTIO
+-
+ AC_PACKAGE_NEED_UUID_H
+ AC_PACKAGE_NEED_UUIDCOMPARE
+ 
+diff --git a/m4/Makefile b/m4/Makefile
+index 654a4fb..d282f0a 100644
+--- a/m4/Makefile
++++ b/m4/Makefile
+@@ -14,7 +14,6 @@ CONFIGURE = \
+ 
+ LSRCFILES = \
+ 	manual_format.m4 \
+-	package_aiodev.m4 \
+ 	package_blkid.m4 \
+ 	package_globals.m4 \
+ 	package_libcdev.m4 \
+diff --git a/m4/package_aiodev.m4 b/m4/package_aiodev.m4
+deleted file mode 100644
+index 490d9c8..0000000
+--- a/m4/package_aiodev.m4
++++ /dev/null
+@@ -1,37 +0,0 @@
+-#
+-# Check if we have a libaio.h installed
+-#
+-AC_DEFUN([AC_PACKAGE_WANT_AIO],
+-  [ AC_CHECK_HEADERS(libaio.h, [ have_aio=true ], [ have_aio=false ])
+-    AC_SUBST(have_aio)
+-  ])
+-
+-#
+-# Check if we have an aio.h installed
+-#
+-AC_DEFUN([AC_PACKAGE_NEED_AIO_H],
+-  [ AC_CHECK_HEADERS(aio.h)
+-    if test $ac_cv_header_aio_h = no; then
+-	echo
+-	echo 'FATAL ERROR: could not find a valid <aio.h> header.'
+-	exit 1
+-    fi
+-  ])
+-
+-#
+-# Check if we have the lio_listio routine in either libc/librt
+-#
+-AC_DEFUN([AC_PACKAGE_NEED_LIO_LISTIO],
+-  [ AC_CHECK_FUNCS(lio_listio)
+-    if test $ac_cv_func_lio_listio = yes; then
+-	librt=""
+-    else
+-	AC_CHECK_LIB(rt, lio_listio,, [
+-	    echo
+-	    echo 'FATAL ERROR: could not find a library with lio_listio.'
+-	    exit 1],[-lpthread])
+-	librt="-lrt"
+-    fi
+-    AC_SUBST(librt)
+-  ])
+-
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb
index f83561d..ef5224b 100644
--- a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb
+++ b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb
@@ -5,10 +5,11 @@ LICENSE = "GPLv2"
 LICENSE_libhandle = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
 DEPENDS = "util-linux"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz \
 	file://remove-install-as-user.patch \
+	file://drop-configure-check-for-aio.patch \
 "
 
 SRC_URI[md5sum] = "f70b2e7200d4c29f0af1cf70e7be1db6"
@@ -26,6 +27,13 @@ FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
 
 EXTRA_OECONF = "--enable-gettext=no"
 do_configure () {
+	# Prevent Makefile from calling configure without arguments,
+	# when do_configure gets called for a second time.
+	rm -f include/builddefs include/platform_defs.h
+	# Recreate configure script.
+	rm -f configure
+	oe_runmake configure
+	# Configure.
 	export DEBUG="-DNDEBUG"
 	gnu-configize --force
 	oe_runconf
-- 
1.7.10.4



