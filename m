Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AAF9C98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 17:05:49 +0000 (UTC)
Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3113.1790355946936444760
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 10:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LJmWl7ME;
 spf=pass (domain: konsulko.com, ip: 74.125.228.171, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so170556666b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790355945; x=1790960745; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EoQd8OkFF4WV8vwgwNmE6CwcferKreIrB1NZv/8P3hM=;
        b=LJmWl7MEQ6fn93ambLufJeT0zF8x4lGqWvXGks2gKbKUeGhtGR4tNz+7exxDW7sSaI
         +N6kE+M4WZ0Fdzl0DB78TwV8uGbxYzH8OAwmnjDPsbjzf99OXyhrCml0XrtSrNq86vyF
         0MyF4AQOrbMhoWff/ajF0UM0mOBIZd7a1bTTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355945; x=1790960745;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoQd8OkFF4WV8vwgwNmE6CwcferKreIrB1NZv/8P3hM=;
        b=scrl6f6FhOMqUzQV20xYP1ezYAdBmEXZT2ExK4N158VmYm8LI5X0zJa3W8EIguqkbm
         MxFQKsfiAfGwQ1UU3Z1nsXi0jBcwe+Qm0UmM8eMrzuZPthMvm/s81RPHWsraiYvfuF56
         bza6izUMDyjJqOtRlcVVuaEULCDqUJSk3K0DvmG4sJ9fpnOplXfHsWGB37hoEBTrFzpn
         r8n/G2yNtG8SgSecmpvRUC59SILF9Vfqq/LIgSsdK8BrBQtI/uI8WkMh4QnvF76M/dem
         7Ha+QjYTa/ixctYsqe/VZWDqUB6F6tta0RuAD1Mq7HuGvDDh0dwkz7/EIcHNLRO2FbRi
         x44g==
X-Gm-Message-State: AFuF++mdiOQ7At55yGU9NKkxQV1mNDUupwxnhDKyPnZ4E0fCeRneQocC
	E6OYv0NZqfGHrab7hFKWrn0y/t2oHQhBU20g+EcKvMtydI33PAVu3ZShq0DKYxq64VZRvvFERDD
	fa7zQ
X-Gm-Gg: AYBFou3SroD0lq2WSH2oO3hRUKS/5gW1FfKI4YDESPnV1LQronBpAZ9PiR2zuEa0wHC
	Xv/OSdtpU7dHqliu3iAvl2vttmsrUBQ06ZD7rLahI1YzoMEJb25XQU4RTUKz8ebmqaP3GNKTWQB
	Ak+q8NyZZnhjogLwZFu0CDaMU/j1MkGSViMDii50HCutXi5Nz8m/yBUe8gTixZNmccVFUz4QoxZ
	YXYT/mjGvzUVENoe51yguQe7apmaS+UQ1dcaLXRTBo83N//6Jk/dR7I0YobqfXlYbhPfHCSF0a8
	UiyFBevam1zQ0ilDLqN5j3NKiwyGBlIBz6wvf1gX8jTmc3VF09GwO74xdu4piF+pc9G7+/m9y+y
	oeKNBRFEA0nvBy4DSZ4a/l41nD5bPg1hBtSKXnt9wTiPGildl9hWQxQisL6TGVDXOwQY+9uuGXm
	BIixc38FUw9TADoQH6O7j33sAJkBI2RhEqpJes9O0xEyXAa68l+s1EG0GNskMh/Gg7Cpzx59kzG
	DkfJfUSBKE0amQ9Z89ggRZosvOrYs/+ZPoSpnW+6BQWL904dL4Wh29cdO0oWg1NzAvKFwGlqRfQ
	CRaq/HgeYTQQzCQg
X-Received: by 2002:a17:907:6c17:b0:c29:f5d8:9c71 with SMTP id a640c23a62f3a-c2ac223e35emr591033266b.32.1790355944856;
        Fri, 25 Sep 2026 10:05:44 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7806c47sm143157066b.55.2026.09.25.10.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 10:05:43 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------NothA7KPSDZ0usFL5QIpH6IP"
Message-ID: <b16f07fa-4a23-4e99-b09e-1941d7f7283d@konsulko.com>
Date: Fri, 25 Sep 2026 20:05:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-multimedia][PATCH] x265: Upgrade 4.1 -> 4.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260923151750.3398973-1-leon.anavi@konsulko.com>
 <CAMKF1sqbe2_RLwxnQ6_bKacqGzMYOJA=QzbtjbECQt_V-Rq8AQ@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1sqbe2_RLwxnQ6_bKacqGzMYOJA=QzbtjbECQt_V-Rq8AQ@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 17:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130311

