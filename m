Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095ABC4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 11:14:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14281.1714043672678207195
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Apr 2024 04:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48457086c7=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P5Afx4020274
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 11:14:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xm4p7dmxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 11:14:31 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43PBEVSR027469
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 11:14:31 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xm4p7dmxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 11:14:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ls7vt6F3r3FGkV6RJM18WnBhNh1TnjWTffJRCBbjCMmQSvRSkxDiqDaUUZp8B0FqlhCvVJw4daFn0AtoGx/RDiIZhOLwE7L21ClpVcfUV9TX8nWDWam4S6v4DARCODPOCXygSzYiRxekSYE60oCqw9A6dNGXrPHlmnny6si+3lcQjOpj1hbOacJdkbTIyZPWplEwfXmdSkPB9F/mXmGWPpsZA5jBbOS5ohR0/Y+jmHbPu/QyOW23AL66nl00jywaOatwpmZlGKPAnP+wRccYkuM2Ym5LOr65ZvgnQ3ue199XFum8xweHwL3UvD4D8GNbAMd1KBcG+IH+yuKf+0cVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFHMWSR3JDeyFadiCU3/tmGzm0xK9rnYu4+k8UIu4Ao=;
 b=ECLX67ZPzlTRCYlk4XTOxk8P2Lk414Chels1M4K/7nx5oButk4Byc46UHAg3LQ4LLzexKtQJT8lOf6i2VnVa7QojjptzFT0X7vLVQduPdKU29J9/hBg9SyqAZKTkdFdUX8rG50M66MgucLh+TFqCeZ8uRAdGpCPUyyvXi4l3qsIfBmNfcBc/K4dTnqEeu5gj+j1zGnXzpYJbAy9qKPp4Wd9alkoikvzVoL7f1wJw/bwdbd1R7QvEGWLFeRMiW85xIWRanae3Ggyxcw3IkLfV88EXyPUKXnxsVCW0w9diT2gjrirS4RcVts0dnvH+vqIXsjMEAdDh4mXawekfzsn/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MN2PR11MB4582.namprd11.prod.outlook.com (2603:10b6:208:265::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 11:14:27 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::e7b2:a7c6:5d72:2855]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::e7b2:a7c6:5d72:2855%4]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 11:14:27 +0000
