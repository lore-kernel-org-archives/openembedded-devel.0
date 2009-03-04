Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTe-0005OK-Fo
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:57:52 +0100
Received: (qmail 26116 invoked by uid 813007); 4 Mar 2009 15:53:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:33 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPS-0001Cf-BL; Wed, 04 Mar 2009 16:53:26 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:17 +0100
Message-Id: <1236182004-4523-3-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 02/70] rpm/rpm-native: Add recipe for 4.4.2.3 (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:35 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5069 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/rpm/files/cross_libpaths.patch |  145 +++++++++++++++++++++++++++++++
 packages/rpm/files/external-tools.patch |  108 +++++++++++++++++++++++
 packages/rpm/rpm-native_4.4.2.3.bb      |   10 ++
 packages/rpm/rpm_4.4.2.3.bb             |   84 ++++++++++++++++++
 4 files changed, 347 insertions(+), 0 deletions(-)
 create mode 100644 packages/rpm/files/cross_libpaths.patch
 create mode 100644 packages/rpm/files/external-tools.patch
 create mode 100644 packages/rpm/rpm-native_4.4.2.3.bb
 create mode 100644 packages/rpm/rpm_4.4.2.3.bb

diff --git a/packages/rpm/files/cross_libpaths.patch b/packages/rpm/files/cross_libpaths.patch
new file mode 100644
index 0000000..8cc34f2
--- /dev/null
+++ b/packages/rpm/files/cross_libpaths.patch
@@ -0,0 +1,145 @@
+Index: rpm-4.4.2.3/configure.ac
+===================================================================
+--- rpm-4.4.2.3.orig/configure.ac	2008-08-17 11:40:29.000000000 +0100
++++ rpm-4.4.2.3/configure.ac	2008-08-17 11:40:29.000000000 +0100
+@@ -326,10 +326,8 @@
+ 
+ localdone=
+ 
+-dirs=$prefix
+ if test "$cross_compiling" != "yes"; then
+-  dirs="$dirs /usr/local"
+-fi
++dirs="$prefix /usr/local"
+ for dir in $dirs
+ do
+ 	case $dir in
+@@ -371,6 +369,7 @@
+ else
+ 	AC_MSG_RESULT(no)
+ fi
++fi
+ 
+ dnl
+ dnl Check for features
+@@ -473,7 +472,7 @@
+     AC_CHECK_HEADER([beecrypt/api.h], [
+       AC_DEFINE(HAVE_BEECRYPT_API_H, 1, [Define to 1 if you have the <beecrypt/api.h> header file.])
+     ])
+-    WITH_BEECRYPT_INCLUDE="-I${includedir}/beecrypt"
++    WITH_BEECRYPT_INCLUDE=""
+     WITH_BEECRYPT_LIB="-lbeecrypt"
+   ])
+ ],[
+@@ -506,7 +505,7 @@
+     AC_CHECK_LIB(neon, ne_send_request_chunk, [
+ 	AC_DEFINE(HAVE_NEON_NE_SEND_REQUEST_CHUNK, 1, [Define to 1 if you have ne_send_request_chunk() in libneon.])
+     ])
+-    WITH_NEON_INCLUDE="-I${includedir}/neon"
++    WITH_NEON_INCLUDE=""
+     WITH_NEON_LIB="-lneon"
+   ])
+ ],[
+Index: rpm-4.4.2.3/rpmio/Makefile.am
+===================================================================
+--- rpm-4.4.2.3.orig/rpmio/Makefile.am	2008-04-01 08:28:22.000000000 +0100
++++ rpm-4.4.2.3/rpmio/Makefile.am	2008-08-17 11:40:29.000000000 +0100
+@@ -26,8 +26,6 @@
+ 
+ BEECRYPTLOBJS = $(shell test X"@WITH_BEECRYPT_SUBDIR@" != X && cat $(top_builddir)/@WITH_BEECTYPT_SUBDIR@/listobjs)
+ 
+-LDFLAGS = -L$(RPM_BUILD_ROOT)$(usrlibdir) -L$(DESTDIR)$(usrlibdir)
+-
+ usrlibdir = $(libdir)@MARK64@
+ usrlib_LTLIBRARIES = librpmio.la
+ librpmio_la_SOURCES = \
+Index: rpm-4.4.2.3/rpmio/rpmio_internal.h
+===================================================================
+--- rpm-4.4.2.3.orig/rpmio/rpmio_internal.h	2008-04-01 08:28:22.000000000 +0100
++++ rpm-4.4.2.3/rpmio/rpmio_internal.h	2008-08-17 11:40:29.000000000 +0100
+@@ -12,22 +12,22 @@
+ #if HAVE_BEECRYPT_API_H
+ #include <api.h>
+ #else
+-#include <beecrypt.api.h>
++#include <beecrypt/beecrypt.api.h>
+ #endif
+ 
+ #include <rpmpgp.h>
+ #include <rpmsw.h>
+ 
+ /* Drag in the beecrypt includes. */
+-#include <beecrypt.h>
+-#include <base64.h>
+-#include <dsa.h>
+-#include <endianness.h>
+-#include <md5.h>
+-#include <mp.h>
+-#include <rsa.h>
+-#include <rsapk.h>
+-#include <sha1.h>
++#include <beecrypt/beecrypt.h>
++#include <beecrypt/base64.h>
++#include <beecrypt/dsa.h>
++#include <beecrypt/endianness.h>
++#include <beecrypt/md5.h>
++#include <beecrypt/mp.h>
++#include <beecrypt/rsa.h>
++#include <beecrypt/rsapk.h>
++#include <beecrypt/sha1.h>
+ #if HAVE_BEECRYPT_API_H
+ #include <sha256.h>
+ #include <sha384.h>
+Index: rpm-4.4.2.3/Makefile.am
+===================================================================
+--- rpm-4.4.2.3.orig/Makefile.am	2008-08-17 11:42:36.000000000 +0100
++++ rpm-4.4.2.3/Makefile.am	2008-08-17 11:42:50.000000000 +0100
+@@ -10,7 +10,7 @@
+ 	po/*.in po/*.po po/rpm.pot \
+ 	rpm.magic rpmpopt-$(VERSION) rpmqv.c 
+ 
+-SUBDIRS = po misc @WITH_ZLIB_SUBDIR@ @WITH_ELFUTILS_SUBDIR@ @WITH_MAGIC_SUBDIR@ @WITH_DB_SUBDIR@ @WITH_SQLITE3_SUBDIR@ @WITH_POPT_SUBDIR@ @WITH_BEECRYPT_SUBDIR@ @WITH_NEON_SUBDIR@ lua rpmio rpmdb lib build @WITH_PYTHON_SUBDIR@ tools scripts doc .
++SUBDIRS = po misc @WITH_ZLIB_SUBDIR@ @WITH_ELFUTILS_SUBDIR@ @WITH_MAGIC_SUBDIR@ @WITH_DB_SUBDIR@ @WITH_SQLITE3_SUBDIR@ @WITH_POPT_SUBDIR@ @WITH_BEECRYPT_SUBDIR@ @WITH_NEON_SUBDIR@ rpmio rpmdb lib build @WITH_PYTHON_SUBDIR@ tools scripts doc .
+ 
+ INCLUDES = \
+ 	-I$(top_srcdir)/build \
+Index: rpm-4.4.2.3/rpmdb/Makefile.am
+===================================================================
+--- rpm-4.4.2.3.orig/rpmdb/Makefile.am	2008-08-17 11:43:36.000000000 +0100
++++ rpm-4.4.2.3/rpmdb/Makefile.am	2008-08-17 11:43:57.000000000 +0100
+@@ -41,9 +41,6 @@
+ # XXX watchout, ../db3/libdb.la created by this Makefile may surprise
+ libdb_la = $(top_builddir)/$(WITH_DB_SUBDIR)/libdb.la
+ 
+-# XXX grrr, RPM_BUILD_ROOT prevents build pollution if/when -lrpm different
+-LDFLAGS = -L$(RPM_BUILD_ROOT)$(usrlibdir) -L$(DESTDIR)$(usrlibdir)
+-
+ usrlibdir = $(libdir)@MARK64@
+ usrlib_LTLIBRARIES = librpmdb.la
+ librpmdb_la_SOURCES = \
+Index: rpm-4.4.2.3/lib/Makefile.am
+===================================================================
+--- rpm-4.4.2.3.orig/lib/Makefile.am	2008-08-17 11:46:43.000000000 +0100
++++ rpm-4.4.2.3/lib/Makefile.am	2008-08-17 11:46:51.000000000 +0100
+@@ -29,8 +29,6 @@
+ mylibs = librpm.la
+ LIBS =
+ 
+-LDFLAGS = -L$(RPM_BUILD_ROOT)$(usrlibdir) -L$(DESTDIR)$(usrlibdir)
+-
+ usrlibdir = $(libdir)@MARK64@
+ usrlib_LTLIBRARIES = librpm.la
+ librpm_la_SOURCES = \
+Index: rpm-4.4.2.3/build/Makefile.am
+===================================================================
+--- rpm-4.4.2.3.orig/build/Makefile.am	2008-08-17 11:47:37.000000000 +0100
++++ rpm-4.4.2.3/build/Makefile.am	2008-08-17 11:47:43.000000000 +0100
+@@ -22,8 +22,6 @@
+ pkginc_HEADERS = rpmbuild.h rpmfc.h rpmfile.h rpmspec.h
+ noinst_HEADERS = buildio.h
+ 
+-LDFLAGS = -L$(RPM_BUILD_ROOT)$(usrlibdir) -L$(DESTDIR)$(usrlibdir)
+-
+ usrlibdir = $(libdir)@MARK64@
+ usrlib_LTLIBRARIES = librpmbuild.la
+ librpmbuild_la_SOURCES = \
diff --git a/packages/rpm/files/external-tools.patch b/packages/rpm/files/external-tools.patch
new file mode 100644
index 0000000..e967b87
--- /dev/null
+++ b/packages/rpm/files/external-tools.patch
@@ -0,0 +1,108 @@
+Index: rpm-4.4.2.3/configure.ac
+===================================================================
+--- rpm-4.4.2.3.orig/configure.ac	2008-04-01 08:30:14.000000000 +0100
++++ rpm-4.4.2.3/configure.ac	2008-08-17 10:57:30.000000000 +0100
+@@ -529,7 +529,7 @@
+ WITH_MAGIC_INCLUDE=
+ WITH_MAGIC_LIB=
+ 
+-if test -d file ; then
++if test -d file_disabled ; then
+   WITH_RPMFILE=rpmfile
+   WITH_MAGIC_SUBDIR=file
+   WITH_MAGIC_INCLUDE="-I\${top_srcdir}/${WITH_MAGIC_SUBDIR}/src"
+@@ -1307,7 +1307,7 @@
+ dnl # XXX Propagate -lucb to popt ...
+ dnl export LIBS INCPATH CONFIG_SITE
+ 
+-AC_CONFIG_SUBDIRS(popt file db3)
++AC_CONFIG_SUBDIRS(db/dist)
+ 
+ AC_CONFIG_FILES([ Doxyfile Makefile rpmrc macros platform rpmpopt
+ 	rpmio/Makefile rpmdb/Makefile lib/Makefile build/Makefile
+Index: rpm-4.4.2.3/db/dist/configure.ac
+===================================================================
+--- rpm-4.4.2.3.orig/db/dist/configure.ac	2008-04-01 08:28:21.000000000 +0100
++++ rpm-4.4.2.3/db/dist/configure.ac	2008-08-17 09:54:37.000000000 +0100
+@@ -11,14 +11,6 @@
+ AC_CANONICAL_HOST()
+ AC_ARG_PROGRAM()
+ 
+-# Don't build in the top-level or dist directories.
+-AC_MSG_CHECKING(if building in the top-level or dist directories)
+-if [ test -d db_archive -o -f configure.ac ] ; then
+-	AC_MSG_RESULT(yes)
+-	AC_MSG_ERROR(
+-    [Berkeley DB should not be built in the top-level or dist directories.])
+-fi
+-AC_MSG_RESULT(no)
+ 
+ # Substitution variables.
+ AC_SUBST(ADDITIONAL_INCS)
+@@ -281,7 +273,7 @@
+ AC_PROG_LIBTOOL
+ 
+ SOFLAGS="-rpath \$(libdir)"
+-LIBTOOL_PROG="${SHELL} ./libtool"
++LIBTOOL_PROG="${SHELL} ./$host_alias-libtool"
+ 
+ # Set SOSUFFIX and friends
+ SOSUFFIX_CONFIG
+@@ -297,7 +289,7 @@
+ MAKEFILE_XSOLINK="\$(LIBTOOL) --mode=link ${MAKEFILE_CXXLINK} -avoid-version"
+ MAKEFILE_CXXLINK="\$(LIBTOOL) --mode=link ${MAKEFILE_CXXLINK}"
+ 
+-LIBTOOL="\$(SHELL) ./libtool"
++LIBTOOL="\$(SHELL) ./$host_alias-libtool"
+ 
+ case "$host_os" in
+ cygwin* | mingw*)
+Index: rpm-4.4.2.3/db/dist/aclocal/options.ac
+===================================================================
+--- rpm-4.4.2.3.orig/db/dist/aclocal/options.ac	2008-08-17 09:57:49.000000000 +0100
++++ rpm-4.4.2.3/db/dist/aclocal/options.ac	2008-08-17 09:57:59.000000000 +0100
+@@ -277,10 +277,6 @@
+ 
+ # Uniquename excludes C++, Java, RPC.
+ if test "$db_cv_uniquename" = "yes"; then
+-	if test "$db_cv_rpc" = "yes"; then
+-		AC_MSG_ERROR(
+-		    [--with-uniquename is not compatible with --enable-rpc])
+-	fi
+ 	if test "$db_cv_cxx" = "yes"; then
+ 		AC_MSG_ERROR(
+ 		    [--with-uniquename is not compatible with --enable-cxx])
+Index: rpm-4.4.2.3/db/dist/aclocal/rpc.ac
+===================================================================
+--- rpm-4.4.2.3.orig/db/dist/aclocal/rpc.ac	2008-08-17 10:46:26.000000000 +0100
++++ rpm-4.4.2.3/db/dist/aclocal/rpc.ac	2008-08-17 10:46:47.000000000 +0100
+@@ -60,6 +60,7 @@
+ 	    -e 's/^}/__dbsrv_timeout(0);}/' \
+ 	    -e '}' \
+ 	    -e '1,/^#include/s/^#include/#include "db_config.h"\
++#include "db_int_def.h"\
+ &/' > db_server_svc.c
+ 
+ 	$RPCGEN -c $XDR_FILE |
+Index: rpm-4.4.2.3/tools/rpmfile.c
+===================================================================
+--- rpm-4.4.2.3.orig/tools/rpmfile.c	2008-08-17 11:01:51.000000000 +0100
++++ rpm-4.4.2.3/tools/rpmfile.c	2008-08-17 11:03:07.000000000 +0100
+@@ -29,7 +29,7 @@
+  * file - find type of a file or files - main program.
+  */
+ 
+-#include "file.h"
++#include "../file/src/file.h"
+ #include "magic.h"
+ 
+ #include <stdio.h>
+@@ -69,7 +69,7 @@
+ 
+ #include <netinet/in.h>		/* for byte swapping */
+ 
+-#include "patchlevel.h"
++#include "../file/src/patchlevel.h"
+ 
+ #ifndef	lint
+ FILE_RCSID("@(#)$Id: file.c,v 1.96 2005/03/06 05:58:22 christos Exp $")
diff --git a/packages/rpm/rpm-native_4.4.2.3.bb b/packages/rpm/rpm-native_4.4.2.3.bb
new file mode 100644
index 0000000..f122a47
--- /dev/null
+++ b/packages/rpm/rpm-native_4.4.2.3.bb
@@ -0,0 +1,10 @@
+require rpm_${PV}.bb
+inherit native
+
+DEPENDS = "beecrypt-native zlib-native file-native popt-native"
+
+PR = "r2"
+
+export sharedstatedir = "${layout_sharedstatedir}"
+export localstatedir = "${layout_localstatedir}"
+
diff --git a/packages/rpm/rpm_4.4.2.3.bb b/packages/rpm/rpm_4.4.2.3.bb
new file mode 100644
index 0000000..b04b500
--- /dev/null
+++ b/packages/rpm/rpm_4.4.2.3.bb
@@ -0,0 +1,84 @@
+DESCRIPTION = "The RPM Package Manager."
+HOMEPAGE = "http://rpm.org/"
+LICENSE = "LGPL GPL"
+DEPENDS = "zlib beecrypt file popt"
+PR = "r1"
+
+SRC_URI = "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.4.2.3.tar.gz \
+           file://external-tools.patch;patch=1 \
+	   file://cross_libpaths.patch;patch=1"
+
+inherit autotools gettext
+
+S = "${WORKDIR}/rpm-${PV}"
+
+acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
+
+EXTRA_OECONF = "--without-python \
+		--without-apidocs \
+		--without-selinux \
+		--without-lua \
+		--without-dmalloc \
+		--without-efence"
+
+# Handle the db MUTEX settings here, the POSIX library is
+# the default - "POSIX/pthreads/library".
+# Don't ignore the nice SWP instruction on the ARM:
+# These enable the ARM assembler mutex code, this won't
+# work with thumb compilation...
+ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
+MUTEX = ""
+MUTEX_arm = "${ARM_MUTEX}"
+MUTEX_armeb = "${ARM_MUTEX}"
+EXTRA_OECONF += "${MUTEX}"
+
+do_configure () {
+	rm ${S}/popt/ -Rf
+	rm ${S}/db/dist/configure.in -f
+	cd ${S}/db/dist/aclocal
+	rm libtool* -f
+	for i in `ls *.ac`; do
+	    j=`echo $i | sed 's/.ac/.m4/g'`
+	    mv $i $j
+	done
+	cd ${S}/db/dist/aclocal_java
+	for i in `ls *.ac`; do
+	    j=`echo $i | sed 's/.ac/.m4/g'`
+	    mv $i $j
+	done
+	cd ${S}
+	autotools_do_configure
+	cd ${S}/db/dist
+	. ./RELEASE
+	# Edit version information we couldn't pre-compute.
+	(echo "1,\$s/__EDIT_DB_VERSION_MAJOR__/$DB_VERSION_MAJOR/g" &&
+	 echo "1,\$s/__EDIT_DB_VERSION_MINOR__/$DB_VERSION_MINOR/g" &&
+	 echo "1,\$s/__EDIT_DB_VERSION_PATCH__/$DB_VERSION_PATCH/g" &&
+	 echo "1,\$s/__EDIT_DB_VERSION_STRING__/$DB_VERSION_STRING/g" &&
+	 echo "1,\$s/__EDIT_DB_VERSION_UNIQUE_NAME__/$DB_VERSION_UNIQUE_NAME/g" &&
+	 echo "1,\$s/__EDIT_DB_VERSION__/$DB_VERSION/g" &&
+	 echo "w" &&
+	 echo "q") | ed configure
+	cd ${S}/db3
+	${S}/db3/configure \
+		    --build=${BUILD_SYS} \
+		    --host=${HOST_SYS} \
+		    --target=${TARGET_SYS} \
+		    --prefix=${prefix} \
+		    --exec_prefix=${exec_prefix} \
+		    --bindir=${bindir} \
+		    --sbindir=${sbindir} \
+		    --libexecdir=${libexecdir} \
+		    --datadir=${datadir} \
+		    --sysconfdir=${sysconfdir} \
+		    --sharedstatedir=${sharedstatedir} \
+		    --localstatedir=${localstatedir} \
+		    --libdir=${libdir} \
+		    --includedir=${includedir} \
+		    --oldincludedir=${oldincludedir} \
+		    --infodir=${infodir} \
+		    --mandir=${mandir} \
+		    ${EXTRA_OECONF} \
+		    --with-pic
+
+}
-- 
1.6.1.3





