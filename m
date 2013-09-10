Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 375206101C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 20:44:41 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so4175933ead.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 13:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Wjia0hDDjo7sJUp/59clh5gIm9zpkILvEBVBSAtmukM=;
	b=EvE4SL/PRFe+nt0Vb4a//eMWiLHjAWNP506mLri8IW31IehVFYvv7vPWuqGxkrEF0c
	ZyER+2usBXa5UB8zRJkBp9dGWYCMHIp9nmpH8Gy6EZB/PVCsuYLnr4rq+8riU0XbLOgX
	QRIOcRUrCFiQ1PUdCQcCXtkuDYWT5MpksmH9yVXofZ9vbpsYLNuJocCJliqkqFP3AXJH
	fX/bKkmydKUqQT+SnSH87b2LxTNRirm+LvvXp21iMziBbw2G5Bp6yGbHVUD5QFNUv+nF
	4If9b3GR0jckSo+sFlk4dRikPn8NLAuhe9vS40r9hb4t5uWy+SOCCACy3YLoNUpXAXqG
	RJcA==
X-Received: by 10.14.176.8 with SMTP id a8mr41868561eem.12.1378845882232;
	Tue, 10 Sep 2013 13:44:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm34438894eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Sep 2013 13:44:41 -0700 (PDT)
Date: Tue, 10 Sep 2013 22:46:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130910204607.GW11500@jama>
References: <1378301582-16035-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1378301582-16035-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH v2] qt-creator: update to 2.8.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Sep 2013 20:44:42 -0000
X-Groupsio-MsgNum: 46147
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MrbiU6dcJfOZ616B"
Content-Disposition: inline

--MrbiU6dcJfOZ616B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2013 at 11:33:02PM +1000, Jonathan Liu wrote:
> This also adds patches to fix compilation for ARM.

Thanks merged with 3 other fixes from you.

