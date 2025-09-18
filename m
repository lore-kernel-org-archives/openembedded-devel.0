Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F2ECAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 03:46:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5754.1758167178535260501
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 20:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EKbTloQm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13560e645f=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I3eOGm2773244;
	Thu, 18 Sep 2025 03:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=XW5ni61sZtk7SG78X7rZ
	YwmxgkM9yTMDIC+4AJAkrNc=; b=EKbTloQmrBt/myyNrKmiEF+mnLOLPTYz0YJz
	crPA5BczxRrg+HP+hjxg9g7R+4xNl3Vygkmn5ic5w8Njyhpf7vbGqVLUuBlskC6n
	oZqiYgKhV+JFV3u5WvfN2S6e9s5/RQBvPL7hItIc5aMnNKSgKo2b9GNTt6j5v0JP
	qHrwBBND9vGHLNxYjhBUe56AL20ALoU4M372w+pMeISryOnvFhCS733fV8sbQCxA
	UUhHR5/EintulOg21beNnfsY8D8chkJu0zNXYCgaNneTBG+U2SeI5O8bhN4rwyMq
	IBY5kJH/U3U3IUNtOHKGU14vWTBKCSwrbWQ5PV40u/GAIq9itQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwrskkq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Sep 2025 03:46:16 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 17 Sep 2025 20:46:14 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 17 Sep 2025 20:46:14 -0700
From: <jiaying.song.cn@windriver.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][walnascar][PATCH 1/2] webkitgtk3: fix build failure with DEBUG_BUILD enabled
Date: Thu, 18 Sep 2025 11:46:12 +0800
Message-ID: <20250918034613.2714914-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tRlz3d9VFOhWwuSGUWEqSxliNU9H2r6j
X-Authority-Analysis: v=2.4 cv=Sdr3duRu c=1 sm=1 tr=0 ts=68cb8088 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=Q1sTgoEvAAAA:8 a=NEAV23lmAAAA:8 a=LXCGm8LIAAAA:8
 a=t7CeM3EgAAAA:8 a=9C8M6B_o1THvP6IndYQA:9 a=FkGh3qDytyf094M0uOEt:22
 a=NxI9r9ql2kHpUT0AVVEO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDAzMCBTYWx0ZWRfX6zVUKCxryN+q
 F9KMog8Ppl8HyG7RsSl+uGZ09E0UDoe5c0/dugaoH1tq3pnXI/JnoQRvGFJXI8E1nkt8fBludZc
 f4jOyz7/dqdbsPn8W7S/c9C/WLSOf/jZfYoGGheusfVYPE5W8PPRz2c69ib+klc0OiEB2mJNps8
 VBDMZwEIvftX7uHGFEjtkqCmNh3jjsUswmmEAtm2pZRCkA5v5fobr0dCDsKQlf9s4Rnb2g5sh5k
 WJapO5JfVnIJ6276Z8oKWe6+fpnn9GENPG+JSgAcMKZKXdWox9pN4G+9ut8AhJfcE2M10O8wBOy
 veGaa8zB/23KcnczA8iCALgWqAaCfvM2iA0cAKDkMm+FOoNTCD/C3H8pgvlgV4=
X-Proofpoint-GUID: tRlz3d9VFOhWwuSGUWEqSxliNU9H2r6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119514

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
 ...able-to-control-macro-__PAS_ALWAYS_I.patch | 74 +++++++++++++++++++
 .../webkitgtk/webkitgtk3_2.48.1.bb            |  4 +-
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch

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
index b03ed3cbb9..c3d2169102 100644
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
+	${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFFF', d)} \
+        -DENABLE_MINIBROWSER=ON \
 	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
 		"
 # pass -g1 to massively reduce the size of the debug symbols (4.3GB to 700M at time of writing)
-- 
2.34.1


