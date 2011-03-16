Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzwJS-0001ry-Bh
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 20:23:18 +0100
Received: by iyb26 with SMTP id 26so2035697iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 12:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=60aL8j/6l4sh3lwGP2vYWKmQnL/xABN/smnfwwvgzmo=;
	b=vSEZgmYtm2xCixZtEDrvxK7JMeXRAQSQW692bAFf4bHx1/Fjd4DlufP/HjqZaiC2HW
	zikJReEl9XOdtWUNCPO9oiUDp9muyx1hGu20wGXrHVUFKqwfj29odf7qIEVeTi0sTpiK
	g/JpbfeQA6oIHYBwvj6y9eOWofKiEftgERNyo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=B4MUzRwLYF+vB+VM5kNr3HLWjMDkJ0daTaOV8ENiI2/yku6JRzV46nUeN6Hr+XvA6Z
	M2tzinG8C2uHVEGbfoCEdi3hrDi/MtPgRAxaF2yKUogVeracM5UazY3dgihCKPNA4GRz
	QqLAX3+nOI6JXbldYqU9EqIOyRC6GUT3Z345A=
Received: by 10.42.168.2 with SMTP id u2mr527033icy.389.1300303293215;
	Wed, 16 Mar 2011 12:21:33 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 14sm103900ibo.29.2011.03.16.12.21.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 12:21:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 12:21:18 -0700
Message-Id: <1300303278-6308-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: paulepanter@users.sourceforge.net
Subject: [PATCH] gcc-4.5: Fix segfault in dwarf2out
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
X-List-Received-Date: Wed, 16 Mar 2011 19:23:18 -0000

Currently following fails

rm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp -mthumb-interwork -mno-thumb
--sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi
-DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./..
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
-pipe -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c coding.c -o
coding.o

coding.c: In function 'asn1_length_der':
coding.c:101:1: internal compiler error: in
dwarf2out_frame_debug_expr, at dwarf2out.c:2221
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
{standard input}: Assembler messages:

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-4.5.inc                            |    7 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch |  230 ++++++++++++++++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch |   42 ++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch |   22 ++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch |   61 +++++
 recipes/gcc/gcc-4.5/more-epilogues.patch           |   83 -------
 6 files changed, 360 insertions(+), 85 deletions(-)
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch
 delete mode 100644 recipes/gcc/gcc-4.5/more-epilogues.patch

diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
index a3a44a2..5ea0f48 100644
--- a/recipes/gcc/gcc-4.5.inc
+++ b/recipes/gcc/gcc-4.5.inc
@@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 
-INC_PR = "r33"
+INC_PR = "r34"
 
 SRCREV = "170880"
 PV = "4.5"
@@ -173,7 +173,10 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
 	   file://linaro/gcc-4.5-linaro-r99481.patch \
 	   file://linaro/gcc-4.5-linaro-r99482.patch \
 	   file://linaro/gcc-4.5-linaro-r99483.patch \
