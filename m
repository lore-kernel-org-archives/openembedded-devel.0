Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0DBAE6CBA4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 00:47:34 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so13343eei.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 17:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/vMAOR0Pc0Chwaqa/xrZ48s59JwNod9cILWqugdQ+Pg=;
	b=L1Upuf6qCdnWzreWSHrVJjQsWj0XhDgxgaAEdyWxCE09dV6x8bX9/CALPpRdkgY2g9
	0+yIzdymowYBufICqsJDTtQF0ZcqGsxBegJrit6PerJaACr1LRwkaUxm0Ya5bZw9XOIE
	hlQQ5LIvcHGRLtIdprUppOxVXmA51Jk9dl1FjOnDh/lXyJZDPjOsyX9hd1qLxm7grvzY
	vQtdsgXDWsw8xbd1LJGZ7IrBYZvsnoUBAnXwAq2DGmcM7daz9w0/rM813X/D4evuiqk3
	L+qG28F3qbVoG8Rq/l79uuqQunScw2vLQVV0KhEcqPrXpBqsayuVG/qHpSRadnlq81my
	mG+g==
X-Received: by 10.15.26.72 with SMTP id m48mr20148eeu.154.1381884456359;
	Tue, 15 Oct 2013 17:47:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm172850596eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 17:47:35 -0700 (PDT)
Date: Wed, 16 Oct 2013 02:47:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131016004738.GI3703@jama>
References: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
	<1381653835-32079-4-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1381653835-32079-4-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 4/6] libmikmod: Upgrade libmikmod_3.2.0.bb -> libmikmod_3.3.2.bb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Oct 2013 00:47:35 -0000
X-Groupsio-MsgNum: 46746
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r4QXMf6/kyF/FvJJ"
Content-Disposition: inline

--r4QXMf6/kyF/FvJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2013 at 01:43:53AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../mikmod/libmikmod/autofoo.patch                 |  16 --
>  .../mikmod/libmikmod/ldflags.patch                 |  12 --
>  .../recipes-multimedia/mikmod/libmikmod/m4.patch   | 197 ---------------=
------
>  .../libmikmod/obsolete_automake_macros.patch       |  15 --
>  .../{libmikmod_3.2.0.bb =3D> libmikmod_3.3.2.bb}     |   9 +-
>  5 files changed, 2 insertions(+), 247 deletions(-)
>  delete mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/autofoo.p=
atch
>  delete mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.p=
atch
>  delete mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/m4.patch
>  delete mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_=
automake_macros.patch
>  rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.2.0.bb =3D> libmik=
mod_3.3.2.bb} (68%)
>=20
> diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/autofoo.patch b/=
meta-oe/recipes-multimedia/mikmod/libmikmod/autofoo.patch
> deleted file mode 100644
> index 22d8170..0000000
> --- a/meta-oe/recipes-multimedia/mikmod/libmikmod/autofoo.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -
> -#
> -# Patch managed by http://www.holgerschurig.de/patcher.html
> -#
> -
> ---- libmikmod-3.2.0-beta2/configure.in~autofoo
> -+++ libmikmod-3.2.0-beta2/configure.in
> -@@ -415,8 +415,6 @@
> -=20
> - AC_CHECK_FUNCS(setenv snprintf srandom)
> - AC_REPLACE_FUNCS(strcasecmp strdup strstr)
> --# Change extension, as we use libtool
> --LIBOBJS=3D"`echo $LIBOBJS|sed -e 's/\.o/\.lo/g'`"
> -=20
> - AC_HEADER_EGREP(srandom,math.h,AC_DEFINE(SRANDOM_IN_MATH_H))
> -=20
> diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch b/=
meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch
> deleted file mode 100644
> index de31139..0000000
> --- a/meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff -urN libmikmod-3.1.12.orig/libmikmod/Makefile.in libmikmod-3.1.12/l=
ibmikmod/Makefile.in
> ---- libmikmod-3.1.12.orig/libmikmod/Makefile.in	2004-01-21 17:43:52.0000=
00000 +0000
> -+++ libmikmod-3.1.12/libmikmod/Makefile.in	2009-04-02 11:28:01.000000000=
 +0000
