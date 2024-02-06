Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF895C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:00:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.16456.1707202801391831088
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Nrptpdbc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707202801; x=1738738801;
  h=from:to:cc:subject:date:message-id;
  bh=x9hgxsMWpZRtMxBR+Hpj70grO6Tq/j/PONs2In6BcF4=;
  b=NrptpdbcDO81zzC9w7sNiGzx/7H07Y8Ae+qRhL+ue76NX/Wy9xo4k43x
   uiWMbLkDqwVjXLZLexSCmMQh0Aa3ReXcv2Lt38YkTnHjrTCYXN6tpWvlU
   YGfVr6huD9nHpR/E3TTTNowPhPJOika59pOXDvx5jbW8gnNmGA5M+5jeS
   A2dvuwGkxErF5x6az0pK1jxBud4IhEl/6XBWkcaGIvRb6AqRHZ1Jy1jzd
   FgagpQneWdHtexRrnz+pgR9WosGAVyNEq1aq4ectV+E4fnFPDHzvredzG
   8eweQci7LnlEKJG/AzBforrfRchI7zGlF01NGpop0mQIl4Ii45SYmcvVa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148526695"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148526695"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 15:59:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E2F62356F3
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 15:59:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C45612E859
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 15:59:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F9FB6B4D4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 15:59:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DD18A1A009A;
	Tue,  6 Feb 2024 14:59:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] bdwgc: upgrade 8.2.4 -> 8.2.6
