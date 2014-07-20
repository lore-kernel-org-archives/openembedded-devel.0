Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 19CB770264
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 19:53:28 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so3080424wiv.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 12:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J7AUhSgE4rpTXhBFcDs2IxK8XqS5FgqBPMY8pxA7tXY=;
	b=FQG50FNCkuUSvQymfcKG/K7wVH/6hJ6LxVB+rC5hCEPEDG69+OXb94qiWdkox8CfKS
	B5g96SQ8dJ14TQiN1EsPxGOZdj/mJ6B4z3tktrn+sZisa6MDCUL4sPMVDoqd7iExbgdF
	F0ljtHB63thrI3ZLScgiYsG8FaYYdF0a0FvuHZh4nyGYoERFBUR7yMAn2NyZb5TGwTby
	NAL+TILkQpsearWFwI1St3EWmDdPB3EMaXN2U1t/aF1Xl8cl6Y+lIXygMy5FeqcsaHa6
	hI8Sk1wLji9V6pP46DYCkQ2NBVtXwOXstpv7PS6fOixUEpM4FsDp4gKINo7s6EakLRW2
	t5sg==
X-Received: by 10.194.158.101 with SMTP id wt5mr6634435wjb.136.1405886009385; 
	Sun, 20 Jul 2014 12:53:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pq9sm31962966wjc.35.2014.07.20.12.53.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 12:53:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 20 Jul 2014 21:53:43 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140720195343.GE22875@jama>
References: <1405883786-26358-1-git-send-email-TicoTimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1405883786-26358-1-git-send-email-TicoTimo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] imagemagick: add some PACKAGECONFIG, fix unrecognized --without-jp2 option
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
X-List-Received-Date: Sun, 20 Jul 2014 19:53:29 -0000
X-Groupsio-MsgNum: 51127
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17/8oYur5Y32USnW"
Content-Disposition: inline

--17/8oYur5Y32USnW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2014 at 12:16:26PM -0700, Tim Orling wrote:
> * Add PACKAGECONFIG for lzma, pango, webp, wmf
>=20
> Change in v2:
> * libwmf is currently blacklisted, so #comment it out

I like v1 more, because explicitly disable libwmf is better than
floating.

> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
> index e261eb8..4b52568 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "ImageMagick is an image convertion tools"
>  SECTION =3D "console/utils"
>  LICENSE =3D "ImageMagick"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d84c6ddd4028aa53d028b4c50f93=
61e"
> -# FIXME: There is much more checked libraries. All should be added or ex=
plicitly disabled to get consistent results.
> +# FIXME: There are many more checked libraries. All should be added or e=
xplicitly disabled to get consistent results.
>  DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
> =20
>  PATCHSET =3D "10"
> @@ -21,7 +21,12 @@ inherit autotools binconfig pkgconfig
>  EXTRA_OECONF =3D "--program-prefix=3D --program-suffix=3D.im6 --without-=
x --without-perl --disable-openmp --without-xml --disable-opencl"
> =20
>  PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[jp2] =3D "--with-jp2,--without-jp2,jasper"
> +PACKAGECONFIG[jp2] =3D "--with-jp2,,jasper"
> +PACKAGECONFIG[lzma] =3D "--with-lzma,--without-lzma,xz"
> +PACKAGECONFIG[pango] =3D "--with-pango,--without-pango,pango cairo"
> +PACKAGECONFIG[webp] =3D "--with-webp,--without-webp,libwebp"
> +# libwmf is currently blacklisted
> +#PACKAGECONFIG[wmf] =3D "--with-wmf,--without-wmf,libwmf"
> =20
>  FILES_${PN} +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
>                  ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--17/8oYur5Y32USnW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPMHkcACgkQN1Ujt2V2gBwUAQCbBUMNHMUJyfzmL6DTaewlghx9
l/8An1uZTutEOcYCpEd7RNNnhZ1kUkwQ
=oOTt
-----END PGP SIGNATURE-----

--17/8oYur5Y32USnW--
