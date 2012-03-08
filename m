Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S5Wqh-00036Z-Nk
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 07:29:16 +0100
Received: by iaag37 with SMTP id g37so243328iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2012 22:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WHrTgO3Y0RpzpSe4JU2mOQ1RGynzkATgeHwhP6e9gCs=;
	b=dz96HgdiIY5O/QZHO6EMdlFqcklAZJ0YxuAoK1qwwHg2ta5J6KolZAfrhOmb11fkI8
	IQKNTOvdxMvbqTYJ5GNUfJE7ISoDiVVNd5/YP86XW2+OKeUrdPbzm6j2xB/JDrAN246B
	KWkDO+WplQ0obBi4abe4BJ9c2VIKd+LeTP2lC2hMg1qRm4KXTOZ+bVs6z+3G94TTOMRk
	nS6lwRCydPiEgLcHAXyKxJFLjMX39j9LZ9WfTUBpw32lLNeuyrXx/FVfU0AbfyoV2hu5
	imNlPKZkGKET4wjkVjt6PWigyJwyjnzlg4Lr4wyIld96gSAsLd9AhZpyXYW3rjc/I9Um
	cbeQ==
Received: by 10.50.193.131 with SMTP id ho3mr14863109igc.55.1331187637147;
	Wed, 07 Mar 2012 22:20:37 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id al5sm749645igc.5.2012.03.07.22.20.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Mar 2012 22:20:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2012 22:20:05 -0800
Message-Id: <1331187605-10493-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] gcc-4.5: Move SRCREV to latest on gcc-4_5-branch
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
X-List-Received-Date: Thu, 08 Mar 2012 06:29:16 -0000

This brings in bug fixes for details clone gcc tree and
checkout gcc-4_5-branch and then

git log aab79458fc2025967f9a35aef4e7c0094c63d38e..1b523ca2a20934d1c52cb3a54b634ac4441debdf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc           |    5 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99347.patch |   83 ----
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch |  516 ++++++++++----------
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch |  158 ++++---
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch |   92 ++--
 5 files changed, 384 insertions(+), 470 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99347.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index d1802b5..b23b322 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 PV = "4.5"
-PR = "r46"
+PR = "r47"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
@@ -23,7 +23,7 @@ PR = "r46"
 # which will be next minor release and so on.
 
 BINV = "${PV}.4"
-SRCREV = "181733"
+SRCREV = "184907"
 BRANCH = "gcc-4_5-branch"
 PR_append = "+svnr${SRCPV}"
 
@@ -80,7 +80,6 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
        file://linaro/gcc-4.5-linaro-r99344.patch \
        file://linaro/gcc-4.5-linaro-r99345.patch \
        file://linaro/gcc-4.5-linaro-r99346.patch \
-       file://linaro/gcc-4.5-linaro-r99347.patch \
        file://linaro/gcc-4.5-linaro-r99348.patch \
        file://linaro/gcc-4.5-linaro-r99349.patch \
        file://linaro/gcc-4.5-linaro-r99351.patch \
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99347.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99347.patch
deleted file mode 100644
index 57b8605..0000000
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99347.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-	Merge from Sourcery G++ 4.4:
-
-	2010-02-15  Julian Brown  <julian@codesourcery.com>
-
-	Issue #7486
-
-	gcc/
-	* config/arm/arm.c (arm_libcall_uses_aapcs_base)
-	(arm_init_cumulative_args): Use correct ABI for double-precision
-	helper functions in hard-float mode if only single-precision
-	arithmetic is supported in hardware.
-
-2010-07-26  Julian Brown  <julian@codesourcery.com>
-
- 	Backport from FSF mainline:
- 
- 	Julian Brown  <julian@codesourcery.com>
-
-=== modified file 'gcc/config/arm/arm.c'
---- old/gcc/config/arm/arm.c	2010-08-13 10:30:35 +0000
-+++ new/gcc/config/arm/arm.c	2010-08-13 10:43:42 +0000
-@@ -3453,6 +3453,28 @@
- 		   convert_optab_libfunc (sfix_optab, DImode, SFmode));
-       add_libcall (libcall_htab,
- 		   convert_optab_libfunc (ufix_optab, DImode, SFmode));
-+
-+      /* Values from double-precision helper functions are returned in core
-+	 registers if the selected core only supports single-precision
-+	 arithmetic, even if we are using the hard-float ABI.  */
-+      if (TARGET_VFP)
-+        {
-+	  add_libcall (libcall_htab, optab_libfunc (add_optab, DFmode));
-+	  add_libcall (libcall_htab, optab_libfunc (sdiv_optab, DFmode));
-+	  add_libcall (libcall_htab, optab_libfunc (smul_optab, DFmode));
-+	  add_libcall (libcall_htab, optab_libfunc (neg_optab, DFmode));
-+	  add_libcall (libcall_htab, optab_libfunc (sub_optab, DFmode));
-+	  add_libcall (libcall_htab, optab_libfunc (eq_optab, DFmode));
-+	  add_libcall (libcall_htab, optab_libfunc (lt_optab, DFmode));
-+	  add_libcall (libcall_htab, optab_libfunc (le_optab, DFmode));
-+	  add_libcall (libcall_htab, optab_libfunc (ge_optab, DFmode));
-+	  add_libcall (libcall_htab, optab_libfunc (gt_optab, DFmode));
-+	  add_libcall (libcall_htab, optab_libfunc (unord_optab, DFmode));
-+	  add_libcall (libcall_htab,
-+		       convert_optab_libfunc (sext_optab, DFmode, SFmode));
-+	  add_libcall (libcall_htab,
-+		       convert_optab_libfunc (trunc_optab, SFmode, DFmode));
-+	}
-     }
- 
-   return libcall && htab_find (libcall_htab, libcall) != NULL;
-@@ -4406,6 +4428,31 @@
-       if (arm_libcall_uses_aapcs_base (libname))
- 	pcum->pcs_variant = ARM_PCS_AAPCS;
-  
-+      /* We must pass arguments to double-precision helper functions in core
-+         registers if we only have hardware support for single-precision
-+	 arithmetic, even if we are using the hard-float ABI.  */
-+      if (TARGET_VFP
-+          && (rtx_equal_p (libname, optab_libfunc (add_optab, DFmode))
-+	      || rtx_equal_p (libname, optab_libfunc (sdiv_optab, DFmode))
-+	      || rtx_equal_p (libname, optab_libfunc (smul_optab, DFmode))
-+	      || rtx_equal_p (libname, optab_libfunc (neg_optab, DFmode))
-+	      || rtx_equal_p (libname, optab_libfunc (sub_optab, DFmode))
-+	      || rtx_equal_p (libname, optab_libfunc (eq_optab, DFmode))
-+	      || rtx_equal_p (libname, optab_libfunc (lt_optab, DFmode))
-+	      || rtx_equal_p (libname, optab_libfunc (le_optab, DFmode))
-+	      || rtx_equal_p (libname, optab_libfunc (ge_optab, DFmode))
-+	      || rtx_equal_p (libname, optab_libfunc (gt_optab, DFmode))
-+	      || rtx_equal_p (libname, optab_libfunc (unord_optab, DFmode))
-+	      || rtx_equal_p (libname, convert_optab_libfunc (sext_optab,
-+							      DFmode, SFmode))
-+	      || rtx_equal_p (libname, convert_optab_libfunc (trunc_optab,
-+							      SFmode, DFmode))
-+	      || rtx_equal_p (libname, convert_optab_libfunc (sfix_optab,
-+							      SImode, DFmode))
-+	      || rtx_equal_p (libname, convert_optab_libfunc (ufix_optab,
-+							      SImode, DFmode))))
-+        pcum->pcs_variant = ARM_PCS_AAPCS;
-+ 
-       pcum->aapcs_ncrn = pcum->aapcs_next_ncrn = 0;
-       pcum->aapcs_reg = NULL_RTX;
-       pcum->aapcs_partial = 0;
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch
index c66c11f..b7b6d88 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99380.patch
@@ -171,9 +171,11 @@
  	Backport from mainline:
 
 === modified file 'gcc/Makefile.in'
---- old/gcc/Makefile.in	2010-08-10 13:31:21 +0000
-+++ new/gcc/Makefile.in	2010-09-01 13:29:58 +0000
-@@ -3193,7 +3193,7 @@
+Index: gcc-4_5-branch/gcc/Makefile.in
+===================================================================
+--- gcc-4_5-branch.orig/gcc/Makefile.in	2012-03-06 12:11:29.000000000 -0800
++++ gcc-4_5-branch/gcc/Makefile.in	2012-03-06 12:14:01.024439210 -0800
+@@ -3197,7 +3197,7 @@
  ira-costs.o: ira-costs.c $(CONFIG_H) $(SYSTEM_H) coretypes.h $(TM_H) \
     hard-reg-set.h $(RTL_H) $(EXPR_H) $(TM_P_H) $(FLAGS_H) $(BASIC_BLOCK_H) \
     $(REGS_H) addresses.h insn-config.h $(RECOG_H) $(TOPLEV_H) $(TARGET_H) \
@@ -182,10 +184,10 @@
  ira-conflicts.o: ira-conflicts.c $(CONFIG_H) $(SYSTEM_H) coretypes.h $(TM_H) \
     $(TARGET_H) $(RTL_H) $(REGS_H) hard-reg-set.h $(FLAGS_H) \
     insn-config.h $(RECOG_H) $(BASIC_BLOCK_H) $(TOPLEV_H) $(TM_P_H) $(PARAMS_H) \
-
-=== modified file 'gcc/basic-block.h'
---- old/gcc/basic-block.h	2010-08-16 09:41:58 +0000
-+++ new/gcc/basic-block.h	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/basic-block.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/basic-block.h	2012-03-06 12:11:33.000000000 -0800
++++ gcc-4_5-branch/gcc/basic-block.h	2012-03-06 12:14:01.024439210 -0800
 @@ -894,6 +894,10 @@
  
  /* In cfgcleanup.c.  */
@@ -197,10 +199,10 @@
  extern bool delete_unreachable_blocks (void);
  
  extern bool mark_dfs_back_edges (void);
-
-=== modified file 'gcc/cfgcleanup.c'
---- old/gcc/cfgcleanup.c	2010-05-17 16:26:22 +0000
-+++ new/gcc/cfgcleanup.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/cfgcleanup.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/cfgcleanup.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/cfgcleanup.c	2012-03-06 12:14:01.028439167 -0800
 @@ -68,7 +68,6 @@
  static bool try_crossjump_to_edge (int, edge, edge);
  static bool try_crossjump_bb (int, basic_block);
@@ -209,16 +211,15 @@
  static bool old_insns_match_p (int, rtx, rtx);
  
  static void merge_blocks_move_predecessor_nojumps (basic_block, basic_block);
-@@ -972,13 +971,27 @@
+@@ -977,13 +976,27 @@
       be filled that clobbers a parameter expected by the subroutine.
  
       ??? We take the simple route for now and assume that if they're
 -     equal, they were constructed identically.  */
