Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P4GGL-00019w-Ne
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 18:57:43 +0200
Received: by iwn7 with SMTP id 7so41271iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=/E5OXrhzxdK879BggtaU8I2gHDgNaZvqRLBEAUklHds=;
	b=Xd3szVZPzOsUDuIxvpymPEIjRyn5fJPmV+1lL8mT1doymGoKa30HqzKkfxMz6ZWEcZ
	6fjCgUmzXqP5gTDegNv4wXcE+Fu2fR0QlzOIS36BZqbu+jSRNJKilrrA692UgOm409ek
	QuleA7KRpjoY+uZM3r/m7lzEYQWxDOHQ3BAC8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=miaVUh9TK69FVxBdQAy26yle8UTTvjHTsR5iw3C6d9G1RcCUeCoaUZKL8xVb4A4SqG
	4JZaIJjV1A9OySUwubl/pCeJ/16qIQqKLRTXOC6y/8GM54UPMzsZoq14O/j6aWoG/Vj/
	JfhaXtBy4TtmIxIZdR5SO3ijuCnU/xpZQqj+k=
Received: by 10.231.19.3 with SMTP id y3mr2447784iba.156.1286557039746; Fri,
	08 Oct 2010 09:57:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Fri, 8 Oct 2010 09:56:58 -0700 (PDT)
In-Reply-To: <AANLkTinX0isHHTDvHDOc-gFWOd6KhC6CtqGgVMXC47O3@mail.gmail.com>
References: <E1P3wQM-0000Bi-H2@melo.openembedded.org>
	<AANLkTinX0isHHTDvHDOc-gFWOd6KhC6CtqGgVMXC47O3@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Oct 2010 09:56:58 -0700
Message-ID: <AANLkTim7c-tb_vDts12eMU_YNfKKcqdJDYL+nu5xuYFP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Fri, 08 Oct 2010 16:57:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have reverted it for now.

