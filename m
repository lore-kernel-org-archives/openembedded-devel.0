Received: from smtp-out110.alice.it ([85.37.17.110])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Ny5AY-0007S0-2u
	for openembedded-devel@openembedded.org; Sat, 03 Apr 2010 17:21:54 +0200
Received: from fbcmmo06.fbc.local ([192.168.184.137]) by smtp-out110.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 3 Apr 2010 17:17:31 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 3 Apr 2010 17:17:30 +0200
Received: from jcn ([82.55.137.76]) by FBCMCL01B03.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Sat, 3 Apr 2010 17:17:30 +0200
Date: Sat, 3 Apr 2010 17:17:24 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100403171724.b9df4c84.ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.18.9; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 03 Apr 2010 15:17:30.0158 (UTC)
	FILETIME=[C6E27CE0:01CAD340]
X-SA-Exim-Connect-IP: 85.37.17.110
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gtk+-native-2.20.0-r8.0 fails in do_configure.
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
X-List-Received-Date: Sat, 03 Apr 2010 15:21:54 -0000
X-Groupsio-MsgNum: 18417
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Sat__3_Apr_2010_17_17_24_+0200_+RJgk6Ib/pMRWbgN"

--Signature=_Sat__3_Apr_2010_17_17_24_+0200_+RJgk6Ib/pMRWbgN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

when building gtk+-native-2.20.0-r8.0 (actually bitbaking
fso-console-image DISTRO=3Dminimal MACHINE=3Da780) I get this message:

 Requested 'glib-2.0 >=3D 2.23.6' but version of GLib is 2.22.1

See also http://tinderbox.openembedded.org/packages/540390/

I can workaround that locally but I would like to learn what the best
way to solve such issues would be. I don't see any
preferred-minimal-versions.inc

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

--Signature=_Sat__3_Apr_2010_17_17_24_+0200_+RJgk6Ib/pMRWbgN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAku3XAQACgkQ5xr2akVTsAGjTgCfQSWyroLfwF0lvbMqwn6+dS+0
mNYAoIr9TFVQ2Bu5b+g6szZvG9A5Z2lc
=kC5E
-----END PGP SIGNATURE-----

--Signature=_Sat__3_Apr_2010_17_17_24_+0200_+RJgk6Ib/pMRWbgN--
