Received: from smtp-out116.alice.it ([85.37.17.116])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O4YHb-0004Qu-86
	for openembedded-devel@openembedded.org; Wed, 21 Apr 2010 13:40:45 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out116.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 21 Apr 2010 13:35:16 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 21 Apr 2010 13:35:15 +0200
Received: from jcn ([82.61.85.13]) by FBCMCL01B03.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Wed, 21 Apr 2010 13:35:15 +0200
Date: Wed, 21 Apr 2010 13:35:09 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100421133509.a19bc792.ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 21 Apr 2010 11:35:15.0490 (UTC)
	FILETIME=[B63D2020:01CAE146]
X-SA-Exim-Connect-IP: 85.37.17.116
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Configuring feeds when building an image
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
X-List-Received-Date: Wed, 21 Apr 2010 11:40:50 -0000
X-Groupsio-MsgNum: 18725
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Wed__21_Apr_2010_13_35_09_+0200_EEVHUj4Vp6kVcIIb"

--Signature=_Wed__21_Apr_2010_13_35_09_+0200_EEVHUj4Vp6kVcIIb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

If I am not mistaken right now there are three mechanisms for a
basic operation like configuring opkg feeds for a distro/image, namely:
 - classes/image.bbclass::insert_feed_uris ()
 - recipes/meta/distro-feed-configs.bb
 - recipes/angstrom/angstrom-feed-configs.bb

The most complete one looks to be angstrom-feed-configs, but it
hardcodes package categories (base debug perl python gstreamer) and
still relies on assumption about angstrom repository layout. Is there
any interest into unifying these methods? With some help from you I
think I can spend some time on that.

Angstrom repository layout is nice, but what if we want to use it (or
abuse an online angstrom repository) with a non angstrom distro?
Just IMAGE_INSTALL_append +=3D "angstrom-feed-configs" is not enough and
can lead to a mixed config right now.

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

--Signature=_Wed__21_Apr_2010_13_35_09_+0200_EEVHUj4Vp6kVcIIb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvO4u0ACgkQ5xr2akVTsAEqywCgokPzrPyXw10dV91cIsrLjbZX
SysAnRxrvNFIRHWw7JfKMCQ/6Fv2oak5
=TaMa
-----END PGP SIGNATURE-----

--Signature=_Wed__21_Apr_2010_13_35_09_+0200_EEVHUj4Vp6kVcIIb--
