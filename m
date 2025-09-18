Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A36FCAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 07:18:00 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.8024.1758179869659796699
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 00:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FumRG6/D;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b0787fc3008so85834966b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 00:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758179868; x=1758784668; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPuxFEIlNUu0ljFv78E+gM/oIzeozKO+zhnjrEsdj8U=;
        b=FumRG6/D5399frLyKnsr1jUEVjbqmiOjXOFGqYTl+IoOnuO1sLkKlGQ7xyCQuPQd0V
         FmZPSpokT1QZBVbvXZDT4zu/eS3mrcHospQKboOlWrkvWAsZnwxouXJaFGbPvQfkH1om
         MWY9/DTXhACDnriQLIuJEmISpKqfpvZ03QHCbRYHWZQE7EOyjaI+qrHwHyUs5rjrfndi
         ebpuEZfqEBXG/6iygI7hlAaQ1zbn7yHDqoNkSVhd6YRsyGM7Cb2e2juSrIgGsXIQ0UMA
         7iUlaxNFcAy+hDIvdsI+ALLeStJQzG1dcoTrRPpjUyTakhMp6ZA19HtbDF4NsQhry6Tq
         6ZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758179868; x=1758784668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPuxFEIlNUu0ljFv78E+gM/oIzeozKO+zhnjrEsdj8U=;
        b=RXGGHctSMYI5exeycu6X3mJPWelLyQOIyWwXXSsB+4nQ+fK25ym04XXThyKI9t0tRO
         DJzapvR07konywBeYunyzloQxwpfc3n7kIRNZ9aG26V9qXMj/tAMFS0l92g5flMqzw6L
         7qMgQFp/nFuyw/pZki2yy/qpXMpe742gNhEbobkh4ewHsvq6oP6YsmGEtEuLKm+VQN6U
         RM4uDrVFo8g7Nuqd0mTnXSWoDdgKLD0Ko8wOQwbqY5Gw7ZrYys0QdVSEZTiBPkbmlz4o
         tG+3RwJGoStM26NonSLAWTZsOgzWcJKt/7cOwOg2ZNe+/jI+LF/sdW19bA3KJ/YB1c/o
         MDtg==
X-Gm-Message-State: AOJu0Yzy+rUiuSCu6WhWr+kbNGjerr0S+GTqcnfZYC71+nCinJAOJDL4
	tIBGP06/N5uwvn9a++xsAkE6CHpKGENvydzHCjV3pik7elm2eA+SgHEn
X-Gm-Gg: ASbGncsJUYhanIXjGYaiyXR9wIPzRvacz9yZOhImkg4TIYnLv1wqIIosYxGkuKV8Tx1
	vuxjvO48kuRFGpjwy7PNwOvDaRtgK3zRtzAcAoAEaVe815c1UPo1VOOjObhl/q1OFb2FNL45Bme
	25roNjay/wvQ8UKQxR5ekBvyZt7xcM88HlQh78YlUDziqH/VRBmPnO87dX24f2I8JcuYOhvbpT2
	Q444Il0XyBLYOi41KCRwLdSO1fXKNxNCWnDy1Q/ABskR1bbqg5zzEwa3wxMDUPzUopYPRZoUuKs
	3LaAR8WE9QRwnpT0xzazJ1+PHwiDxjHwoFusZCmctRPwyT1PLBIivne4p1tZi5jdY+V62t/gMpi
	a4sdd/HyGG2m9wH8hUsbKKVbkgHDEUpSkNYjTI10Izg+SgrmLSeuOFJ40jOev
X-Google-Smtp-Source: AGHT+IHyrEkWs8fNu8yBHxjrdf/Q4pNreYbQpCYWzgDd6ghMBYOY4c3EWaraE65H+vwwSn1lRc0Ypg==
X-Received: by 2002:a17:907:972a:b0:b04:84db:c5f with SMTP id a640c23a62f3a-b1bbe7e44f0mr521295666b.45.1758179867590;
        Thu, 18 Sep 2025 00:17:47 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc5f48b74sm134480066b.19.2025.09.18.00.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 00:17:47 -0700 (PDT)