-	   file://more-epilogues.patch \
+	   file://linaro/gcc-4.5-linaro-r99486.patch \
+	   file://linaro/gcc-4.5-linaro-r99487.patch \
+	   file://linaro/gcc-4.5-linaro-r99488.patch \
+	   file://linaro/gcc-4.5-linaro-r99489.patch \
 	   file://gcc-scalar-widening-pr45847.patch \
 	   file://gcc-arm-volatile-bitfield-fix.patch \
 	  "
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch
new file mode 100644
index 0000000..e6b58ac
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99486.patch
@@ -0,0 +1,230 @@
+2011-03-09  Bernd Schmidt  <bernds@codesourcery.com>
+
+	Issue #10649
+	gcc/
+	* dwarf2out.c (dwarf2out_begin_epilogue): Accept simplejumps
+	as well as returnjumps.
+	* cfganal.c (set_edge_can_fallthru_flag): Revert previous change
+	that tried to keep epilogue blocks adjacent.
+
+2011-02-03  Bernd Schmidt  <bernds@codesourcery.com>
+
+	gcc/
+	* function.c (prepare_shrink_wrap): New function.
+	(thread_prologue_and_epilogue_insns): Call it.
+
+=== modified file 'gcc/cfganal.c'
+--- old/gcc/cfganal.c	2011-02-08 10:51:58 +0000
++++ new/gcc/cfganal.c	2011-03-10 14:55:10 +0000
+@@ -271,37 +271,6 @@
+       EDGE_SUCC (bb, 0)->flags |= EDGE_CAN_FALLTHRU;
+       EDGE_SUCC (bb, 1)->flags |= EDGE_CAN_FALLTHRU;
+     }
+-  /* dwarf2out expects that a NOTE_INSN_EPILOGUE_BEGIN is always paired
+-     with a return or a sibcall.  Ensure that this remains the case if
+-     they are in different basic blocks.  */
+-  FOR_EACH_BB (bb)
+-    {
+-      edge e;
+-      edge_iterator ei;
+-      rtx insn, end;
+-
+-      end = BB_END (bb);
+-      FOR_BB_INSNS (bb, insn)
+-	if (GET_CODE (insn) == NOTE
+-	    && NOTE_KIND (insn) == NOTE_INSN_EPILOGUE_BEG
+-	    && !(CALL_P (end) && SIBLING_CALL_P (end))
+-	    && !returnjump_p (end))
+-	  {
+-	    basic_block other_bb = NULL;
+-	    FOR_EACH_EDGE (e, ei, bb->succs)
+-	      {
+-		if (e->flags & EDGE_FALLTHRU)
+-		  other_bb = e->dest;
+-		else
+-		  e->flags &= ~EDGE_CAN_FALLTHRU;
+-	      }
+-	    FOR_EACH_EDGE (e, ei, other_bb->preds)
+-	      {
+-		if (!(e->flags & EDGE_FALLTHRU))
+-		  e->flags &= ~EDGE_CAN_FALLTHRU;
+-	      }	    
+-	  }
+-    }
+ }
+ 
+ /* Find unreachable blocks.  An unreachable block will have 0 in
+
+=== modified file 'gcc/dwarf2out.c'
+--- old/gcc/dwarf2out.c	2011-02-08 10:51:58 +0000
++++ new/gcc/dwarf2out.c	2011-03-10 14:55:10 +0000
+@@ -2782,10 +2782,10 @@
+   dwarf2out_frame_debug_expr (insn, label);
+ }
+ 
+-/* Determine if we need to save and restore CFI information around this
+-   epilogue.  If SIBCALL is true, then this is a sibcall epilogue.  If
+-   we do need to save/restore, then emit the save now, and insert a
+-   NOTE_INSN_CFA_RESTORE_STATE at the appropriate place in the stream.  */
++/* Determine if we need to save and restore CFI information around
++   this epilogue.  If we do need to save/restore, then emit the save
++   now, and insert a NOTE_INSN_CFA_RESTORE_STATE at the appropriate
++   place in the stream.  */
+ 
+ void
+ dwarf2out_begin_epilogue (rtx insn)
+@@ -2800,8 +2800,10 @@
+       if (!INSN_P (i))
+ 	continue;
+ 
+-      /* Look for both regular and sibcalls to end the block.  */
+-      if (returnjump_p (i))
++      /* Look for both regular and sibcalls to end the block.  Various
++	 optimization passes may cause us to jump to a common epilogue
++	 tail, so we also accept simplejumps.  */
++      if (returnjump_p (i) || simplejump_p (i))
+ 	break;
+       if (CALL_P (i) && SIBLING_CALL_P (i))
+ 	break;
+
+=== modified file 'gcc/function.c'
+--- old/gcc/function.c	2011-02-08 10:51:58 +0000
++++ new/gcc/function.c	2011-03-10 14:55:10 +0000
+@@ -5038,6 +5038,127 @@
+       return true;
+   return false;
+ }
++
++/* Look for sets of call-saved registers in the first block of the
++   function, and move them down into successor blocks if the register
++   is used only on one path.  This exposes more opportunities for
++   shrink-wrapping.
++   These kinds of sets often occur when incoming argument registers are
++   moved to call-saved registers because their values are live across
++   one or more calls during the function.  */
++
++static void
++prepare_shrink_wrap (basic_block entry_block)
++{
++  rtx insn, curr;
++  FOR_BB_INSNS_SAFE (entry_block, insn, curr)
++    {
++      basic_block next_bb;
++      edge e, live_edge;
++      edge_iterator ei;
++      rtx set, scan;
++      unsigned destreg, srcreg;
++
++      if (!NONDEBUG_INSN_P (insn))
++	continue;
++      set = single_set (insn);
++      if (!set)
++	continue;
++
++      if (!REG_P (SET_SRC (set)) || !REG_P (SET_DEST (set)))
++	continue;
++      srcreg = REGNO (SET_SRC (set));
++      destreg = REGNO (SET_DEST (set));
++      if (hard_regno_nregs[srcreg][GET_MODE (SET_SRC (set))] > 1
++	  || hard_regno_nregs[destreg][GET_MODE (SET_DEST (set))] > 1)
++	continue;
++
++      next_bb = entry_block;
++      scan = insn;
++
++      for (;;)
++	{
++	  live_edge = NULL;
++	  FOR_EACH_EDGE (e, ei, next_bb->succs)
++	    {
++	      if (REGNO_REG_SET_P (df_get_live_in (e->dest), destreg))
++		{
++		  if (live_edge)
++		    {
++		      live_edge = NULL;
++		      break;
++		    }
++		  live_edge = e;
++		}
++	    }
++	  if (!live_edge)
++	    break;
++	  /* We can sometimes encounter dead code.  Don't try to move it
++	     into the exit block.  */
++	  if (live_edge->dest == EXIT_BLOCK_PTR)
++	    break;
++	  if (EDGE_COUNT (live_edge->dest->preds) > 1)
++	    break;
++	  while (scan != BB_END (next_bb))
++	    {
++	      scan = NEXT_INSN (scan);
++	      if (NONDEBUG_INSN_P (scan))
++		{
++		  rtx link;
++		  HARD_REG_SET set_regs;
++
++		  CLEAR_HARD_REG_SET (set_regs);
++		  note_stores (PATTERN (scan), record_hard_reg_sets,
++			       &set_regs);
++		  if (CALL_P (scan))
++		    IOR_HARD_REG_SET (set_regs, call_used_reg_set);
++		  for (link = REG_NOTES (scan); link; link = XEXP (link, 1))
++		    if (REG_NOTE_KIND (link) == REG_INC)
++		      record_hard_reg_sets (XEXP (link, 0), NULL, &set_regs);
++
++		  if (TEST_HARD_REG_BIT (set_regs, srcreg)
++		      || reg_referenced_p (SET_DEST (set),
++					   PATTERN (scan)))
++		    {
++		      scan = NULL_RTX;
++		      break;
++		    }
++		  if (CALL_P (scan))
++		    {
++		      rtx link = CALL_INSN_FUNCTION_USAGE (scan);
++		      while (link)
++			{
++			  rtx tmp = XEXP (link, 0);
++			  if (GET_CODE (tmp) == USE
++			      && reg_referenced_p (SET_DEST (set), tmp))
++			    break;
++			  link = XEXP (link, 1);
++			}
++		      if (link)
++			{
++			  scan = NULL_RTX;
++			  break;
++			}
++		    }
++		}
++	    }
++	  if (!scan)
++	    break;
++	  next_bb = live_edge->dest;
++	}
++
++      if (next_bb != entry_block)
++	{
++	  rtx after = BB_HEAD (next_bb);
++	  while (!NOTE_P (after)
++		 || NOTE_KIND (after) != NOTE_INSN_BASIC_BLOCK)
++	    after = NEXT_INSN (after);
++	  emit_insn_after (PATTERN (insn), after);
++	  delete_insn (insn);
++	}
++    }
++}
++
+ #endif
+ 
+ #ifdef HAVE_return
+@@ -5215,6 +5336,8 @@
+       bitmap_head bb_antic_flags;
+       bitmap_head bb_on_list;
+ 
++      prepare_shrink_wrap (entry_edge->dest);
++
+       bitmap_initialize (&bb_antic_flags, &bitmap_default_obstack);
+       bitmap_initialize (&bb_on_list, &bitmap_default_obstack);
+ 
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch
new file mode 100644
index 0000000..186c177
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99487.patch
@@ -0,0 +1,42 @@
+2011-03-11  Andrew Stubbs  <ams@codesourcery.com>
+	    Michael Hope  <michael.hope@linaro.org>
+	    Matthias Klose  <doko@ubuntu.org>
+
+	gcc/
+	* function. (thread_prologue_and_epilogue_insns): Initialize
+	prologue_seq.
+	* opts.c (decode_options): Move flag_shrink_wrap to -O1.
+
+=== modified file 'gcc/function.c'
+--- old/gcc/function.c	2011-03-10 14:55:10 +0000
++++ new/gcc/function.c	2011-03-11 10:35:05 +0000
+@@ -5252,6 +5252,8 @@
+   edge_iterator ei;
+   bitmap_head bb_flags;
+ 
++  prologue_seq = NULL_RTX;
++
+   df_analyze ();
+ 
+   rtl_profile_for_bb (ENTRY_BLOCK_PTR);
+
+=== modified file 'gcc/opts.c'
+--- old/gcc/opts.c	2011-02-08 10:51:58 +0000
++++ new/gcc/opts.c	2011-03-11 10:35:05 +0000
+@@ -877,6 +877,7 @@
+   flag_tree_copy_prop = opt1;
+   flag_tree_sink = opt1;
+   flag_tree_ch = opt1;
++  flag_shrink_wrap = opt1;
+ 
+   /* -O2 optimizations.  */
+   opt2 = (optimize >= 2);
+@@ -909,7 +910,6 @@
+   flag_ipa_cp = opt2;
+   flag_ipa_sra = opt2;
+   flag_ee = opt2;
+-  flag_shrink_wrap = opt2;
+ 
+   /* Track fields in field-sensitive alias analysis.  */
+   set_param_value ("max-fields-for-field-sensitive",
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch
new file mode 100644
index 0000000..2f41a0a
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99488.patch
@@ -0,0 +1,22 @@
+2011-03-03  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	* ee.c (reg_use_p): Handle subregs of promoted vars.
+
+=== modified file 'gcc/ee.c'
+--- old/gcc/ee.c	2010-12-10 15:33:37 +0000
++++ new/gcc/ee.c	2011-03-03 17:08:58 +0000
+@@ -209,7 +209,11 @@
+ 
+       *regno = REGNO (reg);
+ 
+-      if (paradoxical_subreg_p (use))
++      /* Non-paradoxical SUBREGs of promoted vars guarantee that the
++	 upper (elided) bits of the inner register have a particular value.
++	 For our purposes, such SUBREGs act as a full reference to the
++	 inner register.  */
++      if (paradoxical_subreg_p (use) || SUBREG_PROMOTED_VAR_P (use))
+         *size = GET_MODE_BITSIZE (GET_MODE (reg));
+       else
+         *size = subreg_lsb (use) + GET_MODE_BITSIZE (GET_MODE (use));
+
diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch
new file mode 100644
index 0000000..12fb56a
--- /dev/null
+++ b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99489.patch
@@ -0,0 +1,61 @@
+2011-03-10  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	LP:730440
+	PR target/47668
+	gcc/
+	* config/arm/arm.md (arm_movtas_ze): Use 'L' instead of 'c'.
+	gcc/testsuite/
+	* gcc.target/arm/pr47688.c: New.
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-03-01 14:32:39 +0000
++++ new/gcc/config/arm/arm.md	2011-03-11 14:26:34 +0000
+@@ -11133,13 +11133,15 @@
+   [(set_attr "conds" "clob")]
+ )
+ 
++;; We only care about the lower 16 bits of the constant 
++;; being inserted into the upper 16 bits of the register.
+ (define_insn "*arm_movtas_ze" 
+   [(set (zero_extract:SI (match_operand:SI 0 "s_register_operand" "+r")
+                    (const_int 16)
+                    (const_int 16))
+         (match_operand:SI 1 "const_int_operand" ""))]
+   "arm_arch_thumb2"
+-  "movt%?\t%0, %c1"
++  "movt%?\t%0, %L1"
+  [(set_attr "predicable" "yes")
+    (set_attr "length" "4")]
+ )
+
+=== added file 'gcc/testsuite/gcc.target/arm/pr47688.c'
+--- old/gcc/testsuite/gcc.target/arm/pr47688.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/pr47688.c	2011-03-11 14:26:34 +0000
+@@ -0,0 +1,26 @@
++/* { dg-options "-mthumb -O2" }  */
++/* { dg-require-effective-target arm_thumb2_ok } */
++/* { dg-final { scan-assembler-not "-32768" } } */
++
++typedef union
++{
++  unsigned long int u_32_value;
++  struct 
++  {
++    unsigned short int u_16_value_0;
++    unsigned short int u_16_value_1;
++  } u_16_values;
++} my_union;
++
++
++unsigned long int Test(const unsigned short int wXe)
++{
++  my_union dwCalcVal;
++  
++  dwCalcVal.u_16_values.u_16_value_0=wXe;
++  dwCalcVal.u_16_values.u_16_value_1=0x8000u;
++
++  dwCalcVal.u_32_value /=3;
++  
++  return (dwCalcVal.u_32_value);
++}
+
diff --git a/recipes/gcc/gcc-4.5/more-epilogues.patch b/recipes/gcc/gcc-4.5/more-epilogues.patch
deleted file mode 100644
index 64f1cf3..0000000
--- a/recipes/gcc/gcc-4.5/more-epilogues.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-Index: a/gcc/cfgcleanup.c
-===================================================================
---- a/gcc/cfgcleanup.c	(revision 315947)
-+++ b/gcc/cfgcleanup.c	(working copy)
-@@ -1179,13 +1179,19 @@ flow_find_head_matching_sequence (basic_
- 
-   while (true)
-     {
--
--      /* Ignore notes.  */
-+      /* Ignore notes, except NOTE_INSN_EPILOGUE_BEG.  */
-       while (!NONDEBUG_INSN_P (i1) && i1 != BB_END (bb1))
--	i1 = NEXT_INSN (i1);
--
-+	{
-+	  if (NOTE_P (i1) && NOTE_KIND (i1) == NOTE_INSN_EPILOGUE_BEG)
-+	    break;
-+	  i1 = NEXT_INSN (i1);
-+	}
-       while (!NONDEBUG_INSN_P (i2) && i2 != BB_END (bb2))
--	i2 = NEXT_INSN (i2);
-+	{
-+	  if (NOTE_P (i2) && NOTE_KIND (i2) == NOTE_INSN_EPILOGUE_BEG)
-+	    break;
-+	  i2 = NEXT_INSN (i2);
-+	}
- 
-       if (NOTE_P (i1) || NOTE_P (i2)
- 	  || JUMP_P (i1) || JUMP_P (i2))
-Index: a/gcc/cfglayout.c
-===================================================================
---- a/gcc/cfglayout.c	(revision 315947)
-+++ b/gcc/cfglayout.c	(working copy)
-@@ -1295,6 +1295,16 @@ cfg_layout_initialize (unsigned int flag
-       bb->flags |= BB_NON_LOCAL_GOTO_TARGET;
-     }
- 
-+  FOR_EACH_BB (bb)
-+    {
-+      rtx insn;
-+      FOR_BB_INSNS (bb, insn)
-+	if (NOTE_P (insn) && NOTE_KIND (insn) == NOTE_INSN_EPILOGUE_BEG)
-+	  {
-+	    bb->flags |= BB_EPILOGUE_BEGIN;
-+	    break;
-+	  }
-+    }
-   cleanup_cfg (CLEANUP_CFGLAYOUT | flags);
- }
- 
-Index: a/gcc/basic-block.h
-===================================================================
---- a/gcc/basic-block.h	(revision 315947)
-+++ b/gcc/basic-block.h	(working copy)
-@@ -332,7 +332,11 @@ enum bb_flags
- 
-   /* Set on blocks that cannot be threaded through.
-      Only used in cfgcleanup.c.  */
--  BB_NONTHREADABLE_BLOCK = 1 << 11
-+  BB_NONTHREADABLE_BLOCK = 1 << 11,
-+
-+  /* Set on blocks that have a NOTE_INSN_EPILOGUE_BEGIN.
-+     Only used in cfglayout mode.  */
-+  BB_EPILOGUE_BEGIN = 1 << 12
- };
- 
- /* Dummy flag for convenience in the hot/cold partitioning code.  */
-Index: a/gcc/cfgrtl.c
-===================================================================
---- a/gcc/cfgrtl.c	(revision 315947)
-+++ b/gcc/cfgrtl.c	(working copy)
-@@ -2707,7 +2707,10 @@ cfg_layout_can_merge_blocks_p (basic_blo
- 	     not allow us to redirect an edge by replacing a table jump.  */
- 	  && (!JUMP_P (BB_END (a))
- 	      || ((!optimize || reload_completed)
--		  ? simplejump_p (BB_END (a)) : onlyjump_p (BB_END (a)))));
-+		  ? simplejump_p (BB_END (a)) : onlyjump_p (BB_END (a))))
-+	  /* Don't separate a NOTE_INSN_EPILOGUE_BEG from its returnjump.  */
-+	  && (!(b->flags & BB_EPILOGUE_BEGIN)
-+	      || returnjump_p (BB_END (b))));
- }
- 
- /* Merge block A and B.  The blocks must be mergeable.  */
-- 
1.7.4.1



