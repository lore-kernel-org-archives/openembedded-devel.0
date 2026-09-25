Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8ECC98306
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 04:55:17 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1648.1790312115574129850
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2026 21:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ISIA/mhu;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab20f4bso738756d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 21:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790312114; cv=none;
        d=google.com; s=arc-20260327;
        b=it/3elHAVWXe0MZ33E8zJsVCOgGWI0SLrdS2VbTM8aKT/q2WEK9xCuGQXtnGEJYTbs
         8rpV6+kgmuzkvmvNCB4plH8lubbhYBMR1Dd7rcihC8eT1dB4A/ofRXXwSgsUo/g+qRJF
         aGLYxAbvP3GyFxeAbEBWSfm8egyqYEdI6svNzK6n3S++yHjTcMo2OnZLjPSZcwcxblhA
         0esXvRznPN86tPoio0G9ze/5MY4ojq+SkyUdEPghU0U6RZ09ssAXqUHLJHE+SacGMLU0
         grkyvgfrhX5ef/0s0DYcS4nqgLvtF33ajDq63pseKAYxcoOEenknbslKHaPVORRyzlds
         J41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3A3KHokul/TypOUdJPDRCOx/2n3VlZ5kiu4PtmysMcI=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=sD0T4b98KizX/B7oB8l3oUXMTQ0Ta8s5kkYMA/fmsT0HQ9gFBqPtMuoklTX5pXO7Ti
         w0UljfIK8gFHeHMDnZayZZF3V36FxVdurHvFOX5ti5IAB+krPKJn+lmA8btKO5L2ZvH2
         9VOdB7W+bUNCVvBeKdoVWiFMak7MLe//WRpL2nYXZ9Kk3YkaQGm7NoPazHyMHg9p5opw
         0vZyHdXLMMieE3aH/7I9CFUChaVjsrp15HmFFTiVlZJfMuL/JAHTMSYZ+mUxWFaSC6Co
         S0k5GuD5uI0nnxndmBZ8/tTAKjAtxnr5iRwXeFU5xEQUVVwAewIZ4A8SP1bEzu0CRNwk
         OpGg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790312114; x=1790916914; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3A3KHokul/TypOUdJPDRCOx/2n3VlZ5kiu4PtmysMcI=;
        b=ISIA/mhusvVY9/2vNhlecJfkkHOH6nyXjseap1dffmXd2BQ88KMnVQTTRrBd0tKnED
         nKHzXB+tUCgSaE4UcAhg7nuOCvK10/bXr+lSJg+bsStSbPDSkX34shHVtopEsR5nF/0N
         KPvVEk3ldNEdLl5W9GD1DyKcsSYW3BlPNxWT6tGBUBFw24DCpVEyz0eYmOVjuc4Fqj2P
         CR3L9KEa8sNbBH9zeFNTXH+XAD0TO2lMB7w9bHGew4IoUz2v3RuhJ7FGWw7DUQ67/Dxm
         ZRYVhG21h8eFuEegELNClyDtPZi7d/Pe9gg+UryXl45FYO05av3/KIQWbHoswWHNAoAj
         8ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790312114; x=1790916914;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3A3KHokul/TypOUdJPDRCOx/2n3VlZ5kiu4PtmysMcI=;
        b=tBXakMXdwSWPwpP9MhSvSJlhOtf3jERugr1poTtK79mFqEZ5A6CNgE69YkE0espzSV
         Qd7HyKum0drs2jbM4nEreVLPkRyNfol0BQ2hB2/5CH0aagU0enI7ali96Nt9M1TMJNt1
         +veNK95tM/pSWFKeZcd5CZNmQYJZl9a9l2UhVWy/4AD91zGVfGGgxyjZa3dSnmpoA2Hg
         3DecwXoE3ZaYLxfXpCsDOmpvSVxSS4VL8EbGPgsFBWWBo/rxl2xhhlbHhbJ+KotJ2qhN
         ZjsXNgvoK2iVEFdovqC7VMVNTZPVIEiH4/3DfCMpDP+yDm1byFjm3nsw7ZokeFB0rH9S
         Q4ew==
