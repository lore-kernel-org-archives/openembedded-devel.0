Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 48B416BCA9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 17:31:25 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id e5so1494880plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2019 09:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ogx74y939QU+nJxNPOCM7KYjhWYoswUeFYxFGBNjr9U=;
	b=YcOuAuRnkBZmfSFN95x1igyS5OOiBbU4+yMa0RsZpc9Rp1PmLklFvrW552OxBaYp15
	m8Ei0v40YwlvAKLnG1a6cn7kompgNqXfZO8ym4ZXwIkuivIoqZ1fDGewGooJNpcsvQ57
	Ff2XXGAW7UIIcUNEloffqYLsbrf076DP4m4M2DNDw9TZYiYpo7uqWsjZHRwWX6WnVIeR
	7KBFAgLcnyaEZQf5rBeYUyxWbK85DL4QDsI0JPZgDKp4Dfe+igyyUlNrg4rOvhNFDvUR
	P11bL/8VYx6Dtq50YB9+CnDl9/E7PgIuWSvIGZz7dWHSflOtPpzCCDCQJ+9kZS0keQgE
	92LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ogx74y939QU+nJxNPOCM7KYjhWYoswUeFYxFGBNjr9U=;
	b=EXs4Bo/JPdRIZwEcWLpajkvtq9Vh8d45l1M1J9mmhoRReSEptWtHzRT9bjNukRMqhW
	4AxtY7MTPRSdYhsvRvz8ehChO5czPt9YgCX6nugRbG80q+QOZqi5Fn8avyH8dCl2yat5
	6tVbuR+T7fGP2HAAowuQE7dOSdb+whpho0O10lyP1xOHr3GZ82WRL5rOu7Gu31NBg3sN
	XYClhzegVcFarfpr7ZIUdMIsIZ+LGFHMTt7aCbM7GG9mCS6YgakNPttS5KtPDz33tdhP
	/Jd/FRIcw+4briz2Fq/hNAhwaA5sww6QVl7Mk+SIFgnhmHTXCV+tuMn8cnnd98tXpvYq
	CaHw==
X-Gm-Message-State: AHQUAub0Rem78I6xHWR6T3BAQw0iUM781a8VfH3SmueXYZqBEPEV/2eR
	ObbAhTFdtFDP14TQqm9afrGLJooC
X-Google-Smtp-Source: AHgI3IYI0IvyEfKceO9r0thTbleqT3Fq2nVpMgFFEZm0+c2/bRQdl08Zs4y6hdgVoFqVs2Et/zJHTQ==
X-Received: by 2002:a17:902:145:: with SMTP id
	63mr1595010plb.256.1550079085426; 
	Wed, 13 Feb 2019 09:31:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	h15sm21528945pgl.43.2019.02.13.09.31.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 09:31:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Feb 2019 09:31:13 -0800
Message-Id: <20190213173118.44597-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 1/6] liboil: Fix build with clang
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
X-List-Received-Date: Wed, 13 Feb 2019 17:31:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...onvert-fldmia-fstmia-instructions-to.patch | 257 ++++++++++++++++++
 .../recipes-support/liboil/liboil_0.3.17.bb   |   3 +-
 2 files changed, 259 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-support/liboil/liboil-0.3.17/0001-math_vfp_asm.S-Convert-fldmia-fstmia-instructions-to.patch

