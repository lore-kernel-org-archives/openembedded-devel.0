Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QGFzC-0007fp-Sn
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Apr 2011 21:37:52 +0200
Received: by pvc30 with SMTP id 30so2794392pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Apr 2011 12:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=hYD0qHdq3j34KO062M71YVUr7GcicNjJeMyK18nMjPY=;
	b=OIxVvXMgR4Iv7yF0jRWXOjQWnNkFUbS6Urigqoi3dYfM2LO7TP2oeYgDt+IN0z/gdq
	nDtsksCKYV/LML+6GJQtcm9qcSf/x0Pfi4SeJHLxZfGAn2EAgETxKGCguovloGaHZrHF
	F9R/DRBqm5OFMaSjyCII3ePMQyqpT8vkKOCVY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=iRhz9kC49lX14AR0JTJP+GOKiy4XawCTTQIiI4zzISOAGJMCEOxUg+fLLoK1SIUpRD
	1M2CMZucCIVR0xacIvjmIwtXeab8GVW9aa/iqCEBRZwoc2WpwBZV9kA8j5vKjPn/vB4f
	0loVcu4C/qzrzUEl7S03/7dE2G2lL4OtbESvA=
Received: by 10.68.39.73 with SMTP id n9mr7025493pbk.206.1304191631170;
	Sat, 30 Apr 2011 12:27:11 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y9sm33383pbp.24.2011.04.30.12.27.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Apr 2011 12:27:08 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Apr 2011 12:26:50 -0700
Message-Id: <1304191610-31723-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] gcc: Upgrade to 4.5.3 and bring in latest linaro updates
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
X-List-Received-Date: Sat, 30 Apr 2011 19:37:52 -0000

From: Khem Raj <raj.khem@gmail.com>

We base now off release tarball of 4.5.3 instead of svn
Get relevant new arm linaro patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc           |   25 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch |  119 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch |   40 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch |   84 --
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99491.patch |  309 +++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch | 1272 ++++++++++++++++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch |  784 ++++++++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch |  186 +++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch |  134 ++
 9 files changed, 2754 insertions(+), 199 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99491.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index 519a1e7..4067d73 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -13,21 +13,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
 
 
-SRCREV = "170880"
 PV = "4.5"
-INC_PR = "r35"
-
-# BINV should be incremented after updating to a revision
-# after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
-# the value will be minor-release+1 e.g. if minor release was
-# 4.5.1 then the value below will be 2 which will mean 4.5.2
-# which will be next minor release and so on.
-
+INC_PR = "r36"
+# BINV should  point to minor release 
 BINV = "${PV}.3"
-BRANCH = "gcc-4_5-branch"
-PR_append = "+svnr${SRCPV}"
 
-SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
+SRC_URI = "${GNU_MIRROR}/gcc/gcc-${BINV}/gcc-${BINV}.tar.bz2 \
        file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
        file://100-uclibc-conf.patch \
        file://gcc-uclibc-locale-ctype_touplow_t.patch \
@@ -175,11 +166,15 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
        file://linaro/gcc-4.5-linaro-r99478.patch \
        file://linaro/gcc-4.5-linaro-r99479.patch \
        file://linaro/gcc-4.5-linaro-r99480.patch \
-       file://linaro/gcc-4.5-linaro-r99481.patch \
-       file://linaro/gcc-4.5-linaro-r99482.patch \
        file://linaro/gcc-4.5-linaro-r99483.patch \
        file://linaro/gcc-4.5-linaro-r99488.patch \
        file://linaro/gcc-4.5-linaro-r99489.patch \
+       file://linaro/gcc-4.5-linaro-r99491.patch \
+       file://linaro/gcc-4.5-linaro-r99494.patch \
+       file://linaro/gcc-4.5-linaro-r99495.patch \
+       file://linaro/gcc-4.5-linaro-r99498.patch \
+#      file://linaro/gcc-4.5-linaro-r99499.patch \
+       file://linaro/gcc-4.5-linaro-r99502.patch \
        file://more-epilogues.patch \
        file://gcc-scalar-widening-pr45847.patch \
        file://gcc-arm-volatile-bitfield-fix.patch \
@@ -207,7 +202,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
 FORTRAN = ""
 JAVA = ""
 
-S = "${WORKDIR}/${BRANCH}"
+S = "${WORKDIR}/gcc-${BINV}"
 
 #EXTRA_OECONF_BASE = "  --enable-cheaders=c_std \
 #			--enable-libssp \
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch
index 95907ee..0943130 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99301.patch
@@ -37,9 +37,11 @@
  	gcc/
 
 === modified file 'gcc/config/arm/arm-modes.def'
---- old/gcc/config/arm/arm-modes.def	2009-06-18 11:24:10 +0000
-+++ new/gcc/config/arm/arm-modes.def	2010-07-29 16:58:56 +0000
-@@ -35,10 +35,16 @@
+Index: gcc-4.5.3/gcc/config/arm/arm-modes.def
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/arm/arm-modes.def
++++ gcc-4.5.3/gcc/config/arm/arm-modes.def
+@@ -35,10 +35,16 @@ ADJUST_FLOAT_FORMAT (HF, ((arm_fp16_form
     CC_NOOVmode should be used with SImode integer equalities.
     CC_Zmode should be used if only the Z flag is set correctly
     CC_Nmode should be used if only the N (sign) flag is set correctly
@@ -56,11 +58,11 @@
  CC_MODE (CC_SWP);
  CC_MODE (CCFP);
  CC_MODE (CCFPE);
-
-=== modified file 'gcc/config/arm/arm-protos.h'
---- old/gcc/config/arm/arm-protos.h	2009-11-11 14:23:03 +0000
-+++ new/gcc/config/arm/arm-protos.h	2010-07-29 16:58:56 +0000
-@@ -49,8 +49,7 @@
+Index: gcc-4.5.3/gcc/config/arm/arm-protos.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/arm/arm-protos.h
++++ gcc-4.5.3/gcc/config/arm/arm-protos.h
+@@ -49,8 +49,7 @@ extern int arm_hard_regno_mode_ok (unsig
  extern int const_ok_for_arm (HOST_WIDE_INT);
  extern int arm_split_constant (RTX_CODE, enum machine_mode, rtx,
  			       HOST_WIDE_INT, rtx, rtx, int);
@@ -70,7 +72,7 @@
  extern int legitimate_pic_operand_p (rtx);
  extern rtx legitimize_pic_address (rtx, enum machine_mode, rtx);
  extern rtx legitimize_tls_address (rtx, rtx);
-@@ -116,6 +115,7 @@
+@@ -116,6 +115,7 @@ extern void arm_reload_in_hi (rtx *);
  extern void arm_reload_out_hi (rtx *);
  extern int arm_const_double_inline_cost (rtx);
  extern bool arm_const_double_by_parts (rtx);
@@ -78,11 +80,11 @@
  extern const char *fp_immediate_constant (rtx);
  extern void arm_emit_call_insn (rtx, rtx);
  extern const char *output_call (rtx *);
-
-=== modified file 'gcc/config/arm/arm.c'
---- old/gcc/config/arm/arm.c	2010-07-29 15:59:12 +0000
-+++ new/gcc/config/arm/arm.c	2010-07-29 16:58:56 +0000
-@@ -3190,13 +3190,82 @@
+Index: gcc-4.5.3/gcc/config/arm/arm.c
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/arm/arm.c
++++ gcc-4.5.3/gcc/config/arm/arm.c
+@@ -3191,13 +3191,82 @@ arm_gen_constant (enum rtx_code code, en
     immediate value easier to load.  */
  
  enum rtx_code
@@ -169,7 +171,7 @@
    switch (code)
      {
      case EQ:
-@@ -9912,6 +9981,55 @@
+@@ -9913,6 +9982,55 @@ arm_select_cc_mode (enum rtx_code op, rt
        && (rtx_equal_p (XEXP (x, 0), y) || rtx_equal_p (XEXP (x, 1), y)))
      return CC_Cmode;
  
@@ -225,18 +227,17 @@
    return CCmode;
  }
  
-@@ -9921,10 +10039,39 @@
+@@ -9922,10 +10040,39 @@ arm_select_cc_mode (enum rtx_code op, rt
  rtx
  arm_gen_compare_reg (enum rtx_code code, rtx x, rtx y)
  {
 -  enum machine_mode mode = SELECT_CC_MODE (code, x, y);
 -  rtx cc_reg = gen_rtx_REG (mode, CC_REGNUM);
--
--  emit_set_insn (cc_reg, gen_rtx_COMPARE (mode, x, y));
 +  enum machine_mode mode;
 +  rtx cc_reg;
 +  int dimode_comparison = GET_MODE (x) == DImode || GET_MODE (y) == DImode;
-+
+ 
+-  emit_set_insn (cc_reg, gen_rtx_COMPARE (mode, x, y));
 +  /* We might have X as a constant, Y as a register because of the predicates
 +     used for cmpdi.  If so, force X to a register here.  */
 +  if (dimode_comparison && !REG_P (x))
@@ -269,7 +270,7 @@
  
    return cc_reg;
  }
-@@ -11253,6 +11400,34 @@
+@@ -11254,6 +11401,34 @@ arm_const_double_by_parts (rtx val)
    return false;
  }
  
@@ -304,7 +305,7 @@
  /* Scan INSN and note any of its operands that need fixing.
     If DO_PUSHES is false we do not actually push any of the fixups
     needed.  The function returns TRUE if any fixups were needed/pushed.
-@@ -15097,8 +15272,18 @@
+@@ -15150,8 +15325,18 @@ arm_print_operand (FILE *stream, rtx x,
  	 the value being loaded is big-wordian or little-wordian.  The
  	 order of the two register loads can matter however, if the address
  	 of the memory location is actually held in one of the registers
@@ -324,7 +325,7 @@
        if (GET_CODE (x) != REG || REGNO (x) > LAST_ARM_REGNUM)
  	{
  	  output_operand_lossage ("invalid operand for code '%c'", code);
-@@ -15109,6 +15294,18 @@
+@@ -15162,6 +15347,18 @@ arm_print_operand (FILE *stream, rtx x,
        return;
  
      case 'R':
@@ -343,7 +344,7 @@
        if (GET_CODE (x) != REG || REGNO (x) > LAST_ARM_REGNUM)
  	{
  	  output_operand_lossage ("invalid operand for code '%c'", code);
-@@ -15801,6 +15998,28 @@
+@@ -15854,6 +16051,28 @@ get_arm_condition_code (rtx comparison)
        default: gcc_unreachable ();
        }
  
@@ -372,11 +373,11 @@
      case CCmode:
        switch (comp_code)
  	{
-
-=== modified file 'gcc/config/arm/arm.h'
---- old/gcc/config/arm/arm.h	2009-12-23 16:36:40 +0000
-+++ new/gcc/config/arm/arm.h	2010-07-29 16:58:56 +0000
-@@ -2253,19 +2253,7 @@
+Index: gcc-4.5.3/gcc/config/arm/arm.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/arm/arm.h
++++ gcc-4.5.3/gcc/config/arm/arm.h
+@@ -2253,19 +2253,7 @@ extern int making_const_table;
     : reverse_condition (code))
  
  #define CANONICALIZE_COMPARISON(CODE, OP0, OP1)				\
@@ -397,10 +398,10 @@
  
  /* The arm5 clz instruction returns 32.  */
  #define CLZ_DEFINED_VALUE_AT_ZERO(MODE, VALUE)  ((VALUE) = 32, 1)
-
-=== modified file 'gcc/config/arm/arm.md'
---- old/gcc/config/arm/arm.md	2010-07-29 15:59:12 +0000
-+++ new/gcc/config/arm/arm.md	2010-07-29 16:58:56 +0000
+Index: gcc-4.5.3/gcc/config/arm/arm.md
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/arm/arm.md
++++ gcc-4.5.3/gcc/config/arm/arm.md
 @@ -6718,17 +6718,45 @@
  				   operands[3])); DONE;"
  )
@@ -506,7 +507,7 @@
  ;; Cirrus SF compare instruction
  (define_insn "*cirrus_cmpsf"
    [(set (reg:CCFP CC_REGNUM)
-@@ -8183,18 +8257,45 @@
+@@ -8183,17 +8257,44 @@
  			     operands[2], operands[3])); DONE;"
  )
  
@@ -519,13 +520,14 @@
 -  "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_MAVERICK"
 -  "emit_insn (gen_cstore_cc (operands[0], operands[1],
 -			     operands[2], operands[3])); DONE;"
+-)
 +	 [(match_operand:DI 2 "cmpdi_operand" "")
 +	  (match_operand:DI 3 "cmpdi_operand" "")]))]
 +  "TARGET_32BIT"
 +  "{
 +     rtx swap = NULL_RTX;
 +     enum rtx_code code = GET_CODE (operands[1]);
-+
+ 
 +     /* We should not have two constants.  */
 +     gcc_assert (GET_MODE (operands[2]) == DImode
 +		 || GET_MODE (operands[3]) == DImode);
@@ -553,16 +555,14 @@
 +		      	         operands[3]));
 +     DONE;
 +   }"
- )
++)
  