X-Gm-Message-State: AFuF++klfMZ4zIsviwRvNMoNYZSs7M8jkmKiGo9j2LvFx9VtDhTbcm+H
	TFdF4CrL1MtDlHoUyOkJbfKjCcQkk1+Mo0hlKK7khcciTk6ZOXL5Ell51V9emv7+xCL7xKpiYnC
	8wI7Xzk4UjN2iLlprBx35Bi1pyvEo8a4=
X-Gm-Gg: AYBFou1otVbCbrMxTF3AU0yjyW3dZIxr4gUBwXGy6JFc4QHTLCY5zxw0Bp7pTiVC9DY
	tvDiy4fRqr6yHOaMRbRybLBedn9kl6Zcn8z2EOBOp7JGY3t1Zqz/qSgWsbMKZN5LwuIzkWvo54/
	mFMR3fcU53GLoW41Sm4oRicPsEk8EW2wJhVL5wbFDWuznhR9x9kPI6ONVMIfqz2etQL534JGs67
	a9K/eoUTexC5+FeoAQj7pJ4GV9MSmzCmttG9qz2XMzT33S7mZXcCdEBVJYBbzNsMIrUC8AeDLo/
	+M7Eg21glg8UJm0FEgYM+BUQWBk33lubUCicJVlggEnq/OPSmBCGtvOBuCa0YR9Z/yheN/vU6b+
	i8f+VwQMhhHO6lM3R3jB51gifg7TcCkItnQNdGKcKQ8XhVsz1U7q576JPCAy0W19nClFJ+iLXwE
	cAq8Edms2czdrzn7GIMc9gva94btpAE6eVEDh6Ee8xKaK+e4TuZ7qkFOqodNNRmvGBVmttkDzp7
	YnUklBL+hxSuDTLRJmfwMnsF3Hxh/QQNzbSGw9DxuPWfZyzbT4EiWKRl/h2v+86+0b1P57JP8ql
	/XtQ+dDux/2jiOczsQ==
X-Received: by 2002:a05:690e:4084:b0:66f:c8e4:f013 with SMTP id
 956f58d0204a3-6741124baa3mr211164d50.50.1790312114434; Thu, 24 Sep 2026
 21:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260923151750.3398973-1-leon.anavi@konsulko.com>
In-Reply-To: <20260923151750.3398973-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Sep 2026 21:54:47 -0700
X-Gm-Features: AclHuK-wndyVb3ASxKdlexg7iL74d93D3ti7_pFt1MJGVDCMvKxD6TMum-D501I
Message-ID: <CAMKF1sqbe2_RLwxnQ6_bKacqGzMYOJA=QzbtjbECQt_V-Rq8AQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] x265: Upgrade 4.1 -> 4.2
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009e36fb065c478576"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 04:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130288

--0000000000009e36fb065c478576
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wget on my ubu 24.04 does not fetch the URI from bitbucket but curl does, I
am not sure what is going on. I think using alternate URI from videolan
might be better

 https://download.videolan.org/pub/pub/videolan/${BPN}/${BPN}_${PV}.tar.gz

