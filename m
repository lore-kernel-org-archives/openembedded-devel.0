Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QoKlw-00058K-Kn
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Aug 2011 21:37:03 +0200
Received: by gxk3 with SMTP id 3so75963gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2011 12:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Vdh1VoIc5vEUXyZVgHNkT2qcGPEEQjIKe9ApoAWCIyc=;
	b=aMbzdCb7IaXHmfXS9/ADXyBDlcZMJYmqUFgy3CwfP69lvi3NLgX1jrZ40FxIu3dnJ7
	MFyN6fHKrxHAphL5IOr3q2lBhiPf+Wm8mr1aLd7uBD6H0ZrtH7S60iMXa/hC6nmO2a8U
	kbxPXNtQIwQdRzjqqyl6rVv6gLXd15MT6TSko=
Received: by 10.68.5.98 with SMTP id r2mr9953480pbr.98.1312313556889;
	Tue, 02 Aug 2011 12:32:36 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m7sm141334pbk.6.2011.08.02.12.32.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 12:32:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Aug 2011 12:32:19 -0700
Message-Id: <1312313539-3772-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] gcc-4.6: Bring in linaro patches upto 07.2011 release
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
X-List-Received-Date: Tue, 02 Aug 2011 19:37:03 -0000

I have build/run tested this patch on arm/mips/x86 and on ppc the image
did not build so could not run the image but that a different issue
right now being addressed in oe-core. 

see http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/007343.html

Similarily x86-64 built fine but
could not do boot testing since it is broken too see.

http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/007439.html

