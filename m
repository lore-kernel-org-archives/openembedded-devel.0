Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id C94066B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 10:27:26 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so309690ead.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DtU0DMA1KomopaoML4tQhajSGtHKYXGwK+P1mLh6mKI=;
	b=lYFZaVgglw0L4HM2ADVGVVeIi/z1PVpL5LflRKUFnumQuImPP5o5fwSart/+OohrLl
	594WEBD7YQIp1+v038cqBZzktZUi5dYZTrZmxHF3GLe7elCuRbvB9D1y+AhVVGg59YTW
	utMWU+D24Q3ok+fNgvqcr5O+Hokhcj7zVa7bWX1nR9okTihzcb2rWwFQgIUii5hbX6zQ
	XhNJCSYzdBuURUGX384rfUiMZFiwa5rkBMFMGnJdzN5ahNYR+eugvEFWMJJBrd5Ysk8t
	ES4pkrIqSwBQoCxU0E46DF6Q8ITNFJDjBHaIaXUqhY0+SgZu1P5OohNJMH5l6k/ewVEw
	BDUw==
X-Received: by 10.15.83.8 with SMTP id b8mr2622047eez.6.1389781647127;
	Wed, 15 Jan 2014 02:27:27 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id l4sm9051340een.13.2014.01.15.02.27.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 02:27:26 -0800 (PST)
Date: Wed, 15 Jan 2014 11:27:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140115102747.GF3717@jama>
References: <1389751948-7861-1-git-send-email-b40290@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1389751948-7861-1-git-send-email-b40290@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] python-mako: fix SRC_URI
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
X-List-Received-Date: Wed, 15 Jan 2014 10:27:28 -0000
X-Groupsio-MsgNum: 47733
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3oCie2+XPXTnK5a5"
Content-Disposition: inline

--3oCie2+XPXTnK5a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2014 at 10:12:28AM +0800, b40290@freescale.com wrote:
> From: Chunrong Guo <B40290@freescale.com>
>=20
>    The package is no longer available in the
>    official Mako site, so download it from a mirror.

It was moved to oe-core yesterday, so we should just drop it from
meta-oe (together with other moved packages).

> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta-oe/recipes-devtools/python/python-mako_0.7.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb b/meta-=
oe/recipes-devtools/python/python-mako_0.7.2.bb
> index 1d2bdd7..6993a3f 100644
> --- a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
> +++ b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dda8dd26ed9751e=
e0cfdf9df1a16bbb54"
> =20
>  PR =3D "r2"
> =20
> -SRC_URI =3D "http://www.makotemplates.org/downloads/Mako-${PV}.tar.gz"
> +SRC_URI =3D "https://pypi.python.org/packages/source/M/Mako/Mako-${PV}.t=
ar.gz"
>  SRC_URI[md5sum] =3D "e3c0a677aa4216da9e89ef8fa76cbafb"
>  SRC_URI[sha256sum] =3D "fe8698e845035586bd711a6748e4e40a208a58de276b9138=
026164700494b68f"
> =20
> --=20
> 1.8.3.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3oCie2+XPXTnK5a5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLWYqMACgkQN1Ujt2V2gBySZQCcDZI7Sqj/mrgdB6zI3qsv+x+b
qNgAnRK6iNSe/LRuaRxJJs9hr9rySS/4
=dPaR
-----END PGP SIGNATURE-----

--3oCie2+XPXTnK5a5--
