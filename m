Received: from mail-qe0-f43.google.com ([209.85.128.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1UaX9Q-0003lx-Gf
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 May 2013 22:09:19 +0200
Received: by mail-qe0-f43.google.com with SMTP id 1so2040396qec.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2013 12:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=0MxWvwq6zxFM/OV26bRi91vn7ajw+ppK41TIjJepQbw=;
	b=gUupduo8oXfYBXNzcbg84RHv8MYx6h+VHU+6fSWwlcp1HOYKR+VUwPaX9MbnRmQaln
	+jEjK3yn843LzXNVKPmRsD27Fa35S+uhRT9tiOoO75VTKEuA0NHJgEJq2AS6U7wFmDpp
	8W/0Si0TpcG8CIfx2UU+OUtBolS8MDpBWm0Xz1k6z7rJ6pF9cLK4EIe02XYzIFvHH8Ml
	O9CBvmnF6PP7mvh2kYKhyEfB6PIoA+XCT94LuHgsFQvcD4gaXyvVYtXJI1RvxgYHzzJA
	ihKcskehK3g5fjcxDB7Z4+8f2slnfDfqECnadOB6BC99fuMoCsn0sAowN0ZlWaGx7ueb
	pWxw==
X-Received: by 10.229.69.83 with SMTP id y19mr3923258qci.86.1368129071856;
	Thu, 09 May 2013 12:51:11 -0700 (PDT)
Received: from localhost.localdomain
	(pool-71-171-26-125.nwrknj.east.verizon.net. [71.171.26.125])
	by mx.google.com with ESMTPSA id c10sm4675123qao.10.2013.05.09.12.51.10
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 09 May 2013 12:51:11 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 May 2013 15:51:06 -0400
Message-Id: <1368129066-30240-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCH] python-numpy : Add support for x86-64 builds.
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
X-List-Received-Date: Thu, 09 May 2013 20:09:34 -0000
X-List-Received-Date: Thu, 09 May 2013 20:09:34 -0000

Build tested with a qemux86-64 build.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../python/python-numpy/x86-64/_numpyconfig.h      |  30 +++++
 .../python/python-numpy/x86-64/config.h            | 139 +++++++++++++++++++++
 .../recipes-devtools/python/python-numpy_1.7.0.bb  |   5 +-
 3 files changed, 173 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
 create mode 100644 meta-oe/recipes-devtools/python/python-numpy/x86-64/config.h

diff --git a/meta-oe/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h b/meta-oe/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
new file mode 100644
index 0000000..be57ac2
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
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
diff --git a/meta-oe/recipes-devtools/python/python-numpy/x86-64/config.h b/meta-oe/recipes-devtools/python/python-numpy/x86-64/config.h
new file mode 100644
index 0000000..0ce63b7
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-numpy/x86-64/config.h
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
+#define HAVE_LDOUBLE_INTEL_EXTENDED_16_BYTES_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
index a3698d3..f6b435c 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -20,7 +20,10 @@ CONFIGFILESURI_mipsel = "file://config.h \
 
 CONFIGFILESURI_i586 = "file://config.h \
                        file://numpyconfig.h \
-"
+                      "
+CONFIGFILESURI_x86-64 = "file://config.h \
+	   file://_numpyconfig.h \
+	  "
 
 S = "${WORKDIR}/numpy-${PV}"
 
-- 
1.7.11.7



