Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1MpNIs-0006kY-Av
	for openembedded-devel@openembedded.org; Sun, 20 Sep 2009 16:22:17 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 20 Sep 2009 16:21:38 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 20 Sep 2009 16:21:38 +0200
Received: from badebec ([79.2.147.1]) by FBCMCL01B07.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Sun, 20 Sep 2009 16:21:36 +0200
Date: Sun, 20 Sep 2009 16:21:32 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@openembedded.org
Message-Id: <20090920162132.6474fc69.ospite@studenti.unina.it>
In-Reply-To: <d1b08f940909191352l2b361edex79ab6a9385641a5e@mail.gmail.com>
References: <200909182050.32308.mickey@vanille-media.de>
	<1253314493-21330-1-git-send-email-ospite@studenti.unina.it>
	<200909190121.20611.mickey@vanille-media.de>
	<20090919104154.b6458f69.ospite@studenti.unina.it>
	<d1b08f940909191352l2b361edex79ab6a9385641a5e@mail.gmail.com>
X-Mailer: Sylpheed 2.7.1 (GTK+ 2.16.6; i686-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 20 Sep 2009 14:21:37.0051 (UTC)
	FILETIME=[A9B9B6B0:01CA39FD]
X-SA-Exim-Connect-IP: 85.33.2.25
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix files/device_table-ezx.txt
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
X-List-Received-Date: Sun, 20 Sep 2009 14:22:17 -0000
X-Groupsio-MsgNum: 13176
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Sun__20_Sep_2009_16_21_32_+0200_fBRHUVaIYF4an6gd"

--Signature=_Sun__20_Sep_2009_16_21_32_+0200_fBRHUVaIYF4an6gd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 19 Sep 2009 22:52:04 +0200
Andrea Adami <andrea.adami@gmail.com> wrote:

> I was suggesting to mickey that some edits are needed.
> I pointed specifically to dev/mmcblk0 which is supposed to populate
> from p1 to p7 per specification.
>

Yes Andrea, without any changes to device table even p8 would be
created in this case. So no regressions AFAICS, sonly some extra, maybe
unneeded, device nodes.

I'll prepare a patch which fixes the 'count' field when 'start' > 0.

> Regards
>=20
> Andrea
>

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

--Signature=_Sun__20_Sep_2009_16_21_32_+0200_fBRHUVaIYF4an6gd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkq2OmwACgkQ5xr2akVTsAH6nwCfZ51F5XOJPSRFyTQ/IPjJa0KC
BsIAoKNbEKiiug0fr7p8ETP6MPvWUap3
=nKo9
-----END PGP SIGNATURE-----

--Signature=_Sun__20_Sep_2009_16_21_32_+0200_fBRHUVaIYF4an6gd--