Otherwise angstrom/console-image
booted for all above said arches successfully except ppc x86_64 for the reasons
stated earlier. All builds were done from scratch w/o sstate

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106759.patch    |  545 ++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106761.patch    |  188 +++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106762.patch    | 1355 ++++++++++++++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch    |   96 ++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106764.patch    |   25 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106766.patch    |   25 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106768.patch    |  182 +++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch    | 1294 +++++++++++++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106770.patch    |  138 ++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106771.patch    |  211 +++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106772.patch    |  350 +++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106773.patch    |  119 ++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106775.patch    |   67 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106776.patch    |   46 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106777.patch    |  192 +++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106778.patch    |  225 ++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106781.patch    |  741 +++++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106782.patch    |   27 +
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |   18 +
 meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc    |    2 +-
 20 files changed, 5845 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106759.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106761.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106762.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106764.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106766.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106768.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106770.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106771.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106772.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106773.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106775.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106776.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106777.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106778.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106781.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106782.patch

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106759.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106759.patch
new file mode 100644
index 0000000..c515767
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106759.patch
@@ -0,0 +1,545 @@
+2011-06-20  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from mainline.
+	2011-06-03  Julian Brown  <julian@codesourcery.com>
+
+	* config/arm/arm-cores.def (strongarm, strongarm110, strongarm1100)
+	(strongarm1110): Use strongarm tuning.
+	* config/arm/arm-protos.h (tune_params): Add max_insns_skipped
+	field.
+	* config/arm/arm.c (arm_strongarm_tune): New.
+	(arm_slowmul_tune, arm_fastmul_tune, arm_xscale_tune, arm_9e_tune)
+	(arm_v6t2_tune, arm_cortex_tune, arm_cortex_a5_tune)
+	(arm_cortex_a9_tune, arm_fa726te_tune): Add max_insns_skipped field
+	setting, using previous defaults or 1 for Cortex-A5.
+	(arm_option_override): Set max_insns_skipped from current tuning.
+ 
+2011-06-14  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from mainline.
+	2011-06-02  Julian Brown  <julian@codesourcery.com>
+
+	* config/arm/arm-cores.def (cortex-a5): Use cortex_a5 tuning.
+	* config/arm/arm.c (arm_cortex_a5_branch_cost): New.
+	(arm_cortex_a5_tune): New.
+
+	2011-06-02  Julian Brown  <julian@codesourcery.com>
+
+	* config/arm/arm-protos.h (tune_params): Add branch_cost hook.
+	* config/arm/arm.c (arm_default_branch_cost): New.
+	(arm_slowmul_tune, arm_fastmul_tune, arm_xscale_tune, arm_9e_tune)
+	(arm_v6t2_tune, arm_cortex_tune, arm_cortex_a9_tune)
+	(arm_fa726_tune): Set branch_cost field using
+	arm_default_branch_cost.
+	* config/arm/arm.h (BRANCH_COST): Use branch_cost hook from
+	current_tune structure.
+	* dojump.c (tm_p.h): Include file.
+
+        2011-06-02  Julian Brown  <julian@codesourcery.com>
+
+	* config/arm/arm-cores.def (arm1156t2-s, arm1156t2f-s): Use v6t2
+	tuning.
+	(cortex-a5, cortex-a8, cortex-a15, cortex-r4, cortex-r4f, cortex-m4)
+	(cortex-m3, cortex-m1, cortex-m0): Use cortex tuning.
+	* config/arm/arm-protos.h (tune_params): Add prefer_constant_pool
+	field.
+	* config/arm/arm.c (arm_slowmul_tune, arm_fastmul_tune)
+	(arm_xscale_tune, arm_9e_tune, arm_cortex_a9_tune)
+	(arm_fa726te_tune): Add prefer_constant_pool setting.
+	(arm_v6t2_tune, arm_cortex_tune): New.
+	* config/arm/arm.h (TARGET_USE_MOVT): Make dependent on
+	prefer_constant_pool setting.
+
+2011-06-14  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from mainline
+	2011-06-01  Paul Brook  <paul@cpodesourcery.com>
+
+	* config/arm/arm-cores.def: Add cortex-r5.  Add DIV flags to
+	Cortex-A15.
+	* config/arm/arm-tune.md: Regenerate.
+	* config/arm/arm.c (FL_DIV): Rename...
+	(FL_THUMB_DIV): ... to this.
+	(FL_ARM_DIV): Define.
+	(FL_FOR_ARCH7R, FL_FOR_ARCH7M): Use FL_THUMB_DIV.
+	(arm_arch_hwdiv): Remove.
+	(arm_arch_thumb_hwdiv, arm_arch_arm_hwdiv): New variables.
+	(arm_issue_rate): Add cortexr5.
+	* config/arm/arm.h (TARGET_CPU_CPP_BUILTINS): Set
+	__ARM_ARCH_EXT_IDIV__.
+	(TARGET_IDIV): Define.
+	(arm_arch_hwdiv): Remove.
+	(arm_arch_arm_hwdiv, arm_arch_thumb_hwdiv): New prototypes.
+	* config/arm/arm.md (tune_cortexr4): Add cortexr5.
+	(divsi3, udivsi3): New patterns.
+	* config/arm/thumb2.md (divsi3, udivsi3): Remove.
+	* doc/invoke.texi: Document ARM -mcpu=cortex-r5
+
+=== modified file 'gcc/config/arm/arm-cores.def'
+--- old/gcc/config/arm/arm-cores.def	2011-01-03 20:52:22 +0000
++++ new/gcc/config/arm/arm-cores.def	2011-06-14 16:00:30 +0000
+@@ -70,10 +70,10 @@
+ /* V4 Architecture Processors */
+ ARM_CORE("arm8",          arm8,		4,	             FL_MODE26 | FL_LDSCHED, fastmul)
+ ARM_CORE("arm810",        arm810,	4,	             FL_MODE26 | FL_LDSCHED, fastmul)
+-ARM_CORE("strongarm",     strongarm,	4,	             FL_MODE26 | FL_LDSCHED | FL_STRONG, fastmul)
+-ARM_CORE("strongarm110",  strongarm110,	4,	             FL_MODE26 | FL_LDSCHED | FL_STRONG, fastmul)
+-ARM_CORE("strongarm1100", strongarm1100, 4,	             FL_MODE26 | FL_LDSCHED | FL_STRONG, fastmul)
+-ARM_CORE("strongarm1110", strongarm1110, 4,	             FL_MODE26 | FL_LDSCHED | FL_STRONG, fastmul)
++ARM_CORE("strongarm",     strongarm,	4,	             FL_MODE26 | FL_LDSCHED | FL_STRONG, strongarm)
++ARM_CORE("strongarm110",  strongarm110,	4,	             FL_MODE26 | FL_LDSCHED | FL_STRONG, strongarm)
++ARM_CORE("strongarm1100", strongarm1100, 4,	             FL_MODE26 | FL_LDSCHED | FL_STRONG, strongarm)
++ARM_CORE("strongarm1110", strongarm1110, 4,	             FL_MODE26 | FL_LDSCHED | FL_STRONG, strongarm)
+ ARM_CORE("fa526",         fa526,        4,                               FL_LDSCHED, fastmul)
+ ARM_CORE("fa626",         fa626,        4,                               FL_LDSCHED, fastmul)
+ 
+@@ -122,15 +122,16 @@
+ ARM_CORE("arm1176jzf-s",  arm1176jzfs,	6ZK,				 FL_LDSCHED | FL_VFPV2, 9e)
+ ARM_CORE("mpcorenovfp",	  mpcorenovfp,	6K,				 FL_LDSCHED, 9e)
+ ARM_CORE("mpcore",	  mpcore,	6K,				 FL_LDSCHED | FL_VFPV2, 9e)
+-ARM_CORE("arm1156t2-s",	  arm1156t2s,	6T2,				 FL_LDSCHED, 9e)
+-ARM_CORE("arm1156t2f-s",  arm1156t2fs,  6T2,				 FL_LDSCHED | FL_VFPV2, 9e)
+-ARM_CORE("cortex-a5",	  cortexa5,	7A,				 FL_LDSCHED, 9e)
+-ARM_CORE("cortex-a8",	  cortexa8,	7A,				 FL_LDSCHED, 9e)
++ARM_CORE("arm1156t2-s",	  arm1156t2s,	6T2,				 FL_LDSCHED, v6t2)
++ARM_CORE("arm1156t2f-s",  arm1156t2fs,  6T2,				 FL_LDSCHED | FL_VFPV2, v6t2)
++ARM_CORE("cortex-a5",	  cortexa5,	7A,				 FL_LDSCHED, cortex_a5)
++ARM_CORE("cortex-a8",	  cortexa8,	7A,				 FL_LDSCHED, cortex)
+ ARM_CORE("cortex-a9",	  cortexa9,	7A,				 FL_LDSCHED, cortex_a9)
+-ARM_CORE("cortex-a15",	  cortexa15,	7A,				 FL_LDSCHED, 9e)
+-ARM_CORE("cortex-r4",	  cortexr4,	7R,				 FL_LDSCHED, 9e)
+-ARM_CORE("cortex-r4f",	  cortexr4f,	7R,				 FL_LDSCHED, 9e)
+-ARM_CORE("cortex-m4",	  cortexm4,	7EM,				 FL_LDSCHED, 9e)
+-ARM_CORE("cortex-m3",	  cortexm3,	7M,				 FL_LDSCHED, 9e)
+-ARM_CORE("cortex-m1",	  cortexm1,	6M,				 FL_LDSCHED, 9e)
+-ARM_CORE("cortex-m0",	  cortexm0,	6M,				 FL_LDSCHED, 9e)
++ARM_CORE("cortex-a15",	  cortexa15,	7A,				 FL_LDSCHED | FL_THUMB_DIV | FL_ARM_DIV, cortex)
++ARM_CORE("cortex-r4",	  cortexr4,	7R,				 FL_LDSCHED, cortex)
++ARM_CORE("cortex-r4f",	  cortexr4f,	7R,				 FL_LDSCHED, cortex)
++ARM_CORE("cortex-r5",	  cortexr5,	7R,				 FL_LDSCHED | FL_ARM_DIV, cortex)
++ARM_CORE("cortex-m4",	  cortexm4,	7EM,				 FL_LDSCHED, cortex)
++ARM_CORE("cortex-m3",	  cortexm3,	7M,				 FL_LDSCHED, cortex)
++ARM_CORE("cortex-m1",	  cortexm1,	6M,				 FL_LDSCHED, cortex)
++ARM_CORE("cortex-m0",	  cortexm0,	6M,				 FL_LDSCHED, cortex)
+
+=== modified file 'gcc/config/arm/arm-protos.h'
+--- old/gcc/config/arm/arm-protos.h	2011-05-03 15:17:25 +0000
++++ new/gcc/config/arm/arm-protos.h	2011-06-14 16:00:30 +0000
+@@ -219,9 +219,14 @@
+   bool (*rtx_costs) (rtx, RTX_CODE, RTX_CODE, int *, bool);
+   bool (*sched_adjust_cost) (rtx, rtx, rtx, int *);
+   int constant_limit;
++  /* Maximum number of instructions to conditionalise in
++     arm_final_prescan_insn.  */
++  int max_insns_skipped;
+   int num_prefetch_slots;
+   int l1_cache_size;
+   int l1_cache_line_size;
++  bool prefer_constant_pool;
++  int (*branch_cost) (bool, bool);
+ };
+ 
+ extern const struct tune_params *current_tune;
+
+=== modified file 'gcc/config/arm/arm-tune.md'
+--- old/gcc/config/arm/arm-tune.md	2010-12-20 17:48:51 +0000
++++ new/gcc/config/arm/arm-tune.md	2011-06-14 14:37:30 +0000
+@@ -1,5 +1,5 @@
+ ;; -*- buffer-read-only: t -*-
+ ;; Generated automatically by gentune.sh from arm-cores.def
+ (define_attr "tune"
+-	"arm2,arm250,arm3,arm6,arm60,arm600,arm610,arm620,arm7,arm7d,arm7di,arm70,arm700,arm700i,arm710,arm720,arm710c,arm7100,arm7500,arm7500fe,arm7m,arm7dm,arm7dmi,arm8,arm810,strongarm,strongarm110,strongarm1100,strongarm1110,fa526,fa626,arm7tdmi,arm7tdmis,arm710t,arm720t,arm740t,arm9,arm9tdmi,arm920,arm920t,arm922t,arm940t,ep9312,arm10tdmi,arm1020t,arm9e,arm946es,arm966es,arm968es,arm10e,arm1020e,arm1022e,xscale,iwmmxt,iwmmxt2,fa606te,fa626te,fmp626,fa726te,arm926ejs,arm1026ejs,arm1136js,arm1136jfs,arm1176jzs,arm1176jzfs,mpcorenovfp,mpcore,arm1156t2s,arm1156t2fs,cortexa5,cortexa8,cortexa9,cortexa15,cortexr4,cortexr4f,cortexm4,cortexm3,cortexm1,cortexm0"
++	"arm2,arm250,arm3,arm6,arm60,arm600,arm610,arm620,arm7,arm7d,arm7di,arm70,arm700,arm700i,arm710,arm720,arm710c,arm7100,arm7500,arm7500fe,arm7m,arm7dm,arm7dmi,arm8,arm810,strongarm,strongarm110,strongarm1100,strongarm1110,fa526,fa626,arm7tdmi,arm7tdmis,arm710t,arm720t,arm740t,arm9,arm9tdmi,arm920,arm920t,arm922t,arm940t,ep9312,arm10tdmi,arm1020t,arm9e,arm946es,arm966es,arm968es,arm10e,arm1020e,arm1022e,xscale,iwmmxt,iwmmxt2,fa606te,fa626te,fmp626,fa726te,arm926ejs,arm1026ejs,arm1136js,arm1136jfs,arm1176jzs,arm1176jzfs,mpcorenovfp,mpcore,arm1156t2s,arm1156t2fs,cortexa5,cortexa8,cortexa9,cortexa15,cortexr4,cortexr4f,cortexr5,cortexm4,cortexm3,cortexm1,cortexm0"
+ 	(const (symbol_ref "((enum attr_tune) arm_tune)")))
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-05-11 14:49:48 +0000
++++ new/gcc/config/arm/arm.c	2011-06-14 16:00:30 +0000
+@@ -255,6 +255,8 @@
+ static void arm_conditional_register_usage (void);
+ static reg_class_t arm_preferred_rename_class (reg_class_t rclass);
+ static unsigned int arm_autovectorize_vector_sizes (void);
++static int arm_default_branch_cost (bool, bool);
++static int arm_cortex_a5_branch_cost (bool, bool);
+ 
+ 
+ /* Table of machine attributes.  */
+@@ -672,12 +674,13 @@
+ #define FL_THUMB2     (1 << 16)	      /* Thumb-2.  */
+ #define FL_NOTM	      (1 << 17)	      /* Instructions not present in the 'M'
+ 					 profile.  */
+-#define FL_DIV	      (1 << 18)	      /* Hardware divide.  */
++#define FL_THUMB_DIV  (1 << 18)	      /* Hardware divide (Thumb mode).  */
+ #define FL_VFPV3      (1 << 19)       /* Vector Floating Point V3.  */
+ #define FL_NEON       (1 << 20)       /* Neon instructions.  */
+ #define FL_ARCH7EM    (1 << 21)	      /* Instructions present in the ARMv7E-M
+ 					 architecture.  */
+ #define FL_ARCH7      (1 << 22)       /* Architecture 7.  */
++#define FL_ARM_DIV    (1 << 23)	      /* Hardware divide (ARM mode).  */
+ 
+ #define FL_IWMMXT     (1 << 29)	      /* XScale v2 or "Intel Wireless MMX technology".  */
+ 
+@@ -704,8 +707,8 @@
+ #define FL_FOR_ARCH6M	(FL_FOR_ARCH6 & ~FL_NOTM)
+ #define FL_FOR_ARCH7	((FL_FOR_ARCH6T2 & ~FL_NOTM) | FL_ARCH7)
+ #define FL_FOR_ARCH7A	(FL_FOR_ARCH7 | FL_NOTM | FL_ARCH6K)
+-#define FL_FOR_ARCH7R	(FL_FOR_ARCH7A | FL_DIV)
+-#define FL_FOR_ARCH7M	(FL_FOR_ARCH7 | FL_DIV)
++#define FL_FOR_ARCH7R	(FL_FOR_ARCH7A | FL_THUMB_DIV)
++#define FL_FOR_ARCH7M	(FL_FOR_ARCH7 | FL_THUMB_DIV)
+ #define FL_FOR_ARCH7EM  (FL_FOR_ARCH7M | FL_ARCH7EM)
+ 
+ /* The bits in this mask specify which
+@@ -791,7 +794,8 @@
+ int arm_arch_thumb2;
+ 
+ /* Nonzero if chip supports integer division instruction.  */
+-int arm_arch_hwdiv;
++int arm_arch_arm_hwdiv;
++int arm_arch_thumb_hwdiv;
+ 
+ /* In case of a PRE_INC, POST_INC, PRE_DEC, POST_DEC memory reference,
+    we must report the mode of the memory reference from
+@@ -864,48 +868,117 @@
+ {
+   arm_slowmul_rtx_costs,
+   NULL,
+-  3,
+-  ARM_PREFETCH_NOT_BENEFICIAL
++  3,						/* Constant limit.  */
++  5,						/* Max cond insns.  */
++  ARM_PREFETCH_NOT_BENEFICIAL,
++  true,						/* Prefer constant pool.  */
++  arm_default_branch_cost
+ };
+ 
+ const struct tune_params arm_fastmul_tune =
+ {
+   arm_fastmul_rtx_costs,
+   NULL,
+-  1,
+-  ARM_PREFETCH_NOT_BENEFICIAL
++  1,						/* Constant limit.  */
++  5,						/* Max cond insns.  */
++  ARM_PREFETCH_NOT_BENEFICIAL,
++  true,						/* Prefer constant pool.  */
++  arm_default_branch_cost
++};
++
++/* StrongARM has early execution of branches, so a sequence that is worth
++   skipping is shorter.  Set max_insns_skipped to a lower value.  */
++
++const struct tune_params arm_strongarm_tune =
++{
++  arm_fastmul_rtx_costs,
++  NULL,
++  1,						/* Constant limit.  */
++  3,						/* Max cond insns.  */
++  ARM_PREFETCH_NOT_BENEFICIAL,
++  true,						/* Prefer constant pool.  */
++  arm_default_branch_cost
+ };
+ 
+ const struct tune_params arm_xscale_tune =
+ {
+   arm_xscale_rtx_costs,
+   xscale_sched_adjust_cost,
+-  2,
+-  ARM_PREFETCH_NOT_BENEFICIAL
++  2,						/* Constant limit.  */
++  3,						/* Max cond insns.  */
++  ARM_PREFETCH_NOT_BENEFICIAL,
++  true,						/* Prefer constant pool.  */
++  arm_default_branch_cost
+ };
+ 
+ const struct tune_params arm_9e_tune =
+ {
+   arm_9e_rtx_costs,
+   NULL,
+-  1,
+-  ARM_PREFETCH_NOT_BENEFICIAL
++  1,						/* Constant limit.  */
++  5,						/* Max cond insns.  */
++  ARM_PREFETCH_NOT_BENEFICIAL,
++  true,						/* Prefer constant pool.  */
++  arm_default_branch_cost
++};
++
++const struct tune_params arm_v6t2_tune =
++{
++  arm_9e_rtx_costs,
++  NULL,
++  1,						/* Constant limit.  */
++  5,						/* Max cond insns.  */
++  ARM_PREFETCH_NOT_BENEFICIAL,
++  false,					/* Prefer constant pool.  */
++  arm_default_branch_cost
++};
++
++/* Generic Cortex tuning.  Use more specific tunings if appropriate.  */
++const struct tune_params arm_cortex_tune =
++{
++  arm_9e_rtx_costs,
++  NULL,
++  1,						/* Constant limit.  */
++  5,						/* Max cond insns.  */
++  ARM_PREFETCH_NOT_BENEFICIAL,
++  false,					/* Prefer constant pool.  */
++  arm_default_branch_cost
++};
++
++/* Branches can be dual-issued on Cortex-A5, so conditional execution is
++   less appealing.  Set max_insns_skipped to a low value.  */
++
++const struct tune_params arm_cortex_a5_tune =
++{
++  arm_9e_rtx_costs,
++  NULL,
++  1,						/* Constant limit.  */
++  1,						/* Max cond insns.  */
++  ARM_PREFETCH_NOT_BENEFICIAL,
++  false,					/* Prefer constant pool.  */
++  arm_cortex_a5_branch_cost
+ };
+ 
+ const struct tune_params arm_cortex_a9_tune =
+ {
+   arm_9e_rtx_costs,
+   cortex_a9_sched_adjust_cost,
+-  1,
+-  ARM_PREFETCH_BENEFICIAL(4,32,32)
++  1,						/* Constant limit.  */
++  5,						/* Max cond insns.  */
++  ARM_PREFETCH_BENEFICIAL(4,32,32),
++  false,					/* Prefer constant pool.  */
++  arm_default_branch_cost
+ };
+ 
+ const struct tune_params arm_fa726te_tune =
+ {
+   arm_9e_rtx_costs,
+   fa726te_sched_adjust_cost,
+-  1,
+-  ARM_PREFETCH_NOT_BENEFICIAL
++  1,						/* Constant limit.  */
++  5,						/* Max cond insns.  */
++  ARM_PREFETCH_NOT_BENEFICIAL,
++  true,						/* Prefer constant pool.  */
++  arm_default_branch_cost
+ };
+ 
+ 
+@@ -1711,7 +1784,8 @@
+   arm_tune_wbuf = (tune_flags & FL_WBUF) != 0;
+   arm_tune_xscale = (tune_flags & FL_XSCALE) != 0;
+   arm_arch_iwmmxt = (insn_flags & FL_IWMMXT) != 0;
+-  arm_arch_hwdiv = (insn_flags & FL_DIV) != 0;
++  arm_arch_thumb_hwdiv = (insn_flags & FL_THUMB_DIV) != 0;
++  arm_arch_arm_hwdiv = (insn_flags & FL_ARM_DIV) != 0;
+   arm_tune_cortex_a9 = (arm_tune == cortexa9) != 0;
+ 
+   /* If we are not using the default (ARM mode) section anchor offset
+@@ -1991,12 +2065,7 @@
+       max_insns_skipped = 6;
+     }
+   else
+-    {
+-      /* StrongARM has early execution of branches, so a sequence
+-         that is worth skipping is shorter.  */
+-      if (arm_tune_strongarm)
+-        max_insns_skipped = 3;
+-    }
++    max_insns_skipped = current_tune->max_insns_skipped;
+ 
+   /* Hot/Cold partitioning is not currently supported, since we can't
+      handle literal pool placement in that case.  */
+@@ -8211,6 +8280,21 @@
+   return cost;
+ }
+ 
++static int
++arm_default_branch_cost (bool speed_p, bool predictable_p ATTRIBUTE_UNUSED)
++{
++  if (TARGET_32BIT)
++    return (TARGET_THUMB2 && !speed_p) ? 1 : 4;
++  else
++    return (optimize > 0) ? 2 : 0;
++}
++
++static int
++arm_cortex_a5_branch_cost (bool speed_p, bool predictable_p)
++{
++  return speed_p ? 0 : arm_default_branch_cost (speed_p, predictable_p);
++}
++
+ static int fp_consts_inited = 0;
+ 
+ /* Only zero is valid for VFP.  Other values are also valid for FPA.  */
+@@ -23123,6 +23207,7 @@
+     {
+     case cortexr4:
+     case cortexr4f:
++    case cortexr5:
+     case cortexa5:
+     case cortexa8:
+     case cortexa9:
+
+=== modified file 'gcc/config/arm/arm.h'
+--- old/gcc/config/arm/arm.h	2011-06-02 12:12:00 +0000
++++ new/gcc/config/arm/arm.h	2011-06-14 14:53:07 +0000
+@@ -101,6 +101,8 @@
+ 	      builtin_define ("__ARM_PCS");		\
+ 	    builtin_define ("__ARM_EABI__");		\
+ 	  }						\
++	if (TARGET_IDIV)				\
++	  builtin_define ("__ARM_ARCH_EXT_IDIV__");	\
+     } while (0)
+ 
+ /* The various ARM cores.  */
+@@ -282,7 +284,8 @@
+   (TARGET_32BIT && arm_arch6 && (arm_arch_notm || arm_arch7em))
+ 
+ /* Should MOVW/MOVT be used in preference to a constant pool.  */
+-#define TARGET_USE_MOVT (arm_arch_thumb2 && !optimize_size)
++#define TARGET_USE_MOVT \
++  (arm_arch_thumb2 && !optimize_size && !current_tune->prefer_constant_pool)
+ 
+ /* We could use unified syntax for arm mode, but for now we just use it
+    for Thumb-2.  */
+@@ -303,6 +306,10 @@
+ /* Nonzero if this chip supports ldrex{bhd} and strex{bhd}.  */
+ #define TARGET_HAVE_LDREXBHD	((arm_arch6k && TARGET_ARM) || arm_arch7)
+ 
++/* Nonzero if integer division instructions supported.  */
++#define TARGET_IDIV		((TARGET_ARM && arm_arch_arm_hwdiv) \
++				 || (TARGET_THUMB2 && arm_arch_thumb_hwdiv))
++
+ /* True iff the full BPABI is being used.  If TARGET_BPABI is true,
+    then TARGET_AAPCS_BASED must be true -- but the converse does not
+    hold.  TARGET_BPABI implies the use of the BPABI runtime library,
+@@ -487,8 +494,11 @@
+ /* Nonzero if chip supports Thumb 2.  */
+ extern int arm_arch_thumb2;
+ 
+-/* Nonzero if chip supports integer division instruction.  */
+-extern int arm_arch_hwdiv;
++/* Nonzero if chip supports integer division instruction in ARM mode.  */
++extern int arm_arch_arm_hwdiv;
++
++/* Nonzero if chip supports integer division instruction in Thumb mode.  */
++extern int arm_arch_thumb_hwdiv;
+ 
+ #ifndef TARGET_DEFAULT
+ #define TARGET_DEFAULT  (MASK_APCS_FRAME)
+@@ -2018,8 +2028,8 @@
+ /* Try to generate sequences that don't involve branches, we can then use
+    conditional instructions */
+ #define BRANCH_COST(speed_p, predictable_p) \
+-  (TARGET_32BIT ? (TARGET_THUMB2 && !speed_p ? 1 : 4) \
+-		: (optimize > 0 ? 2 : 0))
++  (current_tune->branch_cost (speed_p, predictable_p))
++
+ 
+ /* Position Independent Code.  */
+ /* We decide which register to use based on the compilation options and
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-06-02 15:58:33 +0000
++++ new/gcc/config/arm/arm.md	2011-06-14 14:37:30 +0000
+@@ -490,7 +490,7 @@
+ 
+ (define_attr "tune_cortexr4" "yes,no"
+   (const (if_then_else
+-	  (eq_attr "tune" "cortexr4,cortexr4f")
++	  (eq_attr "tune" "cortexr4,cortexr4f,cortexr5")
+ 	  (const_string "yes")
+ 	  (const_string "no"))))
+ 
+@@ -3738,6 +3738,28 @@
+    (set_attr "predicable" "yes")]
+ )
+ 
++
++;; Division instructions
++(define_insn "divsi3"
++  [(set (match_operand:SI	  0 "s_register_operand" "=r")
++	(div:SI (match_operand:SI 1 "s_register_operand"  "r")
++		(match_operand:SI 2 "s_register_operand"  "r")))]
++  "TARGET_IDIV"
++  "sdiv%?\t%0, %1, %2"
++  [(set_attr "predicable" "yes")
++   (set_attr "insn" "sdiv")]
++)
++
++(define_insn "udivsi3"
++  [(set (match_operand:SI	   0 "s_register_operand" "=r")
++	(udiv:SI (match_operand:SI 1 "s_register_operand"  "r")
++		 (match_operand:SI 2 "s_register_operand"  "r")))]
++  "TARGET_IDIV"
++  "udiv%?\t%0, %1, %2"
++  [(set_attr "predicable" "yes")
++   (set_attr "insn" "udiv")]
++)
++
+ 
+ ;; Unary arithmetic insns
+ 
+
+=== modified file 'gcc/config/arm/thumb2.md'
+--- old/gcc/config/arm/thumb2.md	2011-05-11 07:15:47 +0000
++++ new/gcc/config/arm/thumb2.md	2011-06-14 14:37:30 +0000
+@@ -779,26 +779,6 @@
+    (set_attr "length" "2")]
+ )
+ 
+-(define_insn "divsi3"
+-  [(set (match_operand:SI	  0 "s_register_operand" "=r")
+-	(div:SI (match_operand:SI 1 "s_register_operand"  "r")
+-		(match_operand:SI 2 "s_register_operand"  "r")))]
+-  "TARGET_THUMB2 && arm_arch_hwdiv"
+-  "sdiv%?\t%0, %1, %2"
+-  [(set_attr "predicable" "yes")
+-   (set_attr "insn" "sdiv")]
+-)
+-
+-(define_insn "udivsi3"
+-  [(set (match_operand:SI	   0 "s_register_operand" "=r")
+-	(udiv:SI (match_operand:SI 1 "s_register_operand"  "r")
+-		 (match_operand:SI 2 "s_register_operand"  "r")))]
+-  "TARGET_THUMB2 && arm_arch_hwdiv"
+-  "udiv%?\t%0, %1, %2"
+-  [(set_attr "predicable" "yes")
+-   (set_attr "insn" "udiv")]
+-)
+-
+ (define_insn "*thumb2_subsi_short"
+   [(set (match_operand:SI 0 "low_register_operand" "=l")
+ 	(minus:SI (match_operand:SI 1 "low_register_operand" "l")
+
+=== modified file 'gcc/doc/invoke.texi'
+--- old/gcc/doc/invoke.texi	2011-05-11 07:15:47 +0000
++++ new/gcc/doc/invoke.texi	2011-06-14 14:37:30 +0000
+@@ -10208,7 +10208,8 @@
+ @samp{arm1136j-s}, @samp{arm1136jf-s}, @samp{mpcore}, @samp{mpcorenovfp},
+ @samp{arm1156t2-s}, @samp{arm1156t2f-s}, @samp{arm1176jz-s}, @samp{arm1176jzf-s},
+ @samp{cortex-a5}, @samp{cortex-a8}, @samp{cortex-a9}, @samp{cortex-a15},
+-@samp{cortex-r4}, @samp{cortex-r4f}, @samp{cortex-m4}, @samp{cortex-m3},
++@samp{cortex-r4}, @samp{cortex-r4f}, @samp{cortex-r5},
++@samp{cortex-m4}, @samp{cortex-m3},
+ @samp{cortex-m1},
+ @samp{cortex-m0},
+ @samp{xscale}, @samp{iwmmxt}, @samp{iwmmxt2}, @samp{ep9312}.
+
+=== modified file 'gcc/dojump.c'
+--- old/gcc/dojump.c	2010-05-19 19:09:57 +0000
++++ new/gcc/dojump.c	2011-06-14 14:53:07 +0000
+@@ -36,6 +36,7 @@
+ #include "ggc.h"
+ #include "basic-block.h"
+ #include "output.h"
++#include "tm_p.h"
+ 
+ static bool prefer_and_bit_test (enum machine_mode, int);
+ static void do_jump_by_parts_greater (tree, tree, int, rtx, rtx, int);
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106761.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106761.patch
new file mode 100644
index 0000000..4374e7e
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106761.patch
@@ -0,0 +1,188 @@
+	gcc/
+	Backport from mainline:
+
+	Chung-Lin Tang  <cltang@codesourcery.com>
+	Richard Earnshaw  <rearnsha@arm.com>
+
+	PR target/48250
+	* config/arm/arm.c (arm_legitimize_reload_address): Update cases
+	to use sign-magnitude offsets. Reject unsupported unaligned
+	cases. Add detailed description in comments.
+	* config/arm/arm.md (reload_outdf): Disable for ARM mode; change
+	condition from TARGET_32BIT to TARGET_ARM.
+
+	Chung-Lin Tang  <cltang@codesourcery.com>
+
+	* config/arm/arm.c (arm_legitimize_reload_address): For NEON
+	quad-word modes, reduce to 9-bit index range when above 1016
+	limit.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-06-14 16:00:30 +0000
++++ new/gcc/config/arm/arm.c	2011-06-27 22:14:07 +0000
+@@ -6488,23 +6488,134 @@
+       HOST_WIDE_INT val = INTVAL (XEXP (*p, 1));
+       HOST_WIDE_INT low, high;
+ 
+-      if (mode == DImode || (mode == DFmode && TARGET_SOFT_FLOAT))
+-	low = ((val & 0xf) ^ 0x8) - 0x8;
+-      else if (TARGET_MAVERICK && TARGET_HARD_FLOAT)
+-	/* Need to be careful, -256 is not a valid offset.  */
+-	low = val >= 0 ? (val & 0xff) : -((-val) & 0xff);
+-      else if (mode == SImode
+-	       || (mode == SFmode && TARGET_SOFT_FLOAT)
+-	       || ((mode == HImode || mode == QImode) && ! arm_arch4))
+-	/* Need to be careful, -4096 is not a valid offset.  */
+-	low = val >= 0 ? (val & 0xfff) : -((-val) & 0xfff);
+-      else if ((mode == HImode || mode == QImode) && arm_arch4)
+-	/* Need to be careful, -256 is not a valid offset.  */
+-	low = val >= 0 ? (val & 0xff) : -((-val) & 0xff);
+-      else if (GET_MODE_CLASS (mode) == MODE_FLOAT
+-	       && TARGET_HARD_FLOAT && TARGET_FPA)
+-	/* Need to be careful, -1024 is not a valid offset.  */
+-	low = val >= 0 ? (val & 0x3ff) : -((-val) & 0x3ff);
++      /* Detect coprocessor load/stores.  */
++      bool coproc_p = ((TARGET_HARD_FLOAT
++			&& (TARGET_VFP || TARGET_FPA || TARGET_MAVERICK)
++			&& (mode == SFmode || mode == DFmode
++			    || (mode == DImode && TARGET_MAVERICK)))
++		       || (TARGET_REALLY_IWMMXT
++			   && VALID_IWMMXT_REG_MODE (mode))
++		       || (TARGET_NEON
++			   && (VALID_NEON_DREG_MODE (mode)
++			       || VALID_NEON_QREG_MODE (mode))));
++
++      /* For some conditions, bail out when lower two bits are unaligned.  */
++      if ((val & 0x3) != 0
++	  /* Coprocessor load/store indexes are 8-bits + '00' appended.  */
++	  && (coproc_p
++	      /* For DI, and DF under soft-float: */
++	      || ((mode == DImode || mode == DFmode)
++		  /* Without ldrd, we use stm/ldm, which does not
++		     fair well with unaligned bits.  */
++		  && (! TARGET_LDRD
++		      /* Thumb-2 ldrd/strd is [-1020,+1020] in steps of 4.  */
++		      || TARGET_THUMB2))))
++	return false;
++
++      /* When breaking down a [reg+index] reload address into [(reg+high)+low],
++	 of which the (reg+high) gets turned into a reload add insn,
++	 we try to decompose the index into high/low values that can often
++	 also lead to better reload CSE.
++	 For example:
++	         ldr r0, [r2, #4100]  // Offset too large
++		 ldr r1, [r2, #4104]  // Offset too large
++
++	 is best reloaded as:
++	         add t1, r2, #4096
++		 ldr r0, [t1, #4]
++		 add t2, r2, #4096
++		 ldr r1, [t2, #8]
++
++	 which post-reload CSE can simplify in most cases to eliminate the
++	 second add instruction:
++	         add t1, r2, #4096
++		 ldr r0, [t1, #4]
++		 ldr r1, [t1, #8]
++
++	 The idea here is that we want to split out the bits of the constant
++	 as a mask, rather than as subtracting the maximum offset that the
++	 respective type of load/store used can handle.
++
++	 When encountering negative offsets, we can still utilize it even if
++	 the overall offset is positive; sometimes this may lead to an immediate
++	 that can be constructed with fewer instructions.
++	 For example:
++	         ldr r0, [r2, #0x3FFFFC]
++
++	 This is best reloaded as:
++	         add t1, r2, #0x400000
++		 ldr r0, [t1, #-4]
++
++	 The trick for spotting this for a load insn with N bits of offset
++	 (i.e. bits N-1:0) is to look at bit N; if it is set, then chose a
++	 negative offset that is going to make bit N and all the bits below
++	 it become zero in the remainder part.
++
++	 The SIGN_MAG_LOW_ADDR_BITS macro below implements this, with respect
++	 to sign-magnitude addressing (i.e. separate +- bit, or 1's complement),
++	 used in most cases of ARM load/store instructions.  */
++
++#define SIGN_MAG_LOW_ADDR_BITS(VAL, N)					\
++      (((VAL) & ((1 << (N)) - 1))					\
++       ? (((VAL) & ((1 << ((N) + 1)) - 1)) ^ (1 << (N))) - (1 << (N))	\
++       : 0)
++
++      if (coproc_p)
++	{
++	  low = SIGN_MAG_LOW_ADDR_BITS (val, 10);
++
++	  /* NEON quad-word load/stores are made of two double-word accesses,
++	     so the valid index range is reduced by 8. Treat as 9-bit range if
++	     we go over it.  */
++	  if (TARGET_NEON && VALID_NEON_QREG_MODE (mode) && low >= 1016)
++	    low = SIGN_MAG_LOW_ADDR_BITS (val, 9);
++	}
++      else if (GET_MODE_SIZE (mode) == 8)
++	{
++	  if (TARGET_LDRD)
++	    low = (TARGET_THUMB2
++		   ? SIGN_MAG_LOW_ADDR_BITS (val, 10)
++		   : SIGN_MAG_LOW_ADDR_BITS (val, 8));
++	  else
++	    /* For pre-ARMv5TE (without ldrd), we use ldm/stm(db/da/ib)
++	       to access doublewords. The supported load/store offsets are
++	       -8, -4, and 4, which we try to produce here.  */
++	    low = ((val & 0xf) ^ 0x8) - 0x8;
++	}
++      else if (GET_MODE_SIZE (mode) < 8)
++	{
++	  /* NEON element load/stores do not have an offset.  */
++	  if (TARGET_NEON_FP16 && mode == HFmode)
++	    return false;
++
++	  if (TARGET_THUMB2)
++	    {
++	      /* Thumb-2 has an asymmetrical index range of (-256,4096).
++		 Try the wider 12-bit range first, and re-try if the result
++		 is out of range.  */
++	      low = SIGN_MAG_LOW_ADDR_BITS (val, 12);
++	      if (low < -255)
++		low = SIGN_MAG_LOW_ADDR_BITS (val, 8);
++	    }
++	  else
++	    {
++	      if (mode == HImode || mode == HFmode)
++		{
++		  if (arm_arch4)
++		    low = SIGN_MAG_LOW_ADDR_BITS (val, 8);
++		  else
++		    {
++		      /* The storehi/movhi_bytes fallbacks can use only
++			 [-4094,+4094] of the full ldrb/strb index range.  */
++		      low = SIGN_MAG_LOW_ADDR_BITS (val, 12);
++		      if (low == 4095 || low == -4095)
++			return false;
++		    }
++		}
++	      else
++		low = SIGN_MAG_LOW_ADDR_BITS (val, 12);
++	    }
++	}
+       else
+ 	return false;
+ 
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-06-14 14:37:30 +0000
++++ new/gcc/config/arm/arm.md	2011-06-27 22:14:07 +0000
+@@ -6267,7 +6267,7 @@
+   [(match_operand:DF 0 "arm_reload_memory_operand" "=o")
+    (match_operand:DF 1 "s_register_operand" "r")
+    (match_operand:SI 2 "s_register_operand" "=&r")]
+-  "TARGET_32BIT"
++  "TARGET_THUMB2"
+   "
+   {
+     enum rtx_code code = GET_CODE (XEXP (operands[0], 0));
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106762.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106762.patch
new file mode 100644
index 0000000..bbf9819
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106762.patch
@@ -0,0 +1,1355 @@
+2011-06-28  Ira Rosen  <ira.rosen@linaro.org>
+
+	Backport from FSF:
+
+	2011-06-07  Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	* tree-vectorizer.h (vect_recog_func_ptr): Make last argument to be
+	a pointer.
+	* tree-vect-patterns.c (vect_recog_widen_sum_pattern,
+	vect_recog_widen_mult_pattern, vect_recog_dot_prod_pattern,
+	vect_recog_pow_pattern): Likewise.
+	(vect_pattern_recog_1): Remove declaration.
+	(widened_name_p): Remove declaration.  Add new argument to specify
+	whether to check that both types are either signed or unsigned.
+	(vect_recog_widen_mult_pattern): Update documentation.  Handle
+	unsigned patterns and multiplication by constants.
+	(vect_pattern_recog_1): Update vect_recog_func references.  Use
+	statement information from the statement returned from pattern
+	detection functions.
+	(vect_pattern_recog): Update vect_recog_func reference.
+	* tree-vect-stmts.c (vectorizable_type_promotion): For widening
+	multiplication by a constant use the type of the other operand.
+
+	gcc/testsuite
+	* lib/target-supports.exp
+	(check_effective_target_vect_widen_mult_qi_to_hi):
+	Add NEON as supporting target.
+	(check_effective_target_vect_widen_mult_hi_to_si): Likewise.
+	(check_effective_target_vect_widen_mult_qi_to_hi_pattern): New.
+	(check_effective_target_vect_widen_mult_hi_to_si_pattern): New.
+	* gcc.dg/vect/vect-widen-mult-u8.c: Expect to be vectorized
+	using widening multiplication on targets that support it.
+	* gcc.dg/vect/vect-widen-mult-u16.c: Likewise.
+	* gcc.dg/vect/vect-widen-mult-const-s16.c: New test.
+	* gcc.dg/vect/vect-widen-mult-const-u16.c: New test.
+
+	and
+
+	2011-06-15  Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	* tree-vect-loop-manip.c (remove_dead_stmts_from_loop): Remove.
+	(slpeel_tree_peel_loop_to_edge): Don't call
+	remove_dead_stmts_from_loop.
+	* tree-vect-loop.c (vect_determine_vectorization_factor): Don't
+	remove irrelevant pattern statements.  For irrelevant statements
+	check if it is the last statement of a detected pattern, use
+	corresponding pattern statement instead.
+	(destroy_loop_vec_info): No need to remove pattern statements,
+	only free stmt_vec_info.
+	(vect_transform_loop): For irrelevant statements check if it is
+	the last statement of a detected pattern, use corresponding
+	pattern statement instead.
+	* tree-vect-patterns.c (vect_pattern_recog_1): Don't insert
+	pattern statements.  Set basic block for the new statement.
+	(vect_pattern_recog): Update documentation.
+	* tree-vect-stmts.c (vect_mark_stmts_to_be_vectorized): Scan
+	operands of pattern statements.
+	(vectorizable_call): Fix printing.  In case of a pattern statement
+	use the lhs of the original statement when creating a dummy
+	statement to replace the original call.
+	(vect_analyze_stmt): For irrelevant statements check if it is
+	the last statement of a detected pattern, use corresponding
+	pattern statement instead.
+	* tree-vect-slp.c (vect_schedule_slp_instance): For pattern
+	statements use gsi of the original statement.
+
+	and
+	2011-06-21  Ira Rosen  <ira.rosen@linaro.org>
+
+	PR tree-optimization/49478
+	gcc/
+
+	* tree-vect-loop.c (vectorizable_reduction): Handle DOT_PROD_EXPR
+	with constant operand.
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-widen-mult-const-s16.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-widen-mult-const-s16.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-widen-mult-const-s16.c	2011-06-19 10:59:13 +0000
+@@ -0,0 +1,60 @@
++/* { dg-require-effective-target vect_int } */
++
++#include "tree-vect.h"
++#include <stdlib.h>
++
++#define N 32
++
++__attribute__ ((noinline)) void 
++foo (int *__restrict a,
++     short *__restrict b,
++     int n)
++{
++  int i;
++
++  for (i = 0; i < n; i++)
++    a[i] = b[i] * 2333;
++
++  for (i = 0; i < n; i++)
++    if (a[i] != b[i] * 2333)
++      abort ();
++}
++
++__attribute__ ((noinline)) void
++bar (int *__restrict a,
++     short *__restrict b,
++     int n)
++{
++  int i;
++
++  for (i = 0; i < n; i++)
++    a[i] = b[i] * (short) 2333;
++
++  for (i = 0; i < n; i++)
++    if (a[i] != b[i] * (short) 2333)
++      abort ();
++}
++
++int main (void)
++{
++  int i;
++  int a[N];
++  short b[N];
++
++  for (i = 0; i < N; i++)
++    {
++      a[i] = 0;
++      b[i] = i;
++      __asm__ volatile ("");
++    }
++
++  foo (a, b, N);
++  bar (a, b, N);
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 2 "vect" { target vect_widen_mult_hi_to_si } } } */
++/* { dg-final { scan-tree-dump-times "vect_recog_widen_mult_pattern: detected" 2 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { scan-tree-dump-times "pattern recognized" 2 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
++
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-widen-mult-const-u16.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-widen-mult-const-u16.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-widen-mult-const-u16.c	2011-06-19 10:59:13 +0000
+@@ -0,0 +1,77 @@
++/* { dg-require-effective-target vect_int } */
++
++#include "tree-vect.h"
++#include <stdlib.h>
++
++#define N 32
++
++__attribute__ ((noinline)) void 
++foo (unsigned int *__restrict a,
++     unsigned short *__restrict b,
++     int n)
++{
++  int i;
++
++  for (i = 0; i < n; i++)
++    a[i] = b[i] * 2333;
++
++  for (i = 0; i < n; i++)
++    if (a[i] != b[i] * 2333)
++      abort ();
++}
++
++__attribute__ ((noinline)) void
++bar (unsigned int *__restrict a,
++     unsigned short *__restrict b,
++     int n)
++{
++  int i;
++
++  for (i = 0; i < n; i++)
++    a[i] = (unsigned short) 2333 * b[i];
++
++  for (i = 0; i < n; i++)
++    if (a[i] != b[i] * (unsigned short) 2333)
++      abort ();
++}
++
++__attribute__ ((noinline)) void
++baz (unsigned int *__restrict a,
++     unsigned short *__restrict b,
++     int n)
++{
++  int i;
++
++  for (i = 0; i < n; i++)
++    a[i] = b[i] * 233333333;
++
++  for (i = 0; i < n; i++)
++    if (a[i] != b[i] * 233333333)
++      abort ();
++}
++
++
++int main (void)
++{
++  int i;
++  unsigned int a[N];
++  unsigned short b[N];
++
++  for (i = 0; i < N; i++)
++    {
++      a[i] = 0;
++      b[i] = i;
++      __asm__ volatile ("");
++    }
++
++  foo (a, b, N);
++  bar (a, b, N);
++  baz (a, b, N);
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 3 "vect" { target vect_widen_mult_hi_to_si } } } */
++/* { dg-final { scan-tree-dump-times "vect_recog_widen_mult_pattern: detected" 2 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { scan-tree-dump-times "pattern recognized" 2 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
++
+
+=== modified file 'gcc/testsuite/gcc.dg/vect/vect-widen-mult-u16.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-widen-mult-u16.c	2010-05-27 12:23:45 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-widen-mult-u16.c	2011-06-19 10:59:13 +0000
+@@ -9,13 +9,11 @@
+ unsigned short Y[N] __attribute__ ((__aligned__(__BIGGEST_ALIGNMENT__)));
+ unsigned int result[N];
+ 
+-/* short->int widening-mult */
++/* unsigned short->unsigned int widening-mult.  */
+ __attribute__ ((noinline)) int
+ foo1(int len) {
+   int i;
+ 
+-  /* Not vectorized because X[i] and Y[i] are casted to 'int'
+-     so the widening multiplication pattern is not recognized.  */
+   for (i=0; i<len; i++) {
+     result[i] = (unsigned int)(X[i] * Y[i]);
+   }
+@@ -43,8 +41,8 @@
+   return 0;
+ }
+ 
+-/*The induction loop is vectorized  */
+-/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 2 "vect" { xfail *-*-* } } } */
+-/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" { target vect_pack_trunc } } } */
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" { target { vect_widen_mult_hi_to_si || vect_unpack } } } } */
++/* { dg-final { scan-tree-dump-times "vect_recog_widen_mult_pattern: detected" 1 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { scan-tree-dump-times "pattern recognized" 1 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
+ /* { dg-final { cleanup-tree-dump "vect" } } */
+ 
+
+=== modified file 'gcc/testsuite/gcc.dg/vect/vect-widen-mult-u8.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-widen-mult-u8.c	2009-05-08 12:39:01 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-widen-mult-u8.c	2011-06-19 10:59:13 +0000
+@@ -9,7 +9,7 @@
+ unsigned char Y[N] __attribute__ ((__aligned__(__BIGGEST_ALIGNMENT__)));
+ unsigned short result[N];
+ 
+-/* char->short widening-mult */
++/* unsigned char-> unsigned short widening-mult.  */
+ __attribute__ ((noinline)) int
+ foo1(int len) {
+   int i;
+@@ -28,8 +28,7 @@
+   for (i=0; i<N; i++) {
+     X[i] = i;
+     Y[i] = 64-i;
+-    if (i%4 == 0)
+-      X[i] = 5;
++    __asm__ volatile ("");
+   }
+ 
+   foo1 (N);
+@@ -43,5 +42,7 @@
+ }
+ 
+ /* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" { target { vect_widen_mult_qi_to_hi || vect_unpack } } } } */
++/* { dg-final { scan-tree-dump-times "vect_recog_widen_mult_pattern: detected" 1 "vect" { target vect_widen_mult_qi_to_hi_pattern } } } */
++/* { dg-final { scan-tree-dump-times "pattern recognized" 1 "vect" { target vect_widen_mult_qi_to_hi_pattern } } } */
+ /* { dg-final { cleanup-tree-dump "vect" } } */
+ 
+
+=== modified file 'gcc/testsuite/lib/target-supports.exp'
+--- old/gcc/testsuite/lib/target-supports.exp	2011-06-02 12:12:00 +0000
++++ new/gcc/testsuite/lib/target-supports.exp	2011-06-19 10:59:13 +0000
+@@ -2663,7 +2663,8 @@
+ 	} else {
+ 	    set et_vect_widen_mult_qi_to_hi_saved 0
+ 	}
+-        if { [istarget powerpc*-*-*] } {
++        if { [istarget powerpc*-*-*]
++              || ([istarget arm*-*-*] && [check_effective_target_arm_neon]) } {
+             set et_vect_widen_mult_qi_to_hi_saved 1
+         }
+     }
+@@ -2696,7 +2697,8 @@
+ 	      || [istarget spu-*-*]
+ 	      || [istarget ia64-*-*]
+ 	      || [istarget i?86-*-*]
+-	      || [istarget x86_64-*-*] } {
++	      || [istarget x86_64-*-*]
++              || ([istarget arm*-*-*] && [check_effective_target_arm_neon]) } {
+             set et_vect_widen_mult_hi_to_si_saved 1
+         }
+     }
+@@ -2705,6 +2707,52 @@
+ }
+ 
+ # Return 1 if the target plus current options supports a vector
++# widening multiplication of *char* args into *short* result, 0 otherwise.
++#
++# This won't change for different subtargets so cache the result.
++
++proc check_effective_target_vect_widen_mult_qi_to_hi_pattern { } {
++    global et_vect_widen_mult_qi_to_hi_pattern
++
++    if [info exists et_vect_widen_mult_qi_to_hi_pattern_saved] {
++        verbose "check_effective_target_vect_widen_mult_qi_to_hi_pattern: using cached result" 2
++    } else {
++        set et_vect_widen_mult_qi_to_hi_pattern_saved 0
++        if { [istarget powerpc*-*-*]
++              || ([istarget arm*-*-*] && [check_effective_target_arm_neon]) } {
++            set et_vect_widen_mult_qi_to_hi_pattern_saved 1
++        }
++    }
++    verbose "check_effective_target_vect_widen_mult_qi_to_hi_pattern: returning $et_vect_widen_mult_qi_to_hi_pattern_saved" 2
++    return $et_vect_widen_mult_qi_to_hi_pattern_saved
++}
++
++# Return 1 if the target plus current options supports a vector
++# widening multiplication of *short* args into *int* result, 0 otherwise.
++#
++# This won't change for different subtargets so cache the result.
++
++proc check_effective_target_vect_widen_mult_hi_to_si_pattern { } {
++    global et_vect_widen_mult_hi_to_si_pattern
++
++    if [info exists et_vect_widen_mult_hi_to_si_pattern_saved] {
++        verbose "check_effective_target_vect_widen_mult_hi_to_si_pattern: using cached result" 2
++    } else {
++        set et_vect_widen_mult_hi_to_si_pattern_saved 0
++        if { [istarget powerpc*-*-*]
++              || [istarget spu-*-*]
++              || [istarget ia64-*-*]
++              || [istarget i?86-*-*]
++              || [istarget x86_64-*-*]
++              || ([istarget arm*-*-*] && [check_effective_target_arm_neon]) } {
++            set et_vect_widen_mult_hi_to_si_pattern_saved 1
++        }
++    }
++    verbose "check_effective_target_vect_widen_mult_hi_to_si_pattern: returning $et_vect_widen_mult_hi_to_si_pattern_saved" 2
++    return $et_vect_widen_mult_hi_to_si_pattern_saved
++}
++
++# Return 1 if the target plus current options supports a vector
+ # dot-product of signed chars, 0 otherwise.
+ #
+ # This won't change for different subtargets so cache the result.
+
+=== modified file 'gcc/tree-vect-loop-manip.c'
+--- old/gcc/tree-vect-loop-manip.c	2011-05-18 13:24:05 +0000
++++ new/gcc/tree-vect-loop-manip.c	2011-06-19 10:59:13 +0000
+@@ -1105,35 +1105,6 @@
+   first_niters = PHI_RESULT (newphi);
+ }
+ 
+-
+-/* Remove dead assignments from loop NEW_LOOP.  */
+-
+-static void
+-remove_dead_stmts_from_loop (struct loop *new_loop)
+-{
+-  basic_block *bbs = get_loop_body (new_loop);
+-  unsigned i;
+-  for (i = 0; i < new_loop->num_nodes; ++i)
+-    {
+-      gimple_stmt_iterator gsi;
+-      for (gsi = gsi_start_bb (bbs[i]); !gsi_end_p (gsi);)
+-	{
+-	  gimple stmt = gsi_stmt (gsi);
+-	  if (is_gimple_assign (stmt)
+-	      && TREE_CODE (gimple_assign_lhs (stmt)) == SSA_NAME
+-	      && has_zero_uses (gimple_assign_lhs (stmt)))
+-	    {
+-	      gsi_remove (&gsi, true);
+-	      release_defs (stmt);
+-	    }
+-	  else
+-	    gsi_next (&gsi);
+-	}
+-    }
+-  free (bbs);
+-}
+-
+-
+ /* Function slpeel_tree_peel_loop_to_edge.
+ 
+    Peel the first (last) iterations of LOOP into a new prolog (epilog) loop
+@@ -1445,13 +1416,6 @@
+   BITMAP_FREE (definitions);
+   delete_update_ssa ();
+ 
+-  /* Remove all pattern statements from the loop copy.  They will confuse
+-     the expander if DCE is disabled.
+-     ???  The pattern recognizer should be split into an analysis and
+-     a transformation phase that is then run only on the loop that is
+-     going to be transformed.  */
+-  remove_dead_stmts_from_loop (new_loop);
+-
+   adjust_vec_debug_stmts ();
+ 
+   return new_loop;
+
+=== modified file 'gcc/tree-vect-loop.c'
+--- old/gcc/tree-vect-loop.c	2011-03-01 13:18:25 +0000
++++ new/gcc/tree-vect-loop.c	2011-06-22 06:21:13 +0000
+@@ -244,7 +244,7 @@
+       for (si = gsi_start_bb (bb); !gsi_end_p (si); gsi_next (&si))
+         {
+ 	  tree vf_vectype;
+-	  gimple stmt = gsi_stmt (si);
++	  gimple stmt = gsi_stmt (si), pattern_stmt;
+ 	  stmt_info = vinfo_for_stmt (stmt);
+ 
+ 	  if (vect_print_dump_info (REPORT_DETAILS))
+@@ -259,9 +259,25 @@
+ 	  if (!STMT_VINFO_RELEVANT_P (stmt_info)
+ 	      && !STMT_VINFO_LIVE_P (stmt_info))
+ 	    {
+-	      if (vect_print_dump_info (REPORT_DETAILS))
+-	        fprintf (vect_dump, "skip.");
+-	      continue;
++              if (STMT_VINFO_IN_PATTERN_P (stmt_info)
++                  && (pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info))
++                  && (STMT_VINFO_RELEVANT_P (vinfo_for_stmt (pattern_stmt))
++                      || STMT_VINFO_LIVE_P (vinfo_for_stmt (pattern_stmt))))
++                {
++                  stmt = pattern_stmt;
++                  stmt_info = vinfo_for_stmt (pattern_stmt);
++                  if (vect_print_dump_info (REPORT_DETAILS))
++                    {
++                      fprintf (vect_dump, "==> examining pattern statement: ");
++                      print_gimple_stmt (vect_dump, stmt, 0, TDF_SLIM);
++                    }
++                }
++             else
++               {
++                 if (vect_print_dump_info (REPORT_DETAILS))
++                   fprintf (vect_dump, "skip.");
++                 continue;
++               }
+ 	    }
+ 
+ 	  if (gimple_get_lhs (stmt) == NULL_TREE)
+@@ -816,25 +832,17 @@
+ 
+           if (stmt_info)
+             {
+-              /* Check if this is a "pattern stmt" (introduced by the
+-                 vectorizer during the pattern recognition pass).  */
+-              bool remove_stmt_p = false;
+-              gimple orig_stmt = STMT_VINFO_RELATED_STMT (stmt_info);
+-              if (orig_stmt)
+-                {
+-                  stmt_vec_info orig_stmt_info = vinfo_for_stmt (orig_stmt);
+-                  if (orig_stmt_info
+-                      && STMT_VINFO_IN_PATTERN_P (orig_stmt_info))
+-                    remove_stmt_p = true;
+-                }
++              /* Check if this statement has a related "pattern stmt"
++                 (introduced by the vectorizer during the pattern recognition
++                 pass).  Free pattern's stmt_vec_info.  */
++              if (STMT_VINFO_IN_PATTERN_P (stmt_info)
++                  && vinfo_for_stmt (STMT_VINFO_RELATED_STMT (stmt_info)))
++                free_stmt_vec_info (STMT_VINFO_RELATED_STMT (stmt_info));
+ 
+               /* Free stmt_vec_info.  */
+               free_stmt_vec_info (stmt);
++            }
+ 
+-              /* Remove dead "pattern stmts".  */
+-              if (remove_stmt_p)
+-                gsi_remove (&si, true);
+-            }
+           gsi_next (&si);
+         }
+     }
+@@ -4262,6 +4270,25 @@
+       return false;
+     }
+ 
++  /* In case of widenning multiplication by a constant, we update the type
++     of the constant to be the type of the other operand.  We check that the
++     constant fits the type in the pattern recognition pass.  */
++  if (code == DOT_PROD_EXPR
++      && !types_compatible_p (TREE_TYPE (ops[0]), TREE_TYPE (ops[1])))
++    {
++      if (TREE_CODE (ops[0]) == INTEGER_CST)
++        ops[0] = fold_convert (TREE_TYPE (ops[1]), ops[0]);
++      else if (TREE_CODE (ops[1]) == INTEGER_CST)
++        ops[1] = fold_convert (TREE_TYPE (ops[0]), ops[1]);
++      else
++        {
++          if (vect_print_dump_info (REPORT_DETAILS))
++            fprintf (vect_dump, "invalid types in dot-prod");
++
++          return false;
++        }
++    }
++
+   if (!vec_stmt) /* transformation not required.  */
+     {
+       STMT_VINFO_TYPE (stmt_info) = reduc_vec_info_type;
+@@ -4796,7 +4823,7 @@
+ 
+       for (si = gsi_start_bb (bb); !gsi_end_p (si);)
+ 	{
+-	  gimple stmt = gsi_stmt (si);
++	  gimple stmt = gsi_stmt (si), pattern_stmt;
+ 	  bool is_store;
+ 
+ 	  if (vect_print_dump_info (REPORT_DETAILS))
+@@ -4821,14 +4848,25 @@
+ 
+ 	  if (!STMT_VINFO_RELEVANT_P (stmt_info)
+ 	      && !STMT_VINFO_LIVE_P (stmt_info))
+-	    {
+-	      gsi_next (&si);
+-	      continue;
++            {
++              if (STMT_VINFO_IN_PATTERN_P (stmt_info)
++                  && (pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info))
++                  && (STMT_VINFO_RELEVANT_P (vinfo_for_stmt (pattern_stmt))
++                      || STMT_VINFO_LIVE_P (vinfo_for_stmt (pattern_stmt))))
++                {
++                  stmt = pattern_stmt;
++                  stmt_info = vinfo_for_stmt (stmt);
++                }
++              else
++	        {
++   	          gsi_next (&si);
++	          continue;
++                }
+ 	    }
+ 
+ 	  gcc_assert (STMT_VINFO_VECTYPE (stmt_info));
+-	  nunits =
+-	    (unsigned int) TYPE_VECTOR_SUBPARTS (STMT_VINFO_VECTYPE (stmt_info));
++	  nunits = (unsigned int) TYPE_VECTOR_SUBPARTS (
++                                               STMT_VINFO_VECTYPE (stmt_info));
+ 	  if (!STMT_SLP_TYPE (stmt_info)
+ 	      && nunits != (unsigned int) vectorization_factor
+               && vect_print_dump_info (REPORT_DETAILS))
+
+=== modified file 'gcc/tree-vect-patterns.c'
+--- old/gcc/tree-vect-patterns.c	2010-12-02 11:47:12 +0000
++++ new/gcc/tree-vect-patterns.c	2011-06-22 12:10:44 +0000
+@@ -38,16 +38,11 @@
+ #include "recog.h"
+ #include "diagnostic-core.h"
+ 
+-/* Function prototypes */
+-static void vect_pattern_recog_1
+-  (gimple (* ) (gimple, tree *, tree *), gimple_stmt_iterator);
+-static bool widened_name_p (tree, gimple, tree *, gimple *);
+-
+ /* Pattern recognition functions  */
+-static gimple vect_recog_widen_sum_pattern (gimple, tree *, tree *);
+-static gimple vect_recog_widen_mult_pattern (gimple, tree *, tree *);
+-static gimple vect_recog_dot_prod_pattern (gimple, tree *, tree *);
+-static gimple vect_recog_pow_pattern (gimple, tree *, tree *);
++static gimple vect_recog_widen_sum_pattern (gimple *, tree *, tree *);
++static gimple vect_recog_widen_mult_pattern (gimple *, tree *, tree *);
++static gimple vect_recog_dot_prod_pattern (gimple *, tree *, tree *);
++static gimple vect_recog_pow_pattern (gimple *, tree *, tree *);
+ static vect_recog_func_ptr vect_vect_recog_func_ptrs[NUM_PATTERNS] = {
+ 	vect_recog_widen_mult_pattern,
+ 	vect_recog_widen_sum_pattern,
+@@ -61,10 +56,12 @@
+    is a result of a type-promotion, such that:
+      DEF_STMT: NAME = NOP (name0)
+    where the type of name0 (HALF_TYPE) is smaller than the type of NAME.
+-*/
++   If CHECK_SIGN is TRUE, check that either both types are signed or both are
++   unsigned.  */
+ 
+ static bool
+-widened_name_p (tree name, gimple use_stmt, tree *half_type, gimple *def_stmt)
++widened_name_p (tree name, gimple use_stmt, tree *half_type, gimple *def_stmt,
++		bool check_sign)
+ {
+   tree dummy;
+   gimple dummy_gimple;
+@@ -98,7 +95,7 @@
+ 
+   *half_type = TREE_TYPE (oprnd0);
+   if (!INTEGRAL_TYPE_P (type) || !INTEGRAL_TYPE_P (*half_type)
+-      || (TYPE_UNSIGNED (type) != TYPE_UNSIGNED (*half_type))
++      || ((TYPE_UNSIGNED (type) != TYPE_UNSIGNED (*half_type)) && check_sign)
+       || (TYPE_PRECISION (type) < (TYPE_PRECISION (*half_type) * 2)))
+     return false;
+ 
+@@ -168,12 +165,12 @@
+          inner-loop nested in an outer-loop that us being vectorized).  */
+ 
+ static gimple
+-vect_recog_dot_prod_pattern (gimple last_stmt, tree *type_in, tree *type_out)
++vect_recog_dot_prod_pattern (gimple *last_stmt, tree *type_in, tree *type_out)
+ {
+   gimple stmt;
+   tree oprnd0, oprnd1;
+   tree oprnd00, oprnd01;
+-  stmt_vec_info stmt_vinfo = vinfo_for_stmt (last_stmt);
++  stmt_vec_info stmt_vinfo = vinfo_for_stmt (*last_stmt);
+   tree type, half_type;
+   gimple pattern_stmt;
+   tree prod_type;
+@@ -181,10 +178,10 @@
+   struct loop *loop = LOOP_VINFO_LOOP (loop_info);
+   tree var, rhs;
+ 
+-  if (!is_gimple_assign (last_stmt))
++  if (!is_gimple_assign (*last_stmt))
+     return NULL;
+ 
+-  type = gimple_expr_type (last_stmt);
++  type = gimple_expr_type (*last_stmt);
+ 
+   /* Look for the following pattern
+           DX = (TYPE1) X;
+@@ -210,7 +207,7 @@
+   /* Starting from LAST_STMT, follow the defs of its uses in search
+      of the above pattern.  */
+ 
+-  if (gimple_assign_rhs_code (last_stmt) != PLUS_EXPR)
++  if (gimple_assign_rhs_code (*last_stmt) != PLUS_EXPR)
+     return NULL;
+ 
+   if (STMT_VINFO_IN_PATTERN_P (stmt_vinfo))
+@@ -231,14 +228,14 @@
+ 
+       if (STMT_VINFO_DEF_TYPE (stmt_vinfo) != vect_reduction_def)
+         return NULL;
+-      oprnd0 = gimple_assign_rhs1 (last_stmt);
+-      oprnd1 = gimple_assign_rhs2 (last_stmt);
++      oprnd0 = gimple_assign_rhs1 (*last_stmt);
++      oprnd1 = gimple_assign_rhs2 (*last_stmt);
+       if (!types_compatible_p (TREE_TYPE (oprnd0), type)
+ 	  || !types_compatible_p (TREE_TYPE (oprnd1), type))
+         return NULL;
+-      stmt = last_stmt;
++      stmt = *last_stmt;
+ 
+-      if (widened_name_p (oprnd0, stmt, &half_type, &def_stmt))
++      if (widened_name_p (oprnd0, stmt, &half_type, &def_stmt, true))
+         {
+           stmt = def_stmt;
+           oprnd0 = gimple_assign_rhs1 (stmt);
+@@ -293,10 +290,10 @@
+       if (!types_compatible_p (TREE_TYPE (oprnd0), prod_type)
+           || !types_compatible_p (TREE_TYPE (oprnd1), prod_type))
+         return NULL;
+-      if (!widened_name_p (oprnd0, stmt, &half_type0, &def_stmt))
++      if (!widened_name_p (oprnd0, stmt, &half_type0, &def_stmt, true))
+         return NULL;
+       oprnd00 = gimple_assign_rhs1 (def_stmt);
+-      if (!widened_name_p (oprnd1, stmt, &half_type1, &def_stmt))
++      if (!widened_name_p (oprnd1, stmt, &half_type1, &def_stmt, true))
+         return NULL;
+       oprnd01 = gimple_assign_rhs1 (def_stmt);
+       if (!types_compatible_p (half_type0, half_type1))
+@@ -322,7 +319,7 @@
+ 
+   /* We don't allow changing the order of the computation in the inner-loop
+      when doing outer-loop vectorization.  */
+-  gcc_assert (!nested_in_vect_loop_p (loop, last_stmt));
++  gcc_assert (!nested_in_vect_loop_p (loop, *last_stmt));
+ 
+   return pattern_stmt;
+ }
+@@ -342,24 +339,47 @@
+ 
+    where type 'TYPE' is at least double the size of type 'type'.
+ 
+-   Input:
+-
+-   * LAST_STMT: A stmt from which the pattern search begins. In the example,
+-   when this function is called with S5, the pattern {S3,S4,S5} is be detected.
+-
+-   Output:
+-
+-   * TYPE_IN: The type of the input arguments to the pattern.
+-
+-   * TYPE_OUT: The type of the output  of this pattern.
+-
+-   * Return value: A new stmt that will be used to replace the sequence of
+-   stmts that constitute the pattern. In this case it will be:
+-        WIDEN_MULT <a_t, b_t>
+-*/
++   Also detect unsgigned cases:
++
++     unsigned type a_t, b_t;
++     unsigned TYPE u_prod_T;
++     TYPE a_T, b_T, prod_T;
++
++     S1  a_t = ;
++     S2  b_t = ;
++     S3  a_T = (TYPE) a_t;
++     S4  b_T = (TYPE) b_t;
++     S5  prod_T = a_T * b_T;
++     S6  u_prod_T = (unsigned TYPE) prod_T;
++
++   and multiplication by constants:
++
++     type a_t;
++     TYPE a_T, prod_T;
++
++     S1  a_t = ;
++     S3  a_T = (TYPE) a_t;
++     S5  prod_T = a_T * CONST;
++
++    Input:
++
++    * LAST_STMT: A stmt from which the pattern search begins.  In the example,
++    when this function is called with S5, the pattern {S3,S4,S5,(S6)} is
++    detected.
++
++    Output:
++
++    * TYPE_IN: The type of the input arguments to the pattern.
++
++    * TYPE_OUT: The type of the output of this pattern.
++
++    * Return value: A new stmt that will be used to replace the sequence of
++    stmts that constitute the pattern.  In this case it will be:
++         WIDEN_MULT <a_t, b_t>
++ */
+ 
+ static gimple
+-vect_recog_widen_mult_pattern (gimple last_stmt,
++vect_recog_widen_mult_pattern (gimple *last_stmt,
+ 			       tree *type_in,
+ 			       tree *type_out)
+ {
+@@ -367,39 +387,112 @@
+   tree oprnd0, oprnd1;
+   tree type, half_type0, half_type1;
+   gimple pattern_stmt;
+-  tree vectype, vectype_out;
++  tree vectype, vectype_out = NULL_TREE;
+   tree dummy;
+   tree var;
+   enum tree_code dummy_code;
+   int dummy_int;
+   VEC (tree, heap) *dummy_vec;
++  bool op0_ok, op1_ok;
+ 
+-  if (!is_gimple_assign (last_stmt))
++  if (!is_gimple_assign (*last_stmt))
+     return NULL;
+ 
+-  type = gimple_expr_type (last_stmt);
++  type = gimple_expr_type (*last_stmt);
+ 
+   /* Starting from LAST_STMT, follow the defs of its uses in search
+      of the above pattern.  */
+ 
+-  if (gimple_assign_rhs_code (last_stmt) != MULT_EXPR)
++  if (gimple_assign_rhs_code (*last_stmt) != MULT_EXPR)
+     return NULL;
+ 
+-  oprnd0 = gimple_assign_rhs1 (last_stmt);
+-  oprnd1 = gimple_assign_rhs2 (last_stmt);
++  oprnd0 = gimple_assign_rhs1 (*last_stmt);
++  oprnd1 = gimple_assign_rhs2 (*last_stmt);
+   if (!types_compatible_p (TREE_TYPE (oprnd0), type)
+       || !types_compatible_p (TREE_TYPE (oprnd1), type))
+     return NULL;
+ 
+-  /* Check argument 0 */
+-  if (!widened_name_p (oprnd0, last_stmt, &half_type0, &def_stmt0))
+-    return NULL;
+-  oprnd0 = gimple_assign_rhs1 (def_stmt0);
+-
+-  /* Check argument 1 */
+-  if (!widened_name_p (oprnd1, last_stmt, &half_type1, &def_stmt1))
+-    return NULL;
+-  oprnd1 = gimple_assign_rhs1 (def_stmt1);
++  /* Check argument 0.  */
++  op0_ok = widened_name_p (oprnd0, *last_stmt, &half_type0, &def_stmt0, false);
++  /* Check argument 1.  */
++  op1_ok = widened_name_p (oprnd1, *last_stmt, &half_type1, &def_stmt1, false);
++
++  /* In case of multiplication by a constant one of the operands may not match
++     the pattern, but not both.  */
++  if (!op0_ok && !op1_ok)
++     return NULL;
++
++  if (op0_ok && op1_ok)
++    {
++      oprnd0 = gimple_assign_rhs1 (def_stmt0);
++      oprnd1 = gimple_assign_rhs1 (def_stmt1);
++    }
++  else if (!op0_ok)
++    {
++      if (CONSTANT_CLASS_P (oprnd0)
++         && TREE_CODE (half_type1) == INTEGER_TYPE
++         && tree_int_cst_lt (oprnd0, TYPE_MAXVAL (half_type1))
++         && tree_int_cst_lt (TYPE_MINVAL (half_type1), oprnd0))
++        {
++          /* OPRND0 is a constant of HALF_TYPE1.  */
++          half_type0 = half_type1;
++          oprnd1 = gimple_assign_rhs1 (def_stmt1);
++        }
++      else
++        return NULL;
++    }
++  else if (!op1_ok)
++    {
++      if (CONSTANT_CLASS_P (oprnd1)
++          && TREE_CODE (half_type0) == INTEGER_TYPE
++          && tree_int_cst_lt (oprnd1, TYPE_MAXVAL (half_type0))
++          && tree_int_cst_lt (TYPE_MINVAL (half_type0), oprnd1))
++        {
++          /* OPRND1 is a constant of HALF_TYPE0.  */
++          half_type1 = half_type0;
++          oprnd0 = gimple_assign_rhs1 (def_stmt0);
++        }
++      else
++        return NULL;
++    }
++
++  /* Handle unsigned case.  Look for
++     S6  u_prod_T = (unsigned TYPE) prod_T;
++     Use unsigned TYPE as the type for WIDEN_MULT_EXPR.  */
++  if (TYPE_UNSIGNED (type) != TYPE_UNSIGNED (half_type0))
++    {
++      tree lhs = gimple_assign_lhs (*last_stmt), use_lhs;
++      imm_use_iterator imm_iter;
++      use_operand_p use_p;
++      int nuses = 0;
++      gimple use_stmt = NULL;
++      tree use_type;
++
++      if (TYPE_UNSIGNED (type) == TYPE_UNSIGNED (half_type1))
++        return NULL;
++
++      FOR_EACH_IMM_USE_FAST (use_p, imm_iter, lhs)
++        {
++	  if (is_gimple_debug (USE_STMT (use_p)))
++	    continue;
++          use_stmt = USE_STMT (use_p);
++          nuses++;
++        }
++
++      if (nuses != 1 || !is_gimple_assign (use_stmt)
++          || gimple_assign_rhs_code (use_stmt) != NOP_EXPR)
++        return NULL;
++
++      use_lhs = gimple_assign_lhs (use_stmt);
++      use_type = TREE_TYPE (use_lhs);
++      if (!INTEGRAL_TYPE_P (use_type)
++          || (TYPE_UNSIGNED (type) == TYPE_UNSIGNED (use_type))
++          || (TYPE_PRECISION (type) != TYPE_PRECISION (use_type)))
++        return NULL;
++
++      type = use_type;
++      *last_stmt = use_stmt;
++    }
+ 
+   if (!types_compatible_p (half_type0, half_type1))
+     return NULL;
+@@ -413,7 +506,7 @@
+   vectype_out = get_vectype_for_scalar_type (type);
+   if (!vectype
+       || !vectype_out
+-      || !supportable_widening_operation (WIDEN_MULT_EXPR, last_stmt,
++      || !supportable_widening_operation (WIDEN_MULT_EXPR, *last_stmt,
+ 					  vectype_out, vectype,
+ 					  &dummy, &dummy, &dummy_code,
+ 					  &dummy_code, &dummy_int, &dummy_vec))
+@@ -462,16 +555,16 @@
+ */
+ 
+ static gimple
+-vect_recog_pow_pattern (gimple last_stmt, tree *type_in, tree *type_out)
++vect_recog_pow_pattern (gimple *last_stmt, tree *type_in, tree *type_out)
+ {
+   tree fn, base, exp = NULL;
+   gimple stmt;
+   tree var;
+ 
+-  if (!is_gimple_call (last_stmt) || gimple_call_lhs (last_stmt) == NULL)
++  if (!is_gimple_call (*last_stmt) || gimple_call_lhs (*last_stmt) == NULL)
+     return NULL;
+ 
+-  fn = gimple_call_fndecl (last_stmt);
++  fn = gimple_call_fndecl (*last_stmt);
+   if (fn == NULL_TREE || DECL_BUILT_IN_CLASS (fn) != BUILT_IN_NORMAL)
+    return NULL;
+ 
+@@ -481,8 +574,8 @@
+     case BUILT_IN_POWI:
+     case BUILT_IN_POWF:
+     case BUILT_IN_POW:
+-      base = gimple_call_arg (last_stmt, 0);
+-      exp = gimple_call_arg (last_stmt, 1);
++      base = gimple_call_arg (*last_stmt, 0);
++      exp = gimple_call_arg (*last_stmt, 1);
+       if (TREE_CODE (exp) != REAL_CST
+ 	  && TREE_CODE (exp) != INTEGER_CST)
+         return NULL;
+@@ -574,21 +667,21 @@
+ 	 inner-loop nested in an outer-loop that us being vectorized).  */
+ 
+ static gimple
+-vect_recog_widen_sum_pattern (gimple last_stmt, tree *type_in, tree *type_out)
++vect_recog_widen_sum_pattern (gimple *last_stmt, tree *type_in, tree *type_out)
+ {
+   gimple stmt;
+   tree oprnd0, oprnd1;
+-  stmt_vec_info stmt_vinfo = vinfo_for_stmt (last_stmt);
++  stmt_vec_info stmt_vinfo = vinfo_for_stmt (*last_stmt);
+   tree type, half_type;
+   gimple pattern_stmt;
+   loop_vec_info loop_info = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
+   struct loop *loop = LOOP_VINFO_LOOP (loop_info);
+   tree var;
+ 
+-  if (!is_gimple_assign (last_stmt))
++  if (!is_gimple_assign (*last_stmt))
+     return NULL;
+ 
+-  type = gimple_expr_type (last_stmt);
++  type = gimple_expr_type (*last_stmt);
+ 
+   /* Look for the following pattern
+           DX = (TYPE) X;
+@@ -600,25 +693,25 @@
+   /* Starting from LAST_STMT, follow the defs of its uses in search
+      of the above pattern.  */
+ 
+-  if (gimple_assign_rhs_code (last_stmt) != PLUS_EXPR)
++  if (gimple_assign_rhs_code (*last_stmt) != PLUS_EXPR)
+     return NULL;
+ 
+   if (STMT_VINFO_DEF_TYPE (stmt_vinfo) != vect_reduction_def)
+     return NULL;
+ 
+-  oprnd0 = gimple_assign_rhs1 (last_stmt);
+-  oprnd1 = gimple_assign_rhs2 (last_stmt);
++  oprnd0 = gimple_assign_rhs1 (*last_stmt);
++  oprnd1 = gimple_assign_rhs2 (*last_stmt);
+   if (!types_compatible_p (TREE_TYPE (oprnd0), type)
+       || !types_compatible_p (TREE_TYPE (oprnd1), type))
+     return NULL;
+ 
+-  /* So far so good. Since last_stmt was detected as a (summation) reduction,
++  /* So far so good.  Since *last_stmt was detected as a (summation) reduction,
+      we know that oprnd1 is the reduction variable (defined by a loop-header
+      phi), and oprnd0 is an ssa-name defined by a stmt in the loop body.
+      Left to check that oprnd0 is defined by a cast from type 'type' to type
+      'TYPE'.  */
+ 
+-  if (!widened_name_p (oprnd0, last_stmt, &half_type, &stmt))
++  if (!widened_name_p (oprnd0, *last_stmt, &half_type, &stmt, true))
+     return NULL;
+ 
+   oprnd0 = gimple_assign_rhs1 (stmt);
+@@ -639,7 +732,7 @@
+ 
+   /* We don't allow changing the order of the computation in the inner-loop
+      when doing outer-loop vectorization.  */
+-  gcc_assert (!nested_in_vect_loop_p (loop, last_stmt));
++  gcc_assert (!nested_in_vect_loop_p (loop, *last_stmt));
+ 
+   return pattern_stmt;
+ }
+@@ -669,23 +762,27 @@
+ 
+ static void
+ vect_pattern_recog_1 (
+-	gimple (* vect_recog_func) (gimple, tree *, tree *),
++	gimple (* vect_recog_func) (gimple *, tree *, tree *),
+ 	gimple_stmt_iterator si)
+ {
+   gimple stmt = gsi_stmt (si), pattern_stmt;
+-  stmt_vec_info stmt_info = vinfo_for_stmt (stmt);
++  stmt_vec_info stmt_info;
+   stmt_vec_info pattern_stmt_info;
+-  loop_vec_info loop_vinfo = STMT_VINFO_LOOP_VINFO (stmt_info);
++  loop_vec_info loop_vinfo;
+   tree pattern_vectype;
+   tree type_in, type_out;
+   enum tree_code code;
+   int i;
+   gimple next;
+ 
+-  pattern_stmt = (* vect_recog_func) (stmt, &type_in, &type_out);
++  pattern_stmt = (* vect_recog_func) (&stmt, &type_in, &type_out);
+   if (!pattern_stmt)
+     return;
+ 
++  si = gsi_for_stmt (stmt);
++  stmt_info = vinfo_for_stmt (stmt);
++  loop_vinfo = STMT_VINFO_LOOP_VINFO (stmt_info);
++ 
+   if (VECTOR_MODE_P (TYPE_MODE (type_in)))
+     {
+       /* No need to check target support (already checked by the pattern
+@@ -736,9 +833,9 @@
+     }
+ 
+   /* Mark the stmts that are involved in the pattern. */
+-  gsi_insert_before (&si, pattern_stmt, GSI_SAME_STMT);
+   set_vinfo_for_stmt (pattern_stmt,
+ 		      new_stmt_vec_info (pattern_stmt, loop_vinfo, NULL));
++  gimple_set_bb (pattern_stmt, gimple_bb (stmt));
+   pattern_stmt_info = vinfo_for_stmt (pattern_stmt);
+ 
+   STMT_VINFO_RELATED_STMT (pattern_stmt_info) = stmt;
+@@ -761,8 +858,8 @@
+    LOOP_VINFO - a struct_loop_info of a loop in which we want to look for
+         computation idioms.
+ 
+-   Output - for each computation idiom that is detected we insert a new stmt
+-        that provides the same functionality and that can be vectorized. We
++   Output - for each computation idiom that is detected we create a new stmt
++        that provides the same functionality and that can be vectorized.  We
+         also record some information in the struct_stmt_info of the relevant
+         stmts, as explained below:
+ 
+@@ -777,52 +874,48 @@
+          S5: ... = ..use(a_0)..         -       -               -
+ 
+    Say the sequence {S1,S2,S3,S4} was detected as a pattern that can be
+-   represented by a single stmt. We then:
+-   - create a new stmt S6 that will replace the pattern.
+-   - insert the new stmt S6 before the last stmt in the pattern
++   represented by a single stmt.  We then:
++   - create a new stmt S6 equivalent to the pattern (the stmt is not
++     inserted into the code)
+    - fill in the STMT_VINFO fields as follows:
+ 
+                                   in_pattern_p  related_stmt    vec_stmt
+          S1: a_i = ....                 -       -               -
+          S2: a_2 = ..use(a_i)..         -       -               -
+          S3: a_1 = ..use(a_2)..         -       -               -
+-       > S6: a_new = ....               -       S4              -
+          S4: a_0 = ..use(a_1)..         true    S6              -
++          '---> S6: a_new = ....        -       S4              -
+          S5: ... = ..use(a_0)..         -       -               -
+ 
+    (the last stmt in the pattern (S4) and the new pattern stmt (S6) point
+-    to each other through the RELATED_STMT field).
++   to each other through the RELATED_STMT field).
+ 
+    S6 will be marked as relevant in vect_mark_stmts_to_be_vectorized instead
+    of S4 because it will replace all its uses.  Stmts {S1,S2,S3} will
+    remain irrelevant unless used by stmts other than S4.
+ 
+    If vectorization succeeds, vect_transform_stmt will skip over {S1,S2,S3}
+-   (because they are marked as irrelevant). It will vectorize S6, and record
++   (because they are marked as irrelevant).  It will vectorize S6, and record
+    a pointer to the new vector stmt VS6 both from S6 (as usual), and also
+-   from S4. We do that so that when we get to vectorizing stmts that use the
++   from S4.  We do that so that when we get to vectorizing stmts that use the
+    def of S4 (like S5 that uses a_0), we'll know where to take the relevant
+-   vector-def from. S4 will be skipped, and S5 will be vectorized as usual:
++   vector-def from.  S4 will be skipped, and S5 will be vectorized as usual:
+ 
+                                   in_pattern_p  related_stmt    vec_stmt
+          S1: a_i = ....                 -       -               -
+          S2: a_2 = ..use(a_i)..         -       -               -
+          S3: a_1 = ..use(a_2)..         -       -               -
+        > VS6: va_new = ....             -       -               -
+-         S6: a_new = ....               -       S4              VS6
+          S4: a_0 = ..use(a_1)..         true    S6              VS6
++          '---> S6: a_new = ....        -       S4              VS6
+        > VS5: ... = ..vuse(va_new)..    -       -               -
+          S5: ... = ..use(a_0)..         -       -               -
+ 
+-   DCE could then get rid of {S1,S2,S3,S4,S5,S6} (if their defs are not used
++   DCE could then get rid of {S1,S2,S3,S4,S5} (if their defs are not used
+    elsewhere), and we'll end up with:
+ 
+         VS6: va_new = ....
+-        VS5: ... = ..vuse(va_new)..
+-
+-   If vectorization does not succeed, DCE will clean S6 away (its def is
+-   not used), and we'll end up with the original sequence.
+-*/
++        VS5: ... = ..vuse(va_new)..  */
+ 
+ void
+ vect_pattern_recog (loop_vec_info loop_vinfo)
+@@ -832,7 +925,7 @@
+   unsigned int nbbs = loop->num_nodes;
+   gimple_stmt_iterator si;
+   unsigned int i, j;
+-  gimple (* vect_recog_func_ptr) (gimple, tree *, tree *);
++  gimple (* vect_recog_func_ptr) (gimple *, tree *, tree *);
+ 
+   if (vect_print_dump_info (REPORT_DETAILS))
+     fprintf (vect_dump, "=== vect_pattern_recog ===");
+
+=== modified file 'gcc/tree-vect-slp.c'
+--- old/gcc/tree-vect-slp.c	2011-05-05 15:43:06 +0000
++++ new/gcc/tree-vect-slp.c	2011-06-19 10:59:13 +0000
+@@ -2510,6 +2510,8 @@
+       && STMT_VINFO_STRIDED_ACCESS (stmt_info)
+       && !REFERENCE_CLASS_P (gimple_get_lhs (stmt)))
+     si = gsi_for_stmt (SLP_INSTANCE_FIRST_LOAD_STMT (instance));
++  else if (is_pattern_stmt_p (stmt_info))
++     si = gsi_for_stmt (STMT_VINFO_RELATED_STMT (stmt_info));
+   else
+     si = gsi_for_stmt (stmt);
+ 
+
+=== modified file 'gcc/tree-vect-stmts.c'
+--- old/gcc/tree-vect-stmts.c	2011-06-02 12:12:00 +0000
++++ new/gcc/tree-vect-stmts.c	2011-06-22 06:21:13 +0000
+@@ -605,15 +605,76 @@
+             break;
+         }
+ 
+-      FOR_EACH_PHI_OR_STMT_USE (use_p, stmt, iter, SSA_OP_USE)
+-	{
+-	  tree op = USE_FROM_PTR (use_p);
+-	  if (!process_use (stmt, op, loop_vinfo, live_p, relevant, &worklist))
+-	    {
+-	      VEC_free (gimple, heap, worklist);
+-	      return false;
+-	    }
+-	}
++      if (is_pattern_stmt_p (vinfo_for_stmt (stmt)))
++        {
++          /* Pattern statements are not inserted into the code, so
++             FOR_EACH_PHI_OR_STMT_USE optimizes their operands out, and we
++             have to scan the RHS or function arguments instead.  */
++          if (is_gimple_assign (stmt))
++            {
++              tree rhs = gimple_assign_rhs1 (stmt);
++              if (get_gimple_rhs_class (gimple_assign_rhs_code (stmt))
++                  == GIMPLE_SINGLE_RHS)
++                {
++                  unsigned int op_num = TREE_OPERAND_LENGTH (gimple_assign_rhs1
++                                                              (stmt));
++                  for (i = 0; i < op_num; i++)
++                    {
++                      tree op = TREE_OPERAND (rhs, i);
++                      if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
++                                    &worklist))
++                       {
++                         VEC_free (gimple, heap, worklist);
++                         return false;
++                       }
++                    }
++                }
++              else if (get_gimple_rhs_class (gimple_assign_rhs_code (stmt))
++                       == GIMPLE_BINARY_RHS)
++                {
++                  tree op = gimple_assign_rhs1 (stmt);
++                  if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
++                                    &worklist))
++                    {
++                      VEC_free (gimple, heap, worklist);
++                      return false;
++                    }
++                  op = gimple_assign_rhs2 (stmt);
++                  if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
++                                    &worklist))
++                    {
++                      VEC_free (gimple, heap, worklist);
++                      return false;
++                    }
++                }
++              else
++                return false;
++            }
++          else if (is_gimple_call (stmt))
++            {
++              for (i = 0; i < gimple_call_num_args (stmt); i++)
++                {
++                  tree arg = gimple_call_arg (stmt, i);
++                  if (!process_use (stmt, arg, loop_vinfo, live_p, relevant,
++                                    &worklist))
++                    {
++                      VEC_free (gimple, heap, worklist);
++                      return false;
++                    }
++                }
++            }
++        }
++      else
++        FOR_EACH_PHI_OR_STMT_USE (use_p, stmt, iter, SSA_OP_USE)
++          {
++            tree op = USE_FROM_PTR (use_p);
++            if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
++                              &worklist))
++              {
++                VEC_free (gimple, heap, worklist);
++                return false;
++              }
++          }
+     } /* while worklist */
+ 
+   VEC_free (gimple, heap, worklist);
+@@ -1405,6 +1466,7 @@
+   VEC(tree, heap) *vargs = NULL;
+   enum { NARROW, NONE, WIDEN } modifier;
+   size_t i, nargs;
++  tree lhs;
+ 
+   /* FORNOW: unsupported in basic block SLP.  */
+   gcc_assert (loop_vinfo);
+@@ -1542,7 +1604,7 @@
+   /** Transform.  **/
+ 
+   if (vect_print_dump_info (REPORT_DETAILS))
+-    fprintf (vect_dump, "transform operation.");
++    fprintf (vect_dump, "transform call.");
+ 
+   /* Handle def.  */
+   scalar_dest = gimple_call_lhs (stmt);
+@@ -1661,8 +1723,11 @@
+      rhs of the statement with something harmless.  */
+ 
+   type = TREE_TYPE (scalar_dest);
+-  new_stmt = gimple_build_assign (gimple_call_lhs (stmt),
+-				  build_zero_cst (type));
++  if (is_pattern_stmt_p (stmt_info))
++    lhs = gimple_call_lhs (STMT_VINFO_RELATED_STMT (stmt_info));
++  else
++    lhs = gimple_call_lhs (stmt);
++  new_stmt = gimple_build_assign (lhs, build_zero_cst (type));
+   set_vinfo_for_stmt (new_stmt, stmt_info);
+   set_vinfo_for_stmt (stmt, NULL);
+   STMT_VINFO_STMT (stmt_info) = new_stmt;
+@@ -3231,6 +3296,33 @@
+ 	fprintf (vect_dump, "use not simple.");
+       return false;
+     }
++
++  op_type = TREE_CODE_LENGTH (code);
++  if (op_type == binary_op)
++    {
++      bool ok;
++
++      op1 = gimple_assign_rhs2 (stmt);
++      if (code == WIDEN_MULT_EXPR)
++        {
++	  /* For WIDEN_MULT_EXPR, if OP0 is a constant, use the type of
++	     OP1.  */
++          if (CONSTANT_CLASS_P (op0))
++            ok = vect_is_simple_use_1 (op1, loop_vinfo, NULL,
++                             &def_stmt, &def, &dt[1], &vectype_in);
++          else
++            ok = vect_is_simple_use (op1, loop_vinfo, NULL, &def_stmt, &def,
++                                     &dt[1]);
++
++          if (!ok)
++            {
++	      if (vect_print_dump_info (REPORT_DETAILS))
++	        fprintf (vect_dump, "use not simple.");
++              return false;
++            }
++        }        
++    }
++
+   /* If op0 is an external or constant def use a vector type with
+      the same size as the output vector type.  */
+   if (!vectype_in)
+@@ -3263,18 +3355,6 @@
+ 
+   gcc_assert (ncopies >= 1);
+ 
+-  op_type = TREE_CODE_LENGTH (code);
+-  if (op_type == binary_op)
+-    {
+-      op1 = gimple_assign_rhs2 (stmt);
+-      if (!vect_is_simple_use (op1, loop_vinfo, NULL, &def_stmt, &def, &dt[1]))
+-        {
+-	  if (vect_print_dump_info (REPORT_DETAILS))
+-	    fprintf (vect_dump, "use not simple.");
+-          return false;
+-        }
+-    }
+-
+   /* Supportable by target?  */
+   if (!supportable_widening_operation (code, stmt, vectype_out, vectype_in,
+ 				       &decl1, &decl2, &code1, &code2,
+@@ -3300,6 +3380,14 @@
+     fprintf (vect_dump, "transform type promotion operation. ncopies = %d.",
+                         ncopies);
+ 
++  if (code == WIDEN_MULT_EXPR)
++    {
++      if (CONSTANT_CLASS_P (op0))
++	op0 = fold_convert (TREE_TYPE (op1), op0);
++      else if (CONSTANT_CLASS_P (op1))
++	op1 = fold_convert (TREE_TYPE (op0), op1);
++    }
++
+   /* Handle def.  */
+   /* In case of multi-step promotion, we first generate promotion operations
+      to the intermediate types, and then from that types to the final one.
+@@ -4824,10 +4912,26 @@
+   if (!STMT_VINFO_RELEVANT_P (stmt_info)
+       && !STMT_VINFO_LIVE_P (stmt_info))
+     {
+-      if (vect_print_dump_info (REPORT_DETAILS))
+-        fprintf (vect_dump, "irrelevant.");
++      gimple pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info);
++      if (STMT_VINFO_IN_PATTERN_P (stmt_info)
++          && (STMT_VINFO_RELEVANT_P (vinfo_for_stmt (pattern_stmt))
++              || STMT_VINFO_LIVE_P (vinfo_for_stmt (pattern_stmt))))
++        {
++          stmt = pattern_stmt;
++          stmt_info = vinfo_for_stmt (pattern_stmt);
++          if (vect_print_dump_info (REPORT_DETAILS))
++            {
++              fprintf (vect_dump, "==> examining pattern statement: ");
++              print_gimple_stmt (vect_dump, stmt, 0, TDF_SLIM);
++            }
++        }
++      else
++        {
++          if (vect_print_dump_info (REPORT_DETAILS))
++            fprintf (vect_dump, "irrelevant.");
+ 
+-      return true;
++          return true;
++        }
+     }
+ 
+   switch (STMT_VINFO_DEF_TYPE (stmt_info))
+
+=== modified file 'gcc/tree-vectorizer.h'
+--- old/gcc/tree-vectorizer.h	2011-05-05 15:43:06 +0000
++++ new/gcc/tree-vectorizer.h	2011-06-19 10:59:13 +0000
+@@ -884,7 +884,7 @@
+ /* Pattern recognition functions.
+    Additional pattern recognition functions can (and will) be added
+    in the future.  */
+-typedef gimple (* vect_recog_func_ptr) (gimple, tree *, tree *);
++typedef gimple (* vect_recog_func_ptr) (gimple *, tree *, tree *);
+ #define NUM_PATTERNS 4
+ void vect_pattern_recog (loop_vec_info);
+ 
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch
new file mode 100644
index 0000000..8d2ce21
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106763.patch
@@ -0,0 +1,96 @@
+2011-06-28  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from mainline.
+	LP 791327
+	gcc/
+        2011-06-09  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	PR target/49335
+	* config/arm/predicates.md (add_operator): New.
+	* config/arm/arm.md ("*arith_shiftsi"): Fix for SP reg usage
+	in Thumb2.
+
+2011-06-28  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from mainline.
+	gcc/
+	2011-06-24  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	PR target/49385
+	* config/arm/thumb2.md (*thumb2_movhi_insn): Make sure atleast
+	one of the operands is a register.
+
+=== modified file 'gcc/config/arm/arm.md'
+--- old/gcc/config/arm/arm.md	2011-06-27 22:14:07 +0000
++++ new/gcc/config/arm/arm.md	2011-06-28 12:02:27 +0000
+@@ -8584,18 +8584,22 @@
+ ;; Patterns to allow combination of arithmetic, cond code and shifts
+ 
+ (define_insn "*arith_shiftsi"
+-  [(set (match_operand:SI 0 "s_register_operand" "=r,r")
++  [(set (match_operand:SI 0 "s_register_operand" "=r,r,r,r")
+         (match_operator:SI 1 "shiftable_operator"
+           [(match_operator:SI 3 "shift_operator"
+-             [(match_operand:SI 4 "s_register_operand" "r,r")
+-              (match_operand:SI 5 "shift_amount_operand" "M,r")])
+-           (match_operand:SI 2 "s_register_operand" "rk,rk")]))]
++             [(match_operand:SI 4 "s_register_operand" "r,r,r,r")
++              (match_operand:SI 5 "shift_amount_operand" "M,M,M,r")])
++           (match_operand:SI 2 "s_register_operand" "rk,rk,r,rk")]))]
+   "TARGET_32BIT"
+   "%i1%?\\t%0, %2, %4%S3"
+   [(set_attr "predicable" "yes")
+    (set_attr "shift" "4")
+-   (set_attr "arch" "32,a")
+-   ;; We have to make sure to disable the second alternative if
++   (set_attr "arch" "a,t2,t2,a")
++   ;; Thumb2 doesn't allow the stack pointer to be used for 
++   ;; operand1 for all operations other than add and sub. In this case 
++   ;; the minus operation is a candidate for an rsub and hence needs
++   ;; to be disabled.
++   ;; We have to make sure to disable the fourth alternative if
+    ;; the shift_operator is MULT, since otherwise the insn will
+    ;; also match a multiply_accumulate pattern and validate_change
+    ;; will allow a replacement of the constant with a register
+@@ -8603,9 +8607,13 @@
+    (set_attr_alternative "insn_enabled"
+ 			 [(const_string "yes")
+ 			  (if_then_else
++			   (match_operand:SI 1 "add_operator" "")
++			   (const_string "yes") (const_string "no"))
++			  (const_string "yes")
++			  (if_then_else
+ 			   (match_operand:SI 3 "mult_operator" "")
+ 			   (const_string "no") (const_string "yes"))])
+-   (set_attr "type" "alu_shift,alu_shift_reg")])
++   (set_attr "type" "alu_shift,alu_shift,alu_shift,alu_shift_reg")])
+ 
+ (define_split
+   [(set (match_operand:SI 0 "s_register_operand" "")
+
+=== modified file 'gcc/config/arm/predicates.md'
+--- old/gcc/config/arm/predicates.md	2011-05-03 15:14:56 +0000
++++ new/gcc/config/arm/predicates.md	2011-06-22 15:50:23 +0000
+@@ -687,3 +687,6 @@
+ (define_special_predicate "neon_struct_operand"
+   (and (match_code "mem")
+        (match_test "TARGET_32BIT && neon_vector_mem_operand (op, 2)")))
++
++(define_special_predicate "add_operator"
++  (match_code "plus"))
+
+=== modified file 'gcc/config/arm/thumb2.md'
+--- old/gcc/config/arm/thumb2.md	2011-06-14 14:37:30 +0000
++++ new/gcc/config/arm/thumb2.md	2011-06-20 12:18:27 +0000
+@@ -207,7 +207,9 @@
+ (define_insn "*thumb2_movhi_insn"
+   [(set (match_operand:HI 0 "nonimmediate_operand" "=r,r,m,r")
+ 	(match_operand:HI 1 "general_operand"      "rI,n,r,m"))]
+-  "TARGET_THUMB2"
++  "TARGET_THUMB2
++  && (register_operand (operands[0], HImode)
++     || register_operand (operands[1], HImode))"
+   "@
+    mov%?\\t%0, %1\\t%@ movhi
+    movw%?\\t%0, %L1\\t%@ movhi
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106764.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106764.patch
new file mode 100644
index 0000000..a548b1b
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106764.patch
@@ -0,0 +1,25 @@
+2011-06-30  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	Backport from mainline.
+	LP 744754
+        2011-04-17  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	* config/arm/arm.c (neon_struct_mem_operand):
+	Support POST_INC/PRE_DEC memory operands.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-06-27 22:14:07 +0000
++++ new/gcc/config/arm/arm.c	2011-06-29 09:13:17 +0000
+@@ -9357,6 +9357,11 @@
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
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106766.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106766.patch
new file mode 100644
index 0000000..15046a7
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106766.patch
@@ -0,0 +1,25 @@
+2011-07-03  Ira Rosen  <ira.rosen@linaro.org>
+
+	Backport from FSF:
+	2011-06-12  Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	* tree-vect-data-refs.c (vect_peeling_hash_get_most_frequent):
+	Take number of iterations to peel into account for equally frequent
+	misalignment values.
+
+=== modified file 'gcc/tree-vect-data-refs.c'
+--- old/gcc/tree-vect-data-refs.c	2011-06-02 12:12:00 +0000
++++ new/gcc/tree-vect-data-refs.c	2011-06-29 11:20:24 +0000
+@@ -1256,7 +1256,9 @@
+   vect_peel_info elem = (vect_peel_info) *slot;
+   vect_peel_extended_info max = (vect_peel_extended_info) data;
+ 
+-  if (elem->count > max->peel_info.count)
++  if (elem->count > max->peel_info.count
++      || (elem->count == max->peel_info.count
++          && max->peel_info.npeel > elem->npeel))
+     {
+       max->peel_info.npeel = elem->npeel;
+       max->peel_info.count = elem->count;
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106768.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106768.patch
new file mode 100644
index 0000000..f1f7718
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106768.patch
@@ -0,0 +1,182 @@
+2011-07-07  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	* builtins.c (get_object_alignment): Fix comment.
+	* fold-const.c (get_pointer_modulus_and_residue): Remove
+	allow_func_align.  Use get_object_alignment.
+	(fold_binary_loc): Update caller.
+
+2011-07-07  Richard Sandiford  <richard.sandiford@linaro.org>
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
+	* tree-ssa-ccp.c (get_value_from_alignment): Likewise.
+
+	gcc/testsuite/
+	Backport from mainline:
+
+	2011-06-29  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* gcc.dg/torture/pr49169.c: Restrict to ARM and MIPS targets.
+
+2011-07-07  Richard Sandiford  <richard.sandiford@linaro.org>
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
+--- old/gcc/builtins.c	2011-03-03 21:56:58 +0000
++++ new/gcc/builtins.c	2011-07-04 09:52:27 +0000
+@@ -264,7 +264,14 @@
+ }
+ 
+ /* Return the alignment in bits of EXP, an object.
+-   Don't return more than MAX_ALIGN no matter what.  */
++   Don't return more than MAX_ALIGN no matter what.
++
++   Note that the address (and thus the alignment) computed here is based
++   on the address to which a symbol resolves, whereas DECL_ALIGN is based
++   on the address at which an object is actually located.  These two
++   addresses are not always the same.  For example, on ARM targets,
++   the address &foo of a Thumb function foo() has the lowest bit set,
++   whereas foo() itself starts on an even address.  */
+ 
+ unsigned int
+ get_object_alignment (tree exp, unsigned int max_align)
+@@ -286,7 +293,21 @@
+     exp = DECL_INITIAL (exp);
+   if (DECL_P (exp)
+       && TREE_CODE (exp) != LABEL_DECL)
+-    align = DECL_ALIGN (exp);
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
++	align = DECL_ALIGN (exp);
++    }
+   else if (CONSTANT_CLASS_P (exp))
+     {
+       align = TYPE_ALIGN (TREE_TYPE (exp));
+
+=== modified file 'gcc/fold-const.c'
+--- old/gcc/fold-const.c	2011-05-23 20:37:18 +0000
++++ new/gcc/fold-const.c	2011-07-04 09:52:27 +0000
+@@ -9232,15 +9232,10 @@
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
+@@ -9270,9 +9265,8 @@
+ 	    }
+ 	}
+ 
+-      if (DECL_P (expr)
+-	  && (allow_func_align || TREE_CODE (expr) != FUNCTION_DECL))
+-	return DECL_ALIGN_UNIT (expr);
++      if (DECL_P (expr))
++	return get_object_alignment (expr, ~0U) / BITS_PER_UNIT;
+     }
+   else if (code == POINTER_PLUS_EXPR)
+     {
+@@ -9282,8 +9276,7 @@
+ 
+       op0 = TREE_OPERAND (expr, 0);
+       STRIP_NOPS (op0);
+-      modulus = get_pointer_modulus_and_residue (op0, residue,
+-						 allow_func_align);
++      modulus = get_pointer_modulus_and_residue (op0, residue);
+ 
+       op1 = TREE_OPERAND (expr, 1);
+       STRIP_NOPS (op1);
+@@ -11163,8 +11156,7 @@
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
++++ new/gcc/testsuite/gcc.dg/torture/pr49169.c	2011-06-29 09:46:06 +0000
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
+=== modified file 'gcc/tree-ssa-ccp.c'
+--- old/gcc/tree-ssa-ccp.c	2011-05-05 15:42:22 +0000
++++ new/gcc/tree-ssa-ccp.c	2011-06-29 09:46:06 +0000
+@@ -522,10 +522,6 @@
+     val = bit_value_binop (PLUS_EXPR, TREE_TYPE (expr),
+ 			   TREE_OPERAND (base, 0), TREE_OPERAND (base, 1));
+   else if (base
+-	   /* ???  While function decls have DECL_ALIGN their addresses
+-	      may encode extra information in the lower bits on some
+-	      targets (PR47239).  Simply punt for function decls for now.  */
+-	   && TREE_CODE (base) != FUNCTION_DECL
+ 	   && ((align = get_object_alignment (base, BIGGEST_ALIGNMENT))
+ 		> BITS_PER_UNIT))
+     {
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch
new file mode 100644
index 0000000..37e3036
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106769.patch
@@ -0,0 +1,1294 @@
+2011-07-11  Ira Rosen  <ira.rosen@linaro.org>
+
+	Backport from FSF:
+	2011-06-16  Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	* tree-vectorizer.h (vect_recog_func_ptr): Change the first
+	argument to be a VEC of statements.
+	* tree-vect-loop.c (vect_determine_vectorization_factor): Remove the
+	assert that pattern statements have to have their vector type set.
+	* tree-vect-patterns.c (vect_recog_widen_sum_pattern):
+	Change the first argument to be a VEC of statements.  Update
+	documentation.
+	(vect_recog_dot_prod_pattern, vect_recog_pow_pattern): Likewise.
+	(vect_handle_widen_mult_by_const): New function.
+	(vect_recog_widen_mult_pattern):  Change the first argument to be a
+	VEC of statements.  Update documentation.  Check that the constant is
+	INTEGER_CST.  Support multiplication by a constant that fits an
+	intermediate type - call vect_handle_widen_mult_by_const.
+	(vect_pattern_recog_1): Update vect_recog_func_ptr and its
+	call.  Handle additional pattern statements if necessary.
+
+	gcc/testsuite/
+	* gcc.dg/vect/vect-widen-mult-half-u8.c: New test.
+
+	and
+	2011-06-30  Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	* tree-vect-loop.c (vect_determine_vectorization_factor): Handle
+	both pattern and original statements if necessary.
+	(vect_transform_loop): Likewise.
+	* tree-vect-patterns.c (vect_pattern_recog): Update documentation.
+	* tree-vect-stmts.c (vect_mark_relevant): Add new argument.
+	Mark the pattern statement only if the original statement doesn't
+	have its own uses.
+	(process_use): Call vect_mark_relevant with additional parameter.
+	(vect_mark_stmts_to_be_vectorized): Likewise.
+	(vect_get_vec_def_for_operand): Use vectorized pattern statement.
+	(vect_analyze_stmt): Handle both pattern and original statements
+	if necessary.
+	(vect_transform_stmt): Don't store vectorized pattern statement
+	in the original statement.
+	(vect_is_simple_use_1): Use related pattern statement only if the
+	original statement is irrelevant.
+	* tree-vect-slp.c (vect_get_and_check_slp_defs): Likewise.
+
+	gcc/testsuite/
+	* gcc.dg/vect/slp-widen-mult-half.c: New test.
+	* gcc.dg/vect/vect-widen-mult-half.c: New test.
+
+=== added file 'gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c'
+--- old/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/slp-widen-mult-half.c	2011-07-06 12:04:10 +0000
+@@ -0,0 +1,52 @@
++/* { dg-require-effective-target vect_int } */
++
++#include "tree-vect.h"
++#include <stdlib.h>
++
++#define N 32
++#define COEF 32470
++#define COEF2 324700
++
++unsigned char in[N];
++int out[N];
++int out2[N];
++
++__attribute__ ((noinline)) void
++foo ()
++{
++  int i;
++
++  for (i = 0; i < N/2; i++)
++    {
++      out[2*i] = in[2*i] * COEF;
++      out2[2*i] = in[2*i] + COEF2;
++      out[2*i+1] = in[2*i+1] * COEF;
++      out2[2*i+1] = in[2*i+1] + COEF2;
++    }
++}
++
++int main (void)
++{
++  int i;
++
++  for (i = 0; i < N; i++)
++    {
++      in[i] = i;
++      __asm__ volatile ("");
++    }
++
++  foo ();
++
++  for (i = 0; i < N; i++)
++    if (out[i] != in[i] * COEF || out2[i] != in[i] + COEF2)
++      abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" { target vect_widen_mult_hi_to_si } } } */
++/* { dg-final { scan-tree-dump-times "vectorizing stmts using SLP" 2 "vect" { target vect_widen_mult_hi_to_si } } } */
++/* { dg-final { scan-tree-dump-times "vect_recog_widen_mult_pattern: detected" 2 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { scan-tree-dump-times "pattern recognized" 2 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
++
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half-u8.c	2011-07-06 12:04:10 +0000
+@@ -0,0 +1,59 @@
++/* { dg-require-effective-target vect_int } */
++
++#include "tree-vect.h"
++#include <stdlib.h>
++
++#define N 32
++#define COEF 32470
++
++unsigned char in[N];
++int out[N];
++
++__attribute__ ((noinline)) void
++foo ()
++{
++  int i;
++
++  for (i = 0; i < N; i++)
++    out[i] = in[i] * COEF;
++}
++
++__attribute__ ((noinline)) void
++bar ()
++{
++  int i;
++
++  for (i = 0; i < N; i++)
++    out[i] = COEF * in[i];
++}
++
++int main (void)
++{
++  int i;
++
++  for (i = 0; i < N; i++)
++    {
++      in[i] = i;
++      __asm__ volatile ("");
++    }
++
++  foo ();
++
++  for (i = 0; i < N; i++)
++    if (out[i] != in[i] * COEF)
++      abort ();
++
++  bar ();
++
++  for (i = 0; i < N; i++)
++    if (out[i] != in[i] * COEF)
++      abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 2 "vect" { target vect_widen_mult_hi_to_si } } } */
++/* { dg-final { scan-tree-dump-times "vect_recog_widen_mult_pattern: detected" 2 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { scan-tree-dump-times "pattern recognized" 2 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
++
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-widen-mult-half.c	2011-07-06 12:04:10 +0000
+@@ -0,0 +1,49 @@
++/* { dg-require-effective-target vect_int } */
++
++#include "tree-vect.h"
++#include <stdlib.h>
++
++#define N 32
++#define COEF 32470
++#define COEF2 324700
++
++unsigned char in[N];
++int out[N];
++int out2[N];
++
++__attribute__ ((noinline)) void
++foo (int a)
++{
++  int i;
++
++  for (i = 0; i < N; i++)
++    {
++      out[i] = in[i] * COEF;
++      out2[i] = in[i] + a;
++    }
++}
++
++int main (void)
++{
++  int i;
++
++  for (i = 0; i < N; i++)
++    {
++      in[i] = i;
++      __asm__ volatile ("");
++    }
++
++  foo (COEF2);
++
++  for (i = 0; i < N; i++)
++    if (out[i] != in[i] * COEF || out2[i] != in[i] + COEF2)
++      abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" { target vect_widen_mult_hi_to_si } } } */
++/* { dg-final { scan-tree-dump-times "vect_recog_widen_mult_pattern: detected" 1 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { scan-tree-dump-times "pattern recognized" 1 "vect" { target vect_widen_mult_hi_to_si_pattern } } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
++
+
+=== modified file 'gcc/tree-vect-loop.c'
+--- old/gcc/tree-vect-loop.c	2011-07-04 11:13:51 +0000
++++ new/gcc/tree-vect-loop.c	2011-07-11 11:02:55 +0000
+@@ -181,6 +181,8 @@
+   stmt_vec_info stmt_info;
+   int i;
+   HOST_WIDE_INT dummy;
++  gimple stmt, pattern_stmt = NULL;
++  bool analyze_pattern_stmt = false;
+ 
+   if (vect_print_dump_info (REPORT_DETAILS))
+     fprintf (vect_dump, "=== vect_determine_vectorization_factor ===");
+@@ -241,12 +243,20 @@
+ 	    }
+ 	}
+ 
+-      for (si = gsi_start_bb (bb); !gsi_end_p (si); gsi_next (&si))
++      for (si = gsi_start_bb (bb); !gsi_end_p (si) || analyze_pattern_stmt;)
+         {
+-	  tree vf_vectype;
+-	  gimple stmt = gsi_stmt (si), pattern_stmt;
+-	  stmt_info = vinfo_for_stmt (stmt);
+-
++          tree vf_vectype;
++
++          if (analyze_pattern_stmt)
++            {
++              stmt = pattern_stmt;
++              analyze_pattern_stmt = false;
++            }
++          else
++            stmt = gsi_stmt (si);
++
++         stmt_info = vinfo_for_stmt (stmt);
++              
+ 	  if (vect_print_dump_info (REPORT_DETAILS))
+ 	    {
+ 	      fprintf (vect_dump, "==> examining statement: ");
+@@ -276,10 +286,17 @@
+                {
+                  if (vect_print_dump_info (REPORT_DETAILS))
+                    fprintf (vect_dump, "skip.");
++                 gsi_next (&si);
+                  continue;
+                }
+ 	    }
+ 
++          else if (STMT_VINFO_IN_PATTERN_P (stmt_info)
++                   && (pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info))
++                   && (STMT_VINFO_RELEVANT_P (vinfo_for_stmt (pattern_stmt))
++                       || STMT_VINFO_LIVE_P (vinfo_for_stmt (pattern_stmt))))
++            analyze_pattern_stmt = true;
++
+ 	  if (gimple_get_lhs (stmt) == NULL_TREE)
+ 	    {
+ 	      if (vect_print_dump_info (REPORT_UNVECTORIZED_LOCATIONS))
+@@ -311,9 +328,7 @@
+ 	    }
+ 	  else
+ 	    {
+-	      gcc_assert (!STMT_VINFO_DATA_REF (stmt_info)
+-			  && !is_pattern_stmt_p (stmt_info));
+-
++	      gcc_assert (!STMT_VINFO_DATA_REF (stmt_info));
+ 	      scalar_type = TREE_TYPE (gimple_get_lhs (stmt));
+ 	      if (vect_print_dump_info (REPORT_DETAILS))
+ 		{
+@@ -385,6 +400,9 @@
+ 	  if (!vectorization_factor
+ 	      || (nunits > vectorization_factor))
+ 	    vectorization_factor = nunits;
++
++          if (!analyze_pattern_stmt)
++            gsi_next (&si);
+         }
+     }
+ 
+@@ -4740,6 +4758,8 @@
+   tree cond_expr = NULL_TREE;
+   gimple_seq cond_expr_stmt_list = NULL;
+   bool do_peeling_for_loop_bound;
++  gimple stmt, pattern_stmt;
++  bool transform_pattern_stmt = false;
+ 
+   if (vect_print_dump_info (REPORT_DETAILS))
+     fprintf (vect_dump, "=== vec_transform_loop ===");
+@@ -4827,11 +4847,19 @@
+ 	    }
+ 	}
+ 
+-      for (si = gsi_start_bb (bb); !gsi_end_p (si);)
++      pattern_stmt = NULL;
++      for (si = gsi_start_bb (bb); !gsi_end_p (si) || transform_pattern_stmt;)
+ 	{
+-	  gimple stmt = gsi_stmt (si), pattern_stmt;
+ 	  bool is_store;
+ 
++          if (transform_pattern_stmt)
++            {
++              stmt = pattern_stmt;
++              transform_pattern_stmt = false;
++            }
++          else
++            stmt = gsi_stmt (si);
++
+ 	  if (vect_print_dump_info (REPORT_DETAILS))
+ 	    {
+ 	      fprintf (vect_dump, "------>vectorizing statement: ");
+@@ -4869,6 +4897,11 @@
+ 	          continue;
+                 }
+ 	    }
++          else if (STMT_VINFO_IN_PATTERN_P (stmt_info)
++                   && (pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info))
++                   && (STMT_VINFO_RELEVANT_P (vinfo_for_stmt (pattern_stmt))
++                       || STMT_VINFO_LIVE_P (vinfo_for_stmt (pattern_stmt))))
++            transform_pattern_stmt = true;
+ 
+ 	  gcc_assert (STMT_VINFO_VECTYPE (stmt_info));
+ 	  nunits = (unsigned int) TYPE_VECTOR_SUBPARTS (
+@@ -4897,8 +4930,9 @@
+ 	      /* Hybrid SLP stmts must be vectorized in addition to SLP.  */
+ 	      if (!vinfo_for_stmt (stmt) || PURE_SLP_STMT (stmt_info))
+ 		{
+-		  gsi_next (&si);
+-		  continue;
++                  if (!transform_pattern_stmt)
++ 		    gsi_next (&si);
++  		  continue;
+ 		}
+ 	    }
+ 
+@@ -4917,7 +4951,7 @@
+ 		     the chain.  */
+ 		  vect_remove_stores (DR_GROUP_FIRST_DR (stmt_info));
+ 		  gsi_remove (&si, true);
+-		  continue;
++ 		  continue;
+ 		}
+ 	      else
+ 		{
+@@ -4927,7 +4961,9 @@
+ 		  continue;
+ 		}
+ 	    }
+-	  gsi_next (&si);
++
++          if (!transform_pattern_stmt)
++ 	    gsi_next (&si);
+ 	}		        /* stmts in BB */
+     }				/* BBs in loop */
+ 
+
+=== modified file 'gcc/tree-vect-patterns.c'
+--- old/gcc/tree-vect-patterns.c	2011-06-22 12:10:44 +0000
++++ new/gcc/tree-vect-patterns.c	2011-07-06 12:04:10 +0000
+@@ -39,10 +39,13 @@
+ #include "diagnostic-core.h"
+ 
+ /* Pattern recognition functions  */
+-static gimple vect_recog_widen_sum_pattern (gimple *, tree *, tree *);
+-static gimple vect_recog_widen_mult_pattern (gimple *, tree *, tree *);
+-static gimple vect_recog_dot_prod_pattern (gimple *, tree *, tree *);
+-static gimple vect_recog_pow_pattern (gimple *, tree *, tree *);
++static gimple vect_recog_widen_sum_pattern (VEC (gimple, heap) **, tree *,
++					    tree *);
++static gimple vect_recog_widen_mult_pattern (VEC (gimple, heap) **, tree *,
++					     tree *);
++static gimple vect_recog_dot_prod_pattern (VEC (gimple, heap) **, tree *,
++					   tree *);
++static gimple vect_recog_pow_pattern (VEC (gimple, heap) **, tree *, tree *);
+ static vect_recog_func_ptr vect_vect_recog_func_ptrs[NUM_PATTERNS] = {
+ 	vect_recog_widen_mult_pattern,
+ 	vect_recog_widen_sum_pattern,
+@@ -142,9 +145,9 @@
+ 
+    Input:
+ 
+-   * LAST_STMT: A stmt from which the pattern search begins. In the example,
+-   when this function is called with S7, the pattern {S3,S4,S5,S6,S7} will be
+-   detected.
++   * STMTS: Contains a stmt from which the pattern search begins.  In the
++   example, when this function is called with S7, the pattern {S3,S4,S5,S6,S7}
++   will be detected.
+ 
+    Output:
+ 
+@@ -165,12 +168,13 @@
+          inner-loop nested in an outer-loop that us being vectorized).  */
+ 
+ static gimple
+-vect_recog_dot_prod_pattern (gimple *last_stmt, tree *type_in, tree *type_out)
++vect_recog_dot_prod_pattern (VEC (gimple, heap) **stmts, tree *type_in,
++			     tree *type_out)
+ {
+-  gimple stmt;
++  gimple stmt, last_stmt = VEC_index (gimple, *stmts, 0);
+   tree oprnd0, oprnd1;
+   tree oprnd00, oprnd01;
+-  stmt_vec_info stmt_vinfo = vinfo_for_stmt (*last_stmt);
++  stmt_vec_info stmt_vinfo = vinfo_for_stmt (last_stmt);
+   tree type, half_type;
+   gimple pattern_stmt;
+   tree prod_type;
+@@ -178,10 +182,10 @@
+   struct loop *loop = LOOP_VINFO_LOOP (loop_info);
+   tree var, rhs;
+ 
+-  if (!is_gimple_assign (*last_stmt))
++  if (!is_gimple_assign (last_stmt))
+     return NULL;
+ 
+-  type = gimple_expr_type (*last_stmt);
++  type = gimple_expr_type (last_stmt);
+ 
+   /* Look for the following pattern
+           DX = (TYPE1) X;
+@@ -207,7 +211,7 @@
+   /* Starting from LAST_STMT, follow the defs of its uses in search
+      of the above pattern.  */
+ 
+-  if (gimple_assign_rhs_code (*last_stmt) != PLUS_EXPR)
++  if (gimple_assign_rhs_code (last_stmt) != PLUS_EXPR)
+     return NULL;
+ 
+   if (STMT_VINFO_IN_PATTERN_P (stmt_vinfo))
+@@ -228,12 +232,12 @@
+ 
+       if (STMT_VINFO_DEF_TYPE (stmt_vinfo) != vect_reduction_def)
+         return NULL;
+-      oprnd0 = gimple_assign_rhs1 (*last_stmt);
+-      oprnd1 = gimple_assign_rhs2 (*last_stmt);
++      oprnd0 = gimple_assign_rhs1 (last_stmt);
++      oprnd1 = gimple_assign_rhs2 (last_stmt);
+       if (!types_compatible_p (TREE_TYPE (oprnd0), type)
+ 	  || !types_compatible_p (TREE_TYPE (oprnd1), type))
+         return NULL;
+-      stmt = *last_stmt;
++      stmt = last_stmt;
+ 
+       if (widened_name_p (oprnd0, stmt, &half_type, &def_stmt, true))
+         {
+@@ -319,11 +323,79 @@
+ 
+   /* We don't allow changing the order of the computation in the inner-loop
+      when doing outer-loop vectorization.  */
+-  gcc_assert (!nested_in_vect_loop_p (loop, *last_stmt));
++  gcc_assert (!nested_in_vect_loop_p (loop, last_stmt));
+ 
+   return pattern_stmt;
+ }
+ 
++/* Handle two cases of multiplication by a constant.  The first one is when
++   the constant, CONST_OPRND, fits the type (HALF_TYPE) of the second
++   operand (OPRND).  In that case, we can peform widen-mult from HALF_TYPE to
++   TYPE.
++
++   Otherwise, if the type of the result (TYPE) is at least 4 times bigger than
++   HALF_TYPE, and CONST_OPRND fits an intermediate type (2 times smaller than
++   TYPE), we can perform widen-mult from the intermediate type to TYPE and
++   replace a_T = (TYPE) a_t; with a_it - (interm_type) a_t;  */
++
++static bool
++vect_handle_widen_mult_by_const (tree const_oprnd, tree *oprnd,
++                                 VEC (gimple, heap) **stmts, tree type,
++                                 tree *half_type, gimple def_stmt)
++{
++  tree new_type, new_oprnd, tmp;
++  gimple new_stmt;
++
++  if (int_fits_type_p (const_oprnd, *half_type))
++    {
++      /* CONST_OPRND is a constant of HALF_TYPE.  */
++      *oprnd = gimple_assign_rhs1 (def_stmt);
++      return true;
++    }
++
++  if (TYPE_PRECISION (type) < (TYPE_PRECISION (*half_type) * 4)
++      || !vinfo_for_stmt (def_stmt))
++    return false;
++
++  /* TYPE is 4 times bigger than HALF_TYPE, try widen-mult for
++     a type 2 times bigger than HALF_TYPE.  */
++  new_type = build_nonstandard_integer_type (TYPE_PRECISION (type) / 2,
++                                             TYPE_UNSIGNED (type));
++  if (!int_fits_type_p (const_oprnd, new_type))
++    return false;
++
++  /* Use NEW_TYPE for widen_mult.  */
++  if (STMT_VINFO_RELATED_STMT (vinfo_for_stmt (def_stmt)))
++    {
++      new_stmt = STMT_VINFO_RELATED_STMT (vinfo_for_stmt (def_stmt));
++      /* Check if the already created pattern stmt is what we need.  */
++      if (!is_gimple_assign (new_stmt)
++          || gimple_assign_rhs_code (new_stmt) != NOP_EXPR
++          || TREE_TYPE (gimple_assign_lhs (new_stmt)) != new_type)
++        return false;
++
++      *oprnd = gimple_assign_lhs (new_stmt);
++    }
++  else
++    {
++      /* Create a_T = (NEW_TYPE) a_t;  */
++      *oprnd = gimple_assign_rhs1 (def_stmt);
++      tmp = create_tmp_var (new_type, NULL);
++      add_referenced_var (tmp);
++      new_oprnd = make_ssa_name (tmp, NULL);
++      new_stmt = gimple_build_assign_with_ops (NOP_EXPR, new_oprnd, *oprnd,
++                                               NULL_TREE);
++      SSA_NAME_DEF_STMT (new_oprnd) = new_stmt;
++      STMT_VINFO_RELATED_STMT (vinfo_for_stmt (def_stmt)) = new_stmt;
++      VEC_safe_push (gimple, heap, *stmts, def_stmt);
++      *oprnd = new_oprnd;
++    }
++
++  *half_type = new_type;
++  return true;
++}
++
++
+ /* Function vect_recog_widen_mult_pattern
+ 
+    Try to find the following pattern:
+@@ -361,28 +433,47 @@
+      S3  a_T = (TYPE) a_t;
+      S5  prod_T = a_T * CONST;
+ 
+-    Input:
+-
+-    * LAST_STMT: A stmt from which the pattern search begins.  In the example,
+-    when this function is called with S5, the pattern {S3,S4,S5,(S6)} is
+-    detected.
+-
+-    Output:
+-
+-    * TYPE_IN: The type of the input arguments to the pattern.
+-
+-    * TYPE_OUT: The type of the output of this pattern.
+-
+-    * Return value: A new stmt that will be used to replace the sequence of
+-    stmts that constitute the pattern.  In this case it will be:
+-         WIDEN_MULT <a_t, b_t>
+- */
++   A special case of multiplication by constants is when 'TYPE' is 4 times
++   bigger than 'type', but CONST fits an intermediate type 2 times smaller
++   than 'TYPE'.  In that case we create an additional pattern stmt for S3
++   to create a variable of the intermediate type, and perform widen-mult
++   on the intermediate type as well:
++
++     type a_t;
++     interm_type a_it;
++     TYPE a_T, prod_T,  prod_T';
++
++     S1  a_t = ;
++     S3  a_T = (TYPE) a_t;
++           '--> a_it = (interm_type) a_t;
++     S5  prod_T = a_T * CONST;
++           '--> prod_T' = a_it w* CONST;
++
++   Input/Output:
++
++   * STMTS: Contains a stmt from which the pattern search begins.  In the
++   example, when this function is called with S5, the pattern {S3,S4,S5,(S6)}
++   is detected.  In case of unsigned widen-mult, the original stmt (S5) is
++   replaced with S6 in STMTS.  In case of multiplication by a constant
++   of an intermediate type (the last case above), STMTS also contains S3
++   (inserted before S5).
++
++   Output:
++
++   * TYPE_IN: The type of the input arguments to the pattern.
++
++   * TYPE_OUT: The type of the output of this pattern.
++
++   * Return value: A new stmt that will be used to replace the sequence of
++   stmts that constitute the pattern.  In this case it will be:
++        WIDEN_MULT <a_t, b_t>
++*/
+ 
+ static gimple
+-vect_recog_widen_mult_pattern (gimple *last_stmt,
+-			       tree *type_in,
+-			       tree *type_out)
++vect_recog_widen_mult_pattern (VEC (gimple, heap) **stmts,
++                               tree *type_in, tree *type_out)
+ {
++  gimple last_stmt = VEC_pop (gimple, *stmts);
+   gimple def_stmt0, def_stmt1;
+   tree oprnd0, oprnd1;
+   tree type, half_type0, half_type1;
+@@ -395,27 +486,27 @@
+   VEC (tree, heap) *dummy_vec;
+   bool op0_ok, op1_ok;
+ 
+-  if (!is_gimple_assign (*last_stmt))
++  if (!is_gimple_assign (last_stmt))
+     return NULL;
+ 
+-  type = gimple_expr_type (*last_stmt);
++  type = gimple_expr_type (last_stmt);
+ 
+   /* Starting from LAST_STMT, follow the defs of its uses in search
+      of the above pattern.  */
+ 
+-  if (gimple_assign_rhs_code (*last_stmt) != MULT_EXPR)
++  if (gimple_assign_rhs_code (last_stmt) != MULT_EXPR)
+     return NULL;
+ 
+-  oprnd0 = gimple_assign_rhs1 (*last_stmt);
+-  oprnd1 = gimple_assign_rhs2 (*last_stmt);
++  oprnd0 = gimple_assign_rhs1 (last_stmt);
++  oprnd1 = gimple_assign_rhs2 (last_stmt);
+   if (!types_compatible_p (TREE_TYPE (oprnd0), type)
+       || !types_compatible_p (TREE_TYPE (oprnd1), type))
+     return NULL;
+ 
+   /* Check argument 0.  */
+-  op0_ok = widened_name_p (oprnd0, *last_stmt, &half_type0, &def_stmt0, false);
++  op0_ok = widened_name_p (oprnd0, last_stmt, &half_type0, &def_stmt0, false);
+   /* Check argument 1.  */
+-  op1_ok = widened_name_p (oprnd1, *last_stmt, &half_type1, &def_stmt1, false);
++  op1_ok = widened_name_p (oprnd1, last_stmt, &half_type1, &def_stmt1, false);
+ 
+   /* In case of multiplication by a constant one of the operands may not match
+      the pattern, but not both.  */
+@@ -429,29 +520,21 @@
+     }
+   else if (!op0_ok)
+     {
+-      if (CONSTANT_CLASS_P (oprnd0)
+-         && TREE_CODE (half_type1) == INTEGER_TYPE
+-         && tree_int_cst_lt (oprnd0, TYPE_MAXVAL (half_type1))
+-         && tree_int_cst_lt (TYPE_MINVAL (half_type1), oprnd0))
+-        {
+-          /* OPRND0 is a constant of HALF_TYPE1.  */
+-          half_type0 = half_type1;
+-          oprnd1 = gimple_assign_rhs1 (def_stmt1);
+-        }
++      if (TREE_CODE (oprnd0) == INTEGER_CST
++          && TREE_CODE (half_type1) == INTEGER_TYPE
++          && vect_handle_widen_mult_by_const (oprnd0, &oprnd1, stmts, type,
++                                              &half_type1, def_stmt1))
++        half_type0 = half_type1;
+       else
+         return NULL;
+     }
+   else if (!op1_ok)
+     {
+-      if (CONSTANT_CLASS_P (oprnd1)
++      if (TREE_CODE (oprnd1) == INTEGER_CST
+           && TREE_CODE (half_type0) == INTEGER_TYPE
+-          && tree_int_cst_lt (oprnd1, TYPE_MAXVAL (half_type0))
+-          && tree_int_cst_lt (TYPE_MINVAL (half_type0), oprnd1))
+-        {
+-          /* OPRND1 is a constant of HALF_TYPE0.  */
+-          half_type1 = half_type0;
+-          oprnd0 = gimple_assign_rhs1 (def_stmt0);
+-        }
++          && vect_handle_widen_mult_by_const (oprnd1, &oprnd0, stmts, type,
++                                              &half_type0, def_stmt0))
++        half_type1 = half_type0;
+       else
+         return NULL;
+     }
+@@ -461,7 +544,7 @@
+      Use unsigned TYPE as the type for WIDEN_MULT_EXPR.  */
+   if (TYPE_UNSIGNED (type) != TYPE_UNSIGNED (half_type0))
+     {
+-      tree lhs = gimple_assign_lhs (*last_stmt), use_lhs;
++      tree lhs = gimple_assign_lhs (last_stmt), use_lhs;
+       imm_use_iterator imm_iter;
+       use_operand_p use_p;
+       int nuses = 0;
+@@ -491,7 +574,7 @@
+         return NULL;
+ 
+       type = use_type;
+-      *last_stmt = use_stmt;
++      last_stmt = use_stmt;
+     }
+ 
+   if (!types_compatible_p (half_type0, half_type1))
+@@ -506,7 +589,7 @@
+   vectype_out = get_vectype_for_scalar_type (type);
+   if (!vectype
+       || !vectype_out
+-      || !supportable_widening_operation (WIDEN_MULT_EXPR, *last_stmt,
++      || !supportable_widening_operation (WIDEN_MULT_EXPR, last_stmt,
+ 					  vectype_out, vectype,
+ 					  &dummy, &dummy, &dummy_code,
+ 					  &dummy_code, &dummy_int, &dummy_vec))
+@@ -524,6 +607,7 @@
+   if (vect_print_dump_info (REPORT_DETAILS))
+     print_gimple_stmt (vect_dump, pattern_stmt, 0, TDF_SLIM);
+ 
++  VEC_safe_push (gimple, heap, *stmts, last_stmt);
+   return pattern_stmt;
+ }
+ 
+@@ -555,16 +639,17 @@
+ */
+ 
+ static gimple
+-vect_recog_pow_pattern (gimple *last_stmt, tree *type_in, tree *type_out)
++vect_recog_pow_pattern (VEC (gimple, heap) **stmts, tree *type_in, tree *type_out)
+ {
++  gimple last_stmt = VEC_index (gimple, *stmts, 0);
+   tree fn, base, exp = NULL;
+   gimple stmt;
+   tree var;
+ 
+-  if (!is_gimple_call (*last_stmt) || gimple_call_lhs (*last_stmt) == NULL)
++  if (!is_gimple_call (last_stmt) || gimple_call_lhs (last_stmt) == NULL)
+     return NULL;
+ 
+-  fn = gimple_call_fndecl (*last_stmt);
++  fn = gimple_call_fndecl (last_stmt);
+   if (fn == NULL_TREE || DECL_BUILT_IN_CLASS (fn) != BUILT_IN_NORMAL)
+    return NULL;
+ 
+@@ -574,8 +659,8 @@
+     case BUILT_IN_POWI:
+     case BUILT_IN_POWF:
+     case BUILT_IN_POW:
+-      base = gimple_call_arg (*last_stmt, 0);
+-      exp = gimple_call_arg (*last_stmt, 1);
++      base = gimple_call_arg (last_stmt, 0);
++      exp = gimple_call_arg (last_stmt, 1);
+       if (TREE_CODE (exp) != REAL_CST
+ 	  && TREE_CODE (exp) != INTEGER_CST)
+         return NULL;
+@@ -667,21 +752,23 @@
+ 	 inner-loop nested in an outer-loop that us being vectorized).  */
+ 
+ static gimple
+-vect_recog_widen_sum_pattern (gimple *last_stmt, tree *type_in, tree *type_out)
++vect_recog_widen_sum_pattern (VEC (gimple, heap) **stmts, tree *type_in,
++                              tree *type_out)
+ {
++  gimple last_stmt = VEC_index (gimple, *stmts, 0); 
+   gimple stmt;
+   tree oprnd0, oprnd1;
+-  stmt_vec_info stmt_vinfo = vinfo_for_stmt (*last_stmt);
++  stmt_vec_info stmt_vinfo = vinfo_for_stmt (last_stmt);
+   tree type, half_type;
+   gimple pattern_stmt;
+   loop_vec_info loop_info = STMT_VINFO_LOOP_VINFO (stmt_vinfo);
+   struct loop *loop = LOOP_VINFO_LOOP (loop_info);
+   tree var;
+ 
+-  if (!is_gimple_assign (*last_stmt))
++  if (!is_gimple_assign (last_stmt))
+     return NULL;
+ 
+-  type = gimple_expr_type (*last_stmt);
++  type = gimple_expr_type (last_stmt);
+ 
+   /* Look for the following pattern
+           DX = (TYPE) X;
+@@ -693,25 +780,25 @@
+   /* Starting from LAST_STMT, follow the defs of its uses in search
+      of the above pattern.  */
+ 
+-  if (gimple_assign_rhs_code (*last_stmt) != PLUS_EXPR)
++  if (gimple_assign_rhs_code (last_stmt) != PLUS_EXPR)
+     return NULL;
+ 
+   if (STMT_VINFO_DEF_TYPE (stmt_vinfo) != vect_reduction_def)
+     return NULL;
+ 
+-  oprnd0 = gimple_assign_rhs1 (*last_stmt);
+-  oprnd1 = gimple_assign_rhs2 (*last_stmt);
++  oprnd0 = gimple_assign_rhs1 (last_stmt);
++  oprnd1 = gimple_assign_rhs2 (last_stmt);
+   if (!types_compatible_p (TREE_TYPE (oprnd0), type)
+       || !types_compatible_p (TREE_TYPE (oprnd1), type))
+     return NULL;
+ 
+-  /* So far so good.  Since *last_stmt was detected as a (summation) reduction,
++  /* So far so good.  Since last_stmt was detected as a (summation) reduction,
+      we know that oprnd1 is the reduction variable (defined by a loop-header
+      phi), and oprnd0 is an ssa-name defined by a stmt in the loop body.
+      Left to check that oprnd0 is defined by a cast from type 'type' to type
+      'TYPE'.  */
+ 
+-  if (!widened_name_p (oprnd0, *last_stmt, &half_type, &stmt, true))
++  if (!widened_name_p (oprnd0, last_stmt, &half_type, &stmt, true))
+     return NULL;
+ 
+   oprnd0 = gimple_assign_rhs1 (stmt);
+@@ -732,8 +819,9 @@
+ 
+   /* We don't allow changing the order of the computation in the inner-loop
+      when doing outer-loop vectorization.  */
+-  gcc_assert (!nested_in_vect_loop_p (loop, *last_stmt));
++  gcc_assert (!nested_in_vect_loop_p (loop, last_stmt));
+ 
++  VEC_safe_push (gimple, heap, *stmts, last_stmt);
+   return pattern_stmt;
+ }
+ 
+@@ -762,7 +850,7 @@
+ 
+ static void
+ vect_pattern_recog_1 (
+-	gimple (* vect_recog_func) (gimple *, tree *, tree *),
++	gimple (* vect_recog_func) (VEC (gimple, heap) **, tree *, tree *),
+ 	gimple_stmt_iterator si)
+ {
+   gimple stmt = gsi_stmt (si), pattern_stmt;
+@@ -774,12 +862,14 @@
+   enum tree_code code;
+   int i;
+   gimple next;
++  VEC (gimple, heap) *stmts_to_replace = VEC_alloc (gimple, heap, 1);
+ 
+-  pattern_stmt = (* vect_recog_func) (&stmt, &type_in, &type_out);
++  VEC_quick_push (gimple, stmts_to_replace, stmt);
++  pattern_stmt = (* vect_recog_func) (&stmts_to_replace, &type_in, &type_out);
+   if (!pattern_stmt)
+     return;
+ 
+-  si = gsi_for_stmt (stmt);
++  stmt = VEC_last (gimple, stmts_to_replace);
+   stmt_info = vinfo_for_stmt (stmt);
+   loop_vinfo = STMT_VINFO_LOOP_VINFO (stmt_info);
+  
+@@ -849,6 +939,35 @@
+   FOR_EACH_VEC_ELT (gimple, LOOP_VINFO_REDUCTIONS (loop_vinfo), i, next)
+     if (next == stmt)
+       VEC_ordered_remove (gimple, LOOP_VINFO_REDUCTIONS (loop_vinfo), i); 
++
++  /* In case of widen-mult by a constant, it is possible that an additional
++     pattern stmt is created and inserted in STMTS_TO_REPLACE.  We create a
++     stmt_info for it, and mark the relevant statements.  */
++  for (i = 0; VEC_iterate (gimple, stmts_to_replace, i, stmt)
++              && (unsigned) i < (VEC_length (gimple, stmts_to_replace) - 1);
++       i++)
++    {
++      stmt_info = vinfo_for_stmt (stmt);
++      pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info);
++      if (vect_print_dump_info (REPORT_DETAILS))
++        {
++          fprintf (vect_dump, "additional pattern stmt: ");
++          print_gimple_stmt (vect_dump, pattern_stmt, 0, TDF_SLIM);
++        }
++
++      set_vinfo_for_stmt (pattern_stmt,
++                      new_stmt_vec_info (pattern_stmt, loop_vinfo, NULL));
++      gimple_set_bb (pattern_stmt, gimple_bb (stmt));
++      pattern_stmt_info = vinfo_for_stmt (pattern_stmt);
++
++      STMT_VINFO_RELATED_STMT (pattern_stmt_info) = stmt;
++      STMT_VINFO_DEF_TYPE (pattern_stmt_info)
++        = STMT_VINFO_DEF_TYPE (stmt_info);
++      STMT_VINFO_VECTYPE (pattern_stmt_info) = STMT_VINFO_VECTYPE (stmt_info);
++      STMT_VINFO_IN_PATTERN_P (stmt_info) = true;
++    }
++
++  VEC_free (gimple, heap, stmts_to_replace);
+ }
+ 
+ 
+@@ -896,10 +1015,8 @@
+ 
+    If vectorization succeeds, vect_transform_stmt will skip over {S1,S2,S3}
+    (because they are marked as irrelevant).  It will vectorize S6, and record
+-   a pointer to the new vector stmt VS6 both from S6 (as usual), and also
+-   from S4.  We do that so that when we get to vectorizing stmts that use the
+-   def of S4 (like S5 that uses a_0), we'll know where to take the relevant
+-   vector-def from.  S4 will be skipped, and S5 will be vectorized as usual:
++   a pointer to the new vector stmt VS6 from S6 (as usual).
++   S4 will be skipped, and S5 will be vectorized as usual:
+ 
+                                   in_pattern_p  related_stmt    vec_stmt
+          S1: a_i = ....                 -       -               -
+@@ -915,7 +1032,21 @@
+    elsewhere), and we'll end up with:
+ 
+         VS6: va_new = ....
+-        VS5: ... = ..vuse(va_new)..  */
++        VS5: ... = ..vuse(va_new)..  
++
++   In case of more than one pattern statements, e.g., widen-mult with
++   intermediate type:
++
++     S1  a_t = ;
++     S2  a_T = (TYPE) a_t;
++           '--> S3: a_it = (interm_type) a_t;
++     S4  prod_T = a_T * CONST;
++           '--> S5: prod_T' = a_it w* CONST;
++   
++   there may be other users of a_T outside the pattern. In that case S2 will
++   be marked as relevant (as well as S3), and both S2 and S3 will be analyzed
++   and vectorized.  The vector stmt VS2 will be recorded in S2, and VS3 will
++   be recorded in S3.  */
+ 
+ void
+ vect_pattern_recog (loop_vec_info loop_vinfo)
+@@ -925,7 +1056,7 @@
+   unsigned int nbbs = loop->num_nodes;
+   gimple_stmt_iterator si;
+   unsigned int i, j;
+-  gimple (* vect_recog_func_ptr) (gimple *, tree *, tree *);
++  gimple (* vect_recog_func_ptr) (VEC (gimple, heap) **, tree *, tree *);
+ 
+   if (vect_print_dump_info (REPORT_DETAILS))
+     fprintf (vect_dump, "=== vect_pattern_recog ===");
+
+=== modified file 'gcc/tree-vect-slp.c'
+--- old/gcc/tree-vect-slp.c	2011-06-19 10:59:13 +0000
++++ new/gcc/tree-vect-slp.c	2011-07-06 12:04:10 +0000
+@@ -152,7 +152,9 @@
+       if (loop && def_stmt && gimple_bb (def_stmt)
+           && flow_bb_inside_loop_p (loop, gimple_bb (def_stmt))
+           && vinfo_for_stmt (def_stmt)
+-          && STMT_VINFO_IN_PATTERN_P (vinfo_for_stmt (def_stmt)))
++          && STMT_VINFO_IN_PATTERN_P (vinfo_for_stmt (def_stmt))
++          && !STMT_VINFO_RELEVANT (vinfo_for_stmt (def_stmt))
++          && !STMT_VINFO_LIVE_P (vinfo_for_stmt (def_stmt)))
+         {
+           if (!*first_stmt_dt0)
+             *pattern0 = true;
+
+=== modified file 'gcc/tree-vect-stmts.c'
+--- old/gcc/tree-vect-stmts.c	2011-06-22 06:21:13 +0000
++++ new/gcc/tree-vect-stmts.c	2011-07-06 12:04:10 +0000
+@@ -126,33 +126,72 @@
+ 
+ static void
+ vect_mark_relevant (VEC(gimple,heap) **worklist, gimple stmt,
+-		    enum vect_relevant relevant, bool live_p)
++		    enum vect_relevant relevant, bool live_p,
++		    bool used_in_pattern)
+ {
+   stmt_vec_info stmt_info = vinfo_for_stmt (stmt);
+   enum vect_relevant save_relevant = STMT_VINFO_RELEVANT (stmt_info);
+   bool save_live_p = STMT_VINFO_LIVE_P (stmt_info);
++  gimple pattern_stmt;
+ 
+   if (vect_print_dump_info (REPORT_DETAILS))
+     fprintf (vect_dump, "mark relevant %d, live %d.", relevant, live_p);
+ 
++  /* If this stmt is an original stmt in a pattern, we might need to mark its
++     related pattern stmt instead of the original stmt.  However, such stmts 
++     may have their own uses that are not in any pattern, in such cases the
++     stmt itself should be marked.  */
+   if (STMT_VINFO_IN_PATTERN_P (stmt_info))
+     {
+-      gimple pattern_stmt;
+-
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
++      bool found = false;
++      if (!used_in_pattern)
++        {
++          imm_use_iterator imm_iter;
++          use_operand_p use_p;
++          gimple use_stmt;
++          tree lhs;
++
++          if (is_gimple_assign (stmt))
++            lhs = gimple_assign_lhs (stmt);
++          else
++            lhs = gimple_call_lhs (stmt);
++
++          /* This use is out of pattern use, if LHS has other uses that are
++             pattern uses, we should mark the stmt itself, and not the pattern
++             stmt.  */
++          FOR_EACH_IMM_USE_FAST (use_p, imm_iter, lhs)
++            {
++              if (is_gimple_debug (USE_STMT (use_p)))
++                continue;
++              use_stmt = USE_STMT (use_p);
++
++              if (vinfo_for_stmt (use_stmt)
++                  && STMT_VINFO_IN_PATTERN_P (vinfo_for_stmt (use_stmt)))
++                {
++                  found = true;
++                  break;
++                }
++            }
++        }
++
++      if (!found)
++        {
++          /* This is the last stmt in a sequence that was detected as a
++             pattern that can potentially be vectorized.  Don't mark the stmt
++             as relevant/live because it's not going to be vectorized.
++             Instead mark the pattern-stmt that replaces it.  */
++
++          pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info);
++
++          if (vect_print_dump_info (REPORT_DETAILS))
++            fprintf (vect_dump, "last stmt in pattern. don't mark"
++                                " relevant/live.");
++          stmt_info = vinfo_for_stmt (pattern_stmt);
++          gcc_assert (STMT_VINFO_RELATED_STMT (stmt_info) == stmt);
++          save_relevant = STMT_VINFO_RELEVANT (stmt_info);
++          save_live_p = STMT_VINFO_LIVE_P (stmt_info);
++          stmt = pattern_stmt;
++        }
+     }
+ 
+   STMT_VINFO_LIVE_P (stmt_info) |= live_p;
+@@ -437,7 +476,8 @@
+         }
+     }
+ 
+-  vect_mark_relevant (worklist, def_stmt, relevant, live_p);
++  vect_mark_relevant (worklist, def_stmt, relevant, live_p,
++                      is_pattern_stmt_p (stmt_vinfo));
+   return true;
+ }
+ 
+@@ -494,7 +534,7 @@
+ 	    }
+ 
+ 	  if (vect_stmt_relevant_p (phi, loop_vinfo, &relevant, &live_p))
+-	    vect_mark_relevant (&worklist, phi, relevant, live_p);
++	    vect_mark_relevant (&worklist, phi, relevant, live_p, false);
+ 	}
+       for (si = gsi_start_bb (bb); !gsi_end_p (si); gsi_next (&si))
+ 	{
+@@ -506,7 +546,7 @@
+ 	    }
+ 
+ 	  if (vect_stmt_relevant_p (stmt, loop_vinfo, &relevant, &live_p))
+-            vect_mark_relevant (&worklist, stmt, relevant, live_p);
++            vect_mark_relevant (&worklist, stmt, relevant, live_p, false);
+ 	}
+     }
+ 
+@@ -613,42 +653,55 @@
+           if (is_gimple_assign (stmt))
+             {
+               tree rhs = gimple_assign_rhs1 (stmt);
+-              if (get_gimple_rhs_class (gimple_assign_rhs_code (stmt))
+-                  == GIMPLE_SINGLE_RHS)
++              unsigned int op_num;
++              tree op;
++              switch (get_gimple_rhs_class (gimple_assign_rhs_code (stmt)))
+                 {
+-                  unsigned int op_num = TREE_OPERAND_LENGTH (gimple_assign_rhs1
+-                                                              (stmt));
+-                  for (i = 0; i < op_num; i++)
+-                    {
+-                      tree op = TREE_OPERAND (rhs, i);
+-                      if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
+-                                    &worklist))
++                  case GIMPLE_SINGLE_RHS:
++                     op_num = TREE_OPERAND_LENGTH (gimple_assign_rhs1 (stmt));
++                     for (i = 0; i < op_num; i++)
+                        {
+-                         VEC_free (gimple, heap, worklist);
+-                         return false;
++                         op = TREE_OPERAND (rhs, i);
++                         if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
++                                           &worklist))
++                           {
++                             VEC_free (gimple, heap, worklist);
++                             return false;
++                           }
+                        }
+-                    }
+-                }
+-              else if (get_gimple_rhs_class (gimple_assign_rhs_code (stmt))
+-                       == GIMPLE_BINARY_RHS)
+-                {
+-                  tree op = gimple_assign_rhs1 (stmt);
+-                  if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
+-                                    &worklist))
+-                    {
+-                      VEC_free (gimple, heap, worklist);
+-                      return false;
+-                    }
+-                  op = gimple_assign_rhs2 (stmt);
+-                  if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
+-                                    &worklist))
+-                    {
+-                      VEC_free (gimple, heap, worklist);
+-                      return false;
+-                    }
+-                }
+-              else
+-                return false;
++                    break;
++                   
++                  case GIMPLE_BINARY_RHS:
++                    op = gimple_assign_rhs1 (stmt);
++                    if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
++                                      &worklist))
++                      {
++                        VEC_free (gimple, heap, worklist);
++                        return false;
++                      }
++                    op = gimple_assign_rhs2 (stmt);
++                    if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
++                                      &worklist))
++                      {
++                        VEC_free (gimple, heap, worklist);
++                        return false;
++                      }
++                    break;
++
++                  case GIMPLE_UNARY_RHS:
++                    op = gimple_assign_rhs1 (stmt);
++                    if (!process_use (stmt, op, loop_vinfo, live_p, relevant,
++                                      &worklist))
++                      {
++                        VEC_free (gimple, heap, worklist);
++                        return false;
++                      }
++
++                    break;
++                  
++                  default: 
++                    return false;
++                }
+             }
+           else if (is_gimple_call (stmt))
+             {
+@@ -1210,7 +1263,14 @@
+ 
+         /* Get the def from the vectorized stmt.  */
+         def_stmt_info = vinfo_for_stmt (def_stmt);
++
+         vec_stmt = STMT_VINFO_VEC_STMT (def_stmt_info);
++        /* Get vectorized pattern statement.  */
++        if (!vec_stmt
++            && STMT_VINFO_IN_PATTERN_P (def_stmt_info)
++            && !STMT_VINFO_RELEVANT (def_stmt_info))
++          vec_stmt = STMT_VINFO_VEC_STMT (vinfo_for_stmt (
++                       STMT_VINFO_RELATED_STMT (def_stmt_info)));
+         gcc_assert (vec_stmt);
+ 	if (gimple_code (vec_stmt) == GIMPLE_PHI)
+ 	  vec_oprnd = PHI_RESULT (vec_stmt);
+@@ -4886,6 +4946,7 @@
+   enum vect_relevant relevance = STMT_VINFO_RELEVANT (stmt_info);
+   bool ok;
+   tree scalar_type, vectype;
++  gimple pattern_stmt;
+ 
+   if (vect_print_dump_info (REPORT_DETAILS))
+     {
+@@ -4907,16 +4968,22 @@
+      - any LABEL_EXPRs in the loop
+      - computations that are used only for array indexing or loop control.
+      In basic blocks we only analyze statements that are a part of some SLP
+-     instance, therefore, all the statements are relevant.  */
+-
++     instance, therefore, all the statements are relevant.  
++
++     Pattern statement need to be analyzed instead of the original statement
++     if the original statement is not relevant. Otherwise, we analyze both
++     statements.  */
++
++  pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info);
+   if (!STMT_VINFO_RELEVANT_P (stmt_info)
+       && !STMT_VINFO_LIVE_P (stmt_info))
+     {
+-      gimple pattern_stmt = STMT_VINFO_RELATED_STMT (stmt_info);
+       if (STMT_VINFO_IN_PATTERN_P (stmt_info)
++          && pattern_stmt
+           && (STMT_VINFO_RELEVANT_P (vinfo_for_stmt (pattern_stmt))
+               || STMT_VINFO_LIVE_P (vinfo_for_stmt (pattern_stmt))))
+         {
++          /* Analyze PATTERN_STMT instead of the original stmt.  */
+           stmt = pattern_stmt;
+           stmt_info = vinfo_for_stmt (pattern_stmt);
+           if (vect_print_dump_info (REPORT_DETAILS))
+@@ -4933,6 +5000,21 @@
+           return true;
+         }
+     }
++  else if (STMT_VINFO_IN_PATTERN_P (stmt_info)
++           && pattern_stmt
++           && (STMT_VINFO_RELEVANT_P (vinfo_for_stmt (pattern_stmt))
++               || STMT_VINFO_LIVE_P (vinfo_for_stmt (pattern_stmt))))
++    {
++      /* Analyze PATTERN_STMT too.  */
++      if (vect_print_dump_info (REPORT_DETAILS))
++        {
++          fprintf (vect_dump, "==> examining pattern statement: ");
++          print_gimple_stmt (vect_dump, stmt, 0, TDF_SLIM);
++        }
++
++      if (!vect_analyze_stmt (pattern_stmt, need_to_vectorize, node))
++        return false;
++   }
+ 
+   switch (STMT_VINFO_DEF_TYPE (stmt_info))
+     {
+@@ -5066,7 +5148,6 @@
+   bool is_store = false;
+   gimple vec_stmt = NULL;
+   stmt_vec_info stmt_info = vinfo_for_stmt (stmt);
+-  gimple orig_stmt_in_pattern, orig_scalar_stmt = stmt;
+   bool done;
+ 
+   switch (STMT_VINFO_TYPE (stmt_info))
+@@ -5205,25 +5286,7 @@
+     }
+ 
+   if (vec_stmt)
+-    {
+-      STMT_VINFO_VEC_STMT (stmt_info) = vec_stmt;
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
+-	    {
+-	      gcc_assert (STMT_VINFO_RELATED_STMT (stmt_vinfo)
+-                           == orig_scalar_stmt);
+-	      STMT_VINFO_VEC_STMT (stmt_vinfo) = vec_stmt;
+-	    }
+-	}
+-    }
++    STMT_VINFO_VEC_STMT (stmt_info) = vec_stmt;
+ 
+   return is_store;
+ }
+@@ -5601,8 +5664,12 @@
+       || *dt == vect_nested_cycle)
+     {
+       stmt_vec_info stmt_info = vinfo_for_stmt (*def_stmt);
+-      if (STMT_VINFO_IN_PATTERN_P (stmt_info))
++
++      if (STMT_VINFO_IN_PATTERN_P (stmt_info) 
++          && !STMT_VINFO_RELEVANT (stmt_info)
++          && !STMT_VINFO_LIVE_P (stmt_info))
+ 	stmt_info = vinfo_for_stmt (STMT_VINFO_RELATED_STMT (stmt_info));
++
+       *vectype = STMT_VINFO_VECTYPE (stmt_info);
+       gcc_assert (*vectype != NULL_TREE);
+     }
+
+=== modified file 'gcc/tree-vectorizer.h'
+--- old/gcc/tree-vectorizer.h	2011-07-04 11:13:51 +0000
++++ new/gcc/tree-vectorizer.h	2011-07-11 11:02:55 +0000
+@@ -890,7 +890,7 @@
+ /* Pattern recognition functions.
+    Additional pattern recognition functions can (and will) be added
+    in the future.  */
+-typedef gimple (* vect_recog_func_ptr) (gimple *, tree *, tree *);
++typedef gimple (* vect_recog_func_ptr) (VEC (gimple, heap) **, tree *, tree *);
+ #define NUM_PATTERNS 4
+ void vect_pattern_recog (loop_vec_info);
+ 
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106770.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106770.patch
new file mode 100644
index 0000000..82ae3a1
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106770.patch
@@ -0,0 +1,138 @@
+2011-07-11  Revital Eres  <revital.eres@linaro.org>
+
+	Backport from mainline -r175090.
+	gcc/
+	* ddg.c (add_intra_loop_mem_dep): New function.
+	(build_intra_loop_deps): Call it.
+
+	gcc/testsuite
+	* gcc.dg/sms-9.c: New file.
+
+=== modified file 'gcc/ddg.c'
+--- old/gcc/ddg.c	2011-05-13 16:03:40 +0000
++++ new/gcc/ddg.c	2011-07-04 11:00:06 +0000
+@@ -390,6 +390,33 @@
+ 			 &PATTERN (insn2));
+ }
+ 
++/* Given two nodes, analyze their RTL insns and add intra-loop mem deps
++   to ddg G.  */
++static void
++add_intra_loop_mem_dep (ddg_ptr g, ddg_node_ptr from, ddg_node_ptr to)
++{
++
++  if ((from->cuid == to->cuid)
++      || !insns_may_alias_p (from->insn, to->insn))
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
+@@ -477,10 +504,22 @@
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
++++ new/gcc/testsuite/gcc.dg/sms-9.c	2011-07-04 11:00:06 +0000
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
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106771.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106771.patch
new file mode 100644
index 0000000..70c8638
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106771.patch
@@ -0,0 +1,211 @@
+2011-07-11  Revital Eres  <revital.eres@linaro.org>
+ 
+	Backport from mainline -r175091
+	gcc/
+	* modulo-sched.c (struct ps_insn): Remove row_rest_count
+	field.
+	(struct partial_schedule): Add rows_length field.
+	(verify_partial_schedule): Check rows_length.
+	(ps_insert_empty_row): Handle rows_length.
+	(create_partial_schedule): Likewise.
+	(free_partial_schedule): Likewise.
+	(reset_partial_schedule): Likewise.
+	(create_ps_insn): Remove rest_count argument.
+	(remove_node_from_ps): Update rows_length.
+	(add_node_to_ps): Update rows_length and call create_ps_insn without
+	passing row_rest_count.
+	(rotate_partial_schedule): Update rows_length.
+
+=== modified file 'gcc/modulo-sched.c'
+--- old/gcc/modulo-sched.c	2011-05-13 16:03:40 +0000
++++ new/gcc/modulo-sched.c	2011-07-04 12:01:34 +0000
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
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106772.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106772.patch
new file mode 100644
index 0000000..d918f9c
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106772.patch
@@ -0,0 +1,350 @@
+2011-07-11  Ramana Radhakrishnan  <ramana.radhakrishnan@linaro.org>
+
+	gcc/
+	2011-06-22  Dmitry Plotnikov  <dplotnikov@ispras.ru>
+	Dmitry Melnik  <dm@ispras.ru>
+
+	* config/arm/arm.c (neon_immediate_valid_for_shift): New function.
+	(neon_output_shift_immediate): Ditto.
+	* config/arm/arm-protos.h (neon_immediate_valid_for_shift): New
+	prototype.
+	(neon_output_shift_immediate): Ditto.
+	* config/arm/neon.md (vashl<mode>3): Modified constraint.
+	(vashr<mode>3_imm): New insn pattern.
+	(vlshr<mode>3_imm): Ditto.
+	(vashr<mode>3): Modified constraint.
+	(vlshr<mode>3): Ditto.
+	* config/arm/predicates.md (imm_for_neon_lshift_operand): New
+	predicate.
+	(imm_for_neon_rshift_operand): Ditto.
+	(imm_lshift_or_reg_neon): Ditto.
+	(imm_rshift_or_reg_neon): Ditto.
+
+	* optabs.c (init_optabs): Init optab codes for vashl, vashr, vlshr.
+
+=== modified file 'gcc/config/arm/arm-protos.h'
+--- old/gcc/config/arm/arm-protos.h	2011-06-14 16:00:30 +0000
++++ new/gcc/config/arm/arm-protos.h	2011-07-04 14:03:49 +0000
+@@ -64,8 +64,12 @@
+ extern int neon_immediate_valid_for_move (rtx, enum machine_mode, rtx *, int *);
+ extern int neon_immediate_valid_for_logic (rtx, enum machine_mode, int, rtx *,
+ 					   int *);
++extern int neon_immediate_valid_for_shift (rtx, enum machine_mode, rtx *,
++					   int *, bool);
+ extern char *neon_output_logic_immediate (const char *, rtx *,
+ 					  enum machine_mode, int, int);
++extern char *neon_output_shift_immediate (const char *, char, rtx *,
++					  enum machine_mode, int, bool);
+ extern void neon_pairwise_reduce (rtx, rtx, enum machine_mode,
+ 				  rtx (*) (rtx, rtx, rtx));
+ extern rtx neon_make_constant (rtx);
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-06-29 09:13:17 +0000
++++ new/gcc/config/arm/arm.c	2011-07-04 14:03:49 +0000
+@@ -8863,6 +8863,66 @@
+   return 1;
+ }
+ 
++/* Return TRUE if rtx OP is legal for use in a VSHR or VSHL instruction.  If
++   the immediate is valid, write a constant suitable for using as an operand
++   to VSHR/VSHL to *MODCONST and the corresponding element width to
++   *ELEMENTWIDTH. ISLEFTSHIFT is for determine left or right shift,
++   because they have different limitations.  */
++
++int
++neon_immediate_valid_for_shift (rtx op, enum machine_mode mode,
++				rtx *modconst, int *elementwidth,
++				bool isleftshift)
++{
++  unsigned int innersize = GET_MODE_SIZE (GET_MODE_INNER (mode));
++  unsigned int n_elts = CONST_VECTOR_NUNITS (op), i;
++  unsigned HOST_WIDE_INT last_elt = 0;
++  unsigned HOST_WIDE_INT maxshift;
++
++  /* Split vector constant out into a byte vector.  */
++  for (i = 0; i < n_elts; i++)
++    {
++      rtx el = CONST_VECTOR_ELT (op, i);
++      unsigned HOST_WIDE_INT elpart;
++
++      if (GET_CODE (el) == CONST_INT)
++        elpart = INTVAL (el);
++      else if (GET_CODE (el) == CONST_DOUBLE)
++        return 0;
++      else
++        gcc_unreachable ();
++
++      if (i != 0 && elpart != last_elt)
++        return 0;
++
++      last_elt = elpart;
++    }
++
++  /* Shift less than element size.  */
++  maxshift = innersize * 8;
++
++  if (isleftshift)
++    {
++      /* Left shift immediate value can be from 0 to <size>-1.  */
++      if (last_elt >= maxshift)
++        return 0;
++    }
++  else
++    {
++      /* Right shift immediate value can be from 1 to <size>.  */
++      if (last_elt == 0 || last_elt > maxshift)
++	return 0;
++    }
++
++  if (elementwidth)
++    *elementwidth = innersize * 8;
++
++  if (modconst)
++    *modconst = CONST_VECTOR_ELT (op, 0);
++
++  return 1;
++}
++
+ /* Return a string suitable for output of Neon immediate logic operation
+    MNEM.  */
+ 
+@@ -8885,6 +8945,28 @@
+   return templ;
+ }
+ 
++/* Return a string suitable for output of Neon immediate shift operation
++   (VSHR or VSHL) MNEM.  */
++
++char *
++neon_output_shift_immediate (const char *mnem, char sign, rtx *op2,
++			     enum machine_mode mode, int quad,
++			     bool isleftshift)
++{
++  int width, is_valid;
++  static char templ[40];
++
++  is_valid = neon_immediate_valid_for_shift (*op2, mode, op2, &width, isleftshift);
++  gcc_assert (is_valid != 0);
++
++  if (quad)
++    sprintf (templ, "%s.%c%d\t%%q0, %%q1, %%2", mnem, sign, width);
++  else
++    sprintf (templ, "%s.%c%d\t%%P0, %%P1, %%2", mnem, sign, width);
++
++  return templ;
++}
++
+ /* Output a sequence of pairwise operations to implement a reduction.
+    NOTE: We do "too much work" here, because pairwise operations work on two
+    registers-worth of operands in one go. Unfortunately we can't exploit those
+
+=== modified file 'gcc/config/arm/neon.md'
+--- old/gcc/config/arm/neon.md	2011-07-01 09:19:21 +0000
++++ new/gcc/config/arm/neon.md	2011-07-04 14:03:49 +0000
+@@ -956,15 +956,57 @@
+ ; SImode elements.
+ 
+ (define_insn "vashl<mode>3"
+-  [(set (match_operand:VDQIW 0 "s_register_operand" "=w")
+-	(ashift:VDQIW (match_operand:VDQIW 1 "s_register_operand" "w")
+-		      (match_operand:VDQIW 2 "s_register_operand" "w")))]
+-  "TARGET_NEON"
+-  "vshl.<V_s_elem>\t%<V_reg>0, %<V_reg>1, %<V_reg>2"
+-  [(set (attr "neon_type")
+-      (if_then_else (ne (symbol_ref "<Is_d_reg>") (const_int 0))
+-                    (const_string "neon_vshl_ddd")
+-                    (const_string "neon_shift_3")))]
++  [(set (match_operand:VDQIW 0 "s_register_operand" "=w,w")
++	(ashift:VDQIW (match_operand:VDQIW 1 "s_register_operand" "w,w")
++		      (match_operand:VDQIW 2 "imm_lshift_or_reg_neon" "w,Dn")))]
++  "TARGET_NEON"
++  {
++    switch (which_alternative)
++      {
++        case 0: return "vshl.<V_s_elem>\t%<V_reg>0, %<V_reg>1, %<V_reg>2";
++        case 1: return neon_output_shift_immediate ("vshl", 'i', &operands[2],
++                         			    <MODE>mode,
++						    VALID_NEON_QREG_MODE (<MODE>mode),
++						    true);
++        default: gcc_unreachable ();
++      }
++  }
++  [(set (attr "neon_type")
++      (if_then_else (ne (symbol_ref "<Is_d_reg>") (const_int 0))
++                    (const_string "neon_vshl_ddd")
++                    (const_string "neon_shift_3")))]
++)
++
++(define_insn "vashr<mode>3_imm"
++  [(set (match_operand:VDQIW 0 "s_register_operand" "=w")
++	(ashiftrt:VDQIW (match_operand:VDQIW 1 "s_register_operand" "w")
++			(match_operand:VDQIW 2 "imm_for_neon_rshift_operand" "Dn")))]
++  "TARGET_NEON"
++  {
++    return neon_output_shift_immediate ("vshr", 's', &operands[2],
++					<MODE>mode, VALID_NEON_QREG_MODE (<MODE>mode),
++					false);
++  }
++  [(set (attr "neon_type")
++      (if_then_else (ne (symbol_ref "<Is_d_reg>") (const_int 0))
++                    (const_string "neon_vshl_ddd")
++                    (const_string "neon_shift_3")))]
++)
++
++(define_insn "vlshr<mode>3_imm"
++  [(set (match_operand:VDQIW 0 "s_register_operand" "=w")
++	(lshiftrt:VDQIW (match_operand:VDQIW 1 "s_register_operand" "w")
++			(match_operand:VDQIW 2 "imm_for_neon_rshift_operand" "Dn")))]
++  "TARGET_NEON"
++  {
++    return neon_output_shift_immediate ("vshr", 'u', &operands[2],
++					<MODE>mode, VALID_NEON_QREG_MODE (<MODE>mode),
++					false);
++  }              
++  [(set (attr "neon_type")
++	(if_then_else (ne (symbol_ref "<Is_d_reg>") (const_int 0))
++		      (const_string "neon_vshl_ddd")
++		      (const_string "neon_shift_3")))]
+ )
+ 
+ ; Used for implementing logical shift-right, which is a left-shift by a negative
+@@ -1004,28 +1046,34 @@
+ (define_expand "vashr<mode>3"
+   [(set (match_operand:VDQIW 0 "s_register_operand" "")
+ 	(ashiftrt:VDQIW (match_operand:VDQIW 1 "s_register_operand" "")
+-			(match_operand:VDQIW 2 "s_register_operand" "")))]
++			(match_operand:VDQIW 2 "imm_rshift_or_reg_neon" "")))]
+   "TARGET_NEON"
+ {
+   rtx neg = gen_reg_rtx (<MODE>mode);
+-
+-  emit_insn (gen_neg<mode>2 (neg, operands[2]));
+-  emit_insn (gen_ashl<mode>3_signed (operands[0], operands[1], neg));
+-
++  if (REG_P (operands[2]))
++    {
++      emit_insn (gen_neg<mode>2 (neg, operands[2]));
++      emit_insn (gen_ashl<mode>3_signed (operands[0], operands[1], neg));
++    }
++  else
++    emit_insn (gen_vashr<mode>3_imm (operands[0], operands[1], operands[2]));
+   DONE;
+ })
+ 
+ (define_expand "vlshr<mode>3"
+   [(set (match_operand:VDQIW 0 "s_register_operand" "")
+ 	(lshiftrt:VDQIW (match_operand:VDQIW 1 "s_register_operand" "")
+-			(match_operand:VDQIW 2 "s_register_operand" "")))]
++			(match_operand:VDQIW 2 "imm_rshift_or_reg_neon" "")))]
+   "TARGET_NEON"
+ {
+   rtx neg = gen_reg_rtx (<MODE>mode);
+-
+-  emit_insn (gen_neg<mode>2 (neg, operands[2]));
+-  emit_insn (gen_ashl<mode>3_unsigned (operands[0], operands[1], neg));
+-
++  if (REG_P (operands[2]))
++    {
++      emit_insn (gen_neg<mode>2 (neg, operands[2]));
++      emit_insn (gen_ashl<mode>3_unsigned (operands[0], operands[1], neg));
++    }
++  else
++    emit_insn (gen_vlshr<mode>3_imm (operands[0], operands[1], operands[2]));
+   DONE;
+ })
+ 
+
+=== modified file 'gcc/config/arm/predicates.md'
+--- old/gcc/config/arm/predicates.md	2011-06-22 15:50:23 +0000
++++ new/gcc/config/arm/predicates.md	2011-07-04 14:03:49 +0000
+@@ -585,6 +585,26 @@
+   return neon_immediate_valid_for_move (op, mode, NULL, NULL);
+ })
+ 
++(define_predicate "imm_for_neon_lshift_operand"
++  (match_code "const_vector")
++{
++  return neon_immediate_valid_for_shift (op, mode, NULL, NULL, true);
++})
++
++(define_predicate "imm_for_neon_rshift_operand"
++  (match_code "const_vector")
++{
++  return neon_immediate_valid_for_shift (op, mode, NULL, NULL, false);
++})
++
++(define_predicate "imm_lshift_or_reg_neon"
++  (ior (match_operand 0 "s_register_operand")
++       (match_operand 0 "imm_for_neon_lshift_operand")))
++
++(define_predicate "imm_rshift_or_reg_neon"
++  (ior (match_operand 0 "s_register_operand")
++       (match_operand 0 "imm_for_neon_rshift_operand")))
++
+ (define_predicate "imm_for_neon_logic_operand"
+   (match_code "const_vector")
+ {
+
+=== modified file 'gcc/optabs.c'
+--- old/gcc/optabs.c	2011-03-04 10:27:10 +0000
++++ new/gcc/optabs.c	2011-07-04 14:03:49 +0000
+@@ -6171,6 +6171,9 @@
+   init_optab (usashl_optab, US_ASHIFT);
+   init_optab (ashr_optab, ASHIFTRT);
+   init_optab (lshr_optab, LSHIFTRT);
++  init_optabv (vashl_optab, ASHIFT);
++  init_optabv (vashr_optab, ASHIFTRT);
++  init_optabv (vlshr_optab, LSHIFTRT);
+   init_optab (rotl_optab, ROTATE);
+   init_optab (rotr_optab, ROTATERT);
+   init_optab (smin_optab, SMIN);
+
+=== added file 'gcc/testsuite/gcc.target/arm/neon-vlshr-imm-1.c'
+--- old/gcc/testsuite/gcc.target/arm/neon-vlshr-imm-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon-vlshr-imm-1.c	2011-07-04 14:03:49 +0000
+@@ -0,0 +1,11 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-options "-O2 -mfpu=neon -mfloat-abi=softfp -ftree-vectorize" } */
++/* { dg-final { scan-assembler "vshr\.u32.*#3" } } */
++
++/* Verify that VSHR immediate is used.  */
++void f1(int n, unsigned int x[], unsigned int y[]) {
++  int i;
++  for (i = 0; i < n; ++i)
++    y[i] = x[i] >> 3;
++}
+
+=== added file 'gcc/testsuite/gcc.target/arm/neon-vshl-imm-1.c'
+--- old/gcc/testsuite/gcc.target/arm/neon-vshl-imm-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon-vshl-imm-1.c	2011-07-04 14:03:49 +0000
+@@ -0,0 +1,11 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-options "-O2 -mfpu=neon -mfloat-abi=softfp -ftree-vectorize" } */
++/* { dg-final { scan-assembler "vshl\.i32.*#3" } } */
++
++/* Verify that VSHR immediate is used.  */
++void f1(int n, int x[], int y[]) {
++  int i;
++  for (i = 0; i < n; ++i)
++    y[i] = x[i] << 3;
++}
+
+=== added file 'gcc/testsuite/gcc.target/arm/neon-vshr-imm-1.c'
+--- old/gcc/testsuite/gcc.target/arm/neon-vshr-imm-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon-vshr-imm-1.c	2011-07-04 14:03:49 +0000
+@@ -0,0 +1,11 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-options "-O2 -mfpu=neon -mfloat-abi=softfp -ftree-vectorize" } */
++/* { dg-final { scan-assembler "vshr\.s32.*#3" } } */
++
++/* Verify that VSHR immediate is used.  */
++void f1(int n, int x[], int y[]) {
++  int i;
++  for (i = 0; i < n; ++i)
++    y[i] = x[i] >> 3;
++}
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106773.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106773.patch
new file mode 100644
index 0000000..de3f29e
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106773.patch
@@ -0,0 +1,119 @@
+2011-07-13  Richard Sandiford  <richard.sandiford@linaro.org>
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
+--- old/gcc/reload1.c	2011-07-01 09:19:21 +0000
++++ new/gcc/reload1.c	2011-07-11 10:06:50 +0000
+@@ -6451,6 +6451,8 @@
+ 
+ 	      if (regno >= 0
+ 		  && reg_last_reload_reg[regno] != 0
++		  && (GET_MODE_SIZE (GET_MODE (reg_last_reload_reg[regno]))
++		      >= GET_MODE_SIZE (mode) + byte)
+ #ifdef CANNOT_CHANGE_MODE_CLASS
+ 		  /* Verify that the register it's in can be used in
+ 		     mode MODE.  */
+@@ -6462,24 +6464,12 @@
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
++++ new/gcc/testsuite/gcc.target/arm/neon-modes-3.c	2011-07-11 10:06:50 +0000
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
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106775.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106775.patch
new file mode 100644
index 0000000..0b05c38
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106775.patch
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
+--- old/gcc/ifcvt.c	2010-12-14 00:23:40 +0000
++++ new/gcc/ifcvt.c	2011-07-11 04:02:28 +0000
+@@ -1,5 +1,6 @@
+ /* If-conversion support.
+-   Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2010
++   Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2010,
++   2011
+    Free Software Foundation, Inc.
+ 
+    This file is part of GCC.
+@@ -304,6 +305,10 @@
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
++++ new/gcc/testsuite/gcc.c-torture/compile/20110401-1.c	2011-07-11 04:02:28 +0000
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
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106776.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106776.patch
new file mode 100644
index 0000000..3d4d5c5
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106776.patch
@@ -0,0 +1,46 @@
+2011-07-15  Michael Hope  <michael.hope@linaro.org>
+
+	gcc/
+	Backport from mainline:
+	2011-03-22  Eric Botcazou  <ebotcazou@adacore.com>
+
+	* combine.c (simplify_set): Try harder to find the best CC mode when
+	simplifying a nested COMPARE on the RHS.
+
+=== modified file 'gcc/combine.c'
+--- old/gcc/combine.c	2011-05-27 14:31:18 +0000
++++ new/gcc/combine.c	2011-07-11 03:52:31 +0000
+@@ -6287,10 +6287,18 @@
+       enum rtx_code new_code;
+       rtx op0, op1, tmp;
+       int other_changed = 0;
++      rtx inner_compare = NULL_RTX;
+       enum machine_mode compare_mode = GET_MODE (dest);
+ 
+       if (GET_CODE (src) == COMPARE)
+-	op0 = XEXP (src, 0), op1 = XEXP (src, 1);
++	{
++	  op0 = XEXP (src, 0), op1 = XEXP (src, 1);
++	  if (GET_CODE (op0) == COMPARE && op1 == const0_rtx)
++	    {
++	      inner_compare = op0;
++	      op0 = XEXP (inner_compare, 0), op1 = XEXP (inner_compare, 1);
++	    }
++	}
+       else
+ 	op0 = src, op1 = CONST0_RTX (GET_MODE (src));
+ 
+@@ -6332,6 +6340,12 @@
+ 	 need to use a different CC mode here.  */
+       if (GET_MODE_CLASS (GET_MODE (op0)) == MODE_CC)
+ 	compare_mode = GET_MODE (op0);
++      else if (inner_compare
++	       && GET_MODE_CLASS (GET_MODE (inner_compare)) == MODE_CC
++	       && new_code == old_code
++	       && op0 == XEXP (inner_compare, 0)
++	       && op1 == XEXP (inner_compare, 1))
++	compare_mode = GET_MODE (inner_compare);
+       else
+ 	compare_mode = SELECT_CC_MODE (new_code, op0, op1);
+ 
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106777.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106777.patch
new file mode 100644
index 0000000..68b682b
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106777.patch
@@ -0,0 +1,192 @@
+2011-07-15  Michael Hope  <michael.hope@linaro.org>
+
+	gcc/
+	Backport from mainline:
+	2011-06-29  Nathan Sidwell  <nathan@codesourcery.com>
+
+	* config/arm/unwind-arm.c (enum __cxa_type_match_result): New.
+	(cxa_type_match): Correct declaration.
+	(__gnu_unwind_pr_common): Reconstruct
+	additional indirection when __cxa_type_match returns
+	succeeded_with_ptr_to_base.
+
+	libstdc++-v3/
+	Backport from mainline:
+
+	2011-06-29  Nathan Sidwell  <nathan@codesourcery.com>
+
+	* libsupc++/eh_arm.c (__cxa_type_match): Construct address of
+	thrown object here.  Return succeded_with_ptr_to_base for all
+	pointer cases.
+
+=== modified file 'gcc/config/arm/unwind-arm.c'
+--- old/gcc/config/arm/unwind-arm.c	2011-03-22 10:59:10 +0000
++++ new/gcc/config/arm/unwind-arm.c	2011-07-11 03:35:44 +0000
+@@ -32,13 +32,18 @@
+ typedef unsigned char bool;
+ 
+ typedef struct _ZSt9type_info type_info; /* This names C++ type_info type */
++enum __cxa_type_match_result
++  {
++    ctm_failed = 0,
++    ctm_succeeded = 1,
++    ctm_succeeded_with_ptr_to_base = 2
++  };
+ 
+ void __attribute__((weak)) __cxa_call_unexpected(_Unwind_Control_Block *ucbp);
+ bool __attribute__((weak)) __cxa_begin_cleanup(_Unwind_Control_Block *ucbp);
+-bool __attribute__((weak)) __cxa_type_match(_Unwind_Control_Block *ucbp,
+-					    const type_info *rttip,
+-					    bool is_reference,
+-					    void **matched_object);
++enum __cxa_type_match_result __attribute__((weak)) __cxa_type_match
++  (_Unwind_Control_Block *ucbp, const type_info *rttip,
++   bool is_reference, void **matched_object);
+ 
+ _Unwind_Ptr __attribute__((weak))
+ __gnu_Unwind_Find_exidx (_Unwind_Ptr, int *);
+@@ -1107,6 +1112,7 @@
+ 		      _uw rtti;
+ 		      bool is_reference = (data[0] & uint32_highbit) != 0;
+ 		      void *matched;
++		      enum __cxa_type_match_result match_type;
+ 
+ 		      /* Check for no-throw areas.  */
+ 		      if (data[1] == (_uw) -2)
+@@ -1118,17 +1124,31 @@
+ 			{
+ 			  /* Match a catch specification.  */
+ 			  rtti = _Unwind_decode_target2 ((_uw) &data[1]);
+-			  if (!__cxa_type_match (ucbp, (type_info *) rtti,
+-						 is_reference,
+-						 &matched))
+-			    matched = (void *)0;
++			  match_type = __cxa_type_match (ucbp,
++							 (type_info *) rtti,
++							 is_reference,
++							 &matched);
+ 			}
++		      else
++			match_type = ctm_succeeded;
+ 
+-		      if (matched)
++		      if (match_type)
+ 			{
+ 			  ucbp->barrier_cache.sp =
+ 			    _Unwind_GetGR (context, R_SP);
+-			  ucbp->barrier_cache.bitpattern[0] = (_uw) matched;
++			  // ctm_succeeded_with_ptr_to_base really
++			  // means _c_t_m indirected the pointer
++			  // object.  We have to reconstruct the
++			  // additional pointer layer by using a temporary.
++			  if (match_type == ctm_succeeded_with_ptr_to_base)
++			    {
++			      ucbp->barrier_cache.bitpattern[2]
++				= (_uw) matched;
++			      ucbp->barrier_cache.bitpattern[0]
++				= (_uw) &ucbp->barrier_cache.bitpattern[2];
++			    }
++			  else
++			    ucbp->barrier_cache.bitpattern[0] = (_uw) matched;
+ 			  ucbp->barrier_cache.bitpattern[1] = (_uw) data;
+ 			  return _URC_HANDLER_FOUND;
+ 			}
+
+=== modified file 'libstdc++-v3/libsupc++/eh_arm.cc'
+--- old/libstdc++-v3/libsupc++/eh_arm.cc	2011-01-03 20:52:22 +0000
++++ new/libstdc++-v3/libsupc++/eh_arm.cc	2011-07-11 03:35:44 +0000
+@@ -30,10 +30,11 @@
+ using namespace __cxxabiv1;
+ 
+ 
+-// Given the thrown type THROW_TYPE, pointer to a variable containing a
+-// pointer to the exception object THROWN_PTR_P and a type CATCH_TYPE to
+-// compare against, return whether or not there is a match and if so,
+-// update *THROWN_PTR_P.
++// Given the thrown type THROW_TYPE, exception object UE_HEADER and a
++// type CATCH_TYPE to compare against, return whether or not there is
++// a match and if so, update *THROWN_PTR_P to point to either the
++// type-matched object, or in the case of a pointer type, the object
++// pointed to by the pointer.
+ 
+ extern "C" __cxa_type_match_result
+ __cxa_type_match(_Unwind_Exception* ue_header,
+@@ -41,51 +42,51 @@
+ 		 bool is_reference __attribute__((__unused__)),
+ 		 void** thrown_ptr_p)
+ {
+-  bool forced_unwind = __is_gxx_forced_unwind_class(ue_header->exception_class);
+-  bool foreign_exception = !forced_unwind && !__is_gxx_exception_class(ue_header->exception_class);
+-  bool dependent_exception =
+-    __is_dependent_exception(ue_header->exception_class);
++  bool forced_unwind
++    = __is_gxx_forced_unwind_class(ue_header->exception_class);
++  bool foreign_exception
++    = !forced_unwind && !__is_gxx_exception_class(ue_header->exception_class);
++  bool dependent_exception
++    = __is_dependent_exception(ue_header->exception_class);
+   __cxa_exception* xh = __get_exception_header_from_ue(ue_header);
+   __cxa_dependent_exception *dx = __get_dependent_exception_from_ue(ue_header);
+   const std::type_info* throw_type;
++  void *thrown_ptr = 0;
+ 
+   if (forced_unwind)
+     throw_type = &typeid(abi::__forced_unwind);
+   else if (foreign_exception)
+     throw_type = &typeid(abi::__foreign_exception);
+-  else if (dependent_exception)
+-    throw_type = __get_exception_header_from_obj
+-      (dx->primaryException)->exceptionType;
+   else
+-    throw_type = xh->exceptionType;
+-
+-  void* thrown_ptr = *thrown_ptr_p;
++    {
++      if (dependent_exception)
++	xh = __get_exception_header_from_obj (dx->primaryException);
++      throw_type = xh->exceptionType;
++      // We used to require the caller set the target of thrown_ptr_p,
++      // but that's incorrect -- the EHABI makes no such requirement
++      // -- and not all callers will set it.  Fortunately callers that
++      // do initialize will always pass us the value we calculate
++      // here, so there's no backwards compatibility problem.
++      thrown_ptr = __get_object_from_ue (ue_header);
++    }
++  
++  __cxa_type_match_result result = ctm_succeeded;
+ 
+   // Pointer types need to adjust the actual pointer, not
+   // the pointer to pointer that is the exception object.
+   // This also has the effect of passing pointer types
+   // "by value" through the __cxa_begin_catch return value.
+   if (throw_type->__is_pointer_p())
+-    thrown_ptr = *(void**) thrown_ptr;
++    {
++      thrown_ptr = *(void**) thrown_ptr;
++      // We need to indicate the indirection to our caller.
++      result = ctm_succeeded_with_ptr_to_base;
++    }
+ 
+   if (catch_type->__do_catch(throw_type, &thrown_ptr, 1))
+     {
+       *thrown_ptr_p = thrown_ptr;
+-
+-      if (typeid(*catch_type) == typeid (typeid(void*)))
+-	{
+-	  const __pointer_type_info *catch_pointer_type =
+-	    static_cast<const __pointer_type_info *> (catch_type);
+-	  const __pointer_type_info *throw_pointer_type =
+-	    static_cast<const __pointer_type_info *> (throw_type);
+-
+-	  if (typeid (*catch_pointer_type->__pointee) != typeid (void)
+-	      && (*catch_pointer_type->__pointee != 
+-		  *throw_pointer_type->__pointee))
+-	    return ctm_succeeded_with_ptr_to_base;
+-	}
+-
+-      return ctm_succeeded;
++      return result;
+     }
+ 
+   return ctm_failed;
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106778.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106778.patch
new file mode 100644
index 0000000..b42b425
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106778.patch
@@ -0,0 +1,225 @@
+2011-07-15  Michael Hope  <michael.hope@linaro.org>
+
+	Backport from mainline r174540
+	LP: #807573
+
+	gcc/
+	2011-06-01  Richard Sandiford  <rdsandiford@googlemail.com>
+
+	PR rtl-optimization/48830
+	PR rtl-optimization/48808
+	PR rtl-optimization/48792
+	* reload.c (push_reload): Check contains_reg_of_mode.
+	* reload1.c (strip_paradoxical_subreg): New function.
+	(gen_reload_chain_without_interm_reg_p): Use it to handle
+	paradoxical subregs.
+	(emit_output_reload_insns, gen_reload): Likewise.
+
+	gcc/testsuite/
+	2011-06-01  Eric Botcazou  <ebotcazou@adacore.com>
+		    Hans-Peter Nilsson  <hp@axis.com>
+
+	PR rtl-optimization/48830
+	* gcc.target/sparc/ultrasp12.c: New test.
+
+=== modified file 'gcc/reload.c'
+--- old/gcc/reload.c	2011-07-01 09:19:21 +0000
++++ new/gcc/reload.c	2011-07-13 02:09:08 +0000
+@@ -1017,6 +1017,7 @@
+ #ifdef CANNOT_CHANGE_MODE_CLASS
+       && !CANNOT_CHANGE_MODE_CLASS (GET_MODE (SUBREG_REG (in)), inmode, rclass)
+ #endif
++      && contains_reg_of_mode[(int) rclass][(int) GET_MODE (SUBREG_REG (in))]
+       && (CONSTANT_P (SUBREG_REG (in))
+ 	  || GET_CODE (SUBREG_REG (in)) == PLUS
+ 	  || strict_low
+@@ -1123,6 +1124,7 @@
+ #ifdef CANNOT_CHANGE_MODE_CLASS
+       && !CANNOT_CHANGE_MODE_CLASS (GET_MODE (SUBREG_REG (out)), outmode, rclass)
+ #endif
++      && contains_reg_of_mode[(int) rclass][(int) GET_MODE (SUBREG_REG (out))]
+       && (CONSTANT_P (SUBREG_REG (out))
+ 	  || strict_low
+ 	  || (((REG_P (SUBREG_REG (out))
+
+=== modified file 'gcc/reload1.c'
+--- old/gcc/reload1.c	2011-07-11 10:06:50 +0000
++++ new/gcc/reload1.c	2011-07-14 22:14:45 +0000
+@@ -4476,6 +4476,43 @@
+ 	}
+     }
+ }
++
++/* *OP_PTR and *OTHER_PTR are two operands to a conceptual reload.
++   If *OP_PTR is a paradoxical subreg, try to remove that subreg
++   and apply the corresponding narrowing subreg to *OTHER_PTR.
++   Return true if the operands were changed, false otherwise.  */
++
++static bool
++strip_paradoxical_subreg (rtx *op_ptr, rtx *other_ptr)
++{
++  rtx op, inner, other, tem;
++
++  op = *op_ptr;
++  if (GET_CODE (op) != SUBREG)
++    return false;
++
++  inner = SUBREG_REG (op);
++  if (GET_MODE_SIZE (GET_MODE (op)) <= GET_MODE_SIZE (GET_MODE (inner)))
++    return false;
++
++  other = *other_ptr;
++  tem = gen_lowpart_common (GET_MODE (inner), other);
++  if (!tem)
++    return false;
++
++  /* If the lowpart operation turned a hard register into a subreg,
++     rather than simplifying it to another hard register, then the
++     mode change cannot be properly represented.  For example, OTHER
++     might be valid in its current mode, but not in the new one.  */
++  if (GET_CODE (tem) == SUBREG
++      && REG_P (other)
++      && HARD_REGISTER_P (other))
++    return false;
++
++  *op_ptr = inner;
++  *other_ptr = tem;
++  return true;
++}
+ 
+ /* A subroutine of reload_as_needed.  If INSN has a REG_EH_REGION note,
+    examine all of the reload insns between PREV and NEXT exclusive, and
+@@ -5556,7 +5593,7 @@
+      chain reloads or do need an intermediate hard registers.  */
+   bool result = true;
+   int regno, n, code;
+-  rtx out, in, tem, insn;
++  rtx out, in, insn;
+   rtx last = get_last_insn ();
+ 
+   /* Make r2 a component of r1.  */
+@@ -5575,11 +5612,7 @@
+ 
+   /* If IN is a paradoxical SUBREG, remove it and try to put the
+      opposite SUBREG on OUT.  Likewise for a paradoxical SUBREG on OUT.  */
+-  if (GET_CODE (in) == SUBREG
+-      && (GET_MODE_SIZE (GET_MODE (in))
+-	  > GET_MODE_SIZE (GET_MODE (SUBREG_REG (in))))
+-      && (tem = gen_lowpart_common (GET_MODE (SUBREG_REG (in)), out)) != 0)
+-    in = SUBREG_REG (in), out = tem;
++  strip_paradoxical_subreg (&in, &out);
+ 
+   if (GET_CODE (in) == PLUS
+       && (REG_P (XEXP (in, 0))
+@@ -7571,7 +7604,6 @@
+ 	      if (tertiary_icode != CODE_FOR_nothing)
+ 		{
+ 		  rtx third_reloadreg = rld[tertiary_reload].reg_rtx;
+-		  rtx tem;
+ 
+ 		  /* Copy primary reload reg to secondary reload reg.
+ 		     (Note that these have been swapped above, then
+@@ -7580,13 +7612,7 @@
+ 		  /* If REAL_OLD is a paradoxical SUBREG, remove it
+ 		     and try to put the opposite SUBREG on
+ 		     RELOADREG.  */
+-		  if (GET_CODE (real_old) == SUBREG
+-		      && (GET_MODE_SIZE (GET_MODE (real_old))
+-			  > GET_MODE_SIZE (GET_MODE (SUBREG_REG (real_old))))
+-		      && 0 != (tem = gen_lowpart_common
+-			       (GET_MODE (SUBREG_REG (real_old)),
+-				reloadreg)))
+-		    real_old = SUBREG_REG (real_old), reloadreg = tem;
++		  strip_paradoxical_subreg (&real_old, &reloadreg);
+ 
+ 		  gen_reload (reloadreg, second_reloadreg,
+ 			      rl->opnum, rl->when_needed);
+@@ -8402,16 +8428,8 @@
+ 
+   /* If IN is a paradoxical SUBREG, remove it and try to put the
+      opposite SUBREG on OUT.  Likewise for a paradoxical SUBREG on OUT.  */
+-  if (GET_CODE (in) == SUBREG
+-      && (GET_MODE_SIZE (GET_MODE (in))
+-	  > GET_MODE_SIZE (GET_MODE (SUBREG_REG (in))))
+-      && (tem = gen_lowpart_common (GET_MODE (SUBREG_REG (in)), out)) != 0)
+-    in = SUBREG_REG (in), out = tem;
+-  else if (GET_CODE (out) == SUBREG
+-	   && (GET_MODE_SIZE (GET_MODE (out))
+-	       > GET_MODE_SIZE (GET_MODE (SUBREG_REG (out))))
+-	   && (tem = gen_lowpart_common (GET_MODE (SUBREG_REG (out)), in)) != 0)
+-    out = SUBREG_REG (out), in = tem;
++  if (!strip_paradoxical_subreg (&in, &out))
++    strip_paradoxical_subreg (&out, &in);
+ 
+   /* How to do this reload can get quite tricky.  Normally, we are being
+      asked to reload a simple operand, such as a MEM, a constant, or a pseudo
+
+=== added file 'gcc/testsuite/gcc.target/sparc/ultrasp12.c'
+--- old/gcc/testsuite/gcc.target/sparc/ultrasp12.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/sparc/ultrasp12.c	2011-07-13 02:09:08 +0000
+@@ -0,0 +1,64 @@
++/* PR rtl-optimization/48830 */
++/* Testcase by Hans-Peter Nilsson <hp@gcc.gnu.org> */
++
++/* { dg-do compile } */
++/* { dg-require-effective-target lp64 } */
++/* { dg-options "-O2 -mcpu=ultrasparc -mvis" } */
++
++typedef unsigned char uint8_t;
++typedef unsigned int uint32_t;
++typedef unsigned long int uint64_t;
++typedef unsigned long int uintmax_t;
++typedef unsigned char rc_vec_t __attribute__((__vector_size__(8)));
++typedef short rc_svec_type_ __attribute__((__vector_size__(8)));
++typedef unsigned char rc_vec4_type_ __attribute__((__vector_size__(4)));
++
++void
++rc_stat_xsum_acc(const uint8_t *__restrict src1, int src1_dim,
++                 const uint8_t *__restrict src2, int src2_dim,
++                 int len, int height, uintmax_t sum[5])
++{
++    uint32_t s1 = 0;
++    uint32_t s2 = 0;
++    uintmax_t s11 = 0;
++    uintmax_t s22 = 0;
++    uintmax_t s12 = 0;
++    int full = len / ((1024) < (1024) ? (1024) : (1024));
++    int rem = len % ((1024) < (1024) ? (1024) : (1024));
++    int rem1 = rem / 1;
++    int y;
++    unsigned int rc_gsr_scale_ __attribute__ ((__unused__)) = 7; unsigned int rc_gsr_align_ __attribute__ ((__unused__)) = 4; unsigned int rc_gsr_set_ __attribute__ ((__unused__)) = 0; register unsigned int rc_gsr_fakedep_ __attribute__ ((__unused__)) = 0; unsigned int rc_gsr_ldinit_ __attribute__ ((__unused__)) = 0;
++    for (y = 0; y < height; y++) {
++        rc_vec_t a1, a2, a11, a22, a12;
++        int i1 = (y)*(src1_dim);
++        int i2 = (y)*(src2_dim);
++        int x;
++        ((a1) = ((rc_vec_t) {0}));
++        ((a2) = ((rc_vec_t) {0}));
++        ((a11) = ((rc_vec_t) {0}));
++        ((a22) = ((rc_vec_t) {0}));
++        ((a12) = ((rc_vec_t) {0}));
++        for (x = 0; x < full; x++) {
++            int k;
++            for (k = 0; k < ((1024) < (1024) ? (1024) : (1024)) /
++                            1; k++)
++            {
++                do { rc_vec_t v1, v2; ((v1) = *(const rc_vec_t*)(&(src1)[i1])); ((v2) = *(const rc_vec_t*)(&(src2)[i2])); ((a1) = (((union { rc_vec_t v; uint64_t i; })(uint64_t)(__builtin_vis_pdist (v1, ((rc_vec_t) {0}), (((union { rc_vec_t v; uint64_t i; })(uint64_t)(a1)).i)))).v)); ((a2) = (((union { rc_vec_t v; uint64_t i; })(uint64_t)(__builtin_vis_pdist (v2, ((rc_vec_t) {0}), (((union { rc_vec_t v; uint64_t i; })(uint64_t)(a2)).i)))).v)); do { rc_vec_t s1_ = (v1); rc_vec_t s2_ = (v1); rc_vec_t accvin_ = (a11); rc_vec_t s1lo7_, s1msb_, accvout_; uint32_t maclo_, machi_; rc_svec_type_ masklow_ = (rc_svec_type_){(255), (255), (255), (255)}; rc_svec_type_ s1msbhi_, s1msblo_, s1lo7hi_, s1lo7lo_; rc_svec_type_ s1msbdiv2hi_, s1msbdiv2lo_; rc_vec4_type_ s1lo7hi4_, s1lo7lo4_, s1msbhi4_, s1msblo4_; rc_vec4_type_ s1msbdiv2hi4_, s1msbdiv2lo4_, s2hi4_, s2lo4_; rc_vec4_type_ accvhi4_, accvlo4_; rc_svec_type_ mulhilo7_, mullolo7_, mulhimsbdiv2_, mullomsbdiv2_; rc_svec_type_ mulhi_, mullo_, mulhihi_, mullohi_; rc_svec_type_ mulhilo_, mullolo_; rc_vec4_type_ zero4_ = (((union { rc_vec4_type_ v; uint64_t i; })(uint64_t)(0)).v); rc_vec_t msb_ = (rc_vec_t){(0x80), (0x80), (0x80), (0x80), (0x80), (0x80), (0x80), (0x80)}; ((s1msb_) = (s1_) & (msb_)); ((s1lo7_) = (s1_) & (~msb_)); do { if (rc_gsr_ldinit_) { extern void rc_mixing_GSR_setting_with_RC_VEC_LDINIT_(void); rc_mixing_GSR_setting_with_RC_VEC_LDINIT_(); } if (!__builtin_constant_p(rc_gsr_align_) || !__builtin_constant_p(2) || !rc_gsr_set_ || (unsigned) (rc_gsr_align_) != rc_gsr_align_ || (unsigned) (2) != rc_gsr_scale_) { rc_gsr_set_ = 1; rc_gsr_align_ = (rc_gsr_align_); rc_gsr_scale_ = (2); unsigned int val_ = (rc_gsr_scale_ << 3) | rc_gsr_align_; if (__builtin_constant_p (val_)) { __asm__("wr %%g0,%[gsrval],%%gsr\n" ";# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_), [fakegsr] "=rm" (rc_gsr_fakedep_) : "0" (s1msb_), [gsrval] "i" (val_), "1" (rc_gsr_fakedep_)); } else { __asm__("wr %[gsrval],0,%%gsr" "\n;# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_), [fakegsr] "=rm" (rc_gsr_fakedep_) : "0" (s1msb_), [gsrval] "r" (val_), "1" (rc_gsr_fakedep_)); } } else { __asm__("\n;# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_) : "0" (s1msb_), [fakegsr] "g" (rc_gsr_fakedep_)); } } while (0); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s1msb_); (s1msbhi4_) = hl_.hilo_.hi_; (s1msblo4_) = hl_.hilo_.lo_; } while (0); s1msbhi_ = __builtin_vis_fexpand(s1msbhi4_); s1msblo_ = __builtin_vis_fexpand(s1msblo4_); s1msbdiv2hi4_ = __builtin_vis_fpack16(s1msbhi_); s1msbdiv2lo4_ = __builtin_vis_fpack16(s1msblo_); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s2_); (s2hi4_) = hl_.hilo_.hi_; (s2lo4_) = hl_.hilo_.lo_; } while (0); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s1lo7_); (s1lo7hi4_) = hl_.hilo_.hi_; (s1lo7lo4_) = hl_.hilo_.lo_; } while (0); s1msbdiv2hi_ = (rc_svec_type_)__builtin_vis_fpmerge(s1msbdiv2hi4_, zero4_); s1msbdiv2lo_ = (rc_svec_type_)__builtin_vis_fpmerge(s1msbdiv2lo4_, zero4_); s1lo7hi_ = (rc_svec_type_)__builtin_vis_fpmerge(s1lo7hi4_, zero4_); s1lo7lo_ = (rc_svec_type_)__builtin_vis_fpmerge(s1lo7lo4_, zero4_); mulhilo7_ = __builtin_vis_fmul8x16(s2hi4_, s1lo7hi_); mullolo7_ = __builtin_vis_fmul8x16(s2lo4_, s1lo7lo_); mulhimsbdiv2_ = __builtin_vis_fmul8x16(s2hi4_, s1msbdiv2hi_); mullomsbdiv2_ = __builtin_vis_fmul8x16(s2lo4_, s1msbdiv2lo_); mulhi_ = mulhilo7_ + mulhimsbdiv2_ + mulhimsbdiv2_; mullo_ = mullolo7_ + mullomsbdiv2_ + mullomsbdiv2_; mulhihi_ = mulhi_ & ~masklow_; mulhilo_ = mulhi_ & masklow_; mullohi_ = mullo_ & ~masklow_; mullolo_ = mullo_ & masklow_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (accvin_); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); maclo_ = __builtin_vis_pdist ((rc_vec_t)mullolo_, ((rc_vec_t) {0}), (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i)); maclo_ = __builtin_vis_pdist ((rc_vec_t)mulhilo_, ((rc_vec_t) {0}), maclo_); machi_ = __builtin_vis_pdist ((rc_vec_t)mullohi_, ((rc_vec_t) {0}), (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i)); machi_ = __builtin_vis_pdist ((rc_vec_t)mulhihi_, ((rc_vec_t) {0}), machi_); do { typedef union { struct { rc_vec4_type_ hi_, lo_; } hilo_; rc_vec_t v_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) {{((((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)((uint32_t)machi_)).v)), ((((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)((uint32_t)maclo_)).v))}}; (accvout_) = hl_.v_; } while (0); __asm__("\n;# dep fake GSR %[fakegsr] on %[xdep]" : [fakegsr] "=brm" (rc_gsr_fakedep_) : [xdep] "brm" (accvout_), "0" (rc_gsr_fakedep_)); (a11) = accvout_; } while (0); do { rc_vec_t s1_ = (v2); rc_vec_t s2_ = (v2); rc_vec_t accvin_ = (a22); rc_vec_t s1lo7_, s1msb_, accvout_; uint32_t maclo_, machi_; rc_svec_type_ masklow_ = (rc_svec_type_){(255), (255), (255), (255)}; rc_svec_type_ s1msbhi_, s1msblo_, s1lo7hi_, s1lo7lo_; rc_svec_type_ s1msbdiv2hi_, s1msbdiv2lo_; rc_vec4_type_ s1lo7hi4_, s1lo7lo4_, s1msbhi4_, s1msblo4_; rc_vec4_type_ s1msbdiv2hi4_, s1msbdiv2lo4_, s2hi4_, s2lo4_; rc_vec4_type_ accvhi4_, accvlo4_; rc_svec_type_ mulhilo7_, mullolo7_, mulhimsbdiv2_, mullomsbdiv2_; rc_svec_type_ mulhi_, mullo_, mulhihi_, mullohi_; rc_svec_type_ mulhilo_, mullolo_; rc_vec4_type_ zero4_ = (((union { rc_vec4_type_ v; uint64_t i; })(uint64_t)(0)).v); rc_vec_t msb_ = (rc_vec_t){(0x80), (0x80), (0x80), (0x80), (0x80), (0x80), (0x80), (0x80)}; ((s1msb_) = (s1_) & (msb_)); ((s1lo7_) = (s1_) & (~msb_)); do { if (rc_gsr_ldinit_) { extern void rc_mixing_GSR_setting_with_RC_VEC_LDINIT_(void); rc_mixing_GSR_setting_with_RC_VEC_LDINIT_(); } if (!__builtin_constant_p(rc_gsr_align_) || !__builtin_constant_p(2) || !rc_gsr_set_ || (unsigned) (rc_gsr_align_) != rc_gsr_align_ || (unsigned) (2) != rc_gsr_scale_) { rc_gsr_set_ = 1; rc_gsr_align_ = (rc_gsr_align_); rc_gsr_scale_ = (2); unsigned int val_ = (rc_gsr_scale_ << 3) | rc_gsr_align_; if (__builtin_constant_p (val_)) { __asm__("wr %%g0,%[gsrval],%%gsr\n" ";# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_), [fakegsr] "=rm" (rc_gsr_fakedep_) : "0" (s1msb_), [gsrval] "i" (val_), "1" (rc_gsr_fakedep_)); } else { __asm__("wr %[gsrval],0,%%gsr" "\n;# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_), [fakegsr] "=rm" (rc_gsr_fakedep_) : "0" (s1msb_), [gsrval] "r" (val_), "1" (rc_gsr_fakedep_)); } } else { __asm__("\n;# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_) : "0" (s1msb_), [fakegsr] "g" (rc_gsr_fakedep_)); } } while (0); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s1msb_); (s1msbhi4_) = hl_.hilo_.hi_; (s1msblo4_) = hl_.hilo_.lo_; } while (0); s1msbhi_ = __builtin_vis_fexpand(s1msbhi4_); s1msblo_ = __builtin_vis_fexpand(s1msblo4_); s1msbdiv2hi4_ = __builtin_vis_fpack16(s1msbhi_); s1msbdiv2lo4_ = __builtin_vis_fpack16(s1msblo_); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s2_); (s2hi4_) = hl_.hilo_.hi_; (s2lo4_) = hl_.hilo_.lo_; } while (0); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s1lo7_); (s1lo7hi4_) = hl_.hilo_.hi_; (s1lo7lo4_) = hl_.hilo_.lo_; } while (0); s1msbdiv2hi_ = (rc_svec_type_)__builtin_vis_fpmerge(s1msbdiv2hi4_, zero4_); s1msbdiv2lo_ = (rc_svec_type_)__builtin_vis_fpmerge(s1msbdiv2lo4_, zero4_); s1lo7hi_ = (rc_svec_type_)__builtin_vis_fpmerge(s1lo7hi4_, zero4_); s1lo7lo_ = (rc_svec_type_)__builtin_vis_fpmerge(s1lo7lo4_, zero4_); mulhilo7_ = __builtin_vis_fmul8x16(s2hi4_, s1lo7hi_); mullolo7_ = __builtin_vis_fmul8x16(s2lo4_, s1lo7lo_); mulhimsbdiv2_ = __builtin_vis_fmul8x16(s2hi4_, s1msbdiv2hi_); mullomsbdiv2_ = __builtin_vis_fmul8x16(s2lo4_, s1msbdiv2lo_); mulhi_ = mulhilo7_ + mulhimsbdiv2_ + mulhimsbdiv2_; mullo_ = mullolo7_ + mullomsbdiv2_ + mullomsbdiv2_; mulhihi_ = mulhi_ & ~masklow_; mulhilo_ = mulhi_ & masklow_; mullohi_ = mullo_ & ~masklow_; mullolo_ = mullo_ & masklow_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (accvin_); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); maclo_ = __builtin_vis_pdist ((rc_vec_t)mullolo_, ((rc_vec_t) {0}), (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i)); maclo_ = __builtin_vis_pdist ((rc_vec_t)mulhilo_, ((rc_vec_t) {0}), maclo_); machi_ = __builtin_vis_pdist ((rc_vec_t)mullohi_, ((rc_vec_t) {0}), (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i)); machi_ = __builtin_vis_pdist ((rc_vec_t)mulhihi_, ((rc_vec_t) {0}), machi_); do { typedef union { struct { rc_vec4_type_ hi_, lo_; } hilo_; rc_vec_t v_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) {{((((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)((uint32_t)machi_)).v)), ((((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)((uint32_t)maclo_)).v))}}; (accvout_) = hl_.v_; } while (0); __asm__("\n;# dep fake GSR %[fakegsr] on %[xdep]" : [fakegsr] "=brm" (rc_gsr_fakedep_) : [xdep] "brm" (accvout_), "0" (rc_gsr_fakedep_)); (a22) = accvout_; } while (0); do { rc_vec_t s1_ = (v1); rc_vec_t s2_ = (v2); rc_vec_t accvin_ = (a12); rc_vec_t s1lo7_, s1msb_, accvout_; uint32_t maclo_, machi_; rc_svec_type_ masklow_ = (rc_svec_type_){(255), (255), (255), (255)}; rc_svec_type_ s1msbhi_, s1msblo_, s1lo7hi_, s1lo7lo_; rc_svec_type_ s1msbdiv2hi_, s1msbdiv2lo_; rc_vec4_type_ s1lo7hi4_, s1lo7lo4_, s1msbhi4_, s1msblo4_; rc_vec4_type_ s1msbdiv2hi4_, s1msbdiv2lo4_, s2hi4_, s2lo4_; rc_vec4_type_ accvhi4_, accvlo4_; rc_svec_type_ mulhilo7_, mullolo7_, mulhimsbdiv2_, mullomsbdiv2_; rc_svec_type_ mulhi_, mullo_, mulhihi_, mullohi_; rc_svec_type_ mulhilo_, mullolo_; rc_vec4_type_ zero4_ = (((union { rc_vec4_type_ v; uint64_t i; })(uint64_t)(0)).v); rc_vec_t msb_ = (rc_vec_t){(0x80), (0x80), (0x80), (0x80), (0x80), (0x80), (0x80), (0x80)}; ((s1msb_) = (s1_) & (msb_)); ((s1lo7_) = (s1_) & (~msb_)); do { if (rc_gsr_ldinit_) { extern void rc_mixing_GSR_setting_with_RC_VEC_LDINIT_(void); rc_mixing_GSR_setting_with_RC_VEC_LDINIT_(); } if (!__builtin_constant_p(rc_gsr_align_) || !__builtin_constant_p(2) || !rc_gsr_set_ || (unsigned) (rc_gsr_align_) != rc_gsr_align_ || (unsigned) (2) != rc_gsr_scale_) { rc_gsr_set_ = 1; rc_gsr_align_ = (rc_gsr_align_); rc_gsr_scale_ = (2); unsigned int val_ = (rc_gsr_scale_ << 3) | rc_gsr_align_; if (__builtin_constant_p (val_)) { __asm__("wr %%g0,%[gsrval],%%gsr\n" ";# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_), [fakegsr] "=rm" (rc_gsr_fakedep_) : "0" (s1msb_), [gsrval] "i" (val_), "1" (rc_gsr_fakedep_)); } else { __asm__("wr %[gsrval],0,%%gsr" "\n;# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_), [fakegsr] "=rm" (rc_gsr_fakedep_) : "0" (s1msb_), [gsrval] "r" (val_), "1" (rc_gsr_fakedep_)); } } else { __asm__("\n;# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_) : "0" (s1msb_), [fakegsr] "g" (rc_gsr_fakedep_)); } } while (0); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s1msb_); (s1msbhi4_) = hl_.hilo_.hi_; (s1msblo4_) = hl_.hilo_.lo_; } while (0); s1msbhi_ = __builtin_vis_fexpand(s1msbhi4_); s1msblo_ = __builtin_vis_fexpand(s1msblo4_); s1msbdiv2hi4_ = __builtin_vis_fpack16(s1msbhi_); s1msbdiv2lo4_ = __builtin_vis_fpack16(s1msblo_); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s2_); (s2hi4_) = hl_.hilo_.hi_; (s2lo4_) = hl_.hilo_.lo_; } while (0); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s1lo7_); (s1lo7hi4_) = hl_.hilo_.hi_; (s1lo7lo4_) = hl_.hilo_.lo_; } while (0); s1msbdiv2hi_ = (rc_svec_type_)__builtin_vis_fpmerge(s1msbdiv2hi4_, zero4_); s1msbdiv2lo_ = (rc_svec_type_)__builtin_vis_fpmerge(s1msbdiv2lo4_, zero4_); s1lo7hi_ = (rc_svec_type_)__builtin_vis_fpmerge(s1lo7hi4_, zero4_); s1lo7lo_ = (rc_svec_type_)__builtin_vis_fpmerge(s1lo7lo4_, zero4_); mulhilo7_ = __builtin_vis_fmul8x16(s2hi4_, s1lo7hi_); mullolo7_ = __builtin_vis_fmul8x16(s2lo4_, s1lo7lo_); mulhimsbdiv2_ = __builtin_vis_fmul8x16(s2hi4_, s1msbdiv2hi_); mullomsbdiv2_ = __builtin_vis_fmul8x16(s2lo4_, s1msbdiv2lo_); mulhi_ = mulhilo7_ + mulhimsbdiv2_ + mulhimsbdiv2_; mullo_ = mullolo7_ + mullomsbdiv2_ + mullomsbdiv2_; mulhihi_ = mulhi_ & ~masklow_; mulhilo_ = mulhi_ & masklow_; mullohi_ = mullo_ & ~masklow_; mullolo_ = mullo_ & masklow_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (accvin_); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); maclo_ = __builtin_vis_pdist ((rc_vec_t)mullolo_, ((rc_vec_t) {0}), (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i)); maclo_ = __builtin_vis_pdist ((rc_vec_t)mulhilo_, ((rc_vec_t) {0}), maclo_); machi_ = __builtin_vis_pdist ((rc_vec_t)mullohi_, ((rc_vec_t) {0}), (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i)); machi_ = __builtin_vis_pdist ((rc_vec_t)mulhihi_, ((rc_vec_t) {0}), machi_); do { typedef union { struct { rc_vec4_type_ hi_, lo_; } hilo_; rc_vec_t v_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) {{((((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)((uint32_t)machi_)).v)), ((((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)((uint32_t)maclo_)).v))}}; (accvout_) = hl_.v_; } while (0); __asm__("\n;# dep fake GSR %[fakegsr] on %[xdep]" : [fakegsr] "=brm" (rc_gsr_fakedep_) : [xdep] "brm" (accvout_), "0" (rc_gsr_fakedep_)); (a12) = accvout_; } while (0); (i1) += 8; (i2) += 8; } while (0);
++
++            }
++            do { uint32_t t1, t2, t11, t22, t12; ((t1) = (((union { rc_vec_t v; uint64_t i; })(uint64_t)(a1)).i)); ((t2) = (((union { rc_vec_t v; uint64_t i; })(uint64_t)(a2)).i)); do { rc_vec4_type_ accvhi4_, accvlo4_; uint64_t machi_, maclo_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (a11); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); machi_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i); maclo_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i); (t11) = maclo_ + machi_ * 256; } while (0); do { rc_vec4_type_ accvhi4_, accvlo4_; uint64_t machi_, maclo_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (a22); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); machi_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i); maclo_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i); (t22) = maclo_ + machi_ * 256; } while (0); do { rc_vec4_type_ accvhi4_, accvlo4_; uint64_t machi_, maclo_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (a12); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); machi_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i); maclo_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i); (t12) = maclo_ + machi_ * 256; } while (0); ((a1) = ((rc_vec_t) {0})); ((a2) = ((rc_vec_t) {0})); ((a11) = ((rc_vec_t) {0})); ((a22) = ((rc_vec_t) {0})); ((a12) = ((rc_vec_t) {0})); (s1) += t1; (s2) += t2; (s11) += t11; (s22) += t22; (s12) += t12; } while (0);
++        }
++        for (x = 0; x < rem1; x++) {
++            do { rc_vec_t v1, v2; ((v1) = *(const rc_vec_t*)(&(src1)[i1])); ((v2) = *(const rc_vec_t*)(&(src2)[i2])); ((a1) = (((union { rc_vec_t v; uint64_t i; })(uint64_t)(__builtin_vis_pdist (v1, ((rc_vec_t) {0}), (((union { rc_vec_t v; uint64_t i; })(uint64_t)(a1)).i)))).v)); ((a2) = (((union { rc_vec_t v; uint64_t i; })(uint64_t)(__builtin_vis_pdist (v2, ((rc_vec_t) {0}), (((union { rc_vec_t v; uint64_t i; })(uint64_t)(a2)).i)))).v)); do { rc_vec_t s1_ = (v1); rc_vec_t s2_ = (v1); rc_vec_t accvin_ = (a11); rc_vec_t s1lo7_, s1msb_, accvout_; uint32_t maclo_, machi_; rc_svec_type_ masklow_ = (rc_svec_type_){(255), (255), (255), (255)}; rc_svec_type_ s1msbhi_, s1msblo_, s1lo7hi_, s1lo7lo_; rc_svec_type_ s1msbdiv2hi_, s1msbdiv2lo_; rc_vec4_type_ s1lo7hi4_, s1lo7lo4_, s1msbhi4_, s1msblo4_; rc_vec4_type_ s1msbdiv2hi4_, s1msbdiv2lo4_, s2hi4_, s2lo4_; rc_vec4_type_ accvhi4_, accvlo4_; rc_svec_type_ mulhilo7_, mullolo7_, mulhimsbdiv2_, mullomsbdiv2_; rc_svec_type_ mulhi_, mullo_, mulhihi_, mullohi_; rc_svec_type_ mulhilo_, mullolo_; rc_vec4_type_ zero4_ = (((union { rc_vec4_type_ v; uint64_t i; })(uint64_t)(0)).v); rc_vec_t msb_ = (rc_vec_t){(0x80), (0x80), (0x80), (0x80), (0x80), (0x80), (0x80), (0x80)}; ((s1msb_) = (s1_) & (msb_)); ((s1lo7_) = (s1_) & (~msb_)); do { if (rc_gsr_ldinit_) { extern void rc_mixing_GSR_setting_with_RC_VEC_LDINIT_(void); rc_mixing_GSR_setting_with_RC_VEC_LDINIT_(); } if (!__builtin_constant_p(rc_gsr_align_) || !__builtin_constant_p(2) || !rc_gsr_set_ || (unsigned) (rc_gsr_align_) != rc_gsr_align_ || (unsigned) (2) != rc_gsr_scale_) { rc_gsr_set_ = 1; rc_gsr_align_ = (rc_gsr_align_); rc_gsr_scale_ = (2); unsigned int val_ = (rc_gsr_scale_ << 3) | rc_gsr_align_; if (__builtin_constant_p (val_)) { __asm__("wr %%g0,%[gsrval],%%gsr\n" ";# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_), [fakegsr] "=rm" (rc_gsr_fakedep_) : "0" (s1msb_), [gsrval] "i" (val_), "1" (rc_gsr_fakedep_)); } else { __asm__("wr %[gsrval],0,%%gsr" "\n;# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_), [fakegsr] "=rm" (rc_gsr_fakedep_) : "0" (s1msb_), [gsrval] "r" (val_), "1" (rc_gsr_fakedep_)); } } else { __asm__("\n;# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_) : "0" (s1msb_), [fakegsr] "g" (rc_gsr_fakedep_)); } } while (0); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s1msb_); (s1msbhi4_) = hl_.hilo_.hi_; (s1msblo4_) = hl_.hilo_.lo_; } while (0); s1msbhi_ = __builtin_vis_fexpand(s1msbhi4_); s1msblo_ = __builtin_vis_fexpand(s1msblo4_); s1msbdiv2hi4_ = __builtin_vis_fpack16(s1msbhi_); s1msbdiv2lo4_ = __builtin_vis_fpack16(s1msblo_); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s2_); (s2hi4_) = hl_.hilo_.hi_; (s2lo4_) = hl_.hilo_.lo_; } while (0); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s1lo7_); (s1lo7hi4_) = hl_.hilo_.hi_; (s1lo7lo4_) = hl_.hilo_.lo_; } while (0); s1msbdiv2hi_ = (rc_svec_type_)__builtin_vis_fpmerge(s1msbdiv2hi4_, zero4_); s1msbdiv2lo_ = (rc_svec_type_)__builtin_vis_fpmerge(s1msbdiv2lo4_, zero4_); s1lo7hi_ = (rc_svec_type_)__builtin_vis_fpmerge(s1lo7hi4_, zero4_); s1lo7lo_ = (rc_svec_type_)__builtin_vis_fpmerge(s1lo7lo4_, zero4_); mulhilo7_ = __builtin_vis_fmul8x16(s2hi4_, s1lo7hi_); mullolo7_ = __builtin_vis_fmul8x16(s2lo4_, s1lo7lo_); mulhimsbdiv2_ = __builtin_vis_fmul8x16(s2hi4_, s1msbdiv2hi_); mullomsbdiv2_ = __builtin_vis_fmul8x16(s2lo4_, s1msbdiv2lo_); mulhi_ = mulhilo7_ + mulhimsbdiv2_ + mulhimsbdiv2_; mullo_ = mullolo7_ + mullomsbdiv2_ + mullomsbdiv2_; mulhihi_ = mulhi_ & ~masklow_; mulhilo_ = mulhi_ & masklow_; mullohi_ = mullo_ & ~masklow_; mullolo_ = mullo_ & masklow_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (accvin_); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); maclo_ = __builtin_vis_pdist ((rc_vec_t)mullolo_, ((rc_vec_t) {0}), (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i)); maclo_ = __builtin_vis_pdist ((rc_vec_t)mulhilo_, ((rc_vec_t) {0}), maclo_); machi_ = __builtin_vis_pdist ((rc_vec_t)mullohi_, ((rc_vec_t) {0}), (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i)); machi_ = __builtin_vis_pdist ((rc_vec_t)mulhihi_, ((rc_vec_t) {0}), machi_); do { typedef union { struct { rc_vec4_type_ hi_, lo_; } hilo_; rc_vec_t v_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) {{((((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)((uint32_t)machi_)).v)), ((((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)((uint32_t)maclo_)).v))}}; (accvout_) = hl_.v_; } while (0); __asm__("\n;# dep fake GSR %[fakegsr] on %[xdep]" : [fakegsr] "=brm" (rc_gsr_fakedep_) : [xdep] "brm" (accvout_), "0" (rc_gsr_fakedep_)); (a11) = accvout_; } while (0); do { rc_vec_t s1_ = (v2); rc_vec_t s2_ = (v2); rc_vec_t accvin_ = (a22); rc_vec_t s1lo7_, s1msb_, accvout_; uint32_t maclo_, machi_; rc_svec_type_ masklow_ = (rc_svec_type_){(255), (255), (255), (255)}; rc_svec_type_ s1msbhi_, s1msblo_, s1lo7hi_, s1lo7lo_; rc_svec_type_ s1msbdiv2hi_, s1msbdiv2lo_; rc_vec4_type_ s1lo7hi4_, s1lo7lo4_, s1msbhi4_, s1msblo4_; rc_vec4_type_ s1msbdiv2hi4_, s1msbdiv2lo4_, s2hi4_, s2lo4_; rc_vec4_type_ accvhi4_, accvlo4_; rc_svec_type_ mulhilo7_, mullolo7_, mulhimsbdiv2_, mullomsbdiv2_; rc_svec_type_ mulhi_, mullo_, mulhihi_, mullohi_; rc_svec_type_ mulhilo_, mullolo_; rc_vec4_type_ zero4_ = (((union { rc_vec4_type_ v; uint64_t i; })(uint64_t)(0)).v); rc_vec_t msb_ = (rc_vec_t){(0x80), (0x80), (0x80), (0x80), (0x80), (0x80), (0x80), (0x80)}; ((s1msb_) = (s1_) & (msb_)); ((s1lo7_) = (s1_) & (~msb_)); do { if (rc_gsr_ldinit_) { extern void rc_mixing_GSR_setting_with_RC_VEC_LDINIT_(void); rc_mixing_GSR_setting_with_RC_VEC_LDINIT_(); } if (!__builtin_constant_p(rc_gsr_align_) || !__builtin_constant_p(2) || !rc_gsr_set_ || (unsigned) (rc_gsr_align_) != rc_gsr_align_ || (unsigned) (2) != rc_gsr_scale_) { rc_gsr_set_ = 1; rc_gsr_align_ = (rc_gsr_align_); rc_gsr_scale_ = (2); unsigned int val_ = (rc_gsr_scale_ << 3) | rc_gsr_align_; if (__builtin_constant_p (val_)) { __asm__("wr %%g0,%[gsrval],%%gsr\n" ";# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_), [fakegsr] "=rm" (rc_gsr_fakedep_) : "0" (s1msb_), [gsrval] "i" (val_), "1" (rc_gsr_fakedep_)); } else { __asm__("wr %[gsrval],0,%%gsr" "\n;# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_), [fakegsr] "=rm" (rc_gsr_fakedep_) : "0" (s1msb_), [gsrval] "r" (val_), "1" (rc_gsr_fakedep_)); } } else { __asm__("\n;# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_) : "0" (s1msb_), [fakegsr] "g" (rc_gsr_fakedep_)); } } while (0); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s1msb_); (s1msbhi4_) = hl_.hilo_.hi_; (s1msblo4_) = hl_.hilo_.lo_; } while (0); s1msbhi_ = __builtin_vis_fexpand(s1msbhi4_); s1msblo_ = __builtin_vis_fexpand(s1msblo4_); s1msbdiv2hi4_ = __builtin_vis_fpack16(s1msbhi_); s1msbdiv2lo4_ = __builtin_vis_fpack16(s1msblo_); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s2_); (s2hi4_) = hl_.hilo_.hi_; (s2lo4_) = hl_.hilo_.lo_; } while (0); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s1lo7_); (s1lo7hi4_) = hl_.hilo_.hi_; (s1lo7lo4_) = hl_.hilo_.lo_; } while (0); s1msbdiv2hi_ = (rc_svec_type_)__builtin_vis_fpmerge(s1msbdiv2hi4_, zero4_); s1msbdiv2lo_ = (rc_svec_type_)__builtin_vis_fpmerge(s1msbdiv2lo4_, zero4_); s1lo7hi_ = (rc_svec_type_)__builtin_vis_fpmerge(s1lo7hi4_, zero4_); s1lo7lo_ = (rc_svec_type_)__builtin_vis_fpmerge(s1lo7lo4_, zero4_); mulhilo7_ = __builtin_vis_fmul8x16(s2hi4_, s1lo7hi_); mullolo7_ = __builtin_vis_fmul8x16(s2lo4_, s1lo7lo_); mulhimsbdiv2_ = __builtin_vis_fmul8x16(s2hi4_, s1msbdiv2hi_); mullomsbdiv2_ = __builtin_vis_fmul8x16(s2lo4_, s1msbdiv2lo_); mulhi_ = mulhilo7_ + mulhimsbdiv2_ + mulhimsbdiv2_; mullo_ = mullolo7_ + mullomsbdiv2_ + mullomsbdiv2_; mulhihi_ = mulhi_ & ~masklow_; mulhilo_ = mulhi_ & masklow_; mullohi_ = mullo_ & ~masklow_; mullolo_ = mullo_ & masklow_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (accvin_); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); maclo_ = __builtin_vis_pdist ((rc_vec_t)mullolo_, ((rc_vec_t) {0}), (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i)); maclo_ = __builtin_vis_pdist ((rc_vec_t)mulhilo_, ((rc_vec_t) {0}), maclo_); machi_ = __builtin_vis_pdist ((rc_vec_t)mullohi_, ((rc_vec_t) {0}), (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i)); machi_ = __builtin_vis_pdist ((rc_vec_t)mulhihi_, ((rc_vec_t) {0}), machi_); do { typedef union { struct { rc_vec4_type_ hi_, lo_; } hilo_; rc_vec_t v_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) {{((((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)((uint32_t)machi_)).v)), ((((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)((uint32_t)maclo_)).v))}}; (accvout_) = hl_.v_; } while (0); __asm__("\n;# dep fake GSR %[fakegsr] on %[xdep]" : [fakegsr] "=brm" (rc_gsr_fakedep_) : [xdep] "brm" (accvout_), "0" (rc_gsr_fakedep_)); (a22) = accvout_; } while (0); do { rc_vec_t s1_ = (v1); rc_vec_t s2_ = (v2); rc_vec_t accvin_ = (a12); rc_vec_t s1lo7_, s1msb_, accvout_; uint32_t maclo_, machi_; rc_svec_type_ masklow_ = (rc_svec_type_){(255), (255), (255), (255)}; rc_svec_type_ s1msbhi_, s1msblo_, s1lo7hi_, s1lo7lo_; rc_svec_type_ s1msbdiv2hi_, s1msbdiv2lo_; rc_vec4_type_ s1lo7hi4_, s1lo7lo4_, s1msbhi4_, s1msblo4_; rc_vec4_type_ s1msbdiv2hi4_, s1msbdiv2lo4_, s2hi4_, s2lo4_; rc_vec4_type_ accvhi4_, accvlo4_; rc_svec_type_ mulhilo7_, mullolo7_, mulhimsbdiv2_, mullomsbdiv2_; rc_svec_type_ mulhi_, mullo_, mulhihi_, mullohi_; rc_svec_type_ mulhilo_, mullolo_; rc_vec4_type_ zero4_ = (((union { rc_vec4_type_ v; uint64_t i; })(uint64_t)(0)).v); rc_vec_t msb_ = (rc_vec_t){(0x80), (0x80), (0x80), (0x80), (0x80), (0x80), (0x80), (0x80)}; ((s1msb_) = (s1_) & (msb_)); ((s1lo7_) = (s1_) & (~msb_)); do { if (rc_gsr_ldinit_) { extern void rc_mixing_GSR_setting_with_RC_VEC_LDINIT_(void); rc_mixing_GSR_setting_with_RC_VEC_LDINIT_(); } if (!__builtin_constant_p(rc_gsr_align_) || !__builtin_constant_p(2) || !rc_gsr_set_ || (unsigned) (rc_gsr_align_) != rc_gsr_align_ || (unsigned) (2) != rc_gsr_scale_) { rc_gsr_set_ = 1; rc_gsr_align_ = (rc_gsr_align_); rc_gsr_scale_ = (2); unsigned int val_ = (rc_gsr_scale_ << 3) | rc_gsr_align_; if (__builtin_constant_p (val_)) { __asm__("wr %%g0,%[gsrval],%%gsr\n" ";# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_), [fakegsr] "=rm" (rc_gsr_fakedep_) : "0" (s1msb_), [gsrval] "i" (val_), "1" (rc_gsr_fakedep_)); } else { __asm__("wr %[gsrval],0,%%gsr" "\n;# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_), [fakegsr] "=rm" (rc_gsr_fakedep_) : "0" (s1msb_), [gsrval] "r" (val_), "1" (rc_gsr_fakedep_)); } } else { __asm__("\n;# dep %[depvec] on fake GSR %[fakegsr]" : [depvec] "=brm" (s1msb_) : "0" (s1msb_), [fakegsr] "g" (rc_gsr_fakedep_)); } } while (0); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s1msb_); (s1msbhi4_) = hl_.hilo_.hi_; (s1msblo4_) = hl_.hilo_.lo_; } while (0); s1msbhi_ = __builtin_vis_fexpand(s1msbhi4_); s1msblo_ = __builtin_vis_fexpand(s1msblo4_); s1msbdiv2hi4_ = __builtin_vis_fpack16(s1msbhi_); s1msbdiv2lo4_ = __builtin_vis_fpack16(s1msblo_); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s2_); (s2hi4_) = hl_.hilo_.hi_; (s2lo4_) = hl_.hilo_.lo_; } while (0); do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (s1lo7_); (s1lo7hi4_) = hl_.hilo_.hi_; (s1lo7lo4_) = hl_.hilo_.lo_; } while (0); s1msbdiv2hi_ = (rc_svec_type_)__builtin_vis_fpmerge(s1msbdiv2hi4_, zero4_); s1msbdiv2lo_ = (rc_svec_type_)__builtin_vis_fpmerge(s1msbdiv2lo4_, zero4_); s1lo7hi_ = (rc_svec_type_)__builtin_vis_fpmerge(s1lo7hi4_, zero4_); s1lo7lo_ = (rc_svec_type_)__builtin_vis_fpmerge(s1lo7lo4_, zero4_); mulhilo7_ = __builtin_vis_fmul8x16(s2hi4_, s1lo7hi_); mullolo7_ = __builtin_vis_fmul8x16(s2lo4_, s1lo7lo_); mulhimsbdiv2_ = __builtin_vis_fmul8x16(s2hi4_, s1msbdiv2hi_); mullomsbdiv2_ = __builtin_vis_fmul8x16(s2lo4_, s1msbdiv2lo_); mulhi_ = mulhilo7_ + mulhimsbdiv2_ + mulhimsbdiv2_; mullo_ = mullolo7_ + mullomsbdiv2_ + mullomsbdiv2_; mulhihi_ = mulhi_ & ~masklow_; mulhilo_ = mulhi_ & masklow_; mullohi_ = mullo_ & ~masklow_; mullolo_ = mullo_ & masklow_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (accvin_); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); maclo_ = __builtin_vis_pdist ((rc_vec_t)mullolo_, ((rc_vec_t) {0}), (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i)); maclo_ = __builtin_vis_pdist ((rc_vec_t)mulhilo_, ((rc_vec_t) {0}), maclo_); machi_ = __builtin_vis_pdist ((rc_vec_t)mullohi_, ((rc_vec_t) {0}), (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i)); machi_ = __builtin_vis_pdist ((rc_vec_t)mulhihi_, ((rc_vec_t) {0}), machi_); do { typedef union { struct { rc_vec4_type_ hi_, lo_; } hilo_; rc_vec_t v_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) {{((((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)((uint32_t)machi_)).v)), ((((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)((uint32_t)maclo_)).v))}}; (accvout_) = hl_.v_; } while (0); __asm__("\n;# dep fake GSR %[fakegsr] on %[xdep]" : [fakegsr] "=brm" (rc_gsr_fakedep_) : [xdep] "brm" (accvout_), "0" (rc_gsr_fakedep_)); (a12) = accvout_; } while (0); (i1) += 8; (i2) += 8; } while (0);
++        }
++        do { uint32_t t1, t2, t11, t22, t12; ((t1) = (((union { rc_vec_t v; uint64_t i; })(uint64_t)(a1)).i)); ((t2) = (((union { rc_vec_t v; uint64_t i; })(uint64_t)(a2)).i)); do { rc_vec4_type_ accvhi4_, accvlo4_; uint64_t machi_, maclo_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (a11); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); machi_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i); maclo_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i); (t11) = maclo_ + machi_ * 256; } while (0); do { rc_vec4_type_ accvhi4_, accvlo4_; uint64_t machi_, maclo_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (a22); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); machi_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i); maclo_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i); (t22) = maclo_ + machi_ * 256; } while (0); do { rc_vec4_type_ accvhi4_, accvlo4_; uint64_t machi_, maclo_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (a12); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); machi_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i); maclo_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i); (t12) = maclo_ + machi_ * 256; } while (0); ((a1) = ((rc_vec_t) {0})); ((a2) = ((rc_vec_t) {0})); ((a11) = ((rc_vec_t) {0})); ((a22) = ((rc_vec_t) {0})); ((a12) = ((rc_vec_t) {0})); (s1) += t1; (s2) += t2; (s11) += t11; (s22) += t22; (s12) += t12; } while (0);
++
++        do { uint32_t t1, t2, t11, t22, t12; ((t1) = (((union { rc_vec_t v; uint64_t i; })(uint64_t)(a1)).i)); ((t2) = (((union { rc_vec_t v; uint64_t i; })(uint64_t)(a2)).i)); do { rc_vec4_type_ accvhi4_, accvlo4_; uint64_t machi_, maclo_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (a11); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); machi_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i); maclo_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i); (t11) = maclo_ + machi_ * 256; } while (0); do { rc_vec4_type_ accvhi4_, accvlo4_; uint64_t machi_, maclo_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (a22); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); machi_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i); maclo_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i); (t22) = maclo_ + machi_ * 256; } while (0); do { rc_vec4_type_ accvhi4_, accvlo4_; uint64_t machi_, maclo_; do { typedef union { rc_vec_t v_; struct { rc_vec4_type_ hi_, lo_; } hilo_; } RC_hl_type_; RC_hl_type_ hl_ = (RC_hl_type_) (a12); (accvhi4_) = hl_.hilo_.hi_; (accvlo4_) = hl_.hilo_.lo_; } while (0); machi_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvhi4_)).i); maclo_ = (((union { rc_vec4_type_ v; uint32_t i; })(uint32_t)(accvlo4_)).i); (t12) = maclo_ + machi_ * 256; } while (0); ((a1) = ((rc_vec_t) {0})); ((a2) = ((rc_vec_t) {0})); ((a11) = ((rc_vec_t) {0})); ((a22) = ((rc_vec_t) {0})); ((a12) = ((rc_vec_t) {0})); (s1) += t1; (s2) += t2; (s11) += t11; (s22) += t22; (s12) += t12; } while (0);
++    }
++    sum[0] = s1;
++    sum[1] = s2;
++    sum[2] = s11;
++    sum[3] = s22;
++    sum[4] = s12;
++    ;
++}
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106781.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106781.patch
new file mode 100644
index 0000000..a86ddfd
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106781.patch
@@ -0,0 +1,741 @@
+2011-07-21  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	PR middle-end/49736
+	* expr.c (all_zeros_p): Undo bogus part of last change.
+
+2011-07-21  Richard Sandiford  <richard.sandiford@linaro.org>
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
+--- old/gcc/cp/typeck2.c	2011-05-20 21:29:14 +0000
++++ new/gcc/cp/typeck2.c	2011-07-13 13:17:31 +0000
+@@ -473,18 +473,20 @@
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
+@@ -496,7 +498,6 @@
+     case RECORD_TYPE:
+     case UNION_TYPE:
+     case QUAL_UNION_TYPE:
+-      num_initialized_elements = 0;
+       FOR_EACH_CONSTRUCTOR_ELT (CONSTRUCTOR_ELTS (init), idx,
+ 				field_index, value)
+ 	{
+@@ -519,13 +520,14 @@
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
+@@ -549,21 +551,9 @@
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
+@@ -575,6 +565,7 @@
+ 	  code = build2 (MODIFY_EXPR, type, dest, cons);
+ 	  code = build_stmt (input_location, EXPR_STMT, code);
+ 	  add_stmt (code);
++	  num_split_elts += CONSTRUCTOR_NELTS (init);
+ 	}
+       break;
+ 
+@@ -584,6 +575,8 @@
+ 
+   /* The rest of the initializer is now a constant. */
+   TREE_CONSTANT (init) = 1;
++  return complete_p && complete_ctor_at_level_p (TREE_TYPE (init),
++						 num_split_elts, inner_type);
+ }
+ 
+ /* A subroutine of store_init_value.  Splits non-constant static
+@@ -599,7 +592,8 @@
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
+--- old/gcc/expr.c	2011-06-02 12:12:00 +0000
++++ new/gcc/expr.c	2011-07-14 11:52:32 +0000
+@@ -4866,16 +4866,136 @@
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
++  return (DECL_CHAIN (f) == NULL
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
++	for (f = TYPE_FIELDS (type); f ; f = DECL_CHAIN (f))
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
++	for (f = TYPE_FIELDS (type); f ; f = DECL_CHAIN (f))
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
+@@ -4884,7 +5004,9 @@
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
+@@ -4899,6 +5021,8 @@
+ 	    mult = (tree_low_cst (hi_index, 1)
+ 		    - tree_low_cst (lo_index, 1) + 1);
+ 	}
++      num_fields += mult;
++      elt_type = TREE_TYPE (value);
+ 
+       switch (TREE_CODE (value))
+ 	{
+@@ -4906,11 +5030,11 @@
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
+@@ -4922,12 +5046,12 @@
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
+@@ -4935,7 +5059,7 @@
+ 	    nz_elts += mult;
+ 	  if (!initializer_zerop (TREE_IMAGPART (value)))
+ 	    nz_elts += mult;
+-	  elt_count += mult;
++	  init_elts += mult;
+ 	  break;
+ 
+ 	case VECTOR_CST:
+@@ -4945,65 +5069,31 @@
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
+ 	  {
+-	    HOST_WIDE_INT tc = count_type_elements (TREE_TYPE (value), true);
+-	    if (tc < 1)
+-	      tc = 1;
++	    HOST_WIDE_INT tc = count_type_elements (elt_type, false);
+ 	    nz_elts += mult * tc;
+-	    elt_count += mult * tc;
++	    init_elts += mult * tc;
+ 
+ 	    if (const_from_elts_p && const_p)
+-	      const_p = initializer_constant_valid_p (value, TREE_TYPE (value))
++	      const_p = initializer_constant_valid_p (value, elt_type)
+ 			!= NULL_TREE;
+ 	  }
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
+@@ -5013,111 +5103,50 @@
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
+-	for (f = TYPE_FIELDS (type); f ; f = DECL_CHAIN (f))
+-	  if (TREE_CODE (f) == FIELD_DECL)
+-	    {
+-	      t = count_type_elements (TREE_TYPE (f), false);
+-	      if (t < 0)
+-		{
+-		  /* Check for structures with flexible array member.  */
+-		  tree tf = TREE_TYPE (f);
+-		  if (allow_flexarr
+-		      && DECL_CHAIN (f) == NULL
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
+@@ -5126,18 +5155,12 @@
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
+@@ -5149,12 +5172,11 @@
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
+--- old/gcc/gimplify.c	2011-05-26 10:27:57 +0000
++++ new/gcc/gimplify.c	2011-07-13 13:17:31 +0000
+@@ -3693,9 +3693,8 @@
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
+@@ -3712,7 +3711,7 @@
+ 	   can only do so if it known to be a valid constant initializer.  */
+ 	valid_const_initializer
+ 	  = categorize_ctor_elements (ctor, &num_nonzero_elements,
+-				      &num_ctor_elements, &cleared);
++				      &num_ctor_elements, &complete_p);
+ 
+ 	/* If a const aggregate variable is being initialized, then it
+ 	   should never be a lose to promote the variable to be static.  */
+@@ -3750,26 +3749,29 @@
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
++++ new/gcc/testsuite/gcc.target/arm/pr48183.c	2011-07-13 13:17:31 +0000
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
+--- old/gcc/tree.h	2011-07-01 09:19:21 +0000
++++ new/gcc/tree.h	2011-07-13 13:17:31 +0000
+@@ -4627,21 +4627,10 @@
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
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106782.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106782.patch
new file mode 100644
index 0000000..5335a9e
--- /dev/null
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106782.patch
@@ -0,0 +1,27 @@
+2011-07-21  Richard Sandiford  <rdsandiford@googlemail.com>
+
+	gcc/
+	Backport from mainline:
+
+	2011-07-21  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	* regcprop.c (maybe_mode_change): Check HARD_REGNO_MODE_OK.
+
+=== modified file 'gcc/regcprop.c'
+--- old/gcc/regcprop.c	2010-12-17 22:51:25 +0000
++++ new/gcc/regcprop.c	2011-07-21 11:30:53 +0000
+@@ -418,10 +418,9 @@
+ 
+       offset = ((WORDS_BIG_ENDIAN ? wordoffset : 0)
+ 		+ (BYTES_BIG_ENDIAN ? byteoffset : 0));
+-      return gen_rtx_raw_REG (new_mode,
+-			      regno + subreg_regno_offset (regno, orig_mode,
+-							   offset,
+-							   new_mode));
++      regno += subreg_regno_offset (regno, orig_mode, offset, new_mode);
++      if (HARD_REGNO_MODE_OK (regno, new_mode))
++	return gen_rtx_raw_REG (new_mode, regno);
+     }
+   return NULL_RTX;
+ }
+
diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
index e3f6114..86dceab 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
@@ -18,4 +18,22 @@ file://linaro/gcc-4.6-linaro-r106751.patch \
 file://linaro/gcc-4.6-linaro-r106753.patch \
 file://linaro/gcc-4.6-linaro-r106754.patch \
 file://linaro/gcc-4.6-linaro-r106755.patch \
