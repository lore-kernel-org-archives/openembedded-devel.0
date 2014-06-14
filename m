Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CAF0D6B89F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2014 02:51:39 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Wve4D-00036U-4w from Joe_MacDonald@mentor.com ;
	Fri, 13 Jun 2014 19:51:41 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 13 Jun 2014 19:51:40 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.2.247.3;
	Fri, 13 Jun 2014 19:51:40 -0700
Received: by burninator (Postfix, from userid 1000)	id BE8A658178A; Fri, 13
	Jun 2014 22:51:39 -0400 (EDT)
Date: Fri, 13 Jun 2014 22:51:39 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20140614025138.GB17217@mentor.com>
References: <1402620392-7425-1-git-send-email-rongqing.li@windriver.com>
	<539A4C80.6030001@windriver.com>
MIME-Version: 1.0
In-Reply-To: <539A4C80.6030001@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Editor: Vim-703 http://www.vim.org
X-OriginalArrivalTime: 14 Jun 2014 02:51:40.0993 (UTC)
	FILETIME=[91908B10:01CF877B]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 01/14] iftop: inherit autotools-brokensep
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
X-List-Received-Date: Sat, 14 Jun 2014 02:51:39 -0000
X-Groupsio-MsgNum: 50332
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline

--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Roy,

[Re: [oe] [PATCH 01/14] iftop: inherit autotools-brokensep] On 14.06.13 (Fr=
i 08:57) Rongqing Li wrote:

> I send two copies of these patches, please apply anyone.
>=20
> These patch are fixing the building failure on master.

Martin merged a patch correcting the failure for S!=3DB, so I'm going to
omit 5/14.  The others look okay, so I'm merging them now with some
other outstanding meta-net stuff.  I'll let you know if there's any
others in the queue that look like they no longer apply.

-J.

>=20
>=20
> On 06/13/2014 08:46 AM, rongqing.li@windriver.com wrote:
> >From: Robert Yang <liezhi.yang@windriver.com>
> >
> >It needs autotools-brokensep, otherwise do_configure error:
> >
> >cat: config/pthread.c: No such file or directory
> >
> >Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >---
> >  meta-networking/recipes-support/iftop/iftop_1.0pre2.bb |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb b/me=
ta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> >index 73f2d85..cc1f8b0 100644
> >--- a/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> >+++ b/meta-networking/recipes-support/iftop/iftop_1.0pre2.bb
> >@@ -10,5 +10,5 @@ SRC_URI =3D "http://www.ex-parrot.com/pdw/iftop/downlo=
ad/iftop-${PV}.tar.gz"
> >  SRC_URI[md5sum] =3D "fef521a49ec0122458d02c64212af3c5"
> >  SRC_URI[sha256sum] =3D "1b193037bb3019afae88cd94c87468aac4b045d81ab816=
ed8d2f489716b14027"
> >
> >-inherit autotools
> >+inherit autotools-brokensep
> >
> >
>=20
--=20
-Joe MacDonald.
:wq

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJTm7i6AAoJEEn8ffcsOfaWI50H/2/SFdl0I1C4gGRmgWlEIlOo
SBnWQzVtm1orPfrYpj2bsMHBwpMzqc7iJNKucxKk/4mU56AdXIOaLvTm2GAR9xPg
r0jxbLK6tbLUJritfQGcwJyh3STZO8T9qP1H7L2vUayRwKKMlZAiVUJOZGJ1FG17
dOKP5WnvOI1IodTopjeG3lMDB7DRZvQRbJzyIkxWhXSpjjC2b26QlughIOwdeCWW
3e4piDuu59+jevsW+cMlDf2lcd8gXLjG9KUDGN5nSUNV1dzyG9se0PSu6+pvdp/0
O9EngS/U3ZpKMNzGG7h+dCjrkpgW1qrURIJXithy8aEewcpDyAMHD3o88W52odI=
=upYb
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
