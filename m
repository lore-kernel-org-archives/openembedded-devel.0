Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8C1CCF9F0
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 14:44:48 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.1])
 by mx.groups.io with SMTP id smtpd.web01.7563.1761749082084663142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 07:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=WnSl671G;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.1, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUimD0+iwKfcjCqegiwAXChX1AEhCQFjStxERR92TxbXV3SHs44v31un1H6SSOqFRxoYLHv/vEtRfUP91r1Up0U29FxlV25daEgaYIv7v9QqsYW9qLU9Trv898Y/6Y5XrYuvwxq2xnAPz9l3CXGYGhyHwfHxKihy4bPJ9iDCF/hLug2qSi3fnBeB9YxPRAkPFnDuQ6lOdaxinNEAyLnVWwOLbn7yzd6Jhh4q3DG40EutJehHHbjXTk5DFi26plvUii8PI+dQAbhdJjLsYkRFuGzsT/e+dcpbNAPp8tkWcDhfVZ4yvTY/L7SbhCVEWvZmUQk2FUdbCCgCwt0AiWdM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xic5ht4R6y9ognZhNMCzScwtgR0tSHuIEC1BZfxmn58=;
 b=ZzHfYk6LeXt+1dcB9cqrs7BVBlCWXjwEg+TEpyHamPY4PFPMqQxgFea82JvEnBpeEgNfI30YfGKymorRyWVnoHXSbmf5uR05AV0M+3QLcG2PYIKQewH3dY8SaJt7dJWcaLD2MU6vULYaEQ/kVx6KUecO75oJt41+XMfXe5SLp4dePSePUU/H8kpZqdEgUhwChtfGz22cyh7ZPfAufdNuKVbeaHW5XU+MR3AHvQScUr+qX0u4M8Ppxb2g8Hj46A+LcazHYUc5uPND3JkHGPNGUTg5seDWOUMpy5cjRtp5XkxXO55CAm+HMSGr0JWLOe8IsdVW9ee9AzTVclsf9lIUKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xic5ht4R6y9ognZhNMCzScwtgR0tSHuIEC1BZfxmn58=;
 b=WnSl671GqLqIA7wkojVNERThV2sS03h1ZNqQRurzbIcqUGIuZ+lUoPdNB7fnblBzUkWqXPB9iWzTSNwL21IGcB7CJnJBg1oNd14HHPSU3Ujs6/8SI+ZRnAaj/P4Kjx1v4+5VaWUqK3Oi8lX/i62po5O9JRN/3YfRSpJWSTsBf/I=
