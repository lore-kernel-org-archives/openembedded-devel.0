Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQjvr-00005Q-8J
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 18:05:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id C1559314B86C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id C6r7LO54Xs2u
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:51 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 17C73314B8D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:50 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 09 Dec 2010 17:03:50 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Dec 2010 17:03:42 +0000
Message-Id: <1291914227-25068-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
References: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_QUOTING autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/8] gstreamer: remove unpinned versions
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
X-List-Received-Date: Thu, 09 Dec 2010 17:05:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/gstreamer/gstreamer/gstreamer.xsession     |    4 -
 recipes/gstreamer/gstreamer/use-gettext-0.18.patch | 1012 --------------=
------
 recipes/gstreamer/gstreamer_0.10.22.bb             |    9 -
 recipes/gstreamer/gstreamer_0.10.23.bb             |   11 -
 recipes/gstreamer/gstreamer_0.10.28.bb             |   16 -
 recipes/gstreamer/gstreamer_0.10.29.bb             |   11 -
 recipes/gstreamer/gstreamer_0.10.30.bb             |   13 -
 7 files changed, 0 insertions(+), 1076 deletions(-)
 delete mode 100644 recipes/gstreamer/gstreamer/gstreamer.xsession
 delete mode 100644 recipes/gstreamer/gstreamer/use-gettext-0.18.patch
 delete mode 100644 recipes/gstreamer/gstreamer_0.10.22.bb
 delete mode 100644 recipes/gstreamer/gstreamer_0.10.23.bb
 delete mode 100644 recipes/gstreamer/gstreamer_0.10.28.bb
 delete mode 100644 recipes/gstreamer/gstreamer_0.10.29.bb
 delete mode 100644 recipes/gstreamer/gstreamer_0.10.30.bb

diff --git a/recipes/gstreamer/gstreamer/gstreamer.xsession b/recipes/gst=
reamer/gstreamer/gstreamer.xsession
deleted file mode 100644
index a260a8d..0000000
--- a/recipes/gstreamer/gstreamer/gstreamer.xsession
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-
-gst-register
-
diff --git a/recipes/gstreamer/gstreamer/use-gettext-0.18.patch b/recipes=
/gstreamer/gstreamer/use-gettext-0.18.patch
deleted file mode 100644
index 504caa8..0000000
--- a/recipes/gstreamer/gstreamer/use-gettext-0.18.patch
+++ /dev/null
@@ -1,1012 +0,0 @@
-This patch it needed to get gstreamer upgraded to use gettext 0.18
-
--Khem
-
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/gettext.m4 gstreamer-0.10.28/common/m4/gettext.m4
---- gstreamer-0.10.28.org/common/m4/gettext.m4	2010-03-08 08:58:16.00000=
0000 -0800
-+++ gstreamer-0.10.28/common/m4/gettext.m4	2010-05-22 08:37:17.713880839=
 -0700
