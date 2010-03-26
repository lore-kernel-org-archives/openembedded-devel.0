Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nv4pz-0002Gq-AM
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 09:24:16 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 26 Mar 2010 09:21:03 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 26 Mar 2010 09:21:03 +0100
Received: from jcn ([79.2.146.62]) by FBCMCL01B06.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 26 Mar 2010 09:21:03 +0100
Date: Fri, 26 Mar 2010 09:20:57 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100326092057.af620774.ospite@studenti.unina.it>
In-Reply-To: <20100326002634.GA18231@gmail.com>
References: <1269557553-6295-1-git-send-email-ospite@studenti.unina.it>
	<20100326002634.GA18231@gmail.com>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.18.9; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 26 Mar 2010 08:21:03.0465 (UTC)
	FILETIME=[4659B590:01CACCBD]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] numptyphysics: update SRC_URI
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
X-List-Received-Date: Fri, 26 Mar 2010 08:24:16 -0000
X-Groupsio-MsgNum: 18143
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__26_Mar_2010_09_20_57_+0100_Je.kZ/VQaaTydciY"

--Signature=_Fri__26_Mar_2010_09_20_57_+0100_Je.kZ/VQaaTydciY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Mar 2010 17:26:34 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> On (25/03/10 23:52), Antonio Ospite wrote:
> > The old SRC_URI doesn't work anymore, use vcs.maemo.org instead of
> > garage.maemo.org as stated on https://garage.maemo.org/scm/?group_id=3D=
638
> >=20
> > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> > ---
> >  recipes/numptyphysics/numptyphysics_svn.bb |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/recipes/numptyphysics/numptyphysics_svn.bb b/recipes/numpt=
yphysics/numptyphysics_svn.bb
[...]
> >  SRC_URI =3D "\
> >  # Maemo garage is sadly only available with https. Can make you troubl=
e while fetching without accepting the certificate.
> > -  svn://garage.maemo.org/svn/${PN};module=3Dtrunk;proto=3Dhttps \
> > +  svn://vcs.maemo.org/svn/${PN};module=3Dtrunk;proto=3Dhttps \
>=20
> does this also need updating checksums ?

I don't know, are checksums used also for stuff pulled from scm repos?
In checksum.ini I only see an entry for numptyphysics_setup.tgz and the
URI for this one is left untouched by this patch.

Thanks,
   Antonio

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Fri__26_Mar_2010_09_20_57_+0100_Je.kZ/VQaaTydciY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkusbmkACgkQ5xr2akVTsAHZTQCfWANJwxiGdPKieZ+E1EfNvjr9
llwAoIhBBpMtlW5ld4WK9sfCWSVNA5R3
=36/o
-----END PGP SIGNATURE-----

--Signature=_Fri__26_Mar_2010_09_20_57_+0100_Je.kZ/VQaaTydciY--
