Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id AC8426E630
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 01:46:47 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1ZNAGc-0005p7-OQ from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Aug 2015 18:46:46 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2; Wed, 5 Aug 2015
	18:46:46 -0700
Received: by burninator (Postfix, from userid 1000)	id AD43A5875A2; Wed,  5
	Aug 2015 21:46:10 -0400 (EDT)
Date: Wed, 5 Aug 2015 21:46:10 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150806014610.GB16843@mentor.com>
References: <1438757380-15461-1-git-send-email-wenzong.fan@windriver.com>
	<55C2B95E.3030606@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55C2B95E.3030606@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-networking] znc: provide SRCREV_FORMAT
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
X-List-Received-Date: Thu, 06 Aug 2015 01:46:53 -0000
X-Groupsio-MsgNum: 56559
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline

--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH][meta-networking] znc: provide SRCREV_FORMAT] On 15.08.06 =
(Thu 09:33) wenzong fan wrote:

> I'd like recall this patch since it duplicates with Joe's:

I already marked it a duplicate in patchworks this morning.

-J.

>=20
>   [oe] [meta-networking][PATCH 1/1] znc: add SRCREV_FORMAT variable
>=20
> // Wenzong
>=20
> On 08/05/2015 02:49 PM, wenzong.fan@windriver.com wrote:
> >From: Wenzong Fan <wenzong.fan@windriver.com>
> >
> >Add SRCREV_FORMAT to provide a composite version number for
> >get_srcrev() in fetch2 code. This fixes error:
> >
> >   * FetchError: Fetcher failure: The SRCREV_FORMAT variable \
> >     must be set when multiple SCMs are used.
> >
> >Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> >---
> >  meta-networking/recipes-irc/znc/znc_git.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> >diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networkin=
g/recipes-irc/znc/znc_git.bb
> >index d81c170..091db49 100644
> >--- a/meta-networking/recipes-irc/znc/znc_git.bb
> >+++ b/meta-networking/recipes-irc/znc/znc_git.bb
> >@@ -13,6 +13,8 @@ SRC_URI =3D "git://github.com/znc/znc.git;name=3Dznc \
> >  SRCREV_znc =3D "f47e8465efa4e1cd948b9caae93ac401b4355df8"
> >  SRCREV_Csocket =3D "07b4437396122650e5b8fb3d014e820a5decf4ee"
> >
> >+SRCREV_FORMAT =3D "znc_Csocket"
> >+
> >  S =3D "${WORKDIR}/git"
> >
> >  inherit autotools-brokensep pkgconfig
> >
--=20
-Joe MacDonald.
:wq

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVwrxiAAoJEEn8ffcsOfaWASIH/2Ojo3jtet78W08fURETbNvb
7c5pIyEEbiFlaqGpEZm9tn+MNOVunIf6aycz5b4Gimg0qOB2c1bjlknYk+yiTrGl
sEqJdBvNJ//oLl2lcH2kV3OwzEeWVV365bfWjbcNSFvU7c9NZlvuZO8orqyOkcsL
DwIw3AsnZYocpmr8p5rTBi6vFMi99OiajLIXAxsQ6rMYIzKM058LliIHzNzLhVjl
lM83USv4a3f3XHh5Ejbi9MP2DOkgTrzs9VYbzr5V2CuDh402MbVc0wHIA0Co9xDy
PZ2YGqxnSz405CAz1KMs6oL+S6EwAckAHnEe0L5mKrFtP6aLalqpk1bj/nk9720=
=t4XK
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
