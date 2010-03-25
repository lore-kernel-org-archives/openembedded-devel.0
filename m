Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nurc3-0004b5-VO
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 19:17:00 +0100
Received: from fbcmmo06.fbc.local ([7.168.68.254]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 19:13:49 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 19:13:19 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B06.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 19:13:17 +0100
Date: Thu, 25 Mar 2010 19:13:11 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: Stefan Schmidt <stefan@datenfreihafen.org>
Message-Id: <20100325191311.7f113c74.ospite@studenti.unina.it>
In-Reply-To: <20100325174240.GF11431@excalibur.local>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
	<1269537597-26456-5-git-send-email-ospite@studenti.unina.it>
	<20100325174240.GF11431@excalibur.local>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.18.9; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 25 Mar 2010 18:13:17.0441 (UTC)
	FILETIME=[D7D66710:01CACC46]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, RCVD_ILLEGAL_IP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org,
	Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/5] ezx: update ezx-gen-blob version
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
X-List-Received-Date: Thu, 25 Mar 2010 18:17:00 -0000
X-Groupsio-MsgNum: 18126
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__25_Mar_2010_19_13_11_+0100_A5Dsc2JubR5P76fF"

--Signature=_Thu__25_Mar_2010_19_13_11_+0100_A5Dsc2JubR5P76fF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Mar 2010 18:42:40 +0100
Stefan Schmidt <stefan@datenfreihafen.org> wrote:

> Hello.
>=20
> On Thu, 2010-03-25 at 18:19, Antonio Ospite wrote:
> > NOTE: this version builds fine but the resulting binaries do not seem to
> > be correct, their size is about 300KiB instead of the expected 64KiB.
> >=20
> > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
>=20
> I would need some more information before acking this one. Does the old r=
ev
> still build with the gcc in OE?
>=20
> If yes I would prefer to stay with the old rev as a known working one unt=
il the
> root cause is found and fixed. If it does not even build we could go ahea=
d and
> bump the rev as it does make things not even worse.
>

The current version doesn't even build, so bumping the revision is good
even if doesn't solve the size issue.

> Side note for others: Personally I know nobody who ever installed the gen=
-blob
> produced with OE on his phone. All people who did it used a precompiled v=
ersion
> from Wyrm, Antonio or me or compiled it by hand. So this one should not b=
ring to
> much harm.
>

As you may guess, even compiling it manually "doesn't work" anymore with
a recent toolchain...  to be more precise: I've tried running the
big binary loading it via usb, it seems to work but it is just not
suitable to be flashed because of its size.

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

--Signature=_Thu__25_Mar_2010_19_13_11_+0100_A5Dsc2JubR5P76fF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkurp7cACgkQ5xr2akVTsAHpFwCfcv88I1mus1JHt7yLvFWy4A0H
FkgAn1bvQGiIoYKNHdX6EnwEyJoJGe1q
=f8lb
-----END PGP SIGNATURE-----

--Signature=_Thu__25_Mar_2010_19_13_11_+0100_A5Dsc2JubR5P76fF--