Received: from MW4PR03CA0048.namprd03.prod.outlook.com (2603:10b6:303:8e::23)
 by CY5PR10MB6263.namprd10.prod.outlook.com (2603:10b6:930:41::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 14:44:40 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::69) by MW4PR03CA0048.outlook.office365.com
 (2603:10b6:303:8e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.17 via Frontend Transport; Wed,
 29 Oct 2025 14:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 14:44:39 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 09:44:34 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 09:44:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 09:44:33 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TEiXfj4185678;
	Wed, 29 Oct 2025 09:44:33 -0500
Message-ID: <5a6285d1-b614-42aa-84f6-0ecf73970f45@ti.com>
Date: Wed, 29 Oct 2025 09:44:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH] vulkan-cts: fix building for ARM targets without
 NEON
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20251028223312.587426-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20251028223312.587426-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|CY5PR10MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: f901118b-d951-4fee-42ec-08de16f9b067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bnEwVkF4d0lKYkRtRjZQY0NkZm9TaWZScklwWnJWWms1cXBNZC8rS0dyZVk3?=
 =?utf-8?B?OVpQaXhWUDIvMko0TVdZRG5hN1hXQ09lTFlSYW13MkpsU2dMTzlmeXFPS3dh?=
 =?utf-8?B?ellaRkdmcFR2UEFoNWhGdTlwMUFJNkR3UllNTG82L1JvVVgzWkVYWGpzQm5k?=
 =?utf-8?B?SDBtR29nQ05DeHdQOGloMEs2czhXMmdDOEtsSHppdkZpR2t1ZFY2R1IwQWs3?=
 =?utf-8?B?dVJZY3AwNjcwZTBjSXVaTFI0K0dwVmdrUWxvT3J0aHkrazRIZDFPTXZpbWZL?=
 =?utf-8?B?eEtUVnJQS1VKSUZ3Rkc3UVVHMlFUL3VQdWRkcGxtWGF0TldNSml4SXZaWktE?=
 =?utf-8?B?YkVRaFZsUGoxWUd6bE8raDM5dVNVd292RXFUM2tGSlAyZXl4MDhwZGo2Nlo1?=
 =?utf-8?B?bmtsMDZBSmpzRW1lcWlNc1FXdEswRTZOTHdFWFRsZGVCRVRHcGIzOVlKOG9u?=
 =?utf-8?B?RkV5a3BHSGFRdGhPeU45aitPOGp1clYvLzlOeEthQkZVcm94dG9MekQyOGVD?=
 =?utf-8?B?RHVqZDNsMG1hY3IraUk2ZWF5QUdSWmJEUFNDdXBTN0xVcUNpLzRUdmpYWU90?=
 =?utf-8?B?LzhaUDh1M1lhK0t3V2NZUWxlSm1aMzZxaXpSaHF6b2J3S3BTOStGTS9waE9y?=
 =?utf-8?B?RmJWczRKUGtjTVpmSnpKWXYzYThUT2ZLYmk2dXVwQlE0eXJaUmFBa2FDc1Uy?=
 =?utf-8?B?bG5DNnUwN2Q2QWdUOC9RaTlYUUFVOGlhc25FeFFmQkNvRU0rck9aeUJwaWlh?=
 =?utf-8?B?cU1kc2xzbEU3aFdvNmNTMkIycG9NRGRBaTZVZERtWWw5SjdLTTR2eUZyQ3ky?=
 =?utf-8?B?K1JHbWE4eHpCb1BCeGQ0aWJqNlI4bThPdEU4YTFJZHBmOFY4c3gwSldqNWJH?=
 =?utf-8?B?dzZXY3NuZEJaSFh6cEtFNWJxZkQyamhmYUVuUkJhaURFUEZicWNoa1lNejY5?=
 =?utf-8?B?VEI3MGl0dG5nenRkYW81Q203VHhvci84MzZCd1JPRmdCVDhYRGJTNmlaNkRK?=
 =?utf-8?B?TzArZE92ZTA2L2R3cHRXMHFPSmVxcHdsd2ZETHE2MmxPNnJJVG1LZWlaQmpl?=
 =?utf-8?B?TlQ1bDZZQW1NTHVaOUp1RDhaUGc0YitpV1VNVnE3WU9jQ3VpcE1DQ0F6VzhM?=
 =?utf-8?B?ZXUvMkV4Zzh4VnZmVWg5NC9OSXNVb1piY3hNQ0pZc1dsWkhobVE1cWZVVW80?=
 =?utf-8?B?ZkFsVVJQTW1hR0lHTDhSZS82R3VHSDFuZGtmUm5OakpJNlFWREFJUS82VTU2?=
 =?utf-8?B?a3JTVlVjamxQMzUzanF5SVA4d2t6MUZVZHZXTEo3Q1hzVzRiWDFjWHl5cmxr?=
 =?utf-8?B?RmNqNGpCc0ZwblVjbW9ZSkErN2E5UmM0am5XTCt5WnhNMEVxMThXMHdLdDNr?=
 =?utf-8?B?ZjRFQW1TQitPQWpQcUFDQ2xWQ0VMYTE0K2ZGWDJlSFhrbEIxQjAvc3RQZVZr?=
 =?utf-8?B?cDFHMWplMmlRa2JkNlFRUWh3ZDZUL2ZNYVN1a0EwdGxLWnd6cUthdVE4aWNp?=
 =?utf-8?B?OUpLRS9uUlJHR2xaSzliOWxTUTZheGphSVYrMjhyNGY3RVhpSmlMWGplZ1E5?=
 =?utf-8?B?Ni9sZGdoeHppTTExUWhHRXdvaEtOdXJqZDVKT2tKWjlWVXp2ZXN3cCtvOVdI?=
 =?utf-8?B?Wkd3aWVqeFpsNjJMclBkK3pzck0yNmIwcXczWm5wVThIV2V5WHdrOWlCZm4y?=
 =?utf-8?B?eDUvS2JnRDhWbzFhVkZSbjFJN0pPck5YYW1GMkdzY0FhMW1rdkduNytEcklX?=
 =?utf-8?B?VHlVdldwNGsrTGlDNng1TXZIeHljOW9BNm94MTB2OWR6czRFVDNrSm04SUhF?=
 =?utf-8?B?SjFhaEF6czhFQ2FCYUtBaWNWWjgvY3ZtUUgwSHRHcXZrdDExenVPNVVLekgr?=
 =?utf-8?B?Wk9TZzAxcTFuNFdkMlhXdTUwY3lXZ09INmt1azdBWFo1NnhuUWpxTWNodXEw?=
 =?utf-8?B?bUZ2eFJxM1lFSXV2NlN2ek1hcitnODYyazFKQVdBNExlbmNLR1U3cmxJRjJO?=
 =?utf-8?B?T2Q1Yk55Y05IN0JkY0xHUjJNMzdtQ0VaUHk5Qlp6WUpaQll0bGFlOWxyejFC?=
 =?utf-8?B?TUZodk1VMHBUeS92dlF4R0R5bTAreVllYVlRdTZUckpNWHp5YjhpUk8wWk9s?=
 =?utf-8?Q?LCjs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 14:44:39.4115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f901118b-d951-4fee-42ec-08de16f9b067
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6263
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 14:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121157



