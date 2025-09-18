Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE7BCAC5A7
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 05:41:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7102.1758174102044923284
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 22:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RPbVtgJU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13560e645f=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I50hZ03466950;
	Wed, 17 Sep 2025 22:41:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jZfhuWLnBxnOVaA4kHkW
	cI1I7/aO3wU47pK3q4xP2C4=; b=RPbVtgJUpbwjLnuVfOlXhi6BPW0vcSM5UIrF
	ybjT+h+fDD5dOJVeRtXuGniGOVtSCSI3N2GgYNzQpBBgShTGCyLRjNL3M2p0O2ff
	9ElWlfwZ8NTigXg2rM3xP0TBEPsi6JItaKIott5nTokzjPdStRN14yy+QzodihVm
	1QqsZy75K6oqnn9mNnNLe5N+SQVgq/P0pZ/3NQdawhjCno5xxiKgOQ55zWbL0BKA
	2NPCg4/4KGGAF8h8+N8l26IDmSflElP0OobmaoPoHq+5HTIm9mqSpcp8ZzKGYMOo
	1UzTx1LnG7Qa26HVGjGu+gVST2O26RX3Jy+UWB/qEXn/EBB9bg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwr1n60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 17 Sep 2025 22:41:40 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 17 Sep 2025 22:41:40 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 17 Sep 2025 22:41:39 -0700
From: <jiaying.song.cn@windriver.com>
To: <skandigraun@gmail.com>, <ankur.tyagi85@gmail.com>,
        <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][walnascar][PATCH 1/2 v2] webkitgtk3: fix build failure with DEBUG_BUILD enabled
Date: Thu, 18 Sep 2025 13:41:37 +0800
Message-ID: <20250918054138.970293-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CXLFoUea-ycqz8f5667y5Gj_7EQSt-GG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA0OSBTYWx0ZWRfX4iEmtIZekUQo
 kVA+4lggiUfVoDkelhJstf/2uUstdIj5shroYnWcXiwi0XmolCF7DJIGC186rnjQTQzOCX4l7C5
 gpxzIOKUbh2xMWGMWB2bVZIvlhPGfNna+Ro+CBZZDlVTy2QRskCC+Z58Ge+7XFQapWw+jhZMg9e
 wgn4wkKwPQQjgWzF2CE/o7O8fb2Gnb+KEV1VBdmC3mc6HCoNeueq9BqhRKwSP3IUlNSkVdNHmYU
 +QwYMIQn1KlGUIFkXezPuzprNRwjgBKB/GjbQ59rz46Erby91/HESzmNZ9CE2ldBlFwlAY5wyOf
 l5u1qhEkyi1r8s7YoUA0T+ELO4lXLjjXmFMdz4pztXoBSaRK0H3bit/M8um1zU=
X-Authority-Analysis: v=2.4 cv=WvsrMcfv c=1 sm=1 tr=0 ts=68cb9b94 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=Q1sTgoEvAAAA:8 a=NEAV23lmAAAA:8 a=LXCGm8LIAAAA:8
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=mROp5bY0-9pNE1R2juEA:9
 a=FkGh3qDytyf094M0uOEt:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: CXLFoUea-ycqz8f5667y5Gj_7EQSt-GG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 05:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119521

From: Jiaying Song <jiaying.song.cn@windriver.com>

It fails to compile webkitgtk when debug build enabled:

| /path_to//tmp/work/core2-64-poky-linux/webkitgtk3/2.48.1/webkitgtk-2.48.1/Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h:82:36:
  error: inlining failed in call to 'always_inline' 'pas_page_base* bmalloc_heap_config_page_header(uintptr_t)':
  function not considered for inlining
|    82 | PAS_BASIC_HEAP_CONFIG_DECLARATIONS(bmalloc, BMALLOC);
|       |

Add a cmake variable WEBKIT_NO_INLINE_HINTS to disable gcc function attribute `always_inline` when debug build is enabled.

And adjust indent as well.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...uild-failure-with-DEBUG_BUILD-enable.patch | 129 ++++++++++++++++++
 ...o_configure-error-on-beaglebone-yoct.patch |  53 +++++++
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |  74 ++++++++++
 .../webkitgtk/webkitgtk3_2.48.1.bb            |   4 +-
 4 files changed, 259 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/webkitgtk/0001-webkitgtk3-fix-build-failure-with-DEBUG_BUILD-enable.patch
 create mode 100644 meta-oe/recipes-support/webkitgtk/0002-webkitgtk3-fix-do_configure-error-on-beaglebone-yoct.patch
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch

