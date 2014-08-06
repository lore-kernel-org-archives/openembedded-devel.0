Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2A50660030
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 18:45:00 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XF6Cq-0000mo-S7 from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2014 11:45:00 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 6 Aug 2014 11:45:00 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.2.247.3; Wed, 6 Aug 2014
	11:45:00 -0700
Received: by burninator (Postfix, from userid 1000)	id 688F7580DB1; Wed,  6
	Aug 2014 14:44:59 -0400 (EDT)
Date: Wed, 6 Aug 2014 14:44:59 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140806184459.GE14621@mentor.com>
References: <1407332271-32696-1-git-send-email-joe_macdonald@mentor.com>
	<20140806183714.GM14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140806183714.GM14848@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
X-OriginalArrivalTime: 06 Aug 2014 18:45:00.0557 (UTC)
	FILETIME=[870E1BD0:01CFB1A6]
Subject: Re: [meta-networking][PATCH] wireshark: update to latest stable version
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
X-List-Received-Date: Wed, 06 Aug 2014 18:45:04 -0000
X-Groupsio-MsgNum: 51462
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m0vRWufqUC70IDnR"
Content-Disposition: inline

--m0vRWufqUC70IDnR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] wireshark: update to latest stable versi=
on] On 14.08.06 (Wed 20:37) Martin Jansa wrote:

> On Wed, Aug 06, 2014 at 09:37:51AM -0400, Joe MacDonald wrote:
> > Version 1.12.0 is out, update the SRC_URI and associated variables.
>=20
> BTW: this causes:
> ERROR: QA Issue: Package version for package wireshark went backwards
> which would break package feeds from (0:1.12.0-rc2-r0.3 to
> 0:1.12.0-r0.0) [version-going-backwards]
>=20
> Which is caused by incorrect PV in rc2 (which I haven't noticed before),
> but as rc2 was in master only for couple of days, I can live without PE
> bump in it.

Boo.  And I didn't run into it since I'd never got around to building
the -rc2 before we had the final version.  A PE bump is probably best if
you want to go that route, it is a pretty narrow window but it broke
your stuff, I imagine you're not alone.  :-/

-J.

>=20
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
> >  .../wireshark/va_list-can-t-be-NULL-on-ARM.patch   | 99 --------------=
--------
> >  ...wireshark_1.12.0-rc2.bb =3D> wireshark_1.12.0.bb} | 10 +--
> >  2 files changed, 5 insertions(+), 104 deletions(-)
> >  delete mode 100644 meta-networking/recipes-support/wireshark/wireshark=
/va_list-can-t-be-NULL-on-ARM.patch
> >  rename meta-networking/recipes-support/wireshark/{wireshark_1.12.0-rc2=
=2Ebb =3D> wireshark_1.12.0.bb} (81%)



--=20
-Joe MacDonald.
:wq

--m0vRWufqUC70IDnR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJT4neoAAoJEEn8ffcsOfaWdUAH/2bPdWotCGg8NlaX7evO33YH
/L26TjsZnItv3F/tCBnlZcL1uO8ZdYtEKYrK9ahDUujGDsbBKbCLGMKAg1H5aQCP
AczDefFsZdj30veExIGoCXDtfb5LBU1GzrTxB/RMoKWzjU2+/NA2RMk4WFWpuVSe
9+dNBxTVz/VuI6Tjs5g5Owiyc+OJ+knondL4bQUW+m+CZ/AWgag0AHsuwbK5RbSF
x0RLcztO4dv537ZenxdtPvzt9I8GjqfGQ1IGvhj7qLNN3wjsfhS6Ipo4wDYrXMgU
5/NFZGnzH5Q4YoXKwjmcmxLfxbeznWlCufMKtLRYfqj2eUaJ31aLgBHw/aDjQLc=
=v9jf
-----END PGP SIGNATURE-----

--m0vRWufqUC70IDnR--
