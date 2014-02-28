Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4793D6F306
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 13:26:49 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so287978eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 05:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SrS2D3enpA2Y1JPgS9MWkWpU85ja1C++/lmaIbNYCmA=;
	b=eZqT9Km3PhvEEcmc7Mcw+v3mIB18vaEfix+MhJfKfQIAb0Yw5P2T4JJyV75g8smB0d
	H4vaWQShrIBGaCPkuJFijurvsF5rKkPteq2HxXGqBtQBaUTP0ooN8ZhwzKATBBfdZKyl
	5ADe1FvyDjKV2LQ6vTVm9wtPYgp16MUVld0lHfOi/uX9fNpHEvz8moNnSoVlHYPxEFfA
	GwrsSP2SIbuLESFrawZQoXNAVyDCGIJLl7z8D/DZ6HYzGgV0v51IXU6uCEnJ7ufrZ3fr
	QYGpBPNUeb7G2LLV9l1sDgFh/5DPLl1N16Zo7UNNoWEjTeJnOl0z7CVAprMtpDVY2uLx
	om7w==
X-Received: by 10.15.65.68 with SMTP id p44mr20927155eex.63.1393594010660;
	Fri, 28 Feb 2014 05:26:50 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f45sm10485062eeg.5.2014.02.28.05.26.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Feb 2014 05:26:49 -0800 (PST)
Date: Fri, 28 Feb 2014 14:26:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140228132651.GH26981@jama>
References: <1393592670-3088-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
In-Reply-To: <1393592670-3088-1-git-send-email-Matthieu.Crapet@ingenico.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] fbida 2.09: cleanups and use PACKAGECONFIG
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
X-List-Received-Date: Fri, 28 Feb 2014 13:26:50 -0000
X-Groupsio-MsgNum: 48446
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="29v4wwwYFo25Y52C"
Content-Disposition: inline

--29v4wwwYFo25Y52C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2014 at 02:04:30PM +0100, Matthieu Crapet wrote:
> There are now 3 packageconfig variables: gif, png, tiff.
>=20
> Changes:
> - fix missing $ for STAGING_INCDIR (jpeg version detection)
> - use TABS for (shell) indentation

Please don't.

meta-oe layers are using consistent indentation with 4 spaces and no
tabs.

> - add DESCRIPTION
> - no more QA warnings
> Use this to reveal:
> sed -i -e '/^verbose/s/no/yes/' ${S}/mk/Autoconf.mk
>=20
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta-oe/recipes-graphics/fbida/fbida_2.09.bb | 39 ++++++++++++++++++++++=
+-----
>  1 file changed, 33 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb b/meta-oe/recip=
es-graphics/fbida/fbida_2.09.bb
> index 32f376f..a3abf8f 100644
> --- a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
> +++ b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
> @@ -1,27 +1,54 @@
> +SUMMARY =3D "Framebuffer image and doc viewer tools"
> +DESCRIPTION =3D "The fbida project contains a few applications for viewi=
ng and editing images, \
> +               with the main focus being photos."
>  HOMEPAGE =3D "http://linux.bytesex.org/fbida/"
> -SUMMARY =3D "frame buffer image and doc viewer tools"
>  AUTHOR =3D "Gerd Hoffmann"
>  SECTION =3D "utils"
> =20
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b"
> =20
> -DEPENDS =3D "virtual/libiconv libpng jpeg fontconfig freetype libexif cu=
rl libungif tiff"
> +DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype libexif curl"
> =20
> +PR =3D "r1"
> +
> +# Note: SRCREV is 3 revisions ahead of 2.09
>  SRC_URI =3D "git://git.kraxel.org/fbida"
>  SRCREV =3D "cb0ce5fa5f42bfaea4f8f326bcd8914dd14e782d"
>  S =3D "${WORKDIR}/git"
> =20
>  EXTRA_OEMAKE =3D "STRIP=3D"
> =20
> +PACKAGECONFIG ??=3D "gif png"
> +PACKAGECONFIG[gif] =3D ",,libungif"
> +PACKAGECONFIG[png] =3D ",,libpng"
> +PACKAGECONFIG[tiff] =3D ",,tiff"
> +
>  do_compile() {
> -    sed -i -e 's: cpp: ${TARGET_PREFIX}cpp -I{STAGING_INCDIR}:g' GNUmake=
file
> -    oe_runmake
> +	sed -i -e 's:/sbin/ldconfig:echo x:' ${S}/mk/Autoconf.mk
> +	sed -i -e 's: cpp: ${TARGET_PREFIX}cpp -I${STAGING_INCDIR}:' ${S}/GNUma=
kefile
> +
> +	if [ -z "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" ]; =
then
> +		sed -i -e '/^HAVE_MOTIF/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
> +	fi
> +
> +	# Be sure to respect preferences (force to "no")
> +	# Also avoid issues when ${BUILD_ARCH} =3D=3D ${HOST_ARCH}
> +	if [ -z "${@base_contains('PACKAGECONFIG', 'gif', 'gif', '', d)}" ]; th=
en
> +		sed -i -e '/^HAVE_LIBUNGIF/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
> +	fi
> +	if [ -z "${@base_contains('PACKAGECONFIG', 'png', 'png', '', d)}" ]; th=
en
> +		sed -i -e '/^HAVE_LIBPNG/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
> +	fi
> +	if [ -z "${@base_contains('PACKAGECONFIG', 'tiff', 'tiff', '', d)}" ]; =
then
> +		sed -i -e '/^HAVE_LIBTIFF/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
> +	fi
> +
> +	oe_runmake
>  }
> =20
>  do_install() {
> -    oe_runmake 'DESTDIR=3D${D}' install
> +	oe_runmake 'DESTDIR=3D${D}' install
>  }
> =20
>  RDEPENDS_${PN} =3D "ttf-dejavu-sans-mono"
> -
> --=20
> 1.8.5.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--29v4wwwYFo25Y52C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMQjpsACgkQN1Ujt2V2gBye1QCeJrF/9d0IFQMM5SkKVkV5AAEB
hHAAn3W4paig3DJIPcB4YhyF9BYfUtiL
=ukq5
-----END PGP SIGNATURE-----

--29v4wwwYFo25Y52C--
