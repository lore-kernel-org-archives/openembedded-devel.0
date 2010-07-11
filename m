Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OXvCn-0003ND-9E
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 14:00:39 +0200
Received: by ewy7 with SMTP id 7so703230ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 04:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=MAkU42OC3KUEEdCACJtlGvYk50xygHcStBt+NE0xiqI=;
	b=cw5S7a4W2X9zwqMAfpIHXBgQeypSXQdrHzuzcJbCj/kbOh9K8V6uATOKAv+3HfPmC8
	/+AJVdmbT86o+GIEKhFV/CDIinF5NPx+5IhffzbNQdxTRE2t9ogpcP4vH0K50SziasvT
	bHzy2UZmd/MNkeqjFXdudeSmsRHLpVfIpSlyg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FhMEEQ+mkvePBlOzLPQnaJvaZmZH8ATeSkgkLJNjrTGw8bPFeAlGI9TadnZnGrJ8dA
	ttTA0pyERHujjU0SJ++yQBmWi7dZNlojz4hSSC+vxnq+mgcFdRSL5aWVsVGZpEcmkfNW
	XuHVQIuDQo0QnijzRRZ/QOoEwj7jwyU7PdF/U=
Received: by 10.213.27.206 with SMTP id j14mr8950451ebc.28.1278849321408;
	Sun, 11 Jul 2010 04:55:21 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id z55sm26557458eeh.21.2010.07.11.04.55.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 11 Jul 2010 04:55:20 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jul 2010 13:52:59 +0200
Message-Id: <1278849179-17002-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <AANLkTilGJjsqfz2zu4m3m5vQ99jCX44CrtFUSiRTpkE9@mail.gmail.com>
References: <AANLkTilGJjsqfz2zu4m3m5vQ99jCX44CrtFUSiRTpkE9@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] glibc 2;5: cleaned up; patches only in local dir
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
X-List-Received-Date: Sun, 11 Jul 2010 12:00:39 -0000
X-List-Received-Date: Sun, 11 Jul 2010 12:00:39 -0000

mved all patches to glibc-2.5
removed references to other dirs.

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

This is as discussed in the ML
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg07545.html
If I get two acks for this I'll also create and submit patches for the other versions
followed by a patch to remove the unused versions (as listed in the above thread).
That is: barring  objections ofc.

Have fun, Frans.

 recipes/glibc/glibc-2.5/arm-longlong.patch         |   58 ++
 recipes/glibc/glibc-2.5/arm-memcpy.patch           |  758 ++++++++++++++++++++
 recipes/glibc/glibc-2.5/dl-cache-libcmp.patch      |   10 +
 recipes/glibc/glibc-2.5/etc/ld.so.conf             |    2 +
 recipes/glibc/glibc-2.5/fhs-linux-paths.patch      |   11 +
 recipes/glibc/glibc-2.5/generate-supported.mk      |   11 +
 recipes/glibc/glibc-2.5/generic-bits_select.h      |   35 +
 recipes/glibc/glibc-2.5/generic-bits_time.h        |   75 ++
 recipes/glibc/glibc-2.5/generic-bits_types.h       |  200 +++++
 recipes/glibc/glibc-2.5/generic-bits_typesizes.h   |   66 ++
 .../glibc-2.5-local-dynamic-resolvconf.patch       |   41 ++
 .../glibc-2.5-soft-fp-separate-strong-alias.patch  |  205 ++++++
 .../glibc-2.6.1-use-short-for-fnstsw.patch         |   30 +
 .../glibc/glibc-2.5/glibc-arm-no-asm-page.patch    |   15 +
 recipes/glibc/glibc-2.5/ldd-unbash.patch           |   11 +
 recipes/glibc/glibc-2.5/ldsocache-varrun.patch     |   18 +
 recipes/glibc/glibc-2.5/no-z-defs.patch            |    9 +
 recipes/glibc/glibc-2.5/nptl-crosscompile.patch    |   26 +
 recipes/glibc/glibc-2.5/powerpc-sqrt-hack.diff     |   25 +
 .../glibc/glibc-2.5/ppc-ld-nofpu-20070104.patch    |  190 +++++
 .../glibc-2.5/ppc-ports-ld-nofpu-20070114.patch    |   38 +
 recipes/glibc/glibc-2.5/ppc-sfp-machine.patch      |  297 ++++++++
 recipes/glibc/glibc-2.5/ppc-soft-fp-20070115.patch |  182 +++++
 recipes/glibc/glibc-2.5/zecke-sane-readelf.patch   |  243 +++++++
 recipes/glibc/glibc_2.5.bb                         |    6 +-
 25 files changed, 2557 insertions(+), 5 deletions(-)
 create mode 100644 recipes/glibc/glibc-2.5/arm-longlong.patch
 create mode 100644 recipes/glibc/glibc-2.5/arm-memcpy.patch
 create mode 100644 recipes/glibc/glibc-2.5/dl-cache-libcmp.patch
 create mode 100644 recipes/glibc/glibc-2.5/etc/ld.so.conf
 create mode 100644 recipes/glibc/glibc-2.5/fhs-linux-paths.patch
 create mode 100644 recipes/glibc/glibc-2.5/generate-supported.mk
 create mode 100644 recipes/glibc/glibc-2.5/generic-bits_select.h
 create mode 100644 recipes/glibc/glibc-2.5/generic-bits_time.h
 create mode 100644 recipes/glibc/glibc-2.5/generic-bits_types.h
 create mode 100644 recipes/glibc/glibc-2.5/generic-bits_typesizes.h
 create mode 100644 recipes/glibc/glibc-2.5/glibc-2.5-local-dynamic-resolvconf.patch
 create mode 100644 recipes/glibc/glibc-2.5/glibc-2.5-soft-fp-separate-strong-alias.patch
 create mode 100644 recipes/glibc/glibc-2.5/glibc-2.6.1-use-short-for-fnstsw.patch
 create mode 100644 recipes/glibc/glibc-2.5/glibc-arm-no-asm-page.patch
 create mode 100644 recipes/glibc/glibc-2.5/ldd-unbash.patch
 create mode 100644 recipes/glibc/glibc-2.5/ldsocache-varrun.patch
 create mode 100644 recipes/glibc/glibc-2.5/no-z-defs.patch
 create mode 100644 recipes/glibc/glibc-2.5/nptl-crosscompile.patch
 create mode 100644 recipes/glibc/glibc-2.5/powerpc-sqrt-hack.diff
 create mode 100644 recipes/glibc/glibc-2.5/ppc-ld-nofpu-20070104.patch
 create mode 100644 recipes/glibc/glibc-2.5/ppc-ports-ld-nofpu-20070114.patch
 create mode 100644 recipes/glibc/glibc-2.5/ppc-sfp-machine.patch
 create mode 100644 recipes/glibc/glibc-2.5/ppc-soft-fp-20070115.patch
 create mode 100644 recipes/glibc/glibc-2.5/zecke-sane-readelf.patch

