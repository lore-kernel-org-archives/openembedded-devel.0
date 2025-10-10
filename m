Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D76CCD18A
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 13:46:07 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.9438.1760103964339348170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 06:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bKpYiycz;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso3545363a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760103962; x=1760708762; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=teez/837wmQ8SzYWe5gXNr1TZey/BUqr1G+A9g3ZgoQ=;
        b=bKpYiyczo8poCI071rkah+XZ+Ktv+q80S+Mq3Iyhbn/L6q+zQPsLd4uQGgxbgMb90t
         bCBNhIcKghiWVckao90oc7vVmZABaTcTTe49TS5XUFguKcv8c/47CPItDRHygpXoujCB
         NKPASCorfd8MebZv6GFCwRZ5Q8dhkqcYNP5mfha5G1tPzIRSCIlKdOTqeVVg5hQLQ3RC
         +upOgMCDtReibMuCvYc7oprRUBXP47fODfAMZuHe/l7gxNyxTJyiclRjIwqKtpJlC435
         1H+VxNVWHNDSzP++juIQgi/i2khDAVjXwcf6B3imcvPuRZNKvZEyh3INw6aDwjcYz2uI
         aQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760103962; x=1760708762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=teez/837wmQ8SzYWe5gXNr1TZey/BUqr1G+A9g3ZgoQ=;
        b=eQPFI1mq8y6iVtLKSfn1+iJfeErGctjRTFdVSQuyQIDIGoIkYJ0Qa0Sk4rmYmgUki3
         zkjCYfC/bzmvBpEMNDbHK7raZ5znd8CHF/ocNxapbXDF4K6PSRvdMtB9XcsQhxTJqzuM
         59NCY6m04uinWcvqcQ2umRbaPSh8oHjcIWFT7cXgvGS0xrpMfpJRjT4lnP70LyySfv3g
         ZeGIq45xGKhne1KgkKRLMOuNl/157sunLVkJHlkrrgnd7rvIL+uiqvUEMjjbS6GcX13u
         gNa3NsAHQYHFTurPaLT9g7p/42MPxLtj33D9yxd4ycwGvdmas8Xq0k96Uw8ql7HRsdgj
         HwgA==
X-Forwarded-Encrypted: i=1; AJvYcCUzYbHdjok2bvokm+qxXn3sPjQOn7oWSfjx36TTFaC+q3j7PJhbtf2AoXxBdGoF+g3k7ikPbfGYl/XAa1lDJccnkwU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6NSd6PO8c4hBQ6lygI4oShnPXC50RuD+0FjoJA9HnoOs5ClCJ
	qRxMx1Rxxsl4rMVdf2HGf0IdVhyG3UFvHF00cB8lkwi3/Gi3OtXrv0b8
X-Gm-Gg: ASbGncvGjBLeyp3ZJ7Qr872eygqzMd+VfMSs5q8W7CfFbEpIjyUXflsfG5XY2Nh9vgC
	eVBy7t/QIVu8ofs0XwlTK6TYHvZ5CWw5DSLY8Ehz3CRMEhVSienrdZ+qJLiHLUrQY/Ieegu2bL/
	0rPFgNEpQtUVKn9QXWqJDSqAmROv3zgQbk6kNJaIav5uPLEHItAORulVY42Fp1Kkr8W8FBDqVGu
	AQ3dmw+GXvvpZzkpX4w7gVlcMR1rwZBYYF5y9zUOvA8+Mwb7MrqJbhdiBPruKMx4vt9Y62MKEi6
	sPKpG8aXHdR0KKilDvbvW0gNj5SQZrc72Wrtmi95OZG9h9afFB/GoOOl6V7gBGJtWRSUDngHIp5
	RuA1qsJPYo/oNd/bGcOLiFYsRVcHzO5utp/xiHk7nMNn3OTr+4g==
X-Google-Smtp-Source: AGHT+IFzf2y2dTKcBjS6E2oJ2xTZkx9ZxQcibrJ77ksO9WMV5VSjGmvU7qZdb6Pl6Eq0ads0tr0HAA==
X-Received: by 2002:a17:907:1c15:b0:b46:7c17:ebf5 with SMTP id a640c23a62f3a-b50ace225bbmr1316568866b.62.1760103962104;
        Fri, 10 Oct 2025 06:46:02 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d9525541sm232830666b.80.2025.10.10.06.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 06:46:01 -0700 (PDT)
