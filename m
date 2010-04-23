Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O5I3U-0007t1-OY
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 14:32:26 +0200
Received: from FBCMMO05.fbc.local ([7.168.68.254]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 23 Apr 2010 14:28:48 +0200
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 23 Apr 2010 14:28:46 +0200
Received: from jcn ([87.1.17.95]) by FBCMCL01B05.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 23 Apr 2010 14:28:45 +0200
Date: Fri, 23 Apr 2010 14:28:39 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100423142839.0ea82f89.ospite@studenti.unina.it>
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
X-OriginalArrivalTime: 23 Apr 2010 12:28:45.0950 (UTC)
	FILETIME=[84A5F1E0:01CAE2E0]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL, BAYES_00, RCVD_ILLEGAL_IP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.openezx.org
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
X-List-Received-Date: Fri, 23 Apr 2010 12:32:26 -0000
X-Groupsio-MsgNum: 18746
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__23_Apr_2010_14_28_39_+0200_lvVyfKJvgu.vpZHl"

--Signature=_Fri__23_Apr_2010_14_28_39_+0200_lvVyfKJvgu.vpZHl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

WARNING:
This was going to be a
  "I didn't know what I was doing but it worked"
kind of post, but then I did some homework and now I think I know a bit
more about what I did :)

The post below is quite lengthy as it contains all the steps I went
through in order to come to some conclusions.

On Fri, 26 Mar 2010 16:17:24 +0100
Antonio Ospite <ospite@studenti.unina.it> wrote:

> On Thu, 25 Mar 2010 13:39:00 -0700
> Khem Raj <raj.khem@gmail.com> wrote:
>=20
> > On (25/03/10 18:19), Antonio Ospite wrote:
[...]
> > > Note that although ezx-gen-blob builds fine now, it seems to have iss=
ues with
> > > GCC 4.4: the binary size is about 300KiB instead of the expected 64Ki=
B, if
> > > anyone has a clue please let me know.
> >

Comparing the section sizes for the two binaries:
   text    data     bss     dec     hex filename
  40212   20764  244356  305332   4a8b4 blob-rest-elf32-with-gcc-4.1.2
  39595  265124       4  304723   4a653 blob-rest-elf32-with-gcc-4.4.2

So something fishing about the data and bss sections. After reading
a bit about what ELF sections are[0,1] I'd guess gcc-4.4.2 might be
forcing initializations for uninitialized data putting it in the
binary image and that makes the object file size grow.

This explanation would also help me to understand more the warning
message:
.../arm-oe-linux-gnueabi/bin/ld:
warning: section `.bss' type changed to PROGBITS

> > I can help you here. If you can give me the two images with symbols and
> > your linking script it uses. Secondly are you using same binutils/ld in
> > both cases ?
> >
>

I also had to learn what a linker script[2] is, it can be used to
define sections properties and object files layout, right?
The one used by blob/gen-blob is here:
http://svn.openezx.org/trunk/src/blob/gen-blob/src/blob/rest-ld-script.in

Now, looking at the bss section, I noted that there is a "nested"
"stack" section, this is different from the other sections, so as a
first naive/blind try I changed that from:
	. =3D ALIGN(4);
	.bss : {
		__bss_start =3D .;
		/* first the real BSS data */
		*(.bss)=20

		/* and next the stack */
		. =3D ALIGN(4);
		__stack_start =3D .;
		*(.stack)
		__stack_end =3D .;
		__bss_end =3D .;
	}
to
	/* the BSS section should *always* be the last section */
	. =3D ALIGN(4);
	.bss : {
		__bss_start =3D .;
		/* first the real BSS data */
		*(.bss)=20
		__bss_end =3D .;
	}

	/* and next the stack */
	. =3D ALIGN(4);
	.stack : {
		__stack_start =3D .;
		*(.stack)
		__stack_end =3D .;
	}

And the binary sizes is now:
   text    data     bss     dec     hex filename
  40212   20764  244356  305332   4a8b4 blob-rest-elf32-with-gcc-4.1.2
  39595   20772  227972  288339   46653 blob-rest-elf32-with-gcc-4.4.2

The "strange thing" is that after this blind change from a very rough
guess-work the binary even seemed to work... so I did some more research
to figure out a more "correct" solution.

I found out somewhere on the interwebs that the "nesting" shouldn't be a
problem, and that stack size can be defined directly inside the
linker script, like in [3], so I tried with this change (getting the
actual stack size from src/blob/stack.S):

Index: gen-blob-with-gcc-4.4.2/src/blob/rest-ld-script.in
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- gen-blob-with-gcc-4.4.2.orig/src/blob/rest-ld-script.in
+++ gen-blob-with-gcc-4.4.2/src/blob/rest-ld-script.in
@@ -97,7 +97,8 @@
                /* and next the stack */
                . =3D ALIGN(4);
                __stack_start =3D .;
-               *(.stack)
+               /* allocate a 16kB stack */
+               . =3D . + 16 * 1024;
                __stack_end =3D .;
                __bss_end =3D .;


Sizes are now:
   text    data     bss     dec     hex filename
  40212   20764  244356  305332   4a8b4 blob-rest-elf32-with-gcc-4.1.2
  39595   20772  244356  304723   4a653 blob-rest-elf32-with-gcc-4.4.2

bss size matches, this a good sign, not a coincidence, isnt'it? And
the binary still works. Is that really ok?

[...]
> I am using the very ld the toolchain provides, so I they are
> different, and I noted than the 4.4.2 one gives this warning:
> .../arm-oe-linux-gnueabi/bin/ld:
> warning: section `.bss' type changed to PROGBITS
>

This warning goes away with either the changes above.

So the last patch above would look ok to me, I think I figured out WHAT
was happening, but I don't understand WHY this change is necessary.
Is that the section name ".stack" defined in stack.S is not recognized?
If so, why?

Khem I am now only asking you if you can help me understand why newer
GCCs don't behave in the same way as older ones wrt. this aspect.
Thanks.

> The problem seems to rise during linking indeed, the size difference
> of .o files produced by the two toolchains is ~ 3 KiB overall, it does
> not seem to justify the bump I have after linking to more than 200KiB.
>

After several hours spent on this, but with at least some XP gained :)
Yours truly,
   Antonio

[0]
http://infocenter.arm.com/help/topic/com.arm.doc.dui0101a/DUI0101A_Elf.pdf
[1]
http://www.tortall.net/projects/yasm/manual/html/objfmt-elf-section.html
[2] http://www.math.utah.edu/docs/info/ld_toc.html#SEC4
[3] http://sourceware.org/ml/binutils/2007-11/msg00016.html

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Fri__23_Apr_2010_14_28_39_+0200_lvVyfKJvgu.vpZHl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvRkncACgkQ5xr2akVTsAE2BgCeNn3Dhv04wDSOfzEu5PrY/EjU
NJUAn3ejPaRmjqKFe7vsX+sELyHXEOne
=NvXR
-----END PGP SIGNATURE-----

--Signature=_Fri__23_Apr_2010_14_28_39_+0200_lvVyfKJvgu.vpZHl--