--
++     equal, they were constructed identically.
+ 
 -  if (CALL_P (i1)
 -      && (!rtx_equal_p (CALL_INSN_FUNCTION_USAGE (i1),
-+     equal, they were constructed identically.
-+
 +     Also check for identical exception regions.  */
 +
 +  if (CALL_P (i1))
@@ -243,7 +244,7 @@
  
  #ifdef STACK_REGS
    /* If cross_jump_death_matters is not 0, the insn's mode
-@@ -1017,6 +1030,29 @@
+@@ -1022,6 +1035,29 @@
    return false;
  }
  
@@ -273,7 +274,7 @@
  /* Look through the insns at the end of BB1 and BB2 and find the longest
     sequence that are equivalent.  Store the first insns for that sequence
     in *F1 and *F2 and return the sequence length.
-@@ -1024,9 +1060,8 @@
+@@ -1029,9 +1065,8 @@
     To simplify callers of this function, if the blocks match exactly,
     store the head of the blocks in *F1 and *F2.  */
  
@@ -285,7 +286,7 @@
  {
    rtx i1, i2, last1, last2, afterlast1, afterlast2;
    int ninsns = 0;
-@@ -1066,7 +1101,7 @@
+@@ -1071,7 +1106,7 @@
        if (i1 == BB_HEAD (bb1) || i2 == BB_HEAD (bb2))
  	break;
  
@@ -294,7 +295,7 @@
  	break;
  
        merge_memattrs (i1, i2);
-@@ -1074,21 +1109,7 @@
+@@ -1079,21 +1114,7 @@
        /* Don't begin a cross-jump with a NOTE insn.  */
        if (INSN_P (i1))
  	{
@@ -317,7 +318,7 @@
  
  	  afterlast1 = last1, afterlast2 = last2;
  	  last1 = i1, last2 = i2;
-@@ -1130,6 +1151,97 @@
+@@ -1135,6 +1156,97 @@
    return ninsns;
  }
  
@@ -415,7 +416,7 @@
  /* Return true iff outgoing edges of BB1 and BB2 match, together with
     the branch instruction.  This means that if we commonize the control
     flow before end of the basic block, the semantic remains unchanged.
-@@ -1498,7 +1610,7 @@
+@@ -1503,7 +1615,7 @@
      return false;
  
    /* ... and part the second.  */
@@ -424,11 +425,11 @@
  
    /* Don't proceed with the crossjump unless we found a sufficient number
       of matching instructions or the 'from' block was totally matched
-
-=== modified file 'gcc/cfgexpand.c'
---- old/gcc/cfgexpand.c	2010-05-14 17:11:03 +0000
-+++ new/gcc/cfgexpand.c	2010-09-01 13:29:58 +0000
-@@ -3026,14 +3026,15 @@
+Index: gcc-4_5-branch/gcc/cfgexpand.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/cfgexpand.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/cfgexpand.c	2012-03-06 12:14:01.028439167 -0800
+@@ -3033,14 +3033,15 @@
        if (SCALAR_INT_MODE_P (GET_MODE (op0))
  	  && SCALAR_INT_MODE_P (mode))
  	{
@@ -448,11 +449,11 @@
  	  return gen_rtx_MULT (mode, op0, op1);
  	}
        return NULL;
-
-=== modified file 'gcc/config/arm/arm.c'
---- old/gcc/config/arm/arm.c	2010-08-31 10:00:27 +0000
-+++ new/gcc/config/arm/arm.c	2010-09-01 13:29:58 +0000
-@@ -8116,8 +8116,6 @@
+Index: gcc-4_5-branch/gcc/config/arm/arm.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/arm/arm.c	2012-03-06 12:11:35.000000000 -0800
++++ gcc-4_5-branch/gcc/config/arm/arm.c	2012-03-06 12:14:01.032439183 -0800
+@@ -8096,8 +8096,6 @@
  static bool
  xscale_sched_adjust_cost (rtx insn, rtx link, rtx dep, int * cost)
  {
@@ -461,7 +462,7 @@
    /* Some true dependencies can have a higher cost depending
       on precisely how certain input operands are used.  */
    if (REG_NOTE_KIND (link) == 0
-@@ -12166,6 +12164,60 @@
+@@ -12146,6 +12144,60 @@
    return result;
  }
  
@@ -522,7 +523,7 @@
  /* Gcc puts the pool in the wrong place for ARM, since we can only
     load addresses a limited distance around the pc.  We do some
     special munging to move the constant pool values to the correct
-@@ -12177,6 +12229,9 @@
+@@ -12157,6 +12209,9 @@
    HOST_WIDE_INT address = 0;
    Mfix * fix;
  
@@ -532,10 +533,10 @@
    minipool_fix_head = minipool_fix_tail = NULL;
  
    /* The first insn must always be a note, or the code below won't
-
-=== modified file 'gcc/config/arm/arm.h'
---- old/gcc/config/arm/arm.h	2010-08-13 11:11:15 +0000
-+++ new/gcc/config/arm/arm.h	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/config/arm/arm.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/arm/arm.h	2012-03-06 12:11:33.000000000 -0800
++++ gcc-4_5-branch/gcc/config/arm/arm.h	2012-03-06 12:14:01.032439183 -0800
 @@ -1133,7 +1133,11 @@
  }
  
@@ -549,10 +550,10 @@
  
  /* Interrupt functions can only use registers that have already been
     saved by the prologue, even if they would normally be
-
-=== modified file 'gcc/config/arm/arm.md'
---- old/gcc/config/arm/arm.md	2010-08-31 10:00:27 +0000
-+++ new/gcc/config/arm/arm.md	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/config/arm/arm.md
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/arm/arm.md	2012-03-06 12:11:35.000000000 -0800
++++ gcc-4_5-branch/gcc/config/arm/arm.md	2012-03-06 12:14:01.036439231 -0800
 @@ -4074,7 +4074,7 @@
  
  (define_split
@@ -562,10 +563,10 @@
    "!TARGET_THUMB2 && !arm_arch6"
    [(set (match_dup 0) (ashift:SI (match_dup 2) (const_int 16)))
     (set (match_dup 0) (lshiftrt:SI (match_dup 0) (const_int 16)))]
-
-=== modified file 'gcc/config/arm/thumb2.md'
---- old/gcc/config/arm/thumb2.md	2010-08-31 10:00:27 +0000
-+++ new/gcc/config/arm/thumb2.md	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/config/arm/thumb2.md
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/arm/thumb2.md	2012-03-06 12:11:35.000000000 -0800
++++ gcc-4_5-branch/gcc/config/arm/thumb2.md	2012-03-06 12:14:01.036439231 -0800
 @@ -1046,29 +1046,6 @@
    }"
  )
@@ -596,10 +597,10 @@
  (define_insn "*thumb2_alusi3_short"
    [(set (match_operand:SI          0 "s_register_operand" "=l")
          (match_operator:SI 3 "thumb_16bit_operator"
-
-=== modified file 'gcc/config/avr/avr.h'
---- old/gcc/config/avr/avr.h	2010-01-11 23:12:14 +0000
-+++ new/gcc/config/avr/avr.h	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/config/avr/avr.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/avr/avr.h	2012-03-06 11:53:21.000000000 -0800
++++ gcc-4_5-branch/gcc/config/avr/avr.h	2012-03-06 12:14:01.036439231 -0800
 @@ -232,7 +232,7 @@
      32,33,34,35					\
      }
@@ -609,10 +610,10 @@
  
  
  #define HARD_REGNO_NREGS(REGNO, MODE) ((GET_MODE_SIZE (MODE) + UNITS_PER_WORD - 1) / UNITS_PER_WORD)
-
-=== modified file 'gcc/config/i386/i386.h'
---- old/gcc/config/i386/i386.h	2010-04-27 19:14:19 +0000
-+++ new/gcc/config/i386/i386.h	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/config/i386/i386.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/i386/i386.h	2012-03-06 11:53:19.000000000 -0800
++++ gcc-4_5-branch/gcc/config/i386/i386.h	2012-03-06 12:14:01.036439231 -0800
 @@ -955,7 +955,7 @@
     registers listed in CALL_USED_REGISTERS, keeping the others
     available for storage of persistent values.
@@ -636,10 +637,10 @@
  
  
  #define OVERRIDE_ABI_FORMAT(FNDECL) ix86_call_abi_override (FNDECL)
-
-=== modified file 'gcc/config/mips/mips.h'
---- old/gcc/config/mips/mips.h	2009-10-29 17:39:52 +0000
-+++ new/gcc/config/mips/mips.h	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/config/mips/mips.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/mips/mips.h	2012-03-06 11:53:28.000000000 -0800
++++ gcc-4_5-branch/gcc/config/mips/mips.h	2012-03-06 12:14:01.040439261 -0800
 @@ -2059,12 +2059,12 @@
    182,183,184,185,186,187						\
  }
@@ -655,10 +656,10 @@
  
  /* True if VALUE is an unsigned 6-bit number.  */
  
-
-=== modified file 'gcc/config/picochip/picochip.h'
---- old/gcc/config/picochip/picochip.h	2009-11-04 11:06:36 +0000
-+++ new/gcc/config/picochip/picochip.h	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/config/picochip/picochip.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/picochip/picochip.h	2012-03-06 11:53:26.000000000 -0800
++++ gcc-4_5-branch/gcc/config/picochip/picochip.h	2012-03-06 12:14:01.040439261 -0800
 @@ -261,7 +261,7 @@
  /* We can dynamically change the REG_ALLOC_ORDER using the following hook.
     It would be desirable to change it for leaf functions so we can put
@@ -668,10 +669,10 @@
  
  /* How Values Fit in Registers  */
  
-
-=== modified file 'gcc/config/sparc/predicates.md'
---- old/gcc/config/sparc/predicates.md	2009-02-20 15:20:38 +0000
-+++ new/gcc/config/sparc/predicates.md	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/config/sparc/predicates.md
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/sparc/predicates.md	2012-03-06 11:53:17.000000000 -0800
++++ gcc-4_5-branch/gcc/config/sparc/predicates.md	2012-03-06 12:14:01.040439261 -0800
 @@ -1,5 +1,5 @@
  ;; Predicate definitions for SPARC.
 -;; Copyright (C) 2005, 2007, 2008 Free Software Foundation, Inc.
@@ -689,11 +690,11 @@
 -  (and (match_code "mem")
 -       (and (match_operand 0 "memory_operand")
 -	    (match_test "REG_P (XEXP (op, 0))"))))
-
-=== modified file 'gcc/config/sparc/sparc.h'
---- old/gcc/config/sparc/sparc.h	2010-04-02 18:54:46 +0000
-+++ new/gcc/config/sparc/sparc.h	2010-09-01 13:29:58 +0000
-@@ -1181,7 +1181,7 @@
+Index: gcc-4_5-branch/gcc/config/sparc/sparc.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/sparc/sparc.h	2012-03-06 11:53:17.000000000 -0800
++++ gcc-4_5-branch/gcc/config/sparc/sparc.h	2012-03-06 12:14:01.040439261 -0800
+@@ -1188,7 +1188,7 @@
    96, 97, 98, 99,			/* %fcc0-3 */	\
    100, 0, 14, 30, 31, 101}		/* %icc, %g0, %o6, %i6, %i7, %sfp */
  
@@ -702,10 +703,10 @@
  
  extern char sparc_leaf_regs[];
  #define LEAF_REGISTERS sparc_leaf_regs
-
-=== modified file 'gcc/config/sparc/sync.md'
---- old/gcc/config/sparc/sync.md	2009-02-20 15:20:38 +0000
-+++ new/gcc/config/sparc/sync.md	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/config/sparc/sync.md
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/sparc/sync.md	2012-03-06 11:53:17.000000000 -0800
++++ gcc-4_5-branch/gcc/config/sparc/sync.md	2012-03-06 12:14:01.040439261 -0800
 @@ -1,5 +1,5 @@
  ;; GCC machine description for SPARC synchronization instructions.
 -;; Copyright (C) 2005, 2007, 2009
@@ -766,10 +767,10 @@
    return "srlx\t%L3, 32, %H3";
  }
    [(set_attr "type" "multi")
-
-=== modified file 'gcc/config/xtensa/xtensa.h'
---- old/gcc/config/xtensa/xtensa.h	2009-09-23 21:24:42 +0000
-+++ new/gcc/config/xtensa/xtensa.h	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/config/xtensa/xtensa.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/xtensa/xtensa.h	2012-03-06 11:53:21.000000000 -0800
++++ gcc-4_5-branch/gcc/config/xtensa/xtensa.h	2012-03-06 12:14:01.040439261 -0800
 @@ -286,7 +286,7 @@
     incoming argument in a2 is live throughout the function and
     local-alloc decides to use a2, then the incoming argument must
@@ -788,10 +789,10 @@
  
  /* For Xtensa, the only point of this is to prevent GCC from otherwise
     giving preference to call-used registers.  To minimize window
-
-=== modified file 'gcc/doc/tm.texi'
---- old/gcc/doc/tm.texi	2010-08-13 11:53:46 +0000
-+++ new/gcc/doc/tm.texi	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/doc/tm.texi
+===================================================================
+--- gcc-4_5-branch.orig/gcc/doc/tm.texi	2012-03-06 12:11:33.000000000 -0800
++++ gcc-4_5-branch/gcc/doc/tm.texi	2012-03-06 12:14:01.044439265 -0800
 @@ -2093,7 +2093,7 @@
  the highest numbered allocable register first.
  @end defmac
@@ -817,11 +818,11 @@
  @defmac IRA_HARD_REGNO_ADD_COST_MULTIPLIER (@var{regno})
  In some case register allocation order is not enough for the
  Integrated Register Allocator (@acronym{IRA}) to generate a good code.
-
-=== modified file 'gcc/expmed.c'
---- old/gcc/expmed.c	2010-03-03 22:10:17 +0000
-+++ new/gcc/expmed.c	2010-09-01 13:29:58 +0000
-@@ -3253,6 +3253,55 @@
+Index: gcc-4_5-branch/gcc/expmed.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/expmed.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/expmed.c	2012-03-06 12:14:01.044439265 -0800
+@@ -3255,6 +3255,55 @@
    gcc_assert (op0);
    return op0;
  }
@@ -877,11 +878,11 @@
  
  /* Return the smallest n such that 2**n >= X.  */
  
-
-=== modified file 'gcc/expr.c'
---- old/gcc/expr.c	2010-08-20 16:21:01 +0000
-+++ new/gcc/expr.c	2010-09-01 13:29:58 +0000
-@@ -7224,7 +7224,6 @@
+Index: gcc-4_5-branch/gcc/expr.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/expr.c	2012-03-06 12:11:34.000000000 -0800
++++ gcc-4_5-branch/gcc/expr.c	2012-03-06 12:46:21.548533151 -0800
+@@ -7345,7 +7345,6 @@
    optab this_optab;
    rtx subtarget, original_target;
    int ignore;
@@ -889,7 +890,7 @@
    bool reduce_bit_field;
    gimple subexp0_def, subexp1_def;
    tree top0, top1;
-@@ -7679,13 +7678,7 @@
+@@ -7800,13 +7799,7 @@
  
        goto binop2;
  
@@ -904,7 +905,7 @@
        /* If first operand is constant, swap them.
  	 Thus the following special case checks need only
  	 check the second operand.  */
-@@ -7696,96 +7689,35 @@
+@@ -7817,96 +7810,35 @@
  	  treeop1 = t1;
  	}
  
@@ -1015,7 +1016,7 @@
  	  enum machine_mode innermode = TYPE_MODE (op0type);
  	  bool zextend_p = TYPE_UNSIGNED (op0type);
  	  optab other_optab = zextend_p ? smul_widen_optab : umul_widen_optab;
-@@ -7795,24 +7727,22 @@
+@@ -7916,24 +7848,22 @@
  	    {
  	      if (optab_handler (this_optab, mode)->insn_code != CODE_FOR_nothing)
  		{
@@ -1051,7 +1052,7 @@
  		  temp = expand_binop (mode, other_optab, op0, op1, target,
  				       unsignedp, OPTAB_LIB_WIDEN);
  		  hipart = gen_highpart (innermode, temp);
-@@ -7825,7 +7755,53 @@
+@@ -7946,7 +7876,53 @@
  		}
  	    }
  	}
