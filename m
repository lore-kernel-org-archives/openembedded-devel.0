Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426B1CA600F
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:29 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31574.1768811301657067492
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OV9bUJNh;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34abc7da414so2480769a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811301; x=1769416101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybXt8HWB0zRVRYgYANwogzhWqgyybQVbecbDVcWdjI8=;
        b=OV9bUJNhvtrlgZJbkEoq0n9CneWcMXXh52RSYwtCiGRRu/s/CpOE6NUWmyjKJGJwXe
         wdPlmYkGlmiNnKjBS5g+24Bt3LnBawuMdfWLi5SiTaz22YGpepDLVVpM3ivgPJsHWJOJ
         aLdmBLxTaImZOeOH9OWDo8r2dkNylDPNsHzUQMT8u1g6YLCb3SKhRFTSRXcWwX477M8G
         pgbaLWzd0FWvjOjtGihThCgUq9dXW96UBiQ5Ww9a4O/EPNa0SUJnxp05ad0Yfyhir1dB
         irLOz0iMenx0cFo1xhrSL6+g1zSvClMxdVVIulUrzaWWuxpdPItKwg4KGh672fV+IZAo
         ArcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811301; x=1769416101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybXt8HWB0zRVRYgYANwogzhWqgyybQVbecbDVcWdjI8=;
        b=mNWe7ANY0Okjejwldt/UKC2ik3LX1fRe60ZVKeraYJsEkj4wnuyIap3e88iGcq+a+k
         v2M5IV2wI8GlnUrs707jY2izjAJVmGznzSrbYTd5u/QY0+lICq1ruNINY3uEu3mCabdk
         BU3p3umHweJzlsPkrnemsGUICwjg1HykkPFTxXNcD9thHJnNi1GqYRiIsPUVtMyW4bMi
         Ru24NaKB+xCbLu1bOH4ur+e133Tz9x71sxjxUa0/mChGecFT+WUe5Uqv/Vd+03HEaW2C
         NXD/td5CZBdRRdG65sbKhgKETiF7pdmHQZ03RlN/23nMK53VKZbg9bZFvwnO/NS2DVR4
         ynbQ==
X-Gm-Message-State: AOJu0YyyZo/AuBiuaLuvQosOuZb8zGdFhXINr8jNXuIMNhf4a27fZB0u
	OuaEzHcLkqzu8pUnwA02puGl6TQmx/iDroTiRWmSJ9pBwtAjNSaYz8lPh9A9Xg==
X-Gm-Gg: AZuq6aJI3GqWB77yUZw9T1lO4b1df3/pJdzsOhTp3sAokLvGr+WIIOdNtmFISzVmkPl
	3wgY9QC+sXmgAl2gvhwfEHYdZi9FAlowZOBEa/Fmpkav3fm30MsLO6DGurESAtjbvNArdR9OHUe
	n8Fg7ecJpnhPMKmGieO5sbZKZ2BtSVbGereEvXwTL+TDVyKjACOcCuoO/UeD6zHdajecuS+1yaG
	s8q8eVebS22bLV6eJfkS7S2T7AdSDPMdqg91Gr1Rgm1DPAUoR0AS2aS6F+CW+xdJ1Jx6y88SNgS
	sI1S/fZto5+2SXyawFavXLVsCyKx+T5xNKEovs36UZC1rJIFnv0/jptnuW1+LieECOvaW6Hi08R
	YucUVoqhC64gkcGIRryThw/B1SeyTA+d++TtQ+0rl+y77aidGjUh43Knkr672OfTF0gACekUMdc
	OV40N31k+7ynEAKOaSGGxbJmZ04oCV2IRidQ==
X-Received: by 2002:a17:90b:568e:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-35272edc45cmr9025564a91.15.1768811300785;
        Mon, 19 Jan 2026 00:28:20 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 08/28] vulkan-cts: upgrade 1.4.4.0 -> 1.4.4.2
Date: Mon, 19 Jan 2026 21:27:30 +1300
Message-ID: <20260119082752.4120991-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123602

