Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F53E67482
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 18:14:15 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65250.1766340847061121633
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Dec 2025 10:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=idOFObsY;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=P+6UHfZz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLDGcmn2445773
	for <openembedded-devel@lists.openembedded.org>; Sun, 21 Dec 2025 18:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jYIejojXQDIir8Xxu0/fF1
	14RMw6i8z39qTTa286xXc=; b=idOFObsY7E+VeyiAnlARWed8LxoI0IrMcmbYj8
	+VZgV5wvzPouKqnWELWUry9fr4fqf1epo+h3ur+WRr6qRk8v9MkC9MeT65pKO717
	og6Tw195xDhS71ktftmvzNPJjNXYkGF8QYoZVCAwUbUTFoJplEDoB3TOcapgTpAl
	HIm5Kze9FCwZ7+xHzZDA/KfCI3Mr8geieF1YlolA7Zj+5IeI5xl7wY+V8gIx4Olb
	ltq4O4UXYJ68csKcmoCTkD5FPorq6Kyc7mGGWML2iWo9FVGFTwV6m2/RB0FZDBZh
	YW+wgXYGvBOHcpC/IBPnOw7wEyJcjJqY6Kr6dJCsO9296dKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahgyu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 21 Dec 2025 18:14:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed82af96faso66416531cf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Dec 2025 10:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766340845; x=1766945645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jYIejojXQDIir8Xxu0/fF114RMw6i8z39qTTa286xXc=;
        b=P+6UHfZz7ba5PuorMMWHR7VW+ceZj8IMj97XoNUqVmOc6bYi9o5q5RdLxQxvVM9vxh
         DkH8UGO61ipPlfwuLWH2lTZ2wunzdOi/xx73DSrE/e6Ci+EAl7eBifMTQ4yBPHINBucT
         ogBKTvHCkX7rzdBwD6mZUwuIhDqhOwrdrKZPDT0PHiUd+I8eq4JmdMvV5nLOSFLU9sJU
         JyCqQYU9dWWlMEwca57J3vStSiZmw0y/m1uDgq4BmCCCCB7mtZGwxwh+VIqlmbMRW+P5
         LElSm5jLUoZfSBV+OFro8D+izGeN3eoulAKDj1snTR9W7XTznf9B7y5DzowCSnY7/kTj
         TeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766340845; x=1766945645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYIejojXQDIir8Xxu0/fF114RMw6i8z39qTTa286xXc=;
        b=WlyQeRCngiaPRP1Sgqu4d/xcNA+2eg2m7IjinS1Zxc2Z/BT1/k52dT/YrIhR5IXr2o
         NQnjRF42fKG08rcQvI1DQ4U90G1AmiIV0XdIsol58BkDSDcoK0XphKQ7iJQWSYb/D/Uh
         JRK0AiYl2OAT8hmb+clRd+G18UzUcrSp/DxXfv8mbDWlIFJHzlP9/h2llUc+T0MrQr3o
         aidH33+XEW20PvskE/206xW2u0AuH5Jk3wIfi6bi8Rw9ohYPphmCdnz5GjAu5fZP+APO
         R8VKdqVdc1VHOO1Ue4XQhEzQnZIn6Y4lqbmybD3ET98Q8TQQGq2xYmkEStd0L0L/fgA1
         4Xlw==
X-Gm-Message-State: AOJu0YySASVJ2f0j1yENaAnDuL8Dvg2KB9z4fWoJrxdJDdJOdHPgyiKr
	0+XktQzIJSfdfVC7xAvYKq/WMs3dMvIbsxLlaMewxHItr/a6E12gB96BZewE0QRMybvAFN6EpM/
	JLwkWO8kJAme2Mbr9dVmqUmku0HoZYfeJIxF2KM9LyE/Qg96DGpXwARxHeAFloUXQrgbAonEvZV
	XVMQaRQlw9As4wRnQg
