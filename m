Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3E28371E4A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jan 2017 11:04:29 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r144so12907240wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jan 2017 03:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GXbVDkopVLNz4WpNRFxk5XLMmwthVytU1cJrUxDXXkM=;
	b=awYb7LyxKFq9tNLZ+wCs5jK+JLJFtQS3/xCjsXQI4Gc3SBNs34BmGOCm/81YLi4bDv
	/jno7Mh+XQya79exrFCM73yhF7y1lGM/eOAI6eWPgnFoFkZGckGguiH6melGiNEZUjyu
	+SHTuXvM/8PLgvXfnz+ht3Q2+n3anNK88/TQ1bSZytyR6awNIhY4XmQzWwppjwhvrX2n
	KeXVrxxqDPdWVgeVw5IMbbNkLg3fSzOxZHbc8RLdOcCP0PnbTR9B0NAhBzMN3i32jDMv
	4y2K3x0uLDICiwZ6Hv815sGGlT0ee3A4FNQcwXSsyf073s22ac2/EcseLtkAfHpNZPJ8
	rNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GXbVDkopVLNz4WpNRFxk5XLMmwthVytU1cJrUxDXXkM=;
	b=CHP187PRUVHq4WtHATGdmIkiE57G9mbpd3GWLyQgjrGFUmjwLA0L7v4E4Pnr/Of+39
	UIW3RxMLOMsop/a+A+zUPqR4bRnZX+pLlUlM6QIhkiS0zKPfX7yljLTsqXlr8y7ir4vD
	YLCyeRJzx3gjzjodsvVRg/Xb6n0sUTXm8oIzW07Qj3hGRLmx7J2d3C3oLsA5XpcIMdrT
	zrd8XhaWaXbLWORJQBq/3wVVXIIbJwRtJPZjeyDYjVgRn+PQYxwvWDOw+AJRBFrrufGK
	OuDZc/MNU5U2mJQMS1Ykel4jEOuLibWsw6ljjrauQwE1EQiZPVIUW/pRtjhGFi0eOXn4
	N8tA==
X-Gm-Message-State: AIkVDXJhnExSZBP8naqPNJXIFFst6jEUC76eohCj5Xm3ENa/Lhj0zuVJCiVDCUWniQ+kGA==
X-Received: by 10.223.150.183 with SMTP id u52mr15439689wrb.180.1484996669787; 
	Sat, 21 Jan 2017 03:04:29 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l74sm10425910wmg.2.2017.01.21.03.04.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 21 Jan 2017 03:04:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Jan 2017 12:04:29 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170121110429.GA3026@jama>
References: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [PATCH 1/9] onboard: initial add 1.3.0
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
X-List-Received-Date: Sat, 21 Jan 2017 11:04:30 -0000
X-Groupsio-MsgNum: 64822
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2017 at 08:53:24AM +0100, Andreas M=FCller wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-support/onboard/onboard_1.3.0.bb | 25 ++++++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-support/onboard/onboard_1.3.0.bb
>=20
> diff --git a/meta-oe/recipes-support/onboard/onboard_1.3.0.bb b/meta-oe/r=
ecipes-support/onboard/onboard_1.3.0.bb
> new file mode 100644
> index 0000000..82393c3
> --- /dev/null
> +++ b/meta-oe/recipes-support/onboard/onboard_1.3.0.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "An onscreen keyboard"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING.GPL3;md5=3D8521fa4dd51909b407c51504=
98d34f4e"
> +
> +DEPENDS +=3D "gtk+3 hunspell libcanberra libxkbfile dconf"

It depends on dconf which is in meta-gnome and meta-oe cannot depend on
meta-gnome.

Can you move this to meta-gnome as well?

> +SRC_URI =3D "https://launchpad.net/onboard/1.3/${PV}/+download/${BPN}-${=
PV}.tar.gz"
> +SRC_URI[md5sum] =3D "8000df3e789512a90fcb227580fd60ff"
> +SRC_URI[sha256sum] =3D "fd74b54b8bd7a075cf5f6e1a8ca3e6de5cd2663507adb690=
d7b1a85e71afa2e4"
> +
> +inherit setuptools3 pkgconfig gtk-icon-cache gsettings
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/icons \
> +    ${datadir}/gnome-shell \
> +    ${datadir}/help \
> +"
> +
> +RDEPENDS_${PN} +=3D " \
> +    ncurses \
> +    python3-dbus \
> +    python3-pycairo \
> +    python3-pygobject \
> +"
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

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWINAPAAKCRA3VSO3ZXaA
HOC/AKC3I+dEAFIj7ErKA/X/SoDzD823GwCglOf4z87heQz4/08iDuTYGxvDSRo=
=qIAe
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
