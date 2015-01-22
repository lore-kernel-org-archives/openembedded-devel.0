Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7BFAA72C16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 15:13:17 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id r20so4051958wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 07:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mt/lxepvFpRfjHh4CzfvkXZqFvbajeD0VrZKEWSjJL0=;
	b=RgQquc11Tlg8y+XX9qMGPCZotGm3IV1wtdlb4nLJxVMEKkdK8JubPeHlyq/H8ZdJT5
	PYLWO7BaseIU/gjrdZEP59FutMlWFKCnTvPkrtJ0zD5RbHXG7Faen1NyPTYWQvkufJx1
	RueyOniGofGVPa78GnmKDcymoh2WHRZNDEkOlSILpnG/4NyyPaHlkHVXu8+yVM3rqezM
	w5JTfj2cU02IjHlPnV4mg9Uva2o+wXGcK7M28/tN1te2w9ow8BWILD2ihh+dqlIF/GHh
	ukC90SkGFuyxLll93IEczttO4Ty+N90AuyWaHAnZ9rIVfhaTDTBTunByej8ZvkVX937U
	kSbg==
X-Received: by 10.194.61.231 with SMTP id t7mr3767171wjr.33.1421939597347;
	Thu, 22 Jan 2015 07:13:17 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	k3sm4328670wje.30.2015.01.22.07.13.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 07:13:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Jan 2015 16:13:22 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150122151322.GA2456@jama>
References: <1421772046-14566-1-git-send-email-henning@itconsulting-heinold.de>
	<1421772046-14566-2-git-send-email-henning@itconsulting-heinold.de>
MIME-Version: 1.0
In-Reply-To: <1421772046-14566-2-git-send-email-henning@itconsulting-heinold.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libspatialite: Upgrade to version 4.2.0
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
X-List-Received-Date: Thu, 22 Jan 2015 15:13:19 -0000
X-Groupsio-MsgNum: 53927
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2015 at 05:40:46PM +0100, Henning Heinold wrote:
> From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
>=20
> Package the new sqlite3 plugin into a new package and skip
> the dev-so qa issue. Add some extra depends that are now used
> by the library.
>=20
> The patch was adapted for meta-openembedded by Henning Heinold, setting
> the upstream status for the geos-config.patch
>=20
> Signed-off-by: Henning Heinold <henning@itconsulting-heinold.de>
> ---
>  .../libspatialite-4.2.0/geos-config.patch          |  17 ++
>  .../libspatialite/libspatialite.inc                |   7 +-
>  .../fix-the-configure-script-and-freexl.patch      | 200 ---------------=
------
>  .../libspatialite/libspatialite_3.0.1.bb           |   9 -
>  .../libspatialite/libspatialite_4.2.0.bb           |   8 +

Please fold .inc into .bb and drop PR and INC_PR.

