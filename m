Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A1E5B76073
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 19:39:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x6-v6so6865238wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 12:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bV/Yibzz6+SQoMzPmr+zuD74SJPOBhUgY51ThFw4HmM=;
	b=gtTeMDs6TSUojnI1s8RCq1IEXbcHxtwjHC+KD3xrNcgLgucxhh1I+eUM/fPfELefvb
	VAYcQ5OZVCZpsJTNh41lIznArcjdEVfMmBWIBViA2DNrFwaEFKEkWAx1ulQTyWMCx9Mf
	YHon4yQbHhtdDYEcfuEESNndcgXqujtysgItqFnuU95PKCePz+jXZ86f1sNscXqJnBPd
	Tdv4VfBTnS6VHe/q0DHQssTQ2rfrSyq0WDEeOBtYQ72jIdn61fZjP3Z1eZLv1vJEPElD
	DEOcGjxt9ywPDYSREL6imACmr9uG1IhFzIwk1b/dVRlRZjnXrdPcB4sQSIlowgjdncjs
	9k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bV/Yibzz6+SQoMzPmr+zuD74SJPOBhUgY51ThFw4HmM=;
	b=fODhFfWTZwmn/AjnK73g8d3+fSMgZAqciXi2HIEIcqBb9QTwZHw/X7hTm1wBDEJwOE
	F30y3LSxW4lRNUsxQEZrBU7EaS2zw4/Sqj6s6AJfZ+mHYqJ5aOVkZ+nWmmwKR6fraUKi
	5mGt/PNniH7EJFsK54t9ggfzgMl8Cw9kZufCzQKABPpPmAirH1rnEp62OGp4Q794QHQz
	3twOUCCfrrnIm6qbKKo/39iVdRj1V4rmuCZVY1rexaFAkgYCfNwHY8/uvMiWPjqSE8oF
	N+nUY3GMhrOAXje5ZhR/IFxr4yPehchkF3XNYqGMOP/L4sdkRuGRnc4f1dU2PT/MBR5T
	DqXw==
X-Gm-Message-State: APt69E2e2LRq+f5Y1QQLQV/6vwoJADgDMwo7gnVZe8DRSrGUKS0qzbY1
	ro8T8oYhQZLkGdOaGlV+fVA=
X-Google-Smtp-Source: ADUXVKIafcjM0k3ZKIbfLPp+z7oqDGmiLIas+x8M2CjlJqqxVs1k1CDZOTBEMf80gtxt+nU9/szn2g==
X-Received: by 2002:a1c:69d7:: with SMTP id
	z84-v6mr5818015wmh.147.1529609941281; 
	Thu, 21 Jun 2018 12:39:01 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p10-v6sm4008739wmc.17.2018.06.21.12.38.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Jun 2018 12:38:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 21 Jun 2018 21:38:59 +0200
To: Stefan Sonski <s.sonski@gmail.com>
Message-ID: <20180621193859.GA1842@jama>
References: <20180327180159.9837-1-s.sonski@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180327180159.9837-1-s.sonski@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] nativesdk-qtbase Enable objcopy for qmake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2018 19:39:01 -0000
X-Groupsio-MsgNum: 72978
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2018 at 08:01:59PM +0200, Stefan Sonski wrote:
> Enable objcopy for qmake to support separate_debug_info flag for cross-co=
mpiled
> applications in nativesdk-qtbase.
>=20
> Signed-off-by: Stefan Sonski <s.sonski@gmail.com>
> ---
>  classes/qmake5_base.bbclass                        |  2 ++
>  recipes-qt/qt5/nativesdk-qtbase_git.bb             |  2 ++
>  .../0013-Add-objcopy-to-linux-oe-gplatform.patch   | 32 ++++++++++++++++=
++++++
>  3 files changed, 36 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtbase/0013-Add-objcopy-to-linux-oe-gp=
latform.patch
>=20
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 8f1d143..bfde1d2 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -28,6 +28,7 @@ EXTRA_OEMAKE =3D " \
>      OE_QMAKE_LINK=3D'${OE_QMAKE_LINK}' \
>      OE_QMAKE_LDFLAGS=3D'${OE_QMAKE_LDFLAGS}' \
>      OE_QMAKE_AR=3D'${OE_QMAKE_AR}' \
> +    OE_QMAKE_OBJCOPY=3D'${OE_QMAKE_OBJCOPY}' \
>      OE_QMAKE_STRIP=3D'${OE_QMAKE_STRIP}' \
>      OE_QMAKE_INCDIR_QT=3D'${STAGING_DIR_TARGET}/${OE_QMAKE_PATH_HEADERS}=
' \
>  "
> @@ -41,6 +42,7 @@ export OE_QMAKE_CXXFLAGS =3D "${CXXFLAGS}"
>  export OE_QMAKE_LINK =3D "${CXX}"
>  export OE_QMAKE_LDFLAGS =3D "${LDFLAGS}"
>  export OE_QMAKE_AR =3D "${AR}"
> +export OE_QMAKE_OBJCOPY =3D "${OBJCOPY}"
>  export OE_QMAKE_STRIP =3D "echo"
> =20
>  # qmake reads if from shell environment
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nati=
vesdk-qtbase_git.bb
> index efcb82c..f4d80e9 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -40,6 +40,7 @@ SRC_URI +=3D "\
>      file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.pat=
ch \
>      file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
>      file://0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.pat=
ch \
> +    file://0013-Add-objcopy-to-linux-oe-gplatform.patch \