--
  (define_expand "cstoresi_eq0_thumb1"
    [(parallel
-     [(set (match_operand:SI 0 "s_register_operand" "")
-
-=== modified file 'gcc/config/arm/constraints.md'
---- old/gcc/config/arm/constraints.md	2009-12-07 20:34:53 +0000
-+++ new/gcc/config/arm/constraints.md	2010-07-29 16:58:56 +0000
+Index: gcc-4.5.3/gcc/config/arm/constraints.md
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/arm/constraints.md
++++ gcc-4.5.3/gcc/config/arm/constraints.md
 @@ -29,7 +29,7 @@
  ;; in Thumb-1 state: I, J, K, L, M, N, O
  
@@ -586,11 +586,11 @@
  (define_constraint "Dn"
   "@internal
    In ARM/Thumb-2 state a const_vector which can be loaded with a Neon vmov
-
-=== modified file 'gcc/config/arm/predicates.md'
---- old/gcc/config/arm/predicates.md	2010-07-29 15:59:12 +0000
-+++ new/gcc/config/arm/predicates.md	2010-07-29 16:58:56 +0000
-@@ -86,6 +86,12 @@
+Index: gcc-4.5.3/gcc/config/arm/predicates.md
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/arm/predicates.md
++++ gcc-4.5.3/gcc/config/arm/predicates.md
+@@ -101,6 +101,12 @@
    (and (match_code "const_int")
         (match_test "const_ok_for_arm (INTVAL (op))")))
  
@@ -603,7 +603,7 @@
  (define_predicate "arm_neg_immediate_operand"
    (and (match_code "const_int")
         (match_test "const_ok_for_arm (-INTVAL (op))")))
-@@ -115,6 +121,10 @@
+@@ -130,6 +136,10 @@
    (ior (match_operand 0 "arm_rhs_operand")
         (match_operand 0 "arm_not_immediate_operand")))
  
@@ -614,23 +614,23 @@
  ;; True if the operand is a memory reference which contains an
  ;; offsettable address.
  (define_predicate "offsettable_memory_operand"
-@@ -522,4 +532,12 @@
- (define_predicate "neon_lane_number"
+@@ -538,3 +548,12 @@
    (and (match_code "const_int")
-        (match_test "INTVAL (op) >= 0 && INTVAL (op) <= 7")))
+        (match_test "INTVAL (op) >= 0 && INTVAL (op) <= 15")))
+ 
 +;; Predicates for named expanders that overlap multiple ISAs.
 +
 +(define_predicate "cmpdi_operand"
 +  (if_then_else (match_test "TARGET_HARD_FLOAT && TARGET_MAVERICK")
-+		(and (match_test "TARGET_ARM")
-+		     (match_operand 0 "cirrus_fp_register"))
-+		(and (match_test "TARGET_32BIT")
-+		     (match_operand 0 "arm_di_operand"))))
- 
-
-=== added file 'gcc/testsuite/gcc.c-torture/execute/20100416-1.c'
---- old/gcc/testsuite/gcc.c-torture/execute/20100416-1.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.c-torture/execute/20100416-1.c	2010-07-29 16:58:56 +0000
++               (and (match_test "TARGET_ARM")
++                    (match_operand 0 "cirrus_fp_register"))
++               (and (match_test "TARGET_32BIT")
++                    (match_operand 0 "arm_di_operand"))))
++
+Index: gcc-4.5.3/gcc/testsuite/gcc.c-torture/execute/20100416-1.c
+===================================================================
+--- /dev/null
++++ gcc-4.5.3/gcc/testsuite/gcc.c-torture/execute/20100416-1.c
 @@ -0,0 +1,40 @@
 +void abort(void);
 +
@@ -672,4 +672,3 @@
 +    }
 +  return 0;
 +}
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch
deleted file mode 100644
index db53255..0000000
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch
+++ /dev/null
@@ -1,40 +0,0 @@
- 2011-02-02  Richard Sandiford  <richard.sandiford@linaro.org>
- 
-	gcc/testsuite/
-	PR target/47553
-	* gcc.target/arm/neon-vld-1.c: New test.
-	gcc/
-	PR target/47553
-	* config/arm/predicates.md (neon_lane_number): Accept 0..15.
-
-=== modified file 'gcc/config/arm/predicates.md'
---- old/gcc/config/arm/predicates.md	2011-02-08 12:07:29 +0000
-+++ new/gcc/config/arm/predicates.md	2011-03-02 12:28:41 +0000
-@@ -607,7 +607,7 @@
- ;; TODO: We could check lane numbers more precisely based on the mode.
- (define_predicate "neon_lane_number"
-   (and (match_code "const_int")
--       (match_test "INTVAL (op) >= 0 && INTVAL (op) <= 7")))
-+       (match_test "INTVAL (op) >= 0 && INTVAL (op) <= 15")))
- ;; Predicates for named expanders that overlap multiple ISAs.
- 
- (define_predicate "cmpdi_operand"
-
-=== added file 'gcc/testsuite/gcc.target/arm/neon-vld-1.c'
---- old/gcc/testsuite/gcc.target/arm/neon-vld-1.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon-vld-1.c	2011-02-02 13:57:54 +0000
-@@ -0,0 +1,13 @@
-+/* { dg-do compile } */
-+/* { dg-require-effective-target arm_neon_ok } */
-+/* { dg-options "-O1" } */
-+/* { dg-add-options arm_neon } */
-+
-+#include <arm_neon.h>
-+
-+uint8x16_t
-+foo (uint8_t *a, uint8x16_t b)
-+{
-+  vst1q_lane_u8 (a, b, 14);
-+  return vld1q_lane_u8 (a + 0x100, b, 15);
-+}
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch
deleted file mode 100644
index 334ac4e..0000000
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch
+++ /dev/null
@@ -1,84 +0,0 @@
- 2011-02-02  Richard Sandiford  <richard.sandiford@linaro.org>
- 
-	gcc/
-	Backport from mainline:
-
-	2011-01-23  Bernd Schmidt  <bernds@codesourcery.com>
-		    Richard Sandiford  <rdsandiford@googlemail.com>
-
-	PR rtl-optimization/47166
-	* reload1.c (emit_reload_insns): Disable the spill_reg_store
-	mechanism for PRE_MODIFY and POST_MODIFY.
-	(inc_for_reload): For PRE_MODIFY, return the insn that sets the
-	reloadreg.
-
-	gcc/testsuite/
-	* gcc.c-torture/execute/postmod-1.c: New test.
-
-=== added file 'gcc/testsuite/gcc.c-torture/execute/postmod-1.c'
---- old/gcc/testsuite/gcc.c-torture/execute/postmod-1.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.c-torture/execute/postmod-1.c	2011-02-02 14:23:10 +0000
-@@ -0,0 +1,62 @@
-+#define DECLARE_ARRAY(A) array##A[0x10]
-+#define DECLARE_COUNTER(A) counter##A = 0
-+#define DECLARE_POINTER(A) *pointer##A = array##A + x
-+/* Create a loop that allows post-modification of pointerA, followed by
-+   a use of the post-modified address.  */
-+#define BEFORE(A) counter##A += *pointer##A, pointer##A += 3
-+#define AFTER(A) counter##A += pointer##A[x]
-+
-+/* Set up the arrays so that one iteration of the loop sets the counter
-+   to 3.0f.  */
-+#define INIT_ARRAY(A) array##A[1] = 1.0f, array##A[5] = 2.0f
-+
-+/* Check that the loop worked correctly for all values.  */
-+#define CHECK_ARRAY(A) exit_code |= (counter##A != 3.0f)
-+
-+/* Having 6 copies triggered the bug for ARM and Thumb.  */
-+#define MANY(A) A (0), A (1), A (2), A (3), A (4), A (5)
-+
-+/* Each addendA should be allocated a register.  */
-+#define INIT_VOLATILE(A) addend##A = vol
-+#define ADD_VOLATILE(A) vol += addend##A
-+
-+/* Having 5 copies triggered the bug for ARM and Thumb.  */
-+#define MANY2(A) A (0), A (1), A (2), A (3), A (4)
-+
-+float MANY (DECLARE_ARRAY);
-+float MANY (DECLARE_COUNTER);
-+
-+volatile int stop = 1;
-+volatile int vol;
-+
-+void __attribute__((noinline))
-+foo (int x)
-+{
-+  float MANY (DECLARE_POINTER);
-+  int i;
-+
-+  do
-+    {
-+      MANY (BEFORE);
-+      MANY (AFTER);
-+      /* Create an inner loop that should ensure the code above
-+	 has registers free for reload inheritance.  */
-+      {
-+	int MANY2 (INIT_VOLATILE);
-+	for (i = 0; i < 10; i++)
-+	  MANY2 (ADD_VOLATILE);
-+      }
-+    }
-+  while (!stop);
-+}
-+
-+int
-+main (void)
-+{
-+  int exit_code = 0;
-+
-+  MANY (INIT_ARRAY);
-+  foo (1);
-+  MANY (CHECK_ARRAY);
-+  return exit_code;
-+}
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99491.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99491.patch
new file mode 100644
index 0000000..a2d6c6a
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99491.patch
@@ -0,0 +1,309 @@
+2011-04-08  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	Backport from mainline:
+	gcc/
+	* dwarf2out.c (dw_loc_list_node): Add resolved_addr and replaced.
+	(cached_dw_loc_list_def): New structure.
+	(cached_dw_loc_list): New typedef.
+	(cached_dw_loc_list_table): New variable.
+	(cached_dw_loc_list_table_hash): New function.
+	(cached_dw_loc_list_table_eq): Likewise.
+	(add_location_or_const_value_attribute): Take a bool cache_p.
+	Cache the list when the parameter is true.
+	(gen_formal_parameter_die): Update caller.
+	(gen_variable_die): Likewise.
+	(dwarf2out_finish): Likewise.
+	(dwarf2out_abstract_function): Nullify cached_dw_loc_list_table
+	while generating debug info for the decl.
+	(dwarf2out_function_decl): Clear cached_dw_loc_list_table.
+	(dwarf2out_init): Initialize cached_dw_loc_list_table.
+	(resolve_addr): Cache the result of resolving a chain of
+	location lists.
+
+	From: 2010-10-12  Jakub Jelinek  <jakub@redhat.com>
+	* dwarf2out.c (dw_loc_list_node): Add emitted field.
+	(output_loc_list): Return immediately if emitted is set, set it.
+
+=== modified file 'gcc/dwarf2out.c'
+--- old/gcc/dwarf2out.c	2011-03-10 14:55:10 +0000
++++ new/gcc/dwarf2out.c	2011-03-28 09:43:50 +0000
+@@ -4256,6 +4256,12 @@
+ 		      Only on head of list */
+   const char *section; /* Section this loclist is relative to */
+   dw_loc_descr_ref expr;
++  /* True if all addresses in this and subsequent lists are known to be
++     resolved.  */
++  bool resolved_addr;
++  /* True if this list has been replaced by dw_loc_next.  */
++  bool replaced;
++  bool emitted;
+ } dw_loc_list_node;
+ 
+ #if defined (DWARF2_DEBUGGING_INFO) || defined (DWARF2_UNWIND_INFO)
+@@ -5759,6 +5765,19 @@
+ /* Table of decl location linked lists.  */
+ static GTY ((param_is (var_loc_list))) htab_t decl_loc_table;
+ 
++/* A cached location list.  */
++struct GTY (()) cached_dw_loc_list_def {
++  /* The DECL_UID of the decl that this entry describes.  */
++  unsigned int decl_id;
++
++  /* The cached location list.  */
++  dw_loc_list_ref loc_list;
++};
++typedef struct cached_dw_loc_list_def cached_dw_loc_list;
++
++/* Table of cached location lists.  */
++static GTY ((param_is (cached_dw_loc_list))) htab_t cached_dw_loc_list_table;
++
+ /* A pointer to the base of a list of references to DIE's that
+    are uniquely identified by their tag, presence/absence of
+    children DIE's, and list of attribute/value pairs.  */
+@@ -6112,7 +6131,7 @@
+ static void insert_int (HOST_WIDE_INT, unsigned, unsigned char *);
+ static void insert_float (const_rtx, unsigned char *);
+ static rtx rtl_for_decl_location (tree);
+-static bool add_location_or_const_value_attribute (dw_die_ref, tree,
++static bool add_location_or_const_value_attribute (dw_die_ref, tree, bool,
+ 						   enum dwarf_attribute);
+ static bool tree_add_const_value_attribute (dw_die_ref, tree);
+ static bool tree_add_const_value_attribute_for_decl (dw_die_ref, tree);
+@@ -7731,6 +7750,24 @@
+     htab_find_with_hash (decl_loc_table, decl, DECL_UID (decl));
+ }
+ 
++/* Returns a hash value for X (which really is a cached_dw_loc_list_list).  */
++
++static hashval_t
++cached_dw_loc_list_table_hash (const void *x)
++{
++  return (hashval_t) ((const cached_dw_loc_list *) x)->decl_id;
++}
++
++/* Return nonzero if decl_id of cached_dw_loc_list X is the same as
++   UID of decl *Y.  */
++
++static int
++cached_dw_loc_list_table_eq (const void *x, const void *y)
++{
++  return (((const cached_dw_loc_list *) x)->decl_id
++	  == DECL_UID ((const_tree) y));
++}
++
+ /* Equate a DIE to a particular declaration.  */
+ 
+ static void
+@@ -10355,6 +10392,10 @@
+ {
+   dw_loc_list_ref curr = list_head;
+ 
++  if (list_head->emitted)
++    return;
++  list_head->emitted = true;
++
+   ASM_OUTPUT_LABEL (asm_out_file, list_head->ll_symbol);
+ 
+   /* Walk the location list, and output each range + expression.  */
+@@ -15920,15 +15961,22 @@
+    these things can crop up in other ways also.)  Note that one type of
+    constant value which can be passed into an inlined function is a constant
+    pointer.  This can happen for example if an actual argument in an inlined
+-   function call evaluates to a compile-time constant address.  */
++   function call evaluates to a compile-time constant address.
++
++   CACHE_P is true if it is worth caching the location list for DECL,
++   so that future calls can reuse it rather than regenerate it from scratch.
++   This is true for BLOCK_NONLOCALIZED_VARS in inlined subroutines,
++   since we will need to refer to them each time the function is inlined.  */
+ 
+ static bool
+-add_location_or_const_value_attribute (dw_die_ref die, tree decl,
++add_location_or_const_value_attribute (dw_die_ref die, tree decl, bool cache_p,
+ 				       enum dwarf_attribute attr)
+ {
+   rtx rtl;
+   dw_loc_list_ref list;
+   var_loc_list *loc_list;
++  cached_dw_loc_list *cache;
++  void **slot;
+ 
+   if (TREE_CODE (decl) == ERROR_MARK)
+     return false;
+@@ -15964,7 +16012,34 @@
+ 	  && add_const_value_attribute (die, rtl))
+ 	 return true;
+     }
+-  list = loc_list_from_tree (decl, decl_by_reference_p (decl) ? 0 : 2);
++  /* If this decl is from BLOCK_NONLOCALIZED_VARS, we might need its
++     list several times.  See if we've already cached the contents.  */
++  list = NULL;
++  if (loc_list == NULL || cached_dw_loc_list_table == NULL)
++    cache_p = false;
++  if (cache_p)
++    {
++      cache = (cached_dw_loc_list *)
++	htab_find_with_hash (cached_dw_loc_list_table, decl, DECL_UID (decl));
++      if (cache)
++	list = cache->loc_list;
++    }
++  if (list == NULL)
++    {
++      list = loc_list_from_tree (decl, decl_by_reference_p (decl) ? 0 : 2);
++      /* It is usually worth caching this result if the decl is from
++	 BLOCK_NONLOCALIZED_VARS and if the list has at least two elements.  */
++      if (cache_p && list && list->dw_loc_next)
++	{
++	  slot = htab_find_slot_with_hash (cached_dw_loc_list_table, decl,
++					   DECL_UID (decl), INSERT);
++	  cache = (cached_dw_loc_list *)
++	    ggc_alloc_cleared (sizeof (cached_dw_loc_list));
++	  cache->decl_id = DECL_UID (decl);
++	  cache->loc_list = list;
++	  *slot = cache;
++	}
++    }
+   if (list)
+     {
+       add_AT_location_description (die, attr, list);
+@@ -17532,7 +17607,7 @@
+         equate_decl_number_to_die (node, parm_die);
+       if (! DECL_ABSTRACT (node_or_origin))
+ 	add_location_or_const_value_attribute (parm_die, node_or_origin,
+-					       DW_AT_location);
++					       node == NULL, DW_AT_location);
+ 
+       break;
+ 
+@@ -17712,6 +17787,7 @@
+   tree context;
+   int was_abstract;
+   htab_t old_decl_loc_table;
++  htab_t old_cached_dw_loc_list_table;
+ 
+   /* Make sure we have the actual abstract inline, not a clone.  */
+   decl = DECL_ORIGIN (decl);
+@@ -17725,7 +17801,9 @@
+      DIE.  Be sure to not clobber the outer location table nor use it or we would
+      get locations in abstract instantces.  */
+   old_decl_loc_table = decl_loc_table;
++  old_cached_dw_loc_list_table = cached_dw_loc_list_table;
+   decl_loc_table = NULL;
++  cached_dw_loc_list_table = NULL;
+ 
+   /* Be sure we've emitted the in-class declaration DIE (if any) first, so
+      we don't get confused by DECL_ABSTRACT.  */
+@@ -17750,6 +17828,7 @@
+ 
+   current_function_decl = save_fn;
+   decl_loc_table = old_decl_loc_table;
++  cached_dw_loc_list_table = old_cached_dw_loc_list_table;
+   pop_cfun ();
+ }
+ 
+@@ -18431,9 +18510,8 @@
+           && !TREE_SYMBOL_REFERENCED (DECL_ASSEMBLER_NAME (decl_or_origin)))
+ 	defer_location (decl_or_origin, var_die);
+       else
+-        add_location_or_const_value_attribute (var_die,
+-					       decl_or_origin,
+-					       DW_AT_location);
++        add_location_or_const_value_attribute (var_die, decl_or_origin,
++					       decl == NULL, DW_AT_location);
+       add_pubname (decl_or_origin, var_die);
+     }
+   else
+@@ -20049,6 +20127,7 @@
+   dwarf2out_decl (decl);
+ 
+   htab_empty (decl_loc_table);
++  htab_empty (cached_dw_loc_list_table);
+ }
+ 
+ /* Output a marker (i.e. a label) for the beginning of the generated code for
+@@ -20649,6 +20728,11 @@
+   decl_loc_table = htab_create_ggc (10, decl_loc_table_hash,
+ 				    decl_loc_table_eq, NULL);
+ 
++  /* Allocate the cached_dw_loc_list_table.  */
++  cached_dw_loc_list_table
++    = htab_create_ggc (10, cached_dw_loc_list_table_hash,
++		       cached_dw_loc_list_table_eq, NULL);
++
+   /* Allocate the initial hunk of the decl_scope_table.  */
+   decl_scope_table = VEC_alloc (tree, gc, 256);
+ 
+@@ -21278,30 +21362,53 @@
+ {
+   dw_die_ref c;
+   dw_attr_ref a;
+-  dw_loc_list_ref *curr;
++  dw_loc_list_ref *curr, *start, loc;
+   unsigned ix;
+ 
+   for (ix = 0; VEC_iterate (dw_attr_node, die->die_attr, ix, a); ix++)
+     switch (AT_class (a))
+       {
+       case dw_val_class_loc_list:
+-	curr = AT_loc_list_ptr (a);
+-	while (*curr)
++	start = curr = AT_loc_list_ptr (a);
++	loc = *curr;
++	gcc_assert (loc);
++	/* The same list can be referenced more than once.  See if we have
++	   already recorded the result from a previous pass.  */
++	if (loc->replaced)
++	  *curr = loc->dw_loc_next;
++	else if (!loc->resolved_addr)
+ 	  {
+-	    if (!resolve_addr_in_expr ((*curr)->expr))
++	    /* As things stand, we do not expect or allow one die to
++	       reference a suffix of another die's location list chain.
++	       References must be identical or completely separate.
++	       There is therefore no need to cache the result of this
++	       pass on any list other than the first; doing so
++	       would lead to unnecessary writes.  */
++	    while (*curr)
+ 	      {
+-		dw_loc_list_ref next = (*curr)->dw_loc_next;
+-		if (next && (*curr)->ll_symbol)
++		gcc_assert (!(*curr)->replaced && !(*curr)->resolved_addr);
++		if (!resolve_addr_in_expr ((*curr)->expr))
+ 		  {
+-		    gcc_assert (!next->ll_symbol);
+-		    next->ll_symbol = (*curr)->ll_symbol;
++		    dw_loc_list_ref next = (*curr)->dw_loc_next;
++		    if (next && (*curr)->ll_symbol)
++		      {
++			gcc_assert (!next->ll_symbol);
++			next->ll_symbol = (*curr)->ll_symbol;
++		      }
++		    *curr = next;
+ 		  }
+-		*curr = next;
++		else
++		  curr = &(*curr)->dw_loc_next;
+ 	      }
++	    if (loc == *start)
++	      loc->resolved_addr = 1;
+ 	    else
+-	      curr = &(*curr)->dw_loc_next;
++	      {
++		loc->replaced = 1;
++		loc->dw_loc_next = *start;
++	      }
+ 	  }
+-	if (!AT_loc_list (a))
++	if (!*start)
+ 	  {
+ 	    remove_AT (die, a->dw_attr);
+ 	    ix--;
+@@ -21361,6 +21468,7 @@
+       add_location_or_const_value_attribute (
+         VEC_index (deferred_locations, deferred_locations_list, i)->die,
+         VEC_index (deferred_locations, deferred_locations_list, i)->variable,
++	false,
+ 	DW_AT_location);
+     }
+ 
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch
new file mode 100644
index 0000000..56897e9
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99494.patch
@@ -0,0 +1,1272 @@
+2011-04-09  Andrew Stubbs  <ams@codesourcery.com>
+
+	Backport from mainline:
+
+	Maxim Kuvyrkov  <maxim@codesourcery.com>
+
+	* config.sub: Recognize *-linux-android*.
+
+	2010-05-27 Maxim Kuvyrkov  <maxim@codesourcery.com>
+
+	Add support for Bionic C library
+	gcc/
+	* config.gcc (LIBC_GLIBC, LIBC_BIONIC, LIBC_UCLIBC): New tm_define
+	macro.
+	(DEFAULT_LIBC): New tm_define macro set to one of LIBC_*.
+	(bfin*-uclinux, moxie-*-uclinux*, m68k-*-uclinux*): Update.
+
+	* config/linux.h (OPTION_GLIBC, OPTION_UCLIBC, OPTION_BIONIC): Define.
+	(LINUX_TARGET_OS_CPP_BUILTINS): Define __gnu_linux__ only for GLIBC.
+	(CHOOSE_DYNAMIC_LINKER1, CHOOSE_DYNAMIC_LINKER): Make it easier
+	to support multiple C libraries.  Handle Bionic.
+	(BIONIC_DYNAMIC_LINKER, BIONIC_DYNAMIC_LINKER32,)
+	(BIONIC_DYNAMIC_LINKER64): Define.
+	(LINUX_DYNAMIC_LINKER, LINUX_DYNAMIC_LINKER32, LINUX_DYNAMIC_LINKER64):
+	Update.
+	(TARGET_HAS_SINCOS): Enable for Bionic.
+
+	* config/linux.opt: Rewrite to handle more than 2 C libraries.  Make
+	the last option specified on command line take effect.
+	(linux_uclibc): Rename to linux_libc, initialize using DEFAULT_LIBC.
+	(mbionic): New.
+	(mglibc, muclibc): Update.
+
+	* config/alpha/linux-elf.h, config/rs6000/linux64.h,
+	* config/rs6000/sysv4.h (CHOOSE_DYNAMIC_LINKER): Update to use
+	DEFAULT_LIBC.
+
+	* doc/invoke.texi (-mglibc, -muclibc): Update.
+	(-mbionic): Document.
+
+	gcc/testsuite/
+	* gcc.dg/glibc-uclibc-1.c, gcc.dg/glibc-uclibc-2.c: Remove, no longer
+	necessary.
+
+	2010-05-27 Maxim Kuvyrkov  <maxim@codesourcery.com>
+
+	Support compilation for Android platform.  Reimplement -mandroid.
+	gcc/
+	* config.gcc (*linux*): Include linux-android.h and linux-android.opt.
+	(*android*): Set ANDROID_DEFAULT.
+	(arm*-*-linux*): Include linux-android.h.
+	(arm*-*-eabi*): Don't include previous -mandroid implementation.
+	* config/arm/eabi.h: Remove, move Android-specific parts ...
+	* config/linux-android.h: ... here.  New file.
+	* config/arm/eabi.opt: Rename to ...
+	* config/linux-android.opt: ... this.
+	(mandroid): Allow -mno-android option.  Initialize based on
+	ANDROID_DEFAULT.
+	* config/linux.h (STARTFILE_SPEC, ENDFILE_SPEC, CC1_SPEC, LIB_SPEC):
+	Move logic to corresponding LINUX_TARGET_* macros.
+	(TARGET_OS_CPP_BUILTINS): Define __ANDROID__, when appropriate.
+	* config/linux-eabi.h (LINK_SPEC, CC1_SPEC, CC1PLUS_SPEC, LIB_SPEC,)
+	(STARTFILE_SPEC, ENDFILE_SPEC): Define to choose between Linux and
+	Android definitions.
+	(LINUX_TARGET_OS_CPP_BUILTINS): Define __ANDROID__ if TARGET_ANDROID.
+	* doc/invoke.texi (-mandroid, -tno-android-cc, -tno-android-ld):
+	Document.
+
+	2010-06-01 Maxim Kuvyrkov  <maxim@codesourcery.com>
+
+	gcc/
+	* config/arm/t-linux-androideabi: New.
+	* config.gcc (arm*-*-linux-androideabi): Include multilib configuration.
+
+	2010-05-27 Maxim Kuvyrkov  <maxim@codesourcery.com>
+
+	gcc/
+	* gthr-posix.h (pthread_cancel): Don't declare if compiling against
+	Bionic C library.
+	(__gthread_active_p): Check for pthread_create if compiling against
+	Bionic C library.
+
+	2010-06-01 Maxim Kuvyrkov  <maxim@codesourcery.com>
+
+	libstdc++-v3/
+	* acinclude.m4: Support Bionic C library.
+	Explicitly specify -fexceptions for exception check.
+	* configure.host: Support Bionic C library.
+	* configure: Regenerate.
+	* config/os/bionic/ctype_base.h, config/os/bionic/ctype_inline.h,
+	* config/os/bionic/ctype_noincline.h, config/os/bionic/os_defines.h:
+	New files, based on config/os/newlib/*.
+
+=== modified file 'config.sub'
+Index: gcc-4.5.3/config.sub
+===================================================================
+--- gcc-4.5.3.orig/config.sub
++++ gcc-4.5.3/config.sub
+@@ -4,7 +4,7 @@
+ #   2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010
+ #   Free Software Foundation, Inc.
+ 
+-timestamp='2010-03-22'
++timestamp='2010-04-23'
+ 
+ # This file is (in principle) common to ALL GNU software.
+ # The presence of a machine in this file suggests that SOME GNU software
+@@ -124,8 +124,9 @@ esac
+ # Here we must recognize all the valid KERNEL-OS combinations.
+ maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
+ case $maybe_os in
+-  nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-uclibc* | \
+-  uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | netbsd*-gnu* | \
++  nto-qnx* | linux-gnu* | linux-android* | linux-dietlibc | linux-newlib* | \
++  linux-uclibc* | uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | \
++  knetbsd*-gnu* | netbsd*-gnu* | \
+   kopensolaris*-gnu* | \
+   storm-chaos* | os2-emx* | rtmk-nova*)
+     os=-$maybe_os
+@@ -1307,7 +1308,8 @@ case $os in
+ 	      | -udi* | -eabi* | -lites* | -ieee* | -go32* | -aux* \
+ 	      | -chorusos* | -chorusrdb* | -cegcc* \
+ 	      | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
+-	      | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc* \
++	      | -mingw32* | -linux-gnu* | -linux-android* \
++	      | -linux-newlib* | -linux-uclibc* \
+ 	      | -uxpv* | -beos* | -mpeix* | -udk* \
+ 	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
+ 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
+Index: gcc-4.5.3/gcc/config.gcc
+===================================================================
+--- gcc-4.5.3.orig/gcc/config.gcc
++++ gcc-4.5.3/gcc/config.gcc
+@@ -513,26 +513,48 @@ case ${target} in
+     *-*-gnu*)
+       tmake_file="$tmake_file t-gnu";;
+   esac
+-  # glibc / uclibc switch.  uclibc isn't usable for GNU/Hurd and neither for
+-  # GNU/k*BSD.
++  # Common C libraries.
++  tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3"
++  # glibc / uclibc / bionic switch.
++  # uclibc and bionic aren't usable for GNU/Hurd and neither for GNU/k*BSD.
+   case $target in
+     *linux*)
+       extra_options="$extra_options linux.opt";;
+     *)
+       tm_defines="$tm_defines OPTION_GLIBC=1";;
+   esac
+-  case ${target} in
++  case $target in
++    *-*-*android*)
++      tm_defines="$tm_defines DEFAULT_LIBC=LIBC_BIONIC"
++      ;;
+     *-*-*uclibc*)
+-      tm_defines="${tm_defines} UCLIBC_DEFAULT=1"
++      tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC"
+       ;;
+     *)
+-      tm_defines="${tm_defines} UCLIBC_DEFAULT=0"
++      tm_defines="$tm_defines DEFAULT_LIBC=LIBC_GLIBC"
+       ;;
+   esac
+-  # Assume that glibc or uClibc are being used and so __cxa_atexit is provided.
++  # Assume that glibc or uClibc or Bionic are being used and so __cxa_atexit
++  # is provided.
+   default_use_cxa_atexit=yes
+   use_gcc_tgmath=no
+   use_gcc_stdint=wrap
++  # Add Android userspace support to Linux targets.
++  case $target in
++    *linux*)
++      tm_file="$tm_file linux-android.h"
++      extra_options="$extra_options linux-android.opt"
++      ;;
++  esac
++  # Enable compilation for Android by default for *android* targets.
++  case $target in
++    *-*-*android*)
++      tm_defines="$tm_defines ANDROID_DEFAULT=1"
++      ;;
++    *)
++      tm_defines="$tm_defines ANDROID_DEFAULT=0"
++      ;;
++  esac
+   ;;
+ *-*-netbsd*)
+   tmake_file="t-slibgcc-elf-ver t-libc-ok t-netbsd t-libgcc-pic"
+@@ -728,7 +750,7 @@ arm*-*-netbsd*)
+ 	use_collect2=yes
+ 	;;
+ arm*-*-linux*)			# ARM GNU/Linux with ELF
+-	tm_file="dbxelf.h elfos.h linux.h glibc-stdint.h arm/elf.h arm/linux-gas.h arm/linux-elf.h"
++	tm_file="dbxelf.h elfos.h linux.h linux-android.h glibc-stdint.h arm/elf.h arm/linux-gas.h arm/linux-elf.h"
+ 	case $target in
+ 	arm*b-*)
+ 		tm_defines="${tm_defines} TARGET_BIG_ENDIAN_DEFAULT=1"
+@@ -739,6 +761,12 @@ arm*-*-linux*)			# ARM GNU/Linux with EL
+ 	arm*-*-linux-*eabi)
+ 	    tm_file="$tm_file arm/bpabi.h arm/linux-eabi.h"
+ 	    tmake_file="$tmake_file arm/t-arm-elf arm/t-bpabi arm/t-linux-eabi t-slibgcc-libgcc"
++	    # Define multilib configuration for arm-linux-androideabi.
++	    case ${target} in
++	    *-androideabi)
++		tmake_file="$tmake_file arm/t-linux-androideabi"
++		;;
++	    esac
+   	    # The BPABI long long divmod functions return a 128-bit value in
+ 	    # registers r0-r3.  Correctly modeling that requires the use of
+ 	    # TImode.
+@@ -785,9 +813,8 @@ arm*-*-eabi* | arm*-*-symbianelf* )
+ 	tmake_file="arm/t-arm arm/t-arm-elf"
+ 	case ${target} in
+ 	arm*-*-eabi*)
+-	  tm_file="$tm_file arm/eabi.h newlib-stdint.h"
++	  tm_file="$tm_file newlib-stdint.h"
+ 	  tmake_file="${tmake_file} arm/t-bpabi"
+-	  extra_options="${extra_options} arm/eabi.opt"
+ 	  use_gcc_stdint=wrap
+ 	  ;;
+ 	arm*-*-symbianelf*)
+@@ -843,7 +870,7 @@ bfin*-elf*)
+ bfin*-uclinux*)
+ 	tm_file="${tm_file} dbxelf.h elfos.h bfin/elf.h linux.h glibc-stdint.h bfin/uclinux.h"
+ 	tmake_file=bfin/t-bfin-uclinux
+-	tm_defines="${tm_defines} UCLIBC_DEFAULT=1"
++	tm_defines="${tm_defines} DEFAULT_LIBC=LIBC_UCLIBC"
+ 	extra_options="${extra_options} linux.opt"
+ 	use_collect2=no
+ 	;;
+@@ -924,7 +951,7 @@ moxie-*-uclinux*)
+ 	tm_file="dbxelf.h elfos.h svr4.h ${tm_file} linux.h glibc-stdint.h moxie/uclinux.h"
+ 	extra_parts="crti.o crtn.o crtbegin.o crtend.o"
+ 	tmake_file="${tmake_file} moxie/t-moxie moxie/t-moxie-softfp soft-fp/t-softfp"
+-	tm_defines="${tm_defines} UCLIBC_DEFAULT=1"
++	tm_defines="${tm_defines} DEFAULT_LIBC=LIBC_UCLIBC"
+ 	extra_options="${extra_options} linux.opt"
+ 	;;
+ h8300-*-rtems*)
+@@ -1644,7 +1671,7 @@ m68k-*-uclinux*)		# Motorola m68k/ColdFi
+ 	default_m68k_cpu=68020
+ 	default_cf_cpu=5206
+ 	tm_file="${tm_file} dbxelf.h elfos.h svr4.h linux.h glibc-stdint.h flat.h m68k/linux.h m68k/uclinux.h ./sysroot-suffix.h"
+- 	tm_defines="${tm_defines} MOTOROLA=1 UCLIBC_DEFAULT=1"
++ 	tm_defines="${tm_defines} MOTOROLA=1 DEFAULT_LIBC=LIBC_UCLIBC"
+ 	extra_options="${extra_options} linux.opt"
+ 	tmake_file="m68k/t-floatlib m68k/t-uclinux m68k/t-mlibs"
+ 	;;
+Index: gcc-4.5.3/gcc/config/alpha/linux-elf.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/alpha/linux-elf.h
++++ gcc-4.5.3/gcc/config/alpha/linux-elf.h
+@@ -29,10 +29,12 @@ along with GCC; see the file COPYING3.
+ 
+ #define GLIBC_DYNAMIC_LINKER	"/lib/ld-linux.so.2"
+ #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
+-#if UCLIBC_DEFAULT
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:%{muclibc:%e-mglibc and -muclibc used together}" G ";:" U "}"
++#if DEFAULT_LIBC == LIBC_UCLIBC
++#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
++#elif DEFAULT_LIBC == LIBC_GLIBC
++#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
+ #else
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:%{mglibc:%e-mglibc and -muclibc used together}" U ";:" G "}"
++#error "Unsupported DEFAULT_LIBC"
+ #endif
+ #define LINUX_DYNAMIC_LINKER \
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
+Index: gcc-4.5.3/gcc/config/arm/eabi.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/arm/eabi.h
++++ /dev/null
+@@ -1,125 +0,0 @@
+-/* Configuration file for ARM EABI targets.
+-   Copyright (C) 2008
+-   Free Software Foundation, Inc.
+-   Contributed by Doug Kwan (dougkwan@google.com)
+-
+-   This file is part of GCC.
+-
+-   GCC is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU General Public License as published
+-   by the Free Software Foundation; either version 3, or (at your
+-   option) any later version.
+-
+-   GCC is distributed in the hope that it will be useful, but WITHOUT
+-   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+-   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
+-   License for more details.
+-
+-   You should have received a copy of the GNU General Public License
+-   along with GCC; see the file COPYING3.  If not see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-/* This file contains macro overrides for EABI targets.  */
+-
+-#undef TARGET_OS_CPP_BUILTINS
+-#define TARGET_OS_CPP_BUILTINS()			\
+-  do							\
+-    {							\
+-      TARGET_BPABI_CPP_BUILTINS ();			\
+-      if (TARGET_ANDROID)				\
+-	builtin_define ("__ANDROID__");			\
+-    }							\
+-  while (false)
+-
+-#undef SUBSUBTARGET_EXTRA_SPECS
+-#define SUBSUBTARGET_EXTRA_SPECS \
+-  { "link_android",		ANDROID_LINK_SPEC },		\
+-  { "link_default",		BPABI_LINK_SPEC },		\
+-  { "cc1_android",		ANDROID_CC1_SPEC },		\
+-  { "cc1_default",		CC1_DEFAULT_SPEC },		\
+-  { "cc1plus_android",		ANDROID_CC1PLUS_SPEC },		\
+-  { "cc1plus_default",		CC1PLUS_DEFAULT_SPEC },		\
+-  { "lib_android",		ANDROID_LIB_SPEC },		\
+-  { "lib_default",		LIB_DEFAULT_SPEC },		\
+-  { "startfile_android",	ANDROID_STARTFILE_SPEC },	\
+-  { "startfile_default",	UNKNOWN_ELF_STARTFILE_SPEC },	\
+-  { "endfile_android",		ANDROID_ENDFILE_SPEC },		\
+-  { "endfile_default",		UNKNOWN_ELF_ENDFILE_SPEC },	\
+-
+-#undef ANDROID_LINK_SPEC
+-#define ANDROID_LINK_SPEC \
+-"%{mbig-endian:-EB} %{mlittle-endian:-EL} "		\
+-"%{static:-Bstatic} %{shared:-shared} %{symbolic:-Bsymbolic} "	\
+-"%{!static:" \
+-   "%{shared: -Bsymbolic} " \
+-   "%{!shared:" \
+-      "%{rdynamic:-export-dynamic} " \
+-      "%{!dynamic-linker:-dynamic-linker /system/bin/linker}}} " \
+-"-X" SUBTARGET_EXTRA_LINK_SPEC
+-
+-/* Override LINK_SPEC in bpabi.h. */
+-#undef LINK_SPEC
+-#define LINK_SPEC \
+-"%{mandroid: %(link_android) ;" \
+-"          : %(link_default)}"
+-
+-/* Android uses -fno-exceptions by default. */
+-#undef ANDROID_CC1_SPEC
+-#define ANDROID_CC1_SPEC "%{!fexceptions:-fno-exceptions}"
+-
+-/* Default CC1_SPEC as in arm.h. */
+-#undef CC1_DEFAULT_SPEC
+-#define CC1_DEFAULT_SPEC ""
+-
+-#undef CC1_SPEC
+-#define CC1_SPEC \
+-"%{mandroid: %(cc1_android) ;" \
+-"          : %(cc1_default)}"
+-
+-/* Android uses -fno-rtti by default. */
+-#undef ANDROID_CC1PLUS_SPEC
+-#define ANDROID_CC1PLUS_SPEC "%{!frtti:-fno-rtti}"
+-
+-/* Default CC1PLUS_SPEC as in gcc.c. */
+-#undef CC1PLUS_DEFAULT_SPEC
+-#define CC1PLUS_DEFAULT_SPEC ""
+-
+-#undef CC1PLUS_SPEC
+-#define CC1PLUS_SPEC \
+-"%{mandroid: %(cc1plus_android) ;" \
+-"          : %(cc1plus_default)}"
+-
+-#undef ANDROID_LIB_SPEC
+-#define ANDROID_LIB_SPEC	"-lc %{!static:-ldl}"
+-
+-/* Default LIB_SPEC as in gcc.c. */
+-#undef LIB_DEFAULT_SPEC
+-#define LIB_DEFAULT_SPEC \
+-"%{!shared:%{g*:-lg} %{!p:%{!pg:-lc}}%{p:-lc_p}%{pg:-lc_p}}"
+-
+-#undef LIB_SPEC
+-#define LIB_SPEC \
+-"%{mandroid: %(lib_android) ;" \
+-"          : %(lib_default)}"
+-
+-#undef ANDROID_STARTFILE_SPEC
+-#define ANDROID_STARTFILE_SPEC \
+-"%{!shared:" \
+-   "%{static: crtbegin_static%O%s ;" \
+-   "        : crtbegin_dynamic%O%s}}"
+-
+-/* Override STARTFILE_SPEC in unknown-elf.h. */
+-#undef STARTFILE_SPEC
+-#define STARTFILE_SPEC \
+-"%{mandroid: %(startfile_android) ;" \
+-"          : %(startfile_default)}"
+-
+-#undef ANDROID_ENDFILE_SPEC
+-#define ANDROID_ENDFILE_SPEC	"%{!shared:crtend_android%O%s}"
+-
+-/* Override ENDFILE_SPEC in unknown-elf.h. */
+-#undef ENDFILE_SPEC
+-#define ENDFILE_SPEC \
+-"%{mandroid: %(endfile_android) ;" \
+-"          : %(endfile_default)}"
+-
+Index: gcc-4.5.3/gcc/config/arm/eabi.opt
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/arm/eabi.opt
++++ /dev/null
+@@ -1,23 +0,0 @@
+-; EABI specific options for ARM port of the compiler.
+-
+-; Copyright (C) 2008 Free Software Foundation, Inc.
+-;
+-; This file is part of GCC.
+-;
+-; GCC is free software; you can redistribute it and/or modify it under
+-; the terms of the GNU General Public License as published by the Free
+-; Software Foundation; either version 3, or (at your option) any later
+-; version.
+-;
+-; GCC is distributed in the hope that it will be useful, but WITHOUT ANY
+-; WARRANTY; without even the implied warranty of MERCHANTABILITY or
+-; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+-; for more details.
+-;
+-; You should have received a copy of the GNU General Public License
+-; along with GCC; see the file COPYING3.  If not see
+-; <http://www.gnu.org/licenses/>.
+-
+-mandroid
+-Target Report RejectNegative Mask(ANDROID)
+-Generate code for the Android operating system.
+Index: gcc-4.5.3/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/arm/linux-eabi.h
++++ gcc-4.5.3/gcc/config/arm/linux-eabi.h
+@@ -70,7 +70,30 @@
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
+ #undef  LINK_SPEC
+-#define LINK_SPEC LINUX_TARGET_LINK_SPEC BE8_LINK_SPEC TARGET_FIX_V4BX_SPEC
++#define LINK_SPEC BE8_LINK_SPEC TARGET_FIX_V4BX_SPEC                   \
++  LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,                         \
++                      LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
++
++#undef  CC1_SPEC
++#define CC1_SPEC                                               \
++  LINUX_OR_ANDROID_CC (LINUX_TARGET_CC1_SPEC,                  \
++                      LINUX_TARGET_CC1_SPEC " " ANDROID_CC1_SPEC)
++
++#define CC1PLUS_SPEC \
++  LINUX_OR_ANDROID_CC ("", ANDROID_CC1PLUS_SPEC)
++
++#undef  LIB_SPEC
++#define LIB_SPEC                                               \
++  LINUX_OR_ANDROID_LD (LINUX_TARGET_LIB_SPEC,                  \
++                      LINUX_TARGET_LIB_SPEC " " ANDROID_LIB_SPEC)
++
++#undef STARTFILE_SPEC
++#define STARTFILE_SPEC \
++  LINUX_OR_ANDROID_LD (LINUX_TARGET_STARTFILE_SPEC, ANDROID_STARTFILE_SPEC)
++
++#undef ENDFILE_SPEC
++#define ENDFILE_SPEC \
++  LINUX_OR_ANDROID_LD (LINUX_TARGET_ENDFILE_SPEC, ANDROID_ENDFILE_SPEC)
+ 
+ /* Use the default LIBGCC_SPEC, not the version in linux-elf.h, as we
+    do not use -lfloat.  */
+Index: gcc-4.5.3/gcc/config/arm/t-linux-androideabi
+===================================================================
+--- /dev/null
++++ gcc-4.5.3/gcc/config/arm/t-linux-androideabi
+@@ -0,0 +1,10 @@
++MULTILIB_OPTIONS     = march=armv7-a mthumb
++MULTILIB_DIRNAMES    = armv7-a thumb
++MULTILIB_EXCEPTIONS  =
++MULTILIB_MATCHES     =
++MULTILIB_OSDIRNAMES  =
++
++# The "special" multilib can be used to build native applications for Android,
++# as opposed to native shared libraries that are then called via JNI.
++#MULTILIB_OPTIONS    += tno-android-cc
++#MULTILIB_DIRNAMES   += special
+Index: gcc-4.5.3/gcc/config/linux-android.h
+===================================================================
+--- /dev/null
++++ gcc-4.5.3/gcc/config/linux-android.h
+@@ -0,0 +1,53 @@
++/* Configuration file for Linux Android targets.
++   Copyright (C) 2010
++   Free Software Foundation, Inc.
++   Contributed by CodeSourcery, Inc.
++
++   This file is part of GCC.
++
++   GCC is free software; you can redistribute it and/or modify it
++   under the terms of the GNU General Public License as published
++   by the Free Software Foundation; either version 3, or (at your
++   option) any later version.
++
++   GCC is distributed in the hope that it will be useful, but WITHOUT
++   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
++   License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with GCC; see the file COPYING3.  If not see
++   <http://www.gnu.org/licenses/>.  */
++
++#if ANDROID_DEFAULT
++# define NOANDROID "mno-android"
++#else
++# define NOANDROID "!mandroid"
++#endif
++
++#define LINUX_OR_ANDROID_CC(LINUX_SPEC, ANDROID_SPEC) \
++  "%{" NOANDROID "|tno-android-cc:" LINUX_SPEC ";:" ANDROID_SPEC "}"
++
++#define LINUX_OR_ANDROID_LD(LINUX_SPEC, ANDROID_SPEC) \
++  "%{" NOANDROID "|tno-android-ld:" LINUX_SPEC ";:" ANDROID_SPEC "}"
++
++#define ANDROID_LINK_SPEC \
++  "%{shared: -Bsymbolic}"
++
++#define ANDROID_CC1_SPEC						\
++  "%{!mglibc:%{!muclibc:%{!mbionic: -mbionic}}} "			\
++  "%{!fno-pic:%{!fno-PIC:%{!fpic:%{!fPIC: -fPIC}}}}"
++
++#define ANDROID_CC1PLUS_SPEC						\
++  "%{!fexceptions:%{!fno-exceptions: -fno-exceptions}} "		\
++  "%{!frtti:%{!fno-rtti: -fno-rtti}}"
++
++#define ANDROID_LIB_SPEC \
++  "%{!static: -ldl}"
++
++#define ANDROID_STARTFILE_SPEC						\
++  "%{!shared:"								\
++  "  %{static: crtbegin_static%O%s;: crtbegin_dynamic%O%s}}"
++
++#define ANDROID_ENDFILE_SPEC \
++  "%{!shared: crtend_android%O%s}"
+Index: gcc-4.5.3/gcc/config/linux-android.opt
+===================================================================
+--- /dev/null
++++ gcc-4.5.3/gcc/config/linux-android.opt
+@@ -0,0 +1,23 @@
++; Android specific options.
++
++; Copyright (C) 2010 Free Software Foundation, Inc.
++;
++; This file is part of GCC.
++;
++; GCC is free software; you can redistribute it and/or modify it under
++; the terms of the GNU General Public License as published by the Free
++; Software Foundation; either version 3, or (at your option) any later
++; version.
++;
++; GCC is distributed in the hope that it will be useful, but WITHOUT ANY
++; WARRANTY; without even the implied warranty of MERCHANTABILITY or
++; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++; for more details.
++;
++; You should have received a copy of the GNU General Public License
++; along with GCC; see the file COPYING3.  If not see
++; <http://www.gnu.org/licenses/>.
++
++mandroid
++Target Report Mask(ANDROID) Var(flag_android) Init(ANDROID_DEFAULT ? OPTION_MASK_ANDROID : 0)
++Generate code for the Android platform.
+Index: gcc-4.5.3/gcc/config/linux.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/linux.h
++++ gcc-4.5.3/gcc/config/linux.h
+@@ -1,6 +1,6 @@
+ /* Definitions for Linux-based GNU systems with ELF format
+    Copyright (C) 1995, 1996, 1997, 1998, 1999, 2000, 2003, 2004, 2005, 2006,
+-   2007, 2009 Free Software Foundation, Inc.
++   2007, 2009, 2010 Free Software Foundation, Inc.
+    Contributed by Eric Youngdale.
+    Modified for stabs-in-ELF by H.J. Lu (hjl@lucon.org).
+ 
+@@ -42,16 +42,17 @@ see the files COPYING3 and COPYING.RUNTI
+    provides part of the support for getting C++ file-scope static
+    object constructed before entering `main'.  */
+    
+-#undef	STARTFILE_SPEC
+ #if defined HAVE_LD_PIE
+-#define STARTFILE_SPEC \
++#define LINUX_TARGET_STARTFILE_SPEC \
+   "%{!shared: %{pg|p|profile:gcrt1.o%s;pie:Scrt1.o%s;:crt1.o%s}} \
+    crti.o%s %{static:crtbeginT.o%s;shared|pie:crtbeginS.o%s;:crtbegin.o%s}"
+ #else
+-#define STARTFILE_SPEC \
++#define LINUX_TARGET_STARTFILE_SPEC \
+   "%{!shared: %{pg|p|profile:gcrt1.o%s;:crt1.o%s}} \
+    crti.o%s %{static:crtbeginT.o%s;shared|pie:crtbeginS.o%s;:crtbegin.o%s}"
+ #endif
++#undef  STARTFILE_SPEC
++#define STARTFILE_SPEC LINUX_TARGET_STARTFILE_SPEC
+ 
+ /* Provide a ENDFILE_SPEC appropriate for GNU/Linux.  Here we tack on
+    the GNU/Linux magical crtend.o file (see crtstuff.c) which
+@@ -59,33 +60,44 @@ see the files COPYING3 and COPYING.RUNTI
+    object constructed before entering `main', followed by a normal
+    GNU/Linux "finalizer" file, `crtn.o'.  */
+ 
+-#undef	ENDFILE_SPEC
+-#define ENDFILE_SPEC \
++#define LINUX_TARGET_ENDFILE_SPEC \
+   "%{shared|pie:crtendS.o%s;:crtend.o%s} crtn.o%s"
++#undef  ENDFILE_SPEC
++#define ENDFILE_SPEC LINUX_TARGET_ENDFILE_SPEC
+ 
+ /* This is for -profile to use -lc_p instead of -lc.  */
++#define LINUX_TARGET_CC1_SPEC "%{profile:-p}"
+ #ifndef CC1_SPEC
+-#define CC1_SPEC "%{profile:-p}"
++#define CC1_SPEC LINUX_TARGET_CC1_SPEC
+ #endif
+ 
+ /* The GNU C++ standard library requires that these macros be defined.  */
+ #undef CPLUSPLUS_CPP_SPEC
+ #define CPLUSPLUS_CPP_SPEC "-D_GNU_SOURCE %(cpp)"
+ 
+-#undef	LIB_SPEC
+-#define LIB_SPEC \
++#define LINUX_TARGET_LIB_SPEC \
+   "%{pthread:-lpthread} \
+    %{shared:-lc} \
+    %{!shared:%{mieee-fp:-lieee} %{profile:-lc_p}%{!profile:-lc}}"
++#undef  LIB_SPEC
++#define LIB_SPEC LINUX_TARGET_LIB_SPEC
++
++/* C libraries supported on Linux.  */
++#define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
++#define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
++#define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
+ 
+ #define LINUX_TARGET_OS_CPP_BUILTINS()				\
+     do {							\
+-	builtin_define ("__gnu_linux__");			\
++	if (OPTION_GLIBC)					\
++	  builtin_define ("__gnu_linux__");			\
+ 	builtin_define_std ("linux");				\
+ 	builtin_define_std ("unix");				\
+ 	builtin_assert ("system=linux");			\
+ 	builtin_assert ("system=unix");				\
+ 	builtin_assert ("system=posix");			\
++	if (OPTION_ANDROID)					\
++	  builtin_define ("__ANDROID__");			\
+     } while (0)
+ 
+ #if defined(HAVE_LD_EH_FRAME_HDR)
+@@ -105,13 +117,24 @@ see the files COPYING3 and COPYING.RUNTI
+ #endif
+ 
+ /* Determine which dynamic linker to use depending on whether GLIBC or
+-   uClibc is the default C library and whether -muclibc or -mglibc has
+-   been passed to change the default.  */
+-#if UCLIBC_DEFAULT
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:%{muclibc:%e-mglibc and -muclibc used together}" G ";:" U "}"
++   uClibc or Bionic is the default C library and whether
++   -muclibc or -mglibc or -mbionic has been passed to change the default.  */
++
++#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LD1, LD2, LD3)	\
++  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:" LD1 "}}"
++
++#if DEFAULT_LIBC == LIBC_GLIBC
++#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
++  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", G, U, B)
++#elif DEFAULT_LIBC == LIBC_UCLIBC
++#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
++  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", U, G, B)
++#elif DEFAULT_LIBC == LIBC_BIONIC
++#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
++  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", B, G, U)
+ #else
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:%{mglibc:%e-mglibc and -muclibc used together}" U ";:" G "}"
+-#endif
++#error "Unsupported DEFAULT_LIBC"
++#endif /* DEFAULT_LIBC */
+ 
+ /* For most targets the following definitions suffice;
+    GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
+@@ -120,18 +143,25 @@ see the files COPYING3 and COPYING.RUNTI
+ #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
+ #define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
+ #define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
+-#define LINUX_DYNAMIC_LINKER \
+-  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
+-#define LINUX_DYNAMIC_LINKER32 \
+-  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32)
+-#define LINUX_DYNAMIC_LINKER64 \
+-  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64)
++#define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
++#define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
++#define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
++
++#define LINUX_DYNAMIC_LINKER						\
++  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER,	\
++			 BIONIC_DYNAMIC_LINKER)
++#define LINUX_DYNAMIC_LINKER32						\
++  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32, \
++			 BIONIC_DYNAMIC_LINKER32)
++#define LINUX_DYNAMIC_LINKER64						\
++  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64, \
++			 BIONIC_DYNAMIC_LINKER64)
+ 
+ /* Determine whether the entire c99 runtime
+    is present in the runtime library.  */
+ #define TARGET_C99_FUNCTIONS (OPTION_GLIBC)
+ 
+ /* Whether we have sincos that follows the GNU extension.  */
+-#define TARGET_HAS_SINCOS (OPTION_GLIBC)
++#define TARGET_HAS_SINCOS (OPTION_GLIBC | OPTION_BIONIC)
+ 
+ #define TARGET_POSIX_IO
+Index: gcc-4.5.3/gcc/config/linux.opt
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/linux.opt
++++ gcc-4.5.3/gcc/config/linux.opt
+@@ -1,6 +1,6 @@
+ ; Processor-independent options for GNU/Linux.
+ ;
+-; Copyright (C) 2006, 2007, 2009 Free Software Foundation, Inc.
++; Copyright (C) 2006, 2007, 2009, 2010 Free Software Foundation, Inc.
+ ; Contributed by CodeSourcery.
+ ;
+ ; This file is part of GCC.
+@@ -19,10 +19,14 @@
+ ; along with GCC; see the file COPYING3.  If not see
+ ; <http://www.gnu.org/licenses/>.
+ 
++mbionic
++Target Report RejectNegative Var(linux_libc,LIBC_BIONIC) Init(DEFAULT_LIBC) Negative(mglibc)
++Use Bionic C library
++
+ mglibc
+-Target RejectNegative Report InverseMask(UCLIBC, GLIBC) Var(linux_uclibc) Init(UCLIBC_DEFAULT ? OPTION_MASK_UCLIBC : 0)
+-Use GNU libc instead of uClibc
++Target Report RejectNegative Var(linux_libc,LIBC_GLIBC) VarExists Negative(muclibc)
++Use GNU C library
+ 
+ muclibc
+-Target RejectNegative Report Mask(UCLIBC) Var(linux_uclibc) VarExists
+-Use uClibc instead of GNU libc
++Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) VarExists Negative(mbionic)
++Use uClibc C library
+Index: gcc-4.5.3/gcc/config/rs6000/linux64.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/rs6000/linux64.h
++++ gcc-4.5.3/gcc/config/rs6000/linux64.h
+@@ -344,10 +344,12 @@ extern int dot_symbols;
+ #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld64.so.1"
+ #define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
+ #define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
+-#if UCLIBC_DEFAULT
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:%{muclibc:%e-mglibc and -muclibc used together}" G ";:" U "}"
++#if DEFAULT_LIBC == LIBC_UCLIBC
++#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
++#elif DEFAULT_LIBC == LIBC_GLIBC
++#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
+ #else
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:%{mglibc:%e-mglibc and -muclibc used together}" U ";:" G "}"
++#error "Unsupported DEFAULT_LIBC"
+ #endif
+ #define LINUX_DYNAMIC_LINKER32 \
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32)
+Index: gcc-4.5.3/gcc/config/rs6000/sysv4.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/config/rs6000/sysv4.h
++++ gcc-4.5.3/gcc/config/rs6000/sysv4.h
+@@ -901,10 +901,12 @@ SVR4_ASM_SPEC \
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
+ #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
+-#if UCLIBC_DEFAULT
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:%{muclibc:%e-mglibc and -muclibc used together}" G ";:" U "}"
++#if DEFAULT_LIBC == LIBC_UCLIBC
++#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
++#elif DEFAULT_LIBC == LIBC_GLIBC
++#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
+ #else
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:%{mglibc:%e-mglibc and -muclibc used together}" U ";:" G "}"
++#error "Unsupported DEFAULT_LIBC"
+ #endif
+ #define LINUX_DYNAMIC_LINKER \
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
+Index: gcc-4.5.3/gcc/doc/invoke.texi
+===================================================================
+--- gcc-4.5.3.orig/gcc/doc/invoke.texi
++++ gcc-4.5.3/gcc/doc/invoke.texi
+@@ -565,7 +565,8 @@ Objective-C and Objective-C++ Dialects}.
+ -mcpu=@var{cpu}}
+ 
+ @emph{GNU/Linux Options}
+-@gccoptlist{-muclibc}
++@gccoptlist{-mglibc -muclibc -mbionic -mandroid @gol
++-tno-android-cc -tno-android-ld}
+ 
+ @emph{H8/300 Options}
+ @gccoptlist{-mrelax  -mh  -ms  -mn  -mint32  -malign-300}
+@@ -11469,13 +11470,41 @@ These @samp{-m} options are defined for
+ @table @gcctabopt
+ @item -mglibc
+ @opindex mglibc
+-Use the GNU C library instead of uClibc.  This is the default except
+-on @samp{*-*-linux-*uclibc*} targets.
++Use the GNU C library.  This is the default except
++on @samp{*-*-linux-*uclibc*} and @samp{*-*-linux-*android*} targets.
+ 
+ @item -muclibc
+ @opindex muclibc
+-Use uClibc instead of the GNU C library.  This is the default on
++Use uClibc C library.  This is the default on
+ @samp{*-*-linux-*uclibc*} targets.
++
++@item -mbionic
++@opindex mbionic
++Use Bionic C library.  This is the default on
++@samp{*-*-linux-*android*} targets.
++
++@item -mandroid
++@opindex mandroid
++Compile code compatible with Android platform.  This is the default on
++@samp{*-*-linux-*android*} targets.
++
++When compiling, this option enables @option{-mbionic}, @option{-fPIC},
++@option{-fno-exceptions} and @option{-fno-rtti} by default.  When linking,
++this option makes the GCC driver pass Android-specific options to the linker.
++Finally, this option causes the preprocessor macro @code{__ANDROID__}
++to be defined.
++
++@item -tno-android-cc
++@opindex tno-android-cc
++Disable compilation effects of @option{-mandroid}, i.e., do not enable
++@option{-mbionic}, @option{-fPIC}, @option{-fno-exceptions} and
++@option{-fno-rtti} by default.
++
++@item -tno-android-ld
++@opindex tno-android-ld
++Disable linking effects of @option{-mandroid}, i.e., pass standard Linux
++linking options to the linker.
++
+ @end table
+ 
+ @node H8/300 Options
+Index: gcc-4.5.3/gcc/gthr-posix.h
+===================================================================
+--- gcc-4.5.3.orig/gcc/gthr-posix.h
++++ gcc-4.5.3/gcc/gthr-posix.h
+@@ -124,7 +124,9 @@ __gthrw(pthread_join)
+ __gthrw(pthread_equal)
+ __gthrw(pthread_self)
+ __gthrw(pthread_detach)
++#ifndef __BIONIC__
+ __gthrw(pthread_cancel)
++#endif
+ __gthrw(sched_yield)
+ 
+ __gthrw(pthread_mutex_lock)
+@@ -238,7 +240,15 @@ static inline int
+ __gthread_active_p (void)
+ {
+   static void *const __gthread_active_ptr
+-    = __extension__ (void *) &__gthrw_(pthread_cancel);
++    = __extension__ (void *) &__gthrw_(
++/* Android's C library does not provide pthread_cancel, check for
++   `pthread_create' instead.  */
++#ifndef __BIONIC__
++				       pthread_cancel
++#else
++				       pthread_create
++#endif
++				       );
+   return __gthread_active_ptr != 0;
+ }
+ 
+Index: gcc-4.5.3/gcc/testsuite/gcc.dg/glibc-uclibc-1.c
+===================================================================
+--- gcc-4.5.3.orig/gcc/testsuite/gcc.dg/glibc-uclibc-1.c
++++ /dev/null
+@@ -1,6 +0,0 @@
+-/* Test -mglibc and -muclibc not allowed together.  */
+-/* Origin: Joseph Myers <joseph@codesourcery.com> */
+-/* { dg-do link { target *-*-linux* } } */
+-/* { dg-options "-mglibc -muclibc" } */
+-
+-/* { dg-message "-mglibc and -muclibc used together" "" { target *-*-* } 0 } */
+Index: gcc-4.5.3/gcc/testsuite/gcc.dg/glibc-uclibc-2.c
+===================================================================
+--- gcc-4.5.3.orig/gcc/testsuite/gcc.dg/glibc-uclibc-2.c
++++ /dev/null
+@@ -1,6 +0,0 @@
+-/* Test -mglibc and -muclibc not allowed together.  */
+-/* Origin: Joseph Myers <joseph@codesourcery.com> */
+-/* { dg-do link { target *-*-linux* } } */
+-/* { dg-options "-muclibc -mglibc" } */
+-
+-/* { dg-message "-mglibc and -muclibc used together" "" { target *-*-* } 0 } */
+Index: gcc-4.5.3/libstdc++-v3/acinclude.m4
+===================================================================
+--- gcc-4.5.3.orig/libstdc++-v3/acinclude.m4
++++ gcc-4.5.3/libstdc++-v3/acinclude.m4
+@@ -95,7 +95,7 @@ AC_DEFUN([GLIBCXX_CONFIGURE], [
+   ## (Right now, this only matters for enable_wchar_t, but nothing prevents
+   ## other macros from doing the same.  This should be automated.)  -pme
+ 
+-  # Check for uClibc since Linux platforms use different configuration
++  # Check for C library flavor since Linux platforms use different configuration
+   # directories depending on the C library in use.
+   AC_EGREP_CPP([_using_uclibc], [
+   #include <stdio.h>
+@@ -104,6 +104,13 @@ AC_DEFUN([GLIBCXX_CONFIGURE], [
+   #endif
+   ], uclibc=yes, uclibc=no)
+ 
++  AC_EGREP_CPP([_using_bionic], [
++  #include <stdio.h>
++  #if __BIONIC__
++    _using_bionic
++  #endif
++  ], bionic=yes, bionic=no)
++
+   # Find platform-specific directories containing configuration info.
+   # Also possibly modify flags used elsewhere, as needed by the platform.
+   GLIBCXX_CHECK_HOST
+@@ -2722,7 +2729,7 @@ void foo()
+ }
+ EOF
+     old_CXXFLAGS="$CXXFLAGS"
+-    CXXFLAGS=-S
++    CXXFLAGS="-S -fexceptions"
+     if AC_TRY_EVAL(ac_compile); then
+       if grep _Unwind_SjLj_Resume conftest.s >/dev/null 2>&1 ; then
+         enable_sjlj_exceptions=yes
+Index: gcc-4.5.3/libstdc++-v3/config/os/bionic/ctype_base.h
+===================================================================
+--- /dev/null
++++ gcc-4.5.3/libstdc++-v3/config/os/bionic/ctype_base.h
+@@ -0,0 +1,57 @@
++// Locale support -*- C++ -*-
++
++// Copyright (C) 2010 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 3, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// Under Section 7 of GPL version 3, you are granted additional
++// permissions described in the GCC Runtime Library Exception, version
++// 3.1, as published by the Free Software Foundation.
++
++// You should have received a copy of the GNU General Public License and
++// a copy of the GCC Runtime Library Exception along with this program;
++// see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
++// <http://www.gnu.org/licenses/>.
++
++//
++// ISO C++ 14882: 22.1  Locales
++//
++
++// Information as gleaned from /usr/include/ctype.h, for solaris2.5.1
++
++// Support for Solaris 2.5.1
++
++_GLIBCXX_BEGIN_NAMESPACE(std)
++
++  /// @brief  Base class for ctype.
++  struct ctype_base
++  {
++    // Non-standard typedefs.
++    typedef const int* 		__to_type;
++
++    // NB: Offsets into ctype<char>::_M_table force a particular size
++    // on the mask type. Because of this, we don't use an enum.
++    typedef char 		mask;
++    static const mask upper    	= _U;
++    static const mask lower 	= _L;
++    static const mask alpha 	= _U | _L;
++    static const mask digit 	= _N;
++    static const mask xdigit 	= _X | _N;
++    static const mask space 	= _S;
++    static const mask print 	= _P | _U | _L | _N | _B;
++    static const mask graph 	= _P | _U | _L | _N;
++    static const mask cntrl 	= _C;
++    static const mask punct 	= _P;
++    static const mask alnum 	= _U | _L | _N;
++  };
++
++_GLIBCXX_END_NAMESPACE
+Index: gcc-4.5.3/libstdc++-v3/config/os/bionic/ctype_inline.h
+===================================================================
+--- /dev/null
++++ gcc-4.5.3/libstdc++-v3/config/os/bionic/ctype_inline.h
+@@ -0,0 +1,71 @@
++// Locale support -*- C++ -*-
++
++// Copyright (C) 2010 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 3, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// Under Section 7 of GPL version 3, you are granted additional
++// permissions described in the GCC Runtime Library Exception, version
++// 3.1, as published by the Free Software Foundation.
++
++// You should have received a copy of the GNU General Public License and
++// a copy of the GCC Runtime Library Exception along with this program;
++// see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
++// <http://www.gnu.org/licenses/>.
++
++/** @file ctype_inline.h
++ *  This is an internal header file, included by other library headers.
++ *  You should not attempt to use it directly.
++ */
++
++//
++// ISO C++ 14882: 22.1  Locales
++//
++
++// ctype bits to be inlined go here. Non-inlinable (ie virtual do_*)
++// functions go in ctype.cc
++
++_GLIBCXX_BEGIN_NAMESPACE(std)
++
++  bool
++  ctype<char>::
++  is(mask __m, char __c) const
++  { return _M_table[static_cast<unsigned char>(__c)] & __m; }
++
++  const char*
++  ctype<char>::
++  is(const char* __low, const char* __high, mask* __vec) const
++  {
++    while (__low < __high)
++      *__vec++ = _M_table[static_cast<unsigned char>(*__low++)];
++    return __high;
++  }
++
++  const char*
++  ctype<char>::
++  scan_is(mask __m, const char* __low, const char* __high) const
++  {
++    while (__low < __high && !this->is(__m, *__low))
++      ++__low;
++    return __low;
++  }
++
++  const char*
++  ctype<char>::
++  scan_not(mask __m, const char* __low, const char* __high) const
++  {
++    while (__low < __high && this->is(__m, *__low) != 0)
++      ++__low;
++    return __low;
++  }
++
++_GLIBCXX_END_NAMESPACE
+Index: gcc-4.5.3/libstdc++-v3/config/os/bionic/ctype_noninline.h
+===================================================================
+--- /dev/null
++++ gcc-4.5.3/libstdc++-v3/config/os/bionic/ctype_noninline.h
+@@ -0,0 +1,98 @@
++// Locale support -*- C++ -*-
++
++// Copyright (C) 2010 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 3, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// Under Section 7 of GPL version 3, you are granted additional
++// permissions described in the GCC Runtime Library Exception, version
++// 3.1, as published by the Free Software Foundation.
++
++// You should have received a copy of the GNU General Public License and
++// a copy of the GCC Runtime Library Exception along with this program;
++// see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
++// <http://www.gnu.org/licenses/>.
++
++/** @file ctype_noninline.h
++ *  This is an internal header file, included by other library headers.
++ *  You should not attempt to use it directly.
++ */
++
++//
++// ISO C++ 14882: 22.1  Locales
++//
++
++// Information as gleaned from /usr/include/ctype.h
++
++  const ctype_base::mask*
++  ctype<char>::classic_table() throw()
++  { return _ctype_ + 1; }
++
++  ctype<char>::ctype(__c_locale, const mask* __table, bool __del,
++		     size_t __refs)
++  : facet(__refs), _M_del(__table != 0 && __del),
++  _M_toupper(NULL), _M_tolower(NULL),
++  _M_table(__table ? __table : classic_table())
++  {
++    memset(_M_widen, 0, sizeof(_M_widen));
++    _M_widen_ok = 0;
++    memset(_M_narrow, 0, sizeof(_M_narrow));
++    _M_narrow_ok = 0;
++  }
++
++  ctype<char>::ctype(const mask* __table, bool __del, size_t __refs)
++  : facet(__refs), _M_del(__table != 0 && __del),
++  _M_toupper(NULL), _M_tolower(NULL),
++  _M_table(__table ? __table : classic_table())
++  {
++    memset(_M_widen, 0, sizeof(_M_widen));
++    _M_widen_ok = 0;
++    memset(_M_narrow, 0, sizeof(_M_narrow));
++    _M_narrow_ok = 0;
++  }
++
++  char
++  ctype<char>::do_toupper(char __c) const
++  {
++    int __x = __c;
++    return (this->is(ctype_base::lower, __c) ? (__x - 'a' + 'A') : __x);
++  }
++
++  const char*
++  ctype<char>::do_toupper(char* __low, const char* __high) const
++  {
++    while (__low < __high)
++      {
++	*__low = this->do_toupper(*__low);
++	++__low;
++      }
++    return __high;
++  }
++
++  char
++  ctype<char>::do_tolower(char __c) const
++  {
++    int __x = __c;
++    return (this->is(ctype_base::upper, __c) ? (__x - 'A' + 'a') : __x);
++  }
++
++  const char*
++  ctype<char>::do_tolower(char* __low, const char* __high) const
++  {
++    while (__low < __high)
++      {
++	*__low = this->do_tolower(*__low);
++	++__low;
++      }
++    return __high;
++  }
++
+Index: gcc-4.5.3/libstdc++-v3/config/os/bionic/os_defines.h
+===================================================================
+--- /dev/null
++++ gcc-4.5.3/libstdc++-v3/config/os/bionic/os_defines.h
+@@ -0,0 +1,36 @@
++// Specific definitions for Bionic  -*- C++ -*-
++
++// Copyright (C) 2010 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 3, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// Under Section 7 of GPL version 3, you are granted additional
++// permissions described in the GCC Runtime Library Exception, version
++// 3.1, as published by the Free Software Foundation.
++
++// You should have received a copy of the GNU General Public License and
++// a copy of the GCC Runtime Library Exception along with this program;
++// see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
++// <http://www.gnu.org/licenses/>.
++
++/** @file os_defines.h
++ *  This is an internal header file, included by other library headers.
++ *  You should not attempt to use it directly.
++ */
++
++#ifndef _GLIBCXX_OS_DEFINES
++#define _GLIBCXX_OS_DEFINES 1
++
++// System-specific #define, typedefs, corrections, etc, go here.  This
++// file will come before all others.
++
++#endif
+Index: gcc-4.5.3/libstdc++-v3/configure
+===================================================================
+--- gcc-4.5.3.orig/libstdc++-v3/configure
++++ gcc-4.5.3/libstdc++-v3/configure
+@@ -5185,7 +5185,7 @@ fi
+   ## (Right now, this only matters for enable_wchar_t, but nothing prevents
+   ## other macros from doing the same.  This should be automated.)  -pme
+ 
+-  # Check for uClibc since Linux platforms use different configuration
++  # Check for C library flavor since Linux platforms use different configuration
+   # directories depending on the C library in use.
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+@@ -5205,6 +5205,24 @@ fi
+ rm -f conftest*
+ 
+ 
++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++  #include <stdio.h>
++  #if __BIONIC__
++    _using_bionic
++  #endif
++
++_ACEOF
++if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
++  $EGREP "_using_bionic" >/dev/null 2>&1; then :
++  bionic=yes
++else
++  bionic=no
++fi
++rm -f conftest*
++
++
+   # Find platform-specific directories containing configuration info.
+   # Also possibly modify flags used elsewhere, as needed by the platform.
+ 
+@@ -14897,7 +14915,7 @@ void foo()
+ }
+ EOF
+     old_CXXFLAGS="$CXXFLAGS"
+-    CXXFLAGS=-S
++    CXXFLAGS="-S -fexceptions"
+     if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+   (eval $ac_compile) 2>&5
+   ac_status=$?
+Index: gcc-4.5.3/libstdc++-v3/configure.host
+===================================================================
+--- gcc-4.5.3.orig/libstdc++-v3/configure.host
++++ gcc-4.5.3/libstdc++-v3/configure.host
+@@ -238,6 +238,8 @@ case "${host_os}" in
+   gnu* | linux* | kfreebsd*-gnu | knetbsd*-gnu)
+     if [ "$uclibc" = "yes" ]; then
+       os_include_dir="os/uclibc"
++    elif [ "$bionic" = "yes" ]; then
++      os_include_dir="os/bionic"
+     else
+       os_include_dir="os/gnu-linux"
+     fi
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch
new file mode 100644
index 0000000..bb866ce
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99495.patch
@@ -0,0 +1,784 @@
+2011-03-24  Revital Eres  <revital.eres@linaro.org>
+
+	gcc/
+	* loop-doloop.c (doloop_condition_get): Support new form of
+	doloop pattern and use prev_nondebug_insn instead of PREV_INSN.
+	* config/arm/thumb2.md (*thumb2_addsi3_compare0): Remove "*".
+	(doloop_end): New.
+	* config/arm/arm.md (*addsi3_compare0): Remove "*".
+	* ddg.c (check_closing_branch_deps, get_node_of_insn_uid):
+	New functions.
+	(create_ddg): Pass sbitmap containing do-loop related
+	instructions instead of closing_branch_deps parameter and call
+	check_closing_branch_deps function.
+	* ddg.h (create_ddg): Adjust the function declaration.
+	* modulo-sched.c (PS_STAGE_COUNT): Rename to CALC_STAGE_COUNT
+	and redefine.
+	(doloop_register_get): Handle NONDEBUG_INSN_P.
+	(stage_count): New field in struct partial_schedule.
+	(mark_doloop_insns, calculate_stage_count): New functions.
+	(normalize_sched_times): Rename to reset_sched_times and handle
+	incrementing the sched time of the nodes by a constant value
+	passed as parameter.
+	(duplicate_insns_of_cycles): Skip closing branch.
+	(sms_schedule_by_order): Schedule closing branch when
+	closing_branch_deps is true.
+	(ps_insn_find_column): Handle closing branch.
+	(sms_schedule): Call reset_sched_times and handle case where
+	do-loop pattern is not decoupled from the other loop instructions.
+	Support new form of doloop pattern.
+	(ps_insert_empty_row): Update calls to normalize_sched_times
+	and rotate_partial_schedule functions.
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-03-11 14:26:34 +0000
++++ new/gcc/config/arm/arm.md	2011-03-24 07:45:38 +0000
+@@ -734,7 +734,7 @@
+   ""
+ )
+ 
+-(define_insn "*addsi3_compare0"
++(define_insn "addsi3_compare0"
+   [(set (reg:CC_NOOV CC_REGNUM)
+ 	(compare:CC_NOOV
+ 	 (plus:SI (match_operand:SI 1 "s_register_operand" "r, r")
+
+=== modified file 'gcc/config/arm/thumb2.md'
+--- old/gcc/config/arm/thumb2.md	2011-02-08 10:51:58 +0000
++++ new/gcc/config/arm/thumb2.md	2011-03-24 07:45:38 +0000
+@@ -1194,7 +1194,7 @@
+    (set_attr "length" "2")]
+ )
+ 
+-(define_insn "*thumb2_addsi3_compare0"
++(define_insn "thumb2_addsi3_compare0"
+   [(set (reg:CC_NOOV CC_REGNUM)
+ 	(compare:CC_NOOV
+ 	  (plus:SI (match_operand:SI 1 "s_register_operand" "l,  0, r")
+@@ -1445,3 +1445,56 @@
+   [(set_attr "length" "4,4,16")
+    (set_attr "predicable" "yes")]
+ )
++
++
++;; Define the subtract-one-and-jump insns so loop.c
++;; knows what to generate.
++(define_expand "doloop_end"
++  [(use (match_operand 0 "" ""))      ; loop pseudo
++   (use (match_operand 1 "" ""))      ; iterations; zero if unknown
++   (use (match_operand 2 "" ""))      ; max iterations
++   (use (match_operand 3 "" ""))      ; loop level
++   (use (match_operand 4 "" ""))]     ; label
++  "TARGET_32BIT"
++  "
++ {
++   /* Currently SMS relies on the do-loop pattern to recognize loops
++      where (1) the control part consists of all insns defining and/or
++      using a certain 'count' register and (2) the loop count can be
++      adjusted by modifying this register prior to the loop.
++     ??? The possible introduction of a new block to initialize the
++      new IV can potentially affect branch optimizations.  */
++   if (optimize > 0 && flag_modulo_sched)
++   {
++     rtx s0;
++     rtx bcomp;
++     rtx loc_ref;
++     rtx cc_reg;
++     rtx insn;
++     rtx cmp;
++
++     /* Only use this on innermost loops.  */
++     if (INTVAL (operands[3]) > 1)
++       FAIL;
++
++     if (GET_MODE (operands[0]) != SImode)
++       FAIL;
++
++     s0 = operands [0];
++     if (TARGET_THUMB2)
++       insn = emit_insn (gen_thumb2_addsi3_compare0 (s0, s0, GEN_INT (-1)));
++     else
++       insn = emit_insn (gen_addsi3_compare0 (s0, s0, GEN_INT (-1)));
++
++     cmp = XVECEXP (PATTERN (insn), 0, 0);
++     cc_reg = SET_DEST (cmp);
++     bcomp = gen_rtx_NE (VOIDmode, cc_reg, const0_rtx);
++     loc_ref = gen_rtx_LABEL_REF (VOIDmode, operands [4]);
++     emit_jump_insn (gen_rtx_SET (VOIDmode, pc_rtx,
++                                  gen_rtx_IF_THEN_ELSE (VOIDmode, bcomp,
++                                                        loc_ref, pc_rtx)));
++     DONE;
++   }else
++      FAIL;
++ }")
++
+
+=== modified file 'gcc/ddg.c'
+--- old/gcc/ddg.c	2010-07-19 08:58:53 +0000
++++ new/gcc/ddg.c	2011-03-24 07:45:38 +0000
+@@ -60,6 +60,8 @@
+ static ddg_edge_ptr create_ddg_edge (ddg_node_ptr, ddg_node_ptr, dep_type,
+ 				     dep_data_type, int, int);
+ static void add_edge_to_ddg (ddg_ptr g, ddg_edge_ptr);
++static ddg_node_ptr get_node_of_insn_uid (ddg_ptr, int);
++
+ 
+ /* Auxiliary variable for mem_read_insn_p/mem_write_insn_p.  */
+ static bool mem_ref_p;
+@@ -450,12 +452,65 @@
+   sched_free_deps (head, tail, false);
+ }
+ 
++/* Given DOLOOP_INSNS which holds the instructions that
++   belong to the do-loop part; mark closing_branch_deps field in ddg G
++   as TRUE if the do-loop part's instructions are dependent on the other
++   loop instructions.  Otherwise mark it as FALSE.  */
++static void
++check_closing_branch_deps (ddg_ptr g, sbitmap doloop_insns)
++{
++  sbitmap_iterator sbi;
++  unsigned int u = 0;
++
++  EXECUTE_IF_SET_IN_SBITMAP (doloop_insns, 0, u, sbi)
++  {
++    ddg_edge_ptr e;
++    ddg_node_ptr u_node = get_node_of_insn_uid (g, u);
++
++    gcc_assert (u_node);
++
++    for (e = u_node->in; e != 0; e = e->next_in)
++      {
++	ddg_node_ptr v_node = e->src;
++
++	if (((unsigned int) INSN_UID (v_node->insn) == u)
++	    || DEBUG_INSN_P (v_node->insn))
++	  continue;
++	
++	/* Ignore dependencies between memory writes and the
++	   jump.  */
++	if (JUMP_P (u_node->insn)
++	    && e->type == OUTPUT_DEP 
++            && mem_write_insn_p (v_node->insn))
++	  continue;
++	if (!TEST_BIT (doloop_insns, INSN_UID (v_node->insn)))
++	  {
++	    g->closing_branch_deps = 1;
++	    return;
++	  }
++      }
++    for (e = u_node->out; e != 0; e = e->next_out)
++      {
++	ddg_node_ptr v_node = e->dest;
++
++	if (((unsigned int) INSN_UID (v_node->insn) == u)
++            || DEBUG_INSN_P (v_node->insn))
++	  continue;
++	if (!TEST_BIT (doloop_insns, INSN_UID (v_node->insn)))
++	  {
++	    g->closing_branch_deps = 1;
++	    return;
++	  }
++      }
++  }
++  g->closing_branch_deps = 0;
++}
+ 
+ /* Given a basic block, create its DDG and return a pointer to a variable
+    of ddg type that represents it.
+    Initialize the ddg structure fields to the appropriate values.  */
+ ddg_ptr
+-create_ddg (basic_block bb, int closing_branch_deps)
++create_ddg (basic_block bb, sbitmap doloop_insns)
+ {
+   ddg_ptr g;
+   rtx insn, first_note;
+@@ -465,7 +520,6 @@
+   g = (ddg_ptr) xcalloc (1, sizeof (struct ddg));
+ 
+   g->bb = bb;
+-  g->closing_branch_deps = closing_branch_deps;
+ 
+   /* Count the number of insns in the BB.  */
+   for (insn = BB_HEAD (bb); insn != NEXT_INSN (BB_END (bb));
+@@ -538,6 +592,11 @@
+   /* Build the data dependency graph.  */
+   build_intra_loop_deps (g);
+   build_inter_loop_deps (g);
++
++  /* Check whether the do-loop part is decoupled from the other loop
++     instructions.  */
++  check_closing_branch_deps (g, doloop_insns);
++
+   return g;
+ }
+ 
+@@ -831,6 +890,18 @@
+   return NULL;
+ }
+ 
++/* Given the uid of an instruction UID return the node that represents it.  */
++static ddg_node_ptr
++get_node_of_insn_uid (ddg_ptr g, int uid)
++{
++  int i;
++
++  for (i = 0; i < g->num_nodes; i++)
++    if (uid == INSN_UID (g->nodes[i].insn))
++      return &g->nodes[i];
++  return NULL;
++}
++
+ /* Given a set OPS of nodes in the DDG, find the set of their successors
+    which are not in OPS, and set their bits in SUCC.  Bits corresponding to
+    OPS are cleared from SUCC.  Leaves the other bits in SUCC unchanged.  */
+
+=== modified file 'gcc/ddg.h'
+--- old/gcc/ddg.h	2009-11-25 10:55:54 +0000
++++ new/gcc/ddg.h	2011-03-24 07:45:38 +0000
+@@ -167,7 +167,7 @@
+ };
+ 
+ 
+-ddg_ptr create_ddg (basic_block, int closing_branch_deps);
++ddg_ptr create_ddg (basic_block, sbitmap);
+ void free_ddg (ddg_ptr);
+ 
+ void print_ddg (FILE *, ddg_ptr);
+
+=== modified file 'gcc/loop-doloop.c'
+--- old/gcc/loop-doloop.c	2010-07-19 08:58:53 +0000
++++ new/gcc/loop-doloop.c	2011-03-24 07:45:38 +0000
+@@ -78,6 +78,8 @@
+   rtx inc_src;
+   rtx condition;
+   rtx pattern;
++  rtx cc_reg = NULL_RTX;
++  rtx reg_orig = NULL_RTX;
+ 
+   /* The canonical doloop pattern we expect has one of the following
+      forms:
+@@ -96,7 +98,16 @@
+      2)  (set (reg) (plus (reg) (const_int -1))
+          (set (pc) (if_then_else (reg != 0)
+ 	                         (label_ref (label))
+-			         (pc))).  */
++			         (pc))).  
++
++     Some targets (ARM) do the comparison before the branch, as in the
++     following form:
++
++     3) (parallel [(set (cc) (compare ((plus (reg) (const_int -1), 0)))
++                   (set (reg) (plus (reg) (const_int -1)))])
++        (set (pc) (if_then_else (cc == NE)
++                                (label_ref (label))
++                                (pc))) */
+ 
+   pattern = PATTERN (doloop_pat);
+ 
+@@ -104,19 +115,47 @@
+     {
+       rtx cond;
+       rtx prev_insn = prev_nondebug_insn (doloop_pat);
++      rtx cmp_arg1, cmp_arg2;
++      rtx cmp_orig;
+ 
+-      /* We expect the decrement to immediately precede the branch.  */
++      /* In case the pattern is not PARALLEL we expect two forms
++	 of doloop which are cases 2) and 3) above: in case 2) the
++	 decrement immediately precedes the branch, while in case 3)
++	 the compare and decrement instructions immediately precede
++	 the branch.  */
+ 
+       if (prev_insn == NULL_RTX || !INSN_P (prev_insn))
+         return 0;
+ 
+       cmp = pattern;
+-      inc = PATTERN (PREV_INSN (doloop_pat));
++      if (GET_CODE (PATTERN (prev_insn)) == PARALLEL)
++        {
++	  /* The third case: the compare and decrement instructions
++	     immediately precede the branch.  */
++	  cmp_orig = XVECEXP (PATTERN (prev_insn), 0, 0);
++	  if (GET_CODE (cmp_orig) != SET)
++	    return 0;
++	  if (GET_CODE (SET_SRC (cmp_orig)) != COMPARE)
++	    return 0;
++	  cmp_arg1 = XEXP (SET_SRC (cmp_orig), 0);
++          cmp_arg2 = XEXP (SET_SRC (cmp_orig), 1);
++	  if (cmp_arg2 != const0_rtx 
++	      || GET_CODE (cmp_arg1) != PLUS)
++	    return 0;
++	  reg_orig = XEXP (cmp_arg1, 0);
++	  if (XEXP (cmp_arg1, 1) != GEN_INT (-1) 
++	      || !REG_P (reg_orig))
++	    return 0;
++	  cc_reg = SET_DEST (cmp_orig);
++	  
++	  inc = XVECEXP (PATTERN (prev_insn), 0, 1);
++	}
++      else
++        inc = PATTERN (prev_insn);
+       /* We expect the condition to be of the form (reg != 0)  */
+       cond = XEXP (SET_SRC (cmp), 0);
+       if (GET_CODE (cond) != NE || XEXP (cond, 1) != const0_rtx)
+         return 0;
+-
+     }
+   else
+     {
+@@ -162,11 +201,15 @@
+     return 0;
+ 
+   if ((XEXP (condition, 0) == reg)
++      /* For the third case:  */  
++      || ((cc_reg != NULL_RTX)
++	  && (XEXP (condition, 0) == cc_reg)
++	  && (reg_orig == reg))
+       || (GET_CODE (XEXP (condition, 0)) == PLUS
+-		   && XEXP (XEXP (condition, 0), 0) == reg))
++	  && XEXP (XEXP (condition, 0), 0) == reg))
+    {
+      if (GET_CODE (pattern) != PARALLEL)
+-     /*  The second form we expect:
++     /*  For the second form we expect:
+ 
+          (set (reg) (plus (reg) (const_int -1))
+          (set (pc) (if_then_else (reg != 0)
+@@ -181,7 +224,24 @@
+                      (set (reg) (plus (reg) (const_int -1)))
+                      (additional clobbers and uses)])
+ 
+-         So we return that form instead.
++        For the third form we expect:
++
++        (parallel [(set (cc) (compare ((plus (reg) (const_int -1)), 0))
++                   (set (reg) (plus (reg) (const_int -1)))])
++        (set (pc) (if_then_else (cc == NE)
++                                (label_ref (label))
++                                (pc))) 
++
++        which is equivalent to the following:
++
++        (parallel [(set (cc) (compare (reg,  1))
++                   (set (reg) (plus (reg) (const_int -1)))
++                   (set (pc) (if_then_else (NE == cc)
++                                           (label_ref (label))
++                                           (pc))))])
++
++        So we return the second form instead for the two cases.
++
+      */
+         condition = gen_rtx_fmt_ee (NE, VOIDmode, inc_src, const1_rtx);
+ 
+
+=== modified file 'gcc/modulo-sched.c'
+--- old/gcc/modulo-sched.c	2009-11-25 10:55:54 +0000
++++ new/gcc/modulo-sched.c	2011-03-24 07:45:38 +0000
+@@ -116,8 +116,10 @@
+ 
+ /* The number of different iterations the nodes in ps span, assuming
+    the stage boundaries are placed efficiently.  */
+-#define PS_STAGE_COUNT(ps) ((PS_MAX_CYCLE (ps) - PS_MIN_CYCLE (ps) \
+-			     + 1 + (ps)->ii - 1) / (ps)->ii)
++#define CALC_STAGE_COUNT(min_cycle,max_cycle,ii) ((max_cycle - min_cycle \
++                         + 1 + ii - 1) / ii)
++/* The stage count of ps.  */
++#define PS_STAGE_COUNT(ps) (((partial_schedule_ptr)(ps))->stage_count)
+ 
+ /* A single instruction in the partial schedule.  */
+ struct ps_insn
+@@ -155,6 +157,8 @@
+   int max_cycle;
+ 
+   ddg_ptr g;	/* The DDG of the insns in the partial schedule.  */
++
++  int stage_count;  /* The stage count of the partial schedule.  */
+ };
+ 
+ /* We use this to record all the register replacements we do in
+@@ -195,6 +199,7 @@
+                                     rtx, rtx);
+ static void duplicate_insns_of_cycles (partial_schedule_ptr,
+ 				       int, int, int, rtx);
++static int calculate_stage_count (partial_schedule_ptr ps);
+ 
+ #define SCHED_ASAP(x) (((node_sched_params_ptr)(x)->aux.info)->asap)
+ #define SCHED_TIME(x) (((node_sched_params_ptr)(x)->aux.info)->time)
+@@ -310,10 +315,10 @@
+      either a single (parallel) branch-on-count or a (non-parallel)
+      branch immediately preceded by a single (decrement) insn.  */
+   first_insn_not_to_check = (GET_CODE (PATTERN (tail)) == PARALLEL ? tail
+-                             : PREV_INSN (tail));
++                             : prev_nondebug_insn (tail));
+ 
+   for (insn = head; insn != first_insn_not_to_check; insn = NEXT_INSN (insn))
+-    if (reg_mentioned_p (reg, insn))
++    if (reg_mentioned_p (reg, insn) && NONDEBUG_INSN_P (insn))
+       {
+         if (dump_file)
+         {
+@@ -332,6 +337,24 @@
+ #endif
+ }
+ 
++/* Mark in DOLOOP_INSNS the instructions that belong to the do-loop part.
++  Use TAIL to recognize that part.  */
++static void
++mark_doloop_insns (sbitmap doloop_insns, rtx tail)
++{
++  rtx first_insn_not_to_check, insn;
++
++  /* This is the first instruction which belongs the doloop part.  */
++  first_insn_not_to_check = (GET_CODE (PATTERN (tail)) == PARALLEL ? tail
++			     : prev_nondebug_insn (tail));
++
++  sbitmap_zero (doloop_insns);
++  for (insn = first_insn_not_to_check; insn != NEXT_INSN (tail);
++       insn = NEXT_INSN (insn))
++    if (NONDEBUG_INSN_P (insn))
++      SET_BIT (doloop_insns, INSN_UID (insn));
++}
++
+ /* Check if COUNT_REG is set to a constant in the PRE_HEADER block, so
+    that the number of iterations is a compile-time constant.  If so,
+    return the rtx that sets COUNT_REG to a constant, and set COUNT to
+@@ -569,13 +592,12 @@
+     }
+ }
+ 
+-/* Bump the SCHED_TIMEs of all nodes to start from zero.  Set the values
+-   of SCHED_ROW and SCHED_STAGE.  */
++/* Bump the SCHED_TIMEs of all nodes by AMOUNT.  Set the values of
++   SCHED_ROW and SCHED_STAGE.  */
+ static void
+-normalize_sched_times (partial_schedule_ptr ps)
++reset_sched_times (partial_schedule_ptr ps, int amount)
+ {
+   int row;
+-  int amount = PS_MIN_CYCLE (ps);
+   int ii = ps->ii;
+   ps_insn_ptr crr_insn;
+ 
+@@ -584,6 +606,10 @@
+       {
+ 	ddg_node_ptr u = crr_insn->node;
+ 	int normalized_time = SCHED_TIME (u) - amount;
++	int new_min_cycle = PS_MIN_CYCLE (ps) - amount;
++        /* The first cycle in row zero after the rotation.  */
++	int new_first_cycle_in_row_zero = 
++	  new_min_cycle + ii - SMODULO (new_min_cycle, ii);
+ 
+ 	if (dump_file)
+ 	  fprintf (dump_file, "crr_insn->node=%d, crr_insn->cycle=%d,\
+@@ -592,8 +618,30 @@
+ 	gcc_assert (SCHED_TIME (u) >= ps->min_cycle);
+ 	gcc_assert (SCHED_TIME (u) <= ps->max_cycle);
+ 	SCHED_TIME (u) = normalized_time;
+-	SCHED_ROW (u) = normalized_time % ii;
+-	SCHED_STAGE (u) = normalized_time / ii;
++	crr_insn->cycle = normalized_time;
++	SCHED_ROW (u) = SMODULO (normalized_time, ii);
++
++	/* If min_cycle is in row zero after the rotation then
++	   the stage count can be calculated by dividing the cycle
++	   with ii.  Otherwise, the calculation is done by dividing the
++	   SMSed kernel into two intervals:
++
++	   1) min_cycle	              <= interval 0 < first_cycle_in_row_zero
++	   2) first_cycle_in_row_zero <= interval 1 < max_cycle
++	   
++	   Cycles in interval 0 are in stage 0. The stage of cycles
++	   in interval 1 should be added by 1 to take interval 0 into
++	   account.  */
++	if (SMODULO (new_min_cycle, ii) == 0)
++          SCHED_STAGE (u) = normalized_time / ii;
++        else
++	  {
++            if (crr_insn->cycle < new_first_cycle_in_row_zero)
++	      SCHED_STAGE (u) = 0;
++	    else
++              SCHED_STAGE (u) = 
++		((SCHED_TIME (u) - new_first_cycle_in_row_zero) / ii) + 1;
++	  }
+       }
+ }
+ 
+@@ -646,9 +694,12 @@
+ 
+         /* Do not duplicate any insn which refers to count_reg as it
+            belongs to the control part.
++           If closing_branch_deps is true the closing branch is scheduled
++           as well and thus should be ignored.
+            TODO: This should be done by analyzing the control part of
+            the loop.  */
+-        if (reg_mentioned_p (count_reg, u_node->insn))
++        if (reg_mentioned_p (count_reg, u_node->insn)
++            || JUMP_P (ps_ij->node->insn))
+           continue;
+ 
+ 	if (for_prolog)
+@@ -894,7 +945,8 @@
+   basic_block condition_bb = NULL;
+   edge latch_edge;
+   gcov_type trip_count = 0;
+-
++  sbitmap doloop_insns;
++  
+   loop_optimizer_init (LOOPS_HAVE_PREHEADERS
+ 		       | LOOPS_HAVE_RECORDED_EXITS);
+   if (number_of_loops () <= 1)
+@@ -919,6 +971,7 @@
+   setup_sched_infos ();
+   haifa_sched_init ();
+ 
++  doloop_insns = sbitmap_alloc (get_max_uid () + 1);
+   /* Allocate memory to hold the DDG array one entry for each loop.
+      We use loop->num as index into this array.  */
+   g_arr = XCNEWVEC (ddg_ptr, number_of_loops ());
+@@ -1009,9 +1062,11 @@
+ 	continue;
+       }
+ 
+-      /* Don't handle BBs with calls or barriers, or !single_set insns,
+-         or auto-increment insns (to avoid creating invalid reg-moves
+-         for the auto-increment insns).
++      /* Don't handle BBs with calls or barriers or auto-increment insns 
++	 (to avoid creating invalid reg-moves for the auto-increment insns),
++	 or !single_set with the exception of instructions that include
++	 count_reg---these instructions are part of the control part
++	 that do-loop recognizes.
+          ??? Should handle auto-increment insns.
+          ??? Should handle insns defining subregs.  */
+      for (insn = head; insn != NEXT_INSN (tail); insn = NEXT_INSN (insn))
+@@ -1021,7 +1076,8 @@
+         if (CALL_P (insn)
+             || BARRIER_P (insn)
+             || (NONDEBUG_INSN_P (insn) && !JUMP_P (insn)
+-                && !single_set (insn) && GET_CODE (PATTERN (insn)) != USE)
++                && !single_set (insn) && GET_CODE (PATTERN (insn)) != USE
++                && !reg_mentioned_p (count_reg, insn))
+             || (FIND_REG_INC_NOTE (insn, NULL_RTX) != 0)
+             || (INSN_P (insn) && (set = single_set (insn))
+                 && GET_CODE (SET_DEST (set)) == SUBREG))
+@@ -1048,14 +1104,16 @@
+ 
+ 	  continue;
+ 	}
+-
+-      if (! (g = create_ddg (bb, 0)))
++      mark_doloop_insns (doloop_insns, tail);
++      if (! (g = create_ddg (bb, doloop_insns)))
+         {
+           if (dump_file)
+ 	    fprintf (dump_file, "SMS create_ddg failed\n");
+ 	  continue;
+         }
+-
++      if (dump_file)
++        fprintf (dump_file, "SMS closing_branch_deps: %d\n", 
++                 g->closing_branch_deps); 
+       g_arr[loop->num] = g;
+       if (dump_file)
+         fprintf (dump_file, "...OK\n");
+@@ -1157,11 +1215,13 @@
+ 
+       ps = sms_schedule_by_order (g, mii, maxii, node_order);
+ 
+-      if (ps){
+-	stage_count = PS_STAGE_COUNT (ps);
+-        gcc_assert(stage_count >= 1);
+-      }
+-
++      if (ps)
++	{
++	  stage_count = calculate_stage_count (ps);
++	  gcc_assert(stage_count >= 1);
++	  PS_STAGE_COUNT(ps) = stage_count;
++	}
++      
+       /* Stage count of 1 means that there is no interleaving between
+          iterations, let the scheduling passes do the job.  */
+       if (stage_count <= 1
+@@ -1182,17 +1242,7 @@
+       else
+ 	{
+ 	  struct undo_replace_buff_elem *reg_move_replaces;
+-
+-	  if (dump_file)
+-	    {
+-	      fprintf (dump_file,
+-		       "SMS succeeded %d %d (with ii, sc)\n", ps->ii,
+-		       stage_count);
+-	      print_partial_schedule (ps, dump_file);
+-	      fprintf (dump_file,
+-		       "SMS Branch (%d) will later be scheduled at cycle %d.\n",
+-		       g->closing_branch->cuid, PS_MIN_CYCLE (ps) - 1);
+-	    }
++	  int amount;
+ 
+ 	  /* Set the stage boundaries.  If the DDG is built with closing_branch_deps,
+ 	     the closing_branch was scheduled and should appear in the last (ii-1)
+@@ -1202,12 +1252,28 @@
+              TODO: Revisit the issue of scheduling the insns of the
+              control part relative to the branch when the control part
+              has more than one insn.  */
+-	  normalize_sched_times (ps);
+-	  rotate_partial_schedule (ps, PS_MIN_CYCLE (ps));
++	  amount = (g->closing_branch_deps)? SCHED_TIME (g->closing_branch) + 1: 
++	    PS_MIN_CYCLE (ps);
++	  reset_sched_times (ps, amount);
++	  rotate_partial_schedule (ps, amount);
++	  
+ 	  set_columns_for_ps (ps);
+ 
+ 	  canon_loop (loop);
+ 
++          if (dump_file)
++            {
++	      fprintf (dump_file,
++		       "SMS succeeded %d %d (with ii, sc)\n", ps->ii,
++		       stage_count);
++	      print_partial_schedule (ps, dump_file);
++	      if (!g->closing_branch_deps)
++		fprintf (dump_file,
++			 "SMS Branch (%d) will later be scheduled at \
++			 cycle %d.\n",
++			 g->closing_branch->cuid, PS_MIN_CYCLE (ps) - 1);
++            }
++
+           /* case the BCT count is not known , Do loop-versioning */
+ 	  if (count_reg && ! count_init)
+             {
+@@ -1252,6 +1318,7 @@
+     }
+ 
+   free (g_arr);
++  sbitmap_free (doloop_insns);
+ 
+   /* Release scheduler data, needed until now because of DFA.  */
+   haifa_sched_finish ();
+@@ -1759,8 +1826,9 @@
+ 	      RESET_BIT (tobe_scheduled, u);
+ 	      continue;
+ 	    }
+-
+-	  if (JUMP_P (insn)) /* Closing branch handled later.  */
++	  /* Closing branch handled later unless closing_branch_deps
++	     is true.  */
++	  if (JUMP_P (insn) && !g->closing_branch_deps) 
+ 	    {
+ 	      RESET_BIT (tobe_scheduled, u);
+ 	      continue;
+@@ -1893,8 +1961,8 @@
+   if (dump_file)
+     fprintf (dump_file, "split_row=%d\n", split_row);
+ 
+-  normalize_sched_times (ps);
+-  rotate_partial_schedule (ps, ps->min_cycle);
++  reset_sched_times (ps, PS_MIN_CYCLE (ps));
++  rotate_partial_schedule (ps, PS_MIN_CYCLE (ps));
+ 
+   rows_new = (ps_insn_ptr *) xcalloc (new_ii, sizeof (ps_insn_ptr));
+   for (row = 0; row < split_row; row++)
+@@ -2571,6 +2639,7 @@
+   ps_insn_ptr next_ps_i;
+   ps_insn_ptr first_must_follow = NULL;
+   ps_insn_ptr last_must_precede = NULL;
++  ps_insn_ptr last_in_row = NULL;
+   int row;
+ 
+   if (! ps_i)
+@@ -2597,8 +2666,37 @@
+ 	  else
+             last_must_precede = next_ps_i;
+         }
++      /* The closing branch must be the last in the row.  */
++      if (must_precede 
++	  && TEST_BIT (must_precede, next_ps_i->node->cuid) 
++	  && JUMP_P (next_ps_i->node->insn))     
++	return false;
++             
++       last_in_row = next_ps_i;
+     }
+ 
++  /* If closing_branch_deps is true we are scheduling the closing
++     branch as well.  Make sure there is no dependent instruction after
++     it as the branch should be the last instruction.  */
++  if (JUMP_P (ps_i->node->insn)) 
++    {
++      if (first_must_follow)
++	return false;
++      if (last_in_row)
++	{
++	  /* Make the branch the last in the row.  New instructions
++	     will be inserted at the beginning of the row or after the
++	     last must_precede instruction thus the branch is guaranteed
++	     to remain the last instruction in the row.  */
++	  last_in_row->next_in_row = ps_i;
++	  ps_i->prev_in_row = last_in_row;
++	  ps_i->next_in_row = NULL;
++	}
++      else
++	ps->rows[row] = ps_i;
++      return true;
++    }
++  
+   /* Now insert the node after INSERT_AFTER_PSI.  */
+ 
+   if (! last_must_precede)
+@@ -2820,6 +2918,54 @@
+   return ps_i;
+ }
+ 
++/* Calculate the stage count of the partial schedule PS.  */
++int
++calculate_stage_count (partial_schedule_ptr ps)
++{
++  int stage_count;
++
++  /* If closing_branch_deps is false then the stage
++     boundaries are placed efficiently, meaning that min_cycle will be
++     placed at row 0. Otherwise, the closing branch will be placed in
++     row ii-1. For the later case we assume the final SMSed kernel can
++     be divided into two intervals. This assumption is used for the
++     stage count calculation:
++
++     1) min_cycle               <= interval 0 < first_cycle_in_row_zero
++     2) first_cycle_in_row_zero <= interval 1 < max_cycle
++   */
++  stage_count =
++    CALC_STAGE_COUNT (PS_MIN_CYCLE (ps), PS_MAX_CYCLE (ps), ps->ii);
++  if (ps->g->closing_branch_deps)
++    {
++      int new_min_cycle;
++      int new_min_cycle_row;
++      int rotation_amount = SCHED_TIME (ps->g->closing_branch) + 1;
++
++      /* This is the new value of min_cycle after the final rotation to
++         bring closing branch into row ii-1.  */
++      new_min_cycle = PS_MIN_CYCLE (ps) - rotation_amount;
++      /* This is the row which the the new min_cycle will be placed in.  */
++      new_min_cycle_row = SMODULO (new_min_cycle, ps->ii);
++      /* If the row of min_cycle is zero then interval 0 is empty.
++         Otherwise, we need to calculate interval 1 and add it by one
++         to take interval 0 into account.  */
++      if (new_min_cycle_row != 0)
++	{
++	  int new_max_cycle, first_cycle_in_row_zero;
++
++	  new_max_cycle = PS_MAX_CYCLE (ps) - rotation_amount;
++	  first_cycle_in_row_zero =
++	    new_min_cycle + ps->ii - new_min_cycle_row;
++
++	  stage_count =
++	    CALC_STAGE_COUNT (first_cycle_in_row_zero, new_max_cycle,
++			      ps->ii) + 1;
++	}
++    }
++  return stage_count;
++}
++
+ /* Rotate the rows of PS such that insns scheduled at time
+    START_CYCLE will appear in row 0.  Updates max/min_cycles.  */
+ void
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch
new file mode 100644
index 0000000..9c305cc
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99498.patch
@@ -0,0 +1,186 @@
+2011-02-16  Nathan Sidwell  <nathan@codesourcery.com>
+
+	Issue #10439
+	gcc/
+	* config/arm/unwind-arm.c (enum __cxa_type_match_result): New.
+	(cxa_type_match): Correct declaration.
+	(__gnu_unwind_pr_common): Reconstruct
+	additional indirection when __cxa_type_match returns
+	succeeded_with_ptr_to_base.
+
+	libstdc++/
+	* libsupc++/eh_arm.c (__cxa_type_match): Construct address of
+	thrown object here.  Return succeded_with_ptr_to_base for all
+	pointer cases.
+
+=== modified file 'gcc/config/arm/unwind-arm.c'
+--- old/gcc/config/arm/unwind-arm.c	2010-08-12 12:39:35 +0000
++++ new/gcc/config/arm/unwind-arm.c	2011-04-08 10:41:46 +0000
+@@ -32,13 +32,18 @@
+ typedef unsigned char bool;
+ 
+ typedef struct _ZSt9type_info type_info; /* This names C++ type_info type */
++enum __cxa_type_match_result
++  {
++    ctm_failed = 0,
++    ctm_succeeded = 1,
++    ctm_succeeded_with_ptr_to_base = 2
++  };
+ 
+ void __attribute__((weak)) __cxa_call_unexpected(_Unwind_Control_Block *ucbp);
+ bool __attribute__((weak)) __cxa_begin_cleanup(_Unwind_Control_Block *ucbp);
+-bool __attribute__((weak)) __cxa_type_match(_Unwind_Control_Block *ucbp,
+-					    const type_info *rttip,
+-					    bool is_reference,
+-					    void **matched_object);
++enum __cxa_type_match_result __attribute__((weak)) __cxa_type_match
++  (_Unwind_Control_Block *ucbp, const type_info *rttip,
++   bool is_reference, void **matched_object);
+ 
+ _Unwind_Ptr __attribute__((weak))
+ __gnu_Unwind_Find_exidx (_Unwind_Ptr, int *);
+@@ -1107,6 +1112,7 @@
+ 		      _uw rtti;
+ 		      bool is_reference = (data[0] & uint32_highbit) != 0;
+ 		      void *matched;
++		      enum __cxa_type_match_result match_type;
+ 
+ 		      /* Check for no-throw areas.  */
+ 		      if (data[1] == (_uw) -2)
+@@ -1118,17 +1124,31 @@
+ 			{
+ 			  /* Match a catch specification.  */
+ 			  rtti = _Unwind_decode_target2 ((_uw) &data[1]);
+-			  if (!__cxa_type_match (ucbp, (type_info *) rtti,
+-						 is_reference,
+-						 &matched))
+-			    matched = (void *)0;
++			  match_type = __cxa_type_match (ucbp,
++							 (type_info *) rtti,
++							 is_reference,
++							 &matched);
+ 			}
++		      else
++			match_type = ctm_succeeded;
+ 
+-		      if (matched)
++		      if (match_type)
+ 			{
+ 			  ucbp->barrier_cache.sp =
+ 			    _Unwind_GetGR (context, R_SP);
+-			  ucbp->barrier_cache.bitpattern[0] = (_uw) matched;
++			  // ctm_succeeded_with_ptr_to_base really
++			  // means _c_t_m indirected the pointer
++			  // object.  We have to reconstruct the
++			  // additional pointer layer by using a temporary.
++			  if (match_type == ctm_succeeded_with_ptr_to_base)
++			    {
++			      ucbp->barrier_cache.bitpattern[2]
++				= (_uw) matched;
++			      ucbp->barrier_cache.bitpattern[0]
++				= (_uw) &ucbp->barrier_cache.bitpattern[2];
++			    }
++			  else
++			    ucbp->barrier_cache.bitpattern[0] = (_uw) matched;
+ 			  ucbp->barrier_cache.bitpattern[1] = (_uw) data;
+ 			  return _URC_HANDLER_FOUND;
+ 			}
+
+=== modified file 'libstdc++-v3/libsupc++/eh_arm.cc'
+--- old/libstdc++-v3/libsupc++/eh_arm.cc	2009-04-09 14:00:19 +0000
++++ new/libstdc++-v3/libsupc++/eh_arm.cc	2011-04-08 10:41:46 +0000
+@@ -30,10 +30,11 @@
+ using namespace __cxxabiv1;
+ 
+ 
+-// Given the thrown type THROW_TYPE, pointer to a variable containing a
+-// pointer to the exception object THROWN_PTR_P and a type CATCH_TYPE to
+-// compare against, return whether or not there is a match and if so,
+-// update *THROWN_PTR_P.
++// Given the thrown type THROW_TYPE, exception object UE_HEADER and a
++// type CATCH_TYPE to compare against, return whether or not there is
++// a match and if so, update *THROWN_PTR_P to point to either the
++// type-matched object, or in the case of a pointer type, the object
++// pointed to by the pointer.
+ 
+ extern "C" __cxa_type_match_result
+ __cxa_type_match(_Unwind_Exception* ue_header,
+@@ -41,51 +42,51 @@
+ 		 bool is_reference __attribute__((__unused__)),
+ 		 void** thrown_ptr_p)
+ {
+-  bool forced_unwind = __is_gxx_forced_unwind_class(ue_header->exception_class);
+-  bool foreign_exception = !forced_unwind && !__is_gxx_exception_class(ue_header->exception_class);
+-  bool dependent_exception =
+-    __is_dependent_exception(ue_header->exception_class);
++  bool forced_unwind
++    = __is_gxx_forced_unwind_class(ue_header->exception_class);
++  bool foreign_exception
++    = !forced_unwind && !__is_gxx_exception_class(ue_header->exception_class);
++  bool dependent_exception
++    = __is_dependent_exception(ue_header->exception_class);
+   __cxa_exception* xh = __get_exception_header_from_ue(ue_header);
+   __cxa_dependent_exception *dx = __get_dependent_exception_from_ue(ue_header);
+   const std::type_info* throw_type;
++  void *thrown_ptr = 0;
+ 
+   if (forced_unwind)
+     throw_type = &typeid(abi::__forced_unwind);
+   else if (foreign_exception)
+     throw_type = &typeid(abi::__foreign_exception);
+-  else if (dependent_exception)
+-    throw_type = __get_exception_header_from_obj
+-      (dx->primaryException)->exceptionType;
+   else
+-    throw_type = xh->exceptionType;
+-
+-  void* thrown_ptr = *thrown_ptr_p;
++    {
++      if (dependent_exception)
++	xh = __get_exception_header_from_obj (dx->primaryException);
++      throw_type = xh->exceptionType;
++      // We used to require the caller set the target of thrown_ptr_p,
++      // but that's incorrect -- the EHABI makes no such requirement
++      // -- and not all callers will set it.  Fortunately callers that
++      // do initialize will always pass us the value we calculate
++      // here, so there's no backwards compatibility problem.
++      thrown_ptr = __get_object_from_ue (ue_header);
++    }
++  
++  __cxa_type_match_result result = ctm_succeeded;
+ 
+   // Pointer types need to adjust the actual pointer, not
+   // the pointer to pointer that is the exception object.
+   // This also has the effect of passing pointer types
+   // "by value" through the __cxa_begin_catch return value.
+   if (throw_type->__is_pointer_p())
+-    thrown_ptr = *(void**) thrown_ptr;
++    {
++      thrown_ptr = *(void**) thrown_ptr;
++      // We need to indicate the indirection to our caller.
++      result = ctm_succeeded_with_ptr_to_base;
++    }
+ 
+   if (catch_type->__do_catch(throw_type, &thrown_ptr, 1))
+     {
+       *thrown_ptr_p = thrown_ptr;
+-
+-      if (typeid(*catch_type) == typeid (typeid(void*)))
+-	{
+-	  const __pointer_type_info *catch_pointer_type =
+-	    static_cast<const __pointer_type_info *> (catch_type);
+-	  const __pointer_type_info *throw_pointer_type =
+-	    static_cast<const __pointer_type_info *> (throw_type);
+-
+-	  if (typeid (*catch_pointer_type->__pointee) != typeid (void)
+-	      && (*catch_pointer_type->__pointee != 
+-		  *throw_pointer_type->__pointee))
+-	    return ctm_succeeded_with_ptr_to_base;
+-	}
+-
+-      return ctm_succeeded;
++      return result;
+     }
+ 
+   return ctm_failed;
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch
new file mode 100644
index 0000000..59bf01c
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99502.patch
@@ -0,0 +1,134 @@
+2011-04-26  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	Backport from mainline:
+
+	2011-03-21  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	gcc/
+	* simplify-rtx.c (simplify_binary_operation_1): Handle
+	(xor (and A B) C) case when B and C are both constants.
+
+	gcc/testsuite/
+	* gcc.target/arm/xor-and.c: New.
+
+	2011-03-18  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	gcc/
+	* combine.c (try_combine): Do simplification only call of
+	subst() on i2 even when i1 is present. Update comments.
+
+	gcc/testsuite/
+	* gcc.target/arm/unsigned-extend-1.c: New.
+
+=== modified file 'gcc/combine.c'
+--- old/gcc/combine.c	2011-01-06 11:02:44 +0000
++++ new/gcc/combine.c	2011-04-14 13:58:12 +0000
+@@ -2939,7 +2939,7 @@
+       /* It is possible that the source of I2 or I1 may be performing
+ 	 an unneeded operation, such as a ZERO_EXTEND of something
+ 	 that is known to have the high part zero.  Handle that case
+-	 by letting subst look at the innermost one of them.
++	 by letting subst look at the inner insns.
+ 
+ 	 Another way to do this would be to have a function that tries
+ 	 to simplify a single insn instead of merging two or more
+@@ -2964,11 +2964,9 @@
+ 	      subst_low_luid = DF_INSN_LUID (i1);
+ 	      i1src = subst (i1src, pc_rtx, pc_rtx, 0, 0, 0);
+ 	    }
+-	  else
+-	    {
+-	      subst_low_luid = DF_INSN_LUID (i2);
+-	      i2src = subst (i2src, pc_rtx, pc_rtx, 0, 0, 0);
+-	    }
++
++	  subst_low_luid = DF_INSN_LUID (i2);
++	  i2src = subst (i2src, pc_rtx, pc_rtx, 0, 0, 0);
+ 	}
+ 
+       n_occurrences = 0;		/* `subst' counts here */
+
+=== modified file 'gcc/simplify-rtx.c'
+--- old/gcc/simplify-rtx.c	2010-06-25 20:11:56 +0000
++++ new/gcc/simplify-rtx.c	2011-04-14 13:58:12 +0000
+@@ -2413,6 +2413,46 @@
+ 							XEXP (op0, 1), mode),
+ 				    op1);
+ 
++      /* Given (xor (and A B) C), using P^Q == (~P&Q) | (~Q&P),
++	 we can transform like this:
++            (A&B)^C == ~(A&B)&C | ~C&(A&B)
++                    == (~A|~B)&C | ~C&(A&B)    * DeMorgan's Law
++                    == ~A&C | ~B&C | A&(~C&B)  * Distribute and re-order
++	 Attempt a few simplifications when B and C are both constants.  */
++      if (GET_CODE (op0) == AND
++	  && CONST_INT_P (op1)
++	  && CONST_INT_P (XEXP (op0, 1)))
++	{
++	  rtx a = XEXP (op0, 0);
++	  rtx b = XEXP (op0, 1);
++	  rtx c = op1;
++	  HOST_WIDE_INT bval = INTVAL (b);
++	  HOST_WIDE_INT cval = INTVAL (c);
++
++	  rtx na_c
++	    = simplify_binary_operation (AND, mode,
++					 simplify_gen_unary (NOT, mode, a, mode),
++					 c);
++	  if ((~cval & bval) == 0)
++	    {
++	      /* Try to simplify ~A&C | ~B&C.  */
++	      if (na_c != NULL_RTX)
++		return simplify_gen_binary (IOR, mode, na_c,
++					    GEN_INT (~bval & cval));
++	    }
++	  else
++	    {
++	      /* If ~A&C is zero, simplify A&(~C&B) | ~B&C.  */
++	      if (na_c == const0_rtx)
++		{
++		  rtx a_nc_b = simplify_gen_binary (AND, mode, a,
++						    GEN_INT (~cval & bval));
++		  return simplify_gen_binary (IOR, mode, a_nc_b,
++					      GEN_INT (~bval & cval));
++		}
++	    }
++	}
++
+       /* (xor (comparison foo bar) (const_int 1)) can become the reversed
+ 	 comparison if STORE_FLAG_VALUE is 1.  */
+       if (STORE_FLAG_VALUE == 1
+
+=== added file 'gcc/testsuite/gcc.target/arm/unsigned-extend-1.c'
+--- old/gcc/testsuite/gcc.target/arm/unsigned-extend-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/unsigned-extend-1.c	2011-04-14 13:58:12 +0000
+@@ -0,0 +1,9 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv6" } */
++
++unsigned char foo (unsigned char c)
++{
++  return (c >= '0') && (c <= '9');
++}
++
++/* { dg-final { scan-assembler-not "uxtb" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/xor-and.c'
+--- old/gcc/testsuite/gcc.target/arm/xor-and.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/xor-and.c	2011-04-14 13:58:12 +0000
+@@ -0,0 +1,14 @@
++/* { dg-do compile } */
++/* { dg-options "-O -march=armv6" } */
++
++unsigned short foo (unsigned short x)
++{
++  x ^= 0x4002;
++  x >>= 1;
++  x |= 0x8000;
++  return x;
++}
++
++/* { dg-final { scan-assembler "orr" } } */
++/* { dg-final { scan-assembler-not "mvn" } } */
++/* { dg-final { scan-assembler-not "uxth" } } */
+
-- 
1.7.4.1



