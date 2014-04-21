Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id CA1B065D10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 11:32:31 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so3629155eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=maGEinMDPu8b5t3WZqHMS/ZYlX/WnQvBc+fd9tTDrOI=;
	b=J050m2Vdtygt3uJ0/ghlJfcqr5wlPtPejH3q319NXU284Y6MCO/+tkHd4SJRUSsCSH
	6b6mfP86Uj7PnclzOdXAVOskj1Rk9CkoYZ+P+eH0To1OjRMR0XxyJuzuJKEmnEBLazlR
	8Kb08Qby1I0TqGgZkTMWywIrfK4y5ahQ2OrYDVYW2Yu/B0VmZuOc67usCFMAiRWVJ7UA
	24hGhheg54rE03aWDzBY6E7BMRQcGdxIiYQTB98GyGQFXL8oO5/q6SxQ6k7yo8vgcLn7
	RWHwGUCrW/5bvsW41ktcDRbyzkieKky4EY85oX61KpJwiDb/2KUfl66qhCTjUgI5nZxg
	fBpg==
X-Received: by 10.14.104.135 with SMTP id i7mr46857422eeg.34.1398079951885;
	Mon, 21 Apr 2014 04:32:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m42sm102821777eex.21.2014.04.21.04.32.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 04:32:31 -0700 (PDT)
Date: Mon, 21 Apr 2014 13:32:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140421113237.GY2486@jama>
References: <1397897879-31925-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397897879-31925-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] gnome-themes: enables the path to the icon-name-mapping to be specified
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
X-List-Received-Date: Mon, 21 Apr 2014 11:32:32 -0000
X-Groupsio-MsgNum: 49391
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9teSV9pdwBI9hpI9"
Content-Disposition: inline

--9teSV9pdwBI9hpI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2014 at 04:57:59AM -0400, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Ported a patch from sato-icon-theme which enables the path to the
> icon-name-mapping tool to be specified to fix the build failure:
> configure: error: icon-naming-utils >=3D 0.8.7 is required to build and i=
nstall gnome-themes