From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Upgrade Vulkan CTS to the point release, fixing several tests. While we
are at it, refresh Vulkan-Video-Samples patches.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 374949c531de346739efc4e8e7ca79d7b81f270a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...01-decode-fix-build-on-ARMv7-targets.patch |  4 +-
 ...ing-for-non-NEON-enabled-ARM-targets.patch | 73 ++++++++++---------
 .../vk-gl-cts/vulkan-cts-sources.inc          |  2 +-
 ...n-cts_1.4.4.0.bb => vulkan-cts_1.4.4.2.bb} |  2 +-
 4 files changed, 45 insertions(+), 36 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.4.0.bb => vulkan-cts_1.4.4.2.bb} (94%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-ARMv7-targets.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-ARMv7-targets.patch
index d8680a292b..3c13ebe5c0 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-ARMv7-targets.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-ARMv7-targets.patch
@@ -9,8 +9,10 @@ Building NEON code on ARMv7 fails with the following error:
 
 Add missing vreinterpret call in order to fix that error.
 
+Fixes KhronosGroup/VK-GL-CTS#547
+
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Video-Samples/pull/109]
+Upstream-Status: Backport [https://github.com/KhronosGroup/Vulkan-Video-Samples/commit/1e665d0f5139114203e04a1398de8c94ef031fd7]
 ---
  vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch
index d51ccafc94..3bfa332d14 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch
@@ -17,73 +17,80 @@ note: called from here
        |                            ~~~~~~~~^~~~~~~~~
 
 Reported-by: Ryan Eatmon <reatmon@ti.com>
+Co-developed-by: Stéphane Cerveau <scerveau@igalia.com>
 Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Video-Samples/pull/112]
