Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 976966AFB5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 18:25:11 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so1640594eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 10:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uzfxYAcPiOMsdPbjbPSiYU42qcLGpER3kMbOsCF+I1Y=;
	b=QK4JnyfapqRb+WjpgA5see/4U+fF652+tm9AgphtkaZC/Kf1GoVa5VGws6PGIE2BAP
	yBKeWk2+otB5dIG2pMrmtItGtKWeoy5kSgIOwc5evhZRGZfZZMC8KRs3afNeMu+amAby
	+qsfmB6d7zfd/lDUeYhYoH30UUUWhhLCAWGG5X65iVaGktByOPrz9U48G1AjODU9uHbI
	nseyPft2sxGk9I5cfeoJdR0HOqvWPD41Jbf6fn+3awmn/a8tXcdN5J+/qj3HwPOrd2kB
	+362qm9qiLWpEmZzN4YDtV4xguPS7LWH20ZVeXMPL+ubAsdIsuKvm2yXexpXktnMrD7B
	2ulg==
X-Received: by 10.14.204.9 with SMTP id g9mr14893156eeo.82.1393525512393;
	Thu, 27 Feb 2014 10:25:12 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id u6sm500617eep.11.2014.02.27.10.25.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Feb 2014 10:25:08 -0800 (PST)
Date: Thu, 27 Feb 2014 19:25:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140227182505.GD26981@jama>
References: <1393518954-15100-1-git-send-email-nicolas.dechesne@linaro.org>
	<1393518954-15100-2-git-send-email-nicolas.dechesne@linaro.org>
	<1393518954-15100-3-git-send-email-nicolas.dechesne@linaro.org>
	<1393518954-15100-4-git-send-email-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1393518954-15100-4-git-send-email-nicolas.dechesne@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH dora 3/3] qtwebkit-examples: add RDEPENDS for ca-certificates
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
X-List-Received-Date: Thu, 27 Feb 2014 18:25:15 -0000
X-Groupsio-MsgNum: 48419
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JSVXQxoTSdH0Ya++"
Content-Disposition: inline

--JSVXQxoTSdH0Ya++
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2014 at 05:35:54PM +0100, Nicolas Dechesne wrote:
> From: Andre McCurdy <armccurdy@gmail.com>
>=20
> If qtbase is configured with openssl support then the
> qtwebkit browser example apps require CA certificates.
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>=20
> Conflicts:
> 	recipes-qt/qt5/qtbase.inc

Please drop this

>=20
> ---
>  recipes-qt/qt5/qt5.inc               | 2 ++
>  recipes-qt/qt5/qtbase.inc            | 4 +++-
>  recipes-qt/qt5/qtwebkit-examples.inc | 1 +
>  3 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index 7669efc..d9ebbff 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -7,6 +7,8 @@ inherit qmake5
>  ICU =3D "icu "
>  ICU_powerpc =3D "pango"
> =20
> +PACKAGECONFIG_OPENSSL ?=3D "openssl"
> +
>  QT_MODULE ?=3D "${BPN}"
> =20
>  # we don't want conflicts with qt4
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 4f81f8e..eb22e40 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -43,6 +43,8 @@ PACKAGECONFIG_FONTS ?=3D ""
>  PACKAGECONFIG_SYSTEM ?=3D "jpeg libpng zlib"
>  PACKAGECONFIG_MULTIMEDIA ?=3D "${@base_contains('DISTRO_FEATURES', 'puls=
eaudio', 'pulseaudio', '', d)}"
>  PACKAGECONFIG_DISTRO ?=3D ""
> +# This is in qt5.inc, because qtwebkit-examples are using it to enable c=
a-certificates dependency
> +# PACKAGECONFIG_OPENSSL ?=3D "openssl"
> =20
>  PACKAGECONFIG ??=3D " \
>      release \
> @@ -50,7 +52,7 @@ PACKAGECONFIG ??=3D " \
>      udev \
>      evdev \
>      widgets \
> -    openssl \
> +    ${PACKAGECONFIG_OPENSSL} \
>      ${PACKAGECONFIG_GL} \
>      ${PACKAGECONFIG_FB} \
>      ${PACKAGECONFIG_X11} \
> diff --git a/recipes-qt/qt5/qtwebkit-examples.inc b/recipes-qt/qt5/qtwebk=
it-examples.inc
> index 50c28cd..84f16a4 100644
> --- a/recipes-qt/qt5/qtwebkit-examples.inc
> +++ b/recipes-qt/qt5/qtwebkit-examples.inc
> @@ -10,3 +10,4 @@ SRC_URI +=3D " \
> =20
>  DEPENDS +=3D "qtwebkit"
>  RDEPENDS_${PN}-examples +=3D "qtwebkit-qmlplugins"
> +RDEPENDS_${PN}-examples +=3D "${@base_contains('PACKAGECONFIG_OPENSSL', =
'openssl', 'ca-certificates', '', d)}"
> --=20
> 1.9.0
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JSVXQxoTSdH0Ya++
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMPgwEACgkQN1Ujt2V2gBw2oACggyr4IRoB4dFVxrZtxxIn5Om7
1P0An05FkpHWsW1sNzjO8sy1kLS7ABPZ
=lqCz
-----END PGP SIGNATURE-----

--JSVXQxoTSdH0Ya++--