On Wed, Sep 23, 2026 at 8:17=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 4.2:
>
> - Threaded Motion Estimation (Experimental feature)-It uses a
>   dedicated threadpool to precompute Motion Estimation in parallel.
>   Improves encoding speed upto 1.5x for 1080p & lower resolution on
>   multi core machines with low frequency setting. On high frequency
>   systems or on machines with low number of cores, the overhead of
>   additional Motion estimation work may outweigh parallelism
> - Add new Levels 6.3 to 7.2 specified in ITU-T H.265 (V9) (09/2023)
>   and above
> - Improve Slices feature with check zeroMv
> - Enable frame parallelism with MCSTF feature
> - Updated support to signal AOM FGM params
> - Improve quality with SBRC feature 6.Updated DolbyVision P5 VUI
>   defaults
> - API Support to enable Threaded Motion Estimation(-threaded-me)
> - RISC V optimizations including SAD, SATD, DCT, IDCT, block copy,
>   pixel utilities, SAO, loopfilter, transpose kernels resulting in
>   2x encoding speed.
> - ARM SIMD optimizations including the use of NEON and SVE
>   instruction set extensions. The following algorithms now have
>   optimized SIMD implementations: DST, IDCT, SSE, SSD,
>   intra_pred_planar, pelFilterLumaStrong, interpolation, planecopy,
>   dequant_normal, blockcopy, pixel variance resulting in 8% faster
>   encoding speed compared to v4.1
> - Fix memory leaks (no command line option, SEI buffer, analysis
>   save/load)
> - Fix chroma qp offset for non yuv444 inputs
> - Fix max supported input resolution
> - Fix bugs with ARM SIMD optimizations
> - Fix Alpha and Multiview feature flag support in x265_config
> - Fix test harness issues, CMake errors
> - Fix inconsistent output with aq-motion
> - Fix crash with hist-scenecut on high bit-depth builds
> - Fix lookahead concurrency bug
> - Fix shared link issue (R_X86_64_PC32), yuv recon output issue,
>   rd-refine and dynamic-refine issue, inputs for Windows named
>   pipe, weighted prediction delta_chroma_offset, crf and vbv issue
>   in abr-ladder, psnr and ssim reported with MCSTF feature,
>   internally overflowed VBV variables
>
> This work was sponsored by GOVCERT.LU.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../0001-x265-fix-build-with-cmake-4.patch    | 39 +++++++------------
>  .../x265/{x265_4.1.bb =3D> x265_4.2.bb}         |  2 +-
>  2 files changed, 15 insertions(+), 26 deletions(-)
>  rename meta-multimedia/recipes-multimedia/x265/{x265_4.1.bb =3D>
> x265_4.2.bb} (93%)
>
> diff --git
> a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-c=
make-4.patch
> b/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-c=
make-4.patch
> index f218fec5f7..7d301777f0 100644
> ---
> a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-c=
make-4.patch
> +++
> b/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with-c=
make-4.patch
> @@ -1,4 +1,4 @@
> -From de68f4d02946d588af6a0c21cf966288c40b039f Mon Sep 17 00:00:00 2001
> +From f376b858b38f8a3b922bb9a5165a5f6f806bd245 Mon Sep 17 00:00:00 2001
>  From: Markus Volk <f_l_k@t-online.de>
>  Date: Thu, 10 Jul 2025 09:04:27 +0200
>  Subject: [PATCH] x265: fix build with cmake 4
> @@ -10,43 +10,32 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
>
>  Upstream-Status: Submitted [https://github.com/videolan/x265/pull/17]
>  ---
> - source/CMakeLists.txt              | 8 +-------
> + source/CMakeLists.txt              | 2 +-
>   source/dynamicHDR10/CMakeLists.txt | 4 ++--
> - 2 files changed, 3 insertions(+), 9 deletions(-)
> + 2 files changed, 3 insertions(+), 3 deletions(-)
>
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 5c6dda9e8..bd9e0f8d9 100755
> +diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
> +index 2e3beaaf3..45df2e9fd 100755
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -6,18 +6,12 @@ if(NOT CMAKE_BUILD_TYPE)
> -         FORCE)
> - endif()
> - message(STATUS "cmake version ${CMAKE_VERSION}")
> --if(POLICY CMP0025)
> --    cmake_policy(SET CMP0025 OLD) # report Apple's Clang as just Clang
> --endif()
> - if(POLICY CMP0042)
> +@@ -11,7 +11,7 @@ if(POLICY CMP0042)
>       cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH
>   endif()
> --if(POLICY CMP0054)
> --    cmake_policy(SET CMP0054 OLD) # Only interpret if() arguments as
> variables or keywords when unquoted
> --endif()
>
> - project (x265)
> --cmake_minimum_required (VERSION 2.8.8) # OBJECT libraries require 2.8.8
> +-cmake_minimum_required (VERSION 2.8.8...3.10) # OBJECT libraries requir=
e
> 2.8.8
>  +cmake_minimum_required (VERSION 2.8.8...4.0) # OBJECT libraries require
> 2.8.8
> - include(CheckIncludeFiles)
> - include(CheckFunctionExists)
> - include(CheckSymbolExists)
> -diff --git a/dynamicHDR10/CMakeLists.txt b/dynamicHDR10/CMakeLists.txt
> -index 22fb79d44..03c866b1f 100644
> +
> + if (POLICY CMP0075)
> +     cmake_policy(SET CMP0075 NEW) # CMAKE_REQUIRED_LIBRARIES warning
> +diff --git a/source/dynamicHDR10/CMakeLists.txt
> b/source/dynamicHDR10/CMakeLists.txt
> +index 4243338c6..03c866b1f 100644
>  --- a/dynamicHDR10/CMakeLists.txt
>  +++ b/dynamicHDR10/CMakeLists.txt
>  @@ -10,7 +10,7 @@ add_library(dynamicHDR10 OBJECT
>       hdr10plus.h
>       api.cpp )
>
> --cmake_minimum_required (VERSION 2.8.11)
> +-cmake_minimum_required (VERSION 2.8.11...3.26)
>  +cmake_minimum_required (VERSION 2.8.11...4.0)
>   project(dynamicHDR10)
>   include(CheckIncludeFiles)
> @@ -59,5 +48,5 @@ index 22fb79d44..03c866b1f 100644
>  \ No newline at end of file
>  +endif()
>  --
> -2.49.0
> +2.43.0
>
> diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> b/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
> similarity index 93%
> rename from meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> rename to meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
> index 79dd99220e..4841f34016 100644
> --- a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
> +++ b/meta-multimedia/recipes-multimedia/x265/x265_4.2.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D " \
>      file://0001-json11.cpp-Include-cstdint.patch \
>      file://0001-x265-fix-build-with-cmake-4.patch \
>  "
> -SRC_URI[sha256sum] =3D
> "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29"
> +SRC_URI[sha256sum] =3D
> "40b1ea0453e0309f0eba934e0ddf533f8f6295966679e8894e8f1c1c8d5e1210"
>  S =3D "${UNPACKDIR}/x265_${PV}/source"
>
>  inherit lib_package cmake pkgconfig
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130240):
> https://lists.openembedded.org/g/openembedded-devel/message/130240
> Mute This Topic: https://lists.openembedded.org/mt/121394339/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009e36fb065c478576
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">wget on my ubu 24.04 does not fetch the URI from bitbucket=
 but curl does, I am not sure what is going on. I think using alternate URI=
 from videolan might be better<div><br></div><div>=C2=A0<a href=3D"https://=
