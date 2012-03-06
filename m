Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S4yDp-0004aw-2W
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 18:30:49 +0100
Received: by iaag37 with SMTP id g37so7065286iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 09:22:12 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.50.46.136 as permitted sender) client-ip=10.50.46.136; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.50.46.136 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.50.46.136])
	by 10.50.46.136 with SMTP id v8mr11152035igm.43.1331054532396 (num_hops
	= 1); Tue, 06 Mar 2012 09:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=D8k+M4w/Ds1nDTFnbSSIIAlST1L3WBhKIH4DEomIPkA=;
	b=Zgkye6Mg7zTNJMHdOrG+RSiw1FJcp47qRb/7ukcC5tKZlJFzzQj5B/21LrjkfFQCI7
	HYj/cYjoI9M9WuvytjnGZaYscO/q8b8EGAf+u+EUGaBMemEdKPjSEN+HVhdkgZswZKxD
	1ch16z7y7sdaxNnPQqIUmMDYjjq9gYjDGgOoHuPFyLhj91o04uQ5xarL+l5B7Zp/8asN
	Inufe7JOU666Vu0xhaldWBiS9xgwzStegYeTIcuww8IlynG64v9OFAFrJuCcYiRxzDZY
	rOOkzfMEqpBPxT2cQW+OKBgKi/HjNRfVSabWg8fR4hZmbdSOmKdtUTGIessMjuGuIgvN
	j2lQ==
Received: by 10.50.46.136 with SMTP id v8mr9307840igm.43.1331054532193;
	Tue, 06 Mar 2012 09:22:12 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id k3sm10487231igq.1.2012.03.06.09.22.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 09:22:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 09:21:34 -0800
Message-Id: <1331054494-22912-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] gcc-4.6: Adjust to match gcc 4.6.3 from OE-Core
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
X-List-Received-Date: Tue, 06 Mar 2012 17:30:50 -0000

Update linaro patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc/gcc-4.6/linaro/fix_linaro_106872.patch     |   45 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106740.patch    |  294 ---
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch    |   50 +-
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch    |  132 +-
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch    |   59 +-
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106854.patch    |  354 ---
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106860.patch    |  104 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106861.patch    |   76 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106862.patch    |   45 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106863.patch    |   47 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106864.patch    |   63 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106865.patch    |   25 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106869.patch    | 2389 ++++++++++++++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106870.patch    |   28 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106872.patch    |  126 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106873.patch    |   80 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106874.patch    |   46 +
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |   14 +-
 18 files changed, 3197 insertions(+), 780 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_106872.patch
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106740.patch
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106854.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106860.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106861.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106862.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106863.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106864.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106865.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106869.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106870.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106872.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106873.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106874.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_106872.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_106872.patch
new file mode 100644
index 0000000..ef33aff
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/fix_linaro_106872.patch
@@ -0,0 +1,45 @@
+Index: gcc-4_6-branch/gcc/config/arm/arm.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/arm.c	2012-03-05 17:14:09.901129286 -0800
++++ gcc-4_6-branch/gcc/config/arm/arm.c	2012-03-05 17:18:23.061141606 -0800
+@@ -17525,6 +17525,13 @@
+       }
+       return;
+ 
++    case 'v':
++      {
++        gcc_assert (GET_CODE (x) == CONST_DOUBLE);
++        fprintf (stream, "#%d", vfp3_const_double_for_fract_bits (x));
++        return;
++      }
++
+     /* Register specifier for vld1.16/vst1.16.  Translate the S register
+        number into a D register number and element index.  */
+     case 'z':
+@@ -24925,4 +24932,26 @@
+   return 4;
+ }
+ 
++int
++vfp3_const_double_for_fract_bits (rtx operand)
++{
++  REAL_VALUE_TYPE r0;
++  
++  if (GET_CODE (operand) != CONST_DOUBLE)
++    return 0;
++  
++  REAL_VALUE_FROM_CONST_DOUBLE (r0, operand);
++  if (exact_real_inverse (DFmode, &r0))
++    {
++      if (exact_real_truncate (DFmode, &r0))
++       {
++	 HOST_WIDE_INT value = real_to_integer (&r0);
++	 value = value & 0xffffffff;
++	 if ((value != 0) && ( (value & (value - 1)) == 0))
++	   return int_log2 (value);
++       }
++    }
++  return 0;
++}
++
+ #include "gt-arm.h"
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106740.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106740.patch
deleted file mode 100644
index 11a1da6..0000000
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106740.patch
+++ /dev/null
@@ -1,294 +0,0 @@
-2011-05-04  Richard Sandiford  <richard.sandiford@linaro.org>
-
-	Backport from mainline:
-
-	2011-03-29  Richard Sandiford  <richard.sandiford@linaro.org>
-
-	PR debug/48190
-	* dwarf2out.c (dw_loc_list_node): Add resolved_addr and replaced.
-	(cached_dw_loc_list_def): New structure.
-	(cached_dw_loc_list): New typedef.
-	(cached_dw_loc_list_table): New variable.
-	(cached_dw_loc_list_table_hash): New function.
-	(cached_dw_loc_list_table_eq): Likewise.
-	(add_location_or_const_value_attribute): Take a bool cache_p.
-	Cache the list when the parameter is true.
-	(gen_formal_parameter_die): Update caller.
-	(gen_variable_die): Likewise.
-	(dwarf2out_finish): Likewise.
-	(dwarf2out_abstract_function): Nullify cached_dw_loc_list_table
-	while generating debug info for the decl.
-	(dwarf2out_function_decl): Clear cached_dw_loc_list_table.
-	(dwarf2out_init): Initialize cached_dw_loc_list_table.
-	(resolve_addr): Cache the result of resolving a chain of
-	location lists.
-
-=== modified file 'gcc/dwarf2out.c'
---- old/gcc/dwarf2out.c	2011-03-29 22:47:59 +0000
-+++ new/gcc/dwarf2out.c	2011-05-04 13:20:12 +0000
-@@ -4427,6 +4427,11 @@
-   const char *section; /* Section this loclist is relative to */
-   dw_loc_descr_ref expr;
-   hashval_t hash;
-+  /* True if all addresses in this and subsequent lists are known to be
-+     resolved.  */
-+  bool resolved_addr;
-+  /* True if this list has been replaced by dw_loc_next.  */
-+  bool replaced;
-   bool emitted;
- } dw_loc_list_node;
- 
-@@ -6087,6 +6092,19 @@
- /* Table of decl location linked lists.  */
- static GTY ((param_is (var_loc_list))) htab_t decl_loc_table;
- 
-+/* A cached location list.  */
-+struct GTY (()) cached_dw_loc_list_def {
-+  /* The DECL_UID of the decl that this entry describes.  */
-+  unsigned int decl_id;
-+
-+  /* The cached location list.  */
-+  dw_loc_list_ref loc_list;
-+};
-+typedef struct cached_dw_loc_list_def cached_dw_loc_list;
-+
-+/* Table of cached location lists.  */
-+static GTY ((param_is (cached_dw_loc_list))) htab_t cached_dw_loc_list_table;
-+
- /* A pointer to the base of a list of references to DIE's that
-    are uniquely identified by their tag, presence/absence of
-    children DIE's, and list of attribute/value pairs.  */
-@@ -6434,7 +6452,7 @@
- static void insert_double (double_int, unsigned char *);
- static void insert_float (const_rtx, unsigned char *);
- static rtx rtl_for_decl_location (tree);
--static bool add_location_or_const_value_attribute (dw_die_ref, tree,
-+static bool add_location_or_const_value_attribute (dw_die_ref, tree, bool,
- 						   enum dwarf_attribute);
- static bool tree_add_const_value_attribute (dw_die_ref, tree);
- static bool tree_add_const_value_attribute_for_decl (dw_die_ref, tree);
-@@ -8168,6 +8186,24 @@
-     htab_find_with_hash (decl_loc_table, decl, DECL_UID (decl));
- }
- 
-+/* Returns a hash value for X (which really is a cached_dw_loc_list_list).  */
-+
-+static hashval_t
-+cached_dw_loc_list_table_hash (const void *x)
-+{
-+  return (hashval_t) ((const cached_dw_loc_list *) x)->decl_id;
-+}
-+
-+/* Return nonzero if decl_id of cached_dw_loc_list X is the same as
-+   UID of decl *Y.  */
-+
-+static int
-+cached_dw_loc_list_table_eq (const void *x, const void *y)
-+{
-+  return (((const cached_dw_loc_list *) x)->decl_id
-+	  == DECL_UID ((const_tree) y));
-+}
-+
- /* Equate a DIE to a particular declaration.  */
- 
- static void
-@@ -16965,15 +17001,22 @@
-    these things can crop up in other ways also.)  Note that one type of
-    constant value which can be passed into an inlined function is a constant
-    pointer.  This can happen for example if an actual argument in an inlined
--   function call evaluates to a compile-time constant address.  */
-+   function call evaluates to a compile-time constant address.
-+
-+   CACHE_P is true if it is worth caching the location list for DECL,
-+   so that future calls can reuse it rather than regenerate it from scratch.
-+   This is true for BLOCK_NONLOCALIZED_VARS in inlined subroutines,
-+   since we will need to refer to them each time the function is inlined.  */
- 
- static bool
--add_location_or_const_value_attribute (dw_die_ref die, tree decl,
-+add_location_or_const_value_attribute (dw_die_ref die, tree decl, bool cache_p,
- 				       enum dwarf_attribute attr)
- {
-   rtx rtl;
-   dw_loc_list_ref list;
-   var_loc_list *loc_list;
-+  cached_dw_loc_list *cache;
-+  void **slot;
- 
-   if (TREE_CODE (decl) == ERROR_MARK)
-     return false;
-@@ -17010,7 +17053,33 @@
- 	  && add_const_value_attribute (die, rtl))
- 	 return true;
-     }
--  list = loc_list_from_tree (decl, decl_by_reference_p (decl) ? 0 : 2);
-+  /* If this decl is from BLOCK_NONLOCALIZED_VARS, we might need its
-+     list several times.  See if we've already cached the contents.  */
-+  list = NULL;
-+  if (loc_list == NULL || cached_dw_loc_list_table == NULL)
-+    cache_p = false;
-+  if (cache_p)
-+    {
-+      cache = (cached_dw_loc_list *)
-+	htab_find_with_hash (cached_dw_loc_list_table, decl, DECL_UID (decl));
-+      if (cache)
-+	list = cache->loc_list;
-+    }
-+  if (list == NULL)
-+    {
-+      list = loc_list_from_tree (decl, decl_by_reference_p (decl) ? 0 : 2);
-+      /* It is usually worth caching this result if the decl is from
-+	 BLOCK_NONLOCALIZED_VARS and if the list has at least two elements.  */
-+      if (cache_p && list && list->dw_loc_next)
-+	{
-+	  slot = htab_find_slot_with_hash (cached_dw_loc_list_table, decl,
-+					   DECL_UID (decl), INSERT);
-+	  cache = ggc_alloc_cleared_cached_dw_loc_list ();
-+	  cache->decl_id = DECL_UID (decl);
-+	  cache->loc_list = list;
-+	  *slot = cache;
-+	}
-+    }
-   if (list)
-     {
-       add_AT_location_description (die, attr, list);
-@@ -18702,7 +18771,7 @@
-         equate_decl_number_to_die (node, parm_die);
-       if (! DECL_ABSTRACT (node_or_origin))
- 	add_location_or_const_value_attribute (parm_die, node_or_origin,
--					       DW_AT_location);
-+					       node == NULL, DW_AT_location);
- 
-       break;
- 
-@@ -18887,6 +18956,7 @@
-   tree context;
-   int was_abstract;
-   htab_t old_decl_loc_table;
-+  htab_t old_cached_dw_loc_list_table;
- 
-   /* Make sure we have the actual abstract inline, not a clone.  */
-   decl = DECL_ORIGIN (decl);
-@@ -18901,6 +18971,8 @@
-      get locations in abstract instantces.  */
-   old_decl_loc_table = decl_loc_table;
-   decl_loc_table = NULL;
-+  old_cached_dw_loc_list_table = cached_dw_loc_list_table;
-+  cached_dw_loc_list_table = NULL;
- 
-   /* Be sure we've emitted the in-class declaration DIE (if any) first, so
-      we don't get confused by DECL_ABSTRACT.  */
-@@ -18925,6 +18997,7 @@
- 
-   current_function_decl = save_fn;
-   decl_loc_table = old_decl_loc_table;
-+  cached_dw_loc_list_table = old_cached_dw_loc_list_table;
-   pop_cfun ();
- }
- 
-@@ -19709,9 +19782,8 @@
-           && !TREE_SYMBOL_REFERENCED (DECL_ASSEMBLER_NAME (decl_or_origin)))
- 	defer_location (decl_or_origin, var_die);
-       else
--        add_location_or_const_value_attribute (var_die,
--					       decl_or_origin,
--					       DW_AT_location);
-+        add_location_or_const_value_attribute (var_die, decl_or_origin,
-+					       decl == NULL, DW_AT_location);
-       add_pubname (decl_or_origin, var_die);
-     }
-   else
-@@ -21498,6 +21570,7 @@
-   dwarf2out_decl (decl);
- 
-   htab_empty (decl_loc_table);
-+  htab_empty (cached_dw_loc_list_table);
- }
- 
- /* Output a marker (i.e. a label) for the beginning of the generated code for
-@@ -22230,6 +22303,11 @@
-   decl_loc_table = htab_create_ggc (10, decl_loc_table_hash,
- 				    decl_loc_table_eq, NULL);
- 
-+  /* Allocate the cached_dw_loc_list_table.  */
-+  cached_dw_loc_list_table
-+    = htab_create_ggc (10, cached_dw_loc_list_table_hash,
-+		       cached_dw_loc_list_table_eq, NULL);
-+
-   /* Allocate the initial hunk of the decl_scope_table.  */
-   decl_scope_table = VEC_alloc (tree, gc, 256);
- 
-@@ -22870,30 +22948,53 @@
- {
-   dw_die_ref c;
-   dw_attr_ref a;
--  dw_loc_list_ref *curr;
-+  dw_loc_list_ref *curr, *start, loc;
-   unsigned ix;
- 
-   FOR_EACH_VEC_ELT (dw_attr_node, die->die_attr, ix, a)
-     switch (AT_class (a))
-       {
-       case dw_val_class_loc_list:
--	curr = AT_loc_list_ptr (a);
--	while (*curr)
-+	start = curr = AT_loc_list_ptr (a);
-+	loc = *curr;
-+	gcc_assert (loc);
-+	/* The same list can be referenced more than once.  See if we have
-+	   already recorded the result from a previous pass.  */
-+	if (loc->replaced)
-+	  *curr = loc->dw_loc_next;
-+	else if (!loc->resolved_addr)
- 	  {
--	    if (!resolve_addr_in_expr ((*curr)->expr))
-+	    /* As things stand, we do not expect or allow one die to
-+	       reference a suffix of another die's location list chain.
-+	       References must be identical or completely separate.
-+	       There is therefore no need to cache the result of this
-+	       pass on any list other than the first; doing so
-+	       would lead to unnecessary writes.  */
-+	    while (*curr)
- 	      {
--		dw_loc_list_ref next = (*curr)->dw_loc_next;
--		if (next && (*curr)->ll_symbol)
-+		gcc_assert (!(*curr)->replaced && !(*curr)->resolved_addr);
-+		if (!resolve_addr_in_expr ((*curr)->expr))
- 		  {
--		    gcc_assert (!next->ll_symbol);
--		    next->ll_symbol = (*curr)->ll_symbol;
-+		    dw_loc_list_ref next = (*curr)->dw_loc_next;
-+		    if (next && (*curr)->ll_symbol)
-+		      {
-+			gcc_assert (!next->ll_symbol);
-+			next->ll_symbol = (*curr)->ll_symbol;
-+		      }
-+		    *curr = next;
- 		  }
--		*curr = next;
-+		else
-+		  curr = &(*curr)->dw_loc_next;
- 	      }
-+	    if (loc == *start)
-+	      loc->resolved_addr = 1;
- 	    else
--	      curr = &(*curr)->dw_loc_next;
-+	      {
-+		loc->replaced = 1;
-+		loc->dw_loc_next = *start;
-+	      }
- 	  }
--	if (!AT_loc_list (a))
-+	if (!*start)
- 	  {
- 	    remove_AT (die, a->dw_attr);
- 	    ix--;
-@@ -23322,6 +23423,7 @@
-       add_location_or_const_value_attribute (
-         VEC_index (deferred_locations, deferred_locations_list, i)->die,
-         VEC_index (deferred_locations, deferred_locations_list, i)->variable,
-+	false,
- 	DW_AT_location);
-     }
- 
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
index f53b26a..6e76c21 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
@@ -19,8 +19,8 @@
 === modified file 'gcc/combine.c'
 Index: gcc-4_6-branch/gcc/combine.c
 ===================================================================
---- gcc-4_6-branch.orig/gcc/combine.c	2011-09-16 19:58:21.000000000 -0700
-+++ gcc-4_6-branch/gcc/combine.c	2011-09-16 20:05:36.626650681 -0700
+--- gcc-4_6-branch.orig/gcc/combine.c	2012-03-05 00:16:20.000000000 -0800
++++ gcc-4_6-branch/gcc/combine.c	2012-03-05 16:05:01.212928507 -0800
 @@ -391,8 +391,8 @@
  static void undo_all (void);
  static void undo_commit (void);
@@ -32,7 +32,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  static rtx simplify_if_then_else (rtx);
  static rtx simplify_set (rtx);
  static rtx simplify_logical (rtx);
-@@ -3112,12 +3112,12 @@
+@@ -3119,12 +3119,12 @@
  	  if (i1)
  	    {
  	      subst_low_luid = DF_INSN_LUID (i1);
@@ -47,7 +47,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  	    }
  	}
  
-@@ -3129,7 +3129,7 @@
+@@ -3136,7 +3136,7 @@
  	 self-referential RTL when we will be substituting I1SRC for I1DEST
  	 later.  Likewise if I0 feeds into I2, either directly or indirectly
  	 through I1, and I0DEST is in I0SRC.  */
@@ -56,7 +56,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  		      (i1_feeds_i2_n && i1dest_in_i1src)
  		      || ((i0_feeds_i2_n || (i0_feeds_i1_n && i1_feeds_i2_n))
  			  && i0dest_in_i0src));
-@@ -3168,7 +3168,7 @@
+@@ -3180,7 +3180,7 @@
  	 copy of I1SRC each time we substitute it, in order to avoid creating
  	 self-referential RTL when we will be substituting I0SRC for I0DEST
  	 later.  */
@@ -65,7 +65,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  		      i0_feeds_i1_n && i0dest_in_i0src);
        substed_i1 = 1;
  
-@@ -3198,7 +3198,7 @@
+@@ -3214,7 +3214,7 @@
  
        n_occurrences = 0;
        subst_low_luid = DF_INSN_LUID (i0);
@@ -74,16 +74,16 @@ Index: gcc-4_6-branch/gcc/combine.c
        substed_i0 = 1;
      }
  
-@@ -3260,7 +3260,7 @@
+@@ -3276,7 +3276,7 @@
  	{
  	  rtx t = i1pat;
  	  if (i0_feeds_i1_n)
--	    t = subst (t, i0dest, i0src, 0, 0);
-+	    t = subst (t, i0dest, i0src, 0, 0, 0);
+-	    t = subst (t, i0dest, i0src_copy ? i0src_copy : i0src, 0, 0);
++	    t = subst (t, i0dest, i0src_copy ? i0src_copy : i0src, 0, 0, 0);
  
  	  XVECEXP (newpat, 0, --total_sets) = t;
  	}
-@@ -3268,10 +3268,10 @@
+@@ -3284,10 +3284,10 @@
  	{
  	  rtx t = i2pat;
  	  if (i1_feeds_i2_n)
@@ -91,12 +91,12 @@ Index: gcc-4_6-branch/gcc/combine.c
 +	    t = subst (t, i1dest, i1src_copy ? i1src_copy : i1src, 0, 0,
  		       i0_feeds_i1_n && i0dest_in_i0src);
  	  if ((i0_feeds_i1_n && i1_feeds_i2_n) || i0_feeds_i2_n)
--	    t = subst (t, i0dest, i0src, 0, 0);
-+	    t = subst (t, i0dest, i0src, 0, 0, 0);
+-	    t = subst (t, i0dest, i0src_copy2 ? i0src_copy2 : i0src, 0, 0);
++	    t = subst (t, i0dest, i0src_copy2 ? i0src_copy2 : i0src, 0, 0, 0);
  
  	  XVECEXP (newpat, 0, --total_sets) = t;
  	}
-@@ -4943,11 +4943,13 @@
+@@ -4959,11 +4959,13 @@
  
     IN_DEST is nonzero if we are processing the SET_DEST of a SET.
  
