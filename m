Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QGGL6-0000Be-QH
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Apr 2011 22:00:31 +0200
Received: by ewy5 with SMTP id 5so1433547ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Apr 2011 12:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=K0RpUDmoWP2LfLsrdX1X9jEuA64xgn/mgXKxy2fB4oM=;
	b=hOQkDx3q8QmPQa7kiSVxPGfmSpZ5gDP7zsfIiC7vZSenr3PQw6BQJtxJhXQtuMtcWi
	3oqqEsJ90fpFghDm4dcr+ce7bZQ1Ooh7M7hHUXlR2liDtz1YZZog5LpufQlfsHetOhTL
	s4b0XrV/bTPg6kxK+vAvCec4F158czg1Ii7j0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=miTTgVSj2yxdehXji0utIcmOwagsLMbQ97CAfOHe61UmWI3IvsM1tH0yHfqp8XMvR8
	XbXAituVbco/GNiWglCT+QH2h1UaqDWuILbTFMiwwUVVjwsx4RkxPZL9qMoA1msq6Og7
	wzWqcpHDcyMIWQ79WKNRA0HcI3HmPfKDRmWTA=
Received: by 10.14.4.32 with SMTP id 32mr2671469eei.141.1304192999406; Sat, 30
	Apr 2011 12:49:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Sat, 30 Apr 2011 12:49:28 -0700 (PDT)
In-Reply-To: <iphope$oj1$1@dough.gmane.org>
References: <1304191610-31723-1-git-send-email-raj.khem@gmail.com>
	<iphope$oj1$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Apr 2011 12:49:28 -0700
Message-ID: <BANLkTinoaTAG56=xukYp_xdb0hgSXpez0A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gcc: Upgrade to 4.5.3 and bring in latest linaro updates
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
X-List-Received-Date: Sat, 30 Apr 2011 20:00:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 30, 2011 at 12:43 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 30-04-11 21:26, raj.khem@gmail.com wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> We base now off release tarball of 4.5.3 instead of svn
>> Get relevant new arm linaro patches
>
> Will future commits to the 4.5 branch be brought in as patches and put
> in meta-oe?
>

yes. they will be applied as individual patches like linaro patches.

> regards,
>
> Koen
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta-oe/recipes-devtools/gcc/gcc-4.5.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 25 +-
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch | =C2=A0119 +-
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch | =C2=A0 40 -
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch | =C2=A0 84 --
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99491.patch | =C2=A0309 +++=
++
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch | 1272 ++++++++=
++++++++++++
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch | =C2=A0784 +++=
+++++++++
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch | =C2=A0186 +++
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch | =C2=A0134 ++
>> =C2=A09 files changed, 2754 insertions(+), 199 deletions(-)
>> =C2=A0delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc=
-4.5-linaro-r99481.patch
>> =C2=A0delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc=
-4.5-linaro-r99482.patch
>> =C2=A0create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc=
-4.5-linaro-r99491.patch
>> =C2=A0create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc=
-4.5-linaro-r99494.patch
>> =C2=A0create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc=
-4.5-linaro-r99495.patch
>> =C2=A0create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc=
-4.5-linaro-r99498.patch
>> =C2=A0create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc=
-4.5-linaro-r99502.patch
>>
>> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-=
devtools/gcc/gcc-4.5.inc
>> index 519a1e7..4067d73 100644
>> --- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
>> +++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
>> @@ -13,21 +13,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf3=
3659b29e73d4adb9f9f6552 \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8"
>>
>>
>> -SRCREV =3D "170880"
>> =C2=A0PV =3D "4.5"
>> -INC_PR =3D "r35"
>> -
>> -# BINV should be incremented after updating to a revision
>> -# after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
>> -# the value will be minor-release+1 e.g. if minor release was
>> -# 4.5.1 then the value below will be 2 which will mean 4.5.2
>> -# which will be next minor release and so on.
>> -
>> +INC_PR =3D "r36"
>> +# BINV should =C2=A0point to minor release
>> =C2=A0BINV =3D "${PV}.3"
>> -BRANCH =3D "gcc-4_5-branch"
>> -PR_append =3D "+svnr${SRCPV}"
>>
>> -SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;module=3D${BRANCH} \
>> +SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${BINV}/gcc-${BINV}.tar.bz2 \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch=
 \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://100-uclibc-conf.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-uclibc-locale-ctype_touplow_t.pat=
