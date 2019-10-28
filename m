Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6E80F7F610
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 18:54:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4723mm61Gzz8V
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 19:54:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572288889;
	bh=+XXkktOKsoZnvlvWWdIFj8atJhQAHSvCUF6gZFOkAmU=;
	h=From:To:Subject:Date:From;
	b=s972Ve/IjQalf+JQCZDyiNWYvJ0Dbc1WggV3dmmvQ5edbtvOD4k7nSkjiiErupmSs
	MasfvLVgcrBwa9WjLAP/7/OJx10wmgntP+R1dquxY+2eQb0Cjq7CrgkzO12tbOqiHb
	2hq9MA+HFQXuWwhEPgDprC+BZmEt6s+AKeKJVVd+93YGo/txFv2lzWlhYe2BvFnZfX
	SKx7+Iop1TaBOO6asXB6Xl5E1E9AfHWmoEK65DfCBGOJ7E2d5glIsg54wpfLamSMNP
	bAeA3OkXtL1zkBmDUrJWgiMujWtGSjojIqRLKk5Rl/fE5Z28gxOvINuBgqLn6dPihX
	X+FSWBsIUrRHXbbMN+RrtuqaUYq5Ago+11mw61bIcCFXkJacAmUdFXxKZ+Aojf7keA
	CJ6HXl3vqs3PZi8my7vmVWDm2TNOCRYvBxN/k92U1rWpPWnZoeaoBdPTr6U2N+Kur9
	KS+I8xd4Vvnc7+sFyv7DUe4EMnU3d5NmRwL+4A9NvQcY/Px8sIC+pTSD+MIILPbgM1
	RKAFm2UnE5ivp9mtkbn86fcL0jIRm6M8238ehQMDiThrebnq4JXcWlWv2jnco5+5Bx
	ac/mZDyJlotzqOoHHYRYKFXbE44GuLT/UpS81i+79FEt/lNzb0Of4/PFNZZf7T+Dp6
	62JbxLAUKPPVt2r1L8pYZ7a0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 20:54:46 +0200
Message-Id: <20191028185447.3553-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] webrtc-audio-processing: Upgrade 0.3 -> 0.3.1
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
X-List-Received-Date: Mon, 28 Oct 2019 18:54:49 -0000