@@ -1106,7 +1107,7 @@
        return REDUCE_BIT_FIELD (expand_mult (mode, op0, op1, target, unsignedp));
  
      case TRUNC_DIV_EXPR:
-@@ -8311,6 +8287,8 @@
+@@ -8435,6 +8411,8 @@
    location_t loc = EXPR_LOCATION (exp);
    struct separate_ops ops;
    tree treeop0, treeop1, treeop2;
@@ -1115,7 +1116,7 @@
  
    type = TREE_TYPE (exp);
    mode = TYPE_MODE (type);
-@@ -8423,15 +8401,17 @@
+@@ -8547,15 +8525,17 @@
  	 base variable.  This unnecessarily allocates a pseudo, see how we can
  	 reuse it, if partition base vars have it set already.  */
        if (!currently_expanding_to_rtl)
@@ -1142,22 +1143,11 @@
        goto expand_decl_rtl;
  
      case PARM_DECL:
-@@ -8533,15 +8513,21 @@
-       /* If the mode of DECL_RTL does not match that of the decl, it
- 	 must be a promoted value.  We return a SUBREG of the wanted mode,
- 	 but mark it so that we know that it was already extended.  */
--
--      if (REG_P (decl_rtl)
--	  && GET_MODE (decl_rtl) != DECL_MODE (exp))
-+      if (REG_P (decl_rtl) && GET_MODE (decl_rtl) != DECL_MODE (exp))
- 	{
- 	  enum machine_mode pmode;
+@@ -8669,7 +8649,15 @@
  
--	  /* Get the signedness used for this variable.  Ensure we get the
--	     same mode we got when the variable was declared.  */
+ 	  /* Get the signedness used for this variable.  Ensure we get the
+ 	     same mode we got when the variable was declared.  */
 -	  pmode = promote_decl_mode (exp, &unsignedp);
-+	  /* Get the signedness to be used for this variable.  Ensure we get
-+	     the same mode we got when the variable was declared.  */
 +	  if (code == SSA_NAME
 +	      && (g = SSA_NAME_DEF_STMT (ssa_name))
 +	      && gimple_code (g) == GIMPLE_CALL)
@@ -1170,11 +1160,11 @@
  	  gcc_assert (GET_MODE (decl_rtl) == pmode);
  
  	  temp = gen_lowpart_SUBREG (mode, decl_rtl);
-
-=== modified file 'gcc/fold-const.c'
---- old/gcc/fold-const.c	2010-04-06 09:36:57 +0000
-+++ new/gcc/fold-const.c	2010-09-01 13:29:58 +0000
-@@ -5741,6 +5741,76 @@
+Index: gcc-4_5-branch/gcc/fold-const.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/fold-const.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/fold-const.c	2012-03-06 12:14:01.052439240 -0800
+@@ -5749,6 +5749,76 @@
  		       const_binop (BIT_XOR_EXPR, c, temp, 0));
  }
  
@@ -1251,7 +1241,7 @@
  /* Find ways of folding logical expressions of LHS and RHS:
     Try to merge two comparisons to the same innermost item.
     Look for range tests like "ch >= '0' && ch <= '9'".
-@@ -12539,6 +12609,22 @@
+@@ -12553,6 +12623,22 @@
        if (0 != (tem = fold_range_test (loc, code, type, op0, op1)))
  	return tem;
  
@@ -1274,10 +1264,10 @@
        /* Check for the possibility of merging component references.  If our
  	 lhs is another similar operation, try to merge its rhs with our
  	 rhs.  Then try to merge our lhs and rhs.  */
-
-=== modified file 'gcc/ifcvt.c'
---- old/gcc/ifcvt.c	2010-04-02 18:54:46 +0000
-+++ new/gcc/ifcvt.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/ifcvt.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/ifcvt.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/ifcvt.c	2012-03-06 12:14:01.052439240 -0800
 @@ -385,7 +385,11 @@
    rtx false_expr;		/* test for then block insns */
    rtx true_prob_val;		/* probability of else block */
@@ -1395,11 +1385,11 @@
    merge_if_block (ce_info);
    cond_exec_changed_p = TRUE;
    return TRUE;
