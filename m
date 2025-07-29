Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66201C87FCA
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 16:43:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.12972.1753807415546824630
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Jul 2025 09:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KPD98Yrz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8QWux031254
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 16:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KT+GtEjYu+qXM0IeezpL4m/5JPXGPaAO/2N
	ijgEzlA4=; b=KPD98YrzCQjqPu05zYJ5bQrWmABBh0XZpCnqotP3u6yCMJUGkMv
	N6Y52rQqRKzNklSVTMROd5SflFmBwVH59qZLemmc3ZK+17xao8Z17MvfMKw4mRUA
	BypvYyHwRKljRuK3sv/6peSiVago4n7eG3YhIwK9w5RfgnrFSMv6JvVF91VrLCax
	bfVK0iIm9NAfVOP6BrL2nlXElZzWOINPVN56MPi2UpDRxk5kZqgBYOLgQUFXpikR
	ykq4x+clqkYcaBSZPKbb/xlVHlaJuoBBGcSwtfE4S0B3JvFwoyI94bSeTqEF7F0R
	dU5KeuSRoPn1FWLCL3ChCMvdGJ3/Cbg4DrA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xe8b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 16:43:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70741fda996so47212736d6.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 09:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753807413; x=1754412213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KT+GtEjYu+qXM0IeezpL4m/5JPXGPaAO/2NijgEzlA4=;
        b=IIiq7exqzivmD6O9IEcFIdEyAaPwvBMdy0VYjHKF5M9f+BPUIevuzk/19o+l0UNfZ8
         IHABaabAIxt71nKp2Eru4r7mk3+2n4flxn2Hb3QqWAZ8LhbiYnGTlhCFotA2J/cKZvOZ
         DNnIgE+Vuzxdk4WmqYhgEHmpi0eKXX55lcTk7hZt6wnzCfNSQ2qJIP9h/t2Ux7QIJgpA
         X6nqSci4yX96ZTVnKLmntFr9laShALCxOYfzL8kLYf2DsgG+Jxdqt+DgGgCOVjq1mqZ3
         zHKJTQJnsw4vTPaG14mWDdy93qM7caIv4K8nanmzD72ViAeP33T+liyA5/VSXCLclnWc
         qNPw==
X-Gm-Message-State: AOJu0Yw3oT0w3WWKmPVLvU/EvW81+O4udrcqI8RP2aYkI8uBLfggEOmi
	TSBAWrSFltYYXKSV82fe9+7QekLU1WIytkNq9Gmd3fj3ULvMr2MrkJGjziJvVCwzqx6g3DRaoXE
	6SaXfg4bMByudCUQvgZuuXrMtsel3XpMZ4V5F5/sfS1YUBmHbLDwYuhEV0jrLLXXgeiyMKWdl7y
	xqPOu4dbCh7rFQKlFH
X-Gm-Gg: ASbGncveblyxOtvCfsiraDmLOgK1I4C6/BmXzlgAeC4KFPDMhvSxT7zWfkvdzQRMraq
	FKTGi5BiZ0Fv/W5F7uCrU61pLxtFzERFuV9mxRyg01YGmBdzHB+OxxmO65NrgCfY/qTPzjNcXyp
	Fz88UHwmm+SxNBzfukY9bhZJvUbr+kIBTAAe+aJCf1iMYVwNCwbUYrndSg/2/ZxkT5jGJwbur5t
	zWcqTu7FC82LD5/kHMvW1R+viz9bjBDgRItZXkwR/EGus01HOh2CLwruC0qfT+uW/zetJ5uLozc
	lEwawOLSLZWSFvFU2xSCx3tclwtMTjOc1W3YkwYVOYgCi8prWmN0mxK4BxWRqDk8zZOYWUqrNC/
	xjdrKl6TjXr0pbN4iAbhgwG6t4e0hyo7xbyjgzl2hc/pUBqtq6q9u
X-Received: by 2002:ad4:5f4d:0:b0:707:4628:3e72 with SMTP id 6a1803df08f44-707672282camr151416d6.45.1753807412680;
        Tue, 29 Jul 2025 09:43:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjNwfU9g8iPnY284hvSrwWoLUsoqQDAUfnacuqINc0/efyQEImCTVm9SgDupdjHWKqCyZIYg==
X-Received: by 2002:ad4:5f4d:0:b0:707:4628:3e72 with SMTP id 6a1803df08f44-707672282camr150886d6.45.1753807412023;
        Tue, 29 Jul 2025 09:43:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6316db06sm1760917e87.16.2025.07.29.09.43.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 09:43:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/2] opencl-{headers,clhpp}: update to release 2025.07.22