Backported patches removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...rotect-against-unsupported-CPU-types.patch | 29 ------
 .../0002-build-Add-ARM-64bit-support.patch    | 30 ------
 ...003-build-fix-architecture-detection.patch | 96 -------------------
 ....3.bb => webrtc-audio-processing_0.3.1.bb} | 12 +--
 4 files changed, 3 insertions(+), 164 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0001-build-Protect-against-unsupported-CPU-types.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0002-build-Add-ARM-64bit-support.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0003-build-fix-architecture-detection.patch
 rename meta-multimedia/recipes-multimedia/webrtc-audio-processing/{webrtc-audio-processing_0.3.bb => webrtc-audio-processing_0.3.1.bb} (61%)

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0001-build-Protect-against-unsupported-CPU-types.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0001-build-Protect-against-unsupported-CPU-types.patch
deleted file mode 100644
index 7668df35d..000000000
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0001-build-Protect-against-unsupported-CPU-types.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4945dca11bc4ddec60bd858f45212dc8f39638e0 Mon Sep 17 00:00:00 2001
-From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
-Date: Tue, 5 Jul 2016 18:07:45 -0400
-Subject: [PATCH 1/6] build: Protect against unsupported CPU types
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
-Upstream-Status: Accepted [expected in 0.4]
----
- configure.ac | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6f9553b..f5304b8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -70,8 +70,9 @@ AS_CASE(["${host_cpu}"],
-         [
-          HAVE_ARM=1
-          ARCH_CFLAGS="-DWEBRTC_ARCH_ARM"
--        ]
-+        ],
-     # FIXME: Add MIPS support, see webrtc/BUILD.gn for defines
-+    [AC_MSG_ERROR([Unsupported CPU type $host_cpu])]
- )
- AM_CONDITIONAL(HAVE_X86, [test "x${HAVE_X86}" = "x1"])
- AM_CONDITIONAL(HAVE_ARM, [test "x${HAVE_ARM}" = "x1"])
--- 
-2.11.0
-
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0002-build-Add-ARM-64bit-support.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0002-build-Add-ARM-64bit-support.patch
deleted file mode 100644
index 2e202b03c..000000000
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0002-build-Add-ARM-64bit-support.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b5bda3431159b6505dcd069641c863018c4d4309 Mon Sep 17 00:00:00 2001
-From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
-Date: Wed, 6 Jul 2016 15:18:15 -0400
-Subject: [PATCH 2/6] build: Add ARM 64bit support
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
-Upstream-Status: Accepted [expected in 0.4]
----
- configure.ac | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index f5304b8..be20514 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -71,6 +71,11 @@ AS_CASE(["${host_cpu}"],
-          HAVE_ARM=1
-          ARCH_CFLAGS="-DWEBRTC_ARCH_ARM"
-         ],
-+    [aarch64*],
-+        [
-+         HAVE_NEON=1
-+         ARCH_CFLAGS="-DWEBRTC_HAS_NEON -DWEBRTC_ARCH_ARM64"
-+        ],
-     # FIXME: Add MIPS support, see webrtc/BUILD.gn for defines
-     [AC_MSG_ERROR([Unsupported CPU type $host_cpu])]
- )
--- 
-2.11.0
-
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0003-build-fix-architecture-detection.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0003-build-fix-architecture-detection.patch
deleted file mode 100644
index 82e270fac..000000000
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/0003-build-fix-architecture-detection.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 7722fb8a3189fea0f6381f02a0e4f63c847f0393 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 6 Aug 2016 11:02:43 +0200
-Subject: [PATCH 3/6] build: fix architecture detection
-
-The current architecture detection, based on the "host_cpu" part of the
-tuple does not work properly for a number of reason:
-
- - The code assumes that if host_cpu starts with "arm" then ARM
-   instructions are available, which is incorrect. Indeed, Cortex-M
-   platforms can run Linux, they are ARM platforms (so host_cpu = arm),
-   but they don't support ARM instructions: they support only the
-   Thumb-2 instruction set.
-
- - The armv7 case is also not very useful, as it is not standard at all
-   to pass armv7 as host_cpu even if the host system is actually ARMv7
-   based.
-
- - For the same reason, the armv8 case is not very useful: ARMv8 is
-   AArch64, and there is already a separate case to handle this
-   architecture.
-
-So, this commit moves away from a host_cpu based logic, and instead
-tests using AC_CHECK_DECLS() the built-in definitions of the compiler:
-
- - If we have __ARM_ARCH_ISA_ARM defined, then it's an ARM processor
-   that supports the ARM instruction set (this allows to exclude Thumb-2
-   only processors).
-
- - If we have __ARM_ARCH_7A__, then we have an ARMv7-A processor, and
-   we can enable the corresponding optimizations
-
- - Same for __aarch64__, __i386__ and __x86_64__.
-
-In addition, we remove the AC_MSG_ERROR() that makes the build fail for
-all architectures but the ones that are explicitly supported. Indeed,
-webrtc-audio-processing builds just fine for other architectures (tested
-on MIPS), it's just that none of the architecture-specific optimizations
-will be used.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
-Upstream-Status: Accepted [expected in 0.4]
----
- configure.ac | 35 +++++++++++------------------------
- 1 file changed, 11 insertions(+), 24 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index be20514..e898014 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -55,30 +55,17 @@ AS_CASE(["${host}"],
- )
- AC_SUBST(PLATFORM_CFLAGS)
- 
--AS_CASE(["${host_cpu}"],
--    [i?86|x86_64],
--        [
--         HAVE_X86=1
--        ],
--    [armv7*|armv8*],
--        [
--         HAVE_ARM=1
--         HAVE_ARMV7=1
--         ARCH_CFLAGS="-DWEBRTC_ARCH_ARM -DWEBRTC_ARCH_ARM_V7"
--        ],
--    [arm*],
--        [
--         HAVE_ARM=1
--         ARCH_CFLAGS="-DWEBRTC_ARCH_ARM"
--        ],
--    [aarch64*],
--        [
--         HAVE_NEON=1
--         ARCH_CFLAGS="-DWEBRTC_HAS_NEON -DWEBRTC_ARCH_ARM64"
--        ],
--    # FIXME: Add MIPS support, see webrtc/BUILD.gn for defines
--    [AC_MSG_ERROR([Unsupported CPU type $host_cpu])]
--)
-+# Testing __ARM_ARCH_ISA_ARM since the code contains ARM instructions,
-+# which don't work on Thumb-2 only platforms (ARMv7-M).
-+AC_CHECK_DECLS([__ARM_ARCH_ISA_ARM],
-+	[HAVE_ARM=1; ARCH_CFLAGS="${ARCH_CFLAGS} -DWEBRTC_ARCH_ARM"])
-+AC_CHECK_DECLS([__ARM_ARCH_7A__],
-+	[HAVE_ARMV7=1; ARCH_CFLAGS="${ARCH_CFLAGS} -DWEBRTC_ARCH_ARM_V7"])
-+AC_CHECK_DECLS([__aarch64__],
-+	[HAVE_NEON=1; ARCH_CFLAGS="${ARCH_CFLAGS} -DWEBRTC_HAS_NEON -DWEBRTC_ARCH_ARM64"])
-+AC_CHECK_DECLS([__i386__], [HAVE_X86=1])
-+AC_CHECK_DECLS([__x86_64__], [HAVE_X86=1])
-+
- AM_CONDITIONAL(HAVE_X86, [test "x${HAVE_X86}" = "x1"])
- AM_CONDITIONAL(HAVE_ARM, [test "x${HAVE_ARM}" = "x1"])
- AM_CONDITIONAL(HAVE_ARMV7, [test "x${HAVE_ARMV7}" = "x1"])
--- 
-2.11.0
-
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.1.bb
similarity index 61%
rename from meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb
rename to meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.1.bb
index dbba2f488..b94dcf9f1 100644
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.1.bb
@@ -9,21 +9,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=da08a38a32a340c5d91e13ee86a118f2 \
                     file://webrtc/common.h;beginline=1;endline=9;md5=41f7322d91deabaf0acbbd0b8d0bc548 \
 "
 
