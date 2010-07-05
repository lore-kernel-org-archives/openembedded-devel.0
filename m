Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OVc1n-0001rm-EM
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 05:07:29 +0200
Received: by pwi10 with SMTP id 10so2127115pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jul 2010 20:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=r8O1luibz6b1L5ywPynwh/7k5mHR7kbhodwFj/0q8Rg=;
	b=YjL8BK4j+FHDKQ0V7GdqSpKDuaHIrBmBOwcOLfzha+4Nj8M0BdbhSshBlbdZMPcPSk
	eggsgaS65jb4LVyAk0yJvaTdN/X+5G8i5vCVc6ZU69L0apFi5Tp61wkaqlcO9PJWCB34
	s33GESMFbDbKNQpqWFlFUJr0vYa2o42H5U248=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=Mb9yeKpx88mepddjXyXuH9Cx1kqcTFrEuTbe68pf9u1zF6pWGEhFsbHe1UTw14y4AD
	OsUSpbMZAR2XL9CEWgpUlK/P5FltiTbCsUpkkFr2KAOuxFs+VgIaZzI2subWkbQvz6kH
	EyrcpWAAdcD1txhrn7NGaPn/ZuZVecdMjwE+g=
Received: by 10.114.95.3 with SMTP id s3mr2433449wab.25.1278298957651;
	Sun, 04 Jul 2010 20:02:37 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	k23sm56587236waf.17.2010.07.04.20.02.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 04 Jul 2010 20:02:36 -0700 (PDT)
Message-ID: <4C314B47.7080205@gmail.com>
Date: Mon, 05 Jul 2010 12:32:31 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] pulseaudio: Fix most recent recipe and remove broken recipes.
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
X-List-Received-Date: Mon, 05 Jul 2010 03:07:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Three months ago, commit 9cf826839c3cffd18f037d2ca8271affb85bab9d broke
6 of the 7 pulseaudio recipes. No one noticed. Clearly the broken recipes
are unused.

0.9.15 appears to be in use as it still builds. 0.9.21 is the
most recent recipe and has been retained.

Versions removed:
0.9.6
0.9.9
0.9.10
0.9.11
0.9.19

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/pulseaudio/files/configure-ac.patch        |   11 --
 recipes/pulseaudio/pulseaudio-0.9.10/2113.diff     |   19 ---
 recipes/pulseaudio/pulseaudio-0.9.10/2114.diff     |   15 ---
 .../pulseaudio/pulseaudio-0.9.10/libiconv.patch    |   22 ----
 .../libpulsedsp-references-libpulsecore.patch      |   24 ----
 .../pulseaudio/pulseaudio-0.9.10/libtool2.patch    |   48 --------
 .../pa-drop-caps-returns-void.patch                |   17 ---
 recipes/pulseaudio/pulseaudio-0.9.11/2113.diff     |   19 ---
 recipes/pulseaudio/pulseaudio-0.9.11/2114.diff     |   15 ---
 .../pulseaudio/pulseaudio-0.9.11/buildfix.patch    |   13 --
 .../pulseaudio/pulseaudio-0.9.11/libiconv.patch    |   22 ----
 .../libpulsedsp-references-libpulsecore.patch      |   24 ----
 .../pulseaudio/pulseaudio-0.9.11/libtool2.patch    |   48 --------
 .../pa-drop-caps-returns-void.patch                |   17 ---
 .../pulseaudio-0.9.15/configure-ac.patch           |   11 ++
 .../pulseaudio-0.9.19/autoconf_version.patch       |   13 --
 .../pulseaudio/pulseaudio-0.9.19/buildfix.patch    |   13 --
 .../pulseaudio-0.9.19/configure_silent_rules.patch |   29 -----
 .../pulseaudio-0.9.19/fixbluezbuild.patch          |   13 --
 .../pulseaudio-0.9.19/gcc4-compile-fix.patch       |   18 ---
 recipes/pulseaudio/pulseaudio-0.9.19/gettext.patch |  127 --------------------
 recipes/pulseaudio/pulseaudio-0.9.19/tls_m4.patch  |   30 -----
 .../pulseaudio-0.9.19/volatiles.04_pulse           |    2 -
 recipes/pulseaudio/pulseaudio.inc                  |    3 +-
 recipes/pulseaudio/pulseaudio_0.9.10.bb            |   29 -----
 recipes/pulseaudio/pulseaudio_0.9.11.bb            |   34 -----
 recipes/pulseaudio/pulseaudio_0.9.15.bb            |    1 +
 recipes/pulseaudio/pulseaudio_0.9.19.bb            |   29 -----
 recipes/pulseaudio/pulseaudio_0.9.6.bb             |    6 -
 recipes/pulseaudio/pulseaudio_0.9.9.bb             |   18 ---
 30 files changed, 13 insertions(+), 677 deletions(-)
 delete mode 100644 recipes/pulseaudio/files/configure-ac.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.10/2113.diff
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.10/2114.diff
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.10/libiconv.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.10/libpulsedsp-references-libpulsecore.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.10/libtool2.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.10/pa-drop-caps-returns-void.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.11/2113.diff
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.11/2114.diff
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.11/buildfix.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.11/libiconv.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.11/libpulsedsp-references-libpulsecore.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.11/libtool2.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.11/pa-drop-caps-returns-void.patch
 create mode 100644 recipes/pulseaudio/pulseaudio-0.9.15/configure-ac.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.19/autoconf_version.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.19/buildfix.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.19/configure_silent_rules.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.19/fixbluezbuild.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.19/gcc4-compile-fix.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.19/gettext.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.19/tls_m4.patch
 delete mode 100644 recipes/pulseaudio/pulseaudio-0.9.19/volatiles.04_pulse
 delete mode 100644 recipes/pulseaudio/pulseaudio_0.9.10.bb
 delete mode 100644 recipes/pulseaudio/pulseaudio_0.9.11.bb
 delete mode 100644 recipes/pulseaudio/pulseaudio_0.9.19.bb
 delete mode 100644 recipes/pulseaudio/pulseaudio_0.9.6.bb
 delete mode 100644 recipes/pulseaudio/pulseaudio_0.9.9.bb