Verified this fixes the issue.  Thanks!


On 10/28/2025 5:33 PM, Dmitry Baryshkov wrote:
> Pick up a patch make Vulkan CTS build on ARM hosts without NEON.
> 
> Reported-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   ...ing-for-non-NEON-enabled-ARM-targets.patch | 89 +++++++++++++++++++
>   .../vk-gl-cts/vulkan-cts_1.4.4.0.bb           |  5 +-
>   2 files changed, 93 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch
> 
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch
> new file mode 100644
> index 000000000000..d51ccafc9427
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch
> @@ -0,0 +1,89 @@
> +From 95b4ea5b8a5044fed7aeb1c279eddae709a6ce5f Mon Sep 17 00:00:00 2001
> +From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +Date: Tue, 28 Oct 2025 19:27:21 +0200
> +Subject: [PATCH] decode: fix building for non-NEON-enabled ARM targets
> +
> +Building for non-NEON ARM targets fails with the cryptic message. Verify
> +that it is possible to build NEON code at all.
> +
> +.../work/armv7at2hf-vfp-oe-linux-gnueabi/vulkan-cts/1.4.4.0/recipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/15.2.0/include/arm_neon.h:11019:1:
> +error: inlining failed in call to 'always_inline' 'uint8x16_t
> +vld1q_u8(const uint8_t*)': target specific option mismatch
> +11019 | vld1q_u8 (const uint8_t * __a)
> +       | ^~~~~~~~
> +.../work/armv7at2hf-vfp-oe-linux-gnueabi/vulkan-cts/1.4.4.0/sources/vulkan-cts-1.4.4.0/external/vulkan-video-samples/src/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp:22:36:
> +note: called from here
> +    22 |         uint8x16_t vdata = vld1q_u8(pdatain);
> +       |                            ~~~~~~~~^~~~~~~~~
> +
> +Reported-by: Ryan Eatmon <reatmon@ti.com>
> +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Video-Samples/pull/112]
> +---
> + .../libs/NvVideoParser/CMakeLists.txt          | 18 +++++++++++++++++-
> + .../NvVideoParser/src/VulkanVideoDecoder.cpp   |  2 ++
> + 2 files changed, 19 insertions(+), 1 deletion(-)
> +
> +diff --git a/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt b/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
> +index 84251ed60ab9..65da635e2929 100644
> +--- a/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
> ++++ b/vk_video_decoder/libs/NvVideoParser/CMakeLists.txt
> +@@ -65,6 +65,13 @@ check_cxx_source_compiles("
> +   #endif
> + " IS_ARM)
> +
> ++check_cxx_source_compiles("
> ++  #include <arm_neon.h>
> ++  uint8_t *pin;
> ++  uint8x16_t vdata;
> ++  int main() { vdata = vld1q_u8(pin); return 0; }
> ++  " HAS_ARM_NEON)
> ++
> + check_cxx_source_compiles("
> +   #if defined(__x86_64__) || defined(_M_X64) || defined(__i386__) || defined(_M_IX86)
> +   int main() { return 0; }
> +@@ -85,6 +99,7 @@ if (IS_AARCH64 OR (CMAKE_GENERATOR_PLATFORM MATCHES "^aarch64") OR (CMAKE_GENERA
> +     set(SVE_CPU_FEATURE "-march=armv8-a+sve")
> +   endif()
> +   MESSAGE(STATUS "Parser optimizations selected for generic ARM NEON")
> ++  add_compile_definitions(HAS_ARM_NEON=1)
> +   add_library(next_start_code_c OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeC.cpp include)
> +   target_include_directories(next_start_code_c PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
> +   add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeNEON.cpp include)
> +@@ -102,7 +117,7 @@ if (IS_AARCH64 OR (CMAKE_GENERATOR_PLATFORM MATCHES "^aarch64") OR (CMAKE_GENERA
> +     target_link_libraries(${VULKAN_VIDEO_PARSER_LIB} next_start_code_c next_start_code_neon next_start_code_sve)
> +     target_link_libraries(${VULKAN_VIDEO_PARSER_STATIC_LIB} next_start_code_c next_start_code_neon next_start_code_sve)
> +   endif()
> +-elseif (IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES "^arm") OR (CMAKE_GENERATOR_PLATFORM MATCHES "^ARM"))
> ++elseif ((IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES "^arm") OR (CMAKE_GENERATOR_PLATFORM MATCHES "^ARM")) AND HAS_ARM_NEON)
> +   MESSAGE(STATUS "Parser optimization for ARM ${CMAKE_SYSTEM_PROCESSOR}")
> +   if(WIN32)
> +     MESSAGE(STATUS "Parser optimizations selected for WIN32 VFPv4")
> +@@ -111,6 +126,7 @@ elseif (IS_ARM OR (CMAKE_GENERATOR_PLATFORM MATCHES "^arm") OR (CMAKE_GENERATOR_
> +     MESSAGE(STATUS "Parser optimizations selected for UNIX armv7-a+simd")
> +     set(NEON_CPU_FEATURE "-march=armv7-a+simd")
> +   endif()
> ++  add_compile_definitions(HAS_ARM_NEON=1)
> +   add_library(next_start_code_c OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeC.cpp include)
> +   target_include_directories(next_start_code_c PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
> +   add_library(next_start_code_neon OBJECT ${CMAKE_CURRENT_SOURCE_DIR}/src/NextStartCodeNEON.cpp include)
> +diff --git a/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp b/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
> +index 83b968ef55df..eced7fcd7bba 100644
> +--- a/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
> ++++ b/vk_video_decoder/libs/NvVideoParser/src/VulkanVideoDecoder.cpp
> +@@ -335,10 +335,12 @@ bool VulkanVideoDecoder::ParseByteStream(const VkParserBitstreamPacket* pck, siz
> +         return ParseByteStreamSVE(pck, pParsedBytes);
> +     } else
> + #endif //__aarch64__
> ++#if defined(HAS_ARM_NEON)
> +     if (m_NextStartCode == SIMD_ISA::NEON)
> +     {
> +         return ParseByteStreamNEON(pck, pParsedBytes);
> +     } else
> ++#endif // HAS_ARM_NEON
> + #endif
> +     {
> +         return ParseByteStreamC(pck, pParsedBytes);
> +--
> +2.51.0
> +
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
> index 465ac981f90a..4d2f223a39b6 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.4.0.bb
> @@ -6,7 +6,10 @@ SRCREV_vk-gl-cts = "03c0746a55b78eab63c664a11948b52419e1f309"
>   
>   require vulkan-cts-sources.inc
>   
> -SRC_URI:append = " file://0001-decode-fix-build-on-ARMv7-targets.patch;patchdir=external/vulkan-video-samples/src"
> +SRC_URI:append = " \
> +    file://0001-decode-fix-build-on-ARMv7-targets.patch;patchdir=external/vulkan-video-samples/src \
> +    file://0001-decode-fix-building-for-non-NEON-enabled-ARM-targets.patch;patchdir=external/vulkan-video-samples/src \
> +"
>   
>   # Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT
>   OECMAKE_CXX_FLAGS:remove:toolchain-gcc = "-O2"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

