Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RkP0v-0008IJ-Cx
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 00:52:29 +0100
Received: by iafi7 with SMTP id i7so7144iaf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jan 2012 15:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=m2W9Q+qq+rDReeiwHeY/7/lx7GQfxxPRWqlBcjKow7U=;
	b=jKSioVJ4lXYxkUG/JMVDULGLsRB04jrXeNzlEFkoTpUmM/3P1LwVqsGmOOVADb1f1o
	h0ruhMiYJcKPbGWBzLw7m9Onh/ORA77PXWqwrrH28tsGQmp1Ac3JBviMyuxMz62RwSqC
	p6k+MWHGSGNdVWJEMsHv8zWQAwvNCZRPh1t1g=
Received: by 10.42.117.193 with SMTP id u1mr20175998icq.24.1326152700372;
	Mon, 09 Jan 2012 15:45:00 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id t5sm14816976igb.4.2012.01.09.15.44.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 15:44:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jan 2012 15:44:15 -0800
Message-Id: <1326152656-6622-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH 1/2] gcc-4.6: Fix ICE on x86_64 seen during vectorization
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
X-List-Received-Date: Mon, 09 Jan 2012 23:52:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch    |   66 ++++++++++++++-----
 meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc    |    2 +-
 2 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch
index ff34514..3a14923 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch
@@ -53,7 +53,7 @@
 Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c	2011-09-16 20:32:57.279056697 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c	2012-01-09 15:03:29.156918805 -0800
 @@ -0,0 +1,52 @@
 +/* { dg-require-effective-target vect_int } */
 +
@@ -110,7 +110,7 @@ Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c
 Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c	2011-09-16 20:32:57.279056697 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c	2012-01-09 15:03:29.156918805 -0800
 @@ -0,0 +1,59 @@
 +/* { dg-require-effective-target vect_int } */
 +
@@ -174,7 +174,7 @@ Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c
 Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c	2011-09-16 20:32:57.279056697 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c	2012-01-09 15:03:29.160918806 -0800
 @@ -0,0 +1,49 @@
 +/* { dg-require-effective-target vect_int } */
 +
@@ -227,8 +227,8 @@ Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c
 +
 Index: gcc-4_6-branch/gcc/tree-vect-loop.c
 ===================================================================
---- gcc-4_6-branch.orig/gcc/tree-vect-loop.c	2011-09-16 20:31:52.000000000 -0700
-+++ gcc-4_6-branch/gcc/tree-vect-loop.c	2011-09-16 20:32:57.289056641 -0700
+--- gcc-4_6-branch.orig/gcc/tree-vect-loop.c	2012-01-09 15:02:15.000000000 -0800
++++ gcc-4_6-branch/gcc/tree-vect-loop.c	2012-01-09 15:03:29.160918806 -0800
 @@ -181,6 +181,8 @@
    stmt_vec_info stmt_info;
    int i;
@@ -379,8 +379,8 @@ Index: gcc-4_6-branch/gcc/tree-vect-loop.c
  
 Index: gcc-4_6-branch/gcc/tree-vect-patterns.c
 ===================================================================
---- gcc-4_6-branch.orig/gcc/tree-vect-patterns.c	2011-09-16 20:31:52.000000000 -0700
-+++ gcc-4_6-branch/gcc/tree-vect-patterns.c	2011-09-16 20:32:57.289056641 -0700
+--- gcc-4_6-branch.orig/gcc/tree-vect-patterns.c	2012-01-09 15:02:15.000000000 -0800
++++ gcc-4_6-branch/gcc/tree-vect-patterns.c	2012-01-09 15:03:29.160918806 -0800
 @@ -39,10 +39,13 @@
  #include "diagnostic-core.h"
  
@@ -930,8 +930,8 @@ Index: gcc-4_6-branch/gcc/tree-vect-patterns.c
      fprintf (vect_dump, "=== vect_pattern_recog ===");
 Index: gcc-4_6-branch/gcc/tree-vect-slp.c
 ===================================================================