Date: Tue, 29 Jul 2025 19:43:29 +0300
Message-Id: <20250729164330.513440-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEyNyBTYWx0ZWRfX4DNhX3tAR6nq
 TuRl2NX/F1EWBgR/l6j2RrVd7FBqOjo+2BGBHjddxz0rh6XUIGGFxATLaSccw80EQR0eBzttwgY
 79EpceauIVoEGdIkDINQQNT0+DdCxtxLqKVzX2ZM5FahvD30t30ddwbueSyh659ZpPDBUrbFfOj
 w+Unfrvjdezdqx7vfXfZ8Q/HMgCYFLVjbd1jf6DGO87MBj0FXTDIekFIeTF/ByXFeeG/gXKyJ31
 j5x0FcCKNGOEdPxevRNyw0TiesJyrOecw/wrpmEd8o1WG7vMWH/D2Qr5idIZb2NERXQX7cCYjLZ
 Qb34ayxGQDWruq0Mo9IMoOk2hm3TtxGBpjjZx9T5uy8u8m8oy73H66nUa8o/XAAqbxP2txTzVyQ
 LnsHUmLeWayA9IFK2lgah6Oi6XewczvSfhWsO0zYo/3zRTvkDiMCiGCHJFse1vn7Km1hKEfQ
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6888fa36 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Hfoq6aXPAAAA:8
 a=pGLkceISAAAA:8 a=2Kd9PhjsAHlIyVt6UnMA:9 a=iYH6xdkBrDN1Jqds4HTS:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=NrRqPRXH979sAPH7e1uv:22
X-Proofpoint-ORIG-GUID: dJIjfjFdTQR2OI7_6UYa3yykJC6xKQFB
X-Proofpoint-GUID: dJIjfjFdTQR2OI7_6UYa3yykJC6xKQFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290127
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 16:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118760

Synchronize with OpenCL v3.0.19 specification release.

Also patch OpenCL CTS in order to prevent its breakage with the updated
headers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...1-Always-enable-beta-extensions-2330.patch | 32 ++++++++++++++
 ...uffer-supported-queue-properties-265.patch | 42 -------------------
 .../files/0001-Ignore-Compiler-Warnings.patch |  2 +-
 ...24.10.24.bb => opencl-clhpp_2025.07.22.bb} |  2 +-
 .../opencl/opencl-cts_2025.01.22.bb           |  1 +
 ....10.24.bb => opencl-headers_2025.07.22.bb} |  3 +-
 6 files changed, 36 insertions(+), 46 deletions(-)
 create mode 100644 meta-oe/recipes-core/opencl/files/0001-Always-enable-beta-extensions-2330.patch
 delete mode 100644 meta-oe/recipes-core/opencl/files/0001-Command-buffer-supported-queue-properties-265.patch
 rename meta-oe/recipes-core/opencl/{opencl-clhpp_2024.10.24.bb => opencl-clhpp_2025.07.22.bb} (91%)
 rename meta-oe/recipes-core/opencl/{opencl-headers_2024.10.24.bb => opencl-headers_2025.07.22.bb} (76%)

