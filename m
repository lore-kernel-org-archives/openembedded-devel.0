Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OZsWF-0003Nz-SW
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 23:32:32 +0200
Received: by bwz10 with SMTP id 10so1639763bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 14:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=OHkSFx0a06jNOOCFkIUib7E6DZ2YaNvA3zNi3cYYvtU=;
	b=uaHUeYZEoDwQ/RLiB7AjDc1vtlFQG/j5vckaA+G/5fW3IDZxV7jdqP/tIhuEvrm3fO
	vDGZN7KcynqINTRyabj+eFTu7/bGzsy8VuXFcfYbeuBNNwrD1nj39Gteq8oR/zZaaypz
	lh4BCnfCnezI6c8wnEf+2W+zdCGxtjw+wthLQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=c/tL25cTDopM0oEIjmW13okoNtL7/qchx2vc+P55HJUD/uYzr5ol47LOyN1+0JfWcq
	Z+dJAI6Yomnb3URS2qUrk5dWXSuYD+TV7uAcsaobNU359XWYuQ1V2QRtWbe7n8HFhTNd
	hYryVnZcpjd2WlDjhcpPrd96YBY3IFbWIBsvc=
Received: by 10.204.154.216 with SMTP id p24mr1354729bkw.172.1279315947580;
	Fri, 16 Jul 2010 14:32:27 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id bq20sm12670723bkb.4.2010.07.16.14.32.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Jul 2010 14:32:26 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OZsW1-0002Cq-7C; Fri, 16 Jul 2010 23:32:17 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jul 2010 23:32:14 +0200
Message-Id: <1279315934-8363-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1279208884.2345.2030.camel@mill.internal.reciva.com>
References: <1279208884.2345.2030.camel@mill.internal.reciva.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH][v2] gcc-cross: fix PV and make it compile
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
X-List-Received-Date: Fri, 16 Jul 2010 21:32:33 -0000

- using PREFERRED_GCC_VERSION = "svn" didn't work since
  gcc-svn.inc messed with PV
- disable libstdcxx-pch for ppc
  pch1a_output would need to be compiled with -mlong-double-128
  to avoid
    libstdc++-v3/include/precompiled/stdc++.h -o \
	powerpc-oe-linux-uclibc/bits/stdc++.h.gch/O2g.gch
    [snip]
    libstdc++-v3/include/tr1_impl/cmath:153:11: error: '::acoshl' has not been declared
  install proper guards and furthermore disable libstdcxx-pch for now

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/gcc/gcc-svn.inc                            |   10 +-
 recipes/gcc/gcc-svn/gcc-flags-for-build.patch      |   26 --
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |   99 +++++---
 .../powerpc32-c++-pch-long-double-128.patch        |  255 ++++++++++++++++++++
 4 files changed, 323 insertions(+), 67 deletions(-)
 create mode 100644 recipes/gcc/gcc-svn/powerpc32-c++-pch-long-double-128.patch

diff --git a/recipes/gcc/gcc-svn.inc b/recipes/gcc/gcc-svn.inc
index 2e24d63..40b46d6 100644
--- a/recipes/gcc/gcc-svn.inc
+++ b/recipes/gcc/gcc-svn.inc
@@ -1,7 +1,7 @@
 DEFAULT_PREFERENCE = "-999"
 ARM_INSTRUCTION_SET = "arm"
 
-SRCREV = "158653"
+SRCREV = "162223"
 
 require gcc-common.inc
 
@@ -9,9 +9,9 @@ DEPENDS = "mpfr gmp libmpc"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 BINV = "4.6.0"
-PV = "4.6+svnr${SRCPV}"
+PKGV = "4.6+svnr${SRCPV}"
 
