Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1O5M3W-0004bv-FW
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 18:48:44 +0200
Received: by pvd12 with SMTP id 12so275626pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Apr 2010 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=LzrAr8nfg+DRWm6OXsd9Rg7ik8N0RJNiI/gCyk8P6a4=;
	b=XZam3+cJeuclFBoDWqt4BNYDRENAd/hUT7GtQ53aphH4l6LSoEa8Rppc/ftDfWJcpt
	ruVzhSmsVv//f21svVWLbJvvzLtFxKbGMDymJlJhZN/u7Gn1q7Bn5/QMzR/OfVSEyzhg
	I0C0LxX2rfDIGORo67vROiLxDg4Mo7Qrpr4wo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=NohyUDPANoAvPb3rFM1++FtJs/WJUELidCZdFbuzf84gqN2A+Z/ANGXXyiexXsbAH5
	Aiw6zNIcWK2NjR5ISiP8lVNFCjlM0Nbmwlldumcs9J9XHKpMAiK9hvZvbR6ENLGD1xO5
	0XXlHSV+UutDSCB+rp3xUUHeVx+NfO6gLfQg8=
MIME-Version: 1.0
Received: by 10.140.56.18 with SMTP id e18mr382311rva.167.1272041104169; Fri, 
	23 Apr 2010 09:45:04 -0700 (PDT)
Received: by 10.231.34.72 with HTTP; Fri, 23 Apr 2010 09:45:04 -0700 (PDT)
In-Reply-To: <20100423142839.0ea82f89.ospite@studenti.unina.it>
References: <1269537597-26456-1-git-send-email-ospite@studenti.unina.it>
	<20100325203900.GB17837@gmail.com>
	<20100326161724.0dd4dfda.ospite@studenti.unina.it>
	<20100423142839.0ea82f89.ospite@studenti.unina.it>