download.videolan.org/pub/pub/videolan/${BPN}/${BPN}_${PV}.tar.gz">https://=
download.videolan.org/pub/pub/videolan/${BPN}/${BPN}_${PV}.tar.gz</a>=C2=A0=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Sep 23, 2026 at 8:17=E2=80=AFAM Leon =
Anavi via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org"=
>konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Upgrade to release 4.2:<br>
<br>
- Threaded Motion Estimation (Experimental feature)-It uses a<br>
=C2=A0 dedicated threadpool to precompute Motion Estimation in parallel.<br=
>
=C2=A0 Improves encoding speed upto 1.5x for 1080p &amp; lower resolution o=
n<br>
=C2=A0 multi core machines with low frequency setting. On high frequency<br=
>
=C2=A0 systems or on machines with low number of cores, the overhead of<br>
=C2=A0 additional Motion estimation work may outweigh parallelism<br>
- Add new Levels 6.3 to 7.2 specified in ITU-T H.265 (V9) (09/2023)<br>
=C2=A0 and above<br>
- Improve Slices feature with check zeroMv<br>
- Enable frame parallelism with MCSTF feature<br>
- Updated support to signal AOM FGM params<br>
- Improve quality with SBRC feature 6.Updated DolbyVision P5 VUI<br>
=C2=A0 defaults<br>
- API Support to enable Threaded Motion Estimation(-threaded-me)<br>
- RISC V optimizations including SAD, SATD, DCT, IDCT, block copy,<br>
=C2=A0 pixel utilities, SAO, loopfilter, transpose kernels resulting in<br>
=C2=A0 2x encoding speed.<br>
- ARM SIMD optimizations including the use of NEON and SVE<br>
=C2=A0 instruction set extensions. The following algorithms now have<br>
=C2=A0 optimized SIMD implementations: DST, IDCT, SSE, SSD,<br>
=C2=A0 intra_pred_planar, pelFilterLumaStrong, interpolation, planecopy,<br=
>
=C2=A0 dequant_normal, blockcopy, pixel variance resulting in 8% faster<br>
=C2=A0 encoding speed compared to v4.1<br>
- Fix memory leaks (no command line option, SEI buffer, analysis<br>
=C2=A0 save/load)<br>
- Fix chroma qp offset for non yuv444 inputs<br>
- Fix max supported input resolution<br>
- Fix bugs with ARM SIMD optimizations<br>
- Fix Alpha and Multiview feature flag support in x265_config<br>
- Fix test harness issues, CMake errors<br>
- Fix inconsistent output with aq-motion<br>
- Fix crash with hist-scenecut on high bit-depth builds<br>
- Fix lookahead concurrency bug<br>
- Fix shared link issue (R_X86_64_PC32), yuv recon output issue,<br>
=C2=A0 rd-refine and dynamic-refine issue, inputs for Windows named<br>
=C2=A0 pipe, weighted prediction delta_chroma_offset, crf and vbv issue<br>
=C2=A0 in abr-ladder, psnr and ssim reported with MCSTF feature,<br>
=C2=A0 internally overflowed VBV variables<br>
<br>
This work was sponsored by <a href=3D"http://GOVCERT.LU" rel=3D"noreferrer"=
 target=3D"_blank">GOVCERT.LU</a>.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../0001-x265-fix-build-with-cmake-4.patch=C2=A0 =C2=A0 | 39 +++++++-=
