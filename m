Return-Path: <zhenhua.luo@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe010.messaging.microsoft.com [216.32.180.30])
	by mail.openembedded.org (Postfix) with ESMTP id DFF8B6CF32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 10:44:29 +0000 (UTC)
Received: from mail213-va3-R.bigfish.com (10.7.14.236) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.22; Wed, 20 Nov 2013 10:44:31 +0000
Received: from mail213-va3 (localhost [127.0.0.1])	by
	mail213-va3-R.bigfish.com (Postfix) with ESMTP id 01AD2880094	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 10:44:31 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h1155h)
Received: from mail213-va3 (localhost.localdomain [127.0.0.1]) by mail213-va3
	(MessageSwitch) id 1384944268904497_8587;
	Wed, 20 Nov 2013 10:44:28 +0000 (UTC)
Received: from VA3EHSMHS005.bigfish.com (unknown [10.7.14.236])	by
	mail213-va3.bigfish.com (Postfix) with ESMTP id D8D2C340059	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 10:44:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS005.bigfish.com
	(10.7.99.15) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 20 Nov 2013 10:44:28 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Wed, 20 Nov 2013 10:44:27 +0000
Received: from localhost.localdomain (B19537-03.ap.freescale.net
	[10.192.208.102])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id rAKAiODr020425;	Wed, 20 Nov 2013 03:44:25 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Nov 2013 18:44:21 +0800
Message-ID: <1384944262-4850-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: b40527@freescale.com
Subject: [meta-oe/meta-oe][PATCH 1/2] Fix python-numpy build failure on powerpc architecture.
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
X-List-Received-Date: Wed, 20 Nov 2013 10:44:30 -0000
Content-Type: text/plain

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 .../python/python-numpy/ppc/config.h               |  21 ++++
 .../python/python-numpy/ppc/numpyconfig.h          |  17 +++
 .../python/python-numpy/ppc64/_numpyconfig.h       |  30 +++++
 .../python/python-numpy/ppc64/config.h             | 139 +++++++++++++++++++++
 .../recipes-devtools/python/python-numpy_1.7.0.bb  |   9 ++
 5 files changed, 216 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-numpy/ppc/config.h
 create mode 100644 meta-oe/recipes-devtools/python/python-numpy/ppc/numpyconfig.h
 create mode 100644 meta-oe/recipes-devtools/python/python-numpy/ppc64/_numpyconfig.h
 create mode 100644 meta-oe/recipes-devtools/python/python-numpy/ppc64/config.h

diff --git a/meta-oe/recipes-devtools/python/python-numpy/ppc/config.h b/meta-oe/recipes-devtools/python/python-numpy/ppc/config.h
new file mode 100644
index 0000000..17ef186
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-numpy/ppc/config.h
@@ -0,0 +1,21 @@
+/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
+/* #define SIZEOF_SHORT 2 */
+/* #define SIZEOF_INT 4 */
+/* #define SIZEOF_LONG 4 */
+/* #define SIZEOF_FLOAT 4 */
+/* #define SIZEOF_DOUBLE 8 */
+#define SIZEOF_LONG_DOUBLE 12
+#define SIZEOF_PY_INTPTR_T 4
+/* #define SIZEOF_LONG_LONG 8 */
+#define SIZEOF_PY_LONG_LONG 8
+/* #define CHAR_BIT 8 */
+#define MATHLIB m
+#define HAVE_FLOAT_FUNCS
+#define HAVE_LOG1P
+#define HAVE_EXPM1
+#define HAVE_INVERSE_HYPERBOLIC
+#define HAVE_INVERSE_HYPERBOLIC_FLOAT
+#define HAVE_ISNAN
+#define HAVE_ISINF
+#define HAVE_RINT
+
diff --git a/meta-oe/recipes-devtools/python/python-numpy/ppc/numpyconfig.h b/meta-oe/recipes-devtools/python/python-numpy/ppc/numpyconfig.h
new file mode 100644
index 0000000..c4bf654
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-numpy/ppc/numpyconfig.h
@@ -0,0 +1,17 @@
+/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
+/*
+ *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
+ *   */
+#define NPY_SIZEOF_SHORT 2 
+#define NPY_SIZEOF_INT 4 
+#define NPY_SIZEOF_LONG 4 
+#define NPY_SIZEOF_FLOAT 4 
+#define NPY_SIZEOF_DOUBLE 8 
+#define NPY_SIZEOF_LONGDOUBLE 12 
+#define NPY_SIZEOF_PY_INTPTR_T 4 
+#define NPY_NO_SMP 0
+
+#define NPY_SIZEOF_LONGLONG 8 
+#define NPY_SIZEOF_PY_LONG_LONG 8 
+/* #define CHAR_BIT 8 */
+
diff --git a/meta-oe/recipes-devtools/python/python-numpy/ppc64/_numpyconfig.h b/meta-oe/recipes-devtools/python/python-numpy/ppc64/_numpyconfig.h
new file mode 100644
index 0000000..be57ac2
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-numpy/ppc64/_numpyconfig.h
@@ -0,0 +1,30 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x00000007
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy/ppc64/config.h b/meta-oe/recipes-devtools/python/python-numpy/ppc64/config.h
new file mode 100644
index 0000000..c30b868
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-numpy/ppc64/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
index e6d328f..99662da 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -34,6 +34,15 @@ CONFIGFILESURI_x86-64 = " \
     file://_numpyconfig.h \
 "
 
+CONFIGFILESURI_powerpc = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_powerpc64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+
 S = "${WORKDIR}/numpy-${PV}"
 
 inherit distutils
-- 
1.8.3.1



