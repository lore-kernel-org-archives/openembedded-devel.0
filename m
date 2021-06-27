Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.3900.1624832593993689182
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 15:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=lp6nC2i5;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1624832594;
  x=1656368594;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=YUFDV+8TeCTL+DTBEDP5IVSkPBeWmAmBRLNTKidI4mc=;
  b=lp6nC2i5jcz+Ri6tm0aH8LNYTlP8LqQdTYvpnUqAyD37xIep589wIAo6
   N/iZ/Ywkrb1SwOr1AWDJ7TaKgcTKeC8c5pG4d2zaiImHmmzsCYyg6vNLE
   d2RxKQC/7cXuihs2WrL2EYaSpyyZmbMztdjtZiK7BVRaNgtL7qNX8TSpV
   XUkgDIugwxdCcZ/BIVA5sWOmz1RfCDFVHzWdy9iBiNvNFzHFnfNcmcj7U
   J0NJe1KYjv+PsBbk/xsB5YGhMWO2Ilm2WAtDuAaF5yZDulaId2OJD168k
   Rcrcc3wWx27wU1/gIsQtFphC0Y2PxU7O/3NoPFzCEjSqYOLqkQW4rHT1I
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] cryptsetup: Only recommend kernel modules when building for target
Thread-Topic: [oe] [meta-oe][PATCH] cryptsetup: Only recommend kernel modules
 when building for target
Thread-Index: AQHXZGd4tirBeyrOJUK3mLrtn0OP36sofJQw
Date: Sun, 27 Jun 2021 22:23:10 +0000
Message-ID: <da526c764643436486529abb8b238ec5@XBOX03.axis.com>
References: <1689BD5B007B0F3E.6151@lists.openembedded.org>
In-Reply-To: <1689BD5B007B0F3E.6151@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.197.240.43]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

*ping* And please backport it to Hardknott once it is accepted for master.

//Peter

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 18 juni 2021 19:29
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] cryptsetup: Only recommend kernel modules
> when building for target
>=20
> Otherwise cryptsetup-native depends on the target kernel and thus the
> target compiler, as can be seen by:
>=20
>   $ bitbake -g cryptsetup-native
>   $ grep 'cryptsetup.*linux-yocto' task-depends.dot
>   "cryptsetup-native.do_build" -> "linux-yocto.do_deploy"
>   "cryptsetup-native.do_build" -> "linux-yocto.do_package_write_rpm"
>   "cryptsetup-native.do_populate_sysroot" -> "linux-yocto.do_populate_sys=
root"
>   $ grep 'linux-yocto.*gcc-cross' task-depends.dot
>   "linux-yocto.do_kernel_configme" -> "gcc-cross-x86_64.do_populate_sysro=
ot"
>   "linux-yocto.do_prepare_recipe_sysroot" -> "gcc-cross-x86_64.do_populat=
e_sysroot"
>=20
> This also moves the runtime dependencies to near the end of the recipe,
> which is more customary.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  .../cryptsetup/cryptsetup_2.3.6.bb            | 25 ++++++++++---------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>=20
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb b/meta=
-
> oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
> index 562ac83fb..9e83b90ea 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
> @@ -16,10 +16,6 @@ DEPENDS =3D " \
>      util-linux-libuuid \
>  "
>=20
> -RDEPENDS_${PN} =3D " \
> -    libdevmapper \
> -"
> -
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').s=
plit('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
>  SRC_URI[md5sum] =3D "504d1ab22cbc4d1a59a8d8c7ee5ed3bf"
>  SRC_URI[sha256sum] =3D "b296b7a21ea576c2b180611ccb19d06aec8dddaedf7c704b=
0c6a81210c25635f"
> @@ -71,14 +67,6 @@ PACKAGECONFIG[kernel] =3D "--with-crypto_backend=3Dker=
nel"
>  PACKAGECONFIG[nettle] =3D "--with-crypto_backend=3Dnettle,,nettle"
>  PACKAGECONFIG[luks2] =3D "--with-default-luks-format=3DLUKS2,--with-defa=
ult-luks-format=3DLUKS1"
>=20
> -RRECOMMENDS_${PN} =3D "kernel-module-aes-generic \
> -                     kernel-module-dm-crypt \
> -                     kernel-module-md5 \
> -                     kernel-module-cbc \
> -                     kernel-module-sha256-generic \
> -                     kernel-module-xts \
> -"
> -
>  EXTRA_OECONF =3D "--enable-static"
>  # Building without largefile is not supported by upstream
>  EXTRA_OECONF +=3D "--enable-largefile"
> @@ -89,4 +77,17 @@ EXTRA_OECONF +=3D "--disable-libargon2"
>=20
>  FILES_${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','${ex=
ec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
>=20
> +RDEPENDS_${PN} =3D " \
> +    libdevmapper \
> +"
> +
> +RRECOMMENDS_${PN}_class-target =3D " \
> +    kernel-module-aes-generic \
> +    kernel-module-dm-crypt \
> +    kernel-module-md5 \
> +    kernel-module-cbc \
> +    kernel-module-sha256-generic \
> +    kernel-module-xts \
> +"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