-----------<br>
=C2=A0.../x265/{<a href=3D"http://x265_4.1.bb" rel=3D"noreferrer" target=3D=
"_blank">x265_4.1.bb</a> =3D&gt; <a href=3D"http://x265_4.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">x265_4.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A02 files changed, 15 insertions(+), 26 deletions(-)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/x265/{<a href=3D"http://x26=
5_4.1.bb" rel=3D"noreferrer" target=3D"_blank">x265_4.1.bb</a> =3D&gt; <a h=
ref=3D"http://x265_4.2.bb" rel=3D"noreferrer" target=3D"_blank">x265_4.2.bb=
</a>} (93%)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-bui=
ld-with-cmake-4.patch b/meta-multimedia/recipes-multimedia/x265/x265/0001-x=
265-fix-build-with-cmake-4.patch<br>
index f218fec5f7..7d301777f0 100644<br>
--- a/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with=
-cmake-4.patch<br>
+++ b/meta-multimedia/recipes-multimedia/x265/x265/0001-x265-fix-build-with=
-cmake-4.patch<br>
@@ -1,4 +1,4 @@<br>
-From de68f4d02946d588af6a0c21cf966288c40b039f Mon Sep 17 00:00:00 2001<br>
+From f376b858b38f8a3b922bb9a5165a5f6f806bd245 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"=
_blank">f_l_k@t-online.de</a>&gt;<br>
=C2=A0Date: Thu, 10 Jul 2025 09:04:27 +0200<br>
=C2=A0Subject: [PATCH] x265: fix build with cmake 4<br>
@@ -10,43 +10,32 @@ Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@=
t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/videolan/x2=
65/pull/17" rel=3D"noreferrer" target=3D"_blank">https://github.com/videola=
n/x265/pull/17</a>]<br>
=C2=A0---<br>
- source/CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8=
 +-------<br>
+ source/CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
 +-<br>
=C2=A0 source/dynamicHDR10/CMakeLists.txt | 4 ++--<br>
- 2 files changed, 3 insertions(+), 9 deletions(-)<br>
+ 2 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
-diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index 5c6dda9e8..bd9e0f8d9 100755<br>
+diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt<br>
+index 2e3beaaf3..45df2e9fd 100755<br>
=C2=A0--- a/CMakeLists.txt<br>
=C2=A0+++ b/CMakeLists.txt<br>
-@@ -6,18 +6,12 @@ if(NOT CMAKE_BUILD_TYPE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FORCE)<br>
- endif()<br>
- message(STATUS &quot;cmake version ${CMAKE_VERSION}&quot;)<br>
--if(POLICY CMP0025)<br>
--=C2=A0 =C2=A0 cmake_policy(SET CMP0025 OLD) # report Apple&#39;s Clang as=
 just Clang<br>