-FILESPATHPKG .= ":gcc-svn"
+FILESPATHPKG .= ":gcc-${PV}"
 
 SRC_URI = "svn://gcc.gnu.org/svn/gcc;module=trunk \
 	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -19,6 +19,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc;module=trunk \
            file://gcc-uclibc-locale-ctype_touplow_t.patch \
 	   file://cache-amnesia.patch \
 	   file://gcc-flags-for-build.patch \
+	   file://powerpc32-c++-pch-long-double-128.patch \
 	  "
 
 # Language Overrides
@@ -42,3 +43,6 @@ do_unpack_append() {
 EXTRA_OECONF_append_linux-uclibc = " --disable-decimal-float "
 EXTRA_OECONF_append_linux-uclibceabi = " --disable-decimal-float "
 EXTRA_OECONF_append_linux-uclibcspe = " --disable-decimal-float "
+# powerpc32 would need to build libstdc++-v3/include/cmath with -mlong-double-128
+# just disable PCH for ppc
+EXTRA_OECONF_append_powerpc-linux-uclibc = " --disable-libstdcxx-pch "
diff --git a/recipes/gcc/gcc-svn/gcc-flags-for-build.patch b/recipes/gcc/gcc-svn/gcc-flags-for-build.patch
index 98b3ecf..0a0da9a 100644
--- a/recipes/gcc/gcc-svn/gcc-flags-for-build.patch
+++ b/recipes/gcc/gcc-svn/gcc-flags-for-build.patch
@@ -98,24 +98,6 @@ Index: gcc-4.5+svnr155680/gcc/configure
  fi
  
  # Expand extra_headers to include complete path.
-@@ -17037,7 +17040,7 @@ else
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 17040 "configure"
-+#line 17043 "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -17143,7 +17146,7 @@ else
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 17146 "configure"
-+#line 17149 "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
 Index: gcc-4.5+svnr155680/Makefile.tpl
 ===================================================================
 --- gcc-4.5+svnr155680.orig/Makefile.tpl	2010-01-13 01:02:22.603540396 -0800
@@ -148,14 +130,6 @@ Index: gcc-4.5+svnr155680/configure
    CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
    LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
  fi
-@@ -7940,6 +7942,7 @@ done
- 
- 
- 
-+
- # Generate default definitions for YACC, M4, LEX and other programs that run
- # on the build machine.  These are used if the Makefile can't locate these
- # programs in objdir.
 Index: gcc-4.5+svnr155680/configure.ac
 ===================================================================
 --- gcc-4.5+svnr155680.orig/configure.ac	2010-01-13 01:02:22.651540130 -0800
diff --git a/recipes/gcc/gcc-svn/gcc-uclibc-locale-ctype_touplow_t.patch b/recipes/gcc/gcc-svn/gcc-uclibc-locale-ctype_touplow_t.patch
index ffb37d2..9cae744 100644
--- a/recipes/gcc/gcc-svn/gcc-uclibc-locale-ctype_touplow_t.patch
+++ b/recipes/gcc/gcc-svn/gcc-uclibc-locale-ctype_touplow_t.patch
@@ -1,52 +1,75 @@
-Index: gcc-4.4.1/libstdc++-v3/config/locale/generic/c_locale.h
-===================================================================
---- gcc-4.4.1.orig/libstdc++-v3/config/locale/generic/c_locale.h	2009-08-06 23:38:32.398265633 -0700
-+++ gcc-4.4.1/libstdc++-v3/config/locale/generic/c_locale.h	2009-08-06 23:41:09.778242281 -0700
-@@ -41,12 +41,17 @@
- 
- #include <clocale>
- #include <cstddef>
-+#include <features.h> 
-+#include <ctype.h> 
- 
+diff --git a/libstdc++-v3/config/locale/generic/c_locale.h b/libstdc++-v3/config/locale/generic/c_locale.h
+index 7d685b8..4f69857 100644
+--- a/libstdc++-v3/config/locale/generic/c_locale.h
++++ b/libstdc++-v3/config/locale/generic/c_locale.h
+@@ -44,8 +44,11 @@
  #define _GLIBCXX_NUM_CATEGORIES 0
  
  _GLIBCXX_BEGIN_NAMESPACE(std)
 -
--  typedef int*			__c_locale;
-+#ifdef __UCLIBC__ 
-+   typedef __ctype_touplow_t*   __c_locale; 
-+#else 
-+   typedef int*         __c_locale; 
-+#endif 
++#ifdef __UCLIBC__
++  typedef __ctype_touplow_t* __c_locale;
++#else
+   typedef int*			__c_locale;
++#endif
  
    // Convert numeric value of type double and long double to string and
    // return length of string.  If vsnprintf is available use it, otherwise
-Index: gcc-4.4.1/libstdc++-v3/config/os/gnu-linux/ctype_base.h
-===================================================================
---- gcc-4.4.1.orig/libstdc++-v3/config/os/gnu-linux/ctype_base.h	2009-08-06 23:42:27.402242608 -0700
-+++ gcc-4.4.1/libstdc++-v3/config/os/gnu-linux/ctype_base.h	2009-08-06 23:43:44.842241959 -0700
-@@ -33,14 +33,21 @@
-  */
- 
- // Information as gleaned from /usr/include/ctype.h
--  
-+
-+#include <features.h> 
-+#include <ctype.h> 
-+
- _GLIBCXX_BEGIN_NAMESPACE(std)
- 
-   /// @brief  Base class for ctype.
+diff --git a/libstdc++-v3/config/os/gnu-linux/ctype_base.h b/libstdc++-v3/config/os/gnu-linux/ctype_base.h
+index ff1f157..e88f569 100644
+--- a/libstdc++-v3/config/os/gnu-linux/ctype_base.h
++++ b/libstdc++-v3/config/os/gnu-linux/ctype_base.h
+@@ -40,7 +40,11 @@ _GLIBCXX_BEGIN_NAMESPACE(std)
    struct ctype_base
    {
      // Non-standard typedefs.
--    typedef const int* 		__to_type;
-+#ifdef __UCLIBC__ 
-+    typedef const __ctype_touplow_t*   __to_type; 
-+#else 
-+    typedef const int*         __to_type; 
++#ifdef __UCLIBC__
++    typedef const __ctype_touplow_t* __to_type;
++#else
+     typedef const int* 		__to_type;
 +#endif
  
      // NB: Offsets into ctype<char>::_M_table force a particular size
      // on the mask type. Because of this, we don't use an enum.
+diff --git a/libstdc++-v3/include/c/clocale b/libstdc++-v3/include/c/clocale
+index 7ea60f0..619f128 100644
+--- a/libstdc++-v3/include/c/clocale
++++ b/libstdc++-v3/include/c/clocale
+@@ -32,5 +32,8 @@
+ #pragma GCC system_header
+ 
+ #include_next <locale.h>
++#ifdef __UCLIBC__
++#include <ctype.h>
++#endif
+ 
+ #endif
+diff --git a/libstdc++-v3/include/c_global/clocale b/libstdc++-v3/include/c_global/clocale
+index 7cf42e2..cd9b37a 100644
+--- a/libstdc++-v3/include/c_global/clocale
++++ b/libstdc++-v3/include/c_global/clocale
+@@ -42,6 +42,9 @@
+ 
+ #include <bits/c++config.h>
+ #include <locale.h>
++#ifdef __UCLIBC__
++#include <ctype.h>
++#endif
+ 
+ #ifndef _GLIBCXX_CLOCALE
+ #define _GLIBCXX_CLOCALE 1
+diff --git a/libstdc++-v3/include/c_std/clocale b/libstdc++-v3/include/c_std/clocale
+index 36d8bd7..7905d5d 100644
+--- a/libstdc++-v3/include/c_std/clocale
++++ b/libstdc++-v3/include/c_std/clocale
+@@ -45,6 +45,10 @@
+ #include <bits/c++config.h>
+ #include <locale.h>
+ 
++#ifdef __UCLIBC__
++#include <ctype.h>
++#endif
++
+ // Get rid of those macros defined in <locale.h> in lieu of real functions.
+ #undef setlocale
+ #undef localeconv
diff --git a/recipes/gcc/gcc-svn/powerpc32-c++-pch-long-double-128.patch b/recipes/gcc/gcc-svn/powerpc32-c++-pch-long-double-128.patch
new file mode 100644
index 0000000..d20e3d0
--- /dev/null
+++ b/recipes/gcc/gcc-svn/powerpc32-c++-pch-long-double-128.patch
@@ -0,0 +1,255 @@
+on powerpc32 cmath has to be compiled with -mlong-double-128
+
+diff --git a/libstdc++-v3/include/tr1_impl/cmath b/libstdc++-v3/include/tr1_impl/cmath
+index 5807380..f395a0d 100644
+--- a/libstdc++-v3/include/tr1_impl/cmath
++++ b/libstdc++-v3/include/tr1_impl/cmath
+@@ -150,143 +150,213 @@ _GLIBCXX_BEGIN_NAMESPACE_TR1
+   // functions
+   using ::acosh;
+   using ::acoshf;
+-  using ::acoshl;
++#ifdef __LONG_DOUBLE_128__
++   using ::acoshl;
++#endif
+ 
+   using ::asinh;
+   using ::asinhf;
+-  using ::asinhl;
++#ifdef __LONG_DOUBLE_128__
++   using ::asinhl;
++#endif
+ 
+   using ::atanh;
+   using ::atanhf;
+-  using ::atanhl;
++#ifdef __LONG_DOUBLE_128__
++   using ::atanhl;
++#endif
+ 
+   using ::cbrt;
+   using ::cbrtf;
+-  using ::cbrtl;
++#ifdef __LONG_DOUBLE_128__
++   using ::cbrtl;
++#endif
+ 
+   using ::copysign;
+   using ::copysignf;
+-  using ::copysignl;
++#ifdef __LONG_DOUBLE_128__
++   using ::copysignl;
++#endif
+ 
+   using ::erf;
+   using ::erff;
+-  using ::erfl;
++#ifdef __LONG_DOUBLE_128__
++   using ::erfl;
++#endif
+ 
+   using ::erfc;
+   using ::erfcf;
+-  using ::erfcl;
++#ifdef __LONG_DOUBLE_128__
++   using ::erfcl;
++#endif
+ 
+   using ::exp2;
+   using ::exp2f;
+-  using ::exp2l;
++#ifdef __LONG_DOUBLE_128__
++   using ::exp2l;
++#endif
+ 
+   using ::expm1;
+   using ::expm1f;
+-  using ::expm1l;
++#ifdef __LONG_DOUBLE_128__
++   using ::expm1l;
++#endif
+ 
+   using ::fdim;
+   using ::fdimf;
+-  using ::fdiml;
++#ifdef __LONG_DOUBLE_128__
++   using ::fdiml;
++#endif
+ 
+   using ::fma;
+   using ::fmaf;
+-  using ::fmal;
++#ifdef __LONG_DOUBLE_128__
++   using ::fmal;
++#endif
+ 
+   using ::fmax;
+   using ::fmaxf;
+-  using ::fmaxl;
++#ifdef __LONG_DOUBLE_128__
++   using ::fmaxl;
++#endif
+ 
+   using ::fmin;
+   using ::fminf;
+-  using ::fminl;
++#ifdef __LONG_DOUBLE_128__
++   using ::fminl;
++#endif
+ 
+   using ::hypot;
+   using ::hypotf;
+-  using ::hypotl;
++#ifdef __LONG_DOUBLE_128__
++   using ::hypotl;
++#endif
+ 
+   using ::ilogb;
+   using ::ilogbf;
+-  using ::ilogbl;
++#ifdef __LONG_DOUBLE_128__
++   using ::ilogbl;
++#endif
+ 
+   using ::lgamma;
+   using ::lgammaf;
+-  using ::lgammal;
++#ifdef __LONG_DOUBLE_128__
++   using ::lgammal;
++#endif
+ 
+   using ::llrint;
+   using ::llrintf;
+-  using ::llrintl;
++#ifdef __LONG_DOUBLE_128__
++   using ::llrintl;
++#endif
+ 
+   using ::llround;
+   using ::llroundf;
+-  using ::llroundl;
++#ifdef __LONG_DOUBLE_128__
++   using ::llroundl;
++#endif
+ 
+   using ::log1p;
+   using ::log1pf;
+-  using ::log1pl;
++#ifdef __LONG_DOUBLE_128__
++   using ::log1pl;
++#endif
+ 
+   using ::log2;
+   using ::log2f;
+-  using ::log2l;
++#ifdef __LONG_DOUBLE_128__
++   using ::log2l;
++#endif
+ 
+   using ::logb;
+   using ::logbf;
+-  using ::logbl;
++#ifdef __LONG_DOUBLE_128__
++   using ::logbl;
++#endif
+ 
+   using ::lrint;
+   using ::lrintf;
+-  using ::lrintl;
++#ifdef __LONG_DOUBLE_128__
++   using ::lrintl;
++#endif
+ 
+   using ::lround;
+   using ::lroundf;
+-  using ::lroundl;
++#ifdef __LONG_DOUBLE_128__
++   using ::lroundl;
++#endif
+ 
+   using ::nan;
+   using ::nanf;
+-  using ::nanl;
++#ifdef __LONG_DOUBLE_128__
++   using ::nanl;
++#endif
+ 
+   using ::nearbyint;
+   using ::nearbyintf;
+-  using ::nearbyintl;
++#ifdef __LONG_DOUBLE_128__
++   using ::nearbyintl;
++#endif
+ 
+   using ::nextafter;
+   using ::nextafterf;
+-  using ::nextafterl;
++#ifdef __LONG_DOUBLE_128__
++   using ::nextafterl;
++#endif
+ 
+   using ::nexttoward;
+   using ::nexttowardf;
+-  using ::nexttowardl;
++#ifdef __LONG_DOUBLE_128__
++   using ::nexttowardl;
++#endif
+ 
+   using ::remainder;
+   using ::remainderf;
+-  using ::remainderl;
++#ifdef __LONG_DOUBLE_128__
++   using ::remainderl;
++#endif
+ 
+   using ::remquo;
+   using ::remquof;
+-  using ::remquol;
++#ifdef __LONG_DOUBLE_128__
++   using ::remquol;
++#endif
+ 
+   using ::rint;
+   using ::rintf;
+-  using ::rintl;
++#ifdef __LONG_DOUBLE_128__
++   using ::rintl;
++#endif
+ 
+   using ::round;
+   using ::roundf;
+-  using ::roundl;
++#ifdef __LONG_DOUBLE_128__
++   using ::roundl;
++#endif
+ 
+   using ::scalbln;
+   using ::scalblnf;
+-  using ::scalblnl;
++#ifdef __LONG_DOUBLE_128__
++   using ::scalblnl;
++#endif
+ 
+   using ::scalbn;
+   using ::scalbnf;
+-  using ::scalbnl;
++#ifdef __LONG_DOUBLE_128__
++   using ::scalbnl;
++#endif
+ 
+   using ::tgamma;
+   using ::tgammaf;
+-  using ::tgammal;
++#ifdef __LONG_DOUBLE_128__
++   using ::tgammal;
++#endif
+ 
+   using ::trunc;
+   using ::truncf;
+-  using ::truncl;
++#ifdef __LONG_DOUBLE_128__
++   using ::truncl;
++#endif
+ 
+ #endif
+ 
-- 
1.7.1