ch \
>> @@ -175,11 +166,15 @@ SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;mo=
dule=3D${BRANCH} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99478.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99479.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99480.patch \
>> - =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99481.patch \
>> - =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99482.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99483.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99488.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99489.patch \
>> + =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99491.patch \
>> + =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99494.patch \
>> + =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99495.patch \
>> + =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99498.patch \
>> +# =C2=A0 =C2=A0 =C2=A0file://linaro/gcc-4.5-linaro-r99499.patch \
>> + =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99502.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://more-epilogues.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-scalar-widening-pr45847.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-arm-volatile-bitfield-fix.patch \
>> @@ -207,7 +202,7 @@ SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;modu=
le=3D${BRANCH} \
>> =C2=A0FORTRAN =3D ""
>> =C2=A0JAVA =3D ""
>>
>> -S =3D "${WORKDIR}/${BRANCH}"
>> +S =3D "${WORKDIR}/gcc-${BINV}"
>>
>> =C2=A0#EXTRA_OECONF_BASE =3D " =C2=A0--enable-cheaders=3Dc_std \
>> =C2=A0# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--enable-libssp \
>> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-=
r99301.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99301.patch
>> index 95907ee..0943130 100644
>> --- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.=
patch
>> +++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.=
patch
>> @@ -37,9 +37,11 @@
>> =C2=A0 =C2=A0 =C2=A0 gcc/
>>
>> =C2=A0=3D=3D=3D modified file 'gcc/config/arm/arm-modes.def'
>> ---- old/gcc/config/arm/arm-modes.def 2009-06-18 11:24:10 +0000
>> -+++ new/gcc/config/arm/arm-modes.def 2010-07-29 16:58:56 +0000
>> -@@ -35,10 +35,16 @@
>> +Index: gcc-4.5.3/gcc/config/arm/arm-modes.def
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/arm/arm-modes.def
>> ++++ gcc-4.5.3/gcc/config/arm/arm-modes.def
>> +@@ -35,10 +35,16 @@ ADJUST_FLOAT_FORMAT (HF, ((arm_fp16_form
>> =C2=A0 =C2=A0 =C2=A0CC_NOOVmode should be used with SImode integer equal=
ities.
>> =C2=A0 =C2=A0 =C2=A0CC_Zmode should be used if only the Z flag is set co=
rrectly
>> =C2=A0 =C2=A0 =C2=A0CC_Nmode should be used if only the N (sign) flag is=
 set correctly
>> @@ -56,11 +58,11 @@
>> =C2=A0 CC_MODE (CC_SWP);
>> =C2=A0 CC_MODE (CCFP);
>> =C2=A0 CC_MODE (CCFPE);
>> -
>> -=3D=3D=3D modified file 'gcc/config/arm/arm-protos.h'
>> ---- old/gcc/config/arm/arm-protos.h =C2=A02009-11-11 14:23:03 +0000
>> -+++ new/gcc/config/arm/arm-protos.h =C2=A02010-07-29 16:58:56 +0000
>> -@@ -49,8 +49,7 @@
>> +Index: gcc-4.5.3/gcc/config/arm/arm-protos.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/arm/arm-protos.h
>> ++++ gcc-4.5.3/gcc/config/arm/arm-protos.h
>> +@@ -49,8 +49,7 @@ extern int arm_hard_regno_mode_ok (unsig
>> =C2=A0 extern int const_ok_for_arm (HOST_WIDE_INT);
>> =C2=A0 extern int arm_split_constant (RTX_CODE, enum machine_mode, rtx,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HOST_WIDE_INT, rtx, rtx, int);
>> @@ -70,7 +72,7 @@
>> =C2=A0 extern int legitimate_pic_operand_p (rtx);
>> =C2=A0 extern rtx legitimize_pic_address (rtx, enum machine_mode, rtx);
>> =C2=A0 extern rtx legitimize_tls_address (rtx, rtx);
>> -@@ -116,6 +115,7 @@
>> +@@ -116,6 +115,7 @@ extern void arm_reload_in_hi (rtx *);
>> =C2=A0 extern void arm_reload_out_hi (rtx *);
>> =C2=A0 extern int arm_const_double_inline_cost (rtx);
>> =C2=A0 extern bool arm_const_double_by_parts (rtx);
>> @@ -78,11 +80,11 @@
>> =C2=A0 extern const char *fp_immediate_constant (rtx);
>> =C2=A0 extern void arm_emit_call_insn (rtx, rtx);
>> =C2=A0 extern const char *output_call (rtx *);
>> -
>> -=3D=3D=3D modified file 'gcc/config/arm/arm.c'
>> ---- old/gcc/config/arm/arm.c 2010-07-29 15:59:12 +0000
>> -+++ new/gcc/config/arm/arm.c 2010-07-29 16:58:56 +0000
>> -@@ -3190,13 +3190,82 @@
>> +Index: gcc-4.5.3/gcc/config/arm/arm.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/arm/arm.c
>> ++++ gcc-4.5.3/gcc/config/arm/arm.c
>> +@@ -3191,13 +3191,82 @@ arm_gen_constant (enum rtx_code code, en
>> =C2=A0 =C2=A0 =C2=A0immediate value easier to load. =C2=A0*/
>>
>> =C2=A0 enum rtx_code
>> @@ -169,7 +171,7 @@
>> =C2=A0 =C2=A0 switch (code)
>> =C2=A0 =C2=A0 =C2=A0 {
>> =C2=A0 =C2=A0 =C2=A0 case EQ:
>> -@@ -9912,6 +9981,55 @@
>> +@@ -9913,6 +9982,55 @@ arm_select_cc_mode (enum rtx_code op, rt
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 && (rtx_equal_p (XEXP (x, 0), y) || rtx_equa=
l_p (XEXP (x, 1), y)))
>> =C2=A0 =C2=A0 =C2=A0 return CC_Cmode;
>>
>> @@ -225,18 +227,17 @@
>> =C2=A0 =C2=A0 return CCmode;
>> =C2=A0 }
>>
>> -@@ -9921,10 +10039,39 @@
>> +@@ -9922,10 +10040,39 @@ arm_select_cc_mode (enum rtx_code op, rt
>> =C2=A0 rtx
>> =C2=A0 arm_gen_compare_reg (enum rtx_code code, rtx x, rtx y)
>> =C2=A0 {
>> =C2=A0- =C2=A0enum machine_mode mode =3D SELECT_CC_MODE (code, x, y);
>> =C2=A0- =C2=A0rtx cc_reg =3D gen_rtx_REG (mode, CC_REGNUM);
>> --
>> -- =C2=A0emit_set_insn (cc_reg, gen_rtx_COMPARE (mode, x, y));
>> =C2=A0+ =C2=A0enum machine_mode mode;
>> =C2=A0+ =C2=A0rtx cc_reg;
>> =C2=A0+ =C2=A0int dimode_comparison =3D GET_MODE (x) =3D=3D DImode || GE=
T_MODE (y) =3D=3D DImode;
>> -+
>> +
>> +- =C2=A0emit_set_insn (cc_reg, gen_rtx_COMPARE (mode, x, y));
>> =C2=A0+ =C2=A0/* We might have X as a constant, Y as a register because =
of the predicates
>> =C2=A0+ =C2=A0 =C2=A0 used for cmpdi. =C2=A0If so, force X to a register=
 here. =C2=A0*/
>> =C2=A0+ =C2=A0if (dimode_comparison && !REG_P (x))
>> @@ -269,7 +270,7 @@
>>
>> =C2=A0 =C2=A0 return cc_reg;
>> =C2=A0 }
>> -@@ -11253,6 +11400,34 @@
>> +@@ -11254,6 +11401,34 @@ arm_const_double_by_parts (rtx val)
>> =C2=A0 =C2=A0 return false;
>> =C2=A0 }
>>
>> @@ -304,7 +305,7 @@
>> =C2=A0 /* Scan INSN and note any of its operands that need fixing.
>> =C2=A0 =C2=A0 =C2=A0If DO_PUSHES is false we do not actually push any of=
 the fixups
>> =C2=A0 =C2=A0 =C2=A0needed. =C2=A0The function returns TRUE if any fixup=
s were needed/pushed.
>> -@@ -15097,8 +15272,18 @@
>> +@@ -15150,8 +15325,18 @@ arm_print_operand (FILE *stream, rtx x,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0the value being loaded is big-wordian or litt=
le-wordian. =C2=A0The
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0order of the two register loads can matter ho=
wever, if the address
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0of the memory location is actually held in on=
e of the registers
>> @@ -324,7 +325,7 @@
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (GET_CODE (x) !=3D REG || REGNO (x) > LAS=
T_ARM_REGNUM)
>> =C2=A0 =C2=A0 =C2=A0 {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 output_operand_lossage ("invalid operand for=
 code '%c'", code);
>> -@@ -15109,6 +15294,18 @@
>> +@@ -15162,6 +15347,18 @@ arm_print_operand (FILE *stream, rtx x,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>>
>> =C2=A0 =C2=A0 =C2=A0 case 'R':
>> @@ -343,7 +344,7 @@
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (GET_CODE (x) !=3D REG || REGNO (x) > LAS=
T_ARM_REGNUM)
>> =C2=A0 =C2=A0 =C2=A0 {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 output_operand_lossage ("invalid operand for=
 code '%c'", code);
>> -@@ -15801,6 +15998,28 @@
>> +@@ -15854,6 +16051,28 @@ get_arm_condition_code (rtx comparison)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 default: gcc_unreachable ();
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>
>> @@ -372,11 +373,11 @@
>> =C2=A0 =C2=A0 =C2=A0 case CCmode:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (comp_code)
>> =C2=A0 =C2=A0 =C2=A0 {
>> -
>> -=3D=3D=3D modified file 'gcc/config/arm/arm.h'
>> ---- old/gcc/config/arm/arm.h 2009-12-23 16:36:40 +0000
>> -+++ new/gcc/config/arm/arm.h 2010-07-29 16:58:56 +0000
>> -@@ -2253,19 +2253,7 @@
>> +Index: gcc-4.5.3/gcc/config/arm/arm.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/arm/arm.h
>> ++++ gcc-4.5.3/gcc/config/arm/arm.h
>> +@@ -2253,19 +2253,7 @@ extern int making_const_table;
>> =C2=A0 =C2=A0 =C2=A0: reverse_condition (code))
>>
>> =C2=A0 #define CANONICALIZE_COMPARISON(CODE, OP0, OP1) =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \
>> @@ -397,10 +398,10 @@
>>
>> =C2=A0 /* The arm5 clz instruction returns 32. =C2=A0*/
>> =C2=A0 #define CLZ_DEFINED_VALUE_AT_ZERO(MODE, VALUE) =C2=A0((VALUE) =3D=
 32, 1)
>> -
>> -=3D=3D=3D modified file 'gcc/config/arm/arm.md'
>> ---- old/gcc/config/arm/arm.md =C2=A0 =C2=A0 =C2=A0 =C2=A02010-07-29 15:=
59:12 +0000
>> -+++ new/gcc/config/arm/arm.md =C2=A0 =C2=A0 =C2=A0 =C2=A02010-07-29 16:=
58:56 +0000
>> +Index: gcc-4.5.3/gcc/config/arm/arm.md
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/arm/arm.md
>> ++++ gcc-4.5.3/gcc/config/arm/arm.md
>> =C2=A0@@ -6718,17 +6718,45 @@
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0operands[3])); DONE;"
>> =C2=A0 )
>> @@ -506,7 +507,7 @@
>> =C2=A0 ;; Cirrus SF compare instruction
>> =C2=A0 (define_insn "*cirrus_cmpsf"
>> =C2=A0 =C2=A0 [(set (reg:CCFP CC_REGNUM)
>> -@@ -8183,18 +8257,45 @@
>> +@@ -8183,17 +8257,44 @@
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0operands[2], operands[3])); DONE;"
>> =C2=A0 )
>>
>> @@ -519,13 +520,14 @@
>> =C2=A0- =C2=A0"TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK"
>> =C2=A0- =C2=A0"emit_insn (gen_cstore_cc (operands[0], operands[1],
>> =C2=A0- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 operands[2], operands[3])); DONE;"
>> +-)
>> =C2=A0+ =C2=A0 =C2=A0 [(match_operand:DI 2 "cmpdi_operand" "")
>> =C2=A0+ =C2=A0 =C2=A0 =C2=A0(match_operand:DI 3 "cmpdi_operand" "")]))]
>> =C2=A0+ =C2=A0"TARGET_32BIT"
>> =C2=A0+ =C2=A0"{
>> =C2=A0+ =C2=A0 =C2=A0 rtx swap =3D NULL_RTX;
>> =C2=A0+ =C2=A0 =C2=A0 enum rtx_code code =3D GET_CODE (operands[1]);
>> -+
>> +
>> =C2=A0+ =C2=A0 =C2=A0 /* We should not have two constants. =C2=A0*/
>> =C2=A0+ =C2=A0 =C2=A0 gcc_assert (GET_MODE (operands[2]) =3D=3D DImode
>> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || GET_MODE (operands[=
3]) =3D=3D DImode);
>> @@ -553,16 +555,14 @@
>> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 operands[3]));
>> =C2=A0+ =C2=A0 =C2=A0 DONE;
>> =C2=A0+ =C2=A0 }"
>> - )
>> ++)
>>
>> --
>> =C2=A0 (define_expand "cstoresi_eq0_thumb1"
>> =C2=A0 =C2=A0 [(parallel
>> - =C2=A0 =C2=A0 [(set (match_operand:SI 0 "s_register_operand" "")
>> -
>> -=3D=3D=3D modified file 'gcc/config/arm/constraints.md'
>> ---- old/gcc/config/arm/constraints.md =C2=A0 =C2=A0 =C2=A0 =C2=A02009-1=
2-07 20:34:53 +0000
>> -+++ new/gcc/config/arm/constraints.md =C2=A0 =C2=A0 =C2=A0 =C2=A02010-0=
7-29 16:58:56 +0000
>> +Index: gcc-4.5.3/gcc/config/arm/constraints.md
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/arm/constraints.md
>> ++++ gcc-4.5.3/gcc/config/arm/constraints.md
>> =C2=A0@@ -29,7 +29,7 @@
>> =C2=A0 ;; in Thumb-1 state: I, J, K, L, M, N, O
>>
>> @@ -586,11 +586,11 @@
>> =C2=A0 (define_constraint "Dn"
>> =C2=A0 =C2=A0"@internal
>> =C2=A0 =C2=A0 In ARM/Thumb-2 state a const_vector which can be loaded wi=
th a Neon vmov
>> -
>> -=3D=3D=3D modified file 'gcc/config/arm/predicates.md'
>> ---- old/gcc/config/arm/predicates.md 2010-07-29 15:59:12 +0000
>> -+++ new/gcc/config/arm/predicates.md 2010-07-29 16:58:56 +0000
>> -@@ -86,6 +86,12 @@
>> +Index: gcc-4.5.3/gcc/config/arm/predicates.md
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/arm/predicates.md
>> ++++ gcc-4.5.3/gcc/config/arm/predicates.md
>> +@@ -101,6 +101,12 @@
>> =C2=A0 =C2=A0 (and (match_code "const_int")
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_test "const_ok_for_arm (INTVAL =
(op))")))
>>
>> @@ -603,7 +603,7 @@
>> =C2=A0 (define_predicate "arm_neg_immediate_operand"
>> =C2=A0 =C2=A0 (and (match_code "const_int")
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_test "const_ok_for_arm (-INTVAL=
 (op))")))
>> -@@ -115,6 +121,10 @@
>> +@@ -130,6 +136,10 @@
>> =C2=A0 =C2=A0 (ior (match_operand 0 "arm_rhs_operand")
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_operand 0 "arm_not_immediate_op=
erand")))
>>
>> @@ -614,23 +614,23 @@
>> =C2=A0 ;; True if the operand is a memory reference which contains an
>> =C2=A0 ;; offsettable address.
>> =C2=A0 (define_predicate "offsettable_memory_operand"
>> -@@ -522,4 +532,12 @@
>> - (define_predicate "neon_lane_number"
>> +@@ -538,3 +548,12 @@
>> =C2=A0 =C2=A0 (and (match_code "const_int")
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_test "INTVAL (op) >=3D 0 && INTVAL (=
op) <=3D 7")))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_test "INTVAL (op) >=3D 0 && INTVAL (=
op) <=3D 15")))
>> +
>> =C2=A0+;; Predicates for named expanders that overlap multiple ISAs.
>> =C2=A0+
>> =C2=A0+(define_predicate "cmpdi_operand"
>> =C2=A0+ =C2=A0(if_then_else (match_test "TARGET_HARD_FLOAT && TARGET_MAV=
ERICK")
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(and (match_test "TARGET_ARM=
")
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operan=
d 0 "cirrus_fp_register"))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(and (match_test "TARGET_32B=
IT")
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_operan=
d 0 "arm_di_operand"))))
>> -
>> -
>> -=3D=3D=3D added file 'gcc/testsuite/gcc.c-torture/execute/20100416-1.c'
>> ---- old/gcc/testsuite/gcc.c-torture/execute/20100416-1.c =C2=A0 =C2=A0 =
1970-01-01 00:00:00 +0000
>> -+++ new/gcc/testsuite/gcc.c-torture/execute/20100416-1.c =C2=A0 =C2=A0 =
2010-07-29 16:58:56 +0000
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (and (match_test "TA=
RGET_ARM")
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(match_operand 0 "cirrus_fp_register"))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (and (match_test "TA=
RGET_32BIT")
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(match_operand 0 "arm_di_operand"))))
>> ++
>> +Index: gcc-4.5.3/gcc/testsuite/gcc.c-torture/execute/20100416-1.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- /dev/null
>> ++++ gcc-4.5.3/gcc/testsuite/gcc.c-torture/execute/20100416-1.c
>> =C2=A0@@ -0,0 +1,40 @@
>> =C2=A0+void abort(void);
>> =C2=A0+
>> @@ -672,4 +672,3 @@
>> =C2=A0+ =C2=A0 =C2=A0}
>> =C2=A0+ =C2=A0return 0;
>> =C2=A0+}
>> -
>> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-=
r99481.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99481.patch
>> deleted file mode 100644
>> index db53255..0000000
>> --- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.=
patch
>> +++ /dev/null
>> @@ -1,40 +0,0 @@
>> - 2011-02-02 =C2=A0Richard Sandiford =C2=A0<richard.sandiford@linaro.org=
>
>> -
>> - =C2=A0 =C2=A0 gcc/testsuite/
>> - =C2=A0 =C2=A0 PR target/47553
>> - =C2=A0 =C2=A0 * gcc.target/arm/neon-vld-1.c: New test.
>> - =C2=A0 =C2=A0 gcc/
>> - =C2=A0 =C2=A0 PR target/47553
>> - =C2=A0 =C2=A0 * config/arm/predicates.md (neon_lane_number): Accept 0.=
.15.
>> -
>> -=3D=3D=3D modified file 'gcc/config/arm/predicates.md'
>> ---- old/gcc/config/arm/predicates.md 2011-02-08 12:07:29 +0000
>> -+++ new/gcc/config/arm/predicates.md 2011-03-02 12:28:41 +0000
>> -@@ -607,7 +607,7 @@
>> - ;; TODO: We could check lane numbers more precisely based on the mode.
>> - (define_predicate "neon_lane_number"
>> - =C2=A0 (and (match_code "const_int")
>> -- =C2=A0 =C2=A0 =C2=A0 (match_test "INTVAL (op) >=3D 0 && INTVAL (op) <=
=3D 7")))
>> -+ =C2=A0 =C2=A0 =C2=A0 (match_test "INTVAL (op) >=3D 0 && INTVAL (op) <=
=3D 15")))
>> - ;; Predicates for named expanders that overlap multiple ISAs.
>> -
>> - (define_predicate "cmpdi_operand"
>> -
>> -=3D=3D=3D added file 'gcc/testsuite/gcc.target/arm/neon-vld-1.c'
>> ---- old/gcc/testsuite/gcc.target/arm/neon-vld-1.c =C2=A0 =C2=A01970-01-=
01 00:00:00 +0000
>> -+++ new/gcc/testsuite/gcc.target/arm/neon-vld-1.c =C2=A0 =C2=A02011-02-=
02 13:57:54 +0000
>> -@@ -0,0 +1,13 @@
>> -+/* { dg-do compile } */
>> -+/* { dg-require-effective-target arm_neon_ok } */
>> -+/* { dg-options "-O1" } */
>> -+/* { dg-add-options arm_neon } */
>> -+
>> -+#include <arm_neon.h>
>> -+
>> -+uint8x16_t
>> -+foo (uint8_t *a, uint8x16_t b)
>> -+{
>> -+ =C2=A0vst1q_lane_u8 (a, b, 14);
>> -+ =C2=A0return vld1q_lane_u8 (a + 0x100, b, 15);
>> -+}
>> -
>> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-=
r99482.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99482.patch
>> deleted file mode 100644
>> index 334ac4e..0000000
>> --- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.=
patch
>> +++ /dev/null
>> @@ -1,84 +0,0 @@
>> - 2011-02-02 =C2=A0Richard Sandiford =C2=A0<richard.sandiford@linaro.org=
>
>> -
>> - =C2=A0 =C2=A0 gcc/
>> - =C2=A0 =C2=A0 Backport from mainline:
>> -
>> - =C2=A0 =C2=A0 2011-01-23 =C2=A0Bernd Schmidt =C2=A0<bernds@codesourcer=
y.com>
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Richard Sandif=
ord =C2=A0<rdsandiford@googlemail.com>
>> -
>> - =C2=A0 =C2=A0 PR rtl-optimization/47166
>> - =C2=A0 =C2=A0 * reload1.c (emit_reload_insns): Disable the spill_reg_s=
tore
>> - =C2=A0 =C2=A0 mechanism for PRE_MODIFY and POST_MODIFY.
>> - =C2=A0 =C2=A0 (inc_for_reload): For PRE_MODIFY, return the insn that s=
ets the
>> - =C2=A0 =C2=A0 reloadreg.
>> -
>> - =C2=A0 =C2=A0 gcc/testsuite/
>> - =C2=A0 =C2=A0 * gcc.c-torture/execute/postmod-1.c: New test.
>> -
>> -=3D=3D=3D added file 'gcc/testsuite/gcc.c-torture/execute/postmod-1.c'
>> ---- old/gcc/testsuite/gcc.c-torture/execute/postmod-1.c =C2=A0 =C2=A0 =
=C2=A01970-01-01 00:00:00 +0000
>> -+++ new/gcc/testsuite/gcc.c-torture/execute/postmod-1.c =C2=A0 =C2=A0 =
=C2=A02011-02-02 14:23:10 +0000
>> -@@ -0,0 +1,62 @@
>> -+#define DECLARE_ARRAY(A) array##A[0x10]
>> -+#define DECLARE_COUNTER(A) counter##A =3D 0
>> -+#define DECLARE_POINTER(A) *pointer##A =3D array##A + x
>> -+/* Create a loop that allows post-modification of pointerA, followed b=
y
>> -+ =C2=A0 a use of the post-modified address. =C2=A0*/
>> -+#define BEFORE(A) counter##A +=3D *pointer##A, pointer##A +=3D 3
>> -+#define AFTER(A) counter##A +=3D pointer##A[x]
>> -+
>> -+/* Set up the arrays so that one iteration of the loop sets the counte=
r
>> -+ =C2=A0 to 3.0f. =C2=A0*/
>> -+#define INIT_ARRAY(A) array##A[1] =3D 1.0f, array##A[5] =3D 2.0f
>> -+
>> -+/* Check that the loop worked correctly for all values. =C2=A0*/
>> -+#define CHECK_ARRAY(A) exit_code |=3D (counter##A !=3D 3.0f)
>> -+
>> -+/* Having 6 copies triggered the bug for ARM and Thumb. =C2=A0*/
>> -+#define MANY(A) A (0), A (1), A (2), A (3), A (4), A (5)
>> -+
>> -+/* Each addendA should be allocated a register. =C2=A0*/
>> -+#define INIT_VOLATILE(A) addend##A =3D vol
>> -+#define ADD_VOLATILE(A) vol +=3D addend##A
>> -+
>> -+/* Having 5 copies triggered the bug for ARM and Thumb. =C2=A0*/
>> -+#define MANY2(A) A (0), A (1), A (2), A (3), A (4)
>> -+
>> -+float MANY (DECLARE_ARRAY);
>> -+float MANY (DECLARE_COUNTER);
>> -+
>> -+volatile int stop =3D 1;
>> -+volatile int vol;
>> -+
>> -+void __attribute__((noinline))
>> -+foo (int x)
>> -+{
>> -+ =C2=A0float MANY (DECLARE_POINTER);
>> -+ =C2=A0int i;
>> -+
>> -+ =C2=A0do
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0MANY (BEFORE);
>> -+ =C2=A0 =C2=A0 =C2=A0MANY (AFTER);
>> -+ =C2=A0 =C2=A0 =C2=A0/* Create an inner loop that should ensure the co=
de above
>> -+ =C2=A0 =C2=A0 has registers free for reload inheritance. =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0int MANY2 (INIT_VOLATILE);
>> -+ =C2=A0 =C2=A0for (i =3D 0; i < 10; i++)
>> -+ =C2=A0 =C2=A0 =C2=A0MANY2 (ADD_VOLATILE);
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0}
>> -+ =C2=A0while (!stop);
>> -+}
>> -+
>> -+int
>> -+main (void)
>> -+{
>> -+ =C2=A0int exit_code =3D 0;
>> -+
>> -+ =C2=A0MANY (INIT_ARRAY);
>> -+ =C2=A0foo (1);
>> -+ =C2=A0MANY (CHECK_ARRAY);
>> -+ =C2=A0return exit_code;
>> -+}
>> -
>> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-=
r99491.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99491.patch
>> new file mode 100644
>> index 0000000..a2d6c6a
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99491.=
patch
>> @@ -0,0 +1,309 @@
>> +2011-04-08 =C2=A0Richard Sandiford =C2=A0<richard.sandiford@linaro.org>
>> +
>> + =C2=A0 =C2=A0 Backport from mainline:
>> + =C2=A0 =C2=A0 gcc/
>> + =C2=A0 =C2=A0 * dwarf2out.c (dw_loc_list_node): Add resolved_addr and =
replaced.
>> + =C2=A0 =C2=A0 (cached_dw_loc_list_def): New structure.
>> + =C2=A0 =C2=A0 (cached_dw_loc_list): New typedef.
>> + =C2=A0 =C2=A0 (cached_dw_loc_list_table): New variable.
>> + =C2=A0 =C2=A0 (cached_dw_loc_list_table_hash): New function.
>> + =C2=A0 =C2=A0 (cached_dw_loc_list_table_eq): Likewise.
>> + =C2=A0 =C2=A0 (add_location_or_const_value_attribute): Take a bool cac=
he_p.
>> + =C2=A0 =C2=A0 Cache the list when the parameter is true.
>> + =C2=A0 =C2=A0 (gen_formal_parameter_die): Update caller.
>> + =C2=A0 =C2=A0 (gen_variable_die): Likewise.
>> + =C2=A0 =C2=A0 (dwarf2out_finish): Likewise.
>> + =C2=A0 =C2=A0 (dwarf2out_abstract_function): Nullify cached_dw_loc_lis=
t_table
>> + =C2=A0 =C2=A0 while generating debug info for the decl.
>> + =C2=A0 =C2=A0 (dwarf2out_function_decl): Clear cached_dw_loc_list_tabl=
e.
>> + =C2=A0 =C2=A0 (dwarf2out_init): Initialize cached_dw_loc_list_table.
>> + =C2=A0 =C2=A0 (resolve_addr): Cache the result of resolving a chain of
>> + =C2=A0 =C2=A0 location lists.
>> +
>> + =C2=A0 =C2=A0 From: 2010-10-12 =C2=A0Jakub Jelinek =C2=A0<jakub@redhat=
.com>
>> + =C2=A0 =C2=A0 * dwarf2out.c (dw_loc_list_node): Add emitted field.
>> + =C2=A0 =C2=A0 (output_loc_list): Return immediately if emitted is set,=
 set it.
>> +
>> +=3D=3D=3D modified file 'gcc/dwarf2out.c'
>> +--- old/gcc/dwarf2out.c =C2=A0 =C2=A0 =C2=A02011-03-10 14:55:10 +0000
>> ++++ new/gcc/dwarf2out.c =C2=A0 =C2=A0 =C2=A02011-03-28 09:43:50 +0000
>> +@@ -4256,6 +4256,12 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Only on=
 head of list */
>> + =C2=A0 const char *section; /* Section this loclist is relative to */
>> + =C2=A0 dw_loc_descr_ref expr;
>> ++ =C2=A0/* True if all addresses in this and subsequent lists are known=
 to be
>> ++ =C2=A0 =C2=A0 resolved. =C2=A0*/
>> ++ =C2=A0bool resolved_addr;
>> ++ =C2=A0/* True if this list has been replaced by dw_loc_next. =C2=A0*/
>> ++ =C2=A0bool replaced;
>> ++ =C2=A0bool emitted;
>> + } dw_loc_list_node;
>> +
>> + #if defined (DWARF2_DEBUGGING_INFO) || defined (DWARF2_UNWIND_INFO)
>> +@@ -5759,6 +5765,19 @@
>> + /* Table of decl location linked lists. =C2=A0*/
>> + static GTY ((param_is (var_loc_list))) htab_t decl_loc_table;
>> +
>> ++/* A cached location list. =C2=A0*/
>> ++struct GTY (()) cached_dw_loc_list_def {
>> ++ =C2=A0/* The DECL_UID of the decl that this entry describes. =C2=A0*/
>> ++ =C2=A0unsigned int decl_id;
>> ++
>> ++ =C2=A0/* The cached location list. =C2=A0*/
>> ++ =C2=A0dw_loc_list_ref loc_list;
>> ++};
>> ++typedef struct cached_dw_loc_list_def cached_dw_loc_list;
>> ++
>> ++/* Table of cached location lists. =C2=A0*/
>> ++static GTY ((param_is (cached_dw_loc_list))) htab_t cached_dw_loc_list=
_table;
>> ++
>> + /* A pointer to the base of a list of references to DIE's that
>> + =C2=A0 =C2=A0are uniquely identified by their tag, presence/absence of
>> + =C2=A0 =C2=A0children DIE's, and list of attribute/value pairs. =C2=A0=
*/
>> +@@ -6112,7 +6131,7 @@
>> + static void insert_int (HOST_WIDE_INT, unsigned, unsigned char *);
>> + static void insert_float (const_rtx, unsigned char *);
>> + static rtx rtl_for_decl_location (tree);
>> +-static bool add_location_or_const_value_attribute (dw_die_ref, tree,
>> ++static bool add_location_or_const_value_attribute (dw_die_ref, tree, b=
ool,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0enum dwarf_attribute);
>> + static bool tree_add_const_value_attribute (dw_die_ref, tree);
>> + static bool tree_add_const_value_attribute_for_decl (dw_die_ref, tree)=
;
>> +@@ -7731,6 +7750,24 @@
>> + =C2=A0 =C2=A0 htab_find_with_hash (decl_loc_table, decl, DECL_UID (dec=
l));
>> + }
>> +
>> ++/* Returns a hash value for X (which really is a cached_dw_loc_list_li=
st). =C2=A0*/
>> ++
>> ++static hashval_t
>> ++cached_dw_loc_list_table_hash (const void *x)
>> ++{
>> ++ =C2=A0return (hashval_t) ((const cached_dw_loc_list *) x)->decl_id;
>> ++}
>> ++
>> ++/* Return nonzero if decl_id of cached_dw_loc_list X is the same as
>> ++ =C2=A0 UID of decl *Y. =C2=A0*/
>> ++
>> ++static int
>> ++cached_dw_loc_list_table_eq (const void *x, const void *y)
>> ++{
>> ++ =C2=A0return (((const cached_dw_loc_list *) x)->decl_id
>> ++ =C2=A0 =C2=A0 =C2=A0=3D=3D DECL_UID ((const_tree) y));
>> ++}
>> ++
>> + /* Equate a DIE to a particular declaration. =C2=A0*/
>> +
>> + static void
>> +@@ -10355,6 +10392,10 @@
>> + {
>> + =C2=A0 dw_loc_list_ref curr =3D list_head;
>> +
>> ++ =C2=A0if (list_head->emitted)
>> ++ =C2=A0 =C2=A0return;
>> ++ =C2=A0list_head->emitted =3D true;
>> ++
>> + =C2=A0 ASM_OUTPUT_LABEL (asm_out_file, list_head->ll_symbol);
>> +
>> + =C2=A0 /* Walk the location list, and output each range + expression. =
=C2=A0*/
>> +@@ -15920,15 +15961,22 @@
>> + =C2=A0 =C2=A0these things can crop up in other ways also.) =C2=A0Note =
that one type of
>> + =C2=A0 =C2=A0constant value which can be passed into an inlined functi=
on is a constant
>> + =C2=A0 =C2=A0pointer. =C2=A0This can happen for example if an actual a=
rgument in an inlined
>> +- =C2=A0 function call evaluates to a compile-time constant address. =
=C2=A0*/
>> ++ =C2=A0 function call evaluates to a compile-time constant address.
>> ++
>> ++ =C2=A0 CACHE_P is true if it is worth caching the location list for D=
ECL,
>> ++ =C2=A0 so that future calls can reuse it rather than regenerate it fr=
om scratch.
>> ++ =C2=A0 This is true for BLOCK_NONLOCALIZED_VARS in inlined subroutine=
s,
>> ++ =C2=A0 since we will need to refer to them each time the function is =
inlined. =C2=A0*/
>> +
>> + static bool
>> +-add_location_or_const_value_attribute (dw_die_ref die, tree decl,
>> ++add_location_or_const_value_attribute (dw_die_ref die, tree decl, bool=
 cache_p,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum dwarf_attribute=
 attr)
>> + {
>> + =C2=A0 rtx rtl;
>> + =C2=A0 dw_loc_list_ref list;
>> + =C2=A0 var_loc_list *loc_list;
>> ++ =C2=A0cached_dw_loc_list *cache;
>> ++ =C2=A0void **slot;
>> +
>> + =C2=A0 if (TREE_CODE (decl) =3D=3D ERROR_MARK)
>> + =C2=A0 =C2=A0 return false;
>> +@@ -15964,7 +16012,34 @@
>> + =C2=A0 =C2=A0 =C2=A0 && add_const_value_attribute (die, rtl))
>> + =C2=A0 =C2=A0 =C2=A0return true;
>> + =C2=A0 =C2=A0 }
>> +- =C2=A0list =3D loc_list_from_tree (decl, decl_by_reference_p (decl) ?=
 0 : 2);
>> ++ =C2=A0/* If this decl is from BLOCK_NONLOCALIZED_VARS, we might need =
its
>> ++ =C2=A0 =C2=A0 list several times. =C2=A0See if we've already cached t=
he contents. =C2=A0*/
>> ++ =C2=A0list =3D NULL;
>> ++ =C2=A0if (loc_list =3D=3D NULL || cached_dw_loc_list_table =3D=3D NUL=
L)
>> ++ =C2=A0 =C2=A0cache_p =3D false;
>> ++ =C2=A0if (cache_p)
>> ++ =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0cache =3D (cached_dw_loc_list *)
>> ++ =C2=A0 =C2=A0htab_find_with_hash (cached_dw_loc_list_table, decl, DEC=
L_UID (decl));
>> ++ =C2=A0 =C2=A0 =C2=A0if (cache)
>> ++ =C2=A0 =C2=A0list =3D cache->loc_list;
>> ++ =C2=A0 =C2=A0}
>> ++ =C2=A0if (list =3D=3D NULL)
>> ++ =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0list =3D loc_list_from_tree (decl, decl_by_refere=
nce_p (decl) ? 0 : 2);
>> ++ =C2=A0 =C2=A0 =C2=A0/* It is usually worth caching this result if the=
 decl is from
>> ++ =C2=A0 =C2=A0 BLOCK_NONLOCALIZED_VARS and if the list has at least tw=
o elements. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0if (cache_p && list && list->dw_loc_next)
>> ++ =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0slot =3D htab_find_slot_with_hash (cached_dw_loc_=
list_table, decl,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DECL_UID (d=
ecl), INSERT);
>> ++ =C2=A0 =C2=A0 =C2=A0cache =3D (cached_dw_loc_list *)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0ggc_alloc_cleared (sizeof (cached_dw_loc_l=
ist));
>> ++ =C2=A0 =C2=A0 =C2=A0cache->decl_id =3D DECL_UID (decl);
>> ++ =C2=A0 =C2=A0 =C2=A0cache->loc_list =3D list;
>> ++ =C2=A0 =C2=A0 =C2=A0*slot =3D cache;
>> ++ =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0}
>> + =C2=A0 if (list)
>> + =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 add_AT_location_description (die, attr, list);
>> +@@ -17532,7 +17607,7 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 equate_decl_number_to_die (node, parm_die)=
;
>> + =C2=A0 =C2=A0 =C2=A0 if (! DECL_ABSTRACT (node_or_origin))
>> + =C2=A0 =C2=A0 add_location_or_const_value_attribute (parm_die, node_or=
_origin,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DW_AT_location);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 node =3D=3D NULL, DW_AT_location);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 break;
>> +
>> +@@ -17712,6 +17787,7 @@
>> + =C2=A0 tree context;
>> + =C2=A0 int was_abstract;
>> + =C2=A0 htab_t old_decl_loc_table;
>> ++ =C2=A0htab_t old_cached_dw_loc_list_table;
>> +
>> + =C2=A0 /* Make sure we have the actual abstract inline, not a clone. =
=C2=A0*/
>> + =C2=A0 decl =3D DECL_ORIGIN (decl);
>> +@@ -17725,7 +17801,9 @@
>> + =C2=A0 =C2=A0 =C2=A0DIE. =C2=A0Be sure to not clobber the outer locati=
on table nor use it or we would
>> + =C2=A0 =C2=A0 =C2=A0get locations in abstract instantces. =C2=A0*/
>> + =C2=A0 old_decl_loc_table =3D decl_loc_table;
>> ++ =C2=A0old_cached_dw_loc_list_table =3D cached_dw_loc_list_table;
>> + =C2=A0 decl_loc_table =3D NULL;
>> ++ =C2=A0cached_dw_loc_list_table =3D NULL;
>> +
>> + =C2=A0 /* Be sure we've emitted the in-class declaration DIE (if any) =
first, so
>> + =C2=A0 =C2=A0 =C2=A0we don't get confused by DECL_ABSTRACT. =C2=A0*/
>> +@@ -17750,6 +17828,7 @@
>> +
>> + =C2=A0 current_function_decl =3D save_fn;
>> + =C2=A0 decl_loc_table =3D old_decl_loc_table;
>> ++ =C2=A0cached_dw_loc_list_table =3D old_cached_dw_loc_list_table;
>> + =C2=A0 pop_cfun ();
>> + }
>> +
>> +@@ -18431,9 +18510,8 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 && !TREE_SYMBOL_REFERENCED (DECL_AS=
SEMBLER_NAME (decl_or_origin)))
>> + =C2=A0 =C2=A0 defer_location (decl_or_origin, var_die);
>> + =C2=A0 =C2=A0 =C2=A0 else
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0add_location_or_const_value_attribute (var=
_die,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 decl_or_origin,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DW_AT_location);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0add_location_or_const_value_attribute (var=
_die, decl_or_origin,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 decl =3D=3D NULL, DW_AT_location);
>> + =C2=A0 =C2=A0 =C2=A0 add_pubname (decl_or_origin, var_die);
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 else
>> +@@ -20049,6 +20127,7 @@
>> + =C2=A0 dwarf2out_decl (decl);
>> +
>> + =C2=A0 htab_empty (decl_loc_table);
>> ++ =C2=A0htab_empty (cached_dw_loc_list_table);
>> + }
>> +
>> + /* Output a marker (i.e. a label) for the beginning of the generated c=
ode for
>> +@@ -20649,6 +20728,11 @@
>> + =C2=A0 decl_loc_table =3D htab_create_ggc (10, decl_loc_table_hash,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decl_loc_table_eq, NULL);
>> +
>> ++ =C2=A0/* Allocate the cached_dw_loc_list_table. =C2=A0*/
>> ++ =C2=A0cached_dw_loc_list_table
>> ++ =C2=A0 =C2=A0=3D htab_create_ggc (10, cached_dw_loc_list_table_hash,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cached=
_dw_loc_list_table_eq, NULL);
>> ++
>> + =C2=A0 /* Allocate the initial hunk of the decl_scope_table. =C2=A0*/
>> + =C2=A0 decl_scope_table =3D VEC_alloc (tree, gc, 256);
>> +
>> +@@ -21278,30 +21362,53 @@
>> + {
>> + =C2=A0 dw_die_ref c;
>> + =C2=A0 dw_attr_ref a;
>> +- =C2=A0dw_loc_list_ref *curr;
>> ++ =C2=A0dw_loc_list_ref *curr, *start, loc;
>> + =C2=A0 unsigned ix;
>> +
>> + =C2=A0 for (ix =3D 0; VEC_iterate (dw_attr_node, die->die_attr, ix, a)=
; ix++)
>> + =C2=A0 =C2=A0 switch (AT_class (a))
>> + =C2=A0 =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 case dw_val_class_loc_list:
>> +- =C2=A0 =C2=A0curr =3D AT_loc_list_ptr (a);
>> +- =C2=A0 =C2=A0while (*curr)
>> ++ =C2=A0 =C2=A0start =3D curr =3D AT_loc_list_ptr (a);
>> ++ =C2=A0 =C2=A0loc =3D *curr;
>> ++ =C2=A0 =C2=A0gcc_assert (loc);
>> ++ =C2=A0 =C2=A0/* The same list can be referenced more than once. =C2=
=A0See if we have
>> ++ =C2=A0 =C2=A0 =C2=A0 already recorded the result from a previous pass=
. =C2=A0*/
>> ++ =C2=A0 =C2=A0if (loc->replaced)
>> ++ =C2=A0 =C2=A0 =C2=A0*curr =3D loc->dw_loc_next;
>> ++ =C2=A0 =C2=A0else if (!loc->resolved_addr)
>> + =C2=A0 =C2=A0 =C2=A0 {
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!resolve_addr_in_expr ((*curr)->expr))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* As things stand, we do not expect or al=
low one die to
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reference a suffix of another die'=
s location list chain.
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 References must be identical or co=
mpletely separate.
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 There is therefore no need to cach=
e the result of this
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass on any list other than the fi=
rst; doing so
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 would lead to unnecessary writes. =
=C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0while (*curr)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dw_loc_list_ref next =3D (*c=
urr)->dw_loc_next;
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (next && (*curr)->ll_symb=
ol)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_assert (!(*curr)->replac=
ed && !(*curr)->resolved_addr);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!resolve_addr_in_expr ((=
*curr)->expr))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_assert (!n=
ext->ll_symbol);
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next->ll_symbo=
l =3D (*curr)->ll_symbol;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dw_loc_list_re=
f next =3D (*curr)->dw_loc_next;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (next && (*=
curr)->ll_symbol)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gcc_assert (!next->ll_symbol);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
next->ll_symbol =3D (*curr)->ll_symbol;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*curr =3D next=
;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*curr =3D next;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curr =3D &(*curr)->dw=
_loc_next;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (loc =3D=3D *start)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loc->resolved_addr =3D 1;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curr =3D &(*curr)->dw_loc_next;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loc->replaced =3D 1;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loc->dw_loc_next =3D *start;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +- =C2=A0 =C2=A0if (!AT_loc_list (a))
>> ++ =C2=A0 =C2=A0if (!*start)
>> + =C2=A0 =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 remove_AT (die, a->dw_attr);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 ix--;
>> +@@ -21361,6 +21468,7 @@
>> + =C2=A0 =C2=A0 =C2=A0 add_location_or_const_value_attribute (
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 VEC_index (deferred_locations, deferred_lo=
cations_list, i)->die,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 VEC_index (deferred_locations, deferred_lo=
cations_list, i)->variable,
>> ++ =C2=A0 =C2=A0false,
>> + =C2=A0 =C2=A0 DW_AT_location);
>> + =C2=A0 =C2=A0 }
>> +
>> +
>> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-=
r99494.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99494.patch
>> new file mode 100644
>> index 0000000..56897e9
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.=
patch
>> @@ -0,0 +1,1272 @@
>> +2011-04-09 =C2=A0Andrew Stubbs =C2=A0<ams@codesourcery.com>
>> +
>> + =C2=A0 =C2=A0 Backport from mainline:
>> +
>> + =C2=A0 =C2=A0 Maxim Kuvyrkov =C2=A0<maxim@codesourcery.com>
>> +
>> + =C2=A0 =C2=A0 * config.sub: Recognize *-linux-android*.
>> +
>> + =C2=A0 =C2=A0 2010-05-27 Maxim Kuvyrkov =C2=A0<maxim@codesourcery.com>
>> +
>> + =C2=A0 =C2=A0 Add support for Bionic C library
>> + =C2=A0 =C2=A0 gcc/
>> + =C2=A0 =C2=A0 * config.gcc (LIBC_GLIBC, LIBC_BIONIC, LIBC_UCLIBC): New=
 tm_define
>> + =C2=A0 =C2=A0 macro.
>> + =C2=A0 =C2=A0 (DEFAULT_LIBC): New tm_define macro set to one of LIBC_*=
.
>> + =C2=A0 =C2=A0 (bfin*-uclinux, moxie-*-uclinux*, m68k-*-uclinux*): Upda=
te.
>> +
>> + =C2=A0 =C2=A0 * config/linux.h (OPTION_GLIBC, OPTION_UCLIBC, OPTION_BI=
ONIC): Define.
>> + =C2=A0 =C2=A0 (LINUX_TARGET_OS_CPP_BUILTINS): Define __gnu_linux__ onl=
y for GLIBC.
>> + =C2=A0 =C2=A0 (CHOOSE_DYNAMIC_LINKER1, CHOOSE_DYNAMIC_LINKER): Make it=
 easier
>> + =C2=A0 =C2=A0 to support multiple C libraries. =C2=A0Handle Bionic.
>> + =C2=A0 =C2=A0 (BIONIC_DYNAMIC_LINKER, BIONIC_DYNAMIC_LINKER32,)
>> + =C2=A0 =C2=A0 (BIONIC_DYNAMIC_LINKER64): Define.
>> + =C2=A0 =C2=A0 (LINUX_DYNAMIC_LINKER, LINUX_DYNAMIC_LINKER32, LINUX_DYN=
AMIC_LINKER64):
>> + =C2=A0 =C2=A0 Update.
>> + =C2=A0 =C2=A0 (TARGET_HAS_SINCOS): Enable for Bionic.
>> +
>> + =C2=A0 =C2=A0 * config/linux.opt: Rewrite to handle more than 2 C libr=
aries. =C2=A0Make
>> + =C2=A0 =C2=A0 the last option specified on command line take effect.
>> + =C2=A0 =C2=A0 (linux_uclibc): Rename to linux_libc, initialize using D=
EFAULT_LIBC.
>> + =C2=A0 =C2=A0 (mbionic): New.
>> + =C2=A0 =C2=A0 (mglibc, muclibc): Update.
>> +
>> + =C2=A0 =C2=A0 * config/alpha/linux-elf.h, config/rs6000/linux64.h,
>> + =C2=A0 =C2=A0 * config/rs6000/sysv4.h (CHOOSE_DYNAMIC_LINKER): Update =
to use
>> + =C2=A0 =C2=A0 DEFAULT_LIBC.
>> +
>> + =C2=A0 =C2=A0 * doc/invoke.texi (-mglibc, -muclibc): Update.
>> + =C2=A0 =C2=A0 (-mbionic): Document.
>> +
>> + =C2=A0 =C2=A0 gcc/testsuite/
>> + =C2=A0 =C2=A0 * gcc.dg/glibc-uclibc-1.c, gcc.dg/glibc-uclibc-2.c: Remo=
ve, no longer
>> + =C2=A0 =C2=A0 necessary.
>> +
>> + =C2=A0 =C2=A0 2010-05-27 Maxim Kuvyrkov =C2=A0<maxim@codesourcery.com>
>> +
>> + =C2=A0 =C2=A0 Support compilation for Android platform. =C2=A0Reimplem=
ent -mandroid.
>> + =C2=A0 =C2=A0 gcc/
>> + =C2=A0 =C2=A0 * config.gcc (*linux*): Include linux-android.h and linu=
x-android.opt.
>> + =C2=A0 =C2=A0 (*android*): Set ANDROID_DEFAULT.
>> + =C2=A0 =C2=A0 (arm*-*-linux*): Include linux-android.h.
>> + =C2=A0 =C2=A0 (arm*-*-eabi*): Don't include previous -mandroid impleme=
ntation.
>> + =C2=A0 =C2=A0 * config/arm/eabi.h: Remove, move Android-specific parts=
 ...
>> + =C2=A0 =C2=A0 * config/linux-android.h: ... here. =C2=A0New file.
>> + =C2=A0 =C2=A0 * config/arm/eabi.opt: Rename to ...
>> + =C2=A0 =C2=A0 * config/linux-android.opt: ... this.
>> + =C2=A0 =C2=A0 (mandroid): Allow -mno-android option. =C2=A0Initialize =
based on
>> + =C2=A0 =C2=A0 ANDROID_DEFAULT.
>> + =C2=A0 =C2=A0 * config/linux.h (STARTFILE_SPEC, ENDFILE_SPEC, CC1_SPEC=
, LIB_SPEC):
>> + =C2=A0 =C2=A0 Move logic to corresponding LINUX_TARGET_* macros.
>> + =C2=A0 =C2=A0 (TARGET_OS_CPP_BUILTINS): Define __ANDROID__, when appro=
priate.
>> + =C2=A0 =C2=A0 * config/linux-eabi.h (LINK_SPEC, CC1_SPEC, CC1PLUS_SPEC=
, LIB_SPEC,)
>> + =C2=A0 =C2=A0 (STARTFILE_SPEC, ENDFILE_SPEC): Define to choose between=
 Linux and
>> + =C2=A0 =C2=A0 Android definitions.
>> + =C2=A0 =C2=A0 (LINUX_TARGET_OS_CPP_BUILTINS): Define __ANDROID__ if TA=
RGET_ANDROID.
>> + =C2=A0 =C2=A0 * doc/invoke.texi (-mandroid, -tno-android-cc, -tno-andr=
oid-ld):
>> + =C2=A0 =C2=A0 Document.
>> +
>> + =C2=A0 =C2=A0 2010-06-01 Maxim Kuvyrkov =C2=A0<maxim@codesourcery.com>
>> +
>> + =C2=A0 =C2=A0 gcc/
>> + =C2=A0 =C2=A0 * config/arm/t-linux-androideabi: New.
>> + =C2=A0 =C2=A0 * config.gcc (arm*-*-linux-androideabi): Include multili=
b configuration.
>> +
>> + =C2=A0 =C2=A0 2010-05-27 Maxim Kuvyrkov =C2=A0<maxim@codesourcery.com>
>> +
>> + =C2=A0 =C2=A0 gcc/
>> + =C2=A0 =C2=A0 * gthr-posix.h (pthread_cancel): Don't declare if compil=
ing against
>> + =C2=A0 =C2=A0 Bionic C library.
>> + =C2=A0 =C2=A0 (__gthread_active_p): Check for pthread_create if compil=
ing against
>> + =C2=A0 =C2=A0 Bionic C library.
>> +
>> + =C2=A0 =C2=A0 2010-06-01 Maxim Kuvyrkov =C2=A0<maxim@codesourcery.com>
>> +
>> + =C2=A0 =C2=A0 libstdc++-v3/
>> + =C2=A0 =C2=A0 * acinclude.m4: Support Bionic C library.
>> + =C2=A0 =C2=A0 Explicitly specify -fexceptions for exception check.
>> + =C2=A0 =C2=A0 * configure.host: Support Bionic C library.
>> + =C2=A0 =C2=A0 * configure: Regenerate.
>> + =C2=A0 =C2=A0 * config/os/bionic/ctype_base.h, config/os/bionic/ctype_=
inline.h,
>> + =C2=A0 =C2=A0 * config/os/bionic/ctype_noincline.h, config/os/bionic/o=
s_defines.h:
>> + =C2=A0 =C2=A0 New files, based on config/os/newlib/*.
>> +
>> +=3D=3D=3D modified file 'config.sub'
>> +Index: gcc-4.5.3/config.sub
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/config.sub
>> ++++ gcc-4.5.3/config.sub
>> +@@ -4,7 +4,7 @@
>> + # =C2=A0 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2=
010
>> + # =C2=A0 Free Software Foundation, Inc.
>> +
>> +-timestamp=3D'2010-03-22'
>> ++timestamp=3D'2010-04-23'
>> +
>> + # This file is (in principle) common to ALL GNU software.
>> + # The presence of a machine in this file suggests that SOME GNU softwa=
re
>> +@@ -124,8 +124,9 @@ esac
>> + # Here we must recognize all the valid KERNEL-OS combinations.
>> + maybe_os=3D`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
>> + case $maybe_os in
>> +- =C2=A0nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-=
uclibc* | \
>> +- =C2=A0uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu*=
 | netbsd*-gnu* | \
>> ++ =C2=A0nto-qnx* | linux-gnu* | linux-android* | linux-dietlibc | linux=
-newlib* | \
>> ++ =C2=A0linux-uclibc* | uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu*=
 | \
>> ++ =C2=A0knetbsd*-gnu* | netbsd*-gnu* | \
>> + =C2=A0 kopensolaris*-gnu* | \
>> + =C2=A0 storm-chaos* | os2-emx* | rtmk-nova*)
>> + =C2=A0 =C2=A0 os=3D-$maybe_os
>> +@@ -1307,7 +1308,8 @@ case $os in
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | -udi* | -eabi* | -lites* | -ieee*=
 | -go32* | -aux* \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | -chorusos* | -chorusrdb* | -cegcc=
* \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | -cygwin* | -pe* | -psos* | -moss*=
 | -proelf* | -rtems* \
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| -mingw32* | -linux-gnu* | -linux-=
newlib* | -linux-uclibc* \
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| -mingw32* | -linux-gnu* | -linux-=
android* \
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| -linux-newlib* | -linux-uclibc* \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | -uxpv* | -beos* | -mpeix* | -udk*=
 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | -interix* | -uwin* | -mks* | -rha=
psody* | -darwin* | -opened* \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | -openstep* | -oskit* | -conix* | =
-pw32* | -nonstopux* \
>> +Index: gcc-4.5.3/gcc/config.gcc
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config.gcc
>> ++++ gcc-4.5.3/gcc/config.gcc
>> +@@ -513,26 +513,48 @@ case ${target} in
>> + =C2=A0 =C2=A0 *-*-gnu*)
>> + =C2=A0 =C2=A0 =C2=A0 tmake_file=3D"$tmake_file t-gnu";;
>> + =C2=A0 esac
>> +- =C2=A0# glibc / uclibc switch. =C2=A0uclibc isn't usable for GNU/Hurd=
 and neither for
>> +- =C2=A0# GNU/k*BSD.
>> ++ =C2=A0# Common C libraries.
>> ++ =C2=A0tm_defines=3D"$tm_defines LIBC_GLIBC=3D1 LIBC_UCLIBC=3D2 LIBC_B=
IONIC=3D3"
>> ++ =C2=A0# glibc / uclibc / bionic switch.
>> ++ =C2=A0# uclibc and bionic aren't usable for GNU/Hurd and neither for =
GNU/k*BSD.
>> + =C2=A0 case $target in
>> + =C2=A0 =C2=A0 *linux*)
>> + =C2=A0 =C2=A0 =C2=A0 extra_options=3D"$extra_options linux.opt";;
>> + =C2=A0 =C2=A0 *)
>> + =C2=A0 =C2=A0 =C2=A0 tm_defines=3D"$tm_defines OPTION_GLIBC=3D1";;
>> + =C2=A0 esac
>> +- =C2=A0case ${target} in
>> ++ =C2=A0case $target in
>> ++ =C2=A0 =C2=A0*-*-*android*)
>> ++ =C2=A0 =C2=A0 =C2=A0tm_defines=3D"$tm_defines DEFAULT_LIBC=3DLIBC_BIO=
NIC"
>> ++ =C2=A0 =C2=A0 =C2=A0;;
>> + =C2=A0 =C2=A0 *-*-*uclibc*)
>> +- =C2=A0 =C2=A0 =C2=A0tm_defines=3D"${tm_defines} UCLIBC_DEFAULT=3D1"
>> ++ =C2=A0 =C2=A0 =C2=A0tm_defines=3D"$tm_defines DEFAULT_LIBC=3DLIBC_UCL=
IBC"
>> + =C2=A0 =C2=A0 =C2=A0 ;;
>> + =C2=A0 =C2=A0 *)
>> +- =C2=A0 =C2=A0 =C2=A0tm_defines=3D"${tm_defines} UCLIBC_DEFAULT=3D0"
>> ++ =C2=A0 =C2=A0 =C2=A0tm_defines=3D"$tm_defines DEFAULT_LIBC=3DLIBC_GLI=
BC"
>> + =C2=A0 =C2=A0 =C2=A0 ;;
>> + =C2=A0 esac
>> +- =C2=A0# Assume that glibc or uClibc are being used and so __cxa_atexi=
t is provided.
>> ++ =C2=A0# Assume that glibc or uClibc or Bionic are being used and so _=
_cxa_atexit
>> ++ =C2=A0# is provided.
>> + =C2=A0 default_use_cxa_atexit=3Dyes
>> + =C2=A0 use_gcc_tgmath=3Dno
>> + =C2=A0 use_gcc_stdint=3Dwrap
>> ++ =C2=A0# Add Android userspace support to Linux targets.
>> ++ =C2=A0case $target in
>> ++ =C2=A0 =C2=A0*linux*)
>> ++ =C2=A0 =C2=A0 =C2=A0tm_file=3D"$tm_file linux-android.h"
>> ++ =C2=A0 =C2=A0 =C2=A0extra_options=3D"$extra_options linux-android.opt=
"
>> ++ =C2=A0 =C2=A0 =C2=A0;;
>> ++ =C2=A0esac
>> ++ =C2=A0# Enable compilation for Android by default for *android* targe=
ts.
>> ++ =C2=A0case $target in
>> ++ =C2=A0 =C2=A0*-*-*android*)
>> ++ =C2=A0 =C2=A0 =C2=A0tm_defines=3D"$tm_defines ANDROID_DEFAULT=3D1"
>> ++ =C2=A0 =C2=A0 =C2=A0;;
>> ++ =C2=A0 =C2=A0*)
>> ++ =C2=A0 =C2=A0 =C2=A0tm_defines=3D"$tm_defines ANDROID_DEFAULT=3D0"
>> ++ =C2=A0 =C2=A0 =C2=A0;;
>> ++ =C2=A0esac
>> + =C2=A0 ;;
>> + *-*-netbsd*)
>> + =C2=A0 tmake_file=3D"t-slibgcc-elf-ver t-libc-ok t-netbsd t-libgcc-pic=
"
>> +@@ -728,7 +750,7 @@ arm*-*-netbsd*)
>> + =C2=A0 =C2=A0 use_collect2=3Dyes
>> + =C2=A0 =C2=A0 ;;
>> + arm*-*-linux*) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0# ARM GNU/Linux with ELF
>> +- =C2=A0 =C2=A0tm_file=3D"dbxelf.h elfos.h linux.h glibc-stdint.h arm/e=
lf.h arm/linux-gas.h arm/linux-elf.h"
>> ++ =C2=A0 =C2=A0tm_file=3D"dbxelf.h elfos.h linux.h linux-android.h glib=
c-stdint.h arm/elf.h arm/linux-gas.h arm/linux-elf.h"
>> + =C2=A0 =C2=A0 case $target in
>> + =C2=A0 =C2=A0 arm*b-*)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tm_defines=3D"${tm_defines} =
TARGET_BIG_ENDIAN_DEFAULT=3D1"
>> +@@ -739,6 +761,12 @@ arm*-*-linux*) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0# ARM GNU/Linux with EL
>> + =C2=A0 =C2=A0 arm*-*-linux-*eabi)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 tm_file=3D"$tm_file arm/bpabi.h arm/linux-=
eabi.h"
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmake_file=3D"$tmake_file arm/t-arm-elf ar=
m/t-bpabi arm/t-linux-eabi t-slibgcc-libgcc"
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0# Define multilib configuration for arm-li=
nux-androideabi.
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0case ${target} in
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0*-androideabi)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmake_file=3D"$tmake_file ar=
m/t-linux-androideabi"
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0esac
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 # The BPABI long long divmod functions ret=
urn a 128-bit value in
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 # registers r0-r3. =C2=A0Correctly modelin=
g that requires the use of
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 # TImode.
>> +@@ -785,9 +813,8 @@ arm*-*-eabi* | arm*-*-symbianelf* )
>> + =C2=A0 =C2=A0 tmake_file=3D"arm/t-arm arm/t-arm-elf"
>> + =C2=A0 =C2=A0 case ${target} in
>> + =C2=A0 =C2=A0 arm*-*-eabi*)
>> +- =C2=A0 =C2=A0 =C2=A0tm_file=3D"$tm_file arm/eabi.h newlib-stdint.h"
>> ++ =C2=A0 =C2=A0 =C2=A0tm_file=3D"$tm_file newlib-stdint.h"
>> + =C2=A0 =C2=A0 =C2=A0 tmake_file=3D"${tmake_file} arm/t-bpabi"
>> +- =C2=A0 =C2=A0 =C2=A0extra_options=3D"${extra_options} arm/eabi.opt"
>> + =C2=A0 =C2=A0 =C2=A0 use_gcc_stdint=3Dwrap
>> + =C2=A0 =C2=A0 =C2=A0 ;;
>> + =C2=A0 =C2=A0 arm*-*-symbianelf*)
>> +@@ -843,7 +870,7 @@ bfin*-elf*)
>> + bfin*-uclinux*)
>> + =C2=A0 =C2=A0 tm_file=3D"${tm_file} dbxelf.h elfos.h bfin/elf.h linux.=
h glibc-stdint.h bfin/uclinux.h"
>> + =C2=A0 =C2=A0 tmake_file=3Dbfin/t-bfin-uclinux
>> +- =C2=A0 =C2=A0tm_defines=3D"${tm_defines} UCLIBC_DEFAULT=3D1"
>> ++ =C2=A0 =C2=A0tm_defines=3D"${tm_defines} DEFAULT_LIBC=3DLIBC_UCLIBC"
>> + =C2=A0 =C2=A0 extra_options=3D"${extra_options} linux.opt"
>> + =C2=A0 =C2=A0 use_collect2=3Dno
>> + =C2=A0 =C2=A0 ;;
>> +@@ -924,7 +951,7 @@ moxie-*-uclinux*)
>> + =C2=A0 =C2=A0 tm_file=3D"dbxelf.h elfos.h svr4.h ${tm_file} linux.h gl=
ibc-stdint.h moxie/uclinux.h"
>> + =C2=A0 =C2=A0 extra_parts=3D"crti.o crtn.o crtbegin.o crtend.o"
>> + =C2=A0 =C2=A0 tmake_file=3D"${tmake_file} moxie/t-moxie moxie/t-moxie-=
softfp soft-fp/t-softfp"
>> +- =C2=A0 =C2=A0tm_defines=3D"${tm_defines} UCLIBC_DEFAULT=3D1"
>> ++ =C2=A0 =C2=A0tm_defines=3D"${tm_defines} DEFAULT_LIBC=3DLIBC_UCLIBC"
>> + =C2=A0 =C2=A0 extra_options=3D"${extra_options} linux.opt"
>> + =C2=A0 =C2=A0 ;;
>> + h8300-*-rtems*)
>> +@@ -1644,7 +1671,7 @@ m68k-*-uclinux*) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 # Motorola m68k/ColdFi
>> + =C2=A0 =C2=A0 default_m68k_cpu=3D68020
>> + =C2=A0 =C2=A0 default_cf_cpu=3D5206
>> + =C2=A0 =C2=A0 tm_file=3D"${tm_file} dbxelf.h elfos.h svr4.h linux.h gl=
ibc-stdint.h flat.h m68k/linux.h m68k/uclinux.h ./sysroot-suffix.h"
>> +- =C2=A0 =C2=A0tm_defines=3D"${tm_defines} MOTOROLA=3D1 UCLIBC_DEFAULT=
=3D1"
>> ++ =C2=A0 =C2=A0tm_defines=3D"${tm_defines} MOTOROLA=3D1 DEFAULT_LIBC=3D=
LIBC_UCLIBC"
>> + =C2=A0 =C2=A0 extra_options=3D"${extra_options} linux.opt"
>> + =C2=A0 =C2=A0 tmake_file=3D"m68k/t-floatlib m68k/t-uclinux m68k/t-mlib=
s"
>> + =C2=A0 =C2=A0 ;;
>> +Index: gcc-4.5.3/gcc/config/alpha/linux-elf.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/alpha/linux-elf.h
>> ++++ gcc-4.5.3/gcc/config/alpha/linux-elf.h
>> +@@ -29,10 +29,12 @@ along with GCC; see the file COPYING3.
>> +
>> + #define GLIBC_DYNAMIC_LINKER =C2=A0 =C2=A0 =C2=A0 =C2=A0"/lib/ld-linux=
.so.2"
>> + #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
>> +-#if UCLIBC_DEFAULT
>> +-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:%{muclibc:%e-mglibc and =
-muclibc used together}" G ";:" U "}"
>> ++#if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
>> ++#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
>> ++#elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
>> ++#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
>> + #else
>> +-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:%{mglibc:%e-mglibc and =
-muclibc used together}" U ";:" G "}"
>> ++#error "Unsupported DEFAULT_LIBC"
>> + #endif
>> + #define LINUX_DYNAMIC_LINKER \
>> + =C2=A0 CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LIN=
KER)
>> +Index: gcc-4.5.3/gcc/config/arm/eabi.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/arm/eabi.h
>> ++++ /dev/null
>> +@@ -1,125 +0,0 @@
>> +-/* Configuration file for ARM EABI targets.
>> +- =C2=A0 Copyright (C) 2008
>> +- =C2=A0 Free Software Foundation, Inc.
>> +- =C2=A0 Contributed by Doug Kwan (dougkwan@google.com)
>> +-
>> +- =C2=A0 This file is part of GCC.
>> +-
>> +- =C2=A0 GCC is free software; you can redistribute it and/or modify it
>> +- =C2=A0 under the terms of the GNU General Public License as published
>> +- =C2=A0 by the Free Software Foundation; either version 3, or (at your
>> +- =C2=A0 option) any later version.
>> +-
>> +- =C2=A0 GCC is distributed in the hope that it will be useful, but WIT=
HOUT
>> +- =C2=A0 ANY WARRANTY; without even the implied warranty of MERCHANTABI=
LITY
>> +- =C2=A0 or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the GNU General=
 Public
>> +- =C2=A0 License for more details.
>> +-
>> +- =C2=A0 You should have received a copy of the GNU General Public Lice=
nse
>> +- =C2=A0 along with GCC; see the file COPYING3. =C2=A0If not see
>> +- =C2=A0 <http://www.gnu.org/licenses/>. =C2=A0*/
>> +-
>> +-/* This file contains macro overrides for EABI targets. =C2=A0*/
>> +-
>> +-#undef TARGET_OS_CPP_BUILTINS
>> +-#define TARGET_OS_CPP_BUILTINS() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> +- =C2=A0do =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> +- =C2=A0 =C2=A0{ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0 =C2=A0 =C2=A0TARGET_BPABI_CPP_BUILTINS (); =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0 =C2=A0 =C2=A0if (TARGET_ANDROID) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0 =C2=A0builtin_define ("__ANDROID__"); =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0 =C2=A0} =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0while (false)
>> +-
>> +-#undef SUBSUBTARGET_EXTRA_SPECS
>> +-#define SUBSUBTARGET_EXTRA_SPECS \
>> +- =C2=A0{ "link_android", =C2=A0 =C2=A0 =C2=A0 =C2=A0 ANDROID_LINK_SPEC=
 }, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> +- =C2=A0{ "link_default", =C2=A0 =C2=A0 =C2=A0 =C2=A0 BPABI_LINK_SPEC }=
, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> +- =C2=A0{ "cc1_android", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ANDROID_CC1_=
SPEC }, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0{ "cc1_default", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CC1_DEFAULT_=
SPEC }, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0{ "cc1plus_android", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ANDROID_CC1PLUS_SPEC }, =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0{ "cc1plus_default", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0CC1PLUS_DEFAULT_SPEC }, =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0{ "lib_android", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ANDROID_LIB_=
SPEC }, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0{ "lib_default", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIB_DEFAULT_=
SPEC }, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0{ "startfile_android", =C2=A0 =C2=A0ANDROID_STARTFILE_SPEC }, =
=C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0{ "startfile_default", =C2=A0 =C2=A0UNKNOWN_ELF_STARTFILE_SPEC =
}, =C2=A0 \
>> +- =C2=A0{ "endfile_android", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ANDROID_ENDFILE_SPEC }, =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +- =C2=A0{ "endfile_default", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0UNKNOWN_ELF_ENDFILE_SPEC }, =C2=A0 =C2=A0 \
>> +-
>> +-#undef ANDROID_LINK_SPEC
>> +-#define ANDROID_LINK_SPEC \
>> +-"%{mbig-endian:-EB} %{mlittle-endian:-EL} " =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \
>> +-"%{static:-Bstatic} %{shared:-shared} %{symbolic:-Bsymbolic} " =C2=A0 =
=C2=A0 =C2=A0\
>> +-"%{!static:" \
>> +- =C2=A0 "%{shared: -Bsymbolic} " \
>> +- =C2=A0 "%{!shared:" \
>> +- =C2=A0 =C2=A0 =C2=A0"%{rdynamic:-export-dynamic} " \
>> +- =C2=A0 =C2=A0 =C2=A0"%{!dynamic-linker:-dynamic-linker /system/bin/li=
nker}}} " \
>> +-"-X" SUBTARGET_EXTRA_LINK_SPEC
>> +-
>> +-/* Override LINK_SPEC in bpabi.h. */
>> +-#undef LINK_SPEC
>> +-#define LINK_SPEC \
>> +-"%{mandroid: %(link_android) ;" \
>> +-" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: %(link_default)}"
>> +-
>> +-/* Android uses -fno-exceptions by default. */
>> +-#undef ANDROID_CC1_SPEC
>> +-#define ANDROID_CC1_SPEC "%{!fexceptions:-fno-exceptions}"
>> +-
>> +-/* Default CC1_SPEC as in arm.h. */
>> +-#undef CC1_DEFAULT_SPEC
>> +-#define CC1_DEFAULT_SPEC ""
>> +-
>> +-#undef CC1_SPEC
>> +-#define CC1_SPEC \
>> +-"%{mandroid: %(cc1_android) ;" \
>> +-" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: %(cc1_default)}"
>> +-
>> +-/* Android uses -fno-rtti by default. */
>> +-#undef ANDROID_CC1PLUS_SPEC
>> +-#define ANDROID_CC1PLUS_SPEC "%{!frtti:-fno-rtti}"
>> +-
>> +-/* Default CC1PLUS_SPEC as in gcc.c. */
>> +-#undef CC1PLUS_DEFAULT_SPEC
>> +-#define CC1PLUS_DEFAULT_SPEC ""
>> +-
>> +-#undef CC1PLUS_SPEC
>> +-#define CC1PLUS_SPEC \
>> +-"%{mandroid: %(cc1plus_android) ;" \
>> +-" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: %(cc1plus_default)}"
>> +-
>> +-#undef ANDROID_LIB_SPEC
>> +-#define ANDROID_LIB_SPEC =C2=A0 =C2=A0"-lc %{!static:-ldl}"
>> +-
>> +-/* Default LIB_SPEC as in gcc.c. */
>> +-#undef LIB_DEFAULT_SPEC
>> +-#define LIB_DEFAULT_SPEC \
>> +-"%{!shared:%{g*:-lg} %{!p:%{!pg:-lc}}%{p:-lc_p}%{pg:-lc_p}}"
>> +-
>> +-#undef LIB_SPEC
>> +-#define LIB_SPEC \
>> +-"%{mandroid: %(lib_android) ;" \
>> +-" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: %(lib_default)}"
>> +-
>> +-#undef ANDROID_STARTFILE_SPEC
>> +-#define ANDROID_STARTFILE_SPEC \
>> +-"%{!shared:" \
>> +- =C2=A0 "%{static: crtbegin_static%O%s ;" \
>> +- =C2=A0 " =C2=A0 =C2=A0 =C2=A0 =C2=A0: crtbegin_dynamic%O%s}}"
>> +-
>> +-/* Override STARTFILE_SPEC in unknown-elf.h. */
>> +-#undef STARTFILE_SPEC
>> +-#define STARTFILE_SPEC \
>> +-"%{mandroid: %(startfile_android) ;" \
>> +-" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: %(startfile_default)}"
>> +-
>> +-#undef ANDROID_ENDFILE_SPEC
>> +-#define ANDROID_ENDFILE_SPEC =C2=A0 =C2=A0 =C2=A0 =C2=A0"%{!shared:crt=
end_android%O%s}"
>> +-
>> +-/* Override ENDFILE_SPEC in unknown-elf.h. */
>> +-#undef ENDFILE_SPEC
>> +-#define ENDFILE_SPEC \
>> +-"%{mandroid: %(endfile_android) ;" \
>> +-" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: %(endfile_default)}"
>> +-
>> +Index: gcc-4.5.3/gcc/config/arm/eabi.opt
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/arm/eabi.opt
>> ++++ /dev/null
>> +@@ -1,23 +0,0 @@
>> +-; EABI specific options for ARM port of the compiler.
>> +-
>> +-; Copyright (C) 2008 Free Software Foundation, Inc.
>> +-;
>> +-; This file is part of GCC.
>> +-;
>> +-; GCC is free software; you can redistribute it and/or modify it under
>> +-; the terms of the GNU General Public License as published by the Free
>> +-; Software Foundation; either version 3, or (at your option) any later
>> +-; version.
>> +-;
>> +-; GCC is distributed in the hope that it will be useful, but WITHOUT A=
NY
>> +-; WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> +-; FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the GNU General Public L=
icense
>> +-; for more details.
>> +-;
>> +-; You should have received a copy of the GNU General Public License
>> +-; along with GCC; see the file COPYING3. =C2=A0If not see
>> +-; <http://www.gnu.org/licenses/>.
>> +-
>> +-mandroid
>> +-Target Report RejectNegative Mask(ANDROID)
>> +-Generate code for the Android operating system.
>> +Index: gcc-4.5.3/gcc/config/arm/linux-eabi.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/arm/linux-eabi.h
>> ++++ gcc-4.5.3/gcc/config/arm/linux-eabi.h
>> +@@ -70,7 +70,30 @@
>> + /* At this point, bpabi.h will have clobbered LINK_SPEC. =C2=A0We want=
 to
>> + =C2=A0 =C2=A0use the GNU/Linux version, not the generic BPABI version.=
 =C2=A0*/
>> + #undef =C2=A0LINK_SPEC
>> +-#define LINK_SPEC LINUX_TARGET_LINK_SPEC BE8_LINK_SPEC TARGET_FIX_V4BX=
_SPEC
>> ++#define LINK_SPEC BE8_LINK_SPEC TARGET_FIX_V4BX_SPEC =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> ++ =C2=A0LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC, =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
>> ++
>> ++#undef =C2=A0CC1_SPEC
>> ++#define CC1_SPEC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> ++ =C2=A0LINUX_OR_ANDROID_CC (LINUX_TARGET_CC1_SPEC, =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0LINUX_TARGET_CC1_SPEC " " ANDROID_CC1_SPEC)
>> ++
>> ++#define CC1PLUS_SPEC \
>> ++ =C2=A0LINUX_OR_ANDROID_CC ("", ANDROID_CC1PLUS_SPEC)
>> ++
>> ++#undef =C2=A0LIB_SPEC
>> ++#define LIB_SPEC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> ++ =C2=A0LINUX_OR_ANDROID_LD (LINUX_TARGET_LIB_SPEC, =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0LINUX_TARGET_LIB_SPEC " " ANDROID_LIB_SPEC)
>> ++
>> ++#undef STARTFILE_SPEC
>> ++#define STARTFILE_SPEC \
>> ++ =C2=A0LINUX_OR_ANDROID_LD (LINUX_TARGET_STARTFILE_SPEC, ANDROID_START=
FILE_SPEC)
>> ++
>> ++#undef ENDFILE_SPEC
>> ++#define ENDFILE_SPEC \
>> ++ =C2=A0LINUX_OR_ANDROID_LD (LINUX_TARGET_ENDFILE_SPEC, ANDROID_ENDFILE=
_SPEC)
>> +
>> + /* Use the default LIBGCC_SPEC, not the version in linux-elf.h, as we
>> + =C2=A0 =C2=A0do not use -lfloat. =C2=A0*/
>> +Index: gcc-4.5.3/gcc/config/arm/t-linux-androideabi
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- /dev/null
>> ++++ gcc-4.5.3/gcc/config/arm/t-linux-androideabi
>> +@@ -0,0 +1,10 @@
>> ++MULTILIB_OPTIONS =C2=A0 =C2=A0 =3D march=3Darmv7-a mthumb
>> ++MULTILIB_DIRNAMES =C2=A0 =C2=A0=3D armv7-a thumb
>> ++MULTILIB_EXCEPTIONS =C2=A0=3D
>> ++MULTILIB_MATCHES =C2=A0 =C2=A0 =3D
>> ++MULTILIB_OSDIRNAMES =C2=A0=3D
>> ++
>> ++# The "special" multilib can be used to build native applications for =
Android,
>> ++# as opposed to native shared libraries that are then called via JNI.
>> ++#MULTILIB_OPTIONS =C2=A0 =C2=A0+=3D tno-android-cc
>> ++#MULTILIB_DIRNAMES =C2=A0 +=3D special
>> +Index: gcc-4.5.3/gcc/config/linux-android.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- /dev/null
>> ++++ gcc-4.5.3/gcc/config/linux-android.h
>> +@@ -0,0 +1,53 @@
>> ++/* Configuration file for Linux Android targets.
>> ++ =C2=A0 Copyright (C) 2010
>> ++ =C2=A0 Free Software Foundation, Inc.
>> ++ =C2=A0 Contributed by CodeSourcery, Inc.
>> ++
>> ++ =C2=A0 This file is part of GCC.
>> ++
>> ++ =C2=A0 GCC is free software; you can redistribute it and/or modify it
>> ++ =C2=A0 under the terms of the GNU General Public License as published
>> ++ =C2=A0 by the Free Software Foundation; either version 3, or (at your
>> ++ =C2=A0 option) any later version.
>> ++
>> ++ =C2=A0 GCC is distributed in the hope that it will be useful, but WIT=
HOUT
>> ++ =C2=A0 ANY WARRANTY; without even the implied warranty of MERCHANTABI=
LITY
>> ++ =C2=A0 or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the GNU General=
 Public
>> ++ =C2=A0 License for more details.
>> ++
>> ++ =C2=A0 You should have received a copy of the GNU General Public Lice=
nse
>> ++ =C2=A0 along with GCC; see the file COPYING3. =C2=A0If not see
>> ++ =C2=A0 <http://www.gnu.org/licenses/>. =C2=A0*/
>> ++
>> ++#if ANDROID_DEFAULT
>> ++# define NOANDROID "mno-android"
>> ++#else
>> ++# define NOANDROID "!mandroid"
>> ++#endif
>> ++
>> ++#define LINUX_OR_ANDROID_CC(LINUX_SPEC, ANDROID_SPEC) \
>> ++ =C2=A0"%{" NOANDROID "|tno-android-cc:" LINUX_SPEC ";:" ANDROID_SPEC =
"}"
>> ++
>> ++#define LINUX_OR_ANDROID_LD(LINUX_SPEC, ANDROID_SPEC) \
>> ++ =C2=A0"%{" NOANDROID "|tno-android-ld:" LINUX_SPEC ";:" ANDROID_SPEC =
"}"
>> ++
>> ++#define ANDROID_LINK_SPEC \
>> ++ =C2=A0"%{shared: -Bsymbolic}"
>> ++
>> ++#define ANDROID_CC1_SPEC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0"%{!mglibc:%{!muclibc:%{!mbionic: -mbionic}}} " =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> ++ =C2=A0"%{!fno-pic:%{!fno-PIC:%{!fpic:%{!fPIC: -fPIC}}}}"
>> ++
>> ++#define ANDROID_CC1PLUS_SPEC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0"%{!fexceptions:%{!fno-exceptions: -fno-exceptions}} " =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0"%{!frtti:%{!fno-rtti: -fno-rtti}}"
>> ++
>> ++#define ANDROID_LIB_SPEC \
>> ++ =C2=A0"%{!static: -ldl}"
>> ++
>> ++#define ANDROID_STARTFILE_SPEC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0"%{!shared:" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0" =C2=A0%{static: crtbegin_static%O%s;: crtbegin_dynamic%O%s}}"
>> ++
>> ++#define ANDROID_ENDFILE_SPEC \
>> ++ =C2=A0"%{!shared: crtend_android%O%s}"
>> +Index: gcc-4.5.3/gcc/config/linux-android.opt
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- /dev/null
>> ++++ gcc-4.5.3/gcc/config/linux-android.opt
>> +@@ -0,0 +1,23 @@
>> ++; Android specific options.
>> ++
>> ++; Copyright (C) 2010 Free Software Foundation, Inc.
>> ++;
>> ++; This file is part of GCC.
>> ++;
>> ++; GCC is free software; you can redistribute it and/or modify it under
>> ++; the terms of the GNU General Public License as published by the Free
>> ++; Software Foundation; either version 3, or (at your option) any later
>> ++; version.
>> ++;
>> ++; GCC is distributed in the hope that it will be useful, but WITHOUT A=
NY
>> ++; WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> ++; FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the GNU General Public L=
icense
>> ++; for more details.
>> ++;
>> ++; You should have received a copy of the GNU General Public License
>> ++; along with GCC; see the file COPYING3. =C2=A0If not see
>> ++; <http://www.gnu.org/licenses/>.
>> ++
>> ++mandroid
>> ++Target Report Mask(ANDROID) Var(flag_android) Init(ANDROID_DEFAULT ? O=
PTION_MASK_ANDROID : 0)
>> ++Generate code for the Android platform.
>> +Index: gcc-4.5.3/gcc/config/linux.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/linux.h
>> ++++ gcc-4.5.3/gcc/config/linux.h
>> +@@ -1,6 +1,6 @@
>> + /* Definitions for Linux-based GNU systems with ELF format
>> + =C2=A0 =C2=A0Copyright (C) 1995, 1996, 1997, 1998, 1999, 2000, 2003, 2=
004, 2005, 2006,
>> +- =C2=A0 2007, 2009 Free Software Foundation, Inc.
>> ++ =C2=A0 2007, 2009, 2010 Free Software Foundation, Inc.
>> + =C2=A0 =C2=A0Contributed by Eric Youngdale.
>> + =C2=A0 =C2=A0Modified for stabs-in-ELF by H.J. Lu (hjl@lucon.org).
>> +
>> +@@ -42,16 +42,17 @@ see the files COPYING3 and COPYING.RUNTI
>> + =C2=A0 =C2=A0provides part of the support for getting C++ file-scope s=
tatic
>> + =C2=A0 =C2=A0object constructed before entering `main'. =C2=A0*/
>> +
>> +-#undef =C2=A0 =C2=A0 =C2=A0STARTFILE_SPEC
>> + #if defined HAVE_LD_PIE
>> +-#define STARTFILE_SPEC \
>> ++#define LINUX_TARGET_STARTFILE_SPEC \
>> + =C2=A0 "%{!shared: %{pg|p|profile:gcrt1.o%s;pie:Scrt1.o%s;:crt1.o%s}} =
\
>> + =C2=A0 =C2=A0crti.o%s %{static:crtbeginT.o%s;shared|pie:crtbeginS.o%s;=
:crtbegin.o%s}"
>> + #else
>> +-#define STARTFILE_SPEC \
>> ++#define LINUX_TARGET_STARTFILE_SPEC \
>> + =C2=A0 "%{!shared: %{pg|p|profile:gcrt1.o%s;:crt1.o%s}} \
>> + =C2=A0 =C2=A0crti.o%s %{static:crtbeginT.o%s;shared|pie:crtbeginS.o%s;=
:crtbegin.o%s}"
>> + #endif
>> ++#undef =C2=A0STARTFILE_SPEC
>> ++#define STARTFILE_SPEC LINUX_TARGET_STARTFILE_SPEC
>> +
>> + /* Provide a ENDFILE_SPEC appropriate for GNU/Linux. =C2=A0Here we tac=
k on
>> + =C2=A0 =C2=A0the GNU/Linux magical crtend.o file (see crtstuff.c) whic=
h
>> +@@ -59,33 +60,44 @@ see the files COPYING3 and COPYING.RUNTI
>> + =C2=A0 =C2=A0object constructed before entering `main', followed by a =
normal
>> + =C2=A0 =C2=A0GNU/Linux "finalizer" file, `crtn.o'. =C2=A0*/
>> +
>> +-#undef =C2=A0 =C2=A0 =C2=A0ENDFILE_SPEC
>> +-#define ENDFILE_SPEC \
>> ++#define LINUX_TARGET_ENDFILE_SPEC \
>> + =C2=A0 "%{shared|pie:crtendS.o%s;:crtend.o%s} crtn.o%s"
>> ++#undef =C2=A0ENDFILE_SPEC
>> ++#define ENDFILE_SPEC LINUX_TARGET_ENDFILE_SPEC
>> +
>> + /* This is for -profile to use -lc_p instead of -lc. =C2=A0*/
>> ++#define LINUX_TARGET_CC1_SPEC "%{profile:-p}"
>> + #ifndef CC1_SPEC
>> +-#define CC1_SPEC "%{profile:-p}"
>> ++#define CC1_SPEC LINUX_TARGET_CC1_SPEC
>> + #endif
>> +
>> + /* The GNU C++ standard library requires that these macros be defined.=
 =C2=A0*/
>> + #undef CPLUSPLUS_CPP_SPEC
>> + #define CPLUSPLUS_CPP_SPEC "-D_GNU_SOURCE %(cpp)"
>> +
>> +-#undef =C2=A0 =C2=A0 =C2=A0LIB_SPEC
>> +-#define LIB_SPEC \
>> ++#define LINUX_TARGET_LIB_SPEC \
>> + =C2=A0 "%{pthread:-lpthread} \
>> + =C2=A0 =C2=A0%{shared:-lc} \
>> + =C2=A0 =C2=A0%{!shared:%{mieee-fp:-lieee} %{profile:-lc_p}%{!profile:-=
lc}}"
>> ++#undef =C2=A0LIB_SPEC
>> ++#define LIB_SPEC LINUX_TARGET_LIB_SPEC
>> ++
>> ++/* C libraries supported on Linux. =C2=A0*/
>> ++#define OPTION_GLIBC =C2=A0(linux_libc =3D=3D LIBC_GLIBC)
>> ++#define OPTION_UCLIBC (linux_libc =3D=3D LIBC_UCLIBC)
>> ++#define OPTION_BIONIC (linux_libc =3D=3D LIBC_BIONIC)
>> +
>> + #define LINUX_TARGET_OS_CPP_BUILTINS() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 do { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> +- =C2=A0 =C2=A0builtin_define ("__gnu_linux__"); =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> ++ =C2=A0 =C2=A0if (OPTION_GLIBC) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \
>> ++ =C2=A0 =C2=A0 =C2=A0builtin_define ("__gnu_linux__"); =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0 builtin_define_std ("linux"); =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0 builtin_define_std ("unix"); =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 builtin_assert ("system=3Dlinux"); =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 builtin_assert ("system=3Dunix"); =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0 builtin_assert ("system=3Dposix"); =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0 =C2=A0if (OPTION_ANDROID) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \
>> ++ =C2=A0 =C2=A0 =C2=A0builtin_define ("__ANDROID__"); =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0 } while (0)
>> +
>> + #if defined(HAVE_LD_EH_FRAME_HDR)
>> +@@ -105,13 +117,24 @@ see the files COPYING3 and COPYING.RUNTI
>> + #endif
>> +
>> + /* Determine which dynamic linker to use depending on whether GLIBC or
>> +- =C2=A0 uClibc is the default C library and whether -muclibc or -mglib=
c has
>> +- =C2=A0 been passed to change the default. =C2=A0*/
>> +-#if UCLIBC_DEFAULT
>> +-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:%{muclibc:%e-mglibc and =
-muclibc used together}" G ";:" U "}"
>> ++ =C2=A0 uClibc or Bionic is the default C library and whether
>> ++ =C2=A0 -muclibc or -mglibc or -mbionic has been passed to change the =
default. =C2=A0*/
>> ++
>> ++#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LD1, LD2, LD3) =C2=
=A0\
>> ++ =C2=A0"%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:" LD1 "}}"
>> ++
>> ++#if DEFAULT_LIBC =3D=3D LIBC_GLIBC
>> ++#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
>> ++ =C2=A0CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", G, U, B=
)
>> ++#elif DEFAULT_LIBC =3D=3D LIBC_UCLIBC
>> ++#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
>> ++ =C2=A0CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", U, G, B=
)
>> ++#elif DEFAULT_LIBC =3D=3D LIBC_BIONIC
>> ++#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
>> ++ =C2=A0CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", B, G, U=
)
>> + #else
>> +-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:%{mglibc:%e-mglibc and =
-muclibc used together}" U ";:" G "}"
>> +-#endif
>> ++#error "Unsupported DEFAULT_LIBC"
>> ++#endif /* DEFAULT_LIBC */
>> +
>> + /* For most targets the following definitions suffice;
>> + =C2=A0 =C2=A0GLIBC_DYNAMIC_LINKER must be defined for each target usin=
g them, or
>> +@@ -120,18 +143,25 @@ see the files COPYING3 and COPYING.RUNTI
>> + #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
>> + #define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
>> + #define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
>> +-#define LINUX_DYNAMIC_LINKER \
>> +- =C2=A0CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LIN=
KER)
>> +-#define LINUX_DYNAMIC_LINKER32 \
>> +- =C2=A0CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_L=
INKER32)
>> +-#define LINUX_DYNAMIC_LINKER64 \
>> +- =C2=A0CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_L=
INKER64)
>> ++#define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
>> ++#define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
>> ++#define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
>> ++
>> ++#define LINUX_DYNAMIC_LINKER =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LIN=
KER, =C2=A0 =C2=A0 =C2=A0 \
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 BIONIC_DYNAMIC_LINKER)
>> ++#define LINUX_DYNAMIC_LINKER32 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_L=
INKER32, \
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 BIONIC_DYNAMIC_LINKER32)
>> ++#define LINUX_DYNAMIC_LINKER64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_L=
INKER64, \
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 BIONIC_DYNAMIC_LINKER64)
>> +
>> + /* Determine whether the entire c99 runtime
>> + =C2=A0 =C2=A0is present in the runtime library. =C2=A0*/
>> + #define TARGET_C99_FUNCTIONS (OPTION_GLIBC)
>> +
>> + /* Whether we have sincos that follows the GNU extension. =C2=A0*/
>> +-#define TARGET_HAS_SINCOS (OPTION_GLIBC)
>> ++#define TARGET_HAS_SINCOS (OPTION_GLIBC | OPTION_BIONIC)
>> +
>> + #define TARGET_POSIX_IO
>> +Index: gcc-4.5.3/gcc/config/linux.opt
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/linux.opt
>> ++++ gcc-4.5.3/gcc/config/linux.opt
>> +@@ -1,6 +1,6 @@
>> + ; Processor-independent options for GNU/Linux.
>> + ;
>> +-; Copyright (C) 2006, 2007, 2009 Free Software Foundation, Inc.
>> ++; Copyright (C) 2006, 2007, 2009, 2010 Free Software Foundation, Inc.
>> + ; Contributed by CodeSourcery.
>> + ;
>> + ; This file is part of GCC.
>> +@@ -19,10 +19,14 @@
>> + ; along with GCC; see the file COPYING3. =C2=A0If not see
>> + ; <http://www.gnu.org/licenses/>.
>> +
>> ++mbionic
>> ++Target Report RejectNegative Var(linux_libc,LIBC_BIONIC) Init(DEFAULT_=
LIBC) Negative(mglibc)
>> ++Use Bionic C library
>> ++
>> + mglibc
>> +-Target RejectNegative Report InverseMask(UCLIBC, GLIBC) Var(linux_ucli=
bc) Init(UCLIBC_DEFAULT ? OPTION_MASK_UCLIBC : 0)
>> +-Use GNU libc instead of uClibc
>> ++Target Report RejectNegative Var(linux_libc,LIBC_GLIBC) VarExists Nega=
tive(muclibc)
>> ++Use GNU C library
>> +
>> + muclibc
>> +-Target RejectNegative Report Mask(UCLIBC) Var(linux_uclibc) VarExists
>> +-Use uClibc instead of GNU libc
>> ++Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) VarExists Neg=
ative(mbionic)
>> ++Use uClibc C library
>> +Index: gcc-4.5.3/gcc/config/rs6000/linux64.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/rs6000/linux64.h
>> ++++ gcc-4.5.3/gcc/config/rs6000/linux64.h
>> +@@ -344,10 +344,12 @@ extern int dot_symbols;
>> + #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld64.so.1"
>> + #define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
>> + #define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
>> +-#if UCLIBC_DEFAULT
>> +-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:%{muclibc:%e-mglibc and =
-muclibc used together}" G ";:" U "}"
>> ++#if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
>> ++#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
>> ++#elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
>> ++#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
>> + #else
>> +-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:%{mglibc:%e-mglibc and =
-muclibc used together}" U ";:" G "}"
>> ++#error "Unsupported DEFAULT_LIBC"
>> + #endif
>> + #define LINUX_DYNAMIC_LINKER32 \
>> + =C2=A0 CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_L=
INKER32)
>> +Index: gcc-4.5.3/gcc/config/rs6000/sysv4.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/config/rs6000/sysv4.h
>> ++++ gcc-4.5.3/gcc/config/rs6000/sysv4.h
>> +@@ -901,10 +901,12 @@ SVR4_ASM_SPEC \
>> +
>> + #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
>> + #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
>> +-#if UCLIBC_DEFAULT
>> +-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:%{muclibc:%e-mglibc and =
-muclibc used together}" G ";:" U "}"
>> ++#if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
>> ++#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
>> ++#elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
>> ++#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
>> + #else
>> +-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:%{mglibc:%e-mglibc and =
-muclibc used together}" U ";:" G "}"
>> ++#error "Unsupported DEFAULT_LIBC"
>> + #endif
>> + #define LINUX_DYNAMIC_LINKER \
>> + =C2=A0 CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LIN=
KER)
>> +Index: gcc-4.5.3/gcc/doc/invoke.texi
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/doc/invoke.texi
>> ++++ gcc-4.5.3/gcc/doc/invoke.texi
>> +@@ -565,7 +565,8 @@ Objective-C and Objective-C++ Dialects}.
>> + -mcpu=3D@var{cpu}}
>> +
>> + @emph{GNU/Linux Options}
>> +-@gccoptlist{-muclibc}
>> ++@gccoptlist{-mglibc -muclibc -mbionic -mandroid @gol
>> ++-tno-android-cc -tno-android-ld}
>> +
>> + @emph{H8/300 Options}
>> + @gccoptlist{-mrelax =C2=A0-mh =C2=A0-ms =C2=A0-mn =C2=A0-mint32 =C2=A0=
-malign-300}
>> +@@ -11469,13 +11470,41 @@ These @samp{-m} options are defined for
>> + @table @gcctabopt
>> + @item -mglibc
>> + @opindex mglibc
>> +-Use the GNU C library instead of uClibc. =C2=A0This is the default exc=
ept
>> +-on @samp{*-*-linux-*uclibc*} targets.
>> ++Use the GNU C library. =C2=A0This is the default except
>> ++on @samp{*-*-linux-*uclibc*} and @samp{*-*-linux-*android*} targets.
>> +
>> + @item -muclibc
>> + @opindex muclibc
>> +-Use uClibc instead of the GNU C library. =C2=A0This is the default on
>> ++Use uClibc C library. =C2=A0This is the default on
>> + @samp{*-*-linux-*uclibc*} targets.
>> ++
>> ++@item -mbionic
>> ++@opindex mbionic
>> ++Use Bionic C library. =C2=A0This is the default on
>> ++@samp{*-*-linux-*android*} targets.
>> ++
>> ++@item -mandroid
>> ++@opindex mandroid
>> ++Compile code compatible with Android platform. =C2=A0This is the defau=
lt on
>> ++@samp{*-*-linux-*android*} targets.
>> ++
>> ++When compiling, this option enables @option{-mbionic}, @option{-fPIC},
>> ++@option{-fno-exceptions} and @option{-fno-rtti} by default. =C2=A0When=
 linking,
