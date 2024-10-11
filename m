Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA657CFC618
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 08:10:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6621.1728634201022863560
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 01:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0014a34f0e=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B502eE010676
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:10:00 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sdq89p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:10:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byhjpdOI7zxwlz/WUk+Ft4oiuQMqIIyuQiDGhGRasZ4WqhV/qP5f+ZWc77f3Fko2YKoaDpKea53QbVdLuw4vFKiWRlaB1feXSVJKHgElCb2G2wqwEAZ6RNYD/fo9c1d/rtUiBQxIglEr1TRlj7OEMvjFQ8RJml6A+dtq3MvrylkSkVxGwlpL2Tqf8zDtr2TNfxyKQohkXAzWC/UTWoggQcR9h062/uAWukjwuGyESEQzp4OXrC6oWvw2fpRiG6XLxN0fGS5NDSaLuncJbALeKHp+JTdmYYj76tU7bu++nn7X1l6w0Qq1J8yEbD6AxVVYp9PM+IpvBezNDd8949zRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mFkR2hipK/O12FWsN+HyofpEMH70+I88Bj+uFCK6nQ=;
 b=MsaV5CLLiYZuGSwahtqRe96vlxrq/7EfhY/VmNAGsAAhy9ITT56tg24XEM9aKnYSNrJP5lzeQY0G0iiOmE9cITfr9jO0kqEzLvpV+MhCfucdR/W/RaCEX3GSvlfi6FUiVllAsSeatZ0WIjZ2Ml6AefyYQsS0wRegKkTYRs5jUCu3MYhG9uT/GfAKwRjPblgrKgjFJEeFGGX3OzlorvKhRBDQjQUGAGYeGhvJPttXjV9dSPpV9cdGKfCYvkM+cYmV/9kJ5WvkFgc771MfakOvGooS3QhM+QeuFkd7b/Fq3RVxHG+5/r4DCuqAy5u1OxClLp0utGQPBeQwTcd+hrTImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB7131.namprd11.prod.outlook.com (2603:10b6:806:2b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 08:09:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 08:09:54 +0000
Message-ID: <06488e87-38f0-44cb-a7da-f3c887140fa6@windriver.com>
Date: Fri, 11 Oct 2024 16:09:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] libatasmart: Update SRC_URI to fix fetch issue
To: openembedded-devel@lists.openembedded.org
References: <17FD547727338F04.8140@lists.openembedded.org>
Content-Language: en-US
From: "Zhang, Liyin (CN)" <liyin.zhang.cn@windriver.com>
In-Reply-To: <17FD547727338F04.8140@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c3e92a-07b1-4301-ecac-08dce9cc1613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aFUvL09Rem9aeTFFQ1ZJT283aGQ1VkJ2TzJXdXhDa1NQYVVtMmJhUkZXMG9y?=
 =?utf-8?B?eE1LaXVIYStBR2FZdjNnbjJiVmcxckNPc1JBSXBkZ3Q0WlE1Tk4zN2VDRXZG?=
 =?utf-8?B?OG1WZVhNenVicDJZZy90K0VFMTFoZ0ovM1Jnb3YxeWdsY1k5cjZqVUxoVWFm?=
 =?utf-8?B?VFIxc05WWWZEZlZpTGQxM216Vm12SlJjWUdYOFV3RjE3V1dBOFhHdG9DMnlY?=
 =?utf-8?B?V1hHb1FRdk1XcmlYN2tXZG01ejJ0Yll2aS9QUFRiUjZpMGxNRUtFRUtUd2Qv?=
 =?utf-8?B?MEJxSitpRTY3RCtyOFc5K09HbytzTjJMVTZwb1lrOEtkazBBVlAyVER4cDFD?=
 =?utf-8?B?UkZyYUhrRzNhWVhzUmtkM0krK2V5L2ZRdXpIdysyU0xBd05EK09JaEJ1aDVQ?=
 =?utf-8?B?RDBPWnI3Nmc4WDFrRDc0bFBVaGRURWU2Y2JGanRERU4vY1RUUkdQRFkvVGR4?=
 =?utf-8?B?Wi9jSEcyNytRd0kwYUhkcFV3MlM5cXRKc3c2MWgzT1dtTmxMSEdxYmpSL0Fm?=
 =?utf-8?B?OE5TWDh3cEp1bW1heXA2Vm83dGY1RmlRbDM3NlJXd0ZRN2t1MytZakZxcmEr?=
 =?utf-8?B?S2tyVXdmZjVlVFdGcDlJN3N4RmloVDhyNGpBcjlkZ08xK28vbjVDYjFhaXBW?=
 =?utf-8?B?ckora24wS05QSTBWQmZYd0J4ZjVvdHNpOWJwbzJ3Y0hLYklCYVpERDFhUlRM?=
 =?utf-8?B?UmJlRkhBeU5WRHBFcWVIRUhUZEt4L2p1ZjlCeWkxb3pndDVScytvZzhRazM1?=
 =?utf-8?B?eEpPMWJuUzQrUDRlV1NqMWRJdCtUSmVmU0Q5aXdBemIxS1lqQ3Z4SnU1TVV2?=
 =?utf-8?B?czIrSjhKZUtUdW1adk9SMDdUcTdyZDY1d3VFaGZMaW1NVDVLUkhZM09VNWFo?=
 =?utf-8?B?RGtybFJVZ1JsdjE3T0VSYVJ5QzBJWUNqem16RGFGczhlb3ZTdURuTXk3QXNo?=
 =?utf-8?B?N1oyMjJJRnNzdlVEV1p0dHlZVXRXK2I1dklDOXJEVGJaU3NmMzdZNmdYZDZw?=
 =?utf-8?B?RDg4V2VaUmdGVU1oL2V6Mm55NVRrdTJKVVdxNmhyZXhCa2UzeWs3Y3hSRXhT?=
 =?utf-8?B?cXJnUE8wd1NwSHp6RWFIcm4vSytnRmFpallmTDZudW45S2NlU1gzY2tUODY1?=
 =?utf-8?B?dlJDSmVqRjIrZWY5TkpJSjQ5TlNSN1FLdzVUWU05RHBMejYrRnpmTml3b0p0?=
 =?utf-8?B?NFJBOXMxbDBmUFJxYTZmb0xjazJGYmNpUUxiTzFTb2dtNHlsRlloWWo0Qmll?=
 =?utf-8?B?RzBuN0syck5Fc1hIc3VvZ3crVjlNRXM3NDdxdXBvSk04U0hzcm42RTVYMk0y?=
 =?utf-8?B?ejJYR3pjZWZvb2ErRk5NUHJaQjVvTndhaE5GUVBwTHh0NzUwRlNWQjl0Qnhz?=
 =?utf-8?B?TFBoMTAxOE1hQzZFSGE5a05jYmJzRWNUMXRJU3BGOHVRVmZFTHJNbVJQcElH?=
 =?utf-8?B?dkQrUFlBM1VpcEJIU2pEczN5ZGZlOTBta0M5Q0dHZDVXZDVHTDVFTXdmN0Jv?=
 =?utf-8?B?eXhJSHF3dWdsVDdHL0RIYnluRlAxTWY1Q3BiamdxL0doSitMZmRyQjF1VFQw?=
 =?utf-8?B?UDVWamhESGp5MW0vTDIzU2xHTjhHalRydHNSMXdxM1hiekE3bHhXNGVRSERa?=
 =?utf-8?B?elBYeDk1SzdvR2F5TVNiTmptVVN2Q0ZzWjBjMmhzdWlUSEZhNkphRjlyV3l4?=
 =?utf-8?B?YUdvTkVibG1LRU9ndlcvVDFEb3BjUGcybjJLYWVQa2RsamhodHdDVEpRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1VpVDg2d3VWRFJ6Wk40VkJ4cUZveXI4dUlaNG9GdUdTQmdteHVyZXZna01I?=
 =?utf-8?B?L3d6UFY4ODRNUGROeE1GWDZ5SVdQYUx3eW1MbUxjeWhUdlN5VnBOWEU4bkpD?=
 =?utf-8?B?MXUybVNRNGhmcUdNWTFPd040eURtNnMrYUx5MURUb2pnVzdyMW5WOE1JUXJY?=
 =?utf-8?B?aVREejUxdFVENXNGOW1ub2hGWUNUOEtXVFlidTJPS1lKZDg5RnVjdE00Mmhk?=
 =?utf-8?B?Q1ZRRm9GdVRVcDB5dWx6NXZieGR5cnBSdXNDU2hiTkFZVEFFcm94OElSajd5?=
 =?utf-8?B?SFhOUWZYcUR0UERuS3Y0T3ljUmY3bzRIcDNBb3Y4aEQ2akUrK3JXOExSc09F?=
 =?utf-8?B?V2xqR1kvMUxDNVBybU1lekdNYmk0Y0FFOVZESXNWdmlraFhxeUdVUlY5TjIv?=
 =?utf-8?B?c1lKYmpxMUR1ZTk2c3liYS9OejBtSTM2R0xTZUJEaUgxN25FdUhCVCtmYUVL?=
 =?utf-8?B?RnZFNWxRZDRTSks1WjRySVVGcVZTQzJXTDAxTzQyVUlmUWFlck9oNm9sUVR2?=
 =?utf-8?B?cnpuanI0M2NFY0pFMm5RWUQwU1ZJNDl3NFRFUy9nWVBkeW9yMEpwK1k3VzJm?=
 =?utf-8?B?Si9wTktRTXdXSFQ2Q29mclc2c0tRbjFuZkFEb1pMS0VZNitNano0dHBtZzZn?=
 =?utf-8?B?M1lHQ0haSDdrY05rTzBWd0s4UnlpODBNSjlmUkZEYmVRdjFEeHBBcTh2aU11?=
 =?utf-8?B?MjVDazlxdWU3cmhDWTF0QjJSWEpYSlFZT0xtTkl5c2dpaU8rSTRxT3BRd0xt?=
 =?utf-8?B?MEt2N3VDamkvTFg0NjJ1ZUJLWVdiOW9aeWxCSVA3NWhZdHBBMVc2MzJQVkhj?=
 =?utf-8?B?Q3VPazhIZVZsTzVFNkpCMkpyb0h1ZmRwelVuNStHK2w4ZXhuVE9Ua0ZGL3Rz?=
 =?utf-8?B?Vkc5ckFLa2hCM2NMcG8zYzNLZFZvTjZ3U2F4V0o5OW43VnZYeSt5V1dxaHBG?=
 =?utf-8?B?OURhMTNBTU8zME8zUHh2Rk9pc1FJbDdGY0ZBci96MlZBQjNZWkh0ZVhTYmlO?=
 =?utf-8?B?TGlzUVo1b0ZqODZPYzZ1aWtuSXpXb2MxUFlIaVphSEVQYkJNbEpqNUtDdVU1?=
 =?utf-8?B?cjJ5b1dzRHVHUXhyWkI4dERwVTRnWmtxMW5PVkFPb3F0a0lqbC85TERXaldn?=
 =?utf-8?B?NUUyUXQyY29PUGowRHNrR0dWeUF5Q2d5VTZuKzgxVTRMeVBJUDFsZmpkNzEz?=
 =?utf-8?B?RGwwWkY5MjZsSW5La0M4c1lPM2NyNTJaQUovakZWK0p4T2ZLMU5lUU9aQnhp?=
 =?utf-8?B?cSt1dkc2Y0QyYXlaTFpvbHc1U0RmcDFaUjczay91SEFKQUQ2R29DWTJZKzRh?=
 =?utf-8?B?TTdRbkJkQmJmUm9PWmszeTZjWklKaFhRa2U1b09NT2ZnSS9sdDNYRlNtNVFw?=
 =?utf-8?B?UEh1bE4zYTA3dkNWOXN2OHNIN0xJeEcwNGM0ajJ6bEI3VUs3R29SNHYzNUdL?=
 =?utf-8?B?VFIzaEdBSmxzc2E4ZVpDUlJlbXhINjJub1BteUhJbmxOZU1ySkRNdG1qL1FM?=
 =?utf-8?B?U2QvQXJMaW51U3dmL2xqWXVVZDRzQnJBdHg1SEVxUGVWVXFpZ05pRjFtTTF5?=
 =?utf-8?B?cHpMbUgzWTdRT2hYeU1rWWtwQUl5RXZJRU1Edmk4Q2lLTC9QRE9xR2VVamZj?=
 =?utf-8?B?aDNldjBzODRpREFtQzVWbkdwR2ZMYnptaWdqVWYrdzBBczVDUGp5T3crSGs2?=
 =?utf-8?B?VTR5Ymw4YUk0ejk2ZFFuYTc5Mit0Y0trbDFYRDVCVEgrd0FuZDRvM0FVRDdB?=
 =?utf-8?B?WXJZNWgwT2RHOHpnMTJsTjRvYW91Vlg1eVgvdTZJSGRmMmErOEVzREVRdVRr?=
 =?utf-8?B?bnc0dFNVSGM5NmdQdkNUN21NWVg3eWFQQ2NUTXV4LzUrMVI3bGoyalVpY1g4?=
 =?utf-8?B?dS9tdGY5MEZIb1pnb2lFblRtMFdiMlZUVjBQb1hLbzJCNHN4cEZsM1FOOUJt?=
 =?utf-8?B?Zis3eGd2ZE9QWndsRzhjZnpXWVVZSUVaVDJiSEhVdzROdGhzUGJtV2F3NUtK?=
 =?utf-8?B?RWZqMEh5Yk9PdHduQ2Jma2J0NnRKbExVSGFIM04xUk9Vby9iMXB0ZDZFdTU3?=
 =?utf-8?B?dE41bFRJTy9naktJNDVpQXNJb3p6eHZ6b052QXdjVWNXUGw0aGdVemxOL2hP?=
 =?utf-8?B?NUNxZHkyblhZQXRhOWdrOTRabEdRcFZiWXpGaVJ4ZFRhMmhTUmZ2ODdoWEs2?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c3e92a-07b1-4301-ecac-08dce9cc1613
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 08:09:53.7848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pL5I2IP36//82XKhc3bfi0NeOwMIIybH4YtbhBo847om0J0eU5M6bxXGO+RfK2GNlvwyr3rFUYuOJM0ukjd2/u5iT8lS4MMVibQCVf1gryk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7131
X-Proofpoint-GUID: -KfgNL_uxhR3TSgkCnXoyTVd9WEQ_KVI
X-Proofpoint-ORIG-GUID: -KfgNL_uxhR3TSgkCnXoyTVd9WEQ_KVI
X-Authority-Analysis: v=2.4 cv=LfZu6Sfi c=1 sm=1 tr=0 ts=6708dd58 cx=c_pps a=SXeWyiAXBtEG6vW+ku2Kqw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=6xbm41ixAAAA:8 a=bZfV8lsG9zGlPQI8uX8A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=S5GGVp12ez9_aiSFvI17:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_05,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0 mlxlogscore=788
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410110054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112789

Please ignore this email with wrong patch subject format.

On 10/11/2024 3:11 PM, Zhang, Liyin (CN) via lists.openembedded.org wrote:
> From: Liyin Zhang <liyin.zhang.cn@windriver.com>
>
> Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
> ---
>   meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> index f747ecbf7..8947b9fa8 100644
> --- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> +++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1"
>   DEPENDS = "udev"
>   
>   SRCREV = "de6258940960443038b4c1651dfda3620075e870"
> -SRC_URI = "git://git.0pointer.de/libatasmart.git;branch=master \
> +SRC_URI = "git://git.0pointer.net/libatasmart.git;branch=master;protocol=https \
>              file://0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patch \
>   "
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112784): https://lists.openembedded.org/g/openembedded-devel/message/112784
> Mute This Topic: https://lists.openembedded.org/mt/108944740/8826801
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Liyin.Zhang.CN@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