-@@ -1,5 +1,5 @@
--# gettext.m4 serial 60 (gettext-0.17)
--dnl Copyright (C) 1995-2007 Free Software Foundation, Inc.
-+# gettext.m4 serial 63 (gettext-0.18)
-+dnl Copyright (C) 1995-2010 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
-@@ -15,7 +15,7 @@ dnl They are *not* in the public domain.
-=20
- dnl Authors:
- dnl   Ulrich Drepper <drepper@cygnus.com>, 1995-2000.
--dnl   Bruno Haible <haible@clisp.cons.org>, 2000-2006.
-+dnl   Bruno Haible <haible@clisp.cons.org>, 2000-2006, 2008-2010.
-=20
- dnl Macro to add for using GNU gettext.
-=20
-@@ -60,6 +60,8 @@ AC_DEFUN([AM_GNU_GETTEXT],
-   ifelse([$1], [], , [ifelse([$1], [external], , [ifelse([$1], [no-libt=
ool], , [ifelse([$1], [use-libtool], ,
-     [errprint([ERROR: invalid first argument to AM_GNU_GETTEXT
- ])])])])])
-+  ifelse(ifelse([$1], [], [old])[]ifelse([$1], [no-libtool], [old]), [o=
ld],
-+    [AC_DIAGNOSE([obsolete], [Use of AM_GNU_GETTEXT without [external] =
argument is deprecated.])])
-   ifelse([$2], [], , [ifelse([$2], [need-ngettext], , [ifelse([$2], [ne=
ed-formatstring-macros], ,
-     [errprint([ERROR: invalid second argument to AM_GNU_GETTEXT
- ])])])])
-@@ -123,11 +125,11 @@ AC_DEFUN([AM_GNU_GETTEXT],
-     gt_use_preinstalled_gnugettext=3Dno
-     ifelse(gt_included_intl, yes, [
-       AC_MSG_CHECKING([whether included gettext is requested])
--      AC_ARG_WITH(included-gettext,
-+      AC_ARG_WITH([included-gettext],
-         [  --with-included-gettext use the GNU gettext library included=
 here],
-         nls_cv_force_use_gnu_gettext=3D$withval,
-         nls_cv_force_use_gnu_gettext=3Dno)
--      AC_MSG_RESULT($nls_cv_force_use_gnu_gettext)
-+      AC_MSG_RESULT([$nls_cv_force_use_gnu_gettext])
-=20
-       nls_cv_use_gnu_gettext=3D"$nls_cv_force_use_gnu_gettext"
-       if test "$nls_cv_force_use_gnu_gettext" !=3D "yes"; then
-@@ -267,7 +269,7 @@ return * gettext ("")$gt_expression_test
-=20
-     if test "$gt_use_preinstalled_gnugettext" =3D "yes" \
-        || test "$nls_cv_use_gnu_gettext" =3D "yes"; then
--      AC_DEFINE(ENABLE_NLS, 1,
-+      AC_DEFINE([ENABLE_NLS], [1],
-         [Define to 1 if translation of program messages to the user's n=
ative language
-    is requested.])
-     else
-@@ -301,9 +303,9 @@ return * gettext ("")$gt_expression_test
-       fi
-=20
-       dnl For backward compatibility. Some packages may be using this.
--      AC_DEFINE(HAVE_GETTEXT, 1,
-+      AC_DEFINE([HAVE_GETTEXT], [1],
-        [Define if the GNU gettext() function is already present or prei=
nstalled.])
--      AC_DEFINE(HAVE_DCGETTEXT, 1,
-+      AC_DEFINE([HAVE_DCGETTEXT], [1],
-        [Define if the GNU dcgettext() function is already present or pr=
einstalled.])
-     fi
-=20
-@@ -319,9 +321,9 @@ return * gettext ("")$gt_expression_test
-     fi
-=20
-     dnl Make all variables we use known to autoconf.
--    AC_SUBST(BUILD_INCLUDED_LIBINTL)
--    AC_SUBST(USE_INCLUDED_LIBINTL)
--    AC_SUBST(CATOBJEXT)
-+    AC_SUBST([BUILD_INCLUDED_LIBINTL])
-+    AC_SUBST([USE_INCLUDED_LIBINTL])
-+    AC_SUBST([CATOBJEXT])
-=20
-     dnl For backward compatibility. Some configure.ins may be using thi=
s.
-     nls_cv_header_intl=3D
-@@ -329,36 +331,36 @@ return * gettext ("")$gt_expression_test
-=20
-     dnl For backward compatibility. Some Makefiles may be using this.
-     DATADIRNAME=3Dshare
--    AC_SUBST(DATADIRNAME)
-+    AC_SUBST([DATADIRNAME])
-=20
-     dnl For backward compatibility. Some Makefiles may be using this.
-     INSTOBJEXT=3D.mo
--    AC_SUBST(INSTOBJEXT)
-+    AC_SUBST([INSTOBJEXT])
-=20
-     dnl For backward compatibility. Some Makefiles may be using this.
-     GENCAT=3Dgencat
--    AC_SUBST(GENCAT)
-+    AC_SUBST([GENCAT])
-=20
-     dnl For backward compatibility. Some Makefiles may be using this.
-     INTLOBJS=3D
-     if test "$USE_INCLUDED_LIBINTL" =3D yes; then
-       INTLOBJS=3D"\$(GETTOBJS)"
-     fi
--    AC_SUBST(INTLOBJS)
-+    AC_SUBST([INTLOBJS])
-=20
-     dnl Enable libtool support if the surrounding package wishes it.
-     INTL_LIBTOOL_SUFFIX_PREFIX=3Dgt_libtool_suffix_prefix
--    AC_SUBST(INTL_LIBTOOL_SUFFIX_PREFIX)
-+    AC_SUBST([INTL_LIBTOOL_SUFFIX_PREFIX])
-   ])
-=20
-   dnl For backward compatibility. Some Makefiles may be using this.
-   INTLLIBS=3D"$LIBINTL"
--  AC_SUBST(INTLLIBS)
-+  AC_SUBST([INTLLIBS])
-=20
-   dnl Make all documented variables known to autoconf.
--  AC_SUBST(LIBINTL)
--  AC_SUBST(LTLIBINTL)
--  AC_SUBST(POSUB)
-+  AC_SUBST([LIBINTL])
-+  AC_SUBST([LTLIBINTL])
-+  AC_SUBST([POSUB])
- ])
-=20
-=20
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/iconv.m4 gstreamer-0.10.28/common/m4/iconv.m4
---- gstreamer-0.10.28.org/common/m4/iconv.m4	2010-03-08 08:58:16.0000000=
00 -0800
-+++ gstreamer-0.10.28/common/m4/iconv.m4	2010-05-22 08:37:17.733798944 -=
0700
-@@ -1,5 +1,5 @@
--# iconv.m4 serial AM6 (gettext-0.17)
--dnl Copyright (C) 2000-2002, 2007 Free Software Foundation, Inc.
-+# iconv.m4 serial 9 (gettext-0.18)
-+dnl Copyright (C) 2000-2002, 2007-2010 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
-@@ -34,7 +34,7 @@ AC_DEFUN([AM_ICONV_LINK],
-   am_save_CPPFLAGS=3D"$CPPFLAGS"
-   AC_LIB_APPENDTOVAR([CPPFLAGS], [$INCICONV])
-=20
--  AC_CACHE_CHECK([for iconv], am_cv_func_iconv, [
-+  AC_CACHE_CHECK([for iconv], [am_cv_func_iconv], [
-     am_cv_func_iconv=3D"no, consider installing GNU libiconv"
-     am_cv_lib_iconv=3Dno
-     AC_TRY_LINK([#include <stdlib.h>
-@@ -42,7 +42,7 @@ AC_DEFUN([AM_ICONV_LINK],
-       [iconv_t cd =3D iconv_open("","");
-        iconv(cd,NULL,NULL,NULL,NULL);
-        iconv_close(cd);],
--      am_cv_func_iconv=3Dyes)
-+      [am_cv_func_iconv=3Dyes])
-     if test "$am_cv_func_iconv" !=3D yes; then
-       am_save_LIBS=3D"$LIBS"
-       LIBS=3D"$LIBS $LIBICONV"
-@@ -51,14 +51,14 @@ AC_DEFUN([AM_ICONV_LINK],
-         [iconv_t cd =3D iconv_open("","");
-          iconv(cd,NULL,NULL,NULL,NULL);
-          iconv_close(cd);],
--        am_cv_lib_iconv=3Dyes
--        am_cv_func_iconv=3Dyes)
-+        [am_cv_lib_iconv=3Dyes]
-+        [am_cv_func_iconv=3Dyes])
-       LIBS=3D"$am_save_LIBS"
-     fi
-   ])
-   if test "$am_cv_func_iconv" =3D yes; then
--    AC_CACHE_CHECK([for working iconv], am_cv_func_iconv_works, [
--      dnl This tests against bugs in AIX 5.1 and HP-UX 11.11.
-+    AC_CACHE_CHECK([for working iconv], [am_cv_func_iconv_works], [
-+      dnl This tests against bugs in AIX 5.1, HP-UX 11.11, Solaris 10.
-       am_save_LIBS=3D"$LIBS"
-       if test $am_cv_lib_iconv =3D yes; then
-         LIBS=3D"$LIBS $LIBICONV"
-@@ -87,6 +87,25 @@ int main ()
-           return 1;
-       }
-   }
-+  /* Test against Solaris 10 bug: Failures are not distinguishable from
-+     successful returns.  */
-+  {
-+    iconv_t cd_ascii_to_88591 =3D iconv_open ("ISO8859-1", "646");
-+    if (cd_ascii_to_88591 !=3D (iconv_t)(-1))
-+      {
-+        static const char input[] =3D "\263";
-+        char buf[10];
-+        const char *inptr =3D input;
-+        size_t inbytesleft =3D strlen (input);
-+        char *outptr =3D buf;
-+        size_t outbytesleft =3D sizeof (buf);
-+        size_t res =3D iconv (cd_ascii_to_88591,
-+                            (char **) &inptr, &inbytesleft,
-+                            &outptr, &outbytesleft);
-+        if (res =3D=3D 0)
-+          return 1;
-+      }
-+  }
- #if 0 /* This bug could be worked around by the caller.  */
-   /* Test against HP-UX 11.11 bug: Positive return value instead of 0. =
 */
-   {
-@@ -134,7 +153,7 @@ int main ()
-     am_func_iconv=3Dno am_cv_lib_iconv=3Dno
-   fi
-   if test "$am_func_iconv" =3D yes; then
--    AC_DEFINE(HAVE_ICONV, 1,
-+    AC_DEFINE([HAVE_ICONV], [1],
-       [Define if you have the iconv() function and it works.])
-   fi
-   if test "$am_cv_lib_iconv" =3D yes; then
-@@ -147,8 +166,8 @@ int main ()
-     LIBICONV=3D
-     LTLIBICONV=3D
-   fi
--  AC_SUBST(LIBICONV)
--  AC_SUBST(LTLIBICONV)
-+  AC_SUBST([LIBICONV])
-+  AC_SUBST([LTLIBICONV])
- ])
-=20
- AC_DEFUN([AM_ICONV],
-@@ -156,7 +175,7 @@ AC_DEFUN([AM_ICONV],
-   AM_ICONV_LINK
-   if test "$am_cv_func_iconv" =3D yes; then
-     AC_MSG_CHECKING([for iconv declaration])
--    AC_CACHE_VAL(am_cv_proto_iconv, [
-+    AC_CACHE_VAL([am_cv_proto_iconv], [
-       AC_TRY_COMPILE([
- #include <stdlib.h>
- #include <iconv.h>
-@@ -169,12 +188,12 @@ size_t iconv (iconv_t cd, char * *inbuf,
- #else
- size_t iconv();
- #endif
--], [], am_cv_proto_iconv_arg1=3D"", am_cv_proto_iconv_arg1=3D"const")
-+], [], [am_cv_proto_iconv_arg1=3D""], [am_cv_proto_iconv_arg1=3D"const"=
])
-       am_cv_proto_iconv=3D"extern size_t iconv (iconv_t cd, $am_cv_prot=
o_iconv_arg1 char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *=
outbytesleft);"])
-     am_cv_proto_iconv=3D`echo "[$]am_cv_proto_iconv" | tr -s ' ' | sed =
-e 's/( /(/'`
--    AC_MSG_RESULT([$]{ac_t:-
--         }[$]am_cv_proto_iconv)
--    AC_DEFINE_UNQUOTED(ICONV_CONST, $am_cv_proto_iconv_arg1,
-+    AC_MSG_RESULT([
-+         $am_cv_proto_iconv])
-+    AC_DEFINE_UNQUOTED([ICONV_CONST], [$am_cv_proto_iconv_arg1],
-       [Define as const if the declaration of iconv() needs const.])
-   fi
- ])
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/lib-ld.m4 gstreamer-0.10.28/common/m4/lib-ld.m4
---- gstreamer-0.10.28.org/common/m4/lib-ld.m4	2010-03-08 08:58:16.000000=
000 -0800
-+++ gstreamer-0.10.28/common/m4/lib-ld.m4	2010-05-22 08:37:17.753795900 =
-0700
-@@ -1,5 +1,5 @@
--# lib-ld.m4 serial 3 (gettext-0.13)
--dnl Copyright (C) 1996-2003 Free Software Foundation, Inc.
-+# lib-ld.m4 serial 4 (gettext-0.18)
-+dnl Copyright (C) 1996-2003, 2009-2010 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
-@@ -10,7 +10,7 @@ dnl with libtool.m4.
-=20
- dnl From libtool-1.4. Sets the variable with_gnu_ld to yes or no.
- AC_DEFUN([AC_LIB_PROG_LD_GNU],
--[AC_CACHE_CHECK([if the linker ($LD) is GNU ld], acl_cv_prog_gnu_ld,
-+[AC_CACHE_CHECK([if the linker ($LD) is GNU ld], [acl_cv_prog_gnu_ld],
- [# I'd rather use --version here, but apparently some GNU ld's only acc=
ept -v.
- case `$LD -v 2>&1 </dev/null` in
- *GNU* | *'with BFD'*)
-@@ -23,7 +23,7 @@ with_gnu_ld=3D$acl_cv_prog_gnu_ld
-=20
- dnl From libtool-1.4. Sets the variable LD.
- AC_DEFUN([AC_LIB_PROG_LD],
--[AC_ARG_WITH(gnu-ld,
-+[AC_ARG_WITH([gnu-ld],
- [  --with-gnu-ld           assume the C compiler uses GNU ld [default=3D=
no]],
- test "$withval" =3D no || with_gnu_ld=3Dyes, with_gnu_ld=3Dno)
- AC_REQUIRE([AC_PROG_CC])dnl
-@@ -59,7 +59,7 @@ if test "$GCC" =3D yes; then
-       # Canonicalize the path of ld
-       ac_prog=3D`echo $ac_prog| sed 's%\\\\%/%g'`
-       while echo $ac_prog | grep "$re_direlt" > /dev/null 2>&1; do
--	ac_prog=3D`echo $ac_prog| sed "s%$re_direlt%/%"`
-+        ac_prog=3D`echo $ac_prog| sed "s%$re_direlt%/%"`
-       done
-       test -z "$LD" && LD=3D"$ac_prog"
-       ;;
-@@ -77,7 +77,7 @@ elif test "$with_gnu_ld" =3D yes; then
- else
-   AC_MSG_CHECKING([for non-GNU ld])
- fi
--AC_CACHE_VAL(acl_cv_path_LD,
-+AC_CACHE_VAL([acl_cv_path_LD],
- [if test -z "$LD"; then
-   IFS=3D"${IFS=3D 	}"; ac_save_ifs=3D"$IFS"; IFS=3D"${IFS}${PATH_SEPARA=
TOR-:}"
-   for ac_dir in $PATH; do
-@@ -89,9 +89,9 @@ AC_CACHE_VAL(acl_cv_path_LD,
-       # Break only if it was the GNU/non-GNU ld that we prefer.
-       case `"$acl_cv_path_LD" -v 2>&1 < /dev/null` in
-       *GNU* | *'with BFD'*)
--	test "$with_gnu_ld" !=3D no && break ;;
-+        test "$with_gnu_ld" !=3D no && break ;;
-       *)
--	test "$with_gnu_ld" !=3D yes && break ;;
-+        test "$with_gnu_ld" !=3D yes && break ;;
-       esac
-     fi
-   done
-@@ -101,9 +101,9 @@ else
- fi])
- LD=3D"$acl_cv_path_LD"
- if test -n "$LD"; then
--  AC_MSG_RESULT($LD)
-+  AC_MSG_RESULT([$LD])
- else
--  AC_MSG_RESULT(no)
-+  AC_MSG_RESULT([no])
- fi
- test -z "$LD" && AC_MSG_ERROR([no acceptable ld found in \$PATH])
- AC_LIB_PROG_LD_GNU
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/lib-link.m4 gstreamer-0.10.28/common/m4/lib-link.m4
---- gstreamer-0.10.28.org/common/m4/lib-link.m4	2010-03-08 08:58:16.0000=
00000 -0800
-+++ gstreamer-0.10.28/common/m4/lib-link.m4	2010-05-22 08:37:17.76379291=
1 -0700
-@@ -1,12 +1,12 @@
--# lib-link.m4 serial 13 (gettext-0.17)
--dnl Copyright (C) 2001-2007 Free Software Foundation, Inc.
-+# lib-link.m4 serial 21 (gettext-0.18)
-+dnl Copyright (C) 2001-2010 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
-=20
- dnl From Bruno Haible.
-=20
--AC_PREREQ(2.54)
-+AC_PREREQ([2.54])
-=20
- dnl AC_LIB_LINKFLAGS(name [, dependencies]) searches for libname and
- dnl the libraries corresponding to explicit and implicit dependencies.
-@@ -18,9 +18,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS],
- [
-   AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
-   AC_REQUIRE([AC_LIB_RPATH])
--  define([Name],[translit([$1],[./-], [___])])
--  define([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
--                               [ABCDEFGHIJKLMNOPQRSTUVWXYZ___])])
-+  pushdef([Name],[translit([$1],[./-], [___])])
-+  pushdef([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
-+                                [ABCDEFGHIJKLMNOPQRSTUVWXYZ___])])
-   AC_CACHE_CHECK([how to link with lib[]$1], [ac_cv_lib[]Name[]_libs], =
[
-     AC_LIB_LINKFLAGS_BODY([$1], [$2])
-     ac_cv_lib[]Name[]_libs=3D"$LIB[]NAME"
-@@ -39,16 +39,17 @@ AC_DEFUN([AC_LIB_LINKFLAGS],
-   dnl Also set HAVE_LIB[]NAME so that AC_LIB_HAVE_LINKFLAGS can reuse t=
he
-   dnl results of this search when this library appears as a dependency.
-   HAVE_LIB[]NAME=3Dyes
--  undefine([Name])
--  undefine([NAME])
-+  popdef([NAME])
-+  popdef([Name])
- ])
-=20
--dnl AC_LIB_HAVE_LINKFLAGS(name, dependencies, includes, testcode)
-+dnl AC_LIB_HAVE_LINKFLAGS(name, dependencies, includes, testcode, [miss=
ing-message])
- dnl searches for libname and the libraries corresponding to explicit an=
d
- dnl implicit dependencies, together with the specified include files an=
d
--dnl the ability to compile and link the specified testcode. If found, i=
t
--dnl sets and AC_SUBSTs HAVE_LIB${NAME}=3Dyes and the LIB${NAME} and
--dnl LTLIB${NAME} variables and augments the CPPFLAGS variable, and
-+dnl the ability to compile and link the specified testcode. The missing=
-message
-+dnl defaults to 'no' and may contain additional hints for the user.
-+dnl If found, it sets and AC_SUBSTs HAVE_LIB${NAME}=3Dyes and the LIB${=
NAME}
-+dnl and LTLIB${NAME} variables and augments the CPPFLAGS variable, and
- dnl #defines HAVE_LIB${NAME} to 1. Otherwise, it sets and AC_SUBSTs
- dnl HAVE_LIB${NAME}=3Dno and LIB${NAME} and LTLIB${NAME} to empty.
- dnl Sets and AC_SUBSTs the LIB${NAME}_PREFIX variable to nonempty if li=
bname
-@@ -57,9 +58,9 @@ AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],
- [
-   AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
-   AC_REQUIRE([AC_LIB_RPATH])
--  define([Name],[translit([$1],[./-], [___])])
--  define([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
--                               [ABCDEFGHIJKLMNOPQRSTUVWXYZ___])])
-+  pushdef([Name],[translit([$1],[./-], [___])])
-+  pushdef([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
-+                                [ABCDEFGHIJKLMNOPQRSTUVWXYZ___])])
-=20
-   dnl Search for lib[]Name and define LIB[]NAME, LTLIB[]NAME and INC[]N=
AME
-   dnl accordingly.
-@@ -73,13 +74,25 @@ AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],
-=20
-   AC_CACHE_CHECK([for lib[]$1], [ac_cv_lib[]Name], [
-     ac_save_LIBS=3D"$LIBS"
--    LIBS=3D"$LIBS $LIB[]NAME"
--    AC_TRY_LINK([$3], [$4], [ac_cv_lib[]Name=3Dyes], [ac_cv_lib[]Name=3D=
no])
-+    dnl If $LIB[]NAME contains some -l options, add it to the end of LI=
BS,
-+    dnl because these -l options might require -L options that are pres=
ent in
-+    dnl LIBS. -l options benefit only from the -L options listed before=
 it.
-+    dnl Otherwise, add it to the front of LIBS, because it may be a sta=
tic
-+    dnl library that depends on another static library that is present =
in LIBS.
-+    dnl Static libraries benefit only from the static libraries listed =
after
-+    dnl it.
-+    case " $LIB[]NAME" in
-+      *" -l"*) LIBS=3D"$LIBS $LIB[]NAME" ;;
-+      *)       LIBS=3D"$LIB[]NAME $LIBS" ;;
-+    esac
-+    AC_TRY_LINK([$3], [$4],
-+      [ac_cv_lib[]Name=3Dyes],
-+      [ac_cv_lib[]Name=3D'm4_if([$5], [], [no], [[$5]])'])
-     LIBS=3D"$ac_save_LIBS"
-   ])
-   if test "$ac_cv_lib[]Name" =3D yes; then
-     HAVE_LIB[]NAME=3Dyes
--    AC_DEFINE([HAVE_LIB]NAME, 1, [Define if you have the $1 library.])
-+    AC_DEFINE([HAVE_LIB]NAME, 1, [Define if you have the lib][$1 librar=
y.])
-     AC_MSG_CHECKING([how to link with lib[]$1])
-     AC_MSG_RESULT([$LIB[]NAME])
-   else
-@@ -95,8 +108,8 @@ AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],
-   AC_SUBST([LIB]NAME)
-   AC_SUBST([LTLIB]NAME)
-   AC_SUBST([LIB]NAME[_PREFIX])
--  undefine([Name])
--  undefine([NAME])
-+  popdef([NAME])
-+  popdef([Name])
- ])
-=20
- dnl Determine the platform dependent parameters needed to use rpath:
-@@ -114,7 +127,7 @@ AC_DEFUN([AC_LIB_RPATH],
-   AC_REQUIRE([AC_LIB_PROG_LD])            dnl we use $LD, $with_gnu_ld
-   AC_REQUIRE([AC_CANONICAL_HOST])         dnl we use $host
-   AC_REQUIRE([AC_CONFIG_AUX_DIR_DEFAULT]) dnl we use $ac_aux_dir
--  AC_CACHE_CHECK([for shared library run path origin], acl_cv_rpath, [
-+  AC_CACHE_CHECK([for shared library run path origin], [acl_cv_rpath], =
[
-     CC=3D"$CC" GCC=3D"$GCC" LDFLAGS=3D"$LDFLAGS" LD=3D"$LD" with_gnu_ld=
=3D"$with_gnu_ld" \
-     ${CONFIG_SHELL-/bin/sh} "$ac_aux_dir/config.rpath" "$host" > confte=
st.sh
-     . ./conftest.sh
-@@ -131,11 +144,32 @@ AC_DEFUN([AC_LIB_RPATH],
-   acl_hardcode_direct=3D"$acl_cv_hardcode_direct"
-   acl_hardcode_minus_L=3D"$acl_cv_hardcode_minus_L"
-   dnl Determine whether the user wants rpath handling at all.
--  AC_ARG_ENABLE(rpath,
-+  AC_ARG_ENABLE([rpath],
-     [  --disable-rpath         do not hardcode runtime library paths],
-     :, enable_rpath=3Dyes)
- ])
-=20
-+dnl AC_LIB_FROMPACKAGE(name, package)
-+dnl declares that libname comes from the given package. The configure f=
ile
-+dnl will then not have a --with-libname-prefix option but a
-+dnl --with-package-prefix option. Several libraries can come from the s=
ame
-+dnl package. This declaration must occur before an AC_LIB_LINKFLAGS or =
similar
-+dnl macro call that searches for libname.
-+AC_DEFUN([AC_LIB_FROMPACKAGE],
-+[
-+  pushdef([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
-+                                [ABCDEFGHIJKLMNOPQRSTUVWXYZ___])])
-+  define([acl_frompackage_]NAME, [$2])
-+  popdef([NAME])
-+  pushdef([PACK],[$2])
-+  pushdef([PACKUP],[translit(PACK,[abcdefghijklmnopqrstuvwxyz./-],
-+                                  [ABCDEFGHIJKLMNOPQRSTUVWXYZ___])])
-+  define([acl_libsinpackage_]PACKUP,
-+    m4_ifdef([acl_libsinpackage_]PACKUP, [acl_libsinpackage_]PACKUP[[, =
]],)[lib$1])
-+  popdef([PACKUP])
-+  popdef([PACK])
-+])
-+
- dnl AC_LIB_LINKFLAGS_BODY(name [, dependencies]) searches for libname a=
nd
- dnl the libraries corresponding to explicit and implicit dependencies.
- dnl Sets the LIB${NAME}, LTLIB${NAME} and INC${NAME} variables.
-@@ -144,19 +178,23 @@ dnl in ${LIB${NAME}_PREFIX}/$acl_libdirs
- AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
- [
-   AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
--  define([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
--                               [ABCDEFGHIJKLMNOPQRSTUVWXYZ___])])
-+  pushdef([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
-+                                [ABCDEFGHIJKLMNOPQRSTUVWXYZ___])])
-+  pushdef([PACK],[m4_ifdef([acl_frompackage_]NAME, [acl_frompackage_]NA=
ME, lib[$1])])
-+  pushdef([PACKUP],[translit(PACK,[abcdefghijklmnopqrstuvwxyz./-],
-+                                  [ABCDEFGHIJKLMNOPQRSTUVWXYZ___])])
-+  pushdef([PACKLIBS],[m4_ifdef([acl_frompackage_]NAME, [acl_libsinpacka=
ge_]PACKUP, lib[$1])])
-   dnl Autoconf >=3D 2.61 supports dots in --with options.
--  define([N_A_M_E],[m4_if(m4_version_compare(m4_defn([m4_PACKAGE_VERSIO=
N]),[2.61]),[-1],[translit([$1],[.],[_])],[$1])])
-+  pushdef([P_A_C_K],[m4_if(m4_version_compare(m4_defn([m4_PACKAGE_VERSI=
ON]),[2.61]),[-1],[translit(PACK,[.],[_])],PACK)])
-   dnl By default, look in $includedir and $libdir.
-   use_additional=3Dyes
-   AC_LIB_WITH_FINAL_PREFIX([
-     eval additional_includedir=3D\"$includedir\"
-     eval additional_libdir=3D\"$libdir\"
-   ])
--  AC_LIB_ARG_WITH([lib]N_A_M_E[-prefix],
--[  --with-lib]N_A_M_E[-prefix[=3DDIR]  search for lib$1 in DIR/include =
and DIR/lib
--  --without-lib]N_A_M_E[-prefix     don't search for lib$1 in includedi=
r and libdir],
-+  AC_ARG_WITH(P_A_C_K[-prefix],
-+[[  --with-]]P_A_C_K[[-prefix[=3DDIR]  search for ]PACKLIBS[ in DIR/inc=
lude and DIR/lib
-+  --without-]]P_A_C_K[[-prefix     don't search for ]PACKLIBS[ in inclu=
dedir and libdir]],
- [
-     if test "X$withval" =3D "Xno"; then
-       use_additional=3Dno
-@@ -169,6 +207,10 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
-       else
-         additional_includedir=3D"$withval/include"
-         additional_libdir=3D"$withval/$acl_libdirstem"
-+        if test "$acl_libdirstem2" !=3D "$acl_libdirstem" \
-+           && ! test -d "$withval/$acl_libdirstem"; then
-+          additional_libdir=3D"$withval/$acl_libdirstem2"
-+        fi
-       fi
-     fi
- ])
-@@ -178,6 +220,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
-   LTLIB[]NAME=3D
-   INC[]NAME=3D
-   LIB[]NAME[]_PREFIX=3D
-+  dnl HAVE_LIB${NAME} is an indicator that LIB${NAME}, LTLIB${NAME} hav=
e been
-+  dnl computed. So it has to be reset here.
-+  HAVE_LIB[]NAME=3D
-   rpathdirs=3D
-   ltrpathdirs=3D
-   names_already_handled=3D
-@@ -267,6 +312,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
-               fi
-             fi
-           fi
-+          dnl Just let the compiler find the library, the compiler and =
user are smarter then this script
-+          dnl when cross compiling and working with a relocated install=
.
-+          found_dir=3D""
-           if test "X$found_dir" =3D "X"; then
-             for x in $LDFLAGS $LTLIB[]NAME; do
-               AC_LIB_WITH_FINAL_PREFIX([eval x=3D\"$x\"])
-@@ -327,7 +375,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
-               dnl Linking with a shared library. We attempt to hardcode=
 its
-               dnl directory into the executable's runpath, unless it's =
the
-               dnl standard /usr/lib.
--              if test "$enable_rpath" =3D no || test "X$found_dir" =3D =
"X/usr/$acl_libdirstem"; then
-+              if test "$enable_rpath" =3D no \
-+                 || test "X$found_dir" =3D "X/usr/$acl_libdirstem" \
-+                 || test "X$found_dir" =3D "X/usr/$acl_libdirstem2"; th=
en
-                 dnl No hardcoding is needed.
-                 LIB[]NAME=3D"${LIB[]NAME}${LIB[]NAME:+ }$found_so"
-               else
-@@ -415,7 +465,16 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
-             case "$found_dir" in
-               */$acl_libdirstem | */$acl_libdirstem/)
-                 basedir=3D`echo "X$found_dir" | sed -e 's,^X,,' -e "s,/=
$acl_libdirstem/"'*$,,'`
--                LIB[]NAME[]_PREFIX=3D"$basedir"
-+                if test "$name" =3D '$1'; then
-+                  LIB[]NAME[]_PREFIX=3D"$basedir"
-+                fi
-+                additional_includedir=3D"$basedir/include"
-+                ;;
-+              */$acl_libdirstem2 | */$acl_libdirstem2/)
-+                basedir=3D`echo "X$found_dir" | sed -e 's,^X,,' -e "s,/=
$acl_libdirstem2/"'*$,,'`
-+                if test "$name" =3D '$1'; then
-+                  LIB[]NAME[]_PREFIX=3D"$basedir"
-+                fi
-                 additional_includedir=3D"$basedir/include"
-                 ;;
-             esac
-@@ -476,9 +535,11 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
-                     dnl   3. if it's already present in $LDFLAGS or the=
 already
-                     dnl      constructed $LIBNAME,
-                     dnl   4. if it doesn't exist as a directory.
--                    if test "X$additional_libdir" !=3D "X/usr/$acl_libd=
irstem"; then
-+                    if test "X$additional_libdir" !=3D "X/usr/$acl_libd=
irstem" \
-+                       && test "X$additional_libdir" !=3D "X/usr/$acl_l=
ibdirstem2"; then
-                       haveit=3D
--                      if test "X$additional_libdir" =3D "X/usr/local/$a=
cl_libdirstem"; then
-+                      if test "X$additional_libdir" =3D "X/usr/local/$a=
cl_libdirstem" \
-+                         || test "X$additional_libdir" =3D "X/usr/local=
/$acl_libdirstem2"; then
-                         if test -n "$GCC"; then
-                           case $host_os in
-                             linux* | gnu* | k*bsd*-gnu) haveit=3Dyes;;
-@@ -609,6 +670,11 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
-       LTLIB[]NAME=3D"${LTLIB[]NAME}${LTLIB[]NAME:+ }-R$found_dir"
-     done
-   fi
-+  popdef([P_A_C_K])
-+  popdef([PACKLIBS])
-+  popdef([PACKUP])
-+  popdef([PACK])
-+  popdef([NAME])
- ])
-=20
- dnl AC_LIB_APPENDTOVAR(VAR, CONTENTS) appends the elements of CONTENTS =
to VAR,
-@@ -654,7 +720,8 @@ AC_DEFUN([AC_LIB_LINKFLAGS_FROM_LIBS],
-         if test -n "$next"; then
-           dir=3D"$next"
-           dnl No need to hardcode the standard /usr/lib.
--          if test "X$dir" !=3D "X/usr/$acl_libdirstem"; then
-+          if test "X$dir" !=3D "X/usr/$acl_libdirstem" \
-+             && test "X$dir" !=3D "X/usr/$acl_libdirstem2"; then
-             rpathdirs=3D"$rpathdirs $dir"
-           fi
-           next=3D
-@@ -663,7 +730,8 @@ AC_DEFUN([AC_LIB_LINKFLAGS_FROM_LIBS],
-             -L) next=3Dyes ;;
-             -L*) dir=3D`echo "X$opt" | sed -e 's,^X-L,,'`
-                  dnl No need to hardcode the standard /usr/lib.
--                 if test "X$dir" !=3D "X/usr/$acl_libdirstem"; then
-+                 if test "X$dir" !=3D "X/usr/$acl_libdirstem" \
-+                    && test "X$dir" !=3D "X/usr/$acl_libdirstem2"; then
-                    rpathdirs=3D"$rpathdirs $dir"
-                  fi
-                  next=3D ;;
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/lib-prefix.m4 gstreamer-0.10.28/common/m4/lib-prefix.m4
---- gstreamer-0.10.28.org/common/m4/lib-prefix.m4	2010-03-08 08:58:16.00=
0000000 -0800
-+++ gstreamer-0.10.28/common/m4/lib-prefix.m4	2010-05-22 08:37:17.773783=
356 -0700
-@@ -1,5 +1,5 @@
--# lib-prefix.m4 serial 5 (gettext-0.15)
--dnl Copyright (C) 2001-2005 Free Software Foundation, Inc.
-+# lib-prefix.m4 serial 7 (gettext-0.18)
-+dnl Copyright (C) 2001-2005, 2008-2010 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
-@@ -153,33 +153,72 @@ AC_DEFUN([AC_LIB_WITH_FINAL_PREFIX],
-   prefix=3D"$acl_save_prefix"
- ])
-=20
--dnl AC_LIB_PREPARE_MULTILIB creates a variable acl_libdirstem, containi=
ng
--dnl the basename of the libdir, either "lib" or "lib64".
-+dnl AC_LIB_PREPARE_MULTILIB creates
-+dnl - a variable acl_libdirstem, containing the basename of the libdir,=
 either
-+dnl   "lib" or "lib64" or "lib/64",
-+dnl - a variable acl_libdirstem2, as a secondary possible value for
-+dnl   acl_libdirstem, either the same as acl_libdirstem or "lib/sparcv9=
" or
-+dnl   "lib/amd64".
- AC_DEFUN([AC_LIB_PREPARE_MULTILIB],
- [
--  dnl There is no formal standard regarding lib and lib64. The current
--  dnl practice is that on a system supporting 32-bit and 64-bit instruc=
tion
--  dnl sets or ABIs, 64-bit libraries go under $prefix/lib64 and 32-bit
--  dnl libraries go under $prefix/lib. We determine the compiler's defau=
lt
--  dnl mode by looking at the compiler's library search path. If at leas=
t
--  dnl of its elements ends in /lib64 or points to a directory whose abs=
olute
--  dnl pathname ends in /lib64, we assume a 64-bit ABI. Otherwise we use=
 the
--  dnl default, namely "lib".
-+  dnl There is no formal standard regarding lib and lib64.
-+  dnl On glibc systems, the current practice is that on a system suppor=
ting
-+  dnl 32-bit and 64-bit instruction sets or ABIs, 64-bit libraries go u=
nder
-+  dnl $prefix/lib64 and 32-bit libraries go under $prefix/lib. We deter=
mine
-+  dnl the compiler's default mode by looking at the compiler's library =
search
-+  dnl path. If at least one of its elements ends in /lib64 or points to=
 a
-+  dnl directory whose absolute pathname ends in /lib64, we assume a 64-=
bit ABI.
-+  dnl Otherwise we use the default, namely "lib".
-+  dnl On Solaris systems, the current practice is that on a system supp=
orting
-+  dnl 32-bit and 64-bit instruction sets or ABIs, 64-bit libraries go u=
nder
-+  dnl $prefix/lib/64 (which is a symlink to either $prefix/lib/sparcv9 =
or
-+  dnl $prefix/lib/amd64) and 32-bit libraries go under $prefix/lib.
-+  AC_REQUIRE([AC_CANONICAL_HOST])
-   acl_libdirstem=3Dlib
--  searchpath=3D`(LC_ALL=3DC $CC -print-search-dirs) 2>/dev/null | sed -=
n -e 's,^libraries: ,,p' | sed -e 's,^=3D,,'`
--  if test -n "$searchpath"; then
--    acl_save_IFS=3D"${IFS=3D 	}"; IFS=3D":"
--    for searchdir in $searchpath; do
--      if test -d "$searchdir"; then
--        case "$searchdir" in
--          */lib64/ | */lib64 ) acl_libdirstem=3Dlib64 ;;
--          *) searchdir=3D`cd "$searchdir" && pwd`
--             case "$searchdir" in
--               */lib64 ) acl_libdirstem=3Dlib64 ;;
--             esac ;;
-+  acl_libdirstem2=3D
-+  case "$host_os" in
-+    solaris*)
-+      dnl See Solaris 10 Software Developer Collection > Solaris 64-bit=
 Developer's Guide > The Development Environment
-+      dnl <http://docs.sun.com/app/docs/doc/816-5138/dev-env?l=3Den&a=3D=
view>.
-+      dnl "Portable Makefiles should refer to any library directories u=
sing the 64 symbolic link."
-+      dnl But we want to recognize the sparcv9 or amd64 subdirectory al=
so if the
-+      dnl symlink is missing, so we set acl_libdirstem2 too.
-+      AC_CACHE_CHECK([for 64-bit host], [gl_cv_solaris_64bit],
-+        [AC_EGREP_CPP([sixtyfour bits], [
-+#ifdef _LP64
-+sixtyfour bits
-+#endif
-+           ], [gl_cv_solaris_64bit=3Dyes], [gl_cv_solaris_64bit=3Dno])
-+        ])
-+      if test $gl_cv_solaris_64bit =3D yes; then
-+        acl_libdirstem=3Dlib/64
-+        case "$host_cpu" in
-+          sparc*)        acl_libdirstem2=3Dlib/sparcv9 ;;
-+          i*86 | x86_64) acl_libdirstem2=3Dlib/amd64 ;;
-         esac
-       fi
--    done
--    IFS=3D"$acl_save_IFS"
--  fi
-+      ;;
-+    *)
-+      searchpath=3D`(LC_ALL=3DC $CC -print-search-dirs) 2>/dev/null | s=
ed -n -e 's,^libraries: ,,p' | sed -e 's,^=3D,,'`
-+      if test -n "$searchpath"; then
-+        acl_save_IFS=3D"${IFS=3D 	}"; IFS=3D":"
-+        for searchdir in $searchpath; do
-+          if test -d "$searchdir"; then
-+            case "$searchdir" in
-+              */lib64/ | */lib64 ) acl_libdirstem=3Dlib64 ;;
-+              */../ | */.. )
-+                # Better ignore directories of this form. They are misl=
eading.
-+                ;;
-+              *) searchdir=3D`cd "$searchdir" && pwd`
-+                 case "$searchdir" in
-+                   */lib64 ) acl_libdirstem=3Dlib64 ;;
-+                 esac ;;
-+            esac
-+          fi
-+        done
-+        IFS=3D"$acl_save_IFS"
-+      fi
-+      ;;
-+  esac
-+  test -n "$acl_libdirstem2" || acl_libdirstem2=3D"$acl_libdirstem"
- ])
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/nls.m4 gstreamer-0.10.28/common/m4/nls.m4
---- gstreamer-0.10.28.org/common/m4/nls.m4	2010-03-08 08:58:16.000000000=
 -0800
