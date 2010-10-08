Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P4FxJ-00016V-13
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 18:38:01 +0200
Received: by wwe15 with SMTP id 15so1111963wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 09:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=eWU3k7Oe7jjgDS2AdEC0RwYSBk4VXGO0CF8LQTgYhjw=;
	b=xgC7CwUh6M8lt1Yn9HLRPty1bsQpPlWyQFTOecYGETNn5Sc7eTfNifHMmsdQYwXx92
	gDEvMm9AQcLSlMlmuemMk6ofVsFmSJzycOXMSsn0BaixYA7i/3X/lB6CXsep7+zQimOg
	18g2zzYxn1E31Tf/+J4uMDAYGtY30v9RIllto=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=dQNA/hqMZkq77fdfgMPsDu6GtY3eaBeaMZ3elj96PM1fXPdhKDaCfPzzIBAN/nBR7S
	CM13BAfFr4033UHH0jBn4pXR7ORkKvAqhrlrXyA4DJzmfHG1kZsZcp6IuZBS7TEBzJdb
	2J06lXyeS7N/gRlRFNk066M/yC0OttWdBxoVE=
MIME-Version: 1.0
Received: by 10.227.132.199 with SMTP id c7mr2689127wbt.89.1286555854228; Fri,
	08 Oct 2010 09:37:34 -0700 (PDT)
Received: by 10.227.141.70 with HTTP; Fri, 8 Oct 2010 09:37:30 -0700 (PDT)
In-Reply-To: <E1P3wQM-0000Bi-H2@melo.openembedded.org>
References: <E1P3wQM-0000Bi-H2@melo.openembedded.org>
Date: Fri, 8 Oct 2010 18:37:30 +0200
Message-ID: <AANLkTinX0isHHTDvHDOc-gFWOd6KhC6CtqGgVMXC47O3@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Khem Raj : gcc-4.5: Fix asm out of range errors seen on thumb when using -O1
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
X-List-Received-Date: Fri, 08 Oct 2010 16:38:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2010 at 9:46 PM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: master
> Commit: 8e1eef82a09c14668a125c720cfcd354bbeb42cf
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3D8e1eef82a09c14668a125c720cfcd354bbeb42cf
>
> Author: Khem Raj <raj.khem@gmail.com>
> Date: =A0 Thu Oct =A07 12:45:36 2010 -0700
>
> gcc-4.5: Fix asm out of range errors seen on thumb when using -O1
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Not sure if it can be caused by this patch, but after rebuilding dbus
with this gcc I got

SIGILL while starting dbus-daemon --session on armv4t (om-gta02)

Any hints? I'm leaving for weekend so not sure how often I'll be
online or able to debug/test it.

Program received signal SIGILL, Illegal instruction.
0x40041164 in utf8_encoding () from /usr/lib/libexpat.so.1
(gdb) back
#0  0x40041164 in utf8_encoding () from /usr/lib/libexpat.so.1
#1  0x2a00789a in bus_config_parser_content ()
#2  0x400410f8 in features.3438 () from /usr/lib/libexpat.so.1
#3  0x400410f8 in features.3438 () from /usr/lib/libexpat.so.1
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
(gdb) disass
Dump of assembler code for function utf8_encoding:
   0x400410f8 <+0>:     andmi   r0, r3, pc, ror #8
   0x400410fc <+4>:     ldrdmi  pc, [r2], -r5
   0x40041100 <+8>:     andmi   r12, r2, r3, lsl r0
   0x40041104 <+12>:    andmi   r12, r2, r5, asr #13
   0x40041108 <+16>:    andmi   r12, r2, sp, ror r5
   0x4004110c <+20>:    andmi   r12, r2, sp, lsl r6
   0x40041110 <+24>:    andmi   r12, r2, r7, lsl r10
   0x40041114 <+28>:                    ; <UNDEFINED> instruction: 0x4002ca=
b9
   0x40041118 <+32>:    andmi   r12, r2, r1, ror #21
   0x4004111c <+36>:    andmi   r12, r2, r3, lsr #22
   0x40041120 <+40>:    andmi   r12, r2, r1, lsl r8
   0x40041124 <+44>:    andmi   pc, r2, r5, ror r0      ; <UNPREDICTABLE>
   0x40041128 <+48>:    andmi   r12, r2, sp, lsl #19
   0x4004112c <+52>:    andmi   r12, r2, r5, asr r11
   0x40041130 <+56>:    andmi   r12, r2, r11, lsr #15
   0x40041134 <+60>:                    ; <UNDEFINED> instruction: 0x4002cb=
