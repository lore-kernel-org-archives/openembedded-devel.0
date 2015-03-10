Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9B473A9A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 21:28:25 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1YVRhS-0007Mh-Q5 from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2015 14:28:26 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 14:28:26 -0700
Received: by burninator (Postfix, from userid 1000)	id 350B9581E85; Tue, 10
	Mar 2015 17:28:33 -0400 (EDT)
Date: Tue, 10 Mar 2015 17:28:33 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150310212832.GA4083@mentor.com>
References: <CAL0pqZ15mf+jANcqzD=EAYs-BOKThCdWdzO2J2aRaV1v4moO=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL0pqZ15mf+jANcqzD=EAYs-BOKThCdWdzO2J2aRaV1v4moO=g@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Recipe Name Change
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
X-List-Received-Date: Tue, 10 Mar 2015 21:28:27 -0000
X-Groupsio-MsgNum: 54728
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] Recipe Name Change] On 15.03.10 (Tue 11:59) Leah wrote:

> Hi,
>=20
> We have recently changed the name of our product from CyaSSL to wolfSSL. I
> would like to update to a recipe reflecting this name. Our current recipe
> is located at
> https://github.com/openembedded/meta-oe/tree/master/meta-networking/recip=
es-connectivity/cyassl.
> Should I make a commit to delete cyassl and a separate commit to add the
> new wolfssl recipe? Or should this be done in one commit?

I would rather see it done as a 'git mv', meaning one commit, with the
proper migration path variables added either in the same commit (the
diffs will still be nice and clean when you do a -M on them) as Khem
described.

-J.

>=20
> Thanks,
>=20
> Leah
>=20
>=20
> --=20
>=20
> Leah Thompson
> www.wolfssl.com
> leah@wolfssl.com
> 406-570-1389
> Skype: lchristina26
--=20
-Joe MacDonald.
:wq

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU/2H9AAoJEEn8ffcsOfaWY5oIAJn5Do02v/ZcSFenPSunR8rI
o1EYp+K0nm3waJM/Mtu38csjZmr6BxmFTamwu+/KazfG+Bk263D43lcM0w16ZH1H
E7QGmOrvmYmWJC4rHLiVujaoEtG7Tyfa0fgShrFx+lBcSon18glkh9b1eh/CdejM
brUtW/8ql3xVsmRagtEupjGg46Cm8oxXxhlDeG30EW4PyUsrF0QEMJn0s3o9Jm+e
qMVBh6OecOYQuTXWdIDB47FlNympmElE+P2uyWZXHOF3KvnsWSmhtNECJYiClZcQ
USUV5xj4DE9NNwzNsPUyuKaSzmh+y9BsuuuNNBOwflr9p5hZmEO87806MuMXr2U=
=e2tU
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
