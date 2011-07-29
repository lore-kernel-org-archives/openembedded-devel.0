Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qmv8k-0005DK-Ed
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 00:02:43 +0200
Received: by iyj12 with SMTP id 12so4887247iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jul 2011 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vD0+4zg1k8t6cOuxwL5cvFbXr7Ze4+EzAKeleZen09M=;
	b=vKulhei2GIoWjwCI5u/V0azq5qX/UXYwMPRwY4bsKx2lXyxl0ryMggz6QlWeQHqe4f
	SlHh7qpXixUlAvLZOZfJj5pHCnNCu7e+iUURPnE4WS8hD/elAosh1dFLYpox0lF2XUAK
	EHwriCQM0eR6qhbunU+vGnjMFVkhb6RgE9k78=
Received: by 10.231.61.202 with SMTP id u10mr1290239ibh.73.1311976703322;
	Fri, 29 Jul 2011 14:58:23 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q4sm1617591ibb.15.2011.07.29.14.58.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 14:58:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jul 2011 14:58:13 -0700
Message-Id: <1311976693-24956-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] gcc-4.5: Bring latest upstream and linaro patches
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
X-List-Received-Date: Fri, 29 Jul 2011 22:02:43 -0000

Build tested on angstrom-2010/console-image for all qemus + beagleboard
for both uclibc/eglibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc           |   11 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch |  315 ++++-----
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch |   43 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch |   25 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch |  166 +++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch |  210 ++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch |  119 ++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch |  209 ++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch |   67 ++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch |  138 ++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch |  741 ++++++++++++++++++++
 .../gcc/gcc-4.5/linaro/linaro-lp815435.patch       |   25 +
 12 files changed, 1870 insertions(+), 199 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/linaro-lp815435.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index abd3088..e214a4d 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -24,7 +24,7 @@ INC_PR = "r39"
 
 BINV = "${PV}.4"
 
-SRCREV = 175127
+SRCREV = 176640
 BRANCH = "gcc-4_5-branch"
 PR_append = "+svnr${SRCPV}"
 
@@ -192,6 +192,15 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
        file://linaro/gcc-4.5-linaro-r99511.patch \
        file://linaro/gcc-4.5-linaro-r99514.patch \
        file://linaro/gcc-4.5-linaro-r99516.patch \
+       file://linaro/gcc-4.5-linaro-r99519.patch \
+       file://linaro/gcc-4.5-linaro-r99521.patch \
+       file://linaro/gcc-4.5-linaro-r99522.patch \
+       file://linaro/gcc-4.5-linaro-r99523.patch \
+       file://linaro/gcc-4.5-linaro-r99524.patch \
+       file://linaro/gcc-4.5-linaro-r99525.patch \
+       file://linaro/gcc-4.5-linaro-r99528.patch \
+       file://linaro/gcc-4.5-linaro-r99529.patch \
+       file://linaro/linaro-lp815435.patch \
 	\
        file://more-epilogues.patch \
        file://gcc-scalar-widening-pr45847.patch \
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch
index 655399a..b7eaa68 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99396.patch
@@ -110,8 +110,10 @@
  	Backport from mainline:
 
 === modified file 'gcc/cfgexpand.c'
---- old/gcc/cfgexpand.c	2010-09-01 13:29:58 +0000
-+++ new/gcc/cfgexpand.c	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/cfgexpand.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/cfgexpand.c	2011-07-22 16:59:23.000000000 -0700
++++ gcc-4_5-branch/gcc/cfgexpand.c	2011-07-22 16:59:28.581747691 -0700
 @@ -64,7 +64,13 @@
  
    grhs_class = get_gimple_rhs_class (gimple_expr_code (stmt));
@@ -127,7 +129,7 @@
      t = build2 (gimple_assign_rhs_code (stmt),
  		TREE_TYPE (gimple_assign_lhs (stmt)),
  		gimple_assign_rhs1 (stmt),
-@@ -1887,6 +1893,9 @@
+@@ -1893,6 +1899,9 @@
  	    ops.type = TREE_TYPE (lhs);
  	    switch (get_gimple_rhs_class (gimple_expr_code (stmt)))
  	      {
@@ -137,7 +139,7 @@
  		case GIMPLE_BINARY_RHS:
  		  ops.op1 = gimple_assign_rhs2 (stmt);
  		  /* Fallthru */
-@@ -2237,6 +2246,8 @@
+@@ -2243,6 +2252,8 @@
  	{
  	case COND_EXPR:
  	case DOT_PROD_EXPR:
@@ -146,7 +148,7 @@
  	  goto ternary;
  
  	case TRUTH_ANDIF_EXPR:
-@@ -3023,6 +3034,8 @@
+@@ -3030,6 +3041,8 @@
        return NULL;
  
      case WIDEN_MULT_EXPR:
@@ -155,7 +157,7 @@
        if (SCALAR_INT_MODE_P (GET_MODE (op0))
  	  && SCALAR_INT_MODE_P (mode))
  	{
-@@ -3035,7 +3048,13 @@
+@@ -3042,7 +3055,13 @@
  	    op1 = simplify_gen_unary (ZERO_EXTEND, mode, op1, inner_mode);
  	  else
  	    op1 = simplify_gen_unary (SIGN_EXTEND, mode, op1, inner_mode);
@@ -170,10 +172,10 @@
  	}
        return NULL;
  
-
-=== modified file 'gcc/config/arm/arm.md'
---- old/gcc/config/arm/arm.md	2010-09-15 16:55:55 +0000
-+++ new/gcc/config/arm/arm.md	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/config/arm/arm.md
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/arm/arm.md	2011-07-22 16:59:25.000000000 -0700
++++ gcc-4_5-branch/gcc/config/arm/arm.md	2011-07-22 16:59:28.581747691 -0700
 @@ -1507,7 +1507,15 @@
     (set_attr "predicable" "yes")]
  )
@@ -248,10 +250,10 @@
    [(set_attr "insn" "smlalxy")
     (set_attr "predicable" "yes")])
  
-
-=== modified file 'gcc/doc/gimple.texi'
---- old/gcc/doc/gimple.texi	2010-07-06 19:23:53 +0000
-+++ new/gcc/doc/gimple.texi	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/doc/gimple.texi
+===================================================================
+--- gcc-4_5-branch.orig/gcc/doc/gimple.texi	2011-07-22 16:58:48.000000000 -0700
++++ gcc-4_5-branch/gcc/doc/gimple.texi	2011-07-22 16:59:28.581747691 -0700
 @@ -554,6 +554,9 @@
  @item @code{GIMPLE_INVALID_RHS}
  The tree cannot be used as a GIMPLE operand.
@@ -295,7 +297,7 @@
  @deftypefn {GIMPLE function} void gimple_assign_set_lhs (gimple g, tree lhs)
  Set @code{LHS} to be the @code{LHS} operand of assignment statement @code{G}.
  @end deftypefn
-@@ -1092,20 +1105,16 @@
+@@ -1092,17 +1105,13 @@
  statement @code{G}.
  @end deftypefn
   
@@ -305,27 +307,23 @@
 - 
 -@deftypefn {GIMPLE function} tree *gimple_assign_rhs2_ptr (gimple g)
 -Return a pointer to the second operand on the @code{RHS} of assignment
--statement @code{G}.
--@end deftypefn
-- 
- @deftypefn {GIMPLE function} void gimple_assign_set_rhs2 (gimple g, tree rhs)
- Set @code{RHS} to be the second operand on the @code{RHS} of assignment
++@deftypefn {GIMPLE function} void gimple_assign_set_rhs2 (gimple g, tree rhs)
++Set @code{RHS} to be the second operand on the @code{RHS} of assignment
  statement @code{G}.
  @end deftypefn
   
+-@deftypefn {GIMPLE function} void gimple_assign_set_rhs2 (gimple g, tree rhs)
+-Set @code{RHS} to be the second operand on the @code{RHS} of assignment
 +@deftypefn {GIMPLE function} void gimple_assign_set_rhs3 (gimple g, tree rhs)
 +Set @code{RHS} to be the third operand on the @code{RHS} of assignment
-+statement @code{G}.
-+@end deftypefn
-+ 
- @deftypefn {GIMPLE function} bool gimple_assign_cast_p (gimple s)
- Return true if @code{S} is a type-cast assignment.
+ statement @code{G}.
  @end deftypefn
-
-=== modified file 'gcc/expr.c'
---- old/gcc/expr.c	2010-09-01 13:29:58 +0000
-+++ new/gcc/expr.c	2010-09-16 09:15:46 +0000
-@@ -7225,8 +7225,6 @@
+  
+Index: gcc-4_5-branch/gcc/expr.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/expr.c	2011-07-22 16:59:23.000000000 -0700
++++ gcc-4_5-branch/gcc/expr.c	2011-07-22 16:59:28.591747691 -0700
+@@ -7228,8 +7228,6 @@
    rtx subtarget, original_target;
    int ignore;
    bool reduce_bit_field;
@@ -334,7 +332,7 @@
    location_t loc = ops->location;
    tree treeop0, treeop1;
  #define REDUCE_BIT_FIELD(expr)	(reduce_bit_field			  \
-@@ -7246,7 +7244,8 @@
+@@ -7249,7 +7247,8 @@
       exactly those that are valid in gimple expressions that aren't
       GIMPLE_SINGLE_RHS (or invalid).  */
    gcc_assert (get_gimple_rhs_class (code) == GIMPLE_UNARY_RHS
@@ -344,7 +342,7 @@
  
    ignore = (target == const0_rtx
  	    || ((CONVERT_EXPR_CODE_P (code)
-@@ -7421,58 +7420,6 @@
+@@ -7424,58 +7423,6 @@
  				    fold_convert_loc (loc, ssizetype,
  						      treeop1));
      case PLUS_EXPR:
@@ -403,7 +401,7 @@
        /* If we are adding a constant, a VAR_DECL that is sp, fp, or ap, and
  	 something else, make sure we add the register to the constant and
  	 then to the other thing.  This case can occur during strength
-@@ -7587,57 +7534,6 @@
+@@ -7590,57 +7537,6 @@
        return REDUCE_BIT_FIELD (simplify_gen_binary (PLUS, mode, op0, op1));
  
      case MINUS_EXPR:
@@ -461,7 +459,7 @@
        /* For initializers, we are allowed to return a MINUS of two
  	 symbolic constants.  Here we handle all cases when both operands
  	 are constant.  */
-@@ -7678,6 +7574,14 @@
+@@ -7681,6 +7577,14 @@
  
        goto binop2;
  
@@ -476,10 +474,10 @@
      case WIDEN_MULT_EXPR:
        /* If first operand is constant, swap them.
  	 Thus the following special case checks need only
-
-=== modified file 'gcc/gimple-pretty-print.c'
---- old/gcc/gimple-pretty-print.c	2009-11-25 10:55:54 +0000
-+++ new/gcc/gimple-pretty-print.c	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/gimple-pretty-print.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/gimple-pretty-print.c	2011-07-22 16:58:48.000000000 -0700
++++ gcc-4_5-branch/gcc/gimple-pretty-print.c	2011-07-22 16:59:28.591747691 -0700
 @@ -376,6 +376,34 @@
      }
  }
@@ -524,10 +522,10 @@
        else
          gcc_unreachable ();
        if (!(flags & TDF_RHS_ONLY))
-
-=== modified file 'gcc/gimple.c'
---- old/gcc/gimple.c	2010-09-15 16:47:52 +0000
-+++ new/gcc/gimple.c	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/gimple.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/gimple.c	2011-07-22 16:59:25.000000000 -0700
++++ gcc-4_5-branch/gcc/gimple.c	2011-07-22 16:59:28.591747691 -0700
 @@ -289,31 +289,40 @@
  
  
@@ -547,13 +545,10 @@
    grhs_class = get_gimple_rhs_class (*subcode_p);
  
 -  if (grhs_class == GIMPLE_BINARY_RHS)
--    {
--      *op1_p = TREE_OPERAND (expr, 0);
--      *op2_p = TREE_OPERAND (expr, 1);
 +  if (grhs_class == GIMPLE_TERNARY_RHS)
-+    {
-+      *op1_p = TREE_OPERAND (expr, 0);
-+      *op2_p = TREE_OPERAND (expr, 1);
+     {
+       *op1_p = TREE_OPERAND (expr, 0);
+       *op2_p = TREE_OPERAND (expr, 1);
 +      *op3_p = TREE_OPERAND (expr, 2);
 +    }
 +  else if (grhs_class == GIMPLE_BINARY_RHS)
@@ -668,10 +663,10 @@
     : ((SYM) == COND_EXPR						    \
        || (SYM) == CONSTRUCTOR						    \
        || (SYM) == OBJ_TYPE_REF						    \
-
-=== modified file 'gcc/gimple.h'
---- old/gcc/gimple.h	2010-08-10 13:31:21 +0000
-+++ new/gcc/gimple.h	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/gimple.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/gimple.h	2011-07-22 16:59:12.000000000 -0700
++++ gcc-4_5-branch/gcc/gimple.h	2011-07-22 16:59:28.591747691 -0700
 @@ -80,6 +80,7 @@
  enum gimple_rhs_class
  {
@@ -774,10 +769,10 @@
  /* Returns true if GS is a nontemporal move.  */
  
  static inline bool
-
-=== modified file 'gcc/optabs.c'
---- old/gcc/optabs.c	2010-03-19 19:45:01 +0000
-+++ new/gcc/optabs.c	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/optabs.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/optabs.c	2011-07-22 16:58:48.000000000 -0700
++++ gcc-4_5-branch/gcc/optabs.c	2011-07-22 16:59:28.601747691 -0700
 @@ -408,6 +408,20 @@
      case DOT_PROD_EXPR:
        return TYPE_UNSIGNED (type) ? udot_prod_optab : sdot_prod_optab;
@@ -813,21 +808,21 @@
    gcc_assert (icode != CODE_FOR_nothing);
    xmode0 = insn_data[icode].operand[1].mode;
  
-
-=== modified file 'gcc/testsuite/gcc.target/arm/wmul-1.c'
---- old/gcc/testsuite/gcc.target/arm/wmul-1.c	2010-09-01 13:29:58 +0000
-+++ new/gcc/testsuite/gcc.target/arm/wmul-1.c	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/arm/wmul-1.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/testsuite/gcc.target/arm/wmul-1.c	2011-07-22 16:59:24.000000000 -0700
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/arm/wmul-1.c	2011-07-22 16:59:28.601747691 -0700
 @@ -15,4 +15,4 @@
    return sqr;
  }
  
 -/* { dg-final { scan-assembler-times "smulbb" 2 } } */
 +/* { dg-final { scan-assembler-times "smlabb" 2 } } */
-
-=== modified file 'gcc/tree-cfg.c'
---- old/gcc/tree-cfg.c	2010-09-01 13:29:58 +0000
-+++ new/gcc/tree-cfg.c	2010-09-16 09:15:46 +0000
-@@ -3483,6 +3483,65 @@
+Index: gcc-4_5-branch/gcc/tree-cfg.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-cfg.c	2011-07-22 16:59:24.000000000 -0700
++++ gcc-4_5-branch/gcc/tree-cfg.c	2011-07-22 16:59:28.601747691 -0700
+@@ -3484,6 +3484,65 @@
    return false;
  }
  
@@ -893,7 +888,7 @@
  /* Verify a gimple assignment statement STMT with a single rhs.
     Returns true if anything is wrong.  */
  
-@@ -3615,6 +3674,9 @@
+@@ -3616,6 +3675,9 @@
      case GIMPLE_BINARY_RHS:
        return verify_gimple_assign_binary (stmt);
  
@@ -903,11 +898,11 @@
      default:
        gcc_unreachable ();
      }