+file://linaro/gcc-4.6-linaro-r106759.patch \
+file://linaro/gcc-4.6-linaro-r106761.patch \
+file://linaro/gcc-4.6-linaro-r106762.patch \
+file://linaro/gcc-4.6-linaro-r106763.patch \
+file://linaro/gcc-4.6-linaro-r106764.patch \
+file://linaro/gcc-4.6-linaro-r106766.patch \
+file://linaro/gcc-4.6-linaro-r106768.patch \
+file://linaro/gcc-4.6-linaro-r106769.patch \
+file://linaro/gcc-4.6-linaro-r106770.patch \
+file://linaro/gcc-4.6-linaro-r106771.patch \
+file://linaro/gcc-4.6-linaro-r106772.patch \
+file://linaro/gcc-4.6-linaro-r106773.patch \
+file://linaro/gcc-4.6-linaro-r106775.patch \
+file://linaro/gcc-4.6-linaro-r106776.patch \
+file://linaro/gcc-4.6-linaro-r106777.patch \
+file://linaro/gcc-4.6-linaro-r106778.patch \
+file://linaro/gcc-4.6-linaro-r106781.patch \
+file://linaro/gcc-4.6-linaro-r106782.patch \
 "
diff --git a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
index e5a1fba..0faf45e 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
@@ -1,4 +1,4 @@
 # this will prepend this layer to FILESPATH
 FILESEXTRAPATHS := "${THISDIR}/gcc-4.6"
-PRINC = "1"
+PRINC = "2"
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.4.1



