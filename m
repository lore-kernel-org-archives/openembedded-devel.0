Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PckNL-0006Pw-S4
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 20:59:32 +0100
Received: by ywi6 with SMTP id 6so8446840ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 11:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=TkmWcpunbEnXhnJXuMcBRFlIU5KdDLeL0R8lif5G3S0=;
	b=dDAfSc7l+EQi2LG15msUQNnWCuC/qXkPEYU9N2JdWUbbGF+zSoNpBwom9iDmi4i8xN
	AqSppBVsQkaV47aswMPuv2r9T1tkYeawEu18wV3w6T8yqaynRyK7Ct7fHKC4YD33XCqt
	NiTWUJ/hzWJNGXMtrQ4af24UTpkvG1+omX5Pw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Knfm0vCiwr8J32SpmEjfQ0V+3t452IJPfUQvjXroBx9DxFWPZsYagzRlahnCgTAR2h
	zfUwmIYp5YZcNWkt3dgNjXdl9A6X+W2wXr1K/h0LaNb4XPC2X3Mqht4Dd7foc+03j9kz
	p02ZVUSTRLM3Z4RJKqSCiTaltLCc1yIX+DGeU=
Received: by 10.150.49.8 with SMTP id w8mr742115ybw.181.1294775936168;
	Tue, 11 Jan 2011 11:58:56 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 3sm18176170yhl.0.2011.01.11.11.58.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 11:58:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 11:58:41 -0800
Message-Id: <1294775921-25696-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] gcc-4.5: Get few more fixes from linaro and upstream gcc-4_5-branch
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
X-List-Received-Date: Tue, 11 Jan 2011 19:59:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-4.5.inc                            |   16 +-
 .../gcc/gcc-4.5/gcc-arm-qihi-split-PR46883.patch   |   52 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99414.patch |   36 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch |  147 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch |   34 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch |  104 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch |   45 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch |  201 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch |   72 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch |   46 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch |   65 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch | 3163 +++++++++++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch | 4236 ++++++++++++++++++++
 13 files changed, 8125 insertions(+), 92 deletions(-)
 delete mode 100644 recipes/gcc/gcc-4.5/gcc-arm-qihi-split-PR46883.patch
 delete mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99414.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch

diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
index 377496d..3b8dd4b 100644
--- a/recipes/gcc/gcc-4.5.inc
+++ b/recipes/gcc/gcc-4.5.inc
@@ -8,9 +8,9 @@ DEPENDS = "mpfr gmp libmpc libelf"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 
-INC_PR = "r28"
+INC_PR = "r29"
 
-SRCREV = "167948"
+SRCREV = "168622"
 PV = "4.5"
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
@@ -130,7 +130,6 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
 	   file://linaro/gcc-4.5-linaro-r99411.patch \
 	   file://linaro/gcc-4.5-linaro-r99412.patch \
 	   file://linaro/gcc-4.5-linaro-r99413.patch \
-	   file://linaro/gcc-4.5-linaro-r99414.patch \
 	   file://linaro/gcc-4.5-linaro-r99415.patch \
 	   file://linaro/gcc-4.5-linaro-r99416.patch \
 	   file://linaro/gcc-4.5-linaro-r99417.patch \
@@ -155,8 +154,17 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
 	   file://linaro/gcc-4.5-linaro-r99442.patch \
 	   file://linaro/gcc-4.5-linaro-r99443.patch \
 	   file://linaro/gcc-4.5-linaro-r99444.patch \
+	   file://linaro/gcc-4.5-linaro-r99448.patch \
+	   file://linaro/gcc-4.5-linaro-r99449.patch \
+	   file://linaro/gcc-4.5-linaro-r99450.patch \
+	   file://linaro/gcc-4.5-linaro-r99451.patch \
+	   file://linaro/gcc-4.5-linaro-r99452.patch \
+	   file://linaro/gcc-4.5-linaro-r99453.patch \
+	   file://linaro/gcc-4.5-linaro-r99454.patch \
+	   file://linaro/gcc-4.5-linaro-r99455.patch \
+	   file://linaro/gcc-4.5-linaro-r99456.patch \
+#	   file://linaro/gcc-4.5-linaro-r99457.patch \
 	   file://gcc-scalar-widening-pr45847.patch \
-	   file://gcc-arm-qihi-split-PR46883.patch \
 	   file://gcc-arm-volatile-bitfield-fix.patch \
 	  "
 
diff --git a/recipes/gcc/gcc-4.5/gcc-arm-qihi-split-PR46883.patch b/recipes/gcc/gcc-4.5/gcc-arm-qihi-split-PR46883.patch
deleted file mode 100644
index 2cb5635..0000000
--- a/recipes/gcc/gcc-4.5/gcc-arm-qihi-split-PR46883.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Backport of http://gcc.gnu.org/ml/gcc-patches/2010-12/msg01096.html
-This should fix the ICE found in samba
-
--Khem
-
-Index: a/gcc/config/arm/arm.md
-===================================================================
---- a/gcc/config/arm/arm.md	(revision 167797)
-+++ b/gcc/config/arm/arm.md	(working copy)
-@@ -4137,8 +4137,8 @@
- })
- 
- (define_split
--  [(set (match_operand:SI 0 "register_operand" "")
--	(zero_extend:SI (match_operand:HI 1 "register_operand" "")))]
-+  [(set (match_operand:SI 0 "s_register_operand" "")
-+	(zero_extend:SI (match_operand:HI 1 "s_register_operand" "")))]
-   "!TARGET_THUMB2 && !arm_arch6"
-   [(set (match_dup 0) (ashift:SI (match_dup 2) (const_int 16)))
-    (set (match_dup 0) (lshiftrt:SI (match_dup 0) (const_int 16)))]
-@@ -4244,8 +4244,8 @@
- })
- 
- (define_split
--  [(set (match_operand:SI 0 "register_operand" "")
--	(zero_extend:SI (match_operand:QI 1 "register_operand" "")))]
-+  [(set (match_operand:SI 0 "s_register_operand" "")
-+	(zero_extend:SI (match_operand:QI 1 "s_register_operand" "")))]
-   "!arm_arch6"
-   [(set (match_dup 0) (ashift:SI (match_dup 2) (const_int 24)))
-    (set (match_dup 0) (lshiftrt:SI (match_dup 0) (const_int 24)))]
-Index: a/gcc/testsuite/gcc.target/arm/pr46883.c
-===================================================================
---- a/gcc/testsuite/gcc.target/arm/pr46883.c	(revision 0)
-+++ b/gcc/testsuite/gcc.target/arm/pr46883.c	(revision 0)
-@@ -0,0 +1,16 @@
-+/* { dg-do compile } */
-+/* { dg-options "-O1 -march=armv5te" } */
-+
-+void bar (unsigned char *q, unsigned short *data16s, int len)
-+{
-+  int i;
-+
-+  for (i = 0; i < len; i++)
-+    {
-+      q[2 * i] =
-+        (((data16s[i] & 0xFF) << 8) | ((data16s[i] >> 8) & 0xFF)) & 0xFF;
-+      q[2 * i + 1] =
-+        ((unsigned short)
-+         (((data16s[i] & 0xFF) << 8) | ((data16s[i] >> 8) & 0xFF))) >> 8;
-+    }
-+}
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99414.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99414.patch
deleted file mode 100644
index 648ea5f..0000000
--- a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99414.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-2010-10-15  Yao Qi  <yao@codesourcery.com>
-
-	Backport from mainline:
-
-	2010-10-14  Yao Qi  <yao@codesourcery.com>
-
-	gcc/
-        PR target/45447
-        * config/arm/arm.c (arm_build_builtin_va_list): Assign
-        va_list_name to TYPE_STUB_DECL (va_list_type).
-
-	gcc/testsuite/
-	PR target/45447
-        * gcc.target/arm/pr45447.c: New test.
-
-=== modified file 'gcc/config/arm/arm.c'
-Index: gcc-4.5/gcc/config/arm/arm.c
-===================================================================
---- gcc-4.5.orig/gcc/config/arm/arm.c
-+++ gcc-4.5/gcc/config/arm/arm.c
-@@ -1166,6 +1166,7 @@ arm_build_builtin_va_list (void)
- 			     va_list_type);
-   DECL_ARTIFICIAL (va_list_name) = 1;
-   TYPE_NAME (va_list_type) = va_list_name;
-+  TYPE_STUB_DECL (va_list_type) = va_list_name;
-   /* Create the __ap field.  */
-   ap_field = build_decl (BUILTINS_LOCATION,
- 			 FIELD_DECL, 
-Index: gcc-4.5/gcc/testsuite/gcc.target/arm/pr45447.c
-===================================================================
---- /dev/null
-+++ gcc-4.5/gcc/testsuite/gcc.target/arm/pr45447.c
-@@ -0,0 +1,3 @@
-+/* { dg-do compile } */
-+/* { dg-options "-g -femit-struct-debug-baseonly" } */
-+typedef __builtin_va_list x;
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch
new file mode 100644
index 0000000..9f3d47f
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch
@@ -0,0 +1,147 @@
+2010-12-13  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	Backport from mainline:
+
+	2010-12-10  Jakub Jelinek  <jakub@redhat.com>
+
+	PR rtl-optimization/46865
+
+	* rtl.c (rtx_equal_p_cb, rtx_equal_p): For last operand of
+	ASM_OPERANDS and ASM_INPUT if integers are different,
+	call locator_eq.
+	* jump.c (rtx_renumbered_equal_p): Likewise.
+
+	gcc/testsuite/
+	* gcc.target/i386/pr46865-1.c: New test.
+	* gcc.target/i386/pr46865-2.c: New test.
+
+=== modified file 'gcc/jump.c'
+--- old/gcc/jump.c	2009-11-25 10:55:54 +0000
++++ new/gcc/jump.c	2010-12-13 10:05:52 +0000
+@@ -1728,7 +1728,13 @@
+ 
+ 	case 'i':
+ 	  if (XINT (x, i) != XINT (y, i))
+-	    return 0;
++	    {
++	      if (((code == ASM_OPERANDS && i == 6)
++		   || (code == ASM_INPUT && i == 1))
++		  && locator_eq (XINT (x, i), XINT (y, i)))
++		break;
++	      return 0;
++	    }
+ 	  break;
+ 
+ 	case 't':
+
+=== modified file 'gcc/rtl.c'
+--- old/gcc/rtl.c	2009-11-25 10:55:54 +0000
++++ new/gcc/rtl.c	2010-12-13 10:05:52 +0000
+@@ -429,7 +429,15 @@
+ 	case 'n':
+ 	case 'i':
+ 	  if (XINT (x, i) != XINT (y, i))
+-	    return 0;
++	    {
++#ifndef GENERATOR_FILE
++	      if (((code == ASM_OPERANDS && i == 6)
++		   || (code == ASM_INPUT && i == 1))
++		  && locator_eq (XINT (x, i), XINT (y, i)))
++		break;
++#endif
++	      return 0;
++	    }
+ 	  break;
+ 
+ 	case 'V':
+@@ -549,7 +557,15 @@
+ 	case 'n':
+ 	case 'i':
+ 	  if (XINT (x, i) != XINT (y, i))
+-	    return 0;
++	    {
++#ifndef GENERATOR_FILE
++	      if (((code == ASM_OPERANDS && i == 6)
++		   || (code == ASM_INPUT && i == 1))
++		  && locator_eq (XINT (x, i), XINT (y, i)))
++		break;
++#endif
++	      return 0;
++	    }
+ 	  break;
+ 
+ 	case 'V':
+
+=== added file 'gcc/testsuite/gcc.target/i386/pr46865-1.c'
+--- old/gcc/testsuite/gcc.target/i386/pr46865-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/i386/pr46865-1.c	2010-12-13 10:05:52 +0000
+@@ -0,0 +1,31 @@
++/* PR rtl-optimization/46865 */
++/* { dg-do compile } */
++/* { dg-options "-O2" } */
++
++extern unsigned long f;
++
++#define m1(f)							\
++  if (f & 1)							\
++    asm volatile ("nop /* asmnop */\n");			\
++  else								\
++    asm volatile ("nop /* asmnop */\n");
++
++#define m2(f)							\
++  if (f & 1)							\
++    asm volatile ("nop /* asmnop */\n" : : "i" (6) : "cx");	\
++  else								\
++    asm volatile ("nop /* asmnop */\n" : : "i" (6) : "cx");
++
++void
++foo (void)
++{
++  m1 (f);
++}
++
++void
++bar (void)
++{
++  m2 (f);
++}
++
++/* { dg-final { scan-assembler-times "asmnop" 2 } } */
+
+=== added file 'gcc/testsuite/gcc.target/i386/pr46865-2.c'
+--- old/gcc/testsuite/gcc.target/i386/pr46865-2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/i386/pr46865-2.c	2010-12-13 10:05:52 +0000
+@@ -0,0 +1,32 @@
++/* PR rtl-optimization/46865 */
++/* { dg-do compile } */
++/* { dg-options "-O2 -save-temps" } */
++
++extern unsigned long f;
++
++#define m1(f)							\
++  if (f & 1)							\
++    asm volatile ("nop /* asmnop */\n");			\
++  else								\
++    asm volatile ("nop /* asmnop */\n");
++
++#define m2(f)							\
++  if (f & 1)							\
++    asm volatile ("nop /* asmnop */\n" : : "i" (6) : "cx");	\
++  else								\
++    asm volatile ("nop /* asmnop */\n" : : "i" (6) : "cx");
++
++void
++foo (void)
++{
++  m1 (f);
++}
++
++void
++bar (void)
++{
++  m2 (f);
++}
++
++/* { dg-final { scan-assembler-times "asmnop" 2 } } */
++/* { dg-final { cleanup-saved-temps } } */
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch
new file mode 100644
index 0000000..e6b0fad
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99449.patch
@@ -0,0 +1,34 @@
+2010-12-21  Ulrich Weigand  <uweigand@de.ibm.com>
+
+	LP: #617384
+	Backport from mainline:
+
+	gcc/
+	* config/arm/arm.c (require_pic_register): Set INSN_LOCATOR for all
+	instructions injected into the prologue to prologue_locator.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2010-12-10 15:34:19 +0000
++++ new/gcc/config/arm/arm.c	2010-12-21 14:13:38 +0000
+@@ -5080,7 +5080,7 @@
+ 	}
+       else
+ 	{
+-	  rtx seq;
++	  rtx seq, insn;
+ 
+ 	  if (!cfun->machine->pic_reg)
+ 	    cfun->machine->pic_reg = gen_reg_rtx (Pmode);
+@@ -5097,6 +5097,11 @@
+ 
+ 	      seq = get_insns ();
+ 	      end_sequence ();
++
++	      for (insn = seq; insn; insn = NEXT_INSN (insn))
++		if (INSN_P (insn))
++		  INSN_LOCATOR (insn) = prologue_locator;
++
+ 	      /* We can be called during expansion of PHI nodes, where
+ 	         we can't yet emit instructions directly in the final
+ 		 insn stream.  Queue the insns on the entry edge, they will
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch
new file mode 100644
index 0000000..49fa07f
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99450.patch
@@ -0,0 +1,104 @@
+ 2010-12-21  Ulrich Weigand  <uweigand@de.ibm.com>
+ 
+	LP: #662324
+	Backport from mainline:
+
+	2010-12-17  Dodji Seketeli  <dodji@redhat.com>
+
+	gcc/
+	* dwarf2out.c (gen_type_die_with_usage): Do not try to emit debug
+	info for a redundant typedef that has DECL_ORIGINAL_TYPE set. Use
+	that underlying type instead.
+
+	gcc/testsuite/
+	* g++.dg/debug/dwarf2/self-ref-1.C: New test.
+	* g++.dg/debug/dwarf2/self-ref-2.C: Likewise.
+
+=== modified file 'gcc/dwarf2out.c'
+--- old/gcc/dwarf2out.c	2010-10-04 00:50:43 +0000
++++ new/gcc/dwarf2out.c	2010-12-21 18:46:10 +0000
+@@ -18993,6 +18993,16 @@
+   if (type == NULL_TREE || type == error_mark_node)
+     return;
+ 
++  if (TYPE_NAME (type) != NULL_TREE
++      && TREE_CODE (TYPE_NAME (type)) == TYPE_DECL
++      && is_redundant_typedef (TYPE_NAME (type))
++      && DECL_ORIGINAL_TYPE (TYPE_NAME (type)))
++    /* The DECL of this type is a typedef we don't want to emit debug
++       info for but we want debug info for its underlying typedef.
++       This can happen for e.g, the injected-class-name of a C++
++       type.  */
++    type = DECL_ORIGINAL_TYPE (TYPE_NAME (type));
++
+   /* If TYPE is a typedef type variant, let's generate debug info
+      for the parent typedef which TYPE is a type of.  */
+   if (TYPE_NAME (type) && TREE_CODE (TYPE_NAME (type)) == TYPE_DECL
+
+=== added file 'gcc/testsuite/g++.dg/debug/dwarf2/self-ref-1.C'
+--- old/gcc/testsuite/g++.dg/debug/dwarf2/self-ref-1.C	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/g++.dg/debug/dwarf2/self-ref-1.C	2010-12-21 18:46:10 +0000
+@@ -0,0 +1,28 @@
++// Origin: PR debug/45088
++// { dg-do compile }
++// { dg-options "-g -dA" }
++// { dg-final { scan-assembler-times "\[^\n\r\]*\\(DIE\[^\n\r\]*DW_TAG_pointer_type\\)\[\n\r\]{1,2}\[^\n\r\]*DW_AT_byte_size\[\n\r\]{1,2}\[^\n\r\]*DW_AT_type" 4 } }
++
++struct A
++{
++    virtual ~A();
++};
++
++struct B : public A
++{
++    virtual ~B(){}
++};
++
++struct C : public B
++{
++    A* a1;
++};
++
++int
++main()
++{
++    C c;
++    c.a1 = 0;
++    return 0;
++}
++
+
+=== added file 'gcc/testsuite/g++.dg/debug/dwarf2/self-ref-2.C'
+--- old/gcc/testsuite/g++.dg/debug/dwarf2/self-ref-2.C	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/g++.dg/debug/dwarf2/self-ref-2.C	2010-12-21 18:46:10 +0000
+@@ -0,0 +1,29 @@
++// Origin: PR debug/45088
++// { dg-do compile }
++// { dg-options "-g -dA" }
++// { dg-final { scan-assembler-times "\[^\n\r\]*\\(DIE\[^\n\r\]*DW_TAG_pointer_type\\)\[\n\r\]{1,2}\[^\n\r\]*DW_AT_byte_size\[\n\r\]{1,2}\[^\n\r\]*DW_AT_type" 4 } }
++
++template<class T>
++struct A
++{
++    virtual ~A();
++};
++
++struct B : public A<int>
++{
++    virtual ~B(){}
++};
++
++struct C : public B
++{
++    A<int>* a1;
++};
++
++int
++main()
++{
++    C c;
++    c.a1 = 0;
++    return 0;
++}
++
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch
new file mode 100644
index 0000000..d87c312
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99451.patch
@@ -0,0 +1,45 @@
+2010-12-22  Ulrich Weigand  <uweigand@de.ibm.com>
+
+	LP: #693425
+	Backport from mainline:
+
+	gcc/
+	* config/spu/spu.md ("mov<mode>"): Use nonimmediate_operand
+	predicate for destination operand.
+	* config/spu/spu.c (spu_expand_mov): If move destination is an
+	invalid subreg, perform move in the subreg's inner mode instead.
+
+=== modified file 'gcc/config/spu/spu.c'
+--- old/gcc/config/spu/spu.c	2010-08-04 09:53:04 +0000
++++ new/gcc/config/spu/spu.c	2010-12-22 15:20:44 +0000
+@@ -4572,7 +4572,13 @@
+ spu_expand_mov (rtx * ops, enum machine_mode mode)
+ {
+   if (GET_CODE (ops[0]) == SUBREG && !valid_subreg (ops[0]))
+-    abort ();
++    {
++      /* Perform the move in the destination SUBREG's inner mode.  */
++      ops[0] = SUBREG_REG (ops[0]);
++      mode = GET_MODE (ops[0]);
++      ops[1] = gen_lowpart_common (mode, ops[1]);
++      gcc_assert (ops[1]);
++    }
+ 
+   if (GET_CODE (ops[1]) == SUBREG && !valid_subreg (ops[1]))
+     {
+
+=== modified file 'gcc/config/spu/spu.md'
+--- old/gcc/config/spu/spu.md	2009-05-23 01:28:14 +0000
++++ new/gcc/config/spu/spu.md	2010-12-22 15:20:44 +0000
+@@ -269,8 +269,8 @@
+ ;; mov
+ 
+ (define_expand "mov<mode>"
+-  [(set (match_operand:ALL 0 "spu_nonimm_operand" "=r,r,r,m")
+-	(match_operand:ALL 1 "general_operand" "r,i,m,r"))]
++  [(set (match_operand:ALL 0 "nonimmediate_operand" "")
++	(match_operand:ALL 1 "general_operand" ""))]
+   ""
+   {
+     if (spu_expand_mov(operands, <MODE>mode))
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch
new file mode 100644
index 0000000..6cfc01f
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99452.patch
@@ -0,0 +1,201 @@
+2010-12-14  Sandra Loosemore  <sandra@codesourcery.com>
+
+	Backport from mainline:
+
+	2010-12-14  Jakub Jelinek  <jakub@redhat.com>
+
+	PR tree-optimization/46909
+
+	gcc/
+	* tree-ssa-ccp.c (and_var_with_comparison_1): Save partial
+	result even in the is_and case, if both partial results
+	are the same, return it.
+	(or_var_with_comparison_1): Use is_or predicate instead of
+	innercode == TRUTH_OR_EXPR test.  Save partial result
+	even in the is_or case, if both partial results are the
+	same, return it.  In the !is_or case when both partial
+	results are the same, return the partial result instead
+	of boolean_true_node.
+
+	gcc/testsuite/
+	* gcc.c-torture/execute/pr46909-1.c: New test.
+	* gcc.c-torture/execute/pr46909-2.c: New test.
+	* gcc.dg/pr46909.c: New test.
+
+=== added file 'gcc/testsuite/gcc.c-torture/execute/pr46909-1.c'
+--- old/gcc/testsuite/gcc.c-torture/execute/pr46909-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.c-torture/execute/pr46909-1.c	2011-01-05 11:27:00 +0000
+@@ -0,0 +1,22 @@
++/* PR tree-optimization/46909 */
++
++extern void abort ();
++
++int
++__attribute__ ((__noinline__))
++foo (unsigned int x)
++{
++  if (! (x == 4 || x == 6) || (x == 2 || x == 6))
++    return 1;
++  return -1;
++}
++
++int
++main ()
++{
++  int i;
++  for (i = -10; i < 10; i++)
++    if (foo (i) != 1 - 2 * (i == 4))
++      abort ();
++  return 0;
++}
+
+=== added file 'gcc/testsuite/gcc.c-torture/execute/pr46909-2.c'
+--- old/gcc/testsuite/gcc.c-torture/execute/pr46909-2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.c-torture/execute/pr46909-2.c	2011-01-05 11:27:00 +0000
+@@ -0,0 +1,22 @@
++/* PR tree-optimization/46909 */
++
++extern void abort (void);
++
++int
++__attribute__((noinline))
++foo (int x)
++{
++  if ((x != 0 && x != 13) || x == 5 || x == 20)
++    return 1;
++  return -1;
++}
++
++int
++main (void)
++{
++  int i;
++  for (i = -10; i < 30; i++)
++    if (foo (i) != 1 - 2 * (i == 0) - 2 * (i == 13))
++      abort ();
++  return 0;
++}
+
+=== added file 'gcc/testsuite/gcc.dg/pr46909.c'
+--- old/gcc/testsuite/gcc.dg/pr46909.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/pr46909.c	2011-01-05 11:27:00 +0000
+@@ -0,0 +1,17 @@
++/* PR tree-optimization/46909 */
++/* { dg-do compile } */
++/* { dg-options "-O2 -fdump-tree-ifcombine" } */
++
++extern void abort ();
++
++int
++__attribute__ ((__noinline__))
++foo (unsigned int x)
++{
++  if (! (x == 4 || x == 6) || (x == 2 || x == 6))
++    return 1;
++  return -1;
++}
++
++/* { dg-final { scan-tree-dump "optimizing two comparisons to x_\[0-9\]+\\(D\\) != 4" "ifcombine" } } */
++/* { dg-final { cleanup-tree-dump "ifcombine" } } */
+
+=== modified file 'gcc/tree-ssa-ccp.c'
+--- old/gcc/tree-ssa-ccp.c	2010-09-16 09:15:46 +0000
++++ new/gcc/tree-ssa-ccp.c	2011-01-05 11:27:00 +0000
+@@ -3508,14 +3508,11 @@
+ 	  /* Handle the OR case, where we are redistributing:
+ 	     (inner1 OR inner2) AND (op2a code2 op2b)
+ 	     => (t OR (inner2 AND (op2a code2 op2b)))  */
+-	  else
+-	    {
+-	      if (integer_onep (t))
+-		return boolean_true_node;
+-	      else
+-		/* Save partial result for later.  */
+-		partial = t;
+-	    }
++	  else if (integer_onep (t))
++	    return boolean_true_node;
++
++	  /* Save partial result for later.  */
++	  partial = t;
+ 	}
+       
+       /* Compute the second partial result, (inner2 AND (op2a code op2b)) */
+@@ -3536,6 +3533,10 @@
+ 		return inner1;
+ 	      else if (integer_zerop (t))
+ 		return boolean_false_node;
++	      /* If both are the same, we can apply the identity
++		 (x AND x) == x.  */
++	      else if (partial && same_bool_result_p (t, partial))
++		return t;
+ 	    }
+ 
+ 	  /* Handle the OR case. where we are redistributing:
+@@ -3945,7 +3946,7 @@
+ 	     => (t OR inner2)
+ 	     If the partial result t is a constant, we win.  Otherwise
+ 	     continue on to try reassociating with the other inner test.  */
+-	  if (innercode == TRUTH_OR_EXPR)
++	  if (is_or)
+ 	    {
+ 	      if (integer_onep (t))
+ 		return boolean_true_node;
+@@ -3956,14 +3957,11 @@
+ 	  /* Handle the AND case, where we are redistributing:
+ 	     (inner1 AND inner2) OR (op2a code2 op2b)
+ 	     => (t AND (inner2 OR (op2a code op2b)))  */
+-	  else
+-	    {
+-	      if (integer_zerop (t))
+-		return boolean_false_node;
+-	      else
+-		/* Save partial result for later.  */
+-		partial = t;
+-	    }
++	  else if (integer_zerop (t))
++	    return boolean_false_node;
++
++	  /* Save partial result for later.  */
++	  partial = t;
+ 	}
+       
+       /* Compute the second partial result, (inner2 OR (op2a code op2b)) */
+@@ -3977,13 +3975,18 @@
+ 	{
+ 	  /* Handle the OR case, where we are reassociating:
+ 	     (inner1 OR inner2) OR (op2a code2 op2b)
+-	     => (inner1 OR t)  */
+-	  if (innercode == TRUTH_OR_EXPR)
++	     => (inner1 OR t)
++	     => (t OR partial)  */
++	  if (is_or)
+ 	    {
+ 	      if (integer_zerop (t))
+ 		return inner1;
+ 	      else if (integer_onep (t))
+ 		return boolean_true_node;
++	      /* If both are the same, we can apply the identity
++		 (x OR x) == x.  */
++	      else if (partial && same_bool_result_p (t, partial))
++		return t;
+ 	    }
+ 	  
+ 	  /* Handle the AND case, where we are redistributing:
+@@ -4000,13 +4003,13 @@
+ 		     operand to the redistributed AND expression.  The
+ 		     interesting case is when at least one is true.
+ 		     Or, if both are the same, we can apply the identity
+-		     (x AND x) == true.  */
++		     (x AND x) == x.  */
+ 		  if (integer_onep (partial))
+ 		    return t;
+ 		  else if (integer_onep (t))
+ 		    return partial;
+ 		  else if (same_bool_result_p (t, partial))
+-		    return boolean_true_node;
++		    return t;
+ 		}
+ 	    }
+ 	}
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch
new file mode 100644
index 0000000..8eb3532
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99453.patch
@@ -0,0 +1,72 @@
+2010-12-17  Bernd Schmidt  <bernds@codesourcery.com>
+
+	Issue #10208
+
+	gcc/
+	* config/arm/arm.c (arm_select_cc_mode): Before calling
+	arm_select_dominance_cc_mode for AND or IOR operations, ensure
+	that op is NE or EQ.
+
+	gcc/testsuite/
+	* gcc.c-torture/compile/20101217-1.c: New test.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2010-12-21 14:13:38 +0000
++++ new/gcc/config/arm/arm.c	2011-01-05 11:32:50 +0000
+@@ -10609,12 +10609,14 @@
+ 
+   /* Alternate canonicalizations of the above.  These are somewhat cleaner.  */
+   if (GET_CODE (x) == AND
++      && (op == EQ || op == NE)
+       && COMPARISON_P (XEXP (x, 0))
+       && COMPARISON_P (XEXP (x, 1)))
+     return arm_select_dominance_cc_mode (XEXP (x, 0), XEXP (x, 1),
+ 					 DOM_CC_X_AND_Y);
+ 
+   if (GET_CODE (x) == IOR
++      && (op == EQ || op == NE)
+       && COMPARISON_P (XEXP (x, 0))
+       && COMPARISON_P (XEXP (x, 1)))
+     return arm_select_dominance_cc_mode (XEXP (x, 0), XEXP (x, 1),
+
+=== added file 'gcc/testsuite/gcc.c-torture/compile/20101217-1.c'
+--- old/gcc/testsuite/gcc.c-torture/compile/20101217-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.c-torture/compile/20101217-1.c	2011-01-05 11:32:50 +0000
+@@ -0,0 +1,36 @@
++/* Testcase provided by HUAWEI.  */
++#include <stdio.h>
++int main()
++{
++        int cur_k;
++        int cur_j=0;
++        int cur_i=28;
++        unsigned char temp_data[8];
++        unsigned int Data_Size=20;
++
++        for (cur_k=0;cur_j<7;cur_j++,cur_i++) {
++                if (cur_j%2==0) {
++                        temp_data[cur_k++]=0;
++                }
++                if (cur_k==7) {
++                        for (;cur_k>0;cur_k--) {
++                                if (cur_k>2) {
++                                        if ((temp_data[7-cur_k]=='n' || temp_data[7-cur_k]=='N' ) && (temp_data[7-cur_k+1]=='a' || temp_data[7-cur_k+1]=='A' )) {
++                                                break;
++                                        }
++                                }
++                                if (cur_k==1) {
++                                        if (temp_data[7-cur_k]=='n' || temp_data[7-cur_k]=='N' ) {
++                                                break;
++                                        }
++                                }
++                        }
++                        if (cur_k==7) {
++                        } else {
++                                if (cur_k>0)
++                                        printf("dfjk");
++                        }
++                }
++        }
++return 0;
++}
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch
new file mode 100644
index 0000000..8aa06cc
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99454.patch
@@ -0,0 +1,46 @@
+2010-12-18  Andrew Stubbs  <ams@codesourcery.com>
+
+	Backport from mainline:
+
+	gcc/
+	2010-12-17  Andrew Stubbs  <ams@codesourcery.com>
+
+	* config/arm/arm.md (maddhisi4, *maddhidi4): Use the canonical
+	operand order for plus.
+	Drop redundant % from constraints.
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2010-11-11 11:12:14 +0000
++++ new/gcc/config/arm/arm.md	2011-01-05 11:42:19 +0000
+@@ -1791,11 +1791,11 @@
+ 
+ (define_insn "maddhisi4"
+   [(set (match_operand:SI 0 "s_register_operand" "=r")
+-	(plus:SI (match_operand:SI 3 "s_register_operand" "r")
+-		 (mult:SI (sign_extend:SI
+-			   (match_operand:HI 1 "s_register_operand" "%r"))
++	(plus:SI (mult:SI (sign_extend:SI
++			   (match_operand:HI 1 "s_register_operand" "r"))
+ 			  (sign_extend:SI
+-			   (match_operand:HI 2 "s_register_operand" "r")))))]
++			   (match_operand:HI 2 "s_register_operand" "r")))
++		 (match_operand:SI 3 "s_register_operand" "r")))]
+   "TARGET_DSP_MULTIPLY"
+   "smlabb%?\\t%0, %1, %2, %3"
+   [(set_attr "insn" "smlaxy")
+@@ -1805,11 +1805,11 @@
+ (define_insn "*maddhidi4"
+   [(set (match_operand:DI 0 "s_register_operand" "=r")
+ 	(plus:DI
+-	  (match_operand:DI 3 "s_register_operand" "0")
+ 	  (mult:DI (sign_extend:DI
+-	 	    (match_operand:HI 1 "s_register_operand" "%r"))
++	 	    (match_operand:HI 1 "s_register_operand" "r"))
+ 		   (sign_extend:DI
+-		    (match_operand:HI 2 "s_register_operand" "r")))))]
++		    (match_operand:HI 2 "s_register_operand" "r")))
++	  (match_operand:DI 3 "s_register_operand" "0")))]
+   "TARGET_DSP_MULTIPLY"
+   "smlalbb%?\\t%Q0, %R0, %1, %2"
+   [(set_attr "insn" "smlalxy")
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch
new file mode 100644
index 0000000..5e8383a
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99455.patch
@@ -0,0 +1,65 @@
+2010-12-21  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	Issue #10201
+
+	Backport from mainline:
+
+	2010-12-16  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	PR target/46883
+	gcc/
+	* config/arm/arm.md
+	(zero_extendhisi2 for register input splitter): Change
+	"register_operand" to "s_register_operand".
+	(zero_extendqisi2 for register input splitter): Same.
+
+	gcc/testsuite/
+	* gcc.target/arm/pr46883.c: New testcase.
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-01-05 11:42:19 +0000
++++ new/gcc/config/arm/arm.md	2011-01-05 11:52:16 +0000
+@@ -4114,8 +4114,8 @@
+ })
+ 
+ (define_split
+-  [(set (match_operand:SI 0 "register_operand" "")
+-	(zero_extend:SI (match_operand:HI 1 "register_operand" "")))]
++  [(set (match_operand:SI 0 "s_register_operand" "")
++	(zero_extend:SI (match_operand:HI 1 "s_register_operand" "")))]
+   "!TARGET_THUMB2 && !arm_arch6"
+   [(set (match_dup 0) (ashift:SI (match_dup 2) (const_int 16)))
+    (set (match_dup 0) (lshiftrt:SI (match_dup 0) (const_int 16)))]
+@@ -4234,8 +4234,8 @@
+ })
+ 
+ (define_split
+-  [(set (match_operand:SI 0 "register_operand" "")
+-	(zero_extend:SI (match_operand:QI 1 "register_operand" "")))]
++  [(set (match_operand:SI 0 "s_register_operand" "")
++	(zero_extend:SI (match_operand:QI 1 "s_register_operand" "")))]
+   "!arm_arch6"
+   [(set (match_dup 0) (ashift:SI (match_dup 2) (const_int 24)))
+    (set (match_dup 0) (lshiftrt:SI (match_dup 0) (const_int 24)))]
+
+=== added file 'gcc/testsuite/gcc.target/arm/pr46883.c'
+--- old/gcc/testsuite/gcc.target/arm/pr46883.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/pr46883.c	2011-01-05 11:52:16 +0000
+@@ -0,0 +1,16 @@
++/* { dg-do compile } */
++/* { dg-options "-O1 -march=armv5te" } */
++
++void bar (unsigned char *q, unsigned short *data16s, int len)
++{
++  int i;
++
++  for (i = 0; i < len; i++)
++    {
++      q[2 * i] =
++        (((data16s[i] & 0xFF) << 8) | ((data16s[i] >> 8) & 0xFF)) & 0xFF;
++      q[2 * i + 1] =
++        ((unsigned short)
++         (((data16s[i] & 0xFF) << 8) | ((data16s[i] >> 8) & 0xFF))) >> 8;
++    }
++}
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch
new file mode 100644
index 0000000..35f98d2
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch
@@ -0,0 +1,3163 @@
+2011-01-03  Bernd Schmidt  <bernds@codesourcery.com>
+
+	gcc/
+	* doc/tm.texi (RETURN_ADDR_REGNUM): Document.
+	* doc/md.texi (simple_return): Document pattern.
+	(return): Add a sentence to clarify.
+	* doc/rtl.texi (simple_return): Document.
+	* doc/invoke.texi (Optimize Options): Document -fshrink-wrap.
+	* common.opt (fshrink-wrap): New.
+	* opts.c (decode_options): Set it for -O2 and above.
+	* gengenrtl.c (special_rtx): PC, CC0, RETURN and SIMPLE_RETURN
+	are special.
+	* rtl.h (ANY_RETURN_P): New macro.
+	(global_rtl_index): Add GR_RETURN and GR_SIMPLE_RETURN.
+	(ret_rtx, simple_return_rtx): New macros.
+	* genemit.c (gen_exp): RETURN and SIMPLE_RETURN have unique rtxs.
+	(gen_expand, gen_split): Use ANY_RETURN_P.
+	* rtl.c (copy_rtx): RETURN and SIMPLE_RETURN are shared.
+	* emit-rtl.c (verify_rtx_sharing): Likewise.
+	(skip_consecutive_labels): Return the argument if it is a return rtx.
+	(classify_insn): Handle both kinds of return.
+	(init_emit_regs): Create global rtl for ret_rtx and simple_return_rtx.
+	* df-scan.c (df_uses_record): Handle SIMPLE_RETURN.
+	* rtl.def (SIMPLE_RETURN): New.
+	* rtlanal.c (tablejump_p): Check JUMP_LABEL for returns.
+	* final.c (final_scan_insn): Recognize both kinds of return.
+	* reorg.c (function_return_label, function_simple_return_label): New
+	static variables.
+	(end_of_function_label): Remove.
+	(simplejump_or_return_p): New static function.
+	(find_end_label): Add a new arg, KIND.  All callers changed.
+	Depending on KIND, look for a label suitable for return or
+	simple_return.
+	(make_return_insns): Make corresponding changes.
+	(get_jump_flags): Check JUMP_LABELs for returns.
+	(follow_jumps): Likewise.
+	(get_branch_condition): Check target for return patterns rather
+	than NULL.
+	(own_thread_p): Likewise for thread.
+	(steal_delay_list_from_target): Check JUMP_LABELs for returns.
+	Use simplejump_or_return_p.
+	(fill_simple_delay_slots): Likewise.
+	(optimize_skip): Likewise.
+	(fill_slots_from_thread): Likewise.
+	(relax_delay_slots): Likewise.
+	(dbr_schedule): Adjust handling of end_of_function_label for the
+	two new variables.
+	* ifcvt.c (find_if_case_1): Take care when redirecting jumps to the
+	exit block.
+	(dead_or_predicable): Change NEW_DEST arg to DEST_EDGE.  All callers
+	changed.  Ensure that the right label is passed to redirect_jump.
+	* jump.c (condjump_p, condjump_in_parallel_p, any_condjump_p,
+	returnjump_p): Handle SIMPLE_RETURNs.
+	(delete_related_insns): Check JUMP_LABEL for returns.
+	(redirect_target): New static function.
+	(redirect_exp_1): Use it.  Handle any kind of return rtx as a label
+	rather than interpreting NULL as a return.
+	(redirect_jump_1): Assert that nlabel is not NULL.
+	(redirect_jump): Likewise.
+	(redirect_jump_2): Handle any kind of return rtx as a label rather
+	than interpreting NULL as a return.
+	* dwarf2out.c (compute_barrier_args_size_1): Check JUMP_LABEL for
+	returns.
+	* function.c (emit_return_into_block): Remove useless declaration.
+	(record_hard_reg_sets, frame_required_for_rtx, gen_return_pattern,
+	requires_stack_frame_p): New static functions.
+	(emit_return_into_block): New arg SIMPLE_P.  All callers changed.
+	Generate either kind of return pattern and update the JUMP_LABEL.
+	(thread_prologue_and_epilogue_insns): Implement a form of
+	shrink-wrapping.  Ensure JUMP_LABELs for return insns are set.
+	* print-rtl.c (print_rtx): Handle returns in JUMP_LABELs.
+	* cfglayout.c (fixup_reorder_chain): Ensure JUMP_LABELs for returns
+	remain correct.
+	* resource.c (find_dead_or_set_registers): Check JUMP_LABELs for
+	returns.
+	(mark_target_live_regs): Don't pass a return rtx to next_active_insn.
+	* basic-block.h (force_nonfallthru_and_redirect): Declare.
+	* sched-vis.c (print_pattern): Add case for SIMPLE_RETURN.
+	* cfgrtl.c (force_nonfallthru_and_redirect): No longer static.  New arg
+	JUMP_LABEL.  All callers changed.  Use the label when generating
+	return insns.
+
+	* config/i386/i386.md (returns, return_str, return_cond): New
+	code_iterator and corresponding code_attrs.
+	(<return_str>return): Renamed from return and adapted.
+	(<return_str>return_internal): Likewise for return_internal.
+	(<return_str>return_internal_long): Likewise for return_internal_long.
+	(<return_str>return_pop_internal): Likewise for return_pop_internal.
+	(<return_str>return_indirect_internal): Likewise for
+	return_indirect_internal.
+	* config/i386/i386.c (ix86_expand_epilogue): Expand a simple_return as
+	the last insn.
+	(ix86_pad_returns): Handle both kinds of return rtx.
+	* config/arm/arm.c (use_simple_return_p): new function.
+	(is_jump_table): Handle returns in JUMP_LABELs.
+	(output_return_instruction): New arg SIMPLE.  All callers changed.
+	Use it to determine which kind of return to generate.
+	(arm_final_prescan_insn): Handle both kinds of return.
+	* config/arm/arm.md (returns, return_str, return_simple_p,
+	return_cond): New code_iterator and corresponding code_attrs.
+	(<return_str>return): Renamed from return and adapted.
+	(arm_<return_str>return): Renamed from arm_return and adapted.
+	(cond_<return_str>return): Renamed from cond_return and adapted.
+	(cond_<return_str>return_inverted): Renamed from cond_return_inverted
+	and adapted.
+	(epilogue): Use ret_rtx instead of gen_rtx_RETURN.
+	* config/arm/thumb2.md (thumb2_<return_str>return): Renamed from
+	thumb2_return and adapted.
+	* config/arm/arm.h (RETURN_ADDR_REGNUM): Define.
+	* config/arm/arm-protos.h (use_simple_return_p): Declare.
+	(output_return_instruction): Adjust declaration.
+	* config/mips/mips.c (mips_expand_epilogue): Generate a simple_return
+	as final insn.
+	* config/mips/mips.md (simple_return): New expander.
+	(*simple_return, simple_return_internal): New patterns.
+	* config/sh/sh.c (barrier_align): Handle return in a JUMP_LABEL.
+	(split_branches): Don't pass a null label to redirect_jump.
+
+	From mainline:
+	* vec.h (FOR_EACH_VEC_ELT, FOR_EACH_VEC_ELT_REVERSE): New macros.
+	* haifa-sched.c (find_fallthru_edge_from): Rename from
+	find_fallthru_edge.  All callers changed.
+	* sched-int.h (find_fallthru_edge_from): Rename declaration as well.
+	* basic-block.h (find_fallthru_edge): New inline function.
+
+=== modified file 'gcc/basic-block.h'
+--- old/gcc/basic-block.h	2010-09-01 13:29:58 +0000
++++ new/gcc/basic-block.h	2011-01-05 12:12:18 +0000
+@@ -884,6 +884,7 @@
+ 
+ /* In cfgrtl.c  */
+ extern basic_block force_nonfallthru (edge);
++extern basic_block force_nonfallthru_and_redirect (edge, basic_block, rtx);
+ extern rtx block_label (basic_block);
+ extern bool purge_all_dead_edges (void);
+ extern bool purge_dead_edges (basic_block);
+@@ -1004,6 +1005,20 @@
+   return false;
+ }
+ 
++/* Return the fallthru edge in EDGES if it exists, NULL otherwise.  */
++static inline edge
++find_fallthru_edge (VEC(edge,gc) *edges)
++{
++  edge e;
++  edge_iterator ei;
++
++  FOR_EACH_EDGE (e, ei, edges)
++    if (e->flags & EDGE_FALLTHRU)
++      break;
++
++  return e;
++}
++
+ /* In cfgloopmanip.c.  */
+ extern edge mfb_kj_edge;
+ extern bool mfb_keep_just (edge);
+
+=== modified file 'gcc/cfganal.c'
+--- old/gcc/cfganal.c	2009-11-25 10:55:54 +0000
++++ new/gcc/cfganal.c	2011-01-05 12:12:18 +0000
+@@ -271,6 +271,37 @@
+       EDGE_SUCC (bb, 0)->flags |= EDGE_CAN_FALLTHRU;
+       EDGE_SUCC (bb, 1)->flags |= EDGE_CAN_FALLTHRU;
+     }
++  /* dwarf2out expects that a NOTE_INSN_EPILOGUE_BEGIN is always paired
++     with a return or a sibcall.  Ensure that this remains the case if
++     they are in different basic blocks.  */
++  FOR_EACH_BB (bb)
++    {
++      edge e;
++      edge_iterator ei;
++      rtx insn, end;
++
++      end = BB_END (bb);
++      FOR_BB_INSNS (bb, insn)
++	if (GET_CODE (insn) == NOTE
++	    && NOTE_KIND (insn) == NOTE_INSN_EPILOGUE_BEG
++	    && !(CALL_P (end) && SIBLING_CALL_P (end))
++	    && !returnjump_p (end))
++	  {
++	    basic_block other_bb = NULL;
++	    FOR_EACH_EDGE (e, ei, bb->succs)
++	      {
++		if (e->flags & EDGE_FALLTHRU)
++		  other_bb = e->dest;
++		else
++		  e->flags &= ~EDGE_CAN_FALLTHRU;
++	      }
++	    FOR_EACH_EDGE (e, ei, other_bb->preds)
++	      {
++		if (!(e->flags & EDGE_FALLTHRU))
++		  e->flags &= ~EDGE_CAN_FALLTHRU;
++	      }	    
++	  }
++    }
+ }
+ 
+ /* Find unreachable blocks.  An unreachable block will have 0 in
+
+=== modified file 'gcc/cfglayout.c'
+--- old/gcc/cfglayout.c	2010-05-17 16:30:54 +0000
++++ new/gcc/cfglayout.c	2011-01-05 12:12:18 +0000
+@@ -766,6 +766,7 @@
+     {
+       edge e_fall, e_taken, e;
+       rtx bb_end_insn;
++      rtx ret_label = NULL_RTX;
+       basic_block nb;
+       edge_iterator ei;
+ 
+@@ -785,6 +786,7 @@
+       bb_end_insn = BB_END (bb);
+       if (JUMP_P (bb_end_insn))
+ 	{
++	  ret_label = JUMP_LABEL (bb_end_insn);
+ 	  if (any_condjump_p (bb_end_insn))
+ 	    {
+ 	      /* This might happen if the conditional jump has side
+@@ -899,7 +901,7 @@
+ 	}
+ 
+       /* We got here if we need to add a new jump insn.  */
+-      nb = force_nonfallthru (e_fall);
++      nb = force_nonfallthru_and_redirect (e_fall, e_fall->dest, ret_label);
+       if (nb)
+ 	{
+ 	  nb->il.rtl->visited = 1;
+@@ -1118,24 +1120,30 @@
+ bool
+ cfg_layout_can_duplicate_bb_p (const_basic_block bb)
+ {
++  rtx insn;
++
+   /* Do not attempt to duplicate tablejumps, as we need to unshare
+      the dispatch table.  This is difficult to do, as the instructions
+      computing jump destination may be hoisted outside the basic block.  */
+   if (tablejump_p (BB_END (bb), NULL, NULL))
+     return false;
+ 
+-  /* Do not duplicate blocks containing insns that can't be copied.  */
+-  if (targetm.cannot_copy_insn_p)
++  insn = BB_HEAD (bb);
++  while (1)
+     {
+-      rtx insn = BB_HEAD (bb);
+-      while (1)
+-	{
+-	  if (INSN_P (insn) && targetm.cannot_copy_insn_p (insn))
+-	    return false;
+-	  if (insn == BB_END (bb))
+-	    break;
+-	  insn = NEXT_INSN (insn);
+-	}
++      /* Do not duplicate blocks containing insns that can't be copied.  */
++      if (INSN_P (insn) && targetm.cannot_copy_insn_p
++	  && targetm.cannot_copy_insn_p (insn))
++	return false;
++      /* dwarf2out expects that these notes are always paired with a
++	 returnjump or sibling call.  */
++      if (NOTE_P (insn) && NOTE_KIND (insn) == NOTE_INSN_EPILOGUE_BEG
++	  && !returnjump_p (BB_END (bb))
++	  && (!CALL_P (BB_END (bb)) || !SIBLING_CALL_P (BB_END (bb))))
++	return false;
++      if (insn == BB_END (bb))
++	break;
++      insn = NEXT_INSN (insn);
+     }
+ 
+   return true;
+@@ -1167,6 +1175,9 @@
+ 	      || GET_CODE (PATTERN (insn)) == ADDR_DIFF_VEC)
+ 	    break;
+ 	  copy = emit_copy_of_insn_after (insn, get_last_insn ());
++	  if (JUMP_P (insn) && JUMP_LABEL (insn) != NULL_RTX
++	      && ANY_RETURN_P (JUMP_LABEL (insn)))
++	    JUMP_LABEL (copy) = JUMP_LABEL (insn);
+           maybe_copy_epilogue_insn (insn, copy);
+ 	  break;
+ 
+
+=== modified file 'gcc/cfgrtl.c'
+--- old/gcc/cfgrtl.c	2010-09-20 21:30:35 +0000
++++ new/gcc/cfgrtl.c	2011-01-05 12:12:18 +0000
+@@ -1107,10 +1107,13 @@
+ }
+ 
+ /* Like force_nonfallthru below, but additionally performs redirection
+-   Used by redirect_edge_and_branch_force.  */
++   Used by redirect_edge_and_branch_force.  JUMP_LABEL is used only
++   when redirecting to the EXIT_BLOCK, it is either a return or a
++   simple_return rtx indicating which kind of returnjump to create.
++   It should be NULL otherwise.  */
+ 
+-static basic_block
+-force_nonfallthru_and_redirect (edge e, basic_block target)
++basic_block
++force_nonfallthru_and_redirect (edge e, basic_block target, rtx jump_label)
+ {
+   basic_block jump_block, new_bb = NULL, src = e->src;
+   rtx note;
+@@ -1242,11 +1245,25 @@
+   e->flags &= ~EDGE_FALLTHRU;
+   if (target == EXIT_BLOCK_PTR)
+     {
++      if (jump_label == ret_rtx)
++	{
+ #ifdef HAVE_return
+-	emit_jump_insn_after_setloc (gen_return (), BB_END (jump_block), loc);
+-#else
+-	gcc_unreachable ();
+-#endif
++	  emit_jump_insn_after_setloc (gen_return (), BB_END (jump_block),
++				       loc);
++#else
++	  gcc_unreachable ();
++#endif
++	}
++      else
++	{
++	  gcc_assert (jump_label == simple_return_rtx);
++#ifdef HAVE_simple_return
++	  emit_jump_insn_after_setloc (gen_simple_return (),
++				       BB_END (jump_block), loc);
++#else
++	  gcc_unreachable ();
++#endif
++	}
+     }
+   else
+     {
+@@ -1273,7 +1290,7 @@
+ basic_block
+ force_nonfallthru (edge e)
+ {
+-  return force_nonfallthru_and_redirect (e, e->dest);
++  return force_nonfallthru_and_redirect (e, e->dest, NULL_RTX);
+ }
+ 
+ /* Redirect edge even at the expense of creating new jump insn or
+@@ -1290,7 +1307,7 @@
+   /* In case the edge redirection failed, try to force it to be non-fallthru
+      and redirect newly created simplejump.  */
+   df_set_bb_dirty (e->src);
+-  return force_nonfallthru_and_redirect (e, target);
++  return force_nonfallthru_and_redirect (e, target, NULL_RTX);
+ }
+ 
+ /* The given edge should potentially be a fallthru edge.  If that is in
+
+=== modified file 'gcc/common.opt'
+--- old/gcc/common.opt	2010-12-10 15:33:37 +0000
++++ new/gcc/common.opt	2011-01-05 12:12:18 +0000
+@@ -1147,6 +1147,11 @@
+ Common C ObjC C++ ObjC++ Report Var(flag_show_column) Init(1)
+ Show column numbers in diagnostics, when available.  Default on
+ 
++fshrink-wrap
++Common Report Var(flag_shrink_wrap) Optimization
++Emit function prologues only before parts of the function that need it,
++rather than at the top of the function.
++
+ fsignaling-nans
+ Common Report Var(flag_signaling_nans) Optimization
+ Disable optimizations observable by IEEE signaling NaNs
+
+=== modified file 'gcc/config/arm/arm-protos.h'
+--- old/gcc/config/arm/arm-protos.h	2010-11-04 10:45:05 +0000
++++ new/gcc/config/arm/arm-protos.h	2011-01-05 12:12:18 +0000
+@@ -26,6 +26,7 @@
+ extern void arm_override_options (void);
+ extern void arm_optimization_options (int, int);
+ extern int use_return_insn (int, rtx);
++extern bool use_simple_return_p (void);
+ extern enum reg_class arm_regno_class (int);
+ extern void arm_load_pic_register (unsigned long);
+ extern int arm_volatile_func (void);
+@@ -137,7 +138,7 @@
+ extern const char *output_add_immediate (rtx *);
+ extern const char *arithmetic_instr (rtx, int);
+ extern void output_ascii_pseudo_op (FILE *, const unsigned char *, int);
+-extern const char *output_return_instruction (rtx, int, int);
++extern const char *output_return_instruction (rtx, bool, bool, bool);
+ extern void arm_poke_function_name (FILE *, const char *);
+ extern void arm_print_operand (FILE *, rtx, int);
+ extern void arm_print_operand_address (FILE *, rtx);
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-01-05 11:32:50 +0000
++++ new/gcc/config/arm/arm.c	2011-01-05 12:12:18 +0000
+@@ -2163,6 +2163,18 @@
+   return addr;
+ }
+ 
++/* Return true if we should try to use a simple_return insn, i.e. perform
++   shrink-wrapping if possible.  This is the case if we need to emit a
++   prologue, which we can test by looking at the offsets.  */
++bool
++use_simple_return_p (void)
++{
++  arm_stack_offsets *offsets;
++
++  offsets = arm_get_frame_offsets ();
++  return offsets->outgoing_args != 0;
++}
++
+ /* Return 1 if it is possible to return using a single instruction.
+    If SIBLING is non-null, this is a test for a return before a sibling
+    call.  SIBLING is the call insn, so we can examine its register usage.  */
+@@ -11284,6 +11296,7 @@
+ 
+   if (GET_CODE (insn) == JUMP_INSN
+       && JUMP_LABEL (insn) != NULL
++      && !ANY_RETURN_P (JUMP_LABEL (insn))
+       && ((table = next_real_insn (JUMP_LABEL (insn)))
+ 	  == next_real_insn (insn))
+       && table != NULL
+@@ -14168,7 +14181,7 @@
+ /* Generate a function exit sequence.  If REALLY_RETURN is false, then do
+    everything bar the final return instruction.  */
+ const char *
+-output_return_instruction (rtx operand, int really_return, int reverse)
++output_return_instruction (rtx operand, bool really_return, bool reverse, bool simple)
+ {
+   char conditional[10];
+   char instr[100];
+@@ -14206,10 +14219,15 @@
+ 
+   sprintf (conditional, "%%?%%%c0", reverse ? 'D' : 'd');
+ 
+-  cfun->machine->return_used_this_function = 1;
++  if (simple)
++    live_regs_mask = 0;
++  else
++    {
++      cfun->machine->return_used_this_function = 1;
+ 
+-  offsets = arm_get_frame_offsets ();
+-  live_regs_mask = offsets->saved_regs_mask;
++      offsets = arm_get_frame_offsets ();
++      live_regs_mask = offsets->saved_regs_mask;
++    }
+ 
+   if (live_regs_mask)
+     {
+@@ -17108,6 +17126,7 @@
+ 
+   /* If we start with a return insn, we only succeed if we find another one.  */
+   int seeking_return = 0;
++  enum rtx_code return_code = UNKNOWN;
+ 
+   /* START_INSN will hold the insn from where we start looking.  This is the
+      first insn after the following code_label if REVERSE is true.  */
+@@ -17146,7 +17165,7 @@
+ 	  else
+ 	    return;
+ 	}
+-      else if (GET_CODE (body) == RETURN)
++      else if (ANY_RETURN_P (body))
+         {
+ 	  start_insn = next_nonnote_insn (start_insn);
+ 	  if (GET_CODE (start_insn) == BARRIER)
+@@ -17157,6 +17176,7 @@
+ 	    {
+ 	      reverse = TRUE;
+ 	      seeking_return = 1;
++	      return_code = GET_CODE (body);
+ 	    }
+ 	  else
+ 	    return;
+@@ -17197,11 +17217,15 @@
+ 	  label = XEXP (XEXP (SET_SRC (body), 2), 0);
+ 	  then_not_else = FALSE;
+ 	}
+-      else if (GET_CODE (XEXP (SET_SRC (body), 1)) == RETURN)
+-	seeking_return = 1;
+-      else if (GET_CODE (XEXP (SET_SRC (body), 2)) == RETURN)
++      else if (ANY_RETURN_P (XEXP (SET_SRC (body), 1)))
++	{
++	  seeking_return = 1;
++	  return_code = GET_CODE (XEXP (SET_SRC (body), 1));
++	}
++      else if (ANY_RETURN_P (XEXP (SET_SRC (body), 2)))
+         {
+ 	  seeking_return = 1;
++	  return_code = GET_CODE (XEXP (SET_SRC (body), 2));
+ 	  then_not_else = FALSE;
+         }
+       else
+@@ -17302,8 +17326,7 @@
+ 		       && !use_return_insn (TRUE, NULL)
+ 		       && !optimize_size)
+ 		fail = TRUE;
+-	      else if (GET_CODE (scanbody) == RETURN
+-		       && seeking_return)
++	      else if (GET_CODE (scanbody) == return_code)
+ 	        {
+ 		  arm_ccfsm_state = 2;
+ 		  succeed = TRUE;
+
+=== modified file 'gcc/config/arm/arm.h'
+--- old/gcc/config/arm/arm.h	2010-11-11 11:12:14 +0000
++++ new/gcc/config/arm/arm.h	2011-01-05 12:12:18 +0000
+@@ -2622,6 +2622,8 @@
+ #define RETURN_ADDR_RTX(COUNT, FRAME) \
+   arm_return_addr (COUNT, FRAME)
+ 
++#define RETURN_ADDR_REGNUM LR_REGNUM
++
+ /* Mask of the bits in the PC that contain the real return address
+    when running in 26-bit mode.  */
+ #define RETURN_ADDR_MASK26 (0x03fffffc)
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-01-05 11:52:16 +0000
++++ new/gcc/config/arm/arm.md	2011-01-05 12:12:18 +0000
+@@ -8882,66 +8882,72 @@
+   [(set_attr "type" "call")]
+ )
+ 
+-(define_expand "return"
+-  [(return)]
+-  "TARGET_32BIT && USE_RETURN_INSN (FALSE)"
++;; Both kinds of return insn.
++(define_code_iterator returns [return simple_return])
++(define_code_attr return_str [(return "") (simple_return "simple_")])
++(define_code_attr return_simple_p [(return "false") (simple_return "true")])
++(define_code_attr return_cond [(return " && USE_RETURN_INSN (FALSE)")
++			       (simple_return " && use_simple_return_p ()")])
++
++(define_expand "<return_str>return"
++  [(returns)]
++  "TARGET_32BIT<return_cond>"
+   "")
+ 
+-;; Often the return insn will be the same as loading from memory, so set attr
+-(define_insn "*arm_return"
+-  [(return)]
+-  "TARGET_ARM && USE_RETURN_INSN (FALSE)"
+-  "*
+-  {
+-    if (arm_ccfsm_state == 2)
+-      {
+-        arm_ccfsm_state += 2;
+-        return \"\";
+-      }
+-    return output_return_instruction (const_true_rtx, TRUE, FALSE);
+-  }"
++(define_insn "*arm_<return_str>return"
++  [(returns)]
++  "TARGET_ARM<return_cond>"
++{
++  if (arm_ccfsm_state == 2)
++    {
++      arm_ccfsm_state += 2;
++      return "";
++    }
++  return output_return_instruction (const_true_rtx, true, false,
++				    <return_simple_p>);
++}
+   [(set_attr "type" "load1")
+    (set_attr "length" "12")
+    (set_attr "predicable" "yes")]
+ )
+ 
+-(define_insn "*cond_return"
++(define_insn "*cond_<return_str>return"
+   [(set (pc)
+         (if_then_else (match_operator 0 "arm_comparison_operator"
+ 		       [(match_operand 1 "cc_register" "") (const_int 0)])
+-                      (return)
++                      (returns)
+                       (pc)))]
+-  "TARGET_ARM && USE_RETURN_INSN (TRUE)"
+-  "*
+-  {
+-    if (arm_ccfsm_state == 2)
+-      {
+-        arm_ccfsm_state += 2;
+-        return \"\";
+-      }
+-    return output_return_instruction (operands[0], TRUE, FALSE);
+-  }"
++  "TARGET_ARM<return_cond>"
++{
++  if (arm_ccfsm_state == 2)
++    {
++      arm_ccfsm_state += 2;
++      return "";
++    }
++  return output_return_instruction (operands[0], true, false,
++				    <return_simple_p>);
++}
+   [(set_attr "conds" "use")
+    (set_attr "length" "12")
+    (set_attr "type" "load1")]
+ )
+ 
+-(define_insn "*cond_return_inverted"
++(define_insn "*cond_<return_str>return_inverted"
+   [(set (pc)
+         (if_then_else (match_operator 0 "arm_comparison_operator"
+ 		       [(match_operand 1 "cc_register" "") (const_int 0)])
+                       (pc)
+-		      (return)))]
+-  "TARGET_ARM && USE_RETURN_INSN (TRUE)"
+-  "*
+-  {
+-    if (arm_ccfsm_state == 2)
+-      {
+-        arm_ccfsm_state += 2;
+-        return \"\";
+-      }
+-    return output_return_instruction (operands[0], TRUE, TRUE);
+-  }"
++		      (returns)))]
++  "TARGET_ARM<return_cond>"
++{
++  if (arm_ccfsm_state == 2)
++    {
++      arm_ccfsm_state += 2;
++      return "";
++    }
++  return output_return_instruction (operands[0], true, true,
++				    <return_simple_p>);
++}
+   [(set_attr "conds" "use")
+    (set_attr "length" "12")
+    (set_attr "type" "load1")]
+@@ -10809,8 +10815,7 @@
+       DONE;
+     }
+   emit_jump_insn (gen_rtx_UNSPEC_VOLATILE (VOIDmode,
+-	gen_rtvec (1,
+-		gen_rtx_RETURN (VOIDmode)),
++	gen_rtvec (1, ret_rtx),
+ 	VUNSPEC_EPILOGUE));
+   DONE;
+   "
+@@ -10827,7 +10832,7 @@
+   "TARGET_32BIT"
+   "*
+   if (use_return_insn (FALSE, next_nonnote_insn (insn)))
+-    return output_return_instruction (const_true_rtx, FALSE, FALSE);
++    return output_return_instruction (const_true_rtx, false, false, false);
+   return arm_output_epilogue (next_nonnote_insn (insn));
+   "
+ ;; Length is absolute worst case
+
+=== modified file 'gcc/config/arm/thumb2.md'
+--- old/gcc/config/arm/thumb2.md	2010-09-22 05:54:42 +0000
++++ new/gcc/config/arm/thumb2.md	2011-01-05 12:12:18 +0000
+@@ -1020,16 +1020,15 @@
+ 
+ ;; Note: this is not predicable, to avoid issues with linker-generated
+ ;; interworking stubs.
+-(define_insn "*thumb2_return"
+-  [(return)]
+-  "TARGET_THUMB2 && USE_RETURN_INSN (FALSE)"
+-  "*
+-  {
+-    return output_return_instruction (const_true_rtx, TRUE, FALSE);
+-  }"
++(define_insn "*thumb2_<return_str>return"
++  [(returns)]
++  "TARGET_THUMB2<return_cond>"
++{
++  return output_return_instruction (const_true_rtx, true, false,
++				    <return_simple_p>);
++}
+   [(set_attr "type" "load1")
+-   (set_attr "length" "12")]
+-)
++   (set_attr "length" "12")])
+ 
+ (define_insn_and_split "thumb2_eh_return"
+   [(unspec_volatile [(match_operand:SI 0 "s_register_operand" "r")]
+
+=== modified file 'gcc/config/i386/i386.c'
+--- old/gcc/config/i386/i386.c	2010-11-16 18:05:53 +0000
++++ new/gcc/config/i386/i386.c	2011-01-05 12:12:18 +0000
+@@ -9308,13 +9308,13 @@
+ 
+ 	  pro_epilogue_adjust_stack (stack_pointer_rtx, stack_pointer_rtx,
+ 				     popc, -1, true);
+-	  emit_jump_insn (gen_return_indirect_internal (ecx));
++	  emit_jump_insn (gen_simple_return_indirect_internal (ecx));
+ 	}
+       else
+-	emit_jump_insn (gen_return_pop_internal (popc));
++	emit_jump_insn (gen_simple_return_pop_internal (popc));
+     }
+   else
+-    emit_jump_insn (gen_return_internal ());
++    emit_jump_insn (gen_simple_return_internal ());
+ 
+   /* Restore the state back to the state from the prologue,
+      so that it's correct for the next epilogue.  */
+@@ -26596,7 +26596,7 @@
+       rtx prev;
+       bool replace = false;
+ 
+-      if (!JUMP_P (ret) || GET_CODE (PATTERN (ret)) != RETURN
++      if (!JUMP_P (ret) || !ANY_RETURN_P (PATTERN (ret))
+ 	  || optimize_bb_for_size_p (bb))
+ 	continue;
+       for (prev = PREV_INSN (ret); prev; prev = PREV_INSN (prev))
+@@ -26626,7 +26626,10 @@
+ 	}
+       if (replace)
+ 	{
+-	  emit_jump_insn_before (gen_return_internal_long (), ret);
++	  if (PATTERN (ret) == ret_rtx)
++	    emit_jump_insn_before (gen_return_internal_long (), ret);
++	  else
++	    emit_jump_insn_before (gen_simple_return_internal_long (), ret);
+ 	  delete_insn (ret);
+ 	}
+     }
+
+=== modified file 'gcc/config/i386/i386.md'
+--- old/gcc/config/i386/i386.md	2010-11-27 15:24:12 +0000
++++ new/gcc/config/i386/i386.md	2011-01-05 12:12:18 +0000
+@@ -13797,24 +13797,29 @@
+   ""
+   [(set_attr "length" "0")])
+ 
++(define_code_iterator returns [return simple_return])
++(define_code_attr return_str [(return "") (simple_return "simple_")])
++(define_code_attr return_cond [(return "ix86_can_use_return_insn_p ()")
++			       (simple_return "")])
++
+ ;; Insn emitted into the body of a function to return from a function.
+ ;; This is only done if the function's epilogue is known to be simple.
+ ;; See comments for ix86_can_use_return_insn_p in i386.c.
+ 
+-(define_expand "return"
+-  [(return)]
+-  "ix86_can_use_return_insn_p ()"
++(define_expand "<return_str>return"
++  [(returns)]
++  "<return_cond>"
+ {
+   if (crtl->args.pops_args)
+     {
+       rtx popc = GEN_INT (crtl->args.pops_args);
+-      emit_jump_insn (gen_return_pop_internal (popc));
++      emit_jump_insn (gen_<return_str>return_pop_internal (popc));
+       DONE;
+     }
+ })
+ 
+-(define_insn "return_internal"
+-  [(return)]
++(define_insn "<return_str>return_internal"
++  [(returns)]
+   "reload_completed"
+   "ret"
+   [(set_attr "length" "1")
+@@ -13825,8 +13830,8 @@
+ ;; Used by x86_machine_dependent_reorg to avoid penalty on single byte RET
+ ;; instruction Athlon and K8 have.
+ 
+-(define_insn "return_internal_long"
+-  [(return)
++(define_insn "<return_str>return_internal_long"
++  [(returns)
+    (unspec [(const_int 0)] UNSPEC_REP)]
+   "reload_completed"
+   "rep\;ret"
+@@ -13836,8 +13841,8 @@
+    (set_attr "prefix_rep" "1")
+    (set_attr "modrm" "0")])
+ 
+-(define_insn "return_pop_internal"
+-  [(return)
++(define_insn "<return_str>return_pop_internal"
++  [(returns)
+    (use (match_operand:SI 0 "const_int_operand" ""))]
+   "reload_completed"
+   "ret\t%0"
+@@ -13846,8 +13851,8 @@
+    (set_attr "length_immediate" "2")
+    (set_attr "modrm" "0")])
+ 
+-(define_insn "return_indirect_internal"
+-  [(return)
++(define_insn "<return_str>return_indirect_internal"
++  [(returns)
+    (use (match_operand:SI 0 "register_operand" "r"))]
+   "reload_completed"
+   "jmp\t%A0"
+
+=== modified file 'gcc/config/mips/mips.c'
+--- old/gcc/config/mips/mips.c	2010-11-21 10:38:43 +0000
++++ new/gcc/config/mips/mips.c	2011-01-05 12:12:18 +0000
+@@ -10497,7 +10497,8 @@
+ 	    regno = GP_REG_FIRST + 7;
+ 	  else
+ 	    regno = RETURN_ADDR_REGNUM;
+-	  emit_jump_insn (gen_return_internal (gen_rtx_REG (Pmode, regno)));
++	  emit_jump_insn (gen_simple_return_internal (gen_rtx_REG (Pmode,
++								   regno)));
+ 	}
+     }
+ 
+
+=== modified file 'gcc/config/mips/mips.md'
+--- old/gcc/config/mips/mips.md	2010-04-02 18:54:46 +0000
++++ new/gcc/config/mips/mips.md	2011-01-05 12:12:18 +0000
+@@ -5815,6 +5815,18 @@
+   [(set_attr "type"	"jump")
+    (set_attr "mode"	"none")])
+ 
++(define_expand "simple_return"
++  [(simple_return)]
++  "!mips_can_use_return_insn ()"
++  { mips_expand_before_return (); })
++
++(define_insn "*simple_return"
++  [(simple_return)]
++  "!mips_can_use_return_insn ()"
++  "%*j\t$31%/"
++  [(set_attr "type"	"jump")
++   (set_attr "mode"	"none")])
++
+ ;; Normal return.
+ 
+ (define_insn "return_internal"
+@@ -5825,6 +5837,14 @@
+   [(set_attr "type"	"jump")
+    (set_attr "mode"	"none")])
+ 
++(define_insn "simple_return_internal"
++  [(simple_return)
++   (use (match_operand 0 "pmode_register_operand" ""))]
++  ""
++  "%*j\t%0%/"
++  [(set_attr "type"	"jump")
++   (set_attr "mode"	"none")])
++
+ ;; Exception return.
+ (define_insn "mips_eret"
+   [(return)
+
+=== modified file 'gcc/config/sh/sh.c'
+--- old/gcc/config/sh/sh.c	2010-12-10 15:34:19 +0000
++++ new/gcc/config/sh/sh.c	2011-01-05 12:12:18 +0000
+@@ -5252,7 +5252,8 @@
+ 	}
+       if (prev
+ 	  && JUMP_P (prev)
+-	  && JUMP_LABEL (prev))
++	  && JUMP_LABEL (prev)
++	  && !ANY_RETURN_P (JUMP_LABEL (prev)))
+ 	{
+ 	  rtx x;
+ 	  if (jump_to_next
+@@ -5951,7 +5952,7 @@
+ 			JUMP_LABEL (insn) = far_label;
+ 			LABEL_NUSES (far_label)++;
+ 		      }
+-		    redirect_jump (insn, NULL_RTX, 1);
++		    redirect_jump (insn, ret_rtx, 1);
+ 		    far_label = 0;
+ 		  }
+ 	      }
+
+=== modified file 'gcc/df-scan.c'
+--- old/gcc/df-scan.c	2010-11-16 22:17:17 +0000
++++ new/gcc/df-scan.c	2011-01-05 12:12:18 +0000
+@@ -3296,6 +3296,7 @@
+       }
+ 
+     case RETURN:
++    case SIMPLE_RETURN:
+       break;
+ 
+     case ASM_OPERANDS:
+
+=== modified file 'gcc/doc/invoke.texi'
+--- old/gcc/doc/invoke.texi	2010-11-04 14:29:09 +0000
++++ new/gcc/doc/invoke.texi	2011-01-05 12:12:18 +0000
+@@ -5750,6 +5750,7 @@
+ -fipa-pure-const @gol
+ -fipa-reference @gol
+ -fmerge-constants
++-fshrink-wrap @gol
+ -fsplit-wide-types @gol
+ -ftree-builtin-call-dce @gol
+ -ftree-ccp @gol
+@@ -6504,6 +6505,12 @@
+ When pipelining loops during selective scheduling, also pipeline outer loops.
+ This option has no effect until @option{-fsel-sched-pipelining} is turned on.
+ 
++@item -fshrink-wrap
++@opindex fshrink-wrap
++Emit function prologues only before parts of the function that need it,
++rather than at the top of the function.  This flag is enabled by default at
++@option{-O} and higher.
++
+ @item -fcaller-saves
+ @opindex fcaller-saves
+ Enable values to be allocated in registers that will be clobbered by
+
+=== modified file 'gcc/doc/md.texi'
+--- old/gcc/doc/md.texi	2009-12-15 18:36:44 +0000
++++ new/gcc/doc/md.texi	2011-01-05 12:12:18 +0000
+@@ -4801,7 +4801,19 @@
+ multiple instructions are usually needed to return from a function, but
+ some class of functions only requires one instruction to implement a
+ return.  Normally, the applicable functions are those which do not need
+-to save any registers or allocate stack space.
++to save any registers or allocate stack space, although some targets
++have instructions that can perform both the epilogue and function return
++in one instruction.
++
++@cindex @code{simple_return} instruction pattern
++@item @samp{simple_return}
++Subroutine return instruction.  This instruction pattern name should be
++defined only if a single instruction can do all the work of returning
++from a function on a path where no epilogue is required.  This pattern
++is very similar to the @code{return} instruction pattern, but it is emitted
++only by the shrink-wrapping optimization on paths where the function
++prologue has not been executed, and a function return should occur without
++any of the effects of the epilogue.
+ 
+ @findex reload_completed
+ @findex leaf_function_p
+
+=== modified file 'gcc/doc/rtl.texi'
+--- old/gcc/doc/rtl.texi	2010-07-06 19:23:53 +0000
++++ new/gcc/doc/rtl.texi	2011-01-05 12:12:18 +0000
+@@ -2888,6 +2888,13 @@
+ Note that an insn pattern of @code{(return)} is logically equivalent to
+ @code{(set (pc) (return))}, but the latter form is never used.
+ 
++@findex simple_return
++@item (simple_return)
++Like @code{(return)}, but truly represents only a function return, while
++@code{(return)} may represent an insn that also performs other functions
++of the function epilogue.  Like @code{(return)}, this may also occur in
++conditional jumps.
++
+ @findex call
+ @item (call @var{function} @var{nargs})
+ Represents a function call.  @var{function} is a @code{mem} expression
+@@ -3017,7 +3024,7 @@
+ brackets stand for a vector; the operand of @code{parallel} is a
+ vector of expressions.  @var{x0}, @var{x1} and so on are individual
+ side effect expressions---expressions of code @code{set}, @code{call},
+-@code{return}, @code{clobber} or @code{use}.
++@code{return}, @code{simple_return}, @code{clobber} or @code{use}.
+ 
+ ``In parallel'' means that first all the values used in the individual
+ side-effects are computed, and second all the actual side-effects are
+@@ -3656,14 +3663,16 @@
+ @table @code
+ @findex PATTERN
+ @item PATTERN (@var{i})
+-An expression for the side effect performed by this insn.  This must be
+-one of the following codes: @code{set}, @code{call}, @code{use},
+-@code{clobber}, @code{return}, @code{asm_input}, @code{asm_output},
+-@code{addr_vec}, @code{addr_diff_vec}, @code{trap_if}, @code{unspec},
+-@code{unspec_volatile}, @code{parallel}, @code{cond_exec}, or @code{sequence}.  If it is a @code{parallel},
+-each element of the @code{parallel} must be one these codes, except that
+-@code{parallel} expressions cannot be nested and @code{addr_vec} and
+-@code{addr_diff_vec} are not permitted inside a @code{parallel} expression.
++An expression for the side effect performed by this insn.  This must
++be one of the following codes: @code{set}, @code{call}, @code{use},
++@code{clobber}, @code{return}, @code{simple_return}, @code{asm_input},
++@code{asm_output}, @code{addr_vec}, @code{addr_diff_vec},
++@code{trap_if}, @code{unspec}, @code{unspec_volatile},
++@code{parallel}, @code{cond_exec}, or @code{sequence}.  If it is a
++@code{parallel}, each element of the @code{parallel} must be one these
++codes, except that @code{parallel} expressions cannot be nested and
++@code{addr_vec} and @code{addr_diff_vec} are not permitted inside a
++@code{parallel} expression.
+ 
+ @findex INSN_CODE
+ @item INSN_CODE (@var{i})
+
+=== modified file 'gcc/doc/tm.texi'
+--- old/gcc/doc/tm.texi	2010-09-01 13:29:58 +0000
++++ new/gcc/doc/tm.texi	2011-01-05 12:12:18 +0000
+@@ -3287,6 +3287,12 @@
+ from the frame pointer of the previous stack frame.
+ @end defmac
+ 
++@defmac RETURN_ADDR_REGNUM
++If defined, a C expression whose value is the register number of the return
++address for the current function.  Targets that pass the return address on
++the stack should not define this macro.
++@end defmac
++
+ @defmac INCOMING_RETURN_ADDR_RTX
+ A C expression whose value is RTL representing the location of the
+ incoming return address at the beginning of any function, before the
+
+=== modified file 'gcc/dwarf2out.c'
+--- old/gcc/dwarf2out.c	2010-12-21 18:46:10 +0000
++++ new/gcc/dwarf2out.c	2011-01-05 12:12:18 +0000
+@@ -1396,7 +1396,7 @@
+     {
+       rtx dest = JUMP_LABEL (insn);
+ 
+-      if (dest)
++      if (dest && !ANY_RETURN_P (dest))
+ 	{
+ 	  if (barrier_args_size [INSN_UID (dest)] < 0)
+ 	    {
+
+=== modified file 'gcc/emit-rtl.c'
+--- old/gcc/emit-rtl.c	2010-10-04 00:50:43 +0000
++++ new/gcc/emit-rtl.c	2011-01-05 12:12:18 +0000
+@@ -2432,6 +2432,8 @@
+     case CODE_LABEL:
+     case PC:
+     case CC0:
++    case RETURN:
++    case SIMPLE_RETURN:
+     case SCRATCH:
+       return;
+       /* SCRATCH must be shared because they represent distinct values.  */
+@@ -3323,14 +3325,17 @@
+   return insn;
+ }
+ 
+-/* Return the last label to mark the same position as LABEL.  Return null
+-   if LABEL itself is null.  */
++/* Return the last label to mark the same position as LABEL.  Return LABEL
++   itself if it is null or any return rtx.  */
+ 
+ rtx
+ skip_consecutive_labels (rtx label)
+ {
+   rtx insn;
+ 
++  if (label && ANY_RETURN_P (label))
++    return label;
++
+   for (insn = label; insn != 0 && !INSN_P (insn); insn = NEXT_INSN (insn))
+     if (LABEL_P (insn))
+       label = insn;
+@@ -5209,7 +5214,7 @@
+     return CODE_LABEL;
+   if (GET_CODE (x) == CALL)
+     return CALL_INSN;
+-  if (GET_CODE (x) == RETURN)
++  if (GET_CODE (x) == RETURN || GET_CODE (x) == SIMPLE_RETURN)
+     return JUMP_INSN;
+   if (GET_CODE (x) == SET)
+     {
+@@ -5715,8 +5720,10 @@
+   init_reg_modes_target ();
+ 
+   /* Assign register numbers to the globally defined register rtx.  */
+-  pc_rtx = gen_rtx_PC (VOIDmode);
+-  cc0_rtx = gen_rtx_CC0 (VOIDmode);
++  pc_rtx = gen_rtx_fmt_ (PC, VOIDmode);
++  ret_rtx = gen_rtx_fmt_ (RETURN, VOIDmode);
++  simple_return_rtx = gen_rtx_fmt_ (SIMPLE_RETURN, VOIDmode);
++  cc0_rtx = gen_rtx_fmt_ (CC0, VOIDmode);
+   stack_pointer_rtx = gen_raw_REG (Pmode, STACK_POINTER_REGNUM);
+   frame_pointer_rtx = gen_raw_REG (Pmode, FRAME_POINTER_REGNUM);
+   hard_frame_pointer_rtx = gen_raw_REG (Pmode, HARD_FRAME_POINTER_REGNUM);
+
+=== modified file 'gcc/final.c'
+--- old/gcc/final.c	2010-03-26 16:18:51 +0000
++++ new/gcc/final.c	2011-01-05 12:12:18 +0000
+@@ -2428,7 +2428,7 @@
+ 	        delete_insn (insn);
+ 		break;
+ 	      }
+-	    else if (GET_CODE (SET_SRC (body)) == RETURN)
++	    else if (ANY_RETURN_P (SET_SRC (body)))
+ 	      /* Replace (set (pc) (return)) with (return).  */
+ 	      PATTERN (insn) = body = SET_SRC (body);
+ 
+
+=== modified file 'gcc/function.c'
+--- old/gcc/function.c	2010-08-16 19:18:08 +0000
++++ new/gcc/function.c	2011-01-05 12:12:18 +0000
+@@ -147,9 +147,6 @@
+    can always export `prologue_epilogue_contains'.  */
+ static void record_insns (rtx, rtx, htab_t *) ATTRIBUTE_UNUSED;
+ static bool contains (const_rtx, htab_t);
+-#ifdef HAVE_return
+-static void emit_return_into_block (basic_block);
+-#endif
+ static void prepare_function_start (void);
+ static void do_clobber_return_reg (rtx, void *);
+ static void do_use_return_reg (rtx, void *);
+@@ -4987,35 +4984,189 @@
+   return 0;
+ }
+ 
++#ifdef HAVE_simple_return
++/* This collects sets and clobbers of hard registers in a HARD_REG_SET,
++   which is pointed to by DATA.  */
++static void
++record_hard_reg_sets (rtx x, const_rtx pat ATTRIBUTE_UNUSED, void *data)
++{
++  HARD_REG_SET *pset = (HARD_REG_SET *)data;
++  if (REG_P (x) && REGNO (x) < FIRST_PSEUDO_REGISTER)
++    {
++      int nregs = hard_regno_nregs[REGNO (x)][GET_MODE (x)];
++      while (nregs-- > 0)
++	SET_HARD_REG_BIT (*pset, REGNO (x) + nregs);
++    }
++}
++
++/* A subroutine of requires_stack_frame_p, called via for_each_rtx.
++   If any change is made, set CHANGED
++   to true.  */
++
++static int
++frame_required_for_rtx (rtx *loc, void *data ATTRIBUTE_UNUSED)
++{
++  rtx x = *loc;
++  if (x == stack_pointer_rtx || x == hard_frame_pointer_rtx
++      || x == arg_pointer_rtx || x == pic_offset_table_rtx
++#ifdef RETURN_ADDR_REGNUM
++      || (REG_P (x) && REGNO (x) == RETURN_ADDR_REGNUM)
++#endif
++      )
++    return 1;
++  return 0;
++}
++
++static bool
++requires_stack_frame_p (rtx insn)
++{
++  HARD_REG_SET hardregs;
++  unsigned regno;
++
++  if (!INSN_P (insn) || DEBUG_INSN_P (insn))
++    return false;
++  if (CALL_P (insn))
++    return !SIBLING_CALL_P (insn);
++  if (for_each_rtx (&PATTERN (insn), frame_required_for_rtx, NULL))
++    return true;
++  CLEAR_HARD_REG_SET (hardregs);
++  note_stores (PATTERN (insn), record_hard_reg_sets, &hardregs);
++  AND_COMPL_HARD_REG_SET (hardregs, call_used_reg_set);
++  for (regno = 0; regno < FIRST_PSEUDO_REGISTER; regno++)
++    if (TEST_HARD_REG_BIT (hardregs, regno)
++	&& df_regs_ever_live_p (regno))
++      return true;
++  return false;
++}
++#endif
++
+ #ifdef HAVE_return
+-/* Insert gen_return at the end of block BB.  This also means updating
+-   block_for_insn appropriately.  */
++
++static rtx
++gen_return_pattern (bool simple_p)
++{
++#ifdef HAVE_simple_return
++  return simple_p ? gen_simple_return () : gen_return ();
++#else
++  gcc_assert (!simple_p);
++  return gen_return ();
++#endif
++}
++
++/* Insert an appropriate return pattern at the end of block BB.  This
++   also means updating block_for_insn appropriately.  */
+ 
+ static void
+-emit_return_into_block (basic_block bb)
++emit_return_into_block (bool simple_p, basic_block bb)
+ {
+-  emit_jump_insn_after (gen_return (), BB_END (bb));
++  rtx jump;
++  jump = emit_jump_insn_after (gen_return_pattern (simple_p), BB_END (bb));
++  JUMP_LABEL (jump) = simple_p ? simple_return_rtx : ret_rtx;
+ }
+-#endif /* HAVE_return */
++#endif
+ 
+ /* Generate the prologue and epilogue RTL if the machine supports it.  Thread
+    this into place with notes indicating where the prologue ends and where
+-   the epilogue begins.  Update the basic block information when possible.  */
++   the epilogue begins.  Update the basic block information when possible.
++
++   Notes on epilogue placement:
++   There are several kinds of edges to the exit block:
++   * a single fallthru edge from LAST_BB
++   * possibly, edges from blocks containing sibcalls
++   * possibly, fake edges from infinite loops
++
++   The epilogue is always emitted on the fallthru edge from the last basic
++   block in the function, LAST_BB, into the exit block.
++
++   If LAST_BB is empty except for a label, it is the target of every
++   other basic block in the function that ends in a return.  If a
++   target has a return or simple_return pattern (possibly with
++   conditional variants), these basic blocks can be changed so that a
++   return insn is emitted into them, and their target is adjusted to
++   the real exit block.
++
++   Notes on shrink wrapping: We implement a fairly conservative
++   version of shrink-wrapping rather than the textbook one.  We only
++   generate a single prologue and a single epilogue.  This is
++   sufficient to catch a number of interesting cases involving early
++   exits.
++
++   First, we identify the blocks that require the prologue to occur before
++   them.  These are the ones that modify a call-saved register, or reference
++   any of the stack or frame pointer registers.  To simplify things, we then
++   mark everything reachable from these blocks as also requiring a prologue.
++   This takes care of loops automatically, and avoids the need to examine
++   whether MEMs reference the frame, since it is sufficient to check for
++   occurrences of the stack or frame pointer.
++
++   We then compute the set of blocks for which the need for a prologue
++   is anticipatable (borrowing terminology from the shrink-wrapping
++   description in Muchnick's book).  These are the blocks which either
++   require a prologue themselves, or those that have only successors
++   where the prologue is anticipatable.  The prologue needs to be
++   inserted on all edges from BB1->BB2 where BB2 is in ANTIC and BB1
++   is not.  For the moment, we ensure that only one such edge exists.
++
++   The epilogue is placed as described above, but we make a
++   distinction between inserting return and simple_return patterns
++   when modifying other blocks that end in a return.  Blocks that end
++   in a sibcall omit the sibcall_epilogue if the block is not in
++   ANTIC.  */
+ 
+ static void
+ thread_prologue_and_epilogue_insns (void)
+ {
+   int inserted = 0;
++  basic_block last_bb;
++  bool last_bb_active;
++#ifdef HAVE_simple_return
++  bool unconverted_simple_returns = false;
++  basic_block simple_return_block = NULL;
++#endif
++  rtx returnjump ATTRIBUTE_UNUSED;
++  rtx seq ATTRIBUTE_UNUSED, epilogue_end ATTRIBUTE_UNUSED;
++  rtx prologue_seq ATTRIBUTE_UNUSED, split_prologue_seq ATTRIBUTE_UNUSED;
++  edge entry_edge, orig_entry_edge, exit_fallthru_edge;
+   edge e;
+-#if defined (HAVE_sibcall_epilogue) || defined (HAVE_epilogue) || defined (HAVE_return) || defined (HAVE_prologue)
+-  rtx seq;
+-#endif
+-#if defined (HAVE_epilogue) || defined(HAVE_return)
+-  rtx epilogue_end = NULL_RTX;
+-#endif
+   edge_iterator ei;
++  bitmap_head bb_flags;
++
++  df_analyze ();
+ 
+   rtl_profile_for_bb (ENTRY_BLOCK_PTR);
++
++  epilogue_end = NULL_RTX;
++
++  /* Can't deal with multiple successors of the entry block at the
++     moment.  Function should always have at least one entry
++     point.  */
++  gcc_assert (single_succ_p (ENTRY_BLOCK_PTR));
++  entry_edge = single_succ_edge (ENTRY_BLOCK_PTR);
++  orig_entry_edge = entry_edge;
++
++  exit_fallthru_edge = find_fallthru_edge (EXIT_BLOCK_PTR->preds);
++  if (exit_fallthru_edge != NULL)
++    {
++      rtx label;
++
++      last_bb = exit_fallthru_edge->src;
++      /* Test whether there are active instructions in the last block.  */
++      label = BB_END (last_bb);
++      while (label && !LABEL_P (label))
++	{
++	  if (active_insn_p (label))
++	    break;
++	  label = PREV_INSN (label);
++	}
++
++      last_bb_active = BB_HEAD (last_bb) != label || !LABEL_P (label);
++    }
++  else
++    {
++      last_bb = NULL;
++      last_bb_active = false;
++    }
++
+ #ifdef HAVE_prologue
+   if (HAVE_prologue)
+     {
+@@ -5040,19 +5191,168 @@
+         emit_insn (gen_blockage ());
+ #endif
+ 
+-      seq = get_insns ();
++      prologue_seq = get_insns ();
+       end_sequence ();
+       set_insn_locators (seq, prologue_locator);
+-
+-      /* Can't deal with multiple successors of the entry block
+-         at the moment.  Function should always have at least one
+-         entry point.  */
+-      gcc_assert (single_succ_p (ENTRY_BLOCK_PTR));
+-
+-      insert_insn_on_edge (seq, single_succ_edge (ENTRY_BLOCK_PTR));
+-      inserted = 1;
+-    }
+-#endif
++    }
++#endif
++
++  bitmap_initialize (&bb_flags, &bitmap_default_obstack);
++
++#ifdef HAVE_simple_return
++  /* Try to perform a kind of shrink-wrapping, making sure the
++     prologue/epilogue is emitted only around those parts of the
++     function that require it.  */
++
++  if (flag_shrink_wrap && HAVE_simple_return && !flag_non_call_exceptions
++      && HAVE_prologue && !crtl->calls_eh_return)
++    {
++      HARD_REG_SET prologue_clobbered, live_on_edge;
++      rtx p_insn;
++      VEC(basic_block, heap) *vec;
++      basic_block bb;
++      bitmap_head bb_antic_flags;
++      bitmap_head bb_on_list;
++
++      bitmap_initialize (&bb_antic_flags, &bitmap_default_obstack);
++      bitmap_initialize (&bb_on_list, &bitmap_default_obstack);
++
++      vec = VEC_alloc (basic_block, heap, n_basic_blocks);
++
++      FOR_EACH_BB (bb)
++	{
++	  rtx insn;
++	  FOR_BB_INSNS (bb, insn)
++	    {
++	      if (requires_stack_frame_p (insn))
++		{
++		  bitmap_set_bit (&bb_flags, bb->index);
++		  VEC_quick_push (basic_block, vec, bb);
++		  break;
++		}
++	    }
++	}
++
++      /* For every basic block that needs a prologue, mark all blocks
++	 reachable from it, so as to ensure they are also seen as
++	 requiring a prologue.  */
++      while (!VEC_empty (basic_block, vec))
++	{
++	  basic_block tmp_bb = VEC_pop (basic_block, vec);
++	  edge e;
++	  edge_iterator ei;
++	  FOR_EACH_EDGE (e, ei, tmp_bb->succs)
++	    {
++	      if (e->dest == EXIT_BLOCK_PTR
++		  || bitmap_bit_p (&bb_flags, e->dest->index))
++		continue;
++	      bitmap_set_bit (&bb_flags, e->dest->index);
++	      VEC_quick_push (basic_block, vec, e->dest);
++	    }
++	}
++      /* If the last basic block contains only a label, we'll be able
++	 to convert jumps to it to (potentially conditional) return
++	 insns later.  This means we don't necessarily need a prologue
++	 for paths reaching it.  */
++      if (last_bb)
++	{
++	  if (!last_bb_active)
++	    bitmap_clear_bit (&bb_flags, last_bb->index);
++	  else if (!bitmap_bit_p (&bb_flags, last_bb->index))
++	    goto fail_shrinkwrap;
++	}
++
++      /* Now walk backwards from every block that is marked as needing
++	 a prologue to compute the bb_antic_flags bitmap.  */
++      bitmap_copy (&bb_antic_flags, &bb_flags);
++      FOR_EACH_BB (bb)
++	{
++	  edge e;
++	  edge_iterator ei;
++	  if (!bitmap_bit_p (&bb_flags, bb->index))
++	    continue;
++	  FOR_EACH_EDGE (e, ei, bb->preds)
++	    if (!bitmap_bit_p (&bb_antic_flags, e->src->index))
++	      {
++		VEC_quick_push (basic_block, vec, e->src);
++		bitmap_set_bit (&bb_on_list, e->src->index);
++	      }
++	}
++      while (!VEC_empty (basic_block, vec))
++	{
++	  basic_block tmp_bb = VEC_pop (basic_block, vec);
++	  edge e;
++	  edge_iterator ei;
++	  bool all_set = true;
++	  
++	  bitmap_clear_bit (&bb_on_list, tmp_bb->index);
++	  FOR_EACH_EDGE (e, ei, tmp_bb->succs)
++	    {
++	      if (!bitmap_bit_p (&bb_antic_flags, e->dest->index))
++		{
++		  all_set = false;
++		  break;
++		}
++	    }
++	  if (all_set)
++	    {
++	      bitmap_set_bit (&bb_antic_flags, tmp_bb->index);
++	      FOR_EACH_EDGE (e, ei, tmp_bb->preds)
++		if (!bitmap_bit_p (&bb_antic_flags, e->src->index))
++		  {
++		    VEC_quick_push (basic_block, vec, e->src);
++		    bitmap_set_bit (&bb_on_list, e->src->index);
++		  }
++	    }
++	}
++      /* Find exactly one edge that leads to a block in ANTIC from
++	 a block that isn't.  */
++      if (!bitmap_bit_p (&bb_antic_flags, entry_edge->dest->index))
++	FOR_EACH_BB (bb)
++	  {
++	    if (!bitmap_bit_p (&bb_antic_flags, bb->index))
++	      continue;
++	    FOR_EACH_EDGE (e, ei, bb->preds)
++	      if (!bitmap_bit_p (&bb_antic_flags, e->src->index))
++		{
++		  if (entry_edge != orig_entry_edge)
++		    {
++		      entry_edge = orig_entry_edge;
++		      goto fail_shrinkwrap;
++		    }
++		  entry_edge = e;
++		}
++	  }
++
++      /* Test whether the prologue is known to clobber any register
++	 (other than FP or SP) which are live on the edge.  */
++      CLEAR_HARD_REG_SET (prologue_clobbered);
++      for (p_insn = prologue_seq; p_insn; p_insn = NEXT_INSN (p_insn))
++	if (NONDEBUG_INSN_P (p_insn))
++	  note_stores (PATTERN (p_insn), record_hard_reg_sets,
++		       &prologue_clobbered);
++      CLEAR_HARD_REG_BIT (prologue_clobbered, STACK_POINTER_REGNUM);
++      if (frame_pointer_needed)
++	CLEAR_HARD_REG_BIT (prologue_clobbered, HARD_FRAME_POINTER_REGNUM);
++
++      CLEAR_HARD_REG_SET (live_on_edge);
++      reg_set_to_hard_reg_set (&live_on_edge,
++			       df_get_live_in (entry_edge->dest));
++      if (hard_reg_set_intersect_p (live_on_edge, prologue_clobbered))
++	entry_edge = orig_entry_edge;
++
++    fail_shrinkwrap:
++      bitmap_clear (&bb_antic_flags);
++      bitmap_clear (&bb_on_list);
++      VEC_free (basic_block, heap, vec);
++    }
++#endif
++
++  if (prologue_seq != NULL_RTX)
++    {
++      insert_insn_on_edge (prologue_seq, entry_edge);
++      inserted = true;
++    }
+ 
+   /* If the exit block has no non-fake predecessors, we don't need
+      an epilogue.  */
+@@ -5063,100 +5363,130 @@
+     goto epilogue_done;
+ 
+   rtl_profile_for_bb (EXIT_BLOCK_PTR);
++
+ #ifdef HAVE_return
+-  if (optimize && HAVE_return)
++  /* If we're allowed to generate a simple return instruction, then by
++     definition we don't need a full epilogue.  If the last basic
++     block before the exit block does not contain active instructions,
++     examine its predecessors and try to emit (conditional) return
++     instructions.  */
++  if (optimize && !last_bb_active
++      && (HAVE_return || entry_edge != orig_entry_edge))
+     {
+-      /* If we're allowed to generate a simple return instruction,
+-	 then by definition we don't need a full epilogue.  Examine
+-	 the block that falls through to EXIT.   If it does not
+-	 contain any code, examine its predecessors and try to
+-	 emit (conditional) return instructions.  */
+-
+-      basic_block last;
++      edge_iterator ei2;
++      int i;
++      basic_block bb;
+       rtx label;
++      VEC(basic_block,heap) *src_bbs;
+ 
+-      FOR_EACH_EDGE (e, ei, EXIT_BLOCK_PTR->preds)
+-	if (e->flags & EDGE_FALLTHRU)
+-	  break;
+-      if (e == NULL)
++      if (exit_fallthru_edge == NULL)
+ 	goto epilogue_done;
+-      last = e->src;
+-
+-      /* Verify that there are no active instructions in the last block.  */
+-      label = BB_END (last);
+-      while (label && !LABEL_P (label))
++      label = BB_HEAD (last_bb);
++
++      src_bbs = VEC_alloc (basic_block, heap, EDGE_COUNT (last_bb->preds));
++      FOR_EACH_EDGE (e, ei2, last_bb->preds)
++	if (e->src != ENTRY_BLOCK_PTR)
++	  VEC_quick_push (basic_block, src_bbs, e->src);
++
++      FOR_EACH_VEC_ELT (basic_block, src_bbs, i, bb)
+ 	{
+-	  if (active_insn_p (label))
+-	    break;
+-	  label = PREV_INSN (label);
++	  bool simple_p;
++	  rtx jump;
++	  e = find_edge (bb, last_bb);
++
++	  jump = BB_END (bb);
++
++#ifdef HAVE_simple_return
++	  simple_p = (entry_edge != orig_entry_edge
++		      ? !bitmap_bit_p (&bb_flags, bb->index) : false);
++#else
++	  simple_p = false;
++#endif
++
++	  if (!simple_p
++	      && (!HAVE_return || !JUMP_P (jump)
++		  || JUMP_LABEL (jump) != label))
++	    continue;
++
++	  /* If we have an unconditional jump, we can replace that
++	     with a simple return instruction.  */
++	  if (!JUMP_P (jump))
++	    {
++	      emit_barrier_after (BB_END (bb));
++	      emit_return_into_block (simple_p, bb);
++	    }
++	  else if (simplejump_p (jump))
++	    {
++	      emit_return_into_block (simple_p, bb);
++	      delete_insn (jump);
++	    }
++	  else if (condjump_p (jump) && JUMP_LABEL (jump) != label)
++	    {
++	      basic_block new_bb;
++	      edge new_e;
++
++	      gcc_assert (simple_p);
++	      new_bb = split_edge (e);
++	      emit_barrier_after (BB_END (new_bb));
++	      emit_return_into_block (simple_p, new_bb);
++#ifdef HAVE_simple_return
++	      simple_return_block = new_bb;
++#endif
++	      new_e = single_succ_edge (new_bb);
++	      redirect_edge_succ (new_e, EXIT_BLOCK_PTR);
++
++	      continue;
++	    }
++	  /* If we have a conditional jump branching to the last
++	     block, we can try to replace that with a conditional
++	     return instruction.  */
++	  else if (condjump_p (jump))
++	    {
++	      rtx dest;
++	      if (simple_p)
++		dest = simple_return_rtx;
++	      else
++		dest = ret_rtx;
++	      if (! redirect_jump (jump, dest, 0))
++		{
++#ifdef HAVE_simple_return
++		  if (simple_p)
++		    unconverted_simple_returns = true;
++#endif
++		  continue;
++		}
++
++	      /* If this block has only one successor, it both jumps
++		 and falls through to the fallthru block, so we can't
++		 delete the edge.  */
++	      if (single_succ_p (bb))
++		continue;
++	    }
++	  else
++	    {
++#ifdef HAVE_simple_return
++	      if (simple_p)
++		unconverted_simple_returns = true;
++#endif
++	      continue;
++	    }
++
++	  /* Fix up the CFG for the successful change we just made.  */
++	  redirect_edge_succ (e, EXIT_BLOCK_PTR);
+ 	}
++      VEC_free (basic_block, heap, src_bbs);
+ 
+-      if (BB_HEAD (last) == label && LABEL_P (label))
++      if (HAVE_return)
+ 	{
+-	  edge_iterator ei2;
+-
+-	  for (ei2 = ei_start (last->preds); (e = ei_safe_edge (ei2)); )
+-	    {
+-	      basic_block bb = e->src;
+-	      rtx jump;
+-
+-	      if (bb == ENTRY_BLOCK_PTR)
+-		{
+-		  ei_next (&ei2);
+-		  continue;
+-		}
+-
+-	      jump = BB_END (bb);
+-	      if (!JUMP_P (jump) || JUMP_LABEL (jump) != label)
+-		{
+-		  ei_next (&ei2);
+-		  continue;
+-		}
+-
+-	      /* If we have an unconditional jump, we can replace that
+-		 with a simple return instruction.  */
+-	      if (simplejump_p (jump))
+-		{
+-		  emit_return_into_block (bb);
+-		  delete_insn (jump);
+-		}
+-
+-	      /* If we have a conditional jump, we can try to replace
+-		 that with a conditional return instruction.  */
+-	      else if (condjump_p (jump))
+-		{
+-		  if (! redirect_jump (jump, 0, 0))
+-		    {
+-		      ei_next (&ei2);
+-		      continue;
+-		    }
+-
+-		  /* If this block has only one successor, it both jumps
+-		     and falls through to the fallthru block, so we can't
+-		     delete the edge.  */
+-		  if (single_succ_p (bb))
+-		    {
+-		      ei_next (&ei2);
+-		      continue;
+-		    }
+-		}
+-	      else
+-		{
+-		  ei_next (&ei2);
+-		  continue;
+-		}
+-
+-	      /* Fix up the CFG for the successful change we just made.  */
+-	      redirect_edge_succ (e, EXIT_BLOCK_PTR);
+-	    }
+-
+ 	  /* Emit a return insn for the exit fallthru block.  Whether
+ 	     this is still reachable will be determined later.  */
+ 
+-	  emit_barrier_after (BB_END (last));
+-	  emit_return_into_block (last);
+-	  epilogue_end = BB_END (last);
+-	  single_succ_edge (last)->flags &= ~EDGE_FALLTHRU;
++	  emit_barrier_after (BB_END (last_bb));
++	  emit_return_into_block (false, last_bb);
++	  epilogue_end = BB_END (last_bb);
++	  if (JUMP_P (epilogue_end))
++	    JUMP_LABEL (epilogue_end) = ret_rtx;
++	  single_succ_edge (last_bb)->flags &= ~EDGE_FALLTHRU;
+ 	  goto epilogue_done;
+ 	}
+     }
+@@ -5193,15 +5523,10 @@
+     }
+ #endif
+ 
+-  /* Find the edge that falls through to EXIT.  Other edges may exist
+-     due to RETURN instructions, but those don't need epilogues.
+-     There really shouldn't be a mixture -- either all should have
+-     been converted or none, however...  */
++  /* If nothing falls through into the exit block, we don't need an
++     epilogue.  */
+ 
+-  FOR_EACH_EDGE (e, ei, EXIT_BLOCK_PTR->preds)
+-    if (e->flags & EDGE_FALLTHRU)
+-      break;
+-  if (e == NULL)
++  if (exit_fallthru_edge == NULL)
+     goto epilogue_done;
+ 
+ #ifdef HAVE_epilogue
+@@ -5217,25 +5542,38 @@
+       set_insn_locators (seq, epilogue_locator);
+ 
+       seq = get_insns ();
++      returnjump = get_last_insn ();
+       end_sequence ();
+ 
+-      insert_insn_on_edge (seq, e);
++      insert_insn_on_edge (seq, exit_fallthru_edge);
+       inserted = 1;
++      if (JUMP_P (returnjump))
++	{
++ 	  rtx pat = PATTERN (returnjump);
++ 	  if (GET_CODE (pat) == PARALLEL)
++	    pat = XVECEXP (pat, 0, 0);
++	  if (ANY_RETURN_P (pat))
++	    JUMP_LABEL (returnjump) = pat;
++	  else
++	    JUMP_LABEL (returnjump) = ret_rtx;
++	}
++      else
++	returnjump = NULL_RTX;
+     }
+   else
+ #endif
+     {
+       basic_block cur_bb;
+ 
+-      if (! next_active_insn (BB_END (e->src)))
++      if (! next_active_insn (BB_END (exit_fallthru_edge->src)))
+ 	goto epilogue_done;
+       /* We have a fall-through edge to the exit block, the source is not
+-         at the end of the function, and there will be an assembler epilogue
+-         at the end of the function.
+-         We can't use force_nonfallthru here, because that would try to
+-         use return.  Inserting a jump 'by hand' is extremely messy, so
++	 at the end of the function, and there will be an assembler epilogue
++	 at the end of the function.
++	 We can't use force_nonfallthru here, because that would try to
++	 use return.  Inserting a jump 'by hand' is extremely messy, so
+ 	 we take advantage of cfg_layout_finalize using
+-	fixup_fallthru_exit_predecessor.  */
++	 fixup_fallthru_exit_predecessor.  */
+       cfg_layout_initialize (0);
+       FOR_EACH_BB (cur_bb)
+ 	if (cur_bb->index >= NUM_FIXED_BLOCKS
+@@ -5244,6 +5582,7 @@
+       cfg_layout_finalize ();
+     }
+ epilogue_done:
++
+   default_rtl_profile ();
+ 
+   if (inserted)
+@@ -5260,33 +5599,93 @@
+ 	}
+     }
+ 
++#ifdef HAVE_simple_return
++  /* If there were branches to an empty LAST_BB which we tried to
++     convert to conditional simple_returns, but couldn't for some
++     reason, create a block to hold a simple_return insn and redirect
++     those remaining edges.  */
++  if (unconverted_simple_returns)
++    {
++      edge_iterator ei2;
++      basic_block exit_pred = EXIT_BLOCK_PTR->prev_bb;
++
++      gcc_assert (entry_edge != orig_entry_edge);
++
++#ifdef HAVE_epilogue
++      if (simple_return_block == NULL && returnjump != NULL_RTX
++	  && JUMP_LABEL (returnjump) == simple_return_rtx)
++	{
++	  edge e = split_block (exit_fallthru_edge->src,
++				PREV_INSN (returnjump));
++	  simple_return_block = e->dest;
++	}
++#endif
++      if (simple_return_block == NULL)
++	{
++	  basic_block bb;
++	  rtx start;
++
++	  bb = create_basic_block (NULL, NULL, exit_pred);
++	  start = emit_jump_insn_after (gen_simple_return (),
++					BB_END (bb));
++	  JUMP_LABEL (start) = simple_return_rtx;
++	  emit_barrier_after (start);
++
++	  simple_return_block = bb;
++	  make_edge (bb, EXIT_BLOCK_PTR, 0);
++	}
++
++    restart_scan:
++      for (ei2 = ei_start (last_bb->preds); (e = ei_safe_edge (ei2)); )
++	{
++	  basic_block bb = e->src;
++
++	  if (bb != ENTRY_BLOCK_PTR
++	      && !bitmap_bit_p (&bb_flags, bb->index))
++	    {
++	      redirect_edge_and_branch_force (e, simple_return_block);
++	      goto restart_scan;
++	    }
++	  ei_next (&ei2);
++
++	}
++    }
++#endif
++
+ #ifdef HAVE_sibcall_epilogue
+   /* Emit sibling epilogues before any sibling call sites.  */
+   for (ei = ei_start (EXIT_BLOCK_PTR->preds); (e = ei_safe_edge (ei)); )
+     {
+       basic_block bb = e->src;
+       rtx insn = BB_END (bb);
++      rtx ep_seq;
+ 
+       if (!CALL_P (insn)
+-	  || ! SIBLING_CALL_P (insn))
++	  || ! SIBLING_CALL_P (insn)
++	  || (entry_edge != orig_entry_edge
++	      && !bitmap_bit_p (&bb_flags, bb->index)))
+ 	{
+ 	  ei_next (&ei);
+ 	  continue;
+ 	}
+ 
+-      start_sequence ();
+-      emit_note (NOTE_INSN_EPILOGUE_BEG);
+-      emit_insn (gen_sibcall_epilogue ());
+-      seq = get_insns ();
+-      end_sequence ();
+-
+-      /* Retain a map of the epilogue insns.  Used in life analysis to
+-	 avoid getting rid of sibcall epilogue insns.  Do this before we
+-	 actually emit the sequence.  */
+-      record_insns (seq, NULL, &epilogue_insn_hash);
+-      set_insn_locators (seq, epilogue_locator);
+-
+-      emit_insn_before (seq, insn);
++      ep_seq = gen_sibcall_epilogue ();
++      if (ep_seq)
++	{
++	  start_sequence ();
++	  emit_note (NOTE_INSN_EPILOGUE_BEG);
++	  emit_insn (ep_seq);
++	  seq = get_insns ();
++	  end_sequence ();
++
++	  /* Retain a map of the epilogue insns.  Used in life analysis to
++	     avoid getting rid of sibcall epilogue insns.  Do this before we
++	     actually emit the sequence.  */
++	  record_insns (seq, NULL, &epilogue_insn_hash);
++	  set_insn_locators (seq, epilogue_locator);
++
++	  emit_insn_before (seq, insn);
++	}
+       ei_next (&ei);
+     }
+ #endif
+@@ -5311,6 +5710,8 @@
+     }
+ #endif
+ 
++  bitmap_clear (&bb_flags);
++
+   /* Threading the prologue and epilogue changes the artificial refs
+      in the entry and exit blocks.  */
+   epilogue_completed = 1;
+
+=== modified file 'gcc/genemit.c'
+--- old/gcc/genemit.c	2009-11-27 11:37:06 +0000
++++ new/gcc/genemit.c	2011-01-05 12:12:18 +0000
+@@ -222,6 +222,12 @@
+     case PC:
+       printf ("pc_rtx");
+       return;
++    case RETURN:
++      printf ("ret_rtx");
++      return;
++    case SIMPLE_RETURN:
++      printf ("simple_return_rtx");
++      return;
+     case CLOBBER:
+       if (REG_P (XEXP (x, 0)))
+ 	{
+@@ -544,8 +550,8 @@
+ 	  || (GET_CODE (next) == PARALLEL
+ 	      && ((GET_CODE (XVECEXP (next, 0, 0)) == SET
+ 		   && GET_CODE (SET_DEST (XVECEXP (next, 0, 0))) == PC)
+-		  || GET_CODE (XVECEXP (next, 0, 0)) == RETURN))
+-	  || GET_CODE (next) == RETURN)
++		  || ANY_RETURN_P (XVECEXP (next, 0, 0))))
++	  || ANY_RETURN_P (next))
+ 	printf ("  emit_jump_insn (");
+       else if ((GET_CODE (next) == SET && GET_CODE (SET_SRC (next)) == CALL)
+ 	       || GET_CODE (next) == CALL
+@@ -660,7 +666,7 @@
+ 	  || (GET_CODE (next) == PARALLEL
+ 	      && GET_CODE (XVECEXP (next, 0, 0)) == SET
+ 	      && GET_CODE (SET_DEST (XVECEXP (next, 0, 0))) == PC)
+-	  || GET_CODE (next) == RETURN)
++	  || ANY_RETURN_P (next))
+ 	printf ("  emit_jump_insn (");
+       else if ((GET_CODE (next) == SET && GET_CODE (SET_SRC (next)) == CALL)
+ 	       || GET_CODE (next) == CALL
+
+=== modified file 'gcc/gengenrtl.c'
+--- old/gcc/gengenrtl.c	2007-08-22 23:30:39 +0000
++++ new/gcc/gengenrtl.c	2011-01-05 12:12:18 +0000
+@@ -146,6 +146,10 @@
+ 	  || strcmp (defs[idx].enumname, "REG") == 0
+ 	  || strcmp (defs[idx].enumname, "SUBREG") == 0
+ 	  || strcmp (defs[idx].enumname, "MEM") == 0
++	  || strcmp (defs[idx].enumname, "PC") == 0
++	  || strcmp (defs[idx].enumname, "CC0") == 0
++	  || strcmp (defs[idx].enumname, "RETURN") == 0
++	  || strcmp (defs[idx].enumname, "SIMPLE_RETURN") == 0
+ 	  || strcmp (defs[idx].enumname, "CONST_VECTOR") == 0);
+ }
+ 
+
+=== modified file 'gcc/haifa-sched.c'
+--- old/gcc/haifa-sched.c	2010-08-12 08:14:47 +0000
++++ new/gcc/haifa-sched.c	2011-01-05 12:12:18 +0000
+@@ -4231,7 +4231,7 @@
+ /* Helper function.
+    Find fallthru edge from PRED.  */
+ edge
+-find_fallthru_edge (basic_block pred)
++find_fallthru_edge_from (basic_block pred)
+ {
+   edge e;
+   edge_iterator ei;
+@@ -4298,7 +4298,7 @@
+   edge e;
+ 
+   last = EXIT_BLOCK_PTR->prev_bb;
+-  e = find_fallthru_edge (last);
++  e = find_fallthru_edge_from (last);
+ 
+   if (e)
+     {
+@@ -5234,6 +5234,11 @@
+ 		    gcc_assert (/* Usual case.  */
+                                 (EDGE_COUNT (bb->succs) > 1
+                                  && !BARRIER_P (NEXT_INSN (head)))
++				/* Special cases, see cfglayout.c:
++				   fixup_reorder_chain.  */
++				|| (EDGE_COUNT (bb->succs) == 1
++				    && (!onlyjump_p (head)
++					|| returnjump_p (head)))
+                                 /* Or jump to the next instruction.  */
+                                 || (EDGE_COUNT (bb->succs) == 1
+                                     && (BB_HEAD (EDGE_I (bb->succs, 0)->dest)
+
+=== modified file 'gcc/ifcvt.c'
+--- old/gcc/ifcvt.c	2010-11-26 12:03:32 +0000
++++ new/gcc/ifcvt.c	2011-01-05 12:12:18 +0000
+@@ -105,7 +105,7 @@
+ static int find_if_case_2 (basic_block, edge, edge);
+ static int find_memory (rtx *, void *);
+ static int dead_or_predicable (basic_block, basic_block, basic_block,
+-			       basic_block, int);
++			       edge, int);
+ static void noce_emit_move_insn (rtx, rtx);
+ static rtx block_has_only_trap (basic_block);
+ 
+@@ -3791,6 +3791,7 @@
+   basic_block then_bb = then_edge->dest;
+   basic_block else_bb = else_edge->dest;
+   basic_block new_bb;
++  rtx else_target = NULL_RTX;
+   int then_bb_index;
+ 
+   /* If we are partitioning hot/cold basic blocks, we don't want to
+@@ -3840,9 +3841,16 @@
+ 				    predictable_edge_p (then_edge)))))
+     return FALSE;
+ 
++  if (else_bb == EXIT_BLOCK_PTR)
++    {
++      rtx jump = BB_END (else_edge->src);
++      gcc_assert (JUMP_P (jump));
++      else_target = JUMP_LABEL (jump);
++    }
++
+   /* Registers set are dead, or are predicable.  */
+   if (! dead_or_predicable (test_bb, then_bb, else_bb,
+-			    single_succ (then_bb), 1))
++			    single_succ_edge (then_bb), 1))
+     return FALSE;
+ 
+   /* Conversion went ok, including moving the insns and fixing up the
+@@ -3859,6 +3867,9 @@
+       redirect_edge_succ (FALLTHRU_EDGE (test_bb), else_bb);
+       new_bb = 0;
+     }
++  else if (else_bb == EXIT_BLOCK_PTR)
++    new_bb = force_nonfallthru_and_redirect (FALLTHRU_EDGE (test_bb),
++					     else_bb, else_target);
+   else
+     new_bb = redirect_edge_and_branch_force (FALLTHRU_EDGE (test_bb),
+ 					     else_bb);
+@@ -3957,7 +3968,7 @@
+     return FALSE;
+ 
+   /* Registers set are dead, or are predicable.  */
+-  if (! dead_or_predicable (test_bb, else_bb, then_bb, else_succ->dest, 0))
++  if (! dead_or_predicable (test_bb, else_bb, then_bb, else_succ, 0))
+     return FALSE;
+ 
+   /* Conversion went ok, including moving the insns and fixing up the
+@@ -3995,12 +4006,34 @@
+ 
+ static int
+ dead_or_predicable (basic_block test_bb, basic_block merge_bb,
+-		    basic_block other_bb, basic_block new_dest, int reversep)
++		    basic_block other_bb, edge dest_edge, int reversep)
+ {
+-  rtx head, end, jump, earliest = NULL_RTX, old_dest, new_label = NULL_RTX;
++  basic_block new_dest = dest_edge->dest;
++  rtx head, end, jump, earliest = NULL_RTX, old_dest;
+   bitmap merge_set = NULL;
+   /* Number of pending changes.  */
+   int n_validated_changes = 0;
++  rtx new_dest_label;
++
++  jump = BB_END (dest_edge->src);
++  if (JUMP_P (jump))
++    {
++      new_dest_label = JUMP_LABEL (jump);
++      if (new_dest_label == NULL_RTX)
++	{
++	  new_dest_label = PATTERN (jump);
++	  gcc_assert (ANY_RETURN_P (new_dest_label));
++	}
++    }
++  else if (other_bb != new_dest)
++    {
++      if (new_dest == EXIT_BLOCK_PTR)
++	new_dest_label = ret_rtx;
++      else
++	new_dest_label = block_label (new_dest);
++    }
++  else
++    new_dest_label = NULL_RTX;
+ 
+   jump = BB_END (test_bb);
+ 
+@@ -4220,10 +4253,9 @@
+   old_dest = JUMP_LABEL (jump);
+   if (other_bb != new_dest)
+     {
+-      new_label = block_label (new_dest);
+       if (reversep
+-	  ? ! invert_jump_1 (jump, new_label)
+-	  : ! redirect_jump_1 (jump, new_label))
++	  ? ! invert_jump_1 (jump, new_dest_label)
++	  : ! redirect_jump_1 (jump, new_dest_label))
+ 	goto cancel;
+     }
+ 
+@@ -4234,7 +4266,7 @@
+ 
+   if (other_bb != new_dest)
+     {
+-      redirect_jump_2 (jump, old_dest, new_label, 0, reversep);
++      redirect_jump_2 (jump, old_dest, new_dest_label, 0, reversep);
+ 
+       redirect_edge_succ (BRANCH_EDGE (test_bb), new_dest);
+       if (reversep)
+
+=== modified file 'gcc/jump.c'
+--- old/gcc/jump.c	2010-12-13 10:05:52 +0000
++++ new/gcc/jump.c	2011-01-05 12:12:18 +0000
+@@ -29,7 +29,8 @@
+    JUMP_LABEL internal field.  With this we can detect labels that
+    become unused because of the deletion of all the jumps that
+    formerly used them.  The JUMP_LABEL info is sometimes looked
+-   at by later passes.
++   at by later passes.  For return insns, it contains either a
++   RETURN or a SIMPLE_RETURN rtx.
+ 
+    The subroutines redirect_jump and invert_jump are used
+    from other passes as well.  */
+@@ -742,10 +743,10 @@
+     return (GET_CODE (x) == IF_THEN_ELSE
+ 	    && ((GET_CODE (XEXP (x, 2)) == PC
+ 		 && (GET_CODE (XEXP (x, 1)) == LABEL_REF
+-		     || GET_CODE (XEXP (x, 1)) == RETURN))
++		     || ANY_RETURN_P (XEXP (x, 1))))
+ 		|| (GET_CODE (XEXP (x, 1)) == PC
+ 		    && (GET_CODE (XEXP (x, 2)) == LABEL_REF
+-			|| GET_CODE (XEXP (x, 2)) == RETURN))));
++			|| ANY_RETURN_P (XEXP (x, 2))))));
+ }
+ 
+ /* Return nonzero if INSN is a (possibly) conditional jump inside a
+@@ -774,11 +775,11 @@
+     return 0;
+   if (XEXP (SET_SRC (x), 2) == pc_rtx
+       && (GET_CODE (XEXP (SET_SRC (x), 1)) == LABEL_REF
+-	  || GET_CODE (XEXP (SET_SRC (x), 1)) == RETURN))
++	  || ANY_RETURN_P (XEXP (SET_SRC (x), 1)) == RETURN))
+     return 1;
+   if (XEXP (SET_SRC (x), 1) == pc_rtx
+       && (GET_CODE (XEXP (SET_SRC (x), 2)) == LABEL_REF
+-	  || GET_CODE (XEXP (SET_SRC (x), 2)) == RETURN))
++	  || ANY_RETURN_P (XEXP (SET_SRC (x), 2))))
+     return 1;
+   return 0;
+ }
+@@ -840,8 +841,9 @@
+   a = GET_CODE (XEXP (SET_SRC (x), 1));
+   b = GET_CODE (XEXP (SET_SRC (x), 2));
+ 
+-  return ((b == PC && (a == LABEL_REF || a == RETURN))
+-	  || (a == PC && (b == LABEL_REF || b == RETURN)));
++  return ((b == PC && (a == LABEL_REF || a == RETURN || a == SIMPLE_RETURN))
++	  || (a == PC
++	      && (b == LABEL_REF || b == RETURN || b == SIMPLE_RETURN)));
+ }
+ 
+ /* Return the label of a conditional jump.  */
+@@ -878,6 +880,7 @@
+   switch (GET_CODE (x))
+     {
+     case RETURN:
++    case SIMPLE_RETURN:
+     case EH_RETURN:
+       return true;
+ 
+@@ -1200,7 +1203,7 @@
+   /* If deleting a jump, decrement the count of the label,
+      and delete the label if it is now unused.  */
+ 
+-  if (JUMP_P (insn) && JUMP_LABEL (insn))
++  if (JUMP_P (insn) && JUMP_LABEL (insn) && !ANY_RETURN_P (JUMP_LABEL (insn)))
+     {
+       rtx lab = JUMP_LABEL (insn), lab_next;
+ 
+@@ -1331,6 +1334,18 @@
+      is also an unconditional jump in that case.  */
+ }
+ 
++/* A helper function for redirect_exp_1; examines its input X and returns
++   either a LABEL_REF around a label, or a RETURN if X was NULL.  */
++static rtx
++redirect_target (rtx x)
++{
++  if (x == NULL_RTX)
++    return ret_rtx;
++  if (!ANY_RETURN_P (x))
++    return gen_rtx_LABEL_REF (Pmode, x);
++  return x;
++}
++
+ /* Throughout LOC, redirect OLABEL to NLABEL.  Treat null OLABEL or
+    NLABEL as a return.  Accrue modifications into the change group.  */
+ 
+@@ -1342,37 +1357,19 @@
+   int i;
+   const char *fmt;
+ 
+-  if (code == LABEL_REF)
+-    {
+-      if (XEXP (x, 0) == olabel)
+-	{
+-	  rtx n;
+-	  if (nlabel)
+-	    n = gen_rtx_LABEL_REF (Pmode, nlabel);
+-	  else
+-	    n = gen_rtx_RETURN (VOIDmode);
+-
+-	  validate_change (insn, loc, n, 1);
+-	  return;
+-	}
+-    }
+-  else if (code == RETURN && olabel == 0)
+-    {
+-      if (nlabel)
+-	x = gen_rtx_LABEL_REF (Pmode, nlabel);
+-      else
+-	x = gen_rtx_RETURN (VOIDmode);
+-      if (loc == &PATTERN (insn))
+-	x = gen_rtx_SET (VOIDmode, pc_rtx, x);
+-      validate_change (insn, loc, x, 1);
++  if ((code == LABEL_REF && XEXP (x, 0) == olabel)
++      || x == olabel)
++    {
++      validate_change (insn, loc, redirect_target (nlabel), 1);
+       return;
+     }
+ 
+-  if (code == SET && nlabel == 0 && SET_DEST (x) == pc_rtx
++  if (code == SET && SET_DEST (x) == pc_rtx
++      && ANY_RETURN_P (nlabel)
+       && GET_CODE (SET_SRC (x)) == LABEL_REF
+       && XEXP (SET_SRC (x), 0) == olabel)
+     {
+-      validate_change (insn, loc, gen_rtx_RETURN (VOIDmode), 1);
++      validate_change (insn, loc, nlabel, 1);
+       return;
+     }
+ 
+@@ -1409,6 +1406,7 @@
+   int ochanges = num_validated_changes ();
+   rtx *loc, asmop;
+ 
++  gcc_assert (nlabel);
+   asmop = extract_asm_operands (PATTERN (jump));
+   if (asmop)
+     {
+@@ -1430,17 +1428,20 @@
+    jump target label is unused as a result, it and the code following
+    it may be deleted.
+ 
+-   If NLABEL is zero, we are to turn the jump into a (possibly conditional)
+-   RETURN insn.
++   Normally, NLABEL will be a label, but it may also be a RETURN or
++   SIMPLE_RETURN rtx; in that case we are to turn the jump into a
++   (possibly conditional) return insn.
+ 
+    The return value will be 1 if the change was made, 0 if it wasn't
+-   (this can only occur for NLABEL == 0).  */
++   (this can only occur when trying to produce return insns).  */
+ 
+ int
+ redirect_jump (rtx jump, rtx nlabel, int delete_unused)
+ {
+   rtx olabel = JUMP_LABEL (jump);
+ 
++  gcc_assert (nlabel != NULL_RTX);
++
+   if (nlabel == olabel)
+     return 1;
+ 
+@@ -1452,7 +1453,7 @@
+ }
+ 
+ /* Fix up JUMP_LABEL and label ref counts after OLABEL has been replaced with
+-   NLABEL in JUMP.
++   NEW_DEST in JUMP.
+    If DELETE_UNUSED is positive, delete related insn to OLABEL if its ref
+    count has dropped to zero.  */
+ void
+@@ -1468,13 +1469,14 @@
+      about this.  */
+   gcc_assert (delete_unused >= 0);
+   JUMP_LABEL (jump) = nlabel;
+-  if (nlabel)
++  if (nlabel && !ANY_RETURN_P (nlabel))
+     ++LABEL_NUSES (nlabel);
+ 
+   /* Update labels in any REG_EQUAL note.  */
+   if ((note = find_reg_note (jump, REG_EQUAL, NULL_RTX)) != NULL_RTX)
+     {
+-      if (!nlabel || (invert && !invert_exp_1 (XEXP (note, 0), jump)))
++      if (ANY_RETURN_P (nlabel)
++	  || (invert && !invert_exp_1 (XEXP (note, 0), jump)))
+ 	remove_note (jump, note);
+       else
+ 	{
+@@ -1483,7 +1485,8 @@
+ 	}
+     }
+ 
+-  if (olabel && --LABEL_NUSES (olabel) == 0 && delete_unused > 0
++  if (olabel && !ANY_RETURN_P (olabel)
++      && --LABEL_NUSES (olabel) == 0 && delete_unused > 0
+       /* Undefined labels will remain outside the insn stream.  */
+       && INSN_UID (olabel))
+     delete_related_insns (olabel);
+
+=== modified file 'gcc/opts.c'
+--- old/gcc/opts.c	2010-12-10 15:33:37 +0000
++++ new/gcc/opts.c	2011-01-05 12:12:18 +0000
+@@ -908,6 +908,7 @@
+   flag_ipa_cp = opt2;
+   flag_ipa_sra = opt2;
+   flag_ee = opt2;
++  flag_shrink_wrap = opt2;
+ 
+   /* Track fields in field-sensitive alias analysis.  */
+   set_param_value ("max-fields-for-field-sensitive",
+
+=== modified file 'gcc/print-rtl.c'
+--- old/gcc/print-rtl.c	2010-03-26 16:18:51 +0000
++++ new/gcc/print-rtl.c	2011-01-05 12:12:18 +0000
+@@ -308,9 +308,16 @@
+ 	      }
+ 	  }
+ 	else if (i == 8 && JUMP_P (in_rtx) && JUMP_LABEL (in_rtx) != NULL)
+-	  /* Output the JUMP_LABEL reference.  */
+-	  fprintf (outfile, "\n%s%*s -> %d", print_rtx_head, indent * 2, "",
+-		   INSN_UID (JUMP_LABEL (in_rtx)));
++	  {
++	    /* Output the JUMP_LABEL reference.  */
++	    fprintf (outfile, "\n%s%*s -> ", print_rtx_head, indent * 2, "");
++	    if (GET_CODE (JUMP_LABEL (in_rtx)) == RETURN)
++	      fprintf (outfile, "return");
++	    else if (GET_CODE (JUMP_LABEL (in_rtx)) == SIMPLE_RETURN)
++	      fprintf (outfile, "simple_return");
++	    else
++	      fprintf (outfile, "%d", INSN_UID (JUMP_LABEL (in_rtx)));
++	  }
+ 	else if (i == 0 && GET_CODE (in_rtx) == VALUE)
+ 	  {
+ #ifndef GENERATOR_FILE
+
+=== modified file 'gcc/reorg.c'
+--- old/gcc/reorg.c	2010-09-15 22:51:44 +0000
++++ new/gcc/reorg.c	2011-01-05 12:12:18 +0000
+@@ -161,8 +161,11 @@
+ #define unfilled_slots_next	\
+   ((rtx *) obstack_next_free (&unfilled_slots_obstack))
+ 
+-/* Points to the label before the end of the function.  */
+-static rtx end_of_function_label;
++/* Points to the label before the end of the function, or before a
++   return insn.  */
++static rtx function_return_label;
++/* Likewise for a simple_return.  */
++static rtx function_simple_return_label;
+ 
+ /* Mapping between INSN_UID's and position in the code since INSN_UID's do
+    not always monotonically increase.  */
+@@ -175,7 +178,7 @@
+ static int resource_conflicts_p (struct resources *, struct resources *);
+ static int insn_references_resource_p (rtx, struct resources *, bool);
+ static int insn_sets_resource_p (rtx, struct resources *, bool);
+-static rtx find_end_label (void);
++static rtx find_end_label (rtx);
+ static rtx emit_delay_sequence (rtx, rtx, int);
+ static rtx add_to_delay_list (rtx, rtx);
+ static rtx delete_from_delay_slot (rtx);
+@@ -220,6 +223,15 @@
+ static void make_return_insns (rtx);
+ #endif
+ 
++/* Return true iff INSN is a simplejump, or any kind of return insn.  */
++
++static bool
++simplejump_or_return_p (rtx insn)
++{
++  return (JUMP_P (insn)
++	  && (simplejump_p (insn) || ANY_RETURN_P (PATTERN (insn))));
++}
++
+ /* Return TRUE if this insn should stop the search for insn to fill delay
+    slots.  LABELS_P indicates that labels should terminate the search.
+    In all cases, jumps terminate the search.  */
+@@ -335,23 +347,29 @@
+ 
+    ??? There may be a problem with the current implementation.  Suppose
+    we start with a bare RETURN insn and call find_end_label.  It may set
+-   end_of_function_label just before the RETURN.  Suppose the machinery
++   function_return_label just before the RETURN.  Suppose the machinery
+    is able to fill the delay slot of the RETURN insn afterwards.  Then
+-   end_of_function_label is no longer valid according to the property
++   function_return_label is no longer valid according to the property
+    described above and find_end_label will still return it unmodified.
+    Note that this is probably mitigated by the following observation:
+-   once end_of_function_label is made, it is very likely the target of
++   once function_return_label is made, it is very likely the target of
+    a jump, so filling the delay slot of the RETURN will be much more
+    difficult.  */
+ 
+ static rtx
+-find_end_label (void)
++find_end_label (rtx kind)
+ {
+   rtx insn;
++  rtx *plabel;
++
++  if (kind == ret_rtx)
++    plabel = &function_return_label;
++  else
++    plabel = &function_simple_return_label;
+ 
+   /* If we found one previously, return it.  */
+-  if (end_of_function_label)
+-    return end_of_function_label;
++  if (*plabel)
++    return *plabel;
+ 
+   /* Otherwise, see if there is a label at the end of the function.  If there
+      is, it must be that RETURN insns aren't needed, so that is our return
+@@ -366,44 +384,44 @@
+ 
+   /* When a target threads its epilogue we might already have a
+      suitable return insn.  If so put a label before it for the
+-     end_of_function_label.  */
++     function_return_label.  */
+   if (BARRIER_P (insn)
+       && JUMP_P (PREV_INSN (insn))
+-      && GET_CODE (PATTERN (PREV_INSN (insn))) == RETURN)
++      && PATTERN (PREV_INSN (insn)) == kind)
+     {
+       rtx temp = PREV_INSN (PREV_INSN (insn));
+-      end_of_function_label = gen_label_rtx ();
+-      LABEL_NUSES (end_of_function_label) = 0;
++      rtx label = gen_label_rtx ();
++      LABEL_NUSES (label) = 0;
+ 
+       /* Put the label before an USE insns that may precede the RETURN insn.  */
+       while (GET_CODE (temp) == USE)
+ 	temp = PREV_INSN (temp);
+ 
+-      emit_label_after (end_of_function_label, temp);
++      emit_label_after (label, temp);
++      *plabel = label;
+     }
+ 
+   else if (LABEL_P (insn))
+-    end_of_function_label = insn;
++    *plabel = insn;
+   else
+     {
+-      end_of_function_label = gen_label_rtx ();
+-      LABEL_NUSES (end_of_function_label) = 0;
++      rtx label = gen_label_rtx ();
++      LABEL_NUSES (label) = 0;
+       /* If the basic block reorder pass moves the return insn to
+ 	 some other place try to locate it again and put our
+-	 end_of_function_label there.  */
+-      while (insn && ! (JUMP_P (insn)
+-		        && (GET_CODE (PATTERN (insn)) == RETURN)))
++	 function_return_label there.  */
++      while (insn && ! (JUMP_P (insn) && (PATTERN (insn) == kind)))
+ 	insn = PREV_INSN (insn);
+       if (insn)
+ 	{
+ 	  insn = PREV_INSN (insn);
+ 
+-	  /* Put the label before an USE insns that may proceed the
++	  /* Put the label before an USE insns that may precede the
+ 	     RETURN insn.  */
+ 	  while (GET_CODE (insn) == USE)
+ 	    insn = PREV_INSN (insn);
+ 
+-	  emit_label_after (end_of_function_label, insn);
++	  emit_label_after (label, insn);
+ 	}
+       else
+ 	{
+@@ -413,19 +431,16 @@
+ 	      && ! HAVE_return
+ #endif
+ 	      )
+-	    {
+-	      /* The RETURN insn has its delay slot filled so we cannot
+-		 emit the label just before it.  Since we already have
+-		 an epilogue and cannot emit a new RETURN, we cannot
+-		 emit the label at all.  */
+-	      end_of_function_label = NULL_RTX;
+-	      return end_of_function_label;
+-	    }
++	    /* The RETURN insn has its delay slot filled so we cannot
++	       emit the label just before it.  Since we already have
++	       an epilogue and cannot emit a new RETURN, we cannot
++	       emit the label at all.  */
++	    return NULL_RTX;
+ #endif /* HAVE_epilogue */
+ 
+ 	  /* Otherwise, make a new label and emit a RETURN and BARRIER,
+ 	     if needed.  */
+-	  emit_label (end_of_function_label);
++	  emit_label (label);
+ #ifdef HAVE_return
+ 	  /* We don't bother trying to create a return insn if the
+ 	     epilogue has filled delay-slots; we would have to try and
+@@ -437,19 +452,21 @@
+ 	      /* The return we make may have delay slots too.  */
+ 	      rtx insn = gen_return ();
+ 	      insn = emit_jump_insn (insn);
++	      JUMP_LABEL (insn) = ret_rtx;
+ 	      emit_barrier ();
+ 	      if (num_delay_slots (insn) > 0)
+ 		obstack_ptr_grow (&unfilled_slots_obstack, insn);
+ 	    }
+ #endif
+ 	}
++      *plabel = label;
+     }
+ 
+   /* Show one additional use for this label so it won't go away until
+      we are done.  */
+-  ++LABEL_NUSES (end_of_function_label);
++  ++LABEL_NUSES (*plabel);
+ 
+-  return end_of_function_label;
++  return *plabel;
+ }
+ 
+ /* Put INSN and LIST together in a SEQUENCE rtx of LENGTH, and replace
+@@ -797,10 +814,8 @@
+   if ((next_trial == next_active_insn (JUMP_LABEL (insn))
+        && ! (next_trial == 0 && crtl->epilogue_delay_list != 0))
+       || (next_trial != 0
+-	  && JUMP_P (next_trial)
+-	  && JUMP_LABEL (insn) == JUMP_LABEL (next_trial)
+-	  && (simplejump_p (next_trial)
+-	      || GET_CODE (PATTERN (next_trial)) == RETURN)))
++	  && simplejump_or_return_p (next_trial)
++	  && JUMP_LABEL (insn) == JUMP_LABEL (next_trial)))
+     {
+       if (eligible_for_annul_false (insn, 0, trial, flags))
+ 	{
+@@ -819,13 +834,11 @@
+ 	 branch, thread our jump to the target of that branch.  Don't
+ 	 change this into a RETURN here, because it may not accept what
+ 	 we have in the delay slot.  We'll fix this up later.  */
+-      if (next_trial && JUMP_P (next_trial)
+-	  && (simplejump_p (next_trial)
+-	      || GET_CODE (PATTERN (next_trial)) == RETURN))
++      if (next_trial && simplejump_or_return_p (next_trial))
+ 	{
+ 	  rtx target_label = JUMP_LABEL (next_trial);
+-	  if (target_label == 0)
+-	    target_label = find_end_label ();
++	  if (ANY_RETURN_P (target_label))
++	    target_label = find_end_label (target_label);
+ 
+ 	  if (target_label)
+ 	    {
+@@ -866,7 +879,7 @@
+   if (JUMP_P (insn)
+       && (condjump_p (insn) || condjump_in_parallel_p (insn))
+       && INSN_UID (insn) <= max_uid
+-      && label != 0
++      && label != 0 && !ANY_RETURN_P (label)
+       && INSN_UID (label) <= max_uid)
+     flags
+       = (uid_to_ruid[INSN_UID (label)] > uid_to_ruid[INSN_UID (insn)])
+@@ -1038,7 +1051,7 @@
+     pat = XVECEXP (pat, 0, 0);
+ 
+   if (GET_CODE (pat) == RETURN)
+-    return target == 0 ? const_true_rtx : 0;
++    return ANY_RETURN_P (target) ? const_true_rtx : 0;
+ 
+   else if (GET_CODE (pat) != SET || SET_DEST (pat) != pc_rtx)
+     return 0;
+@@ -1318,7 +1331,11 @@
+     }
+ 
+   /* Show the place to which we will be branching.  */
+-  *pnew_thread = next_active_insn (JUMP_LABEL (XVECEXP (seq, 0, 0)));
++  temp = JUMP_LABEL (XVECEXP (seq, 0, 0));
++  if (ANY_RETURN_P (temp))
++    *pnew_thread = temp;
++  else
++    *pnew_thread = next_active_insn (temp);
+ 
+   /* Add any new insns to the delay list and update the count of the
+      number of slots filled.  */
+@@ -1358,8 +1375,7 @@
+   /* We can't do anything if SEQ's delay insn isn't an
+      unconditional branch.  */
+ 
+-  if (! simplejump_p (XVECEXP (seq, 0, 0))
+-      && GET_CODE (PATTERN (XVECEXP (seq, 0, 0))) != RETURN)
++  if (! simplejump_or_return_p (XVECEXP (seq, 0, 0)))
+     return delay_list;
+ 
+   for (i = 1; i < XVECLEN (seq, 0); i++)
+@@ -1827,7 +1843,7 @@
+   rtx insn;
+ 
+   /* We don't own the function end.  */
+-  if (thread == 0)
++  if (ANY_RETURN_P (thread))
+     return 0;
+ 
+   /* Get the first active insn, or THREAD, if it is an active insn.  */
+@@ -2245,7 +2261,8 @@
+ 	  && (!JUMP_P (insn)
+ 	      || ((condjump_p (insn) || condjump_in_parallel_p (insn))
+ 		  && ! simplejump_p (insn)
+-		  && JUMP_LABEL (insn) != 0)))
++		  && JUMP_LABEL (insn) != 0
++		  && !ANY_RETURN_P (JUMP_LABEL (insn)))))
+ 	{
+ 	  /* Invariant: If insn is a JUMP_INSN, the insn's jump
+ 	     label.  Otherwise, zero.  */
+@@ -2270,7 +2287,7 @@
+ 		target = JUMP_LABEL (insn);
+ 	    }
+ 
+-	  if (target == 0)
++	  if (target == 0 || ANY_RETURN_P (target))
+ 	    for (trial = next_nonnote_insn (insn); trial; trial = next_trial)
+ 	      {
+ 		next_trial = next_nonnote_insn (trial);
+@@ -2349,6 +2366,7 @@
+ 	      && JUMP_P (trial)
+ 	      && simplejump_p (trial)
+ 	      && (target == 0 || JUMP_LABEL (trial) == target)
++	      && !ANY_RETURN_P (JUMP_LABEL (trial))
+ 	      && (next_trial = next_active_insn (JUMP_LABEL (trial))) != 0
+ 	      && ! (NONJUMP_INSN_P (next_trial)
+ 		    && GET_CODE (PATTERN (next_trial)) == SEQUENCE)
+@@ -2371,7 +2389,7 @@
+ 	      if (new_label != 0)
+ 		new_label = get_label_before (new_label);
+ 	      else
+-		new_label = find_end_label ();
++		new_label = find_end_label (simple_return_rtx);
+ 
+ 	      if (new_label)
+ 	        {
+@@ -2503,7 +2521,8 @@
+ 
+ /* Follow any unconditional jump at LABEL;
+    return the ultimate label reached by any such chain of jumps.
+-   Return null if the chain ultimately leads to a return instruction.
++   Return a suitable return rtx if the chain ultimately leads to a
++   return instruction.
+    If LABEL is not followed by a jump, return LABEL.
+    If the chain loops or we can't find end, return LABEL,
+    since that tells caller to avoid changing the insn.  */
+@@ -2518,6 +2537,7 @@
+ 
+   for (depth = 0;
+        (depth < 10
++	&& !ANY_RETURN_P (value)
+ 	&& (insn = next_active_insn (value)) != 0
+ 	&& JUMP_P (insn)
+ 	&& ((JUMP_LABEL (insn) != 0 && any_uncondjump_p (insn)
+@@ -2527,18 +2547,22 @@
+ 	&& BARRIER_P (next));
+        depth++)
+     {
+-      rtx tem;
++      rtx this_label = JUMP_LABEL (insn);
+ 
+       /* If we have found a cycle, make the insn jump to itself.  */
+-      if (JUMP_LABEL (insn) == label)
++      if (this_label == label)
+ 	return label;
+ 
+-      tem = next_active_insn (JUMP_LABEL (insn));
+-      if (tem && (GET_CODE (PATTERN (tem)) == ADDR_VEC
++      if (!ANY_RETURN_P (this_label))
++	{
++	  rtx tem = next_active_insn (this_label);
++	  if (tem
++	      && (GET_CODE (PATTERN (tem)) == ADDR_VEC
+ 		  || GET_CODE (PATTERN (tem)) == ADDR_DIFF_VEC))
+-	break;
++	    break;
++	}
+ 
+-      value = JUMP_LABEL (insn);
++      value = this_label;
+     }
+   if (depth == 10)
+     return label;
+@@ -2901,6 +2925,7 @@
+      arithmetic insn after the jump insn and put the arithmetic insn in the
+      delay slot.  If we can't do this, return.  */
+   if (delay_list == 0 && likely && new_thread
++      && !ANY_RETURN_P (new_thread)
+       && NONJUMP_INSN_P (new_thread)
+       && GET_CODE (PATTERN (new_thread)) != ASM_INPUT
+       && asm_noperands (PATTERN (new_thread)) < 0)
+@@ -2985,16 +3010,14 @@
+ 
+       gcc_assert (thread_if_true);
+ 
+-      if (new_thread && JUMP_P (new_thread)
+-	  && (simplejump_p (new_thread)
+-	      || GET_CODE (PATTERN (new_thread)) == RETURN)
++      if (new_thread && simplejump_or_return_p (new_thread)
+ 	  && redirect_with_delay_list_safe_p (insn,
+ 					      JUMP_LABEL (new_thread),
+ 					      delay_list))
+ 	new_thread = follow_jumps (JUMP_LABEL (new_thread));
+ 
+-      if (new_thread == 0)
+-	label = find_end_label ();
++      if (ANY_RETURN_P (new_thread))
++	label = find_end_label (new_thread);
+       else if (LABEL_P (new_thread))
+ 	label = new_thread;
+       else
+@@ -3340,11 +3363,12 @@
+ 	 group of consecutive labels.  */
+       if (JUMP_P (insn)
+ 	  && (condjump_p (insn) || condjump_in_parallel_p (insn))
+-	  && (target_label = JUMP_LABEL (insn)) != 0)
++	  && (target_label = JUMP_LABEL (insn)) != 0
++	  && !ANY_RETURN_P (target_label))
+ 	{
+ 	  target_label = skip_consecutive_labels (follow_jumps (target_label));
+-	  if (target_label == 0)
+-	    target_label = find_end_label ();
++	  if (ANY_RETURN_P (target_label))
++	    target_label = find_end_label (target_label);
+ 
+ 	  if (target_label && next_active_insn (target_label) == next
+ 	      && ! condjump_in_parallel_p (insn))
+@@ -3359,9 +3383,8 @@
+ 	  /* See if this jump conditionally branches around an unconditional
+ 	     jump.  If so, invert this jump and point it to the target of the
+ 	     second jump.  */
+-	  if (next && JUMP_P (next)
++	  if (next && simplejump_or_return_p (next)
+ 	      && any_condjump_p (insn)
+-	      && (simplejump_p (next) || GET_CODE (PATTERN (next)) == RETURN)
+ 	      && target_label
+ 	      && next_active_insn (target_label) == next_active_insn (next)
+ 	      && no_labels_between_p (insn, next))
+@@ -3403,8 +3426,7 @@
+ 	 Don't do this if we expect the conditional branch to be true, because
+ 	 we would then be making the more common case longer.  */
+ 
+-      if (JUMP_P (insn)
+-	  && (simplejump_p (insn) || GET_CODE (PATTERN (insn)) == RETURN)
++      if (simplejump_or_return_p (insn)
+ 	  && (other = prev_active_insn (insn)) != 0
+ 	  && any_condjump_p (other)
+ 	  && no_labels_between_p (other, insn)
+@@ -3445,10 +3467,10 @@
+ 	 Only do so if optimizing for size since this results in slower, but
+ 	 smaller code.  */
+       if (optimize_function_for_size_p (cfun)
+-	  && GET_CODE (PATTERN (delay_insn)) == RETURN
++	  && ANY_RETURN_P (PATTERN (delay_insn))
+ 	  && next
+ 	  && JUMP_P (next)
+-	  && GET_CODE (PATTERN (next)) == RETURN)
++	  && PATTERN (next) == PATTERN (delay_insn))
+ 	{
+ 	  rtx after;
+ 	  int i;
+@@ -3487,14 +3509,16 @@
+ 	continue;
+ 
+       target_label = JUMP_LABEL (delay_insn);
++      if (target_label && ANY_RETURN_P (target_label))
++	continue;
+ 
+       if (target_label)
+ 	{
+ 	  /* If this jump goes to another unconditional jump, thread it, but
+ 	     don't convert a jump into a RETURN here.  */
+ 	  trial = skip_consecutive_labels (follow_jumps (target_label));
+-	  if (trial == 0)
+-	    trial = find_end_label ();
++	  if (ANY_RETURN_P (trial))
++	    trial = find_end_label (trial);
+ 
+ 	  if (trial && trial != target_label
+ 	      && redirect_with_delay_slots_safe_p (delay_insn, trial, insn))
+@@ -3517,7 +3541,7 @@
+ 		 later incorrectly compute register live/death info.  */
+ 	      rtx tmp = next_active_insn (trial);
+ 	      if (tmp == 0)
+-		tmp = find_end_label ();
++		tmp = find_end_label (simple_return_rtx);
+ 
+ 	      if (tmp)
+ 	        {
+@@ -3537,14 +3561,12 @@
+ 	     delay list and that insn is redundant, thread the jump.  */
+ 	  if (trial && GET_CODE (PATTERN (trial)) == SEQUENCE
+ 	      && XVECLEN (PATTERN (trial), 0) == 2
+-	      && JUMP_P (XVECEXP (PATTERN (trial), 0, 0))
+-	      && (simplejump_p (XVECEXP (PATTERN (trial), 0, 0))
+-		  || GET_CODE (PATTERN (XVECEXP (PATTERN (trial), 0, 0))) == RETURN)
++	      && simplejump_or_return_p (XVECEXP (PATTERN (trial), 0, 0))
+ 	      && redundant_insn (XVECEXP (PATTERN (trial), 0, 1), insn, 0))
+ 	    {
+ 	      target_label = JUMP_LABEL (XVECEXP (PATTERN (trial), 0, 0));
+-	      if (target_label == 0)
+-		target_label = find_end_label ();
++	      if (ANY_RETURN_P (target_label))
++		target_label = find_end_label (target_label);
+ 
+ 	      if (target_label
+ 	          && redirect_with_delay_slots_safe_p (delay_insn, target_label,
+@@ -3622,16 +3644,15 @@
+ 	 a RETURN here.  */
+       if (! INSN_ANNULLED_BRANCH_P (delay_insn)
+ 	  && any_condjump_p (delay_insn)
+-	  && next && JUMP_P (next)
+-	  && (simplejump_p (next) || GET_CODE (PATTERN (next)) == RETURN)
++	  && next && simplejump_or_return_p (next)
+ 	  && next_active_insn (target_label) == next_active_insn (next)
+ 	  && no_labels_between_p (insn, next))
+ 	{
+ 	  rtx label = JUMP_LABEL (next);
+ 	  rtx old_label = JUMP_LABEL (delay_insn);
+ 
+-	  if (label == 0)
+-	    label = find_end_label ();
++	  if (ANY_RETURN_P (label))
++	    label = find_end_label (label);
+ 
+ 	  /* find_end_label can generate a new label. Check this first.  */
+ 	  if (label
+@@ -3692,7 +3713,8 @@
+ make_return_insns (rtx first)
+ {
+   rtx insn, jump_insn, pat;
+-  rtx real_return_label = end_of_function_label;
++  rtx real_return_label = function_return_label;
++  rtx real_simple_return_label = function_simple_return_label;
+   int slots, i;
+ 
+ #ifdef DELAY_SLOTS_FOR_EPILOGUE
+@@ -3707,18 +3729,25 @@
+ #endif
+ 
+   /* See if there is a RETURN insn in the function other than the one we
+-     made for END_OF_FUNCTION_LABEL.  If so, set up anything we can't change
++     made for FUNCTION_RETURN_LABEL.  If so, set up anything we can't change
+      into a RETURN to jump to it.  */
+   for (insn = first; insn; insn = NEXT_INSN (insn))
+-    if (JUMP_P (insn) && GET_CODE (PATTERN (insn)) == RETURN)
++    if (JUMP_P (insn) && ANY_RETURN_P (PATTERN (insn)))
+       {
+-	real_return_label = get_label_before (insn);
++	rtx t = get_label_before (insn);
++	if (PATTERN (insn) == ret_rtx)
++	  real_return_label = t;
++	else
++	  real_simple_return_label = t;
+ 	break;
+       }
+ 
+   /* Show an extra usage of REAL_RETURN_LABEL so it won't go away if it
+-     was equal to END_OF_FUNCTION_LABEL.  */
+-  LABEL_NUSES (real_return_label)++;
++     was equal to FUNCTION_RETURN_LABEL.  */
++  if (real_return_label)
++    LABEL_NUSES (real_return_label)++;
++  if (real_simple_return_label)
++    LABEL_NUSES (real_simple_return_label)++;
+ 
+   /* Clear the list of insns to fill so we can use it.  */
+   obstack_free (&unfilled_slots_obstack, unfilled_firstobj);
+@@ -3726,13 +3755,27 @@
+   for (insn = first; insn; insn = NEXT_INSN (insn))
+     {
+       int flags;
++      rtx kind, real_label;
+ 
+       /* Only look at filled JUMP_INSNs that go to the end of function
+ 	 label.  */
+       if (!NONJUMP_INSN_P (insn)
+ 	  || GET_CODE (PATTERN (insn)) != SEQUENCE
+-	  || !JUMP_P (XVECEXP (PATTERN (insn), 0, 0))
+-	  || JUMP_LABEL (XVECEXP (PATTERN (insn), 0, 0)) != end_of_function_label)
++	  || !JUMP_P (XVECEXP (PATTERN (insn), 0, 0)))
++	continue;
++
++      if (JUMP_LABEL (XVECEXP (PATTERN (insn), 0, 0)) == function_return_label)
++	{
++	  kind = ret_rtx;
++	  real_label = real_return_label;
++	}
++      else if (JUMP_LABEL (XVECEXP (PATTERN (insn), 0, 0))
++	       == function_simple_return_label)
++	{
++	  kind = simple_return_rtx;
++	  real_label = real_simple_return_label;
++	}
++      else
+ 	continue;
+ 
+       pat = PATTERN (insn);
+@@ -3740,14 +3783,12 @@
+ 
+       /* If we can't make the jump into a RETURN, try to redirect it to the best
+ 	 RETURN and go on to the next insn.  */
+-      if (! reorg_redirect_jump (jump_insn, NULL_RTX))
++      if (! reorg_redirect_jump (jump_insn, kind))
+ 	{
+ 	  /* Make sure redirecting the jump will not invalidate the delay
+ 	     slot insns.  */
+-	  if (redirect_with_delay_slots_safe_p (jump_insn,
+-						real_return_label,
+-						insn))
+-	    reorg_redirect_jump (jump_insn, real_return_label);
++	  if (redirect_with_delay_slots_safe_p (jump_insn, real_label, insn))
++	    reorg_redirect_jump (jump_insn, real_label);
+ 	  continue;
+ 	}
+ 
+@@ -3787,7 +3828,7 @@
+ 	 RETURN, delete the SEQUENCE and output the individual insns,
+ 	 followed by the RETURN.  Then set things up so we try to find
+ 	 insns for its delay slots, if it needs some.  */
+-      if (GET_CODE (PATTERN (jump_insn)) == RETURN)
++      if (ANY_RETURN_P (PATTERN (jump_insn)))
+ 	{
+ 	  rtx prev = PREV_INSN (insn);
+ 
+@@ -3804,13 +3845,16 @@
+       else
+ 	/* It is probably more efficient to keep this with its current
+ 	   delay slot as a branch to a RETURN.  */
+-	reorg_redirect_jump (jump_insn, real_return_label);
++	reorg_redirect_jump (jump_insn, real_label);
+     }
+ 
+   /* Now delete REAL_RETURN_LABEL if we never used it.  Then try to fill any
+      new delay slots we have created.  */
+-  if (--LABEL_NUSES (real_return_label) == 0)
++  if (real_return_label != NULL_RTX && --LABEL_NUSES (real_return_label) == 0)
+     delete_related_insns (real_return_label);
++  if (real_simple_return_label != NULL_RTX
++      && --LABEL_NUSES (real_simple_return_label) == 0)
++    delete_related_insns (real_simple_return_label);
+ 
+   fill_simple_delay_slots (1);
+   fill_simple_delay_slots (0);
+@@ -3878,7 +3922,7 @@
+   init_resource_info (epilogue_insn);
+ 
+   /* Show we haven't computed an end-of-function label yet.  */
+-  end_of_function_label = 0;
++  function_return_label = function_simple_return_label = NULL_RTX;
+ 
+   /* Initialize the statistics for this function.  */
+   memset (num_insns_needing_delays, 0, sizeof num_insns_needing_delays);
+@@ -3900,11 +3944,23 @@
+   /* If we made an end of function label, indicate that it is now
+      safe to delete it by undoing our prior adjustment to LABEL_NUSES.
+      If it is now unused, delete it.  */
+-  if (end_of_function_label && --LABEL_NUSES (end_of_function_label) == 0)
+-    delete_related_insns (end_of_function_label);
++  if (function_return_label && --LABEL_NUSES (function_return_label) == 0)
++    delete_related_insns (function_return_label);
++  if (function_simple_return_label
++      && --LABEL_NUSES (function_simple_return_label) == 0)
++    delete_related_insns (function_simple_return_label);
+ 
++#if defined HAVE_return || defined HAVE_simple_return
++  if (
+ #ifdef HAVE_return
+-  if (HAVE_return && end_of_function_label != 0)
++      (HAVE_return && function_return_label != 0)
++#else
++      0
++#endif
++#ifdef HAVE_simple_return
++      || (HAVE_simple_return && function_simple_return_label != 0)
++#endif
++      )
+     make_return_insns (first);
+ #endif
+ 
+
+=== modified file 'gcc/resource.c'
+--- old/gcc/resource.c	2009-11-25 10:55:54 +0000
++++ new/gcc/resource.c	2011-01-05 12:12:18 +0000
+@@ -495,6 +495,8 @@
+ 		  || GET_CODE (PATTERN (this_jump_insn)) == RETURN)
+ 		{
+ 		  next = JUMP_LABEL (this_jump_insn);
++		  if (next && ANY_RETURN_P (next))
++		    next = NULL_RTX;
+ 		  if (jump_insn == 0)
+ 		    {
+ 		      jump_insn = insn;
+@@ -562,9 +564,10 @@
+ 		  AND_COMPL_HARD_REG_SET (scratch, needed.regs);
+ 		  AND_COMPL_HARD_REG_SET (fallthrough_res.regs, scratch);
+ 
+-		  find_dead_or_set_registers (JUMP_LABEL (this_jump_insn),
+-					      &target_res, 0, jump_count,
+-					      target_set, needed);
++		  if (!ANY_RETURN_P (JUMP_LABEL (this_jump_insn)))
++		    find_dead_or_set_registers (JUMP_LABEL (this_jump_insn),
++						&target_res, 0, jump_count,
++						target_set, needed);
+ 		  find_dead_or_set_registers (next,
+ 					      &fallthrough_res, 0, jump_count,
+ 					      set, needed);
+@@ -1097,6 +1100,8 @@
+       struct resources new_resources;
+       rtx stop_insn = next_active_insn (jump_insn);
+ 
++      if (jump_target && ANY_RETURN_P (jump_target))
++	jump_target = NULL_RTX;
+       mark_target_live_regs (insns, next_active_insn (jump_target),
+ 			     &new_resources);
+       CLEAR_RESOURCE (&set);
+
+=== modified file 'gcc/rtl.c'
+--- old/gcc/rtl.c	2010-12-13 10:05:52 +0000
++++ new/gcc/rtl.c	2011-01-05 12:12:18 +0000
+@@ -256,6 +256,8 @@
+     case CODE_LABEL:
+     case PC:
+     case CC0:
++    case RETURN:
++    case SIMPLE_RETURN:
+     case SCRATCH:
+       /* SCRATCH must be shared because they represent distinct values.  */
+       return orig;
+
+=== modified file 'gcc/rtl.def'
+--- old/gcc/rtl.def	2010-04-02 18:54:46 +0000
++++ new/gcc/rtl.def	2011-01-05 12:12:18 +0000
+@@ -296,6 +296,10 @@
+ 
+ DEF_RTL_EXPR(RETURN, "return", "", RTX_EXTRA)
+ 
++/* A plain return, to be used on paths that are reached without going
++   through the function prologue.  */
++DEF_RTL_EXPR(SIMPLE_RETURN, "simple_return", "", RTX_EXTRA)
++
+ /* Special for EH return from subroutine.  */
+ 
+ DEF_RTL_EXPR(EH_RETURN, "eh_return", "", RTX_EXTRA)
+
+=== modified file 'gcc/rtl.h'
+--- old/gcc/rtl.h	2010-11-16 22:17:17 +0000
++++ new/gcc/rtl.h	2011-01-05 12:12:18 +0000
+@@ -411,6 +411,10 @@
+   (JUMP_P (INSN) && (GET_CODE (PATTERN (INSN)) == ADDR_VEC || \
+ 		     GET_CODE (PATTERN (INSN)) == ADDR_DIFF_VEC))
+ 
++/* Predicate yielding nonzero iff X is a return or simple_preturn.  */
++#define ANY_RETURN_P(X) \
++  (GET_CODE (X) == RETURN || GET_CODE (X) == SIMPLE_RETURN)
++
+ /* 1 if X is a unary operator.  */
+ 
+ #define UNARY_P(X)   \
+@@ -1998,6 +2002,8 @@
+ {
+   GR_PC,
+   GR_CC0,
++  GR_RETURN,
++  GR_SIMPLE_RETURN,
+   GR_STACK_POINTER,
+   GR_FRAME_POINTER,
+ /* For register elimination to work properly these hard_frame_pointer_rtx,
+@@ -2032,6 +2038,8 @@
+ 
+ /* Standard pieces of rtx, to be substituted directly into things.  */
+ #define pc_rtx                  (global_rtl[GR_PC])
++#define ret_rtx                 (global_rtl[GR_RETURN])
++#define simple_return_rtx       (global_rtl[GR_SIMPLE_RETURN])
+ #define cc0_rtx                 (global_rtl[GR_CC0])
+ 
+ /* All references to certain hard regs, except those created
+
+=== modified file 'gcc/rtlanal.c'
+--- old/gcc/rtlanal.c	2010-11-16 22:17:17 +0000
++++ new/gcc/rtlanal.c	2011-01-05 12:12:18 +0000
+@@ -2673,6 +2673,7 @@
+ 
+   if (JUMP_P (insn)
+       && (label = JUMP_LABEL (insn)) != NULL_RTX
++      && !ANY_RETURN_P (label)
+       && (table = next_active_insn (label)) != NULL_RTX
+       && JUMP_TABLE_DATA_P (table))
+     {
+
+=== modified file 'gcc/sched-int.h'
+--- old/gcc/sched-int.h	2010-06-02 16:31:39 +0000
++++ new/gcc/sched-int.h	2011-01-05 12:12:18 +0000
+@@ -199,7 +199,7 @@
+ 
+ extern void ebb_compute_jump_reg_dependencies (rtx, regset, regset, regset);
+ 
+-extern edge find_fallthru_edge (basic_block);
++extern edge find_fallthru_edge_from (basic_block);
+ 
+ extern void (* sched_init_only_bb) (basic_block, basic_block);
+ extern basic_block (* sched_split_block) (basic_block, rtx);
+
+=== modified file 'gcc/sched-vis.c'
+--- old/gcc/sched-vis.c	2009-11-25 10:55:54 +0000
++++ new/gcc/sched-vis.c	2011-01-05 12:12:18 +0000
+@@ -549,6 +549,9 @@
+     case RETURN:
+       sprintf (buf, "return");
+       break;
++    case SIMPLE_RETURN:
++      sprintf (buf, "simple_return");
++      break;
+     case CALL:
+       print_exp (buf, x, verbose);
+       break;
+
+=== modified file 'gcc/sel-sched-ir.c'
+--- old/gcc/sel-sched-ir.c	2010-08-31 11:52:01 +0000
++++ new/gcc/sel-sched-ir.c	2011-01-05 12:12:18 +0000
+@@ -686,7 +686,7 @@
+ 
+       /* Find fallthrough edge.  */
+       gcc_assert (BLOCK_FOR_INSN (insn)->prev_bb);
+-      candidate = find_fallthru_edge (BLOCK_FOR_INSN (insn)->prev_bb);
++      candidate = find_fallthru_edge_from (BLOCK_FOR_INSN (insn)->prev_bb);
+ 
+       if (!candidate
+           || (candidate->src != BLOCK_FOR_INSN (last_scheduled_insn)
+
+=== modified file 'gcc/sel-sched.c'
+--- old/gcc/sel-sched.c	2010-11-12 15:47:38 +0000
++++ new/gcc/sel-sched.c	2011-01-05 12:12:18 +0000
+@@ -617,8 +617,8 @@
+   if (bb == BLOCK_FOR_INSN (succ))
+     return true;
+ 
+-  if (find_fallthru_edge (bb))
+-    bb = find_fallthru_edge (bb)->dest;
++  if (find_fallthru_edge_from (bb))
++    bb = find_fallthru_edge_from (bb)->dest;
+   else
+     return false;
+ 
+@@ -4911,7 +4911,7 @@
+   next = PREV_INSN (insn);
+   BND_TO (bnd) = insn;
+ 
+-  ft_edge = find_fallthru_edge (block_from);
++  ft_edge = find_fallthru_edge_from (block_from);
+   block_next = ft_edge->dest;
+   /* There must be a fallthrough block (or where should go
+   control flow in case of false jump predicate otherwise?).  */
+
+=== modified file 'gcc/vec.h'
+--- old/gcc/vec.h	2010-01-09 14:46:25 +0000
++++ new/gcc/vec.h	2011-01-05 12:12:18 +0000
+@@ -188,6 +188,18 @@
+ 
+ #define VEC_iterate(T,V,I,P)	(VEC_OP(T,base,iterate)(VEC_BASE(V),I,&(P)))
+ 
++/* Convenience macro for forward iteration.  */
++
++#define FOR_EACH_VEC_ELT(T, V, I, P)		\
++  for (I = 0; VEC_iterate (T, (V), (I), (P)); ++(I))
++
++/* Convenience macro for reverse iteration.  */
++
++#define FOR_EACH_VEC_ELT_REVERSE(T,V,I,P) \
++  for (I = VEC_length (T, (V)) - 1;           \
++       VEC_iterate (T, (V), (I), (P));	  \
++       (I)--)
++
+ /* Allocate new vector.
+    VEC(T,A) *VEC_T_A_alloc(int reserve);
+ 
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch
new file mode 100644
index 0000000..47b897d
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch
@@ -0,0 +1,4236 @@
+2010-12-03  Yao Qi  <yao@codesourcery.com>
+
+	* config/arm/arm-ldmstm.ml: Rewrite ldm/stm RTL patterns to fix
+	regressions.
+	* config/arm/ldmstm.md: Regenreate.
+
+2010-12-03  Yao Qi  <yao@codesourcery.com>
+
+	Backport from FSF mainline:
+
+	2010-08-02  Bernd Schmidt  <bernds@codesourcery.com>
+
+	PR target/40457
+	* config/arm/arm.h (arm_regs_in_sequence): Declare.
+	* config/arm/arm-protos.h (emit_ldm_seq, emit_stm_seq,
+	load_multiple_sequence, store_multiple_sequence): Delete
+	declarations.
+	(arm_gen_load_multiple, arm_gen_store_multiple): Adjust
+	declarations.
+	* config/arm/ldmstm.md: New file.
+	* config/arm/arm.c (arm_regs_in_sequence): New array.
+	(load_multiple_sequence): Now static.  New args SAVED_ORDER,
+	CHECK_REGS.  All callers changed.
+	If SAVED_ORDER is nonnull, copy the computed order into it.
+	If CHECK_REGS is false, don't sort REGS.  Handle Thumb mode.
+	(store_multiple_sequence): Now static.  New args NOPS_TOTAL,
+	SAVED_ORDER, REG_RTXS and CHECK_REGS.  All callers changed.
+	If SAVED_ORDER is nonnull, copy the computed order into it.
+	If CHECK_REGS is false, don't sort REGS.  Set up REG_RTXS just
+	like REGS.  Handle Thumb mode.
+	(arm_gen_load_multiple_1): New function, broken out of
+	arm_gen_load_multiple.
+	(arm_gen_store_multiple_1): New function, broken out of
+	arm_gen_store_multiple.
+	(arm_gen_multiple_op): New function, with code from
+	arm_gen_load_multiple and arm_gen_store_multiple moved here.
+	(arm_gen_load_multiple, arm_gen_store_multiple): Now just
+	wrappers around arm_gen_multiple_op.  Remove argument UP, all callers
+	changed.
+	(gen_ldm_seq, gen_stm_seq, gen_const_stm_seq): New functions.
+	* config/arm/predicates.md (commutative_binary_operator): New.
+	(load_multiple_operation, store_multiple_operation): Handle more
+	variants of these patterns with different starting offsets.  Handle
+	Thumb-1.
+	* config/arm/arm.md: Include "ldmstm.md".
+	(ldmsi_postinc4, ldmsi_postinc4_thumb1, ldmsi_postinc3, ldmsi_postinc2,
+	ldmsi4, ldmsi3, ldmsi2, stmsi_postinc4, stmsi_postinc4_thumb1,
+	stmsi_postinc3, stmsi_postinc2, stmsi4, stmsi3, stmsi2 and related
+	peepholes): Delete.
+	* config/arm/ldmstm.md: New file.
+	* config/arm/arm-ldmstm.ml: New file.
+
+	* config/arm/arm.c (arm_rtx_costs_1): Remove second clause from the
+	if statement which adds extra costs to frame-related expressions.
+
+	2010-05-06  Bernd Schmidt  <bernds@codesourcery.com>
+
+	* config/arm/arm.h (MAX_LDM_STM_OPS): New macro.
+	* config/arm/arm.c (multiple_operation_profitable_p,
+	compute_offset_order): New static functions.
+	(load_multiple_sequence, store_multiple_sequence): Use them.
+	Replace constant 4 with MAX_LDM_STM_OPS.  Compute order[0] from
+	memory offsets, not register numbers.
+	(emit_ldm_seq, emit_stm_seq): Replace constant 4 with MAX_LDM_STM_OPS.
+
+	2010-04-16  Bernd Schmidt  <bernds@codesourcery.com>
+
+	* recog.h (struct recog_data): New field is_operator.
+	(struct insn_operand_data): New field is_operator.
+	* recog.c (extract_insn): Set recog_data.is_operator.
+	* genoutput.c (output_operand_data): Emit code to set the
+	is_operator field.
+	* reload.c (find_reloads): Use it rather than testing for an
+	empty constraint string.
+
+=== added file 'gcc/config/arm/arm-ldmstm.ml'
+--- old/gcc/config/arm/arm-ldmstm.ml	1970-01-01 00:00:00 +0000
++++ new/gcc/config/arm/arm-ldmstm.ml	2010-11-16 13:08:47 +0000
+@@ -0,0 +1,333 @@
++(* Auto-generate ARM ldm/stm patterns
++   Copyright (C) 2010 Free Software Foundation, Inc.
++   Contributed by CodeSourcery.
++
++   This file is part of GCC.
++
++   GCC is free software; you can redistribute it and/or modify it under
++   the terms of the GNU General Public License as published by the Free
++   Software Foundation; either version 3, or (at your option) any later
++   version.
++
++   GCC is distributed in the hope that it will be useful, but WITHOUT ANY
++   WARRANTY; without even the implied warranty of MERCHANTABILITY or
++   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++   for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with GCC; see the file COPYING3.  If not see
++   <http://www.gnu.org/licenses/>.
++
++   This is an O'Caml program.  The O'Caml compiler is available from:
++
++     http://caml.inria.fr/
++
++   Or from your favourite OS's friendly packaging system. Tested with version
++   3.09.2, though other versions will probably work too.
++
++   Run with:
++     ocaml arm-ldmstm.ml >/path/to/gcc/config/arm/ldmstm.ml
++*)
++
++type amode = IA | IB | DA | DB
++
++type optype = IN | OUT | INOUT
++
++let rec string_of_addrmode addrmode =
++  match addrmode with
++    IA -> "ia" | IB -> "ib" | DA -> "da" | DB -> "db"
++
++let rec initial_offset addrmode nregs =
++  match addrmode with
++    IA -> 0
++  | IB -> 4
++  | DA -> -4 * nregs + 4
++  | DB -> -4 * nregs
++
++let rec final_offset addrmode nregs =
++  match addrmode with
++    IA -> nregs * 4
++  | IB -> nregs * 4
++  | DA -> -4 * nregs
++  | DB -> -4 * nregs
++
++let constr thumb =
++  if thumb then "l" else "rk"
++
++let inout_constr op_type =
++  match op_type with
++  OUT -> "="
++  | INOUT -> "+&"
++  | IN -> ""
++
++let destreg nregs first op_type thumb =
++  if not first then
++    Printf.sprintf "(match_dup %d)" (nregs)
++  else
++    Printf.sprintf ("(match_operand:SI %d \"s_register_operand\" \"%s%s\")")
++    (nregs) (inout_constr op_type) (constr thumb)
++
++let write_ldm_set thumb nregs offset opnr first =
++  let indent = "     " in
++  Printf.printf "%s" (if first then "    [" else indent);
++  Printf.printf "(set (match_operand:SI %d \"arm_hard_register_operand\" \"\")\n" opnr;
++  Printf.printf "%s     (mem:SI " indent;
++  begin if offset != 0 then Printf.printf "(plus:SI " end;
++  Printf.printf "%s" (destreg nregs first IN thumb);
++  begin if offset != 0 then Printf.printf "\n%s             (const_int %d))" indent offset end;
++  Printf.printf "))"
++
++let write_stm_set thumb nregs offset opnr first =
++  let indent = "     " in
++  Printf.printf "%s" (if first then "    [" else indent);
++  Printf.printf "(set (mem:SI ";
++  begin if offset != 0 then Printf.printf "(plus:SI " end;
++  Printf.printf "%s" (destreg nregs first IN thumb);
++  begin if offset != 0 then Printf.printf " (const_int %d))" offset end;
++  Printf.printf ")\n%s     (match_operand:SI %d \"arm_hard_register_operand\" \"\"))" indent opnr 
++
++let write_ldm_peep_set extra_indent nregs opnr first =
++  let indent = "   " ^ extra_indent in
++  Printf.printf "%s" (if first then extra_indent ^ "  [" else indent);
++  Printf.printf "(set (match_operand:SI %d \"s_register_operand\" \"\")\n" opnr;
++  Printf.printf "%s     (match_operand:SI %d \"memory_operand\" \"\"))" indent (nregs + opnr)
++
++let write_stm_peep_set extra_indent nregs opnr first =
++  let indent = "   " ^ extra_indent in
++  Printf.printf "%s" (if first then extra_indent ^ "  [" else indent);
++  Printf.printf "(set (match_operand:SI %d \"memory_operand\" \"\")\n" (nregs + opnr);
++  Printf.printf "%s     (match_operand:SI %d \"s_register_operand\" \"\"))" indent opnr
++
++let write_any_load optype nregs opnr first =
++  let indent = "   " in
++  Printf.printf "%s" (if first then "  [" else indent);
++  Printf.printf "(set (match_operand:SI %d \"s_register_operand\" \"\")\n" opnr;
++  Printf.printf "%s     (match_operand:SI %d \"%s\" \"\"))" indent (nregs * 2 + opnr) optype
++
++let write_const_store nregs opnr first =
++  let indent = "   " in
++  Printf.printf "%s(set (match_operand:SI %d \"memory_operand\" \"\")\n" indent (nregs + opnr);
++  Printf.printf "%s     (match_dup %d))" indent opnr
++
++let write_const_stm_peep_set nregs opnr first =
++  write_any_load "const_int_operand" nregs opnr first;
++  Printf.printf "\n";
++  write_const_store nregs opnr false
++
++  
++let rec write_pat_sets func opnr offset first n_left =
++  func offset opnr first;
++  begin
++    if n_left > 1 then begin
++      Printf.printf "\n";
++      write_pat_sets func (opnr + 1) (offset + 4) false (n_left - 1);
++    end else
++      Printf.printf "]"
++  end
++
++let rec write_peep_sets func opnr first n_left =
++  func opnr first;
++  begin
++    if n_left > 1 then begin
++      Printf.printf "\n";
++      write_peep_sets func (opnr + 1) false (n_left - 1);
++    end
++  end
++    
++let can_thumb addrmode update is_store =
++  match addrmode, update, is_store with
++    (* Thumb1 mode only supports IA with update.  However, for LDMIA,
++       if the address register also appears in the list of loaded
++       registers, the loaded value is stored, hence the RTL pattern
++       to describe such an insn does not have an update.  We check
++       in the match_parallel predicate that the condition described
++       above is met.  *)
++    IA, _, false -> true
++  | IA, true, true -> true
++  | _ -> false
++
++let target addrmode thumb =
++  match addrmode, thumb with
++    IA, true -> "TARGET_THUMB1"
++  | IA, false -> "TARGET_32BIT"
++  | DB, false -> "TARGET_32BIT"
++  | _, false -> "TARGET_ARM"
++
++let write_pattern_1 name ls addrmode nregs write_set_fn update thumb =
++  let astr = string_of_addrmode addrmode in
++  Printf.printf "(define_insn \"*%s%s%d_%s%s\"\n"
++    (if thumb then "thumb_" else "") name nregs astr
++    (if update then "_update" else "");
++  Printf.printf "  [(match_parallel 0 \"%s_multiple_operation\"\n" ls;
++  begin
++    if update then begin
++      Printf.printf "    [(set %s\n          (plus:SI "
++	(destreg 1 true OUT thumb); (*destreg 2 true IN thumb*)
++      Printf.printf "(match_operand:SI 2 \"s_register_operand\" \"1\")";
++      Printf.printf " (const_int %d)))\n"
++	(final_offset addrmode nregs)
++    end
++  end;
++  write_pat_sets
++    (write_set_fn thumb (if update then 2 else 1)) (if update then 3 else 2)
++    (initial_offset addrmode nregs)
++    (not update) nregs;
++  Printf.printf ")]\n  \"%s && XVECLEN (operands[0], 0) == %d\"\n"
++    (target addrmode thumb)
++    (if update then nregs + 1 else nregs);
++  Printf.printf "  \"%s%%(%s%%)\\t%%%d%s, {"
++    name astr (1) (if update then "!" else "");
++  for n = 1 to nregs; do
++    Printf.printf "%%%d%s" (n+(if update then 2 else 1)) (if n < nregs then ", " else "")
++  done;
++  Printf.printf "}\"\n";
++  Printf.printf "  [(set_attr \"type\" \"%s%d\")" ls nregs;
++  begin if not thumb then
++    Printf.printf "\n   (set_attr \"predicable\" \"yes\")";
++  end;
++  Printf.printf "])\n\n"
++
++let write_ldm_pattern addrmode nregs update =
++  write_pattern_1 "ldm" "load" addrmode nregs write_ldm_set update false;
++  begin if can_thumb addrmode update false then
++    write_pattern_1 "ldm" "load" addrmode nregs write_ldm_set update true;
++  end
++
++let write_stm_pattern addrmode nregs update =
++  write_pattern_1 "stm" "store" addrmode nregs write_stm_set update false;
++  begin if can_thumb addrmode update true then
++    write_pattern_1 "stm" "store" addrmode nregs write_stm_set update true;
++  end
++
++let write_ldm_commutative_peephole thumb =
++  let nregs = 2 in
++  Printf.printf "(define_peephole2\n";
++  write_peep_sets (write_ldm_peep_set "" nregs) 0 true nregs;
++  let indent = "   " in
++  if thumb then begin
++    Printf.printf "\n%s(set (match_operand:SI %d \"s_register_operand\" \"\")\n" indent (nregs * 2);
++    Printf.printf "%s     (match_operator:SI %d \"commutative_binary_operator\"\n" indent (nregs * 2 + 1);
++    Printf.printf "%s      [(match_operand:SI %d \"s_register_operand\" \"\")\n" indent (nregs * 2 + 2);
++    Printf.printf "%s       (match_operand:SI %d \"s_register_operand\" \"\")]))]\n" indent (nregs * 2 + 3)
++  end else begin
++    Printf.printf "\n%s(parallel\n" indent;
++    Printf.printf "%s  [(set (match_operand:SI %d \"s_register_operand\" \"\")\n" indent (nregs * 2);
++    Printf.printf "%s        (match_operator:SI %d \"commutative_binary_operator\"\n" indent (nregs * 2 + 1);
++    Printf.printf "%s         [(match_operand:SI %d \"s_register_operand\" \"\")\n" indent (nregs * 2 + 2);
++    Printf.printf "%s          (match_operand:SI %d \"s_register_operand\" \"\")]))\n" indent (nregs * 2 + 3);
++    Printf.printf "%s   (clobber (reg:CC CC_REGNUM))])]\n" indent
++  end;
++  Printf.printf "  \"(((operands[%d] == operands[0] && operands[%d] == operands[1])\n" (nregs * 2 + 2) (nregs * 2 + 3);
++  Printf.printf "     || (operands[%d] == operands[0] && operands[%d] == operands[1]))\n" (nregs * 2 + 3) (nregs * 2 + 2);
++  Printf.printf "    && peep2_reg_dead_p (%d, operands[0]) && peep2_reg_dead_p (%d, operands[1]))\"\n" (nregs + 1) (nregs + 1);
++  begin
++    if thumb then
++      Printf.printf "  [(set (match_dup %d) (match_op_dup %d [(match_dup %d) (match_dup %d)]))]\n"
++	(nregs * 2) (nregs * 2 + 1) (nregs * 2 + 2) (nregs * 2 + 3)
++    else begin
++      Printf.printf "  [(parallel\n";
++      Printf.printf "    [(set (match_dup %d) (match_op_dup %d [(match_dup %d) (match_dup %d)]))\n"
++	(nregs * 2) (nregs * 2 + 1) (nregs * 2 + 2) (nregs * 2 + 3);
++      Printf.printf "     (clobber (reg:CC CC_REGNUM))])]\n"
++    end
++  end;
++  Printf.printf "{\n  if (!gen_ldm_seq (operands, %d, true))\n    FAIL;\n" nregs;
++  Printf.printf "})\n\n"
++
++let write_ldm_peephole nregs =
++  Printf.printf "(define_peephole2\n";
++  write_peep_sets (write_ldm_peep_set "" nregs) 0 true nregs;
++  Printf.printf "]\n  \"\"\n  [(const_int 0)]\n{\n";
++  Printf.printf "  if (gen_ldm_seq (operands, %d, false))\n    DONE;\n  else\n    FAIL;\n})\n\n" nregs
++
++let write_ldm_peephole_b nregs =
++  if nregs > 2 then begin
++    Printf.printf "(define_peephole2\n";
++    write_ldm_peep_set "" nregs 0 true;
++    Printf.printf "\n   (parallel\n";
++    write_peep_sets (write_ldm_peep_set "  " nregs) 1 true (nregs - 1);
++    Printf.printf "])]\n  \"\"\n  [(const_int 0)]\n{\n";
++    Printf.printf "  if (gen_ldm_seq (operands, %d, false))\n    DONE;\n  else\n    FAIL;\n})\n\n" nregs
++  end
++
++let write_stm_peephole nregs =
++  Printf.printf "(define_peephole2\n";
++  write_peep_sets (write_stm_peep_set "" nregs) 0 true nregs;
++  Printf.printf "]\n  \"\"\n  [(const_int 0)]\n{\n";
++  Printf.printf "  if (gen_stm_seq (operands, %d))\n    DONE;\n  else\n    FAIL;\n})\n\n" nregs
++
++let write_stm_peephole_b nregs =
++  if nregs > 2 then begin
++    Printf.printf "(define_peephole2\n";
++    write_stm_peep_set "" nregs 0 true;
++    Printf.printf "\n   (parallel\n";
++    write_peep_sets (write_stm_peep_set "" nregs) 1 true (nregs - 1);
++    Printf.printf "]\n  \"\"\n  [(const_int 0)]\n{\n";
++    Printf.printf "  if (gen_stm_seq (operands, %d))\n    DONE;\n  else\n    FAIL;\n})\n\n" nregs
++  end
++
++let write_const_stm_peephole_a nregs =
++  Printf.printf "(define_peephole2\n";
++  write_peep_sets (write_const_stm_peep_set nregs) 0 true nregs;
++  Printf.printf "]\n  \"\"\n  [(const_int 0)]\n{\n";
++  Printf.printf "  if (gen_const_stm_seq (operands, %d))\n    DONE;\n  else\n    FAIL;\n})\n\n" nregs
++
++let write_const_stm_peephole_b nregs =
++  Printf.printf "(define_peephole2\n";
++  write_peep_sets (write_any_load "const_int_operand" nregs) 0 true nregs;
++  Printf.printf "\n";
++  write_peep_sets (write_const_store nregs) 0 false nregs;
++  Printf.printf "]\n  \"\"\n  [(const_int 0)]\n{\n";
++  Printf.printf "  if (gen_const_stm_seq (operands, %d))\n    DONE;\n  else\n    FAIL;\n})\n\n" nregs
++
++let patterns () =
++  let addrmodes = [ IA; IB; DA; DB ]  in
++  let sizes = [ 4; 3; 2] in
++  List.iter
++    (fun n ->
++      List.iter
++	(fun addrmode ->
++	  write_ldm_pattern addrmode n false;
++	  write_ldm_pattern addrmode n true;
++	  write_stm_pattern addrmode n false;
++	  write_stm_pattern addrmode n true)
++	addrmodes;
++      write_ldm_peephole n;
++      write_ldm_peephole_b n;
++      write_const_stm_peephole_a n;
++      write_const_stm_peephole_b n;
++      write_stm_peephole n;)
++    sizes;
++  write_ldm_commutative_peephole false;
++  write_ldm_commutative_peephole true
++
++let print_lines = List.iter (fun s -> Format.printf "%s@\n" s)
++
++(* Do it.  *)
++
++let _ = 
++  print_lines [
++"/* ARM ldm/stm instruction patterns.  This file was automatically generated";
++"   using arm-ldmstm.ml.  Please do not edit manually.";
++"";
++"   Copyright (C) 2010 Free Software Foundation, Inc.";
++"   Contributed by CodeSourcery.";
++"";
++"   This file is part of GCC.";
++"";
++"   GCC is free software; you can redistribute it and/or modify it";
++"   under the terms of the GNU General Public License as published";
++"   by the Free Software Foundation; either version 3, or (at your";
++"   option) any later version.";
++"";
++"   GCC is distributed in the hope that it will be useful, but WITHOUT";
++"   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY";
++"   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public";
++"   License for more details.";
++"";
++"   You should have received a copy of the GNU General Public License and";
++"   a copy of the GCC Runtime Library Exception along with this program;";
++"   see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see";
++"   <http://www.gnu.org/licenses/>.  */";
++""];
++  patterns ();
+
+=== modified file 'gcc/config/arm/arm-protos.h'
+--- old/gcc/config/arm/arm-protos.h	2011-01-05 12:12:18 +0000
++++ new/gcc/config/arm/arm-protos.h	2011-01-05 18:20:37 +0000
+@@ -100,14 +100,11 @@
+ extern int label_mentioned_p (rtx);
+ extern RTX_CODE minmax_code (rtx);
+ extern int adjacent_mem_locations (rtx, rtx);
+-extern int load_multiple_sequence (rtx *, int, int *, int *, HOST_WIDE_INT *);
+-extern const char *emit_ldm_seq (rtx *, int);
+-extern int store_multiple_sequence (rtx *, int, int *, int *, HOST_WIDE_INT *);
+-extern const char * emit_stm_seq (rtx *, int);
+-extern rtx arm_gen_load_multiple (int, int, rtx, int, int,
+-				  rtx, HOST_WIDE_INT *);
+-extern rtx arm_gen_store_multiple (int, int, rtx, int, int,
+-				   rtx, HOST_WIDE_INT *);
++extern bool gen_ldm_seq (rtx *, int, bool);
++extern bool gen_stm_seq (rtx *, int);
++extern bool gen_const_stm_seq (rtx *, int);
++extern rtx arm_gen_load_multiple (int *, int, rtx, int, rtx, HOST_WIDE_INT *);
++extern rtx arm_gen_store_multiple (int *, int, rtx, int, rtx, HOST_WIDE_INT *);
+ extern int arm_gen_movmemqi (rtx *);
+ extern enum machine_mode arm_select_cc_mode (RTX_CODE, rtx, rtx);
+ extern enum machine_mode arm_select_dominance_cc_mode (rtx, rtx,
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-01-05 12:12:18 +0000
++++ new/gcc/config/arm/arm.c	2011-01-05 18:20:37 +0000
+@@ -753,6 +753,12 @@
+   "hi", "ls", "ge", "lt", "gt", "le", "al", "nv"
+ };
+ 
++/* The register numbers in sequence, for passing to arm_gen_load_multiple.  */
++int arm_regs_in_sequence[] =
++{
++  0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
++};
++
+ #define ARM_LSL_NAME (TARGET_UNIFIED_ASM ? "lsl" : "asl")
+ #define streq(string1, string2) (strcmp (string1, string2) == 0)
+ 
+@@ -9680,142 +9686,16 @@
+   return 0;
+ }
+ 
+-int
+-load_multiple_sequence (rtx *operands, int nops, int *regs, int *base,
+-			HOST_WIDE_INT *load_offset)
+-{
+-  int unsorted_regs[4];
+-  HOST_WIDE_INT unsorted_offsets[4];
+-  int order[4];
+-  int base_reg = -1;
+-  int i;
+-
+-  if (low_irq_latency)
+-    return 0;
+-
+-  /* Can only handle 2, 3, or 4 insns at present,
+-     though could be easily extended if required.  */
+-  gcc_assert (nops >= 2 && nops <= 4);
+-
+-  memset (order, 0, 4 * sizeof (int));
+-
+-  /* Loop over the operands and check that the memory references are
+-     suitable (i.e. immediate offsets from the same base register).  At
+-     the same time, extract the target register, and the memory
+-     offsets.  */
+-  for (i = 0; i < nops; i++)
+-    {
+-      rtx reg;
+-      rtx offset;
+-
+-      /* Convert a subreg of a mem into the mem itself.  */
+-      if (GET_CODE (operands[nops + i]) == SUBREG)
+-	operands[nops + i] = alter_subreg (operands + (nops + i));
+-
+-      gcc_assert (GET_CODE (operands[nops + i]) == MEM);
+-
+-      /* Don't reorder volatile memory references; it doesn't seem worth
+-	 looking for the case where the order is ok anyway.  */
+-      if (MEM_VOLATILE_P (operands[nops + i]))
+-	return 0;
+-
+-      offset = const0_rtx;
+-
+-      if ((GET_CODE (reg = XEXP (operands[nops + i], 0)) == REG
+-	   || (GET_CODE (reg) == SUBREG
+-	       && GET_CODE (reg = SUBREG_REG (reg)) == REG))
+-	  || (GET_CODE (XEXP (operands[nops + i], 0)) == PLUS
+-	      && ((GET_CODE (reg = XEXP (XEXP (operands[nops + i], 0), 0))
+-		   == REG)
+-		  || (GET_CODE (reg) == SUBREG
+-		      && GET_CODE (reg = SUBREG_REG (reg)) == REG))
+-	      && (GET_CODE (offset = XEXP (XEXP (operands[nops + i], 0), 1))
+-		  == CONST_INT)))
+-	{
+-	  if (i == 0)
+-	    {
+-	      base_reg = REGNO (reg);
+-	      unsorted_regs[0] = (GET_CODE (operands[i]) == REG
+-				  ? REGNO (operands[i])
+-				  : REGNO (SUBREG_REG (operands[i])));
+-	      order[0] = 0;
+-	    }
+-	  else
+-	    {
+-	      if (base_reg != (int) REGNO (reg))
+-		/* Not addressed from the same base register.  */
+-		return 0;
+-
+-	      unsorted_regs[i] = (GET_CODE (operands[i]) == REG
+-				  ? REGNO (operands[i])
+-				  : REGNO (SUBREG_REG (operands[i])));
+-	      if (unsorted_regs[i] < unsorted_regs[order[0]])
+-		order[0] = i;
+-	    }
+-
+-	  /* If it isn't an integer register, or if it overwrites the
+-	     base register but isn't the last insn in the list, then
+-	     we can't do this.  */
+-	  if (unsorted_regs[i] < 0 || unsorted_regs[i] > 14
+-	      || (i != nops - 1 && unsorted_regs[i] == base_reg))
+-	    return 0;
+-
+-	  unsorted_offsets[i] = INTVAL (offset);
+-	}
+-      else
+-	/* Not a suitable memory address.  */
+-	return 0;
+-    }
+-
+-  /* All the useful information has now been extracted from the
+-     operands into unsorted_regs and unsorted_offsets; additionally,
+-     order[0] has been set to the lowest numbered register in the
+-     list.  Sort the registers into order, and check that the memory
+-     offsets are ascending and adjacent.  */
+-
+-  for (i = 1; i < nops; i++)
+-    {
+-      int j;
+-
+-      order[i] = order[i - 1];
+-      for (j = 0; j < nops; j++)
+-	if (unsorted_regs[j] > unsorted_regs[order[i - 1]]
+-	    && (order[i] == order[i - 1]
+-		|| unsorted_regs[j] < unsorted_regs[order[i]]))
+-	  order[i] = j;
+-
+-      /* Have we found a suitable register? if not, one must be used more
+-	 than once.  */
+-      if (order[i] == order[i - 1])
+-	return 0;
+-
+-      /* Is the memory address adjacent and ascending? */
+-      if (unsorted_offsets[order[i]] != unsorted_offsets[order[i - 1]] + 4)
+-	return 0;
+-    }
+-
+-  if (base)
+-    {
+-      *base = base_reg;
+-
+-      for (i = 0; i < nops; i++)
+-	regs[i] = unsorted_regs[order[i]];
+-
+-      *load_offset = unsorted_offsets[order[0]];
+-    }
+-
+-  if (unsorted_offsets[order[0]] == 0)
+-    return 1; /* ldmia */
+-
+-  if (TARGET_ARM && unsorted_offsets[order[0]] == 4)
+-    return 2; /* ldmib */
+-
+-  if (TARGET_ARM && unsorted_offsets[order[nops - 1]] == 0)
+-    return 3; /* ldmda */
+-
+-  if (unsorted_offsets[order[nops - 1]] == -4)
+-    return 4; /* ldmdb */
+-
++
++/* Return true iff it would be profitable to turn a sequence of NOPS loads
++   or stores (depending on IS_STORE) into a load-multiple or store-multiple
++   instruction.  ADD_OFFSET is nonzero if the base address register needs
++   to be modified with an add instruction before we can use it.  */
++
++static bool
++multiple_operation_profitable_p (bool is_store ATTRIBUTE_UNUSED,
++				 int nops, HOST_WIDE_INT add_offset)
++ {
+   /* For ARM8,9 & StrongARM, 2 ldr instructions are faster than an ldm
+      if the offset isn't small enough.  The reason 2 ldrs are faster
+      is because these ARMs are able to do more than one cache access
+@@ -9845,91 +9725,239 @@
+      We cheat here and test 'arm_ld_sched' which we currently know to
+      only be true for the ARM8, ARM9 and StrongARM.  If this ever
+      changes, then the test below needs to be reworked.  */
+-  if (nops == 2 && arm_ld_sched)
++  if (nops == 2 && arm_ld_sched && add_offset != 0)
++    return false;
++
++  return true;
++}
++
++/* Subroutine of load_multiple_sequence and store_multiple_sequence.
++   Given an array of UNSORTED_OFFSETS, of which there are NOPS, compute
++   an array ORDER which describes the sequence to use when accessing the
++   offsets that produces an ascending order.  In this sequence, each
++   offset must be larger by exactly 4 than the previous one.  ORDER[0]
++   must have been filled in with the lowest offset by the caller.
++   If UNSORTED_REGS is nonnull, it is an array of register numbers that
++   we use to verify that ORDER produces an ascending order of registers.
++   Return true if it was possible to construct such an order, false if
++   not.  */
++
++static bool
++compute_offset_order (int nops, HOST_WIDE_INT *unsorted_offsets, int *order,
++		      int *unsorted_regs)
++{
++  int i;
++  for (i = 1; i < nops; i++)
++    {
++      int j;
++
++      order[i] = order[i - 1];
++      for (j = 0; j < nops; j++)
++	if (unsorted_offsets[j] == unsorted_offsets[order[i - 1]] + 4)
++	  {
++	    /* We must find exactly one offset that is higher than the
++	       previous one by 4.  */
++	    if (order[i] != order[i - 1])
++	      return false;
++	    order[i] = j;
++	  }
++      if (order[i] == order[i - 1])
++	return false;
++      /* The register numbers must be ascending.  */
++      if (unsorted_regs != NULL
++	  && unsorted_regs[order[i]] <= unsorted_regs[order[i - 1]])
++	return false;
++    }
++  return true;
++}
++
++/* Used to determine in a peephole whether a sequence of load
++   instructions can be changed into a load-multiple instruction.
++   NOPS is the number of separate load instructions we are examining.  The
++   first NOPS entries in OPERANDS are the destination registers, the
++   next NOPS entries are memory operands.  If this function is
++   successful, *BASE is set to the common base register of the memory
++   accesses; *LOAD_OFFSET is set to the first memory location's offset
++   from that base register.
++   REGS is an array filled in with the destination register numbers.
++   SAVED_ORDER (if nonnull), is an array filled in with an order that maps
++   insn numbers to to an ascending order of stores.  If CHECK_REGS is true,
++   the sequence of registers in REGS matches the loads from ascending memory
++   locations, and the function verifies that the register numbers are
++   themselves ascending.  If CHECK_REGS is false, the register numbers
++   are stored in the order they are found in the operands.  */
++static int
++load_multiple_sequence (rtx *operands, int nops, int *regs, int *saved_order,
++			int *base, HOST_WIDE_INT *load_offset, bool check_regs)
++{
++  int unsorted_regs[MAX_LDM_STM_OPS];
++  HOST_WIDE_INT unsorted_offsets[MAX_LDM_STM_OPS];
++  int order[MAX_LDM_STM_OPS];
++  rtx base_reg_rtx = NULL;
++  int base_reg = -1;
++  int i, ldm_case;
++
++  if (low_irq_latency)
+     return 0;
+ 
+-  /* Can't do it without setting up the offset, only do this if it takes
+-     no more than one insn.  */
+-  return (const_ok_for_arm (unsorted_offsets[order[0]])
+-	  || const_ok_for_arm (-unsorted_offsets[order[0]])) ? 5 : 0;
+-}
+-
+-const char *
+-emit_ldm_seq (rtx *operands, int nops)
+-{
+-  int regs[4];
+-  int base_reg;
+-  HOST_WIDE_INT offset;
+-  char buf[100];
+-  int i;
+-
+-  switch (load_multiple_sequence (operands, nops, regs, &base_reg, &offset))
++  /* Can only handle up to MAX_LDM_STM_OPS insns at present, though could be
++     easily extended if required.  */
++  gcc_assert (nops >= 2 && nops <= MAX_LDM_STM_OPS);
++
++  memset (order, 0, MAX_LDM_STM_OPS * sizeof (int));
++
++  /* Loop over the operands and check that the memory references are
++     suitable (i.e. immediate offsets from the same base register).  At
++     the same time, extract the target register, and the memory
++     offsets.  */
++  for (i = 0; i < nops; i++)
+     {
+-    case 1:
+-      strcpy (buf, "ldm%(ia%)\t");
+-      break;
+-
+-    case 2:
+-      strcpy (buf, "ldm%(ib%)\t");
+-      break;
+-
+-    case 3:
+-      strcpy (buf, "ldm%(da%)\t");
+-      break;
+-
+-    case 4:
+-      strcpy (buf, "ldm%(db%)\t");
+-      break;
+-
+-    case 5:
+-      if (offset >= 0)
+-	sprintf (buf, "add%%?\t%s%s, %s%s, #%ld", REGISTER_PREFIX,
+-		 reg_names[regs[0]], REGISTER_PREFIX, reg_names[base_reg],
+-		 (long) offset);
++      rtx reg;
++      rtx offset;
++
++      /* Convert a subreg of a mem into the mem itself.  */
++      if (GET_CODE (operands[nops + i]) == SUBREG)
++	operands[nops + i] = alter_subreg (operands + (nops + i));
++
++      gcc_assert (GET_CODE (operands[nops + i]) == MEM);
++
++      /* Don't reorder volatile memory references; it doesn't seem worth
++	 looking for the case where the order is ok anyway.  */
++      if (MEM_VOLATILE_P (operands[nops + i]))
++	return 0;
++
++      offset = const0_rtx;
++
++      if ((GET_CODE (reg = XEXP (operands[nops + i], 0)) == REG
++	   || (GET_CODE (reg) == SUBREG
++	       && GET_CODE (reg = SUBREG_REG (reg)) == REG))
++	  || (GET_CODE (XEXP (operands[nops + i], 0)) == PLUS
++	      && ((GET_CODE (reg = XEXP (XEXP (operands[nops + i], 0), 0))
++		   == REG)
++		  || (GET_CODE (reg) == SUBREG
++		      && GET_CODE (reg = SUBREG_REG (reg)) == REG))
++	      && (GET_CODE (offset = XEXP (XEXP (operands[nops + i], 0), 1))
++		  == CONST_INT)))
++	{
++	  if (i == 0)
++	    {
++	      base_reg = REGNO (reg);
++	      base_reg_rtx = reg;
++	      if (TARGET_THUMB1 && base_reg > LAST_LO_REGNUM)
++		return 0;
++	    }
++	  else if (base_reg != (int) REGNO (reg))
++	    /* Not addressed from the same base register.  */
++	    return 0;
++
++	  unsorted_regs[i] = (GET_CODE (operands[i]) == REG
++			      ? REGNO (operands[i])
++			      : REGNO (SUBREG_REG (operands[i])));
++
++	  /* If it isn't an integer register, or if it overwrites the
++	     base register but isn't the last insn in the list, then
++	     we can't do this.  */
++	  if (unsorted_regs[i] < 0
++	      || (TARGET_THUMB1 && unsorted_regs[i] > LAST_LO_REGNUM)
++	      || unsorted_regs[i] > 14
++	      || (i != nops - 1 && unsorted_regs[i] == base_reg))
++	    return 0;
++
++	  unsorted_offsets[i] = INTVAL (offset);
++	  if (i == 0 || unsorted_offsets[i] < unsorted_offsets[order[0]])
++	    order[0] = i;
++	}
+       else
+-	sprintf (buf, "sub%%?\t%s%s, %s%s, #%ld", REGISTER_PREFIX,
+-		 reg_names[regs[0]], REGISTER_PREFIX, reg_names[base_reg],
+-		 (long) -offset);
+-      output_asm_insn (buf, operands);
+-      base_reg = regs[0];
+-      strcpy (buf, "ldm%(ia%)\t");
+-      break;
+-
+-    default:
+-      gcc_unreachable ();
+-    }
+-
+-  sprintf (buf + strlen (buf), "%s%s, {%s%s", REGISTER_PREFIX,
+-	   reg_names[base_reg], REGISTER_PREFIX, reg_names[regs[0]]);
+-
+-  for (i = 1; i < nops; i++)
+-    sprintf (buf + strlen (buf), ", %s%s", REGISTER_PREFIX,
+-	     reg_names[regs[i]]);
+-
+-  strcat (buf, "}\t%@ phole ldm");
+-
+-  output_asm_insn (buf, operands);
+-  return "";
++	/* Not a suitable memory address.  */
++	return 0;
++    }
++
++  /* All the useful information has now been extracted from the
++     operands into unsorted_regs and unsorted_offsets; additionally,
++     order[0] has been set to the lowest offset in the list.  Sort
++     the offsets into order, verifying that they are adjacent, and
++     check that the register numbers are ascending.  */
++  if (!compute_offset_order (nops, unsorted_offsets, order,
++			     check_regs ? unsorted_regs : NULL))
++    return 0;
++
++  if (saved_order)
++    memcpy (saved_order, order, sizeof order);
++
++  if (base)
++    {
++      *base = base_reg;
++
++      for (i = 0; i < nops; i++)
++	regs[i] = unsorted_regs[check_regs ? order[i] : i];
++
++      *load_offset = unsorted_offsets[order[0]];
++    }
++
++  if (TARGET_THUMB1
++      && !peep2_reg_dead_p (nops, base_reg_rtx))
++    return 0;
++
++  if (unsorted_offsets[order[0]] == 0)
++    ldm_case = 1; /* ldmia */
++  else if (TARGET_ARM && unsorted_offsets[order[0]] == 4)
++    ldm_case = 2; /* ldmib */
++  else if (TARGET_ARM && unsorted_offsets[order[nops - 1]] == 0)
++    ldm_case = 3; /* ldmda */
++  else if (TARGET_32BIT && unsorted_offsets[order[nops - 1]] == -4)
++    ldm_case = 4; /* ldmdb */
++  else if (const_ok_for_arm (unsorted_offsets[order[0]])
++	   || const_ok_for_arm (-unsorted_offsets[order[0]]))
++    ldm_case = 5;
++  else
++    return 0;
++
++  if (!multiple_operation_profitable_p (false, nops,
++					ldm_case == 5
++					? unsorted_offsets[order[0]] : 0))
++    return 0;
++
++  return ldm_case;
+ }
+ 
+-int
+-store_multiple_sequence (rtx *operands, int nops, int *regs, int *base,
+-			 HOST_WIDE_INT * load_offset)
++/* Used to determine in a peephole whether a sequence of store instructions can
++   be changed into a store-multiple instruction.
++   NOPS is the number of separate store instructions we are examining.
++   NOPS_TOTAL is the total number of instructions recognized by the peephole
++   pattern.
++   The first NOPS entries in OPERANDS are the source registers, the next
++   NOPS entries are memory operands.  If this function is successful, *BASE is
++   set to the common base register of the memory accesses; *LOAD_OFFSET is set
++   to the first memory location's offset from that base register.  REGS is an
++   array filled in with the source register numbers, REG_RTXS (if nonnull) is
++   likewise filled with the corresponding rtx's.
++   SAVED_ORDER (if nonnull), is an array filled in with an order that maps insn
++   numbers to to an ascending order of stores.
++   If CHECK_REGS is true, the sequence of registers in *REGS matches the stores
++   from ascending memory locations, and the function verifies that the register
++   numbers are themselves ascending.  If CHECK_REGS is false, the register
++   numbers are stored in the order they are found in the operands.  */
++static int
++store_multiple_sequence (rtx *operands, int nops, int nops_total,
++			 int *regs, rtx *reg_rtxs, int *saved_order, int *base,
++			 HOST_WIDE_INT *load_offset, bool check_regs)
+ {
+-  int unsorted_regs[4];
+-  HOST_WIDE_INT unsorted_offsets[4];
+-  int order[4];
++  int unsorted_regs[MAX_LDM_STM_OPS];
++  rtx unsorted_reg_rtxs[MAX_LDM_STM_OPS];
++  HOST_WIDE_INT unsorted_offsets[MAX_LDM_STM_OPS];
++  int order[MAX_LDM_STM_OPS];
+   int base_reg = -1;
+-  int i;
++  rtx base_reg_rtx = NULL;
++  int i, stm_case;
+ 
+   if (low_irq_latency)
+     return 0;
+ 
+-  /* Can only handle 2, 3, or 4 insns at present, though could be easily
+-     extended if required.  */
+-  gcc_assert (nops >= 2 && nops <= 4);
++  /* Can only handle up to MAX_LDM_STM_OPS insns at present, though could be
++     easily extended if required.  */
++  gcc_assert (nops >= 2 && nops <= MAX_LDM_STM_OPS);
+ 
+-  memset (order, 0, 4 * sizeof (int));
++  memset (order, 0, MAX_LDM_STM_OPS * sizeof (int));
+ 
+   /* Loop over the operands and check that the memory references are
+      suitable (i.e. immediate offsets from the same base register).  At
+@@ -9964,32 +9992,32 @@
+ 	      && (GET_CODE (offset = XEXP (XEXP (operands[nops + i], 0), 1))
+ 		  == CONST_INT)))
+ 	{
++	  unsorted_reg_rtxs[i] = (GET_CODE (operands[i]) == REG
++				  ? operands[i] : SUBREG_REG (operands[i]));
++	  unsorted_regs[i] = REGNO (unsorted_reg_rtxs[i]);
++
+ 	  if (i == 0)
+ 	    {
+ 	      base_reg = REGNO (reg);
+-	      unsorted_regs[0] = (GET_CODE (operands[i]) == REG
+-				  ? REGNO (operands[i])
+-				  : REGNO (SUBREG_REG (operands[i])));
+-	      order[0] = 0;
+-	    }
+-	  else
+-	    {
+-	      if (base_reg != (int) REGNO (reg))
+-		/* Not addressed from the same base register.  */
++	      base_reg_rtx = reg;
++	      if (TARGET_THUMB1 && base_reg > LAST_LO_REGNUM)
+ 		return 0;
+-
+-	      unsorted_regs[i] = (GET_CODE (operands[i]) == REG
+-				  ? REGNO (operands[i])
+-				  : REGNO (SUBREG_REG (operands[i])));
+-	      if (unsorted_regs[i] < unsorted_regs[order[0]])
+-		order[0] = i;
+ 	    }
++	  else if (base_reg != (int) REGNO (reg))
++	    /* Not addressed from the same base register.  */
++	    return 0;
+ 
+ 	  /* If it isn't an integer register, then we can't do this.  */
+-	  if (unsorted_regs[i] < 0 || unsorted_regs[i] > 14)
++	  if (unsorted_regs[i] < 0
++	      || (TARGET_THUMB1 && unsorted_regs[i] > LAST_LO_REGNUM)
++	      || (TARGET_THUMB2 && unsorted_regs[i] == base_reg)
++	      || (TARGET_THUMB2 && unsorted_regs[i] == SP_REGNUM)
++	      || unsorted_regs[i] > 14)
+ 	    return 0;
+ 
+ 	  unsorted_offsets[i] = INTVAL (offset);
++	  if (i == 0 || unsorted_offsets[i] < unsorted_offsets[order[0]])
++	    order[0] = i;
+ 	}
+       else
+ 	/* Not a suitable memory address.  */
+@@ -9998,111 +10026,65 @@
+ 
+   /* All the useful information has now been extracted from the
+      operands into unsorted_regs and unsorted_offsets; additionally,
+-     order[0] has been set to the lowest numbered register in the
+-     list.  Sort the registers into order, and check that the memory
+-     offsets are ascending and adjacent.  */
+-
+-  for (i = 1; i < nops; i++)
+-    {
+-      int j;
+-
+-      order[i] = order[i - 1];
+-      for (j = 0; j < nops; j++)
+-	if (unsorted_regs[j] > unsorted_regs[order[i - 1]]
+-	    && (order[i] == order[i - 1]
+-		|| unsorted_regs[j] < unsorted_regs[order[i]]))
+-	  order[i] = j;
+-
+-      /* Have we found a suitable register? if not, one must be used more
+-	 than once.  */
+-      if (order[i] == order[i - 1])
+-	return 0;
+-
+-      /* Is the memory address adjacent and ascending? */
+-      if (unsorted_offsets[order[i]] != unsorted_offsets[order[i - 1]] + 4)
+-	return 0;
+-    }
++     order[0] has been set to the lowest offset in the list.  Sort
++     the offsets into order, verifying that they are adjacent, and
++     check that the register numbers are ascending.  */
++  if (!compute_offset_order (nops, unsorted_offsets, order,
++			     check_regs ? unsorted_regs : NULL))
++    return 0;
++
++  if (saved_order)
++    memcpy (saved_order, order, sizeof order);
+ 
+   if (base)
+     {
+       *base = base_reg;
+ 
+       for (i = 0; i < nops; i++)
+-	regs[i] = unsorted_regs[order[i]];
++	{
++	  regs[i] = unsorted_regs[check_regs ? order[i] : i];
++	  if (reg_rtxs)
++	    reg_rtxs[i] = unsorted_reg_rtxs[check_regs ? order[i] : i];
++	}
+ 
+       *load_offset = unsorted_offsets[order[0]];
+     }
+ 
++  if (TARGET_THUMB1
++      && !peep2_reg_dead_p (nops_total, base_reg_rtx))
++    return 0;
++
+   if (unsorted_offsets[order[0]] == 0)
+-    return 1; /* stmia */
+-
+-  if (unsorted_offsets[order[0]] == 4)
+-    return 2; /* stmib */
+-
+-  if (unsorted_offsets[order[nops - 1]] == 0)
+-    return 3; /* stmda */
+-
+-  if (unsorted_offsets[order[nops - 1]] == -4)
+-    return 4; /* stmdb */
+-
+-  return 0;
+-}
+-
+-const char *
+-emit_stm_seq (rtx *operands, int nops)
+-{
+-  int regs[4];
+-  int base_reg;
+-  HOST_WIDE_INT offset;
+-  char buf[100];
+-  int i;
+-
+-  switch (store_multiple_sequence (operands, nops, regs, &base_reg, &offset))
+-    {
+-    case 1:
+-      strcpy (buf, "stm%(ia%)\t");
+-      break;
+-
+-    case 2:
+-      strcpy (buf, "stm%(ib%)\t");
+-      break;
+-
+-    case 3:
+-      strcpy (buf, "stm%(da%)\t");
+-      break;
+-
+-    case 4:
+-      strcpy (buf, "stm%(db%)\t");
+-      break;
+-
+-    default:
+-      gcc_unreachable ();
+-    }
+-
+-  sprintf (buf + strlen (buf), "%s%s, {%s%s", REGISTER_PREFIX,
+-	   reg_names[base_reg], REGISTER_PREFIX, reg_names[regs[0]]);
+-
+-  for (i = 1; i < nops; i++)
+-    sprintf (buf + strlen (buf), ", %s%s", REGISTER_PREFIX,
+-	     reg_names[regs[i]]);
+-
+-  strcat (buf, "}\t%@ phole stm");
+-
+-  output_asm_insn (buf, operands);
+-  return "";
++    stm_case = 1; /* stmia */
++  else if (TARGET_ARM && unsorted_offsets[order[0]] == 4)
++    stm_case = 2; /* stmib */
++  else if (TARGET_ARM && unsorted_offsets[order[nops - 1]] == 0)
++    stm_case = 3; /* stmda */
++  else if (TARGET_32BIT && unsorted_offsets[order[nops - 1]] == -4)
++    stm_case = 4; /* stmdb */
++  else
++    return 0;
++
++  if (!multiple_operation_profitable_p (false, nops, 0))
++    return 0;
++
++  return stm_case;
+ }
+ 
+ /* Routines for use in generating RTL.  */
+ 
+-rtx
+-arm_gen_load_multiple (int base_regno, int count, rtx from, int up,
+-		       int write_back, rtx basemem, HOST_WIDE_INT *offsetp)
++/* Generate a load-multiple instruction.  COUNT is the number of loads in
++   the instruction; REGS and MEMS are arrays containing the operands.
++   BASEREG is the base register to be used in addressing the memory operands.
++   WBACK_OFFSET is nonzero if the instruction should update the base
++   register.  */
++
++static rtx
++arm_gen_load_multiple_1 (int count, int *regs, rtx *mems, rtx basereg,
++			 HOST_WIDE_INT wback_offset)
+ {
+-  HOST_WIDE_INT offset = *offsetp;
+   int i = 0, j;
+   rtx result;
+-  int sign = up ? 1 : -1;
+-  rtx mem, addr;
+ 
+   /* XScale has load-store double instructions, but they have stricter
+      alignment requirements than load-store multiple, so we cannot
+@@ -10139,18 +10121,10 @@
+       start_sequence ();
+ 
+       for (i = 0; i < count; i++)
+-	{
+-	  addr = plus_constant (from, i * 4 * sign);
+-	  mem = adjust_automodify_address (basemem, SImode, addr, offset);
+-	  emit_move_insn (gen_rtx_REG (SImode, base_regno + i), mem);
+-	  offset += 4 * sign;
+-	}
++	emit_move_insn (gen_rtx_REG (SImode, regs[i]), mems[i]);
+ 
+-      if (write_back)
+-	{
+-	  emit_move_insn (from, plus_constant (from, count * 4 * sign));
+-	  *offsetp = offset;
+-	}
++      if (wback_offset != 0)
++	emit_move_insn (basereg, plus_constant (basereg, wback_offset));
+ 
+       seq = get_insns ();
+       end_sequence ();
+@@ -10159,41 +10133,40 @@
+     }
+ 
+   result = gen_rtx_PARALLEL (VOIDmode,
+-			     rtvec_alloc (count + (write_back ? 1 : 0)));
+-  if (write_back)
++			     rtvec_alloc (count + (wback_offset != 0 ? 1 : 0)));
++  if (wback_offset != 0)
+     {
+       XVECEXP (result, 0, 0)
+-	= gen_rtx_SET (VOIDmode, from, plus_constant (from, count * 4 * sign));
++	= gen_rtx_SET (VOIDmode, basereg,
++		       plus_constant (basereg, wback_offset));
+       i = 1;
+       count++;
+     }
+ 
+   for (j = 0; i < count; i++, j++)
+-    {
+-      addr = plus_constant (from, j * 4 * sign);
+-      mem = adjust_automodify_address_nv (basemem, SImode, addr, offset);
+-      XVECEXP (result, 0, i)
+-	= gen_rtx_SET (VOIDmode, gen_rtx_REG (SImode, base_regno + j), mem);
+-      offset += 4 * sign;
+-    }
+-
+-  if (write_back)
+-    *offsetp = offset;
++    XVECEXP (result, 0, i)
++      = gen_rtx_SET (VOIDmode, gen_rtx_REG (SImode, regs[j]), mems[j]);
+ 
+   return result;
+ }
+ 
+-rtx
+-arm_gen_store_multiple (int base_regno, int count, rtx to, int up,
+-			int write_back, rtx basemem, HOST_WIDE_INT *offsetp)
++/* Generate a store-multiple instruction.  COUNT is the number of stores in
++   the instruction; REGS and MEMS are arrays containing the operands.
++   BASEREG is the base register to be used in addressing the memory operands.
++   WBACK_OFFSET is nonzero if the instruction should update the base
++   register.  */
++
++static rtx
++arm_gen_store_multiple_1 (int count, int *regs, rtx *mems, rtx basereg,
++			  HOST_WIDE_INT wback_offset)
+ {
+-  HOST_WIDE_INT offset = *offsetp;
+   int i = 0, j;
+   rtx result;
+-  int sign = up ? 1 : -1;
+-  rtx mem, addr;
+-
+-  /* See arm_gen_load_multiple for discussion of
++
++  if (GET_CODE (basereg) == PLUS)
++    basereg = XEXP (basereg, 0);
++
++  /* See arm_gen_load_multiple_1 for discussion of
+      the pros/cons of ldm/stm usage for XScale.  */
+   if (low_irq_latency || (arm_tune_xscale && count <= 2 && ! optimize_size))
+     {
+@@ -10202,18 +10175,10 @@
+       start_sequence ();
+ 
+       for (i = 0; i < count; i++)
+-	{
+-	  addr = plus_constant (to, i * 4 * sign);
+-	  mem = adjust_automodify_address (basemem, SImode, addr, offset);
+-	  emit_move_insn (mem, gen_rtx_REG (SImode, base_regno + i));
+-	  offset += 4 * sign;
+-	}
++	emit_move_insn (mems[i], gen_rtx_REG (SImode, regs[i]));
+ 
+-      if (write_back)
+-	{
+-	  emit_move_insn (to, plus_constant (to, count * 4 * sign));
+-	  *offsetp = offset;
+-	}
++      if (wback_offset != 0)
++	emit_move_insn (basereg, plus_constant (basereg, wback_offset));
+ 
+       seq = get_insns ();
+       end_sequence ();
+@@ -10222,29 +10187,319 @@
+     }
+ 
+   result = gen_rtx_PARALLEL (VOIDmode,
+-			     rtvec_alloc (count + (write_back ? 1 : 0)));
+-  if (write_back)
++			     rtvec_alloc (count + (wback_offset != 0 ? 1 : 0)));
++  if (wback_offset != 0)
+     {
+       XVECEXP (result, 0, 0)
+-	= gen_rtx_SET (VOIDmode, to,
+-		       plus_constant (to, count * 4 * sign));
++	= gen_rtx_SET (VOIDmode, basereg,
++		       plus_constant (basereg, wback_offset));
+       i = 1;
+       count++;
+     }
+ 
+   for (j = 0; i < count; i++, j++)
++    XVECEXP (result, 0, i)
++      = gen_rtx_SET (VOIDmode, mems[j], gen_rtx_REG (SImode, regs[j]));
++
++  return result;
++}
++
++/* Generate either a load-multiple or a store-multiple instruction.  This
++   function can be used in situations where we can start with a single MEM
++   rtx and adjust its address upwards.
++   COUNT is the number of operations in the instruction, not counting a
++   possible update of the base register.  REGS is an array containing the
++   register operands.
++   BASEREG is the base register to be used in addressing the memory operands,
++   which are constructed from BASEMEM.
++   WRITE_BACK specifies whether the generated instruction should include an
++   update of the base register.
++   OFFSETP is used to pass an offset to and from this function; this offset
++   is not used when constructing the address (instead BASEMEM should have an
++   appropriate offset in its address), it is used only for setting
++   MEM_OFFSET.  It is updated only if WRITE_BACK is true.*/
++
++static rtx
++arm_gen_multiple_op (bool is_load, int *regs, int count, rtx basereg,
++		     bool write_back, rtx basemem, HOST_WIDE_INT *offsetp)
++{
++  rtx mems[MAX_LDM_STM_OPS];
++  HOST_WIDE_INT offset = *offsetp;
++  int i;
++
++  gcc_assert (count <= MAX_LDM_STM_OPS);
++
++  if (GET_CODE (basereg) == PLUS)
++    basereg = XEXP (basereg, 0);
++
++  for (i = 0; i < count; i++)
+     {
+-      addr = plus_constant (to, j * 4 * sign);
+-      mem = adjust_automodify_address_nv (basemem, SImode, addr, offset);
+-      XVECEXP (result, 0, i)
+-	= gen_rtx_SET (VOIDmode, mem, gen_rtx_REG (SImode, base_regno + j));
+-      offset += 4 * sign;
++      rtx addr = plus_constant (basereg, i * 4);
++      mems[i] = adjust_automodify_address_nv (basemem, SImode, addr, offset);
++      offset += 4;
+     }
+ 
+   if (write_back)
+     *offsetp = offset;
+ 
+-  return result;
++  if (is_load)
++    return arm_gen_load_multiple_1 (count, regs, mems, basereg,
++				    write_back ? 4 * count : 0);
++  else
++    return arm_gen_store_multiple_1 (count, regs, mems, basereg,
++				     write_back ? 4 * count : 0);
++}
++
++rtx
++arm_gen_load_multiple (int *regs, int count, rtx basereg, int write_back,
++		       rtx basemem, HOST_WIDE_INT *offsetp)
++{
++  return arm_gen_multiple_op (TRUE, regs, count, basereg, write_back, basemem,
++			      offsetp);
++}
++
++rtx
++arm_gen_store_multiple (int *regs, int count, rtx basereg, int write_back,
++			rtx basemem, HOST_WIDE_INT *offsetp)
++{
++  return arm_gen_multiple_op (FALSE, regs, count, basereg, write_back, basemem,
++			      offsetp);
++}
++
++/* Called from a peephole2 expander to turn a sequence of loads into an
++   LDM instruction.  OPERANDS are the operands found by the peephole matcher;
++   NOPS indicates how many separate loads we are trying to combine.  SORT_REGS
++   is true if we can reorder the registers because they are used commutatively
++   subsequently.
++   Returns true iff we could generate a new instruction.  */
++
++bool
++gen_ldm_seq (rtx *operands, int nops, bool sort_regs)
++{
++  int regs[MAX_LDM_STM_OPS], mem_order[MAX_LDM_STM_OPS];
++  rtx mems[MAX_LDM_STM_OPS];
++  int i, j, base_reg;
++  rtx base_reg_rtx;
++  HOST_WIDE_INT offset;
++  int write_back = FALSE;
++  int ldm_case;
++  rtx addr;
++
++  ldm_case = load_multiple_sequence (operands, nops, regs, mem_order,
++				     &base_reg, &offset, !sort_regs);
++
++  if (ldm_case == 0)
++    return false;
++
++  if (sort_regs)
++    for (i = 0; i < nops - 1; i++)
++      for (j = i + 1; j < nops; j++)
++	if (regs[i] > regs[j])
++	  {
++	    int t = regs[i];
++	    regs[i] = regs[j];
++	    regs[j] = t;
++	  }
++  base_reg_rtx = gen_rtx_REG (Pmode, base_reg);
++
++  if (TARGET_THUMB1)
++    {
++      gcc_assert (peep2_reg_dead_p (nops, base_reg_rtx));
++      gcc_assert (ldm_case == 1 || ldm_case == 5);
++      write_back = TRUE;
++    }
++
++  if (ldm_case == 5)
++    {
++      rtx newbase = TARGET_THUMB1 ? base_reg_rtx : gen_rtx_REG (SImode, regs[0]);
++      emit_insn (gen_addsi3 (newbase, base_reg_rtx, GEN_INT (offset)));
++      offset = 0;
++      if (!TARGET_THUMB1)
++	{
++	  base_reg = regs[0];
++	  base_reg_rtx = newbase;
++	}
++    }
++
++  for (i = 0; i < nops; i++)
++    {
++      addr = plus_constant (base_reg_rtx, offset + i * 4);
++      mems[i] = adjust_automodify_address_nv (operands[nops + mem_order[i]],
++					      SImode, addr, 0);
++    }
++  emit_insn (arm_gen_load_multiple_1 (nops, regs, mems, base_reg_rtx,
++				      write_back ? offset + i * 4 : 0));
++  return true;
++}
++
++/* Called from a peephole2 expander to turn a sequence of stores into an
++   STM instruction.  OPERANDS are the operands found by the peephole matcher;
++   NOPS indicates how many separate stores we are trying to combine.
++   Returns true iff we could generate a new instruction.  */
++
++bool
++gen_stm_seq (rtx *operands, int nops)
++{
++  int i;
++  int regs[MAX_LDM_STM_OPS], mem_order[MAX_LDM_STM_OPS];
++  rtx mems[MAX_LDM_STM_OPS];
++  int base_reg;
++  rtx base_reg_rtx;
++  HOST_WIDE_INT offset;
++  int write_back = FALSE;
++  int stm_case;
++  rtx addr;
++  bool base_reg_dies;
++
++  stm_case = store_multiple_sequence (operands, nops, nops, regs, NULL,
++				      mem_order, &base_reg, &offset, true);
++
++  if (stm_case == 0)
++    return false;
++
++  base_reg_rtx = gen_rtx_REG (Pmode, base_reg);
++
++  base_reg_dies = peep2_reg_dead_p (nops, base_reg_rtx);
++  if (TARGET_THUMB1)
++    {
++      gcc_assert (base_reg_dies);
++      write_back = TRUE;
++    }
++
++  if (stm_case == 5)
++    {
++      gcc_assert (base_reg_dies);
++      emit_insn (gen_addsi3 (base_reg_rtx, base_reg_rtx, GEN_INT (offset)));
++      offset = 0;
++    }
++
++  addr = plus_constant (base_reg_rtx, offset);
++
++  for (i = 0; i < nops; i++)
++    {
++      addr = plus_constant (base_reg_rtx, offset + i * 4);
++      mems[i] = adjust_automodify_address_nv (operands[nops + mem_order[i]],
++					      SImode, addr, 0);
++    }
++  emit_insn (arm_gen_store_multiple_1 (nops, regs, mems, base_reg_rtx,
++				       write_back ? offset + i * 4 : 0));
++  return true;
++}
++
++/* Called from a peephole2 expander to turn a sequence of stores that are
++   preceded by constant loads into an STM instruction.  OPERANDS are the
++   operands found by the peephole matcher; NOPS indicates how many
++   separate stores we are trying to combine; there are 2 * NOPS
++   instructions in the peephole.
++   Returns true iff we could generate a new instruction.  */
++
++bool
++gen_const_stm_seq (rtx *operands, int nops)
++{
++  int regs[MAX_LDM_STM_OPS], sorted_regs[MAX_LDM_STM_OPS];
++  int reg_order[MAX_LDM_STM_OPS], mem_order[MAX_LDM_STM_OPS];
++  rtx reg_rtxs[MAX_LDM_STM_OPS], orig_reg_rtxs[MAX_LDM_STM_OPS];
++  rtx mems[MAX_LDM_STM_OPS];
++  int base_reg;
++  rtx base_reg_rtx;
++  HOST_WIDE_INT offset;
++  int write_back = FALSE;
++  int stm_case;
++  rtx addr;
++  bool base_reg_dies;
++  int i, j;
++  HARD_REG_SET allocated;
++
++  stm_case = store_multiple_sequence (operands, nops, 2 * nops, regs, reg_rtxs,
++				      mem_order, &base_reg, &offset, false);
++
++  if (stm_case == 0)
++    return false;
++
++  memcpy (orig_reg_rtxs, reg_rtxs, sizeof orig_reg_rtxs);
++
++  /* If the same register is used more than once, try to find a free
++     register.  */
++  CLEAR_HARD_REG_SET (allocated);
++  for (i = 0; i < nops; i++)
++    {
++      for (j = i + 1; j < nops; j++)
++	if (regs[i] == regs[j])
++	  {
++	    rtx t = peep2_find_free_register (0, nops * 2,
++					      TARGET_THUMB1 ? "l" : "r",
++					      SImode, &allocated);
++	    if (t == NULL_RTX)
++	      return false;
++	    reg_rtxs[i] = t;
++	    regs[i] = REGNO (t);
++	  }
++    }
++
++  /* Compute an ordering that maps the register numbers to an ascending
++     sequence.  */
++  reg_order[0] = 0;
++  for (i = 0; i < nops; i++)
++    if (regs[i] < regs[reg_order[0]])
++      reg_order[0] = i;
++
++  for (i = 1; i < nops; i++)
++    {
++      int this_order = reg_order[i - 1];
++      for (j = 0; j < nops; j++)
++	if (regs[j] > regs[reg_order[i - 1]]
++	    && (this_order == reg_order[i - 1]
++		|| regs[j] < regs[this_order]))
++	  this_order = j;
++      reg_order[i] = this_order;
++    }
++
++  /* Ensure that registers that must be live after the instruction end
++     up with the correct value.  */
++  for (i = 0; i < nops; i++)
++    {
++      int this_order = reg_order[i];
++      if ((this_order != mem_order[i]
++	   || orig_reg_rtxs[this_order] != reg_rtxs[this_order])
++	  && !peep2_reg_dead_p (nops * 2, orig_reg_rtxs[this_order]))
++	return false;
++    }
++
++  /* Load the constants.  */
++  for (i = 0; i < nops; i++)
++    {
++      rtx op = operands[2 * nops + mem_order[i]];
++      sorted_regs[i] = regs[reg_order[i]];
++      emit_move_insn (reg_rtxs[reg_order[i]], op);
++    }
++
++  base_reg_rtx = gen_rtx_REG (Pmode, base_reg);
++
++  base_reg_dies = peep2_reg_dead_p (nops * 2, base_reg_rtx);
++  if (TARGET_THUMB1)
++    {
++      gcc_assert (base_reg_dies);
++      write_back = TRUE;
++    }
++
++  if (stm_case == 5)
++    {
++      gcc_assert (base_reg_dies);
++      emit_insn (gen_addsi3 (base_reg_rtx, base_reg_rtx, GEN_INT (offset)));
++      offset = 0;
++    }
++
++  addr = plus_constant (base_reg_rtx, offset);
++
++  for (i = 0; i < nops; i++)
++    {
++      addr = plus_constant (base_reg_rtx, offset + i * 4);
++      mems[i] = adjust_automodify_address_nv (operands[nops + mem_order[i]],
++					      SImode, addr, 0);
++    }
++  emit_insn (arm_gen_store_multiple_1 (nops, sorted_regs, mems, base_reg_rtx,
++				       write_back ? offset + i * 4 : 0));
++  return true;
+ }
+ 
+ int
+@@ -10280,20 +10535,21 @@
+   for (i = 0; in_words_to_go >= 2; i+=4)
+     {
+       if (in_words_to_go > 4)
+-	emit_insn (arm_gen_load_multiple (0, 4, src, TRUE, TRUE,
+-					  srcbase, &srcoffset));
++	emit_insn (arm_gen_load_multiple (arm_regs_in_sequence, 4, src,
++					  TRUE, srcbase, &srcoffset));
+       else
+-	emit_insn (arm_gen_load_multiple (0, in_words_to_go, src, TRUE,
+-					  FALSE, srcbase, &srcoffset));
++	emit_insn (arm_gen_load_multiple (arm_regs_in_sequence, in_words_to_go,
++					  src, FALSE, srcbase,
++					  &srcoffset));
+ 
+       if (out_words_to_go)
+ 	{
+ 	  if (out_words_to_go > 4)
+-	    emit_insn (arm_gen_store_multiple (0, 4, dst, TRUE, TRUE,
+-					       dstbase, &dstoffset));
++	    emit_insn (arm_gen_store_multiple (arm_regs_in_sequence, 4, dst,
++					       TRUE, dstbase, &dstoffset));
+ 	  else if (out_words_to_go != 1)
+-	    emit_insn (arm_gen_store_multiple (0, out_words_to_go,
+-					       dst, TRUE,
++	    emit_insn (arm_gen_store_multiple (arm_regs_in_sequence,
++					       out_words_to_go, dst,
+ 					       (last_bytes == 0
+ 						? FALSE : TRUE),
+ 					       dstbase, &dstoffset));
+
+=== modified file 'gcc/config/arm/arm.h'
+--- old/gcc/config/arm/arm.h	2011-01-05 12:12:18 +0000
++++ new/gcc/config/arm/arm.h	2011-01-05 18:20:37 +0000
+@@ -1143,6 +1143,9 @@
+   ((MODE) == TImode || (MODE) == EImode || (MODE) == OImode \
+    || (MODE) == CImode || (MODE) == XImode)
+ 
++/* The register numbers in sequence, for passing to arm_gen_load_multiple.  */
++extern int arm_regs_in_sequence[];
++
+ /* The order in which register should be allocated.  It is good to use ip
+    since no saving is required (though calls clobber it) and it never contains
+    function parameters.  It is quite good to use lr since other calls may
+@@ -2823,4 +2826,8 @@
+ #define NEED_INDICATE_EXEC_STACK	0
+ #endif
+ 
++/* The maximum number of parallel loads or stores we support in an ldm/stm
++   instruction.  */
++#define MAX_LDM_STM_OPS 4
++
+ #endif /* ! GCC_ARM_H */
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-01-05 12:12:18 +0000
++++ new/gcc/config/arm/arm.md	2011-01-05 18:20:37 +0000
+@@ -6282,7 +6282,7 @@
+ 
+ ;; load- and store-multiple insns
+ ;; The arm can load/store any set of registers, provided that they are in
+-;; ascending order; but that is beyond GCC so stick with what it knows.
++;; ascending order, but these expanders assume a contiguous set.
+ 
+ (define_expand "load_multiple"
+   [(match_par_dup 3 [(set (match_operand:SI 0 "" "")
+@@ -6303,126 +6303,12 @@
+     FAIL;
+ 
+   operands[3]
+-    = arm_gen_load_multiple (REGNO (operands[0]), INTVAL (operands[2]),
++    = arm_gen_load_multiple (arm_regs_in_sequence + REGNO (operands[0]),
++			     INTVAL (operands[2]),
+ 			     force_reg (SImode, XEXP (operands[1], 0)),
+-			     TRUE, FALSE, operands[1], &offset);
++			     FALSE, operands[1], &offset);
+ })
+ 
+-;; Load multiple with write-back
+-
+-(define_insn "*ldmsi_postinc4"
+-  [(match_parallel 0 "load_multiple_operation"
+-    [(set (match_operand:SI 1 "s_register_operand" "=r")
+-	  (plus:SI (match_operand:SI 2 "s_register_operand" "1")
+-		   (const_int 16)))
+-     (set (match_operand:SI 3 "arm_hard_register_operand" "")
+-	  (mem:SI (match_dup 2)))
+-     (set (match_operand:SI 4 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 2) (const_int 4))))
+-     (set (match_operand:SI 5 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 2) (const_int 8))))
+-     (set (match_operand:SI 6 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 2) (const_int 12))))])]
+-  "TARGET_32BIT && XVECLEN (operands[0], 0) == 5"
+-  "ldm%(ia%)\\t%1!, {%3, %4, %5, %6}"
+-  [(set_attr "type" "load4")
+-   (set_attr "predicable" "yes")]
+-)
+-
+-(define_insn "*ldmsi_postinc4_thumb1"
+-  [(match_parallel 0 "load_multiple_operation"
+-    [(set (match_operand:SI 1 "s_register_operand" "=l")
+-	  (plus:SI (match_operand:SI 2 "s_register_operand" "1")
+-		   (const_int 16)))
+-     (set (match_operand:SI 3 "arm_hard_register_operand" "")
+-	  (mem:SI (match_dup 2)))
+-     (set (match_operand:SI 4 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 2) (const_int 4))))
+-     (set (match_operand:SI 5 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 2) (const_int 8))))
+-     (set (match_operand:SI 6 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 2) (const_int 12))))])]
+-  "TARGET_THUMB1 && XVECLEN (operands[0], 0) == 5"
+-  "ldmia\\t%1!, {%3, %4, %5, %6}"
+-  [(set_attr "type" "load4")]
+-)
+-
+-(define_insn "*ldmsi_postinc3"
+-  [(match_parallel 0 "load_multiple_operation"
+-    [(set (match_operand:SI 1 "s_register_operand" "=r")
+-	  (plus:SI (match_operand:SI 2 "s_register_operand" "1")
+-		   (const_int 12)))
+-     (set (match_operand:SI 3 "arm_hard_register_operand" "")
+-	  (mem:SI (match_dup 2)))
+-     (set (match_operand:SI 4 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 2) (const_int 4))))
+-     (set (match_operand:SI 5 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 2) (const_int 8))))])]
+-  "TARGET_32BIT && XVECLEN (operands[0], 0) == 4"
+-  "ldm%(ia%)\\t%1!, {%3, %4, %5}"
+-  [(set_attr "type" "load3")
+-   (set_attr "predicable" "yes")]
+-)
+-
+-(define_insn "*ldmsi_postinc2"
+-  [(match_parallel 0 "load_multiple_operation"
+-    [(set (match_operand:SI 1 "s_register_operand" "=r")
+-	  (plus:SI (match_operand:SI 2 "s_register_operand" "1")
+-		   (const_int 8)))
+-     (set (match_operand:SI 3 "arm_hard_register_operand" "")
+-	  (mem:SI (match_dup 2)))
+-     (set (match_operand:SI 4 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 2) (const_int 4))))])]
+-  "TARGET_32BIT && XVECLEN (operands[0], 0) == 3"
+-  "ldm%(ia%)\\t%1!, {%3, %4}"
+-  [(set_attr "type" "load2")
+-   (set_attr "predicable" "yes")]
+-)
+-
+-;; Ordinary load multiple
+-
+-(define_insn "*ldmsi4"
+-  [(match_parallel 0 "load_multiple_operation"
+-    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
+-	  (mem:SI (match_operand:SI 1 "s_register_operand" "r")))
+-     (set (match_operand:SI 3 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 1) (const_int 4))))
+-     (set (match_operand:SI 4 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 1) (const_int 8))))
+-     (set (match_operand:SI 5 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 1) (const_int 12))))])]
+-  "TARGET_32BIT && XVECLEN (operands[0], 0) == 4"
+-  "ldm%(ia%)\\t%1, {%2, %3, %4, %5}"
+-  [(set_attr "type" "load4")
+-   (set_attr "predicable" "yes")]
+-)
+-
+-(define_insn "*ldmsi3"
+-  [(match_parallel 0 "load_multiple_operation"
+-    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
+-	  (mem:SI (match_operand:SI 1 "s_register_operand" "r")))
+-     (set (match_operand:SI 3 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 1) (const_int 4))))
+-     (set (match_operand:SI 4 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 1) (const_int 8))))])]
+-  "TARGET_32BIT && XVECLEN (operands[0], 0) == 3"
+-  "ldm%(ia%)\\t%1, {%2, %3, %4}"
+-  [(set_attr "type" "load3")
+-   (set_attr "predicable" "yes")]
+-)
+-
+-(define_insn "*ldmsi2"
+-  [(match_parallel 0 "load_multiple_operation"
+-    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
+-	  (mem:SI (match_operand:SI 1 "s_register_operand" "r")))
+-     (set (match_operand:SI 3 "arm_hard_register_operand" "")
+-	  (mem:SI (plus:SI (match_dup 1) (const_int 4))))])]
+-  "TARGET_32BIT && XVECLEN (operands[0], 0) == 2"
+-  "ldm%(ia%)\\t%1, {%2, %3}"
+-  [(set_attr "type" "load2")
+-   (set_attr "predicable" "yes")]
+-)
+-
+ (define_expand "store_multiple"
+   [(match_par_dup 3 [(set (match_operand:SI 0 "" "")
+                           (match_operand:SI 1 "" ""))
+@@ -6442,125 +6328,12 @@
+     FAIL;
+ 
+   operands[3]
+-    = arm_gen_store_multiple (REGNO (operands[1]), INTVAL (operands[2]),
++    = arm_gen_store_multiple (arm_regs_in_sequence + REGNO (operands[1]),
++			      INTVAL (operands[2]),
+ 			      force_reg (SImode, XEXP (operands[0], 0)),
+-			      TRUE, FALSE, operands[0], &offset);
++			      FALSE, operands[0], &offset);
+ })
+ 
+-;; Store multiple with write-back
+-
+-(define_insn "*stmsi_postinc4"
+-  [(match_parallel 0 "store_multiple_operation"
+-    [(set (match_operand:SI 1 "s_register_operand" "=r")
+-	  (plus:SI (match_operand:SI 2 "s_register_operand" "1")
+-		   (const_int 16)))
+-     (set (mem:SI (match_dup 2))
+-	  (match_operand:SI 3 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
+-	  (match_operand:SI 4 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 2) (const_int 8)))
+-	  (match_operand:SI 5 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 2) (const_int 12)))
+-	  (match_operand:SI 6 "arm_hard_register_operand" ""))])]
+-  "TARGET_32BIT && XVECLEN (operands[0], 0) == 5"
+-  "stm%(ia%)\\t%1!, {%3, %4, %5, %6}"
+-  [(set_attr "predicable" "yes")
+-   (set_attr "type" "store4")]
+-)
+-
+-(define_insn "*stmsi_postinc4_thumb1"
+-  [(match_parallel 0 "store_multiple_operation"
+-    [(set (match_operand:SI 1 "s_register_operand" "=l")
+-	  (plus:SI (match_operand:SI 2 "s_register_operand" "1")
+-		   (const_int 16)))
+-     (set (mem:SI (match_dup 2))
+-	  (match_operand:SI 3 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
+-	  (match_operand:SI 4 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 2) (const_int 8)))
+-	  (match_operand:SI 5 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 2) (const_int 12)))
+-	  (match_operand:SI 6 "arm_hard_register_operand" ""))])]
+-  "TARGET_THUMB1 && XVECLEN (operands[0], 0) == 5"
+-  "stmia\\t%1!, {%3, %4, %5, %6}"
+-  [(set_attr "type" "store4")]
+-)
+-
+-(define_insn "*stmsi_postinc3"
+-  [(match_parallel 0 "store_multiple_operation"
+-    [(set (match_operand:SI 1 "s_register_operand" "=r")
+-	  (plus:SI (match_operand:SI 2 "s_register_operand" "1")
+-		   (const_int 12)))
+-     (set (mem:SI (match_dup 2))
+-	  (match_operand:SI 3 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
+-	  (match_operand:SI 4 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 2) (const_int 8)))
+-	  (match_operand:SI 5 "arm_hard_register_operand" ""))])]
+-  "TARGET_32BIT && XVECLEN (operands[0], 0) == 4"
+-  "stm%(ia%)\\t%1!, {%3, %4, %5}"
+-  [(set_attr "predicable" "yes")
+-   (set_attr "type" "store3")]
+-)
+-
+-(define_insn "*stmsi_postinc2"
+-  [(match_parallel 0 "store_multiple_operation"
+-    [(set (match_operand:SI 1 "s_register_operand" "=r")
+-	  (plus:SI (match_operand:SI 2 "s_register_operand" "1")
+-		   (const_int 8)))
+-     (set (mem:SI (match_dup 2))
+-	  (match_operand:SI 3 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
+-	  (match_operand:SI 4 "arm_hard_register_operand" ""))])]
+-  "TARGET_32BIT && XVECLEN (operands[0], 0) == 3"
+-  "stm%(ia%)\\t%1!, {%3, %4}"
+-  [(set_attr "predicable" "yes")
+-   (set_attr "type" "store2")]
+-)
+-
+-;; Ordinary store multiple
+-
+-(define_insn "*stmsi4"
+-  [(match_parallel 0 "store_multiple_operation"
+-    [(set (mem:SI (match_operand:SI 1 "s_register_operand" "r"))
+-	  (match_operand:SI 2 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 1) (const_int 4)))
+-	  (match_operand:SI 3 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 1) (const_int 8)))
+-	  (match_operand:SI 4 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 1) (const_int 12)))
+-	  (match_operand:SI 5 "arm_hard_register_operand" ""))])]
+-  "TARGET_32BIT && XVECLEN (operands[0], 0) == 4"
+-  "stm%(ia%)\\t%1, {%2, %3, %4, %5}"
+-  [(set_attr "predicable" "yes")
+-   (set_attr "type" "store4")]
+-)
+-
+-(define_insn "*stmsi3"
+-  [(match_parallel 0 "store_multiple_operation"
+-    [(set (mem:SI (match_operand:SI 1 "s_register_operand" "r"))
+-	  (match_operand:SI 2 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 1) (const_int 4)))
+-	  (match_operand:SI 3 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 1) (const_int 8)))
+-	  (match_operand:SI 4 "arm_hard_register_operand" ""))])]
+-  "TARGET_32BIT && XVECLEN (operands[0], 0) == 3"
+-  "stm%(ia%)\\t%1, {%2, %3, %4}"
+-  [(set_attr "predicable" "yes")
+-   (set_attr "type" "store3")]
+-)
+-
+-(define_insn "*stmsi2"
+-  [(match_parallel 0 "store_multiple_operation"
+-    [(set (mem:SI (match_operand:SI 1 "s_register_operand" "r"))
+-	  (match_operand:SI 2 "arm_hard_register_operand" ""))
+-     (set (mem:SI (plus:SI (match_dup 1) (const_int 4)))
+-	  (match_operand:SI 3 "arm_hard_register_operand" ""))])]
+-  "TARGET_32BIT && XVECLEN (operands[0], 0) == 2"
+-  "stm%(ia%)\\t%1, {%2, %3}"
+-  [(set_attr "predicable" "yes")
+-   (set_attr "type" "store2")]
+-)
+ 
+ ;; Move a block of memory if it is word aligned and MORE than 2 words long.
+ ;; We could let this apply for blocks of less than this, but it clobbers so
+@@ -9031,8 +8804,8 @@
+ 	if (REGNO (reg) == R0_REGNUM)
+ 	  {
+ 	    /* On thumb we have to use a write-back instruction.  */
+-	    emit_insn (arm_gen_store_multiple (R0_REGNUM, 4, addr, TRUE,
+-			TARGET_THUMB ? TRUE : FALSE, mem, &offset));
++	    emit_insn (arm_gen_store_multiple (arm_regs_in_sequence, 4, addr,
++ 		       TARGET_THUMB ? TRUE : FALSE, mem, &offset));
+ 	    size = TARGET_ARM ? 16 : 0;
+ 	  }
+ 	else
+@@ -9078,8 +8851,8 @@
+ 	if (REGNO (reg) == R0_REGNUM)
+ 	  {
+ 	    /* On thumb we have to use a write-back instruction.  */
+-	    emit_insn (arm_gen_load_multiple (R0_REGNUM, 4, addr, TRUE,
+-			TARGET_THUMB ? TRUE : FALSE, mem, &offset));
++	    emit_insn (arm_gen_load_multiple (arm_regs_in_sequence, 4, addr,
++ 		       TARGET_THUMB ? TRUE : FALSE, mem, &offset));
+ 	    size = TARGET_ARM ? 16 : 0;
+ 	  }
+ 	else
+@@ -10672,87 +10445,6 @@
+   ""
+ )
+ 
+-; Peepholes to spot possible load- and store-multiples, if the ordering is
+-; reversed, check that the memory references aren't volatile.
+-
+-(define_peephole
+-  [(set (match_operand:SI 0 "s_register_operand" "=rk")
+-        (match_operand:SI 4 "memory_operand" "m"))
+-   (set (match_operand:SI 1 "s_register_operand" "=rk")
+-        (match_operand:SI 5 "memory_operand" "m"))
+-   (set (match_operand:SI 2 "s_register_operand" "=rk")
+-        (match_operand:SI 6 "memory_operand" "m"))
+-   (set (match_operand:SI 3 "s_register_operand" "=rk")
+-        (match_operand:SI 7 "memory_operand" "m"))]
+-  "TARGET_ARM && load_multiple_sequence (operands, 4, NULL, NULL, NULL)"
+-  "*
+-  return emit_ldm_seq (operands, 4);
+-  "
+-)
+-
+-(define_peephole
+-  [(set (match_operand:SI 0 "s_register_operand" "=rk")
+-        (match_operand:SI 3 "memory_operand" "m"))
+-   (set (match_operand:SI 1 "s_register_operand" "=rk")
+-        (match_operand:SI 4 "memory_operand" "m"))
+-   (set (match_operand:SI 2 "s_register_operand" "=rk")
+-        (match_operand:SI 5 "memory_operand" "m"))]
+-  "TARGET_ARM && load_multiple_sequence (operands, 3, NULL, NULL, NULL)"
+-  "*
+-  return emit_ldm_seq (operands, 3);
+-  "
+-)
+-
+-(define_peephole
+-  [(set (match_operand:SI 0 "s_register_operand" "=rk")
+-        (match_operand:SI 2 "memory_operand" "m"))
+-   (set (match_operand:SI 1 "s_register_operand" "=rk")
+-        (match_operand:SI 3 "memory_operand" "m"))]
+-  "TARGET_ARM && load_multiple_sequence (operands, 2, NULL, NULL, NULL)"
+-  "*
+-  return emit_ldm_seq (operands, 2);
+-  "
+-)
+-
+-(define_peephole
+-  [(set (match_operand:SI 4 "memory_operand" "=m")
+-        (match_operand:SI 0 "s_register_operand" "rk"))
+-   (set (match_operand:SI 5 "memory_operand" "=m")
+-        (match_operand:SI 1 "s_register_operand" "rk"))
+-   (set (match_operand:SI 6 "memory_operand" "=m")
+-        (match_operand:SI 2 "s_register_operand" "rk"))
+-   (set (match_operand:SI 7 "memory_operand" "=m")
+-        (match_operand:SI 3 "s_register_operand" "rk"))]
+-  "TARGET_ARM && store_multiple_sequence (operands, 4, NULL, NULL, NULL)"
+-  "*
+-  return emit_stm_seq (operands, 4);
+-  "
+-)
+-
+-(define_peephole
+-  [(set (match_operand:SI 3 "memory_operand" "=m")
+-        (match_operand:SI 0 "s_register_operand" "rk"))
+-   (set (match_operand:SI 4 "memory_operand" "=m")
+-        (match_operand:SI 1 "s_register_operand" "rk"))
+-   (set (match_operand:SI 5 "memory_operand" "=m")
+-        (match_operand:SI 2 "s_register_operand" "rk"))]
+-  "TARGET_ARM && store_multiple_sequence (operands, 3, NULL, NULL, NULL)"
+-  "*
+-  return emit_stm_seq (operands, 3);
+-  "
+-)
+-
+-(define_peephole
+-  [(set (match_operand:SI 2 "memory_operand" "=m")
+-        (match_operand:SI 0 "s_register_operand" "rk"))
+-   (set (match_operand:SI 3 "memory_operand" "=m")
+-        (match_operand:SI 1 "s_register_operand" "rk"))]
+-  "TARGET_ARM && store_multiple_sequence (operands, 2, NULL, NULL, NULL)"
+-  "*
+-  return emit_stm_seq (operands, 2);
+-  "
+-)
+-
+ (define_split
+   [(set (match_operand:SI 0 "s_register_operand" "")
+ 	(and:SI (ge:SI (match_operand:SI 1 "s_register_operand" "")
+@@ -11559,6 +11251,8 @@
+   "
+ )
+ 
++;; Load the load/store multiple patterns
++(include "ldmstm.md")
+ ;; Load the FPA co-processor patterns
+ (include "fpa.md")
+ ;; Load the Maverick co-processor patterns
+
+=== added file 'gcc/config/arm/ldmstm.md'
+--- old/gcc/config/arm/ldmstm.md	1970-01-01 00:00:00 +0000
++++ new/gcc/config/arm/ldmstm.md	2010-11-16 13:08:47 +0000
+@@ -0,0 +1,1191 @@
++/* ARM ldm/stm instruction patterns.  This file was automatically generated
++   using arm-ldmstm.ml.  Please do not edit manually.
++
++   Copyright (C) 2010 Free Software Foundation, Inc.
++   Contributed by CodeSourcery.
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
++   You should have received a copy of the GNU General Public License and
++   a copy of the GCC Runtime Library Exception along with this program;
++   see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
++   <http://www.gnu.org/licenses/>.  */
++
++(define_insn "*ldm4_ia"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (match_operand:SI 1 "s_register_operand" "rk")))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 4))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 8))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 12))))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 4"
++  "ldm%(ia%)\t%1, {%2, %3, %4, %5}"
++  [(set_attr "type" "load4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*thumb_ldm4_ia"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (match_operand:SI 1 "s_register_operand" "l")))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 4))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 8))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 12))))])]
++  "TARGET_THUMB1 && XVECLEN (operands[0], 0) == 4"
++  "ldm%(ia%)\t%1, {%2, %3, %4, %5}"
++  [(set_attr "type" "load4")])
++
++(define_insn "*ldm4_ia_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 16)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (match_dup 2)))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 4))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 8))))
++     (set (match_operand:SI 6 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 12))))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 5"
++  "ldm%(ia%)\t%1!, {%3, %4, %5, %6}"
++  [(set_attr "type" "load4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*thumb_ldm4_ia_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=l")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 16)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (match_dup 2)))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 4))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 8))))
++     (set (match_operand:SI 6 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 12))))])]
++  "TARGET_THUMB1 && XVECLEN (operands[0], 0) == 5"
++  "ldm%(ia%)\t%1!, {%3, %4, %5, %6}"
++  [(set_attr "type" "load4")])
++
++(define_insn "*stm4_ia"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (mem:SI (match_operand:SI 1 "s_register_operand" "rk"))
++          (match_operand:SI 2 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int 4)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int 8)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int 12)))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 4"
++  "stm%(ia%)\t%1, {%2, %3, %4, %5}"
++  [(set_attr "type" "store4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm4_ia_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 16)))
++     (set (mem:SI (match_dup 2))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 8)))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 12)))
++          (match_operand:SI 6 "arm_hard_register_operand" ""))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 5"
++  "stm%(ia%)\t%1!, {%3, %4, %5, %6}"
++  [(set_attr "type" "store4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*thumb_stm4_ia_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=l")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 16)))
++     (set (mem:SI (match_dup 2))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 8)))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 12)))
++          (match_operand:SI 6 "arm_hard_register_operand" ""))])]
++  "TARGET_THUMB1 && XVECLEN (operands[0], 0) == 5"
++  "stm%(ia%)\t%1!, {%3, %4, %5, %6}"
++  [(set_attr "type" "store4")])
++
++(define_insn "*ldm4_ib"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk")
++                  (const_int 4))))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 8))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 12))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 16))))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 4"
++  "ldm%(ib%)\t%1, {%2, %3, %4, %5}"
++  [(set_attr "type" "load4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm4_ib_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 16)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 4))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 8))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 12))))
++     (set (match_operand:SI 6 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 16))))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 5"
++  "ldm%(ib%)\t%1!, {%3, %4, %5, %6}"
++  [(set_attr "type" "load4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm4_ib"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk") (const_int 4)))
++          (match_operand:SI 2 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int 8)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int 12)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int 16)))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 4"
++  "stm%(ib%)\t%1, {%2, %3, %4, %5}"
++  [(set_attr "type" "store4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm4_ib_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 16)))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 8)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 12)))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 16)))
++          (match_operand:SI 6 "arm_hard_register_operand" ""))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 5"
++  "stm%(ib%)\t%1!, {%3, %4, %5, %6}"
++  [(set_attr "type" "store4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm4_da"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk")
++                  (const_int -12))))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int -8))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int -4))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (match_dup 1)))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 4"
++  "ldm%(da%)\t%1, {%2, %3, %4, %5}"
++  [(set_attr "type" "load4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm4_da_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int -16)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -12))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -8))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -4))))
++     (set (match_operand:SI 6 "arm_hard_register_operand" "")
++          (mem:SI (match_dup 2)))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 5"
++  "ldm%(da%)\t%1!, {%3, %4, %5, %6}"
++  [(set_attr "type" "load4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm4_da"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk") (const_int -12)))
++          (match_operand:SI 2 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int -8)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int -4)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (match_dup 1))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 4"
++  "stm%(da%)\t%1, {%2, %3, %4, %5}"
++  [(set_attr "type" "store4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm4_da_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int -16)))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -12)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -8)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -4)))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))
++     (set (mem:SI (match_dup 2))
++          (match_operand:SI 6 "arm_hard_register_operand" ""))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 5"
++  "stm%(da%)\t%1!, {%3, %4, %5, %6}"
++  [(set_attr "type" "store4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm4_db"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk")
++                  (const_int -16))))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int -12))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int -8))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int -4))))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 4"
++  "ldm%(db%)\t%1, {%2, %3, %4, %5}"
++  [(set_attr "type" "load4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm4_db_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int -16)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -16))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -12))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -8))))
++     (set (match_operand:SI 6 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -4))))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 5"
++  "ldm%(db%)\t%1!, {%3, %4, %5, %6}"
++  [(set_attr "type" "load4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm4_db"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk") (const_int -16)))
++          (match_operand:SI 2 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int -12)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int -8)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int -4)))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 4"
++  "stm%(db%)\t%1, {%2, %3, %4, %5}"
++  [(set_attr "type" "store4")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm4_db_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int -16)))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -16)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -12)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -8)))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -4)))
++          (match_operand:SI 6 "arm_hard_register_operand" ""))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 5"
++  "stm%(db%)\t%1!, {%3, %4, %5, %6}"
++  [(set_attr "type" "store4")
++   (set_attr "predicable" "yes")])
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 4 "memory_operand" ""))
++   (set (match_operand:SI 1 "s_register_operand" "")
++        (match_operand:SI 5 "memory_operand" ""))
++   (set (match_operand:SI 2 "s_register_operand" "")
++        (match_operand:SI 6 "memory_operand" ""))
++   (set (match_operand:SI 3 "s_register_operand" "")
++        (match_operand:SI 7 "memory_operand" ""))]
++  ""
++  [(const_int 0)]
++{
++  if (gen_ldm_seq (operands, 4, false))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 4 "memory_operand" ""))
++   (parallel
++    [(set (match_operand:SI 1 "s_register_operand" "")
++          (match_operand:SI 5 "memory_operand" ""))
++     (set (match_operand:SI 2 "s_register_operand" "")
++          (match_operand:SI 6 "memory_operand" ""))
++     (set (match_operand:SI 3 "s_register_operand" "")
++          (match_operand:SI 7 "memory_operand" ""))])]
++  ""
++  [(const_int 0)]
++{
++  if (gen_ldm_seq (operands, 4, false))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 8 "const_int_operand" ""))
++   (set (match_operand:SI 4 "memory_operand" "")
++        (match_dup 0))
++   (set (match_operand:SI 1 "s_register_operand" "")
++        (match_operand:SI 9 "const_int_operand" ""))
++   (set (match_operand:SI 5 "memory_operand" "")
++        (match_dup 1))
++   (set (match_operand:SI 2 "s_register_operand" "")
++        (match_operand:SI 10 "const_int_operand" ""))
++   (set (match_operand:SI 6 "memory_operand" "")
++        (match_dup 2))
++   (set (match_operand:SI 3 "s_register_operand" "")
++        (match_operand:SI 11 "const_int_operand" ""))
++   (set (match_operand:SI 7 "memory_operand" "")
++        (match_dup 3))]
++  ""
++  [(const_int 0)]
++{
++  if (gen_const_stm_seq (operands, 4))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 8 "const_int_operand" ""))
++   (set (match_operand:SI 1 "s_register_operand" "")
++        (match_operand:SI 9 "const_int_operand" ""))
++   (set (match_operand:SI 2 "s_register_operand" "")
++        (match_operand:SI 10 "const_int_operand" ""))
++   (set (match_operand:SI 3 "s_register_operand" "")
++        (match_operand:SI 11 "const_int_operand" ""))
++   (set (match_operand:SI 4 "memory_operand" "")
++        (match_dup 0))
++   (set (match_operand:SI 5 "memory_operand" "")
++        (match_dup 1))
++   (set (match_operand:SI 6 "memory_operand" "")
++        (match_dup 2))
++   (set (match_operand:SI 7 "memory_operand" "")
++        (match_dup 3))]
++  ""
++  [(const_int 0)]
++{
++  if (gen_const_stm_seq (operands, 4))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 4 "memory_operand" "")
++        (match_operand:SI 0 "s_register_operand" ""))
++   (set (match_operand:SI 5 "memory_operand" "")
++        (match_operand:SI 1 "s_register_operand" ""))
++   (set (match_operand:SI 6 "memory_operand" "")
++        (match_operand:SI 2 "s_register_operand" ""))
++   (set (match_operand:SI 7 "memory_operand" "")
++        (match_operand:SI 3 "s_register_operand" ""))]
++  ""
++  [(const_int 0)]
++{
++  if (gen_stm_seq (operands, 4))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_insn "*ldm3_ia"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (match_operand:SI 1 "s_register_operand" "rk")))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 4))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 8))))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 3"
++  "ldm%(ia%)\t%1, {%2, %3, %4}"
++  [(set_attr "type" "load3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*thumb_ldm3_ia"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (match_operand:SI 1 "s_register_operand" "l")))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 4))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 8))))])]
++  "TARGET_THUMB1 && XVECLEN (operands[0], 0) == 3"
++  "ldm%(ia%)\t%1, {%2, %3, %4}"
++  [(set_attr "type" "load3")])
++
++(define_insn "*ldm3_ia_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 12)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (match_dup 2)))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 4))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 8))))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 4"
++  "ldm%(ia%)\t%1!, {%3, %4, %5}"
++  [(set_attr "type" "load3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*thumb_ldm3_ia_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=l")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 12)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (match_dup 2)))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 4))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 8))))])]
++  "TARGET_THUMB1 && XVECLEN (operands[0], 0) == 4"
++  "ldm%(ia%)\t%1!, {%3, %4, %5}"
++  [(set_attr "type" "load3")])
++
++(define_insn "*stm3_ia"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (mem:SI (match_operand:SI 1 "s_register_operand" "rk"))
++          (match_operand:SI 2 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int 4)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int 8)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 3"
++  "stm%(ia%)\t%1, {%2, %3, %4}"
++  [(set_attr "type" "store3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm3_ia_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 12)))
++     (set (mem:SI (match_dup 2))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 8)))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 4"
++  "stm%(ia%)\t%1!, {%3, %4, %5}"
++  [(set_attr "type" "store3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*thumb_stm3_ia_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=l")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 12)))
++     (set (mem:SI (match_dup 2))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 8)))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))])]
++  "TARGET_THUMB1 && XVECLEN (operands[0], 0) == 4"
++  "stm%(ia%)\t%1!, {%3, %4, %5}"
++  [(set_attr "type" "store3")])
++
++(define_insn "*ldm3_ib"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk")
++                  (const_int 4))))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 8))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 12))))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 3"
++  "ldm%(ib%)\t%1, {%2, %3, %4}"
++  [(set_attr "type" "load3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm3_ib_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 12)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 4))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 8))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 12))))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 4"
++  "ldm%(ib%)\t%1!, {%3, %4, %5}"
++  [(set_attr "type" "load3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm3_ib"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk") (const_int 4)))
++          (match_operand:SI 2 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int 8)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int 12)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 3"
++  "stm%(ib%)\t%1, {%2, %3, %4}"
++  [(set_attr "type" "store3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm3_ib_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 12)))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 8)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 12)))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 4"
++  "stm%(ib%)\t%1!, {%3, %4, %5}"
++  [(set_attr "type" "store3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm3_da"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk")
++                  (const_int -8))))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int -4))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (match_dup 1)))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 3"
++  "ldm%(da%)\t%1, {%2, %3, %4}"
++  [(set_attr "type" "load3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm3_da_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int -12)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -8))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -4))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (match_dup 2)))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 4"
++  "ldm%(da%)\t%1!, {%3, %4, %5}"
++  [(set_attr "type" "load3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm3_da"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk") (const_int -8)))
++          (match_operand:SI 2 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int -4)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (match_dup 1))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 3"
++  "stm%(da%)\t%1, {%2, %3, %4}"
++  [(set_attr "type" "store3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm3_da_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int -12)))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -8)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -4)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (match_dup 2))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 4"
++  "stm%(da%)\t%1!, {%3, %4, %5}"
++  [(set_attr "type" "store3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm3_db"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk")
++                  (const_int -12))))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int -8))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int -4))))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 3"
++  "ldm%(db%)\t%1, {%2, %3, %4}"
++  [(set_attr "type" "load3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm3_db_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int -12)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -12))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -8))))
++     (set (match_operand:SI 5 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -4))))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 4"
++  "ldm%(db%)\t%1!, {%3, %4, %5}"
++  [(set_attr "type" "load3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm3_db"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk") (const_int -12)))
++          (match_operand:SI 2 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int -8)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int -4)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 3"
++  "stm%(db%)\t%1, {%2, %3, %4}"
++  [(set_attr "type" "store3")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm3_db_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int -12)))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -12)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -8)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -4)))
++          (match_operand:SI 5 "arm_hard_register_operand" ""))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 4"
++  "stm%(db%)\t%1!, {%3, %4, %5}"
++  [(set_attr "type" "store3")
++   (set_attr "predicable" "yes")])
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 3 "memory_operand" ""))
++   (set (match_operand:SI 1 "s_register_operand" "")
++        (match_operand:SI 4 "memory_operand" ""))
++   (set (match_operand:SI 2 "s_register_operand" "")
++        (match_operand:SI 5 "memory_operand" ""))]
++  ""
++  [(const_int 0)]
++{
++  if (gen_ldm_seq (operands, 3, false))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 3 "memory_operand" ""))
++   (parallel
++    [(set (match_operand:SI 1 "s_register_operand" "")
++          (match_operand:SI 4 "memory_operand" ""))
++     (set (match_operand:SI 2 "s_register_operand" "")
++          (match_operand:SI 5 "memory_operand" ""))])]
++  ""
++  [(const_int 0)]
++{
++  if (gen_ldm_seq (operands, 3, false))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 6 "const_int_operand" ""))
++   (set (match_operand:SI 3 "memory_operand" "")
++        (match_dup 0))
++   (set (match_operand:SI 1 "s_register_operand" "")
++        (match_operand:SI 7 "const_int_operand" ""))
++   (set (match_operand:SI 4 "memory_operand" "")
++        (match_dup 1))
++   (set (match_operand:SI 2 "s_register_operand" "")
++        (match_operand:SI 8 "const_int_operand" ""))
++   (set (match_operand:SI 5 "memory_operand" "")
++        (match_dup 2))]
++  ""
++  [(const_int 0)]
++{
++  if (gen_const_stm_seq (operands, 3))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 6 "const_int_operand" ""))
++   (set (match_operand:SI 1 "s_register_operand" "")
++        (match_operand:SI 7 "const_int_operand" ""))
++   (set (match_operand:SI 2 "s_register_operand" "")
++        (match_operand:SI 8 "const_int_operand" ""))
++   (set (match_operand:SI 3 "memory_operand" "")
++        (match_dup 0))
++   (set (match_operand:SI 4 "memory_operand" "")
++        (match_dup 1))
++   (set (match_operand:SI 5 "memory_operand" "")
++        (match_dup 2))]
++  ""
++  [(const_int 0)]
++{
++  if (gen_const_stm_seq (operands, 3))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 3 "memory_operand" "")
++        (match_operand:SI 0 "s_register_operand" ""))
++   (set (match_operand:SI 4 "memory_operand" "")
++        (match_operand:SI 1 "s_register_operand" ""))
++   (set (match_operand:SI 5 "memory_operand" "")
++        (match_operand:SI 2 "s_register_operand" ""))]
++  ""
++  [(const_int 0)]
++{
++  if (gen_stm_seq (operands, 3))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_insn "*ldm2_ia"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (match_operand:SI 1 "s_register_operand" "rk")))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 4))))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 2"
++  "ldm%(ia%)\t%1, {%2, %3}"
++  [(set_attr "type" "load2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*thumb_ldm2_ia"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (match_operand:SI 1 "s_register_operand" "l")))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 4))))])]
++  "TARGET_THUMB1 && XVECLEN (operands[0], 0) == 2"
++  "ldm%(ia%)\t%1, {%2, %3}"
++  [(set_attr "type" "load2")])
++
++(define_insn "*ldm2_ia_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 8)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (match_dup 2)))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 4))))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 3"
++  "ldm%(ia%)\t%1!, {%3, %4}"
++  [(set_attr "type" "load2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*thumb_ldm2_ia_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=l")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 8)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (match_dup 2)))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 4))))])]
++  "TARGET_THUMB1 && XVECLEN (operands[0], 0) == 3"
++  "ldm%(ia%)\t%1!, {%3, %4}"
++  [(set_attr "type" "load2")])
++
++(define_insn "*stm2_ia"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (mem:SI (match_operand:SI 1 "s_register_operand" "rk"))
++          (match_operand:SI 2 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int 4)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 2"
++  "stm%(ia%)\t%1, {%2, %3}"
++  [(set_attr "type" "store2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm2_ia_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 8)))
++     (set (mem:SI (match_dup 2))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 3"
++  "stm%(ia%)\t%1!, {%3, %4}"
++  [(set_attr "type" "store2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*thumb_stm2_ia_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=l")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 8)))
++     (set (mem:SI (match_dup 2))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))])]
++  "TARGET_THUMB1 && XVECLEN (operands[0], 0) == 3"
++  "stm%(ia%)\t%1!, {%3, %4}"
++  [(set_attr "type" "store2")])
++
++(define_insn "*ldm2_ib"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk")
++                  (const_int 4))))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int 8))))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 2"
++  "ldm%(ib%)\t%1, {%2, %3}"
++  [(set_attr "type" "load2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm2_ib_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 8)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 4))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int 8))))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 3"
++  "ldm%(ib%)\t%1!, {%3, %4}"
++  [(set_attr "type" "load2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm2_ib"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk") (const_int 4)))
++          (match_operand:SI 2 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int 8)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 2"
++  "stm%(ib%)\t%1, {%2, %3}"
++  [(set_attr "type" "store2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm2_ib_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int 8)))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 4)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int 8)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 3"
++  "stm%(ib%)\t%1!, {%3, %4}"
++  [(set_attr "type" "store2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm2_da"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk")
++                  (const_int -4))))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (match_dup 1)))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 2"
++  "ldm%(da%)\t%1, {%2, %3}"
++  [(set_attr "type" "load2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm2_da_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int -8)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -4))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (match_dup 2)))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 3"
++  "ldm%(da%)\t%1!, {%3, %4}"
++  [(set_attr "type" "load2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm2_da"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk") (const_int -4)))
++          (match_operand:SI 2 "arm_hard_register_operand" ""))
++     (set (mem:SI (match_dup 1))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 2"
++  "stm%(da%)\t%1, {%2, %3}"
++  [(set_attr "type" "store2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm2_da_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int -8)))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -4)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (match_dup 2))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))])]
++  "TARGET_ARM && XVECLEN (operands[0], 0) == 3"
++  "stm%(da%)\t%1!, {%3, %4}"
++  [(set_attr "type" "store2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm2_db"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 2 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk")
++                  (const_int -8))))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 1)
++                  (const_int -4))))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 2"
++  "ldm%(db%)\t%1, {%2, %3}"
++  [(set_attr "type" "load2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*ldm2_db_update"
++  [(match_parallel 0 "load_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int -8)))
++     (set (match_operand:SI 3 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -8))))
++     (set (match_operand:SI 4 "arm_hard_register_operand" "")
++          (mem:SI (plus:SI (match_dup 2)
++                  (const_int -4))))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 3"
++  "ldm%(db%)\t%1!, {%3, %4}"
++  [(set_attr "type" "load2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm2_db"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (mem:SI (plus:SI (match_operand:SI 1 "s_register_operand" "rk") (const_int -8)))
++          (match_operand:SI 2 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 1) (const_int -4)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 2"
++  "stm%(db%)\t%1, {%2, %3}"
++  [(set_attr "type" "store2")
++   (set_attr "predicable" "yes")])
++
++(define_insn "*stm2_db_update"
++  [(match_parallel 0 "store_multiple_operation"
++    [(set (match_operand:SI 1 "s_register_operand" "=rk")
++          (plus:SI (match_operand:SI 2 "s_register_operand" "1") (const_int -8)))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -8)))
++          (match_operand:SI 3 "arm_hard_register_operand" ""))
++     (set (mem:SI (plus:SI (match_dup 2) (const_int -4)))
++          (match_operand:SI 4 "arm_hard_register_operand" ""))])]
++  "TARGET_32BIT && XVECLEN (operands[0], 0) == 3"
++  "stm%(db%)\t%1!, {%3, %4}"
++  [(set_attr "type" "store2")
++   (set_attr "predicable" "yes")])
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 2 "memory_operand" ""))
++   (set (match_operand:SI 1 "s_register_operand" "")
++        (match_operand:SI 3 "memory_operand" ""))]
++  ""
++  [(const_int 0)]
++{
++  if (gen_ldm_seq (operands, 2, false))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 4 "const_int_operand" ""))
++   (set (match_operand:SI 2 "memory_operand" "")
++        (match_dup 0))
++   (set (match_operand:SI 1 "s_register_operand" "")
++        (match_operand:SI 5 "const_int_operand" ""))
++   (set (match_operand:SI 3 "memory_operand" "")
++        (match_dup 1))]
++  ""
++  [(const_int 0)]
++{
++  if (gen_const_stm_seq (operands, 2))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 4 "const_int_operand" ""))
++   (set (match_operand:SI 1 "s_register_operand" "")
++        (match_operand:SI 5 "const_int_operand" ""))
++   (set (match_operand:SI 2 "memory_operand" "")
++        (match_dup 0))
++   (set (match_operand:SI 3 "memory_operand" "")
++        (match_dup 1))]
++  ""
++  [(const_int 0)]
++{
++  if (gen_const_stm_seq (operands, 2))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 2 "memory_operand" "")
++        (match_operand:SI 0 "s_register_operand" ""))
++   (set (match_operand:SI 3 "memory_operand" "")
++        (match_operand:SI 1 "s_register_operand" ""))]
++  ""
++  [(const_int 0)]
++{
++  if (gen_stm_seq (operands, 2))
++    DONE;
++  else
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 2 "memory_operand" ""))
++   (set (match_operand:SI 1 "s_register_operand" "")
++        (match_operand:SI 3 "memory_operand" ""))
++   (parallel
++     [(set (match_operand:SI 4 "s_register_operand" "")
++           (match_operator:SI 5 "commutative_binary_operator"
++            [(match_operand:SI 6 "s_register_operand" "")
++             (match_operand:SI 7 "s_register_operand" "")]))
++      (clobber (reg:CC CC_REGNUM))])]
++  "(((operands[6] == operands[0] && operands[7] == operands[1])
++     || (operands[7] == operands[0] && operands[6] == operands[1]))
++    && peep2_reg_dead_p (3, operands[0]) && peep2_reg_dead_p (3, operands[1]))"
++  [(parallel
++    [(set (match_dup 4) (match_op_dup 5 [(match_dup 6) (match_dup 7)]))
++     (clobber (reg:CC CC_REGNUM))])]
++{
++  if (!gen_ldm_seq (operands, 2, true))
++    FAIL;
++})
++
++(define_peephole2
++  [(set (match_operand:SI 0 "s_register_operand" "")
++        (match_operand:SI 2 "memory_operand" ""))
++   (set (match_operand:SI 1 "s_register_operand" "")
++        (match_operand:SI 3 "memory_operand" ""))
++   (set (match_operand:SI 4 "s_register_operand" "")
++        (match_operator:SI 5 "commutative_binary_operator"
++         [(match_operand:SI 6 "s_register_operand" "")
++          (match_operand:SI 7 "s_register_operand" "")]))]
++  "(((operands[6] == operands[0] && operands[7] == operands[1])
++     || (operands[7] == operands[0] && operands[6] == operands[1]))
++    && peep2_reg_dead_p (3, operands[0]) && peep2_reg_dead_p (3, operands[1]))"
++  [(set (match_dup 4) (match_op_dup 5 [(match_dup 6) (match_dup 7)]))]
++{
++  if (!gen_ldm_seq (operands, 2, true))
++    FAIL;
++})
++
+
+=== modified file 'gcc/config/arm/predicates.md'
+--- old/gcc/config/arm/predicates.md	2010-11-04 10:45:05 +0000
++++ new/gcc/config/arm/predicates.md	2010-11-16 12:32:34 +0000
+@@ -211,6 +211,11 @@
+   (and (match_code "ior,xor,and")
+        (match_test "mode == GET_MODE (op)")))
+ 
++;; True for commutative operators
++(define_special_predicate "commutative_binary_operator"
++  (and (match_code "ior,xor,and,plus")
++       (match_test "mode == GET_MODE (op)")))
++
+ ;; True for shift operators.
+ (define_special_predicate "shift_operator"
+   (and (ior (ior (and (match_code "mult")
+@@ -334,16 +339,20 @@
+   (match_code "parallel")
+ {
+   HOST_WIDE_INT count = XVECLEN (op, 0);
+-  int dest_regno;
++  unsigned dest_regno;
+   rtx src_addr;
+   HOST_WIDE_INT i = 1, base = 0;
++  HOST_WIDE_INT offset = 0;
+   rtx elt;
++  bool addr_reg_loaded = false;
++  bool update = false;
+ 
+   if (low_irq_latency)
+     return false;
+ 
+   if (count <= 1
+-      || GET_CODE (XVECEXP (op, 0, 0)) != SET)
++      || GET_CODE (XVECEXP (op, 0, 0)) != SET
++      || !REG_P (SET_DEST (XVECEXP (op, 0, 0))))
+     return false;
+ 
+   /* Check to see if this might be a write-back.  */
+@@ -351,6 +360,7 @@
+     {
+       i++;
+       base = 1;
++      update = true;
+ 
+       /* Now check it more carefully.  */
+       if (GET_CODE (SET_DEST (elt)) != REG
+@@ -369,6 +379,15 @@
+ 
+   dest_regno = REGNO (SET_DEST (XVECEXP (op, 0, i - 1)));
+   src_addr = XEXP (SET_SRC (XVECEXP (op, 0, i - 1)), 0);
++  if (GET_CODE (src_addr) == PLUS)
++    {
++      if (GET_CODE (XEXP (src_addr, 1)) != CONST_INT)
++	return false;
++      offset = INTVAL (XEXP (src_addr, 1));
++      src_addr = XEXP (src_addr, 0);
++    }
++  if (!REG_P (src_addr))
++    return false;
+ 
+   for (; i < count; i++)
+     {
+@@ -377,16 +396,28 @@
+       if (GET_CODE (elt) != SET
+           || GET_CODE (SET_DEST (elt)) != REG
+           || GET_MODE (SET_DEST (elt)) != SImode
+-          || REGNO (SET_DEST (elt)) != (unsigned int)(dest_regno + i - base)
++          || REGNO (SET_DEST (elt)) <= dest_regno
+           || GET_CODE (SET_SRC (elt)) != MEM
+           || GET_MODE (SET_SRC (elt)) != SImode
+-          || GET_CODE (XEXP (SET_SRC (elt), 0)) != PLUS
+-          || !rtx_equal_p (XEXP (XEXP (SET_SRC (elt), 0), 0), src_addr)
+-          || GET_CODE (XEXP (XEXP (SET_SRC (elt), 0), 1)) != CONST_INT
+-          || INTVAL (XEXP (XEXP (SET_SRC (elt), 0), 1)) != (i - base) * 4)
++          || ((GET_CODE (XEXP (SET_SRC (elt), 0)) != PLUS
++	       || !rtx_equal_p (XEXP (XEXP (SET_SRC (elt), 0), 0), src_addr)
++	       || GET_CODE (XEXP (XEXP (SET_SRC (elt), 0), 1)) != CONST_INT
++	       || INTVAL (XEXP (XEXP (SET_SRC (elt), 0), 1)) != offset + (i - base) * 4)
++	      && (!REG_P (XEXP (SET_SRC (elt), 0))
++		  || offset + (i - base) * 4 != 0)))
+         return false;
++      dest_regno = REGNO (SET_DEST (elt));
++      if (dest_regno == REGNO (src_addr))
++        addr_reg_loaded = true;
+     }
+-
++  /* For Thumb, we only have updating instructions.  If the pattern does
++     not describe an update, it must be because the address register is
++     in the list of loaded registers - on the hardware, this has the effect
++     of overriding the update.  */
++  if (update && addr_reg_loaded)
++    return false;
++  if (TARGET_THUMB1)
++    return update || addr_reg_loaded;
+   return true;
+ })
+ 
+@@ -394,9 +425,9 @@
+   (match_code "parallel")
+ {
+   HOST_WIDE_INT count = XVECLEN (op, 0);
+-  int src_regno;
++  unsigned src_regno;
+   rtx dest_addr;
+-  HOST_WIDE_INT i = 1, base = 0;
++  HOST_WIDE_INT i = 1, base = 0, offset = 0;
+   rtx elt;
+ 
+   if (low_irq_latency)
+@@ -430,6 +461,16 @@
+   src_regno = REGNO (SET_SRC (XVECEXP (op, 0, i - 1)));
+   dest_addr = XEXP (SET_DEST (XVECEXP (op, 0, i - 1)), 0);
+ 
++  if (GET_CODE (dest_addr) == PLUS)
++    {
++      if (GET_CODE (XEXP (dest_addr, 1)) != CONST_INT)
++	return false;
++      offset = INTVAL (XEXP (dest_addr, 1));
++      dest_addr = XEXP (dest_addr, 0);
++    }
++  if (!REG_P (dest_addr))
++    return false;
++
+   for (; i < count; i++)
+     {
+       elt = XVECEXP (op, 0, i);
+@@ -437,14 +478,17 @@
+       if (GET_CODE (elt) != SET
+           || GET_CODE (SET_SRC (elt)) != REG
+           || GET_MODE (SET_SRC (elt)) != SImode
+-          || REGNO (SET_SRC (elt)) != (unsigned int)(src_regno + i - base)
++          || REGNO (SET_SRC (elt)) <= src_regno
+           || GET_CODE (SET_DEST (elt)) != MEM
+           || GET_MODE (SET_DEST (elt)) != SImode
+-          || GET_CODE (XEXP (SET_DEST (elt), 0)) != PLUS
+-          || !rtx_equal_p (XEXP (XEXP (SET_DEST (elt), 0), 0), dest_addr)
+-          || GET_CODE (XEXP (XEXP (SET_DEST (elt), 0), 1)) != CONST_INT
+-          || INTVAL (XEXP (XEXP (SET_DEST (elt), 0), 1)) != (i - base) * 4)
++          || ((GET_CODE (XEXP (SET_DEST (elt), 0)) != PLUS
++	       || !rtx_equal_p (XEXP (XEXP (SET_DEST (elt), 0), 0), dest_addr)
++	       || GET_CODE (XEXP (XEXP (SET_DEST (elt), 0), 1)) != CONST_INT
++               || INTVAL (XEXP (XEXP (SET_DEST (elt), 0), 1)) != offset + (i - base) * 4)
++	      && (!REG_P (XEXP (SET_DEST (elt), 0))
++		  || offset + (i - base) * 4 != 0)))
+         return false;
++      src_regno = REGNO (SET_SRC (elt));
+     }
+ 
+   return true;
+
+=== modified file 'gcc/config/i386/i386.md'
+--- old/gcc/config/i386/i386.md	2011-01-05 12:12:18 +0000
++++ new/gcc/config/i386/i386.md	2011-01-05 18:20:37 +0000
+@@ -20023,15 +20023,14 @@
+ ;;  leal    (%edx,%eax,4), %eax
+ 
+ (define_peephole2
+-  [(parallel [(set (match_operand 0 "register_operand" "")
++  [(match_scratch:SI 5 "r")
++   (parallel [(set (match_operand 0 "register_operand" "")
+ 		   (ashift (match_operand 1 "register_operand" "")
+ 			   (match_operand 2 "const_int_operand" "")))
+ 	       (clobber (reg:CC FLAGS_REG))])
+-   (set (match_operand 3 "register_operand")
+-        (match_operand 4 "x86_64_general_operand" ""))
+-   (parallel [(set (match_operand 5 "register_operand" "")
+-		   (plus (match_operand 6 "register_operand" "")
+-			 (match_operand 7 "register_operand" "")))
++   (parallel [(set (match_operand 3 "register_operand" "")
++		   (plus (match_dup 0)
++			 (match_operand 4 "x86_64_general_operand" "")))
+ 		   (clobber (reg:CC FLAGS_REG))])]
+   "INTVAL (operands[2]) >= 0 && INTVAL (operands[2]) <= 3
+    /* Validate MODE for lea.  */
+@@ -20041,30 +20040,21 @@
+        || GET_MODE (operands[0]) == SImode
+        || (TARGET_64BIT && GET_MODE (operands[0]) == DImode))
+    /* We reorder load and the shift.  */
+-   && !rtx_equal_p (operands[1], operands[3])
+-   && !reg_overlap_mentioned_p (operands[0], operands[4])
+-   /* Last PLUS must consist of operand 0 and 3.  */
+-   && !rtx_equal_p (operands[0], operands[3])
+-   && (rtx_equal_p (operands[3], operands[6])
+-       || rtx_equal_p (operands[3], operands[7]))
+-   && (rtx_equal_p (operands[0], operands[6])
+-       || rtx_equal_p (operands[0], operands[7]))
+-   /* The intermediate operand 0 must die or be same as output.  */
+-   && (rtx_equal_p (operands[0], operands[5])
+-       || peep2_reg_dead_p (3, operands[0]))"
+-  [(set (match_dup 3) (match_dup 4))
++   && !reg_overlap_mentioned_p (operands[0], operands[4])"
++  [(set (match_dup 5) (match_dup 4))
+    (set (match_dup 0) (match_dup 1))]
+ {
+-  enum machine_mode mode = GET_MODE (operands[5]) == DImode ? DImode : SImode;
++  enum machine_mode mode = GET_MODE (operands[1]) == DImode ? DImode : SImode;
+   int scale = 1 << INTVAL (operands[2]);
+   rtx index = gen_lowpart (Pmode, operands[1]);
+-  rtx base = gen_lowpart (Pmode, operands[3]);
+-  rtx dest = gen_lowpart (mode, operands[5]);
++  rtx base = gen_lowpart (Pmode, operands[5]);
++  rtx dest = gen_lowpart (mode, operands[3]);
+ 
+   operands[1] = gen_rtx_PLUS (Pmode, base,
+   			      gen_rtx_MULT (Pmode, index, GEN_INT (scale)));
+   if (mode != Pmode)
+     operands[1] = gen_rtx_SUBREG (mode, operands[1], 0);
++  operands[5] = base;
+   operands[0] = dest;
+ })
+ 
+
+=== modified file 'gcc/df-problems.c'
+--- old/gcc/df-problems.c	2010-11-16 22:17:17 +0000
++++ new/gcc/df-problems.c	2010-12-02 13:42:47 +0000
+@@ -3748,9 +3748,22 @@
+   for (def_rec = DF_INSN_UID_DEFS (uid); *def_rec; def_rec++)
+     {
+       df_ref def = *def_rec;
+-      /* If the def is to only part of the reg, it does
+-	 not kill the other defs that reach here.  */
+-      if (!(DF_REF_FLAGS (def) & (DF_REF_PARTIAL | DF_REF_CONDITIONAL)))
++      bitmap_set_bit (defs, DF_REF_REGNO (def));
++    }
++}
++
++/* Find the set of real DEFs, which are not clobbers, for INSN.  */
++
++void
++df_simulate_find_noclobber_defs (rtx insn, bitmap defs)
++{
++  df_ref *def_rec;
++  unsigned int uid = INSN_UID (insn);
++
++  for (def_rec = DF_INSN_UID_DEFS (uid); *def_rec; def_rec++)
++    {
++      df_ref def = *def_rec;
++      if (!(DF_REF_FLAGS (def) & (DF_REF_MUST_CLOBBER | DF_REF_MAY_CLOBBER)))
+ 	bitmap_set_bit (defs, DF_REF_REGNO (def));
+     }
+ }
+@@ -3921,7 +3934,7 @@
+     {
+       df_ref def = *def_rec;
+       if (DF_REF_FLAGS (def) & DF_REF_AT_TOP)
+-	bitmap_clear_bit (live, DF_REF_REGNO (def));
++	bitmap_set_bit (live, DF_REF_REGNO (def));
+     }
+ }
+ 
+@@ -3942,7 +3955,7 @@
+      while here the scan is performed forwards!  So, first assume that the
+      def is live, and if this is not true REG_UNUSED notes will rectify the
+      situation.  */
+-  df_simulate_find_defs (insn, live);
++  df_simulate_find_noclobber_defs (insn, live);
+ 
+   /* Clear all of the registers that go dead.  */
+   for (link = REG_NOTES (insn); link; link = XEXP (link, 1))
+
+=== modified file 'gcc/df.h'
+--- old/gcc/df.h	2010-01-29 12:14:47 +0000
++++ new/gcc/df.h	2010-12-02 13:42:47 +0000
+@@ -978,6 +978,7 @@
+ extern void df_md_add_problem (void);
+ extern void df_md_simulate_artificial_defs_at_top (basic_block, bitmap);
+ extern void df_md_simulate_one_insn (basic_block, rtx, bitmap);
++extern void df_simulate_find_noclobber_defs (rtx, bitmap);
+ extern void df_simulate_find_defs (rtx, bitmap);
+ extern void df_simulate_defs (rtx, bitmap);
+ extern void df_simulate_uses (rtx, bitmap);
+
+=== modified file 'gcc/fwprop.c'
+--- old/gcc/fwprop.c	2010-04-02 18:54:46 +0000
++++ new/gcc/fwprop.c	2010-11-16 12:32:34 +0000
+@@ -228,7 +228,10 @@
+ 
+   process_uses (df_get_artificial_uses (bb_index), DF_REF_AT_TOP);
+   process_defs (df_get_artificial_defs (bb_index), DF_REF_AT_TOP);
+-  df_simulate_initialize_forwards (bb, local_lr);
++
++  /* We don't call df_simulate_initialize_forwards, as it may overestimate
++     the live registers if there are unused artificial defs.  We prefer
++     liveness to be underestimated.  */
+ 
+   FOR_BB_INSNS (bb, insn)
+     if (INSN_P (insn))
+
+=== modified file 'gcc/genoutput.c'
+--- old/gcc/genoutput.c	2009-04-08 14:00:34 +0000
++++ new/gcc/genoutput.c	2010-11-16 12:32:34 +0000
+@@ -266,6 +266,8 @@
+ 
+       printf ("    %d,\n", d->strict_low);
+ 
++      printf ("    %d,\n", d->constraint == NULL ? 1 : 0);
++
+       printf ("    %d\n", d->eliminable);
+ 
+       printf("  },\n");
+
+=== modified file 'gcc/genrecog.c'
+--- old/gcc/genrecog.c	2009-06-22 09:29:13 +0000
++++ new/gcc/genrecog.c	2010-11-16 12:32:34 +0000
+@@ -1782,20 +1782,11 @@
+   int odepth = strlen (oldpos);
+   int ndepth = strlen (newpos);
+   int depth;
+-  int old_has_insn, new_has_insn;
+ 
+   /* Pop up as many levels as necessary.  */
+   for (depth = odepth; strncmp (oldpos, newpos, depth) != 0; --depth)
+     continue;
+ 
+-  /* Hunt for the last [A-Z] in both strings.  */
+-  for (old_has_insn = odepth - 1; old_has_insn >= 0; --old_has_insn)
+-    if (ISUPPER (oldpos[old_has_insn]))
+-      break;
+-  for (new_has_insn = ndepth - 1; new_has_insn >= 0; --new_has_insn)
+-    if (ISUPPER (newpos[new_has_insn]))
+-      break;
+-
+   /* Go down to desired level.  */
+   while (depth < ndepth)
+     {
+
+=== modified file 'gcc/ifcvt.c'
+--- old/gcc/ifcvt.c	2011-01-05 12:12:18 +0000
++++ new/gcc/ifcvt.c	2011-01-05 18:20:37 +0000
+@@ -4011,6 +4011,7 @@
+   basic_block new_dest = dest_edge->dest;
+   rtx head, end, jump, earliest = NULL_RTX, old_dest;
+   bitmap merge_set = NULL;
++  bitmap merge_set_noclobber  = NULL;
+   /* Number of pending changes.  */
+   int n_validated_changes = 0;
+   rtx new_dest_label;
+@@ -4169,6 +4170,7 @@
+ 		       end of the block.  */
+ 
+       merge_set = BITMAP_ALLOC (&reg_obstack);
++      merge_set_noclobber = BITMAP_ALLOC (&reg_obstack);
+ 
+       /* If we allocated new pseudos (e.g. in the conditional move
+ 	 expander called from noce_emit_cmove), we must resize the
+@@ -4187,6 +4189,7 @@
+ 		  df_ref def = *def_rec;
+ 		  bitmap_set_bit (merge_set, DF_REF_REGNO (def));
+ 		}
++              df_simulate_find_noclobber_defs (insn, merge_set_noclobber);
+ 	    }
+ 	}
+ 
+@@ -4197,7 +4200,7 @@
+ 	  unsigned i;
+ 	  bitmap_iterator bi;
+ 
+-          EXECUTE_IF_SET_IN_BITMAP (merge_set, 0, i, bi)
++          EXECUTE_IF_SET_IN_BITMAP (merge_set_noclobber, 0, i, bi)
+ 	    {
+ 	      if (i < FIRST_PSEUDO_REGISTER
+ 		  && ! fixed_regs[i]
+@@ -4233,7 +4236,7 @@
+ 	   TEST_SET & DF_LIVE_IN (merge_bb)
+ 	 are empty.  */
+ 
+-      if (bitmap_intersect_p (merge_set, test_set)
++      if (bitmap_intersect_p (merge_set_noclobber, test_set)
+ 	  || bitmap_intersect_p (merge_set, test_live)
+ 	  || bitmap_intersect_p (test_set, df_get_live_in (merge_bb)))
+ 	intersect = true;
+@@ -4320,6 +4323,7 @@
+ 	    remove_reg_equal_equiv_notes_for_regno (i);
+ 
+ 	  BITMAP_FREE (merge_set);
++          BITMAP_FREE (merge_set_noclobber);
+ 	}
+ 
+       reorder_insns (head, end, PREV_INSN (earliest));
+@@ -4340,7 +4344,10 @@
+   cancel_changes (0);
+  fail:
+   if (merge_set)
+-    BITMAP_FREE (merge_set);
++    {
++      BITMAP_FREE (merge_set);
++      BITMAP_FREE (merge_set_noclobber);
++    }
+   return FALSE;
+ }
+ 
+
+=== modified file 'gcc/recog.c'
+--- old/gcc/recog.c	2010-08-05 15:28:47 +0000
++++ new/gcc/recog.c	2010-11-16 12:32:34 +0000
+@@ -2082,6 +2082,7 @@
+ 			       recog_data.operand_loc,
+ 			       recog_data.constraints,
+ 			       recog_data.operand_mode, NULL);
++	  memset (recog_data.is_operator, 0, sizeof recog_data.is_operator);
+ 	  if (noperands > 0)
+ 	    {
+ 	      const char *p =  recog_data.constraints[0];
+@@ -2111,6 +2112,7 @@
+       for (i = 0; i < noperands; i++)
+ 	{
+ 	  recog_data.constraints[i] = insn_data[icode].operand[i].constraint;
++	  recog_data.is_operator[i] = insn_data[icode].operand[i].is_operator;
+ 	  recog_data.operand_mode[i] = insn_data[icode].operand[i].mode;
+ 	  /* VOIDmode match_operands gets mode from their real operand.  */
+ 	  if (recog_data.operand_mode[i] == VOIDmode)
+@@ -2909,6 +2911,10 @@
+ 
+ static struct peep2_insn_data peep2_insn_data[MAX_INSNS_PER_PEEP2 + 1];
+ static int peep2_current;
++
++static bool peep2_do_rebuild_jump_labels;
++static bool peep2_do_cleanup_cfg;
++
+ /* The number of instructions available to match a peep2.  */
+ int peep2_current_count;
+ 
+@@ -2917,6 +2923,16 @@
+    DF_LIVE_OUT for the block.  */
+ #define PEEP2_EOB	pc_rtx
+ 
++/* Wrap N to fit into the peep2_insn_data buffer.  */
++
++static int
++peep2_buf_position (int n)
++{
++  if (n >= MAX_INSNS_PER_PEEP2 + 1)
++    n -= MAX_INSNS_PER_PEEP2 + 1;
++  return n;
++}
++
+ /* Return the Nth non-note insn after `current', or return NULL_RTX if it
+    does not exist.  Used by the recognizer to find the next insn to match
+    in a multi-insn pattern.  */
+@@ -2926,9 +2942,7 @@
+ {
+   gcc_assert (n <= peep2_current_count);
+ 
+-  n += peep2_current;
+-  if (n >= MAX_INSNS_PER_PEEP2 + 1)
+-    n -= MAX_INSNS_PER_PEEP2 + 1;
++  n = peep2_buf_position (peep2_current + n);
+ 
+   return peep2_insn_data[n].insn;
+ }
+@@ -2941,9 +2955,7 @@
+ {
+   gcc_assert (ofs < MAX_INSNS_PER_PEEP2 + 1);
+ 
+-  ofs += peep2_current;
+-  if (ofs >= MAX_INSNS_PER_PEEP2 + 1)
+-    ofs -= MAX_INSNS_PER_PEEP2 + 1;
++  ofs = peep2_buf_position (peep2_current + ofs);
+ 
+   gcc_assert (peep2_insn_data[ofs].insn != NULL_RTX);
+ 
+@@ -2959,9 +2971,7 @@
+ 
+   gcc_assert (ofs < MAX_INSNS_PER_PEEP2 + 1);
+ 
+-  ofs += peep2_current;
+-  if (ofs >= MAX_INSNS_PER_PEEP2 + 1)
+-    ofs -= MAX_INSNS_PER_PEEP2 + 1;
++  ofs = peep2_buf_position (peep2_current + ofs);
+ 
+   gcc_assert (peep2_insn_data[ofs].insn != NULL_RTX);
+ 
+@@ -2996,12 +3006,8 @@
+   gcc_assert (from < MAX_INSNS_PER_PEEP2 + 1);
+   gcc_assert (to < MAX_INSNS_PER_PEEP2 + 1);
+ 
+-  from += peep2_current;
+-  if (from >= MAX_INSNS_PER_PEEP2 + 1)
+-    from -= MAX_INSNS_PER_PEEP2 + 1;
+-  to += peep2_current;
+-  if (to >= MAX_INSNS_PER_PEEP2 + 1)
+-    to -= MAX_INSNS_PER_PEEP2 + 1;
++  from = peep2_buf_position (peep2_current + from);
++  to = peep2_buf_position (peep2_current + to);
+ 
+   gcc_assert (peep2_insn_data[from].insn != NULL_RTX);
+   REG_SET_TO_HARD_REG_SET (live, peep2_insn_data[from].live_before);
+@@ -3010,8 +3016,7 @@
+     {
+       HARD_REG_SET this_live;
+ 
+-      if (++from >= MAX_INSNS_PER_PEEP2 + 1)
+-	from = 0;
++      from = peep2_buf_position (from + 1);
+       gcc_assert (peep2_insn_data[from].insn != NULL_RTX);
+       REG_SET_TO_HARD_REG_SET (this_live, peep2_insn_data[from].live_before);
+       IOR_HARD_REG_SET (live, this_live);
+@@ -3104,19 +3109,234 @@
+   COPY_REG_SET (peep2_insn_data[MAX_INSNS_PER_PEEP2].live_before, live);
+ }
+ 
++/* While scanning basic block BB, we found a match of length MATCH_LEN,
++   starting at INSN.  Perform the replacement, removing the old insns and
++   replacing them with ATTEMPT.  Returns the last insn emitted.  */
++
++static rtx
++peep2_attempt (basic_block bb, rtx insn, int match_len, rtx attempt)
++{
++  int i;
++  rtx last, note, before_try, x;
++  bool was_call = false;
++
++  /* If we are splitting a CALL_INSN, look for the CALL_INSN
++     in SEQ and copy our CALL_INSN_FUNCTION_USAGE and other
++     cfg-related call notes.  */
++  for (i = 0; i <= match_len; ++i)
++    {
++      int j;
++      rtx old_insn, new_insn, note;
++
++      j = peep2_buf_position (peep2_current + i);
++      old_insn = peep2_insn_data[j].insn;
++      if (!CALL_P (old_insn))
++	continue;
++      was_call = true;
++
++      new_insn = attempt;
++      while (new_insn != NULL_RTX)
++	{
++	  if (CALL_P (new_insn))
++	    break;
++	  new_insn = NEXT_INSN (new_insn);
++	}
++
++      gcc_assert (new_insn != NULL_RTX);
++
++      CALL_INSN_FUNCTION_USAGE (new_insn)
++	= CALL_INSN_FUNCTION_USAGE (old_insn);
++
++      for (note = REG_NOTES (old_insn);
++	   note;
++	   note = XEXP (note, 1))
++	switch (REG_NOTE_KIND (note))
++	  {
++	  case REG_NORETURN:
++	  case REG_SETJMP:
++	    add_reg_note (new_insn, REG_NOTE_KIND (note),
++			  XEXP (note, 0));
++	    break;
++	  default:
++	    /* Discard all other reg notes.  */
++	    break;
++	  }
++
++      /* Croak if there is another call in the sequence.  */
++      while (++i <= match_len)
++	{
++	  j = peep2_buf_position (peep2_current + i);
++	  old_insn = peep2_insn_data[j].insn;
++	  gcc_assert (!CALL_P (old_insn));
++	}
++      break;
++    }
++
++  i = peep2_buf_position (peep2_current + match_len);
++
++  note = find_reg_note (peep2_insn_data[i].insn, REG_EH_REGION, NULL_RTX);
++
++  /* Replace the old sequence with the new.  */
++  last = emit_insn_after_setloc (attempt,
++				 peep2_insn_data[i].insn,
++				 INSN_LOCATOR (peep2_insn_data[i].insn));
++  before_try = PREV_INSN (insn);
++  delete_insn_chain (insn, peep2_insn_data[i].insn, false);
++
++  /* Re-insert the EH_REGION notes.  */
++  if (note || (was_call && nonlocal_goto_handler_labels))
++    {
++      edge eh_edge;
++      edge_iterator ei;
++
++      FOR_EACH_EDGE (eh_edge, ei, bb->succs)
++	if (eh_edge->flags & (EDGE_EH | EDGE_ABNORMAL_CALL))
++	  break;
++
++      if (note)
++	copy_reg_eh_region_note_backward (note, last, before_try);
++
++      if (eh_edge)
++	for (x = last; x != before_try; x = PREV_INSN (x))
++	  if (x != BB_END (bb)
++	      && (can_throw_internal (x)
++		  || can_nonlocal_goto (x)))
++	    {
++	      edge nfte, nehe;
++	      int flags;
++
++	      nfte = split_block (bb, x);
++	      flags = (eh_edge->flags
++		       & (EDGE_EH | EDGE_ABNORMAL));
++	      if (CALL_P (x))
++		flags |= EDGE_ABNORMAL_CALL;
++	      nehe = make_edge (nfte->src, eh_edge->dest,
++				flags);
++
++	      nehe->probability = eh_edge->probability;
++	      nfte->probability
++		= REG_BR_PROB_BASE - nehe->probability;
++
++	      peep2_do_cleanup_cfg |= purge_dead_edges (nfte->dest);
++	      bb = nfte->src;
++	      eh_edge = nehe;
++	    }
++
++      /* Converting possibly trapping insn to non-trapping is
++	 possible.  Zap dummy outgoing edges.  */
++      peep2_do_cleanup_cfg |= purge_dead_edges (bb);
++    }
++
++  /* If we generated a jump instruction, it won't have
++     JUMP_LABEL set.  Recompute after we're done.  */
++  for (x = last; x != before_try; x = PREV_INSN (x))
++    if (JUMP_P (x))
++      {
++	peep2_do_rebuild_jump_labels = true;
++	break;
++      }
++
++  return last;
++}
++
++/* After performing a replacement in basic block BB, fix up the life
++   information in our buffer.  LAST is the last of the insns that we
++   emitted as a replacement.  PREV is the insn before the start of
++   the replacement.  MATCH_LEN is the number of instructions that were
++   matched, and which now need to be replaced in the buffer.  */
++
++static void
++peep2_update_life (basic_block bb, int match_len, rtx last, rtx prev)
++{
++  int i = peep2_buf_position (peep2_current + match_len + 1);
++  rtx x;
++  regset_head live;
++
++  INIT_REG_SET (&live);
++  COPY_REG_SET (&live, peep2_insn_data[i].live_before);
++
++  gcc_assert (peep2_current_count >= match_len + 1);
++  peep2_current_count -= match_len + 1;
++
++  x = last;
++  do
++    {
++      if (INSN_P (x))
++	{
++	  df_insn_rescan (x);
++	  if (peep2_current_count < MAX_INSNS_PER_PEEP2)
++	    {
++	      peep2_current_count++;
++	      if (--i < 0)
++		i = MAX_INSNS_PER_PEEP2;
++	      peep2_insn_data[i].insn = x;
++	      df_simulate_one_insn_backwards (bb, x, &live);
++	      COPY_REG_SET (peep2_insn_data[i].live_before, &live);
++	    }
++	}
++      x = PREV_INSN (x);
++    }
++  while (x != prev);
++  CLEAR_REG_SET (&live);
++
++  peep2_current = i;
++}
++
++/* Add INSN, which is in BB, at the end of the peep2 insn buffer if possible.
++   Return true if we added it, false otherwise.  The caller will try to match
++   peepholes against the buffer if we return false; otherwise it will try to
++   add more instructions to the buffer.  */
++
++static bool
++peep2_fill_buffer (basic_block bb, rtx insn, regset live)
++{
++  int pos;
++
++  /* Once we have filled the maximum number of insns the buffer can hold,
++     allow the caller to match the insns against peepholes.  We wait until
++     the buffer is full in case the target has similar peepholes of different
++     length; we always want to match the longest if possible.  */
++  if (peep2_current_count == MAX_INSNS_PER_PEEP2)
++    return false;
++
++  /* If an insn has RTX_FRAME_RELATED_P set, peephole substitution would lose
++     the REG_FRAME_RELATED_EXPR that is attached.  */
++  if (RTX_FRAME_RELATED_P (insn))
++    {
++      /* Let the buffer drain first.  */
++      if (peep2_current_count > 0)
++	return false;
++      /* Step over the insn then return true without adding the insn
++	 to the buffer; this will cause us to process the next
++	 insn.  */
++      df_simulate_one_insn_forwards (bb, insn, live);
++      return true;
++    }
++
++  pos = peep2_buf_position (peep2_current + peep2_current_count);
++  peep2_insn_data[pos].insn = insn;
++  COPY_REG_SET (peep2_insn_data[pos].live_before, live);
++  peep2_current_count++;
++
++  df_simulate_one_insn_forwards (bb, insn, live);
++  return true;
++}
++
+ /* Perform the peephole2 optimization pass.  */
+ 
+ static void
+ peephole2_optimize (void)
+ {
+-  rtx insn, prev;
++  rtx insn;
+   bitmap live;
+   int i;
+   basic_block bb;
+-  bool do_cleanup_cfg = false;
+-  bool do_rebuild_jump_labels = false;
++
++  peep2_do_cleanup_cfg = false;
++  peep2_do_rebuild_jump_labels = false;
+ 
+   df_set_flags (DF_LR_RUN_DCE);
++  df_note_add_problem ();
+   df_analyze ();
+ 
+   /* Initialize the regsets we're going to use.  */
+@@ -3126,214 +3346,59 @@
+ 
+   FOR_EACH_BB_REVERSE (bb)
+     {
++      bool past_end = false;
++      int pos;
++
+       rtl_profile_for_bb (bb);
+ 
+       /* Start up propagation.  */
+-      bitmap_copy (live, DF_LR_OUT (bb));
+-      df_simulate_initialize_backwards (bb, live);
++      bitmap_copy (live, DF_LR_IN (bb));
++      df_simulate_initialize_forwards (bb, live);
+       peep2_reinit_state (live);
+ 
+-      for (insn = BB_END (bb); ; insn = prev)
++      insn = BB_HEAD (bb);
++      for (;;)
+ 	{
+-	  prev = PREV_INSN (insn);
+-	  if (NONDEBUG_INSN_P (insn))
++	  rtx attempt, head;
++	  int match_len;
++
++	  if (!past_end && !NONDEBUG_INSN_P (insn))
+ 	    {
+-	      rtx attempt, before_try, x;
+-	      int match_len;
+-	      rtx note;
+-	      bool was_call = false;
+-
+-	      /* Record this insn.  */
+-	      if (--peep2_current < 0)
+-		peep2_current = MAX_INSNS_PER_PEEP2;
+-	      if (peep2_current_count < MAX_INSNS_PER_PEEP2
+-		  && peep2_insn_data[peep2_current].insn == NULL_RTX)
+-		peep2_current_count++;
+-	      peep2_insn_data[peep2_current].insn = insn;
+-	      df_simulate_one_insn_backwards (bb, insn, live);
+-	      COPY_REG_SET (peep2_insn_data[peep2_current].live_before, live);
+-
+-	      if (RTX_FRAME_RELATED_P (insn))
+-		{
+-		  /* If an insn has RTX_FRAME_RELATED_P set, peephole
+-		     substitution would lose the
+-		     REG_FRAME_RELATED_EXPR that is attached.  */
+-		  peep2_reinit_state (live);
+-		  attempt = NULL;
+-		}
+-	      else
+-		/* Match the peephole.  */
+-		attempt = peephole2_insns (PATTERN (insn), insn, &match_len);
+-
+-	      if (attempt != NULL)
+-		{
+-		  /* If we are splitting a CALL_INSN, look for the CALL_INSN
+-		     in SEQ and copy our CALL_INSN_FUNCTION_USAGE and other
+-		     cfg-related call notes.  */
+-		  for (i = 0; i <= match_len; ++i)
+-		    {
+-		      int j;
+-		      rtx old_insn, new_insn, note;
+-
+-		      j = i + peep2_current;
+-		      if (j >= MAX_INSNS_PER_PEEP2 + 1)
+-			j -= MAX_INSNS_PER_PEEP2 + 1;
+-		      old_insn = peep2_insn_data[j].insn;
+-		      if (!CALL_P (old_insn))
+-			continue;
+-		      was_call = true;
+-
+-		      new_insn = attempt;
+-		      while (new_insn != NULL_RTX)
+-			{
+-			  if (CALL_P (new_insn))
+-			    break;
+-			  new_insn = NEXT_INSN (new_insn);
+-			}
+-
+-		      gcc_assert (new_insn != NULL_RTX);
+-
+-		      CALL_INSN_FUNCTION_USAGE (new_insn)
+-			= CALL_INSN_FUNCTION_USAGE (old_insn);
+-
+-		      for (note = REG_NOTES (old_insn);
+-			   note;
+-			   note = XEXP (note, 1))
+-			switch (REG_NOTE_KIND (note))
+-			  {
+-			  case REG_NORETURN:
+-			  case REG_SETJMP:
+-			    add_reg_note (new_insn, REG_NOTE_KIND (note),
+-					  XEXP (note, 0));
+-			    break;
+-			  default:
+-			    /* Discard all other reg notes.  */
+-			    break;
+-			  }
+-
+-		      /* Croak if there is another call in the sequence.  */
+-		      while (++i <= match_len)
+-			{
+-			  j = i + peep2_current;
+-			  if (j >= MAX_INSNS_PER_PEEP2 + 1)
+-			    j -= MAX_INSNS_PER_PEEP2 + 1;
+-			  old_insn = peep2_insn_data[j].insn;
+-			  gcc_assert (!CALL_P (old_insn));
+-			}
+-		      break;
+-		    }
+-
+-		  i = match_len + peep2_current;
+-		  if (i >= MAX_INSNS_PER_PEEP2 + 1)
+-		    i -= MAX_INSNS_PER_PEEP2 + 1;
+-
+-		  note = find_reg_note (peep2_insn_data[i].insn,
+-					REG_EH_REGION, NULL_RTX);
+-
+-		  /* Replace the old sequence with the new.  */
+-		  attempt = emit_insn_after_setloc (attempt,
+-						    peep2_insn_data[i].insn,
+-				       INSN_LOCATOR (peep2_insn_data[i].insn));
+-		  before_try = PREV_INSN (insn);
+-		  delete_insn_chain (insn, peep2_insn_data[i].insn, false);
+-
+-		  /* Re-insert the EH_REGION notes.  */
+-		  if (note || (was_call && nonlocal_goto_handler_labels))
+-		    {
+-		      edge eh_edge;
+-		      edge_iterator ei;
+-
+-		      FOR_EACH_EDGE (eh_edge, ei, bb->succs)
+-			if (eh_edge->flags & (EDGE_EH | EDGE_ABNORMAL_CALL))
+-			  break;
+-
+-		      if (note)
+-			copy_reg_eh_region_note_backward (note, attempt,
+-							  before_try);
+-
+-		      if (eh_edge)
+-			for (x = attempt ; x != before_try ; x = PREV_INSN (x))
+-			  if (x != BB_END (bb)
+-			      && (can_throw_internal (x)
+-				  || can_nonlocal_goto (x)))
+-			    {
+-			      edge nfte, nehe;
+-			      int flags;
+-
+-			      nfte = split_block (bb, x);
+-			      flags = (eh_edge->flags
+-				       & (EDGE_EH | EDGE_ABNORMAL));
+-			      if (CALL_P (x))
+-				flags |= EDGE_ABNORMAL_CALL;
+-			      nehe = make_edge (nfte->src, eh_edge->dest,
+-						flags);
+-
+-			      nehe->probability = eh_edge->probability;
+-			      nfte->probability
+-				= REG_BR_PROB_BASE - nehe->probability;
+-
+-			      do_cleanup_cfg |= purge_dead_edges (nfte->dest);
+-			      bb = nfte->src;
+-			      eh_edge = nehe;
+-			    }
+-
+-		      /* Converting possibly trapping insn to non-trapping is
+-			 possible.  Zap dummy outgoing edges.  */
+-		      do_cleanup_cfg |= purge_dead_edges (bb);
+-		    }
+-
+-		  if (targetm.have_conditional_execution ())
+-		    {
+-		      for (i = 0; i < MAX_INSNS_PER_PEEP2 + 1; ++i)
+-			peep2_insn_data[i].insn = NULL_RTX;
+-		      peep2_insn_data[peep2_current].insn = PEEP2_EOB;
+-		      peep2_current_count = 0;
+-		    }
+-		  else
+-		    {
+-		      /* Back up lifetime information past the end of the
+-			 newly created sequence.  */
+-		      if (++i >= MAX_INSNS_PER_PEEP2 + 1)
+-			i = 0;
+-		      bitmap_copy (live, peep2_insn_data[i].live_before);
+-
+-		      /* Update life information for the new sequence.  */
+-		      x = attempt;
+-		      do
+-			{
+-			  if (INSN_P (x))
+-			    {
+-			      if (--i < 0)
+-				i = MAX_INSNS_PER_PEEP2;
+-			      if (peep2_current_count < MAX_INSNS_PER_PEEP2
+-				  && peep2_insn_data[i].insn == NULL_RTX)
+-				peep2_current_count++;
+-			      peep2_insn_data[i].insn = x;
+-			      df_insn_rescan (x);
+-			      df_simulate_one_insn_backwards (bb, x, live);
+-			      bitmap_copy (peep2_insn_data[i].live_before,
+-					   live);
+-			    }
+-			  x = PREV_INSN (x);
+-			}
+-		      while (x != prev);
+-
+-		      peep2_current = i;
+-		    }
+-
+-		  /* If we generated a jump instruction, it won't have
+-		     JUMP_LABEL set.  Recompute after we're done.  */
+-		  for (x = attempt; x != before_try; x = PREV_INSN (x))
+-		    if (JUMP_P (x))
+-		      {
+-		        do_rebuild_jump_labels = true;
+-			break;
+-		      }
+-		}
++	    next_insn:
++	      insn = NEXT_INSN (insn);
++	      if (insn == NEXT_INSN (BB_END (bb)))
++		past_end = true;
++	      continue;
+ 	    }
++	  if (!past_end && peep2_fill_buffer (bb, insn, live))
++	    goto next_insn;
+ 
+-	  if (insn == BB_HEAD (bb))
++	  /* If we did not fill an empty buffer, it signals the end of the
++	     block.  */
++	  if (peep2_current_count == 0)
+ 	    break;
++
++	  /* The buffer filled to the current maximum, so try to match.  */
++
++	  pos = peep2_buf_position (peep2_current + peep2_current_count);
++	  peep2_insn_data[pos].insn = PEEP2_EOB;
++	  COPY_REG_SET (peep2_insn_data[pos].live_before, live);
++
++	  /* Match the peephole.  */
++	  head = peep2_insn_data[peep2_current].insn;
++	  attempt = peephole2_insns (PATTERN (head), head, &match_len);
++	  if (attempt != NULL)
++	    {
++	      rtx last;
++	      last = peep2_attempt (bb, head, match_len, attempt);
++	      peep2_update_life (bb, match_len, last, PREV_INSN (attempt));
++	    }
++	  else
++	    {
++	      /* If no match, advance the buffer by one insn.  */
++	      peep2_current = peep2_buf_position (peep2_current + 1);
++	      peep2_current_count--;
++	    }
+ 	}
+     }
+ 
+@@ -3341,7 +3406,7 @@
+   for (i = 0; i < MAX_INSNS_PER_PEEP2 + 1; ++i)
+     BITMAP_FREE (peep2_insn_data[i].live_before);
+   BITMAP_FREE (live);
+-  if (do_rebuild_jump_labels)
++  if (peep2_do_rebuild_jump_labels)
+     rebuild_jump_labels (get_insns ());
+ }
+ #endif /* HAVE_peephole2 */
+
+=== modified file 'gcc/recog.h'
+--- old/gcc/recog.h	2009-10-26 21:55:59 +0000
++++ new/gcc/recog.h	2010-11-16 12:32:34 +0000
+@@ -194,6 +194,9 @@
+   /* Gives the constraint string for operand N.  */
+   const char *constraints[MAX_RECOG_OPERANDS];
+ 
++  /* Nonzero if operand N is a match_operator or a match_parallel.  */
++  char is_operator[MAX_RECOG_OPERANDS];
++
+   /* Gives the mode of operand N.  */
+   enum machine_mode operand_mode[MAX_RECOG_OPERANDS];
+ 
+@@ -260,6 +263,8 @@
+ 
+   const char strict_low;
+ 
++  const char is_operator;
++
+   const char eliminable;
+ };
+ 
+
+=== modified file 'gcc/reload.c'
+--- old/gcc/reload.c	2009-12-21 16:32:44 +0000
++++ new/gcc/reload.c	2010-11-16 12:32:34 +0000
+@@ -3631,7 +3631,7 @@
+ 		   || modified[j] != RELOAD_WRITE)
+ 		  && j != i
+ 		  /* Ignore things like match_operator operands.  */
+-		  && *recog_data.constraints[j] != 0
++		  && !recog_data.is_operator[j]
+ 		  /* Don't count an input operand that is constrained to match
+ 		     the early clobber operand.  */
+ 		  && ! (this_alternative_matches[j] == i
+
-- 
1.7.0.4



