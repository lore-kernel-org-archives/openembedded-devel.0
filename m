Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NwGuo-00009i-NX
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 17:30:11 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 29 Mar 2010 17:26:55 +0200
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 29 Mar 2010 17:26:49 +0200
Received: from jcn ([87.13.159.217]) by FBCMCL01B06.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 29 Mar 2010 17:26:48 +0200
Date: Mon, 29 Mar 2010 17:26:40 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100329172640.6e7ecd27.ospite@studenti.unina.it>
In-Reply-To: <20100326091538.2422d676.ospite@studenti.unina.it>
References: <1269555678-8427-1-git-send-email-ospite@studenti.unina.it>
	<1269561965.3252.26.camel@opal>
	<20100326091538.2422d676.ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.18.9; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 29 Mar 2010 15:26:48.0681 (UTC)
	FILETIME=[3FB99590:01CACF54]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: Re: [PATCH] task-fso-compliance: depend on fso-abyss
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
X-List-Received-Date: Mon, 29 Mar 2010 15:30:12 -0000
X-Groupsio-MsgNum: 18222
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__29_Mar_2010_17_26_40_+0200__QMZShZa_TTk2Zb4"

--Signature=_Mon__29_Mar_2010_17_26_40_+0200__QMZShZa_TTk2Zb4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Mar 2010 09:15:38 +0100
Antonio Ospite <ospite@studenti.unina.it> wrote:

> On Fri, 26 Mar 2010 01:06:05 +0100
> "Michael 'Mickey' Lauer" <mickey@vanille-media.de> wrote:
>=20
> > > diff --git a/recipes/tasks/task-fso-compliance.bb b/recipes/tasks/tas=
k-fso-compliance.bb
> [...]
> > > @@ -12,6 +12,7 @@ RDEPENDS_${PN} =3D "\
> > >  #  fso-apmd \
> > >    fso-gpsd \
> > >  #  fso-monitord \
> > > +  fso-abyss \
> > >    connman \
> > >    connman-scripts \
> > >  #  connman-plugin-bluetooth \
> >=20
> > That's wrong, fso-abyss is only used for some of the machines (i.e.
> > Openmoko ones). Installing it unconditionally only blows up the images.
> > We should rather find out why something depends on it when you build for
> > an EZX machine.
> >=20
>=20
> Ok, thanks, I'll take a deeper look.
>

If I disable _both_ frameworkd and fso-gpsd, then fso-console-image
builds fine. I am still looking to see which of those cause the issue,
fso-abyss is mentioned in frameworkd_git.bb but only conditionally for
OM machines...

Ciao ciao,
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

--Signature=_Mon__29_Mar_2010_17_26_40_+0200__QMZShZa_TTk2Zb4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuwxrAACgkQ5xr2akVTsAExNwCfdN7m4SeK3/Umr3c2MZ6VVQtw
puQAoKyLqn5E3uvTTMOjFyypb9mcU1r/
=pUtg
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Mar_2010_17_26_40_+0200__QMZShZa_TTk2Zb4--
