Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id C1C4A6B269
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 20:29:15 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so3501647eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 12:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=84+yxlnt3Klj8kFauvfxLz303QMG+XzszxQgrLKBZcw=;
	b=r1K5a3xWLCoKeEu6aPJcuAzMmxrxCk3uyK5UHyoHwZ7MIEL6HIDYDOe6iiStmfrIsl
	TURix8PnCOIXlb4eOl8QKBKn6FhJVFNyVKeOyYTnpYfGw9//KnPpi6ynKPYTsHyOhyBo
	v7C5BSdcnEnAcTrP5gLVotHeSadUJyXDW40lswS5o0bPdWm7jQRj6FDOI1DW+IHgVP7j
	zOft9hdxZN/+MPZEeRZCAk9DJuPC5IrOzetAtPHVLdXBUl8CboETtPMouX4PgGeJy6wY
	BvBYstf5i7x9vCx4qwlTk3A9YSxHaZ6fF4KeHw8pYQLIXBL5iP9ZSbzQM8dJ33itYsti
	4lfA==
X-Received: by 10.15.10.65 with SMTP id f41mr30243399eet.84.1389644956033;
	Mon, 13 Jan 2014 12:29:16 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m47sm5992579eey.7.2014.01.13.12.29.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jan 2014 12:29:15 -0800 (PST)
Date: Mon, 13 Jan 2014 21:29:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140113202933.GN16995@jama>
References: <1389640209-2487-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1389640209-2487-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe] gdal: Use external TIFF support
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
X-List-Received-Date: Mon, 13 Jan 2014 20:29:16 -0000
X-Groupsio-MsgNum: 47708
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FRaepaAnLTQkJ4tS"
Content-Disposition: inline

--FRaepaAnLTQkJ4tS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2014 at 05:10:09PM -0200, Otavio Salvador wrote:
> The TIFF support cannot be disabled so prefer to depends on 'tiff' and
> use external by default.

I haven't looked at configure script, but isn't it only caused by
typo in PACKAGECONFIG?

--without-tiff
instead of
--without-libtiff (to match --with variant)?

>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/rec=
ipes-navigation/gdal/gdal_1.10.1.bb
> index 4ce5d33..5b461bf 100644
> --- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
> +++ b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.gdal.org/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3Db9bd75ae5af7ff87ab259be01=
21c4106"
> =20
> -DEPENDS =3D "proj sqlite3"
> +DEPENDS =3D "proj sqlite3 tiff"
> =20
>  SRC_URI =3D "ftp://download.osgeo.org/gdal/${PV}/${P}.tar.xz"
> =20
> @@ -82,6 +82,7 @@ EXTRA_OECONF =3D "--without-perl \
>                  --with-geotiff=3Dinternal \
>                  \
>                  --with-sqlite3=3D${STAGING_LIBDIR} \
> +                --with-libtiff=3D${STAGING_LIBDIR} \
>  "
> =20
>  EXTRA_OEMAKE +=3D "INST_DATA=3D"${datadir}/gdal""
> @@ -90,7 +91,6 @@ PACKAGECONFIG ?=3D "geos png jasper"
>  PACKAGECONFIG[geos] =3D "--with-geos,--without-geos,geos"
>  PACKAGECONFIG[lzma] =3D "--with-liblzma,--without-liblzma,xz"
>  PACKAGECONFIG[png] =3D "--with-png,--without-png,libpng"
> -PACKAGECONFIG[tiff] =3D "--with-libtiff,--without-tiff,tiff"
>  PACKAGECONFIG[gif] =3D "--with-gif,--without-gif,giflib"
>  PACKAGECONFIG[jpeg] =3D "--with-jpeg,--without-jpeg,jpeg"
>  PACKAGECONFIG[z] =3D "--with-libz,--without-libz,zlib"
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FRaepaAnLTQkJ4tS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLUTK0ACgkQN1Ujt2V2gByhagCdHCfDotb+lb+gZgCvNlDmhbFZ
ALwAnjz7NSvpq2e8ySyFVRmoZrbsneJx
=S7nb
-----END PGP SIGNATURE-----

--FRaepaAnLTQkJ4tS--
