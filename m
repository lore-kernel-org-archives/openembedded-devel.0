Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTg-0005OM-2c
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:57:52 +0100
Received: (qmail 26255 invoked by uid 813007); 4 Mar 2009 15:53:35 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:35 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPU-0001Ck-01; Wed, 04 Mar 2009 16:53:28 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:19 +0100
Message-Id: <1236182004-4523-5-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 04/70] rpm: Enable python extensions and improve cross compiling patches (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:35 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5093 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/rpm/files/cross_libpaths.patch |  140 +++++++++++++++++++++++++------
 packages/rpm/files/external-tools.patch |    4 +-
 packages/rpm/rpm-native_4.4.2.3.bb      |    3 +-
 packages/rpm/rpm_4.4.2.3.bb             |   18 ++++-
 4 files changed, 133 insertions(+), 32 deletions(-)

diff --git a/packages/rpm/files/cross_libpaths.patch b/packages/rpm/files/cross_libpaths.patch
index 4fed9b7..798db15 100644
--- a/packages/rpm/files/cross_libpaths.patch
+++ b/packages/rpm/files/cross_libpaths.patch
@@ -1,7 +1,7 @@
 Index: rpm-4.4.2.3/configure.ac
 ===================================================================
---- rpm-4.4.2.3.orig/configure.ac	2008-08-18 10:25:14.000000000 +0100
-+++ rpm-4.4.2.3/configure.ac	2008-08-18 10:25:14.000000000 +0100
+--- rpm-4.4.2.3.orig/configure.ac	2008-08-23 16:03:51.000000000 +0100
++++ rpm-4.4.2.3/configure.ac	2008-08-25 16:26:11.000000000 +0100
 @@ -326,10 +326,8 @@
  
  localdone=
@@ -40,23 +40,47 @@ Index: rpm-4.4.2.3/configure.ac
      WITH_NEON_LIB="-lneon"
    ])
  ],[
+@@ -857,6 +856,12 @@
+ dnl
+ dnl Auto-detect which python bindings should be built.
+ dnl
++
++AC_ARG_WITH(python-incdir, [  --with-python-incdir    python include directory ])
++PYTHON_INCDIR=$withval
++AC_ARG_WITH(python-libdir, [  --with-python-libdir    python library directory ])
++PYTHON_LIBDIR=$withval
++
+ withval=auto
+ AC_ARG_WITH(python, [  --with-python           build rpm python bindings ])
+ 
+@@ -934,6 +939,8 @@
+ AC_SUBST(WITH_PYTHON_SUBDIR)
+ AC_SUBST(WITH_PYTHON_SUBPACKAGE)
+ AC_SUBST(WITH_PYTHON_VERSION)
++AC_SUBST(PYTHON_LIBDIR)
++AC_SUBST(PYTHON_INCDIR)
+ 
+ AC_PATH_PROG(__DOXYGEN, doxygen, no, $PATH)
+ dnl
 Index: rpm-4.4.2.3/rpmio/Makefile.am
 ===================================================================
 --- rpm-4.4.2.3.orig/rpmio/Makefile.am	2008-04-01 08:28:22.000000000 +0100
-+++ rpm-4.4.2.3/rpmio/Makefile.am	2008-08-18 10:25:14.000000000 +0100
-@@ -26,8 +26,6 @@
++++ rpm-4.4.2.3/rpmio/Makefile.am	2008-08-23 12:14:12.000000000 +0100
+@@ -26,9 +26,7 @@
  
  BEECRYPTLOBJS = $(shell test X"@WITH_BEECRYPT_SUBDIR@" != X && cat $(top_builddir)/@WITH_BEECTYPT_SUBDIR@/listobjs)
  
 -LDFLAGS = -L$(RPM_BUILD_ROOT)$(usrlibdir) -L$(DESTDIR)$(usrlibdir)
 -
- usrlibdir = $(libdir)@MARK64@
+-usrlibdir = $(libdir)@MARK64@
++usrlibdir = $(libdir)
  usrlib_LTLIBRARIES = librpmio.la
  librpmio_la_SOURCES = \
+ 	argv.c digest.c fts.c macro.c rpmdav.c \
 Index: rpm-4.4.2.3/rpmio/rpmio_internal.h
 ===================================================================
 --- rpm-4.4.2.3.orig/rpmio/rpmio_internal.h	2008-04-01 08:28:22.000000000 +0100
-+++ rpm-4.4.2.3/rpmio/rpmio_internal.h	2008-08-18 10:25:14.000000000 +0100
++++ rpm-4.4.2.3/rpmio/rpmio_internal.h	2008-08-23 12:07:29.000000000 +0100
 @@ -12,22 +12,22 @@
  #if HAVE_BEECRYPT_API_H
  #include <api.h>
@@ -93,7 +117,7 @@ Index: rpm-4.4.2.3/rpmio/rpmio_internal.h
 Index: rpm-4.4.2.3/Makefile.am
 ===================================================================
 --- rpm-4.4.2.3.orig/Makefile.am	2008-04-01 08:28:21.000000000 +0100
-+++ rpm-4.4.2.3/Makefile.am	2008-08-20 08:26:44.000000000 +0100
++++ rpm-4.4.2.3/Makefile.am	2008-08-23 12:07:29.000000000 +0100
 @@ -10,7 +10,7 @@
  	po/*.in po/*.po po/rpm.pot \
  	rpm.magic rpmpopt-$(VERSION) rpmqv.c 
@@ -103,52 +127,118 @@ Index: rpm-4.4.2.3/Makefile.am
  
  INCLUDES = \
  	-I$(top_srcdir)/build \
-@@ -93,7 +93,7 @@
- rpm2cpio_LDFLAGS =	$(myLDFLAGS)
- rpm2cpio_LDADD =	$(myLDADD) @LIBMISC@
- 
--$(PROGRAMS): 		$(myLDADD) @WITH_APIDOCS_TARGET@
-+$(PROGRAMS): 		@WITH_APIDOCS_TARGET@
- 
- .PHONY:	splint
- splint:
 Index: rpm-4.4.2.3/rpmdb/Makefile.am
 ===================================================================
 --- rpm-4.4.2.3.orig/rpmdb/Makefile.am	2008-04-01 08:28:22.000000000 +0100
-+++ rpm-4.4.2.3/rpmdb/Makefile.am	2008-08-18 10:25:14.000000000 +0100
-@@ -41,9 +41,6 @@
++++ rpm-4.4.2.3/rpmdb/Makefile.am	2008-08-23 12:13:18.000000000 +0100
+@@ -41,10 +41,7 @@
  # XXX watchout, ../db3/libdb.la created by this Makefile may surprise
  libdb_la = $(top_builddir)/$(WITH_DB_SUBDIR)/libdb.la
  
 -# XXX grrr, RPM_BUILD_ROOT prevents build pollution if/when -lrpm different
 -LDFLAGS = -L$(RPM_BUILD_ROOT)$(usrlibdir) -L$(DESTDIR)$(usrlibdir)
 -
- usrlibdir = $(libdir)@MARK64@
+-usrlibdir = $(libdir)@MARK64@
++usrlibdir = $(libdir)
  usrlib_LTLIBRARIES = librpmdb.la
  librpmdb_la_SOURCES = \
+ 	dbconfig.c fprint.c \
 Index: rpm-4.4.2.3/lib/Makefile.am
 ===================================================================
 --- rpm-4.4.2.3.orig/lib/Makefile.am	2008-04-01 08:28:22.000000000 +0100
-+++ rpm-4.4.2.3/lib/Makefile.am	2008-08-18 10:25:14.000000000 +0100
-@@ -29,8 +29,6 @@
++++ rpm-4.4.2.3/lib/Makefile.am	2008-08-23 16:03:51.000000000 +0100
+@@ -29,9 +29,7 @@
  mylibs = librpm.la
  LIBS =
  
 -LDFLAGS = -L$(RPM_BUILD_ROOT)$(usrlibdir) -L$(DESTDIR)$(usrlibdir)
 -
- usrlibdir = $(libdir)@MARK64@
+-usrlibdir = $(libdir)@MARK64@
++usrlibdir = $(libdir)
  usrlib_LTLIBRARIES = librpm.la
  librpm_la_SOURCES = \
+ 	cpio.c depends.c formats.c fs.c fsm.c getdate.c \
 Index: rpm-4.4.2.3/build/Makefile.am
 ===================================================================
 --- rpm-4.4.2.3.orig/build/Makefile.am	2008-04-01 08:28:21.000000000 +0100
-+++ rpm-4.4.2.3/build/Makefile.am	2008-08-18 10:25:14.000000000 +0100
-@@ -22,8 +22,6 @@
++++ rpm-4.4.2.3/build/Makefile.am	2008-08-23 16:03:51.000000000 +0100
+@@ -22,9 +22,7 @@
  pkginc_HEADERS = rpmbuild.h rpmfc.h rpmfile.h rpmspec.h
  noinst_HEADERS = buildio.h
  
 -LDFLAGS = -L$(RPM_BUILD_ROOT)$(usrlibdir) -L$(DESTDIR)$(usrlibdir)
 -
- usrlibdir = $(libdir)@MARK64@
+-usrlibdir = $(libdir)@MARK64@
++usrlibdir = $(libdir)
  usrlib_LTLIBRARIES = librpmbuild.la
  librpmbuild_la_SOURCES = \
+ 	build.c expression.c files.c misc.c names.c pack.c \
+Index: rpm-4.4.2.3/python/Makefile.am
+===================================================================
+--- rpm-4.4.2.3.orig/python/Makefile.am	2008-04-01 08:28:22.000000000 +0100
++++ rpm-4.4.2.3/python/Makefile.am	2008-08-25 16:26:56.000000000 +0100
+@@ -4,8 +4,8 @@
+ 
+ LINT = splint
+ 
+-pylibdir = ${prefix}/lib@MARK64@/python@WITH_PYTHON_VERSION@
+-pyincdir = $(prefix)/include/python@WITH_PYTHON_VERSION@
++pylibdir = @PYTHON_LIBDIR@
++pyincdir = @PYTHON_INCDIR@
+ 
+ SUBDIRS = rpm
+ 
+Index: rpm-4.4.2.3/python/rpm/Makefile.am
+===================================================================
+--- rpm-4.4.2.3.orig/python/rpm/Makefile.am	2008-04-01 08:28:22.000000000 +0100
++++ rpm-4.4.2.3/python/rpm/Makefile.am	2008-08-25 16:27:29.000000000 +0100
+@@ -4,8 +4,8 @@
+ 
+ PYVER = @WITH_PYTHON_VERSION@
+ 
+-pylibdir = ${prefix}/lib@MARK64@/python@WITH_PYTHON_VERSION@
+-pyincdir = $(prefix)/include/python@WITH_PYTHON_VERSION@
++pylibdir = @PYTHON_LIBDIR@
++pyincdir = @PYTHON_INCDIR@
+ 
+ EXTRA_DIST = \
+ 	__init__.py
+Index: rpm-4.4.2.3/file/src/Makefile.am
+===================================================================
+--- rpm-4.4.2.3.orig/file/src/Makefile.am	2008-08-23 16:06:25.000000000 +0100
++++ rpm-4.4.2.3/file/src/Makefile.am	2008-08-23 16:06:39.000000000 +0100
+@@ -4,7 +4,7 @@
+ EXTRA_DIST = test.c
+ 
+ # XXX Make sure compress.c links internal zlib
+-INCLUDES = -I. -I ../../zlib
++INCLUDES = -I. 
+ 
+ pkglibdir =  @prefix@/lib/rpm
+ MAGIC    = $(pkglibdir)/magic
+@@ -26,7 +26,7 @@
+ 
+ noinst_PROGRAMS = file
+ file_SOURCES = file.c
+-file_LDFLAGS = -L../../zlib # -all-static
++#file_LDFLAGS = -L../../zlib # -all-static
+ file_LDADD = libmagic.la
+ 
+ listobjs:
+Index: rpm-4.4.2.3/file/magic/Makefile.am
+===================================================================
+--- rpm-4.4.2.3.orig/file/magic/Makefile.am	2008-08-25 16:14:47.000000000 +0100
++++ rpm-4.4.2.3/file/magic/Makefile.am	2008-08-25 16:15:02.000000000 +0100
+@@ -18,10 +18,10 @@
+ 	done >> $@
+ 
+ magic.mgc: magic
+-	$(top_builddir)/src/file -C -m magic
++	file -C -m magic
+ 
+ magic.mime.mgc: magic.mime
+-	$(top_builddir)/src/file -C -m $(srcdir)/magic.mime
++	file -C -m $(srcdir)/magic.mime
+ 
+ magic_FRAGMENTS = \
+ Magdir/acorn \
diff --git a/packages/rpm/files/external-tools.patch b/packages/rpm/files/external-tools.patch
index e967b87..2b2ff70 100644
--- a/packages/rpm/files/external-tools.patch
+++ b/packages/rpm/files/external-tools.patch
@@ -7,7 +7,7 @@ Index: rpm-4.4.2.3/configure.ac
  WITH_MAGIC_LIB=
  
 -if test -d file ; then
-+if test -d file_disabled ; then
++if test -d file  ; then
    WITH_RPMFILE=rpmfile
    WITH_MAGIC_SUBDIR=file
    WITH_MAGIC_INCLUDE="-I\${top_srcdir}/${WITH_MAGIC_SUBDIR}/src"
@@ -16,7 +16,7 @@ Index: rpm-4.4.2.3/configure.ac
  dnl export LIBS INCPATH CONFIG_SITE
  
 -AC_CONFIG_SUBDIRS(popt file db3)
-+AC_CONFIG_SUBDIRS(db/dist)
++AC_CONFIG_SUBDIRS(db/dist file)
  
  AC_CONFIG_FILES([ Doxyfile Makefile rpmrc macros platform rpmpopt
  	rpmio/Makefile rpmdb/Makefile lib/Makefile build/Makefile
diff --git a/packages/rpm/rpm-native_4.4.2.3.bb b/packages/rpm/rpm-native_4.4.2.3.bb
index f122a47..517b571 100644
--- a/packages/rpm/rpm-native_4.4.2.3.bb
+++ b/packages/rpm/rpm-native_4.4.2.3.bb
@@ -1,10 +1,9 @@
 require rpm_${PV}.bb
 inherit native
 
-DEPENDS = "beecrypt-native zlib-native file-native popt-native"
+DEPENDS = "beecrypt-native zlib-native file-native popt-native python-native"
 
 PR = "r2"
 
 export sharedstatedir = "${layout_sharedstatedir}"
 export localstatedir = "${layout_localstatedir}"
-
diff --git a/packages/rpm/rpm_4.4.2.3.bb b/packages/rpm/rpm_4.4.2.3.bb
index a568ea8..7edecbc 100644
--- a/packages/rpm/rpm_4.4.2.3.bb
+++ b/packages/rpm/rpm_4.4.2.3.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "The RPM Package Manager."
 HOMEPAGE = "http://rpm.org/"
 LICENSE = "LGPL GPL"
-DEPENDS = "zlib beecrypt file popt"
-PR = "r2"
+DEPENDS = "zlib beecrypt file popt python"
+PR = "r3"
 
 SRC_URI = "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.4.2.3.tar.gz \
            file://external-tools.patch;patch=1 \
@@ -14,7 +14,9 @@ S = "${WORKDIR}/rpm-${PV}"
 
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
-EXTRA_OECONF = "--without-python \
+EXTRA_OECONF = "--with-python=${PYTHONVER} \
+		--with-python-incdir=${STAGING_INCDIR}/python${PYTHONVER} \
+		--with-python-libdir=${STAGING_LIBDIR}/python${PYTHONVER} \
 		--without-apidocs \
 		--without-selinux \
 		--without-lua \
@@ -82,3 +84,13 @@ do_configure () {
 		    --with-pic
 
 }
+
+def rpm_python_version(d):
+	import os, bb
+	staging_incdir = bb.data.getVar( "STAGING_INCDIR", d, 1 )
+	if os.path.exists( "%s/python2.5" % staging_incdir ): return "2.5"
+	if os.path.exists( "%s/python2.4" % staging_incdir ): return "2.4"
+	if os.path.exists( "%s/python2.3" % staging_incdir ): return "2.3"
+	raise "No Python in STAGING_INCDIR. Forgot to build python/python-native?"
+
+PYTHONVER = "${@rpm_python_version(d)}"
-- 
1.6.1.3





