Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1F03276A33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:46:26 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so49112972wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 05:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7jcrqCL7xBv54rnQLgiCTsqbg1zG6hPSzY/VAh9+9+8=;
	b=eGw6dO9b0XyJy+vfaC8yRjaj6JbtYILyJnpkJRPq8oFBlb1hAFQswHKaSZ9WLyXgPy
	IXO3wVF65tYluh7sD7h0sYMzGQts5ZqX0teJXLHwiJJmROkaSazuYioHxUXUX8Atmwot
	+fqhGBjNw2mJi9uDqpynSsa0lIlTJxFWJHV9fxuwNSv5RJGaSUI2tst/B1jRviYPuDAF
	Wj5NVOl+M65FtBVhjX4eltFDS8uGAX2nCBJScSeiLS2cqMPIkXdpiwd3hIT2xsVuOALb
	44bsMB7LFEDzkTRfk2GFLGRQfJYiMkcfs6/YfA2eww/Dw4nbOJkcrJSSV81mQmf+O9JD
	Q/vA==
X-Received: by 10.180.23.66 with SMTP id k2mr29081335wif.85.1440420386819;
	Mon, 24 Aug 2015 05:46:26 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fn8sm16077602wib.2.2015.08.24.05.46.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 05:46:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Aug 2015 14:46:28 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150824124628.GF2446@jama>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
	<805439ad0b3909810c1eb60a9d9b568062e160d4.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
In-Reply-To: <805439ad0b3909810c1eb60a9d9b568062e160d4.1440407387.git.samuli.piippo@theqtcompany.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 07/11] qttools: use one recipe for all compilations
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
X-List-Received-Date: Mon, 24 Aug 2015 12:46:27 -0000
X-Groupsio-MsgNum: 56947
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oPmsXEqKQNHCSXW7"
Content-Disposition: inline

--oPmsXEqKQNHCSXW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2015 at 12:13:53PM +0300, Samuli Piippo wrote:
> Instead of separate recipes for target, native and nativesdk, use
> one recipe with BBCLASSEXTEND in place.
>=20
> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
> ---
>  recipes-qt/qt5/nativesdk-qttools_git.bb | 45 ---------------------------=
------
>  recipes-qt/qt5/qttools-native_git.bb    | 26 -------------------
>  recipes-qt/qt5/qttools_git.bb           |  9 ++++++-
>  3 files changed, 8 insertions(+), 72 deletions(-)
>  delete mode 100644 recipes-qt/qt5/nativesdk-qttools_git.bb
>  delete mode 100644 recipes-qt/qt5/qttools-native_git.bb
>=20
> diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nat=
ivesdk-qttools_git.bb
> deleted file mode 100644
> index 73e5d22..0000000
> --- a/recipes-qt/qt5/nativesdk-qttools_git.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
> -LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dd87ae0d200af76dca730d911474cbe5b \
> -    file://LICENSE.LGPLv3;md5=3Dffcfac38a32c9ebdb8ff768fa1702478 \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> -    file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -"
> -
> -QT_MODULE =3D "qttools"
> -
> -DEPENDS =3D "nativesdk-qtbase qtbase-native"
> -
> -require nativesdk-qt5.inc
> -require qt5-git.inc
> -
> -# it's already included with newer oe-core, but include it here for dylan
> -FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qttools:"
> -
> -SRC_URI +=3D "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.=
patch"
> -
> -PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
> -
> -FILES_${PN}-dbg =3D " \
> -    ${OE_QMAKE_PATH_BINS}/.debug \
> -"
> -
> -FILES_${PN} =3D " \
> -    ${OE_QMAKE_PATH_BINS}/* \
> -"
> -
> -do_configure() {
> -    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=3Dlinguis=
tonly
> -}
> -
> -do_install() {
> -    # Fix install paths for all
> -    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR=
_HOST},(INSTALL_ROOT),g"
> -
> -    oe_runmake install INSTALL_ROOT=3D${D}
> -
> -    # remove things unused in nativesdk
> -    rm -rf ${D}${libdir}
> -}
> -
> -SRCREV =3D "a6ed9b418d1b4464f088b378e5bdb96ec420db6c"
> diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttool=
s-native_git.bb
> deleted file mode 100644
> index 13e1b79..0000000
> --- a/recipes-qt/qt5/qttools-native_git.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -DEPENDS =3D "qtbase-native"
> -
> -LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | =
LGPL-3.0)"
> -LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE.LGPLv21;md5=3Dd87ae0d200af76dca730d911474cbe5b \
> -    file://LICENSE.LGPLv3;md5=3Dffcfac38a32c9ebdb8ff768fa1702478 \
> -    file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
> -    file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> -"
> -
> -QT_MODULE =3D "qttools"
> -
> -require qt5-native.inc
> -require qt5-git.inc
> -
> -SRC_URI +=3D "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.=
patch"
> -
> -do_configure() {
> -    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=3Dlinguis=
tonly
> -}
> -
> -do_install() {
> -    oe_runmake install INSTALL_ROOT=3D${D}
> -}
> -
> -SRCREV =3D "a6ed9b418d1b4464f088b378e5bdb96ec420db6c"
> diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
> index e27d6ef..51690ac 100644
> --- a/recipes-qt/qt5/qttools_git.bb
> +++ b/recipes-qt/qt5/qttools_git.bb
> @@ -9,9 +9,11 @@ LIC_FILES_CHKSUM =3D " \
>      file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
>  "
> =20
> -DEPENDS +=3D "qtbase qtdeclarative qtxmlpatterns"
> +DEPENDS +=3D "qtbase"
> +DEPENDS_class-target =3D "qtdeclarative qtxmlpatterns"
> =20
>  SRC_URI +=3D " \
> +    file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch \
>      file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
>      file://0003-add-noqtwebkit-configuration.patch \
>  "
> @@ -24,4 +26,9 @@ PACKAGECONFIG[qtwebkit] =3D ",,qtwebkit"
> =20
>  EXTRA_QMAKEVARS_PRE +=3D "${@base_contains('PACKAGECONFIG', 'qtwebkit', =
'', 'CONFIG+=3Dnoqtwebkit', d)}"
> =20
> +EXTRA_QMAKEVARS_PRE_class-native +=3D "CONFIG+=3Dlinguistonly"
> +EXTRA_QMAKEVARS_PRE_class-nativesdk +=3D "CONFIG+=3Dlinguistonly"

Use PACKAGECONFIG to restrict native and nativesdk builds to
linguistonly.

> +
>  SRCREV =3D "a6ed9b418d1b4464f088b378e5bdb96ec420db6c"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oPmsXEqKQNHCSXW7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXbEiMACgkQN1Ujt2V2gBw6SgCgnmhCGs2Ux8Hr4iZEcx/LLOSM
riQAoLHeWzC008XjTXtVJI+XQVVbq995
=G6HT
-----END PGP SIGNATURE-----

--oPmsXEqKQNHCSXW7--