-
-=== modified file 'gcc/tree-inline.c'
---- old/gcc/tree-inline.c	2010-09-01 13:29:58 +0000
-+++ new/gcc/tree-inline.c	2010-09-16 09:15:46 +0000
-@@ -3199,6 +3199,8 @@
+Index: gcc-4_5-branch/gcc/tree-inline.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-inline.c	2011-07-22 16:59:24.000000000 -0700
++++ gcc-4_5-branch/gcc/tree-inline.c	2011-07-22 16:59:28.601747691 -0700
+@@ -3207,6 +3207,8 @@
      case WIDEN_SUM_EXPR:
      case WIDEN_MULT_EXPR:
      case DOT_PROD_EXPR:
@@ -916,10 +911,10 @@
  
      case VEC_WIDEN_MULT_HI_EXPR:
      case VEC_WIDEN_MULT_LO_EXPR:
-
-=== modified file 'gcc/tree-pretty-print.c'
---- old/gcc/tree-pretty-print.c	2009-11-30 10:36:54 +0000
-+++ new/gcc/tree-pretty-print.c	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/tree-pretty-print.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-pretty-print.c	2011-07-22 16:58:48.000000000 -0700
++++ gcc-4_5-branch/gcc/tree-pretty-print.c	2011-07-22 16:59:28.611747691 -0700
 @@ -1939,6 +1939,26 @@
        pp_string (buffer, " > ");
        break;
@@ -956,10 +951,10 @@
      case MULT_EXPR:
      case TRUNC_DIV_EXPR:
      case CEIL_DIV_EXPR:
-
-=== modified file 'gcc/tree-ssa-ccp.c'
---- old/gcc/tree-ssa-ccp.c	2010-08-10 13:31:21 +0000
-+++ new/gcc/tree-ssa-ccp.c	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/tree-ssa-ccp.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-ssa-ccp.c	2011-07-22 16:59:12.000000000 -0700
++++ gcc-4_5-branch/gcc/tree-ssa-ccp.c	2011-07-22 16:59:28.611747691 -0700
 @@ -915,6 +915,23 @@
  					TREE_TYPE (TREE_OPERAND (addr, 0))));
  }
@@ -1079,10 +1074,10 @@
      case GIMPLE_INVALID_RHS:
        gcc_unreachable ();
      }
-
-=== modified file 'gcc/tree-ssa-dom.c'
---- old/gcc/tree-ssa-dom.c	2010-07-20 11:44:16 +0000
-+++ new/gcc/tree-ssa-dom.c	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/tree-ssa-dom.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-ssa-dom.c	2011-07-22 16:58:48.000000000 -0700
++++ gcc-4_5-branch/gcc/tree-ssa-dom.c	2011-07-22 17:23:51.501747355 -0700
 @@ -54,6 +54,7 @@
    EXPR_SINGLE,
    EXPR_UNARY,
@@ -1101,58 +1096,31 @@
      struct { tree fn; bool pure; size_t nargs; tree *args; } call;
    } ops;
  };
-@@ -214,22 +216,30 @@
-       switch (get_gimple_rhs_class (subcode))
-         {
-         case GIMPLE_SINGLE_RHS:
--          expr->kind = EXPR_SINGLE;
--          expr->ops.single.rhs = gimple_assign_rhs1 (stmt);
--          break;
-+	  expr->kind = EXPR_SINGLE;
-+	  expr->ops.single.rhs = gimple_assign_rhs1 (stmt);
-+	  break;
-         case GIMPLE_UNARY_RHS:
--          expr->kind = EXPR_UNARY;
-+	  expr->kind = EXPR_UNARY;
- 	  expr->type = TREE_TYPE (gimple_assign_lhs (stmt));
--          expr->ops.unary.op = subcode;
--          expr->ops.unary.opnd = gimple_assign_rhs1 (stmt);
--          break;
-+	  expr->ops.unary.op = subcode;
-+	  expr->ops.unary.opnd = gimple_assign_rhs1 (stmt);
-+	  break;
-         case GIMPLE_BINARY_RHS:
--          expr->kind = EXPR_BINARY;
--	  expr->type = TREE_TYPE (gimple_assign_lhs (stmt));
--          expr->ops.binary.op = subcode;
--          expr->ops.binary.opnd0 = gimple_assign_rhs1 (stmt);
--          expr->ops.binary.opnd1 = gimple_assign_rhs2 (stmt);
--          break;
-+	  expr->kind = EXPR_BINARY;
-+	  expr->type = TREE_TYPE (gimple_assign_lhs (stmt));
-+	  expr->ops.binary.op = subcode;
-+	  expr->ops.binary.opnd0 = gimple_assign_rhs1 (stmt);
-+	  expr->ops.binary.opnd1 = gimple_assign_rhs2 (stmt);
-+	  break;
+@@ -229,6 +231,14 @@
+           expr->ops.binary.opnd0 = gimple_assign_rhs1 (stmt);
+           expr->ops.binary.opnd1 = gimple_assign_rhs2 (stmt);
+           break;
 +        case GIMPLE_TERNARY_RHS:
-+	  expr->kind = EXPR_TERNARY;
-+	  expr->type = TREE_TYPE (gimple_assign_lhs (stmt));
-+	  expr->ops.ternary.op = subcode;
-+	  expr->ops.ternary.opnd0 = gimple_assign_rhs1 (stmt);
-+	  expr->ops.ternary.opnd1 = gimple_assign_rhs2 (stmt);
-+	  expr->ops.ternary.opnd2 = gimple_assign_rhs3 (stmt);
-+	  break;
++          expr->kind = EXPR_TERNARY;
++          expr->type = TREE_TYPE (gimple_assign_lhs (stmt));
++          expr->ops.ternary.op = subcode;
++          expr->ops.ternary.opnd0 = gimple_assign_rhs1 (stmt);
++          expr->ops.ternary.opnd1 = gimple_assign_rhs2 (stmt);
++          expr->ops.ternary.opnd2 = gimple_assign_rhs3 (stmt);
++          break;
          default:
            gcc_unreachable ();
          }
-@@ -374,23 +384,40 @@
+@@ -373,23 +383,40 @@
                                expr1->ops.unary.opnd, 0);
  
      case EXPR_BINARY:
 -      {
 -        if (expr0->ops.binary.op != expr1->ops.binary.op)
 -          return false;
--
++      if (expr0->ops.binary.op != expr1->ops.binary.op)
++	return false;
+ 
 -        if (operand_equal_p (expr0->ops.binary.opnd0,
 -                             expr1->ops.binary.opnd0, 0)
 -            && operand_equal_p (expr0->ops.binary.opnd1,
@@ -1166,9 +1134,6 @@
 -                && operand_equal_p (expr0->ops.binary.opnd1,
 -                                    expr1->ops.binary.opnd0, 0));
 -      }
-+      if (expr0->ops.binary.op != expr1->ops.binary.op)
-+	return false;
-+
 +      if (operand_equal_p (expr0->ops.binary.opnd0,
 +			   expr1->ops.binary.opnd0, 0)
 +	  && operand_equal_p (expr0->ops.binary.opnd1,
@@ -1203,7 +1168,7 @@
  
      case EXPR_CALL:
        {
-@@ -453,8 +480,8 @@
+@@ -452,8 +479,8 @@
      case EXPR_BINARY:
        val = iterative_hash_object (expr->ops.binary.op, val);
        if (commutative_tree_code (expr->ops.binary.op))
@@ -1214,7 +1179,7 @@
        else
          {
            val = iterative_hash_expr (expr->ops.binary.opnd0, val);
-@@ -462,6 +489,19 @@
+@@ -461,6 +488,19 @@
          }
        break;
  
@@ -1234,7 +1199,7 @@
      case EXPR_CALL:
        {
          size_t i;
-@@ -514,6 +554,16 @@
+@@ -513,6 +553,16 @@
          print_generic_expr (stream, element->expr.ops.binary.opnd1, 0);
          break;
  
@@ -1251,11 +1216,11 @@
        case EXPR_CALL:
          {
            size_t i;
-
-=== modified file 'gcc/tree-ssa-math-opts.c'
---- old/gcc/tree-ssa-math-opts.c	2010-09-01 13:29:58 +0000
-+++ new/gcc/tree-ssa-math-opts.c	2010-09-16 09:15:46 +0000
-@@ -1261,6 +1261,235 @@
+Index: gcc-4_5-branch/gcc/tree-ssa-math-opts.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-ssa-math-opts.c	2011-07-22 16:59:24.000000000 -0700
++++ gcc-4_5-branch/gcc/tree-ssa-math-opts.c	2011-07-22 16:59:28.611747691 -0700
+@@ -1270,6 +1270,235 @@
   }
  };
  
@@ -1491,7 +1456,7 @@
  /* Find integer multiplications where the operands are extended from
     smaller types, and replace the MULT_EXPR with a WIDEN_MULT_EXPR
     where appropriate.  */
-@@ -1278,94 +1507,19 @@
+@@ -1287,94 +1516,19 @@
        for (gsi = gsi_after_labels (bb); !gsi_end_p (gsi); gsi_next (&gsi))
          {
  	  gimple stmt = gsi_stmt (gsi);
@@ -1499,11 +1464,13 @@
 -	  tree type, type1 = NULL, type2 = NULL;
 -	  tree rhs1, rhs2, rhs1_convop = NULL, rhs2_convop = NULL;
 -	  enum tree_code rhs1_code, rhs2_code;
--
++	  enum tree_code code;
+ 
 -	  if (!is_gimple_assign (stmt)
 -	      || gimple_assign_rhs_code (stmt) != MULT_EXPR)
--	    continue;
--
++	  if (!is_gimple_assign (stmt))
+ 	    continue;
+ 
 -	  type = TREE_TYPE (gimple_assign_lhs (stmt));
 -
 -	  if (TREE_CODE (type) != INTEGER_TYPE)
@@ -1581,11 +1548,6 @@
 -	  gimple_assign_set_rhs_code (stmt, WIDEN_MULT_EXPR);
 -	  update_stmt (stmt);
 -	  changed = true;
-+	  enum tree_code code;
-+
-+	  if (!is_gimple_assign (stmt))
-+	    continue;
-+
 +	  code = gimple_assign_rhs_code (stmt);
 +	  if (code == MULT_EXPR)
 +	    changed |= convert_mult_to_widen (stmt);
@@ -1597,10 +1559,10 @@
    return (changed ? TODO_dump_func | TODO_update_ssa | TODO_verify_ssa
  	  | TODO_verify_stmts : 0);
  }
-
-=== modified file 'gcc/tree-ssa-operands.c'
---- old/gcc/tree-ssa-operands.c	2010-04-02 18:54:46 +0000
-+++ new/gcc/tree-ssa-operands.c	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/tree-ssa-operands.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-ssa-operands.c	2011-07-22 16:58:48.000000000 -0700
++++ gcc-4_5-branch/gcc/tree-ssa-operands.c	2011-07-22 16:59:28.611747691 -0700
 @@ -994,11 +994,13 @@
  
      case DOT_PROD_EXPR:
@@ -1618,11 +1580,11 @@
        }
  
      case FUNCTION_DECL:
-
-=== modified file 'gcc/tree-ssa-sccvn.c'
---- old/gcc/tree-ssa-sccvn.c	2010-05-14 11:40:18 +0000
-+++ new/gcc/tree-ssa-sccvn.c	2010-09-16 09:15:46 +0000
-@@ -2277,6 +2277,10 @@
+Index: gcc-4_5-branch/gcc/tree-ssa-sccvn.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-ssa-sccvn.c	2011-07-22 16:58:48.000000000 -0700
++++ gcc-4_5-branch/gcc/tree-ssa-sccvn.c	2011-07-22 16:59:28.611747691 -0700
+@@ -2298,6 +2298,10 @@
      case GIMPLE_BINARY_RHS:
        return (is_gimple_min_invariant (gimple_assign_rhs1 (stmt))
  	      || is_gimple_min_invariant (gimple_assign_rhs2 (stmt)));
@@ -1633,10 +1595,10 @@
      case GIMPLE_SINGLE_RHS:
        /* Constants inside reference ops are rarely interesting, but
  	 it can take a lot of looking to find them.  */
-
-=== modified file 'gcc/tree-ssa-threadedge.c'
---- old/gcc/tree-ssa-threadedge.c	2009-11-25 10:55:54 +0000
-+++ new/gcc/tree-ssa-threadedge.c	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/tree-ssa-threadedge.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-ssa-threadedge.c	2011-07-22 16:58:48.000000000 -0700
++++ gcc-4_5-branch/gcc/tree-ssa-threadedge.c	2011-07-22 16:59:28.611747691 -0700
 @@ -247,14 +247,14 @@
  
          return fold (rhs);
@@ -1672,10 +1634,10 @@
      default:
        gcc_unreachable ();
      }
-
-=== modified file 'gcc/tree-vrp.c'
---- old/gcc/tree-vrp.c	2010-06-14 14:23:31 +0000
-+++ new/gcc/tree-vrp.c	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/tree-vrp.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-vrp.c	2011-07-22 16:58:48.000000000 -0700
++++ gcc-4_5-branch/gcc/tree-vrp.c	2011-07-22 16:59:28.621747691 -0700
 @@ -864,6 +864,8 @@
  					      gimple_assign_rhs1 (stmt),
  					      gimple_assign_rhs2 (stmt),
@@ -1694,11 +1656,11 @@
      case GIMPLE_SINGLE_RHS:
        return tree_single_nonzero_warnv_p (gimple_assign_rhs1 (stmt),
  					  strict_overflow_p);
-
-=== modified file 'gcc/tree.c'
---- old/gcc/tree.c	2010-08-10 13:31:21 +0000
-+++ new/gcc/tree.c	2010-09-16 09:15:46 +0000
-@@ -6538,6 +6538,23 @@
+Index: gcc-4_5-branch/gcc/tree.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree.c	2011-07-22 16:59:13.000000000 -0700
++++ gcc-4_5-branch/gcc/tree.c	2011-07-22 16:59:28.621747691 -0700
+@@ -6548,6 +6548,23 @@
    return false;
  }
  
@@ -1722,10 +1684,10 @@
  /* Generate a hash value for an expression.  This can be used iteratively
     by passing a previous result as the VAL argument.
  
-
-=== modified file 'gcc/tree.def'
---- old/gcc/tree.def	2010-04-02 18:54:46 +0000
-+++ new/gcc/tree.def	2010-09-16 09:15:46 +0000
+Index: gcc-4_5-branch/gcc/tree.def
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree.def	2011-07-22 16:58:48.000000000 -0700
++++ gcc-4_5-branch/gcc/tree.def	2011-07-22 16:59:28.631747691 -0700
 @@ -1083,6 +1083,18 @@
     the arguments from type t1 to type t2, and then multiplying them.  */
  DEFTREECODE (WIDEN_MULT_EXPR, "widen_mult_expr", tcc_binary, 2)
@@ -1745,11 +1707,11 @@
  /* Whole vector left/right shift in bits.
     Operand 0 is a vector to be shifted.
     Operand 1 is an integer shift amount in bits.  */
-
-=== modified file 'gcc/tree.h'
---- old/gcc/tree.h	2010-08-10 13:31:21 +0000
-+++ new/gcc/tree.h	2010-09-16 09:15:46 +0000
-@@ -4705,6 +4705,7 @@
+Index: gcc-4_5-branch/gcc/tree.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree.h	2011-07-22 16:59:13.000000000 -0700
++++ gcc-4_5-branch/gcc/tree.h	2011-07-22 16:59:28.631747691 -0700
+@@ -4687,6 +4687,7 @@
  extern int type_num_arguments (const_tree);
  extern bool associative_tree_code (enum tree_code);
  extern bool commutative_tree_code (enum tree_code);
@@ -1757,4 +1719,3 @@
  extern tree upper_bound_in_type (tree, tree);
  extern tree lower_bound_in_type (tree, tree);
  extern int operand_equal_for_phi_arg_p (const_tree, const_tree);
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch
index deb749e..1373b83 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99436.patch
@@ -6,8 +6,10 @@
 	(try_combine, simplify_if_then_else): Update.
 
 === modified file 'gcc/combine.c'
---- old/gcc/combine.c	2010-11-04 12:39:28 +0000
-+++ new/gcc/combine.c	2010-11-25 11:11:45 +0000
+Index: gcc-4_5-branch/gcc/combine.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/combine.c	2011-07-22 17:24:46.000000000 -0700
++++ gcc-4_5-branch/gcc/combine.c	2011-07-22 17:34:41.961747206 -0700
 @@ -392,8 +392,8 @@
  static void undo_all (void);
  static void undo_commit (void);
@@ -19,7 +21,7 @@
  static rtx simplify_if_then_else (rtx);
  static rtx simplify_set (rtx);
  static rtx simplify_logical (rtx);
-@@ -2944,12 +2944,12 @@
+@@ -2962,12 +2962,12 @@
  	  if (i1)
  	    {
  	      subst_low_luid = DF_INSN_LUID (i1);
@@ -34,7 +36,7 @@
  	    }
  	}
  
