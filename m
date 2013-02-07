Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U3ZTB-0007NJ-JI
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Feb 2013 22:57:27 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B3C2BD22E8;
	Thu,  7 Feb 2013 11:51:21 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2013 11:50:57 +0100
Message-Id: <1360234263-18278-3-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 2/8] tbb: add 4.1-20121003 version with preliminary AArch64 support
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
X-List-Received-Date: Thu, 07 Feb 2013 21:57:27 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../recipes-support/tbb/tbb/cross-compile.patch    |  25 +++
 meta-oe/recipes-support/tbb/tbb/tbb.pc             |  11 +
 .../recipes-support/tbb/tbb/tbb41-aarch64.patch    | 233 +++++++++++++++++++++
 meta-oe/recipes-support/tbb/tbb_4.1.bb             |  31 +++
 4 files changed, 300 insertions(+)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/cross-compile.patch
 create mode 100644 meta-oe/recipes-support/tbb/tbb/tbb.pc
 create mode 100644 meta-oe/recipes-support/tbb/tbb/tbb41-aarch64.patch
 create mode 100644 meta-oe/recipes-support/tbb/tbb_4.1.bb

diff --git a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch b/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
new file mode 100644
index 0000000..b970a37
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
@@ -0,0 +1,25 @@
+Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+Upstream-Status: unsuitable
+---
+ build/linux.gcc.inc |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+--- tbb41_20121003oss.orig/build/linux.gcc.inc
++++ tbb41_20121003oss/build/linux.gcc.inc
+@@ -40,12 +40,13 @@ DYLIB_KEY = -shared
+ EXPORT_KEY = -Wl,--version-script,
+ LIBDL = -ldl
+ 
+ TBB_NOSTRICT = 1
+ 
+-CPLUS = g++
+-CONLY = gcc
++CPLUS = $(CXX)
++CONLY = $(CC)
++CPLUS_FLAGS = $(CXXFLAGS)
+ LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
+ LIBS += -lpthread -lrt
+ LINK_FLAGS = -Wl,-rpath-link=.
+ C_FLAGS = $(CPLUS_FLAGS)
+ # gcc 4.4 and higher support -std=c++0x
diff --git a/meta-oe/recipes-support/tbb/tbb/tbb.pc b/meta-oe/recipes-support/tbb/tbb/tbb.pc
new file mode 100644
index 0000000..644b64f
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/tbb.pc
@@ -0,0 +1,11 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: Threading Building Blocks
+Description: Intel's parallelism library for C++
+URL: http://www.threadingbuildingblocks.org/
+Version: 3.0+r018
+Libs: -L${libdir} -ltbb
+Cflags: -I${includedir} 
diff --git a/meta-oe/recipes-support/tbb/tbb/tbb41-aarch64.patch b/meta-oe/recipes-support/tbb/tbb/tbb41-aarch64.patch
new file mode 100644
index 0000000..3366f87
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/tbb41-aarch64.patch
@@ -0,0 +1,233 @@
+Author: Leif Lindholm <leif.lindholm@linaro.org>
+
+Upstream-Status: not there yet
+
+https://bugs.launchpad.net/linaro-aarch64/+bug/1091353
+
+diff --git a/build/linux.inc b/build/linux.inc
+index bdad142..7db323c 100644
+--- a/build/linux.inc
++++ b/build/linux.inc
+@@ -104,6 +104,9 @@ endif
+ ifeq ($(arch),sparc)
+         def_prefix = lin64
+ endif
++ifeq ($(arch),aarch64)
++        def_prefix = lin64
++endif
+ ifeq (,$(def_prefix))
+     ifeq (64,$(findstring 64,$(arch)))
+             def_prefix = lin64
+diff --git a/include/tbb/machine/linux_aarch64.h b/include/tbb/machine/linux_aarch64.h
+new file mode 100644
+index 0000000..e3ebc36
+--- /dev/null
++++ b/include/tbb/machine/linux_aarch64.h
+@@ -0,0 +1,153 @@
++/*
++    Copyright 2013 Linaro  All Rights Reserved.
++
++    This file is part of Threading Building Blocks.
++
++    Threading Building Blocks is free software; you can redistribute it
++    and/or modify it under the terms of the GNU General Public License
++    version 2 as published by the Free Software Foundation.
++
++    Threading Building Blocks is distributed in the hope that it will be
++    useful, but WITHOUT ANY WARRANTY; without even the implied warranty
++    of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++    GNU General Public License for more details.
++
++    You should have received a copy of the GNU General Public License
++    along with Threading Building Blocks; if not, write to the Free Software
++    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
++
++    As a special exception, you may use this file as part of a free software
++    library without restriction.  Specifically, if other files instantiate
++    templates or use macros or inline functions from this file, or you compile
++    this file and link it with other files to produce an executable, this
++    file does not by itself cause the resulting executable to be covered by
++    the GNU General Public License.  This exception does not however
++    invalidate any other reasons why the executable file might be covered by
++    the GNU General Public License.
++*/
++
++/*
++    This is the TBB implementation for the ARM AArch64 architecture.
++*/ 
++
++#ifndef __TBB_machine_H
++#error Do not include this file directly; include tbb_machine.h instead
++#endif
++
++#if !(__aarch64__)
++#error Threading Building Blocks AArch64 port requires an AArch64 architecture.
++#endif
++
++#include <sys/param.h>
++#include <unistd.h>
++
++#define __TBB_WORDSIZE 8
++
++#ifndef __BYTE_ORDER__
++    // Hopefully endianness can be validly determined at runtime.
++    // This may silently fail in some embedded systems with page-specific endianness.
++#elif __BYTE_ORDER__==__ORDER_BIG_ENDIAN__
++    #define __TBB_BIG_ENDIAN 1
++#elif __BYTE_ORDER__==__ORDER_LITTLE_ENDIAN__
++    #define __TBB_BIG_ENDIAN 0
++#else
++    #define __TBB_BIG_ENDIAN -1 // not currently supported
++#endif
++                 
++
++#define __TBB_compiler_fence() __asm__ __volatile__("": : :"memory")
++#define __TBB_control_consistency_helper() __TBB_compiler_fence()
++
++#define __TBB_aarch64_inner_shareable_barrier() __asm__ __volatile__("dmb ish": : :"memory")
++#define __TBB_acquire_consistency_helper() __TBB_aarch64_inner_shareable_barrier()
++#define __TBB_release_consistency_helper() __TBB_aarch64_inner_shareable_barrier()
++#define __TBB_full_memory_fence() __TBB_aarch64_inner_shareable_barrier()
++
++//--------------------------------------------------
++// Compare and swap
++//--------------------------------------------------
++
++/**
++ * Atomic CAS for 32 bit values, if *ptr==comparand, then *ptr=value,
++ * returns *ptr
++ *
++ * @param ptr pointer to value in memory to be swapped with value
++ *  if *ptr==comparand
++ * @param value value to assign *ptr to if *ptr==comparand
++ * @param comparand value to compare with *ptr
++ * @return value originally in memory at ptr, regardless of success
++*/
++static inline int32_t __TBB_machine_cmpswp4(volatile void *ptr, int32_t value, int32_t comparand )
++{
++    int32_t oldval, res;
++
++    do {
++    __asm__ __volatile__(
++	    "       ldxr    %w1, [%2]\n"
++	    "       mov     %w0, #0\n"
++	    "       cmp     %w1, %w3\n"
++	    "       b.ne    1f\n"
++	    "       stxr    %w0, %w4, [%2]\n"
++	    "1:\n"
++	    : "=&r" (res), "=&r" (oldval)
++	    : "r" (ptr), "Ir" (value), "r" (comparand)
++	    : "cc");
++    } while (res);
++
++    return oldval;
++}
++
++/**
++ * Atomic CAS for 64 bit values, if *ptr==comparand, then *ptr=value,
++ * returns *ptr
++ *
++ * @param ptr pointer to value in memory to be swapped with value
++ *  if *ptr==comparand
++ * @param value value to assign *ptr to if *ptr==comparand
++ * @param comparand value to compare with *ptr
++ * @return value originally in memory at ptr, regardless of success
++ */
++static inline int64_t __TBB_machine_cmpswp8(volatile void *ptr, int64_t value, int64_t comparand )
++{
++    int64_t oldval;
++    int64_t res;
++
++    do {
++        __asm__ __volatile__(
++		"       ldxr    %1, [%2]\n"
++		"       mov     %w0, #0\n"
++		"       cmp     %1, %3\n"
++		"       b.ne    1f\n"
++		"       stxr    %w0, %4, [%2]\n"
++		"1:\n"
++		: "=&r" (res), "=&r" (oldval)
++		: "r" (ptr), "Ir" (value), "r" (comparand)
++		: "cc");
++    } while (res);
++
++    return oldval;
++}
++
++inline void __TBB_machine_pause (int32_t delay )
++{
++    while(delay>0)
++    {
++	__TBB_compiler_fence();
++        delay--;
++    }
++}
++
++// Machine specific atomic operations
++
++#define __TBB_CompareAndSwap4(P,V,C) __TBB_machine_cmpswp4(P,V,C)
++#define __TBB_CompareAndSwap8(P,V,C) __TBB_machine_cmpswp8(P,V,C)
++//#define __TBB_CompareAndSwapW(P,V,C) __TBB_machine_cmpswp4(P,V,C)
++#define __TBB_Pause(V) __TBB_machine_pause(V)
++
++// Use generics for some things
++#define __TBB_USE_GENERIC_PART_WORD_CAS				1
++#define __TBB_USE_GENERIC_FETCH_ADD				1
++#define __TBB_USE_GENERIC_FETCH_STORE				1
++#define __TBB_USE_GENERIC_HALF_FENCED_LOAD_STORE		1
++#define __TBB_USE_GENERIC_RELAXED_LOAD_STORE                    1
++#define __TBB_USE_GENERIC_SEQUENTIAL_CONSISTENCY_LOAD_STORE	1
+diff --git a/include/tbb/tbb_machine.h b/include/tbb/tbb_machine.h
+index 752062e..5342877 100644
+--- a/include/tbb/tbb_machine.h
++++ b/include/tbb/tbb_machine.h
+@@ -223,6 +223,8 @@ template<> struct atomic_selector<8> {
+         #include "machine/linux_ia64.h"
+     #elif __powerpc__
+         #include "machine/mac_ppc.h"
++    #elif __aarch64__
++        #include "machine/linux_aarch64.h"
+     #elif __TBB_GCC_BUILTIN_ATOMICS_PRESENT
+         #include "machine/gcc_generic.h"
+     #endif
+@@ -391,10 +393,12 @@ void spin_wait_until_eq( const volatile T& location, const U value ) {
+ //  - The operation assumes that the architecture consistently uses either little-endian or big-endian:
+ //      it does not support mixed-endian or page-specific bi-endian architectures.
+ // This function is the only use of __TBB_BIG_ENDIAN.
+-#if (__TBB_BIG_ENDIAN!=-1)
++#if (__TBB_BIG_ENDIAN==-1)
+     #if ( __TBB_USE_GENERIC_PART_WORD_CAS)
+         #error generic implementation of part-word CAS was explicitly disabled for this configuration
+     #endif
++#endif
++
+ template<typename T>
+ inline T __TBB_MaskedCompareAndSwap (volatile T * const ptr, const T value, const T comparand ) {
+     struct endianness{ static bool is_big_endian(){
+@@ -432,7 +436,6 @@ inline T __TBB_MaskedCompareAndSwap (volatile T * const ptr, const T value, cons
+         else continue;                                     // CAS failed but the bits of interest left unchanged
+     }
+ }
+-#endif
+ template<size_t S, typename T>
+ inline T __TBB_CompareAndSwapGeneric (volatile void *ptr, T value, T comparand );
+ 
+diff --git a/src/tbbmalloc/frontend.cpp b/src/tbbmalloc/frontend.cpp
+index 4e81870..ddac9e0 100644
+--- a/src/tbbmalloc/frontend.cpp
++++ b/src/tbbmalloc/frontend.cpp
+@@ -653,6 +653,14 @@ static inline unsigned int highestBitPos(unsigned int n)
+ #   error highestBitPos() not implemented for this platform
+ # endif
+ 
++#elif __aarch64__
++    __asm__ __volatile__
++    (
++       "clz %0, %1\n"
++       "mov %1, %2\n"
++       "sub %0, %1, %0\n"
++       :"=&r" (pos), "=&r" (n) :"I" (31)
++    );
+ #else
+     static unsigned int bsr[16] = {0/*N/A*/,6,7,7,8,8,8,8,9,9,9,9,9,9,9,9};
+     pos = bsr[ n>>6 ];
diff --git a/meta-oe/recipes-support/tbb/tbb_4.1.bb b/meta-oe/recipes-support/tbb/tbb_4.1.bb
new file mode 100644
index 0000000..e67e755
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb_4.1.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Parallelism library for C++ - runtime files \
+ TBB is a library that helps you leverage multi-core processor \
+ performance without having to be a threading expert. It represents a \
+ higher-level, task-based parallelism that abstracts platform details \
+ and threading mechanism for performance and scalability."
+HOMEPAGE = "http://threadingbuildingblocks.org/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2c7f2caf277a3933e3acdf7f89d54cc1"
+PRDATE = "20121003"
+
+SRC_URI = "http://threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb41_${PRDATE}oss_src.tgz \
+           file://tbb41-aarch64.patch \
+           file://cross-compile.patch \
+           file://tbb.pc"
+
+S = "${WORKDIR}/tbb41_${PRDATE}oss/"
+
+SRC_URI[md5sum] = "2a684fefb855d2d0318d1ef09afa75ff"
+SRC_URI[sha256sum] = "5383727b9582a54cf4c4adbf22186b70e8eba276fcd3be81d746a937c5b47afc"
+
+do_compile() {
+    oe_runmake compiler=gcc arch=aarch64 runtime=cc4.7_libc2.17_kernel3.8 tbb tbbmalloc
+}
+
+do_install() {
+    install -d ${D}${includedir} ${D}${libdir}/pkgconfig
+    rm ${S}/include/tbb/index.html -f
+    cp -a ${S}/include/tbb ${D}${includedir}
+    install -m 0755 ${B}/build/linux_*_release/lib*.so* ${D}${libdir}
+    install -m 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig
+}
-- 
1.8.0



