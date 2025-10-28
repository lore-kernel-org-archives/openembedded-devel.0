Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E5CCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 13:25:58 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.18])
 by mx.groups.io with SMTP id smtpd.web10.11564.1761657954931446681
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 06:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VgvBB+eu;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.18, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTSWoaeXSTKDXa3pmG9s029fpJAdvqeHPKlAhBWkGQyM1IjcnMHtuJzt2vk1+tU+XOg70WyfH37RblH8Cqjkx0CKDT/RkJnIRVaqoomz0l+HLlbxfQZiv9eSVUSK7aHcIHRP9fQEtEUKFL6rGbhWFU1/B1lpU3HQDDXizrqnp05vmshRaiUBWDhgCgNSx1i2HcHA3o8O1IKwiSv943wDHPU6pF26N9F5ezJFLBIuaMz+66WuDQILjBfHjIfHMNYocRe/OfREPDsPoCOarMQQ4Yr6ApxhH1SepeYJwo60NliSRj10aEFugujAkRH6KxRxPkufnY1g8x07Mki0jFdCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVSvbix001JwrTkRfmRTeR9wj2zsayPY8dfNzyKOJ/A=;
 b=eKwp7GMfCoaSFYhpmxXDeQgLDhn3pa2ar0FcWbUiu7Fvq7OorBdSNSrX0RCfBs9wlYNHapLorHtbR2v4R3DmHwCOTpAYfG8PRFe49TmtVKKZVEGvSI5qdZai2ap5nScCdZzrqz2lAgYuKzLLVTx4Vq2enJVb4ySfc0BIVVw+B2md0SR0dqW90ZKBCwHKtCACdXbOBstr8k2zSMt05gYeS4onKvgATv4Duy5Rlwblo4tmituFbzDcQe5qkLr43uJ9RuCRE+L9ht7IJyi40fXjGsBqfxHzIPFhvadVvaEoLa1l3sJK0q1TW0I8Rd2Ha0ucA7YoTpy1qXRoGgOniLd4Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=fail (p=quarantine sp=none pct=100) action=quarantine
 header.from=ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVSvbix001JwrTkRfmRTeR9wj2zsayPY8dfNzyKOJ/A=;
 b=VgvBB+euc+DFGZIvo7awtT3E3vdQudWfA9+DGbe5rbQ3xfJujS2orjQ686g2U9gflxsTkEmd89nZ5V2Xefeeuq7SvqqZUYQtbFYhc3zNIMlQ1DbxUyBRelZNrO7saBO/Osiv92d2jPjY1aZA0ju/UDnX95K+JsvIH6ECu/I+e+M=
