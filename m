Received: from smtp-out19.alice.it ([85.33.2.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OJ3wD-000325-H6
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 14:18:12 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out19.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 14:13:32 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 31 May 2010 14:13:30 +0200
Received: from jcn ([82.60.124.81]) by FBCMCL01B03.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 31 May 2010 14:13:29 +0200
Date: Mon, 31 May 2010 14:13:23 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100531141323.36b4444c.ospite@studenti.unina.it>
In-Reply-To: <hu05te$c6i$1@dough.gmane.org>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
	<1275299757-28908-8-git-send-email-ospite@studenti.unina.it>
	<hu05te$c6i$1@dough.gmane.org>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 31 May 2010 12:13:29.0458 (UTC)
	FILETIME=[AE12DD20:01CB00BA]
X-SA-Exim-Connect-IP: 85.33.2.19
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH 07/12] motorola-ezx-base.inc: refresh machine definition
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
X-List-Received-Date: Mon, 31 May 2010 12:18:12 -0000
X-Groupsio-MsgNum: 19693
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__31_May_2010_14_13_23_+0200_Rl2EHTmiPu8pbVsp"

--Signature=_Mon__31_May_2010_14_13_23_+0200_Rl2EHTmiPu8pbVsp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 31 May 2010 13:18:05 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 31-05-10 11:55, Antonio Ospite wrote:
>=20
> >  * get rid of udev
>=20
> > +# We don't want udev, we rely on CONFIG_DEVTMPFS
> > +IMAGE_DEV_MANAGER =3D ""
>=20
> I most strongly disapprove of that. That var, as the name implies, is an
> *image* var, not a machine var. With this change you are forcing an
> image policy onto everyone. I have images that need udev, which
> according to you I am not allowed to use on my a780.
>

OK, I see your reasons, I am keeping this bit locally for now
then, and proposing it again as an image setting when I can find
some time to add proper support for different IMAGE_DEV_MANAGERs.

> If you don't want udev in your image, set IMAGE_DEV_MANAGER =3D "" in your
> image, not in the machine.
>

OK.

Thanks for commenting.

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

--Signature=_Mon__31_May_2010_14_13_23_+0200_Rl2EHTmiPu8pbVsp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwDp+MACgkQ5xr2akVTsAEv8QCeIy8cXVl73KPTy93YHoTYT/n4
fj8AnjWFa9bU7VH1sWLzadQ8xRUxen+T
=bREP
-----END PGP SIGNATURE-----

--Signature=_Mon__31_May_2010_14_13_23_+0200_Rl2EHTmiPu8pbVsp--