>> ++this option makes the GCC driver pass Android-specific options to the =
linker.
>> ++Finally, this option causes the preprocessor macro @code{__ANDROID__}
>> ++to be defined.
>> ++
>> ++@item -tno-android-cc
>> ++@opindex tno-android-cc
>> ++Disable compilation effects of @option{-mandroid}, i.e., do not enable
>> ++@option{-mbionic}, @option{-fPIC}, @option{-fno-exceptions} and
>> ++@option{-fno-rtti} by default.
>> ++
>> ++@item -tno-android-ld
>> ++@opindex tno-android-ld
>> ++Disable linking effects of @option{-mandroid}, i.e., pass standard Lin=
ux
>> ++linking options to the linker.
>> ++
>> + @end table
>> +
>> + @node H8/300 Options
>> +Index: gcc-4.5.3/gcc/gthr-posix.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/gthr-posix.h
>> ++++ gcc-4.5.3/gcc/gthr-posix.h
>> +@@ -124,7 +124,9 @@ __gthrw(pthread_join)
>> + __gthrw(pthread_equal)
>> + __gthrw(pthread_self)
>> + __gthrw(pthread_detach)
>> ++#ifndef __BIONIC__
>> + __gthrw(pthread_cancel)
>> ++#endif
>> + __gthrw(sched_yield)
>> +
>> + __gthrw(pthread_mutex_lock)
>> +@@ -238,7 +240,15 @@ static inline int
>> + __gthread_active_p (void)
>> + {
>> + =C2=A0 static void *const __gthread_active_ptr
>> +- =C2=A0 =C2=A0=3D __extension__ (void *) &__gthrw_(pthread_cancel);
>> ++ =C2=A0 =C2=A0=3D __extension__ (void *) &__gthrw_(
>> ++/* Android's C library does not provide pthread_cancel, check for
>> ++ =C2=A0 `pthread_create' instead. =C2=A0*/
>> ++#ifndef __BIONIC__
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_cancel
>> ++#else
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_create
>> ++#endif
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 );
>> + =C2=A0 return __gthread_active_ptr !=3D 0;
>> + }
>> +
>> +Index: gcc-4.5.3/gcc/testsuite/gcc.dg/glibc-uclibc-1.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/testsuite/gcc.dg/glibc-uclibc-1.c
>> ++++ /dev/null
>> +@@ -1,6 +0,0 @@
>> +-/* Test -mglibc and -muclibc not allowed together. =C2=A0*/
>> +-/* Origin: Joseph Myers <joseph@codesourcery.com> */
>> +-/* { dg-do link { target *-*-linux* } } */
>> +-/* { dg-options "-mglibc -muclibc" } */
>> +-
>> +-/* { dg-message "-mglibc and -muclibc used together" "" { target *-*-*=
 } 0 } */