>  5 files changed, 31 insertions(+), 210 deletions(-)
>  create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialit=
e-4.2.0/geos-config.patch
>  delete mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialit=
e/fix-the-configure-script-and-freexl.patch
>  delete mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialit=
e_3.0.1.bb
>  create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialit=
e_4.2.0.bb
>=20
> diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite-4.2.0=
/geos-config.patch b/meta-oe/recipes-navigation/libspatialite/libspatialite=
-4.2.0/geos-config.patch
> new file mode 100644
> index 0000000..28bd7da
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/libspatialite/libspatialite-4.2.0/geos-c=
onfig.patch
> @@ -0,0 +1,17 @@
> +https://www.gaia-gis.it/fossil/libspatialite/tktview?name=3Dabeeaad448
> +
> +Upstream-Status: Submitted [rpm5-devel@rpm5.org]
> +
> +Index: libspatialite-4.2.0/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libspatialite-4.2.0.orig/configure.ac
> ++++ libspatialite-4.2.0/configure.ac
> +@@ -260,7 +260,7 @@ if test x"$enable_geos" !=3D "xno"; then
> +   fi
> +   # Extract the linker and include flags
> +   GEOS_LDFLAGS=3D`$GEOSCONFIG --ldflags`
> +-  GEOS_CFLAGS=3D-I`$GEOSCONFIG --includes`
> ++  GEOS_CFLAGS=3D`$GEOSCONFIG --cflags`
> +   AC_SUBST([GEOS_LDFLAGS])
> +   AC_SUBST([GEOS_CFLAGS])=09
> +   # Ensure that we can parse geos_c.h
> diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite.inc b=
/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
> index b5c3879..fa397b6 100644
> --- a/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
> +++ b/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "Library extending the SQLite core to support fully fled=
ged Spatial SQL capabilities"
>  HOMEPAGE =3D "https://www.gaia-gis.it/fossil/libspatialite/"
>  SECTION =3D "libs"
> -DEPENDS =3D "proj geos sqlite3"
> +DEPENDS =3D "proj geos sqlite3 libxml2 zlib"
> =20
>  INC_PR =3D "r0"
> =20
> @@ -14,3 +14,8 @@ inherit autotools pkgconfig
> =20
>  EXTRA_OECONF =3D "--enable-freexl=3Dno"
> =20
> +
> +# A plugins for SQLite3
> +PACKAGES +=3D "${PN}-plugin"
> +INSANE_SKIP_${PN}-plugin =3D "dev-so"
> +FILES_${PN}-plugin +=3D "${libdir}/mod_*"
> diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/fix-t=
he-configure-script-and-freexl.patch b/meta-oe/recipes-navigation/libspatia=
lite/libspatialite/fix-the-configure-script-and-freexl.patch
> deleted file mode 100644
> index 0cd0c3f..0000000
> --- a/meta-oe/recipes-navigation/libspatialite/libspatialite/fix-the-conf=
igure-script-and-freexl.patch
> +++ /dev/null
> @@ -1,200 +0,0 @@
> -From upstream fossil repo, extracted via git, dropping configure.ac for =
amalgamation
> -
> -From: sandro <sandro>
> -Date: Sat, 21 Jan 2012 16:53:28 +0000
> -Subject: [PATCH] fixing the ./configure script: --enable-geocallbacks=3D=
no is
> - the new default and fixing some flaws for
> - --enable-freexl=3Dno
> -
> ----
> - configure                   |   20 ++++++++++----------
> - configure.ac                |   20 ++++++++++----------
> - src/shapefiles/shapefiles.c |    2 ++
> - 4 files changed, 32 insertions(+), 30 deletions(-)
> -
> -diff --git a/configure b/configure
> -index e8cf620..917bfca 100755
> ---- a/configure
> -+++ b/configure
> -@@ -1410,7 +1410,7 @@ Optional Features:
> -                           optimize for fast installation [default=3Dyes]
> -   --disable-libtool-lock  avoid locking (might break parallel builds)
> -   --enable-mathsql        enables SQL math functions [default=3Dyes]
> --  --enable-geocallbacks   enables geometry callbacks [default=3Dyes]
> -+  --enable-geocallbacks   enables geometry callbacks [default=3Dno]
> -   --enable-proj           enables PROJ.4 inclusion [default=3Dyes]
> -   --enable-geos           enables GEOS inclusion [default=3Dyes]
> -   --enable-geosadvanced   enables GEOS advanced features [default=3Dyes]
> -@@ -16980,7 +16980,7 @@ ac_config_files=3D"$ac_config_files Makefile src=
/Makefile src/headers/Makefile src
> - if test "${enable_mathsql+set}" =3D set; then :
> -   enableval=3D$enable_mathsql;
> - else
> --  mathsql=3Dyes
> -+  enable_mathsql=3Dyes
> - fi
> -=20
> - if test x"$enable_mathsql" !=3D "xno"; then
> -@@ -16998,10 +16998,10 @@ fi
> - if test "${enable_geocallbacks+set}" =3D set; then :
> -   enableval=3D$enable_geocallbacks;
> - else
> --  geocallbacks=3Dyes
> -+  enable_geocallbacks=3Dno
> - fi
> -=20
> --if test x"$enable_geocallbacks" !=3D "xno"; then
> -+if test x"$enable_geocallbacks" =3D=3D "xyes"; then
> -   OMIT_GEOCALLBACKS_FLAGS=3D
> -   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sqlite3_rtree_g=
eometry_callback in -lsqlite3" >&5
> - $as_echo_n "checking for sqlite3_rtree_geometry_callback in -lsqlite3..=
=2E " >&6; }
> -@@ -17063,7 +17063,7 @@ fi
> - if test "${enable_proj+set}" =3D set; then :
> -   enableval=3D$enable_proj;
> - else
> --  proj=3Dyes
> -+  enable_proj=3Dyes
> - fi
> -=20
> - if test x"$enable_proj" !=3D "xno"; then
> -@@ -17153,7 +17153,7 @@ fi
> - if test "${enable_geos+set}" =3D set; then :
> -   enableval=3D$enable_geos;
> - else
> --  geos=3Dyes
> -+  enable_geos=3Dyes
> - fi
> -=20
> - if test x"$enable_geos" !=3D "xno"; then
> -@@ -17237,7 +17237,7 @@ fi
> - if test "${enable_geosadvanced+set}" =3D set; then :
> -   enableval=3D$enable_geosadvanced;
> - else
> --  geosadvanced=3Dyes
> -+  enable_geosadvanced=3Dyes
> - fi
> -=20
> -   if test x"$enable_geosadvanced" !=3D "xno"; then
> -@@ -17316,7 +17316,7 @@ fi
> - if test "${enable_iconv+set}" =3D set; then :
> -   enableval=3D$enable_iconv;
> - else
> --  geos=3Dyes
> -+  enable_iconv=3Dyes
> - fi
> -=20
> - if test x"$enable_iconv" !=3D "xno"; then
> -@@ -17579,7 +17579,7 @@ fi
> - if test "${enable_freexl+set}" =3D set; then :
> -   enableval=3D$enable_freexl;
> - else
> --  proj=3Dyes
> -+  enable_freexl=3Dyes
> - fi
> -=20
> - if test x"$enable_freexl" !=3D "xno"; then
> -@@ -17669,7 +17669,7 @@ fi
> - if test "${enable_epsg+set}" =3D set; then :
> -   enableval=3D$enable_epsg;
> - else
> --  epsg=3Dyes
> -+  enable_epsg=3Dyes
> - fi
> -=20
> - if test x"$enable_epsg" !=3D "xno"; then
> -diff --git a/configure.ac b/configure.ac
> -index 216cc9f..69cb6c5 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -79,7 +79,7 @@ AC_CONFIG_FILES([Makefile \
> - #
> - AC_ARG_ENABLE(mathsql, [AS_HELP_STRING(
> -   [--enable-mathsql], [enables SQL math functions [default=3Dyes]])],
> --  [], [mathsql=3Dyes])
> -+  [], [enable_mathsql=3Dyes])
> - if test x"$enable_mathsql" !=3D "xno"; then
> -   OMIT_MATHSQL_FLAGS=3D
> - else
> -@@ -92,9 +92,9 @@ AC_SUBST(OMIT_MATHSQL_FLAGS)
> - #   --enable-geocallbacks
> - #
> - AC_ARG_ENABLE(geocallbacks, [AS_HELP_STRING(
> --  [--enable-geocallbacks], [enables geometry callbacks [default=3Dyes]]=
)],
> --  [], [geocallbacks=3Dyes])
> --if test x"$enable_geocallbacks" !=3D "xno"; then
> -+  [--enable-geocallbacks], [enables geometry callbacks [default=3Dno]])=
],
> -+  [], [enable_geocallbacks=3Dno])
> -+if test x"$enable_geocallbacks" =3D=3D "xyes"; then
> -   OMIT_GEOCALLBACKS_FLAGS=3D
> -   AC_CHECK_LIB(sqlite3,sqlite3_rtree_geometry_callback,,AC_MSG_ERROR([o=
bsolete 'libsqlite3' (< v.3.7.3). please retry specifying: --disable-geocal=
lbacks]),-lm)
> - else
> -@@ -108,7 +108,7 @@ AC_SUBST(OMIT_GEOCALLBACKS_FLAGS)
> - #
> - AC_ARG_ENABLE(proj, [AS_HELP_STRING(
> -   [--enable-proj], [enables PROJ.4 inclusion [default=3Dyes]])],
> --  [], [proj=3Dyes])
> -+  [], [enable_proj=3Dyes])
> - if test x"$enable_proj" !=3D "xno"; then
> -   OMIT_PROJ_FLAGS=3D
> -   AC_CHECK_HEADERS(proj_api.h,, [AC_MSG_ERROR([cannot find proj_api.h, =
bailing out])])
> -@@ -124,7 +124,7 @@ AC_SUBST(OMIT_PROJ_FLAGS)
> - #
> - AC_ARG_ENABLE(geos, [AS_HELP_STRING(
> -   [--enable-geos], [enables GEOS inclusion [default=3Dyes]])],
> --  [], [geos=3Dyes])
> -+  [], [enable_geos=3Dyes])
> - if test x"$enable_geos" !=3D "xno"; then
> -   OMIT_GEOS_FLAGS=3D
> -   AC_CHECK_HEADERS(geos_c.h,, [AC_MSG_ERROR([cannot find geos_c.h, bail=
ing out])])
> -@@ -134,7 +134,7 @@ if test x"$enable_geos" !=3D "xno"; then
> -   #
> -   AC_ARG_ENABLE(geosadvanced, [AS_HELP_STRING(
> - 	  [--enable-geosadvanced], [enables GEOS advanced features [default=3D=
yes]])],
> --	  [], [geosadvanced=3Dyes])
> -+	  [], [enable_geosadvanced=3Dyes])
> -   if test x"$enable_geosadvanced" !=3D "xno"; then
> - 	  GEOSADVANCED_FLAGS=3D-DGEOS_ADVANCED
> - 	  AC_SEARCH_LIBS(GEOSCoveredBy,geos_c,,AC_MSG_ERROR([obsolete 'libgeos=
_c' (< v.3.3.0). please retry specifying: --disable-geosadvanced.]),-lm -lg=
eos)
> -@@ -152,7 +152,7 @@ AC_SUBST(OMIT_GEOS_FLAGS)
> - #
> - AC_ARG_ENABLE(iconv, [AS_HELP_STRING(
> -   [--enable-iconv], [enables ICONV inclusion [default=3Dyes]])],
> --  [], [geos=3Dyes])
> -+  [], [enable_iconv=3Dyes])
> - if test x"$enable_iconv" !=3D "xno"; then
> -   OMIT_ICONV_FLAGS=3D
> -   AC_CHECK_HEADERS(iconv.h,, [AC_MSG_ERROR([cannot find iconv.h, bailin=
g out])])
> -@@ -172,7 +172,7 @@ AC_SUBST(OMIT_ICONV_FLAGS)
> - #
> - AC_ARG_ENABLE(freexl, [AS_HELP_STRING(
> -   [--enable-freexl], [enables FreeXL inclusion [default=3Dyes]])],
> --  [], [proj=3Dyes])
> -+  [], [enable_freexl=3Dyes])
> - if test x"$enable_freexl" !=3D "xno"; then
> -   OMIT_FREEXL_FLAGS=3D
> -   AC_CHECK_HEADERS(freexl.h,, [AC_MSG_ERROR([cannot find freexl.h, bail=
ing out])])
> -@@ -188,7 +188,7 @@ AC_SUBST(OMIT_FREEXL_FLAGS)
> - #
> - AC_ARG_ENABLE(epsg, [AS_HELP_STRING(
> -   [--enable-epsg], [enables full EPSG dataset support [default=3Dyes]])=
],
> --  [], [epsg=3Dyes])
> -+  [], [enable_epsg=3Dyes])
> - if test x"$enable_epsg" !=3D "xno"; then
> -   OMIT_EPSG_FLAGS=3D
> - else
> -diff --git a/src/shapefiles/shapefiles.c b/src/shapefiles/shapefiles.c
> -index 4bf5fd0..09e3cd3 100644
> ---- a/src/shapefiles/shapefiles.c
> -+++ b/src/shapefiles/shapefiles.c
> -@@ -62,7 +62,9 @@ the terms of any one of the MPL, the GPL or the LGPL.
> - #include <spatialite/gaiageo.h>
> - #include <spatialite.h>
> -=20
> -+#ifndef OMIT_FREEXL
> - #include <freexl.h>
> -+#endif
> -=20
> - #if defined(_WIN32) && !defined(__MINGW32__)
> - #define strcasecmp	_stricmp
> ---=20
> -1.7.9.1
> -
> diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite_3.0.1=
=2Ebb b/meta-oe/recipes-navigation/libspatialite/libspatialite_3.0.1.bb
> deleted file mode 100644
> index 1cb72e8..0000000
> --- a/meta-oe/recipes-navigation/libspatialite/libspatialite_3.0.1.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require libspatialite.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[md5sum] =3D "450d1a0d9da1bd9f770b7db3f2509f69"
> -SRC_URI[sha256sum] =3D "4983d6584069fd5ff0cfcccccee1015088dab2db177c0dc7=
050ce8306b68f8e6"
> -
> -SRC_URI =3D+ "file://fix-the-configure-script-and-freexl.patch"
> -
> diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0=
=2Ebb b/meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb
> new file mode 100644
> index 0000000..74a77e8
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb
> @@ -0,0 +1,8 @@
> +require libspatialite.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "83305ed694a77152120d1f74c5151779"
> +SRC_URI[sha256sum] =3D "9f138a6854740c7827fdee53845eb1485fce3e805a7aa9fc=
9151f8046ebd312d"
> +
> +SRC_URI +=3D "file://geos-config.patch"
> --=20
> 1.9.1
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTBE5IACgkQN1Ujt2V2gBxWvACeKTomui4hm9nOYp4HrexGYfSQ
ktIAn0Qn/AmEVUjItVSIvOio0oioDYvx
=g7mm
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
