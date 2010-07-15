Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZVKE-0007gh-Ai
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 22:46:37 +0200
Received: by ewy7 with SMTP id 7so417598ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 13:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=XPyisCRi0aib8RrKcblfUf2bsiHtfFrZak2f9guMJSU=;
	b=ew1lxPlsDMulli+DkHLgB/41nZ3gIbr4B28jFKLJLVmQoybngpp9HOiLj7/FW8IoUP
	lsaZaEYpHSD4g0HyeOM/V2rjuL4CgkCjTtxPhjcwkdLDMVhhZ9YjFEPl/QaZKQ5JazIu
	sxnqpnRd49SU+tS7WGrr56S2J/xemIhT53ulw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=f3C6nF1EC7SGiU0WwiWWS4Ct/XSb8Vb64qb6e2Ut+xPnFd2FP13v2W4JUDfvs88BuW
	eh9/1BVaEqkQVCnoujjJAxtYe5jlFwbvW0f53YxKtGNAvMsuNyN/XzJ66VO4mZHnpqzU
	0/CrGQISmAQ5omWWY7zaDTve5s+QwC3GA+lQM=
Received: by 10.213.33.4 with SMTP id f4mr216234ebd.58.1279226788947;
	Thu, 15 Jul 2010 13:46:28 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm11234548eei.12.2010.07.15.13.46.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Jul 2010 13:46:28 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jul 2010 22:46:20 +0200
Message-Id: <1279226782-6124-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] glibc 2.9: cleaned up; patches only in local dir
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
X-List-Received-Date: Thu, 15 Jul 2010 20:46:37 -0000

moved all patches to glibc-2.9
removed references to other dirs.

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/glibc/glibc-2.9/arm-longlong.patch         |   58 ++
 .../glibc-2.9/arm-lowlevellock-include-tls.patch   |   12 +
 recipes/glibc/glibc-2.9/arm-memcpy.patch           |  758 ++++++++++++++++++++
 recipes/glibc/glibc-2.9/dl-cache-libcmp.patch      |   10 +
 recipes/glibc/glibc-2.9/fhs-linux-paths.patch      |   11 +
 recipes/glibc/glibc-2.9/generate-supported.mk      |   11 +
 recipes/glibc/glibc-2.9/generic-bits_select.h      |   35 +
 recipes/glibc/glibc-2.9/generic-bits_time.h        |   75 ++
 recipes/glibc/glibc-2.9/generic-bits_types.h       |  200 +++++
 recipes/glibc/glibc-2.9/generic-bits_typesizes.h   |   66 ++
 .../glibc-2.9/glibc-arm-IO-acquire-lock-fix.diff   |   13 +
 recipes/glibc/glibc-2.9/glibc-check_pf.patch       |  343 +++++++++
 recipes/glibc/glibc-2.9/ldd-unbash.patch           |   11 +
 recipes/glibc/glibc-2.9/ldsocache-varrun.patch     |   18 +
 recipes/glibc/glibc-2.9/march-i686.patch           |   38 +
 recipes/glibc/glibc-2.9/no-z-defs.patch            |    9 +
 recipes/glibc/glibc-2.9/nptl-crosscompile.patch    |   26 +
 recipes/glibc/glibc-2.9/nscd-init.patch            |   39 +
 recipes/glibc/glibc-2.9/powerpc-sqrt-hack.diff     |   25 +
 recipes/glibc/glibc-2.9/tls_i486.patch             |   14 +
 recipes/glibc/glibc_2.9.bb                         |    3 -
 21 files changed, 1772 insertions(+), 3 deletions(-)
 create mode 100644 recipes/glibc/glibc-2.9/arm-longlong.patch
 create mode 100644 recipes/glibc/glibc-2.9/arm-lowlevellock-include-tls.patch
 create mode 100644 recipes/glibc/glibc-2.9/arm-memcpy.patch
 create mode 100644 recipes/glibc/glibc-2.9/dl-cache-libcmp.patch
 create mode 100644 recipes/glibc/glibc-2.9/fhs-linux-paths.patch
 create mode 100644 recipes/glibc/glibc-2.9/generate-supported.mk
 create mode 100644 recipes/glibc/glibc-2.9/generic-bits_select.h
 create mode 100644 recipes/glibc/glibc-2.9/generic-bits_time.h
 create mode 100644 recipes/glibc/glibc-2.9/generic-bits_types.h
 create mode 100644 recipes/glibc/glibc-2.9/generic-bits_typesizes.h
 create mode 100644 recipes/glibc/glibc-2.9/glibc-arm-IO-acquire-lock-fix.diff
 create mode 100644 recipes/glibc/glibc-2.9/glibc-check_pf.patch
 create mode 100644 recipes/glibc/glibc-2.9/ldd-unbash.patch
 create mode 100644 recipes/glibc/glibc-2.9/ldsocache-varrun.patch
 create mode 100644 recipes/glibc/glibc-2.9/march-i686.patch
 create mode 100644 recipes/glibc/glibc-2.9/no-z-defs.patch
 create mode 100644 recipes/glibc/glibc-2.9/nptl-crosscompile.patch
 create mode 100644 recipes/glibc/glibc-2.9/nscd-init.patch
 create mode 100644 recipes/glibc/glibc-2.9/powerpc-sqrt-hack.diff
 create mode 100644 recipes/glibc/glibc-2.9/tls_i486.patch