-
-=== modified file 'gcc/ira-color.c'
---- old/gcc/ira-color.c	2010-04-02 18:54:46 +0000
-+++ new/gcc/ira-color.c	2010-09-01 13:29:58 +0000
-@@ -441,14 +441,18 @@
+Index: gcc-4_5-branch/gcc/ira-color.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/ira-color.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/ira-color.c	2012-03-06 12:14:01.056439222 -0800
+@@ -447,14 +447,18 @@
  {
    HARD_REG_SET conflicting_regs;
    int i, j, k, hard_regno, best_hard_regno, class_size;
@@ -1420,7 +1410,7 @@
  #ifdef STACK_REGS
    bool no_stack_reg_p;
  #endif
-@@ -586,6 +590,7 @@
+@@ -592,6 +596,7 @@
  	continue;
        cost = costs[i];
        full_cost = full_costs[i];
@@ -1428,7 +1418,7 @@
        if (! allocated_hardreg_p[hard_regno]
  	  && ira_hard_reg_not_in_set_p (hard_regno, mode, call_used_reg_set))
  	/* We need to save/restore the hard register in
-@@ -598,6 +603,7 @@
+@@ -604,6 +609,7 @@
  	  cost += add_cost;
  	  full_cost += add_cost;
  	}
@@ -1436,10 +1426,10 @@
        if (min_cost > cost)
  	min_cost = cost;
        if (min_full_cost > full_cost)
-
-=== modified file 'gcc/ira-costs.c'
---- old/gcc/ira-costs.c	2010-08-13 11:40:17 +0000
-+++ new/gcc/ira-costs.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/ira-costs.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/ira-costs.c	2012-03-06 12:11:33.000000000 -0800
++++ gcc-4_5-branch/gcc/ira-costs.c	2012-03-06 12:14:01.056439222 -0800
 @@ -33,6 +33,7 @@
  #include "addresses.h"
  #include "insn-config.h"
@@ -1525,10 +1515,10 @@
 +  else
 +    regno_equiv_gains[regno] += cost;
 +}
-
-=== modified file 'gcc/ira.c'
---- old/gcc/ira.c	2010-08-12 13:51:16 +0000
-+++ new/gcc/ira.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/ira.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/ira.c	2012-03-06 12:11:32.000000000 -0800
++++ gcc-4_5-branch/gcc/ira.c	2012-03-06 12:14:01.056439222 -0800
 @@ -431,9 +431,6 @@
    HARD_REG_SET processed_hard_reg_set;
  
@@ -1564,7 +1554,7 @@
  	    {
  	      /* It can happen that a REG_EQUIV note contains a MEM
  		 that is not a legitimate memory operand.  As later
-@@ -3097,8 +3093,19 @@
+@@ -3096,8 +3092,19 @@
    if (dump_file)
      print_insn_chains (dump_file);
  }
@@ -1585,7 +1575,7 @@
  
  /* All natural loops.  */
  struct loops ira_loops;
-@@ -3203,6 +3210,8 @@
+@@ -3202,6 +3209,8 @@
    record_loop_exits ();
    current_loops = &ira_loops;
  
@@ -1594,7 +1584,7 @@
    if (internal_flag_ira_verbose > 0 && ira_dump_file != NULL)
      fprintf (ira_dump_file, "Building IRA IR\n");
    loops_p = ira_build (optimize
-@@ -3263,13 +3272,8 @@
+@@ -3265,13 +3274,8 @@
  #endif
  
    delete_trivially_dead_insns (get_insns (), max_reg_num ());
@@ -1609,19 +1599,19 @@
  
    if (max_regno != max_regno_before_ira)
      {
-
-=== modified file 'gcc/ira.h'
---- old/gcc/ira.h	2009-09-02 17:54:25 +0000
-+++ new/gcc/ira.h	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/ira.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/ira.h	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/ira.h	2012-03-06 12:14:01.056439222 -0800
 @@ -87,3 +87,4 @@
  extern void ira_mark_new_stack_slot (rtx, int, unsigned int);
  extern bool ira_better_spill_reload_regno_p (int *, int *, rtx, rtx, rtx);
  
 +extern void ira_adjust_equiv_reg_cost (unsigned, int);
-
-=== modified file 'gcc/optabs.h'
---- old/gcc/optabs.h	2009-11-25 10:55:54 +0000
-+++ new/gcc/optabs.h	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/optabs.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/optabs.h	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/optabs.h	2012-03-06 12:14:01.056439222 -0800
 @@ -771,6 +771,9 @@
  /* Generate code for float to integral conversion.  */
  extern bool expand_sfix_optab (rtx, rtx, convert_optab);
@@ -1632,10 +1622,10 @@
  /* Return tree if target supports vector operations for COND_EXPR.  */
  bool expand_vec_cond_expr_p (tree, enum machine_mode);
  
-
-=== modified file 'gcc/passes.c'
---- old/gcc/passes.c	2010-05-19 12:14:37 +0000
-+++ new/gcc/passes.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/passes.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/passes.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/passes.c	2012-03-06 12:14:01.056439222 -0800
 @@ -944,6 +944,7 @@
        NEXT_PASS (pass_forwprop);
        NEXT_PASS (pass_phiopt);
@@ -1644,10 +1634,10 @@
        NEXT_PASS (pass_tail_calls);
        NEXT_PASS (pass_rename_ssa_copies);
        NEXT_PASS (pass_uncprop);
-
-=== modified file 'gcc/reload.h'
---- old/gcc/reload.h	2010-04-02 18:54:46 +0000
-+++ new/gcc/reload.h	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/reload.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/reload.h	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/reload.h	2012-03-06 12:14:01.056439222 -0800
 @@ -347,6 +347,10 @@
  extern rtx eliminate_regs (rtx, enum machine_mode, rtx);
  extern bool elimination_target_reg_p (rtx);
@@ -1659,10 +1649,10 @@
  /* Deallocate the reload register used by reload number R.  */
  extern void deallocate_reload_reg (int r);
  
-
-=== modified file 'gcc/reload1.c'
---- old/gcc/reload1.c	2010-03-02 18:56:50 +0000
-+++ new/gcc/reload1.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/reload1.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/reload1.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/reload1.c	2012-03-06 12:14:01.060439213 -0800
 @@ -413,6 +413,7 @@
  static void set_label_offsets (rtx, rtx, int);
  static void check_eliminable_occurrences (rtx);
@@ -1683,7 +1673,7 @@
  static void spill_hard_reg (unsigned int, int);
  static int finish_spills (int);
  static void scan_paradoxical_subregs (rtx);
-@@ -698,6 +702,9 @@
+@@ -697,6 +701,9 @@
  
  /* Global variables used by reload and its subroutines.  */
  
@@ -1693,7 +1683,7 @@
  /* Set during calculate_needs if an insn needs register elimination.  */
  static int something_needs_elimination;
  /* Set during calculate_needs if an insn needs an operand changed.  */
-@@ -776,22 +783,6 @@
+@@ -775,22 +782,6 @@
        if (! call_used_regs[i] && ! fixed_regs[i] && ! LOCAL_REGNO (i))
  	df_set_regs_ever_live (i, true);
  
@@ -1716,7 +1706,7 @@
    reg_old_renumber = XCNEWVEC (short, max_regno);
    memcpy (reg_old_renumber, reg_renumber, max_regno * sizeof (short));
    pseudo_forbidden_regs = XNEWVEC (HARD_REG_SET, max_regno);
-@@ -799,115 +790,9 @@
+@@ -798,115 +789,9 @@
  
    CLEAR_HARD_REG_SET (bad_spill_regs_global);
  
@@ -1833,13 +1823,11 @@
    /* Alter each pseudo-reg rtx to contain its hard reg number.  Assign
       stack slots to the pseudos that lack hard regs or equivalents.
       Do not touch virtual registers.  */
-@@ -1411,31 +1296,11 @@
+@@ -1410,31 +1295,11 @@
  	}
      }
  
-+  free (temp_pseudo_reg_arr);
-+
-   /* Indicate that we no longer have known memory locations or constants.  */
+-  /* Indicate that we no longer have known memory locations or constants.  */
 -  if (reg_equiv_constant)
 -    free (reg_equiv_constant);
 -  if (reg_equiv_invariant)
@@ -1849,8 +1837,8 @@
 -  VEC_free (rtx, gc, reg_equiv_memory_loc_vec);
 -  reg_equiv_memory_loc = 0;
 -
--  free (temp_pseudo_reg_arr);
--
+   free (temp_pseudo_reg_arr);
+ 
 -  if (offsets_known_at)
 -    free (offsets_known_at);
 -  if (offsets_at)
@@ -1862,13 +1850,14 @@
 -  free (reg_equiv_alt_mem_list);
 -
 -  free (reg_equiv_mem);
++  /* Indicate that we no longer have known memory locations or constants.  */
 +  free_reg_equiv ();
    reg_equiv_init = 0;
 -  free (reg_equiv_address);
    free (reg_max_ref_width);
    free (reg_old_renumber);
    free (pseudo_previous_regs);
-@@ -1728,6 +1593,100 @@
+@@ -1727,6 +1592,100 @@
    *pprev_reload = 0;
  }
  
@@ -1969,7 +1958,7 @@
  /* Comparison function for qsort to decide which of two reloads
     should be handled first.  *P1 and *P2 are the reload numbers.  */
  
-@@ -2514,6 +2473,36 @@
+@@ -2513,6 +2472,36 @@
      }
  }
  
