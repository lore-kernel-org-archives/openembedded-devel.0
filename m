Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MB8xJ-00012e-JH
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 16:57:41 +0200
Received: (qmail 24985 invoked by uid 813007); 1 Jun 2009 14:48:57 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jun 2009 14:48:56 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon,  1 Jun 2009 16:49:17 +0200
Message-Id: <1243867762-16540-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 01/13] gcc 4.3.3: add ep93xx patches from Martin W. Guy
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
X-List-Received-Date: Mon, 01 Jun 2009 14:57:42 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

Patchset taken from http://martinwguy.co.uk/martin/crunch/

Text from page:

On 10 March there were no known bugs in this stuff (again). On 19 March
libvorbisenc managed to find a bug in GCC whereby it incorrectly
optimizes certain code sequences that use single-precision floats. The
Maverick code generator exhibits similar symptoms for the same code, but
only at optimization levels -O2 and above, so the fastest reliable
optimization options for Maverick at present are -O -ffast-math.

I've been working on GCC-4.3.3 to make it generate working code for the
Cirrus Logic MaverickCrunch FPU, as found in their ARM-based EP9302,
EP9307, EP9312 and EP9315 chips, making floating point-intensive code
about 2.5 times faster.

This follows on from Hasjim Williams' earlier work with gcc-4.1.2 and
4.2.0, a bundle of his more recent ideas and more hacks from me.

If you want to understand the patches themselves, there is an article
about the MaverickCrunch FPU and GCC's problems with it on the Debian
wiki [1] and I have added commentary at the top of the individual patch
files.

1. http://wiki.debian.org/ArmEabiMaverickCrunch

Signed-off-by: Marcin Juszkiewicz <hrw@openembedded.org>
---
 recipes/gcc/gcc-4.3.3.inc                          |   27 +
 recipes/gcc/gcc-4.3.3/ep93xx/README                |   11 +
 recipes/gcc/gcc-4.3.3/ep93xx/URL                   |    1 +
 .../gcc/gcc-4.3.3/ep93xx/arm-crunch-20000320.patch |   13 +
 .../arm-crunch-arm_dbx_register_number.patch       |   15 +
 .../gcc-4.3.3/ep93xx/arm-crunch-ccmav-mode.patch   |  734 ++++++++++++++++++++
 .../ep93xx/arm-crunch-cfcpy-with-cfsh64.patch      |   27 +
 .../ep93xx/arm-crunch-cftruncd32-attr.patch        |   12 +
 .../ep93xx/arm-crunch-cirrus-di-flag.patch         |  248 +++++++
 .../ep93xx/arm-crunch-disable-cmpdi.patch          |   29 +
 .../gcc-4.3.3/ep93xx/arm-crunch-drop-thumb2.patch  |   98 +++
 ...eabi-ieee754-endian-littleword-littlebyte.patch |   15 +
 .../arm-crunch-eabi-mvf0-scratch-ieee754.patch     |   89 +++
 .../arm-crunch-fix-64bit-const-offsets.patch       |   25 +
 .../ep93xx/arm-crunch-fix-cirrus-reorg5.patch      |  313 +++++++++
 .../ep93xx/arm-crunch-floatsi-no-scratch.patch     |   35 +
 .../gcc-4.3.3/ep93xx/arm-crunch-fp_consts.patch    |   15 +
 .../gcc/gcc-4.3.3/ep93xx/arm-crunch-mieee.patch    |  267 +++++++
 .../ep93xx/arm-crunch-movsf-movdf-Uy.patch         |   65 ++
 .../gcc-4.3.3/ep93xx/arm-crunch-neg-enable.patch   |   31 +
 .../gcc-4.3.3/ep93xx/arm-crunch-neg-protect.patch  |   33 +
 .../gcc/gcc-4.3.3/ep93xx/arm-crunch-pipeline.patch |  461 ++++++++++++
 .../gcc/gcc-4.3.3/ep93xx/arm-crunch-readme.patch   |  107 +++
 .../ep93xx/arm-crunch-repair-truncxfsi.patch       |   29 +
 .../gcc/gcc-4.3.3/ep93xx/arm-crunch-saveregs.patch |   88 +++
 .../gcc/gcc-4.3.3/ep93xx/arm-crunch-scratch.patch  |   27 +
 .../gcc-4.3.3/ep93xx/arm-prologue_use-length.patch |   10 +
 recipes/gcc/gcc-4.3.3/ep93xx/arm-size-bugfix.patch |   33 +
 recipes/gcc/gcc-4.3.3/ep93xx/series                |   25 +
 29 files changed, 2883 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/README
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/URL
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-20000320.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-arm_dbx_register_number.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-ccmav-mode.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-cfcpy-with-cfsh64.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-cftruncd32-attr.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-cirrus-di-flag.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-disable-cmpdi.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-drop-thumb2.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-eabi-ieee754-endian-littleword-littlebyte.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-eabi-mvf0-scratch-ieee754.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-fix-64bit-const-offsets.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-fix-cirrus-reorg5.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-floatsi-no-scratch.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-fp_consts.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-mieee.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-movsf-movdf-Uy.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-neg-enable.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-neg-protect.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-pipeline.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-readme.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-repair-truncxfsi.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-saveregs.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-scratch.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-prologue_use-length.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/arm-size-bugfix.patch
 create mode 100644 recipes/gcc/gcc-4.3.3/ep93xx/series

diff --git a/recipes/gcc/gcc-4.3.3.inc b/recipes/gcc/gcc-4.3.3.inc
index 2947b18..6ccb0f1 100644
--- a/recipes/gcc/gcc-4.3.3.inc
+++ b/recipes/gcc/gcc-4.3.3.inc
@@ -65,6 +65,33 @@ SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
 SRC_URI_append_sh4  = " file://sh_unwind.patch;patch=1 \
 			file://gcc-4.2.3-linux-multilib-fix.patch;patch=1 \
 		      "
