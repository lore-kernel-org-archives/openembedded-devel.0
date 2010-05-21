Received: from smtp-out12.alice.it ([85.37.17.107])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OFNcV-00015F-55
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 10:30:15 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out12.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 21 May 2010 10:25:08 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 21 May 2010 10:25:04 +0200
Received: from jcn ([87.6.141.180]) by FBCMCL01B07.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 21 May 2010 10:25:01 +0200
Date: Fri, 21 May 2010 10:24:55 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100521102455.ea0d72f6.ospite@studenti.unina.it>
In-Reply-To: <20100521002516.GC29183@gmail.com>
References: <20100521002808.946c76aa.ospite@studenti.unina.it>
	<20100521002516.GC29183@gmail.com>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 21 May 2010 08:25:01.0954 (UTC)
	FILETIME=[1BA23E20:01CAF8BF]
X-SA-Exim-Connect-IP: 85.37.17.107
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: binutils-cross-sdk_cvs.bb fails in do_install
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
X-List-Received-Date: Fri, 21 May 2010 08:30:15 -0000
X-Groupsio-MsgNum: 19460
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__21_May_2010_10_24_55_+0200_U+R.e76AXBublP+T"

--Signature=_Fri__21_May_2010_10_24_55_+0200_U+R.e76AXBublP+T
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 20 May 2010 17:25:16 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> On (21/05/10 00:28), Antonio Ospite wrote:
> > Hi,
> >=20
> > as per subject binutils-cross-sdk_cvs.bb fails to build for
> > DISTRO=3Dminimal this prevents meta-toolchain to be build from scratch =
as
> > well.
> >=20
> > http://tinderbox.openembedded.org/builds/71564/
> >=20
> > Any hints?
>=20
> Does it happen with 2.20 as well ?
>

No it doesn't. Building 2.20 is OK, even if there are some minor
glitches:

$ bitbake binutils-cross-sdk-2.20
[...]
NOTE: preferred version 2.20.1 of binutils-cross-sdk not available (for ite=
m binutils-cross-sdk-2.20)
NOTE: Resolving any missing task queue dependencies
NOTE: preferred version 2.20.1 of binutils-cross-sdk not available (for ite=
m binutils-cross-sdk)
ERROR: Multiple .bb files are due to be built which each provide binutils-c=
ross-sdk
 (.../binutils/binutils-cross-sdk_2.20.bb .../binutils/binutils-cross-sdk_c=
vs.bb).
 This usually means one provides something the other doesn't and should.
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide binutils-c=
ross-sdk
 (.../binutils/binutils-cross-sdk_2.20.bb .../binutils/binutils-cross-sdk_c=
vs.bb).
 This usually means one provides something the other doesn't and should.

See: http://tinderbox.openembedded.org/builds/71580/

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

--Signature=_Fri__21_May_2010_10_24_55_+0200_U+R.e76AXBublP+T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkv2Q1cACgkQ5xr2akVTsAFv0QCglWKLO6OLwJlU1xgNvcI6YPSH
IQ4AnjL9FazvbAzI/0parAfhbEHWQinX
=68kx
-----END PGP SIGNATURE-----

--Signature=_Fri__21_May_2010_10_24_55_+0200_U+R.e76AXBublP+T--
