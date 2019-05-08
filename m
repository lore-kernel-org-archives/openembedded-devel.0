Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE297DEC4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 20:55:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44zpdN2n1Zz3k
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 22:55:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557348904;
	bh=2tW3OEC//WRrJeCemSG9MW5NtZoIHORKIJBSUBKTOEs=;
	h=From:To:Subject:Date:From;
	b=bjEmpwdr1MoNflVp3NTwC5dDV+p/hzkbiHh+MXucvpmfNZl8ZtmL8kZ8zfP61EmJN
	r8oLfnp3epvxj276yp8OCCsX1G+AqS1EhBsTfcDBqcJuXZntkX9g20gwKsiIxCOlW9
	hSNOz/YhhiTXwHmRIZtZZsWyAq7x6wTc9brzx9Tyn/On9uku28a4B5DPWkZ9REbWVu
	se3yIrVQLzLoycAZ0JRFM+VJXNOGwUq4DNQc3w1bgRpn273BTAJKQKeNRLCn+kuuIS
	CZoZGl42bb7T5YQSpTxOnAi20OFhfKEWvxANLtLBYoQuPno1RxNI2OVwpMRhOQDRkQ
	WpMYpQ3ktW8IY8I59g9Hud1lH7MvSThdu62KBEZdFtFo3FDfeD5eXetniBbBkaabfw
	vbHtDm3bwFSVjHz2sLbJ/fUPR4ME6dYOmDKzFsT4wUsNL3GCfT4bDsLPlVuycHI5XU
	F1q7RXCV/NVFtOr3U0pRDQc208mhDvrg1GBtdrpmlceZLXIx9PHUHuM2zlxhlkxr6X
	UcLiVId5ySkW7c3RCpmVSayQOANbxwXaZajscZg4N6+/MtUHdV/s0Nlupx/7OccaXP
	leQXozHVxSQkIMYYMN2eGiSmwhAEVPPP4WXSXSc4WkWbSVQ36dW8TJ5iEBO6Z11X9G
	uSjsw7ss9qgr3dGqZt8fdjfo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 23:55:03 +0300
Message-Id: <20190508205503.24917-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH v2] Remove liboil
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2019 20:55:04 -0000

It was replaced by orc 10 years ago and no users are left
in meta-openembedded.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../packagegroup-meta-multimedia.bb           |   2 +-
 .../0001-Fix-enable-vfp-flag.patch            |  41 ---
 ...onvert-fldmia-fstmia-instructions-to.patch | 257 ------------------
 .../fix-unaligned-whitelist.patch             |  19 --
 .../fix_riscv_unaligned_access.patch          |  15 -
 .../liboil-0.3.17/liboil_fix_for_x32.patch    | 222 ---------------
 .../liboil/liboil-0.3.17/no-tests.patch       |  24 --
 .../recipes-support/liboil/liboil_0.3.17.bb   |  29 --
 8 files changed, 1 insertion(+), 608 deletions(-)
 delete mode 100644 meta-multimedia/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
 delete mode 100644 meta-multimedia/recipes-support/liboil/liboil-0.3.17/0001-math_vfp_asm.S-Convert-fldmia-fstmia-instructions-to.patch
 delete mode 100644 meta-multimedia/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
 delete mode 100644 meta-multimedia/recipes-support/liboil/liboil-0.3.17/fix_riscv_unaligned_access.patch
 delete mode 100644 meta-multimedia/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch
 delete mode 100644 meta-multimedia/recipes-support/liboil/liboil-0.3.17/no-tests.patch
 delete mode 100644 meta-multimedia/recipes-support/liboil/liboil_0.3.17.bb

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index b048ac667..365618d95 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -48,5 +48,5 @@ RDEPENDS_packagegroup-meta-multimedia-mkv = "\
     "
 
 RDEPENDS_packagegroup-meta-multimedia-support = "\
-    liboil libmediaart libmediaart-2.0 gst-instruments libsrtp crossguid \
+    libmediaart libmediaart-2.0 gst-instruments libsrtp crossguid \
     "
