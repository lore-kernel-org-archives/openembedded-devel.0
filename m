Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5A72F6AFFE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 10:25:26 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so2187642ead.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RhmdNjuiAHKmjR9K7M664A40dgedDDjRVVjo45rNop4=;
	b=Pt8Z3FMBXhbaJqG8w/dEI/zVpsXmwMZcPxs7+pjLcb6Tly8WILiXorWVaIX80iFJdM
	+VHhboNFr0s4mlXYhmLygwkJb1kR0C6fFvvTe4sJkbyK1OQZzaCLsf1oBsOI52aIl09K
	H+s91dtBJjQAi+7IqzfkrImNNOqJgnokSrTo2pZmD4Jj34jNX/zh32pw2PIyu2GqVhi8
	IuoylzZXXVzmLdawCw4tDfnjOpyM6cni6ZbRj6W0S18G3H+nCDjxzF5kRNm0GK87DQ+3
	m3I0wGHskoajspUTjl0vsQVo7yrhiWkhpu2DcU+KGvQCXtNbgn63sjGCNUb54FsMxtmk
	lZ4A==
X-Received: by 10.14.37.4 with SMTP id x4mr21760527eea.16.1376907926015;
	Mon, 19 Aug 2013 03:25:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id i1sm2455683eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 19 Aug 2013 03:25:25 -0700 (PDT)
Date: Mon, 19 Aug 2013 12:26:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130819102620.GA522@jama>
References: <1376647801-30792-1-git-send-email-cazfi74@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1376647801-30792-1-git-send-email-cazfi74@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] ImageMagick: update to upstream version 6.8.6-8
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
X-List-Received-Date: Mon, 19 Aug 2013 10:25:26 -0000
X-Groupsio-MsgNum: 45776
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2013 at 01:10:01PM +0300, Marko Lindqvist wrote:
> - License changed by additional copyright year only.
> - Patch PerlMagic_MakePatch.patch part of upstream now

Looks good now, do you still need freetype support?
http://patchwork.openembedded.org/patch/51217/

It would be better implemented as PACKAGECONFIG but I'm OK with it.

> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>  .../imagemagick/imagemagick-6.7.5/PerlMagic_MakePatch.patch |   11 -----=
------
>  .../remove.dist-lzip.patch                                  |    0
>  .../{imagemagick_6.7.5.bb =3D> imagemagick_6.8.6.bb}          |   11 +++=
+-------
>  3 files changed, 4 insertions(+), 18 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.7.5=
/PerlMagic_MakePatch.patch
>  rename meta-oe/recipes-support/imagemagick/{imagemagick-6.7.5 =3D> image=
magick-6.8.6}/remove.dist-lzip.patch (100%)
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_6.7.5.bb =3D> im=
agemagick_6.8.6.bb} (83%)
>=20
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMa=
gic_MakePatch.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5=
/PerlMagic_MakePatch.patch
> deleted file mode 100644
> index f8ad0af..0000000
> --- a/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMagic_Mak=
ePatch.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- /tmp/Makefile.PL.in	2008-10-01 10:39:38.000000000 +0200
> -+++ ImageMagick-6.4.4/PerlMagick/Makefile.PL.in	2008-10-01 10:40:25.0000=
00000 +0200
> -@@ -87,6 +87,8 @@
> -=20
> -    # Use same compiler as ImageMagick
> -    'PERLMAINCC'	=3D> '@PERLMAINCC@ @OPENMP_CFLAGS@',
> -+   'AR' =3D> '@AR@',
> -+   'LD' =3D> '@PERLMAINCC@',
> -=20
> -    # Set Perl installation prefix to ImageMagick installation prefix
> - #   'PREFIX'	=3D> '@prefix@',
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/remove=
=2Edist-lzip.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.8.6/=
remove.dist-lzip.patch
> similarity index 100%
> rename from meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/remove.=
dist-lzip.patch
> rename to meta-oe/recipes-support/imagemagick/imagemagick-6.8.6/remove.di=
st-lzip.patch
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
> similarity index 83%
> rename from meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
> rename to meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
> index 2f0fad5..4b55ae8 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
> @@ -1,19 +1,16 @@
>  DESCRIPTION =3D "ImageMagick is an image convertion tools"
>  SECTION =3D "console/utils"
>  LICENSE =3D "ImageMagick"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D944f66dcedc98d5a4e5d964bd3b32=
e7b"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db1bf06a8d02cb00b02dea7d03ef95=
25f"
>  # FIXME: There is much more checked libraries. All should be added or ex=
plicitly disabled to get consistent results.
>  DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib fftw"
> =20
> -PR =3D "r5"
> -
> -PATCHSET =3D "6"
> +PATCHSET =3D "8"
>  SRC_URI =3D "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATC=
HSET}.tar.bz2 \
> -           file://PerlMagic_MakePatch.patch \
>             file://remove.dist-lzip.patch \
>  "
> -SRC_URI[md5sum] =3D "bcf07cf0822572fa2b47fa6d506f699a"
> -SRC_URI[sha256sum] =3D "d9347f31d3d35b40009e1bbcf713c5ad252411e05ee621d5=
a7dae01e47bdbd80"
> +SRC_URI[md5sum] =3D "ea66fbb6fc1354312bc4971c0a0cfb3c"
> +SRC_URI[sha256sum] =3D "eb33e0ba6aeb542b7127ee1c2f62961236428b233e9911aa=
86e1b66b3342ea1d"
> =20
>  S =3D "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
> =20
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIR8swACgkQN1Ujt2V2gByjlQCfXNQ25vf0dCnRuZmHZiER8chq
xykAnjZTmQiXudveim+sRshDGLGAGt+E
=xXDD
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