X-Gm-Gg: AY/fxX4shf+eqo7dcavGUmpHClhitXmuh4a0e5Pzz2DFa6+a1oZJ9pSPdDDYlqqmR0Z
	QaE//3SzaCFWqkSaeGmgmhqVoNK+xzlW+YD8srCy+Ws0LWa0NTOEQhk8EKdhg74Foan4bQiACRL
	GACVcYW44mjUnVzU373LioiErD1LGmC7vOFCJ8bQvpRzqOvgPx4khnj5gmJ7c8ZTjKV+lVvTITs
	oJDpazAmooDbNtYOPgjqPuhCLABYXtXTWFUvSkclMOVZrlZHu/dBJe7km6DuWflXVqr8HCF1Ut8
	QLDp6vxHkbAtchHhHaF0hzXRiyJGsHKfYh/flT/8l3FwT921ulV4OjCVWdiRzj03dfHW0f9Wezv
	g4cIIKEoRmd6Ec30iqyBEk3eYvpWDYZRceTMGGZiwBTiOpuolFpybjwVio9PM+/H3ZskdsKyHd4
	zf3KHRg47Gqo/qKYTuti0qyqw=
X-Received: by 2002:a05:622a:1cc7:b0:4e8:a0bf:f5b5 with SMTP id d75a77b69052e-4f4abdba5d8mr135781441cf.73.1766340844804;
        Sun, 21 Dec 2025 10:14:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFztTcxSDZ+jAsazp/Lv9tRY8EdcMYxje/4aBjmWs16Okz9N6oUVGhJLN7S195XKEcdyC18Qw==
X-Received: by 2002:a05:622a:1cc7:b0:4e8:a0bf:f5b5 with SMTP id d75a77b69052e-4f4abdba5d8mr135781031cf.73.1766340844091;
        Sun, 21 Dec 2025 10:14:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a181beb5csm2468236e87.0.2025.12.21.10.14.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 10:14:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] vulkan-cts: upgrade 1.4.4.2 -> 1.4.5.0
Date: Sun, 21 Dec 2025 20:14:00 +0200
Message-ID: <20251221181402.3314874-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=694838ee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=JTEwExm7AAAA:20 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8
 a=V2sgnzSHAAAA:8 a=ix7GdEaB5IjY-Mh-FT8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Z31ocT7rh6aUJxSkT1EX:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: qbZZgWh0AD5LNSgFMxhwKWxPacsBGBu2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDE3MSBTYWx0ZWRfX2i/fqeRJfWiX
 G/JUAYkmUQVFKZILYb9KY3PENYVVtnLBtNRVObeGM5BEi15430iUrveLDKmEgk/F+uYYsQnrq0D
 nbD2MLVCmazCrVU1Gwk0JkX11abF1ZG3bGajCuD91EWV8Uh2Clg9lp7LEyfo+puM29NwnVFgzEV
 zWBvcPA5cXxifZynE10OA5bUXVuvwZrcQsfYONW8zzoFKNurOMKLVlHzvLt3dh/ZPs2Ttnc2CEG
 /RCwf1ER/b+b74hIQITAGBnGPy3NUfMcEY9QexPeDbtZuv9DhRaRSqR+1pLbJ2+X5/9vT4QvOPG
 1uZBajufXEGKWtlJi9tJMmNarZcV0z0qn38ZRe8CjWIuxSPgXu+/HbzLcaaLZ3U9qJjT1yR6GKG
 QwBQ/CEKJklcwLafI6puq2tnOt5hDoL5g1PjvdO+6WVTUWbLtb53+QJi5V8bzjlA1XqMAZfj7kz
 qmIRQg2efFVIFue6GRw==
X-Proofpoint-GUID: qbZZgWh0AD5LNSgFMxhwKWxPacsBGBu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_04,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512210171
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5BLDGcmn2445773
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Dec 2025 18:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122781

Upgrade Vulkan CTS, adding support for new extensions and fixing some
older bugs, e.g. compatibility with ARMv7 (thus dropping the patches,
applied upstream) or with Vulkan 1.0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...01-decode-fix-build-on-ARMv7-targets.patch | 35 -------
 ...ing-for-non-NEON-enabled-ARM-targets.patch | 96 -------------------
 .../vk-gl-cts/vulkan-cts-sources.inc          | 16 ++--
 ...n-cts_1.4.4.2.bb =3D> vulkan-cts_1.4.5.0.bb} |  7 +-
 4 files changed, 9 insertions(+), 145 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-=
