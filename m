Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1917.1795113508842521435
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ixk004ha;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so70206b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113508; x=1795718308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4343D18kR8oEw7EyQ8wJHVu81QQE7vt3ZoX3q5xoeM=;
        b=ixk004haoKWij+er8Icsn8ymnqfWXeFgsLTUsg/OF0CbM6IIXsYQshhHfyi4EbMNvt
         TJ3XYiiP/fV0EfXkJ4mEqZRtlAODF1SOPwdDEufk/opxBw2+TjTnuI9AsZIO7NHBn9Mr
         hBuLCKDHRicKpNAFYTBtfkpt0lbSx+CyZ9PYW1IiNIdr1WiI/sJ3wITiQD6Y+QLZHFQ3
         +kfY78HngjCmD3qg3CSB2DnEceEAfQTaEkzRWqb9LJ+srNz0MWO8w/qxx2NvDn4v2zgx
         RFT4Azve4e2kb5FQ1vVKaSSqELe9siy4EwXHWzNAlM/Rz1soOmoLfzRsSRMoPF90BgSX
         0PoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113508; x=1795718308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4343D18kR8oEw7EyQ8wJHVu81QQE7vt3ZoX3q5xoeM=;
        b=UTE8dkmaz8T8Bwnk47InkzcESZ1FsE3SWpq6AoUWpVY4ccyG9BzvKcc1ViRP8K9N9F
         isiU7AywpcXWqbN8JkdYxijcs2UruPgEu5pX4Ncj/Sb3u/rRDsFeW+bbzdGJk8G7Z8v0
         4PklMLLx0Ch6oRBLS1AOwg7i5+Huh0P4zxyX607VgkonCPHsrZTFpNYTZkF6nZnaG5hw
         bCtW36sb3m/87RFb0flLCp97rI94hI9/aLmC2rug4/cXkvq+byvIdk2BCCrzh9oZlx3/
         n6+sypXwWPgYniuIYQRYtALIPEBhUjZx47vZp2BYLi7zhvMLdyRxSlh8PNSo9xUBO6jn
         JZ1g==
X-Gm-Message-State: APuU4Z8KvWW/SIRvjvXPHnh8c87CoGZ//B2wHmHUMqLS4zrn8h6htEiK
	fAW7g6iJ+ay4uKbL4CQ1pdCES6guXB+4dJWgZi8Zo5MhANLRzeS7wvRjetR2hg==
X-Gm-Gg: AYBFou0WEgldBvqfcgZuyO0uf48vTdPZLXsd9De4I3FofKDTcJWPJOQm1JolRs/aQOY
	UoCArqvRzuzE9Cw6uCiC5iy1IR4omYXhm010zJh+HAh5PJwHcCa23/I8W250Sl9GCk2TK4jWQZa
	sIlDn/vSKMb6rXKZIxvzi+ys8ICETaI31/GdLnjLVXD9nXscEhBe3QKEPKGHTYtNod95dQHV82k
	F6WY0MgUQZ8eElvhzeqPE6b77CYtQZailGcZPdQoJjg9tha97WJC2WehVo2a4tFaJG+Z9nUOyOj
	6cOPv4moMNCQDxBjwuiqeC7VwW0qD3jETXjqgGQMd9DKhiJpIfPIgCSs8Ae4nfoXnYgtUfF3Zxw
	hAe4I+qeC9f6p3VoPw8OzrV/bxvdGUQPEFS1Lz7/MIAylcPhdt2fir/eyR2YI9dfN0ju5j0ubaC
	wYyTayZ4tpthn+imFwEmD4ERKeRCxSktHHKJuszUlvbbxrrwkPUvRuuOq/zEFCh9CZDmfA1ObBu
	dKCV3ult1oWob80auBURp5MK+qX+yPqZFt/52yUOAbQnaSsndgl/LzNIpTy4tHWRTSaTCck4yk4
	EplFtVWP8V4OIm669F4tReAA656fMDo1M1OrVSZGc4hdcsgdUaY454524SBAGw==
X-Received: by 2002:a05:6a00:1808:b0:89c:1f2b:a73f with SMTP id d2e1a72fcca58-8c87bcbced8mr498632b3a.17.1795113508015;
        Thu, 19 Nov 2026 10:38:28 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:27 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 59/64] mongodb: Fix build with current python, SCons, clang and OpenSSL
Date: Fri, 20 Nov 2026 07:33:27 +1300
Message-ID: <439c232c795f8dae61e957b9f2cef7c5b7b87a6d.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132749
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
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