@@ -2006,7 +1995,7 @@
  /* Scan X and replace any eliminable registers (such as fp) with a
     replacement (such as sp), plus an offset.
  
-@@ -2533,6 +2522,9 @@
+@@ -2532,6 +2521,9 @@
     This means, do not set ref_outside_mem even if the reference
     is outside of MEMs.
  
@@ -2016,7 +2005,7 @@
     REG_EQUIV_MEM and REG_EQUIV_ADDRESS contain address that have had
     replacements done assuming all offsets are at their initial values.  If
     they are not, or if REG_EQUIV_ADDRESS is nonzero for a pseudo we
-@@ -2541,7 +2533,7 @@
+@@ -2540,7 +2532,7 @@
  
  static rtx
  eliminate_regs_1 (rtx x, enum machine_mode mem_mode, rtx insn,
@@ -2025,7 +2014,7 @@
  {
    enum rtx_code code = GET_CODE (x);
    struct elim_table *ep;
-@@ -2589,11 +2581,12 @@
+@@ -2588,11 +2580,12 @@
  	{
  	  if (may_use_invariant || (insn && DEBUG_INSN_P (insn)))
  	    return eliminate_regs_1 (copy_rtx (reg_equiv_invariant[regno]),
@@ -2040,7 +2029,7 @@
  	}
        return x;
  
-@@ -2654,8 +2647,10 @@
+@@ -2653,8 +2646,10 @@
  	 operand of a load-address insn.  */
  
        {
@@ -2053,7 +2042,7 @@
  
  	if (reg_renumber && (new0 != XEXP (x, 0) || new1 != XEXP (x, 1)))
  	  {
-@@ -2729,9 +2724,11 @@
+@@ -2728,9 +2723,11 @@
      case GE:       case GT:       case GEU:    case GTU:
      case LE:       case LT:       case LEU:    case LTU:
        {
@@ -2067,7 +2056,7 @@
  
  	if (new0 != XEXP (x, 0) || new1 != XEXP (x, 1))
  	  return gen_rtx_fmt_ee (code, GET_MODE (x), new0, new1);
-@@ -2742,7 +2739,8 @@
+@@ -2741,7 +2738,8 @@
        /* If we have something in XEXP (x, 0), the usual case, eliminate it.  */
        if (XEXP (x, 0))
  	{
@@ -2077,7 +2066,7 @@
  	  if (new_rtx != XEXP (x, 0))
  	    {
  	      /* If this is a REG_DEAD note, it is not valid anymore.
-@@ -2750,7 +2748,8 @@
+@@ -2749,7 +2747,8 @@
  		 REG_DEAD note for the stack or frame pointer.  */
  	      if (REG_NOTE_KIND (x) == REG_DEAD)
  		return (XEXP (x, 1)
@@ -2087,7 +2076,7 @@
  			: NULL_RTX);
  
  	      x = alloc_reg_note (REG_NOTE_KIND (x), new_rtx, XEXP (x, 1));
-@@ -2765,7 +2764,8 @@
+@@ -2764,7 +2763,8 @@
  	 strictly needed, but it simplifies the code.  */
        if (XEXP (x, 1))
  	{
@@ -2097,7 +2086,7 @@
  	  if (new_rtx != XEXP (x, 1))
  	    return
  	      gen_rtx_fmt_ee (GET_CODE (x), GET_MODE (x), XEXP (x, 0), new_rtx);
-@@ -2791,7 +2791,7 @@
+@@ -2790,7 +2790,7 @@
  	  && XEXP (XEXP (x, 1), 0) == XEXP (x, 0))
  	{
  	  rtx new_rtx = eliminate_regs_1 (XEXP (XEXP (x, 1), 1), mem_mode,
@@ -2106,7 +2095,7 @@
  
  	  if (new_rtx != XEXP (XEXP (x, 1), 1))
  	    return gen_rtx_fmt_ee (code, GET_MODE (x), XEXP (x, 0),
-@@ -2814,7 +2814,8 @@
+@@ -2813,7 +2813,8 @@
      case POPCOUNT:
      case PARITY:
      case BSWAP:
@@ -2116,7 +2105,7 @@
        if (new_rtx != XEXP (x, 0))
  	return gen_rtx_fmt_e (code, GET_MODE (x), new_rtx);
        return x;
-@@ -2835,7 +2836,8 @@
+@@ -2834,7 +2835,8 @@
  	  new_rtx = SUBREG_REG (x);
  	}
        else
@@ -2126,7 +2115,7 @@
  
        if (new_rtx != SUBREG_REG (x))
  	{
-@@ -2869,14 +2871,20 @@
+@@ -2868,14 +2870,20 @@
        /* Our only special processing is to pass the mode of the MEM to our
  	 recursive call and copy the flags.  While we are here, handle this
  	 case more efficiently.  */
@@ -2152,7 +2141,7 @@
        if (new_rtx != XEXP (x, 0))
  	return gen_rtx_USE (GET_MODE (x), new_rtx);
        return x;
-@@ -2900,7 +2908,8 @@
+@@ -2899,7 +2907,8 @@
      {
        if (*fmt == 'e')
  	{
@@ -2162,7 +2151,7 @@
  	  if (new_rtx != XEXP (x, i) && ! copied)
  	    {
  	      x = shallow_copy_rtx (x);
-@@ -2913,7 +2922,8 @@
+@@ -2912,7 +2921,8 @@
  	  int copied_vec = 0;
  	  for (j = 0; j < XVECLEN (x, i); j++)
  	    {
@@ -2172,7 +2161,7 @@
  	      if (new_rtx != XVECEXP (x, i, j) && ! copied_vec)
  		{
  		  rtvec new_v = gen_rtvec_v (XVECLEN (x, i),
-@@ -2937,7 +2947,7 @@
+@@ -2936,7 +2946,7 @@
  rtx
  eliminate_regs (rtx x, enum machine_mode mem_mode, rtx insn)
  {
@@ -2181,7 +2170,7 @@
  }
  
  /* Scan rtx X for modifications of elimination target registers.  Update
-@@ -3455,7 +3465,8 @@
+@@ -3454,7 +3464,8 @@
  	  /* Companion to the above plus substitution, we can allow
  	     invariants as the source of a plain move.  */
  	  is_set_src = false;
@@ -2191,7 +2180,7 @@
  	    is_set_src = true;
  	  in_plus = false;
  	  if (plus_src
-@@ -3466,7 +3477,7 @@
+@@ -3465,7 +3476,7 @@
  	  substed_operand[i]
  	    = eliminate_regs_1 (recog_data.operand[i], VOIDmode,
  			        replace ? insn : NULL_RTX,
@@ -2200,7 +2189,7 @@
  	  if (substed_operand[i] != orig_operand[i])
  	    val = 1;
  	  /* Terminate the search in check_eliminable_occurrences at
-@@ -3594,11 +3605,167 @@
+@@ -3593,11 +3604,167 @@
       the pre-passes.  */
    if (val && REG_NOTES (insn) != 0)
      REG_NOTES (insn)
@@ -2369,7 +2358,7 @@
  /* Loop through all elimination pairs.
     Recalculate the number not at initial offset.
  
-@@ -3908,6 +4075,168 @@
+@@ -3907,6 +4074,168 @@
        ep->to_rtx = gen_rtx_REG (Pmode, ep->to);
      }
  }
@@ -2547,10 +2536,10 @@
      return 1;
    return 0;
  }
-
-=== modified file 'gcc/system.h'
---- old/gcc/system.h	2009-12-13 23:00:53 +0000
-+++ new/gcc/system.h	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/system.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/system.h	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/system.h	2012-03-06 12:14:01.060439213 -0800
 @@ -761,7 +761,8 @@
  	TARGET_ASM_EXCEPTION_SECTION TARGET_ASM_EH_FRAME_SECTION	   \
  	SMALL_ARG_MAX ASM_OUTPUT_SHARED_BSS ASM_OUTPUT_SHARED_COMMON	   \
@@ -2561,10 +2550,10 @@
  
  /* Hooks that are no longer used.  */
   #pragma GCC poison LANG_HOOKS_FUNCTION_MARK LANG_HOOKS_FUNCTION_FREE	\
-
-=== added file 'gcc/testsuite/c-c++-common/uninit-17.c'
---- old/gcc/testsuite/c-c++-common/uninit-17.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/c-c++-common/uninit-17.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/testsuite/c-c++-common/uninit-17.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/c-c++-common/uninit-17.c	2012-03-06 12:14:01.060439213 -0800
 @@ -0,0 +1,25 @@
 +/* { dg-do compile } */
 +/* { dg-options "-O2 -Wuninitialized" } */
@@ -2591,10 +2580,10 @@
 +  bar(foo(a), ptr);
 +}
 +
-
-=== added file 'gcc/testsuite/gcc.target/arm/eliminate.c'
---- old/gcc/testsuite/gcc.target/arm/eliminate.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/arm/eliminate.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/arm/eliminate.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/arm/eliminate.c	2012-03-06 12:14:01.060439213 -0800
 @@ -0,0 +1,19 @@
 +/* { dg-do compile } */
 +/* { dg-options "-O2" }  */
@@ -2615,10 +2604,10 @@
 +}
 +
 +/* { dg-final { scan-assembler-times "r0,\[\\t \]*sp" 3 } } */
-
-=== added file 'gcc/testsuite/gcc.target/arm/pr40900.c'
---- old/gcc/testsuite/gcc.target/arm/pr40900.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/arm/pr40900.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/arm/pr40900.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/arm/pr40900.c	2012-03-06 12:14:01.060439213 -0800
 @@ -0,0 +1,12 @@
 +/* { dg-do compile } */
 +/* { dg-options "-O2 -fno-optimize-sibling-calls" }  */
@@ -2632,10 +2621,10 @@
 +/* { dg-final { scan-assembler-not "lsl" } } */
 +/* { dg-final { scan-assembler-not "asr" } } */
 +/* { dg-final { scan-assembler-not "sxth" } } */
-
-=== added file 'gcc/testsuite/gcc.target/arm/pr42496.c'
---- old/gcc/testsuite/gcc.target/arm/pr42496.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/arm/pr42496.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/arm/pr42496.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/arm/pr42496.c	2012-03-06 12:14:01.060439213 -0800
 @@ -0,0 +1,16 @@
 +/* { dg-options "-O2" }  */
 +
@@ -2653,10 +2642,10 @@
 +
 +/* { dg-final { scan-assembler-not "strne" } } */
 +/* { dg-final { scan-assembler-not "streq" } } */
-
-=== added file 'gcc/testsuite/gcc.target/arm/wmul-1.c'
---- old/gcc/testsuite/gcc.target/arm/wmul-1.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/arm/wmul-1.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/arm/wmul-1.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/arm/wmul-1.c	2012-03-06 12:14:01.060439213 -0800
 @@ -0,0 +1,18 @@
 +/* { dg-do compile } */
 +/* { dg-options "-O2 -march=armv6t2 -fno-unroll-loops" } */
@@ -2676,10 +2665,10 @@
 +}
 +
 +/* { dg-final { scan-assembler-times "smulbb" 2 } } */
-
-=== added file 'gcc/testsuite/gcc.target/arm/wmul-2.c'
---- old/gcc/testsuite/gcc.target/arm/wmul-2.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/arm/wmul-2.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/arm/wmul-2.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/arm/wmul-2.c	2012-03-06 12:14:01.064439219 -0800
 @@ -0,0 +1,12 @@
 +/* { dg-do compile } */
 +/* { dg-options "-O2 -march=armv6t2 -fno-unroll-loops" } */
@@ -2693,10 +2682,10 @@
 +}
 +
 +/* { dg-final { scan-assembler-times "smulbb" 1 } } */
-
-=== added file 'gcc/testsuite/gcc.target/bfin/wmul-1.c'
---- old/gcc/testsuite/gcc.target/bfin/wmul-1.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/bfin/wmul-1.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/bfin/wmul-1.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/bfin/wmul-1.c	2012-03-06 12:14:01.064439219 -0800
 @@ -0,0 +1,18 @@
 +/* { dg-do compile } */
 +/* { dg-options "-O2" } */
@@ -2716,10 +2705,10 @@
 +}
 +
 +/* { dg-final { scan-assembler-times "\\(IS\\)" 2 } } */
-
-=== added file 'gcc/testsuite/gcc.target/bfin/wmul-2.c'
---- old/gcc/testsuite/gcc.target/bfin/wmul-2.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/bfin/wmul-2.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/bfin/wmul-2.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/bfin/wmul-2.c	2012-03-06 12:14:01.064439219 -0800
 @@ -0,0 +1,12 @@
 +/* { dg-do compile } */
 +/* { dg-options "-O2" } */
@@ -2733,10 +2722,10 @@
 +}
 +
 +/* { dg-final { scan-assembler-times "\\(IS\\)" 1 } } */
-
-=== added file 'gcc/testsuite/gcc.target/i386/pr41442.c'
---- old/gcc/testsuite/gcc.target/i386/pr41442.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/i386/pr41442.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/i386/pr41442.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/i386/pr41442.c	2012-03-06 12:14:01.064439219 -0800
 @@ -0,0 +1,18 @@
 +/* { dg-do compile } */
 +/* { dg-options "-O2" } */
@@ -2756,10 +2745,10 @@
 +}
 +
 +/* { dg-final { scan-assembler-times "test|cmp" 2 } } */
-
-=== added file 'gcc/testsuite/gcc.target/i386/wmul-1.c'
---- old/gcc/testsuite/gcc.target/i386/wmul-1.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/i386/wmul-1.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/i386/wmul-1.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/i386/wmul-1.c	2012-03-06 12:14:01.064439219 -0800
 @@ -0,0 +1,18 @@
 +/* { dg-do compile } */
 +/* { dg-options "-O2" } */
@@ -2779,10 +2768,10 @@
 +}
 +
 +/* { dg-final { scan-assembler-times "imull" 2 } } */
-
-=== added file 'gcc/testsuite/gcc.target/i386/wmul-2.c'
---- old/gcc/testsuite/gcc.target/i386/wmul-2.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/i386/wmul-2.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/i386/wmul-2.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/i386/wmul-2.c	2012-03-06 12:14:01.064439219 -0800
 @@ -0,0 +1,12 @@
 +/* { dg-do compile } */
 +/* { dg-options "-O2" } */
@@ -2796,29 +2785,29 @@
 +}
 +
 +/* { dg-final { scan-assembler-times "imull" 1 } } */
-
-=== modified file 'gcc/tree-cfg.c'
---- old/gcc/tree-cfg.c	2010-08-10 13:31:21 +0000
-+++ new/gcc/tree-cfg.c	2010-09-01 13:29:58 +0000
-@@ -3428,8 +3428,13 @@
+Index: gcc-4_5-branch/gcc/tree-cfg.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-cfg.c	2012-03-06 12:11:30.000000000 -0800
++++ gcc-4_5-branch/gcc/tree-cfg.c	2012-03-06 12:14:01.064439219 -0800
+@@ -3429,8 +3429,13 @@
  	 connected to the operand types.  */
        return verify_gimple_comparison (lhs_type, rhs1, rhs2);
  
-+    case WIDEN_MULT_EXPR:
+-    case WIDEN_SUM_EXPR:
+     case WIDEN_MULT_EXPR:
 +      if (TREE_CODE (lhs_type) != INTEGER_TYPE)
 +	return true;
 +      return ((2 * TYPE_PRECISION (rhs1_type) != TYPE_PRECISION (lhs_type))
 +	      || (TYPE_PRECISION (rhs1_type) != TYPE_PRECISION (rhs2_type)));
 +
-     case WIDEN_SUM_EXPR:
--    case WIDEN_MULT_EXPR:
++    case WIDEN_SUM_EXPR:
      case VEC_WIDEN_MULT_HI_EXPR:
      case VEC_WIDEN_MULT_LO_EXPR:
      case VEC_PACK_TRUNC_EXPR:
-
-=== modified file 'gcc/tree-inline.c'
---- old/gcc/tree-inline.c	2010-08-10 13:31:21 +0000
-+++ new/gcc/tree-inline.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/tree-inline.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-inline.c	2012-03-06 12:11:30.000000000 -0800
++++ gcc-4_5-branch/gcc/tree-inline.c	2012-03-06 12:14:01.064439219 -0800
 @@ -229,6 +229,7 @@
  	     regions of the CFG, but this is expensive to test.  */
  	  if (id->entry_bb
@@ -2827,10 +2816,10 @@
  	      && TREE_CODE (SSA_NAME_VAR (name)) != PARM_DECL
  	      && (id->entry_bb != EDGE_SUCC (ENTRY_BLOCK_PTR, 0)->dest
  		  || EDGE_COUNT (id->entry_bb->preds) != 1))
-
-=== modified file 'gcc/tree-pass.h'
---- old/gcc/tree-pass.h	2010-04-02 18:54:46 +0000
-+++ new/gcc/tree-pass.h	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/tree-pass.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-pass.h	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/tree-pass.h	2012-03-06 12:14:01.068439233 -0800
 @@ -407,6 +407,7 @@
  extern struct gimple_opt_pass pass_cse_reciprocals;
  extern struct gimple_opt_pass pass_cse_sincos;
@@ -2839,11 +2828,11 @@
  extern struct gimple_opt_pass pass_warn_function_return;
  extern struct gimple_opt_pass pass_warn_function_noreturn;
  extern struct gimple_opt_pass pass_cselim;
-
-=== modified file 'gcc/tree-ssa-math-opts.c'
---- old/gcc/tree-ssa-math-opts.c	2010-04-02 18:54:46 +0000
-+++ new/gcc/tree-ssa-math-opts.c	2010-09-01 13:29:58 +0000
-@@ -1260,3 +1260,137 @@
+Index: gcc-4_5-branch/gcc/tree-ssa-math-opts.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-ssa-math-opts.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/tree-ssa-math-opts.c	2012-03-06 12:14:01.068439233 -0800
+@@ -1269,3 +1269,137 @@
    0                                     /* todo_flags_finish */
   }
  };
@@ -2981,10 +2970,10 @@
 +  0                                     /* todo_flags_finish */
 + }
 +};
-
-=== modified file 'gcc/tree-ssa.c'
---- old/gcc/tree-ssa.c	2009-12-07 22:42:10 +0000
-+++ new/gcc/tree-ssa.c	2010-09-01 13:29:58 +0000
+Index: gcc-4_5-branch/gcc/tree-ssa.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/tree-ssa.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/tree-ssa.c	2012-03-06 12:14:01.068439233 -0800
 @@ -1671,6 +1671,8 @@
      {
        TREE_NO_WARNING (var) = 1;
@@ -2994,4 +2983,3 @@
        if (xloc.file != floc.file
  	  || xloc.line < floc.line
  	  || xloc.line > LOCATION_LINE (cfun->function_end_locus))
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch
index b6c6532..ac3a1e2 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99424.patch
@@ -66,8 +66,10 @@
 	* gcc.target/i386/volatile-bitfields-2.c: New.
 
 === modified file 'gcc/calls.c'
---- old/gcc/calls.c	2010-10-04 00:50:43 +0000
-+++ new/gcc/calls.c	2010-11-04 12:43:52 +0000
+Index: gcc-4_5-branch/gcc/calls.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/calls.c	2012-03-06 13:05:56.524590011 -0800
++++ gcc-4_5-branch/gcc/calls.c	2012-03-06 13:36:10.276677792 -0800
 @@ -878,7 +878,7 @@
  	    int bitsize = MIN (bytes * BITS_PER_UNIT, BITS_PER_WORD);
  
@@ -77,10 +79,10 @@
  				      word_mode, word_mode);
  
  	    /* There is no need to restrict this code to loading items
-
-=== modified file 'gcc/common.opt'
---- old/gcc/common.opt	2010-07-29 14:59:35 +0000
-+++ new/gcc/common.opt	2010-11-04 12:43:52 +0000
+Index: gcc-4_5-branch/gcc/common.opt
+===================================================================
+--- gcc-4_5-branch.orig/gcc/common.opt	2012-03-06 13:05:48.400589618 -0800
++++ gcc-4_5-branch/gcc/common.opt	2012-03-06 13:36:35.608679018 -0800
 @@ -613,6 +613,10 @@
  Common Report Var(flag_loop_block) Optimization
  Enable Loop Blocking transformation
@@ -92,10 +94,10 @@
  fguess-branch-probability
  Common Report Var(flag_guess_branch_prob) Optimization
  Enable guessing of branch probabilities
-
-=== modified file 'gcc/config/h8300/h8300.c'
---- old/gcc/config/h8300/h8300.c	2010-04-02 18:54:46 +0000
-+++ new/gcc/config/h8300/h8300.c	2010-11-04 12:43:52 +0000
+Index: gcc-4_5-branch/gcc/config/h8300/h8300.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/h8300/h8300.c	2012-03-06 11:53:30.000000000 -0800
++++ gcc-4_5-branch/gcc/config/h8300/h8300.c	2012-03-06 13:36:35.528679014 -0800
 @@ -403,6 +403,10 @@
  	 restore er6 though, so bump up the cost.  */
        h8300_move_ratio = 6;
@@ -107,10 +109,10 @@
  }
  
  /* Implement REG_CLASS_FROM_LETTER.
-
-=== modified file 'gcc/config/m32c/m32c.c'
---- old/gcc/config/m32c/m32c.c	2009-10-22 18:46:26 +0000
-+++ new/gcc/config/m32c/m32c.c	2010-11-04 12:43:52 +0000
+Index: gcc-4_5-branch/gcc/config/m32c/m32c.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/m32c/m32c.c	2012-03-06 11:53:16.000000000 -0800
++++ gcc-4_5-branch/gcc/config/m32c/m32c.c	2012-03-06 13:36:35.488679012 -0800
 @@ -428,6 +428,10 @@
  
    if (TARGET_A24)
@@ -122,12 +124,12 @@
  }
  
  /* Defining data structures for per-function information */
-
-=== modified file 'gcc/config/rx/rx.c'
---- old/gcc/config/rx/rx.c	2010-07-27 14:39:53 +0000
-+++ new/gcc/config/rx/rx.c	2010-11-04 12:43:52 +0000
-@@ -2187,6 +2187,14 @@
-     }
+Index: gcc-4_5-branch/gcc/config/rx/rx.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/rx/rx.c	2012-03-06 11:53:17.000000000 -0800
++++ gcc-4_5-branch/gcc/config/rx/rx.c	2012-03-06 13:36:35.508679013 -0800
+@@ -2417,6 +2417,14 @@
+   return ! TYPE_PACKED (record_type);
  }
  
 +static void
