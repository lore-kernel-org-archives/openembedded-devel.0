Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0512CC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 12:56:32 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92462.1783083032704337721
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2026 05:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=kKGMyTQD;
 spf=pass (domain: axis.com, ip: 52.101.69.28, mailfrom: adam.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LD20iafGDm3HmVD2WjRZuWZOo+TQmSdLnpDmH1XYmTTLa3Jc/xL6F08yU2BGl6RHAPOt9YYQDpvGNMxjjJ3J39f7vftFG3mp+kwiPROxDonn0g4vNXV9vmpoyIi7eoODt0hqG0saUVx6gD3SBNLRRvN+91SsLU9Ytz3qa67DNEBhkQ0RuoBKe8pQ7Z8LKjz09JaStb86+NYoOxb3jXel0tsV6httGmAila1KoWv3TdI1ERE394aP7p3Hg9g+SNtjR8Xx4AlhM7sgN+TG5zRkkHQIOdRYNjT0j4Z0xyCCwptiUZxdWYvuXSUHMn8+5/LH1eyZ3hlJxXpkIGgt9L8pdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmJgr3DhrzeEy4ulgPwO0F4qYNg5kFeFi6KZpMz5rw0=;
 b=jv6OFyX5ZMVlIuYupnQR74KW4pbZAS2A34U7DQxMB93baWIJezon3dRtE3JNIu62Z+AX5LYUsrOkMf79AfaHMebkyOyZ5SSelEsfb04CywJJ26F/SZIxfR/e830ualDQLPxlBTwafBGMEygFOC4k2YAv87KOBdmsREisA89k+KCKvOnWHDBZVCM2HnLHbz4TKHoWvpvvW56d9YJzG6FAiQmAmW1xyy1GYW05AzC2P199tF5MJqYFIkcgS31VeDjDAyhgx4GhN2aG6S2O/sba/XwAXmIOPT9nFdRm5ZR80jEFvcU9uy/Vtzda9EMJ6rRuERJlaHGmWDe8SCxfbVKKnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmJgr3DhrzeEy4ulgPwO0F4qYNg5kFeFi6KZpMz5rw0=;
 b=kKGMyTQDsJ2oc35+coaVvGu4RTu63Rayzq/4+Cm/aAtkXcm9656lgt1o61HU5+39qAQJAVPiHUeFAeRTffvlfvFbWLJsuWN852Yq8aFXSw2oYqbtoIzu/QgeaWdkLDjqIRHIbywq3UnP1R1gMBu1c9GhJizth9KYVBzME+zWsbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from DBBPR02MB10889.eurprd02.prod.outlook.com (2603:10a6:10:53b::16)
 by DB5PR02MB10161.eurprd02.prod.outlook.com (2603:10a6:10:4a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 12:50:26 +0000
Received: from DBBPR02MB10889.eurprd02.prod.outlook.com
 ([fe80::ae74:68ad:6b01:76b5]) by DBBPR02MB10889.eurprd02.prod.outlook.com
 ([fe80::ae74:68ad:6b01:76b5%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 12:50:25 +0000
Message-ID: <a18a4ecb-685c-44d3-bc55-fded09fd2079@axis.com>
Date: Fri, 3 Jul 2026 14:50:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 2/2] lvgl-demo-fb: Update to 9.5.0
To: Adam Nilsson <Adam.X.Nilsson@axis.com>,
 openembedded-devel@lists.openembedded.org
References: <20260629132844.2894190-3-Adam.X.Nilsson@axis.com>
 <20260629132844.2894190-5-Adam.X.Nilsson@axis.com>
From: "Adam Nilsson" <Adam.X.Nilsson@axis.com>
In-Reply-To: <20260629132844.2894190-5-Adam.X.Nilsson@axis.com>
X-ClientProxiedBy: MM0P280CA0058.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::25) To DBBPR02MB10889.eurprd02.prod.outlook.com
 (2603:10a6:10:53b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR02MB10889:EE_|DB5PR02MB10161:EE_
X-MS-Office365-Filtering-Correlation-Id: e2bf11ea-5b4b-4e4a-c883-08ded901a71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|3023799007|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	tWpz0SBaPSlKKizz0ST+IU9e+YSIZ4wP2SiMgsPcY3aRtXbdUcVhl3fhYgSXiGOfgGfwqTqqdxrs3ghGPdiy9O9Bq+y8mDTmg8iszqI3910RARDat85eAtNzwycYTgIzNVyl+s25julcMT6egyUhRkI/sY341HZOkt61bvI+BPVAuKFyToPPBQ7NfreNsNVi8QeGFeF3w7+6VrC34Ly8SOCHh2OMGPu+09iIjj0JSDaKOkscM0slHpdDrHnWyGhICfvZde4/GH4Sh6Z8ni146o7io8LUUS5EZ4WisQNgX6rGUZp3LCId+UrURW+8UdCBeNmuNJsC5DipmoLbQzdBlMOSYCM8lO7UA+MIkMIj3DXEcEjNazK14Iz+Y+4R7VZlOaAOrcjw/HdxWREzIbB+b0bpPOaqwOw30A/Ciyib0pT+vxgXtH1JaM6BTi9x/j2GKIMicxsKnGl3YXNnJT5yJfKPFRGNNJ8/NdcGWa04GQ2CHRIJYp/gRPCuYp4+JrZaA7aks1vkJvj/JNllwqZGLouv6OR5FD/LptuMWvPyexhGhygfS7uguTtTRw+KvIDL0xQnI20YkgUInGjvL0J5pOo3hBLMBbMIKvyRVuGiYl4q2OetPo0JaAjJlapfDeIhkA+2XeXzIfUGmQ8NYETLcykEMxOonj972CvPWTsKeq4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR02MB10889.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(3023799007)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDduNHlLNjlMbUNjYmdQM0pBS292Vk9VVU1KUVlPTk1kODBFTzIvSVhuUklu?=
 =?utf-8?B?MGFXdStwYkxmam50Nk80Q1dlQ1N2Y24vc0dadGh3SXFrSHQ4WTBTZFVCUEJP?=
 =?utf-8?B?RVlpWnRSUnlGN3RaK2o0bExkVW1RSzYvdUdDbHV6WW5ZTkg1NUp6bURXVW1G?=
 =?utf-8?B?TENoU3ZlY2dlSkZPcjA2RzFnSlA1S3RCZnJjQUlRYVp2YnFJREFaU3hrSnU0?=
 =?utf-8?B?R2RlVGpSWmNYcCt5MmFETW0wU0ZzWlg0VWg2QXBXL3ZNNWdTZ2NLZnpuNzA4?=
 =?utf-8?B?c0JsSlhkdE9yTy9VMGo4Q25iVGFTK0tQQUpURlJ4c2hjVXNScGlQVFAyNVFt?=
 =?utf-8?B?a1ZCZm8xZzBaVHpqbkRMRFl4WHVkTkc4MkVxRTFWZ2hKN3hVT1Z1aTh2MmpY?=
 =?utf-8?B?SndoNUNqSjlrMlJGYnJaV2FVT2g1Z0VQWmZNRXlNVkxsK25xTE9GMGZzOVYz?=
 =?utf-8?B?U3VpOWpBby9RTDk1VHZQYVA2MEtmK2dyWGl0bFB2MGg1MlFBV2lIZ3g3UXBP?=
 =?utf-8?B?dW5CN1JpNW9TOFZEZ0ZIZHRqekVQZFo0dytudnVnU1NZYmpZZ3RReEFETWZy?=
 =?utf-8?B?akF5SWpQUzM2RWIxN2ZrdEUxbERhbGp6alh4UXJuRHA1anpVQzArY0NQMThI?=
 =?utf-8?B?S0UwUGxKY3BFNTZETVRqQjJLSzNUZ3dBa0tXaCs0K3EySGtnNnRmck9XNkNC?=
 =?utf-8?B?TWtCVk8yUDExREZRWkNDVzZab3dGS0J0LzZTS2NvdHZjUkhwbjB3RjRJSlY1?=
 =?utf-8?B?ZnhNMzY4Y0N2Yi9RS1pVN2FhbkVtMENZL2VGZ0dqWktGcnpuOG0rY0RuMG5J?=
 =?utf-8?B?ZDBzeW9jUHpYSllSNVM4Q3B2TUQ2akpTQ2RTOE5OTzY2bFQzeUEvYVdmOGJQ?=
 =?utf-8?B?ZTlTY0VIN2dIMmUycGFWWkxqUkpQcXpqSkcwYVRjaWt1UkdtVkJGVlBFZUZu?=
 =?utf-8?B?WWo3TkVmV3JJYUErdFdFWlhZRE42QjR4ZkY5RkF0dWdCZHpRdEJRKytiTWRi?=
 =?utf-8?B?d3MzMHlCMGtWVkFiVUJ3NWZvaTFGSXM3WDIwbytieXd2SE5mdUJnVUVtT0VC?=
 =?utf-8?B?YTdvbExuL3ZaZVZBQldteThsR3JoM2FQb3FYbGZQOUFNQXNla2JxRldhVW5t?=
 =?utf-8?B?ZHJhbGZPMlFXajR0TitNOENNZDhzak5idFp3aWhONFNob3pRMjdqSHRuN1Rp?=
 =?utf-8?B?aUFERTd2VW95QXM1VVA5YUh2eisrcXN1SXFKd2hJVm5SWjU1NGRxSTBUUVhG?=
 =?utf-8?B?YTdReXNWT1RMaGc5SVBSZDY5M1RIUHBzeHlDVWViYzFmMGNMdFl6M3pPcW1a?=
 =?utf-8?B?QU1Od0VCcERXcHVBenBsUDN0cGs0K0JUVng2cC8wdFhmNGpIZURPdy9xNHpF?=
 =?utf-8?B?WlcvWk5oUjBvY3dNNHN2NS9iSnQycHFBeGRUelRud0swMWljSUl2MkNTZE9h?=
 =?utf-8?B?dGd5REl5UTZzcDdqeEVPYjJhQUc5V3VmQmsxdkNLTkh6ZmUyamFrR2NRODlN?=
 =?utf-8?B?SFJGVEJwT3ZUd0t3RUt5elJod2hXRkRyVEU5YXdHdzJxbjFLSm9VdDNZYnM5?=
 =?utf-8?B?YXpEMzNzdWd6Zjl5RXdkMWJZT0lTNDlWZ2RwbVJGTllnb3JUM1RiV0JCUlVT?=
 =?utf-8?B?SHh2eVlEbG1VRlFHcXYrWVRFMWRkcmdzWm1KWTd2cEs5SWJwSXV4WUFneFVU?=
 =?utf-8?B?M1ArOW4rL1MyNzUwazJLT210ZTQ0Yi84dUpXZm1xc0ZMS2o2T1E4blJBY3po?=
 =?utf-8?B?V2NSRE1RczZOeXJzQkhDak4ybis3OUs0bnRqWDJxVWZHS0lGVjhqOXIvb0Ny?=
 =?utf-8?B?U00yRExxM01wR3pta3dxQjhpUktWMHcrSkcvcjZPZFdqT3J2TWV5aUlNd1Bi?=
 =?utf-8?B?SWlqT3hkTC9QL0dQWStMWWZwZTYvWFp3cnRuaXJucnpmeTR2MFVUeGpVd2Y5?=
 =?utf-8?B?NXZ1YWhVRUNvcWFRZFB4MVd3NHpQT3RncElIaUY2UW5Jc2lZeC9uZjRCNUZG?=
 =?utf-8?B?aXBkRDZLS1VQQjlxcTVXRDY5em1PVy9qaVNvT1dVUDJGMlZXVHA5N09BdTU3?=
 =?utf-8?B?ZWNOWnZhNmlaNzNyWnUxVmJURExqVm1Tajk5VXZGN0dFUFNER2RJS05zRHlm?=
 =?utf-8?B?ckI2Q1VGVTZodTJJMUxlbGlPU0YwUDFlRmYyT3dQaGNsdVA1dG8vRkQrODBp?=
 =?utf-8?B?NWRUSVorVnN5alM5NUJZZXQ2dnQwNGtSRGZwNDVNWktuK0VWVHJEcGg3eTFJ?=
 =?utf-8?B?QXBCdVpWNmxaczF3RUdEOWV2c0hFbjJYa1dzRDVvSjl5cCsza1UvVVBQTVdJ?=
 =?utf-8?Q?9bHA1fIrHOPU1u9Mua?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bf11ea-5b4b-4e4a-c883-08ded901a71f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR02MB10889.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 12:50:25.8890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuCSk+V1Lh2+RhkfQ9lmVFvkxofcSgjjtOLYKlsTDXvmtBMIrU8Fc47OzJAumUpH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10161
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 12:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128008

Hi, so got some comments that lvgl 9.6 should release in 
August/September so do not know if we should wait for that or merge this 
and update when the new version is published?

On 6/29/26 15:28, Adam Nilsson wrote:
> From: Adam x Nilsson <Adam.x.Nilsson@axis.com>
>
> Signed-off-by: Adam Nilsson <Adam.X.Nilsson@axis.com>
> ---
>   .../lvgl/{lvgl-demo-fb_9.4.0.bb => lvgl-demo-fb_9.5.0.bb} | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta-oe/recipes-graphics/lvgl/{lvgl-demo-fb_9.4.0.bb => lvgl-demo-fb_9.5.0.bb} (76%)
>
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
> similarity index 76%
> rename from meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb
> rename to meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
> index 660031b68f..02ef8ed4a7 100644
> --- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
> @@ -10,12 +10,12 @@ DEPENDS = "python3-pcpp-native"
>   PV .= "+git"
>
>   SRC_URI = "\
> -    git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=https;branch=release/v9.4;name=demo \
> -    git://github.com/lvgl/lvgl;protocol=https;branch=release/v9.4;tag=v9.4.0;name=lvgl;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/lvgl \
> +    git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=https;branch=release/v9.5;name=demo \
> +    git://github.com/lvgl/lvgl;protocol=https;branch=release/v9.5;tag=v9.5.0;name=lvgl;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/lvgl \
>   "
>
> -SRCREV_demo = "71050624acd8a52ab7d365d0d12acf9bf5fe41db"
> -SRCREV_lvgl = "c016f72d4c125098287be5e83c0f1abed4706ee5"
> +SRCREV_demo = "045137cf0fa1781483cb796261a11b5eb21e99d9"
> +SRCREV_lvgl = "85aa60d18b3d5e5588d7b247abf90198f07c8a63"
>   SRCREV_FORMAT = "demo_lvgl"
>
>   inherit cmake pkgconfig

