Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NjZRN-00074S-5d
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 15:39:20 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 22 Feb 2010 15:36:32 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 22 Feb 2010 15:36:29 +0100
Received: from badebec ([82.61.82.81]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 22 Feb 2010 15:36:28 +0100
Date: Mon, 22 Feb 2010 15:36:18 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100222153618.42909a77.ospite@studenti.unina.it>
In-Reply-To: <201002221052.04108.holger+oe@freyther.de>
References: <1266575689-12944-1-git-send-email-ospite@studenti.unina.it>
	<201002221052.04108.holger+oe@freyther.de>
X-Mailer: Sylpheed 3.0.0 (GTK+ 2.18.7; i486-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 22 Feb 2010 14:36:29.0076 (UTC)
	FILETIME=[6B712D40:01CAB3CC]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] meta-toolchain: Show the host system in toolchain archive name
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
X-List-Received-Date: Mon, 22 Feb 2010 14:39:20 -0000
X-Groupsio-MsgNum: 16944
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__22_Feb_2010_15_36_18_+0100_npc3uHYOOqqkg3s+"

--Signature=_Mon__22_Feb_2010_15_36_18_+0100_npc3uHYOOqqkg3s+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Feb 2010 10:52:03 +0100
Holger Hans Peter Freyther <holger+oe@freyther.de> wrote:

> On Friday 19 February 2010 11:34:49 Antonio Ospite wrote:
> > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> > ---
> > In canadian-sdk.bb ${SDK_SYS} is used as a prefix but I find more logic=
al
> > to put it just before the target system info.
>=20
> The commit message is so weak I can't figure out a why... and I think you=
 want=20
> to have the signed-off-by in the commit message too.
>

The SOB line is in the "void" commit message already, git-am should
get it fine. I thought the brief explanation in the subject line was
enough, but evidently I was wrong.
Maybe using "host system" in the message is ambiguous as well?

I'd like to have this patch applied so that we can tell from the
toolchain archive name on which _build_host_ (which arch, basically) the
toolchain is supposed to be used, an x64-to-armv5te crosscompiler won't
work on i686.

Finally the annotation wanted to spot out the difference with
canadian-sdk which does already what I am talking about, I considered
not worth putting such "meta" comments into the commit message.

I am getting back to you with a more explicit commit log.

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

--Signature=_Mon__22_Feb_2010_15_36_18_+0100_npc3uHYOOqqkg3s+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuClmIACgkQ5xr2akVTsAEShACeKyfI98fjH+D5jb9kdT6Zb6Wd
rtIAn3jgXWk7wuXc92ywbwZoePue8ZB5
=8Mf1
-----END PGP SIGNATURE-----

--Signature=_Mon__22_Feb_2010_15_36_18_+0100_npc3uHYOOqqkg3s+--