diff --git a/recipes/glibc/glibc-2.9/arm-longlong.patch b/recipes/glibc/glibc-2.9/arm-longlong.patch
new file mode 100644
index 0000000..28aca83
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/arm-longlong.patch
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
diff --git a/recipes/glibc/glibc-2.9/arm-lowlevellock-include-tls.patch b/recipes/glibc/glibc-2.9/arm-lowlevellock-include-tls.patch
new file mode 100644
index 0000000..5c8062e
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/arm-lowlevellock-include-tls.patch
@@ -0,0 +1,12 @@
+Index: glibc-2.9/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h
+===================================================================
+--- glibc-2.9.orig/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h	2009-06-19 20:54:35.446686910 +0400
++++ glibc-2.9/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h	2009-06-19 20:54:43.774683370 +0400
+@@ -25,6 +25,7 @@
+ #include <atomic.h>
+ #include <sysdep.h>
+ #include <kernel-features.h>
++#include <tls.h>
+ 
+ #define FUTEX_WAIT		0
+ #define FUTEX_WAKE		1
diff --git a/recipes/glibc/glibc-2.9/arm-memcpy.patch b/recipes/glibc/glibc-2.9/arm-memcpy.patch
new file mode 100644
index 0000000..bc2b3da
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/arm-memcpy.patch
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
diff --git a/recipes/glibc/glibc-2.9/dl-cache-libcmp.patch b/recipes/glibc/glibc-2.9/dl-cache-libcmp.patch
new file mode 100644
index 0000000..2fedfa6
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/dl-cache-libcmp.patch
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
diff --git a/recipes/glibc/glibc-2.9/fhs-linux-paths.patch b/recipes/glibc/glibc-2.9/fhs-linux-paths.patch
new file mode 100644
index 0000000..1f32f6d
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/fhs-linux-paths.patch
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
diff --git a/recipes/glibc/glibc-2.9/generate-supported.mk b/recipes/glibc/glibc-2.9/generate-supported.mk
new file mode 100644
index 0000000..d2a28c2
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/generate-supported.mk
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
diff --git a/recipes/glibc/glibc-2.9/generic-bits_select.h b/recipes/glibc/glibc-2.9/generic-bits_select.h
new file mode 100644
index 0000000..47e7ded
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/generic-bits_select.h
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
diff --git a/recipes/glibc/glibc-2.9/generic-bits_time.h b/recipes/glibc/glibc-2.9/generic-bits_time.h
new file mode 100644
index 0000000..b3184d1
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/generic-bits_time.h
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
diff --git a/recipes/glibc/glibc-2.9/generic-bits_types.h b/recipes/glibc/glibc-2.9/generic-bits_types.h
new file mode 100644
index 0000000..65c8a9f
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/generic-bits_types.h
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
diff --git a/recipes/glibc/glibc-2.9/generic-bits_typesizes.h b/recipes/glibc/glibc-2.9/generic-bits_typesizes.h
new file mode 100644
index 0000000..e9226c4
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/generic-bits_typesizes.h
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
diff --git a/recipes/glibc/glibc-2.9/glibc-arm-IO-acquire-lock-fix.diff b/recipes/glibc/glibc-2.9/glibc-arm-IO-acquire-lock-fix.diff
new file mode 100644
index 0000000..a552cf0
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/glibc-arm-IO-acquire-lock-fix.diff
@@ -0,0 +1,13 @@
+Arm needs a similar fix as http://sourceware.org/ml/libc-ports/2007-12/msg00000.html
+
+--- /tmp/stdio-lock.h	2008-03-04 18:51:15.555038993 +0100
++++ glibc-2.7/ports/sysdeps/unix/sysv/linux/arm/bits/stdio-lock.h	2008-03-04 18:51:28.445035052 +0100
+@@ -50,6 +50,8 @@
+   _IO_cleanup_region_start ((void (*) (void *)) _IO_funlockfile, (_fp));      \
+   _IO_flockfile (_fp)
+ 
++# define _IO_acquire_lock_clear_flags2(_fp) _IO_acquire_lock (_fp)
++
+ # define _IO_release_lock(_fp) \
+   _IO_funlockfile (_fp);						      \
+   _IO_cleanup_region_end (0)
diff --git a/recipes/glibc/glibc-2.9/glibc-check_pf.patch b/recipes/glibc/glibc-2.9/glibc-check_pf.patch
new file mode 100644
index 0000000..3cff6bb
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/glibc-check_pf.patch
@@ -0,0 +1,343 @@
+From libc-ports-return-550-listarch-libc-ports=sources dot redhat dot com at sourceware dot org Tue Oct 31 17:37:21 2006
+Return-Path: <libc-ports-return-550-listarch-libc-ports=sources dot redhat dot com at sourceware dot org>
+Delivered-To: listarch-libc-ports at sources dot redhat dot com
+Received: (qmail 17273 invoked by alias); 31 Oct 2006 17:37:20 -0000
+Received: (qmail 17262 invoked by uid 22791); 31 Oct 2006 17:37:19 -0000
+X-Spam-Status: No, hits=-2.5 required=5.0 	tests=AWL,BAYES_00,TW_CP
+X-Spam-Check-By: sourceware.org
+Received: from nevyn.them.org (HELO nevyn.them.org) (66.93.172.17)     by sourceware.org (qpsmtpd/0.31.1) with ESMTP; Tue, 31 Oct 2006 17:37:11 +0000
+Received: from drow by nevyn.them.org with local (Exim 4.54) 	id 1GexXw-0007Dj-30; Tue, 31 Oct 2006 12:37:08 -0500
+Date: Tue, 31 Oct 2006 12:37:08 -0500
+From: Daniel Jacobowitz <drow at false dot org>
+To: Mike Frysinger <vapier at gentoo dot org>
+Cc: libc-ports at sourceware dot org, Philip Balister <philip dot balister at gmail dot com>
+Subject: Re: Problem with glibc-2.5 on ARM
+Message-ID: <20061031173708.GJ20468@nevyn.them.org>
+References: <499146270610241149ibe030e0nd9d6b177a95b346e@mail.gmail.com> <499146270610241254u7cadf63ej2edf05cedbc5266f@mail.gmail.com> <20061024195837.GA20181@nevyn.them.org> <200610291954.27022.vapier@gentoo.org>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=us-ascii
+Content-Disposition: inline
+In-Reply-To: <200610291954 dot 27022 dot vapier at gentoo dot org>
+User-Agent: Mutt/1.5.13 (2006-08-11)
+X-IsSubscribed: yes
+Mailing-List: contact libc-ports-help at sourceware dot org; run by ezmlm
+Precedence: bulk
+List-Subscribe: <mailto:libc-ports-subscribe at sourceware dot org>
+List-Post: <mailto:libc-ports at sourceware dot org>
+List-Help: <mailto:libc-ports-help at sourceware dot org>, <http://sourceware dot org/lists dot html#faqs>
+Sender: libc-ports-owner at sourceware dot org
+Delivered-To: mailing list libc-ports at sourceware dot org
+
+On Sun, Oct 29, 2006 at 07:54:25PM -0500, Mike Frysinger wrote:
+> On Tuesday 24 October 2006 15:58, Daniel Jacobowitz wrote:
+> > ARM is going to need a slightly different version of that file, I
+> > guess.
+> 
+> would declaring req with attribute packed not help ?
+> -mike
+
+Nope.  "struct rtgenmsg" would still have size 4.
+
+Philip, are you still at all interested in this for the old ABI?
+I don't have time to test this patch right now, but I think it
+will work.
+
+-- 
+Daniel Jacobowitz
+CodeSourcery
+
+2006-10-31  Daniel Jacobowitz  <dan@codesourcery.com>
+
+	* sysdeps/unix/sysv/linux/arm/check_pf.c: New file.
+	* sysdeps/unix/sysv/linux/arm/eabi/check_pf.c: New file.
+
+Index: sysdeps/unix/sysv/linux/arm/check_pf.c
+===================================================================
+RCS file: sysdeps/unix/sysv/linux/arm/check_pf.c
+diff -N sysdeps/unix/sysv/linux/arm/check_pf.c
+--- /dev/null	1 Jan 1970 00:00:00 -0000
++++ sysdeps/unix/sysv/linux/arm/check_pf.c	31 Oct 2006 17:29:58 -0000
+@@ -0,0 +1,274 @@
++/* Determine protocol families for which interfaces exist.  ARM Linux version.
++   Copyright (C) 2003, 2006 Free Software Foundation, Inc.
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
++#include <assert.h>
++#include <errno.h>
++#include <ifaddrs.h>
++#include <netdb.h>
++#include <stddef.h>
++#include <string.h>
++#include <time.h>
++#include <unistd.h>
++#include <sys/socket.h>
++
++#include <asm/types.h>
++#include <linux/netlink.h>
++#include <linux/rtnetlink.h>
++
++#include <not-cancel.h>
++#include <kernel-features.h>
++
++
++#ifndef IFA_F_TEMPORARY
++# define IFA_F_TEMPORARY IFA_F_SECONDARY
++#endif
++#ifndef IFA_F_HOMEADDRESS
++# define IFA_F_HOMEADDRESS 0
++#endif
++
++
++static int
++make_request (int fd, pid_t pid, bool *seen_ipv4, bool *seen_ipv6,
++	      struct in6addrinfo **in6ai, size_t *in6ailen)
++{
++  struct req
++  {
++    struct nlmsghdr nlh;
++    struct rtgenmsg g;
++  } req;
++  struct sockaddr_nl nladdr;
++
++  /* struct rtgenmsg consists of a single byte but the ARM ABI rounds
++     it up to a word.  Clear the padding explicitly here.  */
++  assert (sizeof (req.g) == 4);
++  memset (&req.g, '\0', sizeof (req.g));
++
++  req.nlh.nlmsg_len = sizeof (req);
++  req.nlh.nlmsg_type = RTM_GETADDR;
++  req.nlh.nlmsg_flags = NLM_F_ROOT | NLM_F_MATCH | NLM_F_REQUEST;
++  req.nlh.nlmsg_pid = 0;
++  req.nlh.nlmsg_seq = time (NULL);
++  req.g.rtgen_family = AF_UNSPEC;
++
++  memset (&nladdr, '\0', sizeof (nladdr));
++  nladdr.nl_family = AF_NETLINK;
++
++  if (TEMP_FAILURE_RETRY (__sendto (fd, (void *) &req, sizeof (req), 0,
++				    (struct sockaddr *) &nladdr,
++				    sizeof (nladdr))) < 0)
++    return -1;
++
++  *seen_ipv4 = false;
++  *seen_ipv6 = false;
++
++  bool done = false;
++  char buf[4096];
++  struct iovec iov = { buf, sizeof (buf) };
++  struct in6ailist
++  {
++    struct in6addrinfo info;
++    struct in6ailist *next;
++  } *in6ailist = NULL;
++  size_t in6ailistlen = 0;
++
++  do
++    {
++      struct msghdr msg =
++	{
++	  (void *) &nladdr, sizeof (nladdr),
++	  &iov, 1,
++	  NULL, 0,
++	  0
++	};
++
++      ssize_t read_len = TEMP_FAILURE_RETRY (__recvmsg (fd, &msg, 0));
++      if (read_len < 0)
++	return -1;
++
++      if (msg.msg_flags & MSG_TRUNC)
++	return -1;
++
++      struct nlmsghdr *nlmh;
++      for (nlmh = (struct nlmsghdr *) buf;
++	   NLMSG_OK (nlmh, (size_t) read_len);
++	   nlmh = (struct nlmsghdr *) NLMSG_NEXT (nlmh, read_len))
++	{
++	  if (nladdr.nl_pid != 0 || (pid_t) nlmh->nlmsg_pid != pid
++	      || nlmh->nlmsg_seq != req.nlh.nlmsg_seq)
++	    continue;
++
++	  if (nlmh->nlmsg_type == RTM_NEWADDR)
++	    {
++	      struct ifaddrmsg *ifam = (struct ifaddrmsg *) NLMSG_DATA (nlmh);
++
++	      switch (ifam->ifa_family)
++		{
++		case AF_INET:
++		  *seen_ipv4 = true;
++		  break;
++		case AF_INET6:
++		  *seen_ipv6 = true;
++
++		  if (ifam->ifa_flags & (IFA_F_DEPRECATED
++					 | IFA_F_TEMPORARY
++					 | IFA_F_HOMEADDRESS))
++		    {
++		      struct rtattr *rta = IFA_RTA (ifam);
++		      size_t len = (nlmh->nlmsg_len
++				    - NLMSG_LENGTH (sizeof (*ifam)));
++		      void *local = NULL;
++		      void *address = NULL;
++		      while (RTA_OK (rta, len))
++			{
++			  switch (rta->rta_type)
++			    {
++			    case IFA_LOCAL:
++			      local = RTA_DATA (rta);
++			      break;
++
++			    case IFA_ADDRESS:
++			      address = RTA_DATA (rta);
++			      break;
++			    }
++
++			  rta = RTA_NEXT (rta, len);
++			}
++
++		      struct in6ailist *newp = alloca (sizeof (*newp));
++		      newp->info.flags = (((ifam->ifa_flags & IFA_F_DEPRECATED)
++					   ? in6ai_deprecated : 0)
++					  | ((ifam->ifa_flags
++					      & IFA_F_TEMPORARY)
++					     ? in6ai_temporary : 0)
++					  | ((ifam->ifa_flags
++					      & IFA_F_HOMEADDRESS)
++					     ? in6ai_homeaddress : 0));
++		      memcpy (newp->info.addr, address ?: local,
++			      sizeof (newp->info.addr));
++		      newp->next = in6ailist;
++		      in6ailist = newp;
++		      ++in6ailistlen;
++		    }
++		  break;
++		default:
++		  /* Ignore.  */
++		  break;
++		}
++	    }
++	  else if (nlmh->nlmsg_type == NLMSG_DONE)
++	    /* We found the end, leave the loop.  */
++	    done = true;
++	}
++    }
++  while (! done);
++
++  close_not_cancel_no_status (fd);
++
++  if (in6ailist != NULL)
++    {
++      *in6ai = malloc (in6ailistlen * sizeof (**in6ai));
++      if (*in6ai == NULL)
++	return -1;
++
++      *in6ailen = in6ailistlen;
++
++      do
++	{
++	  (*in6ai)[--in6ailistlen] = in6ailist->info;
++	  in6ailist = in6ailist->next;
++	}
++      while (in6ailist != NULL);
++    }
++
++  return 0;
++}
++
++
++/* We don't know if we have NETLINK support compiled in in our
++   Kernel.  */
++#if __ASSUME_NETLINK_SUPPORT == 0
++/* Define in ifaddrs.h.  */
++extern int __no_netlink_support attribute_hidden;
++#else
++# define __no_netlink_support 0
++#endif
++
++
++void
++attribute_hidden
++__check_pf (bool *seen_ipv4, bool *seen_ipv6,
++	    struct in6addrinfo **in6ai, size_t *in6ailen)
++{
++  *in6ai = NULL;
++  *in6ailen = 0;
++
++  if (! __no_netlink_support)
++    {
++      int fd = __socket (PF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
++
++      struct sockaddr_nl nladdr;
++      memset (&nladdr, '\0', sizeof (nladdr));
++      nladdr.nl_family = AF_NETLINK;
++
++      socklen_t addr_len = sizeof (nladdr);
++
++      if (fd >= 0
++	  && __bind (fd, (struct sockaddr *) &nladdr, sizeof (nladdr)) == 0
++	  && __getsockname (fd, (struct sockaddr *) &nladdr, &addr_len) == 0
++	  && make_request (fd, nladdr.nl_pid, seen_ipv4, seen_ipv6,
++			   in6ai, in6ailen) == 0)
++	/* It worked.  */
++	return;
++
++      if (fd >= 0)
++	__close (fd);
++
++#if __ASSUME_NETLINK_SUPPORT == 0
++      /* Remember that there is no netlink support.  */
++      __no_netlink_support = 1;
++#else
++      /* We cannot determine what interfaces are available.  Be
++	 pessimistic.  */
++      *seen_ipv4 = true;
++      *seen_ipv6 = true;
++#endif
++    }
++
++#if __ASSUME_NETLINK_SUPPORT == 0
++  /* No netlink.  Get the interface list via getifaddrs.  */
++  struct ifaddrs *ifa = NULL;
++  if (getifaddrs (&ifa) != 0)
++    {
++      /* We cannot determine what interfaces are available.  Be
++	 pessimistic.  */
++      *seen_ipv4 = true;
++      *seen_ipv6 = true;
++      return;
++    }
++
++  struct ifaddrs *runp;
++  for (runp = ifa; runp != NULL; runp = runp->ifa_next)
++    if (runp->ifa_addr->sa_family == PF_INET)
++      *seen_ipv4 = true;
++    else if (runp->ifa_addr->sa_family == PF_INET6)
++      *seen_ipv6 = true;
++
++  (void) freeifaddrs (ifa);
++#endif
++}
+Index: sysdeps/unix/sysv/linux/arm/eabi/check_pf.c
+===================================================================
+RCS file: sysdeps/unix/sysv/linux/arm/eabi/check_pf.c
+diff -N sysdeps/unix/sysv/linux/arm/eabi/check_pf.c
+--- /dev/null	1 Jan 1970 00:00:00 -0000
++++ sysdeps/unix/sysv/linux/arm/eabi/check_pf.c	31 Oct 2006 17:29:58 -0000
+@@ -0,0 +1 @@
++#include <sysdeps/unix/sysv/linux/check_pf.c>
+
diff --git a/recipes/glibc/glibc-2.9/ldd-unbash.patch b/recipes/glibc/glibc-2.9/ldd-unbash.patch
new file mode 100644
index 0000000..2fb8854
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/ldd-unbash.patch
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
diff --git a/recipes/glibc/glibc-2.9/ldsocache-varrun.patch b/recipes/glibc/glibc-2.9/ldsocache-varrun.patch
new file mode 100644
index 0000000..9994d4f
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/ldsocache-varrun.patch
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
diff --git a/recipes/glibc/glibc-2.9/march-i686.patch b/recipes/glibc/glibc-2.9/march-i686.patch
new file mode 100644
index 0000000..0461603
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/march-i686.patch
@@ -0,0 +1,38 @@
+2007-02-15  Khem Raj  <kraj@xxxxxxxxxx>
+
+       * sysdeps/unix/sysv/linux/i386/sysdep.h: Re-define __i686.
+       * nptl/sysdeps/pthread/pt-initfini.c: Ditto.
+
+
+
+Index: sysdeps/unix/sysv/linux/i386/sysdep.h
+===================================================================
+--- sysdeps/unix/sysv/linux/i386/sysdep.h	(revision 1469)
++++ sysdeps/unix/sysv/linux/i386/sysdep.h	(working copy)
+@@ -29,6 +29,10 @@
+ #include <dl-sysdep.h>
+ #include <tls.h>
+ 
++#if defined __i686 && defined __ASSEMBLER__
++#undef __i686
++#define __i686 __i686
++#endif
+ 
+ /* For Linux we can use the system call table in the header file
+ 	/usr/include/asm/unistd.h
+Index: nptl/sysdeps/pthread/pt-initfini.c
+===================================================================
+--- nptl/sysdeps/pthread/pt-initfini.c	(revision 1469)
++++ nptl/sysdeps/pthread/pt-initfini.c	(working copy)
+@@ -45,6 +45,11 @@
+ /* Embed an #include to pull in the alignment and .end directives. */
+ asm ("\n#include \"defs.h\"");
+ 
++asm ("\n#if defined __i686 && defined __ASSEMBLER__");
++asm ("\n#undef __i686");
++asm ("\n#define __i686 __i686");
++asm ("\n#endif");
++
+ /* The initial common code ends here. */
+ asm ("\n/*@HEADER_ENDS*/");
+ 
diff --git a/recipes/glibc/glibc-2.9/no-z-defs.patch b/recipes/glibc/glibc-2.9/no-z-defs.patch
new file mode 100644
index 0000000..48c6a41
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/no-z-defs.patch
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
diff --git a/recipes/glibc/glibc-2.9/nptl-crosscompile.patch b/recipes/glibc/glibc-2.9/nptl-crosscompile.patch
new file mode 100644
index 0000000..18a46ad
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/nptl-crosscompile.patch
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
diff --git a/recipes/glibc/glibc-2.9/nscd-init.patch b/recipes/glibc/glibc-2.9/nscd-init.patch
new file mode 100644
index 0000000..884609a
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/nscd-init.patch
@@ -0,0 +1,39 @@
+--- nscd/nscd.init
++++ nscd/nscd.init
+@@ -48,9 +48,8 @@
+ 
+ start () {
+     [ -d /var/run/nscd ] || mkdir /var/run/nscd
+-    [ -d /var/db/nscd ] || mkdir /var/db/nscd
+     echo -n $"Starting $prog: "
+-    daemon /usr/sbin/nscd
++    /usr/sbin/nscd
+     RETVAL=$?
+     echo
+     [ $RETVAL -eq 0 ] && touch /var/lock/subsys/nscd
+@@ -67,12 +66,10 @@
+ 	# a non-privileged user
+ 	rm -f /var/run/nscd/nscd.pid
+ 	rm -f /var/run/nscd/socket
+-       	success $"$prog shutdown"
+-    else
+-       	failure $"$prog shutdown"
+     fi
+-    echo
+-    return $RETVAL
++    echo "Done."
++    # If nscd did not run, return 0 according to LSB.
++    return 0
+ }
+ 
+ restart() {
+@@ -104,7 +101,8 @@
+ 	;;
+     force-reload | reload)
+     	echo -n $"Reloading $prog: "
+-	killproc /usr/sbin/nscd -HUP
++	# Use killall, initscripts-1.0-r115 don't support -HUP yet.
++	killall -HUP /usr/sbin/nscd
+ 	RETVAL=$?
+ 	echo
+ 	;;
diff --git a/recipes/glibc/glibc-2.9/powerpc-sqrt-hack.diff b/recipes/glibc/glibc-2.9/powerpc-sqrt-hack.diff
new file mode 100644
index 0000000..1046efb
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/powerpc-sqrt-hack.diff
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
diff --git a/recipes/glibc/glibc-2.9/tls_i486.patch b/recipes/glibc/glibc-2.9/tls_i486.patch
new file mode 100644
index 0000000..69a1fdf
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/tls_i486.patch
@@ -0,0 +1,14 @@
+Index: glibc-2.9/sysdeps/i386/dl-tlsdesc.S
+===================================================================
+--- glibc-2.9.orig/sysdeps/i386/dl-tlsdesc.S	2009-07-07 23:21:11.647664128 +0200
++++ glibc-2.9/sysdeps/i386/dl-tlsdesc.S	2009-07-07 23:21:32.802555992 +0200
+@@ -128,8 +128,7 @@
+ .Lslow:
+ 	cfi_adjust_cfa_offset (28)
+ 	movl	%ebx, 16(%esp)
+-	call	__i686.get_pc_thunk.bx
+-	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
++	LOAD_PIC_REG (bx)
+ 	call	___tls_get_addr@PLT
+ 	movl	16(%esp), %ebx
+ 	jmp	.Lret
diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index e7ab63d..33326f3 100644
--- a/recipes/glibc/glibc_2.9.bb
+++ b/recipes/glibc/glibc_2.9.bb
@@ -11,9 +11,6 @@ PR = "${INC_PR}.3"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${layout_includedir}"
 
-
-FILESPATHPKG =. "glibc-2.4:"
-
 GLIBC_ADDONS ?= "ports,nptl,libidn"
 
 GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN"
-- 
1.6.4.2



