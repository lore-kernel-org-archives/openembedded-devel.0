Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRbF-0002dV-IK
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:48:21 +0200
Received: by fxm9 with SMTP id 9so592999fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GxYquf6OHDbd31ous9fqMMsdKQLJHeWs7xbeYBUPD/s=;
	b=ifUk+MTuBigEvDp/IGm7cYFa+rq5FHEKqyTr2ZNld4xkgXrIIKRPcmCUe9KRivFTk6
	owJ7cVRQpGAc+tJji9cjNXqsOurCKv4INWKNq/Xeew+Y3nErm++PR0hHD8mRe6LVb0MF
	dkh93iy2pn0G7BpuXAJEbLhgc1itmZRwQYfb0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=czH+972/vs/nwAfMB7trFEBO5ZfyW+nr0xOsY6+YkRtZ6c3a5RJcGqsygqf35JYxgB
	b+XxlQ7QnojusV0tsnjbrWQ0U/EiJ9iCc4MuUOxSZ2wYzjZ39dgWUqRFAzgett+H22gu
	YIpal8Tv7loVyZy3CtKo4nuuEQinn7HFYZEhA=
MIME-Version: 1.0
Received: by 10.223.16.84 with SMTP id n20mr11310190faa.94.1275637294929; Fri, 
	04 Jun 2010 00:41:34 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:41:34 -0700 (PDT)
