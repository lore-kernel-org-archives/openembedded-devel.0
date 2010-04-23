Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O5OkD-0004zN-E6
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 21:40:59 +0200
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 23 Apr 2010 21:37:19 +0200
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 23 Apr 2010 21:37:19 +0200
Received: from jcn ([87.1.17.95]) by FBCMCL01B09.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 23 Apr 2010 21:37:18 +0200
Date: Fri, 23 Apr 2010 21:37:12 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: Khem Raj <raj.khem@gmail.com>
Message-Id: <20100423213712.f7792bb8.ospite@studenti.unina.it>
In-Reply-To: <u2y19c1b8a91004230945z4879e2cbsbc4350aad85f7268@mail.gmail.com>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
	<20100325203900.GB17837@gmail.com>
	<20100326161724.0dd4dfda.ospite@studenti.unina.it>
	<20100423142839.0ea82f89.ospite@studenti.unina.it>
	<u2y19c1b8a91004230945z4879e2cbsbc4350aad85f7268@mail.gmail.com>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 23 Apr 2010 19:37:18.0505 (UTC)
	FILETIME=[62867990:01CAE31C]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org, openembedded-devel@lists.openembedded.org
Subject: Re: gen-blob size with gcc-4.4.2 SOLVED? (was: [PATCH 0/5] Misc updates for EZX bits in OE)
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
X-List-Received-Date: Fri, 23 Apr 2010 19:40:59 -0000
X-Groupsio-MsgNum: 18759
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__23_Apr_2010_21_37_12_+0200_E6ka+.kdWSGnzFb+"

--Signature=_Fri__23_Apr_2010_21_37_12_+0200_E6ka+.kdWSGnzFb+
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Apr 2010 09:45:04 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Apr 23, 2010 at 5:28 AM, Antonio Ospite
> <ospite@studenti.unina.it> wrote:
[...]
> > On Fri, 26 Mar 2010 16:17:24 +0100
> > Antonio Ospite <ospite@studenti.unina.it> wrote:
> >
> >> On Thu, 25 Mar 2010 13:39:00 -0700
> >> Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> > On (25/03/10 18:19), Antonio Ospite wrote:
> > [...]
> >> > > Note that although ezx-gen-blob builds fine now, it seems to have =
issues with
> >> > > GCC 4.4: the binary size is about 300KiB instead of the expected 6=
4KiB, if
> >> > > anyone has a clue please let me know.
> >> >
> >
> > Comparing the section sizes for the two binaries:
> > =C2=A0 text =C2=A0 =C2=A0data =C2=A0 =C2=A0 bss =C2=A0 =C2=A0 dec =C2=
=A0 =C2=A0 hex filename
> > =C2=A040212 =C2=A0 20764 =C2=A0244356 =C2=A0305332 =C2=A0 4a8b4 blob-re=
st-elf32-with-gcc-4.1.2
> > =C2=A039595 =C2=A0265124 =C2=A0 =C2=A0 =C2=A0 4 =C2=A0304723 =C2=A0 4a6=
53 blob-rest-elf32-with-gcc-4.4.2
> >
> > So something fishing about the data and bss sections. After reading
> > a bit about what ELF sections are[0,1] I'd guess gcc-4.4.2 might be
> > forcing initializations for uninitialized data putting it in the
> > binary image and that makes the object file size grow.
> >
[...]
> >
> > Index: gen-blob-with-gcc-4.4.2/src/blob/rest-ld-script.in
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > --- gen-blob-with-gcc-4.4.2.orig/src/blob/rest-ld-script.in
> > +++ gen-blob-with-gcc-4.4.2/src/blob/rest-ld-script.in
> > @@ -97,7 +97,8 @@
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* and next the =
stack */
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. =3D ALIGN(4);
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__stack_start =
=3D .;
> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.stack)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* allocate a 16kB s=
tack */
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 . =3D . + 16 * 1024;
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__stack_end =3D =
.;
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__bss_end =3D .;
> >
>=20
>=20
> you already have this in stack.S so its not needed. The correct fix would=
 be to
> classify the output segment as NOLOAD explicitly like this
>=20
> 	.bss(NOLOAD) : {
> 		__bss_start =3D .;
> 		/* first the real BSS data */
> 		*(.bss)
>=20
> 		/* and next the stack */
> 		. =3D ALIGN(4);
> 		__stack_start =3D .;
> 		*(.stack)
> 		__stack_end =3D .;
> 		__bss_end =3D .;
> 	}
>=20
> you should not need any other changes.
>=20

This works in fact. Thanks a lot.

> >> I am using the very ld the toolchain provides, so I they are
> >> different, and I noted than the 4.4.2 one gives this warning:
> >> .../arm-oe-linux-gnueabi/bin/ld:
> >> warning: section `.bss' type changed to PROGBITS
> >>
>=20
> The problem is the .stack is
> not a special nobits section like .bss is so when you club is together
> in .bss then
> there is a mismatch and hence the warning.
>=20

I see, so when using a recent binutils: being .stack considered progbits
by default, .bss =E2=80=94containing it=E2=80=94 is changed to progbits as =
well if we
don't specify otherwise. While with older binutils .bss was kept nobits
in any case?

Thanks again.

Best wishes,
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

--Signature=_Fri__23_Apr_2010_21_37_12_+0200_E6ka+.kdWSGnzFb+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvR9ugACgkQ5xr2akVTsAEzcACcCltw23Got3EkYMxRzSDtJ6jF
5UUAmgKV/2SPc4hfqPJkANrLNcV/00V2
=qGoo
-----END PGP SIGNATURE-----

--Signature=_Fri__23_Apr_2010_21_37_12_+0200_E6ka+.kdWSGnzFb+--
