Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87ABDD3E794
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 05:49:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2409.1765432155520011699
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 21:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=fftacEBX;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=JtALkZzC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPbFW3193811
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 05:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZqzU2kAlLFTgTj7zytN6S5
	gGmUiBNnKFHpEPPBaWY8g=; b=fftacEBX+3McI8ib7f6p8vNTWV0UptUtu+7jn/
	LLbUOqq5YQt3F/acQmdhSajdPoMHXNe0s5V7oZOY/XrRtBe0FlrRFhwr9XNdU1z2
	YZRUX61S6pTdpWqDgF3aUwVFDLs2qB+xPxiuyMFsBMmvaG8kSXbYgOdMrPKd0euO
	CFCiwDmNAQTsyJAyzmqQU96vpFlTXO+xS60mrqkNR4Iy78vH5XeG6Ufqy+OAmhzM
	jsJYBxi/nP+QrTttWzZoARo2CwCinHm/jlAtHZTxXNFmxobjRyE6LrGQMlRh76n7
	MXp6mCipBx+uihvOR1Cx5maDTdvLAsvTO9CFJXWKC+EN7SyQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygrx163v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 05:49:14 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-559597352f9so439350e0c.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 21:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765432153; x=1766036953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqzU2kAlLFTgTj7zytN6S5gGmUiBNnKFHpEPPBaWY8g=;
        b=JtALkZzCF4GNH7Gr7o+Wm6vWUQ+med+aP/iJLx9z8P/5Lik989zT585hmeSuZzSlrP
         tbniDF2TbSWRQNhzFhTBEg3iEKvPVKprOTx1/cqX65INMfVBhK4bhE6YT8RrgK8iCDS/
         lqv94N3vK+59jdBMwaTlAp+BB87Oi3FoFoFRSO/sKwdRBgkvUAaHy+60cUMMx2LZ8TxE
         i0xFVgXnBwVcPSdGsdUpJ1ipNzI6m4AjTpZXZefho5GAqMWcp1yKV6vcqfMtCVL6edVI
         T09JH+q9yVpbCXgJ98w4+I8q9VeKVDC9KGw20nBDvJYtp17all4xprPs/akXm4lbY76P
         JiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765432153; x=1766036953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqzU2kAlLFTgTj7zytN6S5gGmUiBNnKFHpEPPBaWY8g=;
        b=u+QvFLydyyscFSV0gTRvw59cPz8E+XJlH8bLjs74qHdGf2YiTTwD4zJt2Vs+XT6FQC
         DQx3kIaodfjb3/x4EmnAGXUziopCUNBDl1mad4uKBd8a1sUZQpdZhDcNsT6m/pO90dZy
         o57utn6zk5KhQn6nhhks+bsHzMKLHKjNZoyE8kG5gqbT4pfaFiN+v1NNTmLC0/OxHuk+
         AAWFNWMnFNPthPsIUTRnygJkVaHtMrZRwJVquwAx865Sq3SmZGAhHabEmKsbEDEb8Hui
         rJFVmPcH4jedQJxhmcMgx9zXvA+kOxE+vHYMSP4mvjsU6CNJF0uhvyyA5e1fDjJiWC+E
         VsWg==
X-Gm-Message-State: AOJu0YzSP7h3OZjf8zCVr2DZWWaBGNAoSAPxhmUN0WEZrzCLw44XLiXV
	3gQM/zIn3IJrYx9aaPna75gYVorAyb8+yumDIYGNyhYldbIdUeD2BI+Y3msbOIwBC9tqfd+DzPa
	Wf50uikuU1jstQqvCyhbhX9jv2atmghi2/MWvKJSsmgcWqWnOVUMKzkUYIMvHY6KQn2PwLX4kpj
	czJRDjs6Px5vj7i22R
