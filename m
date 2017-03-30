Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id ACF2B77C17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:41:00 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k6so9121486wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=m4hWbFJAkIi2Z0Rgc3mPMU8xbUmZ5RbADdsy50fh+d8=;
	b=JctLvgLXs5XWcmeVPJ3LQXQ+OtTOcTPzY3VzLfk2NpdqRoVkcYUzRYlbvJzjgsPTeF
	R2hcfqyHSQOXqp/3JPKBK+iw4pUGfiX2S+1sMuvAJe8BrNLHVnC8jOOkRpE0GCx+ZTVW
	iNRXmQMMydhMpHW2pknbFcnFvETO876w7F5/pSRPpHkoTQTLMxs8HutcfnE1WOFAmDSp
	WnEqsqSazkUeHHwcGWat/Rk+YBRAUxFkbegtVVznxpgOHcibqI4zkkn+Qmt7cwxUYPOg
	mSWd/c8VGNkRZCBDSipz/OIrl3/KTvLQDEXKJfLrbgIdsibMzSZnMPhlZyz73+J0JHcJ
	cV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=m4hWbFJAkIi2Z0Rgc3mPMU8xbUmZ5RbADdsy50fh+d8=;
	b=M/MTI18eSz6DYippobgjMd8ae1ZF6WxWOVBw8pthZ2W88SVR5vQ0UFkTyYr3+xOL/6
	E19524oO1JtSIoNFYIETXS/8Eltdx/k2h2ljlgF5a58wWivSNSVo6XiFb2Ou1/00dISD
	V6XPm34gS8l3NmydUFL7pvOhTkYnwA1WBlpsXrh+mr6CSJqpxDLjpajoeBR3j+Gahm+8
	9+NsM/xg17xoFw0iizPt78nQNXFvtx8oyEIW1DZm4d/2GjGLR9eNj0XAaKWAde8IipRP
	cDZIqi1KEDrTDCXH4clQcCP4tWeNwYlKjFq4+kYhg3a69k9hAtgnCD7fyGY+y5oPq/kz
	rSMw==
X-Gm-Message-State: AFeK/H1r2tZvR4BloUC1527fDMcgiGPM2LNCrFDe26asAqsHZF9dbsYS5BJ8d0WcEV6mjQ==
X-Received: by 10.223.182.133 with SMTP id j5mr4825657wre.19.1490866861270;
	Thu, 30 Mar 2017 02:41:01 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id q4sm2522606wme.17.2017.03.30.02.41.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 Mar 2017 02:41:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Mar 2017 11:41:00 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170330094100.GB3060@jama>
References: <20170322184533.6501-1-raj.khem@gmail.com>
	<20170322184533.6501-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170322184533.6501-2-raj.khem@gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 02/10] netcat-openbsd: Fix build and whitelist
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
X-List-Received-Date: Thu, 30 Mar 2017 09:41:01 -0000
X-Groupsio-MsgNum: 65980
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline

--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2017 at 11:45:25AM -0700, Khem Raj wrote:
> pkgconfig is used so we need to inherit pkgconfig
> secondly, base64 support is added for it to work
> with musl
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...bundle-own-base64-encode-decode-functions.patch | 379 +++++++++++++++=
++++++
>  .../recipes-support/netcat/netcat-openbsd_1.105.bb |  22 +-
>  meta-networking/recipes-support/netcat/netcat.inc  |   2 +-
>  3 files changed, 395 insertions(+), 8 deletions(-)
>  create mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd=
/0001-bundle-own-base64-encode-decode-functions.patch
>=20
> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd/0001-b=
undle-own-base64-encode-decode-functions.patch b/meta-networking/recipes-su=
pport/netcat/netcat-openbsd/0001-bundle-own-base64-encode-decode-functions.=
patch
> new file mode 100644
> index 000000000..0966b6580
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd/0001-bundle-o=
wn-base64-encode-decode-functions.patch
> @@ -0,0 +1,379 @@
> +From ccd166b73eaae4dd1e1785c63ceb9b303568ed46 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>

=2E..

> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.=
bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> index bb21e0cfe..bb4e36c0a 100644
> --- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> @@ -2,20 +2,21 @@ require netcat.inc
>  SUMMARY =3D "OpenBSD Netcat"
>  HOMEPAGE =3D "http://ftp.debian.org"
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://../debian/copyright;md5=3Dee6bbaacb5db5f297=
3818f0902c3ae6f"
> +LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dee6bbaacb5db5f297381=
8f0902c3ae6f"
> =20
>  DEPENDS +=3D "glib-2.0 libbsd"
> +do_patch[depends] =3D "quilt-native:do_populate_sysroot"
> =20
>  SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}=
=2Eorig.tar.gz;name=3Dnetcat \
> -           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7=
=2Edebian.tar.gz;name=3Dnetcat-patch"
> +           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7=
=2Edebian.tar.gz;name=3Dnetcat-patch;subdir=3D${PN}-${PV} \
> +           file://0001-bundle-own-base64-encode-decode-functions.patch \
> +           "
> =20
>  SRC_URI[netcat.md5sum] =3D "7e67b22f1ad41a1b7effbb59ff28fca1"
>  SRC_URI[netcat.sha256sum] =3D "40653fe66c1516876b61b07e093d826e2a5463c5d=
994f1b7e6ce328f3edb211e"
>  SRC_URI[netcat-patch.md5sum] =3D "e914f8eb7eda5c75c679dd77787ac76b"
>  SRC_URI[netcat-patch.sha256sum] =3D "eee759327ffea293e81d0dde67921b7fcfc=
ad279ffd7a2c9d037bbc8f882b363"
> =20
> -S =3D "${WORKDIR}/${BPN}-${PV}"
> -
>  EXTRA_OEMAKE +=3D "'LDFLAGS=3D${LDFLAGS}'"
> =20
>  do_configure[noexec] =3D "1"
> @@ -23,9 +24,18 @@ do_configure[noexec] =3D "1"
>  netcat_do_patch() {
>      cd ${S}
>      quilt pop -a || true
> -    QUILT_PATCHES=3D${WORKDIR}/debian/patches QUILT_SERIES=3D${WORKDIR}/=
debian/patches/series quilt push -a
> +    if [ -d ${S}/.pc-netcat ]; then
> +            rm -rf ${S}/.pc
> +            mv ${S}/.pc-netcat ${S}/.pc
> +            QUILT_PATCHES=3D${S}/debian/patches quilt pop -a
> +            rm -rf ${S}/.pc ${S}/debian
> +    fi
> +    QUILT_PATCHES=3D${S}/debian/patches quilt push -a
> +    mv ${S}/.pc ${S}/.pc-netcat

Doesn't work here:
http://errors.yoctoproject.org/Errors/Details/138495/

>  }
> =20
> +do_unpack[cleandirs] +=3D "${S}"
> +
>  python do_patch() {
>      bb.build.exec_func('netcat_do_patch', d)
>      bb.build.exec_func('patch_do_patch', d)
> @@ -42,5 +52,3 @@ do_install() {
>      install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>  }
>  ALTERNATIVE_PRIORITY =3D "60"
> -
> -PNBLACKLIST[netcat-openbsd] ?=3D "Fails to build with RSS http://errors.=
yoctoproject.org/Errors/Details/130673/"
> diff --git a/meta-networking/recipes-support/netcat/netcat.inc b/meta-net=
working/recipes-support/netcat/netcat.inc
> index 91a24a106..15441645b 100644
> --- a/meta-networking/recipes-support/netcat/netcat.inc
> +++ b/meta-networking/recipes-support/netcat/netcat.inc
> @@ -9,7 +9,7 @@ connection you would need and has several interesting bui=
lt-in \
>  capabilities."
> =20
>  SECTION =3D "net"
> -inherit update-alternatives gettext
> +inherit update-alternatives gettext pkgconfig
> =20
>  ALTERNATIVE_${PN} =3D "nc"
> =20
> --=20
> 2.12.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWNzSrAAKCRA3VSO3ZXaA
HBJNAJ0dH2xKcj7ADcRiSGXXsthSV4nN0QCgmXYVxrJM7w4+20kpLpf5zJl/euU=
=UIQl
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
