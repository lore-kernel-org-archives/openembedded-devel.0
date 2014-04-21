Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5DAA665D3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 11:34:07 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so3555543eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 04:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7wBvFOoDmWgBwrGL45luTsAY8BzQAqCE/FtHyMJcnaA=;
	b=gnMKhgT2e+YCwdwHQm2nteOq9wVGY9FkxghKFpZ8NFfhQGgmInA9W4T579aiFLyqvH
	J3udtfPCxltudc8rKPhhrFuuTgjgQx/l0LOp9RkKQBxKyU9fK4U/YBvx95gFl5AwJbB+
	gM4iZ2ISlozsUWv/gUDbPuxYHkjXr3TxE4M37XFI1FLxG28eSFCMCg4kWIStCvg4dCeO
	eNamJvAH+qatgfn0Dw6Gzs70+T9EwylgWk6MiHiNwK2AeX2cl4ElEAwxaCEdT8Z9LQTb
	BJvNdkBqyp0pkL+Xj3bxMCOcxMz6OwzlIezk6+TXLYaeLRdiCdo/SgazC/GY8WutLD64
	vEkQ==
X-Received: by 10.14.7.65 with SMTP id 41mr342032eeo.100.1398080048760;
	Mon, 21 Apr 2014 04:34:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p8sm102835433eef.26.2014.04.21.04.34.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 04:34:07 -0700 (PDT)
Date: Mon, 21 Apr 2014 13:34:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140421113406.GA2486@jama>
References: <1396226657-23603-1-git-send-email-ticotimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1396226657-23603-1-git-send-email-ticotimo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] gnuplot: upgrade to 4.6.5
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
X-List-Received-Date: Mon, 21 Apr 2014 11:34:08 -0000
X-Groupsio-MsgNum: 49393
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="otRuG/a1bzWynmKC"
Content-Disposition: inline

--otRuG/a1bzWynmKC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2014 at 05:44:17PM -0700, Tim Orling wrote:
> From: Tim Orling <TicoTimo@gmail.com>
>=20
> * automake patch from 4.4.4 is no longer needed
> * PACKAGECONFIG for lua (lua term is only useful for LaTeX)
> * linking problems with dlopen, etc. in lua loadlibs.c fixed
>   ** this same problem was seen in jansa world builds for 4.4.4
>   ** I am not able to replicate that error on 4.4.4

Merged, thanks

>=20
> NOTE: qt is supported by this version, but I was not able to
> figure out the configuration...
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  .../gnuplot/gnuplot-4.4.4/automake-1.12.x.patch    | 44 ----------------=
------
>  .../lua-loadlibs-configure-in-fix.patch            | 16 ++++++++
>  .../{gnuplot-4.4.4 =3D> gnuplot-4.6.5}/subdirs.patch |  0
>  meta-oe/recipes-extended/gnuplot/gnuplot.inc       |  1 +
>  .../gnuplot/{gnuplot_4.4.4.bb =3D> gnuplot_4.6.5.bb} |  8 ++--
>  5 files changed, 20 insertions(+), 49 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automa=
ke-1.12.x.patch
>  create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-lo=
adlibs-configure-in-fix.patch
>  rename meta-oe/recipes-extended/gnuplot/{gnuplot-4.4.4 =3D> gnuplot-4.6.=
5}/subdirs.patch (100%)
>  rename meta-oe/recipes-extended/gnuplot/{gnuplot_4.4.4.bb =3D> gnuplot_4=
=2E6.5.bb} (66%)
>=20
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automake-1.12=
=2Ex.patch b/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automake-1.12.x=
=2Epatch
> deleted file mode 100644
> index 51f703c..0000000
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automake-1.12.x.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -Upstream-Status: Backport
> -
> -It's fixed in 4.6 and 4.7(HEAD)
> -
> -http://sourceforge.net/tracker/?func=3Ddetail&aid=3D3523591&group_id=3D2=
055&atid=3D102055
> -
> -diff -uNr gnuplot-4.4.4.orig/Makefile.am gnuplot-4.4.4/Makefile.am
> ---- gnuplot-4.4.4.orig/Makefile.am	2012-07-20 10:54:49.075828905 +0200
> -+++ gnuplot-4.4.4/Makefile.am	2012-07-20 10:55:22.380831313 +0200
> -@@ -1,5 +1,5 @@
> - ## Process this file with automake to produce Makefile.in -*-Makefile-*-
> --AUTOMAKE_OPTIONS =3D foreign 1.2h
> -+AUTOMAKE_OPTIONS =3D foreign
> -=20
> - SUBDIRS =3D config m4 term src  $(LISPDIR) man share
> -=20
> -diff -uNr gnuplot-4.4.4.orig/configure.in gnuplot-4.4.4/configure.in
> ---- gnuplot-4.4.4.orig/configure.in	2011-09-02 06:09:40.000000000 +0200
> -+++ gnuplot-4.4.4/configure.in	2012-07-20 10:55:53.289833224 +0200
> -@@ -16,10 +16,11 @@
> - dnl configure.in body
> -=20
> - dnl Compiler characteristics
> --dnl Check for ANSI C prototypes, the const and inline keywords,
> --dnl and ANSI style stringification
> -+dnl Check for the const and inline keywords and ANSI style stringificat=
ion
> -+dnl automake 1.12 dropped support for AM_C_PROTOTYPES and ansi2knr
> -+dnl But our code still tests for #ifdef PROTOTYPES, so define it here
> -+AC_DEFINE(PROTOTYPES,1,[Automake 1.12 dropped support for building with=
out prototypes])
> - AC_PROG_CC
> --AM_C_PROTOTYPES
> - AC_PROG_CPP
> - AC_C_CONST
> - AC_C_INLINE
> -diff -uNr gnuplot-4.4.4.orig/src/Makefile.am gnuplot-4.4.4/src/Makefile.=
am
> ---- gnuplot-4.4.4.orig/src/Makefile.am	2010-10-06 06:53:16.000000000 +02=
00
> -+++ gnuplot-4.4.4/src/Makefile.am	2012-07-20 10:56:02.376834548 +0200
> -@@ -1,5 +1,5 @@
> - ## Process this file with automake to produce Makefile.in -*-Makefile-*-
> --AUTOMAKE_OPTIONS =3D ansi2knr foreign 1.2h
> -+AUTOMAKE_OPTIONS =3D foreign
> -=20
> - # in the spirit of automake ...
> - pkglibexecdir =3D $(libexecdir)/@PACKAGE@/@VERSION_MAJOR@
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-=
configure-in-fix.patch b/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua=
-loadlibs-configure-in-fix.patch
> new file mode 100644
> index 0000000..23f2cd2
> --- /dev/null
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-configu=
re-in-fix.patch
> @@ -0,0 +1,16 @@
> +Index: gnuplot-4.6.5/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnuplot-4.6.5.orig/configure.in
> ++++ gnuplot-4.6.5/configure.in
> +@@ -690,6 +690,11 @@ if test "${with_lua}" =3D yes ; then
> +   fi
> +=20
> +   if test "$with_lua" !=3D no; then
> ++    dnl check for dlopen/dl to fix loadlibs link failure
> ++    AC_CHECK_FUNC([dlopen], [],
> ++      AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS=3D"-ldl"))
> ++    AC_SUBST(DLOPEN_LIBS)
> ++    LUA_LIBS=3D"$LUA_LIBS $DLOPEN_LIBS"
> +     TERMLIBS=3D"$TERMLIBS $LUA_LIBS"
> +     CPPFLAGS=3D"$CPPFLAGS $LUA_CFLAGS"
> +   else
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/subdirs.patch=
 b/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