bf
   0x40041138 <+64>:    andmi   r12, r2, r5, lsl #24
   0x4004113c <+68>:    andeq   r0, r0, r1
   0x40041140 <+72>:    andeq   r0, r0, r1
   0x40041144 <+76>:    andeq   r0, r0, r0
   0x40041148 <+80>:    andeq   r0, r0, r0
   0x4004114c <+84>:    andeq   r1, r10, r0, lsl #10
   0x40041150 <+88>:    andeq   r0, r0, r0, lsl #18
   0x40041154 <+92>:    andeq   r0, r0, r0
   0x40041158 <+96>:    andeq   r0, r0, r0
   0x4004115c <+100>:   andeq   r0, r0, r0
   0x40041160 <+104>:   andeq   r0, r0, r0
=3D> 0x40041164 <+108>:   movwne  r1, #49173      ; 0xc015
   0x40041168 <+112>:   stceq   14, cr1, [r3, #-112]    ; 0xffffff90
   0x4004116c <+116>:   eorcs   r2, r1, #31
   0x40041170 <+120>:   tstne   r10, r3, lsr #22
   0x40041174 <+124>:   ldmdbne r9, {r0, r3, r4, r8, r11, r12}
   0x40041178 <+128>:   ldmdbne r9, {r0, r3, r4, r8, r11, r12}

> =A0recipes/gcc/gcc-4.5.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A03 +-
> =A0.../gcc-4.5/thumb-asm-out-of-range-pr43961.patch =A0 | =A0 21 ++++++++=
++++++++++++
> =A02 files changed, 23 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
> index 36d12ec..0fe53b4 100644
> --- a/recipes/gcc/gcc-4.5.inc
> +++ b/recipes/gcc/gcc-4.5.inc
> @@ -8,7 +8,7 @@ DEPENDS =3D "mpfr gmp libmpc libelf"
> =A0NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native"
>
>
> -INC_PR =3D "r12"
> +INC_PR =3D "r13"
>
> =A0SRCREV =3D "164562"
> =A0PV =3D "4.5"
> @@ -119,6 +119,7 @@ SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;modul=
e=3D${BRANCH} \
> =A0 =A0 =A0 =A0 =A0 file://linaro/gcc-4.5-linaro-r99398.patch \
> =A0 =A0 =A0 =A0 =A0 file://gcc-vmovl-PR45805.patch \
> =A0 =A0 =A0 =A0 =A0 file://gcc-scalar-widening-pr45847.patch \
> + =A0 =A0 =A0 =A0 =A0file://thumb-asm-out-of-range-pr43961.patch \
> =A0 =A0 =A0 =A0 =A0"
>
> =A0SRC_URI_append_mips64 =3D " file://mips64-nomultilib.patch"
> diff --git a/recipes/gcc/gcc-4.5/thumb-asm-out-of-range-pr43961.patch b/r=
ecipes/gcc/gcc-4.5/thumb-asm-out-of-range-pr43961.patch
> new file mode 100644
> index 0000000..ec7e823
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/thumb-asm-out-of-range-pr43961.patch
> @@ -0,0 +1,21 @@
> +gcc/
> +
> +2010-06-22 =A0Mikael Pettersson =A0<mikpe@it.uu.se>
> +
> + =A0 =A0 =A0 PR target/43961
> + =A0 =A0 =A0 * config/arm/arm.h (ADDR_VEC_ALIGN): Describe added
> + =A0 =A0 =A0 alignment for Thumb-1 compressed switch tables.
> +
> +--- gcc-4.6-20100619/gcc/config/arm/arm.h.~1~ =A02010-06-16 20:02:58.000=
000000 +0200
> ++++ gcc-4.6-20100619/gcc/config/arm/arm.h =A0 =A0 =A02010-06-22 14:03:52=
.000000000 +0200
> +@@ -2320,7 +2320,8 @@ extern int making_const_table;
> + =A0 =A0 } while (0)
> +
> + /* Jump table alignment is explicit in ASM_OUTPUT_CASE_LABEL. =A0*/
> +-#define ADDR_VEC_ALIGN(JUMPTABLE) 0
> ++#define ADDR_VEC_ALIGN(JUMPTABLE) =A0 =A0 \
> ++ =A0((TARGET_THUMB && GET_MODE (PATTERN (JUMPTABLE)) =3D=3D SImode) ? 2=
 : 0)
> +
> + /* This is how to output a label which precedes a jumptable. =A0Since
> + =A0 =A0Thumb instructions are 2 bytes, we may need explicit alignment h=
ere. =A0*/
> +
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


