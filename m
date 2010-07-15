Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OZWKt-0000YJ-HE
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 23:51:25 +0200
Received: by iwn34 with SMTP id 34so1468787iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 14:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=IEU1879ZHvCdDoxScbEgWfrMQ0J+GMvA0FJ3xGs3AGM=;
	b=Ul8pD9o5W4mzfM92e5e/GCUhYNDXd9PMOpBQOlfLFBxyC7TWjihnoLt1zBBUw7I2ye
	OYTurT3D620f3Vuk7k8Oc/m/b7ZHSqFvC5bMkJObz/JfIw6XBiKqEev+W0/dlY9eWb7U
	gKDkn5BZR+qWFDWonmPtO8s+oo29BRRIt1FbI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=cvwmzxEan6Y7l+uiRBX02vXchlV6p4/tv4Tk1aaZi7w/I0eMArhlWvG1gLxj9ejmZz
	ohyVlx3buRpAN63RVycTjxedWbxNXHbptIRQJWGN5Aw6BY4orzeWRAN80XFUCNmHN1vl
	1ZEqyNG2XjwNXGbZZbJa3V5SC00FUDOhU06EQ=
Received: by 10.231.39.196 with SMTP id h4mr19286427ibe.64.1279230676028; Thu, 
	15 Jul 2010 14:51:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.35.8 with HTTP; Thu, 15 Jul 2010 14:50:55 -0700 (PDT)
In-Reply-To: <1279226782-6124-2-git-send-email-fransmeulenbroeks@gmail.com>
References: <1279226782-6124-1-git-send-email-fransmeulenbroeks@gmail.com> 
	<1279226782-6124-2-git-send-email-fransmeulenbroeks@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jul 2010 14:50:55 -0700
Message-ID: <AANLkTim5WhPyc7C5nGFTFYYXvbb7aVy50yWZ-gGj6L4d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] glibc 2.10.1: cleaned up; patches only in local 	dir
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
X-List-Received-Date: Thu, 15 Jul 2010 21:51:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 15, 2010 at 1:46 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> moved all patches to glibc-2.10.1
> removed references to other dirs.
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Please run bitbake -c configure atleast for all recipes you touched.

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
> =A0recipes/glibc/glibc-2.10.1/arm-longlong.patch =A0 =A0 =A0| =A0 58 ++
> =A0.../arm-lowlevellock-include-tls.patch =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
2 +
> =A0recipes/glibc/glibc-2.10.1/arm-memcpy.patch =A0 =A0 =A0 =A0| =A0758 ++=
++++++++++++++++++
> =A0.../glibc/glibc-2.10.1/armv4t-interworking.patch =A0 | =A0 47 ++
> =A0recipes/glibc/glibc-2.10.1/dl-cache-libcmp.patch =A0 | =A0 10 +
> =A0recipes/glibc/glibc-2.10.1/etc/ld.so.conf =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +
> =A0recipes/glibc/glibc-2.10.1/fhs-linux-paths.patch =A0 | =A0 11 +
> =A0recipes/glibc/glibc-2.10.1/generate-supported.mk =A0 | =A0 11 +
> =A0recipes/glibc/glibc-2.10.1/generic-bits_select.h =A0 | =A0 35 +
> =A0recipes/glibc/glibc-2.10.1/generic-bits_time.h =A0 =A0 | =A0 75 ++
> =A0recipes/glibc/glibc-2.10.1/generic-bits_types.h =A0 =A0| =A0200 +++++
> =A0.../glibc/glibc-2.10.1/generic-bits_typesizes.h =A0 =A0| =A0 66 ++
> =A0.../glibc-arm-IO-acquire-lock-fix.diff =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
3 +
> =A0recipes/glibc/glibc-2.10.1/glibc-check_pf.patch =A0 =A0| =A0343 ++++++=
+++
> =A0recipes/glibc/glibc-2.10.1/ldd-unbash.patch =A0 =A0 =A0 =A0| =A0 11 +
> =A0recipes/glibc/glibc-2.10.1/ldsocache-varrun.patch =A0| =A0 18 +
> =A0recipes/glibc/glibc-2.10.1/march-i686.patch =A0 =A0 =A0 =A0| =A0 38 +
> =A0recipes/glibc/glibc-2.10.1/no-z-defs.patch =A0 =A0 =A0 =A0 | =A0 =A09 =
+
> =A0recipes/glibc/glibc-2.10.1/nptl-crosscompile.patch | =A0 26 +
> =A0recipes/glibc/glibc-2.10.1/nscd-init.patch =A0 =A0 =A0 =A0 | =A0 39 +
> =A0recipes/glibc/glibc-2.10.1/powerpc-sqrt-hack.diff =A0| =A0 25 +
> =A0recipes/glibc/glibc_2.10.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A03 -
> =A022 files changed, 1807 insertions(+), 3 deletions(-)
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/arm-longlong.patch
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/arm-lowlevellock-include=
-tls.patch
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/arm-memcpy.patch
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/armv4t-interworking.patc=
h
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/dl-cache-libcmp.patch
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/etc/ld.so.conf
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/fhs-linux-paths.patch
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/generate-supported.mk
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/generic-bits_select.h
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/generic-bits_time.h
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/generic-bits_types.h
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/generic-bits_typesizes.h
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/glibc-arm-IO-acquire-loc=
k-fix.diff
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/glibc-check_pf.patch
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/ldd-unbash.patch
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/ldsocache-varrun.patch
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/march-i686.patch
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/no-z-defs.patch
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/nptl-crosscompile.patch
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/nscd-init.patch
> =A0create mode 100644 recipes/glibc/glibc-2.10.1/powerpc-sqrt-hack.diff
>
> diff --git a/recipes/glibc/glibc-2.10.1/arm-longlong.patch b/recipes/glib=
c/glibc-2.10.1/arm-longlong.patch
> new file mode 100644
> index 0000000..28aca83
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/arm-longlong.patch
> @@ -0,0 +1,58 @@
> +--- glibc-2.4/stdlib/longlong.h.ark =A0 =A02006-03-11 22:49:27.000000000=
 +0100
> ++++ glibc-2.4/stdlib/longlong.h =A0 =A0 =A0 =A02006-03-11 22:55:12.00000=
0000 +0100
> +@@ -206,6 +206,14 @@
> + =A0 =A0 =A0 =A0 =A0 =A0"rI" ((USItype) (bh)), =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0"r" ((USItype) (al)), =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0"rI" ((USItype) (bl)) __CLOBBER_CC)
> ++/* v3m and all higher arches have long multiply support. =A0*/
> ++#if !defined(__ARM_ARCH_2__) && !defined(__ARM_ARCH_3__)
> ++#define umul_ppmm(xh, xl, a, b) \
> ++ =A0__asm__ ("umull %0,%1,%2,%3" : "=3D&r" (xl), "=3D&r" (xh) : "r" (a)=
, "r" (b))
> ++#define UMUL_TIME 5
> ++#define smul_ppmm(xh, xl, a, b) \
> ++ =A0__asm__ ("smull %0,%1,%2,%3" : "=3D&r" (xl), "=3D&r" (xh) : "r" (a)=
, "r" (b))
> ++#else
> + #define umul_ppmm(xh, xl, a, b) \
> + {register USItype __t0, __t1, __t2; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 __asm__ ("%@ Inlined umul_ppmm\n" =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> +@@ -227,7 +235,13 @@
> + =A0 =A0 =A0 =A0 =A0: "r" ((USItype) (a)), =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0"r" ((USItype) (b)) __CLOBBER_CC );}
> + #define UMUL_TIME 20
> ++#endif
> + #define UDIV_TIME 100
> ++#if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || defined(__AR=
M_ARCH_5TE__)
> ++#define count_leading_zeros(COUNT,X) =A0 ((COUNT) =3D __builtin_clz (X)=
)
> ++#define COUNT_LEADING_ZEROS_0 32
> ++#endif
> ++
> + #endif /* __arm__ */
> +
> + #if defined (__hppa) && W_TYPE_SIZE =3D=3D 32
> +--- glibc-2.4/ports/sysdeps/arm/mp_clz_tab.c.ark =A0 =A0 =A0 2006-03-11 =
22:56:43.000000000 +0100
> ++++ glibc-2.4/ports/sysdeps/arm/mp_clz_tab.c =A0 2006-03-11 22:58:19.000=
000000 +0100
> +@@ -0,0 +1,24 @@
> ++/* __clz_tab -- support for longlong.h
> ++ =A0 Copyright (C) 2004 Free Software Foundation, Inc.
> ++ =A0 This file is part of the GNU C Library.
> ++
> ++ =A0 The GNU C Library is free software; you can redistribute it and/or
> ++ =A0 modify it under the terms of the GNU Lesser General Public
> ++ =A0 License as published by the Free Software Foundation; either
> ++ =A0 version 2.1 of the License, or (at your option) any later version.
> ++
> ++ =A0 The GNU C Library is distributed in the hope that it will be usefu=
l,
> ++ =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the GN=
U
> ++ =A0 Lesser General Public License for more details.
> ++
> ++ =A0 You should have received a copy of the GNU Lesser General Public
> ++ =A0 License along with the GNU C Library; if not, write to the Free
> ++ =A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> ++ =A0 02111-1307 USA. =A0*/
> ++
> ++#if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || defined(__AR=
M_ARCH_5TE__)
> ++/* Nothing required. =A0*/
> ++#else
> ++#include <stdlib/mp_clz_tab.c>
> ++#endif
> diff --git a/recipes/glibc/glibc-2.10.1/arm-lowlevellock-include-tls.patc=
h b/recipes/glibc/glibc-2.10.1/arm-lowlevellock-include-tls.patch
> new file mode 100644
> index 0000000..5c8062e
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/arm-lowlevellock-include-tls.patch
> @@ -0,0 +1,12 @@
> +Index: glibc-2.9/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- glibc-2.9.orig/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h=
 =A0 =A0 =A0 2009-06-19 20:54:35.446686910 +0400
