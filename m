Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1SKOYC-0005EH-Pa
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 08:39:36 +0200
Received: from jcn (82.61.46.63) by smtp208.alice.it (8.6.023.02)
	(authenticated as fospite@alice.it)
	id 4F056E850BABBCDE; Wed, 18 Apr 2012 08:24:26 +0200
Date: Wed, 18 Apr 2012 08:24:23 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20120418082423.25389159b88a4b29186f05b4@studenti.unina.it>
In-Reply-To: <4F8E1A23.4030606@emagii.com>
References: <4F8DF031.60109@emagii.com> <2900608.HO3vnnHahd@helios>
	<4F8E1A23.4030606@emagii.com>
X-Mailer: Sylpheed 3.2.0beta7 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
Subject: Re: RFC: Support for R/W git in bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 06:39:36 -0000
X-Groupsio-MsgNum: 38305
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Wed__18_Apr_2012_08_24_23_+0200_S5Vu_PneoB_B/6+_"

--Signature=_Wed__18_Apr_2012_08_24_23_+0200_S5Vu_PneoB_B/6+_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Apr 2012 03:34:27 +0200
Ulf Samuelsson <openembedded@emagii.com> wrote:

> On 2012-04-18 01:07, Paul Eggleton wrote:
> > On Wednesday 18 April 2012 00:35:29 Ulf Samuelsson wrote:
> >> Today bitbake supports read only git access in recipes.
> >> For various reasons, I would like to be able to do recipes
> >> which would check out in a read/write mode.
> > Could you elaborate on "various reasons"?
> >
> > Would the new externalsrc bbclass be useful in your case?
> >
> > Cheers,
> > Paul
> >
>=20
> 1. If I am busy working on an application, then it simplifies the=20
> development process.
>      I can modify the code in the tree and push.
>      This is mainly for kernel development.
>

for that you can pass "protocol=3Dfile" to make the git fetcher use the
"file" transport, see

http://ao2.it/en/blog/2010/05/27/neat-compilerun-cycle-git-and-openembedded

basically, in the .bb recipe, you can fetch from a local clone where
you do your normal work.

> 2. If I work on a prerelease of some S/W drivers/Applications under NDA,
>      then I cannot make that code publicly available
>      but I still want to put  that on my Internet accessible git server.
>      Typicailly this is before the release of a new chip and info about=20
> the chip should not be
>      made public before the chip is released.
>=20
> 3.  I want to be able to ship something similar to the Angstrom setup=20
> scripts
>       to someone else, and have them build an image, but it should not=20
> be available
>       to anyone not accepted (without public key at the git server).
>

maybe you can pass "protocol=3Dssh" as well to the git fetcher as well,
but I haven't tried that, when you say "R/W mode" you are basically
saying "ssh transport" for git, right? Let us know if that works.

> There are other uses for such a functionality, but those are my=20
> immediate needs.
>=20
> As you see, this is mostly for development.
> Once the code is released, then the recipe would be changed to the=20
> normal git access.
>=20
> Didn't know anything about the externalsrc bbclass, but after checking,=20
> I would say no.
> It won't do the two things above. I do see the use of it though.
>

Ciao,
   Antonio

--=20
Antonio Ospite
http://ao2.it

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?

--Signature=_Wed__18_Apr_2012_08_24_23_+0200_S5Vu_PneoB_B/6+_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk+OXhcACgkQ5xr2akVTsAEhPgCfcISIxDU1kF140Iwz+eul55s5
vlcAnjN5D/aucyNwuys82qHte9C6Fg8u
=D1rB
-----END PGP SIGNATURE-----

--Signature=_Wed__18_Apr_2012_08_24_23_+0200_S5Vu_PneoB_B/6+_--
