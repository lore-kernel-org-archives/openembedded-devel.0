Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ss5nH-0005hp-A9
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 07:30:27 +0200
Received: by ghbz2 with SMTP id z2so3368903ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 22:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=SSWasAoYEZBseUuTErA1fgcBU+lLMxW2G3hJ6STNO0E=;
	b=wVipaj2mXhShWa735BU65QGcx2RWHnoVByib8zuXpSDzhAsC+EkS1y87vTnUiU/bK1
	cFbRM9jgQl5WEKBv3PhOYXm4qPIEmP7uqMios706kzn8rNdzIitTvajXLMn2kphCFOaV
	HZM1F/uAVHaoga2vO13EYokBksu3oyAx5vttlvCNMaOxMMXGYjBDqb6i0E7e/uY/rDeq
	hxogmra4abiX1+iXSGBJGDhbkphg/SWGw67soAuv21RcgmmqUjp6uTTkSQMFJ19RHuUf
	XNnQ7wC7/zWQ/YWSJGplYm7zq6Tb9yGp6y2LhbJZcbhusbC7p1YPNhhHtSJan4rITycc
	f4yw==
Received: by 10.66.81.202 with SMTP id c10mr1770528pay.20.1342761543869;
	Thu, 19 Jul 2012 22:19:03 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ng8sm3217474pbc.13.2012.07.19.22.19.02
	(version=SSLv3 cipher=OTHER); Thu, 19 Jul 2012 22:19:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 22:18:56 -0700
Message-Id: <1342761538-19890-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
References: <1342761538-19890-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java][PATCH 3/5] openjdk-6: Fix build on ppc
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
X-List-Received-Date: Fri, 20 Jul 2012 05:30:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../icedtea-jdk-powerpc-atomic64.patch             |   65 ++++++++++++++++++++
 recipes-core/openjdk/openjdk-6-common.inc          |    2 +-
 recipes-core/openjdk/openjdk-6-release-6b24.inc    |    2 +
 3 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-powerpc-atomic64.patch

diff --git a/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-powerpc-atomic64.patch b/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-powerpc-atomic64.patch
new file mode 100644
index 0000000..cc5e4e8
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-6-6b24/icedtea-jdk-powerpc-atomic64.patch
@@ -0,0 +1,65 @@
+http://mail.openjdk.java.net/pipermail/zero-dev/2010-June/000346.html
+
+this cute C code does the same thing on powerpc as the assembly code that
+was here before. If the compiler was built with the SPE extensions instead
+of traditional FPU and double operations are performed in HW then we are
+one step further: The compiler turns this into evldd & evstdd. Voila :)
+
+This C code could also be activated on s390. The compiler turns this into
+a single mvc instruction which does the copy operation. I don't know if
+mvc's copy ability is atomic _or_ not and therefore I leave it as it.
+
+Signed-off-by: Sebastian Andrzej Siewior <bigeasy at linutronix.de>
+
+./openjdk-src-dir/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp
+Index: openjdk/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp
+===================================================================
+--- openjdk/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp.org	2011-11-14 14:07:32.000000000 -0800
++++ openjdk/hotspot/src/os_cpu/linux_zero/vm/os_linux_zero.hpp	2012-07-19 07:28:26.208405923 -0700
+@@ -25,6 +25,16 @@
+ 
+ #ifndef OS_CPU_LINUX_ZERO_VM_OS_LINUX_ZERO_HPP
+ #define OS_CPU_LINUX_ZERO_VM_OS_LINUX_ZERO_HPP
++#if defined(PPC) && !defined(_LP64)
++
++#ifndef __NO_FPRS__
++#define ATOMIC64_COPY_THROUGH_DOUBLE 1
++
++#elif defined(__SPE__) && !defined(_SOFT_DOUBLE)
++#define ATOMIC64_COPY_THROUGH_DOUBLE 1
++
++#endif
++#endif
+ 
+   static void setup_fpu() {}
+ 
+@@ -36,12 +46,23 @@
+ 
+   // Atomically copy 64 bits of data
+   static void atomic_copy64(volatile void *src, volatile void *dst) {
+-#if defined(PPC) && !defined(_LP64)
+-    double tmp;
+-    asm volatile ("lfd  %0, 0(%1)\n"
+-                  "stfd %0, 0(%2)\n"
+-                  : "=f"(tmp)
+-                  : "b"(src), "b"(dst));
++#if ATOMIC64_COPY_THROUGH_DOUBLE
++  /*
++   * In order to copy 8 bytes atomicly we rely on the trick that some
++   * architectures can load and store a double as a single operation.
++   * gcc picks the correct opcode here and with optimization turned on
++   * all temporary assignments are gone.                       - bigeasy
++   */
++   union {
++          double *d;
++          volatile void *v;
++   } s, d;
++
++   s.v = src;
++   d.v = dst;
++
++   *d.d = *s.d;
++
+ #elif defined(S390) && !defined(_LP64)
+     double tmp;
+     asm volatile ("ld  %0, 0(%1)\n"
diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index c1861b6..6e984f6 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -10,7 +10,7 @@ ICEDTEA = "NEEDS TO BE SET"
 S = "${WORKDIR}/${ICEDTEA}"
 B = "${S}/build"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 SRC_URI = "\
   ${ICEDTEA_URI} \
diff --git a/recipes-core/openjdk/openjdk-6-release-6b24.inc b/recipes-core/openjdk/openjdk-6-release-6b24.inc
index 00a14c2..b867fb3 100644
--- a/recipes-core/openjdk/openjdk-6-release-6b24.inc
+++ b/recipes-core/openjdk/openjdk-6-release-6b24.inc
@@ -81,6 +81,7 @@ ICEDTEAPATCHES = "\
 	file://icedtea-fix-xrender.patch;apply=no \
 	file://icedtea-shark-arm-linux-cpu-detection.patch;apply=no \
         file://icedtea-zero-hotspotfix.patch;apply=no \
+        file://icedtea-jdk-powerpc-atomic64.patch;apply=no \
 	"
 
 ICEDTEAPATCHES_append_libc-uclibc = " \
@@ -105,6 +106,7 @@ DISTRIBUTION_PATCHES = "\
 	patches/icedtea-fix-xrender.patch \
 	patches/icedtea-shark-arm-linux-cpu-detection.patch \
 	patches/icedtea-zero-hotspotfix.patch \
+	patches/icedtea-jdk-powerpc-atomic64.patch \
 	"
 
 DISTRIBUTION_PATCHES_append_libc-uclibc = "\
-- 
1.7.9.5



