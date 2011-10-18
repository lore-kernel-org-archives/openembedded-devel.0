Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFykh-0001oB-Gy
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 03:45:59 +0200
Received: by pzk33 with SMTP id 33so271012pzk.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 18:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Vt5O7TXPyidpfKVUG1uT0knhOgV60O8hDT9eYpmhwjk=;
	b=uxGS8Cjdxj+nfmgb8xxc2BJjMYaaQJ3Ci3zNG/cPK48jpehdN6RXFuO8RjWaw4Nnag
	iUzjzdFgG6Ls/x75k8K4Ey+eBHU81tLbiHIAG6UiN1ztJOxowLLvCk2+92QTlxKVbw4b
	gd2Nigak889XIbew1KvlEBRDSAhPVdDB9hsWc=
Received: by 10.68.9.7 with SMTP id v7mr1060659pba.94.1318902005595;
	Mon, 17 Oct 2011 18:40:05 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id h5sm1800019pbq.11.2011.10.17.18.40.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 18:40:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2011 18:39:48 -0700
Message-Id: <1318901988-8468-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] gcc-4.6: Remove the patches that are already applied via oe-core
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
X-List-Received-Date: Tue, 18 Oct 2011 01:46:00 -0000

Please apply after
http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-update
has been merged into oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106729.patch    |   32 ----
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106743.patch    |   25 ---
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106761.patch    |  188 --------------------
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |    3 -
 4 files changed, 0 insertions(+), 248 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106729.patch
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106743.patch
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106761.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106729.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106729.patch
deleted file mode 100644
index 465d09c..0000000
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106729.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-2011-03-22  Andrew Stubbs  <ams@codesourcery.com>
-
-	Backport from FSF:
-
-	2011-03-21  Daniel Jacobowitz  <dan@codesourcery.com>
-
-	gcc/
-	* config/arm/unwind-arm.c (__gnu_unwind_pr_common): Correct test
-	for barrier handlers.
-
-=== modified file 'gcc/config/arm/unwind-arm.c'
---- old/gcc/config/arm/unwind-arm.c	2009-10-30 14:55:10 +0000
-+++ new/gcc/config/arm/unwind-arm.c	2011-03-22 10:59:10 +0000
-@@ -1196,8 +1196,6 @@
- 		  ucbp->barrier_cache.bitpattern[4] = (_uw) &data[1];
- 
- 		  if (data[0] & uint32_highbit)
--		    phase2_call_unexpected_after_unwind = 1;
--		  else
- 		    {
- 		      data += rtti_count + 1;
- 		      /* Setup for entry to the handler.  */
-@@ -1207,6 +1205,8 @@
- 		      _Unwind_SetGR (context, 0, (_uw) ucbp);
- 		      return _URC_INSTALL_CONTEXT;
- 		    }
-+		  else
-+		    phase2_call_unexpected_after_unwind = 1;
- 		}
- 	      if (data[0] & uint32_highbit)
- 		data++;
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106743.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106743.patch
deleted file mode 100644
index aba2a49..0000000
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106743.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-2011-04-26  Andrew Stubbs  <ams@codesourcery.com>
-
-	Backport from FSF:
-
-	2011-04-05  Tom de Vries  <tom@codesourcery.com>
-
-	PR target/43920
-	gcc/
-	* config/arm/arm.h (BRANCH_COST): Set to 1 for Thumb-2 when optimizing
-	for size.
-
-=== modified file 'gcc/config/arm/arm.h'
---- old/gcc/config/arm/arm.h	2011-05-03 15:17:25 +0000
-+++ new/gcc/config/arm/arm.h	2011-04-26 14:42:21 +0000
-@@ -2018,7 +2018,8 @@
- /* Try to generate sequences that don't involve branches, we can then use
-    conditional instructions */
- #define BRANCH_COST(speed_p, predictable_p) \
--  (TARGET_32BIT ? 4 : (optimize > 0 ? 2 : 0))
-+  (TARGET_32BIT ? (TARGET_THUMB2 && !speed_p ? 1 : 4) \
-+		: (optimize > 0 ? 2 : 0))
- 
- /* Position Independent Code.  */
- /* We decide which register to use based on the compilation options and
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106761.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106761.patch
deleted file mode 100644
index 4374e7e..0000000
--- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106761.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-	gcc/
-	Backport from mainline:
-
-	Chung-Lin Tang  <cltang@codesourcery.com>
-	Richard Earnshaw  <rearnsha@arm.com>
-
-	PR target/48250
-	* config/arm/arm.c (arm_legitimize_reload_address): Update cases
-	to use sign-magnitude offsets. Reject unsupported unaligned
-	cases. Add detailed description in comments.
-	* config/arm/arm.md (reload_outdf): Disable for ARM mode; change
-	condition from TARGET_32BIT to TARGET_ARM.
-
-	Chung-Lin Tang  <cltang@codesourcery.com>
-
-	* config/arm/arm.c (arm_legitimize_reload_address): For NEON
-	quad-word modes, reduce to 9-bit index range when above 1016
-	limit.
-
-=== modified file 'gcc/config/arm/arm.c'
---- old/gcc/config/arm/arm.c	2011-06-14 16:00:30 +0000
-+++ new/gcc/config/arm/arm.c	2011-06-27 22:14:07 +0000
-@@ -6488,23 +6488,134 @@
-       HOST_WIDE_INT val = INTVAL (XEXP (*p, 1));
-       HOST_WIDE_INT low, high;
- 
--      if (mode == DImode || (mode == DFmode && TARGET_SOFT_FLOAT))
--	low = ((val & 0xf) ^ 0x8) - 0x8;
--      else if (TARGET_MAVERICK && TARGET_HARD_FLOAT)
--	/* Need to be careful, -256 is not a valid offset.  */
--	low = val >= 0 ? (val & 0xff) : -((-val) & 0xff);
--      else if (mode == SImode
--	       || (mode == SFmode && TARGET_SOFT_FLOAT)
--	       || ((mode == HImode || mode == QImode) && ! arm_arch4))
--	/* Need to be careful, -4096 is not a valid offset.  */
--	low = val >= 0 ? (val & 0xfff) : -((-val) & 0xfff);
--      else if ((mode == HImode || mode == QImode) && arm_arch4)
--	/* Need to be careful, -256 is not a valid offset.  */
--	low = val >= 0 ? (val & 0xff) : -((-val) & 0xff);
--      else if (GET_MODE_CLASS (mode) == MODE_FLOAT
--	       && TARGET_HARD_FLOAT && TARGET_FPA)
--	/* Need to be careful, -1024 is not a valid offset.  */
--	low = val >= 0 ? (val & 0x3ff) : -((-val) & 0x3ff);
-+      /* Detect coprocessor load/stores.  */
-+      bool coproc_p = ((TARGET_HARD_FLOAT
-+			&& (TARGET_VFP || TARGET_FPA || TARGET_MAVERICK)
-+			&& (mode == SFmode || mode == DFmode
-+			    || (mode == DImode && TARGET_MAVERICK)))
-+		       || (TARGET_REALLY_IWMMXT
-+			   && VALID_IWMMXT_REG_MODE (mode))
-+		       || (TARGET_NEON
-+			   && (VALID_NEON_DREG_MODE (mode)
-+			       || VALID_NEON_QREG_MODE (mode))));
-+
-+      /* For some conditions, bail out when lower two bits are unaligned.  */
-+      if ((val & 0x3) != 0
-+	  /* Coprocessor load/store indexes are 8-bits + '00' appended.  */
-+	  && (coproc_p
-+	      /* For DI, and DF under soft-float: */
-+	      || ((mode == DImode || mode == DFmode)
-+		  /* Without ldrd, we use stm/ldm, which does not
-+		     fair well with unaligned bits.  */
-+		  && (! TARGET_LDRD
-+		      /* Thumb-2 ldrd/strd is [-1020,+1020] in steps of 4.  */
-+		      || TARGET_THUMB2))))
-+	return false;
-+
-+      /* When breaking down a [reg+index] reload address into [(reg+high)+low],
-+	 of which the (reg+high) gets turned into a reload add insn,
-+	 we try to decompose the index into high/low values that can often
-+	 also lead to better reload CSE.
-+	 For example:
-+	         ldr r0, [r2, #4100]  // Offset too large
-+		 ldr r1, [r2, #4104]  // Offset too large
-+
-+	 is best reloaded as:
-+	         add t1, r2, #4096
-+		 ldr r0, [t1, #4]
-+		 add t2, r2, #4096
-+		 ldr r1, [t2, #8]
-+
-+	 which post-reload CSE can simplify in most cases to eliminate the
-+	 second add instruction:
-+	         add t1, r2, #4096
-+		 ldr r0, [t1, #4]
-+		 ldr r1, [t1, #8]
-+
-+	 The idea here is that we want to split out the bits of the constant
-+	 as a mask, rather than as subtracting the maximum offset that the
-+	 respective type of load/store used can handle.
-+
-+	 When encountering negative offsets, we can still utilize it even if
-+	 the overall offset is positive; sometimes this may lead to an immediate
-+	 that can be constructed with fewer instructions.
-+	 For example:
-+	         ldr r0, [r2, #0x3FFFFC]
-+
-+	 This is best reloaded as:
-+	         add t1, r2, #0x400000
-+		 ldr r0, [t1, #-4]
-+
-+	 The trick for spotting this for a load insn with N bits of offset
-+	 (i.e. bits N-1:0) is to look at bit N; if it is set, then chose a
-+	 negative offset that is going to make bit N and all the bits below
-+	 it become zero in the remainder part.
-+
-+	 The SIGN_MAG_LOW_ADDR_BITS macro below implements this, with respect
-+	 to sign-magnitude addressing (i.e. separate +- bit, or 1's complement),
-+	 used in most cases of ARM load/store instructions.  */
-+
-+#define SIGN_MAG_LOW_ADDR_BITS(VAL, N)					\
-+      (((VAL) & ((1 << (N)) - 1))					\
-+       ? (((VAL) & ((1 << ((N) + 1)) - 1)) ^ (1 << (N))) - (1 << (N))	\
-+       : 0)
-+
-+      if (coproc_p)
-+	{
-+	  low = SIGN_MAG_LOW_ADDR_BITS (val, 10);
-+
-+	  /* NEON quad-word load/stores are made of two double-word accesses,
-+	     so the valid index range is reduced by 8. Treat as 9-bit range if
-+	     we go over it.  */
-+	  if (TARGET_NEON && VALID_NEON_QREG_MODE (mode) && low >= 1016)
-+	    low = SIGN_MAG_LOW_ADDR_BITS (val, 9);
-+	}
-+      else if (GET_MODE_SIZE (mode) == 8)
-+	{
-+	  if (TARGET_LDRD)
-+	    low = (TARGET_THUMB2
-+		   ? SIGN_MAG_LOW_ADDR_BITS (val, 10)
-+		   : SIGN_MAG_LOW_ADDR_BITS (val, 8));
-+	  else
-+	    /* For pre-ARMv5TE (without ldrd), we use ldm/stm(db/da/ib)
-+	       to access doublewords. The supported load/store offsets are
-+	       -8, -4, and 4, which we try to produce here.  */
-+	    low = ((val & 0xf) ^ 0x8) - 0x8;
-+	}
-+      else if (GET_MODE_SIZE (mode) < 8)
-+	{
-+	  /* NEON element load/stores do not have an offset.  */
-+	  if (TARGET_NEON_FP16 && mode == HFmode)
-+	    return false;
-+
-+	  if (TARGET_THUMB2)
-+	    {
-+	      /* Thumb-2 has an asymmetrical index range of (-256,4096).
-+		 Try the wider 12-bit range first, and re-try if the result
-+		 is out of range.  */
-+	      low = SIGN_MAG_LOW_ADDR_BITS (val, 12);
-+	      if (low < -255)
-+		low = SIGN_MAG_LOW_ADDR_BITS (val, 8);
-+	    }
-+	  else
-+	    {
-+	      if (mode == HImode || mode == HFmode)
-+		{
-+		  if (arm_arch4)
-+		    low = SIGN_MAG_LOW_ADDR_BITS (val, 8);
-+		  else
-+		    {
-+		      /* The storehi/movhi_bytes fallbacks can use only
-+			 [-4094,+4094] of the full ldrb/strb index range.  */
-+		      low = SIGN_MAG_LOW_ADDR_BITS (val, 12);
-+		      if (low == 4095 || low == -4095)
-+			return false;
-+		    }
-+		}
-+	      else
-+		low = SIGN_MAG_LOW_ADDR_BITS (val, 12);
-+	    }
-+	}
-       else
- 	return false;
- 
-
-=== modified file 'gcc/config/arm/arm.md'
---- old/gcc/config/arm/arm.md	2011-06-14 14:37:30 +0000
-+++ new/gcc/config/arm/arm.md	2011-06-27 22:14:07 +0000
-@@ -6267,7 +6267,7 @@
-   [(match_operand:DF 0 "arm_reload_memory_operand" "=o")
-    (match_operand:DF 1 "s_register_operand" "r")
-    (match_operand:SI 2 "s_register_operand" "=&r")]
--  "TARGET_32BIT"
-+  "TARGET_THUMB2"
-   "
-   {
-     enum rtx_code code = GET_CODE (XEXP (operands[0], 0));
-
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
index 1b4e05a..9ed282e 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
@@ -1,7 +1,6 @@
 GCC-4_6-BRANCH-LINARO-BACKPORTS = "        \
 file://linaro/gcc-4.6-linaro-r106720.patch \
 file://linaro/gcc-4.6-linaro-r106723.patch \
-file://linaro/gcc-4.6-linaro-r106729.patch \
 file://linaro/gcc-4.6-linaro-r106733.patch \
 file://linaro/gcc-4.6-linaro-r106737.patch \
 file://linaro/gcc-4.6-linaro-r106738.patch \
@@ -9,7 +8,6 @@ file://linaro/gcc-4.6-linaro-r106739.patch \
 file://linaro/gcc-4.6-linaro-r106740.patch \
 file://linaro/gcc-4.6-linaro-r106741.patch \
 file://linaro/gcc-4.6-linaro-r106742.patch \
-file://linaro/gcc-4.6-linaro-r106743.patch \
 file://linaro/gcc-4.6-linaro-r106744.patch \
 file://linaro/gcc-4.6-linaro-r106746.patch \
 file://linaro/gcc-4.6-linaro-r106747.patch \
@@ -19,7 +17,6 @@ file://linaro/gcc-4.6-linaro-r106753.patch \
 file://linaro/gcc-4.6-linaro-r106754.patch \
 file://linaro/gcc-4.6-linaro-r106755.patch \
 file://linaro/gcc-4.6-linaro-r106759.patch \
-file://linaro/gcc-4.6-linaro-r106761.patch \
 file://linaro/gcc-4.6-linaro-r106762.patch \
 file://linaro/gcc-4.6-linaro-r106763.patch \
 file://linaro/gcc-4.6-linaro-r106764.patch \
-- 
1.7.5.4