diff --git a/meta-oe/recipes-support/webkitgtk/0001-webkitgtk3-fix-build-failure-with-DEBUG_BUILD-enable.patch b/meta-oe/recipes-support/webkitgtk/0001-webkitgtk3-fix-build-failure-with-DEBUG_BUILD-enable.patch
new file mode 100644
index 0000000000..d5c22f9621
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/0001-webkitgtk3-fix-build-failure-with-DEBUG_BUILD-enable.patch
@@ -0,0 +1,129 @@
+From 48c9ac56f9df4e3f31e4712dd5a305ec7afb9403 Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Thu, 18 Sep 2025 11:17:56 +0800
+Subject: [meta-oe][walnascar][PATCH 1/2] webkitgtk3: fix build failure with DEBUG_BUILD enabled
+
+It fails to compile webkitgtk when debug build enabled:
+
+| /path_to//tmp/work/core2-64-poky-linux/webkitgtk3/2.48.1/webkitgtk-2.48.1/Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h:82:36:
+  error: inlining failed in call to 'always_inline' 'pas_page_base* bmalloc_heap_config_page_header(uintptr_t)':
+  function not considered for inlining
+|    82 | PAS_BASIC_HEAP_CONFIG_DECLARATIONS(bmalloc, BMALLOC);
+|       |
+
+Add a cmake variable WEBKIT_NO_INLINE_HINTS to disable gcc function attribute `always_inline` when debug build is enabled.
+
+And adjust indent as well.
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ ...able-to-control-macro-__PAS_ALWAYS_I.patch | 74 +++++++++++++++++++
+ .../webkitgtk/webkitgtk3_2.48.1.bb            |  4 +-
+ 2 files changed, 77 insertions(+), 1 deletion(-)
+ create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+
+diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+new file mode 100644
+index 0000000000..b1139b857e
+--- /dev/null
++++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+@@ -0,0 +1,74 @@
++From bbf661310448d430350eb2ad8c5869ace648dcf8 Mon Sep 17 00:00:00 2001
++From: Kai Kang <kai.kang@windriver.com>
++Date: Fri, 11 Aug 2023 14:20:48 +0800
++Subject: [PATCH] Add a variable to control macro
++ __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
++ https://bugs.webkit.org/show_bug.cgi?id=260065
++
++Reviewed by NOBODY (OOPS!).
++
++It fails to compile webkitgtk with option `-Og` of gcc/g++:
++
++| In file included from Source/bmalloc/libpas/src/libpas/pas_heap_page_provider.h:30,
++|                  from Source/bmalloc/libpas/src/libpas/pas_bootstrap_heap_page_provider.h:29,
++|                  from Source/bmalloc/libpas/src/libpas/pas_large_heap_physical_page_sharing_cache.h:29,
++|                  from Source/bmalloc/libpas/src/libpas/pas_basic_heap_page_caches.h:29,
++|                  from Source/bmalloc/libpas/src/libpas/pas_heap_config_utils.h:32,
++|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h:34,
++|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:34,
++|                  from Source/bmalloc/bmalloc/bmalloc.h:39,
++|                  from Source/bmalloc/bmalloc/bmalloc.cpp:26:
++| In function 'pas_allocation_result pas_local_allocator_try_allocate(pas_local_allocator*, size_t, size_t, pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter)',
++|     inlined from 'pas_allocation_result pas_try_allocate_common_impl_fast(pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter, pas_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_try_allocate_common.h:85:46,
++|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alignment_impl_impl_fast(pas_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1,
++|     inlined from 'pas_allocation_result pas_try_allocate_intrinsic_impl_casual_case(__pas_heap*, size_t, size_t, pas_intrinsic_heap_support*, pas_heap_config, pas_try_allocate_common_fast, pas_try_allocate_common_slow, pas_intrinsic_heap_designation_mode)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_try_allocate_intrinsic.h:167:44,
++|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alignment_impl_casual_case(size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1:
++| webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_allocation_result.h:76:1: error: inlining failed in call to 'always_inline' 'pas_allocation_result pas_allocation_result_identity(pas_allocation_result)': function not considered for inlining
++|    76 | pas_allocation_result_identity(pas_allocation_result result)
++|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
++
++Add an variable `WEBKIT_NO_INLINE_HINTS` to control macro
++__PAS_ALWAYS_INLINE_BUT_NOT_INLINE whether includes function attribute
++`always_inline`. It could set the variable to make compilation pass when
++gcc option `-Og` is used.
++
++* Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h:
++* Source/cmake/WebKitCompilerFlags.cmake:
++
++Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/16601]
++
++Signed-off-by: Kai Kang <kai.kang@windriver.com>
++Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
++---
++ Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h | 2 +-
++ Source/cmake/WebKitCompilerFlags.cmake              | 7 +++++++
++ 2 files changed, 8 insertions(+), 1 deletion(-)
++
++diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
++index 5d5fb38c..a554f700 100644
++--- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
+++++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
++@@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;
++ #define __SUSPICIOUS__
++ #define __BROKEN__
++ 
++-#ifdef __OPTIMIZE__
+++#if defined(__OPTIMIZE__) && !defined(WEBKIT_NO_INLINE_HINTS)
++ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE __attribute__((__always_inline__))
++ #else
++ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
++diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
++index f5ec0a55..dfd741e7 100644
++--- a/Source/cmake/WebKitCompilerFlags.cmake
+++++ b/Source/cmake/WebKitCompilerFlags.cmake
++@@ -503,3 +503,10 @@ endif ()
++ 
++ # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/b/139438>
++ set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
+++
+++# It fails to compile with `gcc -Og`
+++set(WEBKIT_NO_INLINE_HINTS OFF CACHE BOOL "Disable funtion attribute always_inline for WebKit")
+++
+++if (WEBKIT_NO_INLINE_HINTS)
+++    add_definitions(-DWEBKIT_NO_INLINE_HINTS)
+++endif ()
+diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+index b03ed3cbb9..c3d2169102 100644
+--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
++++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+@@ -21,6 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
+            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
+            file://fix-typo-denormaldisabler.patch \
+            file://fix-ftbfs-riscv64.patch \
++           file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
+            "
+ SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
+ 
+@@ -99,7 +100,8 @@ EXTRA_OECMAKE = " \
+ 	-DUSE_GTK4=OFF \
+ 	${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
+ 	${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
+-	-DENABLE_MINIBROWSER=ON \
++	${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFFF', d)} \
++        -DENABLE_MINIBROWSER=ON \
+ 	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
+ 		"
+ # pass -g1 to massively reduce the size of the debug symbols (4.3GB to 700M at time of writing)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/webkitgtk/0002-webkitgtk3-fix-do_configure-error-on-beaglebone-yoct.patch b/meta-oe/recipes-support/webkitgtk/0002-webkitgtk3-fix-do_configure-error-on-beaglebone-yoct.patch
new file mode 100644
index 0000000000..9947601c16
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/0002-webkitgtk3-fix-do_configure-error-on-beaglebone-yoct.patch
@@ -0,0 +1,53 @@
+From d553c5a2a4827b5dd1a1ec971649231f4d2624ce Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Thu, 18 Sep 2025 11:19:09 +0800
+Subject: [meta-oe][walnascar][PATCH 2/2] webkitgtk3: fix do_configure error on beaglebone-yocto
+
+* According to latest comment [1] and the mentioned pull request [2],
+  build an ENABLE(WEBASSEMBLY) && !ENABLE(JIT) configuration is
+  supported, so original issue already fixed in current version, the
+  EXTRA_OECMAKE setting is not needed anymore.
+
+* This EXTRA_OECMAKE setting causes following configure error on
+  beaglebone-yocto, remove the setting to let the configure process
+  decide the configuration:
+  CMake Error at Source/cmake/WebKitFeatures.cmake:312 (message):
+  ENABLE_JIT conflicts with ENABLE_C_LOOP.You must disable one or the
+  other.
+
+[YOCTO #15254]
+
+[1] https://github.com/WebKit/WebKit/pull/17447
+[2] https://github.com/WebKit/WebKit/pull/17688
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ .../recipes-support/webkitgtk/webkitgtk3_2.48.1.bb   | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+index c3d2169102..61be8b2cbf 100644
+--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
++++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+@@ -126,18 +126,6 @@ EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
+ EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
+ EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
+ 
+-# And for armv7* don't enable it for softfp, because after:
+-# https://github.com/WebKit/WebKit/commit/a2ec4ef1997d6fafa6ffc607bffb54e76168a918
+-# https://bugs.webkit.org/show_bug.cgi?id=242172
+-# softfp armv7* fails because WEBASSEMBLY is left enabled by default and JIT gets
+-# explicitly disabled causing:
+-# http://errors.yoctoproject.org/Errors/Details/734587/
+-# PR was sent upstream, but the end result is the same both JIT and WEBASSEMBLY disabled
+-# https://github.com/WebKit/WebKit/pull/17447
+-EXTRA_OECMAKE:append:armv7a = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
+-EXTRA_OECMAKE:append:armv7r = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
+-EXTRA_OECMAKE:append:armv7ve = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
+-
+ # JIT does not work on RISCV
+ EXTRA_OECMAKE:append:riscv32 = " -DENABLE_JIT=OFF"
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
new file mode 100644
index 0000000000..b1139b857e
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -0,0 +1,74 @@
+From bbf661310448d430350eb2ad8c5869ace648dcf8 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 11 Aug 2023 14:20:48 +0800
+Subject: [PATCH] Add a variable to control macro
+ __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
+ https://bugs.webkit.org/show_bug.cgi?id=260065
+
+Reviewed by NOBODY (OOPS!).
+
+It fails to compile webkitgtk with option `-Og` of gcc/g++:
+
+| In file included from Source/bmalloc/libpas/src/libpas/pas_heap_page_provider.h:30,
+|                  from Source/bmalloc/libpas/src/libpas/pas_bootstrap_heap_page_provider.h:29,
+|                  from Source/bmalloc/libpas/src/libpas/pas_large_heap_physical_page_sharing_cache.h:29,
+|                  from Source/bmalloc/libpas/src/libpas/pas_basic_heap_page_caches.h:29,
+|                  from Source/bmalloc/libpas/src/libpas/pas_heap_config_utils.h:32,
+|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h:34,
+|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:34,
+|                  from Source/bmalloc/bmalloc/bmalloc.h:39,
+|                  from Source/bmalloc/bmalloc/bmalloc.cpp:26:
+| In function 'pas_allocation_result pas_local_allocator_try_allocate(pas_local_allocator*, size_t, size_t, pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter)',
+|     inlined from 'pas_allocation_result pas_try_allocate_common_impl_fast(pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter, pas_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_try_allocate_common.h:85:46,
+|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alignment_impl_impl_fast(pas_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1,
+|     inlined from 'pas_allocation_result pas_try_allocate_intrinsic_impl_casual_case(__pas_heap*, size_t, size_t, pas_intrinsic_heap_support*, pas_heap_config, pas_try_allocate_common_fast, pas_try_allocate_common_slow, pas_intrinsic_heap_designation_mode)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_try_allocate_intrinsic.h:167:44,
+|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alignment_impl_casual_case(size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1:
+| webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_allocation_result.h:76:1: error: inlining failed in call to 'always_inline' 'pas_allocation_result pas_allocation_result_identity(pas_allocation_result)': function not considered for inlining
+|    76 | pas_allocation_result_identity(pas_allocation_result result)
+|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Add an variable `WEBKIT_NO_INLINE_HINTS` to control macro
+__PAS_ALWAYS_INLINE_BUT_NOT_INLINE whether includes function attribute
+`always_inline`. It could set the variable to make compilation pass when
+gcc option `-Og` is used.
+
+* Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h:
+* Source/cmake/WebKitCompilerFlags.cmake:
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/16601]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h | 2 +-
+ Source/cmake/WebKitCompilerFlags.cmake              | 7 +++++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
+index 5d5fb38c..a554f700 100644
+--- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
++++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
+@@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;
+ #define __SUSPICIOUS__
+ #define __BROKEN__
+ 
+-#ifdef __OPTIMIZE__
++#if defined(__OPTIMIZE__) && !defined(WEBKIT_NO_INLINE_HINTS)
+ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE __attribute__((__always_inline__))
+ #else
+ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
+diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
+index f5ec0a55..dfd741e7 100644
+--- a/Source/cmake/WebKitCompilerFlags.cmake
++++ b/Source/cmake/WebKitCompilerFlags.cmake
+@@ -503,3 +503,10 @@ endif ()
+ 
+ # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/b/139438>
+ set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
++
++# It fails to compile with `gcc -Og`
++set(WEBKIT_NO_INLINE_HINTS OFF CACHE BOOL "Disable funtion attribute always_inline for WebKit")
++
++if (WEBKIT_NO_INLINE_HINTS)
++    add_definitions(-DWEBKIT_NO_INLINE_HINTS)
++endif ()
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
index b03ed3cbb9..9f44dfa924 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-typo-denormaldisabler.patch \
            file://fix-ftbfs-riscv64.patch \
+           file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            "
 SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
 
@@ -99,7 +100,8 @@ EXTRA_OECMAKE = " \
 	-DUSE_GTK4=OFF \
 	${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
 	${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
-	-DENABLE_MINIBROWSER=ON \
+	${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
+        -DENABLE_MINIBROWSER=ON \
 	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
 		"
 # pass -g1 to massively reduce the size of the debug symbols (4.3GB to 700M at time of writing)
-- 
2.34.1


