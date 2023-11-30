Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8E3C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 05:39:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.66183.1701322788877841745
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 21:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=MVizix9O;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701322789; x=1732858789;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=l2umRTPVqX0xdelQTeac/eDHYuvuYEr7IogAGLZbcMg=;
  b=MVizix9ODgygVLd7eM2LyLYEIWBZAfmmAxZyEPm7wi8TXfPyVv7oh/ml
   8g2CVqD+HwAdV8EWwkDFTGzPyhbOgacqbQwbYyY7JWv2iCL8/go+X44HH
   HxdMO+mk+Xhp8BAZ7g3bMqs7SzaSSJZTy3x7GZ2xyhM+dcVxgFq1BuuK0
   Tq28DKR0FXfCabF0CsVXHhnBrOouX3zDDzqRkzqUFhKYvEYWTq+Gq7y+l
   i+YtZ6Xt53eOOtfzQhQBOj33fOC1mb2UPUljAvaE4AgAY9nzTI/w7UkDj
   rUEyYV2nSV8YXHVzlIiR2hTPYCYGN23uA3gPnwlHGqkOQ/bpcgANBB9LK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="459764570"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="459764570"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 21:39:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745510324"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="745510324"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga006.jf.intel.com with ESMTP; 29 Nov 2023 21:39:48 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] tbb: enable NUMA/Hybrid CPU support
Date: Thu, 30 Nov 2023 13:20:07 +0800
Message-Id: <20231130052007.2573333-2-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231130052007.2573333-1-naveen.kumar.saini@intel.com>
References: <20231130052007.2573333-1-naveen.kumar.saini@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 05:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107164

oneTBB relies on HWLOC* to identify the underlying topology
of the system to optimize thread scheduling and memory allocation.

Ref:
https://oneapi-src.github.io/oneTBB/GSG/next_steps.html#hybrid-cpu-and-numa-support

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 ....cmake-remove-cross-compiation-check.patch | 33 +++++++++++++++++++
 meta-oe/recipes-support/tbb/tbb_2021.11.0.bb  | 12 ++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch b/meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch
new file mode 100644
index 000000000..640b13170
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0001-hwloc_detection.cmake-remove-cross-compiation-check.patch
@@ -0,0 +1,33 @@
+From 7ffc1eba8596544d6e3af0fd5f4004fff6d56f84 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Wed, 29 Nov 2023 15:48:57 +0800
+Subject: [PATCH] hwloc_detection.cmake: remove cross-compiation check
+
+This check is preventing pkgconfig to
+search for hwloc under cross-compilation.
+
+pkgconfig able to find hwloc pkg from sysroot.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ cmake/hwloc_detection.cmake | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/cmake/hwloc_detection.cmake b/cmake/hwloc_detection.cmake
+index 47233b17..5a7e84c3 100644
+--- a/cmake/hwloc_detection.cmake
++++ b/cmake/hwloc_detection.cmake
+@@ -46,8 +46,6 @@ endforeach()
+ unset(HWLOC_TARGET_NAME)
+ 
+ if (NOT HWLOC_TARGET_EXPLICITLY_DEFINED AND
+-    # No hwloc auto detection for cross compilation
+-    NOT CMAKE_CROSSCOMPILING AND
+     NOT TBB_DISABLE_HWLOC_AUTOMATIC_SEARCH
+ )
+     find_package(PkgConfig QUIET)
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
index 1a1d9988b..f834726bd 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
@@ -8,22 +8,25 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327"
 
 DEPENDS:append:libc-musl = " libucontext"
+DEPENDS:append:class-target = " hwloc"
 
 PE = "1"
 
 BRANCH = "onetbb_2021"
 SRCREV = "8b829acc65569019edb896c5150d427f288e8aba"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
+            file://0001-hwloc_detection.cmake-remove-cross-compiation-check.patch \
 "
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake pkgconfig
 
 # test build fails, error: 'mallinfo mallinfo()' is deprecated
 EXTRA_OECMAKE += " \
                     -DTBB_TEST=OFF \
                     -DCMAKE_BUILD_TYPE=Release \
                 "
+
 # Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (ignoring target-abi)
 # tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-native/usr/bin/riscv64-oe-linux/riscv64-oe-linux-ld: /tmp/lto-llvm-264bc2.o: can't link soft-float modules with double-float modules
 # tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-native/usr/bin/riscv64-oe-linux/riscv64-oe-linux-ld: failed to merge target specific data of file /tmp/lto-llvm-264bc2.o
@@ -49,4 +52,11 @@ LDFLAGS:append:libc-musl = " -lucontext"
 # The latest version of oneTBB does not support PPC
 COMPATIBLE_MACHINE:powerpc = "(!.*ppc).*"
 
+
+do_install:append:class-target() {
+    # fix for qa check buildpaths
+    sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/TBB/TBBTargets.cmake
+}
+
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.37.3


