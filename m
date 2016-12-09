Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA0B71975
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Dec 2016 21:42:03 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id he10so3990924wjc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2016 13:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NflwpRzA2MIGVF5JVUdawzYTdjX+dd+7dcPEWH8JQcM=;
	b=rUrEQCGHQKw/HgnHhor+cJ4M5Dp66RaAdHDiKLLtkv5Lkd1T33bSgAY2RyYYModmjv
	yhJWng/i4Nrn4xUoQmn5oLwHWeievpwvsbW7PgcLxrgs5YruQhA105DrWqLOnQl8Eul2
	J5d0m6CrwY+UJch/OArxSSR9ykQq5ml7zkUVOKzu53gWMKesRWobdbzo3Bg9l6kbpfZe
	5dM4aEaQVx3MrPhg0IXvxXXm9xrU2zWHU99QaAwGW3GvZ6goITXBAY4dI2vn0XKaG0C3
	gt5FBumDhrSsj7V0fW/CRN/LiCo1BbaxmYHMh2s1E9TxfpI8JKKds6/g+hXITl4DNLt6
	4aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NflwpRzA2MIGVF5JVUdawzYTdjX+dd+7dcPEWH8JQcM=;
	b=YcvN3D3P5zzPihlSWLAOTiuxAtjouysjD9vUOtjLvGOBY/C1qBw2l8EtY838mhF06f
	5Q4vvMF6FwW/ieagRouD/tNV/IFGyuoPCFGN9yGchaWhErOMS4PD0hKlSwM7IaW1QEZQ
	8WOFgLpKZVjlEvMFgiBUBRJnhkCOUXOS+hbZZE5pV+P8f2/FmjVT7hTsagq928DlE3U0
	shxBkxKmNLgZj6s/HaQQY9NgdgW8Tb7wgPVez15//jEigaAFi3a2m3d3MXEpLVf9vXIA
	BhWIoAe6zRXumWWRadvUUiggy0yALELOzx1tL7GPADSgyD1RwU1LrvXS+4iA5gMFY7HZ
	B0eg==
X-Gm-Message-State: AKaTC01XV+KUkEHnkDfa/owmYLYv0V9x7Uprg9OvB7BkQ7CGwlloKWi43rpwhoWKEyYZZg==
X-Received: by 10.194.31.201 with SMTP id c9mr70349978wji.176.1481319724643;
	Fri, 09 Dec 2016 13:42:04 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	a13sm22640713wma.18.2016.12.09.13.42.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Dec 2016 13:42:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Dec 2016 22:42:05 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161209214205.GG3327@jama>
References: <20161203030422.17285-1-raj.khem@gmail.com>
	<20161203030422.17285-4-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161203030422.17285-4-raj.khem@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH 4/8] libmng: Add recipe
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
X-List-Received-Date: Fri, 09 Dec 2016 21:42:05 -0000
X-Groupsio-MsgNum: 64278
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xs+9IvWevLaxKUtW"
Content-Disposition: inline

--xs+9IvWevLaxKUtW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2016 at 07:04:18PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb | 22 +++++++++++++++++++=
+++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb

gimp-2.8.18: gimp rdepends on libmng, but it isn't a build dependency,
missing libmng in DEPENDS or PACKAGECONFIG? [build-deps]

>=20
> diff --git a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb b/meta-oe/re=
cipes-graphics/libmng/libmng_2.0.3.bb
> new file mode 100644
> index 0000000..b176d09
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
> @@ -0,0 +1,22 @@
> +# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION =3D "Development files for the Multiple-image Network Graphi=
cs library"
> +HOMEPAGE =3D "http://www.libmng.com/"
> +LICENSE =3D "Zlib"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D32becdb8930f90eab219a8021130e=
c09"
> +SECTION =3D "devel"
> +DEPENDS =3D "zlib lcms"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${P}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "7e9a12ba2a99dff7e736902ea07383d4"
> +SRC_URI[sha256sum] =3D "cf112a1fb02f5b1c0fce5cab11ea8243852c139e669c4401=
4125874b14b7dfaa"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +PACKAGECONFIG ??=3D "jpeg"
> +
> +PACKAGECONFIG[jpeg] =3D "--with-jpeg,--without-jpeg,libjpeg-turbo"
> +PACKAGECONFIG[lcms] =3D "---with-lcms2,--without-lcms2,lcms"
> +
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xs+9IvWevLaxKUtW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEslLAAKCRA3VSO3ZXaA
HLIGAKCNBwxxNzWoEJHnwQFBRKo5sASOuQCfWbIrOR971MxUhO81m6/eK4+vxkk=
=v9j1
-----END PGP SIGNATURE-----

--xs+9IvWevLaxKUtW--
