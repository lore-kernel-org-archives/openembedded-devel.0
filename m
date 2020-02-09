Return-Path: <okaya@kernel.org>
X-Greylist: delayed 545 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 09 Feb 2020 03:55:49 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 09BD760172
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 03:55:49 +0000 (UTC)
Received: from
	sinanubuntu1604.jnhiziqmwaketkadpjb23kppec.bx.internal.cloudapp.net
	(unknown [138.91.121.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 04B7E20820;
	Sun,  9 Feb 2020 03:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581220006;
	bh=9qju7Q9iSSyGgLjXADqfvkFozVGZWJLwL/uHz2KkZqY=;
	h=From:To:Cc:Subject:Date:From;
	b=Jk8DNc4eyHxCSQkYzbcuWLvep1i9cRxnROmYoJTrXLVorda7Roa4kAOGr708Xa4CL
	zAYahGEGeXm6YOTwqSk0mSRjSGC3xs4HTeX6Kv9UuWlEmrmWpzCTrngMpSgbBHaWks
	D6SjvpCpELiND6vvT8ySPmGdHvvxtZtQTgbK9YFg=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 03:46:41 +0000
Message-Id: <20200209034641.19378-1-okaya@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Sinan Kaya <sinan.kaya@microsoft.com>,
	Changyi Li <Changyu.Li@microsoft.com>
Subject: [meta-oe][PATCH] abseil-cpp: add recipe for git version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Feb 2020 03:55:50 -0000
Content-Transfer-Encoding: 8bit

The repository contains the Abseil C++ library code. Abseil is an
open-source collection of C++ code (compliant to C++11) designed to
augment the C++ standard library.

https://github.com/abseil/abseil-cpp

Signed-off-by: Changyi Li <Changyu.Li@microsoft.com>
Signed-off-by: Sinan Kaya <sinan.kaya@microsoft.com>
---
 ...e-maes-option-from-cross-compilation.patch | 53 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              | 27 ++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch
new file mode 100644
index 0000000000..4c41cd8902
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch
@@ -0,0 +1,53 @@
+From 70926666f7c5c35add363e3bcade6eaabace7206 Mon Sep 17 00:00:00 2001
+From: Sinan Kaya <sinan.kaya@microsoft.com>
+Date: Mon, 3 Feb 2020 03:25:57 +0000
+Subject: [PATCH] Remove maes option from cross-compilation
+
+---
+ absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
+ absl/copts/GENERATED_copts.bzl         | 4 ----
+ absl/copts/copts.py                    | 4 ----
+ 3 files changed, 12 deletions(-)
+
+diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERATED_AbseilCopts.cmake
+index 01bd40b..af99694 100644
+--- a/absl/copts/GENERATED_AbseilCopts.cmake
++++ b/absl/copts/GENERATED_AbseilCopts.cmake
+@@ -230,7 +230,3 @@ list(APPEND ABSL_RANDOM_HWAES_MSVC_X64_FLAGS
+     "/Ob2"
+ )
+ 
+-list(APPEND ABSL_RANDOM_HWAES_X64_FLAGS
+-    "-maes"
+-    "-msse4.1"
+-)
+diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts.bzl
+index 82f332f..9a548d1 100644
+--- a/absl/copts/GENERATED_copts.bzl
++++ b/absl/copts/GENERATED_copts.bzl
+@@ -231,7 +231,3 @@ ABSL_RANDOM_HWAES_MSVC_X64_FLAGS = [
+     "/Ob2",
+ ]
+ 
+-ABSL_RANDOM_HWAES_X64_FLAGS = [
+-    "-maes",
+-    "-msse4.1",
+-]
+diff --git a/absl/copts/copts.py b/absl/copts/copts.py
+index 068abce..c2f70fb 100644
+--- a/absl/copts/copts.py
++++ b/absl/copts/copts.py
+@@ -203,10 +203,6 @@ COPT_VARS = {
+     # to improve performance of some random bit generators.
+     "ABSL_RANDOM_HWAES_ARM64_FLAGS": ["-march=armv8-a+crypto"],
+     "ABSL_RANDOM_HWAES_ARM32_FLAGS": ["-mfpu=neon"],
+-    "ABSL_RANDOM_HWAES_X64_FLAGS": [
+-        "-maes",
+-        "-msse4.1",
+-    ],
+     "ABSL_RANDOM_HWAES_MSVC_X64_FLAGS": [
+         "/O2",  # Maximize speed
+         "/Ob2",  # Aggressive inlining
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
new file mode 100644
index 0000000000..c7077c129f
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Abseil is a cpp library like STL"
+DESCRIPTION = "It's got containers, algorithms, useful stuff!"
+HOMEPAGE = ""
+SECTION = "libs"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
+
+SRCREV = "aa844899c937bde5d2b24f276b59997e5b668bde"
+BRANCH = "lts_2019_08_08"
+SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}         \
+           file://0001-Remove-maes-option-from-cross-compilation.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'aarch64', ' -march=armv8-a+crypto', '', d)}"
+TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'x64', ' -maes -msse4.1', '', d)}"
+
+CXXFLAGS_append_class-nativesdk = " -Wl,--no-as-needed -fPIC"
+CXXFLAGS_append_class-native = " -Wl,--no-as-needed -fPIC"
+CXXFLAGS_append_class-target = " -fPIC"
+
+inherit cmake
+
+BBCLASSEXTEND = "native nativesdk"
+ALLOW_EMPTY_${PN} = "1"
+
-- 
2.23.0