diff --git a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/0001-math_vfp_asm.S-Convert-fldmia-fstmia-instructions-to.patch b/meta-multimedia/recipes-support/liboil/liboil-0.3.17/0001-math_vfp_asm.S-Convert-fldmia-fstmia-instructions-to.patch
new file mode 100644
index 0000000000..05903807e0
--- /dev/null
+++ b/meta-multimedia/recipes-support/liboil/liboil-0.3.17/0001-math_vfp_asm.S-Convert-fldmia-fstmia-instructions-to.patch
@@ -0,0 +1,257 @@
+From 02a138f0b247fb08b799f32c49b35912b2921321 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Feb 2019 11:38:46 -0800
+Subject: [PATCH] math_vfp_asm.S: Convert fldmia/fstmia instructions to UAL
+ syntax for clang
+
+This is flagged with clang internal assembler, since it does not allow
+non UAL syntax
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ liboil/arm/math_vfp_asm.S | 94 +++++++++++++++++++--------------------
+ 1 file changed, 47 insertions(+), 47 deletions(-)
+
+diff --git a/liboil/arm/math_vfp_asm.S b/liboil/arm/math_vfp_asm.S
+index ae5c803..3dd14d9 100644
+--- a/liboil/arm/math_vfp_asm.S
++++ b/liboil/arm/math_vfp_asm.S
+@@ -25,7 +25,7 @@
+  */
+ 
+ #if defined(__VFP_FP__) && !defined(__SOFTFP__)
+-/* 
++/*
+ ** compile with -mcpu=arm1136j-s -mfpu=vfp -mfloat-abi=softfp
+ **
+ ** void vfp_add_f32 (float *d, const float *s1, const float *s2, int n);
+@@ -48,10 +48,10 @@
+     ands          ip, r3, #7;               /* ip = n % 8 */                  \
+     beq           vfp_ ## fname ## _unroll; /* if ip == 0 goto prep_loop2 */  \
+   vfp_ ## fname ## _loop1:                                                    \
+-    fldmias       r1!, {s0};                                                  \
+-    fldmias       r2!, {s1};                                                  \
++    vldmia.f32       r1!, {s0};                                                  \
++    vldmia.f32       r2!, {s1};                                                  \
+     ## finst ##s  s2, s0, s1;                                                 \
+-    fstmias       r0!, {s2};                                                  \
++    vstmia.f32       r0!, {s2};                                                  \
+     subs          ip, ip, #1;                                                 \
+     bne           vfp_ ## fname ## _loop1;                                    \
+   vfp_ ## fname ## _unroll:                 /* unroll by 8 */                 \
+@@ -62,15 +62,15 @@
+     orr           fp, lr, fp, lsl #16;      /* set vector lenght to 8 */      \
+     fmxr          fpscr, fp;                                                  \
+   vfp_ ## fname ## _loop2:                                                    \
+-    fldmias       r1!, {s8, s9, s10, s11, s12, s13, s14, s15};                \
+-    fldmias       r2!, {s16, s17, s18, s19, s20, s21, s22, s23};              \
++    vldmia.f32       r1!, {s8, s9, s10, s11, s12, s13, s14, s15};                \
++    vldmia.f32       r2!, {s16, s17, s18, s19, s20, s21, s22, s23};              \
+     ## finst ##s  s24, s8, s16;                                               \
+-    fstmias       r0!, {s24, s25, s26, s27, s28, s29, s30, s31};              \
++    vstmia.f32       r0!, {s24, s25, s26, s27, s28, s29, s30, s31};              \
+     subs          ip, ip, #1;                                                 \
+     bne           vfp_ ## fname ## _loop2;                                    \
+     fmxr          fpscr, lr;                /* restore original fpscr */      \
+   vfp_ ## fname ## _end:                                                      \
+-    ldmia         sp!, {fp, pc};        /* recovering from stack and return */   
++    ldmia         sp!, {fp, pc};        /* recovering from stack and return */
+ 
+ #define UNROLL_F64_TEMPLATE(fname,finst) \
+   .global vfp_ ## fname ## ;                                                  \
+@@ -79,10 +79,10 @@
+     ands          ip, r3, #3;               /* ip = n % 3 */                  \
+     beq           vfp_ ## fname ## _unroll; /* if ip == 0 goto prep_loop2 */  \
+   vfp_ ## fname ## _loop1:                                                    \
+-    fldmiad       r1!, {d0};                                                  \
+-    fldmiad       r2!, {d1};                                                  \
++    vldmia.f64       r1!, {d0};                                                  \
++    vldmia.f64       r2!, {d1};                                                  \
+     ## finst ##d  d2, d0, d1;                                                 \
+-    fstmiad       r0!, {d2};                                                  \
++    vstmia.f64       r0!, {d2};                                                  \
+     subs          ip, ip, #1;                                                 \
+     bne           vfp_ ## fname ## _loop1;                                    \
+   vfp_ ## fname ## _unroll:                 /* unroll by 4 */                 \
+@@ -93,15 +93,15 @@
+     orr           fp, lr, fp, lsl #16;      /* set vector lenght to 8 */      \
+     fmxr          fpscr, fp;                                                  \
+   vfp_ ## fname ## _loop2:                                                    \
+-    fldmiad       r1!, {d4, d5, d6, d7};                                      \
+-    fldmiad       r2!, {d8, d9, d10, d11};                                    \
++    vldmia.f64       r1!, {d4, d5, d6, d7};                                      \
++    vldmia.f64       r2!, {d8, d9, d10, d11};                                    \
+     ## finst ##d  d12, d4, d8;                                                \
+-    fstmiad       r0!, {d12, d13, d14, d15};                                  \
++    vstmia.f64       r0!, {d12, d13, d14, d15};                                  \
+     subs          ip, ip, #1;                                                 \
+     bne           vfp_ ## fname ## _loop2;                                    \
+     fmxr          fpscr, lr;                /* restore original fpscr */      \
+   vfp_ ## fname ## _end:                                                      \
+-    ldmia         sp!, {fp, pc};        /* recovering from stack and return */   
++    ldmia         sp!, {fp, pc};        /* recovering from stack and return */
+ 
+ .align 2
+ UNROLL_F32_TEMPLATE(add_f32,fadd);
+@@ -119,7 +119,7 @@ UNROLL_F64_TEMPLATE(subtract_f64,fsub);
+ #undef UNROLL_F32_TEMPLATE
+ #undef UNROLL_F64_TEMPLATE
+ 
+-/* 
++/*
+ **
+ ** void vfp_scalaradd_f32_ns (float *d, const float *s1, const float *s2_1, int n);
+ ** void vfp_scalaradd_f64_ns (double *d, const double *s1, const double *s2_1, int n);
+@@ -133,13 +133,13 @@ UNROLL_F64_TEMPLATE(subtract_f64,fsub);
+   .global vfp_ ## fname ## ;                                                  \
+   vfp_ ## fname ## :                                                          \
+     stmdb         sp!, {fp, lr};            /* save registers to stack */     \
+-    fldmias       r2, {s1};                 /* load scalar value */           \
++    vldmia.f32       r2, {s1};                 /* load scalar value */           \
+     ands          ip, r3, #7;               /* ip = n % 8 */                  \
+     beq           vfp_ ## fname ## _unroll; /* if ip == 0 goto prep_loop2 */  \
+   vfp_ ## fname ## _loop1:                                                    \
+-    fldmias       r1!, {s0};                                                  \
++    vldmia.f32       r1!, {s0};                                                  \
+     ## finst ##s  s2, s0, s1;                                                 \
+-    fstmias       r0!, {s2};                                                  \
++    vstmia.f32       r0!, {s2};                                                  \
+     subs          ip, ip, #1;                                                 \
+     bne           vfp_ ## fname ## _loop1;                                    \
+   vfp_ ## fname ## _unroll:                 /* unroll by 8 */                 \
+@@ -150,26 +150,26 @@ UNROLL_F64_TEMPLATE(subtract_f64,fsub);
+     orr           fp, lr, fp, lsl #16;      /* set vector lenght to 8 */      \
+     fmxr          fpscr, fp;                                                  \
+   vfp_ ## fname ## _loop2:                                                    \
+-    fldmias       r1!, {s8, s9, s10, s11, s12, s13, s14, s15};                \
++    vldmia.f32       r1!, {s8, s9, s10, s11, s12, s13, s14, s15};                \
+     ## finst ##s  s24, s8, s1;                                                \
+-    fstmias       r0!, {s24, s25, s26, s27, s28, s29, s30, s31};              \
++    vstmia.f32       r0!, {s24, s25, s26, s27, s28, s29, s30, s31};              \
+     subs          ip, ip, #1;                                                 \
+     bne           vfp_ ## fname ## _loop2;                                    \
+     fmxr          fpscr, lr;                /* restore original fpscr */      \
+   vfp_ ## fname ## _end:                                                      \
+-    ldmia         sp!, {fp, pc};        /* recovering from stack and return */   
++    ldmia         sp!, {fp, pc};        /* recovering from stack and return */
+ 
+ #define UNROLL_F64_TEMPLATE(fname,finst) \
+   .global vfp_ ## fname ## ;                                                  \
+   vfp_ ## fname ## :                                                          \
+     stmdb         sp!, {fp, lr};            /* save registers to stack */     \
+-    fldmiad       r2, {d1};                 /* load scalar value */           \
++    vldmia.f64       r2, {d1};                 /* load scalar value */           \
+     ands          ip, r3, #3;               /* ip = n % 3 */                  \
+     beq           vfp_ ## fname ## _unroll; /* if ip == 0 goto prep_loop2 */  \
+   vfp_ ## fname ## _loop1:                                                    \
+-    fldmiad       r1!, {d0};                                                  \
++    vldmia.f64       r1!, {d0};                                                  \
+     ## finst ##d  d2, d0, d1;                                                 \
+-    fstmiad       r0!, {d2};                                                  \
++    vstmia.f64       r0!, {d2};                                                  \
+     subs          ip, ip, #1;                                                 \
+     bne           vfp_ ## fname ## _loop1;                                    \
+   vfp_ ## fname ## _unroll:                 /* unroll by 4 */                 \
+@@ -180,14 +180,14 @@ UNROLL_F64_TEMPLATE(subtract_f64,fsub);
+     orr           fp, lr, fp, lsl #16;      /* set vector lenght to 4 */      \
+     fmxr          fpscr, fp;                                                  \
+   vfp_ ## fname ## _loop2:                                                    \
+-    fldmiad       r1!, {d4, d5, d6, d7};                                      \
++    vldmia.f64       r1!, {d4, d5, d6, d7};                                      \
+     ## finst ##d  d12, d4, d1;                                                \
+-    fstmiad       r0!, {d12, d13, d14, d15};                                  \
++    vstmia.f64       r0!, {d12, d13, d14, d15};                                  \
+     subs          ip, ip, #1;                                                 \
+     bne           vfp_ ## fname ## _loop2;                                    \
+     fmxr          fpscr, lr;                /* restore original fpscr */      \
+   vfp_ ## fname ## _end:                                                      \
+-    ldmia         sp!, {fp, pc};        /* recovering from stack and return */   
++    ldmia         sp!, {fp, pc};        /* recovering from stack and return */
+ 
+ UNROLL_F32_TEMPLATE(scalaradd_f32_ns,fadd);
+ UNROLL_F64_TEMPLATE(scalaradd_f64_ns,fadd);
+@@ -198,7 +198,7 @@ UNROLL_F64_TEMPLATE(scalarmultiply_f64_ns,fmul);
+ #undef UNROLL_F32_TEMPLATE
+ #undef UNROLL_F64_TEMPLATE
+ 
+-/* 
++/*
+ **
+ ** void vfp_abs_f32_f32_ns(float *d, const float *s, int n);
+ ** void vfp_abs_f64_f64_ns(double *d, const double *s, int n);
+@@ -215,9 +215,9 @@ UNROLL_F64_TEMPLATE(scalarmultiply_f64_ns,fmul);
+     ands          ip, r2, #7;               /* ip = n % 8 */                  \
+     beq           vfp_ ## fname ## _unroll; /* if ip == 0 goto prep_loop2 */  \
+   vfp_ ## fname ## _loop1:                                                    \
+-    fldmias       r1!, {s0};                                                  \
+-    ## finst ##s  s2, s0;                                                     \
+-    fstmias       r0!, {s2};                                                  \
++    vldmia.f32       r1!, {s0};                                                  \
++    ## finst ##.f32  s2, s0;                                                     \
++    vstmia.f32       r0!, {s2};                                                  \
+     subs          ip, ip, #1;                                                 \
+     bne           vfp_ ## fname ## _loop1;                                    \
+   vfp_ ## fname ## _unroll:                 /* unroll by 8 */                 \
+@@ -228,14 +228,14 @@ UNROLL_F64_TEMPLATE(scalarmultiply_f64_ns,fmul);
+     orr           fp, lr, fp, lsl #16;      /* set vector lenght to 8 */      \
+     fmxr          fpscr, fp;                                                  \
+   vfp_ ## fname ## _loop2:                                                    \
+-    fldmias       r1!, {s8, s9, s10, s11, s12, s13, s14, s15};                \
+-    ## finst ##s  s24, s8;                                                    \
+-    fstmias       r0!, {s24, s25, s26, s27, s28, s29, s30, s31};              \
++    vldmia.f32       r1!, {s8, s9, s10, s11, s12, s13, s14, s15};                \
++    ## finst  ##.f32 s24, s8;                                                    \
++    vstmia.f32       r0!, {s24, s25, s26, s27, s28, s29, s30, s31};              \
+     subs          ip, ip, #1;                                                 \
+     bne           vfp_ ## fname ## _loop2;                                    \
+     fmxr          fpscr, lr;                /* restore original fpscr */      \
+   vfp_ ## fname ## _end:                                                      \
+-    ldmia         sp!, {fp, pc};        /* recovering from stack and return */   
++    ldmia         sp!, {fp, pc};        /* recovering from stack and return */
+ 
+ #define UNROLL_F64_TEMPLATE(fname,finst) \
+   .global vfp_ ## fname ## ;                                                  \
+@@ -244,9 +244,9 @@ UNROLL_F64_TEMPLATE(scalarmultiply_f64_ns,fmul);
+     ands          ip, r2, #3;               /* ip = n % 3 */                  \
+     beq           vfp_ ## fname ## _unroll; /* if ip == 0 goto prep_loop2 */  \
+   vfp_ ## fname ## _loop1:                                                    \
+-    fldmiad       r1!, {d0};                                                  \
+-    ## finst ##d  d2, d0;                                                     \
+-    fstmiad       r0!, {d2};                                                  \
++    vldmia.f64       r1!, {d0};                                                  \
++    ## finst  ##.f64 d2, d0;                                                     \
++    vstmia.f64       r0!, {d2};                                                  \
+     subs          ip, ip, #1;                                                 \
+     bne           vfp_ ## fname ## _loop1;                                    \
+   vfp_ ## fname ## _unroll:                 /* unroll by 4 */                 \
+@@ -257,20 +257,20 @@ UNROLL_F64_TEMPLATE(scalarmultiply_f64_ns,fmul);
+     orr           fp, lr, fp, lsl #16;      /* set vector lenght to 4 */      \
+     fmxr          fpscr, fp;                                                  \
+   vfp_ ## fname ## _loop2:                                                    \
+-    fldmiad       r1!, {d4, d5, d6, d7};                                      \
+-    ## finst ##d  d12, d4;                                                    \
+-    fstmiad       r0!, {d12, d13, d14, d15};                                  \
++    vldmia.f64       r1!, {d4, d5, d6, d7};                                      \
++    ## finst  ##.f64 d12, d4;                                                    \
++    vstmia.f64       r0!, {d12, d13, d14, d15};                                  \
+     subs          ip, ip, #1;                                                 \
+     bne           vfp_ ## fname ## _loop2;                                    \
+     fmxr          fpscr, lr;                /* restore original fpscr */      \
+   vfp_ ## fname ## _end:                                                      \
+-    ldmia         sp!, {fp, pc};        /* recovering from stack and return */   
++    ldmia         sp!, {fp, pc};        /* recovering from stack and return */
+ 
+-UNROLL_F32_TEMPLATE(abs_f32_f32_ns,fabs);
+-UNROLL_F64_TEMPLATE(abs_f64_f64_ns,fabs);
++UNROLL_F32_TEMPLATE(abs_f32_f32_ns,vabs);
++UNROLL_F64_TEMPLATE(abs_f64_f64_ns,vabs);
+ 
+-UNROLL_F32_TEMPLATE(negative_f32,fneg);
+-UNROLL_F64_TEMPLATE(negative_f64,fneg);
++UNROLL_F32_TEMPLATE(negative_f32,vneg);
++UNROLL_F64_TEMPLATE(negative_f64,vneg);
+ 
+ #undef UNROLL_F32_TEMPLATE
+ #undef UNROLL_F64_TEMPLATE
diff --git a/meta-multimedia/recipes-support/liboil/liboil_0.3.17.bb b/meta-multimedia/recipes-support/liboil/liboil_0.3.17.bb
index 03b7785215..7e8aa1572a 100644
--- a/meta-multimedia/recipes-support/liboil/liboil_0.3.17.bb
+++ b/meta-multimedia/recipes-support/liboil/liboil_0.3.17.bb
@@ -17,7 +17,8 @@ SRC_URI = "http://liboil.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://fix-unaligned-whitelist.patch \
            file://0001-Fix-enable-vfp-flag.patch \
            file://liboil_fix_for_x32.patch \
-          "
+           file://0001-math_vfp_asm.S-Convert-fldmia-fstmia-instructions-to.patch \
+           "
 
 SRC_URI[md5sum] = "47dc734f82faeb2964d97771cfd2e701"
 SRC_URI[sha256sum] = "105f02079b0b50034c759db34b473ecb5704ffa20a5486b60a8b7698128bfc69"
-- 
2.20.1