> ++++ glibc-2.9/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h =A0 =
=A02009-06-19 20:54:43.774683370 +0400
> +@@ -25,6 +25,7 @@
> + #include <atomic.h>
> + #include <sysdep.h>
> + #include <kernel-features.h>
> ++#include <tls.h>
> +
> + #define FUTEX_WAIT =A0 =A0 =A0 =A0 =A0 =A00
> + #define FUTEX_WAKE =A0 =A0 =A0 =A0 =A0 =A01
> diff --git a/recipes/glibc/glibc-2.10.1/arm-memcpy.patch b/recipes/glibc/=
glibc-2.10.1/arm-memcpy.patch
> new file mode 100644
> index 0000000..bc2b3da
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/arm-memcpy.patch
> @@ -0,0 +1,758 @@
> +--- /dev/null =A02004-02-02 20:32:13.000000000 +0000
> ++++ sysdeps/arm/memmove.S =A0 =A0 =A02004-03-20 18:37:23.000000000 +0000
> +@@ -0,0 +1,251 @@
> ++/*
> ++ * =A0 Optimized memmove implementation for ARM processors
> ++ *
> ++ * =A0 =A0Author: =A0 =A0 =A0 =A0 Nicolas Pitre
> ++ * =A0 =A0Created: =A0 =A0 =A0 =A0Dec 23, 2003
> ++ * =A0 =A0Copyright: =A0 =A0 =A0(C) MontaVista Software, Inc.
> ++ *
> ++ * =A0 This file is free software; you can redistribute it and/or
> ++ * =A0 modify it under the terms of the GNU Lesser General Public
> ++ * =A0 License as published by the Free Software Foundation; either
> ++ * =A0 version 2.1 of the License, or (at your option) any later versio=
n.
> ++ *
> ++ * =A0 This file is distributed in the hope that it will be useful,
> ++ * =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the =
GNU
> ++ * =A0 Lesser General Public License for more details.
> ++ */
> ++
> ++#include <sysdep.h>
> ++
> ++
> ++/*
> ++ * Endian independent macros for shifting bytes within registers.
> ++ */
> ++#ifndef __ARMEB__
> ++#define pull =A0 =A0 =A0 =A0 =A0 =A0lsr
> ++#define push =A0 =A0 =A0 =A0 =A0 =A0lsl
> ++#else
> ++#define pull =A0 =A0 =A0 =A0 =A0 =A0lsl
> ++#define push =A0 =A0 =A0 =A0 =A0 =A0lsr
> ++#endif
> ++
> ++/*
> ++ * Enable data preload for architectures that support it (ARMv5 and abo=
ve)
> ++ */
> ++#if defined(__ARM_ARCH_5__) || \
> ++ =A0 =A0defined(__ARM_ARCH_5T__) || \
> ++ =A0 =A0defined(__ARM_ARCH_5TE__)
> ++#define PLD(code...) =A0code
> ++#else
> ++#define PLD(code...)
> ++#endif
> ++
> ++
> ++/* char * memmove (char *dst, const char *src) */
> ++ENTRY(memmove)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0ip, r0, r1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmphi =A0 r2, ip
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bls =A0 =A0 memcpy(PLT)
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmfd =A0 sp!, {r0, r4, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0add =A0 =A0 r1, r1, r2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0add =A0 =A0 r0, r0, r2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 25f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ands =A0 =A0ip, r0, #3
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #-4] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 )
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bne =A0 =A0 26f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ands =A0 =A0ip, r1, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bne =A0 =A0 27f
> ++
> ++19: =A0 =A0 =A0 =A0 =A0 subs =A0 =A0r2, r2, #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 24f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #8
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 23f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #16
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 22f
> ++
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #-32] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0subs =A0 =A0r2, r2, #96 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmfd =A0 sp!, {r5 - r8}
> ++ =A0 =A0 =A0PLD( =A0 =A0blt =A0 =A0 21f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++
> ++ =A0 =A0 =A0PLD( =A0 =A0@ cache alignment =A0 =A0 =A0 =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0ands =A0 =A0ip, r1, #31 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #-64] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0beq =A0 =A0 20f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0cmp =A0 =A0 r2, ip =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #-96] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0blt =A0 =A0 20f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0cmp =A0 =A0 ip, #16 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0sub =A0 =A0 r2, r2, ip =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0ldmgedb r1!, {r3 - r6} =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0stmgedb r0!, {r3 - r6} =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0beq =A0 =A0 20f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0and =A0 =A0 ip, ip, #15 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0cmp =A0 =A0 ip, #8 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0ldr =A0 =A0 r3, [r1, #-4]! =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0ldrge =A0 r4, [r1, #-4]! =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0ldrgt =A0 r5, [r1, #-4]! =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0str =A0 =A0 r3, [r0, #-4]! =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0strge =A0 r4, [r0, #-4]! =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0strgt =A0 r5, [r0, #-4]! =A0 =A0 =A0 =A0 =A0)
> ++
> ++20: =A0 PLD( =A0 =A0pld =A0 =A0 [r1, #-96] =A0 =A0 =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #-128] =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++21: =A0 =A0 =A0 =A0 =A0 ldmdb =A0 r1!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #32
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmdb =A0 r0!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmdb =A0 r1!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmgedb r0!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmgedb r1!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmgedb r0!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmgedb r1!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subges =A0r2, r2, #32
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmdb =A0 r0!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bge =A0 =A0 20b
> ++ =A0 =A0 =A0PLD( =A0 =A0cmn =A0 =A0 r2, #96 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0bge =A0 =A0 21b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0add =A0 =A0 r2, r2, #96 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tst =A0 =A0 r2, #31
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmfd =A0 sp!, {r5 - r8}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmeqfd sp!, {r0, r4, pc}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tst =A0 =A0 r2, #16
> ++22: =A0 =A0 =A0 =A0 =A0 ldmnedb r1!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmnedb r0!, {r3, r4, ip, lr}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tst =A0 =A0 r2, #8
> ++23: =A0 =A0 =A0 =A0 =A0 ldmnedb r1!, {r3, r4}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmnedb r0!, {r3, r4}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tst =A0 =A0 r2, #4
> ++24: =A0 =A0 =A0 =A0 =A0 ldrne =A0 r3, [r1, #-4]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strne =A0 r3, [r0, #-4]!
> ++
> ++25: =A0 =A0 =A0 =A0 =A0 ands =A0 =A0r2, r2, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmeqfd sp!, {r0, r4, pc}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmp =A0 =A0 r2, #2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrb =A0 =A0r3, [r1, #-1]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrgeb =A0r4, [r1, #-2]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrgtb =A0ip, [r1, #-3]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strb =A0 =A0r3, [r0, #-1]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strgeb =A0r4, [r0, #-2]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strgtb =A0ip, [r0, #-3]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmfd =A0 sp!, {r0, r4, pc}
> ++
> ++26: =A0 =A0 =A0 =A0 =A0 cmp =A0 =A0 ip, #2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrb =A0 =A0r3, [r1, #-1]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrgeb =A0r4, [r1, #-1]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrgtb =A0lr, [r1, #-1]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strb =A0 =A0r3, [r0, #-1]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strgeb =A0r4, [r0, #-1]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strgtb =A0lr, [r0, #-1]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, ip
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 25b
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ands =A0 =A0ip, r1, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0beq =A0 =A0 19b
> ++
> ++27: =A0 =A0 =A0 =A0 =A0 bic =A0 =A0 r1, r1, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmp =A0 =A0 ip, #2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldr =A0 =A0 r3, [r1]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0beq =A0 =A0 35f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 36f
> ++
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0.macro =A0backward_copy_shift push pull
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmp =A0 =A0 r2, #12
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #-4] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 )
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 33f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #28
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmfd =A0 sp!, {r5 - r9}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 31f
> ++
> ++ =A0 =A0 =A0PLD( =A0 =A0subs =A0 =A0r2, r2, #96 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #-32] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0blt =A0 =A0 30f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #-64] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++
> ++ =A0 =A0 =A0PLD( =A0 =A0@ cache alignment =A0 =A0 =A0 =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0ands =A0 =A0ip, r1, #31 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #-96] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0beq =A0 =A0 29f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0cmp =A0 =A0 r2, ip =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #-128] =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0blt =A0 =A0 29f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0sub =A0 =A0 r2, r2, ip =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++28: =A0 PLD( =A0 =A0mov =A0 =A0 r4, r3, push #\push =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0ldr =A0 =A0 r3, [r1, #-4]! =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0subs =A0 =A0ip, ip, #4 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0orr =A0 =A0 r4, r4, r3, pull #\pull )
> ++ =A0 =A0 =A0PLD( =A0 =A0str =A0 =A0 r4, [r0, #-4]! =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0bgt =A0 =A0 28b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++
> ++29: =A0 PLD( =A0 =A0pld =A0 =A0 [r1, #-128] =A0 =A0 =A0 =A0 =A0 =A0 )
> ++30: =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 lr, r3, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmdb =A0 r1!, {r3 - r9, ip}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #32
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 lr, lr, ip, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 ip, ip, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 ip, ip, r9, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r9, r9, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r9, r9, r8, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r8, r8, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r8, r8, r7, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r7, r7, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r7, r7, r6, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r6, r6, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r6, r6, r5, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r5, r5, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r5, r5, r4, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r4, r4, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r4, r4, r3, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmdb =A0 r0!, {r4 - r9, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bge =A0 =A0 29b
> ++ =A0 =A0 =A0PLD( =A0 =A0cmn =A0 =A0 r2, #96 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0bge =A0 =A0 30b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0add =A0 =A0 r2, r2, #96 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmn =A0 =A0 r2, #16
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 32f
> ++31: =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 r7, r3, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmdb =A0 r1!, {r3 - r6}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0sub =A0 =A0 r2, r2, #16
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r7, r7, r6, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r6, r6, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r6, r6, r5, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r5, r5, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r5, r5, r4, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r4, r4, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r4, r4, r3, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmdb =A0 r0!, {r4 - r7}
> ++32: =A0 =A0 =A0 =A0 =A0 adds =A0 =A0r2, r2, #28
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmfd =A0 sp!, {r5 - r9}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 34f
> ++33: =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 r4, r3, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldr =A0 =A0 r3, [r1, #-4]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r4, r4, r3, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0str =A0 =A0 r4, [r0, #-4]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bge =A0 =A0 33b
> ++34:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0.endm
> ++
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0backward_copy_shift =A0 =A0 push=3D8 =A0pul=
l=3D24
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0add =A0 =A0 r1, r1, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0b =A0 =A0 =A0 25b
> ++
> ++35: =A0 =A0 =A0 =A0 =A0 backward_copy_shift =A0 =A0 push=3D16 pull=3D16
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0add =A0 =A0 r1, r1, #2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0b =A0 =A0 =A0 25b
> ++
> ++36: =A0 =A0 =A0 =A0 =A0 backward_copy_shift =A0 =A0 push=3D24 pull=3D8
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0add =A0 =A0 r1, r1, #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0b =A0 =A0 =A0 25b
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0.size =A0 memmove, . - memmove
> ++END(memmove)
> ++libc_hidden_builtin_def (memmove)
> +--- /dev/null =A02004-02-02 20:32:13.000000000 +0000
> ++++ sysdeps/arm/bcopy.S =A0 =A0 =A0 =A02004-03-20 18:37:48.000000000 +00=
00
> +@@ -0,0 +1,255 @@
> ++/*
> ++ * =A0 Optimized memmove implementation for ARM processors
> ++ *
> ++ * =A0 =A0Author: =A0 =A0 =A0 =A0 Nicolas Pitre
> ++ * =A0 =A0Created: =A0 =A0 =A0 =A0Dec 23, 2003
> ++ * =A0 =A0Copyright: =A0 =A0 =A0(C) MontaVista Software, Inc.
> ++ *
> ++ * =A0 This file is free software; you can redistribute it and/or
> ++ * =A0 modify it under the terms of the GNU Lesser General Public
> ++ * =A0 License as published by the Free Software Foundation; either
> ++ * =A0 version 2.1 of the License, or (at your option) any later versio=
n.
> ++ *
> ++ * =A0 This file is distributed in the hope that it will be useful,
> ++ * =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the =
GNU
> ++ * =A0 Lesser General Public License for more details.
> ++ */
> ++
> ++#include <sysdep.h>
> ++
> ++
> ++/*
> ++ * Endian independent macros for shifting bytes within registers.
> ++ */
> ++#ifndef __ARMEB__
> ++#define pull =A0 =A0 =A0 =A0 =A0 =A0lsr
> ++#define push =A0 =A0 =A0 =A0 =A0 =A0lsl
> ++#else
> ++#define pull =A0 =A0 =A0 =A0 =A0 =A0lsl
> ++#define push =A0 =A0 =A0 =A0 =A0 =A0lsr
> ++#endif
> ++
> ++/*
> ++ * Enable data preload for architectures that support it (ARMv5 and abo=
ve)
> ++ */
> ++#if defined(__ARM_ARCH_5__) || \
> ++ =A0 =A0defined(__ARM_ARCH_5T__) || \
> ++ =A0 =A0defined(__ARM_ARCH_5TE__)
> ++#define PLD(code...) =A0code
> ++#else
> ++#define PLD(code...)
> ++#endif
> ++
> ++dst =A0 =A0 =A0 =A0 =A0 .req =A0 =A0r1
> ++src =A0 =A0 =A0 =A0 =A0 .req =A0 =A0r0
> ++
> ++/* void *bcopy (const char *src, char *dst, size_t size) */
> ++ENTRY(bcopy)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0ip, dst, src
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmphi =A0 r2, ip
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0movls =A0 r3, r0
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0movls =A0 r0, r1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0movls =A0 r1, r3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bls =A0 =A0 memcpy(PLT)
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmfd =A0 sp!, {r4, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0add =A0 =A0 src, src, r2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0add =A0 =A0 dst, dst, r2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 25f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ands =A0 =A0ip, dst, #3
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [src, #-4] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bne =A0 =A0 26f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ands =A0 =A0ip, src, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bne =A0 =A0 27f
> ++
> ++19: =A0 =A0 =A0 =A0 =A0 subs =A0 =A0r2, r2, #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 24f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #8
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 23f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #16
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 22f
> ++
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [src, #-32] =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0subs =A0 =A0r2, r2, #96 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmfd =A0 sp!, {r5 - r8}
> ++ =A0 =A0 =A0PLD( =A0 =A0blt =A0 =A0 21f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++
> ++ =A0 =A0 =A0PLD( =A0 =A0@ cache alignment =A0 =A0 =A0 =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0ands =A0 =A0ip, src, #31 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [src, #-64] =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0beq =A0 =A0 20f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0cmp =A0 =A0 r2, ip =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [src, #-96] =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0blt =A0 =A0 20f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0cmp =A0 =A0 ip, #16 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0sub =A0 =A0 r2, r2, ip =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0ldmgedb src!, {r3 - r6} =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0stmgedb dst!, {r3 - r6} =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0beq =A0 =A0 20f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0and =A0 =A0 ip, ip, #15 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0cmp =A0 =A0 ip, #8 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0ldr =A0 =A0 r3, [src, #-4]! =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0ldrge =A0 r4, [src, #-4]! =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0ldrgt =A0 r5, [src, #-4]! =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0str =A0 =A0 r3, [dst, #-4]! =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0strge =A0 r4, [dst, #-4]! =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0strgt =A0 r5, [dst, #-4]! =A0 =A0 =A0 =A0 )
> ++
> ++20: =A0 PLD( =A0 =A0pld =A0 =A0 [src, #-96] =A0 =A0 =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [src, #-128] =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++21: =A0 =A0 =A0 =A0 =A0 ldmdb =A0 src!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #32
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmdb =A0 dst!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmdb =A0 src!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmgedb dst!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmgedb src!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmgedb dst!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmgedb src!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subges =A0r2, r2, #32
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmdb =A0 dst!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bge =A0 =A0 20b
> ++ =A0 =A0 =A0PLD( =A0 =A0cmn =A0 =A0 r2, #96 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0bge =A0 =A0 21b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0add =A0 =A0 r2, r2, #96 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tst =A0 =A0 r2, #31
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmfd =A0 sp!, {r5 - r8}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmeqfd sp!, {r4, pc}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tst =A0 =A0 r2, #16
> ++22: =A0 =A0 =A0 =A0 =A0 ldmnedb src!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmnedb dst!, {r3, r4, ip, lr}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tst =A0 =A0 r2, #8
> ++23: =A0 =A0 =A0 =A0 =A0 ldmnedb src!, {r3, r4}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmnedb dst!, {r3, r4}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tst =A0 =A0 r2, #4
> ++24: =A0 =A0 =A0 =A0 =A0 ldrne =A0 r3, [src, #-4]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strne =A0 r3, [dst, #-4]!
> ++
> ++25: =A0 =A0 =A0 =A0 =A0 ands =A0 =A0r2, r2, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmeqfd sp!, {dst, r4, pc}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmp =A0 =A0 r2, #2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrb =A0 =A0r3, [src, #-1]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrgeb =A0r4, [src, #-2]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrgtb =A0ip, [src, #-3]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strb =A0 =A0r3, [dst, #-1]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strgeb =A0r4, [dst, #-2]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strgtb =A0ip, [dst, #-3]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmfd =A0 sp!, {dst, r4, pc}
> ++
> ++26: =A0 =A0 =A0 =A0 =A0 cmp =A0 =A0 ip, #2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrb =A0 =A0r3, [src, #-1]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrgeb =A0r4, [src, #-1]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrgtb =A0lr, [src, #-1]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strb =A0 =A0r3, [dst, #-1]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strgeb =A0r4, [dst, #-1]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strgtb =A0lr, [dst, #-1]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, ip
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 25b
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ands =A0 =A0ip, src, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0beq =A0 =A0 19b
> ++
> ++27: =A0 =A0 =A0 =A0 =A0 bic =A0 =A0 src, src, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmp =A0 =A0 ip, #2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldr =A0 =A0 r3, [src]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0beq =A0 =A0 35f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 36f
> ++
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0.macro =A0backward_copy_shift push pull
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmp =A0 =A0 r2, #12
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [src, #-4] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 33f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #28
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmfd =A0 sp!, {r5 - r9}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 31f
> ++
> ++ =A0 =A0 =A0PLD( =A0 =A0subs =A0 =A0r2, r2, #96 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [src, #-32] =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0blt =A0 =A0 30f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [src, #-64] =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++
> ++ =A0 =A0 =A0PLD( =A0 =A0@ cache alignment =A0 =A0 =A0 =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0ands =A0 =A0ip, src, #31 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [src, #-96] =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0beq =A0 =A0 29f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0cmp =A0 =A0 r2, ip =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [src, #-128] =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0blt =A0 =A0 29f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0sub =A0 =A0 r2, r2, ip =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++28: =A0 PLD( =A0 =A0mov =A0 =A0 r4, r3, push #\push =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0ldr =A0 =A0 r3, [src, #-4]! =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0subs =A0 =A0ip, ip, #4 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0orr =A0 =A0 r4, r4, r3, pull #\pull )
> ++ =A0 =A0 =A0PLD( =A0 =A0str =A0 =A0 r4, [dst, #-4]! =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0bgt =A0 =A0 28b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++
> ++29: =A0 PLD( =A0 =A0pld =A0 =A0 [src, #-128] =A0 =A0 =A0 =A0 =A0 =A0)
> ++30: =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 lr, r3, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmdb =A0 src!, {r3 - r9, ip}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #32
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 lr, lr, ip, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 ip, ip, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 ip, ip, r9, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r9, r9, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r9, r9, r8, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r8, r8, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r8, r8, r7, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r7, r7, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r7, r7, r6, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r6, r6, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r6, r6, r5, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r5, r5, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r5, r5, r4, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r4, r4, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r4, r4, r3, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmdb =A0 dst!, {r4 - r9, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bge =A0 =A0 29b
> ++ =A0 =A0 =A0PLD( =A0 =A0cmn =A0 =A0 r2, #96 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0bge =A0 =A0 30b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0add =A0 =A0 r2, r2, #96 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmn =A0 =A0 r2, #16
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 32f
> ++31: =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 r7, r3, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmdb =A0 src!, {r3 - r6}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0sub =A0 =A0 r2, r2, #16
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r7, r7, r6, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r6, r6, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r6, r6, r5, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r5, r5, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r5, r5, r4, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r4, r4, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r4, r4, r3, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmdb =A0 dst!, {r4 - r7}
> ++32: =A0 =A0 =A0 =A0 =A0 adds =A0 =A0r2, r2, #28
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmfd =A0 sp!, {r5 - r9}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 34f
> ++33: =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 r4, r3, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldr =A0 =A0 r3, [src, #-4]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r4, r4, r3, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0str =A0 =A0 r4, [dst, #-4]!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bge =A0 =A0 33b
> ++34:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0.endm
> ++
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0backward_copy_shift =A0 =A0 push=3D8 =A0pul=
l=3D24
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0add =A0 =A0 src, src, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0b =A0 =A0 =A0 25b
> ++
> ++35: =A0 =A0 =A0 =A0 =A0 backward_copy_shift =A0 =A0 push=3D16 pull=3D16
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0add =A0 =A0 src, src, #2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0b =A0 =A0 =A0 25b
> ++
> ++36: =A0 =A0 =A0 =A0 =A0 backward_copy_shift =A0 =A0 push=3D24 pull=3D8
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0add =A0 =A0 src, src, #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0b =A0 =A0 =A0 25b
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0.size =A0 bcopy, . - bcopy
> ++END(bcopy)
> +
> +--- /dev/null =A02004-02-02 20:32:13.000000000 +0000
> ++++ sysdeps/arm/memcpy.S =A0 =A0 =A0 2004-05-02 14:33:22.000000000 +0100
> +@@ -0,0 +1,242 @@
> ++/*
> ++ * =A0 Optimized memcpy implementation for ARM processors
> ++ *
> ++ * =A0 =A0Author: =A0 =A0 =A0 =A0 Nicolas Pitre
> ++ * =A0 =A0Created: =A0 =A0 =A0 =A0Dec 23, 2003
> ++ * =A0 =A0Copyright: =A0 =A0 =A0(C) MontaVista Software, Inc.
> ++ *
> ++ * =A0 This file is free software; you can redistribute it and/or
> ++ * =A0 modify it under the terms of the GNU Lesser General Public
> ++ * =A0 License as published by the Free Software Foundation; either
> ++ * =A0 version 2.1 of the License, or (at your option) any later versio=
n.
> ++ *
> ++ * =A0 This file is distributed in the hope that it will be useful,
> ++ * =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the =
GNU
> ++ * =A0 Lesser General Public License for more details.
> ++ */
> ++
> ++#include <sysdep.h>
> ++
> ++
> ++/*
> ++ * Endian independent macros for shifting bytes within registers.
> ++ */
> ++#ifndef __ARMEB__
> ++#define pull =A0 =A0 =A0 =A0 =A0 =A0lsr
> ++#define push =A0 =A0 =A0 =A0 =A0 =A0lsl
> ++#else
> ++#define pull =A0 =A0 =A0 =A0 =A0 =A0lsl
> ++#define push =A0 =A0 =A0 =A0 =A0 =A0lsr
> ++#endif
> ++
> ++/*
> ++ * Enable data preload for architectures that support it (ARMv5 and abo=
ve)
> ++ */
> ++#if defined(__ARM_ARCH_5__) || \
> ++ =A0 =A0defined(__ARM_ARCH_5T__) || \
> ++ =A0 =A0defined(__ARM_ARCH_5TE__)
> ++#define PLD(code...) =A0code
> ++#else
> ++#define PLD(code...)
> ++#endif
> ++
> ++
> ++/* char * memcpy (char *dst, const char *src) */
> ++
> ++ENTRY(memcpy)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmfd =A0 sp!, {r0, r4, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 7f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ands =A0 =A0ip, r0, #3
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #0] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bne =A0 =A0 8f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ands =A0 =A0ip, r1, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bne =A0 =A0 9f
> ++
> ++1: =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 6f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #8
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 5f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #16
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 4f
> ++
> ++ =A0 =A0 =A0PLD( =A0 =A0subs =A0 =A0r2, r2, #65 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmfd =A0 sp!, {r5 - r8}
> ++ =A0 =A0 =A0PLD( =A0 =A0blt =A0 =A0 3f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #32] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 )
> ++
> ++ =A0 =A0 =A0PLD( =A0 =A0@ cache alignment =A0 =A0 =A0 =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0ands =A0 =A0ip, r1, #31 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #64] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0beq =A0 =A0 2f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0rsb =A0 =A0 ip, ip, #32 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0cmp =A0 =A0 r2, ip =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #96] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0blt =A0 =A0 2f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0cmp =A0 =A0 ip, #16 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0sub =A0 =A0 r2, r2, ip =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0ldmgeia r1!, {r3 - r6} =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0stmgeia r0!, {r3 - r6} =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0beq =A0 =A0 2f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0and =A0 =A0 ip, ip, #15 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0cmp =A0 =A0 ip, #8 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0ldr =A0 =A0 r3, [r1], #4 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0ldrge =A0 r4, [r1], #4 =A0 =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0ldrgt =A0 r5, [r1], #4 =A0 =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0str =A0 =A0 r3, [r0], #4 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0strge =A0 r4, [r0], #4 =A0 =A0 =A0 =A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0strgt =A0 r5, [r0], #4 =A0 =A0 =A0 =A0 =A0 =A0)
> ++
> ++2: =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #96] =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++3: =A0 =A0 =A0 =A0 =A0 =A0ldmia =A0 r1!, {r3 - r8, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #32
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmia =A0 r0!, {r3 - r8, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bge =A0 =A0 2b
> ++ =A0 =A0 =A0PLD( =A0 =A0cmn =A0 =A0 r2, #65 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0bge =A0 =A0 3b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0add =A0 =A0 r2, r2, #65 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tst =A0 =A0 r2, #31
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmfd =A0 sp!, {r5 - r8}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmeqfd sp!, {r0, r4, pc}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tst =A0 =A0 r2, #16
> ++4: =A0 =A0 =A0 =A0 =A0 =A0ldmneia r1!, {r3, r4, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmneia r0!, {r3, r4, ip, lr}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tst =A0 =A0 r2, #8
> ++5: =A0 =A0 =A0 =A0 =A0 =A0ldmneia r1!, {r3, r4}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmneia r0!, {r3, r4}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tst =A0 =A0 r2, #4
> ++6: =A0 =A0 =A0 =A0 =A0 =A0ldrne =A0 r3, [r1], #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strne =A0 r3, [r0], #4
> ++
> ++7: =A0 =A0 =A0 =A0 =A0 =A0ands =A0 =A0r2, r2, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmeqfd sp!, {r0, r4, pc}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmp =A0 =A0 r2, #2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrb =A0 =A0r3, [r1], #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrgeb =A0r4, [r1], #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrgtb =A0ip, [r1]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strb =A0 =A0r3, [r0], #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strgeb =A0r4, [r0], #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strgtb =A0ip, [r0]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmfd =A0 sp!, {r0, r4, pc}
> ++
> ++8: =A0 =A0 =A0 =A0 =A0 =A0rsb =A0 =A0 ip, ip, #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmp =A0 =A0 ip, #2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrb =A0 =A0r3, [r1], #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrgeb =A0r4, [r1], #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldrgtb =A0lr, [r1], #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strb =A0 =A0r3, [r0], #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strgeb =A0r4, [r0], #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0strgtb =A0lr, [r0], #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, ip
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 7b
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ands =A0 =A0ip, r1, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0beq =A0 =A0 1b
> ++
> ++9: =A0 =A0 =A0 =A0 =A0 =A0bic =A0 =A0 r1, r1, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmp =A0 =A0 ip, #2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldr =A0 =A0 lr, [r1], #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0beq =A0 =A0 17f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bgt =A0 =A0 18f
> ++
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0.macro =A0forward_copy_shift pull push
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmp =A0 =A0 r2, #12
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #0] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 15f
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #28
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmfd =A0 sp!, {r5 - r9}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 13f
> ++
> ++ =A0 =A0 =A0PLD( =A0 =A0subs =A0 =A0r2, r2, #97 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0blt =A0 =A0 12f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #32] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 )
> ++
> ++ =A0 =A0 =A0PLD( =A0 =A0@ cache alignment =A0 =A0 =A0 =A0 =A0 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0rsb =A0 =A0 ip, r1, #36 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #64] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0ands =A0 =A0ip, ip, #31 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #96] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0beq =A0 =A0 11f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0cmp =A0 =A0 r2, ip =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0pld =A0 =A0 [r1, #128] =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0blt =A0 =A0 11f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0sub =A0 =A0 r2, r2, ip =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++10: =A0 PLD( =A0 =A0mov =A0 =A0 r3, lr, pull #\pull =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0ldr =A0 =A0 lr, [r1], #4 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0subs =A0 =A0ip, ip, #4 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0orr =A0 =A0 r3, r3, lr, push #\push )
> ++ =A0 =A0 =A0PLD( =A0 =A0str =A0 =A0 r3, [r0], #4 =A0 =A0 =A0 =A0 =A0 =
=A0)
> ++ =A0 =A0 =A0PLD( =A0 =A0bgt =A0 =A0 10b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++
> ++11: =A0 PLD( =A0 =A0pld =A0 =A0 [r1, #128] =A0 =A0 =A0 =A0 =A0 =A0 =A0)
> ++12: =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 r3, lr, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmia =A0 r1!, {r4 - r9, ip, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #32
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r3, r3, r4, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r4, r4, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r4, r4, r5, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r5, r5, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r5, r5, r6, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r6, r6, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r6, r6, r7, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r7, r7, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r7, r7, r8, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r8, r8, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r8, r8, r9, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r9, r9, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r9, r9, ip, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 ip, ip, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 ip, ip, lr, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmia =A0 r0!, {r3 - r9, ip}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bge =A0 =A0 11b
> ++ =A0 =A0 =A0PLD( =A0 =A0cmn =A0 =A0 r2, #97 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0bge =A0 =A0 12b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 )
> ++ =A0 =A0 =A0PLD( =A0 =A0add =A0 =A0 r2, r2, #97 =A0 =A0 =A0 =A0 =A0 =A0=
 )
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0cmn =A0 =A0 r2, #16
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 14f
> ++13: =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 r3, lr, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmia =A0 r1!, {r4 - r6, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0sub =A0 =A0 r2, r2, #16
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r3, r3, r4, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r4, r4, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r4, r4, r5, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r5, r5, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r5, r5, r6, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 r6, r6, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r6, r6, lr, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0stmia =A0 r0!, {r3 - r6}
> ++14: =A0 =A0 =A0 =A0 =A0 adds =A0 =A0r2, r2, #28
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmfd =A0 sp!, {r5 - r9}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0blt =A0 =A0 16f
> ++15: =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 r3, lr, pull #\pull
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldr =A0 =A0 lr, [r1], #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0subs =A0 =A0r2, r2, #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 r3, r3, lr, push #\push
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0str =A0 =A0 r3, [r0], #4
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0bge =A0 =A0 15b
> ++16:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0.endm
> ++
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0forward_copy_shift =A0 =A0 =A0pull=3D8 =A0p=
ush=3D24
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0sub =A0 =A0 r1, r1, #3
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0b =A0 =A0 =A0 7b
> ++
> ++17: =A0 =A0 =A0 =A0 =A0 forward_copy_shift =A0 =A0 =A0pull=3D16 push=3D=
16
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0sub =A0 =A0 r1, r1, #2
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0b =A0 =A0 =A0 7b
> ++
> ++18: =A0 =A0 =A0 =A0 =A0 forward_copy_shift =A0 =A0 =A0pull=3D24 push=3D=
8
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0sub =A0 =A0 r1, r1, #1
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0b =A0 =A0 =A0 7b
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0.size =A0 memcpy, . - memcpy
> ++END(memcpy)
> ++libc_hidden_builtin_def (memcpy)
> ++
> diff --git a/recipes/glibc/glibc-2.10.1/armv4t-interworking.patch b/recip=
es/glibc/glibc-2.10.1/armv4t-interworking.patch
> new file mode 100644
> index 0000000..ce91ad6
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/armv4t-interworking.patch
> @@ -0,0 +1,47 @@
> +--- libc/ports/sysdeps/arm/memcpy.S~ =A0 2006-10-31 17:07:54.000000000 +=
0000
> ++++ libc/ports/sysdeps/arm/memcpy.S =A0 =A02008-10-24 11:09:34.000000000=
 +0100
> +@@ -130,7 +130,12 @@
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 strcsb =A0r4, [r0], #1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 strcsb =A0ip, [r0]
> +
> ++#if defined (__ARM_ARCH_4T__) && defined(__THUMB_INTERWORK__)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmfd =A0 sp!, {r0, r4, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bx =A0 =A0 =A0lr
> ++#else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldmfd =A0 sp!, {r0, r4, pc}
> ++#endif
> +
> + 9: =A0 =A0 =A0 =A0 =A0 =A0rsb =A0 =A0 ip, ip, #4
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmp =A0 =A0 ip, #2
> +--- libc/ports/sysdeps/arm/memmove.S~ =A02006-10-31 17:07:54.000000000 +=
0000
> ++++ libc/ports/sysdeps/arm/memmove.S =A0 2008-10-24 11:09:44.000000000 +=
0100
> +@@ -140,7 +140,12 @@
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 strneb =A0r3, [r0, #-1]!
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 strcsb =A0r4, [r0, #-1]!
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 strcsb =A0ip, [r0, #-1]
> ++#if defined (__ARM_ARCH_4T__) && defined (__THUMB_INTERWORK__)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ldmfd =A0 sp!, {r0, r4, lr}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bx =A0 =A0 =A0lr
> ++#else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldmfd =A0 sp!, {r0, r4, pc}
> ++#endif
> +
> + 9: =A0 =A0 =A0 =A0 =A0 =A0cmp =A0 =A0 ip, #2
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldrgtb =A0r3, [r1, #-1]!
> +--- libc/ports/sysdeps/unix/sysv/linux/arm/clone.S~ =A0 =A02005-11-16 19=
:03:42.000000000 +0000
> ++++ libc/ports/sysdeps/unix/sysv/linux/arm/clone.S =A0 =A0 2008-10-24 11=
:11:05.000000000 +0100
> +@@ -96,8 +96,14 @@
> + #endif
> + =A0 =A0 =A0 @ pick the function arg and call address off the stack and =
execute
> + =A0 =A0 =A0 ldr =A0 =A0 r0, [sp, #4]
> ++#if defined(__ARM_ARCH_V4T__) && defined(__THUMB_INTERWORK__)
> ++ =A0 =A0 =A0ldr =A0 =A0 ip, [sp], #8
> ++ =A0 =A0 =A0mov =A0 =A0 lr, pc
> ++ =A0 =A0 =A0 =A0bx =A0 =A0 =A0ip
> ++#else
> + =A0 =A0 =A0 mov =A0 =A0 lr, pc
> + =A0 =A0 =A0 ldr =A0 =A0 pc, [sp], #8
> ++#endif
> +
> + =A0 =A0 =A0 @ and we are done, passing the return value through r0
> + =A0 =A0 =A0 b =A0 =A0 =A0 PLTJMP(_exit)
> diff --git a/recipes/glibc/glibc-2.10.1/dl-cache-libcmp.patch b/recipes/g=
libc/glibc-2.10.1/dl-cache-libcmp.patch
> new file mode 100644
> index 0000000..2fedfa6
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/dl-cache-libcmp.patch
> @@ -0,0 +1,10 @@
> +--- glibc-2.4/elf/Versions.ark 2006-03-11 23:30:09.000000000 +0100
> ++++ glibc-2.4/elf/Versions =A0 =A0 2006-03-11 23:31:44.000000000 +0100
> +@@ -63,5 +63,7 @@
> + =A0 =A0 _dl_debug_state;
> + =A0 =A0 # Pointer protection.
> + =A0 =A0 __pointer_chk_guard;
> ++ =A0 =A0# for ldconfig
> ++ =A0 =A0_dl_cache_libcmp;
> + =A0 }
> + }
> diff --git a/recipes/glibc/glibc-2.10.1/etc/ld.so.conf b/recipes/glibc/gl=
ibc-2.10.1/etc/ld.so.conf
> new file mode 100644
> index 0000000..46e06d3
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/etc/ld.so.conf
> @@ -0,0 +1,2 @@
> +/usr/local/lib
> +
> diff --git a/recipes/glibc/glibc-2.10.1/fhs-linux-paths.patch b/recipes/g=
libc/glibc-2.10.1/fhs-linux-paths.patch
> new file mode 100644
> index 0000000..1f32f6d
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/fhs-linux-paths.patch
> @@ -0,0 +1,11 @@
> +--- glibc-2.1.1/sysdeps/unix/sysv/linux/paths.h~ =A0 =A0 =A0 Thu May 27 =
13:16:33 1999
> ++++ glibc-2.1.1/sysdeps/unix/sysv/linux/paths.h =A0 =A0 =A0 =A0Thu May 2=
7 13:17:55 1999
> +@@ -71,7 +71,7 @@
> + /* Provide trailing slash, since mostly used for building pathnames. */
> + #define =A0 =A0 =A0 _PATH_DEV =A0 =A0 =A0 "/dev/"
> + #define =A0 =A0 =A0 _PATH_TMP =A0 =A0 =A0 "/tmp/"
> +-#define =A0 =A0 =A0 _PATH_VARDB =A0 =A0 "/var/db/"
> ++#define =A0 =A0 =A0 _PATH_VARDB =A0 =A0 "/var/lib/misc/"
> + #define =A0 =A0 =A0 _PATH_VARRUN =A0 =A0"/var/run/"
> + #define =A0 =A0 =A0 _PATH_VARTMP =A0 =A0"/var/tmp/"
> +
> diff --git a/recipes/glibc/glibc-2.10.1/generate-supported.mk b/recipes/g=
libc/glibc-2.10.1/generate-supported.mk
> new file mode 100644
> index 0000000..d2a28c2
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/generate-supported.mk
> @@ -0,0 +1,11 @@
> +#!/usr/bin/make
> +
> +include $(IN)
> +
> +all:
> + =A0 =A0 =A0 rm -f $(OUT)
> + =A0 =A0 =A0 touch $(OUT)
> + =A0 =A0 =A0 for locale in $(SUPPORTED-LOCALES); do \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 [ $$locale =3D true ] && continue; \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo $$locale | sed 's,/, ,' >> $(OUT); \
> + =A0 =A0 =A0 done
> diff --git a/recipes/glibc/glibc-2.10.1/generic-bits_select.h b/recipes/g=
libc/glibc-2.10.1/generic-bits_select.h
> new file mode 100644
> index 0000000..47e7ded
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/generic-bits_select.h
> @@ -0,0 +1,35 @@
> +/* Copyright (C) 1997, 1998, 2001 Free Software Foundation, Inc.
> + =A0 This file is part of the GNU C Library.
> +
> + =A0 The GNU C Library is free software; you can redistribute it and/or
> + =A0 modify it under the terms of the GNU Lesser General Public
> + =A0 License as published by the Free Software Foundation; either
> + =A0 version 2.1 of the License, or (at your option) any later version.
> +
> + =A0 The GNU C Library is distributed in the hope that it will be useful=
,
> + =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> + =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the GNU
> + =A0 Lesser General Public License for more details.
> +
> + =A0 You should have received a copy of the GNU Lesser General Public
> + =A0 License along with the GNU C Library; if not, write to the Free
> + =A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> + =A0 02111-1307 USA. =A0*/
> +
> +#ifndef _SYS_SELECT_H
> +# error "Never use <bits/select.h> directly; include <sys/select.h> inst=
ead."
> +#endif
> +
> +
> +/* We don't use `memset' because this would require a prototype and
> + =A0 the array isn't too big. =A0*/
> +#define __FD_ZERO(s) \
> + =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 \
> + =A0 =A0unsigned int __i; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0fd_set *__arr =3D (s); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0for (__i =3D 0; __i < sizeof (fd_set) / sizeof (__fd_mask); ++__=
i) =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0__FDS_BITS (__arr)[__i] =3D 0; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0} while (0)
> +#define __FD_SET(d, s) =A0 =A0 (__FDS_BITS (s)[__FDELT(d)] |=3D __FDMASK=
(d))
> +#define __FD_CLR(d, s) =A0 =A0 (__FDS_BITS (s)[__FDELT(d)] &=3D ~__FDMAS=
K(d))
> +#define __FD_ISSET(d, s) =A0 ((__FDS_BITS (s)[__FDELT(d)] & __FDMASK(d))=
 !=3D 0)
> diff --git a/recipes/glibc/glibc-2.10.1/generic-bits_time.h b/recipes/gli=
bc/glibc-2.10.1/generic-bits_time.h
> new file mode 100644
> index 0000000..b3184d1
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/generic-bits_time.h
> @@ -0,0 +1,75 @@
> +/* System-dependent timing definitions. =A0Generic version.
> + =A0 Copyright (C) 1996,1997,1999-2002,2003 Free Software Foundation, In=
c.
> + =A0 This file is part of the GNU C Library.
> +
> + =A0 The GNU C Library is free software; you can redistribute it and/or
> + =A0 modify it under the terms of the GNU Lesser General Public
> + =A0 License as published by the Free Software Foundation; either
> + =A0 version 2.1 of the License, or (at your option) any later version.
> +
> + =A0 The GNU C Library is distributed in the hope that it will be useful=
,
> + =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> + =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the GNU
> + =A0 Lesser General Public License for more details.
> +
> + =A0 You should have received a copy of the GNU Lesser General Public
> + =A0 License along with the GNU C Library; if not, write to the Free
> + =A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> + =A0 02111-1307 USA. =A0*/
> +
> +/*
> + * Never include this file directly; use <time.h> instead.
> + */
> +
> +#ifndef __need_timeval
> +# ifndef _BITS_TIME_H
> +# =A0define _BITS_TIME_H 1
> +
> +/* ISO/IEC 9899:1990 7.12.1: <time.h>
> + =A0 The macro `CLOCKS_PER_SEC' is the number per second of the value
> + =A0 returned by the `clock' function. */
> +/* CAE XSH, Issue 4, Version 2: <time.h>
> + =A0 The value of CLOCKS_PER_SEC is required to be 1 million on all
> + =A0 XSI-conformant systems. */
> +# =A0define CLOCKS_PER_SEC =A01000000l
> +
> +# =A0if !defined __STRICT_ANSI__ && !defined __USE_XOPEN2K
> +/* Even though CLOCKS_PER_SEC has such a strange value CLK_TCK
> + =A0 presents the real value for clock ticks per second for the system. =
=A0*/
> +# =A0 include <bits/types.h>
> +extern long int __sysconf (int);
> +# =A0 define CLK_TCK ((__clock_t) __sysconf (2)) /* 2 is _SC_CLK_TCK */
> +# =A0endif
> +
> +# =A0ifdef __USE_POSIX199309
> +/* Identifier for system-wide realtime clock. =A0*/
> +# =A0 define CLOCK_REALTIME =A0 =A0 =A0 =A0 =A0 =A0 =A00
> +/* Monotonic system-wide clock. =A0*/
> +# =A0 define CLOCK_MONOTONIC =A0 =A0 =A0 =A0 =A0 =A0 1
> +/* High-resolution timer from the CPU. =A0*/
> +# =A0 define CLOCK_PROCESS_CPUTIME_ID =A0 =A02
> +/* Thread-specific CPU-time clock. =A0*/
> +# =A0 define CLOCK_THREAD_CPUTIME_ID =A0 =A0 3
> +
> +/* Flag to indicate time is absolute. =A0*/
> +# =A0 define TIMER_ABSTIME =A0 =A0 =A0 =A0 =A0 =A0 =A0 1
> +# =A0endif
> +
> +# endif =A0 =A0 =A0 =A0/* bits/time.h */
> +#endif
> +
> +#ifdef __need_timeval
> +# undef __need_timeval
> +# ifndef _STRUCT_TIMEVAL
> +# =A0define _STRUCT_TIMEVAL =A0 =A0 =A01
> +# =A0include <bits/types.h>
> +
> +/* A time value that is accurate to the nearest
> + =A0 microsecond but also has a range of years. =A0*/
> +struct timeval
> + =A0{
> + =A0 =A0__time_t tv_sec; =A0 =A0 =A0 =A0 =A0 /* Seconds. =A0*/
> + =A0 =A0__suseconds_t tv_usec; =A0 =A0 /* Microseconds. =A0*/
> + =A0};
> +# endif =A0 =A0 =A0 =A0/* struct timeval */
> +#endif /* need timeval */
> diff --git a/recipes/glibc/glibc-2.10.1/generic-bits_types.h b/recipes/gl=
ibc/glibc-2.10.1/generic-bits_types.h
> new file mode 100644
> index 0000000..65c8a9f
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/generic-bits_types.h
> @@ -0,0 +1,200 @@
> +/* bits/types.h -- definitions of __*_t types underlying *_t types.
> + =A0 Copyright (C) 2002, 2003, 2004, 2005 Free Software Foundation, Inc.
> + =A0 This file is part of the GNU C Library.
> +
> + =A0 The GNU C Library is free software; you can redistribute it and/or
> + =A0 modify it under the terms of the GNU Lesser General Public
> + =A0 License as published by the Free Software Foundation; either
> + =A0 version 2.1 of the License, or (at your option) any later version.
> +
> + =A0 The GNU C Library is distributed in the hope that it will be useful=
,
> + =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> + =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the GNU
> + =A0 Lesser General Public License for more details.
> +
> + =A0 You should have received a copy of the GNU Lesser General Public
> + =A0 License along with the GNU C Library; if not, write to the Free
> + =A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> + =A0 02111-1307 USA. =A0*/
> +
> +/*
> + * Never include this file directly; use <sys/types.h> instead.
> + */
> +
> +#ifndef =A0 =A0 =A0 =A0_BITS_TYPES_H
> +#define =A0 =A0 =A0 =A0_BITS_TYPES_H =A0 1
> +
> +#include <features.h>
> +#include <bits/wordsize.h>
> +
> +#define __need_size_t
> +#include <stddef.h>
> +
> +/* Convenience types. =A0*/
> +typedef unsigned char __u_char;
> +typedef unsigned short int __u_short;
> +typedef unsigned int __u_int;
> +typedef unsigned long int __u_long;
> +
> +/* Fixed-size types, underlying types depend on word size and compiler. =
=A0*/
> +typedef signed char __int8_t;
> +typedef unsigned char __uint8_t;
> +typedef signed short int __int16_t;
> +typedef unsigned short int __uint16_t;
> +typedef signed int __int32_t;
> +typedef unsigned int __uint32_t;
> +#if __WORDSIZE =3D=3D 64
> +typedef signed long int __int64_t;
> +typedef unsigned long int __uint64_t;
> +#elif defined __GLIBC_HAVE_LONG_LONG
> +__extension__ typedef signed long long int __int64_t;
> +__extension__ typedef unsigned long long int __uint64_t;
> +#endif
> +
> +/* quad_t is also 64 bits. =A0*/
> +#if __WORDSIZE =3D=3D 64
> +typedef long int __quad_t;
> +typedef unsigned long int __u_quad_t;
> +#elif defined __GLIBC_HAVE_LONG_LONG
> +__extension__ typedef long long int __quad_t;
> +__extension__ typedef unsigned long long int __u_quad_t;
> +#else
> +typedef struct
> +{
> + =A0long __val[2];
> +} __quad_t;
> +typedef struct
> +{
> + =A0__u_long __val[2];
> +} __u_quad_t;
> +#endif
> +
> +
> +/* The machine-dependent file <bits/typesizes.h> defines __*_T_TYPE
> + =A0 macros for each of the OS types we define below. =A0The definitions
> + =A0 of those macros must use the following macros for underlying types.
> + =A0 We define __S<SIZE>_TYPE and __U<SIZE>_TYPE for the signed and unsi=
gned
> + =A0 variants of each of the following integer types on this machine.
> +
> + =A0 =A0 =A0 16 =A0 =A0 =A0 =A0 =A0 =A0 =A0-- "natural" 16-bit type (alw=
ays short)
> + =A0 =A0 =A0 32 =A0 =A0 =A0 =A0 =A0 =A0 =A0-- "natural" 32-bit type (alw=
ays int)
> + =A0 =A0 =A0 64 =A0 =A0 =A0 =A0 =A0 =A0 =A0-- "natural" 64-bit type (lon=
g or long long)
> + =A0 =A0 =A0 LONG32 =A0 =A0 =A0 =A0 =A0-- 32-bit type, traditionally lon=
g
> + =A0 =A0 =A0 QUAD =A0 =A0 =A0 =A0 =A0 =A0-- 64-bit type, always long lon=
g
> + =A0 =A0 =A0 WORD =A0 =A0 =A0 =A0 =A0 =A0-- natural type of __WORDSIZE b=
its (int or long)
> + =A0 =A0 =A0 LONGWORD =A0 =A0 =A0 =A0-- type of __WORDSIZE bits, traditi=
onally long
> +
> + =A0 We distinguish WORD/LONGWORD, 32/LONG32, and 64/QUAD so that the
> + =A0 conventional uses of `long' or `long long' type modifiers match the
> + =A0 types we define, even when a less-adorned type would be the same si=
ze.
> + =A0 This matters for (somewhat) portably writing printf/scanf formats f=
or
> + =A0 these types, where using the appropriate l or ll format modifiers c=
an
> + =A0 make the typedefs and the formats match up across all GNU platforms=
. =A0If
> + =A0 we used `long' when it's 64 bits where `long long' is expected, the=
n the
> + =A0 compiler would warn about the formats not matching the argument typ=
es,
> + =A0 and the programmer changing them to shut up the compiler would brea=
k the
> + =A0 program's portability.
> +
> + =A0 Here we assume what is presently the case in all the GCC configurat=
ions
> + =A0 we support: long long is always 64 bits, long is always word/addres=
s size,
> + =A0 and int is always 32 bits. =A0*/
> +
> +#define =A0 =A0 =A0 =A0__S16_TYPE =A0 =A0 =A0 =A0 =A0 =A0 =A0short int
> +#define __U16_TYPE =A0 =A0 =A0 =A0 =A0 =A0 unsigned short int
> +#define =A0 =A0 =A0 =A0__S32_TYPE =A0 =A0 =A0 =A0 =A0 =A0 =A0int
> +#define __U32_TYPE =A0 =A0 =A0 =A0 =A0 =A0 unsigned int
> +#define __SLONGWORD_TYPE =A0 =A0 =A0 long int
> +#define __ULONGWORD_TYPE =A0 =A0 =A0 unsigned long int
> +#if __WORDSIZE =3D=3D 32
> +# define __SQUAD_TYPE =A0 =A0 =A0 =A0 =A0__quad_t
> +# define __UQUAD_TYPE =A0 =A0 =A0 =A0 =A0__u_quad_t
> +# define __SWORD_TYPE =A0 =A0 =A0 =A0 =A0int
> +# define __UWORD_TYPE =A0 =A0 =A0 =A0 =A0unsigned int
> +# define __SLONG32_TYPE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0long int
> +# define __ULONG32_TYPE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long int
> +# define __S64_TYPE =A0 =A0 =A0 =A0 =A0 =A0__quad_t
> +# define __U64_TYPE =A0 =A0 =A0 =A0 =A0 =A0__u_quad_t
> +/* We want __extension__ before typedef's that use nonstandard base type=
s
> + =A0 such as `long long' in C89 mode. =A0*/
> +# define __STD_TYPE =A0 =A0 =A0 =A0 =A0 =A0__extension__ typedef
> +#elif __WORDSIZE =3D=3D 64
> +# define __SQUAD_TYPE =A0 =A0 =A0 =A0 =A0long int
> +# define __UQUAD_TYPE =A0 =A0 =A0 =A0 =A0unsigned long int
> +# define __SWORD_TYPE =A0 =A0 =A0 =A0 =A0long int
> +# define __UWORD_TYPE =A0 =A0 =A0 =A0 =A0unsigned long int
> +# define __SLONG32_TYPE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int
> +# define __ULONG32_TYPE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int
> +# define __S64_TYPE =A0 =A0 =A0 =A0 =A0 =A0long int
> +# define __U64_TYPE =A0 =A0 =A0 =A0 =A0 =A0unsigned long int
> +/* No need to mark the typedef with __extension__. =A0 */
> +# define __STD_TYPE =A0 =A0 =A0 =A0 =A0 =A0typedef
> +#else
> +# error
> +#endif
> +#include <bits/typesizes.h> =A0 =A0/* Defines __*_T_TYPE macros. =A0*/
> +
> +
> +__STD_TYPE __DEV_T_TYPE __dev_t; =A0 =A0 =A0 /* Type of device numbers. =
=A0*/
> +__STD_TYPE __UID_T_TYPE __uid_t; =A0 =A0 =A0 /* Type of user identificat=
ions. =A0*/
> +__STD_TYPE __GID_T_TYPE __gid_t; =A0 =A0 =A0 /* Type of group identifica=
tions. =A0*/
> +__STD_TYPE __INO_T_TYPE __ino_t; =A0 =A0 =A0 /* Type of file serial numb=
ers. =A0*/
> +__STD_TYPE __INO64_T_TYPE __ino64_t; =A0 /* Type of file serial numbers =
(LFS).*/
> +__STD_TYPE __MODE_T_TYPE __mode_t; =A0 =A0 /* Type of file attribute bit=
masks. =A0*/
> +__STD_TYPE __NLINK_T_TYPE __nlink_t; =A0 /* Type of file link counts. =
=A0*/
> +__STD_TYPE __OFF_T_TYPE __off_t; =A0 =A0 =A0 /* Type of file sizes and o=
ffsets. =A0*/
> +__STD_TYPE __OFF64_T_TYPE __off64_t; =A0 /* Type of file sizes and offse=
ts (LFS). =A0*/
> +__STD_TYPE __PID_T_TYPE __pid_t; =A0 =A0 =A0 /* Type of process identifi=
cations. =A0*/
> +__STD_TYPE __FSID_T_TYPE __fsid_t; =A0 =A0 /* Type of file system IDs. =
=A0*/
> +__STD_TYPE __CLOCK_T_TYPE __clock_t; =A0 /* Type of CPU usage counts. =
=A0*/
> +__STD_TYPE __RLIM_T_TYPE __rlim_t; =A0 =A0 /* Type for resource measurem=
ent. =A0*/
> +__STD_TYPE __RLIM64_T_TYPE __rlim64_t; /* Type for resource measurement =
(LFS). =A0*/
> +__STD_TYPE __ID_T_TYPE __id_t; =A0 =A0 =A0 =A0 /* General type for IDs. =
=A0*/
> +__STD_TYPE __TIME_T_TYPE __time_t; =A0 =A0 /* Seconds since the Epoch. =
=A0*/
> +__STD_TYPE __USECONDS_T_TYPE __useconds_t; /* Count of microseconds. =A0=
*/
> +__STD_TYPE __SUSECONDS_T_TYPE __suseconds_t; /* Signed count of microsec=
onds. =A0*/
> +
> +__STD_TYPE __DADDR_T_TYPE __daddr_t; =A0 /* The type of a disk address. =
=A0*/
> +__STD_TYPE __SWBLK_T_TYPE __swblk_t; =A0 /* Type of a swap block maybe? =
=A0*/
> +__STD_TYPE __KEY_T_TYPE __key_t; =A0 =A0 =A0 /* Type of an IPC key. =A0*=
/
> +
> +/* Clock ID used in clock and timer functions. =A0*/
> +__STD_TYPE __CLOCKID_T_TYPE __clockid_t;
> +
> +/* Timer ID returned by `timer_create'. =A0*/
> +__STD_TYPE __TIMER_T_TYPE __timer_t;
> +
> +/* Type to represent block size. =A0*/
> +__STD_TYPE __BLKSIZE_T_TYPE __blksize_t;
> +
> +/* Types from the Large File Support interface. =A0*/
> +
> +/* Type to count number of disk blocks. =A0*/
> +__STD_TYPE __BLKCNT_T_TYPE __blkcnt_t;
> +__STD_TYPE __BLKCNT64_T_TYPE __blkcnt64_t;
> +
> +/* Type to count file system blocks. =A0*/
> +__STD_TYPE __FSBLKCNT_T_TYPE __fsblkcnt_t;
> +__STD_TYPE __FSBLKCNT64_T_TYPE __fsblkcnt64_t;
> +
> +/* Type to count file system nodes. =A0*/
> +__STD_TYPE __FSFILCNT_T_TYPE __fsfilcnt_t;
> +__STD_TYPE __FSFILCNT64_T_TYPE __fsfilcnt64_t;
> +
> +__STD_TYPE __SSIZE_T_TYPE __ssize_t; /* Type of a byte count, or error. =
=A0*/
> +
> +/* These few don't really vary by system, they always correspond
> + =A0 to one of the other defined types. =A0*/
> +typedef __off64_t __loff_t; =A0 =A0/* Type of file sizes and offsets (LF=
S). =A0*/
> +typedef __quad_t *__qaddr_t;
> +typedef char *__caddr_t;
> +
> +/* Duplicates info from stdint.h but this is used in unistd.h. =A0*/
> +__STD_TYPE __SWORD_TYPE __intptr_t;
> +
> +/* Duplicate info from sys/socket.h. =A0*/
> +__STD_TYPE __U32_TYPE __socklen_t;
> +
> +
> +#undef __STD_TYPE
> +
> +#endif /* bits/types.h */
> diff --git a/recipes/glibc/glibc-2.10.1/generic-bits_typesizes.h b/recipe=
s/glibc/glibc-2.10.1/generic-bits_typesizes.h
> new file mode 100644
> index 0000000..e9226c4
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/generic-bits_typesizes.h
> @@ -0,0 +1,66 @@
> +/* bits/typesizes.h -- underlying types for *_t. =A0Generic version.
> + =A0 Copyright (C) 2002, 2003 Free Software Foundation, Inc.
> + =A0 This file is part of the GNU C Library.
> +
> + =A0 The GNU C Library is free software; you can redistribute it and/or
> + =A0 modify it under the terms of the GNU Lesser General Public
> + =A0 License as published by the Free Software Foundation; either
> + =A0 version 2.1 of the License, or (at your option) any later version.
> +
> + =A0 The GNU C Library is distributed in the hope that it will be useful=
,
> + =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> + =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the GNU
> + =A0 Lesser General Public License for more details.
> +
> + =A0 You should have received a copy of the GNU Lesser General Public
> + =A0 License along with the GNU C Library; if not, write to the Free
> + =A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> + =A0 02111-1307 USA. =A0*/
> +
> +#ifndef _BITS_TYPES_H
> +# error "Never include <bits/typesizes.h> directly; use <sys/types.h> in=
stead."
> +#endif
> +
> +#ifndef =A0 =A0 =A0 =A0_BITS_TYPESIZES_H
> +#define =A0 =A0 =A0 =A0_BITS_TYPESIZES_H =A0 =A0 =A0 1
> +
> +/* See <bits/types.h> for the meaning of these macros. =A0This file exis=
ts so
> + =A0 that <bits/types.h> need not vary across different GNU platforms. =
=A0*/
> +
> +#define __DEV_T_TYPE =A0 =A0 =A0 =A0 =A0 __UQUAD_TYPE
> +#define __UID_T_TYPE =A0 =A0 =A0 =A0 =A0 __U32_TYPE
> +#define __GID_T_TYPE =A0 =A0 =A0 =A0 =A0 __U32_TYPE
> +#define __INO_T_TYPE =A0 =A0 =A0 =A0 =A0 __ULONGWORD_TYPE
> +#define __INO64_T_TYPE =A0 =A0 =A0 =A0 __UQUAD_TYPE
> +#define __MODE_T_TYPE =A0 =A0 =A0 =A0 =A0__U32_TYPE
> +#define __NLINK_T_TYPE =A0 =A0 =A0 =A0 __UWORD_TYPE
> +#define __OFF_T_TYPE =A0 =A0 =A0 =A0 =A0 __SLONGWORD_TYPE
> +#define __OFF64_T_TYPE =A0 =A0 =A0 =A0 __SQUAD_TYPE
> +#define __PID_T_TYPE =A0 =A0 =A0 =A0 =A0 __S32_TYPE
> +#define __RLIM_T_TYPE =A0 =A0 =A0 =A0 =A0__ULONGWORD_TYPE
> +#define __RLIM64_T_TYPE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__UQUAD_TYPE
> +#define =A0 =A0 =A0 =A0__BLKCNT_T_TYPE =A0 =A0 =A0 =A0 __SLONGWORD_TYPE
> +#define =A0 =A0 =A0 =A0__BLKCNT64_T_TYPE =A0 =A0 =A0 __SQUAD_TYPE
> +#define =A0 =A0 =A0 =A0__FSBLKCNT_T_TYPE =A0 =A0 =A0 __ULONGWORD_TYPE
> +#define =A0 =A0 =A0 =A0__FSBLKCNT64_T_TYPE =A0 =A0 __UQUAD_TYPE
> +#define =A0 =A0 =A0 =A0__FSFILCNT_T_TYPE =A0 =A0 =A0 __ULONGWORD_TYPE
> +#define =A0 =A0 =A0 =A0__FSFILCNT64_T_TYPE =A0 =A0 __UQUAD_TYPE
> +#define =A0 =A0 =A0 =A0__ID_T_TYPE =A0 =A0 =A0 =A0 =A0 =A0 __U32_TYPE
> +#define __CLOCK_T_TYPE =A0 =A0 =A0 =A0 __SLONGWORD_TYPE
> +#define __TIME_T_TYPE =A0 =A0 =A0 =A0 =A0__SLONGWORD_TYPE
> +#define __USECONDS_T_TYPE =A0 =A0 =A0__U32_TYPE
> +#define __SUSECONDS_T_TYPE =A0 =A0 __SLONGWORD_TYPE
> +#define __DADDR_T_TYPE =A0 =A0 =A0 =A0 __S32_TYPE
> +#define __SWBLK_T_TYPE =A0 =A0 =A0 =A0 __SLONGWORD_TYPE
> +#define __KEY_T_TYPE =A0 =A0 =A0 =A0 =A0 __S32_TYPE
> +#define __CLOCKID_T_TYPE =A0 =A0 =A0 __S32_TYPE
> +#define __TIMER_T_TYPE =A0 =A0 =A0 =A0 void *
> +#define __BLKSIZE_T_TYPE =A0 =A0 =A0 __SLONGWORD_TYPE
> +#define __FSID_T_TYPE =A0 =A0 =A0 =A0 =A0struct { int __val[2]; }
> +#define __SSIZE_T_TYPE =A0 =A0 =A0 =A0 __SWORD_TYPE
> +
> +/* Number of descriptors that can fit in an `fd_set'. =A0*/
> +#define =A0 =A0 =A0 =A0__FD_SETSIZE =A0 =A0 =A0 =A0 =A0 =A01024
> +
> +
> +#endif /* bits/typesizes.h */
> diff --git a/recipes/glibc/glibc-2.10.1/glibc-arm-IO-acquire-lock-fix.dif=
f b/recipes/glibc/glibc-2.10.1/glibc-arm-IO-acquire-lock-fix.diff
> new file mode 100644
> index 0000000..a552cf0
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/glibc-arm-IO-acquire-lock-fix.diff
> @@ -0,0 +1,13 @@
> +Arm needs a similar fix as http://sourceware.org/ml/libc-ports/2007-12/m=
sg00000.html
> +
> +--- /tmp/stdio-lock.h =A02008-03-04 18:51:15.555038993 +0100
> ++++ glibc-2.7/ports/sysdeps/unix/sysv/linux/arm/bits/stdio-lock.h =A0 =
=A0 =A02008-03-04 18:51:28.445035052 +0100
> +@@ -50,6 +50,8 @@
> + =A0 _IO_cleanup_region_start ((void (*) (void *)) _IO_funlockfile, (_fp=
)); =A0 =A0 =A0\
> + =A0 _IO_flockfile (_fp)
> +
> ++# define _IO_acquire_lock_clear_flags2(_fp) _IO_acquire_lock (_fp)
> ++
> + # define _IO_release_lock(_fp) \
> + =A0 _IO_funlockfile (_fp); =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 _IO_cleanup_region_end (0)
> diff --git a/recipes/glibc/glibc-2.10.1/glibc-check_pf.patch b/recipes/gl=
ibc/glibc-2.10.1/glibc-check_pf.patch
> new file mode 100644
> index 0000000..3cff6bb
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/glibc-check_pf.patch
> @@ -0,0 +1,343 @@
> +From libc-ports-return-550-listarch-libc-ports=3Dsources dot redhat dot =
com at sourceware dot org Tue Oct 31 17:37:21 2006
> +Return-Path: <libc-ports-return-550-listarch-libc-ports=3Dsources dot re=
dhat dot com at sourceware dot org>
> +Delivered-To: listarch-libc-ports at sources dot redhat dot com
> +Received: (qmail 17273 invoked by alias); 31 Oct 2006 17:37:20 -0000
> +Received: (qmail 17262 invoked by uid 22791); 31 Oct 2006 17:37:19 -0000
> +X-Spam-Status: No, hits=3D-2.5 required=3D5.0 =A0 =A0 =A0tests=3DAWL,BAY=
ES_00,TW_CP
> +X-Spam-Check-By: sourceware.org
> +Received: from nevyn.them.org (HELO nevyn.them.org) (66.93.172.17) =A0 =
=A0 by sourceware.org (qpsmtpd/0.31.1) with ESMTP; Tue, 31 Oct 2006 17:37:1=
1 +0000
> +Received: from drow by nevyn.them.org with local (Exim 4.54) =A0 id 1Gex=
Xw-0007Dj-30; Tue, 31 Oct 2006 12:37:08 -0500
> +Date: Tue, 31 Oct 2006 12:37:08 -0500
> +From: Daniel Jacobowitz <drow at false dot org>
> +To: Mike Frysinger <vapier at gentoo dot org>
> +Cc: libc-ports at sourceware dot org, Philip Balister <philip dot balist=
er at gmail dot com>
> +Subject: Re: Problem with glibc-2.5 on ARM
> +Message-ID: <20061031173708.GJ20468@nevyn.them.org>
> +References: <499146270610241149ibe030e0nd9d6b177a95b346e@mail.gmail.com>=
 <499146270610241254u7cadf63ej2edf05cedbc5266f@mail.gmail.com> <20061024195=
837.GA20181@nevyn.them.org> <200610291954.27022.vapier@gentoo.org>
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3Dus-ascii
> +Content-Disposition: inline
> +In-Reply-To: <200610291954 dot 27022 dot vapier at gentoo dot org>
> +User-Agent: Mutt/1.5.13 (2006-08-11)
> +X-IsSubscribed: yes
> +Mailing-List: contact libc-ports-help at sourceware dot org; run by ezml=
m
> +Precedence: bulk
> +List-Subscribe: <mailto:libc-ports-subscribe at sourceware dot org>
> +List-Post: <mailto:libc-ports at sourceware dot org>
> +List-Help: <mailto:libc-ports-help at sourceware dot org>, <http://sourc=
eware dot org/lists dot html#faqs>
> +Sender: libc-ports-owner at sourceware dot org
> +Delivered-To: mailing list libc-ports at sourceware dot org
> +
> +On Sun, Oct 29, 2006 at 07:54:25PM -0500, Mike Frysinger wrote:
> +> On Tuesday 24 October 2006 15:58, Daniel Jacobowitz wrote:
> +> > ARM is going to need a slightly different version of that file, I
> +> > guess.
> +>
> +> would declaring req with attribute packed not help ?
> +> -mike
> +
> +Nope. =A0"struct rtgenmsg" would still have size 4.
> +
> +Philip, are you still at all interested in this for the old ABI?
> +I don't have time to test this patch right now, but I think it
> +will work.
> +
> +--
> +Daniel Jacobowitz
> +CodeSourcery
> +
> +2006-10-31 =A0Daniel Jacobowitz =A0<dan@codesourcery.com>
> +
> + =A0 =A0 =A0 * sysdeps/unix/sysv/linux/arm/check_pf.c: New file.
> + =A0 =A0 =A0 * sysdeps/unix/sysv/linux/arm/eabi/check_pf.c: New file.
> +
> +Index: sysdeps/unix/sysv/linux/arm/check_pf.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +RCS file: sysdeps/unix/sysv/linux/arm/check_pf.c
> +diff -N sysdeps/unix/sysv/linux/arm/check_pf.c
> +--- /dev/null =A01 Jan 1970 00:00:00 -0000
> ++++ sysdeps/unix/sysv/linux/arm/check_pf.c =A0 =A0 31 Oct 2006 17:29:58 =
-0000
> +@@ -0,0 +1,274 @@
> ++/* Determine protocol families for which interfaces exist. =A0ARM Linux=
 version.
> ++ =A0 Copyright (C) 2003, 2006 Free Software Foundation, Inc.
> ++ =A0 This file is part of the GNU C Library.
> ++
> ++ =A0 The GNU C Library is free software; you can redistribute it and/or
> ++ =A0 modify it under the terms of the GNU Lesser General Public
> ++ =A0 License as published by the Free Software Foundation; either
> ++ =A0 version 2.1 of the License, or (at your option) any later version.
> ++
> ++ =A0 The GNU C Library is distributed in the hope that it will be usefu=
l,
> ++ =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the GN=
U
> ++ =A0 Lesser General Public License for more details.
> ++
> ++ =A0 You should have received a copy of the GNU Lesser General Public
> ++ =A0 License along with the GNU C Library; if not, write to the Free
> ++ =A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> ++ =A0 02111-1307 USA. =A0*/
> ++
> ++#include <assert.h>
> ++#include <errno.h>
> ++#include <ifaddrs.h>
> ++#include <netdb.h>
> ++#include <stddef.h>
> ++#include <string.h>
> ++#include <time.h>
> ++#include <unistd.h>
> ++#include <sys/socket.h>
> ++
> ++#include <asm/types.h>
> ++#include <linux/netlink.h>
> ++#include <linux/rtnetlink.h>
> ++
> ++#include <not-cancel.h>
> ++#include <kernel-features.h>
> ++
> ++
> ++#ifndef IFA_F_TEMPORARY
> ++# define IFA_F_TEMPORARY IFA_F_SECONDARY
> ++#endif
> ++#ifndef IFA_F_HOMEADDRESS
> ++# define IFA_F_HOMEADDRESS 0
> ++#endif
> ++
> ++
> ++static int
> ++make_request (int fd, pid_t pid, bool *seen_ipv4, bool *seen_ipv6,
> ++ =A0 =A0 =A0 =A0 =A0 =A0struct in6addrinfo **in6ai, size_t *in6ailen)
> ++{
> ++ =A0struct req
> ++ =A0{
> ++ =A0 =A0struct nlmsghdr nlh;
> ++ =A0 =A0struct rtgenmsg g;
> ++ =A0} req;
> ++ =A0struct sockaddr_nl nladdr;
> ++
> ++ =A0/* struct rtgenmsg consists of a single byte but the ARM ABI rounds
> ++ =A0 =A0 it up to a word. =A0Clear the padding explicitly here. =A0*/
> ++ =A0assert (sizeof (req.g) =3D=3D 4);
> ++ =A0memset (&req.g, '\0', sizeof (req.g));
> ++
> ++ =A0req.nlh.nlmsg_len =3D sizeof (req);
> ++ =A0req.nlh.nlmsg_type =3D RTM_GETADDR;
> ++ =A0req.nlh.nlmsg_flags =3D NLM_F_ROOT | NLM_F_MATCH | NLM_F_REQUEST;
> ++ =A0req.nlh.nlmsg_pid =3D 0;
> ++ =A0req.nlh.nlmsg_seq =3D time (NULL);
> ++ =A0req.g.rtgen_family =3D AF_UNSPEC;
> ++
> ++ =A0memset (&nladdr, '\0', sizeof (nladdr));
> ++ =A0nladdr.nl_family =3D AF_NETLINK;
> ++
> ++ =A0if (TEMP_FAILURE_RETRY (__sendto (fd, (void *) &req, sizeof (req), =
0,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(st=
ruct sockaddr *) &nladdr,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0siz=
eof (nladdr))) < 0)
> ++ =A0 =A0return -1;
> ++
> ++ =A0*seen_ipv4 =3D false;
> ++ =A0*seen_ipv6 =3D false;
> ++
> ++ =A0bool done =3D false;
> ++ =A0char buf[4096];
> ++ =A0struct iovec iov =3D { buf, sizeof (buf) };
> ++ =A0struct in6ailist
> ++ =A0{
> ++ =A0 =A0struct in6addrinfo info;
> ++ =A0 =A0struct in6ailist *next;
> ++ =A0} *in6ailist =3D NULL;
> ++ =A0size_t in6ailistlen =3D 0;
> ++
> ++ =A0do
> ++ =A0 =A0{
> ++ =A0 =A0 =A0struct msghdr msg =3D
> ++ =A0 =A0 =A0{
> ++ =A0 =A0 =A0 =A0(void *) &nladdr, sizeof (nladdr),
> ++ =A0 =A0 =A0 =A0&iov, 1,
> ++ =A0 =A0 =A0 =A0NULL, 0,
> ++ =A0 =A0 =A0 =A00
> ++ =A0 =A0 =A0};
> ++
> ++ =A0 =A0 =A0ssize_t read_len =3D TEMP_FAILURE_RETRY (__recvmsg (fd, &ms=
g, 0));
> ++ =A0 =A0 =A0if (read_len < 0)
> ++ =A0 =A0 =A0return -1;
> ++
> ++ =A0 =A0 =A0if (msg.msg_flags & MSG_TRUNC)
> ++ =A0 =A0 =A0return -1;
> ++
> ++ =A0 =A0 =A0struct nlmsghdr *nlmh;
> ++ =A0 =A0 =A0for (nlmh =3D (struct nlmsghdr *) buf;
> ++ =A0 =A0 =A0 =A0 NLMSG_OK (nlmh, (size_t) read_len);
> ++ =A0 =A0 =A0 =A0 nlmh =3D (struct nlmsghdr *) NLMSG_NEXT (nlmh, read_le=
n))
> ++ =A0 =A0 =A0{
> ++ =A0 =A0 =A0 =A0if (nladdr.nl_pid !=3D 0 || (pid_t) nlmh->nlmsg_pid !=
=3D pid
> ++ =A0 =A0 =A0 =A0 =A0 =A0|| nlmh->nlmsg_seq !=3D req.nlh.nlmsg_seq)
> ++ =A0 =A0 =A0 =A0 =A0continue;
> ++
> ++ =A0 =A0 =A0 =A0if (nlmh->nlmsg_type =3D=3D RTM_NEWADDR)
> ++ =A0 =A0 =A0 =A0 =A0{
> ++ =A0 =A0 =A0 =A0 =A0 =A0struct ifaddrmsg *ifam =3D (struct ifaddrmsg *)=
 NLMSG_DATA (nlmh);
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0switch (ifam->ifa_family)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0case AF_INET:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*seen_ipv4 =3D true;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0case AF_INET6:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*seen_ipv6 =3D true;
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ifam->ifa_flags & (IFA_F_DEPRECATED
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | IFA_F_TEMPORARY
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | IFA_F_HOMEADDRESS))
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct rtattr *rta =3D IFA_RTA =
(ifam);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0size_t len =3D (nlmh->nlmsg_len
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0- N=
LMSG_LENGTH (sizeof (*ifam)));
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0void *local =3D NULL;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0void *address =3D NULL;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0while (RTA_OK (rta, len))
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0switch (rta->rta_type)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case IFA_LOCAL:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0local =3D RTA_D=
ATA (rta);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case IFA_ADDRESS:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0address =3D RTA=
_DATA (rta);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rta =3D RTA_NEXT (rta, =
len);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct in6ailist *newp =3D allo=
ca (sizeof (*newp));
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0newp->info.flags =3D (((ifam->i=
fa_flags & IFA_F_DEPRECATED)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 ? in6ai_deprecated : 0)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| ((ifam->ifa_flags
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0& IFA_F_TEMPORARY)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 ? in6ai_temporary : 0)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| ((ifam->ifa_flags
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0& IFA_F_HOMEADDRESS)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 ? in6ai_homeaddress : 0));
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memcpy (newp->info.addr, addres=
s ?: local,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sizeof (newp->i=
nfo.addr));
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0newp->next =3D in6ailist;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0in6ailist =3D newp;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0++in6ailistlen;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0default:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Ignore. =A0*/
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> ++ =A0 =A0 =A0 =A0 =A0}
> ++ =A0 =A0 =A0 =A0else if (nlmh->nlmsg_type =3D=3D NLMSG_DONE)
> ++ =A0 =A0 =A0 =A0 =A0/* We found the end, leave the loop. =A0*/
> ++ =A0 =A0 =A0 =A0 =A0done =3D true;
> ++ =A0 =A0 =A0}
> ++ =A0 =A0}
> ++ =A0while (! done);
> ++
> ++ =A0close_not_cancel_no_status (fd);
> ++
> ++ =A0if (in6ailist !=3D NULL)
> ++ =A0 =A0{
> ++ =A0 =A0 =A0*in6ai =3D malloc (in6ailistlen * sizeof (**in6ai));
> ++ =A0 =A0 =A0if (*in6ai =3D=3D NULL)
> ++ =A0 =A0 =A0return -1;
> ++
> ++ =A0 =A0 =A0*in6ailen =3D in6ailistlen;
> ++
> ++ =A0 =A0 =A0do
> ++ =A0 =A0 =A0{
> ++ =A0 =A0 =A0 =A0(*in6ai)[--in6ailistlen] =3D in6ailist->info;
> ++ =A0 =A0 =A0 =A0in6ailist =3D in6ailist->next;
> ++ =A0 =A0 =A0}
> ++ =A0 =A0 =A0while (in6ailist !=3D NULL);
> ++ =A0 =A0}
> ++
> ++ =A0return 0;
> ++}
> ++
> ++
> ++/* We don't know if we have NETLINK support compiled in in our
> ++ =A0 Kernel. =A0*/
> ++#if __ASSUME_NETLINK_SUPPORT =3D=3D 0
> ++/* Define in ifaddrs.h. =A0*/
> ++extern int __no_netlink_support attribute_hidden;
> ++#else
> ++# define __no_netlink_support 0
> ++#endif
> ++
> ++
> ++void
> ++attribute_hidden
> ++__check_pf (bool *seen_ipv4, bool *seen_ipv6,
> ++ =A0 =A0 =A0 =A0 =A0struct in6addrinfo **in6ai, size_t *in6ailen)
> ++{
> ++ =A0*in6ai =3D NULL;
> ++ =A0*in6ailen =3D 0;
> ++
> ++ =A0if (! __no_netlink_support)
> ++ =A0 =A0{
> ++ =A0 =A0 =A0int fd =3D __socket (PF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
> ++
> ++ =A0 =A0 =A0struct sockaddr_nl nladdr;
> ++ =A0 =A0 =A0memset (&nladdr, '\0', sizeof (nladdr));
> ++ =A0 =A0 =A0nladdr.nl_family =3D AF_NETLINK;
> ++
> ++ =A0 =A0 =A0socklen_t addr_len =3D sizeof (nladdr);
> ++
> ++ =A0 =A0 =A0if (fd >=3D 0
> ++ =A0 =A0 =A0 =A0&& __bind (fd, (struct sockaddr *) &nladdr, sizeof (nla=
ddr)) =3D=3D 0
> ++ =A0 =A0 =A0 =A0&& __getsockname (fd, (struct sockaddr *) &nladdr, &add=
r_len) =3D=3D 0
> ++ =A0 =A0 =A0 =A0&& make_request (fd, nladdr.nl_pid, seen_ipv4, seen_ipv=
6,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 in6ai, in6ailen) =3D=
=3D 0)
> ++ =A0 =A0 =A0/* It worked. =A0*/
> ++ =A0 =A0 =A0return;
> ++
> ++ =A0 =A0 =A0if (fd >=3D 0)
> ++ =A0 =A0 =A0__close (fd);
> ++
> ++#if __ASSUME_NETLINK_SUPPORT =3D=3D 0
> ++ =A0 =A0 =A0/* Remember that there is no netlink support. =A0*/
> ++ =A0 =A0 =A0__no_netlink_support =3D 1;
> ++#else
> ++ =A0 =A0 =A0/* We cannot determine what interfaces are available. =A0Be
> ++ =A0 =A0 =A0 pessimistic. =A0*/
> ++ =A0 =A0 =A0*seen_ipv4 =3D true;
> ++ =A0 =A0 =A0*seen_ipv6 =3D true;
> ++#endif
> ++ =A0 =A0}
> ++
> ++#if __ASSUME_NETLINK_SUPPORT =3D=3D 0
> ++ =A0/* No netlink. =A0Get the interface list via getifaddrs. =A0*/
> ++ =A0struct ifaddrs *ifa =3D NULL;
> ++ =A0if (getifaddrs (&ifa) !=3D 0)
> ++ =A0 =A0{
> ++ =A0 =A0 =A0/* We cannot determine what interfaces are available. =A0Be
> ++ =A0 =A0 =A0 pessimistic. =A0*/
> ++ =A0 =A0 =A0*seen_ipv4 =3D true;
> ++ =A0 =A0 =A0*seen_ipv6 =3D true;
> ++ =A0 =A0 =A0return;
> ++ =A0 =A0}
> ++
> ++ =A0struct ifaddrs *runp;
> ++ =A0for (runp =3D ifa; runp !=3D NULL; runp =3D runp->ifa_next)
> ++ =A0 =A0if (runp->ifa_addr->sa_family =3D=3D PF_INET)
> ++ =A0 =A0 =A0*seen_ipv4 =3D true;
> ++ =A0 =A0else if (runp->ifa_addr->sa_family =3D=3D PF_INET6)
> ++ =A0 =A0 =A0*seen_ipv6 =3D true;
> ++
> ++ =A0(void) freeifaddrs (ifa);
> ++#endif
> ++}
> +Index: sysdeps/unix/sysv/linux/arm/eabi/check_pf.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +RCS file: sysdeps/unix/sysv/linux/arm/eabi/check_pf.c
> +diff -N sysdeps/unix/sysv/linux/arm/eabi/check_pf.c
> +--- /dev/null =A01 Jan 1970 00:00:00 -0000
> ++++ sysdeps/unix/sysv/linux/arm/eabi/check_pf.c =A0 =A0 =A0 =A031 Oct 20=
06 17:29:58 -0000
> +@@ -0,0 +1 @@
> ++#include <sysdeps/unix/sysv/linux/check_pf.c>
> +
> diff --git a/recipes/glibc/glibc-2.10.1/ldd-unbash.patch b/recipes/glibc/=
glibc-2.10.1/ldd-unbash.patch
> new file mode 100644
> index 0000000..2fb8854
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/ldd-unbash.patch
> @@ -0,0 +1,11 @@
> +--- glibc-2.5/elf/ldd.bash.in.org =A0 =A0 =A02006-04-30 16:06:20.0000000=
00 +0000
> ++++ glibc-2.5/elf/ldd.bash.in =A02007-03-30 19:18:57.000000000 +0000
> +@@ -110,7 +110,7 @@
> + # environments where the executed program might not have permissions
> + # to write to the console/tty. =A0But only bash 3.x supports the pipefa=
il
> + # option, and we don't bother to handle the case for older bash version=
s.
> +-if set -o pipefail 2> /dev/null; then
> ++if false; then
> + =A0 try_trace() {
> + =A0 =A0 eval $add_env '"$@"' | cat
> + =A0 }
> diff --git a/recipes/glibc/glibc-2.10.1/ldsocache-varrun.patch b/recipes/=
glibc/glibc-2.10.1/ldsocache-varrun.patch
> new file mode 100644
> index 0000000..9994d4f
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/ldsocache-varrun.patch
> @@ -0,0 +1,18 @@
> +This patch moves ld.so.cache from /etc to /var/run. This is for devices
> +where /etc is JFFS2 or CRAMFS but /var is a ramdisk.
> +
> +#
> +# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
> +#
> +
> +--- libc/sysdeps/generic/dl-cache.h~ldsocache-varrun
> ++++ libc/sysdeps/generic/dl-cache.h
> +@@ -29,7 +29,7 @@
> + #endif
> +
> + #ifndef LD_SO_CACHE
> +-# define LD_SO_CACHE SYSCONFDIR "/ld.so.cache"
> ++# define LD_SO_CACHE "/var/run/ld.so.cache"
> + #endif
> +
> + #ifndef add_system_dir
> diff --git a/recipes/glibc/glibc-2.10.1/march-i686.patch b/recipes/glibc/=
glibc-2.10.1/march-i686.patch
> new file mode 100644
> index 0000000..0461603
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/march-i686.patch
> @@ -0,0 +1,38 @@
> +2007-02-15 =A0Khem Raj =A0<kraj@xxxxxxxxxx>
> +
> + =A0 =A0 =A0 * sysdeps/unix/sysv/linux/i386/sysdep.h: Re-define __i686.
> + =A0 =A0 =A0 * nptl/sysdeps/pthread/pt-initfini.c: Ditto.
> +
> +
> +
> +Index: sysdeps/unix/sysv/linux/i386/sysdep.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- sysdeps/unix/sysv/linux/i386/sysdep.h =A0 =A0 =A0(revision 1469)
> ++++ sysdeps/unix/sysv/linux/i386/sysdep.h =A0 =A0 =A0(working copy)
> +@@ -29,6 +29,10 @@
> + #include <dl-sysdep.h>
> + #include <tls.h>
> +
> ++#if defined __i686 && defined __ASSEMBLER__
> ++#undef __i686
> ++#define __i686 __i686
> ++#endif
> +
> + /* For Linux we can use the system call table in the header file
> + =A0 =A0 =A0 /usr/include/asm/unistd.h
> +Index: nptl/sysdeps/pthread/pt-initfini.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- nptl/sysdeps/pthread/pt-initfini.c (revision 1469)
> ++++ nptl/sysdeps/pthread/pt-initfini.c (working copy)
> +@@ -45,6 +45,11 @@
> + /* Embed an #include to pull in the alignment and .end directives. */
> + asm ("\n#include \"defs.h\"");
> +
> ++asm ("\n#if defined __i686 && defined __ASSEMBLER__");
> ++asm ("\n#undef __i686");
> ++asm ("\n#define __i686 __i686");
> ++asm ("\n#endif");
> ++
> + /* The initial common code ends here. */
> + asm ("\n/*@HEADER_ENDS*/");
> +
> diff --git a/recipes/glibc/glibc-2.10.1/no-z-defs.patch b/recipes/glibc/g=
libc-2.10.1/no-z-defs.patch
> new file mode 100644
> index 0000000..48c6a41
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/no-z-defs.patch
> @@ -0,0 +1,9 @@
> +Create a configparms file which disabled no-z-defs.
> +This is required to build a working glibs for sh4,
> +without there will be a lot linker errors during the build.
> +
> +diff -duNr libc.orig/configparms libc/configparms
> +--- libc.orig/configparms =A0 =A0 =A01970-01-01 10:00:00.000000000 +1000
> ++++ libc/configparms =A0 2006-02-23 14:08:18.000000000 +1100
> +@@ -0,0 +1 @@
> ++no-z-defs=3Dyes
> diff --git a/recipes/glibc/glibc-2.10.1/nptl-crosscompile.patch b/recipes=
/glibc/glibc-2.10.1/nptl-crosscompile.patch
> new file mode 100644
> index 0000000..18a46ad
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/nptl-crosscompile.patch
> @@ -0,0 +1,26 @@
> +--- glibc-2.4/nptl/sysdeps/pthread/configure.in.ark =A0 =A02006-03-12 00=
:41:40.000000000 +0100
> ++++ glibc-2.4/nptl/sysdeps/pthread/configure.in =A0 =A0 =A0 =A02006-03-1=
2 00:44:08.000000000 +0100
> +@@ -45,5 +45,6 @@
> + =A0 =A0 AC_MSG_ERROR([the compiler must support C cleanup handling])
> + =A0 fi
> + else
> +- =A0AC_MSG_ERROR(forced unwind support is required)
> ++ =A0AC_MSG_WARN([forced unwind support is required, can't be verified w=
hile crosscompiling])
> ++ =A0AC_DEFINE(HAVE_FORCED_UNWIND)
> + fi
> +--- glibc-2.4/nptl/sysdeps/pthread/configure.ark =A0 =A0 =A0 2006-03-12 =
00:42:47.000000000 +0100
> ++++ glibc-2.4/nptl/sysdeps/pthread/configure =A0 2006-03-12 00:44:08.000=
000000 +0100
> +@@ -153,7 +153,10 @@
> + =A0 =A0{ (exit 1); exit 1; }; }
> + =A0 fi
> + else
> +- =A0{ { echo "$as_me:$LINENO: error: forced unwind support is required"=
 >&5
> +-echo "$as_me: error: forced unwind support is required" >&2;}
> +- =A0 { (exit 1); exit 1; }; }
> ++ =A0{ echo "$as_me:$LINENO: WARNING: forced unwind support is required,=
 can't be verified while crosscompiling" >&5
> ++echo "$as_me: WARNING: forced unwind support is required, can't be veri=
fied while crosscompiling" >&2;}
> ++ =A0cat >>confdefs.h <<\_ACEOF
> ++#define HAVE_FORCED_UNWIND 1
> ++_ACEOF
> ++
> + fi
> diff --git a/recipes/glibc/glibc-2.10.1/nscd-init.patch b/recipes/glibc/g=
libc-2.10.1/nscd-init.patch
> new file mode 100644
> index 0000000..884609a
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/nscd-init.patch
> @@ -0,0 +1,39 @@
> +--- nscd/nscd.init
> ++++ nscd/nscd.init
> +@@ -48,9 +48,8 @@
> +
> + start () {
> + =A0 =A0 [ -d /var/run/nscd ] || mkdir /var/run/nscd
> +- =A0 =A0[ -d /var/db/nscd ] || mkdir /var/db/nscd
> + =A0 =A0 echo -n $"Starting $prog: "
> +- =A0 =A0daemon /usr/sbin/nscd
> ++ =A0 =A0/usr/sbin/nscd
> + =A0 =A0 RETVAL=3D$?
> + =A0 =A0 echo
> + =A0 =A0 [ $RETVAL -eq 0 ] && touch /var/lock/subsys/nscd
> +@@ -67,12 +66,10 @@
> + =A0 =A0 =A0 # a non-privileged user
> + =A0 =A0 =A0 rm -f /var/run/nscd/nscd.pid
> + =A0 =A0 =A0 rm -f /var/run/nscd/socket
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0success $"$prog shutdown"
> +- =A0 =A0else
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0failure $"$prog shutdown"
> + =A0 =A0 fi
> +- =A0 =A0echo
> +- =A0 =A0return $RETVAL
> ++ =A0 =A0echo "Done."
> ++ =A0 =A0# If nscd did not run, return 0 according to LSB.
> ++ =A0 =A0return 0
> + }
> +
> + restart() {
> +@@ -104,7 +101,8 @@
> + =A0 =A0 =A0 ;;
> + =A0 =A0 force-reload | reload)
> + =A0 =A0 =A0 echo -n $"Reloading $prog: "
> +- =A0 =A0 =A0killproc /usr/sbin/nscd -HUP
> ++ =A0 =A0 =A0# Use killall, initscripts-1.0-r115 don't support -HUP yet.
> ++ =A0 =A0 =A0killall -HUP /usr/sbin/nscd
> + =A0 =A0 =A0 RETVAL=3D$?
> + =A0 =A0 =A0 echo
> + =A0 =A0 =A0 ;;
> diff --git a/recipes/glibc/glibc-2.10.1/powerpc-sqrt-hack.diff b/recipes/=
glibc/glibc-2.10.1/powerpc-sqrt-hack.diff
> new file mode 100644
> index 0000000..1046efb
> --- /dev/null
> +++ b/recipes/glibc/glibc-2.10.1/powerpc-sqrt-hack.diff
> @@ -0,0 +1,25 @@
> +diff -Nurd ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.=
c glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c
> +--- ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c =A0 =
=A0 2006-04-14 07:44:30.000000000 +0200
> ++++ glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c =A0 =A0 2006-12-08 12:53:32.2=
02227000 +0100
> +@@ -25,6 +25,9 @@
> + #include <sysdep.h>
> + #include <ldsodefs.h>
> +
> ++#define __CPU_HAS_FSQRT ((GLRO(dl_hwcap) & PPC_FEATURE_64) !=3D 0)
> ++
> ++
> + static const double almost_half =3D 0.5000000000000001; /* 0.5 + 2^-53 =
*/
> + static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> + static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> +diff -Nurd ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf=
.c glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c
> +--- ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c =A0 =
=A02006-04-14 07:44:30.000000000 +0200
> ++++ glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c =A0 =A02006-12-08 12:53:36.9=
92227000 +0100
> +@@ -25,6 +25,8 @@
> + #include <sysdep.h>
> + #include <ldsodefs.h>
> +
> ++#define __CPU_HAS_FSQRT ((GLRO(dl_hwcap) & PPC_FEATURE_64) !=3D 0)
> ++
> + static const float almost_half =3D 0.50000006; =A0/* 0.5 + 2^-24 */
> + static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> + static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> diff --git a/recipes/glibc/glibc_2.10.1.bb b/recipes/glibc/glibc_2.10.1.b=
b
> index 3c2fce8..b29e36a 100644
> --- a/recipes/glibc/glibc_2.10.1.bb
> +++ b/recipes/glibc/glibc_2.10.1.bb
> @@ -11,9 +11,6 @@ RPROVIDES_${PN}-dev =3D "libc6-dev virtual-libc-dev"
> =A0BUILD_CPPFLAGS =3D "-I${STAGING_INCDIR_NATIVE}"
> =A0TARGET_CPPFLAGS =3D "-I${STAGING_DIR_TARGET}${layout_includedir}"
>
> -
> -FILESPATHPKG =3D. "glibc-2.4:"
> -
> =A0GLIBC_ADDONS ?=3D "ports,nptl,libidn"
>
> =A0GLIBC_BROKEN_LOCALES =3D " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_=
ET gez_ER bn_BD te_IN"
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


