Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O4ut4-0005ix-0Z
	for openembedded-devel@openembedded.org; Thu, 22 Apr 2010 13:48:09 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 22 Apr 2010 13:43:28 +0200
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 22 Apr 2010 13:43:28 +0200
Received: from jcn ([82.57.81.158]) by FBCMCL01B01.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 22 Apr 2010 13:43:29 +0200
Date: Thu, 22 Apr 2010 13:43:22 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100422134322.f79d1365.ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 22 Apr 2010 11:43:29.0709 (UTC)
	FILETIME=[073AB5D0:01CAE211]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: About having a static /dev
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
X-List-Received-Date: Thu, 22 Apr 2010 11:48:09 -0000
X-Groupsio-MsgNum: 18730
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__22_Apr_2010_13_43_22_+0200_rnWGO_faY_F9a00/"

--Signature=_Thu__22_Apr_2010_13_43_22_+0200_rnWGO_faY_F9a00/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

For my machine (a780) I'd like to have a static /dev whatever image I
build, I tried setting:
IMAGE_DEV_MANAGER =3D ""
IMAGE_DEVICE_TABLES =3D "files/device_table-minimal.txt \
                       files/device_table-ezx.txt"

But this is still not enough:
 1. the 'devices' script from initscripts keeps rewriting /dev at each
    boot, and with a layout different than one would expect by having
    IMAGE_DEVICE_TABLES set, see also
    http://bugs.openembedded.org/show_bug.cgi?id=3D3593

 2. If I install any package which depends on udev then udev is brought
    in and the static layout is gone at the next boot.

Any suggestion about how to get to a clean solution which can be reused
by others? I can fix 1. somehow, but for 2. I still don't have any idea.

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

--Signature=_Thu__22_Apr_2010_13_43_22_+0200_rnWGO_faY_F9a00/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvQNloACgkQ5xr2akVTsAGPGQCdFdSWIl5RbXPkxOno1hoyQI00
u98AoJBIDV/zmAL8cWpv5XpSrmS+2995
=Fpyg
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Apr_2010_13_43_22_+0200_rnWGO_faY_F9a00/--