X-Gm-Gg: AY/fxX6nQBar6tRtwlcGDToNKR0cTrduMFNVSNRjteoFPEi+jftfLHIRYOfPfdXCwif
	Cnc6i2c0tc0vxS96QdWPDiwYIZR2qhOK2o34RmakHjNLkNTfDSYcwfqLgpShjHoYEeLTH9GmpV/
	LoJ8BsvdzGxi0hVnesc/jx9QY3lFzgyxx1sX4iLD8aVUaB9nG7KfuGsy0jd8Xsrhgj+B+OMGPTG
	12inIqRPWTXh+wG3It4yHb3K55vC7b/nSzj5MBwgIUTRhCvk9uP9qGDj6tly9JLvW6zxOHOZCqZ
	1t3O0cDjtV0ao/pkOrO+LLLXZv6wLqpTtdd6nYSvOPYJlB5MNDk93HUxiTvMLupYRUN/WIMnbAF
	5TQNZi0OitLtVjreVVKKxM6s6afkePUCFXRbKxGgLKSYjftuh+57/Ap7OiOghFVR8BH2VQjQ3oG
	poY1gCUs5D4Bj/PEQ/MmccMGA=
X-Received: by 2002:a05:6122:3d43:b0:557:c467:7994 with SMTP id 71dfb90a1353d-55fcfad7bcbmr1383724e0c.2.1765432153335;
        Wed, 10 Dec 2025 21:49:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLnf4IJvJHvx/iRDNYZnRHlAPvpdd1JLzA9nuMTEKx6+Ucgslq7XkEpk4i/qpTcY2EFhaGUQ==
X-Received: by 2002:a05:6122:3d43:b0:557:c467:7994 with SMTP id 71dfb90a1353d-55fcfad7bcbmr1383720e0c.2.1765432152688;
        Wed, 10 Dec 2025 21:49:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca97ab6sm4394441fa.48.2025.12.10.21.49.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:49:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] vulkan-cts: upgrade 1.4.4.0 -> 1.4.4.2
Date: Thu, 11 Dec 2025 07:49:10 +0200
Message-ID: <20251211054911.1329970-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Authority-Analysis: v=2.4 cv=Hc0ZjyE8 c=1 sm=1 tr=0 ts=693a5b5a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=V2sgnzSHAAAA:8
 a=H7uT3lVQ2QeR38ZSNSwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: lq-n48upOPIDd6g5D_P5Cbe9ZKb3cdfE
X-Proofpoint-ORIG-GUID: lq-n48upOPIDd6g5D_P5Cbe9ZKb3cdfE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAzOSBTYWx0ZWRfXyHsTcmZphr4I
 Zp7CmFXuhaJXpTP9NX585mbCIBPnnPZPQJip9iBXNaOgjoEUOSe65tj8IlgmuyNAvEIHh6ZJReY
 hXsVCzeOnQ6j+80xy0BEaG8cGL+jbNqkBHZfwnAoNr0TVYECE0p//hVbuNzMaWFuHQlD2oEX77Y
 Rvy4gM4ggYhKWPb93UIfyvNwceWvnsTMaClZML0IBeGMbpWNDkWNBDhOxfJN0t+QQjkfsOqqkwd
 qekg5/igdc4zg+eE5SN2bEBbljOxgzcg/dS/0/2uTOshCjAqtgzuNZe0YYjadKNLQ4aUWkZ/wrj
 f4K6crAJ75e2OGKZckaEPG3ONgU38aXFEo9iJ3+mN184QHuBlwjCZkMN8nLN27pPoreorOHISRi
 DSD6QRhib0sM5KLuRzSwU0rqVqAt6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110039
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5BALPbFW3193811
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 05:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122581

Upgrade Vulkan CTS to the point release, fixing several tests. While we
are at it, refresh Vulkan-Video-Samples patches.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...01-decode-fix-build-on-ARMv7-targets.patch |  4 +-
 ...ing-for-non-NEON-enabled-ARM-targets.patch | 73 ++++++++++---------
 .../vk-gl-cts/vulkan-cts-sources.inc          |  2 +-
 ...n-cts_1.4.4.0.bb =3D> vulkan-cts_1.4.4.2.bb} |  2 +-
 4 files changed, 45 insertions(+), 36 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.4.0.bb =3D> vu=
lkan-cts_1.4.4.2.bb} (94%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-bui=
ld-on-ARMv7-targets.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001=
-decode-fix-build-on-ARMv7-targets.patch
index d8680a292b38..3c13ebe5c0ec 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-A=
RMv7-targets.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-A=
RMv7-targets.patch
@@ -9,8 +9,10 @@ Building NEON code on ARMv7 fails with the following err=
or:
=20
 Add missing vreinterpret call in order to fix that error.
=20
+Fixes KhronosGroup/VK-GL-CTS#547
+
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Video=
-Samples/pull/109]
+Upstream-Status: Backport [https://github.com/KhronosGroup/Vulkan-Video-=
Samples/commit/1e665d0f5139114203e04a1398de8c94ef031fd7]
 ---
  vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-bui=