In-Reply-To: <1275510896-30845-13-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-13-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:41:34 +0200
Message-ID: <AANLkTilQ_zmAe--04csNkaA5MePpcdvsWvprpI8JYS2S@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_QUOTING autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 12/16] gstreamer_0.10.28.bb: Fix to build with gettext 0.18
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
X-List-Received-Date: Fri, 04 Jun 2010 07:48:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0recipes/gstreamer/gstreamer/use-gettext-0.18.patch | 1012 ++++++++++++=
++++++++
> =A0recipes/gstreamer/gstreamer_0.10.28.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A05 +
> =A02 files changed, 1017 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/gstreamer/gstreamer/use-gettext-0.18.patch
>
> diff --git a/recipes/gstreamer/gstreamer/use-gettext-0.18.patch b/recipes=
/gstreamer/gstreamer/use-gettext-0.18.patch
> new file mode 100644
> index 0000000..504caa8
> --- /dev/null
> +++ b/recipes/gstreamer/gstreamer/use-gettext-0.18.patch
> @@ -0,0 +1,1012 @@
> +This patch it needed to get gstreamer upgraded to use gettext 0.18
> +
> +-Khem
> +
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/gettext.m4 gstreamer-0.10.28/common/m4/gettext.m4
> +--- gstreamer-0.10.28.org/common/m4/gettext.m4 2010-03-08 08:58:16.00000=
0000 -0800
> ++++ gstreamer-0.10.28/common/m4/gettext.m4 =A0 =A0 2010-05-22 08:37:17.7=
13880839 -0700
> +@@ -1,5 +1,5 @@
> +-# gettext.m4 serial 60 (gettext-0.17)
> +-dnl Copyright (C) 1995-2007 Free Software Foundation, Inc.
> ++# gettext.m4 serial 63 (gettext-0.18)
> ++dnl Copyright (C) 1995-2010 Free Software Foundation, Inc.
> + dnl This file is free software; the Free Software Foundation
> + dnl gives unlimited permission to copy and/or distribute it,
> + dnl with or without modifications, as long as this notice is preserved.
> +@@ -15,7 +15,7 @@ dnl They are *not* in the public domain.
> +
> + dnl Authors:
> + dnl =A0 Ulrich Drepper <drepper@cygnus.com>, 1995-2000.
> +-dnl =A0 Bruno Haible <haible@clisp.cons.org>, 2000-2006.
> ++dnl =A0 Bruno Haible <haible@clisp.cons.org>, 2000-2006, 2008-2010.
> +
> + dnl Macro to add for using GNU gettext.
> +
> +@@ -60,6 +60,8 @@ AC_DEFUN([AM_GNU_GETTEXT],
> + =A0 ifelse([$1], [], , [ifelse([$1], [external], , [ifelse([$1], [no-li=
btool], , [ifelse([$1], [use-libtool], ,
> + =A0 =A0 [errprint([ERROR: invalid first argument to AM_GNU_GETTEXT
> + ])])])])])
> ++ =A0ifelse(ifelse([$1], [], [old])[]ifelse([$1], [no-libtool], [old]), =
[old],
> ++ =A0 =A0[AC_DIAGNOSE([obsolete], [Use of AM_GNU_GETTEXT without [extern=
al] argument is deprecated.])])
> + =A0 ifelse([$2], [], , [ifelse([$2], [need-ngettext], , [ifelse([$2], [=
need-formatstring-macros], ,
> + =A0 =A0 [errprint([ERROR: invalid second argument to AM_GNU_GETTEXT
> + ])])])])
> +@@ -123,11 +125,11 @@ AC_DEFUN([AM_GNU_GETTEXT],
> + =A0 =A0 gt_use_preinstalled_gnugettext=3Dno
> + =A0 =A0 ifelse(gt_included_intl, yes, [
> + =A0 =A0 =A0 AC_MSG_CHECKING([whether included gettext is requested])
> +- =A0 =A0 =A0AC_ARG_WITH(included-gettext,
> ++ =A0 =A0 =A0AC_ARG_WITH([included-gettext],
> + =A0 =A0 =A0 =A0 [ =A0--with-included-gettext use the GNU gettext librar=
y included here],
> + =A0 =A0 =A0 =A0 nls_cv_force_use_gnu_gettext=3D$withval,
> + =A0 =A0 =A0 =A0 nls_cv_force_use_gnu_gettext=3Dno)
> +- =A0 =A0 =A0AC_MSG_RESULT($nls_cv_force_use_gnu_gettext)
> ++ =A0 =A0 =A0AC_MSG_RESULT([$nls_cv_force_use_gnu_gettext])
> +
> + =A0 =A0 =A0 nls_cv_use_gnu_gettext=3D"$nls_cv_force_use_gnu_gettext"
> + =A0 =A0 =A0 if test "$nls_cv_force_use_gnu_gettext" !=3D "yes"; then
> +@@ -267,7 +269,7 @@ return * gettext ("")$gt_expression_test
> +
> + =A0 =A0 if test "$gt_use_preinstalled_gnugettext" =3D "yes" \
> + =A0 =A0 =A0 =A0|| test "$nls_cv_use_gnu_gettext" =3D "yes"; then
> +- =A0 =A0 =A0AC_DEFINE(ENABLE_NLS, 1,
> ++ =A0 =A0 =A0AC_DEFINE([ENABLE_NLS], [1],
> + =A0 =A0 =A0 =A0 [Define to 1 if translation of program messages to the =
user's native language
> + =A0 =A0is requested.])
> + =A0 =A0 else
> +@@ -301,9 +303,9 @@ return * gettext ("")$gt_expression_test
> + =A0 =A0 =A0 fi
> +
> + =A0 =A0 =A0 dnl For backward compatibility. Some packages may be using =
this.
> +- =A0 =A0 =A0AC_DEFINE(HAVE_GETTEXT, 1,
> ++ =A0 =A0 =A0AC_DEFINE([HAVE_GETTEXT], [1],
> + =A0 =A0 =A0 =A0[Define if the GNU gettext() function is already present=
 or preinstalled.])
> +- =A0 =A0 =A0AC_DEFINE(HAVE_DCGETTEXT, 1,
> ++ =A0 =A0 =A0AC_DEFINE([HAVE_DCGETTEXT], [1],
> + =A0 =A0 =A0 =A0[Define if the GNU dcgettext() function is already prese=
nt or preinstalled.])
> + =A0 =A0 fi
> +
> +@@ -319,9 +321,9 @@ return * gettext ("")$gt_expression_test
> + =A0 =A0 fi
> +
> + =A0 =A0 dnl Make all variables we use known to autoconf.
> +- =A0 =A0AC_SUBST(BUILD_INCLUDED_LIBINTL)
> +- =A0 =A0AC_SUBST(USE_INCLUDED_LIBINTL)
> +- =A0 =A0AC_SUBST(CATOBJEXT)
> ++ =A0 =A0AC_SUBST([BUILD_INCLUDED_LIBINTL])
> ++ =A0 =A0AC_SUBST([USE_INCLUDED_LIBINTL])
> ++ =A0 =A0AC_SUBST([CATOBJEXT])
> +
> + =A0 =A0 dnl For backward compatibility. Some configure.ins may be using=
 this.
> + =A0 =A0 nls_cv_header_intl=3D
> +@@ -329,36 +331,36 @@ return * gettext ("")$gt_expression_test
> +
> + =A0 =A0 dnl For backward compatibility. Some Makefiles may be using thi=
s.
> + =A0 =A0 DATADIRNAME=3Dshare
> +- =A0 =A0AC_SUBST(DATADIRNAME)
> ++ =A0 =A0AC_SUBST([DATADIRNAME])
> +
> + =A0 =A0 dnl For backward compatibility. Some Makefiles may be using thi=
s.
> + =A0 =A0 INSTOBJEXT=3D.mo
> +- =A0 =A0AC_SUBST(INSTOBJEXT)
> ++ =A0 =A0AC_SUBST([INSTOBJEXT])
> +
> + =A0 =A0 dnl For backward compatibility. Some Makefiles may be using thi=
s.
> + =A0 =A0 GENCAT=3Dgencat
> +- =A0 =A0AC_SUBST(GENCAT)
> ++ =A0 =A0AC_SUBST([GENCAT])
> +
> + =A0 =A0 dnl For backward compatibility. Some Makefiles may be using thi=
s.
> + =A0 =A0 INTLOBJS=3D
> + =A0 =A0 if test "$USE_INCLUDED_LIBINTL" =3D yes; then
> + =A0 =A0 =A0 INTLOBJS=3D"\$(GETTOBJS)"
> + =A0 =A0 fi
> +- =A0 =A0AC_SUBST(INTLOBJS)
> ++ =A0 =A0AC_SUBST([INTLOBJS])
> +
> + =A0 =A0 dnl Enable libtool support if the surrounding package wishes it=
.
> + =A0 =A0 INTL_LIBTOOL_SUFFIX_PREFIX=3Dgt_libtool_suffix_prefix
> +- =A0 =A0AC_SUBST(INTL_LIBTOOL_SUFFIX_PREFIX)
> ++ =A0 =A0AC_SUBST([INTL_LIBTOOL_SUFFIX_PREFIX])
> + =A0 ])
> +
> + =A0 dnl For backward compatibility. Some Makefiles may be using this.
> + =A0 INTLLIBS=3D"$LIBINTL"
> +- =A0AC_SUBST(INTLLIBS)
> ++ =A0AC_SUBST([INTLLIBS])
> +
> + =A0 dnl Make all documented variables known to autoconf.
> +- =A0AC_SUBST(LIBINTL)
> +- =A0AC_SUBST(LTLIBINTL)
> +- =A0AC_SUBST(POSUB)
> ++ =A0AC_SUBST([LIBINTL])
> ++ =A0AC_SUBST([LTLIBINTL])
> ++ =A0AC_SUBST([POSUB])
> + ])
> +
> +
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/iconv.m4 gstreamer-0.10.28/common/m4/iconv.m4
> +--- gstreamer-0.10.28.org/common/m4/iconv.m4 =A0 2010-03-08 08:58:16.000=
000000 -0800
> ++++ gstreamer-0.10.28/common/m4/iconv.m4 =A0 =A0 =A0 2010-05-22 08:37:17=
.733798944 -0700
> +@@ -1,5 +1,5 @@
> +-# iconv.m4 serial AM6 (gettext-0.17)
> +-dnl Copyright (C) 2000-2002, 2007 Free Software Foundation, Inc.
> ++# iconv.m4 serial 9 (gettext-0.18)
> ++dnl Copyright (C) 2000-2002, 2007-2010 Free Software Foundation, Inc.
> + dnl This file is free software; the Free Software Foundation
> + dnl gives unlimited permission to copy and/or distribute it,
> + dnl with or without modifications, as long as this notice is preserved.
> +@@ -34,7 +34,7 @@ AC_DEFUN([AM_ICONV_LINK],
> + =A0 am_save_CPPFLAGS=3D"$CPPFLAGS"
> + =A0 AC_LIB_APPENDTOVAR([CPPFLAGS], [$INCICONV])
> +
> +- =A0AC_CACHE_CHECK([for iconv], am_cv_func_iconv, [
> ++ =A0AC_CACHE_CHECK([for iconv], [am_cv_func_iconv], [
> + =A0 =A0 am_cv_func_iconv=3D"no, consider installing GNU libiconv"
> + =A0 =A0 am_cv_lib_iconv=3Dno
> + =A0 =A0 AC_TRY_LINK([#include <stdlib.h>
> +@@ -42,7 +42,7 @@ AC_DEFUN([AM_ICONV_LINK],
> + =A0 =A0 =A0 [iconv_t cd =3D iconv_open("","");
> + =A0 =A0 =A0 =A0iconv(cd,NULL,NULL,NULL,NULL);
> + =A0 =A0 =A0 =A0iconv_close(cd);],
> +- =A0 =A0 =A0am_cv_func_iconv=3Dyes)
> ++ =A0 =A0 =A0[am_cv_func_iconv=3Dyes])
> + =A0 =A0 if test "$am_cv_func_iconv" !=3D yes; then
> + =A0 =A0 =A0 am_save_LIBS=3D"$LIBS"
> + =A0 =A0 =A0 LIBS=3D"$LIBS $LIBICONV"
> +@@ -51,14 +51,14 @@ AC_DEFUN([AM_ICONV_LINK],
> + =A0 =A0 =A0 =A0 [iconv_t cd =3D iconv_open("","");
> + =A0 =A0 =A0 =A0 =A0iconv(cd,NULL,NULL,NULL,NULL);
> + =A0 =A0 =A0 =A0 =A0iconv_close(cd);],
> +- =A0 =A0 =A0 =A0am_cv_lib_iconv=3Dyes
> +- =A0 =A0 =A0 =A0am_cv_func_iconv=3Dyes)
> ++ =A0 =A0 =A0 =A0[am_cv_lib_iconv=3Dyes]
> ++ =A0 =A0 =A0 =A0[am_cv_func_iconv=3Dyes])
> + =A0 =A0 =A0 LIBS=3D"$am_save_LIBS"
> + =A0 =A0 fi
> + =A0 ])
> + =A0 if test "$am_cv_func_iconv" =3D yes; then
> +- =A0 =A0AC_CACHE_CHECK([for working iconv], am_cv_func_iconv_works, [
> +- =A0 =A0 =A0dnl This tests against bugs in AIX 5.1 and HP-UX 11.11.
> ++ =A0 =A0AC_CACHE_CHECK([for working iconv], [am_cv_func_iconv_works], [
> ++ =A0 =A0 =A0dnl This tests against bugs in AIX 5.1, HP-UX 11.11, Solari=
s 10.
> + =A0 =A0 =A0 am_save_LIBS=3D"$LIBS"
> + =A0 =A0 =A0 if test $am_cv_lib_iconv =3D yes; then
> + =A0 =A0 =A0 =A0 LIBS=3D"$LIBS $LIBICONV"
> +@@ -87,6 +87,25 @@ int main ()
> + =A0 =A0 =A0 =A0 =A0 return 1;
> + =A0 =A0 =A0 }
> + =A0 }
> ++ =A0/* Test against Solaris 10 bug: Failures are not distinguishable fr=
om
> ++ =A0 =A0 successful returns. =A0*/
> ++ =A0{
> ++ =A0 =A0iconv_t cd_ascii_to_88591 =3D iconv_open ("ISO8859-1", "646");
> ++ =A0 =A0if (cd_ascii_to_88591 !=3D (iconv_t)(-1))
> ++ =A0 =A0 =A0{
> ++ =A0 =A0 =A0 =A0static const char input[] =3D "\263";
> ++ =A0 =A0 =A0 =A0char buf[10];
> ++ =A0 =A0 =A0 =A0const char *inptr =3D input;
> ++ =A0 =A0 =A0 =A0size_t inbytesleft =3D strlen (input);
> ++ =A0 =A0 =A0 =A0char *outptr =3D buf;
> ++ =A0 =A0 =A0 =A0size_t outbytesleft =3D sizeof (buf);
> ++ =A0 =A0 =A0 =A0size_t res =3D iconv (cd_ascii_to_88591,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(char **) &inpt=
r, &inbytesleft,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&outptr, &outby=
tesleft);
> ++ =A0 =A0 =A0 =A0if (res =3D=3D 0)
> ++ =A0 =A0 =A0 =A0 =A0return 1;
> ++ =A0 =A0 =A0}
> ++ =A0}
> + #if 0 /* This bug could be worked around by the caller. =A0*/
> + =A0 /* Test against HP-UX 11.11 bug: Positive return value instead of 0=
. =A0*/
> + =A0 {
> +@@ -134,7 +153,7 @@ int main ()
> + =A0 =A0 am_func_iconv=3Dno am_cv_lib_iconv=3Dno
> + =A0 fi
> + =A0 if test "$am_func_iconv" =3D yes; then
> +- =A0 =A0AC_DEFINE(HAVE_ICONV, 1,
> ++ =A0 =A0AC_DEFINE([HAVE_ICONV], [1],
> + =A0 =A0 =A0 [Define if you have the iconv() function and it works.])
> + =A0 fi
> + =A0 if test "$am_cv_lib_iconv" =3D yes; then
> +@@ -147,8 +166,8 @@ int main ()
> + =A0 =A0 LIBICONV=3D
> + =A0 =A0 LTLIBICONV=3D
> + =A0 fi
> +- =A0AC_SUBST(LIBICONV)
> +- =A0AC_SUBST(LTLIBICONV)
> ++ =A0AC_SUBST([LIBICONV])
> ++ =A0AC_SUBST([LTLIBICONV])
> + ])
> +
> + AC_DEFUN([AM_ICONV],
> +@@ -156,7 +175,7 @@ AC_DEFUN([AM_ICONV],
> + =A0 AM_ICONV_LINK
> + =A0 if test "$am_cv_func_iconv" =3D yes; then
> + =A0 =A0 AC_MSG_CHECKING([for iconv declaration])
> +- =A0 =A0AC_CACHE_VAL(am_cv_proto_iconv, [
> ++ =A0 =A0AC_CACHE_VAL([am_cv_proto_iconv], [
> + =A0 =A0 =A0 AC_TRY_COMPILE([
> + #include <stdlib.h>
> + #include <iconv.h>
> +@@ -169,12 +188,12 @@ size_t iconv (iconv_t cd, char * *inbuf,
> + #else
> + size_t iconv();
> + #endif
> +-], [], am_cv_proto_iconv_arg1=3D"", am_cv_proto_iconv_arg1=3D"const")
> ++], [], [am_cv_proto_iconv_arg1=3D""], [am_cv_proto_iconv_arg1=3D"const"=
])
> + =A0 =A0 =A0 am_cv_proto_iconv=3D"extern size_t iconv (iconv_t cd, $am_c=
v_proto_iconv_arg1 char * *inbuf, size_t *inbytesleft, char * *outbuf, size=
_t *outbytesleft);"])
> + =A0 =A0 am_cv_proto_iconv=3D`echo "[$]am_cv_proto_iconv" | tr -s ' ' | =
sed -e 's/( /(/'`
> +- =A0 =A0AC_MSG_RESULT([$]{ac_t:-
> +- =A0 =A0 =A0 =A0 }[$]am_cv_proto_iconv)
> +- =A0 =A0AC_DEFINE_UNQUOTED(ICONV_CONST, $am_cv_proto_iconv_arg1,
> ++ =A0 =A0AC_MSG_RESULT([
> ++ =A0 =A0 =A0 =A0 $am_cv_proto_iconv])
> ++ =A0 =A0AC_DEFINE_UNQUOTED([ICONV_CONST], [$am_cv_proto_iconv_arg1],
> + =A0 =A0 =A0 [Define as const if the declaration of iconv() needs const.=
])
> + =A0 fi
> + ])
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/lib-ld.m4 gstreamer-0.10.28/common/m4/lib-ld.m4
> +--- gstreamer-0.10.28.org/common/m4/lib-ld.m4 =A02010-03-08 08:58:16.000=
000000 -0800
> ++++ gstreamer-0.10.28/common/m4/lib-ld.m4 =A0 =A0 =A02010-05-22 08:37:17=
.753795900 -0700
> +@@ -1,5 +1,5 @@
> +-# lib-ld.m4 serial 3 (gettext-0.13)
> +-dnl Copyright (C) 1996-2003 Free Software Foundation, Inc.
> ++# lib-ld.m4 serial 4 (gettext-0.18)
> ++dnl Copyright (C) 1996-2003, 2009-2010 Free Software Foundation, Inc.
> + dnl This file is free software; the Free Software Foundation
> + dnl gives unlimited permission to copy and/or distribute it,
> + dnl with or without modifications, as long as this notice is preserved.
> +@@ -10,7 +10,7 @@ dnl with libtool.m4.
> +
> + dnl From libtool-1.4. Sets the variable with_gnu_ld to yes or no.
> + AC_DEFUN([AC_LIB_PROG_LD_GNU],
> +-[AC_CACHE_CHECK([if the linker ($LD) is GNU ld], acl_cv_prog_gnu_ld,
> ++[AC_CACHE_CHECK([if the linker ($LD) is GNU ld], [acl_cv_prog_gnu_ld],
> + [# I'd rather use --version here, but apparently some GNU ld's only acc=
ept -v.
> + case `$LD -v 2>&1 </dev/null` in
> + *GNU* | *'with BFD'*)
> +@@ -23,7 +23,7 @@ with_gnu_ld=3D$acl_cv_prog_gnu_ld
> +
> + dnl From libtool-1.4. Sets the variable LD.
> + AC_DEFUN([AC_LIB_PROG_LD],
> +-[AC_ARG_WITH(gnu-ld,
> ++[AC_ARG_WITH([gnu-ld],
> + [ =A0--with-gnu-ld =A0 =A0 =A0 =A0 =A0 assume the C compiler uses GNU l=
d [default=3Dno]],
> + test "$withval" =3D no || with_gnu_ld=3Dyes, with_gnu_ld=3Dno)
> + AC_REQUIRE([AC_PROG_CC])dnl
> +@@ -59,7 +59,7 @@ if test "$GCC" =3D yes; then
> + =A0 =A0 =A0 # Canonicalize the path of ld
> + =A0 =A0 =A0 ac_prog=3D`echo $ac_prog| sed 's%\\\\%/%g'`
> + =A0 =A0 =A0 while echo $ac_prog | grep "$re_direlt" > /dev/null 2>&1; d=
o
> +- =A0 =A0 =A0ac_prog=3D`echo $ac_prog| sed "s%$re_direlt%/%"`
> ++ =A0 =A0 =A0 =A0ac_prog=3D`echo $ac_prog| sed "s%$re_direlt%/%"`
> + =A0 =A0 =A0 done
> + =A0 =A0 =A0 test -z "$LD" && LD=3D"$ac_prog"
> + =A0 =A0 =A0 ;;
> +@@ -77,7 +77,7 @@ elif test "$with_gnu_ld" =3D yes; then
> + else
> + =A0 AC_MSG_CHECKING([for non-GNU ld])
> + fi
> +-AC_CACHE_VAL(acl_cv_path_LD,
> ++AC_CACHE_VAL([acl_cv_path_LD],
> + [if test -z "$LD"; then
> + =A0 IFS=3D"${IFS=3D =A0 =A0 =A0 =A0 }"; ac_save_ifs=3D"$IFS"; IFS=3D"${=
IFS}${PATH_SEPARATOR-:}"
> + =A0 for ac_dir in $PATH; do
> +@@ -89,9 +89,9 @@ AC_CACHE_VAL(acl_cv_path_LD,
> + =A0 =A0 =A0 # Break only if it was the GNU/non-GNU ld that we prefer.
> + =A0 =A0 =A0 case `"$acl_cv_path_LD" -v 2>&1 < /dev/null` in
> + =A0 =A0 =A0 *GNU* | *'with BFD'*)
> +- =A0 =A0 =A0test "$with_gnu_ld" !=3D no && break ;;
> ++ =A0 =A0 =A0 =A0test "$with_gnu_ld" !=3D no && break ;;
> + =A0 =A0 =A0 *)
> +- =A0 =A0 =A0test "$with_gnu_ld" !=3D yes && break ;;
> ++ =A0 =A0 =A0 =A0test "$with_gnu_ld" !=3D yes && break ;;
> + =A0 =A0 =A0 esac
> + =A0 =A0 fi
> + =A0 done
> +@@ -101,9 +101,9 @@ else
> + fi])
> + LD=3D"$acl_cv_path_LD"
> + if test -n "$LD"; then
> +- =A0AC_MSG_RESULT($LD)
> ++ =A0AC_MSG_RESULT([$LD])
> + else
> +- =A0AC_MSG_RESULT(no)
> ++ =A0AC_MSG_RESULT([no])
> + fi
> + test -z "$LD" && AC_MSG_ERROR([no acceptable ld found in \$PATH])
> + AC_LIB_PROG_LD_GNU
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/lib-link.m4 gstreamer-0.10.28/common/m4/lib-link.m4
> +--- gstreamer-0.10.28.org/common/m4/lib-link.m4 =A0 =A0 =A0 =A02010-03-0=
8 08:58:16.000000000 -0800
> ++++ gstreamer-0.10.28/common/m4/lib-link.m4 =A0 =A02010-05-22 08:37:17.7=
63792911 -0700
> +@@ -1,12 +1,12 @@
> +-# lib-link.m4 serial 13 (gettext-0.17)
> +-dnl Copyright (C) 2001-2007 Free Software Foundation, Inc.
> ++# lib-link.m4 serial 21 (gettext-0.18)
> ++dnl Copyright (C) 2001-2010 Free Software Foundation, Inc.
> + dnl This file is free software; the Free Software Foundation
> + dnl gives unlimited permission to copy and/or distribute it,
> + dnl with or without modifications, as long as this notice is preserved.
> +
> + dnl From Bruno Haible.
> +
> +-AC_PREREQ(2.54)
> ++AC_PREREQ([2.54])
> +
> + dnl AC_LIB_LINKFLAGS(name [, dependencies]) searches for libname and
> + dnl the libraries corresponding to explicit and implicit dependencies.
> +@@ -18,9 +18,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS],
> + [
> + =A0 AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
> + =A0 AC_REQUIRE([AC_LIB_RPATH])
> +- =A0define([Name],[translit([$1],[./-], [___])])
> +- =A0define([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ABCDEFGHI=
JKLMNOPQRSTUVWXYZ___])])
> ++ =A0pushdef([Name],[translit([$1],[./-], [___])])
> ++ =A0pushdef([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ABCDEF=
GHIJKLMNOPQRSTUVWXYZ___])])
> + =A0 AC_CACHE_CHECK([how to link with lib[]$1], [ac_cv_lib[]Name[]_libs]=
, [
> + =A0 =A0 AC_LIB_LINKFLAGS_BODY([$1], [$2])
> + =A0 =A0 ac_cv_lib[]Name[]_libs=3D"$LIB[]NAME"
> +@@ -39,16 +39,17 @@ AC_DEFUN([AC_LIB_LINKFLAGS],
> + =A0 dnl Also set HAVE_LIB[]NAME so that AC_LIB_HAVE_LINKFLAGS can reuse=
 the
> + =A0 dnl results of this search when this library appears as a dependenc=
y.
> + =A0 HAVE_LIB[]NAME=3Dyes
> +- =A0undefine([Name])
> +- =A0undefine([NAME])
> ++ =A0popdef([NAME])
> ++ =A0popdef([Name])
> + ])
> +
> +-dnl AC_LIB_HAVE_LINKFLAGS(name, dependencies, includes, testcode)
> ++dnl AC_LIB_HAVE_LINKFLAGS(name, dependencies, includes, testcode, [miss=
ing-message])
> + dnl searches for libname and the libraries corresponding to explicit an=
d
> + dnl implicit dependencies, together with the specified include files an=
d
> +-dnl the ability to compile and link the specified testcode. If found, i=
t
> +-dnl sets and AC_SUBSTs HAVE_LIB${NAME}=3Dyes and the LIB${NAME} and
> +-dnl LTLIB${NAME} variables and augments the CPPFLAGS variable, and
> ++dnl the ability to compile and link the specified testcode. The missing=
-message
> ++dnl defaults to 'no' and may contain additional hints for the user.
> ++dnl If found, it sets and AC_SUBSTs HAVE_LIB${NAME}=3Dyes and the LIB${=
NAME}
> ++dnl and LTLIB${NAME} variables and augments the CPPFLAGS variable, and
> + dnl #defines HAVE_LIB${NAME} to 1. Otherwise, it sets and AC_SUBSTs
> + dnl HAVE_LIB${NAME}=3Dno and LIB${NAME} and LTLIB${NAME} to empty.
> + dnl Sets and AC_SUBSTs the LIB${NAME}_PREFIX variable to nonempty if li=
bname
> +@@ -57,9 +58,9 @@ AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],
> + [
> + =A0 AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
> + =A0 AC_REQUIRE([AC_LIB_RPATH])
> +- =A0define([Name],[translit([$1],[./-], [___])])
> +- =A0define([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ABCDEFGHI=
JKLMNOPQRSTUVWXYZ___])])
> ++ =A0pushdef([Name],[translit([$1],[./-], [___])])
> ++ =A0pushdef([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ABCDEF=
GHIJKLMNOPQRSTUVWXYZ___])])
> +
> + =A0 dnl Search for lib[]Name and define LIB[]NAME, LTLIB[]NAME and INC[=
]NAME
> + =A0 dnl accordingly.
> +@@ -73,13 +74,25 @@ AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],
> +
> + =A0 AC_CACHE_CHECK([for lib[]$1], [ac_cv_lib[]Name], [
> + =A0 =A0 ac_save_LIBS=3D"$LIBS"
> +- =A0 =A0LIBS=3D"$LIBS $LIB[]NAME"
> +- =A0 =A0AC_TRY_LINK([$3], [$4], [ac_cv_lib[]Name=3Dyes], [ac_cv_lib[]Na=
me=3Dno])
> ++ =A0 =A0dnl If $LIB[]NAME contains some -l options, add it to the end o=
f LIBS,
> ++ =A0 =A0dnl because these -l options might require -L options that are =
present in
> ++ =A0 =A0dnl LIBS. -l options benefit only from the -L options listed be=
fore it.
> ++ =A0 =A0dnl Otherwise, add it to the front of LIBS, because it may be a=
 static
> ++ =A0 =A0dnl library that depends on another static library that is pres=
ent in LIBS.
> ++ =A0 =A0dnl Static libraries benefit only from the static libraries lis=
ted after
> ++ =A0 =A0dnl it.
> ++ =A0 =A0case " $LIB[]NAME" in
> ++ =A0 =A0 =A0*" -l"*) LIBS=3D"$LIBS $LIB[]NAME" ;;
> ++ =A0 =A0 =A0*) =A0 =A0 =A0 LIBS=3D"$LIB[]NAME $LIBS" ;;
> ++ =A0 =A0esac
> ++ =A0 =A0AC_TRY_LINK([$3], [$4],
> ++ =A0 =A0 =A0[ac_cv_lib[]Name=3Dyes],
> ++ =A0 =A0 =A0[ac_cv_lib[]Name=3D'm4_if([$5], [], [no], [[$5]])'])
> + =A0 =A0 LIBS=3D"$ac_save_LIBS"
> + =A0 ])
> + =A0 if test "$ac_cv_lib[]Name" =3D yes; then
> + =A0 =A0 HAVE_LIB[]NAME=3Dyes
> +- =A0 =A0AC_DEFINE([HAVE_LIB]NAME, 1, [Define if you have the $1 library=
.])
> ++ =A0 =A0AC_DEFINE([HAVE_LIB]NAME, 1, [Define if you have the lib][$1 li=
brary.])
> + =A0 =A0 AC_MSG_CHECKING([how to link with lib[]$1])
> + =A0 =A0 AC_MSG_RESULT([$LIB[]NAME])
> + =A0 else
> +@@ -95,8 +108,8 @@ AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],
> + =A0 AC_SUBST([LIB]NAME)
> + =A0 AC_SUBST([LTLIB]NAME)
> + =A0 AC_SUBST([LIB]NAME[_PREFIX])
> +- =A0undefine([Name])
> +- =A0undefine([NAME])
> ++ =A0popdef([NAME])
> ++ =A0popdef([Name])
> + ])
> +
> + dnl Determine the platform dependent parameters needed to use rpath:
> +@@ -114,7 +127,7 @@ AC_DEFUN([AC_LIB_RPATH],
> + =A0 AC_REQUIRE([AC_LIB_PROG_LD]) =A0 =A0 =A0 =A0 =A0 =A0dnl we use $LD,=
 $with_gnu_ld
> + =A0 AC_REQUIRE([AC_CANONICAL_HOST]) =A0 =A0 =A0 =A0 dnl we use $host
> + =A0 AC_REQUIRE([AC_CONFIG_AUX_DIR_DEFAULT]) dnl we use $ac_aux_dir
> +- =A0AC_CACHE_CHECK([for shared library run path origin], acl_cv_rpath, =
[
> ++ =A0AC_CACHE_CHECK([for shared library run path origin], [acl_cv_rpath]=
, [
> + =A0 =A0 CC=3D"$CC" GCC=3D"$GCC" LDFLAGS=3D"$LDFLAGS" LD=3D"$LD" with_gn=
u_ld=3D"$with_gnu_ld" \
> + =A0 =A0 ${CONFIG_SHELL-/bin/sh} "$ac_aux_dir/config.rpath" "$host" > co=
nftest.sh
> + =A0 =A0 . ./conftest.sh
> +@@ -131,11 +144,32 @@ AC_DEFUN([AC_LIB_RPATH],
> + =A0 acl_hardcode_direct=3D"$acl_cv_hardcode_direct"
> + =A0 acl_hardcode_minus_L=3D"$acl_cv_hardcode_minus_L"
> + =A0 dnl Determine whether the user wants rpath handling at all.
> +- =A0AC_ARG_ENABLE(rpath,
> ++ =A0AC_ARG_ENABLE([rpath],
> + =A0 =A0 [ =A0--disable-rpath =A0 =A0 =A0 =A0 do not hardcode runtime li=
brary paths],
> + =A0 =A0 :, enable_rpath=3Dyes)
> + ])
> +
> ++dnl AC_LIB_FROMPACKAGE(name, package)
> ++dnl declares that libname comes from the given package. The configure f=
ile
> ++dnl will then not have a --with-libname-prefix option but a
> ++dnl --with-package-prefix option. Several libraries can come from the s=
ame
> ++dnl package. This declaration must occur before an AC_LIB_LINKFLAGS or =
similar
> ++dnl macro call that searches for libname.
> ++AC_DEFUN([AC_LIB_FROMPACKAGE],
> ++[
> ++ =A0pushdef([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ABCDEF=
GHIJKLMNOPQRSTUVWXYZ___])])
> ++ =A0define([acl_frompackage_]NAME, [$2])
> ++ =A0popdef([NAME])
> ++ =A0pushdef([PACK],[$2])
> ++ =A0pushdef([PACKUP],[translit(PACK,[abcdefghijklmnopqrstuvwxyz./-],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[AB=
CDEFGHIJKLMNOPQRSTUVWXYZ___])])
> ++ =A0define([acl_libsinpackage_]PACKUP,
> ++ =A0 =A0m4_ifdef([acl_libsinpackage_]PACKUP, [acl_libsinpackage_]PACKUP=
[[, ]],)[lib$1])
> ++ =A0popdef([PACKUP])
> ++ =A0popdef([PACK])
> ++])
> ++
> + dnl AC_LIB_LINKFLAGS_BODY(name [, dependencies]) searches for libname a=
nd
> + dnl the libraries corresponding to explicit and implicit dependencies.
> + dnl Sets the LIB${NAME}, LTLIB${NAME} and INC${NAME} variables.
> +@@ -144,19 +178,23 @@ dnl in ${LIB${NAME}_PREFIX}/$acl_libdirs
> + AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
> + [
> + =A0 AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
> +- =A0define([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ABCDEFGHI=
JKLMNOPQRSTUVWXYZ___])])
> ++ =A0pushdef([NAME],[translit([$1],[abcdefghijklmnopqrstuvwxyz./-],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[ABCDEF=
GHIJKLMNOPQRSTUVWXYZ___])])
> ++ =A0pushdef([PACK],[m4_ifdef([acl_frompackage_]NAME, [acl_frompackage_]=
NAME, lib[$1])])
> ++ =A0pushdef([PACKUP],[translit(PACK,[abcdefghijklmnopqrstuvwxyz./-],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[AB=
CDEFGHIJKLMNOPQRSTUVWXYZ___])])
> ++ =A0pushdef([PACKLIBS],[m4_ifdef([acl_frompackage_]NAME, [acl_libsinpac=
kage_]PACKUP, lib[$1])])
> + =A0 dnl Autoconf >=3D 2.61 supports dots in --with options.
> +- =A0define([N_A_M_E],[m4_if(m4_version_compare(m4_defn([m4_PACKAGE_VERS=
ION]),[2.61]),[-1],[translit([$1],[.],[_])],[$1])])
> ++ =A0pushdef([P_A_C_K],[m4_if(m4_version_compare(m4_defn([m4_PACKAGE_VER=
SION]),[2.61]),[-1],[translit(PACK,[.],[_])],PACK)])
> + =A0 dnl By default, look in $includedir and $libdir.
> + =A0 use_additional=3Dyes
> + =A0 AC_LIB_WITH_FINAL_PREFIX([
> + =A0 =A0 eval additional_includedir=3D\"$includedir\"
> + =A0 =A0 eval additional_libdir=3D\"$libdir\"
> + =A0 ])
> +- =A0AC_LIB_ARG_WITH([lib]N_A_M_E[-prefix],
> +-[ =A0--with-lib]N_A_M_E[-prefix[=3DDIR] =A0search for lib$1 in DIR/incl=
ude and DIR/lib
> +- =A0--without-lib]N_A_M_E[-prefix =A0 =A0 don't search for lib$1 in inc=
ludedir and libdir],
> ++ =A0AC_ARG_WITH(P_A_C_K[-prefix],
> ++[[ =A0--with-]]P_A_C_K[[-prefix[=3DDIR] =A0search for ]PACKLIBS[ in DIR=
/include and DIR/lib
> ++ =A0--without-]]P_A_C_K[[-prefix =A0 =A0 don't search for ]PACKLIBS[ in=
 includedir and libdir]],
> + [
> + =A0 =A0 if test "X$withval" =3D "Xno"; then
> + =A0 =A0 =A0 use_additional=3Dno
> +@@ -169,6 +207,10 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 additional_includedir=3D"$withval/include"
> + =A0 =A0 =A0 =A0 additional_libdir=3D"$withval/$acl_libdirstem"
> ++ =A0 =A0 =A0 =A0if test "$acl_libdirstem2" !=3D "$acl_libdirstem" \
> ++ =A0 =A0 =A0 =A0 =A0 && ! test -d "$withval/$acl_libdirstem"; then
> ++ =A0 =A0 =A0 =A0 =A0additional_libdir=3D"$withval/$acl_libdirstem2"
> ++ =A0 =A0 =A0 =A0fi
> + =A0 =A0 =A0 fi
> + =A0 =A0 fi
> + ])
> +@@ -178,6 +220,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
> + =A0 LTLIB[]NAME=3D
> + =A0 INC[]NAME=3D
> + =A0 LIB[]NAME[]_PREFIX=3D
> ++ =A0dnl HAVE_LIB${NAME} is an indicator that LIB${NAME}, LTLIB${NAME} h=
ave been
> ++ =A0dnl computed. So it has to be reset here.
> ++ =A0HAVE_LIB[]NAME=3D
> + =A0 rpathdirs=3D
> + =A0 ltrpathdirs=3D
> + =A0 names_already_handled=3D
> +@@ -267,6 +312,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 fi
> ++ =A0 =A0 =A0 =A0 =A0dnl Just let the compiler find the library, the com=
piler and user are smarter then this script
> ++ =A0 =A0 =A0 =A0 =A0dnl when cross compiling and working with a relocat=
ed install.
> ++ =A0 =A0 =A0 =A0 =A0found_dir=3D""
> + =A0 =A0 =A0 =A0 =A0 if test "X$found_dir" =3D "X"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 for x in $LDFLAGS $LTLIB[]NAME; do
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 AC_LIB_WITH_FINAL_PREFIX([eval x=3D\"$x\"])
> +@@ -327,7 +375,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dnl Linking with a shared library. We attem=
pt to hardcode its
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dnl directory into the executable's runpath=
, unless it's the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dnl standard /usr/lib.
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0if test "$enable_rpath" =3D no || test "X$f=
ound_dir" =3D "X/usr/$acl_libdirstem"; then
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0if test "$enable_rpath" =3D no \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 || test "X$found_dir" =3D "X/usr/$acl_=
libdirstem" \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 || test "X$found_dir" =3D "X/usr/$acl_=
libdirstem2"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dnl No hardcoding is needed.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 LIB[]NAME=3D"${LIB[]NAME}${LIB[]NAME:+ =
}$found_so"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> +@@ -415,7 +465,16 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
> + =A0 =A0 =A0 =A0 =A0 =A0 case "$found_dir" in
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 */$acl_libdirstem | */$acl_libdirstem/)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 basedir=3D`echo "X$found_dir" | sed -e =
's,^X,,' -e "s,/$acl_libdirstem/"'*$,,'`
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LIB[]NAME[]_PREFIX=3D"$basedir"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if test "$name" =3D '$1'; then
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LIB[]NAME[]_PREFIX=3D"$basedir"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0additional_includedir=3D"$basedir/inclu=
de"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0;;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0*/$acl_libdirstem2 | */$acl_libdirstem2/)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0basedir=3D`echo "X$found_dir" | sed -e =
's,^X,,' -e "s,/$acl_libdirstem2/"'*$,,'`
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if test "$name" =3D '$1'; then
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LIB[]NAME[]_PREFIX=3D"$basedir"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 additional_includedir=3D"$basedir/inclu=
de"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;
> + =A0 =A0 =A0 =A0 =A0 =A0 esac
> +@@ -476,9 +535,11 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dnl =A0 3. if it's already pres=
ent in $LDFLAGS or the already
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dnl =A0 =A0 =A0constructed $LIB=
NAME,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dnl =A0 4. if it doesn't exist =
as a directory.
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if test "X$additional_libdir" !=
=3D "X/usr/$acl_libdirstem"; then
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if test "X$additional_libdir" !=
=3D "X/usr/$acl_libdirstem" \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 && test "X$additional_libd=
ir" !=3D "X/usr/$acl_libdirstem2"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 haveit=3D
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if test "X$additional_libdi=
r" =3D "X/usr/local/$acl_libdirstem"; then
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if test "X$additional_libdi=
r" =3D "X/usr/local/$acl_libdirstem" \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 || test "X$additional_=
libdir" =3D "X/usr/local/$acl_libdirstem2"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test -n "$GCC"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case $host_os in
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 linux* | gnu* |=
 k*bsd*-gnu) haveit=3Dyes;;
> +@@ -609,6 +670,11 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
> + =A0 =A0 =A0 LTLIB[]NAME=3D"${LTLIB[]NAME}${LTLIB[]NAME:+ }-R$found_dir"
> + =A0 =A0 done
> + =A0 fi
> ++ =A0popdef([P_A_C_K])
> ++ =A0popdef([PACKLIBS])
> ++ =A0popdef([PACKUP])
> ++ =A0popdef([PACK])
> ++ =A0popdef([NAME])
> + ])
> +
> + dnl AC_LIB_APPENDTOVAR(VAR, CONTENTS) appends the elements of CONTENTS =
to VAR,
> +@@ -654,7 +720,8 @@ AC_DEFUN([AC_LIB_LINKFLAGS_FROM_LIBS],
> + =A0 =A0 =A0 =A0 if test -n "$next"; then
> + =A0 =A0 =A0 =A0 =A0 dir=3D"$next"
> + =A0 =A0 =A0 =A0 =A0 dnl No need to hardcode the standard /usr/lib.
> +- =A0 =A0 =A0 =A0 =A0if test "X$dir" !=3D "X/usr/$acl_libdirstem"; then
> ++ =A0 =A0 =A0 =A0 =A0if test "X$dir" !=3D "X/usr/$acl_libdirstem" \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 && test "X$dir" !=3D "X/usr/$acl_libdirstem2";=
 then
> + =A0 =A0 =A0 =A0 =A0 =A0 rpathdirs=3D"$rpathdirs $dir"
> + =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 next=3D
> +@@ -663,7 +730,8 @@ AC_DEFUN([AC_LIB_LINKFLAGS_FROM_LIBS],
> + =A0 =A0 =A0 =A0 =A0 =A0 -L) next=3Dyes ;;
> + =A0 =A0 =A0 =A0 =A0 =A0 -L*) dir=3D`echo "X$opt" | sed -e 's,^X-L,,'`
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dnl No need to hardcode the standard=
 /usr/lib.
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test "X$dir" !=3D "X/usr/$acl_libdi=
rstem"; then
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test "X$dir" !=3D "X/usr/$acl_libdi=
rstem" \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&& test "X$dir" !=3D "X/usr/$ac=
l_libdirstem2"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rpathdirs=3D"$rpathdirs $dir"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0next=3D ;;
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/lib-prefix.m4 gstreamer-0.10.28/common/m4/lib-prefix.m4
> +--- gstreamer-0.10.28.org/common/m4/lib-prefix.m4 =A0 =A0 =A02010-03-08 =
08:58:16.000000000 -0800
> ++++ gstreamer-0.10.28/common/m4/lib-prefix.m4 =A02010-05-22 08:37:17.773=
783356 -0700
> +@@ -1,5 +1,5 @@
> +-# lib-prefix.m4 serial 5 (gettext-0.15)
> +-dnl Copyright (C) 2001-2005 Free Software Foundation, Inc.
> ++# lib-prefix.m4 serial 7 (gettext-0.18)
> ++dnl Copyright (C) 2001-2005, 2008-2010 Free Software Foundation, Inc.
> + dnl This file is free software; the Free Software Foundation
> + dnl gives unlimited permission to copy and/or distribute it,
> + dnl with or without modifications, as long as this notice is preserved.
> +@@ -153,33 +153,72 @@ AC_DEFUN([AC_LIB_WITH_FINAL_PREFIX],
> + =A0 prefix=3D"$acl_save_prefix"
> + ])
> +
> +-dnl AC_LIB_PREPARE_MULTILIB creates a variable acl_libdirstem, containi=
ng
> +-dnl the basename of the libdir, either "lib" or "lib64".
> ++dnl AC_LIB_PREPARE_MULTILIB creates
> ++dnl - a variable acl_libdirstem, containing the basename of the libdir,=
 either
> ++dnl =A0 "lib" or "lib64" or "lib/64",
> ++dnl - a variable acl_libdirstem2, as a secondary possible value for
> ++dnl =A0 acl_libdirstem, either the same as acl_libdirstem or "lib/sparc=
v9" or
> ++dnl =A0 "lib/amd64".
> + AC_DEFUN([AC_LIB_PREPARE_MULTILIB],
> + [
> +- =A0dnl There is no formal standard regarding lib and lib64. The curren=
t
> +- =A0dnl practice is that on a system supporting 32-bit and 64-bit instr=
uction
> +- =A0dnl sets or ABIs, 64-bit libraries go under $prefix/lib64 and 32-bi=
t
> +- =A0dnl libraries go under $prefix/lib. We determine the compiler's def=
ault
> +- =A0dnl mode by looking at the compiler's library search path. If at le=
ast
> +- =A0dnl of its elements ends in /lib64 or points to a directory whose a=
bsolute
> +- =A0dnl pathname ends in /lib64, we assume a 64-bit ABI. Otherwise we u=
se the
> +- =A0dnl default, namely "lib".
> ++ =A0dnl There is no formal standard regarding lib and lib64.
> ++ =A0dnl On glibc systems, the current practice is that on a system supp=
orting
> ++ =A0dnl 32-bit and 64-bit instruction sets or ABIs, 64-bit libraries go=
 under
> ++ =A0dnl $prefix/lib64 and 32-bit libraries go under $prefix/lib. We det=
ermine
> ++ =A0dnl the compiler's default mode by looking at the compiler's librar=
y search
> ++ =A0dnl path. If at least one of its elements ends in /lib64 or points =
to a
> ++ =A0dnl directory whose absolute pathname ends in /lib64, we assume a 6=
4-bit ABI.
> ++ =A0dnl Otherwise we use the default, namely "lib".
> ++ =A0dnl On Solaris systems, the current practice is that on a system su=
pporting
> ++ =A0dnl 32-bit and 64-bit instruction sets or ABIs, 64-bit libraries go=
 under
> ++ =A0dnl $prefix/lib/64 (which is a symlink to either $prefix/lib/sparcv=
9 or
> ++ =A0dnl $prefix/lib/amd64) and 32-bit libraries go under $prefix/lib.
> ++ =A0AC_REQUIRE([AC_CANONICAL_HOST])
> + =A0 acl_libdirstem=3Dlib
> +- =A0searchpath=3D`(LC_ALL=3DC $CC -print-search-dirs) 2>/dev/null | sed=
 -n -e 's,^libraries: ,,p' | sed -e 's,^=3D,,'`
> +- =A0if test -n "$searchpath"; then
> +- =A0 =A0acl_save_IFS=3D"${IFS=3D =A0 =A0 =A0}"; IFS=3D":"
> +- =A0 =A0for searchdir in $searchpath; do
> +- =A0 =A0 =A0if test -d "$searchdir"; then
> +- =A0 =A0 =A0 =A0case "$searchdir" in
> +- =A0 =A0 =A0 =A0 =A0*/lib64/ | */lib64 ) acl_libdirstem=3Dlib64 ;;
> +- =A0 =A0 =A0 =A0 =A0*) searchdir=3D`cd "$searchdir" && pwd`
> +- =A0 =A0 =A0 =A0 =A0 =A0 case "$searchdir" in
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 */lib64 ) acl_libdirstem=3Dlib64 ;;
> +- =A0 =A0 =A0 =A0 =A0 =A0 esac ;;
> ++ =A0acl_libdirstem2=3D
> ++ =A0case "$host_os" in
> ++ =A0 =A0solaris*)
> ++ =A0 =A0 =A0dnl See Solaris 10 Software Developer Collection > Solaris =
64-bit Developer's Guide > The Development Environment
> ++ =A0 =A0 =A0dnl <http://docs.sun.com/app/docs/doc/816-5138/dev-env?l=3D=
en&a=3Dview>.
> ++ =A0 =A0 =A0dnl "Portable Makefiles should refer to any library directo=
ries using the 64 symbolic link."
> ++ =A0 =A0 =A0dnl But we want to recognize the sparcv9 or amd64 subdirect=
ory also if the
> ++ =A0 =A0 =A0dnl symlink is missing, so we set acl_libdirstem2 too.
> ++ =A0 =A0 =A0AC_CACHE_CHECK([for 64-bit host], [gl_cv_solaris_64bit],
> ++ =A0 =A0 =A0 =A0[AC_EGREP_CPP([sixtyfour bits], [
> ++#ifdef _LP64
> ++sixtyfour bits
> ++#endif
> ++ =A0 =A0 =A0 =A0 =A0 ], [gl_cv_solaris_64bit=3Dyes], [gl_cv_solaris_64b=
it=3Dno])
> ++ =A0 =A0 =A0 =A0])
> ++ =A0 =A0 =A0if test $gl_cv_solaris_64bit =3D yes; then
> ++ =A0 =A0 =A0 =A0acl_libdirstem=3Dlib/64
> ++ =A0 =A0 =A0 =A0case "$host_cpu" in
> ++ =A0 =A0 =A0 =A0 =A0sparc*) =A0 =A0 =A0 =A0acl_libdirstem2=3Dlib/sparcv=
9 ;;
> ++ =A0 =A0 =A0 =A0 =A0i*86 | x86_64) acl_libdirstem2=3Dlib/amd64 ;;
> + =A0 =A0 =A0 =A0 esac
> + =A0 =A0 =A0 fi
> +- =A0 =A0done
> +- =A0 =A0IFS=3D"$acl_save_IFS"
> +- =A0fi
> ++ =A0 =A0 =A0;;
> ++ =A0 =A0*)
> ++ =A0 =A0 =A0searchpath=3D`(LC_ALL=3DC $CC -print-search-dirs) 2>/dev/nu=
ll | sed -n -e 's,^libraries: ,,p' | sed -e 's,^=3D,,'`
> ++ =A0 =A0 =A0if test -n "$searchpath"; then
> ++ =A0 =A0 =A0 =A0acl_save_IFS=3D"${IFS=3D =A0}"; IFS=3D":"
> ++ =A0 =A0 =A0 =A0for searchdir in $searchpath; do
> ++ =A0 =A0 =A0 =A0 =A0if test -d "$searchdir"; then
> ++ =A0 =A0 =A0 =A0 =A0 =A0case "$searchdir" in
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0*/lib64/ | */lib64 ) acl_libdirstem=3Dlib64=
 ;;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0*/../ | */.. )
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# Better ignore directories of this for=
m. They are misleading.
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0;;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0*) searchdir=3D`cd "$searchdir" && pwd`
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case "$searchdir" in
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */lib64 ) acl_libdirstem=3Dlib64 ;=
;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 esac ;;
> ++ =A0 =A0 =A0 =A0 =A0 =A0esac
> ++ =A0 =A0 =A0 =A0 =A0fi
> ++ =A0 =A0 =A0 =A0done
> ++ =A0 =A0 =A0 =A0IFS=3D"$acl_save_IFS"
> ++ =A0 =A0 =A0fi
> ++ =A0 =A0 =A0;;
> ++ =A0esac
> ++ =A0test -n "$acl_libdirstem2" || acl_libdirstem2=3D"$acl_libdirstem"
> + ])
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/nls.m4 gstreamer-0.10.28/common/m4/nls.m4
> +--- gstreamer-0.10.28.org/common/m4/nls.m4 =A0 =A0 2010-03-08 08:58:16.0=
00000000 -0800
> ++++ gstreamer-0.10.28/common/m4/nls.m4 2010-05-22 08:37:17.793786388 -07=
00
> +@@ -1,5 +1,6 @@
> +-# nls.m4 serial 3 (gettext-0.15)
> +-dnl Copyright (C) 1995-2003, 2005-2006 Free Software Foundation, Inc.
> ++# nls.m4 serial 5 (gettext-0.18)
> ++dnl Copyright (C) 1995-2003, 2005-2006, 2008-2010 Free Software Foundat=
ion,
> ++dnl Inc.
> + dnl This file is free software; the Free Software Foundation
> + dnl gives unlimited permission to copy and/or distribute it,
> + dnl with or without modifications, as long as this notice is preserved.
> +@@ -17,15 +18,15 @@ dnl Authors:
> + dnl =A0 Ulrich Drepper <drepper@cygnus.com>, 1995-2000.
> + dnl =A0 Bruno Haible <haible@clisp.cons.org>, 2000-2003.
> +
> +-AC_PREREQ(2.50)
> ++AC_PREREQ([2.50])
> +
> + AC_DEFUN([AM_NLS],
> + [
> + =A0 AC_MSG_CHECKING([whether NLS is requested])
> + =A0 dnl Default is enabled NLS
> +- =A0AC_ARG_ENABLE(nls,
> ++ =A0AC_ARG_ENABLE([nls],
> + =A0 =A0 [ =A0--disable-nls =A0 =A0 =A0 =A0 =A0 do not use Native Langua=
ge Support],
> + =A0 =A0 USE_NLS=3D$enableval, USE_NLS=3Dyes)
> +- =A0AC_MSG_RESULT($USE_NLS)
> +- =A0AC_SUBST(USE_NLS)
> ++ =A0AC_MSG_RESULT([$USE_NLS])
> ++ =A0AC_SUBST([USE_NLS])
> + ])
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/po.m4 gstreamer-0.10.28/common/m4/po.m4
> +--- gstreamer-0.10.28.org/common/m4/po.m4 =A0 =A0 =A02010-03-08 08:58:16=
.000000000 -0800
> ++++ gstreamer-0.10.28/common/m4/po.m4 =A02010-05-22 08:37:17.803788218 -=
0700
> +@@ -1,5 +1,5 @@
> +-# po.m4 serial 15 (gettext-0.17)
> +-dnl Copyright (C) 1995-2007 Free Software Foundation, Inc.
> ++# po.m4 serial 17 (gettext-0.18)
> ++dnl Copyright (C) 1995-2010 Free Software Foundation, Inc.
> + dnl This file is free software; the Free Software Foundation
> + dnl gives unlimited permission to copy and/or distribute it,
> + dnl with or without modifications, as long as this notice is preserved.
> +@@ -17,7 +17,7 @@ dnl Authors:
> + dnl =A0 Ulrich Drepper <drepper@cygnus.com>, 1995-2000.
> + dnl =A0 Bruno Haible <haible@clisp.cons.org>, 2000-2003.
> +
> +-AC_PREREQ(2.50)
> ++AC_PREREQ([2.50])
> +
> + dnl Checks for all prerequisites of the po subdirectory.
> + AC_DEFUN([AM_PO_SUBDIRS],
> +@@ -29,7 +29,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
> +
> + =A0 dnl Release version of the gettext macros. This is used to ensure t=
hat
> + =A0 dnl the gettext macros and po/Makefile.in.in are in sync.
> +- =A0AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
> ++ =A0AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
> +
> + =A0 dnl Perform the following tests also if --disable-nls has been give=
n,
> + =A0 dnl because they are needed for "make dist" to work.
> +@@ -41,7 +41,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
> + =A0 =A0 [$ac_dir/$ac_word --statistics /dev/null >&]AS_MESSAGE_LOG_FD[ =
2>&1 &&
> + =A0 =A0 =A0(if $ac_dir/$ac_word --statistics /dev/null 2>&1 >/dev/null =
| grep usage >/dev/null; then exit 1; else exit 0; fi)],
> + =A0 =A0 :)
> +- =A0AC_PATH_PROG(GMSGFMT, gmsgfmt, $MSGFMT)
> ++ =A0AC_PATH_PROG([GMSGFMT], [gmsgfmt], [$MSGFMT])
> +
> + =A0 dnl Test whether it is GNU msgfmt >=3D 0.15.
> + changequote(,)dnl
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
ommon/m4/progtest.m4 gstreamer-0.10.28/common/m4/progtest.m4
> +--- gstreamer-0.10.28.org/common/m4/progtest.m4 =A0 =A0 =A0 =A02010-03-0=
8 08:58:16.000000000 -0800
> ++++ gstreamer-0.10.28/common/m4/progtest.m4 =A0 =A02010-05-22 08:37:17.8=
33809771 -0700
> +@@ -1,5 +1,5 @@
> +-# progtest.m4 serial 4 (gettext-0.14.2)
> +-dnl Copyright (C) 1996-2003, 2005 Free Software Foundation, Inc.
> ++# progtest.m4 serial 6 (gettext-0.18)
> ++dnl Copyright (C) 1996-2003, 2005, 2008-2010 Free Software Foundation, =
Inc.
> + dnl This file is free software; the Free Software Foundation
> + dnl gives unlimited permission to copy and/or distribute it,
> + dnl with or without modifications, as long as this notice is preserved.
> +@@ -16,7 +16,7 @@ dnl They are *not* in the public domain.
> + dnl Authors:
> + dnl =A0 Ulrich Drepper <drepper@cygnus.com>, 1996.
> +
> +-AC_PREREQ(2.50)
> ++AC_PREREQ([2.50])
> +
> + # Search path for a program which passes the given test.
> +
> +@@ -55,7 +55,7 @@ rm -f conf$$.file
> + # Extract the first word of "$2", so it can be a program name with args=
.
> + set dummy $2; ac_word=3D[$]2
> + AC_MSG_CHECKING([for $ac_word])
> +-AC_CACHE_VAL(ac_cv_path_$1,
> ++AC_CACHE_VAL([ac_cv_path_$1],
> + [case "[$]$1" in
> + =A0 [[\\/]]* | ?:[[\\/]]*)
> + =A0 =A0 ac_cv_path_$1=3D"[$]$1" # Let the user override the test with a=
 path.
> +@@ -84,9 +84,9 @@ ifelse([$4], , , [ =A0test -z "[$]ac_cv_pa
> + esac])dnl
> + $1=3D"$ac_cv_path_$1"
> + if test ifelse([$4], , [-n "[$]$1"], ["[$]$1" !=3D "$4"]); then
> +- =A0AC_MSG_RESULT([$]$1)
> ++ =A0AC_MSG_RESULT([$][$1])
> + else
> +- =A0AC_MSG_RESULT(no)
> ++ =A0AC_MSG_RESULT([no])
> + fi
> +-AC_SUBST($1)dnl
> ++AC_SUBST([$1])dnl
> + ])
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/c=
onfigure.ac gstreamer-0.10.28/configure.ac
> +--- gstreamer-0.10.28.org/configure.ac 2010-03-08 14:52:43.000000000 -08=
00
> ++++ gstreamer-0.10.28/configure.ac =A0 =A0 2010-05-22 08:37:17.873785452=
 -0700
> +@@ -63,7 +63,7 @@ AC_SUBST(ACLOCAL_AMFLAGS, "-I common/m4
> +
> + dnl set up gettext
> + dnl the version check needs to stay here because autopoint greps for it
> +-AM_GNU_GETTEXT_VERSION([0.17])
> ++AM_GNU_GETTEXT_VERSION([0.18])
> + AM_GNU_GETTEXT([external])
> + AG_GST_GETTEXT([gstreamer-$GST_MAJORMINOR])
> +
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/g=
st-element-check-0.10.m4 gstreamer-0.10.28/gst-element-check-0.10.m4
> +--- gstreamer-0.10.28.org/gst-element-check-0.10.m4 =A0 =A01969-12-31 16=
:00:00.000000000 -0800
> ++++ gstreamer-0.10.28/gst-element-check-0.10.m4 =A0 =A0 =A0 =A02010-05-2=
2 08:38:27.301286153 -0700
> +@@ -0,0 +1,23 @@
> ++dnl Perform a check for a GStreamer element using gst-inspect
> ++dnl Thomas Vander Stichele <thomas at apestaart dot org>
> ++dnl Last modification: 25/01/2005
> ++
> ++dnl AM_GST_ELEMENT_CHECK(ELEMENT-NAME, ACTION-IF-FOUND, ACTION-IF-NOT-F=
OUND)
> ++
> ++AC_DEFUN([AM_GST_ELEMENT_CHECK],
> ++[
> ++ =A0if test "x$GST_INSPECT" =3D=3D "x"; then
> ++ =A0 =A0AC_CHECK_PROG(GST_INSPECT, gst-inspect-0.10, gst-inspect-0.10, =
[])
> ++ =A0fi
> ++
> ++ =A0if test "x$GST_INSPECT" !=3D "x"; then
> ++ =A0 =A0AC_MSG_CHECKING(GStreamer 0.10 element $1)
> ++ =A0 =A0if [ $GST_INSPECT $1 > /dev/null 2> /dev/null ]; then
> ++ =A0 =A0 =A0AC_MSG_RESULT(found.)
> ++ =A0 =A0 =A0$2
> ++ =A0 =A0else
> ++ =A0 =A0 =A0AC_MSG_RESULT(not found.)
> ++ =A0 =A0 =A0$3
> ++ =A0 =A0fi
> ++ =A0fi
> ++])
> +Binary files gstreamer-0.10.28.org/libs/gst/check/.libs/libgstcheck-0.10=
.a and gstreamer-0.10.28/libs/gst/check/.libs/libgstcheck-0.10.a differ
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/p=
o/ChangeLog gstreamer-0.10.28/po/ChangeLog
> +--- gstreamer-0.10.28.org/po/ChangeLog 1969-12-31 16:00:00.000000000 -08=
00
> ++++ gstreamer-0.10.28/po/ChangeLog =A0 =A0 2010-05-22 08:37:16.941476173=
 -0700
> +@@ -0,0 +1,5 @@
> ++2010-05-22 =A0gettextize =A0<bug-gnu-gettext@gnu.org>
> ++
> ++ =A0 =A0 =A0* Makefile.in.in: Upgrade to gettext-0.18.
> ++ =A0 =A0 =A0* Rules-quot: Upgrade to gettext-0.18.
> ++
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/p=
o/Makefile.in.in gstreamer-0.10.28/po/Makefile.in.in
> +--- gstreamer-0.10.28.org/po/Makefile.in.in =A0 =A02010-03-08 13:31:23.0=
00000000 -0800
> ++++ gstreamer-0.10.28/po/Makefile.in.in =A0 =A0 =A0 =A02010-05-22 08:37:=
16.801299560 -0700
> +@@ -1,5 +1,5 @@
> + # Makefile for PO directory in any package using GNU gettext.
> +-# Copyright (C) 1995-1997, 2000-2007 by Ulrich Drepper <drepper@gnu.ai.=
mit.edu>
> ++# Copyright (C) 1995-1997, 2000-2007, 2009-2010 by Ulrich Drepper <drep=
per@gnu.ai.mit.edu>
> + #
> + # This file can be copied and used freely without restrictions. =A0It c=
an
> + # be used in projects which are not available under the GNU General Pub=
lic
> +@@ -8,16 +8,13 @@
> + # Please note that the actual code of GNU gettext is covered by the GNU
> + # General Public License and is *not* in the public domain.
> + #
> +-# Origin: gettext-0.17
> +-GETTEXT_MACRO_VERSION =3D 0.17
> ++# Origin: gettext-0.18
> ++GETTEXT_MACRO_VERSION =3D 0.18
> +
> + PACKAGE =3D @PACKAGE@
> + VERSION =3D @VERSION@
> + PACKAGE_BUGREPORT =3D @PACKAGE_BUGREPORT@
> +
> +-# thomas: add GETTEXT_PACKAGE substitution as used in Makevars
> +-GETTEXT_PACKAGE =3D @GETTEXT_PACKAGE@
> +-
> + SHELL =3D /bin/sh
> + @SET_MAKE@
> +
> +@@ -91,8 +88,8 @@ CATALOGS =3D @CATALOGS@
> + .po.gmo:
> + =A0 =A0 =A0 @lang=3D`echo $* | sed -e 's,.*/,,'`; \
> + =A0 =A0 =A0 test "$(srcdir)" =3D . && cdcmd=3D"" || cdcmd=3D"cd $(srcdi=
r) && "; \
> +- =A0 =A0 =A0echo "$${cdcmd}rm -f $${lang}.gmo && $(GMSGFMT) -c --statis=
tics -o $${lang}.gmo $${lang}.po"; \
> +- =A0 =A0 =A0cd $(srcdir) && rm -f $${lang}.gmo && $(GMSGFMT) -c --stati=
stics -o t-$${lang}.gmo $${lang}.po && mv t-$${lang}.gmo $${lang}.gmo
> ++ =A0 =A0 =A0echo "$${cdcmd}rm -f $${lang}.gmo && $(GMSGFMT) -c --statis=
tics --verbose -o $${lang}.gmo $${lang}.po"; \
> ++ =A0 =A0 =A0cd $(srcdir) && rm -f $${lang}.gmo && $(GMSGFMT) -c --stati=
stics --verbose -o t-$${lang}.gmo $${lang}.po && mv t-$${lang}.gmo $${lang}=
.gmo
> +
> + .sin.sed:
> + =A0 =A0 =A0 sed -e '/^#/d' $< > t-$@
> +@@ -196,8 +193,15 @@ $(POFILES): $(srcdir)/$(DOMAIN).pot
> + =A0 =A0 =A0 @lang=3D`echo $@ | sed -e 's,.*/,,' -e 's/\.po$$//'`; \
> + =A0 =A0 =A0 if test -f "$(srcdir)/$${lang}.po"; then \
> + =A0 =A0 =A0 =A0 test "$(srcdir)" =3D . && cdcmd=3D"" || cdcmd=3D"cd $(s=
rcdir) && "; \
> +- =A0 =A0 =A0 =A0echo "$${cdcmd}$(MSGMERGE_UPDATE) $${lang}.po $(DOMAIN)=
.pot"; \
> +- =A0 =A0 =A0 =A0cd $(srcdir) && $(MSGMERGE_UPDATE) $${lang}.po $(DOMAIN=
).pot; \
> ++ =A0 =A0 =A0 =A0echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) -=
-lang=3D$${lang} $${lang}.po $(DOMAIN).pot"; \
> ++ =A0 =A0 =A0 =A0cd $(srcdir) \
> ++ =A0 =A0 =A0 =A0 =A0&& { case `$(MSGMERGE_UPDATE) --version | sed 1q | =
sed -e 's,^[^0-9]*,,'` in \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | =
0.1[0-7].*) \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(MSGMERGE_UPDATE) $(MSGMERGE_OPTI=
ONS) $${lang}.po $(DOMAIN).pot;; \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *) \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(MSGMERGE_UPDATE) $(MSGMERGE_OPTI=
ONS) --lang=3D$${lang} $${lang}.po $(DOMAIN).pot;; \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 esac; \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 }; \
> + =A0 =A0 =A0 else \
> + =A0 =A0 =A0 =A0 $(MAKE) $${lang}.po-create; \
> + =A0 =A0 =A0 fi
> +@@ -220,7 +224,6 @@ install-data: install-data-@USE_NLS@
> + =A0 =A0 =A0 fi
> + install-data-no: all
> + install-data-yes: all
> +- =A0 =A0 =A0$(mkdir_p) $(DESTDIR)$(datadir)
> + =A0 =A0 =A0 @catalogs=3D'$(CATALOGS)'; \
> + =A0 =A0 =A0 for cat in $$catalogs; do \
> + =A0 =A0 =A0 =A0 cat=3D`basename $$cat`; \
> +@@ -272,7 +275,6 @@ installdirs-data: installdirs-data-@USE_
> + =A0 =A0 =A0 fi
> + installdirs-data-no:
> + installdirs-data-yes:
> +- =A0 =A0 =A0$(mkdir_p) $(DESTDIR)$(datadir)
> + =A0 =A0 =A0 @catalogs=3D'$(CATALOGS)'; \
> + =A0 =A0 =A0 for cat in $$catalogs; do \
> + =A0 =A0 =A0 =A0 cat=3D`basename $$cat`; \
> +@@ -398,9 +400,15 @@ update-po: Makefile
> + =A0 =A0 =A0 tmpdir=3D`pwd`; \
> + =A0 =A0 =A0 echo "$$lang:"; \
> + =A0 =A0 =A0 test "$(srcdir)" =3D . && cdcmd=3D"" || cdcmd=3D"cd $(srcdi=
r) && "; \
> +- =A0 =A0 =A0echo "$${cdcmd}$(MSGMERGE) $$lang.po $(DOMAIN).pot -o $$lan=
g.new.po"; \
> ++ =A0 =A0 =A0echo "$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=3D$$l=
ang $$lang.po $(DOMAIN).pot -o $$lang.new.po"; \
> + =A0 =A0 =A0 cd $(srcdir); \
> +- =A0 =A0 =A0if $(MSGMERGE) $$lang.po $(DOMAIN).pot -o $$tmpdir/$$lang.n=
ew.po; then \
> ++ =A0 =A0 =A0if { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-=
9]*,,'` in \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7]=
.*) \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(MSGMERGE) $(MSGMERGE_OPTIONS) -o $$tmpdi=
r/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 *) \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=3D$=
$lang -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
> ++ =A0 =A0 =A0 =A0 =A0 esac; \
> ++ =A0 =A0 =A0 =A0 }; then \
> + =A0 =A0 =A0 =A0 if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1=
; then \
> + =A0 =A0 =A0 =A0 =A0 rm -f $$tmpdir/$$lang.new.po; \
> + =A0 =A0 =A0 =A0 else \
> +@@ -421,9 +429,13 @@ $(DUMMYPOFILES):
> + update-gmo: Makefile $(GMOFILES)
> + =A0 =A0 =A0 @:
> +
> ++# Recreate Makefile by invoking config.status. Explicitly invoke the sh=
ell,
> ++# because execution permission bits may not work on the current file sy=
stem.
> ++# Use @SHELL@, which is the shell determined by autoconf for the use by=
 its
> ++# scripts, not $(SHELL) which is hardwired to /bin/sh and may be defici=
ent.
> + Makefile: Makefile.in.in Makevars $(top_builddir)/config.status @POMAKE=
FILEDEPS@
> + =A0 =A0 =A0 cd $(top_builddir) \
> +- =A0 =A0 =A0 =A0&& $(SHELL) ./config.status $(subdir)/$@.in po-director=
ies
> ++ =A0 =A0 =A0 =A0&& @SHELL@ ./config.status $(subdir)/$@.in po-directori=
es
> +
> + force:
> +
> +diff -Nurp -x '*.o' -x '*.gmo' -x '*.po' -x '*~' gstreamer-0.10.28.org/p=
o/Rules-quot gstreamer-0.10.28/po/Rules-quot
> +--- gstreamer-0.10.28.org/po/Rules-quot =A0 =A0 =A0 =A02010-03-08 08:58:=
17.000000000 -0800
> ++++ gstreamer-0.10.28/po/Rules-quot =A0 =A02010-05-22 08:37:16.941476173=
 -0700
> +@@ -20,7 +20,7 @@ en@boldquot.po-update: en@boldquot.po-up
> + =A0 =A0 =A0 ll=3D`echo $$lang | sed -e 's/@.*//'`; \
> + =A0 =A0 =A0 LC_ALL=3DC; export LC_ALL; \
> + =A0 =A0 =A0 cd $(srcdir); \
> +- =A0 =A0 =A0if $(MSGINIT) -i $(DOMAIN).pot --no-translator -l $$ll -o -=
 2>/dev/null | sed -f $$tmpdir/$$lang.insert-header | $(MSGCONV) -t UTF-8 |=
 $(MSGFILTER) sed -f `echo $$lang | sed -e 's/.*@//'`.sed 2>/dev/null > $$t=
mpdir/$$lang.new.po; then \
> ++ =A0 =A0 =A0if $(MSGINIT) -i $(DOMAIN).pot --no-translator -l $$lang -o=
 - 2>/dev/null | sed -f $$tmpdir/$$lang.insert-header | $(MSGCONV) -t UTF-8=
 | $(MSGFILTER) sed -f `echo $$lang | sed -e 's/.*@//'`.sed 2>/dev/null > $=
$tmpdir/$$lang.new.po; then \
> + =A0 =A0 =A0 =A0 if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1=
; then \
> + =A0 =A0 =A0 =A0 =A0 rm -f $$tmpdir/$$lang.new.po; \
> + =A0 =A0 =A0 =A0 else \
> +--- gstreamer-0.10.28.org/ChangeLog =A0 =A02010-03-08 14:54:29.000000000=
 -0800
> ++++ gstreamer-0.10.28/ChangeLog =A0 =A0 =A0 =A02010-05-22 09:06:29.86381=
3510 -0700
> +@@ -1,3 +1,15 @@
> ++2010-05-22 =A0Khem Raj =A0<raj.khem@gmail.com>
> ++
> ++ =A0 =A0 =A0* common/m4/gettext.m4: Upgrade to gettext-0.18.
> ++ =A0 =A0 =A0* common/m4/iconv.m4: Upgrade to gettext-0.18.
> ++ =A0 =A0 =A0* common/m4/lib-ld.m4: Upgrade to gettext-0.18.
> ++ =A0 =A0 =A0* common/m4/lib-link.m4: Upgrade to gettext-0.18.
> ++ =A0 =A0 =A0* common/m4/lib-prefix.m4: Upgrade to gettext-0.18.
> ++ =A0 =A0 =A0* common/m4/nls.m4: Upgrade to gettext-0.18.
> ++ =A0 =A0 =A0* common/m4/po.m4: Upgrade to gettext-0.18.
> ++ =A0 =A0 =A0* common/m4/progtest.m4: Upgrade to gettext-0.18.
> ++ =A0 =A0 =A0* configure.ac (AM_GNU_GETTEXT_VERSION): Bump to 0.18.
> ++
> + =3D=3D=3D release 0.10.28 =3D=3D=3D
> +
> + 2010-03-08 =A0Tim-Philipp M=FCller <tim.muller@collabora.co.uk>
> diff --git a/recipes/gstreamer/gstreamer_0.10.28.bb b/recipes/gstreamer/g=
streamer_0.10.28.bb
> index c44646c..ababa47 100644
> --- a/recipes/gstreamer/gstreamer_0.10.28.bb
> +++ b/recipes/gstreamer/gstreamer_0.10.28.bb
> @@ -1,5 +1,10 @@
> =A0require gstreamer.inc
>
> +PR =3D "r1"
> +
> +SRC_URI +=3D "file://use-gettext-0.18.patch \
> + =A0 =A0 =A0 =A0 =A0 "
> +
> =A0SRC_URI[archive.md5sum] =3D "1c7accac718fe211ff91323c27d4ae02"
> =A0SRC_URI[archive.sha256sum] =3D "61613ec7574d22230e8cc893f91b66faec6b21=
288a22d2f21c9d9eeb7667eb2c"
>
> --
> 1.7.0.4
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