@@ -139,11 +141,11 @@
 +}
 +
  
- static bool
- rx_allocate_stack_slots_for_args (void)
-@@ -2759,6 +2767,9 @@
- #undef  TARGET_CC_MODES_COMPATIBLE
- #define TARGET_CC_MODES_COMPATIBLE		rx_cc_modes_compatible
+ /* Returns true if X a legitimate constant for an immediate
+    operand on the RX.  X is already known to satisfy CONSTANT_P.  */
+@@ -2794,6 +2802,9 @@
+ #undef  TARGET_PROMOTE_FUNCTION_MODE
+ #define TARGET_PROMOTE_FUNCTION_MODE		rx_promote_function_mode
  
 +#undef  TARGET_OPTION_OVERRIDE
 +#define TARGET_OPTION_OVERRIDE			rx_option_override
@@ -151,10 +153,10 @@
  struct gcc_target targetm = TARGET_INITIALIZER;
  
  /* #include "gt-rx.h" */
-
-=== modified file 'gcc/config/sh/sh.c'
---- old/gcc/config/sh/sh.c	2010-05-05 21:12:17 +0000
-+++ new/gcc/config/sh/sh.c	2010-11-04 12:43:52 +0000
+Index: gcc-4_5-branch/gcc/config/sh/sh.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/config/sh/sh.c	2012-03-06 11:53:20.000000000 -0800
++++ gcc-4_5-branch/gcc/config/sh/sh.c	2012-03-06 13:36:35.516679013 -0800
 @@ -950,6 +950,10 @@
  
    if (sh_fixed_range_str)
@@ -166,10 +168,10 @@
  }
  
  /* Print the operand address in x to the stream.  */
-
-=== modified file 'gcc/doc/invoke.texi'
---- old/gcc/doc/invoke.texi	2010-10-04 00:50:43 +0000
-+++ new/gcc/doc/invoke.texi	2010-11-04 12:43:52 +0000
+Index: gcc-4_5-branch/gcc/doc/invoke.texi
+===================================================================
+--- gcc-4_5-branch.orig/gcc/doc/invoke.texi	2012-03-06 13:05:56.988590034 -0800
++++ gcc-4_5-branch/gcc/doc/invoke.texi	2012-03-06 13:36:36.048679039 -0800
 @@ -922,7 +922,7 @@
  -fargument-noalias-global  -fargument-noalias-anything @gol
  -fleading-underscore  -ftls-model=@var{model} @gol
@@ -213,10 +215,10 @@
  @end table
  
  @c man end
-
-=== modified file 'gcc/expmed.c'
---- old/gcc/expmed.c	2010-10-04 00:50:43 +0000
-+++ new/gcc/expmed.c	2010-11-04 12:43:52 +0000
+Index: gcc-4_5-branch/gcc/expmed.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/expmed.c	2012-03-06 13:05:56.876590028 -0800
++++ gcc-4_5-branch/gcc/expmed.c	2012-03-06 13:36:35.104678993 -0800
 @@ -47,7 +47,7 @@
  static rtx extract_fixed_bit_field (enum machine_mode, rtx,
  				    unsigned HOST_WIDE_INT,
@@ -458,10 +460,10 @@
        bitsdone += thissize;
  
        /* Shift this part into place for the result.  */
-
-=== modified file 'gcc/expr.c'
---- old/gcc/expr.c	2010-10-04 00:50:43 +0000
-+++ new/gcc/expr.c	2010-11-04 12:43:52 +0000
+Index: gcc-4_5-branch/gcc/expr.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/expr.c	2012-03-06 13:05:57.720590069 -0800
++++ gcc-4_5-branch/gcc/expr.c	2012-03-06 13:40:14.504689612 -0800
 @@ -1749,7 +1749,7 @@
  		  && (!REG_P (tmps[i]) || GET_MODE (tmps[i]) != mode))
  		tmps[i] = extract_bit_field (tmps[i], bytelen * BITS_PER_UNIT,
@@ -498,7 +500,16 @@
  					  NULL_RTX, copy_mode, copy_mode));
      }
  
-@@ -2970,7 +2970,7 @@
+@@ -2291,7 +2291,7 @@
+ 	 xbitpos for the destination store (right justified).  */
+       store_bit_field (dst_word, bitsize, xbitpos % BITS_PER_WORD, word_mode,
+ 		       extract_bit_field (src_word, bitsize,
+-					  bitpos % BITS_PER_WORD, 1,
++					  bitpos % BITS_PER_WORD, 1, false,
+ 					  NULL_RTX, word_mode, word_mode));
+     }
+ 
+@@ -3075,7 +3075,7 @@
      }
  
    return extract_bit_field (cplx, ibitsize, imag_p ? ibitsize : 0,
@@ -507,7 +518,7 @@
  }
  
  /* A subroutine of emit_move_insn_1.  Yet another lowpart generator.
-@@ -4233,6 +4233,13 @@
+@@ -4338,6 +4338,13 @@
  
        to_rtx = expand_normal (tem);
  
@@ -517,11 +528,11 @@
 +	  && GET_CODE (to_rtx) == MEM
 +	  && flag_strict_volatile_bitfields > 0)
 +	to_rtx = adjust_address (to_rtx, mode1, 0);
-+ 
++
        if (offset != 0)
  	{
  	  enum machine_mode address_mode;
-@@ -5993,6 +6000,12 @@
+@@ -6106,6 +6113,12 @@
  	mode = DECL_MODE (field);
        else if (DECL_MODE (field) == BLKmode)
  	blkmode_bitfield = true;
@@ -534,7 +545,7 @@
  
        *punsignedp = DECL_UNSIGNED (field);
      }
-@@ -8848,6 +8861,7 @@
+@@ -8978,6 +8991,7 @@
  	HOST_WIDE_INT bitsize, bitpos;
  	tree offset;
  	int volatilep = 0, must_force_mem;
@@ -542,7 +553,7 @@
  	tree tem = get_inner_reference (exp, &bitsize, &bitpos, &offset,
  					&mode1, &unsignedp, &volatilep, true);
  	rtx orig_op0, memloc;
-@@ -8857,6 +8871,11 @@
+@@ -8987,6 +9001,11 @@
  	   infinitely recurse.  */
  	gcc_assert (tem != exp);
  