lding-for-non-NEON-enabled-ARM-targets.patch b/meta-oe/recipes-graphics/v=
k-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.=
patch
index d51ccafc9427..3bfa332d1416 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-f=
or-non-NEON-enabled-ARM-targets.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-f=
or-non-NEON-enabled-ARM-targets.patch
@@ -17,73 +17,80 @@ note: called from here
        |                            ~~~~~~~~^~~~~~~~~
=20
 Reported-by: Ryan Eatmon <reatmon@ti.com>
+Co-developed-by: St=C3=A9phane Cerveau <scerveau@igalia.com>
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Video=
-Samples/pull/112]
+Upstream-Status: Backport [https://github.com/KhronosGroup/Vulkan-Video-=
Samples/commit/8aabc529c7a981f2738acab1527745989ae91f26]
 ---
- .../libs/NvVideoParser/CMakeLists.txt          | 18 +++++++++++++++++-
- .../NvVideoParser/src/VulkanVideoDecoder.cpp   |  2 ++
- 2 files changed, 19 insertions(+), 1 deletion(-)
+ .../libs/NvVideoParser/CMakeLists.txt         | 27 ++++++++++++++-----
+ .../NvVideoParser/src/VulkanVideoDecoder.cpp  |  2 ++
+ 2 files changed, 22 insertions(+), 7 deletions(-)
=20
 diff --git a/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt b/vk_vid=
eo_decoder/libs/NvVideoParser/CMakeLists.txt
-index 84251ed60ab9..65da635e2929 100644
+index 84251ed6..8c324408 100644
 --- a/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
 +++ b/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
