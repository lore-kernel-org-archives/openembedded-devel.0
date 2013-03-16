Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UGrEU-0001CY-Mu
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Mar 2013 14:33:10 +0100
Received: by mail-ee0-f50.google.com with SMTP id e51so2034269eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2013 06:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=5USOqnCjhJ4L2VpEoxs3wAYQieKU50cB4OxTqEqPGVc=;
	b=j+IY5YpO7SE6Lnwdc1J2AtUeS+Pj3BQjEa0mkWhiknHDz2VgVnunoWhog9i3sA5aay
	cuAoL144MxuGk1Ap1YbI4lL3Jw30TJWW9AahCafpYcrvwuDw8KPFKGT9W9YWhQ3HT17b
	R2D39tRHWWNx9LbX68T9Css1lNWRg44dtartZCKqXgdx0Hs3cEzaf8ZF3GKt351S2Vt6
	auLObK3HFxJBRQEg4dc9W7qVBaBw/RV90PRFdgJvKwStT7BmhlqfwNixT/5SQ+TVxGpM
	QKZiaaNKZCJd+elp6to0oQm0CEY/lm8Fo7GsysDsRCrbiBD7hxeUFYF0DV9VWVAmyQVy
	5f+w==
X-Received: by 10.15.21.4 with SMTP id c4mr28692307eeu.34.1363439785533;
	Sat, 16 Mar 2013 06:16:25 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id t4sm15966151eel.0.2013.03.16.06.16.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 16 Mar 2013 06:16:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2013 14:15:55 +0100
Message-Id: <1363439755-13680-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQmRQdZDMMNJd4T+VOMJrmVr2WltimbgclUtPLBJ6Y1SttzdmrAprllWF1QyM/VTJtB9FgCA
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] python-numpy: add i586 *config.h files
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
X-List-Received-Date: Sat, 16 Mar 2013 13:33:11 -0000

Generated using native compile on FRI2/angstrom

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../python/python-numpy/i586/config.h              | 108 +++++++++++++++++++++
 .../python/python-numpy/i586/numpyconfig.h         |  24 +++++
 .../recipes-devtools/python/python-numpy_1.7.0.bb  |   4 +
 3 files changed, 136 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-numpy/i586/config.h
 create mode 100644 meta-oe/recipes-devtools/python/python-numpy/i586/numpyconfig.h

diff --git a/meta-oe/recipes-devtools/python/python-numpy/i586/config.h b/meta-oe/recipes-devtools/python/python-numpy/i586/config.h
new file mode 100644
index 0000000..08e41e3
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-numpy/i586/config.h
@@ -0,0 +1,108 @@
+#define SIZEOF_PY_INTPTR_T 4
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN
+#define HAVE_COS
+#define HAVE_TAN
+#define HAVE_SINH
+#define HAVE_COSH
+#define HAVE_TANH
+#define HAVE_FABS
+#define HAVE_FLOOR
+#define HAVE_CEIL
+#define HAVE_SQRT
+#define HAVE_LOG10
+#define HAVE_LOG
+#define HAVE_EXP
+#define HAVE_ASIN
+#define HAVE_ACOS
+#define HAVE_ATAN
+#define HAVE_FMOD
+#define HAVE_MODF
+#define HAVE_FREXP
+#define HAVE_LDEXP
+#define HAVE_RINT
+#define HAVE_TRUNC
+#define HAVE_EXP2
+#define HAVE_LOG2
+#define HAVE_ATAN2
+#define HAVE_POW
+#define HAVE_NEXTAFTER
+#define HAVE_SINF
+#define HAVE_COSF
+#define HAVE_TANF
+#define HAVE_SINHF
+#define HAVE_COSHF
+#define HAVE_TANHF
+#define HAVE_FABSF
+#define HAVE_FLOORF
+#define HAVE_CEILF
+#define HAVE_RINTF
+#define HAVE_TRUNCF
+#define HAVE_SQRTF
+#define HAVE_LOG10F
+#define HAVE_LOGF
+#define HAVE_LOG1PF
+#define HAVE_EXPF
+#define HAVE_EXPM1F
+#define HAVE_ASINF
+#define HAVE_ACOSF
+#define HAVE_ATANF
+#define HAVE_ASINHF
+#define HAVE_ACOSHF
+#define HAVE_ATANHF
+#define HAVE_HYPOTF
+#define HAVE_ATAN2F
+#define HAVE_POWF
+#define HAVE_FMODF
+#define HAVE_MODFF
+#define HAVE_FREXPF
+#define HAVE_LDEXPF
+#define HAVE_EXP2F
+#define HAVE_LOG2F
+#define HAVE_COPYSIGNF
+#define HAVE_NEXTAFTERF
+#define HAVE_SINL
+#define HAVE_COSL
+#define HAVE_TANL
+#define HAVE_SINHL
+#define HAVE_COSHL
+#define HAVE_TANHL
+#define HAVE_FABSL
+#define HAVE_FLOORL
+#define HAVE_CEILL
+#define HAVE_RINTL
+#define HAVE_TRUNCL
+#define HAVE_SQRTL
+#define HAVE_LOG10L
+#define HAVE_LOGL
+#define HAVE_LOG1PL
+#define HAVE_EXPL
+#define HAVE_EXPM1L
+#define HAVE_ASINL
+#define HAVE_ACOSL
+#define HAVE_ATANL
+#define HAVE_ASINHL
+#define HAVE_ACOSHL
+#define HAVE_ATANHL
+#define HAVE_HYPOTL
+#define HAVE_ATAN2L
+#define HAVE_POWL
+#define HAVE_FMODL
+#define HAVE_MODFL
+#define HAVE_FREXPL
+#define HAVE_LDEXPL
+#define HAVE_EXP2L
+#define HAVE_LOG2L
+#define HAVE_COPYSIGNL
+#define HAVE_NEXTAFTERL
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H
+#define HAVE_LDOUBLE_INTEL_EXTENDED_12_BYTES_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy/i586/numpyconfig.h b/meta-oe/recipes-devtools/python/python-numpy/i586/numpyconfig.h
new file mode 100644
index 0000000..ff7938c
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-numpy/i586/numpyconfig.h
@@ -0,0 +1,24 @@
+#ifndef _NPY_NUMPYCONFIG_H_
+#define _NPY_NUMPYCONFIG_H_
+
+#include "_numpyconfig.h"
+
+/* 
+ * On Mac OS X, because there is only one configuration stage for all the archs
+ * in universal builds, any macro which depends on the arch needs to be
+ * harcoded
+ */
+#ifdef __APPLE__
+	#undef NPY_SIZEOF_LONG
+	#undef NPY_SIZEOF_PY_INTPTR_T
+
+	#ifdef __LP64__
+		#define NPY_SIZEOF_LONG 		8
+		#define NPY_SIZEOF_PY_INTPTR_T 	8
+	#else
+		#define NPY_SIZEOF_LONG 		4
+		#define NPY_SIZEOF_PY_INTPTR_T 	4
+	#endif
+#endif
+
+#endif
diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
index bbe4e63..23bec15 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -18,6 +18,10 @@ CONFIGFILESURI_mipsel = "file://config.h \
 	   file://numpyconfig.h \
 	  "
 
+CONFIGFILESURI_i586 = "file://config.h \
+                       file://numpyconfig.h \
+                      "
+
 S = "${WORKDIR}/numpy-${PV}"
 
 inherit distutils
-- 
1.8.1.4



