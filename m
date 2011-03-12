Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyDJV-0006Sk-K3
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 02:08:14 +0100
Received: by pzk35 with SMTP id 35so318637pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 17:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=LRE4SXlfLgjzbCb3owezWtPM87/mnjWz/g3F5f9ViuY=;
	b=FoabxHDdJLHOGWMNy0PxAi8HLVl99gwu6LINLVZJsWtghAHXkt+QXKNiFJUi1SbCSj
	Cm/H9b+LnsMorO+0G63bK+TimbsFAAKOoSZH2Adn91/cJKHanPGC3HxEBBkvOpRCdOlH
	noEVp6fERz5Uvmgqt13rhBFfw85a3KViFm2pI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Z5nDgoSd8YeHZBba3bD1P9YWzdHBsigiLDAiPFqjyY4tLExFRBPUuYcMZHKMhcLQPh
	n8mt5nMrf8zbj3Hp0NTO/j7F46xw5eVJ10F+XhuBfVXWfmbDAHOpdiiE+5ET3504GYQY
	MFzS13yvXnoyO4t73jzRlzXx+VRnih4NygOcI=
Received: by 10.142.12.19 with SMTP id 19mr8171344wfl.142.1299891993863;
	Fri, 11 Mar 2011 17:06:33 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m10sm6081576wfl.11.2011.03.11.17.06.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 17:06:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2011 17:06:28 -0800
Message-Id: <1299891988-15661-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] gcc-4.5: Fix ICE on i586
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
X-List-Received-Date: Sat, 12 Mar 2011 01:08:14 -0000

Upgrade to latest svnrev
Get new linaro patches
Delete patches that are not applied

Please test it in your environments and report if you see any issues or not

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-4.5.inc                            |   13 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch |  184 --------------------
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch |   20 +--
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch |   11 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch |   74 ++++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch |  101 +++++++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch |   64 +++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch |   40 +++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch |   84 +++++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch |   63 +++++++
 recipes/gcc/gcc-4.5/more-epilogues.patch           |   83 +++++++++
 .../tune-xscale-infinite-loop-PR45177.patch        |  103 -----------
 12 files changed, 530 insertions(+), 310 deletions(-)
 delete mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch
 create mode 100644 recipes/gcc/gcc-4.5/more-epilogues.patch
 delete mode 100644 recipes/gcc/gcc-4.5/tune-xscale-infinite-loop-PR45177.patch

diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
index 0a43bc7..a3a44a2 100644
--- a/recipes/gcc/gcc-4.5.inc
+++ b/recipes/gcc/gcc-4.5.inc
@@ -10,7 +10,7 @@ NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 INC_PR = "r33"
 
-SRCREV = "170443"
+SRCREV = "170880"
 PV = "4.5"
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
@@ -77,7 +77,6 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
 	   file://linaro/gcc-4.5-linaro-r99347.patch \
 	   file://linaro/gcc-4.5-linaro-r99348.patch \
 	   file://linaro/gcc-4.5-linaro-r99349.patch \
-#	   file://linaro/gcc-4.5-linaro-r99350.patch \
 	   file://linaro/gcc-4.5-linaro-r99351.patch \
 	   file://linaro/gcc-4.5-linaro-r99352.patch \
 	   file://linaro/gcc-4.5-linaro-r99353.patch \
@@ -166,9 +165,15 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
 	   file://linaro/gcc-4.5-linaro-r99466.patch \
 	   file://linaro/gcc-4.5-linaro-r99468.patch \
 	   file://linaro/gcc-4.5-linaro-r99473.patch \
-#	   file://linaro/gcc-4.5-linaro-r99474.patch \
+	   file://linaro/gcc-4.5-linaro-r99474.patch \
 	   file://linaro/gcc-4.5-linaro-r99475.patch \