diff --git a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch b/meta-multimedia/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
deleted file mode 100644
index aff1cb184..000000000
--- a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-From 1921498bcc06408e8b051a3a9e9ce4182998f748 Mon Sep 17 00:00:00 2001
-From: David Schleef <ds@schleef.org>
-Date: Fri, 8 Apr 2011 10:05:49 -0700
-Subject: [PATCH 10/10] Fix --enable-vfp flag
-
-Patch from Christophe Lyon, fixes #36084.
----
- configure.ac           |    4 ++--
- liboil/arm/Makefile.am |    1 +
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 98c81fb..407d88c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -188,8 +188,8 @@ fi
- AC_ARG_ENABLE(vfp,
-   AC_HELP_STRING([--enable-vfp],[compile with Vector Floating-point unit support]),
-   enable_vfp=$enableval,enable_vfp=yes)
--if test "x$enable-vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
--  AS_COMPILER_FLAG(["-Wa,-mfpu=vfp"],
-+if test "x$enable_vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
-+  AS_COMPILER_FLAG(["-mfpu=vfp"],
-     [VFP_CFLAGS="$VFP_CFLAGS -mfpu=vfp"],
-     true)
-   #AS_COMPILER_FLAG(["-Wa,-mfloat-abi=softfp"],
-diff --git a/liboil/arm/Makefile.am b/liboil/arm/Makefile.am
-index ead08ed..cd8d9fa 100644
---- a/liboil/arm/Makefile.am
-+++ b/liboil/arm/Makefile.am
-@@ -6,4 +6,5 @@ libarm_la_SOURCES = \
- 	math_vfp_asm.S
- 
- libarm_la_CFLAGS = $(LIBOIL_CFLAGS) $(VFP_CFLAGS)
-+libarm_la_CCASFLAGS = $(LIBOIL_CFLAGS) $(VFP_CFLAGS)
- 
--- 
-1.7.6
-
diff --git a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/0001-math_vfp_asm.S-Convert-fldmia-fstmia-instructions-to.patch b/meta-multimedia/recipes-support/liboil/liboil-0.3.17/0001-math_vfp_asm.S-Convert-fldmia-fstmia-instructions-to.patch
deleted file mode 100644
index 05903807e..000000000
--- a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/0001-math_vfp_asm.S-Convert-fldmia-fstmia-instructions-to.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From 02a138f0b247fb08b799f32c49b35912b2921321 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 12 Feb 2019 11:38:46 -0800
-Subject: [PATCH] math_vfp_asm.S: Convert fldmia/fstmia instructions to UAL
- syntax for clang
-
-This is flagged with clang internal assembler, since it does not allow
-non UAL syntax
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- liboil/arm/math_vfp_asm.S | 94 +++++++++++++++++++--------------------
- 1 file changed, 47 insertions(+), 47 deletions(-)
-
-diff --git a/liboil/arm/math_vfp_asm.S b/liboil/arm/math_vfp_asm.S
-index ae5c803..3dd14d9 100644
---- a/liboil/arm/math_vfp_asm.S
-+++ b/liboil/arm/math_vfp_asm.S
-@@ -25,7 +25,7 @@
-  */
- 
- #if defined(__VFP_FP__) && !defined(__SOFTFP__)
--/* 
-+/*
- ** compile with -mcpu=arm1136j-s -mfpu=vfp -mfloat-abi=softfp
- **
- ** void vfp_add_f32 (float *d, const float *s1, const float *s2, int n);
-@@ -48,10 +48,10 @@
-     ands          ip, r3, #7;               /* ip = n % 8 */                  \
-     beq           vfp_ ## fname ## _unroll; /* if ip == 0 goto prep_loop2 */  \
-   vfp_ ## fname ## _loop1:                                                    \
--    fldmias       r1!, {s0};                                                  \
--    fldmias       r2!, {s1};                                                  \
-+    vldmia.f32       r1!, {s0};                                                  \
-+    vldmia.f32       r2!, {s1};                                                  \
-     ## finst ##s  s2, s0, s1;                                                 \
--    fstmias       r0!, {s2};                                                  \
-+    vstmia.f32       r0!, {s2};                                                  \
-     subs          ip, ip, #1;                                                 \
-     bne           vfp_ ## fname ## _loop1;                                    \
-   vfp_ ## fname ## _unroll:                 /* unroll by 8 */                 \
-@@ -62,15 +62,15 @@
-     orr           fp, lr, fp, lsl #16;      /* set vector lenght to 8 */      \
-     fmxr          fpscr, fp;                                                  \
-   vfp_ ## fname ## _loop2:                                                    \
--    fldmias       r1!, {s8, s9, s10, s11, s12, s13, s14, s15};                \
--    fldmias       r2!, {s16, s17, s18, s19, s20, s21, s22, s23};              \
-+    vldmia.f32       r1!, {s8, s9, s10, s11, s12, s13, s14, s15};                \
-+    vldmia.f32       r2!, {s16, s17, s18, s19, s20, s21, s22, s23};              \
-     ## finst ##s  s24, s8, s16;                                               \
--    fstmias       r0!, {s24, s25, s26, s27, s28, s29, s30, s31};              \
-+    vstmia.f32       r0!, {s24, s25, s26, s27, s28, s29, s30, s31};              \
-     subs          ip, ip, #1;                                                 \
-     bne           vfp_ ## fname ## _loop2;                                    \
-     fmxr          fpscr, lr;                /* restore original fpscr */      \
-   vfp_ ## fname ## _end:                                                      \
--    ldmia         sp!, {fp, pc};        /* recovering from stack and return */   
-+    ldmia         sp!, {fp, pc};        /* recovering from stack and return */
- 
- #define UNROLL_F64_TEMPLATE(fname,finst) \
-   .global vfp_ ## fname ## ;                                                  \
-@@ -79,10 +79,10 @@
-     ands          ip, r3, #3;               /* ip = n % 3 */                  \
-     beq           vfp_ ## fname ## _unroll; /* if ip == 0 goto prep_loop2 */  \
-   vfp_ ## fname ## _loop1:                                                    \
--    fldmiad       r1!, {d0};                                                  \
--    fldmiad       r2!, {d1};                                                  \
-+    vldmia.f64       r1!, {d0};                                                  \
-+    vldmia.f64       r2!, {d1};                                                  \
-     ## finst ##d  d2, d0, d1;                                                 \
--    fstmiad       r0!, {d2};                                                  \
-+    vstmia.f64       r0!, {d2};                                                  \
-     subs          ip, ip, #1;                                                 \
-     bne           vfp_ ## fname ## _loop1;                                    \
-   vfp_ ## fname ## _unroll:                 /* unroll by 4 */                 \
-@@ -93,15 +93,15 @@
-     orr           fp, lr, fp, lsl #16;      /* set vector lenght to 8 */      \
-     fmxr          fpscr, fp;                                                  \
-   vfp_ ## fname ## _loop2:                                                    \
--    fldmiad       r1!, {d4, d5, d6, d7};                                      \
--    fldmiad       r2!, {d8, d9, d10, d11};                                    \
-+    vldmia.f64       r1!, {d4, d5, d6, d7};                                      \
-+    vldmia.f64       r2!, {d8, d9, d10, d11};                                    \
-     ## finst ##d  d12, d4, d8;                                                \
--    fstmiad       r0!, {d12, d13, d14, d15};                                  \
-+    vstmia.f64       r0!, {d12, d13, d14, d15};                                  \
-     subs          ip, ip, #1;                                                 \
-     bne           vfp_ ## fname ## _loop2;                                    \
-     fmxr          fpscr, lr;                /* restore original fpscr */      \
-   vfp_ ## fname ## _end:                                                      \
--    ldmia         sp!, {fp, pc};        /* recovering from stack and return */   
-+    ldmia         sp!, {fp, pc};        /* recovering from stack and return */
- 
- .align 2
- UNROLL_F32_TEMPLATE(add_f32,fadd);
-@@ -119,7 +119,7 @@ UNROLL_F64_TEMPLATE(subtract_f64,fsub);
- #undef UNROLL_F32_TEMPLATE
- #undef UNROLL_F64_TEMPLATE
- 
--/* 
-+/*
- **
- ** void vfp_scalaradd_f32_ns (float *d, const float *s1, const float *s2_1, int n);
- ** void vfp_scalaradd_f64_ns (double *d, const double *s1, const double *s2_1, int n);
-@@ -133,13 +133,13 @@ UNROLL_F64_TEMPLATE(subtract_f64,fsub);
-   .global vfp_ ## fname ## ;                                                  \
-   vfp_ ## fname ## :                                                          \
-     stmdb         sp!, {fp, lr};            /* save registers to stack */     \
--    fldmias       r2, {s1};                 /* load scalar value */           \
-+    vldmia.f32       r2, {s1};                 /* load scalar value */           \
-     ands          ip, r3, #7;               /* ip = n % 8 */                  \
-     beq           vfp_ ## fname ## _unroll; /* if ip == 0 goto prep_loop2 */  \
-   vfp_ ## fname ## _loop1:                                                    \
--    fldmias       r1!, {s0};                                                  \
-+    vldmia.f32       r1!, {s0};                                                  \
-     ## finst ##s  s2, s0, s1;                                                 \
--    fstmias       r0!, {s2};                                                  \
-+    vstmia.f32       r0!, {s2};                                                  \
-     subs          ip, ip, #1;                                                 \
-     bne           vfp_ ## fname ## _loop1;                                    \
-   vfp_ ## fname ## _unroll:                 /* unroll by 8 */                 \
-@@ -150,26 +150,26 @@ UNROLL_F64_TEMPLATE(subtract_f64,fsub);
-     orr           fp, lr, fp, lsl #16;      /* set vector lenght to 8 */      \
-     fmxr          fpscr, fp;                                                  \
-   vfp_ ## fname ## _loop2:                                                    \
--    fldmias       r1!, {s8, s9, s10, s11, s12, s13, s14, s15};                \
-+    vldmia.f32       r1!, {s8, s9, s10, s11, s12, s13, s14, s15};                \
-     ## finst ##s  s24, s8, s1;                                                \
--    fstmias       r0!, {s24, s25, s26, s27, s28, s29, s30, s31};              \
-+    vstmia.f32       r0!, {s24, s25, s26, s27, s28, s29, s30, s31};              \
-     subs          ip, ip, #1;                                                 \
-     bne           vfp_ ## fname ## _loop2;                                    \
-     fmxr          fpscr, lr;                /* restore original fpscr */      \
-   vfp_ ## fname ## _end:                                                      \
--    ldmia         sp!, {fp, pc};        /* recovering from stack and return */   
-+    ldmia         sp!, {fp, pc};        /* recovering from stack and return */
- 
- #define UNROLL_F64_TEMPLATE(fname,finst) \
-   .global vfp_ ## fname ## ;                                                  \
-   vfp_ ## fname ## :                                                          \
-     stmdb         sp!, {fp, lr};            /* save registers to stack */     \
--    fldmiad       r2, {d1};                 /* load scalar value */           \
-+    vldmia.f64       r2, {d1};                 /* load scalar value */           \
-     ands          ip, r3, #3;               /* ip = n % 3 */                  \
-     beq           vfp_ ## fname ## _unroll; /* if ip == 0 goto prep_loop2 */  \
-   vfp_ ## fname ## _loop1:                                                    \
--    fldmiad       r1!, {d0};                                                  \
-+    vldmia.f64       r1!, {d0};                                                  \
-     ## finst ##d  d2, d0, d1;                                                 \
--    fstmiad       r0!, {d2};                                                  \
-+    vstmia.f64       r0!, {d2};                                                  \
-     subs          ip, ip, #1;                                                 \
-     bne           vfp_ ## fname ## _loop1;                                    \
-   vfp_ ## fname ## _unroll:                 /* unroll by 4 */                 \
-@@ -180,14 +180,14 @@ UNROLL_F64_TEMPLATE(subtract_f64,fsub);
-     orr           fp, lr, fp, lsl #16;      /* set vector lenght to 4 */      \
-     fmxr          fpscr, fp;                                                  \
-   vfp_ ## fname ## _loop2:                                                    \
--    fldmiad       r1!, {d4, d5, d6, d7};                                      \
-+    vldmia.f64       r1!, {d4, d5, d6, d7};                                      \
-     ## finst ##d  d12, d4, d1;                                                \
--    fstmiad       r0!, {d12, d13, d14, d15};                                  \
-+    vstmia.f64       r0!, {d12, d13, d14, d15};                                  \
-     subs          ip, ip, #1;                                                 \
-     bne           vfp_ ## fname ## _loop2;                                    \
-     fmxr          fpscr, lr;                /* restore original fpscr */      \
-   vfp_ ## fname ## _end:                                                      \
--    ldmia         sp!, {fp, pc};        /* recovering from stack and return */   
-+    ldmia         sp!, {fp, pc};        /* recovering from stack and return */
- 
- UNROLL_F32_TEMPLATE(scalaradd_f32_ns,fadd);
- UNROLL_F64_TEMPLATE(scalaradd_f64_ns,fadd);
-@@ -198,7 +198,7 @@ UNROLL_F64_TEMPLATE(scalarmultiply_f64_ns,fmul);
- #undef UNROLL_F32_TEMPLATE
- #undef UNROLL_F64_TEMPLATE
- 
--/* 
-+/*
- **
- ** void vfp_abs_f32_f32_ns(float *d, const float *s, int n);
- ** void vfp_abs_f64_f64_ns(double *d, const double *s, int n);
-@@ -215,9 +215,9 @@ UNROLL_F64_TEMPLATE(scalarmultiply_f64_ns,fmul);
-     ands          ip, r2, #7;               /* ip = n % 8 */                  \
-     beq           vfp_ ## fname ## _unroll; /* if ip == 0 goto prep_loop2 */  \
-   vfp_ ## fname ## _loop1:                                                    \
--    fldmias       r1!, {s0};                                                  \
--    ## finst ##s  s2, s0;                                                     \
--    fstmias       r0!, {s2};                                                  \
-+    vldmia.f32       r1!, {s0};                                                  \
-+    ## finst ##.f32  s2, s0;                                                     \
-+    vstmia.f32       r0!, {s2};                                                  \
-     subs          ip, ip, #1;                                                 \
-     bne           vfp_ ## fname ## _loop1;                                    \
-   vfp_ ## fname ## _unroll:                 /* unroll by 8 */                 \
-@@ -228,14 +228,14 @@ UNROLL_F64_TEMPLATE(scalarmultiply_f64_ns,fmul);
-     orr           fp, lr, fp, lsl #16;      /* set vector lenght to 8 */      \
-     fmxr          fpscr, fp;                                                  \
-   vfp_ ## fname ## _loop2:                                                    \
--    fldmias       r1!, {s8, s9, s10, s11, s12, s13, s14, s15};                \
--    ## finst ##s  s24, s8;                                                    \
--    fstmias       r0!, {s24, s25, s26, s27, s28, s29, s30, s31};              \
-+    vldmia.f32       r1!, {s8, s9, s10, s11, s12, s13, s14, s15};                \
-+    ## finst  ##.f32 s24, s8;                                                    \
-+    vstmia.f32       r0!, {s24, s25, s26, s27, s28, s29, s30, s31};              \
-     subs          ip, ip, #1;                                                 \
-     bne           vfp_ ## fname ## _loop2;                                    \
-     fmxr          fpscr, lr;                /* restore original fpscr */      \
-   vfp_ ## fname ## _end:                                                      \
--    ldmia         sp!, {fp, pc};        /* recovering from stack and return */   
-+    ldmia         sp!, {fp, pc};        /* recovering from stack and return */
- 
- #define UNROLL_F64_TEMPLATE(fname,finst) \
-   .global vfp_ ## fname ## ;                                                  \
-@@ -244,9 +244,9 @@ UNROLL_F64_TEMPLATE(scalarmultiply_f64_ns,fmul);
-     ands          ip, r2, #3;               /* ip = n % 3 */                  \
-     beq           vfp_ ## fname ## _unroll; /* if ip == 0 goto prep_loop2 */  \
-   vfp_ ## fname ## _loop1:                                                    \
--    fldmiad       r1!, {d0};                                                  \
--    ## finst ##d  d2, d0;                                                     \
--    fstmiad       r0!, {d2};                                                  \
-+    vldmia.f64       r1!, {d0};                                                  \
-+    ## finst  ##.f64 d2, d0;                                                     \
-+    vstmia.f64       r0!, {d2};                                                  \
-     subs          ip, ip, #1;                                                 \
-     bne           vfp_ ## fname ## _loop1;                                    \
-   vfp_ ## fname ## _unroll:                 /* unroll by 4 */                 \
-@@ -257,20 +257,20 @@ UNROLL_F64_TEMPLATE(scalarmultiply_f64_ns,fmul);
-     orr           fp, lr, fp, lsl #16;      /* set vector lenght to 4 */      \
-     fmxr          fpscr, fp;                                                  \
-   vfp_ ## fname ## _loop2:                                                    \
--    fldmiad       r1!, {d4, d5, d6, d7};                                      \
--    ## finst ##d  d12, d4;                                                    \
--    fstmiad       r0!, {d12, d13, d14, d15};                                  \
-+    vldmia.f64       r1!, {d4, d5, d6, d7};                                      \
-+    ## finst  ##.f64 d12, d4;                                                    \
-+    vstmia.f64       r0!, {d12, d13, d14, d15};                                  \
-     subs          ip, ip, #1;                                                 \
-     bne           vfp_ ## fname ## _loop2;                                    \
-     fmxr          fpscr, lr;                /* restore original fpscr */      \
-   vfp_ ## fname ## _end:                                                      \
--    ldmia         sp!, {fp, pc};        /* recovering from stack and return */   
-+    ldmia         sp!, {fp, pc};        /* recovering from stack and return */
- 
--UNROLL_F32_TEMPLATE(abs_f32_f32_ns,fabs);
--UNROLL_F64_TEMPLATE(abs_f64_f64_ns,fabs);
-+UNROLL_F32_TEMPLATE(abs_f32_f32_ns,vabs);
-+UNROLL_F64_TEMPLATE(abs_f64_f64_ns,vabs);
- 
--UNROLL_F32_TEMPLATE(negative_f32,fneg);
--UNROLL_F64_TEMPLATE(negative_f64,fneg);
-+UNROLL_F32_TEMPLATE(negative_f32,vneg);
-+UNROLL_F64_TEMPLATE(negative_f64,vneg);
- 
- #undef UNROLL_F32_TEMPLATE
- #undef UNROLL_F64_TEMPLATE
diff --git a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch b/meta-multimedia/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
deleted file mode 100644
index c8e3c1f72..000000000
--- a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream: https://bugs.freedesktop.org/show_bug.cgi?id=31358
-
-configure: fix whitelisting of x86_64 unaligned memory access
-
-Fix typo in whitelist so cross-compile works for x86_64.
-
-Upstream-Status: Inappropriate [configuration]
-
---- liboil-0.3.17/m4/as-unaligned-access.m4.orig	2009-02-26 14:40:08.000000000 -0500
-+++ liboil-0.3.17/m4/as-unaligned-access.m4	2010-11-03 12:19:55.000000000 -0400
-@@ -9,7 +9,7 @@
-         _AS_ECHO_N([(blacklisted) ])
-         as_cv_unaligned_access=no
- 	;;
--      i?86*|x86_64|amd64|powerpc*|m68k*|cris*)
-+      i?86*|x86_64*|amd64*|powerpc*|m68k*|cris*)
-         _AS_ECHO_N([(whitelisted) ])
-         as_cv_unaligned_access=yes
- 	;;
diff --git a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/fix_riscv_unaligned_access.patch b/meta-multimedia/recipes-support/liboil/liboil-0.3.17/fix_riscv_unaligned_access.patch
deleted file mode 100644
index 448bde73f..000000000
--- a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/fix_riscv_unaligned_access.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-RISC-V supports unaligned accesses, therefore enable it
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/m4/as-unaligned-access.m4
-+++ b/m4/as-unaligned-access.m4
-@@ -5,7 +5,7 @@ AC_DEFUN([AS_UNALIGNED_ACCESS], [
-   AC_MSG_CHECKING([if unaligned memory access works correctly])
-   if test x"$as_cv_unaligned_access" = x ; then
-     case $host in
--      alpha*|arm*|hp*|mips*|sh*|sparc*|ia64*)
-+      alpha*|arm*|hp*|mips*|riscv*|sh*|sparc*|ia64*)
-         _AS_ECHO_N([(blacklisted) ])
-         as_cv_unaligned_access=no
- 	;;
diff --git a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch b/meta-multimedia/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch
deleted file mode 100644
index 473380e9f..000000000
--- a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch
+++ /dev/null
@@ -1,222 +0,0 @@
-Upstream-Status: Pending
-
-Make the assembly syntax compatible with x32 gcc. Othewise x32 gcc throws errors.
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2011/12/01
-
-
-Index: liboil-0.3.17/liboil/amd64/wavelet.c
-===================================================================
---- liboil-0.3.17.orig/liboil/amd64/wavelet.c
-+++ liboil-0.3.17/liboil/amd64/wavelet.c
-@@ -21,14 +21,14 @@ deinterleave2_asm (int16_t *d1, int16_t 
-   asm volatile ("\n"
-       "  sub $2, %%rcx\n"
-       "1:\n"
--      "  movw (%1,%%rcx,4), %%ax\n"
--      "  movw %%ax, (%0,%%rcx,2)\n"
--      "  movw 2(%1,%%rcx,4), %%ax\n"
--      "  movw %%ax, (%2,%%rcx,2)\n"
--      "  movw 4(%1,%%rcx,4), %%ax\n"
--      "  movw %%ax, 2(%0,%%rcx,2)\n"
--      "  movw 6(%1,%%rcx,4), %%ax\n"
--      "  movw %%ax, 2(%2,%%rcx,2)\n"
-+      "  movw (%q1,%%rcx,4), %%ax\n"
-+      "  movw %%ax, (%q0,%%rcx,2)\n"
-+      "  movw 2(%q1,%%rcx,4), %%ax\n"
-+      "  movw %%ax, (%q2,%%rcx,2)\n"
-+      "  movw 4(%q1,%%rcx,4), %%ax\n"
-+      "  movw %%ax, 2(%q0,%%rcx,2)\n"
-+      "  movw 6(%q1,%%rcx,4), %%ax\n"
-+      "  movw %%ax, 2(%q2,%%rcx,2)\n"
-       "  sub $2, %%rcx\n"
-       "  jge 1b\n"
-       : "+r" (d1), "+r" (s_2xn), "+r" (d2), "+c" (n)
-@@ -53,20 +53,20 @@ deinterleave2_mmx (int16_t *d1, int16_t 
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%1,%%rcx,4), %%mm0\n"
--      "  movq 8(%1,%%rcx,4), %%mm1\n"
-+      "  movq (%q1,%%rcx,4), %%mm0\n"
-+      "  movq 8(%q1,%%rcx,4), %%mm1\n"
-       "  pslld $16, %%mm0\n"
-       "  pslld $16, %%mm1\n"
-       "  psrad $16, %%mm0\n"
-       "  psrad $16, %%mm1\n"
-       "  packssdw %%mm1, %%mm0\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
--      "  movq (%1,%%rcx,4), %%mm0\n"
--      "  movq 8(%1,%%rcx,4), %%mm1\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-+      "  movq (%q1,%%rcx,4), %%mm0\n"
-+      "  movq 8(%q1,%%rcx,4), %%mm1\n"
-       "  psrad $16, %%mm0\n"
-       "  psrad $16, %%mm1\n"
-       "  packssdw %%mm1, %%mm0\n"
--      "  movq %%mm0, (%2,%%rcx,2)\n"
-+      "  movq %%mm0, (%q2,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -93,10 +93,10 @@ deinterleave2_mmx_2 (int16_t *d1, int16_
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  pshufw $0xd8, (%1,%%rcx,4), %%mm0\n"
--      "  movd %%mm0, (%0,%%rcx,2)\n"
--      "  pshufw $0x8d, (%1,%%rcx,4), %%mm0\n"
--      "  movd %%mm0, (%2,%%rcx,2)\n"
-+      "  pshufw $0xd8, (%q1,%%rcx,4), %%mm0\n"
-+      "  movd %%mm0, (%q0,%%rcx,2)\n"
-+      "  pshufw $0x8d, (%q1,%%rcx,4), %%mm0\n"
-+      "  movd %%mm0, (%q2,%%rcx,2)\n"
-       "  add $2, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -123,16 +123,16 @@ deinterleave2_mmx_3 (int16_t *d1, int16_
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%1,%%rcx,4), %%mm1\n"
--      "  movq (%1,%%rcx,4), %%mm2\n"
--      "  movq 8(%1,%%rcx,4), %%mm0\n"
-+      "  movq (%q1,%%rcx,4), %%mm1\n"
-+      "  movq (%q1,%%rcx,4), %%mm2\n"
-+      "  movq 8(%q1,%%rcx,4), %%mm0\n"
-       "  punpcklwd %%mm0, %%mm1\n"
-       "  punpckhwd %%mm0, %%mm2\n"
-       "  movq %%mm1, %%mm0\n"
-       "  punpcklwd %%mm2, %%mm0\n"
-       "  punpckhwd %%mm2, %%mm1\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
--      "  movq %%mm1, (%2,%%rcx,2)\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-+      "  movq %%mm1, (%q2,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -159,26 +159,26 @@ deinterleave2_mmx_4 (int16_t *d1, int16_
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%1,%%rcx,4), %%mm1\n"
-+      "  movq (%q1,%%rcx,4), %%mm1\n"
-       "  movq %%mm1, %%mm2\n"
--      "  movq 8(%1,%%rcx,4), %%mm0\n"
--      "   movq 16(%1,%%rcx,4), %%mm5\n"
-+      "  movq 8(%q1,%%rcx,4), %%mm0\n"
-+      "   movq 16(%q1,%%rcx,4), %%mm5\n"
-       "  punpcklwd %%mm0, %%mm1\n"
-       "   movq %%mm5, %%mm6\n"
-       "  punpckhwd %%mm0, %%mm2\n"
--      "   movq 24(%1,%%rcx,4), %%mm4\n"
-+      "   movq 24(%q1,%%rcx,4), %%mm4\n"
-       "  movq %%mm1, %%mm0\n"
-       "   punpcklwd %%mm4, %%mm5\n"
-       "  punpcklwd %%mm2, %%mm0\n"
-       "   punpckhwd %%mm4, %%mm6\n"
-       "  punpckhwd %%mm2, %%mm1\n"
-       "   movq %%mm5, %%mm4\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-       "   punpcklwd %%mm6, %%mm4\n"
--      "  movq %%mm1, (%2,%%rcx,2)\n"
-+      "  movq %%mm1, (%q2,%%rcx,2)\n"
-       "   punpckhwd %%mm6, %%mm5\n"
--      "   movq %%mm4, 8(%0,%%rcx,2)\n"
--      "   movq %%mm5, 8(%2,%%rcx,2)\n"
-+      "   movq %%mm4, 8(%q0,%%rcx,2)\n"
-+      "   movq %%mm5, 8(%q2,%%rcx,2)\n"
-       "  add $8, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -252,13 +252,13 @@ interleave2_mmx (int16_t *d_2xn, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%1,%%rcx,2), %%mm0\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
-+      "  movq (%q1,%%rcx,2), %%mm0\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-       "  movq %%mm0, %%mm2\n"
-       "  punpckhwd %%mm1, %%mm0\n"
-       "  punpcklwd %%mm1, %%mm2\n"
--      "  movq %%mm2, (%0,%%rcx,4)\n"
--      "  movq %%mm0, 8(%0,%%rcx,4)\n"
-+      "  movq %%mm2, (%q0,%%rcx,4)\n"
-+      "  movq %%mm0, 8(%q0,%%rcx,4)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -285,12 +285,12 @@ lift_add_shift1_mmx (int16_t *d, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
--      "  movq (%3,%%rcx,2), %%mm2\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-+      "  movq (%q3,%%rcx,2), %%mm2\n"
-       "  paddw %%mm2, %%mm1\n"
-       "  psraw $1, %%mm1\n"
--      "  paddw (%1,%%rcx,2), %%mm1\n"
--      "  movq %%mm1, (%0,%%rcx,2)\n"
-+      "  paddw (%q1,%%rcx,2), %%mm1\n"
-+      "  movq %%mm1, (%q0,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %4, %%ecx\n"
-       "  jl 1b\n"
-@@ -317,13 +317,13 @@ lift_sub_shift1_mmx (int16_t *d, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
--      "  movq (%3,%%rcx,2), %%mm2\n"
--      "  movq (%1,%%rcx,2), %%mm0\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-+      "  movq (%q3,%%rcx,2), %%mm2\n"
-+      "  movq (%q1,%%rcx,2), %%mm0\n"
-       "  paddw %%mm2, %%mm1\n"
-       "  psraw $1, %%mm1\n"
-       "  psubw %%mm1, %%mm0\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %4, %%ecx\n"
-       "  jl 1b\n"
-@@ -350,12 +350,12 @@ lift_add_shift2_mmx (int16_t *d, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
--      "  movq (%3,%%rcx,2), %%mm2\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-+      "  movq (%q3,%%rcx,2), %%mm2\n"
-       "  paddw %%mm2, %%mm1\n"
-       "  psraw $2, %%mm1\n"
--      "  paddw (%1,%%rcx,2), %%mm1\n"
--      "  movq %%mm1, (%0,%%rcx,2)\n"
-+      "  paddw (%q1,%%rcx,2), %%mm1\n"
-+      "  movq %%mm1, (%q0,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %4, %%ecx\n"
-       "  jl 1b\n"
-@@ -382,13 +382,13 @@ lift_sub_shift2_mmx (int16_t *d, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
--      "  movq (%3,%%rcx,2), %%mm2\n"
--      "  movq (%1,%%rcx,2), %%mm0\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-+      "  movq (%q3,%%rcx,2), %%mm2\n"
-+      "  movq (%q1,%%rcx,2), %%mm0\n"
-       "  paddw %%mm2, %%mm1\n"
-       "  psraw $2, %%mm1\n"
-       "  psubw %%mm1, %%mm0\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %4, %%ecx\n"
-       "  jl 1b\n"
diff --git a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/no-tests.patch b/meta-multimedia/recipes-support/liboil/liboil-0.3.17/no-tests.patch
deleted file mode 100644
index 892d44131..000000000
--- a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/no-tests.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
---- liboil-0.3.9/liboil/liboilfunction.c.old	2006-09-18 13:03:20.000000000 +0100
-+++ liboil-0.3.9/liboil/liboilfunction.c	2006-09-18 13:04:10.000000000 +0100
-@@ -345,7 +345,9 @@
-     return;
-   }
- 
--  test = oil_test_new (klass);
-+  klass->chosen_impl = klass->reference_impl;
-+  klass->func = klass->reference_impl->func;
-+/*  test = oil_test_new (klass);
-   if (test == NULL) {
-     OIL_ERROR ("failed to test function class %s", klass->name);
-     return;
-@@ -385,7 +387,7 @@
-   klass->chosen_impl = min_impl;
-   klass->func = min_impl->func;
- 
--  oil_test_free (test);
-+  oil_test_free (test);*/
- }
- 
- static void
diff --git a/meta-multimedia/recipes-support/liboil/liboil_0.3.17.bb b/meta-multimedia/recipes-support/liboil/liboil_0.3.17.bb
deleted file mode 100644
index 654ee1e88..000000000
--- a/meta-multimedia/recipes-support/liboil/liboil_0.3.17.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Library of simple functions optimized for various CPUs"
-HOMEPAGE = "http://liboil.freedesktop.org/"
-BUGTRACKER = "https://bugs.freedesktop.org/"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ad80780d9c5205d63481a0184e199a15 \
-                    file://liboil/liboil.h;endline=28;md5=95c794a66b88800d949fed17e437d9fb \
-                    file://liboil/liboilcpu.c;endline=28;md5=89da69a61d88eedcba066f42353fb75a \
-                    file://examples/example1.c;endline=29;md5=9d4dad9fcbbdf0441ee063f8af5170c9 \
-                    file://testsuite/trans.c;endline=29;md5=380ecd43121fe3dcc0d8d7e5984f283d"
-
-DEPENDS = "glib-2.0"
-PR = "r5"
-
-SRC_URI = "http://liboil.freedesktop.org/download/${BPN}-${PV}.tar.gz \
-           file://no-tests.patch \
-           file://fix-unaligned-whitelist.patch \
-           file://0001-Fix-enable-vfp-flag.patch \
-           file://liboil_fix_for_x32.patch \
-           file://0001-math_vfp_asm.S-Convert-fldmia-fstmia-instructions-to.patch \
-           file://fix_riscv_unaligned_access.patch \
-           "
-
-SRC_URI[md5sum] = "47dc734f82faeb2964d97771cfd2e701"
-SRC_URI[sha256sum] = "105f02079b0b50034c759db34b473ecb5704ffa20a5486b60a8b7698128bfc69"
-
-inherit autotools pkgconfig
-
-ARM_INSTRUCTION_SET = "arm"
-- 
2.17.1