>> +Index: gcc-4.5.3/gcc/testsuite/gcc.dg/glibc-uclibc-2.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/gcc/testsuite/gcc.dg/glibc-uclibc-2.c
>> ++++ /dev/null
>> +@@ -1,6 +0,0 @@
>> +-/* Test -mglibc and -muclibc not allowed together. =C2=A0*/
>> +-/* Origin: Joseph Myers <joseph@codesourcery.com> */
>> +-/* { dg-do link { target *-*-linux* } } */
>> +-/* { dg-options "-muclibc -mglibc" } */
>> +-
>> +-/* { dg-message "-mglibc and -muclibc used together" "" { target *-*-*=
 } 0 } */
>> +Index: gcc-4.5.3/libstdc++-v3/acinclude.m4
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/libstdc++-v3/acinclude.m4
>> ++++ gcc-4.5.3/libstdc++-v3/acinclude.m4
>> +@@ -95,7 +95,7 @@ AC_DEFUN([GLIBCXX_CONFIGURE], [
>> + =C2=A0 ## (Right now, this only matters for enable_wchar_t, but nothin=
g prevents
>> + =C2=A0 ## other macros from doing the same. =C2=A0This should be autom=
ated.) =C2=A0-pme
>> +
>> +- =C2=A0# Check for uClibc since Linux platforms use different configur=
ation
>> ++ =C2=A0# Check for C library flavor since Linux platforms use differen=
t configuration
>> + =C2=A0 # directories depending on the C library in use.
>> + =C2=A0 AC_EGREP_CPP([_using_uclibc], [
>> + =C2=A0 #include <stdio.h>
>> +@@ -104,6 +104,13 @@ AC_DEFUN([GLIBCXX_CONFIGURE], [
>> + =C2=A0 #endif
>> + =C2=A0 ], uclibc=3Dyes, uclibc=3Dno)
>> +
>> ++ =C2=A0AC_EGREP_CPP([_using_bionic], [
>> ++ =C2=A0#include <stdio.h>
>> ++ =C2=A0#if __BIONIC__
>> ++ =C2=A0 =C2=A0_using_bionic
>> ++ =C2=A0#endif
>> ++ =C2=A0], bionic=3Dyes, bionic=3Dno)
>> ++
>> + =C2=A0 # Find platform-specific directories containing configuration i=
nfo.
>> + =C2=A0 # Also possibly modify flags used elsewhere, as needed by the p=
latform.
>> + =C2=A0 GLIBCXX_CHECK_HOST
>> +@@ -2722,7 +2729,7 @@ void foo()
>> + }
>> + EOF
>> + =C2=A0 =C2=A0 old_CXXFLAGS=3D"$CXXFLAGS"
>> +- =C2=A0 =C2=A0CXXFLAGS=3D-S
>> ++ =C2=A0 =C2=A0CXXFLAGS=3D"-S -fexceptions"
>> + =C2=A0 =C2=A0 if AC_TRY_EVAL(ac_compile); then
>> + =C2=A0 =C2=A0 =C2=A0 if grep _Unwind_SjLj_Resume conftest.s >/dev/null=
 2>&1 ; then
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_sjlj_exceptions=3Dyes
>> +Index: gcc-4.5.3/libstdc++-v3/config/os/bionic/ctype_base.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- /dev/null
>> ++++ gcc-4.5.3/libstdc++-v3/config/os/bionic/ctype_base.h
>> +@@ -0,0 +1,57 @@
>> ++// Locale support -*- C++ -*-
>> ++
>> ++// Copyright (C) 2010 Free Software Foundation, Inc.
>> ++//
>> ++// This file is part of the GNU ISO C++ Library. =C2=A0This library is=
 free
>> ++// software; you can redistribute it and/or modify it under the
>> ++// terms of the GNU General Public License as published by the
>> ++// Free Software Foundation; either version 3, or (at your option)
>> ++// any later version.
>> ++
>> ++// This library is distributed in the hope that it will be useful,
>> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the
>> ++// GNU General Public License for more details.
>> ++
>> ++// Under Section 7 of GPL version 3, you are granted additional
>> ++// permissions described in the GCC Runtime Library Exception, version
>> ++// 3.1, as published by the Free Software Foundation.
>> ++
>> ++// You should have received a copy of the GNU General Public License a=
nd
>> ++// a copy of the GCC Runtime Library Exception along with this program=
;
>> ++// see the files COPYING3 and COPYING.RUNTIME respectively. =C2=A0If n=
ot, see
>> ++// <http://www.gnu.org/licenses/>.
>> ++
>> ++//
>> ++// ISO C++ 14882: 22.1 =C2=A0Locales
>> ++//
>> ++
>> ++// Information as gleaned from /usr/include/ctype.h, for solaris2.5.1
>> ++
>> ++// Support for Solaris 2.5.1
>> ++
>> ++_GLIBCXX_BEGIN_NAMESPACE(std)
>> ++
>> ++ =C2=A0/// @brief =C2=A0Base class for ctype.
>> ++ =C2=A0struct ctype_base
>> ++ =C2=A0{
>> ++ =C2=A0 =C2=A0// Non-standard typedefs.
>> ++ =C2=A0 =C2=A0typedef const int* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0__to_type;
>> ++
>> ++ =C2=A0 =C2=A0// NB: Offsets into ctype<char>::_M_table force a partic=
ular size
>> ++ =C2=A0 =C2=A0// on the mask type. Because of this, we don't use an en=
um.
>> ++ =C2=A0 =C2=A0typedef char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ma=
sk;
>> ++ =C2=A0 =C2=A0static const mask upper =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
_U;
>> ++ =C2=A0 =C2=A0static const mask lower =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
_L;
>> ++ =C2=A0 =C2=A0static const mask alpha =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
_U | _L;
>> ++ =C2=A0 =C2=A0static const mask digit =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
_N;
>> ++ =C2=A0 =C2=A0static const mask xdigit =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
_X | _N;
>> ++ =C2=A0 =C2=A0static const mask space =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
_S;
>> ++ =C2=A0 =C2=A0static const mask print =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
_P | _U | _L | _N | _B;
>> ++ =C2=A0 =C2=A0static const mask graph =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
_P | _U | _L | _N;
>> ++ =C2=A0 =C2=A0static const mask cntrl =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
_C;
>> ++ =C2=A0 =C2=A0static const mask punct =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
_P;
>> ++ =C2=A0 =C2=A0static const mask alnum =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
_U | _L | _N;
>> ++ =C2=A0};
>> ++
>> ++_GLIBCXX_END_NAMESPACE
>> +Index: gcc-4.5.3/libstdc++-v3/config/os/bionic/ctype_inline.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- /dev/null
>> ++++ gcc-4.5.3/libstdc++-v3/config/os/bionic/ctype_inline.h
>> +@@ -0,0 +1,71 @@
>> ++// Locale support -*- C++ -*-
>> ++
>> ++// Copyright (C) 2010 Free Software Foundation, Inc.
>> ++//
>> ++// This file is part of the GNU ISO C++ Library. =C2=A0This library is=
 free
>> ++// software; you can redistribute it and/or modify it under the
>> ++// terms of the GNU General Public License as published by the
>> ++// Free Software Foundation; either version 3, or (at your option)
>> ++// any later version.
>> ++
>> ++// This library is distributed in the hope that it will be useful,
>> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the
>> ++// GNU General Public License for more details.
>> ++
>> ++// Under Section 7 of GPL version 3, you are granted additional
>> ++// permissions described in the GCC Runtime Library Exception, version
>> ++// 3.1, as published by the Free Software Foundation.
>> ++
>> ++// You should have received a copy of the GNU General Public License a=
nd
>> ++// a copy of the GCC Runtime Library Exception along with this program=
;
>> ++// see the files COPYING3 and COPYING.RUNTIME respectively. =C2=A0If n=
ot, see
>> ++// <http://www.gnu.org/licenses/>.
>> ++
>> ++/** @file ctype_inline.h
>> ++ * =C2=A0This is an internal header file, included by other library he=
aders.
>> ++ * =C2=A0You should not attempt to use it directly.
>> ++ */
>> ++
>> ++//
>> ++// ISO C++ 14882: 22.1 =C2=A0Locales
>> ++//
>> ++
>> ++// ctype bits to be inlined go here. Non-inlinable (ie virtual do_*)
>> ++// functions go in ctype.cc
>> ++
>> ++_GLIBCXX_BEGIN_NAMESPACE(std)
>> ++
>> ++ =C2=A0bool
>> ++ =C2=A0ctype<char>::
>> ++ =C2=A0is(mask __m, char __c) const
>> ++ =C2=A0{ return _M_table[static_cast<unsigned char>(__c)] & __m; }
>> ++
>> ++ =C2=A0const char*
>> ++ =C2=A0ctype<char>::
>> ++ =C2=A0is(const char* __low, const char* __high, mask* __vec) const
>> ++ =C2=A0{
>> ++ =C2=A0 =C2=A0while (__low < __high)
>> ++ =C2=A0 =C2=A0 =C2=A0*__vec++ =3D _M_table[static_cast<unsigned char>(=
*__low++)];
>> ++ =C2=A0 =C2=A0return __high;
>> ++ =C2=A0}
>> ++
>> ++ =C2=A0const char*
>> ++ =C2=A0ctype<char>::
>> ++ =C2=A0scan_is(mask __m, const char* __low, const char* __high) const
>> ++ =C2=A0{
>> ++ =C2=A0 =C2=A0while (__low < __high && !this->is(__m, *__low))
>> ++ =C2=A0 =C2=A0 =C2=A0++__low;
>> ++ =C2=A0 =C2=A0return __low;
>> ++ =C2=A0}
>> ++
>> ++ =C2=A0const char*
>> ++ =C2=A0ctype<char>::
>> ++ =C2=A0scan_not(mask __m, const char* __low, const char* __high) const
>> ++ =C2=A0{
>> ++ =C2=A0 =C2=A0while (__low < __high && this->is(__m, *__low) !=3D 0)
>> ++ =C2=A0 =C2=A0 =C2=A0++__low;
>> ++ =C2=A0 =C2=A0return __low;
>> ++ =C2=A0}
>> ++
>> ++_GLIBCXX_END_NAMESPACE
>> +Index: gcc-4.5.3/libstdc++-v3/config/os/bionic/ctype_noninline.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- /dev/null
>> ++++ gcc-4.5.3/libstdc++-v3/config/os/bionic/ctype_noninline.h
>> +@@ -0,0 +1,98 @@
>> ++// Locale support -*- C++ -*-
>> ++
>> ++// Copyright (C) 2010 Free Software Foundation, Inc.
>> ++//
>> ++// This file is part of the GNU ISO C++ Library. =C2=A0This library is=
 free
>> ++// software; you can redistribute it and/or modify it under the
>> ++// terms of the GNU General Public License as published by the
>> ++// Free Software Foundation; either version 3, or (at your option)
>> ++// any later version.
>> ++
>> ++// This library is distributed in the hope that it will be useful,
>> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the
>> ++// GNU General Public License for more details.
>> ++
>> ++// Under Section 7 of GPL version 3, you are granted additional
>> ++// permissions described in the GCC Runtime Library Exception, version
>> ++// 3.1, as published by the Free Software Foundation.
>> ++
>> ++// You should have received a copy of the GNU General Public License a=
nd
>> ++// a copy of the GCC Runtime Library Exception along with this program=
;
>> ++// see the files COPYING3 and COPYING.RUNTIME respectively. =C2=A0If n=
ot, see
>> ++// <http://www.gnu.org/licenses/>.
>> ++
>> ++/** @file ctype_noninline.h
>> ++ * =C2=A0This is an internal header file, included by other library he=
aders.
>> ++ * =C2=A0You should not attempt to use it directly.
>> ++ */
>> ++
>> ++//
>> ++// ISO C++ 14882: 22.1 =C2=A0Locales
>> ++//
>> ++
>> ++// Information as gleaned from /usr/include/ctype.h
>> ++
>> ++ =C2=A0const ctype_base::mask*
>> ++ =C2=A0ctype<char>::classic_table() throw()
>> ++ =C2=A0{ return _ctype_ + 1; }
>> ++
>> ++ =C2=A0ctype<char>::ctype(__c_locale, const mask* __table, bool __del,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t __refs=
)
>> ++ =C2=A0: facet(__refs), _M_del(__table !=3D 0 && __del),
>> ++ =C2=A0_M_toupper(NULL), _M_tolower(NULL),
>> ++ =C2=A0_M_table(__table ? __table : classic_table())
>> ++ =C2=A0{
>> ++ =C2=A0 =C2=A0memset(_M_widen, 0, sizeof(_M_widen));
>> ++ =C2=A0 =C2=A0_M_widen_ok =3D 0;
>> ++ =C2=A0 =C2=A0memset(_M_narrow, 0, sizeof(_M_narrow));
>> ++ =C2=A0 =C2=A0_M_narrow_ok =3D 0;
>> ++ =C2=A0}
>> ++
>> ++ =C2=A0ctype<char>::ctype(const mask* __table, bool __del, size_t __re=
fs)
>> ++ =C2=A0: facet(__refs), _M_del(__table !=3D 0 && __del),
>> ++ =C2=A0_M_toupper(NULL), _M_tolower(NULL),
>> ++ =C2=A0_M_table(__table ? __table : classic_table())
>> ++ =C2=A0{
>> ++ =C2=A0 =C2=A0memset(_M_widen, 0, sizeof(_M_widen));
>> ++ =C2=A0 =C2=A0_M_widen_ok =3D 0;
>> ++ =C2=A0 =C2=A0memset(_M_narrow, 0, sizeof(_M_narrow));
>> ++ =C2=A0 =C2=A0_M_narrow_ok =3D 0;
>> ++ =C2=A0}
>> ++
>> ++ =C2=A0char
>> ++ =C2=A0ctype<char>::do_toupper(char __c) const
>> ++ =C2=A0{
>> ++ =C2=A0 =C2=A0int __x =3D __c;
>> ++ =C2=A0 =C2=A0return (this->is(ctype_base::lower, __c) ? (__x - 'a' + =
'A') : __x);
>> ++ =C2=A0}
>> ++
>> ++ =C2=A0const char*
>> ++ =C2=A0ctype<char>::do_toupper(char* __low, const char* __high) const
>> ++ =C2=A0{
>> ++ =C2=A0 =C2=A0while (__low < __high)
>> ++ =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0*__low =3D this->do_toupper(*__low);
>> ++ =C2=A0 =C2=A0++__low;
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0return __high;
>> ++ =C2=A0}
>> ++
>> ++ =C2=A0char
>> ++ =C2=A0ctype<char>::do_tolower(char __c) const
>> ++ =C2=A0{
>> ++ =C2=A0 =C2=A0int __x =3D __c;
>> ++ =C2=A0 =C2=A0return (this->is(ctype_base::upper, __c) ? (__x - 'A' + =
'a') : __x);
>> ++ =C2=A0}
>> ++
>> ++ =C2=A0const char*
>> ++ =C2=A0ctype<char>::do_tolower(char* __low, const char* __high) const
>> ++ =C2=A0{
>> ++ =C2=A0 =C2=A0while (__low < __high)
>> ++ =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0*__low =3D this->do_tolower(*__low);
>> ++ =C2=A0 =C2=A0++__low;
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0return __high;
>> ++ =C2=A0}
>> ++
>> +Index: gcc-4.5.3/libstdc++-v3/config/os/bionic/os_defines.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- /dev/null
>> ++++ gcc-4.5.3/libstdc++-v3/config/os/bionic/os_defines.h
>> +@@ -0,0 +1,36 @@
>> ++// Specific definitions for Bionic =C2=A0-*- C++ -*-
>> ++
>> ++// Copyright (C) 2010 Free Software Foundation, Inc.
>> ++//
>> ++// This file is part of the GNU ISO C++ Library. =C2=A0This library is=
 free
>> ++// software; you can redistribute it and/or modify it under the
>> ++// terms of the GNU General Public License as published by the
>> ++// Free Software Foundation; either version 3, or (at your option)
>> ++// any later version.
>> ++
>> ++// This library is distributed in the hope that it will be useful,
>> ++// but WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See the
>> ++// GNU General Public License for more details.
>> ++
>> ++// Under Section 7 of GPL version 3, you are granted additional
>> ++// permissions described in the GCC Runtime Library Exception, version
>> ++// 3.1, as published by the Free Software Foundation.
>> ++
>> ++// You should have received a copy of the GNU General Public License a=
nd
>> ++// a copy of the GCC Runtime Library Exception along with this program=
;
>> ++// see the files COPYING3 and COPYING.RUNTIME respectively. =C2=A0If n=
ot, see
>> ++// <http://www.gnu.org/licenses/>.
>> ++
>> ++/** @file os_defines.h
>> ++ * =C2=A0This is an internal header file, included by other library he=
aders.
>> ++ * =C2=A0You should not attempt to use it directly.
>> ++ */
>> ++
>> ++#ifndef _GLIBCXX_OS_DEFINES
>> ++#define _GLIBCXX_OS_DEFINES 1
>> ++
>> ++// System-specific #define, typedefs, corrections, etc, go here. =C2=
=A0This
>> ++// file will come before all others.
>> ++
>> ++#endif
>> +Index: gcc-4.5.3/libstdc++-v3/configure
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/libstdc++-v3/configure
>> ++++ gcc-4.5.3/libstdc++-v3/configure
>> +@@ -5185,7 +5185,7 @@ fi
>> + =C2=A0 ## (Right now, this only matters for enable_wchar_t, but nothin=
g prevents
>> + =C2=A0 ## other macros from doing the same. =C2=A0This should be autom=
ated.) =C2=A0-pme
>> +
>> +- =C2=A0# Check for uClibc since Linux platforms use different configur=
ation
>> ++ =C2=A0# Check for C library flavor since Linux platforms use differen=
t configuration
>> + =C2=A0 # directories depending on the C library in use.
>> + =C2=A0 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
>> + /* end confdefs.h. =C2=A0*/
>> +@@ -5205,6 +5205,24 @@ fi
>> + rm -f conftest*
>> +
>> +
>> ++ =C2=A0cat confdefs.h - <<_ACEOF >conftest.$ac_ext
>> ++/* end confdefs.h. =C2=A0*/
>> ++
>> ++ =C2=A0#include <stdio.h>
>> ++ =C2=A0#if __BIONIC__
>> ++ =C2=A0 =C2=A0_using_bionic
>> ++ =C2=A0#endif
>> ++
>> ++_ACEOF
>> ++if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
>> ++ =C2=A0$EGREP "_using_bionic" >/dev/null 2>&1; then :
>> ++ =C2=A0bionic=3Dyes
>> ++else
>> ++ =C2=A0bionic=3Dno
>> ++fi
>> ++rm -f conftest*
>> ++
>> ++
>> + =C2=A0 # Find platform-specific directories containing configuration i=
nfo.
>> + =C2=A0 # Also possibly modify flags used elsewhere, as needed by the p=
latform.
>> +
>> +@@ -14897,7 +14915,7 @@ void foo()
>> + }
>> + EOF
>> + =C2=A0 =C2=A0 old_CXXFLAGS=3D"$CXXFLAGS"
>> +- =C2=A0 =C2=A0CXXFLAGS=3D-S
>> ++ =C2=A0 =C2=A0CXXFLAGS=3D"-S -fexceptions"
>> + =C2=A0 =C2=A0 if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$a=
c_compile\""; } >&5
>> + =C2=A0 (eval $ac_compile) 2>&5
>> + =C2=A0 ac_status=3D$?
>> +Index: gcc-4.5.3/libstdc++-v3/configure.host
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- gcc-4.5.3.orig/libstdc++-v3/configure.host
>> ++++ gcc-4.5.3/libstdc++-v3/configure.host
>> +@@ -238,6 +238,8 @@ case "${host_os}" in
>> + =C2=A0 gnu* | linux* | kfreebsd*-gnu | knetbsd*-gnu)
>> + =C2=A0 =C2=A0 if [ "$uclibc" =3D "yes" ]; then
>> + =C2=A0 =C2=A0 =C2=A0 os_include_dir=3D"os/uclibc"
>> ++ =C2=A0 =C2=A0elif [ "$bionic" =3D "yes" ]; then
>> ++ =C2=A0 =C2=A0 =C2=A0os_include_dir=3D"os/bionic"
>> + =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 os_include_dir=3D"os/gnu-linux"
>> + =C2=A0 =C2=A0 fi
>> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-=
r99495.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99495.patch
>> new file mode 100644
>> index 0000000..bb866ce
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.=
patch
>> @@ -0,0 +1,784 @@
>> +2011-03-24 =C2=A0Revital Eres =C2=A0<revital.eres@linaro.org>
>> +
>> + =C2=A0 =C2=A0 gcc/
>> + =C2=A0 =C2=A0 * loop-doloop.c (doloop_condition_get): Support new form=
 of
