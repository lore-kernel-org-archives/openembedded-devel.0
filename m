Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1E9CCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 18:57:57 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.41031.1761591469360762832
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 11:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lRRBnbRf;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RIvmkk1325226;
	Mon, 27 Oct 2025 13:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761591468;
	bh=6CprUTY5/8xBz5D+o6KUzMn8qWMqHPBGrNg2bllZafY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=lRRBnbRfVNXzbNnHElXPyPZreLSvN3ol/snKvhGI+Y7UY/XGpt7hazSwdMr0kn72u
	 iiZut0jG5ulOVjS8OAhcgG7mj+I0n1fPQnjnDS1I258w2UaTr4fCFhH7j6lOQkQEdc
	 Ti5NKiigiAisI8QxQZJAx4mIYAxGjOTXWSa/R4t8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RIvmtL1845025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 27 Oct 2025 13:57:48 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 27
 Oct 2025 13:57:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 13:57:48 -0500
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RIvmWl1135332;
	Mon, 27 Oct 2025 13:57:48 -0500
Message-ID: <084fe444-a176-4bf4-b262-0b914b7770df@ti.com>
Date: Mon, 27 Oct 2025 13:57:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] vulkan-cts: upgrade 1.4.3.3 -> 1.4.4.0
To: <dmitry.baryshkov@oss.qualcomm.com>,
        <openembedded-devel@lists.openembedded.org>
References: <20251022115730.4037373-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251022115730.4037373-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 18:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121055


I'm seeing compile issues with this version bump patch on 32bit builds.


.../work/armv7at2hf-vfp-oe-linux-gnueabi/vulkan-cts/1.4.4.0/recipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/15.2.0/include/arm_neon.h:11019:1: 
error: inlining failed in call to 'always_inline' 'uint8x16_t 
vld1q_u8(const uint8_t*)': target specific option mismatch
11019 | vld1q_u8 (const uint8_t * __a)
       | ^~~~~~~~
.../work/armv7at2hf-vfp-oe-linux-gnueabi/vulkan-cts/1.4.4.0/sources/vulkan-cts-1.4.4.0/external/vulkan-video-samples/src/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp:22:36: 
note: called from here
    22 |         uint8x16_t vdata = vld1q_u8(pdatain);
       |                            ~~~~~~~~^~~~~~~~~


A bunch of these errors.

I've been staring at it and looking at the header and the source and 
cannot for the life of me see what the compiler is complaining about...

If I revert this patch, the previous version (1.4.3.3) still builds fine.




On 10/22/2025 6:57 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Upgrade Vulkan CTS in order to pick up tests for new extension and also
> some fixes or old tests.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   ...01-decode-fix-build-on-ARMv7-targets.patch | 33 +++++++++++++++++++
>   .../vk-gl-cts/vulkan-cts-sources.inc          | 15 ++++-----
>   ...n-cts_1.4.3.3.bb => vulkan-cts_1.4.4.0.bb} |  4 ++-
>   3 files changed, 43 insertions(+), 9 deletions(-)
>   create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-ARMv7-targets.patch
>   rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.3.3.bb => vulkan-cts_1.4.4.0.bb} (80%)
> 
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-ARMv7-targets.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-ARMv7-targets.patch
> new file mode 100644
> index 000000000000..d8680a292b38
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-build-on-ARMv7-targets.patch
> @@ -0,0 +1,33 @@
> +From 16d72de3280410b185f33e489727761096a2e6e4 Mon Sep 17 00:00:00 2001
> +From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +Date: Wed, 22 Oct 2025 14:34:22 +0300
> +Subject: [PATCH] decode: fix build on ARMv7 targets
> +
> +Building NEON code on ARMv7 fails with the following error:
> +
> +...../src/NextStartCodeNEON.cpp:39:57: error: cannot convert 'uint8x8_t' to 'uint64x1_t'
> +
> +Add missing vreinterpret call in order to fix that error.
> +
> +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Video-Samples/pull/109]
> +---
> + vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp b/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp
> +index f1a3381d7122..2c695a924ebd 100644
> +--- a/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp
> ++++ b/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp
> +@@ -36,7 +36,7 @@ size_t VulkanVideoDecoder::next_start_code<SIMD_ISA::NEON>(const uint8_t *pdatai
> + #if defined (__aarch64__) || defined(_M_ARM64)
> +                 uint64_t resmask = vmaxvq_u8(vmask);
> + #else
> +-                uint64_t resmask = vget_lane_u64(vmax_u8(vget_low_u8(vmask), vget_high_u8(vmask)), 0);
> ++                uint64_t resmask = vget_lane_u64(vreinterpret_u64_u8(vmax_u8(vget_low_u8(vmask), vget_high_u8(vmask))), 0);
> + #endif
> +                 if (resmask)
> +                 {
> +--
> +2.51.0
> +
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
> index 6a8d781447eb..a40327869958 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
> @@ -6,20 +6,19 @@
>   RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
>   
>   python __anonymous() {
> -    if d.getVar("PV") != "1.4.3.3":
> +    if d.getVar("PV") != "1.4.4.0":
>           bb.warn("-sources.inc out of date, run refresh_srcuri task")
>   }
>   
>   SRC_URI += " \
>       https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/external/renderdoc/src;sha256sum=e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e \
> -    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=f06e0f3d2e5acfe4b14e714e4103dd1ccdb237e5 \
> -    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=963588074b26326ff0426c8953c1235213309bdb \
> -    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=6d0784e9f1ab92c17eeea94821b2465c14a52be9 \
> -    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=112aee75d162412a4623e7d22a3de52e0233cbf5 \
> -    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=6ae58a2b17b2bcebdc5377995007391b85ffa10f \
> +    git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-tools/src;rev=b8b90dba56eb8c75050a712188d662fd51c953df \
> +    git://github.com/KhronosGroup/glslang.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/glslang/src;rev=38f6708b6b6f213010c51ffa8f577a7751e12ce7 \
> +    git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/spirv-headers/src;rev=97e96f9e9defeb4bba3cfbd034dec516671dd7a3 \
> +    git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-docs/src;rev=9c6d565f72ba6929c239c3e20f90b6375acad3bd \
> +    git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=68e4cdd8269c2af39aa16793c9089d1893eae972 \
>       git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=57ba1ca211b6f4890c013dcf42cb16069ae916dd \
>       git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
> -    git://github.com/Igalia/vk_video_samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/nvidia-video-samples/src;rev=45fe88b456c683120138f052ea81f0a958ff3ec4 \
> -    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=a22e0084e6f38a16dc0dcebb4c19a14651a6665b \
> +    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=56a40ba4199e5500b2a7540c15dc139fc4b19595 \
>       git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
>   "
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
> similarity index 80%
> rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb
> rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
> index ca653aad132b..465ac981f90a 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.3.3.bb
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
> @@ -2,10 +2,12 @@ DESCRIPTION = "Vulkan CTS"
>   
>   require khronos-cts.inc
>   
> -SRCREV_vk-gl-cts = "f36967dd19034bdfe30e5cb21544079078c154d1"
> +SRCREV_vk-gl-cts = "03c0746a55b78eab63c664a11948b52419e1f309"
>   
>   require vulkan-cts-sources.inc
>   
> +SRC_URI:append = " file://0001-decode-fix-build-on-ARMv7-targets.patch;patchdir=external/vulkan-video-samples/src"
> +
>   # Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT
>   OECMAKE_CXX_FLAGS:remove:toolchain-gcc = "-O2"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120894): https://lists.openembedded.org/g/openembedded-devel/message/120894
> Mute This Topic: https://lists.openembedded.org/mt/115890764/6551054
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


