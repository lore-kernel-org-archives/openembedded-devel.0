Received: from smtp-out26.alice.it ([85.33.2.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O2KrR-0003oI-2K
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 10:55:47 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 15 Apr 2010 10:52:15 +0200
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 15 Apr 2010 10:52:15 +0200
Received: from jcn ([87.11.136.146]) by FBCMCL01B04.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 15 Apr 2010 10:52:14 +0200
Date: Thu, 15 Apr 2010 10:52:09 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100415105209.32985313.ospite@studenti.unina.it>
In-Reply-To: <20100326161724.0dd4dfda.ospite@studenti.unina.it>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
	<20100325203900.GB17837@gmail.com>
	<20100326161724.0dd4dfda.ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 15 Apr 2010 08:52:14.0387 (UTC)
	FILETIME=[F1C4C030:01CADC78]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
Subject: Re: [PATCH 0/5] Misc updates for EZX bits in OE
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
X-List-Received-Date: Thu, 15 Apr 2010 08:55:47 -0000
X-Groupsio-MsgNum: 18627
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__15_Apr_2010_10_52_09_+0200_EpJqaD_jX1SWPMdU"

--Signature=_Thu__15_Apr_2010_10_52_09_+0200_EpJqaD_jX1SWPMdU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Mar 2010 16:17:24 +0100
Antonio Ospite <ospite@studenti.unina.it> wrote:

> On Thu, 25 Mar 2010 13:39:00 -0700
> Khem Raj <raj.khem@gmail.com> wrote:
>=20
> > On (25/03/10 18:19), Antonio Ospite wrote:
> > > Hi,
> > >=20
> > > here are some updates for EZX bits in OE.
> > >=20
> > > With these changes we have a working image to experiment with ts27010=
mux
> > > driver and ezxd, no fso support yet. Tested on Motorola A780.
> > >=20
> > > Note that although ezx-gen-blob builds fine now, it seems to have iss=
ues with
> > > GCC 4.4: the binary size is about 300KiB instead of the expected 64Ki=
B, if
> > > anyone has a clue please let me know.
> >=20
> > I can help you here. If you can give me the two images with symbols and
> > your linking script it uses. Secondly are you using same binutils/ld in
> > both cases ?
> >
>=20
> Here are more details:
> A gcc-4.1.2 toolchain[1] produces the expected result,
> the current gcc-4.4.2 toolchain[2] from 'minimal' distro does not.
>

Hi Khem, would you be able to take a look at this?
The attachments I sent in the old mail are still available here:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/31488/focus=3D315=
20

Thanks,
   Antonio

> I am using the very ld the toolchain provides, so I they are
> different, and I noted than the 4.4.2 one gives this warning:
> .../arm-oe-linux-gnueabi/bin/ld:
> warning: section `.bss' type changed to PROGBITS
>=20
> The problem seems to rise during linking indeed, the size difference
> of .o files produced by the two toolchains is ~ 3 KiB overall, it does
> not seem to justify the bump I have after linking to more than 200KiB.
>=20
> I am attaching here the two binaries before stripping, but also some
> scripts to easily recreate the entire scenario, since I am not sure of
> what you exactly need to find out what's happening.
> The command used for linking is attached as well.
>=20
> Thanks,
>    Antonio
>=20

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Thu__15_Apr_2010_10_52_09_+0200_EpJqaD_jX1SWPMdU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvG07kACgkQ5xr2akVTsAH0UQCgo6fpOYp5JKS7na3K68RE8v+W
O3cAoJ4dVL0hu3rere4R8rcRwnFCKlW7
=AF5I
-----END PGP SIGNATURE-----

--Signature=_Thu__15_Apr_2010_10_52_09_+0200_EpJqaD_jX1SWPMdU--