fix-build-on-ARMv7-targets.patch
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-=
fix-building-for-non-NEON-enabled-ARM-targets.patch
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.4.2.bb =3D> vu=
lkan-cts_1.4.5.0.bb} (70%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-bui=
ld-on-ARMv7-targets.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001=
-decode-fix-build-on-ARMv7-targets.patch
deleted file mode 100644
index 3c13ebe5c0ec..000000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-A=
RMv7-targets.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 16d72de3280410b185f33e489727761096a2e6e4 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Wed, 22 Oct 2025 14:34:22 +0300
-Subject: [PATCH] decode: fix build on ARMv7 targets
-
-Building NEON code on ARMv7 fails with the following error:
-
-...../src/NextStartCodeNEON.cpp:39:57: error: cannot convert 'uint8x8_t'=
 to 'uint64x1_t'
-
-Add missing vreinterpret call in order to fix that error.
-
-Fixes KhronosGroup/VK-GL-CTS#547
-
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Backport [https://github.com/KhronosGroup/Vulkan-Video-=
Samples/commit/1e665d0f5139114203e04a1398de8c94ef031fd7]
----
- vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.c=
pp b/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp
-index f1a3381d7122..2c695a924ebd 100644
---- a/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp
-+++ b/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp
-@@ -36,7 +36,7 @@ size_t VulkanVideoDecoder::next_start_code<SIMD_ISA::N=
EON>(const uint8_t *pdatai
- #if defined (__aarch64__) || defined(_M_ARM64)
-                 uint64_t resmask =3D vmaxvq_u8(vmask);
- #else
--                uint64_t resmask =3D vget_lane_u64(vmax_u8(vget_low_u8(=
vmask), vget_high_u8(vmask)), 0);
-+                uint64_t resmask =3D vget_lane_u64(vreinterpret_u64_u8(=
vmax_u8(vget_low_u8(vmask), vget_high_u8(vmask))), 0);
- #endif
-                 if (resmask)
-                 {
---=20
-2.51.0
-
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-bui=
lding-for-non-NEON-enabled-ARM-targets.patch b/meta-oe/recipes-graphics/v=
k-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.=
patch
deleted file mode 100644
index 3bfa332d1416..000000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-f=
or-non-NEON-enabled-ARM-targets.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 95b4ea5b8a5044fed7aeb1c279eddae709a6ce5f Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Tue, 28 Oct 2025 19:27:21 +0200
-Subject: [PATCH] decode: fix building for non-NEON-enabled ARM targets
-
-Building for non-NEON ARM targets fails with the cryptic message. Verify
-that it is possible to build NEON code at all.
-
-.../work/armv7at2hf-vfp-oe-linux-gnueabi/vulkan-cts/1.4.4.0/recipe-sysro=
ot-native/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/15.2.0/in=
clude/arm_neon.h:11019:1:
-error: inlining failed in call to 'always_inline' 'uint8x16_t
-vld1q_u8(const uint8_t*)': target specific option mismatch
-11019 | vld1q_u8 (const uint8_t * __a)
-       | ^~~~~~~~
-.../work/armv7at2hf-vfp-oe-linux-gnueabi/vulkan-cts/1.4.4.0/sources/vulk=
an-cts-1.4.4.0/external/vulkan-video-samples/src/vk_video_decoder/libs/Nv=
VideoParser/src/NextStartCodeNEON.cpp:22:36:
-note: called from here
-    22 |         uint8x16_t vdata =3D vld1q_u8(pdatain);
-       |                            ~~~~~~~~^~~~~~~~~
-
-Reported-by: Ryan Eatmon <reatmon@ti.com>
-Co-developed-by: St=C3=A9phane Cerveau <scerveau@igalia.com>
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Backport [https://github.com/KhronosGroup/Vulkan-Video-=
Samples/commit/8aabc529c7a981f2738acab1527745989ae91f26]
----
- .../libs/NvVideoParser/CMakeLists.txt         | 27 ++++++++++++++-----
- .../NvVideoParser/src/VulkanVideoDecoder.cpp  |  2 ++
- 2 files changed, 22 insertions(+), 7 deletions(-)
-
-diff --git a/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt b/vk_vid=
eo_decoder/libs/NvVideoParser/CMakeLists.txt
-index 84251ed6..8c324408 100644
---- a/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
-+++ b/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
-@@ -65,6 +65,14 @@ check_cxx_source_compiles("
-   #endif
- " IS_ARM)
-=20
-+check_cxx_source_compiles("
-+  #if defined(__ARM_NEON)
-+  int main() { return 0; }
-+  #else
-+  #error Not ARM NEON
-+  #endif
-+  " HAS_ARM_NEON)
-+
- check_cxx_source_compiles("
-   #if defined(__x86_64__) || defined(_M_X64) || defined(__i386__) || de=
fined(_M_IX86)
-   int main() { return 0; }
-@@ -84,7 +92,6 @@ if (IS_AARCH64 OR (CMAKE_GENERATOR_PLATFORM MATCHES "^=
aarch64") OR (CMAKE_GENERA
-     set(NEON_CPU_FEATURE "-march=3Darmv8-a")
-     set(SVE_CPU_FEATURE "-march=3Darmv8-a+sve")
-   endif()
--  MESSAGE(STATUS "Parser optimizations selected for generic ARM NEON")
-   add_library(next_start_code_c OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/=
NextStartCodeC.cpp include)
-   target_include_directories(next_start_code_c PUBLIC ${CMAKE_CURRENT_S=
OURCE_DIR}/include)
-   add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/s=
rc/NextStartCodeNEON.cpp include)
-@@ -113,12 +120,18 @@ elseif (IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHE=
S "^arm") OR (CMAKE_GENERATOR_
-   endif()
-   add_library(next_start_code_c OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/=
NextStartCodeC.cpp include)
-   target_include_directories(next_start_code_c PUBLIC ${CMAKE_CURRENT_S=
OURCE_DIR}/include)
--  add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/s=
rc/NextStartCodeNEON.cpp include)
--  set_target_properties(next_start_code_neon PROPERTIES COMPILE_FLAGS $=
{NEON_CPU_FEATURE} )
--  target_include_directories(next_start_code_neon PUBLIC ${CMAKE_CURREN=
T_SOURCE_DIR}/include)
--  MESSAGE(STATUS "Parser optimizations linking ARM next_start_code_c ne=
xt_start_code_neon")
--  target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c ne=
xt_start_code_neon)
--  target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_co=
de_c next_start_code_neon)
-+  if (HAS_ARM_NEON)
-+    add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}=
/src/NextStartCodeNEON.cpp include)
-+    set_target_properties(next_start_code_neon PROPERTIES COMPILE_FLAGS=
 ${NEON_CPU_FEATURE} )
-+    target_include_directories(next_start_code_neon PUBLIC ${CMAKE_CURR=
ENT_SOURCE_DIR}/include)
-+    MESSAGE(STATUS "Parser optimizations linking ARM next_start_code_c =
next_start_code_neon")
-+    target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c =
next_start_code_neon)
-+    target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_=
code_c next_start_code_neon)
-+  else()
-+    MESSAGE(STATUS "Parser optimizations linking ARM next_start_code_c"=
)
-+    target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c)
-+    target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_=
code_c)
-+  endif()
- elseif (IS_X86)
-   MESSAGE(STATUS "Parser optimization for X86 ${CMAKE_SYSTEM_PROCESSOR}=
")
-   if(WIN32)
-diff --git a/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.=
cpp b/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
-index 83b968ef..5f7ff53e 100644
---- a/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
-+++ b/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
-@@ -335,10 +335,12 @@ bool VulkanVideoDecoder::ParseByteStream(const VkP=
arserBitstreamPacket* pck, siz
-         return ParseByteStreamSVE(pck, pParsedBytes);
-     } else
- #endif //__aarch64__
-+#if defined(__ARM_NEON)
-     if (m_NextStartCode =3D=3D SIMD_ISA::NEON)
-     {
-         return ParseByteStreamNEON(pck, pParsedBytes);
-     } else
-+#endif // __ARM_NEON
- #endif
-     {
-         return ParseByteStreamC(pck, pParsedBytes);
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/=
meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
index 89d052dbdfb2..cf1d24f637a5 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -6,19 +6,19 @@
 RECIPE_UPGRADE_EXTRA_TASKS +=3D "do_refresh_srcuri"
=20
 python __anonymous() {
-    if d.getVar("PV") !=3D "1.4.4.2":
+    if d.getVar("PV") !=3D "1.4.5.0":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
=20
 SRC_URI +=3D " \
     https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/a=
pi/app/renderdoc_app.h;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/ren=
derdoc/src;sha256sum=3De7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b=
0ef3d0bdb6868e \
-    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/sr=
c;rev=3Db8b90dba56eb8c75050a712188d662fd51c953df \
-    git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=3D38=
f6708b6b6f213010c51ffa8f577a7751e12ce7 \
-    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-header=
s/src;rev=3D97e96f9e9defeb4bba3cfbd034dec516671dd7a3 \
-    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/sr=
c;rev=3D9c6d565f72ba6929c239c3e20f90b6375acad3bd \
-    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=3D=
https;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vul=
kan-validationlayers/src;rev=3D68e4cdd8269c2af39aa16793c9089d1893eae972 \
-    git://github.com/google/amber.git;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=3D57ba1ca211=
b6f4890c013dcf42cb16069ae916dd \
+    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/sr=
c;rev=3D8a67272ca6c266b21dd0a9548471756a237ebbef \
+    git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=3D7a=
47e2531cb334982b2a2dd8513dca0a3de4373d \
+    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-header=
s/src;rev=3Db824a462d4256d720bebb40e78b9eb8f78bbb305 \
+    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/sr=
c;rev=3D60a4ad187cf3be4ede658f0fae7dd392192a314b \
+    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=3D=
https;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vul=
kan-validationlayers/src;rev=3D0a11cf1257471c22b9e7d620ab48057fb2f53cf9 \
+    git://github.com/google/amber.git;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=3D9482448393=
f3f1f75067cc6ba8ad77fda48691c6 \
     git://github.com/open-source-parsers/jsoncpp.git;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/jsoncpp/src=
;rev=3D9059f5cad030ba11d37818847443a53918c327b1 \
-    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulka=
n-video-samples/src;rev=3D56a40ba4199e5500b2a7540c15dc139fc4b19595 \
+    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulka=
n-video-samples/src;rev=3D823364b0c7abdc4f4e39418d3dd9dc11623ef146 \
     git://github.com/Igalia/video_generator.git;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/external/video_generator/=
src;rev=3D426300e12a5cc5d4676807039a1be237a2b68187 \
 "
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.2.bb b/m=
eta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.0.bb
similarity index 70%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.2.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.0.bb
index 0ae7119535cc..34dc10e44dec 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.2.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.0.bb
@@ -2,15 +2,10 @@ DESCRIPTION =3D "Vulkan CTS"
=20
 require khronos-cts.inc
=20
-SRCREV_vk-gl-cts =3D "aa481ab6eb66a1c74768fabec453ea6e60f0ee0e"
+SRCREV_vk-gl-cts =3D "db74f486c9d0594bc997f8f79521b424708ba8da"
=20
 require vulkan-cts-sources.inc
=20
-SRC_URI:append =3D " \
-    file://0001-decode-fix-build-on-ARMv7-targets.patch;patchdir=3Dexter=
nal/vulkan-video-samples/src \
-    file://0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.pat=
ch;patchdir=3Dexternal/vulkan-video-samples/src \
-"
-
 # Workaround an optimization bug that breaks createMeshShaderMiscTestsEX=
T
 OECMAKE_CXX_FLAGS:remove:toolchain-gcc =3D "-O2"
=20
--=20
2.47.3