---- gcc-4_6-branch.orig/gcc/tree-vect-slp.c	2011-09-16 20:31:52.000000000 -0700
-+++ gcc-4_6-branch/gcc/tree-vect-slp.c	2011-09-16 20:32:57.289056641 -0700
+--- gcc-4_6-branch.orig/gcc/tree-vect-slp.c	2012-01-09 15:02:15.000000000 -0800
++++ gcc-4_6-branch/gcc/tree-vect-slp.c	2012-01-09 15:03:29.160918806 -0800
 @@ -152,7 +152,9 @@
        if (loop && def_stmt && gimple_bb (def_stmt)
            && flow_bb_inside_loop_p (loop, gimple_bb (def_stmt))
@@ -945,8 +945,8 @@ Index: gcc-4_6-branch/gcc/tree-vect-slp.c
              *pattern0 = true;
 Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
 ===================================================================
---- gcc-4_6-branch.orig/gcc/tree-vect-stmts.c	2011-09-16 20:31:52.000000000 -0700
-+++ gcc-4_6-branch/gcc/tree-vect-stmts.c	2011-09-16 20:32:57.289056641 -0700
+--- gcc-4_6-branch.orig/gcc/tree-vect-stmts.c	2012-01-09 15:02:15.000000000 -0800
++++ gcc-4_6-branch/gcc/tree-vect-stmts.c	2012-01-09 15:06:23.636927250 -0800
 @@ -126,33 +126,72 @@
  
  static void
@@ -1007,6 +1007,8 @@ Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
 +             pattern that can potentially be vectorized.  Don't mark the stmt
 +             as relevant/live because it's not going to be vectorized.
 +             Instead mark the pattern-stmt that replaces it.  */
++
++          pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info);
  
 -      /* This is the last stmt in a sequence that was detected as a
 -         pattern that can potentially be vectorized.  Don't mark the stmt
@@ -1022,8 +1024,6 @@ Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
 -      save_relevant = STMT_VINFO_RELEVANT (stmt_info);
 -      save_live_p = STMT_VINFO_LIVE_P (stmt_info);
 -      stmt = pattern_stmt;
-+          pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info);
-+
 +          if (vect_print_dump_info (REPORT_DETAILS))
 +            fprintf (vect_dump, "last stmt in pattern. don't mark"
 +                                " relevant/live.");
@@ -1181,11 +1181,11 @@ Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
       In basic blocks we only analyze statements that are a part of some SLP
 -     instance, therefore, all the statements are relevant.  */
 +     instance, therefore, all the statements are relevant.  
- 
++
 +     Pattern statement need to be analyzed instead of the original statement
 +     if the original statement is not relevant. Otherwise, we analyze both
 +     statements.  */
-+
+ 
 +  pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info);
    if (!STMT_VINFO_RELEVANT_P (stmt_info)
        && !STMT_VINFO_LIVE_P (stmt_info))
@@ -1222,7 +1222,37 @@ Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
  
    switch (STMT_VINFO_DEF_TYPE (stmt_info))
      {
-@@ -5605,8 +5687,12 @@
+@@ -5074,7 +5156,6 @@
+   bool is_store = false;
+   gimple vec_stmt = NULL;
+   stmt_vec_info stmt_info = vinfo_for_stmt (stmt);
+-  gimple orig_stmt_in_pattern;
+   bool done;
+ 
+   switch (STMT_VINFO_TYPE (stmt_info))
+@@ -5213,21 +5294,7 @@
+     }
+ 
+   if (vec_stmt)
+-    {
+       STMT_VINFO_VEC_STMT (stmt_info) = vec_stmt;
+-      orig_stmt_in_pattern = STMT_VINFO_RELATED_STMT (stmt_info);
+-      if (orig_stmt_in_pattern)
+-	{
+-	  stmt_vec_info stmt_vinfo = vinfo_for_stmt (orig_stmt_in_pattern);
+-	  /* STMT was inserted by the vectorizer to replace a computation idiom.
+-	     ORIG_STMT_IN_PATTERN is a stmt in the original sequence that
+-	     computed this idiom.  We need to record a pointer to VEC_STMT in
+-	     the stmt_info of ORIG_STMT_IN_PATTERN.  See more details in the
+-	     documentation of vect_pattern_recog.  */
+-	  if (STMT_VINFO_IN_PATTERN_P (stmt_vinfo))
+-	    STMT_VINFO_VEC_STMT (stmt_vinfo) = vec_stmt;
+-	}
+-    }
+ 
+   return is_store;
+ }
+@@ -5605,8 +5672,12 @@
        || *dt == vect_nested_cycle)
      {
        stmt_vec_info stmt_info = vinfo_for_stmt (*def_stmt);
@@ -1238,8 +1268,8 @@ Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
      }
 Index: gcc-4_6-branch/gcc/tree-vectorizer.h
 ===================================================================
---- gcc-4_6-branch.orig/gcc/tree-vectorizer.h	2011-09-16 20:31:52.000000000 -0700
-+++ gcc-4_6-branch/gcc/tree-vectorizer.h	2011-09-16 20:32:57.299056515 -0700
+--- gcc-4_6-branch.orig/gcc/tree-vectorizer.h	2012-01-09 15:02:15.000000000 -0800
++++ gcc-4_6-branch/gcc/tree-vectorizer.h	2012-01-09 15:03:29.164918806 -0800
 @@ -890,7 +890,7 @@
  /* Pattern recognition functions.
     Additional pattern recognition functions can (and will) be added
diff --git a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
index c12913d..6b0151b 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
@@ -1,4 +1,4 @@
 # this will prepend this layer to FILESPATH
 FILESEXTRAPATHS := "${THISDIR}/gcc-4.6"
-PRINC = "3"
+PRINC = "4"
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.5.4



