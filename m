Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10103.1794999726254269423
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:02:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BXtC3tMm;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: awais.belal@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so4229655e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 03:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999724; x=1795604524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nggiKnElogoGYeeU4gFoF2/jWLj74aIGIYiXFWpnlM8=;
        b=BXtC3tMmpaPXxw4BQFuDJ73IH42CrIVQmBQQJIuRscM6VC0yYwekGGFdzLfs6LSiEw
         I7/eqoQntfAzLBdxAP+VR9aaU83iAqsxH0IpU1Yx7zX9vqfVHPlxEksNNP+kEYiVvF5g
         LH0661EmxsA1EYJk1qHcoACAzP3EDdZ3BXjJfPtxL1R2WVoQ9uQ/2iIGlNRg86rGc2dV
         tUUImziKGLAg1yE+zgOQgMndCwhSTQzgh32/Mof6+LOb2lFy+qNRUkn5BgsZP0aOnWBM
         wQuqVyPl5ZlZY2xK0aJRccKOq2ocJga3Twsj+lsmItik0f6cNmdEw1gxD1O5vfA4L3Jp
         2IuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999724; x=1795604524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nggiKnElogoGYeeU4gFoF2/jWLj74aIGIYiXFWpnlM8=;
        b=aMLo5p+cPTYjxYB90Lmqs7ng+nnIrDEkWL9xW+kuexWds66vtxK+XBehWf/Ff5bRsB
         ZRJX7OaE2zKmYojxcqKUu6eMoDPM0DgFOtI95ks4yCd3Tsy313WnWxQPGh7z927wvguS
         OslL4qYH2/UXkT1OuLXAUSiSANUUME28spTfNdsDrCLcOg9tsx108Q9DFY2VKqdoljqj
         QGs8H7ENtgPCDBRQkePYw21vi7WnrYajhz/qSTdJ1r3Rq3SLOBK3dm3zq6TaEx5cfNXu
         VEqpNjzDectNanVv+jKuXvk1gWkpcy1NFnAxBfvaXTTUVDeqYtZeACcTi+lMHZwoDaag
         1ioQ==
X-Gm-Message-State: APuU4Z9U12MwpliWzeQJi2RERSWwRmkqUzQJC0VTJyT6H498IaF5UBKG
	UJl4kVNgxidyRvj4Qs/webf88Do2b56rffxaM8w0qgWYDJjaEc1ImOl8Xv7OAZMU
X-Gm-Gg: AYBFou2cN7MAmg5a0PCHIE+My4c3F2zqGDPdt+Bac4tEUU6qB/hWLNqOU37gyqLYPoa
	KcTrQLM22AIIfF+wDa3JgbpnGKI5dUFBeb6qSzy8QYIlI7KvFKKx5hwvC+VYL2wWPMx0Ubn+Zob
	6OwjEpGo7fPe25Wt8TcyoROx8Go9/ueTrNJzFgjfJHsaSAG4+CdxjDa1+hg2fmKqEZoO/bA6//2
	iWcUpayhVuETZ4G3OOwnFdH3xQE+z2WxBnUtTvxgmyVXeH/AZT+ZIE3oZdsrBmQrwCRMcnd2e+p
	2781bP3suPZ/Lo7FS31CYu7taZiwQ/BNCtODwVVTNw49AxzQXY0FjY689Yll3vVmiscfRLU3ahi
	ESsfQVKwEMIalWA4a9nvb8+S3V0ToKRTHC6g3X8+NPgkB+gs5OJH4xdRF7gYigaYhsJxaRRYzrf
	6JIAhmlWGQNYadXqLKSc06nCyC9uxl8X5zgGrAm0gZsUzO0qKyPux1aGkIVE1iOh3NSFyGZKfpy
	DvRfrWkwGESRqacuPFkrEnroCKB23zkOp0s1tEWwCCRIwDgXE3vMtI2CzSJooXzOUo08Fe9ZflR
	KzaM3P5QVOOxYfN+Q59nNnLcB1s0AUHr78ftRxpyrd9MhFY8y+q3sV/LtTxmxC7QkYzalij275j
	Hn2Ng2/bsY+J77/Vwbky6