+Upstream-Status: Backport [https://github.com/KhronosGroup/Vulkan-Video-Samples/commit/8aabc529c7a981f2738acab1527745989ae91f26]
 ---
- .../libs/NvVideoParser/CMakeLists.txt          | 18 +++++++++++++++++-
- .../NvVideoParser/src/VulkanVideoDecoder.cpp   |  2 ++
- 2 files changed, 19 insertions(+), 1 deletion(-)
+ .../libs/NvVideoParser/CMakeLists.txt         | 27 ++++++++++++++-----
+ .../NvVideoParser/src/VulkanVideoDecoder.cpp  |  2 ++
+ 2 files changed, 22 insertions(+), 7 deletions(-)
 
 diff --git a/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt b/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
-index 84251ed60ab9..65da635e2929 100644
+index 84251ed6..8c324408 100644
 --- a/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
 +++ b/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
-@@ -65,6 +65,13 @@ check_cxx_source_compiles("
+@@ -65,6 +65,14 @@ check_cxx_source_compiles("
    #endif
  " IS_ARM)
  
 +check_cxx_source_compiles("
-+  #include <arm_neon.h>
-+  uint8_t *pin;
-+  uint8x16_t vdata;
-+  int main() { vdata = vld1q_u8(pin); return 0; }
++  #if defined(__ARM_NEON)
++  int main() { return 0; }
++  #else
++  #error Not ARM NEON
++  #endif
 +  " HAS_ARM_NEON)
 +
  check_cxx_source_compiles("
    #if defined(__x86_64__) || defined(_M_X64) || defined(__i386__) || defined(_M_IX86)
    int main() { return 0; }
-@@ -85,6 +99,7 @@ if (IS_AARCH64 OR (CMAKE_GENERATOR_PLATFORM MATCHES "^aarch64") OR (CMAKE_GENERA
+@@ -84,7 +92,6 @@ if (IS_AARCH64 OR (CMAKE_GENERATOR_PLATFORM MATCHES "^aarch64") OR (CMAKE_GENERA
+     set(NEON_CPU_FEATURE "-march=armv8-a")
      set(SVE_CPU_FEATURE "-march=armv8-a+sve")
    endif()
-   MESSAGE(STATUS "Parser optimizations selected for generic ARM NEON")
-+  add_compile_definitions(HAS_ARM_NEON=1)
+-  MESSAGE(STATUS "Parser optimizations selected for generic ARM NEON")
    add_library(next_start_code_c OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeC.cpp include)
    target_include_directories(next_start_code_c PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
    add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeNEON.cpp include)
-@@ -102,7 +117,7 @@ if (IS_AARCH64 OR (CMAKE_GENERATOR_PLATFORM MATCHES "^aarch64") OR (CMAKE_GENERA
-     target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c next_start_code_neon next_start_code_sve)
-     target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_code_c next_start_code_neon next_start_code_sve)
+@@ -113,12 +120,18 @@ elseif (IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES "^arm") OR (CMAKE_GENERATOR_
    endif()
--elseif (IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES "^arm") OR (CMAKE_GENERATOR_PLATFORM MATCHES "^ARM"))
-+elseif ((IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES "^arm") OR (CMAKE_GENERATOR_PLATFORM MATCHES "^ARM")) AND HAS_ARM_NEON)
-   MESSAGE(STATUS "Parser optimization for ARM ${CMAKE_SYSTEM_PROCESSOR}")
-   if(WIN32)
-     MESSAGE(STATUS "Parser optimizations selected for WIN32 VFPv4")
-@@ -111,6 +126,7 @@ elseif (IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES "^arm") OR (CMAKE_GENERATOR_
-     MESSAGE(STATUS "Parser optimizations selected for UNIX armv7-a+simd")
-     set(NEON_CPU_FEATURE "-march=armv7-a+simd")
-   endif()
-+  add_compile_definitions(HAS_ARM_NEON=1)
    add_library(next_start_code_c OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeC.cpp include)
    target_include_directories(next_start_code_c PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
-   add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeNEON.cpp include)
+-  add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeNEON.cpp include)
+-  set_target_properties(next_start_code_neon PROPERTIES COMPILE_FLAGS ${NEON_CPU_FEATURE} )
+-  target_include_directories(next_start_code_neon PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
+-  MESSAGE(STATUS "Parser optimizations linking ARM next_start_code_c next_start_code_neon")
+-  target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c next_start_code_neon)
+-  target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_code_c next_start_code_neon)
++  if (HAS_ARM_NEON)
++    add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeNEON.cpp include)
++    set_target_properties(next_start_code_neon PROPERTIES COMPILE_FLAGS ${NEON_CPU_FEATURE} )
++    target_include_directories(next_start_code_neon PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
++    MESSAGE(STATUS "Parser optimizations linking ARM next_start_code_c next_start_code_neon")
++    target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c next_start_code_neon)
++    target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_code_c next_start_code_neon)
++  else()
++    MESSAGE(STATUS "Parser optimizations linking ARM next_start_code_c")
++    target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c)
++    target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_code_c)
++  endif()
+ elseif (IS_X86)
+   MESSAGE(STATUS "Parser optimization for X86 ${CMAKE_SYSTEM_PROCESSOR}")
+   if(WIN32)
 diff --git a/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp b/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
-index 83b968ef55df..eced7fcd7bba 100644
+index 83b968ef..5f7ff53e 100644
 --- a/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
 +++ b/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
 @@ -335,10 +335,12 @@ bool VulkanVideoDecoder::ParseByteStream(const VkParserBitstreamPacket* pck, siz
          return ParseByteStreamSVE(pck, pParsedBytes);
      } else
  #endif //__aarch64__
-+#if defined(HAS_ARM_NEON)
++#if defined(__ARM_NEON)
      if (m_NextStartCode == SIMD_ISA::NEON)
      {
          return ParseByteStreamNEON(pck, pParsedBytes);
      } else
-+#endif // HAS_ARM_NEON
++#endif // __ARM_NEON
  #endif
      {
          return ParseByteStreamC(pck, pParsedBytes);
--- 
-2.51.0
-
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
index a403278699..89d052dbdf 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -6,7 +6,7 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "1.4.4.0":
+    if d.getVar("PV") != "1.4.4.2":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.2.bb
similarity index 94%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.2.bb
index 4d2f223a39..0ae7119535 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "03c0746a55b78eab63c664a11948b52419e1f309"
+SRCREV_vk-gl-cts = "aa481ab6eb66a1c74768fabec453ea6e60f0ee0e"
 
 require vulkan-cts-sources.inc
 

