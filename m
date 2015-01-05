Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8C787605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 16:29:19 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y8AWt-0002r9-9F from Joe_MacDonald@mentor.com ;
	Mon, 05 Jan 2015 08:29:19 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 5 Jan 2015 08:29:18 -0800
Received: by burninator (Postfix, from userid 1000)	id C0090580D10; Mon,  5
	Jan 2015 11:29:14 -0500 (EST)
Date: Mon, 5 Jan 2015 11:29:14 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150105162914.GA12135@mentor.com>
References: <1419928817-38602-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1419928817-38602-1-git-send-email-liezhi.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] [PATCH 1/2 V2] esmtp: use BPN in SRC_URI
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
X-List-Received-Date: Mon, 05 Jan 2015 16:29:20 -0000
X-Groupsio-MsgNum: 53661
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged these, with one minor tweak.  I dropped in ${SOURCEFORGE_MIRROR}
in the SRC_URI here as we've been doing with others.

Thanks Robert.
-J.

[[oe] [meta-networking] [PATCH 1/2 V2] esmtp: use BPN in SRC_URI] On 14.12.=
30 (Tue 00:40) Robert Yang wrote:

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-networking/recipes-support/esmtp/esmtp_1.2.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb b/meta-ne=
tworking/recipes-support/esmtp/esmtp_1.2.bb
> index 46d468c..60d34e1 100644
> --- a/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> +++ b/meta-networking/recipes-support/esmtp/esmtp_1.2.bb
> @@ -11,7 +11,7 @@ DEPENDS =3D "libesmtp"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> =20
> -SRC_URI =3D "http://nchc.dl.sourceforge.net/project/${PN}/${PN}/${PV}/${=
PN}-${PV}.tar.bz2"
> +SRC_URI =3D "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/=
${BPN}-${PV}.tar.bz2"
> =20
>  # Have to set this or we get -L/lib in LDFLAGS
>  EXTRA_OECONF =3D "--with-libesmtp=3D${STAGING_EXECPREFIXDIR}"
> --=20
> 1.7.9.5
>=20
--=20
-Joe MacDonald.
:wq

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUqrvWAAoJEEn8ffcsOfaWRbcIAK4E3PnHxRvqxLDQo46EqFuL
J7MECxdIrWAg/olmjMs8TiQbAzh0Cmoh9LRRg9P+cFDXytQe0ATahJ9FvFBk73vW
Mml61NDb/iIH7vfJEMzenGU8TMsUjfpg9kuf19djwLyesOpJKH9qINrDXVge4UT8
lmfMxkP0HaKZRXMrmI2VKcQjLyKfntl1t6OqnpuFgISH3n//w/otV1pFju/E2ycW
/PwMyhKjk+949sUOPtHLsDtddc9pArGlRmLyJ9p1IhbL8q8oyjKW2T5n+qa7y1Vo
q/62j0+5mnod1kxpapzDdH7E5xZ07PkzxjkXNEZGIUx30ea2Uxr2obKHl3rVkAY=
=02s0
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