Received: from SN7PR18CA0011.namprd18.prod.outlook.com (2603:10b6:806:f3::19)
 by CY8PR10MB6801.namprd10.prod.outlook.com (2603:10b6:930:98::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 13:25:50 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::69) by SN7PR18CA0011.outlook.office365.com
 (2603:10b6:806:f3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Tue,
 28 Oct 2025 13:25:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=fail
 action=quarantine header.from=ti.com;
Received-SPF: Fail (protection.outlook.com: domain of ti.com does not
 designate 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com;
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 13:25:48 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 08:25:48 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 08:25:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 08:25:48 -0500
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59SDPmJk2364060;
	Tue, 28 Oct 2025 08:25:48 -0500
Message-ID: <2c4a446c-4c0f-4524-812b-287d955dec4c@ti.com>
Date: Tue, 28 Oct 2025 08:25:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] vulkan-cts: upgrade 1.4.3.3 -> 1.4.4.0
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <openembedded-devel@lists.openembedded.org>
References: <20251022115730.4037373-1-dmitry.baryshkov@oss.qualcomm.com>
 <084fe444-a176-4bf4-b262-0b914b7770df@ti.com>
 <CAO9ioeVwptKogTEfAjzBumtXL7ncVjb_8D6wZNpT4ei9+XZxpA@mail.gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAO9ioeVwptKogTEfAjzBumtXL7ncVjb_8D6wZNpT4ei9+XZxpA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|CY8PR10MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: d3fbf922-937b-4b05-8b07-08de1625823e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|34070700014|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S2tZVzQ4YTdxWWdLRm1SWG44dHNHQ1ZqU0o4NmZqVE9PWHlad1NRcVlRT1BU?=
 =?utf-8?B?YUxqbEZoQXh5WU9jUEJIclBBS3MwUjlZaXg0NTlLQUI0TDk5M2hhM0p2OUVS?=
 =?utf-8?B?YllCU3JoTStsVXhLUTBLc2JPWGJhOE0yRXkrRElwdVR6K0FIcWNocWJMLzVn?=
 =?utf-8?B?WnFnN3ZuWEdBMW1oVVU4K0lrcUNYakJiYlZhTHlnUEVjNlI0bHJIQVRzcHMv?=
 =?utf-8?B?MkUxSWJGTTBoNWFkVjM0cFVrZWdnZlliY09yWmMrSWgzaTdGNEhwcGRYck5x?=
 =?utf-8?B?U1hPZU1PelgrbW1DRUFvRUNVcnRSVkh4RFMxcUFCem1aUC93RTkwZlczeFE1?=
 =?utf-8?B?WUxSRXR6VURMOWg0bFNFSWlkVnVUUk50dURhbWJPYUFyQWxMOTVtN0dkZ29Y?=
 =?utf-8?B?TXVKZVpBVU9ESXZwRkwreWhrblFjdXhKbUROV0JDK25IS0RVSEtNRU5jeVVB?=
 =?utf-8?B?aWlYdVltWGs0Y2hrVy85MExSVlR6K1NOTWhHcjhSazYwVy9FSlliZ2REdHR6?=
 =?utf-8?B?Zjc0dnBlbUFXYnF5K1RYS3hMMXV6VFcreEpBYzJsUzdTS3lmUVFRUy8rc1NG?=
 =?utf-8?B?cWJOTnA0OThPTVlVUFRQc2hCZE5pNWYrc2UzRWdONUNsQ1E1TlFTU2lYakVT?=
 =?utf-8?B?NHI0bXFxWWtYNDF5d2k4djZrZnNSMTJ4MkxCNXRBR0FXSXkvV1FKdit3YUVN?=
 =?utf-8?B?ZU5TaU9HUnFSKzNEN2ZKb3p2YWJKaGwrYkNBNFFDUGJUdHZRb2pMeXVVb1Av?=
 =?utf-8?B?S2hNQXlGeVUwNW1rb1p4aU56dFJnV0lxU2FyRjRvZForYjRHU3lqMlRUaHEy?=
 =?utf-8?B?SHAwTTZoWGx1WkJqTytvNTV6VVJrMlBib3gyMkptY3c1S040ZTYrWEFPZkMv?=
 =?utf-8?B?Kzk1czN3RUdzOWMyUVIrM1JNUlNZMUdENmdHKzlRdDBKZitQZ1BBWjdEZDcw?=
 =?utf-8?B?dmdsbmlpOXRkYytYUXg3a0Joc1RHamR6L0k4R0MvYVl4S0VZSWdJRFd6eXNE?=
 =?utf-8?B?ZEI1YTZRMkxpTEhYTVFOa1hWalZ3b3orenVBdTl3V1pOTTY5QlQzMDQvS1ox?=
 =?utf-8?B?aXhvbjlGYzlPdHh2emdXYWE3dVZpNjhYYUNwbWlmM2h3VytMUXAzNnZwVUNL?=
 =?utf-8?B?TUtYODAzYlZjeDh6SlpwYmQzSERUSnJiSUgzcXBQcTRkSE5BcUthcFhCbkM0?=
 =?utf-8?B?MmRyaHFaREdkSDlXeFFOSWlwMktYMDZZUVpBcXZHYitnR1pMeXRmK21OaUdM?=
 =?utf-8?B?UTlDT0sxcUsvbFgwN3JpcUdpTFB0ck1wd3JuQ29hZjRHQ292aldMTGUrbFRL?=
 =?utf-8?B?dFpNL09RcVV2Y0hLbjU4V0Q5dnEzVjMrS0dFWk5nRUpNWGI3bjFqdzNNOGE2?=
 =?utf-8?B?WUU4Sm1UdW0wSndkd3dtUlJRa1pUcHBvV0h6ZjNENkxBZXU0RVZKUndXQVFo?=
 =?utf-8?B?SEVEbWFTYlhrZkk3VC9INUR0d0J5RTlNdUUzUThqaUZPYkQwME0zUjRNalZN?=
 =?utf-8?B?RGExNnp3U2kzTklwckV4b2RiNG81b2hwK0krbXoxZVpjRjV5OFF1dUNqMzNu?=
 =?utf-8?B?SGR2bnBuaHh6MlQwWmhMU1hQcUh1UGZIVjZ6d3ZJL1VWNlJJT25OUndqaEgr?=
 =?utf-8?B?WVhQcW55Q0ltSU9MNm93eng0RWs3cjEydDYySExZWFdIeEpVSDNFQWRlZHhM?=
 =?utf-8?B?aGFIdThhaUVRSXNsczQ4VGdIWTVTZzZoUXcwUS9CUzlieWNId0tOT1hxKzJ5?=
 =?utf-8?B?M0s3QURmd2I3YjR4aDRGWnhORTNJWlFNenB1YjJZWGtrNWlDaXZ3SXVnSThE?=
 =?utf-8?B?SDlYVjVuSWo0NTYwdnNNOFlwaFkvcWZ4TWtyUUdDd3NWTG9DZGQySVN5b1Jy?=
 =?utf-8?B?elNSUEJZQ2lSVmVKZFFTUlFiUVI2VldSYkE1eXlqR2VlTFljM2hNb2JSTlBy?=
 =?utf-8?B?NEdlakVQNlVjSHAybFhUck9ibEFONHU2amhlcHpQWjhmbGEzdTkyMFRUeTNp?=
 =?utf-8?B?V2ZqOCtBSUlOTW1MWnFqRWpKVVFORXJYa1lmbS8yVmFDaFZ4MU1DWU5DV3Rn?=
 =?utf-8?B?VVJ2amFrUEpicGVpQ1pQQ0dlTlVVRFY0UXZFZ0NoVU9BeVNrdzRCQnNFOGlI?=
 =?utf-8?Q?9Wlc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(34070700014)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:25:48.7542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fbf922-937b-4b05-8b07-08de1625823e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6801
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 13:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121091



On 10/28/2025 6:55 AM, Dmitry Baryshkov wrote:
> On Mon, 27 Oct 2025 at 20:57, Ryan Eatmon <reatmon@ti.com> wrote:
>>
>>
>> I'm seeing compile issues with this version bump patch on 32bit builds.
>>
>>
>> .../work/armv7at2hf-vfp-oe-linux-gnueabi/vulkan-cts/1.4.4.0/recipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/15.2.0/include/arm_neon.h:11019:1:
>> error: inlining failed in call to 'always_inline' 'uint8x16_t
>> vld1q_u8(const uint8_t*)': target specific option mismatch
>> 11019 | vld1q_u8 (const uint8_t * __a)
>>         | ^~~~~~~~
>> .../work/armv7at2hf-vfp-oe-linux-gnueabi/vulkan-cts/1.4.4.0/sources/vulkan-cts-1.4.4.0/external/vulkan-video-samples/src/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp:22:36:
>> note: called from here
>>      22 |         uint8x16_t vdata = vld1q_u8(pdatain);
>>         |                            ~~~~~~~~^~~~~~~~~
>>
>>
>> A bunch of these errors.
> 
> What is your target machine? I tested this with qemuarm, there are no
> build errors.


meta-ti-bsp, am57xx-evm is what I was testing with, but it's occurring 
with all of our 32 bit platforms.


>>
>> I've been staring at it and looking at the header and the source and
>> cannot for the life of me see what the compiler is complaining about...
>>
>> If I revert this patch, the previous version (1.4.3.3) still builds fine.
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


