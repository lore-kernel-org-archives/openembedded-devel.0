Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MCZXU-0002FX-89
	for openembedded-devel@openembedded.org; Fri, 05 Jun 2009 15:32:56 +0200
Received: (qmail 29762 invoked by uid 813007); 5 Jun 2009 13:23:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Jun 2009 13:23:46 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri,  5 Jun 2009 15:24:31 +0200
Message-Id: <1244208273-14048-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
Subject: [PATCH 2/4] glibc: added Maverick support (done by Hasjim Williams)
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
X-List-Received-Date: Fri, 05 Jun 2009 13:32:57 -0000


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 .../glibc/glibc-2.4/glibc-crunch-eabi-force.patch  |  133 ++++++
 .../glibc-2.4/glibc-crunch-eabi-fraiseexcpt.patch  |   88 ++++
 .../glibc-crunch-eabi-setjmp_longjmp.patch         |  112 +++++
 .../glibc/glibc-2.4/glibc-crunch-eabi-unwind.patch |   12 +
 recipes/glibc/glibc-2.4/glibc-crunch-eabi.patch    |  461 ++++++++++++++++++++
 .../glibc-crunch-endian-bigword-littlebyte.patch   |   40 ++
 ...glibc-crunch-endian-littleword-littlebyte.patch |   40 ++
 recipes/glibc/glibc-2.4/glibc-crunch-oabi.patch    |  310 +++++++++++++
 recipes/glibc/glibc-2.4/glibc-crunch-oabi2.patch   |   18 +
 recipes/glibc/glibc_2.6.1.bb                       |   11 +-
 10 files changed, 1223 insertions(+), 2 deletions(-)
 create mode 100644 recipes/glibc/glibc-2.4/glibc-crunch-eabi-force.patch
 create mode 100644 recipes/glibc/glibc-2.4/glibc-crunch-eabi-fraiseexcpt.patch
 create mode 100644 recipes/glibc/glibc-2.4/glibc-crunch-eabi-setjmp_longjmp.patch
 create mode 100644 recipes/glibc/glibc-2.4/glibc-crunch-eabi-unwind.patch
 create mode 100644 recipes/glibc/glibc-2.4/glibc-crunch-eabi.patch
 create mode 100644 recipes/glibc/glibc-2.4/glibc-crunch-endian-bigword-littlebyte.patch
 create mode 100644 recipes/glibc/glibc-2.4/glibc-crunch-endian-littleword-littlebyte.patch
 create mode 100644 recipes/glibc/glibc-2.4/glibc-crunch-oabi.patch
 create mode 100644 recipes/glibc/glibc-2.4/glibc-crunch-oabi2.patch

