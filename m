Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R9HRq-0002Ha-UK
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Sep 2011 16:18:59 +0200
Received: by iadx2 with SMTP id x2so739885iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2011 07:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=a+W0HTg/rHxktT+gxQ4QeCDGY0kR159WnUE1AOupBNQ=;
	b=fhe6N3tpkxl1foVvrvwVx0qlT3ncI0fFR8hWmhwOaySuJp1UTTRLRFljJ01GcLJOO0
	NP0aXm8Pc2ctt8GuPsEuDaNrrXevt7zOMidiIlpmpn0AVzV0SUkidkT9yDSHGzqcseBs
	kK7KfiEcHLNDa844DpWwevOFYRXLp7L7KVYZs=
Received: by 10.42.73.5 with SMTP id q5mr878619icj.100.1317305601296;
	Thu, 29 Sep 2011 07:13:21 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id ek22sm2731344ibb.12.2011.09.29.07.13.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Sep 2011 07:13:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Sep 2011 07:12:52 -0700
Message-Id: <1317305572-13531-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] gcc-4.6: Bring in latest linaro patches
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
X-List-Received-Date: Thu, 29 Sep 2011 14:19:00 -0000

Adjust existing patches for latest FSF gcc-4_6-branch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch    |   49 +-
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch    | 3142 ++++++++++----------
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch    |   80 +-
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch    |  185 +-
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106783.patch    |   62 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106784.patch    |  458 +++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106785.patch    |   39 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106786.patch    |   94 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106787.patch    |   30 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106789.patch    |   33 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106792.patch    |   61 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106793.patch    |   34 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106794.patch    | 2648 +++++++++++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106796.patch    | 1255 ++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106797.patch    |   23 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106798.patch    |   23 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106799.patch    |   75 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106800.patch    | 1270 ++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106802.patch    |  948 ++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106803.patch    |  201 ++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106804.patch    |   38 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106805.patch    |   47 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106806.patch    |   92 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106807.patch    |  767 +++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106811.patch    |  203 ++
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |   21 +
 26 files changed, 10094 insertions(+), 1784 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106783.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106784.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106785.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106786.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106787.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106789.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106792.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106793.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106794.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106796.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106797.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106798.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106799.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106800.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106802.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106803.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106804.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106805.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106806.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106807.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106811.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
index 84f6f64..f53b26a 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch
@@ -17,8 +17,10 @@
 	for STORE_FLAG_VALUE==-1 case.
 
 === modified file 'gcc/combine.c'
---- old/gcc/combine.c	2011-02-15 19:46:26 +0000
-+++ new/gcc/combine.c	2011-04-26 17:03:58 +0000
+Index: gcc-4_6-branch/gcc/combine.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/combine.c	2011-09-16 19:58:21.000000000 -0700
++++ gcc-4_6-branch/gcc/combine.c	2011-09-16 20:05:36.626650681 -0700
 @@ -391,8 +391,8 @@
  static void undo_all (void);
  static void undo_commit (void);
@@ -30,7 +32,7 @@
  static rtx simplify_if_then_else (rtx);
  static rtx simplify_set (rtx);
  static rtx simplify_logical (rtx);
-@@ -3086,12 +3086,12 @@
+@@ -3112,12 +3112,12 @@
  	  if (i1)
  	    {
  	      subst_low_luid = DF_INSN_LUID (i1);
@@ -45,7 +47,7 @@
  	    }
  	}
  
-@@ -3103,7 +3103,7 @@
+@@ -3129,7 +3129,7 @@
  	 self-referential RTL when we will be substituting I1SRC for I1DEST
  	 later.  Likewise if I0 feeds into I2, either directly or indirectly
  	 through I1, and I0DEST is in I0SRC.  */
@@ -54,7 +56,7 @@
  		      (i1_feeds_i2_n && i1dest_in_i1src)
  		      || ((i0_feeds_i2_n || (i0_feeds_i1_n && i1_feeds_i2_n))
  			  && i0dest_in_i0src));
-@@ -3142,7 +3142,7 @@
+@@ -3168,7 +3168,7 @@
  	 copy of I1SRC each time we substitute it, in order to avoid creating
  	 self-referential RTL when we will be substituting I0SRC for I0DEST
  	 later.  */
@@ -63,7 +65,7 @@
  		      i0_feeds_i1_n && i0dest_in_i0src);
        substed_i1 = 1;
  
-@@ -3172,7 +3172,7 @@
+@@ -3198,7 +3198,7 @@
  
        n_occurrences = 0;
        subst_low_luid = DF_INSN_LUID (i0);
@@ -72,7 +74,7 @@
        substed_i0 = 1;
      }
  
-@@ -3234,7 +3234,7 @@
+@@ -3260,7 +3260,7 @@
  	{
  	  rtx t = i1pat;
  	  if (i0_feeds_i1_n)
@@ -81,7 +83,7 @@
  
  	  XVECEXP (newpat, 0, --total_sets) = t;
  	}
-@@ -3242,10 +3242,10 @@
+@@ -3268,10 +3268,10 @@
  	{
  	  rtx t = i2pat;
  	  if (i1_feeds_i2_n)
@@ -94,7 +96,7 @@
  
  	  XVECEXP (newpat, 0, --total_sets) = t;
  	}
-@@ -4914,11 +4914,13 @@
+@@ -4943,11 +4943,13 @@
  
     IN_DEST is nonzero if we are processing the SET_DEST of a SET.
  
@@ -109,7 +111,7 @@
  {
    enum rtx_code code = GET_CODE (x);
    enum machine_mode op0_mode = VOIDmode;
-@@ -4979,7 +4981,7 @@
+@@ -5008,7 +5010,7 @@
        && GET_CODE (XVECEXP (x, 0, 0)) == SET
        && GET_CODE (SET_SRC (XVECEXP (x, 0, 0))) == ASM_OPERANDS)
      {
@@ -118,7 +120,7 @@
  
        /* If this substitution failed, this whole thing fails.  */
        if (GET_CODE (new_rtx) == CLOBBER
-@@ -4996,7 +4998,7 @@
+@@ -5025,7 +5027,7 @@
  	      && GET_CODE (dest) != CC0
  	      && GET_CODE (dest) != PC)
  	    {
@@ -127,7 +129,7 @@
  
  	      /* If this substitution failed, this whole thing fails.  */
  	      if (GET_CODE (new_rtx) == CLOBBER
-@@ -5042,8 +5044,8 @@
+@@ -5071,8 +5073,8 @@
  		    }
  		  else
  		    {
@@ -138,7 +140,7 @@
  
  		      /* If this substitution failed, this whole thing
  			 fails.  */
-@@ -5120,7 +5122,9 @@
+@@ -5149,7 +5151,9 @@
  				&& (code == SUBREG || code == STRICT_LOW_PART
  				    || code == ZERO_EXTRACT))
  			       || code == SET)
@@ -149,7 +151,7 @@
  
  	      /* If we found that we will have to reject this combination,
  		 indicate that by returning the CLOBBER ourselves, rather than
-@@ -5177,7 +5181,7 @@
+@@ -5206,7 +5210,7 @@
        /* If X is sufficiently simple, don't bother trying to do anything
  	 with it.  */
        if (code != CONST_INT && code != REG && code != CLOBBER)
@@ -158,7 +160,7 @@
  
        if (GET_CODE (x) == code)
  	break;
-@@ -5197,10 +5201,12 @@
+@@ -5226,10 +5230,12 @@
     expression.
  
     OP0_MODE is the original mode of XEXP (x, 0).  IN_DEST is nonzero
@@ -173,7 +175,7 @@
  {
    enum rtx_code code = GET_CODE (x);
    enum machine_mode mode = GET_MODE (x);
-@@ -5255,8 +5261,8 @@
+@@ -5284,8 +5290,8 @@
  	     false arms to store-flag values.  Be careful to use copy_rtx
  	     here since true_rtx or false_rtx might share RTL with x as a
  	     result of the if_then_else_cond call above.  */
@@ -184,16 +186,16 @@
  
  	  /* If true_rtx and false_rtx are not general_operands, an if_then_else
  	     is unlikely to be simpler.  */
-@@ -5600,7 +5606,7 @@
+@@ -5629,7 +5635,7 @@
  	{
  	  /* Try to simplify the expression further.  */
  	  rtx tor = simplify_gen_binary (IOR, mode, XEXP (x, 0), XEXP (x, 1));
--	  temp = combine_simplify_rtx (tor, mode, in_dest);
-+	  temp = combine_simplify_rtx (tor, mode, in_dest, 0);
+-	  temp = combine_simplify_rtx (tor, VOIDmode, in_dest);
++	  temp = combine_simplify_rtx (tor, VOIDmode, in_dest, 0);
  
  	  /* If we could, great.  If not, do not go ahead with the IOR
  	     replacement, since PLUS appears in many special purpose
-@@ -5693,7 +5699,16 @@
+@@ -5722,7 +5728,16 @@
  	     ZERO_EXTRACT is indeed appropriate, it will be placed back by
  	     the call to make_compound_operation in the SET case.  */
  
@@ -211,7 +213,7 @@
  	      && new_code == NE && GET_MODE_CLASS (mode) == MODE_INT
  	      && op1 == const0_rtx
  	      && mode == GET_MODE (op0)
-@@ -5739,7 +5754,10 @@
+@@ -5768,7 +5783,10 @@
  
  	  /* If STORE_FLAG_VALUE is -1, we have cases similar to
  	     those above.  */
@@ -223,7 +225,7 @@
  	      && new_code == NE && GET_MODE_CLASS (mode) == MODE_INT
  	      && op1 == const0_rtx
  	      && (num_sign_bit_copies (op0, mode)
-@@ -5937,11 +5955,11 @@
+@@ -5966,11 +5984,11 @@
        if (reg_mentioned_p (from, true_rtx))
  	true_rtx = subst (known_cond (copy_rtx (true_rtx), true_code,
  				      from, true_val),
@@ -237,7 +239,7 @@
  
        SUBST (XEXP (x, 1), swapped ? false_rtx : true_rtx);
        SUBST (XEXP (x, 2), swapped ? true_rtx : false_rtx);
-@@ -6158,11 +6176,11 @@
+@@ -6187,11 +6205,11 @@
  	{
  	  temp = subst (simplify_gen_relational (true_code, m, VOIDmode,
  						 cond_op0, cond_op1),
@@ -251,4 +253,3 @@
  	  temp = simplify_gen_binary (op, m, gen_lowpart (m, z), temp);
  
  	  if (extend_op != UNKNOWN)
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch
index d14f06c..395c08c 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch
@@ -118,9 +118,11 @@
 	(neon_vld3<mode>, neon_vld4<mode>): Update accordingly.
 
 === modified file 'gcc/calls.c'
---- old/gcc/calls.c	2011-03-03 21:56:58 +0000
-+++ new/gcc/calls.c	2011-05-03 15:17:25 +0000
-@@ -684,7 +684,7 @@
+Index: gcc-4_6-branch/gcc/calls.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/calls.c	2011-06-24 08:33:49.000000000 -0700
++++ gcc-4_6-branch/gcc/calls.c	2011-09-16 20:16:00.217564705 -0700
+@@ -686,7 +686,7 @@
  	/* If the value is a non-legitimate constant, force it into a
  	   pseudo now.  TLS symbols sometimes need a call to resolve.  */
  	if (CONSTANT_P (args[i].value)
@@ -129,7 +131,7 @@
  	  args[i].value = force_reg (args[i].mode, args[i].value);
  
  	/* If we are to promote the function arg to a wider mode,
-@@ -3447,7 +3447,8 @@
+@@ -3449,7 +3449,8 @@
  
        /* Make sure it is a reasonable operand for a move or push insn.  */
        if (!REG_P (addr) && !MEM_P (addr)
@@ -139,7 +141,7 @@
  	addr = force_operand (addr, NULL_RTX);
  
        argvec[count].value = addr;
-@@ -3488,7 +3489,7 @@
+@@ -3490,7 +3491,7 @@
  
        /* Make sure it is a reasonable operand for a move or push insn.  */
        if (!REG_P (val) && !MEM_P (val)
@@ -148,10 +150,10 @@
  	val = force_operand (val, NULL_RTX);
  
        if (pass_by_reference (&args_so_far, mode, NULL_TREE, 1))
-
-=== modified file 'gcc/config/arm/arm-protos.h'
---- old/gcc/config/arm/arm-protos.h	2011-01-29 03:20:57 +0000
-+++ new/gcc/config/arm/arm-protos.h	2011-05-03 15:17:25 +0000
+Index: gcc-4_6-branch/gcc/config/arm/arm-protos.h
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/arm-protos.h	2011-06-24 08:33:37.000000000 -0700
++++ gcc-4_6-branch/gcc/config/arm/arm-protos.h	2011-09-16 20:16:00.217564705 -0700
 @@ -81,7 +81,6 @@
  extern enum reg_class coproc_secondary_reload_class (enum machine_mode, rtx,
  						     bool);
@@ -160,10 +162,10 @@
  
  extern int cirrus_memory_offset (rtx);
  extern int arm_coproc_mem_operand (rtx, bool);
-
-=== modified file 'gcc/config/arm/arm.c'
---- old/gcc/config/arm/arm.c	2011-04-28 11:46:58 +0000
-+++ new/gcc/config/arm/arm.c	2011-05-03 15:18:07 +0000
+Index: gcc-4_6-branch/gcc/config/arm/arm.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/arm.c	2011-09-16 20:14:34.000000000 -0700
++++ gcc-4_6-branch/gcc/config/arm/arm.c	2011-09-16 20:16:00.237564275 -0700
 @@ -143,6 +143,8 @@
  static void arm_output_mi_thunk (FILE *, tree, HOST_WIDE_INT, HOST_WIDE_INT,
  				 tree);
@@ -608,10 +610,12 @@
  	NEON_ARG_STOP);
      }
  
-@@ -22267,6 +22402,20 @@
-   return false;
- }
+@@ -22265,6 +22400,20 @@
+     return true;
  
+   return false;
++}
++
 +/* Implements target hook array_mode_supported_p.  */
 +
 +static bool
@@ -624,16 +628,14 @@
 +    return true;
 +
 +  return false;
-+}
-+
+ }
+ 
  /* Use the option -mvectorize-with-neon-quad to override the use of doubleword
-    registers when autovectorizing for Neon, at least until multiple vector
-    widths are supported properly by the middle-end.  */
-
-=== modified file 'gcc/config/arm/arm.h'
---- old/gcc/config/arm/arm.h	2011-02-21 14:04:51 +0000
-+++ new/gcc/config/arm/arm.h	2011-05-03 15:17:25 +0000
-@@ -1775,27 +1775,6 @@
+Index: gcc-4_6-branch/gcc/config/arm/arm.h
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/arm.h	2011-09-16 20:14:33.000000000 -0700
++++ gcc-4_6-branch/gcc/config/arm/arm.h	2011-09-16 20:16:00.237564275 -0700
+@@ -1777,27 +1777,6 @@
  #define TARGET_DEFAULT_WORD_RELOCATIONS 0
  #endif
  
@@ -661,10 +663,10 @@
  #ifndef SUBTARGET_NAME_ENCODING_LENGTHS
  #define SUBTARGET_NAME_ENCODING_LENGTHS
  #endif
-
-=== modified file 'gcc/config/arm/iterators.md'
---- old/gcc/config/arm/iterators.md	2010-09-21 13:11:03 +0000
-+++ new/gcc/config/arm/iterators.md	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/config/arm/iterators.md
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/iterators.md	2011-06-24 08:33:37.000000000 -0700
++++ gcc-4_6-branch/gcc/config/arm/iterators.md	2011-09-16 20:16:00.237564275 -0700
 @@ -194,24 +194,22 @@
  
  ;; Mode of pair of elements for each vector mode, to define transfer
@@ -698,10 +700,10 @@
                                 (V2SI "V4SI") (V4SI "V4SI")
                                 (V2SF "V4SF") (V4SF "V4SF")
                                 (DI "OI")     (V2DI "OI")])
-
-=== modified file 'gcc/config/arm/neon-testgen.ml'
---- old/gcc/config/arm/neon-testgen.ml	2010-05-24 18:36:31 +0000
-+++ new/gcc/config/arm/neon-testgen.ml	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/config/arm/neon-testgen.ml
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/neon-testgen.ml	2011-06-24 08:33:37.000000000 -0700
++++ gcc-4_6-branch/gcc/config/arm/neon-testgen.ml	2011-09-16 20:16:00.237564275 -0700
 @@ -177,7 +177,7 @@
        let alt2 = commas (fun x -> x) (n_things n elt_regexp) "" in
          "\\\\\\{((" ^ alt1 ^ ")|(" ^ alt2 ^ "))\\\\\\}"
@@ -711,11 +713,11 @@
      | Element_of_dreg -> (analyze_shape_elt Dreg) ^ "\\\\\\[\\[0-9\\]+\\\\\\]"
      | Element_of_qreg -> (analyze_shape_elt Qreg) ^ "\\\\\\[\\[0-9\\]+\\\\\\]"
      | All_elements_of_dreg -> (analyze_shape_elt Dreg) ^ "\\\\\\[\\\\\\]"
-
-=== modified file 'gcc/config/arm/neon.md'
---- old/gcc/config/arm/neon.md	2011-01-03 20:52:22 +0000
-+++ new/gcc/config/arm/neon.md	2011-05-03 15:14:56 +0000
-@@ -4247,16 +4247,16 @@
+Index: gcc-4_6-branch/gcc/config/arm/neon.md
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/neon.md	2011-07-19 21:50:44.000000000 -0700
++++ gcc-4_6-branch/gcc/config/arm/neon.md	2011-09-16 20:16:00.247564269 -0700
+@@ -4250,16 +4250,16 @@
  
  (define_insn "neon_vld1<mode>"
    [(set (match_operand:VDQX 0 "s_register_operand" "=w")
@@ -735,7 +737,7 @@
                       (match_operand:VDX 2 "s_register_operand" "0")
                       (match_operand:SI 3 "immediate_operand" "i")]
                      UNSPEC_VLD1_LANE))]
-@@ -4267,9 +4267,9 @@
+@@ -4270,9 +4270,9 @@
    if (lane < 0 || lane >= max)
      error ("lane out of range");
    if (max == 1)
@@ -747,7 +749,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (eq (const_string "<V_mode_nunits>") (const_int 2))
-@@ -4279,7 +4279,7 @@
+@@ -4282,7 +4282,7 @@
  
  (define_insn "neon_vld1_lane<mode>"
    [(set (match_operand:VQX 0 "s_register_operand" "=w")
@@ -756,7 +758,7 @@
                       (match_operand:VQX 2 "s_register_operand" "0")
                       (match_operand:SI 3 "immediate_operand" "i")]
                      UNSPEC_VLD1_LANE))]
-@@ -4298,9 +4298,9 @@
+@@ -4301,9 +4301,9 @@
      }
    operands[0] = gen_rtx_REG (<V_HALF>mode, regno);
    if (max == 2)
@@ -768,7 +770,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (eq (const_string "<V_mode_nunits>") (const_int 2))
-@@ -4310,14 +4310,14 @@
+@@ -4313,14 +4313,14 @@
  
  (define_insn "neon_vld1_dup<mode>"
    [(set (match_operand:VDX 0 "s_register_operand" "=w")
@@ -786,7 +788,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (gt (const_string "<V_mode_nunits>") (const_string "1"))
-@@ -4327,14 +4327,14 @@
+@@ -4330,14 +4330,14 @@
  
  (define_insn "neon_vld1_dup<mode>"
    [(set (match_operand:VQX 0 "s_register_operand" "=w")
@@ -804,7 +806,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (gt (const_string "<V_mode_nunits>") (const_string "1"))
-@@ -4343,15 +4343,15 @@
+@@ -4346,15 +4346,15 @@
  )
  
  (define_insn "neon_vst1<mode>"
@@ -823,7 +825,7 @@
  	(vec_select:<V_elem>
  	  (match_operand:VDX 1 "s_register_operand" "w")
  	  (parallel [(match_operand:SI 2 "neon_lane_number" "i")])))]
-@@ -4362,9 +4362,9 @@
+@@ -4365,9 +4365,9 @@
    if (lane < 0 || lane >= max)
      error ("lane out of range");
    if (max == 1)
@@ -835,7 +837,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (eq (const_string "<V_mode_nunits>") (const_int 1))
-@@ -4372,7 +4372,7 @@
+@@ -4375,7 +4375,7 @@
                      (const_string "neon_vst1_vst2_lane")))])
  
  (define_insn "neon_vst1_lane<mode>"
@@ -844,7 +846,7 @@
          (vec_select:<V_elem>
             (match_operand:VQX 1 "s_register_operand" "w")
             (parallel [(match_operand:SI 2 "neon_lane_number" "i")])))]
-@@ -4391,24 +4391,24 @@
+@@ -4394,24 +4394,24 @@
      }
    operands[1] = gen_rtx_REG (<V_HALF>mode, regno);
    if (max == 2)
@@ -874,7 +876,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (eq (const_string "<V_sz_elem>") (const_string "64"))
-@@ -4418,16 +4418,16 @@
+@@ -4421,16 +4421,16 @@
  
  (define_insn "neon_vld2<mode>"
    [(set (match_operand:OI 0 "s_register_operand" "=w")
@@ -894,7 +896,7 @@
                      (match_operand:TI 2 "s_register_operand" "0")
                      (match_operand:SI 3 "immediate_operand" "i")
                      (unspec:VD [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
-@@ -4444,7 +4444,7 @@
+@@ -4447,7 +4447,7 @@
    ops[1] = gen_rtx_REG (DImode, regno + 2);
    ops[2] = operands[1];
    ops[3] = operands[3];
@@ -903,7 +905,7 @@
    return "";
  }
    [(set_attr "neon_type" "neon_vld1_vld2_lane")]
-@@ -4452,7 +4452,7 @@
+@@ -4455,7 +4455,7 @@
  
  (define_insn "neon_vld2_lane<mode>"
    [(set (match_operand:OI 0 "s_register_operand" "=w")
@@ -912,7 +914,7 @@
                      (match_operand:OI 2 "s_register_operand" "0")
                      (match_operand:SI 3 "immediate_operand" "i")
                      (unspec:VMQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
-@@ -4474,7 +4474,7 @@
+@@ -4477,7 +4477,7 @@
    ops[1] = gen_rtx_REG (DImode, regno + 4);
    ops[2] = operands[1];
    ops[3] = GEN_INT (lane);
@@ -921,7 +923,7 @@
    return "";
  }
    [(set_attr "neon_type" "neon_vld1_vld2_lane")]
-@@ -4482,15 +4482,15 @@
+@@ -4485,15 +4485,15 @@
  
  (define_insn "neon_vld2_dup<mode>"
    [(set (match_operand:TI 0 "s_register_operand" "=w")
@@ -940,7 +942,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (gt (const_string "<V_mode_nunits>") (const_string "1"))
-@@ -4499,16 +4499,16 @@
+@@ -4502,16 +4502,16 @@
  )
  
  (define_insn "neon_vst2<mode>"
@@ -960,7 +962,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (eq (const_string "<V_sz_elem>") (const_string "64"))
-@@ -4517,17 +4517,17 @@
+@@ -4520,17 +4520,17 @@
  )
  
  (define_insn "neon_vst2<mode>"
@@ -981,7 +983,7 @@
  	(unspec:<V_two_elem>
  	  [(match_operand:TI 1 "s_register_operand" "w")
  	   (match_operand:SI 2 "immediate_operand" "i")
-@@ -4545,14 +4545,14 @@
+@@ -4548,14 +4548,14 @@
    ops[1] = gen_rtx_REG (DImode, regno);
    ops[2] = gen_rtx_REG (DImode, regno + 2);
    ops[3] = operands[2];
@@ -998,7 +1000,7 @@
          (unspec:<V_two_elem>
             [(match_operand:OI 1 "s_register_operand" "w")
              (match_operand:SI 2 "immediate_operand" "i")
-@@ -4575,7 +4575,7 @@
+@@ -4578,7 +4578,7 @@
    ops[1] = gen_rtx_REG (DImode, regno);
    ops[2] = gen_rtx_REG (DImode, regno + 4);
    ops[3] = GEN_INT (lane);
@@ -1007,7 +1009,7 @@
    return "";
  }
    [(set_attr "neon_type" "neon_vst1_vst2_lane")]
-@@ -4583,15 +4583,15 @@
+@@ -4586,15 +4586,15 @@
  
  (define_insn "neon_vld3<mode>"
    [(set (match_operand:EI 0 "s_register_operand" "=w")
@@ -1026,7 +1028,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (eq (const_string "<V_sz_elem>") (const_string "64"))
-@@ -4600,27 +4600,25 @@
+@@ -4603,27 +4603,25 @@
  )
  
  (define_expand "neon_vld3<mode>"
@@ -1064,7 +1066,7 @@
    "TARGET_NEON"
  {
    int regno = REGNO (operands[0]);
-@@ -4628,8 +4626,8 @@
+@@ -4631,8 +4629,8 @@
    ops[0] = gen_rtx_REG (DImode, regno);
    ops[1] = gen_rtx_REG (DImode, regno + 4);
    ops[2] = gen_rtx_REG (DImode, regno + 8);
@@ -1075,7 +1077,7 @@
    return "";
  }
    [(set_attr "neon_type" "neon_vld3_vld4")]
-@@ -4637,13 +4635,10 @@
+@@ -4640,13 +4638,10 @@
  
  (define_insn "neon_vld3qb<mode>"
    [(set (match_operand:CI 0 "s_register_operand" "=w")
@@ -1092,7 +1094,7 @@
    "TARGET_NEON"
  {
    int regno = REGNO (operands[0]);
-@@ -4651,8 +4646,8 @@
+@@ -4654,8 +4649,8 @@
    ops[0] = gen_rtx_REG (DImode, regno + 2);
    ops[1] = gen_rtx_REG (DImode, regno + 6);
    ops[2] = gen_rtx_REG (DImode, regno + 10);
@@ -1103,7 +1105,7 @@
    return "";
  }
    [(set_attr "neon_type" "neon_vld3_vld4")]
-@@ -4660,7 +4655,7 @@
+@@ -4663,7 +4658,7 @@
  
  (define_insn "neon_vld3_lane<mode>"
    [(set (match_operand:EI 0 "s_register_operand" "=w")
@@ -1112,7 +1114,7 @@
                      (match_operand:EI 2 "s_register_operand" "0")
                      (match_operand:SI 3 "immediate_operand" "i")
                      (unspec:VD [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
-@@ -4678,7 +4673,7 @@
+@@ -4681,7 +4676,7 @@
    ops[2] = gen_rtx_REG (DImode, regno + 4);
    ops[3] = operands[1];
    ops[4] = operands[3];
@@ -1121,7 +1123,7 @@
                     ops);
    return "";
  }
-@@ -4687,7 +4682,7 @@
+@@ -4690,7 +4685,7 @@
  
  (define_insn "neon_vld3_lane<mode>"
    [(set (match_operand:CI 0 "s_register_operand" "=w")
@@ -1130,7 +1132,7 @@
                      (match_operand:CI 2 "s_register_operand" "0")
                      (match_operand:SI 3 "immediate_operand" "i")
                      (unspec:VMQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
-@@ -4710,7 +4705,7 @@
+@@ -4713,7 +4708,7 @@
    ops[2] = gen_rtx_REG (DImode, regno + 8);
    ops[3] = operands[1];
    ops[4] = GEN_INT (lane);
@@ -1139,7 +1141,7 @@
                     ops);
    return "";
  }
-@@ -4719,7 +4714,7 @@
+@@ -4722,7 +4717,7 @@
  
  (define_insn "neon_vld3_dup<mode>"
    [(set (match_operand:EI 0 "s_register_operand" "=w")
@@ -1148,7 +1150,7 @@
                      (unspec:VDX [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
                     UNSPEC_VLD3_DUP))]
    "TARGET_NEON"
-@@ -4732,11 +4727,11 @@
+@@ -4735,11 +4730,11 @@
        ops[1] = gen_rtx_REG (DImode, regno + 2);
        ops[2] = gen_rtx_REG (DImode, regno + 4);
        ops[3] = operands[1];
@@ -1162,7 +1164,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (gt (const_string "<V_mode_nunits>") (const_string "1"))
-@@ -4744,16 +4739,16 @@
+@@ -4747,16 +4742,16 @@
                      (const_string "neon_vld1_1_2_regs")))])
  
  (define_insn "neon_vst3<mode>"
@@ -1182,7 +1184,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (eq (const_string "<V_sz_elem>") (const_string "64"))
-@@ -4761,62 +4756,60 @@
+@@ -4764,62 +4759,60 @@
                      (const_string "neon_vst2_4_regs_vst3_vst4")))])
  
  (define_expand "neon_vst3<mode>"
@@ -1264,7 +1266,7 @@
          (unspec:<V_three_elem>
             [(match_operand:EI 1 "s_register_operand" "w")
              (match_operand:SI 2 "immediate_operand" "i")
-@@ -4835,7 +4828,7 @@
+@@ -4838,7 +4831,7 @@
    ops[2] = gen_rtx_REG (DImode, regno + 2);
    ops[3] = gen_rtx_REG (DImode, regno + 4);
    ops[4] = operands[2];
@@ -1273,7 +1275,7 @@
                     ops);
    return "";
  }
-@@ -4843,7 +4836,7 @@
+@@ -4846,7 +4839,7 @@
  )
  
  (define_insn "neon_vst3_lane<mode>"
@@ -1282,7 +1284,7 @@
          (unspec:<V_three_elem>
             [(match_operand:CI 1 "s_register_operand" "w")
              (match_operand:SI 2 "immediate_operand" "i")
-@@ -4867,7 +4860,7 @@
+@@ -4870,7 +4863,7 @@
    ops[2] = gen_rtx_REG (DImode, regno + 4);
    ops[3] = gen_rtx_REG (DImode, regno + 8);
    ops[4] = GEN_INT (lane);
@@ -1291,7 +1293,7 @@
                     ops);
    return "";
  }
-@@ -4875,15 +4868,15 @@
+@@ -4878,15 +4871,15 @@
  
  (define_insn "neon_vld4<mode>"
    [(set (match_operand:OI 0 "s_register_operand" "=w")
@@ -1310,7 +1312,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (eq (const_string "<V_sz_elem>") (const_string "64"))
-@@ -4892,27 +4885,25 @@
+@@ -4895,27 +4888,25 @@
  )
  
  (define_expand "neon_vld4<mode>"
@@ -1348,7 +1350,7 @@
    "TARGET_NEON"
  {
    int regno = REGNO (operands[0]);
-@@ -4921,8 +4912,8 @@
+@@ -4924,8 +4915,8 @@
    ops[1] = gen_rtx_REG (DImode, regno + 4);
    ops[2] = gen_rtx_REG (DImode, regno + 8);
    ops[3] = gen_rtx_REG (DImode, regno + 12);
@@ -1359,7 +1361,7 @@
    return "";
  }
    [(set_attr "neon_type" "neon_vld3_vld4")]
-@@ -4930,13 +4921,10 @@
+@@ -4933,13 +4924,10 @@
  
  (define_insn "neon_vld4qb<mode>"
    [(set (match_operand:XI 0 "s_register_operand" "=w")
@@ -1376,7 +1378,7 @@
    "TARGET_NEON"
  {
    int regno = REGNO (operands[0]);
-@@ -4945,8 +4933,8 @@
+@@ -4948,8 +4936,8 @@
    ops[1] = gen_rtx_REG (DImode, regno + 6);
    ops[2] = gen_rtx_REG (DImode, regno + 10);
    ops[3] = gen_rtx_REG (DImode, regno + 14);
@@ -1387,7 +1389,7 @@
    return "";
  }
    [(set_attr "neon_type" "neon_vld3_vld4")]
-@@ -4954,7 +4942,7 @@
+@@ -4957,7 +4945,7 @@
  
  (define_insn "neon_vld4_lane<mode>"
    [(set (match_operand:OI 0 "s_register_operand" "=w")
@@ -1396,7 +1398,7 @@
                      (match_operand:OI 2 "s_register_operand" "0")
                      (match_operand:SI 3 "immediate_operand" "i")
                      (unspec:VD [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
-@@ -4973,7 +4961,7 @@
+@@ -4976,7 +4964,7 @@
    ops[3] = gen_rtx_REG (DImode, regno + 6);
    ops[4] = operands[1];
    ops[5] = operands[3];
@@ -1405,7 +1407,7 @@
                     ops);
    return "";
  }
-@@ -4982,7 +4970,7 @@
+@@ -4985,7 +4973,7 @@
  
  (define_insn "neon_vld4_lane<mode>"
    [(set (match_operand:XI 0 "s_register_operand" "=w")
@@ -1414,7 +1416,7 @@
                      (match_operand:XI 2 "s_register_operand" "0")
                      (match_operand:SI 3 "immediate_operand" "i")
                      (unspec:VMQ [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
-@@ -5006,7 +4994,7 @@
+@@ -5009,7 +4997,7 @@
    ops[3] = gen_rtx_REG (DImode, regno + 12);
    ops[4] = operands[1];
    ops[5] = GEN_INT (lane);
@@ -1423,7 +1425,7 @@
                     ops);
    return "";
  }
-@@ -5015,7 +5003,7 @@
+@@ -5018,7 +5006,7 @@
  
  (define_insn "neon_vld4_dup<mode>"
    [(set (match_operand:OI 0 "s_register_operand" "=w")
@@ -1432,7 +1434,7 @@
                      (unspec:VDX [(const_int 0)] UNSPEC_VSTRUCTDUMMY)]
                     UNSPEC_VLD4_DUP))]
    "TARGET_NEON"
-@@ -5029,12 +5017,12 @@
+@@ -5032,12 +5020,12 @@
        ops[2] = gen_rtx_REG (DImode, regno + 4);
        ops[3] = gen_rtx_REG (DImode, regno + 6);
        ops[4] = operands[1];
@@ -1447,7 +1449,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (gt (const_string "<V_mode_nunits>") (const_string "1"))
-@@ -5043,16 +5031,16 @@
+@@ -5046,16 +5034,16 @@
  )
  
  (define_insn "neon_vst4<mode>"
@@ -1467,7 +1469,7 @@
  }
    [(set (attr "neon_type")
        (if_then_else (eq (const_string "<V_sz_elem>") (const_string "64"))
-@@ -5061,64 +5049,62 @@
+@@ -5064,64 +5052,62 @@
  )
  
  (define_expand "neon_vst4<mode>"
@@ -1551,7 +1553,7 @@
          (unspec:<V_four_elem>
             [(match_operand:OI 1 "s_register_operand" "w")
              (match_operand:SI 2 "immediate_operand" "i")
-@@ -5138,7 +5124,7 @@
+@@ -5141,7 +5127,7 @@
    ops[3] = gen_rtx_REG (DImode, regno + 4);
    ops[4] = gen_rtx_REG (DImode, regno + 6);
    ops[5] = operands[2];
@@ -1560,7 +1562,7 @@
                     ops);
    return "";
  }
-@@ -5146,7 +5132,7 @@
+@@ -5149,7 +5135,7 @@
  )
  
  (define_insn "neon_vst4_lane<mode>"
@@ -1569,7 +1571,7 @@
          (unspec:<V_four_elem>
             [(match_operand:XI 1 "s_register_operand" "w")
              (match_operand:SI 2 "immediate_operand" "i")
-@@ -5171,7 +5157,7 @@
+@@ -5174,7 +5160,7 @@
    ops[3] = gen_rtx_REG (DImode, regno + 8);
    ops[4] = gen_rtx_REG (DImode, regno + 12);
    ops[5] = GEN_INT (lane);
@@ -1578,22 +1580,23 @@
                     ops);
    return "";
  }
-
-=== modified file 'gcc/config/arm/predicates.md'
---- old/gcc/config/arm/predicates.md	2011-04-07 10:52:12 +0000
-+++ new/gcc/config/arm/predicates.md	2011-05-03 15:14:56 +0000
-@@ -683,3 +683,7 @@
-    } 
-   return true; 
- })
+Index: gcc-4_6-branch/gcc/config/arm/predicates.md
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/predicates.md	2011-09-16 19:58:21.000000000 -0700
++++ gcc-4_6-branch/gcc/config/arm/predicates.md	2011-09-16 20:19:03.967834108 -0700
+@@ -686,3 +686,8 @@
+ 
+ (define_special_predicate "add_operator"
+ 			 (match_code "plus"))
 +
 +(define_special_predicate "neon_struct_operand"
 +  (and (match_code "mem")
 +       (match_test "TARGET_32BIT && neon_vector_mem_operand (op, 2)")))
-
-=== modified file 'gcc/doc/tm.texi'
---- old/gcc/doc/tm.texi	2011-01-22 19:35:10 +0000
-+++ new/gcc/doc/tm.texi	2011-05-03 15:17:25 +0000
++
+Index: gcc-4_6-branch/gcc/doc/tm.texi
+===================================================================
+--- gcc-4_6-branch.orig/gcc/doc/tm.texi	2011-06-24 08:13:00.000000000 -0700
++++ gcc-4_6-branch/gcc/doc/tm.texi	2011-09-16 20:16:00.257564628 -0700
 @@ -2533,7 +2533,7 @@
  register, so @code{TARGET_PREFERRED_RELOAD_CLASS} returns @code{NO_REGS} when
  @var{x} is a floating-point constant.  If the constant can't be loaded
@@ -1670,10 +1673,10 @@
  
  @deftypefn {Target Hook} rtx TARGET_DELEGITIMIZE_ADDRESS (rtx @var{x})
  This hook is used to undo the possibly obfuscating effects of the
-
-=== modified file 'gcc/doc/tm.texi.in'
---- old/gcc/doc/tm.texi.in	2011-01-22 19:35:10 +0000
-+++ new/gcc/doc/tm.texi.in	2011-05-03 15:17:25 +0000
+Index: gcc-4_6-branch/gcc/doc/tm.texi.in
+===================================================================
+--- gcc-4_6-branch.orig/gcc/doc/tm.texi.in	2011-06-24 08:13:00.000000000 -0700
++++ gcc-4_6-branch/gcc/doc/tm.texi.in	2011-09-16 20:16:00.257564628 -0700
 @@ -2521,7 +2521,7 @@
  register, so @code{TARGET_PREFERRED_RELOAD_CLASS} returns @code{NO_REGS} when
  @var{x} is a floating-point constant.  If the constant can't be loaded
@@ -1724,10 +1727,10 @@
  
  @hook TARGET_DELEGITIMIZE_ADDRESS
  This hook is used to undo the possibly obfuscating effects of the
-
-=== modified file 'gcc/expr.c'
---- old/gcc/expr.c	2011-04-05 16:18:11 +0000
-+++ new/gcc/expr.c	2011-05-03 15:17:25 +0000
+Index: gcc-4_6-branch/gcc/expr.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/expr.c	2011-09-16 20:14:32.000000000 -0700
++++ gcc-4_6-branch/gcc/expr.c	2011-09-16 20:16:00.267564792 -0700
 @@ -1497,7 +1497,7 @@
    if (nregs == 0)
      return;
@@ -1782,7 +1785,7 @@
  	x = validize_mem (force_const_mem (mode, x));
  
        /* If X is a hard register in a non-integer mode, copy it into a pseudo;
-@@ -9066,7 +9066,7 @@
+@@ -9108,7 +9108,7 @@
  	   constant and we don't need a memory reference.  */
  	if (CONSTANT_P (op0)
  	    && mode2 != BLKmode
@@ -1791,10 +1794,10 @@
  	    && !must_force_mem)
  	  op0 = force_reg (mode2, op0);
  
-
-=== modified file 'gcc/hooks.c'
---- old/gcc/hooks.c	2010-11-25 13:16:03 +0000
-+++ new/gcc/hooks.c	2011-05-03 15:16:01 +0000
+Index: gcc-4_6-branch/gcc/hooks.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/hooks.c	2011-06-24 08:33:48.000000000 -0700
++++ gcc-4_6-branch/gcc/hooks.c	2011-09-16 20:16:00.267564792 -0700
 @@ -101,6 +101,15 @@
    return true;
  }
@@ -1811,10 +1814,10 @@
  /* Generic hook that takes (FILE *, const char *) and does nothing.  */
  void
  hook_void_FILEptr_constcharptr (FILE *a ATTRIBUTE_UNUSED, const char *b ATTRIBUTE_UNUSED)
-
-=== modified file 'gcc/hooks.h'
---- old/gcc/hooks.h	2010-11-25 13:16:03 +0000
-+++ new/gcc/hooks.h	2011-05-03 15:16:01 +0000
+Index: gcc-4_6-branch/gcc/hooks.h
+===================================================================
+--- gcc-4_6-branch.orig/gcc/hooks.h	2011-06-24 08:33:48.000000000 -0700
++++ gcc-4_6-branch/gcc/hooks.h	2011-09-16 20:16:00.267564792 -0700
 @@ -34,6 +34,8 @@
  extern bool hook_bool_mode_true (enum machine_mode);
  extern bool hook_bool_mode_const_rtx_false (enum machine_mode, const_rtx);
@@ -1824,10 +1827,10 @@
  extern bool hook_bool_tree_false (tree);
  extern bool hook_bool_const_tree_false (const_tree);
  extern bool hook_bool_tree_true (tree);
-
-=== modified file 'gcc/recog.c'
---- old/gcc/recog.c	2010-11-30 16:36:19 +0000
-+++ new/gcc/recog.c	2011-05-03 15:17:25 +0000
+Index: gcc-4_6-branch/gcc/recog.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/recog.c	2011-06-24 08:33:49.000000000 -0700
++++ gcc-4_6-branch/gcc/recog.c	2011-09-16 20:16:00.277564886 -0700
 @@ -930,7 +930,9 @@
      return ((GET_MODE (op) == VOIDmode || GET_MODE (op) == mode
  	     || mode == VOIDmode)
@@ -1850,10 +1853,10 @@
  }
  
  /* Returns 1 if OP is an operand that is a CONST_INT.  */
-
-=== modified file 'gcc/reload.c'
---- old/gcc/reload.c	2011-02-02 16:52:21 +0000
-+++ new/gcc/reload.c	2011-05-03 15:17:25 +0000
+Index: gcc-4_6-branch/gcc/reload.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/reload.c	2011-06-24 08:33:49.000000000 -0700
++++ gcc-4_6-branch/gcc/reload.c	2011-09-16 20:16:00.277564886 -0700
 @@ -4721,7 +4721,8 @@
  	    simplify_gen_subreg (GET_MODE (x), reg_equiv_constant[regno],
  				 GET_MODE (SUBREG_REG (x)), SUBREG_BYTE (x));
@@ -1882,10 +1885,10 @@
  	       || targetm.preferred_reload_class (XEXP (x, 1), rclass)
  		   == NO_REGS))
      {
-
-=== modified file 'gcc/reload1.c'
---- old/gcc/reload1.c	2011-01-23 21:11:24 +0000
-+++ new/gcc/reload1.c	2011-05-03 15:17:25 +0000
+Index: gcc-4_6-branch/gcc/reload1.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/reload1.c	2011-06-24 08:33:49.000000000 -0700
++++ gcc-4_6-branch/gcc/reload1.c	2011-09-16 20:16:00.277564886 -0700
 @@ -4155,6 +4155,9 @@
  		}
  	      else if (function_invariant_p (x))
@@ -1911,10 +1914,10 @@
  		      if (! reg_equiv_memory_loc[i])
  			reg_equiv_init[i] = NULL_RTX;
  		    }
-
-=== modified file 'gcc/stor-layout.c'
---- old/gcc/stor-layout.c	2011-03-10 22:37:22 +0000
-+++ new/gcc/stor-layout.c	2011-05-03 15:16:01 +0000
+Index: gcc-4_6-branch/gcc/stor-layout.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/stor-layout.c	2011-06-24 08:33:49.000000000 -0700
++++ gcc-4_6-branch/gcc/stor-layout.c	2011-09-16 20:16:00.287564867 -0700
 @@ -546,6 +546,34 @@
    return MIN (BIGGEST_ALIGNMENT, MAX (1, mode_base_align[mode]*BITS_PER_UNIT));
  }
@@ -1967,10 +1970,10 @@
  	    if (TYPE_MODE (type) != BLKmode
  		&& STRICT_ALIGNMENT && TYPE_ALIGN (type) < BIGGEST_ALIGNMENT
  		&& TYPE_ALIGN (type) < GET_MODE_ALIGNMENT (TYPE_MODE (type)))
-
-=== modified file 'gcc/target.def'
---- old/gcc/target.def	2011-01-22 19:35:10 +0000
-+++ new/gcc/target.def	2011-05-03 15:17:25 +0000
+Index: gcc-4_6-branch/gcc/target.def
+===================================================================
+--- gcc-4_6-branch.orig/gcc/target.def	2011-06-24 08:33:48.000000000 -0700
++++ gcc-4_6-branch/gcc/target.def	2011-09-16 20:16:00.287564867 -0700
 @@ -1344,6 +1344,13 @@
   unsigned, (unsigned nunroll, struct loop *loop),
   NULL)
@@ -2024,10 +2027,10 @@
  /* Compute cost of moving data from a register of class FROM to one of
     TO, using MODE.  */
  DEFHOOK
-
-=== modified file 'gcc/targhooks.c'
---- old/gcc/targhooks.c	2011-01-14 15:02:20 +0000
-+++ new/gcc/targhooks.c	2011-05-03 15:17:25 +0000
+Index: gcc-4_6-branch/gcc/targhooks.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/targhooks.c	2011-06-24 08:33:48.000000000 -0700
++++ gcc-4_6-branch/gcc/targhooks.c	2011-09-16 20:16:00.287564867 -0700
 @@ -1519,4 +1519,15 @@
      { OPT_LEVELS_NONE, 0, NULL, 0 }
    };
@@ -2044,19 +2047,19 @@
 +}
 +
  #include "gt-targhooks.h"
-
-=== modified file 'gcc/targhooks.h'
---- old/gcc/targhooks.h	2011-01-14 15:02:20 +0000
-+++ new/gcc/targhooks.h	2011-05-03 15:17:25 +0000
+Index: gcc-4_6-branch/gcc/targhooks.h
+===================================================================
+--- gcc-4_6-branch.orig/gcc/targhooks.h	2011-06-24 08:33:48.000000000 -0700
++++ gcc-4_6-branch/gcc/targhooks.h	2011-09-16 20:16:00.287564867 -0700
 @@ -183,3 +183,4 @@
  
  extern void *default_get_pch_validity (size_t *);
  extern const char *default_pch_valid_p (const void *, size_t);
 +extern bool default_legitimate_constant_p (enum machine_mode, rtx);
-
-=== added file 'gcc/testsuite/gcc.target/arm/neon-vld3-1.c'
---- old/gcc/testsuite/gcc.target/arm/neon-vld3-1.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon-vld3-1.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon-vld3-1.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon-vld3-1.c	2011-09-16 20:16:00.287564867 -0700
 @@ -0,0 +1,27 @@
 +/* { dg-do run } */
 +/* { dg-require-effective-target arm_neon_hw } */
@@ -2085,10 +2088,10 @@
 +  foo (buffer);
 +  return buffer[0] != 3;
 +}
-
-=== added file 'gcc/testsuite/gcc.target/arm/neon-vst3-1.c'
---- old/gcc/testsuite/gcc.target/arm/neon-vst3-1.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon-vst3-1.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon-vst3-1.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon-vst3-1.c	2011-09-16 20:16:00.287564867 -0700
 @@ -0,0 +1,25 @@
 +/* { dg-do run } */
 +/* { dg-require-effective-target arm_neon_hw } */
@@ -2115,10 +2118,10 @@
 +  foo (buffer);
 +  return buffer[35] != 1;
 +}
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupf32.c	2011-09-16 20:16:00.297564810 -0700
 @@ -15,5 +15,5 @@
    out_float32x4_t = vld1q_dup_f32 (0);
  }
@@ -2126,10 +2129,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp16.c	2011-09-16 20:16:00.297564810 -0700
 @@ -15,5 +15,5 @@
    out_poly16x8_t = vld1q_dup_p16 (0);
  }
@@ -2137,10 +2140,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupp8.c	2011-09-16 20:16:00.297564810 -0700
 @@ -15,5 +15,5 @@
    out_poly8x16_t = vld1q_dup_p8 (0);
  }
@@ -2148,10 +2151,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dups16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups16.c	2011-09-16 20:16:00.297564810 -0700
 @@ -15,5 +15,5 @@
    out_int16x8_t = vld1q_dup_s16 (0);
  }
@@ -2159,10 +2162,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dups32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups32.c	2011-09-16 20:16:00.297564810 -0700
 @@ -15,5 +15,5 @@
    out_int32x4_t = vld1q_dup_s32 (0);
  }
@@ -2170,10 +2173,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dups64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups64.c	2011-09-16 20:16:00.347564808 -0700
 @@ -15,5 +15,5 @@
    out_int64x2_t = vld1q_dup_s64 (0);
  }
@@ -2181,10 +2184,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dups8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dups8.c	2011-09-16 20:16:00.347564808 -0700
 @@ -15,5 +15,5 @@
    out_int8x16_t = vld1q_dup_s8 (0);
  }
@@ -2192,10 +2195,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu16.c	2011-09-16 20:16:00.347564808 -0700
 @@ -15,5 +15,5 @@
    out_uint16x8_t = vld1q_dup_u16 (0);
  }
@@ -2203,10 +2206,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu32.c	2011-09-16 20:16:00.347564808 -0700
 @@ -15,5 +15,5 @@
    out_uint32x4_t = vld1q_dup_u32 (0);
  }
@@ -2214,10 +2217,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu64.c	2011-09-16 20:16:00.347564808 -0700
 @@ -15,5 +15,5 @@
    out_uint64x2_t = vld1q_dup_u64 (0);
  }
@@ -2225,10 +2228,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_dupu8.c	2011-09-16 20:16:00.347564808 -0700
 @@ -15,5 +15,5 @@
    out_uint8x16_t = vld1q_dup_u8 (0);
  }
@@ -2236,10 +2239,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanef32.c	2011-09-16 20:16:00.347564808 -0700
 @@ -16,5 +16,5 @@
    out_float32x4_t = vld1q_lane_f32 (0, arg1_float32x4_t, 1);
  }
@@ -2247,10 +2250,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep16.c	2011-09-16 20:16:00.347564808 -0700
 @@ -16,5 +16,5 @@
    out_poly16x8_t = vld1q_lane_p16 (0, arg1_poly16x8_t, 1);
  }
@@ -2258,10 +2261,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanep8.c	2011-09-16 20:16:00.347564808 -0700
 @@ -16,5 +16,5 @@
    out_poly8x16_t = vld1q_lane_p8 (0, arg1_poly8x16_t, 1);
  }
@@ -2269,10 +2272,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes16.c	2011-09-16 20:16:00.347564808 -0700
 @@ -16,5 +16,5 @@
    out_int16x8_t = vld1q_lane_s16 (0, arg1_int16x8_t, 1);
  }
@@ -2280,10 +2283,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes32.c	2011-09-16 20:16:00.347564808 -0700
 @@ -16,5 +16,5 @@
    out_int32x4_t = vld1q_lane_s32 (0, arg1_int32x4_t, 1);
  }
@@ -2291,10 +2294,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes64.c	2011-09-16 20:16:00.347564808 -0700
 @@ -16,5 +16,5 @@
    out_int64x2_t = vld1q_lane_s64 (0, arg1_int64x2_t, 1);
  }
@@ -2302,10 +2305,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_lanes8.c	2011-09-16 20:16:00.347564808 -0700
 @@ -16,5 +16,5 @@
    out_int8x16_t = vld1q_lane_s8 (0, arg1_int8x16_t, 1);
  }
@@ -2313,10 +2316,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu16.c	2011-09-16 20:16:00.347564808 -0700
 @@ -16,5 +16,5 @@
    out_uint16x8_t = vld1q_lane_u16 (0, arg1_uint16x8_t, 1);
  }
@@ -2324,10 +2327,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu32.c	2011-09-16 20:16:00.347564808 -0700
 @@ -16,5 +16,5 @@
    out_uint32x4_t = vld1q_lane_u32 (0, arg1_uint32x4_t, 1);
  }
@@ -2335,10 +2338,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu64.c	2011-09-16 20:16:00.347564808 -0700
 @@ -16,5 +16,5 @@
    out_uint64x2_t = vld1q_lane_u64 (0, arg1_uint64x2_t, 1);
  }
@@ -2346,10 +2349,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Q_laneu8.c	2011-09-16 20:16:00.347564808 -0700
 @@ -16,5 +16,5 @@
    out_uint8x16_t = vld1q_lane_u8 (0, arg1_uint8x16_t, 1);
  }
@@ -2357,10 +2360,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Qf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Qf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qf32.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_float32x4_t = vld1q_f32 (0);
  }
@@ -2368,10 +2371,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Qp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Qp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qp16.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_poly16x8_t = vld1q_p16 (0);
  }
@@ -2379,10 +2382,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Qp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Qp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qp8.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_poly8x16_t = vld1q_p8 (0);
  }
@@ -2390,10 +2393,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qs16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Qs16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qs16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qs16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Qs16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qs16.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_int16x8_t = vld1q_s16 (0);
  }
@@ -2401,10 +2404,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qs32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Qs32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qs32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qs32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Qs32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qs32.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_int32x4_t = vld1q_s32 (0);
  }
@@ -2412,10 +2415,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qs64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Qs64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qs64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qs64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Qs64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qs64.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_int64x2_t = vld1q_s64 (0);
  }
@@ -2423,10 +2426,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qs8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Qs8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qs8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qs8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Qs8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qs8.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_int8x16_t = vld1q_s8 (0);
  }
@@ -2434,10 +2437,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Qu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Qu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qu16.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_uint16x8_t = vld1q_u16 (0);
  }
@@ -2445,10 +2448,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Qu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Qu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qu32.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_uint32x4_t = vld1q_u32 (0);
  }
@@ -2456,10 +2459,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qu64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Qu64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qu64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qu64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Qu64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qu64.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_uint64x2_t = vld1q_u64 (0);
  }
@@ -2467,10 +2470,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1Qu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1Qu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1Qu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1Qu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1Qu8.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_uint8x16_t = vld1q_u8 (0);
  }
@@ -2478,10 +2481,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_dupf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupf32.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_float32x2_t = vld1_dup_f32 (0);
  }
@@ -2489,10 +2492,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_dupp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupp16.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_poly16x4_t = vld1_dup_p16 (0);
  }
@@ -2500,10 +2503,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_dupp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupp8.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_poly8x8_t = vld1_dup_p8 (0);
  }
@@ -2511,10 +2514,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dups16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_dups16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dups16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dups16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_dups16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dups16.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_int16x4_t = vld1_dup_s16 (0);
  }
@@ -2522,10 +2525,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dups32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_dups32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dups32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dups32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_dups32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dups32.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_int32x2_t = vld1_dup_s32 (0);
  }
@@ -2533,10 +2536,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dups64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_dups64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dups64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dups64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_dups64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dups64.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_int64x1_t = vld1_dup_s64 (0);
  }
@@ -2544,10 +2547,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dups8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_dups8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dups8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dups8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_dups8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dups8.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_int8x8_t = vld1_dup_s8 (0);
  }
@@ -2555,10 +2558,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_dupu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupu16.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_uint16x4_t = vld1_dup_u16 (0);
  }
@@ -2566,10 +2569,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_dupu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupu32.c	2011-09-16 20:16:00.357564842 -0700
 @@ -15,5 +15,5 @@
    out_uint32x2_t = vld1_dup_u32 (0);
  }
@@ -2577,10 +2580,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupu64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupu64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupu64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupu64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_dupu64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupu64.c	2011-09-16 20:16:00.367564848 -0700
 @@ -15,5 +15,5 @@
    out_uint64x1_t = vld1_dup_u64 (0);
  }
@@ -2588,10 +2591,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_dupu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_dupu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_dupu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_dupu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_dupu8.c	2011-09-16 20:16:00.367564848 -0700
 @@ -15,5 +15,5 @@
    out_uint8x8_t = vld1_dup_u8 (0);
  }
@@ -2599,10 +2602,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\\\]\\\})|(\[dD\]\[0-9\]+\\\[\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanef32.c	2011-09-16 20:16:00.367564848 -0700
 @@ -16,5 +16,5 @@
    out_float32x2_t = vld1_lane_f32 (0, arg1_float32x2_t, 1);
  }
@@ -2610,10 +2613,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanep16.c	2011-09-16 20:16:00.367564848 -0700
 @@ -16,5 +16,5 @@
    out_poly16x4_t = vld1_lane_p16 (0, arg1_poly16x4_t, 1);
  }
@@ -2621,10 +2624,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanep8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanep8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanep8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanep8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_lanep8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanep8.c	2011-09-16 20:16:00.367564848 -0700
 @@ -16,5 +16,5 @@
    out_poly8x8_t = vld1_lane_p8 (0, arg1_poly8x8_t, 1);
  }
@@ -2632,10 +2635,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanes16.c	2011-09-16 20:16:00.367564848 -0700
 @@ -16,5 +16,5 @@
    out_int16x4_t = vld1_lane_s16 (0, arg1_int16x4_t, 1);
  }
@@ -2643,10 +2646,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanes32.c	2011-09-16 20:16:00.367564848 -0700
 @@ -16,5 +16,5 @@
    out_int32x2_t = vld1_lane_s32 (0, arg1_int32x2_t, 1);
  }
@@ -2654,10 +2657,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanes64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanes64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanes64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanes64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_lanes64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanes64.c	2011-09-16 20:16:00.367564848 -0700
 @@ -16,5 +16,5 @@
    out_int64x1_t = vld1_lane_s64 (0, arg1_int64x1_t, 0);
  }
@@ -2665,10 +2668,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_lanes8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_lanes8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_lanes8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanes8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_lanes8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_lanes8.c	2011-09-16 20:16:00.367564848 -0700
 @@ -16,5 +16,5 @@
    out_int8x8_t = vld1_lane_s8 (0, arg1_int8x8_t, 1);
  }
@@ -2676,10 +2679,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_laneu16.c	2011-09-16 20:16:00.367564848 -0700
 @@ -16,5 +16,5 @@
    out_uint16x4_t = vld1_lane_u16 (0, arg1_uint16x4_t, 1);
  }
@@ -2687,10 +2690,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_laneu32.c	2011-09-16 20:16:00.367564848 -0700
 @@ -16,5 +16,5 @@
    out_uint32x2_t = vld1_lane_u32 (0, arg1_uint32x2_t, 1);
  }
@@ -2698,10 +2701,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_laneu64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_laneu64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_laneu64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_laneu64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_laneu64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_laneu64.c	2011-09-16 20:16:00.367564848 -0700
 @@ -16,5 +16,5 @@
    out_uint64x1_t = vld1_lane_u64 (0, arg1_uint64x1_t, 0);
  }
@@ -2709,10 +2712,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1_laneu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1_laneu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1_laneu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_laneu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1_laneu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1_laneu8.c	2011-09-16 20:16:00.367564848 -0700
 @@ -16,5 +16,5 @@
    out_uint8x8_t = vld1_lane_u8 (0, arg1_uint8x8_t, 1);
  }
@@ -2720,10 +2723,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1f32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1f32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1f32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1f32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1f32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1f32.c	2011-09-16 20:16:00.367564848 -0700
 @@ -15,5 +15,5 @@
    out_float32x2_t = vld1_f32 (0);
  }
@@ -2731,10 +2734,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1p16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1p16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1p16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1p16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1p16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1p16.c	2011-09-16 20:16:00.377564842 -0700
 @@ -15,5 +15,5 @@
    out_poly16x4_t = vld1_p16 (0);
  }
@@ -2742,10 +2745,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1p8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1p8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1p8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1p8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1p8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1p8.c	2011-09-16 20:16:00.377564842 -0700
 @@ -15,5 +15,5 @@
    out_poly8x8_t = vld1_p8 (0);
  }
@@ -2753,10 +2756,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1s16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1s16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1s16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1s16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1s16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1s16.c	2011-09-16 20:16:00.377564842 -0700
 @@ -15,5 +15,5 @@
    out_int16x4_t = vld1_s16 (0);
  }
@@ -2764,10 +2767,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1s32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1s32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1s32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1s32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1s32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1s32.c	2011-09-16 20:16:00.377564842 -0700
 @@ -15,5 +15,5 @@
    out_int32x2_t = vld1_s32 (0);
  }
@@ -2775,10 +2778,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1s64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1s64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1s64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1s64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1s64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1s64.c	2011-09-16 20:16:00.377564842 -0700
 @@ -15,5 +15,5 @@
    out_int64x1_t = vld1_s64 (0);
  }
@@ -2786,10 +2789,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1s8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1s8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1s8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1s8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1s8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1s8.c	2011-09-16 20:16:00.377564842 -0700
 @@ -15,5 +15,5 @@
    out_int8x8_t = vld1_s8 (0);
  }
@@ -2797,10 +2800,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1u16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1u16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1u16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1u16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1u16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1u16.c	2011-09-16 20:16:00.377564842 -0700
 @@ -15,5 +15,5 @@
    out_uint16x4_t = vld1_u16 (0);
  }
@@ -2808,10 +2811,10 @@
 -/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1u32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1u32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1u32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1u32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1u32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1u32.c	2011-09-16 20:16:00.377564842 -0700
 @@ -15,5 +15,5 @@
    out_uint32x2_t = vld1_u32 (0);
  }
@@ -2819,10 +2822,10 @@
 -/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1u64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1u64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1u64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1u64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1u64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1u64.c	2011-09-16 20:16:00.377564842 -0700
 @@ -15,5 +15,5 @@
    out_uint64x1_t = vld1_u64 (0);
  }
@@ -2830,10 +2833,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld1u8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld1u8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld1u8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1u8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld1u8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld1u8.c	2011-09-16 20:16:00.387564830 -0700
 @@ -15,5 +15,5 @@
    out_uint8x8_t = vld1_u8 (0);
  }
@@ -2841,10 +2844,10 @@
 -/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Q_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanef32.c	2011-09-16 20:16:00.387564830 -0700
 @@ -16,5 +16,5 @@
    out_float32x4x2_t = vld2q_lane_f32 (0, arg1_float32x4x2_t, 1);
  }
@@ -2852,10 +2855,10 @@
 -/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Q_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanep16.c	2011-09-16 20:16:00.387564830 -0700
 @@ -16,5 +16,5 @@
    out_poly16x8x2_t = vld2q_lane_p16 (0, arg1_poly16x8x2_t, 1);
  }
@@ -2863,10 +2866,10 @@
 -/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes16.c	2011-09-16 20:16:00.387564830 -0700
 @@ -16,5 +16,5 @@
    out_int16x8x2_t = vld2q_lane_s16 (0, arg1_int16x8x2_t, 1);
  }
@@ -2874,10 +2877,10 @@
 -/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Q_lanes32.c	2011-09-16 20:16:00.387564830 -0700
 @@ -16,5 +16,5 @@
    out_int32x4x2_t = vld2q_lane_s32 (0, arg1_int32x4x2_t, 1);
  }
@@ -2885,10 +2888,10 @@
 -/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu16.c	2011-09-16 20:16:00.397564843 -0700
 @@ -16,5 +16,5 @@
    out_uint16x8x2_t = vld2q_lane_u16 (0, arg1_uint16x8x2_t, 1);
  }
@@ -2896,10 +2899,10 @@
 -/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Q_laneu32.c	2011-09-16 20:16:00.397564843 -0700
 @@ -16,5 +16,5 @@
    out_uint32x4x2_t = vld2q_lane_u32 (0, arg1_uint32x4x2_t, 1);
  }
@@ -2907,10 +2910,10 @@
 -/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Qf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Qf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qf32.c	2011-09-16 20:16:00.397564843 -0700
 @@ -15,6 +15,6 @@
    out_float32x4x2_t = vld2q_f32 (0);
  }
@@ -2920,10 +2923,10 @@
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Qp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Qp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qp16.c	2011-09-16 20:16:00.397564843 -0700
 @@ -15,6 +15,6 @@
    out_poly16x8x2_t = vld2q_p16 (0);
  }
@@ -2933,10 +2936,10 @@
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Qp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Qp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qp8.c	2011-09-16 20:16:00.397564843 -0700
 @@ -15,6 +15,6 @@
    out_poly8x16x2_t = vld2q_p8 (0);
  }
@@ -2946,10 +2949,10 @@
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qs16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Qs16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qs16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qs16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Qs16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qs16.c	2011-09-16 20:16:00.397564843 -0700
 @@ -15,6 +15,6 @@
    out_int16x8x2_t = vld2q_s16 (0);
  }
@@ -2959,10 +2962,10 @@
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qs32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Qs32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qs32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qs32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Qs32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qs32.c	2011-09-16 20:16:00.397564843 -0700
 @@ -15,6 +15,6 @@
    out_int32x4x2_t = vld2q_s32 (0);
  }
@@ -2972,10 +2975,10 @@
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qs8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Qs8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qs8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qs8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Qs8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qs8.c	2011-09-16 20:16:00.397564843 -0700
 @@ -15,6 +15,6 @@
    out_int8x16x2_t = vld2q_s8 (0);
  }
@@ -2985,10 +2988,10 @@
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Qu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Qu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qu16.c	2011-09-16 20:16:00.397564843 -0700
 @@ -15,6 +15,6 @@
    out_uint16x8x2_t = vld2q_u16 (0);
  }
@@ -2998,10 +3001,10 @@
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Qu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Qu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qu32.c	2011-09-16 20:16:00.407564879 -0700
 @@ -15,6 +15,6 @@
    out_uint32x4x2_t = vld2q_u32 (0);
  }
@@ -3011,10 +3014,10 @@
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2Qu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2Qu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2Qu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2Qu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2Qu8.c	2011-09-16 20:16:00.407564879 -0700
 @@ -15,6 +15,6 @@
    out_uint8x16x2_t = vld2q_u8 (0);
  }
@@ -3024,10 +3027,10 @@
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_dupf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupf32.c	2011-09-16 20:16:00.407564879 -0700
 @@ -15,5 +15,5 @@
    out_float32x2x2_t = vld2_dup_f32 (0);
  }
@@ -3035,10 +3038,10 @@
 -/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_dupp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupp16.c	2011-09-16 20:16:00.407564879 -0700
 @@ -15,5 +15,5 @@
    out_poly16x4x2_t = vld2_dup_p16 (0);
  }
@@ -3046,10 +3049,10 @@
 -/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_dupp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupp8.c	2011-09-16 20:16:00.407564879 -0700
 @@ -15,5 +15,5 @@
    out_poly8x8x2_t = vld2_dup_p8 (0);
  }
@@ -3057,10 +3060,10 @@
 -/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dups16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_dups16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dups16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dups16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_dups16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dups16.c	2011-09-16 20:16:00.407564879 -0700
 @@ -15,5 +15,5 @@
    out_int16x4x2_t = vld2_dup_s16 (0);
  }
@@ -3068,10 +3071,10 @@
 -/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dups32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_dups32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dups32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dups32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_dups32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dups32.c	2011-09-16 20:16:00.407564879 -0700
 @@ -15,5 +15,5 @@
    out_int32x2x2_t = vld2_dup_s32 (0);
  }
@@ -3079,10 +3082,10 @@
 -/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dups64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_dups64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dups64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dups64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_dups64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dups64.c	2011-09-16 20:16:00.407564879 -0700
 @@ -15,5 +15,5 @@
    out_int64x1x2_t = vld2_dup_s64 (0);
  }
@@ -3090,10 +3093,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dups8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_dups8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dups8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dups8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_dups8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dups8.c	2011-09-16 20:16:00.417564906 -0700
 @@ -15,5 +15,5 @@
    out_int8x8x2_t = vld2_dup_s8 (0);
  }
@@ -3101,10 +3104,10 @@
 -/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_dupu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupu16.c	2011-09-16 20:16:00.417564906 -0700
 @@ -15,5 +15,5 @@
    out_uint16x4x2_t = vld2_dup_u16 (0);
  }
@@ -3112,10 +3115,10 @@
 -/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_dupu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupu32.c	2011-09-16 20:16:00.417564906 -0700
 @@ -15,5 +15,5 @@
    out_uint32x2x2_t = vld2_dup_u32 (0);
  }
@@ -3123,10 +3126,10 @@
 -/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupu64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupu64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupu64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupu64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_dupu64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupu64.c	2011-09-16 20:16:00.417564906 -0700
 @@ -15,5 +15,5 @@
    out_uint64x1x2_t = vld2_dup_u64 (0);
  }
@@ -3134,10 +3137,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_dupu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_dupu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_dupu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_dupu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_dupu8.c	2011-09-16 20:16:00.417564906 -0700
 @@ -15,5 +15,5 @@
    out_uint8x8x2_t = vld2_dup_u8 (0);
  }
@@ -3145,10 +3148,10 @@
 -/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_lanef32.c	2011-09-16 20:16:00.417564906 -0700
 @@ -16,5 +16,5 @@
    out_float32x2x2_t = vld2_lane_f32 (0, arg1_float32x2x2_t, 1);
  }
@@ -3156,10 +3159,10 @@
 -/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_lanep16.c	2011-09-16 20:16:00.417564906 -0700
 @@ -16,5 +16,5 @@
    out_poly16x4x2_t = vld2_lane_p16 (0, arg1_poly16x4x2_t, 1);
  }
@@ -3167,10 +3170,10 @@
 -/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_lanep8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_lanep8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_lanep8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_lanep8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_lanep8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_lanep8.c	2011-09-16 20:16:00.417564906 -0700
 @@ -16,5 +16,5 @@
    out_poly8x8x2_t = vld2_lane_p8 (0, arg1_poly8x8x2_t, 1);
  }
@@ -3178,10 +3181,10 @@
 -/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_lanes16.c	2011-09-16 20:16:00.417564906 -0700
 @@ -16,5 +16,5 @@
    out_int16x4x2_t = vld2_lane_s16 (0, arg1_int16x4x2_t, 1);
  }
@@ -3189,10 +3192,10 @@
 -/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_lanes32.c	2011-09-16 20:16:00.417564906 -0700
 @@ -16,5 +16,5 @@
    out_int32x2x2_t = vld2_lane_s32 (0, arg1_int32x2x2_t, 1);
  }
@@ -3200,10 +3203,10 @@
 -/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_lanes8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_lanes8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_lanes8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_lanes8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_lanes8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_lanes8.c	2011-09-16 20:16:00.417564906 -0700
 @@ -16,5 +16,5 @@
    out_int8x8x2_t = vld2_lane_s8 (0, arg1_int8x8x2_t, 1);
  }
@@ -3211,10 +3214,10 @@
 -/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_laneu16.c	2011-09-16 20:16:00.417564906 -0700
 @@ -16,5 +16,5 @@
    out_uint16x4x2_t = vld2_lane_u16 (0, arg1_uint16x4x2_t, 1);
  }
@@ -3222,10 +3225,10 @@
 -/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_laneu32.c	2011-09-16 20:16:00.417564906 -0700
 @@ -16,5 +16,5 @@
    out_uint32x2x2_t = vld2_lane_u32 (0, arg1_uint32x2x2_t, 1);
  }
@@ -3233,10 +3236,10 @@
 -/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2_laneu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2_laneu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2_laneu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_laneu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2_laneu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2_laneu8.c	2011-09-16 20:16:00.417564906 -0700
 @@ -16,5 +16,5 @@
    out_uint8x8x2_t = vld2_lane_u8 (0, arg1_uint8x8x2_t, 1);
  }
@@ -3244,10 +3247,10 @@
 -/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2f32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2f32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2f32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2f32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2f32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2f32.c	2011-09-16 20:16:00.427564921 -0700
 @@ -15,5 +15,5 @@
    out_float32x2x2_t = vld2_f32 (0);
  }
@@ -3255,10 +3258,10 @@
 -/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2p16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2p16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2p16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2p16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2p16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2p16.c	2011-09-16 20:16:00.427564921 -0700
 @@ -15,5 +15,5 @@
    out_poly16x4x2_t = vld2_p16 (0);
  }
@@ -3266,10 +3269,10 @@
 -/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2p8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2p8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2p8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2p8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2p8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2p8.c	2011-09-16 20:16:00.427564921 -0700
 @@ -15,5 +15,5 @@
    out_poly8x8x2_t = vld2_p8 (0);
  }
@@ -3277,10 +3280,10 @@
 -/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2s16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2s16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2s16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2s16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2s16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2s16.c	2011-09-16 20:16:00.427564921 -0700
 @@ -15,5 +15,5 @@
    out_int16x4x2_t = vld2_s16 (0);
  }
@@ -3288,10 +3291,10 @@
 -/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2s32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2s32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2s32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2s32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2s32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2s32.c	2011-09-16 20:16:00.427564921 -0700
 @@ -15,5 +15,5 @@
    out_int32x2x2_t = vld2_s32 (0);
  }
@@ -3299,10 +3302,10 @@
 -/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2s64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2s64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2s64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2s64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2s64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2s64.c	2011-09-16 20:16:00.427564921 -0700
 @@ -15,5 +15,5 @@
    out_int64x1x2_t = vld2_s64 (0);
  }
@@ -3310,10 +3313,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2s8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2s8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2s8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2s8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2s8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2s8.c	2011-09-16 20:16:00.437564924 -0700
 @@ -15,5 +15,5 @@
    out_int8x8x2_t = vld2_s8 (0);
  }
@@ -3321,10 +3324,10 @@
 -/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2u16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2u16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2u16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2u16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2u16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2u16.c	2011-09-16 20:16:00.437564924 -0700
 @@ -15,5 +15,5 @@
    out_uint16x4x2_t = vld2_u16 (0);
  }
@@ -3332,10 +3335,10 @@
 -/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2u32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2u32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2u32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2u32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2u32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2u32.c	2011-09-16 20:16:00.437564924 -0700
 @@ -15,5 +15,5 @@
    out_uint32x2x2_t = vld2_u32 (0);
  }
@@ -3343,10 +3346,10 @@
 -/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2u64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2u64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2u64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2u64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2u64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2u64.c	2011-09-16 20:16:00.437564924 -0700
 @@ -15,5 +15,5 @@
    out_uint64x1x2_t = vld2_u64 (0);
  }
@@ -3354,10 +3357,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld2u8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld2u8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld2u8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2u8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld2u8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld2u8.c	2011-09-16 20:16:00.437564924 -0700
 @@ -15,5 +15,5 @@
    out_uint8x8x2_t = vld2_u8 (0);
  }
@@ -3365,10 +3368,10 @@
 -/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Q_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanef32.c	2011-09-16 20:16:00.437564924 -0700
 @@ -16,5 +16,5 @@
    out_float32x4x3_t = vld3q_lane_f32 (0, arg1_float32x4x3_t, 1);
  }
@@ -3376,10 +3379,10 @@
 -/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Q_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanep16.c	2011-09-16 20:16:00.437564924 -0700
 @@ -16,5 +16,5 @@
    out_poly16x8x3_t = vld3q_lane_p16 (0, arg1_poly16x8x3_t, 1);
  }
@@ -3387,10 +3390,10 @@
 -/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes16.c	2011-09-16 20:16:00.447564932 -0700
 @@ -16,5 +16,5 @@
    out_int16x8x3_t = vld3q_lane_s16 (0, arg1_int16x8x3_t, 1);
  }
@@ -3398,10 +3401,10 @@
 -/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Q_lanes32.c	2011-09-16 20:16:00.447564932 -0700
 @@ -16,5 +16,5 @@
    out_int32x4x3_t = vld3q_lane_s32 (0, arg1_int32x4x3_t, 1);
  }
@@ -3409,10 +3412,10 @@
 -/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu16.c	2011-09-16 20:16:00.447564932 -0700
 @@ -16,5 +16,5 @@
    out_uint16x8x3_t = vld3q_lane_u16 (0, arg1_uint16x8x3_t, 1);
  }
@@ -3420,10 +3423,10 @@
 -/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Q_laneu32.c	2011-09-16 20:16:00.447564932 -0700
 @@ -16,5 +16,5 @@
    out_uint32x4x3_t = vld3q_lane_u32 (0, arg1_uint32x4x3_t, 1);
  }
@@ -3431,10 +3434,10 @@
 -/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Qf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Qf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qf32.c	2011-09-16 20:16:00.447564932 -0700
 @@ -15,6 +15,6 @@
    out_float32x4x3_t = vld3q_f32 (0);
  }
@@ -3444,10 +3447,10 @@
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Qp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Qp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qp16.c	2011-09-16 20:16:00.447564932 -0700
 @@ -15,6 +15,6 @@
    out_poly16x8x3_t = vld3q_p16 (0);
  }
@@ -3457,10 +3460,10 @@
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Qp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Qp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qp8.c	2011-09-16 20:16:00.447564932 -0700
 @@ -15,6 +15,6 @@
    out_poly8x16x3_t = vld3q_p8 (0);
  }
@@ -3470,10 +3473,10 @@
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qs16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Qs16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qs16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qs16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Qs16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qs16.c	2011-09-16 20:16:00.447564932 -0700
 @@ -15,6 +15,6 @@
    out_int16x8x3_t = vld3q_s16 (0);
  }
@@ -3483,10 +3486,10 @@
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qs32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Qs32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qs32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qs32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Qs32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qs32.c	2011-09-16 20:16:00.447564932 -0700
 @@ -15,6 +15,6 @@
    out_int32x4x3_t = vld3q_s32 (0);
  }
@@ -3496,10 +3499,10 @@
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qs8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Qs8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qs8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qs8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Qs8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qs8.c	2011-09-16 20:16:00.447564932 -0700
 @@ -15,6 +15,6 @@
    out_int8x16x3_t = vld3q_s8 (0);
  }
@@ -3509,10 +3512,10 @@
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Qu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Qu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qu16.c	2011-09-16 20:16:00.447564932 -0700
 @@ -15,6 +15,6 @@
    out_uint16x8x3_t = vld3q_u16 (0);
  }
@@ -3522,10 +3525,10 @@
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Qu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Qu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qu32.c	2011-09-16 20:16:00.447564932 -0700
 @@ -15,6 +15,6 @@
    out_uint32x4x3_t = vld3q_u32 (0);
  }
@@ -3535,10 +3538,10 @@
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3Qu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3Qu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3Qu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3Qu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3Qu8.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,6 +15,6 @@
    out_uint8x16x3_t = vld3q_u8 (0);
  }
@@ -3548,10 +3551,10 @@
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_dupf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupf32.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_float32x2x3_t = vld3_dup_f32 (0);
  }
@@ -3559,10 +3562,10 @@
 -/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_dupp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupp16.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_poly16x4x3_t = vld3_dup_p16 (0);
  }
@@ -3570,10 +3573,10 @@
 -/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_dupp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupp8.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_poly8x8x3_t = vld3_dup_p8 (0);
  }
@@ -3581,10 +3584,10 @@
 -/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dups16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_dups16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dups16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dups16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_dups16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dups16.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_int16x4x3_t = vld3_dup_s16 (0);
  }
@@ -3592,10 +3595,10 @@
 -/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dups32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_dups32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dups32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dups32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_dups32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dups32.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_int32x2x3_t = vld3_dup_s32 (0);
  }
@@ -3603,10 +3606,10 @@
 -/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dups64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_dups64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dups64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dups64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_dups64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dups64.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_int64x1x3_t = vld3_dup_s64 (0);
  }
@@ -3614,10 +3617,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dups8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_dups8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dups8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dups8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_dups8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dups8.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_int8x8x3_t = vld3_dup_s8 (0);
  }
@@ -3625,10 +3628,10 @@
 -/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_dupu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupu16.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_uint16x4x3_t = vld3_dup_u16 (0);
  }
@@ -3636,10 +3639,10 @@
 -/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_dupu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupu32.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_uint32x2x3_t = vld3_dup_u32 (0);
  }
@@ -3647,10 +3650,10 @@
 -/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupu64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupu64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupu64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupu64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_dupu64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupu64.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_uint64x1x3_t = vld3_dup_u64 (0);
  }
@@ -3658,10 +3661,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_dupu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_dupu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_dupu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_dupu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_dupu8.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_uint8x8x3_t = vld3_dup_u8 (0);
  }
@@ -3669,10 +3672,10 @@
 -/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_lanef32.c	2011-09-16 20:16:00.457564944 -0700
 @@ -16,5 +16,5 @@
    out_float32x2x3_t = vld3_lane_f32 (0, arg1_float32x2x3_t, 1);
  }
@@ -3680,10 +3683,10 @@
 -/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_lanep16.c	2011-09-16 20:16:00.457564944 -0700
 @@ -16,5 +16,5 @@
    out_poly16x4x3_t = vld3_lane_p16 (0, arg1_poly16x4x3_t, 1);
  }
@@ -3691,10 +3694,10 @@
 -/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_lanep8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_lanep8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_lanep8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_lanep8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_lanep8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_lanep8.c	2011-09-16 20:16:00.457564944 -0700
 @@ -16,5 +16,5 @@
    out_poly8x8x3_t = vld3_lane_p8 (0, arg1_poly8x8x3_t, 1);
  }
@@ -3702,10 +3705,10 @@
 -/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_lanes16.c	2011-09-16 20:16:00.457564944 -0700
 @@ -16,5 +16,5 @@
    out_int16x4x3_t = vld3_lane_s16 (0, arg1_int16x4x3_t, 1);
  }
@@ -3713,10 +3716,10 @@
 -/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_lanes32.c	2011-09-16 20:16:00.457564944 -0700
 @@ -16,5 +16,5 @@
    out_int32x2x3_t = vld3_lane_s32 (0, arg1_int32x2x3_t, 1);
  }
@@ -3724,10 +3727,10 @@
 -/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_lanes8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_lanes8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_lanes8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_lanes8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_lanes8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_lanes8.c	2011-09-16 20:16:00.457564944 -0700
 @@ -16,5 +16,5 @@
    out_int8x8x3_t = vld3_lane_s8 (0, arg1_int8x8x3_t, 1);
  }
@@ -3735,10 +3738,10 @@
 -/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_laneu16.c	2011-09-16 20:16:00.457564944 -0700
 @@ -16,5 +16,5 @@
    out_uint16x4x3_t = vld3_lane_u16 (0, arg1_uint16x4x3_t, 1);
  }
@@ -3746,10 +3749,10 @@
 -/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_laneu32.c	2011-09-16 20:16:00.457564944 -0700
 @@ -16,5 +16,5 @@
    out_uint32x2x3_t = vld3_lane_u32 (0, arg1_uint32x2x3_t, 1);
  }
@@ -3757,10 +3760,10 @@
 -/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3_laneu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3_laneu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3_laneu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_laneu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3_laneu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3_laneu8.c	2011-09-16 20:16:00.457564944 -0700
 @@ -16,5 +16,5 @@
    out_uint8x8x3_t = vld3_lane_u8 (0, arg1_uint8x8x3_t, 1);
  }
@@ -3768,10 +3771,10 @@
 -/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3f32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3f32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3f32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3f32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3f32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3f32.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_float32x2x3_t = vld3_f32 (0);
  }
@@ -3779,10 +3782,10 @@
 -/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3p16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3p16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3p16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3p16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3p16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3p16.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_poly16x4x3_t = vld3_p16 (0);
  }
@@ -3790,10 +3793,10 @@
 -/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3p8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3p8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3p8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3p8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3p8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3p8.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_poly8x8x3_t = vld3_p8 (0);
  }
@@ -3801,10 +3804,10 @@
 -/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3s16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3s16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3s16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3s16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3s16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3s16.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_int16x4x3_t = vld3_s16 (0);
  }
@@ -3812,10 +3815,10 @@
 -/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3s32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3s32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3s32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3s32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3s32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3s32.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_int32x2x3_t = vld3_s32 (0);
  }
@@ -3823,10 +3826,10 @@
 -/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3s64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3s64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3s64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3s64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3s64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3s64.c	2011-09-16 20:16:00.457564944 -0700
 @@ -15,5 +15,5 @@
    out_int64x1x3_t = vld3_s64 (0);
  }
@@ -3834,10 +3837,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3s8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3s8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3s8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3s8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3s8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3s8.c	2011-09-16 20:16:00.467564964 -0700
 @@ -15,5 +15,5 @@
    out_int8x8x3_t = vld3_s8 (0);
  }
@@ -3845,10 +3848,10 @@
 -/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3u16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3u16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3u16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3u16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3u16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3u16.c	2011-09-16 20:16:00.467564964 -0700
 @@ -15,5 +15,5 @@
    out_uint16x4x3_t = vld3_u16 (0);
  }
@@ -3856,10 +3859,10 @@
 -/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3u32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3u32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3u32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3u32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3u32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3u32.c	2011-09-16 20:16:00.467564964 -0700
 @@ -15,5 +15,5 @@
    out_uint32x2x3_t = vld3_u32 (0);
  }
@@ -3867,10 +3870,10 @@
 -/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3u64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3u64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3u64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3u64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3u64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3u64.c	2011-09-16 20:16:00.467564964 -0700
 @@ -15,5 +15,5 @@
    out_uint64x1x3_t = vld3_u64 (0);
  }
@@ -3878,10 +3881,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld3u8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld3u8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld3u8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3u8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld3u8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld3u8.c	2011-09-16 20:16:00.467564964 -0700
 @@ -15,5 +15,5 @@
    out_uint8x8x3_t = vld3_u8 (0);
  }
@@ -3889,10 +3892,10 @@
 -/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Q_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanef32.c	2011-09-16 20:16:00.467564964 -0700
 @@ -16,5 +16,5 @@
    out_float32x4x4_t = vld4q_lane_f32 (0, arg1_float32x4x4_t, 1);
  }
@@ -3900,10 +3903,10 @@
 -/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Q_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanep16.c	2011-09-16 20:16:00.467564964 -0700
 @@ -16,5 +16,5 @@
    out_poly16x8x4_t = vld4q_lane_p16 (0, arg1_poly16x8x4_t, 1);
  }
@@ -3911,10 +3914,10 @@
 -/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes16.c	2011-09-16 20:16:00.467564964 -0700
 @@ -16,5 +16,5 @@
    out_int16x8x4_t = vld4q_lane_s16 (0, arg1_int16x8x4_t, 1);
  }
@@ -3922,10 +3925,10 @@
 -/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Q_lanes32.c	2011-09-16 20:16:00.467564964 -0700
 @@ -16,5 +16,5 @@
    out_int32x4x4_t = vld4q_lane_s32 (0, arg1_int32x4x4_t, 1);
  }
@@ -3933,10 +3936,10 @@
 -/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu16.c	2011-09-16 20:16:00.467564964 -0700
 @@ -16,5 +16,5 @@
    out_uint16x8x4_t = vld4q_lane_u16 (0, arg1_uint16x8x4_t, 1);
  }
@@ -3944,10 +3947,10 @@
 -/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Q_laneu32.c	2011-09-16 20:16:00.467564964 -0700
 @@ -16,5 +16,5 @@
    out_uint32x4x4_t = vld4q_lane_u32 (0, arg1_uint32x4x4_t, 1);
  }
@@ -3955,10 +3958,10 @@
 -/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Qf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Qf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qf32.c	2011-09-16 20:16:00.467564964 -0700
 @@ -15,6 +15,6 @@
    out_float32x4x4_t = vld4q_f32 (0);
  }
@@ -3968,10 +3971,10 @@
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Qp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Qp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qp16.c	2011-09-16 20:16:00.467564964 -0700
 @@ -15,6 +15,6 @@
    out_poly16x8x4_t = vld4q_p16 (0);
  }
@@ -3981,10 +3984,10 @@
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Qp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Qp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qp8.c	2011-09-16 20:16:00.467564964 -0700
 @@ -15,6 +15,6 @@
    out_poly8x16x4_t = vld4q_p8 (0);
  }
@@ -3994,10 +3997,10 @@
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qs16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Qs16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qs16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qs16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Qs16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qs16.c	2011-09-16 20:16:00.477564991 -0700
 @@ -15,6 +15,6 @@
    out_int16x8x4_t = vld4q_s16 (0);
  }
@@ -4007,10 +4010,10 @@
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qs32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Qs32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qs32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qs32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Qs32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qs32.c	2011-09-16 20:16:00.477564991 -0700
 @@ -15,6 +15,6 @@
    out_int32x4x4_t = vld4q_s32 (0);
  }
@@ -4020,10 +4023,10 @@
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qs8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Qs8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qs8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qs8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Qs8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qs8.c	2011-09-16 20:16:00.477564991 -0700
 @@ -15,6 +15,6 @@
    out_int8x16x4_t = vld4q_s8 (0);
  }
@@ -4033,10 +4036,10 @@
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Qu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Qu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qu16.c	2011-09-16 20:16:00.477564991 -0700
 @@ -15,6 +15,6 @@
    out_uint16x8x4_t = vld4q_u16 (0);
  }
@@ -4046,10 +4049,10 @@
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Qu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Qu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qu32.c	2011-09-16 20:16:00.477564991 -0700
 @@ -15,6 +15,6 @@
    out_uint32x4x4_t = vld4q_u32 (0);
  }
@@ -4059,10 +4062,10 @@
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4Qu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4Qu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4Qu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4Qu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4Qu8.c	2011-09-16 20:16:00.477564991 -0700
 @@ -15,6 +15,6 @@
    out_uint8x16x4_t = vld4q_u8 (0);
  }
@@ -4072,10 +4075,10 @@
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_dupf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupf32.c	2011-09-16 20:16:00.477564991 -0700
 @@ -15,5 +15,5 @@
    out_float32x2x4_t = vld4_dup_f32 (0);
  }
@@ -4083,10 +4086,10 @@
 -/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_dupp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupp16.c	2011-09-16 20:16:00.477564991 -0700
 @@ -15,5 +15,5 @@
    out_poly16x4x4_t = vld4_dup_p16 (0);
  }
@@ -4094,10 +4097,10 @@
 -/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_dupp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupp8.c	2011-09-16 20:16:00.477564991 -0700
 @@ -15,5 +15,5 @@
    out_poly8x8x4_t = vld4_dup_p8 (0);
  }
@@ -4105,10 +4108,10 @@
 -/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dups16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_dups16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dups16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dups16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_dups16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dups16.c	2011-09-16 20:16:00.477564991 -0700
 @@ -15,5 +15,5 @@
    out_int16x4x4_t = vld4_dup_s16 (0);
  }
@@ -4116,10 +4119,10 @@
 -/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dups32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_dups32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dups32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dups32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_dups32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dups32.c	2011-09-16 20:16:00.477564991 -0700
 @@ -15,5 +15,5 @@
    out_int32x2x4_t = vld4_dup_s32 (0);
  }
@@ -4127,10 +4130,10 @@
 -/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dups64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_dups64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dups64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dups64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_dups64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dups64.c	2011-09-16 20:16:00.487565006 -0700
 @@ -15,5 +15,5 @@
    out_int64x1x4_t = vld4_dup_s64 (0);
  }
@@ -4138,10 +4141,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dups8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_dups8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dups8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dups8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_dups8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dups8.c	2011-09-16 20:16:00.487565006 -0700
 @@ -15,5 +15,5 @@
    out_int8x8x4_t = vld4_dup_s8 (0);
  }
@@ -4149,10 +4152,10 @@
 -/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_dupu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupu16.c	2011-09-16 20:16:00.487565006 -0700
 @@ -15,5 +15,5 @@
    out_uint16x4x4_t = vld4_dup_u16 (0);
  }
@@ -4160,10 +4163,10 @@
 -/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_dupu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupu32.c	2011-09-16 20:16:00.487565006 -0700
 @@ -15,5 +15,5 @@
    out_uint32x2x4_t = vld4_dup_u32 (0);
  }
@@ -4171,10 +4174,10 @@
 -/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupu64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupu64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupu64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupu64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_dupu64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupu64.c	2011-09-16 20:16:00.487565006 -0700
 @@ -15,5 +15,5 @@
    out_uint64x1x4_t = vld4_dup_u64 (0);
  }
@@ -4182,10 +4185,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_dupu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_dupu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_dupu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_dupu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_dupu8.c	2011-09-16 20:16:00.487565006 -0700
 @@ -15,5 +15,5 @@
    out_uint8x8x4_t = vld4_dup_u8 (0);
  }
@@ -4193,10 +4196,10 @@
 -/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\\\]-\[dD\]\[0-9\]+\\\[\\\])|(\[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\], \[dD\]\[0-9\]+\\\[\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_lanef32.c	2011-09-16 20:16:00.487565006 -0700
 @@ -16,5 +16,5 @@
    out_float32x2x4_t = vld4_lane_f32 (0, arg1_float32x2x4_t, 1);
  }
@@ -4204,10 +4207,10 @@
 -/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_lanep16.c	2011-09-16 20:16:00.487565006 -0700
 @@ -16,5 +16,5 @@
    out_poly16x4x4_t = vld4_lane_p16 (0, arg1_poly16x4x4_t, 1);
  }
@@ -4215,10 +4218,10 @@
 -/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_lanep8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_lanep8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_lanep8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_lanep8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_lanep8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_lanep8.c	2011-09-16 20:16:00.487565006 -0700
 @@ -16,5 +16,5 @@
    out_poly8x8x4_t = vld4_lane_p8 (0, arg1_poly8x8x4_t, 1);
  }
@@ -4226,10 +4229,10 @@
 -/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_lanes16.c	2011-09-16 20:16:00.497565009 -0700
 @@ -16,5 +16,5 @@
    out_int16x4x4_t = vld4_lane_s16 (0, arg1_int16x4x4_t, 1);
  }
@@ -4237,10 +4240,10 @@
 -/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_lanes32.c	2011-09-16 20:16:00.497565009 -0700
 @@ -16,5 +16,5 @@
    out_int32x2x4_t = vld4_lane_s32 (0, arg1_int32x2x4_t, 1);
  }
@@ -4248,10 +4251,10 @@
 -/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_lanes8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_lanes8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_lanes8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_lanes8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_lanes8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_lanes8.c	2011-09-16 20:16:00.497565009 -0700
 @@ -16,5 +16,5 @@
    out_int8x8x4_t = vld4_lane_s8 (0, arg1_int8x8x4_t, 1);
  }
@@ -4259,10 +4262,10 @@
 -/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_laneu16.c	2011-09-16 20:16:00.497565009 -0700
 @@ -16,5 +16,5 @@
    out_uint16x4x4_t = vld4_lane_u16 (0, arg1_uint16x4x4_t, 1);
  }
@@ -4270,10 +4273,10 @@
 -/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_laneu32.c	2011-09-16 20:16:00.497565009 -0700
 @@ -16,5 +16,5 @@
    out_uint32x2x4_t = vld4_lane_u32 (0, arg1_uint32x2x4_t, 1);
  }
@@ -4281,10 +4284,10 @@
 -/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4_laneu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4_laneu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4_laneu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_laneu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4_laneu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4_laneu8.c	2011-09-16 20:16:00.497565009 -0700
 @@ -16,5 +16,5 @@
    out_uint8x8x4_t = vld4_lane_u8 (0, arg1_uint8x8x4_t, 1);
  }
@@ -4292,10 +4295,10 @@
 -/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4f32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4f32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4f32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4f32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4f32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4f32.c	2011-09-16 20:16:00.497565009 -0700
 @@ -15,5 +15,5 @@
    out_float32x2x4_t = vld4_f32 (0);
  }
@@ -4303,10 +4306,10 @@
 -/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4p16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4p16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4p16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4p16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4p16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4p16.c	2011-09-16 20:16:00.497565009 -0700
 @@ -15,5 +15,5 @@
    out_poly16x4x4_t = vld4_p16 (0);
  }
@@ -4314,10 +4317,10 @@
 -/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4p8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4p8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4p8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4p8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4p8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4p8.c	2011-09-16 20:16:00.497565009 -0700
 @@ -15,5 +15,5 @@
    out_poly8x8x4_t = vld4_p8 (0);
  }
@@ -4325,10 +4328,10 @@
 -/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4s16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4s16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4s16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4s16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4s16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4s16.c	2011-09-16 20:16:00.497565009 -0700
 @@ -15,5 +15,5 @@
    out_int16x4x4_t = vld4_s16 (0);
  }
@@ -4336,10 +4339,10 @@
 -/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4s32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4s32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4s32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4s32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4s32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4s32.c	2011-09-16 20:16:00.497565009 -0700
 @@ -15,5 +15,5 @@
    out_int32x2x4_t = vld4_s32 (0);
  }
@@ -4347,10 +4350,10 @@
 -/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4s64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4s64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4s64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4s64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4s64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4s64.c	2011-09-16 20:16:00.497565009 -0700
 @@ -15,5 +15,5 @@
    out_int64x1x4_t = vld4_s64 (0);
  }
@@ -4358,10 +4361,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4s8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4s8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4s8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4s8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4s8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4s8.c	2011-09-16 20:16:00.497565009 -0700
 @@ -15,5 +15,5 @@
    out_int8x8x4_t = vld4_s8 (0);
  }
@@ -4369,10 +4372,10 @@
 -/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4u16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4u16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4u16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4u16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4u16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4u16.c	2011-09-16 20:16:00.497565009 -0700
 @@ -15,5 +15,5 @@
    out_uint16x4x4_t = vld4_u16 (0);
  }
@@ -4380,10 +4383,10 @@
 -/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4u32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4u32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4u32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4u32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4u32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4u32.c	2011-09-16 20:16:00.507565013 -0700
 @@ -15,5 +15,5 @@
    out_uint32x2x4_t = vld4_u32 (0);
  }
@@ -4391,10 +4394,10 @@
 -/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4u64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4u64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4u64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4u64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4u64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4u64.c	2011-09-16 20:16:00.507565013 -0700
 @@ -15,5 +15,5 @@
    out_uint64x1x4_t = vld4_u64 (0);
  }
@@ -4402,10 +4405,10 @@
 -/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vld4u8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vld4u8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vld4u8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4u8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vld4u8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vld4u8.c	2011-09-16 20:16:00.507565013 -0700
 @@ -15,5 +15,5 @@
    out_uint8x8x4_t = vld4_u8 (0);
  }
@@ -4413,10 +4416,10 @@
 -/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vld4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanef32.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_lane_f32 (arg0_float32_t, arg1_float32x4_t, 1);
  }
@@ -4424,10 +4427,10 @@
 -/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep16.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_lane_p16 (arg0_poly16_t, arg1_poly16x8_t, 1);
  }
@@ -4435,10 +4438,10 @@
 -/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanep8.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_lane_p8 (arg0_poly8_t, arg1_poly8x16_t, 1);
  }
@@ -4446,10 +4449,10 @@
 -/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes16.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_lane_s16 (arg0_int16_t, arg1_int16x8_t, 1);
  }
@@ -4457,10 +4460,10 @@
 -/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes32.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_lane_s32 (arg0_int32_t, arg1_int32x4_t, 1);
  }
@@ -4468,10 +4471,10 @@
 -/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes64.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_lane_s64 (arg0_int64_t, arg1_int64x2_t, 1);
  }
@@ -4479,10 +4482,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_lanes8.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_lane_s8 (arg0_int8_t, arg1_int8x16_t, 1);
  }
@@ -4490,10 +4493,10 @@
 -/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu16.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_lane_u16 (arg0_uint16_t, arg1_uint16x8_t, 1);
  }
@@ -4501,10 +4504,10 @@
 -/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu32.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_lane_u32 (arg0_uint32_t, arg1_uint32x4_t, 1);
  }
@@ -4512,10 +4515,10 @@
 -/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu64.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_lane_u64 (arg0_uint64_t, arg1_uint64x2_t, 1);
  }
@@ -4523,10 +4526,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Q_laneu8.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_lane_u8 (arg0_uint8_t, arg1_uint8x16_t, 1);
  }
@@ -4534,10 +4537,10 @@
 -/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Qf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Qf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qf32.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_f32 (arg0_float32_t, arg1_float32x4_t);
  }
@@ -4545,10 +4548,10 @@
 -/* { dg-final { scan-assembler "vst1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Qp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Qp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qp16.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_p16 (arg0_poly16_t, arg1_poly16x8_t);
  }
@@ -4556,10 +4559,10 @@
 -/* { dg-final { scan-assembler "vst1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Qp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Qp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qp8.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_p8 (arg0_poly8_t, arg1_poly8x16_t);
  }
@@ -4567,10 +4570,10 @@
 -/* { dg-final { scan-assembler "vst1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qs16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Qs16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qs16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qs16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Qs16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qs16.c	2011-09-16 20:16:00.507565013 -0700
 @@ -16,5 +16,5 @@
    vst1q_s16 (arg0_int16_t, arg1_int16x8_t);
  }
@@ -4578,10 +4581,10 @@
 -/* { dg-final { scan-assembler "vst1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qs32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Qs32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qs32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qs32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Qs32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qs32.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1q_s32 (arg0_int32_t, arg1_int32x4_t);
  }
@@ -4589,10 +4592,10 @@
 -/* { dg-final { scan-assembler "vst1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qs64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Qs64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qs64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qs64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Qs64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qs64.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1q_s64 (arg0_int64_t, arg1_int64x2_t);
  }
@@ -4600,10 +4603,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qs8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Qs8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qs8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qs8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Qs8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qs8.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1q_s8 (arg0_int8_t, arg1_int8x16_t);
  }
@@ -4611,10 +4614,10 @@
 -/* { dg-final { scan-assembler "vst1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Qu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Qu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qu16.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1q_u16 (arg0_uint16_t, arg1_uint16x8_t);
  }
@@ -4622,10 +4625,10 @@
 -/* { dg-final { scan-assembler "vst1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Qu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Qu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qu32.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1q_u32 (arg0_uint32_t, arg1_uint32x4_t);
  }
@@ -4633,10 +4636,10 @@
 -/* { dg-final { scan-assembler "vst1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qu64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Qu64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qu64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qu64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Qu64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qu64.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1q_u64 (arg0_uint64_t, arg1_uint64x2_t);
  }
@@ -4644,10 +4647,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1Qu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1Qu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1Qu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1Qu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1Qu8.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1q_u8 (arg0_uint8_t, arg1_uint8x16_t);
  }
@@ -4655,10 +4658,10 @@
 -/* { dg-final { scan-assembler "vst1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanef32.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_lane_f32 (arg0_float32_t, arg1_float32x2_t, 1);
  }
@@ -4666,10 +4669,10 @@
 -/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanep16.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_lane_p16 (arg0_poly16_t, arg1_poly16x4_t, 1);
  }
@@ -4677,10 +4680,10 @@
 -/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanep8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanep8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanep8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanep8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1_lanep8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanep8.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_lane_p8 (arg0_poly8_t, arg1_poly8x8_t, 1);
  }
@@ -4688,10 +4691,10 @@
 -/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanes16.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_lane_s16 (arg0_int16_t, arg1_int16x4_t, 1);
  }
@@ -4699,10 +4702,10 @@
 -/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanes32.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_lane_s32 (arg0_int32_t, arg1_int32x2_t, 1);
  }
@@ -4710,10 +4713,10 @@
 -/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanes64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanes64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanes64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanes64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1_lanes64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanes64.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_lane_s64 (arg0_int64_t, arg1_int64x1_t, 0);
  }
@@ -4721,10 +4724,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_lanes8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1_lanes8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1_lanes8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanes8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1_lanes8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_lanes8.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_lane_s8 (arg0_int8_t, arg1_int8x8_t, 1);
  }
@@ -4732,10 +4735,10 @@
 -/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_laneu16.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_lane_u16 (arg0_uint16_t, arg1_uint16x4_t, 1);
  }
@@ -4743,10 +4746,10 @@
 -/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_laneu32.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_lane_u32 (arg0_uint32_t, arg1_uint32x2_t, 1);
  }
@@ -4754,10 +4757,10 @@
 -/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_laneu64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1_laneu64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1_laneu64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_laneu64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1_laneu64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_laneu64.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_lane_u64 (arg0_uint64_t, arg1_uint64x1_t, 0);
  }
@@ -4765,10 +4768,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1_laneu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1_laneu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1_laneu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_laneu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1_laneu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1_laneu8.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_lane_u8 (arg0_uint8_t, arg1_uint8x8_t, 1);
  }
@@ -4776,10 +4779,10 @@
 -/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]\\\})|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1f32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1f32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1f32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1f32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1f32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1f32.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_f32 (arg0_float32_t, arg1_float32x2_t);
  }
@@ -4787,10 +4790,10 @@
 -/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1p16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1p16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1p16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1p16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1p16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1p16.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_p16 (arg0_poly16_t, arg1_poly16x4_t);
  }
@@ -4798,10 +4801,10 @@
 -/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1p8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1p8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1p8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1p8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1p8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1p8.c	2011-09-16 20:16:00.517565031 -0700
 @@ -16,5 +16,5 @@
    vst1_p8 (arg0_poly8_t, arg1_poly8x8_t);
  }
@@ -4809,10 +4812,10 @@
 -/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1s16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1s16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1s16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1s16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1s16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1s16.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst1_s16 (arg0_int16_t, arg1_int16x4_t);
  }
@@ -4820,10 +4823,10 @@
 -/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1s32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1s32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1s32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1s32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1s32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1s32.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst1_s32 (arg0_int32_t, arg1_int32x2_t);
  }
@@ -4831,10 +4834,10 @@
 -/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1s64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1s64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1s64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1s64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1s64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1s64.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst1_s64 (arg0_int64_t, arg1_int64x1_t);
  }
@@ -4842,10 +4845,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1s8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1s8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1s8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1s8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1s8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1s8.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst1_s8 (arg0_int8_t, arg1_int8x8_t);
  }
@@ -4853,10 +4856,10 @@
 -/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1u16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1u16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1u16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1u16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1u16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1u16.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst1_u16 (arg0_uint16_t, arg1_uint16x4_t);
  }
@@ -4864,10 +4867,10 @@
 -/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.16\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1u32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1u32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1u32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1u32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1u32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1u32.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst1_u32 (arg0_uint32_t, arg1_uint32x2_t);
  }
@@ -4875,10 +4878,10 @@
 -/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.32\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1u64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1u64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1u64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1u64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1u64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1u64.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst1_u64 (arg0_uint64_t, arg1_uint64x1_t);
  }
@@ -4886,10 +4889,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst1u8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst1u8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst1u8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1u8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst1u8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst1u8.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst1_u8 (arg0_uint8_t, arg1_uint8x8_t);
  }
@@ -4897,10 +4900,10 @@
 -/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.8\[ 	\]+((\\\{\[dD\]\[0-9\]+\\\})|(\[dD\]\[0-9\]+)), \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Q_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanef32.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst2q_lane_f32 (arg0_float32_t, arg1_float32x4x2_t, 1);
  }
@@ -4908,10 +4911,10 @@
 -/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Q_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanep16.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst2q_lane_p16 (arg0_poly16_t, arg1_poly16x8x2_t, 1);
  }
@@ -4919,10 +4922,10 @@
 -/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes16.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst2q_lane_s16 (arg0_int16_t, arg1_int16x8x2_t, 1);
  }
@@ -4930,10 +4933,10 @@
 -/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Q_lanes32.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst2q_lane_s32 (arg0_int32_t, arg1_int32x4x2_t, 1);
  }
@@ -4941,10 +4944,10 @@
 -/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu16.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst2q_lane_u16 (arg0_uint16_t, arg1_uint16x8x2_t, 1);
  }
@@ -4952,10 +4955,10 @@
 -/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Q_laneu32.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,5 +16,5 @@
    vst2q_lane_u32 (arg0_uint32_t, arg1_uint32x4x2_t, 1);
  }
@@ -4963,10 +4966,10 @@
 -/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Qf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Qf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qf32.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,6 +16,6 @@
    vst2q_f32 (arg0_float32_t, arg1_float32x4x2_t);
  }
@@ -4976,10 +4979,10 @@
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Qp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Qp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qp16.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,6 +16,6 @@
    vst2q_p16 (arg0_poly16_t, arg1_poly16x8x2_t);
  }
@@ -4989,10 +4992,10 @@
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Qp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Qp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qp8.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,6 +16,6 @@
    vst2q_p8 (arg0_poly8_t, arg1_poly8x16x2_t);
  }
@@ -5002,10 +5005,10 @@
 +/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qs16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Qs16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qs16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qs16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Qs16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qs16.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,6 +16,6 @@
    vst2q_s16 (arg0_int16_t, arg1_int16x8x2_t);
  }
@@ -5015,10 +5018,10 @@
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qs32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Qs32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qs32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qs32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Qs32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qs32.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,6 +16,6 @@
    vst2q_s32 (arg0_int32_t, arg1_int32x4x2_t);
  }
@@ -5028,10 +5031,10 @@
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qs8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Qs8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qs8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qs8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Qs8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qs8.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,6 +16,6 @@
    vst2q_s8 (arg0_int8_t, arg1_int8x16x2_t);
  }
@@ -5041,10 +5044,10 @@
 +/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Qu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Qu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qu16.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,6 +16,6 @@
    vst2q_u16 (arg0_uint16_t, arg1_uint16x8x2_t);
  }
@@ -5054,10 +5057,10 @@
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Qu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Qu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qu32.c	2011-09-16 20:16:00.527565060 -0700
 @@ -16,6 +16,6 @@
    vst2q_u32 (arg0_uint32_t, arg1_uint32x4x2_t);
  }
@@ -5067,10 +5070,10 @@
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2Qu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2Qu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2Qu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2Qu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2Qu8.c	2011-09-16 20:16:00.537565077 -0700
 @@ -16,6 +16,6 @@
    vst2q_u8 (arg0_uint8_t, arg1_uint8x16x2_t);
  }
@@ -5080,10 +5083,10 @@
 +/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_lanef32.c	2011-09-16 20:16:00.537565077 -0700
 @@ -16,5 +16,5 @@
    vst2_lane_f32 (arg0_float32_t, arg1_float32x2x2_t, 1);
  }
@@ -5091,10 +5094,10 @@
 -/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_lanep16.c	2011-09-16 20:16:00.537565077 -0700
 @@ -16,5 +16,5 @@
    vst2_lane_p16 (arg0_poly16_t, arg1_poly16x4x2_t, 1);
  }
@@ -5102,10 +5105,10 @@
 -/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_lanep8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2_lanep8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2_lanep8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_lanep8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2_lanep8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_lanep8.c	2011-09-16 20:16:00.537565077 -0700
 @@ -16,5 +16,5 @@
    vst2_lane_p8 (arg0_poly8_t, arg1_poly8x8x2_t, 1);
  }
@@ -5113,10 +5116,10 @@
 -/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_lanes16.c	2011-09-16 20:16:00.537565077 -0700
 @@ -16,5 +16,5 @@
    vst2_lane_s16 (arg0_int16_t, arg1_int16x4x2_t, 1);
  }
@@ -5124,10 +5127,10 @@
 -/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_lanes32.c	2011-09-16 20:16:00.537565077 -0700
 @@ -16,5 +16,5 @@
    vst2_lane_s32 (arg0_int32_t, arg1_int32x2x2_t, 1);
  }
@@ -5135,10 +5138,10 @@
 -/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_lanes8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2_lanes8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2_lanes8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_lanes8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2_lanes8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_lanes8.c	2011-09-16 20:16:00.537565077 -0700
 @@ -16,5 +16,5 @@
    vst2_lane_s8 (arg0_int8_t, arg1_int8x8x2_t, 1);
  }
@@ -5146,10 +5149,10 @@
 -/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_laneu16.c	2011-09-16 20:16:00.537565077 -0700
 @@ -16,5 +16,5 @@
    vst2_lane_u16 (arg0_uint16_t, arg1_uint16x4x2_t, 1);
  }
@@ -5157,10 +5160,10 @@
 -/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_laneu32.c	2011-09-16 20:16:00.537565077 -0700
 @@ -16,5 +16,5 @@
    vst2_lane_u32 (arg0_uint32_t, arg1_uint32x2x2_t, 1);
  }
@@ -5168,10 +5171,10 @@
 -/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2_laneu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2_laneu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2_laneu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_laneu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2_laneu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2_laneu8.c	2011-09-16 20:16:00.537565077 -0700
 @@ -16,5 +16,5 @@
    vst2_lane_u8 (arg0_uint8_t, arg1_uint8x8x2_t, 1);
  }
@@ -5179,10 +5182,10 @@
 -/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2f32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2f32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2f32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2f32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2f32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2f32.c	2011-09-16 20:16:00.537565077 -0700
 @@ -16,5 +16,5 @@
    vst2_f32 (arg0_float32_t, arg1_float32x2x2_t);
  }
@@ -5190,10 +5193,10 @@
 -/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2p16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2p16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2p16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2p16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2p16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2p16.c	2011-09-16 20:16:00.537565077 -0700
 @@ -16,5 +16,5 @@
    vst2_p16 (arg0_poly16_t, arg1_poly16x4x2_t);
  }
@@ -5201,10 +5204,10 @@
 -/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2p8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2p8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2p8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2p8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2p8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2p8.c	2011-09-16 20:16:00.547565082 -0700
 @@ -16,5 +16,5 @@
    vst2_p8 (arg0_poly8_t, arg1_poly8x8x2_t);
  }
@@ -5212,10 +5215,10 @@
 -/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2s16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2s16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2s16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2s16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2s16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2s16.c	2011-09-16 20:16:00.547565082 -0700
 @@ -16,5 +16,5 @@
    vst2_s16 (arg0_int16_t, arg1_int16x4x2_t);
  }
@@ -5223,10 +5226,10 @@
 -/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2s32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2s32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2s32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2s32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2s32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2s32.c	2011-09-16 20:16:00.547565082 -0700
 @@ -16,5 +16,5 @@
    vst2_s32 (arg0_int32_t, arg1_int32x2x2_t);
  }
@@ -5234,10 +5237,10 @@
 -/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2s64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2s64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2s64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2s64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2s64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2s64.c	2011-09-16 20:16:00.547565082 -0700
 @@ -16,5 +16,5 @@
    vst2_s64 (arg0_int64_t, arg1_int64x1x2_t);
  }
@@ -5245,10 +5248,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2s8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2s8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2s8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2s8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2s8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2s8.c	2011-09-16 20:16:00.547565082 -0700
 @@ -16,5 +16,5 @@
    vst2_s8 (arg0_int8_t, arg1_int8x8x2_t);
  }
@@ -5256,10 +5259,10 @@
 -/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2u16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2u16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2u16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2u16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2u16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2u16.c	2011-09-16 20:16:00.547565082 -0700
 @@ -16,5 +16,5 @@
    vst2_u16 (arg0_uint16_t, arg1_uint16x4x2_t);
  }
@@ -5267,10 +5270,10 @@
 -/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2u32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2u32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2u32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2u32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2u32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2u32.c	2011-09-16 20:16:00.547565082 -0700
 @@ -16,5 +16,5 @@
    vst2_u32 (arg0_uint32_t, arg1_uint32x2x2_t);
  }
@@ -5278,10 +5281,10 @@
 -/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2u64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2u64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2u64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2u64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2u64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2u64.c	2011-09-16 20:16:00.557565092 -0700
 @@ -16,5 +16,5 @@
    vst2_u64 (arg0_uint64_t, arg1_uint64x1x2_t);
  }
@@ -5289,10 +5292,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst2u8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst2u8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst2u8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2u8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst2u8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst2u8.c	2011-09-16 20:16:00.557565092 -0700
 @@ -16,5 +16,5 @@
    vst2_u8 (arg0_uint8_t, arg1_uint8x8x2_t);
  }
@@ -5300,10 +5303,10 @@
 -/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst2\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Q_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanef32.c	2011-09-16 20:16:00.557565092 -0700
 @@ -16,5 +16,5 @@
    vst3q_lane_f32 (arg0_float32_t, arg1_float32x4x3_t, 1);
  }
@@ -5311,10 +5314,10 @@
 -/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Q_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanep16.c	2011-09-16 20:16:00.557565092 -0700
 @@ -16,5 +16,5 @@
    vst3q_lane_p16 (arg0_poly16_t, arg1_poly16x8x3_t, 1);
  }
@@ -5322,10 +5325,10 @@
 -/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes16.c	2011-09-16 20:16:00.557565092 -0700
 @@ -16,5 +16,5 @@
    vst3q_lane_s16 (arg0_int16_t, arg1_int16x8x3_t, 1);
  }
@@ -5333,10 +5336,10 @@
 -/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Q_lanes32.c	2011-09-16 20:16:00.557565092 -0700
 @@ -16,5 +16,5 @@
    vst3q_lane_s32 (arg0_int32_t, arg1_int32x4x3_t, 1);
  }
@@ -5344,10 +5347,10 @@
 -/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu16.c	2011-09-16 20:16:00.557565092 -0700
 @@ -16,5 +16,5 @@
    vst3q_lane_u16 (arg0_uint16_t, arg1_uint16x8x3_t, 1);
  }
@@ -5355,10 +5358,10 @@
 -/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Q_laneu32.c	2011-09-16 20:16:00.557565092 -0700
 @@ -16,5 +16,5 @@
    vst3q_lane_u32 (arg0_uint32_t, arg1_uint32x4x3_t, 1);
  }
@@ -5366,10 +5369,10 @@
 -/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Qf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Qf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qf32.c	2011-09-16 20:16:00.557565092 -0700
 @@ -16,6 +16,6 @@
    vst3q_f32 (arg0_float32_t, arg1_float32x4x3_t);
  }
@@ -5379,10 +5382,10 @@
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Qp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Qp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qp16.c	2011-09-16 20:16:00.567565108 -0700
 @@ -16,6 +16,6 @@
    vst3q_p16 (arg0_poly16_t, arg1_poly16x8x3_t);
  }
@@ -5392,10 +5395,10 @@
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Qp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Qp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qp8.c	2011-09-16 20:16:00.567565108 -0700
 @@ -16,6 +16,6 @@
    vst3q_p8 (arg0_poly8_t, arg1_poly8x16x3_t);
  }
@@ -5405,10 +5408,10 @@
 +/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qs16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Qs16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qs16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qs16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Qs16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qs16.c	2011-09-16 20:16:00.567565108 -0700
 @@ -16,6 +16,6 @@
    vst3q_s16 (arg0_int16_t, arg1_int16x8x3_t);
  }
@@ -5418,10 +5421,10 @@
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qs32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Qs32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qs32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qs32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Qs32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qs32.c	2011-09-16 20:16:00.567565108 -0700
 @@ -16,6 +16,6 @@
    vst3q_s32 (arg0_int32_t, arg1_int32x4x3_t);
  }
@@ -5431,10 +5434,10 @@
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qs8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Qs8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qs8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qs8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Qs8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qs8.c	2011-09-16 20:16:00.567565108 -0700
 @@ -16,6 +16,6 @@
    vst3q_s8 (arg0_int8_t, arg1_int8x16x3_t);
  }
@@ -5444,10 +5447,10 @@
 +/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Qu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Qu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qu16.c	2011-09-16 20:16:00.567565108 -0700
 @@ -16,6 +16,6 @@
    vst3q_u16 (arg0_uint16_t, arg1_uint16x8x3_t);
  }
@@ -5457,10 +5460,10 @@
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Qu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Qu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qu32.c	2011-09-16 20:16:00.567565108 -0700
 @@ -16,6 +16,6 @@
    vst3q_u32 (arg0_uint32_t, arg1_uint32x4x3_t);
  }
@@ -5470,10 +5473,10 @@
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3Qu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3Qu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3Qu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3Qu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3Qu8.c	2011-09-16 20:16:00.567565108 -0700
 @@ -16,6 +16,6 @@
    vst3q_u8 (arg0_uint8_t, arg1_uint8x16x3_t);
  }
@@ -5483,10 +5486,10 @@
 +/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_lanef32.c	2011-09-16 20:16:00.567565108 -0700
 @@ -16,5 +16,5 @@
    vst3_lane_f32 (arg0_float32_t, arg1_float32x2x3_t, 1);
  }
@@ -5494,10 +5497,10 @@
 -/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_lanep16.c	2011-09-16 20:16:00.577565135 -0700
 @@ -16,5 +16,5 @@
    vst3_lane_p16 (arg0_poly16_t, arg1_poly16x4x3_t, 1);
  }
@@ -5505,10 +5508,10 @@
 -/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_lanep8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3_lanep8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3_lanep8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_lanep8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3_lanep8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_lanep8.c	2011-09-16 20:16:00.577565135 -0700
 @@ -16,5 +16,5 @@
    vst3_lane_p8 (arg0_poly8_t, arg1_poly8x8x3_t, 1);
  }
@@ -5516,10 +5519,10 @@
 -/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_lanes16.c	2011-09-16 20:16:00.577565135 -0700
 @@ -16,5 +16,5 @@
    vst3_lane_s16 (arg0_int16_t, arg1_int16x4x3_t, 1);
  }
@@ -5527,10 +5530,10 @@
 -/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_lanes32.c	2011-09-16 20:16:00.577565135 -0700
 @@ -16,5 +16,5 @@
    vst3_lane_s32 (arg0_int32_t, arg1_int32x2x3_t, 1);
  }
@@ -5538,10 +5541,10 @@
 -/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_lanes8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3_lanes8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3_lanes8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_lanes8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3_lanes8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_lanes8.c	2011-09-16 20:16:00.577565135 -0700
 @@ -16,5 +16,5 @@
    vst3_lane_s8 (arg0_int8_t, arg1_int8x8x3_t, 1);
  }
@@ -5549,10 +5552,10 @@
 -/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_laneu16.c	2011-09-16 20:16:00.577565135 -0700
 @@ -16,5 +16,5 @@
    vst3_lane_u16 (arg0_uint16_t, arg1_uint16x4x3_t, 1);
  }
@@ -5560,10 +5563,10 @@
 -/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_laneu32.c	2011-09-16 20:16:00.577565135 -0700
 @@ -16,5 +16,5 @@
    vst3_lane_u32 (arg0_uint32_t, arg1_uint32x2x3_t, 1);
  }
@@ -5571,10 +5574,10 @@
 -/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3_laneu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3_laneu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3_laneu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_laneu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3_laneu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3_laneu8.c	2011-09-16 20:16:00.587565144 -0700
 @@ -16,5 +16,5 @@
    vst3_lane_u8 (arg0_uint8_t, arg1_uint8x8x3_t, 1);
  }
@@ -5582,10 +5585,10 @@
 -/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3f32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3f32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3f32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3f32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3f32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3f32.c	2011-09-16 20:16:00.587565144 -0700
 @@ -16,5 +16,5 @@
    vst3_f32 (arg0_float32_t, arg1_float32x2x3_t);
  }
@@ -5593,10 +5596,10 @@
 -/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3p16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3p16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3p16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3p16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3p16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3p16.c	2011-09-16 20:16:00.587565144 -0700
 @@ -16,5 +16,5 @@
    vst3_p16 (arg0_poly16_t, arg1_poly16x4x3_t);
  }
@@ -5604,10 +5607,10 @@
 -/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3p8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3p8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3p8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3p8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3p8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3p8.c	2011-09-16 20:16:00.587565144 -0700
 @@ -16,5 +16,5 @@
    vst3_p8 (arg0_poly8_t, arg1_poly8x8x3_t);
  }
@@ -5615,10 +5618,10 @@
 -/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3s16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3s16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3s16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3s16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3s16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3s16.c	2011-09-16 20:16:00.587565144 -0700
 @@ -16,5 +16,5 @@
    vst3_s16 (arg0_int16_t, arg1_int16x4x3_t);
  }
@@ -5626,10 +5629,10 @@
 -/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3s32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3s32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3s32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3s32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3s32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3s32.c	2011-09-16 20:16:00.587565144 -0700
 @@ -16,5 +16,5 @@
    vst3_s32 (arg0_int32_t, arg1_int32x2x3_t);
  }
@@ -5637,10 +5640,10 @@
 -/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3s64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3s64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3s64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3s64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3s64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3s64.c	2011-09-16 20:16:00.587565144 -0700
 @@ -16,5 +16,5 @@
    vst3_s64 (arg0_int64_t, arg1_int64x1x3_t);
  }
@@ -5648,10 +5651,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3s8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3s8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3s8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3s8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3s8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3s8.c	2011-09-16 20:16:00.587565144 -0700
 @@ -16,5 +16,5 @@
    vst3_s8 (arg0_int8_t, arg1_int8x8x3_t);
  }
@@ -5659,10 +5662,10 @@
 -/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3u16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3u16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3u16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3u16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3u16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3u16.c	2011-09-16 20:16:00.587565144 -0700
 @@ -16,5 +16,5 @@
    vst3_u16 (arg0_uint16_t, arg1_uint16x4x3_t);
  }
@@ -5670,10 +5673,10 @@
 -/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3u32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3u32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3u32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3u32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3u32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3u32.c	2011-09-16 20:16:00.587565144 -0700
 @@ -16,5 +16,5 @@
    vst3_u32 (arg0_uint32_t, arg1_uint32x2x3_t);
  }
@@ -5681,10 +5684,10 @@
 -/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3u64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3u64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3u64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3u64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3u64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3u64.c	2011-09-16 20:16:00.587565144 -0700
 @@ -16,5 +16,5 @@
    vst3_u64 (arg0_uint64_t, arg1_uint64x1x3_t);
  }
@@ -5692,10 +5695,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst3u8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst3u8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst3u8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3u8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst3u8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst3u8.c	2011-09-16 20:16:00.587565144 -0700
 @@ -16,5 +16,5 @@
    vst3_u8 (arg0_uint8_t, arg1_uint8x8x3_t);
  }
@@ -5703,10 +5706,10 @@
 -/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst3\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Q_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanef32.c	2011-09-16 20:16:00.597565156 -0700
 @@ -16,5 +16,5 @@
    vst4q_lane_f32 (arg0_float32_t, arg1_float32x4x4_t, 1);
  }
@@ -5714,10 +5717,10 @@
 -/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Q_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanep16.c	2011-09-16 20:16:00.597565156 -0700
 @@ -16,5 +16,5 @@
    vst4q_lane_p16 (arg0_poly16_t, arg1_poly16x8x4_t, 1);
  }
@@ -5725,10 +5728,10 @@
 -/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes16.c	2011-09-16 20:16:00.597565156 -0700
 @@ -16,5 +16,5 @@
    vst4q_lane_s16 (arg0_int16_t, arg1_int16x8x4_t, 1);
  }
@@ -5736,10 +5739,10 @@
 -/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Q_lanes32.c	2011-09-16 20:16:00.597565156 -0700
 @@ -16,5 +16,5 @@
    vst4q_lane_s32 (arg0_int32_t, arg1_int32x4x4_t, 1);
  }
@@ -5747,10 +5750,10 @@
 -/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu16.c	2011-09-16 20:16:00.597565156 -0700
 @@ -16,5 +16,5 @@
    vst4q_lane_u16 (arg0_uint16_t, arg1_uint16x8x4_t, 1);
  }
@@ -5758,10 +5761,10 @@
 -/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Q_laneu32.c	2011-09-16 20:16:00.597565156 -0700
 @@ -16,5 +16,5 @@
    vst4q_lane_u32 (arg0_uint32_t, arg1_uint32x4x4_t, 1);
  }
@@ -5769,10 +5772,10 @@
 -/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qf32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Qf32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qf32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qf32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Qf32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qf32.c	2011-09-16 20:16:00.597565156 -0700
 @@ -16,6 +16,6 @@
    vst4q_f32 (arg0_float32_t, arg1_float32x4x4_t);
  }
@@ -5782,10 +5785,10 @@
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qp16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Qp16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qp16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qp16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Qp16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qp16.c	2011-09-16 20:16:00.597565156 -0700
 @@ -16,6 +16,6 @@
    vst4q_p16 (arg0_poly16_t, arg1_poly16x8x4_t);
  }
@@ -5795,10 +5798,10 @@
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qp8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Qp8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qp8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qp8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Qp8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qp8.c	2011-09-16 20:16:00.597565156 -0700
 @@ -16,6 +16,6 @@
    vst4q_p8 (arg0_poly8_t, arg1_poly8x16x4_t);
  }
@@ -5808,10 +5811,10 @@
 +/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qs16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Qs16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qs16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qs16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Qs16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qs16.c	2011-09-16 20:16:00.597565156 -0700
 @@ -16,6 +16,6 @@
    vst4q_s16 (arg0_int16_t, arg1_int16x8x4_t);
  }
@@ -5821,10 +5824,10 @@
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qs32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Qs32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qs32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qs32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Qs32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qs32.c	2011-09-16 20:16:00.597565156 -0700
 @@ -16,6 +16,6 @@
    vst4q_s32 (arg0_int32_t, arg1_int32x4x4_t);
  }
@@ -5834,10 +5837,10 @@
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qs8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Qs8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qs8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qs8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Qs8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qs8.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,6 +16,6 @@
    vst4q_s8 (arg0_int8_t, arg1_int8x16x4_t);
  }
@@ -5847,10 +5850,10 @@
 +/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Qu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Qu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qu16.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,6 +16,6 @@
    vst4q_u16 (arg0_uint16_t, arg1_uint16x8x4_t);
  }
@@ -5860,10 +5863,10 @@
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Qu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Qu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qu32.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,6 +16,6 @@
    vst4q_u32 (arg0_uint32_t, arg1_uint32x4x4_t);
  }
@@ -5873,10 +5876,10 @@
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4Qu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4Qu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4Qu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4Qu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4Qu8.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,6 +16,6 @@
    vst4q_u8 (arg0_uint8_t, arg1_uint8x16x4_t);
  }
@@ -5886,10 +5889,10 @@
 +/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_lanef32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4_lanef32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4_lanef32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_lanef32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4_lanef32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_lanef32.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_lane_f32 (arg0_float32_t, arg1_float32x2x4_t, 1);
  }
@@ -5897,10 +5900,10 @@
 -/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_lanep16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4_lanep16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4_lanep16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_lanep16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4_lanep16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_lanep16.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_lane_p16 (arg0_poly16_t, arg1_poly16x4x4_t, 1);
  }
@@ -5908,10 +5911,10 @@
 -/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_lanep8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4_lanep8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4_lanep8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_lanep8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4_lanep8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_lanep8.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_lane_p8 (arg0_poly8_t, arg1_poly8x8x4_t, 1);
  }
@@ -5919,10 +5922,10 @@
 -/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_lanes16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4_lanes16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4_lanes16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_lanes16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4_lanes16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_lanes16.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_lane_s16 (arg0_int16_t, arg1_int16x4x4_t, 1);
  }
@@ -5930,10 +5933,10 @@
 -/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_lanes32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4_lanes32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4_lanes32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_lanes32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4_lanes32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_lanes32.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_lane_s32 (arg0_int32_t, arg1_int32x2x4_t, 1);
  }
@@ -5941,10 +5944,10 @@
 -/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_lanes8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4_lanes8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4_lanes8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_lanes8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4_lanes8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_lanes8.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_lane_s8 (arg0_int8_t, arg1_int8x8x4_t, 1);
  }
@@ -5952,10 +5955,10 @@
 -/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_laneu16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4_laneu16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4_laneu16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_laneu16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4_laneu16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_laneu16.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_lane_u16 (arg0_uint16_t, arg1_uint16x4x4_t, 1);
  }
@@ -5963,10 +5966,10 @@
 -/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_laneu32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4_laneu32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4_laneu32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_laneu32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4_laneu32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_laneu32.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_lane_u32 (arg0_uint32_t, arg1_uint32x2x4_t, 1);
  }
@@ -5974,10 +5977,10 @@
 -/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4_laneu8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4_laneu8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4_laneu8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_laneu8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4_laneu8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4_laneu8.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_lane_u8 (arg0_uint8_t, arg1_uint8x8x4_t, 1);
  }
@@ -5985,10 +5988,10 @@
 -/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+\\\[\[0-9\]+\\\]-\[dD\]\[0-9\]+\\\[\[0-9\]+\\\])|(\[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\], \[dD\]\[0-9\]+\\\[\[0-9\]+\\\]))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4f32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4f32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4f32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4f32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4f32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4f32.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_f32 (arg0_float32_t, arg1_float32x2x4_t);
  }
@@ -5996,10 +5999,10 @@
 -/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4p16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4p16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4p16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4p16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4p16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4p16.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_p16 (arg0_poly16_t, arg1_poly16x4x4_t);
  }
@@ -6007,10 +6010,10 @@
 -/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4p8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4p8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4p8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4p8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4p8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4p8.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_p8 (arg0_poly8_t, arg1_poly8x8x4_t);
  }
@@ -6018,10 +6021,10 @@
 -/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4s16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4s16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4s16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4s16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4s16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4s16.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_s16 (arg0_int16_t, arg1_int16x4x4_t);
  }
@@ -6029,10 +6032,10 @@
 -/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4s32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4s32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4s32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4s32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4s32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4s32.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_s32 (arg0_int32_t, arg1_int32x2x4_t);
  }
@@ -6040,10 +6043,10 @@
 -/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4s64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4s64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4s64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4s64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4s64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4s64.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_s64 (arg0_int64_t, arg1_int64x1x4_t);
  }
@@ -6051,10 +6054,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4s8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4s8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4s8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4s8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4s8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4s8.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_s8 (arg0_int8_t, arg1_int8x8x4_t);
  }
@@ -6062,10 +6065,10 @@
 -/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4u16.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4u16.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4u16.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4u16.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4u16.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4u16.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_u16 (arg0_uint16_t, arg1_uint16x4x4_t);
  }
@@ -6073,10 +6076,10 @@
 -/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.16\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4u32.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4u32.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4u32.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4u32.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4u32.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4u32.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_u32 (arg0_uint32_t, arg1_uint32x2x4_t);
  }
@@ -6084,10 +6087,10 @@
 -/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.32\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4u64.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4u64.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4u64.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4u64.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4u64.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4u64.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_u64 (arg0_uint64_t, arg1_uint64x1x4_t);
  }
@@ -6095,10 +6098,10 @@
 -/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst1\.64\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== modified file 'gcc/testsuite/gcc.target/arm/neon/vst4u8.c'
---- old/gcc/testsuite/gcc.target/arm/neon/vst4u8.c	2010-05-24 18:36:31 +0000
-+++ new/gcc/testsuite/gcc.target/arm/neon/vst4u8.c	2011-05-03 15:14:56 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4u8.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/testsuite/gcc.target/arm/neon/vst4u8.c	2011-06-24 08:13:40.000000000 -0700
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/neon/vst4u8.c	2011-09-16 20:16:00.607565171 -0700
 @@ -16,5 +16,5 @@
    vst4_u8 (arg0_uint8_t, arg1_uint8x8x4_t);
  }
@@ -6106,10 +6109,10 @@
 -/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
 +/* { dg-final { scan-assembler "vst4\.8\[ 	\]+\\\{((\[dD\]\[0-9\]+-\[dD\]\[0-9\]+)|(\[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+, \[dD\]\[0-9\]+))\\\}, \\\[\[rR\]\[0-9\]+\(:\[0-9\]+\)?\\\]!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
  /* { dg-final { cleanup-saved-temps } } */
-
-=== added file 'gcc/testsuite/gcc.target/arm/pr46329.c'
---- old/gcc/testsuite/gcc.target/arm/pr46329.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.target/arm/pr46329.c	2011-05-03 15:18:07 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.target/arm/pr46329.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_6-branch/gcc/testsuite/gcc.target/arm/pr46329.c	2011-09-16 20:16:00.617565191 -0700
 @@ -0,0 +1,9 @@
 +/* { dg-options "-O2" } */
 +/* { dg-add-options arm_neon } */
@@ -6120,4 +6123,3 @@
 +{
 +  x <<= x;
 +}
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch
index 8d2ce21..4abfa02 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch
@@ -1,87 +1,16 @@
 2011-06-28  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
 
 	Backport from mainline.
-	LP 791327
-	gcc/
-        2011-06-09  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
-
-	PR target/49335
-	* config/arm/predicates.md (add_operator): New.
-	* config/arm/arm.md ("*arith_shiftsi"): Fix for SP reg usage
-	in Thumb2.
-
-2011-06-28  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
-
-	Backport from mainline.
 	gcc/
 	2011-06-24  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
 
 	PR target/49385
 	* config/arm/thumb2.md (*thumb2_movhi_insn): Make sure atleast
 	one of the operands is a register.
-
-=== modified file 'gcc/config/arm/arm.md'
---- old/gcc/config/arm/arm.md	2011-06-27 22:14:07 +0000
-+++ new/gcc/config/arm/arm.md	2011-06-28 12:02:27 +0000
-@@ -8584,18 +8584,22 @@
- ;; Patterns to allow combination of arithmetic, cond code and shifts
- 
- (define_insn "*arith_shiftsi"
--  [(set (match_operand:SI 0 "s_register_operand" "=r,r")
-+  [(set (match_operand:SI 0 "s_register_operand" "=r,r,r,r")
-         (match_operator:SI 1 "shiftable_operator"
-           [(match_operator:SI 3 "shift_operator"
--             [(match_operand:SI 4 "s_register_operand" "r,r")
--              (match_operand:SI 5 "shift_amount_operand" "M,r")])
--           (match_operand:SI 2 "s_register_operand" "rk,rk")]))]
-+             [(match_operand:SI 4 "s_register_operand" "r,r,r,r")
-+              (match_operand:SI 5 "shift_amount_operand" "M,M,M,r")])
-+           (match_operand:SI 2 "s_register_operand" "rk,rk,r,rk")]))]
-   "TARGET_32BIT"
-   "%i1%?\\t%0, %2, %4%S3"
-   [(set_attr "predicable" "yes")
-    (set_attr "shift" "4")
--   (set_attr "arch" "32,a")
--   ;; We have to make sure to disable the second alternative if
-+   (set_attr "arch" "a,t2,t2,a")
-+   ;; Thumb2 doesn't allow the stack pointer to be used for 
-+   ;; operand1 for all operations other than add and sub. In this case 
-+   ;; the minus operation is a candidate for an rsub and hence needs
-+   ;; to be disabled.
-+   ;; We have to make sure to disable the fourth alternative if
-    ;; the shift_operator is MULT, since otherwise the insn will
-    ;; also match a multiply_accumulate pattern and validate_change
-    ;; will allow a replacement of the constant with a register
-@@ -8603,9 +8607,13 @@
-    (set_attr_alternative "insn_enabled"
- 			 [(const_string "yes")
- 			  (if_then_else
-+			   (match_operand:SI 1 "add_operator" "")
-+			   (const_string "yes") (const_string "no"))
-+			  (const_string "yes")
-+			  (if_then_else
- 			   (match_operand:SI 3 "mult_operator" "")
- 			   (const_string "no") (const_string "yes"))])
--   (set_attr "type" "alu_shift,alu_shift_reg")])
-+   (set_attr "type" "alu_shift,alu_shift,alu_shift,alu_shift_reg")])
- 
- (define_split
-   [(set (match_operand:SI 0 "s_register_operand" "")
-
-=== modified file 'gcc/config/arm/predicates.md'
---- old/gcc/config/arm/predicates.md	2011-05-03 15:14:56 +0000
-+++ new/gcc/config/arm/predicates.md	2011-06-22 15:50:23 +0000
-@@ -687,3 +687,6 @@
- (define_special_predicate "neon_struct_operand"
-   (and (match_code "mem")
-        (match_test "TARGET_32BIT && neon_vector_mem_operand (op, 2)")))
-+
-+(define_special_predicate "add_operator"
-+  (match_code "plus"))
-
-=== modified file 'gcc/config/arm/thumb2.md'
---- old/gcc/config/arm/thumb2.md	2011-06-14 14:37:30 +0000
-+++ new/gcc/config/arm/thumb2.md	2011-06-20 12:18:27 +0000
+Index: gcc-4_6-branch/gcc/config/arm/thumb2.md
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/arm/thumb2.md	2011-09-16 20:22:40.000000000 -0700
++++ gcc-4_6-branch/gcc/config/arm/thumb2.md	2011-09-16 20:28:47.648690433 -0700
 @@ -207,7 +207,9 @@
  (define_insn "*thumb2_movhi_insn"
    [(set (match_operand:HI 0 "nonimmediate_operand" "=r,r,m,r")
@@ -93,4 +22,3 @@
    "@
     mov%?\\t%0, %1\\t%@ movhi
     movw%?\\t%0, %L1\\t%@ movhi
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch
index 37e3036..ff34514 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch
@@ -50,8 +50,10 @@
 	* gcc.dg/vect/vect-widen-mult-half.c: New test.
 
 === added file 'gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c'
---- old/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c	2011-07-06 12:04:10 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c	2011-09-16 20:32:57.279056697 -0700
 @@ -0,0 +1,52 @@
 +/* { dg-require-effective-target vect_int } */
 +
@@ -105,10 +107,10 @@
 +/* { dg-final { scan-tree-dump-times "pattern recognized" 2 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
 +/* { dg-final { cleanup-tree-dump "vect" } } */
 +
-
-=== added file 'gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c'
---- old/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c	2011-07-06 12:04:10 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c	2011-09-16 20:32:57.279056697 -0700
 @@ -0,0 +1,59 @@
 +/* { dg-require-effective-target vect_int } */
 +
@@ -169,10 +171,10 @@
 +/* { dg-final { scan-tree-dump-times "pattern recognized" 2 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
 +/* { dg-final { cleanup-tree-dump "vect" } } */
 +
-
-=== added file 'gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c'
---- old/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c	1970-01-01 00:00:00 +0000
-+++ new/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c	2011-07-06 12:04:10 +0000
+Index: gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_6-branch/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c	2011-09-16 20:32:57.279056697 -0700
 @@ -0,0 +1,49 @@
 +/* { dg-require-effective-target vect_int } */
 +
@@ -223,10 +225,10 @@
 +/* { dg-final { scan-tree-dump-times "pattern recognized" 1 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
 +/* { dg-final { cleanup-tree-dump "vect" } } */
 +
-
-=== modified file 'gcc/tree-vect-loop.c'
---- old/gcc/tree-vect-loop.c	2011-07-04 11:13:51 +0000
-+++ new/gcc/tree-vect-loop.c	2011-07-11 11:02:55 +0000
+Index: gcc-4_6-branch/gcc/tree-vect-loop.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/tree-vect-loop.c	2011-09-16 20:31:52.000000000 -0700
++++ gcc-4_6-branch/gcc/tree-vect-loop.c	2011-09-16 20:32:57.289056641 -0700
 @@ -181,6 +181,8 @@
    stmt_vec_info stmt_info;
    int i;
@@ -246,7 +248,6 @@
 -	  tree vf_vectype;
 -	  gimple stmt = gsi_stmt (si), pattern_stmt;
 -	  stmt_info = vinfo_for_stmt (stmt);
--
 +          tree vf_vectype;
 +
 +          if (analyze_pattern_stmt)
@@ -256,7 +257,7 @@
 +            }
 +          else
 +            stmt = gsi_stmt (si);
-+
+ 
 +         stmt_info = vinfo_for_stmt (stmt);
 +              
  	  if (vect_print_dump_info (REPORT_DETAILS))
@@ -376,10 +377,10 @@
  	}		        /* stmts in BB */
      }				/* BBs in loop */
  
-
-=== modified file 'gcc/tree-vect-patterns.c'
---- old/gcc/tree-vect-patterns.c	2011-06-22 12:10:44 +0000
-+++ new/gcc/tree-vect-patterns.c	2011-07-06 12:04:10 +0000
+Index: gcc-4_6-branch/gcc/tree-vect-patterns.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/tree-vect-patterns.c	2011-09-16 20:31:52.000000000 -0700
++++ gcc-4_6-branch/gcc/tree-vect-patterns.c	2011-09-16 20:32:57.289056641 -0700
 @@ -39,10 +39,13 @@
  #include "diagnostic-core.h"
  
@@ -552,21 +553,6 @@
       S5  prod_T = a_T * CONST;
  
 -    Input:
--
--    * LAST_STMT: A stmt from which the pattern search begins.  In the example,
--    when this function is called with S5, the pattern {S3,S4,S5,(S6)} is
--    detected.
--
--    Output:
--
--    * TYPE_IN: The type of the input arguments to the pattern.
--
--    * TYPE_OUT: The type of the output of this pattern.
--
--    * Return value: A new stmt that will be used to replace the sequence of
--    stmts that constitute the pattern.  In this case it will be:
--         WIDEN_MULT <a_t, b_t>
-- */
 +   A special case of multiplication by constants is when 'TYPE' is 4 times
 +   bigger than 'type', but CONST fits an intermediate type 2 times smaller
 +   than 'TYPE'.  In that case we create an additional pattern stmt for S3
@@ -584,20 +570,30 @@
 +           '--> prod_T' = a_it w* CONST;
 +
 +   Input/Output:
-+
+ 
+-    * LAST_STMT: A stmt from which the pattern search begins.  In the example,
+-    when this function is called with S5, the pattern {S3,S4,S5,(S6)} is
+-    detected.
 +   * STMTS: Contains a stmt from which the pattern search begins.  In the
 +   example, when this function is called with S5, the pattern {S3,S4,S5,(S6)}
 +   is detected.  In case of unsigned widen-mult, the original stmt (S5) is
 +   replaced with S6 in STMTS.  In case of multiplication by a constant
 +   of an intermediate type (the last case above), STMTS also contains S3
 +   (inserted before S5).
-+
+ 
+-    Output:
 +   Output:
-+
+ 
+-    * TYPE_IN: The type of the input arguments to the pattern.
 +   * TYPE_IN: The type of the input arguments to the pattern.
-+
+ 
+-    * TYPE_OUT: The type of the output of this pattern.
 +   * TYPE_OUT: The type of the output of this pattern.
-+
+ 
+-    * Return value: A new stmt that will be used to replace the sequence of
+-    stmts that constitute the pattern.  In this case it will be:
+-         WIDEN_MULT <a_t, b_t>
+- */
 +   * Return value: A new stmt that will be used to replace the sequence of
 +   stmts that constitute the pattern.  In this case it will be:
 +        WIDEN_MULT <a_t, b_t>
@@ -932,10 +928,10 @@
  
    if (vect_print_dump_info (REPORT_DETAILS))
      fprintf (vect_dump, "=== vect_pattern_recog ===");
-
-=== modified file 'gcc/tree-vect-slp.c'
---- old/gcc/tree-vect-slp.c	2011-06-19 10:59:13 +0000
-+++ new/gcc/tree-vect-slp.c	2011-07-06 12:04:10 +0000
+Index: gcc-4_6-branch/gcc/tree-vect-slp.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/tree-vect-slp.c	2011-09-16 20:31:52.000000000 -0700
++++ gcc-4_6-branch/gcc/tree-vect-slp.c	2011-09-16 20:32:57.289056641 -0700
 @@ -152,7 +152,9 @@
        if (loop && def_stmt && gimple_bb (def_stmt)
            && flow_bb_inside_loop_p (loop, gimple_bb (def_stmt))
@@ -947,10 +943,10 @@
          {
            if (!*first_stmt_dt0)
              *pattern0 = true;
-
-=== modified file 'gcc/tree-vect-stmts.c'
---- old/gcc/tree-vect-stmts.c	2011-06-22 06:21:13 +0000
-+++ new/gcc/tree-vect-stmts.c	2011-07-06 12:04:10 +0000
+Index: gcc-4_6-branch/gcc/tree-vect-stmts.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/tree-vect-stmts.c	2011-09-16 20:31:52.000000000 -0700
++++ gcc-4_6-branch/gcc/tree-vect-stmts.c	2011-09-16 20:32:57.289056641 -0700
 @@ -126,33 +126,72 @@
  
  static void
@@ -974,21 +970,6 @@
    if (STMT_VINFO_IN_PATTERN_P (stmt_info))
      {
 -      gimple pattern_stmt;
--
--      /* This is the last stmt in a sequence that was detected as a
--         pattern that can potentially be vectorized.  Don't mark the stmt
--         as relevant/live because it's not going to be vectorized.
--         Instead mark the pattern-stmt that replaces it.  */
--
--      pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info);
--
--      if (vect_print_dump_info (REPORT_DETAILS))
--        fprintf (vect_dump, "last stmt in pattern. don't mark relevant/live.");
--      stmt_info = vinfo_for_stmt (pattern_stmt);
--      gcc_assert (STMT_VINFO_RELATED_STMT (stmt_info) == stmt);
--      save_relevant = STMT_VINFO_RELEVANT (stmt_info);
--      save_live_p = STMT_VINFO_LIVE_P (stmt_info);
--      stmt = pattern_stmt;
 +      bool found = false;
 +      if (!used_in_pattern)
 +        {
@@ -1026,7 +1007,21 @@
 +             pattern that can potentially be vectorized.  Don't mark the stmt
 +             as relevant/live because it's not going to be vectorized.
 +             Instead mark the pattern-stmt that replaces it.  */
-+
+ 
+-      /* This is the last stmt in a sequence that was detected as a
+-         pattern that can potentially be vectorized.  Don't mark the stmt
+-         as relevant/live because it's not going to be vectorized.
+-         Instead mark the pattern-stmt that replaces it.  */
+-
+-      pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info);
+-
+-      if (vect_print_dump_info (REPORT_DETAILS))
+-        fprintf (vect_dump, "last stmt in pattern. don't mark relevant/live.");
+-      stmt_info = vinfo_for_stmt (pattern_stmt);
+-      gcc_assert (STMT_VINFO_RELATED_STMT (stmt_info) == stmt);
+-      save_relevant = STMT_VINFO_RELEVANT (stmt_info);
+-      save_live_p = STMT_VINFO_LIVE_P (stmt_info);
+-      stmt = pattern_stmt;
 +          pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info);
 +
 +          if (vect_print_dump_info (REPORT_DETAILS))
@@ -1119,9 +1114,6 @@
 -                      VEC_free (gimple, heap, worklist);
 -                      return false;
 -                    }
--                }
--              else
--                return false;
 +                    break;
 +                   
 +                  case GIMPLE_BINARY_RHS:
@@ -1154,7 +1146,9 @@
 +                  
 +                  default: 
 +                    return false;
-+                }
+                 }
+-              else
+-                return false;
              }
            else if (is_gimple_call (stmt))
              {
@@ -1173,7 +1167,7 @@
          gcc_assert (vec_stmt);
  	if (gimple_code (vec_stmt) == GIMPLE_PHI)
  	  vec_oprnd = PHI_RESULT (vec_stmt);
-@@ -4886,6 +4946,7 @@
+@@ -4894,6 +4954,7 @@
    enum vect_relevant relevance = STMT_VINFO_RELEVANT (stmt_info);
    bool ok;
    tree scalar_type, vectype;
@@ -1181,14 +1175,13 @@
  
    if (vect_print_dump_info (REPORT_DETAILS))
      {
-@@ -4907,16 +4968,22 @@
+@@ -4915,16 +4976,22 @@
       - any LABEL_EXPRs in the loop
       - computations that are used only for array indexing or loop control.
       In basic blocks we only analyze statements that are a part of some SLP
 -     instance, therefore, all the statements are relevant.  */
--
 +     instance, therefore, all the statements are relevant.  
-+
+ 
 +     Pattern statement need to be analyzed instead of the original statement
 +     if the original statement is not relevant. Otherwise, we analyze both
 +     statements.  */
@@ -1207,7 +1200,7 @@
            stmt = pattern_stmt;
            stmt_info = vinfo_for_stmt (pattern_stmt);
            if (vect_print_dump_info (REPORT_DETAILS))
-@@ -4933,6 +5000,21 @@
+@@ -4941,6 +5008,21 @@
            return true;
          }
      }
@@ -1229,42 +1222,7 @@
  
    switch (STMT_VINFO_DEF_TYPE (stmt_info))
      {
-@@ -5066,7 +5148,6 @@
-   bool is_store = false;
-   gimple vec_stmt = NULL;
-   stmt_vec_info stmt_info = vinfo_for_stmt (stmt);
--  gimple orig_stmt_in_pattern, orig_scalar_stmt = stmt;
-   bool done;
- 
-   switch (STMT_VINFO_TYPE (stmt_info))
-@@ -5205,25 +5286,7 @@
-     }
- 
-   if (vec_stmt)
--    {
--      STMT_VINFO_VEC_STMT (stmt_info) = vec_stmt;
--      orig_stmt_in_pattern = STMT_VINFO_RELATED_STMT (stmt_info);
--      if (orig_stmt_in_pattern)
--	{
--	  stmt_vec_info stmt_vinfo = vinfo_for_stmt (orig_stmt_in_pattern);
--	  /* STMT was inserted by the vectorizer to replace a computation idiom.
--	     ORIG_STMT_IN_PATTERN is a stmt in the original sequence that
--	     computed this idiom.  We need to record a pointer to VEC_STMT in
--	     the stmt_info of ORIG_STMT_IN_PATTERN.  See more details in the
--	     documentation of vect_pattern_recog.  */
--	  if (STMT_VINFO_IN_PATTERN_P (stmt_vinfo))
--	    {
--	      gcc_assert (STMT_VINFO_RELATED_STMT (stmt_vinfo)
--                           == orig_scalar_stmt);
--	      STMT_VINFO_VEC_STMT (stmt_vinfo) = vec_stmt;
--	    }
--	}
--    }
-+    STMT_VINFO_VEC_STMT (stmt_info) = vec_stmt;
- 
-   return is_store;
- }
-@@ -5601,8 +5664,12 @@
+@@ -5605,8 +5687,12 @@
        || *dt == vect_nested_cycle)
      {
        stmt_vec_info stmt_info = vinfo_for_stmt (*def_stmt);
@@ -1278,10 +1236,10 @@
        *vectype = STMT_VINFO_VECTYPE (stmt_info);
        gcc_assert (*vectype != NULL_TREE);
      }
-
-=== modified file 'gcc/tree-vectorizer.h'
---- old/gcc/tree-vectorizer.h	2011-07-04 11:13:51 +0000
-+++ new/gcc/tree-vectorizer.h	2011-07-11 11:02:55 +0000
+Index: gcc-4_6-branch/gcc/tree-vectorizer.h
+===================================================================
+--- gcc-4_6-branch.orig/gcc/tree-vectorizer.h	2011-09-16 20:31:52.000000000 -0700
++++ gcc-4_6-branch/gcc/tree-vectorizer.h	2011-09-16 20:32:57.299056515 -0700
 @@ -890,7 +890,7 @@
  /* Pattern recognition functions.
     Additional pattern recognition functions can (and will) be added
@@ -1291,4 +1249,3 @@
  #define NUM_PATTERNS 4
  void vect_pattern_recog (loop_vec_info);
  
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106783.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106783.patch
new file mode 100644
index 0000000..61e3916
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106783.patch
@@ -0,0 +1,62 @@
+2011-07-31  Revital Eres  <revital.eres@linaro.org>
+
+	gcc/
+	Backport from trunk -r176970:
+
+	* modulo-sched.c: Change comment.
+	(reset_sched_times): Fix print message.
+	(print_partial_schedule): Add print info.
+
+=== modified file 'gcc/modulo-sched.c'
+--- old/gcc/modulo-sched.c	2011-07-04 12:01:34 +0000
++++ new/gcc/modulo-sched.c	2011-07-31 10:58:46 +0000
+@@ -84,13 +84,14 @@
+       II cycles (i.e. use register copies to prevent a def from overwriting
+       itself before reaching the use).
+ 
+-    SMS works with countable loops whose loop count can be easily
+-    adjusted.  This is because we peel a constant number of iterations
+-    into a prologue and epilogue for which we want to avoid emitting
+-    the control part, and a kernel which is to iterate that constant
+-    number of iterations less than the original loop.  So the control
+-    part should be a set of insns clearly identified and having its
+-    own iv, not otherwise used in the loop (at-least for now), which
++    SMS works with countable loops (1) whose control part can be easily
++    decoupled from the rest of the loop and (2) whose loop count can
++    be easily adjusted.  This is because we peel a constant number of
++    iterations into a prologue and epilogue for which we want to avoid
++    emitting the control part, and a kernel which is to iterate that
++    constant number of iterations less than the original loop.  So the
++    control part should be a set of insns clearly identified and having
++    its own iv, not otherwise used in the loop (at-least for now), which
+     initializes a register before the loop to the number of iterations.
+     Currently SMS relies on the do-loop pattern to recognize such loops,
+     where (1) the control part comprises of all insns defining and/or
+@@ -598,8 +599,8 @@
+             /* Print the scheduling times after the rotation.  */
+             fprintf (dump_file, "crr_insn->node=%d (insn id %d), "
+                      "crr_insn->cycle=%d, min_cycle=%d", crr_insn->node->cuid,
+-                     INSN_UID (crr_insn->node->insn), SCHED_TIME (u),
+-                     normalized_time);
++                     INSN_UID (crr_insn->node->insn), normalized_time,
++                     new_min_cycle);
+             if (JUMP_P (crr_insn->node->insn))
+               fprintf (dump_file, " (branch)");
+             fprintf (dump_file, "\n");
+@@ -2550,8 +2551,13 @@
+       fprintf (dump, "\n[ROW %d ]: ", i);
+       while (ps_i)
+ 	{
+-	  fprintf (dump, "%d, ",
+-		   INSN_UID (ps_i->node->insn));
++	  if (JUMP_P (ps_i->node->insn))
++	    fprintf (dump, "%d (branch), ",
++		     INSN_UID (ps_i->node->insn));
++	  else
++	    fprintf (dump, "%d, ",
++		     INSN_UID (ps_i->node->insn));
++	
+ 	  ps_i = ps_i->next_in_row;
+ 	}
+     }
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106784.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106784.patch
new file mode 100644
index 0000000..b82fe76
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106784.patch
@@ -0,0 +1,458 @@
+2011-08-09  Revital Eres  <revital.eres@linaro.org>
+
+	gcc/
+	Backport from trunk -r177235.
+	* modulo-sched.c (calculate_stage_count,
+	calculate_must_precede_follow, get_sched_window,
+	try_scheduling_node_in_cycle, remove_node_from_ps):
+	Add declaration.
+	(update_node_sched_params, set_must_precede_follow, optimize_sc):
+	New functions.
+	(reset_sched_times): Call update_node_sched_params.
+	(sms_schedule):	Call optimize_sc.
+	(get_sched_window): Change function arguments.
+	(sms_schedule_by_order): Update call to	get_sched_window.
+	Call set_must_precede_follow.
+	(calculate_stage_count): Add function argument.
+
+=== modified file 'gcc/modulo-sched.c'
+--- old/gcc/modulo-sched.c	2011-07-31 10:58:46 +0000
++++ new/gcc/modulo-sched.c	2011-08-09 04:51:48 +0000
+@@ -203,7 +203,16 @@
+                                     rtx, rtx);
+ static void duplicate_insns_of_cycles (partial_schedule_ptr,
+ 				       int, int, int, rtx);
+-static int calculate_stage_count (partial_schedule_ptr ps);
++static int calculate_stage_count (partial_schedule_ptr, int);
++static void calculate_must_precede_follow (ddg_node_ptr, int, int,
++					   int, int, sbitmap, sbitmap, sbitmap);
++static int get_sched_window (partial_schedule_ptr, ddg_node_ptr, 
++			     sbitmap, int, int *, int *, int *);
++static bool try_scheduling_node_in_cycle (partial_schedule_ptr, ddg_node_ptr,
++					  int, int, sbitmap, int *, sbitmap,
++					  sbitmap);
++static bool remove_node_from_ps (partial_schedule_ptr, ps_insn_ptr);
++
+ #define SCHED_ASAP(x) (((node_sched_params_ptr)(x)->aux.info)->asap)
+ #define SCHED_TIME(x) (((node_sched_params_ptr)(x)->aux.info)->time)
+ #define SCHED_FIRST_REG_MOVE(x) \
+@@ -577,6 +586,36 @@
+     }
+ }
+ 
++/* Update the sched_params (time, row and stage) for node U using the II,
++   the CYCLE of U and MIN_CYCLE.  
++   We're not simply taking the following
++   SCHED_STAGE (u) = CALC_STAGE_COUNT (SCHED_TIME (u), min_cycle, ii);
++   because the stages may not be aligned on cycle 0.  */
++static void
++update_node_sched_params (ddg_node_ptr u, int ii, int cycle, int min_cycle)
++{
++  int sc_until_cycle_zero;
++  int stage;
++
++  SCHED_TIME (u) = cycle;
++  SCHED_ROW (u) = SMODULO (cycle, ii);
++
++  /* The calculation of stage count is done adding the number
++     of stages before cycle zero and after cycle zero.  */
++  sc_until_cycle_zero = CALC_STAGE_COUNT (-1, min_cycle, ii);
++
++  if (SCHED_TIME (u) < 0)
++    {
++      stage = CALC_STAGE_COUNT (-1, SCHED_TIME (u), ii);
++      SCHED_STAGE (u) = sc_until_cycle_zero - stage;
++    }
++  else
++    {
++      stage = CALC_STAGE_COUNT (SCHED_TIME (u), 0, ii);
++      SCHED_STAGE (u) = sc_until_cycle_zero + stage - 1;
++    }
++}
++
+ /* Bump the SCHED_TIMEs of all nodes by AMOUNT.  Set the values of
+    SCHED_ROW and SCHED_STAGE.  */
+ static void
+@@ -592,7 +631,6 @@
+ 	ddg_node_ptr u = crr_insn->node;
+ 	int normalized_time = SCHED_TIME (u) - amount;
+ 	int new_min_cycle = PS_MIN_CYCLE (ps) - amount;
+-        int sc_until_cycle_zero, stage;
+ 
+         if (dump_file)
+           {
+@@ -608,23 +646,9 @@
+ 	
+ 	gcc_assert (SCHED_TIME (u) >= ps->min_cycle);
+ 	gcc_assert (SCHED_TIME (u) <= ps->max_cycle);
+-	SCHED_TIME (u) = normalized_time;
+-	SCHED_ROW (u) = SMODULO (normalized_time, ii);
+-      
+-        /* The calculation of stage count is done adding the number
+-           of stages before cycle zero and after cycle zero.  */
+-	sc_until_cycle_zero = CALC_STAGE_COUNT (-1, new_min_cycle, ii);
+-	
+-	if (SCHED_TIME (u) < 0)
+-	  {
+-	    stage = CALC_STAGE_COUNT (-1, SCHED_TIME (u), ii);
+-	    SCHED_STAGE (u) = sc_until_cycle_zero - stage;
+-	  }
+-	else
+-	  {
+-	    stage = CALC_STAGE_COUNT (SCHED_TIME (u), 0, ii);
+-	    SCHED_STAGE (u) = sc_until_cycle_zero + stage - 1;
+-	  }
++
++	crr_insn->cycle = normalized_time;
++	update_node_sched_params (u, ii, normalized_time, new_min_cycle);
+       }
+ }
+  
+@@ -661,6 +685,206 @@
+ 			    PREV_INSN (last));
+ }
+ 
++/* Set bitmaps TMP_FOLLOW and TMP_PRECEDE to MUST_FOLLOW and MUST_PRECEDE
++   respectively only if cycle C falls on the border of the scheduling
++   window boundaries marked by START and END cycles.  STEP is the
++   direction of the window.  */
++static inline void
++set_must_precede_follow (sbitmap *tmp_follow, sbitmap must_follow,
++			 sbitmap *tmp_precede, sbitmap must_precede, int c,
++			 int start, int end, int step)
++{
++  *tmp_precede = NULL;
++  *tmp_follow = NULL;
++
++  if (c == start)
++    {
++      if (step == 1)
++	*tmp_precede = must_precede;
++      else			/* step == -1.  */
++	*tmp_follow = must_follow;
++    }
++  if (c == end - step)
++    {
++      if (step == 1)
++	*tmp_follow = must_follow;
++      else			/* step == -1.  */
++	*tmp_precede = must_precede;
++    }
++
++}
++
++/* Return True if the branch can be moved to row ii-1 while
++   normalizing the partial schedule PS to start from cycle zero and thus
++   optimize the SC.  Otherwise return False.  */
++static bool
++optimize_sc (partial_schedule_ptr ps, ddg_ptr g)
++{
++  int amount = PS_MIN_CYCLE (ps);
++  sbitmap sched_nodes = sbitmap_alloc (g->num_nodes);
++  int start, end, step;
++  int ii = ps->ii;
++  bool ok = false;
++  int stage_count, stage_count_curr;
++
++  /* Compare the SC after normalization and SC after bringing the branch
++     to row ii-1.  If they are equal just bail out.  */
++  stage_count = calculate_stage_count (ps, amount);
++  stage_count_curr =
++    calculate_stage_count (ps, SCHED_TIME (g->closing_branch) - (ii - 1));
++
++  if (stage_count == stage_count_curr)
++    {
++      if (dump_file)
++	fprintf (dump_file, "SMS SC already optimized.\n");
++
++      ok = false;
++      goto clear;
++    }
++
++  if (dump_file)
++    {
++      fprintf (dump_file, "SMS Trying to optimize branch location\n");
++      fprintf (dump_file, "SMS partial schedule before trial:\n");
++      print_partial_schedule (ps, dump_file);
++    }
++
++  /* First, normalize the partial scheduling.  */
++  reset_sched_times (ps, amount);
++  rotate_partial_schedule (ps, amount);
++  if (dump_file)
++    {
++      fprintf (dump_file,
++	       "SMS partial schedule after normalization (ii, %d, SC %d):\n",
++	       ii, stage_count);
++      print_partial_schedule (ps, dump_file);
++    }
++
++  if (SMODULO (SCHED_TIME (g->closing_branch), ii) == ii - 1)
++    {
++      ok = true;
++      goto clear;
++    }
++
++  sbitmap_ones (sched_nodes);
++
++  /* Calculate the new placement of the branch.  It should be in row
++     ii-1 and fall into it's scheduling window.  */
++  if (get_sched_window (ps, g->closing_branch, sched_nodes, ii, &start,
++			&step, &end) == 0)
++    {
++      bool success;
++      ps_insn_ptr next_ps_i;
++      int branch_cycle = SCHED_TIME (g->closing_branch);
++      int row = SMODULO (branch_cycle, ps->ii);
++      int num_splits = 0;
++      sbitmap must_precede, must_follow, tmp_precede, tmp_follow;
++      int c;
++
++      if (dump_file)
++	fprintf (dump_file, "\nTrying to schedule node %d "
++		 "INSN = %d  in (%d .. %d) step %d\n",
++		 g->closing_branch->cuid,
++		 (INSN_UID (g->closing_branch->insn)), start, end, step);
++
++      gcc_assert ((step > 0 && start < end) || (step < 0 && start > end));
++      if (step == 1)
++	{
++	  c = start + ii - SMODULO (start, ii) - 1;
++	  gcc_assert (c >= start);
++	  if (c >= end)
++	    {
++	      ok = false;
++	      if (dump_file)
++		fprintf (dump_file,
++			 "SMS failed to schedule branch at cycle: %d\n", c);
++	      goto clear;
++	    }
++	}
++      else
++	{
++	  c = start - SMODULO (start, ii) - 1;
++	  gcc_assert (c <= start);
++
++	  if (c <= end)
++	    {
++	      if (dump_file)
++		fprintf (dump_file,
++			 "SMS failed to schedule branch at cycle: %d\n", c);
++	      ok = false;
++	      goto clear;
++	    }
++	}
++
++      must_precede = sbitmap_alloc (g->num_nodes);
++      must_follow = sbitmap_alloc (g->num_nodes);
++
++      /* Try to schedule the branch is it's new cycle.  */
++      calculate_must_precede_follow (g->closing_branch, start, end,
++				     step, ii, sched_nodes,
++				     must_precede, must_follow);
++
++      set_must_precede_follow (&tmp_follow, must_follow, &tmp_precede,
++			       must_precede, c, start, end, step);
++
++      /* Find the element in the partial schedule related to the closing
++         branch so we can remove it from it's current cycle.  */
++      for (next_ps_i = ps->rows[row];
++	   next_ps_i; next_ps_i = next_ps_i->next_in_row)
++	if (next_ps_i->node->cuid == g->closing_branch->cuid)
++	  break;
++
++      gcc_assert (next_ps_i);
++      gcc_assert (remove_node_from_ps (ps, next_ps_i));
++      success =
++	try_scheduling_node_in_cycle (ps, g->closing_branch,
++				      g->closing_branch->cuid, c,
++				      sched_nodes, &num_splits,
++				      tmp_precede, tmp_follow);
++      gcc_assert (num_splits == 0);
++      if (!success)
++	{
++	  if (dump_file)
++	    fprintf (dump_file,
++		     "SMS failed to schedule branch at cycle: %d, "
++		     "bringing it back to cycle %d\n", c, branch_cycle);
++
++	  /* The branch was failed to be placed in row ii - 1.
++	     Put it back in it's original place in the partial
++	     schedualing.  */
++	  set_must_precede_follow (&tmp_follow, must_follow, &tmp_precede,
++				   must_precede, branch_cycle, start, end,
++				   step);
++	  success =
++	    try_scheduling_node_in_cycle (ps, g->closing_branch,
++					  g->closing_branch->cuid,
++					  branch_cycle, sched_nodes,
++					  &num_splits, tmp_precede,
++					  tmp_follow);
++	  gcc_assert (success && (num_splits == 0));
++	  ok = false;
++	}
++      else
++	{
++	  /* The branch is placed in row ii - 1.  */
++	  if (dump_file)
++	    fprintf (dump_file,
++		     "SMS success in moving branch to cycle %d\n", c);
++
++	  update_node_sched_params (g->closing_branch, ii, c,
++				    PS_MIN_CYCLE (ps));
++	  ok = true;
++	}
++
++      free (must_precede);
++      free (must_follow);
++    }
++
++clear:
++  free (sched_nodes);
++  return ok;
++}
++
+ static void
+ duplicate_insns_of_cycles (partial_schedule_ptr ps, int from_stage,
+ 			   int to_stage, int for_prolog, rtx count_reg)
+@@ -1116,6 +1340,7 @@
+       int mii, rec_mii;
+       unsigned stage_count = 0;
+       HOST_WIDEST_INT loop_count = 0;
++      bool opt_sc_p = false;
+ 
+       if (! (g = g_arr[loop->num]))
+         continue;
+@@ -1197,14 +1422,32 @@
+       set_node_sched_params (g);
+ 
+       ps = sms_schedule_by_order (g, mii, maxii, node_order);
+-
+-       if (ps)
+-       {
+-         stage_count = calculate_stage_count (ps);
+-         gcc_assert(stage_count >= 1);
+-         PS_STAGE_COUNT(ps) = stage_count;
+-       }
+-
++      
++      if (ps)
++	{
++	  /* Try to achieve optimized SC by normalizing the partial
++	     schedule (having the cycles start from cycle zero).
++	     The branch location must be placed in row ii-1 in the
++	     final scheduling.	If failed, shift all instructions to
++	     position the branch in row ii-1.  */
++	  opt_sc_p = optimize_sc (ps, g);
++	  if (opt_sc_p)
++	    stage_count = calculate_stage_count (ps, 0);
++	  else
++	    {
++	      /* Bring the branch to cycle ii-1.  */
++	      int amount = SCHED_TIME (g->closing_branch) - (ps->ii - 1);
++	      
++	      if (dump_file)
++		fprintf (dump_file, "SMS schedule branch at cycle ii-1\n");
++	      
++	      stage_count = calculate_stage_count (ps, amount);
++	    }
++	  
++	  gcc_assert (stage_count >= 1);
++	  PS_STAGE_COUNT (ps) = stage_count;
++	}
++      
+       /* The default value of PARAM_SMS_MIN_SC is 2 as stage count of
+          1 means that there is no interleaving between iterations thus
+          we let the scheduling passes do the job in this case.  */
+@@ -1225,12 +1468,16 @@
+       else
+ 	{
+ 	  struct undo_replace_buff_elem *reg_move_replaces;
+-          int amount = SCHED_TIME (g->closing_branch) + 1;
++
++          if (!opt_sc_p)
++            {
++	      /* Rotate the partial schedule to have the branch in row ii-1.  */
++              int amount = SCHED_TIME (g->closing_branch) - (ps->ii - 1);
++	      
++              reset_sched_times (ps, amount);
++              rotate_partial_schedule (ps, amount);
++            }
+ 	  
+-	  /* Set the stage boundaries.	The closing_branch was scheduled
+-	     and should appear in the last (ii-1) row.  */
+-	  reset_sched_times (ps, amount);
+-	  rotate_partial_schedule (ps, amount);
+ 	  set_columns_for_ps (ps);
+ 
+ 	  canon_loop (loop);
+@@ -1382,13 +1629,11 @@
+    scheduling window is empty and zero otherwise.  */
+ 
+ static int
+-get_sched_window (partial_schedule_ptr ps, int *nodes_order, int i,
++get_sched_window (partial_schedule_ptr ps, ddg_node_ptr u_node,
+ 		  sbitmap sched_nodes, int ii, int *start_p, int *step_p, int *end_p)
+ {
+   int start, step, end;
+   ddg_edge_ptr e;
+-  int u = nodes_order [i];
+-  ddg_node_ptr u_node = &ps->g->nodes[u];
+   sbitmap psp = sbitmap_alloc (ps->g->num_nodes);
+   sbitmap pss = sbitmap_alloc (ps->g->num_nodes);
+   sbitmap u_node_preds = NODE_PREDECESSORS (u_node);
+@@ -1800,7 +2045,7 @@
+ 
+ 	  /* Try to get non-empty scheduling window.  */
+ 	 success = 0;
+-         if (get_sched_window (ps, nodes_order, i, sched_nodes, ii, &start,
++         if (get_sched_window (ps, u_node, sched_nodes, ii, &start,
+                                 &step, &end) == 0)
+             {
+               if (dump_file)
+@@ -1817,24 +2062,11 @@
+ 
+               for (c = start; c != end; c += step)
+                 {
+-                  sbitmap tmp_precede = NULL;
+-                  sbitmap tmp_follow = NULL;
+-
+-                  if (c == start)
+-                    {
+-                      if (step == 1)
+-                        tmp_precede = must_precede;
+-                      else      /* step == -1.  */
+-                        tmp_follow = must_follow;
+-                    }
+-                  if (c == end - step)
+-                    {
+-                      if (step == 1)
+-                        tmp_follow = must_follow;
+-                      else      /* step == -1.  */
+-                        tmp_precede = must_precede;
+-                    }
+-
++		  sbitmap tmp_precede, tmp_follow;
++
++                  set_must_precede_follow (&tmp_follow, must_follow, 
++		                           &tmp_precede, must_precede, 
++                                           c, start, end, step);
+                   success =
+                     try_scheduling_node_in_cycle (ps, u_node, u, c,
+                                                   sched_nodes,
+@@ -2899,12 +3131,10 @@
+ }
+ 
+ /* Calculate the stage count of the partial schedule PS.  The calculation
+-   takes into account the rotation to bring the closing branch to row
+-   ii-1.  */
++   takes into account the rotation amount passed in ROTATION_AMOUNT.  */
+ int
+-calculate_stage_count (partial_schedule_ptr ps)
++calculate_stage_count (partial_schedule_ptr ps, int rotation_amount)
+ {
+-  int rotation_amount = (SCHED_TIME (ps->g->closing_branch)) + 1;
+   int new_min_cycle = PS_MIN_CYCLE (ps) - rotation_amount;
+   int new_max_cycle = PS_MAX_CYCLE (ps) - rotation_amount;
+   int stage_count = CALC_STAGE_COUNT (-1, new_min_cycle, ps->ii);
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106785.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106785.patch
new file mode 100644
index 0000000..608dd18
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106785.patch
@@ -0,0 +1,39 @@
+ 2011-08-09  Revital Eres  <revital.eres@linaro.org>
+ 
+ 	gcc/
+	Backport from trunk -r176972:
+
+	* ddg.c (create_ddg_dep_from_intra_loop_link): Remove
+	the creation of anti-dep edge from a branch.
+	(add_cross_iteration_register_deps):
+	Create anti-dep edge from a branch.
+
+=== modified file 'gcc/ddg.c'
+--- old/gcc/ddg.c	2011-07-04 11:00:06 +0000
++++ new/gcc/ddg.c	2011-07-31 11:29:10 +0000
+@@ -197,11 +197,6 @@
+         }
+     }
+ 
+-  /* If a true dep edge enters the branch create an anti edge in the
+-     opposite direction to prevent the creation of reg-moves.  */
+-  if ((DEP_TYPE (link) == REG_DEP_TRUE) && JUMP_P (dest_node->insn))
+-    create_ddg_dep_no_link (g, dest_node, src_node, ANTI_DEP, REG_DEP, 1);
+-
+    latency = dep_cost (link);
+    e = create_ddg_edge (src_node, dest_node, t, dt, latency, distance);
+    add_edge_to_ddg (g, e);
+@@ -306,8 +301,11 @@
+ 
+ 	  gcc_assert (first_def_node);
+ 
++         /* Always create the edge if the use node is a branch in
++            order to prevent the creation of reg-moves.  */
+           if (DF_REF_ID (last_def) != DF_REF_ID (first_def)
+-              || !flag_modulo_sched_allow_regmoves)
++              || !flag_modulo_sched_allow_regmoves
++	      || JUMP_P (use_node->insn))
+             create_ddg_dep_no_link (g, use_node, first_def_node, ANTI_DEP,
+                                     REG_DEP, 1);
+ 
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106786.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106786.patch
new file mode 100644
index 0000000..55b7cc1
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106786.patch
@@ -0,0 +1,94 @@
+2011-08-11  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	gcc/
+	Backport from mainline:
+
+        2011-07-28  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	* config/arm/vfp.md ("*movdf_vfp"): Handle the VFP constraints
+	before the core constraints. Adjust attributes.
+	(*thumb2_movdf_vfp"): Likewise.
+
+=== modified file 'gcc/config/arm/vfp.md'
+--- old/gcc/config/arm/vfp.md	2011-01-20 22:03:29 +0000
++++ new/gcc/config/arm/vfp.md	2011-07-27 12:59:19 +0000
+@@ -401,8 +401,8 @@
+ ;; DFmode moves
+ 
+ (define_insn "*movdf_vfp"
+-  [(set (match_operand:DF 0 "nonimmediate_soft_df_operand" "=w,?r,w ,r, m,w  ,Uv,w,r")
+-	(match_operand:DF 1 "soft_df_operand"		   " ?r,w,Dy,mF,r,UvF,w, w,r"))]
++  [(set (match_operand:DF 0 "nonimmediate_soft_df_operand" "=w,?r,w ,w  ,Uv,r, m,w,r")
++	(match_operand:DF 1 "soft_df_operand"		   " ?r,w,Dy,UvF,w ,mF,r,w,r"))]
+   "TARGET_ARM && TARGET_HARD_FLOAT && TARGET_VFP
+    && (   register_operand (operands[0], DFmode)
+        || register_operand (operands[1], DFmode))"
+@@ -418,9 +418,9 @@
+ 	gcc_assert (TARGET_VFP_DOUBLE);
+         return \"fconstd%?\\t%P0, #%G1\";
+       case 3: case 4:
++	return output_move_vfp (operands);
++      case 5: case 6:
+ 	return output_move_double (operands);
+-      case 5: case 6:
+-	return output_move_vfp (operands);
+       case 7:
+ 	if (TARGET_VFP_SINGLE)
+ 	  return \"fcpys%?\\t%0, %1\;fcpys%?\\t%p0, %p1\";
+@@ -435,7 +435,7 @@
+   "
+   [(set_attr "type"
+      "r_2_f,f_2_r,fconstd,f_loadd,f_stored,load2,store2,ffarithd,*")
+-   (set (attr "length") (cond [(eq_attr "alternative" "3,4,8") (const_int 8)
++   (set (attr "length") (cond [(eq_attr "alternative" "5,6,8") (const_int 8)
+ 			       (eq_attr "alternative" "7")
+ 				(if_then_else
+ 				 (eq (symbol_ref "TARGET_VFP_SINGLE")
+@@ -449,8 +449,8 @@
+ )
+ 
+ (define_insn "*thumb2_movdf_vfp"
+-  [(set (match_operand:DF 0 "nonimmediate_soft_df_operand" "=w,?r,w ,r, m,w  ,Uv,w,r")
+-	(match_operand:DF 1 "soft_df_operand"		   " ?r,w,Dy,mF,r,UvF,w, w,r"))]
++  [(set (match_operand:DF 0 "nonimmediate_soft_df_operand" "=w,?r,w ,w  ,Uv,r ,m,w,r")
++	(match_operand:DF 1 "soft_df_operand"		   " ?r,w,Dy,UvF,w, mF,r, w,r"))]
+   "TARGET_THUMB2 && TARGET_HARD_FLOAT && TARGET_VFP"
+   "*
+   {
+@@ -463,10 +463,10 @@
+       case 2:
+ 	gcc_assert (TARGET_VFP_DOUBLE);
+ 	return \"fconstd%?\\t%P0, #%G1\";
+-      case 3: case 4: case 8:
++      case 3: case 4:
++	return output_move_vfp (operands);
++      case 5: case 6: case 8:
+ 	return output_move_double (operands);
+-      case 5: case 6:
+-	return output_move_vfp (operands);
+       case 7:
+ 	if (TARGET_VFP_SINGLE)
+ 	  return \"fcpys%?\\t%0, %1\;fcpys%?\\t%p0, %p1\";
+@@ -478,8 +478,8 @@
+     }
+   "
+   [(set_attr "type"
+-     "r_2_f,f_2_r,fconstd,load2,store2,f_loadd,f_stored,ffarithd,*")
+-   (set (attr "length") (cond [(eq_attr "alternative" "3,4,8") (const_int 8)
++     "r_2_f,f_2_r,fconstd,f_loadd,f_stored,load2,store2,ffarithd,*")
++   (set (attr "length") (cond [(eq_attr "alternative" "5,6,8") (const_int 8)
+ 			       (eq_attr "alternative" "7")
+ 				(if_then_else
+ 				 (eq (symbol_ref "TARGET_VFP_SINGLE")
+@@ -487,8 +487,8 @@
+ 				 (const_int 8)
+ 				 (const_int 4))]
+ 			      (const_int 4)))
+-   (set_attr "pool_range" "*,*,*,4096,*,1020,*,*,*")
+-   (set_attr "neg_pool_range" "*,*,*,0,*,1008,*,*,*")]
++   (set_attr "pool_range" "*,*,*,1020,*,4096,*,*,*")
++   (set_attr "neg_pool_range" "*,*,*,1008,*,0,*,*,*")]
+ )
+ 
+ 
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106787.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106787.patch
new file mode 100644
index 0000000..bdb48ad
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106787.patch
@@ -0,0 +1,30 @@
+2011-08-15  Michael Hope  <michael.hope@linaro.org>
+
+	Backport from mainline r177357
+
+	gcc/testsuite/
+	2011-08-04  Ian Bolton  <ian.bolton@arm.com>
+
+	* gcc.target/arm/vfp-1.c: no large negative offsets on Thumb2.
+
+=== modified file 'gcc/testsuite/gcc.target/arm/vfp-1.c'
+--- old/gcc/testsuite/gcc.target/arm/vfp-1.c	2011-01-01 08:52:03 +0000
++++ new/gcc/testsuite/gcc.target/arm/vfp-1.c	2011-08-09 23:22:51 +0000
+@@ -127,13 +127,13 @@
+ 
+ void test_ldst (float f[], double d[]) {
+   /* { dg-final { scan-assembler "flds.+ \\\[r0, #1020\\\]" } } */
+-  /* { dg-final { scan-assembler "flds.+ \\\[r0, #-1020\\\]" } } */
++  /* { dg-final { scan-assembler "flds.+ \\\[r\[0-9\], #-1020\\\]" { target { arm32 && { ! arm_thumb2_ok } } } } } */
+   /* { dg-final { scan-assembler "add.+ r0, #1024" } } */
+-  /* { dg-final { scan-assembler "fsts.+ \\\[r0, #0\\\]\n" } } */
++  /* { dg-final { scan-assembler "fsts.+ \\\[r\[0-9\], #0\\\]\n" } } */
+   f[256] = f[255] + f[-255];
+ 
+   /* { dg-final { scan-assembler "fldd.+ \\\[r1, #1016\\\]" } } */
+-  /* { dg-final { scan-assembler "fldd.+ \\\[r1, #-1016\\\]" } } */
++  /* { dg-final { scan-assembler "fldd.+ \\\[r\[1-9\], #-1016\\\]" { target { arm32 && { ! arm_thumb2_ok } } } } } */
+   /* { dg-final { scan-assembler "fstd.+ \\\[r1, #256\\\]" } } */
+   d[32] = d[127] + d[-127];
+ }
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106789.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106789.patch
new file mode 100644
index 0000000..a384ce7
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106789.patch
@@ -0,0 +1,33 @@
+2011-08-15  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	* config/rs6000/rs6000.c (paired_expand_vector_init): Don't create
+	CONST_VECTORs with symbolic elements.
+	(rs6000_expand_vector_init): Likewise.
+
+=== modified file 'gcc/config/rs6000/rs6000.c'
+--- old/gcc/config/rs6000/rs6000.c	2011-07-27 18:17:15 +0000
++++ new/gcc/config/rs6000/rs6000.c	2011-08-16 08:59:36 +0000
+@@ -5134,7 +5134,9 @@
+   for (i = 0; i < n_elts; ++i)
+     {
+       x = XVECEXP (vals, 0, i);
+-      if (!CONSTANT_P (x))
++      if (!(CONST_INT_P (x)
++	    || GET_CODE (x) == CONST_DOUBLE
++	    || GET_CODE (x) == CONST_FIXED))
+ 	++n_var;
+     }
+   if (n_var == 0)
+@@ -5286,7 +5288,9 @@
+   for (i = 0; i < n_elts; ++i)
+     {
+       x = XVECEXP (vals, 0, i);
+-      if (!CONSTANT_P (x))
++      if (!(CONST_INT_P (x)
++	    || GET_CODE (x) == CONST_DOUBLE
++	    || GET_CODE (x) == CONST_FIXED))
+ 	++n_var, one_var = i;
+       else if (x != CONST0_RTX (inner_mode))
+ 	all_const_zero = false;
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106792.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106792.patch
new file mode 100644
index 0000000..12c578c
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106792.patch
@@ -0,0 +1,61 @@
+2011-08-18  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	Backport from mainline:
+
+	2011-08-12  Richard Sandiford  <rdsandiford@googlemail.com>
+
+	* config/arm/arm.c (get_label_padding): New function.
+	(create_fix_barrier, arm_reorg): Use it.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-07-04 14:03:49 +0000
++++ new/gcc/config/arm/arm.c	2011-08-12 08:08:31 +0000
+@@ -11769,6 +11769,19 @@
+   return 0;
+ }
+ 
++/* Return the maximum amount of padding that will be inserted before
++   label LABEL.  */
++
++static HOST_WIDE_INT
++get_label_padding (rtx label)
++{
++  HOST_WIDE_INT align, min_insn_size;
++
++  align = 1 << label_to_alignment (label);
++  min_insn_size = TARGET_THUMB ? 2 : 4;
++  return align > min_insn_size ? align - min_insn_size : 0;
++}
++
+ /* Move a minipool fix MP from its current location to before MAX_MP.
+    If MAX_MP is NULL, then MP doesn't need moving, but the addressing
+    constraints may need updating.  */
+@@ -12315,8 +12328,12 @@
+ 	 within range.  */
+       gcc_assert (GET_CODE (from) != BARRIER);
+ 
+-      /* Count the length of this insn.  */
+-      count += get_attr_length (from);
++      /* Count the length of this insn.  This must stay in sync with the
++	 code that pushes minipool fixes.  */
++      if (LABEL_P (from))
++	count += get_label_padding (from);
++      else
++	count += get_attr_length (from);
+ 
+       /* If there is a jump table, add its length.  */
+       tmp = is_jump_table (from);
+@@ -12736,6 +12753,11 @@
+ 	      insn = table;
+ 	    }
+ 	}
++      else if (LABEL_P (insn))
++	/* Add the worst-case padding due to alignment.  We don't add
++	   the _current_ padding because the minipool insertions
++	   themselves might change it.  */
++	address += get_label_padding (insn);
+     }
+ 
+   fix = minipool_fix_head;
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106793.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106793.patch
new file mode 100644
index 0000000..04dabaf
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106793.patch
@@ -0,0 +1,34 @@
+2011-08-18  Richard Sandiford  <richard.sandiford@linaro.org>
+
+ 	gcc/
+ 	Backport from mainline:
+ 
+	2011-08-18  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* config/arm/arm.c (arm_rtx_costs_1): Don't modify the costs of SET.
+	(arm_size_rtx_costs): Likewise.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-08-12 08:08:31 +0000
++++ new/gcc/config/arm/arm.c	2011-08-18 13:53:37 +0000
+@@ -7464,6 +7464,9 @@
+ 	*total = COSTS_N_INSNS (4);
+       return true;
+ 
++    case SET:
++      return false;
++
+     default:
+       *total = COSTS_N_INSNS (4);
+       return false;
+@@ -7811,6 +7814,9 @@
+       *total = COSTS_N_INSNS (1) + 1;
+       return true;
+ 
++    case SET:
++      return false;
++
+     default:
+       if (mode != VOIDmode)
+ 	*total = COSTS_N_INSNS (ARM_NUM_REGS (mode));
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106794.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106794.patch
new file mode 100644
index 0000000..29663c6
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106794.patch
@@ -0,0 +1,2648 @@
+2011-08-24  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	gcc/
+	* config/arm/arm.c (arm_init_neon_builtins): Use 
+	n_operands instead of n_generator_args.
+
+2011-08-24  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from mainline
+	2011-04-18  Jie Zhang  <jie@codesourcery.com>
+	Richard Earnshaw  <rearnsha@arm.com>
+
+	* arm.c (neon_builtin_type_bits): Remove.
+	(typedef enum neon_builtin_mode): New.
+	(T_MAX): Don't define.
+	(typedef enum neon_builtin_datum): Remove bits, codes[],
+	num_vars and base_fcode.  Add mode, code and fcode.
+	(VAR1, VAR2, VAR3, VAR4, VAR5, VAR6, VAR7, VAR8, VAR9
+	VAR10): Change accordingly.
+	(neon_builtin_data[]): Change accordingly
+	(arm_init_neon_builtins): Change accordingly.
+	(neon_builtin_compare): Remove.
+	(locate_neon_builtin_icode): Remove.
+	(arm_expand_neon_builtin): Change accordingly.
+
+	* arm.h (enum arm_builtins): Move to ...
+	* arm.c (enum arm_builtins): ... here; and rearrange builtin code.
+
+	* arm.c (arm_builtin_decl): Declare.
+	(TARGET_BUILTIN_DECL): Define.
+	(enum arm_builtins): Correct ARM_BUILTIN_MAX.
+	(arm_builtin_decls[]): New.
+	(arm_init_neon_builtins): Store builtin declarations in
+	arm_builtin_decls[].
+	(arm_init_tls_builtins): Likewise.
+	(arm_init_iwmmxt_builtins): Likewise.  Refactor initialization code.
+	(arm_builtin_decl): New.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-08-18 13:53:37 +0000
++++ new/gcc/config/arm/arm.c	2011-08-24 17:35:16 +0000
+@@ -162,6 +162,7 @@
+ static rtx arm_expand_binop_builtin (enum insn_code, tree, rtx);
+ static rtx arm_expand_unop_builtin (enum insn_code, tree, rtx, int);
+ static rtx arm_expand_builtin (tree, rtx, rtx, enum machine_mode, int);
++static tree arm_builtin_decl (unsigned, bool);
+ static void emit_constant_insn (rtx cond, rtx pattern);
+ static rtx emit_set_insn (rtx, rtx);
+ static int arm_arg_partial_bytes (CUMULATIVE_ARGS *, enum machine_mode,
+@@ -415,6 +416,8 @@
+ #define TARGET_INIT_BUILTINS  arm_init_builtins
+ #undef  TARGET_EXPAND_BUILTIN
+ #define TARGET_EXPAND_BUILTIN arm_expand_builtin
++#undef  TARGET_BUILTIN_DECL
++#define TARGET_BUILTIN_DECL arm_builtin_decl
+ 
+ #undef TARGET_INIT_LIBFUNCS
+ #define TARGET_INIT_LIBFUNCS arm_init_libfuncs
+@@ -18147,505 +18150,31 @@
+   return value;
+ }
+ 
+-#define def_mbuiltin(MASK, NAME, TYPE, CODE)				\
+-  do									\
+-    {									\
+-      if ((MASK) & insn_flags)						\
+-        add_builtin_function ((NAME), (TYPE), (CODE),			\
+-			     BUILT_IN_MD, NULL, NULL_TREE);		\
+-    }									\
+-  while (0)
+-
+-struct builtin_description
+-{
+-  const unsigned int       mask;
+-  const enum insn_code     icode;
+-  const char * const       name;
+-  const enum arm_builtins  code;
+-  const enum rtx_code      comparison;
+-  const unsigned int       flag;
+-};
+-
+-static const struct builtin_description bdesc_2arg[] =
+-{
+-#define IWMMXT_BUILTIN(code, string, builtin) \
+-  { FL_IWMMXT, CODE_FOR_##code, "__builtin_arm_" string, \
+-    ARM_BUILTIN_##builtin, UNKNOWN, 0 },
+-
+-  IWMMXT_BUILTIN (addv8qi3, "waddb", WADDB)
+-  IWMMXT_BUILTIN (addv4hi3, "waddh", WADDH)
+-  IWMMXT_BUILTIN (addv2si3, "waddw", WADDW)
+-  IWMMXT_BUILTIN (subv8qi3, "wsubb", WSUBB)
+-  IWMMXT_BUILTIN (subv4hi3, "wsubh", WSUBH)
+-  IWMMXT_BUILTIN (subv2si3, "wsubw", WSUBW)
+-  IWMMXT_BUILTIN (ssaddv8qi3, "waddbss", WADDSSB)
+-  IWMMXT_BUILTIN (ssaddv4hi3, "waddhss", WADDSSH)
+-  IWMMXT_BUILTIN (ssaddv2si3, "waddwss", WADDSSW)
+-  IWMMXT_BUILTIN (sssubv8qi3, "wsubbss", WSUBSSB)
+-  IWMMXT_BUILTIN (sssubv4hi3, "wsubhss", WSUBSSH)
+-  IWMMXT_BUILTIN (sssubv2si3, "wsubwss", WSUBSSW)
+-  IWMMXT_BUILTIN (usaddv8qi3, "waddbus", WADDUSB)
+-  IWMMXT_BUILTIN (usaddv4hi3, "waddhus", WADDUSH)
+-  IWMMXT_BUILTIN (usaddv2si3, "waddwus", WADDUSW)
+-  IWMMXT_BUILTIN (ussubv8qi3, "wsubbus", WSUBUSB)
+-  IWMMXT_BUILTIN (ussubv4hi3, "wsubhus", WSUBUSH)
+-  IWMMXT_BUILTIN (ussubv2si3, "wsubwus", WSUBUSW)
+-  IWMMXT_BUILTIN (mulv4hi3, "wmulul", WMULUL)
+-  IWMMXT_BUILTIN (smulv4hi3_highpart, "wmulsm", WMULSM)
+-  IWMMXT_BUILTIN (umulv4hi3_highpart, "wmulum", WMULUM)
+-  IWMMXT_BUILTIN (eqv8qi3, "wcmpeqb", WCMPEQB)
+-  IWMMXT_BUILTIN (eqv4hi3, "wcmpeqh", WCMPEQH)
+-  IWMMXT_BUILTIN (eqv2si3, "wcmpeqw", WCMPEQW)
+-  IWMMXT_BUILTIN (gtuv8qi3, "wcmpgtub", WCMPGTUB)
+-  IWMMXT_BUILTIN (gtuv4hi3, "wcmpgtuh", WCMPGTUH)
+-  IWMMXT_BUILTIN (gtuv2si3, "wcmpgtuw", WCMPGTUW)
+-  IWMMXT_BUILTIN (gtv8qi3, "wcmpgtsb", WCMPGTSB)
+-  IWMMXT_BUILTIN (gtv4hi3, "wcmpgtsh", WCMPGTSH)
+-  IWMMXT_BUILTIN (gtv2si3, "wcmpgtsw", WCMPGTSW)
+-  IWMMXT_BUILTIN (umaxv8qi3, "wmaxub", WMAXUB)
+-  IWMMXT_BUILTIN (smaxv8qi3, "wmaxsb", WMAXSB)
+-  IWMMXT_BUILTIN (umaxv4hi3, "wmaxuh", WMAXUH)
+-  IWMMXT_BUILTIN (smaxv4hi3, "wmaxsh", WMAXSH)
+-  IWMMXT_BUILTIN (umaxv2si3, "wmaxuw", WMAXUW)
+-  IWMMXT_BUILTIN (smaxv2si3, "wmaxsw", WMAXSW)
+-  IWMMXT_BUILTIN (uminv8qi3, "wminub", WMINUB)
+-  IWMMXT_BUILTIN (sminv8qi3, "wminsb", WMINSB)
+-  IWMMXT_BUILTIN (uminv4hi3, "wminuh", WMINUH)
+-  IWMMXT_BUILTIN (sminv4hi3, "wminsh", WMINSH)
+-  IWMMXT_BUILTIN (uminv2si3, "wminuw", WMINUW)
+-  IWMMXT_BUILTIN (sminv2si3, "wminsw", WMINSW)
+-  IWMMXT_BUILTIN (iwmmxt_anddi3, "wand", WAND)
+-  IWMMXT_BUILTIN (iwmmxt_nanddi3, "wandn", WANDN)
+-  IWMMXT_BUILTIN (iwmmxt_iordi3, "wor", WOR)
+-  IWMMXT_BUILTIN (iwmmxt_xordi3, "wxor", WXOR)
+-  IWMMXT_BUILTIN (iwmmxt_uavgv8qi3, "wavg2b", WAVG2B)
+-  IWMMXT_BUILTIN (iwmmxt_uavgv4hi3, "wavg2h", WAVG2H)
+-  IWMMXT_BUILTIN (iwmmxt_uavgrndv8qi3, "wavg2br", WAVG2BR)
+-  IWMMXT_BUILTIN (iwmmxt_uavgrndv4hi3, "wavg2hr", WAVG2HR)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckilb, "wunpckilb", WUNPCKILB)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckilh, "wunpckilh", WUNPCKILH)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckilw, "wunpckilw", WUNPCKILW)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckihb, "wunpckihb", WUNPCKIHB)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckihh, "wunpckihh", WUNPCKIHH)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckihw, "wunpckihw", WUNPCKIHW)
+-  IWMMXT_BUILTIN (iwmmxt_wmadds, "wmadds", WMADDS)
+-  IWMMXT_BUILTIN (iwmmxt_wmaddu, "wmaddu", WMADDU)
+-
+-#define IWMMXT_BUILTIN2(code, builtin) \
+-  { FL_IWMMXT, CODE_FOR_##code, NULL, ARM_BUILTIN_##builtin, UNKNOWN, 0 },
+-
+-  IWMMXT_BUILTIN2 (iwmmxt_wpackhss, WPACKHSS)
+-  IWMMXT_BUILTIN2 (iwmmxt_wpackwss, WPACKWSS)
+-  IWMMXT_BUILTIN2 (iwmmxt_wpackdss, WPACKDSS)
+-  IWMMXT_BUILTIN2 (iwmmxt_wpackhus, WPACKHUS)
+-  IWMMXT_BUILTIN2 (iwmmxt_wpackwus, WPACKWUS)
+-  IWMMXT_BUILTIN2 (iwmmxt_wpackdus, WPACKDUS)
+-  IWMMXT_BUILTIN2 (ashlv4hi3_di,    WSLLH)
+-  IWMMXT_BUILTIN2 (ashlv4hi3_iwmmxt, WSLLHI)
+-  IWMMXT_BUILTIN2 (ashlv2si3_di,    WSLLW)
+-  IWMMXT_BUILTIN2 (ashlv2si3_iwmmxt, WSLLWI)
+-  IWMMXT_BUILTIN2 (ashldi3_di,      WSLLD)
+-  IWMMXT_BUILTIN2 (ashldi3_iwmmxt,  WSLLDI)
+-  IWMMXT_BUILTIN2 (lshrv4hi3_di,    WSRLH)
+-  IWMMXT_BUILTIN2 (lshrv4hi3_iwmmxt, WSRLHI)
+-  IWMMXT_BUILTIN2 (lshrv2si3_di,    WSRLW)
+-  IWMMXT_BUILTIN2 (lshrv2si3_iwmmxt, WSRLWI)
+-  IWMMXT_BUILTIN2 (lshrdi3_di,      WSRLD)
+-  IWMMXT_BUILTIN2 (lshrdi3_iwmmxt,  WSRLDI)
+-  IWMMXT_BUILTIN2 (ashrv4hi3_di,    WSRAH)
+-  IWMMXT_BUILTIN2 (ashrv4hi3_iwmmxt, WSRAHI)
+-  IWMMXT_BUILTIN2 (ashrv2si3_di,    WSRAW)
+-  IWMMXT_BUILTIN2 (ashrv2si3_iwmmxt, WSRAWI)
+-  IWMMXT_BUILTIN2 (ashrdi3_di,      WSRAD)
+-  IWMMXT_BUILTIN2 (ashrdi3_iwmmxt,  WSRADI)
+-  IWMMXT_BUILTIN2 (rorv4hi3_di,     WRORH)
+-  IWMMXT_BUILTIN2 (rorv4hi3,        WRORHI)
+-  IWMMXT_BUILTIN2 (rorv2si3_di,     WRORW)
+-  IWMMXT_BUILTIN2 (rorv2si3,        WRORWI)
+-  IWMMXT_BUILTIN2 (rordi3_di,       WRORD)
+-  IWMMXT_BUILTIN2 (rordi3,          WRORDI)
+-  IWMMXT_BUILTIN2 (iwmmxt_wmacuz,   WMACUZ)
+-  IWMMXT_BUILTIN2 (iwmmxt_wmacsz,   WMACSZ)
+-};
+-
+-static const struct builtin_description bdesc_1arg[] =
+-{
+-  IWMMXT_BUILTIN (iwmmxt_tmovmskb, "tmovmskb", TMOVMSKB)
+-  IWMMXT_BUILTIN (iwmmxt_tmovmskh, "tmovmskh", TMOVMSKH)
+-  IWMMXT_BUILTIN (iwmmxt_tmovmskw, "tmovmskw", TMOVMSKW)
+-  IWMMXT_BUILTIN (iwmmxt_waccb, "waccb", WACCB)
+-  IWMMXT_BUILTIN (iwmmxt_wacch, "wacch", WACCH)
+-  IWMMXT_BUILTIN (iwmmxt_waccw, "waccw", WACCW)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckehub, "wunpckehub", WUNPCKEHUB)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckehuh, "wunpckehuh", WUNPCKEHUH)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckehuw, "wunpckehuw", WUNPCKEHUW)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckehsb, "wunpckehsb", WUNPCKEHSB)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckehsh, "wunpckehsh", WUNPCKEHSH)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckehsw, "wunpckehsw", WUNPCKEHSW)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckelub, "wunpckelub", WUNPCKELUB)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckeluh, "wunpckeluh", WUNPCKELUH)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckeluw, "wunpckeluw", WUNPCKELUW)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckelsb, "wunpckelsb", WUNPCKELSB)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckelsh, "wunpckelsh", WUNPCKELSH)
+-  IWMMXT_BUILTIN (iwmmxt_wunpckelsw, "wunpckelsw", WUNPCKELSW)
+-};
+-
+-/* Set up all the iWMMXt builtins.  This is
+-   not called if TARGET_IWMMXT is zero.  */
+-
+-static void
+-arm_init_iwmmxt_builtins (void)
+-{
+-  const struct builtin_description * d;
+-  size_t i;
+-  tree endlink = void_list_node;
+-
+-  tree V2SI_type_node = build_vector_type_for_mode (intSI_type_node, V2SImode);
+-  tree V4HI_type_node = build_vector_type_for_mode (intHI_type_node, V4HImode);
+-  tree V8QI_type_node = build_vector_type_for_mode (intQI_type_node, V8QImode);
+-
+-  tree int_ftype_int
+-    = build_function_type (integer_type_node,
+-			   tree_cons (NULL_TREE, integer_type_node, endlink));
+-  tree v8qi_ftype_v8qi_v8qi_int
+-    = build_function_type (V8QI_type_node,
+-			   tree_cons (NULL_TREE, V8QI_type_node,
+-				      tree_cons (NULL_TREE, V8QI_type_node,
+-						 tree_cons (NULL_TREE,
+-							    integer_type_node,
+-							    endlink))));
+-  tree v4hi_ftype_v4hi_int
+-    = build_function_type (V4HI_type_node,
+-			   tree_cons (NULL_TREE, V4HI_type_node,
+-				      tree_cons (NULL_TREE, integer_type_node,
+-						 endlink)));
+-  tree v2si_ftype_v2si_int
+-    = build_function_type (V2SI_type_node,
+-			   tree_cons (NULL_TREE, V2SI_type_node,
+-				      tree_cons (NULL_TREE, integer_type_node,
+-						 endlink)));
+-  tree v2si_ftype_di_di
+-    = build_function_type (V2SI_type_node,
+-			   tree_cons (NULL_TREE, long_long_integer_type_node,
+-				      tree_cons (NULL_TREE, long_long_integer_type_node,
+-						 endlink)));
+-  tree di_ftype_di_int
+-    = build_function_type (long_long_integer_type_node,
+-			   tree_cons (NULL_TREE, long_long_integer_type_node,
+-				      tree_cons (NULL_TREE, integer_type_node,
+-						 endlink)));
+-  tree di_ftype_di_int_int
+-    = build_function_type (long_long_integer_type_node,
+-			   tree_cons (NULL_TREE, long_long_integer_type_node,
+-				      tree_cons (NULL_TREE, integer_type_node,
+-						 tree_cons (NULL_TREE,
+-							    integer_type_node,
+-							    endlink))));
+-  tree int_ftype_v8qi
+-    = build_function_type (integer_type_node,
+-			   tree_cons (NULL_TREE, V8QI_type_node,
+-				      endlink));
+-  tree int_ftype_v4hi
+-    = build_function_type (integer_type_node,
+-			   tree_cons (NULL_TREE, V4HI_type_node,
+-				      endlink));
+-  tree int_ftype_v2si
+-    = build_function_type (integer_type_node,
+-			   tree_cons (NULL_TREE, V2SI_type_node,
+-				      endlink));
+-  tree int_ftype_v8qi_int
+-    = build_function_type (integer_type_node,
+-			   tree_cons (NULL_TREE, V8QI_type_node,
+-				      tree_cons (NULL_TREE, integer_type_node,
+-						 endlink)));
+-  tree int_ftype_v4hi_int
+-    = build_function_type (integer_type_node,
+-			   tree_cons (NULL_TREE, V4HI_type_node,
+-				      tree_cons (NULL_TREE, integer_type_node,
+-						 endlink)));
+-  tree int_ftype_v2si_int
+-    = build_function_type (integer_type_node,
+-			   tree_cons (NULL_TREE, V2SI_type_node,
+-				      tree_cons (NULL_TREE, integer_type_node,
+-						 endlink)));
+-  tree v8qi_ftype_v8qi_int_int
+-    = build_function_type (V8QI_type_node,
+-			   tree_cons (NULL_TREE, V8QI_type_node,
+-				      tree_cons (NULL_TREE, integer_type_node,
+-						 tree_cons (NULL_TREE,
+-							    integer_type_node,
+-							    endlink))));
+-  tree v4hi_ftype_v4hi_int_int
+-    = build_function_type (V4HI_type_node,
+-			   tree_cons (NULL_TREE, V4HI_type_node,
+-				      tree_cons (NULL_TREE, integer_type_node,
+-						 tree_cons (NULL_TREE,
+-							    integer_type_node,
+-							    endlink))));
+-  tree v2si_ftype_v2si_int_int
+-    = build_function_type (V2SI_type_node,
+-			   tree_cons (NULL_TREE, V2SI_type_node,
+-				      tree_cons (NULL_TREE, integer_type_node,
+-						 tree_cons (NULL_TREE,
+-							    integer_type_node,
+-							    endlink))));
+-  /* Miscellaneous.  */
+-  tree v8qi_ftype_v4hi_v4hi
+-    = build_function_type (V8QI_type_node,
+-			   tree_cons (NULL_TREE, V4HI_type_node,
+-				      tree_cons (NULL_TREE, V4HI_type_node,
+-						 endlink)));
+-  tree v4hi_ftype_v2si_v2si
+-    = build_function_type (V4HI_type_node,
+-			   tree_cons (NULL_TREE, V2SI_type_node,
+-				      tree_cons (NULL_TREE, V2SI_type_node,
+-						 endlink)));
+-  tree v2si_ftype_v4hi_v4hi
+-    = build_function_type (V2SI_type_node,
+-			   tree_cons (NULL_TREE, V4HI_type_node,
+-				      tree_cons (NULL_TREE, V4HI_type_node,
+-						 endlink)));
+-  tree v2si_ftype_v8qi_v8qi
+-    = build_function_type (V2SI_type_node,
+-			   tree_cons (NULL_TREE, V8QI_type_node,
+-				      tree_cons (NULL_TREE, V8QI_type_node,
+-						 endlink)));
+-  tree v4hi_ftype_v4hi_di
+-    = build_function_type (V4HI_type_node,
+-			   tree_cons (NULL_TREE, V4HI_type_node,
+-				      tree_cons (NULL_TREE,
+-						 long_long_integer_type_node,
+-						 endlink)));
+-  tree v2si_ftype_v2si_di
+-    = build_function_type (V2SI_type_node,
+-			   tree_cons (NULL_TREE, V2SI_type_node,
+-				      tree_cons (NULL_TREE,
+-						 long_long_integer_type_node,
+-						 endlink)));
+-  tree void_ftype_int_int
+-    = build_function_type (void_type_node,
+-			   tree_cons (NULL_TREE, integer_type_node,
+-				      tree_cons (NULL_TREE, integer_type_node,
+-						 endlink)));
+-  tree di_ftype_void
+-    = build_function_type (long_long_unsigned_type_node, endlink);
+-  tree di_ftype_v8qi
+-    = build_function_type (long_long_integer_type_node,
+-			   tree_cons (NULL_TREE, V8QI_type_node,
+-				      endlink));
+-  tree di_ftype_v4hi
+-    = build_function_type (long_long_integer_type_node,
+-			   tree_cons (NULL_TREE, V4HI_type_node,
+-				      endlink));
+-  tree di_ftype_v2si
+-    = build_function_type (long_long_integer_type_node,
+-			   tree_cons (NULL_TREE, V2SI_type_node,
+-				      endlink));
+-  tree v2si_ftype_v4hi
+-    = build_function_type (V2SI_type_node,
+-			   tree_cons (NULL_TREE, V4HI_type_node,
+-				      endlink));
+-  tree v4hi_ftype_v8qi
+-    = build_function_type (V4HI_type_node,
+-			   tree_cons (NULL_TREE, V8QI_type_node,
+-				      endlink));
+-
+-  tree di_ftype_di_v4hi_v4hi
+-    = build_function_type (long_long_unsigned_type_node,
+-			   tree_cons (NULL_TREE,
+-				      long_long_unsigned_type_node,
+-				      tree_cons (NULL_TREE, V4HI_type_node,
+-						 tree_cons (NULL_TREE,
+-							    V4HI_type_node,
+-							    endlink))));
+-
+-  tree di_ftype_v4hi_v4hi
+-    = build_function_type (long_long_unsigned_type_node,
+-			   tree_cons (NULL_TREE, V4HI_type_node,
+-				      tree_cons (NULL_TREE, V4HI_type_node,
+-						 endlink)));
+-
+-  /* Normal vector binops.  */
+-  tree v8qi_ftype_v8qi_v8qi
+-    = build_function_type (V8QI_type_node,
+-			   tree_cons (NULL_TREE, V8QI_type_node,
+-				      tree_cons (NULL_TREE, V8QI_type_node,
+-						 endlink)));
+-  tree v4hi_ftype_v4hi_v4hi
+-    = build_function_type (V4HI_type_node,
+-			   tree_cons (NULL_TREE, V4HI_type_node,
+-				      tree_cons (NULL_TREE, V4HI_type_node,
+-						 endlink)));
+-  tree v2si_ftype_v2si_v2si
+-    = build_function_type (V2SI_type_node,
+-			   tree_cons (NULL_TREE, V2SI_type_node,
+-				      tree_cons (NULL_TREE, V2SI_type_node,
+-						 endlink)));
+-  tree di_ftype_di_di
+-    = build_function_type (long_long_unsigned_type_node,
+-			   tree_cons (NULL_TREE, long_long_unsigned_type_node,
+-				      tree_cons (NULL_TREE,
+-						 long_long_unsigned_type_node,
+-						 endlink)));
+-
+-  /* Add all builtins that are more or less simple operations on two
+-     operands.  */
+-  for (i = 0, d = bdesc_2arg; i < ARRAY_SIZE (bdesc_2arg); i++, d++)
+-    {
+-      /* Use one of the operands; the target can have a different mode for
+-	 mask-generating compares.  */
+-      enum machine_mode mode;
+-      tree type;
+-
+-      if (d->name == 0)
+-	continue;
+-
+-      mode = insn_data[d->icode].operand[1].mode;
+-
+-      switch (mode)
+-	{
+-	case V8QImode:
+-	  type = v8qi_ftype_v8qi_v8qi;
+-	  break;
+-	case V4HImode:
+-	  type = v4hi_ftype_v4hi_v4hi;
+-	  break;
+-	case V2SImode:
+-	  type = v2si_ftype_v2si_v2si;
+-	  break;
+-	case DImode:
+-	  type = di_ftype_di_di;
+-	  break;
+-
+-	default:
+-	  gcc_unreachable ();
+-	}
+-
+-      def_mbuiltin (d->mask, d->name, type, d->code);
+-    }
+-
+-  /* Add the remaining MMX insns with somewhat more complicated types.  */
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wzero", di_ftype_void, ARM_BUILTIN_WZERO);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_setwcx", void_ftype_int_int, ARM_BUILTIN_SETWCX);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_getwcx", int_ftype_int, ARM_BUILTIN_GETWCX);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsllh", v4hi_ftype_v4hi_di, ARM_BUILTIN_WSLLH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsllw", v2si_ftype_v2si_di, ARM_BUILTIN_WSLLW);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wslld", di_ftype_di_di, ARM_BUILTIN_WSLLD);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsllhi", v4hi_ftype_v4hi_int, ARM_BUILTIN_WSLLHI);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsllwi", v2si_ftype_v2si_int, ARM_BUILTIN_WSLLWI);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wslldi", di_ftype_di_int, ARM_BUILTIN_WSLLDI);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsrlh", v4hi_ftype_v4hi_di, ARM_BUILTIN_WSRLH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsrlw", v2si_ftype_v2si_di, ARM_BUILTIN_WSRLW);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsrld", di_ftype_di_di, ARM_BUILTIN_WSRLD);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsrlhi", v4hi_ftype_v4hi_int, ARM_BUILTIN_WSRLHI);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsrlwi", v2si_ftype_v2si_int, ARM_BUILTIN_WSRLWI);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsrldi", di_ftype_di_int, ARM_BUILTIN_WSRLDI);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsrah", v4hi_ftype_v4hi_di, ARM_BUILTIN_WSRAH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsraw", v2si_ftype_v2si_di, ARM_BUILTIN_WSRAW);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsrad", di_ftype_di_di, ARM_BUILTIN_WSRAD);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsrahi", v4hi_ftype_v4hi_int, ARM_BUILTIN_WSRAHI);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsrawi", v2si_ftype_v2si_int, ARM_BUILTIN_WSRAWI);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsradi", di_ftype_di_int, ARM_BUILTIN_WSRADI);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wrorh", v4hi_ftype_v4hi_di, ARM_BUILTIN_WRORH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wrorw", v2si_ftype_v2si_di, ARM_BUILTIN_WRORW);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wrord", di_ftype_di_di, ARM_BUILTIN_WRORD);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wrorhi", v4hi_ftype_v4hi_int, ARM_BUILTIN_WRORHI);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wrorwi", v2si_ftype_v2si_int, ARM_BUILTIN_WRORWI);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wrordi", di_ftype_di_int, ARM_BUILTIN_WRORDI);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wshufh", v4hi_ftype_v4hi_int, ARM_BUILTIN_WSHUFH);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsadb", v2si_ftype_v8qi_v8qi, ARM_BUILTIN_WSADB);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsadh", v2si_ftype_v4hi_v4hi, ARM_BUILTIN_WSADH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsadbz", v2si_ftype_v8qi_v8qi, ARM_BUILTIN_WSADBZ);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wsadhz", v2si_ftype_v4hi_v4hi, ARM_BUILTIN_WSADHZ);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_textrmsb", int_ftype_v8qi_int, ARM_BUILTIN_TEXTRMSB);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_textrmsh", int_ftype_v4hi_int, ARM_BUILTIN_TEXTRMSH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_textrmsw", int_ftype_v2si_int, ARM_BUILTIN_TEXTRMSW);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_textrmub", int_ftype_v8qi_int, ARM_BUILTIN_TEXTRMUB);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_textrmuh", int_ftype_v4hi_int, ARM_BUILTIN_TEXTRMUH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_textrmuw", int_ftype_v2si_int, ARM_BUILTIN_TEXTRMUW);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_tinsrb", v8qi_ftype_v8qi_int_int, ARM_BUILTIN_TINSRB);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_tinsrh", v4hi_ftype_v4hi_int_int, ARM_BUILTIN_TINSRH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_tinsrw", v2si_ftype_v2si_int_int, ARM_BUILTIN_TINSRW);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_waccb", di_ftype_v8qi, ARM_BUILTIN_WACCB);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wacch", di_ftype_v4hi, ARM_BUILTIN_WACCH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_waccw", di_ftype_v2si, ARM_BUILTIN_WACCW);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_tmovmskb", int_ftype_v8qi, ARM_BUILTIN_TMOVMSKB);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_tmovmskh", int_ftype_v4hi, ARM_BUILTIN_TMOVMSKH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_tmovmskw", int_ftype_v2si, ARM_BUILTIN_TMOVMSKW);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wpackhss", v8qi_ftype_v4hi_v4hi, ARM_BUILTIN_WPACKHSS);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wpackhus", v8qi_ftype_v4hi_v4hi, ARM_BUILTIN_WPACKHUS);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wpackwus", v4hi_ftype_v2si_v2si, ARM_BUILTIN_WPACKWUS);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wpackwss", v4hi_ftype_v2si_v2si, ARM_BUILTIN_WPACKWSS);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wpackdus", v2si_ftype_di_di, ARM_BUILTIN_WPACKDUS);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wpackdss", v2si_ftype_di_di, ARM_BUILTIN_WPACKDSS);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wunpckehub", v4hi_ftype_v8qi, ARM_BUILTIN_WUNPCKEHUB);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wunpckehuh", v2si_ftype_v4hi, ARM_BUILTIN_WUNPCKEHUH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wunpckehuw", di_ftype_v2si, ARM_BUILTIN_WUNPCKEHUW);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wunpckehsb", v4hi_ftype_v8qi, ARM_BUILTIN_WUNPCKEHSB);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wunpckehsh", v2si_ftype_v4hi, ARM_BUILTIN_WUNPCKEHSH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wunpckehsw", di_ftype_v2si, ARM_BUILTIN_WUNPCKEHSW);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wunpckelub", v4hi_ftype_v8qi, ARM_BUILTIN_WUNPCKELUB);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wunpckeluh", v2si_ftype_v4hi, ARM_BUILTIN_WUNPCKELUH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wunpckeluw", di_ftype_v2si, ARM_BUILTIN_WUNPCKELUW);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wunpckelsb", v4hi_ftype_v8qi, ARM_BUILTIN_WUNPCKELSB);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wunpckelsh", v2si_ftype_v4hi, ARM_BUILTIN_WUNPCKELSH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wunpckelsw", di_ftype_v2si, ARM_BUILTIN_WUNPCKELSW);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wmacs", di_ftype_di_v4hi_v4hi, ARM_BUILTIN_WMACS);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wmacsz", di_ftype_v4hi_v4hi, ARM_BUILTIN_WMACSZ);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wmacu", di_ftype_di_v4hi_v4hi, ARM_BUILTIN_WMACU);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_wmacuz", di_ftype_v4hi_v4hi, ARM_BUILTIN_WMACUZ);
+-
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_walign", v8qi_ftype_v8qi_v8qi_int, ARM_BUILTIN_WALIGN);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_tmia", di_ftype_di_int_int, ARM_BUILTIN_TMIA);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_tmiaph", di_ftype_di_int_int, ARM_BUILTIN_TMIAPH);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_tmiabb", di_ftype_di_int_int, ARM_BUILTIN_TMIABB);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_tmiabt", di_ftype_di_int_int, ARM_BUILTIN_TMIABT);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_tmiatb", di_ftype_di_int_int, ARM_BUILTIN_TMIATB);
+-  def_mbuiltin (FL_IWMMXT, "__builtin_arm_tmiatt", di_ftype_di_int_int, ARM_BUILTIN_TMIATT);
+-}
+-
+-static void
+-arm_init_tls_builtins (void)
+-{
+-  tree ftype, decl;
+-
+-  ftype = build_function_type (ptr_type_node, void_list_node);
+-  decl = add_builtin_function ("__builtin_thread_pointer", ftype,
+-			       ARM_BUILTIN_THREAD_POINTER, BUILT_IN_MD,
+-			       NULL, NULL_TREE);
+-  TREE_NOTHROW (decl) = 1;
+-  TREE_READONLY (decl) = 1;
+-}
+-
+-enum neon_builtin_type_bits {
+-  T_V8QI  = 0x0001,
+-  T_V4HI  = 0x0002,
+-  T_V2SI  = 0x0004,
+-  T_V2SF  = 0x0008,
+-  T_DI    = 0x0010,
+-  T_DREG  = 0x001F,
+-  T_V16QI = 0x0020,
+-  T_V8HI  = 0x0040,
+-  T_V4SI  = 0x0080,
+-  T_V4SF  = 0x0100,
+-  T_V2DI  = 0x0200,
+-  T_TI	  = 0x0400,
+-  T_QREG  = 0x07E0,
+-  T_EI	  = 0x0800,
+-  T_OI	  = 0x1000
+-};
++typedef enum {
++  T_V8QI,
++  T_V4HI,
++  T_V2SI,
++  T_V2SF,
++  T_DI,
++  T_V16QI,
++  T_V8HI,
++  T_V4SI,
++  T_V4SF,
++  T_V2DI,
++  T_TI,
++  T_EI,
++  T_OI,
++  T_MAX		/* Size of enum.  Keep last.  */
++} neon_builtin_type_mode;
++
++#define TYPE_MODE_BIT(X) (1 << (X))
++
++#define TB_DREG (TYPE_MODE_BIT (T_V8QI) | TYPE_MODE_BIT (T_V4HI)	\
++		 | TYPE_MODE_BIT (T_V2SI) | TYPE_MODE_BIT (T_V2SF)	\
++		 | TYPE_MODE_BIT (T_DI))
++#define TB_QREG (TYPE_MODE_BIT (T_V16QI) | TYPE_MODE_BIT (T_V8HI)	\
++		 | TYPE_MODE_BIT (T_V4SI) | TYPE_MODE_BIT (T_V4SF)	\
++		 | TYPE_MODE_BIT (T_V2DI) | TYPE_MODE_BIT (T_TI))
+ 
+ #define v8qi_UP  T_V8QI
+ #define v4hi_UP  T_V4HI
+@@ -18663,8 +18192,6 @@
+ 
+ #define UP(X) X##_UP
+ 
+-#define T_MAX 13
+-
+ typedef enum {
+   NEON_BINOP,
+   NEON_TERNOP,
+@@ -18708,49 +18235,42 @@
+ typedef struct {
+   const char *name;
+   const neon_itype itype;
+-  const int bits;
+-  const enum insn_code codes[T_MAX];
+-  const unsigned int num_vars;
+-  unsigned int base_fcode;
++  const neon_builtin_type_mode mode;
++  const enum insn_code code;
++  unsigned int fcode;
+ } neon_builtin_datum;
+ 
+ #define CF(N,X) CODE_FOR_neon_##N##X
+ 
+ #define VAR1(T, N, A) \
+-  #N, NEON_##T, UP (A), { CF (N, A) }, 1, 0
++  {#N, NEON_##T, UP (A), CF (N, A), 0}
+ #define VAR2(T, N, A, B) \
+-  #N, NEON_##T, UP (A) | UP (B), { CF (N, A), CF (N, B) }, 2, 0
++  VAR1 (T, N, A), \
++  {#N, NEON_##T, UP (B), CF (N, B), 0}
+ #define VAR3(T, N, A, B, C) \
+-  #N, NEON_##T, UP (A) | UP (B) | UP (C), \
+-  { CF (N, A), CF (N, B), CF (N, C) }, 3, 0
++  VAR2 (T, N, A, B), \
++  {#N, NEON_##T, UP (C), CF (N, C), 0}
+ #define VAR4(T, N, A, B, C, D) \
+-  #N, NEON_##T, UP (A) | UP (B) | UP (C) | UP (D), \
+-  { CF (N, A), CF (N, B), CF (N, C), CF (N, D) }, 4, 0
++  VAR3 (T, N, A, B, C), \
++  {#N, NEON_##T, UP (D), CF (N, D), 0}
+ #define VAR5(T, N, A, B, C, D, E) \
+-  #N, NEON_##T, UP (A) | UP (B) | UP (C) | UP (D) | UP (E), \
+-  { CF (N, A), CF (N, B), CF (N, C), CF (N, D), CF (N, E) }, 5, 0
++  VAR4 (T, N, A, B, C, D), \
++  {#N, NEON_##T, UP (E), CF (N, E), 0}
+ #define VAR6(T, N, A, B, C, D, E, F) \
+-  #N, NEON_##T, UP (A) | UP (B) | UP (C) | UP (D) | UP (E) | UP (F), \
+-  { CF (N, A), CF (N, B), CF (N, C), CF (N, D), CF (N, E), CF (N, F) }, 6, 0
++  VAR5 (T, N, A, B, C, D, E), \
++  {#N, NEON_##T, UP (F), CF (N, F), 0}
+ #define VAR7(T, N, A, B, C, D, E, F, G) \
+-  #N, NEON_##T, UP (A) | UP (B) | UP (C) | UP (D) | UP (E) | UP (F) | UP (G), \
+-  { CF (N, A), CF (N, B), CF (N, C), CF (N, D), CF (N, E), CF (N, F), \
+-    CF (N, G) }, 7, 0
++  VAR6 (T, N, A, B, C, D, E, F), \
++  {#N, NEON_##T, UP (G), CF (N, G), 0}
+ #define VAR8(T, N, A, B, C, D, E, F, G, H) \
+-  #N, NEON_##T, UP (A) | UP (B) | UP (C) | UP (D) | UP (E) | UP (F) | UP (G) \
+-                | UP (H), \
+-  { CF (N, A), CF (N, B), CF (N, C), CF (N, D), CF (N, E), CF (N, F), \
+-    CF (N, G), CF (N, H) }, 8, 0
++  VAR7 (T, N, A, B, C, D, E, F, G), \
++  {#N, NEON_##T, UP (H), CF (N, H), 0}
+ #define VAR9(T, N, A, B, C, D, E, F, G, H, I) \
+-  #N, NEON_##T, UP (A) | UP (B) | UP (C) | UP (D) | UP (E) | UP (F) | UP (G) \
+-                | UP (H) | UP (I), \
+-  { CF (N, A), CF (N, B), CF (N, C), CF (N, D), CF (N, E), CF (N, F), \
+-    CF (N, G), CF (N, H), CF (N, I) }, 9, 0
++  VAR8 (T, N, A, B, C, D, E, F, G, H), \
++  {#N, NEON_##T, UP (I), CF (N, I), 0}
+ #define VAR10(T, N, A, B, C, D, E, F, G, H, I, J) \
+-  #N, NEON_##T, UP (A) | UP (B) | UP (C) | UP (D) | UP (E) | UP (F) | UP (G) \
+-                | UP (H) | UP (I) | UP (J), \
+-  { CF (N, A), CF (N, B), CF (N, C), CF (N, D), CF (N, E), CF (N, F), \
+-    CF (N, G), CF (N, H), CF (N, I), CF (N, J) }, 10, 0
++  VAR9 (T, N, A, B, C, D, E, F, G, H, I), \
++  {#N, NEON_##T, UP (J), CF (N, J), 0}
+ 
+ /* The mode entries in the following table correspond to the "key" type of the
+    instruction variant, i.e. equivalent to that which would be specified after
+@@ -18758,192 +18278,190 @@
+    (Signed/unsigned/polynomial types are not differentiated between though, and
+    are all mapped onto the same mode for a given element size.) The modes
+    listed per instruction should be the same as those defined for that
+-   instruction's pattern in neon.md.
+-   WARNING: Variants should be listed in the same increasing order as
+-   neon_builtin_type_bits.  */
++   instruction's pattern in neon.md.  */
+ 
+ static neon_builtin_datum neon_builtin_data[] =
+ {
+-  { VAR10 (BINOP, vadd,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR3 (BINOP, vaddl, v8qi, v4hi, v2si) },
+-  { VAR3 (BINOP, vaddw, v8qi, v4hi, v2si) },
+-  { VAR6 (BINOP, vhadd, v8qi, v4hi, v2si, v16qi, v8hi, v4si) },
+-  { VAR8 (BINOP, vqadd, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di) },
+-  { VAR3 (BINOP, vaddhn, v8hi, v4si, v2di) },
+-  { VAR8 (BINOP, vmul, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR8 (TERNOP, vmla, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR3 (TERNOP, vmlal, v8qi, v4hi, v2si) },
+-  { VAR8 (TERNOP, vmls, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR3 (TERNOP, vmlsl, v8qi, v4hi, v2si) },
+-  { VAR4 (BINOP, vqdmulh, v4hi, v2si, v8hi, v4si) },
+-  { VAR2 (TERNOP, vqdmlal, v4hi, v2si) },
+-  { VAR2 (TERNOP, vqdmlsl, v4hi, v2si) },
+-  { VAR3 (BINOP, vmull, v8qi, v4hi, v2si) },
+-  { VAR2 (SCALARMULL, vmull_n, v4hi, v2si) },
+-  { VAR2 (LANEMULL, vmull_lane, v4hi, v2si) },
+-  { VAR2 (SCALARMULL, vqdmull_n, v4hi, v2si) },
+-  { VAR2 (LANEMULL, vqdmull_lane, v4hi, v2si) },
+-  { VAR4 (SCALARMULH, vqdmulh_n, v4hi, v2si, v8hi, v4si) },
+-  { VAR4 (LANEMULH, vqdmulh_lane, v4hi, v2si, v8hi, v4si) },
+-  { VAR2 (BINOP, vqdmull, v4hi, v2si) },
+-  { VAR8 (BINOP, vshl, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di) },
+-  { VAR8 (BINOP, vqshl, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di) },
+-  { VAR8 (SHIFTIMM, vshr_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di) },
+-  { VAR3 (SHIFTIMM, vshrn_n, v8hi, v4si, v2di) },
+-  { VAR3 (SHIFTIMM, vqshrn_n, v8hi, v4si, v2di) },
+-  { VAR3 (SHIFTIMM, vqshrun_n, v8hi, v4si, v2di) },
+-  { VAR8 (SHIFTIMM, vshl_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di) },
+-  { VAR8 (SHIFTIMM, vqshl_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di) },
+-  { VAR8 (SHIFTIMM, vqshlu_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di) },
+-  { VAR3 (SHIFTIMM, vshll_n, v8qi, v4hi, v2si) },
+-  { VAR8 (SHIFTACC, vsra_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di) },
+-  { VAR10 (BINOP, vsub,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR3 (BINOP, vsubl, v8qi, v4hi, v2si) },
+-  { VAR3 (BINOP, vsubw, v8qi, v4hi, v2si) },
+-  { VAR8 (BINOP, vqsub, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di) },
+-  { VAR6 (BINOP, vhsub, v8qi, v4hi, v2si, v16qi, v8hi, v4si) },
+-  { VAR3 (BINOP, vsubhn, v8hi, v4si, v2di) },
+-  { VAR8 (BINOP, vceq, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR8 (BINOP, vcge, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR8 (BINOP, vcgt, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR2 (BINOP, vcage, v2sf, v4sf) },
+-  { VAR2 (BINOP, vcagt, v2sf, v4sf) },
+-  { VAR6 (BINOP, vtst, v8qi, v4hi, v2si, v16qi, v8hi, v4si) },
+-  { VAR8 (BINOP, vabd, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR3 (BINOP, vabdl, v8qi, v4hi, v2si) },
+-  { VAR6 (TERNOP, vaba, v8qi, v4hi, v2si, v16qi, v8hi, v4si) },
+-  { VAR3 (TERNOP, vabal, v8qi, v4hi, v2si) },
+-  { VAR8 (BINOP, vmax, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR8 (BINOP, vmin, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR4 (BINOP, vpadd, v8qi, v4hi, v2si, v2sf) },
+-  { VAR6 (UNOP, vpaddl, v8qi, v4hi, v2si, v16qi, v8hi, v4si) },
+-  { VAR6 (BINOP, vpadal, v8qi, v4hi, v2si, v16qi, v8hi, v4si) },
+-  { VAR4 (BINOP, vpmax, v8qi, v4hi, v2si, v2sf) },
+-  { VAR4 (BINOP, vpmin, v8qi, v4hi, v2si, v2sf) },
+-  { VAR2 (BINOP, vrecps, v2sf, v4sf) },
+-  { VAR2 (BINOP, vrsqrts, v2sf, v4sf) },
+-  { VAR8 (SHIFTINSERT, vsri_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di) },
+-  { VAR8 (SHIFTINSERT, vsli_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di) },
+-  { VAR8 (UNOP, vabs, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR6 (UNOP, vqabs, v8qi, v4hi, v2si, v16qi, v8hi, v4si) },
+-  { VAR8 (UNOP, vneg, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR6 (UNOP, vqneg, v8qi, v4hi, v2si, v16qi, v8hi, v4si) },
+-  { VAR6 (UNOP, vcls, v8qi, v4hi, v2si, v16qi, v8hi, v4si) },
+-  { VAR6 (UNOP, vclz, v8qi, v4hi, v2si, v16qi, v8hi, v4si) },
+-  { VAR2 (UNOP, vcnt, v8qi, v16qi) },
+-  { VAR4 (UNOP, vrecpe, v2si, v2sf, v4si, v4sf) },
+-  { VAR4 (UNOP, vrsqrte, v2si, v2sf, v4si, v4sf) },
+-  { VAR6 (UNOP, vmvn, v8qi, v4hi, v2si, v16qi, v8hi, v4si) },
++  VAR10 (BINOP, vadd,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR3 (BINOP, vaddl, v8qi, v4hi, v2si),
++  VAR3 (BINOP, vaddw, v8qi, v4hi, v2si),
++  VAR6 (BINOP, vhadd, v8qi, v4hi, v2si, v16qi, v8hi, v4si),
++  VAR8 (BINOP, vqadd, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di),
++  VAR3 (BINOP, vaddhn, v8hi, v4si, v2di),
++  VAR8 (BINOP, vmul, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR8 (TERNOP, vmla, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR3 (TERNOP, vmlal, v8qi, v4hi, v2si),
++  VAR8 (TERNOP, vmls, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR3 (TERNOP, vmlsl, v8qi, v4hi, v2si),
++  VAR4 (BINOP, vqdmulh, v4hi, v2si, v8hi, v4si),
++  VAR2 (TERNOP, vqdmlal, v4hi, v2si),
++  VAR2 (TERNOP, vqdmlsl, v4hi, v2si),
++  VAR3 (BINOP, vmull, v8qi, v4hi, v2si),
++  VAR2 (SCALARMULL, vmull_n, v4hi, v2si),
++  VAR2 (LANEMULL, vmull_lane, v4hi, v2si),
++  VAR2 (SCALARMULL, vqdmull_n, v4hi, v2si),
++  VAR2 (LANEMULL, vqdmull_lane, v4hi, v2si),
++  VAR4 (SCALARMULH, vqdmulh_n, v4hi, v2si, v8hi, v4si),
++  VAR4 (LANEMULH, vqdmulh_lane, v4hi, v2si, v8hi, v4si),
++  VAR2 (BINOP, vqdmull, v4hi, v2si),
++  VAR8 (BINOP, vshl, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di),
++  VAR8 (BINOP, vqshl, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di),
++  VAR8 (SHIFTIMM, vshr_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di),
++  VAR3 (SHIFTIMM, vshrn_n, v8hi, v4si, v2di),
++  VAR3 (SHIFTIMM, vqshrn_n, v8hi, v4si, v2di),
++  VAR3 (SHIFTIMM, vqshrun_n, v8hi, v4si, v2di),
++  VAR8 (SHIFTIMM, vshl_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di),
++  VAR8 (SHIFTIMM, vqshl_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di),
++  VAR8 (SHIFTIMM, vqshlu_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di),
++  VAR3 (SHIFTIMM, vshll_n, v8qi, v4hi, v2si),
++  VAR8 (SHIFTACC, vsra_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di),
++  VAR10 (BINOP, vsub,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR3 (BINOP, vsubl, v8qi, v4hi, v2si),
++  VAR3 (BINOP, vsubw, v8qi, v4hi, v2si),
++  VAR8 (BINOP, vqsub, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di),
++  VAR6 (BINOP, vhsub, v8qi, v4hi, v2si, v16qi, v8hi, v4si),
++  VAR3 (BINOP, vsubhn, v8hi, v4si, v2di),
++  VAR8 (BINOP, vceq, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR8 (BINOP, vcge, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR8 (BINOP, vcgt, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR2 (BINOP, vcage, v2sf, v4sf),
++  VAR2 (BINOP, vcagt, v2sf, v4sf),
++  VAR6 (BINOP, vtst, v8qi, v4hi, v2si, v16qi, v8hi, v4si),
++  VAR8 (BINOP, vabd, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR3 (BINOP, vabdl, v8qi, v4hi, v2si),
++  VAR6 (TERNOP, vaba, v8qi, v4hi, v2si, v16qi, v8hi, v4si),
++  VAR3 (TERNOP, vabal, v8qi, v4hi, v2si),
++  VAR8 (BINOP, vmax, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR8 (BINOP, vmin, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR4 (BINOP, vpadd, v8qi, v4hi, v2si, v2sf),
++  VAR6 (UNOP, vpaddl, v8qi, v4hi, v2si, v16qi, v8hi, v4si),
++  VAR6 (BINOP, vpadal, v8qi, v4hi, v2si, v16qi, v8hi, v4si),
++  VAR4 (BINOP, vpmax, v8qi, v4hi, v2si, v2sf),
++  VAR4 (BINOP, vpmin, v8qi, v4hi, v2si, v2sf),
++  VAR2 (BINOP, vrecps, v2sf, v4sf),
++  VAR2 (BINOP, vrsqrts, v2sf, v4sf),
++  VAR8 (SHIFTINSERT, vsri_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di),
++  VAR8 (SHIFTINSERT, vsli_n, v8qi, v4hi, v2si, di, v16qi, v8hi, v4si, v2di),
++  VAR8 (UNOP, vabs, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR6 (UNOP, vqabs, v8qi, v4hi, v2si, v16qi, v8hi, v4si),
++  VAR8 (UNOP, vneg, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR6 (UNOP, vqneg, v8qi, v4hi, v2si, v16qi, v8hi, v4si),
++  VAR6 (UNOP, vcls, v8qi, v4hi, v2si, v16qi, v8hi, v4si),
++  VAR6 (UNOP, vclz, v8qi, v4hi, v2si, v16qi, v8hi, v4si),
++  VAR2 (UNOP, vcnt, v8qi, v16qi),
++  VAR4 (UNOP, vrecpe, v2si, v2sf, v4si, v4sf),
++  VAR4 (UNOP, vrsqrte, v2si, v2sf, v4si, v4sf),
++  VAR6 (UNOP, vmvn, v8qi, v4hi, v2si, v16qi, v8hi, v4si),
+   /* FIXME: vget_lane supports more variants than this!  */
+-  { VAR10 (GETLANE, vget_lane,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR10 (SETLANE, vset_lane,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR5 (CREATE, vcreate, v8qi, v4hi, v2si, v2sf, di) },
+-  { VAR10 (DUP, vdup_n,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR10 (DUPLANE, vdup_lane,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR5 (COMBINE, vcombine, v8qi, v4hi, v2si, v2sf, di) },
+-  { VAR5 (SPLIT, vget_high, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR5 (SPLIT, vget_low, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR3 (UNOP, vmovn, v8hi, v4si, v2di) },
+-  { VAR3 (UNOP, vqmovn, v8hi, v4si, v2di) },
+-  { VAR3 (UNOP, vqmovun, v8hi, v4si, v2di) },
+-  { VAR3 (UNOP, vmovl, v8qi, v4hi, v2si) },
+-  { VAR6 (LANEMUL, vmul_lane, v4hi, v2si, v2sf, v8hi, v4si, v4sf) },
+-  { VAR6 (LANEMAC, vmla_lane, v4hi, v2si, v2sf, v8hi, v4si, v4sf) },
+-  { VAR2 (LANEMAC, vmlal_lane, v4hi, v2si) },
+-  { VAR2 (LANEMAC, vqdmlal_lane, v4hi, v2si) },
+-  { VAR6 (LANEMAC, vmls_lane, v4hi, v2si, v2sf, v8hi, v4si, v4sf) },
+-  { VAR2 (LANEMAC, vmlsl_lane, v4hi, v2si) },
+-  { VAR2 (LANEMAC, vqdmlsl_lane, v4hi, v2si) },
+-  { VAR6 (SCALARMUL, vmul_n, v4hi, v2si, v2sf, v8hi, v4si, v4sf) },
+-  { VAR6 (SCALARMAC, vmla_n, v4hi, v2si, v2sf, v8hi, v4si, v4sf) },
+-  { VAR2 (SCALARMAC, vmlal_n, v4hi, v2si) },
+-  { VAR2 (SCALARMAC, vqdmlal_n, v4hi, v2si) },
+-  { VAR6 (SCALARMAC, vmls_n, v4hi, v2si, v2sf, v8hi, v4si, v4sf) },
+-  { VAR2 (SCALARMAC, vmlsl_n, v4hi, v2si) },
+-  { VAR2 (SCALARMAC, vqdmlsl_n, v4hi, v2si) },
+-  { VAR10 (BINOP, vext,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR8 (UNOP, vrev64, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR4 (UNOP, vrev32, v8qi, v4hi, v16qi, v8hi) },
+-  { VAR2 (UNOP, vrev16, v8qi, v16qi) },
+-  { VAR4 (CONVERT, vcvt, v2si, v2sf, v4si, v4sf) },
+-  { VAR4 (FIXCONV, vcvt_n, v2si, v2sf, v4si, v4sf) },
+-  { VAR10 (SELECT, vbsl,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR1 (VTBL, vtbl1, v8qi) },
+-  { VAR1 (VTBL, vtbl2, v8qi) },
+-  { VAR1 (VTBL, vtbl3, v8qi) },
+-  { VAR1 (VTBL, vtbl4, v8qi) },
+-  { VAR1 (VTBX, vtbx1, v8qi) },
+-  { VAR1 (VTBX, vtbx2, v8qi) },
+-  { VAR1 (VTBX, vtbx3, v8qi) },
+-  { VAR1 (VTBX, vtbx4, v8qi) },
+-  { VAR8 (RESULTPAIR, vtrn, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR8 (RESULTPAIR, vzip, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR8 (RESULTPAIR, vuzp, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf) },
+-  { VAR5 (REINTERP, vreinterpretv8qi, v8qi, v4hi, v2si, v2sf, di) },
+-  { VAR5 (REINTERP, vreinterpretv4hi, v8qi, v4hi, v2si, v2sf, di) },
+-  { VAR5 (REINTERP, vreinterpretv2si, v8qi, v4hi, v2si, v2sf, di) },
+-  { VAR5 (REINTERP, vreinterpretv2sf, v8qi, v4hi, v2si, v2sf, di) },
+-  { VAR5 (REINTERP, vreinterpretdi, v8qi, v4hi, v2si, v2sf, di) },
+-  { VAR5 (REINTERP, vreinterpretv16qi, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR5 (REINTERP, vreinterpretv8hi, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR5 (REINTERP, vreinterpretv4si, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR5 (REINTERP, vreinterpretv4sf, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR5 (REINTERP, vreinterpretv2di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR10 (LOAD1, vld1,
+-           v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR10 (LOAD1LANE, vld1_lane,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR10 (LOAD1, vld1_dup,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR10 (STORE1, vst1,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR10 (STORE1LANE, vst1_lane,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR9 (LOADSTRUCT,
+-	  vld2, v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf) },
+-  { VAR7 (LOADSTRUCTLANE, vld2_lane,
+-	  v8qi, v4hi, v2si, v2sf, v8hi, v4si, v4sf) },
+-  { VAR5 (LOADSTRUCT, vld2_dup, v8qi, v4hi, v2si, v2sf, di) },
+-  { VAR9 (STORESTRUCT, vst2,
+-	  v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf) },
+-  { VAR7 (STORESTRUCTLANE, vst2_lane,
+-	  v8qi, v4hi, v2si, v2sf, v8hi, v4si, v4sf) },
+-  { VAR9 (LOADSTRUCT,
+-	  vld3, v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf) },
+-  { VAR7 (LOADSTRUCTLANE, vld3_lane,
+-	  v8qi, v4hi, v2si, v2sf, v8hi, v4si, v4sf) },
+-  { VAR5 (LOADSTRUCT, vld3_dup, v8qi, v4hi, v2si, v2sf, di) },
+-  { VAR9 (STORESTRUCT, vst3,
+-	  v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf) },
+-  { VAR7 (STORESTRUCTLANE, vst3_lane,
+-	  v8qi, v4hi, v2si, v2sf, v8hi, v4si, v4sf) },
+-  { VAR9 (LOADSTRUCT, vld4,
+-	  v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf) },
+-  { VAR7 (LOADSTRUCTLANE, vld4_lane,
+-	  v8qi, v4hi, v2si, v2sf, v8hi, v4si, v4sf) },
+-  { VAR5 (LOADSTRUCT, vld4_dup, v8qi, v4hi, v2si, v2sf, di) },
+-  { VAR9 (STORESTRUCT, vst4,
+-	  v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf) },
+-  { VAR7 (STORESTRUCTLANE, vst4_lane,
+-	  v8qi, v4hi, v2si, v2sf, v8hi, v4si, v4sf) },
+-  { VAR10 (LOGICBINOP, vand,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR10 (LOGICBINOP, vorr,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR10 (BINOP, veor,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR10 (LOGICBINOP, vbic,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) },
+-  { VAR10 (LOGICBINOP, vorn,
+-	   v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di) }
++  VAR10 (GETLANE, vget_lane,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR10 (SETLANE, vset_lane,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR5 (CREATE, vcreate, v8qi, v4hi, v2si, v2sf, di),
++  VAR10 (DUP, vdup_n,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR10 (DUPLANE, vdup_lane,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR5 (COMBINE, vcombine, v8qi, v4hi, v2si, v2sf, di),
++  VAR5 (SPLIT, vget_high, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR5 (SPLIT, vget_low, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR3 (UNOP, vmovn, v8hi, v4si, v2di),
++  VAR3 (UNOP, vqmovn, v8hi, v4si, v2di),
++  VAR3 (UNOP, vqmovun, v8hi, v4si, v2di),
++  VAR3 (UNOP, vmovl, v8qi, v4hi, v2si),
++  VAR6 (LANEMUL, vmul_lane, v4hi, v2si, v2sf, v8hi, v4si, v4sf),
++  VAR6 (LANEMAC, vmla_lane, v4hi, v2si, v2sf, v8hi, v4si, v4sf),
++  VAR2 (LANEMAC, vmlal_lane, v4hi, v2si),
++  VAR2 (LANEMAC, vqdmlal_lane, v4hi, v2si),
++  VAR6 (LANEMAC, vmls_lane, v4hi, v2si, v2sf, v8hi, v4si, v4sf),
++  VAR2 (LANEMAC, vmlsl_lane, v4hi, v2si),
++  VAR2 (LANEMAC, vqdmlsl_lane, v4hi, v2si),
++  VAR6 (SCALARMUL, vmul_n, v4hi, v2si, v2sf, v8hi, v4si, v4sf),
++  VAR6 (SCALARMAC, vmla_n, v4hi, v2si, v2sf, v8hi, v4si, v4sf),
++  VAR2 (SCALARMAC, vmlal_n, v4hi, v2si),
++  VAR2 (SCALARMAC, vqdmlal_n, v4hi, v2si),
++  VAR6 (SCALARMAC, vmls_n, v4hi, v2si, v2sf, v8hi, v4si, v4sf),
++  VAR2 (SCALARMAC, vmlsl_n, v4hi, v2si),
++  VAR2 (SCALARMAC, vqdmlsl_n, v4hi, v2si),
++  VAR10 (BINOP, vext,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR8 (UNOP, vrev64, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR4 (UNOP, vrev32, v8qi, v4hi, v16qi, v8hi),
++  VAR2 (UNOP, vrev16, v8qi, v16qi),
++  VAR4 (CONVERT, vcvt, v2si, v2sf, v4si, v4sf),
++  VAR4 (FIXCONV, vcvt_n, v2si, v2sf, v4si, v4sf),
++  VAR10 (SELECT, vbsl,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR1 (VTBL, vtbl1, v8qi),
++  VAR1 (VTBL, vtbl2, v8qi),
++  VAR1 (VTBL, vtbl3, v8qi),
++  VAR1 (VTBL, vtbl4, v8qi),
++  VAR1 (VTBX, vtbx1, v8qi),
++  VAR1 (VTBX, vtbx2, v8qi),
++  VAR1 (VTBX, vtbx3, v8qi),
++  VAR1 (VTBX, vtbx4, v8qi),
++  VAR8 (RESULTPAIR, vtrn, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR8 (RESULTPAIR, vzip, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR8 (RESULTPAIR, vuzp, v8qi, v4hi, v2si, v2sf, v16qi, v8hi, v4si, v4sf),
++  VAR5 (REINTERP, vreinterpretv8qi, v8qi, v4hi, v2si, v2sf, di),
++  VAR5 (REINTERP, vreinterpretv4hi, v8qi, v4hi, v2si, v2sf, di),
++  VAR5 (REINTERP, vreinterpretv2si, v8qi, v4hi, v2si, v2sf, di),
++  VAR5 (REINTERP, vreinterpretv2sf, v8qi, v4hi, v2si, v2sf, di),
++  VAR5 (REINTERP, vreinterpretdi, v8qi, v4hi, v2si, v2sf, di),
++  VAR5 (REINTERP, vreinterpretv16qi, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR5 (REINTERP, vreinterpretv8hi, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR5 (REINTERP, vreinterpretv4si, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR5 (REINTERP, vreinterpretv4sf, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR5 (REINTERP, vreinterpretv2di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR10 (LOAD1, vld1,
++         v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR10 (LOAD1LANE, vld1_lane,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR10 (LOAD1, vld1_dup,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR10 (STORE1, vst1,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR10 (STORE1LANE, vst1_lane,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR9 (LOADSTRUCT,
++	vld2, v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf),
++  VAR7 (LOADSTRUCTLANE, vld2_lane,
++	v8qi, v4hi, v2si, v2sf, v8hi, v4si, v4sf),
++  VAR5 (LOADSTRUCT, vld2_dup, v8qi, v4hi, v2si, v2sf, di),
++  VAR9 (STORESTRUCT, vst2,
++	v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf),
++  VAR7 (STORESTRUCTLANE, vst2_lane,
++	v8qi, v4hi, v2si, v2sf, v8hi, v4si, v4sf),
++  VAR9 (LOADSTRUCT,
++	vld3, v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf),
++  VAR7 (LOADSTRUCTLANE, vld3_lane,
++	v8qi, v4hi, v2si, v2sf, v8hi, v4si, v4sf),
++  VAR5 (LOADSTRUCT, vld3_dup, v8qi, v4hi, v2si, v2sf, di),
++  VAR9 (STORESTRUCT, vst3,
++	v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf),
++  VAR7 (STORESTRUCTLANE, vst3_lane,
++	v8qi, v4hi, v2si, v2sf, v8hi, v4si, v4sf),
++  VAR9 (LOADSTRUCT, vld4,
++	v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf),
++  VAR7 (LOADSTRUCTLANE, vld4_lane,
++	v8qi, v4hi, v2si, v2sf, v8hi, v4si, v4sf),
++  VAR5 (LOADSTRUCT, vld4_dup, v8qi, v4hi, v2si, v2sf, di),
++  VAR9 (STORESTRUCT, vst4,
++	v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf),
++  VAR7 (STORESTRUCTLANE, vst4_lane,
++	v8qi, v4hi, v2si, v2sf, v8hi, v4si, v4sf),
++  VAR10 (LOGICBINOP, vand,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR10 (LOGICBINOP, vorr,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR10 (BINOP, veor,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR10 (LOGICBINOP, vbic,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di),
++  VAR10 (LOGICBINOP, vorn,
++	 v8qi, v4hi, v2si, v2sf, di, v16qi, v8hi, v4si, v4sf, v2di)
+ };
+ 
+ #undef CF
+@@ -18958,10 +18476,185 @@
+ #undef VAR9
+ #undef VAR10
+ 
++/* Neon defines builtins from ARM_BUILTIN_MAX upwards, though they don't have
++   symbolic names defined here (which would require too much duplication).
++   FIXME?  */
++enum arm_builtins
++{
++  ARM_BUILTIN_GETWCX,
++  ARM_BUILTIN_SETWCX,
++
++  ARM_BUILTIN_WZERO,
++
++  ARM_BUILTIN_WAVG2BR,
++  ARM_BUILTIN_WAVG2HR,
++  ARM_BUILTIN_WAVG2B,
++  ARM_BUILTIN_WAVG2H,
++
++  ARM_BUILTIN_WACCB,
++  ARM_BUILTIN_WACCH,
++  ARM_BUILTIN_WACCW,
++
++  ARM_BUILTIN_WMACS,
++  ARM_BUILTIN_WMACSZ,
++  ARM_BUILTIN_WMACU,
++  ARM_BUILTIN_WMACUZ,
++
++  ARM_BUILTIN_WSADB,
++  ARM_BUILTIN_WSADBZ,
++  ARM_BUILTIN_WSADH,
++  ARM_BUILTIN_WSADHZ,
++
++  ARM_BUILTIN_WALIGN,
++
++  ARM_BUILTIN_TMIA,
++  ARM_BUILTIN_TMIAPH,
++  ARM_BUILTIN_TMIABB,
++  ARM_BUILTIN_TMIABT,
++  ARM_BUILTIN_TMIATB,
++  ARM_BUILTIN_TMIATT,
++
++  ARM_BUILTIN_TMOVMSKB,
++  ARM_BUILTIN_TMOVMSKH,
++  ARM_BUILTIN_TMOVMSKW,
++
++  ARM_BUILTIN_TBCSTB,
++  ARM_BUILTIN_TBCSTH,
++  ARM_BUILTIN_TBCSTW,
++
++  ARM_BUILTIN_WMADDS,
++  ARM_BUILTIN_WMADDU,
++
++  ARM_BUILTIN_WPACKHSS,
++  ARM_BUILTIN_WPACKWSS,
++  ARM_BUILTIN_WPACKDSS,
++  ARM_BUILTIN_WPACKHUS,
++  ARM_BUILTIN_WPACKWUS,
++  ARM_BUILTIN_WPACKDUS,
++
++  ARM_BUILTIN_WADDB,
++  ARM_BUILTIN_WADDH,
++  ARM_BUILTIN_WADDW,
++  ARM_BUILTIN_WADDSSB,
++  ARM_BUILTIN_WADDSSH,
++  ARM_BUILTIN_WADDSSW,
++  ARM_BUILTIN_WADDUSB,
++  ARM_BUILTIN_WADDUSH,
++  ARM_BUILTIN_WADDUSW,
++  ARM_BUILTIN_WSUBB,
++  ARM_BUILTIN_WSUBH,
++  ARM_BUILTIN_WSUBW,
++  ARM_BUILTIN_WSUBSSB,
++  ARM_BUILTIN_WSUBSSH,
++  ARM_BUILTIN_WSUBSSW,
++  ARM_BUILTIN_WSUBUSB,
++  ARM_BUILTIN_WSUBUSH,
++  ARM_BUILTIN_WSUBUSW,
++
++  ARM_BUILTIN_WAND,
++  ARM_BUILTIN_WANDN,
++  ARM_BUILTIN_WOR,
++  ARM_BUILTIN_WXOR,
++
++  ARM_BUILTIN_WCMPEQB,
++  ARM_BUILTIN_WCMPEQH,
++  ARM_BUILTIN_WCMPEQW,
++  ARM_BUILTIN_WCMPGTUB,
++  ARM_BUILTIN_WCMPGTUH,
++  ARM_BUILTIN_WCMPGTUW,
++  ARM_BUILTIN_WCMPGTSB,
++  ARM_BUILTIN_WCMPGTSH,
++  ARM_BUILTIN_WCMPGTSW,
++
++  ARM_BUILTIN_TEXTRMSB,
++  ARM_BUILTIN_TEXTRMSH,
++  ARM_BUILTIN_TEXTRMSW,
++  ARM_BUILTIN_TEXTRMUB,
++  ARM_BUILTIN_TEXTRMUH,
++  ARM_BUILTIN_TEXTRMUW,
++  ARM_BUILTIN_TINSRB,
++  ARM_BUILTIN_TINSRH,
++  ARM_BUILTIN_TINSRW,
++
++  ARM_BUILTIN_WMAXSW,
++  ARM_BUILTIN_WMAXSH,
++  ARM_BUILTIN_WMAXSB,
++  ARM_BUILTIN_WMAXUW,
++  ARM_BUILTIN_WMAXUH,
++  ARM_BUILTIN_WMAXUB,
++  ARM_BUILTIN_WMINSW,
++  ARM_BUILTIN_WMINSH,
++  ARM_BUILTIN_WMINSB,
++  ARM_BUILTIN_WMINUW,
++  ARM_BUILTIN_WMINUH,
++  ARM_BUILTIN_WMINUB,
++
++  ARM_BUILTIN_WMULUM,
++  ARM_BUILTIN_WMULSM,
++  ARM_BUILTIN_WMULUL,
++
++  ARM_BUILTIN_PSADBH,
++  ARM_BUILTIN_WSHUFH,
++
++  ARM_BUILTIN_WSLLH,
++  ARM_BUILTIN_WSLLW,
++  ARM_BUILTIN_WSLLD,
++  ARM_BUILTIN_WSRAH,
++  ARM_BUILTIN_WSRAW,
++  ARM_BUILTIN_WSRAD,
++  ARM_BUILTIN_WSRLH,
++  ARM_BUILTIN_WSRLW,
++  ARM_BUILTIN_WSRLD,
++  ARM_BUILTIN_WRORH,
++  ARM_BUILTIN_WRORW,
++  ARM_BUILTIN_WRORD,
++  ARM_BUILTIN_WSLLHI,
++  ARM_BUILTIN_WSLLWI,
++  ARM_BUILTIN_WSLLDI,
++  ARM_BUILTIN_WSRAHI,
++  ARM_BUILTIN_WSRAWI,
++  ARM_BUILTIN_WSRADI,
++  ARM_BUILTIN_WSRLHI,
++  ARM_BUILTIN_WSRLWI,
++  ARM_BUILTIN_WSRLDI,
++  ARM_BUILTIN_WRORHI,
++  ARM_BUILTIN_WRORWI,
++  ARM_BUILTIN_WRORDI,
++
++  ARM_BUILTIN_WUNPCKIHB,
++  ARM_BUILTIN_WUNPCKIHH,
++  ARM_BUILTIN_WUNPCKIHW,
++  ARM_BUILTIN_WUNPCKILB,
++  ARM_BUILTIN_WUNPCKILH,
++  ARM_BUILTIN_WUNPCKILW,
++
++  ARM_BUILTIN_WUNPCKEHSB,
++  ARM_BUILTIN_WUNPCKEHSH,
++  ARM_BUILTIN_WUNPCKEHSW,
++  ARM_BUILTIN_WUNPCKEHUB,
++  ARM_BUILTIN_WUNPCKEHUH,
++  ARM_BUILTIN_WUNPCKEHUW,
++  ARM_BUILTIN_WUNPCKELSB,
++  ARM_BUILTIN_WUNPCKELSH,
++  ARM_BUILTIN_WUNPCKELSW,
++  ARM_BUILTIN_WUNPCKELUB,
++  ARM_BUILTIN_WUNPCKELUH,
++  ARM_BUILTIN_WUNPCKELUW,
++
++  ARM_BUILTIN_THREAD_POINTER,
++
++  ARM_BUILTIN_NEON_BASE,
++
++  ARM_BUILTIN_MAX = ARM_BUILTIN_NEON_BASE + ARRAY_SIZE (neon_builtin_data)
++};
++
++static GTY(()) tree arm_builtin_decls[ARM_BUILTIN_MAX];
++
+ static void
+ arm_init_neon_builtins (void)
+ {
+-  unsigned int i, fcode = ARM_BUILTIN_NEON_BASE;
++  unsigned int i, fcode;
++  tree decl;
+ 
+   tree neon_intQI_type_node;
+   tree neon_intHI_type_node;
+@@ -19209,250 +18902,740 @@
+         }
+     }
+ 
+-  for (i = 0; i < ARRAY_SIZE (neon_builtin_data); i++)
++  for (i = 0, fcode = ARM_BUILTIN_NEON_BASE;
++       i < ARRAY_SIZE (neon_builtin_data);
++       i++, fcode++)
+     {
+       neon_builtin_datum *d = &neon_builtin_data[i];
+-      unsigned int j, codeidx = 0;
+-
+-      d->base_fcode = fcode;
+-
+-      for (j = 0; j < T_MAX; j++)
+-	{
+-	  const char* const modenames[] = {
+-	    "v8qi", "v4hi", "v2si", "v2sf", "di",
+-	    "v16qi", "v8hi", "v4si", "v4sf", "v2di"
+-	  };
+-	  char namebuf[60];
+-	  tree ftype = NULL;
+-	  enum insn_code icode;
+-	  int is_load = 0, is_store = 0;
+-
+-          if ((d->bits & (1 << j)) == 0)
+-            continue;
+-
+-          icode = d->codes[codeidx++];
+-
+-          switch (d->itype)
+-            {
+-	    case NEON_LOAD1:
+-	    case NEON_LOAD1LANE:
+-	    case NEON_LOADSTRUCT:
+-	    case NEON_LOADSTRUCTLANE:
+-	      is_load = 1;
+-	      /* Fall through.  */
+-	    case NEON_STORE1:
+-	    case NEON_STORE1LANE:
+-	    case NEON_STORESTRUCT:
+-	    case NEON_STORESTRUCTLANE:
+-	      if (!is_load)
+-	        is_store = 1;
+-	      /* Fall through.  */
+-            case NEON_UNOP:
+-	    case NEON_BINOP:
+-	    case NEON_LOGICBINOP:
+-	    case NEON_SHIFTINSERT:
+-	    case NEON_TERNOP:
+-	    case NEON_GETLANE:
+-	    case NEON_SETLANE:
+-	    case NEON_CREATE:
+-	    case NEON_DUP:
+-	    case NEON_DUPLANE:
+-	    case NEON_SHIFTIMM:
+-	    case NEON_SHIFTACC:
+-	    case NEON_COMBINE:
+-	    case NEON_SPLIT:
+-	    case NEON_CONVERT:
+-	    case NEON_FIXCONV:
+-	    case NEON_LANEMUL:
+-	    case NEON_LANEMULL:
+-	    case NEON_LANEMULH:
+-	    case NEON_LANEMAC:
+-	    case NEON_SCALARMUL:
+-	    case NEON_SCALARMULL:
+-	    case NEON_SCALARMULH:
+-	    case NEON_SCALARMAC:
+-	    case NEON_SELECT:
+-	    case NEON_VTBL:
+-	    case NEON_VTBX:
+-	      {
+-		int k;
+-		tree return_type = void_type_node, args = void_list_node;
+-
+-		/* Build a function type directly from the insn_data for this
+-		   builtin.  The build_function_type() function takes care of
+-		   removing duplicates for us.  */
+-		for (k = insn_data[icode].n_operands - 1; k >= 0; k--)
+-		  {
+-		    tree eltype;
+-
+-		    if (is_load && k == 1)
+-		      {
+-		        /* Neon load patterns always have the memory operand
+-			   in the operand 1 position.  */
+-			gcc_assert (insn_data[icode].operand[k].predicate
+-				    == neon_struct_operand);
+-
+-			switch (1 << j)
+-			  {
+-			  case T_V8QI:
+-			  case T_V16QI:
+-			    eltype = const_intQI_pointer_node;
+-			    break;
+-
+-			  case T_V4HI:
+-			  case T_V8HI:
+-			    eltype = const_intHI_pointer_node;
+-			    break;
+-
+-			  case T_V2SI:
+-			  case T_V4SI:
+-			    eltype = const_intSI_pointer_node;
+-			    break;
+-
+-			  case T_V2SF:
+-			  case T_V4SF:
+-			    eltype = const_float_pointer_node;
+-			    break;
+-
+-			  case T_DI:
+-			  case T_V2DI:
+-			    eltype = const_intDI_pointer_node;
+-			    break;
+-
+-			  default: gcc_unreachable ();
+-			  }
+-  		      }
+-		    else if (is_store && k == 0)
+-		      {
+-		        /* Similarly, Neon store patterns use operand 0 as
+-			   the memory location to store to.  */
+-			gcc_assert (insn_data[icode].operand[k].predicate
+-				    == neon_struct_operand);
+-
+-			switch (1 << j)
+-			  {
+-			  case T_V8QI:
+-			  case T_V16QI:
+-			    eltype = intQI_pointer_node;
+-			    break;
+-
+-			  case T_V4HI:
+-			  case T_V8HI:
+-			    eltype = intHI_pointer_node;
+-			    break;
+-
+-			  case T_V2SI:
+-			  case T_V4SI:
+-			    eltype = intSI_pointer_node;
+-			    break;
+-
+-			  case T_V2SF:
+-			  case T_V4SF:
+-			    eltype = float_pointer_node;
+-			    break;
+-
+-			  case T_DI:
+-			  case T_V2DI:
+-			    eltype = intDI_pointer_node;
+-			    break;
+-
+-			  default: gcc_unreachable ();
+-			  }
+-		      }
+-		    else
+-		      {
+-			switch (insn_data[icode].operand[k].mode)
+-	        	  {
+-			  case VOIDmode: eltype = void_type_node; break;
+-			  /* Scalars.  */
+-			  case QImode: eltype = neon_intQI_type_node; break;
+-			  case HImode: eltype = neon_intHI_type_node; break;
+-			  case SImode: eltype = neon_intSI_type_node; break;
+-			  case SFmode: eltype = neon_float_type_node; break;
+-			  case DImode: eltype = neon_intDI_type_node; break;
+-			  case TImode: eltype = intTI_type_node; break;
+-			  case EImode: eltype = intEI_type_node; break;
+-			  case OImode: eltype = intOI_type_node; break;
+-			  case CImode: eltype = intCI_type_node; break;
+-			  case XImode: eltype = intXI_type_node; break;
+-			  /* 64-bit vectors.  */
+-			  case V8QImode: eltype = V8QI_type_node; break;
+-			  case V4HImode: eltype = V4HI_type_node; break;
+-			  case V2SImode: eltype = V2SI_type_node; break;
+-			  case V2SFmode: eltype = V2SF_type_node; break;
+-			  /* 128-bit vectors.  */
+-			  case V16QImode: eltype = V16QI_type_node; break;
+-			  case V8HImode: eltype = V8HI_type_node; break;
+-			  case V4SImode: eltype = V4SI_type_node; break;
+-			  case V4SFmode: eltype = V4SF_type_node; break;
+-			  case V2DImode: eltype = V2DI_type_node; break;
+-			  default: gcc_unreachable ();
+-			  }
+-		      }
+-
+-		    if (k == 0 && !is_store)
+-	              return_type = eltype;
+-		    else
+-		      args = tree_cons (NULL_TREE, eltype, args);
+-		  }
+-
+-		ftype = build_function_type (return_type, args);
+-	      }
+-	      break;
+-
+-	    case NEON_RESULTPAIR:
+-              {
+-                switch (insn_data[icode].operand[1].mode)
+-                  {
+-		  case V8QImode: ftype = void_ftype_pv8qi_v8qi_v8qi; break;
+-                  case V4HImode: ftype = void_ftype_pv4hi_v4hi_v4hi; break;
+-                  case V2SImode: ftype = void_ftype_pv2si_v2si_v2si; break;
+-                  case V2SFmode: ftype = void_ftype_pv2sf_v2sf_v2sf; break;
+-                  case DImode: ftype = void_ftype_pdi_di_di; break;
+-                  case V16QImode: ftype = void_ftype_pv16qi_v16qi_v16qi; break;
+-                  case V8HImode: ftype = void_ftype_pv8hi_v8hi_v8hi; break;
+-                  case V4SImode: ftype = void_ftype_pv4si_v4si_v4si; break;
+-                  case V4SFmode: ftype = void_ftype_pv4sf_v4sf_v4sf; break;
+-                  case V2DImode: ftype = void_ftype_pv2di_v2di_v2di; break;
+-                  default: gcc_unreachable ();
+-                  }
+-              }
+-              break;
+-
+-	    case NEON_REINTERP:
+-              {
+-                /* We iterate over 5 doubleword types, then 5 quadword
+-                   types.  */
+-                int rhs = j % 5;
+-                switch (insn_data[icode].operand[0].mode)
+-                  {
+-                  case V8QImode: ftype = reinterp_ftype_dreg[0][rhs]; break;
+-                  case V4HImode: ftype = reinterp_ftype_dreg[1][rhs]; break;
+-                  case V2SImode: ftype = reinterp_ftype_dreg[2][rhs]; break;
+-                  case V2SFmode: ftype = reinterp_ftype_dreg[3][rhs]; break;
+-                  case DImode: ftype = reinterp_ftype_dreg[4][rhs]; break;
+-                  case V16QImode: ftype = reinterp_ftype_qreg[0][rhs]; break;
+-                  case V8HImode: ftype = reinterp_ftype_qreg[1][rhs]; break;
+-                  case V4SImode: ftype = reinterp_ftype_qreg[2][rhs]; break;
+-		  case V4SFmode: ftype = reinterp_ftype_qreg[3][rhs]; break;
+-                  case V2DImode: ftype = reinterp_ftype_qreg[4][rhs]; break;
+-                  default: gcc_unreachable ();
+-                  }
+-              }
+-              break;
+-
+-            default:
+-              gcc_unreachable ();
+-            }
+-
+-          gcc_assert (ftype != NULL);
+-
+-          sprintf (namebuf, "__builtin_neon_%s%s", d->name, modenames[j]);
+-
+-          add_builtin_function (namebuf, ftype, fcode++, BUILT_IN_MD, NULL,
+-				NULL_TREE);
+-        }
+-    }
++
++      const char* const modenames[] = {
++	"v8qi", "v4hi", "v2si", "v2sf", "di",
++	"v16qi", "v8hi", "v4si", "v4sf", "v2di",
++	"ti", "ei", "oi"
++      };
++      char namebuf[60];
++      tree ftype = NULL;
++      int is_load = 0, is_store = 0;
++
++      gcc_assert (ARRAY_SIZE (modenames) == T_MAX);
++
++      d->fcode = fcode;
++
++      switch (d->itype)
++	{
++	case NEON_LOAD1:
++	case NEON_LOAD1LANE:
++	case NEON_LOADSTRUCT:
++	case NEON_LOADSTRUCTLANE:
++	  is_load = 1;
++	  /* Fall through.  */
++	case NEON_STORE1:
++	case NEON_STORE1LANE:
++	case NEON_STORESTRUCT:
++	case NEON_STORESTRUCTLANE:
++	  if (!is_load)
++	    is_store = 1;
++	  /* Fall through.  */
++	case NEON_UNOP:
++	case NEON_BINOP:
++	case NEON_LOGICBINOP:
++	case NEON_SHIFTINSERT:
++	case NEON_TERNOP:
++	case NEON_GETLANE:
++	case NEON_SETLANE:
++	case NEON_CREATE:
++	case NEON_DUP:
++	case NEON_DUPLANE:
++	case NEON_SHIFTIMM:
++	case NEON_SHIFTACC:
++	case NEON_COMBINE:
++	case NEON_SPLIT:
++	case NEON_CONVERT:
++	case NEON_FIXCONV:
++	case NEON_LANEMUL:
++	case NEON_LANEMULL:
++	case NEON_LANEMULH:
++	case NEON_LANEMAC:
++	case NEON_SCALARMUL:
++	case NEON_SCALARMULL:
++	case NEON_SCALARMULH:
++	case NEON_SCALARMAC:
++	case NEON_SELECT:
++	case NEON_VTBL:
++	case NEON_VTBX:
++	  {
++	    int k;
++	    tree return_type = void_type_node, args = void_list_node;
++
++	    /* Build a function type directly from the insn_data for
++	       this builtin.  The build_function_type() function takes
++	       care of removing duplicates for us.  */
++	    for (k = insn_data[d->code].n_operands - 1; k >= 0; k--)
++	      {
++		tree eltype;
++
++		if (is_load && k == 1)
++		  {
++		    /* Neon load patterns always have the memory
++		       operand in the operand 1 position.  */
++		    gcc_assert (insn_data[d->code].operand[k].predicate
++				== neon_struct_operand);
++
++		    switch (d->mode)
++		      {
++		      case T_V8QI:
++		      case T_V16QI:
++			eltype = const_intQI_pointer_node;
++			break;
++
++		      case T_V4HI:
++		      case T_V8HI:
++			eltype = const_intHI_pointer_node;
++			break;
++
++		      case T_V2SI:
++		      case T_V4SI:
++			eltype = const_intSI_pointer_node;
++			break;
++
++		      case T_V2SF:
++		      case T_V4SF:
++			eltype = const_float_pointer_node;
++			break;
++
++		      case T_DI:
++		      case T_V2DI:
++			eltype = const_intDI_pointer_node;
++			break;
++
++		      default: gcc_unreachable ();
++		      }
++		  }
++		else if (is_store && k == 0)
++		  {
++		    /* Similarly, Neon store patterns use operand 0 as
++		       the memory location to store to.  */
++		    gcc_assert (insn_data[d->code].operand[k].predicate
++				== neon_struct_operand);
++
++		    switch (d->mode)
++		      {
++		      case T_V8QI:
++		      case T_V16QI:
++			eltype = intQI_pointer_node;
++			break;
++
++		      case T_V4HI:
++		      case T_V8HI:
++			eltype = intHI_pointer_node;
++			break;
++
++		      case T_V2SI:
++		      case T_V4SI:
++			eltype = intSI_pointer_node;
++			break;
++
++		      case T_V2SF:
++		      case T_V4SF:
++			eltype = float_pointer_node;
++			break;
++
++		      case T_DI:
++		      case T_V2DI:
++			eltype = intDI_pointer_node;
++			break;
++
++		      default: gcc_unreachable ();
++		      }
++		  }
++		else
++		  {
++		    switch (insn_data[d->code].operand[k].mode)
++		      {
++		      case VOIDmode: eltype = void_type_node; break;
++			/* Scalars.  */
++		      case QImode: eltype = neon_intQI_type_node; break;
++		      case HImode: eltype = neon_intHI_type_node; break;
++		      case SImode: eltype = neon_intSI_type_node; break;
++		      case SFmode: eltype = neon_float_type_node; break;
++		      case DImode: eltype = neon_intDI_type_node; break;
++		      case TImode: eltype = intTI_type_node; break;
++		      case EImode: eltype = intEI_type_node; break;
++		      case OImode: eltype = intOI_type_node; break;
++		      case CImode: eltype = intCI_type_node; break;
++		      case XImode: eltype = intXI_type_node; break;
++			/* 64-bit vectors.  */
++		      case V8QImode: eltype = V8QI_type_node; break;
++		      case V4HImode: eltype = V4HI_type_node; break;
++		      case V2SImode: eltype = V2SI_type_node; break;
++		      case V2SFmode: eltype = V2SF_type_node; break;
++			/* 128-bit vectors.  */
++		      case V16QImode: eltype = V16QI_type_node; break;
++		      case V8HImode: eltype = V8HI_type_node; break;
++		      case V4SImode: eltype = V4SI_type_node; break;
++		      case V4SFmode: eltype = V4SF_type_node; break;
++		      case V2DImode: eltype = V2DI_type_node; break;
++		      default: gcc_unreachable ();
++		      }
++		  }
++
++		if (k == 0 && !is_store)
++		  return_type = eltype;
++		else
++		  args = tree_cons (NULL_TREE, eltype, args);
++	      }
++
++	    ftype = build_function_type (return_type, args);
++	  }
++	  break;
++
++	case NEON_RESULTPAIR:
++	  {
++	    switch (insn_data[d->code].operand[1].mode)
++	      {
++	      case V8QImode: ftype = void_ftype_pv8qi_v8qi_v8qi; break;
++	      case V4HImode: ftype = void_ftype_pv4hi_v4hi_v4hi; break;
++	      case V2SImode: ftype = void_ftype_pv2si_v2si_v2si; break;
++	      case V2SFmode: ftype = void_ftype_pv2sf_v2sf_v2sf; break;
++	      case DImode: ftype = void_ftype_pdi_di_di; break;
++	      case V16QImode: ftype = void_ftype_pv16qi_v16qi_v16qi; break;
++	      case V8HImode: ftype = void_ftype_pv8hi_v8hi_v8hi; break;
++	      case V4SImode: ftype = void_ftype_pv4si_v4si_v4si; break;
++	      case V4SFmode: ftype = void_ftype_pv4sf_v4sf_v4sf; break;
++	      case V2DImode: ftype = void_ftype_pv2di_v2di_v2di; break;
++	      default: gcc_unreachable ();
++	      }
++	  }
++	  break;
++
++	case NEON_REINTERP:
++	  {
++	    /* We iterate over 5 doubleword types, then 5 quadword
++	       types.  */
++	    int rhs = d->mode % 5;
++	    switch (insn_data[d->code].operand[0].mode)
++	      {
++	      case V8QImode: ftype = reinterp_ftype_dreg[0][rhs]; break;
++	      case V4HImode: ftype = reinterp_ftype_dreg[1][rhs]; break;
++	      case V2SImode: ftype = reinterp_ftype_dreg[2][rhs]; break;
++	      case V2SFmode: ftype = reinterp_ftype_dreg[3][rhs]; break;
++	      case DImode: ftype = reinterp_ftype_dreg[4][rhs]; break;
++	      case V16QImode: ftype = reinterp_ftype_qreg[0][rhs]; break;
++	      case V8HImode: ftype = reinterp_ftype_qreg[1][rhs]; break;
++	      case V4SImode: ftype = reinterp_ftype_qreg[2][rhs]; break;
++	      case V4SFmode: ftype = reinterp_ftype_qreg[3][rhs]; break;
++	      case V2DImode: ftype = reinterp_ftype_qreg[4][rhs]; break;
++	      default: gcc_unreachable ();
++	      }
++	  }
++	  break;
++
++	default:
++	  gcc_unreachable ();
++	}
++
++      gcc_assert (ftype != NULL);
++
++      sprintf (namebuf, "__builtin_neon_%s%s", d->name, modenames[d->mode]);
++
++      decl = add_builtin_function (namebuf, ftype, fcode, BUILT_IN_MD, NULL,
++				   NULL_TREE);
++      arm_builtin_decls[fcode] = decl;
++    }
++}
++
++#define def_mbuiltin(MASK, NAME, TYPE, CODE)				\
++  do									\
++    {									\
++      if ((MASK) & insn_flags)						\
++	{								\
++	  tree bdecl;							\
++	  bdecl = add_builtin_function ((NAME), (TYPE), (CODE),		\
++					BUILT_IN_MD, NULL, NULL_TREE);	\
++	  arm_builtin_decls[CODE] = bdecl;				\
++	}								\
++    }									\
++  while (0)
++  
++struct builtin_description
++{
++  const unsigned int       mask;
++  const enum insn_code     icode;
++  const char * const       name;
++  const enum arm_builtins  code;
++  const enum rtx_code      comparison;
++  const unsigned int       flag;
++};
++  
++static const struct builtin_description bdesc_2arg[] =
++{
++#define IWMMXT_BUILTIN(code, string, builtin) \
++  { FL_IWMMXT, CODE_FOR_##code, "__builtin_arm_" string, \
++    ARM_BUILTIN_##builtin, UNKNOWN, 0 },
++  
++  IWMMXT_BUILTIN (addv8qi3, "waddb", WADDB)
++  IWMMXT_BUILTIN (addv4hi3, "waddh", WADDH)
++  IWMMXT_BUILTIN (addv2si3, "waddw", WADDW)
++  IWMMXT_BUILTIN (subv8qi3, "wsubb", WSUBB)
++  IWMMXT_BUILTIN (subv4hi3, "wsubh", WSUBH)
++  IWMMXT_BUILTIN (subv2si3, "wsubw", WSUBW)
++  IWMMXT_BUILTIN (ssaddv8qi3, "waddbss", WADDSSB)
++  IWMMXT_BUILTIN (ssaddv4hi3, "waddhss", WADDSSH)
++  IWMMXT_BUILTIN (ssaddv2si3, "waddwss", WADDSSW)
++  IWMMXT_BUILTIN (sssubv8qi3, "wsubbss", WSUBSSB)
++  IWMMXT_BUILTIN (sssubv4hi3, "wsubhss", WSUBSSH)
++  IWMMXT_BUILTIN (sssubv2si3, "wsubwss", WSUBSSW)
++  IWMMXT_BUILTIN (usaddv8qi3, "waddbus", WADDUSB)
++  IWMMXT_BUILTIN (usaddv4hi3, "waddhus", WADDUSH)
++  IWMMXT_BUILTIN (usaddv2si3, "waddwus", WADDUSW)
++  IWMMXT_BUILTIN (ussubv8qi3, "wsubbus", WSUBUSB)
++  IWMMXT_BUILTIN (ussubv4hi3, "wsubhus", WSUBUSH)
++  IWMMXT_BUILTIN (ussubv2si3, "wsubwus", WSUBUSW)
++  IWMMXT_BUILTIN (mulv4hi3, "wmulul", WMULUL)
++  IWMMXT_BUILTIN (smulv4hi3_highpart, "wmulsm", WMULSM)
++  IWMMXT_BUILTIN (umulv4hi3_highpart, "wmulum", WMULUM)
++  IWMMXT_BUILTIN (eqv8qi3, "wcmpeqb", WCMPEQB)
++  IWMMXT_BUILTIN (eqv4hi3, "wcmpeqh", WCMPEQH)
++  IWMMXT_BUILTIN (eqv2si3, "wcmpeqw", WCMPEQW)
++  IWMMXT_BUILTIN (gtuv8qi3, "wcmpgtub", WCMPGTUB)
++  IWMMXT_BUILTIN (gtuv4hi3, "wcmpgtuh", WCMPGTUH)
++  IWMMXT_BUILTIN (gtuv2si3, "wcmpgtuw", WCMPGTUW)
++  IWMMXT_BUILTIN (gtv8qi3, "wcmpgtsb", WCMPGTSB)
++  IWMMXT_BUILTIN (gtv4hi3, "wcmpgtsh", WCMPGTSH)
++  IWMMXT_BUILTIN (gtv2si3, "wcmpgtsw", WCMPGTSW)
++  IWMMXT_BUILTIN (umaxv8qi3, "wmaxub", WMAXUB)
++  IWMMXT_BUILTIN (smaxv8qi3, "wmaxsb", WMAXSB)
++  IWMMXT_BUILTIN (umaxv4hi3, "wmaxuh", WMAXUH)
++  IWMMXT_BUILTIN (smaxv4hi3, "wmaxsh", WMAXSH)
++  IWMMXT_BUILTIN (umaxv2si3, "wmaxuw", WMAXUW)
++  IWMMXT_BUILTIN (smaxv2si3, "wmaxsw", WMAXSW)
++  IWMMXT_BUILTIN (uminv8qi3, "wminub", WMINUB)
++  IWMMXT_BUILTIN (sminv8qi3, "wminsb", WMINSB)
++  IWMMXT_BUILTIN (uminv4hi3, "wminuh", WMINUH)
++  IWMMXT_BUILTIN (sminv4hi3, "wminsh", WMINSH)
++  IWMMXT_BUILTIN (uminv2si3, "wminuw", WMINUW)
++  IWMMXT_BUILTIN (sminv2si3, "wminsw", WMINSW)
++  IWMMXT_BUILTIN (iwmmxt_anddi3, "wand", WAND)
++  IWMMXT_BUILTIN (iwmmxt_nanddi3, "wandn", WANDN)
++  IWMMXT_BUILTIN (iwmmxt_iordi3, "wor", WOR)
++  IWMMXT_BUILTIN (iwmmxt_xordi3, "wxor", WXOR)
++  IWMMXT_BUILTIN (iwmmxt_uavgv8qi3, "wavg2b", WAVG2B)
++  IWMMXT_BUILTIN (iwmmxt_uavgv4hi3, "wavg2h", WAVG2H)
++  IWMMXT_BUILTIN (iwmmxt_uavgrndv8qi3, "wavg2br", WAVG2BR)
++  IWMMXT_BUILTIN (iwmmxt_uavgrndv4hi3, "wavg2hr", WAVG2HR)
++  IWMMXT_BUILTIN (iwmmxt_wunpckilb, "wunpckilb", WUNPCKILB)
++  IWMMXT_BUILTIN (iwmmxt_wunpckilh, "wunpckilh", WUNPCKILH)
++  IWMMXT_BUILTIN (iwmmxt_wunpckilw, "wunpckilw", WUNPCKILW)
++  IWMMXT_BUILTIN (iwmmxt_wunpckihb, "wunpckihb", WUNPCKIHB)
++  IWMMXT_BUILTIN (iwmmxt_wunpckihh, "wunpckihh", WUNPCKIHH)
++  IWMMXT_BUILTIN (iwmmxt_wunpckihw, "wunpckihw", WUNPCKIHW)
++  IWMMXT_BUILTIN (iwmmxt_wmadds, "wmadds", WMADDS)
++  IWMMXT_BUILTIN (iwmmxt_wmaddu, "wmaddu", WMADDU)
++  
++#define IWMMXT_BUILTIN2(code, builtin) \
++  { FL_IWMMXT, CODE_FOR_##code, NULL, ARM_BUILTIN_##builtin, UNKNOWN, 0 },
++  
++  IWMMXT_BUILTIN2 (iwmmxt_wpackhss, WPACKHSS)
++  IWMMXT_BUILTIN2 (iwmmxt_wpackwss, WPACKWSS)
++  IWMMXT_BUILTIN2 (iwmmxt_wpackdss, WPACKDSS)
++  IWMMXT_BUILTIN2 (iwmmxt_wpackhus, WPACKHUS)
++  IWMMXT_BUILTIN2 (iwmmxt_wpackwus, WPACKWUS)
++  IWMMXT_BUILTIN2 (iwmmxt_wpackdus, WPACKDUS)
++  IWMMXT_BUILTIN2 (ashlv4hi3_di,    WSLLH)
++  IWMMXT_BUILTIN2 (ashlv4hi3_iwmmxt, WSLLHI)
++  IWMMXT_BUILTIN2 (ashlv2si3_di,    WSLLW)
++  IWMMXT_BUILTIN2 (ashlv2si3_iwmmxt, WSLLWI)
++  IWMMXT_BUILTIN2 (ashldi3_di,      WSLLD)
++  IWMMXT_BUILTIN2 (ashldi3_iwmmxt,  WSLLDI)
++  IWMMXT_BUILTIN2 (lshrv4hi3_di,    WSRLH)
++  IWMMXT_BUILTIN2 (lshrv4hi3_iwmmxt, WSRLHI)
++  IWMMXT_BUILTIN2 (lshrv2si3_di,    WSRLW)
++  IWMMXT_BUILTIN2 (lshrv2si3_iwmmxt, WSRLWI)
++  IWMMXT_BUILTIN2 (lshrdi3_di,      WSRLD)
++  IWMMXT_BUILTIN2 (lshrdi3_iwmmxt,  WSRLDI)
++  IWMMXT_BUILTIN2 (ashrv4hi3_di,    WSRAH)
++  IWMMXT_BUILTIN2 (ashrv4hi3_iwmmxt, WSRAHI)
++  IWMMXT_BUILTIN2 (ashrv2si3_di,    WSRAW)
++  IWMMXT_BUILTIN2 (ashrv2si3_iwmmxt, WSRAWI)
++  IWMMXT_BUILTIN2 (ashrdi3_di,      WSRAD)
++  IWMMXT_BUILTIN2 (ashrdi3_iwmmxt,  WSRADI)
++  IWMMXT_BUILTIN2 (rorv4hi3_di,     WRORH)
++  IWMMXT_BUILTIN2 (rorv4hi3,        WRORHI)
++  IWMMXT_BUILTIN2 (rorv2si3_di,     WRORW)
++  IWMMXT_BUILTIN2 (rorv2si3,        WRORWI)
++  IWMMXT_BUILTIN2 (rordi3_di,       WRORD)
++  IWMMXT_BUILTIN2 (rordi3,          WRORDI)
++  IWMMXT_BUILTIN2 (iwmmxt_wmacuz,   WMACUZ)
++  IWMMXT_BUILTIN2 (iwmmxt_wmacsz,   WMACSZ)
++};
++  
++static const struct builtin_description bdesc_1arg[] =
++{
++  IWMMXT_BUILTIN (iwmmxt_tmovmskb, "tmovmskb", TMOVMSKB)
++  IWMMXT_BUILTIN (iwmmxt_tmovmskh, "tmovmskh", TMOVMSKH)
++  IWMMXT_BUILTIN (iwmmxt_tmovmskw, "tmovmskw", TMOVMSKW)
++  IWMMXT_BUILTIN (iwmmxt_waccb, "waccb", WACCB)
++  IWMMXT_BUILTIN (iwmmxt_wacch, "wacch", WACCH)
++  IWMMXT_BUILTIN (iwmmxt_waccw, "waccw", WACCW)
++  IWMMXT_BUILTIN (iwmmxt_wunpckehub, "wunpckehub", WUNPCKEHUB)
++  IWMMXT_BUILTIN (iwmmxt_wunpckehuh, "wunpckehuh", WUNPCKEHUH)
++  IWMMXT_BUILTIN (iwmmxt_wunpckehuw, "wunpckehuw", WUNPCKEHUW)
++  IWMMXT_BUILTIN (iwmmxt_wunpckehsb, "wunpckehsb", WUNPCKEHSB)
++  IWMMXT_BUILTIN (iwmmxt_wunpckehsh, "wunpckehsh", WUNPCKEHSH)
++  IWMMXT_BUILTIN (iwmmxt_wunpckehsw, "wunpckehsw", WUNPCKEHSW)
++  IWMMXT_BUILTIN (iwmmxt_wunpckelub, "wunpckelub", WUNPCKELUB)
++  IWMMXT_BUILTIN (iwmmxt_wunpckeluh, "wunpckeluh", WUNPCKELUH)
++  IWMMXT_BUILTIN (iwmmxt_wunpckeluw, "wunpckeluw", WUNPCKELUW)
++  IWMMXT_BUILTIN (iwmmxt_wunpckelsb, "wunpckelsb", WUNPCKELSB)
++  IWMMXT_BUILTIN (iwmmxt_wunpckelsh, "wunpckelsh", WUNPCKELSH)
++  IWMMXT_BUILTIN (iwmmxt_wunpckelsw, "wunpckelsw", WUNPCKELSW)
++};
++  
++/* Set up all the iWMMXt builtins.  This is not called if
++   TARGET_IWMMXT is zero.  */
++
++static void
++arm_init_iwmmxt_builtins (void)
++{
++  const struct builtin_description * d;
++  size_t i;
++  tree endlink = void_list_node;
++
++  tree V2SI_type_node = build_vector_type_for_mode (intSI_type_node, V2SImode);
++  tree V4HI_type_node = build_vector_type_for_mode (intHI_type_node, V4HImode);
++  tree V8QI_type_node = build_vector_type_for_mode (intQI_type_node, V8QImode);
++
++  tree int_ftype_int
++    = build_function_type (integer_type_node,
++			   tree_cons (NULL_TREE, integer_type_node, endlink));
++  tree v8qi_ftype_v8qi_v8qi_int
++    = build_function_type (V8QI_type_node,
++			   tree_cons (NULL_TREE, V8QI_type_node,
++				      tree_cons (NULL_TREE, V8QI_type_node,
++						 tree_cons (NULL_TREE,
++							    integer_type_node,
++							    endlink))));
++  tree v4hi_ftype_v4hi_int
++    = build_function_type (V4HI_type_node,
++			   tree_cons (NULL_TREE, V4HI_type_node,
++				      tree_cons (NULL_TREE, integer_type_node,
++						 endlink)));
++  tree v2si_ftype_v2si_int
++    = build_function_type (V2SI_type_node,
++			   tree_cons (NULL_TREE, V2SI_type_node,
++				      tree_cons (NULL_TREE, integer_type_node,
++						 endlink)));
++  tree v2si_ftype_di_di
++    = build_function_type (V2SI_type_node,
++			   tree_cons (NULL_TREE, long_long_integer_type_node,
++				      tree_cons (NULL_TREE,
++						 long_long_integer_type_node,
++						 endlink)));
++  tree di_ftype_di_int
++    = build_function_type (long_long_integer_type_node,
++			   tree_cons (NULL_TREE, long_long_integer_type_node,
++				      tree_cons (NULL_TREE, integer_type_node,
++						 endlink)));
++  tree di_ftype_di_int_int
++    = build_function_type (long_long_integer_type_node,
++			   tree_cons (NULL_TREE, long_long_integer_type_node,
++				      tree_cons (NULL_TREE, integer_type_node,
++						 tree_cons (NULL_TREE,
++							    integer_type_node,
++							    endlink))));
++  tree int_ftype_v8qi
++    = build_function_type (integer_type_node,
++			   tree_cons (NULL_TREE, V8QI_type_node,
++				      endlink));
++  tree int_ftype_v4hi
++    = build_function_type (integer_type_node,
++			   tree_cons (NULL_TREE, V4HI_type_node,
++				      endlink));
++  tree int_ftype_v2si
++    = build_function_type (integer_type_node,
++			   tree_cons (NULL_TREE, V2SI_type_node,
++				      endlink));
++  tree int_ftype_v8qi_int
++    = build_function_type (integer_type_node,
++			   tree_cons (NULL_TREE, V8QI_type_node,
++				      tree_cons (NULL_TREE, integer_type_node,
++						 endlink)));
++  tree int_ftype_v4hi_int
++    = build_function_type (integer_type_node,
++			   tree_cons (NULL_TREE, V4HI_type_node,
++				      tree_cons (NULL_TREE, integer_type_node,
++						 endlink)));
++  tree int_ftype_v2si_int
++    = build_function_type (integer_type_node,
++			   tree_cons (NULL_TREE, V2SI_type_node,
++				      tree_cons (NULL_TREE, integer_type_node,
++						 endlink)));
++  tree v8qi_ftype_v8qi_int_int
++    = build_function_type (V8QI_type_node,
++			   tree_cons (NULL_TREE, V8QI_type_node,
++				      tree_cons (NULL_TREE, integer_type_node,
++						 tree_cons (NULL_TREE,
++							    integer_type_node,
++							    endlink))));
++  tree v4hi_ftype_v4hi_int_int
++    = build_function_type (V4HI_type_node,
++			   tree_cons (NULL_TREE, V4HI_type_node,
++				      tree_cons (NULL_TREE, integer_type_node,
++						 tree_cons (NULL_TREE,
++							    integer_type_node,
++							    endlink))));
++  tree v2si_ftype_v2si_int_int
++    = build_function_type (V2SI_type_node,
++			   tree_cons (NULL_TREE, V2SI_type_node,
++				      tree_cons (NULL_TREE, integer_type_node,
++						 tree_cons (NULL_TREE,
++							    integer_type_node,
++							    endlink))));
++  /* Miscellaneous.  */
++  tree v8qi_ftype_v4hi_v4hi
++    = build_function_type (V8QI_type_node,
++			   tree_cons (NULL_TREE, V4HI_type_node,
++				      tree_cons (NULL_TREE, V4HI_type_node,
++						 endlink)));
++  tree v4hi_ftype_v2si_v2si
++    = build_function_type (V4HI_type_node,
++			   tree_cons (NULL_TREE, V2SI_type_node,
++				      tree_cons (NULL_TREE, V2SI_type_node,
++						 endlink)));
++  tree v2si_ftype_v4hi_v4hi
++    = build_function_type (V2SI_type_node,
++			   tree_cons (NULL_TREE, V4HI_type_node,
++				      tree_cons (NULL_TREE, V4HI_type_node,
++						 endlink)));
++  tree v2si_ftype_v8qi_v8qi
++    = build_function_type (V2SI_type_node,
++			   tree_cons (NULL_TREE, V8QI_type_node,
++				      tree_cons (NULL_TREE, V8QI_type_node,
++						 endlink)));
++  tree v4hi_ftype_v4hi_di
++    = build_function_type (V4HI_type_node,
++			   tree_cons (NULL_TREE, V4HI_type_node,
++				      tree_cons (NULL_TREE,
++						 long_long_integer_type_node,
++						 endlink)));
++  tree v2si_ftype_v2si_di
++    = build_function_type (V2SI_type_node,
++			   tree_cons (NULL_TREE, V2SI_type_node,
++				      tree_cons (NULL_TREE,
++						 long_long_integer_type_node,
++						 endlink)));
++  tree void_ftype_int_int
++    = build_function_type (void_type_node,
++			   tree_cons (NULL_TREE, integer_type_node,
++				      tree_cons (NULL_TREE, integer_type_node,
++						 endlink)));
++  tree di_ftype_void
++    = build_function_type (long_long_unsigned_type_node, endlink);
++  tree di_ftype_v8qi
++    = build_function_type (long_long_integer_type_node,
++			   tree_cons (NULL_TREE, V8QI_type_node,
++				      endlink));
++  tree di_ftype_v4hi
++    = build_function_type (long_long_integer_type_node,
++			   tree_cons (NULL_TREE, V4HI_type_node,
++				      endlink));
++  tree di_ftype_v2si
++    = build_function_type (long_long_integer_type_node,
++			   tree_cons (NULL_TREE, V2SI_type_node,
++				      endlink));
++  tree v2si_ftype_v4hi
++    = build_function_type (V2SI_type_node,
++			   tree_cons (NULL_TREE, V4HI_type_node,
++				      endlink));
++  tree v4hi_ftype_v8qi
++    = build_function_type (V4HI_type_node,
++			   tree_cons (NULL_TREE, V8QI_type_node,
++				      endlink));
++
++  tree di_ftype_di_v4hi_v4hi
++    = build_function_type (long_long_unsigned_type_node,
++			   tree_cons (NULL_TREE,
++				      long_long_unsigned_type_node,
++				      tree_cons (NULL_TREE, V4HI_type_node,
++						 tree_cons (NULL_TREE,
++							    V4HI_type_node,
++							    endlink))));
++
++  tree di_ftype_v4hi_v4hi
++    = build_function_type (long_long_unsigned_type_node,
++			   tree_cons (NULL_TREE, V4HI_type_node,
++				      tree_cons (NULL_TREE, V4HI_type_node,
++						 endlink)));
++  
++  /* Normal vector binops.  */
++  tree v8qi_ftype_v8qi_v8qi
++    = build_function_type (V8QI_type_node,
++			   tree_cons (NULL_TREE, V8QI_type_node,
++				      tree_cons (NULL_TREE, V8QI_type_node,
++						 endlink)));
++  tree v4hi_ftype_v4hi_v4hi
++    = build_function_type (V4HI_type_node,
++			   tree_cons (NULL_TREE, V4HI_type_node,
++				      tree_cons (NULL_TREE, V4HI_type_node,
++						 endlink)));
++  tree v2si_ftype_v2si_v2si
++    = build_function_type (V2SI_type_node,
++			   tree_cons (NULL_TREE, V2SI_type_node,
++				      tree_cons (NULL_TREE, V2SI_type_node,
++						 endlink)));
++  tree di_ftype_di_di
++    = build_function_type (long_long_unsigned_type_node,
++			   tree_cons (NULL_TREE, long_long_unsigned_type_node,
++				      tree_cons (NULL_TREE,
++						 long_long_unsigned_type_node,
++						 endlink)));
++  
++  /* Add all builtins that are more or less simple operations on two
++     operands.  */
++  for (i = 0, d = bdesc_2arg; i < ARRAY_SIZE (bdesc_2arg); i++, d++)
++    {
++      /* Use one of the operands; the target can have a different mode for
++	 mask-generating compares.  */
++      enum machine_mode mode;
++      tree type;
++
++      if (d->name == 0)
++	continue;
++
++      mode = insn_data[d->icode].operand[1].mode;
++
++      switch (mode)
++	{
++	case V8QImode:
++	  type = v8qi_ftype_v8qi_v8qi;
++	  break;
++	case V4HImode:
++	  type = v4hi_ftype_v4hi_v4hi;
++	  break;
++	case V2SImode:
++	  type = v2si_ftype_v2si_v2si;
++	  break;
++	case DImode:
++	  type = di_ftype_di_di;
++	  break;
++
++	default:
++	  gcc_unreachable ();
++	}
++
++      def_mbuiltin (d->mask, d->name, type, d->code);
++    }
++
++  /* Add the remaining MMX insns with somewhat more complicated types.  */
++#define iwmmx_mbuiltin(NAME, TYPE, CODE)			\
++  def_mbuiltin (FL_IWMMXT, "__builtin_arm_" NAME, (TYPE),	\
++		ARM_BUILTIN_ ## CODE)
++
++  iwmmx_mbuiltin ("wzero", di_ftype_void, WZERO);
++  iwmmx_mbuiltin ("setwcx", void_ftype_int_int, SETWCX);
++  iwmmx_mbuiltin ("getwcx", int_ftype_int, GETWCX);
++
++  iwmmx_mbuiltin ("wsllh", v4hi_ftype_v4hi_di, WSLLH);
++  iwmmx_mbuiltin ("wsllw", v2si_ftype_v2si_di, WSLLW);
++  iwmmx_mbuiltin ("wslld", di_ftype_di_di, WSLLD);
++  iwmmx_mbuiltin ("wsllhi", v4hi_ftype_v4hi_int, WSLLHI);
++  iwmmx_mbuiltin ("wsllwi", v2si_ftype_v2si_int, WSLLWI);
++  iwmmx_mbuiltin ("wslldi", di_ftype_di_int, WSLLDI);
++
++  iwmmx_mbuiltin ("wsrlh", v4hi_ftype_v4hi_di, WSRLH);
++  iwmmx_mbuiltin ("wsrlw", v2si_ftype_v2si_di, WSRLW);
++  iwmmx_mbuiltin ("wsrld", di_ftype_di_di, WSRLD);
++  iwmmx_mbuiltin ("wsrlhi", v4hi_ftype_v4hi_int, WSRLHI);
++  iwmmx_mbuiltin ("wsrlwi", v2si_ftype_v2si_int, WSRLWI);
++  iwmmx_mbuiltin ("wsrldi", di_ftype_di_int, WSRLDI);
++
++  iwmmx_mbuiltin ("wsrah", v4hi_ftype_v4hi_di, WSRAH);
++  iwmmx_mbuiltin ("wsraw", v2si_ftype_v2si_di, WSRAW);
++  iwmmx_mbuiltin ("wsrad", di_ftype_di_di, WSRAD);
++  iwmmx_mbuiltin ("wsrahi", v4hi_ftype_v4hi_int, WSRAHI);
++  iwmmx_mbuiltin ("wsrawi", v2si_ftype_v2si_int, WSRAWI);
++  iwmmx_mbuiltin ("wsradi", di_ftype_di_int, WSRADI);
++
++  iwmmx_mbuiltin ("wrorh", v4hi_ftype_v4hi_di, WRORH);
++  iwmmx_mbuiltin ("wrorw", v2si_ftype_v2si_di, WRORW);
++  iwmmx_mbuiltin ("wrord", di_ftype_di_di, WRORD);
++  iwmmx_mbuiltin ("wrorhi", v4hi_ftype_v4hi_int, WRORHI);
++  iwmmx_mbuiltin ("wrorwi", v2si_ftype_v2si_int, WRORWI);
++  iwmmx_mbuiltin ("wrordi", di_ftype_di_int, WRORDI);
++
++  iwmmx_mbuiltin ("wshufh", v4hi_ftype_v4hi_int, WSHUFH);
++
++  iwmmx_mbuiltin ("wsadb", v2si_ftype_v8qi_v8qi, WSADB);
++  iwmmx_mbuiltin ("wsadh", v2si_ftype_v4hi_v4hi, WSADH);
++  iwmmx_mbuiltin ("wsadbz", v2si_ftype_v8qi_v8qi, WSADBZ);
++  iwmmx_mbuiltin ("wsadhz", v2si_ftype_v4hi_v4hi, WSADHZ);
++
++  iwmmx_mbuiltin ("textrmsb", int_ftype_v8qi_int, TEXTRMSB);
++  iwmmx_mbuiltin ("textrmsh", int_ftype_v4hi_int, TEXTRMSH);
++  iwmmx_mbuiltin ("textrmsw", int_ftype_v2si_int, TEXTRMSW);
++  iwmmx_mbuiltin ("textrmub", int_ftype_v8qi_int, TEXTRMUB);
++  iwmmx_mbuiltin ("textrmuh", int_ftype_v4hi_int, TEXTRMUH);
++  iwmmx_mbuiltin ("textrmuw", int_ftype_v2si_int, TEXTRMUW);
++  iwmmx_mbuiltin ("tinsrb", v8qi_ftype_v8qi_int_int, TINSRB);
++  iwmmx_mbuiltin ("tinsrh", v4hi_ftype_v4hi_int_int, TINSRH);
++  iwmmx_mbuiltin ("tinsrw", v2si_ftype_v2si_int_int, TINSRW);
++
++  iwmmx_mbuiltin ("waccb", di_ftype_v8qi, WACCB);
++  iwmmx_mbuiltin ("wacch", di_ftype_v4hi, WACCH);
++  iwmmx_mbuiltin ("waccw", di_ftype_v2si, WACCW);
++
++  iwmmx_mbuiltin ("tmovmskb", int_ftype_v8qi, TMOVMSKB);
++  iwmmx_mbuiltin ("tmovmskh", int_ftype_v4hi, TMOVMSKH);
++  iwmmx_mbuiltin ("tmovmskw", int_ftype_v2si, TMOVMSKW);
++
++  iwmmx_mbuiltin ("wpackhss", v8qi_ftype_v4hi_v4hi, WPACKHSS);
++  iwmmx_mbuiltin ("wpackhus", v8qi_ftype_v4hi_v4hi, WPACKHUS);
++  iwmmx_mbuiltin ("wpackwus", v4hi_ftype_v2si_v2si, WPACKWUS);
++  iwmmx_mbuiltin ("wpackwss", v4hi_ftype_v2si_v2si, WPACKWSS);
++  iwmmx_mbuiltin ("wpackdus", v2si_ftype_di_di, WPACKDUS);
++  iwmmx_mbuiltin ("wpackdss", v2si_ftype_di_di, WPACKDSS);
++
++  iwmmx_mbuiltin ("wunpckehub", v4hi_ftype_v8qi, WUNPCKEHUB);
++  iwmmx_mbuiltin ("wunpckehuh", v2si_ftype_v4hi, WUNPCKEHUH);
++  iwmmx_mbuiltin ("wunpckehuw", di_ftype_v2si, WUNPCKEHUW);
++  iwmmx_mbuiltin ("wunpckehsb", v4hi_ftype_v8qi, WUNPCKEHSB);
++  iwmmx_mbuiltin ("wunpckehsh", v2si_ftype_v4hi, WUNPCKEHSH);
++  iwmmx_mbuiltin ("wunpckehsw", di_ftype_v2si, WUNPCKEHSW);
++  iwmmx_mbuiltin ("wunpckelub", v4hi_ftype_v8qi, WUNPCKELUB);
++  iwmmx_mbuiltin ("wunpckeluh", v2si_ftype_v4hi, WUNPCKELUH);
++  iwmmx_mbuiltin ("wunpckeluw", di_ftype_v2si, WUNPCKELUW);
++  iwmmx_mbuiltin ("wunpckelsb", v4hi_ftype_v8qi, WUNPCKELSB);
++  iwmmx_mbuiltin ("wunpckelsh", v2si_ftype_v4hi, WUNPCKELSH);
++  iwmmx_mbuiltin ("wunpckelsw", di_ftype_v2si, WUNPCKELSW);
++
++  iwmmx_mbuiltin ("wmacs", di_ftype_di_v4hi_v4hi, WMACS);
++  iwmmx_mbuiltin ("wmacsz", di_ftype_v4hi_v4hi, WMACSZ);
++  iwmmx_mbuiltin ("wmacu", di_ftype_di_v4hi_v4hi, WMACU);
++  iwmmx_mbuiltin ("wmacuz", di_ftype_v4hi_v4hi, WMACUZ);
++
++  iwmmx_mbuiltin ("walign", v8qi_ftype_v8qi_v8qi_int, WALIGN);
++  iwmmx_mbuiltin ("tmia", di_ftype_di_int_int, TMIA);
++  iwmmx_mbuiltin ("tmiaph", di_ftype_di_int_int, TMIAPH);
++  iwmmx_mbuiltin ("tmiabb", di_ftype_di_int_int, TMIABB);
++  iwmmx_mbuiltin ("tmiabt", di_ftype_di_int_int, TMIABT);
++  iwmmx_mbuiltin ("tmiatb", di_ftype_di_int_int, TMIATB);
++  iwmmx_mbuiltin ("tmiatt", di_ftype_di_int_int, TMIATT);
++
++#undef iwmmx_mbuiltin
++}
++
++static void
++arm_init_tls_builtins (void)
++{
++  tree ftype, decl;
++
++  ftype = build_function_type (ptr_type_node, void_list_node);
++  decl = add_builtin_function ("__builtin_thread_pointer", ftype,
++			       ARM_BUILTIN_THREAD_POINTER, BUILT_IN_MD,
++			       NULL, NULL_TREE);
++  TREE_NOTHROW (decl) = 1;
++  TREE_READONLY (decl) = 1;
++  arm_builtin_decls[ARM_BUILTIN_THREAD_POINTER] = decl;
+ }
+ 
+ static void
+@@ -19479,6 +19662,17 @@
+     arm_init_fp16_builtins ();
+ }
+ 
++/* Return the ARM builtin for CODE.  */
++
++static tree
++arm_builtin_decl (unsigned code, bool initialize_p ATTRIBUTE_UNUSED)
++{
++  if (code >= ARM_BUILTIN_MAX)
++    return error_mark_node;
++
++  return arm_builtin_decls[code];
++}
++
+ /* Implement TARGET_INVALID_PARAMETER_TYPE.  */
+ 
+ static const char *
+@@ -19630,58 +19824,6 @@
+   return target;
+ }
+ 
+-static int
+-neon_builtin_compare (const void *a, const void *b)
+-{
+-  const neon_builtin_datum *const key = (const neon_builtin_datum *) a;
+-  const neon_builtin_datum *const memb = (const neon_builtin_datum *) b;
+-  unsigned int soughtcode = key->base_fcode;
+-
+-  if (soughtcode >= memb->base_fcode
+-      && soughtcode < memb->base_fcode + memb->num_vars)
+-    return 0;
+-  else if (soughtcode < memb->base_fcode)
+-    return -1;
+-  else
+-    return 1;
+-}
+-
+-static enum insn_code
+-locate_neon_builtin_icode (int fcode, neon_itype *itype,
+-			   enum neon_builtin_type_bits *type_bit)
+-{
+-  neon_builtin_datum key
+-    = { NULL, (neon_itype) 0, 0, { CODE_FOR_nothing }, 0, 0 };
+-  neon_builtin_datum *found;
+-  int idx, type, ntypes;
+-
+-  key.base_fcode = fcode;
+-  found = (neon_builtin_datum *)
+-    bsearch (&key, &neon_builtin_data[0], ARRAY_SIZE (neon_builtin_data),
+-		   sizeof (neon_builtin_data[0]), neon_builtin_compare);
+-  gcc_assert (found);
+-  idx = fcode - (int) found->base_fcode;
+-  gcc_assert (idx >= 0 && idx < T_MAX && idx < (int)found->num_vars);
+-
+-  if (itype)
+-    *itype = found->itype;
+-
+-  if (type_bit)
+-    {
+-      ntypes = 0;
+-      for (type = 0; type < T_MAX; type++)
+-	if (found->bits & (1 << type))
+-	  {
+-	    if (ntypes == idx)
+-	      break;
+-	    ntypes++;
+-	  }
+-      gcc_assert (type < T_MAX);
+-      *type_bit = (enum neon_builtin_type_bits) (1 << type);
+-    }
+-  return found->codes[idx];
+-}
+-
+ typedef enum {
+   NEON_ARG_COPY_TO_REG,
+   NEON_ARG_CONSTANT,
+@@ -19695,14 +19837,14 @@
+    and return an expression for the accessed memory.
+ 
+    The intrinsic function operates on a block of registers that has
+-   mode REG_MODE.  This block contains vectors of type TYPE_BIT.
++   mode REG_MODE.  This block contains vectors of type TYPE_MODE.
+    The function references the memory at EXP in mode MEM_MODE;
+    this mode may be BLKmode if no more suitable mode is available.  */
+ 
+ static tree
+ neon_dereference_pointer (tree exp, enum machine_mode mem_mode,
+ 			  enum machine_mode reg_mode,
+-			  enum neon_builtin_type_bits type_bit)
++			  neon_builtin_type_mode type_mode)
+ {
+   HOST_WIDE_INT reg_size, vector_size, nvectors, nelems;
+   tree elem_type, upper_bound, array_type;
+@@ -19711,8 +19853,8 @@
+   reg_size = GET_MODE_SIZE (reg_mode);
+ 
+   /* Work out the size of each vector in bytes.  */
+-  gcc_assert (type_bit & (T_DREG | T_QREG));
+-  vector_size = (type_bit & T_QREG ? 16 : 8);
++  gcc_assert (TYPE_MODE_BIT (type_mode) & (TB_DREG | TB_QREG));
++  vector_size = (TYPE_MODE_BIT (type_mode) & TB_QREG ? 16 : 8);
+ 
+   /* Work out how many vectors there are.  */
+   gcc_assert (reg_size % vector_size == 0);
+@@ -19743,7 +19885,7 @@
+ /* Expand a Neon builtin.  */
+ static rtx
+ arm_expand_neon_args (rtx target, int icode, int have_retval,
+-		      enum neon_builtin_type_bits type_bit,
++		      neon_builtin_type_mode type_mode,
+ 		      tree exp, ...)
+ {
+   va_list ap;
+@@ -19779,7 +19921,7 @@
+             {
+               other_mode = insn_data[icode].operand[1 - opno].mode;
+               arg[argc] = neon_dereference_pointer (arg[argc], mode[argc],
+-                                                    other_mode, type_bit);
++                                                    other_mode, type_mode);
+             }
+           op[argc] = expand_normal (arg[argc]);
+ 
+@@ -19889,16 +20031,17 @@
+ static rtx
+ arm_expand_neon_builtin (int fcode, tree exp, rtx target)
+ {
+-  neon_itype itype;
+-  enum neon_builtin_type_bits type_bit;
+-  enum insn_code icode = locate_neon_builtin_icode (fcode, &itype, &type_bit);
++  neon_builtin_datum *d = &neon_builtin_data[fcode - ARM_BUILTIN_NEON_BASE];
++  neon_itype itype = d->itype;
++  enum insn_code icode = d->code;
++  neon_builtin_type_mode type_mode = d->mode;
+ 
+   switch (itype)
+     {
+     case NEON_UNOP:
+     case NEON_CONVERT:
+     case NEON_DUPLANE:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT, NEON_ARG_STOP);
+ 
+     case NEON_BINOP:
+@@ -19908,89 +20051,89 @@
+     case NEON_SCALARMULH:
+     case NEON_SHIFTINSERT:
+     case NEON_LOGICBINOP:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT,
+         NEON_ARG_STOP);
+ 
+     case NEON_TERNOP:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG,
+         NEON_ARG_CONSTANT, NEON_ARG_STOP);
+ 
+     case NEON_GETLANE:
+     case NEON_FIXCONV:
+     case NEON_SHIFTIMM:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT, NEON_ARG_CONSTANT,
+         NEON_ARG_STOP);
+ 
+     case NEON_CREATE:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_STOP);
+ 
+     case NEON_DUP:
+     case NEON_SPLIT:
+     case NEON_REINTERP:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_STOP);
+ 
+     case NEON_COMBINE:
+     case NEON_VTBL:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_STOP);
+ 
+     case NEON_RESULTPAIR:
+-      return arm_expand_neon_args (target, icode, 0, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 0, type_mode, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG,
+         NEON_ARG_STOP);
+ 
+     case NEON_LANEMUL:
+     case NEON_LANEMULL:
+     case NEON_LANEMULH:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT,
+         NEON_ARG_CONSTANT, NEON_ARG_STOP);
+ 
+     case NEON_LANEMAC:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG,
+         NEON_ARG_CONSTANT, NEON_ARG_CONSTANT, NEON_ARG_STOP);
+ 
+     case NEON_SHIFTACC:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+         NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT,
+         NEON_ARG_CONSTANT, NEON_ARG_STOP);
+ 
+     case NEON_SCALARMAC:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+ 	NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG,
+         NEON_ARG_CONSTANT, NEON_ARG_STOP);
+ 
+     case NEON_SELECT:
+     case NEON_VTBX:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+ 	NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG, NEON_ARG_COPY_TO_REG,
+         NEON_ARG_STOP);
+ 
+     case NEON_LOAD1:
+     case NEON_LOADSTRUCT:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+ 	NEON_ARG_MEMORY, NEON_ARG_STOP);
+ 
+     case NEON_LOAD1LANE:
+     case NEON_LOADSTRUCTLANE:
+-      return arm_expand_neon_args (target, icode, 1, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 1, type_mode, exp,
+ 	NEON_ARG_MEMORY, NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT,
+ 	NEON_ARG_STOP);
+ 
+     case NEON_STORE1:
+     case NEON_STORESTRUCT:
+-      return arm_expand_neon_args (target, icode, 0, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 0, type_mode, exp,
+ 	NEON_ARG_MEMORY, NEON_ARG_COPY_TO_REG, NEON_ARG_STOP);
+ 
+     case NEON_STORE1LANE:
+     case NEON_STORESTRUCTLANE:
+-      return arm_expand_neon_args (target, icode, 0, type_bit, exp,
++      return arm_expand_neon_args (target, icode, 0, type_mode, exp,
+ 	NEON_ARG_MEMORY, NEON_ARG_COPY_TO_REG, NEON_ARG_CONSTANT,
+ 	NEON_ARG_STOP);
+     }
+
+=== modified file 'gcc/config/arm/arm.h'
+--- old/gcc/config/arm/arm.h	2011-08-13 08:32:32 +0000
++++ new/gcc/config/arm/arm.h	2011-08-24 17:35:16 +0000
+@@ -2269,178 +2269,6 @@
+    : arm_gen_return_addr_mask ())
+ 
+ 
+-/* Neon defines builtins from ARM_BUILTIN_MAX upwards, though they don't have
+-   symbolic names defined here (which would require too much duplication).
+-   FIXME?  */
+-enum arm_builtins
+-{
+-  ARM_BUILTIN_GETWCX,
+-  ARM_BUILTIN_SETWCX,
+-
+-  ARM_BUILTIN_WZERO,
+-
+-  ARM_BUILTIN_WAVG2BR,
+-  ARM_BUILTIN_WAVG2HR,
+-  ARM_BUILTIN_WAVG2B,
+-  ARM_BUILTIN_WAVG2H,
+-
+-  ARM_BUILTIN_WACCB,
+-  ARM_BUILTIN_WACCH,
+-  ARM_BUILTIN_WACCW,
+-
+-  ARM_BUILTIN_WMACS,
+-  ARM_BUILTIN_WMACSZ,
+-  ARM_BUILTIN_WMACU,
+-  ARM_BUILTIN_WMACUZ,
+-
+-  ARM_BUILTIN_WSADB,
+-  ARM_BUILTIN_WSADBZ,
+-  ARM_BUILTIN_WSADH,
+-  ARM_BUILTIN_WSADHZ,
+-
+-  ARM_BUILTIN_WALIGN,
+-
+-  ARM_BUILTIN_TMIA,
+-  ARM_BUILTIN_TMIAPH,
+-  ARM_BUILTIN_TMIABB,
+-  ARM_BUILTIN_TMIABT,
+-  ARM_BUILTIN_TMIATB,
+-  ARM_BUILTIN_TMIATT,
+-
+-  ARM_BUILTIN_TMOVMSKB,
+-  ARM_BUILTIN_TMOVMSKH,
+-  ARM_BUILTIN_TMOVMSKW,
+-
+-  ARM_BUILTIN_TBCSTB,
+-  ARM_BUILTIN_TBCSTH,
+-  ARM_BUILTIN_TBCSTW,
+-
+-  ARM_BUILTIN_WMADDS,
+-  ARM_BUILTIN_WMADDU,
+-
+-  ARM_BUILTIN_WPACKHSS,
+-  ARM_BUILTIN_WPACKWSS,
+-  ARM_BUILTIN_WPACKDSS,
+-  ARM_BUILTIN_WPACKHUS,
+-  ARM_BUILTIN_WPACKWUS,
+-  ARM_BUILTIN_WPACKDUS,
+-
+-  ARM_BUILTIN_WADDB,
+-  ARM_BUILTIN_WADDH,
+-  ARM_BUILTIN_WADDW,
+-  ARM_BUILTIN_WADDSSB,
+-  ARM_BUILTIN_WADDSSH,
+-  ARM_BUILTIN_WADDSSW,
+-  ARM_BUILTIN_WADDUSB,
+-  ARM_BUILTIN_WADDUSH,
+-  ARM_BUILTIN_WADDUSW,
+-  ARM_BUILTIN_WSUBB,
+-  ARM_BUILTIN_WSUBH,
+-  ARM_BUILTIN_WSUBW,
+-  ARM_BUILTIN_WSUBSSB,
+-  ARM_BUILTIN_WSUBSSH,
+-  ARM_BUILTIN_WSUBSSW,
+-  ARM_BUILTIN_WSUBUSB,
+-  ARM_BUILTIN_WSUBUSH,
+-  ARM_BUILTIN_WSUBUSW,
+-
+-  ARM_BUILTIN_WAND,
+-  ARM_BUILTIN_WANDN,
+-  ARM_BUILTIN_WOR,
+-  ARM_BUILTIN_WXOR,
+-
+-  ARM_BUILTIN_WCMPEQB,
+-  ARM_BUILTIN_WCMPEQH,
+-  ARM_BUILTIN_WCMPEQW,
+-  ARM_BUILTIN_WCMPGTUB,
+-  ARM_BUILTIN_WCMPGTUH,
+-  ARM_BUILTIN_WCMPGTUW,
+-  ARM_BUILTIN_WCMPGTSB,
+-  ARM_BUILTIN_WCMPGTSH,
+-  ARM_BUILTIN_WCMPGTSW,
+-
+-  ARM_BUILTIN_TEXTRMSB,
+-  ARM_BUILTIN_TEXTRMSH,
+-  ARM_BUILTIN_TEXTRMSW,
+-  ARM_BUILTIN_TEXTRMUB,
+-  ARM_BUILTIN_TEXTRMUH,
+-  ARM_BUILTIN_TEXTRMUW,
+-  ARM_BUILTIN_TINSRB,
+-  ARM_BUILTIN_TINSRH,
+-  ARM_BUILTIN_TINSRW,
+-
+-  ARM_BUILTIN_WMAXSW,
+-  ARM_BUILTIN_WMAXSH,
+-  ARM_BUILTIN_WMAXSB,
+-  ARM_BUILTIN_WMAXUW,
+-  ARM_BUILTIN_WMAXUH,
+-  ARM_BUILTIN_WMAXUB,
+-  ARM_BUILTIN_WMINSW,
+-  ARM_BUILTIN_WMINSH,
+-  ARM_BUILTIN_WMINSB,
+-  ARM_BUILTIN_WMINUW,
+-  ARM_BUILTIN_WMINUH,
+-  ARM_BUILTIN_WMINUB,
+-
+-  ARM_BUILTIN_WMULUM,
+-  ARM_BUILTIN_WMULSM,
+-  ARM_BUILTIN_WMULUL,
+-
+-  ARM_BUILTIN_PSADBH,
+-  ARM_BUILTIN_WSHUFH,
+-
+-  ARM_BUILTIN_WSLLH,
+-  ARM_BUILTIN_WSLLW,
+-  ARM_BUILTIN_WSLLD,
+-  ARM_BUILTIN_WSRAH,
+-  ARM_BUILTIN_WSRAW,
+-  ARM_BUILTIN_WSRAD,
+-  ARM_BUILTIN_WSRLH,
+-  ARM_BUILTIN_WSRLW,
+-  ARM_BUILTIN_WSRLD,
+-  ARM_BUILTIN_WRORH,
+-  ARM_BUILTIN_WRORW,
+-  ARM_BUILTIN_WRORD,
+-  ARM_BUILTIN_WSLLHI,
+-  ARM_BUILTIN_WSLLWI,
+-  ARM_BUILTIN_WSLLDI,
+-  ARM_BUILTIN_WSRAHI,
+-  ARM_BUILTIN_WSRAWI,
+-  ARM_BUILTIN_WSRADI,
+-  ARM_BUILTIN_WSRLHI,
+-  ARM_BUILTIN_WSRLWI,
+-  ARM_BUILTIN_WSRLDI,
+-  ARM_BUILTIN_WRORHI,
+-  ARM_BUILTIN_WRORWI,
+-  ARM_BUILTIN_WRORDI,
+-
+-  ARM_BUILTIN_WUNPCKIHB,
+-  ARM_BUILTIN_WUNPCKIHH,
+-  ARM_BUILTIN_WUNPCKIHW,
+-  ARM_BUILTIN_WUNPCKILB,
+-  ARM_BUILTIN_WUNPCKILH,
+-  ARM_BUILTIN_WUNPCKILW,
+-
+-  ARM_BUILTIN_WUNPCKEHSB,
+-  ARM_BUILTIN_WUNPCKEHSH,
+-  ARM_BUILTIN_WUNPCKEHSW,
+-  ARM_BUILTIN_WUNPCKEHUB,
+-  ARM_BUILTIN_WUNPCKEHUH,
+-  ARM_BUILTIN_WUNPCKEHUW,
+-  ARM_BUILTIN_WUNPCKELSB,
+-  ARM_BUILTIN_WUNPCKELSH,
+-  ARM_BUILTIN_WUNPCKELSW,
+-  ARM_BUILTIN_WUNPCKELUB,
+-  ARM_BUILTIN_WUNPCKELUH,
+-  ARM_BUILTIN_WUNPCKELUW,
+-
+-  ARM_BUILTIN_THREAD_POINTER,
+-
+-  ARM_BUILTIN_NEON_BASE,
+-
+-  ARM_BUILTIN_MAX = ARM_BUILTIN_NEON_BASE  /* FIXME: Wrong!  */
+-};
+-
+ /* Do not emit .note.GNU-stack by default.  */
+ #ifndef NEED_INDICATE_EXEC_STACK
+ #define NEED_INDICATE_EXEC_STACK	0
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106796.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106796.patch
new file mode 100644
index 0000000..1a94097
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106796.patch
@@ -0,0 +1,1255 @@
+2011-08-25  Andrew Stubbs  <ams@codesourcery.com>
+
+	Backport from FSF mainline:
+
+	2011-08-19  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* tree-ssa-math-opts.c (is_widening_mult_rhs_p): Handle constants
+	beyond conversions.
+	(convert_mult_to_widen): Convert constant inputs to the right type.
+	(convert_plusminus_to_widen): Don't automatically reject inputs that
+	are not an SSA_NAME.
+	Convert constant inputs to the right type.
+
+	gcc/testsuite/
+	* gcc.target/arm/wmul-11.c: New file.
+	* gcc.target/arm/wmul-12.c: New file.
+	* gcc.target/arm/wmul-13.c: New file.
+
+	2011-08-19  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* tree-ssa-math-opts.c (convert_plusminus_to_widen): Convert add_rhs
+	to the correct type.
+
+	gcc/testsuite/
+	* gcc.target/arm/wmul-10.c: New file.
+
+	2011-08-19  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* tree-ssa-math-opts.c (convert_mult_to_widen): Better handle
+	unsigned inputs of different modes.
+	(convert_plusminus_to_widen): Likewise.
+
+	gcc/testsuite/
+	* gcc.target/arm/wmul-9.c: New file.
+	* gcc.target/arm/wmul-bitfield-2.c: New file.
+
+	2011-08-19  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* tree-ssa-math-opts.c (is_widening_mult_rhs_p): Add new argument
+	'type'.
+	Use 'type' from caller, not inferred from 'rhs'.
+	Don't reject non-conversion statements. Do return lhs in this case.
+	(is_widening_mult_p): Add new argument 'type'.
+	Use 'type' from caller, not inferred from 'stmt'.
+	Pass type to is_widening_mult_rhs_p.
+	(convert_mult_to_widen): Pass type to is_widening_mult_p.
+	(convert_plusminus_to_widen): Likewise.
+
+	gcc/testsuite/
+	* gcc.target/arm/wmul-8.c: New file.
+
+	2011-08-19  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* tree-ssa-math-opts.c (is_widening_mult_p): Remove FIXME.
+	Ensure the the larger type is the first operand.
+
+	gcc/testsuite/
+	* gcc.target/arm/wmul-7.c: New file.
+
+	2011-08-19  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* tree-ssa-math-opts.c (convert_mult_to_widen): Convert
+	unsupported unsigned multiplies to signed.
+	(convert_plusminus_to_widen): Likewise.
+
+	gcc/testsuite/
+	* gcc.target/arm/wmul-6.c: New file.
+
+	2011-08-19  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* tree-ssa-math-opts.c (convert_plusminus_to_widen): Permit a single
+	conversion statement separating multiply-and-accumulate.
+
+	gcc/testsuite/
+	* gcc.target/arm/wmul-5.c: New file.
+	* gcc.target/arm/no-wmla-1.c: New file.
+
+	2011-08-19  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* config/arm/arm.md (maddhidi4): Remove '*' from name.
+	* expr.c (expand_expr_real_2): Use find_widening_optab_handler.
+	* optabs.c (find_widening_optab_handler_and_mode): New function.
+	(expand_widen_pattern_expr): Use find_widening_optab_handler.
+	(expand_binop_directly): Likewise.
+	(expand_binop): Likewise.
+	* optabs.h (find_widening_optab_handler): New macro define.
+	(find_widening_optab_handler_and_mode): New prototype.
+	* tree-cfg.c (verify_gimple_assign_binary): Adjust WIDEN_MULT_EXPR
+	type precision rules.
+	(verify_gimple_assign_ternary): Likewise for WIDEN_MULT_PLUS_EXPR.
+	* tree-ssa-math-opts.c (build_and_insert_cast): New function.
+	(is_widening_mult_rhs_p): Allow widening by more than one mode.
+	Explicitly disallow mis-matched input types.
+	(convert_mult_to_widen): Use find_widening_optab_handler, and cast
+	input types to fit the new handler.
+	(convert_plusminus_to_widen): Likewise.
+
+	gcc/testsuite/
+	* gcc.target/arm/wmul-bitfield-1.c: New file.
+
+	2011-08-19  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* expr.c (expand_expr_real_2): Use widening_optab_handler.
+	* genopinit.c (optabs): Use set_widening_optab_handler for $N.
+	(gen_insn): $N now means $a must be wider than $b, not consecutive.
+	* optabs.c (widened_mode): New function.
+	(expand_widen_pattern_expr): Use widening_optab_handler.
+	(expand_binop_directly): Likewise.
+	(expand_binop): Likewise.
+	* optabs.h (widening_optab_handlers): New struct.
+	(optab_d): New member, 'widening'.
+	(widening_optab_handler): New function.
+	(set_widening_optab_handler): New function.
+	* tree-ssa-math-opts.c (convert_mult_to_widen): Use
+	widening_optab_handler.
+	(convert_plusminus_to_widen): Likewise.
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-08-13 08:32:32 +0000
++++ new/gcc/config/arm/arm.md	2011-08-25 11:42:09 +0000
+@@ -1839,7 +1839,7 @@
+    (set_attr "predicable" "yes")]
+ )
+ 
+-(define_insn "*maddhidi4"
++(define_insn "maddhidi4"
+   [(set (match_operand:DI 0 "s_register_operand" "=r")
+ 	(plus:DI
+ 	  (mult:DI (sign_extend:DI
+
+=== modified file 'gcc/expr.c'
+--- old/gcc/expr.c	2011-08-13 08:32:32 +0000
++++ new/gcc/expr.c	2011-08-25 11:42:09 +0000
+@@ -7688,18 +7688,16 @@
+ 	{
+ 	  enum machine_mode innermode = TYPE_MODE (TREE_TYPE (treeop0));
+ 	  this_optab = usmul_widen_optab;
+-	  if (mode == GET_MODE_2XWIDER_MODE (innermode))
++	  if (find_widening_optab_handler (this_optab, mode, innermode, 0)
++		!= CODE_FOR_nothing)
+ 	    {
+-	      if (optab_handler (this_optab, mode) != CODE_FOR_nothing)
+-		{
+-		  if (TYPE_UNSIGNED (TREE_TYPE (treeop0)))
+-		    expand_operands (treeop0, treeop1, NULL_RTX, &op0, &op1,
+-				     EXPAND_NORMAL);
+-		  else
+-		    expand_operands (treeop0, treeop1, NULL_RTX, &op1, &op0,
+-				     EXPAND_NORMAL);
+-		  goto binop3;
+-		}
++	      if (TYPE_UNSIGNED (TREE_TYPE (treeop0)))
++		expand_operands (treeop0, treeop1, NULL_RTX, &op0, &op1,
++				 EXPAND_NORMAL);
++	      else
++		expand_operands (treeop0, treeop1, NULL_RTX, &op1, &op0,
++				 EXPAND_NORMAL);
++	      goto binop3;
+ 	    }
+ 	}
+       /* Check for a multiplication with matching signedness.  */
+@@ -7714,10 +7712,10 @@
+ 	  optab other_optab = zextend_p ? smul_widen_optab : umul_widen_optab;
+ 	  this_optab = zextend_p ? umul_widen_optab : smul_widen_optab;
+ 
+-	  if (mode == GET_MODE_2XWIDER_MODE (innermode)
+-	      && TREE_CODE (treeop0) != INTEGER_CST)
++	  if (TREE_CODE (treeop0) != INTEGER_CST)
+ 	    {
+-	      if (optab_handler (this_optab, mode) != CODE_FOR_nothing)
++	      if (find_widening_optab_handler (this_optab, mode, innermode, 0)
++		    != CODE_FOR_nothing)
+ 		{
+ 		  expand_operands (treeop0, treeop1, NULL_RTX, &op0, &op1,
+ 				   EXPAND_NORMAL);
+@@ -7725,7 +7723,8 @@
+ 					       unsignedp, this_optab);
+ 		  return REDUCE_BIT_FIELD (temp);
+ 		}
+-	      if (optab_handler (other_optab, mode) != CODE_FOR_nothing
++	      if (find_widening_optab_handler (other_optab, mode, innermode, 0)
++		    != CODE_FOR_nothing
+ 		  && innermode == word_mode)
+ 		{
+ 		  rtx htem, hipart;
+
+=== modified file 'gcc/genopinit.c'
+--- old/gcc/genopinit.c	2011-05-05 15:43:06 +0000
++++ new/gcc/genopinit.c	2011-07-15 13:06:31 +0000
+@@ -46,10 +46,12 @@
+    used.  $A and $B are replaced with the full name of the mode; $a and $b
+    are replaced with the short form of the name, as above.
+ 
+-   If $N is present in the pattern, it means the two modes must be consecutive
+-   widths in the same mode class (e.g, QImode and HImode).  $I means that
+-   only full integer modes should be considered for the next mode, and $F
+-   means that only float modes should be considered.
++   If $N is present in the pattern, it means the two modes must be in
++   the same mode class, and $b must be greater than $a (e.g, QImode
++   and HImode).
++
++   $I means that only full integer modes should be considered for the
++   next mode, and $F means that only float modes should be considered.
+    $P means that both full and partial integer modes should be considered.
+    $Q means that only fixed-point modes should be considered.
+ 
+@@ -99,17 +101,17 @@
+   "set_optab_handler (smulv_optab, $A, CODE_FOR_$(mulv$I$a3$))",
+   "set_optab_handler (umul_highpart_optab, $A, CODE_FOR_$(umul$a3_highpart$))",
+   "set_optab_handler (smul_highpart_optab, $A, CODE_FOR_$(smul$a3_highpart$))",
+-  "set_optab_handler (smul_widen_optab, $B, CODE_FOR_$(mul$a$b3$)$N)",
+-  "set_optab_handler (umul_widen_optab, $B, CODE_FOR_$(umul$a$b3$)$N)",
+-  "set_optab_handler (usmul_widen_optab, $B, CODE_FOR_$(usmul$a$b3$)$N)",
+-  "set_optab_handler (smadd_widen_optab, $B, CODE_FOR_$(madd$a$b4$)$N)",
+-  "set_optab_handler (umadd_widen_optab, $B, CODE_FOR_$(umadd$a$b4$)$N)",
+-  "set_optab_handler (ssmadd_widen_optab, $B, CODE_FOR_$(ssmadd$a$b4$)$N)",
+-  "set_optab_handler (usmadd_widen_optab, $B, CODE_FOR_$(usmadd$a$b4$)$N)",
+-  "set_optab_handler (smsub_widen_optab, $B, CODE_FOR_$(msub$a$b4$)$N)",
+-  "set_optab_handler (umsub_widen_optab, $B, CODE_FOR_$(umsub$a$b4$)$N)",
+-  "set_optab_handler (ssmsub_widen_optab, $B, CODE_FOR_$(ssmsub$a$b4$)$N)",
+-  "set_optab_handler (usmsub_widen_optab, $B, CODE_FOR_$(usmsub$a$b4$)$N)",
++  "set_widening_optab_handler (smul_widen_optab, $B, $A, CODE_FOR_$(mul$a$b3$)$N)",
++  "set_widening_optab_handler (umul_widen_optab, $B, $A, CODE_FOR_$(umul$a$b3$)$N)",
++  "set_widening_optab_handler (usmul_widen_optab, $B, $A, CODE_FOR_$(usmul$a$b3$)$N)",
++  "set_widening_optab_handler (smadd_widen_optab, $B, $A, CODE_FOR_$(madd$a$b4$)$N)",
++  "set_widening_optab_handler (umadd_widen_optab, $B, $A, CODE_FOR_$(umadd$a$b4$)$N)",
++  "set_widening_optab_handler (ssmadd_widen_optab, $B, $A, CODE_FOR_$(ssmadd$a$b4$)$N)",
++  "set_widening_optab_handler (usmadd_widen_optab, $B, $A, CODE_FOR_$(usmadd$a$b4$)$N)",
++  "set_widening_optab_handler (smsub_widen_optab, $B, $A, CODE_FOR_$(msub$a$b4$)$N)",
++  "set_widening_optab_handler (umsub_widen_optab, $B, $A, CODE_FOR_$(umsub$a$b4$)$N)",
++  "set_widening_optab_handler (ssmsub_widen_optab, $B, $A, CODE_FOR_$(ssmsub$a$b4$)$N)",
++  "set_widening_optab_handler (usmsub_widen_optab, $B, $A, CODE_FOR_$(usmsub$a$b4$)$N)",
+   "set_optab_handler (sdiv_optab, $A, CODE_FOR_$(div$a3$))",
+   "set_optab_handler (ssdiv_optab, $A, CODE_FOR_$(ssdiv$Q$a3$))",
+   "set_optab_handler (sdivv_optab, $A, CODE_FOR_$(div$V$I$a3$))",
+@@ -304,7 +306,7 @@
+     {
+       int force_float = 0, force_int = 0, force_partial_int = 0;
+       int force_fixed = 0;
+-      int force_consec = 0;
++      int force_wider = 0;
+       int matches = 1;
+ 
+       for (pp = optabs[pindex]; pp[0] != '$' || pp[1] != '('; pp++)
+@@ -322,7 +324,7 @@
+ 	    switch (*++pp)
+ 	      {
+ 	      case 'N':
+-		force_consec = 1;
++		force_wider = 1;
+ 		break;
+ 	      case 'I':
+ 		force_int = 1;
+@@ -391,7 +393,10 @@
+ 			    || mode_class[i] == MODE_VECTOR_FRACT
+ 			    || mode_class[i] == MODE_VECTOR_UFRACT
+ 			    || mode_class[i] == MODE_VECTOR_ACCUM
+-			    || mode_class[i] == MODE_VECTOR_UACCUM))
++			    || mode_class[i] == MODE_VECTOR_UACCUM)
++			&& (! force_wider
++			    || *pp == 'a'
++			    || m1 < i))
+ 		      break;
+ 		  }
+ 
+@@ -411,8 +416,7 @@
+ 	}
+ 
+       if (matches && pp[0] == '$' && pp[1] == ')'
+-	  && *np == 0
+-	  && (! force_consec || (int) GET_MODE_WIDER_MODE(m1) == m2))
++	  && *np == 0)
+ 	break;
+     }
+ 
+
+=== modified file 'gcc/optabs.c'
+--- old/gcc/optabs.c	2011-07-04 14:03:49 +0000
++++ new/gcc/optabs.c	2011-08-11 15:46:01 +0000
+@@ -225,6 +225,61 @@
+   return 1;
+ }
+ 
++/* Given two input operands, OP0 and OP1, determine what the correct from_mode
++   for a widening operation would be.  In most cases this would be OP0, but if
++   that's a constant it'll be VOIDmode, which isn't useful.  */
++
++static enum machine_mode
++widened_mode (enum machine_mode to_mode, rtx op0, rtx op1)
++{
++  enum machine_mode m0 = GET_MODE (op0);
++  enum machine_mode m1 = GET_MODE (op1);
++  enum machine_mode result;
++
++  if (m0 == VOIDmode && m1 == VOIDmode)
++    return to_mode;
++  else if (m0 == VOIDmode || GET_MODE_SIZE (m0) < GET_MODE_SIZE (m1))
++    result = m1;
++  else
++    result = m0;
++
++  if (GET_MODE_SIZE (result) > GET_MODE_SIZE (to_mode))
++    return to_mode;
++
++  return result;
++}
++
++/* Find a widening optab even if it doesn't widen as much as we want.
++   E.g. if from_mode is HImode, and to_mode is DImode, and there is no
++   direct HI->SI insn, then return SI->DI, if that exists.
++   If PERMIT_NON_WIDENING is non-zero then this can be used with
++   non-widening optabs also.  */
++
++enum insn_code
++find_widening_optab_handler_and_mode (optab op, enum machine_mode to_mode,
++				      enum machine_mode from_mode,
++				      int permit_non_widening,
++				      enum machine_mode *found_mode)
++{
++  for (; (permit_non_widening || from_mode != to_mode)
++	 && GET_MODE_SIZE (from_mode) <= GET_MODE_SIZE (to_mode)
++	 && from_mode != VOIDmode;
++       from_mode = GET_MODE_WIDER_MODE (from_mode))
++    {
++      enum insn_code handler = widening_optab_handler (op, to_mode,
++						       from_mode);
++
++      if (handler != CODE_FOR_nothing)
++	{
++	  if (found_mode)
++	    *found_mode = from_mode;
++	  return handler;
++	}
++    }
++
++  return CODE_FOR_nothing;
++}
++
+ /* Widen OP to MODE and return the rtx for the widened operand.  UNSIGNEDP
+    says whether OP is signed or unsigned.  NO_EXTEND is nonzero if we need
+    not actually do a sign-extend or zero-extend, but can leave the
+@@ -517,8 +572,9 @@
+     optab_for_tree_code (ops->code, TREE_TYPE (oprnd0), optab_default);
+   if (ops->code == WIDEN_MULT_PLUS_EXPR
+       || ops->code == WIDEN_MULT_MINUS_EXPR)
+-    icode = (int) optab_handler (widen_pattern_optab,
+-				 TYPE_MODE (TREE_TYPE (ops->op2)));
++    icode = (int) find_widening_optab_handler (widen_pattern_optab,
++					       TYPE_MODE (TREE_TYPE (ops->op2)),
++					       tmode0, 0);
+   else
+     icode = (int) optab_handler (widen_pattern_optab, tmode0);
+   gcc_assert (icode != CODE_FOR_nothing);
+@@ -1389,7 +1445,9 @@
+ 		       rtx target, int unsignedp, enum optab_methods methods,
+ 		       rtx last)
+ {
+-  int icode = (int) optab_handler (binoptab, mode);
++  enum machine_mode from_mode = widened_mode (mode, op0, op1);
++  int icode = (int) find_widening_optab_handler (binoptab, mode,
++						 from_mode, 1);
+   enum machine_mode mode0 = insn_data[icode].operand[1].mode;
+   enum machine_mode mode1 = insn_data[icode].operand[2].mode;
+   enum machine_mode tmp_mode;
+@@ -1546,7 +1604,9 @@
+   /* If we can do it with a three-operand insn, do so.  */
+ 
+   if (methods != OPTAB_MUST_WIDEN
+-      && optab_handler (binoptab, mode) != CODE_FOR_nothing)
++      && find_widening_optab_handler (binoptab, mode,
++				      widened_mode (mode, op0, op1), 1)
++	    != CODE_FOR_nothing)
+     {
+       temp = expand_binop_directly (mode, binoptab, op0, op1, target,
+ 				    unsignedp, methods, last);
+@@ -1586,8 +1646,9 @@
+ 
+   if (binoptab == smul_optab
+       && GET_MODE_WIDER_MODE (mode) != VOIDmode
+-      && (optab_handler ((unsignedp ? umul_widen_optab : smul_widen_optab),
+-			 GET_MODE_WIDER_MODE (mode))
++      && (widening_optab_handler ((unsignedp ? umul_widen_optab
++					     : smul_widen_optab),
++				  GET_MODE_WIDER_MODE (mode), mode)
+ 	  != CODE_FOR_nothing))
+     {
+       temp = expand_binop (GET_MODE_WIDER_MODE (mode),
+@@ -1618,9 +1679,11 @@
+ 	if (optab_handler (binoptab, wider_mode) != CODE_FOR_nothing
+ 	    || (binoptab == smul_optab
+ 		&& GET_MODE_WIDER_MODE (wider_mode) != VOIDmode
+-		&& (optab_handler ((unsignedp ? umul_widen_optab
+-				    : smul_widen_optab),
+-				   GET_MODE_WIDER_MODE (wider_mode))
++		&& (find_widening_optab_handler ((unsignedp
++						  ? umul_widen_optab
++						  : smul_widen_optab),
++						 GET_MODE_WIDER_MODE (wider_mode),
++						 mode, 0)
+ 		    != CODE_FOR_nothing)))
+ 	  {
+ 	    rtx xop0 = op0, xop1 = op1;
+@@ -2043,8 +2106,8 @@
+       && optab_handler (add_optab, word_mode) != CODE_FOR_nothing)
+     {
+       rtx product = NULL_RTX;
+-
+-      if (optab_handler (umul_widen_optab, mode) != CODE_FOR_nothing)
++      if (widening_optab_handler (umul_widen_optab, mode, word_mode)
++	    != CODE_FOR_nothing)
+ 	{
+ 	  product = expand_doubleword_mult (mode, op0, op1, target,
+ 					    true, methods);
+@@ -2053,7 +2116,8 @@
+ 	}
+ 
+       if (product == NULL_RTX
+-	  && optab_handler (smul_widen_optab, mode) != CODE_FOR_nothing)
++	  && widening_optab_handler (smul_widen_optab, mode, word_mode)
++		!= CODE_FOR_nothing)
+ 	{
+ 	  product = expand_doubleword_mult (mode, op0, op1, target,
+ 					    false, methods);
+@@ -2144,7 +2208,8 @@
+ 	   wider_mode != VOIDmode;
+ 	   wider_mode = GET_MODE_WIDER_MODE (wider_mode))
+ 	{
+-	  if (optab_handler (binoptab, wider_mode) != CODE_FOR_nothing
++	  if (find_widening_optab_handler (binoptab, wider_mode, mode, 1)
++		  != CODE_FOR_nothing
+ 	      || (methods == OPTAB_LIB
+ 		  && optab_libfunc (binoptab, wider_mode)))
+ 	    {
+
+=== modified file 'gcc/optabs.h'
+--- old/gcc/optabs.h	2011-05-05 15:43:06 +0000
++++ new/gcc/optabs.h	2011-07-27 14:12:45 +0000
+@@ -42,6 +42,11 @@
+   int insn_code;
+ };
+ 
++struct widening_optab_handlers
++{
++  struct optab_handlers handlers[NUM_MACHINE_MODES][NUM_MACHINE_MODES];
++};
++
+ struct optab_d
+ {
+   enum rtx_code code;
+@@ -50,6 +55,7 @@
+   void (*libcall_gen)(struct optab_d *, const char *name, char suffix,
+ 		      enum machine_mode);
+   struct optab_handlers handlers[NUM_MACHINE_MODES];
++  struct widening_optab_handlers *widening;
+ };
+ typedef struct optab_d * optab;
+ 
+@@ -799,6 +805,15 @@
+ extern void emit_unop_insn (int, rtx, rtx, enum rtx_code);
+ extern bool maybe_emit_unop_insn (int, rtx, rtx, enum rtx_code);
+ 
++/* Find a widening optab even if it doesn't widen as much as we want.  */
++#define find_widening_optab_handler(A,B,C,D) \
++  find_widening_optab_handler_and_mode (A, B, C, D, NULL)
++extern enum insn_code find_widening_optab_handler_and_mode (optab,
++							    enum machine_mode,
++							    enum machine_mode,
++							    int,
++							    enum machine_mode *);
++
+ /* An extra flag to control optab_for_tree_code's behavior.  This is needed to
+    distinguish between machines with a vector shift that takes a scalar for the
+    shift amount vs. machines that take a vector for the shift amount.  */
+@@ -874,6 +889,23 @@
+ 			   + (int) CODE_FOR_nothing);
+ }
+ 
++/* Like optab_handler, but for widening_operations that have a TO_MODE and
++  a FROM_MODE.  */
++
++static inline enum insn_code
++widening_optab_handler (optab op, enum machine_mode to_mode,
++			enum machine_mode from_mode)
++{
++  if (to_mode == from_mode || from_mode == VOIDmode)
++    return optab_handler (op, to_mode);
++
++  if (op->widening)
++    return (enum insn_code) (op->widening->handlers[(int) to_mode][(int) from_mode].insn_code
++			     + (int) CODE_FOR_nothing);
++
++  return CODE_FOR_nothing;
++}
++
+ /* Record that insn CODE should be used to implement mode MODE of OP.  */
+ 
+ static inline void
+@@ -882,6 +914,26 @@
+   op->handlers[(int) mode].insn_code = (int) code - (int) CODE_FOR_nothing;
+ }
+ 
++/* Like set_optab_handler, but for widening operations that have a TO_MODE
++   and a FROM_MODE.  */
++
++static inline void
++set_widening_optab_handler (optab op, enum machine_mode to_mode,
++			    enum machine_mode from_mode, enum insn_code code)
++{
++  if (to_mode == from_mode)
++    set_optab_handler (op, to_mode, code);
++  else
++    {
++      if (op->widening == NULL)
++	op->widening = (struct widening_optab_handlers *)
++	      xcalloc (1, sizeof (struct widening_optab_handlers));
++
++      op->widening->handlers[(int) to_mode][(int) from_mode].insn_code
++	  = (int) code - (int) CODE_FOR_nothing;
++    }
++}
++
+ /* Return the insn used to perform conversion OP from mode FROM_MODE
+    to mode TO_MODE; return CODE_FOR_nothing if the target does not have
+    such an insn.  */
+
+=== added file 'gcc/testsuite/gcc.target/arm/no-wmla-1.c'
+--- old/gcc/testsuite/gcc.target/arm/no-wmla-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/no-wmla-1.c	2011-07-15 13:52:38 +0000
+@@ -0,0 +1,11 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv7-a" } */
++
++int
++foo (int a, short b, short c)
++{
++     int bc = b * c;
++        return a + (short)bc;
++}
++
++/* { dg-final { scan-assembler "mul" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/wmul-10.c'
+--- old/gcc/testsuite/gcc.target/arm/wmul-10.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/wmul-10.c	2011-07-18 12:56:20 +0000
+@@ -0,0 +1,10 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv7-a" } */
++
++unsigned long long
++foo (unsigned short a, unsigned short *b, unsigned short *c)
++{
++  return (unsigned)a + (unsigned long long)*b * (unsigned long long)*c;
++}
++
++/* { dg-final { scan-assembler "umlal" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/wmul-11.c'
+--- old/gcc/testsuite/gcc.target/arm/wmul-11.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/wmul-11.c	2011-07-22 15:46:42 +0000
+@@ -0,0 +1,10 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv7-a" } */
++
++long long
++foo (int *b)
++{
++  return 10 * (long long)*b;
++}
++
++/* { dg-final { scan-assembler "smull" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/wmul-12.c'
+--- old/gcc/testsuite/gcc.target/arm/wmul-12.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/wmul-12.c	2011-07-22 15:46:42 +0000
+@@ -0,0 +1,11 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv7-a" } */
++
++long long
++foo (int *b, int *c)
++{
++  int tmp = *b * *c;
++  return 10 + (long long)tmp;
++}
++
++/* { dg-final { scan-assembler "smlal" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/wmul-13.c'
+--- old/gcc/testsuite/gcc.target/arm/wmul-13.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/wmul-13.c	2011-07-22 15:46:42 +0000
+@@ -0,0 +1,10 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv7-a" } */
++
++long long
++foo (int *a, int *b)
++{
++  return *a + (long long)*b * 10;
++}
++
++/* { dg-final { scan-assembler "smlal" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/wmul-5.c'
+--- old/gcc/testsuite/gcc.target/arm/wmul-5.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/wmul-5.c	2011-07-15 13:52:38 +0000
+@@ -0,0 +1,10 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv7-a" } */
++
++long long
++foo (long long a, char *b, char *c)
++{
++  return a + *b * *c;
++}
++
++/* { dg-final { scan-assembler "umlal" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/wmul-6.c'
+--- old/gcc/testsuite/gcc.target/arm/wmul-6.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/wmul-6.c	2011-07-15 13:59:11 +0000
+@@ -0,0 +1,10 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv7-a" } */
++
++long long
++foo (long long a, unsigned char *b, signed char *c)
++{
++  return a + (long long)*b * (long long)*c;
++}
++
++/* { dg-final { scan-assembler "smlal" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/wmul-7.c'
+--- old/gcc/testsuite/gcc.target/arm/wmul-7.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/wmul-7.c	2011-07-15 14:11:23 +0000
+@@ -0,0 +1,10 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv7-a" } */
++
++unsigned long long
++foo (unsigned long long a, unsigned char *b, unsigned short *c)
++{
++  return a + *b * *c;
++}
++
++/* { dg-final { scan-assembler "umlal" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/wmul-8.c'
+--- old/gcc/testsuite/gcc.target/arm/wmul-8.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/wmul-8.c	2011-07-15 14:16:54 +0000
+@@ -0,0 +1,10 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv7-a" } */
++
++long long
++foo (long long a, int *b, int *c)
++{
++  return a + *b * *c;
++}
++
++/* { dg-final { scan-assembler "smlal" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/wmul-9.c'
+--- old/gcc/testsuite/gcc.target/arm/wmul-9.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/wmul-9.c	2011-07-15 14:22:39 +0000
+@@ -0,0 +1,10 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv7-a" } */
++
++long long
++foo (long long a, short *b, char *c)
++{
++  return a + *b * *c;
++}
++
++/* { dg-final { scan-assembler "smlalbb" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/wmul-bitfield-1.c'
+--- old/gcc/testsuite/gcc.target/arm/wmul-bitfield-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/wmul-bitfield-1.c	2011-07-15 13:44:50 +0000
+@@ -0,0 +1,17 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv7-a" } */
++
++struct bf
++{
++  int a : 3;
++  int b : 15;
++  int c : 3;
++};
++
++long long
++foo (long long a, struct bf b, struct bf c)
++{
++  return a + b.b * c.b;
++}
++
++/* { dg-final { scan-assembler "smlalbb" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/wmul-bitfield-2.c'
+--- old/gcc/testsuite/gcc.target/arm/wmul-bitfield-2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/wmul-bitfield-2.c	2011-07-15 14:22:39 +0000
+@@ -0,0 +1,17 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -march=armv7-a" } */
++
++struct bf
++{
++  int a : 3;
++  unsigned int b : 15;
++  int c : 3;
++};
++
++long long
++foo (long long a, struct bf b, struct bf c)
++{
++  return a + b.b * c.c;
++}
++
++/* { dg-final { scan-assembler "smlalbb" } } */
+
+=== modified file 'gcc/tree-cfg.c'
+--- old/gcc/tree-cfg.c	2011-07-01 09:19:21 +0000
++++ new/gcc/tree-cfg.c	2011-07-15 13:44:50 +0000
+@@ -3574,7 +3574,7 @@
+     case WIDEN_MULT_EXPR:
+       if (TREE_CODE (lhs_type) != INTEGER_TYPE)
+ 	return true;
+-      return ((2 * TYPE_PRECISION (rhs1_type) != TYPE_PRECISION (lhs_type))
++      return ((2 * TYPE_PRECISION (rhs1_type) > TYPE_PRECISION (lhs_type))
+ 	      || (TYPE_PRECISION (rhs1_type) != TYPE_PRECISION (rhs2_type)));
+ 
+     case WIDEN_SUM_EXPR:
+@@ -3667,7 +3667,7 @@
+ 	   && !FIXED_POINT_TYPE_P (rhs1_type))
+ 	  || !useless_type_conversion_p (rhs1_type, rhs2_type)
+ 	  || !useless_type_conversion_p (lhs_type, rhs3_type)
+-	  || 2 * TYPE_PRECISION (rhs1_type) != TYPE_PRECISION (lhs_type)
++	  || 2 * TYPE_PRECISION (rhs1_type) > TYPE_PRECISION (lhs_type)
+ 	  || TYPE_PRECISION (rhs1_type) != TYPE_PRECISION (rhs2_type))
+ 	{
+ 	  error ("type mismatch in widening multiply-accumulate expression");
+
+=== modified file 'gcc/tree-ssa-math-opts.c'
+--- old/gcc/tree-ssa-math-opts.c	2011-03-11 16:36:16 +0000
++++ new/gcc/tree-ssa-math-opts.c	2011-08-09 10:26:48 +0000
+@@ -1266,39 +1266,67 @@
+  }
+ };
+ 
+-/* Return true if RHS is a suitable operand for a widening multiplication.
++/* Build a gimple assignment to cast VAL to TARGET.  Insert the statement
++   prior to GSI's current position, and return the fresh SSA name.  */
++
++static tree
++build_and_insert_cast (gimple_stmt_iterator *gsi, location_t loc,
++		       tree target, tree val)
++{
++  tree result = make_ssa_name (target, NULL);
++  gimple stmt = gimple_build_assign_with_ops (CONVERT_EXPR, result, val, NULL);
++  gimple_set_location (stmt, loc);
++  gsi_insert_before (gsi, stmt, GSI_SAME_STMT);
++  return result;
++}
++
++/* Return true if RHS is a suitable operand for a widening multiplication,
++   assuming a target type of TYPE.
+    There are two cases:
+ 
+-     - RHS makes some value twice as wide.  Store that value in *NEW_RHS_OUT
+-       if so, and store its type in *TYPE_OUT.
++     - RHS makes some value at least twice as wide.  Store that value
++       in *NEW_RHS_OUT if so, and store its type in *TYPE_OUT.
+ 
+      - RHS is an integer constant.  Store that value in *NEW_RHS_OUT if so,
+        but leave *TYPE_OUT untouched.  */
+ 
+ static bool
+-is_widening_mult_rhs_p (tree rhs, tree *type_out, tree *new_rhs_out)
++is_widening_mult_rhs_p (tree type, tree rhs, tree *type_out,
++			tree *new_rhs_out)
+ {
+   gimple stmt;
+-  tree type, type1, rhs1;
++  tree type1, rhs1;
+   enum tree_code rhs_code;
+ 
+   if (TREE_CODE (rhs) == SSA_NAME)
+     {
+-      type = TREE_TYPE (rhs);
+       stmt = SSA_NAME_DEF_STMT (rhs);
+-      if (!is_gimple_assign (stmt))
+-	return false;
+-
+-      rhs_code = gimple_assign_rhs_code (stmt);
+-      if (TREE_CODE (type) == INTEGER_TYPE
+-	  ? !CONVERT_EXPR_CODE_P (rhs_code)
+-	  : rhs_code != FIXED_CONVERT_EXPR)
+-	return false;
+-
+-      rhs1 = gimple_assign_rhs1 (stmt);
++      if (is_gimple_assign (stmt))
++	{
++	  rhs_code = gimple_assign_rhs_code (stmt);
++	  if (TREE_CODE (type) == INTEGER_TYPE
++	      ? !CONVERT_EXPR_CODE_P (rhs_code)
++	      : rhs_code != FIXED_CONVERT_EXPR)
++	    rhs1 = rhs;
++	  else
++	    {
++	      rhs1 = gimple_assign_rhs1 (stmt);
++
++	      if (TREE_CODE (rhs1) == INTEGER_CST)
++		{
++		  *new_rhs_out = rhs1;
++		  *type_out = NULL;
++		  return true;
++		}
++	    }
++	}
++      else
++	rhs1 = rhs;
++
+       type1 = TREE_TYPE (rhs1);
++
+       if (TREE_CODE (type1) != TREE_CODE (type)
+-	  || TYPE_PRECISION (type1) * 2 != TYPE_PRECISION (type))
++	  || TYPE_PRECISION (type1) * 2 > TYPE_PRECISION (type))
+ 	return false;
+ 
+       *new_rhs_out = rhs1;
+@@ -1316,28 +1344,27 @@
+   return false;
+ }
+ 
+-/* Return true if STMT performs a widening multiplication.  If so,
+-   store the unwidened types of the operands in *TYPE1_OUT and *TYPE2_OUT
+-   respectively.  Also fill *RHS1_OUT and *RHS2_OUT such that converting
+-   those operands to types *TYPE1_OUT and *TYPE2_OUT would give the
+-   operands of the multiplication.  */
++/* Return true if STMT performs a widening multiplication, assuming the
++   output type is TYPE.  If so, store the unwidened types of the operands
++   in *TYPE1_OUT and *TYPE2_OUT respectively.  Also fill *RHS1_OUT and
++   *RHS2_OUT such that converting those operands to types *TYPE1_OUT
++   and *TYPE2_OUT would give the operands of the multiplication.  */
+ 
+ static bool
+-is_widening_mult_p (gimple stmt,
++is_widening_mult_p (tree type, gimple stmt,
+ 		    tree *type1_out, tree *rhs1_out,
+ 		    tree *type2_out, tree *rhs2_out)
+ {
+-  tree type;
+-
+-  type = TREE_TYPE (gimple_assign_lhs (stmt));
+   if (TREE_CODE (type) != INTEGER_TYPE
+       && TREE_CODE (type) != FIXED_POINT_TYPE)
+     return false;
+ 
+-  if (!is_widening_mult_rhs_p (gimple_assign_rhs1 (stmt), type1_out, rhs1_out))
++  if (!is_widening_mult_rhs_p (type, gimple_assign_rhs1 (stmt), type1_out,
++			       rhs1_out))
+     return false;
+ 
+-  if (!is_widening_mult_rhs_p (gimple_assign_rhs2 (stmt), type2_out, rhs2_out))
++  if (!is_widening_mult_rhs_p (type, gimple_assign_rhs2 (stmt), type2_out,
++			       rhs2_out))
+     return false;
+ 
+   if (*type1_out == NULL)
+@@ -1354,6 +1381,18 @@
+       *type2_out = *type1_out;
+     }
+ 
++  /* Ensure that the larger of the two operands comes first. */
++  if (TYPE_PRECISION (*type1_out) < TYPE_PRECISION (*type2_out))
++    {
++      tree tmp;
++      tmp = *type1_out;
++      *type1_out = *type2_out;
++      *type2_out = tmp;
++      tmp = *rhs1_out;
++      *rhs1_out = *rhs2_out;
++      *rhs2_out = tmp;
++    }
++
+   return true;
+ }
+ 
+@@ -1362,31 +1401,100 @@
+    value is true iff we converted the statement.  */
+ 
+ static bool
+-convert_mult_to_widen (gimple stmt)
++convert_mult_to_widen (gimple stmt, gimple_stmt_iterator *gsi)
+ {
+-  tree lhs, rhs1, rhs2, type, type1, type2;
++  tree lhs, rhs1, rhs2, type, type1, type2, tmp = NULL;
+   enum insn_code handler;
++  enum machine_mode to_mode, from_mode, actual_mode;
++  optab op;
++  int actual_precision;
++  location_t loc = gimple_location (stmt);
++  bool from_unsigned1, from_unsigned2;
+ 
+   lhs = gimple_assign_lhs (stmt);
+   type = TREE_TYPE (lhs);
+   if (TREE_CODE (type) != INTEGER_TYPE)
+     return false;
+ 
+-  if (!is_widening_mult_p (stmt, &type1, &rhs1, &type2, &rhs2))
++  if (!is_widening_mult_p (type, stmt, &type1, &rhs1, &type2, &rhs2))
+     return false;
+ 
+-  if (TYPE_UNSIGNED (type1) && TYPE_UNSIGNED (type2))
+-    handler = optab_handler (umul_widen_optab, TYPE_MODE (type));
+-  else if (!TYPE_UNSIGNED (type1) && !TYPE_UNSIGNED (type2))
+-    handler = optab_handler (smul_widen_optab, TYPE_MODE (type));
++  to_mode = TYPE_MODE (type);
++  from_mode = TYPE_MODE (type1);
++  from_unsigned1 = TYPE_UNSIGNED (type1);
++  from_unsigned2 = TYPE_UNSIGNED (type2);
++
++  if (from_unsigned1 && from_unsigned2)
++    op = umul_widen_optab;
++  else if (!from_unsigned1 && !from_unsigned2)
++    op = smul_widen_optab;
+   else
+-    handler = optab_handler (usmul_widen_optab, TYPE_MODE (type));
++    op = usmul_widen_optab;
++
++  handler = find_widening_optab_handler_and_mode (op, to_mode, from_mode,
++						  0, &actual_mode);
+ 
+   if (handler == CODE_FOR_nothing)
+-    return false;
+-
+-  gimple_assign_set_rhs1 (stmt, fold_convert (type1, rhs1));
+-  gimple_assign_set_rhs2 (stmt, fold_convert (type2, rhs2));
++    {
++      if (op != smul_widen_optab)
++	{
++	  /* We can use a signed multiply with unsigned types as long as
++	     there is a wider mode to use, or it is the smaller of the two
++	     types that is unsigned.  Note that type1 >= type2, always.  */
++	  if ((TYPE_UNSIGNED (type1)
++	       && TYPE_PRECISION (type1) == GET_MODE_PRECISION (from_mode))
++	      || (TYPE_UNSIGNED (type2)
++		  && TYPE_PRECISION (type2) == GET_MODE_PRECISION (from_mode)))
++	    {
++	      from_mode = GET_MODE_WIDER_MODE (from_mode);
++	      if (GET_MODE_SIZE (to_mode) <= GET_MODE_SIZE (from_mode))
++		return false;
++	    }
++
++	  op = smul_widen_optab;
++	  handler = find_widening_optab_handler_and_mode (op, to_mode,
++							  from_mode, 0,
++							  &actual_mode);
++
++	  if (handler == CODE_FOR_nothing)
++	    return false;
++
++	  from_unsigned1 = from_unsigned2 = false;
++	}
++      else
++	return false;
++    }
++
++  /* Ensure that the inputs to the handler are in the correct precison
++     for the opcode.  This will be the full mode size.  */
++  actual_precision = GET_MODE_PRECISION (actual_mode);
++  if (actual_precision != TYPE_PRECISION (type1)
++      || from_unsigned1 != TYPE_UNSIGNED (type1))
++    {
++      tmp = create_tmp_var (build_nonstandard_integer_type
++				(actual_precision, from_unsigned1),
++			    NULL);
++      rhs1 = build_and_insert_cast (gsi, loc, tmp, rhs1);
++    }
++  if (actual_precision != TYPE_PRECISION (type2)
++      || from_unsigned2 != TYPE_UNSIGNED (type2))
++    {
++      /* Reuse the same type info, if possible.  */
++      if (!tmp || from_unsigned1 != from_unsigned2)
++	tmp = create_tmp_var (build_nonstandard_integer_type
++				(actual_precision, from_unsigned2),
++			      NULL);
++      rhs2 = build_and_insert_cast (gsi, loc, tmp, rhs2);
++    }
++
++  /* Handle constants.  */
++  if (TREE_CODE (rhs1) == INTEGER_CST)
++    rhs1 = fold_convert (type1, rhs1);
++  if (TREE_CODE (rhs2) == INTEGER_CST)
++    rhs2 = fold_convert (type2, rhs2);
++
++  gimple_assign_set_rhs1 (stmt, rhs1);
++  gimple_assign_set_rhs2 (stmt, rhs2);
+   gimple_assign_set_rhs_code (stmt, WIDEN_MULT_EXPR);
+   update_stmt (stmt);
+   return true;
+@@ -1403,11 +1511,17 @@
+ 			    enum tree_code code)
+ {
+   gimple rhs1_stmt = NULL, rhs2_stmt = NULL;
+-  tree type, type1, type2;
++  gimple conv1_stmt = NULL, conv2_stmt = NULL, conv_stmt;
++  tree type, type1, type2, optype, tmp = NULL;
+   tree lhs, rhs1, rhs2, mult_rhs1, mult_rhs2, add_rhs;
+   enum tree_code rhs1_code = ERROR_MARK, rhs2_code = ERROR_MARK;
+   optab this_optab;
+   enum tree_code wmult_code;
++  enum insn_code handler;
++  enum machine_mode to_mode, from_mode, actual_mode;
++  location_t loc = gimple_location (stmt);
++  int actual_precision;
++  bool from_unsigned1, from_unsigned2;
+ 
+   lhs = gimple_assign_lhs (stmt);
+   type = TREE_TYPE (lhs);
+@@ -1429,8 +1543,6 @@
+       if (is_gimple_assign (rhs1_stmt))
+ 	rhs1_code = gimple_assign_rhs_code (rhs1_stmt);
+     }
+-  else
+-    return false;
+ 
+   if (TREE_CODE (rhs2) == SSA_NAME)
+     {
+@@ -1438,57 +1550,160 @@
+       if (is_gimple_assign (rhs2_stmt))
+ 	rhs2_code = gimple_assign_rhs_code (rhs2_stmt);
+     }
+-  else
+-    return false;
+-
+-  if (code == PLUS_EXPR && rhs1_code == MULT_EXPR)
+-    {
+-      if (!is_widening_mult_p (rhs1_stmt, &type1, &mult_rhs1,
+-			       &type2, &mult_rhs2))
+-	return false;
+-      add_rhs = rhs2;
+-    }
+-  else if (rhs2_code == MULT_EXPR)
+-    {
+-      if (!is_widening_mult_p (rhs2_stmt, &type1, &mult_rhs1,
+-			       &type2, &mult_rhs2))
+-	return false;
+-      add_rhs = rhs1;
+-    }
+-  else if (code == PLUS_EXPR && rhs1_code == WIDEN_MULT_EXPR)
+-    {
+-      mult_rhs1 = gimple_assign_rhs1 (rhs1_stmt);
+-      mult_rhs2 = gimple_assign_rhs2 (rhs1_stmt);
+-      type1 = TREE_TYPE (mult_rhs1);
+-      type2 = TREE_TYPE (mult_rhs2);
+-      add_rhs = rhs2;
+-    }
+-  else if (rhs2_code == WIDEN_MULT_EXPR)
+-    {
+-      mult_rhs1 = gimple_assign_rhs1 (rhs2_stmt);
+-      mult_rhs2 = gimple_assign_rhs2 (rhs2_stmt);
+-      type1 = TREE_TYPE (mult_rhs1);
+-      type2 = TREE_TYPE (mult_rhs2);
+-      add_rhs = rhs1;
+-    }
+-  else
+-    return false;
+-
+-  if (TYPE_UNSIGNED (type1) != TYPE_UNSIGNED (type2))
+-    return false;
++
++  /* Allow for one conversion statement between the multiply
++     and addition/subtraction statement.  If there are more than
++     one conversions then we assume they would invalidate this
++     transformation.  If that's not the case then they should have
++     been folded before now.  */
++  if (CONVERT_EXPR_CODE_P (rhs1_code))
++    {
++      conv1_stmt = rhs1_stmt;
++      rhs1 = gimple_assign_rhs1 (rhs1_stmt);
++      if (TREE_CODE (rhs1) == SSA_NAME)
++	{
++	  rhs1_stmt = SSA_NAME_DEF_STMT (rhs1);
++	  if (is_gimple_assign (rhs1_stmt))
++	    rhs1_code = gimple_assign_rhs_code (rhs1_stmt);
++	}
++      else
++	return false;
++    }
++  if (CONVERT_EXPR_CODE_P (rhs2_code))
++    {
++      conv2_stmt = rhs2_stmt;
++      rhs2 = gimple_assign_rhs1 (rhs2_stmt);
++      if (TREE_CODE (rhs2) == SSA_NAME)
++	{
++	  rhs2_stmt = SSA_NAME_DEF_STMT (rhs2);
++	  if (is_gimple_assign (rhs2_stmt))
++	    rhs2_code = gimple_assign_rhs_code (rhs2_stmt);
++	}
++      else
++	return false;
++    }
++
++  /* If code is WIDEN_MULT_EXPR then it would seem unnecessary to call
++     is_widening_mult_p, but we still need the rhs returns.
++
++     It might also appear that it would be sufficient to use the existing
++     operands of the widening multiply, but that would limit the choice of
++     multiply-and-accumulate instructions.  */
++  if (code == PLUS_EXPR
++      && (rhs1_code == MULT_EXPR || rhs1_code == WIDEN_MULT_EXPR))
++    {
++      if (!is_widening_mult_p (type, rhs1_stmt, &type1, &mult_rhs1,
++			       &type2, &mult_rhs2))
++	return false;
++      add_rhs = rhs2;
++      conv_stmt = conv1_stmt;
++    }
++  else if (rhs2_code == MULT_EXPR || rhs2_code == WIDEN_MULT_EXPR)
++    {
++      if (!is_widening_mult_p (type, rhs2_stmt, &type1, &mult_rhs1,
++			       &type2, &mult_rhs2))
++	return false;
++      add_rhs = rhs1;
++      conv_stmt = conv2_stmt;
++    }
++  else
++    return false;
++
++  to_mode = TYPE_MODE (type);
++  from_mode = TYPE_MODE (type1);
++  from_unsigned1 = TYPE_UNSIGNED (type1);
++  from_unsigned2 = TYPE_UNSIGNED (type2);
++
++  /* There's no such thing as a mixed sign madd yet, so use a wider mode.  */
++  if (from_unsigned1 != from_unsigned2)
++    {
++      /* We can use a signed multiply with unsigned types as long as
++	 there is a wider mode to use, or it is the smaller of the two
++	 types that is unsigned.  Note that type1 >= type2, always.  */
++      if ((from_unsigned1
++	   && TYPE_PRECISION (type1) == GET_MODE_PRECISION (from_mode))
++	  || (from_unsigned2
++	      && TYPE_PRECISION (type2) == GET_MODE_PRECISION (from_mode)))
++	{
++	  from_mode = GET_MODE_WIDER_MODE (from_mode);
++	  if (GET_MODE_SIZE (from_mode) >= GET_MODE_SIZE (to_mode))
++	    return false;
++	}
++
++      from_unsigned1 = from_unsigned2 = false;
++    }
++
++  /* If there was a conversion between the multiply and addition
++     then we need to make sure it fits a multiply-and-accumulate.
++     The should be a single mode change which does not change the
++     value.  */
++  if (conv_stmt)
++    {
++      /* We use the original, unmodified data types for this.  */
++      tree from_type = TREE_TYPE (gimple_assign_rhs1 (conv_stmt));
++      tree to_type = TREE_TYPE (gimple_assign_lhs (conv_stmt));
++      int data_size = TYPE_PRECISION (type1) + TYPE_PRECISION (type2);
++      bool is_unsigned = TYPE_UNSIGNED (type1) && TYPE_UNSIGNED (type2);
++
++      if (TYPE_PRECISION (from_type) > TYPE_PRECISION (to_type))
++	{
++	  /* Conversion is a truncate.  */
++	  if (TYPE_PRECISION (to_type) < data_size)
++	    return false;
++	}
++      else if (TYPE_PRECISION (from_type) < TYPE_PRECISION (to_type))
++	{
++	  /* Conversion is an extend.  Check it's the right sort.  */
++	  if (TYPE_UNSIGNED (from_type) != is_unsigned
++	      && !(is_unsigned && TYPE_PRECISION (from_type) > data_size))
++	    return false;
++	}
++      /* else convert is a no-op for our purposes.  */
++    }
+ 
+   /* Verify that the machine can perform a widening multiply
+      accumulate in this mode/signedness combination, otherwise
+      this transformation is likely to pessimize code.  */
+-  this_optab = optab_for_tree_code (wmult_code, type1, optab_default);
+-  if (optab_handler (this_optab, TYPE_MODE (type)) == CODE_FOR_nothing)
++  optype = build_nonstandard_integer_type (from_mode, from_unsigned1);
++  this_optab = optab_for_tree_code (wmult_code, optype, optab_default);
++  handler = find_widening_optab_handler_and_mode (this_optab, to_mode,
++						  from_mode, 0, &actual_mode);
++
++  if (handler == CODE_FOR_nothing)
+     return false;
+ 
+-  /* ??? May need some type verification here?  */
+-
+-  gimple_assign_set_rhs_with_ops_1 (gsi, wmult_code,
+-				    fold_convert (type1, mult_rhs1),
+-				    fold_convert (type2, mult_rhs2),
++  /* Ensure that the inputs to the handler are in the correct precison
++     for the opcode.  This will be the full mode size.  */
++  actual_precision = GET_MODE_PRECISION (actual_mode);
++  if (actual_precision != TYPE_PRECISION (type1)
++      || from_unsigned1 != TYPE_UNSIGNED (type1))
++    {
++      tmp = create_tmp_var (build_nonstandard_integer_type
++				(actual_precision, from_unsigned1),
++			    NULL);
++      mult_rhs1 = build_and_insert_cast (gsi, loc, tmp, mult_rhs1);
++    }
++  if (actual_precision != TYPE_PRECISION (type2)
++      || from_unsigned2 != TYPE_UNSIGNED (type2))
++    {
++      if (!tmp || from_unsigned1 != from_unsigned2)
++	tmp = create_tmp_var (build_nonstandard_integer_type
++				(actual_precision, from_unsigned2),
++			      NULL);
++      mult_rhs2 = build_and_insert_cast (gsi, loc, tmp, mult_rhs2);
++    }
++
++  if (!useless_type_conversion_p (type, TREE_TYPE (add_rhs)))
++    add_rhs = build_and_insert_cast (gsi, loc, create_tmp_var (type, NULL),
++				     add_rhs);
++
++  /* Handle constants.  */
++  if (TREE_CODE (mult_rhs1) == INTEGER_CST)
++    rhs1 = fold_convert (type1, mult_rhs1);
++  if (TREE_CODE (mult_rhs2) == INTEGER_CST)
++    rhs2 = fold_convert (type2, mult_rhs2);
++
++  gimple_assign_set_rhs_with_ops_1 (gsi, wmult_code, mult_rhs1, mult_rhs2,
+ 				    add_rhs);
+   update_stmt (gsi_stmt (*gsi));
+   return true;
+@@ -1696,7 +1911,7 @@
+ 	      switch (code)
+ 		{
+ 		case MULT_EXPR:
+-		  if (!convert_mult_to_widen (stmt)
++		  if (!convert_mult_to_widen (stmt, &gsi)
+ 		      && convert_mult_to_fma (stmt,
+ 					      gimple_assign_rhs1 (stmt),
+ 					      gimple_assign_rhs2 (stmt)))
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106797.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106797.patch
new file mode 100644
index 0000000..8230beb
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106797.patch
@@ -0,0 +1,23 @@
+2011-08-26  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	Backport from mainline:
+
+	2011-08-26  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* df-problems.c (df_note_bb_compute): Pass uses rather than defs
+	to df_set_dead_notes_for_mw.
+
+=== modified file 'gcc/df-problems.c'
+--- old/gcc/df-problems.c	2011-07-07 19:10:01 +0000
++++ new/gcc/df-problems.c	2011-08-26 14:32:47 +0000
+@@ -3375,7 +3375,7 @@
+       while (*mws_rec)
+ 	{
+ 	  struct df_mw_hardreg *mws = *mws_rec;
+-	  if ((DF_MWS_REG_DEF_P (mws))
++	  if (DF_MWS_REG_USE_P (mws)
+ 	      && !df_ignore_stack_reg (mws->start_regno))
+ 	    {
+ 	      bool really_add_notes = debug_insn != 0;
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106798.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106798.patch
new file mode 100644
index 0000000..aa067b7
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106798.patch
@@ -0,0 +1,23 @@
+2011-09-05  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	gcc/
+
+	2011-08-12  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+        PR target/48328
+	* config/arm/arm.h (CASE_VECTOR_SHORTEN_MODE): Fix distance
+	for tbh instructions.
+
+=== modified file 'gcc/config/arm/arm.h'
+--- old/gcc/config/arm/arm.h	2011-08-24 17:35:16 +0000
++++ new/gcc/config/arm/arm.h	2011-09-05 14:32:11 +0000
+@@ -1961,7 +1961,7 @@
+       : min >= -4096 && max < 4096					\
+       ? (ADDR_DIFF_VEC_FLAGS (body).offset_unsigned = 0, HImode)	\
+       : SImode)								\
+-   : ((min < 0 || max >= 0x2000 || !TARGET_THUMB2) ? SImode		\
++   : ((min < 0 || max >= 0x20000 || !TARGET_THUMB2) ? SImode		\
+       : (max >= 0x200) ? HImode						\
+       : QImode))
+ 
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106799.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106799.patch
new file mode 100644
index 0000000..c440db9
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106799.patch
@@ -0,0 +1,75 @@
+ 2011-09-05  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+ 
+       Backport from mainline.
+       2011-08-26  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
+
+       * config/arm/cortex-a9.md ("cortex_a9_mult_long"): New.
+       ("cortex_a9_multiply_long"): New and use above.  Handle all
+        long multiply cases.
+       ("cortex_a9_multiply"): Handle smmul and smmulr.
+       ("cortex_a9_mac"): Handle smmla.
+
+=== modified file 'gcc/config/arm/cortex-a9.md'
+--- old/gcc/config/arm/cortex-a9.md	2011-01-18 15:28:08 +0000
++++ new/gcc/config/arm/cortex-a9.md	2011-08-26 08:52:15 +0000
+@@ -68,7 +68,8 @@
+   "cortex_a9_mac_m1*2, cortex_a9_mac_m2, cortex_a9_p0_wb")
+ (define_reservation "cortex_a9_mac"
+   "cortex_a9_multcycle1*2 ,cortex_a9_mac_m2, cortex_a9_p0_wb")
+-
++(define_reservation "cortex_a9_mult_long"
++  "cortex_a9_mac_m1*3, cortex_a9_mac_m2, cortex_a9_p0_wb")
+ 
+ ;; Issue at the same time along the load store pipeline and
+ ;; the VFP / Neon pipeline is not possible.
+@@ -139,29 +140,35 @@
+        (eq_attr "insn" "smlaxy"))
+   "cortex_a9_mac16")
+ 
+-
+ (define_insn_reservation "cortex_a9_multiply" 4
+   (and (eq_attr "tune" "cortexa9")
+-       (eq_attr "insn" "mul"))
++       (eq_attr "insn" "mul,smmul,smmulr"))
+        "cortex_a9_mult")
+ 
+ (define_insn_reservation "cortex_a9_mac" 4
+   (and (eq_attr "tune" "cortexa9")
+-       (eq_attr "insn" "mla"))
++       (eq_attr "insn" "mla,smmla"))
+        "cortex_a9_mac")
+ 
++(define_insn_reservation "cortex_a9_multiply_long" 5
++  (and (eq_attr "tune" "cortexa9")
++       (eq_attr "insn" "smull,umull,smulls,umulls,smlal,smlals,umlal,umlals"))
++       "cortex_a9_mult_long")
++
+ ;; An instruction with a result in E2 can be forwarded
+ ;; to E2 or E1 or M1 or the load store unit in the next cycle.
+ 
+ (define_bypass 1 "cortex_a9_dp"
+                  "cortex_a9_dp_shift, cortex_a9_multiply,
+  cortex_a9_load1_2, cortex_a9_dp, cortex_a9_store1_2,
+- cortex_a9_mult16, cortex_a9_mac16, cortex_a9_mac, cortex_a9_store3_4, cortex_a9_load3_4")
++ cortex_a9_mult16, cortex_a9_mac16, cortex_a9_mac, cortex_a9_store3_4, cortex_a9_load3_4, 
++ cortex_a9_multiply_long")
+ 
+ (define_bypass 2 "cortex_a9_dp_shift"
+                  "cortex_a9_dp_shift, cortex_a9_multiply,
+  cortex_a9_load1_2, cortex_a9_dp, cortex_a9_store1_2,
+- cortex_a9_mult16, cortex_a9_mac16, cortex_a9_mac, cortex_a9_store3_4, cortex_a9_load3_4")
++ cortex_a9_mult16, cortex_a9_mac16, cortex_a9_mac, cortex_a9_store3_4, cortex_a9_load3_4,
++ cortex_a9_multiply_long")
+ 
+ ;; An instruction in the load store pipeline can provide
+ ;; read access to a DP instruction in the P0 default pipeline
+@@ -212,7 +219,7 @@
+ 
+ (define_bypass 1
+   "cortex_a9_fps"
+-  "cortex_a9_fadd, cortex_a9_fps, cortex_a9_fcmp, cortex_a9_dp, cortex_a9_dp_shift, cortex_a9_multiply")
++  "cortex_a9_fadd, cortex_a9_fps, cortex_a9_fcmp, cortex_a9_dp, cortex_a9_dp_shift, cortex_a9_multiply, cortex_a9_multiply_long")
+ 
+ ;; Scheduling on the FP_ADD pipeline.
+ (define_reservation "ca9fp_add" "ca9_issue_vfp_neon + ca9fp_add1, ca9fp_add2, ca9fp_add3, ca9fp_add4")
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106800.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106800.patch
new file mode 100644
index 0000000..dfdeec7
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106800.patch
@@ -0,0 +1,1270 @@
+2011-09-07  Ira Rosen  <ira.rosen@linaro.org>
+
+	Backport from mainline:
+
+	2011-08-04  Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	* tree-vectorizer.h (struct _stmt_vec_info): Add new field for
+	pattern def statement, and its access macro.
+	(NUM_PATTERNS): Set to 5.
+	* tree-vect-loop.c (vect_determine_vectorization_factor): Handle
+	pattern def statement.
+	(vect_transform_loop): Likewise.
+	* tree-vect-patterns.c (vect_vect_recog_func_ptrs): Add new
+	function vect_recog_over_widening_pattern ().
+	(vect_operation_fits_smaller_type): New function.
+	(vect_recog_over_widening_pattern, vect_mark_pattern_stmts):
+	Likewise.
+	(vect_pattern_recog_1): Move the code that marks pattern
+	statements to vect_mark_pattern_stmts (), and call it.  Update
+	documentation.
+	* tree-vect-stmts.c (vect_supportable_shift): New function.
+	(vect_analyze_stmt): Handle pattern def statement.
+	(new_stmt_vec_info): Initialize pattern def statement.
+
+	gcc/testsuite/
+	* gcc.dg/vect/vect-over-widen-1.c: New test.
+	* gcc.dg/vect/vect-over-widen-2.c: New test.
+	* gcc.dg/vect/vect-over-widen-3.c: New test.
+	* gcc.dg/vect/vect-over-widen-4.c: New test.
+
+
+	2011-08-09  Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	PR tree-optimization/50014
+	* tree-vect-loop.c (vectorizable_reduction): Get def type before
+	calling vect_get_vec_def_for_stmt_copy ().
+
+	gcc/testsuite/
+	PR tree-optimization/50014
+	* gcc.dg/vect/pr50014.c: New test.
+
+
+	2011-08-11  Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	PR tree-optimization/50039
+	* tree-vect-patterns.c (vect_operation_fits_smaller_type): Check
+	that DEF_STMT has a stmt_vec_info.
+
+	gcc/testsuite/
+	PR tree-optimization/50039
+	* gcc.dg/vect/vect.exp: Run no-tree-fre-* tests with -fno-tree-fre.
+	* gcc.dg/vect/no-tree-fre-pr50039.c: New test.
+
+
+	2011-09-04  Jakub Jelinek  <jakub@redhat.com>
+		    Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	PR tree-optimization/50208
+	* tree-vect-patterns.c (vect_handle_widen_mult_by_const): Add an
+	argument.  Check that def_stmt is inside the loop.
+	(vect_recog_widen_mult_pattern): Update calls to
+	vect_handle_widen_mult_by_cons.
+	(vect_operation_fits_smaller_type): Check that def_stmt is
+	inside the loop.
+
+	gcc/testsuite/
+	PR tree-optimization/50208
+	* gcc.dg/vect/no-fre-pre-pr50208.c: New test.
+	* gcc.dg/vect/vect.exp: Run no-fre-pre-*.c tests with
+	-fno-tree-fre -fno-tree-pre.
+
+=== added file 'gcc/testsuite/gcc.dg/vect/no-fre-pre-pr50208.c'
+--- old/gcc/testsuite/gcc.dg/vect/no-fre-pre-pr50208.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/no-fre-pre-pr50208.c	2011-09-05 06:23:37 +0000
+@@ -0,0 +1,17 @@
++/* { dg-do compile } */
++
++char c;
++int a, b;
++
++void foo (int j)
++{
++  int i;
++  while (--j)
++    {
++      b = 3;
++      for (i = 0; i < 2; ++i)
++        a = b ^ c;
++    }
++}
++
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== added file 'gcc/testsuite/gcc.dg/vect/no-tree-fre-pr50039.c'
+--- old/gcc/testsuite/gcc.dg/vect/no-tree-fre-pr50039.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/no-tree-fre-pr50039.c	2011-09-05 06:23:37 +0000
+@@ -0,0 +1,15 @@
++/* { dg-do compile } */
++
++extern unsigned char g_5;
++extern int g_31, g_76;
++int main(void) {
++ int i, j;
++    for (j=0; j < 2; ++j) {
++        g_31 = -3;
++        for (i=0; i < 2; ++i)
++          g_76 = (g_31 ? g_31+1 : 0) ^ g_5;
++    }
++}
++
++/* { dg-final { cleanup-tree-dump "vect" } } */
++
+
+=== added file 'gcc/testsuite/gcc.dg/vect/pr50014.c'
+--- old/gcc/testsuite/gcc.dg/vect/pr50014.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/pr50014.c	2011-09-05 06:23:37 +0000
+@@ -0,0 +1,16 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target vect_int } */
++
++int f(unsigned char *s, int n)
++{
++  int sum = 0;
++  int i;
++
++  for (i = 0; i < n; i++)
++    sum += 256 * s[i];
++
++  return sum;
++}
++
++/* { dg-final { cleanup-tree-dump "vect" } } */
++
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-over-widen-1.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-over-widen-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-over-widen-1.c	2011-09-05 06:23:37 +0000
+@@ -0,0 +1,64 @@
++/* { dg-require-effective-target vect_int } */
++/* { dg-require-effective-target vect_shift } */
++
++#include <stdlib.h>
++#include <stdarg.h>
++#include "tree-vect.h"
++
++#define N 64
++
++/* Modified rgb to rgb conversion from FFmpeg.  */
++__attribute__ ((noinline)) void
++foo (unsigned char *src, unsigned char *dst)
++{
++  unsigned char *s = src;
++  unsigned short *d = (unsigned short *)dst;
++  int i;
++
++  for (i = 0; i < N/4; i++)
++    {
++      const int b = *s++;
++      const int g = *s++;
++      const int r = *s++;
++      const int a = *s++;
++      *d = ((b>>3) | ((g&0xFC)<<3) | ((r&0xF8)<<8) | (a>>5));
++      d++;
++    }
++
++  s = src;
++  d = (unsigned short *)dst;
++  for (i = 0; i < N/4; i++)
++    {
++      const int b = *s++;
++      const int g = *s++;
++      const int r = *s++;
++      const int a = *s++;
++      if (*d != ((b>>3) | ((g&0xFC)<<3) | ((r&0xF8)<<8) | (a>>5)))
++        abort ();
++      d++;
++    }
++}
++
++int main (void)
++{
++  int i;
++  unsigned char in[N], out[N];
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      in[i] = i;
++      out[i] = 255;
++      __asm__ volatile ("");
++    }
++
++  foo (in, out);
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vect_recog_over_widening_pattern: detected" 4 "vect" } } */
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
++
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-over-widen-2.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-over-widen-2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-over-widen-2.c	2011-09-05 06:23:37 +0000
+@@ -0,0 +1,65 @@
++/* { dg-require-effective-target vect_int } */
++/* { dg-require-effective-target vect_shift } */
++
++#include <stdlib.h>
++#include <stdarg.h>
++#include "tree-vect.h"
++
++#define N 64
++
++/* Modified rgb to rgb conversion from FFmpeg.  */
++__attribute__ ((noinline)) void
++foo (unsigned char *src, unsigned char *dst)
++{
++  unsigned char *s = src;
++  int *d = (int *)dst;
++  int i;
++
++  for (i = 0; i < N/4; i++)
++    {
++      const int b = *s++;
++      const int g = *s++;
++      const int r = *s++;
++      const int a = *s++;
++      *d = ((b>>3) | ((g&0xFC)<<3) | ((r&0xF8)<<8) | (a>>5));
++      d++;
++    }
++
++  s = src;
++  d = (int *)dst;
++  for (i = 0; i < N/4; i++)
++    {
++      const int b = *s++;
++      const int g = *s++;
++      const int r = *s++;
++      const int a = *s++;
++      if (*d != ((b>>3) | ((g&0xFC)<<3) | ((r&0xF8)<<8) | (a>>5)))
++        abort ();
++      d++;
++    }
++}
++
++int main (void)
++{
++  int i;
++  unsigned char in[N], out[N];
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      in[i] = i;
++      out[i] = 255;
++      __asm__ volatile ("");
++    }
++
++  foo (in, out);
++
++  return 0;
++}
++
++/* Final value stays in int, so no over-widening is detected at the moment.  */
++/* { dg-final { scan-tree-dump-times "vect_recog_over_widening_pattern: detected" 0 "vect" } } */
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
++
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-over-widen-3.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-over-widen-3.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-over-widen-3.c	2011-09-05 06:23:37 +0000
+@@ -0,0 +1,64 @@
++/* { dg-require-effective-target vect_int } */
++/* { dg-require-effective-target vect_shift } */
++
++#include <stdlib.h>
++#include <stdarg.h>
++#include "tree-vect.h"
++
++#define N 64
++
++/* Modified rgb to rgb conversion from FFmpeg.  */
++__attribute__ ((noinline)) void
++foo (unsigned char *src, unsigned char *dst)
++{
++  unsigned char *s = src;
++  unsigned short *d = (unsigned short *)dst;
++  int i;
++
++  for (i = 0; i < N/4; i++)
++    {
++      const int b = *s++;
++      const int g = *s++;
++      const int r = *s++;
++      const int a = *s++;
++      *d = ((b>>3) | ((g&0xFFC)<<3) | ((r+0xF8)>>8) | (a<<9));
++      d++;
++    }
++
++  s = src;
++  d = (unsigned short *)dst;
++  for (i = 0; i < N/4; i++)
++    {
++      const int b = *s++;
++      const int g = *s++;
++      const int r = *s++;
++      const int a = *s++;
++      if (*d != ((b>>3) | ((g&0xFFC)<<3) | ((r+0xF8)>>8) | (a<<9)))
++        abort ();
++      d++;
++    }
++}
++
++int main (void)
++{
++  int i;
++  unsigned char in[N], out[N];
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      in[i] = i;
++      out[i] = 255;
++      __asm__ volatile ("");
++    }
++
++  foo (in, out);
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vect_recog_over_widening_pattern: detected" 1 "vect" } } */
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
++
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-over-widen-4.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-over-widen-4.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-over-widen-4.c	2011-09-05 06:23:37 +0000
+@@ -0,0 +1,68 @@
++/* { dg-require-effective-target vect_int } */
++/* { dg-require-effective-target vect_shift } */
++
++#include <stdlib.h>
++#include <stdarg.h>
++#include "tree-vect.h"
++
++#define N 64
++
++/* Modified rgb to rgb conversion from FFmpeg.  */
++__attribute__ ((noinline)) int
++foo (unsigned char *src, unsigned char *dst)
++{
++  unsigned char *s = src;
++  unsigned short *d = (unsigned short *)dst, res;
++  int i, result = 0;
++
++  for (i = 0; i < N/4; i++)
++    {
++      const int b = *s++;
++      const int g = *s++;
++      const int r = *s++;
++      const int a = *s++;
++      res = ((b>>3) | ((g&0xFC)<<3) | ((r&0xF8)<<8) | (a>>5));
++      *d = res;
++      result += res;
++      d++;
++    }
++
++  s = src;
++  d = (unsigned short *)dst;
++  for (i = 0; i < N/4; i++)
++    {
++      const int b = *s++;
++      const int g = *s++;
++      const int r = *s++;
++      const int a = *s++;
++      if (*d != ((b>>3) | ((g&0xFC)<<3) | ((r&0xF8)<<8) | (a>>5)))
++        abort ();
++      d++;
++    }
++
++  return result;
++}
++
++int main (void)
++{
++  int i;
++  unsigned char in[N], out[N];
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      in[i] = i;
++      out[i] = 255;
++      __asm__ volatile ("");
++    }
++
++  foo (in, out);
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vect_recog_over_widening_pattern: detected" 4 "vect" } } */
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
++
+
+=== modified file 'gcc/testsuite/gcc.dg/vect/vect.exp'
+--- old/gcc/testsuite/gcc.dg/vect/vect.exp	2011-05-05 15:43:31 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect.exp	2011-09-05 06:23:37 +0000
+@@ -245,6 +245,18 @@
+ dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/no-tree-reassoc-bb-slp-*.\[cS\]]]  \
+         "" $VECT_SLP_CFLAGS
+ 
++# -fno-tree-fre
++set DEFAULT_VECTCFLAGS $SAVED_DEFAULT_VECTCFLAGS
++lappend DEFAULT_VECTCFLAGS "-fno-tree-fre"
++dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/no-tree-fre-*.\[cS\]]]  \
++        "" $DEFAULT_VECTCFLAGS
++
++# -fno-tree-fre -fno-tree-pre
++set DEFAULT_VECTCFLAGS $SAVED_DEFAULT_VECTCFLAGS
++lappend DEFAULT_VECTCFLAGS "-fno-tree-fre" "-fno-tree-pre"
++dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/no-fre-pre*.\[cS\]]]  \
++        "" $DEFAULT_VECTCFLAGS
++
+ # Clean up.
+ set dg-do-what-default ${save-dg-do-what-default}
+ 
+
+=== modified file 'gcc/tree-vect-loop.c'
+--- old/gcc/tree-vect-loop.c	2011-07-11 11:02:55 +0000
++++ new/gcc/tree-vect-loop.c	2011-09-05 06:23:37 +0000
+@@ -181,8 +181,8 @@
+   stmt_vec_info stmt_info;
+   int i;
+   HOST_WIDE_INT dummy;
+-  gimple stmt, pattern_stmt = NULL;
+-  bool analyze_pattern_stmt = false;
++  gimple stmt, pattern_stmt = NULL, pattern_def_stmt = NULL;
++  bool analyze_pattern_stmt = false, pattern_def = false;
+ 
+   if (vect_print_dump_info (REPORT_DETAILS))
+     fprintf (vect_dump, "=== vect_determine_vectorization_factor ===");
+@@ -297,6 +297,29 @@
+                        || STMT_VINFO_LIVE_P (vinfo_for_stmt (pattern_stmt))))
+             analyze_pattern_stmt = true;
+ 
++          /* If a pattern statement has a def stmt, analyze it too.  */
++          if (is_pattern_stmt_p (stmt_info)
++              && (pattern_def_stmt = STMT_VINFO_PATTERN_DEF_STMT (stmt_info))
++              && (STMT_VINFO_RELEVANT_P (vinfo_for_stmt (pattern_def_stmt))
++                  || STMT_VINFO_LIVE_P (vinfo_for_stmt (pattern_def_stmt))))
++            {
++              if (pattern_def)
++                pattern_def = false;
++              else
++                {
++                  if (vect_print_dump_info (REPORT_DETAILS))
++                    {
++                      fprintf (vect_dump, "==> examining pattern def stmt: ");
++                      print_gimple_stmt (vect_dump, pattern_def_stmt, 0,
++                                         TDF_SLIM);
++                    }
++
++                  pattern_def = true;
++                  stmt = pattern_def_stmt;
++                  stmt_info = vinfo_for_stmt (stmt);
++                }
++            }
++
+ 	  if (gimple_get_lhs (stmt) == NULL_TREE)
+ 	    {
+ 	      if (vect_print_dump_info (REPORT_UNVECTORIZED_LOCATIONS))
+@@ -401,7 +424,7 @@
+ 	      || (nunits > vectorization_factor))
+ 	    vectorization_factor = nunits;
+ 
+-          if (!analyze_pattern_stmt)
++          if (!analyze_pattern_stmt && !pattern_def)
+             gsi_next (&si);
+         }
+     }
+@@ -3985,7 +4008,7 @@
+   VEC (tree, heap) *vec_oprnds0 = NULL, *vec_oprnds1 = NULL, *vect_defs = NULL;
+   VEC (gimple, heap) *phis = NULL;
+   int vec_num;
+-  tree def0, def1, tem;
++  tree def0, def1, tem, op0, op1 = NULL_TREE;
+ 
+   if (nested_in_vect_loop_p (loop, stmt))
+     {
+@@ -4418,8 +4441,6 @@
+       /* Handle uses.  */
+       if (j == 0)
+         {
+-          tree op0, op1 = NULL_TREE;
+-
+           op0 = ops[!reduc_index];
+           if (op_type == ternary_op)
+             {
+@@ -4449,11 +4470,19 @@
+         {
+           if (!slp_node)
+             {
+-              enum vect_def_type dt = vect_unknown_def_type; /* Dummy */
+-              loop_vec_def0 = vect_get_vec_def_for_stmt_copy (dt, loop_vec_def0);
++              enum vect_def_type dt;
++              gimple dummy_stmt;
++              tree dummy;
++
++              vect_is_simple_use (ops[!reduc_index], loop_vinfo, NULL,
++                                  &dummy_stmt, &dummy, &dt);
++              loop_vec_def0 = vect_get_vec_def_for_stmt_copy (dt,
++                                                              loop_vec_def0);
+               VEC_replace (tree, vec_oprnds0, 0, loop_vec_def0);
+               if (op_type == ternary_op)
+                 {
++                  vect_is_simple_use (op1, loop_vinfo, NULL, &dummy_stmt,
++                                      &dummy, &dt);
+                   loop_vec_def1 = vect_get_vec_def_for_stmt_copy (dt,
+                                                                 loop_vec_def1);
+                   VEC_replace (tree, vec_oprnds1, 0, loop_vec_def1);
+@@ -4758,8 +4787,8 @@
+   tree cond_expr = NULL_TREE;
+   gimple_seq cond_expr_stmt_list = NULL;
+   bool do_peeling_for_loop_bound;
+-  gimple stmt, pattern_stmt;
+-  bool transform_pattern_stmt = false;
++  gimple stmt, pattern_stmt, pattern_def_stmt;
++  bool transform_pattern_stmt = false, pattern_def = false;
+ 
+   if (vect_print_dump_info (REPORT_DETAILS))
+     fprintf (vect_dump, "=== vec_transform_loop ===");
+@@ -4903,6 +4932,30 @@
+                        || STMT_VINFO_LIVE_P (vinfo_for_stmt (pattern_stmt))))
+             transform_pattern_stmt = true;
+ 
++          /* If pattern statement has a def stmt, vectorize it too.  */
++          if (is_pattern_stmt_p (stmt_info)
++              && (pattern_def_stmt = STMT_VINFO_PATTERN_DEF_STMT (stmt_info))
++              && (STMT_VINFO_RELEVANT_P (vinfo_for_stmt (pattern_def_stmt))
++                  || STMT_VINFO_LIVE_P (vinfo_for_stmt (pattern_def_stmt))))
++            {
++              if (pattern_def)
++                pattern_def = false;
++              else
++                {
++                  if (vect_print_dump_info (REPORT_DETAILS))
++                    {
++                      fprintf (vect_dump, "==> vectorizing pattern def"
++                                          " stmt: ");
++                      print_gimple_stmt (vect_dump, pattern_def_stmt, 0,
++                                         TDF_SLIM);
++                    }
++
++                  pattern_def = true;
++                  stmt = pattern_def_stmt;
++                  stmt_info = vinfo_for_stmt (stmt);
++                }
++            }
++
+ 	  gcc_assert (STMT_VINFO_VECTYPE (stmt_info));
+ 	  nunits = (unsigned int) TYPE_VECTOR_SUBPARTS (
+                                                STMT_VINFO_VECTYPE (stmt_info));
+@@ -4930,7 +4983,7 @@
+ 	      /* Hybrid SLP stmts must be vectorized in addition to SLP.  */
+ 	      if (!vinfo_for_stmt (stmt) || PURE_SLP_STMT (stmt_info))
+ 		{
+-                  if (!transform_pattern_stmt)
++                  if (!transform_pattern_stmt && !pattern_def)
+  		    gsi_next (&si);
+   		  continue;
+ 		}
+@@ -4962,7 +5015,7 @@
+ 		}
+ 	    }
+ 
+-          if (!transform_pattern_stmt)
++          if (!transform_pattern_stmt && !pattern_def)
+  	    gsi_next (&si);
+ 	}		        /* stmts in BB */
+     }				/* BBs in loop */
+
+=== modified file 'gcc/tree-vect-patterns.c'
+--- old/gcc/tree-vect-patterns.c	2011-07-06 12:04:10 +0000
++++ new/gcc/tree-vect-patterns.c	2011-09-05 06:23:37 +0000
+@@ -46,11 +46,14 @@
+ static gimple vect_recog_dot_prod_pattern (VEC (gimple, heap) **, tree *,
+ 					   tree *);
+ static gimple vect_recog_pow_pattern (VEC (gimple, heap) **, tree *, tree *);
++static gimple vect_recog_over_widening_pattern (VEC (gimple, heap) **, tree *,
++                                                 tree *);
+ static vect_recog_func_ptr vect_vect_recog_func_ptrs[NUM_PATTERNS] = {
+ 	vect_recog_widen_mult_pattern,
+ 	vect_recog_widen_sum_pattern,
+ 	vect_recog_dot_prod_pattern,
+-	vect_recog_pow_pattern};
++	vect_recog_pow_pattern,
++        vect_recog_over_widening_pattern};
+ 
+ 
+ /* Function widened_name_p
+@@ -339,12 +342,14 @@
+    replace a_T = (TYPE) a_t; with a_it - (interm_type) a_t;  */
+ 
+ static bool
+-vect_handle_widen_mult_by_const (tree const_oprnd, tree *oprnd,
++vect_handle_widen_mult_by_const (gimple stmt, tree const_oprnd, tree *oprnd,
+                                  VEC (gimple, heap) **stmts, tree type,
+                                  tree *half_type, gimple def_stmt)
+ {
+   tree new_type, new_oprnd, tmp;
+   gimple new_stmt;
++  loop_vec_info loop_info = STMT_VINFO_LOOP_VINFO (vinfo_for_stmt (stmt));
++  struct loop *loop = LOOP_VINFO_LOOP (loop_info);
+ 
+   if (int_fits_type_p (const_oprnd, *half_type))
+     {
+@@ -354,6 +359,8 @@
+     }
+ 
+   if (TYPE_PRECISION (type) < (TYPE_PRECISION (*half_type) * 4)
++      || !gimple_bb (def_stmt)
++      || !flow_bb_inside_loop_p (loop, gimple_bb (def_stmt))
+       || !vinfo_for_stmt (def_stmt))
+     return false;
+ 
+@@ -522,7 +529,8 @@
+     {
+       if (TREE_CODE (oprnd0) == INTEGER_CST
+           && TREE_CODE (half_type1) == INTEGER_TYPE
+-          && vect_handle_widen_mult_by_const (oprnd0, &oprnd1, stmts, type,
++          && vect_handle_widen_mult_by_const (last_stmt, oprnd0, &oprnd1, 
++		                              stmts, type,
+                                               &half_type1, def_stmt1))
+         half_type0 = half_type1;
+       else
+@@ -532,7 +540,8 @@
+     {
+       if (TREE_CODE (oprnd1) == INTEGER_CST
+           && TREE_CODE (half_type0) == INTEGER_TYPE
+-          && vect_handle_widen_mult_by_const (oprnd1, &oprnd0, stmts, type,
++          && vect_handle_widen_mult_by_const (last_stmt, oprnd1, &oprnd0,
++		                              stmts, type,
+                                               &half_type0, def_stmt0))
+         half_type1 = half_type0;
+       else
+@@ -826,6 +835,424 @@
+ }
+ 
+ 
++/* Return TRUE if the operation in STMT can be performed on a smaller type.
++
++   Input:
++   STMT - a statement to check.
++   DEF - we support operations with two operands, one of which is constant.
++         The other operand can be defined by a demotion operation, or by a
++         previous statement in a sequence of over-promoted operations.  In the
++         later case DEF is used to replace that operand.  (It is defined by a
++         pattern statement we created for the previous statement in the
++         sequence).
++
++   Input/output:
++   NEW_TYPE - Output: a smaller type that we are trying to use.  Input: if not
++         NULL, it's the type of DEF.
++   STMTS - additional pattern statements.  If a pattern statement (type
++         conversion) is created in this function, its original statement is
++         added to STMTS.
++
++   Output:
++   OP0, OP1 - if the operation fits a smaller type, OP0 and OP1 are the new
++         operands to use in the new pattern statement for STMT (will be created
++         in vect_recog_over_widening_pattern ()).
++   NEW_DEF_STMT - in case DEF has to be promoted, we create two pattern
++         statements for STMT: the first one is a type promotion and the second
++         one is the operation itself.  We return the type promotion statement
++         in NEW_DEF_STMT and further store it in STMT_VINFO_PATTERN_DEF_STMT of
++         the second pattern statement.  */
++
++static bool
++vect_operation_fits_smaller_type (gimple stmt, tree def, tree *new_type,
++                                  tree *op0, tree *op1, gimple *new_def_stmt,
++                                  VEC (gimple, heap) **stmts)
++{
++  enum tree_code code;
++  tree const_oprnd, oprnd;
++  tree interm_type = NULL_TREE, half_type, tmp, new_oprnd, type;
++  gimple def_stmt, new_stmt;
++  bool first = false;
++  loop_vec_info loop_info = STMT_VINFO_LOOP_VINFO (vinfo_for_stmt (stmt));
++  struct loop *loop = LOOP_VINFO_LOOP (loop_info);
++
++  *new_def_stmt = NULL;
++
++  if (!is_gimple_assign (stmt))
++    return false;
++
++  code = gimple_assign_rhs_code (stmt);
++  if (code != LSHIFT_EXPR && code != RSHIFT_EXPR
++      && code != BIT_IOR_EXPR && code != BIT_XOR_EXPR && code != BIT_AND_EXPR)
++    return false;
++
++  oprnd = gimple_assign_rhs1 (stmt);
++  const_oprnd = gimple_assign_rhs2 (stmt);
++  type = gimple_expr_type (stmt);
++
++  if (TREE_CODE (oprnd) != SSA_NAME
++      || TREE_CODE (const_oprnd) != INTEGER_CST)
++    return false;
++
++  /* If we are in the middle of a sequence, we use DEF from a previous
++     statement.  Otherwise, OPRND has to be a result of type promotion.  */
++  if (*new_type)
++    {
++      half_type = *new_type;
++      oprnd = def;
++    }
++  else
++    {
++      first = true;
++      if (!widened_name_p (oprnd, stmt, &half_type, &def_stmt, false)
++          || !gimple_bb (def_stmt)
++          || !flow_bb_inside_loop_p (loop, gimple_bb (def_stmt))
++          || !vinfo_for_stmt (def_stmt))
++        return false;
++    }
++
++  /* Can we perform the operation on a smaller type?  */
++  switch (code)
++    {
++      case BIT_IOR_EXPR:
++      case BIT_XOR_EXPR:
++      case BIT_AND_EXPR:
++        if (!int_fits_type_p (const_oprnd, half_type))
++          {
++            /* HALF_TYPE is not enough.  Try a bigger type if possible.  */
++            if (TYPE_PRECISION (type) < (TYPE_PRECISION (half_type) * 4))
++              return false;
++
++            interm_type = build_nonstandard_integer_type (
++                        TYPE_PRECISION (half_type) * 2, TYPE_UNSIGNED (type));
++            if (!int_fits_type_p (const_oprnd, interm_type))
++              return false;
++          }
++
++        break;
++
++      case LSHIFT_EXPR:
++        /* Try intermediate type - HALF_TYPE is not enough for sure.  */
++        if (TYPE_PRECISION (type) < (TYPE_PRECISION (half_type) * 4))
++          return false;
++
++        /* Check that HALF_TYPE size + shift amount <= INTERM_TYPE size.
++          (e.g., if the original value was char, the shift amount is at most 8
++           if we want to use short).  */
++        if (compare_tree_int (const_oprnd, TYPE_PRECISION (half_type)) == 1)
++          return false;
++
++        interm_type = build_nonstandard_integer_type (
++                        TYPE_PRECISION (half_type) * 2, TYPE_UNSIGNED (type));
++
++        if (!vect_supportable_shift (code, interm_type))
++          return false;
++
++        break;
++
++      case RSHIFT_EXPR:
++        if (vect_supportable_shift (code, half_type))
++          break;
++
++        /* Try intermediate type - HALF_TYPE is not supported.  */
++        if (TYPE_PRECISION (type) < (TYPE_PRECISION (half_type) * 4))
++          return false;
++
++        interm_type = build_nonstandard_integer_type (
++                        TYPE_PRECISION (half_type) * 2, TYPE_UNSIGNED (type));
++
++        if (!vect_supportable_shift (code, interm_type))
++          return false;
++
++        break;
++
++      default:
++        gcc_unreachable ();
++    }
++
++  /* There are four possible cases:
++     1. OPRND is defined by a type promotion (in that case FIRST is TRUE, it's
++        the first statement in the sequence)
++        a. The original, HALF_TYPE, is not enough - we replace the promotion
++           from HALF_TYPE to TYPE with a promotion to INTERM_TYPE.
++        b. HALF_TYPE is sufficient, OPRND is set as the RHS of the original
++           promotion.
++     2. OPRND is defined by a pattern statement we created.
++        a. Its type is not sufficient for the operation, we create a new stmt:
++           a type conversion for OPRND from HALF_TYPE to INTERM_TYPE.  We store
++           this statement in NEW_DEF_STMT, and it is later put in
++           STMT_VINFO_PATTERN_DEF_STMT of the pattern statement for STMT.
++        b. OPRND is good to use in the new statement.  */
++  if (first)
++    {
++      if (interm_type)
++        {
++          /* Replace the original type conversion HALF_TYPE->TYPE with
++             HALF_TYPE->INTERM_TYPE.  */
++          if (STMT_VINFO_RELATED_STMT (vinfo_for_stmt (def_stmt)))
++            {
++              new_stmt = STMT_VINFO_RELATED_STMT (vinfo_for_stmt (def_stmt));
++              /* Check if the already created pattern stmt is what we need.  */
++              if (!is_gimple_assign (new_stmt)
++                  || gimple_assign_rhs_code (new_stmt) != NOP_EXPR
++                  || TREE_TYPE (gimple_assign_lhs (new_stmt)) != interm_type)
++                return false;
++
++              oprnd = gimple_assign_lhs (new_stmt);
++            }
++          else
++            {
++              /* Create NEW_OPRND = (INTERM_TYPE) OPRND.  */
++              oprnd = gimple_assign_rhs1 (def_stmt);
++              tmp = create_tmp_reg (interm_type, NULL);
++              add_referenced_var (tmp);
++              new_oprnd = make_ssa_name (tmp, NULL);
++              new_stmt = gimple_build_assign_with_ops (NOP_EXPR, new_oprnd,
++                                                       oprnd, NULL_TREE);
++              SSA_NAME_DEF_STMT (new_oprnd) = new_stmt;
++              STMT_VINFO_RELATED_STMT (vinfo_for_stmt (def_stmt)) = new_stmt;
++              VEC_safe_push (gimple, heap, *stmts, def_stmt);
++              oprnd = new_oprnd;
++            }
++        }
++      else
++        {
++          /* Retrieve the operand before the type promotion.  */
++          oprnd = gimple_assign_rhs1 (def_stmt);
++        }
++    }
++  else
++    {
++      if (interm_type)
++        {
++          /* Create a type conversion HALF_TYPE->INTERM_TYPE.  */
++          tmp = create_tmp_reg (interm_type, NULL);
++          add_referenced_var (tmp);
++          new_oprnd = make_ssa_name (tmp, NULL);
++          new_stmt = gimple_build_assign_with_ops (NOP_EXPR, new_oprnd,
++                                                   oprnd, NULL_TREE);
++          SSA_NAME_DEF_STMT (new_oprnd) = new_stmt;
++          oprnd = new_oprnd;
++          *new_def_stmt = new_stmt;
++        }
++
++      /* Otherwise, OPRND is already set.  */
++    }
++
++  if (interm_type)
++    *new_type = interm_type;
++  else
++    *new_type = half_type;
++
++  *op0 = oprnd;
++  *op1 = fold_convert (*new_type, const_oprnd);
++
++  return true;
++}
++
++
++/* Try to find a statement or a sequence of statements that can be performed
++   on a smaller type:
++
++     type x_t;
++     TYPE x_T, res0_T, res1_T;
++   loop:
++     S1  x_t = *p;
++     S2  x_T = (TYPE) x_t;
++     S3  res0_T = op (x_T, C0);
++     S4  res1_T = op (res0_T, C1);
++     S5  ... = () res1_T;  - type demotion
++
++   where type 'TYPE' is at least double the size of type 'type', C0 and C1 are
++   constants.
++   Check if S3 and S4 can be done on a smaller type than 'TYPE', it can either
++   be 'type' or some intermediate type.  For now, we expect S5 to be a type
++   demotion operation.  We also check that S3 and S4 have only one use.
++.
++
++*/
++static gimple
++vect_recog_over_widening_pattern (VEC (gimple, heap) **stmts,
++                                  tree *type_in, tree *type_out)
++{
++  gimple stmt = VEC_pop (gimple, *stmts);
++  gimple pattern_stmt = NULL, new_def_stmt, prev_stmt = NULL, use_stmt = NULL;
++  tree op0, op1, vectype = NULL_TREE, lhs, use_lhs, use_type;
++  imm_use_iterator imm_iter;
++  use_operand_p use_p;
++  int nuses = 0;
++  tree var = NULL_TREE, new_type = NULL_TREE, tmp, new_oprnd;
++  bool first;
++  struct loop *loop = (gimple_bb (stmt))->loop_father;
++
++  first = true;
++  while (1)
++    {
++      if (!vinfo_for_stmt (stmt)
++          || STMT_VINFO_IN_PATTERN_P (vinfo_for_stmt (stmt)))
++        return NULL;
++
++      new_def_stmt = NULL;
++      if (!vect_operation_fits_smaller_type (stmt, var, &new_type,
++                                             &op0, &op1, &new_def_stmt,
++                                             stmts))
++        {
++          if (first)
++            return NULL;
++          else
++            break;
++        }
++
++      /* STMT can be performed on a smaller type.  Check its uses.  */
++      lhs = gimple_assign_lhs (stmt);
++      nuses = 0;
++      FOR_EACH_IMM_USE_FAST (use_p, imm_iter, lhs)
++        {
++          if (is_gimple_debug (USE_STMT (use_p)))
++            continue;
++          use_stmt = USE_STMT (use_p);
++          nuses++;
++        }
++
++      if (nuses != 1 || !is_gimple_assign (use_stmt)
++          || !gimple_bb (use_stmt)
++          || !flow_bb_inside_loop_p (loop, gimple_bb (use_stmt)))
++        return NULL;
++
++      /* Create pattern statement for STMT.  */
++      vectype = get_vectype_for_scalar_type (new_type);
++      if (!vectype)
++        return NULL;
++
++      /* We want to collect all the statements for which we create pattern
++         statetments, except for the case when the last statement in the
++         sequence doesn't have a corresponding pattern statement.  In such
++         case we associate the last pattern statement with the last statement
++         in the sequence.  Therefore, we only add an original statetement to
++         the list if we know that it is not the last.  */
++      if (prev_stmt)
++        VEC_safe_push (gimple, heap, *stmts, prev_stmt);
++
++      var = vect_recog_temp_ssa_var (new_type, NULL);
++      pattern_stmt = gimple_build_assign_with_ops (
++                          gimple_assign_rhs_code (stmt), var, op0, op1);
++      SSA_NAME_DEF_STMT (var) = pattern_stmt;
++      STMT_VINFO_RELATED_STMT (vinfo_for_stmt (stmt)) = pattern_stmt;
++      STMT_VINFO_PATTERN_DEF_STMT (vinfo_for_stmt (stmt)) = new_def_stmt;
++
++      if (vect_print_dump_info (REPORT_DETAILS))
++        {
++          fprintf (vect_dump, "created pattern stmt: ");
++          print_gimple_stmt (vect_dump, pattern_stmt, 0, TDF_SLIM);
++        }
++
++      prev_stmt = stmt;
++      stmt = use_stmt;
++
++      first = false;
++    }
++
++  /* We got a sequence.  We expect it to end with a type demotion operation.
++     Otherwise, we quit (for now).  There are three possible cases: the
++     conversion is to NEW_TYPE (we don't do anything), the conversion is to
++     a type bigger than NEW_TYPE and/or the signedness of USE_TYPE and
++     NEW_TYPE differs (we create a new conversion statement).  */
++  if (CONVERT_EXPR_CODE_P (gimple_assign_rhs_code (use_stmt)))
++    {
++      use_lhs = gimple_assign_lhs (use_stmt);
++      use_type = TREE_TYPE (use_lhs);
++      /* Support only type promotion or signedess change.  */
++      if (!INTEGRAL_TYPE_P (use_type)
++          || TYPE_PRECISION (new_type) > TYPE_PRECISION (use_type))
++        return NULL;
++
++      if (TYPE_UNSIGNED (new_type) != TYPE_UNSIGNED (use_type)
++          || TYPE_PRECISION (new_type) != TYPE_PRECISION (use_type))
++        {
++          /* Create NEW_TYPE->USE_TYPE conversion.  */
++          tmp = create_tmp_reg (use_type, NULL);
++          add_referenced_var (tmp);
++          new_oprnd = make_ssa_name (tmp, NULL);
++          pattern_stmt = gimple_build_assign_with_ops (NOP_EXPR, new_oprnd,
++                                                       var, NULL_TREE);
++          SSA_NAME_DEF_STMT (new_oprnd) = pattern_stmt;
++          STMT_VINFO_RELATED_STMT (vinfo_for_stmt (use_stmt)) = pattern_stmt;
++
++          *type_in = get_vectype_for_scalar_type (new_type);
++          *type_out = get_vectype_for_scalar_type (use_type);
++
++          /* We created a pattern statement for the last statement in the
++             sequence, so we don't need to associate it with the pattern
++             statement created for PREV_STMT.  Therefore, we add PREV_STMT
++             to the list in order to mark it later in vect_pattern_recog_1.  */
++          if (prev_stmt)
++            VEC_safe_push (gimple, heap, *stmts, prev_stmt);
++        }
++      else
++        {
++          if (prev_stmt)
++            STMT_VINFO_PATTERN_DEF_STMT (vinfo_for_stmt (use_stmt))
++               = STMT_VINFO_PATTERN_DEF_STMT (vinfo_for_stmt (prev_stmt));
++
++          *type_in = vectype;
++          *type_out = NULL_TREE;
++        }
++
++      VEC_safe_push (gimple, heap, *stmts, use_stmt);
++    }
++  else
++    /* TODO: support general case, create a conversion to the correct type.  */
++    return NULL;
++
++  /* Pattern detected.  */
++  if (vect_print_dump_info (REPORT_DETAILS))
++    {
++      fprintf (vect_dump, "vect_recog_over_widening_pattern: detected: ");
++      print_gimple_stmt (vect_dump, pattern_stmt, 0, TDF_SLIM);
++    }
++
++  return pattern_stmt;
++}
++
++
++/* Mark statements that are involved in a pattern.  */
++
++static inline void
++vect_mark_pattern_stmts (gimple orig_stmt, gimple pattern_stmt,
++                         tree pattern_vectype)
++{
++  stmt_vec_info pattern_stmt_info, def_stmt_info;
++  stmt_vec_info orig_stmt_info = vinfo_for_stmt (orig_stmt);
++  loop_vec_info loop_vinfo = STMT_VINFO_LOOP_VINFO (orig_stmt_info);
++  gimple def_stmt;
++
++  set_vinfo_for_stmt (pattern_stmt,
++                      new_stmt_vec_info (pattern_stmt, loop_vinfo, NULL));
++  gimple_set_bb (pattern_stmt, gimple_bb (orig_stmt));
++  pattern_stmt_info = vinfo_for_stmt (pattern_stmt);
++
++  STMT_VINFO_RELATED_STMT (pattern_stmt_info) = orig_stmt;
++  STMT_VINFO_DEF_TYPE (pattern_stmt_info)
++	= STMT_VINFO_DEF_TYPE (orig_stmt_info);
++  STMT_VINFO_VECTYPE (pattern_stmt_info) = pattern_vectype;
++  STMT_VINFO_IN_PATTERN_P (orig_stmt_info) = true;
++  STMT_VINFO_RELATED_STMT (orig_stmt_info) = pattern_stmt;
++  STMT_VINFO_PATTERN_DEF_STMT (pattern_stmt_info)
++	= STMT_VINFO_PATTERN_DEF_STMT (orig_stmt_info);
++  if (STMT_VINFO_PATTERN_DEF_STMT (pattern_stmt_info))
++    {
++      def_stmt = STMT_VINFO_PATTERN_DEF_STMT (pattern_stmt_info);
++      set_vinfo_for_stmt (def_stmt,
++                          new_stmt_vec_info (def_stmt, loop_vinfo, NULL));
++      gimple_set_bb (def_stmt, gimple_bb (orig_stmt));
++      def_stmt_info = vinfo_for_stmt (def_stmt);
++      STMT_VINFO_RELATED_STMT (def_stmt_info) = orig_stmt;
++      STMT_VINFO_DEF_TYPE (def_stmt_info)
++	= STMT_VINFO_DEF_TYPE (orig_stmt_info);
++      STMT_VINFO_VECTYPE (def_stmt_info) = pattern_vectype;
++    }
++}
++
+ /* Function vect_pattern_recog_1
+ 
+    Input:
+@@ -855,7 +1282,6 @@
+ {
+   gimple stmt = gsi_stmt (si), pattern_stmt;
+   stmt_vec_info stmt_info;
+-  stmt_vec_info pattern_stmt_info;
+   loop_vec_info loop_vinfo;
+   tree pattern_vectype;
+   tree type_in, type_out;
+@@ -923,16 +1349,7 @@
+     }
+ 
+   /* Mark the stmts that are involved in the pattern. */
+-  set_vinfo_for_stmt (pattern_stmt,
+-		      new_stmt_vec_info (pattern_stmt, loop_vinfo, NULL));
+-  gimple_set_bb (pattern_stmt, gimple_bb (stmt));
+-  pattern_stmt_info = vinfo_for_stmt (pattern_stmt);
+-
+-  STMT_VINFO_RELATED_STMT (pattern_stmt_info) = stmt;
+-  STMT_VINFO_DEF_TYPE (pattern_stmt_info) = STMT_VINFO_DEF_TYPE (stmt_info);
+-  STMT_VINFO_VECTYPE (pattern_stmt_info) = pattern_vectype;
+-  STMT_VINFO_IN_PATTERN_P (stmt_info) = true;
+-  STMT_VINFO_RELATED_STMT (stmt_info) = pattern_stmt;
++  vect_mark_pattern_stmts (stmt, pattern_stmt, pattern_vectype);
+ 
+   /* Patterns cannot be vectorized using SLP, because they change the order of
+      computation.  */
+@@ -940,9 +1357,9 @@
+     if (next == stmt)
+       VEC_ordered_remove (gimple, LOOP_VINFO_REDUCTIONS (loop_vinfo), i); 
+ 
+-  /* In case of widen-mult by a constant, it is possible that an additional
+-     pattern stmt is created and inserted in STMTS_TO_REPLACE.  We create a
+-     stmt_info for it, and mark the relevant statements.  */
++  /* It is possible that additional pattern stmts are created and inserted in
++     STMTS_TO_REPLACE.  We create a stmt_info for each of them, and mark the
++     relevant statements.  */
+   for (i = 0; VEC_iterate (gimple, stmts_to_replace, i, stmt)
+               && (unsigned) i < (VEC_length (gimple, stmts_to_replace) - 1);
+        i++)
+@@ -955,16 +1372,7 @@
+           print_gimple_stmt (vect_dump, pattern_stmt, 0, TDF_SLIM);
+         }
+ 
+-      set_vinfo_for_stmt (pattern_stmt,
+-                      new_stmt_vec_info (pattern_stmt, loop_vinfo, NULL));
+-      gimple_set_bb (pattern_stmt, gimple_bb (stmt));
+-      pattern_stmt_info = vinfo_for_stmt (pattern_stmt);
+-
+-      STMT_VINFO_RELATED_STMT (pattern_stmt_info) = stmt;
+-      STMT_VINFO_DEF_TYPE (pattern_stmt_info)
+-        = STMT_VINFO_DEF_TYPE (stmt_info);
+-      STMT_VINFO_VECTYPE (pattern_stmt_info) = STMT_VINFO_VECTYPE (stmt_info);
+-      STMT_VINFO_IN_PATTERN_P (stmt_info) = true;
++      vect_mark_pattern_stmts (stmt, pattern_stmt, NULL_TREE);
+     }
+ 
+   VEC_free (gimple, heap, stmts_to_replace);
+
+=== modified file 'gcc/tree-vect-stmts.c'
+--- old/gcc/tree-vect-stmts.c	2011-07-06 12:04:10 +0000
++++ new/gcc/tree-vect-stmts.c	2011-09-05 06:23:37 +0000
+@@ -2246,6 +2246,42 @@
+ }
+ 
+ 
++/* Return TRUE if CODE (a shift operation) is supported for SCALAR_TYPE
++   either as shift by a scalar or by a vector.  */
++
++bool
++vect_supportable_shift (enum tree_code code, tree scalar_type)
++{
++
++  enum machine_mode vec_mode;
++  optab optab;
++  int icode;
++  tree vectype;
++
++  vectype = get_vectype_for_scalar_type (scalar_type);
++  if (!vectype)
++    return false;
++
++  optab = optab_for_tree_code (code, vectype, optab_scalar);
++  if (!optab
++      || optab_handler (optab, TYPE_MODE (vectype)) == CODE_FOR_nothing)
++    {
++      optab = optab_for_tree_code (code, vectype, optab_vector);
++      if (!optab
++          || (optab_handler (optab, TYPE_MODE (vectype))
++                      == CODE_FOR_nothing))
++        return false;
++    }
++
++  vec_mode = TYPE_MODE (vectype);
++  icode = (int) optab_handler (optab, vec_mode);
++  if (icode == CODE_FOR_nothing)
++    return false;
++
++  return true;
++}
++
++
+ /* Function vectorizable_shift.
+ 
+    Check if STMT performs a shift operation that can be vectorized.
+@@ -4946,7 +4982,7 @@
+   enum vect_relevant relevance = STMT_VINFO_RELEVANT (stmt_info);
+   bool ok;
+   tree scalar_type, vectype;
+-  gimple pattern_stmt;
++  gimple pattern_stmt, pattern_def_stmt;
+ 
+   if (vect_print_dump_info (REPORT_DETAILS))
+     {
+@@ -5016,6 +5052,23 @@
+         return false;
+    }
+ 
++  if (is_pattern_stmt_p (stmt_info)
++      && (pattern_def_stmt = STMT_VINFO_PATTERN_DEF_STMT (stmt_info))
++      && (STMT_VINFO_RELEVANT_P (vinfo_for_stmt (pattern_def_stmt))
++          || STMT_VINFO_LIVE_P (vinfo_for_stmt (pattern_def_stmt))))
++    {
++      /* Analyze def stmt of STMT if it's a pattern stmt.  */
++      if (vect_print_dump_info (REPORT_DETAILS))
++        {
++          fprintf (vect_dump, "==> examining pattern def statement: ");
++          print_gimple_stmt (vect_dump, pattern_def_stmt, 0, TDF_SLIM);
++        }
++
++      if (!vect_analyze_stmt (pattern_def_stmt, need_to_vectorize, node))
++        return false;
++   }
++
++
+   switch (STMT_VINFO_DEF_TYPE (stmt_info))
+     {
+       case vect_internal_def:
+@@ -5336,6 +5389,7 @@
+   STMT_VINFO_VECTORIZABLE (res) = true;
+   STMT_VINFO_IN_PATTERN_P (res) = false;
+   STMT_VINFO_RELATED_STMT (res) = NULL;
++  STMT_VINFO_PATTERN_DEF_STMT (res) = NULL;
+   STMT_VINFO_DATA_REF (res) = NULL;
+ 
+   STMT_VINFO_DR_BASE_ADDRESS (res) = NULL;
+
+=== modified file 'gcc/tree-vectorizer.h'
+--- old/gcc/tree-vectorizer.h	2011-07-11 11:02:55 +0000
++++ new/gcc/tree-vectorizer.h	2011-09-05 06:23:37 +0000
+@@ -464,6 +464,9 @@
+         pattern).  */
+   gimple related_stmt;
+ 
++  /* Used to keep a def stmt of a pattern stmt if such exists.  */
++  gimple pattern_def_stmt;
++
+   /* List of datarefs that are known to have the same alignment as the dataref
+      of this stmt.  */
+   VEC(dr_p,heap) *same_align_refs;
+@@ -531,6 +534,7 @@
+ 
+ #define STMT_VINFO_IN_PATTERN_P(S)         (S)->in_pattern_p
+ #define STMT_VINFO_RELATED_STMT(S)         (S)->related_stmt
++#define STMT_VINFO_PATTERN_DEF_STMT(S)     (S)->pattern_def_stmt
+ #define STMT_VINFO_SAME_ALIGN_REFS(S)      (S)->same_align_refs
+ #define STMT_VINFO_DEF_TYPE(S)             (S)->def_type
+ #define STMT_VINFO_DR_GROUP_FIRST_DR(S)    (S)->first_dr
+@@ -814,6 +818,7 @@
+ extern void vect_get_load_cost (struct data_reference *, int, bool,
+                                 unsigned int *, unsigned int *);
+ extern void vect_get_store_cost (struct data_reference *, int, unsigned int *);
++extern bool vect_supportable_shift (enum tree_code, tree);
+ 
+ /* In tree-vect-data-refs.c.  */
+ extern bool vect_can_force_dr_alignment_p (const_tree, unsigned int);
+@@ -891,7 +896,7 @@
+    Additional pattern recognition functions can (and will) be added
+    in the future.  */
+ typedef gimple (* vect_recog_func_ptr) (VEC (gimple, heap) **, tree *, tree *);
+-#define NUM_PATTERNS 4
++#define NUM_PATTERNS 5
+ void vect_pattern_recog (loop_vec_info);
+ 
+ /* In tree-vectorizer.c.  */
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106802.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106802.patch
new file mode 100644
index 0000000..ade96fd
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106802.patch
@@ -0,0 +1,948 @@
+2011-09-12  Andrew Stubbs  <ams@codesourcery.com>
+
+	Backport from FSF mainline:
+
+	2011-08-30  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* config/arm/arm.c (optimal_immediate_sequence_1): Make b1, b2,
+	b3 and b4 unsigned.
+
+	2011-08-30  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* config/arm/arm.c (arm_gen_constant): Set can_negate correctly
+	when code is SET.
+
+	2011-08-26  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* config/arm/arm.c (struct four_ints): New type.
+	(count_insns_for_constant): Delete function.
+	(find_best_start): Delete function.
+	(optimal_immediate_sequence): New function.
+	(optimal_immediate_sequence_1): New function.
+	(arm_gen_constant): Move constant splitting code to
+	optimal_immediate_sequence.
+	Rewrite constant negation/invertion code.
+
+	gcc/testsuite/
+	* gcc.target/arm/thumb2-replicated-constant1.c: New file.
+	* gcc.target/arm/thumb2-replicated-constant2.c: New file.
+	* gcc.target/arm/thumb2-replicated-constant3.c: New file.
+	* gcc.target/arm/thumb2-replicated-constant4.c: New file.
+
+	2011-08-26  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* config/arm/arm-protos.h (const_ok_for_op): Add prototype.
+	* config/arm/arm.c (const_ok_for_op): Add support for addw/subw.
+	Remove prototype. Remove static function type.
+	* config/arm/arm.md (*arm_addsi3): Add addw/subw support.
+	Add arch attribute.
+	* config/arm/constraints.md (Pj, PJ): New constraints.
+
+	2011-04-20  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* config/arm/arm.c (arm_gen_constant): Move mowv support ....
+	(const_ok_for_op): ... to here.
+
+	2011-04-20  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* config/arm/arm.c (arm_gen_constant): Remove redundant can_invert.
+
+
+=== modified file 'gcc/config/arm/arm-protos.h'
+--- old/gcc/config/arm/arm-protos.h	2011-07-04 14:03:49 +0000
++++ new/gcc/config/arm/arm-protos.h	2011-08-25 13:26:58 +0000
+@@ -46,6 +46,7 @@
+ extern bool arm_small_register_classes_for_mode_p (enum machine_mode);
+ extern int arm_hard_regno_mode_ok (unsigned int, enum machine_mode);
+ extern int const_ok_for_arm (HOST_WIDE_INT);
++extern int const_ok_for_op (HOST_WIDE_INT, enum rtx_code);
+ extern int arm_split_constant (RTX_CODE, enum machine_mode, rtx,
+ 			       HOST_WIDE_INT, rtx, rtx, int);
+ extern RTX_CODE arm_canonicalize_comparison (RTX_CODE, rtx *, rtx *);
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-08-24 17:35:16 +0000
++++ new/gcc/config/arm/arm.c	2011-09-06 12:57:56 +0000
+@@ -63,6 +63,11 @@
+ 
+ void (*arm_lang_output_object_attributes_hook)(void);
+ 
++struct four_ints
++{
++  int i[4];
++};
++
+ /* Forward function declarations.  */
+ static bool arm_needs_doubleword_align (enum machine_mode, const_tree);
+ static int arm_compute_static_chain_stack_bytes (void);
+@@ -81,7 +86,6 @@
+ static bool arm_legitimate_address_p (enum machine_mode, rtx, bool);
+ static int thumb_far_jump_used_p (void);
+ static bool thumb_force_lr_save (void);
+-static int const_ok_for_op (HOST_WIDE_INT, enum rtx_code);
+ static rtx emit_sfm (int, int);
+ static unsigned arm_size_return_regs (void);
+ static bool arm_assemble_integer (rtx, unsigned int, int);
+@@ -129,7 +133,13 @@
+ static int arm_comp_type_attributes (const_tree, const_tree);
+ static void arm_set_default_type_attributes (tree);
+ static int arm_adjust_cost (rtx, rtx, rtx, int);
+-static int count_insns_for_constant (HOST_WIDE_INT, int);
++static int optimal_immediate_sequence (enum rtx_code code,
++				       unsigned HOST_WIDE_INT val,
++				       struct four_ints *return_sequence);
++static int optimal_immediate_sequence_1 (enum rtx_code code,
++					 unsigned HOST_WIDE_INT val,
++					 struct four_ints *return_sequence,
++					 int i);
+ static int arm_get_strip_length (int);
+ static bool arm_function_ok_for_sibcall (tree, tree);
+ static enum machine_mode arm_promote_function_mode (const_tree,
+@@ -2525,7 +2535,7 @@
+ }
+ 
+ /* Return true if I is a valid constant for the operation CODE.  */
+-static int
++int
+ const_ok_for_op (HOST_WIDE_INT i, enum rtx_code code)
+ {
+   if (const_ok_for_arm (i))
+@@ -2533,7 +2543,21 @@
+ 
+   switch (code)
+     {
++    case SET:
++      /* See if we can use movw.  */
++      if (arm_arch_thumb2 && (i & 0xffff0000) == 0)
++	return 1;
++      else
++	return 0;
++
+     case PLUS:
++      /* See if we can use addw or subw.  */
++      if (TARGET_THUMB2
++	  && ((i & 0xfffff000) == 0
++	      || ((-i) & 0xfffff000) == 0))
++	return 1;
++      /* else fall through.  */
++
+     case COMPARE:
+     case EQ:
+     case NE:
+@@ -2649,68 +2673,41 @@
+ 			   1);
+ }
+ 
+-/* Return the number of instructions required to synthesize the given
+-   constant, if we start emitting them from bit-position I.  */
+-static int
+-count_insns_for_constant (HOST_WIDE_INT remainder, int i)
+-{
+-  HOST_WIDE_INT temp1;
+-  int step_size = TARGET_ARM ? 2 : 1;
+-  int num_insns = 0;
+-
+-  gcc_assert (TARGET_ARM || i == 0);
+-
+-  do
+-    {
+-      int end;
+-
+-      if (i <= 0)
+-	i += 32;
+-      if (remainder & (((1 << step_size) - 1) << (i - step_size)))
+-	{
+-	  end = i - 8;
+-	  if (end < 0)
+-	    end += 32;
+-	  temp1 = remainder & ((0x0ff << end)
+-				    | ((i < end) ? (0xff >> (32 - end)) : 0));
+-	  remainder &= ~temp1;
+-	  num_insns++;
+-	  i -= 8 - step_size;
+-	}
+-      i -= step_size;
+-    } while (remainder);
+-  return num_insns;
+-}
+-
+-static int
+-find_best_start (unsigned HOST_WIDE_INT remainder)
++/* Return a sequence of integers, in RETURN_SEQUENCE that fit into
++   ARM/THUMB2 immediates, and add up to VAL.
++   Thr function return value gives the number of insns required.  */
++static int
++optimal_immediate_sequence (enum rtx_code code, unsigned HOST_WIDE_INT val,
++			    struct four_ints *return_sequence)
+ {
+   int best_consecutive_zeros = 0;
+   int i;
+   int best_start = 0;
++  int insns1, insns2;
++  struct four_ints tmp_sequence;
+ 
+   /* If we aren't targetting ARM, the best place to start is always at
+-     the bottom.  */
+-  if (! TARGET_ARM)
+-    return 0;
+-
+-  for (i = 0; i < 32; i += 2)
++     the bottom, otherwise look more closely.  */
++  if (TARGET_ARM)
+     {
+-      int consecutive_zeros = 0;
+-
+-      if (!(remainder & (3 << i)))
++      for (i = 0; i < 32; i += 2)
+ 	{
+-	  while ((i < 32) && !(remainder & (3 << i)))
+-	    {
+-	      consecutive_zeros += 2;
+-	      i += 2;
+-	    }
+-	  if (consecutive_zeros > best_consecutive_zeros)
+-	    {
+-	      best_consecutive_zeros = consecutive_zeros;
+-	      best_start = i - consecutive_zeros;
+-	    }
+-	  i -= 2;
++	  int consecutive_zeros = 0;
++
++	  if (!(val & (3 << i)))
++	    {
++	      while ((i < 32) && !(val & (3 << i)))
++		{
++		  consecutive_zeros += 2;
++		  i += 2;
++		}
++	      if (consecutive_zeros > best_consecutive_zeros)
++		{
++		  best_consecutive_zeros = consecutive_zeros;
++		  best_start = i - consecutive_zeros;
++		}
++	      i -= 2;
++	    }
+ 	}
+     }
+ 
+@@ -2737,13 +2734,161 @@
+      the constant starting from `best_start', and also starting from
+      zero (i.e. with bit 31 first to be output).  If `best_start' doesn't
+      yield a shorter sequence, we may as well use zero.  */
++  insns1 = optimal_immediate_sequence_1 (code, val, return_sequence, best_start);
+   if (best_start != 0
+-      && ((((unsigned HOST_WIDE_INT) 1) << best_start) < remainder)
+-      && (count_insns_for_constant (remainder, 0) <=
+-	  count_insns_for_constant (remainder, best_start)))
+-    best_start = 0;
+-
+-  return best_start;
++      && ((((unsigned HOST_WIDE_INT) 1) << best_start) < val))
++    {
++      insns2 = optimal_immediate_sequence_1 (code, val, &tmp_sequence, 0);
++      if (insns2 <= insns1)
++	{
++	  *return_sequence = tmp_sequence;
++	  insns1 = insns2;
++	}
++    }
++
++  return insns1;
++}
++
++/* As for optimal_immediate_sequence, but starting at bit-position I.  */
++static int
++optimal_immediate_sequence_1 (enum rtx_code code, unsigned HOST_WIDE_INT val,
++			     struct four_ints *return_sequence, int i)
++{
++  int remainder = val & 0xffffffff;
++  int insns = 0;
++
++  /* Try and find a way of doing the job in either two or three
++     instructions.
++     
++     In ARM mode we can use 8-bit constants, rotated to any 2-bit aligned
++     location.  We start at position I.  This may be the MSB, or
++     optimial_immediate_sequence may have positioned it at the largest block 
++     of zeros that are aligned on a 2-bit boundary. We then fill up the temps,
++     wrapping around to the top of the word when we drop off the bottom.
++     In the worst case this code should produce no more than four insns.
++
++     In Thumb2 mode, we can use 32/16-bit replicated constants, and 8-bit
++     constants, shifted to any arbitrary location.  We should always start
++     at the MSB.  */
++  do
++    {
++      int end;
++      unsigned int b1, b2, b3, b4;
++      unsigned HOST_WIDE_INT result;
++      int loc;
++
++      gcc_assert (insns < 4);
++
++      if (i <= 0)
++	i += 32;
++
++      /* First, find the next normal 12/8-bit shifted/rotated immediate.  */
++      if (remainder & ((TARGET_ARM ? (3 << (i - 2)) : (1 << (i - 1)))))
++	{
++	  loc = i;
++	  if (i <= 12 && TARGET_THUMB2 && code == PLUS)
++	    /* We can use addw/subw for the last 12 bits.  */
++	    result = remainder;
++	  else
++	    {
++	      /* Use an 8-bit shifted/rotated immediate.  */
++	      end = i - 8;
++	      if (end < 0)
++		end += 32;
++	      result = remainder & ((0x0ff << end)
++				   | ((i < end) ? (0xff >> (32 - end))
++						: 0));
++	      i -= 8;
++	    }
++	}
++      else
++	{
++	  /* Arm allows rotates by a multiple of two. Thumb-2 allows
++	     arbitrary shifts.  */
++	  i -= TARGET_ARM ? 2 : 1;
++	  continue;
++	}
++
++      /* Next, see if we can do a better job with a thumb2 replicated
++	 constant.
++       
++         We do it this way around to catch the cases like 0x01F001E0 where
++	 two 8-bit immediates would work, but a replicated constant would
++	 make it worse.
++       
++         TODO: 16-bit constants that don't clear all the bits, but still win.
++         TODO: Arithmetic splitting for set/add/sub, rather than bitwise.  */
++      if (TARGET_THUMB2)
++	{
++	  b1 = (remainder & 0xff000000) >> 24;
++	  b2 = (remainder & 0x00ff0000) >> 16;
++	  b3 = (remainder & 0x0000ff00) >> 8;
++	  b4 = remainder & 0xff;
++
++	  if (loc > 24)
++	    {
++	      /* The 8-bit immediate already found clears b1 (and maybe b2),
++		 but must leave b3 and b4 alone.  */
++
++	      /* First try to find a 32-bit replicated constant that clears
++		 almost everything.  We can assume that we can't do it in one,
++		 or else we wouldn't be here.  */
++	      unsigned int tmp = b1 & b2 & b3 & b4;
++	      unsigned int tmp2 = tmp + (tmp << 8) + (tmp << 16)
++				  + (tmp << 24);
++	      unsigned int matching_bytes = (tmp == b1) + (tmp == b2)
++					    + (tmp == b3) + (tmp == b4);
++	      if (tmp
++		  && (matching_bytes >= 3
++		      || (matching_bytes == 2
++			  && const_ok_for_op (remainder & ~tmp2, code))))
++		{
++		  /* At least 3 of the bytes match, and the fourth has at 
++		     least as many bits set, or two of the bytes match
++		     and it will only require one more insn to finish.  */
++		  result = tmp2;
++		  i = tmp != b1 ? 32
++		      : tmp != b2 ? 24
++		      : tmp != b3 ? 16
++		      : 8;
++		}
++
++	      /* Second, try to find a 16-bit replicated constant that can
++		 leave three of the bytes clear.  If b2 or b4 is already
++		 zero, then we can.  If the 8-bit from above would not
++		 clear b2 anyway, then we still win.  */
++	      else if (b1 == b3 && (!b2 || !b4
++			       || (remainder & 0x00ff0000 & ~result)))
++		{
++		  result = remainder & 0xff00ff00;
++		  i = 24;
++		}
++	    }
++	  else if (loc > 16)
++	    {
++	      /* The 8-bit immediate already found clears b2 (and maybe b3)
++		 and we don't get here unless b1 is alredy clear, but it will
++		 leave b4 unchanged.  */
++
++	      /* If we can clear b2 and b4 at once, then we win, since the
++		 8-bits couldn't possibly reach that far.  */
++	      if (b2 == b4)
++		{
++		  result = remainder & 0x00ff00ff;
++		  i = 16;
++		}
++	    }
++	}
++
++      return_sequence->i[insns++] = result;
++      remainder &= ~result;
++
++      if (code == SET || code == MINUS)
++	code = PLUS;
++    }
++  while (remainder);
++
++  return insns;
+ }
+ 
+ /* Emit an instruction with the indicated PATTERN.  If COND is
+@@ -2760,7 +2905,6 @@
+ 
+ /* As above, but extra parameter GENERATE which, if clear, suppresses
+    RTL generation.  */
+-/* ??? This needs more work for thumb2.  */
+ 
+ static int
+ arm_gen_constant (enum rtx_code code, enum machine_mode mode, rtx cond,
+@@ -2772,15 +2916,15 @@
+   int final_invert = 0;
+   int can_negate_initial = 0;
+   int i;
+-  int num_bits_set = 0;
+   int set_sign_bit_copies = 0;
+   int clear_sign_bit_copies = 0;
+   int clear_zero_bit_copies = 0;
+   int set_zero_bit_copies = 0;
+-  int insns = 0;
++  int insns = 0, neg_insns, inv_insns;
+   unsigned HOST_WIDE_INT temp1, temp2;
+   unsigned HOST_WIDE_INT remainder = val & 0xffffffff;
+-  int step_size = TARGET_ARM ? 2 : 1;
++  struct four_ints *immediates;
++  struct four_ints pos_immediates, neg_immediates, inv_immediates;
+ 
+   /* Find out which operations are safe for a given CODE.  Also do a quick
+      check for degenerate cases; these can occur when DImode operations
+@@ -2789,7 +2933,6 @@
+     {
+     case SET:
+       can_invert = 1;
+-      can_negate = 1;
+       break;
+ 
+     case PLUS:
+@@ -2817,9 +2960,6 @@
+ 				gen_rtx_SET (VOIDmode, target, source));
+ 	  return 1;
+ 	}
+-
+-      if (TARGET_THUMB2)
+-	can_invert = 1;
+       break;
+ 
+     case AND:
+@@ -2861,6 +3001,7 @@
+ 					     gen_rtx_NOT (mode, source)));
+ 	  return 1;
+ 	}
++      final_invert = 1;
+       break;
+ 
+     case MINUS:
+@@ -2883,7 +3024,6 @@
+ 							    source)));
+ 	  return 1;
+ 	}
+-      can_negate = 1;
+ 
+       break;
+ 
+@@ -2892,9 +3032,7 @@
+     }
+ 
+   /* If we can do it in one insn get out quickly.  */
+-  if (const_ok_for_arm (val)
+-      || (can_negate_initial && const_ok_for_arm (-val))
+-      || (can_invert && const_ok_for_arm (~val)))
++  if (const_ok_for_op (val, code))
+     {
+       if (generate)
+ 	emit_constant_insn (cond,
+@@ -2947,15 +3085,6 @@
+   switch (code)
+     {
+     case SET:
+-      /* See if we can use movw.  */
+-      if (arm_arch_thumb2 && (remainder & 0xffff0000) == 0)
+-	{
+-	  if (generate)
+-	    emit_constant_insn (cond, gen_rtx_SET (VOIDmode, target,
+-						   GEN_INT (val)));
+-	  return 1;
+-	}
+-
+       /* See if we can do this by sign_extending a constant that is known
+ 	 to be negative.  This is a good, way of doing it, since the shift
+ 	 may well merge into a subsequent insn.  */
+@@ -3306,121 +3435,97 @@
+       break;
+     }
+ 
+-  for (i = 0; i < 32; i++)
+-    if (remainder & (1 << i))
+-      num_bits_set++;
+-
+-  if ((code == AND)
+-      || (code != IOR && can_invert && num_bits_set > 16))
+-    remainder ^= 0xffffffff;
+-  else if (code == PLUS && num_bits_set > 16)
+-    remainder = (-remainder) & 0xffffffff;
+-
+-  /* For XOR, if more than half the bits are set and there's a sequence
+-     of more than 8 consecutive ones in the pattern then we can XOR by the
+-     inverted constant and then invert the final result; this may save an
+-     instruction and might also lead to the final mvn being merged with
+-     some other operation.  */
+-  else if (code == XOR && num_bits_set > 16
+-	   && (count_insns_for_constant (remainder ^ 0xffffffff,
+-					 find_best_start
+-					 (remainder ^ 0xffffffff))
+-	       < count_insns_for_constant (remainder,
+-					   find_best_start (remainder))))
+-    {
+-      remainder ^= 0xffffffff;
+-      final_invert = 1;
++  /* Calculate what the instruction sequences would be if we generated it
++     normally, negated, or inverted.  */
++  if (code == AND)
++    /* AND cannot be split into multiple insns, so invert and use BIC.  */
++    insns = 99;
++  else
++    insns = optimal_immediate_sequence (code, remainder, &pos_immediates);
++
++  if (can_negate)
++    neg_insns = optimal_immediate_sequence (code, (-remainder) & 0xffffffff,
++					    &neg_immediates);
++  else
++    neg_insns = 99;
++
++  if (can_invert || final_invert)
++    inv_insns = optimal_immediate_sequence (code, remainder ^ 0xffffffff,
++					    &inv_immediates);
++  else
++    inv_insns = 99;
++
++  immediates = &pos_immediates;
++
++  /* Is the negated immediate sequence more efficient?  */
++  if (neg_insns < insns && neg_insns <= inv_insns)
++    {
++      insns = neg_insns;
++      immediates = &neg_immediates;
++    }
++  else
++    can_negate = 0;
++
++  /* Is the inverted immediate sequence more efficient?
++     We must allow for an extra NOT instruction for XOR operations, although
++     there is some chance that the final 'mvn' will get optimized later.  */
++  if ((inv_insns + 1) < insns || (!final_invert && inv_insns < insns))
++    {
++      insns = inv_insns;
++      immediates = &inv_immediates;
+     }
+   else
+     {
+       can_invert = 0;
+-      can_negate = 0;
++      final_invert = 0;
+     }
+ 
+-  /* Now try and find a way of doing the job in either two or three
+-     instructions.
+-     We start by looking for the largest block of zeros that are aligned on
+-     a 2-bit boundary, we then fill up the temps, wrapping around to the
+-     top of the word when we drop off the bottom.
+-     In the worst case this code should produce no more than four insns.
+-     Thumb-2 constants are shifted, not rotated, so the MSB is always the
+-     best place to start.  */
+-
+-  /* ??? Use thumb2 replicated constants when the high and low halfwords are
+-     the same.  */
+-  {
+-    /* Now start emitting the insns.  */
+-    i = find_best_start (remainder);
+-    do
+-      {
+-	int end;
+-
+-	if (i <= 0)
+-	  i += 32;
+-	if (remainder & (3 << (i - 2)))
+-	  {
+-	    end = i - 8;
+-	    if (end < 0)
+-	      end += 32;
+-	    temp1 = remainder & ((0x0ff << end)
+-				 | ((i < end) ? (0xff >> (32 - end)) : 0));
+-	    remainder &= ~temp1;
+-
+-	    if (generate)
+-	      {
+-		rtx new_src, temp1_rtx;
+-
+-		if (code == SET || code == MINUS)
+-		  {
+-		    new_src = (subtargets ? gen_reg_rtx (mode) : target);
+-		    if (can_invert && code != MINUS)
+-		      temp1 = ~temp1;
+-		  }
+-		else
+-		  {
+-		    if ((final_invert || remainder) && subtargets)
+-		      new_src = gen_reg_rtx (mode);
+-		    else
+-		      new_src = target;
+-		    if (can_invert)
+-		      temp1 = ~temp1;
+-		    else if (can_negate)
+-		      temp1 = -temp1;
+-		  }
+-
+-		temp1 = trunc_int_for_mode (temp1, mode);
+-		temp1_rtx = GEN_INT (temp1);
+-
+-		if (code == SET)
+-		  ;
+-		else if (code == MINUS)
+-		  temp1_rtx = gen_rtx_MINUS (mode, temp1_rtx, source);
+-		else
+-		  temp1_rtx = gen_rtx_fmt_ee (code, mode, source, temp1_rtx);
+-
+-		emit_constant_insn (cond,
+-				    gen_rtx_SET (VOIDmode, new_src,
+-						 temp1_rtx));
+-		source = new_src;
+-	      }
+-
+-	    if (code == SET)
+-	      {
+-		can_invert = 0;
+-		code = PLUS;
+-	      }
+-	    else if (code == MINUS)
++  /* Now output the chosen sequence as instructions.  */
++  if (generate)
++    {
++      for (i = 0; i < insns; i++)
++	{
++	  rtx new_src, temp1_rtx;
++
++	  temp1 = immediates->i[i];
++
++	  if (code == SET || code == MINUS)
++	    new_src = (subtargets ? gen_reg_rtx (mode) : target);
++	  else if ((final_invert || i < (insns - 1)) && subtargets)
++	    new_src = gen_reg_rtx (mode);
++	  else
++	    new_src = target;
++
++	  if (can_invert)
++	    temp1 = ~temp1;
++	  else if (can_negate)
++	    temp1 = -temp1;
++
++	  temp1 = trunc_int_for_mode (temp1, mode);
++	  temp1_rtx = GEN_INT (temp1);
++
++	  if (code == SET)
++	    ;
++	  else if (code == MINUS)
++	    temp1_rtx = gen_rtx_MINUS (mode, temp1_rtx, source);
++	  else
++	    temp1_rtx = gen_rtx_fmt_ee (code, mode, source, temp1_rtx);
++
++	  emit_constant_insn (cond,
++			      gen_rtx_SET (VOIDmode, new_src,
++					   temp1_rtx));
++	  source = new_src;
++
++	  if (code == SET)
++	    {
++	      can_negate = can_invert;
++	      can_invert = 0;
+ 	      code = PLUS;
+-
+-	    insns++;
+-	    i -= 8 - step_size;
+-	  }
+-	/* Arm allows rotates by a multiple of two. Thumb-2 allows arbitrary
+-	   shifts.  */
+-	i -= step_size;
+-      }
+-    while (remainder);
+-  }
++	    }
++	  else if (code == MINUS)
++	    code = PLUS;
++	}
++    }
+ 
+   if (final_invert)
+     {
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-08-25 11:42:09 +0000
++++ new/gcc/config/arm/arm.md	2011-08-25 13:26:58 +0000
+@@ -701,21 +701,24 @@
+ ;;  (plus (reg rN) (reg sp)) into (reg rN).  In this case reload will
+ ;; put the duplicated register first, and not try the commutative version.
+ (define_insn_and_split "*arm_addsi3"
+-  [(set (match_operand:SI          0 "s_register_operand" "=r, k,r,r, k,r")
+-	(plus:SI (match_operand:SI 1 "s_register_operand" "%rk,k,r,rk,k,rk")
+-		 (match_operand:SI 2 "reg_or_int_operand" "rI,rI,k,L, L,?n")))]
++  [(set (match_operand:SI          0 "s_register_operand" "=r, k,r,r, k, r, k,r, k, r")
++	(plus:SI (match_operand:SI 1 "s_register_operand" "%rk,k,r,rk,k, rk,k,rk,k, rk")
++		 (match_operand:SI 2 "reg_or_int_operand" "rI,rI,k,Pj,Pj,L, L,PJ,PJ,?n")))]
+   "TARGET_32BIT"
+   "@
+    add%?\\t%0, %1, %2
+    add%?\\t%0, %1, %2
+    add%?\\t%0, %2, %1
+-   sub%?\\t%0, %1, #%n2
+-   sub%?\\t%0, %1, #%n2
++   addw%?\\t%0, %1, %2
++   addw%?\\t%0, %1, %2
++   sub%?\\t%0, %1, #%n2
++   sub%?\\t%0, %1, #%n2
++   subw%?\\t%0, %1, #%n2
++   subw%?\\t%0, %1, #%n2
+    #"
+   "TARGET_32BIT
+    && GET_CODE (operands[2]) == CONST_INT
+-   && !(const_ok_for_arm (INTVAL (operands[2]))
+-        || const_ok_for_arm (-INTVAL (operands[2])))
++   && !const_ok_for_op (INTVAL (operands[2]), PLUS)
+    && (reload_completed || !arm_eliminable_register (operands[1]))"
+   [(clobber (const_int 0))]
+   "
+@@ -724,8 +727,9 @@
+ 		      operands[1], 0);
+   DONE;
+   "
+-  [(set_attr "length" "4,4,4,4,4,16")
+-   (set_attr "predicable" "yes")]
++  [(set_attr "length" "4,4,4,4,4,4,4,4,4,16")
++   (set_attr "predicable" "yes")
++   (set_attr "arch" "*,*,*,t2,t2,*,*,t2,t2,*")]
+ )
+ 
+ (define_insn_and_split "*thumb1_addsi3"
+
+=== modified file 'gcc/config/arm/constraints.md'
+--- old/gcc/config/arm/constraints.md	2011-01-03 20:52:22 +0000
++++ new/gcc/config/arm/constraints.md	2011-08-25 13:26:58 +0000
+@@ -31,7 +31,7 @@
+ ;; The following multi-letter normal constraints have been used:
+ ;; in ARM/Thumb-2 state: Da, Db, Dc, Dn, Dl, DL, Dv, Dy, Di, Dz
+ ;; in Thumb-1 state: Pa, Pb, Pc, Pd
+-;; in Thumb-2 state: Ps, Pt, Pu, Pv, Pw, Px
++;; in Thumb-2 state: Pj, PJ, Ps, Pt, Pu, Pv, Pw, Px
+ 
+ ;; The following memory constraints have been used:
+ ;; in ARM/Thumb-2 state: Q, Ut, Uv, Uy, Un, Um, Us
+@@ -74,6 +74,18 @@
+ 	   (and (match_code "const_int")
+                 (match_test "(ival & 0xffff0000) == 0")))))
+ 
++(define_constraint "Pj"
++ "@internal A 12-bit constant suitable for an ADDW or SUBW instruction. (Thumb-2)"
++ (and (match_code "const_int")
++      (and (match_test "TARGET_THUMB2")
++	   (match_test "(ival & 0xfffff000) == 0"))))
++
++(define_constraint "PJ"
++ "@internal A constant that satisfies the Pj constrant if negated."
++ (and (match_code "const_int")
++      (and (match_test "TARGET_THUMB2")
++	   (match_test "((-ival) & 0xfffff000) == 0"))))
++
+ (define_register_constraint "k" "STACK_REG"
+  "@internal The stack register.")
+ 
+
+=== added file 'gcc/testsuite/gcc.target/arm/thumb2-replicated-constant1.c'
+--- old/gcc/testsuite/gcc.target/arm/thumb2-replicated-constant1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/thumb2-replicated-constant1.c	2011-08-25 13:31:00 +0000
+@@ -0,0 +1,27 @@
++/* Ensure simple replicated constant immediates work.  */
++/* { dg-options "-mthumb -O2" } */
++/* { dg-require-effective-target arm_thumb2_ok } */
++
++int
++foo1 (int a)
++{
++  return a + 0xfefefefe;
++}
++
++/* { dg-final { scan-assembler "add.*#-16843010" } } */
++
++int
++foo2 (int a)
++{
++  return a - 0xab00ab00;
++}
++
++/* { dg-final { scan-assembler "sub.*#-1426019584" } } */
++
++int
++foo3 (int a)
++{
++  return a & 0x00cd00cd;
++}
++
++/* { dg-final { scan-assembler "and.*#13435085" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/thumb2-replicated-constant2.c'
+--- old/gcc/testsuite/gcc.target/arm/thumb2-replicated-constant2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/thumb2-replicated-constant2.c	2011-08-25 13:31:00 +0000
+@@ -0,0 +1,75 @@
++/* Ensure split constants can use replicated patterns.  */
++/* { dg-options "-mthumb -O2" } */
++/* { dg-require-effective-target arm_thumb2_ok } */
++
++int
++foo1 (int a)
++{
++  return a + 0xfe00fe01;
++}
++
++/* { dg-final { scan-assembler "add.*#-33489408" } } */
++/* { dg-final { scan-assembler "add.*#1" } } */
++
++int
++foo2 (int a)
++{
++  return a + 0xdd01dd00;
++}
++
++/* { dg-final { scan-assembler "add.*#-587145984" } } */
++/* { dg-final { scan-assembler "add.*#65536" } } */
++
++int
++foo3 (int a)
++{
++  return a + 0x00443344;
++}
++
++/* { dg-final { scan-assembler "add.*#4456516" } } */
++/* { dg-final { scan-assembler "add.*#13056" } } */
++
++int
++foo4 (int a)
++{
++  return a + 0x77330033;
++}
++
++/* { dg-final { scan-assembler "add.*#1996488704" } } */
++/* { dg-final { scan-assembler "add.*#3342387" } } */
++
++int
++foo5 (int a)
++{
++  return a + 0x11221122;
++}
++
++/* { dg-final { scan-assembler "add.*#285217024" } } */
++/* { dg-final { scan-assembler "add.*#2228258" } } */
++
++int
++foo6 (int a)
++{
++  return a + 0x66666677;
++}
++
++/* { dg-final { scan-assembler "add.*#1717986918" } } */
++/* { dg-final { scan-assembler "add.*#17" } } */
++
++int
++foo7 (int a)
++{
++  return a + 0x99888888;
++}
++
++/* { dg-final { scan-assembler "add.*#-2004318072" } } */
++/* { dg-final { scan-assembler "add.*#285212672" } } */
++
++int
++foo8 (int a)
++{
++  return a + 0xdddddfff;
++}
++
++/* { dg-final { scan-assembler "add.*#-572662307" } } */
++/* { dg-final { scan-assembler "addw.*#546" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/thumb2-replicated-constant3.c'
+--- old/gcc/testsuite/gcc.target/arm/thumb2-replicated-constant3.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/thumb2-replicated-constant3.c	2011-08-25 13:31:00 +0000
+@@ -0,0 +1,28 @@
++/* Ensure negated/inverted replicated constant immediates work.  */
++/* { dg-options "-mthumb -O2" } */
++/* { dg-require-effective-target arm_thumb2_ok } */
++
++int
++foo1 (int a)
++{
++  return a | 0xffffff00;
++}
++
++/* { dg-final { scan-assembler "orn.*#255" } } */
++
++int
++foo2 (int a)
++{
++  return a & 0xffeeffee;
++}
++
++/* { dg-final { scan-assembler "bic.*#1114129" } } */
++
++int
++foo3 (int a)
++{
++  return a & 0xaaaaaa00;
++}
++
++/* { dg-final { scan-assembler "and.*#-1431655766" } } */
++/* { dg-final { scan-assembler "bic.*#170" } } */
+
+=== added file 'gcc/testsuite/gcc.target/arm/thumb2-replicated-constant4.c'
+--- old/gcc/testsuite/gcc.target/arm/thumb2-replicated-constant4.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/thumb2-replicated-constant4.c	2011-08-25 13:31:00 +0000
+@@ -0,0 +1,22 @@
++/* Ensure replicated constants don't make things worse.  */
++/* { dg-options "-mthumb -O2" } */
++/* { dg-require-effective-target arm_thumb2_ok } */
++
++int
++foo1 (int a)
++{
++  /* It might be tempting to use 0x01000100, but it wouldn't help. */
++  return a + 0x01f001e0;
++}
++
++/* { dg-final { scan-assembler "add.*#32505856" } } */
++/* { dg-final { scan-assembler "add.*#480" } } */
++
++int
++foo2 (int a)
++{
++  return a + 0x0f100e10;
++}
++
++/* { dg-final { scan-assembler "add.*#252706816" } } */
++/* { dg-final { scan-assembler "add.*#3600" } } */
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106803.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106803.patch
new file mode 100644
index 0000000..5b36959
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106803.patch
@@ -0,0 +1,201 @@
+2011-09-12  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	PR target/49030
+	* config/arm/arm-protos.h (maybe_get_arm_condition_code): Declare.
+	* config/arm/arm.c (maybe_get_arm_condition_code): New function,
+	reusing the old code from get_arm_condition_code.  Return ARM_NV
+	for invalid comparison codes.
+	(get_arm_condition_code): Redefine in terms of
+	maybe_get_arm_condition_code.
+	* config/arm/predicates.md (arm_comparison_operator): Use
+	maybe_get_arm_condition_code.
+
+	gcc/testsuite/
+	PR target/49030
+	* gcc.dg/torture/pr49030.c: New test.
+
+=== modified file 'gcc/config/arm/arm-protos.h'
+--- old/gcc/config/arm/arm-protos.h	2011-08-25 13:26:58 +0000
++++ new/gcc/config/arm/arm-protos.h	2011-09-12 11:03:11 +0000
+@@ -179,6 +179,7 @@
+ #endif
+ extern int thumb_shiftable_const (unsigned HOST_WIDE_INT);
+ #ifdef RTX_CODE
++extern enum arm_cond_code maybe_get_arm_condition_code (rtx);
+ extern void thumb1_final_prescan_insn (rtx);
+ extern void thumb2_final_prescan_insn (rtx);
+ extern const char *thumb_load_double_from_address (rtx *);
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-09-06 12:57:56 +0000
++++ new/gcc/config/arm/arm.c	2011-09-12 11:03:11 +0000
+@@ -17494,10 +17494,10 @@
+    decremented/zeroed by arm_asm_output_opcode as the insns are output.  */
+ 
+ /* Returns the index of the ARM condition code string in
+-   `arm_condition_codes'.  COMPARISON should be an rtx like
+-   `(eq (...) (...))'.  */
+-static enum arm_cond_code
+-get_arm_condition_code (rtx comparison)
++   `arm_condition_codes', or ARM_NV if the comparison is invalid.
++   COMPARISON should be an rtx like `(eq (...) (...))'.  */
++enum arm_cond_code
++maybe_get_arm_condition_code (rtx comparison)
+ {
+   enum machine_mode mode = GET_MODE (XEXP (comparison, 0));
+   enum arm_cond_code code;
+@@ -17521,11 +17521,11 @@
+     case CC_DLTUmode: code = ARM_CC;
+ 
+     dominance:
+-      gcc_assert (comp_code == EQ || comp_code == NE);
+-
+       if (comp_code == EQ)
+ 	return ARM_INVERSE_CONDITION_CODE (code);
+-      return code;
++      if (comp_code == NE)
++	return code;
++      return ARM_NV;
+ 
+     case CC_NOOVmode:
+       switch (comp_code)
+@@ -17534,7 +17534,7 @@
+ 	case EQ: return ARM_EQ;
+ 	case GE: return ARM_PL;
+ 	case LT: return ARM_MI;
+-	default: gcc_unreachable ();
++	default: return ARM_NV;
+ 	}
+ 
+     case CC_Zmode:
+@@ -17542,7 +17542,7 @@
+ 	{
+ 	case NE: return ARM_NE;
+ 	case EQ: return ARM_EQ;
+-	default: gcc_unreachable ();
++	default: return ARM_NV;
+ 	}
+ 
+     case CC_Nmode:
+@@ -17550,7 +17550,7 @@
+ 	{
+ 	case NE: return ARM_MI;
+ 	case EQ: return ARM_PL;
+-	default: gcc_unreachable ();
++	default: return ARM_NV;
+ 	}
+ 
+     case CCFPEmode:
+@@ -17575,7 +17575,7 @@
+ 	  /* UNEQ and LTGT do not have a representation.  */
+ 	case UNEQ: /* Fall through.  */
+ 	case LTGT: /* Fall through.  */
+-	default: gcc_unreachable ();
++	default: return ARM_NV;
+ 	}
+ 
+     case CC_SWPmode:
+@@ -17591,7 +17591,7 @@
+ 	case GTU: return ARM_CC;
+ 	case LEU: return ARM_CS;
+ 	case LTU: return ARM_HI;
+-	default: gcc_unreachable ();
++	default: return ARM_NV;
+ 	}
+ 
+     case CC_Cmode:
+@@ -17599,7 +17599,7 @@
+ 	{
+ 	case LTU: return ARM_CS;
+ 	case GEU: return ARM_CC;
+-	default: gcc_unreachable ();
++	default: return ARM_NV;
+ 	}
+ 
+     case CC_CZmode:
+@@ -17611,7 +17611,7 @@
+ 	case GTU: return ARM_HI;
+ 	case LEU: return ARM_LS;
+ 	case LTU: return ARM_CC;
+-	default: gcc_unreachable ();
++	default: return ARM_NV;
+ 	}
+ 
+     case CC_NCVmode:
+@@ -17621,7 +17621,7 @@
+ 	case LT: return ARM_LT;
+ 	case GEU: return ARM_CS;
+ 	case LTU: return ARM_CC;
+-	default: gcc_unreachable ();
++	default: return ARM_NV;
+ 	}
+ 
+     case CCmode:
+@@ -17637,13 +17637,22 @@
+ 	case GTU: return ARM_HI;
+ 	case LEU: return ARM_LS;
+ 	case LTU: return ARM_CC;
+-	default: gcc_unreachable ();
++	default: return ARM_NV;
+ 	}
+ 
+     default: gcc_unreachable ();
+     }
+ }
+ 
++/* Like maybe_get_arm_condition_code, but never return ARM_NV.  */
++static enum arm_cond_code
++get_arm_condition_code (rtx comparison)
++{
++  enum arm_cond_code code = maybe_get_arm_condition_code (comparison);
++  gcc_assert (code != ARM_NV);
++  return code;
++}
++
+ /* Tell arm_asm_output_opcode to output IT blocks for conditionally executed
+    instructions.  */
+ void
+
+=== modified file 'gcc/config/arm/predicates.md'
+--- old/gcc/config/arm/predicates.md	2011-08-13 08:40:36 +0000
++++ new/gcc/config/arm/predicates.md	2011-09-05 09:40:19 +0000
+@@ -242,10 +242,9 @@
+ ;; True for integer comparisons and, if FP is active, for comparisons
+ ;; other than LTGT or UNEQ.
+ (define_special_predicate "arm_comparison_operator"
+-  (ior (match_code "eq,ne,le,lt,ge,gt,geu,gtu,leu,ltu")
+-       (and (match_test "TARGET_32BIT && TARGET_HARD_FLOAT
+-			 && (TARGET_FPA || TARGET_VFP)")
+-            (match_code "unordered,ordered,unlt,unle,unge,ungt"))))
++  (and (match_code "eq,ne,le,lt,ge,gt,geu,gtu,leu,ltu,
++		    unordered,ordered,unlt,unle,unge,ungt")
++       (match_test "maybe_get_arm_condition_code (op) != ARM_NV")))
+ 
+ (define_special_predicate "lt_ge_comparison_operator"
+   (match_code "lt,ge"))
+
+=== added file 'gcc/testsuite/gcc.dg/torture/pr49030.c'
+--- old/gcc/testsuite/gcc.dg/torture/pr49030.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/torture/pr49030.c	2011-09-05 09:40:19 +0000
+@@ -0,0 +1,19 @@
++void
++sample_move_d32u24_sS (char *dst, float *src, unsigned long nsamples,
++		       unsigned long dst_skip)
++{
++  long long y;
++  while (nsamples--)
++    {
++      y = (long long) (*src * 8388608.0f) << 8;
++      if (y > 2147483647) {
++	*(int *) dst = 2147483647;
++      } else if (y < -2147483647 - 1) {
++	*(int *) dst = -2147483647 - 1;
++      } else {
++	*(int *) dst = (int) y;
++      }
++      dst += dst_skip;
++      src++;
++    }
++}
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106804.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106804.patch
new file mode 100644
index 0000000..09d0767
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106804.patch
@@ -0,0 +1,38 @@
+2011-09-01  Andrew Stubbs  <ams@codesourcery.com>
+
+	gcc/
+	* config/arm/predicates.md (shift_amount_operand): Ensure shift
+	amount is positive.
+
+	gcc/testsuite/
+	* gcc.dg/pr50193-1.c: New file.
+
+=== modified file 'gcc/config/arm/predicates.md'
+--- old/gcc/config/arm/predicates.md	2011-09-05 09:40:19 +0000
++++ new/gcc/config/arm/predicates.md	2011-09-12 11:24:34 +0000
+@@ -132,7 +132,8 @@
+ (define_predicate "shift_amount_operand"
+   (ior (and (match_test "TARGET_ARM")
+ 	    (match_operand 0 "s_register_operand"))
+-       (match_operand 0 "const_int_operand")))
++       (and (match_operand 0 "const_int_operand")
++	    (match_test "INTVAL (op) > 0"))))
+ 
+ (define_predicate "arm_add_operand"
+   (ior (match_operand 0 "arm_rhs_operand")
+
+=== added file 'gcc/testsuite/gcc.dg/pr50193-1.c'
+--- old/gcc/testsuite/gcc.dg/pr50193-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/pr50193-1.c	2011-09-01 12:22:14 +0000
+@@ -0,0 +1,10 @@
++/* PR 50193: ARM: ICE on a | (b << negative-constant) */
++/* Ensure that the compiler doesn't ICE.  */
++
++/* { dg-options "-O2" } */
++
++int
++foo(int a, int b)
++{
++  return a | (b << -3); /* { dg-warning "left shift count is negative" } */
++}
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106805.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106805.patch
new file mode 100644
index 0000000..5dec32f
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106805.patch
@@ -0,0 +1,47 @@
+2011-09-12  Andrew Stubbs  <ams@codesourcery.com>
+
+	Backport from FSF mainline:
+
+	2011-09-08  Andrew Stubbs  <ams@codesourcery.com>
+
+	PR tree-optimization/50318
+
+	gcc/
+	* tree-ssa-math-opts.c (convert_plusminus_to_widen): Correct
+	typo in use of mult_rhs1 and mult_rhs2.
+
+	gcc/testsuite/
+	* gcc.target/arm/pr50318-1.c: New file.
+
+=== added file 'gcc/testsuite/gcc.target/arm/pr50318-1.c'
+--- old/gcc/testsuite/gcc.target/arm/pr50318-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/pr50318-1.c	2011-09-08 20:11:43 +0000
+@@ -0,0 +1,11 @@
++/* { dg-do compile } */
++/* { dg-options "-O2" } */
++/* { dg-require-effective-target arm_dsp } */
++
++long long test (unsigned int sec, unsigned long long nsecs)
++{
++   return (long long)(long)sec * 1000000000L + (long long)(unsigned
++   long)nsecs;
++}
++
++/* { dg-final { scan-assembler "umlal" } } */
+
+=== modified file 'gcc/tree-ssa-math-opts.c'
+--- old/gcc/tree-ssa-math-opts.c	2011-08-09 10:26:48 +0000
++++ new/gcc/tree-ssa-math-opts.c	2011-09-08 20:11:43 +0000
+@@ -1699,9 +1699,9 @@
+ 
+   /* Handle constants.  */
+   if (TREE_CODE (mult_rhs1) == INTEGER_CST)
+-    rhs1 = fold_convert (type1, mult_rhs1);
++    mult_rhs1 = fold_convert (type1, mult_rhs1);
+   if (TREE_CODE (mult_rhs2) == INTEGER_CST)
+-    rhs2 = fold_convert (type2, mult_rhs2);
++    mult_rhs2 = fold_convert (type2, mult_rhs2);
+ 
+   gimple_assign_set_rhs_with_ops_1 (gsi, wmult_code, mult_rhs1, mult_rhs2,
+ 				    add_rhs);
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106806.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106806.patch
new file mode 100644
index 0000000..2b96854
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106806.patch
@@ -0,0 +1,92 @@
+2011-09-12  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	gcc/testsuite/
+	* gcc.target/arm/pr50099.c: Fix testcase from previous commit.
+
+2011-09-12  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	LP:838994
+	gcc/
+	Backport from mainline.
+
+        2011-09-06  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+        PR target/50099
+	* config/arm/iterators.md (qhs_zextenddi_cstr): New.
+	(qhs_zextenddi_op): New.
+	* config/arm/arm.md ("zero_extend<mode>di2"): Use them.
+	* config/arm/predicates.md ("arm_extendqisi_mem_op"):
+	Distinguish between ARM and Thumb2 states.
+
+	gcc/testsuite/
+	* gcc.target/arm/pr50099.c: New test.
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-08-25 13:26:58 +0000
++++ new/gcc/config/arm/arm.md	2011-09-12 12:32:29 +0000
+@@ -4136,8 +4136,8 @@
+ 
+ (define_insn "zero_extend<mode>di2"
+   [(set (match_operand:DI 0 "s_register_operand" "=r")
+-        (zero_extend:DI (match_operand:QHSI 1 "<qhs_extenddi_op>"
+-					    "<qhs_extenddi_cstr>")))]
++        (zero_extend:DI (match_operand:QHSI 1 "<qhs_zextenddi_op>"
++					    "<qhs_zextenddi_cstr>")))]
+   "TARGET_32BIT <qhs_zextenddi_cond>"
+   "#"
+   [(set_attr "length" "8")
+
+=== modified file 'gcc/config/arm/iterators.md'
+--- old/gcc/config/arm/iterators.md	2011-05-03 15:14:56 +0000
++++ new/gcc/config/arm/iterators.md	2011-09-06 14:29:24 +0000
+@@ -379,10 +379,14 @@
+ (define_mode_attr qhs_zextenddi_cond [(SI "") (HI "&& arm_arch6") (QI "")])
+ (define_mode_attr qhs_sextenddi_cond [(SI "") (HI "&& arm_arch6")
+ 				      (QI "&& arm_arch6")])
++(define_mode_attr qhs_zextenddi_op [(SI "s_register_operand")
++				   (HI "nonimmediate_operand")
++				   (QI "nonimmediate_operand")])
+ (define_mode_attr qhs_extenddi_op [(SI "s_register_operand")
+ 				   (HI "nonimmediate_operand")
+-				   (QI "nonimmediate_operand")])
+-(define_mode_attr qhs_extenddi_cstr [(SI "r") (HI "rm") (QI "rm")])
++				   (QI "arm_reg_or_extendqisi_mem_op")])
++(define_mode_attr qhs_extenddi_cstr [(SI "r") (HI "rm") (QI "rUq")])
++(define_mode_attr qhs_zextenddi_cstr [(SI "r") (HI "rm") (QI "rm")])
+ 
+ ;;----------------------------------------------------------------------------
+ ;; Code attributes
+
+=== modified file 'gcc/config/arm/predicates.md'
+--- old/gcc/config/arm/predicates.md	2011-09-12 11:24:34 +0000
++++ new/gcc/config/arm/predicates.md	2011-09-12 12:32:29 +0000
+@@ -289,8 +289,11 @@
+ 
+ (define_special_predicate "arm_extendqisi_mem_op"
+   (and (match_operand 0 "memory_operand")
+-       (match_test "arm_legitimate_address_outer_p (mode, XEXP (op, 0),
+-						    SIGN_EXTEND, 0)")))
++       (match_test "TARGET_ARM ? arm_legitimate_address_outer_p (mode,
++                                                                 XEXP (op, 0),
++						                 SIGN_EXTEND,
++								 0)
++                               : memory_address_p (QImode, XEXP (op, 0))")))
+ 
+ (define_special_predicate "arm_reg_or_extendqisi_mem_op"
+   (ior (match_operand 0 "arm_extendqisi_mem_op")
+
+=== added file 'gcc/testsuite/gcc.target/arm/pr50099.c'
+--- old/gcc/testsuite/gcc.target/arm/pr50099.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/pr50099.c	2011-09-09 16:42:45 +0000
+@@ -0,0 +1,10 @@
++/* { dg-do compile } */
++/* { dg-options "-O2" } */
++
++long long foo (signed char * arg)
++{
++  long long temp_1;
++
++  temp_1 = arg[256]; 
++  return temp_1;
++}
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106807.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106807.patch
new file mode 100644
index 0000000..9474030
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106807.patch
@@ -0,0 +1,767 @@
+2011-08-26  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from FSF mainline:
+        2011-04-06  Wei Guozhi  <carrot@google.com>
+
+        PR target/47855
+	gcc/
+        * config/arm/arm.md (arm_cmpsi_insn): Compute attr "length".
+        (arm_cond_branch): Likewise.
+        (arm_cond_branch_reversed): Likewise.
+        (arm_jump): Likewise.
+        (push_multi): Likewise.
+        * config/arm/constraints.md (Py): New constraint.
+
+	2011-04-08  Wei Guozhi  <carrot@google.com>
+
+	PR target/47855
+	* config/arm/arm-protos.h (arm_attr_length_push_multi): New prototype.
+	* config/arm/arm.c (arm_attr_length_push_multi): New function.
+	* config/arm/arm.md (*push_multi): Change the length computation to
+	call a C function.
+
+2011-08-26  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from FSF mainline:
+
+        2011-08-18  Jiangning Liu  <jiangning.liu@arm.com>
+
+	gcc/
+	* config/arm/arm.md (*ior_scc_scc): Enable for Thumb2 as well.
+	(*ior_scc_scc_cmp): Likewise
+	(*and_scc_scc): Likewise.
+	(*and_scc_scc_cmp): Likewise.
+	(*and_scc_scc_nodom): Likewise.
+	(*cmp_ite0, *cmp_ite1, *cmp_and, *cmp_ior): Handle Thumb2.
+
+	gcc/testsuite
+	* gcc.target/arm/thumb2-cond-cmp-1.c: New. Make sure conditional
+	compare can be generated.
+	* gcc.target/arm/thumb2-cond-cmp-2.c: Likewise.
+	* gcc.target/arm/thumb2-cond-cmp-3.c: Likewise.
+	* gcc.target/arm/thumb2-cond-cmp-4.c: Likewise.
+
+=== modified file 'gcc/config/arm/arm-protos.h'
+--- old/gcc/config/arm/arm-protos.h	2011-09-12 11:03:11 +0000
++++ new/gcc/config/arm/arm-protos.h	2011-09-12 14:14:00 +0000
+@@ -156,6 +156,7 @@
+ extern const char *arm_output_memory_barrier (rtx *);
+ extern const char *arm_output_sync_insn (rtx, rtx *);
+ extern unsigned int arm_sync_loop_insns (rtx , rtx *);
++extern int arm_attr_length_push_multi(rtx, rtx);
+ 
+ #if defined TREE_CODE
+ extern void arm_init_cumulative_args (CUMULATIVE_ARGS *, tree, rtx, tree);
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-09-12 11:03:11 +0000
++++ new/gcc/config/arm/arm.c	2011-09-12 14:14:00 +0000
+@@ -24391,4 +24391,30 @@
+     return NO_REGS;
+ }
+ 
++/* Compute the atrribute "length" of insn "*push_multi".
++   So this function MUST be kept in sync with that insn pattern.  */
++int
++arm_attr_length_push_multi(rtx parallel_op, rtx first_op)
++{
++  int i, regno, hi_reg;
++  int num_saves = XVECLEN (parallel_op, 0);
++
++  /* ARM mode.  */
++  if (TARGET_ARM)
++    return 4;
++
++  /* Thumb2 mode.  */
++  regno = REGNO (first_op);
++  hi_reg = (REGNO_REG_CLASS (regno) == HI_REGS) && (regno != LR_REGNUM);
++  for (i = 1; i < num_saves && !hi_reg; i++)
++    {
++      regno = REGNO (XEXP (XVECEXP (parallel_op, 0, i), 0));
++      hi_reg |= (REGNO_REG_CLASS (regno) == HI_REGS) && (regno != LR_REGNUM);
++    }
++
++  if (!hi_reg)
++    return 2;
++  return 4;
++}
++
+ #include "gt-arm.h"
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-09-12 12:32:29 +0000
++++ new/gcc/config/arm/arm.md	2011-09-12 14:14:00 +0000
+@@ -48,6 +48,15 @@
+    (DOM_CC_X_OR_Y   2)
+   ]
+ )
++;; conditional compare combination
++(define_constants
++  [(CMP_CMP 0)
++   (CMN_CMP 1)
++   (CMP_CMN 2)
++   (CMN_CMN 3)
++   (NUM_OF_COND_CMP 4)
++  ]
++)
+ 
+ ;; UNSPEC Usage:
+ ;; Note: sin and cos are no-longer used.
+@@ -7198,13 +7207,17 @@
+ 
+ (define_insn "*arm_cmpsi_insn"
+   [(set (reg:CC CC_REGNUM)
+-	(compare:CC (match_operand:SI 0 "s_register_operand" "r,r")
+-		    (match_operand:SI 1 "arm_add_operand"    "rI,L")))]
++	(compare:CC (match_operand:SI 0 "s_register_operand" "l,r,r,r")
++		    (match_operand:SI 1 "arm_add_operand"    "Py,r,rI,L")))]
+   "TARGET_32BIT"
+   "@
+    cmp%?\\t%0, %1
++   cmp%?\\t%0, %1
++   cmp%?\\t%0, %1
+    cmn%?\\t%0, #%n1"
+-  [(set_attr "conds" "set")]
++  [(set_attr "conds" "set")
++   (set_attr "arch" "t2,t2,any,any")
++   (set_attr "length" "2,2,4,4")]
+ )
+ 
+ (define_insn "*cmpsi_shiftsi"
+@@ -7375,7 +7388,14 @@
+   return \"b%d1\\t%l0\";
+   "
+   [(set_attr "conds" "use")
+-   (set_attr "type" "branch")]
++   (set_attr "type" "branch")
++   (set (attr "length")
++	(if_then_else
++	   (and (ne (symbol_ref "TARGET_THUMB2") (const_int 0))
++		(and (ge (minus (match_dup 0) (pc)) (const_int -250))
++		     (le (minus (match_dup 0) (pc)) (const_int 256))))
++	   (const_int 2)
++	   (const_int 4)))]
+ )
+ 
+ (define_insn "*arm_cond_branch_reversed"
+@@ -7394,7 +7414,14 @@
+   return \"b%D1\\t%l0\";
+   "
+   [(set_attr "conds" "use")
+-   (set_attr "type" "branch")]
++   (set_attr "type" "branch")
++   (set (attr "length")
++	(if_then_else
++	   (and (ne (symbol_ref "TARGET_THUMB2") (const_int 0))
++		(and (ge (minus (match_dup 0) (pc)) (const_int -250))
++		     (le (minus (match_dup 0) (pc)) (const_int 256))))
++	   (const_int 2)
++	   (const_int 4)))]
+ )
+ 
+ 
+@@ -7846,7 +7873,14 @@
+     return \"b%?\\t%l0\";
+   }
+   "
+-  [(set_attr "predicable" "yes")]
++  [(set_attr "predicable" "yes")
++   (set (attr "length")
++	(if_then_else
++	   (and (ne (symbol_ref "TARGET_THUMB2") (const_int 0))
++		(and (ge (minus (match_dup 0) (pc)) (const_int -2044))
++		     (le (minus (match_dup 0) (pc)) (const_int 2048))))
++	   (const_int 2)
++	   (const_int 4)))]
+ )
+ 
+ (define_insn "*thumb_jump"
+@@ -8931,40 +8965,85 @@
+    (set_attr "length" "8,12")]
+ )
+ 
+-;; ??? Is it worth using these conditional patterns in Thumb-2 mode?
+ (define_insn "*cmp_ite0"
+   [(set (match_operand 6 "dominant_cc_register" "")
+ 	(compare
+ 	 (if_then_else:SI
+ 	  (match_operator 4 "arm_comparison_operator"
+-	   [(match_operand:SI 0 "s_register_operand" "r,r,r,r")
+-	    (match_operand:SI 1 "arm_add_operand" "rI,L,rI,L")])
++	   [(match_operand:SI 0 "s_register_operand"
++	        "l,l,l,r,r,r,r,r,r")
++	    (match_operand:SI 1 "arm_add_operand"
++	        "lPy,lPy,lPy,rI,L,rI,L,rI,L")])
+ 	  (match_operator:SI 5 "arm_comparison_operator"
+-	   [(match_operand:SI 2 "s_register_operand" "r,r,r,r")
+-	    (match_operand:SI 3 "arm_add_operand" "rI,rI,L,L")])
++	   [(match_operand:SI 2 "s_register_operand"
++	        "l,r,r,l,l,r,r,r,r")
++	    (match_operand:SI 3 "arm_add_operand"
++	        "lPy,rI,L,lPy,lPy,rI,rI,L,L")])
+ 	  (const_int 0))
+ 	 (const_int 0)))]
+-  "TARGET_ARM"
++  "TARGET_32BIT"
+   "*
+   {
+-    static const char * const opcodes[4][2] =
+-    {
+-      {\"cmp\\t%2, %3\;cmp%d5\\t%0, %1\",
+-       \"cmp\\t%0, %1\;cmp%d4\\t%2, %3\"},
+-      {\"cmp\\t%2, %3\;cmn%d5\\t%0, #%n1\",
+-       \"cmn\\t%0, #%n1\;cmp%d4\\t%2, %3\"},
+-      {\"cmn\\t%2, #%n3\;cmp%d5\\t%0, %1\",
+-       \"cmp\\t%0, %1\;cmn%d4\\t%2, #%n3\"},
+-      {\"cmn\\t%2, #%n3\;cmn%d5\\t%0, #%n1\",
+-       \"cmn\\t%0, #%n1\;cmn%d4\\t%2, #%n3\"}
+-    };
++    static const char * const cmp1[NUM_OF_COND_CMP][2] =
++    {
++      {\"cmp%d5\\t%0, %1\",
++       \"cmp%d4\\t%2, %3\"},
++      {\"cmn%d5\\t%0, #%n1\",
++       \"cmp%d4\\t%2, %3\"},
++      {\"cmp%d5\\t%0, %1\",
++       \"cmn%d4\\t%2, #%n3\"},
++      {\"cmn%d5\\t%0, #%n1\",
++       \"cmn%d4\\t%2, #%n3\"}
++    };
++    static const char * const cmp2[NUM_OF_COND_CMP][2] =
++    {
++      {\"cmp\\t%2, %3\",
++       \"cmp\\t%0, %1\"},
++      {\"cmp\\t%2, %3\",
++       \"cmn\\t%0, #%n1\"},
++      {\"cmn\\t%2, #%n3\",
++       \"cmp\\t%0, %1\"},
++      {\"cmn\\t%2, #%n3\",
++       \"cmn\\t%0, #%n1\"}
++    };
++    static const char * const ite[2] =
++    {
++      \"it\\t%d5\",
++      \"it\\t%d4\"
++    };
++    static const int cmp_idx[9] = {CMP_CMP, CMP_CMP, CMP_CMN,
++                                   CMP_CMP, CMN_CMP, CMP_CMP,
++                                   CMN_CMP, CMP_CMN, CMN_CMN};
+     int swap =
+       comparison_dominates_p (GET_CODE (operands[5]), GET_CODE (operands[4]));
+ 
+-    return opcodes[which_alternative][swap];
++    output_asm_insn (cmp2[cmp_idx[which_alternative]][swap], operands);
++    if (TARGET_THUMB2) {
++      output_asm_insn (ite[swap], operands);
++    }
++    output_asm_insn (cmp1[cmp_idx[which_alternative]][swap], operands);
++    return \"\";
+   }"
+   [(set_attr "conds" "set")
+-   (set_attr "length" "8")]
++   (set_attr "arch" "t2,t2,t2,t2,t2,any,any,any,any")
++   (set_attr_alternative "length"
++      [(const_int 6)
++       (const_int 8)
++       (const_int 8)
++       (const_int 8)
++       (const_int 8)
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))])]
+ )
+ 
+ (define_insn "*cmp_ite1"
+@@ -8972,35 +9051,81 @@
+ 	(compare
+ 	 (if_then_else:SI
+ 	  (match_operator 4 "arm_comparison_operator"
+-	   [(match_operand:SI 0 "s_register_operand" "r,r,r,r")
+-	    (match_operand:SI 1 "arm_add_operand" "rI,L,rI,L")])
++	   [(match_operand:SI 0 "s_register_operand"
++	        "l,l,l,r,r,r,r,r,r")
++	    (match_operand:SI 1 "arm_add_operand"
++	        "lPy,lPy,lPy,rI,L,rI,L,rI,L")])
+ 	  (match_operator:SI 5 "arm_comparison_operator"
+-	   [(match_operand:SI 2 "s_register_operand" "r,r,r,r")
+-	    (match_operand:SI 3 "arm_add_operand" "rI,rI,L,L")])
++	   [(match_operand:SI 2 "s_register_operand"
++	        "l,r,r,l,l,r,r,r,r")
++	    (match_operand:SI 3 "arm_add_operand"
++	        "lPy,rI,L,lPy,lPy,rI,rI,L,L")])
+ 	  (const_int 1))
+ 	 (const_int 0)))]
+-  "TARGET_ARM"
++  "TARGET_32BIT"
+   "*
+   {
+-    static const char * const opcodes[4][2] =
+-    {
+-      {\"cmp\\t%0, %1\;cmp%d4\\t%2, %3\",
+-       \"cmp\\t%2, %3\;cmp%D5\\t%0, %1\"},
+-      {\"cmn\\t%0, #%n1\;cmp%d4\\t%2, %3\",
+-       \"cmp\\t%2, %3\;cmn%D5\\t%0, #%n1\"},
+-      {\"cmp\\t%0, %1\;cmn%d4\\t%2, #%n3\",
+-       \"cmn\\t%2, #%n3\;cmp%D5\\t%0, %1\"},
+-      {\"cmn\\t%0, #%n1\;cmn%d4\\t%2, #%n3\",
+-       \"cmn\\t%2, #%n3\;cmn%D5\\t%0, #%n1\"}
+-    };
++    static const char * const cmp1[NUM_OF_COND_CMP][2] =
++    {
++      {\"cmp\\t%0, %1\",
++       \"cmp\\t%2, %3\"},
++      {\"cmn\\t%0, #%n1\",
++       \"cmp\\t%2, %3\"},
++      {\"cmp\\t%0, %1\",
++       \"cmn\\t%2, #%n3\"},
++      {\"cmn\\t%0, #%n1\",
++       \"cmn\\t%2, #%n3\"}
++    };
++    static const char * const cmp2[NUM_OF_COND_CMP][2] =
++    {
++      {\"cmp%d4\\t%2, %3\",
++       \"cmp%D5\\t%0, %1\"},
++      {\"cmp%d4\\t%2, %3\",
++       \"cmn%D5\\t%0, #%n1\"},
++      {\"cmn%d4\\t%2, #%n3\",
++       \"cmp%D5\\t%0, %1\"},
++      {\"cmn%d4\\t%2, #%n3\",
++       \"cmn%D5\\t%0, #%n1\"}
++    };
++    static const char * const ite[2] =
++    {
++      \"it\\t%d4\",
++      \"it\\t%D5\"
++    };
++    static const int cmp_idx[9] = {CMP_CMP, CMP_CMP, CMP_CMN,
++                                   CMP_CMP, CMN_CMP, CMP_CMP,
++                                   CMN_CMP, CMP_CMN, CMN_CMN};
+     int swap =
+       comparison_dominates_p (GET_CODE (operands[5]),
+ 			      reverse_condition (GET_CODE (operands[4])));
+ 
+-    return opcodes[which_alternative][swap];
++    output_asm_insn (cmp1[cmp_idx[which_alternative]][swap], operands);
++    if (TARGET_THUMB2) {
++      output_asm_insn (ite[swap], operands);
++    }
++    output_asm_insn (cmp2[cmp_idx[which_alternative]][swap], operands);
++    return \"\";
+   }"
+   [(set_attr "conds" "set")
+-   (set_attr "length" "8")]
++   (set_attr "arch" "t2,t2,t2,t2,t2,any,any,any,any")
++   (set_attr_alternative "length"
++      [(const_int 6)
++       (const_int 8)
++       (const_int 8)
++       (const_int 8)
++       (const_int 8)
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))])]
+ )
+ 
+ (define_insn "*cmp_and"
+@@ -9008,34 +9133,80 @@
+ 	(compare
+ 	 (and:SI
+ 	  (match_operator 4 "arm_comparison_operator"
+-	   [(match_operand:SI 0 "s_register_operand" "r,r,r,r")
+-	    (match_operand:SI 1 "arm_add_operand" "rI,L,rI,L")])
++	   [(match_operand:SI 0 "s_register_operand" 
++	        "l,l,l,r,r,r,r,r,r")
++	    (match_operand:SI 1 "arm_add_operand" 
++	        "lPy,lPy,lPy,rI,L,rI,L,rI,L")])
+ 	  (match_operator:SI 5 "arm_comparison_operator"
+-	   [(match_operand:SI 2 "s_register_operand" "r,r,r,r")
+-	    (match_operand:SI 3 "arm_add_operand" "rI,rI,L,L")]))
++	   [(match_operand:SI 2 "s_register_operand" 
++	        "l,r,r,l,l,r,r,r,r")
++	    (match_operand:SI 3 "arm_add_operand" 
++	        "lPy,rI,L,lPy,lPy,rI,rI,L,L")]))
+ 	 (const_int 0)))]
+-  "TARGET_ARM"
++  "TARGET_32BIT"
+   "*
+   {
+-    static const char *const opcodes[4][2] =
+-    {
+-      {\"cmp\\t%2, %3\;cmp%d5\\t%0, %1\",
+-       \"cmp\\t%0, %1\;cmp%d4\\t%2, %3\"},
+-      {\"cmp\\t%2, %3\;cmn%d5\\t%0, #%n1\",
+-       \"cmn\\t%0, #%n1\;cmp%d4\\t%2, %3\"},
+-      {\"cmn\\t%2, #%n3\;cmp%d5\\t%0, %1\",
+-       \"cmp\\t%0, %1\;cmn%d4\\t%2, #%n3\"},
+-      {\"cmn\\t%2, #%n3\;cmn%d5\\t%0, #%n1\",
+-       \"cmn\\t%0, #%n1\;cmn%d4\\t%2, #%n3\"}
+-    };
++    static const char *const cmp1[NUM_OF_COND_CMP][2] =
++    {
++      {\"cmp%d5\\t%0, %1\",
++       \"cmp%d4\\t%2, %3\"},
++      {\"cmn%d5\\t%0, #%n1\",
++       \"cmp%d4\\t%2, %3\"},
++      {\"cmp%d5\\t%0, %1\",
++       \"cmn%d4\\t%2, #%n3\"},
++      {\"cmn%d5\\t%0, #%n1\",
++       \"cmn%d4\\t%2, #%n3\"}
++    };
++    static const char *const cmp2[NUM_OF_COND_CMP][2] =
++    {
++      {\"cmp\\t%2, %3\",
++       \"cmp\\t%0, %1\"},
++      {\"cmp\\t%2, %3\",
++       \"cmn\\t%0, #%n1\"},
++      {\"cmn\\t%2, #%n3\",
++       \"cmp\\t%0, %1\"},
++      {\"cmn\\t%2, #%n3\",
++       \"cmn\\t%0, #%n1\"}
++    };
++    static const char *const ite[2] =
++    {
++      \"it\\t%d5\",
++      \"it\\t%d4\"
++    };
++    static const int cmp_idx[9] = {CMP_CMP, CMP_CMP, CMP_CMN,
++                                   CMP_CMP, CMN_CMP, CMP_CMP,
++                                   CMN_CMP, CMP_CMN, CMN_CMN};
+     int swap =
+       comparison_dominates_p (GET_CODE (operands[5]), GET_CODE (operands[4]));
+ 
+-    return opcodes[which_alternative][swap];
++    output_asm_insn (cmp2[cmp_idx[which_alternative]][swap], operands);
++    if (TARGET_THUMB2) {
++      output_asm_insn (ite[swap], operands);
++    }
++    output_asm_insn (cmp1[cmp_idx[which_alternative]][swap], operands);
++    return \"\";
+   }"
+   [(set_attr "conds" "set")
+    (set_attr "predicable" "no")
+-   (set_attr "length" "8")]
++   (set_attr "arch" "t2,t2,t2,t2,t2,any,any,any,any")
++   (set_attr_alternative "length"
++      [(const_int 6)
++       (const_int 8)
++       (const_int 8)
++       (const_int 8)
++       (const_int 8)
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))])]
+ )
+ 
+ (define_insn "*cmp_ior"
+@@ -9043,34 +9214,80 @@
+ 	(compare
+ 	 (ior:SI
+ 	  (match_operator 4 "arm_comparison_operator"
+-	   [(match_operand:SI 0 "s_register_operand" "r,r,r,r")
+-	    (match_operand:SI 1 "arm_add_operand" "rI,L,rI,L")])
++	   [(match_operand:SI 0 "s_register_operand"
++	        "l,l,l,r,r,r,r,r,r")
++	    (match_operand:SI 1 "arm_add_operand"
++	        "lPy,lPy,lPy,rI,L,rI,L,rI,L")])
+ 	  (match_operator:SI 5 "arm_comparison_operator"
+-	   [(match_operand:SI 2 "s_register_operand" "r,r,r,r")
+-	    (match_operand:SI 3 "arm_add_operand" "rI,rI,L,L")]))
++	   [(match_operand:SI 2 "s_register_operand"
++	        "l,r,r,l,l,r,r,r,r")
++	    (match_operand:SI 3 "arm_add_operand"
++	        "lPy,rI,L,lPy,lPy,rI,rI,L,L")]))
+ 	 (const_int 0)))]
+-  "TARGET_ARM"
++  "TARGET_32BIT"
+   "*
+-{
+-  static const char *const opcodes[4][2] =
+   {
+-    {\"cmp\\t%0, %1\;cmp%D4\\t%2, %3\",
+-     \"cmp\\t%2, %3\;cmp%D5\\t%0, %1\"},
+-    {\"cmn\\t%0, #%n1\;cmp%D4\\t%2, %3\",
+-     \"cmp\\t%2, %3\;cmn%D5\\t%0, #%n1\"},
+-    {\"cmp\\t%0, %1\;cmn%D4\\t%2, #%n3\",
+-     \"cmn\\t%2, #%n3\;cmp%D5\\t%0, %1\"},
+-    {\"cmn\\t%0, #%n1\;cmn%D4\\t%2, #%n3\",
+-     \"cmn\\t%2, #%n3\;cmn%D5\\t%0, #%n1\"}
+-  };
+-  int swap =
+-    comparison_dominates_p (GET_CODE (operands[5]), GET_CODE (operands[4]));
++    static const char *const cmp1[NUM_OF_COND_CMP][2] =
++    {
++      {\"cmp\\t%0, %1\",
++       \"cmp\\t%2, %3\"},
++      {\"cmn\\t%0, #%n1\",
++       \"cmp\\t%2, %3\"},
++      {\"cmp\\t%0, %1\",
++       \"cmn\\t%2, #%n3\"},
++      {\"cmn\\t%0, #%n1\",
++       \"cmn\\t%2, #%n3\"}
++    };
++    static const char *const cmp2[NUM_OF_COND_CMP][2] =
++    {
++      {\"cmp%D4\\t%2, %3\",
++       \"cmp%D5\\t%0, %1\"},
++      {\"cmp%D4\\t%2, %3\",
++       \"cmn%D5\\t%0, #%n1\"},
++      {\"cmn%D4\\t%2, #%n3\",
++       \"cmp%D5\\t%0, %1\"},
++      {\"cmn%D4\\t%2, #%n3\",
++       \"cmn%D5\\t%0, #%n1\"}
++    };
++    static const char *const ite[2] =
++    {
++      \"it\\t%D4\",
++      \"it\\t%D5\"
++    };
++    static const int cmp_idx[9] = {CMP_CMP, CMP_CMP, CMP_CMN,
++                                   CMP_CMP, CMN_CMP, CMP_CMP,
++                                   CMN_CMP, CMP_CMN, CMN_CMN};
++    int swap =
++      comparison_dominates_p (GET_CODE (operands[5]), GET_CODE (operands[4]));
+ 
+-  return opcodes[which_alternative][swap];
+-}
+-"
++    output_asm_insn (cmp1[cmp_idx[which_alternative]][swap], operands);
++    if (TARGET_THUMB2) {
++      output_asm_insn (ite[swap], operands);
++    }
++    output_asm_insn (cmp2[cmp_idx[which_alternative]][swap], operands);
++    return \"\";
++  }
++  "
+   [(set_attr "conds" "set")
+-   (set_attr "length" "8")]
++   (set_attr "arch" "t2,t2,t2,t2,t2,any,any,any,any")
++   (set_attr_alternative "length"
++      [(const_int 6)
++       (const_int 8)
++       (const_int 8)
++       (const_int 8)
++       (const_int 8)
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))
++       (if_then_else (eq_attr "is_thumb" "no")
++           (const_int 8)
++           (const_int 10))])]
+ )
+ 
+ (define_insn_and_split "*ior_scc_scc"
+@@ -9082,11 +9299,11 @@
+ 		 [(match_operand:SI 4 "s_register_operand" "r")
+ 		  (match_operand:SI 5 "arm_add_operand" "rIL")])))
+    (clobber (reg:CC CC_REGNUM))]
+-  "TARGET_ARM
++  "TARGET_32BIT
+    && (arm_select_dominance_cc_mode (operands[3], operands[6], DOM_CC_X_OR_Y)
+        != CCmode)"
+   "#"
+-  "TARGET_ARM && reload_completed"
++  "TARGET_32BIT && reload_completed"
+   [(set (match_dup 7)
+ 	(compare
+ 	 (ior:SI
+@@ -9115,9 +9332,9 @@
+    (set (match_operand:SI 7 "s_register_operand" "=r")
+ 	(ior:SI (match_op_dup 3 [(match_dup 1) (match_dup 2)])
+ 		(match_op_dup 6 [(match_dup 4) (match_dup 5)])))]
+-  "TARGET_ARM"
++  "TARGET_32BIT"
+   "#"
+-  "TARGET_ARM && reload_completed"
++  "TARGET_32BIT && reload_completed"
+   [(set (match_dup 0)
+ 	(compare
+ 	 (ior:SI
+@@ -9138,11 +9355,11 @@
+ 		 [(match_operand:SI 4 "s_register_operand" "r")
+ 		  (match_operand:SI 5 "arm_add_operand" "rIL")])))
+    (clobber (reg:CC CC_REGNUM))]
+-  "TARGET_ARM
++  "TARGET_32BIT
+    && (arm_select_dominance_cc_mode (operands[3], operands[6], DOM_CC_X_AND_Y)
+        != CCmode)"
+   "#"
+-  "TARGET_ARM && reload_completed
++  "TARGET_32BIT && reload_completed
+    && (arm_select_dominance_cc_mode (operands[3], operands[6], DOM_CC_X_AND_Y)
+        != CCmode)"
+   [(set (match_dup 7)
+@@ -9173,9 +9390,9 @@
+    (set (match_operand:SI 7 "s_register_operand" "=r")
+ 	(and:SI (match_op_dup 3 [(match_dup 1) (match_dup 2)])
+ 		(match_op_dup 6 [(match_dup 4) (match_dup 5)])))]
+-  "TARGET_ARM"
++  "TARGET_32BIT"
+   "#"
+-  "TARGET_ARM && reload_completed"
++  "TARGET_32BIT && reload_completed"
+   [(set (match_dup 0)
+ 	(compare
+ 	 (and:SI
+@@ -9200,11 +9417,11 @@
+ 		 [(match_operand:SI 4 "s_register_operand" "r,r,r")
+ 		  (match_operand:SI 5 "arm_add_operand" "rIL,rIL,rIL")])))
+    (clobber (reg:CC CC_REGNUM))]
+-  "TARGET_ARM
++  "TARGET_32BIT
+    && (arm_select_dominance_cc_mode (operands[3], operands[6], DOM_CC_X_AND_Y)
+        == CCmode)"
+   "#"
+-  "TARGET_ARM && reload_completed"
++  "TARGET_32BIT && reload_completed"
+   [(parallel [(set (match_dup 0)
+ 		   (match_op_dup 3 [(match_dup 1) (match_dup 2)]))
+ 	      (clobber (reg:CC CC_REGNUM))])
+@@ -10314,6 +10531,8 @@
+ ;; Push multiple registers to the stack.  Registers are in parallel (use ...)
+ ;; expressions.  For simplicity, the first register is also in the unspec
+ ;; part.
++;; To avoid the usage of GNU extension, the length attribute is computed
++;; in a C function arm_attr_length_push_multi.
+ (define_insn "*push_multi"
+   [(match_parallel 2 "multi_register_push"
+     [(set (match_operand:BLK 0 "memory_operand" "=m")
+@@ -10353,7 +10572,9 @@
+ 
+     return \"\";
+   }"
+-  [(set_attr "type" "store4")]
++  [(set_attr "type" "store4")
++   (set (attr "length")
++	(symbol_ref "arm_attr_length_push_multi (operands[2], operands[1])"))]
+ )
+ 
+ (define_insn "stack_tie"
+
+=== modified file 'gcc/config/arm/constraints.md'
+--- old/gcc/config/arm/constraints.md	2011-08-25 13:26:58 +0000
++++ new/gcc/config/arm/constraints.md	2011-09-12 14:14:00 +0000
+@@ -31,7 +31,7 @@
+ ;; The following multi-letter normal constraints have been used:
+ ;; in ARM/Thumb-2 state: Da, Db, Dc, Dn, Dl, DL, Dv, Dy, Di, Dz
+ ;; in Thumb-1 state: Pa, Pb, Pc, Pd
+-;; in Thumb-2 state: Pj, PJ, Ps, Pt, Pu, Pv, Pw, Px
++;; in Thumb-2 state: Pj, PJ, Ps, Pt, Pu, Pv, Pw, Px, Py
+ 
+ ;; The following memory constraints have been used:
+ ;; in ARM/Thumb-2 state: Q, Ut, Uv, Uy, Un, Um, Us
+@@ -201,6 +201,11 @@
+   (and (match_code "const_int")
+        (match_test "TARGET_THUMB2 && ival >= -7 && ival <= -1")))
+ 
++(define_constraint "Py"
++  "@internal In Thumb-2 state a constant in the range 0 to 255"
++  (and (match_code "const_int")
++       (match_test "TARGET_THUMB2 && ival >= 0 && ival <= 255")))
++
+ (define_constraint "G"
+  "In ARM/Thumb-2 state a valid FPA immediate constant."
+  (and (match_code "const_double")
+
+=== added file 'gcc/testsuite/gcc.target/arm/thumb2-cond-cmp-1.c'
+--- old/gcc/testsuite/gcc.target/arm/thumb2-cond-cmp-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/thumb2-cond-cmp-1.c	2011-09-12 14:14:00 +0000
+@@ -0,0 +1,13 @@
++/* Use conditional compare */
++/* { dg-options "-O2" } */
++/* { dg-skip-if "" { arm_thumb1_ok } } */
++/* { dg-final { scan-assembler "cmpne" } } */
++
++int f(int i, int j) 
++{
++  if ( (i == '+') || (j == '-') ) {
++    return 1;
++  } else {
++    return 0;
++  }
++}
+
+=== added file 'gcc/testsuite/gcc.target/arm/thumb2-cond-cmp-2.c'
+--- old/gcc/testsuite/gcc.target/arm/thumb2-cond-cmp-2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/thumb2-cond-cmp-2.c	2011-09-12 14:14:00 +0000
+@@ -0,0 +1,13 @@
++/* Use conditional compare */                                                                                         
++/* { dg-options "-O2" } */
++/* { dg-skip-if "" { arm_thumb1_ok } } */
++/* { dg-final { scan-assembler "cmpeq" } } */
++
++int f(int i, int j) 
++{
++  if ( (i == '+') && (j == '-') ) {
++    return 1;
++  } else {
++    return 0;
++  }
++}
+
+=== added file 'gcc/testsuite/gcc.target/arm/thumb2-cond-cmp-3.c'
+--- old/gcc/testsuite/gcc.target/arm/thumb2-cond-cmp-3.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/thumb2-cond-cmp-3.c	2011-09-12 14:14:00 +0000
+@@ -0,0 +1,12 @@
++/* Use conditional compare */                                                                                         
++/* { dg-options "-O2" } */
++/* { dg-skip-if "" { arm_thumb1_ok } } */
++/* { dg-final { scan-assembler "cmpgt" } } */
++
++int f(int i, int j)
++{
++  if ( (i >= '+') ? (j > '-') : 0)
++    return 1;
++  else
++    return 0;
++}
+
+=== added file 'gcc/testsuite/gcc.target/arm/thumb2-cond-cmp-4.c'
+--- old/gcc/testsuite/gcc.target/arm/thumb2-cond-cmp-4.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/thumb2-cond-cmp-4.c	2011-09-12 14:14:00 +0000
+@@ -0,0 +1,12 @@
++/* Use conditional compare */                                                                                         
++/* { dg-options "-O2" } */
++/* { dg-skip-if "" { arm_thumb1_ok } } */
++/* { dg-final { scan-assembler "cmpgt" } } */
++
++int f(int i, int j)
++{
++  if ( (i >= '+') ? (j <= '-') : 1)
++    return 1;
++  else
++    return 0;
++}
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106811.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106811.patch
new file mode 100644
index 0000000..41b5c6d
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106811.patch
@@ -0,0 +1,203 @@
+2011-09-15  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	Revert:
+
+	gcc/
+	PR target/49030
+	* config/arm/arm-protos.h (maybe_get_arm_condition_code): Declare.
+	* config/arm/arm.c (maybe_get_arm_condition_code): New function,
+	reusing the old code from get_arm_condition_code.  Return ARM_NV
+	for invalid comparison codes.
+	(get_arm_condition_code): Redefine in terms of
+	maybe_get_arm_condition_code.
+	* config/arm/predicates.md (arm_comparison_operator): Use
+	maybe_get_arm_condition_code.
+
+	gcc/testsuite/
+	PR target/49030
+	* gcc.dg/torture/pr49030.c: New test.
+
+=== modified file 'gcc/config/arm/arm-protos.h'
+--- old/gcc/config/arm/arm-protos.h	2011-09-12 14:14:00 +0000
++++ new/gcc/config/arm/arm-protos.h	2011-09-15 09:45:31 +0000
+@@ -180,7 +180,6 @@
+ #endif
+ extern int thumb_shiftable_const (unsigned HOST_WIDE_INT);
+ #ifdef RTX_CODE
+-extern enum arm_cond_code maybe_get_arm_condition_code (rtx);
+ extern void thumb1_final_prescan_insn (rtx);
+ extern void thumb2_final_prescan_insn (rtx);
+ extern const char *thumb_load_double_from_address (rtx *);
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-09-12 14:14:00 +0000
++++ new/gcc/config/arm/arm.c	2011-09-15 09:45:31 +0000
+@@ -17494,10 +17494,10 @@
+    decremented/zeroed by arm_asm_output_opcode as the insns are output.  */
+ 
+ /* Returns the index of the ARM condition code string in
+-   `arm_condition_codes', or ARM_NV if the comparison is invalid.
+-   COMPARISON should be an rtx like `(eq (...) (...))'.  */
+-enum arm_cond_code
+-maybe_get_arm_condition_code (rtx comparison)
++   `arm_condition_codes'.  COMPARISON should be an rtx like
++   `(eq (...) (...))'.  */
++static enum arm_cond_code
++get_arm_condition_code (rtx comparison)
+ {
+   enum machine_mode mode = GET_MODE (XEXP (comparison, 0));
+   enum arm_cond_code code;
+@@ -17521,11 +17521,11 @@
+     case CC_DLTUmode: code = ARM_CC;
+ 
+     dominance:
++      gcc_assert (comp_code == EQ || comp_code == NE);
++
+       if (comp_code == EQ)
+ 	return ARM_INVERSE_CONDITION_CODE (code);
+-      if (comp_code == NE)
+-	return code;
+-      return ARM_NV;
++      return code;
+ 
+     case CC_NOOVmode:
+       switch (comp_code)
+@@ -17534,7 +17534,7 @@
+ 	case EQ: return ARM_EQ;
+ 	case GE: return ARM_PL;
+ 	case LT: return ARM_MI;
+-	default: return ARM_NV;
++	default: gcc_unreachable ();
+ 	}
+ 
+     case CC_Zmode:
+@@ -17542,7 +17542,7 @@
+ 	{
+ 	case NE: return ARM_NE;
+ 	case EQ: return ARM_EQ;
+-	default: return ARM_NV;
++	default: gcc_unreachable ();
+ 	}
+ 
+     case CC_Nmode:
+@@ -17550,7 +17550,7 @@
+ 	{
+ 	case NE: return ARM_MI;
+ 	case EQ: return ARM_PL;
+-	default: return ARM_NV;
++	default: gcc_unreachable ();
+ 	}
+ 
+     case CCFPEmode:
+@@ -17575,7 +17575,7 @@
+ 	  /* UNEQ and LTGT do not have a representation.  */
+ 	case UNEQ: /* Fall through.  */
+ 	case LTGT: /* Fall through.  */
+-	default: return ARM_NV;
++	default: gcc_unreachable ();
+ 	}
+ 
+     case CC_SWPmode:
+@@ -17591,7 +17591,7 @@
+ 	case GTU: return ARM_CC;
+ 	case LEU: return ARM_CS;
+ 	case LTU: return ARM_HI;
+-	default: return ARM_NV;
++	default: gcc_unreachable ();
+ 	}
+ 
+     case CC_Cmode:
+@@ -17599,7 +17599,7 @@
+ 	{
+ 	case LTU: return ARM_CS;
+ 	case GEU: return ARM_CC;
+-	default: return ARM_NV;
++	default: gcc_unreachable ();
+ 	}
+ 
+     case CC_CZmode:
+@@ -17611,7 +17611,7 @@
+ 	case GTU: return ARM_HI;
+ 	case LEU: return ARM_LS;
+ 	case LTU: return ARM_CC;
+-	default: return ARM_NV;
++	default: gcc_unreachable ();
+ 	}
+ 
+     case CC_NCVmode:
+@@ -17621,7 +17621,7 @@
+ 	case LT: return ARM_LT;
+ 	case GEU: return ARM_CS;
+ 	case LTU: return ARM_CC;
+-	default: return ARM_NV;
++	default: gcc_unreachable ();
+ 	}
+ 
+     case CCmode:
+@@ -17637,22 +17637,13 @@
+ 	case GTU: return ARM_HI;
+ 	case LEU: return ARM_LS;
+ 	case LTU: return ARM_CC;
+-	default: return ARM_NV;
++	default: gcc_unreachable ();
+ 	}
+ 
+     default: gcc_unreachable ();
+     }
+ }
+ 
+-/* Like maybe_get_arm_condition_code, but never return ARM_NV.  */
+-static enum arm_cond_code
+-get_arm_condition_code (rtx comparison)
+-{
+-  enum arm_cond_code code = maybe_get_arm_condition_code (comparison);
+-  gcc_assert (code != ARM_NV);
+-  return code;
+-}
+-
+ /* Tell arm_asm_output_opcode to output IT blocks for conditionally executed
+    instructions.  */
+ void
+
+=== modified file 'gcc/config/arm/predicates.md'
+--- old/gcc/config/arm/predicates.md	2011-09-12 12:32:29 +0000
++++ new/gcc/config/arm/predicates.md	2011-09-15 09:45:31 +0000
+@@ -243,9 +243,10 @@
+ ;; True for integer comparisons and, if FP is active, for comparisons
+ ;; other than LTGT or UNEQ.
+ (define_special_predicate "arm_comparison_operator"
+-  (and (match_code "eq,ne,le,lt,ge,gt,geu,gtu,leu,ltu,
+-		    unordered,ordered,unlt,unle,unge,ungt")
+-       (match_test "maybe_get_arm_condition_code (op) != ARM_NV")))
++  (ior (match_code "eq,ne,le,lt,ge,gt,geu,gtu,leu,ltu")
++       (and (match_test "TARGET_32BIT && TARGET_HARD_FLOAT
++			 && (TARGET_FPA || TARGET_VFP)")
++            (match_code "unordered,ordered,unlt,unle,unge,ungt"))))
+ 
+ (define_special_predicate "lt_ge_comparison_operator"
+   (match_code "lt,ge"))
+
+=== removed file 'gcc/testsuite/gcc.dg/torture/pr49030.c'
+--- old/gcc/testsuite/gcc.dg/torture/pr49030.c	2011-09-05 09:40:19 +0000
++++ new/gcc/testsuite/gcc.dg/torture/pr49030.c	1970-01-01 00:00:00 +0000
+@@ -1,19 +0,0 @@
+-void
+-sample_move_d32u24_sS (char *dst, float *src, unsigned long nsamples,
+-		       unsigned long dst_skip)
+-{
+-  long long y;
+-  while (nsamples--)
+-    {
+-      y = (long long) (*src * 8388608.0f) << 8;
+-      if (y > 2147483647) {
+-	*(int *) dst = 2147483647;
+-      } else if (y < -2147483647 - 1) {
+-	*(int *) dst = -2147483647 - 1;
+-      } else {
+-	*(int *) dst = (int) y;
+-      }
+-      dst += dst_skip;
+-      src++;
+-    }
+-}
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
index 86dceab..1b4e05a 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
@@ -36,4 +36,25 @@ file://linaro/gcc-4.6-linaro-r106777.patch \
 file://linaro/gcc-4.6-linaro-r106778.patch \
 file://linaro/gcc-4.6-linaro-r106781.patch \
 file://linaro/gcc-4.6-linaro-r106782.patch \
+file://linaro/gcc-4.6-linaro-r106783.patch \
+file://linaro/gcc-4.6-linaro-r106784.patch \
+file://linaro/gcc-4.6-linaro-r106785.patch \
+file://linaro/gcc-4.6-linaro-r106786.patch \
+file://linaro/gcc-4.6-linaro-r106787.patch \
+file://linaro/gcc-4.6-linaro-r106789.patch \
+file://linaro/gcc-4.6-linaro-r106792.patch \
+file://linaro/gcc-4.6-linaro-r106793.patch \
+file://linaro/gcc-4.6-linaro-r106794.patch \
+file://linaro/gcc-4.6-linaro-r106796.patch \
+file://linaro/gcc-4.6-linaro-r106797.patch \
+file://linaro/gcc-4.6-linaro-r106798.patch \
+file://linaro/gcc-4.6-linaro-r106799.patch \
+file://linaro/gcc-4.6-linaro-r106800.patch \
+file://linaro/gcc-4.6-linaro-r106802.patch \
+file://linaro/gcc-4.6-linaro-r106803.patch \
+file://linaro/gcc-4.6-linaro-r106804.patch \
+file://linaro/gcc-4.6-linaro-r106805.patch \
+file://linaro/gcc-4.6-linaro-r106806.patch \
+file://linaro/gcc-4.6-linaro-r106807.patch \
+file://linaro/gcc-4.6-linaro-r106811.patch \
 "
-- 
1.7.5.4



