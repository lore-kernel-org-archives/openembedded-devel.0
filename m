Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1MovY2-0002X9-KQ
	for openembedded-devel@openembedded.org; Sat, 19 Sep 2009 10:44:05 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 19 Sep 2009 10:43:27 +0200
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 19 Sep 2009 10:42:54 +0200
Received: from badebec ([80.116.251.60]) by FBCMCL01B06.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 19 Sep 2009 10:42:11 +0200
Date: Sat, 19 Sep 2009 10:41:54 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Message-Id: <20090919104154.b6458f69.ospite@studenti.unina.it>
In-Reply-To: <200909190121.20611.mickey@vanille-media.de>
References: <200909182050.32308.mickey@vanille-media.de>
	<1253314493-21330-1-git-send-email-ospite@studenti.unina.it>
	<200909190121.20611.mickey@vanille-media.de>
X-Mailer: Sylpheed 2.7.1 (GTK+ 2.16.6; i686-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 19 Sep 2009 08:42:12.0169 (UTC)
	FILETIME=[14E59390:01CA3905]
X-SA-Exim-Connect-IP: 85.33.2.25
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Sat, 19 Sep 2009 08:44:05 -0000
X-Groupsio-MsgNum: 13161
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Sat__19_Sep_2009_10_41_55_+0200_N5=V5/5Z0U2CIEzT"

--Signature=_Sat__19_Sep_2009_10_41_55_+0200_N5=V5/5Z0U2CIEzT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 19 Sep 2009 01:21:20 +0200
"Michael 'Mickey' Lauer" <mickey@vanille-media.de> wrote:

> Thanks!
>=20
> Someone on IRC alarmed that due to the now changed semantics we would nee=
d to=20
> change the present device tables as well. Can you confirm that?
>=20
> :M:
>

Entries with the 'start' field > 0 should be checked, as now exactly
'start' more device nodes are created in this case, this shouldn't be a
great problem, tho. It is sufficient to set the 'count' field to
(count-start) to retain the current behavior if we really want to.

The affected entries are:

awk '{if (($0 !~ /^#/) && ($8 > 0)) print FILENAME ":\n" $0}' \
files/device_table*

And while we are at it, it could be worth documenting in device_table
header that the 'start' field is used for device node names, not for
minor numbers, and that the 'increment' field only applies to the
'minor' field, not to device node names; just to fade away any
ambiguity. Is this info available anywhere else?

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

--Signature=_Sat__19_Sep_2009_10_41_55_+0200_N5=V5/5Z0U2CIEzT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkq0mVMACgkQ5xr2akVTsAGSvQCfVzhwg4x0pHKf+sntSWXAM0Ok
giAAn0bDqIcl74aAVrI2ui0WwT0K7csI
=cWzb
-----END PGP SIGNATURE-----

--Signature=_Sat__19_Sep_2009_10_41_55_+0200_N5=V5/5Z0U2CIEzT--