@@ -554,7 +565,7 @@
  	/* If TEM's type is a union of variable size, pass TARGET to the inner
  	   computation, since it will need a temporary and TARGET is known
  	   to have to do.  This occurs in unchecked conversion in Ada.  */
-@@ -8873,6 +8892,14 @@
+@@ -9003,6 +9022,14 @@
  			  || modifier == EXPAND_STACK_PARM)
  			 ? modifier : EXPAND_NORMAL);
  
@@ -569,7 +580,7 @@
  	mode2
  	  = CONSTANT_P (op0) ? TYPE_MODE (TREE_TYPE (tem)) : GET_MODE (op0);
  
-@@ -8998,6 +9025,9 @@
+@@ -9128,6 +9155,9 @@
  		&& GET_MODE_CLASS (mode) != MODE_COMPLEX_FLOAT
  		&& modifier != EXPAND_CONST_ADDRESS
  		&& modifier != EXPAND_INITIALIZER)
@@ -579,7 +590,7 @@
  	    /* If the field isn't aligned enough to fetch as a memref,
  	       fetch it as a bit field.  */
  	    || (mode1 != BLKmode
-@@ -9058,7 +9088,7 @@
+@@ -9188,7 +9218,7 @@
  	    if (MEM_P (op0) && REG_P (XEXP (op0, 0)))
  	      mark_reg_pointer (XEXP (op0, 0), MEM_ALIGN (op0));
  
@@ -588,11 +599,11 @@
  				     (modifier == EXPAND_STACK_PARM
  				      ? NULL_RTX : target),
  				     ext_mode, ext_mode);
-
-=== modified file 'gcc/expr.h'
---- old/gcc/expr.h	2010-02-19 09:53:51 +0000
-+++ new/gcc/expr.h	2010-11-04 12:43:52 +0000
-@@ -802,7 +802,7 @@
+Index: gcc-4_5-branch/gcc/expr.h
+===================================================================
+--- gcc-4_5-branch.orig/gcc/expr.h	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/expr.h	2012-03-06 13:05:59.668590163 -0800
+@@ -804,7 +804,7 @@
  extern void store_bit_field (rtx, unsigned HOST_WIDE_INT,
  			     unsigned HOST_WIDE_INT, enum machine_mode, rtx);
  extern rtx extract_bit_field (rtx, unsigned HOST_WIDE_INT,
@@ -601,11 +612,11 @@
  			      enum machine_mode, enum machine_mode);
  extern rtx extract_low_bits (enum machine_mode, enum machine_mode, rtx);
  extern rtx expand_mult (enum machine_mode, rtx, rtx, rtx, int);
-
-=== modified file 'gcc/fold-const.c'
---- old/gcc/fold-const.c	2010-10-04 00:50:43 +0000
-+++ new/gcc/fold-const.c	2010-11-04 12:43:52 +0000
-@@ -4208,11 +4208,16 @@
+Index: gcc-4_5-branch/gcc/fold-const.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/fold-const.c	2012-03-06 13:05:56.880590028 -0800
++++ gcc-4_5-branch/gcc/fold-const.c	2012-03-06 13:36:03.276677454 -0800
+@@ -4215,11 +4215,16 @@
  
    /* See if we can find a mode to refer to this field.  We should be able to,
       but fail if we can't.  */
@@ -627,11 +638,11 @@
    if (nmode == VOIDmode)
      return 0;
  
-
-=== modified file 'gcc/stmt.c'
---- old/gcc/stmt.c	2010-08-13 11:53:46 +0000
-+++ new/gcc/stmt.c	2010-11-04 12:43:52 +0000
-@@ -1751,7 +1751,7 @@
+Index: gcc-4_5-branch/gcc/stmt.c
+===================================================================
+--- gcc-4_5-branch.orig/gcc/stmt.c	2012-03-06 13:05:54.568589917 -0800
++++ gcc-4_5-branch/gcc/stmt.c	2012-03-06 13:36:34.948678986 -0800
+@@ -1754,7 +1754,7 @@
  	     xbitpos for the destination store (right justified).  */
  	  store_bit_field (dst, bitsize, xbitpos % BITS_PER_WORD, word_mode,
  			   extract_bit_field (src, bitsize,
@@ -640,10 +651,10 @@
  					      NULL_RTX, word_mode, word_mode));
  	}
  
-
-=== added file 'gcc/testsuite/gcc.target/i386/volatile-bitfields-1.c'
---- old/gcc/testsuite/gcc.target/i386/volatile-bitfields-1.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/i386/volatile-bitfields-1.c	2010-11-04 12:43:52 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/i386/volatile-bitfields-1.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/i386/volatile-bitfields-1.c	2012-03-06 13:05:59.672590164 -0800
 @@ -0,0 +1,17 @@
 +/* { dg-do compile } */
 +/* { dg-options "-O2 -fstrict-volatile-bitfields" } */
@@ -662,10 +673,10 @@
 +}
 +
 +/* { dg-final { scan-assembler "mov(b|zbl).*bits" } } */
-
-=== added file 'gcc/testsuite/gcc.target/i386/volatile-bitfields-2.c'
---- old/gcc/testsuite/gcc.target/i386/volatile-bitfields-2.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/i386/volatile-bitfields-2.c	2010-11-04 12:43:52 +0000
+Index: gcc-4_5-branch/gcc/testsuite/gcc.target/i386/volatile-bitfields-2.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_5-branch/gcc/testsuite/gcc.target/i386/volatile-bitfields-2.c	2012-03-06 13:05:59.672590164 -0800
 @@ -0,0 +1,17 @@
 +/* { dg-do compile } */
 +/* { dg-options "-O2 -fno-strict-volatile-bitfields" } */
@@ -684,4 +695,3 @@
 +}
 +
 +/* { dg-final { scan-assembler "movl.*bits" } } */
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch
index ec0eebd..337b055 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch
@@ -99,7 +99,7 @@
 Index: gcc-4_5-branch/gcc/config/arm/arm-ldmstm.ml
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ gcc-4_5-branch/gcc/config/arm/arm-ldmstm.ml	2011-06-16 18:46:26.355282255 -0700
++++ gcc-4_5-branch/gcc/config/arm/arm-ldmstm.ml	2012-03-06 12:51:19.980547615 -0800
 @@ -0,0 +1,333 @@
 +(* Auto-generate ARM ldm/stm patterns
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -436,8 +436,8 @@ Index: gcc-4_5-branch/gcc/config/arm/arm-ldmstm.ml
 +  patterns ();
 Index: gcc-4_5-branch/gcc/config/arm/arm-protos.h
 ===================================================================
---- gcc-4_5-branch.orig/gcc/config/arm/arm-protos.h	2011-06-16 18:46:18.000000000 -0700
-+++ gcc-4_5-branch/gcc/config/arm/arm-protos.h	2011-06-16 18:46:26.355282255 -0700
+--- gcc-4_5-branch.orig/gcc/config/arm/arm-protos.h	2012-03-06 12:47:54.000000000 -0800
++++ gcc-4_5-branch/gcc/config/arm/arm-protos.h	2012-03-06 12:51:19.980547615 -0800
 @@ -99,14 +99,11 @@
  extern int label_mentioned_p (rtx);
  extern RTX_CODE minmax_code (rtx);
@@ -460,8 +460,8 @@ Index: gcc-4_5-branch/gcc/config/arm/arm-protos.h
  extern enum machine_mode arm_select_dominance_cc_mode (rtx, rtx,
 Index: gcc-4_5-branch/gcc/config/arm/arm.c
 ===================================================================
---- gcc-4_5-branch.orig/gcc/config/arm/arm.c	2011-06-16 18:46:23.000000000 -0700
-+++ gcc-4_5-branch/gcc/config/arm/arm.c	2011-06-16 18:46:26.365282255 -0700
+--- gcc-4_5-branch.orig/gcc/config/arm/arm.c	2012-03-06 12:47:56.000000000 -0800
++++ gcc-4_5-branch/gcc/config/arm/arm.c	2012-03-06 12:51:19.988547639 -0800
 @@ -753,6 +753,12 @@
    "hi", "ls", "ge", "lt", "gt", "le", "al", "nv"
  };
@@ -475,7 +475,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  #define ARM_LSL_NAME (TARGET_UNIFIED_ASM ? "lsl" : "asl")
  #define streq(string1, string2) (strcmp (string1, string2) == 0)
  
-@@ -9668,24 +9674,125 @@
+@@ -9647,24 +9653,125 @@
    return 0;
  }
  
@@ -612,7 +612,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  
    /* Loop over the operands and check that the memory references are
       suitable (i.e. immediate offsets from the same base register).  At
-@@ -9723,32 +9830,30 @@
+@@ -9702,32 +9809,30 @@
  	  if (i == 0)
  	    {
  	      base_reg = REGNO (reg);
@@ -659,7 +659,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  	}
        else
  	/* Not a suitable memory address.  */
-@@ -9757,167 +9862,90 @@
+@@ -9736,167 +9841,90 @@
  
    /* All the useful information has now been extracted from the
       operands into unsorted_regs and unsorted_offsets; additionally,
@@ -888,7 +888,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  
    /* Loop over the operands and check that the memory references are
       suitable (i.e. immediate offsets from the same base register).  At
-@@ -9952,32 +9980,32 @@
+@@ -9931,32 +9959,32 @@
  	      && (GET_CODE (offset = XEXP (XEXP (operands[nops + i], 0), 1))
  		  == CONST_INT)))
  	{
@@ -937,7 +937,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  	}
        else
  	/* Not a suitable memory address.  */
-@@ -9986,111 +10014,65 @@
+@@ -9965,111 +9993,65 @@
  
    /* All the useful information has now been extracted from the
       operands into unsorted_regs and unsorted_offsets; additionally,
@@ -1087,7 +1087,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  
    /* XScale has load-store double instructions, but they have stricter
       alignment requirements than load-store multiple, so we cannot
-@@ -10127,18 +10109,10 @@
+@@ -10106,18 +10088,10 @@
        start_sequence ();
  
        for (i = 0; i < count; i++)
@@ -1109,7 +1109,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  
        seq = get_insns ();
        end_sequence ();
-@@ -10147,41 +10121,40 @@
+@@ -10126,41 +10100,40 @@
      }
  
    result = gen_rtx_PARALLEL (VOIDmode,
@@ -1170,7 +1170,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
       the pros/cons of ldm/stm usage for XScale.  */
    if (low_irq_latency || (arm_tune_xscale && count <= 2 && ! optimize_size))
      {
-@@ -10190,18 +10163,10 @@
+@@ -10169,18 +10142,10 @@
        start_sequence ();
  
        for (i = 0; i < count; i++)
@@ -1192,7 +1192,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  
        seq = get_insns ();
        end_sequence ();
-@@ -10210,29 +10175,319 @@
+@@ -10189,29 +10154,319 @@
      }
  
    result = gen_rtx_PARALLEL (VOIDmode,
@@ -1522,7 +1522,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  }
  
  int