--endif()<br>
- if(POLICY CMP0042)<br>
+@@ -11,7 +11,7 @@ if(POLICY CMP0042)<br>
=C2=A0 =C2=A0 =C2=A0 cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH<br>
=C2=A0 endif()<br>
--if(POLICY CMP0054)<br>
--=C2=A0 =C2=A0 cmake_policy(SET CMP0054 OLD) # Only interpret if() argumen=
ts as variables or keywords when unquoted<br>
--endif()<br>
<br>
- project (x265)<br>
--cmake_minimum_required (VERSION 2.8.8) # OBJECT libraries require 2.8.8<b=
r>
+-cmake_minimum_required (VERSION 2.8.8...3.10) # OBJECT libraries require =
2.8.8<br>
=C2=A0+cmake_minimum_required (VERSION 2.8.8...4.0) # OBJECT libraries requ=
ire 2.8.8<br>
- include(CheckIncludeFiles)<br>
- include(CheckFunctionExists)<br>
- include(CheckSymbolExists)<br>
-diff --git a/dynamicHDR10/CMakeLists.txt b/dynamicHDR10/CMakeLists.txt<br>
-index 22fb79d44..03c866b1f 100644<br>
+ <br>
+ if (POLICY CMP0075)<br>
+=C2=A0 =C2=A0 =C2=A0cmake_policy(SET CMP0075 NEW) # CMAKE_REQUIRED_LIBRARI=
ES warning<br>
+diff --git a/source/dynamicHDR10/CMakeLists.txt b/source/dynamicHDR10/CMak=
eLists.txt<br>
+index 4243338c6..03c866b1f 100644<br>
=C2=A0--- a/dynamicHDR10/CMakeLists.txt<br>
=C2=A0+++ b/dynamicHDR10/CMakeLists.txt<br>
=C2=A0@@ -10,7 +10,7 @@ add_library(dynamicHDR10 OBJECT<br>
=C2=A0 =C2=A0 =C2=A0 hdr10plus.h<br>
=C2=A0 =C2=A0 =C2=A0 api.cpp )<br>
<br>
--cmake_minimum_required (VERSION 2.8.11)<br>
+-cmake_minimum_required (VERSION 2.8.11...3.26)<br>
=C2=A0+cmake_minimum_required (VERSION 2.8.11...4.0)<br>
=C2=A0 project(dynamicHDR10)<br>
=C2=A0 include(CheckIncludeFiles)<br>
@@ -59,5 +48,5 @@ index 22fb79d44..03c866b1f 100644<br>
=C2=A0\ No newline at end of file<br>
=C2=A0+endif()<br>
=C2=A0-- <br>
-2.49.0<br>
+2.43.0<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/x265/<a href=3D"http://x265=
_4.1.bb" rel=3D"noreferrer" target=3D"_blank">x265_4.1.bb</a> b/meta-multim=
edia/recipes-multimedia/x265/<a href=3D"http://x265_4.2.bb" rel=3D"noreferr=
er" target=3D"_blank">x265_4.2.bb</a><br>
similarity index 93%<br>
rename from meta-multimedia/recipes-multimedia/x265/<a href=3D"http://x265_=
4.1.bb" rel=3D"noreferrer" target=3D"_blank">x265_4.1.bb</a><br>
rename to meta-multimedia/recipes-multimedia/x265/<a href=3D"http://x265_4.=
2.bb" rel=3D"noreferrer" target=3D"_blank">x265_4.2.bb</a><br>
index 79dd99220e..4841f34016 100644<br>
--- a/meta-multimedia/recipes-multimedia/x265/<a href=3D"http://x265_4.1.bb=
" rel=3D"noreferrer" target=3D"_blank">x265_4.1.bb</a><br>
+++ b/meta-multimedia/recipes-multimedia/x265/<a href=3D"http://x265_4.2.bb=
" rel=3D"noreferrer" target=3D"_blank">x265_4.2.bb</a><br>
@@ -13,7 +13,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-json11.cpp-Include-cstdint.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-x265-fix-build-with-cmake-4.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;a31699c6a89806b74b0151e5e6a7df65de4b49050482f=
e5ebf8a4379d7af8f29&quot;<br>
+SRC_URI[sha256sum] =3D &quot;40b1ea0453e0309f0eba934e0ddf533f8f6295966679e=
8894e8f1c1c8d5e1210&quot;<br>
=C2=A0S =3D &quot;${UNPACKDIR}/x265_${PV}/source&quot;<br>
<br>
=C2=A0inherit lib_package cmake pkgconfig<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130240): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130240" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130240</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121394339/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121394339/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009e36fb065c478576--