-+++ gstreamer-0.10.28/common/m4/nls.m4	2010-05-22 08:37:17.793786388 -07=
00
-@@ -1,5 +1,6 @@
--# nls.m4 serial 3 (gettext-0.15)
--dnl Copyright (C) 1995-2003, 2005-2006 Free Software Foundation, Inc.
-+# nls.m4 serial 5 (gettext-0.18)
-+dnl Copyright (C) 1995-2003, 2005-2006, 2008-2010 Free Software Foundat=
ion,
-+dnl Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
-@@ -17,15 +18,15 @@ dnl Authors:
- dnl   Ulrich Drepper <drepper@cygnus.com>, 1995-2000.
- dnl   Bruno Haible <haible@clisp.cons.org>, 2000-2003.
-=20
--AC_PREREQ(2.50)
-+AC_PREREQ([2.50])
-=20
- AC_DEFUN([AM_NLS],
- [
-   AC_MSG_CHECKING([whether NLS is requested])
-   dnl Default is enabled NLS
--  AC_ARG_ENABLE(nls,
-+  AC_ARG_ENABLE([nls],
-     [  --disable-nls           do not use Native Language Support],
-     USE_NLS=3D$enableval, USE_NLS=3Dyes)
--  AC_MSG_RESULT($USE_NLS)
--  AC_SUBST(USE_NLS)
-+  AC_MSG_RESULT([$USE_NLS])
-+  AC_SUBST([USE_NLS])
- ])
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/po.m4 gstreamer-0.10.28/common/m4/po.m4
---- gstreamer-0.10.28.org/common/m4/po.m4	2010-03-08 08:58:16.000000000 =
-0800
-+++ gstreamer-0.10.28/common/m4/po.m4	2010-05-22 08:37:17.803788218 -070=
0
-@@ -1,5 +1,5 @@
--# po.m4 serial 15 (gettext-0.17)
--dnl Copyright (C) 1995-2007 Free Software Foundation, Inc.
-+# po.m4 serial 17 (gettext-0.18)
-+dnl Copyright (C) 1995-2010 Free Software Foundation, Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
-@@ -17,7 +17,7 @@ dnl Authors:
- dnl   Ulrich Drepper <drepper@cygnus.com>, 1995-2000.
- dnl   Bruno Haible <haible@clisp.cons.org>, 2000-2003.
-=20
--AC_PREREQ(2.50)
-+AC_PREREQ([2.50])
-=20
- dnl Checks for all prerequisites of the po subdirectory.
- AC_DEFUN([AM_PO_SUBDIRS],
-@@ -29,7 +29,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
-=20
-   dnl Release version of the gettext macros. This is used to ensure tha=
t
-   dnl the gettext macros and po/Makefile.in.in are in sync.
--  AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
-+  AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
-=20
-   dnl Perform the following tests also if --disable-nls has been given,
-   dnl because they are needed for "make dist" to work.
-@@ -41,7 +41,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
-     [$ac_dir/$ac_word --statistics /dev/null >&]AS_MESSAGE_LOG_FD[ 2>&1=
 &&
-      (if $ac_dir/$ac_word --statistics /dev/null 2>&1 >/dev/null | grep=
 usage >/dev/null; then exit 1; else exit 0; fi)],
-     :)
--  AC_PATH_PROG(GMSGFMT, gmsgfmt, $MSGFMT)
-+  AC_PATH_PROG([GMSGFMT], [gmsgfmt], [$MSGFMT])
-=20
-   dnl Test whether it is GNU msgfmt >=3D 0.15.
- changequote(,)dnl
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/progtest.m4 gstreamer-0.10.28/common/m4/progtest.m4
---- gstreamer-0.10.28.org/common/m4/progtest.m4	2010-03-08 08:58:16.0000=
00000 -0800
-+++ gstreamer-0.10.28/common/m4/progtest.m4	2010-05-22 08:37:17.83380977=
1 -0700
-@@ -1,5 +1,5 @@
--# progtest.m4 serial 4 (gettext-0.14.2)
--dnl Copyright (C) 1996-2003, 2005 Free Software Foundation, Inc.
-+# progtest.m4 serial 6 (gettext-0.18)
-+dnl Copyright (C) 1996-2003, 2005, 2008-2010 Free Software Foundation, =
Inc.
- dnl This file is free software; the Free Software Foundation
- dnl gives unlimited permission to copy and/or distribute it,
- dnl with or without modifications, as long as this notice is preserved.
-@@ -16,7 +16,7 @@ dnl They are *not* in the public domain.
- dnl Authors:
- dnl   Ulrich Drepper <drepper@cygnus.com>, 1996.
-=20
--AC_PREREQ(2.50)
-+AC_PREREQ([2.50])
-=20
- # Search path for a program which passes the given test.
-=20
-@@ -55,7 +55,7 @@ rm -f conf$$.file
- # Extract the first word of "$2", so it can be a program name with args=
.
- set dummy $2; ac_word=3D[$]2
- AC_MSG_CHECKING([for $ac_word])
--AC_CACHE_VAL(ac_cv_path_$1,
-+AC_CACHE_VAL([ac_cv_path_$1],
- [case "[$]$1" in
-   [[\\/]]* | ?:[[\\/]]*)
-     ac_cv_path_$1=3D"[$]$1" # Let the user override the test with a pat=
h.
-@@ -84,9 +84,9 @@ ifelse([$4], , , [  test -z "[$]ac_cv_pa
- esac])dnl
- $1=3D"$ac_cv_path_$1"
- if test ifelse([$4], , [-n "[$]$1"], ["[$]$1" !=3D "$4"]); then
--  AC_MSG_RESULT([$]$1)
-+  AC_MSG_RESULT([$][$1])
- else
--  AC_MSG_RESULT(no)
-+  AC_MSG_RESULT([no])
- fi
--AC_SUBST($1)dnl
-+AC_SUBST([$1])dnl
- ])
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
onfigure.ac gstreamer-0.10.28/configure.ac
---- gstreamer-0.10.28.org/configure.ac	2010-03-08 14:52:43.000000000 -08=
00
-+++ gstreamer-0.10.28/configure.ac	2010-05-22 08:37:17.873785452 -0700
-@@ -63,7 +63,7 @@ AC_SUBST(ACLOCAL_AMFLAGS, "-I common/m4=20
-=20
- dnl set up gettext
- dnl the version check needs to stay here because autopoint greps for it
--AM_GNU_GETTEXT_VERSION([0.17])
-+AM_GNU_GETTEXT_VERSION([0.18])
- AM_GNU_GETTEXT([external])
- AG_GST_GETTEXT([gstreamer-$GST_MAJORMINOR])
-=20
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/g=
st-element-check-0.10.m4 gstreamer-0.10.28/gst-element-check-0.10.m4
---- gstreamer-0.10.28.org/gst-element-check-0.10.m4	1969-12-31 16:00:00.=
000000000 -0800
-+++ gstreamer-0.10.28/gst-element-check-0.10.m4	2010-05-22 08:38:27.3012=
86153 -0700
-@@ -0,0 +1,23 @@
-+dnl Perform a check for a GStreamer element using gst-inspect
-+dnl Thomas Vander Stichele <thomas at apestaart dot org>
-+dnl Last modification: 25/01/2005
-+
-+dnl AM_GST_ELEMENT_CHECK(ELEMENT-NAME, ACTION-IF-FOUND, ACTION-IF-NOT-F=
OUND)
-+
-+AC_DEFUN([AM_GST_ELEMENT_CHECK],
-+[
-+  if test "x$GST_INSPECT" =3D=3D "x"; then
-+    AC_CHECK_PROG(GST_INSPECT, gst-inspect-0.10, gst-inspect-0.10, [])
-+  fi
-+
-+  if test "x$GST_INSPECT" !=3D "x"; then
-+    AC_MSG_CHECKING(GStreamer 0.10 element $1)
-+    if [ $GST_INSPECT $1 > /dev/null 2> /dev/null ]; then
-+      AC_MSG_RESULT(found.)
-+      $2
-+    else
-+      AC_MSG_RESULT(not found.)
-+      $3
-+    fi
-+  fi
-+])
-Binary files gstreamer-0.10.28.org/libs/gst/check/.libs/libgstcheck-0.10=
.a and gstreamer-0.10.28/libs/gst/check/.libs/libgstcheck-0.10.a differ
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/p=
o/ChangeLog gstreamer-0.10.28/po/ChangeLog
---- gstreamer-0.10.28.org/po/ChangeLog	1969-12-31 16:00:00.000000000 -08=
00
-+++ gstreamer-0.10.28/po/ChangeLog	2010-05-22 08:37:16.941476173 -0700
-@@ -0,0 +1,5 @@
-+2010-05-22  gettextize  <bug-gnu-gettext@gnu.org>
-+
-+	* Makefile.in.in: Upgrade to gettext-0.18.
-+	* Rules-quot: Upgrade to gettext-0.18.
-+
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/p=
o/Makefile.in.in gstreamer-0.10.28/po/Makefile.in.in
---- gstreamer-0.10.28.org/po/Makefile.in.in	2010-03-08 13:31:23.00000000=
0 -0800
-+++ gstreamer-0.10.28/po/Makefile.in.in	2010-05-22 08:37:16.801299560 -0=
700
-@@ -1,5 +1,5 @@
- # Makefile for PO directory in any package using GNU gettext.
--# Copyright (C) 1995-1997, 2000-2007 by Ulrich Drepper <drepper@gnu.ai.=
mit.edu>
-+# Copyright (C) 1995-1997, 2000-2007, 2009-2010 by Ulrich Drepper <drep=
per@gnu.ai.mit.edu>
- #
- # This file can be copied and used freely without restrictions.  It can
- # be used in projects which are not available under the GNU General Pub=
lic
-@@ -8,16 +8,13 @@
- # Please note that the actual code of GNU gettext is covered by the GNU
- # General Public License and is *not* in the public domain.
- #
--# Origin: gettext-0.17
--GETTEXT_MACRO_VERSION =3D 0.17
-+# Origin: gettext-0.18
-+GETTEXT_MACRO_VERSION =3D 0.18
-=20
- PACKAGE =3D @PACKAGE@
- VERSION =3D @VERSION@
- PACKAGE_BUGREPORT =3D @PACKAGE_BUGREPORT@
-=20
--# thomas: add GETTEXT_PACKAGE substitution as used in Makevars
--GETTEXT_PACKAGE =3D @GETTEXT_PACKAGE@
--
- SHELL =3D /bin/sh
- @SET_MAKE@
-=20
-@@ -91,8 +88,8 @@ CATALOGS =3D @CATALOGS@
- .po.gmo:
- 	@lang=3D`echo $* | sed -e 's,.*/,,'`; \
- 	test "$(srcdir)" =3D . && cdcmd=3D"" || cdcmd=3D"cd $(srcdir) && "; \
--	echo "$${cdcmd}rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics -o $${=
lang}.gmo $${lang}.po"; \
--	cd $(srcdir) && rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics -o t-=
$${lang}.gmo $${lang}.po && mv t-$${lang}.gmo $${lang}.gmo
-+	echo "$${cdcmd}rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics --verb=
ose -o $${lang}.gmo $${lang}.po"; \
-+	cd $(srcdir) && rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics --ver=
bose -o t-$${lang}.gmo $${lang}.po && mv t-$${lang}.gmo $${lang}.gmo
-=20
- .sin.sed:
- 	sed -e '/^#/d' $< > t-$@
-@@ -196,8 +193,15 @@ $(POFILES): $(srcdir)/$(DOMAIN).pot
- 	@lang=3D`echo $@ | sed -e 's,.*/,,' -e 's/\.po$$//'`; \
- 	if test -f "$(srcdir)/$${lang}.po"; then \
- 	  test "$(srcdir)" =3D . && cdcmd=3D"" || cdcmd=3D"cd $(srcdir) && "; =
\
--	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $${lang}.po $(DOMAIN).pot"; \
--	  cd $(srcdir) && $(MSGMERGE_UPDATE) $${lang}.po $(DOMAIN).pot; \
-+	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=3D$${la=
ng} $${lang}.po $(DOMAIN).pot"; \
-+	  cd $(srcdir) \
-+	    && { case `$(MSGMERGE_UPDATE) --version | sed 1q | sed -e 's,^[^0-=
9]*,,'` in \
-+	           '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
-+	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) $${lang}.po $(DOMA=
IN).pot;; \
-+	           *) \
-+	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=3D$${lang} =
$${lang}.po $(DOMAIN).pot;; \
-+	         esac; \
-+	       }; \
- 	else \
- 	  $(MAKE) $${lang}.po-create; \
- 	fi
-@@ -220,7 +224,6 @@ install-data: install-data-@USE_NLS@
- 	fi
- install-data-no: all
- install-data-yes: all
--	$(mkdir_p) $(DESTDIR)$(datadir)
- 	@catalogs=3D'$(CATALOGS)'; \
- 	for cat in $$catalogs; do \
- 	  cat=3D`basename $$cat`; \
-@@ -272,7 +275,6 @@ installdirs-data: installdirs-data-@USE_
- 	fi
- installdirs-data-no:
- installdirs-data-yes:
--	$(mkdir_p) $(DESTDIR)$(datadir)
- 	@catalogs=3D'$(CATALOGS)'; \
- 	for cat in $$catalogs; do \
- 	  cat=3D`basename $$cat`; \
-@@ -398,9 +400,15 @@ update-po: Makefile
- 	tmpdir=3D`pwd`; \
- 	echo "$$lang:"; \
- 	test "$(srcdir)" =3D . && cdcmd=3D"" || cdcmd=3D"cd $(srcdir) && "; \
--	echo "$${cdcmd}$(MSGMERGE) $$lang.po $(DOMAIN).pot -o $$lang.new.po"; =
\
-+	echo "$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=3D$$lang $$lang.=
po $(DOMAIN).pot -o $$lang.new.po"; \
- 	cd $(srcdir); \
--	if $(MSGMERGE) $$lang.po $(DOMAIN).pot -o $$tmpdir/$$lang.new.po; then=
 \