You're adding the patch in section which says:
# common for qtbase-native, qtbase-nativesdk and qtbase
but you're adding it only in nativesdk-qtbase

>  "
> =20
>  # common for qtbase-native and nativesdk-qtbase
> @@ -192,6 +193,7 @@ fakeroot do_generate_qt_environment_file() {
>      echo 'export OE_QMAKE_CXX=3D$CXX' >> $script
>      echo 'export OE_QMAKE_LINK=3D$CXX' >> $script
>      echo 'export OE_QMAKE_AR=3D$AR' >> $script
> +    echo 'export OE_QMAKE_OBJCOPY=3D$OBJCOPY' >> $script
>      echo 'export OE_QMAKE_STRIP=3D$STRIP' >> $script
>      echo 'export QT_CONF_PATH=3D${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $=
script
>      echo 'export OE_QMAKE_LIBDIR_QT=3D`qmake -query QT_INSTALL_LIBS`' >>=
 $script
> diff --git a/recipes-qt/qt5/qtbase/0013-Add-objcopy-to-linux-oe-gplatform=
=2Epatch b/recipes-qt/qt5/qtbase/0013-Add-objcopy-to-linux-oe-gplatform.pat=
ch
> new file mode 100644
> index 0000000..fcbce51
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase/0013-Add-objcopy-to-linux-oe-gplatform.patch
> @@ -0,0 +1,32 @@
> +From 487c7a7704106eda0cfea9d9652cb42b9889b5e2 Mon Sep 17 00:00:00 2001
> +From: Stefan Sonski <s.sonski@gmail.com>
> +Date: Tue, 27 Mar 2018 19:38:13 +0200
> +Subject: [PATCH] Add objcopy to linux oe gplatform
> +
> +---
> + mkspecs/linux-oe-g++/qmake.conf | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmak=
e.conf
> +index 30d31ed16d..740f3bab9d 100644
> +--- a/mkspecs/linux-oe-g++/qmake.conf
> ++++ b/mkspecs/linux-oe-g++/qmake.conf
> +@@ -10,6 +10,7 @@ include(../common/linux.conf)
> +=20
> + # QMAKE_<TOOL> (moc, uic, rcc) are gone, overwrite only ar and strip
> + QMAKE_AR              =3D $$(OE_QMAKE_AR) cqs
> ++QMAKE_OBJCOPY         =3D $$(OE_QMAKE_OBJCOPY)
> + QMAKE_STRIP           =3D $$(OE_QMAKE_STRIP)
> +=20
> + include(../common/gcc-base-unix.conf)
> +@@ -36,7 +37,5 @@ QMAKE_LINK_C_SHLIB =3D $$(OE_QMAKE_LINK)
> + # for the SDK
> + isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $$(OE_QMAKE_QT_CONFIG)
> +=20
> +-include(../oe-device-extra.pri)
> +-
> + load(device_config)
> + load(qt_config)
> +--=20
> +2.16.2
> +
> --=20
> 2.16.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWyv+0wAKCRA3VSO3ZXaA
HBoIAJ9GpQotYNpJvS+YI/3iKxKKKw24gQCfZX65rGtL3GIHKoABjTmKNdKvJ08=
=UdhX
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
