Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB4FC433FE
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 12:12:15 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.7208.1634127133482851772
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 05:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SbbZzLE/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634127131; i=@fujitsu.com;
	bh=ecx0fS6mf8cklEd0Dh9ORN3knwxHYxMl/+s0G6+Pi04=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SbbZzLE/x/ZwOZ6v78UaK2rm62wxkXearsDlU/r80xohbso0EEX7itHTULkWVCwxH
	 Z61HTg/LxotSGvHFAn2B5c4o6dIRe40iiel3B9E8Tshixjhmeag40r5Eph+zvuIF/V
	 ZkVw0h9sw8PutSwRLPKtpmlxYGDAbyL8GJJ/GAhJJoxYcky5oRgk4fgq8n5R+6OCnV
	 U8OUD9VWzyo4lN1VQvcwMaBaPuNjopnLWh5YiHieH555BE14OYMguLetts7O0A+yDH
	 aAh2R6QpibUeOpPIUvSMbradNsrbbFkuRzRXVfyEt6bk4r7vORgtwoYkMPb26DKrC2
	 KPMhiC0dNBNeQ==
Received: from [100.113.6.246] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id F1/0D-01506-B1DC6616;
 Wed, 13 Oct 2021 12:12:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqCt9Ni3
  R4Op7HouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePVrVPsBdvyKw5vXcvawHgjvouRi0NI4Amj
  xLPTu9khnAtMEus+n4JyTjBK9MxeydTFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICtRN+iy0A1HBwsAqoSPy6zgYR5BZwlLp5YBjZGQkBBYsrD98wQcUGJkzOfsECMkZA4+O
  IFM0SNosTsy80sEHaFxKxZbVC9ahJXz21insDIPwtJ+ywk7QsYmVYxWiYVZaZnlOQmZuboGho
  Y6BoaGuua6RqZGOglVukm6aWW6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECQzKlkO3DDsYp
  bz7oHWKU5GBSEuVl2Z2WKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCN+gMUE6wKDU9tSItMwcYH
  zBpCQ4eJRHeTSeA0rzFBYm5xZnpEKlTjIpS4rznTgMlBEASGaV5cG2wmLzEKCslzMvIwMAgxF
  OQWpSbWYIq/4pRnINRSZh35SmgKTyZeSVw018BLWYCWhwYlQKyuCQRISXVwNSq2n9bfn7NJ6Y
  j35fzGe85X/ktXcFkhUGy0dlHh3+WT8oUkbVn1fz9lPNUi1/8gb8P/gS05m6z5J/149qkgGV5
  Dq83C2mo3vloVJwkNPV3wUKeZJneLZf4phlzXSiSWRzmIieql5y/rWj1kYsP1F7/Ujsc+jXxR
  n+uu1bQBjn7mgrnVC6+rsoKSRfryOnVzz4q31mqmLF7/eSMYEUt3sUHkwUOz/u6avOPm441N3
  vEQydIn/MvnWLw9MKGmvJ3YaJe9p0Lzl3ZP6m9ybW2tuzHIdOtOnM7quU/1iTHrCm4x7U+U23
  yj7ilUYzsTr/rLoRkOXyexpK+ZxL//eIzLptWeja8m7xh1+yQsL+Gt5VYijMSDbWYi4oTAYFA
  j7NEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-248.messagelabs.com!1634127130!1662026!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17051 invoked from network); 13 Oct 2021 12:12:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Oct 2021 12:12:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 826E41009E6
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 13:12:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4EC8F14B24C
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 13:12:10 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 13 Oct 2021 13:12:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] bdwgc: upgrade 8.0.6 -> 8.2.0
Date: Wed, 13 Oct 2021 20:11:53 +0800
Message-ID: <1634127114-114535-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 12:12:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93277

== [8.2.0] 2021-09-29 ==

