Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 90452605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 16:31:55 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y8AZQ-0003hV-IC from Joe_MacDonald@mentor.com ;
	Mon, 05 Jan 2015 08:31:56 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 5 Jan 2015 08:31:56 -0800
Received: by burninator (Postfix, from userid 1000)	id 460F8580D10; Mon,  5
	Jan 2015 11:31:52 -0500 (EST)
Date: Mon, 5 Jan 2015 11:31:52 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150105163151.GC12135@mentor.com>
References: <1420327836-9852-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1420327836-9852-1-git-send-email-liezhi.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [V2 meta-networking] [PATCH] dnrd: fix SRC_URI
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
X-List-Received-Date: Mon, 05 Jan 2015 16:31:56 -0000
X-Groupsio-MsgNum: 53663
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline

--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [V2 meta-networking] [PATCH] dnrd: fix SRC_URI] On 15.01.03 (Sat 15:3=
0) Robert Yang wrote:

> Fixed:
> ERROR: Function failed: Fetcher failure for URL:
>     'http://ncu.dl.sourceforge.net/project/dnrd/dnrd/2.20.3/dnrd-2.20.3.t=
ar.gz'.
>     Unable to fetch URL from any source.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../recipes-daemons/dnrd/dnrd_2.20.3.bb            |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb b/meta-n=
etworking/recipes-daemons/dnrd/dnrd_2.20.3.bb
> index 85a58cc..3b8fdc9 100644
> --- a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
> +++ b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
> @@ -9,7 +9,7 @@ SECTION =3D "System Environment/Daemons"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0be67017f1c770313ad7b40e18d56=
8f1"
> =20
> -SRC_URI =3D "http://ncu.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/$=
{BP}.tar.gz \
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
>             file://dnrd.service \
>             file://dnrd.conf.sample \
>             file://dnrd.init"
> --=20
> 1.7.9.5
>=20
--=20
-Joe MacDonald.
:wq

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUqrx3AAoJEEn8ffcsOfaWatcH/2w3Lik77RAZAVwT/FueGiVB
bkDq87kK7HRgYRR2AvOHs5xhZN+CW1Qb8YNiMkYvR3SIwrj3iDsCHoLGDqLqI9rQ
z0H4kSBJyK2ItUl2p9cWTO6jMD93d4FwTR+Xg7ts2Yh+Q3/USlkkh8SqOh51+WGj
GLQVpNGKOJNbg1etPWHke8Ck41mCTAsCrSC3Yznoz5k1ptZ0Ow25aLn6z7X+Ji/g
bDPuZgmfnKHgZtrXwBkLDFEh/we7waw/TzLYmHYPaXtEZzwpfzLXQE4GXez9DMrF
E39nQAb31G1RW+wVWlpmQyAV2m5BSnzNzSrjN2hw9d5ytppubLqx0GyB6geyHVE=
=OE7Z
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
