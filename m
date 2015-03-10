Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA1D73A05
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 17:28:45 +0000 (UTC)
Received: by widem10 with SMTP id em10so4946311wid.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 10:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Gc44j0WaWpK2gU4I9jzvpCVm2hzrNluBgHstnT423Fw=;
	b=qJLH5r4nbbtmr/GBKkQ/2CvAS4W4xzvNqVu502sU3/Ihjn6WwFxKQE5U5F/P39vD7q
	h2cIxBLEAEjts437yruvT43JkUTRZ3QdtfJUK4dcf9rq3Kp4nZYiI8peJAZrP1lKmrE7
	yehE97pGZ7VPfdNb5LHNvKNjLkJ/DASBCLnkAO5bqYghQNgEpIt0fPLyXbv4JAr/OUZp
	bXIeKAfwyyLaC3ovXPVZi5DFvuD1HXT4BcBP7sJhvyFe4VGM/w9mpW4zEXfzKjNnTh4O
	8XlvEsGVw20HQuv7cQdheCi7NF3CsHtdKn26x1Y+no/DfYP5cpSpU2idzxUaJXu3w1Is
	TRKg==
X-Received: by 10.180.73.171 with SMTP id m11mr69583411wiv.21.1426008526295;
	Tue, 10 Mar 2015 10:28:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fm10sm2511417wib.7.2015.03.10.10.28.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 10:28:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Mar 2015 18:29:17 +0100
To: Frederico Cadete <frederico@cadete.eu>
Message-ID: <20150310172917.GF2340@jama>
References: <CAL5ScNV3CUbiKCgcyz2BbpSkNSuGTq=N5-CDfSThAFciTtKR7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL5ScNV3CUbiKCgcyz2BbpSkNSuGTq=N5-CDfSThAFciTtKR7Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] qt5-git, *qtbase*, qt5everywheredemo: Fetch from code.qt.io
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
X-List-Received-Date: Tue, 10 Mar 2015 17:28:50 -0000
X-Groupsio-MsgNum: 54717
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gneEPciiIl/aKvOT"
Content-Disposition: inline

--gneEPciiIl/aKvOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 05:50:13PM +0100, Frederico Cadete wrote:
> Gitorious disabled the git:// protocol, breaking fetches.
> Also, this service is scheduled to stop in May 2015, so move to
> code.qt.io.
>=20
> Signed-off-by: Frederico Cadete <frederico@cadete.eu>
> ---
>  recipes-qt/examples/qt5everywheredemo_1.0.bb | 2 +-
>  recipes-qt/qt5/nativesdk-qtbase_git.bb       | 2 +-
>  recipes-qt/qt5/qt5-git.inc                   | 2 +-
>  recipes-qt/qt5/qtbase-native_git.bb          | 2 +-
>  recipes-qt/qt5/qtbase_git.bb                 | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb
> b/recipes-qt/examples/qt5everywheredemo_1.0.bb
> index 4f7022c..60edaa4 100644
> --- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
> +++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://main.cpp;md5=3D1187cb795a0f96bce64e63dd1a67dc2b"

There are extra line feeds probably added by your e-mail client, please
fix it or use git send-email.

This time I've applied the patch manually, thanks.

>  DEPENDS =3D "qtdeclarative qtgraphicaleffects"
>=20
>  SRCREV =3D "9a868f96ee63c21ceda890d8dfc9d33f093d1b6d"
> -SRC_URI =3D "git://gitorious.org/qt-labs/qt5-everywhere-demo.git"
> +SRC_URI =3D "git://code.qt.io/qt-labs/qt5-everywhere-demo.git"
>=20
>  S =3D "${WORKDIR}/git/QtDemo"
>=20
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> index 9194a83..df80407 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -5,7 +5,7 @@ require ${PN}.inc
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/${BPN}-git:"
>=20
>  SRC_URI =3D "\
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRAN=
CH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
>=20
>  # common for qtbase-native, qtbase-nativesdk and qtbase
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index da962b8..84ddf49 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -5,7 +5,7 @@ QT_MODULE_BRANCH ?=3D "5.4"
>=20
>  # each module needs to define valid SRCREV
>  SRC_URI +=3D " \
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRAN=
CH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
>=20
>  S =3D "${WORKDIR}/git"
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb
> b/recipes-qt/qt5/qtbase-native_git.bb
> index cebc021..5a308d4 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -2,7 +2,7 @@ require qt5-git.inc
>  require ${PN}.inc
>=20
>  SRC_URI =3D "\
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRAN=
CH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
>=20
>  # common for qtbase-native, qtbase-nativesdk and qtbase
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index d33eb68..549c92a 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -2,7 +2,7 @@ require qt5-git.inc
>  require ${PN}.inc
>=20
>  SRC_URI =3D "\
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRAN=
CH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
>=20
>  # common for qtbase-native, qtbase-nativesdk and qtbase
> --=20
> 1.9.1

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gneEPciiIl/aKvOT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlT/Ke0ACgkQN1Ujt2V2gBxWTACYu7np6o/O+uoOCc/HyDyPkp9/
SwCeMVerWGb29KW45QZaq/Qv72d4R9k=
=KTaw
-----END PGP SIGNATURE-----

--gneEPciiIl/aKvOT--
