Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 10A5B77115
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 22:54:12 +0000 (UTC)
Received: by wmec75 with SMTP id c75so125666382wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 14:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TL9r4RBqk/MKimMv/3/ECxWEfFd/U9rqfZ6Ofmc77hk=;
	b=bjYNWLFQHBsEh+XicrsOL7mk6UCwGpFruUZ6myA8/ysUuFfSovARgoA5Q/PDvxpYo2
	6wOuxgiYx49JlFqv7WlPW8IDwbFxKFIHtru0nHh17ofuzhtnQocowUWy/qUEXGCFykaD
	THnFTd9ieOQVNk+rKp4z8n30K1tYqH+3zKuDEuu1j9edD9SxInm0bPGnSaiA8tnqmKq4
	sSgvdSn6cIege9IaBOd3dx6MczYpEBz58r/f7M39wTJ0gYpkjBdOswRY1VQmC1hPVoQ9
	QqQaHBqx3J5dghA7EYnIiayFbjWl4Hxd7oRDzhhtN0GbCtjkTCe3ggw/Yq/H4DjAPkBq
	rooQ==
X-Received: by 10.28.18.66 with SMTP id 63mr30748541wms.77.1446677651730;
	Wed, 04 Nov 2015 14:54:11 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id m7sm514525wma.16.2015.11.04.14.54.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 14:54:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Nov 2015 23:54:22 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151104225422.GB2556@jama>
References: <1446658209-27822-1-git-send-email-schnitzeltony@googlemail.com>
	<1446658209-27822-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1446658209-27822-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH 2/2] qtbase: align target qmake paths
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
X-List-Received-Date: Wed, 04 Nov 2015 22:54:15 -0000
X-Groupsio-MsgNum: 58300
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline

--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2015 at 06:30:09PM +0100, Andreas M=FCller wrote:
> With this we can setup qt-creator to build/debug on target again.

Can we apply this change to qtbase-native and nativesdk-qtbase as well
or will it break things?

With 5.6 I was finally able to use the same patches for target qtbase
and native(sdk) with only:
    file://0008-Always-build-uic.patch \
    file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
included only for native(sdk) that makes my qtbase branches in
github.com/meta-qt5/qtbase a lot easier to maintain.

If it cannot be changed for all, can we make it conditional, e.g.=20
[ "$QT_CROSS_COMPILE" =3D "yes" ]
like in new version of:
https://github.com/meta-qt5/qtbase/commit/10283d010d7a66c485cda1e9b1c0cf7c4=
1e358b3

?

>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...configure-paths-for-target-qmake-properly.patch | 46 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qtbase_git.bb                       |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtbase/0011-configure-paths-for-target=
-qmake-properly.patch
>=20
> diff --git a/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-=
properly.patch b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmak=
e-properly.patch
> new file mode 100644
> index 0000000..a20164b
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0011-configure-paths-for-target-qmake-properl=
y.patch
> @@ -0,0 +1,46 @@
> +From ecf12f418eb3a186af0276420576bac9e7974e71 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Wed, 4 Nov 2015 10:36:26 +0100
> +Subject: [PATCH] configure paths for target qmake properly
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + configure | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 6f338f3..82e3ae3 100755
> +--- a/configure
> ++++ b/configure
> +@@ -3842,12 +3842,12 @@ QT_CONFIGURE_STRS_ALL=3D$QT_CONFIGURE_STRS
> +=20
> + QT_CONFIGURE_STR_OFFSETS=3D
> + QT_CONFIGURE_STRS=3D
> +-addConfStr "$CFG_SYSROOT"
> ++addConfStr ""
> + addConfStr "$QT_REL_HOST_BINS"
> + addConfStr "$QT_REL_HOST_LIBS"
> + addConfStr "$QT_REL_HOST_DATA"
> + addConfStr "$shortxspec"
> +-addConfStr "$shortspec"
> ++addConfStr "$shortxspec"
> +=20
> + #----------------------------------------------------------------------=
---------
> + # generate qconfig.cpp
> +@@ -3866,7 +3866,7 @@ static const char qt_configure_installation       =
   [12+11]    =3D "qt_instdate=3D2
> + static const char qt_configure_prefix_path_str       [512 + 12] =3D "qt=
_prfxpath=3D$QT_INSTALL_PREFIX";
> + #ifdef QT_BUILD_QMAKE
> + static const char qt_configure_ext_prefix_path_str   [512 + 12] =3D "qt=
_epfxpath=3D$QT_EXT_PREFIX";
> +-static const char qt_configure_host_prefix_path_str  [512 + 12] =3D "qt=
_hpfxpath=3D$QT_HOST_PREFIX";
> ++static const char qt_configure_host_prefix_path_str  [512 + 12] =3D "qt=
_hpfxpath=3D$QT_EXT_PREFIX";
> + #endif
> +=20
> + static const short qt_configure_str_offsets[] =3D {
> +--=20
> +2.1.0
> +
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 0ba8ac8..3ef5923 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -26,6 +26,7 @@ SRC_URI +=3D "\
>      file://0008-qmake-don-t-build-it-in-configure-but-allow-to-build.pat=
ch \
>      file://0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.pat=
ch \
>      file://0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.pat=
ch \
> +    file://0011-configure-paths-for-target-qmake-properly.patch \
>  "
> =20
>  DEPENDS +=3D "qtbase-native"
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY6jJ0ACgkQN1Ujt2V2gBwGogCaA+nYbfDub65hweNAoe572BRn
Cj4An36woFN6ET4xp3hwzuXiehk2x5/e
=H3Mj
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