-@@ -10268,20 +10523,21 @@
+@@ -10247,20 +10502,21 @@
    for (i = 0; in_words_to_go >= 2; i+=4)
      {
        if (in_words_to_go > 4)
@@ -1554,8 +1554,8 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.c
  					       dstbase, &dstoffset));
 Index: gcc-4_5-branch/gcc/config/arm/arm.h
 ===================================================================
---- gcc-4_5-branch.orig/gcc/config/arm/arm.h	2011-06-16 18:46:20.000000000 -0700
-+++ gcc-4_5-branch/gcc/config/arm/arm.h	2011-06-16 18:46:26.375282255 -0700
+--- gcc-4_5-branch.orig/gcc/config/arm/arm.h	2012-03-06 12:47:55.000000000 -0800
++++ gcc-4_5-branch/gcc/config/arm/arm.h	2012-03-06 12:51:19.988547639 -0800
 @@ -1143,6 +1143,9 @@
    ((MODE) == TImode || (MODE) == EImode || (MODE) == OImode \
     || (MODE) == CImode || (MODE) == XImode)
@@ -1577,8 +1577,8 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.h
  #endif /* ! GCC_ARM_H */
 Index: gcc-4_5-branch/gcc/config/arm/arm.md
 ===================================================================
---- gcc-4_5-branch.orig/gcc/config/arm/arm.md	2011-06-16 18:46:23.000000000 -0700
-+++ gcc-4_5-branch/gcc/config/arm/arm.md	2011-06-16 18:46:26.375282255 -0700
+--- gcc-4_5-branch.orig/gcc/config/arm/arm.md	2012-03-06 12:47:56.000000000 -0800
++++ gcc-4_5-branch/gcc/config/arm/arm.md	2012-03-06 12:51:19.992547622 -0800
 @@ -6282,7 +6282,7 @@
  
  ;; load- and store-multiple insns
@@ -1969,7 +1969,7 @@ Index: gcc-4_5-branch/gcc/config/arm/arm.md
 Index: gcc-4_5-branch/gcc/config/arm/ldmstm.md
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ gcc-4_5-branch/gcc/config/arm/ldmstm.md	2011-06-16 18:46:26.375282255 -0700
++++ gcc-4_5-branch/gcc/config/arm/ldmstm.md	2012-03-06 12:51:19.992547622 -0800
 @@ -0,0 +1,1191 @@
 +/* ARM ldm/stm instruction patterns.  This file was automatically generated
 +   using arm-ldmstm.ml.  Please do not edit manually.
@@ -3164,8 +3164,8 @@ Index: gcc-4_5-branch/gcc/config/arm/ldmstm.md
 +
 Index: gcc-4_5-branch/gcc/config/arm/predicates.md
 ===================================================================
---- gcc-4_5-branch.orig/gcc/config/arm/predicates.md	2011-06-16 18:46:18.000000000 -0700
-+++ gcc-4_5-branch/gcc/config/arm/predicates.md	2011-06-16 18:46:26.375282255 -0700
+--- gcc-4_5-branch.orig/gcc/config/arm/predicates.md	2012-03-06 12:47:54.000000000 -0800
++++ gcc-4_5-branch/gcc/config/arm/predicates.md	2012-03-06 12:51:19.992547622 -0800
 @@ -211,6 +211,11 @@
    (and (match_code "ior,xor,and")
         (match_test "mode == GET_MODE (op)")))
@@ -3314,8 +3314,8 @@ Index: gcc-4_5-branch/gcc/config/arm/predicates.md
    return true;
 Index: gcc-4_5-branch/gcc/config/i386/i386.md
 ===================================================================
---- gcc-4_5-branch.orig/gcc/config/i386/i386.md	2011-06-16 18:46:21.000000000 -0700
-+++ gcc-4_5-branch/gcc/config/i386/i386.md	2011-06-16 18:46:26.385282255 -0700
+--- gcc-4_5-branch.orig/gcc/config/i386/i386.md	2012-03-06 12:47:55.000000000 -0800
++++ gcc-4_5-branch/gcc/config/i386/i386.md	2012-03-06 12:51:19.996547605 -0800
 @@ -4960,6 +4960,7 @@
     (set (match_operand:SSEMODEI24 2 "register_operand" "")
  	(fix:SSEMODEI24 (match_dup 0)))]
@@ -3324,7 +3324,7 @@ Index: gcc-4_5-branch/gcc/config/i386/i386.md
     && peep2_reg_dead_p (2, operands[0])"
    [(set (match_dup 2) (fix:SSEMODEI24 (match_dup 1)))]
    "")
-@@ -20057,15 +20058,14 @@
+@@ -20089,15 +20090,14 @@
  ;;  leal    (%edx,%eax,4), %eax
  
  (define_peephole2
@@ -3345,7 +3345,7 @@ Index: gcc-4_5-branch/gcc/config/i386/i386.md
  		   (clobber (reg:CC FLAGS_REG))])]
    "INTVAL (operands[2]) >= 0 && INTVAL (operands[2]) <= 3
     /* Validate MODE for lea.  */
-@@ -20074,31 +20074,27 @@
+@@ -20106,31 +20106,27 @@
  	    || GET_MODE (operands[0]) == HImode))
         || GET_MODE (operands[0]) == SImode
         || (TARGET_64BIT && GET_MODE (operands[0]) == DImode))
@@ -3391,8 +3391,8 @@ Index: gcc-4_5-branch/gcc/config/i386/i386.md
  
 Index: gcc-4_5-branch/gcc/genoutput.c
 ===================================================================
---- gcc-4_5-branch.orig/gcc/genoutput.c	2011-06-16 17:59:04.000000000 -0700
-+++ gcc-4_5-branch/gcc/genoutput.c	2011-06-16 18:46:26.385282255 -0700
+--- gcc-4_5-branch.orig/gcc/genoutput.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/genoutput.c	2012-03-06 12:51:20.000547582 -0800
 @@ -266,6 +266,8 @@
  
        printf ("    %d,\n", d->strict_low);
@@ -3404,8 +3404,8 @@ Index: gcc-4_5-branch/gcc/genoutput.c
        printf("  },\n");
 Index: gcc-4_5-branch/gcc/genrecog.c
 ===================================================================
---- gcc-4_5-branch.orig/gcc/genrecog.c	2011-06-16 17:59:04.000000000 -0700
-+++ gcc-4_5-branch/gcc/genrecog.c	2011-06-16 18:46:26.395282255 -0700
+--- gcc-4_5-branch.orig/gcc/genrecog.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/genrecog.c	2012-03-06 12:51:20.000547582 -0800
 @@ -1782,20 +1782,11 @@
    int odepth = strlen (oldpos);
    int ndepth = strlen (newpos);
@@ -3429,8 +3429,8 @@ Index: gcc-4_5-branch/gcc/genrecog.c
      {
 Index: gcc-4_5-branch/gcc/recog.c
 ===================================================================
---- gcc-4_5-branch.orig/gcc/recog.c	2011-06-16 18:46:02.000000000 -0700
-+++ gcc-4_5-branch/gcc/recog.c	2011-06-16 18:46:26.395282255 -0700
+--- gcc-4_5-branch.orig/gcc/recog.c	2012-03-06 12:47:48.000000000 -0800
++++ gcc-4_5-branch/gcc/recog.c	2012-03-06 13:04:05.780584592 -0800
 @@ -2082,6 +2082,7 @@
  			       recog_data.operand_loc,
  			       recog_data.constraints,
@@ -3508,7 +3508,7 @@ Index: gcc-4_5-branch/gcc/recog.c
  
    gcc_assert (peep2_insn_data[ofs].insn != NULL_RTX);
  
-@@ -2996,12 +3006,8 @@
+@@ -2997,12 +3007,8 @@
    gcc_assert (from < MAX_INSNS_PER_PEEP2 + 1);
    gcc_assert (to < MAX_INSNS_PER_PEEP2 + 1);
  
@@ -3523,17 +3523,17 @@ Index: gcc-4_5-branch/gcc/recog.c
  
    gcc_assert (peep2_insn_data[from].insn != NULL_RTX);
    REG_SET_TO_HARD_REG_SET (live, peep2_insn_data[from].live_before);
-@@ -3010,8 +3016,7 @@
-     {
-       HARD_REG_SET this_live;
+@@ -3016,8 +3022,7 @@
+ 	   *def_rec; def_rec++)
+ 	SET_HARD_REG_BIT (live, DF_REF_REGNO (*def_rec));
  
 -      if (++from >= MAX_INSNS_PER_PEEP2 + 1)
 -	from = 0;
 +      from = peep2_buf_position (from + 1);
-       gcc_assert (peep2_insn_data[from].insn != NULL_RTX);
-       REG_SET_TO_HARD_REG_SET (this_live, peep2_insn_data[from].live_before);
-       IOR_HARD_REG_SET (live, this_live);
-@@ -3104,19 +3109,234 @@
+     }
+ 
+   cl = (class_str[0] == 'r' ? GENERAL_REGS
+@@ -3107,19 +3112,234 @@
    COPY_REG_SET (peep2_insn_data[MAX_INSNS_PER_PEEP2].live_before, live);
  }
  
@@ -3771,7 +3771,7 @@ Index: gcc-4_5-branch/gcc/recog.c
    df_analyze ();
  
    /* Initialize the regsets we're going to use.  */
-@@ -3126,214 +3346,59 @@
+@@ -3129,214 +3349,59 @@
  
    FOR_EACH_BB_REVERSE (bb)
      {
@@ -4028,7 +4028,7 @@ Index: gcc-4_5-branch/gcc/recog.c
  	}
      }
  
-@@ -3341,7 +3406,7 @@
+@@ -3344,7 +3409,7 @@
    for (i = 0; i < MAX_INSNS_PER_PEEP2 + 1; ++i)
      BITMAP_FREE (peep2_insn_data[i].live_before);
    BITMAP_FREE (live);
@@ -4039,8 +4039,8 @@ Index: gcc-4_5-branch/gcc/recog.c
  #endif /* HAVE_peephole2 */
 Index: gcc-4_5-branch/gcc/recog.h
 ===================================================================
---- gcc-4_5-branch.orig/gcc/recog.h	2011-06-16 17:59:04.000000000 -0700
-+++ gcc-4_5-branch/gcc/recog.h	2011-06-16 18:46:26.405282255 -0700
+--- gcc-4_5-branch.orig/gcc/recog.h	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/recog.h	2012-03-06 12:51:20.000547582 -0800
 @@ -194,6 +194,9 @@
    /* Gives the constraint string for operand N.  */
    const char *constraints[MAX_RECOG_OPERANDS];
@@ -4062,8 +4062,8 @@ Index: gcc-4_5-branch/gcc/recog.h
  
 Index: gcc-4_5-branch/gcc/reload.c
 ===================================================================
---- gcc-4_5-branch.orig/gcc/reload.c	2011-06-16 17:59:04.000000000 -0700
-+++ gcc-4_5-branch/gcc/reload.c	2011-06-16 18:46:26.405282255 -0700
+--- gcc-4_5-branch.orig/gcc/reload.c	2012-03-06 11:53:32.000000000 -0800
++++ gcc-4_5-branch/gcc/reload.c	2012-03-06 12:51:20.004547561 -0800
 @@ -3631,7 +3631,7 @@
  		   || modified[j] != RELOAD_WRITE)
  		  && j != i
-- 
1.7.5.4



