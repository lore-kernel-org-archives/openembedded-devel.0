Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 22AF07725C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 12:10:16 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so2503674wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 05:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Ca2/Kb/PJODLUmfUUjHCdYOB9UJ2TTx6NdOTlrLcJ4w=;
	b=kRBGhqQpxAH7u3w1Udxo4+dp706ewOCUAyO9NSDy+B/dK32yORiTQVfePpNgk3ugP8
	v9fSCSz91i0TdMszYWwtKPcD9QNWGROPI9RTj+A9cbWzTqwa0TTrWZ9vbl/cKCh0ZZwC
	xaaTON/qE9qnkfNWP52LzUT0Vpuzv/o/6bisq+C0MS0z8jcw77j2H69JQMS+kAeiDJkU
	hPac/BSOU4115DeI6lP6alk7Jar3l/zkjBkHesRmyLfGVnijRrIdpNKd63lEpwhtziXv
	X/9PJ1YtWne15HQ8eAcFs+OgpZa+jFCD0Qifdo3V0Rafg3PT/qbvvCZcKl2S2FOrVm7z
	aR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ca2/Kb/PJODLUmfUUjHCdYOB9UJ2TTx6NdOTlrLcJ4w=;
	b=azaW74Go7MsyMUgNQB2DPAwOuhNrm3r8SJZUTz79aCc/dWS7JNZKtwmo1C9unMI5CJ
	U+yYvmH4IFRnc0zf+HHIvsv1FyaVph4ocDEwHy1QCd6nsMEJJ3VpU+crPieeRr5gyK3g
	rhZeyHfVkGm/FXbGCzL3HvLPaaAbEIPP8DCHFJGMm7+gQcjb8RujW8ZW9G1DOejfmcr2
	W06+ldI9QzrFNFTVD4o5WqcxFpruvxya2M9ApfkLLr9uLFirkbfhnvWJ4uHRqAjM5BgZ
	EE1LOLg2wtKfLTzsucB/QrVqm2gKF69CET5c2IOBWVYllEc0sk5zMZTHV4c20c2rYjjV
	PY7A==
X-Gm-Message-State: AEkoouuPVR8n6g73PaMRM637kbCXYqZNs++ByQJviRCy4lQJVmO1WeIYYB8GTu1RwniSCA==
X-Received: by 10.194.142.198 with SMTP id ry6mr14916901wjb.62.1471003817097; 
	Fri, 12 Aug 2016 05:10:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	p83sm2301405wma.18.2016.08.12.05.10.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Aug 2016 05:10:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 12 Aug 2016 14:10:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160812121018.brfnx4jot7prdp7i@jama>
References: <1470827664-19568-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1470827664-19568-1-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] imagemagick: Add missing dependency
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
X-List-Received-Date: Fri, 12 Aug 2016 12:10:19 -0000
X-Groupsio-MsgNum: 62579
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ojo35nwxxvevapsi"
Content-Disposition: inline

--ojo35nwxxvevapsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 01:14:24PM +0200, Ricardo Ribalda Delgado wrote:
> graphviz is an optional library, but I did not find the correspondent
> with/without configure option. Instead I think that it is safer to add
> is as a DEPEND.

graphviz wasn't merged yet, still waiting for v3
http://lists.openembedded.org/pipermail/openembedded-devel/2016-May/107460.=
html

Also check if there is configure option for this in 7* version (upgrade
is on the ML already)

> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
> index a9f01344a9ff..3dc48ad425c6 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
> @@ -3,7 +3,7 @@ SECTION =3D "console/utils"
>  LICENSE =3D "ImageMagick"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0887b670be7ef0c3cb37092b64d57=
514"
>  # FIXME: There are many more checked libraries. All should be added or e=
xplicitly disabled to get consistent results.
> -DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freet=
ype"
> +DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freet=
ype graphviz"
> =20
>  # Important note: tarballs for all patchsets within a version are delete=
d when
>  # a new pachset is created. To avoid multiple patches for each patchset,=
 try to
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ojo35nwxxvevapsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAletvKkACgkQN1Ujt2V2gByQTwCeKeNqXjvlWlelpo9Os7sKc/26
2QMAnArHPGIxZBpsTQHx4aJ3lB6+WOeb
=xFRS
-----END PGP SIGNATURE-----

--ojo35nwxxvevapsi--