>> + =C2=A0 =C2=A0 doloop pattern and use prev_nondebug_insn instead of PRE=
V_INSN.
>> + =C2=A0 =C2=A0 * config/arm/thumb2.md (*thumb2_addsi3_compare0): Remove=
 "*".
>> + =C2=A0 =C2=A0 (doloop_end): New.
>> + =C2=A0 =C2=A0 * config/arm/arm.md (*addsi3_compare0): Remove "*".
>> + =C2=A0 =C2=A0 * ddg.c (check_closing_branch_deps, get_node_of_insn_uid=
):
>> + =C2=A0 =C2=A0 New functions.
>> + =C2=A0 =C2=A0 (create_ddg): Pass sbitmap containing do-loop related
>> + =C2=A0 =C2=A0 instructions instead of closing_branch_deps parameter an=
d call
>> + =C2=A0 =C2=A0 check_closing_branch_deps function.
>> + =C2=A0 =C2=A0 * ddg.h (create_ddg): Adjust the function declaration.
>> + =C2=A0 =C2=A0 * modulo-sched.c (PS_STAGE_COUNT): Rename to CALC_STAGE_=
COUNT
>> + =C2=A0 =C2=A0 and redefine.
>> + =C2=A0 =C2=A0 (doloop_register_get): Handle NONDEBUG_INSN_P.
>> + =C2=A0 =C2=A0 (stage_count): New field in struct partial_schedule.
>> + =C2=A0 =C2=A0 (mark_doloop_insns, calculate_stage_count): New function=
s.
>> + =C2=A0 =C2=A0 (normalize_sched_times): Rename to reset_sched_times and=
 handle