-@@ -2960,7 +2960,7 @@
+@@ -2978,7 +2978,7 @@
  	 to avoid self-referential rtl.  */
  
        subst_low_luid = DF_INSN_LUID (i2);
@@ -43,7 +45,7 @@
  		      ! i1_feeds_i3 && i1dest_in_i1src);
        substed_i2 = 1;
  
-@@ -2991,7 +2991,7 @@
+@@ -3009,7 +3009,7 @@
  
        n_occurrences = 0;
        subst_low_luid = DF_INSN_LUID (i1);
@@ -52,7 +54,7 @@
        substed_i1 = 1;
      }
  
-@@ -3053,7 +3053,7 @@
+@@ -3071,7 +3071,7 @@
  	  else
  	    /* See comment where i2pat is assigned.  */
  	    XVECEXP (newpat, 0, --total_sets)
@@ -61,7 +63,7 @@
  	}
      }
  
-@@ -4605,11 +4605,13 @@
+@@ -4623,11 +4623,13 @@
  
     IN_DEST is nonzero if we are processing the SET_DEST of a SET.
  
@@ -76,7 +78,7 @@
  {
    enum rtx_code code = GET_CODE (x);
    enum machine_mode op0_mode = VOIDmode;
-@@ -4670,7 +4672,7 @@
+@@ -4688,7 +4690,7 @@
        && GET_CODE (XVECEXP (x, 0, 0)) == SET
        && GET_CODE (SET_SRC (XVECEXP (x, 0, 0))) == ASM_OPERANDS)
      {
@@ -85,7 +87,7 @@
  
        /* If this substitution failed, this whole thing fails.  */
        if (GET_CODE (new_rtx) == CLOBBER
-@@ -4687,7 +4689,7 @@
+@@ -4705,7 +4707,7 @@
  	      && GET_CODE (dest) != CC0
  	      && GET_CODE (dest) != PC)
  	    {
@@ -94,7 +96,7 @@
  
  	      /* If this substitution failed, this whole thing fails.  */
  	      if (GET_CODE (new_rtx) == CLOBBER
-@@ -4733,8 +4735,8 @@
+@@ -4751,8 +4753,8 @@
  		    }
  		  else
  		    {
@@ -105,7 +107,7 @@
  
  		      /* If this substitution failed, this whole thing
  			 fails.  */
-@@ -4811,7 +4813,9 @@
+@@ -4829,7 +4831,9 @@
  				&& (code == SUBREG || code == STRICT_LOW_PART
  				    || code == ZERO_EXTRACT))
  			       || code == SET)
@@ -116,7 +118,7 @@
  
  	      /* If we found that we will have to reject this combination,
  		 indicate that by returning the CLOBBER ourselves, rather than
-@@ -4868,7 +4872,7 @@
+@@ -4886,7 +4890,7 @@
        /* If X is sufficiently simple, don't bother trying to do anything
  	 with it.  */
        if (code != CONST_INT && code != REG && code != CLOBBER)
@@ -125,7 +127,7 @@
  
        if (GET_CODE (x) == code)
  	break;
-@@ -4888,10 +4892,12 @@
+@@ -4906,10 +4910,12 @@
     expression.
  
     OP0_MODE is the original mode of XEXP (x, 0).  IN_DEST is nonzero
@@ -140,7 +142,7 @@
  {
    enum rtx_code code = GET_CODE (x);
    enum machine_mode mode = GET_MODE (x);
-@@ -4946,8 +4952,8 @@
+@@ -4964,8 +4970,8 @@
  	     false arms to store-flag values.  Be careful to use copy_rtx
  	     here since true_rtx or false_rtx might share RTL with x as a
  	     result of the if_then_else_cond call above.  */
@@ -151,16 +153,16 @@
  
  	  /* If true_rtx and false_rtx are not general_operands, an if_then_else
  	     is unlikely to be simpler.  */
-@@ -5291,7 +5297,7 @@
+@@ -5309,7 +5315,7 @@
  	{
  	  /* Try to simplify the expression further.  */
  	  rtx tor = simplify_gen_binary (IOR, mode, XEXP (x, 0), XEXP (x, 1));
--	  temp = combine_simplify_rtx (tor, mode, in_dest);
-+	  temp = combine_simplify_rtx (tor, mode, in_dest, 0);
+-	  temp = combine_simplify_rtx (tor, VOIDmode, in_dest);
++	  temp = combine_simplify_rtx (tor, VOIDmode, in_dest, 0);
  
  	  /* If we could, great.  If not, do not go ahead with the IOR
  	     replacement, since PLUS appears in many special purpose
-@@ -5384,7 +5390,16 @@
+@@ -5402,7 +5408,16 @@
  	     ZERO_EXTRACT is indeed appropriate, it will be placed back by
  	     the call to make_compound_operation in the SET case.  */
  
@@ -178,7 +180,7 @@
  	      && new_code == NE && GET_MODE_CLASS (mode) == MODE_INT
  	      && op1 == const0_rtx
  	      && mode == GET_MODE (op0)
-@@ -5628,11 +5643,11 @@
+@@ -5646,11 +5661,11 @@
        if (reg_mentioned_p (from, true_rtx))
  	true_rtx = subst (known_cond (copy_rtx (true_rtx), true_code,
  				      from, true_val),
@@ -192,7 +194,7 @@
  
        SUBST (XEXP (x, 1), swapped ? false_rtx : true_rtx);
        SUBST (XEXP (x, 2), swapped ? true_rtx : false_rtx);
-@@ -5849,11 +5864,11 @@
+@@ -5867,11 +5882,11 @@
  	{
  	  temp = subst (simplify_gen_relational (true_code, m, VOIDmode,
  						 cond_op0, cond_op1),
@@ -206,4 +208,3 @@
  	  temp = simplify_gen_binary (op, m, gen_lowpart (m, z), temp);
  
  	  if (extend_op != UNKNOWN)
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch
new file mode 100644
index 0000000..5337070
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99519.patch
@@ -0,0 +1,25 @@
+2011-07-01  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from mainline.
+	LP 744754
+        2011-04-17  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	* config/arm/arm.c (neon_struct_mem_operand):
+	Support POST_INC/PRE_DEC memory operands.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-05-11 14:47:14 +0000
++++ new/gcc/config/arm/arm.c	2011-06-29 10:46:39 +0000
+@@ -9322,6 +9322,11 @@
+   if (GET_CODE (ind) == REG)
+     return arm_address_register_rtx_p (ind, 0);
+ 
++  /* vldm/vstm allows POST_INC (ia) and PRE_DEC (db).  */
++  if (GET_CODE (ind) == POST_INC
++      || GET_CODE (ind) == PRE_DEC)
++    return arm_address_register_rtx_p (XEXP (ind, 0), 0);
++
+   return FALSE;
+ }
+ 
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch
new file mode 100644
index 0000000..6d2d75b
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99521.patch
@@ -0,0 +1,166 @@
+2011-07-08  Richard Sandiford  <rdsandiford@googlemail.com>
+
+	gcc/
+	* builtins.c (get_object_alignment): Fix comment.
+	* fold-const.c (get_pointer_modulus_and_residue): Remove
+	allow_func_align.  Use get_object_alignment.
+	(fold_binary_loc): Update caller.
+
+2011-07-08  Richard Sandiford  <rdsandiford@googlemail.com>
+
+	gcc/
+	Backport from mainline:
+
+	2011-06-29  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	PR tree-optimization/49545
+	* builtins.c (get_object_alignment_1): Update function comment.
+	Do not use DECL_ALIGN for functions, but test
+	TARGET_PTRMEMFUNC_VBIT_LOCATION instead.
+	* fold-const.c (get_pointer_modulus_and_residue): Don't check
+	for functions here.
+
+	gcc/testsuite/
+	Backport from mainline:
+
+	2011-06-29  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* gcc.dg/torture/pr49169.c: Restrict to ARM and MIPS targets.
+
+2011-07-08  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	Backport from mainline:
+
+	2011-07-27  Richard Guenther  <rguenther@suse.de>
+
+	PR tree-optimization/49169
+	* fold-const.c (get_pointer_modulus_and_residue): Don't rely on
+	the alignment of function decls.
+
+	gcc/testsuite/
+	Backport from mainline:
+
+	2011-07-27  Michael Hope  <michael.hope@linaro.org>
+		    Richard Sandiford  <richard.sandiford@linaro.org>
+
+	PR tree-optimization/49169
+	* gcc.dg/torture/pr49169.c: New test.
+
+=== modified file 'gcc/builtins.c'
+--- old/gcc/builtins.c	2011-01-06 11:02:44 +0000
++++ new/gcc/builtins.c	2011-06-29 09:59:48 +0000
+@@ -263,7 +263,14 @@
+ 
+ /* Return the alignment in bits of EXP, an object.
+    Don't return more than MAX_ALIGN no matter what, ALIGN is the inital
+-   guessed alignment e.g. from type alignment.  */
++   guessed alignment e.g. from type alignment.
++
++   Note that the address (and thus the alignment) computed here is based
++   on the address to which a symbol resolves, whereas DECL_ALIGN is based
++   on the address at which an object is actually located.  These two
++   addresses are not always the same.  For example, on ARM targets,
++   the address &foo of a Thumb function foo() has the lowest bit set,
++   whereas foo() itself starts on an even address.  */
+ 
+ int
+ get_object_alignment (tree exp, unsigned int align, unsigned int max_align)
+@@ -327,7 +334,21 @@
+     exp = DECL_INITIAL (exp);
+   if (DECL_P (exp)
+       && TREE_CODE (exp) != LABEL_DECL)
+-    align = MIN (inner, DECL_ALIGN (exp));
++    {
++      if (TREE_CODE (exp) == FUNCTION_DECL)
++	{
++	  /* Function addresses can encode extra information besides their
++	     alignment.  However, if TARGET_PTRMEMFUNC_VBIT_LOCATION
++	     allows the low bit to be used as a virtual bit, we know
++	     that the address itself must be 2-byte aligned.  */
++	  if (TARGET_PTRMEMFUNC_VBIT_LOCATION == ptrmemfunc_vbit_in_pfn)
++	    align = 2 * BITS_PER_UNIT;
++	  else
++	    align = BITS_PER_UNIT;
++	}
++      else
++	align = MIN (inner, DECL_ALIGN (exp));
++    }
+ #ifdef CONSTANT_ALIGNMENT
+   else if (CONSTANT_CLASS_P (exp))
+     align = MIN (inner, (unsigned)CONSTANT_ALIGNMENT (exp, align));
+
+=== modified file 'gcc/fold-const.c'
+--- old/gcc/fold-const.c	2011-05-05 14:28:53 +0000
++++ new/gcc/fold-const.c	2011-07-08 12:54:44 +0000
+@@ -10030,15 +10030,10 @@
+    0 <= N < M as is common.  In general, the precise value of P is unknown.
+    M is chosen as large as possible such that constant N can be determined.
+ 
+-   Returns M and sets *RESIDUE to N.
+-
+-   If ALLOW_FUNC_ALIGN is true, do take functions' DECL_ALIGN_UNIT into
+-   account.  This is not always possible due to PR 35705.
+- */
++   Returns M and sets *RESIDUE to N.  */
+ 
+ static unsigned HOST_WIDE_INT
+-get_pointer_modulus_and_residue (tree expr, unsigned HOST_WIDE_INT *residue,
+-				 bool allow_func_align)
++get_pointer_modulus_and_residue (tree expr, unsigned HOST_WIDE_INT *residue)
+ {
+   enum tree_code code;
+ 
+@@ -10068,9 +10063,8 @@
+ 	    }
+ 	}
+ 
+-      if (DECL_P (expr)
+-	  && (allow_func_align || TREE_CODE (expr) != FUNCTION_DECL))
+-	return DECL_ALIGN_UNIT (expr);
++      if (DECL_P (expr))
++	return get_object_alignment (expr, BITS_PER_UNIT, ~0U) / BITS_PER_UNIT;
+     }
+   else if (code == POINTER_PLUS_EXPR)
+     {
+@@ -10080,8 +10074,7 @@
+ 
+       op0 = TREE_OPERAND (expr, 0);
+       STRIP_NOPS (op0);
+-      modulus = get_pointer_modulus_and_residue (op0, residue,
+-						 allow_func_align);
++      modulus = get_pointer_modulus_and_residue (op0, residue);
+ 
+       op1 = TREE_OPERAND (expr, 1);
+       STRIP_NOPS (op1);
+@@ -11801,8 +11794,7 @@
+ 	  unsigned HOST_WIDE_INT modulus, residue;
+ 	  unsigned HOST_WIDE_INT low = TREE_INT_CST_LOW (arg1);
+ 
+-	  modulus = get_pointer_modulus_and_residue (arg0, &residue,
+-						     integer_onep (arg1));
++	  modulus = get_pointer_modulus_and_residue (arg0, &residue);
+ 
+ 	  /* This works because modulus is a power of 2.  If this weren't the
+ 	     case, we'd have to replace it by its greatest power-of-2
+
+=== added file 'gcc/testsuite/gcc.dg/torture/pr49169.c'
+--- old/gcc/testsuite/gcc.dg/torture/pr49169.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/torture/pr49169.c	2011-06-29 09:59:48 +0000
+@@ -0,0 +1,15 @@
++/* { dg-do compile { target { arm*-*-* || mips*-*-* } } } */
++
++#include <stdlib.h>
++#include <stdint.h>
++
++int
++main (void)
++{
++  void *p = main;
++  if ((intptr_t) p & 1)
++    abort ();
++  return 0;
++}
++
++/* { dg-final { scan-assembler "abort" } } */
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch
new file mode 100644
index 0000000..cdf44b1
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99522.patch
@@ -0,0 +1,210 @@
+2011-07-11  Revital Eres  <revital.eres@linaro.org>
+
+	Backport from mainline -r175091
+	gcc/
+	* modulo-sched.c (struct ps_insn): Remove row_rest_count field.
+	(struct partial_schedule): Add rows_length field.
+	(verify_partial_schedule): Check rows_length.
+	(ps_insert_empty_row): Handle rows_length.
+	(create_partial_schedule): Likewise.
+	(free_partial_schedule): Likewise.
+	(reset_partial_schedule): Likewise.
+	(create_ps_insn): Remove rest_count argument.
+	(remove_node_from_ps): Update rows_length.
+	(add_node_to_ps): Update rows_length and call create_ps_insn
+	without passing row_rest_count.
+	(rotate_partial_schedule): Update rows_length.
+
+=== modified file 'gcc/modulo-sched.c'
+--- old/gcc/modulo-sched.c	2011-05-13 16:16:22 +0000
++++ new/gcc/modulo-sched.c	2011-07-04 11:39:09 +0000
+@@ -134,8 +134,6 @@
+   ps_insn_ptr next_in_row,
+ 	      prev_in_row;
+ 
+-  /* The number of nodes in the same row that come after this node.  */
+-  int row_rest_count;
+ };
+ 
+ /* Holds the partial schedule as an array of II rows.  Each entry of the
+@@ -149,6 +147,12 @@
+   /* rows[i] points to linked list of insns scheduled in row i (0<=i<ii).  */
+   ps_insn_ptr *rows;
+ 
++  /*  rows_length[i] holds the number of instructions in the row.
++      It is used only (as an optimization) to back off quickly from
++      trying to schedule a node in a full row; that is, to avoid running
++      through futile DFA state transitions.  */
++  int *rows_length;
++  
+   /* The earliest absolute cycle of an insn in the partial schedule.  */
+   int min_cycle;
+ 
+@@ -1907,6 +1911,7 @@
+   int ii = ps->ii;
+   int new_ii = ii + 1;
+   int row;
++  int *rows_length_new;
+ 
+   verify_partial_schedule (ps, sched_nodes);
+ 
+@@ -1921,9 +1926,11 @@
+   rotate_partial_schedule (ps, PS_MIN_CYCLE (ps));
+ 
+   rows_new = (ps_insn_ptr *) xcalloc (new_ii, sizeof (ps_insn_ptr));
++  rows_length_new = (int *) xcalloc (new_ii, sizeof (int));
+   for (row = 0; row < split_row; row++)
+     {
+       rows_new[row] = ps->rows[row];
++      rows_length_new[row] = ps->rows_length[row];
+       ps->rows[row] = NULL;
+       for (crr_insn = rows_new[row];
+ 	   crr_insn; crr_insn = crr_insn->next_in_row)
+@@ -1944,6 +1951,7 @@
+   for (row = split_row; row < ii; row++)
+     {
+       rows_new[row + 1] = ps->rows[row];
++      rows_length_new[row + 1] = ps->rows_length[row];
+       ps->rows[row] = NULL;
+       for (crr_insn = rows_new[row + 1];
+ 	   crr_insn; crr_insn = crr_insn->next_in_row)
+@@ -1965,6 +1973,8 @@
+     + (SMODULO (ps->max_cycle, ii) >= split_row ? 1 : 0);
+   free (ps->rows);
+   ps->rows = rows_new;
++  free (ps->rows_length);
++  ps->rows_length = rows_length_new;
+   ps->ii = new_ii;
+   gcc_assert (ps->min_cycle >= 0);
+ 
+@@ -2040,16 +2050,23 @@
+   ps_insn_ptr crr_insn;
+ 
+   for (row = 0; row < ps->ii; row++)
+-    for (crr_insn = ps->rows[row]; crr_insn; crr_insn = crr_insn->next_in_row)
+-      {
+-	ddg_node_ptr u = crr_insn->node;
+-
+-	gcc_assert (TEST_BIT (sched_nodes, u->cuid));
+-	/* ??? Test also that all nodes of sched_nodes are in ps, perhaps by
+-	   popcount (sched_nodes) == number of insns in ps.  */
+-	gcc_assert (SCHED_TIME (u) >= ps->min_cycle);
+-	gcc_assert (SCHED_TIME (u) <= ps->max_cycle);
+-      }
++    {
++      int length = 0;
++      
++      for (crr_insn = ps->rows[row]; crr_insn; crr_insn = crr_insn->next_in_row)
++	{
++	  ddg_node_ptr u = crr_insn->node;
++	  
++	  length++;
++	  gcc_assert (TEST_BIT (sched_nodes, u->cuid));
++	  /* ??? Test also that all nodes of sched_nodes are in ps, perhaps by
++	     popcount (sched_nodes) == number of insns in ps.  */
++	  gcc_assert (SCHED_TIME (u) >= ps->min_cycle);
++	  gcc_assert (SCHED_TIME (u) <= ps->max_cycle);
++	}
++      
++      gcc_assert (ps->rows_length[row] == length);
++    }
+ }
+ 
+ 
+@@ -2455,6 +2472,7 @@
+ {
+   partial_schedule_ptr ps = XNEW (struct partial_schedule);
+   ps->rows = (ps_insn_ptr *) xcalloc (ii, sizeof (ps_insn_ptr));
++  ps->rows_length = (int *) xcalloc (ii, sizeof (int));
+   ps->ii = ii;
+   ps->history = history;
+   ps->min_cycle = INT_MAX;
+@@ -2493,6 +2511,7 @@
+     return;
+   free_ps_insns (ps);
+   free (ps->rows);
++  free (ps->rows_length);
+   free (ps);
+ }
+ 
+@@ -2510,6 +2529,8 @@
+   ps->rows = (ps_insn_ptr *) xrealloc (ps->rows, new_ii
+ 						 * sizeof (ps_insn_ptr));
+   memset (ps->rows, 0, new_ii * sizeof (ps_insn_ptr));
++  ps->rows_length = (int *) xrealloc (ps->rows_length, new_ii * sizeof (int));
++  memset (ps->rows_length, 0, new_ii * sizeof (int));
+   ps->ii = new_ii;
+   ps->min_cycle = INT_MAX;
+   ps->max_cycle = INT_MIN;
+@@ -2538,14 +2559,13 @@
+ 
+ /* Creates an object of PS_INSN and initializes it to the given parameters.  */
+ static ps_insn_ptr
+-create_ps_insn (ddg_node_ptr node, int rest_count, int cycle)
++create_ps_insn (ddg_node_ptr node, int cycle)
+ {
+   ps_insn_ptr ps_i = XNEW (struct ps_insn);
+ 
+   ps_i->node = node;
+   ps_i->next_in_row = NULL;
+   ps_i->prev_in_row = NULL;
+-  ps_i->row_rest_count = rest_count;
+   ps_i->cycle = cycle;
+ 
+   return ps_i;
+@@ -2578,6 +2598,8 @@
+       if (ps_i->next_in_row)
+ 	ps_i->next_in_row->prev_in_row = ps_i->prev_in_row;
+     }
++   
++  ps->rows_length[row] -= 1; 
+   free (ps_i);
+   return true;
+ }
+@@ -2734,17 +2756,12 @@
+ 		sbitmap must_precede, sbitmap must_follow)
+ {
+   ps_insn_ptr ps_i;
+-  int rest_count = 1;
+   int row = SMODULO (cycle, ps->ii);
+ 
+-  if (ps->rows[row]
+-      && ps->rows[row]->row_rest_count >= issue_rate)
++  if (ps->rows_length[row] >= issue_rate)
+     return NULL;
+ 
+-  if (ps->rows[row])
+-    rest_count += ps->rows[row]->row_rest_count;
+-
+-  ps_i = create_ps_insn (node, rest_count, cycle);
++  ps_i = create_ps_insn (node, cycle);
+ 
+   /* Finds and inserts PS_I according to MUST_FOLLOW and
+      MUST_PRECEDE.  */
+@@ -2754,6 +2771,7 @@
+       return NULL;
+     }
+ 
++  ps->rows_length[row] += 1;
+   return ps_i;
+ }
+ 
+@@ -2909,11 +2927,16 @@
+   for (i = 0; i < backward_rotates; i++)
+     {
+       ps_insn_ptr first_row = ps->rows[0];
++      int first_row_length = ps->rows_length[0];
+ 
+       for (row = 0; row < last_row; row++)
+-	ps->rows[row] = ps->rows[row+1];
++	{
++	  ps->rows[row] = ps->rows[row + 1];
++	  ps->rows_length[row] = ps->rows_length[row + 1]; 
++	}
+ 
+       ps->rows[last_row] = first_row;
++      ps->rows_length[last_row] = first_row_length;
+     }
+ 
+   ps->max_cycle -= start_cycle;
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch
new file mode 100644
index 0000000..64eb237
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99523.patch
@@ -0,0 +1,119 @@
+2011-07-14  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	Backport from mainline:
+	gcc/
+	2011-07-07  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* reload1.c (choose_reload_regs): Use mode sizes to check whether
+	an old reload register completely defines the required value.
+
+	gcc/testsuite/
+	2011-07-07  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* gcc.target/arm/neon-modes-3.c: New test.
+
+=== modified file 'gcc/reload1.c'
+--- old/gcc/reload1.c	2011-07-01 09:27:50 +0000
++++ new/gcc/reload1.c	2011-07-11 10:05:08 +0000
+@@ -6449,6 +6449,8 @@
+ 
+ 	      if (regno >= 0
+ 		  && reg_last_reload_reg[regno] != 0
++		  && (GET_MODE_SIZE (GET_MODE (reg_last_reload_reg[regno]))
++		      >= GET_MODE_SIZE (mode) + byte)
+ #ifdef CANNOT_CHANGE_MODE_CLASS
+ 		  /* Verify that the register it's in can be used in
+ 		     mode MODE.  */
+@@ -6460,24 +6462,12 @@
+ 		{
+ 		  enum reg_class rclass = rld[r].rclass, last_class;
+ 		  rtx last_reg = reg_last_reload_reg[regno];
+-		  enum machine_mode need_mode;
+ 
+ 		  i = REGNO (last_reg);
+ 		  i += subreg_regno_offset (i, GET_MODE (last_reg), byte, mode);
+ 		  last_class = REGNO_REG_CLASS (i);
+ 
+-		  if (byte == 0)
+-		    need_mode = mode;
+-		  else
+-		    need_mode
+-		      = smallest_mode_for_size
+-		        (GET_MODE_BITSIZE (mode) + byte * BITS_PER_UNIT,
+-			 GET_MODE_CLASS (mode) == MODE_PARTIAL_INT
+-			 ? MODE_INT : GET_MODE_CLASS (mode));
+-
+-		  if ((GET_MODE_SIZE (GET_MODE (last_reg))
+-		       >= GET_MODE_SIZE (need_mode))
+-		      && reg_reloaded_contents[i] == regno
++		  if (reg_reloaded_contents[i] == regno
+ 		      && TEST_HARD_REG_BIT (reg_reloaded_valid, i)
+ 		      && HARD_REGNO_MODE_OK (i, rld[r].mode)
+ 		      && (TEST_HARD_REG_BIT (reg_class_contents[(int) rclass], i)
+
+=== added file 'gcc/testsuite/gcc.target/arm/neon-modes-3.c'
+--- old/gcc/testsuite/gcc.target/arm/neon-modes-3.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon-modes-3.c	2011-07-11 10:05:08 +0000
+@@ -0,0 +1,61 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-options "-O" } */
++/* { dg-add-options arm_neon } */
++
++#include <arm_neon.h>
++
++void f1 (volatile float32x4_t *dest, volatile float32x4x4_t *src, int n)
++{
++  float32x4x4_t a5, a6, a7, a8, a9;
++  int i;
++
++  a5 = *src;
++  a6 = *src;
++  a7 = *src;
++  a8 = *src;
++  a9 = *src;
++  while (n--)
++    {
++      for (i = 0; i < 8; i++)
++	{
++	  float32x4x4_t a0, a1, a2, a3, a4;
++
++	  a0 = *src;
++	  a1 = *src;
++	  a2 = *src;
++	  a3 = *src;
++	  a4 = *src;
++	  *src = a0;
++	  *dest = a0.val[0];
++	  *dest = a0.val[3];
++	  *src = a1;
++	  *dest = a1.val[0];
++	  *dest = a1.val[3];
++	  *src = a2;
++	  *dest = a2.val[0];
++	  *dest = a2.val[3];
++	  *src = a3;
++	  *dest = a3.val[0];
++	  *dest = a3.val[3];
++	  *src = a4;
++	  *dest = a4.val[0];
++	  *dest = a4.val[3];
++	}
++      *src = a5;
++      *dest = a5.val[0];
++      *dest = a5.val[3];
++      *src = a6;
++      *dest = a6.val[0];
++      *dest = a6.val[3];
++      *src = a7;
++      *dest = a7.val[0];
++      *dest = a7.val[3];
++      *src = a8;
++      *dest = a8.val[0];
++      *dest = a8.val[3];
++      *src = a9;
++      *dest = a9.val[0];
++      *dest = a9.val[3];
++    }
++}
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch
new file mode 100644
index 0000000..2e8e12d
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99524.patch
@@ -0,0 +1,209 @@
+ 2011-07-14  Richard Sandiford  <richard.sandiford@linaro.org>
+ 
+	gcc/
+	* config/arm/arm.h (ARM_LEGITIMIZE_RELOAD_ADDRESS): Apply the
+	arm_legitimize_reload_address changes marked [*] below.
+
+	Backport from mainline:
+
+	2011-04-20  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	[*] config/arm/arm.c (arm_legitimize_reload_address): For NEON
+	quad-word modes, reduce to 9-bit index range when above 1016
+	limit.
+
+	2011-04-11  Chung-Lin Tang  <cltang@codesourcery.com>
+		    Richard Earnshaw  <rearnsha@arm.com>
+
+	PR target/48250
+	[*] config/arm/arm.c (arm_legitimize_reload_address): Update cases
+	to use sign-magnitude offsets. Reject unsupported unaligned
+	cases. Add detailed description in comments.
+	* config/arm/arm.md (reload_outdf): Disable for ARM mode; change
+	condition from TARGET_32BIT to TARGET_ARM.
+
+=== modified file 'gcc/config/arm/arm.h'
+--- old/gcc/config/arm/arm.h	2011-04-20 10:07:36 +0000
++++ new/gcc/config/arm/arm.h	2011-07-12 16:35:20 +0000
+@@ -1399,6 +1399,11 @@
+     ? GENERAL_REGS : NO_REGS)					\
+    : THUMB_SECONDARY_INPUT_RELOAD_CLASS (CLASS, MODE, X)))
+ 
++#define SIGN_MAG_LOW_ADDR_BITS(VAL, N)					\
++      (((VAL) & ((1 << (N)) - 1))					\
++       ? (((VAL) & ((1 << ((N) + 1)) - 1)) ^ (1 << (N))) - (1 << (N))	\
++       : 0)
++
+ /* Try a machine-dependent way of reloading an illegitimate address
+    operand.  If we find one, push the reload and jump to WIN.  This
+    macro is used in only one place: `find_reloads_address' in reload.c.
+@@ -1418,26 +1423,135 @@
+ 	  HOST_WIDE_INT val = INTVAL (XEXP (X, 1));			   \
+ 	  HOST_WIDE_INT low, high;					   \
+ 									   \
+-	  if (MODE == DImode || (MODE == DFmode && TARGET_SOFT_FLOAT))	   \
+-	    low = ((val & 0xf) ^ 0x8) - 0x8;				   \
+-	  else if (TARGET_MAVERICK && TARGET_HARD_FLOAT)		   \
+-	    /* Need to be careful, -256 is not a valid offset.  */	   \
+-	    low = val >= 0 ? (val & 0xff) : -((-val) & 0xff);		   \
+-	  else if (TARGET_REALLY_IWMMXT && MODE == SImode)		   \
+-	    /* Need to be careful, -1024 is not a valid offset.  */	   \
+-	    low = val >= 0 ? (val & 0x3ff) : -((-val) & 0x3ff);		   \
+-	  else if (MODE == SImode					   \
+-		   || (MODE == SFmode && TARGET_SOFT_FLOAT)		   \
+-		   || ((MODE == HImode || MODE == QImode) && ! arm_arch4)) \
+-	    /* Need to be careful, -4096 is not a valid offset.  */	   \
+-	    low = val >= 0 ? (val & 0xfff) : -((-val) & 0xfff);		   \
+-	  else if ((MODE == HImode || MODE == QImode) && arm_arch4)	   \
+-	    /* Need to be careful, -256 is not a valid offset.  */	   \
+-	    low = val >= 0 ? (val & 0xff) : -((-val) & 0xff);		   \
+-	  else if (GET_MODE_CLASS (MODE) == MODE_FLOAT			   \
+-		   && TARGET_HARD_FLOAT && TARGET_FPA)			   \
+-	    /* Need to be careful, -1024 is not a valid offset.  */	   \
+-	    low = val >= 0 ? (val & 0x3ff) : -((-val) & 0x3ff);		   \
++	  /* Detect coprocessor load/stores.  */			   \
++	  bool coproc_p = ((TARGET_HARD_FLOAT				   \
++			    && (TARGET_VFP || TARGET_FPA || TARGET_MAVERICK) \
++			    && (mode == SFmode || mode == DFmode	   \
++				|| (mode == DImode && TARGET_MAVERICK)))   \
++			   || (TARGET_REALLY_IWMMXT			   \
++			       && VALID_IWMMXT_REG_MODE (mode))		   \
++			   || (TARGET_NEON				   \
++			       && (VALID_NEON_DREG_MODE (mode)		   \
++				   || VALID_NEON_QREG_MODE (mode))));	   \
++									   \
++	  /* For some conditions, bail out when lower two bits are	   \
++	     unaligned.  */						   \
++	  if ((val & 0x3) != 0						   \
++	      /* Coprocessor load/store indexes are 8-bits + '00'	   \
++		 appended.  */						   \
++	      && (coproc_p 						   \
++		  /* For DI, and DF under soft-float: */		   \
++		  || ((mode == DImode || mode == DFmode)		   \
++		      /* Without ldrd, we use stm/ldm, which does not	   \
++			 fair well with unaligned bits.  */		   \
++		      && (! TARGET_LDRD					   \
++			  /* Thumb-2 ldrd/strd is [-1020,+1020] in	   \
++			     steps of 4.  */				   \
++			  || TARGET_THUMB2))))				   \
++	    break;						   	   \
++									   \
++	  /* When breaking down a [reg+index] reload address into	   \
++	     [(reg+high)+low], of which the (reg+high) gets turned into	   \
++	     a reload add insn, we try to decompose the index into	   \
++	     high/low values that can often also lead to better reload	   \
++	     CSE.  For example:						   \
++		     ldr r0, [r2, #4100]  // Offset too large		   \
++		     ldr r1, [r2, #4104]  // Offset too large		   \
++									   \
++	     is best reloaded as:					   \
++		     add t1, r2, #4096					   \
++		     ldr r0, [t1, #4]					   \
++		     add t2, r2, #4096					   \
++		     ldr r1, [t2, #8]					   \
++									   \
++	     which post-reload CSE can simplify in most cases to eliminate \
++	     the second add instruction:				   \
++		     add t1, r2, #4096					   \
++		     ldr r0, [t1, #4]					   \
++		     ldr r1, [t1, #8]					   \
++									   \
++	     The idea here is that we want to split out the bits of the	   \
++	     constant as a mask, rather than as subtracting the maximum	   \
++	     offset that the respective type of load/store used can	   \
++	     handle.							   \
++									   \
++	     When encountering negative offsets, we can still utilize it   \
++	     even if the overall offset is positive; sometimes this may	   \
++	     lead to an immediate that can be constructed with fewer	   \
++	     instructions.  For example:				   \
++		     ldr r0, [r2, #0x3FFFFC]				   \
++									   \
++	     This is best reloaded as:					   \
++		     add t1, r2, #0x400000				   \
++		     ldr r0, [t1, #-4]					   \
++									   \
++	     The trick for spotting this for a load insn with N bits of	   \
++	     offset (i.e. bits N-1:0) is to look at bit N; if it is set,   \
++	     then chose a negative offset that is going to make bit N and  \
++	     all the bits below it become zero in the remainder part.	   \
++									   \
++	     The SIGN_MAG_LOW_ADDR_BITS macro below implements this,	   \
++	     with respect to sign-magnitude addressing (i.e. separate	   \
++	     +- bit, or 1's complement), used in most cases of ARM	   \
++	     load/store instructions.  */				   \
++									   \
++	  if (coproc_p)							   \
++	    {								   \
++	      low = SIGN_MAG_LOW_ADDR_BITS (val, 10);			   \
++									   \
++	      /* NEON quad-word load/stores are made of two double-word	   \
++		 accesses, so the valid index range is reduced by 8.	   \
++		 Treat as 9-bit range if we go over it.  */		   \
++	      if (TARGET_NEON && VALID_NEON_QREG_MODE (mode) && low >= 1016) \
++		low = SIGN_MAG_LOW_ADDR_BITS (val, 9);			   \
++	    }								   \
++	  else if (GET_MODE_SIZE (mode) == 8)				   \
++	    {								   \
++	      if (TARGET_LDRD)						   \
++		low = (TARGET_THUMB2					   \
++		       ? SIGN_MAG_LOW_ADDR_BITS (val, 10)		   \
++		       : SIGN_MAG_LOW_ADDR_BITS (val, 8));		   \
++	      else							   \
++		/* For pre-ARMv5TE (without ldrd), we use ldm/stm(db/da/ib) \
++		   to access doublewords. The supported load/store offsets \
++		   are -8, -4, and 4, which we try to produce here.  */	   \
++		low = ((val & 0xf) ^ 0x8) - 0x8;			   \
++	    }								   \
++	  else if (GET_MODE_SIZE (mode) < 8)				   \
++	    {								   \
++	      /* NEON element load/stores do not have an offset.  */	   \
++	      if (TARGET_NEON_FP16 && mode == HFmode)			   \
++		break;							   \
++									   \
++	      if (TARGET_THUMB2)					   \
++		{							   \
++		  /* Thumb-2 has an asymmetrical index range of (-256,4096). \
++		     Try the wider 12-bit range first, and re-try if the   \
++		     result is out of range.  */			   \
++		  low = SIGN_MAG_LOW_ADDR_BITS (val, 12);		   \
++		  if (low < -255)					   \
++		    low = SIGN_MAG_LOW_ADDR_BITS (val, 8);		   \
++		}							   \
++	      else							   \
++		{							   \
++		  if (mode == HImode || mode == HFmode)			   \
++		    {							   \
++		      if (arm_arch4)					   \
++			low = SIGN_MAG_LOW_ADDR_BITS (val, 8);		   \
++		      else						   \
++			{						   \
++			  /* The storehi/movhi_bytes fallbacks can use	   \
++			     only [-4094,+4094] of the full ldrb/strb	   \
++			     index range.  */				   \
++			  low = SIGN_MAG_LOW_ADDR_BITS (val, 12);	   \
++			  if (low == 4095 || low == -4095)		   \
++			    break;					   \
++			}						   \
++		    }							   \
++		  else							   \
++		    low = SIGN_MAG_LOW_ADDR_BITS (val, 12);		   \
++		}							   \
++	    }								   \
+ 	  else								   \
+ 	    break;							   \
+ 									   \
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-04-28 16:13:24 +0000
++++ new/gcc/config/arm/arm.md	2011-07-12 16:35:20 +0000
+@@ -6167,7 +6167,7 @@
+   [(match_operand:DF 0 "arm_reload_memory_operand" "=o")
+    (match_operand:DF 1 "s_register_operand" "r")
+    (match_operand:SI 2 "s_register_operand" "=&r")]
+-  "TARGET_32BIT"
++  "TARGET_THUMB2"
+   "
+   {
+     enum rtx_code code = GET_CODE (XEXP (operands[0], 0));
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch
new file mode 100644
index 0000000..560a830
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99525.patch
@@ -0,0 +1,67 @@
+2011-07-15  Michael Hope  <michael.hope@linaro.org>
+
+	gcc/
+	Backport from mainline:
+
+	2011-04-05  Eric Botcazou  <ebotcazou@adacore.com>
+
+	* ifcvt.c (cond_exec_process_insns): Disallow converting a block
+	that contains the prologue.
+
+	gcc/testsuite/
+	Backport from mainline:
+
+	2011-04-01  Bernd Schmidt  <bernds@codesourcery.com>
+
+	* gcc.c-torture/compile/20110401-1.c: New test.
+
+=== modified file 'gcc/ifcvt.c'
+--- old/gcc/ifcvt.c	2011-05-05 14:28:53 +0000
++++ new/gcc/ifcvt.c	2011-07-11 04:08:33 +0000
+@@ -1,5 +1,6 @@
+ /* If-conversion support.
+-   Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2010
++   Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2010,
++   2011
+    Free Software Foundation, Inc.
+ 
+    This file is part of GCC.
+@@ -311,6 +312,10 @@
+ 
+   for (insn = start; ; insn = NEXT_INSN (insn))
+     {
++      /* dwarf2out can't cope with conditional prologues.  */
++      if (NOTE_P (insn) && NOTE_KIND (insn) == NOTE_INSN_PROLOGUE_END)
++	return FALSE;
++
+       if (NOTE_P (insn) || DEBUG_INSN_P (insn))
+ 	goto insn_done;
+ 
+
+=== added file 'gcc/testsuite/gcc.c-torture/compile/20110401-1.c'
+--- old/gcc/testsuite/gcc.c-torture/compile/20110401-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.c-torture/compile/20110401-1.c	2011-07-11 04:08:33 +0000
+@@ -0,0 +1,22 @@
++void asn1_length_der (unsigned long int len, unsigned char *ans, int *ans_len)
++{
++    int k;
++    unsigned char temp[4];
++    if (len < 128) {
++	if (ans != ((void *) 0))
++	    ans[0] = (unsigned char) len;
++	*ans_len = 1;
++    } else {
++	k = 0;
++	while (len) {
++	    temp[k++] = len & 0xFF;
++	    len = len >> 8;
++	}
++	*ans_len = k + 1;
++	if (ans != ((void *) 0)) {
++	    ans[0] = ((unsigned char) k & 0x7F) + 128;
++	    while (k--)
++		ans[*ans_len - 1 - k] = temp[k];
++	}
++    }
++}
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch
new file mode 100644
index 0000000..8743583
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99528.patch
@@ -0,0 +1,138 @@
+2011-07-19  Revital Eres  <revital.eres@linaro.org>
+
+	Backport from mainline -r175090
+	gcc/
+	* ddg.c (add_intra_loop_mem_dep): New function.
+	(build_intra_loop_deps): Call it.
+
+	gcc/testsuite
+	* gcc.dg/sms-9.c: New file.
+
+=== modified file 'gcc/ddg.c'
+--- old/gcc/ddg.c	2011-05-13 16:16:22 +0000
++++ new/gcc/ddg.c	2011-07-05 09:02:18 +0000
+@@ -352,6 +352,33 @@
+ }
+ 
+ 
++/* Given two nodes, analyze their RTL insns and add intra-loop mem deps
++   to ddg G.  */
++static void
++add_intra_loop_mem_dep (ddg_ptr g, ddg_node_ptr from, ddg_node_ptr to)
++{
++
++  if ((from->cuid == to->cuid)
++      || !insn_alias_sets_conflict_p (from->insn, to->insn))
++    /* Do not create edge if memory references have disjoint alias sets
++       or 'to' and 'from' are the same instruction.  */
++    return;
++
++  if (mem_write_insn_p (from->insn))
++    {
++      if (mem_read_insn_p (to->insn))
++	create_ddg_dep_no_link (g, from, to,
++				DEBUG_INSN_P (to->insn)
++				? ANTI_DEP : TRUE_DEP, MEM_DEP, 0);
++      else
++	create_ddg_dep_no_link (g, from, to,
++				DEBUG_INSN_P (to->insn)
++				? ANTI_DEP : OUTPUT_DEP, MEM_DEP, 0);
++    }
++  else if (!mem_read_insn_p (to->insn))
++    create_ddg_dep_no_link (g, from, to, ANTI_DEP, MEM_DEP, 0);
++}
++
+ /* Given two nodes, analyze their RTL insns and add inter-loop mem deps
+    to ddg G.  */
+ static void
+@@ -439,10 +466,22 @@
+ 	      if (DEBUG_INSN_P (j_node->insn))
+ 		continue;
+ 	      if (mem_access_insn_p (j_node->insn))
+- 		/* Don't bother calculating inter-loop dep if an intra-loop dep
+-		   already exists.  */
++		{
++		  /* Don't bother calculating inter-loop dep if an intra-loop dep
++		     already exists.  */
+ 	      	  if (! TEST_BIT (dest_node->successors, j))
+ 		    add_inter_loop_mem_dep (g, dest_node, j_node);
++		  /* If -fmodulo-sched-allow-regmoves
++		     is set certain anti-dep edges are not created.
++		     It might be that these anti-dep edges are on the
++		     path from one memory instruction to another such that
++		     removing these edges could cause a violation of the
++		     memory dependencies.  Thus we add intra edges between
++		     every two memory instructions in this case.  */
++		  if (flag_modulo_sched_allow_regmoves
++		      && !TEST_BIT (dest_node->predecessors, j))
++		    add_intra_loop_mem_dep (g, j_node, dest_node);
++		}
+             }
+         }
+     }
+
+=== added file 'gcc/testsuite/gcc.dg/sms-9.c'
+--- old/gcc/testsuite/gcc.dg/sms-9.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/sms-9.c	2011-07-04 11:13:26 +0000
+@@ -0,0 +1,60 @@
++/* { dg-do run } */
++/* { dg-options "-O2 -fmodulo-sched -fno-auto-inc-dec -O2 -fmodulo-sched-allow-regmoves" } */
++
++#include <stdlib.h>
++#include <stdarg.h>
++
++struct df_ref_info
++{
++  unsigned int *begin;
++  unsigned int *count;
++};
++
++extern void *memset (void *s, int c, __SIZE_TYPE__ n);
++
++
++__attribute__ ((noinline))
++     int
++     df_reorganize_refs_by_reg_by_insn (struct df_ref_info *ref_info,
++					int num, unsigned int start)
++{
++  unsigned int m = num;
++  unsigned int offset = 77;
++  unsigned int r;
++
++  for (r = start; r < m; r++)
++    {
++      ref_info->begin[r] = offset;
++      offset += ref_info->count[r];
++      ref_info->count[r] = 0;
++    }
++
++  return offset;
++}
++
++int
++main ()
++{
++  struct df_ref_info temp;
++  int num = 100;
++  unsigned int start = 5;
++  int i, offset;
++
++  temp.begin = malloc (100 * sizeof (unsigned int));
++  temp.count = malloc (100 * sizeof (unsigned int));
++
++  memset (temp.begin, 0, sizeof (unsigned int) * num);
++  memset (temp.count, 0, sizeof (unsigned int) * num);
++
++  for (i = 0; i < num; i++)
++    temp.count[i] = i + 1;
++
++  offset = df_reorganize_refs_by_reg_by_insn (&temp, num, start);
++
++  if (offset != 5112)
++    abort ();
++
++  free (temp.begin);
++  free (temp.count);
++  return 0;
++}
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch
new file mode 100644
index 0000000..f0f6a94
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99529.patch
@@ -0,0 +1,741 @@
+2011-07-21  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	PR middle-end/49736
+	* expr.c (all_zeros_p): Undo bogus part of last change.
+
+2011-07-21  Richard Sandiford  <rdsandiford@googlemail.com>
+
+	Backport from mainline:
+	gcc/cp/
+	2011-07-13  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* typeck2.c (split_nonconstant_init_1): Pass the initializer directly,
+	rather than a pointer to it.  Return true if the whole of the value
+	was initialized by the generated statements.  Use
+	complete_ctor_at_level_p instead of count_type_elements.
+
+	gcc/
+	2011-07-13  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* tree.h (categorize_ctor_elements): Remove comment.  Fix long line.
+	(count_type_elements): Delete.
+	(complete_ctor_at_level_p): Declare.
+	* expr.c (flexible_array_member_p): New function, split out from...
+	(count_type_elements): ...here.  Make static.  Replace allow_flexarr
+	parameter with for_ctor_p.  When for_ctor_p is true, return the
+	number of elements that should appear in the top-level constructor,
+	otherwise return an estimate of the number of scalars.
+	(categorize_ctor_elements): Replace p_must_clear with p_complete.
+	(categorize_ctor_elements_1): Likewise.  Use complete_ctor_at_level_p.
+	(complete_ctor_at_level_p): New function, borrowing union logic
+	from old categorize_ctor_elements_1.
+	(mostly_zeros_p): Return true if the constructor is not complete.
+	(all_zeros_p): Update call to categorize_ctor_elements.
+	* gimplify.c (gimplify_init_constructor): Update call to
+	categorize_ctor_elements.  Don't call count_type_elements.
+	Unconditionally prevent clearing for variable-sized types,
+	otherwise rely on categorize_ctor_elements to detect
+	incomplete initializers.
+
+	gcc/testsuite/
+	2011-07-13  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	* gcc.target/arm/pr48183.c: New test.
+
+=== modified file 'gcc/cp/typeck2.c'
+--- old/gcc/cp/typeck2.c	2010-07-30 14:05:57 +0000
++++ new/gcc/cp/typeck2.c	2011-07-13 13:36:36 +0000
+@@ -546,18 +546,20 @@
+ 
+ 
+ /* The recursive part of split_nonconstant_init.  DEST is an lvalue
+-   expression to which INIT should be assigned.  INIT is a CONSTRUCTOR.  */
++   expression to which INIT should be assigned.  INIT is a CONSTRUCTOR.
++   Return true if the whole of the value was initialized by the
++   generated statements.  */
+ 
+-static void
+-split_nonconstant_init_1 (tree dest, tree *initp)
++static bool
++split_nonconstant_init_1 (tree dest, tree init)
+ {
+   unsigned HOST_WIDE_INT idx;
+-  tree init = *initp;
+   tree field_index, value;
+   tree type = TREE_TYPE (dest);
+   tree inner_type = NULL;
+   bool array_type_p = false;
+-  HOST_WIDE_INT num_type_elements, num_initialized_elements;
++  bool complete_p = true;
++  HOST_WIDE_INT num_split_elts = 0;
+ 
+   switch (TREE_CODE (type))
+     {
+@@ -569,7 +571,6 @@
+     case RECORD_TYPE:
+     case UNION_TYPE:
+     case QUAL_UNION_TYPE:
+-      num_initialized_elements = 0;
+       FOR_EACH_CONSTRUCTOR_ELT (CONSTRUCTOR_ELTS (init), idx,
+ 				field_index, value)
+ 	{
+@@ -592,13 +593,14 @@
+ 		sub = build3 (COMPONENT_REF, inner_type, dest, field_index,
+ 			      NULL_TREE);
+ 
+-	      split_nonconstant_init_1 (sub, &value);
++	      if (!split_nonconstant_init_1 (sub, value))
++		complete_p = false;
++	      num_split_elts++;
+ 	    }
+ 	  else if (!initializer_constant_valid_p (value, inner_type))
+ 	    {
+ 	      tree code;
+ 	      tree sub;
+-	      HOST_WIDE_INT inner_elements;
+ 
+ 	      /* FIXME: Ordered removal is O(1) so the whole function is
+ 		 worst-case quadratic. This could be fixed using an aside
+@@ -622,21 +624,9 @@
+ 	      code = build_stmt (input_location, EXPR_STMT, code);
+ 	      add_stmt (code);
+ 
+-	      inner_elements = count_type_elements (inner_type, true);
+-	      if (inner_elements < 0)
+-		num_initialized_elements = -1;
+-	      else if (num_initialized_elements >= 0)
+-		num_initialized_elements += inner_elements;
+-	      continue;
++	      num_split_elts++;
+ 	    }
+ 	}
+-
+-      num_type_elements = count_type_elements (type, true);
+-      /* If all elements of the initializer are non-constant and
+-	 have been split out, we don't need the empty CONSTRUCTOR.  */
+-      if (num_type_elements > 0
+-	  && num_type_elements == num_initialized_elements)
+-	*initp = NULL;
+       break;
+ 
+     case VECTOR_TYPE:
+@@ -648,6 +638,7 @@
+ 	  code = build2 (MODIFY_EXPR, type, dest, cons);
+ 	  code = build_stmt (input_location, EXPR_STMT, code);
+ 	  add_stmt (code);
++	  num_split_elts += CONSTRUCTOR_NELTS (init);
+ 	}
+       break;
+ 
+@@ -657,6 +648,8 @@
+ 
+   /* The rest of the initializer is now a constant. */
+   TREE_CONSTANT (init) = 1;
++  return complete_p && complete_ctor_at_level_p (TREE_TYPE (init),
++						 num_split_elts, inner_type);
+ }
+ 
+ /* A subroutine of store_init_value.  Splits non-constant static
+@@ -672,7 +665,8 @@
+   if (TREE_CODE (init) == CONSTRUCTOR)
+     {
+       code = push_stmt_list ();
+-      split_nonconstant_init_1 (dest, &init);
++      if (split_nonconstant_init_1 (dest, init))
++	init = NULL_TREE;
+       code = pop_stmt_list (code);
+       DECL_INITIAL (dest) = init;
+       TREE_READONLY (dest) = 0;
+
+=== modified file 'gcc/expr.c'
+--- old/gcc/expr.c	2011-04-20 10:07:36 +0000
++++ new/gcc/expr.c	2011-07-14 11:52:06 +0000
+@@ -4860,16 +4860,136 @@
+   return NULL_RTX;
+ }
+ 
++/* Return true if field F of structure TYPE is a flexible array.  */
++
++static bool
++flexible_array_member_p (const_tree f, const_tree type)
++{
++  const_tree tf;
++
++  tf = TREE_TYPE (f);
++  return (TREE_CHAIN (f) == NULL
++	  && TREE_CODE (tf) == ARRAY_TYPE
++	  && TYPE_DOMAIN (tf)
++	  && TYPE_MIN_VALUE (TYPE_DOMAIN (tf))
++	  && integer_zerop (TYPE_MIN_VALUE (TYPE_DOMAIN (tf)))
++	  && !TYPE_MAX_VALUE (TYPE_DOMAIN (tf))
++	  && int_size_in_bytes (type) >= 0);
++}
++
++/* If FOR_CTOR_P, return the number of top-level elements that a constructor
++   must have in order for it to completely initialize a value of type TYPE.
++   Return -1 if the number isn't known.
++
++   If !FOR_CTOR_P, return an estimate of the number of scalars in TYPE.  */
++
++static HOST_WIDE_INT
++count_type_elements (const_tree type, bool for_ctor_p)
++{
++  switch (TREE_CODE (type))
++    {
++    case ARRAY_TYPE:
++      {
++	tree nelts;
++
++	nelts = array_type_nelts (type);
++	if (nelts && host_integerp (nelts, 1))
++	  {
++	    unsigned HOST_WIDE_INT n;
++
++	    n = tree_low_cst (nelts, 1) + 1;
++	    if (n == 0 || for_ctor_p)
++	      return n;
++	    else
++	      return n * count_type_elements (TREE_TYPE (type), false);
++	  }
++	return for_ctor_p ? -1 : 1;
++      }
++
++    case RECORD_TYPE:
++      {
++	unsigned HOST_WIDE_INT n;
++	tree f;
++
++	n = 0;
++	for (f = TYPE_FIELDS (type); f ; f = TREE_CHAIN (f))
++	  if (TREE_CODE (f) == FIELD_DECL)
++	    {
++	      if (!for_ctor_p)
++		n += count_type_elements (TREE_TYPE (f), false);
++	      else if (!flexible_array_member_p (f, type))
++		/* Don't count flexible arrays, which are not supposed
++		   to be initialized.  */
++		n += 1;
++	    }
++
++	return n;
++      }
++
++    case UNION_TYPE:
++    case QUAL_UNION_TYPE:
++      {
++	tree f;
++	HOST_WIDE_INT n, m;
++
++	gcc_assert (!for_ctor_p);
++	/* Estimate the number of scalars in each field and pick the
++	   maximum.  Other estimates would do instead; the idea is simply
++	   to make sure that the estimate is not sensitive to the ordering
++	   of the fields.  */
++	n = 1;
++	for (f = TYPE_FIELDS (type); f ; f = TREE_CHAIN (f))
++	  if (TREE_CODE (f) == FIELD_DECL)
++	    {
++	      m = count_type_elements (TREE_TYPE (f), false);
++	      /* If the field doesn't span the whole union, add an extra
++		 scalar for the rest.  */
++	      if (simple_cst_equal (TYPE_SIZE (TREE_TYPE (f)),
++				    TYPE_SIZE (type)) != 1)
++		m++;
++	      if (n < m)
++		n = m;
++	    }
++	return n;
++      }
++
++    case COMPLEX_TYPE:
++      return 2;
++
++    case VECTOR_TYPE:
++      return TYPE_VECTOR_SUBPARTS (type);
++
++    case INTEGER_TYPE:
++    case REAL_TYPE:
++    case FIXED_POINT_TYPE:
++    case ENUMERAL_TYPE:
++    case BOOLEAN_TYPE:
++    case POINTER_TYPE:
++    case OFFSET_TYPE:
++    case REFERENCE_TYPE:
++      return 1;
++
++    case ERROR_MARK:
++      return 0;
++
++    case VOID_TYPE:
++    case METHOD_TYPE:
++    case FUNCTION_TYPE:
++    case LANG_TYPE:
++    default:
++      gcc_unreachable ();
++    }
++}
++
+ /* Helper for categorize_ctor_elements.  Identical interface.  */
+ 
+ static bool
+ categorize_ctor_elements_1 (const_tree ctor, HOST_WIDE_INT *p_nz_elts,
+-			    HOST_WIDE_INT *p_elt_count,
+-			    bool *p_must_clear)
++			    HOST_WIDE_INT *p_init_elts, bool *p_complete)
+ {
+   unsigned HOST_WIDE_INT idx;
+-  HOST_WIDE_INT nz_elts, elt_count;
+-  tree value, purpose;
++  HOST_WIDE_INT nz_elts, init_elts, num_fields;
++  tree value, purpose, elt_type;
+ 
+   /* Whether CTOR is a valid constant initializer, in accordance with what
+      initializer_constant_valid_p does.  If inferred from the constructor
+@@ -4878,7 +4998,9 @@
+   bool const_p = const_from_elts_p ? true : TREE_STATIC (ctor);
+ 
+   nz_elts = 0;
+-  elt_count = 0;
++  init_elts = 0;
++  num_fields = 0;
++  elt_type = NULL_TREE;
+ 
+   FOR_EACH_CONSTRUCTOR_ELT (CONSTRUCTOR_ELTS (ctor), idx, purpose, value)
+     {
+@@ -4894,6 +5016,8 @@
+ 	    mult = (tree_low_cst (hi_index, 1)
+ 		    - tree_low_cst (lo_index, 1) + 1);
+ 	}
++      num_fields += mult;
++      elt_type = TREE_TYPE (value);
+ 
+       switch (TREE_CODE (value))
+ 	{
+@@ -4901,11 +5025,11 @@
+ 	  {
+ 	    HOST_WIDE_INT nz = 0, ic = 0;
+ 
+-	    bool const_elt_p
+-	      = categorize_ctor_elements_1 (value, &nz, &ic, p_must_clear);
++	    bool const_elt_p = categorize_ctor_elements_1 (value, &nz, &ic,
++							   p_complete);
+ 
+ 	    nz_elts += mult * nz;
+- 	    elt_count += mult * ic;
++ 	    init_elts += mult * ic;
+ 
+ 	    if (const_from_elts_p && const_p)
+ 	      const_p = const_elt_p;
+@@ -4917,12 +5041,12 @@
+ 	case FIXED_CST:
+ 	  if (!initializer_zerop (value))
+ 	    nz_elts += mult;
+-	  elt_count += mult;
++	  init_elts += mult;
+ 	  break;
+ 
+ 	case STRING_CST:
+ 	  nz_elts += mult * TREE_STRING_LENGTH (value);
+-	  elt_count += mult * TREE_STRING_LENGTH (value);
++	  init_elts += mult * TREE_STRING_LENGTH (value);
+ 	  break;
+ 
+ 	case COMPLEX_CST:
+@@ -4930,7 +5054,7 @@
+ 	    nz_elts += mult;
+ 	  if (!initializer_zerop (TREE_IMAGPART (value)))
+ 	    nz_elts += mult;
+-	  elt_count += mult;
++	  init_elts += mult;
+ 	  break;
+ 
+ 	case VECTOR_CST:
+@@ -4940,60 +5064,31 @@
+ 	      {
+ 		if (!initializer_zerop (TREE_VALUE (v)))
+ 		  nz_elts += mult;
+-		elt_count += mult;
++		init_elts += mult;
+ 	      }
+ 	  }
+ 	  break;
+ 
+ 	default:
+-	  nz_elts += mult;
+-	  elt_count += mult;
++	  {
++	    HOST_WIDE_INT tc = count_type_elements (elt_type, false);
++	    nz_elts += mult * tc;
++	    init_elts += mult * tc;
+ 
+-	  if (const_from_elts_p && const_p)
+-	    const_p = initializer_constant_valid_p (value, TREE_TYPE (value))
+-		      != NULL_TREE;
++	    if (const_from_elts_p && const_p)
++	      const_p = initializer_constant_valid_p (value, elt_type)
++			!= NULL_TREE;
++	  }
+ 	  break;
+ 	}
+     }
+ 
+-  if (!*p_must_clear
+-      && (TREE_CODE (TREE_TYPE (ctor)) == UNION_TYPE
+-	  || TREE_CODE (TREE_TYPE (ctor)) == QUAL_UNION_TYPE))
+-    {
+-      tree init_sub_type;
+-      bool clear_this = true;
+-
+-      if (!VEC_empty (constructor_elt, CONSTRUCTOR_ELTS (ctor)))
+-	{
+-	  /* We don't expect more than one element of the union to be
+-	     initialized.  Not sure what we should do otherwise... */
+-          gcc_assert (VEC_length (constructor_elt, CONSTRUCTOR_ELTS (ctor))
+-		      == 1);
+-
+-          init_sub_type = TREE_TYPE (VEC_index (constructor_elt,
+-						CONSTRUCTOR_ELTS (ctor),
+-						0)->value);
+-
+-	  /* ??? We could look at each element of the union, and find the
+-	     largest element.  Which would avoid comparing the size of the
+-	     initialized element against any tail padding in the union.
+-	     Doesn't seem worth the effort...  */
+-	  if (simple_cst_equal (TYPE_SIZE (TREE_TYPE (ctor)),
+-				TYPE_SIZE (init_sub_type)) == 1)
+-	    {
+-	      /* And now we have to find out if the element itself is fully
+-		 constructed.  E.g. for union { struct { int a, b; } s; } u
+-		 = { .s = { .a = 1 } }.  */
+-	      if (elt_count == count_type_elements (init_sub_type, false))
+-		clear_this = false;
+-	    }
+-	}
+-
+-      *p_must_clear = clear_this;
+-    }
++  if (*p_complete && !complete_ctor_at_level_p (TREE_TYPE (ctor),
++						num_fields, elt_type))
++    *p_complete = false;
+ 
+   *p_nz_elts += nz_elts;
+-  *p_elt_count += elt_count;
++  *p_init_elts += init_elts;
+ 
+   return const_p;
+ }
+@@ -5003,111 +5098,50 @@
+      and place it in *P_NZ_ELTS;
+    * how many scalar fields in total are in CTOR,
+      and place it in *P_ELT_COUNT.
+-   * if a type is a union, and the initializer from the constructor
+-     is not the largest element in the union, then set *p_must_clear.
++   * whether the constructor is complete -- in the sense that every
++     meaningful byte is explicitly given a value --
++     and place it in *P_COMPLETE.
+ 
+    Return whether or not CTOR is a valid static constant initializer, the same
+    as "initializer_constant_valid_p (CTOR, TREE_TYPE (CTOR)) != 0".  */
+ 
+ bool
+ categorize_ctor_elements (const_tree ctor, HOST_WIDE_INT *p_nz_elts,
+-			  HOST_WIDE_INT *p_elt_count,
+-			  bool *p_must_clear)
++			  HOST_WIDE_INT *p_init_elts, bool *p_complete)
+ {
+   *p_nz_elts = 0;
+-  *p_elt_count = 0;
+-  *p_must_clear = false;
++  *p_init_elts = 0;
++  *p_complete = true;
+ 
+-  return
+-    categorize_ctor_elements_1 (ctor, p_nz_elts, p_elt_count, p_must_clear);
++  return categorize_ctor_elements_1 (ctor, p_nz_elts, p_init_elts, p_complete);
+ }
+ 
+-/* Count the number of scalars in TYPE.  Return -1 on overflow or
+-   variable-sized.  If ALLOW_FLEXARR is true, don't count flexible
+-   array member at the end of the structure.  */
++/* TYPE is initialized by a constructor with NUM_ELTS elements, the last
++   of which had type LAST_TYPE.  Each element was itself a complete
++   initializer, in the sense that every meaningful byte was explicitly
++   given a value.  Return true if the same is true for the constructor
++   as a whole.  */
+ 
+-HOST_WIDE_INT
+-count_type_elements (const_tree type, bool allow_flexarr)
++bool
++complete_ctor_at_level_p (const_tree type, HOST_WIDE_INT num_elts,
++			  const_tree last_type)
+ {
+-  const HOST_WIDE_INT max = ~((HOST_WIDE_INT)1 << (HOST_BITS_PER_WIDE_INT-1));
+-  switch (TREE_CODE (type))
++  if (TREE_CODE (type) == UNION_TYPE
++      || TREE_CODE (type) == QUAL_UNION_TYPE)
+     {
+-    case ARRAY_TYPE:
+-      {
+-	tree telts = array_type_nelts (type);
+-	if (telts && host_integerp (telts, 1))
+-	  {
+-	    HOST_WIDE_INT n = tree_low_cst (telts, 1) + 1;
+-	    HOST_WIDE_INT m = count_type_elements (TREE_TYPE (type), false);
+-	    if (n == 0)
+-	      return 0;
+-	    else if (max / n > m)
+-	      return n * m;
+-	  }
+-	return -1;
+-      }
+-
+-    case RECORD_TYPE:
+-      {
+-	HOST_WIDE_INT n = 0, t;
+-	tree f;
+-
+-	for (f = TYPE_FIELDS (type); f ; f = TREE_CHAIN (f))
+-	  if (TREE_CODE (f) == FIELD_DECL)
+-	    {
+-	      t = count_type_elements (TREE_TYPE (f), false);
+-	      if (t < 0)
+-		{
+-		  /* Check for structures with flexible array member.  */
+-		  tree tf = TREE_TYPE (f);
+-		  if (allow_flexarr
+-		      && TREE_CHAIN (f) == NULL
+-		      && TREE_CODE (tf) == ARRAY_TYPE
+-		      && TYPE_DOMAIN (tf)
+-		      && TYPE_MIN_VALUE (TYPE_DOMAIN (tf))
+-		      && integer_zerop (TYPE_MIN_VALUE (TYPE_DOMAIN (tf)))
+-		      && !TYPE_MAX_VALUE (TYPE_DOMAIN (tf))
+-		      && int_size_in_bytes (type) >= 0)
+-		    break;
+-
+-		  return -1;
+-		}
+-	      n += t;
+-	    }
+-
+-	return n;
+-      }
+-
+-    case UNION_TYPE:
+-    case QUAL_UNION_TYPE:
+-      return -1;
+-
+-    case COMPLEX_TYPE:
+-      return 2;
+-
+-    case VECTOR_TYPE:
+-      return TYPE_VECTOR_SUBPARTS (type);
+-
+-    case INTEGER_TYPE:
+-    case REAL_TYPE:
+-    case FIXED_POINT_TYPE:
+-    case ENUMERAL_TYPE:
+-    case BOOLEAN_TYPE:
+-    case POINTER_TYPE:
+-    case OFFSET_TYPE:
+-    case REFERENCE_TYPE:
+-      return 1;
+-
+-    case ERROR_MARK:
+-      return 0;
+-
+-    case VOID_TYPE:
+-    case METHOD_TYPE:
+-    case FUNCTION_TYPE:
+-    case LANG_TYPE:
+-    default:
+-      gcc_unreachable ();
++      if (num_elts == 0)
++	return false;
++
++      gcc_assert (num_elts == 1 && last_type);
++
++      /* ??? We could look at each element of the union, and find the
++	 largest element.  Which would avoid comparing the size of the
++	 initialized element against any tail padding in the union.
++	 Doesn't seem worth the effort...  */
++      return simple_cst_equal (TYPE_SIZE (type), TYPE_SIZE (last_type)) == 1;
+     }
++
++  return count_type_elements (type, true) == num_elts;
+ }
+ 
+ /* Return 1 if EXP contains mostly (3/4)  zeros.  */
+@@ -5116,18 +5150,12 @@
+ mostly_zeros_p (const_tree exp)
+ {
+   if (TREE_CODE (exp) == CONSTRUCTOR)
+-
+     {
+-      HOST_WIDE_INT nz_elts, count, elts;
+-      bool must_clear;
+-
+-      categorize_ctor_elements (exp, &nz_elts, &count, &must_clear);
+-      if (must_clear)
+-	return 1;
+-
+-      elts = count_type_elements (TREE_TYPE (exp), false);
+-
+-      return nz_elts < elts / 4;
++      HOST_WIDE_INT nz_elts, init_elts;
++      bool complete_p;
++
++      categorize_ctor_elements (exp, &nz_elts, &init_elts, &complete_p);
++      return !complete_p || nz_elts < init_elts / 4;
+     }
+ 
+   return initializer_zerop (exp);
+@@ -5139,12 +5167,11 @@
+ all_zeros_p (const_tree exp)
+ {
+   if (TREE_CODE (exp) == CONSTRUCTOR)
+-
+     {
+-      HOST_WIDE_INT nz_elts, count;
+-      bool must_clear;
++      HOST_WIDE_INT nz_elts, init_elts;
++      bool complete_p;
+ 
+-      categorize_ctor_elements (exp, &nz_elts, &count, &must_clear);
++      categorize_ctor_elements (exp, &nz_elts, &init_elts, &complete_p);
+       return nz_elts == 0;
+     }
+ 
+
+=== modified file 'gcc/gimplify.c'
+--- old/gcc/gimplify.c	2011-04-07 18:27:20 +0000
++++ new/gcc/gimplify.c	2011-07-13 13:36:36 +0000
+@@ -3634,9 +3634,8 @@
+     case ARRAY_TYPE:
+       {
+ 	struct gimplify_init_ctor_preeval_data preeval_data;
+-	HOST_WIDE_INT num_type_elements, num_ctor_elements;
+-	HOST_WIDE_INT num_nonzero_elements;
+-	bool cleared, valid_const_initializer;
++	HOST_WIDE_INT num_ctor_elements, num_nonzero_elements;
++	bool cleared, complete_p, valid_const_initializer;
+ 
+ 	/* Aggregate types must lower constructors to initialization of
+ 	   individual elements.  The exception is that a CONSTRUCTOR node
+@@ -3653,7 +3652,7 @@
+ 	   can only do so if it known to be a valid constant initializer.  */
+ 	valid_const_initializer
+ 	  = categorize_ctor_elements (ctor, &num_nonzero_elements,
+-				      &num_ctor_elements, &cleared);
++				      &num_ctor_elements, &complete_p);
+ 
+ 	/* If a const aggregate variable is being initialized, then it
+ 	   should never be a lose to promote the variable to be static.  */
+@@ -3691,26 +3690,29 @@
+ 	   parts in, then generate code for the non-constant parts.  */
+ 	/* TODO.  There's code in cp/typeck.c to do this.  */
+ 
+-	num_type_elements = count_type_elements (type, true);
++	if (int_size_in_bytes (TREE_TYPE (ctor)) < 0)
++	  /* store_constructor will ignore the clearing of variable-sized
++	     objects.  Initializers for such objects must explicitly set
++	     every field that needs to be set.  */
++	  cleared = false;
++	else if (!complete_p)
++	  /* If the constructor isn't complete, clear the whole object
++	     beforehand.
+ 
+-	/* If count_type_elements could not determine number of type elements
+-	   for a constant-sized object, assume clearing is needed.
+-	   Don't do this for variable-sized objects, as store_constructor
+-	   will ignore the clearing of variable-sized objects.  */
+-	if (num_type_elements < 0 && int_size_in_bytes (type) >= 0)
++	     ??? This ought not to be needed.  For any element not present
++	     in the initializer, we should simply set them to zero.  Except
++	     we'd need to *find* the elements that are not present, and that
++	     requires trickery to avoid quadratic compile-time behavior in
++	     large cases or excessive memory use in small cases.  */
+ 	  cleared = true;
+-	/* If there are "lots" of zeros, then block clear the object first.  */
+-	else if (num_type_elements - num_nonzero_elements
++	else if (num_ctor_elements - num_nonzero_elements
+ 		 > CLEAR_RATIO (optimize_function_for_speed_p (cfun))
+-		 && num_nonzero_elements < num_type_elements/4)
+-	  cleared = true;
+-	/* ??? This bit ought not be needed.  For any element not present
+-	   in the initializer, we should simply set them to zero.  Except
+-	   we'd need to *find* the elements that are not present, and that
+-	   requires trickery to avoid quadratic compile-time behavior in
+-	   large cases or excessive memory use in small cases.  */
+-	else if (num_ctor_elements < num_type_elements)
+-	  cleared = true;
++		 && num_nonzero_elements < num_ctor_elements / 4)
++	  /* If there are "lots" of zeros, it's more efficient to clear
++	     the memory and then set the nonzero elements.  */
++	  cleared = true;
++	else
++	  cleared = false;
+ 
+ 	/* If there are "lots" of initialized elements, and all of them
+ 	   are valid address constants, then the entire initializer can
+
+=== added file 'gcc/testsuite/gcc.target/arm/pr48183.c'
+--- old/gcc/testsuite/gcc.target/arm/pr48183.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/pr48183.c	2011-07-13 13:36:36 +0000
+@@ -0,0 +1,25 @@
++/* testsuite/gcc.target/arm/pr48183.c */
++
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-options "-O -g" } */
++/* { dg-add-options arm_neon } */
++
++#include <arm_neon.h>
++
++void move_16bit_to_32bit (int32_t *dst, const short *src, unsigned n)
++{
++    unsigned i;
++    int16x4x2_t input;
++    int32x4x2_t mid;
++    int32x4x2_t output;
++
++    for (i = 0; i < n/2; i += 8) {
++        input = vld2_s16(src + i);
++        mid.val[0] = vmovl_s16(input.val[0]);
++        mid.val[1] = vmovl_s16(input.val[1]);
++        output.val[0] = vshlq_n_s32(mid.val[0], 8);
++        output.val[1] = vshlq_n_s32(mid.val[1], 8);
++        vst2q_s32((int32_t *)dst + i, output);
++    }
++}
+
+=== modified file 'gcc/tree.h'
+--- old/gcc/tree.h	2011-04-06 12:29:08 +0000
++++ new/gcc/tree.h	2011-07-13 13:36:36 +0000
+@@ -4361,21 +4361,10 @@
+ 
+ extern VEC(tree,gc) *ctor_to_vec (tree);
+ 
+-/* Examine CTOR to discover:
+-   * how many scalar fields are set to nonzero values,
+-     and place it in *P_NZ_ELTS;
+-   * how many scalar fields in total are in CTOR,
+-     and place it in *P_ELT_COUNT.
+-   * if a type is a union, and the initializer from the constructor
+-     is not the largest element in the union, then set *p_must_clear.
+-
+-   Return whether or not CTOR is a valid static constant initializer, the same
+-   as "initializer_constant_valid_p (CTOR, TREE_TYPE (CTOR)) != 0".  */
+-
+-extern bool categorize_ctor_elements (const_tree, HOST_WIDE_INT *, HOST_WIDE_INT *,
+-				      bool *);
+-
+-extern HOST_WIDE_INT count_type_elements (const_tree, bool);
++extern bool categorize_ctor_elements (const_tree, HOST_WIDE_INT *,
++				      HOST_WIDE_INT *, bool *);
++
++extern bool complete_ctor_at_level_p (const_tree, HOST_WIDE_INT, const_tree);
+ 
+ /* integer_zerop (tree x) is nonzero if X is an integer constant of value 0.  */
+ 
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/linaro-lp815435.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/linaro-lp815435.patch
new file mode 100644
index 0000000..be71a2f
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/linaro-lp815435.patch
@@ -0,0 +1,25 @@
+2011-07-29  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	gcc/
+	Backport only bits marked as [*] from mainline:
+	 2010-12-19  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	* config/arm/arm.c ([*]arm_legitimate_index_p): Add VFP load/store
+	index range case. Change to SF/DFmode tests to avoid capturing HFmode.
+	(thumb2_legitimate_index_p): Same.
+
+Index: gcc-4_5-branch/gcc/config/arm/arm.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/arm/arm.c	2011-07-22 17:56:51.000000000 -0700
++++ gcc-4_5-branch/gcc/config/arm/arm.c	2011-07-29 14:43:42.171610966 -0700
+@@ -5631,8 +5631,8 @@ arm_legitimate_index_p (enum machine_mod
+ 
+   /* Standard coprocessor addressing modes.  */
+   if (TARGET_HARD_FLOAT
+-      && (TARGET_FPA || TARGET_MAVERICK)
+-      && (GET_MODE_CLASS (mode) == MODE_FLOAT
++      && (TARGET_FPA || TARGET_MAVERICK || TARGET_VFP)
++      && ((mode == SFmode || mode == DFmode)
+ 	  || (TARGET_MAVERICK && mode == DImode)))
+     return (code == CONST_INT && INTVAL (index) < 1024
+ 	    && INTVAL (index) > -1024
-- 
1.7.4.1