+SRC_URI_append_ep93xx = " \
+	file://ep93xx/arm-crunch-readme.patch;patch=1 \
+	file://ep93xx/arm-crunch-saveregs.patch;patch=1 \
+	file://ep93xx/arm-crunch-scratch.patch;patch=1 \
+	file://ep93xx/arm-crunch-eabi-ieee754-endian-littleword-littlebyte.patch;patch=1 \
+	file://ep93xx/arm-crunch-eabi-mvf0-scratch-ieee754.patch;patch=1 \
+	file://ep93xx/arm-crunch-20000320.patch;patch=1 \
+	file://ep93xx/arm-crunch-disable-cmpdi.patch;patch=1 \
+	file://ep93xx/arm-crunch-fix-64bit-const-offsets.patch;patch=1 \
+	file://ep93xx/arm-crunch-fp_consts.patch;patch=1 \
+	file://ep93xx/arm-crunch-neg-enable.patch;patch=1 \
+	file://ep93xx/arm-crunch-neg-protect.patch;patch=1 \
+	file://ep93xx/arm-crunch-repair-truncxfsi.patch;patch=1 \
+	file://ep93xx/arm-crunch-floatsi-no-scratch.patch;patch=1 \
+	file://ep93xx/arm-crunch-movsf-movdf-Uy.patch;patch=1 \
+	file://ep93xx/arm-crunch-drop-thumb2.patch;patch=1 \
+	file://ep93xx/arm-crunch-arm_dbx_register_number.patch;patch=1 \
+	file://ep93xx/arm-crunch-pipeline.patch;patch=1 \
+	file://ep93xx/arm-crunch-ccmav-mode.patch;patch=1 \
+	file://ep93xx/arm-crunch-cfcpy-with-cfsh64.patch;patch=1 \
+	file://ep93xx/arm-crunch-mieee.patch;patch=1 \
+	file://ep93xx/arm-size-bugfix.patch;patch=1 \
+	file://ep93xx/arm-prologue_use-length.patch;patch=1 \
+	file://ep93xx/arm-crunch-cftruncd32-attr.patch;patch=1 \
+	file://ep93xx/arm-crunch-fix-cirrus-reorg5.patch;patch=1 \
+	file://ep93xx/arm-crunch-cirrus-di-flag.patch;patch=1 \
+"
 # Language Overrides
 FORTRAN = ""
 FORTRAN_linux-gnueabi = ",fortran"
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/README b/recipes/gcc/gcc-4.3.3/ep93xx/README
new file mode 100644
index 0000000..a656a85
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/README
@@ -0,0 +1,11 @@
+This is a set of patches for gcc-4.3 that fix code generation for the
+Maverick Crunch FPU present in Cirrus Logic EP93xx devices.
+
+They are based on the patch ideas for OpenEmbedded that Hasjim Williams sent me
+privately in April 2008, with my own reimplementation of the CCMAV mode and the
+addition of a -mieee switch to fully respect denormalized values (with a 50%
+speed penalty).
+
+See the comments at the top of each patch file for further details.
+
+   Martin Guy <martinwguy@yahoo.it>, 21 November 2008 - 12 March 2009
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/URL b/recipes/gcc/gcc-4.3.3/ep93xx/URL
new file mode 100644
index 0000000..7761ed8
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/URL
@@ -0,0 +1 @@
+http://martinwguy.co.uk/martin/crunch/gcc-4.3.3-patches/
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-20000320.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-20000320.patch
new file mode 100644
index 0000000..8a9836b
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-20000320.patch
@@ -0,0 +1,13 @@
+Fix one test in the testsuite to know about Maverick crunch word order
+
+--- gcc-4.3.2/gcc/testsuite/gcc.c-torture/execute/ieee/20000320-1.c.original	2007-06-07 16:33:44.000000000 +1000
++++ gcc-4.3.2/gcc/testsuite/gcc.c-torture/execute/ieee/20000320-1.c	2007-06-07 16:34:05.000000000 +1000
+@@ -48,7 +48,7 @@
+     exit (0);
+   
+   c(0x3690000000000000ULL, 0x00000000U);
+-#if (defined __arm__ || defined __thumb__) && ! (defined __ARMEB__ || defined __VFP_FP__)
++#if (defined __arm__ || defined __thumb__) && ! (defined __ARMEB__ || defined __VFP_FP__) && ! (defined __MAVERICK__)
+   /* The ARM always stores FP numbers in big-wordian format,
+      even when running in little-byteian mode.  */
+   c(0x0000000136900000ULL, 0x00000001U);
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-arm_dbx_register_number.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-arm_dbx_register_number.patch
new file mode 100644
index 0000000..4d4b9da
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-arm_dbx_register_number.patch
@@ -0,0 +1,15 @@
+Include the Maverick Crunch registers in the GCC->DWARF2 register number
+mapping. Without this, cc -g with maverick hardfloat fails.
+
+--- gcc-4.3.2/gcc/config/arm/arm.c-original	2008-04-11 16:16:25.000000000 +1000
++++ gcc-4.3.2/gcc/config/arm/arm.c	2008-04-11 16:19:15.000000000 +1000
+@@ -18298,6 +18298,9 @@
+   if (IS_FPA_REGNUM (regno))
+     return (TARGET_AAPCS_BASED ? 96 : 16) + regno - FIRST_FPA_REGNUM;
+ 
++  if (IS_CIRRUS_REGNUM (regno))
++    return 28 + regno - FIRST_CIRRUS_FP_REGNUM;
++
+   /* FIXME: VFPv3 register numbering.  */
+   if (IS_VFP_REGNUM (regno))
+     return 64 + regno - FIRST_VFP_REGNUM;
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-ccmav-mode.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-ccmav-mode.patch
new file mode 100644
index 0000000..0edb1c0
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-ccmav-mode.patch
@@ -0,0 +1,734 @@
+These modifications implement a new condition code mode CCMAV which is used
+on floating point comparisons that were performed in the Maverick Crunch FPU.
+
+This is necessary because the Maverick sets the conditions codes differently
+from the ARM/FPA/VFP. Since we do not use the Maverick's 32-bit int modes nor
+its 64-bit comparison, these different conditions pertain to all floating point
+comparisons when compiling for Maverick hardfloat.
+
+        ARM/FPA/VFP - (cmp*):           MaverickCrunch - (cfcmp*):
+                N  Z  C  V                      N  Z  C  V
+        A == B  0  1  1  0              A == B  0  1  0  0
+        A <  B  1  0  0  0              A <  B  1  0  0  0
+        A >  B  0  0  1  0              A >  B  1  0  0  1
+        unord   0  0  1  1              unord   0  0  0  0
+
+The new mode is set on floating point comparisons instead of the usual
+CCFP and CCFPE, then acted upon when the conditional instruction flags
+are output.
+
+Furthermore, the list of conditions that cannot be tested with a single
+conditional test is different.  On ARM/FPA/VFP it is UNEQ and LTGT while
+on Maverick it is GE UNLT ORDERED and UNORDERED.
+We handle this with a new predicate "maverick_comparison_operator" that omits
+the comparisons that cannot be represented and we split the cond_exec pattern
+into for CCMAV mode plus a separate rule for every non-Maverick CC mode.
+This prevents generation of conditional instructions that cannot be represented.
+
+Although Maverick can also represent LTGT and UNEQ with a single test, we do not
+include these since it would mean splitting every other rule that uses
+"arm_comparison_operator" in a similar way for very little gain.
+
+A few other tests are added to prevent optimisations that would
+generate these unrepresentable conditions.
+
+None of these changes affect code generation for ARM or for other FPUs.
+
+One missed optimisation: movsfcc and movdfcc have been
+disabled for Maverick because we don't use the Maverick's instructions
+conditionally to avoid hardware bugs. But a limited movsfcc and movdfcc
+could be included when Maverick, that applies to all modes where the things
+to be moved do not involve the Maverick registers, if such a thing is feasible
+without the optimizer moving things into registers between the expand and the
+instruction generation.
+
+    Martin Guy <martinwguy@yahoo.it>, November 2008
+
+--- gcc-4.3.2/gcc/config/arm/arm-modes.def.old	2007-08-02 11:49:31.000000000 +0100
++++ gcc-4.3.2/gcc/config/arm/arm-modes.def	2008-11-18 14:39:39.000000000 +0000
+@@ -27,6 +27,7 @@
+ 
+ /* CCFPEmode should be used with floating inequalities,
+    CCFPmode should be used with floating equalities.
++   CCMAVmode should be used with comparisons performed in the Maverick FPU
+    CC_NOOVmode should be used with SImode integer equalities.
+    CC_Zmode should be used if only the Z flag is set correctly
+    CC_Nmode should be used if only the N (sign) flag is set correctly
+@@ -37,6 +38,7 @@
+ CC_MODE (CC_SWP);
+ CC_MODE (CCFP);
+ CC_MODE (CCFPE);
++CC_MODE (CCMAV);
+ CC_MODE (CC_DNE);
+ CC_MODE (CC_DEQ);
+ CC_MODE (CC_DLE);
+--- gcc-4.3.2/gcc/config/arm/arm.h	2008-11-18 15:32:10.000000000 +0000
++++ cluster/gcc-4.3.2/gcc/config/arm/arm.h	2008-11-21 19:24:10.000000000 +0000
+@@ -2306,7 +2306,7 @@
+ #define REVERSIBLE_CC_MODE(MODE) 1
+ 
+ #define REVERSE_CONDITION(CODE,MODE) \
+-  (((MODE) == CCFPmode || (MODE) == CCFPEmode) \
++  (((MODE) == CCFPmode || (MODE) == CCFPEmode || (MODE) == CCMAVmode) \
+    ? reverse_condition_maybe_unordered (code) \
+    : reverse_condition (code))
+ 
+--- gcc-4.3.2/gcc/config/arm/predicates.md.old	2007-08-02 11:49:31.000000000 +0100
++++ gcc-4.3.2/gcc/config/arm/predicates.md	2008-11-20 15:05:50.000000000 +0000
+@@ -195,6 +195,16 @@
+ (define_special_predicate "arm_comparison_operator"
+   (match_code "eq,ne,le,lt,ge,gt,geu,gtu,leu,ltu,unordered,ordered,unlt,unle,unge,ungt"))
+ 
++;; Comparisons that can be predicated after a Maverick FP comparison, true for
++;; floating point comparisons other than GE, UNLT, UNORDERED or ORDERED
++;;
++;; Maverick can also match LTGT and UNEQ with a single condition
++;; but including these means duplicating every rule containing
++;; arm_comparison_operator including cond_branch and all the *cc rules.
++;; Extra speed when predicating ltgt and uneq is rare enough not to be worth it.
++(define_special_predicate "maverick_comparison_operator"
++(match_code "eq,ne,le,lt,gt,unle,unge,ungt"))
++
+ (define_special_predicate "minmax_operator"
+   (and (match_code "smin,smax,umin,umax")
+        (match_test "mode == GET_MODE (op)")))
+--- gcc-4.3.2/gcc/config/arm/arm.c.old	2008-11-19 10:01:53.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.c	2008-11-21 12:49:48.000000000 +0000
+@@ -1720,6 +1720,14 @@
+ 	return 0;
+     }
+ 
++  /* Optimisation of __builtin_inunordered at the end of a
++   * function would generate conditional return on (UN)ORDERED, which cannot
++   * be represented by a single condition code test on Maverick.
++   * Since we do not have access to the specific condition used,
++   * we just disable all conditional returns on Maverick.  */
++  if (iscond && TARGET_MAVERICK && TARGET_HARD_FLOAT)
++    return 0;
++
+   /* If there are saved registers but the LR isn't saved, then we need
+      two instructions for the return.  */
+   if (saved_int_regs && !(saved_int_regs & (1 << LR_REGNUM)))
+@@ -7733,6 +7741,10 @@
+      comparison, and CCFPE otherwise.  */
+   if (GET_MODE_CLASS (GET_MODE (x)) == MODE_FLOAT)
+     {
++      /* Comparisons performed in the Maverick FPU set the CCs their own way. */
++      if (TARGET_HARD_FLOAT && TARGET_MAVERICK)
++	return CCMAVmode;
++
+       switch (op)
+ 	{
+ 	case EQ:
+@@ -7751,8 +7763,6 @@
+ 	case LE:
+ 	case GT:
+ 	case GE:
+-	  if (TARGET_HARD_FLOAT && TARGET_MAVERICK)
+-	    return CCFPmode;
+ 	  return CCFPEmode;
+ 
+ 	default:
+@@ -13367,6 +13377,29 @@
+ 	default: gcc_unreachable ();
+ 	}
+ 
++    case CCMAVmode:
++      /* Maverick cmp sets the condition codes differently from ARM/FPA/VFP */
++      switch (comp_code)
++	{
++	case GT: return ARM_VS;
++	case LE: return ARM_LE;
++	case LT: return ARM_LT;
++	case NE: return ARM_NE;
++	case EQ: return ARM_EQ;
++	case UNLE: return ARM_VC;
++	case UNGT: return ARM_GT;
++	case UNGE: return ARM_GE;
++	case UNEQ: return ARM_PL;
++	case LTGT: return ARM_MI;
++	/* These cannot be represented by a single condition code. */
++	case GE: /* Fall through */
++	case UNLT:/* Fall through */
++	case ORDERED:/* Fall through */
++	case UNORDERED:/* Fall through */
++	default:
++		gcc_unreachable ();
++	}
++
+     case CC_SWPmode:
+       switch (comp_code)
+ 	{
+--- gcc-4.3.2/gcc/config/arm/arm.md.old	2008-11-21 19:08:44.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.md	2008-11-21 19:09:18.000000000 +0000
+@@ -258,7 +258,9 @@
+ ;   they are altered at all
+ ;
+ ; JUMP_CLOB is used when the condition cannot be represented by a single
+-;   instruction (UNEQ and LTGT).  These cannot be predicated.
++;   instruction. This applies to UNEQ and LTGT for ARM/FPA/VFP comparisons,
++;   GE UNLT ORDERED and UNORDERED for Maverick comparisons.
++;   These cannot be predicated.
+ ;
+ ; NOCOND means that the condition codes are neither altered nor affect the
+ ;   output of this insn
+@@ -7332,9 +7334,9 @@
+ 
+ ;; Cirrus SF compare instruction
+ (define_insn "*cirrus_cmpsf"
+-  [(set (reg:CCFP CC_REGNUM)
+-	(compare:CCFP (match_operand:SF 0 "cirrus_fp_register" "v")
+-		      (match_operand:SF 1 "cirrus_fp_register" "v")))]
++  [(set (reg:CCMAV CC_REGNUM)
++	(compare:CCMAV (match_operand:SF 0 "cirrus_fp_register" "v")
++		       (match_operand:SF 1 "cirrus_fp_register" "v")))]
+   "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfcmps%?\\tr15, %V0, %V1"
+   [(set_attr "type"   "farith")
+@@ -7343,9 +7347,9 @@
+ 
+ ;; Cirrus DF compare instruction
+ (define_insn "*cirrus_cmpdf"
+-  [(set (reg:CCFP CC_REGNUM)
+-	(compare:CCFP (match_operand:DF 0 "cirrus_fp_register" "v")
+-		      (match_operand:DF 1 "cirrus_fp_register" "v")))]
++  [(set (reg:CCMAV CC_REGNUM)
++	(compare:CCMAV (match_operand:DF 0 "cirrus_fp_register" "v")
++		       (match_operand:DF 1 "cirrus_fp_register" "v")))]
+   "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfcmpd%?\\tr15, %V0, %V1"
+   [(set_attr "type"   "farith")
+@@ -7482,12 +7484,18 @@
+   "operands[1] = arm_gen_compare_reg (LTU, arm_compare_op0, arm_compare_op1);"
+ )
+ 
++;; Some of the following patterns may need two branch instructions, since
++;; there is no single instruction that will handle all cases. Specifically:
++;; ARM/FPA/VFP cannot test UNEQ and LTGT
++;; Maverick cannot test GE on floating point values, UNLT, ORDERED or UNORDERED.
++
+ (define_expand "bunordered"
+   [(set (pc)
+ 	(if_then_else (unordered (match_dup 1) (const_int 0))
+ 		      (label_ref (match_operand 0 "" ""))
+ 		      (pc)))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT 
++   && (TARGET_FPA || TARGET_VFP || TARGET_MAVERICK)"
+   "operands[1] = arm_gen_compare_reg (UNORDERED, arm_compare_op0,
+ 				      arm_compare_op1);"
+ )
+@@ -7497,7 +7505,8 @@
+ 	(if_then_else (ordered (match_dup 1) (const_int 0))
+ 		      (label_ref (match_operand 0 "" ""))
+ 		      (pc)))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT
++   && (TARGET_FPA || TARGET_VFP || TARGET_MAVERICK)"
+   "operands[1] = arm_gen_compare_reg (ORDERED, arm_compare_op0,
+ 				      arm_compare_op1);"
+ )
+@@ -7507,7 +7516,8 @@
+ 	(if_then_else (ungt (match_dup 1) (const_int 0))
+ 		      (label_ref (match_operand 0 "" ""))
+ 		      (pc)))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT
++   && (TARGET_FPA || TARGET_VFP || TARGET_MAVERICK)"
+   "operands[1] = arm_gen_compare_reg (UNGT, arm_compare_op0, arm_compare_op1);"
+ )
+ 
+@@ -7516,7 +7526,8 @@
+ 	(if_then_else (unlt (match_dup 1) (const_int 0))
+ 		      (label_ref (match_operand 0 "" ""))
+ 		      (pc)))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT
++   && (TARGET_FPA || TARGET_VFP || TARGET_MAVERICK)"
+   "operands[1] = arm_gen_compare_reg (UNLT, arm_compare_op0, arm_compare_op1);"
+ )
+ 
+@@ -7525,7 +7536,8 @@
+ 	(if_then_else (unge (match_dup 1) (const_int 0))
+ 		      (label_ref (match_operand 0 "" ""))
+ 		      (pc)))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT
++   && (TARGET_FPA || TARGET_VFP || TARGET_MAVERICK)"
+   "operands[1] = arm_gen_compare_reg (UNGE, arm_compare_op0, arm_compare_op1);"
+ )
+ 
+@@ -7534,18 +7546,18 @@
+ 	(if_then_else (unle (match_dup 1) (const_int 0))
+ 		      (label_ref (match_operand 0 "" ""))
+ 		      (pc)))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT
++   && (TARGET_FPA || TARGET_VFP || TARGET_MAVERICK)"
+   "operands[1] = arm_gen_compare_reg (UNLE, arm_compare_op0, arm_compare_op1);"
+ )
+ 
+-;; The following two patterns need two branch instructions, since there is
+-;; no single instruction that will handle all cases.
+ (define_expand "buneq"
+   [(set (pc)
+ 	(if_then_else (uneq (match_dup 1) (const_int 0))
+ 		      (label_ref (match_operand 0 "" ""))
+ 		      (pc)))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT
++   && (TARGET_FPA || TARGET_VFP || TARGET_MAVERICK)"
+   "operands[1] = arm_gen_compare_reg (UNEQ, arm_compare_op0, arm_compare_op1);"
+ )
+ 
+@@ -7554,7 +7566,8 @@
+ 	(if_then_else (ltgt (match_dup 1) (const_int 0))
+ 		      (label_ref (match_operand 0 "" ""))
+ 		      (pc)))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT
++   && (TARGET_FPA || TARGET_VFP || TARGET_MAVERICK)"
+   "operands[1] = arm_gen_compare_reg (LTGT, arm_compare_op0, arm_compare_op1);"
+ )
+ 
+@@ -7562,7 +7575,7 @@
+ ;; Patterns to match conditional branch insns.
+ ;;
+ 
+-; Special pattern to match UNEQ.
++; Special pattern to match UNEQ for FPA and VFP.
+ (define_insn "*arm_buneq"
+   [(set (pc)
+ 	(if_then_else (uneq (match_operand 1 "cc_register" "") (const_int 0))
+@@ -7578,7 +7591,7 @@
+    (set_attr "length" "8")]
+ )
+ 
+-; Special pattern to match LTGT.
++; Special pattern to match LTGT for FPA and VFP.
+ (define_insn "*arm_bltgt"
+   [(set (pc)
+ 	(if_then_else (ltgt (match_operand 1 "cc_register" "") (const_int 0))
+@@ -7594,6 +7607,101 @@
+    (set_attr "length" "8")]
+ )
+ 
++; Special pattern to match floating point GE for Maverick.
++(define_insn "*cirrus_bge"
++  [(set (pc)
++	(if_then_else (ge (match_operand:CCMAV 1 "cc_register" "") (const_int 0))
++		      (label_ref (match_operand 0 "" ""))
++		      (pc)))]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "*
++  gcc_assert (!arm_ccfsm_state);
++
++  return \"beq\\t%l0\;bvs\\t%l0\";
++  "
++  [(set_attr "conds" "jump_clob")
++   (set_attr "length" "8")]
++)
++
++; Special pattern to match UNORDERED for Maverick.
++(define_insn "*cirrus_bunordered"
++  [(set (pc)
++	(if_then_else (unordered (match_operand:CCMAV 1 "cc_register" "") (const_int 0))
++		      (label_ref (match_operand 0 "" ""))
++		      (pc)))]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "*
++  gcc_assert (!arm_ccfsm_state);
++
++  return \"beq\\t.+12\;bmi\\t.+8\;b\\t%l0\";
++  "
++  [(set_attr "conds" "jump_clob")
++   (set_attr "length" "12")]
++)
++
++; Special pattern to match ORDERED for Maverick.
++(define_insn "*cirrus_bordered"
++  [(set (pc)
++	(if_then_else (ordered (match_operand:CCMAV 1 "cc_register" "") (const_int 0))
++		      (label_ref (match_operand 0 "" ""))
++		      (pc)))]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "*
++  gcc_assert (!arm_ccfsm_state);
++
++  return \"beq\\t%l0\;bmi\\t%l0\";
++  "
++  [(set_attr "conds" "jump_clob")
++   (set_attr "length" "8")]
++)
++
++; Special pattern to match UNLT for Maverick.
++(define_insn "*cirrus_bunlt"
++  [(set (pc)
++	(if_then_else (unlt (match_operand:CCMAV 1 "cc_register" "") (const_int 0))
++		      (label_ref (match_operand 0 "" ""))
++		      (pc)))]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "*
++  gcc_assert (!arm_ccfsm_state);
++
++  return \"beq\\t.+12\;bvs\\t.+8\;b\\t%l0\";
++  "
++  [(set_attr "conds" "jump_clob")
++   (set_attr "length" "12")]
++)
++
++; Special atterns to match UNEQ and LTGT for Maverick, to handle
++; the two cases not covered by generic *arm_cond_branch
++
++(define_insn "*cirrus_buneq"
++  [(set (pc)
++	(if_then_else (uneq (match_operand:CCMAV 1 "cc_register" "") (const_int 0))
++		      (label_ref (match_operand 0 "" ""))
++		      (pc)))]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "*
++  gcc_assert (!arm_ccfsm_state);
++
++  return \"bpl\\t%l0\";
++  "
++  [(set_attr "conds" "jump_clob")]
++)
++
++(define_insn "*cirrus_bltgt"
++  [(set (pc)
++	(if_then_else (ltgt (match_operand:CCMAV 1 "cc_register" "") (const_int 0))
++		      (label_ref (match_operand 0 "" ""))
++		      (pc)))]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "*
++  gcc_assert (!arm_ccfsm_state);
++
++  return \"bmi\\t%l0\";
++  "
++  [(set_attr "conds" "jump_clob")]
++)
++
+ (define_insn "*arm_cond_branch"
+   [(set (pc)
+ 	(if_then_else (match_operator 1 "arm_comparison_operator"
+@@ -7613,7 +7721,7 @@
+    (set_attr "type" "branch")]
+ )
+ 
+-; Special pattern to match reversed UNEQ.
++; Special pattern to match reversed UNEQ for FPA and VFP.
+ (define_insn "*arm_buneq_reversed"
+   [(set (pc)
+ 	(if_then_else (uneq (match_operand 1 "cc_register" "") (const_int 0))
+@@ -7629,7 +7737,7 @@
+    (set_attr "length" "8")]
+ )
+ 
+-; Special pattern to match reversed LTGT.
++; Special pattern to match reversed LTGT for FPA and VFP.
+ (define_insn "*arm_bltgt_reversed"
+   [(set (pc)
+ 	(if_then_else (ltgt (match_operand 1 "cc_register" "") (const_int 0))
+@@ -7645,6 +7753,101 @@
+    (set_attr "length" "8")]
+ )
+ 
++; Patterns to match reversed UNEQ and LTGT for Maverick, the two cases
++; not covered by generic "*arm_cond_branch_reversed"
++
++(define_insn "*cirrus_buneq_reversed"
++  [(set (pc)
++	(if_then_else (uneq (match_operand:CCMAV 1 "cc_register" "") (const_int 0))
++		      (pc)
++		      (label_ref (match_operand 0 "" ""))))]
++  "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "*
++  gcc_assert (!arm_ccfsm_state);
++
++  return \"bmi\\t%l0\";
++  "
++  [(set_attr "conds" "jump_clob")]
++)
++
++(define_insn "*cirrus_bltgt_reversed"
++  [(set (pc)
++	(if_then_else (ltgt (match_operand:CCMAV 1 "cc_register" "") (const_int 0))
++		      (pc)
++		      (label_ref (match_operand 0 "" ""))))]
++  "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "*
++  gcc_assert (!arm_ccfsm_state);
++
++  return \"bpl\\t%l0\";
++  "
++  [(set_attr "conds" "jump_clob")]
++)
++
++; Special pattern to match reversed floating point GE for Maverick.
++(define_insn "*cirrus_bge_reversed"
++  [(set (pc)
++	(if_then_else (ge (match_operand:CCMAV 1 "cc_register" "") (const_int 0))
++		      (pc)
++		      (label_ref (match_operand 0 "" ""))))]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "*
++  gcc_assert (!arm_ccfsm_state);
++
++  return \"beq\\t.+12\;bvs\\t.+8\;b\\t%l0\";
++  "
++  [(set_attr "conds" "jump_clob")
++   (set_attr "length" "12")]
++)
++
++; Special pattern to match reversed UNORDERED for Maverick.
++(define_insn "*cirrus_bunordered_reversed"
++  [(set (pc)
++	(if_then_else (unordered (match_operand:CCMAV 1 "cc_register" "") (const_int 0))
++		      (pc)
++		      (label_ref (match_operand 0 "" ""))))]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "*
++  gcc_assert (!arm_ccfsm_state);
++
++  return \"beq\\t%l0\;bmi\\t%l0\";
++  "
++  [(set_attr "conds" "jump_clob")
++   (set_attr "length" "8")]
++)
++
++; Special pattern to match reversed ORDERED for Maverick.
++(define_insn "*cirrus_bordered_reversed"
++  [(set (pc)
++	(if_then_else (ordered (match_operand:CCMAV 1 "cc_register" "") (const_int 0))
++		      (pc)
++		      (label_ref (match_operand 0 "" ""))))]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "*
++  gcc_assert (!arm_ccfsm_state);
++
++  return \"beq\\t.+12\;bmi\\t.+8\;b\\t%l0\";
++  "
++  [(set_attr "conds" "jump_clob")
++   (set_attr "length" "12")]
++)
++
++; Special pattern to match reversed UNLT for Maverick.
++(define_insn "*cirrus_bunlt_reversed"
++  [(set (pc)
++	(if_then_else (unlt (match_operand:CCMAV 1 "cc_register" "") (const_int 0))
++		      (pc)
++		      (label_ref (match_operand 0 "" ""))))]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "*
++  gcc_assert (!arm_ccfsm_state);
++
++  return \"beq\\t%l0\;bvs\\t%l0\";
++  "
++  [(set_attr "conds" "jump_clob")
++   (set_attr "length" "8")]
++)
++
+ (define_insn "*arm_cond_branch_reversed"
+   [(set (pc)
+ 	(if_then_else (match_operator 1 "arm_comparison_operator"
+@@ -7696,11 +7899,16 @@
+   "operands[1] = arm_gen_compare_reg (LE, arm_compare_op0, arm_compare_op1);"
+ )
+ 
++; SGE can only be represented as a single condition code on ARM/VFP/FPA,
++; not with Maverick when the operands are floating point.
+ (define_expand "sge"
+   [(set (match_operand:SI 0 "s_register_operand" "")
+ 	(ge:SI (match_dup 1) (const_int 0)))]
+   "TARGET_32BIT"
+-  "operands[1] = arm_gen_compare_reg (GE, arm_compare_op0, arm_compare_op1);"
++  "if (TARGET_HARD_FLOAT && TARGET_MAVERICK
++       && GET_MODE_CLASS (GET_MODE (arm_compare_op0)) == MODE_FLOAT)
++     FAIL;
++   operands[1] = arm_gen_compare_reg (GE, arm_compare_op0, arm_compare_op1);"
+ )
+ 
+ (define_expand "slt"
+@@ -7738,6 +7946,7 @@
+   "operands[1] = arm_gen_compare_reg (LTU, arm_compare_op0, arm_compare_op1);"
+ )
+ 
++; SORDERED and SUNORDERED cannot be represented on Maverick
+ (define_expand "sunordered"
+   [(set (match_operand:SI 0 "s_register_operand" "")
+ 	(unordered:SI (match_dup 1) (const_int 0)))]
+@@ -7757,7 +7966,8 @@
+ (define_expand "sungt"
+   [(set (match_operand:SI 0 "s_register_operand" "")
+ 	(ungt:SI (match_dup 1) (const_int 0)))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT
++   && (TARGET_FPA || TARGET_VFP || TARGET_MAVERICK)"
+   "operands[1] = arm_gen_compare_reg (UNGT, arm_compare_op0,
+ 				      arm_compare_op1);"
+ )
+@@ -7765,11 +7975,13 @@
+ (define_expand "sunge"
+   [(set (match_operand:SI 0 "s_register_operand" "")
+ 	(unge:SI (match_dup 1) (const_int 0)))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT
++   && (TARGET_FPA || TARGET_VFP || TARGET_MAVERICK)"
+   "operands[1] = arm_gen_compare_reg (UNGE, arm_compare_op0,
+ 				      arm_compare_op1);"
+ )
+ 
++; SUNLT cannot be represented on Maverick
+ (define_expand "sunlt"
+   [(set (match_operand:SI 0 "s_register_operand" "")
+ 	(unlt:SI (match_dup 1) (const_int 0)))]
+@@ -7781,7 +7993,8 @@
+ (define_expand "sunle"
+   [(set (match_operand:SI 0 "s_register_operand" "")
+ 	(unle:SI (match_dup 1) (const_int 0)))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT
++   && (TARGET_FPA || TARGET_VFP || TARGET_MAVERICK)"
+   "operands[1] = arm_gen_compare_reg (UNLE, arm_compare_op0,
+ 				      arm_compare_op1);"
+ )
+@@ -8039,20 +8252,32 @@
+     enum rtx_code code = GET_CODE (operands[1]);
+     rtx ccreg;
+ 
+-    if (code == UNEQ || code == LTGT)
+-      FAIL;
++    /* Reject comparisons not representable by a single condition code */
++    if (TARGET_HARD_FLOAT && TARGET_MAVERICK
++	&& GET_MODE_CLASS (GET_MODE (arm_compare_op0)) == MODE_FLOAT)
++      {
++        if (code == GE || code == UNLT || code == ORDERED || code == UNORDERED)
++	  FAIL;
++      }
++    else
++      {
++	if (code == UNEQ || code == LTGT)
++	  FAIL;
++      }
+ 
+     ccreg = arm_gen_compare_reg (code, arm_compare_op0, arm_compare_op1);
+     operands[1] = gen_rtx_fmt_ee (code, VOIDmode, ccreg, const0_rtx);
+   }"
+ )
+ 
++; We do not use Maverick conditional FP instructions to avoid hardware bugs
++
+ (define_expand "movsfcc"
+   [(set (match_operand:SF 0 "s_register_operand" "")
+ 	(if_then_else:SF (match_operand 1 "arm_comparison_operator" "")
+ 			 (match_operand:SF 2 "s_register_operand" "")
+ 			 (match_operand:SF 3 "nonmemory_operand" "")))]
+-  "TARGET_32BIT"
++  "TARGET_32BIT && !(TARGET_HARD_FLOAT && TARGET_MAVERICK)"
+   "
+   {
+     enum rtx_code code = GET_CODE (operands[1]);
+@@ -10419,7 +10644,7 @@
+ 
+     operands[5] = gen_rtx_REG (mode, CC_REGNUM);
+     operands[6] = gen_rtx_COMPARE (mode, operands[2], operands[3]);
+-    if (mode == CCFPmode || mode == CCFPEmode)
++    if (mode == CCFPmode || mode == CCFPEmode || mode == CCMAVmode)
+       rc = reverse_condition_maybe_unordered (rc);
+     else
+       rc = reverse_condition (rc);
+@@ -10470,7 +10695,7 @@
+ 
+     operands[6] = gen_rtx_REG (mode, CC_REGNUM);
+     operands[7] = gen_rtx_COMPARE (mode, operands[2], operands[3]);
+-    if (mode == CCFPmode || mode == CCFPEmode)
++    if (mode == CCFPmode || mode == CCFPEmode || mode == CCMAVmode)
+       rc = reverse_condition_maybe_unordered (rc);
+     else
+       rc = reverse_condition (rc);
+@@ -10502,7 +10727,7 @@
+ 
+     operands[6] = gen_rtx_REG (mode, CC_REGNUM);
+     operands[7] = gen_rtx_COMPARE (mode, operands[2], operands[3]);
+-    if (mode == CCFPmode || mode == CCFPEmode)
++    if (mode == CCFPmode || mode == CCFPEmode || mode == CCMAVmode)
+       rc = reverse_condition_maybe_unordered (rc);
+     else
+       rc = reverse_condition (rc);
+@@ -10809,13 +11034,75 @@
+   "TARGET_32BIT && arm_arch5e"
+   "pld\\t%a0")
+ 
++;; Special predication patterns for Maverick Crunch floating-point
++;; which has a different set of predicable conditions after a floating
++;; point comparison.
++
++(define_cond_exec
++  [(match_operator 0 "maverick_comparison_operator"
++    [(match_operand:CCMAV 1 "cc_register" "")
++     (const_int 0)])]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  ""
++)
++
++;; Every else is the same as the general ARM pattern.
++
++(define_cond_exec
++  [(match_operator 0 "arm_comparison_operator"
++    [(match_operand:CC_NOOV 1 "cc_register" "")
++     (const_int 0)])]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  ""
++)
++
++(define_cond_exec
++  [(match_operator 0 "arm_comparison_operator"
++    [(match_operand:CC_Z 1 "cc_register" "")
++     (const_int 0)])]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  ""
++)
++
++(define_cond_exec
++  [(match_operator 0 "arm_comparison_operator"
++    [(match_operand:CC_SWP 1 "cc_register" "")
++     (const_int 0)])]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  ""
++)
++
++(define_cond_exec
++  [(match_operator 0 "arm_comparison_operator"
++    [(match_operand:CC_C 1 "cc_register" "")
++     (const_int 0)])]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  ""
++)
++
++(define_cond_exec
++  [(match_operator 0 "arm_comparison_operator"
++    [(match_operand:CC_N 1 "cc_register" "")
++     (const_int 0)])]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  ""
++)
++
++(define_cond_exec
++  [(match_operator 0 "arm_comparison_operator"
++    [(match_operand:CC 1 "cc_register" "")
++     (const_int 0)])]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  ""
++)
++
+ ;; General predication pattern
+ 
+ (define_cond_exec
+   [(match_operator 0 "arm_comparison_operator"
+     [(match_operand 1 "cc_register" "")
+      (const_int 0)])]
+-  "TARGET_32BIT"
++  "TARGET_32BIT && !(TARGET_HARD_FLOAT && TARGET_MAVERICK)"
+   ""
+ )
+ 
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-cfcpy-with-cfsh64.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-cfcpy-with-cfsh64.patch
new file mode 100644
index 0000000..6260699
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-cfcpy-with-cfsh64.patch
@@ -0,0 +1,27 @@
+cfcpys and cfcpyd have hardware bugs which mean they truncate denormalized
+values to zero and convert minus zero to plus zero.
+
+A 64-bit shift with a shift count of 0 copies them bitwise.
+
+    Martin Guy <martinwguy@yahoo.it>, December 2008
+
+--- gcc-4.3.2/gcc/config/arm/cirrus.md.old	2008-11-21 19:06:37.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/cirrus.md	2008-12-03 12:13:08.000000000 +0000
+@@ -485,7 +485,7 @@
+    && (GET_CODE (operands[0]) != MEM
+        || register_operand (operands[1], SFmode))"
+   "@
+-   cfcpys%?\\t%V0, %V1
++   cfsh64%?\\t%Z0, %Z1, #0\\t%@ float
+    cfldrs%?\\t%V0, %1
+    cfmvsr%?\\t%V0, %1
+    cfmvrs%?\\t%0, %V1
+@@ -514,7 +514,7 @@
+     case 1: return \"stm%?ia\\t%m0, %M1\\t%@ double\";
+     case 2: return \"#\";
+     case 3: case 4: return output_move_double (operands);
+-    case 5: return \"cfcpyd%?\\t%V0, %V1\";
++    case 5: return \"cfsh64%?\\t%Z0, %Z1, #0\\t%@ double\";
+     case 6: return \"cfldrd%?\\t%V0, %1\";
+     case 7: return \"cfmvdlr\\t%V0, %Q1\;cfmvdhr%?\\t%V0, %R1\";
+     case 8: return \"cfmvrdl%?\\t%Q0, %V1\;cfmvrdh%?\\t%R0, %V1\";
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-cftruncd32-attr.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-cftruncd32-attr.patch
new file mode 100644
index 0000000..bdc603a
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-cftruncd32-attr.patch
@@ -0,0 +1,12 @@
+--- gcc-4.3.2/gcc/config/arm/cirrus.md.old	2009-02-16 16:19:19.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/cirrus.md	2009-03-10 12:13:10.000000000 +0000
+@@ -425,7 +425,8 @@
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cftruncd32%?\\t%Y2, %V1\;cfmvr64l%?\\t%0, %Z2"
+   [(set_attr "type" "f_cvt")
+-   (set_attr "length" "8")]
++   (set_attr "length" "8")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ ; Cirrus hardware bugs: denormalized values on input are truncated to zero
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-cirrus-di-flag.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-cirrus-di-flag.patch
new file mode 100644
index 0000000..c25c108
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-cirrus-di-flag.patch
@@ -0,0 +1,248 @@
+This patch disables all 64-bit integer operations of the MaverickCrunch unit
+unless the new flag -mcirrus-di is supplied (as well as -mcpu-ep9312
+-mfpu=maverick -mfloat-abi=softfp).
+
+The 64-bit instructions (or their GCC support) are known to be buggy, as shown
+for example by openssl-0.9.8g's testsuite:
+In the unpacked openssl source directory:
+ $ ./config
+ $ vi Makefile
+ > /^CC= /s/$/-4.3-crunch/
+ > /^CFLAG= /s/$/ -mcpu=ep9312 -mfpu=maverick -mfloat-abi=softfp -mcirrus-di/
+ > :wq
+ $ make
+ $ make test
+fails if either of the two files: */sha/sha512.c and */bn/bn_asm.c are compiled
+with cirrus 64-bit support enabled. If you disable cfmul64, sha512.c works ok,
+but I've disabled everything down to cfadd64, cfsub64 and 64-bit load and store
+and bn_asm still fails, which suggests another hardware timing bug.
+
+--- gcc-4.3.2/gcc/config/arm/arm.opt.old	2009-03-10 22:08:13.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.opt	2009-03-10 12:47:31.000000000 +0000
+@@ -63,6 +63,10 @@
+ Target Report Mask(CALLER_INTERWORKING)
+ Thumb: Assume function pointers may go to non-Thumb aware code
+ 
++mcirrus-di
++Target Report Mask(CIRRUS_DI)
++Cirrus: Enable processing of 64-bit integers in the MaverickCrunch unit (buggy)
++
+ mcpu=
+ Target RejectNegative Joined
+ Specify the name of the target CPU
+--- gcc-4.3.2/gcc/config/arm/arm.c.old	2009-03-10 09:32:31.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.c	2009-03-10 12:44:48.000000000 +0000
+@@ -13917,7 +13917,8 @@
+        upper 32 bits.  This causes gcc all sorts of grief.  We can't
+        even split the registers into pairs because Cirrus SI values
+        get sign extended to 64bits-- aldyh.  */
+-    return (GET_MODE_CLASS (mode) == MODE_FLOAT) || (mode == DImode);
++    return (GET_MODE_CLASS (mode) == MODE_FLOAT)
++	    || (mode == DImode && TARGET_CIRRUS_DI);
+ 
+   if (TARGET_HARD_FLOAT && TARGET_VFP
+       && IS_VFP_REGNUM (regno))
+--- gcc-4.3.2/gcc/config/arm/arm.md.old	2009-03-10 12:14:01.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.md	2009-03-10 12:42:55.000000000 +0000
+@@ -369,7 +369,7 @@
+     (clobber (reg:CC CC_REGNUM))])]
+   "TARGET_EITHER"
+   "
+-  if (TARGET_HARD_FLOAT && TARGET_MAVERICK)
++  if (TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI)
+     {
+       if (!cirrus_fp_register (operands[0], DImode))
+         operands[0] = force_reg (DImode, operands[0]);
+@@ -405,7 +405,7 @@
+ 	(plus:DI (match_operand:DI 1 "s_register_operand" "%0, 0")
+ 		 (match_operand:DI 2 "s_register_operand" "r,  0")))
+    (clobber (reg:CC CC_REGNUM))]
+-  "TARGET_32BIT && !(TARGET_HARD_FLOAT && TARGET_MAVERICK)"
++  "TARGET_32BIT && !(TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI)"
+   "#"
+   "TARGET_32BIT && reload_completed"
+   [(parallel [(set (reg:CC_C CC_REGNUM)
+@@ -433,7 +433,7 @@
+ 		  (match_operand:SI 2 "s_register_operand" "r,r"))
+ 		 (match_operand:DI 1 "s_register_operand" "r,0")))
+    (clobber (reg:CC CC_REGNUM))]
+-  "TARGET_32BIT && !(TARGET_HARD_FLOAT && TARGET_MAVERICK)"
++  "TARGET_32BIT && !(TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI)"
+   "#"
+   "TARGET_32BIT && reload_completed"
+   [(parallel [(set (reg:CC_C CC_REGNUM)
+@@ -462,7 +462,7 @@
+ 		  (match_operand:SI 2 "s_register_operand" "r,r"))
+ 		 (match_operand:DI 1 "s_register_operand" "r,0")))
+    (clobber (reg:CC CC_REGNUM))]
+-  "TARGET_32BIT && !(TARGET_HARD_FLOAT && TARGET_MAVERICK)"
++  "TARGET_32BIT && !(TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI)"
+   "#"
+   "TARGET_32BIT && reload_completed"
+   [(parallel [(set (reg:CC_C CC_REGNUM)
+@@ -857,7 +857,7 @@
+     (clobber (reg:CC CC_REGNUM))])]
+   "TARGET_EITHER"
+   "
+-  if (TARGET_HARD_FLOAT && TARGET_MAVERICK
++  if (TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI
+       && TARGET_32BIT
+       && cirrus_fp_register (operands[0], DImode)
+       && cirrus_fp_register (operands[1], DImode))
+@@ -2979,7 +2979,8 @@
+            values to iwmmxt regs and back.  */
+         FAIL;
+     }
+-  else if (!TARGET_REALLY_IWMMXT && !(TARGET_HARD_FLOAT && TARGET_MAVERICK))
++  else if (!TARGET_REALLY_IWMMXT
++	   && !(TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI))
+     FAIL;
+   "
+ )
+@@ -4544,7 +4545,8 @@
+   [(set (match_operand:DI 0 "nonimmediate_di_operand" "=r, r, r, r, m")
+ 	(match_operand:DI 1 "di_operand"              "rDa,Db,Dc,mi,r"))]
+   "TARGET_ARM
+-   && !(TARGET_HARD_FLOAT && (TARGET_MAVERICK || TARGET_VFP))
++   && !(TARGET_HARD_FLOAT
++	&& ((TARGET_MAVERICK && TARGET_CIRRUS_DI) || TARGET_VFP))
+    && !TARGET_IWMMXT
+    && (   register_operand (operands[0], DImode)
+        || register_operand (operands[1], DImode))"
+@@ -4664,7 +4666,7 @@
+   [(set (match_operand:DI 0 "nonimmediate_operand" "=l,l,l,l,>,l, m,*r")
+ 	(match_operand:DI 1 "general_operand"      "l, I,J,>,l,mi,l,*r"))]
+   "TARGET_THUMB1
+-   && !(TARGET_HARD_FLOAT && TARGET_MAVERICK)
++   && !(TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI)
+    && (   register_operand (operands[0], DImode)
+        || register_operand (operands[1], DImode))"
+   "*
+--- gcc-4.3.2/gcc/config/arm/cirrus.md.old	2009-03-10 12:13:10.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/cirrus.md	2009-03-10 12:32:00.000000000 +0000
+@@ -85,7 +85,7 @@
+   [(set (match_operand:DI          0 "cirrus_fp_register" "=v")
+ 	(plus:DI (match_operand:DI 1 "cirrus_fp_register"  "v")
+ 		 (match_operand:DI 2 "cirrus_fp_register"  "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI"
+   "cfadd64%?\\t%V0, %V1, %V2"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -126,7 +126,7 @@
+   [(set (match_operand:DI           0 "cirrus_fp_register" "=v")
+ 	(minus:DI (match_operand:DI 1 "cirrus_fp_register"  "v")
+ 		  (match_operand:DI 2 "cirrus_fp_register"  "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI"
+   "cfsub64%?\\t%V0, %V1, %V2"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -176,7 +176,7 @@
+   [(set (match_operand:DI          0 "cirrus_fp_register" "=v")
+ 	(mult:DI (match_operand:DI 2 "cirrus_fp_register"  "v")
+ 		 (match_operand:DI 1 "cirrus_fp_register"  "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI"
+   "cfmul64%?\\t%V0, %V1, %V2"
+   [(set_attr "type" "fmul")
+    (set_attr "cirrus" "normal")]
+@@ -261,7 +261,7 @@
+   [(set (match_operand:DI            0 "cirrus_fp_register" "=v")
+ 	(ashift:DI (match_operand:DI 1 "cirrus_fp_register"  "v")
+ 		   (match_operand:SI 2 "register_operand"    "r")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI"
+   "cfrshl64%?\\t%V1, %V0, %s2"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -271,7 +271,7 @@
+   [(set (match_operand:DI            0 "cirrus_fp_register" "=v")
+ 	(ashift:DI (match_operand:DI 1 "cirrus_fp_register"  "v")
+ 		   (match_operand:SI 2 "cirrus_shift_const"  "")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI"
+   "cfsh64%?\\t%V0, %V1, #%s2"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -281,7 +281,7 @@
+   [(set (match_operand:DI            0 "cirrus_fp_register" "=v")
+ 	(ashiftrt:DI (match_operand:DI 1 "cirrus_fp_register"  "v")
+ 		     (match_operand:SI 2 "cirrus_shift_const"  "")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI"
+   "cfsh64%?\\t%V0, %V1, #-%s2"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -290,7 +290,7 @@
+ (define_insn "*cirrus_absdi2"
+   [(set (match_operand:DI         0 "cirrus_fp_register" "=v")
+ 	(abs:DI (match_operand:DI 1 "cirrus_fp_register"  "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI"
+   "cfabs64%?\\t%V0, %V1"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -301,7 +301,7 @@
+   [(set (match_operand:DI         0 "cirrus_fp_register" "=v")
+ 	(neg:DI (match_operand:DI 1 "cirrus_fp_register"  "v")))
+    (clobber (reg:CC CC_REGNUM))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI"
+   "cfneg64%?\\t%V0, %V1"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -392,7 +392,7 @@
+ (define_insn "floatdisf2"
+   [(set (match_operand:SF           0 "cirrus_fp_register" "=v")
+ 	(float:SF (match_operand:DI 1 "cirrus_fp_register" "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI"
+   "cfcvt64s%?\\t%V0, %V1"
+   [(set_attr "type" "f_cvt")
+    (set_attr "cirrus" "normal")]
+@@ -401,7 +401,7 @@
+ (define_insn "floatdidf2"
+   [(set (match_operand:DF 0 "cirrus_fp_register" "=v")
+ 	(float:DF (match_operand:DI 1 "cirrus_fp_register" "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI"
+   "cfcvt64d%?\\t%V0, %V1"
+   [(set_attr "type" "f_cvt")
+    (set_attr "cirrus" "normal")]
+@@ -454,7 +454,7 @@
+ (define_insn "*cirrus_arm_movdi"
+   [(set (match_operand:DI 0 "nonimmediate_di_operand" "=r,r,o<>,v,r,v,m,v")
+ 	(match_operand:DI 1 "di_operand"              "rIK,mi,r,r,v,mi,v,v"))]
+-  "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK && TARGET_CIRRUS_DI"
+   "*
+   {
+   switch (which_alternative)
+--- gcc-4.3.2/gcc/doc/invoke.texi.old	2009-03-10 17:17:19.000000000 +0000
++++ gcc-4.3.2/gcc/doc/invoke.texi	2009-03-10 17:24:19.000000000 +0000
+@@ -429,6 +429,7 @@
+ -msingle-pic-base  -mno-single-pic-base @gol
+ -mpic-register=@var{reg} @gol
+ -mnop-fun-dllimport @gol
++-mirrus-di @gol
+ -mieee @gol
+ -mpoke-function-name @gol
+ -mthumb  -marm @gol
+@@ -8670,6 +8671,16 @@
+ Specify the register to be used for PIC addressing.  The default is R10
+ unless stack-checking is enabled, when R9 is used.
+ 
++@item -mcirrus-di
++When compiling for the Maverick FPU, enable handling of 64-bit integers
++in the FPU (add, subtract, multiply, arithmetic shifts and conversions).
++Normally they are disabled because some instruction sequences can give
++erroneous results.
++This option only has any effect if the
++@option{-mcpu=ep9312} @option{-mfpu=maverick} options have been used and is
++disabled by default.
++The default can be re-enabled by use of the @option{-mno-cirrus-di} switch.
++
+ @item -mieee
+ When compiling for the Maverick FPU, disable the instructions that fail
+ to honor denormalized values. As these include floating point add, sub,
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-disable-cmpdi.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-disable-cmpdi.patch
new file mode 100644
index 0000000..7db1274
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-disable-cmpdi.patch
@@ -0,0 +1,29 @@
+Disable the Maverick's cmpdi instruction which cannot perform the simultaneous
+signed/unsigned comparison expected by GCC.
+
+diff -ruN /home/hwilliams/openembedded/build/tmp/work/ep9312-angstrom-linux-gnueabi/gcc-cross-4.1.2-r0/gcc-4.1.2/gcc/config/arm/arm.md gcc-4.1.2/gcc/config/arm/arm.md
+--- /home/hwilliams/openembedded/build/tmp/work/ep9312-angstrom-linux-gnueabi/gcc-cross-4.1.2-r0/gcc-4.1.2/gcc/config/arm/arm.md	2006-09-28 03:10:22.000000000 +1000
++++ gcc-4.1.2/gcc/config/arm/arm.md	2007-05-15 09:53:21.000000000 +1000
+@@ -7354,10 +7366,12 @@
+ )
+ 
+ ;; Cirrus DI compare instruction
++;; This is disabled and left go through ARM core registers, because currently
++;; Crunch coprocessor does only signed comparison.
+ (define_expand "cmpdi"
+   [(match_operand:DI 0 "cirrus_fp_register" "")
+    (match_operand:DI 1 "cirrus_fp_register" "")]
+-  "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK & 0"
+   "{
+      arm_compare_op0 = operands[0];
+      arm_compare_op1 = operands[1];
+@@ -7368,7 +7382,7 @@
+   [(set (reg:CC CC_REGNUM)
+ 	(compare:CC (match_operand:DI 0 "cirrus_fp_register" "v")
+ 		    (match_operand:DI 1 "cirrus_fp_register" "v")))]
+-  "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK & 0"
+   "cfcmp64%?\\tr15, %V0, %V1"
+   [(set_attr "type"   "mav_farith")
+    (set_attr "cirrus" "compare")]
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-drop-thumb2.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-drop-thumb2.patch
new file mode 100644
index 0000000..2722e2d
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-drop-thumb2.patch
@@ -0,0 +1,98 @@
+MaverickCrunch FPUs only exist in silicon with an arm920t core and Cirrus have
+stopped development of their ARM processors (1 April 2008, no joke!)
+
+This means Maverick-Thumb2 combinations will never exist in hardware,
+so remove all existing Maverick+Thumb2 descriptions.
+
+    Martin Guy <martinwguy@yahoo.it> November 2008
+
+--- gcc-4.3.2/gcc/config/arm/cirrus.md.old	2008-11-18 12:09:40.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/cirrus.md	2008-11-18 12:12:38.000000000 +0000
+@@ -452,87 +452,3 @@
+    (set_attr "neg_pool_range" "    *,     *, *,     *, 1008,      *,   1008,    *,    *,     *")
+    (set_attr "cirrus"         "  not,  not,not,   not, not,normal,double,move,normal,double")]
+ )
+-
+-(define_insn "*cirrus_thumb2_movdi"
+-  [(set (match_operand:DI 0 "nonimmediate_di_operand" "=r,r,o<>,v,r,v,m,v")
+-	(match_operand:DI 1 "di_operand"              "rIK,mi,r,r,v,mi,v,v"))]
+-  "TARGET_THUMB2 && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+-  "*
+-  {
+-  switch (which_alternative)
+-    {
+-    case 0:
+-    case 1:
+-    case 2:
+-      return (output_move_double (operands));
+-
+-    case 3: return \"cfmv64lr%?\\t%V0, %Q1\;cfmv64hr%?\\t%V0, %R1\";
+-    case 4: return \"cfmvr64l%?\\t%Q0, %V1\;cfmvr64h%?\\t%R0, %V1\";
+-
+-    case 5: return \"cfldr64%?\\t%V0, %1\";
+-    case 6: return \"cfstr64%?\\t%V1, %0\";
+-
+-    /* Shifting by 0 will just copy %1 into %0.  */
+-    case 7: return \"cfsh64%?\\t%V0, %V1, #0\";
+-
+-    default: abort ();
+-    }
+-  }"
+-  [(set_attr "length"         "  8,   8,     8,   8,     8,     4,     4,     4")
+-   (set_attr "type"           "  *,load2,store2,   *,     *,  load2,store2,     *")
+-   (set_attr "pool_range"     "  *,4096,     *,   *,     *,  1020,     *,     *")
+-   (set_attr "neg_pool_range" "  *,   0,     *,   *,     *,  1008,     *,     *")
+-   (set_attr "cirrus"         "not, not,   not,move,normal,double,double,normal")]
+-)
+-
+-(define_insn "*thumb2_cirrus_movsf_hard_insn"
+-  [(set (match_operand:SF 0 "nonimmediate_operand" "=v,v,v,r,m,r,r,m")
+-        (match_operand:SF 1 "general_operand"      "v,mE,r,v,v,r,mE,r"))]
+-  "TARGET_THUMB2 && TARGET_HARD_FLOAT && TARGET_MAVERICK
+-   && (GET_CODE (operands[0]) != MEM
+-       || register_operand (operands[1], SFmode))"
+-  "@
+-   cfcpys%?\\t%V0, %V1
+-   cfldrs%?\\t%V0, %1
+-   cfmvsr%?\\t%V0, %1
+-   cfmvrs%?\\t%0, %V1
+-   cfstrs%?\\t%V1, %0
+-   mov%?\\t%0, %1
+-   ldr%?\\t%0, %1\\t%@ float
+-   str%?\\t%1, %0\\t%@ float"
+-  [(set_attr "length"         "     *,     *,   *,     *,     *,  4,   4,     4")
+-   (set_attr "type"           "     *,  load1,   *,     *,store1,  *,load1,store1")
+-   (set_attr "pool_range"     "     *,   1020,   *,     *,     *,  *,4096,     *")
+-   (set_attr "neg_pool_range" "     *,   1008,   *,     *,     *,  *,   0,     *")
+-   (set_attr "cirrus"         "normal,normal,move,normal,normal,not, not,   not")]
+-)
+-
+-(define_insn "*thumb2_cirrus_movdf_hard_insn"
+-  [(set (match_operand:DF 0 "nonimmediate_operand" "=r,Q,r,m,r,v,v,v,r,m")
+-	(match_operand:DF 1 "general_operand"       "Q,r,r,r,mF,v,mF,r,v,v"))]
+-  "TARGET_THUMB2
+-   && TARGET_HARD_FLOAT && TARGET_MAVERICK
+-   && (GET_CODE (operands[0]) != MEM
+-       || register_operand (operands[1], DFmode))"
+-  "*
+-  {
+-  switch (which_alternative)
+-    {
+-    case 0: return \"ldm%?ia\\t%m1, %M0\\t%@ double\";
+-    case 1: return \"stm%?ia\\t%m0, %M1\\t%@ double\";
+-    case 2: case 3: case 4: return output_move_double (operands);
+-    case 5: return \"cfcpyd%?\\t%V0, %V1\";
+-    case 6: return \"cfldrd%?\\t%V0, %1\";
+-    case 7: return \"cfmvdlr\\t%V0, %Q1\;cfmvdhr%?\\t%V0, %R1\";
+-    case 8: return \"cfmvrdl%?\\t%Q0, %V1\;cfmvrdh%?\\t%R0, %V1\";
+-    case 9: return \"cfstrd%?\\t%V1, %0\";
+-    default: abort ();
+-    }
+-  }"
+-  [(set_attr "type"           "load1,store2,  *,store2,load1,     *,  load1,   *,     *,store2")
+-   (set_attr "length"         "   4,     4,  8,     8,   8,     4,     4,   8,     8,     4")
+-   (set_attr "pool_range"     "   *,     *,  *,     *,4092,     *,  1020,   *,     *,     *")
+-   (set_attr "neg_pool_range" "   *,     *,  *,     *,   0,     *,  1008,   *,     *,     *")
+-   (set_attr "cirrus"         " not,   not,not,   not, not,normal,double,move,normal,double")]
+-)
+-
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-eabi-ieee754-endian-littleword-littlebyte.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-eabi-ieee754-endian-littleword-littlebyte.patch
new file mode 100644
index 0000000..f16336d
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-eabi-ieee754-endian-littleword-littlebyte.patch
@@ -0,0 +1,15 @@
+Define Maverick floating point word order in libgcc's assemble support routines
+
+--- ../gcc-cross-4.1.2-r4-unpatched/gcc-4.1.2/gcc/config/arm/ieee754-df.S	2007-06-07 13:06:52.000000000 +1000
++++ gcc-4.1.2/gcc/config/arm/ieee754-df.S	2008-04-07 13:15:49.000000000 +1000
+@@ -42,8 +42,9 @@
+ 
+ 
+ @ For FPA, float words are always big-endian.
++@ For MAVERICK, float words are always little-endian.
+ @ For VFP, floats words follow the memory system mode.
+-#if defined(__VFP_FP__) && !defined(__ARMEB__)
++#if ((defined(__VFP_FP__) && !defined(__ARMEB__)) || defined(__MAVERICK__))
+ #define xl r0
+ #define xh r1
+ #define yl r2
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-eabi-mvf0-scratch-ieee754.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-eabi-mvf0-scratch-ieee754.patch
new file mode 100644
index 0000000..72283f5
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-eabi-mvf0-scratch-ieee754.patch
@@ -0,0 +1,89 @@
+Don't try to copy results into an FPA register when compiling for Maverick
+
+diff -urN gcc-4.3.0/gcc/config/arm-original/arm/ieee754-df.S gcc-4.3.0/gcc/config/arm/ieee754-df.S
+--- gcc-4.3.0/gcc/config/arm-original/arm/ieee754-df.S	2008-02-19 14:32:15.000000000 +1000
++++ gcc-4.3.0/gcc/config/arm/ieee754-df.S	2008-04-10 16:38:45.000000000 +1000
+@@ -500,7 +500,7 @@
+ ARM_FUNC_ALIAS aeabi_ul2d floatundidf
+ 
+ 	orrs	r2, r0, r1
+-#if !defined (__VFP_FP__) && !defined(__SOFTFP__)
++#if !defined (__VFP_FP__) && !defined (__MAVERICK__) && !defined(__SOFTFP__)
+ 	do_it	eq, t
+ 	mvfeqd	f0, #0.0
+ #else
+@@ -508,7 +508,7 @@
+ #endif
+ 	RETc(eq)
+ 
+-#if !defined (__VFP_FP__) && !defined(__SOFTFP__)
++#if !defined (__VFP_FP__) && !defined (__MAVERICK__) && !defined(__SOFTFP__)
+ 	@ For hard FPA code we want to return via the tail below so that
+ 	@ we can return the result in f0 as well as in r0/r1 for backwards
+ 	@ compatibility.
+@@ -526,7 +526,7 @@
+ ARM_FUNC_ALIAS aeabi_l2d floatdidf
+ 
+ 	orrs	r2, r0, r1
+-#if !defined (__VFP_FP__) && !defined(__SOFTFP__)
++#if !defined (__VFP_FP__) && !defined (__MAVERICK__) && !defined(__SOFTFP__)
+ 	do_it	eq, t
+ 	mvfeqd	f0, #0.0
+ #else
+@@ -534,7 +534,7 @@
+ #endif
+ 	RETc(eq)
+ 
+-#if !defined (__VFP_FP__) && !defined(__SOFTFP__)
++#if !defined (__VFP_FP__) && !defined (__MAVERICK__) && !defined(__SOFTFP__)
+ 	@ For hard FPA code we want to return via the tail below so that
+ 	@ we can return the result in f0 as well as in r0/r1 for backwards
+ 	@ compatibility.
+@@ -586,7 +586,7 @@
+ 	add	r4, r4, r2
+ 	b	LSYM(Lad_p)
+ 
+-#if !defined (__VFP_FP__) && !defined(__SOFTFP__)
++#if !defined (__VFP_FP__) && !defined (__MAVERICK__) && !defined(__SOFTFP__)
+ 
+ 	@ Legacy code expects the result to be returned in f0.  Copy it
+ 	@ there as well.
+diff -urN gcc-4.3.0/gcc/config/arm-original/arm/ieee754-sf.S gcc-4.3.0/gcc/config/arm/ieee754-sf.S
+--- gcc-4.3.0/gcc/config/arm-original/arm/ieee754-sf.S	2008-02-19 14:32:15.000000000 +1000
++++ gcc-4.3.0/gcc/config/arm/ieee754-sf.S	2008-04-10 16:39:15.000000000 +1000
+@@ -330,7 +330,7 @@
+ ARM_FUNC_ALIAS aeabi_ul2f floatundisf
+ 
+ 	orrs	r2, r0, r1
+-#if !defined (__VFP_FP__) && !defined(__SOFTFP__)
++#if !defined (__VFP_FP__) && !defined (__MAVERICK__) && !defined(__SOFTFP__)
+ 	do_it	eq, t
+ 	mvfeqs	f0, #0.0
+ #else
+@@ -345,7 +345,7 @@
+ ARM_FUNC_ALIAS aeabi_l2f floatdisf
+ 
+ 	orrs	r2, r0, r1
+-#if !defined (__VFP_FP__) && !defined(__SOFTFP__)
++#if !defined (__VFP_FP__) && !defined (__MAVERICK__) && !defined(__SOFTFP__)
+ 	do_it	eq, t
+ 	mvfeqs	f0, #0.0
+ #else
+@@ -363,7 +363,7 @@
+ 	rsc	ah, ah, #0
+ #endif
+ 1:
+-#if !defined (__VFP_FP__) && !defined(__SOFTFP__)
++#if !defined (__VFP_FP__) && !defined (__MAVERICK__) && !defined(__SOFTFP__)
+ 	@ For hard FPA code we want to return via the tail below so that
+ 	@ we can return the result in f0 as well as in r0 for backwards
+ 	@ compatibility.
+@@ -432,7 +432,7 @@
+ 	biceq	r0, r0, ip, lsr #31
+ 	RET
+ 
+-#if !defined (__VFP_FP__) && !defined(__SOFTFP__)
++#if !defined (__VFP_FP__) && !defined (__MAVERICK__) && !defined(__SOFTFP__)
+ 
+ LSYM(f0_ret):
+ 	str	r0, [sp, #-4]!
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-fix-64bit-const-offsets.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-fix-64bit-const-offsets.patch
new file mode 100644
index 0000000..e3d6701
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-fix-64bit-const-offsets.patch
@@ -0,0 +1,25 @@
+Fixup possible address offsets for constant double integers
+also when using Maverick to handle 64-bit integers.
+
+--- gcc-4.3.2/gcc/config/arm/arm.c-original	2007-06-12 14:46:20.000000000 +1000
++++ gcc-4.3.2/gcc/config/arm/arm.c	2007-06-12 14:48:06.000000000 +1000
+@@ -3815,7 +3815,8 @@
+ 
+   use_ldrd = (TARGET_LDRD
+ 	      && (mode == DImode
+-		  || (mode == DFmode && (TARGET_SOFT_FLOAT || TARGET_VFP))));
++		  || (mode == DFmode
++		      && (TARGET_SOFT_FLOAT || TARGET_VFP || TARGET_MAVERICK))));
+ 
+   if (code == POST_INC || code == PRE_DEC
+       || ((code == PRE_INC || code == POST_DEC)
+@@ -4424,7 +4424,8 @@
+ 	  /* VFP addressing modes actually allow greater offsets, but for
+ 	     now we just stick with the lowest common denominator.  */
+ 	  if (mode == DImode
+-	      || ((TARGET_SOFT_FLOAT || TARGET_VFP) && mode == DFmode))
++	      || (mode == DFmode
++		  && (TARGET_SOFT_FLOAT || TARGET_VFP || TARGET_MAVERICK)))
+ 	    {
+ 	      low_n = n & 0x0f;
+ 	      n &= ~0x0f;
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-fix-cirrus-reorg5.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-fix-cirrus-reorg5.patch
new file mode 100644
index 0000000..313b700
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-fix-cirrus-reorg5.patch
@@ -0,0 +1,313 @@
+This patch:
+- maps branch-cirrus_insn to branch-nop-nop-cirrus_insn
+- maps branch-noncirrus-cirrus to branch-noncirrus-nop-cirrus
+- inserts a nop in load rN - load/store64 mvX,[rN] sequences to avoid an
+  undocumented hardware bug.
+- always fixes up invalid code sequences when compiling hard Maverick insns
+  and removes the -mcirrus-fix-invalid-insns flag because chip development
+  has stopped and all existing silicon has these bugs, while the extra code
+  that claimed to do other things for the extra bugs in the old revision D0
+  silicon was complete junk.
+- Takes the cirrus checking out of the main arm_reorg loop, to remove the
+  speed penalty it caused when not compiling for Maverick.
+
+	Martin Guy <martinwguy@yahoo.it> 3 March 2009
+
+--- gcc-4.3.2/gcc/config/arm/arm.c.orig	2009-02-18 14:59:22.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.c	2009-03-10 09:32:31.000000000 +0000
+@@ -134,7 +134,7 @@
+ static int arm_address_cost (rtx);
+ static bool arm_memory_load_p (rtx);
+ static bool arm_cirrus_insn_p (rtx);
+-static void cirrus_reorg (rtx);
++static void cirrus_reorg (void);
+ static void arm_init_builtins (void);
+ static rtx arm_expand_builtin (tree, rtx, rtx, enum machine_mode, int);
+ static void arm_init_iwmmxt_builtins (void);
+@@ -6580,122 +6580,122 @@
+ 
+ /* Cirrus reorg for invalid instruction combinations.  */
+ static void
+-cirrus_reorg (rtx first)
++cirrus_reorg (void)
+ {
+-  enum attr_cirrus attr;
+-  rtx body = PATTERN (first);
+-  rtx t;
+-  int nops;
+-
+-  /* Any branch must be followed by 2 non Cirrus instructions.  */
+-  if (GET_CODE (first) == JUMP_INSN && GET_CODE (body) != RETURN)
+-    {
+-      nops = 0;
+-      t = next_nonnote_insn (first);
+-
+-      if (arm_cirrus_insn_p (t))
+-	++ nops;
+-
+-      if (arm_cirrus_insn_p (next_nonnote_insn (t)))
+-	++ nops;
+-
+-      while (nops --)
+-	emit_insn_after (gen_nop (), first);
+-
+-      return;
+-    }
+-
+-  /* (float (blah)) is in parallel with a clobber.  */
+-  if (GET_CODE (body) == PARALLEL && XVECLEN (body, 0) > 0)
+-    body = XVECEXP (body, 0, 0);
+-
+-  if (GET_CODE (body) == SET)
+-    {
+-      rtx lhs = XEXP (body, 0), rhs = XEXP (body, 1);
+-
+-      /* cfldrd, cfldr64, cfstrd, cfstr64 must
+-	 be followed by a non Cirrus insn.  */
+-      if (get_attr_cirrus (first) == CIRRUS_DOUBLE)
+-	{
+-	  if (arm_cirrus_insn_p (next_nonnote_insn (first)))
+-	    emit_insn_after (gen_nop (), first);
++  rtx insn, body;
+ 
+-	  return;
+-	}
+-      else if (arm_memory_load_p (first))
+-	{
+-	  unsigned int arm_regno;
++  /* Examine every instruction and see if it needs adjusting */
++  for (insn = get_insns (); insn; insn = next_insn (insn))
++    switch (GET_CODE (insn))
++      {
++      case JUMP_INSN:
++	/* Any branch must be followed by 2 non Cirrus instructions. */
++	body = PATTERN (insn);
++	if (GET_CODE (body) != RETURN)
++	  {
++	    rtx next = next_real_insn (insn);
+ 
+-	  /* Any ldr/cfmvdlr, ldr/cfmvdhr, ldr/cfmvsr, ldr/cfmv64lr,
+-	     ldr/cfmv64hr combination where the Rd field is the same
+-	     in both instructions must be split with a non Cirrus
+-	     insn.  Example:
++	    if (arm_cirrus_insn_p (next))
++	      {
++		emit_insn_after (gen_nop (), insn);
++		emit_insn_after (gen_nop (), insn);
++	      }
++	    else
++	      if (arm_cirrus_insn_p (next_real_insn (next)))
++		emit_insn_after (gen_nop (), next);
++	  }
++	break;
+ 
++      case INSN:
++	/* Any ldr/cfstrd combination where the Rd field is the same
++	   in both instructions must be split with a non Cirrus insn.
++	   Example:
+ 	     ldr r0, blah
+ 	     nop
+-	     cfmvsr mvf0, r0.  */
+-
+-	  /* Get Arm register number for ldr insn.  */
+-	  if (GET_CODE (lhs) == REG)
+-	    arm_regno = REGNO (lhs);
+-	  else
+-	    {
+-	      gcc_assert (GET_CODE (rhs) == REG);
+-	      arm_regno = REGNO (rhs);
+-	    }
++	     cfstrd mvd0, [r0]
++	    otherwise the FPU stores to random memory locations.
++	 */
++	body = PATTERN (insn);
+ 
+-	  /* Next insn.  */
+-	  first = next_nonnote_insn (first);
+-
+-	  if (! arm_cirrus_insn_p (first))
+-	    return;
++	/* If first insn is ldr rN, <mem>... */
++	if (GET_CODE (body) == SET && arm_memory_load_p (insn))
++	  {
++	    rtx next = next_real_insn (insn);
+ 
+-	  body = PATTERN (first);
++	    /* ...and second is cirrus double word load or store... */
++	    if (arm_cirrus_insn_p (next)
++		&& get_attr_cirrus (next) == CIRRUS_DOUBLE)
++	      {
++		rtx nextbody = PATTERN (next);
++		rtx ldr_target;	/* destination of ldr insn: rN */
++		rtx arm_part;	/* src or dest espression involving [rN] */
++		unsigned int arm_regno; /* the arm reg in the [rN] part */
+ 
+-          /* (float (blah)) is in parallel with a clobber.  */
+-          if (GET_CODE (body) == PARALLEL && XVECLEN (body, 0))
+-	    body = XVECEXP (body, 0, 0);
+-
+-	  if (GET_CODE (body) == FLOAT)
+-	    body = XEXP (body, 0);
+-
+-	  if (get_attr_cirrus (first) == CIRRUS_MOVE
+-	      && GET_CODE (XEXP (body, 1)) == REG
+-	      && arm_regno == REGNO (XEXP (body, 1)))
+-	    emit_insn_after (gen_nop (), first);
++		ldr_target = XEXP (body, 0);
++		gcc_assert (GET_CODE (ldr_target) == REG);
+ 
+-	  return;
+-	}
+-    }
++		gcc_assert (GET_CODE (nextbody) == SET);
+ 
+-  /* get_attr cannot accept USE or CLOBBER.  */
+-  if (!first
+-      || GET_CODE (first) != INSN
+-      || GET_CODE (PATTERN (first)) == USE
+-      || GET_CODE (PATTERN (first)) == CLOBBER)
+-    return;
++		/* Find the load or store address of the insn */
++		switch (GET_CODE (XEXP (nextbody, 0)))
++		  {
++		  case MEM: /* it's cfstrd/64 */
++		    gcc_assert (GET_CODE (XEXP (nextbody, 1)) == REG);
++		    arm_part = XEXP (XEXP (nextbody, 0), 0);
++		    break;
+ 
+-  attr = get_attr_cirrus (first);
++		  case REG: /* it's cfldrd/64 */
++		    if (GET_CODE (XEXP (nextbody, 1)) == MEM)
++		      arm_part = XEXP (XEXP (nextbody, 1), 0);
++		    else
++		      /* It can also be const_double or const_int, which will
++		       * turn into harmless [pc, #offset] in arm_reorg() */
++		      continue;
++		    break;
+ 
+-  /* Any coprocessor compare instruction (cfcmps, cfcmpd, ...)
+-     must be followed by a non-coprocessor instruction.  */
+-  if (attr == CIRRUS_COMPARE)
+-    {
+-      nops = 0;
++		  default:
++		    gcc_unreachable ();
++		  }
+ 
+-      t = next_nonnote_insn (first);
++		/* Find the arm register number in the [rN] expression */
++		arm_regno = 0; /* none */
++		switch (GET_CODE (arm_part))
++		  {
++		  case REG: /* it's [rN] */
++		    arm_regno = REGNO (arm_part);
++		    break;
+ 
+-      if (arm_cirrus_insn_p (t))
+-	++ nops;
++		  case PLUS: /* it's [rN, #XXX] or [rN, -#YYY]. */
++		    if (GET_CODE (XEXP (arm_part, 0)) == REG)
++		      arm_regno = REGNO (XEXP (arm_part, 0)); /* usual case */
++		    else if (GET_CODE (XEXP (arm_part, 1)) == REG)
++		      arm_regno = REGNO (XEXP (arm_part, 1)); /* inverted */
++		    else
++		      gcc_unreachable();
++		    break;
+ 
+-      if (arm_cirrus_insn_p (next_nonnote_insn (t)))
+-	++ nops;
++		  case PRE_INC:
++		  case POST_INC:
++		  case PRE_DEC:
++		  case POST_DEC:
++		    gcc_assert (GET_CODE (XEXP (arm_part, 0)) == REG);
++		    arm_regno = REGNO (XEXP (arm_part, 0));
++		    break;
+ 
+-      while (nops --)
+-	emit_insn_after (gen_nop (), first);
++		  default:
++		    /* Do nothing */
++		    continue;
++		  }
+ 
+-      return;
+-    }
++		if (arm_regno == REGNO (ldr_target))
++		  emit_insn_after (gen_nop (), insn);
++	      }
++	  }
++	break;
++      
++      default:
++	break;
++      }
+ }
+ 
+ /* Return TRUE if X references a SYMBOL_REF.  */
+@@ -9293,6 +9296,10 @@
+ 
+   minipool_fix_head = minipool_fix_tail = NULL;
+ 
++  /* Do cirrus_reorg() first as it may insert extra instructions */
++  if (TARGET_MAVERICK && TARGET_HARD_FLOAT)
++    cirrus_reorg ();
++
+   /* The first insn must always be a note, or the code below won't
+      scan it properly.  */
+   insn = get_insns ();
+@@ -9302,12 +9309,6 @@
+   /* Scan all the insns and record the operands that will need fixing.  */
+   for (insn = next_nonnote_insn (insn); insn; insn = next_nonnote_insn (insn))
+     {
+-      if (TARGET_CIRRUS_FIX_INVALID_INSNS
+-          && (arm_cirrus_insn_p (insn)
+-	      || GET_CODE (insn) == JUMP_INSN
+-	      || arm_memory_load_p (insn)))
+-	cirrus_reorg (insn);
+-
+       if (GET_CODE (insn) == BARRIER)
+ 	push_minipool_barrier (insn, address);
+       else if (INSN_P (insn))
+--- gcc-4.3.2/gcc/config/arm/arm.opt.orig	2009-03-02 10:17:08.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.opt	2009-03-02 10:27:30.000000000 +0000
+@@ -63,10 +63,6 @@
+ Target Report Mask(CALLER_INTERWORKING)
+ Thumb: Assume function pointers may go to non-Thumb aware code
+ 
+-mcirrus-fix-invalid-insns
+-Target Report Mask(CIRRUS_FIX_INVALID_INSNS)
+-Cirrus: Place NOPs to avoid invalid instruction combinations
+-
+ mcpu=
+ Target RejectNegative Joined
+ Specify the name of the target CPU
+--- gcc-4.3.2/gcc/doc/invoke.texi.old	2008-12-04 11:48:54.000000000 +0000
++++ gcc-4.3.2/gcc/doc/invoke.texi	2009-03-02 10:26:45.000000000 +0000
+@@ -429,7 +429,6 @@
+ -msingle-pic-base  -mno-single-pic-base @gol
+ -mpic-register=@var{reg} @gol
+ -mnop-fun-dllimport @gol
+--mcirrus-fix-invalid-insns -mno-cirrus-fix-invalid-insns @gol
+ -mieee @gol
+ -mpoke-function-name @gol
+ -mthumb  -marm @gol
+@@ -8671,18 +8671,6 @@
+ Specify the register to be used for PIC addressing.  The default is R10
+ unless stack-checking is enabled, when R9 is used.
+ 
+-@item -mcirrus-fix-invalid-insns
+-@opindex mcirrus-fix-invalid-insns
+-@opindex mno-cirrus-fix-invalid-insns
+-Insert NOPs into the instruction stream to in order to work around
+-problems with invalid Maverick instruction combinations.  This option
+-is only valid if the @option{-mcpu=ep9312} option has been used to
+-enable generation of instructions for the Cirrus Maverick floating
+-point co-processor.  This option is not enabled by default, since the
+-problem is only present in older Maverick implementations.  The default
+-can be re-enabled by use of the @option{-mno-cirrus-fix-invalid-insns}
+-switch.
+-
+ @item -mieee
+ When compiling for the Maverick FPU, disable the instructions that fail
+ to honor denormalized values. As these include floating point add, sub,
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-floatsi-no-scratch.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-floatsi-no-scratch.patch
new file mode 100644
index 0000000..d5eaa89
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-floatsi-no-scratch.patch
@@ -0,0 +1,35 @@
+When converting from 32-bit integers (in ARM registers) to single and double
+precision floating points (in Maverick registers), transfer the 32-bit value
+straight to the destination register and convert it in place there,
+instead of pointlessly using an extra Maverick register.
+
+    Martin Guy <martinwguy@yahoo.it> 15 Nov 2008
+
+--- gcc-4.3.2/gcc/config/arm/cirrus.md.old	2008-11-15 18:17:52.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/cirrus.md	2008-11-15 18:24:41.000000000 +0000
+@@ -300,10 +300,9 @@
+ ;; Convert Cirrus-SI to Cirrus-SF
+ (define_insn "cirrus_floatsisf2"
+   [(set (match_operand:SF           0 "cirrus_fp_register" "=v")
+- 	(float:SF (match_operand:SI 1 "s_register_operand"  "r")))
++ 	(float:SF (match_operand:SI 1 "s_register_operand"  "r")))]
+-   (clobber (match_scratch:DF 2 "=v"))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+-  "cfmv64lr%?\\t%Z2, %1\;cfcvt32s%?\\t%V0, %Y2"
++  "cfmv64lr%?\\t%Z0, %1\;cfcvt32s%?\\t%V0, %Y0"
+   [(set_attr "length" "8")
+    (set_attr "cirrus" "move")]
+ )
+@@ -310,10 +309,9 @@
+ 
+ (define_insn "cirrus_floatsidf2"
+   [(set (match_operand:DF           0 "cirrus_fp_register" "=v")
+-	(float:DF (match_operand:SI 1 "s_register_operand" "r")))
++	(float:DF (match_operand:SI 1 "s_register_operand" "r")))]
+-   (clobber (match_scratch:DF 2 "=v"))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+-  "cfmv64lr%?\\t%Z2, %1\;cfcvt32d%?\\t%V0, %Y2"
++  "cfmv64lr%?\\t%Z0, %1\;cfcvt32d%?\\t%V0, %Y0"
+   [(set_attr "length" "8")
+    (set_attr "cirrus" "move")]
+ )
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-fp_consts.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-fp_consts.patch
new file mode 100644
index 0000000..0bc886b
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-fp_consts.patch
@@ -0,0 +1,15 @@
+Maverick does not have immediate FP constants.
+
+--- gcc-4.3.2/gcc/config/arm/arm.c-original	2007-06-12 16:17:14.000000000 +1000
++++ gcc-4.3.2/gcc/config/arm/arm.c	2007-06-12 16:17:28.000000000 +1000
+@@ -5699,7 +5699,9 @@
+   int i;
+   REAL_VALUE_TYPE r;
+ 
++  if (TARGET_MAVERICK)
++    fp_consts_inited = 0;
+-  if (TARGET_VFP)
++  else if (TARGET_VFP)
+     fp_consts_inited = 1;
+   else
+     fp_consts_inited = 8;
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-mieee.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-mieee.patch
new file mode 100644
index 0000000..793f525
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-mieee.patch
@@ -0,0 +1,267 @@
+This patch adds an -mieee flag to GCC for ARM, that only has any effect when
+hard MaverickCrunch FPU code generation is selected.
+It disables the buggy instructions that do not recognise or do not generate
+denormalized values when they should:
+	add, sub, neg, abs and float<->double conversions.
+That leaves only floating point multiplication, comparison, conversions to/from
+integers and the 64-bit integer operations.
+
+   Martin Guy <martinwguy@yahoo.it>, December 2008
+
+--- gcc-4.3.2/gcc/doc/invoke.texi.old	2008-06-25 02:37:53.000000000 +0100
++++ gcc-4.3.2/gcc/doc/invoke.texi	2008-12-04 11:48:54.000000000 +0000
+@@ -430,6 +430,7 @@
+ -mpic-register=@var{reg} @gol
+ -mnop-fun-dllimport @gol
+ -mcirrus-fix-invalid-insns -mno-cirrus-fix-invalid-insns @gol
++-mieee @gol
+ -mpoke-function-name @gol
+ -mthumb  -marm @gol
+ -mtpcs-frame  -mtpcs-leaf-frame @gol
+@@ -8682,6 +8683,15 @@
+ can be re-enabled by use of the @option{-mno-cirrus-fix-invalid-insns}
+ switch.
+ 
++@item -mieee
++When compiling for the Maverick FPU, disable the instructions that fail
++to honor denormalized values. As these include floating point add, sub,
++neg, abs and float<->double conversions, it incurs a severe speed penalty.
++This option only has an effect if the
++@option{-mcpu=ep9312} @option{-mfpu=maverick} options have been used and is
++disabled by default.
++The default can be re-enabled by use of the @option{-mno-ieee} switch.
++
+ @item -mpoke-function-name
+ @opindex mpoke-function-name
+ Write the name of each function into the text section, directly
+--- gcc-4.3.2/gcc/config/arm/arm.opt.old	2007-08-02 11:49:31.000000000 +0100
++++ gcc-4.3.2/gcc/config/arm/arm.opt	2008-12-04 11:42:50.000000000 +0000
+@@ -93,6 +93,10 @@
+ Target RejectNegative
+ Alias for -mfloat-abi=hard
+ 
++mieee
++Target Report Mask(IEEE)
++Cirrus: Enable denormalized values by disabling buggy Maverick instructions
++
+ mlittle-endian
+ Target Report RejectNegative InverseMask(BIG_END)
+ Assume target CPU is configured as little endian
+--- gcc-4.3.2/gcc/config/arm/arm.c.old	2008-11-21 19:09:18.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.c	2008-12-03 12:03:31.000000000 +0000
+@@ -902,6 +902,10 @@
+       target_float_abi_name = "hard";
+       return true;
+ 
++    case OPT_mieee:
++      target_flags |= MASK_IEEE;
++      return true;
++
+     case OPT_msoft_float:
+       target_float_abi_name = "soft";
+       return true;
+--- gcc-4.3.2/gcc/config/arm/arm.md.old	2008-12-03 15:29:38.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.md	2008-12-04 12:14:56.000000000 +0000
+@@ -831,7 +831,7 @@
+   [(set (match_operand:SF          0 "s_register_operand" "")
+ 	(plus:SF (match_operand:SF 1 "s_register_operand" "")
+ 		 (match_operand:SF 2 "arm_float_add_operand" "")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && !(TARGET_MAVERICK && TARGET_IEEE)"
+   "
+   if (TARGET_MAVERICK
+       && !cirrus_fp_register (operands[2], SFmode))
+@@ -842,7 +842,7 @@
+   [(set (match_operand:DF          0 "s_register_operand" "")
+ 	(plus:DF (match_operand:DF 1 "s_register_operand" "")
+ 		 (match_operand:DF 2 "arm_float_add_operand" "")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && !(TARGET_MAVERICK && TARGET_IEEE)"
+   "
+   if (TARGET_MAVERICK
+       && !cirrus_fp_register (operands[2], DFmode))
+@@ -1064,7 +1064,7 @@
+   [(set (match_operand:SF           0 "s_register_operand" "")
+ 	(minus:SF (match_operand:SF 1 "arm_float_rhs_operand" "")
+ 		  (match_operand:SF 2 "arm_float_rhs_operand" "")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && !(TARGET_MAVERICK && TARGET_IEEE)"
+   "
+   if (TARGET_MAVERICK)
+     {
+@@ -1079,7 +1079,7 @@
+   [(set (match_operand:DF           0 "s_register_operand" "")
+ 	(minus:DF (match_operand:DF 1 "arm_float_rhs_operand" "")
+ 		  (match_operand:DF 2 "arm_float_rhs_operand" "")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && !(TARGET_MAVERICK && TARGET_IEEE)"
+   "
+   if (TARGET_MAVERICK)
+     {
+@@ -3367,7 +3367,7 @@
+ 	(neg:SF (match_operand:SF 1 "s_register_operand" "")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT
+    && (TARGET_FPA || TARGET_VFP
+-       || (TARGET_MAVERICK && ! HONOR_SIGNED_ZEROS(SFmode))"
++       || (TARGET_MAVERICK && ! HONOR_SIGNED_ZEROS(SFmode) && ! TARGET_IEEE))"
+   ""
+ )
+ 
+@@ -3376,7 +3376,7 @@
+ 	(neg:DF (match_operand:DF 1 "s_register_operand" "")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT
+    && (TARGET_FPA || TARGET_VFP
+-       || (TARGET_MAVERICK && ! HONOR_SIGNED_ZEROS(DFmode))"
++       || (TARGET_MAVERICK && ! HONOR_SIGNED_ZEROS(DFmode) && ! TARGET_IEEE))"
+   "")
+ 
+ ;; abssi2 doesn't really clobber the condition codes if a different register
+@@ -3456,13 +3456,13 @@
+ (define_expand "abssf2"
+   [(set (match_operand:SF         0 "s_register_operand" "")
+ 	(abs:SF (match_operand:SF 1 "s_register_operand" "")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && !(TARGET_MAVERICK && TARGET_IEEE)"
+   "")
+ 
+ (define_expand "absdf2"
+   [(set (match_operand:DF         0 "s_register_operand" "")
+ 	(abs:DF (match_operand:DF 1 "s_register_operand" "")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && !(TARGET_MAVERICK && TARGET_IEEE)"
+   "")
+ 
+ (define_expand "sqrtsf2"
+@@ -3600,7 +3600,7 @@
+   [(set (match_operand:SF  0 "s_register_operand" "")
+ 	(float_truncate:SF
+  	 (match_operand:DF 1 "s_register_operand" "")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && !(TARGET_MAVERICK && TARGET_IEEE)"
+   ""
+ )
+ 
+@@ -4462,7 +4462,7 @@
+ (define_expand "extendsfdf2"
+   [(set (match_operand:DF                  0 "s_register_operand" "")
+ 	(float_extend:DF (match_operand:SF 1 "s_register_operand"  "")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && !(TARGET_MAVERICK && TARGET_IEEE)"
+   ""
+ )
+ 
+--- gcc-4.3.2/gcc/config/arm/cirrus.md.old	2008-12-03 12:13:08.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/cirrus.md	2008-12-04 14:01:59.000000000 +0000
+@@ -101,11 +101,12 @@
+    (set_attr "cirrus" "normal")]
+ )
+ 
++; Cirrus hardware bug: denormalized values on input are truncated to zero
+ (define_insn "*cirrus_addsf3"
+   [(set (match_operand:SF          0 "cirrus_fp_register" "=v")
+ 	(plus:SF (match_operand:SF 1 "cirrus_fp_register" "v")
+ 		 (match_operand:SF 2 "cirrus_fp_register" "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! TARGET_IEEE"
+   "cfadds%?\\t%V0, %V1, %V2"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -115,7 +116,7 @@
+   [(set (match_operand:DF          0 "cirrus_fp_register" "=v")
+ 	(plus:DF (match_operand:DF 1 "cirrus_fp_register" "v")
+ 		 (match_operand:DF 2 "cirrus_fp_register" "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! TARGET_IEEE"
+   "cfaddd%?\\t%V0, %V1, %V2"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -145,7 +146,7 @@
+   [(set (match_operand:SF           0 "cirrus_fp_register" "=v")
+ 	(minus:SF (match_operand:SF 1 "cirrus_fp_register"  "v")
+ 		  (match_operand:SF 2 "cirrus_fp_register"  "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! TARGET_IEEE"
+   "cfsubs%?\\t%V0, %V1, %V2"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -155,7 +156,7 @@
+   [(set (match_operand:DF           0 "cirrus_fp_register" "=v")
+ 	(minus:DF (match_operand:DF 1 "cirrus_fp_register" "v")
+ 		  (match_operand:DF 2 "cirrus_fp_register" "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! TARGET_IEEE"
+   "cfsubd%?\\t%V0, %V1, %V2"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -316,10 +317,12 @@
+ )
+ 
+ ; Cirrus hardware bug: neg 0 -> 0 instead of -0
++; Cirrus hardware bug: denormalized values on input are truncated to zero
+ (define_insn "*cirrus_negsf2"
+   [(set (match_operand:SF         0 "cirrus_fp_register" "=v")
+ 	(neg:SF (match_operand:SF 1 "cirrus_fp_register"  "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! HONOR_SIGNED_ZEROS (SFmode)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK
++   && ! HONOR_SIGNED_ZEROS (SFmode) && ! TARGET_IEEE"
+   "cfnegs%?\\t%V0, %V1"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -328,7 +331,8 @@
+ (define_insn "*cirrus_negdf2"
+   [(set (match_operand:DF         0 "cirrus_fp_register" "=v")
+ 	(neg:DF (match_operand:DF 1 "cirrus_fp_register"  "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! HONOR_SIGNED_ZEROS (DFmode)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK
++   && ! HONOR_SIGNED_ZEROS (DFmode) && ! TARGET_IEEE"
+   "cfnegd%?\\t%V0, %V1"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -345,10 +349,11 @@
+    (set_attr "cirrus" "normal")]
+ )
+ 
++; Cirrus hardware bug: denormalized values on input are truncated to zero
+ (define_insn "*cirrus_abssf2"
+   [(set (match_operand:SF         0 "cirrus_fp_register" "=v")
+         (abs:SF (match_operand:SF 1 "cirrus_fp_register"  "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! TARGET_IEEE"
+   "cfabss%?\\t%V0, %V1"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -357,7 +362,7 @@
+ (define_insn "*cirrus_absdf2"
+   [(set (match_operand:DF         0 "cirrus_fp_register" "=v")
+         (abs:DF (match_operand:DF 1 "cirrus_fp_register"  "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! TARGET_IEEE"
+   "cfabsd%?\\t%V0, %V1"
+   [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+@@ -423,20 +428,23 @@
+    (set_attr "length" "8")]
+ )
+ 
++; Cirrus hardware bugs: denormalized values on input are truncated to zero
++; and double-to-single float never produces denormalized values.
+ (define_insn "*cirrus_truncdfsf2"
+   [(set (match_operand:SF  0 "cirrus_fp_register" "=v")
+         (float_truncate:SF
+          (match_operand:DF 1 "cirrus_fp_register" "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! TARGET_IEEE"
+   "cfcvtds%?\\t%V0, %V1"
+   [(set_attr "type" "f_cvt")
+    (set_attr "cirrus" "normal")]
+ )
+ 
++; Cirrus hardware bug: denormalized values on input are truncated to zero
+ (define_insn "*cirrus_extendsfdf2"
+   [(set (match_operand:DF                  0 "cirrus_fp_register" "=v")
+         (float_extend:DF (match_operand:SF 1 "cirrus_fp_register"  "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! TARGET_IEEE"
+   "cfcvtsd%?\\t%V0, %V1"
+   [(set_attr "type" "f_cvt")
+    (set_attr "cirrus" "normal")]
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-movsf-movdf-Uy.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-movsf-movdf-Uy.patch
new file mode 100644
index 0000000..b0cd7f8
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-movsf-movdf-Uy.patch
@@ -0,0 +1,65 @@
+This is a rewriting of the OE patch of the same name.
+
+The OE patch is different to this in that it:
+- reorders the constraints (we keep them in the same order)
+- its definition of attr "type" seem not to correspond to the insns it uses
+  (so here we define them to what seems right)
+- in movdf, it replaces operand 1 "general_operand" with "soft_df_operand" and
+  removes the first two clauses (r<->Q = memory indexed by base register)
+
+--- gcc-4.3.2/gcc/config/arm/cirrus.md.old	2008-11-15 18:46:25.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/cirrus.md	2008-11-18 11:51:52.000000000 +0000
+@@ -403,8 +403,8 @@
+ ;; on HARD_REGNO_MODE_OK.
+ 
+ (define_insn "*cirrus_movsf_hard_insn"
+-  [(set (match_operand:SF 0 "nonimmediate_operand" "=v,v,v,r,m,r,r,m")
+-        (match_operand:SF 1 "general_operand"      "v,mE,r,v,v,r,mE,r"))]
++  [(set (match_operand:SF 0 "nonimmediate_operand" "=v,v ,v,r,Uy,r,r,m")
++        (match_operand:SF 1 "general_operand"      "v,UyE,r,v,v ,r,mE,r"))]
+   "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK
+    && (GET_CODE (operands[0]) != MEM
+        || register_operand (operands[1], SFmode))"
+@@ -414,19 +414,18 @@
+    cfmvsr%?\\t%V0, %1
+    cfmvrs%?\\t%0, %V1
+    cfstrs%?\\t%V1, %0
+-   mov%?\\t%0, %1
++   mov%?\\t%0, %1\\t%@ float
+    ldr%?\\t%0, %1\\t%@ float
+    str%?\\t%1, %0\\t%@ float"
+-  [(set_attr "length"         "     *,     *,   *,     *,     *,  4,   4,     4")
+-   (set_attr "type"           "     *,  load1,   *,     *,store1,  *,load1,store1")
+-   (set_attr "pool_range"     "     *,   1020,   *,     *,     *,  *,4096,     *")
+-   (set_attr "neg_pool_range" "     *,   1008,   *,     *,     *,  *,4084,     *")
++  [(set_attr "type"           "ffarith,f_loads,r_2_f,f_2_r,f_stores,*,load1,store1")
++   (set_attr "pool_range"     "      *,   1020,   *,     *,     *,  *,4096, *")
++   (set_attr "neg_pool_range" "      *,   1008,   *,     *,     *,  *,4080, *")
+    (set_attr "cirrus"         "normal,normal,move,normal,normal,not, not,   not")]
+ )
+ 
+ (define_insn "*cirrus_movdf_hard_insn"
+-  [(set (match_operand:DF 0 "nonimmediate_operand" "=r,Q,r,m,r,v,v,v,r,m")
+-	(match_operand:DF 1 "general_operand"       "Q,r,r,r,mF,v,mF,r,v,v"))]
++  [(set (match_operand:DF 0 "nonimmediate_operand" "=r,Q,r,m,r ,v,v  ,v,r,Uy")
++	(match_operand:DF 1 "general_operand"       "Q,r,r,r,mF,v,UyF,r,v,v"))]
+   "TARGET_ARM
+    && TARGET_HARD_FLOAT && TARGET_MAVERICK
+    && (GET_CODE (operands[0]) != MEM
+@@ -447,11 +446,11 @@
+     default: gcc_unreachable ();
+     }
+   }"
+-  [(set_attr "type"           "load1,store2,  *,store2,load1,     *,  load1,   *,     *,store2")
+-   (set_attr "length"         "   4,     4,  8,     8,   8,     4,     4,   8,     8,     4")
+-   (set_attr "pool_range"     "   *,     *,  *,     *, 252,     *,  1020,   *,     *,     *")
+-   (set_attr "neg_pool_range" "   *,     *,  *,     *, 244,     *,  1008,   *,     *,     *")
+-   (set_attr "cirrus"         " not,   not,not,   not, not,normal,double,move,normal,double")]
++  [(set_attr "type"           "load2,store2, *,store2,load2,ffarith,f_loadd,r_2_f,f_2_r,store2")
++   (set_attr "length"         "    4,     4, 8,     8,    8,      4,      4,    8,    8,     4")
++   (set_attr "pool_range"     "    *,     *, *,     *, 1020,      *,   1020,    *,    *,     *")
++   (set_attr "neg_pool_range" "    *,     *, *,     *, 1008,      *,   1008,    *,    *,     *")
++   (set_attr "cirrus"         "  not,  not,not,   not, not,normal,double,move,normal,double")]
+ )
+ 
+ (define_insn "*cirrus_thumb2_movdi"
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-neg-enable.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-neg-enable.patch
new file mode 100644
index 0000000..d675407
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-neg-enable.patch
@@ -0,0 +1,31 @@
+In arm.md, enable expansion for neg[sd]f for Maverick - the instructions are
+already already defined in cirrus.md
+
+Without this patch for some reason it still manages to produce cfnegd
+instructions but not cfnegs, presumably via some optimization path.
+
+    Martin Guy <martinwguy@yahoo.it> December 2008
+
+--- gcc-4.3.2/gcc/config/arm/arm.md.old	2008-12-03 15:22:43.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.md	2008-12-03 15:29:38.000000000 +0000
+@@ -3366,14 +3366,18 @@
+ (define_expand "negsf2"
+   [(set (match_operand:SF         0 "s_register_operand" "")
+ 	(neg:SF (match_operand:SF 1 "s_register_operand" "")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT
++   && (TARGET_FPA || TARGET_VFP
++       || (TARGET_MAVERICK && ! HONOR_SIGNED_ZEROS(SFmode))"
+   ""
+ )
+ 
+ (define_expand "negdf2"
+   [(set (match_operand:DF         0 "s_register_operand" "")
+ 	(neg:DF (match_operand:DF 1 "s_register_operand" "")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && (TARGET_FPA || TARGET_VFP)"
++  "TARGET_32BIT && TARGET_HARD_FLOAT
++   && (TARGET_FPA || TARGET_VFP
++       || (TARGET_MAVERICK && ! HONOR_SIGNED_ZEROS(DFmode))"
+   "")
+ 
+ ;; abssi2 doesn't really clobber the condition codes if a different register
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-neg-protect.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-neg-protect.patch
new file mode 100644
index 0000000..63d3090
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-neg-protect.patch
@@ -0,0 +1,33 @@
+The Crunch cfnegs and cfnegd instructions have a hardware bug in all silicon
+revisions (D0 to E2) whereby neg(0) returns 0 (not -0). See erratum 12.
+
+For ieee-correctness, and to pass another case in GCC's IEEE testsuite,
+we disable the instruction and do it in software unless
+-funsafe-math-optimizations (included in -ffast-math) is given.
+
+    Martin Guy <martinwguy@yahoo.it>, September 2008
+
+--- gcc-4.3.2/gcc/config/arm/cirrus.md-original	2007-06-12 17:01:24.000000000 +1000
++++ gcc-4.3.2/gcc/config/arm/cirrus.md	2007-06-12 17:03:26.000000000 +1000
+@@ -254,18 +254,19 @@
+   [(set_attr "cirrus" "normal")]
+ )
+ 
++; Cirrus hardware bug: neg 0 -> 0 instead of -0
+ (define_insn "*cirrus_negsf2"
+   [(set (match_operand:SF         0 "cirrus_fp_register" "=v")
+ 	(neg:SF (match_operand:SF 1 "cirrus_fp_register"  "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! HONOR_SIGNED_ZEROS (SFmode)"
+   "cfnegs%?\\t%V0, %V1"
+   [(set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "*cirrus_negdf2"
+   [(set (match_operand:DF         0 "cirrus_fp_register" "=v")
+ 	(neg:DF (match_operand:DF 1 "cirrus_fp_register"  "v")))]
+-  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! HONOR_SIGNED_ZEROS (DFmode)"
+   "cfnegd%?\\t%V0, %V1"
+   [(set_attr "cirrus" "normal")]
+ )
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-pipeline.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-pipeline.patch
new file mode 100644
index 0000000..a6ae3f6
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-pipeline.patch
@@ -0,0 +1,461 @@
+Patch to add description of MaverickCrunch pipelines.
+
+This increases the speed as measured by the fftw benchmark from
+5.4 to 5.8 mflops and reduced LAME's execution time from 2m30 to 2m20.
+
+I don't know who wrote this - I got it from Hasjim Williams.
+
+        -martinwguy
+
+--- gcc-4.3.2/gcc/config/arm/arm.md.old	2008-11-21 19:06:18.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.md	2008-11-21 19:06:37.000000000 +0000
+@@ -230,13 +230,10 @@
+ ; store2	store 2 words
+ ; store3	store 3 words
+ ; store4	store 4 (or more) words
+-;  Additions for Cirrus Maverick co-processor:
+-; mav_farith	Floating point arithmetic (4 cycle)
+-; mav_dmult	Double multiplies (7 cycle)
+ ;
+ 
+ (define_attr "type"
+-	"alu,alu_shift,alu_shift_reg,mult,block,float,fdivx,fdivd,fdivs,fmul,fmuls,fmuld,fmacs,fmacd,ffmul,farith,ffarith,f_flag,float_em,f_load,f_store,f_loads,f_loadd,f_stores,f_stored,f_mem_r,r_mem_f,f_2_r,r_2_f,f_cvt,branch,call,load_byte,load1,load2,load3,load4,store1,store2,store3,store4,mav_farith,mav_dmult"
++	"alu,alu_shift,alu_shift_reg,mult,block,float,fdivx,fdivd,fdivs,fmul,fmuls,fmuld,fmacs,fmacd,ffmul,farith,ffarith,f_flag,float_em,f_load,f_store,f_loads,f_loadd,f_stores,f_stored,f_mem_r,r_mem_f,f_2_r,r_2_f,f_cvt,branch,call,load_byte,load1,load2,load3,load4,store1,store2,store3,store4"
+ 	(if_then_else 
+ 	 (eq_attr "insn" "smulxy,smlaxy,smlalxy,smulwy,smlawx,mul,muls,mla,mlas,umull,umulls,umlal,umlals,smull,smulls,smlal,smlals")
+ 	 (const_string "mult")
+@@ -7340,7 +7337,7 @@
+ 		      (match_operand:SF 1 "cirrus_fp_register" "v")))]
+   "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfcmps%?\\tr15, %V0, %V1"
+-  [(set_attr "type"   "mav_farith")
++  [(set_attr "type"   "farith")
+    (set_attr "cirrus" "compare")]
+ )
+ 
+@@ -7351,7 +7348,7 @@
+ 		      (match_operand:DF 1 "cirrus_fp_register" "v")))]
+   "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfcmpd%?\\tr15, %V0, %V1"
+-  [(set_attr "type"   "mav_farith")
++  [(set_attr "type"   "farith")
+    (set_attr "cirrus" "compare")]
+ )
+ 
+@@ -7374,7 +7371,7 @@
+ 		    (match_operand:DI 1 "cirrus_fp_register" "v")))]
+   "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK & 0"
+   "cfcmp64%?\\tr15, %V0, %V1"
+-  [(set_attr "type"   "mav_farith")
++  [(set_attr "type"   "farith")
+    (set_attr "cirrus" "compare")]
+ )
+ 
+--- gcc-4.3.2/gcc/config/arm/cirrus.md.old	2008-11-21 14:25:50.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/cirrus.md	2008-11-21 14:42:01.000000000 +0000
+@@ -19,6 +19,58 @@
+ ;; along with GCC; see the file COPYING3.  If not see
+ ;; <http://www.gnu.org/licenses/>.
+ 
++;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
++;; Pipeline description
++;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
++
++(define_automaton "crunch")
++
++;; There are 2 pipelines in the CRUNCH unit.
++;;
++;; - A 8/9-stage? FMAC pipeline (7/8? execute + writeback)
++;;
++;; - A 4-stage LS pipeline (execute + 2 memory + writeback) with forward from
++;;   second memory stage for loads.
++
++(define_cpu_unit "crunch_fmac" "crunch")
++
++(define_cpu_unit "crunch_ls" "crunch")
++
++;; The CRUNCH "type" attributes differ from those used in the FPA and VFP model.
++;; ffarith	Fast floating point insns.
++;; farith	Most arithmetic insns.
++;; fmul		Double precision multiply.
++;; f_load[sd]	Floating point load from memory.
++;; f_store[sd]	Floating point store to memory.
++;; f_2_r	Transfer crunch to arm reg.
++;; r_2_f	Transfer arm to crunch reg.
++;; f_cvt	Convert floating<->integral
++
++(define_insn_reservation "crunch_ffarith" 18
++ (and (eq_attr "fpu" "maverick")
++      (eq_attr "type" "ffarith"))
++ "crunch_fmac")
++
++(define_insn_reservation "crunch_farith" 18
++ (and (eq_attr "fpu" "maverick")
++      (eq_attr "type" "farith,f_cvt"))
++ "crunch_fmac")
++
++(define_insn_reservation "crunch_fmul" 30
++ (and (eq_attr "fpu" "maverick")
++      (eq_attr "type" "fmul"))
++ "crunch_fmac*2")
++
++;; Moves to/from arm regs also use the load/store pipeline.
++(define_insn_reservation "crunch_fload" 8
++ (and (eq_attr "fpu" "maverick")
++      (eq_attr "type" "f_loads,f_loadd,r_2_f"))
++ "crunch_ls")
++
++(define_insn_reservation "crunch_fstore" 8
++ (and (eq_attr "fpu" "maverick")
++      (eq_attr "type" "f_stores,f_stored,f_2_r"))
++ "crunch_ls")
+ 
+ ; Cirrus types for invalid insn combinations
+ ; not		Not a cirrus insn
+@@ -35,7 +87,7 @@
+ 		 (match_operand:DI 2 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfadd64%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_farith")
++  [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -45,7 +97,7 @@
+ 		 (match_operand:SI 2 "cirrus_fp_register" "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && 0"
+   "cfadd32%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_farith")
++  [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -55,7 +107,7 @@
+ 		 (match_operand:SF 2 "cirrus_fp_register" "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfadds%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_farith")
++  [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -65,7 +117,7 @@
+ 		 (match_operand:DF 2 "cirrus_fp_register" "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfaddd%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_farith")
++  [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -75,7 +127,7 @@
+ 		  (match_operand:DI 2 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfsub64%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_farith")
++  [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -85,7 +137,7 @@
+ 		  (match_operand:SI 2 "cirrus_fp_register" "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && 0"
+   "cfsub32%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_farith")
++  [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -95,7 +147,7 @@
+ 		  (match_operand:SF 2 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfsubs%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_farith")
++  [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -105,7 +157,7 @@
+ 		  (match_operand:DF 2 "cirrus_fp_register" "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfsubd%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_farith")
++  [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -115,7 +167,7 @@
+ 		 (match_operand:SI 1 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && 0"
+   "cfmul32%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_farith")
++  [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -125,7 +177,7 @@
+ 		 (match_operand:DI 1 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfmul64%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_dmult")
++  [(set_attr "type" "fmul")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -137,7 +189,7 @@
+ 	  (match_operand:SI          3 "cirrus_fp_register"  "0")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && 0"
+   "cfmac32%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_farith")
++  [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -150,7 +202,7 @@
+ 		   (match_operand:SI 3 "cirrus_fp_register"  "v"))))]
+   "0 && TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfmsc32%?\\t%V0, %V2, %V3"
+-  [(set_attr "type" "mav_farith")
++  [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -160,7 +212,7 @@
+ 		 (match_operand:SF 2 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfmuls%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_farith")
++  [(set_attr "type" "farith")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -170,7 +222,7 @@
+ 		 (match_operand:DF 2 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfmuld%?\\t%V0, %V1, %V2"
+-  [(set_attr "type" "mav_dmult")
++  [(set_attr "type" "fmul")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -180,7 +232,8 @@
+ 		   (match_operand:SI 2 "cirrus_shift_const"  "")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && 0"
+   "cfsh32%?\\t%V0, %V1, #%s2"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "cirrus_ashiftrt_const"
+@@ -189,7 +242,8 @@
+ 		     (match_operand:SI 2 "cirrus_shift_const"  "")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && 0"
+   "cfsh32%?\\t%V0, %V1, #-%s2"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "cirrus_ashlsi3"
+@@ -198,7 +252,8 @@
+ 		   (match_operand:SI 2 "register_operand"    "r")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && 0"
+   "cfrshl32%?\\t%V1, %V0, %s2"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "ashldi3_cirrus"
+@@ -207,7 +262,8 @@
+ 		   (match_operand:SI 2 "register_operand"    "r")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfrshl64%?\\t%V1, %V0, %s2"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "cirrus_ashldi_const"
+@@ -216,7 +272,8 @@
+ 		   (match_operand:SI 2 "cirrus_shift_const"  "")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfsh64%?\\t%V0, %V1, #%s2"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "cirrus_ashiftrtdi_const"
+@@ -225,7 +282,8 @@
+ 		     (match_operand:SI 2 "cirrus_shift_const"  "")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfsh64%?\\t%V0, %V1, #-%s2"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "*cirrus_absdi2"
+@@ -233,7 +291,8 @@
+ 	(abs:DI (match_operand:DI 1 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfabs64%?\\t%V0, %V1"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ ;; This doesn't really clobber ``cc''.  Fixme: aldyh.  
+@@ -243,7 +302,8 @@
+    (clobber (reg:CC CC_REGNUM))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfneg64%?\\t%V0, %V1"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "*cirrus_negsi2"
+@@ -251,7 +311,8 @@
+ 	(neg:SI (match_operand:SI 1 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && 0"
+   "cfneg32%?\\t%V0, %V1"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ ; Cirrus hardware bug: neg 0 -> 0 instead of -0
+@@ -260,7 +321,8 @@
+ 	(neg:SF (match_operand:SF 1 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! HONOR_SIGNED_ZEROS (SFmode)"
+   "cfnegs%?\\t%V0, %V1"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "*cirrus_negdf2"
+@@ -268,7 +330,8 @@
+ 	(neg:DF (match_operand:DF 1 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && ! HONOR_SIGNED_ZEROS (DFmode)"
+   "cfnegd%?\\t%V0, %V1"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ ;; This doesn't really clobber the condition codes either.  
+@@ -278,7 +341,8 @@
+    (clobber (reg:CC CC_REGNUM))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK && 0"
+   "cfabs32%?\\t%V0, %V1"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "*cirrus_abssf2"
+@@ -286,7 +350,8 @@
+         (abs:SF (match_operand:SF 1 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfabss%?\\t%V0, %V1"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "*cirrus_absdf2"
+@@ -294,7 +359,8 @@
+         (abs:DF (match_operand:DF 1 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfabsd%?\\t%V0, %V1"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "farith")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ ;; Convert Cirrus-SI to Cirrus-SF
+@@ -303,7 +369,8 @@
+  	(float:SF (match_operand:SI 1 "s_register_operand"  "r")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfmv64lr%?\\t%Z0, %1\;cfcvt32s%?\\t%V0, %Y0"
+-  [(set_attr "length" "8")
++  [(set_attr "type" "f_cvt")
++   (set_attr "length" "8")
+    (set_attr "cirrus" "move")]
+ )
+ 
+@@ -312,7 +379,8 @@
+ 	(float:DF (match_operand:SI 1 "s_register_operand" "r")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfmv64lr%?\\t%Z0, %1\;cfcvt32d%?\\t%V0, %Y0"
+-  [(set_attr "length" "8")
++  [(set_attr "type" "f_cvt")
++   (set_attr "length" "8")
+    (set_attr "cirrus" "move")]
+ )
+ 
+@@ -321,14 +389,18 @@
+ 	(float:SF (match_operand:DI 1 "cirrus_fp_register" "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfcvt64s%?\\t%V0, %V1"
+-  [(set_attr "cirrus" "normal")])
++  [(set_attr "type" "f_cvt")
++   (set_attr "cirrus" "normal")]
++)
+ 
+ (define_insn "floatdidf2"
+   [(set (match_operand:DF 0 "cirrus_fp_register" "=v")
+ 	(float:DF (match_operand:DI 1 "cirrus_fp_register" "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfcvt64d%?\\t%V0, %V1"
+-  [(set_attr "cirrus" "normal")])
++  [(set_attr "type" "f_cvt")
++   (set_attr "cirrus" "normal")]
++)
+ 
+ (define_insn "cirrus_truncsfsi2"
+   [(set (match_operand:SI         0 "s_register_operand" "=r")
+@@ -336,7 +408,8 @@
+    (clobber (match_scratch:DF     2                      "=v"))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cftruncs32%?\\t%Y2, %V1\;cfmvr64l%?\\t%0, %Z2"
+-  [(set_attr "length" "8")
++  [(set_attr "type" "f_cvt")
++   (set_attr "length" "8")
+    (set_attr "cirrus" "normal")]
+ )
+ 
+@@ -346,7 +419,8 @@
+    (clobber (match_scratch:DF     2                      "=v"))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cftruncd32%?\\t%Y2, %V1\;cfmvr64l%?\\t%0, %Z2"
+-  [(set_attr "length" "8")]
++  [(set_attr "type" "f_cvt")
++   (set_attr "length" "8")]
+ )
+ 
+ (define_insn "*cirrus_truncdfsf2"
+@@ -355,7 +429,8 @@
+          (match_operand:DF 1 "cirrus_fp_register" "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfcvtds%?\\t%V0, %V1"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "f_cvt")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "*cirrus_extendsfdf2"
+@@ -363,7 +438,8 @@
+         (float_extend:DF (match_operand:SF 1 "cirrus_fp_register"  "v")))]
+   "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_MAVERICK"
+   "cfcvtsd%?\\t%V0, %V1"
+-  [(set_attr "cirrus" "normal")]
++  [(set_attr "type" "f_cvt")
++   (set_attr "cirrus" "normal")]
+ )
+ 
+ (define_insn "*cirrus_arm_movdi"
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-readme.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-readme.patch
new file mode 100644
index 0000000..9d75abd
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-readme.patch
@@ -0,0 +1,107 @@
+--- gcc-4.3.2-orig/gcc/config/arm/README-Maverick	1970-01-01 01:00:00.000000000 +0100
++++ gcc-4.3.2/gcc/config/arm/README-Maverick	2009-03-10 22:04:26.000000000 +0000
+@@ -0,0 +1,104 @@
++Cirrus Logic MaverickCrunch FPU support
++=======================================
++
++The MaverickCrunch is an FPU coprocessor that only exists in combination
++with an arm920t (ARMv4t arch) integer core in the 200MHz EP93xx devices.
++Code generation for it is usually selected with
++	-mcpu=ep9312 -mfpu=maverick (and most likely -mfloat-abi=softfp)
++
++Within GCC, the names "cirrus" "maverick" and "crunch" are used randomly
++in filenames and identifiers, but they all refer to the same thing.
++
++Initial support was mainlined by RedHat in gcc-3 but this never generated
++working code.  Cirrus Logic funded the company Nucleusys to produce a modified
++GCC for it, but this never worked either.  The first set of patches to pass
++the testsuite were made by Hasjim Williams for Open Embedded, though they
++did this by disabling various features and optimisations, therby incurring
++a small negative impact on regular ARM code generation.
++The OE ideas were reimplemented by Martin Guy to produce a working compiler
++with no negwative impact on regular code generation.
++
++The FPU's characteristics
++-------------------------
++Like most ARM coprocessors, it runs in parallel with the ARM though its
++instructions are inserted into the regular ARM instructions stream.
++It has 16 64-bit registers that can be operated as 32-bit or 64-bit integers
++or as 32-bit or 64-bit floats, three 72-bit saturating multiplier-accumulators.
++It can add, sub, mul, cmp, abs and neg these types, convert between them and
++transfer values between its registers and the ARM registers or main memory.
++
++Comparisons performed in the Maverick unit set the condition codes differently
++from the ARM/FPA/VFP instructions:
++
++	ARM/FPA/VFP - (cmp*):		MaverickCrunch - (cfcmp*):
++		N  Z  C  V		        N  Z  C  V
++	A == B  0  1  1  0		A == B  0  1  0  0
++	A <  B  1  0  0  0		A <  B  1  0  0  0
++	A >  B  0  0  1  0		A >  B  1  0  0  1
++	unord   0  0  1  1		unord   0  0  0  0
++
++which means that the same conditions have to be tested for with different ARM
++conditions after a Maverick comparison.  Furthermore, some conditions cannot
++be tested with a single condition.
++This was already true on ARM/FPA/VFP for conditions UNEQ and LTGT; 
++on Maverick comparisons it is GE UNLT ORDERED and UNORDERED that cannot.
++(GE after a floating point comparison, that is, not after an integer comarison)
++
++GCC's use of the Maverick unit
++------------------------------
++GCC only uses the 32-bit and 64-bit floating point modes and the 64-bit
++integer mode. It does not use the 72-bit accumulators or the 32-bit integer
++mode because, from "GCC Machine Descriptions":
++    "It is obligatory to support floating point `movm' instructions
++    into and out of any registers that can hold fixed point values,
++    because unions and structures (which have modes SImode or DImode)
++    can be in those registers and they may have floating point members."
++(search also for "grief" in arm.c).
++
++It does not use the 64-bit integer comparison instruction because it can only
++do a signed or an unsigned comparison, while GCC expect the comparison to set
++the conditions codes for both modes and then to use the signed or unsigned
++mode when the condition code bits are tested.
++
++The different setting of the condition codes is tracked with an additional
++CCMAV mode for the condition code register, set when a comparison is performed
++in the Maverick unit. This always indicates a floating point comparison since
++the Maverick's 64-bit comparison is not used.
++
++Hardware bugs and workarounds
++-----------------------------
++All silicon implementations of the FPU have a dozen hardware bugs, mostly
++timing-dependent bugs that can write garbage into registers or memory or get
++conditional tests wrong, as well as a widespread failure to respect
++denormalised values.  See http://wiki.debian.org/ArmEabiMaverickCrunch
++
++There used to be a -mcirrus-fix-invalid-instructions flag that claimed
++to avoid bugs in revision D0 silicon but its code was broken junk.
++Currently GCC always avoids the timing bugs in revision D1 to E2 silicon,
++while the many extra timing bugs in the now rare revision D0 are not handled.
++
++By default, the instructions that drop denoermalized values are enabled
++so as to obtain maximum speed at lower precision.  By default, the cfnegs
++and cfnegd instrutions are disabled, since they also fail to produce negative
++zero.  They can be enabled with -fno-signed-zeros.
++
++When -mfpu=maverick is selected, an additional -mieee flag is active that
++gives full IEEE precision by performs all the non-denorm-respecting
++floating point instructions in the softfloat library routines or in the
++integer registers.
++
++The 64-bit integer support is still buggy so it is disabled unless the
++-mcirrus-di flag is supplied. As well as the having unidentified
++hardware bugs which make openssl's testsuite fail in */sha/sha512.c and in
++*/bn/bn_adm.c, 64-bit shifts only work up to 31 places left or 32 right.
++
++Other bugs
++----------
++There seems to be no way to configure GCC to select Maverick code generation
++as the default.
++
++--with-arch=ep9312 the assembler barfs saying that ep9312 is not a
++recognised architecture.
++--with-arch=armv4t the build fails when it tries to compile hard FPA
++instructions into libgcc,
++--with-cpu=ep9312 it compiles armv5t instructions into libgcc
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-repair-truncxfsi.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-repair-truncxfsi.patch
new file mode 100644
index 0000000..b15ad24
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-repair-truncxfsi.patch
@@ -0,0 +1,29 @@
+Fix two bugs in the Maverick trunc[sd]fsi expansions:
+- the target of cirrus_truncsfsi2 is an ARM register, not a Maverick register.
+- a typo in both descriptions transfers info for operand 0 into operand 1
+
+    Martin Guy <martinwguy"yahoo.it> 15 Nov 2008
+
+--- gcc-4.3.2/gcc/config/arm/arm.md.old	2008-11-09 19:13:54.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.md	2008-11-15 18:11:08.000000000 +0000
+@@ -3574,10 +3574,8 @@
+   "
+   if (TARGET_MAVERICK)
+     {
+-      if (!cirrus_fp_register (operands[0], SImode))
+-        operands[0] = force_reg (SImode, operands[0]);
+       if (!cirrus_fp_register (operands[1], SFmode))
+-        operands[1] = force_reg (SFmode, operands[0]);
++        operands[1] = force_reg (SFmode, operands[1]);
+       emit_insn (gen_cirrus_truncsfsi2 (operands[0], operands[1]));
+       DONE;
+     }
+@@ -3591,7 +3589,7 @@
+   if (TARGET_MAVERICK)
+     {
+       if (!cirrus_fp_register (operands[1], DFmode))
+-        operands[1] = force_reg (DFmode, operands[0]);
++        operands[1] = force_reg (DFmode, operands[1]);
+       emit_insn (gen_cirrus_truncdfsi2 (operands[0], operands[1]));
+       DONE;
+     }
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-saveregs.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-saveregs.patch
new file mode 100644
index 0000000..6bbc959
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-saveregs.patch
@@ -0,0 +1,88 @@
+Save Maverick registers on function entry and restore them on exit if they
+are modified within the function and are among those that must be preserved
+across function calls.
+
+Also check whether Maverik registers need restoring when deciding whether to
+return directly from the middle of a function without an epilogue.
+
+This combines futaris' [saveregs] and [use_return_insn] patches.
+
+--- gcc-4.3.2-orig/gcc/config/arm/arm.c	2008-06-11 11:52:55.000000000 +0100
++++ gcc-4.3.2/gcc/config/arm/arm.c	2008-09-27 12:40:19.000000000 +0100
+@@ -1738,6 +1738,12 @@
+       if (df_regs_ever_live_p (regno) && !call_used_regs[regno])
+ 	return 0;
+ 
++  /* Likewise Maverick regs.  */
++  if (TARGET_MAVERICK)
++    for (regno = FIRST_CIRRUS_FP_REGNUM; regno <= LAST_CIRRUS_FP_REGNUM; regno++)
++      if (df_regs_ever_live_p (regno) && !call_used_regs[regno])
++	return 0;
++
+   if (TARGET_REALLY_IWMMXT)
+     for (regno = FIRST_IWMMXT_REGNUM; regno <= LAST_IWMMXT_REGNUM; regno++)
+       if (df_regs_ever_live_p (regno) && ! call_used_regs[regno])
+@@ -11315,6 +11321,17 @@
+ 			     reg, FP_REGNUM, floats_offset - vfp_offset);
+ 	      }
+ 	}
++      else if (arm_fpu_arch == FPUTYPE_MAVERICK)
++	{ 
++	  for (reg = LAST_CIRRUS_FP_REGNUM; reg >= FIRST_CIRRUS_FP_REGNUM; reg--)
++	    if (df_regs_ever_live_p (reg) && !call_used_regs[reg])
++	      {
++		floats_offset += 8;
++		asm_fprintf (f, "\tcfldrd\tmvd%d, [%r, #-%d]\n",
++		     	     reg - FIRST_CIRRUS_FP_REGNUM, FP_REGNUM,
++			     floats_offset - vfp_offset);
++	      }
++	}
+       else
+ 	{
+ 	  start_reg = LAST_FPA_REGNUM;
+@@ -11480,6 +11497,13 @@
+ 	      asm_fprintf (f, "\tldfe\t%r, [%r], #12\n",
+ 			   reg, SP_REGNUM);
+ 	}
++      else if (arm_fpu_arch == FPUTYPE_MAVERICK)
++	{
++	  for (reg = FIRST_CIRRUS_FP_REGNUM; reg <= LAST_CIRRUS_FP_REGNUM; reg++)
++	    if (df_regs_ever_live_p (reg) && !call_used_regs[reg])
++	      asm_fprintf (f, "\tcfldrd\tmvd%u, [%r], #8\n",
++			   reg - FIRST_CIRRUS_FP_REGNUM, SP_REGNUM);
++	}
+       else
+ 	{
+ 	  start_reg = FIRST_FPA_REGNUM;
+@@ -11991,6 +12015,11 @@
+       func_type = arm_current_func_type ();
+       if (! IS_VOLATILE (func_type))
+ 	{
++	  /* Space for saved MAVERICK registers.  */
++ 	  for (regno = FIRST_CIRRUS_FP_REGNUM; regno <= LAST_CIRRUS_FP_REGNUM; regno++)
++ 	    if (df_regs_ever_live_p (regno) && !call_used_regs[regno])
++ 	      saved += 8;
++
+ 	  /* Space for saved FPA registers.  */
+ 	  for (regno = FIRST_FPA_REGNUM; regno <= LAST_FPA_REGNUM; regno++)
+ 	    if (df_regs_ever_live_p (regno) && ! call_used_regs[regno])
+@@ -12156,6 +12185,19 @@
+ 	    saved_size += 12;
+ 	  }
+     }
++  else if (arm_fpu_arch == FPUTYPE_MAVERICK)
++    { 
++      for (reg = LAST_CIRRUS_FP_REGNUM; reg >= FIRST_CIRRUS_FP_REGNUM; reg--)
++        if (df_regs_ever_live_p (reg) && !call_used_regs[reg])
++          {
++	    insn = gen_rtx_PRE_DEC (DFmode, stack_pointer_rtx);
++	    insn = gen_rtx_MEM (DFmode, insn);
++	    insn = emit_insn (gen_rtx_SET (VOIDmode, insn,
++					   gen_rtx_REG (DFmode, reg)));
++	    RTX_FRAME_RELATED_P (insn) = 1;
++	    saved_size += 8; 
++ 	  }
++    }
+   else
+     {
+       start_reg = LAST_FPA_REGNUM;
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-scratch.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-scratch.patch
new file mode 100644
index 0000000..fa3dc80
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-crunch-scratch.patch
@@ -0,0 +1,27 @@
+Increase the number of Cirrus scratch registers from 4 to 8 (ie half of them)
+
+--- gcc-4.3.2/gcc/config/arm/arm.h.old	2008-09-26 16:01:45.000000000 +0100
++++ gcc-4.3.2/gcc/config/arm/arm.h	2008-09-28 11:20:19.000000000 +0100
+@@ -626,8 +626,8 @@
+ 
+ /*
+   	mvf0		Cirrus floating point result
+-	mvf1-mvf3	Cirrus floating point scratch
+-	mvf4-mvf15   S	Cirrus floating point variable.  */
++	mvf1-mvf7	Cirrus floating point scratch
++	mvf8-mvf15   S	Cirrus floating point variable.  */
+ 
+ /*	s0-s15		VFP scratch (aka d0-d7).
+ 	s16-s31	      S	VFP variable (aka d8-d15).
+diff -urN gcc-4.3.0/gcc/config/arm/arm.h gcc-4.3.0/gcc/config/arm/arm.h
+--- gcc-4.3.2/gcc/config/arm/arm.h	2008-04-07 12:17:46.000000000 +1000
++++ gcc-4.3.2/gcc/config/arm/arm.h	2008-04-07 12:18:10.000000000 +1000
+@@ -753,7 +752,7 @@
+ 	       regno <= LAST_CIRRUS_FP_REGNUM; ++ regno)	\
+ 	    {							\
+ 	      fixed_regs[regno] = 0;				\
+-	      call_used_regs[regno] = regno < FIRST_CIRRUS_FP_REGNUM + 4; \
++	      call_used_regs[regno] = regno < FIRST_CIRRUS_FP_REGNUM + 8; \
+ 	    }							\
+ 	}							\
+       if (TARGET_VFP)						\
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-prologue_use-length.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-prologue_use-length.patch
new file mode 100644
index 0000000..d08b4fc
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-prologue_use-length.patch
@@ -0,0 +1,10 @@
+--- gcc-4.3.2/gcc/config/arm/arm.md.old	2008-12-09 10:23:57.000000000 +0000
++++ gcc-4.3.2/gcc/config/arm/arm.md	2009-03-10 12:14:01.000000000 +0000
+@@ -11110,6 +11110,7 @@
+   [(unspec:SI [(match_operand:SI 0 "register_operand" "")] UNSPEC_PROLOGUE_USE)]
+   ""
+   "%@ %0 needed for prologue"
++  [(set_attr "length" "0")]
+ )
+ 
+ 
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/arm-size-bugfix.patch b/recipes/gcc/gcc-4.3.3/ep93xx/arm-size-bugfix.patch
new file mode 100644
index 0000000..c3f3f3d
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/arm-size-bugfix.patch
@@ -0,0 +1,33 @@
+Fix an obvious bug in GCC-4.3.2's ARM code generator.
+
+PR target/37668
+ * arm.c (arm_size_rtx_costs, case NEG): Don't fall through if the
+   result will be in an FPU register.
+
+This has been applied in gcc-4.4.0
+
+   Martin Guy <martinwguy@yahoo.it>
+
+*** gcc-4.3.2/gcc/config/arm/arm.c	(revision 142660)
+--- gcc-4.3.2/gcc/config/arm/arm.c	(local)
+*************** arm_size_rtx_costs (rtx x, int code, int
+*** 5201,5207 ****
+  
+      case NEG:
+        if (TARGET_HARD_FLOAT && GET_MODE_CLASS (mode) == MODE_FLOAT)
+! 	*total = COSTS_N_INSNS (1);
+        /* Fall through */
+      case NOT:
+        *total = COSTS_N_INSNS (ARM_NUM_REGS (mode));
+--- 5201,5211 ----
+  
+      case NEG:
+        if (TARGET_HARD_FLOAT && GET_MODE_CLASS (mode) == MODE_FLOAT)
+! 	{
+! 	  *total = COSTS_N_INSNS (1);
+! 	  return false;
+! 	}
+! 
+        /* Fall through */
+      case NOT:
+        *total = COSTS_N_INSNS (ARM_NUM_REGS (mode));
diff --git a/recipes/gcc/gcc-4.3.3/ep93xx/series b/recipes/gcc/gcc-4.3.3/ep93xx/series
new file mode 100644
index 0000000..e6bfe42
--- /dev/null
+++ b/recipes/gcc/gcc-4.3.3/ep93xx/series
@@ -0,0 +1,25 @@
+arm-crunch-readme.patch
+arm-crunch-saveregs.patch
+arm-crunch-scratch.patch
+arm-crunch-eabi-ieee754-endian-littleword-littlebyte.patch
+arm-crunch-eabi-mvf0-scratch-ieee754.patch
+arm-crunch-20000320.patch
+arm-crunch-disable-cmpdi.patch
+arm-crunch-fix-64bit-const-offsets.patch
+arm-crunch-fp_consts.patch
+arm-crunch-neg-enable.patch
+arm-crunch-neg-protect.patch
+arm-crunch-repair-truncxfsi.patch
+arm-crunch-floatsi-no-scratch.patch
+arm-crunch-movsf-movdf-Uy.patch
+arm-crunch-drop-thumb2.patch
+arm-crunch-arm_dbx_register_number.patch
+arm-crunch-pipeline.patch
+arm-crunch-ccmav-mode.patch
+arm-crunch-cfcpy-with-cfsh64.patch 
+arm-crunch-mieee.patch 
+arm-size-bugfix.patch
+arm-prologue_use-length.patch
+arm-crunch-cftruncd32-attr.patch
+arm-crunch-fix-cirrus-reorg5.patch
+arm-crunch-cirrus-di-flag.patch
-- 
1.6.3.1