> -@@ -72,7 +72,7 @@
> - 	rm -f Makefile
> -=20
> - $(LIB): $(OBJ)
> --	$(LIBTOOL) --mode=3Dlink $(CC) -version-info 3:0:0 -o $@ $(OBJ) $(LIBR=
ARY_LIB) -rpath $(DESTDIR)$(libdir)
> -+	$(LIBTOOL) --mode=3Dlink $(CC) $(LDFLAGS) -version-info 3:0:0 -o $@ $(=
OBJ) $(LIBRARY_LIB) -rpath $(DESTDIR)$(libdir)
> -=20
> - dl_hpux.lo:	$(top_srcdir)/dlapi/dl_hpux.c \
> - 			$(top_srcdir)/dlapi/dlfcn.h
> diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/m4.patch b/meta-=
oe/recipes-multimedia/mikmod/libmikmod/m4.patch
> deleted file mode 100644
> index ac7f2d7..0000000
> --- a/meta-oe/recipes-multimedia/mikmod/libmikmod/m4.patch
> +++ /dev/null
> @@ -1,197 +0,0 @@
> ---- /dev/null
> -+++ libmikmod-3.2.0-beta2/m4/esd.m4
> -@@ -0,0 +1,194 @@
> -+# Configure paths for ESD
> -+# Manish Singh    98-9-30
> -+# stolen back from Frank Belew
> -+# stolen from Manish Singh
> -+# Shamelessly stolen from Owen Taylor
> -+
> -+dnl AM_PATH_ESD([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOU=
ND]]])
> -+dnl Test for ESD, and define ESD_CFLAGS and ESD_LIBS
> -+dnl
> -+AC_DEFUN(AM_PATH_ESD,
> -+[dnl=20
> -+dnl Get the cflags and libraries from the esd-config script
> -+dnl
> -+AC_ARG_WITH(esd-prefix,[  --with-esd-prefix=3DPFX   Prefix where ESD is=
 installed (optional)],
> -+            esd_prefix=3D"$withval", esd_prefix=3D"")
> -+AC_ARG_WITH(esd-exec-prefix,[  --with-esd-exec-prefix=3DPFX Exec prefix=
 where ESD is installed (optional)],
> -+            esd_exec_prefix=3D"$withval", esd_exec_prefix=3D"")
> -+AC_ARG_ENABLE(esdtest, [  --disable-esdtest       Do not try to compile=
 and run a test ESD program],
> -+		    , enable_esdtest=3Dyes)
> -+
> -+  if test x$esd_exec_prefix !=3D x ; then
> -+     esd_args=3D"$esd_args --exec-prefix=3D$esd_exec_prefix"
> -+     if test x${ESD_CONFIG+set} !=3D xset ; then
> -+        ESD_CONFIG=3D$esd_exec_prefix/bin/esd-config
> -+     fi
> -+  fi
> -+  if test x$esd_prefix !=3D x ; then
> -+     esd_args=3D"$esd_args --prefix=3D$esd_prefix"
> -+     if test x${ESD_CONFIG+set} !=3D xset ; then
> -+        ESD_CONFIG=3D$esd_prefix/bin/esd-config
> -+     fi
> -+  fi
> -+
> -+  AC_PATH_PROG(ESD_CONFIG, esd-config, no)
> -+  min_esd_version=3Difelse([$1], ,0.2.7,$1)
> -+  AC_MSG_CHECKING(for ESD - version >=3D $min_esd_version)
> -+  no_esd=3D""
> -+  if test "$ESD_CONFIG" =3D "no" ; then
> -+    no_esd=3Dyes
> -+  else
> -+    AC_LANG_SAVE
> -+    AC_LANG_C
> -+    ESD_CFLAGS=3D`$ESD_CONFIG $esdconf_args --cflags`
> -+    ESD_LIBS=3D`$ESD_CONFIG $esdconf_args --libs`
> -+
> -+    esd_major_version=3D`$ESD_CONFIG $esd_args --version | \
> -+           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
> -+    esd_minor_version=3D`$ESD_CONFIG $esd_args --version | \
> -+           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
> -+    esd_micro_version=3D`$ESD_CONFIG $esd_config_args --version | \
> -+           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
> -+    if test "x$enable_esdtest" =3D "xyes" ; then
> -+      ac_save_CFLAGS=3D"$CFLAGS"
> -+      ac_save_LIBS=3D"$LIBS"
> -+      CFLAGS=3D"$CFLAGS $ESD_CFLAGS"
> -+      LIBS=3D"$LIBS $ESD_LIBS"
> -+dnl
> -+dnl Now check if the installed ESD is sufficiently new. (Also sanity
> -+dnl checks the results of esd-config to some extent
> -+dnl
> -+      rm -f conf.esdtest
> -+      AC_TRY_RUN([
> -+#include <stdio.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+#include <esd.h>
> -+
> -+char*
> -+my_strdup (char *str)
> -+{
> -+  char *new_str;
> -+ =20
> -+  if (str)
> -+    {
> -+      new_str =3D malloc ((strlen (str) + 1) * sizeof(char));
> -+      strcpy (new_str, str);
> -+    }
> -+  else
> -+    new_str =3D NULL;
> -+ =20
> -+  return new_str;
> -+}
> -+
> -+int main ()
> -+{
> -+  int major, minor, micro;
> -+  char *tmp_version;
> -+
> -+  system ("touch conf.esdtest");
> -+
> -+  /* HP/UX 9 (%@#!) writes to sscanf strings */
> -+  tmp_version =3D my_strdup("$min_esd_version");
> -+  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) !=3D 3) {
> -+     printf("%s, bad version string\n", "$min_esd_version");
> -+     exit(1);
> -+   }
> -+
> -+   if (($esd_major_version > major) ||
> -+      (($esd_major_version =3D=3D major) && ($esd_minor_version > minor=
)) ||
> -+      (($esd_major_version =3D=3D major) && ($esd_minor_version =3D=3D =
minor) && ($esd_micro_version >=3D micro)))
> -+    {
> -+      return 0;
> -+    }
> -+  else
> -+    {
> -+      printf("\n*** 'esd-config --version' returned %d.%d.%d, but the m=
inimum version\n", $esd_major_version, $esd_minor_version, $esd_micro_versi=
on);
> -+      printf("*** of ESD required is %d.%d.%d. If esd-config is correct=
, then it is\n", major, minor, micro);
> -+      printf("*** best to upgrade to the required version.\n");
> -+      printf("*** If esd-config was wrong, set the environment variable=
 ESD_CONFIG\n");
> -+      printf("*** to point to the correct copy of esd-config, and remov=
e the file\n");
> -+      printf("*** config.cache before re-running configure\n");
> -+      return 1;
> -+    }
> -+}
> -+
> -+],, no_esd=3Dyes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
> -+       CFLAGS=3D"$ac_save_CFLAGS"
> -+       LIBS=3D"$ac_save_LIBS"
> -+       AC_LANG_RESTORE
> -+     fi
> -+  fi
> -+  if test "x$no_esd" =3D x ; then
> -+     AC_MSG_RESULT(yes)
> -+     ifelse([$2], , :, [$2])    =20
> -+  else
> -+     AC_MSG_RESULT(no)
> -+     if test "$ESD_CONFIG" =3D "no" ; then
> -+       echo "*** The esd-config script installed by ESD could not be fo=
und"
> -+       echo "*** If ESD was installed in PREFIX, make sure PREFIX/bin i=
s in"
> -+       echo "*** your path, or set the ESD_CONFIG environment variable =
to the"
> -+       echo "*** full path to esd-config."
> -+     else
> -+       if test -f conf.esdtest ; then
> -+        :
> -+       else
> -+          echo "*** Could not run ESD test program, checking why..."
> -+          CFLAGS=3D"$CFLAGS $ESD_CFLAGS"
> -+          LIBS=3D"$LIBS $ESD_LIBS"
> -+          AC_LANG_SAVE
> -+          AC_LANG_C
> -+          AC_TRY_LINK([
> -+#include <stdio.h>
> -+#include <esd.h>
> -+],      [ return 0; ],
> -+        [ echo "*** The test program compiled, but did not run. This us=
ually means"
> -+          echo "*** that the run-time linker is not finding ESD or find=
ing the wrong"
> -+          echo "*** version of ESD. If it is not finding ESD, you'll ne=
ed to set your"
> -+          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/=
ld.so.conf to point"
> -+          echo "*** to the installed location  Also, make sure you have=
 run ldconfig if that"
> -+          echo "*** is required on your system"
> -+	  echo "***"
> -+          echo "*** If you have an old version installed, it is best to=
 remove it, although"
> -+          echo "*** you may also be able to get things to work by modif=
ying LD_LIBRARY_PATH"],
> -+        [ echo "*** The test program failed to compile or link. See the=
 file config.log for the"
> -+          echo "*** exact error that occured. This usually means ESD wa=
s incorrectly installed"
> -+          echo "*** or that you have moved ESD since it was installed. =
In the latter case, you"
> -+          echo "*** may want to edit the esd-config script: $ESD_CONFIG=
" ])
> -+          CFLAGS=3D"$ac_save_CFLAGS"
> -+          LIBS=3D"$ac_save_LIBS"
> -+          AC_LANG_RESTORE
> -+       fi
> -+     fi
> -+     ESD_CFLAGS=3D""
> -+     ESD_LIBS=3D""
> -+     ifelse([$3], , :, [$3])
> -+  fi
> -+  AC_SUBST(ESD_CFLAGS)
> -+  AC_SUBST(ESD_LIBS)
> -+  rm -f conf.esdtest
> -+])
> -+
> -+dnl AM_ESD_SUPPORTS_MULTIPLE_RECORD([ACTION-IF-SUPPORTS [, ACTION-IF-NO=
T-SUPPORTS]])
> -+dnl Test, whether esd supports multiple recording clients (version >=3D=
0.2.21)
> -+dnl
> -+AC_DEFUN(AM_ESD_SUPPORTS_MULTIPLE_RECORD,
> -+[dnl
> -+  AC_MSG_NOTICE([whether installed esd version supports multiple record=
ing clients])
> -+  ac_save_ESD_CFLAGS=3D"$ESD_CFLAGS"
> -+  ac_save_ESD_LIBS=3D"$ESD_LIBS"
> -+  AM_PATH_ESD(0.2.21,
> -+    ifelse([$1], , [
> -+      AM_CONDITIONAL(ESD_SUPPORTS_MULTIPLE_RECORD, true)
> -+      AC_DEFINE(ESD_SUPPORTS_MULTIPLE_RECORD, 1,
> -+	[Define if you have esound with support of multiple recording clients.=
])],
> -+    [$1]),
> -+    ifelse([$2], , [AM_CONDITIONAL(ESD_SUPPORTS_MULTIPLE_RECORD, false)=
], [$2])
> -+    if test "x$ac_save_ESD_CFLAGS" !=3D x ; then
> -+       ESD_CFLAGS=3D"$ac_save_ESD_CFLAGS"
> -+    fi
> -+    if test "x$ac_save_ESD_LIBS" !=3D x ; then
> -+       ESD_LIBS=3D"$ac_save_ESD_LIBS"
> -+    fi
> -+  )
> -+])
> diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_automak=
e_macros.patch b/meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_autom=
ake_macros.patch
> deleted file mode 100644
> index 082bb04..0000000
> --- a/meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_automake_macro=
s.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Submitted (https://sourceforge.net/tracker/?func=3Ddeta=
il&aid=3D3599281&group_id=3D40531&atid=3D428227)
> -
> -Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> -diff -Nurd libmikmod-3.1.12/configure.in libmikmod-3.1.12/configure.in
> ---- libmikmod-3.1.12/configure.in	2007-12-15 11:22:57.000000000 +0200
> -+++ libmikmod-3.1.12/configure.in	2013-01-03 07:26:10.662775603 +0200
> -@@ -13,7 +13,7 @@
> - LIBMIKMOD_VERSION=3D$LIBMIKMOD_MAJOR_VERSION.$LIBMIKMOD_MINOR_VERSION.$=
LIBMIKMOD_MICRO_VERSION$BETA
> -
> - AM_INIT_AUTOMAKE(libmikmod,$LIBMIKMOD_VERSION)
> --AM_CONFIG_HEADER(config.h)
> -+AC_CONFIG_HEADERS(config.h)
> - AM_MAINTAINER_MODE
> -
> - # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.2.0.bb b/meta-=
oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
> similarity index 68%
> rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.2.0.bb
> rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
> index b1ebf97..4ab293f 100644
> --- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.2.0.bb
> +++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
> @@ -7,14 +7,9 @@ DEPENDS =3D "alsa-lib texinfo"
> =20
>  SRC_URI =3D "\
>      http://mikmod.shlomifish.org/files/${P}.tar.gz \
> -    file://m4.patch \
> -    file://autofoo.patch \
> -    file://ldflags.patch \
> -    file://obsolete_automake_macros.patch \
>  "
> -
> -SRC_URI[md5sum] =3D "96e9820d72a41fe27ff304071739696c"
> -SRC_URI[sha256sum] =3D "734c8490bbf9b0c587920b92414dcfa3c2267838a0cdf698=
d5f1fb6bba8f661e"
> +SRC_URI[md5sum] =3D "60ac77a804d082230df3009af11ef44f"
> +SRC_URI[sha256sum] =3D "2311b209255bf24e95161907a16778cb054ac6d447fd8d05=
f1f0e41a555c7580"

It looks like 3.3.2 archive was removed today and there is only 3.3.3.

Old is still available on proper SF mirror:
http://sourceforge.net/projects/mikmod/files/libmikmod/3.3.2/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--r4QXMf6/kyF/FvJJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJd4ioACgkQN1Ujt2V2gBxYRACfUKtaZvjzGWPrMVCM5wzlPMLi
OB8AnimWWaUuaQNKOITnFV2+Se0f/v/S
=MtnQ
-----END PGP SIGNATURE-----

--r4QXMf6/kyF/FvJJ--