-@@ -65,6 +65,13 @@ check_cxx_source_compiles("
+@@ -65,6 +65,14 @@ check_cxx_source_compiles("
    #endif
  " IS_ARM)
 =20
 +check_cxx_source_compiles("
-+  #include <arm_neon.h>
-+  uint8_t *pin;
-+  uint8x16_t vdata;
-+  int main() { vdata =3D vld1q_u8(pin); return 0; }
++  #if defined(__ARM_NEON)
++  int main() { return 0; }
++  #else
++  #error Not ARM NEON
++  #endif
 +  " HAS_ARM_NEON)
 +
  check_cxx_source_compiles("
    #if defined(__x86_64__) || defined(_M_X64) || defined(__i386__) || de=
fined(_M_IX86)
    int main() { return 0; }
-@@ -85,6 +99,7 @@ if (IS_AARCH64 OR (CMAKE_GENERATOR_PLATFORM MATCHES "^=
aarch64") OR (CMAKE_GENERA
+@@ -84,7 +92,6 @@ if (IS_AARCH64 OR (CMAKE_GENERATOR_PLATFORM MATCHES "^=
aarch64") OR (CMAKE_GENERA
+     set(NEON_CPU_FEATURE "-march=3Darmv8-a")
      set(SVE_CPU_FEATURE "-march=3Darmv8-a+sve")
    endif()
-   MESSAGE(STATUS "Parser optimizations selected for generic ARM NEON")
-+  add_compile_definitions(HAS_ARM_NEON=3D1)
+-  MESSAGE(STATUS "Parser optimizations selected for generic ARM NEON")
    add_library(next_start_code_c OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/=
NextStartCodeC.cpp include)
    target_include_directories(next_start_code_c PUBLIC ${CMAKE_CURRENT_S=
OURCE_DIR}/include)
    add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/s=
rc/NextStartCodeNEON.cpp include)
-@@ -102,7 +117,7 @@ if (IS_AARCH64 OR (CMAKE_GENERATOR_PLATFORM MATCHES =
"^aarch64") OR (CMAKE_GENERA
-     target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c =
next_start_code_neon next_start_code_sve)
-     target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_=
code_c next_start_code_neon next_start_code_sve)
+@@ -113,12 +120,18 @@ elseif (IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHE=
S "^arm") OR (CMAKE_GENERATOR_
    endif()
--elseif (IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES "^arm") OR (CMAKE_G=
ENERATOR_PLATFORM MATCHES "^ARM"))
-+elseif ((IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES "^arm") OR (CMAKE_=
GENERATOR_PLATFORM MATCHES "^ARM")) AND HAS_ARM_NEON)
-   MESSAGE(STATUS "Parser optimization for ARM ${CMAKE_SYSTEM_PROCESSOR}=
")
-   if(WIN32)
-     MESSAGE(STATUS "Parser optimizations selected for WIN32 VFPv4")
-@@ -111,6 +126,7 @@ elseif (IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES =
"^arm") OR (CMAKE_GENERATOR_
-     MESSAGE(STATUS "Parser optimizations selected for UNIX armv7-a+simd=
")
-     set(NEON_CPU_FEATURE "-march=3Darmv7-a+simd")
-   endif()
-+  add_compile_definitions(HAS_ARM_NEON=3D1)
    add_library(next_start_code_c OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/=
NextStartCodeC.cpp include)
    target_include_directories(next_start_code_c PUBLIC ${CMAKE_CURRENT_S=
OURCE_DIR}/include)
-   add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/s=
rc/NextStartCodeNEON.cpp include)
+-  add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/s=
rc/NextStartCodeNEON.cpp include)
+-  set_target_properties(next_start_code_neon PROPERTIES COMPILE_FLAGS $=
{NEON_CPU_FEATURE} )
+-  target_include_directories(next_start_code_neon PUBLIC ${CMAKE_CURREN=
T_SOURCE_DIR}/include)
+-  MESSAGE(STATUS "Parser optimizations linking ARM next_start_code_c ne=
xt_start_code_neon")
+-  target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c ne=
xt_start_code_neon)
+-  target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_co=
de_c next_start_code_neon)
++  if (HAS_ARM_NEON)
++    add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}=
/src/NextStartCodeNEON.cpp include)
++    set_target_properties(next_start_code_neon PROPERTIES COMPILE_FLAGS=
 ${NEON_CPU_FEATURE} )
++    target_include_directories(next_start_code_neon PUBLIC ${CMAKE_CURR=
ENT_SOURCE_DIR}/include)
++    MESSAGE(STATUS "Parser optimizations linking ARM next_start_code_c =
next_start_code_neon")
++    target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c =
next_start_code_neon)
++    target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_=
code_c next_start_code_neon)
++  else()
++    MESSAGE(STATUS "Parser optimizations linking ARM next_start_code_c"=
)
++    target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c)
++    target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_=
code_c)
++  endif()
+ elseif (IS_X86)
+   MESSAGE(STATUS "Parser optimization for X86 ${CMAKE_SYSTEM_PROCESSOR}=
")
+   if(WIN32)
 diff --git a/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.=
cpp b/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
-index 83b968ef55df..eced7fcd7bba 100644
+index 83b968ef..5f7ff53e 100644
 --- a/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
 +++ b/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
 @@ -335,10 +335,12 @@ bool VulkanVideoDecoder::ParseByteStream(const VkP=
arserBitstreamPacket* pck, siz
          return ParseByteStreamSVE(pck, pParsedBytes);
      } else
  #endif //__aarch64__
-+#if defined(HAS_ARM_NEON)
++#if defined(__ARM_NEON)
      if (m_NextStartCode =3D=3D SIMD_ISA::NEON)
      {
          return ParseByteStreamNEON(pck, pParsedBytes);
      } else
-+#endif // HAS_ARM_NEON
++#endif // __ARM_NEON
  #endif
      {
          return ParseByteStreamC(pck, pParsedBytes);
---=20
-2.51.0
-
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/=
meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
index a40327869958..89d052dbdfb2 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -6,7 +6,7 @@
 RECIPE_UPGRADE_EXTRA_TASKS +=3D "do_refresh_srcuri"
=20
 python __anonymous() {
-    if d.getVar("PV") !=3D "1.4.4.0":
+    if d.getVar("PV") !=3D "1.4.4.2":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
=20
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb b/m=
eta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.2.bb
similarity index 94%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.2.bb
index 4d2f223a39b6..0ae7119535cc 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "Vulkan CTS"
=20
 require khronos-cts.inc
=20
-SRCREV_vk-gl-cts =3D "03c0746a55b78eab63c664a11948b52419e1f309"
+SRCREV_vk-gl-cts =3D "aa481ab6eb66a1c74768fabec453ea6e60f0ee0e"
=20
 require vulkan-cts-sources.inc
=20
--=20
2.47.3