diff --git a/meta-oe/recipes-core/opencl/files/0001-Always-enable-beta-extensions-2330.patch b/meta-oe/recipes-core/opencl/files/0001-Always-enable-beta-extensions-2330.patch
new file mode 100644
index 000000000000..430f9575c4b3
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/files/0001-Always-enable-beta-extensions-2330.patch
@@ -0,0 +1,32 @@
+From 3a275fe81b6d436194f563e7a3d24f302d14a211 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?K=C3=A9vin=20Petit?= <kpet@free.fr>
+Date: Tue, 11 Mar 2025 18:40:29 +0000
+Subject: [PATCH] Always enable beta extensions (#2330)
+
+`CL_ENABLE_BETA_EXTENSIONS` was just introduced in
+https://github.com/KhronosGroup/OpenCL-Headers/pull/276
+to guard provisional and other experimental extensions. The CTS
+currently assumes
+all definitions are always present.
+
+Signed-off-by: Kevin Petit <kevin.petit@arm.com>
+Upstream-Status: Backport [https://github.com/KhronosGroup/OpenCL-CTS/commit/3a275fe81b6d436194f563e7a3d24f302d14a211]
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 898f62e97bdc..8a93ea9fb843 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -18,6 +18,7 @@ add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_2_APIS=1)
+ add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_1_APIS=1)
+ add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_0_APIS=1)
+ add_definitions(-DCL_NO_EXTENSION_PROTOTYPES)
++add_definitions(-DCL_ENABLE_BETA_EXTENSIONS)
+ 
+ option(USE_CL_EXPERIMENTAL "Use Experimental definitions" OFF)
+ if(USE_CL_EXPERIMENTAL)
+-- 
+2.47.2
+
diff --git a/meta-oe/recipes-core/opencl/files/0001-Command-buffer-supported-queue-properties-265.patch b/meta-oe/recipes-core/opencl/files/0001-Command-buffer-supported-queue-properties-265.patch
deleted file mode 100644
index 1654bf48c6c5..000000000000
--- a/meta-oe/recipes-core/opencl/files/0001-Command-buffer-supported-queue-properties-265.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 85888592e178c7923cd1bc1d69cee530906c80a4 Mon Sep 17 00:00:00 2001
-From: Ewan Crawford <ewan@codeplay.com>
-Date: Tue, 14 Jan 2025 17:14:29 +0000
-Subject: [PATCH] Command-buffer supported queue properties (#265)
-
-Header update generated from OpenCL-Docs PR XML change
-https://github.com/KhronosGroup/OpenCL-Docs/pull/850
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/OpenCL-Headers/commit/d32c5bb219d7ba90ad4f251cf0bb903c08f8e5db]
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
----
- CL/cl_ext.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CL/cl_ext.h b/CL/cl_ext.h
-index 1a48985e167b..be5b473ff150 100644
---- a/CL/cl_ext.h
-+++ b/CL/cl_ext.h
-@@ -52,7 +52,7 @@ extern "C" {
-     "cl_khr_command_buffer"
- 
- 
--#define CL_KHR_COMMAND_BUFFER_EXTENSION_VERSION CL_MAKE_VERSION(0, 9, 5)
-+#define CL_KHR_COMMAND_BUFFER_EXTENSION_VERSION CL_MAKE_VERSION(0, 9, 6)
- 
- typedef cl_bitfield         cl_device_command_buffer_capabilities_khr;
- typedef struct _cl_command_buffer_khr* cl_command_buffer_khr;
-@@ -66,13 +66,13 @@ typedef struct _cl_mutable_command_khr* cl_mutable_command_khr;
- 
- /* cl_device_info */
- #define CL_DEVICE_COMMAND_BUFFER_CAPABILITIES_KHR           0x12A9
-+#define CL_DEVICE_COMMAND_BUFFER_SUPPORTED_QUEUE_PROPERTIES_KHR 0x129A
- #define CL_DEVICE_COMMAND_BUFFER_REQUIRED_QUEUE_PROPERTIES_KHR 0x12AA
- 
- /* cl_device_command_buffer_capabilities_khr - bitfield */
- #define CL_COMMAND_BUFFER_CAPABILITY_KERNEL_PRINTF_KHR      (1 << 0)
- #define CL_COMMAND_BUFFER_CAPABILITY_DEVICE_SIDE_ENQUEUE_KHR (1 << 1)
- #define CL_COMMAND_BUFFER_CAPABILITY_SIMULTANEOUS_USE_KHR   (1 << 2)
--#define CL_COMMAND_BUFFER_CAPABILITY_OUT_OF_ORDER_KHR       (1 << 3)
- 
- /* cl_command_buffer_properties_khr */
- #define CL_COMMAND_BUFFER_FLAGS_KHR                         0x1293
diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
index 2e8b52d7945c..2495f195c18b 100644
--- a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
+++ b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.patch
@@ -17,8 +17,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -19,6 +19,16 @@ add_definitions(-DCL_USE_DEPRECATED_OPEN
- add_definitions(-DCL_USE_DEPRECATED_OPENCL_1_0_APIS=1)
  add_definitions(-DCL_NO_EXTENSION_PROTOTYPES)
+ add_definitions(-DCL_ENABLE_BETA_EXTENSIONS)
  
 +option(ENABLE_WERROR "Enable warnings as errors" ON)
 +
diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_2025.07.22.bb
similarity index 91%
rename from meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
rename to meta-oe/recipes-core/opencl/opencl-clhpp_2025.07.22.bb
index 7335712d6f65..e1302f4963f6 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_2025.07.22.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "opencl-headers"
 
-SRCREV = "c7b4aded1cab9560b226041dd962f63375a9a384"
+SRCREV = "2a608428f725cad7903ef55e1ce5b995895838f5"
 
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=main"
 
diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
index c766a666401c..52c8c59f27e6 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.01.22.bb
@@ -10,6 +10,7 @@ RDEPENDS:${PN} += "python3-core python3-io"
 
 
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
+           file://0001-Always-enable-beta-extensions-2330.patch \
 	   file://0001-Ignore-Compiler-Warnings.patch"
 
 SRCREV = "5b3518096ca7b82854daadb2b2fae704fe2d9cb5"
diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb b/meta-oe/recipes-core/opencl/opencl-headers_2025.07.22.bb
similarity index 76%
rename from meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
rename to meta-oe/recipes-core/opencl/opencl-headers_2025.07.22.bb
index 0ec2fe5f3375..3b5f948e7d6c 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_2025.07.22.bb
@@ -4,9 +4,8 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
-SRCREV = "4ea6df132107e3b4b9407f903204b5522fdffcd6"
+SRCREV = "8a97ebc88daa3495d6f57ec10bb515224400186f"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https \
-           file://0001-Command-buffer-supported-queue-properties-265.patch \
            "
 
 inherit cmake
-- 
2.39.5