Date: Tue,  6 Feb 2024 14:59:48 +0800
Message-Id: <1707202788-4117-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10-2.525900-10.000000
X-TMASE-MatchedRID: 23S5bWbruASjz0nOeth/yUIIxwDaU5mr+VJ6lZyB0s/SJfGV2JAq5J/b
	umQx78u3raob308tFzcADl8u6iDzCL/zzHrO+HP+M6A0eGVTtgzYjw1QqLfrRjMDC/3gyoIup4F
	988kYy611hNoJU3VrXEdkrFRj0EIqBs5fQBxNOc1rzsINdopFUmHQRvm4YYjUJLfQYoCQHFa6NV
	GQOCars5GJ0GBDqj2TAQqpE9YmfpUPbHJsjWwJE/hmLfH/1YU7MC4zO7d4kaMOkJQR4QWbsGaJq
	Qc1I2SwNWqbeIhTJ3z6fEJuh+eMTz0H9Sm/W/rqHWRJEfGP5nmUctRw0zzl2gYqtT88v9TMxfAw
	vFzC79O5TFwSrryLA0+5yWTK6A9U5kG13vm/jjVHKdPCX1liHhgff28UuvITWGzy6KaAc0JHwJd
	zwJcNsDUkWRYdQ5Z3vM5tmoxsiq5zECfnENw19YldKbZsGYat+gx7Y6zr6DlUjspoiX02FyiQL+
	IhWlyyeLUGEnE35HI51LdtQWuTQrhPu4tF1R7BG8gMA0GudQ1MkOX0UoduuTBwx50fHFEC0yOPB
	v1B9XaUdUf9QcMH0eaffHI8kAmi03ghCcCcqX87Cl8sx4HBGzvm8guhZ/B0oHmOTZNdeMWUg5UD
	6AlF0rF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKly/WlqE0MPppQ7cRnfZm6VbjPuCO1
	yrJjboVsEmffISUOY7UQUXPmZYpf8nfiXCf7PWVsJQ0FlYtWhcqYyg1Ckz2HhCpFVOTD3/r/b+d
	mSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108586

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Avoid unexpected heap growth in gctest for the case of VERY_SMALL_CONFIG
* Change gc.man to include gc/gc.h
* Check for out-of-memory on every memory allocation in tests
* Do not compile pthread_start.c on Cygwin even if build shared libs (CMake)
* Eliminate 'alloc_small declared but unused' gcc warning in gctest
* Eliminate 'make_key is defined but unused' gcc warning in threadkeytest
* Eliminate 'old_segv_handler is defined but unused' gcc warning on OpenBSD
* Eliminate 'rand() may return deterministic values' warning
* Eliminate 'unused parameter' compiler warnings reported by MS clang
* Eliminate 'unused parameter' gcc warning in free() if IGNORE_FREE
* Eliminate 'unused value' gcc warnings in init_global_static_roots (Symbian)
* Eliminate GCC warning of unsafe __builtin_return_address(1) in Cmake script
* Eliminate compiler warning of missing cast in LONG_MULT after shift
* Eliminate warning of unused expression result in GC_FreeBSDGetDataStart
* Ensure _GNU_SOURCE is defined if HAVE_DLADDR is defined by configure
* Fix 'g++ not found' error on OpenBSD (Makefile.direct)
* Fix 'implicit declaration of function pthread_atfork' gcc error on MinGW
* Fix 'implicit declaration of function sbrk' gcc error on Symbian
* Fix 'implicit declaration of iscntrl()' warning in cord/de_win (MinGW)
* Fix 'info' buffer potential overrun in GC_save_callers
* Fix 'l-value specifies const object' MSVC error in GC_push_many_regs
* Fix 'linker input unused' error inside check_c_compiler_flag (CMake)
* Fix 'missing binary operator before token' gcc error in gcconfig.h
* Fix 'missing sysconf() prototype' gcc error in setjmp_t tool (OpenBSD)
* Fix 'sigset_t undeclared' MS VC error if pthreads-w32 is used
* Fix 'undefined reference' linker errors if shared build on OpenBSD (CMake)
* Fix 'unused GC_set_and_save_fault_handler' warning on OS X
* Fix GC_push_stack_for() to push also Xmm registers on Windows/x64
* Fix GC_set_handle_fork(1) on Darwin when MPROTECT_VDB but no threads
* Fix MACH_TYPE macro redefinition on Symbian/arm
* Fix SVR4 macro definition order
* Fix asm constraint in LONG_MULT for gcc/x86
* Fix assertion violation in GC_get_maps on Linux if malloc redirection
* Fix back graph and checksums support in WCC_MAKEFILE
* Fix bitwise negation and rounding direction in setjmp_t tool
* Fix checksums GC_record_fault invocation on Darwin
* Fix closing bracket placement for case statement in configure
* Fix deprecation warning about support of CMake older than v3.5
* Fix extra 'extern C' for include signal.h in gcconfig.h
* Fix getcontext() detection by CMake on OpenBSD
* Fix handling of GC_gc_no counter wrap in GC_clear_stack
* Fix handling of GC_gc_no counter wrap in GC_notify_or_invoke_finalizers
* Fix indent of a closing curly brace in GC_forward_exception
* Fix lock assertion violation in GC_try_to_collect_inner on OS X
* Fix missing GC_pthread_sigmask on FreeBSD and NetBSD
* Fix missing _setjmp() on djgpp
* Fix missing atomic barriers in CORD_from_file_lazy
* Fix missing outermost parentheses in CORD_pos_cur_char_addr and hugetest
* Fix missing redirect and implementation of pthread_sigmask() on OpenBSD
* Fix missing type widening before left shift in GC_MAKE_PROC
* Fix misspelled GC_HEADERS_H macro in gc_priv.h
* Fix null dereference in check_finalizer_nested if redirect malloc on Linux
* Fix posix_memalign() to overwrite pointer storage only on success
* Fix race in init_lib_bounds on Linux with glibc v2.34+ if redirect malloc
* Fix skipped removal of page protection in case of address hash collision
* Fix typos in comments
* Fix undefined GC_real_pthread_sigmask if redirect malloc on OS X
* Fix update of last_back_trace_gc_no if KEEP_BACK_PTRS is not defined
* Handle GC_gc_no counter overflow properly in GC_print_trace
* Include Darwin CoreFoundation.h only if 32-bit ARM
* Make gc_allocator<void> members public
* Re-enable incremental mode on OS X (arm64)
* Remove .log and cordtest .tmp files by 'make clean' (Makefile.direct)
* Remove a redundant check of HOST_ANDROID in gcconfig.h
* Remove duplication of random numbers generator formula
* Specify constexpr in GC allocators if C++20 or later
* Support NetBSD/riscv64
* Support non-msys MinGW build by CMake
* Turn on handle fork by default on Darwin (multi-threaded only)
* Use AO primitives in GC_RAND_NEXT instead of no_sanitize attribute
* Workaround 'malloc inconsistent dll linkage' MS VC error in CMake script
* Workaround MS Clang failure to compile de_win.rc
* Workaround mark stack overflow in GC_push_finalizer_structures on MinGW

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/bdwgc/{bdwgc_8.2.4.bb => bdwgc_8.2.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/bdwgc/{bdwgc_8.2.4.bb => bdwgc_8.2.6.bb} (96%)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.4.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.6.bb
similarity index 96%
rename from meta-oe/recipes-support/bdwgc/bdwgc_8.2.4.bb
rename to meta-oe/recipes-support/bdwgc/bdwgc_8.2.6.bb
index f02c45728..a5a7a6365 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.4.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.6.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://README.QUICK;md5=dd27361ad00943bb27bc3e0589037075"
 
 DEPENDS = "libatomic-ops"
 
-SRCREV = "d1ff06cc503a74dca0150d5e988f2c93158b0cdf"
+SRCREV = "e340b2e869e02718de9c9d7fa440ef4b35785388"
 SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_2;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


