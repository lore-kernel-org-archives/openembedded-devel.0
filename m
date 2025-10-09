Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B52CCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 12:15:17 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.10841.1760012116373297692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 05:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mj1t9jW3;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso1837159a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 05:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760012115; x=1760616915; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KkBtJdVyC6oJePdHAFf7hd3vaVKiGZJ/Pa0d774eJKg=;
        b=Mj1t9jW3Zz69h57S9gwJ6AWnXapCU6lqXX1coxRAD+B+wDDLqvfqu9V9KFUegav7c3
         3vYzt3yxT3OwNkWEZMl7tc15wZJ8asx5sZKfSvAUmum8uLBhmqTO39x81N5KuWrqITRZ
         4Z+LcoY1EKITIRom8TWlEJ9Aj2J4lGnmue02GnCjz/nE2prxcpfKirzPzMsWgOBNbIGh
         15VOSD71IpqQ6gucB3AwJ7D43VSIRsjWVf5pTQx5UEDnSD+hblgpE7EoIfaLsluFn+m2
         JNMKi/EQyRNwj8m01q/quRzpqxH6oEDxPGocjgDaay8FvNN+B2oMXBLd1bgNZ5yBtBnQ
         dSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760012115; x=1760616915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkBtJdVyC6oJePdHAFf7hd3vaVKiGZJ/Pa0d774eJKg=;
        b=eC7hon+piYfEgrSxBsY4+TuAhu/E9a8kBvQ8MGkFOrRwKpwsvY+q7FZHvTXwBFyncA
         DMzcootzTUEqQN82Scd5Q4RhvnbrKCi4XUc3V7e8IcURB/0Xwr89g/sjcgPdYrFtiUYU
         jNCDyFBylDCIe8cZo7wpJj4n7FvVyrtIS0bAGIOWKgcm9D2lrjyzOCprdCACOWgIVW44
         WabC16qPlS67hKr0WGlI/AXVHbgceMFAisKbOipSMr62l2FhIvAZKqBZZ4ZFVcisDq/P
         YIWXaGHgMq3zHMygGyCUElTmzP+VqGYqd+QdWLWYIGAoA+b/HWpFDLc/hEqmP2CtrRji
         axOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6DJB6BdRSRZAQo3CSuEUvM8XTMVByWKWf+1tD6dk/0VtN0A5fRStgLeYVc2E/axghCw/rJ24g7cAdf2ljXWVTo9Y=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw5Emj69iGDNnei0knYXRvM9n4fnYjPm8lsxcq8/tsbk2P6TBRc
	dH8L9jS63Gg7QnnTomVF8JuR9Wu67rlbv39LjjF41JNME0g5enI2aFgo
X-Gm-Gg: ASbGncuo7rxlHsOTp8OZ2D9cowHLYtxWoskBXT7rPSIWrCcUp8i2xV5AvpOUCNsO+QO
	i4S/PVM7Zr3EsTN2T2nG4JqALb5eFnGKpwnXtxcFe1gbw9mp1V3LQ448MSIqaMNle/BYsGXYiOH
	JHsJAZAjhTdpagKIHELTLZ1iM3JBtDqzS++XuzqcWY3/coJ5KqtCa4jjisRN6REy2gfRKRN26Mw
	6RduRz0ZQNVmWGJUz3HslhWzMjvTKpR3qn2HnVkGLVoQG410ITN99TYnXDOsG5q3u4Qs69MC3I7
	8cASUYrjT8+yNF6+sOXJM9StNpa2p7/E++yZT2n4+4oBtjRGVD5TndfDrHlqApP0yrO9WHyoU90
	DMPURDYcruRQwLrAfp0sXm8SMK6TqhQ0sH8DFBlopRruXg2SKaoCF/kc=
X-Google-Smtp-Source: AGHT+IFSX6FcHMQeGo9Zz7+HbQCpElg20OtgJDdIu1NrsIgmAA6xrv92cD+x8TT5b1bqOPvZ8IV+lA==
X-Received: by 2002:a05:6402:1ed2:b0:639:d9de:3c59 with SMTP id 4fb4d7f45d1cf-639d9de3ddamr5869856a12.5.1760012114355;
        Thu, 09 Oct 2025 05:15:14 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f40f23f2sm2222148a12.38.2025.10.09.05.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 05:15:12 -0700 (PDT)
Message-ID: <3adb1e0e-11ca-46cc-afdb-5a84520737ec@gmail.com>
Date: Thu, 9 Oct 2025 14:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] libeigen: upgrade 3.4.0 -> 3.4.1
To: peron.clem@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251009113247.27517-1-peron.clem@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251009113247.27517-1-peron.clem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 12:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120428

On 10/9/25 13:32, Clément Péron via lists.openembedded.org wrote:
> - Disable building BLAS, LAPACK and TESTING

Why? Could they rather be PACKAGECONFIG options?

> - Remove patch that has been merged
>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  ...ult-eigen_packet_wrapper-constructor.patch | 72 -------------------
>  ...001-Remove-LGPL-Code-and-references.patch} | 28 +++-----
>  .../{libeigen_3.4.0.bb => libeigen_3.4.1.bb}  | 11 ++-
>  3 files changed, 17 insertions(+), 94 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch
>  rename meta-oe/recipes-support/libeigen/libeigen/{0002-Remove-LGPL-Code-and-references.patch => 0001-Remove-LGPL-Code-and-references.patch} (98%)
>  rename meta-oe/recipes-support/libeigen/{libeigen_3.4.0.bb => libeigen_3.4.1.bb} (84%)
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
> similarity index 84%
> rename from meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> rename to meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
> index f5f874941a..520244ec7a 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
> @@ -13,15 +13,20 @@ LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad \
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
> +EXTRA_OECMAKE += " \
> +    -DEIGEN_BUILD_BLAS=OFF \
> +    -DEIGEN_BUILD_LAPACK=OFF \
> +    -DEIGEN_BUILD_TESTING=OFF \
> +"
> +
>  FILES:${PN}-dev += "${datadir}/eigen3/cmake"
>  
>  # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120427): https://lists.openembedded.org/g/openembedded-devel/message/120427
> Mute This Topic: https://lists.openembedded.org/mt/115669722/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


