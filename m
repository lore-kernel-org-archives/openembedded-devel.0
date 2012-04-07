Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGc6X-0001Jo-0F
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Apr 2012 22:19:25 +0200
Received: by pbcum15 with SMTP id um15so2989330pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2012 13:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=aQKJm5t7r993feF5lu9znMgCE7r21lHIVNUlF0Iawmw=;
	b=hqdXDR5JnxvQtIeGhUwjIKoKAIxkSHWm+Vns+NUZWJqCPfFOyVw814eS5yW8rJJYJY
	QjhsHAlKGUiqbVL1YMoXm5fsOpzdQZ2jfcei6lsL8wTHuoJDnoXcOSsyvTCo/5yNkVj5
	Mi2qm7FqPFi3B/nYif6JGnOL8/NDcKYZcaVLiT5mWcupD7H+w3jvV7lF/F/8LaJhvg9k
	Nwr9bCVnL87HUEpwt9OlLE8UNyQR84PyEsIOkaUyExxreonj8sAQy8b/K5eZ9UqCyu6G
	kZWkz8rFXi2EDy5fxtebem5+Og3LT2hoKoCYinC3NV0pcCV4VQTLiSQAsDy3fufFhX1O
	YBDw==
Received: by 10.68.125.195 with SMTP id ms3mr6222073pbb.62.1333829409458;
	Sat, 07 Apr 2012 13:10:09 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id vk10sm1257964pbc.45.2012.04.07.13.10.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 Apr 2012 13:10:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2012 13:09:45 -0700
Message-Id: <1333829385-32212-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [toolchain-layer][PATCH] gcc-4.6: Update to 2012.03 linaro release
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
X-List-Received-Date: Sat, 07 Apr 2012 20:19:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106876.patch    |  109 ++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106877.patch    |  239 ++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106878.patch    |   69 +++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106879.patch    |  643 ++++++++++++++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106882.patch    |   53 ++
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |    5 +
 .../recipes-devtools/gcc/gcc-common-4.6.inc        |    2 +-
 7 files changed, 1119 insertions(+), 1 deletions(-)
 create mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106876.patch
 create mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106877.patch
 create mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106878.patch
 create mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106879.patch
 create mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106882.patch

diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106876.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106876.patch
new file mode 100644
index 0000000..048e85b
--- /dev/null
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106876.patch
@@ -0,0 +1,109 @@
+2012-03-06  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	LP:942307
+    	gcc/
+    	PR target/50305
+    	* config/arm/arm.c (arm_legitimize_reload_address): Recognize
+    	output of a previous pass through legitimize_reload_address.
+    	Do not attempt to optimize addresses if the base register is
+    	equivalent to a constant.
+    	gcc/testsuite/
+    	PR target/50305
+    	* gcc.target/arm/pr50305.c: New test.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2012-03-02 13:53:14 +0000
++++ new/gcc/config/arm/arm.c	2012-03-06 11:01:55 +0000
+@@ -6632,9 +6632,26 @@
+ 			       int opnum, int type,
+ 			       int ind_levels ATTRIBUTE_UNUSED)
+ {
++  /* We must recognize output that we have already generated ourselves.  */
++  if (GET_CODE (*p) == PLUS
++      && GET_CODE (XEXP (*p, 0)) == PLUS
++      && GET_CODE (XEXP (XEXP (*p, 0), 0)) == REG
++      && GET_CODE (XEXP (XEXP (*p, 0), 1)) == CONST_INT
++      && GET_CODE (XEXP (*p, 1)) == CONST_INT)
++    {
++      push_reload (XEXP (*p, 0), NULL_RTX, &XEXP (*p, 0), NULL,
++		   MODE_BASE_REG_CLASS (mode), GET_MODE (*p),
++		   VOIDmode, 0, 0, opnum, (enum reload_type) type);
++      return true;
++    }
++
+   if (GET_CODE (*p) == PLUS
+       && GET_CODE (XEXP (*p, 0)) == REG
+       && ARM_REGNO_OK_FOR_BASE_P (REGNO (XEXP (*p, 0)))
++      /* If the base register is equivalent to a constant, let the generic
++	 code handle it.  Otherwise we will run into problems if a future
++	 reload pass decides to rematerialize the constant.  */
++      && !reg_equiv_constant [ORIGINAL_REGNO (XEXP (*p, 0))]
+       && GET_CODE (XEXP (*p, 1)) == CONST_INT)
+     {
+       HOST_WIDE_INT val = INTVAL (XEXP (*p, 1));
+
+=== added file 'gcc/testsuite/gcc.target/arm/pr50305.c'
+--- old/gcc/testsuite/gcc.target/arm/pr50305.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/pr50305.c	2012-03-01 13:07:48 +0000
+@@ -0,0 +1,60 @@
++/* { dg-do compile } */
++/* { dg-skip-if "incompatible options" { arm*-*-* } { "-march=*" } { "-march=armv7-a" } } */
++/* { dg-options "-O2 -fno-omit-frame-pointer -marm -march=armv7-a -mfpu=vfp3" } */
++
++struct event {
++ unsigned long long id;
++ unsigned int flag;
++};
++
++void dummy(void)
++{
++  /* This is here to ensure that the offset of perf_event_id below
++     relative to the LANCHOR symbol exceeds the allowed displacement.  */
++  static int __warned[300];
++ __warned[0] = 1;
++}
++
++extern void *kmem_cache_alloc_trace (void *cachep);
++extern void *cs_cachep;
++extern int nr_cpu_ids;
++
++struct event *
++event_alloc (int cpu)
++{
++ static unsigned long long __attribute__((aligned(8))) perf_event_id;
++ struct event *event;
++ unsigned long long result;
++ unsigned long tmp;
++
++ if (cpu >= nr_cpu_ids)
++  return 0;
++
++ event = kmem_cache_alloc_trace (cs_cachep);
++
++ __asm__ __volatile__ ("dmb" : : : "memory");
++
++ __asm__ __volatile__("@ atomic64_add_return\n"
++"1:	ldrexd	%0, %H0, [%3]\n"
++"	adds	%0, %0, %4\n"
++"	adc	%H0, %H0, %H4\n"
++"	strexd	%1, %0, %H0, [%3]\n"
++"	teq	%1, #0\n"
++"	bne	1b"
++ : "=&r" (result), "=&r" (tmp), "+Qo" (perf_event_id)
++ : "r" (&perf_event_id), "r" (1LL)
++ : "cc");
++
++ __asm__ __volatile__ ("dmb" : : : "memory");
++
++ event->id = result;
++
++ if (cpu)
++  event->flag = 1;
++
++ for (cpu = 0; cpu < nr_cpu_ids; cpu++)
++   kmem_cache_alloc_trace (cs_cachep);
++
++ return event;
++}
++
+
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106877.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106877.patch
new file mode 100644
index 0000000..b83b957
--- /dev/null
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106877.patch
@@ -0,0 +1,239 @@
+2012-03-06  Ulrich Weigand  <ulrich.weigand@linaro.org>
+
+	Backport from mainline:
+
+	gcc/
+	* config/arm/arm.c (arm_sat_operator_match): New function.
+	* config/arm/arm-protos.h (arm_sat_operator_match): Add prototype.
+	* config/arm/arm.md ("insn" attribute): Add "sat" value.
+	("SAT", "SATrev"): New code iterators.
+	("SATlo", "SAThi"): New code iterator attributes.
+	("*satsi_<SAT:code>"): New pattern.
+	("*satsi_<SAT:code>_shift"): Likewise.
+	* config/arm/predicates.md (sat_shift_operator): New.
+
+	gcc/testsuite/
+	* gcc.target/arm/sat-1.c: New test.
+
+=== modified file 'gcc/config/arm/arm-protos.h'
+--- old/gcc/config/arm/arm-protos.h	2012-02-22 13:31:54 +0000
++++ new/gcc/config/arm/arm-protos.h	2012-02-29 14:29:56 +0000
+@@ -104,6 +104,7 @@
+ extern int symbol_mentioned_p (rtx);
+ extern int label_mentioned_p (rtx);
+ extern RTX_CODE minmax_code (rtx);
++extern bool arm_sat_operator_match (rtx, rtx, int *, bool *);
+ extern int adjacent_mem_locations (rtx, rtx);
+ extern bool gen_ldm_seq (rtx *, int, bool);
+ extern bool gen_stm_seq (rtx *, int);
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2012-03-06 11:01:55 +0000
++++ new/gcc/config/arm/arm.c	2012-03-06 13:24:25 +0000
+@@ -9978,6 +9978,42 @@
+     }
+ }
+ 
++/* Match pair of min/max operators that can be implemented via usat/ssat.  */
++
++bool
++arm_sat_operator_match (rtx lo_bound, rtx hi_bound,
++			int *mask, bool *signed_sat)
++{
++  /* The high bound must be a power of two minus one.  */
++  int log = exact_log2 (INTVAL (hi_bound) + 1);
++  if (log == -1)
++    return false;
++
++  /* The low bound is either zero (for usat) or one less than the
++     negation of the high bound (for ssat).  */
++  if (INTVAL (lo_bound) == 0)
++    {
++      if (mask)
++        *mask = log;
++      if (signed_sat)
++        *signed_sat = false;
++
++      return true;
++    }
++
++  if (INTVAL (lo_bound) == -INTVAL (hi_bound) - 1)
++    {
++      if (mask)
++        *mask = log + 1;
++      if (signed_sat)
++        *signed_sat = true;
++
++      return true;
++    }
++
++  return false;
++}
++
+ /* Return 1 if memory locations are adjacent.  */
+ int
+ adjacent_mem_locations (rtx a, rtx b)
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2012-03-02 13:53:14 +0000
++++ new/gcc/config/arm/arm.md	2012-03-06 13:24:25 +0000
+@@ -286,7 +286,7 @@
+ ;; scheduling information.
+ 
+ (define_attr "insn"
+-        "mov,mvn,smulxy,smlaxy,smlalxy,smulwy,smlawx,mul,muls,mla,mlas,umull,umulls,umlal,umlals,smull,smulls,smlal,smlals,smlawy,smuad,smuadx,smlad,smladx,smusd,smusdx,smlsd,smlsdx,smmul,smmulr,smmla,umaal,smlald,smlsld,clz,mrs,msr,xtab,sdiv,udiv,other"
++        "mov,mvn,smulxy,smlaxy,smlalxy,smulwy,smlawx,mul,muls,mla,mlas,umull,umulls,umlal,umlals,smull,smulls,smlal,smlals,smlawy,smuad,smuadx,smlad,smladx,smusd,smusdx,smlsd,smlsdx,smmul,smmulr,smmla,umaal,smlald,smlsld,clz,mrs,msr,xtab,sdiv,udiv,sat,other"
+         (const_string "other"))
+ 
+ ; TYPE attribute is used to detect floating point instructions which, if
+@@ -3424,6 +3424,60 @@
+ 		      (const_int 12)))]
+ )
+ 
++(define_code_iterator SAT [smin smax])
++(define_code_iterator SATrev [smin smax])
++(define_code_attr SATlo [(smin "1") (smax "2")])
++(define_code_attr SAThi [(smin "2") (smax "1")])
++
++(define_insn "*satsi_<SAT:code>"
++  [(set (match_operand:SI 0 "s_register_operand" "=r")
++        (SAT:SI (SATrev:SI (match_operand:SI 3 "s_register_operand" "r")
++                           (match_operand:SI 1 "const_int_operand" "i"))
++                (match_operand:SI 2 "const_int_operand" "i")))]
++  "TARGET_32BIT && arm_arch6 && <SAT:CODE> != <SATrev:CODE>
++   && arm_sat_operator_match (operands[<SAT:SATlo>], operands[<SAT:SAThi>], NULL, NULL)"
++{
++  int mask;
++  bool signed_sat;
++  if (!arm_sat_operator_match (operands[<SAT:SATlo>], operands[<SAT:SAThi>],
++                               &mask, &signed_sat))
++    gcc_unreachable ();
++
++  operands[1] = GEN_INT (mask);
++  if (signed_sat)
++    return "ssat%?\t%0, %1, %3";
++  else
++    return "usat%?\t%0, %1, %3";
++}
++  [(set_attr "predicable" "yes")
++   (set_attr "insn" "sat")])
++
++(define_insn "*satsi_<SAT:code>_shift"
++  [(set (match_operand:SI 0 "s_register_operand" "=r")
++        (SAT:SI (SATrev:SI (match_operator:SI 3 "sat_shift_operator"
++                             [(match_operand:SI 4 "s_register_operand" "r")
++                              (match_operand:SI 5 "const_int_operand" "i")])
++                           (match_operand:SI 1 "const_int_operand" "i"))
++                (match_operand:SI 2 "const_int_operand" "i")))]
++  "TARGET_32BIT && arm_arch6 && <SAT:CODE> != <SATrev:CODE>
++   && arm_sat_operator_match (operands[<SAT:SATlo>], operands[<SAT:SAThi>], NULL, NULL)"
++{
++  int mask;
++  bool signed_sat;
++  if (!arm_sat_operator_match (operands[<SAT:SATlo>], operands[<SAT:SAThi>],
++                               &mask, &signed_sat))
++    gcc_unreachable ();
++
++  operands[1] = GEN_INT (mask);
++  if (signed_sat)
++    return "ssat%?\t%0, %1, %4%S3";
++  else
++    return "usat%?\t%0, %1, %4%S3";
++}
++  [(set_attr "predicable" "yes")
++   (set_attr "insn" "sat")
++   (set_attr "shift" "3")
++   (set_attr "type" "alu_shift")])
+ 
+ ;; Shift and rotation insns
+ 
+
+=== modified file 'gcc/config/arm/predicates.md'
+--- old/gcc/config/arm/predicates.md	2012-02-22 13:31:54 +0000
++++ new/gcc/config/arm/predicates.md	2012-02-29 14:29:56 +0000
+@@ -241,6 +241,15 @@
+ 			      || ((unsigned HOST_WIDE_INT) INTVAL (XEXP (op, 1))) < 32")))
+        (match_test "mode == GET_MODE (op)")))
+ 
++;; True for shift operators which can be used with saturation instructions.
++(define_special_predicate "sat_shift_operator"
++  (and (ior (and (match_code "mult")
++                 (match_test "power_of_two_operand (XEXP (op, 1), mode)"))
++            (and (match_code "ashift,ashiftrt")
++                 (match_test "GET_CODE (XEXP (op, 1)) == CONST_INT
++                             && ((unsigned HOST_WIDE_INT) INTVAL (XEXP (op, 1)) < 32)")))
++       (match_test "mode == GET_MODE (op)")))
++
+ ;; True for MULT, to identify which variant of shift_operator is in use.
+ (define_special_predicate "mult_operator"
+   (match_code "mult"))
+
+=== added file 'gcc/testsuite/gcc.target/arm/sat-1.c'
+--- old/gcc/testsuite/gcc.target/arm/sat-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/sat-1.c	2012-02-29 14:29:56 +0000
+@@ -0,0 +1,64 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_arm_ok } */
++/* { dg-require-effective-target arm_arch_v6_ok } */
++/* { dg-options "-O2 -marm" } */
++/* { dg-add-options arm_arch_v6 } */
++
++
++static inline int sat1 (int a, int amin, int amax)
++{
++  if      (a < amin) return amin;
++  else if (a > amax) return amax;
++  else               return a;
++}
++
++static inline int sat2 (int a, int amin, int amax)
++{
++  if      (a > amax) return amax;
++  else if (a < amin) return amin;
++  else               return a;
++}
++
++int u1 (int x)
++{
++  return sat1 (x, 0, 63);
++}
++
++int us1 (int x)
++{
++  return sat1 (x >> 5, 0, 63);
++}
++
++int s1 (int x)
++{
++  return sat1 (x, -64, 63);
++}
++
++int ss1 (int x)
++{
++  return sat1 (x >> 5, -64, 63);
++}
++
++int u2 (int x)
++{
++  return sat2 (x, 0, 63);
++}
++
++int us2 (int x)
++{
++  return sat2 (x >> 5, 0, 63);
++}
++
++int s2 (int x)
++{
++  return sat2 (x, -64, 63);
++}
++
++int ss2 (int x)
++{
++  return sat2 (x >> 5, -64, 63);
++}
++
++/* { dg-final { scan-assembler-times "usat" 4 } } */
++/* { dg-final { scan-assembler-times "ssat" 4 } } */
++
+
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106878.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106878.patch
new file mode 100644
index 0000000..fc1633d
--- /dev/null
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106878.patch
@@ -0,0 +1,69 @@
+2012-03-08  Michael Hope  <michael.hope@linaro.org>
+
+	Backport proposed patch:
+
+	gcc/
+	2012-01-31  Richard Henderson  <rth@redhat.com>
+
+	* longlong.h [arm] (umul_ppmm): Use umull.  Enable for thumb2.
+	[arm] (count_trailing_zeros): Use __builtin_ctz.
+
+=== modified file 'gcc/longlong.h'
+--- old/gcc/longlong.h	2011-10-04 07:28:50 +0000
++++ new/gcc/longlong.h	2012-02-22 01:51:14 +0000
+@@ -203,7 +203,7 @@
+ UDItype __umulsidi3 (USItype, USItype);
+ #endif
+ 
+-#if defined (__arm__) && !defined (__thumb__) && W_TYPE_SIZE == 32
++#if defined (__arm__) && (defined (__thumb2__) || !defined (__thumb__)) && W_TYPE_SIZE == 32
+ #define add_ssaaaa(sh, sl, ah, al, bh, bl) \
+   __asm__ ("adds	%1, %4, %5\n\tadc	%0, %2, %3"		\
+ 	   : "=r" ((USItype) (sh)),					\
+@@ -220,9 +220,12 @@
+ 	     "rI" ((USItype) (bh)),					\
+ 	     "r" ((USItype) (al)),					\
+ 	     "rI" ((USItype) (bl)) __CLOBBER_CC)
+-#define umul_ppmm(xh, xl, a, b) \
+-{register USItype __t0, __t1, __t2;					\
+-  __asm__ ("%@ Inlined umul_ppmm\n"					\
++# if defined(__ARM_ARCH_2__) || defined(__ARM_ARCH_2A__) \
++     || defined(__ARM_ARCH_3__)
++#  define umul_ppmm(xh, xl, a, b)					\
++  do {									\
++    register USItype __t0, __t1, __t2;					\
++    __asm__ ("%@ Inlined umul_ppmm\n"					\
+ 	   "	mov	%2, %5, lsr #16\n"				\
+ 	   "	mov	%0, %6, lsr #16\n"				\
+ 	   "	bic	%3, %5, %2, lsl #16\n"				\
+@@ -239,14 +242,26 @@
+ 	     "=r" ((USItype) (xl)),					\
+ 	     "=&r" (__t0), "=&r" (__t1), "=r" (__t2)			\
+ 	   : "r" ((USItype) (a)),					\
+-	     "r" ((USItype) (b)) __CLOBBER_CC );}
+-#define UMUL_TIME 20
+-#define UDIV_TIME 100
++	     "r" ((USItype) (b)) __CLOBBER_CC );			\
++  } while (0)
++#  define UMUL_TIME 20
++# else
++#  define umul_ppmm(xh, xl, a, b)					\
++  do {									\
++    /* Generate umull, under compiler control.  */			\
++    register UDItype __t0 = (UDItype)(USItype)(a) * (USItype)(b);	\
++    (xl) = (USItype)__t0;						\
++    (xh) = (USItype)(__t0 >> 32);					\
++  } while (0)
++#  define UMUL_TIME 3
++# endif
++# define UDIV_TIME 100
+ #endif /* __arm__ */
+ 
+ #if defined(__arm__)
+ /* Let gcc decide how best to implement count_leading_zeros.  */
+ #define count_leading_zeros(COUNT,X)	((COUNT) = __builtin_clz (X))
++#define count_trailing_zeros(COUNT,X)   ((COUNT) = __builtin_ctz (X))
+ #define COUNT_LEADING_ZEROS_0 32
+ #endif
+ 
+
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106879.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106879.patch
new file mode 100644
index 0000000..a97a27b
--- /dev/null
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106879.patch
@@ -0,0 +1,643 @@
+2012-03-08  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from mainline.
+        2012-02-28  Richard Earnshaw  <rearnsha@arm.com>
+
+	* arm.c (aapcs_vfp_is_call_or_return_candidate): Only use the machine
+	mode if there is no type information available.
+
+        2012-02-28  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
+
+	* gcc.target/arm/aapcs/vfp1.c (dg_do run): Run on all eabi variants.
+	* gcc.target/arm/aapcs/vfp2.c: Likewise.
+	* gcc.target/arm/aapcs/vfp3.c: Likewise.
+	* gcc.target/arm/aapcs/vfp4.c: Likewise.
+	* gcc.target/arm/aapcs/vfp5.c: Likewise.
+	* gcc.target/arm/aapcs/vfp6.c: Likewise.
+	* gcc.target/arm/aapcs/vfp7.c: Likewise.
+	* gcc.target/arm/aapcs/vfp8.c: Likewise.
+	* gcc.target/arm/aapcs/vfp9.c: Likewise.
+	* gcc.target/arm/aapcs/vfp10.c: Likewise.
+	* gcc.target/arm/aapcs/vfp11.c: Likewise.
+	* gcc.target/arm/aapcs/vfp12.c: Likewise.
+	* gcc.target/arm/aapcs/vfp13.c: Likewise.
+	* gcc.target/arm/aapcs/vfp14.c: Likewise.
+	* gcc.target/arm/aapcs/vfp15.c: Likewise.
+	* gcc.target/arm/aapcs/vfp16.c: Likewise.
+	* gcc.target/arm/aapcs/vfp17.c: Likewise.
+	* gcc.target/arm/neon-constants.h: New file.
+	* gcc.target/arm/aapcs/neon-constants.h: New file.
+	* gcc.target/arm/aapcs/neon-vect1.c: New test.
+	* gcc.target/arm/aapcs/neon-vect2.c: New test.
+	* gcc.target/arm/aapcs/neon-vect3.c: New test.
+	* gcc.target/arm/aapcs/neon-vect4.c: New test.
+	* gcc.target/arm/aapcs/neon-vect5.c: New test.
+	* gcc.target/arm/aapcs/neon-vect6.c: New test.
+	* gcc.target/arm/aapcs/neon-vect7.c: New test.
+	* gcc.target/arm/aapcs/neon-vect8.c: New test.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2012-03-06 13:24:25 +0000
++++ new/gcc/config/arm/arm.c	2012-03-08 15:46:42 +0000
+@@ -4331,6 +4331,11 @@
+ 	  (TARGET_VFP_DOUBLE || !is_double));
+ }
+ 
++/* Return true if an argument whose type is TYPE, or mode is MODE, is
++   suitable for passing or returning in VFP registers for the PCS
++   variant selected.  If it is, then *BASE_MODE is updated to contain
++   a machine mode describing each element of the argument's type and
++   *COUNT to hold the number of such elements.  */
+ static bool
+ aapcs_vfp_is_call_or_return_candidate (enum arm_pcs pcs_variant,
+ 				       enum machine_mode mode, const_tree type,
+@@ -4338,9 +4343,20 @@
+ {
+   enum machine_mode new_mode = VOIDmode;
+ 
+-  if (GET_MODE_CLASS (mode) == MODE_FLOAT
+-      || GET_MODE_CLASS (mode) == MODE_VECTOR_INT
+-      || GET_MODE_CLASS (mode) == MODE_VECTOR_FLOAT)
++  /* If we have the type information, prefer that to working things
++     out from the mode.  */
++  if (type)
++    {
++      int ag_count = aapcs_vfp_sub_candidate (type, &new_mode);
++
++      if (ag_count > 0 && ag_count <= 4)
++	*count = ag_count;
++      else
++	return false;
++    }
++  else if (GET_MODE_CLASS (mode) == MODE_FLOAT
++	   || GET_MODE_CLASS (mode) == MODE_VECTOR_INT
++	   || GET_MODE_CLASS (mode) == MODE_VECTOR_FLOAT)
+     {
+       *count = 1;
+       new_mode = mode;
+@@ -4350,15 +4366,6 @@
+       *count = 2;
+       new_mode = (mode == DCmode ? DFmode : SFmode);
+     }
+-  else if (type && (mode == BLKmode || TREE_CODE (type) == VECTOR_TYPE))
+-    {
+-      int ag_count = aapcs_vfp_sub_candidate (type, &new_mode);
+-
+-      if (ag_count > 0 && ag_count <= 4)
+-	*count = ag_count;
+-      else
+-	return false;
+-    }
+   else
+     return false;
+ 
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/abitest.h'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/abitest.h	2009-08-06 17:15:19 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/abitest.h	2012-03-01 09:33:24 +0000
+@@ -1,3 +1,4 @@
++
+ #define IN_FRAMEWORK
+ 
+ #ifdef VFP
+@@ -10,6 +11,13 @@
+ #define D6	48
+ #define D7	56
+ 
++#ifdef NEON
++#define Q0      D0
++#define Q1      D2
++#define Q2      D4
++#define Q3      D6
++#endif
++
+ #define S0	64
+ #define S1	68
+ #define S2	72
+@@ -27,24 +35,19 @@
+ #define S14	120
+ #define S15	124
+ 
+-#define R0	128
+-#define R1	132
+-#define R2	136
+-#define R3	140
+-
+-#define STACK	144
+-
++#define CORE_REG_START 128
+ #else
+-
+-#define R0	0
+-#define R1	4
+-#define R2	8
+-#define R3	12
+-
+-#define STACK   16
+-
++#define CORE_REG_START 0
+ #endif
+ 
++#define R0	CORE_REG_START
++#define R1	(R0 + 4)
++#define R2	(R1 + 4)
++#define R3	(R2 + 4)
++#define STACK	(R3 + 4)
++
++
++
+ extern void abort (void);
+ 
+ __attribute__((naked))  void dumpregs () __asm("myfunc");
+
+=== added file 'gcc/testsuite/gcc.target/arm/aapcs/neon-constants.h'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/neon-constants.h	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/neon-constants.h	2012-03-01 09:33:24 +0000
+@@ -0,0 +1,33 @@
++
++
++#include "arm_neon.h"
++
++const int32x4_t i32x4_constvec1 = { 1101, 1102, 1103, 1104};
++const int32x4_t i32x4_constvec2 = { 2101, 2102, 2103, 2104};
++
++#define ELEM(INDEX) .val[INDEX]
++
++const int32x4x2_t i32x4x2_constvec1 =   {ELEM(0) = {0xaddebccb,11,12,13}, 
++					 ELEM(1) = {14, 15, 16, 17} };
++
++const int32x4x2_t i32x4x2_constvec2 = { ELEM(0) = {0xaadebcca,11,12,13}, 
++			                ELEM(1) = {140, 15, 16, 17}};
++
++const int32x4x3_t i32x4x3_constvec1 = { ELEM(0) = {0xabbccdde,8, 9, 10},
++					ELEM(1) = {0xabcccdde, 26, 27, 28},
++			                ELEM(2) = {0xaccccddf, 29, 30, 31}};
++
++const int32x4x3_t i32x4x3_constvec2 = { ELEM(0) = {0xbccccdd0,8, 9, 10},
++					ELEM(1) = {0xbdfe1000, 26, 27, 28},
++			                ELEM(2) = {0xaccccddf, 29, 30, 31}};
++const float32x4x2_t f32x4x2_constvec1 =
++  { ELEM(0) = { 7.101f, 0.201f, 0.301f, 0.401f} ,
++    ELEM(1) = { 8.101f, 0.501f, 0.601f, 0.701f} };
++
++const float32x4x2_t f32x4x2_constvec2 = 
++  { ELEM(0) = { 11.99f , 11.21f, 1.27f, 8.74f},
++    ELEM(1) = { 13.45f , 1.23f ,1.24f, 1.26f}};
++
++const int32x2_t i32x2_constvec1 = { 1283, 1345 };
++const int32x2x2_t i32x2x2_constvec1 = { ELEM(0) = { 0xabcdefab, 32 },
++					ELEM(1) = { 0xabcdefbc, 33 }};
+
+=== added file 'gcc/testsuite/gcc.target/arm/aapcs/neon-vect1.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/neon-vect1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/neon-vect1.c	2012-03-01 09:33:24 +0000
+@@ -0,0 +1,27 @@
++/* Test AAPCS layout (VFP variant for Neon types) */
++
++/* { dg-do run { target arm*-*-*eabi* } } */
++/* { dg-require-effective-target arm_hard_vfp_ok  } */
++/* { dg-require-effective-target arm_neon_ok  } */
++/* { dg-require-effective-target arm32 } */
++/* { dg-add-options arm_neon } */
++
++
++#ifndef IN_FRAMEWORK
++#define VFP
++#define NEON
++#define TESTFILE "neon-vect1.c"
++#include "neon-constants.h"
++
++
++#include "abitest.h"
++#else
++
++ARG(int32x4_t, i32x4_constvec2, Q0) /* D0, D1 */
++ARG(float, 3.0f, S4) /* D2, Q1 */
++ARG(int32x4x2_t, i32x4x2_constvec1, Q2) /* Q2, Q3 - D4-D6 , s5-s12 */
++ARG(double, 12.0, D3) /* Backfill this particular argument.  */
++ARG(int32x4x2_t, i32x4x2_constvec2, STACK) 
++ARG(float, 5.0f, STACK+sizeof(int32x4x2_t)) /* No backfill allowed.  */
++LAST_ARG(int, 3, R0)
++#endif
+
+=== added file 'gcc/testsuite/gcc.target/arm/aapcs/neon-vect2.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/neon-vect2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/neon-vect2.c	2012-03-01 09:33:24 +0000
+@@ -0,0 +1,23 @@
++/* Test AAPCS layout (VFP variant for Neon types) */
++
++/* { dg-do run { target arm*-*-*eabi* } } */
++/* { dg-require-effective-target arm_hard_vfp_ok } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-require-effective-target arm32 } */
++/* { dg-add-options arm_neon } */
++
++
++#ifndef IN_FRAMEWORK
++#define VFP
++#define NEON
++#define TESTFILE "neon-vect2.c"
++#include "neon-constants.h"
++
++
++#include "abitest.h"
++#else
++
++ARG(int32x4_t, i32x4_constvec2, Q0) /* D0, D1.  */
++ARG(float, 3.0f, S4) /* D2, Q1 occupied.  */
++LAST_ARG(int, 3, R0)
++#endif
+
+=== added file 'gcc/testsuite/gcc.target/arm/aapcs/neon-vect3.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/neon-vect3.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/neon-vect3.c	2012-03-01 09:33:24 +0000
+@@ -0,0 +1,26 @@
++/* Test AAPCS layout (VFP variant for Neon types) */
++
++/* { dg-do run { target arm*-*-*eabi* } } */
++/* { dg-require-effective-target arm_hard_vfp_ok } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-require-effective-target arm32 } */
++/* { dg-add-options arm_neon } */
++
++
++#ifndef IN_FRAMEWORK
++#define VFP
++#define NEON
++#define TESTFILE "neon-vect3.c"
++#include "neon-constants.h"
++
++
++#include "abitest.h"
++#else
++
++ARG(int32x4_t, i32x4_constvec2, Q0) /* D0, D1 */
++ARG(float, 3.0f, S4) /* D2, Q1 */
++ARG(int32x4x2_t, i32x4x2_constvec1, Q2) /* Q2, Q3 - D4-D6 , s5-s12 */
++ARG(int32x4x2_t, i32x4x2_constvec2, STACK) 
++ARG(double, 11.0, STACK+sizeof(int32x4x2_t)) /* No backfill in D3.  */
++LAST_ARG(int, 3, R0)
++#endif
+
+=== added file 'gcc/testsuite/gcc.target/arm/aapcs/neon-vect4.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/neon-vect4.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/neon-vect4.c	2012-03-01 09:33:24 +0000
+@@ -0,0 +1,27 @@
++/* Test AAPCS layout (VFP variant for Neon types) */
++
++/* { dg-do run { target arm*-*-*eabi* } } */
++/* { dg-require-effective-target arm_hard_vfp_ok  } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-require-effective-target arm32 } */
++/* { dg-add-options arm_neon } */
++
++
++#ifndef IN_FRAMEWORK
++#define VFP
++#define NEON
++#define TESTFILE "neon-vect4.c"
++#include "neon-constants.h"
++
++
++#include "abitest.h"
++#else
++
++ARG(int32x4_t, i32x4_constvec2, Q0) /* D0, D1 */
++ARG(float, 3.0f, S4) /* D2, Q1 */
++ARG(int32x4x2_t, i32x4x2_constvec1, Q2) /* Q2, Q3 - D4-D6 , s5-s12 */
++ARG(double, 12.0, D3) /* Backfill this particular argument.  */
++ARG(float, 5.0f, S5) /* Backfill in S5.  */
++ARG(int32x4x2_t, i32x4x2_constvec2, STACK) 
++LAST_ARG(int, 3, R0)
++#endif
+
+=== added file 'gcc/testsuite/gcc.target/arm/aapcs/neon-vect5.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/neon-vect5.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/neon-vect5.c	2012-03-01 09:33:24 +0000
+@@ -0,0 +1,28 @@
++/* Test AAPCS layout (VFP variant for Neon types) */
++
++/* { dg-do run { target arm*-*-*eabi* } } */
++/* { dg-require-effective-target arm_hard_vfp_ok } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-require-effective-target arm32 } */
++/* { dg-add-options arm_neon } */
++
++
++#ifndef IN_FRAMEWORK
++#define VFP
++#define NEON
++#define TESTFILE "neon-vect5.c"
++#include "neon-constants.h"
++
++
++#include "abitest.h"
++#else
++
++ARG(int32x4_t, i32x4_constvec2, Q0) /* D0, D1 */
++ARG(float, 3.0f, S4) /* D2, Q1 */
++ARG(float32x4x2_t, f32x4x2_constvec1, Q2) /* Q2, Q3 - D4-D6 , s5-s12 */
++ARG(double, 12.0, D3) /* Backfill this particular argument.  */
++ARG(int32x4x2_t, i32x4x2_constvec2, STACK) 
++ARG(float, 5.0f, STACK+sizeof(int32x4x2_t)) /* No backfill allowed.  */
++LAST_ARG(int, 3, R0)
++
++#endif
+
+=== added file 'gcc/testsuite/gcc.target/arm/aapcs/neon-vect6.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/neon-vect6.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/neon-vect6.c	2012-03-01 09:33:24 +0000
+@@ -0,0 +1,24 @@
++/* Test AAPCS layout (VFP variant for Neon types) */
++
++/* { dg-do run { target arm*-*-*eabi* } } */
++/* { dg-require-effective-target arm_hard_vfp_ok } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-require-effective-target arm32 } */
++/* { dg-add-options arm_neon } */
++
++
++#ifndef IN_FRAMEWORK
++#define VFP
++#define NEON
++#define TESTFILE "neon-vect6.c"
++#include "neon-constants.h"
++
++
++#include "abitest.h"
++#else
++
++ARG(int32x4_t, i32x4_constvec2, Q0) /* D0, D1 */
++ARG(int32x4x3_t, i32x4x3_constvec1, Q1) /* Q1, Q2, Q3  */
++ARG(int32x4x3_t, i32x4x3_constvec2, STACK)
++LAST_ARG(int, 3, R0)
++#endif
+
+=== added file 'gcc/testsuite/gcc.target/arm/aapcs/neon-vect7.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/neon-vect7.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/neon-vect7.c	2012-03-01 09:33:24 +0000
+@@ -0,0 +1,27 @@
++/* Test AAPCS layout (VFP variant for Neon types) */
++
++/* { dg-do run { target arm*-*-*eabi* } } */
++/* { dg-require-effective-target arm_hard_vfp_ok } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-require-effective-target arm32 } */
++/* { dg-add-options arm_neon } */
++
++
++#ifndef IN_FRAMEWORK
++#define VFP
++#define NEON
++#define TESTFILE "neon-vect7.c"
++#include "neon-constants.h"
++
++
++#include "abitest.h"
++#else
++
++ARG(float, 24.3f, S0) /* S0 , D0, Q0 */
++ARG(int32x4x3_t, i32x4x3_constvec1, Q1) /* Q1, Q2, Q3  */
++ARG(double, 25.6, D1)
++ARG(float, 12.67f, S1)
++ARG(int32x4x3_t, i32x4x3_constvec2, STACK)
++ARG(double, 2.47, STACK+sizeof(int32x4x3_t))
++LAST_ARG(int, 3, R0)
++#endif
+
+=== added file 'gcc/testsuite/gcc.target/arm/aapcs/neon-vect8.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/neon-vect8.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/neon-vect8.c	2012-03-01 09:33:24 +0000
+@@ -0,0 +1,27 @@
++/* Test AAPCS layout (VFP variant for Neon types) */
++
++/* { dg-do run { target arm*-*-*eabi* } } */
++/* { dg-require-effective-target arm_hard_vfp_ok } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-require-effective-target arm32 } */
++/* { dg-add-options arm_neon } */
++
++
++#ifndef IN_FRAMEWORK
++#define VFP
++#define NEON
++#define TESTFILE "neon-vect8.c"
++#include "neon-constants.h"
++
++
++#include "abitest.h"
++#else
++
++ARG(float, 24.3f, S0) /* S0 , D0, Q0 */
++ARG(int32x2_t, i32x2_constvec1, D1) /* D1  */
++ARG(double, 25.6, D2)
++ARG(float, 12.67f, S1)
++ARG(int32x4x3_t, i32x4x3_constvec2, STACK)
++ARG(double, 2.47, STACK+sizeof(int32x4x3_t))
++LAST_ARG(int, 3, R0)
++#endif
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp1.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp1.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp1.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp10.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp10.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp10.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp11.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp11.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp11.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp12.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp12.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp12.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp13.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp13.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp13.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp14.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp14.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp14.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp15.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp15.c	2009-08-06 17:15:19 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp15.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp16.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp16.c	2009-08-06 17:15:19 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp16.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp17.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp17.c	2009-08-06 17:15:19 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp17.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp2.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp2.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp2.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp3.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp3.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp3.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp4.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp4.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp4.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp5.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp5.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp5.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp6.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp6.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp6.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp7.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp7.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp7.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp8.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp8.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp8.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
+=== modified file 'gcc/testsuite/gcc.target/arm/aapcs/vfp9.c'
+--- old/gcc/testsuite/gcc.target/arm/aapcs/vfp9.c	2009-08-06 13:27:45 +0000
++++ new/gcc/testsuite/gcc.target/arm/aapcs/vfp9.c	2012-03-01 09:33:24 +0000
+@@ -1,6 +1,6 @@
+ /* Test AAPCS layout (VFP variant) */
+ 
+-/* { dg-do run { target arm*-*-eabi* } } */
++/* { dg-do run { target arm*-*-*eabi* } } */
+ /* { dg-require-effective-target arm_hard_vfp_ok } */
+ /* { dg-require-effective-target arm32 } */
+ /* { dg-options "-O -mfpu=vfp -mfloat-abi=hard" } */
+
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106882.patch b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106882.patch
new file mode 100644
index 0000000..7ac7645
--- /dev/null
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106882.patch
@@ -0,0 +1,53 @@
+2012-03-26  Ulrich Weigand  <ulrich.weigand@linaro.org>
+
+	LP 960283
+	LP 960274
+	LP 960817
+
+	Backport from mainline:
+
+	gcc/
+	PR tree-optimization/52686
+	* tree-vect-data-refs.c (vect_get_smallest_scalar_type): Handle
+	WIDEN_LSHIFT_EXPR.
+
+	gcc/testsuite/
+	PR tree-optimization/52686
+	* gcc.target/arm/pr52686.c: New test.
+
+=== added file 'gcc/testsuite/gcc.target/arm/pr52686.c'
+--- old/gcc/testsuite/gcc.target/arm/pr52686.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/pr52686.c	2012-03-23 16:26:22 +0000
+@@ -0,0 +1,19 @@
++/* PR target/52375 */
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-options "-march=armv7-a -mfloat-abi=softfp -mfpu=neon -O -ftree-vectorize" } */
++
++unsigned int output[4];
++
++void test (unsigned short *p)
++{
++  unsigned int x = *p;
++  if (x)
++    {
++      output[0] = x << 1;
++      output[1] = x << 1;
++      output[2] = x << 1;
++      output[3] = x << 1;
++    }
++}
++
+
+=== modified file 'gcc/tree-vect-data-refs.c'
+--- old/gcc/tree-vect-data-refs.c	2012-01-05 15:35:39 +0000
++++ new/gcc/tree-vect-data-refs.c	2012-03-23 16:26:22 +0000
+@@ -111,6 +111,7 @@
+   if (is_gimple_assign (stmt)
+       && (gimple_assign_cast_p (stmt)
+           || gimple_assign_rhs_code (stmt) == WIDEN_MULT_EXPR
++          || gimple_assign_rhs_code (stmt) == WIDEN_LSHIFT_EXPR
+           || gimple_assign_rhs_code (stmt) == FLOAT_EXPR))
+     {
+       tree rhs_type = TREE_TYPE (gimple_assign_rhs1 (stmt));
+
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/toolchain-layer/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
index 2434fb3..bfff69f 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
@@ -93,4 +93,9 @@ file://linaro/gcc-4.6-linaro-r106872.patch \
 file://linaro/gcc-4.6-linaro-r106873.patch \
 file://linaro/gcc-4.6-linaro-r106874.patch \
 file://linaro/fix_linaro_106872.patch \
+file://linaro/gcc-4.6-linaro-r106876.patch \
+file://linaro/gcc-4.6-linaro-r106877.patch \
+file://linaro/gcc-4.6-linaro-r106878.patch \
+file://linaro/gcc-4.6-linaro-r106879.patch \
+file://linaro/gcc-4.6-linaro-r106882.patch \
 "
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-common-4.6.inc b/toolchain-layer/recipes-devtools/gcc/gcc-common-4.6.inc
index 6950797..cbb90e9 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-common-4.6.inc
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-common-4.6.inc
@@ -1,4 +1,4 @@
 # this will prepend this layer to FILESPATH
 FILESEXTRAPATHS := "${THISDIR}/gcc-4.6"
-PRINC = "5"
+PRINC = "6"
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.5.4