diff --git a/recipes/glibc/glibc-2.4/glibc-crunch-eabi-force.patch b/recipes/glibc/glibc-2.4/glibc-crunch-eabi-force.patch
new file mode 100644
index 0000000..b509b13
--- /dev/null
+++ b/recipes/glibc/glibc-2.4/glibc-crunch-eabi-force.patch
@@ -0,0 +1,133 @@
+diff -urN glibc-2.6.1/ports/sysdeps/arm/eabi/bits/fenv.h glibc-2.6.1/ports/sysdeps/arm/eabi/bits/fenv.h
+--- glibc-2.6.1/ports/sysdeps/arm/eabi/bits/fenv.h	2008-04-04 18:32:58.000000000 +1000
++++ glibc-2.6.1/ports/sysdeps/arm/eabi/bits/fenv.h	2008-04-07 10:40:28.000000000 +1000
+@@ -20,6 +20,8 @@
+ # error "Never use <bits/fenv.h> directly; include <fenv.h> instead."
+ #endif
+ 
++#if 0
++
+ /* Define bits representing exceptions in the VFP FPU status word.  */
+ enum
+   {
+@@ -55,37 +57,50 @@
+ #define FE_TOWARDZERO FE_TOWARDZERO
+   };
+ 
++#endif
++
+ /* Define bits representing exceptions in the CRUNCH FPU status word.  */
+ enum
+   {
+     FE_CRUNCH_INVALID = (1),
+ #define FE_CRUNCH_INVALID FE_CRUNCH_INVALID
++#define FE_INVALID FE_CRUNCH_INVALID
++#define FE_DIVBYZERO 0
+     FE_CRUNCH_OVERFLOW = (4),
+ #define FE_CRUNCH_OVERFLOW FE_CRUNCH_OVERFLOW
++#define FE_OVERFLOW FE_CRUNCH_OVERFLOW
+     FE_CRUNCH_UNDERFLOW = (8),
+ #define FE_CRUNCH_UNDERFLOW FE_CRUNCH_UNDERFLOW
++#define FE_UNDERFLOW FE_CRUNCH_UNDERFLOW
+     FE_CRUNCH_INEXACT = (16),
+ #define FE_CRUNCH_INEXACT FE_CRUNCH_INEXACT
++#define FE_INEXACT FE_CRUNCH_INEXACT
+   };
+ 
+ /* Amount to shift by to convert an exception to a mask bit.  */
+ #define FE_CRUNCH_EXCEPT_SHIFT	5
++#define FE_EXCEPT_SHIFT FE_CRUNCH_EXCEPT_SHIFT
+ 
+ /* All supported exceptions, except DIVBYZERO.  */
+ #define FE_CRUNCH_ALL_EXCEPT	\
+ 	(FE_CRUNCH_INVALID | FE_CRUNCH_OVERFLOW | FE_CRUNCH_UNDERFLOW | FE_CRUNCH_INEXACT)
++#define FE_ALL_EXCEPT FE_CRUNCH_ALL_EXCEPT
+ 
+ /* CRUNCH supports all of the four defined rounding modes.  */
+ enum
+   {
+     FE_CRUNCH_TONEAREST = 0,
+ #define FE_CRUNCH_TONEAREST FE_CRUNCH_TONEAREST
++#define FE_TONEAREST FE_CRUNCH_TONEAREST
+     FE_CRUNCH_TOWARDZERO = 0x400,
+ #define FE_CRUNCH_TOWARDZERO FE_CRUNCH_TOWARDZERO
++#define FE_TOWARDZERO FE_CRUNCH_TOWARDZERO
+     FE_CRUNCH_DOWNWARD = 0x800,
+ #define FE_CRUNCH_DOWNWARD FE_CRUNCH_DOWNWARD
++#define FE_DOWNWARD FE_CRUNCH_DOWNWARD
+     FE_CRUNCH_UPWARD = 0xc00
+ #define FE_CRUNCH_UPWARD FE_CRUNCH_UPWARD
++#define FE_UPWARD FE_CRUNCH_UPWARD
+   };
+ 
+ 
+diff -urN glibc-2.6.1/ports/sysdeps/arm/eabi/fpu_control.h glibc-2.6.1/ports/sysdeps/arm/eabi/fpu_control.h
+--- glibc-2.6.1/ports/sysdeps/arm/eabi/fpu_control.h	2008-04-04 18:32:58.000000000 +1000
++++ glibc-2.6.1/ports/sysdeps/arm/eabi/fpu_control.h	2008-04-07 11:02:13.000000000 +1000
+@@ -20,6 +20,8 @@
+ #ifndef _FPU_CONTROL_H
+ #define _FPU_CONTROL_H
+ 
++#if 0
++
+ /* masking of interrupts */
+ #define _FPU_MASK_IM	0x00000100	/* invalid operation */
+ #define _FPU_MASK_ZM	0x00000200	/* divide by zero */
+@@ -45,6 +47,11 @@
+ #define _FPU_SETCW(cw) \
+   __asm__ __volatile__ ("mcr p10, 7, %0, cr1, cr0, 0" : : "r" (cw))
+ 
++#endif
++
+ /* CRUNCH SECTION */
+
++/* Type of the control word.  */
++typedef unsigned int fpu_control_t;
++ 
+ /* DSPSC register: (from EP9312 User's Guide)
+@@ -69,19 +73,27 @@
+ 
+ /* masking of interrupts */
+ #define _FPU_CRUNCH_MASK_IM	(1 << 5)	/* invalid operation */
++#define _FPU_MASK_IM _FPU_CRUNCH_MASK_IM
+ #define _FPU_CRUNCH_MASK_ZM	0       	/* divide by zero */ 
++#define _FPU_MASK_ZM _FPU_CRUNCH_MASK_ZM
+ #define _FPU_CRUNCH_MASK_OM	(1 << 7)    /* overflow */
++#define _FPU_MASK_OM _FPU_CRUNCH_MASK_OM
+ #define _FPU_CRUNCH_MASK_UM    (1 << 8)	/* underflow */
++#define _FPU_MASK_UM _FPU_CRUNCH_MASK_UM
+ #define _FPU_CRUNCH_MASK_PM	(1 << 9)	/* inexact */
++#define _FPU_MASK_PM _FPU_CRUNCH_MASK_PM
+ #define _FPU_CRUNCH_MASK_DM    0           /* denormalized operation */
++#undef _FPU_MASK_DM
+ 
+ /* Some bits in the FPSCR are not yet defined.  They must be preserved when
+    modifying the contents.  */
+ #define _FPU_CRUNCH_RESERVED	0x03000042
++#define _FPU_RESERVED _FPU_CRUNCH_RESERVED
+ #define _FPU_CRUNCH_DEFAULT    0x00b00000
++#define _FPU_DEFAULT _FPU_CRUNCH_DEFAULT
+ /* Default + exceptions enabled. */
+ #define _FPU_CRUNCH_IEEE	(_FPU_CRUNCH_DEFAULT | 0x000003a0)
+-
++#define _FPU_IEEE _FPU_CRUNCH_IEEE
+ 
+ /* Macros for accessing the hardware control word.  */
+ /*	cfmvr64l	%1, mvdx0    */
+@@ -103,6 +115,7 @@
+ 	: "=r" (cw), "=r" (__t1), "=r" (__t2)	\
+ 	);					\
+ })
++#define _FPU_GETCW(cw) _FPU_CRUNCH_GETCW(cw)
+ 
+ /* cfmvr64l	%1, mvdx0    */
+ /* cfmvr64h	%2, mvdx0    */
+@@ -123,7 +136,7 @@
+ 	: "=r" (__t1), "=r" (__t2) : "r" (cw)	\
+ 	);					\
+ })
+-
++#define _FPU_SETCW(cw) _FPU_CRUNCH_SETCW(cw)
+ 
+ /* Default control word set at startup.  */
+ extern fpu_control_t __fpu_control;
diff --git a/recipes/glibc/glibc-2.4/glibc-crunch-eabi-fraiseexcpt.patch b/recipes/glibc/glibc-2.4/glibc-crunch-eabi-fraiseexcpt.patch
new file mode 100644
index 0000000..dcee3fa
--- /dev/null
+++ b/recipes/glibc/glibc-2.4/glibc-crunch-eabi-fraiseexcpt.patch
@@ -0,0 +1,88 @@
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/fraiseexcpt.c glibc-2.5/ports/sysdeps/arm/eabi-new/fraiseexcpt.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/fraiseexcpt.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi-new/fraiseexcpt.c	2008-04-14 17:21:09.000000000 +1000
+@@ -25,6 +25,7 @@
+ #include <ldsodefs.h>
+ #include <dl-procinfo.h>
+ #include <sysdep.h>
++#include <math.h>
+ 
+ int
+ feraiseexcept (int excepts)
+@@ -105,8 +105,74 @@
+ 
+   if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
+     {
+-      /* Unsupported, for now.  */
+-      return 1;
++      unsigned int dspsc;
++      const float fp_zero = 0.0, fp_one = 1.0, fp_max = FLT_MAX,
++                  fp_min = FLT_MIN, fp_1e32 = 1.0e32f, fp_two = 2.0,
++		  fp_three = 3.0, fp_inf = HUGE_VALF;
++
++      /* Raise exceptions represented by EXPECTS.  But we must raise only
++	 one signal at a time.  It is important that if the overflow/underflow
++	 exception and the inexact exception are given at the same time,
++	 the overflow/underflow exception follows the inexact exception.  After
++	 each exception we read from the dspsc, to force the exception to be
++	 raised immediately.  */
++
++      /* There are additional complications because this file may be compiled
++         without CRUNCH support enabled, and we also can't assume that the
++	 assembler has CRUNCH instructions enabled. To get around this we use the
++	 generic coprocessor mnemonics and avoid asking GCC to put float values
++	 in CRUNCH registers.  */
++
++      /* First: invalid exception.  */
++      if (FE_CRUNCH_INVALID & excepts)
++	/* (ZERO * INFINITY) */
++	__asm__ __volatile__ (
++	  "ldc p4, cr0, %1\n\t"                        /* cflds mvf0, %1  */
++	  "ldc p4, cr1, %2\n\t"                        /* cflds mvf1, %2  */
++	  "cdp p4, 1, cr0, cr0, cr1, 0\n\t"            /* cfmuls mvf0, mvf0, mvf1  */
++	  "cdp p4, 0, cr0, cr0, cr0, 7\n\t"            /* cfmv32sc mvdx0, dspsc */
++      "mrc p5, 0, %0, cr0, cr0, 0" : "=r" (dspsc) /* cfmvr64l dspsc, mvdx0 */
++			                : "m" (fp_zero), "m" (fp_inf)
++					: "s0", "s1");
++
++      /* Next: overflow.  */
++      if (FE_CRUNCH_OVERFLOW & excepts)
++	/* There's no way to raise overflow without also raising inexact.  */
++	__asm__ __volatile__ (
++	  "ldc p4, cr0, %1\n\t"                        /* cflds mvf0, %1  */
++	  "ldc p4, cr1, %2\n\t"                        /* cflds mvf1, %2  */
++	  "cdp p4, 3, cr0, cr0, cr1, 4\n\t"            /* cfadds mvf0, mvf0, mvf1  */
++	  "cdp p4, 0, cr0, cr0, cr0, 7\n\t"            /* cfmv32sc mvdx0, dspsc */
++      "mrc p5, 0, %0, cr0, cr0, 0" : "=r" (dspsc) /* cfmvr64l dspsc, mvdx0  */
++			                : "m" (fp_max), "m" (fp_1e32)
++					: "s0", "s1");
++
++      /* Next: underflow.  */
++      if (FE_CRUNCH_UNDERFLOW & excepts)
++	/* (FLT_MIN * FLT_MIN) */
++	__asm__ __volatile__ (
++	  "ldc p4, cr0, %1\n\t"                        /* cflds mvf0, %1  */
++	  "ldc p4, cr1, %2\n\t"                        /* cflds mvf1, %2  */
++	  "cdp p4, 1, cr0, cr0, cr1, 0\n\t"            /* cfmul mvf0, mvf0, mvf1  */
++	  "cdp p4, 0, cr0, cr0, cr0, 7\n\t"            /* cfmv32sc mvdx0, dspsc */
++      "mrc p5, 0, %0, cr0, cr0, 0" : "=r" (dspsc) /* cfmvr64l dspsc, mvdx0 */
++			                : "m" (fp_min), "m" (fp_min)
++					: "s0", "s1");
++
++      /* Last: inexact.  */
++      if (FE_CRUNCH_INEXACT & excepts)
++	/* There's no way to raise inexact without also raising overflow.  */
++	__asm__ __volatile__ (
++	  "ldc p4, cr0, %1\n\t"                        /* cflds mvf0, %1  */
++	  "ldc p4, cr1, %2\n\t"                        /* cflds mvf1, %2  */
++	  "cdp p4, 3, cr0, cr0, cr1, 4\n\t"            /* cfadds mvf0, mvf0, mvf1  */
++	  "cdp p4, 0, cr0, cr0, cr0, 7\n\t"            /* cfmv32sc mvdx0, dspsc */
++      "mrc p5, 0, %0, cr0, cr0, 0" : "=r" (dspsc) /* cfmvr64l dspsc, mvdx0 */
++			                : "m" (fp_max), "m" (fp_1e32)
++					: "s0", "s1");
++
++      /* Success.  */
++      return 0;
+     }
+ 
+   /* Unsupported, so fail.  */
diff --git a/recipes/glibc/glibc-2.4/glibc-crunch-eabi-setjmp_longjmp.patch b/recipes/glibc/glibc-2.4/glibc-crunch-eabi-setjmp_longjmp.patch
new file mode 100644
index 0000000..cf4ed60
--- /dev/null
+++ b/recipes/glibc/glibc-2.4/glibc-crunch-eabi-setjmp_longjmp.patch
@@ -0,0 +1,112 @@
+--- glibc-2.5/ports/sysdeps/arm/eabi/setjmp.S	2006-09-22 04:39:51.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/setjmp.S	2007-05-24 13:31:20.000000000 +1000
+@@ -74,6 +74,34 @@
+ 	stcl	p1, cr15, [r12], #8
+ Lno_iwmmxt:
+ 
++	tst	a3, #HWCAP_ARM_CRUNCH
++	beq	Lno_crunch
++
++	/* Save the call-preserved crunch registers.  */
++	/* Following instructions are cfstrd cr10, [ip], #8 (etc.)  */
++	/* stcl	p4, cr4,  [r12], #8 */
++	/* stcl	p4, cr5,  [r12], #8 */
++	/* stcl	p4, cr6,  [r12], #8 */
++	/* stcl	p4, cr7,  [r12], #8 */
++	stcl	p4, cr8,  [r12], #8
++	stcl	p4, cr9,  [r12], #8
++	stcl	p4, cr10, [r12], #8
++	stcl	p4, cr11, [r12], #8
++	stcl	p4, cr12, [r12], #8
++	stcl	p4, cr13, [r12], #8
++	stcl	p4, cr14, [r12], #8
++	stcl	p4, cr15, [r12], #8
++	/* Store the floating-point status register.
++	/* Following 6 instructions are FPU_CRUNCH_GETCW (r2) clob (r3, r4) */
++	/* mrc p5, 0, r3, cr0, cr0, 0 */
++	/* mrc p5, 0, r4, cr0, cr0, 1 */
++	/* cdp p4, 0, cr0, cr0, cr0, 7 */
++	/* mrc p5, 0, r2, cr0, cr0, 0 */
++	/* mcr p5, 0, r3, cr0, cr0, 0 */
++	/* mcr p5, 0, r4, cr0, cr0, 1 */
++	/* str	r2, [ip], #4 */
++Lno_crunch:
++
+ 	/* Make a tail call to __sigjmp_save; it takes the same args.  */
+ 	B	PLTJMP(C_SYMBOL_NAME(__sigjmp_save))
+ 
+--- glibc-2.5/ports/sysdeps/arm/eabi/__longjmp.S	2006-09-22 04:39:51.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/__longjmp.S	2007-05-24 13:31:23.000000000 +1000
+@@ -76,6 +76,34 @@
+ 	ldcl	p1, cr15, [r12], #8
+ Lno_iwmmxt:
+ 
++	tst	a2, #HWCAP_ARM_CRUNCH
++	beq	Lno_crunch
++
++	/* Restore the call-preserved crunch registers.  */
++	/* Following instructions are cfldrd cr10, [ip], #8 (etc.)  */
++	/* ldcl	p4, cr4,  [r12], #8 */
++	/* ldcl	p4, cr5,  [r12], #8 */
++	/* ldcl	p4, cr6,  [r12], #8 */
++	/* ldcl	p4, cr7,  [r12], #8 */
++	ldcl	p4, cr8,  [r12], #8
++	ldcl	p4, cr9,  [r12], #8
++	ldcl	p4, cr10, [r12], #8
++	ldcl	p4, cr11, [r12], #8
++	ldcl	p4, cr12, [r12], #8
++	ldcl	p4, cr13, [r12], #8
++	ldcl	p4, cr14, [r12], #8
++	ldcl	p4, cr15, [r12], #8
++	/* Restore the floating-point status register.  */
++	ldr     r1, [ip], #4
++	/* Following 6 instructions are FPU_CRUNCH_SETCW (r1) clob (r2, r3).  */
++	/* mrc p5, 0, r2, cr0, cr0, 0 */
++	/* mrc p5, 0, r3, cr0, cr0, 1 */
++	/* mcr p5, 0, r1, cr0, cr0, 0 */
++	/* cdp p4, 1, cr0, cr0, cr0, 7 */
++	/* mcr p5, 0, r2, cr0, cr0, 0 */
++	/* mcr p5, 0, r3, cr0, cr0, 1 */
++Lno_crunch:
++
+ 	DO_RET(lr)
+ 
+ #ifdef IS_IN_rtld
+--- glibc-2.5/ports/sysdeps/unix/sysv/linux/arm/sysdep.h	2006-09-22 04:39:51.000000000 +1000
++++ glibc-2.5/ports/sysdeps/unix/sysv/linux/arm/sysdep.h	2007-05-24 12:59:03.000000000 +1000
+@@ -48,6 +48,7 @@
+ #define HWCAP_ARM_EDSP		128
+ #define HWCAP_ARM_JAVA		256
+ #define HWCAP_ARM_IWMMXT	512
++#define HWCAP_ARM_CRUNCH  1024
+ 
+ #ifdef __ASSEMBLER__
+ 
+--- glibc-2.5/ports/sysdeps/unix/sysv/linux/arm/dl-procinfo.c	2007-07-02 13:20:36.000000000 +1000
++++ glibc-2.5/ports/sysdeps/unix/sysv/linux/arm/dl-procinfo.c	2007-07-02 13:23:19.000000000 +1000
+@@ -47,12 +47,12 @@
+ #if !defined PROCINFO_DECL && defined SHARED
+   ._dl_arm_cap_flags
+ #else
+-PROCINFO_CLASS const char _dl_arm_cap_flags[10][10]
++PROCINFO_CLASS const char _dl_arm_cap_flags[11][10]
+ #endif
+ #ifndef PROCINFO_DECL
+ = {
+     "swp", "half", "thumb", "26bit", "fast-mult", "fpa", "vfp", "edsp",
+-    "java", "iwmmxt",
++    "java", "iwmmxt", "crunch",
+   }
+ #endif
+ #if !defined SHARED || defined PROCINFO_DECL
+--- glibc-2.5/ports/sysdeps/unix/sysv/linux/arm/dl-procinfo.h	2007-07-02 13:25:23.000000000 +1000
++++ glibc-2.5/ports/sysdeps/unix/sysv/linux/arm/dl-procinfo.h	2007-07-02 13:25:38.000000000 +1000
+@@ -24,7 +24,7 @@
+ #include <ldsodefs.h>
+ #include <sysdep.h>
+ 
+-#define _DL_HWCAP_COUNT 10
++#define _DL_HWCAP_COUNT 11
+ 
+ /* The kernel provides platform data but it is not interesting.  */
+ #define _DL_HWCAP_PLATFORM 	0
diff --git a/recipes/glibc/glibc-2.4/glibc-crunch-eabi-unwind.patch b/recipes/glibc/glibc-2.4/glibc-crunch-eabi-unwind.patch
new file mode 100644
index 0000000..d91d4fd
--- /dev/null
+++ b/recipes/glibc/glibc-2.4/glibc-crunch-eabi-unwind.patch
@@ -0,0 +1,12 @@
+--- glibc-2.7/ports/sysdeps/unix/sysv/linux/arm/eabi/nptl/unwind.h	2008-04-04 15:57:19.000000000 +1000
++++ glibc-2.7/ports/sysdeps/unix/sysv/linux/arm/eabi/nptl/unwind.h	2008-04-04 16:00:41.000000000 +1000
+@@ -138,7 +138,8 @@
+       _UVRSC_VFP = 1,       /* vfp */
+       _UVRSC_FPA = 2,       /* fpa */
+       _UVRSC_WMMXD = 3,     /* Intel WMMX data register */
+-      _UVRSC_WMMXC = 4      /* Intel WMMX control register */
++      _UVRSC_WMMXC = 4,     /* Intel WMMX control register */
++      _UVRSC_CRUNCH = 5     /* Maverick crunch register */
+     }
+   _Unwind_VRS_RegClass;
+ 
diff --git a/recipes/glibc/glibc-2.4/glibc-crunch-eabi.patch b/recipes/glibc/glibc-2.4/glibc-crunch-eabi.patch
new file mode 100644
index 0000000..8af4baf
--- /dev/null
+++ b/recipes/glibc/glibc-2.4/glibc-crunch-eabi.patch
@@ -0,0 +1,461 @@
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/bits/fenv.h glibc-2.5/ports/sysdeps/arm/eabi/bits/fenv.h
+--- glibc-2.5/ports/sysdeps/arm/eabi/bits/fenv.h	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/bits/fenv.h	2008-04-02 13:35:39.000000000 +1000
+@@ -20,7 +20,7 @@
+ # error "Never use <bits/fenv.h> directly; include <fenv.h> instead."
+ #endif
+ 
+-/* Define bits representing exceptions in the FPU status word.  */
++/* Define bits representing exceptions in the VFP FPU status word.  */
+ enum
+   {
+     FE_INVALID = 1,
+@@ -55,6 +55,40 @@
+ #define FE_TOWARDZERO FE_TOWARDZERO
+   };
+ 
++/* Define bits representing exceptions in the CRUNCH FPU status word.  */
++enum
++  {
++    FE_CRUNCH_INVALID = (1),
++#define FE_CRUNCH_INVALID FE_CRUNCH_INVALID
++    FE_CRUNCH_OVERFLOW = (4),
++#define FE_CRUNCH_OVERFLOW FE_CRUNCH_OVERFLOW
++    FE_CRUNCH_UNDERFLOW = (8),
++#define FE_CRUNCH_UNDERFLOW FE_CRUNCH_UNDERFLOW
++    FE_CRUNCH_INEXACT = (16),
++#define FE_CRUNCH_INEXACT FE_CRUNCH_INEXACT
++  };
++
++/* Amount to shift by to convert an exception to a mask bit.  */
++#define FE_CRUNCH_EXCEPT_SHIFT	5
++
++/* All supported exceptions, except DIVBYZERO.  */
++#define FE_CRUNCH_ALL_EXCEPT	\
++	(FE_CRUNCH_INVALID | FE_CRUNCH_OVERFLOW | FE_CRUNCH_UNDERFLOW | FE_CRUNCH_INEXACT)
++
++/* CRUNCH supports all of the four defined rounding modes.  */
++enum
++  {
++    FE_CRUNCH_TONEAREST = 0,
++#define FE_CRUNCH_TONEAREST FE_CRUNCH_TONEAREST
++    FE_CRUNCH_TOWARDZERO = 0x400,
++#define FE_CRUNCH_TOWARDZERO FE_CRUNCH_TOWARDZERO
++    FE_CRUNCH_DOWNWARD = 0x800,
++#define FE_CRUNCH_DOWNWARD FE_CRUNCH_DOWNWARD
++    FE_CRUNCH_UPWARD = 0xc00
++#define FE_CRUNCH_UPWARD FE_CRUNCH_UPWARD
++  };
++
++
+ /* Type representing exception flags. */
+ typedef unsigned int fexcept_t;
+ 
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/fclrexcpt.c glibc-2.5/ports/sysdeps/arm/eabi/fclrexcpt.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/fclrexcpt.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/fclrexcpt.c	2008-04-02 13:25:09.000000000 +1000
+@@ -48,6 +48,26 @@
+       return 0;
+     }
+ 
++  if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      unsigned long int temp;
++
++      /* Mask out unsupported bits/exceptions.  */
++      excepts &= FE_CRUNCH_ALL_EXCEPT;
++
++      /* Get the current floating point status. */
++      _FPU_CRUNCH_GETCW (temp);
++
++      /* Clear the relevant bits.  */
++      temp = (temp & ~FE_CRUNCH_ALL_EXCEPT) | (temp & FE_CRUNCH_ALL_EXCEPT & ~excepts);
++
++      /* Put the new data in effect.  */
++      _FPU_CRUNCH_SETCW (temp);
++
++      /* Success.  */
++      return 0;
++    }
++
+   /* Unsupported, so fail.  */
+   return 1;
+ }
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/fedisblxcpt.c glibc-2.5/ports/sysdeps/arm/eabi/fedisblxcpt.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/fedisblxcpt.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/fedisblxcpt.c	2008-04-02 13:29:44.000000000 +1000
+@@ -46,6 +46,23 @@
+       return old_exc;
+     }
+ 
++  if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      unsigned long int new_exc, old_exc;
++
++      _FPU_CRUNCH_GETCW(new_exc);
++
++      old_exc = (new_exc >> FE_CRUNCH_EXCEPT_SHIFT) & FE_CRUNCH_ALL_EXCEPT;
++
++      excepts &= FE_CRUNCH_ALL_EXCEPT;
++
++      new_exc &= ~(excepts << FE_CRUNCH_EXCEPT_SHIFT);
++
++      _FPU_CRUNCH_SETCW(new_exc);
++
++      return old_exc;
++    }
++
+   /* Unsupported, so return -1 for failure.  */
+   return -1;
+ }
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/feenablxcpt.c glibc-2.5/ports/sysdeps/arm/eabi/feenablxcpt.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/feenablxcpt.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/feenablxcpt.c	2008-04-02 13:30:30.000000000 +1000
+@@ -46,6 +46,23 @@
+       return old_exc;
+     }
+ 
++  if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      unsigned long int new_exc, old_exc;
++
++      _FPU_CRUNCH_GETCW(new_exc);
++
++      old_exc = (new_exc >> FE_CRUNCH_EXCEPT_SHIFT) & FE_CRUNCH_ALL_EXCEPT;
++
++      excepts &= FE_CRUNCH_ALL_EXCEPT;
++
++      new_exc |= (excepts << FE_CRUNCH_EXCEPT_SHIFT);
++
++      _FPU_CRUNCH_SETCW(new_exc);
++
++      return old_exc;
++    }
++
+   /* Unsupported, so return -1 for failure.  */
+   return -1;
+ }
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/fegetenv.c glibc-2.5/ports/sysdeps/arm/eabi/fegetenv.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/fegetenv.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/fegetenv.c	2008-04-02 13:31:08.000000000 +1000
+@@ -38,6 +38,16 @@
+       return 0;
+     }
+ 
++  if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      unsigned long int temp;
++      _FPU_CRUNCH_GETCW (temp);
++      envp->__cw = temp;
++
++      /* Success.  */
++      return 0;
++    }
++
+   /* Unsupported, so fail.  */
+   return 1;
+ }
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/fegetexcept.c glibc-2.5/ports/sysdeps/arm/eabi/fegetexcept.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/fegetexcept.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/fegetexcept.c	2008-04-02 13:31:40.000000000 +1000
+@@ -38,6 +38,15 @@
+       return (temp >> FE_EXCEPT_SHIFT) & FE_ALL_EXCEPT;
+     }
+ 
++  if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      unsigned long temp;
++
++      _FPU_CRUNCH_GETCW (temp);
++
++      return (temp >> FE_CRUNCH_EXCEPT_SHIFT) & FE_CRUNCH_ALL_EXCEPT;
++    }
++
+   /* Unsupported. Return all exceptions disabled.  */
+   return 0;
+ }
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/fegetround.c glibc-2.5/ports/sysdeps/arm/eabi/fegetround.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/fegetround.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/fegetround.c	2008-04-02 13:32:18.000000000 +1000
+@@ -38,6 +38,16 @@
+       return temp & FE_TOWARDZERO;
+     }
+ 
++  if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      unsigned int temp;
++
++      /* Get the current environment.  */
++      _FPU_CRUNCH_GETCW (temp);
++
++      return temp & FE_CRUNCH_UPWARD;
++    }
++
+   /* The current soft-float implementation only handles TONEAREST.  */
+   return FE_TONEAREST;
+ }
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/feholdexcpt.c glibc-2.5/ports/sysdeps/arm/eabi/feholdexcpt.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/feholdexcpt.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/feholdexcpt.c	2008-04-02 13:36:24.000000000 +1000
+@@ -47,6 +47,25 @@
+       return 0;
+     }
+ 
++  if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      unsigned long int temp;
++
++      /* Store the environment.  */
++      _FPU_CRUNCH_GETCW(temp);
++      envp->__cw = temp;
++
++      /* Now set all exceptions to non-stop.  */
++      temp &= ~(FE_CRUNCH_ALL_EXCEPT << FE_CRUNCH_EXCEPT_SHIFT);
++
++      /* And clear all exception flags.  */
++      temp &= ~FE_CRUNCH_ALL_EXCEPT;
++
++      _FPU_CRUNCH_SETCW(temp);
++
++      return 0;
++    }
++
+   /* Unsupported, so fail.  */
+   return 1;
+ }
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/fesetenv.c glibc-2.5/ports/sysdeps/arm/eabi/fesetenv.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/fesetenv.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/fesetenv.c	2008-04-02 13:43:31.000000000 +1000
+@@ -48,6 +48,26 @@
+       return 0;
+     }
+ 
++  if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      unsigned int temp;
++
++      _FPU_CRUNCH_GETCW (temp);
++      temp &= _FPU_CRUNCH_RESERVED;
++
++      if (envp == FE_DFL_ENV)
++	temp |= _FPU_CRUNCH_DEFAULT;
++      else if (envp == FE_NOMASK_ENV)
++	temp |= _FPU_CRUNCH_IEEE;
++      else
++	temp |= envp->__cw & ~_FPU_CRUNCH_RESERVED;
++
++      _FPU_CRUNCH_SETCW (temp);
++
++      /* Success.  */
++      return 0;
++    }
++
+   /* Unsupported, so fail.  */
+   return 1;
+ }
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/fesetround.c glibc-2.5/ports/sysdeps/arm/eabi/fesetround.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/fesetround.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/fesetround.c	2008-04-02 13:57:35.000000000 +1000
+@@ -45,6 +45,24 @@
+ 	default:
+ 	  return 1;
+ 	}
+     }
++  else if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      fpu_control_t temp;
++
++      switch (round)
++	{
++	case FE_CRUNCH_TONEAREST:
++	case FE_CRUNCH_UPWARD:
++	case FE_CRUNCH_DOWNWARD:
++	case FE_CRUNCH_TOWARDZERO:
++	  _FPU_CRUNCH_GETCW (temp);
++	  temp = (temp & ~FE_CRUNCH_UPWARD) | round;
++	  _FPU_CRUNCH_SETCW (temp);
++	  return 0;
++	default:
++	  return 1;
++	}
++   }
+   else if (round == FE_TONEAREST)
+     /* This is the only supported rounding mode for soft-fp.  */
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/fpu_control.h glibc-2.5/ports/sysdeps/arm/eabi/fpu_control.h
+--- glibc-2.5/ports/sysdeps/arm/eabi/fpu_control.h	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/fpu_control.h	2008-04-02 13:43:05.000000000 +1000
+@@ -45,6 +45,86 @@
+ #define _FPU_SETCW(cw) \
+   __asm__ __volatile__ ("mcr p10, 7, %0, cr1, cr0, 0" : : "r" (cw))
+ 
++/* CRUNCH SECTION */
++
++/* DSPSC register: (from EP9312 User's Guide)
++ *
++ * bits 31..29	- DAID
++ * bits 28..26	- HVID
++ * bits 25..24	- RSVD
++ * bit  23	- ISAT
++ * bit  22	- UI
++ * bit  21	- INT
++ * bit  20	- AEXC
++ * bits 19..18	- SAT
++ * bits 17..16	- FCC
++ * bit  15	- V
++ * bit  14	- FWDEN
++ * bit  13	- Invalid
++ * bit	12	- Denorm
++ * bits 11..10	- RM
++ * bits 9..5	- IXE, UFE, OFE, RSVD, IOE
++ * bits 4..0	- IX, UF, OF, RSVD, IO
++ */
++
++/* masking of interrupts */
++#define _FPU_CRUNCH_MASK_IM	(1 << 5)	/* invalid operation */
++#define _FPU_CRUNCH_MASK_ZM	0       	/* divide by zero */ 
++#define _FPU_CRUNCH_MASK_OM	(1 << 7)    /* overflow */
++#define _FPU_CRUNCH_MASK_UM    (1 << 8)	/* underflow */
++#define _FPU_CRUNCH_MASK_PM	(1 << 9)	/* inexact */
++#define _FPU_CRUNCH_MASK_DM    0           /* denormalized operation */
++
++/* Some bits in the FPSCR are not yet defined.  They must be preserved when
++   modifying the contents.  */
++#define _FPU_CRUNCH_RESERVED	0x03000042
++#define _FPU_CRUNCH_DEFAULT    0x00b00000
++/* Default + exceptions enabled. */
++#define _FPU_CRUNCH_IEEE	(_FPU_CRUNCH_DEFAULT | 0x000003a0)
++
++
++/* Macros for accessing the hardware control word.  */
++/*	cfmvr64l	%1, mvdx0    */
++/*	cfmvr64h	%2, mvdx0    */
++/*	cfmv32sc	mvdx0, dspsc */
++/*	cfmvr64l	%0, mvdx0    */
++/*	cfmv64lr	mvdx0, %1    */
++/*	cfmv64hr	mvdx0, %2    */
++#define _FPU_CRUNCH_GETCW(cw) ({			\
++	register int __t1, __t2;		\
++						\
++	__asm__ volatile (			        \
++	"mrc p5, 0, %1, cr0, cr0, 0\n\t"		\
++	"mrc p5, 0, %2, cr0, cr0, 1\n\t"		\
++	"cdp p4, 0, cr0, cr0, cr0, 7\n\t"	    \
++	"mrc p5, 0, %0, cr0, cr0, 0\n\t"		\
++	"mcr p5, 0, %1, cr0, cr0, 0\n\t"	    \
++	"mcr p5, 0, %2, cr0, cr0, 1"		    \
++	: "=r" (cw), "=r" (__t1), "=r" (__t2)	\
++	);					\
++})
++
++/* cfmvr64l	%1, mvdx0    */
++/* cfmvr64h	%2, mvdx0    */
++/* cfmv64lr	mvdx0, %0    */
++/* cfmvsc32	dspsc, mvdx0 */
++/* cfmv64lr	mvdx0, %1    */
++/* cfmv64hr	mvdx0, %2    */
++#define _FPU_CRUNCH_SETCW(cw) ({		\
++	register int __t1, __t2;		\
++						\
++	__asm__ volatile (			\
++	"mrc p5, 0, %0, cr0, cr0, 0\n\t"		\
++	"mrc p5, 0, %1, cr0, cr0, 1\n\t"		\
++	"mcr p5, 0, %2, cr0, cr0, 0\n\t"		\
++	"cdp p4, 1, cr0, cr0, cr0, 7\n\t"	    \
++	"mcr p5, 0, %0, cr0, cr0, 0\n\t"		\
++	"mcr p5, 0, %1, cr0, cr0, 1\n\t"		\
++	: "=r" (__t1), "=r" (__t2) : "r" (cw)	\
++	);					\
++})
++
++
+ /* Default control word set at startup.  */
+ extern fpu_control_t __fpu_control;
+ 
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/fraiseexcpt.c glibc-2.5/ports/sysdeps/arm/eabi/fraiseexcpt.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/fraiseexcpt.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/fraiseexcpt.c	2008-04-07 16:48:09.000000000 +1000
+@@ -103,6 +103,12 @@
+       return 0;
+     }
+ 
++  if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      /* Unsupported, for now.  */
++      return 1;
++    }
++
+   /* Unsupported, so fail.  */
+   return 1;
+ }
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/fsetexcptflg.c glibc-2.5/ports/sysdeps/arm/eabi/fsetexcptflg.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/fsetexcptflg.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/fsetexcptflg.c	2008-04-02 13:49:34.000000000 +1000
+@@ -47,6 +47,24 @@
+       return 0;
+     }
+ 
++  if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      fexcept_t temp;
++
++      /* Get the current environment.  */
++      _FPU_CRUNCH_GETCW (temp);
++
++      /* Set the desired exception mask.  */
++      temp &= ~((excepts & FE_CRUNCH_ALL_EXCEPT) << FE_CRUNCH_EXCEPT_SHIFT);
++      temp |= (*flagp & excepts & FE_CRUNCH_ALL_EXCEPT) << FE_CRUNCH_EXCEPT_SHIFT;
++
++      /* Save state back to the FPU.  */
++      _FPU_CRUNCH_SETCW (temp);
++
++      /* Success.  */
++      return 0;
++    }
++
+   /* Unsupported, so fail.  */
+   return 1;
+ }
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/ftestexcept.c glibc-2.5/ports/sysdeps/arm/eabi/ftestexcept.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/ftestexcept.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/ftestexcept.c	2008-04-02 13:50:10.000000000 +1000
+@@ -38,6 +38,16 @@
+       return temp & excepts & FE_ALL_EXCEPT;
+     }
+ 
++  if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      fexcept_t temp;
++
++      /* Get current exceptions.  */
++      _FPU_CRUNCH_GETCW(temp);
++
++      return temp & excepts & FE_CRUNCH_ALL_EXCEPT;
++    }
++
+   /* Unsupported, return 0.  */
+   return 0;
+ }
+diff -urN glibc-2.5/ports/sysdeps/arm/eabi/setfpucw.c glibc-2.5/ports/sysdeps/arm/eabi/setfpucw.c
+--- glibc-2.5/ports/sysdeps/arm/eabi/setfpucw.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/eabi/setfpucw.c	2008-04-02 13:51:28.000000000 +1000
+@@ -43,5 +43,20 @@
+       _FPU_SETCW (cw);
+     }
+ 
++  if (GLRO (dl_hwcap) & HWCAP_ARM_CRUNCH)
++    {
++      fpu_control_t cw;
++
++      /* Fetch the current control word.  */
++      _FPU_CRUNCH_GETCW (cw);
++
++      /* Preserve the reserved bits, and set the rest as the user
++	 specified (or the default, if the user gave zero).  */
++      cw &= _FPU_CRUNCH_RESERVED;
++      cw |= set & ~_FPU_CRUNCH_RESERVED;
++
++      _FPU_CRUNCH_SETCW (cw);
++    }
++
+   /* Do nothing if a VFP unit isn't present.  */
+ }
diff --git a/recipes/glibc/glibc-2.4/glibc-crunch-endian-bigword-littlebyte.patch b/recipes/glibc/glibc-2.4/glibc-crunch-endian-bigword-littlebyte.patch
new file mode 100644
index 0000000..e181e97
--- /dev/null
+++ b/recipes/glibc/glibc-2.4/glibc-crunch-endian-bigword-littlebyte.patch
@@ -0,0 +1,40 @@
+diff -urN glibc-2.5/ports/sysdeps/arm/bits/endian.h glibc-2.5/ports/sysdeps/arm/bits/endian.h
+--- glibc-2.5/ports/sysdeps/arm/bits/endian.h	2005-06-13 20:11:47.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/bits/endian.h	2007-05-18 08:41:52.000000000 +1000
+@@ -15,5 +15,9 @@
+ #ifdef __VFP_FP__
+ #define __FLOAT_WORD_ORDER __BYTE_ORDER
+ #else
++#ifdef __MAVERICK__
++#define __FLOAT_WORD_ORDER __BIG_ENDIAN
++#else
+ #define __FLOAT_WORD_ORDER __BIG_ENDIAN
+ #endif
++#endif
+diff -urN glibc-2.5/ports/sysdeps/arm/gccframe.h glibc-2.5/ports/sysdeps/arm/gccframe.h
+--- glibc-2.5/ports/sysdeps/arm/gccframe.h	2001-11-16 11:07:20.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/gccframe.h	2007-05-18 08:53:38.000000000 +1000
+@@ -17,6 +17,10 @@
+    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+    02111-1307 USA.  */
+ 
++#ifdef __MAVERICK__
++#define FIRST_PSEUDO_REGISTER 43
++#else
+ #define FIRST_PSEUDO_REGISTER 27
++#endif
+ 
+ #include <sysdeps/generic/gccframe.h>
+diff -urN glibc-2.5/ports/sysdeps/arm/gmp-mparam.h glibc-2.5/ports/sysdeps/arm/gmp-mparam.h
+--- glibc-2.5/ports/sysdeps/arm/gmp-mparam.h	2005-06-13 20:11:47.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/gmp-mparam.h	2007-05-18 08:54:21.000000000 +1000
+@@ -29,6 +29,9 @@
+ #if defined(__ARMEB__)
+ # define IEEE_DOUBLE_MIXED_ENDIAN 0
+ # define IEEE_DOUBLE_BIG_ENDIAN 1
++#elif defined(__MAVERICK__)
++#define IEEE_DOUBLE_MIXED_ENDIAN 0
++#define IEEE_DOUBLE_BIG_ENDIAN 1
+ #elif defined(__VFP_FP__)
+ # define IEEE_DOUBLE_MIXED_ENDIAN 0
+ # define IEEE_DOUBLE_BIG_ENDIAN 0
diff --git a/recipes/glibc/glibc-2.4/glibc-crunch-endian-littleword-littlebyte.patch b/recipes/glibc/glibc-2.4/glibc-crunch-endian-littleword-littlebyte.patch
new file mode 100644
index 0000000..e8559d4
--- /dev/null
+++ b/recipes/glibc/glibc-2.4/glibc-crunch-endian-littleword-littlebyte.patch
@@ -0,0 +1,40 @@
+diff -urN glibc-2.5/ports/sysdeps/arm/bits/endian.h glibc-2.5/ports/sysdeps/arm/bits/endian.h
+--- glibc-2.5/ports/sysdeps/arm/bits/endian.h	2005-06-13 20:11:47.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/bits/endian.h	2007-05-18 08:41:52.000000000 +1000
+@@ -15,5 +15,9 @@
+ #ifdef __VFP_FP__
+ #define __FLOAT_WORD_ORDER __BYTE_ORDER
+ #else
++#ifdef __MAVERICK__
++#define __FLOAT_WORD_ORDER __LITTLE_ENDIAN
++#else
+ #define __FLOAT_WORD_ORDER __BIG_ENDIAN
+ #endif
++#endif
+diff -urN glibc-2.5/ports/sysdeps/arm/gccframe.h glibc-2.5/ports/sysdeps/arm/gccframe.h
+--- glibc-2.5/ports/sysdeps/arm/gccframe.h	2001-11-16 11:07:20.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/gccframe.h	2007-05-18 08:53:38.000000000 +1000
+@@ -17,6 +17,10 @@
+    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+    02111-1307 USA.  */
+ 
++#ifdef __MAVERICK__
++#define FIRST_PSEUDO_REGISTER 43
++#else
+ #define FIRST_PSEUDO_REGISTER 27
++#endif
+ 
+ #include <sysdeps/generic/gccframe.h>
+diff -urN glibc-2.5/ports/sysdeps/arm/gmp-mparam.h glibc-2.5/ports/sysdeps/arm/gmp-mparam.h
+--- glibc-2.5/ports/sysdeps/arm/gmp-mparam.h	2005-06-13 20:11:47.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/gmp-mparam.h	2007-05-18 08:54:21.000000000 +1000
+@@ -29,6 +29,9 @@
+ #if defined(__ARMEB__)
+ # define IEEE_DOUBLE_MIXED_ENDIAN 0
+ # define IEEE_DOUBLE_BIG_ENDIAN 1
++#elif defined(__MAVERICK__)
++#define IEEE_DOUBLE_MIXED_ENDIAN 0
++#define IEEE_DOUBLE_BIG_ENDIAN 0
+ #elif defined(__VFP_FP__)
+ # define IEEE_DOUBLE_MIXED_ENDIAN 0
+ # define IEEE_DOUBLE_BIG_ENDIAN 0
diff --git a/recipes/glibc/glibc-2.4/glibc-crunch-oabi.patch b/recipes/glibc/glibc-2.4/glibc-crunch-oabi.patch
new file mode 100644
index 0000000..964abb4
--- /dev/null
+++ b/recipes/glibc/glibc-2.4/glibc-crunch-oabi.patch
@@ -0,0 +1,310 @@
+diff -urN glibc-2.5/ports/sysdeps/arm/fpu/bits/fenv.h glibc-2.5/ports/sysdeps/arm/fpu/bits/fenv.h
+--- glibc-2.5/ports/sysdeps/arm/fpu/bits/fenv.h	2001-07-06 14:55:48.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/fpu/bits/fenv.h	2007-05-18 08:44:33.000000000 +1000
+@@ -20,6 +20,45 @@
+ # error "Never use <bits/fenv.h> directly; include <fenv.h> instead."
+ #endif
+ 
++#if defined(__MAVERICK__)
++
++/* Define bits representing exceptions in the FPU status word.  */
++enum
++  {
++    FE_INVALID = 1,
++#define FE_INVALID FE_INVALID
++    FE_OVERFLOW = 4,
++#define FE_OVERFLOW FE_OVERFLOW
++    FE_UNDERFLOW = 8,
++#define FE_UNDERFLOW FE_UNDERFLOW
++    FE_INEXACT = 16,
++#define FE_INEXACT FE_INEXACT
++  };
++
++/* Amount to shift by to convert an exception to a mask bit.  */
++#define FE_EXCEPT_SHIFT	5
++
++/* All supported exceptions.  */
++#define FE_ALL_EXCEPT	\
++	(FE_INVALID | FE_OVERFLOW | FE_UNDERFLOW | FE_INEXACT)
++
++/* IEEE rounding modes.  */
++enum
++  {
++    FE_TONEAREST = 0,
++#define FE_TONEAREST    FE_TONEAREST
++    FE_TOWARDZERO = 0x400,
++#define FE_TOWARDZERO   FE_TOWARDZERO
++    FE_DOWNWARD = 0x800,
++#define FE_DOWNWARD     FE_DOWNWARD
++    FE_UPWARD = 0xc00,
++#define FE_UPWARD       FE_UPWARD
++  };
++
++#define FE_ROUND_MASK (FE_UPWARD)
++
++#else /* FPA */
++
+ /* Define bits representing exceptions in the FPU status word.  */
+ enum
+   {
+@@ -31,6 +70,7 @@
+ #define FE_OVERFLOW FE_OVERFLOW
+     FE_UNDERFLOW = 8,
+ #define FE_UNDERFLOW FE_UNDERFLOW
++
+   };
+ 
+ /* Amount to shift by to convert an exception to a mask bit.  */
+@@ -44,6 +84,8 @@
+    modes exist, but you have to encode them in the actual instruction.  */
+ #define FE_TONEAREST	0
+ 
++#endif /* FPA */
++
+ /* Type representing exception flags. */
+ typedef unsigned long int fexcept_t;
+ 
+diff -urN glibc-2.5/ports/sysdeps/arm/fpu/bits/setjmp.h glibc-2.5/ports/sysdeps/arm/fpu/bits/setjmp.h
+--- glibc-2.5/ports/sysdeps/arm/fpu/bits/setjmp.h	2006-01-10 19:22:16.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/fpu/bits/setjmp.h	2007-05-18 08:45:22.000000000 +1000
+@@ -28,7 +28,11 @@
+ #ifndef _ASM
+ /* Jump buffer contains v1-v6, sl, fp, sp and pc.  Other registers are not
+    saved.  */
++#ifdef __MAVERICK__
++typedef int __jmp_buf[34];
++#else
+ typedef int __jmp_buf[22];
+ #endif
++#endif 
+ 
+ #endif
+diff -urN glibc-2.5/ports/sysdeps/arm/fpu/fegetround.c glibc-2.5/ports/sysdeps/arm/fpu/fegetround.c
+--- glibc-2.5/ports/sysdeps/arm/fpu/fegetround.c	2001-07-06 14:55:48.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/fpu/fegetround.c	2007-05-18 08:47:52.000000000 +1000
+@@ -18,9 +18,21 @@
+    02111-1307 USA.  */
+ 
+ #include <fenv.h>
++#include <fpu_control.h>
+ 
+ int
+ fegetround (void)
+ {
++#if defined(__MAVERICK__)
++
++  unsigned long temp;
++
++  _FPU_GETCW (temp);
++  return temp & FE_ROUND_MASK;
++
++#else /* FPA */
++
+   return FE_TONEAREST;		/* Easy. :-) */
++
++#endif
+ }
+diff -urN glibc-2.5/ports/sysdeps/arm/fpu/fesetround.c glibc-2.5/ports/sysdeps/arm/fpu/fesetround.c
+--- glibc-2.5/ports/sysdeps/arm/fpu/fesetround.c	2005-10-11 01:29:32.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/fpu/fesetround.c	2007-05-18 08:48:32.000000000 +1000
+@@ -20,10 +20,26 @@
+ #include <fenv.h>
++#include <fpu_control.h>
+
+ int
+ fesetround (int round)
+ {
++#if defined(__MAVERICK__)
++  unsigned long temp;
++
++  if (round & ~FE_ROUND_MASK)
++    return 1;
++
++  _FPU_GETCW (temp);
++  temp = (temp & ~FE_ROUND_MASK) | round;
++  _FPU_SETCW (temp);
++  return 0;
++
++#else /* FPA */
++
+   /* We only support FE_TONEAREST, so there is no need for any work.  */
+   return (round == FE_TONEAREST)?0:1;
++
++#endif
+ }
+ 
+ libm_hidden_def (fesetround)
+diff -urN glibc-2.5/ports/sysdeps/arm/fpu/fpu_control.h glibc-2.5/ports/sysdeps/arm/fpu/fpu_control.h
+--- glibc-2.5/ports/sysdeps/arm/fpu/fpu_control.h	2001-07-06 14:55:48.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/fpu/fpu_control.h	2007-05-18 08:50:28.000000000 +1000
+@@ -20,6 +20,81 @@
+ #ifndef _FPU_CONTROL_H
+ #define _FPU_CONTROL_H
+ 
++#if defined(__MAVERICK__)
++
++/* DSPSC register: (from EP9312 User's Guide)
++ *
++ * bits 31..29	- DAID
++ * bits 28..26	- HVID
++ * bits 25..24	- RSVD
++ * bit  23	- ISAT
++ * bit  22	- UI
++ * bit  21	- INT
++ * bit  20	- AEXC
++ * bits 19..18	- SAT
++ * bits 17..16	- FCC
++ * bit  15	- V
++ * bit  14	- FWDEN
++ * bit  13	- Invalid
++ * bit	12	- Denorm
++ * bits 11..10	- RM
++ * bits 9..5	- IXE, UFE, OFE, RSVD, IOE
++ * bits 4..0	- IX, UF, OF, RSVD, IO
++ */
++
++/* masking of interrupts */
++#define _FPU_MASK_IM	(1 << 5)	/* invalid operation */
++#define _FPU_MASK_ZM	0		/* divide by zero */
++#define _FPU_MASK_OM	(1 << 7)	/* overflow */
++#define _FPU_MASK_UM	(1 << 8)	/* underflow */
++#define _FPU_MASK_PM	(1 << 9)	/* inexact */
++#define _FPU_MASK_DM	0		/* denormalized operation */
++
++#define _FPU_RESERVED	0xfffff000	/* These bits are reserved.  */
++
++#define _FPU_DEFAULT	0x00b00000	/* Default value.  */
++#define _FPU_IEEE	    0x00b003a0	/* Default + exceptions enabled. */
++
++/* Type of the control word.  */
++typedef unsigned int fpu_control_t;
++
++/* Macros for accessing the hardware control word.  */
++#define _FPU_GETCW(cw) ({			\
++	register int __t1, __t2;		\
++						\
++	__asm__ volatile (			\
++	"cfmvr64l	%1, mvdx0\n\t"		\
++	"cfmvr64h	%2, mvdx0\n\t"		\
++	"cfmv32sc	mvdx0, dspsc\n\t"	\
++	"cfmvr64l	%0, mvdx0\n\t"		\
++	"cfmv64lr	mvdx0, %1\n\t"		\
++	"cfmv64hr	mvdx0, %2"		\
++	: "=r" (cw), "=r" (__t1), "=r" (__t2)	\
++	);					\
++})
++
++#define _FPU_SETCW(cw) ({			\
++	register int __t0, __t1, __t2;		\
++						\
++	__asm__ volatile (			\
++	"cfmvr64l	%1, mvdx0\n\t"		\
++	"cfmvr64h	%2, mvdx0\n\t"		\
++	"cfmv64lr	mvdx0, %0\n\t"		\
++	"cfmvsc32	dspsc, mvdx0\n\t"	\
++	"cfmv64lr	mvdx0, %1\n\t"		\
++	"cfmv64hr	mvdx0, %2"		\
++	: "=r" (__t0), "=r" (__t1), "=r" (__t2)	\
++	: "0" (cw)				\
++	);					\
++})
++
++/* Default control word set at startup.  */
++extern fpu_control_t __fpu_control;
++
++#else /* FPA */
++
++
++
+ /* We have a slight terminology confusion here.  On the ARM, the register
+  * we're interested in is actually the FPU status word - the FPU control
+  * word is something different (which is implementation-defined and only
+@@ -99,4 +174,6 @@
+ /* Default control word set at startup.  */
+ extern fpu_control_t __fpu_control;
+ 
++#endif /* FPA */
++
+ #endif /* _FPU_CONTROL_H */
+diff -urN glibc-2.5/ports/sysdeps/arm/fpu/__longjmp.S glibc-2.5/ports/sysdeps/arm/fpu/__longjmp.S
+--- glibc-2.5/ports/sysdeps/arm/fpu/__longjmp.S	2001-07-06 14:55:48.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/fpu/__longjmp.S	2007-05-18 08:51:36.000000000 +1000
+@@ -30,7 +30,33 @@
+ 	movs	r0, r1		/* get the return value in place */
+ 	moveq	r0, #1		/* can't let setjmp() return zero! */
+ 
++#ifdef __MAVERICK__
++	cfldrd	mvd4,  [ip], #8
++	nop
++	cfldrd	mvd5,  [ip], #8
++	nop
++	cfldrd	mvd6,  [ip], #8
++	nop
++	cfldrd	mvd7,  [ip], #8
++	nop
++	cfldrd	mvd8,  [ip], #8
++	nop
++	cfldrd	mvd9,  [ip], #8
++	nop
++	cfldrd	mvd10, [ip], #8
++	nop
++	cfldrd	mvd11, [ip], #8
++	nop
++	cfldrd	mvd12, [ip], #8
++	nop
++	cfldrd	mvd13, [ip], #8
++	nop
++	cfldrd	mvd14, [ip], #8
++	nop
++	cfldrd	mvd15, [ip], #8
++#else
+ 	lfmfd	f4, 4, [ip] !	/* load the floating point regs */
++#endif
+ 
+ 	LOADREGS(ia, ip, {v1-v6, sl, fp, sp, pc})
+ END (__longjmp)
+diff -urN glibc-2.5/ports/sysdeps/arm/fpu/setjmp.S glibc-2.5/ports/sysdeps/arm/fpu/setjmp.S
+--- glibc-2.5/ports/sysdeps/arm/fpu/setjmp.S	2001-07-06 14:55:48.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/fpu/setjmp.S	2007-05-18 08:53:00.000000000 +1000
+@@ -24,11 +24,41 @@
+ 
+ ENTRY (__sigsetjmp)
+ 	/* Save registers */
++#ifdef __MAVERICK__
++	cfstrd	mvd4,  [r0], #8
++	nop
++	cfstrd	mvd5,  [r0], #8
++	nop
++	cfstrd	mvd6,  [r0], #8
++	nop
++	cfstrd	mvd7,  [r0], #8
++	nop
++	cfstrd	mvd8,  [r0], #8
++	nop
++	cfstrd	mvd9,  [r0], #8
++	nop
++	cfstrd	mvd10, [r0], #8
++	nop
++	cfstrd	mvd11, [r0], #8
++	nop
++	cfstrd	mvd12, [r0], #8
++	nop
++	cfstrd	mvd13, [r0], #8
++	nop
++	cfstrd	mvd14, [r0], #8
++	nop
++	cfstrd	mvd15, [r0], #8
++#else
+ 	sfmea	f4, 4, [r0]!
++#endif
+ 	stmia	r0, {v1-v6, sl, fp, sp, lr}
+ 
+ 	/* Restore pointer to jmp_buf */
++#ifdef __MAVERICK__
++	sub	r0, r0, #96
++#else
+ 	sub	r0, r0, #48
++#endif
+ 
+ 	/* Make a tail call to __sigjmp_save; it takes the same args.  */
+ 	B	PLTJMP(C_SYMBOL_NAME(__sigjmp_save))
diff --git a/recipes/glibc/glibc-2.4/glibc-crunch-oabi2.patch b/recipes/glibc/glibc-2.4/glibc-crunch-oabi2.patch
new file mode 100644
index 0000000..fe5a050
--- /dev/null
+++ b/recipes/glibc/glibc-2.4/glibc-crunch-oabi2.patch
@@ -0,0 +1,18 @@
+--- glibc-2.5/ports/sysdeps/arm/sysdep.h	2007-07-02 13:05:53.000000000 +1000
++++ glibc-2.5/ports/sysdeps/arm/sysdep.h	2007-07-02 13:06:26.000000000 +1000
+@@ -51,6 +51,7 @@
+ 
+ #endif
+ 
++#if 0 // ndef __MAVERICK__
+ /* APCS-32 doesn't preserve the condition codes across function call. */
+ #ifdef __APCS_32__
+ #define LOADREGS(cond, base, reglist...)\
+@@ -74,6 +75,7 @@
+ #define DO_RET(_reg)		\
+ 	movs pc, _reg
+ #endif
++#endif
+ 
+ /* Define an entry point visible from C.  */
+ #define	ENTRY(name)							      \
diff --git a/recipes/glibc/glibc_2.6.1.bb b/recipes/glibc/glibc_2.6.1.bb
index 949708f..0a8708c 100644
--- a/recipes/glibc/glibc_2.6.1.bb
+++ b/recipes/glibc/glibc_2.6.1.bb
@@ -1,5 +1,5 @@
 require glibc.inc
-PR = "r16"
+PR = "r17"
 
 PACKAGES_DYNAMIC = "libc6*"
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
@@ -60,7 +60,14 @@ SRC_URI = "\
   file://march-i686.patch;patch=1;pnum=0 \
 "
 
-#  file://ldsocache-varrun.patch;patch=1 \
+SRC_URI_append_ep9312 = "\
+  file://glibc-crunch-endian-littleword-littlebyte.patch;patch=1 \
+  file://glibc-crunch-eabi-setjmp_longjmp.patch;patch=1 \
+  file://glibc-crunch-eabi-unwind.patch;patch=1 \
+  file://glibc-crunch-eabi.patch;patch=1 \
+  file://glibc-crunch-eabi-force.patch;patch=1 \
+  file://glibc-crunch-eabi-fraiseexcpt.patch;patch=1 \
+"
 
 # Build fails on sh3 and sh4 without additional patches
 SRC_URI_append_sh3 = " file://no-z-defs.patch;patch=1"
-- 
1.6.3.1