This is a multi-part message in MIME format.
--------------NothA7KPSDZ0usFL5QIpH6IP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

On 9/25/26 07:54, Khem Raj wrote:
> wget on my ubu 24.04 does not fetch the URI from bitbucket but curl 
> does, I am not sure what is going on. I think using alternate URI from 
> videolan might be better
>
> https://download.videolan.org/pub/pub/videolan/${BPN}/${BPN}_${PV}.tar.gz 
> <https://download.videolan.org/pub/pub/videolan/${BPN}/${BPN}_${PV}.tar.gz> 
>
>
Thank you for the code review. I changed the URI and I have just sent v2 
of the patch.

Best regards, Leon


> On Wed, Sep 23, 2026 at 8:17 AM Leon Anavi via lists.openembedded.org 
> <http://lists.openembedded.org> 
> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>
>     Upgrade to release 4.2:
>
>     - Threaded Motion Estimation (Experimental feature)-It uses a
>       dedicated threadpool to precompute Motion Estimation in parallel.
>       Improves encoding speed upto 1.5x for 1080p & lower resolution on
>       multi core machines with low frequency setting. On high frequency
>       systems or on machines with low number of cores, the overhead of
>       additional Motion estimation work may outweigh parallelism
>     - Add new Levels 6.3 to 7.2 specified in ITU-T H.265 (V9) (09/2023)
>       and above
>     - Improve Slices feature with check zeroMv
>     - Enable frame parallelism with MCSTF feature
>     - Updated support to signal AOM FGM params
>     - Improve quality with SBRC feature 6.Updated DolbyVision P5 VUI
>       defaults
>     - API Support to enable Threaded Motion Estimation(-threaded-me)
>     - RISC V optimizations including SAD, SATD, DCT, IDCT, block copy,
>       pixel utilities, SAO, loopfilter, transpose kernels resulting in
>       2x encoding speed.
>     - ARM SIMD optimizations including the use of NEON and SVE
>       instruction set extensions. The following algorithms now have
>       optimized SIMD implementations: DST, IDCT, SSE, SSD,
>       intra_pred_planar, pelFilterLumaStrong, interpolation, planecopy,
>       dequant_normal, blockcopy, pixel variance resulting in 8% faster
>       encoding speed compared to v4.1
>     - Fix memory leaks (no command line option, SEI buffer, analysis
>       save/load)
>     - Fix chroma qp offset for non yuv444 inputs
>     - Fix max supported input resolution
>     - Fix bugs with ARM SIMD optimizations
>     - Fix Alpha and Multiview feature flag support in x265_config
>     - Fix test harness issues, CMake errors
>     - Fix inconsistent output with aq-motion
>     - Fix crash with hist-scenecut on high bit-depth builds
>     - Fix lookahead concurrency bug
>     - Fix shared link issue (R_X86_64_PC32), yuv recon output issue,
>       rd-refine and dynamic-refine issue, inputs for Windows named
>       pipe, weighted prediction delta_chroma_offset, crf and vbv issue
>       in abr-ladder, psnr and ssim reported with MCSTF feature,
>       internally overflowed VBV variables
>
>     This work was sponsored by GOVCERT.LU <http://GOVCERT.LU>.
>
>     Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>     ---
>      .../0001-x265-fix-build-with-cmake-4.patch    | 39
>     +++++++------------
>      .../x265/{x265_4.1.bb <http://x265_4.1.bb> => x265_4.2.bb
>     <http://x265_4.2.bb>}         |  2 +-
>      2 files changed, 15 insertions(+), 26 deletions(-)
>      rename meta-multimedia/recipes-multimedia/x265/{x265_4.1.bb
>     <http://x265_4.1.bb> => x265_4.2.bb <http://x265_4.2.bb>} (93%)
>
>     diff --git
>     a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch
>     b/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch
>     index f218fec5f7..7d301777f0 100644
>     ---
>     a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch
>     +++
>     b/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch
>     @@ -1,4 +1,4 @@
>     -From de68f4d02946d588af6a0c21cf966288c40b039f Mon Sep 17 00:00:00
>     2001
>     +From f376b858b38f8a3b922bb9a5165a5f6f806bd245 Mon Sep 17 00:00:00
>     2001
>      From: Markus Volk <f_l_k@t-online.de>
>      Date: Thu, 10 Jul 2025 09:04:27 +0200
>      Subject: [PATCH] x265: fix build with cmake 4
>     @@ -10,43 +10,32 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
>
>      Upstream-Status: Submitted [https://github.com/videolan/x265/pull/17]
>      ---
>     - source/CMakeLists.txt              | 8 +-------
>     + source/CMakeLists.txt              | 2 +-
>       source/dynamicHDR10/CMakeLists.txt | 4 ++--
>     - 2 files changed, 3 insertions(+), 9 deletions(-)
>     + 2 files changed, 3 insertions(+), 3 deletions(-)
>
>     -diff --git a/CMakeLists.txt b/CMakeLists.txt
>     -index 5c6dda9e8..bd9e0f8d9 100755
>     +diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
>     +index 2e3beaaf3..45df2e9fd 100755
>      --- a/CMakeLists.txt
>      +++ b/CMakeLists.txt
>     -@@ -6,18 +6,12 @@ if(NOT CMAKE_BUILD_TYPE)
>     -         FORCE)
>     - endif()
>     - message(STATUS "cmake version ${CMAKE_VERSION}")
>     --if(POLICY CMP0025)
>     --    cmake_policy(SET CMP0025 OLD) # report Apple's Clang as just
>     Clang
>     --endif()
>     - if(POLICY CMP0042)
>     +@@ -11,7 +11,7 @@ if(POLICY CMP0042)
>           cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH
>       endif()
>     --if(POLICY CMP0054)
>     --    cmake_policy(SET CMP0054 OLD) # Only interpret if()
>     arguments as variables or keywords when unquoted
>     --endif()
>
>     - project (x265)
>     --cmake_minimum_required (VERSION 2.8.8) # OBJECT libraries
>     require 2.8.8
>     +-cmake_minimum_required (VERSION 2.8.8...3.10) # OBJECT libraries
>     require 2.8.8
>      +cmake_minimum_required (VERSION 2.8.8...4.0) # OBJECT libraries
>     require 2.8.8
>     - include(CheckIncludeFiles)
>     - include(CheckFunctionExists)
>     - include(CheckSymbolExists)
>     -diff --git a/dynamicHDR10/CMakeLists.txt
>     b/dynamicHDR10/CMakeLists.txt
>     -index 22fb79d44..03c866b1f 100644
>     +
>     + if (POLICY CMP0075)
>     +     cmake_policy(SET CMP0075 NEW) # CMAKE_REQUIRED_LIBRARIES warning
>     +diff --git a/source/dynamicHDR10/CMakeLists.txt
>     b/source/dynamicHDR10/CMakeLists.txt
>     +index 4243338c6..03c866b1f 100644
>      --- a/dynamicHDR10/CMakeLists.txt
>      +++ b/dynamicHDR10/CMakeLists.txt
>      @@ -10,7 +10,7 @@ add_library(dynamicHDR10 OBJECT
>           hdr10plus.h
>           api.cpp )
>
>     --cmake_minimum_required (VERSION 2.8.11)
>     +-cmake_minimum_required (VERSION 2.8.11...3.26)
>      +cmake_minimum_required (VERSION 2.8.11...4.0)
>       project(dynamicHDR10)
>       include(CheckIncludeFiles)
>     @@ -59,5 +48,5 @@ index 22fb79d44..03c866b1f 100644
>      \ No newline at end of file
>      +endif()
>      --
>     -2.49.0
>     +2.43.0
>
>     diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
>     <http://x265_4.1.bb>
>     b/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
>     <http://x265_4.2.bb>
>     similarity index 93%
>     rename from meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
>     <http://x265_4.1.bb>
>     rename to meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
>     <http://x265_4.2.bb>
>     index 79dd99220e..4841f34016 100644
>     --- a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
>     <http://x265_4.1.bb>
>     +++ b/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
>     <http://x265_4.2.bb>
>     @@ -13,7 +13,7 @@ SRC_URI = " \
>     file://0001-json11.cpp-Include-cstdint.patch \
>     file://0001-x265-fix-build-with-cmake-4.patch \
>      "
>     -SRC_URI[sha256sum] =
>     "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29"
>     +SRC_URI[sha256sum] =
>     "40b1ea0453e0309f0eba934e0ddf533f8f6295966679e8894e8f1c1c8d5e1210"
>      S = "${UNPACKDIR}/x265_${PV}/source"
>
>      inherit lib_package cmake pkgconfig
>     -- 
>     2.47.3
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#130240):
>     https://lists.openembedded.org/g/openembedded-devel/message/130240
>     Mute This Topic: https://lists.openembedded.org/mt/121394339/1997914
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
--------------NothA7KPSDZ0usFL5QIpH6IP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Khem,</p>
    <div class="moz-cite-prefix">On 9/25/26 07:54, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1sqbe2_RLwxnQ6_bKacqGzMYOJA=QzbtjbECQt_V-Rq8AQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">wget on my ubu 24.04 does not fetch the URI from
        bitbucket but curl does, I am not sure what is going on. I think
        using alternate URI from videolan might be better
        <div><br>
        </div>
        <div> <a
href="https://download.videolan.org/pub/pub/videolan/${BPN}/${BPN}_${PV}.tar.gz"
            moz-do-not-send="true">https://download.videolan.org/pub/pub/videolan/${BPN}/${BPN}_${PV}.tar.gz</a> </div>
      </div>
      <br>
    </blockquote>
    <p>Thank you for the code review. I changed the URI and I have just
      sent v2 of the patch.<br>
      <br>
      Best regards, Leon</p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAMKF1sqbe2_RLwxnQ6_bKacqGzMYOJA=QzbtjbECQt_V-Rq8AQ@mail.gmail.com">
      <div class="gmail_quote gmail_quote_container">
        <div dir="ltr" class="gmail_attr">On Wed, Sep 23, 2026 at
          8:17 AM Leon Anavi via <a
            href="http://lists.openembedded.org" moz-do-not-send="true">lists.openembedded.org</a>
          &lt;leon.anavi=<a
            href="mailto:konsulko.com@lists.openembedded.org"
            moz-do-not-send="true" class="moz-txt-link-freetext">konsulko.com@lists.openembedded.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade
          to release 4.2:<br>
          <br>
          - Threaded Motion Estimation (Experimental feature)-It uses a<br>
            dedicated threadpool to precompute Motion Estimation in
          parallel.<br>
            Improves encoding speed upto 1.5x for 1080p &amp; lower
          resolution on<br>
            multi core machines with low frequency setting. On high
          frequency<br>
            systems or on machines with low number of cores, the
          overhead of<br>
            additional Motion estimation work may outweigh parallelism<br>
          - Add new Levels 6.3 to 7.2 specified in ITU-T H.265 (V9)
          (09/2023)<br>
            and above<br>
          - Improve Slices feature with check zeroMv<br>
          - Enable frame parallelism with MCSTF feature<br>
          - Updated support to signal AOM FGM params<br>
          - Improve quality with SBRC feature 6.Updated DolbyVision P5
          VUI<br>
            defaults<br>
          - API Support to enable Threaded Motion
          Estimation(-threaded-me)<br>
          - RISC V optimizations including SAD, SATD, DCT, IDCT, block
          copy,<br>
            pixel utilities, SAO, loopfilter, transpose kernels
          resulting in<br>
            2x encoding speed.<br>
          - ARM SIMD optimizations including the use of NEON and SVE<br>
            instruction set extensions. The following algorithms now
          have<br>
            optimized SIMD implementations: DST, IDCT, SSE, SSD,<br>
            intra_pred_planar, pelFilterLumaStrong, interpolation,
          planecopy,<br>
            dequant_normal, blockcopy, pixel variance resulting in 8%
          faster<br>
            encoding speed compared to v4.1<br>
          - Fix memory leaks (no command line option, SEI buffer,
          analysis<br>
            save/load)<br>
          - Fix chroma qp offset for non yuv444 inputs<br>
          - Fix max supported input resolution<br>
          - Fix bugs with ARM SIMD optimizations<br>
          - Fix Alpha and Multiview feature flag support in x265_config<br>
          - Fix test harness issues, CMake errors<br>
          - Fix inconsistent output with aq-motion<br>
          - Fix crash with hist-scenecut on high bit-depth builds<br>
          - Fix lookahead concurrency bug<br>
          - Fix shared link issue (R_X86_64_PC32), yuv recon output
          issue,<br>
            rd-refine and dynamic-refine issue, inputs for Windows named<br>
            pipe, weighted prediction delta_chroma_offset, crf and vbv
          issue<br>
            in abr-ladder, psnr and ssim reported with MCSTF feature,<br>
            internally overflowed VBV variables<br>
          <br>
          This work was sponsored by <a href="http://GOVCERT.LU"
            rel="noreferrer" target="_blank" moz-do-not-send="true">GOVCERT.LU</a>.<br>
          <br>
          Signed-off-by: Leon Anavi &lt;<a
            href="mailto:leon.anavi@konsulko.com" target="_blank"
            moz-do-not-send="true" class="moz-txt-link-freetext">leon.anavi@konsulko.com</a>&gt;<br>
          ---<br>
           .../0001-x265-fix-build-with-cmake-4.patch    | 39
          +++++++------------<br>
           .../x265/{<a href="http://x265_4.1.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">x265_4.1.bb</a> =&gt;
          <a href="http://x265_4.2.bb" rel="noreferrer" target="_blank"
            moz-do-not-send="true">x265_4.2.bb</a>}         |  2 +-<br>
           2 files changed, 15 insertions(+), 26 deletions(-)<br>
           rename meta-multimedia/recipes-multimedia/x265/{<a
            href="http://x265_4.1.bb" rel="noreferrer" target="_blank"
            moz-do-not-send="true">x265_4.1.bb</a> =&gt; <a
            href="http://x265_4.2.bb" rel="noreferrer" target="_blank"
            moz-do-not-send="true">x265_4.2.bb</a>} (93%)<br>
          <br>
          diff --git
a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch
b/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch<br>
          index f218fec5f7..7d301777f0 100644<br>
          ---
a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch<br>
          +++
b/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-cmake-4.patch<br>
          @@ -1,4 +1,4 @@<br>
          -From de68f4d02946d588af6a0c21cf966288c40b039f Mon Sep 17
          00:00:00 2001<br>
          +From f376b858b38f8a3b922bb9a5165a5f6f806bd245 Mon Sep 17
          00:00:00 2001<br>
           From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de"
            target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">f_l_k@t-online.de</a>&gt;<br>
           Date: Thu, 10 Jul 2025 09:04:27 +0200<br>
           Subject: [PATCH] x265: fix build with cmake 4<br>
          @@ -10,43 +10,32 @@ Signed-off-by: Markus Volk &lt;<a
            href="mailto:f_l_k@t-online.de" target="_blank"
            moz-do-not-send="true" class="moz-txt-link-freetext">f_l_k@t-online.de</a>&gt;<br>
          <br>
           Upstream-Status: Submitted [<a
            href="https://github.com/videolan/x265/pull/17"
            rel="noreferrer" target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">https://github.com/videolan/x265/pull/17</a>]<br>
           ---<br>
          - source/CMakeLists.txt              | 8 +-------<br>
          + source/CMakeLists.txt              | 2 +-<br>
            source/dynamicHDR10/CMakeLists.txt | 4 ++--<br>
          - 2 files changed, 3 insertions(+), 9 deletions(-)<br>
          + 2 files changed, 3 insertions(+), 3 deletions(-)<br>
          <br>
          -diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
          -index 5c6dda9e8..bd9e0f8d9 100755<br>
          +diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt<br>
          +index 2e3beaaf3..45df2e9fd 100755<br>
           --- a/CMakeLists.txt<br>
           +++ b/CMakeLists.txt<br>
          -@@ -6,18 +6,12 @@ if(NOT CMAKE_BUILD_TYPE)<br>
          -         FORCE)<br>
          - endif()<br>
          - message(STATUS "cmake version ${CMAKE_VERSION}")<br>
          --if(POLICY CMP0025)<br>
          --    cmake_policy(SET CMP0025 OLD) # report Apple's Clang as
          just Clang<br>
          --endif()<br>
          - if(POLICY CMP0042)<br>
          +@@ -11,7 +11,7 @@ if(POLICY CMP0042)<br>
                cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH<br>
            endif()<br>
          --if(POLICY CMP0054)<br>
          --    cmake_policy(SET CMP0054 OLD) # Only interpret if()
          arguments as variables or keywords when unquoted<br>
          --endif()<br>
          <br>
          - project (x265)<br>
          --cmake_minimum_required (VERSION 2.8.8) # OBJECT libraries
          require 2.8.8<br>
          +-cmake_minimum_required (VERSION 2.8.8...3.10) # OBJECT
          libraries require 2.8.8<br>
           +cmake_minimum_required (VERSION 2.8.8...4.0) # OBJECT
          libraries require 2.8.8<br>
          - include(CheckIncludeFiles)<br>
          - include(CheckFunctionExists)<br>
          - include(CheckSymbolExists)<br>
          -diff --git a/dynamicHDR10/CMakeLists.txt
          b/dynamicHDR10/CMakeLists.txt<br>
          -index 22fb79d44..03c866b1f 100644<br>
          + <br>
          + if (POLICY CMP0075)<br>
          +     cmake_policy(SET CMP0075 NEW) # CMAKE_REQUIRED_LIBRARIES
          warning<br>
          +diff --git a/source/dynamicHDR10/CMakeLists.txt
          b/source/dynamicHDR10/CMakeLists.txt<br>
          +index 4243338c6..03c866b1f 100644<br>
           --- a/dynamicHDR10/CMakeLists.txt<br>
           +++ b/dynamicHDR10/CMakeLists.txt<br>
           @@ -10,7 +10,7 @@ add_library(dynamicHDR10 OBJECT<br>
                hdr10plus.h<br>
                api.cpp )<br>
          <br>
          --cmake_minimum_required (VERSION 2.8.11)<br>
          +-cmake_minimum_required (VERSION 2.8.11...3.26)<br>
           +cmake_minimum_required (VERSION 2.8.11...4.0)<br>
            project(dynamicHDR10)<br>
            include(CheckIncludeFiles)<br>
          @@ -59,5 +48,5 @@ index 22fb79d44..03c866b1f 100644<br>
           \ No newline at end of file<br>
           +endif()<br>
           -- <br>
          -2.49.0<br>
          +2.43.0<br>
          <br>
          diff --git a/meta-multimedia/recipes-multimedia/x265/<a
            href="http://x265_4.1.bb" rel="noreferrer" target="_blank"
            moz-do-not-send="true">x265_4.1.bb</a>
          b/meta-multimedia/recipes-multimedia/x265/<a
            href="http://x265_4.2.bb" rel="noreferrer" target="_blank"
            moz-do-not-send="true">x265_4.2.bb</a><br>
          similarity index 93%<br>
          rename from meta-multimedia/recipes-multimedia/x265/<a
            href="http://x265_4.1.bb" rel="noreferrer" target="_blank"
            moz-do-not-send="true">x265_4.1.bb</a><br>
          rename to meta-multimedia/recipes-multimedia/x265/<a
            href="http://x265_4.2.bb" rel="noreferrer" target="_blank"
            moz-do-not-send="true">x265_4.2.bb</a><br>
          index 79dd99220e..4841f34016 100644<br>
          --- a/meta-multimedia/recipes-multimedia/x265/<a
            href="http://x265_4.1.bb" rel="noreferrer" target="_blank"
            moz-do-not-send="true">x265_4.1.bb</a><br>
          +++ b/meta-multimedia/recipes-multimedia/x265/<a
            href="http://x265_4.2.bb" rel="noreferrer" target="_blank"
            moz-do-not-send="true">x265_4.2.bb</a><br>
          @@ -13,7 +13,7 @@ SRC_URI = " \<br>
               <a class="moz-txt-link-freetext" href="file://0001-json11.cpp-Include-cstdint.patch">file://0001-json11.cpp-Include-cstdint.patch</a> \<br>
               <a class="moz-txt-link-freetext" href="file://0001-x265-fix-build-with-cmake-4.patch">file://0001-x265-fix-build-with-cmake-4.patch</a> \<br>
           "<br>
          -SRC_URI[sha256sum] =
          "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29"<br>
          +SRC_URI[sha256sum] =
          "40b1ea0453e0309f0eba934e0ddf533f8f6295966679e8894e8f1c1c8d5e1210"<br>
           S = "${UNPACKDIR}/x265_${PV}/source"<br>
          <br>
           inherit lib_package cmake pkgconfig<br>
          -- <br>
          2.47.3<br>
          <br>
          <br>
          -=-=-=-=-=-=-=-=-=-=-=-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#130240): <a
href="https://lists.openembedded.org/g/openembedded-devel/message/130240"
            rel="noreferrer" target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/message/130240</a><br>
          Mute This Topic: <a
            href="https://lists.openembedded.org/mt/121394339/1997914"
            rel="noreferrer" target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">https://lists.openembedded.org/mt/121394339/1997914</a><br>
          Group Owner: <a
href="mailto:openembedded-devel%2Bowner@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">openembedded-devel+owner@lists.openembedded.org</a><br>
          Unsubscribe: <a
href="https://lists.openembedded.org/g/openembedded-devel/unsub"
            rel="noreferrer" target="_blank" moz-do-not-send="true"
            class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-devel/unsub</a>
          [<a href="mailto:raj.khem@gmail.com" target="_blank"
            moz-do-not-send="true" class="moz-txt-link-freetext">raj.khem@gmail.com</a>]<br>
          -=-=-=-=-=-=-=-=-=-=-=-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------NothA7KPSDZ0usFL5QIpH6IP--

