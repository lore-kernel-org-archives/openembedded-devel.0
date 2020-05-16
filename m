Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.11535.1589659560650047418
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 May 2020 13:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=LSxUcTtN;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1761; q=dns/txt; s=axis-central1;
  t=1589659561; x=1621195561;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+PA9KLXuQwKxpY4OUXDLsOfBuURL2Ivg2vODg9msFzs=;
  b=LSxUcTtNBxjyzeylROkld11bDNFu5g/IjsPCVRlVeAce4wQi0JC25ToG
   uO4qv3Ci//uOvbVnWzqrov3CN8gUo91sLr0oJ6Lp+LQ6aTs7Ht97XTkzv
   Gf4CuvctVNhjQtFe8jxjIGaRwp2xT1AjCVjruvSs7hB75nPaTxZg8tkV2
   Tw9pf/gsiM9jOvXerqNI/STy8LQZc9mneQUBnC2fbNvqkStxMjyo9PGbW
   fvRVRwnZcwIEyDRXYFzELSyX/JesbqeKVMXPrL9EJPcqnz/BwtZYqFi+d
   ynhCzEXjj8iw1yr/AsKp1p9R3Vssg2eA4yavv5PQ8G7eykXQBFKidMDq8
   Q==;
IronPort-SDR: 9GcDoTSqKcy7pJvinGdGFsRaROBeX/Zcq5pAMP1cpYy085cn2m8cGQoxe2wWK/1Qlk7b8riZSo
 YdNG1B91rnjVZ+v/X8gbQFBdD4tZ/ms7txviRegEq2u8pmrNPhXLky+VkArFNJIICHelhAjxep
 TeWGoBvy2xh2PP3cL03RJ4rmMygLyk0c6QXWGBs04XjCZKGx/p9EtVBqq6UnB5JpLAWg1m+ujl
 Bb44qQp9Sr0bBvY8zeDv/TnSTDkETRA0DxBamoipgeqIDaINUIs/H8CIyrlp/LPaIpz6XljZHf
 7wo=
X-IronPort-AV: E=Sophos;i="5.73,400,1583190000"; 
   d="scan'208";a="8551943"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][PATCH 1/3] netplan: Depend on systemd if its in distro
Thread-Topic: [oe] [meta-networking][PATCH 1/3] netplan: Depend on systemd if
 its in distro
Thread-Index: AQHWK57I6x/CQOrz3kqPlGhQVsxdQKirIoSg
Date: Sat, 16 May 2020 20:05:56 +0000
Message-ID: <401b0d008f8444da8613ba2102d614d4@XBOX03.axis.com>
References: <20200516162631.1862339-1-raj.khem@gmail.com>
In-Reply-To: <20200516162631.1862339-1-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 16 maj 2020 18:26
> To: openembedded-devel@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [oe] [meta-networking][PATCH 1/3] netplan: Depend on systemd if =
its in distro

Change "its"  to "it is".

>=20
> it needs to link with libsystemd when using systemd as init system
> Fixes
> Package libsystemd was not found in the pkg-config search path.
> Perhaps you should add the directory containing `libsystemd.pc'
> to the PKG_CONFIG_PATH environment variable
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/recipes-connectivity/netplan/netplan_0.98.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> index db029a4b8a..15c4968132 100644
> --- a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> +++ b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> @@ -18,7 +18,8 @@ SRC_URI =3D " \
>          git://github.com/CanonicalLtd/netplan.git \
>  "
>=20
> -DEPENDS =3D "glib-2.0 libyaml"
> +DEPENDS =3D "glib-2.0 libyaml ${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd','systemd','',d)}"

That can be simplified to:

DEPENDS =3D "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'system=
d', d)}"

> +
>  RDEPENDS_${PN} =3D "python3 python3-core python3-pyyaml python3-netiface=
s python3-nose python3-coverage python3-pycodestyle python3-pyflakes util-l=
inux-libuuid"
>=20
>  inherit pkgconfig systemd
> --
> 2.26.2

//Peter

