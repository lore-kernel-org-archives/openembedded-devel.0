Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id DA0946D14A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2014 11:55:11 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so767110eak.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2014 03:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jzyTbhHNRVv1rwlWSgRdgBU7vEvh1NDgZS+wtTWcgzo=;
	b=pgDoiBu40Ixdaq+/2Kc481FvQA7d8HPYcZTs1pA9StooXAlUtPqV4YwdtBrZ/Qbp7s
	gbsFBPlNAdFL0UyUguqT92Ysj/alK+utTsY+Xknb12fyp3GU2kj+cbXP21wxpVemnU63
	4XdS+GApNu71mkLH+p8URG7hWg4asHYjRQShcSIM+75C1cklvsJakNLG/5Nm0MqedlL9
	E7IOVknvEwmXWMcIlrksEcJd9wUmMb7iM21cx2tpyzxxmKPnI5ekcGCVYFOvVRm+gGiT
	/aLP4USQYgBvcsCktdafFM/3H2kqsbtzqC6J4e/Wn24zah7go/hAut4El8m57iR3eoSL
	b9KQ==
X-Received: by 10.15.32.73 with SMTP id z49mr98951657eeu.27.1389182111986;
	Wed, 08 Jan 2014 03:55:11 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm188633715eel.2.2014.01.08.03.55.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 03:55:10 -0800 (PST)
Date: Wed, 8 Jan 2014 12:55:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140108115521.GW3709@jama>
References: <1389016470-29712-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1389016470-29712-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe] gdal: Avoid host headers use for SQlite3
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
X-List-Received-Date: Wed, 08 Jan 2014 11:55:14 -0000
X-Groupsio-MsgNum: 47653
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tAdHiH28s3ybHVSb"
Content-Disposition: inline

--tAdHiH28s3ybHVSb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2014 at 11:54:30AM -0200, Otavio Salvador wrote:
> This fixes the host contamination when the host has the SQLite3
> headers available.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb b/meta-oe/rec=
ipes-navigation/gdal/gdal_1.10.1.bb
> index 525ead2..4ce5d33 100644
> --- a/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
> +++ b/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb
> @@ -80,6 +80,8 @@ EXTRA_OECONF =3D "--without-perl \
>                  \
>                  --with-pcraster=3Dinternal \
>                  --with-geotiff=3Dinternal \
> +                \
> +                --with-sqlite3=3D${STAGING_LIBDIR} \
>  "
> =20
>  EXTRA_OEMAKE +=3D "INST_DATA=3D"${datadir}/gdal""

can you also fix
gdal-1.10.1: gdal: configure was passed unrecognised options: --without-tiff

?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tAdHiH28s3ybHVSb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLNPKkACgkQN1Ujt2V2gBz63wCglVzPeNuxMxLdWVNbEheHJF8d
JVYAn1uTdc3EY7UtQ/FZMSw9HvbUdoTj
=bTn9
-----END PGP SIGNATURE-----

--tAdHiH28s3ybHVSb--
