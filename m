Return-Path: <chanh@os.amperecomputing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E77CD0BB66
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 06:52:35 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.194.110])
 by mx.groups.io with SMTP id smtpd.web10.8642.1729752745735959238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 23:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-amperemail-onmicrosoft-com._domainkey.amperemail.onmicrosoft.com on 100.100.100.100:53: no such host" header.i=@amperemail.onmicrosoft.com header.s=selector1-amperemail-onmicrosoft-com header.b=TqW3nBy4;
 spf=pass (domain: os.amperecomputing.com, ip: 40.93.194.110, mailfrom: chanh@os.amperecomputing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODobNAh1IGmC/IR1lWa1BkzdG8mHSIltI5MFEvn0rmUhm8haqHct5v7oXljvg0BQV5N0R2awJXrRgzWKspBkT9vEUXVnXfrJhvV+4YOwqHVwqWREBwZ6D48jFwcoqgE/4BIwOit70FH3IGlzZ9X3Vv78ad8aDNch13Gvqa8kpeuicGIDdqaAzKrW70D0SJJ4Y3xdZd0Txgu89Tk0brQK54WcKF5M2Mg4hOgIkKsSxlvlvvfu9R0ASfAktC6bl8Vw0YAYJr3nNWWQa7xGMvIjBnJfhofQgKfEkl80OSZjiHj8j3ICTv4qYBIk6N34g4p/DNsdTZcb9gswSEIR+Ehv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGtxFtF+n6FlZjguPNLDOfxBIP44sERXK5ytvbA0raw=;
 b=iXe8effoxRndEDsB3Ct4n23VPW9e9drqO0xLG/+OM9USoCv9EtzteHxSFsttkTNJP+KxD1JODkVOccPhMeUNCY5xoMveCsQ7OLkGNTX/lco7or8nrZublv8nXgJHXjnQtVYuv9R+CC4IRwMxOVHg7qXixGDq30atLgx5pbekwuoksUev0UtvUPfx9Q2Sc8GVh9CQwhRT1vLV1bbIqx9ay/TfhLIPdk4VIEo9ShgcVBA2R5K13YLeLzXGQgjp0hAtZuv6qedGG0C4uxJppUitwa3K5fo5mLbKbxoa/Cg5xFqJsYTSYJDWvfl8Q2MFgyD4GoZJSV4WHdFw2qHXkAilWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGtxFtF+n6FlZjguPNLDOfxBIP44sERXK5ytvbA0raw=;
 b=TqW3nBy474rucOYj5h4at+4a2W7PDzXCJgUhHBSE0t/scCDccPPyI2Koof4vNauD9oStAPAm8FB4tk63XxP0UYU2tzhxyNZZUocI5JvmboEfaV8tgs2GZmmV0YiXH5SvnnsYQ/4/fBUWsZdEptn1HkB51KY6Uxb3gc9dkgRLLzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 BL3PR01MB7100.prod.exchangelabs.com (2603:10b6:208:33b::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.17; Thu, 24 Oct 2024 06:52:20 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 06:52:18 +0000
Message-ID: <38e5da48-fc0e-4685-b615-992a1f78dd45@amperemail.onmicrosoft.com>
Date: Thu, 24 Oct 2024 13:52:10 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-networking][PATCH] mctp: Fix CI build error with musl+clang
To: Chanh Nguyen <chanh@os.amperecomputing.com>, Khem Raj
 <raj.khem@gmail.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 openembedded-devel@lists.openembedded.org
Cc: Thang Nguyen <thang@os.amperecomputing.com>,
 Thu Nguyen <tbnguyen@amperecomputing.com>
References: <20241024065109.74010-1-chanh@os.amperecomputing.com>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <20241024065109.74010-1-chanh@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|BL3PR01MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 3006d5db-9ad3-4f79-fe62-08dcf3f866c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T2t5Nk9NU3Baa1NxekZHUVVxb3NCRU4vVHFGMEl1TDlSbHd1K2NxVlpmL0hH?=
 =?utf-8?B?R0s2RXRZMERPNzUwNStidXdoMTFOVFNMWHRlSUlIK3RDV0hTa0plelVpODFC?=
 =?utf-8?B?VFpjQTl0aVg5czU2b0NjUEdiUTNGcmlBR0lXb3ZCaUZuaEVZdkl3SGJCMkEw?=
 =?utf-8?B?TVlXQTVYM3BOVTRMcEQ0anlPNkFHM2poS1MwcFVGcFVubFRxS0ZGNEZ2bnN6?=
 =?utf-8?B?UTRNeTN2cGZOMk9kQndyZGg5TlhtV0I1WEozVDhidXNIU3hFeEZJN0pGRGlm?=
 =?utf-8?B?djN1YVVKVXNaSEJjMUQ0MkI1Vzc5T1JoU1Z6Sk10M3gwQTFNRW9wK1RtMW5a?=
 =?utf-8?B?WW8xdEdpT1QwTmJQY2xuTXZaajR5U283YUw4YlJ1MzB0N05ySnNSY0NscjBa?=
 =?utf-8?B?ejNQSG1oc01LMHNZajBKZHNJdDJ2WkwzSmFFODgzV3M1MElxYy9UcG96dCtR?=
 =?utf-8?B?cDdKaDNwWHBpUzk4a1ExMGFFbExZUUg2a3BjZC9NdTdHcDgvNVlqOXNuKzFo?=
 =?utf-8?B?ZFl3VWZTNVpGVzB4cmp1L1BudVZUMlpxS01JRENsSWxvd0F3aytvcWJDbmRJ?=
 =?utf-8?B?SjVISnJmeWhYakZmOXljUFlHcWFDQjdFMVJJSHFqb24xSEM2R0puS2FuN1dD?=
 =?utf-8?B?VDJwdC9oSlVEVnJKc0FRR2tpVlA0a0grdGMrbmYrZEJkSG5LR2loNlNoUDV4?=
 =?utf-8?B?RWZsSkc2VGVjNjJjQmxjOERlNjB1L1VuRGg1KzJMcXdET2xVRHFabHRJeFA0?=
 =?utf-8?B?Q00xdmFVaVlsN1pBbkc5amsvQWFDRks0bm14UjhqN0I3NzN4NXpTRDRSN1lv?=
 =?utf-8?B?UmU0YkdrL1RXVGtNU0VDYUsxWFFraTByUDk2QWhiWDRGdDBJUTRQMWxxeXVh?=
 =?utf-8?B?M3p5VlVkejBjSzBURThtUklBTC9hbkF0b1E4bzlTRnBlUGVEcHNHY2lUVVBS?=
 =?utf-8?B?YXVWcEZJems0eFUyTUZhSVZiMUNKRXE1SWptY2RiQkY1SEpDdHpOZzBjRkxm?=
 =?utf-8?B?dFoycWdGazF0WlBBNitWdk9TODA2d2I1K2xYOGRyRXRaNlBjb0FwU3JteTAw?=
 =?utf-8?B?L013TytabDJnc2tPQ1lxcUZveTVMWFlHbWxvZjVpc3BqNWRVb2xnUXAwM2xz?=
 =?utf-8?B?OEdPdUp1N0lKTU1tNkp5S25vNUZwSHJnb2R6TTQzWm84dFJhRm5RUTFQbXdN?=
 =?utf-8?B?cWNwY0llWWw0YjN5cUtzTElqbGF3MTJnMTJWclhzODYrWmRsRFl0VVhRM2sw?=
 =?utf-8?B?eDZMZU0yRG9jcVRWY3pCd0piNSt3K1hOcVorQ1B2YVltb0ZJK2hkeWZuRWFt?=
 =?utf-8?B?M21kdSt4SER6M2ZESU5NR1E1a3E1T3hSNnRkbVdCdHl5aWI1dllYUzRVNHgy?=
 =?utf-8?B?S1VHeEVrS2pYQ3ZGT252TytzRmZZbUNpVnZoNmRwLzZnNnJ5WXZYMGNRMnMr?=
 =?utf-8?B?VW5LbkxYdDRGUFByMjNGWFhvMUJaMGJNaVFjQmZEbXBTVnZJOHdEQXJvYlA1?=
 =?utf-8?B?QTJheHhOZkI1eEo4V1M0a2cxWExUWXl6bUJJS2VXL1o3S2lCdTVJYjVjZHpP?=
 =?utf-8?B?ZGxjYXdTYStaZXYrekQ0TXhob3dJWWl4bkJwM3ZScXVmRkxkSEIxUjltVnda?=
 =?utf-8?B?cmNtME9FQ1BZaU9XdTM5U005MUsxakdxUm9FK3pEUjdCSCtndTdIRW5kb2JU?=
 =?utf-8?B?OU1iUnBvU0d4N2gvRGNRRHk5NDJ6SDFLVDhVMWtSd09zeDJ5dXZONzFiQkRR?=
 =?utf-8?Q?LKGlux4BmH5EOXD7crlIatn0qJfwOIv3+af70nA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGlMa2I4S3UxSzRTS0RBc3ZZVFZnMld4S2JrNGNoeC85SWlvWFNVSkVoTlZ4?=
 =?utf-8?B?Y2NWdzZQeXoyc1FtcHVDWWR6STZ5ckc1NGw2c0RXcndYLzZ0MGZnai9sNXRz?=
 =?utf-8?B?b0JtYWRWbUp3N0VIazh4M0dGN0FLSUpNT0VYVDAyQ2lWMjZsd05TU2VhMFVo?=
 =?utf-8?B?VUxQbjM1NDV4WUd3T0xxTDFNK2o2UnZpNlo0MGxnYnNJT1FoQlFSaVhZb3Yw?=
 =?utf-8?B?enpGZXBucXFXWHU1U2NnQlVtVXhLZ3l4blVubUNsKzBrazZxRmcxdjV4RlVh?=
 =?utf-8?B?VTNoa1NjZjZyR2NSZm11blJoS3M3WU1LNmhPRm9ZaklKUEtLSVdrdkM3aXA1?=
 =?utf-8?B?c2pDSy8xOEU4d3NuOUFZTTJmSU1kUlBIaG1IcnJhd3pGWW9XU3FzeHh2VHhj?=
 =?utf-8?B?SlVIQW9RNEFRVTZ4SjY0d0ZmMm45SXFCclVGZUQ3M1crODJRUkhvVUZwdVMr?=
 =?utf-8?B?MFZvWi9hTkFEdmRtTzd0QlRmYlVVZGV4UXhscTcyM09aYlVNVTdBL05xM3Bz?=
 =?utf-8?B?RlJRRGRGS1pNa3U1TWZkejdGYXY2OVJFWUJuOUpYWU9WM1BvYXR4c3E4MWJQ?=
 =?utf-8?B?NWZPUlp6N0R1NC9OWFVLdHF2djl3M1VQN2NxQVh6NjdSKzBFQW9lQmdJU1VC?=
 =?utf-8?B?eis3Vm1uQUJMVS8xQmlQNzE4ZUJ0cTdRVCtvOVgxT21oNnBYSjY3N1FEOStn?=
 =?utf-8?B?MEdKOFF5cTNTeExSbG9FbmZqUzFVSlFUU3dkWDZoUW1qWVNJUGF6U2FnTGtk?=
 =?utf-8?B?bWVpQVBacVFraVZGNS9BSXQyYUFHZ0cyaXZlRDJFamF1SisxZVBWQmhjc2t4?=
 =?utf-8?B?RVczeWZrZG9EUHhaZHpCZGYwbUNnSTdDaUFOTjdFOWRBMnNYOTY4NS9LejdC?=
 =?utf-8?B?TURUUEtHSExMazdIRHVOMGduV3UzbCtkYldCZGlIb1ByK3VwSFYwUjl4RnBR?=
 =?utf-8?B?dno4QzFCd3djOHNzZnV6eG1NdjU2V1pSUVpwbmhKenFCMEt4UFU0YmNITTBM?=
 =?utf-8?B?Zlc1aW1PVlB1K0F5ejJ4emJTM3ZaUlp4SG1LRkhyczV3UlZzTHpSZTIyUS9z?=
 =?utf-8?B?OFV0bTFrdEVpWDNVRENvK0pDQUFBcEZiT2RwMjk5dnhONTR6RkFkTHNlMXYv?=
 =?utf-8?B?cmF0ZFhadGdwWFlGb25qWkRwM1hibHhwUzhFdXhKYjN5UUovTmRTS3p6NlRJ?=
 =?utf-8?B?cUNKQVVFQTl3MnBoOUp2SFhQbzVjQVRkbEdOTWk5M3lWYkJwSlRWVlY5dXdH?=
 =?utf-8?B?UldCZmxxd2ZtQStlbXByeWJqS3ZsNkNjWHRyM3lDbG1SVGVTc1ZtYjVrYmEv?=
 =?utf-8?B?T3I3dkpWeCtyMWp3MzhZQzlOc1ZtUldRNGptcEdPVHhRaDZrVzY5ZTFNUytB?=
 =?utf-8?B?VVcxYVJuTzFGSUQ4bkxZQ2t2eGtRRi9mRWVQVTFCZ29xeUMzall3UXV1dUJp?=
 =?utf-8?B?K2cxL1VqbWdIdnRmcEI4MDZWUktsaGlKU1dpNVl0aERqbGNJcXVlbDdJY00r?=
 =?utf-8?B?NjE1U2NkS0ZDOUwvMzJtTWc3aDBvTE05dWdEa0oxNWhVOU1MNmFNcFBENzRW?=
 =?utf-8?B?cTZqbi9nNHBzazV4NmR6WXc4TFVqL3VmTFlRTjVLVXZtVkRJZ3IzcGIxcDFu?=
 =?utf-8?B?N2RnSVNoOUtDN1l4eDE3MjR4ejBuTjIzdytQak9oRnduNmdhWkFJb0FCU3Jh?=
 =?utf-8?B?ZitqOE9YNDVSR25CRTNpQVdRVXEwK1JXa2JGOTg2d2VJakZlUGpJMmNTTGdL?=
 =?utf-8?B?T2l5SzdsQlROUHR4NVNxbmxNQW93UjdxZk1Ha24xbXFqY1hFRXYyNStPdjZE?=
 =?utf-8?B?ek96UHRHSnBxSitJMWc0VXE4czNXcWIzTWdLamhIWGR5MHNRdlFMVC9YSlk0?=
 =?utf-8?B?ZjB6YXhSRFlQYlVwZ2owZUxrayt1WHM2ZmU2aUVkdU02cDV0R1FWYmZ3aFNi?=
 =?utf-8?B?N0ZMa0U3clVQWmpvck9JVWYzUkRMMXlSQWNNTHc2TFpsRldsUzcvdlRieWRt?=
 =?utf-8?B?QTNoMWhsbjNXSHR2UWREVmthYysvTnRIMWh1Qm8wMWJGeUJjM1F1d3J5QzFj?=
 =?utf-8?B?VnRwNGFOVzdzTDdSL0lmQ3c0MTNCeUZDT1ArYzdXWmZoZmtKaTNyUmFGdWYr?=
 =?utf-8?B?NnBSV0ovYmlKYjRQYWFaSXMvenB1RGcyZnF0WkEyVDYyNlFTK1BLOFQ2dTVP?=
 =?utf-8?Q?FNNOcf3FAn5rTHB4acBzVNg=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3006d5db-9ad3-4f79-fe62-08dcf3f866c1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 06:52:18.4291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7MNNTLJWHA3sIoxRJhvQLhw2ZTNHg9//oOn2MmDTX23o7yHbSAQO7ITVzjVVBZNUu+txGj4+T1a2K9ueZ3BbzOlY1/AGh7inuBESvBYPrE7rPp+Je143QT7sX40ous9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR01MB7100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 06:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113160

Hi Khem,

This is only a temporary patch. It helps check CI build errors on the 
MCTP repo. Please help run the CI build; if any error you can show here, 
then Jeremy will update the mctp repo to fix errors.

Please don't merge this patch. When the CI builds completely without any 
errors, I will push a new patch with the latest version on the MCTP repo.

Thanks,

Chanh

On 24/10/2024 13:51, Chanh Nguyen wrote:
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>   meta-networking/recipes-support/mctp/mctp_2.0.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/meta-networking/recipes-support/mctp/mctp_2.0.bb
> index c6aa7c104..793afe755 100644
> --- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
> @@ -5,9 +5,9 @@ LICENSE = "GPL-2.0-only"
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=4cc91856b08b094b4f406a29dc61db21"
>   
> -SRCREV = "f110926b082731b25720b444378ad55d7a9d451d"
> +SRCREV = "089dc53fa7387cca517cd713061c323ca06fb6dd"
>   
> -SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https"
> +SRC_URI = "git://github.com/CodeConstruct/mctp;branch=dev/cross-fixes;protocol=https"
>   
>   S = "${WORKDIR}/git"
>   