Message-ID: <425eab63-3fb9-4dcf-ac5a-bf5cc5dcc4e1@gmail.com>
Date: Thu, 18 Sep 2025 09:17:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FW: [oe] [meta-oe][walnascar][PATCH 1/2 v2] webkitgtk3: fix build
 failure with DEBUG_BUILD enabled
To: Jiaying.Song.CN@windriver.com,
 "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <18664A07D9EABAFB.22219@lists.openembedded.org>
 <IA4PR11MB9420632298BD69C695B6F4FFB816A@IA4PR11MB9420.namprd11.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <IA4PR11MB9420632298BD69C695B6F4FFB816A@IA4PR11MB9420.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 07:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119534

On 9/18/25 08:42, Song, Jiaying (CN) via lists.openembedded.org wrote:
> This is the v2 patch. Kindly use the two v2 patches sent afterward. Many thanks!
>
> [PATCH 1/2 v2] webkitgtk3: fix build failure with DEBUG_BUILD enabled
> [PATCH 2/2 v2] webkitgtk3: fix do_configure error on beaglebone-yocto
>
> Best regards,  
> Jiaying
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
> Sent: Thursday, September 18, 2025 1:42 PM
> To: skandigraun@gmail.com; ankur.tyagi85@gmail.com; openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][walnascar][PATCH 1/2 v2] webkitgtk3: fix build failure with DEBUG_BUILD enabled
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> It fails to compile webkitgtk when debug build enabled:
>
> | /path_to//tmp/work/core2-64-poky-linux/webkitgtk3/2.48.1/webkitgtk-2.48.1/Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h:82:36:
>   error: inlining failed in call to 'always_inline' 'pas_page_base* bmalloc_heap_config_page_header(uintptr_t)':
>   function not considered for inlining
> |    82 | PAS_BASIC_HEAP_CONFIG_DECLARATIONS(bmalloc, BMALLOC);
> |       |
>
> Add a cmake variable WEBKIT_NO_INLINE_HINTS to disable gcc function attribute `always_inline` when debug build is enabled.
>
> And adjust indent as well.
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  ...uild-failure-with-DEBUG_BUILD-enable.patch | 129 ++++++++++++++++++  ...o_configure-error-on-beaglebone-yoct.patch |  53 +++++++  ...able-to-control-macro-__PAS_ALWAYS_I.patch |  74 ++++++++++
>  .../webkitgtk/webkitgtk3_2.48.1.bb            |   4 +-
>  4 files changed, 259 insertions(+), 1 deletion(-)  create mode 100644 meta-oe/recipes-support/webkitgtk/0001-webkitgtk3-fix-build-failure-with-DEBUG_BUILD-enable.patch

Right, I think see the root cause. V2 has an extra dangling patch, which
used to be the original V1 submission:
"0001-webkitgtk3-fix-build-failure-with-DEBUG_BUILD-enable.patch"
This patch contains the typo with OFFF, that I mistakenly identified as
part of this change. Could you please remove this dangling patch?

