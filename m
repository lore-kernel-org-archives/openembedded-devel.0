Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RzOQ9-00016t-E1
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 09:16:29 +0100
Received: by eaal10 with SMTP id l10so1762176eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 00:08:12 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.14.193 as permitted sender) client-ip=10.213.14.193; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.14.193 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.14.193])
	by 10.213.14.193 with SMTP id h1mr2142036eba.44.1329725292099 (num_hops
	= 1); Mon, 20 Feb 2012 00:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5pWXKlOt2xs5ex8uUKe2UsteTcKBqIpeuuGaDdkmt+Q=;
	b=qwUhu0hxdpzHHYy4ixgs8za6ybMu0fc6wApvg/jbeKLYp2W+IWd3uvSLVzKpQ5Go0O
	341tJa6zhrFOq2DMUvlg2hcI8PHKRyX7nA13zuWDwYaCh6TAItlJps3F8lwvmA79IR8/
	I3GVP/7lV07gsZQpKzyi4KDaB/olSnmP1CLZg=
Received: by 10.213.14.193 with SMTP id h1mr1695212eba.44.1329725291974;
	Mon, 20 Feb 2012 00:08:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm74988114eea.5.2012.02.20.00.08.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Feb 2012 00:08:11 -0800 (PST)
Date: Mon, 20 Feb 2012 09:08:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120220080809.GE3953@jama.jama.net>
References: <1329724469-2002-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1329724469-2002-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe 1/2] imagemagick: upgrade to latest stable version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Feb 2012 08:16:29 -0000
X-Groupsio-MsgNum: 37247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline

--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2012 at 08:54:28AM +0100, Eric B=E9nard wrote:
> - 6.4.4 doesn't compile following zlib upgrade to 1.26
> - hack configure.ac to remove lzip requirement for autoconf (which
> is not present in OE and not needed for compiling imagemagick)

can you compare with
http://patchwork.openembedded.org/patch/21285/
?

Cheers,

>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  .../imagemagick-6.4.4/PerlMagic_MakePatch.patch    |   11 ------
>  .../imagemagick-6.7.5/PerlMagic_MakePatch.patch    |   11 ++++++
>  .../imagemagick/imagemagick_6.4.4.bb               |   38 --------------=
------
>  .../imagemagick/imagemagick_6.7.5.bb               |   37 ++++++++++++++=
+++++
>  4 files changed, 48 insertions(+), 49 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.4.4=
/PerlMagic_MakePatch.patch
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.7.5=
/PerlMagic_MakePatch.patch
>  delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick_6.4.4=
=2Ebb
>  create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick_6.7.5=
=2Ebb
>=20
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMa=
gic_MakePatch.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.4.4=
/PerlMagic_MakePatch.patch
> deleted file mode 100644
> index f8ad0af..0000000
> --- a/meta-oe/recipes-support/imagemagick/imagemagick-6.4.4/PerlMagic_Mak=
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
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMa=
gic_MakePatch.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5=
/PerlMagic_MakePatch.patch
> new file mode 100644
> index 0000000..f8ad0af
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMagic_Mak=
ePatch.patch
> @@ -0,0 +1,11 @@
> +--- /tmp/Makefile.PL.in	2008-10-01 10:39:38.000000000 +0200
> ++++ ImageMagick-6.4.4/PerlMagick/Makefile.PL.in	2008-10-01 10:40:25.0000=
00000 +0200
> +@@ -87,6 +87,8 @@
> +=20
> +    # Use same compiler as ImageMagick
> +    'PERLMAINCC'	=3D> '@PERLMAINCC@ @OPENMP_CFLAGS@',
> ++   'AR' =3D> '@AR@',
> ++   'LD' =3D> '@PERLMAINCC@',
> +=20
> +    # Set Perl installation prefix to ImageMagick installation prefix
> + #   'PREFIX'	=3D> '@prefix@',
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
> deleted file mode 100644
> index d5f95c9..0000000
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -DESCRIPTION =3D "ImageMagick is an image convertion tools"
> -SECTION =3D "console/utils"
> -LICENSE =3D "ImageMagick"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De1ebcc1358b9f81eba64255fc5da6=
892"
> -# FIXME: There is much more checked libraries. All should be added or ex=
plicitly disabled to get consistent results.
> -DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib"
> -
> -PR =3D "r10"
> -
> -PATCHSET =3D "1"
> -SRC_URI =3D "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATC=
HSET}.tar.bz2 \
> -           file://PerlMagic_MakePatch.patch \
> -          "
> -SRC_URI[md5sum] =3D "882ff241f6ad39655541d5055596f93b"
> -SRC_URI[sha256sum] =3D "5a5b2779707bfd9816cf17d8f53d242c05005092da192a89=
8ac10961b3b19dda"
> -
> -S =3D "${WORKDIR}/ImageMagick-${PV}"
> -
> -inherit autotools binconfig pkgconfig
> -
> -EXTRA_OECONF =3D "--program-prefix=3D --without-x --without-freetype --w=
ithout-perl --disable-openmp"
> -
> -FILES_${PN} +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
> -                ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
> -                ${libdir}/ImageMagick-${PV}/config/ \
> -                ${datadir}/ImageMagick-${PV}"
> -
> -FILES_${PN}-dev +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.a"
> -
> -FILES_${PN}-dbg +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/.debug/*"
> -
> -BBCLASSEXTEND =3D "native"
> -
> -LEAD_SONAME =3D "libMagickCore.so.*"
> -
> -do_configure_prepend() {
> -    export ac_cv_sys_file_offset_bits=3Dyes
> -}
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
> new file mode 100644
> index 0000000..9b8b799
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION =3D "ImageMagick is an image convertion tools"
> +SECTION =3D "console/utils"
> +LICENSE =3D "ImageMagick"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D944f66dcedc98d5a4e5d964bd3b32=
e7b"
> +# FIXME: There is much more checked libraries. All should be added or ex=
plicitly disabled to get consistent results.
> +DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib"
> +
> +PATCHSET =3D "6"
> +SRC_URI =3D "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATC=
HSET}.tar.bz2 \
> +           file://PerlMagic_MakePatch.patch \
> +          "
> +SRC_URI[md5sum] =3D "bcf07cf0822572fa2b47fa6d506f699a"
> +SRC_URI[sha256sum] =3D "d9347f31d3d35b40009e1bbcf713c5ad252411e05ee621d5=
a7dae01e47bdbd80"
> +
> +S =3D "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
> +
> +inherit autotools binconfig pkgconfig
> +
> +EXTRA_OECONF =3D "--program-prefix=3D --without-x --without-freetype --w=
ithout-perl --disable-openmp"
> +
> +FILES_${PN} +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
> +                ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
> +                ${libdir}/ImageMagick-${PV}/config/ \
> +                ${datadir}/ImageMagick-${PV}"
> +
> +FILES_${PN}-dev +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.a"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/ImageMagick-${PV}/modules-Q16/*/.debug/*"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +LEAD_SONAME =3D "libMagickCore.so.*"
> +
> +do_configure_prepend() {
> +    export ac_cv_sys_file_offset_bits=3Dyes
> +	sed -i -e s:dist-lzip::g ${S}/configure.ac
> +}
> --=20
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9B/2kACgkQN1Ujt2V2gBxrVgCgj1jtW+CH5f48olz8ybnfUoqC
cDoAoJvGyR4na1Y2IqNPXJXBah/605bw
=sa/Z
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
