Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 26E0577409
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 15:48:49 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1cIHEB-0003u6-39 from Joe_MacDonald@mentor.com ;
	Sat, 17 Dec 2016 07:48:51 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 17 Dec 2016 07:48:50 -0800
Received: by burninator (Postfix, from userid 1000)	id F12635802CD; Sat, 17
	Dec 2016 10:48:49 -0500 (EST)
Date: Sat, 17 Dec 2016 10:48:49 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20161217154849.GC16746@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<0e3d9af2-5840-1775-1cfd-c9e44dfa0f7c@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <0e3d9af2-5840-1775-1cfd-c9e44dfa0f7c@opendreambox.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 00/11] samba: refresh pending patches
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
X-List-Received-Date: Sat, 17 Dec 2016 15:48:50 -0000
X-Groupsio-MsgNum: 64379
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline

--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [meta-networking][PATCH 00/11] samba: refresh pending patches] On 16.1=
2.17 (Sat 14:43) Andreas Oberritter wrote:

> On 17.12.2016 03:15, Joe MacDonald wrote:
> > As I mentioned earlier this week, I'm taking a stab at updating the sam=
ba
> > patches from Andreas Oberritter that now have conflicts due to other
> > changes queued up for samba.  Quite a few of them actually applied clea=
nly
> > after resolving earlier conflicts and the basic smoke tests seem to pass
> > for me, but this definitely needs a bit of soak time in master-next and=
 if
> > you're around, Andreas, and can double-check my work on your patches,
> > that'd be much appreciated.
> >=20
>=20
> Joe, apart from my comment to patch 4, your rebase looks good to me. I
> hope that patch 7 doesn't introduce a regression for multilib, but I
> guess someone using multilib has to find out.

That's a good point and I am setting up a multilib build here to try it
out, but since I never use multilib and since patch 7 only hits the one
package list that was using BPN, I'm thinking multilib builds were
broken in a different way before any of this anyway.

Thanks for the review, Andreas.

--=20
-Joe MacDonald.
:wq

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYVV5hAAoJEEn8ffcsOfaWYCMH/RpyGOFueSj/Od/ys6WJ0JC6
Yj/IAuP+s5w0+mcwZneJH4tbWT6bD3xtJYjKb+3v2u6kaR6iiIND9WT9mzenoErv
fQheC6qMau6+lmgXYG40y4ZlrMlu8G3ZKtUxWc5V0K+bb88pMtXwbrW2ZgiPPV3o
nVPqKl/hOdru2VgHs+NSEvyEU5U/1l0UA1BF+kYSWdvMJ768ilJpV8FB9mFwsXMn
mtyYZUNCbJtGVevIGqfUpx8uTWUgzQUsuZDDUT2empK4O8pko5WWts0ml5Fl/e+z
M23RZyA1AYlfooqqHo6ajpLzxh3DsdQueGO77vqrlYHzJdd9BoAyAgSo5QhsHtA=
=f6mz
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
