Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id D79C577223
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:50:54 +0000 (UTC)
Received: by wmec201 with SMTP id c201so36766447wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+0kGRKOLmF0OLupCCAucX0TiZqy7WKWrdnanBLEfi/4=;
	b=Wyc10j/HiJtYljbR9Ju55j28NiE/+2b0ChPi96tLQiHIkh+bjJ5CWmD7d0wnbu9u/y
	LeYJJaUh8c11rRGWvzd4fwzXS3udiZTlvE5518R1i7H4zhOZVJ+f2MoCCS5KoqnSaI3H
	5GeZSZUeGpMAR10nn8htOYKlVgrJK4qg97St/QBzrB0obugK+AVw2VJFRPnXu53akXQD
	NWMBcvtkY4h8wMrPOKmeu2NeZzY1uXf9/ZSjkuihwqICvdBLN7iHeXzNtI29Slb7cQhs
	xPZoaddDFWabfU7POUsvkqGuC6ZxpP4TgXJoBD7N/y2zbDcVeGZpzUR+LJ580cIGCRga
	lvYg==
X-Received: by 10.28.111.151 with SMTP id c23mr7373783wmi.28.1447339854579;
	Thu, 12 Nov 2015 06:50:54 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s189sm12794134wmf.16.2015.11.12.06.50.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 06:50:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 15:51:10 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151112145110.GG2574@jama>
References: <1447324352-27951-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1447324352-27951-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe] devicekit-power: add missing dependency on libgudev
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
X-List-Received-Date: Thu, 12 Nov 2015 14:50:56 -0000
X-Groupsio-MsgNum: 58567
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RMedoP2+Pr6Rq0N2"
Content-Disposition: inline

--RMedoP2+Pr6Rq0N2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 11:32:32AM +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-kernel/netmap/netmap-modules_git.bb | 2 +-
>  meta-oe/recipes-support/devicekit/devicekit-power_014.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb =
b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> index c1c319d..6365fee 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -15,7 +15,7 @@ EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BUILD=
DIR} \
>                  --driver-suffix=3D"-netmap" \
>                  "
> =20
> -EXTRA_OECONF +=3D "--no-drivers=3Dixgbe"
> +EXTRA_OECONF +=3D "--no-drivers=3Dixgbe --no-drivers=3Dvirtio_net.c"

This chunk obviously belongs to separate patch, fixed in jansa/master
branch.

> =20
>  LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
>  LDFLAGS :=3D "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
> diff --git a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb b/m=
eta-oe/recipes-support/devicekit/devicekit-power_014.bb
> index 0c1245f..c2b7e66 100644
> --- a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
> +++ b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Devicekit power"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D756cf97871f77233638937da21b02=
5d3"
> =20
> -DEPENDS =3D "libusb-compat libusb1 udev glib-2.0 dbus-glib polkit intlto=
ol-native"
> +DEPENDS =3D "libusb-compat libusb1 udev glib-2.0 dbus-glib polkit intlto=
ol-native libgudev"
> =20
>  SRC_URI =3D "http://upower.freedesktop.org/releases/DeviceKit-power-${PV=
}.tar.gz;name=3Darchive"
>  SRC_URI[archive.md5sum] =3D "935d37f1e14b3c8a1d6dabcd9a38d3ca"
> --=20
> 2.6.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RMedoP2+Pr6Rq0N2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZEp14ACgkQN1Ujt2V2gBz3OACfQKxfhb3JooijZ8XuCk3D2uYR
+R0AoJGzptj/QsWL0TIMhiDTTNKjwaeV
=DvjU
-----END PGP SIGNATURE-----

--RMedoP2+Pr6Rq0N2--