>> + =C2=A0 =C2=A0 incrementing the sched time of the nodes by a constant v=
alue
>> + =C2=A0 =C2=A0 passed as parameter.
>> + =C2=A0 =C2=A0 (duplicate_insns_of_cycles): Skip closing branch.
>> + =C2=A0 =C2=A0 (sms_schedule_by_order): Schedule closing branch when
>> + =C2=A0 =C2=A0 closing_branch_deps is true.
>> + =C2=A0 =C2=A0 (ps_insn_find_column): Handle closing branch.
>> + =C2=A0 =C2=A0 (sms_schedule): Call reset_sched_times and handle case w=
here
>> + =C2=A0 =C2=A0 do-loop pattern is not decoupled from the other loop ins=
tructions.
>> + =C2=A0 =C2=A0 Support new form of doloop pattern.
>> + =C2=A0 =C2=A0 (ps_insert_empty_row): Update calls to normalize_sched_t=
imes
>> + =C2=A0 =C2=A0 and rotate_partial_schedule functions.
>> +
>> +=3D=3D=3D modified file 'gcc/config/arm/arm.md'
>> +--- old/gcc/config/arm/arm.md =C2=A0 =C2=A0 =C2=A0 =C2=A02011-03-11 14:=
26:34 +0000
>> ++++ new/gcc/config/arm/arm.md =C2=A0 =C2=A0 =C2=A0 =C2=A02011-03-24 07:=
45:38 +0000
>> +@@ -734,7 +734,7 @@
>> + =C2=A0 ""
>> + )
>> +
>> +-(define_insn "*addsi3_compare0"
>> ++(define_insn "addsi3_compare0"
>> + =C2=A0 [(set (reg:CC_NOOV CC_REGNUM)
>> + =C2=A0 =C2=A0 (compare:CC_NOOV
>> + =C2=A0 =C2=A0 =C2=A0(plus:SI (match_operand:SI 1 "s_register_operand" =
"r, r")
>> +
>> +=3D=3D=3D modified file 'gcc/config/arm/thumb2.md'
>> +--- old/gcc/config/arm/thumb2.md =C2=A0 =C2=A0 2011-02-08 10:51:58 +000=
0
>> ++++ new/gcc/config/arm/thumb2.md =C2=A0 =C2=A0 2011-03-24 07:45:38 +000=
0
>> +@@ -1194,7 +1194,7 @@
>> + =C2=A0 =C2=A0(set_attr "length" "2")]
>> + )
>> +
>> +-(define_insn "*thumb2_addsi3_compare0"
>> ++(define_insn "thumb2_addsi3_compare0"
>> + =C2=A0 [(set (reg:CC_NOOV CC_REGNUM)
>> + =C2=A0 =C2=A0 (compare:CC_NOOV
>> + =C2=A0 =C2=A0 =C2=A0 (plus:SI (match_operand:SI 1 "s_register_operand"=
 "l, =C2=A00, r")
>> +@@ -1445,3 +1445,56 @@
>> + =C2=A0 [(set_attr "length" "4,4,16")
>> + =C2=A0 =C2=A0(set_attr "predicable" "yes")]
>> + )
>> ++
>> ++
>> ++;; Define the subtract-one-and-jump insns so loop.c
>> ++;; knows what to generate.
>> ++(define_expand "doloop_end"
>> ++ =C2=A0[(use (match_operand 0 "" "")) =C2=A0 =C2=A0 =C2=A0; loop pseud=
o
>> ++ =C2=A0 (use (match_operand 1 "" "")) =C2=A0 =C2=A0 =C2=A0; iterations=
; zero if unknown
>> ++ =C2=A0 (use (match_operand 2 "" "")) =C2=A0 =C2=A0 =C2=A0; max iterat=
ions
>> ++ =C2=A0 (use (match_operand 3 "" "")) =C2=A0 =C2=A0 =C2=A0; loop level
>> ++ =C2=A0 (use (match_operand 4 "" ""))] =C2=A0 =C2=A0 ; label
>> ++ =C2=A0"TARGET_32BIT"
>> ++ =C2=A0"
>> ++ {
>> ++ =C2=A0 /* Currently SMS relies on the do-loop pattern to recognize lo=
ops
>> ++ =C2=A0 =C2=A0 =C2=A0where (1) the control part consists of all insns =
defining and/or
>> ++ =C2=A0 =C2=A0 =C2=A0using a certain 'count' register and (2) the loop=
 count can be
>> ++ =C2=A0 =C2=A0 =C2=A0adjusted by modifying this register prior to the =
loop.
>> ++ =C2=A0 =C2=A0 ??? The possible introduction of a new block to initial=
ize the
>> ++ =C2=A0 =C2=A0 =C2=A0new IV can potentially affect branch optimization=
s. =C2=A0*/
>> ++ =C2=A0 if (optimize > 0 && flag_modulo_sched)
>> ++ =C2=A0 {
>> ++ =C2=A0 =C2=A0 rtx s0;
>> ++ =C2=A0 =C2=A0 rtx bcomp;
>> ++ =C2=A0 =C2=A0 rtx loc_ref;
>> ++ =C2=A0 =C2=A0 rtx cc_reg;
>> ++ =C2=A0 =C2=A0 rtx insn;
>> ++ =C2=A0 =C2=A0 rtx cmp;
>> ++
>> ++ =C2=A0 =C2=A0 /* Only use this on innermost loops. =C2=A0*/
>> ++ =C2=A0 =C2=A0 if (INTVAL (operands[3]) > 1)
>> ++ =C2=A0 =C2=A0 =C2=A0 FAIL;
>> ++
>> ++ =C2=A0 =C2=A0 if (GET_MODE (operands[0]) !=3D SImode)
>> ++ =C2=A0 =C2=A0 =C2=A0 FAIL;
>> ++
>> ++ =C2=A0 =C2=A0 s0 =3D operands [0];
>> ++ =C2=A0 =C2=A0 if (TARGET_THUMB2)
>> ++ =C2=A0 =C2=A0 =C2=A0 insn =3D emit_insn (gen_thumb2_addsi3_compare0 (=
s0, s0, GEN_INT (-1)));
>> ++ =C2=A0 =C2=A0 else
>> ++ =C2=A0 =C2=A0 =C2=A0 insn =3D emit_insn (gen_addsi3_compare0 (s0, s0,=
 GEN_INT (-1)));
>> ++
>> ++ =C2=A0 =C2=A0 cmp =3D XVECEXP (PATTERN (insn), 0, 0);
>> ++ =C2=A0 =C2=A0 cc_reg =3D SET_DEST (cmp);
>> ++ =C2=A0 =C2=A0 bcomp =3D gen_rtx_NE (VOIDmode, cc_reg, const0_rtx);
>> ++ =C2=A0 =C2=A0 loc_ref =3D gen_rtx_LABEL_REF (VOIDmode, operands [4]);
>> ++ =C2=A0 =C2=A0 emit_jump_insn (gen_rtx_SET (VOIDmode, pc_rtx,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_rtx_IF_THEN_ELSE (VOID=
mode, bcomp,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loc_ref, pc_rtx)));
>> ++ =C2=A0 =C2=A0 DONE;
>> ++ =C2=A0 }else
>> ++ =C2=A0 =C2=A0 =C2=A0FAIL;
>> ++ }")
>> ++
>> +
>> +=3D=3D=3D modified file 'gcc/ddg.c'
>> +--- old/gcc/ddg.c =C2=A0 =C2=A02010-07-19 08:58:53 +0000
>> ++++ new/gcc/ddg.c =C2=A0 =C2=A02011-03-24 07:45:38 +0000
>> +@@ -60,6 +60,8 @@
>> + static ddg_edge_ptr create_ddg_edge (ddg_node_ptr, ddg_node_ptr, dep_t=
ype,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dep_data_type, int, int);
>> + static void add_edge_to_ddg (ddg_ptr g, ddg_edge_ptr);
>> ++static ddg_node_ptr get_node_of_insn_uid (ddg_ptr, int);
>> ++
>> +
>> + /* Auxiliary variable for mem_read_insn_p/mem_write_insn_p. =C2=A0*/
>> + static bool mem_ref_p;
>> +@@ -450,12 +452,65 @@
>> + =C2=A0 sched_free_deps (head, tail, false);
>> + }
>> +
>> ++/* Given DOLOOP_INSNS which holds the instructions that
>> ++ =C2=A0 belong to the do-loop part; mark closing_branch_deps field in =
ddg G
>> ++ =C2=A0 as TRUE if the do-loop part's instructions are dependent on th=
e other
>> ++ =C2=A0 loop instructions. =C2=A0Otherwise mark it as FALSE. =C2=A0*/
>> ++static void
>> ++check_closing_branch_deps (ddg_ptr g, sbitmap doloop_insns)
>> ++{
>> ++ =C2=A0sbitmap_iterator sbi;
>> ++ =C2=A0unsigned int u =3D 0;
>> ++
>> ++ =C2=A0EXECUTE_IF_SET_IN_SBITMAP (doloop_insns, 0, u, sbi)
>> ++ =C2=A0{
>> ++ =C2=A0 =C2=A0ddg_edge_ptr e;
>> ++ =C2=A0 =C2=A0ddg_node_ptr u_node =3D get_node_of_insn_uid (g, u);
>> ++
>> ++ =C2=A0 =C2=A0gcc_assert (u_node);
>> ++
>> ++ =C2=A0 =C2=A0for (e =3D u_node->in; e !=3D 0; e =3D e->next_in)
>> ++ =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0ddg_node_ptr v_node =3D e->src;
>> ++
>> ++ =C2=A0 =C2=A0if (((unsigned int) INSN_UID (v_node->insn) =3D=3D u)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0|| DEBUG_INSN_P (v_node->insn))
>> ++ =C2=A0 =C2=A0 =C2=A0continue;
>> ++
>> ++ =C2=A0 =C2=A0/* Ignore dependencies between memory writes and the
>> ++ =C2=A0 =C2=A0 =C2=A0 jump. =C2=A0*/
>> ++ =C2=A0 =C2=A0if (JUMP_P (u_node->insn)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&& e->type =3D=3D OUTPUT_DEP
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& mem_write_insn_p (v_node-=
>insn))
>> ++ =C2=A0 =C2=A0 =C2=A0continue;
>> ++ =C2=A0 =C2=A0if (!TEST_BIT (doloop_insns, INSN_UID (v_node->insn)))
>> ++ =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0g->closing_branch_deps =3D 1;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0for (e =3D u_node->out; e !=3D 0; e =3D e->next_out)
>> ++ =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0ddg_node_ptr v_node =3D e->dest;
>> ++
>> ++ =C2=A0 =C2=A0if (((unsigned int) INSN_UID (v_node->insn) =3D=3D u)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| DEBUG_INSN_P (v_node->ins=
n))
>> ++ =C2=A0 =C2=A0 =C2=A0continue;
>> ++ =C2=A0 =C2=A0if (!TEST_BIT (doloop_insns, INSN_UID (v_node->insn)))
>> ++ =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0g->closing_branch_deps =3D 1;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0}
>> ++ =C2=A0g->closing_branch_deps =3D 0;
>> ++}
>> +
>> + /* Given a basic block, create its DDG and return a pointer to a varia=
ble
>> + =C2=A0 =C2=A0of ddg type that represents it.
>> + =C2=A0 =C2=A0Initialize the ddg structure fields to the appropriate va=
lues. =C2=A0*/
>> + ddg_ptr
>> +-create_ddg (basic_block bb, int closing_branch_deps)
>> ++create_ddg (basic_block bb, sbitmap doloop_insns)
>> + {
>> + =C2=A0 ddg_ptr g;
>> + =C2=A0 rtx insn, first_note;
>> +@@ -465,7 +520,6 @@
>> + =C2=A0 g =3D (ddg_ptr) xcalloc (1, sizeof (struct ddg));
>> +
>> + =C2=A0 g->bb =3D bb;
>> +- =C2=A0g->closing_branch_deps =3D closing_branch_deps;
>> +
>> + =C2=A0 /* Count the number of insns in the BB. =C2=A0*/
>> + =C2=A0 for (insn =3D BB_HEAD (bb); insn !=3D NEXT_INSN (BB_END (bb));
>> +@@ -538,6 +592,11 @@
>> + =C2=A0 /* Build the data dependency graph. =C2=A0*/
>> + =C2=A0 build_intra_loop_deps (g);
>> + =C2=A0 build_inter_loop_deps (g);
>> ++
>> ++ =C2=A0/* Check whether the do-loop part is decoupled from the other l=
oop
>> ++ =C2=A0 =C2=A0 instructions. =C2=A0*/
>> ++ =C2=A0check_closing_branch_deps (g, doloop_insns);
>> ++
>> + =C2=A0 return g;
>> + }
>> +
>> +@@ -831,6 +890,18 @@
>> + =C2=A0 return NULL;
>> + }
>> +
>> ++/* Given the uid of an instruction UID return the node that represents=
 it. =C2=A0*/
>> ++static ddg_node_ptr
>> ++get_node_of_insn_uid (ddg_ptr g, int uid)
>> ++{
>> ++ =C2=A0int i;
>> ++
>> ++ =C2=A0for (i =3D 0; i < g->num_nodes; i++)
>> ++ =C2=A0 =C2=A0if (uid =3D=3D INSN_UID (g->nodes[i].insn))
>> ++ =C2=A0 =C2=A0 =C2=A0return &g->nodes[i];
>> ++ =C2=A0return NULL;
>> ++}
>> ++
>> + /* Given a set OPS of nodes in the DDG, find the set of their successo=
rs
>> + =C2=A0 =C2=A0which are not in OPS, and set their bits in SUCC. =C2=A0B=
its corresponding to
>> + =C2=A0 =C2=A0OPS are cleared from SUCC. =C2=A0Leaves the other bits in=
 SUCC unchanged. =C2=A0*/
>> +
>> +=3D=3D=3D modified file 'gcc/ddg.h'
>> +--- old/gcc/ddg.h =C2=A0 =C2=A02009-11-25 10:55:54 +0000
>> ++++ new/gcc/ddg.h =C2=A0 =C2=A02011-03-24 07:45:38 +0000
>> +@@ -167,7 +167,7 @@
>> + };
>> +
>> +
>> +-ddg_ptr create_ddg (basic_block, int closing_branch_deps);
>> ++ddg_ptr create_ddg (basic_block, sbitmap);
>> + void free_ddg (ddg_ptr);
>> +
>> + void print_ddg (FILE *, ddg_ptr);
>> +
>> +=3D=3D=3D modified file 'gcc/loop-doloop.c'
>> +--- old/gcc/loop-doloop.c =C2=A0 =C2=A02010-07-19 08:58:53 +0000
>> ++++ new/gcc/loop-doloop.c =C2=A0 =C2=A02011-03-24 07:45:38 +0000
>> +@@ -78,6 +78,8 @@
>> + =C2=A0 rtx inc_src;
>> + =C2=A0 rtx condition;
>> + =C2=A0 rtx pattern;
>> ++ =C2=A0rtx cc_reg =3D NULL_RTX;
>> ++ =C2=A0rtx reg_orig =3D NULL_RTX;
>> +
>> + =C2=A0 /* The canonical doloop pattern we expect has one of the follow=
ing
>> + =C2=A0 =C2=A0 =C2=A0forms:
>> +@@ -96,7 +98,16 @@
>> + =C2=A0 =C2=A0 =C2=A02) =C2=A0(set (reg) (plus (reg) (const_int -1))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(set (pc) (if_then_else (reg !=3D 0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(label_ref (label))
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pc))). =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pc))).
>> ++
>> ++ =C2=A0 =C2=A0 Some targets (ARM) do the comparison before the branch,=
 as in the
>> ++ =C2=A0 =C2=A0 following form:
>> ++
>> ++ =C2=A0 =C2=A0 3) (parallel [(set (cc) (compare ((plus (reg) (const_in=
t -1), 0)))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (set (=
reg) (plus (reg) (const_int -1)))])
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0(set (pc) (if_then_else (cc =3D=3D NE)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(label_ref (label))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(pc))) */
>> +
>> + =C2=A0 pattern =3D PATTERN (doloop_pat);
>> +
>> +@@ -104,19 +115,47 @@
>> + =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 rtx cond;
>> + =C2=A0 =C2=A0 =C2=A0 rtx prev_insn =3D prev_nondebug_insn (doloop_pat)=
;
>> ++ =C2=A0 =C2=A0 =C2=A0rtx cmp_arg1, cmp_arg2;
>> ++ =C2=A0 =C2=A0 =C2=A0rtx cmp_orig;
>> +
>> +- =C2=A0 =C2=A0 =C2=A0/* We expect the decrement to immediately precede=
 the branch. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0/* In case the pattern is not PARALLEL we expect =
two forms
>> ++ =C2=A0 =C2=A0 of doloop which are cases 2) and 3) above: in case 2) t=
he
>> ++ =C2=A0 =C2=A0 decrement immediately precedes the branch, while in cas=
e 3)
>> ++ =C2=A0 =C2=A0 the compare and decrement instructions immediately prec=
ede
>> ++ =C2=A0 =C2=A0 the branch. =C2=A0*/
>> +
>> + =C2=A0 =C2=A0 =C2=A0 if (prev_insn =3D=3D NULL_RTX || !INSN_P (prev_in=
sn))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 cmp =3D pattern;
>> +- =C2=A0 =C2=A0 =C2=A0inc =3D PATTERN (PREV_INSN (doloop_pat));
>> ++ =C2=A0 =C2=A0 =C2=A0if (GET_CODE (PATTERN (prev_insn)) =3D=3D PARALLE=
L)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0/* The third case: the compare and decrement inst=
ructions
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 immediately precede the branch. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0cmp_orig =3D XVECEXP (PATTERN (prev_insn), 0, 0);
>> ++ =C2=A0 =C2=A0 =C2=A0if (GET_CODE (cmp_orig) !=3D SET)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> ++ =C2=A0 =C2=A0 =C2=A0if (GET_CODE (SET_SRC (cmp_orig)) !=3D COMPARE)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> ++ =C2=A0 =C2=A0 =C2=A0cmp_arg1 =3D XEXP (SET_SRC (cmp_orig), 0);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp_arg2 =3D XEXP (SET_SRC (cmp_ori=
g), 1);
>> ++ =C2=A0 =C2=A0 =C2=A0if (cmp_arg2 !=3D const0_rtx
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| GET_CODE (cmp_arg1) !=3D PLUS)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> ++ =C2=A0 =C2=A0 =C2=A0reg_orig =3D XEXP (cmp_arg1, 0);
>> ++ =C2=A0 =C2=A0 =C2=A0if (XEXP (cmp_arg1, 1) !=3D GEN_INT (-1)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| !REG_P (reg_orig))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> ++ =C2=A0 =C2=A0 =C2=A0cc_reg =3D SET_DEST (cmp_orig);
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0inc =3D XVECEXP (PATTERN (prev_insn), 0, 1);
>> ++ =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0else
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0inc =3D PATTERN (prev_insn);
>> + =C2=A0 =C2=A0 =C2=A0 /* We expect the condition to be of the form (reg=
 !=3D 0) =C2=A0*/
>> + =C2=A0 =C2=A0 =C2=A0 cond =3D XEXP (SET_SRC (cmp), 0);
>> + =C2=A0 =C2=A0 =C2=A0 if (GET_CODE (cond) !=3D NE || XEXP (cond, 1) !=
=3D const0_rtx)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> +-
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 else
>> + =C2=A0 =C2=A0 {
>> +@@ -162,11 +201,15 @@
>> + =C2=A0 =C2=A0 return 0;
>> +
>> + =C2=A0 if ((XEXP (condition, 0) =3D=3D reg)
>> ++ =C2=A0 =C2=A0 =C2=A0/* For the third case: =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0|| ((cc_reg !=3D NULL_RTX)
>> ++ =C2=A0 =C2=A0 =C2=A0&& (XEXP (condition, 0) =3D=3D cc_reg)
>> ++ =C2=A0 =C2=A0 =C2=A0&& (reg_orig =3D=3D reg))
>> + =C2=A0 =C2=A0 =C2=A0 || (GET_CODE (XEXP (condition, 0)) =3D=3D PLUS
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 && XEXP (XEXP (condi=
tion, 0), 0) =3D=3D reg))
>> ++ =C2=A0 =C2=A0 =C2=A0&& XEXP (XEXP (condition, 0), 0) =3D=3D reg))
>> + =C2=A0 =C2=A0{
>> + =C2=A0 =C2=A0 =C2=A0if (GET_CODE (pattern) !=3D PARALLEL)
>> +- =C2=A0 =C2=A0 /* =C2=A0The second form we expect:
>> ++ =C2=A0 =C2=A0 /* =C2=A0For the second form we expect:
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(set (reg) (plus (reg) (const_int -1=
))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(set (pc) (if_then_else (reg !=3D 0)
>> +@@ -181,7 +224,24 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(set (reg) (plus (reg) (const_int -1)))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(additional clobbers and uses)])
>> +
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 So we return that form instead.
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0For the third form we expect:
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0(parallel [(set (cc) (compare ((plus (reg)=
 (const_int -1)), 0))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (set (=
reg) (plus (reg) (const_int -1)))])
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0(set (pc) (if_then_else (cc =3D=3D NE)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(label_ref (label))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(pc)))
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0which is equivalent to the following:
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0(parallel [(set (cc) (compare (reg, =C2=A0=
1))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (set (=
reg) (plus (reg) (const_int -1)))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (set (=
pc) (if_then_else (NE =3D=3D cc)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (label_ref (label))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (pc))))])
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0So we return the second form instead for t=
he two cases.
>> ++
>> + =C2=A0 =C2=A0 =C2=A0*/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 condition =3D gen_rtx_fmt_ee (NE, VOIDmode=
, inc_src, const1_rtx);
>> +
>> +
>> +=3D=3D=3D modified file 'gcc/modulo-sched.c'
>> +--- old/gcc/modulo-sched.c =C2=A0 2009-11-25 10:55:54 +0000
>> ++++ new/gcc/modulo-sched.c =C2=A0 2011-03-24 07:45:38 +0000
>> +@@ -116,8 +116,10 @@
>> +
>> + /* The number of different iterations the nodes in ps span, assuming
>> + =C2=A0 =C2=A0the stage boundaries are placed efficiently. =C2=A0*/
>> +-#define PS_STAGE_COUNT(ps) ((PS_MAX_CYCLE (ps) - PS_MIN_CYCLE (ps) \
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 + 1 + (ps)->ii - 1) / (ps)->ii)
>> ++#define CALC_STAGE_COUNT(min_cycle,max_cycle,ii) ((max_cycle - min_cyc=
le \
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 + 1 + ii - 1) / ii)
>> ++/* The stage count of ps. =C2=A0*/
>> ++#define PS_STAGE_COUNT(ps) (((partial_schedule_ptr)(ps))->stage_count)
>> +
>> + /* A single instruction in the partial schedule. =C2=A0*/
>> + struct ps_insn
>> +@@ -155,6 +157,8 @@
>> + =C2=A0 int max_cycle;
>> +
>> + =C2=A0 ddg_ptr g; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The DDG of the insns i=
n the partial schedule. =C2=A0*/
>> ++
>> ++ =C2=A0int stage_count; =C2=A0/* The stage count of the partial schedu=
le. =C2=A0*/
>> + };
>> +
>> + /* We use this to record all the register replacements we do in
>> +@@ -195,6 +199,7 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtx, rtx);
>> + static void duplicate_insns_of_cycles (partial_schedule_ptr,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int, int, int, rtx);
>> ++static int calculate_stage_count (partial_schedule_ptr ps);
>> +
>> + #define SCHED_ASAP(x) (((node_sched_params_ptr)(x)->aux.info)->asap)
>> + #define SCHED_TIME(x) (((node_sched_params_ptr)(x)->aux.info)->time)
>> +@@ -310,10 +315,10 @@
>> + =C2=A0 =C2=A0 =C2=A0either a single (parallel) branch-on-count or a (n=
on-parallel)
>> + =C2=A0 =C2=A0 =C2=A0branch immediately preceded by a single (decrement=
) insn. =C2=A0*/
>> + =C2=A0 first_insn_not_to_check =3D (GET_CODE (PATTERN (tail)) =3D=3D P=
ARALLEL ? tail
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : PREV_INSN (tail));
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : prev_nondebug_insn (tail));
>> +
>> + =C2=A0 for (insn =3D head; insn !=3D first_insn_not_to_check; insn =3D=
 NEXT_INSN (insn))
>> +- =C2=A0 =C2=A0if (reg_mentioned_p (reg, insn))
>> ++ =C2=A0 =C2=A0if (reg_mentioned_p (reg, insn) && NONDEBUG_INSN_P (insn=
))
>> + =C2=A0 =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dump_file)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> +@@ -332,6 +337,24 @@
>> + #endif
>> + }
>> +
>> ++/* Mark in DOLOOP_INSNS the instructions that belong to the do-loop pa=
rt.
>> ++ =C2=A0Use TAIL to recognize that part. =C2=A0*/
>> ++static void
>> ++mark_doloop_insns (sbitmap doloop_insns, rtx tail)
>> ++{
>> ++ =C2=A0rtx first_insn_not_to_check, insn;
>> ++
>> ++ =C2=A0/* This is the first instruction which belongs the doloop part.=
 =C2=A0*/
>> ++ =C2=A0first_insn_not_to_check =3D (GET_CODE (PATTERN (tail)) =3D=3D P=
ARALLEL ? tail
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 : prev_nondebug_insn (tail));
>> ++
>> ++ =C2=A0sbitmap_zero (doloop_insns);
>> ++ =C2=A0for (insn =3D first_insn_not_to_check; insn !=3D NEXT_INSN (tai=
l);
>> ++ =C2=A0 =C2=A0 =C2=A0 insn =3D NEXT_INSN (insn))
>> ++ =C2=A0 =C2=A0if (NONDEBUG_INSN_P (insn))
>> ++ =C2=A0 =C2=A0 =C2=A0SET_BIT (doloop_insns, INSN_UID (insn));
>> ++}
>> ++
>> + /* Check if COUNT_REG is set to a constant in the PRE_HEADER block, so
>> + =C2=A0 =C2=A0that the number of iterations is a compile-time constant.=
 =C2=A0If so,
>> + =C2=A0 =C2=A0return the rtx that sets COUNT_REG to a constant, and set=
 COUNT to
>> +@@ -569,13 +592,12 @@
>> + =C2=A0 =C2=A0 }
>> + }
>> +
>> +-/* Bump the SCHED_TIMEs of all nodes to start from zero. =C2=A0Set the=
 values
>> +- =C2=A0 of SCHED_ROW and SCHED_STAGE. =C2=A0*/
>> ++/* Bump the SCHED_TIMEs of all nodes by AMOUNT. =C2=A0Set the values o=
f
>> ++ =C2=A0 SCHED_ROW and SCHED_STAGE. =C2=A0*/
>> + static void
>> +-normalize_sched_times (partial_schedule_ptr ps)
>> ++reset_sched_times (partial_schedule_ptr ps, int amount)
>> + {
>> + =C2=A0 int row;
>> +- =C2=A0int amount =3D PS_MIN_CYCLE (ps);
>> + =C2=A0 int ii =3D ps->ii;
>> + =C2=A0 ps_insn_ptr crr_insn;
>> +
>> +@@ -584,6 +606,10 @@
>> + =C2=A0 =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 ddg_node_ptr u =3D crr_insn->node;
>> + =C2=A0 =C2=A0 int normalized_time =3D SCHED_TIME (u) - amount;
>> ++ =C2=A0 =C2=A0int new_min_cycle =3D PS_MIN_CYCLE (ps) - amount;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The first cycle in row zero after the r=
otation. =C2=A0*/
>> ++ =C2=A0 =C2=A0int new_first_cycle_in_row_zero =3D
>> ++ =C2=A0 =C2=A0 =C2=A0new_min_cycle + ii - SMODULO (new_min_cycle, ii);
>> +
>> + =C2=A0 =C2=A0 if (dump_file)
>> + =C2=A0 =C2=A0 =C2=A0 fprintf (dump_file, "crr_insn->node=3D%d, crr_ins=
n->cycle=3D%d,\
>> +@@ -592,8 +618,30 @@
>> + =C2=A0 =C2=A0 gcc_assert (SCHED_TIME (u) >=3D ps->min_cycle);
>> + =C2=A0 =C2=A0 gcc_assert (SCHED_TIME (u) <=3D ps->max_cycle);
>> + =C2=A0 =C2=A0 SCHED_TIME (u) =3D normalized_time;
>> +- =C2=A0 =C2=A0SCHED_ROW (u) =3D normalized_time % ii;
>> +- =C2=A0 =C2=A0SCHED_STAGE (u) =3D normalized_time / ii;
>> ++ =C2=A0 =C2=A0crr_insn->cycle =3D normalized_time;
>> ++ =C2=A0 =C2=A0SCHED_ROW (u) =3D SMODULO (normalized_time, ii);
>> ++
>> ++ =C2=A0 =C2=A0/* If min_cycle is in row zero after the rotation then
>> ++ =C2=A0 =C2=A0 =C2=A0 the stage count can be calculated by dividing th=
e cycle
>> ++ =C2=A0 =C2=A0 =C2=A0 with ii. =C2=A0Otherwise, the calculation is don=
e by dividing the
>> ++ =C2=A0 =C2=A0 =C2=A0 SMSed kernel into two intervals:
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0 1) min_cycle =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <=3D interval 0 < first_cycle_in_row_zero
>> ++ =C2=A0 =C2=A0 =C2=A0 2) first_cycle_in_row_zero <=3D interval 1 < max=
_cycle
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0 Cycles in interval 0 are in stage 0. The stage o=
f cycles
>> ++ =C2=A0 =C2=A0 =C2=A0 in interval 1 should be added by 1 to take inter=
val 0 into
>> ++ =C2=A0 =C2=A0 =C2=A0 account. =C2=A0*/
>> ++ =C2=A0 =C2=A0if (SMODULO (new_min_cycle, ii) =3D=3D 0)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCHED_STAGE (u) =3D normalized_time=
 / ii;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> ++ =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crr_insn->cycle < new_fi=
rst_cycle_in_row_zero)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCHED_STAGE (u) =3D 0;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCHED_STAGE (u) =3D
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((SCHED_TIME (u) - new_first=
_cycle_in_row_zero) / ii) + 1;
>> ++ =C2=A0 =C2=A0 =C2=A0}
>> + =C2=A0 =C2=A0 =C2=A0 }
>> + }
>> +
>> +@@ -646,9 +694,12 @@
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Do not duplicate any insn which refers =
to count_reg as it
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0belongs to the control part.
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If closing_branch_deps is true the=
 closing branch is scheduled
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 as well and thus should be ignored=
.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TODO: This should be done by =
analyzing the control part of
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the loop. =C2=A0*/
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_mentioned_p (count_reg, u_node->in=
sn))
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_mentioned_p (count_reg, u_node->in=
sn)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| JUMP_P (ps_ij->node->insn=
))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;
>> +
>> + =C2=A0 =C2=A0 if (for_prolog)
>> +@@ -894,7 +945,8 @@
>> + =C2=A0 basic_block condition_bb =3D NULL;
>> + =C2=A0 edge latch_edge;
>> + =C2=A0 gcov_type trip_count =3D 0;
>> +-
>> ++ =C2=A0sbitmap doloop_insns;
>> ++
>> + =C2=A0 loop_optimizer_init (LOOPS_HAVE_PREHEADERS
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 LOOPS_HAVE_RECORDED_EXITS);
>> + =C2=A0 if (number_of_loops () <=3D 1)
>> +@@ -919,6 +971,7 @@
>> + =C2=A0 setup_sched_infos ();
>> + =C2=A0 haifa_sched_init ();
>> +
>> ++ =C2=A0doloop_insns =3D sbitmap_alloc (get_max_uid () + 1);
>> + =C2=A0 /* Allocate memory to hold the DDG array one entry for each loo=
p.
>> + =C2=A0 =C2=A0 =C2=A0We use loop->num as index into this array. =C2=A0*=
/
>> + =C2=A0 g_arr =3D XCNEWVEC (ddg_ptr, number_of_loops ());
>> +@@ -1009,9 +1062,11 @@
>> + =C2=A0 =C2=A0 continue;
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +
>> +- =C2=A0 =C2=A0 =C2=A0/* Don't handle BBs with calls or barriers, or !s=
ingle_set insns,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 or auto-increment insns (to avoid creatin=
g invalid reg-moves
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 for the auto-increment insns).
>> ++ =C2=A0 =C2=A0 =C2=A0/* Don't handle BBs with calls or barriers or aut=
o-increment insns
>> ++ =C2=A0 =C2=A0 (to avoid creating invalid reg-moves for the auto-incre=
ment insns),
>> ++ =C2=A0 =C2=A0 or !single_set with the exception of instructions that =
include
>> ++ =C2=A0 =C2=A0 count_reg---these instructions are part of the control =
part
>> ++ =C2=A0 =C2=A0 that do-loop recognizes.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0??? Should handle auto-increment ins=
ns.
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0??? Should handle insns defining sub=
regs. =C2=A0*/
>> + =C2=A0 =C2=A0 =C2=A0for (insn =3D head; insn !=3D NEXT_INSN (tail); in=
sn =3D NEXT_INSN (insn))
>> +@@ -1021,7 +1076,8 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (CALL_P (insn)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || BARRIER_P (insn)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (NONDEBUG_INSN_P (insn) &=
& !JUMP_P (insn)
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& !single_set=
 (insn) && GET_CODE (PATTERN (insn)) !=3D USE)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& !single_set=
 (insn) && GET_CODE (PATTERN (insn)) !=3D USE
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& !reg_mentio=
ned_p (count_reg, insn))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (FIND_REG_INC_NOTE (insn,=
 NULL_RTX) !=3D 0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (INSN_P (insn) && (set =
=3D single_set (insn))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 && GET_CODE (S=
ET_DEST (set)) =3D=3D SUBREG))
>> +@@ -1048,14 +1104,16 @@
>> +
>> + =C2=A0 =C2=A0 =C2=A0 continue;
>> + =C2=A0 =C2=A0 }
>> +-
>> +- =C2=A0 =C2=A0 =C2=A0if (! (g =3D create_ddg (bb, 0)))
>> ++ =C2=A0 =C2=A0 =C2=A0mark_doloop_insns (doloop_insns, tail);
>> ++ =C2=A0 =C2=A0 =C2=A0if (! (g =3D create_ddg (bb, doloop_insns)))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dump_file)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (dump_file, "SMS create_ddg failed=
\n");
>> + =C2=A0 =C2=A0 =C2=A0 continue;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +-
>> ++ =C2=A0 =C2=A0 =C2=A0if (dump_file)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf (dump_file, "SMS closing_branch_de=
ps: %d\n",
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g->closing_br=
anch_deps);
>> + =C2=A0 =C2=A0 =C2=A0 g_arr[loop->num] =3D g;
>> + =C2=A0 =C2=A0 =C2=A0 if (dump_file)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf (dump_file, "...OK\n");
>> +@@ -1157,11 +1215,13 @@
>> +
>> + =C2=A0 =C2=A0 =C2=A0 ps =3D sms_schedule_by_order (g, mii, maxii, node=
_order);
>> +
>> +- =C2=A0 =C2=A0 =C2=A0if (ps){
>> +- =C2=A0 =C2=A0stage_count =3D PS_STAGE_COUNT (ps);
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_assert(stage_count >=3D 1);
>> +- =C2=A0 =C2=A0 =C2=A0}
>> +-
>> ++ =C2=A0 =C2=A0 =C2=A0if (ps)
>> ++ =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0stage_count =3D calculate_stage_count (ps);
>> ++ =C2=A0 =C2=A0 =C2=A0gcc_assert(stage_count >=3D 1);
>> ++ =C2=A0 =C2=A0 =C2=A0PS_STAGE_COUNT(ps) =3D stage_count;
>> ++ =C2=A0 =C2=A0}
>> ++
>> + =C2=A0 =C2=A0 =C2=A0 /* Stage count of 1 means that there is no interl=
eaving between
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iterations, let the scheduling passe=
s do the job. =C2=A0*/
>> + =C2=A0 =C2=A0 =C2=A0 if (stage_count <=3D 1
>> +@@ -1182,17 +1242,7 @@
>> + =C2=A0 =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 struct undo_replace_buff_elem *reg_move_replaces;
>> +-
>> +- =C2=A0 =C2=A0 =C2=A0if (dump_file)
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf (dump_file,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "SMS s=
ucceeded %d %d (with ii, sc)\n", ps->ii,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stage_=
count);
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print_partial_schedule (ps, dump_fi=
le);
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf (dump_file,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "SMS B=
ranch (%d) will later be scheduled at cycle %d.\n",
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g->clo=
sing_branch->cuid, PS_MIN_CYCLE (ps) - 1);
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0int amount;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 /* Set the stage boundaries. =C2=A0If the DDG is =
built with closing_branch_deps,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the closing_branch was scheduled and=
 should appear in the last (ii-1)
>> +@@ -1202,12 +1252,28 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TODO: Revisit the issu=
e of scheduling the insns of the
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0control part relative =
to the branch when the control part
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has more than one insn=
. =C2=A0*/
>> +- =C2=A0 =C2=A0 =C2=A0normalize_sched_times (ps);
>> +- =C2=A0 =C2=A0 =C2=A0rotate_partial_schedule (ps, PS_MIN_CYCLE (ps));
>> ++ =C2=A0 =C2=A0 =C2=A0amount =3D (g->closing_branch_deps)? SCHED_TIME (=
g->closing_branch) + 1:
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0PS_MIN_CYCLE (ps);
>> ++ =C2=A0 =C2=A0 =C2=A0reset_sched_times (ps, amount);
>> ++ =C2=A0 =C2=A0 =C2=A0rotate_partial_schedule (ps, amount);
>> ++
>> + =C2=A0 =C2=A0 =C2=A0 set_columns_for_ps (ps);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 canon_loop (loop);
>> +
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dump_file)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf (dump_file,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "SMS s=
ucceeded %d %d (with ii, sc)\n", ps->ii,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stage_=
count);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print_partial_schedule (ps, dump_fi=
le);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!g->closing_branch_deps)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf (dump_file,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 "SMS Branch (%d) will later be scheduled at \
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 cycle %d.\n",
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 g->closing_branch->cuid, PS_MIN_CYCLE (ps) - 1);
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* case the BCT count is not known =
, Do loop-versioning */
>> + =C2=A0 =C2=A0 =C2=A0 if (count_reg && ! count_init)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> +@@ -1252,6 +1318,7 @@
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 free (g_arr);
>> ++ =C2=A0sbitmap_free (doloop_insns);
>> +
>> + =C2=A0 /* Release scheduler data, needed until now because of DFA. =C2=
=A0*/
>> + =C2=A0 haifa_sched_finish ();
>> +@@ -1759,8 +1826,9 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RESET_BIT (tobe_scheduled, u);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +-
>> +- =C2=A0 =C2=A0 =C2=A0if (JUMP_P (insn)) /* Closing branch handled late=
r. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0/* Closing branch handled later unless closing_br=
anch_deps
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 is true. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0if (JUMP_P (insn) && !g->closing_branch_deps)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RESET_BIT (tobe_scheduled, u);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;
>> +@@ -1893,8 +1961,8 @@
>> + =C2=A0 if (dump_file)
>> + =C2=A0 =C2=A0 fprintf (dump_file, "split_row=3D%d\n", split_row);
>> +
>> +- =C2=A0normalize_sched_times (ps);
>> +- =C2=A0rotate_partial_schedule (ps, ps->min_cycle);
>> ++ =C2=A0reset_sched_times (ps, PS_MIN_CYCLE (ps));
>> ++ =C2=A0rotate_partial_schedule (ps, PS_MIN_CYCLE (ps));
>> +
>> + =C2=A0 rows_new =3D (ps_insn_ptr *) xcalloc (new_ii, sizeof (ps_insn_p=
tr));
>> + =C2=A0 for (row =3D 0; row < split_row; row++)
>> +@@ -2571,6 +2639,7 @@
>> + =C2=A0 ps_insn_ptr next_ps_i;
>> + =C2=A0 ps_insn_ptr first_must_follow =3D NULL;
>> + =C2=A0 ps_insn_ptr last_must_precede =3D NULL;
>> ++ =C2=A0ps_insn_ptr last_in_row =3D NULL;
>> + =C2=A0 int row;
>> +
>> + =C2=A0 if (! ps_i)
>> +@@ -2597,8 +2666,37 @@
>> + =C2=A0 =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last_must_precede =3D next_p=
s_i;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> ++ =C2=A0 =C2=A0 =C2=A0/* The closing branch must be the last in the row=
. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0if (must_precede
>> ++ =C2=A0 =C2=A0 =C2=A0&& TEST_BIT (must_precede, next_ps_i->node->cuid)
>> ++ =C2=A0 =C2=A0 =C2=A0&& JUMP_P (next_ps_i->node->insn))
>> ++ =C2=A0 =C2=A0return false;
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0 last_in_row =3D next_ps_i;
>> + =C2=A0 =C2=A0 }
>> +
>> ++ =C2=A0/* If closing_branch_deps is true we are scheduling the closing
>> ++ =C2=A0 =C2=A0 branch as well. =C2=A0Make sure there is no dependent i=
nstruction after
>> ++ =C2=A0 =C2=A0 it as the branch should be the last instruction. =C2=A0=
*/
>> ++ =C2=A0if (JUMP_P (ps_i->node->insn))
>> ++ =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0if (first_must_follow)
>> ++ =C2=A0 =C2=A0return false;
>> ++ =C2=A0 =C2=A0 =C2=A0if (last_in_row)
>> ++ =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0/* Make the branch the last in the row. =C2=A0New=
 instructions
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 will be inserted at the beginning of the =
row or after the
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 last must_precede instruction thus the br=
anch is guaranteed
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 to remain the last instruction in the row=
. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0last_in_row->next_in_row =3D ps_i;
>> ++ =C2=A0 =C2=A0 =C2=A0ps_i->prev_in_row =3D last_in_row;
>> ++ =C2=A0 =C2=A0 =C2=A0ps_i->next_in_row =3D NULL;
>> ++ =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0else
>> ++ =C2=A0 =C2=A0ps->rows[row] =3D ps_i;
>> ++ =C2=A0 =C2=A0 =C2=A0return true;
>> ++ =C2=A0 =C2=A0}
>> ++
>> + =C2=A0 /* Now insert the node after INSERT_AFTER_PSI. =C2=A0*/
>> +
>> + =C2=A0 if (! last_must_precede)
>> +@@ -2820,6 +2918,54 @@
>> + =C2=A0 return ps_i;
>> + }
>> +
>> ++/* Calculate the stage count of the partial schedule PS. =C2=A0*/
>> ++int
>> ++calculate_stage_count (partial_schedule_ptr ps)
>> ++{
>> ++ =C2=A0int stage_count;
>> ++
>> ++ =C2=A0/* If closing_branch_deps is false then the stage
>> ++ =C2=A0 =C2=A0 boundaries are placed efficiently, meaning that min_cyc=
le will be
>> ++ =C2=A0 =C2=A0 placed at row 0. Otherwise, the closing branch will be =
placed in
>> ++ =C2=A0 =C2=A0 row ii-1. For the later case we assume the final SMSed =
kernel can
>> ++ =C2=A0 =C2=A0 be divided into two intervals. This assumption is used =
for the
>> ++ =C2=A0 =C2=A0 stage count calculation:
>> ++
>> ++ =C2=A0 =C2=A0 1) min_cycle =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <=3D interval 0 < first_cycle_in_row_zero
>> ++ =C2=A0 =C2=A0 2) first_cycle_in_row_zero <=3D interval 1 < max_cycle
>> ++ =C2=A0 */
>> ++ =C2=A0stage_count =3D
>> ++ =C2=A0 =C2=A0CALC_STAGE_COUNT (PS_MIN_CYCLE (ps), PS_MAX_CYCLE (ps), =
ps->ii);
>> ++ =C2=A0if (ps->g->closing_branch_deps)
>> ++ =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0int new_min_cycle;
>> ++ =C2=A0 =C2=A0 =C2=A0int new_min_cycle_row;
>> ++ =C2=A0 =C2=A0 =C2=A0int rotation_amount =3D SCHED_TIME (ps->g->closin=
g_branch) + 1;
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0/* This is the new value of min_cycle after the f=
inal rotation to
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 bring closing branch into row ii-1. =C2=
=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0new_min_cycle =3D PS_MIN_CYCLE (ps) - rotation_am=
ount;
>> ++ =C2=A0 =C2=A0 =C2=A0/* This is the row which the the new min_cycle wi=
ll be placed in. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0new_min_cycle_row =3D SMODULO (new_min_cycle, ps-=
>ii);
>> ++ =C2=A0 =C2=A0 =C2=A0/* If the row of min_cycle is zero then interval =
0 is empty.
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 Otherwise, we need to calculate interval =
1 and add it by one
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 to take interval 0 into account. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0if (new_min_cycle_row !=3D 0)
>> ++ =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0int new_max_cycle, first_cycle_in_row_zero;
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0new_max_cycle =3D PS_MAX_CYCLE (ps) - rotation_am=
ount;
>> ++ =C2=A0 =C2=A0 =C2=A0first_cycle_in_row_zero =3D
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0new_min_cycle + ps->ii - new_min_cycle_row=
;
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0stage_count =3D
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0CALC_STAGE_COUNT (first_cycle_in_row_zero,=
 new_max_cycle,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ps->ii) + 1;
>> ++ =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0}
>> ++ =C2=A0return stage_count;
>> ++}
>> ++
>> + /* Rotate the rows of PS such that insns scheduled at time
>> + =C2=A0 =C2=A0START_CYCLE will appear in row 0. =C2=A0Updates max/min_c=
ycles. =C2=A0*/
>> + void
>> +
>> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-=
r99498.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99498.patch
>> new file mode 100644
>> index 0000000..9c305cc
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.=
patch
>> @@ -0,0 +1,186 @@
>> +2011-02-16 =C2=A0Nathan Sidwell =C2=A0<nathan@codesourcery.com>
>> +
>> + =C2=A0 =C2=A0 Issue #10439
>> + =C2=A0 =C2=A0 gcc/
>> + =C2=A0 =C2=A0 * config/arm/unwind-arm.c (enum __cxa_type_match_result)=
: New.
>> + =C2=A0 =C2=A0 (cxa_type_match): Correct declaration.
>> + =C2=A0 =C2=A0 (__gnu_unwind_pr_common): Reconstruct
>> + =C2=A0 =C2=A0 additional indirection when __cxa_type_match returns
>> + =C2=A0 =C2=A0 succeeded_with_ptr_to_base.
>> +
>> + =C2=A0 =C2=A0 libstdc++/
>> + =C2=A0 =C2=A0 * libsupc++/eh_arm.c (__cxa_type_match): Construct addre=
ss of
>> + =C2=A0 =C2=A0 thrown object here. =C2=A0Return succeded_with_ptr_to_ba=
se for all
>> + =C2=A0 =C2=A0 pointer cases.
>> +
>> +=3D=3D=3D modified file 'gcc/config/arm/unwind-arm.c'
>> +--- old/gcc/config/arm/unwind-arm.c =C2=A02010-08-12 12:39:35 +0000
>> ++++ new/gcc/config/arm/unwind-arm.c =C2=A02011-04-08 10:41:46 +0000
>> +@@ -32,13 +32,18 @@
>> + typedef unsigned char bool;
>> +
>> + typedef struct _ZSt9type_info type_info; /* This names C++ type_info t=
ype */
>> ++enum __cxa_type_match_result
>> ++ =C2=A0{
>> ++ =C2=A0 =C2=A0ctm_failed =3D 0,
>> ++ =C2=A0 =C2=A0ctm_succeeded =3D 1,
>> ++ =C2=A0 =C2=A0ctm_succeeded_with_ptr_to_base =3D 2
>> ++ =C2=A0};
>> +
>> + void __attribute__((weak)) __cxa_call_unexpected(_Unwind_Control_Block=
 *ucbp);
>> + bool __attribute__((weak)) __cxa_begin_cleanup(_Unwind_Control_Block *=
ucbp);
>> +-bool __attribute__((weak)) __cxa_type_match(_Unwind_Control_Block *ucb=
p,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const=
 type_info *rttip,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool =
is_reference,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void =
**matched_object);
>> ++enum __cxa_type_match_result __attribute__((weak)) __cxa_type_match
>> ++ =C2=A0(_Unwind_Control_Block *ucbp, const type_info *rttip,
>> ++ =C2=A0 bool is_reference, void **matched_object);
>> +
>> + _Unwind_Ptr __attribute__((weak))
>> + __gnu_Unwind_Find_exidx (_Unwind_Ptr, int *);
>> +@@ -1107,6 +1112,7 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _uw rtt=
i;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is=
_reference =3D (data[0] & uint32_highbit) !=3D 0;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *m=
atched;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum __=
cxa_type_match_result match_type;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Chec=
k for no-throw areas. =C2=A0*/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dat=
a[1] =3D=3D (_uw) -2)
>> +@@ -1118,17 +1124,31 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
{
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* Match a catch specification. =C2=A0*/
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 rtti =3D _Unwind_decode_target2 ((_uw) &data[1]);
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (!__cxa_type_match (ucbp, (type_info *) rtti,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 is_reference,
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &matched))
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0matched =3D (void *)0;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0match_type =3D __cxa_type_match (ucbp,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (type_info *) rtti,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_reference,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &matched);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
}
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
match_type =3D ctm_succeeded;
>> +
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mat=
ched)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mat=
ch_type)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
{
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ucbp->barrier_cache.sp =3D
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 _Unwind_GetGR (context, R_SP);
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ucbp->barrier_cache.bitpattern[0] =3D (_uw) matched;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0// ctm_succeeded_with_ptr_to_base really
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0// means _c_t_m indirected the pointer
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0// object. =C2=A0We have to reconstruct the
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0// additional pointer layer by using a temporary.
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (match_type =3D=3D ctm_succeeded_with_ptr_to_base)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ucbp->barrier_cache.bitpattern[2]
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (_uw) matched;
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ucbp->barrier_cache.bitpattern[0]
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (_uw) &ucbp->barrier_cache.bitpattern[2];
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0else
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ucbp->barrier_cache.bitpattern[0] =3D (_uw) matched;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ucbp->barrier_cache.bitpattern[1] =3D (_uw) data;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return _URC_HANDLER_FOUND;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
}
>> +
>> +=3D=3D=3D modified file 'libstdc++-v3/libsupc++/eh_arm.cc'
>> +--- old/libstdc++-v3/libsupc++/eh_arm.cc =C2=A0 =C2=A0 2009-04-09 14:00=
:19 +0000
>> ++++ new/libstdc++-v3/libsupc++/eh_arm.cc =C2=A0 =C2=A0 2011-04-08 10:41=
:46 +0000
>> +@@ -30,10 +30,11 @@
>> + using namespace __cxxabiv1;
>> +
>> +
>> +-// Given the thrown type THROW_TYPE, pointer to a variable containing =
a
>> +-// pointer to the exception object THROWN_PTR_P and a type CATCH_TYPE =
to
>> +-// compare against, return whether or not there is a match and if so,
>> +-// update *THROWN_PTR_P.
>> ++// Given the thrown type THROW_TYPE, exception object UE_HEADER and a
>> ++// type CATCH_TYPE to compare against, return whether or not there is
>> ++// a match and if so, update *THROWN_PTR_P to point to either the
>> ++// type-matched object, or in the case of a pointer type, the object
>> ++// pointed to by the pointer.
>> +
>> + extern "C" __cxa_type_match_result
>> + __cxa_type_match(_Unwind_Exception* ue_header,
>> +@@ -41,51 +42,51 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_reference __at=
tribute__((__unused__)),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void** thrown_ptr_p)
>> + {
>> +- =C2=A0bool forced_unwind =3D __is_gxx_forced_unwind_class(ue_header->=
exception_class);
>> +- =C2=A0bool foreign_exception =3D !forced_unwind && !__is_gxx_exceptio=
n_class(ue_header->exception_class);
>> +- =C2=A0bool dependent_exception =3D
>> +- =C2=A0 =C2=A0__is_dependent_exception(ue_header->exception_class);
>> ++ =C2=A0bool forced_unwind
>> ++ =C2=A0 =C2=A0=3D __is_gxx_forced_unwind_class(ue_header->exception_cl=
ass);
>> ++ =C2=A0bool foreign_exception
>> ++ =C2=A0 =C2=A0=3D !forced_unwind && !__is_gxx_exception_class(ue_heade=
r->exception_class);
>> ++ =C2=A0bool dependent_exception
>> ++ =C2=A0 =C2=A0=3D __is_dependent_exception(ue_header->exception_class)=
;
>> + =C2=A0 __cxa_exception* xh =3D __get_exception_header_from_ue(ue_heade=
r);
>> + =C2=A0 __cxa_dependent_exception *dx =3D __get_dependent_exception_fro=
m_ue(ue_header);
>> + =C2=A0 const std::type_info* throw_type;
>> ++ =C2=A0void *thrown_ptr =3D 0;
>> +
>> + =C2=A0 if (forced_unwind)
>> + =C2=A0 =C2=A0 throw_type =3D &typeid(abi::__forced_unwind);
>> + =C2=A0 else if (foreign_exception)
>> + =C2=A0 =C2=A0 throw_type =3D &typeid(abi::__foreign_exception);
>> +- =C2=A0else if (dependent_exception)
>> +- =C2=A0 =C2=A0throw_type =3D __get_exception_header_from_obj
>> +- =C2=A0 =C2=A0 =C2=A0(dx->primaryException)->exceptionType;
>> + =C2=A0 else
>> +- =C2=A0 =C2=A0throw_type =3D xh->exceptionType;
>> +-
>> +- =C2=A0void* thrown_ptr =3D *thrown_ptr_p;
>> ++ =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0if (dependent_exception)
>> ++ =C2=A0 =C2=A0xh =3D __get_exception_header_from_obj (dx->primaryExcep=
tion);
>> ++ =C2=A0 =C2=A0 =C2=A0throw_type =3D xh->exceptionType;
>> ++ =C2=A0 =C2=A0 =C2=A0// We used to require the caller set the target o=
f thrown_ptr_p,
>> ++ =C2=A0 =C2=A0 =C2=A0// but that's incorrect -- the EHABI makes no suc=
h requirement
>> ++ =C2=A0 =C2=A0 =C2=A0// -- and not all callers will set it. =C2=A0Fort=
unately callers that
>> ++ =C2=A0 =C2=A0 =C2=A0// do initialize will always pass us the value we=
 calculate
>> ++ =C2=A0 =C2=A0 =C2=A0// here, so there's no backwards compatibility pr=
oblem.
>> ++ =C2=A0 =C2=A0 =C2=A0thrown_ptr =3D __get_object_from_ue (ue_header);
>> ++ =C2=A0 =C2=A0}
>> ++
>> ++ =C2=A0__cxa_type_match_result result =3D ctm_succeeded;
>> +
>> + =C2=A0 // Pointer types need to adjust the actual pointer, not
>> + =C2=A0 // the pointer to pointer that is the exception object.
>> + =C2=A0 // This also has the effect of passing pointer types
>> + =C2=A0 // "by value" through the __cxa_begin_catch return value.
>> + =C2=A0 if (throw_type->__is_pointer_p())
>> +- =C2=A0 =C2=A0thrown_ptr =3D *(void**) thrown_ptr;
>> ++ =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0thrown_ptr =3D *(void**) thrown_ptr;
>> ++ =C2=A0 =C2=A0 =C2=A0// We need to indicate the indirection to our cal=
ler.
>> ++ =C2=A0 =C2=A0 =C2=A0result =3D ctm_succeeded_with_ptr_to_base;
>> ++ =C2=A0 =C2=A0}
>> +
>> + =C2=A0 if (catch_type->__do_catch(throw_type, &thrown_ptr, 1))
>> + =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 *thrown_ptr_p =3D thrown_ptr;
>> +-
>> +- =C2=A0 =C2=A0 =C2=A0if (typeid(*catch_type) =3D=3D typeid (typeid(voi=
d*)))
>> +- =C2=A0 =C2=A0{
>> +- =C2=A0 =C2=A0 =C2=A0const __pointer_type_info *catch_pointer_type =3D
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0static_cast<const __pointer_type_info *> (=
catch_type);
>> +- =C2=A0 =C2=A0 =C2=A0const __pointer_type_info *throw_pointer_type =3D
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0static_cast<const __pointer_type_info *> (=
throw_type);
>> +-
>> +- =C2=A0 =C2=A0 =C2=A0if (typeid (*catch_pointer_type->__pointee) !=3D =
typeid (void)
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& (*catch_pointer_type->__pointee =
!=3D
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*throw_pointer_type->=
__pointee))
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0return ctm_succeeded_with_ptr_to_base;
>> +- =C2=A0 =C2=A0}
>> +-
>> +- =C2=A0 =C2=A0 =C2=A0return ctm_succeeded;
>> ++ =C2=A0 =C2=A0 =C2=A0return result;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 return ctm_failed;
>> +
>> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-=
r99502.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r=
99502.patch
>> new file mode 100644
>> index 0000000..59bf01c
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.=
patch
>> @@ -0,0 +1,134 @@
>> +2011-04-26 =C2=A0Chung-Lin Tang =C2=A0<cltang@codesourcery.com>
>> +
>> + =C2=A0 =C2=A0 Backport from mainline:
>> +
>> + =C2=A0 =C2=A0 2011-03-21 =C2=A0Chung-Lin Tang =C2=A0<cltang@codesource=
ry.com>
>> +
>> + =C2=A0 =C2=A0 gcc/
>> + =C2=A0 =C2=A0 * simplify-rtx.c (simplify_binary_operation_1): Handle
>> + =C2=A0 =C2=A0 (xor (and A B) C) case when B and C are both constants.
>> +
>> + =C2=A0 =C2=A0 gcc/testsuite/
>> + =C2=A0 =C2=A0 * gcc.target/arm/xor-and.c: New.
>> +
>> + =C2=A0 =C2=A0 2011-03-18 =C2=A0Chung-Lin Tang =C2=A0<cltang@codesource=
ry.com>
>> +
>> + =C2=A0 =C2=A0 gcc/
>> + =C2=A0 =C2=A0 * combine.c (try_combine): Do simplification only call o=
f
>> + =C2=A0 =C2=A0 subst() on i2 even when i1 is present. Update comments.
>> +
>> + =C2=A0 =C2=A0 gcc/testsuite/
>> + =C2=A0 =C2=A0 * gcc.target/arm/unsigned-extend-1.c: New.
>> +
>> +=3D=3D=3D modified file 'gcc/combine.c'
>> +--- old/gcc/combine.c =C2=A0 =C2=A0 =C2=A0 =C2=A02011-01-06 11:02:44 +0=
000
>> ++++ new/gcc/combine.c =C2=A0 =C2=A0 =C2=A0 =C2=A02011-04-14 13:58:12 +0=
000
>> +@@ -2939,7 +2939,7 @@
>> + =C2=A0 =C2=A0 =C2=A0 /* It is possible that the source of I2 or I1 may=
 be performing
>> + =C2=A0 =C2=A0 =C2=A0an unneeded operation, such as a ZERO_EXTEND of so=
mething
>> + =C2=A0 =C2=A0 =C2=A0that is known to have the high part zero. =C2=A0Ha=
ndle that case
>> +- =C2=A0 =C2=A0 by letting subst look at the innermost one of them.
>> ++ =C2=A0 =C2=A0 by letting subst look at the inner insns.
>> +
>> + =C2=A0 =C2=A0 =C2=A0Another way to do this would be to have a function=
 that tries
>> + =C2=A0 =C2=A0 =C2=A0to simplify a single insn instead of merging two o=
r more
>> +@@ -2964,11 +2964,9 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subst_low_luid =3D DF_INSN_LUID (i1=
);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i1src =3D subst (i1src, pc_rtx, pc_=
rtx, 0, 0, 0);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +- =C2=A0 =C2=A0 =C2=A0else
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subst_low_luid =3D DF_INSN_LUID (i2=
);
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2src =3D subst (i2src, pc_rtx, pc_=
rtx, 0, 0, 0);
>> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0subst_low_luid =3D DF_INSN_LUID (i2);
>> ++ =C2=A0 =C2=A0 =C2=A0i2src =3D subst (i2src, pc_rtx, pc_rtx, 0, 0, 0);
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 n_occurrences =3D 0; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* `subst' counts here */
>> +
>> +=3D=3D=3D modified file 'gcc/simplify-rtx.c'
>> +--- old/gcc/simplify-rtx.c =C2=A0 2010-06-25 20:11:56 +0000
>> ++++ new/gcc/simplify-rtx.c =C2=A0 2011-04-14 13:58:12 +0000
>> +@@ -2413,6 +2413,46 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XEXP (op0, 1), mode),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 op1);
>> +
>> ++ =C2=A0 =C2=A0 =C2=A0/* Given (xor (and A B) C), using P^Q =3D=3D (~P&=
Q) | (~Q&P),
>> ++ =C2=A0 =C2=A0 we can transform like this:
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(A&B)^C =3D=3D ~(A&B)&C | ~C=
&(A&B)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D=3D (~A|~B)&C | ~C&(A&B) =C2=A0 =C2=A0* DeMorgan's Law
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D=3D ~A&C | ~B&C | A&(~C&B) =C2=A0* Distribute and re-order
>> ++ =C2=A0 =C2=A0 Attempt a few simplifications when B and C are both con=
stants. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0if (GET_CODE (op0) =3D=3D AND
>> ++ =C2=A0 =C2=A0 =C2=A0&& CONST_INT_P (op1)
>> ++ =C2=A0 =C2=A0 =C2=A0&& CONST_INT_P (XEXP (op0, 1)))
>> ++ =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0rtx a =3D XEXP (op0, 0);
>> ++ =C2=A0 =C2=A0 =C2=A0rtx b =3D XEXP (op0, 1);
>> ++ =C2=A0 =C2=A0 =C2=A0rtx c =3D op1;
>> ++ =C2=A0 =C2=A0 =C2=A0HOST_WIDE_INT bval =3D INTVAL (b);
>> ++ =C2=A0 =C2=A0 =C2=A0HOST_WIDE_INT cval =3D INTVAL (c);
>> ++
>> ++ =C2=A0 =C2=A0 =C2=A0rtx na_c
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D simplify_binary_operation (AND, mode,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 simplify_gen_unary=
 (NOT, mode, a, mode),
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c);
>> ++ =C2=A0 =C2=A0 =C2=A0if ((~cval & bval) =3D=3D 0)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try to simplify ~A&C | ~B&C. =C2=
=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (na_c !=3D NULL_RTX)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return simplify_gen_binary (=
IOR, mode, na_c,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GEN_I=
NT (~bval & cval));
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0else
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If ~A&C is zero, simplify A&(~C&=
B) | ~B&C. =C2=A0*/
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (na_c =3D=3D const0_rtx)
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx a_nc_b =3D simpli=
fy_gen_binary (AND, mode, a,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0GEN_INT (~cval & bval));
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return simplify_gen_b=
inary (IOR, mode, a_nc_b,
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0GEN_INT (~bval & cval));
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> ++ =C2=A0 =C2=A0}
>> ++
>> + =C2=A0 =C2=A0 =C2=A0 /* (xor (comparison foo bar) (const_int 1)) can b=
ecome the reversed
>> + =C2=A0 =C2=A0 =C2=A0comparison if STORE_FLAG_VALUE is 1. =C2=A0*/
>> + =C2=A0 =C2=A0 =C2=A0 if (STORE_FLAG_VALUE =3D=3D 1
>> +
>> +=3D=3D=3D added file 'gcc/testsuite/gcc.target/arm/unsigned-extend-1.c'
>> +--- old/gcc/testsuite/gcc.target/arm/unsigned-extend-1.c =C2=A0 =C2=A0 =
1970-01-01 00:00:00 +0000
>> ++++ new/gcc/testsuite/gcc.target/arm/unsigned-extend-1.c =C2=A0 =C2=A0 =
2011-04-14 13:58:12 +0000
>> +@@ -0,0 +1,9 @@
>> ++/* { dg-do compile } */
>> ++/* { dg-options "-O2 -march=3Darmv6" } */
>> ++
>> ++unsigned char foo (unsigned char c)
>> ++{
>> ++ =C2=A0return (c >=3D '0') && (c <=3D '9');
>> ++}
>> ++
>> ++/* { dg-final { scan-assembler-not "uxtb" } } */
>> +
>> +=3D=3D=3D added file 'gcc/testsuite/gcc.target/arm/xor-and.c'
>> +--- old/gcc/testsuite/gcc.target/arm/xor-and.c =C2=A0 =C2=A0 =C2=A0 197=
0-01-01 00:00:00 +0000
>> ++++ new/gcc/testsuite/gcc.target/arm/xor-and.c =C2=A0 =C2=A0 =C2=A0 201=
1-04-14 13:58:12 +0000
>> +@@ -0,0 +1,14 @@
>> ++/* { dg-do compile } */
>> ++/* { dg-options "-O -march=3Darmv6" } */
>> ++
>> ++unsigned short foo (unsigned short x)
>> ++{
>> ++ =C2=A0x ^=3D 0x4002;
>> ++ =C2=A0x >>=3D 1;
>> ++ =C2=A0x |=3D 0x8000;
>> ++ =C2=A0return x;
>> ++}
>> ++
>> ++/* { dg-final { scan-assembler "orr" } } */
>> ++/* { dg-final { scan-assembler-not "mvn" } } */
>> ++/* { dg-final { scan-assembler-not "uxth" } } */
>> +
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNvGZrMkyGM64RGpERAv04AJ92LZ2gynhBUV08kABLBoimNHiS9ACaAg5x
> Hpm4LXW67kxi/AOcBf93sk8=3D
> =3DlT+g
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