-+	if { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in =
\
-+	       '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
-+	         $(MSGMERGE) $(MSGMERGE_OPTIONS) -o $$tmpdir/$$lang.new.po $$l=
ang.po $(DOMAIN).pot;; \
-+	       *) \
-+	         $(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=3D$$lang -o $$tmpdir/$=
$lang.new.po $$lang.po $(DOMAIN).pot;; \
-+	     esac; \
-+	   }; then \
- 	  if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
- 	    rm -f $$tmpdir/$$lang.new.po; \
- 	  else \
-@@ -421,9 +429,13 @@ $(DUMMYPOFILES):
- update-gmo: Makefile $(GMOFILES)
- 	@:
-=20
-+# Recreate Makefile by invoking config.status. Explicitly invoke the sh=
ell,
-+# because execution permission bits may not work on the current file sy=
stem.
-+# Use @SHELL@, which is the shell determined by autoconf for the use by=
 its
-+# scripts, not $(SHELL) which is hardwired to /bin/sh and may be defici=
ent.
- Makefile: Makefile.in.in Makevars $(top_builddir)/config.status @POMAKE=
FILEDEPS@
- 	cd $(top_builddir) \
--	  && $(SHELL) ./config.status $(subdir)/$@.in po-directories
-+	  && @SHELL@ ./config.status $(subdir)/$@.in po-directories
-=20
- force:
-=20
-diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/p=
o/Rules-quot gstreamer-0.10.28/po/Rules-quot
---- gstreamer-0.10.28.org/po/Rules-quot	2010-03-08 08:58:17.000000000 -0=
800
-+++ gstreamer-0.10.28/po/Rules-quot	2010-05-22 08:37:16.941476173 -0700
-@@ -20,7 +20,7 @@ en@boldquot.po-update: en@boldquot.po-up
- 	ll=3D`echo $$lang | sed -e 's/@.*//'`; \
- 	LC_ALL=3DC; export LC_ALL; \
- 	cd $(srcdir); \
--	if $(MSGINIT) -i $(DOMAIN).pot --no-translator -l $$ll -o - 2>/dev/nul=
l | sed -f $$tmpdir/$$lang.insert-header | $(MSGCONV) -t UTF-8 | $(MSGFIL=
TER) sed -f `echo $$lang | sed -e 's/.*@//'`.sed 2>/dev/null > $$tmpdir/$=
$lang.new.po; then \
-+	if $(MSGINIT) -i $(DOMAIN).pot --no-translator -l $$lang -o - 2>/dev/n=
ull | sed -f $$tmpdir/$$lang.insert-header | $(MSGCONV) -t UTF-8 | $(MSGF=
ILTER) sed -f `echo $$lang | sed -e 's/.*@//'`.sed 2>/dev/null > $$tmpdir=
/$$lang.new.po; then \
- 	  if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
- 	    rm -f $$tmpdir/$$lang.new.po; \
- 	  else \
---- gstreamer-0.10.28.org/ChangeLog	2010-03-08 14:54:29.000000000 -0800
-+++ gstreamer-0.10.28/ChangeLog	2010-05-22 09:06:29.863813510 -0700
-@@ -1,3 +1,15 @@
-+2010-05-22  Khem Raj  <raj.khem@gmail.com>
-+
-+	* common/m4/gettext.m4: Upgrade to gettext-0.18.
-+	* common/m4/iconv.m4: Upgrade to gettext-0.18.
-+	* common/m4/lib-ld.m4: Upgrade to gettext-0.18.
-+	* common/m4/lib-link.m4: Upgrade to gettext-0.18.
-+	* common/m4/lib-prefix.m4: Upgrade to gettext-0.18.
-+	* common/m4/nls.m4: Upgrade to gettext-0.18.
-+	* common/m4/po.m4: Upgrade to gettext-0.18.
-+	* common/m4/progtest.m4: Upgrade to gettext-0.18.
-+	* configure.ac (AM_GNU_GETTEXT_VERSION): Bump to 0.18.
-+
- =3D=3D=3D release 0.10.28 =3D=3D=3D
-=20
- 2010-03-08  Tim-Philipp M=C3=BCller <tim.muller@collabora.co.uk>
diff --git a/recipes/gstreamer/gstreamer_0.10.22.bb b/recipes/gstreamer/g=
streamer_0.10.22.bb
deleted file mode 100644
index 4cfd56c..0000000
--- a/recipes/gstreamer/gstreamer_0.10.22.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require gstreamer.inc
-
-do_configure_prepend() {
-	sed -i -e s:docs::g Makefile.am
-}
-
-
-SRC_URI[archive.md5sum] =3D "35dd8598837af4074753afe5b59e8ef2"
-SRC_URI[archive.sha256sum] =3D "61489e0192b1362e6dc760154204c73c1edd9ad9=
d8c754535483ec00ad7e389e"
diff --git a/recipes/gstreamer/gstreamer_0.10.23.bb b/recipes/gstreamer/g=
streamer_0.10.23.bb
deleted file mode 100644
index 7797f87..0000000
--- a/recipes/gstreamer/gstreamer_0.10.23.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require gstreamer.inc
-
-EXTRA_OECONF +=3D "ac_cv_func_register_printf_function=3Dno"
-
-do_configure_prepend() {
-	sed -i -e s:docs::g Makefile.am
-}
-
-
-SRC_URI[archive.md5sum] =3D "f7b2e300d2d85756407ec529424ab237"
-SRC_URI[archive.sha256sum] =3D "cf750821040102d2c9fbfed56472a86fd0d8c24a=
da37901c41867c88438a776d"
diff --git a/recipes/gstreamer/gstreamer_0.10.28.bb b/recipes/gstreamer/g=
streamer_0.10.28.bb
deleted file mode 100644
index ababa47..0000000
--- a/recipes/gstreamer/gstreamer_0.10.28.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require gstreamer.inc
-
-PR =3D "r1"
-
-SRC_URI +=3D "file://use-gettext-0.18.patch \
-           "
-
-SRC_URI[archive.md5sum] =3D "1c7accac718fe211ff91323c27d4ae02"
-SRC_URI[archive.sha256sum] =3D "61613ec7574d22230e8cc893f91b66faec6b2128=
8a22d2f21c9d9eeb7667eb2c"
-
-EXTRA_OECONF +=3D "ac_cv_func_register_printf_function=3Dno"
-
-do_configure_prepend() {
-	sed -i -e s:docs::g Makefile.am
-}
-
diff --git a/recipes/gstreamer/gstreamer_0.10.29.bb b/recipes/gstreamer/g=
streamer_0.10.29.bb
deleted file mode 100644
index 6fea774..0000000
--- a/recipes/gstreamer/gstreamer_0.10.29.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require gstreamer.inc
-
-SRC_URI[archive.md5sum] =3D "c92d6bce4fc65fa9d5a3ad35cdd1a466"
-SRC_URI[archive.sha256sum] =3D "e44a737c016ccab56d646718ecf24b9393babde2=
c417ac7dd5bd218e5c609ef9"
-
-EXTRA_OECONF +=3D "ac_cv_func_register_printf_function=3Dno"
-
-do_configure_prepend() {
-	sed -i -e s:docs::g Makefile.am
-}
-
diff --git a/recipes/gstreamer/gstreamer_0.10.30.bb b/recipes/gstreamer/g=
streamer_0.10.30.bb
deleted file mode 100644
index 730c929..0000000
--- a/recipes/gstreamer/gstreamer_0.10.30.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require gstreamer.inc
-
-PR =3D "r1"
-
-SRC_URI[archive.md5sum] =3D "de01f73f71d97c5854badd363ca06509"
-SRC_URI[archive.sha256sum] =3D "e8ef301be423797ff36a0bb3615930b112b41756=
34051d19fd655e0ed974532a"
-
-EXTRA_OECONF +=3D "ac_cv_func_register_printf_function=3Dno"
-
-do_configure_prepend() {
-	sed -i -e s:docs::g Makefile.am
-}
-
--=20
1.7.2.3



