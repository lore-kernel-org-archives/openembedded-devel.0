Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PcEUQ-0003Ur-6N
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 10:56:38 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so17855677fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 01:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=zz8uBl/2tNKGdCrKDyC3aC1P+wCIRfNVt7E4vPbMBEA=;
	b=Q3B+m3dAdxidA8geE8PTrW8mrG4QgUjZyCNI4mS1YXvLVSGCtez/+1v/wJpXWhq+EG
	35IU0NRpAecWDRakd22KSZQHROaWcjg0WwBpdU5DGg9QSZunxRpDRPjZG4ReFpZwFrnz
	zOWLZDS8SAC2KlHZni4pqgqrZp5xkcf3WHF34=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vHrMYzCfcuIqiCEHEbxpmgcD0+VdVfL5MhapQJlrDsBg4eFrviGZiu7Cp45ncRgWix
	bo56hO87kLwCR/6Fib1Q2kDT3Rh2XYOoA710fEHelwe3rLClQMKmc3dAYcfuojzWBzHc
	bZq/ydM6Aw3Gi+FXYynokZjQaqfhnFvYJXfRo=
Received: by 10.223.70.142 with SMTP id d14mr105689faj.110.1294653371210;
	Mon, 10 Jan 2011 01:56:11 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e17sm6855057fak.10.2011.01.10.01.56.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 Jan 2011 01:56:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 10:55:59 +0100
Message-Id: <1294653360-27612-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294653360-27612-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294653360-27612-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 5/6] libglew: import 1.5.7 from poky
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
X-List-Received-Date: Mon, 10 Jan 2011 09:56:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/glew/files/autotools.patch         |  146 ----------------------------
 recipes/glew/libglew-1.5.1/autotools.patch |  146 ++++++++++++++++++++++++++++
 recipes/glew/libglew-1.5.7/autotools.patch |  146 ++++++++++++++++++++++++++++
 recipes/glew/libglew_1.5.7.bb              |   18 ++++
 4 files changed, 310 insertions(+), 146 deletions(-)
 delete mode 100644 recipes/glew/files/autotools.patch
 create mode 100644 recipes/glew/libglew-1.5.1/autotools.patch
 create mode 100644 recipes/glew/libglew-1.5.7/autotools.patch
 create mode 100644 recipes/glew/libglew_1.5.7.bb