diff --git a/recipes/pulseaudio/files/configure-ac.patch b/recipes/pulseaudio/files/configure-ac.patch
deleted file mode 100644
index 7863a12..0000000
--- a/recipes/pulseaudio/files/configure-ac.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- pulseaudio-0.9.15/configure.ac-orig	2010-03-19 07:06:56.000000000 -0700
-+++ pulseaudio-0.9.15/configure.ac	2010-03-22 14:06:06.000000000 -0700
-@@ -1294,7 +1294,7 @@ fi
- AC_ARG_WITH(
-         [module-dir],
-         AS_HELP_STRING([--with-module-dir],[Directory where to install the modules to (defaults to ${libdir}/pulse-${PA_MAJORMINORMICRO}/modules/]),
--        [modlibexecdir=$withval], [modlibexecdir="${libdir}/pulse-${PA_MAJORMINORMICRO}/modules/"])
-+        [modlibexecdir=$withval], [modlibexecdir="${libdir}/pulse-${PA_MAJORMINORMICRO}/modules"])
- 
- AC_SUBST(modlibexecdir)
- 
diff --git a/recipes/pulseaudio/pulseaudio-0.9.10/2113.diff b/recipes/pulseaudio/pulseaudio-0.9.10/2113.diff
deleted file mode 100644
index 666ed34..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.10/2113.diff
+++ /dev/null
@@ -1,19 +0,0 @@
-from upstream svn r2113
-
-Index: configure.ac
-===================================================================
---- configure.ac	(wersja 2112)
-+++ configure.ac	(wersja 2113)
-@@ -172,6 +172,12 @@
- AC_SUBST(LIBLTDL)
- AC_CONFIG_SUBDIRS(libltdl)
- 
-+old_LIBS=$LIBS
-+LIBS="$LIBS $LIBLTDL"
-+AC_CHECK_FUNCS([lt_dlmutex_register])
-+LIBS=$old_LIBS
-+AC_CHECK_TYPES([lt_user_dlloader, lt_dladvise], , , [#include <ltdl.h>])
-+
- if test "x$enable_ltdl_install" = "xno" && test "x$ac_cv_lib_ltdl_lt_dlinit" = "xno" ; then
-     AC_MSG_ERROR([[
- 
diff --git a/recipes/pulseaudio/pulseaudio-0.9.10/2114.diff b/recipes/pulseaudio/pulseaudio-0.9.10/2114.diff
deleted file mode 100644
index cbd82ee..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.10/2114.diff
+++ /dev/null
@@ -1,15 +0,0 @@
-from upstream svn r2114
-
-Index: configure.ac
-===================================================================
---- configure.ac	(wersja 2113)
-+++ configure.ac	(wersja 2114)
-@@ -176,7 +176,7 @@
- LIBS="$LIBS $LIBLTDL"
- AC_CHECK_FUNCS([lt_dlmutex_register])
- LIBS=$old_LIBS
--AC_CHECK_TYPES([lt_user_dlloader, lt_dladvise], , , [#include <ltdl.h>])
-+AC_CHECK_TYPES([struct lt_user_dlloader, lt_dladvise], , , [#include <ltdl.h>])
- 
- if test "x$enable_ltdl_install" = "xno" && test "x$ac_cv_lib_ltdl_lt_dlinit" = "xno" ; then
-     AC_MSG_ERROR([[
diff --git a/recipes/pulseaudio/pulseaudio-0.9.10/libiconv.patch b/recipes/pulseaudio/pulseaudio-0.9.10/libiconv.patch
deleted file mode 100644
index 273b446..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.10/libiconv.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: pulseaudio-0.9.10/src/Makefile.am
-===================================================================
---- pulseaudio-0.9.10.orig/src/Makefile.am	2008-07-20 13:16:51.548858829 +0200
-+++ pulseaudio-0.9.10/src/Makefile.am	2008-07-20 13:43:39.842031837 +0200
-@@ -551,7 +551,7 @@
- 
- libpulse_la_CFLAGS = $(AM_CFLAGS)
- libpulse_la_LDFLAGS = -version-info $(LIBPULSE_VERSION_INFO) -Wl,-version-script=$(srcdir)/map-file
--libpulse_la_LIBADD = $(AM_LIBADD) $(WINSOCK_LIBS) $(LIBICONV)
-+libpulse_la_LIBADD = $(AM_LIBADD) $(WINSOCK_LIBS) $(LTLIBICONV)
- 
- if HAVE_X11
- libpulse_la_CFLAGS += $(X_CFLAGS)
-@@ -771,7 +771,7 @@
- 
- libpulsecore_la_CPPFLAGS = $(AM_CPPFLAGS) $(LIBOIL_CFLAGS)
- libpulsecore_la_LDFLAGS = -version-info $(LIBPULSECORE_VERSION_INFO)
--libpulsecore_la_LIBADD = $(AM_LIBADD) $(LIBLTDL) $(LIBSAMPLERATE_LIBS) $(LIBSNDFILE_LIBS) $(WINSOCK_LIBS) $(LIBOIL_LIBS) $(LIBICONV) libspeex-resampler-fixed.la libspeex-resampler-float.la libffmpeg-resampler.la
-+libpulsecore_la_LIBADD = $(AM_LIBADD) $(LIBLTDL) $(LIBSAMPLERATE_LIBS) $(LIBSNDFILE_LIBS) $(WINSOCK_LIBS) $(LIBOIL_LIBS) $(LTLIBICONV) libspeex-resampler-fixed.la libspeex-resampler-float.la libffmpeg-resampler.la
- 
- ###################################
- #   Plug-in support libraries     #
diff --git a/recipes/pulseaudio/pulseaudio-0.9.10/libpulsedsp-references-libpulsecore.patch b/recipes/pulseaudio/pulseaudio-0.9.10/libpulsedsp-references-libpulsecore.patch
deleted file mode 100644
index 4234af5..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.10/libpulsedsp-references-libpulsecore.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-upstream: http://pulseaudio.org/ticket/287
-
-Index: pulseaudio-0.9.10/src/Makefile.am
-===================================================================
---- pulseaudio-0.9.10.orig/src/Makefile.am	2008-03-30 03:43:05.000000000 +0200
-+++ pulseaudio-0.9.10/src/Makefile.am	2008-05-03 11:55:46.000000000 +0200
-@@ -605,7 +605,7 @@
- 
- libpulsedsp_la_SOURCES = utils/padsp.c
- libpulsedsp_la_CFLAGS = $(AM_CFLAGS)
--libpulsedsp_la_LIBADD = $(AM_LIBADD) libpulse.la
-+libpulsedsp_la_LIBADD = $(AM_LIBADD) libpulse.la libpulsecore.la
- libpulsedsp_la_LDFLAGS = -avoid-version
- 
- ###################################
-@@ -888,7 +888,7 @@
- 
- libpstream_util_la_SOURCES = pulsecore/pstream-util.c pulsecore/pstream-util.h
- libpstream_util_la_LDFLAGS = -avoid-version
--libpstream_util_la_LIBADD = $(AM_LIBADD) libpacket.la libpstream.la libtagstruct.la
-+libpstream_util_la_LIBADD = $(AM_LIBADD) libpacket.la libpstream.la libtagstruct.la libpulsecore.la
- 
- libpdispatch_la_SOURCES = pulsecore/pdispatch.c pulsecore/pdispatch.h
- libpdispatch_la_LDFLAGS = -avoid-version
diff --git a/recipes/pulseaudio/pulseaudio-0.9.10/libtool2.patch b/recipes/pulseaudio/pulseaudio-0.9.10/libtool2.patch
deleted file mode 100644
index 9e9e5f5..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.10/libtool2.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Tell where is libltdl from libtool - was needed to get it built with libtool 2.2.4
-
----
- configure.ac |   26 +++++++++++++++++++-------
- 1 file changed, 19 insertions(+), 7 deletions(-)
-
---- pulseaudio-0.9.10.orig/configure.ac
-+++ pulseaudio-0.9.10/configure.ac
-@@ -242,20 +242,32 @@ if test $ret -eq 0 ; then
- else
-     AC_MSG_RESULT([no])
- fi
- 
- #### libtool stuff ####
--
--AC_LTDL_ENABLE_INSTALL
--AC_LIBLTDL_INSTALLABLE
--AC_LIBTOOL_DLOPEN
--AC_LIBTOOL_WIN32_DLL
-+LT_PREREQ([2.2])
-+LT_INIT([dlopen win32-dll])
- AC_PROG_LIBTOOL
--AC_SUBST(LTDLINCL)
--AC_SUBST(LIBLTDL)
-+#AC_SUBST(LTDLINCL)
-+#AC_SUBST(LIBLTDL)
- AC_CONFIG_SUBDIRS(libltdl)
- 
-+AC_ARG_WITH(libltdl-libs,
-+	[  --with-libltdl-libs=DIR  path to libltdl libs], libltdl_libs_prefix=$withval)
-+if test x$libltdl_libs_prefix != x; then
-+	LIBLTDL="-L${libltdl_libs_prefix}/libltdl.so -lltdl"
-+fi
-+AC_SUBST(LIBLTDL)
-+
-+AC_ARG_WITH(libltdl-includes,
-+	[  --with-libltdl-includes=DIR  path to libltdl includes], libltdl_prefix=$withval)
-+if test x$libltdl_prefix != x; then
-+	LTDLINCL="-I${libltdl_prefix} ${libltdl_libs_prefix}/libltdl.so"
-+fi
-+AC_SUBST(LTDLINCL)
-+
-+
- old_LIBS=$LIBS
- LIBS="$LIBS $LIBLTDL"
- AC_CHECK_FUNCS([lt_dlmutex_register])
- LIBS=$old_LIBS
- AC_CHECK_TYPES([struct lt_user_dlloader, lt_dladvise], , , [#include <ltdl.h>])
diff --git a/recipes/pulseaudio/pulseaudio-0.9.10/pa-drop-caps-returns-void.patch b/recipes/pulseaudio/pulseaudio-0.9.10/pa-drop-caps-returns-void.patch
deleted file mode 100644
index 74ea6ac..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.10/pa-drop-caps-returns-void.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-upstream: http://pulseaudio.org/changeset/2213
-
-Index: pulseaudio-0.9.10/src/daemon/caps.c
-===================================================================
---- pulseaudio-0.9.10.orig/src/daemon/caps.c	2008-05-03 12:10:26.000000000 +0200
-+++ pulseaudio-0.9.10/src/daemon/caps.c	2008-05-03 12:10:30.000000000 +0200
-@@ -131,9 +131,8 @@
-     return 0;
- }
- 
--int pa_drop_caps(void) {
-+void pa_drop_caps(void) {
-     pa_drop_root();
--    return 0;
- }
- 
- #endif
diff --git a/recipes/pulseaudio/pulseaudio-0.9.11/2113.diff b/recipes/pulseaudio/pulseaudio-0.9.11/2113.diff
deleted file mode 100644
index 666ed34..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.11/2113.diff
+++ /dev/null
@@ -1,19 +0,0 @@
-from upstream svn r2113
-
-Index: configure.ac
-===================================================================
---- configure.ac	(wersja 2112)
-+++ configure.ac	(wersja 2113)
-@@ -172,6 +172,12 @@
- AC_SUBST(LIBLTDL)
- AC_CONFIG_SUBDIRS(libltdl)
- 
-+old_LIBS=$LIBS
-+LIBS="$LIBS $LIBLTDL"
-+AC_CHECK_FUNCS([lt_dlmutex_register])
-+LIBS=$old_LIBS
-+AC_CHECK_TYPES([lt_user_dlloader, lt_dladvise], , , [#include <ltdl.h>])
-+
- if test "x$enable_ltdl_install" = "xno" && test "x$ac_cv_lib_ltdl_lt_dlinit" = "xno" ; then
-     AC_MSG_ERROR([[
- 
diff --git a/recipes/pulseaudio/pulseaudio-0.9.11/2114.diff b/recipes/pulseaudio/pulseaudio-0.9.11/2114.diff
deleted file mode 100644
index cbd82ee..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.11/2114.diff
+++ /dev/null
@@ -1,15 +0,0 @@
-from upstream svn r2114
-
-Index: configure.ac
-===================================================================
---- configure.ac	(wersja 2113)
-+++ configure.ac	(wersja 2114)
-@@ -176,7 +176,7 @@
- LIBS="$LIBS $LIBLTDL"
- AC_CHECK_FUNCS([lt_dlmutex_register])
- LIBS=$old_LIBS
--AC_CHECK_TYPES([lt_user_dlloader, lt_dladvise], , , [#include <ltdl.h>])
-+AC_CHECK_TYPES([struct lt_user_dlloader, lt_dladvise], , , [#include <ltdl.h>])
- 
- if test "x$enable_ltdl_install" = "xno" && test "x$ac_cv_lib_ltdl_lt_dlinit" = "xno" ; then
-     AC_MSG_ERROR([[
diff --git a/recipes/pulseaudio/pulseaudio-0.9.11/buildfix.patch b/recipes/pulseaudio/pulseaudio-0.9.11/buildfix.patch
deleted file mode 100644
index ca01e0d..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.11/buildfix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: pulseaudio-0.9.11/src/pulsecore/atomic.h
-===================================================================
---- pulseaudio-0.9.11.orig/src/pulsecore/atomic.h
-+++ pulseaudio-0.9.11/src/pulsecore/atomic.h
-@@ -40,6 +40,8 @@
- #error "Please include config.h before including this file!"
- #endif
- 
-+#include "macro.h"
-+
- #ifdef HAVE_ATOMIC_BUILTINS
- 
- /* __sync based implementation */
diff --git a/recipes/pulseaudio/pulseaudio-0.9.11/libiconv.patch b/recipes/pulseaudio/pulseaudio-0.9.11/libiconv.patch
deleted file mode 100644
index 273b446..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.11/libiconv.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: pulseaudio-0.9.10/src/Makefile.am
-===================================================================
---- pulseaudio-0.9.10.orig/src/Makefile.am	2008-07-20 13:16:51.548858829 +0200
-+++ pulseaudio-0.9.10/src/Makefile.am	2008-07-20 13:43:39.842031837 +0200
-@@ -551,7 +551,7 @@
- 
- libpulse_la_CFLAGS = $(AM_CFLAGS)
- libpulse_la_LDFLAGS = -version-info $(LIBPULSE_VERSION_INFO) -Wl,-version-script=$(srcdir)/map-file
--libpulse_la_LIBADD = $(AM_LIBADD) $(WINSOCK_LIBS) $(LIBICONV)
-+libpulse_la_LIBADD = $(AM_LIBADD) $(WINSOCK_LIBS) $(LTLIBICONV)
- 
- if HAVE_X11
- libpulse_la_CFLAGS += $(X_CFLAGS)
-@@ -771,7 +771,7 @@
- 
- libpulsecore_la_CPPFLAGS = $(AM_CPPFLAGS) $(LIBOIL_CFLAGS)
- libpulsecore_la_LDFLAGS = -version-info $(LIBPULSECORE_VERSION_INFO)
--libpulsecore_la_LIBADD = $(AM_LIBADD) $(LIBLTDL) $(LIBSAMPLERATE_LIBS) $(LIBSNDFILE_LIBS) $(WINSOCK_LIBS) $(LIBOIL_LIBS) $(LIBICONV) libspeex-resampler-fixed.la libspeex-resampler-float.la libffmpeg-resampler.la
-+libpulsecore_la_LIBADD = $(AM_LIBADD) $(LIBLTDL) $(LIBSAMPLERATE_LIBS) $(LIBSNDFILE_LIBS) $(WINSOCK_LIBS) $(LIBOIL_LIBS) $(LTLIBICONV) libspeex-resampler-fixed.la libspeex-resampler-float.la libffmpeg-resampler.la
- 
- ###################################
- #   Plug-in support libraries     #
diff --git a/recipes/pulseaudio/pulseaudio-0.9.11/libpulsedsp-references-libpulsecore.patch b/recipes/pulseaudio/pulseaudio-0.9.11/libpulsedsp-references-libpulsecore.patch
deleted file mode 100644
index 4234af5..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.11/libpulsedsp-references-libpulsecore.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-upstream: http://pulseaudio.org/ticket/287
-
-Index: pulseaudio-0.9.10/src/Makefile.am
-===================================================================
---- pulseaudio-0.9.10.orig/src/Makefile.am	2008-03-30 03:43:05.000000000 +0200
-+++ pulseaudio-0.9.10/src/Makefile.am	2008-05-03 11:55:46.000000000 +0200
-@@ -605,7 +605,7 @@
- 
- libpulsedsp_la_SOURCES = utils/padsp.c
- libpulsedsp_la_CFLAGS = $(AM_CFLAGS)
--libpulsedsp_la_LIBADD = $(AM_LIBADD) libpulse.la
-+libpulsedsp_la_LIBADD = $(AM_LIBADD) libpulse.la libpulsecore.la
- libpulsedsp_la_LDFLAGS = -avoid-version
- 
- ###################################
-@@ -888,7 +888,7 @@
- 
- libpstream_util_la_SOURCES = pulsecore/pstream-util.c pulsecore/pstream-util.h
- libpstream_util_la_LDFLAGS = -avoid-version
--libpstream_util_la_LIBADD = $(AM_LIBADD) libpacket.la libpstream.la libtagstruct.la
-+libpstream_util_la_LIBADD = $(AM_LIBADD) libpacket.la libpstream.la libtagstruct.la libpulsecore.la
- 
- libpdispatch_la_SOURCES = pulsecore/pdispatch.c pulsecore/pdispatch.h
- libpdispatch_la_LDFLAGS = -avoid-version
diff --git a/recipes/pulseaudio/pulseaudio-0.9.11/libtool2.patch b/recipes/pulseaudio/pulseaudio-0.9.11/libtool2.patch
deleted file mode 100644
index 9e9e5f5..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.11/libtool2.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Tell where is libltdl from libtool - was needed to get it built with libtool 2.2.4
-
----
- configure.ac |   26 +++++++++++++++++++-------
- 1 file changed, 19 insertions(+), 7 deletions(-)
-
---- pulseaudio-0.9.10.orig/configure.ac
-+++ pulseaudio-0.9.10/configure.ac
-@@ -242,20 +242,32 @@ if test $ret -eq 0 ; then
- else
-     AC_MSG_RESULT([no])
- fi
- 
- #### libtool stuff ####
--
--AC_LTDL_ENABLE_INSTALL
--AC_LIBLTDL_INSTALLABLE
--AC_LIBTOOL_DLOPEN
--AC_LIBTOOL_WIN32_DLL
-+LT_PREREQ([2.2])
-+LT_INIT([dlopen win32-dll])
- AC_PROG_LIBTOOL
--AC_SUBST(LTDLINCL)
--AC_SUBST(LIBLTDL)
-+#AC_SUBST(LTDLINCL)
-+#AC_SUBST(LIBLTDL)
- AC_CONFIG_SUBDIRS(libltdl)
- 
-+AC_ARG_WITH(libltdl-libs,
-+	[  --with-libltdl-libs=DIR  path to libltdl libs], libltdl_libs_prefix=$withval)
-+if test x$libltdl_libs_prefix != x; then
-+	LIBLTDL="-L${libltdl_libs_prefix}/libltdl.so -lltdl"
-+fi
-+AC_SUBST(LIBLTDL)
-+
-+AC_ARG_WITH(libltdl-includes,
-+	[  --with-libltdl-includes=DIR  path to libltdl includes], libltdl_prefix=$withval)
-+if test x$libltdl_prefix != x; then
-+	LTDLINCL="-I${libltdl_prefix} ${libltdl_libs_prefix}/libltdl.so"
-+fi
-+AC_SUBST(LTDLINCL)
-+
-+
- old_LIBS=$LIBS
- LIBS="$LIBS $LIBLTDL"
- AC_CHECK_FUNCS([lt_dlmutex_register])
- LIBS=$old_LIBS
- AC_CHECK_TYPES([struct lt_user_dlloader, lt_dladvise], , , [#include <ltdl.h>])
diff --git a/recipes/pulseaudio/pulseaudio-0.9.11/pa-drop-caps-returns-void.patch b/recipes/pulseaudio/pulseaudio-0.9.11/pa-drop-caps-returns-void.patch
deleted file mode 100644
index 74ea6ac..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.11/pa-drop-caps-returns-void.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-upstream: http://pulseaudio.org/changeset/2213
-
-Index: pulseaudio-0.9.10/src/daemon/caps.c
-===================================================================
---- pulseaudio-0.9.10.orig/src/daemon/caps.c	2008-05-03 12:10:26.000000000 +0200
-+++ pulseaudio-0.9.10/src/daemon/caps.c	2008-05-03 12:10:30.000000000 +0200
-@@ -131,9 +131,8 @@
-     return 0;
- }
- 
--int pa_drop_caps(void) {
-+void pa_drop_caps(void) {
-     pa_drop_root();
--    return 0;
- }
- 
- #endif
diff --git a/recipes/pulseaudio/pulseaudio-0.9.15/configure-ac.patch b/recipes/pulseaudio/pulseaudio-0.9.15/configure-ac.patch
new file mode 100644
index 0000000..7863a12
--- /dev/null
+++ b/recipes/pulseaudio/pulseaudio-0.9.15/configure-ac.patch
@@ -0,0 +1,11 @@
+--- pulseaudio-0.9.15/configure.ac-orig	2010-03-19 07:06:56.000000000 -0700
++++ pulseaudio-0.9.15/configure.ac	2010-03-22 14:06:06.000000000 -0700
+@@ -1294,7 +1294,7 @@ fi
+ AC_ARG_WITH(
+         [module-dir],
+         AS_HELP_STRING([--with-module-dir],[Directory where to install the modules to (defaults to ${libdir}/pulse-${PA_MAJORMINORMICRO}/modules/]),
+-        [modlibexecdir=$withval], [modlibexecdir="${libdir}/pulse-${PA_MAJORMINORMICRO}/modules/"])
++        [modlibexecdir=$withval], [modlibexecdir="${libdir}/pulse-${PA_MAJORMINORMICRO}/modules"])
+ 
+ AC_SUBST(modlibexecdir)
+ 
diff --git a/recipes/pulseaudio/pulseaudio-0.9.19/autoconf_version.patch b/recipes/pulseaudio/pulseaudio-0.9.19/autoconf_version.patch
deleted file mode 100644
index 7a0759d..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.19/autoconf_version.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: pulseaudio-0.9.15/configure.ac
-===================================================================
---- pulseaudio-0.9.15.orig/configure.ac	2009-04-14 00:09:53.000000000 +0100
-+++ pulseaudio-0.9.15/configure.ac	2009-05-22 11:32:50.000000000 +0100
-@@ -20,7 +20,7 @@
- # along with PulseAudio; if not, write to the Free Software Foundation,
- # Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
- 
--AC_PREREQ(2.63)
-+AC_PREREQ(2.61)
- 
- m4_define(pa_major, [0])
- m4_define(pa_minor, [9])
diff --git a/recipes/pulseaudio/pulseaudio-0.9.19/buildfix.patch b/recipes/pulseaudio/pulseaudio-0.9.19/buildfix.patch
deleted file mode 100644
index ca01e0d..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.19/buildfix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: pulseaudio-0.9.11/src/pulsecore/atomic.h
-===================================================================
---- pulseaudio-0.9.11.orig/src/pulsecore/atomic.h
-+++ pulseaudio-0.9.11/src/pulsecore/atomic.h
-@@ -40,6 +40,8 @@
- #error "Please include config.h before including this file!"
- #endif
- 
-+#include "macro.h"
-+
- #ifdef HAVE_ATOMIC_BUILTINS
- 
- /* __sync based implementation */
diff --git a/recipes/pulseaudio/pulseaudio-0.9.19/configure_silent_rules.patch b/recipes/pulseaudio/pulseaudio-0.9.19/configure_silent_rules.patch
deleted file mode 100644
index aeabec2..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.19/configure_silent_rules.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Index: pulseaudio-0.9.19/configure.ac
-===================================================================
---- pulseaudio-0.9.19.orig/configure.ac	2009-10-31 11:40:00.000000000 +0000
-+++ pulseaudio-0.9.19/configure.ac	2009-10-31 11:50:35.000000000 +0000
-@@ -27,12 +27,13 @@
- AC_CONFIG_SRCDIR([src/daemon/main.c])
- AC_CONFIG_MACRO_DIR([m4])
- AC_CONFIG_HEADERS([config.h])
--AM_INIT_AUTOMAKE([foreign 1.11 -Wall -Wno-portability silent-rules tar-pax])
-+AM_INIT_AUTOMAKE([foreign 1.10 -Wall -Wno-portability tar-pax])
- 
- m4_define(pa_major, `echo $VERSION | cut -d. -f1 | cut -d- -f1`)
- m4_define(pa_minor, `echo $VERSION | cut -d. -f2 | cut -d- -f1`)
- m4_define(pa_micro, `echo $VERSION | cut -d. -f3 | cut -d- -f1`)
- 
-+
- AC_SUBST(PA_MAJOR, pa_major)
- AC_SUBST(PA_MINOR, pa_minor)
- AC_SUBST(PA_MICRO, pa_micro)
-@@ -80,7 +81,8 @@
-       ;;
- esac
- 
--AM_SILENT_RULES([yes])
-+# only use if available
-+m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
- #### Checks for programs. ####
- 
diff --git a/recipes/pulseaudio/pulseaudio-0.9.19/fixbluezbuild.patch b/recipes/pulseaudio/pulseaudio-0.9.19/fixbluezbuild.patch
deleted file mode 100644
index d817a62..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.19/fixbluezbuild.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: pulseaudio-0.9.15/src/Makefile.am
-===================================================================
---- pulseaudio-0.9.15.orig/src/Makefile.am	2009-07-07 22:04:21.313945421 +0200
-+++ pulseaudio-0.9.15/src/Makefile.am	2009-07-07 22:04:32.503184920 +0200
-@@ -1534,7 +1534,7 @@
- 
- libbluetooth_ipc_la_SOURCES = modules/bluetooth/ipc.c modules/bluetooth/ipc.h
- libbluetooth_ipc_la_LDFLAGS = -avoid-version
--libbluetooth_ipc_la_LIBADD = $(AM_LIBADD)libpulsecore-@PA_MAJORMINORMICRO@.la libpulsecommon-@PA_MAJORMINORMICRO@.la libpulse.la
-+libbluetooth_ipc_la_LIBADD = $(AM_LIBADD) libpulsecore-@PA_MAJORMINORMICRO@.la libpulsecommon-@PA_MAJORMINORMICRO@.la libpulse.la
- libbluetooth_ipc_la_CFLAGS = $(AM_CFLAGS)
- BLUETOOTH_IPC_FILES = $(subst modules/bluetooth/,,$(libbluetooth_ipc_la_SOURCES)) rtp.h
- 
diff --git a/recipes/pulseaudio/pulseaudio-0.9.19/gcc4-compile-fix.patch b/recipes/pulseaudio/pulseaudio-0.9.19/gcc4-compile-fix.patch
deleted file mode 100644
index 34ad026..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.19/gcc4-compile-fix.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-| fix for more strict syntax compliance in gcc4.x
-| pulsecore/core-util.c: In function 'pa_raise_priority':
-| pulsecore/core-util.c:547: error: label at end of compound statement
-| Signed off: mickey@openmoko.org
-|
-Index: pulseaudio-0.9.6/src/pulsecore/core-util.c
-===================================================================
---- pulseaudio-0.9.6.orig/src/pulsecore/core-util.c
-+++ pulseaudio-0.9.6/src/pulsecore/core-util.c
-@@ -535,7 +535,7 @@ void pa_raise_priority(void) {
-         pa_log_info("Successfully gained high priority class.");
- #endif
- 
--fail:
-+fail:;
- 
- #if defined(HAVE_SYS_CAPABILITY_H)
-     if (caps) {
diff --git a/recipes/pulseaudio/pulseaudio-0.9.19/gettext.patch b/recipes/pulseaudio/pulseaudio-0.9.19/gettext.patch
deleted file mode 100644
index 37e41b9..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.19/gettext.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-Index: pulseaudio-0.9.19/configure.ac
-===================================================================
---- pulseaudio-0.9.19.orig/configure.ac	2009-11-26 14:05:11.000000000 +0100
-+++ pulseaudio-0.9.19/configure.ac	2009-11-26 14:06:28.304369265 +0100
-@@ -483,15 +483,15 @@
- # Check for open64 to know if the current system does have open64() and similar functions
- AC_CHECK_FUNCS_ONCE([open64])
- 
--#### [lib]iconv ####
-+#### localization support ####
- 
- AM_ICONV
--
--IT_PROG_INTLTOOL([0.35.0])
--GETTEXT_PACKAGE=pulseaudio
-+IT_PROG_INTLTOOL([0.37.0])
-+GETTEXT_PACKAGE=$PACKAGE
- AC_SUBST([GETTEXT_PACKAGE])
- AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE],["$GETTEXT_PACKAGE"],[Gettext package])
--AM_GLIB_GNU_GETTEXT
-+AM_GNU_GETTEXT([external])
-+AM_GNU_GETTEXT_VERSION([0.17])
- 
- pulselocaledir='${prefix}/${DATADIRNAME}/locale'
- AC_SUBST(pulselocaledir)
-Index: pulseaudio-0.9.19/src/pulse/i18n.h
-===================================================================
---- pulseaudio-0.9.19.orig/src/pulse/i18n.h	2009-01-28 04:25:54.000000000 +0100
-+++ pulseaudio-0.9.19/src/pulse/i18n.h	2009-11-26 14:06:28.304369265 +0100
-@@ -28,15 +28,13 @@
- 
- PA_C_DECL_BEGIN
- 
--#if !defined(GETTEXT_PACKAGE)
--#error "Something is very wrong here, config.h needs to be included first"
--#endif
-+
- 
- #ifdef ENABLE_NLS
- 
- #include <libintl.h>
- 
--#define _(String) dgettext(GETTEXT_PACKAGE, String)
-+#define _(String) dgettext(PACKAGE, String)
- #ifdef gettext_noop
- #define N_(String) gettext_noop(String)
- #else
-Index: pulseaudio-0.9.19/src/pulse/i18n.c
-===================================================================
---- pulseaudio-0.9.19.orig/src/pulse/i18n.c	2008-10-19 22:25:20.000000000 +0200
-+++ pulseaudio-0.9.19/src/pulse/i18n.c	2009-11-26 14:06:28.304369265 +0100
-@@ -31,8 +31,8 @@
- 
-     PA_ONCE_BEGIN {
- 
--        bindtextdomain(GETTEXT_PACKAGE, PULSE_LOCALEDIR);
--        bind_textdomain_codeset(GETTEXT_PACKAGE, "UTF-8");
-+        bindtextdomain(PACKAGE, PULSE_LOCALEDIR);
-+        bind_textdomain_codeset(PACKAGE, "UTF-8");
- 
-     } PA_ONCE_END;
- }
-Index: pulseaudio-0.9.19/src/utils/pacat.c
-===================================================================
---- pulseaudio-0.9.19.orig/src/utils/pacat.c	2009-09-18 22:21:44.000000000 +0200
-+++ pulseaudio-0.9.19/src/utils/pacat.c	2009-11-26 14:06:28.304369265 +0100
-@@ -699,7 +699,7 @@
-     };
- 
-     setlocale(LC_ALL, "");
--    bindtextdomain(GETTEXT_PACKAGE, PULSE_LOCALEDIR);
-+    bindtextdomain(PACKAGE, PULSE_LOCALEDIR);
- 
-     bn = pa_path_get_filename(argv[0]);
- 
-Index: pulseaudio-0.9.19/src/utils/pacmd.c
-===================================================================
---- pulseaudio-0.9.19.orig/src/utils/pacmd.c	2009-08-19 04:17:06.000000000 +0200
-+++ pulseaudio-0.9.19/src/utils/pacmd.c	2009-11-26 14:06:28.307708271 +0100
-@@ -63,7 +63,7 @@
-     struct pollfd pollfd[N_WATCH];
- 
-     setlocale(LC_ALL, "");
--    bindtextdomain(GETTEXT_PACKAGE, PULSE_LOCALEDIR);
-+    bindtextdomain(PACKAGE, PULSE_LOCALEDIR);
- 
-     if (pa_pid_file_check_running(&pid, "pulseaudio") < 0) {
-         pa_log(_("No PulseAudio daemon running, or not running as session daemon."));
-Index: pulseaudio-0.9.19/src/utils/pactl.c
-===================================================================
---- pulseaudio-0.9.19.orig/src/utils/pactl.c	2009-09-10 02:04:58.000000000 +0200
-+++ pulseaudio-0.9.19/src/utils/pactl.c	2009-11-26 14:06:28.307708271 +0100
-@@ -916,7 +916,7 @@
-     };
- 
-     setlocale(LC_ALL, "");
--    bindtextdomain(GETTEXT_PACKAGE, PULSE_LOCALEDIR);
-+    bindtextdomain(PACKAGE, PULSE_LOCALEDIR);
- 
-     bn = pa_path_get_filename(argv[0]);
- 
-Index: pulseaudio-0.9.19/src/utils/pasuspender.c
-===================================================================
---- pulseaudio-0.9.19.orig/src/utils/pasuspender.c	2009-06-08 00:35:57.000000000 +0200
-+++ pulseaudio-0.9.19/src/utils/pasuspender.c	2009-11-26 14:06:28.307708271 +0100
-@@ -233,7 +233,7 @@
-     };
- 
-     setlocale(LC_ALL, "");
--    bindtextdomain(GETTEXT_PACKAGE, PULSE_LOCALEDIR);
-+    bindtextdomain(PACKAGE, PULSE_LOCALEDIR);
- 
-     bn = pa_path_get_filename(argv[0]);
- 
-Index: pulseaudio-0.9.19/src/utils/pax11publish.c
-===================================================================
---- pulseaudio-0.9.19.orig/src/utils/pax11publish.c	2009-03-05 12:28:10.000000000 +0100
-+++ pulseaudio-0.9.19/src/utils/pax11publish.c	2009-11-26 14:06:28.307708271 +0100
-@@ -50,7 +50,7 @@
-     enum { DUMP, EXPORT, IMPORT, REMOVE } mode = DUMP;
- 
-     setlocale(LC_ALL, "");
--    bindtextdomain(GETTEXT_PACKAGE, PULSE_LOCALEDIR);
-+    bindtextdomain(PACKAGE, PULSE_LOCALEDIR);
- 
-     while ((c = getopt(argc, argv, "deiD:S:O:I:c:hr")) != -1) {
-         switch (c) {
diff --git a/recipes/pulseaudio/pulseaudio-0.9.19/tls_m4.patch b/recipes/pulseaudio/pulseaudio-0.9.19/tls_m4.patch
deleted file mode 100644
index 7b333e3..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.19/tls_m4.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Index: pulseaudio-0.9.15/m4/tls.m4
-===================================================================
---- pulseaudio-0.9.15.orig/m4/tls.m4	2008-08-19 23:25:02.000000000 +0200
-+++ pulseaudio-0.9.15/m4/tls.m4	2009-07-10 09:55:25.266365511 +0200
-@@ -1,12 +1,19 @@
- AC_DEFUN([CC_CHECK_TLS], [
-   AC_CACHE_CHECK([whether $CC knows __thread for Thread-Local Storage],
-     cc_cv_tls___thread,
--    [AC_COMPILE_IFELSE(
--      AC_LANG_PROGRAM(
--        [[static __thread int a = 6;]],
--        [[a = 5;]]),
--      [cc_cv_tls___thread=yes],
--      [cc_cv_tls___thread=no])
-+    [AC_LINK_IFELSE([__thread int a; int b; int main() { return a = b; }],
-+	 [chktls_save_LDFLAGS="$LDFLAGS"
-+	  LDFLAGS="-shared -Wl,--no-undefined $LDFLAGS"
-+	  chktls_save_CFLAGS="$CFLAGS"
-+	  CFLAGS="-fPIC $CFLAGS"
-+	  dnl If -shared works, test if TLS works in a shared library.
-+	  AC_LINK_IFELSE([int f() { return 0; }],
-+	    AC_LINK_IFELSE([__thread int a; int b; int f() { return a = b; }],
-+	      [cc_cv_tls___thread=yes],
-+	      [cc_cv_tls___thread=no]),
-+	    [cc_cv_tls___thread=yes])
-+	  CFLAGS="$chktls_save_CFLAGS"
-+	  LDFLAGS="$chktls_save_LDFLAGS"], [cc_cv_tls___thread=no])
-     ])
-   
-   AS_IF([test "x$cc_cv_tls___thread" = "xyes"],
diff --git a/recipes/pulseaudio/pulseaudio-0.9.19/volatiles.04_pulse b/recipes/pulseaudio/pulseaudio-0.9.19/volatiles.04_pulse
deleted file mode 100644
index 5b19980..0000000
--- a/recipes/pulseaudio/pulseaudio-0.9.19/volatiles.04_pulse
+++ /dev/null
@@ -1,2 +0,0 @@
-# <type> <owner> <group> <mode> <path> <linksource>
-d pulse pulse 0755 /var/run/pulse none
diff --git a/recipes/pulseaudio/pulseaudio.inc b/recipes/pulseaudio/pulseaudio.inc
index 4504656..a7129dd 100644
--- a/recipes/pulseaudio/pulseaudio.inc
+++ b/recipes/pulseaudio/pulseaudio.inc
@@ -6,11 +6,10 @@ LICENSE = "LGPL"
 DEPENDS = "bluez4 libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool hal virtual/libx11"
 # optional
 DEPENDS += "alsa-lib glib-2.0 dbus consolekit hal openssl"
-INC_PR = "r9"
+INC_PR = "r10"
 
 SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
            file://gcc4-compile-fix.patch \
-           file://configure-ac.patch \
            file://volatiles.04_pulse"
 
 inherit autotools pkgconfig
diff --git a/recipes/pulseaudio/pulseaudio_0.9.10.bb b/recipes/pulseaudio/pulseaudio_0.9.10.bb
deleted file mode 100644
index 458766e..0000000
--- a/recipes/pulseaudio/pulseaudio_0.9.10.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require pulseaudio.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI += "\
-  file://disable-using-glibc-tls.patch \
-  file://libpulsedsp-references-libpulsecore.patch \
-  file://pa-drop-caps-returns-void.patch \
-#  file://libtool2.patch \
-  file://2113.diff;striplevel=0 \
-  file://2114.diff;striplevel=0 \
-  file://libiconv.patch \
-"            
-
-do_compile_prepend() {
-    cd ${S}
-    mkdir -p ${S}/libltdl
-    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
-}
-
-
-# problems w/ pulseaudio 0.9.10 atm:
-# 1.) needs libltdl >= 1.5.24 (yes, any older version will NOT work at runtime)
-# 2.) doesn't build w/ glibc TLS support (hence patched out)
-# 3.) fails with hierarchical pthread stuff w/ gst-pulse (hence patched out)
-
-
-SRC_URI[md5sum] = "9187ac1b302b9ab45f355242f453882e"
-SRC_URI[sha256sum] = "1ae8b587759b33ad954e717728fab6df58bd28088d0ac8faf22e90253b774975"
diff --git a/recipes/pulseaudio/pulseaudio_0.9.11.bb b/recipes/pulseaudio/pulseaudio_0.9.11.bb
deleted file mode 100644
index 4f12b7b..0000000
--- a/recipes/pulseaudio/pulseaudio_0.9.11.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-require pulseaudio.inc
-
-DEPENDS += "gdbm speex"
-PR = "${INC_PR}.1"
-
-# work in progress
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI += "\
-  file://disable-using-glibc-tls.patch \
-  file://buildfix.patch \
-#  file://libpulsedsp-references-libpulsecore.patch \
-#  file://pa-drop-caps-returns-void.patch \
-#  file://libtool2.patch \
-  file://2113.diff;striplevel=0 \
-  file://2114.diff;striplevel=0 \
-#  file://libiconv.patch \
-"            
-
-do_compile_prepend() {
-    cd ${S}
-    mkdir -p ${S}/libltdl
-    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
-}
-
-
-# problems w/ pulseaudio 0.9.10 atm:
-# 1.) needs libltdl >= 1.5.24 (yes, any older version will NOT work at runtime)
-# 2.) doesn't build w/ glibc TLS support (hence patched out)
-# 3.) fails with hierarchical pthread stuff w/ gst-pulse (hence patched out)
-
-
-SRC_URI[md5sum] = "fa121f8e5dd4b98d65096de1b6c84021"
-SRC_URI[sha256sum] = "6cc4aff778275f087cfbd65d2040b1587cafc588749499a452eb496329505ab0"
diff --git a/recipes/pulseaudio/pulseaudio_0.9.15.bb b/recipes/pulseaudio/pulseaudio_0.9.15.bb
index e95b7d4..d910e48 100644
--- a/recipes/pulseaudio/pulseaudio_0.9.15.bb
+++ b/recipes/pulseaudio/pulseaudio_0.9.15.bb
@@ -6,6 +6,7 @@ PR = "${INC_PR}.6"
 inherit gettext
 
 SRC_URI += "\
+  file://configure-ac.patch \
   file://buildfix.patch \
   file://alsaerror.patch \
   file://periodfix.patch \
diff --git a/recipes/pulseaudio/pulseaudio_0.9.19.bb b/recipes/pulseaudio/pulseaudio_0.9.19.bb
deleted file mode 100644
index a0ba1a0..0000000
--- a/recipes/pulseaudio/pulseaudio_0.9.19.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require pulseaudio.inc
-
-DEPENDS += "gdbm speex"
-
-DEFAULT_PREFERENCE_om-gta01 = "-1"
-DEFAULT_PREFERENCE_om-gta02 = "-1"
-DEFAULT_PREFERENCE_motorola-ezx = "-1"
-
-PR = "${INC_PR}.0"
-
-inherit gettext
-
-SRC_URI += "\
-  file://buildfix.patch \
-  file://autoconf_version.patch \
-  file://tls_m4.patch \
-  file://configure_silent_rules.patch \
-  file://gettext.patch \
-  file://fixbluezbuild.patch \
-"
-
-do_compile_prepend() {
-    cd ${S}
-    mkdir -p ${S}/libltdl
-    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
-}
-
-SRC_URI[md5sum] = "02adc2b99252675f0271db3b9edd432e"
-SRC_URI[sha256sum] = "e47e27083deb79571fb2b9215874ddc26d77c3dec2a7dc8de5ecec9058e4b806"
diff --git a/recipes/pulseaudio/pulseaudio_0.9.6.bb b/recipes/pulseaudio/pulseaudio_0.9.6.bb
deleted file mode 100644
index 4863ecc..0000000
--- a/recipes/pulseaudio/pulseaudio_0.9.6.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require pulseaudio.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "669d52a70fb9a7a83c2507005bfa2a6f"
-SRC_URI[sha256sum] = "b7a5f14eb8cf7076f1df8fb78d4a05c83e1e655474688c48364fa1b96f478d64"
diff --git a/recipes/pulseaudio/pulseaudio_0.9.9.bb b/recipes/pulseaudio/pulseaudio_0.9.9.bb
deleted file mode 100644
index 9babcae..0000000
--- a/recipes/pulseaudio/pulseaudio_0.9.9.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require pulseaudio.inc
-
-PR = "${INC_PR}.1"
-
-# this is not correct (see below)
-SRC_URI += "\
-  file://disable-using-glibc-tls.patch \
-  file://fix-dbus-without-hal.patch \
-  file://fix-shm.patch \
-"            
-
-# problems w/ pulseaudio 0.9.9 atm:
-# 1.) needs libltdl >= 1.5.24 (yes, any older version will NOT work at runtime)
-# 2.) doesn't build w/ glibc TLS support (hence patched out)
-# 3.) fails with hierarchical pthread stuff w/ gst-pulse (hence patched out)
-
-SRC_URI[md5sum] = "8fa6f7a9611bb194d94311764022b197"
-SRC_URI[sha256sum] = "9caab8f9be8a371aea7cd0241aab7ffd4b1043fbc4a8f62736faea4229f11f7d"
-- 
1.7.1