-# Note that patch 3 effectively reverts patches 1 and 2. The only reason
-# why patches 1 and 2 are included is that otherwise patch 3 wouldn't
-# apply cleanly.
 SRC_URI = "http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/${BP}.tar.xz \
-           file://0001-build-Protect-against-unsupported-CPU-types.patch \
-           file://0002-build-Add-ARM-64bit-support.patch \
-           file://0003-build-fix-architecture-detection.patch \
            file://0004-typedefs.h-add-support-for-64-bit-and-big-endian-MIP.patch \
            file://0005-typedefs.h-add-support-for-PowerPC.patch \
            file://0006-common_audio-implement-endianness-conversion-in-wav-.patch \
            file://riscv_support.patch \
 "
 
-SRC_URI[md5sum] = "336ae032f608e65808ac577cde0ab72c"
-SRC_URI[sha256sum] = "756e291d4f557d88cd50c4fe3b8454ec238362d22cedb3e6173240d90f0a80fa"
+SRC_URI[md5sum] = "6e10724ca34bcbc715a4c208273acb0c"
+SRC_URI[sha256sum] = "a0fdd938fd85272d67e81572c5a4d9e200a0c104753cb3c209ded175ce3c5dbf"
 
 LDFLAGS_append_libc-musl = " -lexecinfo"
-inherit autotools
+inherit autotools pkgconfig
-- 
2.17.1


