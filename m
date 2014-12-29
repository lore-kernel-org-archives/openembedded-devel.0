Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 150307265F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 20:23:02 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Y5gqE-0007nc-VK from Joe_MacDonald@mentor.com ;
	Mon, 29 Dec 2014 12:23:03 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Dec 2014 12:23:02 -0800
Received: by burninator (Postfix, from userid 1000)	id 0DDE15810B3; Mon, 29
	Dec 2014 15:22:56 -0500 (EST)
Date: Mon, 29 Dec 2014 15:22:56 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: leimaohui <leimaohui@cn.fujitsu.com>
Message-ID: <20141229202255.GG4672@mentor.com>
References: <1419575006-51771-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1419575006-51771-1-git-send-email-leimaohui@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 0/2] add new recipes for GeoIP
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
X-List-Received-Date: Mon, 29 Dec 2014 20:23:08 -0000
X-Groupsio-MsgNum: 53518
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xs+9IvWevLaxKUtW"
Content-Disposition: inline

--xs+9IvWevLaxKUtW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH 0/2] add new recipes for GeoIP] On 14.12.26 (=
Fri 14:23) leimaohui wrote:

> GeoIP: allow you to look up information about a given IP address.
> geoipupdate: can download and update the GeoLite Legacy databases.

This looks good over-all but we're really trying to limit the number of
=2Einc files unless we have an expectation that we'll be maintaining more
than one version of the recipe at the same time.  Or, I suppose, if the
recipe is very complex and it could be made clearer by breaking it up
into an include and a recipe file, that might make sense, but I don't
think this falls into either category.  Would you mind combining them
and eliminating the .inc file?

While we're here, there's a couple of minor stylistic things.  I don't
know exactly what's happening here:

meta-networking/recipes-support/GeoIP/GeoIP_1.6.0.bb:
 51 PACKAGES =3D+ "${PN}-database"
 52 FILES_${PN}-database =3D ""
 53 FILES_${PN}-database +=3D "${datadir}/GeoIP/*"

and for this:
 28 LIC_FILES_CHKSUM =3D "\
 29 file://COPYING;md5=3Dd5d53d6b948c064f4070183180a4fa89 \
 30 file://LICENSE;md5=3Df04db71812ba70aaba8b38da91984cd2 \
 31 "

the usual approach is to either line up the indenting with the first "
or four spaces.  I'm okay with either, though four spaces is probably
preferred here and probably do the same for EXTRA_OECONF.

-J.

>=20
> leimh (2):
>   GeoIP: add recipe
>   geoipupdate: add new recipe
>=20
>  meta-networking/recipes-support/GeoIP/GeoIP.inc    | 10 ++++
>  .../recipes-support/GeoIP/GeoIP_1.6.0.bb           | 54 ++++++++++++++++=
++++++
>  .../GeoIP/geoipupdate-2.1.0/GeoIP.conf             | 11 +++++
>  .../GeoIP/geoipupdate-2.1.0/geoipupdate.cron       |  5 ++
>  .../recipes-support/GeoIP/geoipupdate_2.1.0.bb     | 26 +++++++++++
>  5 files changed, 106 insertions(+)
>  create mode 100644 meta-networking/recipes-support/GeoIP/GeoIP.inc
>  create mode 100644 meta-networking/recipes-support/GeoIP/GeoIP_1.6.0.bb
>  create mode 100644 meta-networking/recipes-support/GeoIP/geoipupdate-2.1=
=2E0/GeoIP.conf
>  create mode 100644 meta-networking/recipes-support/GeoIP/geoipupdate-2.1=
=2E0/geoipupdate.cron
>  create mode 100644 meta-networking/recipes-support/GeoIP/geoipupdate_2.1=
=2E0.bb
>=20
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--xs+9IvWevLaxKUtW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUobgfAAoJEEn8ffcsOfaWAUIH/14hriW1wKCCtETNR8tpnEhu
X3jzyzVLDm65GDYBIDd4pvCrKCXsaXwnIFQ0yVKQsTfeK8OKCZrFnrTPf0kj+uDi
6DBaa+Cvae451cl/NOMdeZZNNOppa/sZUL4UhAERdsDmryGKpzHc2B0uRYE9q46i
22mZGZVo87EYJhuvMjJae+7c8S468ZbGZ3JIpnt2i8319XedTsDkuyeGhHgkkZoO
7dGjPkv6CVzHfEA4NMNUoLb1Z5gWXjepgzRAeNYFHMU92Ajr8SCgheKeSJVgOTPY
HcAs+4/9Z8FimDfzOwhQUwWLHGeq3lRTr/YyEmWTiykQnndS62FgXknQ95Df2Wk=
=tK6o
-----END PGP SIGNATURE-----

--xs+9IvWevLaxKUtW--
