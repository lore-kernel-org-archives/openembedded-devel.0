Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC7ECCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 11:50:36 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.7342.1760097033378740139
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 04:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iBApuUuS;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso13108695e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760097031; x=1760701831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1x2eBe8y3I6lcyGCVyVpp2DQrRzetZXwt+V9oiebJSE=;
        b=iBApuUuSaaBD2ljX840cZpPlockND9MSTSnpb8//bY9agdR4uTwUfAtXC2VNrDg7o9
         aA1CYenp/AIJ1/QwVu4lFIaDs3SlaeEr6mXTWzpltmZSthOkByNqbeYrpZvsVvXYCgAy
         kXp5+ty5+udNtl5motcsa7ZPa7UrmlUHdIkhtx4Uu3lCHnqkSSdEPr6EcdvaDKQHeX3o
         lHn+C/y8qq4SXGXVNMoVMtIS7ufw4IE7Isge+bCdl2kV2oabNQjKvbAegZVX+Ouf+Uqs
         3im59w2IQkuk9BTOi2+/WTnmLlPUvYi9HN5Nzp9VArjcHP0vZSjjkFcl0L9JiW+Z27Av
         7w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760097031; x=1760701831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1x2eBe8y3I6lcyGCVyVpp2DQrRzetZXwt+V9oiebJSE=;
        b=lp2QjwQPPwv4xPDAUnm9WyuErF2ZnviVBhkavwXGWFm/cXhghDmwk7Vz5kl5h1YpIG
         9MB+i1hZMXaoewOyDwL3MaSRNABq4duEogzB6aCJtABlQEKRaigb9xMTKph94EmNXuIM
         s3eSDBS7095ma83qmkVfU358eUaN3GJ+CalrRiL7pvEIHAQDTKXnNLR6sTjLrfs6k3bG
         KE2V1clkWZee6uzVUb9GfJ/dgaPia79oJPdigX7dTTlBqpDRzfEfQeYHM2Y5fMXREgAP
         lWY2KCy1LQAHRmsC2N/8H6Poxzo691zMBeu43DJYBPCZ12l3FAndrxtYPMjGwORDqPbK
         g/RA==
X-Gm-Message-State: AOJu0YxTiQ6EC+CfTPSDzPEKSf9zuT+lIolvLD5vMauQHuo7VGq363TR
	CLtR7sVKapCH9pkvZnnScUYt6s/1iYYAujSSBk5Tb8cIy9PMi6yR9Y7IU5TXVb7y
X-Gm-Gg: ASbGncvxt5Ta08nE7j/tT/DkjyvnwiHq2lpTVzeOGvl4K1tXmCGNigV8rTmP5JFDR0b
	5sg2GGyNHgmrx4ypuJAfvNUR5O5FBvpskL+0xAThXME0xmW7LcxKjcRIWEmIKzn1X7ezEtYxH91
	xEf5JKBsSH2Xm5rffTIdibYTDUECOULKQGtfw3wGDEZ7KaeZ592AUT8xHLNOxihlpPxUn3RzSZx
	aSLTgfX4mPCwfS7lfh8gO941C0ws49NbhR4lkopVizjmCHHHIu0VHbiU0ZLhijjy8uw9yKx/foa
	TBA6kkt9NFCbSKng1PaA0/aNSmTN7raSmcHe4QqRUbPjI9JeQMvyMRDokIhytp+zbXOZ/MZFiQ1
	D2IvDRtfOLBK55ArBcR7A3zJB1QWsxAfS1UdEb9AGDnlCrJJ0RNfRTroR2l9Wb4Nixo8k5US7TQ
	fskrjzfciqg4LoWINiz+OaBJGBQMT7AB4RcICzuRbR6ts=
X-Google-Smtp-Source: AGHT+IHJTzREgELRi/i02LkC5fj7QaOjR/1Km6kNyNgEDwoC+lqr61YrO5zV8YYYgwvqywpGFItCfQ==
X-Received: by 2002:a05:600c:444d:b0:46e:6d12:ee4a with SMTP id 5b1f17b1804b1-46fa9af35bbmr74086335e9.20.1760097030626;
        Fri, 10 Oct 2025 04:50:30 -0700 (PDT)
