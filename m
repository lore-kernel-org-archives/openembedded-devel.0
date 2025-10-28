Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DAFCCF9EA
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 22:33:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.22410.1761690798923965356
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 15:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=D7rby3Zf;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CKYIjDdD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJqZp42511058
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 22:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Kz+KW1LWL3HdaoZ9RqczB0v54dwanmu34MC
	br0fWmpQ=; b=D7rby3ZfZ++loZZx5y3OXGsmxE63SQ2bBeF2/LAbTVNPWu4Dkyd
	73CY86GhSaM5vSDa+1kLPSjHv3LjMCq5KdYvoGxAqpf6/bLvQj7B0gX+lMdhXt+M
	nFvb4eQvsSouJ1x3e60SFVvSYJgVfhCq1UisMpASB33KFfHCJDp9FSo6rOZ6lIyG
	hUPoemZVsj6+lAnOFRkEP0/PsGMFNh45X4laZQfZWRiCBkAuXznWzEM8UwLAaPML
	AagySXZXWKSzfn8vxBMTJOzjUTl/rUKHDtKydx4KUpdugLP4rMAObInfgicq1WT2
	7GOwk2GEjQvxuM43GAwfjSpxLOxbaPmYDAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34cd8bc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 22:33:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a89c9750so190941511cf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 15:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761690797; x=1762295597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kz+KW1LWL3HdaoZ9RqczB0v54dwanmu34MCbr0fWmpQ=;
        b=CKYIjDdD2Bt+vKEgj2xRqHNaLLpqRtm3zuw8P58cQuQCRPXJo+2vVgG4xwJpKpWURv
         0w2oj+W6N595lpzYfRa4bBhlvdCXRBg/wwo903DJPjkotQA2gA0d2mJN6PZ0bKMKe4J7
         2qrw2bFBTfdX+iM3vuiP6ySdEq9+INHb5yF+984jF/j/dfXIA6Y2y2bwzpTzg6fB2pjW
         Jz0QPlsuGrQKDBKMf2K17bZ/jxqBbnFbdizmb0FJ1oosQkz+mMZeSbfaHOtNtTZilA2P
         uwEIx7C9xQLHoeW86acClR0zu3R7IiwFWm8D+6jG3+SGZh1PhJaBz+Pswjri8O7o3Ouf
         N2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761690797; x=1762295597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kz+KW1LWL3HdaoZ9RqczB0v54dwanmu34MCbr0fWmpQ=;
        b=rXu8m5+2wNeoXmMG86+EYRYbYMrzUZ9ls+MiZhogA70eHyZxjKapx71vwZCbGKqL7z
         8pxY6B24LqHghuTtv64kylSXx7/NwwCVahOAoHGKUYbKGnIrAiwQXPhQZjbO3d0vY1Hm
         mkL+4OT47geRdnRiyLvkPrp1WoIWATUwqSnbgmHd/29SUbWE/vVHv3WLI34JbIFP5vqn
         OT964ZDzrYQBM2iDLkcYo2AwYMUMU90+ZggG7i8tpBR1iMlaHIbRT/4m3rJJ1nFmA/iF
         pV/cFM06O/1KrtOgdrnkyrSX5Et+Y9nJKqyzZikt4XqrlZQMN18xWFXGLL8Vg49cVq0R
         jP2g==
X-Gm-Message-State: AOJu0YwkydmjuI81xkohK3WSQsqP9uSm7fgR4KyZyPP8EJvKb8JdftSZ
	fpqHduF2ufgxcM0+y2wJxMBdGVEpmx20WdEL8Pus2X9BbuyiBTJp9qdNOCdZfP929asSpo4gjoz
	0mZylKAup0GZ23zo4JxQ01U3i73qbOlQkRY2r7+eoq5VUA4+1dv/tORwOTp8pRFc5Ik98hTAgi2
	kl4Ee3k9UxZ6LpVDTo
X-Gm-Gg: ASbGncuAQvQfAWyqBmRBlqnj6MKbUTLW6l6dcG32pJWJRVf7302fsiB6voMpM21rGjB
	D4Ly7TwdblfSA4uj9M/tuQcuxGxIw0thP9ONL9gqnIK8cTFRcRZlhpyiLCNkR9f50oNzUX9hxRF
	G7ZphRxMpZ8X7fLnvTl3ONkHFnSJfR5CCKySaONvJFEz1dBbiAH2aX9ti+h+7uX9yjf4RHwWZ8x
	oCBX9DGl5mgm9YSaM5s0FfjNzUPIwThxvfbut6UCbGQJJ8B3XEKViIFQCnOGu+WzSPWdnze2uHG
	GNjK9jkGKkXYw3IXDSzUjSb4z8kjSxN2PRkSR6999vVzbyQxZ08/LwCizIX/kGpDch4AK9tGA3P
	1SwNMJsa425+uW9nF/uvM63/v2vdsAkgcG1Eqo6ECVw+2inhifur3958FtQJjOLb1QgISwwEl+X
	B3+6odVWKSDxFQ