On Fri, Oct 8, 2010 at 9:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Thu, Oct 7, 2010 at 9:46 PM, git version control
> <git@git.openembedded.org> wrote:
>> Module: openembedded.git
>> Branch: master
>> Commit: 8e1eef82a09c14668a125c720cfcd354bbeb42cf
>> URL: =C2=A0 =C2=A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=
=3Dcommit;h=3D8e1eef82a09c14668a125c720cfcd354bbeb42cf
>>
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date: =C2=A0 Thu Oct =C2=A07 12:45:36 2010 -0700
>>
>> gcc-4.5: Fix asm out of range errors seen on thumb when using -O1
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Not sure if it can be caused by this patch, but after rebuilding dbus
> with this gcc I got
>
> SIGILL while starting dbus-daemon --session on armv4t (om-gta02)
>
> Any hints? I'm leaving for weekend so not sure how often I'll be
> online or able to debug/test it.
>
> Program received signal SIGILL, Illegal instruction.
> 0x40041164 in utf8_encoding () from /usr/lib/libexpat.so.1
> (gdb) back
> #0 =C2=A00x40041164 in utf8_encoding () from /usr/lib/libexpat.so.1
> #1 =C2=A00x2a00789a in bus_config_parser_content ()
> #2 =C2=A00x400410f8 in features.3438 () from /usr/lib/libexpat.so.1
> #3 =C2=A00x400410f8 in features.3438 () from /usr/lib/libexpat.so.1
> Backtrace stopped: previous frame identical to this frame (corrupt stack?=
)
> (gdb) disass
> Dump of assembler code for function utf8_encoding:
> =C2=A0 0x400410f8 <+0>: =C2=A0 =C2=A0 andmi =C2=A0 r0, r3, pc, ror #8
> =C2=A0 0x400410fc <+4>: =C2=A0 =C2=A0 ldrdmi =C2=A0pc, [r2], -r5
> =C2=A0 0x40041100 <+8>: =C2=A0 =C2=A0 andmi =C2=A0 r12, r2, r3, lsl r0
> =C2=A0 0x40041104 <+12>: =C2=A0 =C2=A0andmi =C2=A0 r12, r2, r5, asr #13
> =C2=A0 0x40041108 <+16>: =C2=A0 =C2=A0andmi =C2=A0 r12, r2, sp, ror r5
> =C2=A0 0x4004110c <+20>: =C2=A0 =C2=A0andmi =C2=A0 r12, r2, sp, lsl r6
> =C2=A0 0x40041110 <+24>: =C2=A0 =C2=A0andmi =C2=A0 r12, r2, r7, lsl r10
> =C2=A0 0x40041114 <+28>: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0; <UNDEFINED> instruction: 0x4002cab9
> =C2=A0 0x40041118 <+32>: =C2=A0 =C2=A0andmi =C2=A0 r12, r2, r1, ror #21
> =C2=A0 0x4004111c <+36>: =C2=A0 =C2=A0andmi =C2=A0 r12, r2, r3, lsr #22
> =C2=A0 0x40041120 <+40>: =C2=A0 =C2=A0andmi =C2=A0 r12, r2, r1, lsl r8
> =C2=A0 0x40041124 <+44>: =C2=A0 =C2=A0andmi =C2=A0 pc, r2, r5, ror r0 =C2=
=A0 =C2=A0 =C2=A0; <UNPREDICTABLE>
> =C2=A0 0x40041128 <+48>: =C2=A0 =C2=A0andmi =C2=A0 r12, r2, sp, lsl #19
> =C2=A0 0x4004112c <+52>: =C2=A0 =C2=A0andmi =C2=A0 r12, r2, r5, asr r11
> =C2=A0 0x40041130 <+56>: =C2=A0 =C2=A0andmi =C2=A0 r12, r2, r11, lsr #15
> =C2=A0 0x40041134 <+60>: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0; <UNDEFINED> instruction: 0x4002cbbf
> =C2=A0 0x40041138 <+64>: =C2=A0 =C2=A0andmi =C2=A0 r12, r2, r5, lsl #24
> =C2=A0 0x4004113c <+68>: =C2=A0 =C2=A0andeq =C2=A0 r0, r0, r1
> =C2=A0 0x40041140 <+72>: =C2=A0 =C2=A0andeq =C2=A0 r0, r0, r1
> =C2=A0 0x40041144 <+76>: =C2=A0 =C2=A0andeq =C2=A0 r0, r0, r0
> =C2=A0 0x40041148 <+80>: =C2=A0 =C2=A0andeq =C2=A0 r0, r0, r0
> =C2=A0 0x4004114c <+84>: =C2=A0 =C2=A0andeq =C2=A0 r1, r10, r0, lsl #10
> =C2=A0 0x40041150 <+88>: =C2=A0 =C2=A0andeq =C2=A0 r0, r0, r0, lsl #18
> =C2=A0 0x40041154 <+92>: =C2=A0 =C2=A0andeq =C2=A0 r0, r0, r0
> =C2=A0 0x40041158 <+96>: =C2=A0 =C2=A0andeq =C2=A0 r0, r0, r0
> =C2=A0 0x4004115c <+100>: =C2=A0 andeq =C2=A0 r0, r0, r0
> =C2=A0 0x40041160 <+104>: =C2=A0 andeq =C2=A0 r0, r0, r0
> =3D> 0x40041164 <+108>: =C2=A0 movwne =C2=A0r1, #49173 =C2=A0 =C2=A0 =C2=
=A0; 0xc015
> =C2=A0 0x40041168 <+112>: =C2=A0 stceq =C2=A0 14, cr1, [r3, #-112] =C2=A0=
 =C2=A0; 0xffffff90
> =C2=A0 0x4004116c <+116>: =C2=A0 eorcs =C2=A0 r2, r1, #31
> =C2=A0 0x40041170 <+120>: =C2=A0 tstne =C2=A0 r10, r3, lsr #22
> =C2=A0 0x40041174 <+124>: =C2=A0 ldmdbne r9, {r0, r3, r4, r8, r11, r12}
> =C2=A0 0x40041178 <+128>: =C2=A0 ldmdbne r9, {r0, r3, r4, r8, r11, r12}
>
>> =C2=A0recipes/gcc/gcc-4.5.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +-
>> =C2=A0.../gcc-4.5/thumb-asm-out-of-range-pr43961.patch =C2=A0 | =C2=A0 2=
1 ++++++++++++++++++++
>> =C2=A02 files changed, 23 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
>> index 36d12ec..0fe53b4 100644
>> --- a/recipes/gcc/gcc-4.5.inc
>> +++ b/recipes/gcc/gcc-4.5.inc
>> @@ -8,7 +8,7 @@ DEPENDS =3D "mpfr gmp libmpc libelf"
>> =C2=A0NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native"
>>
>>
>> -INC_PR =3D "r12"
>> +INC_PR =3D "r13"
>>
>> =C2=A0SRCREV =3D "164562"
>> =C2=A0PV =3D "4.5"
>> @@ -119,6 +119,7 @@ SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;modu=
le=3D${BRANCH} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99398.p=
atch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-vmovl-PR45805.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-scalar-widening-pr45847.pa=
tch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://thumb-asm-out-of-range-pr4396=
1.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>>
>> =C2=A0SRC_URI_append_mips64 =3D " file://mips64-nomultilib.patch"
>> diff --git a/recipes/gcc/gcc-4.5/thumb-asm-out-of-range-pr43961.patch b/=
recipes/gcc/gcc-4.5/thumb-asm-out-of-range-pr43961.patch
>> new file mode 100644
>> index 0000000..ec7e823
>> --- /dev/null
>> +++ b/recipes/gcc/gcc-4.5/thumb-asm-out-of-range-pr43961.patch
>> @@ -0,0 +1,21 @@
>> +gcc/
>> +
>> +2010-06-22 =C2=A0Mikael Pettersson =C2=A0<mikpe@it.uu.se>
>> +
>> + =C2=A0 =C2=A0 =C2=A0 PR target/43961
>> + =C2=A0 =C2=A0 =C2=A0 * config/arm/arm.h (ADDR_VEC_ALIGN): Describe add=
ed
>> + =C2=A0 =C2=A0 =C2=A0 alignment for Thumb-1 compressed switch tables.
>> +
>> +--- gcc-4.6-20100619/gcc/config/arm/arm.h.~1~ =C2=A02010-06-16 20:02:58=
.000000000 +0200
>> ++++ gcc-4.6-20100619/gcc/config/arm/arm.h =C2=A0 =C2=A0 =C2=A02010-06-2=
2 14:03:52.000000000 +0200
>> +@@ -2320,7 +2320,8 @@ extern int making_const_table;
>> + =C2=A0 =C2=A0 } while (0)
>> +
>> + /* Jump table alignment is explicit in ASM_OUTPUT_CASE_LABEL. =C2=A0*/
>> +-#define ADDR_VEC_ALIGN(JUMPTABLE) 0
>> ++#define ADDR_VEC_ALIGN(JUMPTABLE) =C2=A0 =C2=A0 \
>> ++ =C2=A0((TARGET_THUMB && GET_MODE (PATTERN (JUMPTABLE)) =3D=3D SImode)=
 ? 2 : 0)
>> +
>> + /* This is how to output a label which precedes a jumptable. =C2=A0Sin=
ce
>> + =C2=A0 =C2=A0Thumb instructions are 2 bytes, we may need explicit alig=
nment here. =C2=A0*/
>> +
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