@@ -111,7 +111,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  {
    enum rtx_code code = GET_CODE (x);
    enum machine_mode op0_mode = VOIDmode;
-@@ -5008,7 +5010,7 @@
+@@ -5024,7 +5026,7 @@
        && GET_CODE (XVECEXP (x, 0, 0)) == SET
        && GET_CODE (SET_SRC (XVECEXP (x, 0, 0))) == ASM_OPERANDS)
      {
@@ -120,7 +120,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  
        /* If this substitution failed, this whole thing fails.  */
        if (GET_CODE (new_rtx) == CLOBBER
-@@ -5025,7 +5027,7 @@
+@@ -5041,7 +5043,7 @@
  	      && GET_CODE (dest) != CC0
  	      && GET_CODE (dest) != PC)
  	    {
@@ -129,7 +129,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  
  	      /* If this substitution failed, this whole thing fails.  */
  	      if (GET_CODE (new_rtx) == CLOBBER
-@@ -5071,8 +5073,8 @@
+@@ -5087,8 +5089,8 @@
  		    }
  		  else
  		    {
@@ -140,7 +140,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  
  		      /* If this substitution failed, this whole thing
  			 fails.  */
-@@ -5149,7 +5151,9 @@
+@@ -5165,7 +5167,9 @@
  				&& (code == SUBREG || code == STRICT_LOW_PART
  				    || code == ZERO_EXTRACT))
  			       || code == SET)
@@ -151,7 +151,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  
  	      /* If we found that we will have to reject this combination,
  		 indicate that by returning the CLOBBER ourselves, rather than
-@@ -5206,7 +5210,7 @@
+@@ -5222,7 +5226,7 @@
        /* If X is sufficiently simple, don't bother trying to do anything
  	 with it.  */
        if (code != CONST_INT && code != REG && code != CLOBBER)
@@ -160,7 +160,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  
        if (GET_CODE (x) == code)
  	break;
-@@ -5226,10 +5230,12 @@
+@@ -5242,10 +5246,12 @@
     expression.
  
     OP0_MODE is the original mode of XEXP (x, 0).  IN_DEST is nonzero
@@ -175,7 +175,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  {
    enum rtx_code code = GET_CODE (x);
    enum machine_mode mode = GET_MODE (x);
-@@ -5284,8 +5290,8 @@
+@@ -5300,8 +5306,8 @@
  	     false arms to store-flag values.  Be careful to use copy_rtx
  	     here since true_rtx or false_rtx might share RTL with x as a
  	     result of the if_then_else_cond call above.  */
@@ -186,7 +186,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  
  	  /* If true_rtx and false_rtx are not general_operands, an if_then_else
  	     is unlikely to be simpler.  */
-@@ -5629,7 +5635,7 @@
+@@ -5645,7 +5651,7 @@
  	{
  	  /* Try to simplify the expression further.  */
  	  rtx tor = simplify_gen_binary (IOR, mode, XEXP (x, 0), XEXP (x, 1));
@@ -195,7 +195,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  
  	  /* If we could, great.  If not, do not go ahead with the IOR
  	     replacement, since PLUS appears in many special purpose
-@@ -5722,7 +5728,16 @@
+@@ -5738,7 +5744,16 @@
  	     ZERO_EXTRACT is indeed appropriate, it will be placed back by
  	     the call to make_compound_operation in the SET case.  */
  
@@ -213,7 +213,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  	      && new_code == NE && GET_MODE_CLASS (mode) == MODE_INT
  	      && op1 == const0_rtx
  	      && mode == GET_MODE (op0)
-@@ -5768,7 +5783,10 @@
+@@ -5784,7 +5799,10 @@
  
  	  /* If STORE_FLAG_VALUE is -1, we have cases similar to
  	     those above.  */
@@ -225,7 +225,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  	      && new_code == NE && GET_MODE_CLASS (mode) == MODE_INT
  	      && op1 == const0_rtx
  	      && (num_sign_bit_copies (op0, mode)
-@@ -5966,11 +5984,11 @@
+@@ -5982,11 +6000,11 @@
        if (reg_mentioned_p (from, true_rtx))
  	true_rtx = subst (known_cond (copy_rtx (true_rtx), true_code,
  				      from, true_val),
@@ -239,7 +239,7 @@ Index: gcc-4_6-branch/gcc/combine.c
  
        SUBST (XEXP (x, 1), swapped ? false_rtx : true_rtx);
        SUBST (XEXP (x, 2), swapped ? true_rtx : false_rtx);
-@@ -6187,11 +6205,11 @@
+@@ -6203,11 +6221,11 @@
  	{
  	  temp = subst (simplify_gen_relational (true_code, m, VOIDmode,
  						 cond_op0, cond_op1),
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch
index d49ebab..28caa40 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch
@@ -37,8 +37,10 @@
 	* config/arm/arm.md (*arm_movqi_insn): Compute attr "length".
 
 === modified file 'gcc/config/arm/arm-protos.h'
---- old/gcc/config/arm/arm-protos.h	2011-10-03 09:46:40 +0000
-+++ new/gcc/config/arm/arm-protos.h	2011-10-11 01:56:19 +0000
+Index: gcc-4_6-branch/gcc/config/arm/arm-protos.h
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/arm-protos.h	2012-03-05 16:07:15.000000000 -0800
++++ gcc-4_6-branch/gcc/config/arm/arm-protos.h	2012-03-05 16:07:50.392936694 -0800
 @@ -59,6 +59,7 @@
  					   int);
  extern rtx thumb_legitimize_reload_address (rtx *, enum machine_mode, int, int,
@@ -47,10 +49,10 @@
  extern int arm_const_double_rtx (rtx);
  extern int neg_const_double_rtx_ok_for_fpa (rtx);
  extern int vfp3_const_double_rtx (rtx);
-
-=== modified file 'gcc/config/arm/arm.c'
---- old/gcc/config/arm/arm.c	2011-10-03 09:46:40 +0000
-+++ new/gcc/config/arm/arm.c	2011-10-11 02:31:01 +0000
+Index: gcc-4_6-branch/gcc/config/arm/arm.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/arm.c	2012-03-05 16:07:15.000000000 -0800
++++ gcc-4_6-branch/gcc/config/arm/arm.c	2012-03-05 16:07:50.400936694 -0800
 @@ -2065,6 +2065,28 @@
  	fix_cm3_ldrd = 0;
      }
@@ -80,7 +82,7 @@
    if (TARGET_THUMB1 && flag_schedule_insns)
      {
        /* Don't warn since it's on by default in -O2.  */
-@@ -6106,7 +6128,7 @@
+@@ -6123,7 +6145,7 @@
     addresses based on the frame pointer or arg pointer until the
     reload pass starts.  This is so that eliminating such addresses
     into stack based ones won't produce impossible code.  */
@@ -89,7 +91,7 @@
  thumb1_legitimate_address_p (enum machine_mode mode, rtx x, int strict_p)
  {
    /* ??? Not clear if this is right.  Experiment.  */
-@@ -22226,6 +22248,10 @@
+@@ -22251,6 +22273,10 @@
  	val = 6;
        asm_fprintf (asm_out_file, "\t.eabi_attribute 30, %d\n", val);
  
@@ -100,22 +102,22 @@
        /* Tag_ABI_FP_16bit_format.  */
        if (arm_fp16_format)
  	asm_fprintf (asm_out_file, "\t.eabi_attribute 38, %d\n",
-
-=== modified file 'gcc/config/arm/arm.md'
---- old/gcc/config/arm/arm.md	2011-10-03 09:47:33 +0000
-+++ new/gcc/config/arm/arm.md	2011-10-11 02:31:01 +0000
-@@ -113,6 +113,10 @@
-    (UNSPEC_SYMBOL_OFFSET 27) ; The offset of the start of the symbol from
+Index: gcc-4_6-branch/gcc/config/arm/arm.md
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/arm.md	2012-03-05 16:07:15.000000000 -0800
++++ gcc-4_6-branch/gcc/config/arm/arm.md	2012-03-05 16:09:26.284941314 -0800
+@@ -114,6 +114,10 @@
                               ; another symbolic address.
     (UNSPEC_MEMORY_BARRIER 28) ; Represent a memory barrier.
-+   (UNSPEC_UNALIGNED_LOAD 29)  ; Used to represent ldr/ldrh instructions that access
+    (UNSPEC_PIC_UNIFIED 29)  ; Create a common pic addressing form.
++   (UNSPEC_UNALIGNED_LOAD 30)  ; Used to represent ldr/ldrh instructions that access
 +                               ; unaligned locations, on architectures which support
 +                               ; that.
-+   (UNSPEC_UNALIGNED_STORE 30) ; Same for str/strh.
++   (UNSPEC_UNALIGNED_STORE 31) ; Same for str/strh.
    ]
  )
  
-@@ -2463,10 +2467,10 @@
+@@ -2461,10 +2465,10 @@
  ;;; this insv pattern, so this pattern needs to be reevalutated.
  
  (define_expand "insv"
@@ -130,51 +132,59 @@
    "TARGET_ARM || arm_arch_thumb2"
    "
    {
-@@ -2477,35 +2481,70 @@
+@@ -2475,35 +2479,70 @@
  
      if (arm_arch_thumb2)
        {
 -	bool use_bfi = TRUE;
 -
 -	if (GET_CODE (operands[3]) == CONST_INT)
--	  {
--	    HOST_WIDE_INT val = INTVAL (operands[3]) & mask;
--
--	    if (val == 0)
--	      {
--		emit_insn (gen_insv_zero (operands[0], operands[1],
--					  operands[2]));
 +        if (unaligned_access && MEM_P (operands[0])
 +	    && s_register_operand (operands[3], GET_MODE (operands[3]))
 +	    && (width == 16 || width == 32) && (start_bit % BITS_PER_UNIT) == 0)
-+	  {
+ 	  {
+-	    HOST_WIDE_INT val = INTVAL (operands[3]) & mask;
 +	    rtx base_addr;
 +
 +	    if (BYTES_BIG_ENDIAN)
 +	      start_bit = GET_MODE_BITSIZE (GET_MODE (operands[3])) - width
 +			  - start_bit;
-+
+ 
+-	    if (val == 0)
 +	    if (width == 32)
-+	      {
+ 	      {
+-		emit_insn (gen_insv_zero (operands[0], operands[1],
+-					  operands[2]));
+-		DONE;
 +	        base_addr = adjust_address (operands[0], SImode,
 +					    start_bit / BITS_PER_UNIT);
 +		emit_insn (gen_unaligned_storesi (base_addr, operands[3]));
-+	      }
+ 	      }
 +	    else
 +	      {
 +	        rtx tmp = gen_reg_rtx (HImode);
-+
+ 
+-	    /* See if the set can be done with a single orr instruction.  */
+-	    if (val == mask && const_ok_for_arm (val << start_bit))
+-	      use_bfi = FALSE;
 +	        base_addr = adjust_address (operands[0], HImode,
 +					    start_bit / BITS_PER_UNIT);
 +		emit_move_insn (tmp, gen_lowpart (HImode, operands[3]));
 +		emit_insn (gen_unaligned_storehi (base_addr, tmp));
 +	      }
 +	    DONE;
-+	  }
+ 	  }
+-	  
+-	if (use_bfi)
 +	else if (s_register_operand (operands[0], GET_MODE (operands[0])))
-+	  {
+ 	  {
+-	    if (GET_CODE (operands[3]) != REG)
+-	      operands[3] = force_reg (SImode, operands[3]);
 +	    bool use_bfi = TRUE;
-+
+ 
+-	    emit_insn (gen_insv_t2 (operands[0], operands[1], operands[2],
+-				    operands[3]));
+-	    DONE;
 +	    if (GET_CODE (operands[3]) == CONST_INT)
 +	      {
 +		HOST_WIDE_INT val = INTVAL (operands[3]) & mask;
@@ -198,24 +208,9 @@
 +
 +		emit_insn (gen_insv_t2 (operands[0], operands[1], operands[2],
 +					operands[3]));
- 		DONE;
- 	      }
--
--	    /* See if the set can be done with a single orr instruction.  */
--	    if (val == mask && const_ok_for_arm (val << start_bit))
--	      use_bfi = FALSE;
--	  }
--	  
--	if (use_bfi)
--	  {
--	    if (GET_CODE (operands[3]) != REG)
--	      operands[3] = force_reg (SImode, operands[3]);
--
--	    emit_insn (gen_insv_t2 (operands[0], operands[1], operands[2],
--				    operands[3]));
--	    DONE;
--	  }
-+	  }
++		DONE;
++	      }
+ 	  }
 +	else
 +	  FAIL;
        }
@@ -226,7 +221,7 @@
      target = copy_rtx (operands[0]);
      /* Avoid using a subreg as a subtarget, and avoid writing a paradoxical 
         subreg as the final target.  */
-@@ -3697,12 +3736,10 @@
+@@ -3695,12 +3734,10 @@
  ;; to reduce register pressure later on.
  
  (define_expand "extzv"
@@ -243,7 +238,7 @@
    "TARGET_THUMB1 || arm_arch_thumb2"
    "
    {
-@@ -3711,10 +3748,57 @@
+@@ -3709,10 +3746,57 @@
      
      if (arm_arch_thumb2)
        {
@@ -304,7 +299,7 @@
  
      operands[3] = GEN_INT (rshift);
      
-@@ -3724,12 +3808,154 @@
+@@ -3722,12 +3806,154 @@
          DONE;
        }
        
@@ -462,7 +457,7 @@
    [(set (match_operand:SI 0 "s_register_operand" "=r")
  	(sign_extract:SI (match_operand:SI 1 "s_register_operand" "r")
                           (match_operand:SI 2 "const_int_operand" "M")
-@@ -6038,8 +6264,8 @@
+@@ -6069,8 +6295,8 @@
  
  
  (define_insn "*arm_movqi_insn"
@@ -473,7 +468,7 @@
    "TARGET_32BIT
     && (   register_operand (operands[0], QImode)
         || register_operand (operands[1], QImode))"
-@@ -6047,10 +6273,14 @@
+@@ -6078,10 +6304,14 @@
     mov%?\\t%0, %1
     mvn%?\\t%0, #%B1
     ldr%(b%)\\t%0, %1
@@ -491,10 +486,10 @@
  )
  
  (define_insn "*thumb1_movqi_insn"
-
-=== modified file 'gcc/config/arm/arm.opt'
---- old/gcc/config/arm/arm.opt	2011-09-19 07:44:24 +0000
-+++ new/gcc/config/arm/arm.opt	2011-10-11 02:31:01 +0000
+Index: gcc-4_6-branch/gcc/config/arm/arm.opt
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/arm.opt	2012-03-05 16:07:14.000000000 -0800
++++ gcc-4_6-branch/gcc/config/arm/arm.opt	2012-03-05 16:07:50.404936697 -0800
 @@ -173,3 +173,7 @@
  Target Report Var(fix_cm3_ldrd) Init(2)
  Avoid overlapping destination and address registers on LDRD instructions
@@ -503,10 +498,10 @@
 +munaligned-access
 +Target Report Var(unaligned_access) Init(2)
 +Enable unaligned word and halfword accesses to packed data.
-
-=== modified file 'gcc/config/arm/constraints.md'
---- old/gcc/config/arm/constraints.md	2011-09-12 14:14:00 +0000
-+++ new/gcc/config/arm/constraints.md	2011-10-11 02:31:01 +0000
+Index: gcc-4_6-branch/gcc/config/arm/constraints.md
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/constraints.md	2012-03-05 16:07:14.000000000 -0800
++++ gcc-4_6-branch/gcc/config/arm/constraints.md	2012-03-05 16:07:50.404936697 -0800
 @@ -36,6 +36,7 @@
  ;; The following memory constraints have been used:
  ;; in ARM/Thumb-2 state: Q, Ut, Uv, Uy, Un, Um, Us
@@ -543,10 +538,10 @@
  ;; We used to have constraint letters for S and R in ARM state, but
  ;; all uses of these now appear to have been removed.
  
-
-=== modified file 'gcc/expmed.c'
---- old/gcc/expmed.c	2011-05-22 19:02:59 +0000
-+++ new/gcc/expmed.c	2011-10-11 02:31:01 +0000
+Index: gcc-4_6-branch/gcc/expmed.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/expmed.c	2012-01-04 15:37:51.000000000 -0800
++++ gcc-4_6-branch/gcc/expmed.c	2012-03-05 16:07:50.404936697 -0800
 @@ -657,6 +657,10 @@
        && GET_MODE (value) != BLKmode
        && bitsize > 0
@@ -625,4 +620,3 @@
        if (xtarget == 0)
  	xtarget = xspec_target = gen_reg_rtx (tmode);
  
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch
index 74f139d..2cf2741 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106842.patch
@@ -48,8 +48,10 @@
 	Return true for NEON.
 
 === modified file 'gcc/testsuite/gcc.dg/vect/pr30858.c'
---- old/gcc/testsuite/gcc.dg/vect/pr30858.c	2007-02-22 08:16:18 +0000
-+++ new/gcc/testsuite/gcc.dg/vect/pr30858.c	2011-11-20 09:11:09 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/pr30858.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.dg/vect/pr30858.c	2012-01-04 15:33:52.000000000 -0800
++++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/pr30858.c	2012-03-05 16:23:47.748983031 -0800
 @@ -11,5 +11,6 @@
  }
  
@@ -58,10 +60,10 @@
 +/* { dg-final { scan-tree-dump-times "Unknown def-use cycle pattern." 1 "vect" { xfail vect_multiple_sizes } } } */
 +/* { dg-final { scan-tree-dump-times "Unknown def-use cycle pattern." 2 "vect" { target vect_multiple_sizes } } } */
  /* { dg-final { cleanup-tree-dump "vect" } } */
-
-=== added file 'gcc/testsuite/gcc.dg/vect/vect-cond-8a.c'
---- old/gcc/testsuite/gcc.dg/vect/vect-cond-8a.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.dg/vect/vect-cond-8a.c	2011-11-20 09:11:09 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-cond-8a.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-cond-8a.c	2012-03-05 16:23:47.748983031 -0800
 @@ -0,0 +1,75 @@
 +/* { dg-require-effective-target vect_condition } */
 +
@@ -138,24 +140,10 @@
 +
 +/* { dg-final { scan-tree-dump-times "note: vectorized 1 loops" 3 "vect" } } */
 +/* { dg-final { cleanup-tree-dump "vect" } } */
-
-=== modified file 'gcc/testsuite/lib/target-supports.exp'
---- old/gcc/testsuite/lib/target-supports.exp	2011-11-21 01:45:54 +0000
-+++ new/gcc/testsuite/lib/target-supports.exp	2011-11-22 16:52:23 +0000
-@@ -3150,7 +3150,8 @@
- 	     || [istarget ia64-*-*]
- 	     || [istarget i?86-*-*]
- 	     || [istarget spu-*-*]
--	     || [istarget x86_64-*-*] } {
-+	     || [istarget x86_64-*-*]
-+	     || ([istarget arm*-*-*] && [check_effective_target_arm_neon_ok]) } {
- 	   set et_vect_cond_saved 1
- 	}
-     }
-
-=== modified file 'gcc/tree-vect-patterns.c'
---- old/gcc/tree-vect-patterns.c	2011-10-23 13:33:07 +0000
-+++ new/gcc/tree-vect-patterns.c	2011-11-20 09:11:09 +0000
+Index: gcc-4_6-branch/gcc/tree-vect-patterns.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/tree-vect-patterns.c	2012-03-05 16:23:10.000000000 -0800
++++ gcc-4_6-branch/gcc/tree-vect-patterns.c	2012-03-05 16:23:47.748983031 -0800
 @@ -50,13 +50,16 @@
                                                   tree *);
  static gimple vect_recog_widen_shift_pattern (VEC (gimple, heap) **,
@@ -299,14 +287,14 @@
        def_stmt = STMT_VINFO_PATTERN_DEF_STMT (pattern_stmt_info);
 -      set_vinfo_for_stmt (def_stmt,
 -                          new_stmt_vec_info (def_stmt, loop_vinfo, NULL));
-+      def_stmt_info = vinfo_for_stmt (def_stmt);
+-      gimple_set_bb (def_stmt, gimple_bb (orig_stmt));
+       def_stmt_info = vinfo_for_stmt (def_stmt);
 +      if (def_stmt_info == NULL)
 +	{
 +	  def_stmt_info = new_stmt_vec_info (def_stmt, loop_vinfo, NULL);
 +	  set_vinfo_for_stmt (def_stmt, def_stmt_info);
 +	}
-       gimple_set_bb (def_stmt, gimple_bb (orig_stmt));
--      def_stmt_info = vinfo_for_stmt (def_stmt);
++      gimple_set_bb (def_stmt, gimple_bb (orig_stmt));
        STMT_VINFO_RELATED_STMT (def_stmt_info) = orig_stmt;
        STMT_VINFO_DEF_TYPE (def_stmt_info)
  	= STMT_VINFO_DEF_TYPE (orig_stmt_info);
@@ -316,10 +304,10 @@
      }
  }
  
-
-=== modified file 'gcc/tree-vect-stmts.c'
---- old/gcc/tree-vect-stmts.c	2011-11-14 11:38:08 +0000
-+++ new/gcc/tree-vect-stmts.c	2011-11-22 16:52:23 +0000
+Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/tree-vect-stmts.c	2012-03-05 16:23:11.000000000 -0800
++++ gcc-4_6-branch/gcc/tree-vect-stmts.c	2012-03-05 16:23:47.748983031 -0800
 @@ -655,20 +655,40 @@
                tree rhs = gimple_assign_rhs1 (stmt);
                unsigned int op_num;
@@ -372,10 +360,10 @@
                      break;
                     
                    case GIMPLE_BINARY_RHS:
-
-=== modified file 'gcc/tree-vectorizer.h'
---- old/gcc/tree-vectorizer.h	2011-11-14 11:38:08 +0000
-+++ new/gcc/tree-vectorizer.h	2011-11-22 16:52:23 +0000
+Index: gcc-4_6-branch/gcc/tree-vectorizer.h
+===================================================================
+--- gcc-4_6-branch.orig/gcc/tree-vectorizer.h	2012-03-05 16:23:11.000000000 -0800
++++ gcc-4_6-branch/gcc/tree-vectorizer.h	2012-03-05 16:23:47.748983031 -0800
 @@ -917,7 +917,7 @@
     Additional pattern recognition functions can (and will) be added
     in the future.  */
@@ -385,4 +373,3 @@
  void vect_pattern_recog (loop_vec_info);
  
  /* In tree-vectorizer.c.  */
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106854.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106854.patch
deleted file mode 100644
index 208ba0e..0000000
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106854.patch
+++ /dev/null
@@ -1,354 +0,0 @@
-2011-12-30  Richard Sandiford  <richard.sandiford@linaro.org>
-
-	gcc/
-	Backport from mainline:
-
-	2011-10-12  Richard Sandiford  <richard.sandiford@linaro.org>
-
-	* expr.h (copy_blkmode_to_reg): Declare.
-	* expr.c (copy_blkmode_to_reg): New function.
-	(expand_assignment): Don't expand register RESULT_DECLs before
-	the lhs.  Use copy_blkmode_to_reg to copy BLKmode values into a
-	RESULT_DECL register.
-	(expand_expr_real_1): Handle BLKmode decls when looking for promotion.
-	* stmt.c (expand_return): Move BLKmode-to-register code into
-	copy_blkmode_to_reg.
-
-=== modified file 'gcc/expr.c'
---- old/gcc/expr.c	2011-10-23 13:33:07 +0000
-+++ new/gcc/expr.c	2011-12-30 09:41:30 +0000
-@@ -2180,6 +2180,111 @@
-   return tgtblk;
- }
- 
-+/* Copy BLKmode value SRC into a register of mode MODE.  Return the
-+   register if it contains any data, otherwise return null.
-+
-+   This is used on targets that return BLKmode values in registers.  */
-+
-+rtx
-+copy_blkmode_to_reg (enum machine_mode mode, tree src)
-+{
-+  int i, n_regs;
-+  unsigned HOST_WIDE_INT bitpos, xbitpos, padding_correction = 0, bytes;
-+  unsigned int bitsize;
-+  rtx *dst_words, dst, x, src_word = NULL_RTX, dst_word = NULL_RTX;
-+  enum machine_mode dst_mode;
-+
-+  gcc_assert (TYPE_MODE (TREE_TYPE (src)) == BLKmode);
-+
-+  x = expand_normal (src);
-+
-+  bytes = int_size_in_bytes (TREE_TYPE (src));
-+  if (bytes == 0)
-+    return NULL_RTX;
-+
-+  /* If the structure doesn't take up a whole number of words, see
-+     whether the register value should be padded on the left or on
-+     the right.  Set PADDING_CORRECTION to the number of padding
-+     bits needed on the left side.
-+
-+     In most ABIs, the structure will be returned at the least end of
-+     the register, which translates to right padding on little-endian
-+     targets and left padding on big-endian targets.  The opposite
-+     holds if the structure is returned at the most significant
-+     end of the register.  */
-+  if (bytes % UNITS_PER_WORD != 0
-+      && (targetm.calls.return_in_msb (TREE_TYPE (src))
-+	  ? !BYTES_BIG_ENDIAN
-+	  : BYTES_BIG_ENDIAN))
-+    padding_correction = (BITS_PER_WORD - ((bytes % UNITS_PER_WORD)
-+					   * BITS_PER_UNIT));
-+
-+  n_regs = (bytes + UNITS_PER_WORD - 1) / UNITS_PER_WORD;
-+  dst_words = XALLOCAVEC (rtx, n_regs);
-+  bitsize = MIN (TYPE_ALIGN (TREE_TYPE (src)), BITS_PER_WORD);
-+
-+  /* Copy the structure BITSIZE bits at a time.  */
-+  for (bitpos = 0, xbitpos = padding_correction;
-+       bitpos < bytes * BITS_PER_UNIT;
-+       bitpos += bitsize, xbitpos += bitsize)
-+    {
-+      /* We need a new destination pseudo each time xbitpos is
-+	 on a word boundary and when xbitpos == padding_correction
-+	 (the first time through).  */
-+      if (xbitpos % BITS_PER_WORD == 0
-+	  || xbitpos == padding_correction)
-+	{
-+	  /* Generate an appropriate register.  */
-+	  dst_word = gen_reg_rtx (word_mode);
-+	  dst_words[xbitpos / BITS_PER_WORD] = dst_word;
-+
-+	  /* Clear the destination before we move anything into it.  */
-+	  emit_move_insn (dst_word, CONST0_RTX (word_mode));
-+	}
-+
-+      /* We need a new source operand each time bitpos is on a word
-+	 boundary.  */
-+      if (bitpos % BITS_PER_WORD == 0)
-+	src_word = operand_subword_force (x, bitpos / BITS_PER_WORD, BLKmode);
-+
-+      /* Use bitpos for the source extraction (left justified) and
-+	 xbitpos for the destination store (right justified).  */
-+      store_bit_field (dst_word, bitsize, xbitpos % BITS_PER_WORD, word_mode,
-+		       extract_bit_field (src_word, bitsize,
-+					  bitpos % BITS_PER_WORD, 1, false,
-+					  NULL_RTX, word_mode, word_mode));
-+    }
-+
-+  if (mode == BLKmode)
-+    {
-+      /* Find the smallest integer mode large enough to hold the
-+	 entire structure.  */
-+      for (mode = GET_CLASS_NARROWEST_MODE (MODE_INT);
-+	   mode != VOIDmode;
-+	   mode = GET_MODE_WIDER_MODE (mode))
-+	/* Have we found a large enough mode?  */
-+	if (GET_MODE_SIZE (mode) >= bytes)
-+	  break;
-+
-+      /* A suitable mode should have been found.  */
-+      gcc_assert (mode != VOIDmode);
-+    }
-+
-+  if (GET_MODE_SIZE (mode) < GET_MODE_SIZE (word_mode))
-+    dst_mode = word_mode;
-+  else
-+    dst_mode = mode;
-+  dst = gen_reg_rtx (dst_mode);
-+
-+  for (i = 0; i < n_regs; i++)
-+    emit_move_insn (operand_subword (dst, i, 0, dst_mode), dst_words[i]);
-+
-+  if (mode != dst_mode)
-+    dst = gen_lowpart (mode, dst);
-+
-+  return dst;
-+}
-+
- /* Add a USE expression for REG to the (possibly empty) list pointed
-    to by CALL_FUSAGE.  REG must denote a hard register.  */
- 
-@@ -4382,7 +4487,9 @@
-   if (TREE_CODE (from) == CALL_EXPR && ! aggregate_value_p (from, from)
-       && COMPLETE_TYPE_P (TREE_TYPE (from))
-       && TREE_CODE (TYPE_SIZE (TREE_TYPE (from))) == INTEGER_CST
--      && ! (((TREE_CODE (to) == VAR_DECL || TREE_CODE (to) == PARM_DECL)
-+      && ! (((TREE_CODE (to) == VAR_DECL
-+	      || TREE_CODE (to) == PARM_DECL
-+	      || TREE_CODE (to) == RESULT_DECL)
- 	     && REG_P (DECL_RTL (to)))
- 	    || TREE_CODE (to) == SSA_NAME))
-     {
-@@ -4428,12 +4535,15 @@
-       rtx temp;
- 
-       push_temp_slots ();
--      temp = expand_expr (from, NULL_RTX, GET_MODE (to_rtx), EXPAND_NORMAL);
-+      if (REG_P (to_rtx) && TYPE_MODE (TREE_TYPE (from)) == BLKmode)
-+	temp = copy_blkmode_to_reg (GET_MODE (to_rtx), from);
-+      else
-+	temp = expand_expr (from, NULL_RTX, GET_MODE (to_rtx), EXPAND_NORMAL);
- 
-       if (GET_CODE (to_rtx) == PARALLEL)
- 	emit_group_load (to_rtx, temp, TREE_TYPE (from),
- 			 int_size_in_bytes (TREE_TYPE (from)));
--      else
-+      else if (temp)
- 	emit_move_insn (to_rtx, temp);
- 
-       preserve_temp_slots (to_rtx);
-@@ -8567,10 +8677,15 @@
- 	  return temp;
- 	}
- 
--      /* If the mode of DECL_RTL does not match that of the decl, it
--	 must be a promoted value.  We return a SUBREG of the wanted mode,
--	 but mark it so that we know that it was already extended.  */
--      if (REG_P (decl_rtl) && GET_MODE (decl_rtl) != DECL_MODE (exp))
-+      /* If the mode of DECL_RTL does not match that of the decl,
-+	 there are two cases: we are dealing with a BLKmode value
-+	 that is returned in a register, or we are dealing with
-+	 a promoted value.  In the latter case, return a SUBREG
-+	 of the wanted mode, but mark it so that we know that it
-+	 was already extended.  */
-+      if (REG_P (decl_rtl)
-+	  && DECL_MODE (exp) != BLKmode
-+	  && GET_MODE (decl_rtl) != DECL_MODE (exp))
- 	{
- 	  enum machine_mode pmode;
- 
-
-=== modified file 'gcc/expr.h'
---- old/gcc/expr.h	2011-03-03 21:56:58 +0000
-+++ new/gcc/expr.h	2011-10-12 08:01:43 +0000
-@@ -324,6 +324,8 @@
- /* Copy BLKmode object from a set of registers.  */
- extern rtx copy_blkmode_from_reg (rtx, rtx, tree);
- 
-+extern rtx copy_blkmode_to_reg (enum machine_mode, tree);
-+
- /* Mark REG as holding a parameter for the next CALL_INSN.  */
- extern void use_reg (rtx *, rtx);
- 
-
-=== modified file 'gcc/stmt.c'
---- old/gcc/stmt.c	2011-03-03 21:56:58 +0000
-+++ new/gcc/stmt.c	2011-10-12 08:01:43 +0000
-@@ -1684,119 +1684,21 @@
-     expand_value_return (result_rtl);
- 
-   /* If the result is an aggregate that is being returned in one (or more)
--     registers, load the registers here.  The compiler currently can't handle
--     copying a BLKmode value into registers.  We could put this code in a
--     more general area (for use by everyone instead of just function
--     call/return), but until this feature is generally usable it is kept here
--     (and in expand_call).  */
-+     registers, load the registers here.  */
- 
-   else if (retval_rhs != 0
- 	   && TYPE_MODE (TREE_TYPE (retval_rhs)) == BLKmode
- 	   && REG_P (result_rtl))
-     {
--      int i;
--      unsigned HOST_WIDE_INT bitpos, xbitpos;
--      unsigned HOST_WIDE_INT padding_correction = 0;
--      unsigned HOST_WIDE_INT bytes
--	= int_size_in_bytes (TREE_TYPE (retval_rhs));
--      int n_regs = (bytes + UNITS_PER_WORD - 1) / UNITS_PER_WORD;
--      unsigned int bitsize
--	= MIN (TYPE_ALIGN (TREE_TYPE (retval_rhs)), BITS_PER_WORD);
--      rtx *result_pseudos = XALLOCAVEC (rtx, n_regs);
--      rtx result_reg, src = NULL_RTX, dst = NULL_RTX;
--      rtx result_val = expand_normal (retval_rhs);
--      enum machine_mode tmpmode, result_reg_mode;
--
--      if (bytes == 0)
--	{
--	  expand_null_return ();
--	  return;
--	}
--
--      /* If the structure doesn't take up a whole number of words, see
--	 whether the register value should be padded on the left or on
--	 the right.  Set PADDING_CORRECTION to the number of padding
--	 bits needed on the left side.
--
--	 In most ABIs, the structure will be returned at the least end of
--	 the register, which translates to right padding on little-endian
--	 targets and left padding on big-endian targets.  The opposite
--	 holds if the structure is returned at the most significant
--	 end of the register.  */
--      if (bytes % UNITS_PER_WORD != 0
--	  && (targetm.calls.return_in_msb (TREE_TYPE (retval_rhs))
--	      ? !BYTES_BIG_ENDIAN
--	      : BYTES_BIG_ENDIAN))
--	padding_correction = (BITS_PER_WORD - ((bytes % UNITS_PER_WORD)
--					       * BITS_PER_UNIT));
--
--      /* Copy the structure BITSIZE bits at a time.  */
--      for (bitpos = 0, xbitpos = padding_correction;
--	   bitpos < bytes * BITS_PER_UNIT;
--	   bitpos += bitsize, xbitpos += bitsize)
--	{
--	  /* We need a new destination pseudo each time xbitpos is
--	     on a word boundary and when xbitpos == padding_correction
--	     (the first time through).  */
--	  if (xbitpos % BITS_PER_WORD == 0
--	      || xbitpos == padding_correction)
--	    {
--	      /* Generate an appropriate register.  */
--	      dst = gen_reg_rtx (word_mode);
--	      result_pseudos[xbitpos / BITS_PER_WORD] = dst;
--
--	      /* Clear the destination before we move anything into it.  */
--	      emit_move_insn (dst, CONST0_RTX (GET_MODE (dst)));
--	    }
--
--	  /* We need a new source operand each time bitpos is on a word
--	     boundary.  */
--	  if (bitpos % BITS_PER_WORD == 0)
--	    src = operand_subword_force (result_val,
--					 bitpos / BITS_PER_WORD,
--					 BLKmode);
--
--	  /* Use bitpos for the source extraction (left justified) and
--	     xbitpos for the destination store (right justified).  */
--	  store_bit_field (dst, bitsize, xbitpos % BITS_PER_WORD, word_mode,
--			   extract_bit_field (src, bitsize,
--					      bitpos % BITS_PER_WORD, 1, false,
--					      NULL_RTX, word_mode, word_mode));
--	}
--
--      tmpmode = GET_MODE (result_rtl);
--      if (tmpmode == BLKmode)
--	{
--	  /* Find the smallest integer mode large enough to hold the
--	     entire structure and use that mode instead of BLKmode
--	     on the USE insn for the return register.  */
--	  for (tmpmode = GET_CLASS_NARROWEST_MODE (MODE_INT);
--	       tmpmode != VOIDmode;
--	       tmpmode = GET_MODE_WIDER_MODE (tmpmode))
--	    /* Have we found a large enough mode?  */
--	    if (GET_MODE_SIZE (tmpmode) >= bytes)
--	      break;
--
--	  /* A suitable mode should have been found.  */
--	  gcc_assert (tmpmode != VOIDmode);
--
--	  PUT_MODE (result_rtl, tmpmode);
--	}
--
--      if (GET_MODE_SIZE (tmpmode) < GET_MODE_SIZE (word_mode))
--	result_reg_mode = word_mode;
-+      val = copy_blkmode_to_reg (GET_MODE (result_rtl), retval_rhs);
-+      if (val)
-+	{
-+	  /* Use the mode of the result value on the return register.  */
-+	  PUT_MODE (result_rtl, GET_MODE (val));
-+	  expand_value_return (val);
-+	}
-       else
--	result_reg_mode = tmpmode;
--      result_reg = gen_reg_rtx (result_reg_mode);
--
--      for (i = 0; i < n_regs; i++)
--	emit_move_insn (operand_subword (result_reg, i, 0, result_reg_mode),
--			result_pseudos[i]);
--
--      if (tmpmode != result_reg_mode)
--	result_reg = gen_lowpart (tmpmode, result_reg);
--
--      expand_value_return (result_reg);
-+	expand_null_return ();
-     }
-   else if (retval_rhs != 0
- 	   && !VOID_TYPE_P (TREE_TYPE (retval_rhs))
-
-=== added file 'gcc/testsuite/g++.dg/pr48660.C'
---- old/gcc/testsuite/g++.dg/pr48660.C	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/g++.dg/pr48660.C	2011-10-12 08:01:43 +0000
-@@ -0,0 +1,22 @@
-+template<int N> struct val { char a[N]; };
-+
-+class Base
-+{
-+public:
-+  virtual val<1> get1() const = 0;
-+  virtual val<2> get2() const = 0;
-+  virtual val<3> get3() const = 0;
-+  virtual val<4> get4() const = 0;
-+};
-+
-+class Derived : public virtual Base
-+{
-+public:
-+  virtual val<1> get1() const { return foo->get1(); }
-+  virtual val<2> get2() const { return foo->get2(); }
-+  virtual val<3> get3() const { return foo->get3(); }
-+  virtual val<4> get4() const { return foo->get4(); }
-+  Base *foo;
-+};
-+
-+Base* make() { return new Derived; }
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106860.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106860.patch
new file mode 100644
index 0000000..895d6a6
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106860.patch
@@ -0,0 +1,104 @@
+2012-01-12  Ulrich Weigand  <ulrich.weigand@linaro.org>
+
+	LP 879725
+	Backport from mainline:
+
+	2012-01-02  Revital Eres  <revital.eres@linaro.org>
+
+	gcc/
+	* ddg.c (def_has_ccmode_p): New function.
+	(add_cross_iteration_register_deps,
+	create_ddg_dep_from_intra_loop_link): Call it.
+
+	gcc/testsuite/
+	* gcc.dg/sms-11.c: New file.
+
+=== modified file 'gcc/ddg.c'
+--- old/gcc/ddg.c	2011-10-02 06:56:53 +0000
++++ new/gcc/ddg.c	2012-01-10 16:05:14 +0000
+@@ -166,6 +166,24 @@
+   return false;
+ }
+ 
++/* Return true if one of the definitions in INSN has MODE_CC.  Otherwise
++   return false.  */
++static bool
++def_has_ccmode_p (rtx insn)
++{
++  df_ref *def;
++
++  for (def = DF_INSN_DEFS (insn); *def; def++)
++    {
++      enum machine_mode mode = GET_MODE (DF_REF_REG (*def));
++
++      if (GET_MODE_CLASS (mode) == MODE_CC)
++	return true;
++    }
++
++  return false;
++}
++
+ /* Computes the dependence parameters (latency, distance etc.), creates
+    a ddg_edge and adds it to the given DDG.  */
+ static void
+@@ -202,6 +220,7 @@
+      whose register has multiple defs in the loop.  */
+   if (flag_modulo_sched_allow_regmoves 
+       && (t == ANTI_DEP && dt == REG_DEP)
++      && !def_has_ccmode_p (dest_node->insn)
+       && !autoinc_var_is_used_p (dest_node->insn, src_node->insn))
+     {
+       rtx set;
+@@ -335,7 +354,8 @@
+           if (DF_REF_ID (last_def) != DF_REF_ID (first_def)
+               || !flag_modulo_sched_allow_regmoves
+ 	      || JUMP_P (use_node->insn)
+-              || autoinc_var_is_used_p (DF_REF_INSN (last_def), use_insn))
++              || autoinc_var_is_used_p (DF_REF_INSN (last_def), use_insn)
++	      || def_has_ccmode_p (DF_REF_INSN (last_def)))
+             create_ddg_dep_no_link (g, use_node, first_def_node, ANTI_DEP,
+                                     REG_DEP, 1);
+ 
+
+=== added file 'gcc/testsuite/gcc.dg/sms-11.c'
+--- old/gcc/testsuite/gcc.dg/sms-11.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/sms-11.c	2012-01-10 16:05:14 +0000
+@@ -0,0 +1,37 @@
++/* { dg-do run } */
++/* { dg-options "-O2 -fmodulo-sched -fmodulo-sched-allow-regmoves -fdump-rtl-sms" } */
++
++extern void abort (void);
++
++float out[4][4] = { 6, 6, 7, 5, 6, 7, 5, 5, 6, 4, 4, 4, 6, 2, 3, 4 };
++
++void
++invert (void)
++{
++  int i, j, k = 0, swap;
++  float tmp[4][4] = { 5, 6, 7, 5, 6, 7, 5, 5, 4, 4, 4, 4, 3, 2, 3, 4 };
++
++  for (i = 0; i < 4; i++)
++    {
++      for (j = i + 1; j < 4; j++)
++	if (tmp[j][i] > tmp[i][i])
++	  swap = j;
++
++      if (swap != i)
++	tmp[i][k] = tmp[swap][k];
++    }
++
++  for (i = 0; i < 4; i++)
++    for (j = 0; j < 4; j++)
++      if (tmp[i][j] != out[i][j])
++	abort ();
++}
++
++int
++main ()
++{
++  invert ();
++  return 0;
++}
++
++/* { dg-final { cleanup-rtl-dump "sms" } } */
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106861.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106861.patch
new file mode 100644
index 0000000..0199f7b
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106861.patch
@@ -0,0 +1,76 @@
+2012-01-18  Michael Hope  <michael.hope@linaro.org>
+
+	Backport from mainline r183126:
+
+	2012-01-12  Ira Rosen  <irar@il.ibm.com>
+
+	gcc/
+	PR tree-optimization/51799
+	* tree-vect-patterns.c (vect_recog_over_widening_pattern): Check
+	that the last operation is a type demotion.
+
+	gcc/testsuite/
+	* gcc.dg/vect/pr51799.c: New test.
+	* gcc.dg/vect/vect-widen-shift-u8.c: Expect two widening shift
+	patterns.
+
+=== added file 'gcc/testsuite/gcc.dg/vect/pr51799.c'
+--- old/gcc/testsuite/gcc.dg/vect/pr51799.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/pr51799.c	2012-01-18 01:53:19 +0000
+@@ -0,0 +1,18 @@
++/* { dg-do compile } */
++
++typedef signed char int8_t;
++typedef unsigned char uint8_t;
++typedef signed short int16_t;
++typedef unsigned long uint32_t;
++void
++f0a (uint32_t * __restrict__ result, int8_t * __restrict__ arg1,
++     uint32_t * __restrict__ arg4, int8_t temp_6)
++{
++  int idx;
++  for (idx = 0; idx < 416; idx += 1)
++    {
++      result[idx] = (uint8_t)(((arg1[idx] << 7) + arg4[idx]) * temp_6);
++    }
++}
++
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== modified file 'gcc/testsuite/gcc.dg/vect/vect-widen-shift-u8.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-widen-shift-u8.c	2011-10-23 13:33:07 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-widen-shift-u8.c	2012-01-18 01:53:19 +0000
+@@ -59,7 +59,6 @@
+   return 0;
+ }
+ 
+-/* { dg-final { scan-tree-dump-times "vect_recog_widen_shift_pattern: detected" 1 "vect" { target vect_widen_shift } } } */
++/* { dg-final { scan-tree-dump-times "vect_recog_widen_shift_pattern: detected" 2 "vect" { target vect_widen_shift } } } */
+ /* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" } } */
+ /* { dg-final { cleanup-tree-dump "vect" } } */
+-
+
+=== modified file 'gcc/tree-vect-patterns.c'
+--- old/gcc/tree-vect-patterns.c	2011-12-20 07:47:44 +0000
++++ new/gcc/tree-vect-patterns.c	2012-01-18 01:53:19 +0000
+@@ -1224,13 +1224,15 @@
+     {
+       use_lhs = gimple_assign_lhs (use_stmt);
+       use_type = TREE_TYPE (use_lhs);
+-      /* Support only type promotion or signedess change.  Check that USE_TYPE
+-        is not bigger than the original type.  */
++      /* Support only type demotion or signedess change.  */
+       if (!INTEGRAL_TYPE_P (use_type)
+-          || TYPE_PRECISION (new_type) > TYPE_PRECISION (use_type)
+-         || TYPE_PRECISION (type) < TYPE_PRECISION (use_type))
++	  || TYPE_PRECISION (type) <= TYPE_PRECISION (use_type))
+         return NULL;
+ 
++      /* Check that NEW_TYPE is not bigger than the conversion result.  */
++      if (TYPE_PRECISION (new_type) > TYPE_PRECISION (use_type))
++	return NULL;
++
+       if (TYPE_UNSIGNED (new_type) != TYPE_UNSIGNED (use_type)
+           || TYPE_PRECISION (new_type) != TYPE_PRECISION (use_type))
+         {
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106862.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106862.patch
new file mode 100644
index 0000000..a20d889
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106862.patch
@@ -0,0 +1,45 @@
+2012-01-16  Michael Hope  <michael.hope@linaro.org>
+
+	Backport from mainline r183011:
+
+	2012-01-09  Matthew Gretton-Dann  <matthew.gretton-dann@arm.com>
+
+	* config/arm/arm-cores.def (cortex-a15): Use cortex_a15_tune for
+	tuning parameters.
+	* config/arm/arm.c (arm_cortex_a15_tune): New static variable.
+
+=== modified file 'gcc/config/arm/arm-cores.def'
+--- old/gcc/config/arm/arm-cores.def	2011-10-19 16:46:51 +0000
++++ new/gcc/config/arm/arm-cores.def	2012-01-15 22:02:31 +0000
+@@ -128,7 +128,7 @@
+ ARM_CORE("cortex-a5",	  cortexa5,	7A,				 FL_LDSCHED, cortex_a5)
+ ARM_CORE("cortex-a8",	  cortexa8,	7A,				 FL_LDSCHED, cortex)
+ ARM_CORE("cortex-a9",	  cortexa9,	7A,				 FL_LDSCHED, cortex_a9)
+-ARM_CORE("cortex-a15",	  cortexa15,	7A,				 FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV, cortex)
++ARM_CORE("cortex-a15",	  cortexa15,	7A,				 FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV, cortex_a15)
+ ARM_CORE("cortex-r4",	  cortexr4,	7R,				 FL_LDSCHED, cortex)
+ ARM_CORE("cortex-r4f",	  cortexr4f,	7R,				 FL_LDSCHED, cortex)
+ ARM_CORE("cortex-r5",	  cortexr5,	7R,				 FL_LDSCHED | FL_ARM_DIV, cortex)
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2012-01-05 15:35:39 +0000
++++ new/gcc/config/arm/arm.c	2012-01-15 22:02:31 +0000
+@@ -983,6 +983,17 @@
+   arm_default_branch_cost
+ };
+ 
++const struct tune_params arm_cortex_a15_tune =
++{
++  arm_9e_rtx_costs,
++  NULL,
++  1,						/* Constant limit.  */
++  1,						/* Max cond insns.  */
++  ARM_PREFETCH_NOT_BENEFICIAL,			/* TODO: Calculate correct values.  */
++  false,					/* Prefer constant pool.  */
++  arm_cortex_a5_branch_cost
++};
++
+ const struct tune_params arm_fa726te_tune =
+ {
+   arm_9e_rtx_costs,
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106863.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106863.patch
new file mode 100644
index 0000000..e93493f
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106863.patch
@@ -0,0 +1,47 @@
+ 2012-01-16  Michael Hope  <michael.hope@linaro.org>
+ 
+	Backport from mainline r182561:
+
+	2011-12-20  Richard Henderson  <rth@redhat.com>
+
+	gcc/
+	* config/arm/arm.md (*arm_cmpdi_unsigned): Enable for thumb2.
+	* config/arm/arm.c (arm_select_cc_mode): Use it.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2012-01-15 22:02:31 +0000
++++ new/gcc/config/arm/arm.c	2012-01-23 00:06:27 +0000
+@@ -11602,7 +11602,7 @@
+ 	    return CC_Zmode;
+ 
+ 	  /* We can do an equality test in three Thumb instructions.  */
+-	  if (!TARGET_ARM)
++	  if (!TARGET_32BIT)
+ 	    return CC_Zmode;
+ 
+ 	  /* FALLTHROUGH */
+@@ -11614,7 +11614,7 @@
+ 	  /* DImode unsigned comparisons can be implemented by cmp +
+ 	     cmpeq without a scratch register.  Not worth doing in
+ 	     Thumb-2.  */
+-	  if (TARGET_ARM)
++	  if (TARGET_32BIT)
+ 	    return CC_CZmode;
+ 
+ 	  /* FALLTHROUGH */
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2012-01-05 15:35:39 +0000
++++ new/gcc/config/arm/arm.md	2012-01-15 21:02:00 +0000
+@@ -7515,8 +7515,8 @@
+   [(set (reg:CC_CZ CC_REGNUM)
+ 	(compare:CC_CZ (match_operand:DI 0 "s_register_operand" "r")
+ 		       (match_operand:DI 1 "arm_di_operand"	"rDi")))]
+-  "TARGET_ARM"
+-  "cmp%?\\t%R0, %R1\;cmpeq\\t%Q0, %Q1"
++  "TARGET_32BIT"
++  "cmp\\t%R0, %R1\;it eq\;cmpeq\\t%Q0, %Q1"
+   [(set_attr "conds" "set")
+    (set_attr "length" "8")]
+ )
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106864.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106864.patch
new file mode 100644
index 0000000..f15f37a
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106864.patch
@@ -0,0 +1,63 @@
+ 2012-01-16  Michael Hope  <michael.hope@linaro.org>
+ 
+	Backport from mainline r181210:
+
+	gcc/
+	2011-11-07  Matthew Gretton-Dann  <matthew.gretton-dann@arm.com>
+
+	* config/arm/arm-cores.def: Add -mcpu=cortex-a7.
+	* config/arm/arm-tables.opt: Regenerate.
+	* config/arm/arm-tune.md: Likewise.
+	* config/arm/bpabi.h (BE8_LINK_SPEC): Add Cortex A-7.
+	* doc/invoke.texi: Document -mcpu=cortex-a7.
+
+=== modified file 'gcc/config/arm/arm-cores.def'
+--- old/gcc/config/arm/arm-cores.def	2012-01-15 22:02:31 +0000
++++ new/gcc/config/arm/arm-cores.def	2012-01-23 00:36:02 +0000
+@@ -126,6 +126,7 @@
+ ARM_CORE("arm1156t2f-s",  arm1156t2fs,  6T2,				 FL_LDSCHED | FL_VFPV2, v6t2)
+ ARM_CORE("generic-armv7-a", genericv7a,	7A,				 FL_LDSCHED, cortex)
+ ARM_CORE("cortex-a5",	  cortexa5,	7A,				 FL_LDSCHED, cortex_a5)
++ARM_CORE("cortex-a7",	  cortexa7,	7A,				 FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV, cortex)
+ ARM_CORE("cortex-a8",	  cortexa8,	7A,				 FL_LDSCHED, cortex)
+ ARM_CORE("cortex-a9",	  cortexa9,	7A,				 FL_LDSCHED, cortex_a9)
+ ARM_CORE("cortex-a15",	  cortexa15,	7A,				 FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV, cortex_a15)
+
+=== modified file 'gcc/config/arm/arm-tune.md'
+--- old/gcc/config/arm/arm-tune.md	2011-10-19 16:46:51 +0000
++++ new/gcc/config/arm/arm-tune.md	2012-01-15 22:43:29 +0000
+@@ -1,5 +1,5 @@
+ ;; -*- buffer-read-only: t -*-
+ ;; Generated automatically by gentune.sh from arm-cores.def
+ (define_attr "tune"
+-	"arm2,arm250,arm3,arm6,arm60,arm600,arm610,arm620,arm7,arm7d,arm7di,arm70,arm700,arm700i,arm710,arm720,arm710c,arm7100,arm7500,arm7500fe,arm7m,arm7dm,arm7dmi,arm8,arm810,strongarm,strongarm110,strongarm1100,strongarm1110,fa526,fa626,arm7tdmi,arm7tdmis,arm710t,arm720t,arm740t,arm9,arm9tdmi,arm920,arm920t,arm922t,arm940t,ep9312,arm10tdmi,arm1020t,arm9e,arm946es,arm966es,arm968es,arm10e,arm1020e,arm1022e,xscale,iwmmxt,iwmmxt2,fa606te,fa626te,fmp626,fa726te,arm926ejs,arm1026ejs,arm1136js,arm1136jfs,arm1176jzs,arm1176jzfs,mpcorenovfp,mpcore,arm1156t2s,arm1156t2fs,genericv7a,cortexa5,cortexa8,cortexa9,cortexa15,cortexr4,cortexr4f,cortexr5,cortexm4,cortexm3,cortexm1,cortexm0"
++	"arm2,arm250,arm3,arm6,arm60,arm600,arm610,arm620,arm7,arm7d,arm7di,arm70,arm700,arm700i,arm710,arm720,arm710c,arm7100,arm7500,arm7500fe,arm7m,arm7dm,arm7dmi,arm8,arm810,strongarm,strongarm110,strongarm1100,strongarm1110,fa526,fa626,arm7tdmi,arm7tdmis,arm710t,arm720t,arm740t,arm9,arm9tdmi,arm920,arm920t,arm922t,arm940t,ep9312,arm10tdmi,arm1020t,arm9e,arm946es,arm966es,arm968es,arm10e,arm1020e,arm1022e,xscale,iwmmxt,iwmmxt2,fa606te,fa626te,fmp626,fa726te,arm926ejs,arm1026ejs,arm1136js,arm1136jfs,arm1176jzs,arm1176jzfs,mpcorenovfp,mpcore,arm1156t2s,arm1156t2fs,genericv7a,cortexa5,cortexa7,cortexa8,cortexa9,cortexa15,cortexr4,cortexr4f,cortexr5,cortexm4,cortexm3,cortexm1,cortexm0"
+ 	(const (symbol_ref "((enum attr_tune) arm_tune)")))
+
+=== modified file 'gcc/config/arm/bpabi.h'
+--- old/gcc/config/arm/bpabi.h	2011-11-02 21:02:53 +0000
++++ new/gcc/config/arm/bpabi.h	2012-01-15 22:43:29 +0000
+@@ -56,6 +56,7 @@
+   "|march=armv4|mcpu=fa526|mcpu=fa626:--fix-v4bx}"
+ 
+ #define BE8_LINK_SPEC " %{mbig-endian:%{march=armv7-a|mcpu=cortex-a5"\
++  "|mcpu=cortex-a7"\
+   "|mcpu=cortex-a8|mcpu=cortex-a9|mcpu=cortex-a15|mcpu=generic-armv7-a"\
+   ":%{!r:--be8}}}"
+ 
+
+=== modified file 'gcc/doc/invoke.texi'
+--- old/gcc/doc/invoke.texi	2012-01-05 15:35:39 +0000
++++ new/gcc/doc/invoke.texi	2012-01-15 22:43:29 +0000
+@@ -10202,8 +10202,8 @@
+ @samp{arm10e}, @samp{arm1020e}, @samp{arm1022e},
+ @samp{arm1136j-s}, @samp{arm1136jf-s}, @samp{mpcore}, @samp{mpcorenovfp},
+ @samp{arm1156t2-s}, @samp{arm1156t2f-s}, @samp{arm1176jz-s}, @samp{arm1176jzf-s},
+-@samp{cortex-a5}, @samp{cortex-a8}, @samp{cortex-a9}, @samp{cortex-a15},
+-@samp{cortex-r4}, @samp{cortex-r4f}, @samp{cortex-r5},
++@samp{cortex-a5}, @samp{cortex-a7}, @samp{cortex-a8}, @samp{cortex-a9}, 
++@samp{cortex-a15}, @samp{cortex-r4}, @samp{cortex-r4f}, @samp{cortex-r5},
+ @samp{cortex-m4}, @samp{cortex-m3},
+ @samp{cortex-m1},
+ @samp{cortex-m0},
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106865.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106865.patch
new file mode 100644
index 0000000..5b0735b
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106865.patch
@@ -0,0 +1,25 @@
+2012-01-20  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from mainline
+        2012-01-20  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	PR target/51819
+	* config/arm/arm.c (arm_print_operand): Correct output of alignment
+	hints for neon loads and stores.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2012-01-23 00:06:27 +0000
++++ new/gcc/config/arm/arm.c	2012-01-23 18:54:21 +0000
+@@ -17463,9 +17463,9 @@
+ 	/* Only certain alignment specifiers are supported by the hardware.  */
+ 	if (memsize == 16 && (align % 32) == 0)
+ 	  align_bits = 256;
+-	else if ((memsize == 8 || memsize == 16) && (align % 16) == 0)
++	else if (memsize == 16 && (align % 16) == 0)
+ 	  align_bits = 128;
+-	else if ((align % 8) == 0)
++	else if (memsize >= 8 && (align % 8) == 0)
+ 	  align_bits = 64;
+ 	else
+ 	  align_bits = 0;
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106869.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106869.patch
new file mode 100644
index 0000000..de3d2ff
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106869.patch
@@ -0,0 +1,2389 @@
+2012-02-08  Ulrich Weigand  <ulrich.weigand@linaro.org>
+
+	gcc/
+	* config/arm/arm.c (arm_option_optimization_table): Enable
+	-fsched-pressure using -fsched-pressure-algorithm=model by
+	default when optimizing.
+
+2012-02-08  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	* sched-deps.c (fixup_sched_groups): Rename to...
+	(chain_to_prev_insn): ...this.
+	(chain_to_prev_insn_p): New function.
+	(deps_analyze_insn): Use it instead of SCHED_GROUP_P.
+
+2012-02-08  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	* sched-int.h (_haifa_insn_data): Move priority_status.
+	Add model_index.
+	(INSN_MODEL_INDEX): New macro.
+	* haifa-sched.c (insn_delay): New function.
+	(sched_regno_pressure_class): Update commentary.
+	(mark_regno_birth_or_death): Pass the liveness bitmap and
+	pressure array as arguments, instead of using curr_reg_live and
+	curr_reg_pressure.  Only update the pressure if the bit in the
+	liveness set has changed.
+	(initiate_reg_pressure_info): Always trust the live-in set for
+	SCHED_PRESSURE_MODEL.
+	(initiate_bb_reg_pressure_info): Update call to
+	mark_regno_birth_or_death.
+	(dep_list_size): Take the list as argument.
+	(calculate_reg_deaths): New function, extracted from...
+	(setup_insn_reg_pressure_info): ...here.
+	(MODEL_BAR): New macro.
+	(model_pressure_data, model_insn_info, model_pressure_limit)
+	(model_pressure_group): New structures.
+	(model_schedule, model_worklist, model_insns, model_num_insns)
+	(model_curr_point, model_before_pressure, model_next_priority):
+	New variables.
+	(MODEL_PRESSURE_DATA, MODEL_MAX_PRESSURE, MODEL_REF_PRESSURE)
+	(MODEL_INSN_INFO, MODEL_INSN): New macros.
+	(model_index, model_update_limit_points_in_group): New functions.
+	(model_update_limit_points, model_last_use_except): Likewise.
+	(model_start_update_pressure, model_update_pressure): Likewise.
+	(model_recompute, model_spill_cost, model_excess_group_cost): Likewise.
+	(model_excess_cost, model_dump_pressure_points): Likewise.
+	(model_set_excess_costs): Likewise.
+	(rank_for_schedule): Extend SCHED_PRIORITY_WEIGHTED ordering to
+	SCHED_PRIORITY_MODEL.  Use insn_delay.  Use the order in the model
+	schedule as an alternative tie-breaker.  Update the call to
+	dep_list_size.
+	(ready_sort): Call model_set_excess_costs.
+	(update_register_pressure): Update call to mark_regno_birth_or_death.
+	Rely on that function to check liveness rather than doing it here.
+	(model_classify_pressure, model_order_p, model_add_to_worklist_at)
+	(model_remove_from_worklist, model_add_to_worklist, model_promote_insn)
+	(model_add_to_schedule, model_analyze_insns, model_init_pressure_group)
+	(model_record_pressure, model_record_pressures): New functions.
+	(model_record_final_pressures, model_add_successors_to_worklist)
+	(model_promote_predecessors, model_choose_insn): Likewise.
+	(model_reset_queue_indices, model_dump_pressure_summary): Likewise.
+	(model_start_schedule, model_finalize_pressure_group): Likewise.
+	(model_end_schedule): Likewise.
+	(schedule_insn): Say when we're scheduling the next instruction
+	in the model schedule.
+	(schedule_insn): Handle SCHED_PRESSURE_MODEL.
+	(queue_to_ready): Do not add instructions that are
+	MAX_SCHED_READY_INSNS beyond the current point of the model schedule.
+	Always allow the next instruction in the model schedule to be added.
+	(debug_ready_list): Print the INSN_REG_PRESSURE_EXCESS_COST_CHANGE
+	and delay for SCHED_PRESSURE_MODEL too.
+	(prune_ready_list): Extend SCHED_PRIORITY_WEIGHTED handling to
+	SCHED_PRIORITY_MODEL, but also take the DFA into account.
+	(schedule_block): Call model_start_schedule and model_end_schedule.
+	Extend SCHED_PRIORITY_WEIGHTED stall handling to SCHED_PRIORITY_MODEL.
+	(sched_init): Extend INSN_REG_PRESSURE_EXCESS_COST_CHANGE handling
+	to SCHED_PRESSURE_MODEL, but don't allocate saved_reg_live or
+	region_ref_regs.
+	(sched_finish): Update accordingly.
+	(fix_tick_ready): Extend INSN_REG_PRESSURE_EXCESS_COST_CHANGE handling
+	to SCHED_PRESSURE_MODEL.
+	(add_jump_dependencies): Update call to dep_list_size.
+	(haifa_finish_h_i_d): Fix leak of max_reg_pressure.
+	(haifa_init_insn): Extend INSN_REG_PRESSURE_EXCESS_COST_CHANGE handling
+	to SCHED_PRESSURE_MODEL.
+	* sched-deps.c (init_insn_reg_pressure_info): Likewise, but don't
+	allocate INSN_MAX_REG_PRESSURE for SCHED_PRESSURE_MODEL.
+	(sched_analyze_insn): Extend INSN_REG_PRESSURE_EXCESS_COST_CHANGE
+	handling to SCHED_PRESSURE_MODEL.
+
+2012-02-08  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	* common.opt (fsched-pressure-algorithm=): New option.
+	* flag-types.h (sched_pressure_algorithm): New enum.
+	* sched-int.h (sched_pressure_p): Replace with...
+	(sched_pressure): ...this new variable.
+	* haifa-sched.c (sched_pressure_p): Replace with...
+	(sched_pressure): ...this new variable.
+	(sched_regno_pressure_class, rank_for_schedule, ready_sort)
+	(update_reg_and_insn_max_reg_pressure, schedule_insn)
+	(debug_ready_list, schedule_block, sched_init, sched_finish)
+	(fix_tick_ready, haifa_init_insn): Update accordingly.
+	* sched-deps.c (init_insn_reg_pressure_info): Likewise.
+	* sched-rgn.c (schedule_region): Likewise.
+
+2012-02-08  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	Backport from mainline:
+
+	2011-04-01  Bernd Schmidt  <bernds@codesourcery.com>
+
+	* haifa-sched.c (prune_ready_list): New function, broken out of
+	schedule_block.
+	(schedule_block): Use it.
+
+=== modified file 'gcc/common.opt'
+--- old/gcc/common.opt	2011-04-11 15:26:47 +0000
++++ new/gcc/common.opt	2012-02-08 23:38:13 +0000
+@@ -1614,6 +1614,19 @@
+ Common Report Var(flag_sched_pressure) Init(0) Optimization
+ Enable register pressure sensitive insn scheduling
+ 
++fsched-pressure-algorithm=
++Common Joined RejectNegative Enum(sched_pressure_algorithm) Var(flag_sched_pressure_algorithm) Init(SCHED_PRESSURE_WEIGHTED)
++-fira-algorithm=[CB|priority] Set the used IRA algorithm
++
++Enum
++Name(sched_pressure_algorithm) Type(enum sched_pressure_algorithm) UnknownError(unknown %<fsched-pressure%> algorithm %qs)
++
++EnumValue
++Enum(sched_pressure_algorithm) String(weighted) Value(SCHED_PRESSURE_WEIGHTED)
++
++EnumValue
++Enum(sched_pressure_algorithm) String(model) Value(SCHED_PRESSURE_MODEL)
++
+ fsched-spec
+ Common Report Var(flag_schedule_speculative) Init(1) Optimization
+ Allow speculative motion of non-loads
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2012-02-01 14:13:07 +0000
++++ new/gcc/config/arm/arm.c	2012-02-09 00:47:59 +0000
+@@ -311,6 +311,11 @@
+ /* Set default optimization options.  */
+ static const struct default_options arm_option_optimization_table[] =
+   {
++    /* Enable -fsched-pressure using -fsched-pressure-algorithm=model
++       by default when optimizing.  */
++    { OPT_LEVELS_1_PLUS, OPT_fsched_pressure, NULL, 1 },
++    { OPT_LEVELS_1_PLUS, OPT_fsched_pressure_algorithm_,
++      NULL, SCHED_PRESSURE_MODEL },
+     /* Enable section anchors by default at -O1 or higher.  */
+     { OPT_LEVELS_1_PLUS, OPT_fsection_anchors, NULL, 1 },
+     { OPT_LEVELS_1_PLUS, OPT_fomit_frame_pointer, NULL, 1 },
+
+=== modified file 'gcc/flag-types.h'
+--- old/gcc/flag-types.h	2010-11-24 13:28:38 +0000
++++ new/gcc/flag-types.h	2012-02-08 23:38:13 +0000
+@@ -106,6 +106,14 @@
+ };
+ #endif
+ 
++/* The algorithm used to implement -fsched-pressure.  */
++enum sched_pressure_algorithm
++{
++  SCHED_PRESSURE_NONE,
++  SCHED_PRESSURE_WEIGHTED,
++  SCHED_PRESSURE_MODEL
++};
++
+ /* The algorithm used for the integrated register allocator (IRA).  */
+ enum ira_algorithm
+ {
+
+=== modified file 'gcc/haifa-sched.c'
+--- old/gcc/haifa-sched.c	2011-02-19 20:59:23 +0000
++++ new/gcc/haifa-sched.c	2012-02-08 23:39:02 +0000
+@@ -348,6 +348,14 @@
+ /* Create empty basic block after the specified block.  */
+ basic_block (* sched_create_empty_bb) (basic_block);
+ 
++/* Return the number of cycles until INSN is expected to be ready.
++   Return zero if it already is.  */
++static int
++insn_delay (rtx insn)
++{
++  return MAX (INSN_TICK (insn) - clock_var, 0);
++}
++
+ static int
+ may_trap_exp (const_rtx x, int is_store)
+ {
+@@ -571,10 +579,10 @@
+ 
+ /* Do register pressure sensitive insn scheduling if the flag is set
+    up.  */
+-bool sched_pressure_p;
++enum sched_pressure_algorithm sched_pressure;
+ 
+ /* Map regno -> its cover class.  The map defined only when
+-   SCHED_PRESSURE_P is true.  */
++   SCHED_PRESSURE != SCHED_PRESSURE_NONE.  */
+ enum reg_class *sched_regno_cover_class;
+ 
+ /* The current register pressure.  Only elements corresponding cover
+@@ -602,10 +610,12 @@
+   bitmap_clear (region_ref_regs);
+ }
+ 
+-/* Update current register pressure related info after birth (if
+-   BIRTH_P) or death of register REGNO.  */
+-static void
+-mark_regno_birth_or_death (int regno, bool birth_p)
++/* PRESSURE[CL] describes the pressure on register class CL.  Update it
++   for the birth (if BIRTH_P) or death (if !BIRTH_P) of register REGNO.
++   LIVE tracks the set of live registers; if it is null, assume that
++   every birth or death is genuine.  */
++static inline void
++mark_regno_birth_or_death (bitmap live, int *pressure, int regno, bool birth_p)
+ {
+   enum reg_class cover_class;
+ 
+@@ -616,15 +626,17 @@
+ 	{
+ 	  if (birth_p)
+ 	    {
+-	      bitmap_set_bit (curr_reg_live, regno);
+-	      curr_reg_pressure[cover_class]
+-		+= ira_reg_class_nregs[cover_class][PSEUDO_REGNO_MODE (regno)];
++	      if (!live || bitmap_set_bit (live, regno))
++		pressure[cover_class]
++		  += (ira_reg_class_nregs
++		      [cover_class][PSEUDO_REGNO_MODE (regno)]);
+ 	    }
+ 	  else
+ 	    {
+-	      bitmap_clear_bit (curr_reg_live, regno);
+-	      curr_reg_pressure[cover_class]
+-		-= ira_reg_class_nregs[cover_class][PSEUDO_REGNO_MODE (regno)];
++	      if (!live || bitmap_clear_bit (live, regno))
++		pressure[cover_class]
++		  -= (ira_reg_class_nregs
++		      [cover_class][PSEUDO_REGNO_MODE (regno)]);
+ 	    }
+ 	}
+     }
+@@ -633,13 +645,13 @@
+     {
+       if (birth_p)
+ 	{
+-	  bitmap_set_bit (curr_reg_live, regno);
+-	  curr_reg_pressure[cover_class]++;
++	  if (!live || bitmap_set_bit (live, regno))
++	    pressure[cover_class]++;
+ 	}
+       else
+ 	{
+-	  bitmap_clear_bit (curr_reg_live, regno);
+-	  curr_reg_pressure[cover_class]--;
++	  if (!live || bitmap_clear_bit (live, regno))
++	    pressure[cover_class]--;
+ 	}
+     }
+ }
+@@ -657,8 +669,10 @@
+     curr_reg_pressure[ira_reg_class_cover[i]] = 0;
+   bitmap_clear (curr_reg_live);
+   EXECUTE_IF_SET_IN_BITMAP (live, 0, j, bi)
+-    if (current_nr_blocks == 1 || bitmap_bit_p (region_ref_regs, j))
+-      mark_regno_birth_or_death (j, true);
++    if (sched_pressure == SCHED_PRESSURE_MODEL
++	|| current_nr_blocks == 1
++	|| bitmap_bit_p (region_ref_regs, j))
++      mark_regno_birth_or_death (curr_reg_live, curr_reg_pressure, j, true);
+ }
+ 
+ /* Mark registers in X as mentioned in the current region.  */
+@@ -712,7 +726,8 @@
+ 	if (regno == INVALID_REGNUM)
+ 	  break;
+ 	if (! bitmap_bit_p (df_get_live_in (bb), regno))
+-	  mark_regno_birth_or_death (regno, true);
++	  mark_regno_birth_or_death (curr_reg_live, curr_reg_pressure,
++				     regno, true);
+       }
+ #endif
+ }
+@@ -956,19 +971,19 @@
+   return true;
+ }
+ 
+-/* Compute the number of nondebug forward deps of an insn.  */
++/* Compute the number of nondebug deps in list LIST for INSN.  */
+ 
+ static int
+-dep_list_size (rtx insn)
++dep_list_size (rtx insn, sd_list_types_def list)
+ {
+   sd_iterator_def sd_it;
+   dep_t dep;
+   int dbgcount = 0, nodbgcount = 0;
+ 
+   if (!MAY_HAVE_DEBUG_INSNS)
+-    return sd_lists_size (insn, SD_LIST_FORW);
++    return sd_lists_size (insn, list);
+ 
+-  FOR_EACH_DEP (insn, SD_LIST_FORW, sd_it, dep)
++  FOR_EACH_DEP (insn, list, sd_it, dep)
+     {
+       if (DEBUG_INSN_P (DEP_CON (dep)))
+ 	dbgcount++;
+@@ -976,7 +991,7 @@
+ 	nodbgcount++;
+     }
+ 
+-  gcc_assert (dbgcount + nodbgcount == sd_lists_size (insn, SD_LIST_FORW));
++  gcc_assert (dbgcount + nodbgcount == sd_lists_size (insn, list));
+ 
+   return nodbgcount;
+ }
+@@ -995,7 +1010,7 @@
+     {
+       int this_priority = -1;
+ 
+-      if (dep_list_size (insn) == 0)
++      if (dep_list_size (insn, SD_LIST_FORW) == 0)
+ 	/* ??? We should set INSN_PRIORITY to insn_cost when and insn has
+ 	   some forward deps but all of them are ignored by
+ 	   contributes_to_priority hook.  At the moment we set priority of
+@@ -1091,6 +1106,22 @@
+          qsort (READY, N_READY, sizeof (rtx), rank_for_schedule); }  \
+ while (0)
+ 
++/* For each cover class CL, set DEATH[CL] to the number of registers
++   in that class that die in INSN.  */
++
++static void
++calculate_reg_deaths (rtx insn, int *death)
++{
++  int i;
++  struct reg_use_data *use;
++
++  for (i = 0; i < ira_reg_class_cover_size; i++)
++    death[ira_reg_class_cover[i]] = 0;
++  for (use = INSN_REG_USE_LIST (insn); use != NULL; use = use->next_insn_use)
++    if (dying_use_p (use))
++      mark_regno_birth_or_death (0, death, use->regno, true);
++}
++
+ /* Setup info about the current register pressure impact of scheduling
+    INSN at the current scheduling point.  */
+ static void
+@@ -1102,23 +1133,12 @@
+   enum reg_class cl;
+   struct reg_pressure_data *pressure_info;
+   int *max_reg_pressure;
+-  struct reg_use_data *use;
+   static int death[N_REG_CLASSES];
+ 
+   gcc_checking_assert (!DEBUG_INSN_P (insn));
+ 
+   excess_cost_change = 0;
+-  for (i = 0; i < ira_reg_class_cover_size; i++)
+-    death[ira_reg_class_cover[i]] = 0;
+-  for (use = INSN_REG_USE_LIST (insn); use != NULL; use = use->next_insn_use)
+-    if (dying_use_p (use))
+-      {
+-	cl = sched_regno_cover_class[use->regno];
+-	if (use->regno < FIRST_PSEUDO_REGISTER)
+-	  death[cl]++;
+-	else
+-	  death[cl] += ira_reg_class_nregs[cl][PSEUDO_REGNO_MODE (use->regno)];
+-      }
++  calculate_reg_deaths (insn, death);
+   pressure_info = INSN_REG_PRESSURE (insn);
+   max_reg_pressure = INSN_MAX_REG_PRESSURE (insn);
+   gcc_assert (pressure_info != NULL && max_reg_pressure != NULL);
+@@ -1139,7 +1159,765 @@
+     }
+   INSN_REG_PRESSURE_EXCESS_COST_CHANGE (insn) = excess_cost_change;
+ }
+-
++
++/* This is the first page of code related to SCHED_PRESSURE_MODEL.
++   It tries to make the scheduler take register pressure into account
++   without introducing too many unnecessary stalls.  It hooks into the
++   main scheduling algorithm at several points:
++
++    - Before scheduling starts, model_start_schedule constructs a
++      "model schedule" for the current block.  This model schedule is
++      chosen solely to keep register pressure down.  It does not take the
++      target's pipeline or the original instruction order into account,
++      except as a tie-breaker.  It also doesn't work to a particular
++      pressure limit.
++
++      This model schedule gives us an idea of what pressure can be
++      achieved for the block gives us an example of a schedule that
++      keeps to that pressure.  It also makes the final schedule less
++      dependent on the original instruction order.  This is important
++      because the original order can either be "wide" (many values live
++      at once, such as in user-scheduled code) or "narrow" (few values
++      live at once, such as after loop unrolling, where several
++      iterations are executed sequentially).
++
++      We do not apply this model schedule to the rtx stream.  We simply
++      record it in model_schedule.  We also compute the maximum pressure,
++      MP, that was seen during this schedule.
++
++    - Instructions are added to the ready queue even if they require
++      a stall.  The length of the stall is instead computed as:
++
++	 MAX (INSN_TICK (INSN) - clock_var, 0)
++
++      (= insn_delay).  This allows rank_for_schedule to choose between
++      introducing a deliberate stall or increasing pressure.
++
++    - Before sorting the ready queue, model_set_excess_costs assigns
++      a pressure-based cost to each ready instruction in the queue.
++      This is the instruction's INSN_REG_PRESSURE_EXCESS_COST_CHANGE
++      (ECC for short) and is effectively measured in cycles.
++
++    - rank_for_schedule ranks instructions based on:
++
++	ECC (insn) + insn_delay (insn)
++
++      then as:
++
++	insn_delay (insn)
++
++      So, for example, an instruction X1 with an ECC of 1 that can issue
++      now will win over an instruction X0 with an ECC of zero that would
++      introduce a stall of one cycle.  However, an instruction X2 with an
++      ECC of 2 that can issue now will lose to X0.
++
++    - When an instruction is scheduled, model_recompute updates the model
++      schedule with the new pressures (some of which might now exceed the
++      original maximum pressure MP).  model_update_limit_points then searches
++      for the new point of maximum pressure, if not already known.  */
++
++/* Used to separate high-verbosity debug information for SCHED_PRESSURE_MODEL
++   from surrounding debug information.  */
++#define MODEL_BAR \
++  ";;\t\t+------------------------------------------------------\n"
++
++/* Information about the pressure on a particular register class at a
++   particular point of the model schedule.  */
++struct model_pressure_data {
++  /* The pressure at this point of the model schedule, or -1 if the
++     point is associated with an instruction that has already been
++     scheduled.  */
++  int ref_pressure;
++
++  /* The maximum pressure during or after this point of the model schedule.  */
++  int max_pressure;
++};
++
++/* Per-instruction information that is used while building the model
++   schedule.  Here, "schedule" refers to the model schedule rather
++   than the main schedule.  */
++struct model_insn_info {
++  /* The instruction itself.  */
++  rtx insn;
++
++  /* If this instruction is in model_worklist, these fields link to the
++     previous (higher-priority) and next (lower-priority) instructions
++     in the list.  */
++  struct model_insn_info *prev;
++  struct model_insn_info *next;
++
++  /* While constructing the schedule, QUEUE_INDEX describes whether an
++     instruction has already been added to the schedule (QUEUE_SCHEDULED),
++     is in model_worklist (QUEUE_READY), or neither (QUEUE_NOWHERE).
++     old_queue records the value that QUEUE_INDEX had before scheduling
++     started, so that we can restore it once the schedule is complete.  */
++  int old_queue;
++
++  /* The relative importance of an unscheduled instruction.  Higher
++     values indicate greater importance.  */
++  unsigned int model_priority;
++
++  /* The length of the longest path of satisfied true dependencies
++     that leads to this instruction.  */
++  unsigned int depth;
++
++  /* The length of the longest path of dependencies of any kind
++     that leads from this instruction.  */
++  unsigned int alap;
++
++  /* The number of predecessor nodes that must still be scheduled.  */
++  int unscheduled_preds;
++};
++
++/* Information about the pressure limit for a particular register class.
++   This structure is used when applying a model schedule to the main
++   schedule.  */
++struct model_pressure_limit {
++  /* The maximum register pressure seen in the original model schedule.  */
++  int orig_pressure;
++
++  /* The maximum register pressure seen in the current model schedule
++     (which excludes instructions that have already been scheduled).  */
++  int pressure;
++
++  /* The point of the current model schedule at which PRESSURE is first
++     reached.  It is set to -1 if the value needs to be recomputed.  */
++  int point;
++};
++
++/* Describes a particular way of measuring register pressure.  */
++struct model_pressure_group {
++  /* Index CCI describes the maximum pressure on ira_reg_class_cover[CCI].  */
++  struct model_pressure_limit limits[N_REG_CLASSES];
++
++  /* Index (POINT * ira_num_pressure_classes + CCI) describes the pressure
++     on register class ira_reg_class_cover[CCI] at point POINT of the
++     current model schedule.  A POINT of model_num_insns describes the
++     pressure at the end of the schedule.  */
++  struct model_pressure_data *model;
++};
++
++/* Index POINT gives the instruction at point POINT of the model schedule.
++   This array doesn't change during main scheduling.  */
++static VEC (rtx, heap) *model_schedule;
++
++/* The list of instructions in the model worklist, sorted in order of
++   decreasing priority.  */
++static struct model_insn_info *model_worklist;
++
++/* Index I describes the instruction with INSN_LUID I.  */
++static struct model_insn_info *model_insns;
++
++/* The number of instructions in the model schedule.  */
++static int model_num_insns;
++
++/* The index of the first instruction in model_schedule that hasn't yet been
++   added to the main schedule, or model_num_insns if all of them have.  */
++static int model_curr_point;
++
++/* Describes the pressure before each instruction in the model schedule.  */
++static struct model_pressure_group model_before_pressure;
++
++/* The first unused model_priority value (as used in model_insn_info).  */
++static unsigned int model_next_priority;
++
++
++/* The model_pressure_data for ira_reg_class_cover[CCI] in GROUP
++   at point POINT of the model schedule.  */
++#define MODEL_PRESSURE_DATA(GROUP, POINT, CCI) \
++  (&(GROUP)->model[(POINT) * ira_reg_class_cover_size + (CCI)])
++
++/* The maximum pressure on ira_reg_class_cover[CCI] in GROUP at or
++   after point POINT of the model schedule.  */
++#define MODEL_MAX_PRESSURE(GROUP, POINT, CCI) \
++  (MODEL_PRESSURE_DATA (GROUP, POINT, CCI)->max_pressure)
++
++/* The pressure on ira_reg_class_cover[CCI] in GROUP at point POINT
++   of the model schedule.  */
++#define MODEL_REF_PRESSURE(GROUP, POINT, CCI) \
++  (MODEL_PRESSURE_DATA (GROUP, POINT, CCI)->ref_pressure)
++
++/* Information about INSN that is used when creating the model schedule.  */
++#define MODEL_INSN_INFO(INSN) \
++  (&model_insns[INSN_LUID (INSN)])
++
++/* The instruction at point POINT of the model schedule.  */
++#define MODEL_INSN(POINT) \
++  (VEC_index (rtx, model_schedule, POINT))
++
++
++/* Return INSN's index in the model schedule, or model_num_insns if it
++   doesn't belong to that schedule.  */
++
++static int
++model_index (rtx insn)
++{
++  if (INSN_MODEL_INDEX (insn) == 0)
++    return model_num_insns;
++  return INSN_MODEL_INDEX (insn) - 1;
++}
++
++/* Make sure that GROUP->limits is up-to-date for the current point
++   of the model schedule.  */
++
++static void
++model_update_limit_points_in_group (struct model_pressure_group *group)
++{
++  int cci, max_pressure, point;
++
++  for (cci = 0; cci < ira_reg_class_cover_size; cci++)
++    {
++      /* We may have passed the final point at which the pressure in
++	 group->limits[cci].pressure was reached.  Update the limit if so.  */
++      max_pressure = MODEL_MAX_PRESSURE (group, model_curr_point, cci);
++      group->limits[cci].pressure = max_pressure;
++
++      /* Find the point at which MAX_PRESSURE is first reached.  We need
++	 to search in three cases:
++
++	 - We've already moved past the previous pressure point.
++	   In this case we search forward from model_curr_point.
++
++	 - We scheduled the previous point of maximum pressure ahead of
++	   its position in the model schedule, but doing so didn't bring
++	   the pressure point earlier.  In this case we search forward
++	   from that previous pressure point.
++
++	 - Scheduling an instruction early caused the maximum pressure
++	   to decrease.  In this case we will have set the pressure
++	   point to -1, and we search forward from model_curr_point.  */
++      point = MAX (group->limits[cci].point, model_curr_point);
++      while (point < model_num_insns
++	     && MODEL_REF_PRESSURE (group, point, cci) < max_pressure)
++	point++;
++      group->limits[cci].point = point;
++
++      gcc_assert (MODEL_REF_PRESSURE (group, point, cci) == max_pressure);
++      gcc_assert (MODEL_MAX_PRESSURE (group, point, cci) == max_pressure);
++    }
++}
++
++/* Make sure that all register-pressure limits are up-to-date for the
++   current position in the model schedule.  */
++
++static void
++model_update_limit_points (void)
++{
++  model_update_limit_points_in_group (&model_before_pressure);
++}
++
++/* Return the model_index of the last unscheduled use in chain USE
++   outside of USE's instruction.  Return -1 if there are no other uses,
++   or model_num_insns if the register is live at the end of the block.  */
++
++static int
++model_last_use_except (struct reg_use_data *use)
++{
++  struct reg_use_data *next;
++  int last, index;
++
++  last = -1;
++  for (next = use->next_regno_use; next != use; next = next->next_regno_use)
++    if (NONDEBUG_INSN_P (next->insn)
++	&& QUEUE_INDEX (next->insn) != QUEUE_SCHEDULED)
++      {
++	index = model_index (next->insn);
++	if (index == model_num_insns)
++	  return model_num_insns;
++	if (last < index)
++	  last = index;
++      }
++  return last;
++}
++
++/* An instruction with model_index POINT has just been scheduled, and it
++   adds DELTA to the pressure on ira_reg_class_cover[CCI] after POINT - 1.
++   Update MODEL_REF_PRESSURE (GROUP, POINT, CCI) and
++   MODEL_MAX_PRESSURE (GROUP, POINT, CCI) accordingly.  */
++
++static void
++model_start_update_pressure (struct model_pressure_group *group,
++			     int point, int cci, int delta)
++{
++  int next_max_pressure;
++
++  if (point == model_num_insns)
++    {
++      /* The instruction wasn't part of the model schedule; it was moved
++	 from a different block.  Update the pressure for the end of
++	 the model schedule.  */
++      MODEL_REF_PRESSURE (group, point, cci) += delta;
++      MODEL_MAX_PRESSURE (group, point, cci) += delta;
++    }
++  else
++    {
++      /* Record that this instruction has been scheduled.  Nothing now
++	 changes between POINT and POINT + 1, so get the maximum pressure
++	 from the latter.  If the maximum pressure decreases, the new
++	 pressure point may be before POINT.  */
++      MODEL_REF_PRESSURE (group, point, cci) = -1;
++      next_max_pressure = MODEL_MAX_PRESSURE (group, point + 1, cci);
++      if (MODEL_MAX_PRESSURE (group, point, cci) > next_max_pressure)
++	{
++	  MODEL_MAX_PRESSURE (group, point, cci) = next_max_pressure;
++	  if (group->limits[cci].point == point)
++	    group->limits[cci].point = -1;
++	}
++    }
++}
++
++/* Record that scheduling a later instruction has changed the pressure
++   at point POINT of the model schedule by DELTA (which might be 0).
++   Update GROUP accordingly.  Return nonzero if these changes might
++   trigger changes to previous points as well.  */
++
++static int
++model_update_pressure (struct model_pressure_group *group,
++		       int point, int cci, int delta)
++{
++  int ref_pressure, max_pressure, next_max_pressure;
++
++  /* If POINT hasn't yet been scheduled, update its pressure.  */
++  ref_pressure = MODEL_REF_PRESSURE (group, point, cci);
++  if (ref_pressure >= 0 && delta != 0)
++    {
++      ref_pressure += delta;
++      MODEL_REF_PRESSURE (group, point, cci) = ref_pressure;
++
++      /* Check whether the maximum pressure in the overall schedule
++	 has increased.  (This means that the MODEL_MAX_PRESSURE of
++	 every point <= POINT will need to increae too; see below.)  */
++      if (group->limits[cci].pressure < ref_pressure)
++	group->limits[cci].pressure = ref_pressure;
++
++      /* If we are at maximum pressure, and the maximum pressure
++	 point was previously unknown or later than POINT,
++	 bring it forward.  */
++      if (group->limits[cci].pressure == ref_pressure
++	  && !IN_RANGE (group->limits[cci].point, 0, point))
++	group->limits[cci].point = point;
++
++      /* If POINT used to be the point of maximum pressure, but isn't
++	 any longer, we need to recalculate it using a forward walk.  */
++      if (group->limits[cci].pressure > ref_pressure
++	  && group->limits[cci].point == point)
++	group->limits[cci].point = -1;
++    }
++
++  /* Update the maximum pressure at POINT.  Changes here might also
++     affect the maximum pressure at POINT - 1.  */
++  next_max_pressure = MODEL_MAX_PRESSURE (group, point + 1, cci);
++  max_pressure = MAX (ref_pressure, next_max_pressure);
++  if (MODEL_MAX_PRESSURE (group, point, cci) != max_pressure)
++    {
++      MODEL_MAX_PRESSURE (group, point, cci) = max_pressure;
++      return 1;
++    }
++  return 0;
++}
++
++/* INSN has just been scheduled.  Update the model schedule accordingly.  */
++
++static void
++model_recompute (rtx insn)
++{
++  struct {
++    int last_use;
++    int regno;
++  } uses[FIRST_PSEUDO_REGISTER + MAX_RECOG_OPERANDS];
++  struct reg_use_data *use;
++  struct reg_pressure_data *reg_pressure;
++  int delta[N_REG_CLASSES];
++  int cci, point, mix, new_last, cl, ref_pressure, queue;
++  unsigned int i, num_uses, num_pending_births;
++  bool print_p;
++
++  /* The destinations of INSN were previously live from POINT onwards, but are
++     now live from model_curr_point onwards.  Set up DELTA accordingly.  */
++  point = model_index (insn);
++  reg_pressure = INSN_REG_PRESSURE (insn);
++  for (cci = 0; cci < ira_reg_class_cover_size; cci++)
++    {
++      cl = ira_reg_class_cover[cci];
++      delta[cl] = reg_pressure[cci].set_increase;
++    }
++
++  /* Record which registers previously died at POINT, but which now die
++     before POINT.  Adjust DELTA so that it represents the effect of
++     this change after POINT - 1.  Set NUM_PENDING_BIRTHS to the number of
++     registers that will be born in the range [model_curr_point, POINT).  */
++  num_uses = 0;
++  num_pending_births = 0;
++  for (use = INSN_REG_USE_LIST (insn); use != NULL; use = use->next_insn_use)
++    {
++      new_last = model_last_use_except (use);
++      if (new_last < point)
++	{
++	  gcc_assert (num_uses < ARRAY_SIZE (uses));
++	  uses[num_uses].last_use = new_last;
++	  uses[num_uses].regno = use->regno;
++	  /* This register is no longer live after POINT - 1.  */
++	  mark_regno_birth_or_death (NULL, delta, use->regno, false);
++	  num_uses++;
++	  if (new_last >= 0)
++	    num_pending_births++;
++	}
++    }
++
++  /* Update the MODEL_REF_PRESSURE and MODEL_MAX_PRESSURE for POINT.
++     Also set each group pressure limit for POINT.  */
++  for (cci = 0; cci < ira_reg_class_cover_size; cci++)
++    {
++      cl = ira_reg_class_cover[cci];
++      model_start_update_pressure (&model_before_pressure,
++				   point, cci, delta[cl]);
++    }
++
++  /* Walk the model schedule backwards, starting immediately before POINT.  */
++  print_p = false;
++  if (point != model_curr_point)
++    do
++      {
++	point--;
++	insn = MODEL_INSN (point);
++	queue = QUEUE_INDEX (insn);
++
++	if (queue != QUEUE_SCHEDULED)
++	  {
++	    /* DELTA describes the effect of the move on the register pressure
++	       after POINT.  Make it describe the effect on the pressure
++	       before POINT.  */
++	    i = 0;
++	    while (i < num_uses)
++	      {
++		if (uses[i].last_use == point)
++		  {
++		    /* This register is now live again.  */
++		    mark_regno_birth_or_death (NULL, delta,
++					       uses[i].regno, true);
++
++		    /* Remove this use from the array.  */
++		    uses[i] = uses[num_uses - 1];
++		    num_uses--;
++		    num_pending_births--;
++		  }
++		else
++		  i++;
++	      }
++
++	    if (sched_verbose >= 5)
++	      {
++		char buf[2048];
++
++		if (!print_p)
++		  {
++		    fprintf (sched_dump, MODEL_BAR);
++		    fprintf (sched_dump, ";;\t\t| New pressure for model"
++			     " schedule\n");
++		    fprintf (sched_dump, MODEL_BAR);
++		    print_p = true;
++		  }
++
++		print_pattern (buf, PATTERN (insn), 0);
++		fprintf (sched_dump, ";;\t\t| %3d %4d %-30s ",
++			 point, INSN_UID (insn), buf);
++		for (cci = 0; cci < ira_reg_class_cover_size; cci++)
++		  {
++		    cl = ira_reg_class_cover[cci];
++		    ref_pressure = MODEL_REF_PRESSURE (&model_before_pressure,
++						       point, cci);
++		    fprintf (sched_dump, " %s:[%d->%d]",
++			     reg_class_names[ira_reg_class_cover[cci]],
++			     ref_pressure, ref_pressure + delta[cl]);
++		  }
++		fprintf (sched_dump, "\n");
++	      }
++	  }
++
++	/* Adjust the pressure at POINT.  Set MIX to nonzero if POINT - 1
++	   might have changed as well.  */
++	mix = num_pending_births;
++	for (cci = 0; cci < ira_reg_class_cover_size; cci++)
++	  {
++	    cl = ira_reg_class_cover[cci];
++	    mix |= delta[cl];
++	    mix |= model_update_pressure (&model_before_pressure,
++					  point, cci, delta[cl]);
++	  }
++      }
++    while (mix && point > model_curr_point);
++
++  if (print_p)
++    fprintf (sched_dump, MODEL_BAR);
++}
++
++/* model_spill_cost (CL, P, P') returns the cost of increasing the
++   pressure on CL from P to P'.  We use this to calculate a "base ECC",
++   baseECC (CL, X), for each cover class CL and each instruction X.
++   Supposing X changes the pressure on CL from P to P', and that the
++   maximum pressure on CL in the current model schedule is MP', then:
++
++   * if X occurs before or at the next point of maximum pressure in
++     the model schedule and P' > MP', then:
++
++       baseECC (CL, X) = model_spill_cost (CL, MP, P')
++
++     The idea is that the pressure after scheduling a fixed set of
++     instructions -- in this case, the set up to and including the
++     next maximum pressure point -- is going to be the same regardless
++     of the order; we simply want to keep the intermediate pressure
++     under control.  Thus X has a cost of zero unless scheduling it
++     now would exceed MP'.
++
++     If all increases in the set are by the same amount, no zero-cost
++     instruction will ever cause the pressure to exceed MP'.  However,
++     if X is instead moved past an instruction X' with pressure in the
++     range (MP' - (P' - P), MP'), the pressure at X' will increase
++     beyond MP'.  Since baseECC is very much a heuristic anyway,
++     it doesn't seem worth the overhead of tracking cases like these.
++
++     The cost of exceeding MP' is always based on the original maximum
++     pressure MP.  This is so that going 2 registers over the original
++     limit has the same cost regardless of whether it comes from two
++     separate +1 deltas or from a single +2 delta.
++
++   * if X occurs after the next point of maximum pressure in the model
++     schedule and P' > P, then:
++
++       baseECC (CL, X) = model_spill_cost (CL, MP, MP' + (P' - P))
++
++     That is, if we move X forward across a point of maximum pressure,
++     and if X increases the pressure by P' - P, then we conservatively
++     assume that scheduling X next would increase the maximum pressure
++     by P' - P.  Again, the cost of doing this is based on the original
++     maximum pressure MP, for the same reason as above.
++
++   * if P' < P, P > MP, and X occurs at or after the next point of
++     maximum pressure, then:
++
++       baseECC (CL, X) = -model_spill_cost (CL, MAX (MP, P'), P)
++
++     That is, if we have already exceeded the original maximum pressure MP,
++     and if X might reduce the maximum pressure again -- or at least push
++     it further back, and thus allow more scheduling freedom -- it is given
++     a negative cost to reflect the improvement.
++
++   * otherwise,
++
++       baseECC (CL, X) = 0
++
++     In this case, X is not expected to affect the maximum pressure MP',
++     so it has zero cost.
++
++   We then create a combined value baseECC (X) that is the sum of
++   baseECC (CL, X) for each cover class CL.
++
++   baseECC (X) could itself be used as the ECC value described above.
++   However, this is often too conservative, in the sense that it
++   tends to make high-priority instructions that increase pressure
++   wait too long in cases where introducing a spill would be better.
++   For this reason the final ECC is a priority-adjusted form of
++   baseECC (X).  Specifically, we calculate:
++
++     P (X) = INSN_PRIORITY (X) - insn_delay (X) - baseECC (X)
++     baseP = MAX { P (X) | baseECC (X) <= 0 }
++
++   Then:
++
++     ECC (X) = MAX (MIN (baseP - P (X), baseECC (X)), 0)
++
++   Thus an instruction's effect on pressure is ignored if it has a high
++   enough priority relative to the ones that don't increase pressure.
++   Negative values of baseECC (X) do not increase the priority of X
++   itself, but they do make it harder for other instructions to
++   increase the pressure further.
++
++   This pressure cost is deliberately timid.  The intention has been
++   to choose a heuristic that rarely interferes with the normal list
++   scheduler in cases where that scheduler would produce good code.
++   We simply want to curb some of its worst excesses.  */
++
++/* Return the cost of increasing the pressure in class CL from FROM to TO.
++
++   Here we use the very simplistic cost model that every register above
++   ira_available_class_regs[CL] has a spill cost of 1.  We could use other
++   measures instead, such as one based on MEMORY_MOVE_COST.  However:
++
++      (1) In order for an instruction to be scheduled, the higher cost
++	  would need to be justified in a single saving of that many stalls.
++	  This is overly pessimistic, because the benefit of spilling is
++	  often to avoid a sequence of several short stalls rather than
++	  a single long one.
++
++      (2) The cost is still arbitrary.  Because we are not allocating
++	  registers during scheduling, we have no way of knowing for
++	  sure how many memory accesses will be required by each spill,
++	  where the spills will be placed within the block, or even
++	  which block(s) will contain the spills.
++
++   So a higher cost than 1 is often too conservative in practice,
++   forcing blocks to contain unnecessary stalls instead of spill code.
++   The simple cost below seems to be the best compromise.  It reduces
++   the interference with the normal list scheduler, which helps make
++   it more suitable for a default-on option.  */
++
++static int
++model_spill_cost (int cl, int from, int to)
++{
++  from = MAX (from, ira_available_class_regs[cl]);
++  return MAX (to, from) - from;
++}
++
++/* Return baseECC (ira_reg_class_cover[CCI], POINT), given that
++   P = curr_reg_pressure[ira_reg_class_cover[CCI]] and that
++   P' = P + DELTA.  */
++
++static int
++model_excess_group_cost (struct model_pressure_group *group,
++			 int point, int cci, int delta)
++{
++  int pressure, cl;
++
++  cl = ira_reg_class_cover[cci];
++  if (delta < 0 && point >= group->limits[cci].point)
++    {
++      pressure = MAX (group->limits[cci].orig_pressure,
++		      curr_reg_pressure[cl] + delta);
++      return -model_spill_cost (cl, pressure, curr_reg_pressure[cl]);
++    }
++
++  if (delta > 0)
++    {
++      if (point > group->limits[cci].point)
++	pressure = group->limits[cci].pressure + delta;
++      else
++	pressure = curr_reg_pressure[cl] + delta;
++
++      if (pressure > group->limits[cci].pressure)
++	return model_spill_cost (cl, group->limits[cci].orig_pressure,
++				 pressure);
++    }
++
++  return 0;
++}
++
++/* Return baseECC (MODEL_INSN (INSN)).  Dump the costs to sched_dump
++   if PRINT_P.  */
++
++static int
++model_excess_cost (rtx insn, bool print_p)
++{
++  int point, cci, cl, cost, this_cost, delta;
++  struct reg_pressure_data *insn_reg_pressure;
++  int insn_death[N_REG_CLASSES];
++
++  calculate_reg_deaths (insn, insn_death);
++  point = model_index (insn);
++  insn_reg_pressure = INSN_REG_PRESSURE (insn);
++  cost = 0;
++
++  if (print_p)
++    fprintf (sched_dump, ";;\t\t| %3d %4d | %4d %+3d |", point,
++	     INSN_UID (insn), INSN_PRIORITY (insn), insn_delay (insn));
++
++  /* Sum up the individual costs for each register class.  */
++  for (cci = 0; cci < ira_reg_class_cover_size; cci++)
++    {
++      cl = ira_reg_class_cover[cci];
++      delta = insn_reg_pressure[cci].set_increase - insn_death[cl];
++      this_cost = model_excess_group_cost (&model_before_pressure,
++					   point, cci, delta);
++      cost += this_cost;
++      if (print_p)
++	fprintf (sched_dump, " %s:[%d base cost %d]",
++		 reg_class_names[cl], delta, this_cost);
++    }
++
++  if (print_p)
++    fprintf (sched_dump, "\n");
++
++  return cost;
++}
++
++/* Dump the next points of maximum pressure for GROUP.  */
++
++static void
++model_dump_pressure_points (struct model_pressure_group *group)
++{
++  int cci, cl;
++
++  fprintf (sched_dump, ";;\t\t|  pressure points");
++  for (cci = 0; cci < ira_reg_class_cover_size; cci++)
++    {
++      cl = ira_reg_class_cover[cci];
++      fprintf (sched_dump, " %s:[%d->%d at ", reg_class_names[cl],
++	       curr_reg_pressure[cl], group->limits[cci].pressure);
++      if (group->limits[cci].point < model_num_insns)
++	fprintf (sched_dump, "%d:%d]", group->limits[cci].point,
++		 INSN_UID (MODEL_INSN (group->limits[cci].point)));
++      else
++	fprintf (sched_dump, "end]");
++    }
++  fprintf (sched_dump, "\n");
++}
++
++/* Set INSN_REG_PRESSURE_EXCESS_COST_CHANGE for INSNS[0...COUNT-1].  */
++
++static void
++model_set_excess_costs (rtx *insns, int count)
++{
++  int i, cost, priority_base, priority;
++  bool print_p;
++
++  /* Record the baseECC value for each instruction in the model schedule,
++     except that negative costs are converted to zero ones now rather thatn
++     later.  Do not assign a cost to debug instructions, since they must
++     not change code-generation decisions.  Experiments suggest we also
++     get better results by not assigning a cost to instructions from
++     a different block.
++
++     Set PRIORITY_BASE to baseP in the block comment above.  This is the
++     maximum priority of the "cheap" instructions, which should always
++     include the next model instruction.  */
++  priority_base = 0;
++  print_p = false;
++  for (i = 0; i < count; i++)
++    if (INSN_MODEL_INDEX (insns[i]))
++      {
++	if (sched_verbose >= 6 && !print_p)
++	  {
++	    fprintf (sched_dump, MODEL_BAR);
++	    fprintf (sched_dump, ";;\t\t| Pressure costs for ready queue\n");
++	    model_dump_pressure_points (&model_before_pressure);
++	    fprintf (sched_dump, MODEL_BAR);
++	    print_p = true;
++	  }
++	cost = model_excess_cost (insns[i], print_p);
++	if (cost <= 0)
++	  {
++	    priority = INSN_PRIORITY (insns[i]) - insn_delay (insns[i]) - cost;
++	    priority_base = MAX (priority_base, priority);
++	    cost = 0;
++	  }
++	INSN_REG_PRESSURE_EXCESS_COST_CHANGE (insns[i]) = cost;
++      }
++  if (print_p)
++    fprintf (sched_dump, MODEL_BAR);
++
++  /* Use MAX (baseECC, 0) and baseP to calculcate ECC for each
++     instruction.  */
++  for (i = 0; i < count; i++)
++    {
++      cost = INSN_REG_PRESSURE_EXCESS_COST_CHANGE (insns[i]);
++      priority = INSN_PRIORITY (insns[i]) - insn_delay (insns[i]);
++      if (cost > 0 && priority > priority_base)
++	{
++	  cost += priority_base - priority;
++	  INSN_REG_PRESSURE_EXCESS_COST_CHANGE (insns[i]) = MAX (cost, 0);
++	}
++    }
++}
++
+ /* Returns a positive value if x is preferred; returns a negative value if
+    y is preferred.  Should never return 0, since that will make the sort
+    unstable.  */
+@@ -1170,23 +1948,20 @@
+   /* Make sure that priority of TMP and TMP2 are initialized.  */
+   gcc_assert (INSN_PRIORITY_KNOWN (tmp) && INSN_PRIORITY_KNOWN (tmp2));
+ 
+-  if (sched_pressure_p)
++  if (sched_pressure != SCHED_PRESSURE_NONE)
+     {
+       int diff;
+ 
+       /* Prefer insn whose scheduling results in the smallest register
+ 	 pressure excess.  */
+       if ((diff = (INSN_REG_PRESSURE_EXCESS_COST_CHANGE (tmp)
+-		   + (INSN_TICK (tmp) > clock_var
+-		      ? INSN_TICK (tmp) - clock_var : 0)
++		   + insn_delay (tmp)
+ 		   - INSN_REG_PRESSURE_EXCESS_COST_CHANGE (tmp2)
+-		   - (INSN_TICK (tmp2) > clock_var
+-		      ? INSN_TICK (tmp2) - clock_var : 0))) != 0)
++		   - insn_delay (tmp2))))
+ 	return diff;
+     }
+ 
+-
+-  if (sched_pressure_p
++  if (sched_pressure != SCHED_PRESSURE_NONE
+       && (INSN_TICK (tmp2) > clock_var || INSN_TICK (tmp) > clock_var))
+     {
+       if (INSN_TICK (tmp) <= clock_var)
+@@ -1277,11 +2052,22 @@
+ 	return val;
+     }
+ 
++  /* Prefer instructions that occur earlier in the model schedule.  */
++  if (sched_pressure == SCHED_PRESSURE_MODEL)
++    {
++      int diff;
++
++      diff = model_index (tmp) - model_index (tmp2);
++      if (diff != 0)
++	return diff;
++    }
++
+   /* Prefer the insn which has more later insns that depend on it.
+      This gives the scheduler more freedom when scheduling later
+      instructions at the expense of added register pressure.  */
+ 
+-  val = (dep_list_size (tmp2) - dep_list_size (tmp));
++  val = (dep_list_size (tmp2, SD_LIST_FORW)
++	 - dep_list_size (tmp, SD_LIST_FORW));
+ 
+   if (flag_sched_dep_count_heuristic && val != 0)
+     return val;
+@@ -1480,12 +2266,15 @@
+   int i;
+   rtx *first = ready_lastpos (ready);
+ 
+-  if (sched_pressure_p)
++  if (sched_pressure == SCHED_PRESSURE_WEIGHTED)
+     {
+       for (i = 0; i < ready->n_ready; i++)
+ 	if (!DEBUG_INSN_P (first[i]))
+ 	  setup_insn_reg_pressure_info (first[i]);
+     }
++  if (sched_pressure == SCHED_PRESSURE_MODEL
++      && model_curr_point < model_num_insns)
++    model_set_excess_costs (first, ready->n_ready);
+   SCHED_SORT (first, ready->n_ready);
+ }
+ 
+@@ -1551,10 +2340,12 @@
+   gcc_checking_assert (!DEBUG_INSN_P (insn));
+ 
+   for (use = INSN_REG_USE_LIST (insn); use != NULL; use = use->next_insn_use)
+-    if (dying_use_p (use) && bitmap_bit_p (curr_reg_live, use->regno))
+-      mark_regno_birth_or_death (use->regno, false);
++    if (dying_use_p (use))
++      mark_regno_birth_or_death (curr_reg_live, curr_reg_pressure,
++				 use->regno, false);
+   for (set = INSN_REG_SET_LIST (insn); set != NULL; set = set->next_insn_set)
+-    mark_regno_birth_or_death (set->regno, true);
++    mark_regno_birth_or_death (curr_reg_live, curr_reg_pressure,
++			       set->regno, true);
+ }
+ 
+ /* Set up or update (if UPDATE_P) max register pressure (see its
+@@ -1626,11 +2417,618 @@
+ void
+ sched_setup_bb_reg_pressure_info (basic_block bb, rtx after)
+ {
+-  gcc_assert (sched_pressure_p);
++  gcc_assert (sched_pressure == SCHED_PRESSURE_WEIGHTED);
+   initiate_bb_reg_pressure_info (bb);
+   setup_insn_max_reg_pressure (after, false);
+ }
+-
++
++/* Return (in order):
++
++   - positive if INSN adversely affects the pressure on one
++     register class
++
++   - negative if INSN reduces the pressure on one register class
++
++   - 0 if INSN doesn't affect the pressure on any register class.  */
++
++static int
++model_classify_pressure (struct model_insn_info *insn)
++{
++  struct reg_pressure_data *reg_pressure;
++  int death[N_REG_CLASSES];
++  int cci, cl, sum;
++
++  calculate_reg_deaths (insn->insn, death);
++  reg_pressure = INSN_REG_PRESSURE (insn->insn);
++  sum = 0;
++  for (cci = 0; cci < ira_reg_class_cover_size; cci++)
++    {
++      cl = ira_reg_class_cover[cci];
++      if (death[cl] < reg_pressure[cci].set_increase)
++	return 1;
++      sum += reg_pressure[cci].set_increase - death[cl];
++    }
++  return sum;
++}
++
++/* Return true if INSN1 should come before INSN2 in the model schedule.  */
++
++static int
++model_order_p (struct model_insn_info *insn1, struct model_insn_info *insn2)
++{
++  unsigned int height1, height2;
++  unsigned int priority1, priority2;
++
++  /* Prefer instructions with a higher model priority.  */
++  if (insn1->model_priority != insn2->model_priority)
++    return insn1->model_priority > insn2->model_priority;
++
++  /* Combine the length of the longest path of satisfied true dependencies
++     that leads to each instruction (depth) with the length of the longest
++     path of any dependencies that leads from the instruction (alap).
++     Prefer instructions with the greatest combined length.  If the combined
++     lengths are equal, prefer instructions with the greatest depth.
++
++     The idea is that, if we have a set S of "equal" instructions that each
++     have ALAP value X, and we pick one such instruction I, any true-dependent
++     successors of I that have ALAP value X - 1 should be preferred over S.
++     This encourages the schedule to be "narrow" rather than "wide".
++     However, if I is a low-priority instruction that we decided to
++     schedule because of its model_classify_pressure, and if there
++     is a set of higher-priority instructions T, the aforementioned
++     successors of I should not have the edge over T.  */
++  height1 = insn1->depth + insn1->alap;
++  height2 = insn2->depth + insn2->alap;
++  if (height1 != height2)
++    return height1 > height2;
++  if (insn1->depth != insn2->depth)
++    return insn1->depth > insn2->depth;
++
++  /* We have no real preference between INSN1 an INSN2 as far as attempts
++     to reduce pressure go.  Prefer instructions with higher priorities.  */
++  priority1 = INSN_PRIORITY (insn1->insn);
++  priority2 = INSN_PRIORITY (insn2->insn);
++  if (priority1 != priority2)
++    return priority1 > priority2;
++
++  /* Use the original rtl sequence as a tie-breaker.  */
++  return insn1 < insn2;
++}
++
++/* Add INSN to the model worklist immediately after PREV.  Add it to the
++   beginning of the list if PREV is null.  */
++
++static void
++model_add_to_worklist_at (struct model_insn_info *insn,
++			  struct model_insn_info *prev)
++{
++  gcc_assert (QUEUE_INDEX (insn->insn) == QUEUE_NOWHERE);
++  QUEUE_INDEX (insn->insn) = QUEUE_READY;
++
++  insn->prev = prev;
++  if (prev)
++    {
++      insn->next = prev->next;
++      prev->next = insn;
++    }
++  else
++    {
++      insn->next = model_worklist;
++      model_worklist = insn;
++    }
++  if (insn->next)
++    insn->next->prev = insn;
++}
++
++/* Remove INSN from the model worklist.  */
++
++static void
++model_remove_from_worklist (struct model_insn_info *insn)
++{
++  gcc_assert (QUEUE_INDEX (insn->insn) == QUEUE_READY);
++  QUEUE_INDEX (insn->insn) = QUEUE_NOWHERE;
++
++  if (insn->prev)
++    insn->prev->next = insn->next;
++  else
++    model_worklist = insn->next;
++  if (insn->next)
++    insn->next->prev = insn->prev;
++}
++
++/* Add INSN to the model worklist.  Start looking for a suitable position
++   between neighbors PREV and NEXT, testing at most MAX_SCHED_READY_INSNS
++   insns either side.  A null PREV indicates the beginning of the list and
++   a null NEXT indicates the end.  */
++
++static void
++model_add_to_worklist (struct model_insn_info *insn,
++		       struct model_insn_info *prev,
++		       struct model_insn_info *next)
++{
++  int count;
++
++  count = MAX_SCHED_READY_INSNS;
++  if (count > 0 && prev && model_order_p (insn, prev))
++    do
++      {
++	count--;
++	prev = prev->prev;
++      }
++    while (count > 0 && prev && model_order_p (insn, prev));
++  else
++    while (count > 0 && next && model_order_p (next, insn))
++      {
++	count--;
++	prev = next;
++	next = next->next;
++      }
++  model_add_to_worklist_at (insn, prev);
++}
++
++/* INSN may now have a higher priority (in the model_order_p sense)
++   than before.  Move it up the worklist if necessary.  */
++
++static void
++model_promote_insn (struct model_insn_info *insn)
++{
++  struct model_insn_info *prev;
++  int count;
++
++  prev = insn->prev;
++  count = MAX_SCHED_READY_INSNS;
++  while (count > 0 && prev && model_order_p (insn, prev))
++    {
++      count--;
++      prev = prev->prev;
++    }
++  if (prev != insn->prev)
++    {
++      model_remove_from_worklist (insn);
++      model_add_to_worklist_at (insn, prev);
++    }
++}
++
++/* Add INSN to the end of the model schedule.  */
++
++static void
++model_add_to_schedule (rtx insn)
++{
++  unsigned int point;
++
++  gcc_assert (QUEUE_INDEX (insn) == QUEUE_NOWHERE);
++  QUEUE_INDEX (insn) = QUEUE_SCHEDULED;
++
++  point = VEC_length (rtx, model_schedule);
++  VEC_quick_push (rtx, model_schedule, insn);
++  INSN_MODEL_INDEX (insn) = point + 1;
++}
++
++/* Analyze the instructions that are to be scheduled, setting up
++   MODEL_INSN_INFO (...) and model_num_insns accordingly.  Add ready
++   instructions to model_worklist.  */
++
++static void
++model_analyze_insns (void)
++{
++  rtx start, end, iter;
++  sd_iterator_def sd_it;
++  dep_t dep;
++  struct model_insn_info *insn, *con;
++
++  model_num_insns = 0;
++  start = PREV_INSN (current_sched_info->next_tail);
++  end = current_sched_info->prev_head;
++  for (iter = start; iter != end; iter = PREV_INSN (iter))
++    if (NONDEBUG_INSN_P (iter))
++      {
++	insn = MODEL_INSN_INFO (iter);
++	insn->insn = iter;
++	FOR_EACH_DEP (iter, SD_LIST_FORW, sd_it, dep)
++	  {
++	    con = MODEL_INSN_INFO (DEP_CON (dep));
++	    if (con->insn && insn->alap < con->alap + 1)
++	      insn->alap = con->alap + 1;
++	  }
++
++	insn->old_queue = QUEUE_INDEX (iter);
++	QUEUE_INDEX (iter) = QUEUE_NOWHERE;
++
++	insn->unscheduled_preds = dep_list_size (iter, SD_LIST_HARD_BACK);
++	if (insn->unscheduled_preds == 0)
++	  model_add_to_worklist (insn, NULL, model_worklist);
++
++	model_num_insns++;
++      }
++}
++
++/* The global state describes the register pressure at the start of the
++   model schedule.  Initialize GROUP accordingly.  */
++
++static void
++model_init_pressure_group (struct model_pressure_group *group)
++{
++  int cci, cl;
++
++  for (cci = 0; cci < ira_reg_class_cover_size; cci++)
++    {
++      cl = ira_reg_class_cover[cci];
++      group->limits[cci].pressure = curr_reg_pressure[cl];
++      group->limits[cci].point = 0;
++    }
++  /* Use index model_num_insns to record the state after the last
++     instruction in the model schedule.  */
++  group->model = XNEWVEC (struct model_pressure_data,
++			  (model_num_insns + 1) * ira_reg_class_cover_size);
++}
++
++/* Record that MODEL_REF_PRESSURE (GROUP, POINT, CCI) is PRESSURE.
++   Update the maximum pressure for the whole schedule.  */
++
++static void
++model_record_pressure (struct model_pressure_group *group,
++		       int point, int cci, int pressure)
++{
++  MODEL_REF_PRESSURE (group, point, cci) = pressure;
++  if (group->limits[cci].pressure < pressure)
++    {
++      group->limits[cci].pressure = pressure;
++      group->limits[cci].point = point;
++    }
++}
++
++/* INSN has just been added to the end of the model schedule.  Record its
++   register-pressure information.  */
++
++static void
++model_record_pressures (struct model_insn_info *insn)
++{
++  struct reg_pressure_data *reg_pressure;
++  int point, cci, cl, delta;
++  int death[N_REG_CLASSES];
++
++  point = model_index (insn->insn);
++  if (sched_verbose >= 2)
++    {
++      char buf[2048];
++
++      if (point == 0)
++	{
++	  fprintf (sched_dump, "\n;;\tModel schedule:\n;;\n");
++	  fprintf (sched_dump, ";;\t| idx insn | mpri hght dpth prio |\n");
++	}
++      print_pattern (buf, PATTERN (insn->insn), 0);
++      fprintf (sched_dump, ";;\t| %3d %4d | %4d %4d %4d %4d | %-30s ",
++	       point, INSN_UID (insn->insn), insn->model_priority,
++	       insn->depth + insn->alap, insn->depth,
++	       INSN_PRIORITY (insn->insn), buf);
++    }
++  calculate_reg_deaths (insn->insn, death);
++  reg_pressure = INSN_REG_PRESSURE (insn->insn);
++  for (cci = 0; cci < ira_reg_class_cover_size; cci++)
++    {
++      cl = ira_reg_class_cover[cci];
++      delta = reg_pressure[cci].set_increase - death[cl];
++      if (sched_verbose >= 2)
++	fprintf (sched_dump, " %s:[%d,%+d]", reg_class_names[cl],
++		 curr_reg_pressure[cl], delta);
++      model_record_pressure (&model_before_pressure, point, cci,
++			     curr_reg_pressure[cl]);
++    }
++  if (sched_verbose >= 2)
++    fprintf (sched_dump, "\n");
++}
++
++/* All instructions have been added to the model schedule.  Record the
++   final register pressure in GROUP and set up all MODEL_MAX_PRESSUREs.  */
++
++static void
++model_record_final_pressures (struct model_pressure_group *group)
++{
++  int point, cci, max_pressure, ref_pressure, cl;
++
++  for (cci = 0; cci < ira_reg_class_cover_size; cci++)
++    {
++      /* Record the final pressure for this class.  */
++      cl = ira_reg_class_cover[cci];
++      point = model_num_insns;
++      ref_pressure = curr_reg_pressure[cl];
++      model_record_pressure (group, point, cci, ref_pressure);
++
++      /* Record the original maximum pressure.  */
++      group->limits[cci].orig_pressure = group->limits[cci].pressure;
++
++      /* Update the MODEL_MAX_PRESSURE for every point of the schedule.  */
++      max_pressure = ref_pressure;
++      MODEL_MAX_PRESSURE (group, point, cci) = max_pressure;
++      while (point > 0)
++	{
++	  point--;
++	  ref_pressure = MODEL_REF_PRESSURE (group, point, cci);
++	  max_pressure = MAX (max_pressure, ref_pressure);
++	  MODEL_MAX_PRESSURE (group, point, cci) = max_pressure;
++	}
++    }
++}
++
++/* Update all successors of INSN, given that INSN has just been scheduled.  */
++
++static void
++model_add_successors_to_worklist (struct model_insn_info *insn)
++{
++  sd_iterator_def sd_it;
++  struct model_insn_info *con;
++  dep_t dep;
++
++  FOR_EACH_DEP (insn->insn, SD_LIST_FORW, sd_it, dep)
++    {
++      con = MODEL_INSN_INFO (DEP_CON (dep));
++      /* Ignore debug instructions, and instructions from other blocks.  */
++      if (con->insn)
++	{
++	  con->unscheduled_preds--;
++
++	  /* Update the depth field of each true-dependent successor.
++	     Increasing the depth gives them a higher priority than
++	     before.  */
++	  if (DEP_TYPE (dep) == REG_DEP_TRUE && con->depth < insn->depth + 1)
++	    {
++	      con->depth = insn->depth + 1;
++	      if (QUEUE_INDEX (con->insn) == QUEUE_READY)
++		model_promote_insn (con);
++	    }
++
++	  /* If this is a true dependency, or if there are no remaining
++	     dependencies for CON (meaning that CON only had non-true
++	     dependencies), make sure that CON is on the worklist.
++	     We don't bother otherwise because it would tend to fill the
++	     worklist with a lot of low-priority instructions that are not
++	     yet ready to issue.  */
++	  if ((con->depth > 0 || con->unscheduled_preds == 0)
++	      && QUEUE_INDEX (con->insn) == QUEUE_NOWHERE)
++	    model_add_to_worklist (con, insn, insn->next);
++	}
++    }
++}
++
++/* Give INSN a higher priority than any current instruction, then give
++   unscheduled predecessors of INSN a higher priority still.  If any of
++   those predecessors are not on the model worklist, do the same for its
++   predecessors, and so on.  */
++
++static void
++model_promote_predecessors (struct model_insn_info *insn)
++{
++  struct model_insn_info *pro, *first;
++  sd_iterator_def sd_it;
++  dep_t dep;
++
++  if (sched_verbose >= 7)
++    fprintf (sched_dump, ";;\t+--- priority of %d = %d, priority of",
++	     INSN_UID (insn->insn), model_next_priority);
++  insn->model_priority = model_next_priority++;
++  model_remove_from_worklist (insn);
++  model_add_to_worklist_at (insn, NULL);
++
++  first = NULL;
++  for (;;)
++    {
++      FOR_EACH_DEP (insn->insn, SD_LIST_HARD_BACK, sd_it, dep)
++	{
++	  pro = MODEL_INSN_INFO (DEP_PRO (dep));
++	  /* The first test is to ignore debug instructions, and instructions
++	     from other blocks.  */
++	  if (pro->insn
++	      && pro->model_priority != model_next_priority
++	      && QUEUE_INDEX (pro->insn) != QUEUE_SCHEDULED)
++	    {
++	      pro->model_priority = model_next_priority;
++	      if (sched_verbose >= 7)
++		fprintf (sched_dump, " %d", INSN_UID (pro->insn));
++	      if (QUEUE_INDEX (pro->insn) == QUEUE_READY)
++		{
++		  /* PRO is already in the worklist, but it now has
++		     a higher priority than before.  Move it at the
++		     appropriate place.  */
++		  model_remove_from_worklist (pro);
++		  model_add_to_worklist (pro, NULL, model_worklist);
++		}
++	      else
++		{
++		  /* PRO isn't in the worklist.  Recursively process
++		     its predecessors until we find one that is.  */
++		  pro->next = first;
++		  first = pro;
++		}
++	    }
++	}
++      if (!first)
++	break;
++      insn = first;
++      first = insn->next;
++    }
++  if (sched_verbose >= 7)
++    fprintf (sched_dump, " = %d\n", model_next_priority);
++  model_next_priority++;
++}
++
++/* Pick one instruction from model_worklist and process it.  */
++
++static void
++model_choose_insn (void)
++{
++  struct model_insn_info *insn, *fallback;
++  int count;
++
++  if (sched_verbose >= 7)
++    {
++      fprintf (sched_dump, ";;\t+--- worklist:\n");
++      insn = model_worklist;
++      count = MAX_SCHED_READY_INSNS;
++      while (count > 0 && insn)
++	{
++	  fprintf (sched_dump, ";;\t+---   %d [%d, %d, %d, %d]\n",
++		   INSN_UID (insn->insn), insn->model_priority,
++		   insn->depth + insn->alap, insn->depth,
++		   INSN_PRIORITY (insn->insn));
++	  count--;
++	  insn = insn->next;
++	}
++    }
++
++  /* Look for a ready instruction whose model_classify_priority is zero
++     or negative, picking the highest-priority one.  Adding such an
++     instruction to the schedule now should do no harm, and may actually
++     do some good.
++
++     Failing that, see whether there is an instruction with the highest
++     extant model_priority that is not yet ready, but which would reduce
++     pressure if it became ready.  This is designed to catch cases like:
++
++       (set (mem (reg R1)) (reg R2))
++
++     where the instruction is the last remaining use of R1 and where the
++     value of R2 is not yet available (or vice versa).  The death of R1
++     means that this instruction already reduces pressure.  It is of
++     course possible that the computation of R2 involves other registers
++     that are hard to kill, but such cases are rare enough for this
++     heuristic to be a win in general.
++
++     Failing that, just pick the highest-priority instruction in the
++     worklist.  */
++  count = MAX_SCHED_READY_INSNS;
++  insn = model_worklist;
++  fallback = 0;
++  for (;;)
++    {
++      if (count == 0 || !insn)
++	{
++	  insn = fallback ? fallback : model_worklist;
++	  break;
++	}
++      if (insn->unscheduled_preds)
++	{
++	  if (model_worklist->model_priority == insn->model_priority
++	      && !fallback
++	      && model_classify_pressure (insn) < 0)
++	    fallback = insn;
++	}
++      else
++	{
++	  if (model_classify_pressure (insn) <= 0)
++	    break;
++	}
++      count--;
++      insn = insn->next;
++    }
++
++  if (sched_verbose >= 7 && insn != model_worklist)
++    {
++      if (insn->unscheduled_preds)
++	fprintf (sched_dump, ";;\t+--- promoting insn %d, with dependencies\n",
++		 INSN_UID (insn->insn));
++      else
++	fprintf (sched_dump, ";;\t+--- promoting insn %d, which is ready\n",
++		 INSN_UID (insn->insn));
++    }
++  if (insn->unscheduled_preds)
++    /* INSN isn't yet ready to issue.  Give all its predecessors the
++       highest priority.  */
++    model_promote_predecessors (insn);
++  else
++    {
++      /* INSN is ready.  Add it to the end of model_schedule and
++	 process its successors.  */
++      model_add_successors_to_worklist (insn);
++      model_remove_from_worklist (insn);
++      model_add_to_schedule (insn->insn);
++      model_record_pressures (insn);
++      update_register_pressure (insn->insn);
++    }
++}
++
++/* Restore all QUEUE_INDEXs to the values that they had before
++   model_start_schedule was called.  */
++
++static void
++model_reset_queue_indices (void)
++{
++  unsigned int i;
++  rtx insn;
++
++  FOR_EACH_VEC_ELT (rtx, model_schedule, i, insn)
++    QUEUE_INDEX (insn) = MODEL_INSN_INFO (insn)->old_queue;
++}
++
++/* We have calculated the model schedule and spill costs.  Print a summary
++   to sched_dump.  */
++
++static void
++model_dump_pressure_summary (void)
++{
++  int cci, cl;
++
++  fprintf (sched_dump, ";; Pressure summary:");
++  for (cci = 0; cci < ira_reg_class_cover_size; cci++)
++    {
++      cl = ira_reg_class_cover[cci];
++      fprintf (sched_dump, " %s:%d", reg_class_names[cl],
++	       model_before_pressure.limits[cci].pressure);
++    }
++  fprintf (sched_dump, "\n\n");
++}
++
++/* Initialize the SCHED_PRESSURE_MODEL information for the current
++   scheduling region.  */
++
++static void
++model_start_schedule (void)
++{
++  basic_block bb;
++
++  model_next_priority = 1;
++  model_schedule = VEC_alloc (rtx, heap, sched_max_luid);
++  model_insns = XCNEWVEC (struct model_insn_info, sched_max_luid);
++
++  bb = BLOCK_FOR_INSN (NEXT_INSN (current_sched_info->prev_head));
++  initiate_reg_pressure_info (df_get_live_in (bb));
++
++  model_analyze_insns ();
++  model_init_pressure_group (&model_before_pressure);
++  while (model_worklist)
++    model_choose_insn ();
++  gcc_assert (model_num_insns == (int) VEC_length (rtx, model_schedule));
++  if (sched_verbose >= 2)
++    fprintf (sched_dump, "\n");
++
++  model_record_final_pressures (&model_before_pressure);
++  model_reset_queue_indices ();
++
++  XDELETEVEC (model_insns);
++
++  model_curr_point = 0;
++  initiate_reg_pressure_info (df_get_live_in (bb));
++  if (sched_verbose >= 1)
++    model_dump_pressure_summary ();
++}
++
++/* Free the information associated with GROUP.  */
++
++static void
++model_finalize_pressure_group (struct model_pressure_group *group)
++{
++  XDELETEVEC (group->model);
++}
++
++/* Free the information created by model_start_schedule.  */
++
++static void
++model_end_schedule (void)
++{
++  model_finalize_pressure_group (&model_before_pressure);
++  VEC_free (rtx, heap, model_schedule);
++}
++
+ /* INSN is the "currently executing insn".  Launch each insn which was
+    waiting on INSN.  READY is the ready list which contains the insns
+    that are ready to fire.  CLOCK is the current cycle.  The function
+@@ -1667,10 +3065,14 @@
+ 		     reg_class_names[ira_reg_class_cover[i]],
+ 		     pressure_info[i].set_increase, pressure_info[i].change);
+ 	}
++      if (sched_pressure == SCHED_PRESSURE_MODEL
++	  && model_curr_point < model_num_insns
++	  && model_index (insn) == model_curr_point)
++	fprintf (sched_dump, ":model %d", model_curr_point);
+       fputc ('\n', sched_dump);
+     }
+ 
+-  if (sched_pressure_p && !DEBUG_INSN_P (insn))
++  if (sched_pressure == SCHED_PRESSURE_WEIGHTED && !DEBUG_INSN_P (insn))
+     update_reg_and_insn_max_reg_pressure (insn);
+ 
+   /* Scheduling instruction should have all its dependencies resolved and
+@@ -1728,6 +3130,24 @@
+   gcc_assert (QUEUE_INDEX (insn) == QUEUE_NOWHERE);
+   QUEUE_INDEX (insn) = QUEUE_SCHEDULED;
+ 
++  if (sched_pressure == SCHED_PRESSURE_MODEL
++      && model_curr_point < model_num_insns
++      && NONDEBUG_INSN_P (insn))
++    {
++      if (model_index (insn) == model_curr_point)
++	do
++	  model_curr_point++;
++	while (model_curr_point < model_num_insns
++	       && (QUEUE_INDEX (MODEL_INSN (model_curr_point))
++		   == QUEUE_SCHEDULED));
++      else
++	model_recompute (insn);
++      model_update_limit_points ();
++      update_register_pressure (insn);
++      if (sched_verbose >= 2)
++	print_curr_reg_pressure ();
++    }
++
+   gcc_assert (INSN_TICK (insn) >= MIN_TICK);
+   if (INSN_TICK (insn) > clock_var)
+     /* INSN has been prematurely moved from the queue to the ready list.
+@@ -2056,7 +3476,16 @@
+       /* If the ready list is full, delay the insn for 1 cycle.
+ 	 See the comment in schedule_block for the rationale.  */
+       if (!reload_completed
+-	  && ready->n_ready - ready->n_debug > MAX_SCHED_READY_INSNS
++	  && (ready->n_ready - ready->n_debug > MAX_SCHED_READY_INSNS
++	      || (sched_pressure == SCHED_PRESSURE_MODEL
++		  /* Limit pressure recalculations to MAX_SCHED_READY_INSNS
++		     instructions too.  */
++		  && model_index (insn) > (model_curr_point
++					   + MAX_SCHED_READY_INSNS)))
++	  && !(sched_pressure == SCHED_PRESSURE_MODEL
++	       && model_curr_point < model_num_insns
++	       /* Always allow the next model instruction to issue.  */
++	       && model_index (insn) == model_curr_point)
+ 	  && !SCHED_GROUP_P (insn)
+ 	  && insn != skip_insn)
+ 	{
+@@ -2293,12 +3722,12 @@
+       fprintf (sched_dump, "  %s:%d",
+ 	       (*current_sched_info->print_insn) (p[i], 0),
+ 	       INSN_LUID (p[i]));
+-      if (sched_pressure_p)
++      if (sched_pressure != SCHED_PRESSURE_NONE)
+ 	fprintf (sched_dump, "(cost=%d",
+ 		 INSN_REG_PRESSURE_EXCESS_COST_CHANGE (p[i]));
+       if (INSN_TICK (p[i]) > clock_var)
+ 	fprintf (sched_dump, ":delay=%d", INSN_TICK (p[i]) - clock_var);
+-      if (sched_pressure_p)
++      if (sched_pressure != SCHED_PRESSURE_NONE)
+ 	fprintf (sched_dump, ")");
+     }
+   fprintf (sched_dump, "\n");
+@@ -2609,8 +4038,8 @@
+ 	    {
+ 	      if (state_dead_lock_p (state)
+ 		  || insn_finishes_cycle_p (insn))
+- 		/* We won't issue any more instructions in the next
+- 		   choice_state.  */
++		/* We won't issue any more instructions in the next
++		   choice_state.  */
+ 		top->rest = 0;
+ 	      else
+ 		top->rest--;
+@@ -2813,6 +4242,59 @@
+     }
+ }
+ 
++/* Examine all insns on the ready list and queue those which can't be
++   issued in this cycle.  TEMP_STATE is temporary scheduler state we
++   can use as scratch space.  If FIRST_CYCLE_INSN_P is true, no insns
++   have been issued for the current cycle, which means it is valid to
++   issue an asm statement.  */
++
++static void
++prune_ready_list (state_t temp_state, bool first_cycle_insn_p)
++{
++  int i;
++
++ restart:
++  for (i = 0; i < ready.n_ready; i++)
++    {
++      rtx insn = ready_element (&ready, i);
++      int cost = 0;
++
++      if (recog_memoized (insn) < 0)
++	{
++	  if (!first_cycle_insn_p
++	      && (GET_CODE (PATTERN (insn)) == ASM_INPUT
++		  || asm_noperands (PATTERN (insn)) >= 0))
++	    cost = 1;
++	}
++      else if (sched_pressure != SCHED_PRESSURE_NONE)
++	{
++	  if (sched_pressure == SCHED_PRESSURE_MODEL
++	      && INSN_TICK (insn) <= clock_var)
++	    {
++	      memcpy (temp_state, curr_state, dfa_state_size);
++	      if (state_transition (temp_state, insn) >= 0)
++		INSN_TICK (insn) = clock_var + 1;
++	    }
++	  cost = 0;
++	}
++      else
++	{
++	  memcpy (temp_state, curr_state, dfa_state_size);
++	  cost = state_transition (temp_state, insn);
++	  if (cost < 0)
++	    cost = 0;
++	  else if (cost == 0)
++	    cost = 1;
++	}
++      if (cost >= 1)
++	{
++	  ready_remove (&ready, i);
++	  queue_insn (insn, cost);
++	  goto restart;
++	}
++    }
++}
++
+ /* Use forward list scheduling to rearrange insns of block pointed to by
+    TARGET_BB, possibly bringing insns from subsequent blocks in the same
+    region.  */
+@@ -2882,6 +4364,9 @@
+      in try_ready () (which is called through init_ready_list ()).  */
+   (*current_sched_info->init_ready_list) ();
+ 
++  if (sched_pressure == SCHED_PRESSURE_MODEL)
++    model_start_schedule ();
++
+   /* The algorithm is O(n^2) in the number of ready insns at any given
+      time in the worst case.  Before reload we are more likely to have
+      big lists so truncate them to a reasonable size.  */
+@@ -2963,6 +4448,10 @@
+ 	}
+       while (advance > 0);
+ 
++      prune_ready_list (temp_state, true);
++      if (ready.n_ready == 0)
++        continue;
++
+       if (sort_p)
+ 	{
+ 	  /* Sort the ready list based on priority.  */
+@@ -3040,7 +4529,7 @@
+ 	      fprintf (sched_dump, ";;\tReady list (t = %3d):  ",
+ 		       clock_var);
+ 	      debug_ready_list (&ready);
+-	      if (sched_pressure_p)
++	      if (sched_pressure == SCHED_PRESSURE_WEIGHTED)
+ 		print_curr_reg_pressure ();
+ 	    }
+ 
+@@ -3084,7 +4573,8 @@
+ 	  else
+ 	    insn = ready_remove_first (&ready);
+ 
+-	  if (sched_pressure_p && INSN_TICK (insn) > clock_var)
++	  if (sched_pressure != SCHED_PRESSURE_NONE
++	      && INSN_TICK (insn) > clock_var)
+ 	    {
+ 	      ready_add (&ready, insn, true);
+ 	      advance = 1;
+@@ -3112,44 +4602,6 @@
+ 	    }
+ 
+ 	  sort_p = TRUE;
+-	  memcpy (temp_state, curr_state, dfa_state_size);
+-	  if (recog_memoized (insn) < 0)
+-	    {
+-	      asm_p = (GET_CODE (PATTERN (insn)) == ASM_INPUT
+-		       || asm_noperands (PATTERN (insn)) >= 0);
+-	      if (!first_cycle_insn_p && asm_p)
+-		/* This is asm insn which is tried to be issued on the
+-		   cycle not first.  Issue it on the next cycle.  */
+-		cost = 1;
+-	      else
+-		/* A USE insn, or something else we don't need to
+-		   understand.  We can't pass these directly to
+-		   state_transition because it will trigger a
+-		   fatal error for unrecognizable insns.  */
+-		cost = 0;
+-	    }
+-	  else if (sched_pressure_p)
+-	    cost = 0;
+-	  else
+-	    {
+-	      cost = state_transition (temp_state, insn);
+-	      if (cost < 0)
+-		cost = 0;
+-	      else if (cost == 0)
+-		cost = 1;
+-	    }
+-
+-	  if (cost >= 1)
+-	    {
+-	      queue_insn (insn, cost);
+- 	      if (SCHED_GROUP_P (insn))
+- 		{
+- 		  advance = cost;
+- 		  break;
+- 		}
+-
+-	      continue;
+-	    }
+ 
+ 	  if (current_sched_info->can_schedule_ready_p
+ 	      && ! (*current_sched_info->can_schedule_ready_p) (insn))
+@@ -3200,11 +4652,17 @@
+ 	  reemit_notes (insn);
+ 	  last_scheduled_insn = insn;
+ 
+-	  if (memcmp (curr_state, temp_state, dfa_state_size) != 0)
+-            {
+-              cycle_issued_insns++;
+-              memcpy (curr_state, temp_state, dfa_state_size);
+-            }
++	  if (recog_memoized (insn) >= 0)
++	    {
++	      cost = state_transition (curr_state, insn);
++	      if (sched_pressure != SCHED_PRESSURE_WEIGHTED)
++		gcc_assert (cost < 0);
++	      cycle_issued_insns++;
++	      asm_p = false;
++	    }
++	  else
++	    asm_p = (GET_CODE (PATTERN (insn)) == ASM_INPUT
++		     || asm_noperands (PATTERN (insn)) >= 0);
+ 
+ 	  if (targetm.sched.variable_issue)
+ 	    can_issue_more =
+@@ -3225,6 +4683,9 @@
+ 
+ 	  first_cycle_insn_p = false;
+ 
++	  if (ready.n_ready > 0)
++            prune_ready_list (temp_state, false);
++
+ 	  /* Sort the ready list based on priority.  This must be
+ 	     redone here, as schedule_insn may have readied additional
+ 	     insns that will not be sorted correctly.  */
+@@ -3321,6 +4782,9 @@
+ 	  }
+     }
+ 
++  if (sched_pressure == SCHED_PRESSURE_MODEL)
++    model_end_schedule ();
++
+   if (sched_verbose)
+     fprintf (sched_dump, ";;   total time = %d\n", clock_var);
+ 
+@@ -3424,10 +4888,14 @@
+   if (targetm.sched.dispatch (NULL_RTX, IS_DISPATCH_ON))
+     targetm.sched.dispatch_do (NULL_RTX, DISPATCH_INIT);
+ 
+-  sched_pressure_p = (flag_sched_pressure && ! reload_completed
+-		      && common_sched_info->sched_pass_id == SCHED_RGN_PASS);
++  if (flag_sched_pressure
++      && !reload_completed
++      && common_sched_info->sched_pass_id == SCHED_RGN_PASS)
++    sched_pressure = flag_sched_pressure_algorithm;
++  else
++    sched_pressure = SCHED_PRESSURE_NONE;
+ 
+-  if (sched_pressure_p)
++  if (sched_pressure != SCHED_PRESSURE_NONE)
+     ira_setup_eliminable_regset ();
+ 
+   /* Initialize SPEC_INFO.  */
+@@ -3504,7 +4972,7 @@
+   if (targetm.sched.init_global)
+     targetm.sched.init_global (sched_dump, sched_verbose, get_max_uid () + 1);
+ 
+-  if (sched_pressure_p)
++  if (sched_pressure != SCHED_PRESSURE_NONE)
+     {
+       int i, max_regno = max_reg_num ();
+ 
+@@ -3517,8 +4985,11 @@
+ 	     ? ira_class_translate[REGNO_REG_CLASS (i)]
+ 	     : reg_cover_class (i));
+       curr_reg_live = BITMAP_ALLOC (NULL);
+-      saved_reg_live = BITMAP_ALLOC (NULL);
+-      region_ref_regs = BITMAP_ALLOC (NULL);
++      if (sched_pressure == SCHED_PRESSURE_WEIGHTED)
++	{
++	  saved_reg_live = BITMAP_ALLOC (NULL);
++	  region_ref_regs = BITMAP_ALLOC (NULL);
++	}
+     }
+ 
+   curr_state = xmalloc (dfa_state_size);
+@@ -3618,12 +5089,15 @@
+ sched_finish (void)
+ {
+   haifa_finish_h_i_d ();
+-  if (sched_pressure_p)
++  if (sched_pressure != SCHED_PRESSURE_NONE)
+     {
++      if (sched_pressure == SCHED_PRESSURE_WEIGHTED)
++	{
++	  BITMAP_FREE (region_ref_regs);
++	  BITMAP_FREE (saved_reg_live);
++	}
++      BITMAP_FREE (curr_reg_live);
+       free (sched_regno_cover_class);
+-      BITMAP_FREE (region_ref_regs);
+-      BITMAP_FREE (saved_reg_live);
+-      BITMAP_FREE (curr_reg_live);
+     }
+   free (curr_state);
+ 
+@@ -3936,7 +5410,7 @@
+   INSN_TICK (next) = tick;
+ 
+   delay = tick - clock_var;
+-  if (delay <= 0 || sched_pressure_p)
++  if (delay <= 0 || sched_pressure != SCHED_PRESSURE_NONE)
+     delay = QUEUE_READY;
+ 
+   change_queue_index (next, delay);
+@@ -5185,7 +6659,7 @@
+       if (insn == jump)
+ 	break;
+ 
+-      if (dep_list_size (insn) == 0)
++      if (dep_list_size (insn, SD_LIST_FORW) == 0)
+ 	{
+ 	  dep_def _new_dep, *new_dep = &_new_dep;
+ 
+@@ -5556,6 +7030,7 @@
+ 
+   FOR_EACH_VEC_ELT (haifa_insn_data_def, h_i_d, i, data)
+     {
++      free (data->max_reg_pressure);
+       if (data->reg_pressure != NULL)
+ 	free (data->reg_pressure);
+       for (use = data->reg_use_list; use != NULL; use = next)
+
+=== modified file 'gcc/sched-deps.c'
+--- old/gcc/sched-deps.c	2011-12-08 13:33:58 +0000
++++ new/gcc/sched-deps.c	2012-02-08 23:39:45 +0000
+@@ -450,7 +450,7 @@
+ static void add_dependence_list_and_free (struct deps_desc *, rtx,
+ 					  rtx *, int, enum reg_note);
+ static void delete_all_dependences (rtx);
+-static void fixup_sched_groups (rtx);
++static void chain_to_prev_insn (rtx);
+ 
+ static void flush_pending_lists (struct deps_desc *, rtx, int, int);
+ static void sched_analyze_1 (struct deps_desc *, rtx, rtx);
+@@ -1490,7 +1490,7 @@
+    the previous nonnote insn.  */
+ 
+ static void
+-fixup_sched_groups (rtx insn)
++chain_to_prev_insn (rtx insn)
+ {
+   sd_iterator_def sd_it;
+   dep_t dep;
+@@ -1999,7 +1999,7 @@
+   static struct reg_pressure_data *pressure_info;
+   rtx link;
+ 
+-  gcc_assert (sched_pressure_p);
++  gcc_assert (sched_pressure != SCHED_PRESSURE_NONE);
+ 
+   if (! INSN_P (insn))
+     return;
+@@ -2030,8 +2030,9 @@
+   len = sizeof (struct reg_pressure_data) * ira_reg_class_cover_size;
+   pressure_info
+     = INSN_REG_PRESSURE (insn) = (struct reg_pressure_data *) xmalloc (len);
+-  INSN_MAX_REG_PRESSURE (insn) = (int *) xcalloc (ira_reg_class_cover_size
+-						  * sizeof (int), 1);
++  if (sched_pressure == SCHED_PRESSURE_WEIGHTED)
++    INSN_MAX_REG_PRESSURE (insn) = (int *) xcalloc (ira_reg_class_cover_size
++						    * sizeof (int), 1);
+   for (i = 0; i < ira_reg_class_cover_size; i++)
+     {
+       cl = ira_reg_class_cover[i];
+@@ -2775,7 +2776,7 @@
+       || (NONJUMP_INSN_P (insn) && control_flow_insn_p (insn)))
+     reg_pending_barrier = MOVE_BARRIER;
+ 
+-  if (sched_pressure_p)
++  if (sched_pressure != SCHED_PRESSURE_NONE)
+     {
+       setup_insn_reg_uses (deps, insn);
+       setup_insn_reg_pressure_info (insn);
+@@ -3076,7 +3077,7 @@
+ 	       instructions that follow seem like they should be part
+ 	       of the call group.
+ 
+-	       Also, if we did, fixup_sched_groups() would move the
++	       Also, if we did, chain_to_prev_insn would move the
+ 	       deps of the debug insn to the call insn, modifying
+ 	       non-debug post-dependency counts of the debug insn
+ 	       dependencies and otherwise messing with the scheduling
+@@ -3222,6 +3223,37 @@
+   return true;
+ }
+ 
++/* Return true if INSN should be made dependent on the previous instruction
++   group, and if all INSN's dependencies should be moved to the first
++   instruction of that group.  */
++
++static bool
++chain_to_prev_insn_p (rtx insn)
++{
++  rtx prev, x;
++
++  /* INSN forms a group with the previous instruction.  */
++  if (SCHED_GROUP_P (insn))
++    return true;
++
++  /* If the previous instruction clobbers a register R and this one sets
++     part of R, the clobber was added specifically to help us track the
++     liveness of R.  There's no point scheduling the clobber and leaving
++     INSN behind, especially if we move the clobber to another block.  */
++  prev = prev_nonnote_nondebug_insn (insn);
++  if (prev
++      && INSN_P (prev)
++      && BLOCK_FOR_INSN (prev) == BLOCK_FOR_INSN (insn)
++      && GET_CODE (PATTERN (prev)) == CLOBBER)
++    {
++      x = XEXP (PATTERN (prev), 0);
++      if (set_of (x, insn))
++	return true;
++    }
++
++  return false;
++}
++
+ /* Analyze INSN with DEPS as a context.  */
+ void
+ deps_analyze_insn (struct deps_desc *deps, rtx insn)
+@@ -3358,8 +3390,9 @@
+ 
+   /* Fixup the dependencies in the sched group.  */
+   if ((NONJUMP_INSN_P (insn) || JUMP_P (insn))
+-      && SCHED_GROUP_P (insn) && !sel_sched_p ())
+-    fixup_sched_groups (insn);
++      && chain_to_prev_insn_p (insn)
++      && !sel_sched_p ())
++    chain_to_prev_insn (insn);
+ }
+ 
+ /* Initialize DEPS for the new block beginning with HEAD.  */
+
+=== modified file 'gcc/sched-int.h'
+--- old/gcc/sched-int.h	2011-02-02 04:31:35 +0000
++++ new/gcc/sched-int.h	2012-02-08 23:39:02 +0000
+@@ -651,7 +651,7 @@
+ 
+ /* Do register pressure sensitive insn scheduling if the flag is set
+    up.  */
+-extern bool sched_pressure_p;
++extern enum sched_pressure_algorithm sched_pressure;
+ 
+ /* Map regno -> its cover class.  The map defined only when
+    SCHED_PRESSURE_P is true.  */
+@@ -773,16 +773,16 @@
+ 
+   short cost;
+ 
++  /* '> 0' if priority is valid,
++     '== 0' if priority was not yet computed,
++     '< 0' if priority in invalid and should be recomputed.  */
++  signed char priority_status;
++
+   /* Set if there's DEF-USE dependence between some speculatively
+      moved load insn and this one.  */
+   unsigned int fed_by_spec_load : 1;
+   unsigned int is_load_insn : 1;
+ 
+-  /* '> 0' if priority is valid,
+-     '== 0' if priority was not yet computed,
+-     '< 0' if priority in invalid and should be recomputed.  */
+-  signed char priority_status;
+-
+   /* What speculations are necessary to apply to schedule the instruction.  */
+   ds_t todo_spec;
+ 
+@@ -817,6 +817,7 @@
+   /* Info about how scheduling the insn changes cost of register
+      pressure excess (between source and target).  */
+   int reg_pressure_excess_cost_change;
++  int model_index;
+ };
+ 
+ typedef struct _haifa_insn_data haifa_insn_data_def;
+@@ -839,6 +840,7 @@
+ #define INSN_REG_PRESSURE_EXCESS_COST_CHANGE(INSN) \
+   (HID (INSN)->reg_pressure_excess_cost_change)
+ #define INSN_PRIORITY_STATUS(INSN) (HID (INSN)->priority_status)
++#define INSN_MODEL_INDEX(INSN) (HID (INSN)->model_index)
+ 
+ typedef struct _haifa_deps_insn_data haifa_deps_insn_data_def;
+ typedef haifa_deps_insn_data_def *haifa_deps_insn_data_t;
+
+=== modified file 'gcc/sched-rgn.c'
+--- old/gcc/sched-rgn.c	2011-06-04 10:15:48 +0000
++++ new/gcc/sched-rgn.c	2012-02-08 23:38:13 +0000
+@@ -2943,7 +2943,7 @@
+ 
+   sched_extend_ready_list (rgn_n_insns);
+ 
+-  if (sched_pressure_p)
++  if (sched_pressure == SCHED_PRESSURE_WEIGHTED)
+     {
+       sched_init_region_reg_pressure_info ();
+       for (bb = 0; bb < current_nr_blocks; bb++)
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106870.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106870.patch
new file mode 100644
index 0000000..1a54484
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106870.patch
@@ -0,0 +1,28 @@
+2012-02-20  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* config/arm/arm.c (arm_print_operand): Avoid null-pointer
+	dereference from MEM_SIZE.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2012-02-09 00:47:59 +0000
++++ new/gcc/config/arm/arm.c	2012-02-20 15:32:26 +0000
+@@ -17446,6 +17446,7 @@
+ 	rtx addr;
+ 	bool postinc = FALSE;
+ 	unsigned align, memsize, align_bits;
++	rtx memsize_rtx;
+ 
+ 	gcc_assert (GET_CODE (x) == MEM);
+ 	addr = XEXP (x, 0);
+@@ -17460,7 +17461,8 @@
+ 	   instruction (for some alignments) as an aid to the memory subsystem
+ 	   of the target.  */
+ 	align = MEM_ALIGN (x) >> 3;
+-	memsize = INTVAL (MEM_SIZE (x));
++	memsize_rtx = MEM_SIZE (x);
++	memsize = memsize_rtx ? INTVAL (memsize_rtx) : 0;
+ 	
+ 	/* Only certain alignment specifiers are supported by the hardware.  */
+ 	if (memsize == 16 && (align % 32) == 0)
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106872.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106872.patch
new file mode 100644
index 0000000..9bfd969
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106872.patch
@@ -0,0 +1,126 @@
+2012-02-24  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from mainline.
+        2011-12-05  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	gcc/
+	* config/arm/arm.c (vfp3_const_double_for_fract_bits): Define.
+	* config/arm/arm-protos.h (vfp3_const_double_for_fract_bits): Declare.
+	* config/arm/constraints.md ("Dt"): New constraint.
+	* config/arm/predicates.md (const_double_vcvt_power_of_two_reciprocal):
+	New.
+	* config/arm/vfp.md (*arm_combine_vcvt_f32_s32): New.
+	(*arm_combine_vcvt_f32_u32): New.
+
+	LP:#900426
+
+	2011-12-06  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+        * config/arm/vfp.md (*combine_vcvt_f64_<FCVTI32typename>): Fix
+       formatting character for vmov.f64 case.
+
+2012-02-24  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	gcc/
+	* config/arm/arm.c (arm_print_operand): Remove wrongly merged code.
+	 (vfp3_const_double_for_fract_bits): Likewise.
+
+=== modified file 'gcc/config/arm/arm-protos.h'
+--- old/gcc/config/arm/arm-protos.h	2011-12-06 10:42:29 +0000
++++ new/gcc/config/arm/arm-protos.h	2012-02-22 13:31:54 +0000
+@@ -238,6 +238,7 @@
+ };
+ 
+ extern const struct tune_params *current_tune;
++extern int vfp3_const_double_for_fract_bits (rtx);
+ #endif /* RTX_CODE */
+ 
+ #endif /* ! GCC_ARM_PROTOS_H */
+
+=== modified file 'gcc/config/arm/constraints.md'
+--- old/gcc/config/arm/constraints.md	2011-12-06 10:42:29 +0000
++++ new/gcc/config/arm/constraints.md	2012-02-22 13:31:54 +0000
+@@ -29,7 +29,7 @@
+ ;; in Thumb-1 state: I, J, K, L, M, N, O
+ 
+ ;; The following multi-letter normal constraints have been used:
+-;; in ARM/Thumb-2 state: Da, Db, Dc, Dn, Dl, DL, Dv, Dy, Di, Dz
++;; in ARM/Thumb-2 state: Da, Db, Dc, Dn, Dl, DL, Dv, Dy, Di, Dt, Dz
+ ;; in Thumb-1 state: Pa, Pb, Pc, Pd
+ ;; in Thumb-2 state: Pj, PJ, Ps, Pt, Pu, Pv, Pw, Px, Py
+ 
+@@ -291,6 +291,12 @@
+  (and (match_code "const_double")
+       (match_test "TARGET_32BIT && TARGET_VFP_DOUBLE && vfp3_const_double_rtx (op)")))
+ 
++(define_constraint "Dt" 
++ "@internal
++  In ARM/ Thumb2 a const_double which can be used with a vcvt.f32.s32 with fract bits operation"
++  (and (match_code "const_double")
++       (match_test "TARGET_32BIT && TARGET_VFP && vfp3_const_double_for_fract_bits (op)")))
++
+ (define_memory_constraint "Ut"
+  "@internal
+   In ARM/Thumb-2 state an address valid for loading/storing opaque structure
+
+=== modified file 'gcc/config/arm/predicates.md'
+--- old/gcc/config/arm/predicates.md	2011-12-06 10:42:29 +0000
++++ new/gcc/config/arm/predicates.md	2012-02-22 13:31:54 +0000
+@@ -725,6 +725,11 @@
+   return true; 
+ })
+ 
++(define_predicate "const_double_vcvt_power_of_two_reciprocal"
++  (and (match_code "const_double")
++       (match_test "TARGET_32BIT && TARGET_VFP 
++       		    && vfp3_const_double_for_fract_bits (op)")))
++
+ (define_special_predicate "neon_struct_operand"
+   (and (match_code "mem")
+        (match_test "TARGET_32BIT && neon_vector_mem_operand (op, 2)")))
+
+=== modified file 'gcc/config/arm/vfp.md'
+--- old/gcc/config/arm/vfp.md	2011-12-06 10:42:29 +0000
++++ new/gcc/config/arm/vfp.md	2012-02-22 13:31:54 +0000
+@@ -1131,9 +1131,40 @@
+    (set_attr "type" "fcmpd")]
+ )
+ 
++;; Fixed point to floating point conversions. 
++(define_code_iterator FCVT [unsigned_float float])
++(define_code_attr FCVTI32typename [(unsigned_float "u32") (float "s32")])
++
++(define_insn "*combine_vcvt_f32_<FCVTI32typename>"
++  [(set (match_operand:SF 0 "s_register_operand" "=t")
++	(mult:SF (FCVT:SF (match_operand:SI 1 "s_register_operand" "0"))
++		 (match_operand 2 
++			"const_double_vcvt_power_of_two_reciprocal" "Dt")))]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_VFP3 && !flag_rounding_math"
++  "vcvt.f32.<FCVTI32typename>\\t%0, %1, %v2"
++ [(set_attr "predicable" "no")
++  (set_attr "type" "f_cvt")]
++)
++
++;; Not the ideal way of implementing this. Ideally we would be able to split
++;; this into a move to a DP register and then a vcvt.f64.i32
++(define_insn "*combine_vcvt_f64_<FCVTI32typename>"
++  [(set (match_operand:DF 0 "s_register_operand" "=x,x,w")
++	(mult:DF (FCVT:DF (match_operand:SI 1 "s_register_operand" "r,t,r"))
++		 (match_operand 2 
++		     "const_double_vcvt_power_of_two_reciprocal" "Dt,Dt,Dt")))]
++  "TARGET_32BIT && TARGET_HARD_FLOAT && TARGET_VFP3 && !flag_rounding_math 
++  && !TARGET_VFP_SINGLE"
++  "@
++  vmov.f32\\t%0, %1\;vcvt.f64.<FCVTI32typename>\\t%P0, %P0, %v2
++  vmov.f32\\t%0, %1\;vcvt.f64.<FCVTI32typename>\\t%P0, %P0, %v2
++  vmov.f64\\t%P0, %1, %1\; vcvt.f64.<FCVTI32typename>\\t%P0, %P0, %v2"
++ [(set_attr "predicable" "no")
++  (set_attr "type" "f_cvt")
++  (set_attr "length" "8")]
++)
+ 
+ ;; Store multiple insn used in function prologue.
+-
+ (define_insn "*push_multi_vfp"
+   [(match_parallel 2 "multi_register_push"
+     [(set (match_operand:BLK 0 "memory_operand" "=m")
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106873.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106873.patch
new file mode 100644
index 0000000..5ce71a5
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106873.patch
@@ -0,0 +1,80 @@
+ 2012-02-24  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+ 
+	LP:#922474
+	gcc/
+	* config/arm/sync.md (sync_lock_releasedi): Define.
+	(arm_sync_lock_releasedi): Likewise.
+	gcc/testsuite
+ 	Backport from mainline.
+        2012-01-30  Greta Yorsh  <Greta.Yorsh@arm.com>
+	* gcc.target/arm/di-longlong64-sync-withldrexd.c: Accept
+	new code generated for __sync_lock_release.
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2012-02-01 14:13:07 +0000
++++ new/gcc/config/arm/arm.md	2012-02-22 18:37:56 +0000
+@@ -157,6 +157,7 @@
+    (VUNSPEC_SYNC_OP               23)	; Represent a sync_<op>
+    (VUNSPEC_SYNC_NEW_OP           24)	; Represent a sync_new_<op>
+    (VUNSPEC_SYNC_OLD_OP           25)	; Represent a sync_old_<op>
++   (VUNSPEC_SYNC_RELEASE 	  26)	; Represent a sync_lock_release.
+   ]
+ )
+ 
+
+=== modified file 'gcc/config/arm/sync.md'
+--- old/gcc/config/arm/sync.md	2011-10-14 15:47:15 +0000
++++ new/gcc/config/arm/sync.md	2012-02-22 18:37:56 +0000
+@@ -494,3 +494,36 @@
+    (set_attr "conds" "unconditional")
+    (set_attr "predicable" "no")])
+ 
++(define_expand "sync_lock_releasedi"
++ [(match_operand:DI 0 "memory_operand")
++  (match_operand:DI 1 "s_register_operand")]
++ "TARGET_HAVE_LDREXD && ARM_DOUBLEWORD_ALIGN && TARGET_HAVE_MEMORY_BARRIER"
++ { 
++   struct arm_sync_generator generator;
++   rtx tmp1 = gen_reg_rtx (DImode);
++   generator.op = arm_sync_generator_omn;
++   generator.u.omn = gen_arm_sync_lock_releasedi;
++   arm_expand_sync (DImode, &generator, operands[1], operands[0], NULL, tmp1);
++   DONE;
++ }
++)
++
++(define_insn "arm_sync_lock_releasedi"
++ [(set (match_operand:DI 2 "s_register_operand" "=&r")
++       (unspec_volatile:DI [(match_operand:DI 1 "arm_sync_memory_operand" "+Q")
++       			    (match_operand:DI 0 "s_register_operand" "r")]
++			    VUNSPEC_SYNC_RELEASE))
++  (clobber (reg:CC CC_REGNUM))
++  (clobber (match_scratch:SI 3 "=&r"))]
++  "TARGET_HAVE_LDREXD && ARM_DOUBLEWORD_ALIGN && TARGET_HAVE_MEMORY_BARRIER"
++ {
++  return arm_output_sync_insn (insn, operands);
++ }
++ [(set_attr "sync_memory"          "1")
++  (set_attr "sync_result" 	   "2")
++  (set_attr "sync_t1" 		   "2")
++  (set_attr "sync_t2" 		   "3")
++  (set_attr "sync_new_value" 	   "0")
++  (set_attr "conds"             "clob")
++  (set_attr "predicable"          "no")]
++)
+
+=== modified file 'gcc/testsuite/gcc.target/arm/di-longlong64-sync-withldrexd.c'
+--- old/gcc/testsuite/gcc.target/arm/di-longlong64-sync-withldrexd.c	2011-10-14 15:56:32 +0000
++++ new/gcc/testsuite/gcc.target/arm/di-longlong64-sync-withldrexd.c	2012-02-22 18:37:56 +0000
+@@ -10,8 +10,8 @@
+ #include "../../gcc.dg/di-longlong64-sync-1.c"
+ 
+ /* We should be using ldrexd, strexd and no helpers or shorter ldrex.  */
+-/* { dg-final { scan-assembler-times "\tldrexd" 46 } } */
+-/* { dg-final { scan-assembler-times "\tstrexd" 46 } } */
++/* { dg-final { scan-assembler-times "\tldrexd" 48 } } */
++/* { dg-final { scan-assembler-times "\tstrexd" 48 } } */
+ /* { dg-final { scan-assembler-not "__sync_" } } */
+ /* { dg-final { scan-assembler-not "ldrex\t" } } */
+ /* { dg-final { scan-assembler-not "strex\t" } } */
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106874.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106874.patch
new file mode 100644
index 0000000..092650d
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106874.patch
@@ -0,0 +1,46 @@
+ 2012-02-24  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+ 
+	Backport from mainline.
+	gcc/
+        2012-02-21  Matthew Gretton-Dann  <matthew.gretton-dann@arm.com>
+
+        Revert r183011
+        * config/arm/arm-cores.def (cortex-a15): Use generic Cortex tuning
+        parameters.
+        * config/arm/arm.c (arm_cortex_a15_tune): Remove.
+
+=== modified file 'gcc/config/arm/arm-cores.def'
+--- old/gcc/config/arm/arm-cores.def	2012-01-23 00:36:02 +0000
++++ new/gcc/config/arm/arm-cores.def	2012-02-22 15:53:56 +0000
+@@ -129,7 +129,7 @@
+ ARM_CORE("cortex-a7",	  cortexa7,	7A,				 FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV, cortex)
+ ARM_CORE("cortex-a8",	  cortexa8,	7A,				 FL_LDSCHED, cortex)
+ ARM_CORE("cortex-a9",	  cortexa9,	7A,				 FL_LDSCHED, cortex_a9)
+-ARM_CORE("cortex-a15",	  cortexa15,	7A,				 FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV, cortex_a15)
++ARM_CORE("cortex-a15",	  cortexa15,	7A,				 FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV, cortex)
+ ARM_CORE("cortex-r4",	  cortexr4,	7R,				 FL_LDSCHED, cortex)
+ ARM_CORE("cortex-r4f",	  cortexr4f,	7R,				 FL_LDSCHED, cortex)
+ ARM_CORE("cortex-r5",	  cortexr5,	7R,				 FL_LDSCHED | FL_ARM_DIV, cortex)
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2012-02-24 16:20:29 +0000
++++ new/gcc/config/arm/arm.c	2012-02-24 17:33:58 +0000
+@@ -988,17 +988,6 @@
+   arm_default_branch_cost
+ };
+ 
+-const struct tune_params arm_cortex_a15_tune =
+-{
+-  arm_9e_rtx_costs,
+-  NULL,
+-  1,						/* Constant limit.  */
+-  1,						/* Max cond insns.  */
+-  ARM_PREFETCH_NOT_BENEFICIAL,			/* TODO: Calculate correct values.  */
+-  false,					/* Prefer constant pool.  */
+-  arm_cortex_a5_branch_cost
+-};
+-
+ const struct tune_params arm_fa726te_tune =
+ {
+   arm_9e_rtx_costs,
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
index e42aeea..90a857d 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
@@ -4,7 +4,6 @@ file://linaro/gcc-4.6-linaro-r106733.patch \
 file://linaro/gcc-4.6-linaro-r106737.patch \
 file://linaro/gcc-4.6-linaro-r106738.patch \
 file://linaro/gcc-4.6-linaro-r106739.patch \
-file://linaro/gcc-4.6-linaro-r106740.patch \
 file://linaro/gcc-4.6-linaro-r106741.patch \
 file://linaro/gcc-4.6-linaro-r106742.patch \
 file://linaro/gcc-4.6-linaro-r106744.patch \
@@ -81,6 +80,17 @@ file://linaro/gcc-4.6-linaro-r106845.patch \
 file://linaro/gcc-4.6-linaro-r106846.patch \
 file://linaro/gcc-4.6-linaro-r106848.patch \
 file://linaro/gcc-4.6-linaro-r106853.patch \
-file://linaro/gcc-4.6-linaro-r106854.patch \
 file://linaro/gcc-4.6-linaro-r106855.patch \
+file://linaro/gcc-4.6-linaro-r106860.patch \
+file://linaro/gcc-4.6-linaro-r106861.patch \
+file://linaro/gcc-4.6-linaro-r106862.patch \
+file://linaro/gcc-4.6-linaro-r106863.patch \
+file://linaro/gcc-4.6-linaro-r106864.patch \
+file://linaro/gcc-4.6-linaro-r106865.patch \
+file://linaro/gcc-4.6-linaro-r106869.patch \
+file://linaro/gcc-4.6-linaro-r106870.patch \
+file://linaro/gcc-4.6-linaro-r106872.patch \
+file://linaro/gcc-4.6-linaro-r106873.patch \
+file://linaro/gcc-4.6-linaro-r106874.patch \
+file://linaro/fix_linaro_106872.patch \
 "
-- 
1.7.5.4