X-Received: by 2002:a05:622a:cd:b0:4e8:a4ab:8b3f with SMTP id d75a77b69052e-4ed15b752f9mr13520121cf.21.1761690796887;
        Tue, 28 Oct 2025 15:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5WAJsIVJ+MNKFLiLQEvT3tKiMHJP6BDAEzYIwqK3C7B0Ub2AvDtZw+FlRSFiQvw1N9LxiPQ==
X-Received: by 2002:a05:622a:cd:b0:4e8:a4ab:8b3f with SMTP id d75a77b69052e-4ed15b752f9mr13519621cf.21.1761690796260;
        Tue, 28 Oct 2025 15:33:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59302556f48sm3331678e87.45.2025.10.28.15.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 15:33:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ryan Eatmon <reatmon@ti.com>
Subject: [meta-oe][PATCH] vulkan-cts: fix building for ARM targets without NEON
Date: Wed, 29 Oct 2025 00:33:12 +0200
Message-ID: <20251028223312.587426-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RQvozidNMDQonxtcK4lF8BhrWGWdtcy_
X-Proofpoint-GUID: RQvozidNMDQonxtcK4lF8BhrWGWdtcy_
X-Authority-Analysis: v=2.4 cv=avi/yCZV c=1 sm=1 tr=0 ts=690144ad cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=EUspDBNiAAAA:8 a=0PO-L9UzGEu73nb5_owA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE5MSBTYWx0ZWRfXx4PSr/bn2FEU
 uqyjfXYT//+0U5yfOKu4Q1NgPpaz25lfJ5GMneydhT5jmAHaaSKy15luGO7mg+Fh9UOn7mNbuQj
 9FiVPAucq0WvBraNkJEyUxjgnGzuaneVt8GeVvDhFdZnYC/c+bldWv+pw5q7B1mqINvBTLBZoQl
 JD7KNdA2hqEPnPxFP0dUUHMChDbjz4+PEsCjzbaimPRlXgSjjHL52OiN3Ey90ZB/GTV0SBnBIJA
 M760xhQIBiRXccL1M1LyHIU1gWTsFFQC/CZ6qhN7A5G2LcKtFgMV4RCU8qbEBHSwcQZiMeQFcIO
 KAPY6VLlyRUih+c97zSDvD6ipYMPmxGO9ITQJyyhX8XKcCwOXnA9ysA74DOS6DV6Wkt/Vc6G8ru
 uYN74clXMbFvK7cvU9SawuEtvZLvnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 22:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121104

Pick up a patch make Vulkan CTS build on ARM hosts without NEON.