-	   file://tune-xscale-infinite-loop-PR45177.patch \
+	   file://linaro/gcc-4.5-linaro-r99478.patch \
+	   file://linaro/gcc-4.5-linaro-r99479.patch \
+	   file://linaro/gcc-4.5-linaro-r99480.patch \
+	   file://linaro/gcc-4.5-linaro-r99481.patch \
+	   file://linaro/gcc-4.5-linaro-r99482.patch \
+	   file://linaro/gcc-4.5-linaro-r99483.patch \
+	   file://more-epilogues.patch \
 	   file://gcc-scalar-widening-pr45847.patch \
 	   file://gcc-arm-volatile-bitfield-fix.patch \
 	  "
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch
deleted file mode 100644
index 3f66f9d..0000000
--- a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch
+++ /dev/null
@@ -1,184 +0,0 @@
-	Jie Zhang  <jie@codesourcery.com>
-
-	Issue #7122
-
-	gcc/
-	* config/arm/vfp.md (movdf_vfp): Add load double 0.0 case.
-	(thumb2_movdf_vfp): Likewise. Require that one of the operands be a
-	register.
-	* config/arm/constraints.md (D0): New constraint.
-	
-	gcc/testsuite/
-	* gcc.target/arm/neon-load-df0.c: New test.
-
-2010-07-26  Julian Brown  <julian@codesourcery.com>
-
-	Merge from Sourcery G++ 4.4:
-
- 	2010-02-23  Julian Brown  <julian@codesourcery.com>
- 
- 	gcc/
-
-=== modified file 'gcc/config/arm/constraints.md'
---- old/gcc/config/arm/constraints.md	2010-08-12 16:47:21 +0000
-+++ new/gcc/config/arm/constraints.md	2010-08-13 10:59:06 +0000
-@@ -29,7 +29,7 @@
- ;; in Thumb-1 state: I, J, K, L, M, N, O
- 
- ;; The following multi-letter normal constraints have been used:
--;; in ARM/Thumb-2 state: Da, Db, Dc, Dn, Dl, DL, Dv, Dy, Di
-+;; in ARM/Thumb-2 state: D0, Da, Db, Dc, Di, Dn, Dl, DL, Dv, Dy
- ;; in Thumb-1 state: Pa, Pb
- ;; in Thumb-2 state: Ps, Pt, Pv
- 
-@@ -173,6 +173,13 @@
-  (and (match_code "const_double")
-       (match_test "TARGET_32BIT && neg_const_double_rtx_ok_for_fpa (op)")))
- 
-+(define_constraint "D0"
-+ "@internal
-+  In ARM/Thumb-2 state a 0.0 floating point constant which can
-+  be loaded with a Neon vmov immediate instruction."
-+ (and (match_code "const_double")
-+      (match_test "TARGET_NEON && op == CONST0_RTX (mode)")))
-+
- (define_constraint "Da"
-  "@internal
-   In ARM/Thumb-2 state a const_int, const_double or const_vector that can
-
-=== modified file 'gcc/config/arm/vfp.md'
---- old/gcc/config/arm/vfp.md	2010-08-12 11:29:02 +0000
-+++ new/gcc/config/arm/vfp.md	2010-08-13 10:59:06 +0000
-@@ -402,8 +402,8 @@
- ;; DFmode moves
- 
- (define_insn "*movdf_vfp"
--  [(set (match_operand:DF 0 "nonimmediate_soft_df_operand" "=w,?r,w ,r, m,w  ,Uv,w,r")
--	(match_operand:DF 1 "soft_df_operand"		   " ?r,w,Dy,mF,r,UvF,w, w,r"))]
-+  [(set (match_operand:DF 0 "nonimmediate_soft_df_operand" "=w,?r,w ,w, r, m,w  ,Uv,w,r")
-+	(match_operand:DF 1 "soft_df_operand"		   " ?r,w,Dy,D0,mF,r,UvF,w, w,r"))]
-   "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_VFP
-    && (   register_operand (operands[0], DFmode)
-        || register_operand (operands[1], DFmode))"
-@@ -418,16 +418,18 @@
-       case 2:
- 	gcc_assert (TARGET_VFP_DOUBLE);
-         return \"fconstd%?\\t%P0, #%G1\";
--      case 3: case 4:
-+      case 3:
-+	return \"vmov.i32\\t%P0, #0\";
-+      case 4: case 5:
- 	return output_move_double (operands);
--      case 5: case 6:
-+      case 6: case 7:
- 	return output_move_vfp (operands);
--      case 7:
-+      case 8:
- 	if (TARGET_VFP_SINGLE)
- 	  return \"fcpys%?\\t%0, %1\;fcpys%?\\t%p0, %p1\";
- 	else
- 	  return \"fcpyd%?\\t%P0, %P1\";
--      case 8:
-+      case 9:
-         return \"#\";
-       default:
- 	gcc_unreachable ();
-@@ -435,10 +437,10 @@
-     }
-   "
-   [(set_attr "type"
--     "r_2_f,f_2_r,fconstd,f_loadd,f_stored,load2,store2,ffarithd,*")
--   (set_attr "neon_type" "neon_mcr_2_mcrr,neon_mrrc,*,*,*,*,*,neon_vmov,*")
--   (set (attr "length") (cond [(eq_attr "alternative" "3,4,8") (const_int 8)
--			       (eq_attr "alternative" "7")
-+     "r_2_f,f_2_r,fconstd,*,f_loadd,f_stored,load2,store2,ffarithd,*")
-+   (set_attr "neon_type" "neon_mcr_2_mcrr,neon_mrrc,*,neon_vmov,*,*,*,*,neon_vmov,*")
-+   (set (attr "length") (cond [(eq_attr "alternative" "4,5,9") (const_int 8)
-+			       (eq_attr "alternative" "8")
- 				(if_then_else
- 				 (eq (symbol_ref "TARGET_VFP_SINGLE")
- 				     (const_int 1))
-@@ -446,14 +448,16 @@
- 				 (const_int 4))]
- 			      (const_int 4)))
-    (set_attr "predicable" "yes")
--   (set_attr "pool_range" "*,*,*,1020,*,1020,*,*,*")
--   (set_attr "neg_pool_range" "*,*,*,1008,*,1008,*,*,*")]
-+   (set_attr "pool_range" "*,*,*,*,1020,*,1020,*,*,*")
-+   (set_attr "neg_pool_range" "*,*,*,*,1008,*,1008,*,*,*")]
- )
- 
- (define_insn "*thumb2_movdf_vfp"
--  [(set (match_operand:DF 0 "nonimmediate_soft_df_operand" "=w,?r,w ,r, m,w  ,Uv,w,r")
--	(match_operand:DF 1 "soft_df_operand"		   " ?r,w,Dy,mF,r,UvF,w, w,r"))]
--  "TARGET_THUMB2 && TARGET_HARD_FLOAT && TARGET_VFP"
-+  [(set (match_operand:DF 0 "nonimmediate_soft_df_operand" "=w,?r,w ,w,r, m,w  ,Uv,w,r")
-+	(match_operand:DF 1 "soft_df_operand"		   " ?r,w,Dy,D0,mF,r,UvF,w, w,r"))]
-+  "TARGET_THUMB2 && TARGET_HARD_FLOAT && TARGET_VFP
-+   && (   register_operand (operands[0], DFmode)
-+       || register_operand (operands[1], DFmode))"
-   "*
-   {
-     switch (which_alternative)
-@@ -465,11 +469,13 @@
-       case 2:
- 	gcc_assert (TARGET_VFP_DOUBLE);
- 	return \"fconstd%?\\t%P0, #%G1\";
--      case 3: case 4: case 8:
-+      case 3:
-+	return \"vmov.i32\\t%P0, #0\";
-+      case 4: case 5: case 9:
- 	return output_move_double (operands);
--      case 5: case 6:
-+      case 6: case 7:
- 	return output_move_vfp (operands);
--      case 7:
-+      case 8:
- 	if (TARGET_VFP_SINGLE)
- 	  return \"fcpys%?\\t%0, %1\;fcpys%?\\t%p0, %p1\";
- 	else
-@@ -480,18 +486,18 @@
-     }
-   "
-   [(set_attr "type"
--     "r_2_f,f_2_r,fconstd,load2,store2,f_load,f_store,ffarithd,*")
--   (set_attr "neon_type" "neon_mcr_2_mcrr,neon_mrrc,*,*,*,*,*,neon_vmov,*")
--   (set (attr "length") (cond [(eq_attr "alternative" "3,4,8") (const_int 8)
--			       (eq_attr "alternative" "7")
-+     "r_2_f,f_2_r,fconstd,*,load2,store2,f_load,f_store,ffarithd,*")
-+   (set_attr "neon_type" "neon_mcr_2_mcrr,neon_mrrc,*,neon_vmov,*,*,*,*,neon_vmov,*")
-+   (set (attr "length") (cond [(eq_attr "alternative" "4,5,9") (const_int 8)
-+			       (eq_attr "alternative" "8")
- 				(if_then_else
- 				 (eq (symbol_ref "TARGET_VFP_SINGLE")
- 				     (const_int 1))
- 				 (const_int 8)
- 				 (const_int 4))]
- 			      (const_int 4)))
--   (set_attr "pool_range" "*,*,*,4096,*,1020,*,*,*")
--   (set_attr "neg_pool_range" "*,*,*,0,*,1008,*,*,*")]
-+   (set_attr "pool_range" "*,*,*,*,4096,*,1020,*,*,*")
-+   (set_attr "neg_pool_range" "*,*,*,*,0,*,1008,*,*,*")]
- )
- 
- 
-
-=== added file 'gcc/testsuite/gcc.target/arm/neon-load-df0.c'
---- old/gcc/testsuite/gcc.target/arm/neon-load-df0.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon-load-df0.c	2010-08-13 10:59:06 +0000
-@@ -0,0 +1,14 @@
-+/* Test the optimization of loading 0.0 for ARM Neon.  */
-+
-+/* { dg-do compile } */
-+/* { dg-require-effective-target arm_neon_ok } */
-+/* { dg-options "-O2" } */
-+/* { dg-add-options arm_neon } */
-+
-+double x;
-+void bar ()
-+{
-+  x = 0.0;
-+}
-+/* { dg-final { scan-assembler "vmov\.i32\[ 	\]+\[dD\]\[0-9\]+, #0\n" } } */
-+/* { dg-final { cleanup-saved-temps } } */
-
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch
index a1a2c2a..aa3b3eb 100644
--- a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch
@@ -1,3 +1,11 @@
+2010-07-26  Julian Brown  <julian@codesourcery.com>
+
+        Merge from Sourcery G++ 4.4:
+
+        Jie Zhang  <jie@codesourcery.com>
+        Issue #7122
+
+        gcc/
 	* config/arm/arm.c (arm_rtx_costs_1): Adjust cost for
 	CONST_VECTOR.
 	(arm_size_rtx_costs): Likewise.
@@ -25,18 +33,6 @@
 	* gcc.target/arm/neon-vdup-18.c: New test case.
 	* gcc.target/arm/neon-vdup-19.c: New test case.
 
-2010-07-26  Julian Brown  <julian@codesourcery.com>
-
-	Merge from Sourcery G++ 4.4:
-
-	Jie Zhang  <jie@codesourcery.com>
-
-	Issue #7122
-
-	gcc/
- 	* config/arm/vfp.md (movdf_vfp): Add load double 0.0 case.
- 	(thumb2_movdf_vfp): Likewise. Require that one of the operands be a
- 	register.
 
 === modified file 'gcc/config/arm/arm.c'
 --- old/gcc/config/arm/arm.c	2010-08-13 10:55:28 +0000
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch
index 675c2f3..8d48ada 100644
--- a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch
@@ -1,3 +1,7 @@
+2010-07-26  Julian Brown  <julian@codesourcery.com>
+
+        Merge from Sourcery G++ 4.4:
+
 	2010-04-07  Thomas Schwinge  <thomas@codesourcery.com>
 		    Daniel Jacobowitz  <dan@codesourcery.com>
 
@@ -13,13 +17,6 @@
 	* config/arm/arm.h (DWARF2_UNWIND_INFO): Remove definition.
 	* config/arm/bpabi.h (DWARF2_UNWIND_INFO): Define to zero.
 
-2010-07-26  Julian Brown  <julian@codesourcery.com>
-
-	Merge from Sourcery G++ 4.4:
-
- 	Jie Zhang  <jie@codesourcery.com>
- 
- 	Issue #7122
 
 === modified file 'gcc/config/arm/arm.h'
 --- old/gcc/config/arm/arm.h	2010-08-13 10:30:35 +0000
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch
new file mode 100644
index 0000000..38463a9
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch
@@ -0,0 +1,74 @@
+2011-01-11  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
+
+	* config/arm/t-arm: Fix up last commit.
+
+2011-01-11  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
+
+	* config/arm/t-arm: Update MD_INCLUDES to include
+	all the files correctly.
+	* config/arm/arm.md: Update comments.
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-02-22 11:38:56 +0000
++++ new/gcc/config/arm/arm.md	2011-03-01 14:32:39 +0000
+@@ -11246,6 +11246,7 @@
+   "
+ )
+ 
++;; Make sure that the includes are reflected in MD_INCLUDES.
+ ;; Load the load/store multiple patterns
+ (include "ldmstm.md")
+ ;; Load the FPA co-processor patterns
+
+=== modified file 'gcc/config/arm/t-arm'
+--- old/gcc/config/arm/t-arm	2010-08-16 09:41:58 +0000
++++ new/gcc/config/arm/t-arm	2011-01-11 21:01:30 +0000
+@@ -18,20 +18,33 @@
+ # along with GCC; see the file COPYING3.  If not see
+ # <http://www.gnu.org/licenses/>.
+ 
+-MD_INCLUDES= 	$(srcdir)/config/arm/arm-tune.md \
+-		$(srcdir)/config/arm/predicates.md \
+-		$(srcdir)/config/arm/arm-generic.md \
+-		$(srcdir)/config/arm/arm1020e.md \
+-		$(srcdir)/config/arm/arm1026ejs.md \
+-		$(srcdir)/config/arm/arm1136jfs.md \
+-		$(srcdir)/config/arm/arm926ejs.md \
+-		$(srcdir)/config/arm/cirrus.md \
+-		$(srcdir)/config/arm/fpa.md \
+-		$(srcdir)/config/arm/vec-common.md \
+-		$(srcdir)/config/arm/iwmmxt.md \
+-		$(srcdir)/config/arm/vfp.md \
+-		$(srcdir)/config/arm/neon.md \
+-		$(srcdir)/config/arm/thumb2.md
++MD_INCLUDES=	$(srcdir)/config/arm/arm-tune.md          	\
++		$(srcdir)/config/arm/predicates.md		\
++		$(srcdir)/config/arm/arm-generic.md       	\
++	 	$(srcdir)/config/arm/arm1020e.md          	\
++	 	$(srcdir)/config/arm/arm1026ejs.md        	\
++		$(srcdir)/config/arm/arm1136jfs.md        	\
++	 	$(srcdir)/config/arm/arm926ejs.md         	\
++		$(srcdir)/config/arm/cirrus.md            	\
++		$(srcdir)/config/arm/fpa.md               	\
++		$(srcdir)/config/arm/vec-common.md        	\
++		$(srcdir)/config/arm/iwmmxt.md            	\
++		$(srcdir)/config/arm/vfp.md               	\
++	 	$(srcdir)/config/arm/cortex-a5.md         	\
++		$(srcdir)/config/arm/cortex-a8.md         	\
++		$(srcdir)/config/arm/cortex-a9.md         	\
++		$(srcdir)/config/arm/cortex-a9-neon.md		\
++		$(srcdir)/config/arm/cortex-r4.md         	\
++		$(srcdir)/config/arm/cortex-r4f.md        	\
++		$(srcdir)/config/arm/cortex-m4.md         	\
++		$(srcdir)/config/arm/cortex-m4-fpu.md     	\
++		$(srcdir)/config/arm/vfp11.md             	\
++		$(srcdir)/config/arm/ldmstm.md            	\
++		$(srcdir)/config/arm/thumb2.md            	\
++		$(srcdir)/config/arm/neon.md              	\
++		$(srcdir)/config/arm/sync.md              	\
++		$(srcdir)/config/arm/cortex-a8-neon.md    	\
++		$(srcdir)/config/arm/constraints.md       	
+ 
+ LIB1ASMSRC = arm/lib1funcs.asm
+ LIB1ASMFUNCS = _thumb1_case_sqi _thumb1_case_uqi _thumb1_case_shi \
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch
new file mode 100644
index 0000000..2920466
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99479.patch
@@ -0,0 +1,101 @@
+2011-02-24  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	Backport from FSF mainline:
+
+	2010-08-10  Bernd Schmidt  <bernds@codesourcery.com>
+
+	PR bootstrap/45177
+	* config/arm/arm.c (multiple_operation_profitable_p): Move xscale
+	test here from arm_gen_load_multiple_1.
+	(arm_gen_load_multiple_1, arm_gen_store_multiple_1): Use
+	multiple_operation_profitable_p.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-02-22 11:38:56 +0000
++++ new/gcc/config/arm/arm.c	2011-02-24 17:30:32 +0000
+@@ -9728,6 +9728,36 @@
+   if (nops == 2 && arm_ld_sched && add_offset != 0)
+     return false;
+ 
++  /* XScale has load-store double instructions, but they have stricter
++     alignment requirements than load-store multiple, so we cannot
++     use them.
++
++     For XScale ldm requires 2 + NREGS cycles to complete and blocks
++     the pipeline until completion.
++
++	NREGS		CYCLES
++	  1		  3
++	  2		  4
++	  3		  5
++	  4		  6
++
++     An ldr instruction takes 1-3 cycles, but does not block the
++     pipeline.
++
++	NREGS		CYCLES
++	  1		 1-3
++	  2		 2-6
++	  3		 3-9
++	  4		 4-12
++
++     Best case ldr will always win.  However, the more ldr instructions
++     we issue, the less likely we are to be able to schedule them well.
++     Using ldr instructions also increases code size.
++
++     As a compromise, we use ldr for counts of 1 or 2 regs, and ldm
++     for counts of 3 or 4 regs.  */
++  if (nops <= 2 && arm_tune_xscale && !optimize_size)
++    return false;
+   return true;
+ }
+ 
+@@ -10086,35 +10116,7 @@
+   int i = 0, j;
+   rtx result;
+ 
+-  /* XScale has load-store double instructions, but they have stricter
+-     alignment requirements than load-store multiple, so we cannot
+-     use them.
+-
+-     For XScale ldm requires 2 + NREGS cycles to complete and blocks
+-     the pipeline until completion.
+-
+-	NREGS		CYCLES
+-	  1		  3
+-	  2		  4
+-	  3		  5
+-	  4		  6
+-
+-     An ldr instruction takes 1-3 cycles, but does not block the
+-     pipeline.
+-
+-	NREGS		CYCLES
+-	  1		 1-3
+-	  2		 2-6
+-	  3		 3-9
+-	  4		 4-12
+-
+-     Best case ldr will always win.  However, the more ldr instructions
+-     we issue, the less likely we are to be able to schedule them well.
+-     Using ldr instructions also increases code size.
+-
+-     As a compromise, we use ldr for counts of 1 or 2 regs, and ldm
+-     for counts of 3 or 4 regs.  */
+-  if (low_irq_latency || (arm_tune_xscale && count <= 2 && ! optimize_size))
++  if (low_irq_latency || !multiple_operation_profitable_p (false, count, 0))
+     {
+       rtx seq;
+ 
+@@ -10166,9 +10168,7 @@
+   if (GET_CODE (basereg) == PLUS)
+     basereg = XEXP (basereg, 0);
+ 
+-  /* See arm_gen_load_multiple_1 for discussion of
+-     the pros/cons of ldm/stm usage for XScale.  */
+-  if (low_irq_latency || (arm_tune_xscale && count <= 2 && ! optimize_size))
++  if (low_irq_latency || !multiple_operation_profitable_p (false, count, 0))
+     {
+       rtx seq;
+ 
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch
new file mode 100644
index 0000000..76d3c95
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch
@@ -0,0 +1,64 @@
+2011-02-02  Richard Sandiford  <richard.sandiford@linaro.org>
+
+
+	gcc/
+	PR target/47551
+	* config/arm/arm.c (coproc_secondary_reload_class): Handle
+	structure modes.  Don't check neon_vector_mem_operand for
+	vector or structure modes.
+
+	gcc/testsuite/
+	PR target/47551
+	* gcc.target/arm/neon-modes-2.c: New test.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-02-24 17:30:32 +0000
++++ new/gcc/config/arm/arm.c	2011-03-02 11:29:06 +0000
+@@ -9303,11 +9303,14 @@
+       return GENERAL_REGS;
+     }
+ 
++  /* The neon move patterns handle all legitimate vector and struct
++     addresses.  */
+   if (TARGET_NEON
++      && MEM_P (x)
+       && (GET_MODE_CLASS (mode) == MODE_VECTOR_INT
+-          || GET_MODE_CLASS (mode) == MODE_VECTOR_FLOAT)
+-      && neon_vector_mem_operand (x, 0))
+-     return NO_REGS;
++	  || GET_MODE_CLASS (mode) == MODE_VECTOR_FLOAT
++	  || VALID_NEON_STRUCT_MODE (mode)))
++    return NO_REGS;
+ 
+   if (arm_coproc_mem_operand (x, wb) || s_register_operand (x, mode))
+     return NO_REGS;
+
+=== added file 'gcc/testsuite/gcc.target/arm/neon-modes-2.c'
+--- old/gcc/testsuite/gcc.target/arm/neon-modes-2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon-modes-2.c	2011-02-02 13:48:10 +0000
+@@ -0,0 +1,24 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-options "-O1" } */
++/* { dg-add-options arm_neon } */
++
++#include "arm_neon.h"
++
++#define SETUP(A) x##A = vld3_u32 (ptr + A * 0x20)
++#define MODIFY(A) x##A = vld3_lane_u32 (ptr + A * 0x20 + 0x10, x##A, 1)
++#define STORE(A) vst3_u32 (ptr + A * 0x20, x##A)
++
++#define MANY(A) A (0), A (1), A (2), A (3), A (4), A (5)
++
++void
++bar (uint32_t *ptr, int y)
++{
++  uint32x2x3_t MANY (SETUP);
++  int *x = __builtin_alloca (y);
++  int z[0x1000];
++  foo (x, z);
++  MANY (MODIFY);
++  foo (x, z);
++  MANY (STORE);
++}
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch
new file mode 100644
index 0000000..db53255
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch
@@ -0,0 +1,40 @@
+ 2011-02-02  Richard Sandiford  <richard.sandiford@linaro.org>
+ 
+	gcc/testsuite/
+	PR target/47553
+	* gcc.target/arm/neon-vld-1.c: New test.
+	gcc/
+	PR target/47553
+	* config/arm/predicates.md (neon_lane_number): Accept 0..15.
+
+=== modified file 'gcc/config/arm/predicates.md'
+--- old/gcc/config/arm/predicates.md	2011-02-08 12:07:29 +0000
++++ new/gcc/config/arm/predicates.md	2011-03-02 12:28:41 +0000
+@@ -607,7 +607,7 @@
+ ;; TODO: We could check lane numbers more precisely based on the mode.
+ (define_predicate "neon_lane_number"
+   (and (match_code "const_int")
+-       (match_test "INTVAL (op) >= 0 && INTVAL (op) <= 7")))
++       (match_test "INTVAL (op) >= 0 && INTVAL (op) <= 15")))
+ ;; Predicates for named expanders that overlap multiple ISAs.
+ 
+ (define_predicate "cmpdi_operand"
+
+=== added file 'gcc/testsuite/gcc.target/arm/neon-vld-1.c'
+--- old/gcc/testsuite/gcc.target/arm/neon-vld-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon-vld-1.c	2011-02-02 13:57:54 +0000
+@@ -0,0 +1,13 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-options "-O1" } */
++/* { dg-add-options arm_neon } */
++
++#include <arm_neon.h>
++
++uint8x16_t
++foo (uint8_t *a, uint8x16_t b)
++{
++  vst1q_lane_u8 (a, b, 14);
++  return vld1q_lane_u8 (a + 0x100, b, 15);
++}
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch
new file mode 100644
index 0000000..334ac4e
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch
@@ -0,0 +1,84 @@
+ 2011-02-02  Richard Sandiford  <richard.sandiford@linaro.org>
+ 
+	gcc/
+	Backport from mainline:
+
+	2011-01-23  Bernd Schmidt  <bernds@codesourcery.com>
+		    Richard Sandiford  <rdsandiford@googlemail.com>
+
+	PR rtl-optimization/47166
+	* reload1.c (emit_reload_insns): Disable the spill_reg_store
+	mechanism for PRE_MODIFY and POST_MODIFY.
+	(inc_for_reload): For PRE_MODIFY, return the insn that sets the
+	reloadreg.
+
+	gcc/testsuite/
+	* gcc.c-torture/execute/postmod-1.c: New test.
+
+=== added file 'gcc/testsuite/gcc.c-torture/execute/postmod-1.c'
+--- old/gcc/testsuite/gcc.c-torture/execute/postmod-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.c-torture/execute/postmod-1.c	2011-02-02 14:23:10 +0000
+@@ -0,0 +1,62 @@
++#define DECLARE_ARRAY(A) array##A[0x10]
++#define DECLARE_COUNTER(A) counter##A = 0
++#define DECLARE_POINTER(A) *pointer##A = array##A + x
++/* Create a loop that allows post-modification of pointerA, followed by
++   a use of the post-modified address.  */
++#define BEFORE(A) counter##A += *pointer##A, pointer##A += 3
++#define AFTER(A) counter##A += pointer##A[x]
++
++/* Set up the arrays so that one iteration of the loop sets the counter
++   to 3.0f.  */
++#define INIT_ARRAY(A) array##A[1] = 1.0f, array##A[5] = 2.0f
++
++/* Check that the loop worked correctly for all values.  */
++#define CHECK_ARRAY(A) exit_code |= (counter##A != 3.0f)
++
++/* Having 6 copies triggered the bug for ARM and Thumb.  */
++#define MANY(A) A (0), A (1), A (2), A (3), A (4), A (5)
++
++/* Each addendA should be allocated a register.  */
++#define INIT_VOLATILE(A) addend##A = vol
++#define ADD_VOLATILE(A) vol += addend##A
++
++/* Having 5 copies triggered the bug for ARM and Thumb.  */
++#define MANY2(A) A (0), A (1), A (2), A (3), A (4)
++
++float MANY (DECLARE_ARRAY);
++float MANY (DECLARE_COUNTER);
++
++volatile int stop = 1;
++volatile int vol;
++
++void __attribute__((noinline))
++foo (int x)
++{
++  float MANY (DECLARE_POINTER);
++  int i;
++
++  do
++    {
++      MANY (BEFORE);
++      MANY (AFTER);
++      /* Create an inner loop that should ensure the code above
++	 has registers free for reload inheritance.  */
++      {
++	int MANY2 (INIT_VOLATILE);
++	for (i = 0; i < 10; i++)
++	  MANY2 (ADD_VOLATILE);
++      }
++    }
++  while (!stop);
++}
++
++int
++main (void)
++{
++  int exit_code = 0;
++
++  MANY (INIT_ARRAY);
++  foo (1);
++  MANY (CHECK_ARRAY);
++  return exit_code;
++}
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch
new file mode 100644
index 0000000..c0be4a0
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch
@@ -0,0 +1,63 @@
+2011-02-11  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	* cse.c (count_reg_usage): Check side_effects_p.  Remove the
+	separate check for volatile asms.
+
+	gcc/testsuite/
+	* gcc.dg/torture/volatile-pic-1.c: New test.
+
+=== modified file 'gcc/cse.c'
+--- old/gcc/cse.c	2010-11-26 12:03:32 +0000
++++ new/gcc/cse.c	2011-02-11 09:27:19 +0000
+@@ -6634,9 +6634,10 @@
+     case CALL_INSN:
+     case INSN:
+     case JUMP_INSN:
+-      /* We expect dest to be NULL_RTX here.  If the insn may trap, mark
+-         this fact by setting DEST to pc_rtx.  */
+-      if (insn_could_throw_p (x))
++      /* We expect dest to be NULL_RTX here.  If the insn may trap,
++	 or if it cannot be deleted due to side-effects, mark this fact
++	 by setting DEST to pc_rtx.  */
++      if (insn_could_throw_p (x) || side_effects_p (PATTERN (x)))
+ 	dest = pc_rtx;
+       if (code == CALL_INSN)
+ 	count_reg_usage (CALL_INSN_FUNCTION_USAGE (x), counts, dest, incr);
+@@ -6676,10 +6677,6 @@
+       return;
+ 
+     case ASM_OPERANDS:
+-      /* If the asm is volatile, then this insn cannot be deleted,
+-	 and so the inputs *must* be live.  */
+-      if (MEM_VOLATILE_P (x))
+-	dest = NULL_RTX;
+       /* Iterate over just the inputs, not the constraints as well.  */
+       for (i = ASM_OPERANDS_INPUT_LENGTH (x) - 1; i >= 0; i--)
+ 	count_reg_usage (ASM_OPERANDS_INPUT (x, i), counts, dest, incr);
+
+=== added file 'gcc/testsuite/gcc.dg/torture/volatile-pic-1.c'
+--- old/gcc/testsuite/gcc.dg/torture/volatile-pic-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/torture/volatile-pic-1.c	2011-02-11 09:27:19 +0000
+@@ -0,0 +1,20 @@
++/* { dg-do run } */
++/* { dg-require-visibility "" } */
++/* { dg-require-effective-target fpic } */
++/* { dg-options "-fPIC" } */
++
++volatile int x __attribute__((visibility("hidden")));
++
++void __attribute__((noinline)) bar (void)
++{
++#if defined (__arm__)
++  asm volatile ("mov r3,%0" :: "r" (0xdeadbeef) : "r3");
++#endif
++  (void) x;
++}
++
++int main (void)
++{
++  bar ();
++  return 0;
++}
+
diff --git a/recipes/gcc/gcc-4.5/more-epilogues.patch b/recipes/gcc/gcc-4.5/more-epilogues.patch
new file mode 100644
index 0000000..64f1cf3
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/more-epilogues.patch
@@ -0,0 +1,83 @@
+Index: a/gcc/cfgcleanup.c
+===================================================================
+--- a/gcc/cfgcleanup.c	(revision 315947)
++++ b/gcc/cfgcleanup.c	(working copy)
+@@ -1179,13 +1179,19 @@ flow_find_head_matching_sequence (basic_
+ 
+   while (true)
+     {
+-
+-      /* Ignore notes.  */
++      /* Ignore notes, except NOTE_INSN_EPILOGUE_BEG.  */
+       while (!NONDEBUG_INSN_P (i1) && i1 != BB_END (bb1))
+-	i1 = NEXT_INSN (i1);
+-
++	{
++	  if (NOTE_P (i1) && NOTE_KIND (i1) == NOTE_INSN_EPILOGUE_BEG)
++	    break;
++	  i1 = NEXT_INSN (i1);
++	}
+       while (!NONDEBUG_INSN_P (i2) && i2 != BB_END (bb2))
+-	i2 = NEXT_INSN (i2);
++	{
++	  if (NOTE_P (i2) && NOTE_KIND (i2) == NOTE_INSN_EPILOGUE_BEG)
++	    break;
++	  i2 = NEXT_INSN (i2);
++	}
+ 
+       if (NOTE_P (i1) || NOTE_P (i2)
+ 	  || JUMP_P (i1) || JUMP_P (i2))
+Index: a/gcc/cfglayout.c
+===================================================================
+--- a/gcc/cfglayout.c	(revision 315947)
++++ b/gcc/cfglayout.c	(working copy)
+@@ -1295,6 +1295,16 @@ cfg_layout_initialize (unsigned int flag
+       bb->flags |= BB_NON_LOCAL_GOTO_TARGET;
+     }
+ 
++  FOR_EACH_BB (bb)
++    {
++      rtx insn;
++      FOR_BB_INSNS (bb, insn)
++	if (NOTE_P (insn) && NOTE_KIND (insn) == NOTE_INSN_EPILOGUE_BEG)
++	  {
++	    bb->flags |= BB_EPILOGUE_BEGIN;
++	    break;
++	  }
++    }
+   cleanup_cfg (CLEANUP_CFGLAYOUT | flags);
+ }
+ 
+Index: a/gcc/basic-block.h
+===================================================================
+--- a/gcc/basic-block.h	(revision 315947)
++++ b/gcc/basic-block.h	(working copy)
+@@ -332,7 +332,11 @@ enum bb_flags
+ 
+   /* Set on blocks that cannot be threaded through.
+      Only used in cfgcleanup.c.  */
+-  BB_NONTHREADABLE_BLOCK = 1 << 11
++  BB_NONTHREADABLE_BLOCK = 1 << 11,
++
++  /* Set on blocks that have a NOTE_INSN_EPILOGUE_BEGIN.
++     Only used in cfglayout mode.  */
++  BB_EPILOGUE_BEGIN = 1 << 12
+ };
+ 
+ /* Dummy flag for convenience in the hot/cold partitioning code.  */
+Index: a/gcc/cfgrtl.c
+===================================================================
+--- a/gcc/cfgrtl.c	(revision 315947)
++++ b/gcc/cfgrtl.c	(working copy)
+@@ -2707,7 +2707,10 @@ cfg_layout_can_merge_blocks_p (basic_blo
+ 	     not allow us to redirect an edge by replacing a table jump.  */
+ 	  && (!JUMP_P (BB_END (a))
+ 	      || ((!optimize || reload_completed)
+-		  ? simplejump_p (BB_END (a)) : onlyjump_p (BB_END (a)))));
++		  ? simplejump_p (BB_END (a)) : onlyjump_p (BB_END (a))))
++	  /* Don't separate a NOTE_INSN_EPILOGUE_BEG from its returnjump.  */
++	  && (!(b->flags & BB_EPILOGUE_BEGIN)
++	      || returnjump_p (BB_END (b))));
+ }
+ 
+ /* Merge block A and B.  The blocks must be mergeable.  */
diff --git a/recipes/gcc/gcc-4.5/tune-xscale-infinite-loop-PR45177.patch b/recipes/gcc/gcc-4.5/tune-xscale-infinite-loop-PR45177.patch
deleted file mode 100644
index 55c6f90..0000000
--- a/recipes/gcc/gcc-4.5/tune-xscale-infinite-loop-PR45177.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-commit dcb4aa7b04d03ba107fd628ec3dc663d0a01c397
-Author: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date:   Tue Aug 10 18:45:10 2010 +0000
-
-    	PR bootstrap/45177
-    	* config/arm/arm.c (multiple_operation_profitable_p): Move xscale
-    	test here from arm_gen_load_multiple_1.
-    	(arm_gen_load_multiple_1, arm_gen_store_multiple_1): Use
-    	multiple_operation_profitable_p.
-    
-    
-    git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@163077 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Index: gcc-4_5-branch/gcc/config/arm/arm.c
-===================================================================
---- gcc-4_5-branch.orig/gcc/config/arm/arm.c
-+++ gcc-4_5-branch/gcc/config/arm/arm.c
-@@ -9716,6 +9716,36 @@ multiple_operation_profitable_p (bool is
-   if (nops == 2 && arm_ld_sched && add_offset != 0)
-     return false;
- 
-+  /* XScale has load-store double instructions, but they have stricter
-+     alignment requirements than load-store multiple, so we cannot
-+     use them.
-+
-+     For XScale ldm requires 2 + NREGS cycles to complete and blocks
-+     the pipeline until completion.
-+
-+	NREGS		CYCLES
-+	  1		  3
-+	  2		  4
-+	  3		  5
-+	  4		  6
-+
-+     An ldr instruction takes 1-3 cycles, but does not block the
-+     pipeline.
-+
-+	NREGS		CYCLES
-+	  1		 1-3
-+	  2		 2-6
-+	  3		 3-9
-+	  4		 4-12
-+
-+     Best case ldr will always win.  However, the more ldr instructions
-+     we issue, the less likely we are to be able to schedule them well.
-+     Using ldr instructions also increases code size.
-+
-+     As a compromise, we use ldr for counts of 1 or 2 regs, and ldm
-+     for counts of 3 or 4 regs.  */
-+  if (nops <= 2 && arm_tune_xscale && !optimize_size)
-+    return false;
-   return true;
- }
- 
-@@ -10073,36 +10103,7 @@ arm_gen_load_multiple_1 (int count, int
- {
-   int i = 0, j;
-   rtx result;
--
--  /* XScale has load-store double instructions, but they have stricter
--     alignment requirements than load-store multiple, so we cannot
--     use them.
--
--     For XScale ldm requires 2 + NREGS cycles to complete and blocks
--     the pipeline until completion.
--
--	NREGS		CYCLES
--	  1		  3
--	  2		  4
--	  3		  5
--	  4		  6
--
--     An ldr instruction takes 1-3 cycles, but does not block the
--     pipeline.
--
--	NREGS		CYCLES
--	  1		 1-3
--	  2		 2-6
--	  3		 3-9
--	  4		 4-12
--
--     Best case ldr will always win.  However, the more ldr instructions
--     we issue, the less likely we are to be able to schedule them well.
--     Using ldr instructions also increases code size.
--
--     As a compromise, we use ldr for counts of 1 or 2 regs, and ldm
--     for counts of 3 or 4 regs.  */
--  if (low_irq_latency || (arm_tune_xscale && count <= 2 && ! optimize_size))
-+  if (!multiple_operation_profitable_p (false, count, 0))
-     {
-       rtx seq;
- 
-@@ -10154,9 +10155,7 @@ arm_gen_store_multiple_1 (int count, int
-   if (GET_CODE (basereg) == PLUS)
-     basereg = XEXP (basereg, 0);
- 
--  /* See arm_gen_load_multiple_1 for discussion of
--     the pros/cons of ldm/stm usage for XScale.  */
--  if (low_irq_latency || (arm_tune_xscale && count <= 2 && ! optimize_size))
-+  if (!multiple_operation_profitable_p (false, count, 0))
-     {
-       rtx seq;
- 
-- 
1.7.4.1



