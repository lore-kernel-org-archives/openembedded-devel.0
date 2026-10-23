Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8414.1792766000167246150
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 07:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Li2UcLgf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202610231433188aad35c61600020733-aiy4j1@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202610231433188aad35c61600020733
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 23 Oct 2026 16:33:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Z0zDGa3/kzvteVdwi5PA6Ll6VJCRe1jryLhradwwdAk=;
 b=Li2UcLgfp8PUgS3ewe0kaZXCzNeKi5R93dsZRE40eNTbj8b40iV0tjBQc1R8KeWKJ1Gjas
 PdzhNmE9c2yjEk7LW7tlITGrm/ISy3PMfo6Y+mOy0TrS0hTIejvPapTlvuyp4IzZ5zS+k1VS
 FzTVhBvqKsxSbyucDaumRO8ZmMffBrvMSpQemNNFoe0hhIbA3PMgBjDKs4KvMYt2x/zNbcgF
 8p8mDfDl4b1/Bppl8VJOy0XnfX5EJWwq15t5luVamcHboWHRbJCueIXaJJlAh2lnVyvKZXVW
 9DyPHHuQMh3Di81pXzeXPl1zXhLep0M+ZaA6eIDhdhmIZ28ET56YkHUA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 5/5] python3-grpcio-tools: upgrade 1.76.0 -> 1.84.1
Date: Fri, 23 Oct 2026 16:32:29 +0200
Message-ID: <20261023143229.184415-5-peter.marko@siemens.com>
In-Reply-To: <20261023143229.184415-1-peter.marko@siemens.com>
References: <20261023143229.184415-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 14:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131370
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Upgrade to addresses eMudhra certificates issue.
See https://emudhra.we-have-a-problem.com/

Sync all grpc recipes to the same version.

Removed obsolete patches:
* The compiler-argument fix is already handled upstream using
  shlex.split()
* Bundled protobuf now restricts musttail to AArch64 and x86-64, so the
  MIPS exclusion patch is unnecessary.

License-Update: switched from license to license expression
orig: License: Apache License 2.0
New:  License-Expression: Apache-2.0

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...f-Disable-musttail-attribute-on-mips.patch | 26 ---------
 ...-Do-not-mix-C-and-C-compiler-options.patch | 56 -------------------
 ...76.0.bb => python3-grpcio-tools_1.84.1.bb} |  7 +--
 3 files changed, 2 insertions(+), 87 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.76.0.bb => python3-grpcio-tools_1.84.1.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
deleted file mode 100644
index 0293cfe650..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 668d3e577073e51cc7e98b42d89c1e2b9b4e04b4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Sep 2022 19:09:15 -0700
-Subject: [PATCH] protobuf: Disable musttail attribute on mips
-
-See https://github.com/llvm/llvm-project/issues/57795
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- third_party/protobuf/src/google/protobuf/port_def.inc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/third_party/protobuf/src/google/protobuf/port_def.inc b/third_party/protobuf/src/google/protobuf/port_def.inc
-index edd6d51..6ddaf80 100644
---- a/third_party/protobuf/src/google/protobuf/port_def.inc
-+++ b/third_party/protobuf/src/google/protobuf/port_def.inc
-@@ -235,6 +235,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
- #error PROTOBUF_TAILCALL was previously defined
- #endif
- #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) &&  \
-+    !defined(__mips__) &&                                             \
-     !defined(_ARCH_PPC) && !defined(__wasm__) &&                      \
-     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__)
- // Compilation fails on ARM32: b/195943306
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
deleted file mode 100644
index b779d1441a..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 1f1f174ed3ca28bdf8bbb479eb1d948d934dcc53 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 17 Feb 2021 13:38:55 -0800
-Subject: [PATCH] setup.py: Do not mix C and C++ compiler options
-
-EXTRA_ENV_COMPILE_ARGS is used both with CC and CXX
-so using -std=c++11 or -std=gnu99 together will cause
-build time errors espcially with clang
-
-Keep '-std=c++11' to fix native build error
-with old gcc (such as gcc 5.4.0 on ubuntu 16.04), for clang
-we will remove them through GRPC_PYTHON_CFLAGS at do_compile
-in bb recipe.
-
-While export CC="gcc ", cc_args is None, it will
-cause subprocess.Popen always return 1. On centos 8, if you don't
-install package libatomic, there will be a native build error
-`cannot find /usr/lib64/libatomic.so.1.2.0'.
-
-Add no harm '-g' to cc_args if cc_args is empty.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- setup.py | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index ff27e67..964baf4 100644
---- a/setup.py
-+++ b/setup.py
-@@ -90,9 +90,11 @@ def check_linker_need_libatomic():
-         b"#include <atomic>\n"
-         + b"int main() { return std::atomic<int64_t>{}; }"
-     )
--    cxx = os.environ.get("CXX", "c++")
--    cpp_test = subprocess.Popen(
--        [cxx, "-x", "c++", "-std=c++17", "-"],
-+    cxx, cxx_args = os.environ.get('CXX').split(' ', 1) or 'c++'
-+    if not cxx_args:
-+      cxx_args = "-g"
-+
-+    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++17', '-'],
-         stdin=PIPE,
-         stdout=PIPE,
-         stderr=PIPE,
-@@ -103,7 +105,7 @@ def check_linker_need_libatomic():
-     # Double-check to see if -latomic actually can solve the problem.
-     # https://github.com/grpc/grpc/issues/22491
-     cpp_test = subprocess.Popen(
--        [cxx, "-x", "c++", "-std=c++17", "-", "-latomic"],
-+        [cxx, cxx_args, '-x', 'c++', '-std=c++17', '-', '-latomic'],
-         stdin=PIPE,
-         stdout=PIPE,
-         stderr=PIPE,
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.84.1.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.84.1.bb
index 36b3eacbf2..3f7f64c076 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.84.1.bb
@@ -3,16 +3,13 @@ HOMEPAGE = "https://www.grpc.io/"
 SECTION = "devel/python"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=0bcf70029ff7f40a132bf95381ee0b2d"
 
 inherit pypi setuptools3
 
 DEPENDS += "python3-grpcio"
 
-SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
-            file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
-            "
-SRC_URI[sha256sum] = "ce80169b5e6adf3e8302f3ebb6cb0c3a9f08089133abca4b76ad67f751f5ad88"
+SRC_URI[sha256sum] = "ca8a326df3441127d6709d992774844bb496db30b08f76ed5d1a912089e03f2c"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