Message-ID: <b415a0f7-c4be-49ac-acdb-e4c7849093e7@eng.windriver.com>
Date: Thu, 25 Apr 2024 19:14:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][kirkstone][PATCH] bats: fix bats-format-pretty
 report error when multilib enabled
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <17C65EAB22B5C2FF.10598@lists.openembedded.org>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <17C65EAB22B5C2FF.10598@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0290.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::7) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MN2PR11MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: baeecee3-4eeb-4c34-f5dc-08dc6518deaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3ZIVHpDZkxKVEpLM0lNdGwwT2VudFBYS2Q4eVJaTDhwT3RFZ25HS1BoeFhU?=
 =?utf-8?B?VGg4UCszNTMra2E5N0U0V01WdkxIWWNDQmVDM0pna1RpRDZyeU53RDhhSU5H?=
 =?utf-8?B?ZnRZVXRoL01qQW5pQTREaUdTcU5yMFVqTGZRQ2dmcE5naGorU29LM2x1RDBr?=
 =?utf-8?B?MlBpZmNwS24zMXc0a25UMDZ0NnVCTHVCMDBFQTVzcHNEeW1rQ2VCdjdHMDUx?=
 =?utf-8?B?SE9XYTFKNTJmQXp2S3VyWWREdVAxaVFMRXA2V3Y3V1B2SlZZVmJPZitSR1ZL?=
 =?utf-8?B?aUYweUFYWnNxUWRqN1l2aCtUOGNNLzlGQUpoV241ZGdraklZU1FFUHBFcUtS?=
 =?utf-8?B?MmgyMCs1UlF1K2ZNeUViSGFYMlRraXRJMGFuN2RnYXA5TUlFaE1qYzlseW5M?=
 =?utf-8?B?VmlJb0crYk9NQXNrODZ5K1FzWDR4YTh2VEFRQUJ1c2FvSDRub0hobzBhVXAr?=
 =?utf-8?B?WERYVSttLzFhemE2WlZveEswWEp5WG03bm12TXBBZFBwc3dJSHFCeDQ5RUNt?=
 =?utf-8?B?VnRtK1VLa01EbTg0aHJwaXlhcEFSZGhzYXFTVTl6dG1lemcvZnVldUN5SVZF?=
 =?utf-8?B?TDd4ZVlMVERoWTJTZmVselZkeE9uQjhaN2JXc3dlK24rbUFEa1BlQVB5Snda?=
 =?utf-8?B?dmVLOTN3STlSVjFXdVdMOVpRMWsxSmJTQ0lQNFNKM3ZuenBhb1hsTTJhNHd5?=
 =?utf-8?B?aG9OaERUTXdXci9mdnBWRGhFdUl5bWZSK2FUSVRHclZTOUxYdkVRK3IwaGJm?=
 =?utf-8?B?R0o5Ym1OeVp5SEtuclQ3RGQxQm9WVkdKNStpV2N2QU1zM1ZzQkYxZ01UcUkz?=
 =?utf-8?B?WE1HK1UxVFVZc1E1VEEvelpUZTRGUlV0VDdybDl2Nmk4VzlWWitSaTdHWWxL?=
 =?utf-8?B?THdwU2N0LzdSUjRodG9qc2ptUEF1MjZaSlhXcDU2di9xOWhGKzNRbUNWWGZa?=
 =?utf-8?B?d0EvNFdJU1ZJc1FQOVYyOWUxTGY1OVZtZTcxaUJoT3d0ZmtRSU1OODlGaGVV?=
 =?utf-8?B?eVpQRHo0V2VEb3pOZjFqb3V4SmpkT0Z0cFhVOTdDMDY2TVFjZWwzUTV4VFJN?=
 =?utf-8?B?TnNybTZDWUlKblM1eDRmKzJOSGE0ZW16OVJ1dFZEVDY1ZkdEcHUxMmJCc1hQ?=
 =?utf-8?B?emRRNWF4VmhoNkF5aGxZaTdYYVIzYytlb1phbnU0RnVDUFF4NTVBeGVyMmJO?=
 =?utf-8?B?N3NSQ2RNZnpqTlRrWnlRblBNN3lkaU5LTW5NRS9INkNJRXNwUlJvMFpMU3Uv?=
 =?utf-8?B?UUdWb3JBNzF5S0VsVFQzLzNuWm5BdkRKSm1SMndyaEZhOFBIenhjaEFVaGZo?=
 =?utf-8?B?ZUVkSE84SFpzYkZMdExSS1JWV0J1Vm1mYmNIWGVEbS9KMmIyQW9iV1FhZUE0?=
 =?utf-8?B?aUZkclRKd2FWZStBTDY5T2FMRXVYdW9tbTloUHc3cDBaM29ZbExZVGxyQ2pV?=
 =?utf-8?B?alpxNVVoUk0xVlhLQzJnb2VnNXNVRzdJUjExQVdpVGNtVGtDaUs1MFZJU095?=
 =?utf-8?B?V214NzBQaDNOZDM2YzlUeTRCbmFNQm0vUFJ5Q3lpTHpnSlB3eit2Rjh6YmlG?=
 =?utf-8?B?d05ERU9yeWlmSDdvZ1hWWkZtbG9GMnpndjR2UmdDMHYySUtya2dKbEUzYXBm?=
 =?utf-8?Q?j/Af3S7RkNtBXORKceZTqR0NGiJlFJbhfOxw5As97vpc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cXgzd0ZmdWd1K2phZVRYOGREdWFYU2pWTHRUMVRKdzlUcUIxc0hYSnlrdzFR?=
 =?utf-8?B?YVltczhRc0l1SW5yZ3A2cFNEcloxSmVNKzhTSC9RV0dRVTBhbElvb29pem1w?=
 =?utf-8?B?bUNHNTZ5dWxVVmpCdi9xcjBHaDRHT2d4K2g4bm14d1piYWZrL1RIZ0sxWjc5?=
 =?utf-8?B?WXN4Yy8ybE5od0VJczlLT2U3dlZkc0tQeG5ENW9PRS82RjhNM2JzR1RHdnFZ?=
 =?utf-8?B?NWNYb3pkdk8yREN1NEd1anRhaXRSNWVLQW5VTmtwZmlSZXhENHdaQXMvNXps?=
 =?utf-8?B?RlFncitEKzNLelh6UUF6L0dFMWxkV1N2ZXBhZ0p1OG4zekE1a3Y5MEs4Z2Vm?=
 =?utf-8?B?aHEwRm9aQ0phM2RRQXFOd1Q1bUUrdXlsSW9VUXhha0ZLdCt0UHNWQ1NaTVh3?=
 =?utf-8?B?Ym1aUTlxMGcxNnhkYkk3MTN3QWVxUUc3VVZHWXVNcElSTW5NNTVSVmFTQ1da?=
 =?utf-8?B?czdvaSsxUzIvdzVPaFUwN2E4WTl0Tm5qWm9oWHF3TUE3aEVFdmtTNWI3Qith?=
 =?utf-8?B?TU1iOU95NVk4eURUYTNtV09IdDRJYkg0VlprZXFrWU5qZnpNLzhUa1c0cXAw?=
 =?utf-8?B?bFRiYWRoVGpnWU1pdGJUMHA3eFBnTzhWOU8yRjFJc29vdTlZT0RpZ0xUcy9z?=
 =?utf-8?B?Z1pFSWVQT3lXN2lFaHNCZkV3enBjUjQyazJFS3lpY1FodDZCS3Y2Y0pheElS?=
 =?utf-8?B?V21sNkw5K0ViYllaL0hIL3NyZDQ0V1BTSlFJdnh4czVoY3NONWExaW5vOUNl?=
 =?utf-8?B?QUJBNGhFY1hwWDZRMzZWTE00cUdpVWhRWVo1UUVFWmwycEdqQllOZjhmMkM5?=
 =?utf-8?B?WTVSVW12UHh3ZWJ2QUF3UTJvS29VQnpSWCttMVYvU2xHcVJBbWwrZUpFNktR?=
 =?utf-8?B?eTUvN1Z4VUhOaU1iNU5SRjVBeUlLWVQyc0QrVE5hZlc4clYxR0VkSUJEaVRF?=
 =?utf-8?B?MXYzNmxEWEdrRGJZQTlmT0xDMlNNemN0MS9EaTZBZmhjT1JKNlE4WkJQMCs1?=
 =?utf-8?B?c3pGazgxeFlKaWV5VmNVUkZ0Q3MyQ2JTMEpOc3crV2taQXNsTk1zcFk5aVV0?=
 =?utf-8?B?L2lXM0xsbGV1Um5aVjV0SjdRTnVLMFh1MkF5RFJ5OUxSU3dZNDNud0NvSWpV?=
 =?utf-8?B?WXJvSGMvUE84T0N2aXpXNnVJRlZhaXppTVYxK0JwWTVFTEpZZXBmZERUbTlm?=
 =?utf-8?B?Tm9ydjd1SlVTT2tUelQ1WE95VWpiYlRVT3lIc3k3NnRmMjFIdmpucDlJTEVj?=
 =?utf-8?B?NVFRNDhsNVNyM3RxMElGSU5LUkZqM0Zhem9wU2JXYWRJNHpadWZSVUZ2Z3Jh?=
 =?utf-8?B?aFpoV0p4RDFWQ2x0cXNEcFBINDRYNnZFQlVNZ0dRZ2JvTVFMSGlQR0dZQjhL?=
 =?utf-8?B?aXdra3dpWHdsNUpqaHJmbi9TNlFRMm5wSkIxLzJTK2RJY3kyNzhmTHUwWHlJ?=
 =?utf-8?B?bDdUR003R3FRZEQ0TkcvMDRhempiQmNCaUsvWHFvWFVrNC84bHhrOFk1ci9r?=
 =?utf-8?B?VklRc0Y5cXVpb0ZEVUY1a2lXaU5mOTNYYkdrQUdjNlB0S1IzcWNHenBud01C?=
 =?utf-8?B?OGQ4Q1ZTa2lkb3I1Q1hYTnhYb1k2RklCK1JGM0NNZFNWSUVUMjNlY1Axbkoy?=
 =?utf-8?B?ZVgwZEJRWlllQzJBR3B4N3JjQTZ6Uk9oOWlLMDZMYUtWK1dNdDZVVjJkeU9h?=
 =?utf-8?B?blcvZXo0RXNvSFhPZ3poazhFWForVW8rS0dIVDdvdFM5UXN0ZlM3L3U3d2xh?=
 =?utf-8?B?WElmSncramNDTW03TXdpZlNvSHA0QzBaRngremNvUGNjWUJSR0F0Z2NJS2hF?=
 =?utf-8?B?Z3RBMjBqUWluTVBhL05tNFZ3NUZOeXBLdHFTUkNmcC95b0lUSkF6d0loSkZt?=
 =?utf-8?B?cUFxekttMm45V2pKWTJxSzNYSlpDOUlCSXlQY1BCVWxQQUZOMWh4cjRYWFFB?=
 =?utf-8?B?czVxaEZxb3R3dnZUbEtPSG1odHZpQzMwSGFRcEUxQVZTbG1hSUFRMDNVcDhn?=
 =?utf-8?B?YXlWK2grMC9HRzU2MTNaQ0c4azZ4Vk5UVmlvRXBlNnZveE1OS1dHamVPWHBY?=
 =?utf-8?B?WE13QUlkU3pLWWZ2YUF2KytpM2lzMm1VczQxMjJmeEp3MS9peHlTenpyZUZ5?=
 =?utf-8?B?SHJqKy9GK1MxT2VndnpFOUNuQ0tFTG9PdGtZYkliaUdNVXc5Y01VcUdlWFdT?=
 =?utf-8?B?cnc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baeecee3-4eeb-4c34-f5dc-08dc6518deaf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 11:14:27.1887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMHxqlfDD42NAxBAPzCQa5EMdKy1m7HSHXauzdmQMOBMA9rss9iYjHAg9bQ25HnRDoxk07P6oxzk9+WjActmew0WWEFHhvshZfgqLuzBHwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4582
X-Proofpoint-ORIG-GUID: bSfeXALqW3p7uA9Rk8juI1G5VH0UPPlw
X-Proofpoint-GUID: E-8Ecw0G2LZvOb5JcFCfKChI0KzKPqqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_10,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 11:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110151


On 4/15/24 13:59, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> bat-format-pretty hardcoded the lib folder that cause it reports
> missing formatter.bash error when multilib is enabled.
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>

Friendly ping, thanks.


> ---
>   meta-oe/recipes-test/bats/bats_1.6.1.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-test/bats/bats_1.6.1.bb b/meta-oe/recipes-test/bats/bats_1.6.1.bb
> index 7d72a5198b..3dcb51972d 100644
> --- a/meta-oe/recipes-test/bats/bats_1.6.1.bb
> +++ b/meta-oe/recipes-test/bats/bats_1.6.1.bb
> @@ -19,6 +19,7 @@ do_configure:prepend() {
>   	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats
>   	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-exec-file
>   	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-exec-test
> +	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-format-pretty
>   }
>   
>   do_install() {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109952): https://lists.openembedded.org/g/openembedded-devel/message/109952
> Mute This Topic: https://lists.openembedded.org/mt/105530685/7175143
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [xiangyu.chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