Date: Fri, 23 Apr 2010 09:45:04 -0700
Message-ID: <u2y19c1b8a91004230945z4879e2cbsbc4350aad85f7268@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Antonio Ospite <ospite@studenti.unina.it>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Fri, 23 Apr 2010 16:48:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2010 at 5:28 AM, Antonio Ospite
<ospite@studenti.unina.it> wrote:
> WARNING:
> This was going to be a
> =A0"I didn't know what I was doing but it worked"
> kind of post, but then I did some homework and now I think I know a bit
> more about what I did :)
>
> The post below is quite lengthy as it contains all the steps I went
> through in order to come to some conclusions.
>
> On Fri, 26 Mar 2010 16:17:24 +0100
> Antonio Ospite <ospite@studenti.unina.it> wrote:
>
>> On Thu, 25 Mar 2010 13:39:00 -0700
>> Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > On (25/03/10 18:19), Antonio Ospite wrote:
> [...]
>> > > Note that although ezx-gen-blob builds fine now, it seems to have is=
sues with
>> > > GCC 4.4: the binary size is about 300KiB instead of the expected 64K=
iB, if
>> > > anyone has a clue please let me know.
>> >
>
> Comparing the section sizes for the two binaries:
> =A0 text =A0 =A0data =A0 =A0 bss =A0 =A0 dec =A0 =A0 hex filename
> =A040212 =A0 20764 =A0244356 =A0305332 =A0 4a8b4 blob-rest-elf32-with-gcc=
-4.1.2
> =A039595 =A0265124 =A0 =A0 =A0 4 =A0304723 =A0 4a653 blob-rest-elf32-with=
-gcc-4.4.2
>
> So something fishing about the data and bss sections. After reading
> a bit about what ELF sections are[0,1] I'd guess gcc-4.4.2 might be
> forcing initializations for uninitialized data putting it in the
> binary image and that makes the object file size grow.
>
> This explanation would also help me to understand more the warning
> message:
> .../arm-oe-linux-gnueabi/bin/ld:
> warning: section `.bss' type changed to PROGBITS
>
>> > I can help you here. If you can give me the two images with symbols an=
d
>> > your linking script it uses. Secondly are you using same binutils/ld i=
n
>> > both cases ?
>> >
>>
>
> I also had to learn what a linker script[2] is, it can be used to
> define sections properties and object files layout, right?
> The one used by blob/gen-blob is here:
> http://svn.openezx.org/trunk/src/blob/gen-blob/src/blob/rest-ld-script.in
>
> Now, looking at the bss section, I noted that there is a "nested"
> "stack" section, this is different from the other sections, so as a
> first naive/blind try I changed that from:
> =A0 =A0 =A0 =A0. =3D ALIGN(4);
> =A0 =A0 =A0 =A0.bss : {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__bss_start =3D .;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* first the real BSS data */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*(.bss)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* and next the stack */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0. =3D ALIGN(4);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__stack_start =3D .;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*(.stack)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__stack_end =3D .;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__bss_end =3D .;
> =A0 =A0 =A0 =A0}
> to
> =A0 =A0 =A0 =A0/* the BSS section should *always* be the last section */
> =A0 =A0 =A0 =A0. =3D ALIGN(4);
> =A0 =A0 =A0 =A0.bss : {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__bss_start =3D .;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* first the real BSS data */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*(.bss)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__bss_end =3D .;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* and next the stack */
> =A0 =A0 =A0 =A0. =3D ALIGN(4);
> =A0 =A0 =A0 =A0.stack : {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__stack_start =3D .;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*(.stack)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__stack_end =3D .;
> =A0 =A0 =A0 =A0}
>
> And the binary sizes is now:
> =A0 text =A0 =A0data =A0 =A0 bss =A0 =A0 dec =A0 =A0 hex filename
> =A040212 =A0 20764 =A0244356 =A0305332 =A0 4a8b4 blob-rest-elf32-with-gcc=
-4.1.2
> =A039595 =A0 20772 =A0227972 =A0288339 =A0 46653 blob-rest-elf32-with-gcc=
-4.4.2
>
> The "strange thing" is that after this blind change from a very rough
> guess-work the binary even seemed to work... so I did some more research
> to figure out a more "correct" solution.
>
> I found out somewhere on the interwebs that the "nesting" shouldn't be a
> problem, and that stack size can be defined directly inside the
> linker script, like in [3], so I tried with this change (getting the
> actual stack size from src/blob/stack.S):
>
> Index: gen-blob-with-gcc-4.4.2/src/blob/rest-ld-script.in
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- gen-blob-with-gcc-4.4.2.orig/src/blob/rest-ld-script.in
> +++ gen-blob-with-gcc-4.4.2/src/blob/rest-ld-script.in
> @@ -97,7 +97,8 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* and next the stack */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0. =3D ALIGN(4);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__stack_start =3D .;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 *(.stack)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* allocate a 16kB stack */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 . =3D . + 16 * 1024;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__stack_end =3D .;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__bss_end =3D .;
>


you already have this in stack.S so its not needed. The correct fix would b=
e to
classify the output segment as NOLOAD explicitly like this

	.bss(NOLOAD) : {
		__bss_start =3D .;
		/* first the real BSS data */
		*(.bss)

		/* and next the stack */
		. =3D ALIGN(4);
		__stack_start =3D .;
		*(.stack)
		__stack_end =3D .;
		__bss_end =3D .;
	}

you should not need any other changes.

>
> Sizes are now:
> =A0 text =A0 =A0data =A0 =A0 bss =A0 =A0 dec =A0 =A0 hex filename
> =A040212 =A0 20764 =A0244356 =A0305332 =A0 4a8b4 blob-rest-elf32-with-gcc=
-4.1.2
> =A039595 =A0 20772 =A0244356 =A0304723 =A0 4a653 blob-rest-elf32-with-gcc=
-4.4.2
>
> bss size matches, this a good sign, not a coincidence, isnt'it? And
> the binary still works. Is that really ok?
>
> [...]
>> I am using the very ld the toolchain provides, so I they are
>> different, and I noted than the 4.4.2 one gives this warning:
>> .../arm-oe-linux-gnueabi/bin/ld:
>> warning: section `.bss' type changed to PROGBITS
>>

The problem is the .stack is
not a special nobits section like .bss is so when you club is together
in .bss then
there is a mismatch and hence the warning.


>
> This warning goes away with either the changes above.
>
> So the last patch above would look ok to me, I think I figured out WHAT
> was happening, but I don't understand WHY this change is necessary.
> Is that the section name ".stack" defined in stack.S is not recognized?
> If so, why?
>
> Khem I am now only asking you if you can help me understand why newer
> GCCs don't behave in the same way as older ones wrt. this aspect.
> Thanks.
>
>> The problem seems to rise during linking indeed, the size difference
>> of .o files produced by the two toolchains is ~ 3 KiB overall, it does
>> not seem to justify the bump I have after linking to more than 200KiB.
>>
>
> After several hours spent on this, but with at least some XP gained :)
> Yours truly,
> =A0 Antonio
>
> [0]
> http://infocenter.arm.com/help/topic/com.arm.doc.dui0101a/DUI0101A_Elf.pd=
f
> [1]
> http://www.tortall.net/projects/yasm/manual/html/objfmt-elf-section.html
> [2] http://www.math.utah.edu/docs/info/ld_toc.html#SEC4
> [3] http://sourceware.org/ml/binutils/2007-11/msg00016.html
>
> --
> Antonio Ospite
> http://ao2.it
>
> PGP public key ID: 0x4553B001
>
> A: Because it messes up the order in which people normally read text.
> =A0 See http://en.wikipedia.org/wiki/Posting_style
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>


