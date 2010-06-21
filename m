Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OQin8-0005mP-MF
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 17:20:08 +0200
Received: from jcn (82.57.82.198) by smtp205.alice.it (8.5.124.08)
	id 4C1A2645004748E9; Mon, 21 Jun 2010 17:09:52 +0200
Date: Mon, 21 Jun 2010 17:09:46 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100621170946.57219953.ospite@studenti.unina.it>
In-Reply-To: <hvnrd3$25e$1@dough.gmane.org>
References: <20100618001536.60bbc113.ospite@studenti.unina.it>
	<hvfnha$e9k$1@dough.gmane.org>
	<AANLkTild9C_PVbfpBYlTeknKZ4k64bjMqwNvwfMk3rTi@mail.gmail.com>
	<hvnap4$4d8$1@dough.gmane.org> <hvnrd3$25e$1@dough.gmane.org>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 82.57.200.101
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_SORBS_DUL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: meta-toolchain fails in do_populate_sdk
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
X-List-Received-Date: Mon, 21 Jun 2010 15:20:09 -0000
X-Groupsio-MsgNum: 20315
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__21_Jun_2010_17_09_46_+0200_.2qeIPmWq+51=+Kg"

--Signature=_Mon__21_Jun_2010_17_09_46_+0200_.2qeIPmWq+51=+Kg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Jun 2010 16:02:11 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 21-06-10 11:18, Koen Kooi wrote:
> > On 18-06-10 23:59, Khem Raj wrote:
> >> On Fri, Jun 18, 2010 at 5:07 AM, Koen Kooi <k.kooi@student.utwente.nl>=
 wrote:
> >> On 18-06-10 00:15, Antonio Ospite wrote:
> >>>>> Hi,
> >>>>>
> >>>>> * check_data_file_clashes: Package gdb-cross-sdk wants to install f=
ile
> >>>>> .../build/tmp/work/armv5te-oe-linux-gnueabi/meta-toolchain-1.0-r0/s=
dk/image/usr/local/minimal/arm/share/info/dir
> >>>>> But that file is already provided by package  * binutils-cross-sdk
> >=20
> >> I can confirm this bug, any fixes for it available?
> >=20
> >>> we should force gdb-cross-sdk to not have those files and dirs.
> >=20
> > Any patches?
>=20
> This turned out to be a lot simpler than expected:
>=20
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Ddbf77a6a1=
5ea7926bf8f75dd728ff7bd55c60b11
>

Thanks Koen.

Nitpicking: I noted the indentation of the changed line is different
from the existing one, is there are there style guideline for OE
recipes and classes?

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

--Signature=_Mon__21_Jun_2010_17_09_46_+0200_.2qeIPmWq+51=+Kg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwfgLoACgkQ5xr2akVTsAHIrwCgsBj1OpLeB63V9QPWK9MI0O3d
f5cAoK5isueHZml/cQPVE9aKNikXVrVu
=qh2V
-----END PGP SIGNATURE-----

--Signature=_Mon__21_Jun_2010_17_09_46_+0200_.2qeIPmWq+51=+Kg--