Reported-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...ing-for-non-NEON-enabled-ARM-targets.patch | 89 +++++++++++++++++++
 .../vk-gl-cts/vulkan-cts_1.4.4.0.bb           |  5 +-
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch
new file mode 100644
index 000000000000..d51ccafc9427
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch
@@ -0,0 +1,89 @@
+From 95b4ea5b8a5044fed7aeb1c279eddae709a6ce5f Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Tue, 28 Oct 2025 19:27:21 +0200
+Subject: [PATCH] decode: fix building for non-NEON-enabled ARM targets
+
+Building for non-NEON ARM targets fails with the cryptic message. Verify
+that it is possible to build NEON code at all.
+
+.../work/armv7at2hf-vfp-oe-linux-gnueabi/vulkan-cts/1.4.4.0/recipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/15.2.0/include/arm_neon.h:11019:1:
+error: inlining failed in call to 'always_inline' 'uint8x16_t
+vld1q_u8(const uint8_t*)': target specific option mismatch
+11019 | vld1q_u8 (const uint8_t * __a)
+       | ^~~~~~~~
+.../work/armv7at2hf-vfp-oe-linux-gnueabi/vulkan-cts/1.4.4.0/sources/vulkan-cts-1.4.4.0/external/vulkan-video-samples/src/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp:22:36:
+note: called from here
+    22 |         uint8x16_t vdata = vld1q_u8(pdatain);
+       |                            ~~~~~~~~^~~~~~~~~
+
+Reported-by: Ryan Eatmon <reatmon@ti.com>
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Video-Samples/pull/112]
+---
+ .../libs/NvVideoParser/CMakeLists.txt          | 18 +++++++++++++++++-
+ .../NvVideoParser/src/VulkanVideoDecoder.cpp   |  2 ++
+ 2 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt b/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
+index 84251ed60ab9..65da635e2929 100644
+--- a/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
++++ b/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
+@@ -65,6 +65,13 @@ check_cxx_source_compiles("
+   #endif
+ " IS_ARM)
+ 
++check_cxx_source_compiles("
++  #include <arm_neon.h>
++  uint8_t *pin;
++  uint8x16_t vdata;
++  int main() { vdata = vld1q_u8(pin); return 0; }
++  " HAS_ARM_NEON)
++
+ check_cxx_source_compiles("
+   #if defined(__x86_64__) || defined(_M_X64) || defined(__i386__) || defined(_M_IX86)
+   int main() { return 0; }
+@@ -85,6 +99,7 @@ if (IS_AARCH64 OR (CMAKE_GENERATOR_PLATFORM MATCHES "^aarch64") OR (CMAKE_GENERA
+     set(SVE_CPU_FEATURE "-march=armv8-a+sve")
+   endif()
+   MESSAGE(STATUS "Parser optimizations selected for generic ARM NEON")
++  add_compile_definitions(HAS_ARM_NEON=1)
+   add_library(next_start_code_c OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeC.cpp include)
+   target_include_directories(next_start_code_c PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
+   add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeNEON.cpp include)
+@@ -102,7 +117,7 @@ if (IS_AARCH64 OR (CMAKE_GENERATOR_PLATFORM MATCHES "^aarch64") OR (CMAKE_GENERA
+     target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c next_start_code_neon next_start_code_sve)
+     target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_code_c next_start_code_neon next_start_code_sve)
+   endif()
+-elseif (IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES "^arm") OR (CMAKE_GENERATOR_PLATFORM MATCHES "^ARM"))
++elseif ((IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES "^arm") OR (CMAKE_GENERATOR_PLATFORM MATCHES "^ARM")) AND HAS_ARM_NEON)
+   MESSAGE(STATUS "Parser optimization for ARM ${CMAKE_SYSTEM_PROCESSOR}")
+   if(WIN32)
+     MESSAGE(STATUS "Parser optimizations selected for WIN32 VFPv4")
+@@ -111,6 +126,7 @@ elseif (IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES "^arm") OR (CMAKE_GENERATOR_
+     MESSAGE(STATUS "Parser optimizations selected for UNIX armv7-a+simd")
+     set(NEON_CPU_FEATURE "-march=armv7-a+simd")
+   endif()
++  add_compile_definitions(HAS_ARM_NEON=1)
+   add_library(next_start_code_c OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeC.cpp include)
+   target_include_directories(next_start_code_c PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
+   add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeNEON.cpp include)
+diff --git a/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp b/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
+index 83b968ef55df..eced7fcd7bba 100644
+--- a/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
++++ b/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
+@@ -335,10 +335,12 @@ bool VulkanVideoDecoder::ParseByteStream(const VkParserBitstreamPacket* pck, siz
+         return ParseByteStreamSVE(pck, pParsedBytes);
+     } else
+ #endif //__aarch64__
++#if defined(HAS_ARM_NEON)
+     if (m_NextStartCode == SIMD_ISA::NEON)
+     {
+         return ParseByteStreamNEON(pck, pParsedBytes);
+     } else
++#endif // HAS_ARM_NEON
+ #endif
+     {
+         return ParseByteStreamC(pck, pParsedBytes);
+-- 
+2.51.0
+
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
index 465ac981f90a..4d2f223a39b6 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
@@ -6,7 +6,10 @@ SRCREV_vk-gl-cts = "03c0746a55b78eab63c664a11948b52419e1f309"
 
 require vulkan-cts-sources.inc
 
-SRC_URI:append = " file://0001-decode-fix-build-on-ARMv7-targets.patch;patchdir=external/vulkan-video-samples/src"
+SRC_URI:append = " \
+    file://0001-decode-fix-build-on-ARMv7-targets.patch;patchdir=external/vulkan-video-samples/src \
+    file://0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch;patchdir=external/vulkan-video-samples/src \
+"
 
 # Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT
 OECMAKE_CXX_FLAGS:remove:toolchain-gcc = "-O2"
-- 
2.47.3


