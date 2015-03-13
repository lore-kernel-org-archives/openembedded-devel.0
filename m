Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 182886013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:49:20 +0000 (UTC)
Received: by wghl18 with SMTP id l18so23366161wgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5VidPoWzC3udDepLweoRaih4tVRWsb8xaRPz+gk83UI=;
	b=Ym+fuWX/uuI7rmNR/oAU1LYkWVFz2bMwmVe15z/wHcViI+7kJ1tiSggsuecLC0ubGK
	Te6GVSN+IZdn7sUv7P1GS728PL6sgNMQWvwWNQ+Ld+RL9SG42vqdqc3nLQF+rT+iD7Dx
	O+SwE/ERqULCQFXgthNwXveC6E7vca4kQdbvaXbOavv868hjY0BF/kZj3d78k+Meofc2
	EEqY8K94eTHNJXimLBpLqUq+OyQ8XnShy9BPj0qI85Uh/O94xzkrA66ewflz1cx46jcv
	qcODhQ7CVoy/kZgpq/jmep3khPWUbjv+csQaXkBMl8hnpAKsXbWrlS9e8eag5c5/AuN8
	r7Qw==
X-Received: by 10.194.80.193 with SMTP id t1mr99467285wjx.8.1426254561466;
	Fri, 13 Mar 2015 06:49:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id n6sm2916980wjy.8.2015.03.13.06.49.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 06:49:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Mar 2015 14:50:14 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150313135014.GB2345@jama>
References: <1426218641-28745-1-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1426218641-28745-1-git-send-email-armccurdy@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] qt5: add QT_GIT to define git repo for Qt core components
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
X-List-Received-Date: Fri, 13 Mar 2015 13:49:21 -0000
X-Groupsio-MsgNum: 54766
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline

--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2015 at 08:50:41PM -0700, Andre McCurdy wrote:
> Replace four duplicate git URIs with a single definition.

Do you plan to override this location from somewhere else?

It doesn't even cover qt5everywheredemo recipe so I don't think it's
worth it in this form, maybe if you move it to layer.conf and apply it
for qt5everywheredemo as well.

Regards,

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
>  recipes-qt/qt5/qt5-git.inc             | 4 +++-
>  recipes-qt/qt5/qtbase-native_git.bb    | 2 +-
>  recipes-qt/qt5/qtbase_git.bb           | 2 +-
>  4 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nati=
vesdk-qtbase_git.bb
> index df80407..9832eee 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -5,7 +5,7 @@ require ${PN}.inc
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/${BPN}-git:"
> =20
>  SRC_URI =3D "\
> -    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
> +    ${QT_GIT}/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
> =20
>  # common for qtbase-native, qtbase-nativesdk and qtbase
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index 84ddf49..a2d96a2 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -1,11 +1,13 @@
>  # Copyright (C) 2012 O.S. Systems Software LTDA.
>  # Copyright (C) 2013-2014 Martin Jansa <martin.jansa@gmail.com>
> =20
> +QT_GIT ?=3D "git://code.qt.io"
> +
>  QT_MODULE_BRANCH ?=3D "5.4"
> =20
>  # each module needs to define valid SRCREV
>  SRC_URI +=3D " \
> -    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
> +    ${QT_GIT}/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
> =20
>  S =3D "${WORKDIR}/git"
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-=
native_git.bb
> index 5a308d4..e558ee6 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -2,7 +2,7 @@ require qt5-git.inc
>  require ${PN}.inc
> =20
>  SRC_URI =3D "\   =20
> -    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
> +    ${QT_GIT}/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
> =20
>  # common for qtbase-native, qtbase-nativesdk and qtbase
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 549c92a..1be31ea 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -2,7 +2,7 @@ require qt5-git.inc
>  require ${PN}.inc
> =20
>  SRC_URI =3D "\
> -    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
> +    ${QT_GIT}/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>  "
> =20
>  # common for qtbase-native, qtbase-nativesdk and qtbase
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

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUC6xYACgkQN1Ujt2V2gBzR8ACeKtKAVaVnk6or3UoA0zHvWTdL
yHgAn0+ygZaXguw5+qBolPB+4d/A3cFW
=3ctk
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
