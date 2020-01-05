Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3661A7DD6B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Jan 2020 20:34:17 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k40so40991585qtk.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Jan 2020 12:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S+fqhpDKwMtomWzmkiCGW+mOYGxEFrrnKk9Zd5Wi3ls=;
	b=VlAl7Ws7UabTxgo5I+22Lv21AHxh7S5DLNteo1nsfrpQBry2beyG7nMxkSzjA9NAAL
	b9Wl2b2DOK+fYV4Vd3frztDXu8kfFIVUs4ECJWpDPZsXBO+E3QOzMoTPFeSjCTvKg52s
	pFSbamvsMoqNS9iRjGm8ikUPbJO5B6yaYJuU7jP5jP+MrIRLWyx1I9iXdZnJgAc7+ZxH
	ut7Mr5gtDxVTtikoT7ioN/5pOIUgwIXK+KWfbjWBPo7/3wyW9yjyFOpeU2qOyV9l3yzM
	K582eHea18mSUq6GMMvKDPjjtXGV7viStRU62rNKES/cOm/z6r4sRZevWDpOLyGsIsjD
	H4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S+fqhpDKwMtomWzmkiCGW+mOYGxEFrrnKk9Zd5Wi3ls=;
	b=Gmx7mndUvoDy1uKNEeVaQ7PNBpDpTfRieLWedGI1cqQCmAxhC6farc8bnffAw1oLhR
	xWKKm5PljSGT4OtU+LFEaJE5cIzRYsd93xKsM6BRtYTbD4NBcExtmBvOjNky27YspfGK
	kXiztLnnfMkYD6936SdcIBKLey1ubarnuhl4ETbN1iYnHUiVrVV0MW3wC82dHcS2xmwU
	7g66qw7Oq2h+/NHfkMKaKYrDOeDmqEBun9aDTXHDHIcdVYiaJyTNCX+0RtlVvEsTuCqw
	IVHO1DqanrRJkDDlcntbFWUUUel+AUv7r8DJ0HVkvH3eFDCqR1uMspkUlfruQZNa9JKY
	LLBg==
X-Gm-Message-State: APjAAAXYvN5njlJ7lVt4qUrLplJiqw7rkiU+16X5ZRDXv/pHX0xgDU96
	fq9syEDUV0IeT73BT58CwFrPt8SZFUHMLbqCauFn5dKz
X-Google-Smtp-Source: APXvYqw+FiltMrAqFqKCa+n/aysO2IpQKCJWdGY9/S1dr93mvj40Xq0A11sWOJwv4Yo96XmYSqeFuiCfj8QI2T9qVUk=
X-Received: by 2002:ac8:7592:: with SMTP id s18mr63340694qtq.378.1578256457768;
	Sun, 05 Jan 2020 12:34:17 -0800 (PST)
MIME-Version: 1.0
References: <20200105164258.32759-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20200105164258.32759-1-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Jan 2020 12:33:51 -0800
Message-ID: <CAMKF1sr69SX-KN9GBXoaU8vdh1McmDTm7jL+RbjxqrhdXEfr+A@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/3] imagemagick: update from 7.8.47 to 7.9.16
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
X-List-Received-Date: Sun, 05 Jan 2020 20:34:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 5, 2020 at 8:43 AM Randy MacLeod
<Randy.MacLeod@windriver.com> wrote:
>
> Only the copyright date for the LICENSE file changed.
> Add PACKAGECONFIG to enable use of tcmalloc.
>

packageconfig disables it now by default, which is fine but I would
like to know what
is the defaults in general since this might be a change in behavior

> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../{imagemagick_7.0.8.bb => imagemagick_7.0.9.bb}         | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.0.8.bb => imagemagick_7.0.9.bb} (95%)
>
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
> similarity index 95%
> rename from meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb
> rename to meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
> index 4ee06d77f..3f7d06e26 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
> @@ -4,14 +4,14 @@ HOMEPAGE = "https://www.imagemagick.org/"
>  DESCRIPTION = "ImageMagick is a collection of tools for displaying, converting, and \
>  editing raster and vector image files. It can read and write over 200 image file formats."
>  LICENSE = "ImageMagick"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=05ff94b3ff59fe6fa7489fa26e3d9142"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=41b4fa9af60c88e61484b02c0561181a"
>  # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
>  DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
>
>  BASE_PV := "${PV}"
> -PV .= "_47"
> +PV .= "_13"
>  SRC_URI = "git://github.com/ImageMagick/ImageMagick.git "
> -SRCREV = "b672df7a44b0ab0219b1fa78b3673c2810ddd374"
> +SRCREV = "15b935d64f613b5a0fc9d3fead5c6ec1b0e3908f"
>
>  S = "${WORKDIR}/git"
>
> @@ -29,6 +29,7 @@ PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
>  PACKAGECONFIG[openjpeg] = "--with-openjp2,--without-openjp2,openjpeg"
>  PACKAGECONFIG[pango] = "--with-pango,--without-pango,pango cairo"
>  PACKAGECONFIG[rsvg] = "--with-rsvg,--without-rsvg,librsvg"
> +PACKAGECONFIG[tcmalloc] = "--with-tcmalloc=yes,--with-tcmalloc=no,gperftools"
>  PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
>  PACKAGECONFIG[wmf] = "--with-wmf,--without-wmf,libwmf"
>  PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxt"
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