Received: from localhost.localdomain (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489194dsm43499925e9.12.2025.10.10.04.50.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 10 Oct 2025 04:50:29 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2] libeigen: upgrade 3.4.0 -> 3.4.1
Date: Fri, 10 Oct 2025 13:49:55 +0200
Message-ID: <20251010114954.51315-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 11:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120477

- Move Eigen BLAS, LAPACK as packageconfig as they requires Fortran compiler
- Disable building TESTING
- Remove patch that has been merged

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---

Changes this v1

Move BLAS, LAPACK as packageconfig as they requires Fortran compiler

I didn't test to enable them

Regards


 ...ult-eigen_packet_wrapper-constructor.patch | 72 -------------------
 ...001-Remove-LGPL-Code-and-references.patch} | 28 +++-----
 .../{libeigen_3.4.0.bb => libeigen_3.4.1.bb}  | 14 +++-
 3 files changed, 20 insertions(+), 94 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch
 rename meta-oe/recipes-support/libeigen/libeigen/{0002-Remove-LGPL-Code-and-references.patch => 0001-Remove-LGPL-Code-and-references.patch} (98%)
 rename meta-oe/recipes-support/libeigen/{libeigen_3.4.0.bb => libeigen_3.4.1.bb} (78%)

diff --git a/meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch b/meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch
deleted file mode 100644
index 84b5a4da9f..0000000000
--- a/meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From cb507309937958c632147de87e8f1231d6698847 Mon Sep 17 00:00:00 2001
-From: Antonio Sanchez <cantonios@google.com>
-Date: Tue, 14 Sep 2021 10:57:22 -0700
-Subject: [PATCH] Default eigen_packet_wrapper constructor.
-
-This makes it trivial, allowing use of `memcpy`.
-
-Fixes #2326
-
-Upstream-Status: Backport [https://gitlab.com/libeigen/eigen/-/merge_requests/645/diffs?commit_id=cb507309937958c632147de87e8f1231d6698847]
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-* fixes build failures for arm targets with NEON enabled (e.g. -mfpu=neon-vfpv4)
-  for recipes with -Werror enabled and gcc-11, e.g. fuse-core, robot-localization,
-  prbt-ikfast-manipulator-plugin, rm-chassis-controllers in meta-ros1-noetic:
-
-In file included from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/Core:214,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/macros.h:63,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/loss.h:37,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/constraint.h:37,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/src/constraint.cpp:34:
-/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h: In function 'Packet Eigen::internal::pload(const typename Eigen::internal::unpacket_traits<T>::type*) [with Packet = Eigen::internal::eigen_packet_wrapper<int, 2>; typename Eigen::internal::unpacket_traits<T>::type = signed char]':
-/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h:1671:9: error: 'void* memcpy(void*, const void*, size_t)' copying an object of non-trivial type 'Eigen::internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} from an array of 'const int8_t' {aka 'const signed char'} [-Werror=class-memaccess]
- 1671 |   memcpy(&res, from, sizeof(Packet4c));
-      |   ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-In file included from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/Core:172,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/macros.h:63,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/loss.h:37,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/constraint.h:37,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/src/constraint.cpp:34:
-/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/GenericPacketMath.h:159:8: note: 'Eigen::internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} declared here
-  159 | struct eigen_packet_wrapper
-      |        ^~~~~~~~~~~~~~~~~~~~
-In file included from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/Core:214,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/macros.h:63,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/loss.h:37,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/constraint.h:37,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/src/constraint.cpp:34:
-/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h: In function 'Packet Eigen::internal::ploadu(const typename Eigen::internal::unpacket_traits<T>::type*) [with Packet = Eigen::internal::eigen_packet_wrapper<int, 2>; typename Eigen::internal::unpacket_traits<T>::type = signed char]':
-/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h:1716:9: error: 'void* memcpy(void*, const void*, size_t)' copying an object of non-trivial type 'Eigen::internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} from an array of 'const int8_t' {aka 'const signed char'} [-Werror=class-memaccess]
- 1716 |   memcpy(&res, from, sizeof(Packet4c));
-      |   ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-In file included from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/Core:172,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/macros.h:63,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/loss.h:37,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/constraint.h:37,
-                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/src/constraint.cpp:34:
-/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/GenericPacketMath.h:159:8: note: 'Eigen::internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} declared here
-  159 | struct eigen_packet_wrapper
-      |        ^~~~~~~~~~~~~~~~~~~~
-cc1plus: all warnings being treated as errors
-
----
- Eigen/src/Core/GenericPacketMath.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Eigen/src/Core/GenericPacketMath.h b/Eigen/src/Core/GenericPacketMath.h
-index 8f8f64f15..72234288e 100644
---- a/Eigen/src/Core/GenericPacketMath.h
-+++ b/Eigen/src/Core/GenericPacketMath.h
-@@ -162,7 +162,7 @@ struct eigen_packet_wrapper
- {
-   EIGEN_ALWAYS_INLINE operator T&() { return m_val; }
-   EIGEN_ALWAYS_INLINE operator const T&() const { return m_val; }
--  EIGEN_ALWAYS_INLINE eigen_packet_wrapper() {}
-+  EIGEN_ALWAYS_INLINE eigen_packet_wrapper() = default;
-   EIGEN_ALWAYS_INLINE eigen_packet_wrapper(const T &v) : m_val(v) {}
-   EIGEN_ALWAYS_INLINE eigen_packet_wrapper& operator=(const T &v) {
-     m_val = v;
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LGPL-Code-and-references.patch b/meta-oe/recipes-support/libeigen/libeigen/0001-Remove-LGPL-Code-and-references.patch
similarity index 98%
rename from meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LGPL-Code-and-references.patch
rename to meta-oe/recipes-support/libeigen/libeigen/0001-Remove-LGPL-Code-and-references.patch
index 2d19bc23c8..697f3dfa82 100644
--- a/meta-oe/recipes-support/libeigen/libeigen/0002-Remove-LGPL-Code-and-references.patch
+++ b/meta-oe/recipes-support/libeigen/libeigen/0001-Remove-LGPL-Code-and-references.patch
@@ -1,4 +1,4 @@
-From e63a6950dbebf4dd95e5c74c423c06fd65df5182 Mon Sep 17 00:00:00 2001
+From 5e7b53a3268e7cdc81e358825a8c84f06289866c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Antonio=20S=C3=A1nchez?= <cantonios@google.com>
 Date: Wed, 8 Feb 2023 01:25:06 +0000
 Subject: [PATCH] Remove LGPL Code and references.
@@ -12,12 +12,11 @@ Upstream-Status: Backport [https://gitlab.com/libeigen/eigen/-/commit/e256ad1823
  bench/tensors/eigen_sycl_bench.sh             |   1 -
  bench/tensors/eigen_sycl_bench_contract.sh    |   2 +-
  doc/PreprocessorDirectives.dox                |   3 -
- test/CMakeLists.txt                           |   1 -
  test/mpl2only.cpp                             |  24 -
  unsupported/Eigen/IterativeSolvers            |   6 -
  .../IterativeSolvers/ConstrainedConjGrad.h    | 187 -------
  .../IterativeSolvers/IterationController.h    | 154 ------
- 12 files changed, 4 insertions(+), 898 deletions(-)
+ 11 files changed, 4 insertions(+), 897 deletions(-)
  delete mode 100644 COPYING.LGPL
  delete mode 100644 Eigen/src/Core/util/NonMPL2.h
  delete mode 100644 test/mpl2only.cpp
@@ -567,7 +566,7 @@ index 1af67cf18..000000000
 -#error Including non-MPL2 code in EIGEN_MPL2_ONLY mode
 -#endif
 diff --git a/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h b/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h
-index 7803fd817..1a5d7faeb 100644
+index 5e632c4e2..8b6077601 100644
 --- a/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h
 +++ b/Eigen/src/IterativeLinearSolvers/IncompleteCholesky.h
 @@ -24,8 +24,7 @@ namespace Eigen {
@@ -606,7 +605,7 @@ index 73fd6c4a0..3ab0138a1 100644
  ./tensor_contract_sycl_bench
  
 diff --git a/doc/PreprocessorDirectives.dox b/doc/PreprocessorDirectives.dox
-index 0f545b086..b7d59ccbc 100644
+index eda0d1961..2b5cb1b92 100644
 --- a/doc/PreprocessorDirectives.dox
 +++ b/doc/PreprocessorDirectives.dox
 @@ -92,9 +92,6 @@ run time. However, these assertions do cost time and can thus be turned off.
@@ -619,18 +618,6 @@ index 0f545b086..b7d59ccbc 100644
  
  \section TopicPreprocessorDirectivesPerformance Alignment, vectorization and performance tweaking
  
-diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
-index 5136f82aa..9f557743a 100644
---- a/test/CMakeLists.txt
-+++ b/test/CMakeLists.txt
-@@ -277,7 +277,6 @@ ei_add_test(special_numbers)
- ei_add_test(rvalue_types)
- ei_add_test(dense_storage)
- ei_add_test(ctorleak)
--ei_add_test(mpl2only)
- ei_add_test(inplace_decomposition)
- ei_add_test(half_float)
- ei_add_test(bfloat16_float)
 diff --git a/test/mpl2only.cpp b/test/mpl2only.cpp
 deleted file mode 100644
 index 296350d08..000000000
@@ -662,11 +649,11 @@ index 296350d08..000000000
 -  return 0;
 -}
 diff --git a/unsupported/Eigen/IterativeSolvers b/unsupported/Eigen/IterativeSolvers
-index a3f58d676..f045fb607 100644
+index b53f10937..3ac64e9f8 100644
 --- a/unsupported/Eigen/IterativeSolvers
 +++ b/unsupported/Eigen/IterativeSolvers
 @@ -19,7 +19,6 @@
-   * \defgroup IterativeLinearSolvers_Module Iterative solvers module
+   * \defgroup IterativeLinearSolvers_Module IterativeLinearSolvers module
    * This module aims to provide various iterative linear and non linear solver algorithms.
    * It currently provides:
 -  *  - a constrained conjugate gradient
@@ -1038,3 +1025,6 @@ index a116e09e2..000000000
 -} // end namespace Eigen
 -
 -#endif // EIGEN_ITERATION_CONTROLLER_H
+-- 
+2.48.1
+
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
similarity index 78%
rename from meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
rename to meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
index f5f874941a..c5421e4621 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.1.bb
@@ -13,15 +13,23 @@ LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad \
 "
 
 SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;branch=3.4 \
-    file://0001-Default-eigen_packet_wrapper-constructor.patch \
-    file://0002-Remove-LGPL-Code-and-references.patch \
+    file://0001-Remove-LGPL-Code-and-references.patch \
 "
 
-SRCREV = "3147391d946bb4b6c68edd901f2add6ac1f31f8c"
+SRCREV = "d71c30c47858effcbd39967097a2d99ee48db464"
 
 
 inherit cmake
 
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[blas] = "-DEIGEN_BUILD_BLAS=ON,-DEIGEN_BUILD_BLAS=OFF,libgfortran"
+PACKAGECONFIG[lapack] = "-DEIGEN_BUILD_LAPACK=ON,-DEIGEN_BUILD_LAPACK=OFF,libgfortran"
+
+EXTRA_OECMAKE += " \
+    -DEIGEN_BUILD_TESTING=OFF \
+"
+
 FILES:${PN}-dev += "${datadir}/eigen3/cmake"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-- 
2.48.1