X-Received: by 2002:a05:600c:4445:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb7da1b421mr39653565e9.10.1794999723643;
        Wed, 18 Nov 2026 03:02:03 -0800 (PST)
Return-Path: <awais.belal@gmail.com>
Received: from elitebook.tailad32a6.ts.net ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57f6f9sm23139885e9.2.2026.11.18.03.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:02:02 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Awais B <awais.b@rufilla.com>
Subject: [meta-oe][wrynose][PATCH 5/7] mongodb: Fix build with current python, SCons, clang and OpenSSL
Date: Wed, 18 Nov 2026 16:01:18 +0500
Message-Id: <20261118110120.3913031-6-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118110120.3913031-1-awais.belal@gmail.com>
References: <20261118110120.3913031-1-awais.belal@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132642
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

mongodb was re-enabled after having been skipped, and no longer builds
with the current toolchain and dependencies:

- setuptools 84 does not provide pkg_resources anymore; use
  packaging.version to parse versions
- SCons 4.11 added an extra_libs parameter ahead of call in
  CheckLibWithHeader(), so the positional call snippet was split into
  bogus -l options and the OpenSSL check failed; pass call as a keyword
- clang 23 rejects out of range enum values in the bundled Boost 1.70
  mpl::integral_c uses and a typo in Boost.Thread; backport the fixes
  from newer Boost
- OpenSSL 4 makes ASN1_STRING opaque and removes ASN1_STRING_data() and
  ERR_remove_state(); use the accessors available since OpenSSL 1.1

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2903830b48e5a304ad62aa65e5c2b44c2fe67f67)
Signed-off-by: Awais B <awais.b@rufilla.com>
---
 ...stead-of-pkg_resources-for-version-p.patch |  51 +++++
 ...call-to-CheckLibWithHeader-as-a-keyw.patch |  56 ++++++
 .../0003-boost-Fix-build-with-clang-23.patch  | 176 ++++++++++++++++++
 .../0004-ssl-Fix-build-with-OpenSSL-4.patch   | 117 ++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |   6 +-
 5 files changed, 405 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch
new file mode 100644
index 0000000000..d45b9f8021
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch
@@ -0,0 +1,51 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 9 Nov 2026 07:45:00 -0800
+Subject: [PATCH] Use packaging instead of pkg_resources for version parsing
+
+pkg_resources has been removed from setuptools, so SConstruct fails to
+load with:
+
+  ModuleNotFoundError: No module named 'pkg_resources'
+
+Use parse() from the packaging module instead.
+
+Upstream-Status: Inappropriate [v4.4 branch is EOL]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/SConstruct b/SConstruct
+--- a/SConstruct
++++ b/SConstruct
+@@ -16,7 +16,7 @@
+ import uuid
+ from glob import glob
+ 
+-from pkg_resources import parse_version
++from packaging.version import parse as parse_version
+ 
+ import SCons
+ 
+diff --git a/site_scons/site_tools/ccache.py b/site_scons/site_tools/ccache.py
+--- a/site_scons/site_tools/ccache.py
++++ b/site_scons/site_tools/ccache.py
+@@ -26,7 +26,7 @@
+ import subprocess
+ 
+ import SCons
+-from pkg_resources import parse_version
++from packaging.version import parse as parse_version
+ 
+ # This is the oldest version of ccache that offers support for -gsplit-dwarf
+ _ccache_version_min = parse_version("3.2.3")
+diff --git a/site_scons/site_tools/icecream.py b/site_scons/site_tools/icecream.py
+--- a/site_scons/site_tools/icecream.py
++++ b/site_scons/site_tools/icecream.py
+@@ -25,7 +25,7 @@
+ import subprocess
+ import urllib
+ 
+-from pkg_resources import parse_version
++from packaging.version import parse as parse_version
+ 
+ import SCons
+ 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch
new file mode 100644
index 0000000000..d4b5586a97
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch
@@ -0,0 +1,56 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 9 Nov 2026 08:10:00 -0800
+Subject: [PATCH] SConstruct: Pass call to CheckLibWithHeader as a keyword
+
+Newer SCons added an extra_libs parameter to CheckLibWithHeader() ahead
+of call, so the call snippet passed positionally is treated as a list of
+extra libraries and each character becomes a -l option:
+
+  ... -lcrypto -lS -lS -lL -le -la -ly ... -l( -l0 -l) -l;
+  Couldn't find OpenSSL crypto.h header and library
+
+Pass it as a keyword argument, which works with old and new SCons.
+
+Upstream-Status: Inappropriate [v4.4 branch is EOL]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/SConstruct b/SConstruct
+--- a/SConstruct
++++ b/SConstruct
+@@ -3499,7 +3499,7 @@
+                 cryptoLibName,
+                 ["openssl/crypto.h"],
+                 "C",
+-                "SSLeay_version(0);",
++                call="SSLeay_version(0);",
+                 autoadd=True):
+             maybeIssueDarwinSSLAdvice(conf.env)
+             conf.env.ConfError("Couldn't find OpenSSL crypto.h header and library")
+@@ -3656,7 +3656,7 @@
+         if conf.CheckLibWithHeader(
+             "curl",
+             ["curl/curl.h"], "C",
+-            "curl_global_init(0);",
++            call="curl_global_init(0);",
+             autoadd=False):
+             return True
+ 
+@@ -3782,7 +3782,7 @@
+             "sasl2",
+             ["stddef.h","sasl/sasl.h"],
+             "C",
+-            "sasl_version_info(0, 0, 0, 0, 0, 0);",
++            call="sasl_version_info(0, 0, 0, 0, 0, 0);",
+             autoadd=False ):
+         myenv.ConfError("Couldn't find SASL header/libraries")
+ 
+@@ -3947,7 +3947,7 @@
+                 ["mongoc-1.0"],
+                 ["mongoc/mongoc.h"],
+                 "C",
+-                "mongoc_get_major_version();",
++                call="mongoc_get_major_version();",
+                 autoadd=False ):
+             conf.env['MONGO_HAVE_LIBMONGOC'] = "library"
+         if not conf.env['MONGO_HAVE_LIBMONGOC'] and env.TargetOSIs('darwin') and conf.CheckMongoCFramework():
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch
new file mode 100644
index 0000000000..3a188033f6
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch
@@ -0,0 +1,176 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 9 Nov 2026 09:00:00 -0800
+Subject: [PATCH] boost: Fix build with clang 23
+
+Backport fixes from newer Boost to the bundled Boost 1.70:
+
+- numeric_conversion and log: use boost::integral_constant instead of
+  mpl::integral_c for enum constants. mpl::integral_c computes the
+  next/prior values, which are outside the range of the enum, and clang
+  now rejects that:
+
+    error: in-class initializer for static data member is not a constant expression
+    note: integer value -1 is outside the valid range of values [0, 3] for the enumeration type 'lock_access_mode'
+
+- thread: fix a typo in run_it's move assignment operator, which clang
+  now diagnoses in uninstantiated templates:
+
+    error: no member named 'that' in 'boost::detail::run_it<FutureExecutorContinuationSharedState>'
+
+Upstream-Status: Backport [https://github.com/boostorg/numeric_conversion/commit/50a1eae942effb0a9b90724323ef8f2a67e7984a https://github.com/boostorg/log/commit/77f1e20bd69c2e7a9e25e6a9818ae6105f7d070c https://github.com/boostorg/thread/commit/49ccf9c30a0ca556873dbf64b12b0d741d1b3e66]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/src/third_party/boost-1.70.0/boost/log/utility/strictest_lock.hpp b/src/third_party/boost-1.70.0/boost/log/utility/strictest_lock.hpp
+index 5dd48b4f..05c7a037 100644
+--- a/src/third_party/boost-1.70.0/boost/log/utility/strictest_lock.hpp
++++ b/src/third_party/boost-1.70.0/boost/log/utility/strictest_lock.hpp
+@@ -17,6 +17,7 @@
+ #define BOOST_LOG_UTILITY_STRICTEST_LOCK_HPP_INCLUDED_
+ 
+ #include <boost/mpl/integral_c.hpp>
++#include <boost/type_traits/integral_constant.hpp>
+ #include <boost/log/detail/config.hpp>
+ #include <boost/log/detail/locks.hpp>
+ #if defined(BOOST_NO_CXX11_VARIADIC_TEMPLATES)
+@@ -67,44 +68,44 @@ template< typename LockT >
+ struct thread_access_mode_of;
+ 
+ template< typename MutexT >
+-struct thread_access_mode_of< no_lock< MutexT > > : mpl::integral_c< lock_access_mode, unlocked_access >
++struct thread_access_mode_of< no_lock< MutexT > > : boost::integral_constant< lock_access_mode, unlocked_access >
+ {
+ };
+ 
+ #if !defined(BOOST_LOG_NO_THREADS)
+ 
+ template< typename MutexT >
+-struct thread_access_mode_of< lock_guard< MutexT > > : mpl::integral_c< lock_access_mode, exclusive_access >
++struct thread_access_mode_of< lock_guard< MutexT > > : boost::integral_constant< lock_access_mode, exclusive_access >
+ {
+ };
+ 
+ template< typename MutexT >
+-struct thread_access_mode_of< shared_lock_guard< MutexT > > : mpl::integral_c< lock_access_mode, shared_access >
++struct thread_access_mode_of< shared_lock_guard< MutexT > > : boost::integral_constant< lock_access_mode, shared_access >
+ {
+ };
+ 
+ template< typename MutexT >
+-struct thread_access_mode_of< unique_lock< MutexT > > : mpl::integral_c< lock_access_mode, exclusive_access >
++struct thread_access_mode_of< unique_lock< MutexT > > : boost::integral_constant< lock_access_mode, exclusive_access >
+ {
+ };
+ 
+ template< typename MutexT >
+-struct thread_access_mode_of< shared_lock< MutexT > > : mpl::integral_c< lock_access_mode, shared_access >
++struct thread_access_mode_of< shared_lock< MutexT > > : boost::integral_constant< lock_access_mode, shared_access >
+ {
+ };
+ 
+ template< typename MutexT >
+-struct thread_access_mode_of< upgrade_lock< MutexT > > : mpl::integral_c< lock_access_mode, shared_access >
++struct thread_access_mode_of< upgrade_lock< MutexT > > : boost::integral_constant< lock_access_mode, shared_access >
+ {
+ };
+ 
+ template< typename MutexT >
+-struct thread_access_mode_of< boost::log::aux::exclusive_lock_guard< MutexT > > : mpl::integral_c< lock_access_mode, exclusive_access >
++struct thread_access_mode_of< boost::log::aux::exclusive_lock_guard< MutexT > > : boost::integral_constant< lock_access_mode, exclusive_access >
+ {
+ };
+ 
+ template< typename MutexT >
+-struct thread_access_mode_of< boost::log::aux::shared_lock_guard< MutexT > > : mpl::integral_c< lock_access_mode, shared_access >
++struct thread_access_mode_of< boost::log::aux::shared_lock_guard< MutexT > > : boost::integral_constant< lock_access_mode, shared_access >
+ {
+ };
+ 
+diff --git a/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/int_float_mixture.hpp b/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/int_float_mixture.hpp
+index 464e5275..7690d07a 100644
+--- a/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/int_float_mixture.hpp
++++ b/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/int_float_mixture.hpp
+@@ -16,15 +16,15 @@
+ #include "boost/numeric/conversion/int_float_mixture_enum.hpp"
+ #include "boost/numeric/conversion/detail/meta.hpp"
+ 
+-#include "boost/mpl/integral_c.hpp"
++#include "boost/type_traits/integral_constant.hpp"
+ 
+ namespace boost { namespace numeric { namespace convdetail
+ {
+   // Integral Constants for 'IntFloatMixture'
+-  typedef mpl::integral_c<int_float_mixture_enum, integral_to_integral> int2int_c ;
+-  typedef mpl::integral_c<int_float_mixture_enum, integral_to_float>    int2float_c ;
+-  typedef mpl::integral_c<int_float_mixture_enum, float_to_integral>    float2int_c ;
+-  typedef mpl::integral_c<int_float_mixture_enum, float_to_float>       float2float_c ;
++  typedef boost::integral_constant<int_float_mixture_enum, integral_to_integral> int2int_c ;
++  typedef boost::integral_constant<int_float_mixture_enum, integral_to_float>    int2float_c ;
++  typedef boost::integral_constant<int_float_mixture_enum, float_to_integral>    float2int_c ;
++  typedef boost::integral_constant<int_float_mixture_enum, float_to_float>       float2float_c ;
+ 
+   // Metafunction:
+   //
+diff --git a/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/sign_mixture.hpp b/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/sign_mixture.hpp
+index c7f9e42a..fde15840 100644
+--- a/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/sign_mixture.hpp
++++ b/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/sign_mixture.hpp
+@@ -16,15 +16,15 @@
+ #include "boost/numeric/conversion/sign_mixture_enum.hpp"
+ #include "boost/numeric/conversion/detail/meta.hpp"
+ 
+-#include "boost/mpl/integral_c.hpp"
++#include "boost/type_traits/integral_constant.hpp"
+ 
+ namespace boost { namespace numeric { namespace convdetail
+ {
+   // Integral Constants for 'SignMixture'
+-  typedef mpl::integral_c<sign_mixture_enum, unsigned_to_unsigned> unsig2unsig_c ;
+-  typedef mpl::integral_c<sign_mixture_enum, signed_to_signed>     sig2sig_c ;
+-  typedef mpl::integral_c<sign_mixture_enum, signed_to_unsigned>   sig2unsig_c ;
+-  typedef mpl::integral_c<sign_mixture_enum, unsigned_to_signed>   unsig2sig_c ;
++  typedef boost::integral_constant<sign_mixture_enum, unsigned_to_unsigned> unsig2unsig_c ;
++  typedef boost::integral_constant<sign_mixture_enum, signed_to_signed>     sig2sig_c ;
++  typedef boost::integral_constant<sign_mixture_enum, signed_to_unsigned>   sig2unsig_c ;
++  typedef boost::integral_constant<sign_mixture_enum, unsigned_to_signed>   unsig2sig_c ;
+ 
+   // Metafunction:
+   //
+diff --git a/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/udt_builtin_mixture.hpp b/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/udt_builtin_mixture.hpp
+index 36dbc491..a39d29fd 100644
+--- a/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/udt_builtin_mixture.hpp
++++ b/src/third_party/boost-1.70.0/boost/numeric/conversion/detail/udt_builtin_mixture.hpp
+@@ -15,15 +15,15 @@
+ #include "boost/numeric/conversion/udt_builtin_mixture_enum.hpp"
+ #include "boost/numeric/conversion/detail/meta.hpp"
+ 
+-#include "boost/mpl/integral_c.hpp"
++#include "boost/type_traits/integral_constant.hpp"
+ 
+ namespace boost { namespace numeric { namespace convdetail
+ {
+   // Integral Constants for 'UdtMixture'
+-  typedef mpl::integral_c<udt_builtin_mixture_enum, builtin_to_builtin> builtin2builtin_c ;
+-  typedef mpl::integral_c<udt_builtin_mixture_enum, builtin_to_udt>     builtin2udt_c ;
+-  typedef mpl::integral_c<udt_builtin_mixture_enum, udt_to_builtin>     udt2builtin_c ;
+-  typedef mpl::integral_c<udt_builtin_mixture_enum, udt_to_udt>         udt2udt_c ;
++  typedef boost::integral_constant<udt_builtin_mixture_enum, builtin_to_builtin> builtin2builtin_c ;
++  typedef boost::integral_constant<udt_builtin_mixture_enum, builtin_to_udt>     builtin2udt_c ;
++  typedef boost::integral_constant<udt_builtin_mixture_enum, udt_to_builtin>     udt2builtin_c ;
++  typedef boost::integral_constant<udt_builtin_mixture_enum, udt_to_udt>         udt2udt_c ;
+ 
+   // Metafunction:
+   //
+diff --git a/src/third_party/boost-1.70.0/boost/thread/future.hpp b/src/third_party/boost-1.70.0/boost/thread/future.hpp
+index 3d1b29d4..2862fc0a 100644
+--- a/src/third_party/boost-1.70.0/boost/thread/future.hpp
++++ b/src/third_party/boost-1.70.0/boost/thread/future.hpp
+@@ -4669,7 +4669,7 @@ namespace detail
+       }
+       run_it& operator=(BOOST_THREAD_RV_REF(run_it) x) BOOST_NOEXCEPT {
+         if (this != &x) {
+-          that_=x.that;
++          that_=x.that_;
+           x.that_.reset();
+         }
+         return *this;
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch
new file mode 100644
index 0000000000..fdf6852119
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch
@@ -0,0 +1,117 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 9 Nov 2026 09:00:00 -0800
+Subject: [PATCH] ssl: Fix build with OpenSSL 4
+
+OpenSSL 4 makes ASN1_STRING opaque, removes ASN1_STRING_data() and
+ERR_remove_state(), and returns const pointers from
+X509_EXTENSION_get_object() and X509_EXTENSION_get_data().
+
+Use the ASN1_STRING accessors, which are available since OpenSSL 1.1,
+make the extension pointers const, and only call ERR_remove_state() with
+OpenSSL older than 1.1, where it is not a no-op.
+
+Upstream-Status: Inappropriate [v4.4 branch is EOL]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/src/mongo/util/net/openssl_init.cpp b/src/mongo/util/net/openssl_init.cpp
+index c4980bb0..93b6e4fc 100644
+--- a/src/mongo/util/net/openssl_init.cpp
++++ b/src/mongo/util/net/openssl_init.cpp
+@@ -77,7 +77,9 @@ public:
+ 
+         // The `guard` callback will cause an invocation of `getID`, so it must be destroyed first.
+         static thread_local ManagedId managedId;
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         static thread_local auto guard = makeGuard([] { ERR_remove_state(0); });
++#endif
+ 
+         return managedId.id;
+     }
+diff --git a/src/mongo/util/net/ssl_manager_openssl.cpp b/src/mongo/util/net/ssl_manager_openssl.cpp
+index 60cde955..fa55bb7d 100644
+--- a/src/mongo/util/net/ssl_manager_openssl.cpp
++++ b/src/mongo/util/net/ssl_manager_openssl.cpp
+@@ -1433,7 +1433,10 @@ SSLX509Name getCertificateSubjectX509Name(X509* cert) {
+ 
+         const auto* str = X509_NAME_ENTRY_get_data(entry);
+         rdn.emplace_back(
+-            buffer, str->type, std::string(reinterpret_cast<const char*>(str->data), str->length));
++            buffer,
++            ASN1_STRING_type(str),
++            std::string(reinterpret_cast<const char*>(ASN1_STRING_get0_data(str)),
++                        ASN1_STRING_length(str)));
+     }
+     if (!rdn.empty()) {
+         entries.push_back(std::move(rdn));
+@@ -2904,7 +2907,7 @@ Future<SSLPeerInfo> SSLManagerOpenSSL::parseAndValidatePeerCertificate(
+             const GENERAL_NAME* currentName = sk_GENERAL_NAME_value(sanNames, i);
+             if (currentName && currentName->type == GEN_DNS) {
+                 std::string dnsName(
+-                    reinterpret_cast<char*>(ASN1_STRING_data(currentName->d.dNSName)));
++                    reinterpret_cast<const char*>(ASN1_STRING_get0_data(currentName->d.dNSName)));
+                 auto swCIDRDNSName = CIDR::parse(dnsName);
+                 if (swCIDRDNSName.isOK()) {
+                     LOGV2_WARNING(23237,
+@@ -2925,14 +2928,16 @@ Future<SSLPeerInfo> SSLManagerOpenSSL::parseAndValidatePeerCertificate(
+                 auto ipAddrStruct = currentName->d.iPAddress;
+                 struct sockaddr_storage ss;
+                 memset(&ss, 0, sizeof(ss));
+-                if (ipAddrStruct->length == 4) {
++                const int ipAddrLength = ASN1_STRING_length(ipAddrStruct);
++                const unsigned char* ipAddrData = ASN1_STRING_get0_data(ipAddrStruct);
++                if (ipAddrLength == 4) {
+                     struct sockaddr_in* sa = reinterpret_cast<struct sockaddr_in*>(&ss);
+                     sa->sin_family = AF_INET;
+-                    memcpy(&(sa->sin_addr), ipAddrStruct->data, ipAddrStruct->length);
+-                } else if (ipAddrStruct->length == 16) {
++                    memcpy(&(sa->sin_addr), ipAddrData, ipAddrLength);
++                } else if (ipAddrLength == 16) {
+                     struct sockaddr_in6* sa = reinterpret_cast<struct sockaddr_in6*>(&ss);
+                     sa->sin6_family = AF_INET6;
+-                    memcpy(&(sa->sin6_addr), ipAddrStruct->data, ipAddrStruct->length);
++                    memcpy(&(sa->sin6_addr), ipAddrData, ipAddrLength);
+                 }
+                 auto ipAddress =
+                     SockAddr(reinterpret_cast<struct sockaddr*>(&ss), sizeof(ss)).getAddr();
+@@ -3026,15 +3031,16 @@ StatusWith<stdx::unordered_set<RoleName>> SSLManagerOpenSSL::_parsePeerRoles(X50
+     stdx::unordered_set<RoleName> roles;
+     for (int i = 0; i < extCount; i++) {
+         X509_EXTENSION* ex = sk_X509_EXTENSION_value(exts, i);
+-        ASN1_OBJECT* obj = X509_EXTENSION_get_object(ex);
++        const ASN1_OBJECT* obj = X509_EXTENSION_get_object(ex);
+ 
+         if (!OBJ_cmp(obj, rolesObj)) {
+             // We've found an extension which has our roles OID
+-            ASN1_OCTET_STRING* data = X509_EXTENSION_get_data(ex);
++            const ASN1_OCTET_STRING* data = X509_EXTENSION_get_data(ex);
+ 
+             return parsePeerRoles(
+-                ConstDataRange(reinterpret_cast<char*>(data->data),
+-                               reinterpret_cast<char*>(data->data) + data->length));
++                ConstDataRange(reinterpret_cast<const char*>(ASN1_STRING_get0_data(data)),
++                               reinterpret_cast<const char*>(ASN1_STRING_get0_data(data)) +
++                                   ASN1_STRING_length(data)));
+         }
+     }
+ 
+@@ -3054,14 +3060,15 @@ StatusWith<boost::optional<std::vector<DERInteger>>> SSLManagerOpenSSL::_parseTL
+     ASN1_OBJECT* featuresObj = OBJ_nid2obj(NID_tlsfeature);
+     for (int i = 0; i < extCount; i++) {
+         X509_EXTENSION* ex = sk_X509_EXTENSION_value(exts, i);
+-        ASN1_OBJECT* obj = X509_EXTENSION_get_object(ex);
++        const ASN1_OBJECT* obj = X509_EXTENSION_get_object(ex);
+ 
+         if (!OBJ_cmp(obj, featuresObj)) {
+             // We've found an extension which has the features OID
+-            ASN1_OCTET_STRING* data = X509_EXTENSION_get_data(ex);
++            const ASN1_OCTET_STRING* data = X509_EXTENSION_get_data(ex);
+             return parseTLSFeature(
+-                ConstDataRange(reinterpret_cast<char*>(data->data),
+-                               reinterpret_cast<char*>(data->data) + data->length));
++                ConstDataRange(reinterpret_cast<const char*>(ASN1_STRING_get0_data(data)),
++                               reinterpret_cast<const char*>(ASN1_STRING_get0_data(data)) +
++                                   ASN1_STRING_length(data)));
+         }
+     }
+     return boost::none;
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index b7f2c3aaac..c8095b0292 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-Community.txt;md5=3a865f27f11f43ecbe542d9ea38
                     file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "openssl libpcap zlib boost curl python3 \
-           python3-setuptools-native \
+           python3-packaging-native python3-setuptools-native \
            python3-pyyaml-native python3-cheetah-native \
            python3-psutil-native python3-regex-native \
            "
@@ -36,6 +36,10 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-Fix-type-mismatch-on-32bit-arches.patch \
            file://0001-Fix-build-on-32bit.patch \
            file://0001-moduleconfig.py-python-3.12-compatibility.patch \
+           file://0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch \
+           file://0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch \
+           file://0003-boost-Fix-build-with-clang-23.patch \
+           file://0004-ssl-Fix-build-with-OpenSSL-4.patch \
            "
 SRC_URI:append:libc-musl = "\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.34.1

