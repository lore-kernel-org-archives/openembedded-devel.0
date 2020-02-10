Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 56EE160BE2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 17:49:31 +0000 (UTC)
Received: from
	sinanubuntu1604.jnhiziqmwaketkadpjb23kppec.bx.internal.cloudapp.net
	(unknown [52.170.189.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4DE632080C;
	Mon, 10 Feb 2020 17:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581356972;
	bh=/WiEgjKINraVEaKr2oPhUZzKo6aI/CNU7T9maERRmJk=;
	h=From:To:Cc:Subject:Date:From;
	b=rlhzXZJ0AKgPhmD64pBY1wI8rXB1LUrRsxt1rySAjt9TlrIAXMtimGlbO03NMrWLe
	Qj7noABcM/RlqQDL7OkMVQ/4ICXD9jpQw7WwefEMNLboYu2ltNYvEgsoZW8zDBNMJ/
	zZJ7bPqWozfLmENYtmUn5soZi1BVuIrOBcmkR6co=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Feb 2020 17:49:29 +0000
Message-Id: <20200210174929.34851-1-okaya@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Sinan Kaya <sinan.kaya@microsoft.com>,
	Changyu Li <Changyu.Li@microsoft.com>
Subject: [meta-oe][PATCH v3] abseil-cpp: add recipe for git version
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
X-List-Received-Date: Mon, 10 Feb 2020 17:49:31 -0000
Content-Transfer-Encoding: 8bit

The repository contains the Abseil C++ library code. Abseil is an
open-source collection of C++ code (compliant to C++11) designed to
augment the C++ standard library.

https://github.com/abseil/abseil-cpp

Signed-off-by: Changyu Li <Changyu.Li@microsoft.com>
Signed-off-by: Sinan Kaya <sinan.kaya@microsoft.com>
---
 ...e-maes-option-from-cross-compilation.patch | 53 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              | 41 ++++++++++++++
 2 files changed, 94 insertions(+)
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
index 0000000000..2d4ee0bb92
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Abseil is a cpp library like STL"
+DESCRIPTION = "Abseil provides pieces missing from the C++ standard. Contains \
+additional useful libraries like algorithm, container, debugging, hash, memory, \
+meta, numeric, strings, synchronization, time, types and utility"
+HOMEPAGE = "https://abseil.io/"
+SECTION = "libs"
+LICENSE = "Apache-2.0"
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
+TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'x64', ' -maes -msse4.1', '', d)}"
+
+CXXFLAGS_append = " -fPIC"
+ASNEEDED_class-native = ""
+ASNEEDED_class-nativesdk = ""
+
+inherit cmake
+
+BBCLASSEXTEND = "native nativesdk"
+ALLOW_EMPTY_${PN} = "1"
+
+python () {
+    arch = d.getVar("TARGET_ARCH")
+
+    if arch == "aarch64":
+        tunes = d.getVar("TUNE_FEATURES")
+        if not tunes:
+            return
+        pkgn = d.getVar("PN")
+        pkgv = d.getVar("PV")
+        if "crypto" not in tunes:
+            raise bb.parse.SkipPackage("%s-%s Needs support for crypto on armv8" % (pkgn, pkgv))
+}
+
-- 
2.23.0


