Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id D716F61FEC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 16:05:06 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d41so2700084eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 09:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Z1q8vz4Hu1m7prFs+Cs2Xw8YpeBjL4I5cPWvGKGXT+s=;
	b=lImIusYoNLhiRZXvQSCNcU/kbKY6qVgy6+e0ilE/Igm5oNjF3bP2gpyEqw3w8Qog0z
	GWIex761xyAm/8PYQy7ESSrxg+ybENqBUhqC0dapncFd4t7QTgUUS6/O0HUuaI/3mZPs
	BNjEFUPhihgK3fnJTV33/cNBtdU+c8w0xS2SX1uD9Wwl4MmZJc0+lE32CDNLteTan9Xx
	kPuJU6Rv/ZmvuG2S82B06jAJyaY0JaU0vilYeMNdWUQ0nXC5qGln65rGlzUKbLtQW2oC
	4fJNfWSkrCuvOX1jLgieRlCTpc0aTUF3IKtYCHgLP8BOQBvY6BFca/TkWYcoLPx3ZoE3
	MkIg==
X-Received: by 10.14.107.200 with SMTP id o48mr17139507eeg.35.1370966707491;
	Tue, 11 Jun 2013 09:05:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a5sm31264179ees.6.2013.06.11.09.05.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 09:05:06 -0700 (PDT)
Date: Tue, 11 Jun 2013 18:05:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130611160530.GJ3233@jama>
References: <1370502445-22258-1-git-send-email-cazfi74@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1370502445-22258-1-git-send-email-cazfi74@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/2] imagemagick: update to upstream version 6.8.5-9
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
X-List-Received-Date: Tue, 11 Jun 2013 16:05:07 -0000
X-Groupsio-MsgNum: 45039
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+Hr//EUsa8//ouuB"
Content-Disposition: inline

--+Hr//EUsa8//ouuB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2013 at 10:07:24AM +0300, Marko Lindqvist wrote:
> LICENSE: 2013 added to (c) years
>=20
> PerlMagic_MakePatch.patch now part of upstream
>=20
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>  .../imagemagick/imagemagick-6.7.5/PerlMagic_MakePatch.patch |   11 -----=
------
>  .../remove.dist-lzip.patch                                  |    0
>  .../{imagemagick_6.7.5.bb =3D> imagemagick_6.8.5.bb}          |   11 +++=
+-------
>  3 files changed, 4 insertions(+), 18 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.7.5=
/PerlMagic_MakePatch.patch
>  rename meta-oe/recipes-support/imagemagick/{imagemagick-6.7.5 =3D> image=
magick-6.8.5}/remove.dist-lzip.patch (100%)
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_6.7.5.bb =3D> im=
agemagick_6.8.5.bb} (83%)

Creates new QA issues which need to be fixed before merge:

imagemagick-6.8.5: imagemagick: Files/directories were installed but not sh=
ipped
  /usr/lib/ImageMagick-6.8.5
  /usr/lib/ImageMagick-6.8.5/config-Q16
  /usr/lib/ImageMagick-6.8.5/config-Q16/configure.xml
  /usr/share/ImageMagick-6
  /usr/share/ImageMagick-6/locale.xml
  /usr/share/ImageMagick-6/francais.xml
  /usr/share/ImageMagick-6/english.xml

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
=2Edist-lzip.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.8.5/=
remove.dist-lzip.patch
> similarity index 100%
> rename from meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/remove.=
dist-lzip.patch
> rename to meta-oe/recipes-support/imagemagick/imagemagick-6.8.5/remove.di=
st-lzip.patch
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_6.8.5.bb
> similarity index 83%
> rename from meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
> rename to meta-oe/recipes-support/imagemagick/imagemagick_6.8.5.bb
> index 2f0fad5..6cb3b4a 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.5.bb
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
> +PATCHSET =3D "9"
>  SRC_URI =3D "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATC=
HSET}.tar.bz2 \
> -           file://PerlMagic_MakePatch.patch \
>             file://remove.dist-lzip.patch \
>  "
> -SRC_URI[md5sum] =3D "bcf07cf0822572fa2b47fa6d506f699a"
> -SRC_URI[sha256sum] =3D "d9347f31d3d35b40009e1bbcf713c5ad252411e05ee621d5=
a7dae01e47bdbd80"
> +SRC_URI[md5sum] =3D "27b3b24a1a86aedade11820f108289e5"
> +SRC_URI[sha256sum] =3D "b88ac6551619837fc226c4c878ddc1f0adb106644cefbc88=
bb02abd55706b3fc"
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

--+Hr//EUsa8//ouuB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG3SsoACgkQN1Ujt2V2gBx6nACffr6ksYa/qF8sLdqwdnJYpRqI
jQAAoLBYFxtBOW58bQ+/g6HAN4OESCuo
=OqCw
-----END PGP SIGNATURE-----

--+Hr//EUsa8//ouuB--
