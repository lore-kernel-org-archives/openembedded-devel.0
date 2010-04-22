Received: from smtp-out116.alice.it ([85.37.17.116])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O4vrL-0000s8-02
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 14:50:24 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out116.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 22 Apr 2010 14:46:47 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 22 Apr 2010 14:46:46 +0200
Received: from jcn ([82.57.81.158]) by FBCMCL01B03.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 22 Apr 2010 14:46:44 +0200
Date: Thu, 22 Apr 2010 14:46:38 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100422144638.7c78d45c.ospite@studenti.unina.it>
In-Reply-To: <1271937343.24079.176.camel@mill.internal.reciva.com>
References: <20100422134322.f79d1365.ospite@studenti.unina.it>
	<1271937343.24079.176.camel@mill.internal.reciva.com>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 22 Apr 2010 12:46:44.0916 (UTC)
	FILETIME=[DD595740:01CAE219]
X-SA-Exim-Connect-IP: 85.37.17.116
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: About having a static /dev
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
X-List-Received-Date: Thu, 22 Apr 2010 12:50:24 -0000
X-Groupsio-MsgNum: 18733
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__22_Apr_2010_14_46_38_+0200_2zhb_13htqk3We1J"

--Signature=_Thu__22_Apr_2010_14_46_38_+0200_2zhb_13htqk3We1J
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Apr 2010 12:55:43 +0100
Phil Blundell <philb@gnu.org> wrote:

> On Thu, 2010-04-22 at 13:43 +0200, Antonio Ospite wrote:
> >  2. If I install any package which depends on udev then udev is brought
> >     in and the static layout is gone at the next boot.
>=20
> I think your best option is probably to make udev be a DISTRO_FEATURE
> and not set it for your own distribution.
>=20
> If you genuinely want udev to be selected (for your particular DISTRO)
> on a per-MACHINE basis then you'll have to invent some way to nobble its
> startup script so that it just doesn't do anything on machines where it
> isn't wanted.
>

A per-MACHINE way would be better IMHO, I am thinking about
adding a check on something like /dev/.staticdev (suggested in [1]) to
both udev init script and to the 'device' script from initscripts, and
make the image class add the /dev/.staticdev file when
IMAGE_DEV_MANAGER =3D=3D "" (or maybe =3D=3D "static" or "none"?)

Does this sound reasonable?

Thanks,
   Antonio

[1] http://bugs.openembedded.org/show_bug.cgi?id=3D3593

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Thu__22_Apr_2010_14_46_38_+0200_2zhb_13htqk3We1J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvQRS4ACgkQ5xr2akVTsAHcEACfRGBpmpYaa68xvru33y150qfu
0ZMAn33TF1x1UTA2/5WbllrSr4sMpYME
=cx6h
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Apr_2010_14_46_38_+0200_2zhb_13htqk3We1J--
