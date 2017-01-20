Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4FCD0731CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:00:18 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cUZjm-0005jn-N3 from Joe_MacDonald@mentor.com ;
	Fri, 20 Jan 2017 06:00:18 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Jan 2017 06:00:18 -0800
Received: by burninator (Postfix, from userid 1000)	id 7041D581186; Fri, 20
	Jan 2017 09:00:17 -0500 (EST)
Date: Fri, 20 Jan 2017 09:00:17 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20170120140017.GA6018@mentor.com>
References: <20170120015435.13878-1-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20170120015435.13878-1-liezhi.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] [PATCH] dibbler: fix SRC_URI from ${P} to ${BP}
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
X-List-Received-Date: Fri, 20 Jan 2017 14:00:19 -0000
X-Groupsio-MsgNum: 64815
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking] [PATCH] dibbler: fix SRC_URI from ${P} to ${BP}] On=
 17.01.19 (Thu 17:54) Robert Yang wrote:

> Otherwise it would fail when multilib.
>=20
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20170120

Hi Robert,

Was this the version you intended to send to the list?

-J.

>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.b=
b b/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb
> index a2d46db..1913d3a 100644
> --- a/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb
> +++ b/meta-networking/recipes-connectivity/dibbler/dibbler_1.0.1.bb
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://klub.com.pl/dhcpv6"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7236695bb6d4461c105d685a8b61c=
4e3"
> =20
> -SRC_URI =3D "http://klub.com.pl/dhcpv6/${BPN}/${P}.tar.gz \
> +SRC_URI =3D "http://klub.com.pl/dhcpv6/${BPN}/${BP}.tar.gz \
>          file://dibbler_fix_getSize_crash.patch \
>          file://types.patch \
>  "
> --=20
> 2.9.0
>=20
--=20
-Joe MacDonald.
:wq

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYghfxAAoJEEn8ffcsOfaWEvYIAJEXuC4q6Vt+00dJdBjyg1U2
60qFXTz8vQfELoTyLq9HJuY1isdZgHUFdIUEPrVFsGK6B3syF/8dfPKjQbUrS0dt
q4CGcW+2J+r9MeNJ4VecFWu9NAy2K/mhNtJ14LNr4/jb5Yzkn9qRp2Z6HUxRGkwt
xTc1wwMMzLoKl14icjt/t/f5SZUuS+ugoHe5FrfHWRd3fk6taUzvuE3Tngentf/o
YB3CSb8VwXNyXhW0r+zeu6bRE6Xp8GWfLz5HMPGWccRf1I9I5xgz/keP/DjqkXM1
bDeOPjjQYedwXfAw+ZuFfYI2YNqtkwijArhaoCwr5vJVlJvWSKo6hsK1CyiPf7c=
=eJ+7
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
