Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15217.1794296395341421234
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 23:39:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NWAfB+Ds;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2851577eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 23:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296395; x=1794901195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wf7WYc3erjHIGyml3y+jeyfK+Uqkju9rro92NQ1rBc=;
        b=NWAfB+Ds3fYPq81lCDC4Oi4gUCpo9DY/ZHW+3Zw/DPZXTJPRD2l97aVJ9EIKHPs/fn
         zskhHoNcviiW/stZF1vuD++TYkFhOC0iQf/2Jez7Tjs0YnmbxTV6sP2kNmnd4zi6mIoN
         iKzwzi0sREXJZCUgX+Ct+p9lwtKJOMOlOOxRIDnQSZaTBSmTuiuM0lAjC6rBAPWP+8d3
         2AImB/cPf7W1zmuNeA/boMPK2+DCK1iz2wf3YrcsUS2Xtp2H0uSDDlQOff/cwwbIlgNX
         hUiWOxLeNm9UtznnYPKjhkLeUq22fSM6jvNtMGCMrGoPpYXd2Z4UF6HDkZQPTvanmie/
         QEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296395; x=1794901195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wf7WYc3erjHIGyml3y+jeyfK+Uqkju9rro92NQ1rBc=;
        b=ahJNmRsSxnnRWcDRj567/WE//AdRdme4xT6JJ3yy9iDhxUkXett61mRe2lQqtDDNY9
         9V//6+k2Cy81RQkgnPx+53MOiolC0ENBD1Gn/pmqETSqSIxz5n2oeics3vMfNA0yf+P+
         UrOVRAx1BuNhCkJ8FctGCZXf6ywfaT4SNemmwyH53WLkQIclWBVAA0UChMrKBPNm4ASi
         dyO7FJwa0Mg/mPgfXDvNxrrvPY5JjE+JNs3SZTiVEi1z/fdT+iSNMBULRxMp/1/7hFWp
         +mRh5xzRgPJwgNUINqEfoHc/Giqk1xyFA+tKJ336PtSdyHzH4Emu+QibYtaxfw6vu49s
         kUHw==
X-Gm-Message-State: APuU4Z+iEY3qCSyAtZAA4+P2gnKbzCRRKw6v4EzVCx8387VzGf/n5Gop
	L82P4C4Dpw2Udv7umiZjT0jACIdXOphgxidQH5EkFYAM/F/BcrLQylxpYujObEm1LTk=
X-Gm-Gg: AYBFou33Nw+L2EelGfc8Y6bx334X+lr4dHdW5gXSHxNiCwg/KUCPZFhNglBIV5syhlH
	M/bn3YLu+mxWbGrQhJCfgzXcSbKxAkECgUn5oiG8XIGM5X59l4t8gbg5ZJ5XiOqHFmN5iVGOwH3
	uau3W5sCtVb+vf7LSnAzEXGRlRl3BLLVC0z4DIHiplARvA1eniL9+gaht1Y6MEHMpVhcEKH+0Ux
	qeKuLjHgj7CCA7nXIvt423hzmYNrZ9+xDhlqMx/FkSQiuSPO16CZbVRgDDnSgtx7xEfojrrX1Rw
	r6MANHuxkMRzSsShDwdVGxRChRwaQffeRbcF/TXGQFel8GxVkFyPGnJPAsT16W8qCKwD01GtT5O
	FV46RqX4JVL5QVGssCzccHJZjhFoZIi2ZVn7YT1cwm54Min3ls8l8BK+N7grNhsRfF5+XSyFaZK
	yrwiiwN0hYIDOBSG3rC2TzUBR4GCHvtW4V2PnfFAVnYE9szUZ5p32Sx9i/B+UhmW2UJOmIuqQ5J
	ai82CSq/7Zx/ODpd/8YB5AM1F52Oo3aPWR7UtjFM8W3jUhwWhEulScT1dQQhcszRkgvXrLUhG73
	gJhxsqPasFZ4yICIanwas81DulL9mLMObwUIw1S+ux2HDzBBwUt53qhj3DwdWKurJBGZdZN4++W
	ncd8B0ife5woKGKEhCQ/bpt6OO9T8Q8/nQmuAE3wQGNCBjmL38sM2mnRUZdhLYwUYJnv8BuL80d
	xkCuEzsBKp+8NNOFa+H6DJ4iac5jZaEy6vp4Ko+G9bmxMW5BW/brfl+KonTUDfnUjd0nzZs87C7
	2Z2EYJHgYMNpr3o2DX+ugtjWozZgVNBaE3a5ISz3G2jKoM2nkxitvnmT4tX+X+QP/K+X+qQgroI
	AdDW
X-Received: by 2002:a05:693c:8843:b0:370:d6e4:e8aa with SMTP id 5a478bee46e88-37520d02832mr2320717eec.41.1794296394165;
        Mon, 09 Nov 2026 23:39:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm7061257eec.22.2026.11.09.23.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:39:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] mongodb: Fix build with current python, SCons, clang and OpenSSL
Date: Mon,  9 Nov 2026 23:39:51 -0800
Message-ID: <20261110073951.45609-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132068
Content-Type: text/plain; charset="utf-8"

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
index e7a4d1e34b..e1016681e4 100644
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
