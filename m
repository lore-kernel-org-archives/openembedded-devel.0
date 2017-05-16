Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 89F3477DB6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 20:21:02 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w50so15267481wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 13:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Ctl4+e7P3VEtleVOoVhORJId2yWgCC+F4gsgLC7wh10=;
	b=fvehxbaMmW3qxKjm5/E0qft6Ns5n8/ymelv+M+vWMaMifc4RhXu1nC+fKCA0jtIMb2
	bRe789fOPaYnJerWTt5FjyfCEOcLMNw16YRAiq5a1JrlhoKe64HdTQgMBHcNngdtzd33
	bvZZUull1GaR742k3WoyafIh91RrPwbCW89cAzv9UlF0WVb3jdMMhEyKLnGrbWXs3bg+
	HD6NrR2ymkqnTIqhNoFu9zAeIDMwn0tdKPHJ4mj78lAH2P5qNkDMlO/7FuSgIRzNK3Rs
	S7vrT/jonT0LYI5+5b7t6ywPuYYIl8hz1yzNqK2vQUwtsXRSg2iJofgpsQGWmFoyyPId
	N0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ctl4+e7P3VEtleVOoVhORJId2yWgCC+F4gsgLC7wh10=;
	b=RX8ya78u4jl+u8YVMLq0cLhQ0jQCJ6AUNUs62pt5xH3RowLrd05XZeHb5xzdg59BYb
	B745KifAWksHQ73CJPdGKEbRSvjiTBQ3S0ZyaizlBEl3ZOPydzcGB5jRUUBCjISO8owV
	s7Rysft5DQYjTfKtDQSOjozJaAEbnkjC+N87EEaxLEL7xdC+aj3AWF7no6GAkhpIVYbS
	jiq+JGcO6IofTasOwJGmGPlCk1E3Ew+00cmF5exM/JjG02xSttv0haUu+16T6larqbH5
	16T0Nw2DF394QTU2KoKGTshafTzr7eBc/gQNSBtJvJfpEEr/Yboj9wU962U3YBxCfFxD
	5nnQ==
X-Gm-Message-State: AODbwcDFh9hRPCzdWzfmPMRnN6QwXMFkvAU/fPGbyisl5UPyQn/hO2pi
	2UBelmBmqhVXOw==
X-Received: by 10.223.169.78 with SMTP id u72mr8476926wrc.193.1494966062967;
	Tue, 16 May 2017 13:21:02 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	f70sm4440714wmd.25.2017.05.16.13.21.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 May 2017 13:21:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 16 May 2017 22:21:52 +0200
To: Marek Belisko <marek.belisko@open-nandra.com>
Message-ID: <20170516202152.GA3119@jama>
References: <1494964615-15539-1-git-send-email-marek.belisko@open-nandra.com>
MIME-Version: 1.0
In-Reply-To: <1494964615-15539-1-git-send-email-marek.belisko@open-nandra.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] recipes-support: Add handling for libgpiod
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
X-List-Received-Date: Tue, 16 May 2017 20:21:02 -0000
X-Groupsio-MsgNum: 66767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2017 at 09:56:55PM +0200, Marek Belisko wrote:
> libgpiod - C library and tools for interacting with the linux GPIO
> character device
>=20
> Since linux 4.8 the GPIO sysfs interface is deprecated.
> User space should use the character device instead.
> This library encapsulates the ioctl calls and data structures behind a
> straightforward API.
>=20
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb | 25 ++++++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb
>=20
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_0.2.bb
> new file mode 100644
> index 0000000..fe2cd80
> --- /dev/null
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_0.2.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "C library and tools for interacting with the linux GPIO cha=
racter device"
> +HOMEPAGE =3D "https://github.com/brgl/libgpiod"
> +
> +LICENSE =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2caced0b25dfefd4c601d92bd1511=
6de"
> +
> +UPSTREAM_CHECK_URI =3D "https://github.com/brgl/libgpiod/releases"
> +
> +SRC_URI =3D "https://github.com/brgl/libgpiod/archive/v${PV}.tar.gz"

Github archives are regenerated from time to time with different
checksums, please use git fetcher and SRCREV matching with the SHA of
the tag.

> +
> +SRC_URI[md5sum] =3D "e3430f35b6efa842693d659c0bfb7ad5"
> +SRC_URI[sha256sum] =3D "de1947f3cb2cc4174364af430309fe6238976658575655bd=
bd76c60cffa7df92"
> +
> +inherit autotools pkgconfig
> +
> +# enable tools
> +PACKAGECONFIG ?=3D "tools"
> +
> +PACKAGECONFIG[tests] =3D "--enable-tests,--disable-tests,kmod udev"
> +PACKAGECONFIG[tools] =3D "--enable-tools,--disable-tools,"
> +
> +PACKAGES +=3D " ${PN}-tools"
> +
> +FILES_${PN} =3D "${libdir}/*"

What is missing in the default FILES_${PN}?

> +FILES_${PN}-tools =3D "${bindir}/*"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWRtfVAAKCRA3VSO3ZXaA
HGkLAKCgRQ1aveiJerM41VuGHkGLKCFJYQCgoySpR7i5iIV1PMmMT8zdHl/HIIw=
=GEpT
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