diff --git a/recipes/glibc/glibc-2.5/arm-longlong.patch b/recipes/glibc/glibc-2.5/arm-longlong.patch
new file mode 100644
index 0000000..28aca83
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/arm-longlong.patch
@@ -0,0 +1,58 @@
+--- glibc-2.4/stdlib/longlong.h.ark	2006-03-11 22:49:27.000000000 +0100
++++ glibc-2.4/stdlib/longlong.h	2006-03-11 22:55:12.000000000 +0100
+@@ -206,6 +206,14 @@
+ 	     "rI" ((USItype) (bh)),					\
+ 	     "r" ((USItype) (al)),					\
+ 	     "rI" ((USItype) (bl)) __CLOBBER_CC)
++/* v3m and all higher arches have long multiply support.  */
++#if !defined(__ARM_ARCH_2__) && !defined(__ARM_ARCH_3__)
++#define umul_ppmm(xh, xl, a, b) \
++  __asm__ ("umull %0,%1,%2,%3" : "=&r" (xl), "=&r" (xh) : "r" (a), "r" (b))
++#define UMUL_TIME 5
++#define smul_ppmm(xh, xl, a, b) \
++  __asm__ ("smull %0,%1,%2,%3" : "=&r" (xl), "=&r" (xh) : "r" (a), "r" (b))
++#else							   
+ #define umul_ppmm(xh, xl, a, b) \
+ {register USItype __t0, __t1, __t2;					\
+   __asm__ ("%@ Inlined umul_ppmm\n"					\
+@@ -227,7 +235,13 @@
+ 	   : "r" ((USItype) (a)),					\
+ 	     "r" ((USItype) (b)) __CLOBBER_CC );}
+ #define UMUL_TIME 20
++#endif
+ #define UDIV_TIME 100
++#if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || defined(__ARM_ARCH_5TE__)
++#define count_leading_zeros(COUNT,X)   ((COUNT) = __builtin_clz (X))
++#define COUNT_LEADING_ZEROS_0 32
++#endif
++							   
+ #endif /* __arm__ */
+ 
+ #if defined (__hppa) && W_TYPE_SIZE == 32
+--- glibc-2.4/ports/sysdeps/arm/mp_clz_tab.c.ark	2006-03-11 22:56:43.000000000 +0100
++++ glibc-2.4/ports/sysdeps/arm/mp_clz_tab.c	2006-03-11 22:58:19.000000000 +0100
+@@ -0,0 +1,24 @@
++/* __clz_tab -- support for longlong.h
++   Copyright (C) 2004 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || defined(__ARM_ARCH_5TE__)
++/* Nothing required.  */
++#else
++#include <stdlib/mp_clz_tab.c>
++#endif
diff --git a/recipes/glibc/glibc-2.5/arm-memcpy.patch b/recipes/glibc/glibc-2.5/arm-memcpy.patch
new file mode 100644
index 0000000..bc2b3da
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/arm-memcpy.patch
@@ -0,0 +1,758 @@
+--- /dev/null	2004-02-02 20:32:13.000000000 +0000
++++ sysdeps/arm/memmove.S	2004-03-20 18:37:23.000000000 +0000
+@@ -0,0 +1,251 @@
++/*
++ *   Optimized memmove implementation for ARM processors
++ *
++ *	Author: 	Nicolas Pitre
++ *	Created:	Dec 23, 2003
++ *	Copyright:	(C) MontaVista Software, Inc.
++ *
++ *   This file is free software; you can redistribute it and/or
++ *   modify it under the terms of the GNU Lesser General Public
++ *   License as published by the Free Software Foundation; either
++ *   version 2.1 of the License, or (at your option) any later version.
++ *
++ *   This file is distributed in the hope that it will be useful,
++ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ *   Lesser General Public License for more details.
++ */
++
++#include <sysdep.h>
++
++
++/*
++ * Endian independent macros for shifting bytes within registers.
++ */
++#ifndef __ARMEB__
++#define pull            lsr
++#define push            lsl
++#else
++#define pull            lsl
++#define push            lsr
++#endif
++
++/*
++ * Enable data preload for architectures that support it (ARMv5 and above)
++ */
++#if defined(__ARM_ARCH_5__) || \
++    defined(__ARM_ARCH_5T__) || \
++    defined(__ARM_ARCH_5TE__)
++#define PLD(code...)	code
++#else
++#define PLD(code...)
++#endif
++
++
++/* char * memmove (char *dst, const char *src) */
++ENTRY(memmove)
++		subs	ip, r0, r1
++		cmphi	r2, ip
++		bls	memcpy(PLT)
++
++		stmfd	sp!, {r0, r4, lr}
++		add	r1, r1, r2
++		add	r0, r0, r2
++		subs	r2, r2, #4
++		blt	25f
++		ands	ip, r0, #3
++	PLD(	pld	[r1, #-4]		)
++		bne	26f
++		ands	ip, r1, #3
++		bne	27f
++
++19:		subs	r2, r2, #4
++		blt	24f
++		subs	r2, r2, #8
++		blt	23f
++		subs	r2, r2, #16
++		blt	22f
++
++	PLD(	pld	[r1, #-32]		)
++	PLD(	subs	r2, r2, #96		)
++		stmfd	sp!, {r5 - r8}
++	PLD(	blt	21f			)
++
++	PLD(	@ cache alignment		)
++	PLD(	ands	ip, r1, #31		)
++	PLD(	pld	[r1, #-64]		)
++	PLD(	beq	20f			)
++	PLD(	cmp	r2, ip			)
++	PLD(	pld	[r1, #-96]		)
++	PLD(	blt	20f			)
++	PLD(	cmp	ip, #16			)
++	PLD(	sub	r2, r2, ip		)
++	PLD(	ldmgedb	r1!, {r3 - r6}		)
++	PLD(	stmgedb	r0!, {r3 - r6}		)
++	PLD(	beq	20f			)
++	PLD(	and	ip, ip, #15		)
++	PLD(	cmp	ip, #8			)
++	PLD(	ldr	r3, [r1, #-4]!		)
++	PLD(	ldrge	r4, [r1, #-4]!		)
++	PLD(	ldrgt	r5, [r1, #-4]!		)
++	PLD(	str	r3, [r0, #-4]!		)
++	PLD(	strge	r4, [r0, #-4]!		)
++	PLD(	strgt	r5, [r0, #-4]!		)
++
++20:	PLD(	pld	[r1, #-96]		)
++	PLD(	pld	[r1, #-128]		)
++21:		ldmdb	r1!, {r3, r4, ip, lr}
++		subs	r2, r2, #32
++		stmdb	r0!, {r3, r4, ip, lr}
++		ldmdb	r1!, {r3, r4, ip, lr}
++		stmgedb	r0!, {r3, r4, ip, lr}
++		ldmgedb	r1!, {r3, r4, ip, lr}
++		stmgedb	r0!, {r3, r4, ip, lr}
++		ldmgedb	r1!, {r3, r4, ip, lr}
++		subges	r2, r2, #32
++		stmdb	r0!, {r3, r4, ip, lr}
++		bge	20b
++	PLD(	cmn	r2, #96			)
++	PLD(	bge	21b			)
++	PLD(	add	r2, r2, #96		)
++		tst	r2, #31
++		ldmfd	sp!, {r5 - r8}
++		ldmeqfd	sp!, {r0, r4, pc}
++
++		tst	r2, #16
++22:		ldmnedb	r1!, {r3, r4, ip, lr}
++		stmnedb	r0!, {r3, r4, ip, lr}
++
++		tst	r2, #8
++23:		ldmnedb	r1!, {r3, r4}
++		stmnedb	r0!, {r3, r4}
++
++		tst	r2, #4
++24:		ldrne	r3, [r1, #-4]!
++		strne	r3, [r0, #-4]!
++
++25:		ands	r2, r2, #3
++		ldmeqfd	sp!, {r0, r4, pc}
++
++		cmp	r2, #2
++		ldrb	r3, [r1, #-1]
++		ldrgeb	r4, [r1, #-2]
++		ldrgtb	ip, [r1, #-3]
++		strb	r3, [r0, #-1]
++		strgeb	r4, [r0, #-2]
++		strgtb	ip, [r0, #-3]
++		ldmfd	sp!, {r0, r4, pc}
++
++26:		cmp	ip, #2
++		ldrb	r3, [r1, #-1]!
++		ldrgeb	r4, [r1, #-1]!
++		ldrgtb	lr, [r1, #-1]!
++		strb	r3, [r0, #-1]!
++		strgeb	r4, [r0, #-1]!
++		strgtb	lr, [r0, #-1]!
++		subs	r2, r2, ip
++		blt	25b
++		ands	ip, r1, #3
++		beq	19b
++
++27:		bic	r1, r1, #3
++		cmp	ip, #2
++		ldr	r3, [r1]
++		beq	35f
++		blt	36f
++
++
++		.macro	backward_copy_shift push pull
++
++		cmp	r2, #12
++	PLD(	pld	[r1, #-4]		)
++		blt	33f
++		subs	r2, r2, #28
++		stmfd	sp!, {r5 - r9}
++		blt	31f
++
++	PLD(	subs	r2, r2, #96		)
++	PLD(	pld	[r1, #-32]		)
++	PLD(	blt	30f			)
++	PLD(	pld	[r1, #-64]		)
++
++	PLD(	@ cache alignment		)
++	PLD(	ands	ip, r1, #31		)
++	PLD(	pld	[r1, #-96]		)
++	PLD(	beq	29f			)
++	PLD(	cmp	r2, ip			)
++	PLD(	pld	[r1, #-128]		)
++	PLD(	blt	29f			)
++	PLD(	sub	r2, r2, ip		)
++28:	PLD(	mov	r4, r3, push #\push	)
++	PLD(	ldr	r3, [r1, #-4]!		)
++	PLD(	subs	ip, ip, #4		)
++	PLD(	orr	r4, r4, r3, pull #\pull	)
++	PLD(	str	r4, [r0, #-4]!		)
++	PLD(	bgt	28b			)
++
++29:	PLD(	pld	[r1, #-128]		)
++30:		mov	lr, r3, push #\push
++		ldmdb	r1!, {r3 - r9, ip}
++		subs	r2, r2, #32
++		orr	lr, lr, ip, pull #\pull
++		mov	ip, ip, push #\push
++		orr	ip, ip, r9, pull #\pull
++		mov	r9, r9, push #\push
++		orr	r9, r9, r8, pull #\pull
++		mov	r8, r8, push #\push
++		orr	r8, r8, r7, pull #\pull
++		mov	r7, r7, push #\push
++		orr	r7, r7, r6, pull #\pull
++		mov	r6, r6, push #\push
++		orr	r6, r6, r5, pull #\pull
++		mov	r5, r5, push #\push
++		orr	r5, r5, r4, pull #\pull
++		mov	r4, r4, push #\push
++		orr	r4, r4, r3, pull #\pull
++		stmdb	r0!, {r4 - r9, ip, lr}
++		bge	29b
++	PLD(	cmn	r2, #96			)
++	PLD(	bge	30b			)
++	PLD(	add	r2, r2, #96		)
++		cmn	r2, #16
++		blt	32f
++31:		mov	r7, r3, push #\push
++		ldmdb	r1!, {r3 - r6}
++		sub	r2, r2, #16
++		orr	r7, r7, r6, pull #\pull
++		mov	r6, r6, push #\push
++		orr	r6, r6, r5, pull #\pull
++		mov	r5, r5, push #\push
++		orr	r5, r5, r4, pull #\pull
++		mov	r4, r4, push #\push
++		orr	r4, r4, r3, pull #\pull
++		stmdb	r0!, {r4 - r7}
++32:		adds	r2, r2, #28
++		ldmfd	sp!, {r5 - r9}
++		blt	34f
++33:		mov	r4, r3, push #\push
++		ldr	r3, [r1, #-4]!
++		subs	r2, r2, #4
++		orr	r4, r4, r3, pull #\pull
++		str	r4, [r0, #-4]!
++		bge	33b
++34:
++		.endm
++
++
++		backward_copy_shift	push=8	pull=24
++		add	r1, r1, #3
++		b	25b
++
++35:		backward_copy_shift	push=16	pull=16
++		add	r1, r1, #2
++		b	25b
++
++36:		backward_copy_shift	push=24	pull=8
++		add	r1, r1, #1
++		b	25b
++
++		.size	memmove, . - memmove
++END(memmove)
++libc_hidden_builtin_def (memmove)
+--- /dev/null	2004-02-02 20:32:13.000000000 +0000
++++ sysdeps/arm/bcopy.S	2004-03-20 18:37:48.000000000 +0000
+@@ -0,0 +1,255 @@
++/*
++ *   Optimized memmove implementation for ARM processors
++ *
++ *	Author: 	Nicolas Pitre
++ *	Created:	Dec 23, 2003
++ *	Copyright:	(C) MontaVista Software, Inc.
++ *
++ *   This file is free software; you can redistribute it and/or
++ *   modify it under the terms of the GNU Lesser General Public
++ *   License as published by the Free Software Foundation; either
++ *   version 2.1 of the License, or (at your option) any later version.
++ *
++ *   This file is distributed in the hope that it will be useful,
++ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ *   Lesser General Public License for more details.
++ */
++
++#include <sysdep.h>
++
++
++/*
++ * Endian independent macros for shifting bytes within registers.
++ */
++#ifndef __ARMEB__
++#define pull            lsr
++#define push            lsl
++#else
++#define pull            lsl
++#define push            lsr
++#endif
++
++/*
++ * Enable data preload for architectures that support it (ARMv5 and above)
++ */
++#if defined(__ARM_ARCH_5__) || \
++    defined(__ARM_ARCH_5T__) || \
++    defined(__ARM_ARCH_5TE__)
++#define PLD(code...)	code
++#else
++#define PLD(code...)
++#endif
++
++dst		.req	r1
++src		.req	r0
++
++/* void *bcopy (const char *src, char *dst, size_t size) */
++ENTRY(bcopy)
++		subs	ip, dst, src
++		cmphi	r2, ip
++		movls	r3, r0
++		movls	r0, r1
++		movls	r1, r3
++		bls	memcpy(PLT)
++
++		stmfd	sp!, {r4, lr}
++		add	src, src, r2
++		add	dst, dst, r2
++		subs	r2, r2, #4
++		blt	25f
++		ands	ip, dst, #3
++	PLD(	pld	[src, #-4]		)
++		bne	26f
++		ands	ip, src, #3
++		bne	27f
++
++19:		subs	r2, r2, #4
++		blt	24f
++		subs	r2, r2, #8
++		blt	23f
++		subs	r2, r2, #16
++		blt	22f
++
++	PLD(	pld	[src, #-32]		)
++	PLD(	subs	r2, r2, #96		)
++		stmfd	sp!, {r5 - r8}
++	PLD(	blt	21f			)
++
++	PLD(	@ cache alignment		)
++	PLD(	ands	ip, src, #31		)
++	PLD(	pld	[src, #-64]		)
++	PLD(	beq	20f			)
++	PLD(	cmp	r2, ip			)
++	PLD(	pld	[src, #-96]		)
++	PLD(	blt	20f			)
++	PLD(	cmp	ip, #16			)
++	PLD(	sub	r2, r2, ip		)
++	PLD(	ldmgedb	src!, {r3 - r6}		)
++	PLD(	stmgedb	dst!, {r3 - r6}		)
++	PLD(	beq	20f			)
++	PLD(	and	ip, ip, #15		)
++	PLD(	cmp	ip, #8			)
++	PLD(	ldr	r3, [src, #-4]!		)
++	PLD(	ldrge	r4, [src, #-4]!		)
++	PLD(	ldrgt	r5, [src, #-4]!		)
++	PLD(	str	r3, [dst, #-4]!		)
++	PLD(	strge	r4, [dst, #-4]!		)
++	PLD(	strgt	r5, [dst, #-4]!		)
++
++20:	PLD(	pld	[src, #-96]		)
++	PLD(	pld	[src, #-128]		)
++21:		ldmdb	src!, {r3, r4, ip, lr}
++		subs	r2, r2, #32
++		stmdb	dst!, {r3, r4, ip, lr}
++		ldmdb	src!, {r3, r4, ip, lr}
++		stmgedb	dst!, {r3, r4, ip, lr}
++		ldmgedb	src!, {r3, r4, ip, lr}
++		stmgedb	dst!, {r3, r4, ip, lr}
++		ldmgedb	src!, {r3, r4, ip, lr}
++		subges	r2, r2, #32
++		stmdb	dst!, {r3, r4, ip, lr}
++		bge	20b
++	PLD(	cmn	r2, #96			)
++	PLD(	bge	21b			)
++	PLD(	add	r2, r2, #96		)
++		tst	r2, #31
++		ldmfd	sp!, {r5 - r8}
++		ldmeqfd	sp!, {r4, pc}
++
++		tst	r2, #16
++22:		ldmnedb	src!, {r3, r4, ip, lr}
++		stmnedb	dst!, {r3, r4, ip, lr}
++
++		tst	r2, #8
++23:		ldmnedb	src!, {r3, r4}
++		stmnedb	dst!, {r3, r4}
++
++		tst	r2, #4
++24:		ldrne	r3, [src, #-4]!
++		strne	r3, [dst, #-4]!
++
++25:		ands	r2, r2, #3
++		ldmeqfd	sp!, {dst, r4, pc}
++
++		cmp	r2, #2
++		ldrb	r3, [src, #-1]
++		ldrgeb	r4, [src, #-2]
++		ldrgtb	ip, [src, #-3]
++		strb	r3, [dst, #-1]
++		strgeb	r4, [dst, #-2]
++		strgtb	ip, [dst, #-3]
++		ldmfd	sp!, {dst, r4, pc}
++
++26:		cmp	ip, #2
++		ldrb	r3, [src, #-1]!
++		ldrgeb	r4, [src, #-1]!
++		ldrgtb	lr, [src, #-1]!
++		strb	r3, [dst, #-1]!
++		strgeb	r4, [dst, #-1]!
++		strgtb	lr, [dst, #-1]!
++		subs	r2, r2, ip
++		blt	25b
++		ands	ip, src, #3
++		beq	19b
++
++27:		bic	src, src, #3
++		cmp	ip, #2
++		ldr	r3, [src]
++		beq	35f
++		blt	36f
++
++
++		.macro	backward_copy_shift push pull
++
++		cmp	r2, #12
++	PLD(	pld	[src, #-4]		)
++		blt	33f
++		subs	r2, r2, #28
++		stmfd	sp!, {r5 - r9}
++		blt	31f
++
++	PLD(	subs	r2, r2, #96		)
++	PLD(	pld	[src, #-32]		)
++	PLD(	blt	30f			)
++	PLD(	pld	[src, #-64]		)
++
++	PLD(	@ cache alignment		)
++	PLD(	ands	ip, src, #31		)
++	PLD(	pld	[src, #-96]		)
++	PLD(	beq	29f			)
++	PLD(	cmp	r2, ip			)
++	PLD(	pld	[src, #-128]		)
++	PLD(	blt	29f			)
++	PLD(	sub	r2, r2, ip		)
++28:	PLD(	mov	r4, r3, push #\push	)
++	PLD(	ldr	r3, [src, #-4]!		)
++	PLD(	subs	ip, ip, #4		)
++	PLD(	orr	r4, r4, r3, pull #\pull	)
++	PLD(	str	r4, [dst, #-4]!		)
++	PLD(	bgt	28b			)
++
++29:	PLD(	pld	[src, #-128]		)
++30:		mov	lr, r3, push #\push
++		ldmdb	src!, {r3 - r9, ip}
++		subs	r2, r2, #32
++		orr	lr, lr, ip, pull #\pull
++		mov	ip, ip, push #\push
++		orr	ip, ip, r9, pull #\pull
++		mov	r9, r9, push #\push
++		orr	r9, r9, r8, pull #\pull
++		mov	r8, r8, push #\push
++		orr	r8, r8, r7, pull #\pull
++		mov	r7, r7, push #\push
++		orr	r7, r7, r6, pull #\pull
++		mov	r6, r6, push #\push
++		orr	r6, r6, r5, pull #\pull
++		mov	r5, r5, push #\push
++		orr	r5, r5, r4, pull #\pull
++		mov	r4, r4, push #\push
++		orr	r4, r4, r3, pull #\pull
++		stmdb	dst!, {r4 - r9, ip, lr}
++		bge	29b
++	PLD(	cmn	r2, #96			)
++	PLD(	bge	30b			)
++	PLD(	add	r2, r2, #96		)
++		cmn	r2, #16
++		blt	32f
++31:		mov	r7, r3, push #\push
++		ldmdb	src!, {r3 - r6}
++		sub	r2, r2, #16
++		orr	r7, r7, r6, pull #\pull
++		mov	r6, r6, push #\push
++		orr	r6, r6, r5, pull #\pull
++		mov	r5, r5, push #\push
++		orr	r5, r5, r4, pull #\pull
++		mov	r4, r4, push #\push
++		orr	r4, r4, r3, pull #\pull
++		stmdb	dst!, {r4 - r7}
++32:		adds	r2, r2, #28
++		ldmfd	sp!, {r5 - r9}
++		blt	34f
++33:		mov	r4, r3, push #\push
++		ldr	r3, [src, #-4]!
++		subs	r2, r2, #4
++		orr	r4, r4, r3, pull #\pull
++		str	r4, [dst, #-4]!
++		bge	33b
++34:
++		.endm
++
++
++		backward_copy_shift	push=8	pull=24
++		add	src, src, #3
++		b	25b
++
++35:		backward_copy_shift	push=16	pull=16
++		add	src, src, #2
++		b	25b
++
++36:		backward_copy_shift	push=24	pull=8
++		add	src, src, #1
++		b	25b
++
++		.size	bcopy, . - bcopy
++END(bcopy)
+
+--- /dev/null	2004-02-02 20:32:13.000000000 +0000
++++ sysdeps/arm/memcpy.S	2004-05-02 14:33:22.000000000 +0100
+@@ -0,0 +1,242 @@
++/*
++ *   Optimized memcpy implementation for ARM processors
++ *
++ *	Author: 	Nicolas Pitre
++ *	Created:	Dec 23, 2003
++ *	Copyright:	(C) MontaVista Software, Inc.
++ *
++ *   This file is free software; you can redistribute it and/or
++ *   modify it under the terms of the GNU Lesser General Public
++ *   License as published by the Free Software Foundation; either
++ *   version 2.1 of the License, or (at your option) any later version.
++ *
++ *   This file is distributed in the hope that it will be useful,
++ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ *   Lesser General Public License for more details.
++ */
++
++#include <sysdep.h>
++
++
++/*
++ * Endian independent macros for shifting bytes within registers.
++ */
++#ifndef __ARMEB__
++#define pull            lsr
++#define push            lsl
++#else
++#define pull            lsl
++#define push            lsr
++#endif
++
++/*
++ * Enable data preload for architectures that support it (ARMv5 and above)
++ */
++#if defined(__ARM_ARCH_5__) || \
++    defined(__ARM_ARCH_5T__) || \
++    defined(__ARM_ARCH_5TE__)
++#define PLD(code...)	code
++#else
++#define PLD(code...)
++#endif
++
++
++/* char * memcpy (char *dst, const char *src) */
++
++ENTRY(memcpy)
++		subs	r2, r2, #4
++		stmfd	sp!, {r0, r4, lr}
++		blt	7f
++		ands	ip, r0, #3
++	PLD(	pld	[r1, #0]		)
++		bne	8f
++		ands	ip, r1, #3
++		bne	9f
++
++1:		subs	r2, r2, #4
++		blt	6f
++		subs	r2, r2, #8
++		blt	5f
++		subs	r2, r2, #16
++		blt	4f
++
++	PLD(	subs	r2, r2, #65		)
++		stmfd	sp!, {r5 - r8}
++	PLD(	blt	3f			)
++	PLD(	pld	[r1, #32]		)
++
++	PLD(	@ cache alignment		)
++	PLD(	ands	ip, r1, #31		)
++	PLD(	pld	[r1, #64]		)
++	PLD(	beq	2f			)
++	PLD(	rsb	ip, ip, #32		)
++	PLD(	cmp	r2, ip			)
++	PLD(	pld	[r1, #96]		)
++	PLD(	blt	2f			)
++	PLD(	cmp	ip, #16			)
++	PLD(	sub	r2, r2, ip		)
++	PLD(	ldmgeia	r1!, {r3 - r6}		)
++	PLD(	stmgeia	r0!, {r3 - r6}		)
++	PLD(	beq	2f			)
++	PLD(	and	ip, ip, #15		)
++	PLD(	cmp	ip, #8			)
++	PLD(	ldr	r3, [r1], #4		)
++	PLD(	ldrge	r4, [r1], #4		)
++	PLD(	ldrgt	r5, [r1], #4		)
++	PLD(	str	r3, [r0], #4		)
++	PLD(	strge	r4, [r0], #4		)
++	PLD(	strgt	r5, [r0], #4		)
++
++2:	PLD(	pld	[r1, #96]		)
++3:		ldmia	r1!, {r3 - r8, ip, lr}
++		subs	r2, r2, #32
++		stmia	r0!, {r3 - r8, ip, lr}
++		bge	2b
++	PLD(	cmn	r2, #65			)
++	PLD(	bge	3b			)
++	PLD(	add	r2, r2, #65		)
++		tst	r2, #31
++		ldmfd	sp!, {r5 - r8}
++		ldmeqfd	sp!, {r0, r4, pc}
++
++		tst	r2, #16
++4:		ldmneia	r1!, {r3, r4, ip, lr}
++		stmneia	r0!, {r3, r4, ip, lr}
++
++		tst	r2, #8
++5:		ldmneia	r1!, {r3, r4}
++		stmneia	r0!, {r3, r4}
++
++		tst	r2, #4
++6:		ldrne	r3, [r1], #4
++		strne	r3, [r0], #4
++
++7:		ands	r2, r2, #3
++		ldmeqfd	sp!, {r0, r4, pc}
++
++		cmp	r2, #2
++		ldrb	r3, [r1], #1
++		ldrgeb	r4, [r1], #1
++		ldrgtb	ip, [r1]
++		strb	r3, [r0], #1
++		strgeb	r4, [r0], #1
++		strgtb	ip, [r0]
++		ldmfd	sp!, {r0, r4, pc}
++
++8:		rsb	ip, ip, #4
++		cmp	ip, #2
++		ldrb	r3, [r1], #1
++		ldrgeb	r4, [r1], #1
++		ldrgtb	lr, [r1], #1
++		strb	r3, [r0], #1
++		strgeb	r4, [r0], #1
++		strgtb	lr, [r0], #1
++		subs	r2, r2, ip
++		blt	7b
++		ands	ip, r1, #3
++		beq	1b
++
++9:		bic	r1, r1, #3
++		cmp	ip, #2
++		ldr	lr, [r1], #4
++		beq	17f
++		bgt	18f
++
++
++		.macro	forward_copy_shift pull push
++
++		cmp	r2, #12
++	PLD(	pld	[r1, #0]		)
++		blt	15f
++		subs	r2, r2, #28
++		stmfd	sp!, {r5 - r9}
++		blt	13f
++
++	PLD(	subs	r2, r2, #97		)
++	PLD(	blt	12f			)
++	PLD(	pld	[r1, #32]		)
++
++	PLD(	@ cache alignment		)
++	PLD(	rsb	ip, r1, #36		)
++	PLD(	pld	[r1, #64]		)
++	PLD(	ands	ip, ip, #31		)
++	PLD(	pld	[r1, #96]		)
++	PLD(	beq	11f			)
++	PLD(	cmp	r2, ip			)
++	PLD(	pld	[r1, #128]		)
++	PLD(	blt	11f			)
++	PLD(	sub	r2, r2, ip		)
++10:	PLD(	mov	r3, lr, pull #\pull	)
++	PLD(	ldr	lr, [r1], #4		)
++	PLD(	subs	ip, ip, #4		)
++	PLD(	orr	r3, r3, lr, push #\push	)
++	PLD(	str	r3, [r0], #4		)
++	PLD(	bgt	10b			)
++
++11:	PLD(	pld	[r1, #128]		)
++12:		mov	r3, lr, pull #\pull
++		ldmia	r1!, {r4 - r9, ip, lr}
++		subs	r2, r2, #32
++		orr	r3, r3, r4, push #\push
++		mov	r4, r4, pull #\pull
++		orr	r4, r4, r5, push #\push
++		mov	r5, r5, pull #\pull
++		orr	r5, r5, r6, push #\push
++		mov	r6, r6, pull #\pull
++		orr	r6, r6, r7, push #\push
++		mov	r7, r7, pull #\pull
++		orr	r7, r7, r8, push #\push
++		mov	r8, r8, pull #\pull
++		orr	r8, r8, r9, push #\push
++		mov	r9, r9, pull #\pull
++		orr	r9, r9, ip, push #\push
++		mov	ip, ip, pull #\pull
++		orr	ip, ip, lr, push #\push
++		stmia	r0!, {r3 - r9, ip}
++		bge	11b
++	PLD(	cmn	r2, #97			)
++	PLD(	bge	12b			)
++	PLD(	add	r2, r2, #97		)
++		cmn	r2, #16
++		blt	14f
++13:		mov	r3, lr, pull #\pull
++		ldmia	r1!, {r4 - r6, lr}
++		sub	r2, r2, #16
++		orr	r3, r3, r4, push #\push
++		mov	r4, r4, pull #\pull
++		orr	r4, r4, r5, push #\push
++		mov	r5, r5, pull #\pull
++		orr	r5, r5, r6, push #\push
++		mov	r6, r6, pull #\pull
++		orr	r6, r6, lr, push #\push
++		stmia	r0!, {r3 - r6}
++14:		adds	r2, r2, #28
++		ldmfd	sp!, {r5 - r9}
++		blt	16f
++15:		mov	r3, lr, pull #\pull
++		ldr	lr, [r1], #4
++		subs	r2, r2, #4
++		orr	r3, r3, lr, push #\push
++		str	r3, [r0], #4
++		bge	15b
++16:
++		.endm
++
++
++		forward_copy_shift	pull=8	push=24
++		sub	r1, r1, #3
++		b	7b
++
++17:		forward_copy_shift	pull=16	push=16
++		sub	r1, r1, #2
++		b	7b
++
++18:		forward_copy_shift	pull=24	push=8
++		sub	r1, r1, #1
++		b	7b
++
++		.size	memcpy, . - memcpy
++END(memcpy)
++libc_hidden_builtin_def (memcpy)
++
diff --git a/recipes/glibc/glibc-2.5/dl-cache-libcmp.patch b/recipes/glibc/glibc-2.5/dl-cache-libcmp.patch
new file mode 100644
index 0000000..2fedfa6
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/dl-cache-libcmp.patch
@@ -0,0 +1,10 @@
+--- glibc-2.4/elf/Versions.ark	2006-03-11 23:30:09.000000000 +0100
++++ glibc-2.4/elf/Versions	2006-03-11 23:31:44.000000000 +0100
+@@ -63,5 +63,7 @@
+     _dl_debug_state;
+     # Pointer protection.
+     __pointer_chk_guard;
++    # for ldconfig
++    _dl_cache_libcmp;
+   }
+ }
diff --git a/recipes/glibc/glibc-2.5/etc/ld.so.conf b/recipes/glibc/glibc-2.5/etc/ld.so.conf
new file mode 100644
index 0000000..46e06d3
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/etc/ld.so.conf
@@ -0,0 +1,2 @@
+/usr/local/lib
+
diff --git a/recipes/glibc/glibc-2.5/fhs-linux-paths.patch b/recipes/glibc/glibc-2.5/fhs-linux-paths.patch
new file mode 100644
index 0000000..1f32f6d
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/fhs-linux-paths.patch
@@ -0,0 +1,11 @@
+--- glibc-2.1.1/sysdeps/unix/sysv/linux/paths.h~	Thu May 27 13:16:33 1999
++++ glibc-2.1.1/sysdeps/unix/sysv/linux/paths.h	Thu May 27 13:17:55 1999
+@@ -71,7 +71,7 @@
+ /* Provide trailing slash, since mostly used for building pathnames. */
+ #define	_PATH_DEV	"/dev/"
+ #define	_PATH_TMP	"/tmp/"
+-#define	_PATH_VARDB	"/var/db/"
++#define	_PATH_VARDB	"/var/lib/misc/"
+ #define	_PATH_VARRUN	"/var/run/"
+ #define	_PATH_VARTMP	"/var/tmp/"
+ 
diff --git a/recipes/glibc/glibc-2.5/generate-supported.mk b/recipes/glibc/glibc-2.5/generate-supported.mk
new file mode 100644
index 0000000..d2a28c2
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/generate-supported.mk
@@ -0,0 +1,11 @@
+#!/usr/bin/make
+
+include $(IN)
+
+all:
+	rm -f $(OUT)
+	touch $(OUT)
+	for locale in $(SUPPORTED-LOCALES); do \
+		[ $$locale = true ] && continue; \
+		echo $$locale | sed 's,/, ,' >> $(OUT); \
+	done
diff --git a/recipes/glibc/glibc-2.5/generic-bits_select.h b/recipes/glibc/glibc-2.5/generic-bits_select.h
new file mode 100644
index 0000000..47e7ded
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/generic-bits_select.h
@@ -0,0 +1,35 @@
+/* Copyright (C) 1997, 1998, 2001 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+#ifndef _SYS_SELECT_H
+# error "Never use <bits/select.h> directly; include <sys/select.h> instead."
+#endif
+
+
+/* We don't use `memset' because this would require a prototype and
+   the array isn't too big.  */
+#define __FD_ZERO(s) \
+  do {									      \
+    unsigned int __i;							      \
+    fd_set *__arr = (s);						      \
+    for (__i = 0; __i < sizeof (fd_set) / sizeof (__fd_mask); ++__i)	      \
+      __FDS_BITS (__arr)[__i] = 0;					      \
+  } while (0)
+#define __FD_SET(d, s)     (__FDS_BITS (s)[__FDELT(d)] |= __FDMASK(d))
+#define __FD_CLR(d, s)     (__FDS_BITS (s)[__FDELT(d)] &= ~__FDMASK(d))
+#define __FD_ISSET(d, s)   ((__FDS_BITS (s)[__FDELT(d)] & __FDMASK(d)) != 0)
diff --git a/recipes/glibc/glibc-2.5/generic-bits_time.h b/recipes/glibc/glibc-2.5/generic-bits_time.h
new file mode 100644
index 0000000..b3184d1
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/generic-bits_time.h
@@ -0,0 +1,75 @@
+/* System-dependent timing definitions.  Generic version.
+   Copyright (C) 1996,1997,1999-2002,2003 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+/*
+ * Never include this file directly; use <time.h> instead.
+ */
+
+#ifndef __need_timeval
+# ifndef _BITS_TIME_H
+#  define _BITS_TIME_H	1
+
+/* ISO/IEC 9899:1990 7.12.1: <time.h>
+   The macro `CLOCKS_PER_SEC' is the number per second of the value
+   returned by the `clock' function. */
+/* CAE XSH, Issue 4, Version 2: <time.h>
+   The value of CLOCKS_PER_SEC is required to be 1 million on all
+   XSI-conformant systems. */
+#  define CLOCKS_PER_SEC  1000000l
+
+#  if !defined __STRICT_ANSI__ && !defined __USE_XOPEN2K
+/* Even though CLOCKS_PER_SEC has such a strange value CLK_TCK
+   presents the real value for clock ticks per second for the system.  */
+#   include <bits/types.h>
+extern long int __sysconf (int);
+#   define CLK_TCK ((__clock_t) __sysconf (2))	/* 2 is _SC_CLK_TCK */
+#  endif
+
+#  ifdef __USE_POSIX199309
+/* Identifier for system-wide realtime clock.  */
+#   define CLOCK_REALTIME		0
+/* Monotonic system-wide clock.  */
+#   define CLOCK_MONOTONIC		1
+/* High-resolution timer from the CPU.  */
+#   define CLOCK_PROCESS_CPUTIME_ID	2
+/* Thread-specific CPU-time clock.  */
+#   define CLOCK_THREAD_CPUTIME_ID	3
+
+/* Flag to indicate time is absolute.  */
+#   define TIMER_ABSTIME		1
+#  endif
+
+# endif	/* bits/time.h */
+#endif
+
+#ifdef __need_timeval
+# undef __need_timeval
+# ifndef _STRUCT_TIMEVAL
+#  define _STRUCT_TIMEVAL	1
+#  include <bits/types.h>
+
+/* A time value that is accurate to the nearest
+   microsecond but also has a range of years.  */
+struct timeval
+  {
+    __time_t tv_sec;		/* Seconds.  */
+    __suseconds_t tv_usec;	/* Microseconds.  */
+  };
+# endif	/* struct timeval */
+#endif	/* need timeval */
diff --git a/recipes/glibc/glibc-2.5/generic-bits_types.h b/recipes/glibc/glibc-2.5/generic-bits_types.h
new file mode 100644
index 0000000..65c8a9f
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/generic-bits_types.h
@@ -0,0 +1,200 @@
+/* bits/types.h -- definitions of __*_t types underlying *_t types.
+   Copyright (C) 2002, 2003, 2004, 2005 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+/*
+ * Never include this file directly; use <sys/types.h> instead.
+ */
+
+#ifndef	_BITS_TYPES_H
+#define	_BITS_TYPES_H	1
+
+#include <features.h>
+#include <bits/wordsize.h>
+
+#define __need_size_t
+#include <stddef.h>
+
+/* Convenience types.  */
+typedef unsigned char __u_char;
+typedef unsigned short int __u_short;
+typedef unsigned int __u_int;
+typedef unsigned long int __u_long;
+
+/* Fixed-size types, underlying types depend on word size and compiler.  */
+typedef signed char __int8_t;
+typedef unsigned char __uint8_t;
+typedef signed short int __int16_t;
+typedef unsigned short int __uint16_t;
+typedef signed int __int32_t;
+typedef unsigned int __uint32_t;
+#if __WORDSIZE == 64
+typedef signed long int __int64_t;
+typedef unsigned long int __uint64_t;
+#elif defined __GLIBC_HAVE_LONG_LONG
+__extension__ typedef signed long long int __int64_t;
+__extension__ typedef unsigned long long int __uint64_t;
+#endif
+
+/* quad_t is also 64 bits.  */
+#if __WORDSIZE == 64
+typedef long int __quad_t;
+typedef unsigned long int __u_quad_t;
+#elif defined __GLIBC_HAVE_LONG_LONG
+__extension__ typedef long long int __quad_t;
+__extension__ typedef unsigned long long int __u_quad_t;
+#else
+typedef struct
+{
+  long __val[2];
+} __quad_t;
+typedef struct
+{
+  __u_long __val[2];
+} __u_quad_t;
+#endif
+
+
+/* The machine-dependent file <bits/typesizes.h> defines __*_T_TYPE
+   macros for each of the OS types we define below.  The definitions
+   of those macros must use the following macros for underlying types.
+   We define __S<SIZE>_TYPE and __U<SIZE>_TYPE for the signed and unsigned
+   variants of each of the following integer types on this machine.
+
+	16		-- "natural" 16-bit type (always short)
+	32		-- "natural" 32-bit type (always int)
+	64		-- "natural" 64-bit type (long or long long)
+	LONG32		-- 32-bit type, traditionally long
+	QUAD		-- 64-bit type, always long long
+	WORD		-- natural type of __WORDSIZE bits (int or long)
+	LONGWORD	-- type of __WORDSIZE bits, traditionally long
+
+   We distinguish WORD/LONGWORD, 32/LONG32, and 64/QUAD so that the
+   conventional uses of `long' or `long long' type modifiers match the
+   types we define, even when a less-adorned type would be the same size.
+   This matters for (somewhat) portably writing printf/scanf formats for
+   these types, where using the appropriate l or ll format modifiers can
+   make the typedefs and the formats match up across all GNU platforms.  If
+   we used `long' when it's 64 bits where `long long' is expected, then the
+   compiler would warn about the formats not matching the argument types,
+   and the programmer changing them to shut up the compiler would break the
+   program's portability.
+
+   Here we assume what is presently the case in all the GCC configurations
+   we support: long long is always 64 bits, long is always word/address size,
+   and int is always 32 bits.  */
+
+#define	__S16_TYPE		short int
+#define __U16_TYPE		unsigned short int
+#define	__S32_TYPE		int
+#define __U32_TYPE		unsigned int
+#define __SLONGWORD_TYPE	long int
+#define __ULONGWORD_TYPE	unsigned long int
+#if __WORDSIZE == 32
+# define __SQUAD_TYPE		__quad_t
+# define __UQUAD_TYPE		__u_quad_t
+# define __SWORD_TYPE		int
+# define __UWORD_TYPE		unsigned int
+# define __SLONG32_TYPE		long int
+# define __ULONG32_TYPE		unsigned long int
+# define __S64_TYPE		__quad_t
+# define __U64_TYPE		__u_quad_t
+/* We want __extension__ before typedef's that use nonstandard base types
+   such as `long long' in C89 mode.  */
+# define __STD_TYPE		__extension__ typedef
+#elif __WORDSIZE == 64
+# define __SQUAD_TYPE		long int
+# define __UQUAD_TYPE		unsigned long int
+# define __SWORD_TYPE		long int
+# define __UWORD_TYPE		unsigned long int
+# define __SLONG32_TYPE		int
+# define __ULONG32_TYPE		unsigned int
+# define __S64_TYPE		long int
+# define __U64_TYPE		unsigned long int
+/* No need to mark the typedef with __extension__.   */
+# define __STD_TYPE		typedef
+#else
+# error
+#endif
+#include <bits/typesizes.h>	/* Defines __*_T_TYPE macros.  */
+
+
+__STD_TYPE __DEV_T_TYPE __dev_t;	/* Type of device numbers.  */
+__STD_TYPE __UID_T_TYPE __uid_t;	/* Type of user identifications.  */
+__STD_TYPE __GID_T_TYPE __gid_t;	/* Type of group identifications.  */
+__STD_TYPE __INO_T_TYPE __ino_t;	/* Type of file serial numbers.  */
+__STD_TYPE __INO64_T_TYPE __ino64_t;	/* Type of file serial numbers (LFS).*/
+__STD_TYPE __MODE_T_TYPE __mode_t;	/* Type of file attribute bitmasks.  */
+__STD_TYPE __NLINK_T_TYPE __nlink_t;	/* Type of file link counts.  */
+__STD_TYPE __OFF_T_TYPE __off_t;	/* Type of file sizes and offsets.  */
+__STD_TYPE __OFF64_T_TYPE __off64_t;	/* Type of file sizes and offsets (LFS).  */
+__STD_TYPE __PID_T_TYPE __pid_t;	/* Type of process identifications.  */
+__STD_TYPE __FSID_T_TYPE __fsid_t;	/* Type of file system IDs.  */
+__STD_TYPE __CLOCK_T_TYPE __clock_t;	/* Type of CPU usage counts.  */
+__STD_TYPE __RLIM_T_TYPE __rlim_t;	/* Type for resource measurement.  */
+__STD_TYPE __RLIM64_T_TYPE __rlim64_t;	/* Type for resource measurement (LFS).  */
+__STD_TYPE __ID_T_TYPE __id_t;		/* General type for IDs.  */
+__STD_TYPE __TIME_T_TYPE __time_t;	/* Seconds since the Epoch.  */
+__STD_TYPE __USECONDS_T_TYPE __useconds_t; /* Count of microseconds.  */
+__STD_TYPE __SUSECONDS_T_TYPE __suseconds_t; /* Signed count of microseconds.  */
+
+__STD_TYPE __DADDR_T_TYPE __daddr_t;	/* The type of a disk address.  */
+__STD_TYPE __SWBLK_T_TYPE __swblk_t;	/* Type of a swap block maybe?  */
+__STD_TYPE __KEY_T_TYPE __key_t;	/* Type of an IPC key.  */
+
+/* Clock ID used in clock and timer functions.  */
+__STD_TYPE __CLOCKID_T_TYPE __clockid_t;
+
+/* Timer ID returned by `timer_create'.  */
+__STD_TYPE __TIMER_T_TYPE __timer_t;
+
+/* Type to represent block size.  */
+__STD_TYPE __BLKSIZE_T_TYPE __blksize_t;
+
+/* Types from the Large File Support interface.  */
+
+/* Type to count number of disk blocks.  */
+__STD_TYPE __BLKCNT_T_TYPE __blkcnt_t;
+__STD_TYPE __BLKCNT64_T_TYPE __blkcnt64_t;
+
+/* Type to count file system blocks.  */
+__STD_TYPE __FSBLKCNT_T_TYPE __fsblkcnt_t;
+__STD_TYPE __FSBLKCNT64_T_TYPE __fsblkcnt64_t;
+
+/* Type to count file system nodes.  */
+__STD_TYPE __FSFILCNT_T_TYPE __fsfilcnt_t;
+__STD_TYPE __FSFILCNT64_T_TYPE __fsfilcnt64_t;
+
+__STD_TYPE __SSIZE_T_TYPE __ssize_t; /* Type of a byte count, or error.  */
+
+/* These few don't really vary by system, they always correspond
+   to one of the other defined types.  */
+typedef __off64_t __loff_t;	/* Type of file sizes and offsets (LFS).  */
+typedef __quad_t *__qaddr_t;
+typedef char *__caddr_t;
+
+/* Duplicates info from stdint.h but this is used in unistd.h.  */
+__STD_TYPE __SWORD_TYPE __intptr_t;
+
+/* Duplicate info from sys/socket.h.  */
+__STD_TYPE __U32_TYPE __socklen_t;
+
+
+#undef __STD_TYPE
+
+#endif /* bits/types.h */
diff --git a/recipes/glibc/glibc-2.5/generic-bits_typesizes.h b/recipes/glibc/glibc-2.5/generic-bits_typesizes.h
new file mode 100644
index 0000000..e9226c4
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/generic-bits_typesizes.h
@@ -0,0 +1,66 @@
+/* bits/typesizes.h -- underlying types for *_t.  Generic version.
+   Copyright (C) 2002, 2003 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+#ifndef _BITS_TYPES_H
+# error "Never include <bits/typesizes.h> directly; use <sys/types.h> instead."
+#endif
+
+#ifndef	_BITS_TYPESIZES_H
+#define	_BITS_TYPESIZES_H	1
+
+/* See <bits/types.h> for the meaning of these macros.  This file exists so
+   that <bits/types.h> need not vary across different GNU platforms.  */
+
+#define __DEV_T_TYPE		__UQUAD_TYPE
+#define __UID_T_TYPE		__U32_TYPE
+#define __GID_T_TYPE		__U32_TYPE
+#define __INO_T_TYPE		__ULONGWORD_TYPE
+#define __INO64_T_TYPE		__UQUAD_TYPE
+#define __MODE_T_TYPE		__U32_TYPE
+#define __NLINK_T_TYPE		__UWORD_TYPE
+#define __OFF_T_TYPE		__SLONGWORD_TYPE
+#define __OFF64_T_TYPE		__SQUAD_TYPE
+#define __PID_T_TYPE		__S32_TYPE
+#define __RLIM_T_TYPE		__ULONGWORD_TYPE
+#define __RLIM64_T_TYPE		__UQUAD_TYPE
+#define	__BLKCNT_T_TYPE		__SLONGWORD_TYPE
+#define	__BLKCNT64_T_TYPE	__SQUAD_TYPE
+#define	__FSBLKCNT_T_TYPE	__ULONGWORD_TYPE
+#define	__FSBLKCNT64_T_TYPE	__UQUAD_TYPE
+#define	__FSFILCNT_T_TYPE	__ULONGWORD_TYPE
+#define	__FSFILCNT64_T_TYPE	__UQUAD_TYPE
+#define	__ID_T_TYPE		__U32_TYPE
+#define __CLOCK_T_TYPE		__SLONGWORD_TYPE
+#define __TIME_T_TYPE		__SLONGWORD_TYPE
+#define __USECONDS_T_TYPE	__U32_TYPE
+#define __SUSECONDS_T_TYPE	__SLONGWORD_TYPE
+#define __DADDR_T_TYPE		__S32_TYPE
+#define __SWBLK_T_TYPE		__SLONGWORD_TYPE
+#define __KEY_T_TYPE		__S32_TYPE
+#define __CLOCKID_T_TYPE	__S32_TYPE
+#define __TIMER_T_TYPE		void *
+#define __BLKSIZE_T_TYPE	__SLONGWORD_TYPE
+#define __FSID_T_TYPE		struct { int __val[2]; }
+#define __SSIZE_T_TYPE		__SWORD_TYPE
+
+/* Number of descriptors that can fit in an `fd_set'.  */
+#define	__FD_SETSIZE		1024
+
+
+#endif /* bits/typesizes.h */
diff --git a/recipes/glibc/glibc-2.5/glibc-2.5-local-dynamic-resolvconf.patch b/recipes/glibc/glibc-2.5/glibc-2.5-local-dynamic-resolvconf.patch
new file mode 100644
index 0000000..e137287
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/glibc-2.5-local-dynamic-resolvconf.patch
@@ -0,0 +1,41 @@
+# All lines beginning with `# DP:' are a description of the patch.
+# DP: Description: allow dynamic long-running processes to
+# DP: re-read a dynamically updated resolv.conf on the fly
+# DP: Dpatch author: Adam Conrad <adconrad@ubuntu.com>
+# DP: Patch author: Thorsten Kukuk <kukuk@suse.de>
+# DP: Upstream status: Ubuntu-Specific
+# DP: Date: 2006-01-13 08:14:21 UTC
+
+Index: resolv/res_libc.c
+===================================================================
+--- resolv/res_libc.c.orig
++++ resolv/res_libc.c
+@@ -22,7 +22,7 @@
+ #include <arpa/nameser.h>
+ #include <resolv.h>
+ #include <bits/libc-lock.h>
+-
++#include <sys/stat.h>
+ 
+ /* The following bit is copied from res_data.c (where it is #ifdef'ed
+    out) since res_init() should go into libc.so but the rest of that
+@@ -94,8 +94,17 @@
+ int
+ __res_maybe_init (res_state resp, int preinit)
+ {
+-	if (resp->options & RES_INIT) {
+-		if (__res_initstamp != resp->_u._ext.initstamp) {
++  static time_t last_mtime;
++  struct stat statbuf;
++  int ret;
++
++		
++  if (resp->options & RES_INIT) {
++	ret = stat (_PATH_RESCONF, &statbuf);
++		if (__res_initstamp != resp->_u._ext.initstamp
++		  || (ret == 0) && (last_mtime != statbuf.st_mtime))
++		  {
++		        last_mtime = statbuf.st_mtime;
+ 			if (resp->nscount > 0) {
+ 				__res_iclose (resp, true);
+ 				return __res_vinit (resp, 1);
diff --git a/recipes/glibc/glibc-2.5/glibc-2.5-soft-fp-separate-strong-alias.patch b/recipes/glibc/glibc-2.5/glibc-2.5-soft-fp-separate-strong-alias.patch
new file mode 100644
index 0000000..e41c1b7
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/glibc-2.5-soft-fp-separate-strong-alias.patch
@@ -0,0 +1,205 @@
+Index: glibc-2.5-tls-ppc-04/soft-fp/eqdf2.c
+===================================================================
+--- glibc-2.5-tls-ppc-04.orig/soft-fp/eqdf2.c
++++ glibc-2.5-tls-ppc-04/soft-fp/eqdf2.c
+@@ -48,4 +48,3 @@ int __eqdf2(DFtype a, DFtype b)
+   return r;
+ }
+ 
+-strong_alias(__eqdf2, __nedf2);
+Index: glibc-2.5-tls-ppc-04/soft-fp/gedf2.c
+===================================================================
+--- glibc-2.5-tls-ppc-04.orig/soft-fp/gedf2.c
++++ glibc-2.5-tls-ppc-04/soft-fp/gedf2.c
+@@ -47,5 +47,3 @@ int __gedf2(DFtype a, DFtype b)
+ 
+   return r;
+ }
+-
+-strong_alias(__gedf2, __gtdf2);
+Index: glibc-2.5-tls-ppc-04/soft-fp/gtdf2.c
+===================================================================
+--- /dev/null
++++ glibc-2.5-tls-ppc-04/soft-fp/gtdf2.c
+@@ -0,0 +1,49 @@
++/* Software floating-point emulation.
++   Return 0 iff a == b, 1 iff a > b, -2 iff a ? b, -1 iff a < b
++   Copyright (C) 1997,1999,2006 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Contributed by Richard Henderson (rth@cygnus.com) and
++		  Jakub Jelinek (jj@ultra.linux.cz).
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   In addition to the permissions in the GNU Lesser General Public
++   License, the Free Software Foundation gives you unlimited
++   permission to link the compiled version of this file into
++   combinations with other programs, and to distribute those
++   combinations without any restriction coming from the use of this
++   file.  (The Lesser General Public License restrictions do apply in
++   other respects; for example, they cover modification of the file,
++   and distribution when not linked into a combine executable.)
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, 51 Franklin Street, Fifth Floor, Boston,
++   MA 02110-1301, USA.  */
++
++#include "soft-fp.h"
++#include "double.h"
++
++int __gtdf2(DFtype a, DFtype b)
++{
++  FP_DECL_EX;
++  FP_DECL_D(A); FP_DECL_D(B);
++  int r;
++
++  FP_UNPACK_RAW_D(A, a);
++  FP_UNPACK_RAW_D(B, b);
++  FP_CMP_D(r, A, B, -2);
++  if (r == -2 && (FP_ISSIGNAN_D(A) || FP_ISSIGNAN_D(B)))
++    FP_SET_EXCEPTION(FP_EX_INVALID);
++  FP_HANDLE_EXCEPTIONS;
++
++  return r;
++}
+Index: glibc-2.5-tls-ppc-04/soft-fp/ledf2.c
+===================================================================
+--- glibc-2.5-tls-ppc-04.orig/soft-fp/ledf2.c
++++ glibc-2.5-tls-ppc-04/soft-fp/ledf2.c
+@@ -48,4 +48,3 @@ int __ledf2(DFtype a, DFtype b)
+   return r;
+ }
+ 
+-strong_alias(__ledf2, __ltdf2);
+Index: glibc-2.5-tls-ppc-04/soft-fp/ltdf2.c
+===================================================================
+--- /dev/null
++++ glibc-2.5-tls-ppc-04/soft-fp/ltdf2.c
+@@ -0,0 +1,49 @@
++/* Software floating-point emulation.
++   Return 0 iff a == b, 1 iff a > b, 2 iff a ? b, -1 iff a < b
++   Copyright (C) 1997,1999,2006 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Contributed by Richard Henderson (rth@cygnus.com) and
++		  Jakub Jelinek (jj@ultra.linux.cz).
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   In addition to the permissions in the GNU Lesser General Public
++   License, the Free Software Foundation gives you unlimited
++   permission to link the compiled version of this file into
++   combinations with other programs, and to distribute those
++   combinations without any restriction coming from the use of this
++   file.  (The Lesser General Public License restrictions do apply in
++   other respects; for example, they cover modification of the file,
++   and distribution when not linked into a combine executable.)
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, 51 Franklin Street, Fifth Floor, Boston,
++   MA 02110-1301, USA.  */
++
++#include "soft-fp.h"
++#include "double.h"
++
++int __ltdf2(DFtype a, DFtype b)
++{
++  FP_DECL_EX;
++  FP_DECL_D(A); FP_DECL_D(B);
++  int r;
++
++  FP_UNPACK_RAW_D(A, a);
++  FP_UNPACK_RAW_D(B, b);
++  FP_CMP_D(r, A, B, 2);
++  if (r == 2 && (FP_ISSIGNAN_D(A) || FP_ISSIGNAN_D(B)))
++    FP_SET_EXCEPTION(FP_EX_INVALID);
++  FP_HANDLE_EXCEPTIONS;
++
++  return r;
++}
+Index: glibc-2.5-tls-ppc-04/soft-fp/nedf2.c
+===================================================================
+--- /dev/null
++++ glibc-2.5-tls-ppc-04/soft-fp/nedf2.c
+@@ -0,0 +1,49 @@
++/* Software floating-point emulation.
++   Return 0 iff a == b, 1 otherwise
++   Copyright (C) 1997,1999,2006 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Contributed by Richard Henderson (rth@cygnus.com) and
++		  Jakub Jelinek (jj@ultra.linux.cz).
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   In addition to the permissions in the GNU Lesser General Public
++   License, the Free Software Foundation gives you unlimited
++   permission to link the compiled version of this file into
++   combinations with other programs, and to distribute those
++   combinations without any restriction coming from the use of this
++   file.  (The Lesser General Public License restrictions do apply in
++   other respects; for example, they cover modification of the file,
++   and distribution when not linked into a combine executable.)
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, 51 Franklin Street, Fifth Floor, Boston,
++   MA 02110-1301, USA.  */
++
++#include "soft-fp.h"
++#include "double.h"
++
++int __nedf2(DFtype a, DFtype b)
++{
++  FP_DECL_EX;
++  FP_DECL_D(A); FP_DECL_D(B);
++  int r;
++
++  FP_UNPACK_RAW_D(A, a);
++  FP_UNPACK_RAW_D(B, b);
++  FP_CMP_EQ_D(r, A, B);
++  if (r && (FP_ISSIGNAN_D(A) || FP_ISSIGNAN_D(B)))
++    FP_SET_EXCEPTION(FP_EX_INVALID);
++  FP_HANDLE_EXCEPTIONS;
++
++  return r;
++}
+Index: glibc-2.5-tls-ppc-04/soft-fp/Makefile
+===================================================================
+--- glibc-2.5-tls-ppc-04.orig/soft-fp/Makefile
++++ glibc-2.5-tls-ppc-04/soft-fp/Makefile
+@@ -27,8 +27,8 @@ gcc-single-routines := negsf2 addsf3 sub
+ 	fixunssfdi floatdisf sqrtsf2 floatunsisf floatundisf \
+ 	fmasf4
+ 
+-gcc-double-routines := negdf2 adddf3 subdf3 muldf3 divdf3 eqdf2 \
+-	ledf2 gedf2 unorddf2 fixdfsi fixunsdfsi floatsidf fixdfdi        \
++gcc-double-routines := negdf2 adddf3 subdf3 muldf3 divdf3 eqdf2 nedf2 \
++	ledf2 ltdf2 gedf2 gtdf2 unorddf2 fixdfsi fixunsdfsi floatsidf fixdfdi \
+ 	fixunsdfdi floatdidf extendsfdf2 truncdfsf2 sqrtdf2 floatunsidf \
+ 	floatundidf fmadf4
+ 
diff --git a/recipes/glibc/glibc-2.5/glibc-2.6.1-use-short-for-fnstsw.patch b/recipes/glibc/glibc-2.5/glibc-2.6.1-use-short-for-fnstsw.patch
new file mode 100644
index 0000000..6979229
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/glibc-2.6.1-use-short-for-fnstsw.patch
@@ -0,0 +1,30 @@
+Source: http://sourceware.org/ml/libc-alpha/2008-01/msg00017.html
+
+I am checking this x86 assembler patch:
+
+http://sourceware.org/ml/binutils/2008-01/msg00148.html
+
+to check operand size. fnstsw stores 16bit into %ax. The upper
+16bit of %eax is unchanged.  The new assembler will disallow
+"fnstsw %eax".  Here is a patch for glibc.
+
+
+H.J.
+
+---
+ sysdeps/i386/fpu/ftestexcept.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: glibc-2.6.1/sysdeps/i386/fpu/ftestexcept.c
+===================================================================
+--- glibc-2.6.1.orig/sysdeps/i386/fpu/ftestexcept.c	2008-07-19 11:00:45.000000000 -0700
++++ glibc-2.6.1/sysdeps/i386/fpu/ftestexcept.c	2008-07-19 11:01:25.000000000 -0700
+@@ -26,7 +26,7 @@
+ int
+ fetestexcept (int excepts)
+ {
+-  int temp;
++  short temp;
+   int xtemp = 0;
+ 
+   /* Get current exceptions.  */
diff --git a/recipes/glibc/glibc-2.5/glibc-arm-no-asm-page.patch b/recipes/glibc/glibc-2.5/glibc-arm-no-asm-page.patch
new file mode 100644
index 0000000..7eb1717
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/glibc-arm-no-asm-page.patch
@@ -0,0 +1,15 @@
+http://sourceware.org/ml/libc-ports/2008-04/msg00005.html
+
+
+Index: glibc-2.6.1/ports/sysdeps/unix/sysv/linux/arm/ioperm.c
+===================================================================
+--- glibc-2.6.1.orig/ports/sysdeps/unix/sysv/linux/arm/ioperm.c	2008-09-12 18:08:18.000000000 -0700
++++ glibc-2.6.1/ports/sysdeps/unix/sysv/linux/arm/ioperm.c	2008-09-12 18:08:28.000000000 -0700
+@@ -45,7 +45,6 @@
+ #include <sys/mman.h>
+ 
+ #include <linux/version.h>
+-#include <asm/page.h>
+ #include <sys/sysctl.h>
+ 
+ #define PATH_ARM_SYSTYPE	"/etc/arm_systype"
diff --git a/recipes/glibc/glibc-2.5/ldd-unbash.patch b/recipes/glibc/glibc-2.5/ldd-unbash.patch
new file mode 100644
index 0000000..2fb8854
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/ldd-unbash.patch
@@ -0,0 +1,11 @@
+--- glibc-2.5/elf/ldd.bash.in.org	2006-04-30 16:06:20.000000000 +0000
++++ glibc-2.5/elf/ldd.bash.in	2007-03-30 19:18:57.000000000 +0000
+@@ -110,7 +110,7 @@
+ # environments where the executed program might not have permissions
+ # to write to the console/tty.  But only bash 3.x supports the pipefail
+ # option, and we don't bother to handle the case for older bash versions.
+-if set -o pipefail 2> /dev/null; then
++if false; then
+   try_trace() {
+     eval $add_env '"$@"' | cat
+   }
diff --git a/recipes/glibc/glibc-2.5/ldsocache-varrun.patch b/recipes/glibc/glibc-2.5/ldsocache-varrun.patch
new file mode 100644
index 0000000..9994d4f
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/ldsocache-varrun.patch
@@ -0,0 +1,18 @@
+This patch moves ld.so.cache from /etc to /var/run. This is for devices
+where /etc is JFFS2 or CRAMFS but /var is a ramdisk.
+
+#
+# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
+#
+
+--- libc/sysdeps/generic/dl-cache.h~ldsocache-varrun
++++ libc/sysdeps/generic/dl-cache.h
+@@ -29,7 +29,7 @@
+ #endif
+ 
+ #ifndef LD_SO_CACHE
+-# define LD_SO_CACHE SYSCONFDIR "/ld.so.cache"
++# define LD_SO_CACHE "/var/run/ld.so.cache"
+ #endif
+ 
+ #ifndef add_system_dir
diff --git a/recipes/glibc/glibc-2.5/no-z-defs.patch b/recipes/glibc/glibc-2.5/no-z-defs.patch
new file mode 100644
index 0000000..48c6a41
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/no-z-defs.patch
@@ -0,0 +1,9 @@
+Create a configparms file which disabled no-z-defs.
+This is required to build a working glibs for sh4,
+without there will be a lot linker errors during the build.
+
+diff -duNr libc.orig/configparms libc/configparms
+--- libc.orig/configparms	1970-01-01 10:00:00.000000000 +1000
++++ libc/configparms	2006-02-23 14:08:18.000000000 +1100
+@@ -0,0 +1 @@
++no-z-defs=yes
diff --git a/recipes/glibc/glibc-2.5/nptl-crosscompile.patch b/recipes/glibc/glibc-2.5/nptl-crosscompile.patch
new file mode 100644
index 0000000..18a46ad
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/nptl-crosscompile.patch
@@ -0,0 +1,26 @@
+--- glibc-2.4/nptl/sysdeps/pthread/configure.in.ark	2006-03-12 00:41:40.000000000 +0100
++++ glibc-2.4/nptl/sysdeps/pthread/configure.in	2006-03-12 00:44:08.000000000 +0100
+@@ -45,5 +45,6 @@
+     AC_MSG_ERROR([the compiler must support C cleanup handling])
+   fi
+ else
+-  AC_MSG_ERROR(forced unwind support is required)
++  AC_MSG_WARN([forced unwind support is required, can't be verified while crosscompiling])
++  AC_DEFINE(HAVE_FORCED_UNWIND)
+ fi
+--- glibc-2.4/nptl/sysdeps/pthread/configure.ark	2006-03-12 00:42:47.000000000 +0100
++++ glibc-2.4/nptl/sysdeps/pthread/configure	2006-03-12 00:44:08.000000000 +0100
+@@ -153,7 +153,10 @@
+    { (exit 1); exit 1; }; }
+   fi
+ else
+-  { { echo "$as_me:$LINENO: error: forced unwind support is required" >&5
+-echo "$as_me: error: forced unwind support is required" >&2;}
+-   { (exit 1); exit 1; }; }
++  { echo "$as_me:$LINENO: WARNING: forced unwind support is required, can't be verified while crosscompiling" >&5
++echo "$as_me: WARNING: forced unwind support is required, can't be verified while crosscompiling" >&2;}
++  cat >>confdefs.h <<\_ACEOF
++#define HAVE_FORCED_UNWIND 1
++_ACEOF
++
+ fi
diff --git a/recipes/glibc/glibc-2.5/powerpc-sqrt-hack.diff b/recipes/glibc/glibc-2.5/powerpc-sqrt-hack.diff
new file mode 100644
index 0000000..1046efb
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/powerpc-sqrt-hack.diff
@@ -0,0 +1,25 @@
+diff -Nurd ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c
+--- ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c	2006-04-14 07:44:30.000000000 +0200
++++ glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c	2006-12-08 12:53:32.202227000 +0100
+@@ -25,6 +25,9 @@
+ #include <sysdep.h>
+ #include <ldsodefs.h>
+ 
++#define __CPU_HAS_FSQRT ((GLRO(dl_hwcap) & PPC_FEATURE_64) != 0)
++
++
+ static const double almost_half = 0.5000000000000001;	/* 0.5 + 2^-53 */
+ static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
+ static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
+diff -Nurd ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c
+--- ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c	2006-04-14 07:44:30.000000000 +0200
++++ glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c	2006-12-08 12:53:36.992227000 +0100
+@@ -25,6 +25,8 @@
+ #include <sysdep.h>
+ #include <ldsodefs.h>
+ 
++#define __CPU_HAS_FSQRT ((GLRO(dl_hwcap) & PPC_FEATURE_64) != 0)
++
+ static const float almost_half = 0.50000006;	/* 0.5 + 2^-24 */
+ static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
+ static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
diff --git a/recipes/glibc/glibc-2.5/ppc-ld-nofpu-20070104.patch b/recipes/glibc/glibc-2.5/ppc-ld-nofpu-20070104.patch
new file mode 100644
index 0000000..d5b1d31
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/ppc-ld-nofpu-20070104.patch
@@ -0,0 +1,190 @@
+2007-01-12  Steven Munroe  <sjmunroe@us.ibm.com>
+	    Joe Kerian  <jkerian@us.us.ibm.com>
+
+	[BZ #2749]
+	* sysdeps/ieee754/ldbl-128ibm/s_copysignl.c:
+	Include <math_ldbl_opt.h>.
+	Remove weak_alias.  Use long_double_symbol macro.
+	(__copysignl): Use signbit() for comparison.
+	* sysdeps/ieee754/ldbl-128ibm/s_fabsl.c: Correct parms for
+	SET_LDOUBLE_WORDS64.
+
+	[BZ #2423, #2749]
+	* sysdeps/ieee754/ldbl-128ibm/s_ceill.c: Don't include <fenv_libc.h>.
+	(__ceill): Remove calls to fegetround(), fesetround().
+	* sysdeps/ieee754/ldbl-128ibm/s_floorl.c: Likewise.
+	* sysdeps/ieee754/ldbl-128ibm/s_roundl.c: Likewise.
+	* sysdeps/ieee754/ldbl-128ibm/s_truncl.c: Likewise.
+
+diff -urN libc25-cvstip-20070104/sysdeps/ieee754/ldbl-128ibm/s_ceill.c libc24/sysdeps/ieee754/ldbl-128ibm/s_ceill.c
+--- libc25-cvstip-20070104/sysdeps/ieee754/ldbl-128ibm/s_ceill.c	2006-03-16 05:46:37.000000000 -0600
++++ libc24/sysdeps/ieee754/ldbl-128ibm/s_ceill.c	2007-01-11 10:30:12.856890432 -0600
+@@ -19,7 +19,6 @@
+    02111-1307 USA.  */
+ 
+ #include <math.h>
+-#include <fenv_libc.h>
+ #include <math_ldbl_opt.h>
+ #include <float.h>
+ #include <ieee754.h>
+@@ -44,11 +43,9 @@
+ 					     __builtin_inf ()), 1))
+     {
+       double orig_xh;
+-      int save_round = fegetround ();
+ 
+       /* Long double arithmetic, including the canonicalisation below,
+ 	 only works in round-to-nearest mode.  */
+-      fesetround (FE_TONEAREST);
+ 
+       /* Convert the high double to integer.  */
+       orig_xh = xh;
+@@ -81,8 +78,6 @@
+       /* Ensure we return -0 rather than +0 when appropriate.  */
+       if (orig_xh < 0.0)
+ 	xh = -__builtin_fabs (xh);
+-
+-      fesetround (save_round);
+     }
+ 
+   return ldbl_pack (xh, xl);
+diff -urN libc25-cvstip-20070104/sysdeps/ieee754/ldbl-128ibm/s_copysignl.c libc24/sysdeps/ieee754/ldbl-128ibm/s_copysignl.c
+--- libc25-cvstip-20070104/sysdeps/ieee754/ldbl-128ibm/s_copysignl.c	2006-01-27 18:07:25.000000000 -0600
++++ libc24/sysdeps/ieee754/ldbl-128ibm/s_copysignl.c	2007-01-11 10:30:12.857890280 -0600
+@@ -25,6 +25,7 @@
+ 
+ #include "math.h"
+ #include "math_private.h"
++#include <math_ldbl_opt.h>
+ 
+ #ifdef __STDC__
+ 	long double __copysignl(long double x, long double y)
+@@ -33,13 +34,13 @@
+ 	long double x,y;
+ #endif
+ {
+-  if (y < 0.0)
+-    {
+-      if (x >= 0.0)
+-	x = -x;
+-    }
+-  else if (x < 0.0)
++  if( signbit(x) != signbit(y) )
+     x = -x;
+   return x;
+ }
+-weak_alias (__copysignl, copysignl)
++
++#ifdef IS_IN_libm
++long_double_symbol (libm, __copysignl, copysignl);
++#else
++long_double_symbol (libc, __copysignl, copysignl);
++#endif
+diff -urN libc25-cvstip-20070104/sysdeps/ieee754/ldbl-128ibm/s_fabsl.c libc24/sysdeps/ieee754/ldbl-128ibm/s_fabsl.c
+--- libc25-cvstip-20070104/sysdeps/ieee754/ldbl-128ibm/s_fabsl.c	2006-01-27 18:07:25.000000000 -0600
++++ libc24/sysdeps/ieee754/ldbl-128ibm/s_fabsl.c	2007-01-11 10:30:12.857890280 -0600
+@@ -37,7 +37,7 @@
+ 	GET_LDOUBLE_WORDS64(hx,lx,x);
+ 	lx = lx ^ ( hx & 0x8000000000000000LL );
+ 	hx = hx & 0x7fffffffffffffffLL;
+-	SET_LDOUBLE_WORDS64(hx,lx,x);
++	SET_LDOUBLE_WORDS64(x,hx,lx);
+         return x;
+ }
+ long_double_symbol (libm, __fabsl, fabsl);
+diff -urN libc25-cvstip-20070104/sysdeps/ieee754/ldbl-128ibm/s_floorl.c libc24/sysdeps/ieee754/ldbl-128ibm/s_floorl.c
+--- libc25-cvstip-20070104/sysdeps/ieee754/ldbl-128ibm/s_floorl.c	2006-03-16 05:46:37.000000000 -0600
++++ libc24/sysdeps/ieee754/ldbl-128ibm/s_floorl.c	2007-01-11 10:30:12.858890128 -0600
+@@ -19,7 +19,6 @@
+    02111-1307 USA.  */
+ 
+ #include <math.h>
+-#include <fenv_libc.h>
+ #include <math_ldbl_opt.h>
+ #include <float.h>
+ #include <ieee754.h>
+@@ -43,11 +42,8 @@
+ 			&& __builtin_isless (__builtin_fabs (xh),
+ 					     __builtin_inf ()), 1))
+     {
+-      int save_round = fegetround ();
+-
+       /* Long double arithmetic, including the canonicalisation below,
+ 	 only works in round-to-nearest mode.  */
+-      fesetround (FE_TONEAREST);
+ 
+       /* Convert the high double to integer.  */
+       hi = ldbl_nearbyint (xh);
+@@ -75,8 +71,6 @@
+       xh = hi;
+       xl = lo;
+       ldbl_canonicalize (&xh, &xl);
+-
+-      fesetround (save_round);
+     }
+ 
+   return ldbl_pack (xh, xl);
+diff -urN libc25-cvstip-20070104/sysdeps/ieee754/ldbl-128ibm/s_roundl.c libc24/sysdeps/ieee754/ldbl-128ibm/s_roundl.c
+--- libc25-cvstip-20070104/sysdeps/ieee754/ldbl-128ibm/s_roundl.c	2006-03-16 05:46:37.000000000 -0600
++++ libc24/sysdeps/ieee754/ldbl-128ibm/s_roundl.c	2007-01-11 10:30:12.859889976 -0600
+@@ -22,7 +22,6 @@
+    when it's coded in C.  */
+ 
+ #include <math.h>
+-#include <fenv_libc.h>
+ #include <math_ldbl_opt.h>
+ #include <float.h>
+ #include <ieee754.h>
+@@ -47,11 +46,9 @@
+ 					     __builtin_inf ()), 1))
+     {
+       double orig_xh;
+-      int save_round = fegetround ();
+ 
+       /* Long double arithmetic, including the canonicalisation below,
+ 	 only works in round-to-nearest mode.  */
+-      fesetround (FE_TONEAREST);
+ 
+       /* Convert the high double to integer.  */
+       orig_xh = xh;
+@@ -88,8 +85,6 @@
+       xh = hi;
+       xl = lo;
+       ldbl_canonicalize (&xh, &xl);
+-
+-      fesetround (save_round);
+     }
+ 
+   return ldbl_pack (xh, xl);
+diff -urN libc25-cvstip-20070104/sysdeps/ieee754/ldbl-128ibm/s_truncl.c libc24/sysdeps/ieee754/ldbl-128ibm/s_truncl.c
+--- libc25-cvstip-20070104/sysdeps/ieee754/ldbl-128ibm/s_truncl.c	2006-03-16 05:46:37.000000000 -0600
++++ libc24/sysdeps/ieee754/ldbl-128ibm/s_truncl.c	2007-01-11 10:30:12.860889824 -0600
+@@ -22,7 +22,6 @@
+    when it's coded in C.  */
+ 
+ #include <math.h>
+-#include <fenv_libc.h>
+ #include <math_ldbl_opt.h>
+ #include <float.h>
+ #include <ieee754.h>
+@@ -47,11 +46,9 @@
+ 					     __builtin_inf ()), 1))
+     {
+       double orig_xh;
+-      int save_round = fegetround ();
+ 
+       /* Long double arithmetic, including the canonicalisation below,
+ 	 only works in round-to-nearest mode.  */
+-      fesetround (FE_TONEAREST);
+ 
+       /* Convert the high double to integer.  */
+       orig_xh = xh;
+@@ -92,8 +89,6 @@
+       /* Ensure we return -0 rather than +0 when appropriate.  */
+       if (orig_xh < 0.0)
+ 	xh = -__builtin_fabs (xh);
+-
+-      fesetround (save_round);
+     }
+ 
+   return ldbl_pack (xh, xl);
diff --git a/recipes/glibc/glibc-2.5/ppc-ports-ld-nofpu-20070114.patch b/recipes/glibc/glibc-2.5/ppc-ports-ld-nofpu-20070114.patch
new file mode 100644
index 0000000..b4d9959
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/ppc-ports-ld-nofpu-20070114.patch
@@ -0,0 +1,38 @@
+2007-01-14  Steven Munroe  <sjmunroe@us.ibm.com>
+
+	[BZ #2749]
+	* sysdeps/powerpc/nofpu/fenv_libc.h: New file.
+
+diff -urN dummy-libc/ports-cvstip-20070104/sysdeps/powerpc/nofpu/fenv_libc.h libc25/ports/sysdeps/powerpc/nofpu/fenv_libc.h
+--- dummy-libc/ports-cvstip-20070104/sysdeps/powerpc/nofpu/fenv_libc.h	Wed Dec 31 18:00:00 1969
++++ libc25/ports/sysdeps/powerpc/nofpu/fenv_libc.h	Thu Jan 11 11:00:53 2007
+@@ -0,0 +1,29 @@
++/* Internal libc stuff for floating point environment routines.
++   Copyright (C) 2007 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#ifndef _FENV_LIBC_H
++#define _FENV_LIBC_H	1
++
++/* fenv_libc.h is used in libm implementations of ldbl-128ibm.  So we
++   need this version in the soft-fp to at minimum include fenv.h to
++   get the fegetround definition.  */
++
++#include <fenv.h>
++ 
++#endif /* fenv_libc.h */
diff --git a/recipes/glibc/glibc-2.5/ppc-sfp-machine.patch b/recipes/glibc/glibc-2.5/ppc-sfp-machine.patch
new file mode 100644
index 0000000..6171a03
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/ppc-sfp-machine.patch
@@ -0,0 +1,297 @@
+This patch combined with the other patches from Bugzilla #2749 allows
+powerpc32 to build. The Subdirs pulls in the soft-fp directory from
+libc, The Implies pulls in the ports powerpc/soft-fp directory which
+includes sfp-machine.h
+
+The get/set/swapcontext changes overide the common implimentation in
+libc to avoid using hardware FP instructions.
+
+
+
+2006-06-01  Steven Munroe  <sjmunroe@us.ibm.com>
+
+	[BZ #2749]
+	* sysdeps/powerpc/soft-fp/Subdirs: New file.
+	* sysdeps/powerpc/soft-fp/sfp-machine.h: New file.
+	* sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/Implies: New file.
+
+	* sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/getcontext.S:
+	New file.
+	* sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/setcontext.S:
+	New file.
+	* sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/swapcontext.S:
+	New file.
+
+diff -urN dummy-libc/ports-cvstip-20060512/sysdeps/powerpc/soft-fp/Subdirs 
+libc24/ports/sysdeps/powerpc/soft-fp/Subdirs
+--- dummy-libc/ports-cvstip-20060512/sysdeps/powerpc/soft-fp/Subdirs	Wed Dec 31 18:00:00 1969
++++ libc24/ports/sysdeps/powerpc/soft-fp/Subdirs	Wed May 31 16:58:44 2006
+@@ -0,0 +1,1 @@
++soft-fp
+diff -urN dummy-libc/ports-cvstip-20060512/sysdeps/powerpc/soft-fp/sfp-machine.h 
+libc24/ports/sysdeps/powerpc/soft-fp/sfp-machine.h
+--- dummy-libc/ports-cvstip-20060512/sysdeps/powerpc/soft-fp/sfp-machine.h	Wed Dec 31 18:00:00 1969
++++ libc24/ports/sysdeps/powerpc/soft-fp/sfp-machine.h	Wed May 31 13:57:07 2006
+@@ -0,0 +1,63 @@
++#define _FP_W_TYPE_SIZE		32
++#define _FP_W_TYPE		unsigned long
++#define _FP_WS_TYPE		signed long
++#define _FP_I_TYPE		long
++
++#define _FP_MUL_MEAT_S(R,X,Y)				\
++  _FP_MUL_MEAT_1_wide(_FP_WFRACBITS_S,R,X,Y,umul_ppmm)
++#define _FP_MUL_MEAT_D(R,X,Y)				\
++  _FP_MUL_MEAT_2_wide(_FP_WFRACBITS_D,R,X,Y,umul_ppmm)
++#define _FP_MUL_MEAT_Q(R,X,Y)				\
++  _FP_MUL_MEAT_4_wide(_FP_WFRACBITS_Q,R,X,Y,umul_ppmm)
++
++#define _FP_DIV_MEAT_S(R,X,Y)	_FP_DIV_MEAT_1_loop(S,R,X,Y)
++#define _FP_DIV_MEAT_D(R,X,Y)	_FP_DIV_MEAT_2_udiv(D,R,X,Y)
++#define _FP_DIV_MEAT_Q(R,X,Y)	_FP_DIV_MEAT_4_udiv(Q,R,X,Y)
++
++#define _FP_NANFRAC_S		((_FP_QNANBIT_S << 1) - 1)
++#define _FP_NANFRAC_D		((_FP_QNANBIT_D << 1) - 1), -1
++#define _FP_NANFRAC_Q		((_FP_QNANBIT_Q << 1) - 1), -1, -1, -1
++#define _FP_NANSIGN_S		0
++#define _FP_NANSIGN_D		0
++#define _FP_NANSIGN_Q		0
++
++#define _FP_KEEPNANFRACP 1
++
++/* Someone please check this.  */
++#define _FP_CHOOSENAN(fs, wc, R, X, Y, OP)			\
++  do {								\
++    if ((_FP_FRAC_HIGH_RAW_##fs(X) & _FP_QNANBIT_##fs)		\
++	&& !(_FP_FRAC_HIGH_RAW_##fs(Y) & _FP_QNANBIT_##fs))	\
++      {								\
++	R##_s = Y##_s;						\
++	_FP_FRAC_COPY_##wc(R,Y);				\
++      }								\
++    else							\
++      {								\
++	R##_s = X##_s;						\
++	_FP_FRAC_COPY_##wc(R,X);				\
++      }								\
++    R##_c = FP_CLS_NAN;						\
++  } while (0)
++
++/* Exception flags.  We use the bit positions of the appropriate bits
++   in the FPSCR, which also correspond to the FE_* bits.  This makes
++   everything easier ;-).  */
++#define FP_EX_INVALID         (1 << (31 - 2))
++#define FP_EX_OVERFLOW        (1 << (31 - 3))
++#define FP_EX_UNDERFLOW       (1 << (31 - 4))
++#define FP_EX_DENORM          FP_EX_UNDERFLOW
++#define FP_EX_DIVZERO         (1 << (31 - 5))
++#define FP_EX_INEXACT         (1 << (31 - 6))
++
++#define FP_HANDLE_EXCEPTIONS  __simulate_exceptions (_fex)
++#define FP_ROUNDMODE          __sim_round_mode
++
++extern int __sim_exceptions;
++libc_hidden_proto (__sim_exceptions);
++extern int __sim_disabled_exceptions;
++libc_hidden_proto (__sim_disabled_exceptions);
++extern int __sim_round_mode;
++libc_hidden_proto (__sim_round_mode);
++
++extern void __simulate_exceptions (int x) attribute_hidden;
+diff -urN dummy-libc/ports-cvstip-20060512/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/Implies 
+libc24/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/Implies
+--- dummy-libc/ports-cvstip-20060512/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/Implies	Wed Dec 31 18:00:00 1969
++++ libc24/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/Implies	Wed May 31 15:46:44 2006
+@@ -0,0 +1,1 @@
++powerpc/soft-fp
+diff -urN dummy-libc/ports-cvstip-20060512/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/getcontext.S 
+libc24/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/getcontext.S
+--- dummy-libc/ports-cvstip-20060512/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/getcontext.S	Wed Dec 31 18:00:00 1969
++++ libc24/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/getcontext.S	Thu Jun 01 15:31:03 2006
+@@ -0,0 +1,59 @@
++/* Save current context.
++   Copyright (C) 2002, 2004, 2005 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <sysdep.h>
++#include <rtld-global-offsets.h>
++#include <shlib-compat.h>
++
++#define __ASSEMBLY__
++#include <asm/ptrace.h>
++#include "ucontext_i.h"
++
++#define __CONTEXT_FUNC_NAME __getcontext
++#undef __CONTEXT_ENABLE_FPRS
++#undef __CONTEXT_ENABLE_VRS
++
++#include "getcontext-common.S"
++
++versioned_symbol (libc, __getcontext, getcontext, GLIBC_2_3_4)
++
++#if SHLIB_COMPAT (libc, GLIBC_2_3_3, GLIBC_2_3_4)
++
++/* For the nofpu case the old/new versions are the same function.  */  
++strong_alias (__getcontext, __novec_getcontext)
++
++compat_symbol (libc, __novec_getcontext, getcontext, GLIBC_2_3_3)
++
++#endif
++
++#if SHLIB_COMPAT (libc, GLIBC_2_1, GLIBC_2_3_3)
++
++#define _ERRNO_H	1
++#include <bits/errno.h>
++
++	compat_text_section
++ENTRY (__getcontext_stub)
++	li	r3,ENOSYS
++	b	__syscall_error@local
++END (__getcontext_stub)
++	.previous
++
++compat_symbol (libc, __getcontext_stub, getcontext, GLIBC_2_1)
++
++#endif
+diff -urN dummy-libc/ports-cvstip-20060512/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/setcontext.S 
+libc24/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/setcontext.S
+--- dummy-libc/ports-cvstip-20060512/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/setcontext.S	Wed Dec 31 18:00:00 1969
++++ libc24/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/setcontext.S	Thu Jun 01 15:31:03 2006
+@@ -0,0 +1,59 @@
++/* Jump to a new context.
++   Copyright (C) 2002, 2004, 2005 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <sysdep.h>
++#include <rtld-global-offsets.h>
++#include <shlib-compat.h>
++
++#define __ASSEMBLY__
++#include <asm/ptrace.h>
++#include "ucontext_i.h"
++
++#define __CONTEXT_FUNC_NAME __setcontext
++#undef __CONTEXT_ENABLE_FPRS
++#undef __CONTEXT_ENABLE_VRS
++
++#include "setcontext-common.S"
++
++versioned_symbol (libc, __setcontext, setcontext, GLIBC_2_3_4)
++
++#if SHLIB_COMPAT (libc, GLIBC_2_3_3, GLIBC_2_3_4)
++
++/* For the nofpu case the old/new versions are the same function.  */  
++strong_alias (__setcontext, __novec_setcontext)
++
++compat_symbol (libc, __novec_setcontext, setcontext, GLIBC_2_3_3)
++
++#endif
++
++#if SHLIB_COMPAT (libc, GLIBC_2_0, GLIBC_2_3_3)
++
++#define _ERRNO_H	1
++#include <bits/errno.h>
++
++	compat_text_section
++ENTRY (__setcontext_stub)
++	li	r3,ENOSYS
++	b	__syscall_error@local
++END (__setcontext_stub)
++	.previous
++
++compat_symbol (libc, __setcontext_stub, setcontext, GLIBC_2_0)
++
++#endif
+diff -urN dummy-libc/ports-cvstip-20060512/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/swapcontext.S 
+libc24/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/swapcontext.S
+--- dummy-libc/ports-cvstip-20060512/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/swapcontext.S	Wed Dec 31 18:00:00 1969
++++ libc24/ports/sysdeps/unix/sysv/linux/powerpc/powerpc32/nofpu/swapcontext.S	Thu Jun 01 15:31:03 2006
+@@ -0,0 +1,59 @@
++/* Save current context and jump to a new context.
++   Copyright (C) 2002, 2004, 2005 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <sysdep.h>
++#include <rtld-global-offsets.h>
++#include <shlib-compat.h>
++
++#define __ASSEMBLY__
++#include <asm/ptrace.h>
++#include "ucontext_i.h"
++
++#define __CONTEXT_FUNC_NAME __swapcontext
++#undef __CONTEXT_ENABLE_FPRS
++#undef __CONTEXT_ENABLE_VRS
++
++# include "swapcontext-common.S"
++
++versioned_symbol (libc, __swapcontext, swapcontext, GLIBC_2_3_4)
++
++#if SHLIB_COMPAT (libc, GLIBC_2_3_3, GLIBC_2_3_4)
++
++/* For the nofpu case the old/new versions are the same function.  */  
++strong_alias (__swapcontext, __novec_swapcontext)
++
++compat_symbol (libc, __novec_swapcontext, swapcontext, GLIBC_2_3_3)
++
++#endif
++
++#if SHLIB_COMPAT (libc, GLIBC_2_1, GLIBC_2_3_3)
++
++#define _ERRNO_H	1
++#include <bits/errno.h>
++
++	compat_text_section
++ENTRY (__swapcontext_stub)
++	li	r3,ENOSYS
++	b	__syscall_error@local
++END (__swapcontext_stub)
++	.previous
++
++compat_symbol (libc, __swapcontext_stub, swapcontext, GLIBC_2_1)
++
++#endif
+
diff --git a/recipes/glibc/glibc-2.5/ppc-soft-fp-20070115.patch b/recipes/glibc/glibc-2.5/ppc-soft-fp-20070115.patch
new file mode 100644
index 0000000..a84bc2f
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/ppc-soft-fp-20070115.patch
@@ -0,0 +1,182 @@
+2007-01-14  Steven Munroe  <sjmunroe@us.ibm.com>
+	    Joe Kerian  <jkerian@us.us.ibm.com>
+
+	[BZ #2749]
+	* soft-fp/op-4.h (__FP_FRAC_SUB_3, __FP_FRAC_SUB_4): Correct borrow
+	handling for high words.
+	* soft-fp/op-common.h (_FP_OVERFLOW_SEMIRAW): Always set inexact
+	and overflow for infinity.
+	(_FP_PACK_SEMIRAW): Update comment.  Do not round if NaN or Inf.
+
+	* math/basic-test.c (truncdfsf_test): New function.
+	[!NO_LONG_DOUBLE] (trunctfsf_test): New function.
+	[!NO_LONG_DOUBLE] (trunctfdf_test): New function.
+	Change main() to do_test. Define TEST_FUNCTION. Include test-skeleton.c. 
+	(do_test): Run new tests.
+
+2007-01-15  Jakub Jelinek  <jakub@redhat.com>
+
+	* soft-fp/op-common.h (FP_TRUNC): When truncating a NaN, clear
+	workbits in semi-raw fraction.
+
+
+diff -urN libc25-cvstip-20070104/math/basic-test.c libc24/math/basic-test.c
+--- libc25-cvstip-20070104/math/basic-test.c	2001-07-05 23:55:35.000000000 -0500
++++ libc24/math/basic-test.c	2007-01-15 11:41:17.260963824 -0600
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 1999 Free Software Foundation, Inc.
++/* Copyright (C) 1999, 2007 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+    Contributed by Andreas Jaeger <aj@suse.de>, 1999.
+ 
+@@ -107,17 +107,90 @@
+ TEST_FUNC (double_test, double, nan, DBL_EPSILON, HUGE_VAL)
+ #ifndef NO_LONG_DOUBLE
+ TEST_FUNC (ldouble_test, long double, nanl, LDBL_EPSILON, HUGE_VALL)
++
++void
++trunctfsf_test(void)
++{
++  volatile long double Inf_var, NaN_var, zero_var, one_var;
++  float x1, x2;
++
++  zero_var = 0.0;
++  one_var = 1.0;
++  NaN_var = zero_var/zero_var;
++  Inf_var = one_var / zero_var;
++
++  (void) &zero_var;
++  (void) &one_var;
++  (void) &NaN_var;
++  (void) &Inf_var;
++
++  x1 = (float)NaN_var;
++  check (" float x = (float)((long double)NaN))", isnan (x1) != 0);
++  x2 = (float)Inf_var;
++  check (" float x = (float)((long double)Inf))", isinf (x2) != 0);
++}
++
++void
++trunctfdf_test(void)
++{
++  volatile long double Inf_var, NaN_var, zero_var, one_var;
++  double x1, x2;
++
++  zero_var = 0.0;
++  one_var = 1.0;
++  NaN_var = zero_var/zero_var;
++  Inf_var = one_var / zero_var;
++
++  (void) &zero_var;
++  (void) &one_var;
++  (void) &NaN_var;
++  (void) &Inf_var;
++
++  x1 = (double)NaN_var;
++  check (" double x = (double)((long double)NaN))", isnan (x1) != 0);
++  x2 = (double)Inf_var;
++  check (" double x = (double)((long double)Inf))", isinf (x2) != 0);
++}
++
+ #endif
+ 
++void
++truncdfsf_test(void)
++{
++  volatile double Inf_var, NaN_var, zero_var, one_var;
++  float x1, x2;
++
++  zero_var = 0.0;
++  one_var = 1.0;
++  NaN_var = zero_var/zero_var;
++  Inf_var = one_var / zero_var;
++
++  (void) &zero_var;
++  (void) &one_var;
++  (void) &NaN_var;
++  (void) &Inf_var;
++
++  x1 = (float)NaN_var;
++  check (" float x = (float)((double)NaN))", isnan (x1) != 0);
++  x2 = (float)Inf_var;
++  check (" float x = (float)((double)Inf))", isinf (x2) != 0);
++}
++
+ int
+-main (void)
++do_test (void)
+ {
+   float_test ();
+   double_test ();
++  truncdfsf_test();
+ 
+ #ifndef NO_LONG_DOUBLE
+   ldouble_test ();
++  trunctfsf_test();
++  trunctfdf_test();
+ #endif
+ 
+   return errors != 0;
+ }
++
++#define TEST_FUNCTION do_test ()
++#include "../test-skeleton.c"
+diff -urN libc25-cvstip-20070104/soft-fp/op-4.h libc24/soft-fp/op-4.h
+--- libc25-cvstip-20070104/soft-fp/op-4.h	2006-04-04 03:24:47.000000000 -0500
++++ libc24/soft-fp/op-4.h	2007-01-11 11:00:53.000000000 -0600
+@@ -564,7 +564,7 @@
+     r1 = x1 - y1;						\
+     _c2 = r1 > x1;						\
+     r1 -= _c1;							\
+-    _c2 |= r1 > _c1;						\
++    _c2 |= _c1 && (y1 == x1);					\
+     r2 = x2 - y2 - _c2;						\
+   } while (0)
+ #endif
+@@ -578,11 +578,11 @@
+     r1 = x1 - y1;						\
+     _c2 = r1 > x1;						\
+     r1 -= _c1;							\
+-    _c2 |= r1 > _c1;						\
++    _c2 |= _c1 && (y1 == x1);					\
+     r2 = x2 - y2;						\
+     _c3 = r2 > x2;						\
+     r2 -= _c2;							\
+-    _c3 |= r2 > _c2;						\
++    _c3 |= _c2 && (y2 == x2);					\
+     r3 = x3 - y3 - _c3;						\
+   } while (0)
+ #endif
+diff -urN libc25-cvstip-20070104/soft-fp/op-common.h libc24/soft-fp/op-common.h
+--- libc25-cvstip-20070104/soft-fp/op-common.h	2006-04-04 03:24:47.000000000 -0500
++++ libc24/soft-fp/op-common.h	2007-01-15 11:46:17.290882288 -0600
+@@ -1,5 +1,5 @@
+ /* Software floating-point emulation. Common operations.
+-   Copyright (C) 1997,1998,1999,2006 Free Software Foundation, Inc.
++   Copyright (C) 1997,1998,1999,2006,2007 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+    Contributed by Richard Henderson (rth@cygnus.com),
+ 		  Jakub Jelinek (jj@ultra.linux.cz),
+@@ -99,10 +99,10 @@
+   else							\
+     {							\
+       X##_e = _FP_EXPMAX_##fs - 1;			\
+-      FP_SET_EXCEPTION(FP_EX_OVERFLOW);			\
+-      FP_SET_EXCEPTION(FP_EX_INEXACT);			\
+       _FP_FRAC_SET_##wc(X, _FP_MAXFRAC_##wc);		\
+     }							\
++    FP_SET_EXCEPTION(FP_EX_INEXACT);			\
++    FP_SET_EXCEPTION(FP_EX_OVERFLOW);			\
+ } while (0)
+ 
+ /* Check for a semi-raw value being a signaling NaN and raise the
+@@ -1252,6 +1252,9 @@
+ 	      _FP_FRAC_SRL_##swc(S, (_FP_WFRACBITS_##sfs		     \
+ 				     - _FP_WFRACBITS_##dfs));		     \
+ 	      _FP_FRAC_COPY_##dwc##_##swc(D, S);			     \
++	      /* Semi-raw NaN must have all workbits cleared.  */	     \
++	      _FP_FRAC_LOW_##dwc(D)					     \
++		&= ~(_FP_W_TYPE) ((1 << _FP_WORKBITS) - 1);		     \
+ 	      _FP_FRAC_HIGH_##dfs(D) |= _FP_QNANBIT_SH_##dfs;		     \
+ 	    }								     \
+ 	}								     \
diff --git a/recipes/glibc/glibc-2.5/zecke-sane-readelf.patch b/recipes/glibc/glibc-2.5/zecke-sane-readelf.patch
new file mode 100644
index 0000000..2bc8797
--- /dev/null
+++ b/recipes/glibc/glibc-2.5/zecke-sane-readelf.patch
@@ -0,0 +1,243 @@
+upstream: http://sources.redhat.com/bugzilla/show_bug.cgi?id=3004
+status: WONTFIX
+comment: Use OEs version of the readelf version. There might be no
+host system version (e.g. on OSX) or it is not multiarch.
+
+Index: glibc-2.6.1/configure
+===================================================================
+--- glibc-2.6.1.orig/configure	2007-07-31 06:46:12.000000000 -0700
++++ glibc-2.6.1/configure	2008-09-12 16:38:06.000000000 -0700
+@@ -5478,6 +5478,96 @@
+     fi
+   fi
+ 
++###  AC_CHECK_TARGET_TOOL([READELF],[readelf],[readelf],[$PATH])
++### XXXX copy and pasted
++# Check for readelf
++# Extract the first word of "$target_alias-readelf", so it can be a program name with args.
++set dummy $target_alias-readelf; ac_word=$2
++{ echo "$as_me:$LINENO: checking for $ac_word" >&5
++echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6; }
++if test "${ac_cv_prog_READELF+set}" = set; then
++  echo $ECHO_N "(cached) $ECHO_C" >&6
++else
++  if test -n "$READELF"; then
++  ac_cv_prog_READELF="$READELF" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++  for ac_exec_ext in '' $ac_executable_extensions; do
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_executable_p "$as_dir/$ac_word$ac_exec_ext"; }; then
++    ac_cv_prog_READELF="$target_alias-readelf"
++    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++done
++IFS=$as_save_IFS
++
++fi
++fi
++READELF=$ac_cv_prog_READELF
++if test -n "$READELF"; then
++  { echo "$as_me:$LINENO: result: $READELF" >&5
++echo "${ECHO_T}$READELF" >&6; }
++else
++  { echo "$as_me:$LINENO: result: no" >&5
++echo "${ECHO_T}no" >&6; }
++fi
++
++
++if test -z "$ac_cv_prog_READELF"; then
++  if test "$build" = "$target"; then
++    ac_ct_READELF=$READELF
++    # Extract the first word of "readelf", so it can be a program name with args.
++set dummy readelf; ac_word=$2
++{ echo "$as_me:$LINENO: checking for $ac_word" >&5
++echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6; }
++if test "${ac_cv_prog_ac_ct_READELF+set}" = set; then
++  echo $ECHO_N "(cached) $ECHO_C" >&6
++else
++  if test -n "$ac_ct_READELF"; then
++  ac_cv_prog_ac_ct_READELF="$ac_ct_READELF" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++  for ac_exec_ext in '' $ac_executable_extensions; do
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_executable_p "$as_dir/$ac_word$ac_exec_ext"; }; then
++    ac_cv_prog_ac_ct_READELF="readelf"
++    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++done
++IFS=$as_save_IFS
++
++  test -z "$ac_cv_prog_ac_ct_READELF" && ac_cv_prog_ac_ct_READELF="readelf"
++fi
++fi
++ac_ct_READELF=$ac_cv_prog_ac_ct_READELF
++if test -n "$ac_ct_READELF"; then
++  { echo "$as_me:$LINENO: result: $ac_ct_READELF" >&5
++echo "${ECHO_T}$ac_ct_READELF" >&6; }
++else
++  { echo "$as_me:$LINENO: result: no" >&5
++echo "${ECHO_T}no" >&6; }
++fi
++
++    READELF=ac_ct_READELF
++  else
++    READELF="readelf"
++  fi
++else
++  READELF="$ac_cv_prog_READELF"
++fi
++
++### XXXX copy and pasted
++
+   echo "$as_me:$LINENO: checking for .preinit_array/.init_array/.fini_array support" >&5
+ echo $ECHO_N "checking for .preinit_array/.init_array/.fini_array support... $ECHO_C" >&6
+ if test "${libc_cv_initfini_array+set}" = set; then
+@@ -5497,7 +5587,7 @@
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); }; }
+   then
+-    if readelf -S conftest | fgrep INIT_ARRAY > /dev/null; then
++    if $READELF -S conftest | fgrep INIT_ARRAY > /dev/null; then
+       libc_cv_initfini_array=yes
+     else
+       libc_cv_initfini_array=no
+@@ -5797,7 +5887,7 @@
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); }; }
+   then
+-    if readelf -S conftest.so | grep '\.rel\(a\|\)\.dyn' > /dev/null; then
++    if $READELF -S conftest.so | grep '\.rel\(a\|\)\.dyn' > /dev/null; then
+       libc_cv_z_combreloc=yes
+     else
+       libc_cv_z_combreloc=no
+Index: glibc-2.6.1/configure.in
+===================================================================
+--- glibc-2.6.1.orig/configure.in	2007-03-20 05:11:23.000000000 -0700
++++ glibc-2.6.1/configure.in	2008-09-12 16:38:26.000000000 -0700
+@@ -1347,6 +1347,96 @@
+     fi
+   fi
+ 
++###  AC_CHECK_TARGET_TOOL([READELF],[readelf],[readelf],[$PATH])
++### XXXX copy and pasted
++# Check for readelf
++# Extract the first word of "$target_alias-readelf", so it can be a program name with args.
++set dummy $target_alias-readelf; ac_word=$2
++{ echo "$as_me:$LINENO: checking for $ac_word" >&5
++echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6; }
++if test "${ac_cv_prog_READELF+set}" = set; then
++  echo $ECHO_N "(cached) $ECHO_C" >&6
++else
++  if test -n "$READELF"; then
++  ac_cv_prog_READELF="$READELF" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++  for ac_exec_ext in '' $ac_executable_extensions; do
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_executable_p "$as_dir/$ac_word$ac_exec_ext"; }; then
++    ac_cv_prog_READELF="$target_alias-readelf"
++    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++done
++IFS=$as_save_IFS
++
++fi
++fi
++READELF=$ac_cv_prog_READELF
++if test -n "$READELF"; then
++  { echo "$as_me:$LINENO: result: $READELF" >&5
++echo "${ECHO_T}$READELF" >&6; }
++else
++  { echo "$as_me:$LINENO: result: no" >&5
++echo "${ECHO_T}no" >&6; }
++fi
++
++
++if test -z "$ac_cv_prog_READELF"; then
++  if test "$build" = "$target"; then
++    ac_ct_READELF=$READELF
++    # Extract the first word of "readelf", so it can be a program name with args.
++set dummy readelf; ac_word=$2
++{ echo "$as_me:$LINENO: checking for $ac_word" >&5
++echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6; }
++if test "${ac_cv_prog_ac_ct_READELF+set}" = set; then
++  echo $ECHO_N "(cached) $ECHO_C" >&6
++else
++  if test -n "$ac_ct_READELF"; then
++  ac_cv_prog_ac_ct_READELF="$ac_ct_READELF" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++  for ac_exec_ext in '' $ac_executable_extensions; do
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_executable_p "$as_dir/$ac_word$ac_exec_ext"; }; then
++    ac_cv_prog_ac_ct_READELF="readelf"
++    echo "$as_me:$LINENO: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++done
++IFS=$as_save_IFS
++
++  test -z "$ac_cv_prog_ac_ct_READELF" && ac_cv_prog_ac_ct_READELF="readelf"
++fi
++fi
++ac_ct_READELF=$ac_cv_prog_ac_ct_READELF
++if test -n "$ac_ct_READELF"; then
++  { echo "$as_me:$LINENO: result: $ac_ct_READELF" >&5
++echo "${ECHO_T}$ac_ct_READELF" >&6; }
++else
++  { echo "$as_me:$LINENO: result: no" >&5
++echo "${ECHO_T}no" >&6; }
++fi
++
++    READELF=ac_ct_READELF
++  else
++    READELF="readelf"
++  fi
++else
++  READELF="$ac_cv_prog_READELF"
++fi
++
++### XXXX copy and pasted
++
+   AC_CACHE_CHECK(for .preinit_array/.init_array/.fini_array support,
+ 		 libc_cv_initfini_array, [dnl
+   cat > conftest.c <<EOF
+@@ -1358,7 +1448,7 @@
+   if AC_TRY_COMMAND([${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS -o conftest conftest.c
+ 		     -static -nostartfiles -nostdlib 1>&AS_MESSAGE_LOG_FD])
+   then
+-    if readelf -S conftest | fgrep INIT_ARRAY > /dev/null; then
++    if $READELF -S conftest | fgrep INIT_ARRAY > /dev/null; then
+       libc_cv_initfini_array=yes
+     else
+       libc_cv_initfini_array=no
+@@ -1543,7 +1633,7 @@
+ dnl introducing new options this is not easily doable.  Instead use a tool
+ dnl which always is cross-platform: readelf.  To detect whether -z combreloc
+ dnl look for a section named .rel.dyn.
+-    if readelf -S conftest.so | grep '\.rel\(a\|\)\.dyn' > /dev/null; then
++    if $READELF -S conftest.so | grep '\.rel\(a\|\)\.dyn' > /dev/null; then
+       libc_cv_z_combreloc=yes
+     else
+       libc_cv_z_combreloc=no
diff --git a/recipes/glibc/glibc_2.5.bb b/recipes/glibc/glibc_2.5.bb
index 94b5114..39551dc 100644
--- a/recipes/glibc/glibc_2.5.bb
+++ b/recipes/glibc/glibc_2.5.bb
@@ -1,5 +1,5 @@
 require glibc.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -10,8 +10,6 @@ RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
 
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-2.4"
-
 GLIBC_ADDONS ?= "ports,nptl,libidn"
 
 GLIBC_BROKEN_LOCALES = "sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN"
@@ -70,8 +68,6 @@ SRC_URI_append_powerpc = " file://ppc-sfp-machine.patch \
                            file://powerpc-sqrt-hack.diff \
                            file://glibc-2.5-soft-fp-separate-strong-alias.patch"
 
-FILESPATHPKG_nios2 = "glibc-2.5:glibc-2.4:files:"
-
 SRC_URI_append_nios2 = " \
   file://sysdeps-nios2.patch \
   file://nios2-elf.patch \
-- 
1.6.4.2



