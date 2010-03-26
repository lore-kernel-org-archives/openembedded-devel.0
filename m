Received: from smtp-out110.alice.it ([85.37.17.110])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nv4l2-0002O6-6c
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 09:19:21 +0100
Received: from fbcmmo06.fbc.local ([192.168.184.137]) by smtp-out110.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 26 Mar 2010 09:15:46 +0100
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 26 Mar 2010 09:15:44 +0100
Received: from jcn ([79.2.146.62]) by FBCMCL01B02.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 26 Mar 2010 09:15:44 +0100
Date: Fri, 26 Mar 2010 09:15:38 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100326091538.2422d676.ospite@studenti.unina.it>
In-Reply-To: <1269561965.3252.26.camel@opal>
References: <1269555678-8427-1-git-send-email-ospite@studenti.unina.it>
	<1269561965.3252.26.camel@opal>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.18.9; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 26 Mar 2010 08:15:44.0449 (UTC)
	FILETIME=[8833BB10:01CACCBC]
X-SA-Exim-Connect-IP: 85.37.17.110
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
X-List-Received-Date: Fri, 26 Mar 2010 08:19:41 -0000
X-Groupsio-MsgNum: 18142
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__26_Mar_2010_09_15_38_+0100_XpZGwAQ=00v2PgKB"

--Signature=_Fri__26_Mar_2010_09_15_38_+0100_XpZGwAQ=00v2PgKB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Mar 2010 01:06:05 +0100
"Michael 'Mickey' Lauer" <mickey@vanille-media.de> wrote:

> > diff --git a/recipes/tasks/task-fso-compliance.bb b/recipes/tasks/task-=
fso-compliance.bb
[...]
> > @@ -12,6 +12,7 @@ RDEPENDS_${PN} =3D "\
> >  #  fso-apmd \
> >    fso-gpsd \
> >  #  fso-monitord \
> > +  fso-abyss \
> >    connman \
> >    connman-scripts \
> >  #  connman-plugin-bluetooth \
>=20
> That's wrong, fso-abyss is only used for some of the machines (i.e.
> Openmoko ones). Installing it unconditionally only blows up the images.
> We should rather find out why something depends on it when you build for
> an EZX machine.
>=20
> :M:
>

Ok, thanks, I'll take a deeper look.

Regards,
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

--Signature=_Fri__26_Mar_2010_09_15_38_+0100_XpZGwAQ=00v2PgKB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkusbSoACgkQ5xr2akVTsAG2rgCggE7GJjlD3i8v1ZdfVdFdmC2S
FO0AmwWR3VyYb1ZAqiMFp/7H+n3RAD5V
=TFH3
-----END PGP SIGNATURE-----

--Signature=_Fri__26_Mar_2010_09_15_38_+0100_XpZGwAQ=00v2PgKB--
