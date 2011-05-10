Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlLv-0005rZ-3c
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:43:47 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so4758860fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=dHwSd+ETccFm6ulpLwroLsdHid/6otHEceSsORGwMCY=;
	b=Beyi1Ih1DBgpqxvsaPUgRfKLQFMpP2ZchHhUs92z5L+mva7HVggct9vFUUhRn/yp08
	BTLqVMcEayeUceRB4Y6b2TC1JdF2ooJs6YPAdj97BlUIzOXebUyOsCsjQzvkJ/lDd17S
	y+XM7ufVvkuhClQaOtJQyP2HnvDXSP/4S1vis=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JEht2l0Gs37bd2Rd0voYfg8he6L5BXkcVzULbRfeXBt0civS0uuWH2XtkjRuraplpv
	XQMwyk8UTs8c+oVl3FE1FL6GKLCddGCy86kFRiv8cM4EWoDMDM+Dc7s4uMcV20Pirlq7
	+XoVic5sK6bZXuZ5hQcKBy9ZxkGEhRuZmV4xk=
Received: by 10.223.117.137 with SMTP id r9mr1391368faq.28.1305027663133;
	Tue, 10 May 2011 04:41:03 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c22sm2345715fat.38.2011.05.10.04.41.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:41:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:40:56 +0200
Message-Id: <20d6172f8610688ebb27ef681a349df4d0fd09a1.1305027503.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305027503.git.Martin.Jansa@gmail.com>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 7/9] glib-2.0: add git version for 2.29.3+git, which has gdbus-codegen included
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
X-List-Received-Date: Tue, 10 May 2011 11:43:47 -0000

* add negative DEFAULT_PREFERRENCE for now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/glib-2.0/glib-2.0.inc         |    6 +
 .../60_wait-longer-for-threads-to-die.patch        |   33 ++++++
 .../glib-2.0/glib-2.0/configure-libtool.patch      |   38 +++++++
 .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 +++++
 .../glib-2.0/glib-2.0/glib-gettextize-dir.patch    |   24 +++++
 .../recipes-core/glib-2.0/glib-2.0/no-iconv.patch  |  104 ++++++++++++++++++++
 .../glib-2.0/remove.test.for.qsort_r.patch         |   54 ++++++++++
 meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb      |   29 ++++++
 meta-oe/recipes-core/glib-2.0/glib.inc             |   37 +++++++
 9 files changed, 349 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0.inc
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
 create mode 100644 meta-oe/recipes-core/glib-2.0/glib.inc

diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0.inc b/meta-oe/recipes-core/glib-2.0/glib-2.0.inc
new file mode 100644
index 0000000..ccbbd2b
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glib-2.0.inc
@@ -0,0 +1,6 @@
+
+python () {
+    import bb
+    if bb.data.getVar("USE_NLS", d, 1) == "no":
+        raise bb.parse.SkipPackage("${PN} requires native language support.")
+}
diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch b/meta-oe/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
new file mode 100644
index 0000000..b65a474
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
@@ -0,0 +1,33 @@
+copy from OE, said to borrow from Ubuntu. Not in glib-2.0 upstream yet. Add for sanity.
+Added to poky by Kevin Tian <kevin.tian@intel.com>, 06/25/2010
+Rebased for glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel.com>, 11/16/2010
+
+Upstream-Status: Inappropriate [patches for test code]
+
+diff -ruN glib-2.27.3-orig/tests/threadpool-test.c glib-2.27.3/tests/threadpool-test.c
+--- glib-2.27.3-orig/tests/threadpool-test.c	2009-04-01 07:04:21.000000000 +0800
++++ glib-2.27.3/tests/threadpool-test.c	2010-11-16 12:28:09.002172678 +0800
+@@ -5,8 +5,8 @@
+ 
+ #include <glib.h>
+ 
+-#define DEBUG_MSG(x)
+-/* #define DEBUG_MSG(args) g_printerr args ; g_printerr ("\n");  */
++/* #define DEBUG_MSG(x) */
++#define DEBUG_MSG(args) g_printerr args ; g_printerr ("\n");
+ 
+ #define WAIT                5    /* seconds */
+ #define MAX_THREADS         10
+@@ -124,10 +124,10 @@
+    DEBUG_MSG (("[unused] stopping unused threads"));
+    g_thread_pool_stop_unused_threads ();
+ 
+-   DEBUG_MSG (("[unused] waiting ONE second for threads to die"));
++   DEBUG_MSG (("[unused] waiting FIVE second for threads to die"));
+ 
+    /* Some time for threads to die. */
+-   g_usleep (G_USEC_PER_SEC);
++   g_usleep (5 * G_USEC_PER_SEC);
+ 
+    DEBUG_MSG (("[unused] stopped idle threads, %d remain, %d threads still exist",
+ 	       g_thread_pool_get_num_unused_threads (),
diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch b/meta-oe/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
new file mode 100644
index 0000000..c21e378
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
@@ -0,0 +1,38 @@
+# Poky renames libtool to $host_alias-libtool.
+# ./$host_alias-libtool isn't created until after configure runs with libtool >= 2.2.2
+# so we can't call # it at this point. We can safely assume a version is available
+# from PATH though
+# Rebased to glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+diff -ruN glib-2.27.3-orig/configure.ac glib-2.27.3/configure.ac
+--- glib-2.27.3-orig/configure.ac	2010-11-03 11:02:05.000000000 +0800
++++ glib-2.27.3/configure.ac	2010-11-16 12:38:12.610485990 +0800
+@@ -1385,7 +1385,7 @@
+   G_MODULE_LDFLAGS=
+ else
+   export SED
+-  G_MODULE_LDFLAGS=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
++  G_MODULE_LDFLAGS=`(./$host_alias-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
+ fi
+ dnl G_MODULE_IMPL= don't reset, so cmd-line can override
+ G_MODULE_NEED_USCORE=0
+@@ -1450,7 +1450,7 @@
+ 	LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
+ dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
+ 	echo "void glib_plugin_test(void) { }" > plugin.c
+-	${SHELL} ./libtool --mode=compile ${CC} -shared \
++	${SHELL} ./$host_alias-libtool --mode=compile ${CC} -shared \
+ 		-export-dynamic -o plugin.o plugin.c 2>&1 >/dev/null
+ 	AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
+ 		glib_cv_rtldglobal_broken,[
+@@ -1524,7 +1524,7 @@
+ 
+ AC_MSG_CHECKING(for the suffix of module shared libraries)
+ export SED
+-shrext_cmds=`./libtool --config | grep '^shrext_cmds='`
++shrext_cmds=`./$host_alias-libtool --config | grep '^shrext_cmds='`
+ eval $shrext_cmds
+ module=yes eval std_shrext=$shrext_cmds
+ # chop the initial dot
diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch b/meta-oe/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
new file mode 100644
index 0000000..2eaa19b
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
@@ -0,0 +1,24 @@
+fix g_once_init_enter compile failure
+
+Kernelshark trips over a compile bug in glib-2.0 addressed by Open Embedded
+back in the 2.22 timeframe. It appears to still be present in 2.27.
+
+http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg005
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+
+Upstream-Status: Pending
+
+Index: glib-2.27.5/glib/gthread.h
+===================================================================
+--- glib-2.27.5.orig/glib/gthread.h
++++ glib-2.27.5/glib/gthread.h
+@@ -344,7 +344,7 @@ void                    g_once_init_leav
+ G_INLINE_FUNC gboolean
+ g_once_init_enter (volatile gsize *value_location)
+ {
+-  if G_LIKELY ((gpointer) g_atomic_pointer_get (value_location) != NULL)
++  if G_LIKELY ((gpointer) g_atomic_pointer_get ((volatile gpointer *)value_location) != NULL)
+     return FALSE;
+   else
+     return g_once_init_enter_impl (value_location);
diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch b/meta-oe/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
new file mode 100644
index 0000000..ee43511
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
@@ -0,0 +1,24 @@
+# an very old patch cherry-picked in every glib-2.0 patch directory. The earliest container
+# for it is 2.6.5 in OE. The earliest commit for it is c8e5702127e507e82e6f68a4b8c546803accea9d
+# in OE side which ports from previous bitkeeper SCM. In OE side it's only used til 2.12.4.
+#
+# keep it since it's always cleaner to not hardcode destination path. Use @datadir@ is more
+# portable here. mark for upstream
+#
+# by Kevin Tian <kevin.tian@intel.com>, 06/25/2010
+# Rebased by Dongxiao Xu <dongxiao.xu@intel.com>, 11/16/2010
+
+Upstream-Status: Inappropriate [configuration]
+
+diff -ruN glib-2.27.3-orig/glib-gettextize.in glib-2.27.3/glib-gettextize.in
+--- glib-2.27.3-orig/glib-gettextize.in	2009-04-01 07:04:20.000000000 +0800
++++ glib-2.27.3/glib-gettextize.in	2010-11-16 12:55:06.874605916 +0800
+@@ -52,7 +52,7 @@
+ datadir=@datadir@
+ datarootdir=@datarootdir@
+ 
+-gettext_dir=$prefix/share/glib-2.0/gettext
++gettext_dir=@datadir@/glib-2.0/gettext
+ 
+ while test $# -gt 0; do
+   case "$1" in
diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0/no-iconv.patch b/meta-oe/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
new file mode 100644
index 0000000..cca57d4
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
@@ -0,0 +1,104 @@
+We provide dummy implementation of iconv functionality if it does not find
+iconv which will be case with uclibc. We remove the check for iconv in configure
+
+This is needed when libintl and libiconv is not available. It wont have any
+impact on case when they are available.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+Index: glib-2.26.1/glib/gconvert.c
+===================================================================
+--- glib-2.26.1.orig/glib/gconvert.c
++++ glib-2.26.1/glib/gconvert.c
+@@ -23,7 +23,7 @@
+ #include "config.h"
+ #include "glibconfig.h"
+ 
+-#ifndef G_OS_WIN32
++#if !defined G_OS_WIN32 && defined HAVE_ICONV_H
+ #include <iconv.h>
+ #endif
+ #include <errno.h>
+@@ -65,6 +65,28 @@
+ #error GNU libiconv not in use but included iconv.h is from libiconv
+ #endif
+ 
++#ifndef HAVE_ICONV_H
++typedef void *iconv_t;
++
++iconv_t iconv_open(const char *tocode, const char *fromcode)
++{
++	return (iconv_t)(-1);
++}
++
++int iconv_close(iconv_t cd)
++{
++	free(cd);
++
++	return 0;
++}
++size_t iconv (iconv_t __cd, char **__inbuf,
++                     size_t *__inbytesleft,
++                     char **__outbuf,
++                     size_t *__outbytesleft)
++{
++	return 0;
++}
++#endif
+ 
+ /**
+  * SECTION:conversions
+Index: glib-2.26.1/configure.ac
+===================================================================
+--- glib-2.26.1.orig/configure.ac
++++ glib-2.26.1/configure.ac
+@@ -373,46 +373,8 @@ dnl *** Tests for iconv ***
+ dnl ***********************
+ dnl
+ dnl We do this before the gettext checks, to avoid distortion
+-
+-dnl On Windows we use a native implementation
+-
+-if test x"$glib_native_win32" = xyes; then
+-  with_libiconv=native
+-else
+-  AC_ARG_WITH(libiconv,
+-	      [AC_HELP_STRING([--with-libiconv=@<:@no/gnu/native@:>@],
+-			      [use the libiconv library])],,
+-	      [with_libiconv=maybe])
+-
+-  found_iconv=no
+-  case $with_libiconv in
+-    maybe)
+-      # Check in the C library first
+-      AC_CHECK_FUNC(iconv_open, [with_libiconv=no; found_iconv=yes])
+-      # Check if we have GNU libiconv
+-      if test $found_iconv = "no"; then
+-	AC_CHECK_LIB(iconv, libiconv_open, [with_libiconv=gnu; found_iconv=yes])
+-      fi
+-      # Check if we have a iconv in -liconv, possibly from vendor
+-      if test $found_iconv = "no"; then
+-	AC_CHECK_LIB(iconv, iconv_open, [with_libiconv=native; found_iconv=yes])
+-      fi
+-      ;;
+-    no)
+-      AC_CHECK_FUNC(iconv_open, [with_libiconv=no; found_iconv=yes])
+-      ;;
+-    gnu|yes)
+-      AC_CHECK_LIB(iconv, libiconv_open, [with_libiconv=gnu; found_iconv=yes])
+-      ;;
+-    native)
+-      AC_CHECK_LIB(iconv, iconv_open, [with_libiconv=native; found_iconv=yes])
+-      ;;
+-  esac
+-
+-  if test "x$found_iconv" = "xno" ; then
+-     AC_MSG_ERROR([*** No iconv() implementation found in C library or libiconv])
+-  fi
+-fi
++found_iconv=yes
++with_libiconv=no
+ 
+ gl_GLIBC21
+ AC_ARG_ENABLE(iconv-cache, 
diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch b/meta-oe/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
new file mode 100644
index 0000000..3300eb0
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
@@ -0,0 +1,54 @@
+while cross compiling we cannot execute run tests
+
+diff --git a/configure.ac b/configure.ac
+index 378b082..3f2a8d3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -580,46 +580,7 @@ AC_FUNC_VPRINTF
+ AC_FUNC_ALLOCA
+ AC_CHECK_FUNCS(mmap posix_memalign memalign valloc fsync pipe2)
+ AC_CHECK_FUNCS(atexit on_exit timegm gmtime_r)
+-# BSD has a qsort_r with wrong argument order
+-AC_CACHE_CHECK([for qsort_r], glib_cv_have_qsort_r, [
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#define _GNU_SOURCE
+-#include <stdlib.h>
+-
+-static int
+-cmp (const void *a, const void *b, void *c)
+-{
+-  const int *ia = a;
+-  const int *ib = b;
+-
+-  if (*ia < *ib)
+-    return -1;
+-  else if (*ia > *ib)
+-    return 1;
+-  else
+-    return 0;
+-}
+-
+-int
+-main (int argc, char **argv)
+-{
+-  int arr[3] = { 1, 2, 0 };
+-  int d = 3;
+-
+-  qsort_r (arr, 3, sizeof (int), cmp, &d);
+-
+-  if (arr[0] == 0 && arr[1] == 1 && arr[2] == 2)
+-    return 0;
+-  else
+-    return 1;
+-}]])],[glib_cv_have_qsort_r=yes],[glib_cv_have_qsort_r=no])])
+-
+-if test $glib_cv_have_qsort_r = yes ; then
+-  AC_MSG_RESULT([yes])
+-    AC_DEFINE(HAVE_QSORT_R, 1, [Define to 1 if you have the 'qsort_r' function])
+-else
+-  AC_MSG_RESULT([no])
+-fi
++AC_DEFINE(HAVE_QSORT_R, 1, [Define to 1 if you have the 'qsort_r' function])
+ 
+ AC_CHECK_SIZEOF(char)
+ AC_CHECK_SIZEOF(short)
diff --git a/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb b/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
new file mode 100644
index 0000000..f95d162
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb
@@ -0,0 +1,29 @@
+require glib.inc
+
+PE = "1"
+
+DEFAULT_PREFERENCE = "-1"
+
+DEPENDS += "libffi" 
+
+SRC_URI = "git://git.gnome.org/glib;protocol=git;branch=master \
+           file://configure-libtool.patch \
+           file://60_wait-longer-for-threads-to-die.patch \
+           file://g_once_init_enter.patch \
+	   file://remove.test.for.qsort_r.patch \
+          "
+SRCREV = "d97cbc6731deab137770bc0fe9c69b06f689f5b4"
+PV = "2.29.3+gitr${SRCPV}"
+S = "${WORKDIR}/git"
+
+# Only apply this patch for target recipe on uclibc
+SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
+
+SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
+BBCLASSEXTEND = "native"
+
+do_configure_prepend() {
+  # missing ${topdir}/gtk-doc.make and --disable-gtk-doc* is not enough, because it calls gtkdocize (not provided by gtk-doc-native)
+  sed -i '/^docs/d' ${S}/configure.ac
+  sed -i 's/SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po docs/SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po/g' ${S}/Makefile.am
+}
diff --git a/meta-oe/recipes-core/glib-2.0/glib.inc b/meta-oe/recipes-core/glib-2.0/glib.inc
new file mode 100644
index 0000000..8786fe5
--- /dev/null
+++ b/meta-oe/recipes-core/glib-2.0/glib.inc
@@ -0,0 +1,37 @@
+SUMMARY = "A general-purpose utility library"
+DESCRIPTION = "GLib is a general-purpose utility library, which provides many useful data types, macros, type conversions, string utilities, file utilities, a main loop abstraction, and so on."
+# pcre is under BSD;
+# docs/reference/COPYING is with a 'public domai'-like license!
+LICENSE = "LGPLv2+ & BSD & public domain"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://glib/glib.h;startline=4;endline=17;md5=a4332fe58b076f29d07c9c066d2967b6 \
+                    file://gmodule/COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://gmodule/gmodule.h;startline=4;endline=17;md5=76ab161b37202cd004073c42fac276ed \
+                    file://glib/pcre/COPYING;md5=266ebc3ff74ee9ce6fad65577667c0f4 \
+                    file://glib/pcre/pcre.h;startline=11;endline=35;md5=ce867cf87ebbd2bb55e980d90328390d \
+                    file://docs/reference/COPYING;md5=f51a5100c17af6bae00735cd791e1fcc"
+BUGTRACKER = "http://bugzilla.gnome.org"
+SECTION = "libs"
+
+require glib-2.0.inc
+
+DEPENDS = "glib-2.0-native gtk-doc-native zip dbus"
+DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native dbus-native"
+DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
+PACKAGES =+ "glib-2.0-utils "
+
+LEAD_SONAME = "libglib-2.0.*"
+FILES_glib-2.0-utils = "${bindir}/*"
+
+inherit autotools pkgconfig gettext
+
+S = "${WORKDIR}/glib-${PV}"
+
+EXTRA_OECONF = "--disable-debug --enable-included-printf=no"
+EXTRA_OECONF_virtclass-native = ""
+EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no"
+
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-dev += "${libdir}/glib-2.0/include ${libdir}/gdbus-codegen/*.py"
+
+ARM_INSTRUCTION_SET = "arm"
-- 
1.7.5.rc3



