Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id B6AB66E74B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 10:47:47 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id g10so3887584wiw.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:47:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2rFh97SQh3KCoTHkJkk9Z+oN0GIs7etwYdjAz7gwapo=;
	b=FjzCf4HalZ/Qh0S87s6vG7U2PVqhXdUHHH7y/tdUYk+SiOki8+Geyysq0hi843MJsX
	IGReGB74Iq6Bh8DTp3EzV0k6bCXQal9dv6QAuo1WR5fSusjpdQLYo46q5D/63Jh91vF4
	3+zo53YtUiryOyP/fdFtW2DMxpw0DURurg87ffvCl0/QFCCxF7k+Rcdu3HjjUwV+5+0O
	aKelKRFwEZBTmgOkIdMdmy2j4oMfRE3ABJAXbNTqsLtLREPKp1qjnKKdoAwuuaAbOXrW
	Ny1v2Kc5bPRHmsD7VpNTh8cmS+dQs5zBGbkNpivPEP6pFsPfU/dIgwoOHMMqa5QL8CIn
	WP2Q==
X-Gm-Message-State: ALoCoQnXNTKmuOgXTD64rmq/mim1dQmQpl8tsUs2e8xVf93niW57OPjRSKDP70zdwWX+/iCOZLLD
X-Received: by 10.194.87.5 with SMTP id t5mr1544965wjz.68.1389782868241;
	Wed, 15 Jan 2014 02:47:48 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j3sm6016854wiy.3.2014.01.15.02.47.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 02:47:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 10:47:34 +0000
Message-Id: <1389782854-14355-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389782854-14355-1-git-send-email-ross.burton@intel.com>
References: <1389782854-14355-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][meta-oe 5/5] python-numpy: remove, migrated to oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jan 2014 10:47:49 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python-numpy/aarch64/_numpyconfig.h     |   30 -----
 .../python/python-numpy/aarch64/config.h           |  139 --------------------
 .../python/python-numpy/arm/config.h               |   21 ---
 .../python/python-numpy/arm/numpyconfig.h          |   17 ---
 .../python/python-numpy/armeb/config.h             |   21 ---
 .../python/python-numpy/armeb/numpyconfig.h        |   17 ---
 .../python/python-numpy/i586/config.h              |  108 ---------------
 .../python/python-numpy/i586/numpyconfig.h         |   24 ----
 .../python/python-numpy/mipsel/config.h            |   21 ---
 .../python/python-numpy/mipsel/numpyconfig.h       |   17 ---
 .../python/python-numpy/powerpc/config.h           |   21 ---
 .../python/python-numpy/powerpc/numpyconfig.h      |   17 ---
 .../python/python-numpy/powerpc64/_numpyconfig.h   |   30 -----
 .../python/python-numpy/powerpc64/config.h         |  139 --------------------
 .../python/python-numpy/trycompile.diff            |   33 -----
 .../python/python-numpy/unbreak-assumptions.diff   |   16 ---
 .../python/python-numpy/x86-64/_numpyconfig.h      |   30 -----
 .../python/python-numpy/x86-64/config.h            |  139 --------------------
 .../recipes-devtools/python/python-numpy_1.7.0.bb  |   87 ------------
 19 files changed, 927 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/aarch64/config.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/arm/config.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/arm/numpyconfig.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/armeb/config.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/armeb/numpyconfig.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/i586/config.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/i586/numpyconfig.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/mipsel/config.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/mipsel/numpyconfig.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/powerpc/config.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/powerpc/numpyconfig.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/powerpc64/config.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/trycompile.diff
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/x86-64/config.h
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb

diff --git a/meta-oe/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h b/meta-oe/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
deleted file mode 100644
index be57ac2..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
+++ /dev/null
@@ -1,30 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_SIZEOF_PY_INTPTR_T 8
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x00000007
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy/aarch64/config.h b/meta-oe/recipes-devtools/python/python-numpy/aarch64/config.h
deleted file mode 100644
index c30b868..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/aarch64/config.h
+++ /dev/null
@@ -1,139 +0,0 @@
-#define HAVE_ENDIAN_H 1
-#define SIZEOF_PY_INTPTR_T 8
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy/arm/config.h b/meta-oe/recipes-devtools/python/python-numpy/arm/config.h
deleted file mode 100644
index 17ef186..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/arm/config.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
-/* #define SIZEOF_SHORT 2 */
-/* #define SIZEOF_INT 4 */
-/* #define SIZEOF_LONG 4 */
-/* #define SIZEOF_FLOAT 4 */
-/* #define SIZEOF_DOUBLE 8 */
-#define SIZEOF_LONG_DOUBLE 12
-#define SIZEOF_PY_INTPTR_T 4
-/* #define SIZEOF_LONG_LONG 8 */
-#define SIZEOF_PY_LONG_LONG 8
-/* #define CHAR_BIT 8 */
-#define MATHLIB m
-#define HAVE_FLOAT_FUNCS
-#define HAVE_LOG1P
-#define HAVE_EXPM1
-#define HAVE_INVERSE_HYPERBOLIC
-#define HAVE_INVERSE_HYPERBOLIC_FLOAT
-#define HAVE_ISNAN
-#define HAVE_ISINF
-#define HAVE_RINT
-
diff --git a/meta-oe/recipes-devtools/python/python-numpy/arm/numpyconfig.h b/meta-oe/recipes-devtools/python/python-numpy/arm/numpyconfig.h
deleted file mode 100644
index c4bf654..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/arm/numpyconfig.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
-/*
- *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
- *   */
-#define NPY_SIZEOF_SHORT 2 
-#define NPY_SIZEOF_INT 4 
-#define NPY_SIZEOF_LONG 4 
-#define NPY_SIZEOF_FLOAT 4 
-#define NPY_SIZEOF_DOUBLE 8 
-#define NPY_SIZEOF_LONGDOUBLE 12 
-#define NPY_SIZEOF_PY_INTPTR_T 4 
-#define NPY_NO_SMP 0
-
-#define NPY_SIZEOF_LONGLONG 8 
-#define NPY_SIZEOF_PY_LONG_LONG 8 
-/* #define CHAR_BIT 8 */
-
diff --git a/meta-oe/recipes-devtools/python/python-numpy/armeb/config.h b/meta-oe/recipes-devtools/python/python-numpy/armeb/config.h
deleted file mode 100644
index 17ef186..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/armeb/config.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
-/* #define SIZEOF_SHORT 2 */
-/* #define SIZEOF_INT 4 */
-/* #define SIZEOF_LONG 4 */
-/* #define SIZEOF_FLOAT 4 */
-/* #define SIZEOF_DOUBLE 8 */
-#define SIZEOF_LONG_DOUBLE 12
-#define SIZEOF_PY_INTPTR_T 4
-/* #define SIZEOF_LONG_LONG 8 */
-#define SIZEOF_PY_LONG_LONG 8
-/* #define CHAR_BIT 8 */
-#define MATHLIB m
-#define HAVE_FLOAT_FUNCS
-#define HAVE_LOG1P
-#define HAVE_EXPM1
-#define HAVE_INVERSE_HYPERBOLIC
-#define HAVE_INVERSE_HYPERBOLIC_FLOAT
-#define HAVE_ISNAN
-#define HAVE_ISINF
-#define HAVE_RINT
-
diff --git a/meta-oe/recipes-devtools/python/python-numpy/armeb/numpyconfig.h b/meta-oe/recipes-devtools/python/python-numpy/armeb/numpyconfig.h
deleted file mode 100644
index c4bf654..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/armeb/numpyconfig.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
-/*
- *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
- *   */
-#define NPY_SIZEOF_SHORT 2 
-#define NPY_SIZEOF_INT 4 
-#define NPY_SIZEOF_LONG 4 
-#define NPY_SIZEOF_FLOAT 4 
-#define NPY_SIZEOF_DOUBLE 8 
-#define NPY_SIZEOF_LONGDOUBLE 12 
-#define NPY_SIZEOF_PY_INTPTR_T 4 
-#define NPY_NO_SMP 0
-
-#define NPY_SIZEOF_LONGLONG 8 
-#define NPY_SIZEOF_PY_LONG_LONG 8 
-/* #define CHAR_BIT 8 */
-
diff --git a/meta-oe/recipes-devtools/python/python-numpy/i586/config.h b/meta-oe/recipes-devtools/python/python-numpy/i586/config.h
deleted file mode 100644
index 08e41e3..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/i586/config.h
+++ /dev/null
@@ -1,108 +0,0 @@
-#define SIZEOF_PY_INTPTR_T 4
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN
-#define HAVE_COS
-#define HAVE_TAN
-#define HAVE_SINH
-#define HAVE_COSH
-#define HAVE_TANH
-#define HAVE_FABS
-#define HAVE_FLOOR
-#define HAVE_CEIL
-#define HAVE_SQRT
-#define HAVE_LOG10
-#define HAVE_LOG
-#define HAVE_EXP
-#define HAVE_ASIN
-#define HAVE_ACOS
-#define HAVE_ATAN
-#define HAVE_FMOD
-#define HAVE_MODF
-#define HAVE_FREXP
-#define HAVE_LDEXP
-#define HAVE_RINT
-#define HAVE_TRUNC
-#define HAVE_EXP2
-#define HAVE_LOG2
-#define HAVE_ATAN2
-#define HAVE_POW
-#define HAVE_NEXTAFTER
-#define HAVE_SINF
-#define HAVE_COSF
-#define HAVE_TANF
-#define HAVE_SINHF
-#define HAVE_COSHF
-#define HAVE_TANHF
-#define HAVE_FABSF
-#define HAVE_FLOORF
-#define HAVE_CEILF
-#define HAVE_RINTF
-#define HAVE_TRUNCF
-#define HAVE_SQRTF
-#define HAVE_LOG10F
-#define HAVE_LOGF
-#define HAVE_LOG1PF
-#define HAVE_EXPF
-#define HAVE_EXPM1F
-#define HAVE_ASINF
-#define HAVE_ACOSF
-#define HAVE_ATANF
-#define HAVE_ASINHF
-#define HAVE_ACOSHF
-#define HAVE_ATANHF
-#define HAVE_HYPOTF
-#define HAVE_ATAN2F
-#define HAVE_POWF
-#define HAVE_FMODF
-#define HAVE_MODFF
-#define HAVE_FREXPF
-#define HAVE_LDEXPF
-#define HAVE_EXP2F
-#define HAVE_LOG2F
-#define HAVE_COPYSIGNF
-#define HAVE_NEXTAFTERF
-#define HAVE_SINL
-#define HAVE_COSL
-#define HAVE_TANL
-#define HAVE_SINHL
-#define HAVE_COSHL
-#define HAVE_TANHL
-#define HAVE_FABSL
-#define HAVE_FLOORL
-#define HAVE_CEILL
-#define HAVE_RINTL
-#define HAVE_TRUNCL
-#define HAVE_SQRTL
-#define HAVE_LOG10L
-#define HAVE_LOGL
-#define HAVE_LOG1PL
-#define HAVE_EXPL
-#define HAVE_EXPM1L
-#define HAVE_ASINL
-#define HAVE_ACOSL
-#define HAVE_ATANL
-#define HAVE_ASINHL
-#define HAVE_ACOSHL
-#define HAVE_ATANHL
-#define HAVE_HYPOTL
-#define HAVE_ATAN2L
-#define HAVE_POWL
-#define HAVE_FMODL
-#define HAVE_MODFL
-#define HAVE_FREXPL
-#define HAVE_LDEXPL
-#define HAVE_EXP2L
-#define HAVE_LOG2L
-#define HAVE_COPYSIGNL
-#define HAVE_NEXTAFTERL
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H
-#define HAVE_LDOUBLE_INTEL_EXTENDED_12_BYTES_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy/i586/numpyconfig.h b/meta-oe/recipes-devtools/python/python-numpy/i586/numpyconfig.h
deleted file mode 100644
index ff7938c..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/i586/numpyconfig.h
+++ /dev/null
@@ -1,24 +0,0 @@
-#ifndef _NPY_NUMPYCONFIG_H_
-#define _NPY_NUMPYCONFIG_H_
-
-#include "_numpyconfig.h"
-
-/* 
- * On Mac OS X, because there is only one configuration stage for all the archs
- * in universal builds, any macro which depends on the arch needs to be
- * harcoded
- */
-#ifdef __APPLE__
-	#undef NPY_SIZEOF_LONG
-	#undef NPY_SIZEOF_PY_INTPTR_T
-
-	#ifdef __LP64__
-		#define NPY_SIZEOF_LONG 		8
-		#define NPY_SIZEOF_PY_INTPTR_T 	8
-	#else
-		#define NPY_SIZEOF_LONG 		4
-		#define NPY_SIZEOF_PY_INTPTR_T 	4
-	#endif
-#endif
-
-#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy/mipsel/config.h b/meta-oe/recipes-devtools/python/python-numpy/mipsel/config.h
deleted file mode 100644
index 17ef186..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/mipsel/config.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
-/* #define SIZEOF_SHORT 2 */
-/* #define SIZEOF_INT 4 */
-/* #define SIZEOF_LONG 4 */
-/* #define SIZEOF_FLOAT 4 */
-/* #define SIZEOF_DOUBLE 8 */
-#define SIZEOF_LONG_DOUBLE 12
-#define SIZEOF_PY_INTPTR_T 4
-/* #define SIZEOF_LONG_LONG 8 */
-#define SIZEOF_PY_LONG_LONG 8
-/* #define CHAR_BIT 8 */
-#define MATHLIB m
-#define HAVE_FLOAT_FUNCS
-#define HAVE_LOG1P
-#define HAVE_EXPM1
-#define HAVE_INVERSE_HYPERBOLIC
-#define HAVE_INVERSE_HYPERBOLIC_FLOAT
-#define HAVE_ISNAN
-#define HAVE_ISINF
-#define HAVE_RINT
-
diff --git a/meta-oe/recipes-devtools/python/python-numpy/mipsel/numpyconfig.h b/meta-oe/recipes-devtools/python/python-numpy/mipsel/numpyconfig.h
deleted file mode 100644
index c4bf654..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/mipsel/numpyconfig.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
-/*
- *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
- *   */
-#define NPY_SIZEOF_SHORT 2 
-#define NPY_SIZEOF_INT 4 
-#define NPY_SIZEOF_LONG 4 
-#define NPY_SIZEOF_FLOAT 4 
-#define NPY_SIZEOF_DOUBLE 8 
-#define NPY_SIZEOF_LONGDOUBLE 12 
-#define NPY_SIZEOF_PY_INTPTR_T 4 
-#define NPY_NO_SMP 0
-
-#define NPY_SIZEOF_LONGLONG 8 
-#define NPY_SIZEOF_PY_LONG_LONG 8 
-/* #define CHAR_BIT 8 */
-
diff --git a/meta-oe/recipes-devtools/python/python-numpy/powerpc/config.h b/meta-oe/recipes-devtools/python/python-numpy/powerpc/config.h
deleted file mode 100644
index 17ef186..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/powerpc/config.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
-/* #define SIZEOF_SHORT 2 */
-/* #define SIZEOF_INT 4 */
-/* #define SIZEOF_LONG 4 */
-/* #define SIZEOF_FLOAT 4 */
-/* #define SIZEOF_DOUBLE 8 */
-#define SIZEOF_LONG_DOUBLE 12
-#define SIZEOF_PY_INTPTR_T 4
-/* #define SIZEOF_LONG_LONG 8 */
-#define SIZEOF_PY_LONG_LONG 8
-/* #define CHAR_BIT 8 */
-#define MATHLIB m
-#define HAVE_FLOAT_FUNCS
-#define HAVE_LOG1P
-#define HAVE_EXPM1
-#define HAVE_INVERSE_HYPERBOLIC
-#define HAVE_INVERSE_HYPERBOLIC_FLOAT
-#define HAVE_ISNAN
-#define HAVE_ISINF
-#define HAVE_RINT
-
diff --git a/meta-oe/recipes-devtools/python/python-numpy/powerpc/numpyconfig.h b/meta-oe/recipes-devtools/python/python-numpy/powerpc/numpyconfig.h
deleted file mode 100644
index c4bf654..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/powerpc/numpyconfig.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
-/*
- *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
- *   */
-#define NPY_SIZEOF_SHORT 2 
-#define NPY_SIZEOF_INT 4 
-#define NPY_SIZEOF_LONG 4 
-#define NPY_SIZEOF_FLOAT 4 
-#define NPY_SIZEOF_DOUBLE 8 
-#define NPY_SIZEOF_LONGDOUBLE 12 
-#define NPY_SIZEOF_PY_INTPTR_T 4 
-#define NPY_NO_SMP 0
-
-#define NPY_SIZEOF_LONGLONG 8 
-#define NPY_SIZEOF_PY_LONG_LONG 8 
-/* #define CHAR_BIT 8 */
-
diff --git a/meta-oe/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h b/meta-oe/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
deleted file mode 100644
index be57ac2..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
+++ /dev/null
@@ -1,30 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_SIZEOF_PY_INTPTR_T 8
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x00000007
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy/powerpc64/config.h b/meta-oe/recipes-devtools/python/python-numpy/powerpc64/config.h
deleted file mode 100644
index c30b868..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/powerpc64/config.h
+++ /dev/null
@@ -1,139 +0,0 @@
-#define HAVE_ENDIAN_H 1
-#define SIZEOF_PY_INTPTR_T 8
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy/trycompile.diff b/meta-oe/recipes-devtools/python/python-numpy/trycompile.diff
deleted file mode 100644
index 3ab3d72..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/trycompile.diff
+++ /dev/null
@@ -1,33 +0,0 @@
---- /tmp/setup.py	2008-09-01 10:37:44.000000000 +0200
-+++ numpy-1.1.1/numpy/core/setup.py	2008-09-01 10:38:20.373198000 +0200
-@@ -80,8 +80,7 @@
-                 raise SystemError,\
-                       "Non-existing %s. Perhaps you need to install"\
-                       " python-dev|python-devel." % (python_h)
--            result = config_cmd.try_run(tc,include_dirs=[python_include],
--                                        library_dirs = default_lib_dirs)
-+            result = config_cmd.try_compile(tc)
-             if not result:
-                 raise SystemError,"Failed to test configuration. "\
-                       "See previous error messages for more information."
-@@ -95,7 +94,7 @@
-             if mathlib:
-                 mathlibs_choices.insert(0,mathlib.split(','))
-             for libs in mathlibs_choices:
--                if config_cmd.try_run(tc,libraries=libs):
-+                if config_cmd.try_compile(tc):
-                     mathlibs = libs
-                     break
-             else:
-@@ -180,10 +179,7 @@
-                       " python-dev|python-devel." % (python_h)
- 
-             config.numpy_include_dirs
--            result = config_cmd.try_run(testcode,
--                                include_dirs = [python_include] + \
--                                                       config.numpy_include_dirs,
--                                        library_dirs = default_lib_dirs)
-+            result = config_cmd.try_compile(testcode)
- 
-             if not result:
-                 raise SystemError,"Failed to generate numpy configuration. "\
diff --git a/meta-oe/recipes-devtools/python/python-numpy/unbreak-assumptions.diff b/meta-oe/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
deleted file mode 100644
index c5b4481..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
+++ /dev/null
@@ -1,16 +0,0 @@
---- /tmp/system_info.py	2008-08-22 00:38:16.000000000 +0200
-+++ numpy-1.1.1/numpy/distutils/system_info.py	2008-08-22 00:40:33.013198000 +0200
-@@ -137,11 +137,8 @@
-     default_x11_lib_dirs = []
-     default_x11_include_dirs = []
- else:
--    default_lib_dirs = ['/usr/local/lib', '/opt/lib', '/usr/lib',
--                        '/opt/local/lib', '/sw/lib']
--    default_include_dirs = ['/usr/local/include',
--                            '/opt/include', '/usr/include',
--                            '/opt/local/include', '/sw/include']
-+    default_lib_dirs = ['/non-existant-dir']
-+    default_include_dirs = ['non-existant-dir']
-     default_src_dirs = ['.','/usr/local/src', '/opt/src','/sw/src']
- 
-     try:
diff --git a/meta-oe/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h b/meta-oe/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
deleted file mode 100644
index be57ac2..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
+++ /dev/null
@@ -1,30 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_SIZEOF_PY_INTPTR_T 8
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x00000007
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy/x86-64/config.h b/meta-oe/recipes-devtools/python/python-numpy/x86-64/config.h
deleted file mode 100644
index 0ce63b7..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/x86-64/config.h
+++ /dev/null
@@ -1,139 +0,0 @@
-#define HAVE_ENDIAN_H 1
-#define SIZEOF_PY_INTPTR_T 8
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_INTEL_EXTENDED_16_BYTES_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
deleted file mode 100644
index bd3a464..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
+++ /dev/null
@@ -1,87 +0,0 @@
-DESCRIPTION = "A sophisticated Numeric Processing Package for Python"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f87832d854acbade6e9f5c601c8b30b1"
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
-           ${CONFIGFILESURI} "
-
-CONFIGFILESURI ?= ""
-
-CONFIGFILESURI_aarch64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_arm = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_armeb = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_mipsel = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_i586 = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_x86-64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-
-CONFIGFILESURI_powerpc = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_powerpc64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-
-S = "${WORKDIR}/numpy-${PV}"
-
-inherit distutils
-
-# Make the build fail and replace *config.h with proper one
-# This is a ugly, ugly hack - Koen
-do_compile_prepend_class-target() {
-    BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-    ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
-    true
-    cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/
-}
-
-FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
-
-SRC_URI[md5sum] = "4fa54e40b6a243416f0248123b6ec332"
-SRC_URI[sha256sum] = "f4fa70b7edbab65ee6432eb63743f5489f1919c614632b20b2fb45aa7e682ac6"
-
-# install what is needed for numpy.test()
-RDEPENDS_${PN} = "python-unittest \
-                  python-difflib \
-                  python-pprint \
-                  python-pickle \
-                  python-shell \
-                  python-nose \
-                  python-doctest \
-                  python-datetime \
-                  python-distutils \
-                  python-misc \
-                  python-mmap \
-                  python-netclient \
-                  python-numbers \
-                  python-pydoc \
-                  python-pkgutil \
-                  python-email \
-                  python-subprocess \
-                  python-compression \
-"
-
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4


