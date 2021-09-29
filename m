Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6655EC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 15:32:08 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.10628.1632929526892362860
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 08:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n8NZuEwV;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id g8so10263426edt.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xnJbIdZzJ3isSRckGhCQMTXW2CvxqXol7tdP+dfCwTc=;
        b=n8NZuEwVyyKcNh8c43dbUyYSKoMjDbXb6eBQ2Kn6CC1A14t4iz3PG36YEmE/wzoY6g
         5hupa/1NfULAlPftM6rd09addKTHxqV18cmfoGb5xBPWsTTP9/8elvCFMhJ/iqbxDn7Q
         VTvGJemFjkRMjKX3Y/m/jIkcV62oCpRMyr56TcLz1jj8bOzV8eCfKJU4dwDL9PEBJIE4
         RK9jp4WHNJccrwEroTaXcgloYSsPhSyIS5m1NMTD+igtflk3tVi2yES7WP1BlPRqvpt1
         y3jusH2bUpUb2PebFWQWWmfCNx2tqiVZBACTPigDl+/LT6NsFZr4Spdx9jyx8KaCpkZn
         hzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xnJbIdZzJ3isSRckGhCQMTXW2CvxqXol7tdP+dfCwTc=;
        b=TZB2B3/7dyAmcGKaFyiwHk29/dNdmMXPQdWnSwYA07O1ibcn7HMVSYK2t5nmvM8yNE
         kgTXfqpCisacGvVwao1E3hIIMxauDZliE8sOOLba9esWoxz3hiTaZSxIn+r9V0gbyBMJ
         xmor0iu5CgW/I/vHiWCAE0ZIBMbC1YKpcZvlhi0b9jZUd6ZWLTH11tCHS3qE+DGdC26/
         RKOmVutYV1hBR5PUlwwnWOaMaGgjPKAr6/hPw2EWDvX82dbgV+8H5TxY3J8RPQ83plJO
         HfgiN2E9V1ORdRYzUJ2cw/yilYVQaEnYyxxA/hhLYFvJhm7Yyyzw9z95yTNzJboS71m5
         ChvQ==
X-Gm-Message-State: AOAM530sYWBbyfd/wJwm90u6b6R18ATzsWTCJYaZ1wdNWu2shHM6a8tc
	BaQ8i826w70pq7Jl2Bo0vn6n6L4pBdY=
X-Google-Smtp-Source: 
 ABdhPJxhyYWzr//ghGj46OkIHDyYRlBUPZYwk2DhGQDG39lB/ZTNUO6M6NmBFynGUAQriInyvv/V6Q==
X-Received: by 2002:a50:d885:: with SMTP id p5mr561594edj.255.1632929474118;
        Wed, 29 Sep 2021 08:31:14 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ca4sm132057ejb.1.2021.09.29.08.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 08:31:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] libeigen: backport fix for -Werror=class-memaccess
 issues when NEON is enabled
Date: Wed, 29 Sep 2021 17:31:11 +0200
Message-Id: <20210929153111.498522-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Sep 2021 15:32:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93174

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ult-eigen_packet_wrapper-constructor.patch | 72 +++++++++++++++++++
 .../libeigen/libeigen_3.4.0.bb                |  4 +-
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch

diff --git a/meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch b/meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch
new file mode 100644
index 0000000000..84b5a4da9f
--- /dev/null
+++ b/meta-oe/recipes-support/libeigen/libeigen/0001-Default-eigen_packet_wrapper-constructor.patch
@@ -0,0 +1,72 @@
+From cb507309937958c632147de87e8f1231d6698847 Mon Sep 17 00:00:00 2001
+From: Antonio Sanchez <cantonios@google.com>
+Date: Tue, 14 Sep 2021 10:57:22 -0700
+Subject: [PATCH] Default eigen_packet_wrapper constructor.
+
+This makes it trivial, allowing use of `memcpy`.
+
+Fixes #2326
+
+Upstream-Status: Backport [https://gitlab.com/libeigen/eigen/-/merge_requests/645/diffs?commit_id=cb507309937958c632147de87e8f1231d6698847]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+* fixes build failures for arm targets with NEON enabled (e.g. -mfpu=neon-vfpv4)
+  for recipes with -Werror enabled and gcc-11, e.g. fuse-core, robot-localization,
+  prbt-ikfast-manipulator-plugin, rm-chassis-controllers in meta-ros1-noetic:
+
+In file included from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/Core:214,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/macros.h:63,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/loss.h:37,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/constraint.h:37,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/src/constraint.cpp:34:
+/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h: In function 'Packet Eigen::internal::pload(const typename Eigen::internal::unpacket_traits<T>::type*) [with Packet = Eigen::internal::eigen_packet_wrapper<int, 2>; typename Eigen::internal::unpacket_traits<T>::type = signed char]':
+/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h:1671:9: error: 'void* memcpy(void*, const void*, size_t)' copying an object of non-trivial type 'Eigen::internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} from an array of 'const int8_t' {aka 'const signed char'} [-Werror=class-memaccess]
+ 1671 |   memcpy(&res, from, sizeof(Packet4c));
+      |   ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+In file included from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/Core:172,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/macros.h:63,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/loss.h:37,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/constraint.h:37,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/src/constraint.cpp:34:
+/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/GenericPacketMath.h:159:8: note: 'Eigen::internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} declared here
+  159 | struct eigen_packet_wrapper
+      |        ^~~~~~~~~~~~~~~~~~~~
+In file included from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/Core:214,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/macros.h:63,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/loss.h:37,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/constraint.h:37,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/src/constraint.cpp:34:
+/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h: In function 'Packet Eigen::internal::ploadu(const typename Eigen::internal::unpacket_traits<T>::type*) [with Packet = Eigen::internal::eigen_packet_wrapper<int, 2>; typename Eigen::internal::unpacket_traits<T>::type = signed char]':
+/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/arch/NEON/PacketMath.h:1716:9: error: 'void* memcpy(void*, const void*, size_t)' copying an object of non-trivial type 'Eigen::internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} from an array of 'const int8_t' {aka 'const signed char'} [-Werror=class-memaccess]
+ 1716 |   memcpy(&res, from, sizeof(Packet4c));
+      |   ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+In file included from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/Core:172,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/macros.h:63,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/loss.h:37,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/include/fuse_core/constraint.h:37,
+                 from /jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/git/src/constraint.cpp:34:
+/jenkins/mjansa/build/ros/webos-noetic-honister/tmp-glibc/work/raspberrypi4-webos-linux-gnueabi/fuse-core/0.4.2-1-r0/recipe-sysroot/usr/include/eigen3/Eigen/src/Core/GenericPacketMath.h:159:8: note: 'Eigen::internal::Packet4c' {aka 'struct Eigen::internal::eigen_packet_wrapper<int, 2>'} declared here
+  159 | struct eigen_packet_wrapper
+      |        ^~~~~~~~~~~~~~~~~~~~
+cc1plus: all warnings being treated as errors
+
+---
+ Eigen/src/Core/GenericPacketMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Eigen/src/Core/GenericPacketMath.h b/Eigen/src/Core/GenericPacketMath.h
+index 8f8f64f15..72234288e 100644
+--- a/Eigen/src/Core/GenericPacketMath.h
++++ b/Eigen/src/Core/GenericPacketMath.h
+@@ -162,7 +162,7 @@ struct eigen_packet_wrapper
+ {
+   EIGEN_ALWAYS_INLINE operator T&() { return m_val; }
+   EIGEN_ALWAYS_INLINE operator const T&() const { return m_val; }
+-  EIGEN_ALWAYS_INLINE eigen_packet_wrapper() {}
++  EIGEN_ALWAYS_INLINE eigen_packet_wrapper() = default;
+   EIGEN_ALWAYS_INLINE eigen_packet_wrapper(const T &v) : m_val(v) {}
+   EIGEN_ALWAYS_INLINE eigen_packet_wrapper& operator=(const T &v) {
+     m_val = v;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
index 54b6f74d8c..9682f7a8e2 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad \
                     file://COPYING.MINPACK;md5=71d91b0f75ce79a75d3108a72bef8116 \
 "
 
-SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;nobranch=1"
+SRC_URI = "git://gitlab.com/libeigen/eigen.git;protocol=http;branch=3.4 \
+    file://0001-Default-eigen_packet_wrapper-constructor.patch \
+"
 
 SRCREV = "3147391d946bb4b6c68edd901f2add6ac1f31f8c"
 
-- 
2.32.0


