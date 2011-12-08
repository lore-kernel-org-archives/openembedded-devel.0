Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>) id 1RYb4X-0002dW-Al
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Dec 2011 11:19:25 +0100
Received: from jcn (79.2.146.244) by smtp207.alice.it (8.6.023.02)
	(authenticated as fospite@alice.it)
	id 4ED236CF01AC7250; Thu, 8 Dec 2011 11:12:37 +0100
Date: Thu, 8 Dec 2011 11:12:13 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20111208111213.47d30591074a587aa68a58ab@studenti.unina.it>
In-Reply-To: <20111207153453.GG3897@jama.jama.net>
References: <1323271091-8549-1-git-send-email-ospite@studenti.unina.it>
	<20111207153453.GG3897@jama.jama.net>
X-Mailer: Sylpheed 3.2.0beta4 (GTK+ 2.24.8; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [oe-core][PATCH] gcc-4.6.inc: remove gcc-arm-set-cost.patch merged upstream
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
X-List-Received-Date: Thu, 08 Dec 2011 10:19:25 -0000
X-Groupsio-MsgNum: 35979
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__8_Dec_2011_11_12_13_+0100_AHj.MwF_opkzYtDd"

--Signature=_Thu__8_Dec_2011_11_12_13_+0100_AHj.MwF_opkzYtDd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Dec 2011 16:34:53 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Dec 07, 2011 at 04:18:11PM +0100, Antonio Ospite wrote:
> > gcc-arm-set-cost.patch is not needed anymore as it has been merged
> > upstream, remove it.
>=20
> I belive this is because you're using meta-oe from where this patch was
> moved to oe-core and it wasn't removed from meta-oe at the same time when=
=20
> it was applied in oe-core.
>

I see, I wrongly assumed the change was upstream but meta-oe was
applying it on top of the one from oe-core (or the other way around?),
I did not "think in layers", sorry.

> So right fix is to update your meta-oe checkout
> http://git.openembedded.org/meta-openembedded/commit/?id=3D9e0a23fcb4e2c0=
c57de5e7b0ee8ed253b11d15b8
>=20

OK thanks, I updated and I am rebuilding from scratch now.

Regards,
   Antonio

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?

--Signature=_Thu__8_Dec_2011_11_12_13_+0100_AHj.MwF_opkzYtDd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7gjX0ACgkQ5xr2akVTsAG6YQCcDSjrKmnDK7OZcp+4ZmgJirei
s+8AoIjSMxR/Al1x63t+CBjrY2fFYHYA
=hwNR
-----END PGP SIGNATURE-----

--Signature=_Thu__8_Dec_2011_11_12_13_+0100_AHj.MwF_opkzYtDd--