>  create mode 100644 meta-oe/recipes-support/webkitgtk/0002-webkitgtk3-fix-do_configure-error-on-beaglebone-yoct.patch
>  create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
>
> diff --git a/meta-oe/recipes-support/webkitgtk/0001-webkitgtk3-fix-build-failure-with-DEBUG_BUILD-enable.patch b/meta-oe/recipes-support/webkitgtk/0001-webkitgtk3-fix-build-failure-with-DEBUG_BUILD-enable.patch
> new file mode 100644
> index 0000000000..d5c22f9621
> --- /dev/null
> +++ b/meta-oe/recipes-support/webkitgtk/0001-webkitgtk3-fix-build-failur
> +++ e-with-DEBUG_BUILD-enable.patch
> @@ -0,0 +1,129 @@
> +From 48c9ac56f9df4e3f31e4712dd5a305ec7afb9403 Mon Sep 17 00:00:00 2001
> +From: Jiaying Song <jiaying.song.cn@windriver.com>
> +Date: Thu, 18 Sep 2025 11:17:56 +0800
> +Subject: [meta-oe][walnascar][PATCH 1/2] webkitgtk3: fix build failure 
> +with DEBUG_BUILD enabled
> +
> +It fails to compile webkitgtk when debug build enabled:
> +
> +| /path_to//tmp/work/core2-64-poky-linux/webkitgtk3/2.48.1/webkitgtk-2.48.1/Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h:82:36:
> +  error: inlining failed in call to 'always_inline' 'pas_page_base* bmalloc_heap_config_page_header(uintptr_t)':
> +  function not considered for inlining
> +|    82 | PAS_BASIC_HEAP_CONFIG_DECLARATIONS(bmalloc, BMALLOC);
> +|       |
> +
> +Add a cmake variable WEBKIT_NO_INLINE_HINTS to disable gcc function attribute `always_inline` when debug build is enabled.
> +
> +And adjust indent as well.
> +
> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +---
> + ...able-to-control-macro-__PAS_ALWAYS_I.patch | 74 +++++++++++++++++++
> + .../webkitgtk/webkitgtk3_2.48.1.bb            |  4 +-
> + 2 files changed, 77 insertions(+), 1 deletion(-)  create mode 100644 
> +meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-
> +to-control-macro-__PAS_ALWAYS_I.patch
> +
> +diff --git 
> +a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variabl
> +e-to-control-macro-__PAS_ALWAYS_I.patch 
> +b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variabl
> +e-to-control-macro-__PAS_ALWAYS_I.patch
> +new file mode 100644
> +index 0000000000..b1139b857e
> +--- /dev/null
> ++++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-var
> ++++ iable-to-control-macro-__PAS_ALWAYS_I.patch
> +@@ -0,0 +1,74 @@
> ++From bbf661310448d430350eb2ad8c5869ace648dcf8 Mon Sep 17 00:00:00 2001
> ++From: Kai Kang <kai.kang@windriver.com>
> ++Date: Fri, 11 Aug 2023 14:20:48 +0800
> ++Subject: [PATCH] Add a variable to control macro  
> ++__PAS_ALWAYS_INLINE_BUT_NOT_INLINE
> ++ https://bugs.webkit.org/show_bug.cgi?id=260065
> ++
> ++Reviewed by NOBODY (OOPS!).
> ++
> ++It fails to compile webkitgtk with option `-Og` of gcc/g++:
> ++
> ++| In file included from Source/bmalloc/libpas/src/libpas/pas_heap_page_provider.h:30,
> ++|                  from Source/bmalloc/libpas/src/libpas/pas_bootstrap_heap_page_provider.h:29,
> ++|                  from Source/bmalloc/libpas/src/libpas/pas_large_heap_physical_page_sharing_cache.h:29,
> ++|                  from Source/bmalloc/libpas/src/libpas/pas_basic_heap_page_caches.h:29,
> ++|                  from Source/bmalloc/libpas/src/libpas/pas_heap_config_utils.h:32,
> ++|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h:34,
> ++|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:34,
> ++|                  from Source/bmalloc/bmalloc/bmalloc.h:39,
> ++|                  from Source/bmalloc/bmalloc/bmalloc.cpp:26:
> ++| In function 'pas_allocation_result pas_local_allocator_try_allocate(pas_local_allocator*, size_t, size_t, pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter)',
> ++|     inlined from 'pas_allocation_result pas_try_allocate_common_impl_fast(pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter, pas_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_try_allocate_common.h:85:46,
> ++|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alignment_impl_impl_fast(pas_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1,
> ++|     inlined from 'pas_allocation_result pas_try_allocate_intrinsic_impl_casual_case(__pas_heap*, size_t, size_t, pas_intrinsic_heap_support*, pas_heap_config, pas_try_allocate_common_fast, pas_try_allocate_common_slow, pas_intrinsic_heap_designation_mode)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_try_allocate_intrinsic.h:167:44,
> ++|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alignment_impl_casual_case(size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1:
> ++| webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_allocation_result.h:76:1: error: inlining failed in call to 'always_inline' 'pas_allocation_result pas_allocation_result_identity(pas_allocation_result)': function not considered for inlining
> ++|    76 | pas_allocation_result_identity(pas_allocation_result result)
> ++|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ++
> ++Add an variable `WEBKIT_NO_INLINE_HINTS` to control macro 
> ++__PAS_ALWAYS_INLINE_BUT_NOT_INLINE whether includes function attribute 
> ++`always_inline`. It could set the variable to make compilation pass 
> ++when gcc option `-Og` is used.
> ++
> ++* Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h:
> ++* Source/cmake/WebKitCompilerFlags.cmake:
> ++
> ++Upstream-Status: Submitted 
> ++[https://github.com/WebKit/WebKit/pull/16601]
> ++
> ++Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ++Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ++---
> ++ Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h | 2 +-
> ++ Source/cmake/WebKitCompilerFlags.cmake              | 7 +++++++
> ++ 2 files changed, 8 insertions(+), 1 deletion(-)
> ++
> ++diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h 
> ++b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
> ++index 5d5fb38c..a554f700 100644
> ++--- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
> +++++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
> ++@@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;  #define __SUSPICIOUS__  
> ++#define __BROKEN__
> ++ 
> ++-#ifdef __OPTIMIZE__
> +++#if defined(__OPTIMIZE__) && !defined(WEBKIT_NO_INLINE_HINTS)
> ++ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE 
> ++__attribute__((__always_inline__))
> ++ #else
> ++ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
> ++diff --git a/Source/cmake/WebKitCompilerFlags.cmake 
> ++b/Source/cmake/WebKitCompilerFlags.cmake
> ++index f5ec0a55..dfd741e7 100644
> ++--- a/Source/cmake/WebKitCompilerFlags.cmake
> +++++ b/Source/cmake/WebKitCompilerFlags.cmake
> ++@@ -503,3 +503,10 @@ endif ()
> ++ 
> ++ # FIXME: Enable pre-compiled headers for all ports 
> ++ <https://webkit.org/b/139438> set(CMAKE_DISABLE_PRECOMPILE_HEADERS 
> ++ ON)
> +++
> +++# It fails to compile with `gcc -Og`
> +++set(WEBKIT_NO_INLINE_HINTS OFF CACHE BOOL "Disable funtion attribute 
> +++always_inline for WebKit")
> +++
> +++if (WEBKIT_NO_INLINE_HINTS)
> +++    add_definitions(-DWEBKIT_NO_INLINE_HINTS)
> +++endif ()
> +diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb 
> +b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> +index b03ed3cbb9..c3d2169102 100644
> +--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> ++++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> +@@ -21,6 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
> +            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
> +            file://fix-typo-denormaldisabler.patch \
> +            file://fix-ftbfs-riscv64.patch \
> ++           
> ++ file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patc
> ++ h \
> +            "
> + SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
> + 
> +@@ -99,7 +100,8 @@ EXTRA_OECMAKE = " \
> + 	-DUSE_GTK4=OFF \
> + 	${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
> + 	${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
> +-	-DENABLE_MINIBROWSER=ON \
> ++	${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFFF', d)} \
> ++        -DENABLE_MINIBROWSER=ON \
> + 	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
> + 		"
> + # pass -g1 to massively reduce the size of the debug symbols (4.3GB to 
> +700M at time of writing)
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/webkitgtk/0002-webkitgtk3-fix-do_configure-error-on-beaglebone-yoct.patch b/meta-oe/recipes-support/webkitgtk/0002-webkitgtk3-fix-do_configure-error-on-beaglebone-yoct.patch
> new file mode 100644
> index 0000000000..9947601c16
> --- /dev/null
> +++ b/meta-oe/recipes-support/webkitgtk/0002-webkitgtk3-fix-do_configure
> +++ -error-on-beaglebone-yoct.patch
> @@ -0,0 +1,53 @@
> +From d553c5a2a4827b5dd1a1ec971649231f4d2624ce Mon Sep 17 00:00:00 2001
> +From: Jiaying Song <jiaying.song.cn@windriver.com>
> +Date: Thu, 18 Sep 2025 11:19:09 +0800
> +Subject: [meta-oe][walnascar][PATCH 2/2] webkitgtk3: fix do_configure 
> +error on beaglebone-yocto
> +
> +* According to latest comment [1] and the mentioned pull request [2],
> +  build an ENABLE(WEBASSEMBLY) && !ENABLE(JIT) configuration is
> +  supported, so original issue already fixed in current version, the
> +  EXTRA_OECMAKE setting is not needed anymore.
> +
> +* This EXTRA_OECMAKE setting causes following configure error on
> +  beaglebone-yocto, remove the setting to let the configure process
> +  decide the configuration:
> +  CMake Error at Source/cmake/WebKitFeatures.cmake:312 (message):
> +  ENABLE_JIT conflicts with ENABLE_C_LOOP.You must disable one or the
> +  other.
> +
> +[YOCTO #15254]
> +
> +[1] https://github.com/WebKit/WebKit/pull/17447
> +[2] https://github.com/WebKit/WebKit/pull/17688
> +
> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +---
> + .../recipes-support/webkitgtk/webkitgtk3_2.48.1.bb   | 12 ------------
> + 1 file changed, 12 deletions(-)
> +
> +diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb 
> +b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> +index c3d2169102..61be8b2cbf 100644
> +--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> ++++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> +@@ -126,18 +126,6 @@ EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
> + EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
> + EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
> + 
> +-# And for armv7* don't enable it for softfp, because after:
> +-# 
> +https://github.com/WebKit/WebKit/commit/a2ec4ef1997d6fafa6ffc607bffb54e
> +76168a918 -# https://bugs.webkit.org/show_bug.cgi?id=242172
> +-# softfp armv7* fails because WEBASSEMBLY is left enabled by default 
> +and JIT gets -# explicitly disabled causing:
> +-# http://errors.yoctoproject.org/Errors/Details/734587/
> +-# PR was sent upstream, but the end result is the same both JIT and 
> +WEBASSEMBLY disabled -# https://github.com/WebKit/WebKit/pull/17447
> +-EXTRA_OECMAKE:append:armv7a = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
> +-EXTRA_OECMAKE:append:armv7r = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
> +-EXTRA_OECMAKE:append:armv7ve = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
> +-
> + # JIT does not work on RISCV
> + EXTRA_OECMAKE:append:riscv32 = " -DENABLE_JIT=OFF"
> + 
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
> new file mode 100644
> index 0000000000..b1139b857e
> --- /dev/null
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-vari
> +++ able-to-control-macro-__PAS_ALWAYS_I.patch
> @@ -0,0 +1,74 @@
> +From bbf661310448d430350eb2ad8c5869ace648dcf8 Mon Sep 17 00:00:00 2001
> +From: Kai Kang <kai.kang@windriver.com>
> +Date: Fri, 11 Aug 2023 14:20:48 +0800
> +Subject: [PATCH] Add a variable to control macro  
> +__PAS_ALWAYS_INLINE_BUT_NOT_INLINE
> + https://bugs.webkit.org/show_bug.cgi?id=260065
> +
> +Reviewed by NOBODY (OOPS!).
> +
> +It fails to compile webkitgtk with option `-Og` of gcc/g++:
> +
> +| In file included from Source/bmalloc/libpas/src/libpas/pas_heap_page_provider.h:30,
> +|                  from Source/bmalloc/libpas/src/libpas/pas_bootstrap_heap_page_provider.h:29,
> +|                  from Source/bmalloc/libpas/src/libpas/pas_large_heap_physical_page_sharing_cache.h:29,
> +|                  from Source/bmalloc/libpas/src/libpas/pas_basic_heap_page_caches.h:29,
> +|                  from Source/bmalloc/libpas/src/libpas/pas_heap_config_utils.h:32,
> +|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h:34,
> +|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:34,
> +|                  from Source/bmalloc/bmalloc/bmalloc.h:39,
> +|                  from Source/bmalloc/bmalloc/bmalloc.cpp:26:
> +| In function 'pas_allocation_result pas_local_allocator_try_allocate(pas_local_allocator*, size_t, size_t, pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter)',
> +|     inlined from 'pas_allocation_result pas_try_allocate_common_impl_fast(pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter, pas_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_try_allocate_common.h:85:46,
> +|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alignment_impl_impl_fast(pas_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1,
> +|     inlined from 'pas_allocation_result pas_try_allocate_intrinsic_impl_casual_case(__pas_heap*, size_t, size_t, pas_intrinsic_heap_support*, pas_heap_config, pas_try_allocate_common_fast, pas_try_allocate_common_slow, pas_intrinsic_heap_designation_mode)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_try_allocate_intrinsic.h:167:44,
> +|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alignment_impl_casual_case(size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1:
> +| webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_allocation_result.h:76:1: error: inlining failed in call to 'always_inline' 'pas_allocation_result pas_allocation_result_identity(pas_allocation_result)': function not considered for inlining
> +|    76 | pas_allocation_result_identity(pas_allocation_result result)
> +|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Add an variable `WEBKIT_NO_INLINE_HINTS` to control macro 
> +__PAS_ALWAYS_INLINE_BUT_NOT_INLINE whether includes function attribute 
> +`always_inline`. It could set the variable to make compilation pass 
> +when gcc option `-Og` is used.
> +
> +* Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h:
> +* Source/cmake/WebKitCompilerFlags.cmake:
> +
> +Upstream-Status: Submitted 
> +[https://github.com/WebKit/WebKit/pull/16601]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +---
> + Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h | 2 +-
> + Source/cmake/WebKitCompilerFlags.cmake              | 7 +++++++
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h 
> +b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
> +index 5d5fb38c..a554f700 100644
> +--- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
> ++++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
> +@@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;  #define __SUSPICIOUS__  
> +#define __BROKEN__
> + 
> +-#ifdef __OPTIMIZE__
> ++#if defined(__OPTIMIZE__) && !defined(WEBKIT_NO_INLINE_HINTS)
> + #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE 
> +__attribute__((__always_inline__))
> + #else
> + #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
> +diff --git a/Source/cmake/WebKitCompilerFlags.cmake 
> +b/Source/cmake/WebKitCompilerFlags.cmake
> +index f5ec0a55..dfd741e7 100644
> +--- a/Source/cmake/WebKitCompilerFlags.cmake
> ++++ b/Source/cmake/WebKitCompilerFlags.cmake
> +@@ -503,3 +503,10 @@ endif ()
> + 
> + # FIXME: Enable pre-compiled headers for all ports 
> + <https://webkit.org/b/139438> set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
> ++
> ++# It fails to compile with `gcc -Og`
> ++set(WEBKIT_NO_INLINE_HINTS OFF CACHE BOOL "Disable funtion attribute 
> ++always_inline for WebKit")
> ++
> ++if (WEBKIT_NO_INLINE_HINTS)
> ++    add_definitions(-DWEBKIT_NO_INLINE_HINTS)
> ++endif ()
> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> index b03ed3cbb9..9f44dfa924 100644
> --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
> @@ -21,6 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
>             file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
>             file://fix-typo-denormaldisabler.patch \
>             file://fix-ftbfs-riscv64.patch \
> +           
> + file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch 
> + \
>             "
>  SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
>  
> @@ -99,7 +100,8 @@ EXTRA_OECMAKE = " \
>  	-DUSE_GTK4=OFF \
>  	${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
>  	${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
> -	-DENABLE_MINIBROWSER=ON \
> +	${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
> +        -DENABLE_MINIBROWSER=ON \
>  	-DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
>  		"
>  # pass -g1 to massively reduce the size of the debug symbols (4.3GB to 700M at time of writing)
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119528): https://lists.openembedded.org/g/openembedded-devel/message/119528
> Mute This Topic: https://lists.openembedded.org/mt/115305833/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