Merged, thanks

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../themes/gnome-themes/iconpath-option.patch      |   52 ++++++++++++++=
++++++
>  .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |   10 ++--
>  2 files changed, 56 insertions(+), 6 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/themes/gnome-themes/iconpath=
-option.patch
>=20
> diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option=
=2Epatch b/meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.pat=
ch
> new file mode 100644
> index 0000000..1b4096d
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/themes/gnome-themes/iconpath-option.patch
> @@ -0,0 +1,52 @@
> +
> +The patch is ported from sato-icon-theme.
> +
> +pkg-config will only search the target sysroot and we want the native sc=
ript. This=20
> +patch adds an option to allow the path to the tool to be specified.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + configure.in |   26 ++++++++++++++++----------
> + 1 file changed, 16 insertions(+), 10 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 5f7a18c..e8fc31e 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -74,16 +74,22 @@ AC_ARG_ENABLE([icon-mapping],
> + ICONMAP=3D"true"
> + if test "x$enable_mapping" !=3D "xno"; then
> +    UTILS_REQUIRED=3D0.8.7
> +-
> +-   AC_MSG_CHECKING([icon-naming-utils >=3D $UTILS_REQUIRED])
> +-   PKG_CHECK_EXISTS(icon-naming-utils >=3D $UTILS_REQUIRED, have_utils=
=3Dyes, have_utils=3Dno)
> +-   if test "x$have_utils" =3D "xyes"; then
> +-      UTILS_PATH=3D"`$PKG_CONFIG --variable=3Dprogram_path icon-naming-=
utils`"
> +-      ICONMAP=3D"$UTILS_PATH/icon-name-mapping"
> +-      AC_MSG_RESULT([yes])
> +-   else
> +-	AC_MSG_RESULT([no])
> +-   	AC_MSG_ERROR([icon-naming-utils >=3D $UTILS_REQUIRED is required to=
 build and install gnome-themes])
> ++   PKG_PROG_PKG_CONFIG()
> ++   AC_ARG_WITH(iconmap,
> ++   	    AC_HELP_STRING([--with-iconmap=3D<dir>], [The location of the i=
con-name-mapping script to use]),
> ++   	    ICONMAP=3D$withval, ICONMAP=3D"")
> ++   if test "x$ICONMAP" =3D "x"; then
> ++      AC_MSG_CHECKING([icon-naming-utils >=3D $UTILS_REQUIRED])
> ++      PKG_CHECK_EXISTS(icon-naming-utils >=3D $UTILS_REQUIRED, have_uti=
ls=3Dyes, have_utils=3Dno)
> ++      if test "x$have_utils" =3D "xyes"; then
> ++         UTILS_PATH=3D"`$PKG_CONFIG --variable=3Dprogram_path icon-nami=
ng-utils`"
> ++         ICONMAP=3D"$UTILS_PATH/icon-name-mapping"
> ++
> ++         AC_MSG_RESULT([yes])
> ++      else
> ++         AC_MSG_RESULT([no])
> ++         AC_MSG_ERROR([icon-naming-utils >=3D $UTILS_REQUIRED is requir=
ed to build and install gnome-themes"])
> ++      fi
> +    fi
> + fi
> + AC_SUBST(ICONMAP)
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/met=
a-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
> index 864c953..6226e7c 100644
> --- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
> +++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
> @@ -8,14 +8,12 @@ SECTION =3D "x11/gnome"
>  DEPENDS =3D "gtk-engines icon-naming-utils icon-naming-utils-native glib=
-2.0 intltool-native libxml-simple-perl-native"
>  RDEPENDS_${PN} =3D "gnome-icon-theme"
> =20
> -EXTRA_OECONF +=3D "--enable-all-themes --disable-hicolor-check"
> +EXTRA_OECONF +=3D "--enable-all-themes --disable-hicolor-check \
> +    --with-iconmap=3D${STAGING_LIBDIR_NATIVE}/icon-naming-utils/icon-nam=
e-mapping \
> +"
> =20
>  inherit gnome perlnative
> =20
> -do_configure_prepend() {
> -    sed -i -e 's:`$PKG_CONFIG --variable=3Dprogram_path icon-naming-util=
s`:${STAGING_DIR_NATIVE}${libdir}/icon-naming-utils:g' configure.in
> -}
> -
>  PACKAGES =3D+ " gnome-theme-crux gnome-theme-highcontrast gnome-theme-hi=
ghcontrastinverse gnome-theme-highcontrastlargeprint gnome-theme-highcontra=
stlargeprintinverse gnome-theme-largeprint gnome-theme-mist"
>  FILES_gnome-theme-crux =3D "${datadir}/themes/Crux ${datadir}/icons/Crux"
>  FILES_gnome-theme-highcontrast =3D "${datadir}/themes/HighContrast ${dat=
adir}/icons/HighContrast"
> @@ -27,6 +25,6 @@ FILES_gnome-theme-mist =3D "${datadir}/themes/Mist ${da=
tadir}/icons/Mist"
> =20
>  FILES_${PN} +=3D "${datadir}/themes ${datadir}/icons"
> =20
> +SRC_URI +=3D "file://iconpath-option.patch"=20
>  SRC_URI[archive.md5sum] =3D "41db9e3cb25d35af2675c599e67944d1"
>  SRC_URI[archive.sha256sum] =3D "8601ee24c2e096593221cbd6ebdb6686042225a0=
3c02a01c0d67c163f9febd1a"
> -
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9teSV9pdwBI9hpI9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNVAdUACgkQN1Ujt2V2gBybqgCfbyOGh0bz1buHt6PZvVeYatC2
oLsAn3W8EI9r3ZfstAucSyI/ULIxqYT9
=0g6L
-----END PGP SIGNATURE-----

--9teSV9pdwBI9hpI9--