diff --git a/recipes/glew/files/autotools.patch b/recipes/glew/files/autotools.patch
deleted file mode 100644
index fc4df82..0000000
--- a/recipes/glew/files/autotools.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-Index: glew/Makefile.am
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ glew/Makefile.am	2009-12-02 00:30:23.296641663 +0100
-@@ -0,0 +1,5 @@
-+
-+ACLOCAL_AMFLAGS = -I m4 --install
-+
-+SUBDIRS = include src
-+
-Index: glew/configure.ac
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ glew/configure.ac	2009-12-02 00:30:23.296641663 +0100
-@@ -0,0 +1,67 @@
-+#                                               -*- Autoconf -*-
-+# Process this file with autoconf to produce a configure script.
-+
-+AC_PREREQ([2.62])
-+AC_INIT([glew], [1.5.1], [BUG-REPORT-ADDRESS])
-+AC_CONFIG_SRCDIR([src/glew.c])
-+AC_CONFIG_HEADERS([config.h])
-+AM_INIT_AUTOMAKE([-Wall -Werror foreign])
-+AC_CONFIG_MACRO_DIR([m4])
-+
-+LT_INIT
-+
-+# Checks for programs.
-+AC_PROG_CC
-+AC_PROG_INSTALL
-+AC_PROG_LN_S
-+
-+# Checks for libraries.
-+
-+# Checks for header files.
-+AC_CHECK_HEADERS([inttypes.h stddef.h stdint.h stdlib.h string.h])
-+
-+# Checks for typedefs, structures, and compiler characteristics.
-+AC_TYPE_INT32_T
-+AC_TYPE_INT64_T
-+AC_TYPE_UINT64_T
-+AC_CHECK_TYPES([ptrdiff_t])
-+
-+# Checks for library functions.
-+AC_FUNC_MALLOC
-+AC_CHECK_FUNCS([strtol])
-+
-+# Check for pkgconfig libs
-+
-+PKG_CHECK_MODULES([X11], [x11])
-+AC_SUBST([X11_LIBS])
-+AC_SUBST([X11_CFLAGS])
-+
-+PKG_CHECK_MODULES([XMU], [xmu])
-+AC_SUBST([XMU_LIBS])
-+AC_SUBST([XMU_CFLAGS])
-+
-+PKG_CHECK_MODULES([XI], [xi])
-+AC_SUBST([XI_LIBS])
-+AC_SUBST([XI_CFLAGS])
-+
-+PKG_CHECK_MODULES([XEXT], [xext])
-+AC_SUBST([XEXT_LIBS])
-+AC_SUBST([XEXT_CFLAGS])
-+
-+# Check for GLU is enough and imples gl so no doubled -lGL in LDFLAGS
-+PKG_CHECK_MODULES([GLU], [glu])
-+AC_SUBST([GLU_LIBS])
-+AC_SUBST([GLU_CFLAGS])
-+
-+# ENABLE option for Multiple Rendering Contexts support
-+AC_CHECK_ENABLE_GLEWMX
-+
-+# for now we use the same version as the package, but that should be avoided
-+# in the future
-+
-+AC_SUBST([LIBGLEW_SO_VERSION], [1:5:1])
-+
-+AC_CONFIG_FILES([Makefile
-+                 include/Makefile
-+                 src/Makefile])
-+AC_OUTPUT
-Index: glew/src/Makefile.am
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ glew/src/Makefile.am	2009-12-02 00:33:48.690786110 +0100
-@@ -0,0 +1,35 @@
-+
-+AM_CPPFLAGS = -I$(top_srcdir)/include
-+
-+if ENABLE_GLEWMX
-+AM_CPPFLAGS += -DGLEW_MX
-+endif
-+
-+AM_CFLAGS = @X11_CFLAGS@ \
-+            @XMU_CFLAGS@ \
-+            @XI_CFLAGS@ \
-+            @XEXT_CFLAGS@ \
-+            @GLU_CFLAGS@
-+
-+lib_LTLIBRARIES = libGLEW.la
-+
-+libGLEW_la_SOURCES = glew.c
-+
-+libGLEW_la_LIBADD = @X11_LIBS@ \
-+                    @XMU_LIBS@ \
-+                    @XI_LIBS@ \
-+                    @XEXT_LIBS@ \
-+                    @GLU_LIBS@
-+
-+libGLEW_la_LDFLAGS = -version-number @LIBGLEW_SO_VERSION@
-+
-+bin_PROGRAMS = glewinfo visualinfo
-+
-+glewinfo_SOURCES = glewinfo.c
-+
-+glewinfo_LDADD = libGLEW.la
-+
-+visualinfo_SOURCES =  visualinfo.c
-+
-+visualinfo_LDADD = libGLEW.la
-+
-Index: glew/m4/glewmx.m4
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ glew/m4/glewmx.m4	2009-12-02 00:30:23.296641663 +0100
-@@ -0,0 +1,11 @@
-+
-+AC_DEFUN([AC_CHECK_ENABLE_GLEWMX],[
-+AC_MSG_CHECKING([whether to include Multiple Rendering Contexts support])
-+AC_ARG_ENABLE([glewmx],
-+   [AS_HELP_STRING([--enable-glewmx], [enable GLEW Multiple Rendering Contexts (default is no)])],
-+   [ENABLE_GLEWMX="$enableval"],
-+   [ENABLE_GLEWMX="no"])
-+AC_MSG_RESULT([${ENABLE_GLEWMX}])
-+AM_CONDITIONAL([ENABLE_GLEWMX], [test x"${ENABLE_GLEWMX}" = "xyes"])
-+])
-+
-Index: glew/include/Makefile.am
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ glew/include/Makefile.am	2009-12-02 00:30:23.296641663 +0100
-@@ -0,0 +1,3 @@
-+
-+nobase_include_HEADERS = GL/glew.h  GL/glxew.h  GL/wglew.h
-+
diff --git a/recipes/glew/libglew-1.5.1/autotools.patch b/recipes/glew/libglew-1.5.1/autotools.patch
new file mode 100644
index 0000000..fc4df82
--- /dev/null
+++ b/recipes/glew/libglew-1.5.1/autotools.patch
@@ -0,0 +1,146 @@
+Index: glew/Makefile.am
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ glew/Makefile.am	2009-12-02 00:30:23.296641663 +0100
+@@ -0,0 +1,5 @@
++
++ACLOCAL_AMFLAGS = -I m4 --install
++
++SUBDIRS = include src
++
+Index: glew/configure.ac
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ glew/configure.ac	2009-12-02 00:30:23.296641663 +0100
+@@ -0,0 +1,67 @@
++#                                               -*- Autoconf -*-
++# Process this file with autoconf to produce a configure script.
++
++AC_PREREQ([2.62])
++AC_INIT([glew], [1.5.1], [BUG-REPORT-ADDRESS])
++AC_CONFIG_SRCDIR([src/glew.c])
++AC_CONFIG_HEADERS([config.h])
++AM_INIT_AUTOMAKE([-Wall -Werror foreign])
++AC_CONFIG_MACRO_DIR([m4])
++
++LT_INIT
++
++# Checks for programs.
++AC_PROG_CC
++AC_PROG_INSTALL
++AC_PROG_LN_S
++
++# Checks for libraries.
++
++# Checks for header files.
++AC_CHECK_HEADERS([inttypes.h stddef.h stdint.h stdlib.h string.h])
++
++# Checks for typedefs, structures, and compiler characteristics.
++AC_TYPE_INT32_T
++AC_TYPE_INT64_T
++AC_TYPE_UINT64_T
++AC_CHECK_TYPES([ptrdiff_t])
++
++# Checks for library functions.
++AC_FUNC_MALLOC
++AC_CHECK_FUNCS([strtol])
++
++# Check for pkgconfig libs
++
++PKG_CHECK_MODULES([X11], [x11])
++AC_SUBST([X11_LIBS])
++AC_SUBST([X11_CFLAGS])
++
++PKG_CHECK_MODULES([XMU], [xmu])
++AC_SUBST([XMU_LIBS])
++AC_SUBST([XMU_CFLAGS])
++
++PKG_CHECK_MODULES([XI], [xi])
++AC_SUBST([XI_LIBS])
++AC_SUBST([XI_CFLAGS])
++
++PKG_CHECK_MODULES([XEXT], [xext])
++AC_SUBST([XEXT_LIBS])
++AC_SUBST([XEXT_CFLAGS])
++
++# Check for GLU is enough and imples gl so no doubled -lGL in LDFLAGS
++PKG_CHECK_MODULES([GLU], [glu])
++AC_SUBST([GLU_LIBS])
++AC_SUBST([GLU_CFLAGS])
++
++# ENABLE option for Multiple Rendering Contexts support
++AC_CHECK_ENABLE_GLEWMX
++
++# for now we use the same version as the package, but that should be avoided
++# in the future
++
++AC_SUBST([LIBGLEW_SO_VERSION], [1:5:1])
++
++AC_CONFIG_FILES([Makefile
++                 include/Makefile
++                 src/Makefile])
++AC_OUTPUT
+Index: glew/src/Makefile.am
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ glew/src/Makefile.am	2009-12-02 00:33:48.690786110 +0100
+@@ -0,0 +1,35 @@
++
++AM_CPPFLAGS = -I$(top_srcdir)/include
++
++if ENABLE_GLEWMX
++AM_CPPFLAGS += -DGLEW_MX
++endif
++
++AM_CFLAGS = @X11_CFLAGS@ \
++            @XMU_CFLAGS@ \
++            @XI_CFLAGS@ \
++            @XEXT_CFLAGS@ \
++            @GLU_CFLAGS@
++
++lib_LTLIBRARIES = libGLEW.la
++
++libGLEW_la_SOURCES = glew.c
++
++libGLEW_la_LIBADD = @X11_LIBS@ \
++                    @XMU_LIBS@ \
++                    @XI_LIBS@ \
++                    @XEXT_LIBS@ \
++                    @GLU_LIBS@
++
++libGLEW_la_LDFLAGS = -version-number @LIBGLEW_SO_VERSION@
++
++bin_PROGRAMS = glewinfo visualinfo
++
++glewinfo_SOURCES = glewinfo.c
++
++glewinfo_LDADD = libGLEW.la
++
++visualinfo_SOURCES =  visualinfo.c
++
++visualinfo_LDADD = libGLEW.la
++
+Index: glew/m4/glewmx.m4
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ glew/m4/glewmx.m4	2009-12-02 00:30:23.296641663 +0100
+@@ -0,0 +1,11 @@
++
++AC_DEFUN([AC_CHECK_ENABLE_GLEWMX],[
++AC_MSG_CHECKING([whether to include Multiple Rendering Contexts support])
++AC_ARG_ENABLE([glewmx],
++   [AS_HELP_STRING([--enable-glewmx], [enable GLEW Multiple Rendering Contexts (default is no)])],
++   [ENABLE_GLEWMX="$enableval"],
++   [ENABLE_GLEWMX="no"])
++AC_MSG_RESULT([${ENABLE_GLEWMX}])
++AM_CONDITIONAL([ENABLE_GLEWMX], [test x"${ENABLE_GLEWMX}" = "xyes"])
++])
++
+Index: glew/include/Makefile.am
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ glew/include/Makefile.am	2009-12-02 00:30:23.296641663 +0100
+@@ -0,0 +1,3 @@
++
++nobase_include_HEADERS = GL/glew.h  GL/glxew.h  GL/wglew.h
++
diff --git a/recipes/glew/libglew-1.5.7/autotools.patch b/recipes/glew/libglew-1.5.7/autotools.patch
new file mode 100644
index 0000000..7fe1d6e
--- /dev/null
+++ b/recipes/glew/libglew-1.5.7/autotools.patch
@@ -0,0 +1,146 @@
+Index: glew/Makefile.am
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ glew/Makefile.am	2009-12-02 00:30:23.296641663 +0100
+@@ -0,0 +1,5 @@
++
++ACLOCAL_AMFLAGS = -I m4 --install
++
++SUBDIRS = include src
++
+Index: glew/configure.ac
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ glew/configure.ac	2009-12-02 00:30:23.296641663 +0100
+@@ -0,0 +1,67 @@
++#                                               -*- Autoconf -*-
++# Process this file with autoconf to produce a configure script.
++
++AC_PREREQ([2.62])
++AC_INIT([glew], [1.5.7], [BUG-REPORT-ADDRESS])
++AC_CONFIG_SRCDIR([src/glew.c])
++AC_CONFIG_HEADERS([config.h])
++AM_INIT_AUTOMAKE([-Wall -Werror foreign])
++AC_CONFIG_MACRO_DIR([m4])
++
++LT_INIT
++
++# Checks for programs.
++AC_PROG_CC
++AC_PROG_INSTALL
++AC_PROG_LN_S
++
++# Checks for libraries.
++
++# Checks for header files.
++AC_CHECK_HEADERS([inttypes.h stddef.h stdint.h stdlib.h string.h])
++
++# Checks for typedefs, structures, and compiler characteristics.
++AC_TYPE_INT32_T
++AC_TYPE_INT64_T
++AC_TYPE_UINT64_T
++AC_CHECK_TYPES([ptrdiff_t])
++
++# Checks for library functions.
++AC_FUNC_MALLOC
++AC_CHECK_FUNCS([strtol])
++
++# Check for pkgconfig libs
++
++PKG_CHECK_MODULES([X11], [x11])
++AC_SUBST([X11_LIBS])
++AC_SUBST([X11_CFLAGS])
++
++PKG_CHECK_MODULES([XMU], [xmu])
++AC_SUBST([XMU_LIBS])
++AC_SUBST([XMU_CFLAGS])
++
++PKG_CHECK_MODULES([XI], [xi])
++AC_SUBST([XI_LIBS])
++AC_SUBST([XI_CFLAGS])
++
++PKG_CHECK_MODULES([XEXT], [xext])
++AC_SUBST([XEXT_LIBS])
++AC_SUBST([XEXT_CFLAGS])
++
++# Check for GLU is enough and imples gl so no doubled -lGL in LDFLAGS
++PKG_CHECK_MODULES([GLU], [glu])
++AC_SUBST([GLU_LIBS])
++AC_SUBST([GLU_CFLAGS])
++
++# ENABLE option for Multiple Rendering Contexts support
++AC_CHECK_ENABLE_GLEWMX
++
++# for now we use the same version as the package, but that should be avoided
++# in the future
++
++AC_SUBST([LIBGLEW_SO_VERSION], [1:5:7])
++
++AC_CONFIG_FILES([Makefile
++                 include/Makefile
++                 src/Makefile])
++AC_OUTPUT
+Index: glew/src/Makefile.am
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ glew/src/Makefile.am	2009-12-02 00:33:48.690786110 +0100
+@@ -0,0 +1,35 @@
++
++AM_CPPFLAGS = -I$(top_srcdir)/include
++
++if ENABLE_GLEWMX
++AM_CPPFLAGS += -DGLEW_MX
++endif
++
++AM_CFLAGS = @X11_CFLAGS@ \
++            @XMU_CFLAGS@ \
++            @XI_CFLAGS@ \
++            @XEXT_CFLAGS@ \
++            @GLU_CFLAGS@
++
++lib_LTLIBRARIES = libGLEW.la
++
++libGLEW_la_SOURCES = glew.c
++
++libGLEW_la_LIBADD = @X11_LIBS@ \
++                    @XMU_LIBS@ \
++                    @XI_LIBS@ \
++                    @XEXT_LIBS@ \
++                    @GLU_LIBS@
++
++libGLEW_la_LDFLAGS = -version-number @LIBGLEW_SO_VERSION@
++
++bin_PROGRAMS = glewinfo visualinfo
++
++glewinfo_SOURCES = glewinfo.c
++
++glewinfo_LDADD = libGLEW.la
++
++visualinfo_SOURCES =  visualinfo.c
++
++visualinfo_LDADD = libGLEW.la
++
+Index: glew/m4/glewmx.m4
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ glew/m4/glewmx.m4	2009-12-02 00:30:23.296641663 +0100
+@@ -0,0 +1,11 @@
++
++AC_DEFUN([AC_CHECK_ENABLE_GLEWMX],[
++AC_MSG_CHECKING([whether to include Multiple Rendering Contexts support])
++AC_ARG_ENABLE([glewmx],
++   [AS_HELP_STRING([--enable-glewmx], [enable GLEW Multiple Rendering Contexts (default is no)])],
++   [ENABLE_GLEWMX="$enableval"],
++   [ENABLE_GLEWMX="no"])
++AC_MSG_RESULT([${ENABLE_GLEWMX}])
++AM_CONDITIONAL([ENABLE_GLEWMX], [test x"${ENABLE_GLEWMX}" = "xyes"])
++])
++
+Index: glew/include/Makefile.am
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ glew/include/Makefile.am	2009-12-02 00:30:23.296641663 +0100
+@@ -0,0 +1,3 @@
++
++nobase_include_HEADERS = GL/glew.h  GL/glxew.h  GL/wglew.h
++
diff --git a/recipes/glew/libglew_1.5.7.bb b/recipes/glew/libglew_1.5.7.bb
new file mode 100644
index 0000000..84a6e5e
--- /dev/null
+++ b/recipes/glew/libglew_1.5.7.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "The OpenGL Extension Wrangler Library (GLEW) is a cross-platform open-source C/C++ extension loading library."
+HOMEPAGE = "http://glew.sourceforge.net/"
+SECTION = "x11"
+LICENSE = "MIT"
+
+DEPENDS = "virtual/libx11 virtual/libgl libxext libxi libxmu"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
+           file://autotools.patch \
+          "
+SRC_URI[md5sum] = "f913ce9dbde4cd250b932731b3534ded"
+SRC_URI[sha256sum] = "86bd36a163640d6027ec6be5fdd8a6e3b90f02dcf55f95c3c2429ebb58be3107"
+
+S = "${WORKDIR}/glew-${PV}"
+
+inherit autotools lib_package
-- 
1.7.4.rc1



