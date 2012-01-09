Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RkP0z-0008IX-2V
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 00:52:34 +0100
Received: by yenm12 with SMTP id m12so1746677yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jan 2012 15:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=L2rKUtexxU932Dw1quNw5AjLZpj9nzqvMYsfw8gmZR4=;
	b=pN3m2H0YKKCaHdwv97ZnvrUFOPK920OPsueDLlKycE3yAiJm3+UhW3QhVawzlAZddM
	SY0sR0efWcFXWv8FrVMuGYc/k81duiAqaeYNg7Vu+wFdKPhzkxSFmgD7Xm0dfskDY82y
	99GhRH/BqpC9PucH3oiPtPPYOvIrrEMZFmIX4=
Received: by 10.50.42.167 with SMTP id p7mr151974igl.20.1326152704106;
	Mon, 09 Jan 2012 15:45:04 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id t5sm14816976igb.4.2012.01.09.15.45.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 15:45:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jan 2012 15:44:16 -0800
Message-Id: <1326152656-6622-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1326152656-6622-1-git-send-email-raj.khem@gmail.com>
References: <1326152656-6622-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] gcc-4.6: Update linaro patches past 2012.12 release
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
X-List-Received-Date: Mon, 09 Jan 2012 23:52:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch    |  388 +++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106843.patch    |  805 +++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106844.patch    |  495 ++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106845.patch    | 1818 ++++++++++++++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106846.patch    |  487 ++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106848.patch    |  276 +++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106853.patch    |   69 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106854.patch    |  354 ++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106855.patch    |   22 +
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |    9 +
 meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc    |    2 +-
 11 files changed, 4724 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106843.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106844.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106845.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106846.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106848.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106853.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106854.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106855.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch
new file mode 100644
index 0000000..74f139d
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch
@@ -0,0 +1,388 @@
+2011-11-22  Ira Rosen  <ira.rosen@linaro.org>
+
+	Backport from mainline:
+
+	2011-10-06  Jakub Jelinek  <jakub@redhat.com>
+
+	gcc/
+	PR tree-optimization/50596
+	* tree-vectorizer.h (vect_is_simple_cond): New prototype.
+	(NUM_PATTERNS): Change to 6.
+	* tree-vect-patterns.c (vect_recog_mixed_size_cond_pattern): New
+	function.
+	(vect_vect_recog_func_ptrs): Add vect_recog_mixed_size_cond_pattern.
+	(vect_mark_pattern_stmts): Don't create stmt_vinfo for def_stmt
+	if it already has one, and don't set STMT_VINFO_VECTYPE in it
+	if it is already set.
+	* tree-vect-stmts.c (vect_mark_stmts_to_be_vectorized): Handle
+	COND_EXPR in pattern stmts.
+	(vect_is_simple_cond): No longer static.
+
+	gcc/testsuite:
+	PR tree-optimization/50596
+	* gcc.dg/vect/vect-cond-8.c: New test.
+
+	2011-10-07  Jakub Jelinek  <jakub@redhat.com>
+
+	gcc/
+	PR tree-optimization/50650
+	* tree-vect-patterns.c (vect_recog_mixed_size_cond_pattern): Don't
+	call vect_is_simple_cond here, instead fail if cond_expr isn't
+	COMPARISON_CLASS_P or if get_vectype_for_scalar_type returns NULL
+	for cond_expr's first operand.
+	* tree-vect-stmts.c (vect_is_simple_cond): Static again.
+	* tree-vectorizer.h (vect_is_simple_cond): Remove prototype.
+
+
+	gcc/
+	* tree-vect-patterns.c (vect_recog_mixed_size_cond_pattern): Reduce
+	it to integral types only.
+
+	gcc/testsuite/
+	* gcc.dg/vect/pr30858.c: Expect the error message twice for targets
+	with multiple vector sizes.
+	* gcc.dg/vect/vect-cond-8.c: Rename to...
+	* gcc.dg/vect/vect-cond-8a.c: ... this and change the type from float
+	to int.
+	* lib/target-supports.exp (check_effective_target_vect_condition):
+	Return true for NEON.
+
+=== modified file 'gcc/testsuite/gcc.dg/vect/pr30858.c'
+--- old/gcc/testsuite/gcc.dg/vect/pr30858.c	2007-02-22 08:16:18 +0000
++++ new/gcc/testsuite/gcc.dg/vect/pr30858.c	2011-11-20 09:11:09 +0000
+@@ -11,5 +11,6 @@
+ }
+ 
+ /* { dg-final { scan-tree-dump-times "vectorized 0 loops" 1 "vect" } } */
+-/* { dg-final { scan-tree-dump-times "Unknown def-use cycle pattern." 1 "vect" } } */
++/* { dg-final { scan-tree-dump-times "Unknown def-use cycle pattern." 1 "vect" { xfail vect_multiple_sizes } } } */
++/* { dg-final { scan-tree-dump-times "Unknown def-use cycle pattern." 2 "vect" { target vect_multiple_sizes } } } */
+ /* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-cond-8a.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-cond-8a.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-cond-8a.c	2011-11-20 09:11:09 +0000
+@@ -0,0 +1,75 @@
++/* { dg-require-effective-target vect_condition } */
++
++#include "tree-vect.h"
++
++#define N 1024
++int a[N], b[N], c[N];
++char d[N], e[N], f[N];
++unsigned char k[N];
++
++__attribute__((noinline, noclone)) void
++f1 (void)
++{
++  int i;
++  for (i = 0; i < N; ++i)
++    k[i] = a[i] < b[i] ? 17 : 0;
++}
++
++__attribute__((noinline, noclone)) void
++f2 (void)
++{
++  int i;
++  for (i = 0; i < N; ++i)
++    k[i] = a[i] < b[i] ? 0 : 24;
++}
++
++__attribute__((noinline, noclone)) void
++f3 (void)
++{
++  int i;
++  for (i = 0; i < N; ++i)
++    k[i] = a[i] < b[i] ? 51 : 12;
++}
++
++int
++main ()
++{
++  int i;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      switch (i % 9)
++	{
++	case 0: asm (""); a[i] = - i - 1; b[i] = i + 1; break;
++	case 1: a[i] = 0; b[i] = 0; break;
++	case 2: a[i] = i + 1; b[i] = - i - 1; break;
++	case 3: a[i] = i; b[i] = i + 7; break;
++	case 4: a[i] = i; b[i] = i; break;
++	case 5: a[i] = i + 16; b[i] = i + 3; break;
++	case 6: a[i] = - i - 5; b[i] = - i; break;
++	case 7: a[i] = - i; b[i] = - i; break;
++	case 8: a[i] = - i; b[i] = - i - 7; break;
++	}
++      d[i] = i;
++      e[i] = 2 * i;
++    }
++  f1 ();
++  for (i = 0; i < N; i++)
++    if (k[i] != ((i % 3) == 0 ? 17 : 0))
++      abort ();
++  f2 ();
++  for (i = 0; i < N; i++)
++    if (k[i] != ((i % 3) == 0 ? 0 : 24))
++      abort ();
++  f3 ();
++  for (i = 0; i < N; i++)
++    if (k[i] != ((i % 3) == 0 ? 51 : 12))
++      abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "note: vectorized 1 loops" 3 "vect" } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== modified file 'gcc/testsuite/lib/target-supports.exp'
+--- old/gcc/testsuite/lib/target-supports.exp	2011-11-21 01:45:54 +0000
++++ new/gcc/testsuite/lib/target-supports.exp	2011-11-22 16:52:23 +0000
+@@ -3150,7 +3150,8 @@
+ 	     || [istarget ia64-*-*]
+ 	     || [istarget i?86-*-*]
+ 	     || [istarget spu-*-*]
+-	     || [istarget x86_64-*-*] } {
++	     || [istarget x86_64-*-*]
++	     || ([istarget arm*-*-*] && [check_effective_target_arm_neon_ok]) } {
+ 	   set et_vect_cond_saved 1
+ 	}
+     }
+
+=== modified file 'gcc/tree-vect-patterns.c'
+--- old/gcc/tree-vect-patterns.c	2011-10-23 13:33:07 +0000
++++ new/gcc/tree-vect-patterns.c	2011-11-20 09:11:09 +0000
+@@ -50,13 +50,16 @@
+                                                  tree *);
+ static gimple vect_recog_widen_shift_pattern (VEC (gimple, heap) **,
+                                        tree *, tree *);
++static gimple vect_recog_mixed_size_cond_pattern (VEC (gimple, heap) **,
++                                                 tree *, tree *);
+ static vect_recog_func_ptr vect_vect_recog_func_ptrs[NUM_PATTERNS] = {
+ 	vect_recog_widen_mult_pattern,
+ 	vect_recog_widen_sum_pattern,
+ 	vect_recog_dot_prod_pattern,
+ 	vect_recog_pow_pattern,
+         vect_recog_over_widening_pattern,
+-	vect_recog_widen_shift_pattern};
++	vect_recog_widen_shift_pattern,
++	vect_recog_mixed_size_cond_pattern};
+ 
+ 
+ /* Function widened_name_p
+@@ -1441,6 +1444,118 @@
+   return pattern_stmt;
+ }
+ 
++/* Function vect_recog_mixed_size_cond_pattern
++
++   Try to find the following pattern:
++
++     type x_t, y_t;
++     TYPE a_T, b_T, c_T;
++   loop:
++     S1  a_T = x_t CMP y_t ? b_T : c_T;
++
++   where type 'TYPE' is an integral type which has different size
++   from 'type'.  b_T and c_T are constants and if 'TYPE' is wider
++   than 'type', the constants need to fit into an integer type
++   with the same width as 'type'.
++
++   Input:
++
++   * LAST_STMT: A stmt from which the pattern search begins.
++
++   Output:
++
++   * TYPE_IN: The type of the input arguments to the pattern.
++
++   * TYPE_OUT: The type of the output of this pattern.
++
++   * Return value: A new stmt that will be used to replace the pattern.
++	Additionally a def_stmt is added.
++
++	a_it = x_t CMP y_t ? b_it : c_it;
++	a_T = (TYPE) a_it;  */
++
++static gimple
++vect_recog_mixed_size_cond_pattern (VEC (gimple, heap) **stmts, tree *type_in,
++				    tree *type_out)
++{
++  gimple last_stmt = VEC_index (gimple, *stmts, 0);
++  tree cond_expr, then_clause, else_clause;
++  stmt_vec_info stmt_vinfo = vinfo_for_stmt (last_stmt), def_stmt_info;
++  tree type, vectype, comp_vectype, comp_type, op, tmp;
++  enum machine_mode cmpmode;
++  gimple pattern_stmt, def_stmt;
++  loop_vec_info loop_vinfo = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
++
++  if (!is_gimple_assign (last_stmt)
++      || gimple_assign_rhs_code (last_stmt) != COND_EXPR
++      || STMT_VINFO_DEF_TYPE (stmt_vinfo) != vect_internal_def)
++    return NULL;
++
++  op = gimple_assign_rhs1 (last_stmt);
++  cond_expr = TREE_OPERAND (op, 0);
++  then_clause = TREE_OPERAND (op, 1);
++  else_clause = TREE_OPERAND (op, 2);
++
++  if (TREE_CODE (then_clause) != INTEGER_CST
++      || TREE_CODE (else_clause) != INTEGER_CST)
++    return NULL;
++
++  if (!COMPARISON_CLASS_P (cond_expr))
++    return NULL;
++
++  type = gimple_expr_type (last_stmt);
++  comp_type = TREE_TYPE (TREE_OPERAND (cond_expr, 0));
++  if (!INTEGRAL_TYPE_P (comp_type)
++      || !INTEGRAL_TYPE_P (type))
++    return NULL;
++
++  comp_vectype = get_vectype_for_scalar_type (comp_type);
++  if (comp_vectype == NULL_TREE)
++    return NULL;
++
++  cmpmode = GET_MODE_INNER (TYPE_MODE (comp_vectype));
++
++  if (GET_MODE_BITSIZE (TYPE_MODE (type)) == GET_MODE_BITSIZE (cmpmode))
++    return NULL;
++
++  vectype = get_vectype_for_scalar_type (type);
++  if (vectype == NULL_TREE)
++    return NULL;
++
++  if (types_compatible_p (vectype, comp_vectype))
++    return NULL;
++
++  if (!expand_vec_cond_expr_p (comp_vectype, TYPE_MODE (comp_vectype)))
++    return NULL;
++
++  if (GET_MODE_BITSIZE (TYPE_MODE (type)) > GET_MODE_BITSIZE (cmpmode))
++    {
++      if (!int_fits_type_p (then_clause, comp_type)
++	  || !int_fits_type_p (else_clause, comp_type))
++	return NULL;
++    }
++
++  tmp = build3 (COND_EXPR, comp_type, unshare_expr (cond_expr),
++		fold_convert (comp_type, then_clause),
++	       	fold_convert (comp_type, else_clause));
++  def_stmt = gimple_build_assign (vect_recog_temp_ssa_var (comp_type, NULL), tmp);
++
++  pattern_stmt
++    = gimple_build_assign_with_ops (NOP_EXPR,
++				    vect_recog_temp_ssa_var (type, NULL),
++				    gimple_assign_lhs (def_stmt), NULL_TREE);
++
++  STMT_VINFO_PATTERN_DEF_STMT (stmt_vinfo) = def_stmt;
++  def_stmt_info = new_stmt_vec_info (def_stmt, loop_vinfo, NULL);
++  set_vinfo_for_stmt (def_stmt, def_stmt_info);
++  STMT_VINFO_VECTYPE (def_stmt_info) = comp_vectype;
++  *type_in = vectype;
++  *type_out = vectype;
++
++  return pattern_stmt;
++}
++
++
+ /* Mark statements that are involved in a pattern.  */
+ 
+ static inline void
+@@ -1468,14 +1583,18 @@
+   if (STMT_VINFO_PATTERN_DEF_STMT (pattern_stmt_info))
+     {
+       def_stmt = STMT_VINFO_PATTERN_DEF_STMT (pattern_stmt_info);
+-      set_vinfo_for_stmt (def_stmt,
+-                          new_stmt_vec_info (def_stmt, loop_vinfo, NULL));
++      def_stmt_info = vinfo_for_stmt (def_stmt);
++      if (def_stmt_info == NULL)
++	{
++	  def_stmt_info = new_stmt_vec_info (def_stmt, loop_vinfo, NULL);
++	  set_vinfo_for_stmt (def_stmt, def_stmt_info);
++	}
+       gimple_set_bb (def_stmt, gimple_bb (orig_stmt));
+-      def_stmt_info = vinfo_for_stmt (def_stmt);
+       STMT_VINFO_RELATED_STMT (def_stmt_info) = orig_stmt;
+       STMT_VINFO_DEF_TYPE (def_stmt_info)
+ 	= STMT_VINFO_DEF_TYPE (orig_stmt_info);
+-      STMT_VINFO_VECTYPE (def_stmt_info) = pattern_vectype;
++      if (STMT_VINFO_VECTYPE (def_stmt_info) == NULL_TREE)
++	STMT_VINFO_VECTYPE (def_stmt_info) = pattern_vectype;
+     }
+ }
+ 
+
+=== modified file 'gcc/tree-vect-stmts.c'
+--- old/gcc/tree-vect-stmts.c	2011-11-14 11:38:08 +0000
++++ new/gcc/tree-vect-stmts.c	2011-11-22 16:52:23 +0000
+@@ -655,20 +655,40 @@
+               tree rhs = gimple_assign_rhs1 (stmt);
+               unsigned int op_num;
+               tree op;
++	      enum tree_code rhs_code;
+               switch (get_gimple_rhs_class (gimple_assign_rhs_code (stmt)))
+                 {
+                   case GIMPLE_SINGLE_RHS:
+-                     op_num = TREE_OPERAND_LENGTH (gimple_assign_rhs1 (stmt));
+-                     for (i = 0; i < op_num; i++)
+-                       {
+-                         op = TREE_OPERAND (rhs, i);
+-                         if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
+-                                           &worklist))
+-                           {
+-                             VEC_free (gimple, heap, worklist);
+-                             return false;
+-                           }
+-                       }
++                    op = gimple_assign_rhs1 (stmt);
++                    rhs_code = gimple_assign_rhs_code (stmt);
++		    i = 0;
++		    if (rhs_code == COND_EXPR
++			&& COMPARISON_CLASS_P (TREE_OPERAND (op, 0)))
++		      {
++			op = TREE_OPERAND (op, 0);
++			if (!process_use (stmt, TREE_OPERAND (op, 0),
++				   	  loop_vinfo,
++					  live_p, relevant, &worklist)
++			    || !process_use (stmt, TREE_OPERAND (op, 1),
++				   	 loop_vinfo,
++				         live_p, relevant, &worklist))
++		    	  {
++			    VEC_free (gimple, heap, worklist);
++			    return false;
++			  }
++		  	i = 1;
++		      }
++                    op_num = TREE_OPERAND_LENGTH (gimple_assign_rhs1 (stmt));
++                    for (i; i < op_num; i++)
++                      {
++                        op = TREE_OPERAND (rhs, i);
++                        if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
++                                          &worklist))
++                          {
++                            VEC_free (gimple, heap, worklist);
++                            return false;
++                          }
++                      }
+                     break;
+                    
+                   case GIMPLE_BINARY_RHS:
+
+=== modified file 'gcc/tree-vectorizer.h'
+--- old/gcc/tree-vectorizer.h	2011-11-14 11:38:08 +0000
++++ new/gcc/tree-vectorizer.h	2011-11-22 16:52:23 +0000
+@@ -917,7 +917,7 @@
+    Additional pattern recognition functions can (and will) be added
+    in the future.  */
+ typedef gimple (* vect_recog_func_ptr) (VEC (gimple, heap) **, tree *, tree *);
+-#define NUM_PATTERNS 6 
++#define NUM_PATTERNS 7 
+ void vect_pattern_recog (loop_vec_info);
+ 
+ /* In tree-vectorizer.c.  */
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106843.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106843.patch
new file mode 100644
index 0000000..ea42ad6
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106843.patch
@@ -0,0 +1,805 @@
+2011-11-22  Ira Rosen  <ira.rosen@linaro.org>
+ 	Backport from mainline:
+ 
+	2011-11-06  Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	* tree-vectorizer.h (vectorizable_condition): Add argument.
+	* tree-vect-loop.c (vectorizable_reduction): Fail for condition
+	in SLP.  Update calls to vectorizable_condition.
+	* tree-vect-stmts.c (vect_is_simple_cond): Add basic block info to
+	the arguments.  Pass it to vect_is_simple_use_1.
+	(vectorizable_condition): Add slp_node to the arguments.  Support
+	vectorization of basic blocks.  Fail for reduction in SLP.  Update
+	calls to vect_is_simple_cond and vect_is_simple_use.  Support SLP:
+	call vect_get_slp_defs to get vector operands.
+	(vect_analyze_stmt): Update calls to vectorizable_condition.
+	(vect_transform_stmt): Likewise.
+	* tree-vect-slp.c (vect_create_new_slp_node): Handle COND_EXPR.
+	(vect_get_and_check_slp_defs): Handle COND_EXPR.  Allow pattern
+	def stmts.
+	(vect_build_slp_tree): Handle COND_EXPR.
+	(vect_analyze_slp_instance): Push pattern statements to root node.
+	(vect_get_constant_vectors): Fix comments.  Handle COND_EXPR.
+
+	gcc/testsuite/
+	* gcc.dg/vect/bb-slp-cond-1.c: New test.
+	* gcc.dg/vect/slp-cond-1.c: New test.
+
+=== added file 'gcc/testsuite/gcc.dg/vect/bb-slp-cond-1.c'
+--- old/gcc/testsuite/gcc.dg/vect/bb-slp-cond-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/bb-slp-cond-1.c	2011-11-20 08:24:08 +0000
+@@ -0,0 +1,46 @@
++/* { dg-require-effective-target vect_condition } */
++
++#include "tree-vect.h"
++
++#define N 128
++
++__attribute__((noinline, noclone)) void
++foo (int *a, int stride)
++{
++  int i;
++
++  for (i = 0; i < N/stride; i++, a += stride)
++   {
++     a[0] = a[0] ? 1 : 5;
++     a[1] = a[1] ? 2 : 6;
++     a[2] = a[2] ? 3 : 7;
++     a[3] = a[3] ? 4 : 8;
++   }
++}
++
++
++int a[N];
++int main ()
++{
++  int i;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    a[i] = i;
++
++  foo (a, 4);
++
++  for (i = 1; i < N; i++)
++    if (a[i] != i%4 + 1)
++      abort ();
++
++  if (a[0] != 5)
++    abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "basic block vectorized using SLP" 1 "slp" { target vect_element_align } } } */
++/* { dg-final { cleanup-tree-dump "slp" } } */
++
+
+=== added file 'gcc/testsuite/gcc.dg/vect/slp-cond-1.c'
+--- old/gcc/testsuite/gcc.dg/vect/slp-cond-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/slp-cond-1.c	2011-11-20 08:24:08 +0000
+@@ -0,0 +1,126 @@
++/* { dg-require-effective-target vect_condition } */
++#include "tree-vect.h"
++
++#define N 32
++int a[N], b[N];
++int d[N], e[N];
++int k[N];
++
++__attribute__((noinline, noclone)) void
++f1 (void)
++{
++  int i;
++  for (i = 0; i < N/4; i++)
++    {
++      k[4*i] = a[4*i] < b[4*i] ? 17 : 0;
++      k[4*i+1] = a[4*i+1] < b[4*i+1] ? 17 : 0;
++      k[4*i+2] = a[4*i+2] < b[4*i+2] ? 17 : 0;
++      k[4*i+3] = a[4*i+3] < b[4*i+3] ? 17 : 0;
++    }
++}
++
++__attribute__((noinline, noclone)) void
++f2 (void)
++{
++  int i;
++  for (i = 0; i < N/2; ++i)
++    {
++      k[2*i] = a[2*i] < b[2*i] ? 0 : 24;
++      k[2*i+1] = a[2*i+1] < b[2*i+1] ? 7 : 4;
++    }
++}
++
++__attribute__((noinline, noclone)) void
++f3 (void)
++{
++  int i;
++  for (i = 0; i < N/2; ++i)
++    {
++      k[2*i] = a[2*i] < b[2*i] ? 51 : 12;
++      k[2*i+1] = a[2*i+1] > b[2*i+1] ? 51 : 12;
++    }
++}
++
++__attribute__((noinline, noclone)) void
++f4 (void)
++{
++  int i;
++  for (i = 0; i < N/2; ++i)
++    {
++      int d0 = d[2*i], e0 = e[2*i];
++      int d1 = d[2*i+1], e1 = e[2*i+1];
++      k[2*i] = a[2*i] >= b[2*i] ? d0 : e0;
++      k[2*i+1] = a[2*i+1] >= b[2*i+1] ? d1 : e1;
++    }
++}
++
++int
++main ()
++{
++  int i;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      switch (i % 9)
++	{
++	case 0: asm (""); a[i] = - i - 1; b[i] = i + 1; break;
++	case 1: a[i] = 0; b[i] = 0; break;
++	case 2: a[i] = i + 1; b[i] = - i - 1; break;
++	case 3: a[i] = i; b[i] = i + 7; break;
++	case 4: a[i] = i; b[i] = i; break;
++	case 5: a[i] = i + 16; b[i] = i + 3; break;
++	case 6: a[i] = - i - 5; b[i] = - i; break;
++	case 7: a[i] = - i; b[i] = - i; break;
++	case 8: a[i] = - i; b[i] = - i - 7; break;
++	}
++      d[i] = i;
++      e[i] = 2 * i;
++    }
++  f1 ();
++  for (i = 0; i < N; i++)
++    if (k[i] != ((i % 3) == 0 ? 17 : 0))
++      abort ();
++
++  f2 ();
++  for (i = 0; i < N; i++)
++    {
++      switch (i % 9)
++        {
++        case 0:
++	case 6:
++	  if (k[i] != ((i/9 % 2) == 0 ? 0 : 7))
++	    abort ();
++	  break;
++        case 1:
++        case 5:
++        case 7:
++	  if (k[i] != ((i/9 % 2) == 0 ? 4 : 24))
++            abort ();
++          break;
++        case 2:
++        case 4:
++        case 8:
++	  if (k[i] != ((i/9 % 2) == 0 ? 24 : 4))
++            abort ();
++          break;
++        case 3:
++	  if (k[i] != ((i/9 % 2) == 0 ? 7 : 0))
++            abort ();
++          break;
++        }
++    }
++
++  f3 ();
++
++  f4 ();
++  for (i = 0; i < N; i++)
++    if (k[i] != ((i % 3) == 0 ? e[i] : d[i]))
++      abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorizing stmts using SLP" 3 "vect" } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== modified file 'gcc/tree-vect-loop.c'
+--- old/gcc/tree-vect-loop.c	2011-11-14 11:38:08 +0000
++++ new/gcc/tree-vect-loop.c	2011-11-20 08:24:08 +0000
+@@ -4087,6 +4087,9 @@
+       gcc_unreachable ();
+     }
+ 
++  if (code == COND_EXPR && slp_node)
++    return false;
++
+   scalar_dest = gimple_assign_lhs (stmt);
+   scalar_type = TREE_TYPE (scalar_dest);
+   if (!POINTER_TYPE_P (scalar_type) && !INTEGRAL_TYPE_P (scalar_type)
+@@ -4161,7 +4164,7 @@
+ 
+   if (code == COND_EXPR)
+     {
+-      if (!vectorizable_condition (stmt, gsi, NULL, ops[reduc_index], 0))
++      if (!vectorizable_condition (stmt, gsi, NULL, ops[reduc_index], 0, NULL))
+         {
+           if (vect_print_dump_info (REPORT_DETAILS))
+             fprintf (vect_dump, "unsupported condition in reduction");
+@@ -4433,7 +4436,7 @@
+           gcc_assert (!slp_node);
+           vectorizable_condition (stmt, gsi, vec_stmt, 
+                                   PHI_RESULT (VEC_index (gimple, phis, 0)), 
+-                                  reduc_index);
++                                  reduc_index, NULL);
+           /* Multiple types are not supported for condition.  */
+           break;
+         }
+
+=== modified file 'gcc/tree-vect-slp.c'
+--- old/gcc/tree-vect-slp.c	2011-11-14 11:38:08 +0000
++++ new/gcc/tree-vect-slp.c	2011-11-21 06:58:40 +0000
+@@ -109,7 +109,11 @@
+   if (is_gimple_call (stmt))
+     nops = gimple_call_num_args (stmt);
+   else if (is_gimple_assign (stmt))
+-    nops = gimple_num_ops (stmt) - 1;
++    {
++      nops = gimple_num_ops (stmt) - 1;
++      if (gimple_assign_rhs_code (stmt) == COND_EXPR)
++	nops = 4;
++    }
+   else
+     return NULL;
+ 
+@@ -190,20 +194,51 @@
+   bool different_types = false;
+   bool pattern = false;
+   slp_oprnd_info oprnd_info, oprnd0_info, oprnd1_info;
++  int op_idx = 1;
++  tree compare_rhs = NULL_TREE, rhs = NULL_TREE;
++  int cond_idx = -1;
+ 
+   if (loop_vinfo)
+     loop = LOOP_VINFO_LOOP (loop_vinfo);
+ 
+   if (is_gimple_call (stmt))
+     number_of_oprnds = gimple_call_num_args (stmt);
++  else if (is_gimple_assign (stmt))
++    {
++      number_of_oprnds = gimple_num_ops (stmt) - 1;
++      if (gimple_assign_rhs_code (stmt) == COND_EXPR)
++	{ 	      
++          number_of_oprnds = 4;
++	  cond_idx = 0;
++	  rhs = gimple_assign_rhs1 (stmt);
++	}	  
++    }
+   else
+-    number_of_oprnds = gimple_num_ops (stmt) - 1;
++    return false;
+ 
+   for (i = 0; i < number_of_oprnds; i++)
+     {
+-      oprnd = gimple_op (stmt, i + 1);
++      if (compare_rhs)
++	oprnd = compare_rhs;
++      else
++        oprnd = gimple_op (stmt, op_idx++);
++
+       oprnd_info = VEC_index (slp_oprnd_info, *oprnds_info, i);
+ 
++      if (-1 < cond_idx && cond_idx < 4)
++	{
++  	  if (compare_rhs)
++	    compare_rhs = NULL_TREE;
++	  else	  
++	    oprnd = TREE_OPERAND (rhs, cond_idx++);
++	}
++		      
++      if (COMPARISON_CLASS_P (oprnd))
++        {
++          compare_rhs = TREE_OPERAND (oprnd, 1);
++          oprnd = TREE_OPERAND (oprnd, 0);
++	}
++
+       if (!vect_is_simple_use (oprnd, loop_vinfo, bb_vinfo, &def_stmt, &def,
+                                &dt)
+ 	  || (!def_stmt && dt != vect_constant_def))
+@@ -243,8 +278,7 @@
+           def_stmt = STMT_VINFO_RELATED_STMT (vinfo_for_stmt (def_stmt));
+           dt = STMT_VINFO_DEF_TYPE (vinfo_for_stmt (def_stmt));
+ 
+-          if (dt == vect_unknown_def_type
+-	      || STMT_VINFO_PATTERN_DEF_STMT (vinfo_for_stmt (def_stmt)))
++          if (dt == vect_unknown_def_type)
+             {
+               if (vect_print_dump_info (REPORT_DETAILS))
+                 fprintf (vect_dump, "Unsupported pattern.");
+@@ -423,6 +457,7 @@
+   VEC (gimple, heap) *stmts = SLP_TREE_SCALAR_STMTS (*node);
+   gimple stmt = VEC_index (gimple, stmts, 0);
+   enum tree_code first_stmt_code = ERROR_MARK, rhs_code = ERROR_MARK;
++  enum tree_code first_cond_code = ERROR_MARK;
+   tree lhs;
+   bool stop_recursion = false, need_same_oprnds = false;
+   tree vectype, scalar_type, first_op1 = NULL_TREE;
+@@ -439,11 +474,18 @@
+   VEC (slp_oprnd_info, heap) *oprnds_info;
+   unsigned int nops;
+   slp_oprnd_info oprnd_info;
++  tree cond;
+ 
+   if (is_gimple_call (stmt))
+     nops = gimple_call_num_args (stmt);
++  else if (is_gimple_assign (stmt))
++    {
++      nops = gimple_num_ops (stmt) - 1;
++      if (gimple_assign_rhs_code (stmt) == COND_EXPR)
++	nops = 4;
++    }
+   else
+-    nops = gimple_num_ops (stmt) - 1;
++    return false;
+ 
+   oprnds_info = vect_create_oprnd_info (nops, group_size);
+ 
+@@ -484,6 +526,22 @@
+ 	  return false;
+ 	}
+ 
++       if (is_gimple_assign (stmt)
++	   && gimple_assign_rhs_code (stmt) == COND_EXPR
++           && (cond = TREE_OPERAND (gimple_assign_rhs1 (stmt), 0))
++           && !COMPARISON_CLASS_P (cond))
++        {
++          if (vect_print_dump_info (REPORT_SLP))
++            {
++              fprintf (vect_dump,
++                       "Build SLP failed: condition is not comparison ");
++              print_gimple_stmt (vect_dump, stmt, 0, TDF_SLIM);
++            }
++
++          vect_free_oprnd_info (&oprnds_info);
++          return false;
++        }
++
+       scalar_type = vect_get_smallest_scalar_type (stmt, &dummy, &dummy);
+       vectype = get_vectype_for_scalar_type (scalar_type);
+       if (!vectype)
+@@ -737,7 +795,8 @@
+ 
+ 	  /* Not memory operation.  */
+ 	  if (TREE_CODE_CLASS (rhs_code) != tcc_binary
+-	      && TREE_CODE_CLASS (rhs_code) != tcc_unary)
++	      && TREE_CODE_CLASS (rhs_code) != tcc_unary
++              && rhs_code != COND_EXPR)
+ 	    {
+ 	      if (vect_print_dump_info (REPORT_SLP))
+ 		{
+@@ -750,6 +809,26 @@
+ 	      return false;
+ 	    }
+ 
++          if (rhs_code == COND_EXPR)
++            {
++              tree cond_expr = TREE_OPERAND (gimple_assign_rhs1 (stmt), 0);
++
++	      if (i == 0)
++		first_cond_code = TREE_CODE (cond_expr);
++              else if (first_cond_code != TREE_CODE (cond_expr))
++                {
++                  if (vect_print_dump_info (REPORT_SLP))
++                    {
++                      fprintf (vect_dump, "Build SLP failed: different"
++					  " operation");
++                      print_gimple_stmt (vect_dump, stmt, 0, TDF_SLIM);
++                    }
++
++		  vect_free_oprnd_info (&oprnds_info);
++                  return false;
++		}
++            }
++
+ 	  /* Find the def-stmts.  */
+ 	  if (!vect_get_and_check_slp_defs (loop_vinfo, bb_vinfo, *node, stmt,
+ 					    ncopies_for_cost, (i == 0),
+@@ -1395,7 +1474,12 @@
+       /* Collect the stores and store them in SLP_TREE_SCALAR_STMTS.  */
+       while (next)
+         {
+-          VEC_safe_push (gimple, heap, scalar_stmts, next);
++          if (STMT_VINFO_IN_PATTERN_P (vinfo_for_stmt (next))
++              && STMT_VINFO_RELATED_STMT (vinfo_for_stmt (next)))
++            VEC_safe_push (gimple, heap, scalar_stmts,
++                       STMT_VINFO_RELATED_STMT (vinfo_for_stmt (next)));
++          else
++            VEC_safe_push (gimple, heap, scalar_stmts, next);
+           next = DR_GROUP_NEXT_DR (vinfo_for_stmt (next));
+         }
+     }
+@@ -1404,7 +1488,7 @@
+       /* Collect reduction statements.  */
+       VEC (gimple, heap) *reductions = LOOP_VINFO_REDUCTIONS (loop_vinfo);
+       for (i = 0; VEC_iterate (gimple, reductions, i, next); i++)
+-        VEC_safe_push (gimple, heap, scalar_stmts, next);
++	VEC_safe_push (gimple, heap, scalar_stmts, next);
+     }
+ 
+   node = vect_create_new_slp_node (scalar_stmts);
+@@ -2160,15 +2244,15 @@
+ 
+      For example, we have two scalar operands, s1 and s2 (e.g., group of
+      strided accesses of size two), while NUNITS is four (i.e., four scalars
+-     of this type can be packed in a vector). The output vector will contain
+-     two copies of each scalar operand: {s1, s2, s1, s2}. (NUMBER_OF_COPIES
++     of this type can be packed in a vector).  The output vector will contain
++     two copies of each scalar operand: {s1, s2, s1, s2}.  (NUMBER_OF_COPIES
+      will be 2).
+ 
+      If GROUP_SIZE > NUNITS, the scalars will be split into several vectors
+      containing the operands.
+ 
+      For example, NUNITS is four as before, and the group size is 8
+-     (s1, s2, ..., s8). We will create two vectors {s1, s2, s3, s4} and
++     (s1, s2, ..., s8).  We will create two vectors {s1, s2, s3, s4} and
+      {s5, s6, s7, s8}.  */
+ 
+   number_of_copies = least_common_multiple (nunits, group_size) / group_size;
+@@ -2180,8 +2264,18 @@
+         {
+           if (is_store)
+             op = gimple_assign_rhs1 (stmt);
+-          else
++          else if (gimple_assign_rhs_code (stmt) != COND_EXPR)
+             op = gimple_op (stmt, op_num + 1);
++	  else
++	    {
++	      if (op_num == 0 || op_num == 1)
++		{
++		  tree cond = TREE_OPERAND (gimple_assign_rhs1 (stmt), 0);
++		  op = TREE_OPERAND (cond, op_num);
++		}
++	      else
++		op = TREE_OPERAND (gimple_assign_rhs1 (stmt), op_num - 1);
++	    }
+ 
+           if (reduc_index != -1)
+             {
+
+=== modified file 'gcc/tree-vect-stmts.c'
+--- old/gcc/tree-vect-stmts.c	2011-11-22 16:52:23 +0000
++++ new/gcc/tree-vect-stmts.c	2011-11-22 17:10:17 +0000
+@@ -4816,7 +4816,7 @@
+    condition operands are supportable using vec_is_simple_use.  */
+ 
+ static bool
+-vect_is_simple_cond (tree cond, loop_vec_info loop_vinfo)
++vect_is_simple_cond (tree cond, loop_vec_info loop_vinfo, bb_vec_info bb_vinfo)
+ {
+   tree lhs, rhs;
+   tree def;
+@@ -4831,7 +4831,7 @@
+   if (TREE_CODE (lhs) == SSA_NAME)
+     {
+       gimple lhs_def_stmt = SSA_NAME_DEF_STMT (lhs);
+-      if (!vect_is_simple_use (lhs, loop_vinfo, NULL, &lhs_def_stmt, &def,
++      if (!vect_is_simple_use (lhs, loop_vinfo, bb_vinfo, &lhs_def_stmt, &def,
+                                &dt))
+ 	return false;
+     }
+@@ -4842,7 +4842,7 @@
+   if (TREE_CODE (rhs) == SSA_NAME)
+     {
+       gimple rhs_def_stmt = SSA_NAME_DEF_STMT (rhs);
+-      if (!vect_is_simple_use (rhs, loop_vinfo, NULL, &rhs_def_stmt, &def,
++      if (!vect_is_simple_use (rhs, loop_vinfo, bb_vinfo, &rhs_def_stmt, &def,
+                                &dt))
+ 	return false;
+     }
+@@ -4868,7 +4868,8 @@
+ 
+ bool
+ vectorizable_condition (gimple stmt, gimple_stmt_iterator *gsi,
+-			gimple *vec_stmt, tree reduc_def, int reduc_index)
++			gimple *vec_stmt, tree reduc_def, int reduc_index,
++			slp_tree slp_node)
+ {
+   tree scalar_dest = NULL_TREE;
+   tree vec_dest = NULL_TREE;
+@@ -4885,19 +4886,24 @@
+   tree def;
+   enum vect_def_type dt, dts[4];
+   int nunits = TYPE_VECTOR_SUBPARTS (vectype);
+-  int ncopies = LOOP_VINFO_VECT_FACTOR (loop_vinfo) / nunits;
++  int ncopies;
+   enum tree_code code;
+   stmt_vec_info prev_stmt_info = NULL;
+-  int j;
++  int i, j;
++  bb_vec_info bb_vinfo = STMT_VINFO_BB_VINFO (stmt_info);
++  VEC (tree, heap) *vec_oprnds0 = NULL, *vec_oprnds1 = NULL;
++  VEC (tree, heap) *vec_oprnds2 = NULL, *vec_oprnds3 = NULL;
+ 
+-  /* FORNOW: unsupported in basic block SLP.  */
+-  gcc_assert (loop_vinfo);
++  if (slp_node || PURE_SLP_STMT (stmt_info))
++    ncopies = 1;
++  else
++    ncopies = LOOP_VINFO_VECT_FACTOR (loop_vinfo) / nunits;
+ 
+   gcc_assert (ncopies >= 1);
+-  if (reduc_index && ncopies > 1)
++  if (reduc_index && (ncopies > 1 || STMT_SLP_TYPE (stmt_info)))
+     return false; /* FORNOW */
+ 
+-  if (!STMT_VINFO_RELEVANT_P (stmt_info))
++  if (!STMT_VINFO_RELEVANT_P (stmt_info) && !bb_vinfo) 
+     return false;
+ 
+   if (STMT_VINFO_DEF_TYPE (stmt_info) != vect_internal_def
+@@ -4905,10 +4911,6 @@
+            && reduc_def))
+     return false;
+ 
+-  /* FORNOW: SLP not supported.  */
+-  if (STMT_SLP_TYPE (stmt_info))
+-    return false;
+-
+   /* FORNOW: not yet supported.  */
+   if (STMT_VINFO_LIVE_P (stmt_info))
+     {
+@@ -4932,7 +4934,7 @@
+   then_clause = TREE_OPERAND (op, 1);
+   else_clause = TREE_OPERAND (op, 2);
+ 
+-  if (!vect_is_simple_cond (cond_expr, loop_vinfo))
++  if (!vect_is_simple_cond (cond_expr, loop_vinfo, bb_vinfo))
+     return false;
+ 
+   /* We do not handle two different vector types for the condition
+@@ -4944,7 +4946,7 @@
+   if (TREE_CODE (then_clause) == SSA_NAME)
+     {
+       gimple then_def_stmt = SSA_NAME_DEF_STMT (then_clause);
+-      if (!vect_is_simple_use (then_clause, loop_vinfo, NULL,
++      if (!vect_is_simple_use (then_clause, loop_vinfo, bb_vinfo,
+ 			       &then_def_stmt, &def, &dt))
+ 	return false;
+     }
+@@ -4956,7 +4958,7 @@
+   if (TREE_CODE (else_clause) == SSA_NAME)
+     {
+       gimple else_def_stmt = SSA_NAME_DEF_STMT (else_clause);
+-      if (!vect_is_simple_use (else_clause, loop_vinfo, NULL,
++      if (!vect_is_simple_use (else_clause, loop_vinfo, bb_vinfo,
+ 			       &else_def_stmt, &def, &dt))
+ 	return false;
+     }
+@@ -4974,7 +4976,15 @@
+       return expand_vec_cond_expr_p (TREE_TYPE (op), vec_mode);
+     }
+ 
+-  /* Transform */
++  /* Transform.  */
++
++  if (!slp_node)
++    {
++      vec_oprnds0 = VEC_alloc (tree, heap, 1);
++      vec_oprnds1 = VEC_alloc (tree, heap, 1);
++      vec_oprnds2 = VEC_alloc (tree, heap, 1);
++      vec_oprnds3 = VEC_alloc (tree, heap, 1);
++    }
+ 
+   /* Handle def.  */
+   scalar_dest = gimple_assign_lhs (stmt);
+@@ -4983,67 +4993,118 @@
+   /* Handle cond expr.  */
+   for (j = 0; j < ncopies; j++)
+     {
+-      gimple new_stmt;
++      gimple new_stmt = NULL;
+       if (j == 0)
+ 	{
+-	  gimple gtemp;
+-	  vec_cond_lhs =
++          if (slp_node)
++            {
++              VEC (tree, heap) *ops = VEC_alloc (tree, heap, 4);
++              VEC (slp_void_p, heap) *vec_defs;
++
++	      vec_defs = VEC_alloc (slp_void_p, heap, 4);
++              VEC_safe_push (tree, heap, ops, TREE_OPERAND (cond_expr, 0));
++              VEC_safe_push (tree, heap, ops, TREE_OPERAND (cond_expr, 1));
++              VEC_safe_push (tree, heap, ops, then_clause);
++              VEC_safe_push (tree, heap, ops, else_clause);
++              vect_get_slp_defs (ops, slp_node, &vec_defs, -1);
++              vec_oprnds3 = (VEC (tree, heap) *) VEC_pop (slp_void_p, vec_defs);
++              vec_oprnds2 = (VEC (tree, heap) *) VEC_pop (slp_void_p, vec_defs);
++              vec_oprnds1 = (VEC (tree, heap) *) VEC_pop (slp_void_p, vec_defs);
++              vec_oprnds0 = (VEC (tree, heap) *) VEC_pop (slp_void_p, vec_defs);
++
++              VEC_free (tree, heap, ops);
++              VEC_free (slp_void_p, heap, vec_defs);
++            }
++          else
++            {
++	      gimple gtemp;
++	      vec_cond_lhs =
+ 	      vect_get_vec_def_for_operand (TREE_OPERAND (cond_expr, 0),
+ 					    stmt, NULL);
+-	  vect_is_simple_use (TREE_OPERAND (cond_expr, 0), loop_vinfo,
++	      vect_is_simple_use (TREE_OPERAND (cond_expr, 0), loop_vinfo,
+ 			      NULL, &gtemp, &def, &dts[0]);
+-	  vec_cond_rhs =
+-	      vect_get_vec_def_for_operand (TREE_OPERAND (cond_expr, 1),
+-					    stmt, NULL);
+-	  vect_is_simple_use (TREE_OPERAND (cond_expr, 1), loop_vinfo,
+-			      NULL, &gtemp, &def, &dts[1]);
+-	  if (reduc_index == 1)
+-	    vec_then_clause = reduc_def;
+-	  else
+-	    {
+-	      vec_then_clause = vect_get_vec_def_for_operand (then_clause,
+-							      stmt, NULL);
+-	      vect_is_simple_use (then_clause, loop_vinfo,
+-				  NULL, &gtemp, &def, &dts[2]);
+-	    }
+-	  if (reduc_index == 2)
+-	    vec_else_clause = reduc_def;
+-	  else
+-	    {
+-	      vec_else_clause = vect_get_vec_def_for_operand (else_clause,
+-							      stmt, NULL);
+-	      vect_is_simple_use (else_clause, loop_vinfo,
++
++	      vec_cond_rhs =
++		vect_get_vec_def_for_operand (TREE_OPERAND (cond_expr, 1),
++						stmt, NULL);
++	      vect_is_simple_use (TREE_OPERAND (cond_expr, 1), loop_vinfo,
++					NULL, &gtemp, &def, &dts[1]);
++	      if (reduc_index == 1)
++		vec_then_clause = reduc_def;
++	      else
++		{
++		  vec_then_clause = vect_get_vec_def_for_operand (then_clause,
++		 		  			      stmt, NULL);
++	          vect_is_simple_use (then_clause, loop_vinfo,
++					  NULL, &gtemp, &def, &dts[2]);
++		}
++	      if (reduc_index == 2)
++		vec_else_clause = reduc_def;
++	      else
++		{
++		  vec_else_clause = vect_get_vec_def_for_operand (else_clause,
++							      stmt, NULL);
++		  vect_is_simple_use (else_clause, loop_vinfo,
+ 				  NULL, &gtemp, &def, &dts[3]);
++		}
+ 	    }
+ 	}
+       else
+ 	{
+-	  vec_cond_lhs = vect_get_vec_def_for_stmt_copy (dts[0], vec_cond_lhs);
+-	  vec_cond_rhs = vect_get_vec_def_for_stmt_copy (dts[1], vec_cond_rhs);
++	  vec_cond_lhs = vect_get_vec_def_for_stmt_copy (dts[0],
++						VEC_pop (tree, vec_oprnds0));
++	  vec_cond_rhs = vect_get_vec_def_for_stmt_copy (dts[1],
++						VEC_pop (tree, vec_oprnds1));
+ 	  vec_then_clause = vect_get_vec_def_for_stmt_copy (dts[2],
+-							    vec_then_clause);
++						VEC_pop (tree, vec_oprnds2));
+ 	  vec_else_clause = vect_get_vec_def_for_stmt_copy (dts[3],
+-							    vec_else_clause);
++						VEC_pop (tree, vec_oprnds3));
++	}
++
++      if (!slp_node)
++        {
++	  VEC_quick_push (tree, vec_oprnds0, vec_cond_lhs);
++	  VEC_quick_push (tree, vec_oprnds1, vec_cond_rhs);
++	  VEC_quick_push (tree, vec_oprnds2, vec_then_clause);
++	  VEC_quick_push (tree, vec_oprnds3, vec_else_clause);
+ 	}
+ 
+       /* Arguments are ready.  Create the new vector stmt.  */
+-      vec_compare = build2 (TREE_CODE (cond_expr), vectype,
+-			    vec_cond_lhs, vec_cond_rhs);
+-      vec_cond_expr = build3 (VEC_COND_EXPR, vectype,
+-			      vec_compare, vec_then_clause, vec_else_clause);
+-
+-      new_stmt = gimple_build_assign (vec_dest, vec_cond_expr);
+-      new_temp = make_ssa_name (vec_dest, new_stmt);
+-      gimple_assign_set_lhs (new_stmt, new_temp);
+-      vect_finish_stmt_generation (stmt, new_stmt, gsi);
+-      if (j == 0)
+-        STMT_VINFO_VEC_STMT (stmt_info) = *vec_stmt = new_stmt;
+-      else
+-        STMT_VINFO_RELATED_STMT (prev_stmt_info) = new_stmt;
+-
+-      prev_stmt_info = vinfo_for_stmt (new_stmt);
++      FOR_EACH_VEC_ELT (tree, vec_oprnds0, i, vec_cond_lhs)
++        {
++          vec_cond_rhs = VEC_index (tree, vec_oprnds1, i);
++          vec_then_clause = VEC_index (tree, vec_oprnds2, i);
++          vec_else_clause = VEC_index (tree, vec_oprnds3, i);
++
++          vec_compare = build2 (TREE_CODE (cond_expr), vectype,
++  			       vec_cond_lhs, vec_cond_rhs);
++          vec_cond_expr = build3 (VEC_COND_EXPR, vectype,
++ 		         vec_compare, vec_then_clause, vec_else_clause);
++
++          new_stmt = gimple_build_assign (vec_dest, vec_cond_expr);
++          new_temp = make_ssa_name (vec_dest, new_stmt);
++          gimple_assign_set_lhs (new_stmt, new_temp);
++          vect_finish_stmt_generation (stmt, new_stmt, gsi);
++          if (slp_node)
++            VEC_quick_push (gimple, SLP_TREE_VEC_STMTS (slp_node), new_stmt);
++        }
++
++        if (slp_node)
++          continue;
++
++        if (j == 0)
++          STMT_VINFO_VEC_STMT (stmt_info) = *vec_stmt = new_stmt;
++        else
++          STMT_VINFO_RELATED_STMT (prev_stmt_info) = new_stmt;
++
++        prev_stmt_info = vinfo_for_stmt (new_stmt);
+     }
+ 
++  VEC_free (tree, heap, vec_oprnds0);
++  VEC_free (tree, heap, vec_oprnds1);
++  VEC_free (tree, heap, vec_oprnds2);
++  VEC_free (tree, heap, vec_oprnds3);
++
+   return true;
+ }
+ 
+@@ -5217,7 +5278,7 @@
+             || vectorizable_call (stmt, NULL, NULL)
+             || vectorizable_store (stmt, NULL, NULL, NULL)
+             || vectorizable_reduction (stmt, NULL, NULL, NULL)
+-            || vectorizable_condition (stmt, NULL, NULL, NULL, 0));
++            || vectorizable_condition (stmt, NULL, NULL, NULL, 0, NULL));
+     else
+       {
+         if (bb_vinfo)
+@@ -5227,7 +5288,8 @@
+                 || vectorizable_operation (stmt, NULL, NULL, node)
+                 || vectorizable_assignment (stmt, NULL, NULL, node)
+                 || vectorizable_load (stmt, NULL, NULL, node, NULL)
+-                || vectorizable_store (stmt, NULL, NULL, node));
++                || vectorizable_store (stmt, NULL, NULL, node)
++                || vectorizable_condition (stmt, NULL, NULL, NULL, 0, node));
+       }
+ 
+   if (!ok)
+@@ -5343,8 +5405,7 @@
+       break;
+ 
+     case condition_vec_info_type:
+-      gcc_assert (!slp_node);
+-      done = vectorizable_condition (stmt, gsi, &vec_stmt, NULL, 0);
++      done = vectorizable_condition (stmt, gsi, &vec_stmt, NULL, 0, slp_node);
+       gcc_assert (done);
+       break;
+ 
+
+=== modified file 'gcc/tree-vectorizer.h'
+--- old/gcc/tree-vectorizer.h	2011-11-22 16:52:23 +0000
++++ new/gcc/tree-vectorizer.h	2011-11-22 17:10:17 +0000
+@@ -832,7 +832,7 @@
+ extern void vect_remove_stores (gimple);
+ extern bool vect_analyze_stmt (gimple, bool *, slp_tree);
+ extern bool vectorizable_condition (gimple, gimple_stmt_iterator *, gimple *,
+-                                    tree, int);
++                                    tree, int, slp_tree);
+ extern void vect_get_load_cost (struct data_reference *, int, bool,
+                                 unsigned int *, unsigned int *);
+ extern void vect_get_store_cost (struct data_reference *, int, unsigned int *);
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106844.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106844.patch
new file mode 100644
index 0000000..e501959
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106844.patch
@@ -0,0 +1,495 @@
+2011-11-27  Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	* tree-vectorizer.h (vect_pattern_recog): Add new argument.
+	* tree-vect-loop.c (vect_analyze_loop_2): Update call to
+	vect_pattern_recog.
+	* tree-vect-patterns.c (widened_name_p): Pass basic block
+	info to vect_is_simple_use.
+	(vect_recog_dot_prod_pattern): Fail for basic blocks.
+	(vect_recog_widen_sum_pattern): Likewise.
+	(vect_handle_widen_op_by_const): Support basic blocks.
+	(vect_operation_fits_smaller_type,
+	vect_recog_over_widening_pattern): Likewise.
+	(vect_recog_mixed_size_cond_pattern): Support basic blocks.
+	Add printing.
+	(vect_mark_pattern_stmts): Update calls to new_stmt_vec_info.
+	(vect_pattern_recog_1): Check for reduction only in loops.
+	(vect_pattern_recog): Add new argument.  Support basic blocks.
+	* tree-vect-stmts.c (vectorizable_conversion): Pass basic block
+	info to vect_is_simple_use_1.
+	* tree-vect-slp.c (vect_get_and_check_slp_defs): Support basic
+	blocks.
+	(vect_slp_analyze_bb_1): Call vect_pattern_recog.
+
+	gcc/testsuite/
+	* gcc.dg/vect/bb-slp-pattern-1.c: New test.
+	* gcc.dg/vect/bb-slp-pattern-2.c: New test.
+
+=== added file 'gcc/testsuite/gcc.dg/vect/bb-slp-pattern-1.c'
+--- old/gcc/testsuite/gcc.dg/vect/bb-slp-pattern-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/bb-slp-pattern-1.c	2011-11-23 06:37:10 +0000
+@@ -0,0 +1,55 @@
++/* { dg-require-effective-target vect_int } */
++
++#include <stdarg.h>
++#include "tree-vect.h"
++
++#define N 8
++
++unsigned short X[N];
++unsigned short Y[N];
++unsigned int result[N];
++
++/* unsigned short->unsigned int widening-mult.  */
++__attribute__ ((noinline, noclone)) void 
++foo (void)
++{
++  result[0] = (unsigned int)(X[0] * Y[0]);
++  result[1] = (unsigned int)(X[1] * Y[1]);
++  result[2] = (unsigned int)(X[2] * Y[2]);
++  result[3] = (unsigned int)(X[3] * Y[3]);
++  result[4] = (unsigned int)(X[4] * Y[4]);
++  result[5] = (unsigned int)(X[5] * Y[5]);
++  result[6] = (unsigned int)(X[6] * Y[6]);
++  result[7] = (unsigned int)(X[7] * Y[7]);
++}
++
++int main (void)
++{
++  int i, tmp;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      X[i] = i;
++      Y[i] = 64-i;
++    }
++
++  foo ();
++
++  for (i = 0; i < N; i++)
++    {
++      __asm__ volatile ("");
++      tmp = X[i] * Y[i];
++      if (result[i] != tmp)
++        abort ();
++    }
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorizing stmts using SLP" 1 "slp" { target { vect_widen_mult_hi_to_si || vect_unpack } } } } */
++/* { dg-final { scan-tree-dump-times "vect_recog_widen_mult_pattern: detected" 8 "slp" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { scan-tree-dump-times "pattern recognized" 8 "slp" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { cleanup-tree-dump "slp" } } */
++
+
+=== added file 'gcc/testsuite/gcc.dg/vect/bb-slp-pattern-2.c'
+--- old/gcc/testsuite/gcc.dg/vect/bb-slp-pattern-2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/bb-slp-pattern-2.c	2011-11-23 06:37:10 +0000
+@@ -0,0 +1,53 @@
++/* { dg-require-effective-target vect_condition } */
++
++#include "tree-vect.h"
++
++#define N 128
++
++__attribute__((noinline, noclone)) void
++foo (short * __restrict__ a, int * __restrict__ b, int stride)
++{
++  int i;
++
++  for (i = 0; i < N/stride; i++, a += stride, b += stride)
++   {
++     a[0] = b[0] ? 1 : 7;
++     a[1] = b[1] ? 2 : 0;
++     a[2] = b[2] ? 3 : 0;
++     a[3] = b[3] ? 4 : 0;
++     a[4] = b[4] ? 5 : 0;
++     a[5] = b[5] ? 6 : 0;
++     a[6] = b[6] ? 7 : 0;
++     a[7] = b[7] ? 8 : 0;
++   }
++}
++
++short a[N];
++int b[N];
++int main ()
++{
++  int i;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      a[i] = i;
++      b[i] = -i;
++    }
++
++  foo (a, b, 8);
++
++  for (i = 1; i < N; i++)
++    if (a[i] != i%8 + 1)
++      abort ();
++
++  if (a[0] != 7)
++    abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "basic block vectorized using SLP" 1 "slp" { target { vect_element_align && vect_pack_trunc } } } } */
++/* { dg-final { cleanup-tree-dump "slp" } } */
++
+
+=== modified file 'gcc/tree-vect-loop.c'
+--- old/gcc/tree-vect-loop.c	2011-11-20 08:24:08 +0000
++++ new/gcc/tree-vect-loop.c	2011-11-23 06:47:35 +0000
+@@ -1458,7 +1458,7 @@
+ 
+   vect_analyze_scalar_cycles (loop_vinfo);
+ 
+-  vect_pattern_recog (loop_vinfo);
++  vect_pattern_recog (loop_vinfo, NULL);
+ 
+   /* Data-flow analysis to detect stmts that do not need to be vectorized.  */
+ 
+
+=== modified file 'gcc/tree-vect-patterns.c'
+--- old/gcc/tree-vect-patterns.c	2011-11-20 09:11:09 +0000
++++ new/gcc/tree-vect-patterns.c	2011-11-23 07:49:33 +0000
+@@ -83,11 +83,13 @@
+   tree oprnd0;
+   enum vect_def_type dt;
+   tree def;
++  bb_vec_info bb_vinfo;
+ 
+   stmt_vinfo = vinfo_for_stmt (use_stmt);
+   loop_vinfo = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
++  bb_vinfo = STMT_VINFO_BB_VINFO (stmt_vinfo);
+ 
+-  if (!vect_is_simple_use (name, loop_vinfo, NULL, def_stmt, &def, &dt))
++  if (!vect_is_simple_use (name, loop_vinfo, bb_vinfo, def_stmt, &def, &dt))
+     return false;
+ 
+   if (dt != vect_internal_def
+@@ -111,7 +113,7 @@
+       || (TYPE_PRECISION (type) < (TYPE_PRECISION (*half_type) * 2)))
+     return false;
+ 
+-  if (!vect_is_simple_use (oprnd0, loop_vinfo, NULL, &dummy_gimple, &dummy,
++  if (!vect_is_simple_use (oprnd0, loop_vinfo, bb_vinfo, &dummy_gimple, &dummy,
+                            &dt))
+     return false;
+ 
+@@ -188,9 +190,14 @@
+   gimple pattern_stmt;
+   tree prod_type;
+   loop_vec_info loop_info = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
+-  struct loop *loop = LOOP_VINFO_LOOP (loop_info);
++  struct loop *loop;
+   tree var, rhs;
+ 
++  if (!loop_info)
++    return NULL;
++
++  loop = LOOP_VINFO_LOOP (loop_info);
++
+   if (!is_gimple_assign (last_stmt))
+     return NULL;
+ 
+@@ -358,8 +365,16 @@
+ {
+   tree new_type, new_oprnd, tmp;
+   gimple new_stmt;
+-  loop_vec_info loop_info = STMT_VINFO_LOOP_VINFO (vinfo_for_stmt (stmt));
+-  struct loop *loop = LOOP_VINFO_LOOP (loop_info);
++  loop_vec_info loop_vinfo;
++  struct loop *loop = NULL;
++  bb_vec_info bb_vinfo;
++  stmt_vec_info stmt_vinfo;
++
++  stmt_vinfo = vinfo_for_stmt (stmt);
++  loop_vinfo = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
++  bb_vinfo = STMT_VINFO_BB_VINFO (stmt_vinfo);
++  if (loop_vinfo)
++    loop = LOOP_VINFO_LOOP (loop_vinfo);
+ 
+   if (code != MULT_EXPR && code != LSHIFT_EXPR)
+     return false;
+@@ -377,7 +392,9 @@
+ 
+   if (TYPE_PRECISION (type) < (TYPE_PRECISION (*half_type) * 4)
+       || !gimple_bb (def_stmt)
+-      || !flow_bb_inside_loop_p (loop, gimple_bb (def_stmt))
++      || (loop && !flow_bb_inside_loop_p (loop, gimple_bb (def_stmt)))
++      || (!loop && gimple_bb (def_stmt) != BB_VINFO_BB (bb_vinfo)
++          && gimple_code (def_stmt) != GIMPLE_PHI)
+       || !vinfo_for_stmt (def_stmt))
+     return false;
+ 
+@@ -774,9 +791,14 @@
+   tree type, half_type;
+   gimple pattern_stmt;
+   loop_vec_info loop_info = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
+-  struct loop *loop = LOOP_VINFO_LOOP (loop_info);
++  struct loop *loop;
+   tree var;
+ 
++  if (!loop_info)
++    return NULL;
++
++  loop = LOOP_VINFO_LOOP (loop_info);
++
+   if (!is_gimple_assign (last_stmt))
+     return NULL;
+ 
+@@ -877,7 +899,11 @@
+   gimple def_stmt, new_stmt;
+   bool first = false;
+   loop_vec_info loop_info = STMT_VINFO_LOOP_VINFO (vinfo_for_stmt (stmt));
+-  struct loop *loop = LOOP_VINFO_LOOP (loop_info);
++  bb_vec_info bb_info = STMT_VINFO_BB_VINFO (vinfo_for_stmt (stmt));
++  struct loop *loop = NULL;
++
++  if (loop_info)
++    loop = LOOP_VINFO_LOOP (loop_info);
+ 
+   *new_def_stmt = NULL;
+ 
+@@ -909,7 +935,9 @@
+       first = true;
+       if (!widened_name_p (oprnd, stmt, &half_type, &def_stmt, false)
+           || !gimple_bb (def_stmt)
+-          || !flow_bb_inside_loop_p (loop, gimple_bb (def_stmt))
++          || (loop && !flow_bb_inside_loop_p (loop, gimple_bb (def_stmt)))
++	  || (!loop && gimple_bb (def_stmt) != BB_VINFO_BB (bb_info)
++	      && gimple_code (def_stmt) != GIMPLE_PHI)
+           || !vinfo_for_stmt (def_stmt))
+         return false;
+     }
+@@ -1087,7 +1115,16 @@
+   int nuses = 0;
+   tree var = NULL_TREE, new_type = NULL_TREE, tmp, new_oprnd;
+   bool first;
+-  struct loop *loop = (gimple_bb (stmt))->loop_father;
++  loop_vec_info loop_vinfo;
++  struct loop *loop = NULL;
++  bb_vec_info bb_vinfo;
++  stmt_vec_info stmt_vinfo;
++
++  stmt_vinfo = vinfo_for_stmt (stmt);
++  loop_vinfo = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
++  bb_vinfo = STMT_VINFO_BB_VINFO (stmt_vinfo);
++  if (loop_vinfo)
++    loop = LOOP_VINFO_LOOP (loop_vinfo);
+ 
+   first = true;
+   while (1)
+@@ -1120,7 +1157,8 @@
+ 
+       if (nuses != 1 || !is_gimple_assign (use_stmt)
+           || !gimple_bb (use_stmt)
+-          || !flow_bb_inside_loop_p (loop, gimple_bb (use_stmt)))
++          || (loop && !flow_bb_inside_loop_p (loop, gimple_bb (use_stmt)))
++	  || (!loop && gimple_bb (use_stmt) != BB_VINFO_BB (bb_vinfo)))
+         return NULL;
+ 
+       /* Create pattern statement for STMT.  */
+@@ -1485,6 +1523,7 @@
+   enum machine_mode cmpmode;
+   gimple pattern_stmt, def_stmt;
+   loop_vec_info loop_vinfo = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
++  bb_vec_info bb_vinfo = STMT_VINFO_BB_VINFO (stmt_vinfo);
+ 
+   if (!is_gimple_assign (last_stmt)
+       || gimple_assign_rhs_code (last_stmt) != COND_EXPR
+@@ -1538,7 +1577,8 @@
+   tmp = build3 (COND_EXPR, comp_type, unshare_expr (cond_expr),
+ 		fold_convert (comp_type, then_clause),
+ 	       	fold_convert (comp_type, else_clause));
+-  def_stmt = gimple_build_assign (vect_recog_temp_ssa_var (comp_type, NULL), tmp);
++  def_stmt = gimple_build_assign (vect_recog_temp_ssa_var (comp_type, NULL),
++				  tmp);
+ 
+   pattern_stmt
+     = gimple_build_assign_with_ops (NOP_EXPR,
+@@ -1546,12 +1586,15 @@
+ 				    gimple_assign_lhs (def_stmt), NULL_TREE);
+ 
+   STMT_VINFO_PATTERN_DEF_STMT (stmt_vinfo) = def_stmt;
+-  def_stmt_info = new_stmt_vec_info (def_stmt, loop_vinfo, NULL);
++  def_stmt_info = new_stmt_vec_info (def_stmt, loop_vinfo, bb_vinfo);
+   set_vinfo_for_stmt (def_stmt, def_stmt_info);
+   STMT_VINFO_VECTYPE (def_stmt_info) = comp_vectype;
+   *type_in = vectype;
+   *type_out = vectype;
+ 
++  if (vect_print_dump_info (REPORT_DETAILS))
++    fprintf (vect_dump, "vect_recog_mixed_size_cond_pattern: detected: ");
++
+   return pattern_stmt;
+ }
+ 
+@@ -1565,10 +1608,11 @@
+   stmt_vec_info pattern_stmt_info, def_stmt_info;
+   stmt_vec_info orig_stmt_info = vinfo_for_stmt (orig_stmt);
+   loop_vec_info loop_vinfo = STMT_VINFO_LOOP_VINFO (orig_stmt_info);
++  bb_vec_info bb_vinfo = STMT_VINFO_BB_VINFO (orig_stmt_info);
+   gimple def_stmt;
+ 
+   set_vinfo_for_stmt (pattern_stmt,
+-                      new_stmt_vec_info (pattern_stmt, loop_vinfo, NULL));
++                      new_stmt_vec_info (pattern_stmt, loop_vinfo, bb_vinfo));
+   gimple_set_bb (pattern_stmt, gimple_bb (orig_stmt));
+   pattern_stmt_info = vinfo_for_stmt (pattern_stmt);
+ 
+@@ -1586,7 +1630,7 @@
+       def_stmt_info = vinfo_for_stmt (def_stmt);
+       if (def_stmt_info == NULL)
+ 	{
+-	  def_stmt_info = new_stmt_vec_info (def_stmt, loop_vinfo, NULL);
++	  def_stmt_info = new_stmt_vec_info (def_stmt, loop_vinfo, bb_vinfo);
+ 	  set_vinfo_for_stmt (def_stmt, def_stmt_info);
+ 	}
+       gimple_set_bb (def_stmt, gimple_bb (orig_stmt));
+@@ -1697,9 +1741,10 @@
+ 
+   /* Patterns cannot be vectorized using SLP, because they change the order of
+      computation.  */
+-  FOR_EACH_VEC_ELT (gimple, LOOP_VINFO_REDUCTIONS (loop_vinfo), i, next)
+-    if (next == stmt)
+-      VEC_ordered_remove (gimple, LOOP_VINFO_REDUCTIONS (loop_vinfo), i); 
++  if (loop_vinfo)
++    FOR_EACH_VEC_ELT (gimple, LOOP_VINFO_REDUCTIONS (loop_vinfo), i, next)
++      if (next == stmt)
++        VEC_ordered_remove (gimple, LOOP_VINFO_REDUCTIONS (loop_vinfo), i);
+ 
+   /* It is possible that additional pattern stmts are created and inserted in
+      STMTS_TO_REPLACE.  We create a stmt_info for each of them, and mark the
+@@ -1799,26 +1844,46 @@
+    be recorded in S3.  */
+ 
+ void
+-vect_pattern_recog (loop_vec_info loop_vinfo)
++vect_pattern_recog (loop_vec_info loop_vinfo, bb_vec_info bb_vinfo)
+ {
+-  struct loop *loop = LOOP_VINFO_LOOP (loop_vinfo);
+-  basic_block *bbs = LOOP_VINFO_BBS (loop_vinfo);
+-  unsigned int nbbs = loop->num_nodes;
++  struct loop *loop;
++  basic_block *bbs, bb;
++  unsigned int nbbs;
+   gimple_stmt_iterator si;
+   unsigned int i, j;
+   gimple (* vect_recog_func_ptr) (VEC (gimple, heap) **, tree *, tree *);
+   VEC (gimple, heap) *stmts_to_replace = VEC_alloc (gimple, heap, 1);
++  gimple stmt;
+ 
+   if (vect_print_dump_info (REPORT_DETAILS))
+     fprintf (vect_dump, "=== vect_pattern_recog ===");
+ 
+-  /* Scan through the loop stmts, applying the pattern recognition
++  if (loop_vinfo)
++    {
++      loop = LOOP_VINFO_LOOP (loop_vinfo);
++      bbs = LOOP_VINFO_BBS (loop_vinfo);
++      nbbs = loop->num_nodes;
++    }
++  else
++    {
++      bb = BB_VINFO_BB (bb_vinfo);
++      nbbs = 1;
++      bbs = XNEW (basic_block);
++      bbs[0] = bb;
++    }
++
++  /* Scan through the stmts, applying the pattern recognition
+      functions starting at each stmt visited:  */
+   for (i = 0; i < nbbs; i++)
+     {
+       basic_block bb = bbs[i];
+       for (si = gsi_start_bb (bb); !gsi_end_p (si); gsi_next (&si))
+         {
++	  if (bb_vinfo && (stmt = gsi_stmt (si))
++	      && vinfo_for_stmt (stmt)
++	      && !STMT_VINFO_VECTORIZABLE (vinfo_for_stmt (stmt)))
++	   continue;
++
+           /* Scan over all generic vect_recog_xxx_pattern functions.  */
+           for (j = 0; j < NUM_PATTERNS; j++)
+             {
+@@ -1830,4 +1895,6 @@
+     }
+ 
+   VEC_free (gimple, heap, stmts_to_replace);
++  if (bb_vinfo)
++    free (bbs);
+ }
+
+=== modified file 'gcc/tree-vect-slp.c'
+--- old/gcc/tree-vect-slp.c	2011-11-21 06:58:40 +0000
++++ new/gcc/tree-vect-slp.c	2011-11-23 06:47:35 +0000
+@@ -255,12 +255,14 @@
+       /* Check if DEF_STMT is a part of a pattern in LOOP and get the def stmt
+          from the pattern.  Check that all the stmts of the node are in the
+          pattern.  */
+-      if (loop && def_stmt && gimple_bb (def_stmt)
+-          && flow_bb_inside_loop_p (loop, gimple_bb (def_stmt))
++      if (def_stmt && gimple_bb (def_stmt)
++          && ((loop && flow_bb_inside_loop_p (loop, gimple_bb (def_stmt)))
++	      || (!loop && gimple_bb (def_stmt) == BB_VINFO_BB (bb_vinfo)
++		  && gimple_code (def_stmt) != GIMPLE_PHI))
+           && vinfo_for_stmt (def_stmt)
+           && STMT_VINFO_IN_PATTERN_P (vinfo_for_stmt (def_stmt))
+-          && !STMT_VINFO_RELEVANT (vinfo_for_stmt (def_stmt))
+-          && !STMT_VINFO_LIVE_P (vinfo_for_stmt (def_stmt)))
++	  && !STMT_VINFO_RELEVANT (vinfo_for_stmt (def_stmt))
++	  && !STMT_VINFO_LIVE_P (vinfo_for_stmt (def_stmt)))
+         {
+           pattern = true;
+           if (!first && !oprnd_info->first_pattern)
+@@ -1972,6 +1974,8 @@
+       return NULL;
+     }
+ 
++   vect_pattern_recog (NULL, bb_vinfo);
++
+    if (!vect_analyze_data_ref_dependences (NULL, bb_vinfo, &max_vf, 
+                                            &data_dependence_in_bb)
+        || min_vf > max_vf
+
+=== modified file 'gcc/tree-vect-stmts.c'
+--- old/gcc/tree-vect-stmts.c	2011-11-22 17:10:17 +0000
++++ new/gcc/tree-vect-stmts.c	2011-11-23 06:47:35 +0000
+@@ -3451,11 +3451,11 @@
+ 	  /* For WIDEN_MULT_EXPR, if OP0 is a constant, use the type of
+ 	     OP1.  */
+           if (CONSTANT_CLASS_P (op0))
+-            ok = vect_is_simple_use_1 (op1, loop_vinfo, NULL,
++            ok = vect_is_simple_use_1 (op1, loop_vinfo, bb_vinfo,
+                              &def_stmt, &def, &dt[1], &vectype_in);
+           else
+-            ok = vect_is_simple_use (op1, loop_vinfo, NULL, &def_stmt, &def,
+-                                     &dt[1]);
++            ok = vect_is_simple_use (op1, loop_vinfo, bb_vinfo, &def_stmt,
++				     &def, &dt[1]);
+ 
+           if (!ok)
+             {
+
+=== modified file 'gcc/tree-vectorizer.h'
+--- old/gcc/tree-vectorizer.h	2011-11-22 17:10:17 +0000
++++ new/gcc/tree-vectorizer.h	2011-11-23 06:47:35 +0000
+@@ -918,7 +918,7 @@
+    in the future.  */
+ typedef gimple (* vect_recog_func_ptr) (VEC (gimple, heap) **, tree *, tree *);
+ #define NUM_PATTERNS 7 
+-void vect_pattern_recog (loop_vec_info);
++void vect_pattern_recog (loop_vec_info, bb_vec_info);
+ 
+ /* In tree-vectorizer.c.  */
+ unsigned vectorize_loops (void);
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106845.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106845.patch
new file mode 100644
index 0000000..17cfd10
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106845.patch
@@ -0,0 +1,1818 @@
+2011-11-28  David Alan Gilbert  <david.gilbert@linaro.org>
+
+	Backport from mainline (svn r19983):
+
+	2011-10-14  David Alan Gilbert  <david.gilbert@linaro.org>
+
+	gcc/testsuite/
+	* gcc.dg/di-longlong64-sync-1.c: New test.
+	* gcc.dg/di-sync-multithread.c: New test.
+	* gcc.target/arm/di-longlong64-sync-withhelpers.c: New test.
+	* gcc.target/arm/di-longlong64-sync-withldrexd.c: New test.
+	* lib/target-supports.exp: (arm_arch_*_ok): Series of effective-target
+	tests for v5, v6, v6k, and v7-a, and add-options helpers.
+	(check_effective_target_arm_arm_ok): New helper.
+	(check_effective_target_sync_longlong): New helper.
+
+2011-11-28  David Alan Gilbert  <david.gilbert@linaro.org>
+
+	Backport from mainline (svn r19982):
+
+	2011-10-14  David Alan Gilbert  <david.gilbert@linaro.org>
+
+	gcc/
+	* config/arm/linux-atomic-64bit.c: New (based on linux-atomic.c).
+	* config/arm/linux-atomic.c: Change comment to point to 64bit version.
+	(SYNC_LOCK_RELEASE): Instantiate 64bit version.
+	* config/arm/t-linux-eabi: Pull in linux-atomic-64bit.c.
+
+2011-11-28  David Alan Gilbert  <david.gilbert@linaro.org>
+
+	Backport from mainline (svn r19981):
+
+	2011-10-14  David Alan Gilbert  <david.gilbert@linaro.org>
+
+	gcc/
+	* config/arm/arm.c (arm_output_ldrex): Support ldrexd.
+	(arm_output_strex): Support strexd.
+	(arm_output_it): New helper to output it in Thumb2 mode only.
+	(arm_output_sync_loop): Support DI mode.  Change comment to
+	not support const_int.
+	(arm_expand_sync): Support DI mode.
+	* config/arm/arm.h (TARGET_HAVE_LDREXBHD): Split into LDREXBH
+	and LDREXD.
+	* config/arm/iterators.md (NARROW): move from sync.md.
+	(QHSD): New iterator for all current ARM integer modes.
+	(SIDI): New iterator for SI and DI modes only.
+	* config/arm/sync.md (sync_predtab): New mode_attr.
+	(sync_compare_and_swapsi): Fold into sync_compare_and_swap<mode>.
+	(sync_lock_test_and_setsi): Fold into sync_lock_test_and_setsi<mode>.
+	(sync_<sync_optab>si): Fold into sync_<sync_optab><mode>.
+	(sync_nandsi): Fold into sync_nand<mode>.
+	(sync_new_<sync_optab>si): Fold into sync_new_<sync_optab><mode>.
+	(sync_new_nandsi): Fold into sync_new_nand<mode>.
+	(sync_old_<sync_optab>si): Fold into sync_old_<sync_optab><mode>.
+	(sync_old_nandsi): Fold into sync_old_nand<mode>.
+	(sync_compare_and_swap<mode>): Support SI & DI.
+	(sync_lock_test_and_set<mode>): Likewise.
+	(sync_<sync_optab><mode>): Likewise.
+	(sync_nand<mode>): Likewise.
+	(sync_new_<sync_optab><mode>): Likewise.
+	(sync_new_nand<mode>): Likewise.
+	(sync_old_<sync_optab><mode>): Likewise.
+	(sync_old_nand<mode>): Likewise.
+	(arm_sync_compare_and_swapsi): Turn into iterator on SI & DI.
+	(arm_sync_lock_test_and_setsi): Likewise.
+	(arm_sync_new_<sync_optab>si): Likewise.
+	(arm_sync_new_nandsi): Likewise.
+	(arm_sync_old_<sync_optab>si): Likewise.
+	(arm_sync_old_nandsi): Likewise.
+	(arm_sync_compare_and_swap<mode> NARROW): use sync_predtab, fix indent.
+	(arm_sync_lock_test_and_setsi<mode> NARROW): Likewise.
+	(arm_sync_new_<sync_optab><mode> NARROW): Likewise.
+	(arm_sync_new_nand<mode> NARROW): Likewise.
+	(arm_sync_old_<sync_optab><mode> NARROW): Likewise.
+	(arm_sync_old_nand<mode> NARROW): Likewise.
+
+2011-11-28  David Alan Gilbert  <david.gilbert@linaro.org>
+
+	Backport from mainline (svn r19980):
+
+	2011-10-14  David Alan Gilbert  <david.gilbert@linaro.org>
+
+	PR target/48126
+
+	gcc/
+	* config/arm/arm.c (arm_output_sync_loop): Move label before barrier.
+
+2011-11-28  David Alan Gilbert  <david.gilbert@linaro.org>
+
+	Backport from mainline (svn r19979):
+
+	2011-10-14  David Alan Gilbert  <david.gilbert@linaro.org>
+
+	gcc/
+	* config/arm/arm.h (TARGET_HAVE_DMB_MCR): MCR Not available in Thumb1.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-11-21 01:45:54 +0000
++++ new/gcc/config/arm/arm.c	2011-11-28 15:07:01 +0000
+@@ -24307,12 +24307,26 @@
+ 		  rtx target,
+ 		  rtx memory)
+ {
+-  const char *suffix = arm_ldrex_suffix (mode);
+-  rtx operands[2];
++  rtx operands[3];
+ 
+   operands[0] = target;
+-  operands[1] = memory;
+-  arm_output_asm_insn (emit, 0, operands, "ldrex%s\t%%0, %%C1", suffix);
++  if (mode != DImode)
++    {
++      const char *suffix = arm_ldrex_suffix (mode);
++      operands[1] = memory;
++      arm_output_asm_insn (emit, 0, operands, "ldrex%s\t%%0, %%C1", suffix);
++    }
++  else
++    {
++      /* The restrictions on target registers in ARM mode are that the two
++	 registers are consecutive and the first one is even; Thumb is
++	 actually more flexible, but DI should give us this anyway.
++	 Note that the 1st register always gets the lowest word in memory.  */
++      gcc_assert ((REGNO (target) & 1) == 0);
++      operands[1] = gen_rtx_REG (SImode, REGNO (target) + 1);
++      operands[2] = memory;
++      arm_output_asm_insn (emit, 0, operands, "ldrexd\t%%0, %%1, %%C2");
++    }
+ }
+ 
+ /* Emit a strex{b,h,d, } instruction appropriate for the specified
+@@ -24325,14 +24339,41 @@
+ 		  rtx value,
+ 		  rtx memory)
+ {
+-  const char *suffix = arm_ldrex_suffix (mode);
+-  rtx operands[3];
++  rtx operands[4];
+ 
+   operands[0] = result;
+   operands[1] = value;
+-  operands[2] = memory;
+-  arm_output_asm_insn (emit, 0, operands, "strex%s%s\t%%0, %%1, %%C2", suffix,
+-		       cc);
++  if (mode != DImode)
++    {
++      const char *suffix = arm_ldrex_suffix (mode);
++      operands[2] = memory;
++      arm_output_asm_insn (emit, 0, operands, "strex%s%s\t%%0, %%1, %%C2",
++			  suffix, cc);
++    }
++  else
++    {
++      /* The restrictions on target registers in ARM mode are that the two
++	 registers are consecutive and the first one is even; Thumb is
++	 actually more flexible, but DI should give us this anyway.
++	 Note that the 1st register always gets the lowest word in memory.  */
++      gcc_assert ((REGNO (value) & 1) == 0 || TARGET_THUMB2);
++      operands[2] = gen_rtx_REG (SImode, REGNO (value) + 1);
++      operands[3] = memory;
++      arm_output_asm_insn (emit, 0, operands, "strexd%s\t%%0, %%1, %%2, %%C3",
++			   cc);
++    }
++}
++
++/* Helper to emit an it instruction in Thumb2 mode only; although the assembler
++   will ignore it in ARM mode, emitting it will mess up instruction counts we
++   sometimes keep 'flags' are the extra t's and e's if it's more than one
++   instruction that is conditional.  */
++static void
++arm_output_it (emit_f emit, const char *flags, const char *cond)
++{
++  rtx operands[1]; /* Don't actually use the operand.  */
++  if (TARGET_THUMB2)
++    arm_output_asm_insn (emit, 0, operands, "it%s\t%s", flags, cond);
+ }
+ 
+ /* Helper to emit a two operand instruction.  */
+@@ -24374,7 +24415,7 @@
+ 
+    required_value:
+ 
+-   RTX register or const_int representing the required old_value for
++   RTX register representing the required old_value for
+    the modify to continue, if NULL no comparsion is performed.  */
+ static void
+ arm_output_sync_loop (emit_f emit,
+@@ -24388,7 +24429,13 @@
+ 		      enum attr_sync_op sync_op,
+ 		      int early_barrier_required)
+ {
+-  rtx operands[1];
++  rtx operands[2];
++  /* We'll use the lo for the normal rtx in the none-DI case
++     as well as the least-sig word in the DI case.  */
++  rtx old_value_lo, required_value_lo, new_value_lo, t1_lo;
++  rtx old_value_hi, required_value_hi, new_value_hi, t1_hi;
++
++  bool is_di = mode == DImode;
+ 
+   gcc_assert (t1 != t2);
+ 
+@@ -24399,82 +24446,142 @@
+ 
+   arm_output_ldrex (emit, mode, old_value, memory);
+ 
++  if (is_di)
++    {
++      old_value_lo = gen_lowpart (SImode, old_value);
++      old_value_hi = gen_highpart (SImode, old_value);
++      if (required_value)
++	{
++	  required_value_lo = gen_lowpart (SImode, required_value);
++	  required_value_hi = gen_highpart (SImode, required_value);
++	}
++      else
++	{
++	  /* Silence false potentially unused warning.  */
++	  required_value_lo = NULL_RTX;
++	  required_value_hi = NULL_RTX;
++	}
++      new_value_lo = gen_lowpart (SImode, new_value);
++      new_value_hi = gen_highpart (SImode, new_value);
++      t1_lo = gen_lowpart (SImode, t1);
++      t1_hi = gen_highpart (SImode, t1);
++    }
++  else
++    {
++      old_value_lo = old_value;
++      new_value_lo = new_value;
++      required_value_lo = required_value;
++      t1_lo = t1;
++
++      /* Silence false potentially unused warning.  */
++      t1_hi = NULL_RTX;
++      new_value_hi = NULL_RTX;
++      required_value_hi = NULL_RTX;
++      old_value_hi = NULL_RTX;
++    }
++
+   if (required_value)
+     {
+-      rtx operands[2];
++      operands[0] = old_value_lo;
++      operands[1] = required_value_lo;
+ 
+-      operands[0] = old_value;
+-      operands[1] = required_value;
+       arm_output_asm_insn (emit, 0, operands, "cmp\t%%0, %%1");
++      if (is_di)
++        {
++          arm_output_it (emit, "", "eq");
++          arm_output_op2 (emit, "cmpeq", old_value_hi, required_value_hi);
++        }
+       arm_output_asm_insn (emit, 0, operands, "bne\t%sLSYB%%=", LOCAL_LABEL_PREFIX);
+     }
+ 
+   switch (sync_op)
+     {
+     case SYNC_OP_ADD:
+-      arm_output_op3 (emit, "add", t1, old_value, new_value);
++      arm_output_op3 (emit, is_di ? "adds" : "add",
++		      t1_lo, old_value_lo, new_value_lo);
++      if (is_di)
++	arm_output_op3 (emit, "adc", t1_hi, old_value_hi, new_value_hi);
+       break;
+ 
+     case SYNC_OP_SUB:
+-      arm_output_op3 (emit, "sub", t1, old_value, new_value);
++      arm_output_op3 (emit, is_di ? "subs" : "sub",
++		      t1_lo, old_value_lo, new_value_lo);
++      if (is_di)
++	arm_output_op3 (emit, "sbc", t1_hi, old_value_hi, new_value_hi);
+       break;
+ 
+     case SYNC_OP_IOR:
+-      arm_output_op3 (emit, "orr", t1, old_value, new_value);
++      arm_output_op3 (emit, "orr", t1_lo, old_value_lo, new_value_lo);
++      if (is_di)
++	arm_output_op3 (emit, "orr", t1_hi, old_value_hi, new_value_hi);
+       break;
+ 
+     case SYNC_OP_XOR:
+-      arm_output_op3 (emit, "eor", t1, old_value, new_value);
++      arm_output_op3 (emit, "eor", t1_lo, old_value_lo, new_value_lo);
++      if (is_di)
++	arm_output_op3 (emit, "eor", t1_hi, old_value_hi, new_value_hi);
+       break;
+ 
+     case SYNC_OP_AND:
+-      arm_output_op3 (emit,"and", t1, old_value, new_value);
++      arm_output_op3 (emit,"and", t1_lo, old_value_lo, new_value_lo);
++      if (is_di)
++	arm_output_op3 (emit, "and", t1_hi, old_value_hi, new_value_hi);
+       break;
+ 
+     case SYNC_OP_NAND:
+-      arm_output_op3 (emit, "and", t1, old_value, new_value);
+-      arm_output_op2 (emit, "mvn", t1, t1);
++      arm_output_op3 (emit, "and", t1_lo, old_value_lo, new_value_lo);
++      if (is_di)
++	arm_output_op3 (emit, "and", t1_hi, old_value_hi, new_value_hi);
++      arm_output_op2 (emit, "mvn", t1_lo, t1_lo);
++      if (is_di)
++	arm_output_op2 (emit, "mvn", t1_hi, t1_hi);
+       break;
+ 
+     case SYNC_OP_NONE:
+       t1 = new_value;
++      t1_lo = new_value_lo;
++      if (is_di)
++	t1_hi = new_value_hi;
+       break;
+     }
+ 
++  /* Note that the result of strex is a 0/1 flag that's always 1 register.  */
+   if (t2)
+     {
+-       arm_output_strex (emit, mode, "", t2, t1, memory);
+-       operands[0] = t2;
+-       arm_output_asm_insn (emit, 0, operands, "teq\t%%0, #0");
+-       arm_output_asm_insn (emit, 0, operands, "bne\t%sLSYT%%=",
+-			    LOCAL_LABEL_PREFIX);
++      arm_output_strex (emit, mode, "", t2, t1, memory);
++      operands[0] = t2;
++      arm_output_asm_insn (emit, 0, operands, "teq\t%%0, #0");
++      arm_output_asm_insn (emit, 0, operands, "bne\t%sLSYT%%=",
++			   LOCAL_LABEL_PREFIX);
+     }
+   else
+     {
+       /* Use old_value for the return value because for some operations
+ 	 the old_value can easily be restored.  This saves one register.  */
+-      arm_output_strex (emit, mode, "", old_value, t1, memory);
+-      operands[0] = old_value;
++      arm_output_strex (emit, mode, "", old_value_lo, t1, memory);
++      operands[0] = old_value_lo;
+       arm_output_asm_insn (emit, 0, operands, "teq\t%%0, #0");
+       arm_output_asm_insn (emit, 0, operands, "bne\t%sLSYT%%=",
+ 			   LOCAL_LABEL_PREFIX);
+ 
++      /* Note that we only used the _lo half of old_value as a temporary
++	 so in DI we don't have to restore the _hi part.  */
+       switch (sync_op)
+ 	{
+ 	case SYNC_OP_ADD:
+-	  arm_output_op3 (emit, "sub", old_value, t1, new_value);
++	  arm_output_op3 (emit, "sub", old_value_lo, t1_lo, new_value_lo);
+ 	  break;
+ 
+ 	case SYNC_OP_SUB:
+-	  arm_output_op3 (emit, "add", old_value, t1, new_value);
++	  arm_output_op3 (emit, "add", old_value_lo, t1_lo, new_value_lo);
+ 	  break;
+ 
+ 	case SYNC_OP_XOR:
+-	  arm_output_op3 (emit, "eor", old_value, t1, new_value);
++	  arm_output_op3 (emit, "eor", old_value_lo, t1_lo, new_value_lo);
+ 	  break;
+ 
+ 	case SYNC_OP_NONE:
+-	  arm_output_op2 (emit, "mov", old_value, required_value);
++	  arm_output_op2 (emit, "mov", old_value_lo, required_value_lo);
+ 	  break;
+ 
+ 	default:
+@@ -24482,8 +24589,11 @@
+ 	}
+     }
+ 
++  /* Note: label is before barrier so that in cmp failure case we still get
++     a barrier to stop subsequent loads floating upwards past the ldrex
++     PR target/48126.  */
++  arm_output_asm_insn (emit, 1, operands, "%sLSYB%%=:", LOCAL_LABEL_PREFIX);
+   arm_process_output_memory_barrier (emit, NULL);
+-  arm_output_asm_insn (emit, 1, operands, "%sLSYB%%=:", LOCAL_LABEL_PREFIX);
+ }
+ 
+ static rtx
+@@ -24577,7 +24687,7 @@
+     target = gen_reg_rtx (mode);
+ 
+   memory = arm_legitimize_sync_memory (memory);
+-  if (mode != SImode)
++  if (mode != SImode && mode != DImode)
+     {
+       rtx load_temp = gen_reg_rtx (SImode);
+ 
+
+=== modified file 'gcc/config/arm/arm.h'
+--- old/gcc/config/arm/arm.h	2011-11-21 01:45:54 +0000
++++ new/gcc/config/arm/arm.h	2011-11-28 15:07:01 +0000
+@@ -300,7 +300,8 @@
+ #define TARGET_HAVE_DMB		(arm_arch7)
+ 
+ /* Nonzero if this chip implements a memory barrier via CP15.  */
+-#define TARGET_HAVE_DMB_MCR	(arm_arch6k && ! TARGET_HAVE_DMB)
++#define TARGET_HAVE_DMB_MCR	(arm_arch6 && ! TARGET_HAVE_DMB \
++				 && ! TARGET_THUMB1)
+ 
+ /* Nonzero if this chip implements a memory barrier instruction.  */
+ #define TARGET_HAVE_MEMORY_BARRIER (TARGET_HAVE_DMB || TARGET_HAVE_DMB_MCR)
+@@ -308,8 +309,12 @@
+ /* Nonzero if this chip supports ldrex and strex */
+ #define TARGET_HAVE_LDREX	((arm_arch6 && TARGET_ARM) || arm_arch7)
+ 
+-/* Nonzero if this chip supports ldrex{bhd} and strex{bhd}.  */
+-#define TARGET_HAVE_LDREXBHD	((arm_arch6k && TARGET_ARM) || arm_arch7)
++/* Nonzero if this chip supports ldrex{bh} and strex{bh}.  */
++#define TARGET_HAVE_LDREXBH	((arm_arch6k && TARGET_ARM) || arm_arch7)
++
++/* Nonzero if this chip supports ldrexd and strexd.  */
++#define TARGET_HAVE_LDREXD	(((arm_arch6k && TARGET_ARM) || arm_arch7) \
++				 && arm_arch_notm)
+ 
+ /* Nonzero if integer division instructions supported.  */
+ #define TARGET_IDIV		((TARGET_ARM && arm_arch_arm_hwdiv) \
+
+=== modified file 'gcc/config/arm/iterators.md'
+--- old/gcc/config/arm/iterators.md	2011-10-23 13:33:07 +0000
++++ new/gcc/config/arm/iterators.md	2011-11-28 15:07:01 +0000
+@@ -33,6 +33,15 @@
+ ;; A list of integer modes that are up to one word long
+ (define_mode_iterator QHSI [QI HI SI])
+ 
++;; A list of integer modes that are less than a word
++(define_mode_iterator NARROW [QI HI])
++
++;; A list of all the integer modes upto 64bit
++(define_mode_iterator QHSD [QI HI SI DI])
++
++;; A list of the 32bit and 64bit integer modes
++(define_mode_iterator SIDI [SI DI])
++
+ ;; Integer element sizes implemented by IWMMXT.
+ (define_mode_iterator VMMX [V2SI V4HI V8QI])
+ 
+
+=== added file 'gcc/config/arm/linux-atomic-64bit.c'
+--- old/gcc/config/arm/linux-atomic-64bit.c	1970-01-01 00:00:00 +0000
++++ new/gcc/config/arm/linux-atomic-64bit.c	2011-10-14 15:50:44 +0000
+@@ -0,0 +1,166 @@
++/* 64bit Linux-specific atomic operations for ARM EABI.
++   Copyright (C) 2008, 2009, 2010, 2011 Free Software Foundation, Inc.
++   Based on linux-atomic.c
++
++   64 bit additions david.gilbert@linaro.org
++
++This file is part of GCC.
++
++GCC is free software; you can redistribute it and/or modify it under
++the terms of the GNU General Public License as published by the Free
++Software Foundation; either version 3, or (at your option) any later
++version.
++
++GCC is distributed in the hope that it will be useful, but WITHOUT ANY
++WARRANTY; without even the implied warranty of MERCHANTABILITY or
++FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
++for more details.
++
++Under Section 7 of GPL version 3, you are granted additional
++permissions described in the GCC Runtime Library Exception, version
++3.1, as published by the Free Software Foundation.
++
++You should have received a copy of the GNU General Public License and
++a copy of the GCC Runtime Library Exception along with this program;
++see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
++<http://www.gnu.org/licenses/>.  */
++
++/* 64bit helper functions for atomic operations; the compiler will
++   call these when the code is compiled for a CPU without ldrexd/strexd.
++   (If the CPU had those then the compiler inlines the operation).
++
++   These helpers require a kernel helper that's only present on newer
++   kernels; we check for that in an init section and bail out rather
++   unceremoneously.  */
++
++extern unsigned int __write (int fd, const void *buf, unsigned int count);
++extern void abort (void);
++
++/* Kernel helper for compare-and-exchange.  */
++typedef int (__kernel_cmpxchg64_t) (const long long* oldval,
++					const long long* newval,
++					long long *ptr);
++#define __kernel_cmpxchg64 (*(__kernel_cmpxchg64_t *) 0xffff0f60)
++
++/* Kernel helper page version number.  */
++#define __kernel_helper_version (*(unsigned int *)0xffff0ffc)
++
++/* Check that the kernel has a new enough version at load.  */
++static void __check_for_sync8_kernelhelper (void)
++{
++  if (__kernel_helper_version < 5)
++    {
++      const char err[] = "A newer kernel is required to run this binary. "
++				"(__kernel_cmpxchg64 helper)\n";
++      /* At this point we need a way to crash with some information
++	 for the user - I'm not sure I can rely on much else being
++	 available at this point, so do the same as generic-morestack.c
++	 write () and abort ().  */
++      __write (2 /* stderr.  */, err, sizeof (err));
++      abort ();
++    }
++};
++
++static void (*__sync8_kernelhelper_inithook[]) (void)
++		__attribute__ ((used, section (".init_array"))) = {
++  &__check_for_sync8_kernelhelper
++};
++
++#define HIDDEN __attribute__ ((visibility ("hidden")))
++
++#define FETCH_AND_OP_WORD64(OP, PFX_OP, INF_OP)			\
++  long long HIDDEN						\
++  __sync_fetch_and_##OP##_8 (long long *ptr, long long val)	\
++  {								\
++    int failure;						\
++    long long tmp,tmp2;						\
++								\
++    do {							\
++      tmp = *ptr;						\
++      tmp2 = PFX_OP (tmp INF_OP val);				\
++      failure = __kernel_cmpxchg64 (&tmp, &tmp2, ptr);		\
++    } while (failure != 0);					\
++								\
++    return tmp;							\
++  }
++
++FETCH_AND_OP_WORD64 (add,   , +)
++FETCH_AND_OP_WORD64 (sub,   , -)
++FETCH_AND_OP_WORD64 (or,    , |)
++FETCH_AND_OP_WORD64 (and,   , &)
++FETCH_AND_OP_WORD64 (xor,   , ^)
++FETCH_AND_OP_WORD64 (nand, ~, &)
++
++#define NAME_oldval(OP, WIDTH) __sync_fetch_and_##OP##_##WIDTH
++#define NAME_newval(OP, WIDTH) __sync_##OP##_and_fetch_##WIDTH
++
++/* Implement both __sync_<op>_and_fetch and __sync_fetch_and_<op> for
++   subword-sized quantities.  */
++
++#define OP_AND_FETCH_WORD64(OP, PFX_OP, INF_OP)			\
++  long long HIDDEN						\
++  __sync_##OP##_and_fetch_8 (long long *ptr, long long val)	\
++  {								\
++    int failure;						\
++    long long tmp,tmp2;						\
++								\
++    do {							\
++      tmp = *ptr;						\
++      tmp2 = PFX_OP (tmp INF_OP val);				\
++      failure = __kernel_cmpxchg64 (&tmp, &tmp2, ptr);		\
++    } while (failure != 0);					\
++								\
++    return tmp2;						\
++  }
++
++OP_AND_FETCH_WORD64 (add,   , +)
++OP_AND_FETCH_WORD64 (sub,   , -)
++OP_AND_FETCH_WORD64 (or,    , |)
++OP_AND_FETCH_WORD64 (and,   , &)
++OP_AND_FETCH_WORD64 (xor,   , ^)
++OP_AND_FETCH_WORD64 (nand, ~, &)
++
++long long HIDDEN
++__sync_val_compare_and_swap_8 (long long *ptr, long long oldval,
++				long long newval)
++{
++  int failure;
++  long long actual_oldval;
++
++  while (1)
++    {
++      actual_oldval = *ptr;
++
++      if (__builtin_expect (oldval != actual_oldval, 0))
++	return actual_oldval;
++
++      failure = __kernel_cmpxchg64 (&actual_oldval, &newval, ptr);
++
++      if (__builtin_expect (!failure, 1))
++	return oldval;
++    }
++}
++
++typedef unsigned char bool;
++
++bool HIDDEN
++__sync_bool_compare_and_swap_8 (long long *ptr, long long oldval,
++				 long long newval)
++{
++  int failure = __kernel_cmpxchg64 (&oldval, &newval, ptr);
++  return (failure == 0);
++}
++
++long long HIDDEN
++__sync_lock_test_and_set_8 (long long *ptr, long long val)
++{
++  int failure;
++  long long oldval;
++
++  do {
++    oldval = *ptr;
++    failure = __kernel_cmpxchg64 (&oldval, &val, ptr);
++  } while (failure != 0);
++
++  return oldval;
++}
+
+=== modified file 'gcc/config/arm/linux-atomic.c'
+--- old/gcc/config/arm/linux-atomic.c	2011-01-03 20:52:22 +0000
++++ new/gcc/config/arm/linux-atomic.c	2011-10-14 15:50:44 +0000
+@@ -32,8 +32,8 @@
+ #define __kernel_dmb (*(__kernel_dmb_t *) 0xffff0fa0)
+ 
+ /* Note: we implement byte, short and int versions of atomic operations using
+-   the above kernel helpers, but there is no support for "long long" (64-bit)
+-   operations as yet.  */
++   the above kernel helpers; see linux-atomic-64bit.c for "long long" (64-bit)
++   operations.  */
+ 
+ #define HIDDEN __attribute__ ((visibility ("hidden")))
+ 
+@@ -273,6 +273,7 @@
+     *ptr = 0;								\
+   }
+ 
++SYNC_LOCK_RELEASE (long long,   8)
+ SYNC_LOCK_RELEASE (int,   4)
+ SYNC_LOCK_RELEASE (short, 2)
+ SYNC_LOCK_RELEASE (char,  1)
+
+=== modified file 'gcc/config/arm/sync.md'
+--- old/gcc/config/arm/sync.md	2010-12-31 13:25:33 +0000
++++ new/gcc/config/arm/sync.md	2011-10-14 15:47:15 +0000
+@@ -1,6 +1,7 @@
+ ;; Machine description for ARM processor synchronization primitives.
+ ;; Copyright (C) 2010 Free Software Foundation, Inc.
+ ;; Written by Marcus Shawcroft (marcus.shawcroft@arm.com)
++;; 64bit Atomics by Dave Gilbert (david.gilbert@linaro.org)
+ ;;
+ ;; This file is part of GCC.
+ ;;
+@@ -33,31 +34,24 @@
+   MEM_VOLATILE_P (operands[0]) = 1;
+ })
+ 
+-(define_expand "sync_compare_and_swapsi"
+-  [(set (match_operand:SI 0 "s_register_operand")
+-        (unspec_volatile:SI [(match_operand:SI 1 "memory_operand")
+-			     (match_operand:SI 2 "s_register_operand")
+-			     (match_operand:SI 3 "s_register_operand")]
+-			     VUNSPEC_SYNC_COMPARE_AND_SWAP))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
+-  {
+-    struct arm_sync_generator generator;
+-    generator.op = arm_sync_generator_omrn;
+-    generator.u.omrn = gen_arm_sync_compare_and_swapsi;
+-    arm_expand_sync (SImode, &generator, operands[0], operands[1], operands[2],
+-                     operands[3]);
+-    DONE;
+-  })
+ 
+-(define_mode_iterator NARROW [QI HI])
++(define_mode_attr sync_predtab [(SI "TARGET_HAVE_LDREX &&
++					TARGET_HAVE_MEMORY_BARRIER")
++				(QI "TARGET_HAVE_LDREXBH &&
++					TARGET_HAVE_MEMORY_BARRIER")
++				(HI "TARGET_HAVE_LDREXBH &&
++					TARGET_HAVE_MEMORY_BARRIER")
++				(DI "TARGET_HAVE_LDREXD &&
++					ARM_DOUBLEWORD_ALIGN &&
++					TARGET_HAVE_MEMORY_BARRIER")])
+ 
+ (define_expand "sync_compare_and_swap<mode>"
+-  [(set (match_operand:NARROW 0 "s_register_operand")
+-        (unspec_volatile:NARROW [(match_operand:NARROW 1 "memory_operand")
+-			     (match_operand:NARROW 2 "s_register_operand")
+-			     (match_operand:NARROW 3 "s_register_operand")]
++  [(set (match_operand:QHSD 0 "s_register_operand")
++        (unspec_volatile:QHSD [(match_operand:QHSD 1 "memory_operand")
++			     (match_operand:QHSD 2 "s_register_operand")
++			     (match_operand:QHSD 3 "s_register_operand")]
+ 			     VUNSPEC_SYNC_COMPARE_AND_SWAP))]
+-  "TARGET_HAVE_LDREXBHD && TARGET_HAVE_MEMORY_BARRIER"
++  "<sync_predtab>"
+   {
+     struct arm_sync_generator generator;
+     generator.op = arm_sync_generator_omrn;
+@@ -67,25 +61,11 @@
+     DONE;
+   })
+ 
+-(define_expand "sync_lock_test_and_setsi"
+-  [(match_operand:SI 0 "s_register_operand")
+-   (match_operand:SI 1 "memory_operand")
+-   (match_operand:SI 2 "s_register_operand")]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
+-  {
+-    struct arm_sync_generator generator;
+-    generator.op = arm_sync_generator_omn;
+-    generator.u.omn = gen_arm_sync_lock_test_and_setsi;
+-    arm_expand_sync (SImode, &generator, operands[0], operands[1], NULL,
+-                     operands[2]);
+-    DONE;
+-  })
+-
+ (define_expand "sync_lock_test_and_set<mode>"
+-  [(match_operand:NARROW 0 "s_register_operand")
+-   (match_operand:NARROW 1 "memory_operand")
+-   (match_operand:NARROW 2 "s_register_operand")]
+-  "TARGET_HAVE_LDREXBHD && TARGET_HAVE_MEMORY_BARRIER"
++  [(match_operand:QHSD 0 "s_register_operand")
++   (match_operand:QHSD 1 "memory_operand")
++   (match_operand:QHSD 2 "s_register_operand")]
++  "<sync_predtab>"
+   {
+     struct arm_sync_generator generator;
+     generator.op = arm_sync_generator_omn;
+@@ -115,51 +95,25 @@
+ 				(plus "*")
+ 				(minus "*")])
+ 
+-(define_expand "sync_<sync_optab>si"
+-  [(match_operand:SI 0 "memory_operand")
+-   (match_operand:SI 1 "s_register_operand")
+-   (syncop:SI (match_dup 0) (match_dup 1))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
+-  {
+-    struct arm_sync_generator generator;
+-    generator.op = arm_sync_generator_omn;
+-    generator.u.omn = gen_arm_sync_new_<sync_optab>si;
+-    arm_expand_sync (SImode, &generator, NULL, operands[0], NULL, operands[1]);
+-    DONE;
+-  })
+-
+-(define_expand "sync_nandsi"
+-  [(match_operand:SI 0 "memory_operand")
+-   (match_operand:SI 1 "s_register_operand")
+-   (not:SI (and:SI (match_dup 0) (match_dup 1)))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
+-  {
+-    struct arm_sync_generator generator;
+-    generator.op = arm_sync_generator_omn;
+-    generator.u.omn = gen_arm_sync_new_nandsi;
+-    arm_expand_sync (SImode, &generator, NULL, operands[0], NULL, operands[1]);
+-    DONE;
+-  })
+-
+ (define_expand "sync_<sync_optab><mode>"
+-  [(match_operand:NARROW 0 "memory_operand")
+-   (match_operand:NARROW 1 "s_register_operand")
+-   (syncop:NARROW (match_dup 0) (match_dup 1))]
+-  "TARGET_HAVE_LDREXBHD && TARGET_HAVE_MEMORY_BARRIER"
++  [(match_operand:QHSD 0 "memory_operand")
++   (match_operand:QHSD 1 "s_register_operand")
++   (syncop:QHSD (match_dup 0) (match_dup 1))]
++  "<sync_predtab>"
+   {
+     struct arm_sync_generator generator;
+     generator.op = arm_sync_generator_omn;
+     generator.u.omn = gen_arm_sync_new_<sync_optab><mode>;
+     arm_expand_sync (<MODE>mode, &generator, NULL, operands[0], NULL,
+-    		     operands[1]);
++		     operands[1]);
+     DONE;
+   })
+ 
+ (define_expand "sync_nand<mode>"
+-  [(match_operand:NARROW 0 "memory_operand")
+-   (match_operand:NARROW 1 "s_register_operand")
+-   (not:NARROW (and:NARROW (match_dup 0) (match_dup 1)))]
+-  "TARGET_HAVE_LDREXBHD && TARGET_HAVE_MEMORY_BARRIER"
++  [(match_operand:QHSD 0 "memory_operand")
++   (match_operand:QHSD 1 "s_register_operand")
++   (not:QHSD (and:QHSD (match_dup 0) (match_dup 1)))]
++  "<sync_predtab>"
+   {
+     struct arm_sync_generator generator;
+     generator.op = arm_sync_generator_omn;
+@@ -169,57 +123,27 @@
+     DONE;
+   })
+ 
+-(define_expand "sync_new_<sync_optab>si"
+-  [(match_operand:SI 0 "s_register_operand")
+-   (match_operand:SI 1 "memory_operand")
+-   (match_operand:SI 2 "s_register_operand")
+-   (syncop:SI (match_dup 1) (match_dup 2))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
+-  {
+-    struct arm_sync_generator generator;
+-    generator.op = arm_sync_generator_omn;
+-    generator.u.omn = gen_arm_sync_new_<sync_optab>si;
+-    arm_expand_sync (SImode, &generator, operands[0], operands[1], NULL,
+-                     operands[2]);
+-    DONE;
+-  })
+-
+-(define_expand "sync_new_nandsi"
+-  [(match_operand:SI 0 "s_register_operand")
+-   (match_operand:SI 1 "memory_operand")
+-   (match_operand:SI 2 "s_register_operand")
+-   (not:SI (and:SI (match_dup 1) (match_dup 2)))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
+-  {
+-    struct arm_sync_generator generator;
+-    generator.op = arm_sync_generator_omn;
+-    generator.u.omn = gen_arm_sync_new_nandsi;
+-    arm_expand_sync (SImode, &generator, operands[0], operands[1], NULL,
+-    		     operands[2]);
+-    DONE;
+-  })
+-
+ (define_expand "sync_new_<sync_optab><mode>"
+-  [(match_operand:NARROW 0 "s_register_operand")
+-   (match_operand:NARROW 1 "memory_operand")
+-   (match_operand:NARROW 2 "s_register_operand")
+-   (syncop:NARROW (match_dup 1) (match_dup 2))]
+-  "TARGET_HAVE_LDREXBHD && TARGET_HAVE_MEMORY_BARRIER"
++  [(match_operand:QHSD 0 "s_register_operand")
++   (match_operand:QHSD 1 "memory_operand")
++   (match_operand:QHSD 2 "s_register_operand")
++   (syncop:QHSD (match_dup 1) (match_dup 2))]
++  "<sync_predtab>"
+   {
+     struct arm_sync_generator generator;
+     generator.op = arm_sync_generator_omn;
+     generator.u.omn = gen_arm_sync_new_<sync_optab><mode>;
+     arm_expand_sync (<MODE>mode, &generator, operands[0], operands[1],
+-    		     NULL, operands[2]);
++		     NULL, operands[2]);
+     DONE;
+   })
+ 
+ (define_expand "sync_new_nand<mode>"
+-  [(match_operand:NARROW 0 "s_register_operand")
+-   (match_operand:NARROW 1 "memory_operand")
+-   (match_operand:NARROW 2 "s_register_operand")
+-   (not:NARROW (and:NARROW (match_dup 1) (match_dup 2)))]
+-  "TARGET_HAVE_LDREXBHD && TARGET_HAVE_MEMORY_BARRIER"
++  [(match_operand:QHSD 0 "s_register_operand")
++   (match_operand:QHSD 1 "memory_operand")
++   (match_operand:QHSD 2 "s_register_operand")
++   (not:QHSD (and:QHSD (match_dup 1) (match_dup 2)))]
++  "<sync_predtab>"
+   {
+     struct arm_sync_generator generator;
+     generator.op = arm_sync_generator_omn;
+@@ -229,57 +153,27 @@
+     DONE;
+   });
+ 
+-(define_expand "sync_old_<sync_optab>si"
+-  [(match_operand:SI 0 "s_register_operand")
+-   (match_operand:SI 1 "memory_operand")
+-   (match_operand:SI 2 "s_register_operand")
+-   (syncop:SI (match_dup 1) (match_dup 2))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
+-  {
+-    struct arm_sync_generator generator;
+-    generator.op = arm_sync_generator_omn;
+-    generator.u.omn = gen_arm_sync_old_<sync_optab>si;
+-    arm_expand_sync (SImode, &generator, operands[0], operands[1], NULL,
+-                     operands[2]);
+-    DONE;
+-  })
+-
+-(define_expand "sync_old_nandsi"
+-  [(match_operand:SI 0 "s_register_operand")
+-   (match_operand:SI 1 "memory_operand")
+-   (match_operand:SI 2 "s_register_operand")
+-   (not:SI (and:SI (match_dup 1) (match_dup 2)))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
+-  {
+-    struct arm_sync_generator generator;
+-    generator.op = arm_sync_generator_omn;
+-    generator.u.omn = gen_arm_sync_old_nandsi;
+-    arm_expand_sync (SImode, &generator, operands[0], operands[1], NULL,
+-                     operands[2]);
+-    DONE;
+-  })
+-
+ (define_expand "sync_old_<sync_optab><mode>"
+-  [(match_operand:NARROW 0 "s_register_operand")
+-   (match_operand:NARROW 1 "memory_operand")
+-   (match_operand:NARROW 2 "s_register_operand")
+-   (syncop:NARROW (match_dup 1) (match_dup 2))]
+-  "TARGET_HAVE_LDREXBHD && TARGET_HAVE_MEMORY_BARRIER"
++  [(match_operand:QHSD 0 "s_register_operand")
++   (match_operand:QHSD 1 "memory_operand")
++   (match_operand:QHSD 2 "s_register_operand")
++   (syncop:QHSD (match_dup 1) (match_dup 2))]
++  "<sync_predtab>"
+   {
+     struct arm_sync_generator generator;
+     generator.op = arm_sync_generator_omn;
+     generator.u.omn = gen_arm_sync_old_<sync_optab><mode>;
+     arm_expand_sync (<MODE>mode, &generator, operands[0], operands[1],
+-    		     NULL, operands[2]);
++		     NULL, operands[2]);
+     DONE;
+   })
+ 
+ (define_expand "sync_old_nand<mode>"
+-  [(match_operand:NARROW 0 "s_register_operand")
+-   (match_operand:NARROW 1 "memory_operand")
+-   (match_operand:NARROW 2 "s_register_operand")
+-   (not:NARROW (and:NARROW (match_dup 1) (match_dup 2)))]
+-  "TARGET_HAVE_LDREXBHD && TARGET_HAVE_MEMORY_BARRIER"
++  [(match_operand:QHSD 0 "s_register_operand")
++   (match_operand:QHSD 1 "memory_operand")
++   (match_operand:QHSD 2 "s_register_operand")
++   (not:QHSD (and:QHSD (match_dup 1) (match_dup 2)))]
++  "<sync_predtab>"
+   {
+     struct arm_sync_generator generator;
+     generator.op = arm_sync_generator_omn;
+@@ -289,22 +183,22 @@
+     DONE;
+   })
+ 
+-(define_insn "arm_sync_compare_and_swapsi"
+-  [(set (match_operand:SI 0 "s_register_operand" "=&r")
+-        (unspec_volatile:SI
+-	  [(match_operand:SI 1 "arm_sync_memory_operand" "+Q")
+-   	   (match_operand:SI 2 "s_register_operand" "r")
+-	   (match_operand:SI 3 "s_register_operand" "r")]
+-	  VUNSPEC_SYNC_COMPARE_AND_SWAP))
+-   (set (match_dup 1) (unspec_volatile:SI [(match_dup 2)]
++(define_insn "arm_sync_compare_and_swap<mode>"
++  [(set (match_operand:SIDI 0 "s_register_operand" "=&r")
++        (unspec_volatile:SIDI
++	 [(match_operand:SIDI 1 "arm_sync_memory_operand" "+Q")
++	  (match_operand:SIDI 2 "s_register_operand" "r")
++	  (match_operand:SIDI 3 "s_register_operand" "r")]
++	 VUNSPEC_SYNC_COMPARE_AND_SWAP))
++   (set (match_dup 1) (unspec_volatile:SIDI [(match_dup 2)]
+                                           VUNSPEC_SYNC_COMPARE_AND_SWAP))
+    (set (reg:CC CC_REGNUM) (unspec_volatile:CC [(match_dup 1)]
+                                                 VUNSPEC_SYNC_COMPARE_AND_SWAP))
+    ]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
++  "<sync_predtab>"
+   {
+     return arm_output_sync_insn (insn, operands);
+-  } 
++  }
+   [(set_attr "sync_result"          "0")
+    (set_attr "sync_memory"          "1")
+    (set_attr "sync_required_value"  "2")
+@@ -318,7 +212,7 @@
+         (zero_extend:SI
+ 	  (unspec_volatile:NARROW
+ 	    [(match_operand:NARROW 1 "arm_sync_memory_operand" "+Q")
+-   	     (match_operand:SI 2 "s_register_operand" "r")
++	     (match_operand:SI 2 "s_register_operand" "r")
+ 	     (match_operand:SI 3 "s_register_operand" "r")]
+ 	    VUNSPEC_SYNC_COMPARE_AND_SWAP)))
+    (set (match_dup 1) (unspec_volatile:NARROW [(match_dup 2)]
+@@ -326,10 +220,10 @@
+    (set (reg:CC CC_REGNUM) (unspec_volatile:CC [(match_dup 1)]
+                                                 VUNSPEC_SYNC_COMPARE_AND_SWAP))
+    ]
+-  "TARGET_HAVE_LDREXBHD && TARGET_HAVE_MEMORY_BARRIER"
++  "<sync_predtab>"
+   {
+     return arm_output_sync_insn (insn, operands);
+-  } 
++  }
+   [(set_attr "sync_result"          "0")
+    (set_attr "sync_memory"          "1")
+    (set_attr "sync_required_value"  "2")
+@@ -338,18 +232,18 @@
+    (set_attr "conds" "clob")
+    (set_attr "predicable" "no")])
+ 
+-(define_insn "arm_sync_lock_test_and_setsi"
+-  [(set (match_operand:SI 0 "s_register_operand" "=&r")
+-        (match_operand:SI 1 "arm_sync_memory_operand" "+Q"))
++(define_insn "arm_sync_lock_test_and_set<mode>"
++  [(set (match_operand:SIDI 0 "s_register_operand" "=&r")
++	(match_operand:SIDI 1 "arm_sync_memory_operand" "+Q"))
+    (set (match_dup 1)
+-        (unspec_volatile:SI [(match_operand:SI 2 "s_register_operand" "r")]
+-	                    VUNSPEC_SYNC_LOCK))
++	(unspec_volatile:SIDI [(match_operand:SIDI 2 "s_register_operand" "r")]
++	VUNSPEC_SYNC_LOCK))
+    (clobber (reg:CC CC_REGNUM))
+    (clobber (match_scratch:SI 3 "=&r"))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
++  "<sync_predtab>"
+   {
+     return arm_output_sync_insn (insn, operands);
+-  } 
++  }
+   [(set_attr "sync_release_barrier" "no")
+    (set_attr "sync_result"          "0")
+    (set_attr "sync_memory"          "1")
+@@ -364,10 +258,10 @@
+         (zero_extend:SI (match_operand:NARROW 1 "arm_sync_memory_operand" "+Q")))
+    (set (match_dup 1)
+         (unspec_volatile:NARROW [(match_operand:SI 2 "s_register_operand" "r")]
+-	                        VUNSPEC_SYNC_LOCK))
++				VUNSPEC_SYNC_LOCK))
+    (clobber (reg:CC CC_REGNUM))
+    (clobber (match_scratch:SI 3 "=&r"))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
++  "<sync_predtab>"
+   {
+     return arm_output_sync_insn (insn, operands);
+   } 
+@@ -380,22 +274,48 @@
+    (set_attr "conds" "clob")
+    (set_attr "predicable" "no")])
+ 
+-(define_insn "arm_sync_new_<sync_optab>si"
++(define_insn "arm_sync_new_<sync_optab><mode>"
++  [(set (match_operand:SIDI 0 "s_register_operand" "=&r")
++        (unspec_volatile:SIDI [(syncop:SIDI
++			       (match_operand:SIDI 1 "arm_sync_memory_operand" "+Q")
++			       (match_operand:SIDI 2 "s_register_operand" "r"))
++			    ]
++			    VUNSPEC_SYNC_NEW_OP))
++   (set (match_dup 1)
++	(unspec_volatile:SIDI [(match_dup 1) (match_dup 2)]
++			    VUNSPEC_SYNC_NEW_OP))
++   (clobber (reg:CC CC_REGNUM))
++   (clobber (match_scratch:SI 3 "=&r"))]
++  "<sync_predtab>"
++  {
++    return arm_output_sync_insn (insn, operands);
++  }
++  [(set_attr "sync_result"          "0")
++   (set_attr "sync_memory"          "1")
++   (set_attr "sync_new_value"       "2")
++   (set_attr "sync_t1"              "0")
++   (set_attr "sync_t2"              "3")
++   (set_attr "sync_op"              "<sync_optab>")
++   (set_attr "conds" "clob")
++   (set_attr "predicable" "no")])
++
++(define_insn "arm_sync_new_<sync_optab><mode>"
+   [(set (match_operand:SI 0 "s_register_operand" "=&r")
+         (unspec_volatile:SI [(syncop:SI
+-                               (match_operand:SI 1 "arm_sync_memory_operand" "+Q")
+-                               (match_operand:SI 2 "s_register_operand" "r"))
+-	                    ]
+-	                    VUNSPEC_SYNC_NEW_OP))
++			       (zero_extend:SI
++				 (match_operand:NARROW 1 "arm_sync_memory_operand" "+Q"))
++			       (match_operand:SI 2 "s_register_operand" "r"))
++			    ]
++			    VUNSPEC_SYNC_NEW_OP))
+    (set (match_dup 1)
+-        (unspec_volatile:SI [(match_dup 1) (match_dup 2)]
+-	                    VUNSPEC_SYNC_NEW_OP))
++	(unspec_volatile:NARROW [(match_dup 1) (match_dup 2)]
++				VUNSPEC_SYNC_NEW_OP))
+    (clobber (reg:CC CC_REGNUM))
+    (clobber (match_scratch:SI 3 "=&r"))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
++  "<sync_predtab>"
+   {
+     return arm_output_sync_insn (insn, operands);
+-  } 
++  }
+   [(set_attr "sync_result"          "0")
+    (set_attr "sync_memory"          "1")
+    (set_attr "sync_new_value"       "2")
+@@ -405,22 +325,22 @@
+    (set_attr "conds" "clob")
+    (set_attr "predicable" "no")])
+ 
+-(define_insn "arm_sync_new_nandsi"
+-  [(set (match_operand:SI 0 "s_register_operand" "=&r")
+-        (unspec_volatile:SI [(not:SI (and:SI
+-                               (match_operand:SI 1 "arm_sync_memory_operand" "+Q")
+-                               (match_operand:SI 2 "s_register_operand" "r")))
+-	                    ]
+-	                    VUNSPEC_SYNC_NEW_OP))
++(define_insn "arm_sync_new_nand<mode>"
++  [(set (match_operand:SIDI 0 "s_register_operand" "=&r")
++        (unspec_volatile:SIDI [(not:SIDI (and:SIDI
++			       (match_operand:SIDI 1 "arm_sync_memory_operand" "+Q")
++			       (match_operand:SIDI 2 "s_register_operand" "r")))
++			    ]
++			    VUNSPEC_SYNC_NEW_OP))
+    (set (match_dup 1)
+-        (unspec_volatile:SI [(match_dup 1) (match_dup 2)]
+-	                    VUNSPEC_SYNC_NEW_OP))
++	(unspec_volatile:SIDI [(match_dup 1) (match_dup 2)]
++			    VUNSPEC_SYNC_NEW_OP))
+    (clobber (reg:CC CC_REGNUM))
+    (clobber (match_scratch:SI 3 "=&r"))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
++  "<sync_predtab>"
+   {
+     return arm_output_sync_insn (insn, operands);
+-  } 
++  }
+   [(set_attr "sync_result"          "0")
+    (set_attr "sync_memory"          "1")
+    (set_attr "sync_new_value"       "2")
+@@ -430,50 +350,24 @@
+    (set_attr "conds" "clob")
+    (set_attr "predicable" "no")])
+ 
+-(define_insn "arm_sync_new_<sync_optab><mode>"
+-  [(set (match_operand:SI 0 "s_register_operand" "=&r")
+-        (unspec_volatile:SI [(syncop:SI
+-                               (zero_extend:SI
+-			         (match_operand:NARROW 1 "arm_sync_memory_operand" "+Q"))
+-                               (match_operand:SI 2 "s_register_operand" "r"))
+-	                    ]
+-	                    VUNSPEC_SYNC_NEW_OP))
+-   (set (match_dup 1)
+-        (unspec_volatile:NARROW [(match_dup 1) (match_dup 2)]
+-	                        VUNSPEC_SYNC_NEW_OP))
+-   (clobber (reg:CC CC_REGNUM))
+-   (clobber (match_scratch:SI 3 "=&r"))]
+-  "TARGET_HAVE_LDREXBHD && TARGET_HAVE_MEMORY_BARRIER"
+-  {
+-    return arm_output_sync_insn (insn, operands);
+-  } 
+-  [(set_attr "sync_result"          "0")
+-   (set_attr "sync_memory"          "1")
+-   (set_attr "sync_new_value"       "2")
+-   (set_attr "sync_t1"              "0")
+-   (set_attr "sync_t2"              "3")
+-   (set_attr "sync_op"              "<sync_optab>")
+-   (set_attr "conds" "clob")
+-   (set_attr "predicable" "no")])
+-
+ (define_insn "arm_sync_new_nand<mode>"
+   [(set (match_operand:SI 0 "s_register_operand" "=&r")
+         (unspec_volatile:SI
+ 	  [(not:SI
+ 	     (and:SI
+-               (zero_extend:SI	  
+-	         (match_operand:NARROW 1 "arm_sync_memory_operand" "+Q"))
+-               (match_operand:SI 2 "s_register_operand" "r")))
++	       (zero_extend:SI
++		 (match_operand:NARROW 1 "arm_sync_memory_operand" "+Q"))
++	       (match_operand:SI 2 "s_register_operand" "r")))
+ 	  ] VUNSPEC_SYNC_NEW_OP))
+    (set (match_dup 1)
+         (unspec_volatile:NARROW [(match_dup 1) (match_dup 2)]
+-	                        VUNSPEC_SYNC_NEW_OP))
++				VUNSPEC_SYNC_NEW_OP))
+    (clobber (reg:CC CC_REGNUM))
+    (clobber (match_scratch:SI 3 "=&r"))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
++  "<sync_predtab>"
+   {
+     return arm_output_sync_insn (insn, operands);
+-  } 
++  }
+   [(set_attr "sync_result"          "0")
+    (set_attr "sync_memory"          "1")
+    (set_attr "sync_new_value"       "2")
+@@ -483,20 +377,20 @@
+    (set_attr "conds" "clob")
+    (set_attr "predicable" "no")])
+ 
+-(define_insn "arm_sync_old_<sync_optab>si"
+-  [(set (match_operand:SI 0 "s_register_operand" "=&r")
+-        (unspec_volatile:SI [(syncop:SI
+-                               (match_operand:SI 1 "arm_sync_memory_operand" "+Q")
+-                               (match_operand:SI 2 "s_register_operand" "r"))
+-	                    ]
+-	                    VUNSPEC_SYNC_OLD_OP))
++(define_insn "arm_sync_old_<sync_optab><mode>"
++  [(set (match_operand:SIDI 0 "s_register_operand" "=&r")
++	(unspec_volatile:SIDI [(syncop:SIDI
++			       (match_operand:SIDI 1 "arm_sync_memory_operand" "+Q")
++			       (match_operand:SIDI 2 "s_register_operand" "r"))
++			    ]
++			    VUNSPEC_SYNC_OLD_OP))
+    (set (match_dup 1)
+-        (unspec_volatile:SI [(match_dup 1) (match_dup 2)]
+-	                    VUNSPEC_SYNC_OLD_OP))
++        (unspec_volatile:SIDI [(match_dup 1) (match_dup 2)]
++			      VUNSPEC_SYNC_OLD_OP))
+    (clobber (reg:CC CC_REGNUM))
+-   (clobber (match_scratch:SI 3 "=&r"))
++   (clobber (match_scratch:SIDI 3 "=&r"))
+    (clobber (match_scratch:SI 4 "<sync_clobber>"))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
++  "<sync_predtab>"
+   {
+     return arm_output_sync_insn (insn, operands);
+   } 
+@@ -509,47 +403,21 @@
+    (set_attr "conds" "clob")
+    (set_attr "predicable" "no")])
+ 
+-(define_insn "arm_sync_old_nandsi"
+-  [(set (match_operand:SI 0 "s_register_operand" "=&r")
+-        (unspec_volatile:SI [(not:SI (and:SI
+-                               (match_operand:SI 1 "arm_sync_memory_operand" "+Q")
+-                               (match_operand:SI 2 "s_register_operand" "r")))
+-	                    ]
+-	                    VUNSPEC_SYNC_OLD_OP))
+-   (set (match_dup 1)
+-        (unspec_volatile:SI [(match_dup 1) (match_dup 2)]
+-	                    VUNSPEC_SYNC_OLD_OP))
+-   (clobber (reg:CC CC_REGNUM))
+-   (clobber (match_scratch:SI 3 "=&r"))
+-   (clobber (match_scratch:SI 4 "=&r"))]
+-  "TARGET_HAVE_LDREX && TARGET_HAVE_MEMORY_BARRIER"
+-  {
+-    return arm_output_sync_insn (insn, operands);
+-  } 
+-  [(set_attr "sync_result"          "0")
+-   (set_attr "sync_memory"          "1")
+-   (set_attr "sync_new_value"       "2")
+-   (set_attr "sync_t1"              "3")
+-   (set_attr "sync_t2"              "4")
+-   (set_attr "sync_op"              "nand")
+-   (set_attr "conds" 		    "clob")
+-   (set_attr "predicable" "no")])
+-
+ (define_insn "arm_sync_old_<sync_optab><mode>"
+   [(set (match_operand:SI 0 "s_register_operand" "=&r")
+         (unspec_volatile:SI [(syncop:SI
+-                               (zero_extend:SI
+-			         (match_operand:NARROW 1 "arm_sync_memory_operand" "+Q"))
+-                               (match_operand:SI 2 "s_register_operand" "r"))
+-	                    ]
+-	                    VUNSPEC_SYNC_OLD_OP))
++			       (zero_extend:SI
++				 (match_operand:NARROW 1 "arm_sync_memory_operand" "+Q"))
++			       (match_operand:SI 2 "s_register_operand" "r"))
++			    ]
++			    VUNSPEC_SYNC_OLD_OP))
+    (set (match_dup 1)
+-        (unspec_volatile:NARROW [(match_dup 1) (match_dup 2)]
+-	                    VUNSPEC_SYNC_OLD_OP))
++	(unspec_volatile:NARROW [(match_dup 1) (match_dup 2)]
++			    VUNSPEC_SYNC_OLD_OP))
+    (clobber (reg:CC CC_REGNUM))
+    (clobber (match_scratch:SI 3 "=&r"))
+    (clobber (match_scratch:SI 4 "<sync_clobber>"))]
+-  "TARGET_HAVE_LDREXBHD && TARGET_HAVE_MEMORY_BARRIER"
++  "<sync_predtab>"
+   {
+     return arm_output_sync_insn (insn, operands);
+   } 
+@@ -563,20 +431,46 @@
+    (set_attr "predicable" "no")])
+ 
+ (define_insn "arm_sync_old_nand<mode>"
++  [(set (match_operand:SIDI 0 "s_register_operand" "=&r")
++	(unspec_volatile:SIDI [(not:SIDI (and:SIDI
++			       (match_operand:SIDI 1 "arm_sync_memory_operand" "+Q")
++			       (match_operand:SIDI 2 "s_register_operand" "r")))
++			    ]
++			    VUNSPEC_SYNC_OLD_OP))
++   (set (match_dup 1)
++        (unspec_volatile:SIDI [(match_dup 1) (match_dup 2)]
++	                    VUNSPEC_SYNC_OLD_OP))
++   (clobber (reg:CC CC_REGNUM))
++   (clobber (match_scratch:SIDI 3 "=&r"))
++   (clobber (match_scratch:SI 4 "=&r"))]
++  "<sync_predtab>"
++  {
++    return arm_output_sync_insn (insn, operands);
++  } 
++  [(set_attr "sync_result"          "0")
++   (set_attr "sync_memory"          "1")
++   (set_attr "sync_new_value"       "2")
++   (set_attr "sync_t1"              "3")
++   (set_attr "sync_t2"              "4")
++   (set_attr "sync_op"              "nand")
++   (set_attr "conds" 		    "clob")
++   (set_attr "predicable" "no")])
++
++(define_insn "arm_sync_old_nand<mode>"
+   [(set (match_operand:SI 0 "s_register_operand" "=&r")
+-        (unspec_volatile:SI [(not:SI (and:SI
+-                               (zero_extend:SI
+-			         (match_operand:NARROW 1 "arm_sync_memory_operand" "+Q"))
+-                               (match_operand:SI 2 "s_register_operand" "r")))
+-	                    ]
+-	                    VUNSPEC_SYNC_OLD_OP))
++	(unspec_volatile:SI [(not:SI (and:SI
++			       (zero_extend:SI
++				 (match_operand:NARROW 1 "arm_sync_memory_operand" "+Q"))
++			       (match_operand:SI 2 "s_register_operand" "r")))
++			    ]
++			    VUNSPEC_SYNC_OLD_OP))
+    (set (match_dup 1)
+-        (unspec_volatile:NARROW [(match_dup 1) (match_dup 2)]
+-	                    VUNSPEC_SYNC_OLD_OP))
++	(unspec_volatile:NARROW [(match_dup 1) (match_dup 2)]
++			    VUNSPEC_SYNC_OLD_OP))
+    (clobber (reg:CC CC_REGNUM))
+    (clobber (match_scratch:SI 3 "=&r"))
+    (clobber (match_scratch:SI 4 "=&r"))]
+-  "TARGET_HAVE_LDREXBHD && TARGET_HAVE_MEMORY_BARRIER"
++  "<sync_predtab>"
+   {
+     return arm_output_sync_insn (insn, operands);
+   } 
+
+=== modified file 'gcc/config/arm/t-linux-eabi'
+--- old/gcc/config/arm/t-linux-eabi	2011-01-03 20:52:22 +0000
++++ new/gcc/config/arm/t-linux-eabi	2011-10-14 15:50:44 +0000
+@@ -36,3 +36,4 @@
+ EXTRA_MULTILIB_PARTS=crtbegin.o crtend.o crtbeginS.o crtendS.o crtbeginT.o
+ 
+ LIB2FUNCS_STATIC_EXTRA += $(srcdir)/config/arm/linux-atomic.c
++LIB2FUNCS_STATIC_EXTRA += $(srcdir)/config/arm/linux-atomic-64bit.c
+
+=== added file 'gcc/testsuite/gcc.dg/di-longlong64-sync-1.c'
+--- old/gcc/testsuite/gcc.dg/di-longlong64-sync-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/di-longlong64-sync-1.c	2011-10-14 15:56:32 +0000
+@@ -0,0 +1,164 @@
++/* { dg-do run } */
++/* { dg-require-effective-target sync_longlong } */
++/* { dg-options "-std=gnu99" } */
++/* { dg-message "note: '__sync_fetch_and_nand' changed semantics in GCC 4.4" "" { target *-*-* } 0 } */
++/* { dg-message "note: '__sync_nand_and_fetch' changed semantics in GCC 4.4" "" { target *-*-* } 0 } */
++
++
++/* Test basic functionality of the intrinsics.  The operations should
++   not be optimized away if no one checks the return values.  */
++
++/* Based on ia64-sync-[12].c, but 1) long on ARM is 32 bit so use long long
++   (an explicit 64bit type maybe a better bet) and 2) Use values that cross
++   the 32bit boundary and cause carries since the actual maths are done as
++   pairs of 32 bit instructions.  */
++
++/* Note: This file is #included by some of the ARM tests.  */
++
++__extension__ typedef __SIZE_TYPE__ size_t;
++
++extern void abort (void);
++extern void *memcpy (void *, const void *, size_t);
++extern int memcmp (const void *, const void *, size_t);
++
++/* Temporary space where the work actually gets done.  */
++static long long AL[24];
++/* Values copied into AL before we start.  */
++static long long init_di[24] = { 0x100000002ll, 0x200000003ll, 0, 1,
++
++				 0x100000002ll, 0x100000002ll,
++				 0x100000002ll, 0x100000002ll,
++
++				 0, 0x1000e0de0000ll,
++				 42 , 0xc001c0de0000ll,
++
++				 -1ll, 0, 0xff00ff0000ll, -1ll,
++
++				 0, 0x1000e0de0000ll,
++				 42 , 0xc001c0de0000ll,
++
++				 -1ll, 0, 0xff00ff0000ll, -1ll};
++/* This is what should be in AL at the end.  */
++static long long test_di[24] = { 0x1234567890ll, 0x1234567890ll, 1, 0,
++
++				 0x100000002ll, 0x100000002ll,
++				 0x100000002ll, 0x100000002ll,
++
++				 1, 0xc001c0de0000ll,
++				 20, 0x1000e0de0000ll,
++
++				 0x300000007ll , 0x500000009ll,
++				 0xf100ff0001ll, ~0xa00000007ll,
++
++				 1, 0xc001c0de0000ll,
++				 20, 0x1000e0de0000ll,
++
++				 0x300000007ll , 0x500000009ll,
++				 0xf100ff0001ll, ~0xa00000007ll };
++
++/* First check they work in terms of what they do to memory.  */
++static void
++do_noret_di (void)
++{
++  __sync_val_compare_and_swap (AL+0, 0x100000002ll, 0x1234567890ll);
++  __sync_bool_compare_and_swap (AL+1, 0x200000003ll, 0x1234567890ll);
++  __sync_lock_test_and_set (AL+2, 1);
++  __sync_lock_release (AL+3);
++
++  /* The following tests should not change the value since the
++     original does NOT match.  */
++  __sync_val_compare_and_swap (AL+4, 0x000000002ll, 0x1234567890ll);
++  __sync_val_compare_and_swap (AL+5, 0x100000000ll, 0x1234567890ll);
++  __sync_bool_compare_and_swap (AL+6, 0x000000002ll, 0x1234567890ll);
++  __sync_bool_compare_and_swap (AL+7, 0x100000000ll, 0x1234567890ll);
++
++  __sync_fetch_and_add (AL+8, 1);
++  __sync_fetch_and_add (AL+9, 0xb000e0000000ll); /* + to both halves & carry.  */
++  __sync_fetch_and_sub (AL+10, 22);
++  __sync_fetch_and_sub (AL+11, 0xb000e0000000ll);
++
++  __sync_fetch_and_and (AL+12, 0x300000007ll);
++  __sync_fetch_and_or (AL+13, 0x500000009ll);
++  __sync_fetch_and_xor (AL+14, 0xe00000001ll);
++  __sync_fetch_and_nand (AL+15, 0xa00000007ll);
++
++  /* These should be the same as the fetch_and_* cases except for
++     return value.  */
++  __sync_add_and_fetch (AL+16, 1);
++  /* add to both halves & carry.  */
++  __sync_add_and_fetch (AL+17, 0xb000e0000000ll);
++  __sync_sub_and_fetch (AL+18, 22);
++  __sync_sub_and_fetch (AL+19, 0xb000e0000000ll);
++
++  __sync_and_and_fetch (AL+20, 0x300000007ll);
++  __sync_or_and_fetch (AL+21, 0x500000009ll);
++  __sync_xor_and_fetch (AL+22, 0xe00000001ll);
++  __sync_nand_and_fetch (AL+23, 0xa00000007ll);
++}
++
++/* Now check return values.  */
++static void
++do_ret_di (void)
++{
++  if (__sync_val_compare_and_swap (AL+0, 0x100000002ll, 0x1234567890ll) !=
++	0x100000002ll) abort ();
++  if (__sync_bool_compare_and_swap (AL+1, 0x200000003ll, 0x1234567890ll) !=
++	1) abort ();
++  if (__sync_lock_test_and_set (AL+2, 1) != 0) abort ();
++  __sync_lock_release (AL+3); /* no return value, but keep to match results.  */
++
++  /* The following tests should not change the value since the
++     original does NOT match.  */
++  if (__sync_val_compare_and_swap (AL+4, 0x000000002ll, 0x1234567890ll) !=
++	0x100000002ll) abort ();
++  if (__sync_val_compare_and_swap (AL+5, 0x100000000ll, 0x1234567890ll) !=
++	0x100000002ll) abort ();
++  if (__sync_bool_compare_and_swap (AL+6, 0x000000002ll, 0x1234567890ll) !=
++	0) abort ();
++  if (__sync_bool_compare_and_swap (AL+7, 0x100000000ll, 0x1234567890ll) !=
++	0) abort ();
++
++  if (__sync_fetch_and_add (AL+8, 1) != 0) abort ();
++  if (__sync_fetch_and_add (AL+9, 0xb000e0000000ll) != 0x1000e0de0000ll) abort ();
++  if (__sync_fetch_and_sub (AL+10, 22) != 42) abort ();
++  if (__sync_fetch_and_sub (AL+11, 0xb000e0000000ll) != 0xc001c0de0000ll)
++	abort ();
++
++  if (__sync_fetch_and_and (AL+12, 0x300000007ll) != -1ll) abort ();
++  if (__sync_fetch_and_or (AL+13, 0x500000009ll) != 0) abort ();
++  if (__sync_fetch_and_xor (AL+14, 0xe00000001ll) != 0xff00ff0000ll) abort ();
++  if (__sync_fetch_and_nand (AL+15, 0xa00000007ll) != -1ll) abort ();
++
++  /* These should be the same as the fetch_and_* cases except for
++     return value.  */
++  if (__sync_add_and_fetch (AL+16, 1) != 1) abort ();
++  if (__sync_add_and_fetch (AL+17, 0xb000e0000000ll) != 0xc001c0de0000ll)
++	abort ();
++  if (__sync_sub_and_fetch (AL+18, 22) != 20) abort ();
++  if (__sync_sub_and_fetch (AL+19, 0xb000e0000000ll) != 0x1000e0de0000ll)
++	abort ();
++
++  if (__sync_and_and_fetch (AL+20, 0x300000007ll) != 0x300000007ll) abort ();
++  if (__sync_or_and_fetch (AL+21, 0x500000009ll) != 0x500000009ll) abort ();
++  if (__sync_xor_and_fetch (AL+22, 0xe00000001ll) != 0xf100ff0001ll) abort ();
++  if (__sync_nand_and_fetch (AL+23, 0xa00000007ll) != ~0xa00000007ll) abort ();
++}
++
++int main ()
++{
++  memcpy (AL, init_di, sizeof (init_di));
++
++  do_noret_di ();
++
++  if (memcmp (AL, test_di, sizeof (test_di)))
++    abort ();
++
++  memcpy (AL, init_di, sizeof (init_di));
++
++  do_ret_di ();
++
++  if (memcmp (AL, test_di, sizeof (test_di)))
++    abort ();
++
++  return 0;
++}
+
+=== added file 'gcc/testsuite/gcc.dg/di-sync-multithread.c'
+--- old/gcc/testsuite/gcc.dg/di-sync-multithread.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/di-sync-multithread.c	2011-10-14 15:56:32 +0000
+@@ -0,0 +1,205 @@
++/* { dg-do run } */
++/* { dg-require-effective-target sync_longlong } */
++/* { dg-require-effective-target pthread_h } */
++/* { dg-require-effective-target pthread } */
++/* { dg-options "-pthread -std=gnu99" } */
++
++/* test of long long atomic ops performed in parallel in 3 pthreads
++   david.gilbert@linaro.org */
++
++#include <pthread.h>
++#include <unistd.h>
++
++/*#define DEBUGIT 1 */
++
++#ifdef DEBUGIT
++#include <stdio.h>
++
++#define DOABORT(x,...) {\
++	 fprintf (stderr, x, __VA_ARGS__); fflush (stderr); abort ();\
++	 }
++
++#else
++
++#define DOABORT(x,...) abort ();
++
++#endif
++
++/* Passed to each thread to describe which bits it is going to work on.  */
++struct threadwork {
++  unsigned long long count; /* incremented each time the worker loops.  */
++  unsigned int thread;    /* ID */
++  unsigned int addlsb;    /* 8 bit */
++  unsigned int logic1lsb; /* 5 bit */
++  unsigned int logic2lsb; /* 8 bit */
++};
++
++/* The shared word where all the atomic work is done.  */
++static volatile long long workspace;
++
++/* A shared word to tell the workers to quit when non-0.  */
++static long long doquit;
++
++extern void abort (void);
++
++/* Note this test doesn't test the return values much.  */
++void*
++worker (void* data)
++{
++  struct threadwork *tw = (struct threadwork*)data;
++  long long add1bit = 1ll << tw->addlsb;
++  long long logic1bit = 1ll << tw->logic1lsb;
++  long long logic2bit = 1ll << tw->logic2lsb;
++
++  /* Clear the bits we use.  */
++  __sync_and_and_fetch (&workspace, ~(0xffll * add1bit));
++  __sync_fetch_and_and (&workspace, ~(0x1fll * logic1bit));
++  __sync_fetch_and_and (&workspace, ~(0xffll * logic2bit));
++
++  do
++    {
++      long long tmp1, tmp2, tmp3;
++      /* OK, lets try and do some stuff to the workspace - by the end
++         of the main loop our area should be the same as it is now - i.e. 0.  */
++
++      /* Push the arithmetic section upto 128 - one of the threads will
++         case this to carry accross the 32bit boundary.  */
++      for (tmp2 = 0; tmp2 < 64; tmp2++)
++	{
++	  /* Add 2 using the two different adds.  */
++	  tmp1 = __sync_add_and_fetch (&workspace, add1bit);
++	  tmp3 = __sync_fetch_and_add (&workspace, add1bit);
++
++	  /* The value should be the intermediate add value in both cases.  */
++	  if ((tmp1 & (add1bit * 0xff)) != (tmp3 & (add1bit * 0xff)))
++	    DOABORT ("Mismatch of add intermediates on thread %d "
++			"workspace=0x%llx tmp1=0x%llx "
++			"tmp2=0x%llx tmp3=0x%llx\n",
++			 tw->thread, workspace, tmp1, tmp2, tmp3);
++	}
++
++      /* Set the logic bits.  */
++      tmp2=__sync_or_and_fetch (&workspace,
++			  0x1fll * logic1bit | 0xffll * logic2bit);
++
++      /* Check the logic bits are set and the arithmetic value is correct.  */
++      if ((tmp2 & (0x1fll * logic1bit | 0xffll * logic2bit
++			| 0xffll * add1bit))
++	  != (0x1fll * logic1bit | 0xffll * logic2bit | 0x80ll * add1bit))
++	DOABORT ("Midloop check failed on thread %d "
++			"workspace=0x%llx tmp2=0x%llx "
++			"masktmp2=0x%llx expected=0x%llx\n",
++		tw->thread, workspace, tmp2,
++		tmp2 & (0x1fll * logic1bit | 0xffll * logic2bit |
++			 0xffll * add1bit),
++		(0x1fll * logic1bit | 0xffll * logic2bit | 0x80ll * add1bit));
++
++      /* Pull the arithmetic set back down to 0 - again this should cause a
++	 carry across the 32bit boundary in one thread.  */
++
++      for (tmp2 = 0; tmp2 < 64; tmp2++)
++	{
++	  /* Subtract 2 using the two different subs.  */
++	  tmp1=__sync_sub_and_fetch (&workspace, add1bit);
++	  tmp3=__sync_fetch_and_sub (&workspace, add1bit);
++
++	  /* The value should be the intermediate sub value in both cases.  */
++	  if ((tmp1 & (add1bit * 0xff)) != (tmp3 & (add1bit * 0xff)))
++	    DOABORT ("Mismatch of sub intermediates on thread %d "
++			"workspace=0x%llx tmp1=0x%llx "
++			"tmp2=0x%llx tmp3=0x%llx\n",
++			tw->thread, workspace, tmp1, tmp2, tmp3);
++	}
++
++
++      /* Clear the logic bits.  */
++      __sync_fetch_and_xor (&workspace, 0x1fll * logic1bit);
++      tmp3=__sync_and_and_fetch (&workspace, ~(0xffll * logic2bit));
++
++      /* The logic bits and the arithmetic bits should be zero again.  */
++      if (tmp3 & (0x1fll * logic1bit | 0xffll * logic2bit | 0xffll * add1bit))
++	DOABORT ("End of worker loop; bits none 0 on thread %d "
++			"workspace=0x%llx tmp3=0x%llx "
++			"mask=0x%llx maskedtmp3=0x%llx\n",
++		tw->thread, workspace, tmp3, (0x1fll * logic1bit |
++			0xffll * logic2bit | 0xffll * add1bit),
++		tmp3 & (0x1fll * logic1bit | 0xffll * logic2bit | 0xffll * add1bit));
++
++      __sync_add_and_fetch (&tw->count, 1);
++    }
++  while (!__sync_bool_compare_and_swap (&doquit, 1, 1));
++
++  pthread_exit (0);
++}
++
++int
++main ()
++{
++  /* We have 3 threads doing three sets of operations, an 8 bit
++     arithmetic field, a 5 bit logic field and an 8 bit logic
++     field (just to pack them all in).
++
++  6      5       4       4       3       2       1
++  3      6       8       0       2       4       6       8       0
++  |...,...|...,...|...,...|...,...|...,...|...,...|...,...|...,...
++  - T0   --  T1  -- T2   --T2 --  T0  -*- T2-- T1-- T1   -***- T0-
++   logic2  logic2  arith   log2  arith  log1 log1  arith     log1
++
++  */
++  unsigned int t;
++  long long tmp;
++  int err;
++
++  struct threadwork tw[3]={
++    { 0ll, 0, 27, 0, 56 },
++    { 0ll, 1,  8,16, 48 },
++    { 0ll, 2, 40,21, 35 }
++  };
++
++  pthread_t threads[3];
++
++  __sync_lock_release (&doquit);
++
++  /* Get the work space into a known value - All 1's.  */
++  __sync_lock_release (&workspace); /* Now all 0.  */
++  tmp = __sync_val_compare_and_swap (&workspace, 0, -1ll);
++  if (tmp!=0)
++    DOABORT ("Initial __sync_val_compare_and_swap wasn't 0 workspace=0x%llx "
++		"tmp=0x%llx\n", workspace,tmp);
++
++  for (t = 0; t < 3; t++)
++  {
++    err=pthread_create (&threads[t], NULL , worker, &tw[t]);
++    if (err) DOABORT ("pthread_create failed on thread %d with error %d\n",
++	t, err);
++  };
++
++  sleep (5);
++
++  /* Stop please.  */
++  __sync_lock_test_and_set (&doquit, 1ll);
++
++  for (t = 0; t < 3; t++)
++    {
++      err=pthread_join (threads[t], NULL);
++      if (err)
++	DOABORT ("pthread_join failed on thread %d with error %d\n", t, err);
++    };
++
++  __sync_synchronize ();
++
++  /* OK, so all the workers have finished -
++     the workers should have zero'd their workspace, the unused areas
++     should still be 1.  */
++  if (!__sync_bool_compare_and_swap (&workspace, 0x040000e0ll, 0))
++    DOABORT ("End of run workspace mismatch, got %llx\n", workspace);
++
++  /* All the workers should have done some work.  */
++  for (t = 0; t < 3; t++)
++    {
++      if (tw[t].count == 0) DOABORT ("Worker %d gave 0 count\n", t);
++    };
++
++  return 0;
++}
++
+
+=== added file 'gcc/testsuite/gcc.target/arm/di-longlong64-sync-withhelpers.c'
+--- old/gcc/testsuite/gcc.target/arm/di-longlong64-sync-withhelpers.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/di-longlong64-sync-withhelpers.c	2011-10-14 15:56:32 +0000
+@@ -0,0 +1,14 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_arch_v5_ok } */
++/* { dg-options "-std=gnu99" } */
++/* { dg-add-options arm_arch_v5 } */
++/* { dg-message "note: '__sync_fetch_and_nand' changed semantics in GCC 4.4" "" { target *-*-* } 0 } */
++/* { dg-message "note: '__sync_nand_and_fetch' changed semantics in GCC 4.4" "" { target *-*-* } 0 } */
++/* { dg-message "file included" "In file included" { target *-*-* } 0 } */
++
++#include "../../gcc.dg/di-longlong64-sync-1.c"
++
++/* On an old ARM we have no ldrexd or strexd so we have to use helpers.  */
++/* { dg-final { scan-assembler-not "ldrexd" } } */
++/* { dg-final { scan-assembler-not "strexd" } } */
++/* { dg-final { scan-assembler "__sync_" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/di-longlong64-sync-withldrexd.c'
+--- old/gcc/testsuite/gcc.target/arm/di-longlong64-sync-withldrexd.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/di-longlong64-sync-withldrexd.c	2011-10-14 15:56:32 +0000
+@@ -0,0 +1,17 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_arm_ok } */
++/* { dg-options "-marm -std=gnu99" } */
++/* { dg-require-effective-target arm_arch_v6k_ok } */
++/* { dg-add-options arm_arch_v6k } */
++/* { dg-message "note: '__sync_fetch_and_nand' changed semantics in GCC 4.4" "" { target *-*-* } 0 } */
++/* { dg-message "note: '__sync_nand_and_fetch' changed semantics in GCC 4.4" "" { target *-*-* } 0 } */
++/* { dg-message "file included" "In file included" { target *-*-* } 0 } */
++
++#include "../../gcc.dg/di-longlong64-sync-1.c"
++
++/* We should be using ldrexd, strexd and no helpers or shorter ldrex.  */
++/* { dg-final { scan-assembler-times "\tldrexd" 46 } } */
++/* { dg-final { scan-assembler-times "\tstrexd" 46 } } */
++/* { dg-final { scan-assembler-not "__sync_" } } */
++/* { dg-final { scan-assembler-not "ldrex\t" } } */
++/* { dg-final { scan-assembler-not "strex\t" } } */
+
+=== modified file 'gcc/testsuite/lib/target-supports.exp'
+--- old/gcc/testsuite/lib/target-supports.exp	2011-11-22 17:10:17 +0000
++++ new/gcc/testsuite/lib/target-supports.exp	2011-11-28 15:07:01 +0000
+@@ -2000,6 +2000,47 @@
+ 		check_effective_target_arm_fp16_ok_nocache]
+ }
+ 
++# Creates a series of routines that return 1 if the given architecture
++# can be selected and a routine to give the flags to select that architecture
++# Note: Extra flags may be added to disable options from newer compilers
++# (Thumb in particular - but others may be added in the future)
++# Usage: /* { dg-require-effective-target arm_arch_v5_ok } */
++#        /* { dg-add-options arm_arch_v5 } */
++foreach { armfunc armflag armdef } { v5 "-march=armv5 -marm" __ARM_ARCH_5__
++				     v6 "-march=armv6" __ARM_ARCH_6__
++				     v6k "-march=armv6k" __ARM_ARCH_6K__
++				     v7a "-march=armv7-a" __ARM_ARCH_7A__ } {
++    eval [string map [list FUNC $armfunc FLAG $armflag DEF $armdef ] {
++	proc check_effective_target_arm_arch_FUNC_ok { } {
++	    if { [ string match "*-marm*" "FLAG" ] &&
++		![check_effective_target_arm_arm_ok] } {
++		return 0
++	    }
++	    return [check_no_compiler_messages arm_arch_FUNC_ok assembly {
++		#if !defined (DEF)
++		#error FOO
++		#endif
++	    } "FLAG" ]
++	}
++
++	proc add_options_for_arm_arch_FUNC { flags } {
++	    return "$flags FLAG"
++	}
++    }]
++}
++
++# Return 1 if this is an ARM target where -marm causes ARM to be
++# used (not Thumb)
++
++proc check_effective_target_arm_arm_ok { } {
++    return [check_no_compiler_messages arm_arm_ok assembly {
++	#if !defined (__arm__) || defined (__thumb__) || defined (__thumb2__)
++	#error FOO
++	#endif
++    } "-marm"]
++}
++
++
+ # Return 1 is this is an ARM target where -mthumb causes Thumb-1 to be
+ # used.
+ 
+@@ -3384,6 +3425,31 @@
+     return $et_sync_int_long_saved
+ }
+ 
++# Return 1 if the target supports atomic operations on "long long" and can
++# execute them
++# So far only put checks in for ARM, others may want to add their own
++proc check_effective_target_sync_longlong { } {
++    return [check_runtime sync_longlong_runtime {
++      #include <stdlib.h>
++      int main ()
++      {
++	long long l1;
++
++	if (sizeof (long long) != 8)
++	  exit (1);
++
++      #ifdef __arm__
++	/* Just check for native; checking for kernel fallback is tricky.  */
++	asm volatile ("ldrexd r0,r1, [%0]" : : "r" (&l1) : "r0", "r1");
++      #else
++      # error "Add other suitable archs here"
++      #endif
++
++	exit (0);
++      }
++    } "" ]
++}
++
+ # Return 1 if the target supports atomic operations on "char" and "short".
+ 
+ proc check_effective_target_sync_char_short { } {
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106846.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106846.patch
new file mode 100644
index 0000000..88d74c7
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106846.patch
@@ -0,0 +1,487 @@
+2011-11-27  Ira Rosen  <ira.rosen@linaro.org>
+
+	Needs to be merged upstream:
+
+	gcc/
+	* tree-vect-patterns.c (widened_name_p): Rename to ...
+	(type_conversion_p): ... this.  Add new argument to determine
+	if it's a promotion or demotion operation.  Check for
+	CONVERT_EXPR_CODE_P instead of NOP_EXPR.
+	(vect_recog_dot_prod_pattern): Call type_conversion_p instead
+	widened_name_p.
+	(vect_recog_widen_mult_pattern, vect_recog_widen_sum_pattern,
+	vect_operation_fits_smaller_type, vect_recog_widen_shift_pattern):
+	Likewise.
+	(vect_recog_mixed_size_cond_pattern): Likewise and allow
+	non-constant then and else clauses.
+
+	gcc/testsuite/
+	* gcc.dg/vect/bb-slp-cond-3.c: New test.
+	* gcc.dg/vect/bb-slp-cond-4.c: New test.
+
+=== added file 'gcc/testsuite/gcc.dg/vect/bb-slp-cond-3.c'
+--- old/gcc/testsuite/gcc.dg/vect/bb-slp-cond-3.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/bb-slp-cond-3.c	2011-11-27 11:29:32 +0000
+@@ -0,0 +1,85 @@
++/* { dg-require-effective-target vect_condition } */
++
++#include "tree-vect.h"
++
++#define N 64 
++
++/* Comparison in int, then/else and result in unsigned char.  */ 
++
++static inline unsigned char
++foo (int x, int y, int a, int b)
++{
++  if (x >= y)
++    return a;
++  else
++    return b;
++}
++
++__attribute__((noinline, noclone)) void
++bar (unsigned char * __restrict__ a, unsigned char * __restrict__ b,
++     unsigned char * __restrict__ c, unsigned char * __restrict__ d,
++     unsigned char * __restrict__ e, int stride, int w)
++{
++  int i;
++  for (i = 0; i < N/stride; i++, a += stride, b += stride, c += stride,
++				d += stride, e += stride)
++    {
++      e[0] = foo (c[0], d[0], a[0] * w, b[0] * w);
++      e[1] = foo (c[1], d[1], a[1] * w, b[1] * w);
++      e[2] = foo (c[2], d[2], a[2] * w, b[2] * w);
++      e[3] = foo (c[3], d[3], a[3] * w, b[3] * w);
++      e[4] = foo (c[4], d[4], a[4] * w, b[4] * w);
++      e[5] = foo (c[5], d[5], a[5] * w, b[5] * w);
++      e[6] = foo (c[6], d[6], a[6] * w, b[6] * w);
++      e[7] = foo (c[7], d[7], a[7] * w, b[7] * w);
++      e[8] = foo (c[8], d[8], a[8] * w, b[8] * w);
++      e[9] = foo (c[9], d[9], a[9] * w, b[9] * w);
++      e[10] = foo (c[10], d[10], a[10] * w, b[10] * w);
++      e[11] = foo (c[11], d[11], a[11] * w, b[11] * w);
++      e[12] = foo (c[12], d[12], a[12] * w, b[12] * w);
++      e[13] = foo (c[13], d[13], a[13] * w, b[13] * w);
++      e[14] = foo (c[14], d[14], a[14] * w, b[14] * w);
++      e[15] = foo (c[15], d[15], a[15] * w, b[15] * w);
++    }
++}
++
++
++unsigned char a[N], b[N], c[N], d[N], e[N];
++
++int main ()
++{
++  int i;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      a[i] = i;
++      b[i] = 5;
++      e[i] = 0;
++
++      switch (i % 9)
++        {
++        case 0: asm (""); c[i] = i; d[i] = i + 1; break;
++        case 1: c[i] = 0; d[i] = 0; break;
++        case 2: c[i] = i + 1; d[i] = i - 1; break;
++        case 3: c[i] = i; d[i] = i + 7; break;
++        case 4: c[i] = i; d[i] = i; break;
++        case 5: c[i] = i + 16; d[i] = i + 3; break;
++        case 6: c[i] = i - 5; d[i] = i; break;
++        case 7: c[i] = i; d[i] = i; break;
++        case 8: c[i] = i; d[i] = i - 7; break;
++        }
++    }
++
++  bar (a, b, c, d, e, 16, 2);
++  for (i = 0; i < N; i++)
++    if (e[i] != ((i % 3) == 0 ? 10 : 2 * i))
++      abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "basic block vectorized using SLP" 1 "slp" { target { vect_element_align && vect_int_mult } } } } */
++/* { dg-final { cleanup-tree-dump "slp" } } */
++
+
+=== added file 'gcc/testsuite/gcc.dg/vect/bb-slp-cond-4.c'
+--- old/gcc/testsuite/gcc.dg/vect/bb-slp-cond-4.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/bb-slp-cond-4.c	2011-11-27 11:29:32 +0000
+@@ -0,0 +1,85 @@
++/* { dg-require-effective-target vect_condition } */
++
++#include "tree-vect.h"
++
++#define N 64 
++
++/* Comparison in short, then/else and result in int.  */
++static inline int
++foo (short x, short y, int a, int b)
++{
++  if (x >= y)
++    return a;
++  else
++    return b;
++}
++
++__attribute__((noinline, noclone)) void
++bar (short * __restrict__ a, short * __restrict__ b,
++     short * __restrict__ c, short * __restrict__ d,
++     int * __restrict__ e, int stride, int w)
++{
++  int i;
++  for (i = 0; i < N/stride; i++, a += stride, b += stride, c += stride,
++				d += stride, e += stride)
++    {
++      e[0] = foo (c[0], d[0], a[0], b[0]);
++      e[1] = foo (c[1], d[1], a[1], b[1]);
++      e[2] = foo (c[2], d[2], a[2], b[2]);
++      e[3] = foo (c[3], d[3], a[3], b[3]);
++      e[4] = foo (c[4], d[4], a[4], b[4]);
++      e[5] = foo (c[5], d[5], a[5], b[5]);
++      e[6] = foo (c[6], d[6], a[6], b[6]);
++      e[7] = foo (c[7], d[7], a[7], b[7]);
++      e[8] = foo (c[8], d[8], a[8], b[8]);
++      e[9] = foo (c[9], d[9], a[9], b[9]);
++      e[10] = foo (c[10], d[10], a[10], b[10]);
++      e[11] = foo (c[11], d[11], a[11], b[11]);
++      e[12] = foo (c[12], d[12], a[12], b[12]);
++      e[13] = foo (c[13], d[13], a[13], b[13]);
++      e[14] = foo (c[14], d[14], a[14], b[14]);
++      e[15] = foo (c[15], d[15], a[15], b[15]);
++    }
++}
++
++
++short a[N], b[N], c[N], d[N];
++int e[N];
++
++int main ()
++{
++  int i;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      a[i] = i;
++      b[i] = 5;
++      e[i] = 0;
++
++      switch (i % 9)
++        {
++        case 0: asm (""); c[i] = - i - 1; d[i] = i + 1; break;
++        case 1: c[i] = 0; d[i] = 0; break;
++        case 2: c[i] = i + 1; d[i] = - i - 1; break;
++        case 3: c[i] = i; d[i] = i + 7; break;
++        case 4: c[i] = i; d[i] = i; break;
++        case 5: c[i] = i + 16; d[i] = i + 3; break;
++        case 6: c[i] = - i - 5; d[i] = - i; break;
++        case 7: c[i] = - i; d[i] = - i; break;
++        case 8: c[i] = - i; d[i] = - i - 7; break;
++        }
++    }
++
++  bar (a, b, c, d, e, 16, 2);
++  for (i = 0; i < N; i++)
++    if (e[i] != ((i % 3) == 0 ? 5 : i))
++      abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "basic block vectorized using SLP" 1 "slp" { target vect_element_align } } } */
++/* { dg-final { cleanup-tree-dump "slp" } } */
++
+
+=== modified file 'gcc/tree-vect-patterns.c'
+--- old/gcc/tree-vect-patterns.c	2011-11-23 07:49:33 +0000
++++ new/gcc/tree-vect-patterns.c	2011-11-27 12:17:31 +0000
+@@ -62,18 +62,16 @@
+ 	vect_recog_mixed_size_cond_pattern};
+ 
+ 
+-/* Function widened_name_p
+-
+-   Check whether NAME, an ssa-name used in USE_STMT,
+-   is a result of a type-promotion, such that:
+-     DEF_STMT: NAME = NOP (name0)
+-   where the type of name0 (HALF_TYPE) is smaller than the type of NAME.
++/* Check whether NAME, an ssa-name used in USE_STMT,
++   is a result of a type promotion or demotion, such that:
++      DEF_STMT: NAME = NOP (name0)
++   where the type of name0 (ORIG_TYPE) is smaller/bigger than the type of NAME.
+    If CHECK_SIGN is TRUE, check that either both types are signed or both are
+    unsigned.  */
+ 
+ static bool
+-widened_name_p (tree name, gimple use_stmt, tree *half_type, gimple *def_stmt,
+-		bool check_sign)
++type_conversion_p (tree name, gimple use_stmt, bool check_sign,
++                   tree *orig_type, gimple *def_stmt, bool *promotion)
+ {
+   tree dummy;
+   gimple dummy_gimple;
+@@ -96,21 +94,27 @@
+       && dt != vect_external_def && dt != vect_constant_def)
+     return false;
+ 
+-  if (! *def_stmt)
++  if (!*def_stmt)
+     return false;
+ 
+   if (!is_gimple_assign (*def_stmt))
+     return false;
+ 
+-  if (gimple_assign_rhs_code (*def_stmt) != NOP_EXPR)
++  if (!CONVERT_EXPR_CODE_P (gimple_assign_rhs_code (*def_stmt)))
+     return false;
+ 
+   oprnd0 = gimple_assign_rhs1 (*def_stmt);
+ 
+-  *half_type = TREE_TYPE (oprnd0);
+-  if (!INTEGRAL_TYPE_P (type) || !INTEGRAL_TYPE_P (*half_type)
+-      || ((TYPE_UNSIGNED (type) != TYPE_UNSIGNED (*half_type)) && check_sign)
+-      || (TYPE_PRECISION (type) < (TYPE_PRECISION (*half_type) * 2)))
++  *orig_type = TREE_TYPE (oprnd0);
++  if (!INTEGRAL_TYPE_P (type) || !INTEGRAL_TYPE_P (*orig_type)
++      || ((TYPE_UNSIGNED (type) != TYPE_UNSIGNED (*orig_type)) && check_sign))
++    return false;
++
++  if (TYPE_PRECISION (type) >= (TYPE_PRECISION (*orig_type) * 2))
++    *promotion = true;
++  else if (TYPE_PRECISION (*orig_type) >= (TYPE_PRECISION (type) * 2))
++    *promotion = false;
++  else
+     return false;
+ 
+   if (!vect_is_simple_use (oprnd0, loop_vinfo, bb_vinfo, &dummy_gimple, &dummy,
+@@ -192,6 +196,7 @@
+   loop_vec_info loop_info = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
+   struct loop *loop;
+   tree var, rhs;
++  bool promotion;
+ 
+   if (!loop_info)
+     return NULL;
+@@ -255,7 +260,9 @@
+         return NULL;
+       stmt = last_stmt;
+ 
+-      if (widened_name_p (oprnd0, stmt, &half_type, &def_stmt, true))
++      if (type_conversion_p (oprnd0, stmt, true, &half_type, &def_stmt,
++                             &promotion)
++          && promotion)
+         {
+           stmt = def_stmt;
+           oprnd0 = gimple_assign_rhs1 (stmt);
+@@ -310,10 +317,14 @@
+       if (!types_compatible_p (TREE_TYPE (oprnd0), prod_type)
+           || !types_compatible_p (TREE_TYPE (oprnd1), prod_type))
+         return NULL;
+-      if (!widened_name_p (oprnd0, stmt, &half_type0, &def_stmt, true))
++      if (!type_conversion_p (oprnd0, stmt, true, &half_type0, &def_stmt,
++                              &promotion)
++          || !promotion)
+         return NULL;
+       oprnd00 = gimple_assign_rhs1 (def_stmt);
+-      if (!widened_name_p (oprnd1, stmt, &half_type1, &def_stmt, true))
++      if (!type_conversion_p (oprnd0, stmt, true, &half_type1, &def_stmt,
++                              &promotion)
++          || !promotion)
+         return NULL;
+       oprnd01 = gimple_assign_rhs1 (def_stmt);
+       if (!types_compatible_p (half_type0, half_type1))
+@@ -526,7 +537,7 @@
+   enum tree_code dummy_code;
+   int dummy_int;
+   VEC (tree, heap) *dummy_vec;
+-  bool op1_ok;
++  bool op1_ok, promotion;
+ 
+   if (!is_gimple_assign (last_stmt))
+     return NULL;
+@@ -546,12 +557,14 @@
+     return NULL;
+ 
+   /* Check argument 0.  */
+-  if (!widened_name_p (oprnd0, last_stmt, &half_type0, &def_stmt0, false))
++  if (!type_conversion_p (oprnd0, last_stmt, false, &half_type0, &def_stmt0,
++                          &promotion)
++      || !promotion)
+     return NULL;
+-  /* Check argument 1.  */
+-  op1_ok = widened_name_p (oprnd1, last_stmt, &half_type1, &def_stmt1, false);
+-
+-  if (op1_ok)
++   /* Check argument 1.  */
++  op1_ok = type_conversion_p (oprnd1, last_stmt, false, &half_type1,
++                              &def_stmt1, &promotion);
++  if (op1_ok && promotion)
+     {
+       oprnd0 = gimple_assign_rhs1 (def_stmt0);
+       oprnd1 = gimple_assign_rhs1 (def_stmt1);
+@@ -793,6 +806,7 @@
+   loop_vec_info loop_info = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
+   struct loop *loop;
+   tree var;
++  bool promotion;
+ 
+   if (!loop_info)
+     return NULL;
+@@ -832,8 +846,10 @@
+      Left to check that oprnd0 is defined by a cast from type 'type' to type
+      'TYPE'.  */
+ 
+-  if (!widened_name_p (oprnd0, last_stmt, &half_type, &stmt, true))
+-    return NULL;
++  if (!type_conversion_p (oprnd0, last_stmt, true, &half_type, &stmt,
++                          &promotion)
++      || !promotion)
++     return NULL;
+ 
+   oprnd0 = gimple_assign_rhs1 (stmt);
+   *type_in = half_type;
+@@ -899,6 +915,7 @@
+   gimple def_stmt, new_stmt;
+   bool first = false;
+   loop_vec_info loop_info = STMT_VINFO_LOOP_VINFO (vinfo_for_stmt (stmt));
++  bool promotion;
+   bb_vec_info bb_info = STMT_VINFO_BB_VINFO (vinfo_for_stmt (stmt));
+   struct loop *loop = NULL;
+ 
+@@ -933,7 +950,9 @@
+   else
+     {
+       first = true;
+-      if (!widened_name_p (oprnd, stmt, &half_type, &def_stmt, false)
++      if (!type_conversion_p (oprnd, stmt, false, &half_type, &def_stmt,
++                               &promotion)
++         || !promotion
+           || !gimple_bb (def_stmt)
+           || (loop && !flow_bb_inside_loop_p (loop, gimple_bb (def_stmt)))
+ 	  || (!loop && gimple_bb (def_stmt) != BB_VINFO_BB (bb_info)
+@@ -1327,6 +1346,7 @@
+   VEC (tree, heap) * dummy_vec;
+   gimple use_stmt = NULL;
+   bool over_widen = false;
++  bool promotion;
+ 
+   if (!is_gimple_assign (last_stmt) || !vinfo_for_stmt (last_stmt))
+     return NULL;
+@@ -1381,8 +1401,10 @@
+     return NULL;
+ 
+   /* Check operand 0: it has to be defined by a type promotion.  */
+-  if (!widened_name_p (oprnd0, last_stmt, &half_type0, &def_stmt0, false))
+-    return NULL;
++  if (!type_conversion_p (oprnd0, last_stmt, false, &half_type0, &def_stmt0,
++                          &promotion)
++      || !promotion)
++     return NULL;
+ 
+   /* Check operand 1: has to be positive.  We check that it fits the type
+      in vect_handle_widen_op_by_const ().  */
+@@ -1492,9 +1514,9 @@
+      S1  a_T = x_t CMP y_t ? b_T : c_T;
+ 
+    where type 'TYPE' is an integral type which has different size
+-   from 'type'.  b_T and c_T are constants and if 'TYPE' is wider
++   from 'type'.  b_T and c_T are either constants (and if 'TYPE' is wider
+    than 'type', the constants need to fit into an integer type
+-   with the same width as 'type'.
++   with the same width as 'type') or results of conversion from 'type'.
+ 
+    Input:
+ 
+@@ -1523,6 +1545,9 @@
+   enum machine_mode cmpmode;
+   gimple pattern_stmt, def_stmt;
+   loop_vec_info loop_vinfo = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
++  tree orig_type0 = NULL_TREE, orig_type1 = NULL_TREE;
++  gimple def_stmt0 = NULL, def_stmt1 = NULL;
++  bool promotion;
+   bb_vec_info bb_vinfo = STMT_VINFO_BB_VINFO (stmt_vinfo);
+ 
+   if (!is_gimple_assign (last_stmt)
+@@ -1535,25 +1560,40 @@
+   then_clause = TREE_OPERAND (op, 1);
+   else_clause = TREE_OPERAND (op, 2);
+ 
+-  if (TREE_CODE (then_clause) != INTEGER_CST
+-      || TREE_CODE (else_clause) != INTEGER_CST)
+-    return NULL;
+-
+   if (!COMPARISON_CLASS_P (cond_expr))
+     return NULL;
+ 
+   type = gimple_expr_type (last_stmt);
+   comp_type = TREE_TYPE (TREE_OPERAND (cond_expr, 0));
+-  if (!INTEGRAL_TYPE_P (comp_type)
+-      || !INTEGRAL_TYPE_P (type))
+-    return NULL;
+-
+   comp_vectype = get_vectype_for_scalar_type (comp_type);
+   if (comp_vectype == NULL_TREE)
+     return NULL;
+ 
++  if (types_compatible_p (type, comp_type)
++      || !INTEGRAL_TYPE_P (comp_type)
++      || !INTEGRAL_TYPE_P (type))
++    return NULL;
++
++  if ((TREE_CODE (then_clause) != INTEGER_CST
++       && !type_conversion_p (then_clause, last_stmt, false, &orig_type0,
++			      &def_stmt0, &promotion))
++      || (TREE_CODE (else_clause) != INTEGER_CST
++	  && !type_conversion_p (else_clause, last_stmt, false, &orig_type1,
++				 &def_stmt1, &promotion)))
++    return NULL;
++
++  if (orig_type0 && orig_type1
++      && (!types_compatible_p (orig_type0, orig_type1)
++	  || !types_compatible_p (orig_type0, comp_type)))
++    return NULL;
++
++  if (orig_type0)
++    then_clause = gimple_assign_rhs1 (def_stmt0);
++
++  if (orig_type1)
++    else_clause = gimple_assign_rhs1 (def_stmt1);
++
+   cmpmode = GET_MODE_INNER (TYPE_MODE (comp_vectype));
+-
+   if (GET_MODE_BITSIZE (TYPE_MODE (type)) == GET_MODE_BITSIZE (cmpmode))
+     return NULL;
+ 
+@@ -1561,18 +1601,15 @@
+   if (vectype == NULL_TREE)
+     return NULL;
+ 
+-  if (types_compatible_p (vectype, comp_vectype))
+-    return NULL;
+-
+   if (!expand_vec_cond_expr_p (comp_vectype, TYPE_MODE (comp_vectype)))
+     return NULL;
+ 
+-  if (GET_MODE_BITSIZE (TYPE_MODE (type)) > GET_MODE_BITSIZE (cmpmode))
+-    {
+-      if (!int_fits_type_p (then_clause, comp_type)
+-	  || !int_fits_type_p (else_clause, comp_type))
+-	return NULL;
+-    }
++  if (GET_MODE_BITSIZE (TYPE_MODE (type)) > GET_MODE_BITSIZE (cmpmode)
++      && ((TREE_CODE (then_clause) == INTEGER_CST
++           && !int_fits_type_p (then_clause, comp_type))
++          || (TREE_CODE (else_clause) == INTEGER_CST
++              && !int_fits_type_p (else_clause, comp_type))))
++    return NULL;
+ 
+   tmp = build3 (COND_EXPR, comp_type, unshare_expr (cond_expr),
+ 		fold_convert (comp_type, then_clause),
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106848.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106848.patch
new file mode 100644
index 0000000..43a2a4d
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106848.patch
@@ -0,0 +1,276 @@
+2011-12-05  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from mainline -A15 tuning.
+	2011-11-30  Matthew Gretton-Dann  <matthew.gretton-dann@arm.com>
+
+	* config/arm/arm.c (arm_issue_rate): Cortex-A15 can triple issue.
+	* config/arm/arm.md (mul64): New attribute.
+	(generic_sched): Cortex-A15 is not scheduled generically.
+	(cortex-a15.md): Include.
+	* config/arm/cortex-a15.md: New machine description.
+	* config/arm/t-arm (MD_INCLUDES): Add cortex-a15.md.
+
+        2011-11-30  Matthew Gretton-Dann  <matthew.gretton-dann@arm.com>
+	* config/arm/t-arm (MD_INCLUDES): Ensure all md files are listed.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-12-05 10:55:48 +0000
++++ new/gcc/config/arm/arm.c	2011-12-05 12:33:25 +0000
+@@ -24056,6 +24056,9 @@
+ {
+   switch (arm_tune)
+     {
++    case cortexa15:
++      return 3;
++
+     case cortexr4:
+     case cortexr4f:
+     case cortexr5:
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-10-26 11:38:30 +0000
++++ new/gcc/config/arm/arm.md	2011-12-02 00:38:59 +0000
+@@ -345,6 +345,13 @@
+ 	 (const_string "mult")
+ 	 (const_string "alu")))
+ 
++; Is this an (integer side) multiply with a 64-bit result?
++(define_attr "mul64" "no,yes"
++	     (if_then_else
++	       (eq_attr "insn" "smlalxy,umull,umulls,umlal,umlals,smull,smulls,smlal,smlals")
++	       (const_string "yes")
++	       (const_string "no")))
++
+ ; Load scheduling, set from the arm_ld_sched variable
+ ; initialized by arm_option_override()
+ (define_attr "ldsched" "no,yes" (const (symbol_ref "arm_ld_sched")))
+@@ -511,7 +518,7 @@
+ 
+ (define_attr "generic_sched" "yes,no"
+   (const (if_then_else
+-          (ior (eq_attr "tune" "fa526,fa626,fa606te,fa626te,fmp626,fa726te,arm926ejs,arm1020e,arm1026ejs,arm1136js,arm1136jfs,cortexa5,cortexa8,cortexa9,cortexm4")
++          (ior (eq_attr "tune" "fa526,fa626,fa606te,fa626te,fmp626,fa726te,arm926ejs,arm1020e,arm1026ejs,arm1136js,arm1136jfs,cortexa5,cortexa8,cortexa9,cortexa15,cortexm4")
+ 	       (eq_attr "tune_cortexr4" "yes"))
+           (const_string "no")
+           (const_string "yes"))))
+@@ -537,6 +544,7 @@
+ (include "cortex-a5.md")
+ (include "cortex-a8.md")
+ (include "cortex-a9.md")
++(include "cortex-a15.md")
+ (include "cortex-r4.md")
+ (include "cortex-r4f.md")
+ (include "cortex-m4.md")
+
+=== added file 'gcc/config/arm/cortex-a15.md'
+--- old/gcc/config/arm/cortex-a15.md	1970-01-01 00:00:00 +0000
++++ new/gcc/config/arm/cortex-a15.md	2011-12-02 00:38:59 +0000
+@@ -0,0 +1,186 @@
++;; ARM Cortex-A15 pipeline description
++;; Copyright (C) 2011 Free Software Foundation, Inc.
++;;
++;; Written by Matthew Gretton-Dann <matthew.gretton-dann@arm.com>
++
++;; This file is part of GCC.
++;;
++;; GCC is free software; you can redistribute it and/or modify it
++;; under the terms of the GNU General Public License as published by
++;; the Free Software Foundation; either version 3, or (at your option)
++;; any later version.
++;;
++;; GCC is distributed in the hope that it will be useful, but
++;; WITHOUT ANY WARRANTY; without even the implied warranty of
++;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++;; General Public License for more details.
++;;
++;; You should have received a copy of the GNU General Public License
++;; along with GCC; see the file COPYING3.  If not see
++;; <http://www.gnu.org/licenses/>.
++
++(define_automaton "cortex_a15")
++
++;; The Cortex-A15 core is modelled as a triple issue pipeline that has
++;; the following dispatch units.
++;; 1. Two pipelines for simple integer operations: SX1, SX2
++;; 2. Two pipelines for Neon and FP data-processing operations: CX1, CX2
++;; 3. One pipeline for branch operations: BX
++;; 4. One pipeline for integer multiply and divide operations: MX
++;; 5. Two pipelines for load and store operations: LS1, LS2
++;;
++;; We can issue into three pipelines per-cycle.
++;;
++;; We assume that where we have unit pairs xx1 is always filled before xx2.
++
++;; The three issue units
++(define_cpu_unit "ca15_i0, ca15_i1, ca15_i2" "cortex_a15")
++
++(define_reservation "ca15_issue1" "(ca15_i0|ca15_i1|ca15_i2)")
++(define_reservation "ca15_issue2" "((ca15_i0+ca15_i1)|(ca15_i1+ca15_i2))")
++(define_reservation "ca15_issue3" "(ca15_i0+ca15_i1+ca15_i2)")
++(final_presence_set "ca15_i1" "ca15_i0")
++(final_presence_set "ca15_i2" "ca15_i1")
++
++;; The main dispatch units
++(define_cpu_unit "ca15_sx1, ca15_sx2" "cortex_a15")
++(define_cpu_unit "ca15_cx1, ca15_cx2" "cortex_a15")
++(define_cpu_unit "ca15_ls1, ca15_ls2" "cortex_a15")
++(define_cpu_unit "ca15_bx, ca15_mx" "cortex_a15")
++
++(define_reservation "ca15_ls" "(ca15_ls1|ca15_ls2)")
++
++;; The extended load-store pipeline
++(define_cpu_unit "ca15_ldr, ca15_str" "cortex_a15")
++
++;; The extended ALU pipeline
++(define_cpu_unit "ca15_sx1_alu, ca15_sx1_shf, ca15_sx1_sat" "cortex_a15")
++(define_cpu_unit "ca15_sx2_alu, ca15_sx2_shf, ca15_sx2_sat" "cortex_a15")
++
++;; Simple Execution Unit:
++;;
++;; Simple ALU without shift
++(define_insn_reservation "cortex_a15_alu" 2
++  (and (eq_attr "tune" "cortexa15")
++       (and (eq_attr "type" "alu")
++            (eq_attr "neon_type" "none")))
++  "ca15_issue1,(ca15_sx1,ca15_sx1_alu)|(ca15_sx2,ca15_sx2_alu)")
++
++;; ALU ops with immediate shift
++(define_insn_reservation "cortex_a15_alu_shift" 3
++  (and (eq_attr "tune" "cortexa15")
++       (and (eq_attr "type" "alu_shift")
++            (eq_attr "neon_type" "none")))
++  "ca15_issue1,(ca15_sx1,ca15_sx1+ca15_sx1_shf,ca15_sx1_alu)\
++	       |(ca15_sx2,ca15_sx2+ca15_sx2_shf,ca15_sx2_alu)")
++
++;; ALU ops with register controlled shift
++(define_insn_reservation "cortex_a15_alu_shift_reg" 3
++  (and (eq_attr "tune" "cortexa15")
++       (and (eq_attr "type" "alu_shift_reg")
++	    (eq_attr "neon_type" "none")))
++  "(ca15_issue2,ca15_sx1+ca15_sx2,ca15_sx1_shf,ca15_sx2_alu)\
++   |(ca15_issue1,(ca15_issue1+ca15_sx2,ca15_sx1+ca15_sx2_shf)\
++   |(ca15_issue1+ca15_sx1,ca15_sx1+ca15_sx1_shf),ca15_sx1_alu)")
++
++;; Multiply Execution Unit:
++;;
++;; 32-bit multiplies
++(define_insn_reservation "cortex_a15_mult32" 3
++  (and (eq_attr "tune" "cortexa15")
++       (and (eq_attr "type" "mult")
++	    (and (eq_attr "neon_type" "none")
++		 (eq_attr "mul64" "no"))))
++  "ca15_issue1,ca15_mx")
++
++;; 64-bit multiplies
++(define_insn_reservation "cortex_a15_mult64" 4
++  (and (eq_attr "tune" "cortexa15")
++       (and (eq_attr "type" "mult")
++	    (and (eq_attr "neon_type" "none")
++		 (eq_attr "mul64" "yes"))))
++  "ca15_issue1,ca15_mx*2")
++
++;; Integer divide
++(define_insn_reservation "cortex_a15_udiv" 9
++  (and (eq_attr "tune" "cortexa15")
++       (eq_attr "insn" "udiv"))
++  "ca15_issue1,ca15_mx")
++
++(define_insn_reservation "cortex_a15_sdiv" 10
++  (and (eq_attr "tune" "cortexa15")
++       (eq_attr "insn" "sdiv"))
++  "ca15_issue1,ca15_mx")
++
++;; Block all issue pipes for a cycle
++(define_insn_reservation "cortex_a15_block" 1
++  (and (eq_attr "tune" "cortexa15")
++       (and (eq_attr "type" "block")
++	    (eq_attr "neon_type" "none")))
++  "ca15_issue3")
++
++;; Branch execution Unit
++;;
++;; Branches take one issue slot.
++;; No latency as there is no result
++(define_insn_reservation "cortex_a15_branch" 0
++  (and (eq_attr "tune" "cortexa15")
++       (and (eq_attr "type" "branch")
++	    (eq_attr "neon_type" "none")))
++  "ca15_issue1,ca15_bx")
++
++
++;; We lie with calls.  They take up all issue slots, and form a block in the
++;; pipeline.  The result however is available the next cycle.
++;;
++;; Addition of new units requires this to be updated.
++(define_insn_reservation "cortex_a15_call" 1
++  (and (eq_attr "tune" "cortexa15")
++       (and (eq_attr "type" "call")
++	    (eq_attr "neon_type" "none")))
++  "ca15_issue3,\
++   ca15_sx1+ca15_sx2+ca15_bx+ca15_mx+ca15_cx1+ca15_cx2+ca15_ls1+ca15_ls2,\
++   ca15_sx1_alu+ca15_sx1_shf+ca15_sx1_sat+ca15_sx2_alu+ca15_sx2_shf\
++    +ca15_sx2_sat+ca15_ldr+ca15_str")
++
++;; Load-store execution Unit
++;;
++;; Loads of up to two words.
++(define_insn_reservation "cortex_a15_load1" 4
++  (and (eq_attr "tune" "cortexa15")
++       (and (eq_attr "type" "load_byte,load1,load2")
++	    (eq_attr "neon_type" "none")))
++  "ca15_issue1,ca15_ls,ca15_ldr,nothing")
++
++;; Loads of three or four words.
++(define_insn_reservation "cortex_a15_load3" 5
++  (and (eq_attr "tune" "cortexa15")
++       (and (eq_attr "type" "load3,load4")
++	    (eq_attr "neon_type" "none")))
++  "ca15_issue2,ca15_ls1+ca15_ls2,ca15_ldr,ca15_ldr,nothing")
++
++;; Stores of up to two words.
++(define_insn_reservation "cortex_a15_store1" 0
++  (and (eq_attr "tune" "cortexa15")
++       (and (eq_attr "type" "store1,store2")
++	    (eq_attr "neon_type" "none")))
++  "ca15_issue1,ca15_ls,ca15_str")
++
++;; Stores of three or four words.
++(define_insn_reservation "cortex_a15_store3" 0
++  (and (eq_attr "tune" "cortexa15")
++       (and (eq_attr "type" "store3,store4")
++	    (eq_attr "neon_type" "none")))
++  "ca15_issue2,ca15_ls1+ca15_ls2,ca15_str,ca15_str")
++
++;; Simple execution unit bypasses
++(define_bypass 1 "cortex_a15_alu"
++	       "cortex_a15_alu,cortex_a15_alu_shift,cortex_a15_alu_shift_reg")
++(define_bypass 2 "cortex_a15_alu_shift"
++	       "cortex_a15_alu,cortex_a15_alu_shift,cortex_a15_alu_shift_reg")
++(define_bypass 2 "cortex_a15_alu_shift_reg"
++	       "cortex_a15_alu,cortex_a15_alu_shift,cortex_a15_alu_shift_reg")
++(define_bypass 1 "cortex_a15_alu" "cortex_a15_load1,cortex_a15_load3")
++(define_bypass 2 "cortex_a15_alu_shift" "cortex_a15_load1,cortex_a15_load3")
++(define_bypass 2 "cortex_a15_alu_shift_reg"
++	       "cortex_a15_load1,cortex_a15_load3")
+
+=== modified file 'gcc/config/arm/t-arm'
+--- old/gcc/config/arm/t-arm	2011-01-03 20:52:22 +0000
++++ new/gcc/config/arm/t-arm	2011-12-02 00:38:59 +0000
+@@ -31,6 +31,16 @@
+ 		$(srcdir)/config/arm/fmp626.md \
+ 		$(srcdir)/config/arm/fa726te.md \
+ 		$(srcdir)/config/arm/arm926ejs.md \
++		$(srcdir)/config/arm/cortex-a15.md \
++		$(srcdir)/config/arm/cortex-a5.md \
++		$(srcdir)/config/arm/cortex-a8.md \
++		$(srcdir)/config/arm/cortex-a8-neon.md \
++		$(srcdir)/config/arm/cortex-a9.md \
++		$(srcdir)/config/arm/cortex-a9-neon.md \
++		$(srcdir)/config/arm/cortex-m4-fpu.md \
++		$(srcdir)/config/arm/cortex-m4.md \
++		$(srcdir)/config/arm/cortex-r4f.md \
++		$(srcdir)/config/arm/cortex-r4.md \
+ 		$(srcdir)/config/arm/cirrus.md \
+ 		$(srcdir)/config/arm/fpa.md \
+ 		$(srcdir)/config/arm/vec-common.md \
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106853.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106853.patch
new file mode 100644
index 0000000..8c51c1d
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106853.patch
@@ -0,0 +1,69 @@
+2011-12-20  Ira Rosen  <ira.rosen@linaro.org>
+
+	Backport from mainline:
+
+	2011-11-29  Ira Rosen  <ira.rosen@linaro.org>
+
+	PR tree-optimization/51301
+	gcc/
+	* tree-vect-patterns.c (vect_recog_over_widening_pattern): Check that
+	the last statement doesn't convert to a bigger type than the original
+	type of the computation.
+
+	gcc/testsuite/
+	* gcc.dg/vect/pr51301.c: New test.
+
+=== added file 'gcc/testsuite/gcc.dg/vect/pr51301.c'
+--- old/gcc/testsuite/gcc.dg/vect/pr51301.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/pr51301.c	2011-11-30 17:54:51 +0000
+@@ -0,0 +1,15 @@
++/* { dg-do compile } */
++
++typedef signed char int8_t;
++typedef signed long long int64_t;
++int64_t
++f0a (int8_t * __restrict__ arg1)
++{
++  int idx;
++  int64_t result = 0;
++  for (idx = 0; idx < 416; idx += 1)
++    result += arg1[idx] << (arg1[idx] == arg1[idx]);
++  return result;
++}
++
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== modified file 'gcc/tree-vect-patterns.c'
+--- old/gcc/tree-vect-patterns.c	2011-11-27 12:17:31 +0000
++++ new/gcc/tree-vect-patterns.c	2011-12-20 07:47:44 +0000
+@@ -1138,6 +1138,7 @@
+   struct loop *loop = NULL;
+   bb_vec_info bb_vinfo;
+   stmt_vec_info stmt_vinfo;
++  tree type = NULL;
+ 
+   stmt_vinfo = vinfo_for_stmt (stmt);
+   loop_vinfo = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
+@@ -1207,6 +1208,7 @@
+           print_gimple_stmt (vect_dump, pattern_stmt, 0, TDF_SLIM);
+         }
+ 
++      type = gimple_expr_type (stmt);
+       prev_stmt = stmt;
+       stmt = use_stmt;
+ 
+@@ -1222,9 +1224,11 @@
+     {
+       use_lhs = gimple_assign_lhs (use_stmt);
+       use_type = TREE_TYPE (use_lhs);
+-      /* Support only type promotion or signedess change.  */
++      /* Support only type promotion or signedess change.  Check that USE_TYPE
++        is not bigger than the original type.  */
+       if (!INTEGRAL_TYPE_P (use_type)
+-          || TYPE_PRECISION (new_type) > TYPE_PRECISION (use_type))
++          || TYPE_PRECISION (new_type) > TYPE_PRECISION (use_type)
++         || TYPE_PRECISION (type) < TYPE_PRECISION (use_type))
+         return NULL;
+ 
+       if (TYPE_UNSIGNED (new_type) != TYPE_UNSIGNED (use_type)
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106854.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106854.patch
new file mode 100644
index 0000000..208ba0e
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106854.patch
@@ -0,0 +1,354 @@
+2011-12-30  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	Backport from mainline:
+
+	2011-10-12  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* expr.h (copy_blkmode_to_reg): Declare.
+	* expr.c (copy_blkmode_to_reg): New function.
+	(expand_assignment): Don't expand register RESULT_DECLs before
+	the lhs.  Use copy_blkmode_to_reg to copy BLKmode values into a
+	RESULT_DECL register.
+	(expand_expr_real_1): Handle BLKmode decls when looking for promotion.
+	* stmt.c (expand_return): Move BLKmode-to-register code into
+	copy_blkmode_to_reg.
+
+=== modified file 'gcc/expr.c'
+--- old/gcc/expr.c	2011-10-23 13:33:07 +0000
++++ new/gcc/expr.c	2011-12-30 09:41:30 +0000
+@@ -2180,6 +2180,111 @@
+   return tgtblk;
+ }
+ 
++/* Copy BLKmode value SRC into a register of mode MODE.  Return the
++   register if it contains any data, otherwise return null.
++
++   This is used on targets that return BLKmode values in registers.  */
++
++rtx
++copy_blkmode_to_reg (enum machine_mode mode, tree src)
++{
++  int i, n_regs;
++  unsigned HOST_WIDE_INT bitpos, xbitpos, padding_correction = 0, bytes;
++  unsigned int bitsize;
++  rtx *dst_words, dst, x, src_word = NULL_RTX, dst_word = NULL_RTX;
++  enum machine_mode dst_mode;
++
++  gcc_assert (TYPE_MODE (TREE_TYPE (src)) == BLKmode);
++
++  x = expand_normal (src);
++
++  bytes = int_size_in_bytes (TREE_TYPE (src));
++  if (bytes == 0)
++    return NULL_RTX;
++
++  /* If the structure doesn't take up a whole number of words, see
++     whether the register value should be padded on the left or on
++     the right.  Set PADDING_CORRECTION to the number of padding
++     bits needed on the left side.
++
++     In most ABIs, the structure will be returned at the least end of
++     the register, which translates to right padding on little-endian
++     targets and left padding on big-endian targets.  The opposite
++     holds if the structure is returned at the most significant
++     end of the register.  */
++  if (bytes % UNITS_PER_WORD != 0
++      && (targetm.calls.return_in_msb (TREE_TYPE (src))
++	  ? !BYTES_BIG_ENDIAN
++	  : BYTES_BIG_ENDIAN))
++    padding_correction = (BITS_PER_WORD - ((bytes % UNITS_PER_WORD)
++					   * BITS_PER_UNIT));
++
++  n_regs = (bytes + UNITS_PER_WORD - 1) / UNITS_PER_WORD;
++  dst_words = XALLOCAVEC (rtx, n_regs);
++  bitsize = MIN (TYPE_ALIGN (TREE_TYPE (src)), BITS_PER_WORD);
++
++  /* Copy the structure BITSIZE bits at a time.  */
++  for (bitpos = 0, xbitpos = padding_correction;
++       bitpos < bytes * BITS_PER_UNIT;
++       bitpos += bitsize, xbitpos += bitsize)
++    {
++      /* We need a new destination pseudo each time xbitpos is
++	 on a word boundary and when xbitpos == padding_correction
++	 (the first time through).  */
++      if (xbitpos % BITS_PER_WORD == 0
++	  || xbitpos == padding_correction)
++	{
++	  /* Generate an appropriate register.  */
++	  dst_word = gen_reg_rtx (word_mode);
++	  dst_words[xbitpos / BITS_PER_WORD] = dst_word;
++
++	  /* Clear the destination before we move anything into it.  */
++	  emit_move_insn (dst_word, CONST0_RTX (word_mode));
++	}
++
++      /* We need a new source operand each time bitpos is on a word
++	 boundary.  */
++      if (bitpos % BITS_PER_WORD == 0)
++	src_word = operand_subword_force (x, bitpos / BITS_PER_WORD, BLKmode);
++
++      /* Use bitpos for the source extraction (left justified) and
++	 xbitpos for the destination store (right justified).  */
++      store_bit_field (dst_word, bitsize, xbitpos % BITS_PER_WORD, word_mode,
++		       extract_bit_field (src_word, bitsize,
++					  bitpos % BITS_PER_WORD, 1, false,
++					  NULL_RTX, word_mode, word_mode));
++    }
++
++  if (mode == BLKmode)
++    {
++      /* Find the smallest integer mode large enough to hold the
++	 entire structure.  */
++      for (mode = GET_CLASS_NARROWEST_MODE (MODE_INT);
++	   mode != VOIDmode;
++	   mode = GET_MODE_WIDER_MODE (mode))
++	/* Have we found a large enough mode?  */
++	if (GET_MODE_SIZE (mode) >= bytes)
++	  break;
++
++      /* A suitable mode should have been found.  */
++      gcc_assert (mode != VOIDmode);
++    }
++
++  if (GET_MODE_SIZE (mode) < GET_MODE_SIZE (word_mode))
++    dst_mode = word_mode;
++  else
++    dst_mode = mode;
++  dst = gen_reg_rtx (dst_mode);
++
++  for (i = 0; i < n_regs; i++)
++    emit_move_insn (operand_subword (dst, i, 0, dst_mode), dst_words[i]);
++
++  if (mode != dst_mode)
++    dst = gen_lowpart (mode, dst);
++
++  return dst;
++}
++
+ /* Add a USE expression for REG to the (possibly empty) list pointed
+    to by CALL_FUSAGE.  REG must denote a hard register.  */
+ 
+@@ -4382,7 +4487,9 @@
+   if (TREE_CODE (from) == CALL_EXPR && ! aggregate_value_p (from, from)
+       && COMPLETE_TYPE_P (TREE_TYPE (from))
+       && TREE_CODE (TYPE_SIZE (TREE_TYPE (from))) == INTEGER_CST
+-      && ! (((TREE_CODE (to) == VAR_DECL || TREE_CODE (to) == PARM_DECL)
++      && ! (((TREE_CODE (to) == VAR_DECL
++	      || TREE_CODE (to) == PARM_DECL
++	      || TREE_CODE (to) == RESULT_DECL)
+ 	     && REG_P (DECL_RTL (to)))
+ 	    || TREE_CODE (to) == SSA_NAME))
+     {
+@@ -4428,12 +4535,15 @@
+       rtx temp;
+ 
+       push_temp_slots ();
+-      temp = expand_expr (from, NULL_RTX, GET_MODE (to_rtx), EXPAND_NORMAL);
++      if (REG_P (to_rtx) && TYPE_MODE (TREE_TYPE (from)) == BLKmode)
++	temp = copy_blkmode_to_reg (GET_MODE (to_rtx), from);
++      else
++	temp = expand_expr (from, NULL_RTX, GET_MODE (to_rtx), EXPAND_NORMAL);
+ 
+       if (GET_CODE (to_rtx) == PARALLEL)
+ 	emit_group_load (to_rtx, temp, TREE_TYPE (from),
+ 			 int_size_in_bytes (TREE_TYPE (from)));
+-      else
++      else if (temp)
+ 	emit_move_insn (to_rtx, temp);
+ 
+       preserve_temp_slots (to_rtx);
+@@ -8567,10 +8677,15 @@
+ 	  return temp;
+ 	}
+ 
+-      /* If the mode of DECL_RTL does not match that of the decl, it
+-	 must be a promoted value.  We return a SUBREG of the wanted mode,
+-	 but mark it so that we know that it was already extended.  */
+-      if (REG_P (decl_rtl) && GET_MODE (decl_rtl) != DECL_MODE (exp))
++      /* If the mode of DECL_RTL does not match that of the decl,
++	 there are two cases: we are dealing with a BLKmode value
++	 that is returned in a register, or we are dealing with
++	 a promoted value.  In the latter case, return a SUBREG
++	 of the wanted mode, but mark it so that we know that it
++	 was already extended.  */
++      if (REG_P (decl_rtl)
++	  && DECL_MODE (exp) != BLKmode
++	  && GET_MODE (decl_rtl) != DECL_MODE (exp))
+ 	{
+ 	  enum machine_mode pmode;
+ 
+
+=== modified file 'gcc/expr.h'
+--- old/gcc/expr.h	2011-03-03 21:56:58 +0000
++++ new/gcc/expr.h	2011-10-12 08:01:43 +0000
+@@ -324,6 +324,8 @@
+ /* Copy BLKmode object from a set of registers.  */
+ extern rtx copy_blkmode_from_reg (rtx, rtx, tree);
+ 
++extern rtx copy_blkmode_to_reg (enum machine_mode, tree);
++
+ /* Mark REG as holding a parameter for the next CALL_INSN.  */
+ extern void use_reg (rtx *, rtx);
+ 
+
+=== modified file 'gcc/stmt.c'
+--- old/gcc/stmt.c	2011-03-03 21:56:58 +0000
++++ new/gcc/stmt.c	2011-10-12 08:01:43 +0000
+@@ -1684,119 +1684,21 @@
+     expand_value_return (result_rtl);
+ 
+   /* If the result is an aggregate that is being returned in one (or more)
+-     registers, load the registers here.  The compiler currently can't handle
+-     copying a BLKmode value into registers.  We could put this code in a
+-     more general area (for use by everyone instead of just function
+-     call/return), but until this feature is generally usable it is kept here
+-     (and in expand_call).  */
++     registers, load the registers here.  */
+ 
+   else if (retval_rhs != 0
+ 	   && TYPE_MODE (TREE_TYPE (retval_rhs)) == BLKmode
+ 	   && REG_P (result_rtl))
+     {
+-      int i;
+-      unsigned HOST_WIDE_INT bitpos, xbitpos;
+-      unsigned HOST_WIDE_INT padding_correction = 0;
+-      unsigned HOST_WIDE_INT bytes
+-	= int_size_in_bytes (TREE_TYPE (retval_rhs));
+-      int n_regs = (bytes + UNITS_PER_WORD - 1) / UNITS_PER_WORD;
+-      unsigned int bitsize
+-	= MIN (TYPE_ALIGN (TREE_TYPE (retval_rhs)), BITS_PER_WORD);
+-      rtx *result_pseudos = XALLOCAVEC (rtx, n_regs);
+-      rtx result_reg, src = NULL_RTX, dst = NULL_RTX;
+-      rtx result_val = expand_normal (retval_rhs);
+-      enum machine_mode tmpmode, result_reg_mode;
+-
+-      if (bytes == 0)
+-	{
+-	  expand_null_return ();
+-	  return;
+-	}
+-
+-      /* If the structure doesn't take up a whole number of words, see
+-	 whether the register value should be padded on the left or on
+-	 the right.  Set PADDING_CORRECTION to the number of padding
+-	 bits needed on the left side.
+-
+-	 In most ABIs, the structure will be returned at the least end of
+-	 the register, which translates to right padding on little-endian
+-	 targets and left padding on big-endian targets.  The opposite
+-	 holds if the structure is returned at the most significant
+-	 end of the register.  */
+-      if (bytes % UNITS_PER_WORD != 0
+-	  && (targetm.calls.return_in_msb (TREE_TYPE (retval_rhs))
+-	      ? !BYTES_BIG_ENDIAN
+-	      : BYTES_BIG_ENDIAN))
+-	padding_correction = (BITS_PER_WORD - ((bytes % UNITS_PER_WORD)
+-					       * BITS_PER_UNIT));
+-
+-      /* Copy the structure BITSIZE bits at a time.  */
+-      for (bitpos = 0, xbitpos = padding_correction;
+-	   bitpos < bytes * BITS_PER_UNIT;
+-	   bitpos += bitsize, xbitpos += bitsize)
+-	{
+-	  /* We need a new destination pseudo each time xbitpos is
+-	     on a word boundary and when xbitpos == padding_correction
+-	     (the first time through).  */
+-	  if (xbitpos % BITS_PER_WORD == 0
+-	      || xbitpos == padding_correction)
+-	    {
+-	      /* Generate an appropriate register.  */
+-	      dst = gen_reg_rtx (word_mode);
+-	      result_pseudos[xbitpos / BITS_PER_WORD] = dst;
+-
+-	      /* Clear the destination before we move anything into it.  */
+-	      emit_move_insn (dst, CONST0_RTX (GET_MODE (dst)));
+-	    }
+-
+-	  /* We need a new source operand each time bitpos is on a word
+-	     boundary.  */
+-	  if (bitpos % BITS_PER_WORD == 0)
+-	    src = operand_subword_force (result_val,
+-					 bitpos / BITS_PER_WORD,
+-					 BLKmode);
+-
+-	  /* Use bitpos for the source extraction (left justified) and
+-	     xbitpos for the destination store (right justified).  */
+-	  store_bit_field (dst, bitsize, xbitpos % BITS_PER_WORD, word_mode,
+-			   extract_bit_field (src, bitsize,
+-					      bitpos % BITS_PER_WORD, 1, false,
+-					      NULL_RTX, word_mode, word_mode));
+-	}
+-
+-      tmpmode = GET_MODE (result_rtl);
+-      if (tmpmode == BLKmode)
+-	{
+-	  /* Find the smallest integer mode large enough to hold the
+-	     entire structure and use that mode instead of BLKmode
+-	     on the USE insn for the return register.  */
+-	  for (tmpmode = GET_CLASS_NARROWEST_MODE (MODE_INT);
+-	       tmpmode != VOIDmode;
+-	       tmpmode = GET_MODE_WIDER_MODE (tmpmode))
+-	    /* Have we found a large enough mode?  */
+-	    if (GET_MODE_SIZE (tmpmode) >= bytes)
+-	      break;
+-
+-	  /* A suitable mode should have been found.  */
+-	  gcc_assert (tmpmode != VOIDmode);
+-
+-	  PUT_MODE (result_rtl, tmpmode);
+-	}
+-
+-      if (GET_MODE_SIZE (tmpmode) < GET_MODE_SIZE (word_mode))
+-	result_reg_mode = word_mode;
++      val = copy_blkmode_to_reg (GET_MODE (result_rtl), retval_rhs);
++      if (val)
++	{
++	  /* Use the mode of the result value on the return register.  */
++	  PUT_MODE (result_rtl, GET_MODE (val));
++	  expand_value_return (val);
++	}
+       else
+-	result_reg_mode = tmpmode;
+-      result_reg = gen_reg_rtx (result_reg_mode);
+-
+-      for (i = 0; i < n_regs; i++)
+-	emit_move_insn (operand_subword (result_reg, i, 0, result_reg_mode),
+-			result_pseudos[i]);
+-
+-      if (tmpmode != result_reg_mode)
+-	result_reg = gen_lowpart (tmpmode, result_reg);
+-
+-      expand_value_return (result_reg);
++	expand_null_return ();
+     }
+   else if (retval_rhs != 0
+ 	   && !VOID_TYPE_P (TREE_TYPE (retval_rhs))
+
+=== added file 'gcc/testsuite/g++.dg/pr48660.C'
+--- old/gcc/testsuite/g++.dg/pr48660.C	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/g++.dg/pr48660.C	2011-10-12 08:01:43 +0000
+@@ -0,0 +1,22 @@
++template<int N> struct val { char a[N]; };
++
++class Base
++{
++public:
++  virtual val<1> get1() const = 0;
++  virtual val<2> get2() const = 0;
++  virtual val<3> get3() const = 0;
++  virtual val<4> get4() const = 0;
++};
++
++class Derived : public virtual Base
++{
++public:
++  virtual val<1> get1() const { return foo->get1(); }
++  virtual val<2> get2() const { return foo->get2(); }
++  virtual val<3> get3() const { return foo->get3(); }
++  virtual val<4> get4() const { return foo->get4(); }
++  Base *foo;
++};
++
++Base* make() { return new Derived; }
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106855.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106855.patch
new file mode 100644
index 0000000..c433fc7
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106855.patch
@@ -0,0 +1,22 @@
+2012-01-05  Michael Hope  <michael.hope@linaro.org>
+
+	Backport from mainline r182271:
+
+	2011-12-13  Revital Eres  <revital.eres@linaro.org>
+
+	gcc/
+	* modulo-sched.c (mark_loop_unsched): Free bbs.
+
+=== modified file 'gcc/modulo-sched.c'
+--- old/gcc/modulo-sched.c	2011-10-30 05:31:00 +0000
++++ new/gcc/modulo-sched.c	2012-01-05 02:45:23 +0000
+@@ -1204,6 +1204,8 @@
+ 
+   for (i = 0; i < loop->num_nodes; i++)
+     bbs[i]->flags |= BB_DISABLE_SCHEDULE;
++
++  free (bbs);
+ }
+ 
+ /* Return true if all the BBs of the loop are empty except the
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
index 882876e..e42aeea 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
@@ -74,4 +74,13 @@ file://linaro/gcc-4.6-linaro-r106836.patch \
 file://linaro/gcc-4.6-linaro-r106839.patch \
 file://linaro/gcc-4.6-linaro-r106840.patch \
 file://linaro/gcc-4.6-linaro-r106841.patch \
+file://linaro/gcc-4.6-linaro-r106842.patch \
+file://linaro/gcc-4.6-linaro-r106843.patch \
+file://linaro/gcc-4.6-linaro-r106844.patch \
+file://linaro/gcc-4.6-linaro-r106845.patch \
+file://linaro/gcc-4.6-linaro-r106846.patch \
+file://linaro/gcc-4.6-linaro-r106848.patch \
+file://linaro/gcc-4.6-linaro-r106853.patch \
+file://linaro/gcc-4.6-linaro-r106854.patch \
+file://linaro/gcc-4.6-linaro-r106855.patch \
 "
diff --git a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
index 6b0151b..6950797 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
@@ -1,4 +1,4 @@
 # this will prepend this layer to FILESPATH
 FILESEXTRAPATHS := "${THISDIR}/gcc-4.6"
-PRINC = "4"
+PRINC = "5"
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.5.4