* Add API for accessing incremental GC time limit with nanosecond precision
* Add API function to force start of incremental collection
* Add GC_ prefix to scan_ptr and some other static variables (refactoring)
* Add GC_get/set_disable_automatic_collection API
* Add I_HOLD_LOCK assertion to expand_hp_inner and related functions
* Add assertion on free-list argument and result of GC_new_kind
* Add assertion that GC is initialized to base incremental_protection_needs
* Add assertions that GC_page_size is initialized
* Add cordtest, staticrootstest, test_cpp, tracetest, disclaim tests (CMake)
* Add debug messages on thread suspend/resume (Win32)
* Add dummy testing of GC_incr_bytes_allocd/freed
* Add table of contents in gcdescr.md
* Add testing of GC_CALLOC/MALLOC_EXPLICITLY_TYPED (gctest)
* Adjust formatting of numbered lists in README.md to match other .md files
* Adjust highlighting of API prototypes in gcinterface.md
* Adjust macro def/usage for AVR32, CRIS, NETBSD, OPENBSD, SH4 in gcconfig.h
* Adjust printf calls in gctest check_heap_stats so that each has new-line
* Allow incremental GC on Cygwin
* Allow memory unmapping in case of MPROTECT_VDB
* Allow to disable GWW or mprotect-based VDB at build
* Allow to disable Glibc FPU exception mask and TSX workarounds (Linux)
* Allow to disable __builtin_return_address(1) usage (x86 and x64)
* Allow to specify custom value of LOG_PHT_ENTRIES
* Always abort on failure to access /proc/self/maps (Linux)
* Always define default_push_other_roots (code refactoring)
* Avoid gcc stringop-overflow warning for intended overflow in smashtest
* Avoid initial 3ms pause on world stop/start with GC_retry_signals (Linux)
* Build cord.lib by Makefile.direct, NT_MAKEFILE, OS2_MAKEFILE, WCC_MAKEFILE
* Build gc as a shared multi-threaded library by default (CMake)
* Build gccpp library by Makefile.direct, NT_MAKEFILE and WCC_MAKEFILE
* Build gctba library
* Build shared libraries by default (WCC_MAKEFILE)
* Change CLOCK_TYPE to timespec for Nintendo Switch (code refactoring)
* Change EMSCRIPTEN macro for internal use to no-underscore format
* Change log_size fields of finalizer to unsigned type (code refactoring)
* Change type of toggleref_array_size/capacity to size_t (code refactoring)
* Check leak of objects allocated by CRT malloc in gctest (MS VC)
* Check real-symbols are already initialized in pthread_join/detach
* Collapse multiple includes of windows.h (code refactoring)
* Comments reformatting in mark.c to properly delimit sentences
* Compile de test GUI app with resources (CMake)
* Compile gc.c unless building static libraries (NT_MAKEFILE, WCC_MAKEFILE)
* Compile msvc_dbg.c by CMake script (MS VC)
* Declare API function and print amount of memory obtained from OS
* Define GC_win32_free_heap API function for all Windows targets
* Define STATIC macro to static by default
* Depend number of fork_a_thread calls on NTHREADS (gctest)
* Detect dladdr() presence in CMake script
* Detect presence of execinfo.h system header in CMake script
* Detect presence of getcontext and dl_iterate_phdr in CMake script
* Detect sigsetjmp() availability in CMake script
* Disable Clang/GCC aliasing optimization in CMake script by default
* Do not build tests by default (Makefile.direct and other Makefiles)
* Do not build the tests by default (CMake)
* Do not call GC_push_conditional unless PROC_VDB
* Do not call add_to_our_memory with null pointer (refactoring)
* Do not compile pthread_*.c files in Cygwin or MSYS (CMake)
* Do not define GC_write_cs for Xbox One target
* Do not define HAVE_NO_FORK for all Unix-like systems
* Do not hard-code CMAKE_DL_LIBS value and install paths (CMake)
* Do not hard-code finalizable objects limit which triggers GC
* Do not update scratch_last_end_ptr unless used by reg dynamic libraries
* Document GC_incr_bytes_allocd/freed API function
* Eliminate '(long)size<=0 is always false' cppcheck FP
* Eliminate 'Consecutive return is unnecessary' cppcheck style warning
* Eliminate 'accessing GC_dont_gc without lock' in GC_init code defect FP
* Eliminate 'bytes_freed access w/o lock in incr_bytes_free' code defect FP
* Eliminate 'checking if unsigned i < 0' cppcheck FP in is_heap_base
* Eliminate 'hash_val value is never used' cppcheck false positive
* Eliminate 'passing tainted var maps_buf to tainted sink' code defect FP
* Eliminate 'retry_cnt is assigned value but never used' cppcheck FP
* Eliminate 'stop variable is always 0' compiler warning in print_callers
* Eliminate 'struct member os_callback is never used' cppcheck warning
* Eliminate 't->flags not atomically updated' code defect FP
* Eliminate 'tmpl might be accessed at non-zero index' cppcheck error
* Eliminate GCC warning of unsafe __builtin_return_address(1)
* Eliminate code duplication in reclaim_clear and disclaim_and_reclaim
* Eliminate double lock code defect false positive in generic_lock
* Eliminate memory leak reported in add_current_malloc_heap at exit (Win32)
* Emscripten single-threaded support (detect stack base, push registers)
* Enable CMake-based build for Borland and Watcom compilers
* Enable compilation without C runtime (Win32)
* Enable fork testing in single-thread builds (Unix-like)
* Enable mprotect-based incremental GC for Linux/arm and Linux/aarch64
* Enable true incremental collection even if parallel marker is on
* Enable use of __builtin_unwind_init() if clang-8 or later
* Ensure ELFSIZE is defined in dyn_load.c for OpenBSD (code refactoring)
* Ensure add_to_heap_inner arguments are valid (refactoring)
* Ensure all getters and setters are run at least once by gctest (pthreads)
* Export CMake targets with namespace BDWgc
* Fix 'const obj must be initialized if not extern' error in gc_alloc_ptrs.h
* Fix ./libgc.la dependency on FreeBSD (Automake)
* Fix HOST determination in CMake script
* Fix copyright message in de_win.rc, gc_cpp.cc, ec.h and specific.h
* Fix missing OS_TYPE definition for some targets
* Fix mmap(PROT_NONE) failure if RLIMIT_AS value is low (Linux)
* Generate cordtest and de executable files in GC base folder
* Generate pkg-config metadata file (CMake)
* Get rid of some non-ELF ifdefs (code refactoring)
* Handle potential incomplete buffer read in GC_linux_main_stack_base
* Implement GET_TIME for Nintendo Switch
* Increase NTHREADS value in tests if code coverage analysis
* Install docs and man page if enable_docs (CMake)
* Install gc_gcj.h and gc_pthread_redirects.h only if appropriate
* Log abort message details even if not print_stats (unless SMALL_CONFIG)
* Mark buffer returned by get_maps as const (code refactoring)
* Move C++ GC_ATTR_EXPLICIT and GC_NOEXCEPT definition to gc_config_macros.h
* Move GC state non-pointer variables into GC_arrays (code refactoring)
* Move GC state pointer variables into GC_arrays
* Move GC_scratch_recycle_inner() to alloc.c (refactoring)
* Move GC_throw_bad_alloc definition to new C++ file
* Move QNX and Emscripten macro definitions to proper place in gcconfig.h
* Move definition of GC_n_mark_procs and GC_n_kinds from mark.c to misc.c
* New API (GC_set_markers_count) to control number of parallel markers
* New API function to clear GC exclusion table
* New API function to get size of object debug header
* New API standalone functions to acquire and release the allocator lock
* New CMake option (disable_gc_debug) to remove debugging code
* New CMake option (disable_handle_fork) to disable fork handling completely
* New macro (CONSOLE_LOG) to enable logging to console on Win32
* New macro (GCTEST_PRINT_VERBOSE) to enable verbose logging in test.c only
* New macro (NO_MSGBOX_ON_ERROR) to avoid message box on GC abort (Win32)
* OpenBSD does not use ELF_CLASS (code refactoring)
* Pass -D GC_DLL -fvisibility=hidden if default configure build is requested
* Pass -no-undefined linker flag if building shared libraries (CMake)
* Print pid of child processes if verbose logging (gctest)
* Read environment variables from a file on WinCE (CMake script)
* Reduce stack-allocated buffer in get_nprocs from 4KB to 1.7KB
* Refine flags field comment in pthread_support.h
* Reflect result of VDB selection at runtime in incremental_protection_needs
* Reformat code of GC_push_roots
* Reformat gc.man (wrap long lines)
* Reformatting and code refactoring of CMake script
* Remove 'current users' section from overview.md
* Remove 'distributed ports', 'scalable versions' sections from overview.md
* Remove AC_MSG_RESULT for THREADDLLIBS (dgux386)
* Remove Borland-specific Makefile and gc.mak script
* Remove GC_eobjfreelist variable in typd_mlc.c (code refactoring)
* Remove GC_gcj_malloc_initialized variable (code refactoring)
* Remove Linux-specific commands for building cord/de from Makefile.direct
* Remove Win32 main_thread static variable if threads discovery is disabled
* Remove code duplication between GC_unmap and GC_unmap_gap (refactoring)
* Remove code duplication between PROTECT and UNPROTECT macros (refactoring)
* Remove commented out assignment of gc_use_mmap in configure (refactoring)
* Remove dash characters comprising prefix of some verbose logs (gctest)
* Remove dependency on user32.dll import library from static libgc (Win32)
* Remove documentation specific to particular old BDWGC releases
* Remove duplicate Linux-related macro definitions in gcconfig.h
* Remove duplicate macro definitions in gcconfig.h except for Linux
* Remove gcmt-dll generation, rename libgc-lib.a to libgc.a (CMake)
* Remove goto statement in print_callers (code refactoring)
* Remove limit on number of heap sections
* Remove new_gc_alloc.h file
* Remove redundant GC_with_callee_saves_pushed call in multi-threaded builds
* Remove redundant check of GC_free argument in register_finalizer
* Remove redundant type casts in backgraph HEIGHT_UNKNOWN/IN_PROGRESS
* Remove unused GC_prev_heap_addr (refactoring)
* Remove unused STACK_GRAN macro definitions (code refactoring)
* Remove unused sparc_sunos4_mach_dep.s file
* Remove useless empty statements after block ones (refactoring)
* Remove weakobj_free_list variable in disclaim_weakmap_test (refactoring)
* Rename READ to PROC_READ in os_dep.c (code refactoring)
* Rename cord/cord test executable to de (CMake)
* Rename ext_descr to typed_ext_descr_t (code refactoring)
* Rename gc64.dll to gc.dll and gc[64]_dll.lib to gc.lib in NT_MAKEFILE
* Rename gc68060.lib to gc.lib, cord/cord68060.lib to cord.lib in SMakefile
* Rename make_as_lib option to enable_static in NT_MAKEFILE and WCC_MAKEFILE
* Rename nothreads option to disable_threads in NT_MAKEFILE
* Repeat run_one_test NTHREADS times by gctest if single-threaded
* Replace "msecs" with "ms" in all comments and messages
* Replace 'stack base' with 'stack bottom' in the documentation
* Replace SN_TARGET_ORBIS to PLATFORM_* and GC_NO_* macros
* Replace _M_AMD64 macro with _M_X64 (code refactoring)
* Replace find_limit_openbsd to find_limit_with_bound (OpenBSD 5.2+)
* Replace obsolete AC_HELP_STRING with AS_HELP_STRING (refactoring)
* Replace push_one calls with push_many_regs one for Win32 thread context
* Report memory region bounds and errno on GC_unmap/remap failure
* Report presence of process fork testing (gctest)
* Report time with a nanosecond precision where available
* Retry suspend/resume signals on all platforms by default
* Run tree and typed tests in child process (gctest)
* Set GC_collecting hint for GC_collect_a_little_inner calls (pthreads)
* Set name of GC marker threads
* Set so-version for installed shared libraries (CMake)
* Simplify logged message in scratch_recycle
* Simplify loops of collect_a_little/stopped_mark invoking mark_some
* Support -fvisibility=hidden option in CMake script
* Support CFLAGS_EXTRA to pass extra user-defined compiler flags (CMake)
* Support FreeBSD/RISC-V, Linux/arc, LoongArch, OpenBSD/powerpc64
* Support header files installation (CMake)
* Support most configure options in CMake script
* Suppress warnings in test_tinyfl() of gctest reported by Watcom C complier
* Take nanoseconds into account when updating full_gc_total_time
* Turn off C++ API by default, export it in gccpp library (CMake)
* Turn on automatic fork() handling by default on Android
* Update README.cmake regarding Unix, C++ and tests
* Update libgc.so version info to differentiate against v8.0.x
* Update the ASCII diagrams describing the tree structure for pointer lookups
* Update the documentation to match the current GC implementation
* Upgrade cmake_minimum_required(version) to 3.1
* Use CreateThread without GC_ prefix in gctest (code refactoring)
* Use KB/MB/GB abbreviations uniformly across entire documentation
* Use USE_MMAP_ANON when USE_MMAP is configured on OpenBSD
* Use a specific Emscripten allocator for Tiny
* Use atomic primitives for Sony PlayStation Portable 2 and PS4
* Use better precision Windows timers
* Use clock_gettime() instead of clock() on Cygwin and Linux
* Use compiler TLS on FreeBSD and NetBSD
* Use mprotect-based VDB on PowerPC and S390 (Linux)
* Use soft dirty bits on Linux (i386, powerpc, s390, x86_64)
* Workaround 'condition result<=0 is always false' cppcheck FP in get_maps
* Workaround 'push_regs configured incorrectly' error (GCC-11)
* Workaround 'same value in both branches of ternary operator' cppcheck FP
* Workaround various cppcheck false positives

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/bdwgc/{bdwgc_8.0.6.bb => bdwgc_8.2.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/bdwgc/{bdwgc_8.0.6.bb => bdwgc_8.2.0.bb} (96%)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.0.6.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb
similarity index 96%
rename from meta-oe/recipes-support/bdwgc/bdwgc_8.0.6.bb
rename to meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb
index 391fc87519..ffd167dee2 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.0.6.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://README.QUICK;md5=e3d68fff6b0c661d949d8df559fdc78f"
 
 DEPENDS = "libatomic-ops"
 
-SRCREV = "3e1477b72ef4329a196d67b74da4cbe274d04eff"
+SRCREV = "47e9106c17b72e9ee5501308f69ea94531e798b3"
 SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_0"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


