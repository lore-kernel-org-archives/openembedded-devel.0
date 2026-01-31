Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB075E7C6F9
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 22:24:00 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19003.1769898237042774906
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jan 2026 14:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OMVvL2W1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260131222355c6e07365ca00020778-eibm2l@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260131222355c6e07365ca00020778
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 31 Jan 2026 23:23:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ckJypP9AxlBMRSfqBaPAenEhokwvoE4IFTOOlZ7mtxo=;
 b=OMVvL2W1nQVv+lZcTMBRon0oKTZf53YyoAiJCssqk5Po5gHRqK7DQZzqy96pMfggEe7jFd
 E9QePmONz2sGzMlufWibG7jJZ8LDos92UfW55H5RS8EnU0dUAZgXFm5ccLV8eeXLJhySWCRF
 Ncr/enMqJn64X4CsKv3t0EjsHu4QGciRCyfrOlM++ZkSgjhGvUjR/ECxYI9AdmwTt+4cbvs0
 EstqRiuOaEmRDr0jKRFB7azD4ILi+CzD29xGl9lkszppH02bT2o0C+5xNVIucE9mYNatpRZH
 A6LTIAtLdTAbjip2PNaKO1D99atJHxoVzKNB0LN6A1gFjc1eHvkQ95jw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 2/2] protobuf: upgrade 6.31.1 -> 6.33.5
Date: Sat, 31 Jan 2026 23:23:46 +0100
Message-Id: <20260131222346.307600-2-peter.marko@siemens.com>
In-Reply-To: <20260131222346.307600-1-peter.marko@siemens.com>
References: <20260131222346.307600-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 22:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124030

From: Peter Marko <peter.marko@siemens.com>

* rebase existing patches
* drop mips clang patch as this was fixed upstream via [1] to build only
  for platforms supporting it.
* add PV to SRC_URI
* add variables to automatically calculate branch and tag
* fix includedir for utf8_range in ptest compilation

[1] https://github.com/protocolbuffers/protobuf/commit/719f3037032b2e952afe7fc49152cc4be38fa7a3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: no change

 .../0001-Fix-build-on-mips-clang.patch        | 34 -------------------
 ...buf-native-build-failure-with-gcc-10.patch |  6 ++--
 ...{protobuf_6.31.1.bb => protobuf_6.33.5.bb} |  9 +++--
 3 files changed, 9 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_6.31.1.bb => protobuf_6.33.5.bb} (93%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
deleted file mode 100644
index 1f5c9127de..0000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From cd6c5f36c0dc38e4734b74b03923489b7bfb9aba Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 10 Mar 2025 19:59:19 -0700
-Subject: [PATCH] Fix build on mips/clang
-
-clang20 crashes on mips, until its fixed upstream disable tailcall on
-mips
-
-https://github.com/llvm/llvm-project/issues/51709
-
-Upstream-Status: Inappropriate [Clang workaround]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Rebase to v5.29.4
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/google/protobuf/port_def.inc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/port_def.inc
-index 56f995e45..428d096b3 100644
---- a/src/google/protobuf/port_def.inc
-+++ b/src/google/protobuf/port_def.inc
-@@ -227,6 +227,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
- #error PROTOBUF_TAILCALL was previously defined
- #endif
- #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) &&  \
-+    !defined(__mips__) && \
-     !defined(_ARCH_PPC) && !defined(__wasm__) &&                      \
-     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__)
- // Compilation fails on ARM32: b/195943306
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf-native-build-failure-with-gcc-10.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf-native-build-failure-with-gcc-10.patch
index 2edba6b7eb..788db3e406 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf-native-build-failure-with-gcc-10.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf-native-build-failure-with-gcc-10.patch
@@ -30,9 +30,9 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index e90cb8aa2..3ffac1307 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -14,6 +14,10 @@ endif()
- # Project
- project(protobuf C CXX)
+@@ -18,6 +18,10 @@ if(CMAKE_CXX_STANDARD AND CMAKE_CXX_STANDARD LESS 17)
+   message(FATAL_ERROR "The minimum supported C++ standard is C++ 17")
+ endif()
  
 +set(CMAKE_CXX_STANDARD 17)
 +set(CMAKE_CXX_STANDARD_REQUIRED ON)
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.5.bb
similarity index 93%
rename from meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_6.33.5.bb
index 37b26b610d..4f5f53d4e5 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.5.bb
@@ -10,17 +10,19 @@ LIC_FILES_CHKSUM = " \
     file://third_party/utf8_range/LICENSE;md5=d4974d297231477b2ff507c35d61c13c \
 "
 
+PROTOC_VERSION = "v${@d.getVar('PV').split('.', 1)[1]}"
+PROTOC_BRANCH = "${@d.getVar('PV').split('.', 2)[1]}.x"
+
 DEPENDS = "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "74211c0dfc2777318ab53c2cd2c317a2ef9012de"
+SRCREV = "b6f9284da830b69be787732ffdaa35049d20a088"
 
-SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=31.x;protocol=https \
+SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=${PROTOC_BRANCH};protocol=https;tag=${PROTOC_VERSION} \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
            file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch \
            "
-SRC_URI:append:mipsarcho32:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d\.\d+\.\d+)"
 
@@ -70,6 +72,7 @@ do_compile_ptest() {
 	# Adapt uf8_range.pc
 	cp "${B}/third_party/utf8_range/utf8_range.pc" "${B}/${TEST_SRC_DIR}/utf8_range.pc"
 	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/utf8_range.pc"
+	sed -e 's|includedir=.*|includedir=${S}/third_party/utf8_range|' -i "${B}/${TEST_SRC_DIR}/utf8_range.pc"
 	sed -e 's|Libs:|Libs= -L${B}/third_party/utf8_range |' -i "${B}/${TEST_SRC_DIR}/utf8_range.pc"
 	# Until out-of-tree build of examples is supported, we have to use this approach
 	sed -e 's|../src/google/protobuf/.libs/timestamp.pb.o|${B}/CMakeFiles/libprotobuf.dir/src/google/protobuf/timestamp.pb.cc.o|' -i "${B}/${TEST_SRC_DIR}/Makefile"

