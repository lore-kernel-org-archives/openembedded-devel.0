Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id D3F456E268
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 22:22:49 +0000 (UTC)
Received: by wmec201 with SMTP id c201so240771wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2015 14:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VUYoPoEKovC6MhpmZEjBL0iKFwtInD9DqWJDbChTKRo=;
	b=BRi+PIfzhAqBEzCMABXrLPkdciheaBgvgqSEdkTQK5WyxzFnGtNoNeZ8Yudep4zgMv
	LeGzH47KZDo8J9xsK3sflhjnfyXw7RaIiz+RUOof8xCNrsKIgs/dU/87GhAlugMfbg5G
	323oPjrp+m1ql7HscmoOsGiPzzWjsj+Yfl23feeHd65GxpGGGY/njeEJD0jj6Ly1nNHj
	zCRKl7t7oesheNA7YCZT4vcDxkrP0s6SN8K3XSQLew/1hIF+WeLaA03jy0X6E71MjNOA
	RRHK0XzDYqS3gLG1hpBzqnoBLw+6p1P6XZrkD1KA4ccfCHVkNa1cJCks75vZIF2lsj3C
	F0XA==
X-Received: by 10.194.185.42 with SMTP id ez10mr30645010wjc.82.1447712569347; 
	Mon, 16 Nov 2015 14:22:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l128sm20594521wmf.10.2015.11.16.14.22.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 14:22:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Nov 2015 22:23:03 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151116212303.GD2240@jama>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
	<1447271300-4153-3-git-send-email-adrian.freihofer@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1447271300-4153-3-git-send-email-adrian.freihofer@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH V2 02/17] modemmanager: Update to 1.4.12
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
X-List-Received-Date: Mon, 16 Nov 2015 22:22:50 -0000
X-Groupsio-MsgNum: 58675
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline

--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2015 at 08:48:05PM +0100, Adrian Freihofer wrote:
>  - Fixes segfaults, memleaks and other bugs
>  - Support more modems
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> ---
>  .../{modemmanager_1.4.2.bb =3D> modemmanager_1.4.12.bb}        | 12 ++++=
++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.4.2.bb =
=3D> modemmanager_1.4.12.bb} (71%)
>=20
> diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2=
=2Ebb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
> similarity index 71%
> rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.=
bb
> rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
> index b273c91..db7a28d 100644
> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.12.bb
> @@ -1,19 +1,19 @@
>  SUMMARY =3D "ModemManager is a daemon controlling broadband devices/conn=
ections"
>  DESCRIPTION =3D "ModemManager is a DBus-activated daemon which controls =
mobile broadband (2G/3G/4G) devices and connections"
>  HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/ModemManager/"
> -LICENSE =3D "GPLv2 & LGPLv2.1"
> +LICENSE =3D "GPL-2.0 & LGPL-2.1"
>  LIC_FILES_CHKSUM =3D " \
>      file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>      file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
>  "
> =20
> -inherit autotools gettext gtk-doc systemd
> +inherit gnomebase gettext systemd
> =20
> -DEPENDS =3D "glib-2.0 libmbim libqmi polkit libgudev dbus-glib"
> +DEPENDS =3D "glib-2.0 libmbim libqmi (>=3D1.12.4) polkit libgudev dbus-g=
lib"

bitbake doesn't support versioned dependencies, I've removed
"(>=3D1.12.4)" when cherry-picking to master-next, but I wonder how you
were able to test this.

> -SRC_URI =3D "http://www.freedesktop.org/software/ModemManager/ModemManag=
er-${PV}.tar.xz"
> -SRC_URI[md5sum] =3D "fe74eaa9a77e51e552b4356b4c7195cb"
> -SRC_URI[sha256sum] =3D "07d332fbe6f45f788f740810951e04042aaf023bd5ecf8ef=
0b3a06e37703585d"
> +SRC_URI =3D "${GNOME_MIRROR}/ModemManager/ModemManager-${PV}.tar.xz"
> +SRC_URI[md5sum] =3D "66cc7266b15525cb366253e6639fc564"
> +SRC_URI[sha256sum] =3D "7ef5035375a953b285a742591df0a65fd442f4641ce4d8f4=
392a41d6d6bc70b3"=20
> =20
>  S =3D "${WORKDIR}/ModemManager-${PV}"
> =20
> --=20
> 2.4.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZKSO8ACgkQN1Ujt2V2gBxCggCeLzF6BWXoDF9jt1YGwJPS+TTd
dmkAn2oUkeIVnlUQBpxq41//90yUEQR3
=rivW
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