>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  .../qt-creator/fix.missing.cpuid.h.patch           | 384 +++++++++++++++=
++++++
>  .../qt-creator/qbs_transformer_product.patch       |  93 +++++
>  .../{qt-creator_2.8.0.bb =3D> qt-creator_2.8.1.bb}   |   8 +-
>  3 files changed, 482 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.=
cpuid.h.patch
>  create mode 100644 meta-oe/recipes-qt/qt-creator/qt-creator/qbs_transfor=
mer_product.patch
>  rename meta-oe/recipes-qt/qt-creator/{qt-creator_2.8.0.bb =3D> qt-creato=
r_2.8.1.bb} (78%)
>=20
> diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.cpuid.h=
=2Epatch b/meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.cpuid.h.pat=
ch
> new file mode 100644
> index 0000000..363bee3
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qt-creator/qt-creator/fix.missing.cpuid.h.patch
> @@ -0,0 +1,384 @@
> +From 8be071bbca6a9b8e06a7466d848a2b4b6dbcbc1f Mon Sep 17 00:00:00 2001
> +From: Christian Kandeler <christian.kandeler@digia.com>
> +Date: Fri, 19 Jul 2013 13:40:30 +0200
> +Subject: [PATCH] WIP: Remove x86 assembler code from botan sources.
> +
> +Taken from
> +https://bugreports.qt-project.org/browse/QTCREATORBUG-8107
> +
> +Upstream-Status: Submitted
> +
> +Change-Id: I3780aa4551f563c5f43833ec822e3c1add7012f2
> +---
> + src/libs/3rdparty/botan/botan.cpp | 297 +++----------------------------=
-------
> + src/libs/3rdparty/botan/botan.h   |   4 +-
> + 2 files changed, 18 insertions(+), 283 deletions(-)
> +
> +diff --git a/src/libs/3rdparty/botan/botan.cpp b/src/libs/3rdparty/botan=
/botan.cpp
> +index 917c385..c515750 100644
> +--- a/src/libs/3rdparty/botan/botan.cpp
> ++++ b/src/libs/3rdparty/botan/botan.cpp
> +@@ -1098,35 +1098,31 @@ class Montgomery_Exponentiator : public Modular_=
Exponentiator
> +=20
> + }
> +=20
> +-
> +-#if (BOTAN_MP_WORD_BITS !=3D 32)
> +-   #error The mp_x86_32 module requires that BOTAN_MP_WORD_BITS =3D=3D =
32
> ++#if (BOTAN_MP_WORD_BITS =3D=3D 8)
> ++typedef Botan::u16bit dword;
> ++#elif (BOTAN_MP_WORD_BITS =3D=3D 16)
> ++typedef Botan::u32bit dword;
> ++#elif (BOTAN_MP_WORD_BITS =3D=3D 32)
> ++typedef Botan::u64bit dword;
> ++#elif (BOTAN_MP_WORD_BITS =3D=3D 64)
> ++#error BOTAN_MP_WORD_BITS can be 64 only with assembly support
> ++#else
> ++#error BOTAN_MP_WORD_BITS must be 8, 16, 32, or 64
> + #endif
> +=20
> +-#ifdef Q_OS_UNIX
> ++
> + namespace Botan {
> +=20
> + extern "C" {
> +=20
> + /*
> +-* Helper Macros for x86 Assembly
> +-*/
> +-#define ASM(x) x "\n\t"
> +-
> +-/*
> + * Word Multiply
> + */
> + inline word word_madd2(word a, word b, word* c)
> +    {
> +-   asm(
> +-      ASM("mull %[b]")
> +-      ASM("addl %[c],%[a]")
> +-      ASM("adcl $0,%[carry]")
> +-
> +-      : [a]"=3Da"(a), [b]"=3Drm"(b), [carry]"=3D&d"(*c)
> +-      : "0"(a), "1"(b), [c]"g"(*c) : "cc");
> +-
> +-   return a;
> ++    dword z =3D (dword)a * b + *c;
> ++    *c =3D (word)(z >> BOTAN_MP_WORD_BITS);
> ++    return (word)z;
> +    }
> +=20
> + /*
> +@@ -1134,25 +1130,12 @@ inline word word_madd2(word a, word b, word* c)
> + */
> + inline word word_madd3(word a, word b, word c, word* d)
> +    {
> +-   asm(
> +-      ASM("mull %[b]")
> +-
> +-      ASM("addl %[c],%[a]")
> +-      ASM("adcl $0,%[carry]")
> +-
> +-      ASM("addl %[d],%[a]")
> +-      ASM("adcl $0,%[carry]")
> +-
> +-      : [a]"=3Da"(a), [b]"=3Drm"(b), [carry]"=3D&d"(*d)
> +-      : "0"(a), "1"(b), [c]"g"(c), [d]"g"(*d) : "cc");
> +-
> +-   return a;
> ++    dword z =3D (dword)a * b + c + *d;
> ++    *d =3D (word)(z >> BOTAN_MP_WORD_BITS);
> ++    return (word)z;
> +    }
> +-
> + }
> +-
> + }
> +-#endif
> +=20
> +=20
> +=20
> +@@ -1704,30 +1687,6 @@ void unlock_mem(void* addr, size_t length);
> +=20
> + namespace Botan {
> +=20
> +-extern "C" {
> +-
> +-/*
> +-* Word Multiply/Add
> +-*/
> +-inline word word_madd2(word a, word b, word* c)
> +-   {
> +-   dword z =3D (dword)a * b + *c;
> +-   *c =3D (word)(z >> BOTAN_MP_WORD_BITS);
> +-   return (word)z;
> +-   }
> +-
> +-/*
> +-* Word Multiply/Add
> +-*/
> +-inline word word_madd3(word a, word b, word c, word* d)
> +-   {
> +-   dword z =3D (dword)a * b + c + *d;
> +-   *d =3D (word)(z >> BOTAN_MP_WORD_BITS);
> +-   return (word)z;
> +-   }
> +-
> +-}
> +-
> + /**
> + * Win32 CAPI Entropy Source
> + */
> +@@ -2315,225 +2274,6 @@ namespace Botan {
> +=20
> + extern "C" {
> +=20
> +-#ifdef Q_OS_UNIX
> +-/*
> +-* Helper Macros for x86 Assembly
> +-*/
> +-#ifndef ASM
> +-  #define ASM(x) x "\n\t"
> +-#endif
> +-
> +-#define ADDSUB2_OP(OPERATION, INDEX)                     \
> +-        ASM("movl 4*" #INDEX "(%[y]), %[carry]")         \
> +-        ASM(OPERATION " %[carry], 4*" #INDEX "(%[x])")   \
> +-
> +-#define ADDSUB3_OP(OPERATION, INDEX)                     \
> +-        ASM("movl 4*" #INDEX "(%[x]), %[carry]")         \
> +-        ASM(OPERATION " 4*" #INDEX "(%[y]), %[carry]")   \
> +-        ASM("movl %[carry], 4*" #INDEX "(%[z])")         \
> +-
> +-#define LINMUL_OP(WRITE_TO, INDEX)                       \
> +-        ASM("movl 4*" #INDEX "(%[x]),%%eax")             \
> +-        ASM("mull %[y]")                                 \
> +-        ASM("addl %[carry],%%eax")                       \
> +-        ASM("adcl $0,%%edx")                             \
> +-        ASM("movl %%edx,%[carry]")                       \
> +-        ASM("movl %%eax, 4*" #INDEX "(%[" WRITE_TO "])")
> +-
> +-#define MULADD_OP(IGNORED, INDEX)                        \
> +-        ASM("movl 4*" #INDEX "(%[x]),%%eax")             \
> +-        ASM("mull %[y]")                                 \
> +-        ASM("addl %[carry],%%eax")                       \
> +-        ASM("adcl $0,%%edx")                             \
> +-        ASM("addl 4*" #INDEX "(%[z]),%%eax")             \
> +-        ASM("adcl $0,%%edx")                             \
> +-        ASM("movl %%edx,%[carry]")                       \
> +-        ASM("movl %%eax, 4*" #INDEX " (%[z])")
> +-
> +-#define DO_8_TIMES(MACRO, ARG) \
> +-        MACRO(ARG, 0) \
> +-        MACRO(ARG, 1) \
> +-        MACRO(ARG, 2) \
> +-        MACRO(ARG, 3) \
> +-        MACRO(ARG, 4) \
> +-        MACRO(ARG, 5) \
> +-        MACRO(ARG, 6) \
> +-        MACRO(ARG, 7)
> +-
> +-#define ADD_OR_SUBTRACT(CORE_CODE)     \
> +-        ASM("rorl %[carry]")           \
> +-        CORE_CODE                      \
> +-        ASM("sbbl %[carry],%[carry]")  \
> +-        ASM("negl %[carry]")
> +-
> +-/*
> +-* Word Addition
> +-*/
> +-inline word word_add(word x, word y, word* carry)
> +-   {
> +-   asm(
> +-      ADD_OR_SUBTRACT(ASM("adcl %[y],%[x]"))
> +-      : [x]"=3Dr"(x), [carry]"=3Dr"(*carry)
> +-      : "0"(x), [y]"rm"(y), "1"(*carry)
> +-      : "cc");
> +-   return x;
> +-   }
> +-
> +-/*
> +-* Eight Word Block Addition, Two Argument
> +-*/
> +-inline word word8_add2(word x[8], const word y[8], word carry)
> +-   {
> +-   asm(
> +-      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB2_OP, "adcl"))
> +-      : [carry]"=3Dr"(carry)
> +-      : [x]"r"(x), [y]"r"(y), "0"(carry)
> +-      : "cc", "memory");
> +-   return carry;
> +-   }
> +-
> +-/*
> +-* Eight Word Block Addition, Three Argument
> +-*/
> +-inline word word8_add3(word z[8], const word x[8], const word y[8], wor=
d carry)
> +-   {
> +-   asm(
> +-      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB3_OP, "adcl"))
> +-      : [carry]"=3Dr"(carry)
> +-      : [x]"r"(x), [y]"r"(y), [z]"r"(z), "0"(carry)
> +-      : "cc", "memory");
> +-   return carry;
> +-   }
> +-
> +-/*
> +-* Word Subtraction
> +-*/
> +-inline word word_sub(word x, word y, word* carry)
> +-   {
> +-   asm(
> +-      ADD_OR_SUBTRACT(ASM("sbbl %[y],%[x]"))
> +-      : [x]"=3Dr"(x), [carry]"=3Dr"(*carry)
> +-      : "0"(x), [y]"rm"(y), "1"(*carry)
> +-      : "cc");
> +-   return x;
> +-   }
> +-
> +-/*
> +-* Eight Word Block Subtraction, Two Argument
> +-*/
> +-inline word word8_sub2(word x[8], const word y[8], word carry)
> +-   {
> +-   asm(
> +-      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB2_OP, "sbbl"))
> +-      : [carry]"=3Dr"(carry)
> +-      : [x]"r"(x), [y]"r"(y), "0"(carry)
> +-      : "cc", "memory");
> +-   return carry;
> +-   }
> +-
> +-/*
> +-* Eight Word Block Subtraction, Two Argument
> +-*/
> +-inline word word8_sub2_rev(word x[8], const word y[8], word carry)
> +-   {
> +-   asm(
> +-      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB3_OP, "sbbl"))
> +-      : [carry]"=3Dr"(carry)
> +-      : [x]"r"(y), [y]"r"(x), [z]"r"(x), "0"(carry)
> +-      : "cc", "memory");
> +-   return carry;
> +-   }
> +-
> +-/*
> +-* Eight Word Block Subtraction, Three Argument
> +-*/
> +-inline word word8_sub3(word z[8], const word x[8], const word y[8], wor=
d carry)
> +-   {
> +-   asm(
> +-      ADD_OR_SUBTRACT(DO_8_TIMES(ADDSUB3_OP, "sbbl"))
> +-      : [carry]"=3Dr"(carry)
> +-      : [x]"r"(x), [y]"r"(y), [z]"r"(z), "0"(carry)
> +-      : "cc", "memory");
> +-   return carry;
> +-   }
> +-
> +-/*
> +-* Eight Word Block Linear Multiplication
> +-*/
> +-inline word word8_linmul2(word x[8], word y, word carry)
> +-   {
> +-   asm(
> +-      DO_8_TIMES(LINMUL_OP, "x")
> +-      : [carry]"=3Dr"(carry)
> +-      : [x]"r"(x), [y]"rm"(y), "0"(carry)
> +-      : "cc", "%eax", "%edx");
> +-   return carry;
> +-   }
> +-
> +-/*
> +-* Eight Word Block Linear Multiplication
> +-*/
> +-inline word word8_linmul3(word z[8], const word x[8], word y, word carr=
y)
> +-   {
> +-   asm(
> +-      DO_8_TIMES(LINMUL_OP, "z")
> +-      : [carry]"=3Dr"(carry)
> +-      : [z]"r"(z), [x]"r"(x), [y]"rm"(y), "0"(carry)
> +-      : "cc", "%eax", "%edx");
> +-   return carry;
> +-   }
> +-
> +-/*
> +-* Eight Word Block Multiply/Add
> +-*/
> +-inline word word8_madd3(word z[8], const word x[8], word y, word carry)
> +-   {
> +-   asm(
> +-      DO_8_TIMES(MULADD_OP, "")
> +-      : [carry]"=3Dr"(carry)
> +-      : [z]"r"(z), [x]"r"(x), [y]"rm"(y), "0"(carry)
> +-      : "cc", "%eax", "%edx");
> +-   return carry;
> +-   }
> +-
> +-/*
> +-* Multiply-Add Accumulator
> +-*/
> +-inline void word3_muladd(word* w2, word* w1, word* w0, word x, word y)
> +-   {
> +-   asm(
> +-      ASM("mull %[y]")
> +-
> +-      ASM("addl %[x],%[w0]")
> +-      ASM("adcl %[y],%[w1]")
> +-      ASM("adcl $0,%[w2]")
> +-
> +-      : [w0]"=3Dr"(*w0), [w1]"=3Dr"(*w1), [w2]"=3Dr"(*w2)
> +-      : [x]"a"(x), [y]"d"(y), "0"(*w0), "1"(*w1), "2"(*w2)
> +-      : "cc");
> +-   }
> +-
> +-/*
> +-* Multiply-Add Accumulator
> +-*/
> +-inline void word3_muladd_2(word* w2, word* w1, word* w0, word x, word y)
> +-   {
> +-   asm(
> +-      ASM("mull %[y]")
> +-
> +-      ASM("addl %[x],%[w0]")
> +-      ASM("adcl %[y],%[w1]")
> +-      ASM("adcl $0,%[w2]")
> +-
> +-      ASM("addl %[x],%[w0]")
> +-      ASM("adcl %[y],%[w1]")
> +-      ASM("adcl $0,%[w2]")
> +-
> +-      : [w0]"=3Dr"(*w0), [w1]"=3Dr"(*w1), [w2]"=3Dr"(*w2)
> +-      : [x]"a"(x), [y]"d"(y), "0"(*w0), "1"(*w1), "2"(*w2)
> +-      : "cc");
> +-   }
> +-#else
> + /*
> + * Word Addition
> + */
> +@@ -2718,9 +2458,6 @@ inline void word3_muladd_2(word* w2, word* w1, wor=
d* w0, word a, word b)
> +    *w1 =3D word_add(*w1, b, &carry);
> +    *w2 =3D word_add(*w2, top, &carry);
> +    }
> +-
> +-#endif
> +-
> + }
> +=20
> + }
> +diff --git a/src/libs/3rdparty/botan/botan.h b/src/libs/3rdparty/botan/b=
otan.h
> +index 6a9cbe0..3a66a14 100644
> +--- a/src/libs/3rdparty/botan/botan.h
> ++++ b/src/libs/3rdparty/botan/botan.h
> +@@ -80,9 +80,7 @@
> +   #define BOTAN_GCC_VERSION 0
> + #endif
> +=20
> +-#define BOTAN_TARGET_CPU_IS_LITTLE_ENDIAN
> +-#define BOTAN_TARGET_CPU_IS_X86_FAMILY
> +-#define BOTAN_TARGET_UNALIGNED_MEMORY_ACCESS_OK 1
> ++#define BOTAN_TARGET_UNALIGNED_MEMORY_ACCESS_OK 0
> +=20
> + #if defined(BOTAN_TARGET_CPU_IS_LITTLE_ENDIAN) || \
> +     defined(BOTAN_TARGET_CPU_IS_BIG_ENDIAN)
> +--=20
> +1.8.3.2
> +
> diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator/qbs_transformer_pro=
duct.patch b/meta-oe/recipes-qt/qt-creator/qt-creator/qbs_transformer_produ=
ct.patch
> new file mode 100644
> index 0000000..dea09ae
> --- /dev/null
> +++ b/meta-oe/recipes-qt/qt-creator/qt-creator/qbs_transformer_product.pa=
tch
> @@ -0,0 +1,93 @@
> +From c1c7cb2a5e6220a74f374a301e648479029f8a0e Mon Sep 17 00:00:00 2001
> +From: Joerg Bornemann <joerg.bornemann@digia.com>
> +Date: Mon, 12 Aug 2013 09:27:47 +0200
> +Subject: [PATCH] introduce Transformer::product()
> +
> +Simplifies the calling code.
> +Remove pointless nullpointer check from jscommandexecutor.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> +
> +Change-Id: I867181d2b750f32f04376ce860f5dee6555d3e33
> +Reviewed-by: Christian Kandeler <christian.kandeler@digia.com>
> +---
> + src/lib/buildgraph/jscommandexecutor.cpp      | 5 +----
> + src/lib/buildgraph/processcommandexecutor.cpp | 6 ++----
> + src/lib/buildgraph/transformer.cpp            | 7 +++++++
> + src/lib/buildgraph/transformer.h              | 1 +
> + 4 files changed, 11 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/shared/qbs/src/lib/buildgraph/jscommandexecutor.cpp b/s=
rc/shared/qbs/src/lib/buildgraph/jscommandexecutor.cpp
> +index b7f5b1d..24ffb7e 100644
> +--- a/src/shared/qbs/src/lib/buildgraph/jscommandexecutor.cpp
> ++++ b/src/shared/qbs/src/lib/buildgraph/jscommandexecutor.cpp
> +@@ -79,10 +79,7 @@ public slots:
> +         m_result.errorMessage.clear();
> +         ScriptEngine * const scriptEngine =3D provideScriptEngine();
> +         QScriptValue scope =3D scriptEngine->newObject();
> +-        Artifact *someOutputArtifact =3D *transformer->outputs.begin();
> +-        if (!someOutputArtifact->product.isNull())
> +-            setupScriptEngineForProduct(scriptEngine, someOutputArtifac=
t->product,
> +-                                        transformer->rule, scope);
> ++        setupScriptEngineForProduct(scriptEngine, transformer->product(=
), transformer->rule, scope);
> +         transformer->setupInputs(scriptEngine, scope);
> +         transformer->setupOutputs(scriptEngine, scope);
> +=20
> +diff --git a/src/shared/qbs/src/lib/buildgraph/processcommandexecutor.cp=
p b/src/shared/qbs/src/lib/buildgraph/processcommandexecutor.cpp
> +index 78f77c3..d123fe8 100644
> +--- a/src/shared/qbs/src/lib/buildgraph/processcommandexecutor.cpp
> ++++ b/src/shared/qbs/src/lib/buildgraph/processcommandexecutor.cpp
> +@@ -276,8 +276,7 @@ void ProcessCommandExecutor::removeResponseFile()
> +=20
> + QString ProcessCommandExecutor::findProcessCommandInPath()
> + {
> +-    Artifact * const outputNode =3D *transformer()->outputs.begin();
> +-    const ResolvedProductPtr product =3D outputNode->product;
> ++    const ResolvedProductPtr product =3D transformer()->product();
> +     const ProcessCommand * const cmd =3D processCommand();
> +     QString fullProgramPath =3D product->executablePathCache.value(cmd-=
>program());
> +     if (!fullProgramPath.isEmpty())
> +@@ -309,8 +308,7 @@ QString ProcessCommandExecutor::findProcessCommandIn=
Path()
> +=20
> + QString ProcessCommandExecutor::findProcessCommandBySuffix()
> + {
> +-    Artifact * const outputNode =3D *transformer()->outputs.begin();
> +-    const ResolvedProductPtr product =3D outputNode->product;
> ++    const ResolvedProductPtr product =3D transformer()->product();
> +     const ProcessCommand * const cmd =3D processCommand();
> +     QString fullProgramPath =3D product->executablePathCache.value(cmd-=
>program());
> +     if (!fullProgramPath.isEmpty())
> +diff --git a/src/shared/qbs/src/lib/buildgraph/transformer.cpp b/src/sha=
red/qbs/src/lib/buildgraph/transformer.cpp
> +index ce6baa7..363e08d 100644
> +--- a/src/shared/qbs/src/lib/buildgraph/transformer.cpp
> ++++ b/src/shared/qbs/src/lib/buildgraph/transformer.cpp
> +@@ -85,6 +85,13 @@ QScriptValue Transformer::translateInOutputs(QScriptE=
ngine *scriptEngine, const
> +     return jsTagFiles;
> + }
> +=20
> ++ResolvedProductPtr Transformer::product() const
> ++{
> ++    if (outputs.isEmpty())
> ++        return ResolvedProductPtr();
> ++    return (*outputs.begin())->product;
> ++}
> ++
> + void Transformer::setupInputs(QScriptEngine *scriptEngine, QScriptValue=
 targetScriptValue)
> + {
> +     const QString &defaultModuleName =3D rule->module->name;
> +diff --git a/src/shared/qbs/src/lib/buildgraph/transformer.h b/src/share=
d/qbs/src/lib/buildgraph/transformer.h
> +index c9c88b6..d26c391 100644
> +--- a/src/shared/qbs/src/lib/buildgraph/transformer.h
> ++++ b/src/shared/qbs/src/lib/buildgraph/transformer.h
> +@@ -65,6 +65,7 @@ public:
> +                                            const ArtifactList &artifact=
s,
> +                                            const QString &defaultModule=
Name);
> +=20
> ++    ResolvedProductPtr product() const;
> +     void setupInputs(QScriptEngine *scriptEngine, QScriptValue targetSc=
riptValue);
> +     void setupOutputs(QScriptEngine *scriptEngine, QScriptValue targetS=
criptValue);
> +     void createCommands(const PrepareScriptConstPtr &script,
> +--=20
> +1.8.4
> +
> diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb b/meta-oe/=
recipes-qt/qt-creator/qt-creator_2.8.1.bb
> similarity index 78%
> rename from meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
> rename to meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
> index a95ad5a..3a29c3b 100644
> --- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
> +++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
> @@ -6,9 +6,11 @@ LIC_FILES_CHKSUM =3D "file://LGPL_EXCEPTION.TXT;md5=3Deb=
6c371255e1262c55ae9b652a90b5
>                      file://LICENSE.LGPL;md5=3D243b725d71bb5df4a1e5920b34=
4b86ad"
>  SECTION =3D "qt/app"
> =20
> -SRC_URI =3D "http://download.qt-project.org/official_releases/qtcreator/=
2.8/${PV}/${BP}-src.tar.gz"
> -SRC_URI[md5sum] =3D "5aacdad4491b7dda9758a81384d8da79"
> -SRC_URI[sha256sum] =3D "7ac5d9a36c2f561f74d77378d4eae95a78c7752b323e1df9=
24d6e895e99f45d2"
> +SRC_URI =3D "http://download.qt-project.org/official_releases/qtcreator/=
2.8/${PV}/${BP}-src.tar.gz \
> +           file://fix.missing.cpuid.h.patch \
> +           file://qbs_transformer_product.patch"
> +SRC_URI[md5sum] =3D "79ef6c6ece0c00035ef744c9d6e3bd3b"
> +SRC_URI[sha256sum] =3D "d5ae007a297a4288d0e95fd605edbfb8aee80f6788c7a6cf=
b9cb297f50c364b9"
> =20
>  S =3D "${WORKDIR}/${BP}-src"
> =20
> --=20
> 1.8.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MrbiU6dcJfOZ616B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIvhQ8ACgkQN1Ujt2V2gByFkQCeNuomy6CcIxm0B80ncZen6pcB
f4AAoLqDHF/er5AewFwayo4b0oJpfwA3
=JPrg
-----END PGP SIGNATURE-----

--MrbiU6dcJfOZ616B--