Message-ID: <6103f175-752d-4f5f-a940-b5569536642c@gmail.com>
Date: Fri, 10 Oct 2025 15:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH v2] libeigen: upgrade 3.4.0 -> 3.4.1
To: peron.clem@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251010114954.51315-2-peron.clem@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251010114954.51315-2-peron.clem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 13:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120478

Thank you for the new version, looks okay to me.

On 10/10/25 13:49, Clément Péron via lists.openembedded.org wrote:
> - Move Eigen BLAS, LAPACK as packageconfig as they requires Fortran compiler
> - Disable building TESTING
> - Remove patch that has been merged
>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>
> Changes this v1
>
> Move BLAS, LAPACK as packageconfig as they requires Fortran compiler
>
> I didn't test to enable them
>
> Regards
>
>
>  ...ult-eigen_packet_wrapper-constructor.patch | 72 -------------------
>  ...001-Remove-LGPL-Code-and-references.patch} | 28 +++-----
>  .../{libeigen_3.4.0.bb => libeigen_3.4.1.bb}  | 14 +++-
>  3 files changed, 20 insertions(+), 94 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch
>  rename meta-oe/recipes-support/libeigen/libeigen/{0002-Remove-LGPL-Code-and-references.patch => 0001-Remove-LGPL-Code-and-references.patch} (98%)
>  rename meta-oe/recipes-support/libeigen/{libeigen_3.4.0.bb => libeigen_3.4.1.bb} (78%)
>
> diff --git a/meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch b/meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch
> deleted file mode 100644
> index 84b5a4da9f..0000000000
> --- a/meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -From cb507309937958c632147de87e8f1231d6698847 Mon Sep 17 00:00:00 2001
> -From: Antonio Sanchez <cantonios@google.com>
> -Date: Tue, 14 Sep 2021 10:57:22 -0700
> -Subject: [PATCH] Default eigen_packet_wrapper constructor.
> -
> -This makes it trivial, allowing use of `memcpy`.
> -
> -Fixes #2326
> -
> -Upstream-Status: Backport [https://gitlab.com/libeigen/eigen/-/merge_requests/645/diffs?commit_id=cb507309937958c632147de87e8f1231d6698847]
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> -* fixes build failures for arm targets with NEON enabled (e.g. -mfpu=neon-vfpv4)
> -  for recipes with -Werror enabled and gcc-11, e.g. fuse-core, robot-localization,
> -  prbt-ikfast-manipulator-plugin, rm-chassis-controllers in meta-ros1-noetic:
> -
> -In file included from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/Core:214,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/macros.h:63,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/loss.h:37,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/constraint.h:37,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/src/constraint.cpp:34:
> -/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h: In function 'Packet Eigen::internal::pload(const typename Eigen::internal::unpacket_traits<T>::type*) [with Packet = Eigen::internal::eigen_packet_wrapper<int, 2>; typename Eigen::internal::unpacket_traits<T>::type = signed char]':
> -/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h:1671:9: error: 'void* memcpy(void*, const void*, size_t)' copying an object of non-trivial type 'Eigen::internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} from an array of 'const int8_t' {aka 'const signed char'} [-Werror=class-memaccess]
> - 1671 |   memcpy(&res, from, sizeof(Packet4c));
> -      |   ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -In file included from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/Core:172,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/macros.h:63,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/loss.h:37,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/constraint.h:37,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/src/constraint.cpp:34:
> -/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/GenericPacketMath.h:159:8: note: 'Eigen::internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} declared here
> -  159 | struct eigen_packet_wrapper
> -      |        ^~~~~~~~~~~~~~~~~~~~
> -In file included from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/Core:214,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/macros.h:63,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/loss.h:37,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/constraint.h:37,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/src/constraint.cpp:34:
> -/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h: In function 'Packet Eigen::internal::ploadu(const typename Eigen::internal::unpacket_traits<T>::type*) [with Packet = Eigen::internal::eigen_packet_wrapper<int, 2>; typename Eigen::internal::unpacket_traits<T>::type = signed char]':
> -/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h:1716:9: error: 'void* memcpy(void*, const void*, size_t)' copying an object of non-trivial type 'Eigen::internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} from an array of 'const int8_t' {aka 'const signed char'} [-Werror=class-memaccess]
> - 1716 |   memcpy(&res, from, sizeof(Packet4c));
> -      |   ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -In file included from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/Core:172,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/macros.h:63,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/loss.h:37,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/constraint.h:37,
> -                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/src/constraint.cpp:34:
> -/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/GenericPacketMath.h:159:8: note: 'Eigen::internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} declared here
> -  159 | struct eigen_packet_wrapper
> -      |        ^~~~~~~~~~~~~~~~~~~~
> -cc1plus: all warnings being treated as errors
> -
> ----
> - Eigen/src/Core/GenericPacketMath.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Eigen/src/Core/GenericPacketMath.h b/Eigen/src/Core/GenericPacketMath.h
> -index 8f8f64f15..72234288e 100644
> ---- a/Eigen/src/Core/GenericPacketMath.h
> -+++ b/Eigen/src/Core/GenericPacketMath.h
> -@@ -162,7 +162,7 @@ struct eigen_packet_wrapper
> - {
> -   EIGEN_ALWAYS_INLINE operator T&() { return m_val; }
> -   EIGEN_ALWAYS_INLINE operator const T&() const { return m_val; }
> --  EIGEN_ALWAYS_INLINE eigen_packet_wrapper() {}
> -+  EIGEN_ALWAYS_INLINE eigen_packet_wrapper() = default;
> -   EIGEN_ALWAYS_INLINE eigen_packet_wrapper(const T &v) : m_val(v) {}
> -   EIGEN_ALWAYS_INLINE eigen_packet_wrapper& operator=(const T &v) {
> -     m_val = v;
> --- 
> -2.17.1
> -
> diff --git a/meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LGPL-Code-and-references.patch b/meta-oe/recipes-support/libeigen/libeigen/0001-Remove-LGPL-Code-and-references.patch
> similarity index 98%
> rename from meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LGPL-Code-and-references.patch
> rename to meta-oe/recipes-support/libeigen/libeigen/0001-Remove-LGPL-Code-and-references.patch
> index 2d19bc23c8..697f3dfa82 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LGPL-Code-and-references.patch
> +++ b/meta-oe/recipes-support/libeigen/libeigen/0001-Remove-LGPL-Code-and-references.patch
> @@ -1,4 +1,4 @@
> -From e63a6950dbebf4dd95e5c74c423c06fd65df5182 Mon Sep 17 00:00:00 2001
> +From 5e7b53a3268e7cdc81e358825a8c84f06289866c Mon Sep 17 00:00:00 2001
>  From: =?UTF-8?q?Antonio=20S=C3=A1nchez?= <cantonios@google.com>
>  Date: Wed, 8 Feb 2023 01:25:06 +0000
>  Subject: [PATCH] Remove LGPL Code and references.
> @@ -12,12 +12,11 @@ Upstream-Status: Backport [https://gitlab.com/libeigen/eigen/-/commit/e256ad1823
>   bench/tensors/eigen_sycl_bench.sh             |   1 -
>   bench/tensors/eigen_sycl_bench_contract.sh    |   2 +-
>   doc/PreprocessorDirectives.dox                |   3 -
> - test/CMakeLists.txt                           |   1 -
>   test/mpl2only.cpp                             |  24 -
>   unsupported/Eigen/IterativeSolvers            |   6 -
>   .../IterativeSolvers/ConstrainedConjGrad.h    | 187 -------
>   .../IterativeSolvers/IterationController.h    | 154 ------
> - 12 files changed, 4 insertions(+), 898 deletions(-)
> + 11 files changed, 4 insertions(+), 897 deletions(-)
>   delete mode 100644 COPYING.LGPL
>   delete mode 100644 Eigen/src/Core/util/NonMPL2.h
>   delete mode 100644 test/mpl2only.cpp
> @@ -567,7 +566,7 @@ index 1af67cf18..000000000
>  -#error Including non-MPL2 code in EIGEN_MPL2_ONLY mode
>  -#endif
>  diff --git a/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h b/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h
> -index 7803fd817..1a5d7faeb 100644
> +index 5e632c4e2..8b6077601 100644
>  --- a/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h
>  +++ b/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h
>  @@ -24,8 +24,7 @@ namespace Eigen {
> @@ -606,7 +605,7 @@ index 73fd6c4a0..3ab0138a1 100644
>   ./tensor_contract_sycl_bench
>   
>  diff --git a/doc/PreprocessorDirectives.dox b/doc/PreprocessorDirectives.dox
> -index 0f545b086..b7d59ccbc 100644
> +index eda0d1961..2b5cb1b92 100644
>  --- a/doc/PreprocessorDirectives.dox
>  +++ b/doc/PreprocessorDirectives.dox
>  @@ -92,9 +92,6 @@ run time. However, these assertions do cost time and can thus be turned off.
> @@ -619,18 +618,6 @@ index 0f545b086..b7d59ccbc 100644
>   
>   \section TopicPreprocessorDirectivesPerformance Alignment, vectorization and performance tweaking
>   
> -diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
> -index 5136f82aa..9f557743a 100644
> ---- a/test/CMakeLists.txt
> -+++ b/test/CMakeLists.txt
> -@@ -277,7 +277,6 @@ ei_add_test(special_numbers)
> - ei_add_test(rvalue_types)
> - ei_add_test(dense_storage)
> - ei_add_test(ctorleak)
> --ei_add_test(mpl2only)
> - ei_add_test(inplace_decomposition)
> - ei_add_test(half_float)
> - ei_add_test(bfloat16_float)
>  diff --git a/test/mpl2only.cpp b/test/mpl2only.cpp
>  deleted file mode 100644
>  index 296350d08..000000000
> @@ -662,11 +649,11 @@ index 296350d08..000000000
>  -  return 0;
>  -}
>  diff --git a/unsupported/Eigen/IterativeSolvers b/unsupported/Eigen/IterativeSolvers
> -index a3f58d676..f045fb607 100644
> +index b53f10937..3ac64e9f8 100644
>  --- a/unsupported/Eigen/IterativeSolvers
>  +++ b/unsupported/Eigen/IterativeSolvers
>  @@ -19,7 +19,6 @@
> -   * \defgroup IterativeLinearSolvers_Module Iterative solvers module
> +   * \defgroup IterativeLinearSolvers_Module IterativeLinearSolvers module
>     * This module aims to provide various iterative linear and non linear solver algorithms.
>     * It currently provides:
>  -  *  - a constrained conjugate gradient
> @@ -1038,3 +1025,6 @@ index a116e09e2..000000000
>  -} // end namespace Eigen
>  -
>  -#endif // EIGEN_ITERATION_CONTROLLER_H
> +-- 
> +2.48.1
> +
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
> similarity index 78%
> rename from meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> rename to meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
> index f5f874941a..c5421e4621 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
> @@ -13,15 +13,23 @@ LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad \
>  "
>  
>  SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;branch=3.4 \
> -    file://0001-Default-eigen_packet_wrapper-constructor.patch \
> -    file://0002-Remove-LGPL-Code-and-references.patch \
> +    file://0001-Remove-LGPL-Code-and-references.patch \
>  "
>  
> -SRCREV = "3147391d946bb4b6c68edd901f2add6ac1f31f8c"
> +SRCREV = "d71c30c47858effcbd39967097a2d99ee48db464"
>  
>  
>  inherit cmake
>  
> +PACKAGECONFIG ??= ""
> +
> +PACKAGECONFIG[blas] = "-DEIGEN_BUILD_BLAS=ON,-DEIGEN_BUILD_BLAS=OFF,libgfortran"
> +PACKAGECONFIG[lapack] = "-DEIGEN_BUILD_LAPACK=ON,-DEIGEN_BUILD_LAPACK=OFF,libgfortran"
> +
> +EXTRA_OECMAKE += " \
> +    -DEIGEN_BUILD_TESTING=OFF \
> +"
> +
>  FILES:${PN}-dev += "${datadir}/eigen3/cmake"
>  
>  # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120477): https://lists.openembedded.org/g/openembedded-devel/message/120477
> Mute This Topic: https://lists.openembedded.org/mt/115687355/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