> similarity index 100%
> rename from meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/subdirs.patch
> rename to meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc b/meta-oe/recip=
es-extended/gnuplot/gnuplot.inc
> index 96d6ee2..ab3ec3f 100644
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
> @@ -12,6 +12,7 @@ acpaths =3D ""
> =20
>  PACKAGECONFIG ??=3D "cairo"
>  PACKAGECONFIG[cairo] =3D "--with-cairo,--without-cairo,cairo pango"
> +PACKAGECONFIG[lua] =3D "--with-lua,--without-lua,lua"
> =20
>  EXTRA_OECONF =3D "--with-readline=3D${STAGING_LIBDIR}/.. \
>                  --without-lisp-files \
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb b/meta-oe/=
recipes-extended/gnuplot/gnuplot_4.6.5.bb
> similarity index 66%
> rename from meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb
> rename to meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
> index 4ea312f..8a5bca9 100644
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
> @@ -1,16 +1,14 @@
>  require gnuplot.inc
> =20
> -PR =3D "r1"
> -
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/gnuplot/${PN}-${PV}.tar.gz;name=3Darc=
hive \
>      http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=3Dqtplot=
 \
>      file://subdirs.patch \
> +    file://lua-loadlibs-configure-in-fix.patch \
>      file://gnuplot.desktop \
>      file://gnuplot.png \
> -    file://automake-1.12.x.patch \
>  "
> =20
> -SRC_URI[archive.md5sum] =3D "97a43328e81e57ebed7f135ca0c07e82"
> -SRC_URI[archive.sha256sum] =3D "d228599d08d5f87bcb79af8af8bb432c77d94280=
2b1643f920c7baaeaf1ddbfd"
> +SRC_URI[archive.md5sum] =3D "9a476b21f74bd99c876f1509d731a0f9"
> +SRC_URI[archive.sha256sum] =3D "e550f030c7d04570e89c3d4e3f6e822968165084=
19c86ab46c4dd73156519a2d"
>  SRC_URI[qtplot.md5sum] =3D "0a481885a496092c77eb4017540b5cf6"
>  SRC_URI[qtplot.sha256sum] =3D "6df317183ff62cc82f3dcf88207a267cd6478cb51=
47f55d7530c94f1ad5f4132"
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--otRuG/a1bzWynmKC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNVAi4ACgkQN1Ujt2V2gBzg0QCcDDzu9AFW8CyUXxLEvjRJlTIL
Po0AnjPHYGSP6UqQQ17Dz+TXzwOv02Z1
=MdDO
-----END PGP SIGNATURE-----

--otRuG/a1bzWynmKC--
