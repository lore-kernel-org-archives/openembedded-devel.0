Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8187CCD1A5
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 03:05:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.271.1761102350109392612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 20:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=SiRwMSh8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2390edad6f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59M2x1Ib2398617
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 03:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=GjHLj/SuJ4JieipvMUbFo54In0hZfEEEefd5OXFkVmI=; b=
	SiRwMSh8BkjgW9dsl+ISIr40CdTi7QjVqzYr5+W5XI6UVSMmDOaoHQ9rKMWRpI4+
	aADAl2FgoPR0c5+fXAkpVhYHOqPGr7yP2B7tFZNKb2MJKpj012C+vzIpPBgUB9sU
	WV184EiqIwby/zcrMis7bKCQSA+lt/hRQ/edSWuHwNS5eWLHZGV70KC4RqHrdWmq
	oyAJLKRlr4HIl4/URK2FuX/7/isSyjcXzp6XqS5GgH2yHp9WkXdJi7KqdonfKATu
	gLZTqYtkFMoQ6OHl+/oiVL3v66B3zhn8gxJRtwYyR4m5TfYzGc6iEyeEhMLcw04T
	++3F3xPMvEEk6F9OEQn3pg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013029.outbound.protection.outlook.com [40.93.196.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49wrpx9yy1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 03:05:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9DoIUWFe6TInl6wwVQjVQGckh7yLpPRaljYLC2k463V6WXwy6jpRd1+HbKZKpcsF8UyDQmNi7J+dssyRlchSf6CzPHmMykUX2syyQ2scxHIje+iyvSKsOHPb/U1zsXQPkNUUi1MEWOyOyMT4uYvkuGBeKDNYELWMztMtGLPJm90/dSoguopmkt9102MYCsNhEhhDQ7/OK9Jx++BsWqXsOu5rYCU7VtJ6iVN/me5wn9WoRr301kquW0b7UCu3HlKEda4206RKYouZdWY/tOKHKWqJKQreIxZaoCjGGZxW82e1hhrqV7OLax9dEAn2U0ZA4LtL3G9CfMtLNES4NZBoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjHLj/SuJ4JieipvMUbFo54In0hZfEEEefd5OXFkVmI=;
 b=tsaaoXzyB2BQY67OKFOfwZhBFtMWm6xU36LVkGhYot1yxDA+AK/Z1e7QTxxjZ37F9Znez4VnubQcz3oiZeFQAsC67RbYhMSJU0tVzM0QmSyEJVy30Pi24mPVPgXiCrMeA6UrZWPQMQOsEe/QUv0USo85awUh7X/bsDllamryWg/BVLdAG6S88MWHtXVIMuOr+QyUQ/3NttTEWNfDEqIGNPV1DO4kixlwwPN7W81MDIH5h5GDjRs3sQRk3L0VWu0i1qiHbKr0Rh5buVGyY16GPq2z6NNpW1cvajjtIrXCRPuYAzHhRgs20XJaEZcASPcmO3upJ4/SiVIPWQ8Ab3Hiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ0PR11MB4880.namprd11.prod.outlook.com (2603:10b6:a03:2af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 03:05:46 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 03:05:40 +0000
Message-ID: <dedb4143-6db4-488b-bd91-07afa291e078@windriver.com>
Date: Wed, 22 Oct 2025 11:05:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v3] poppler: fix racing build issue
To: Khem Raj <raj.khem@gmail.com>, hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <1870AFA4856349AB.25855@lists.openembedded.org>
 <20251022025948.3520973-1-hongxu.jia@windriver.com>
 <CAMKF1sqpMDSt8J6MuzRGWKAQjZcHMSxqJ3sxqzztYpwkahfTfg@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAMKF1sqpMDSt8J6MuzRGWKAQjZcHMSxqJ3sxqzztYpwkahfTfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::16) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SJ0PR11MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: 5257d701-4ca9-442f-1705-08de1117e192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Ym1oRlNWbTZrU0cxRzZ0RFhaZ3lzenJFRFdrc1kvcklMMzZyZDVyWTQ4cGxu?=
 =?utf-8?B?dGV3b2l3WDV0bDlEd0lWWkRvSlVIYU1ZMkJDMEtneCt5aG1uVy9qR2NpY1VK?=
 =?utf-8?B?TFVYSG42Vi9qYS9oNWg4dlc5YVlJY1BKZHU4c1IzWmwrbzB5SnFkMzhXYTRT?=
 =?utf-8?B?a3dLVVN3MllmR0Y0UHB1N0RWamt1cVdQKytQQytRMWZhUVZYNHhEM1M3Mndr?=
 =?utf-8?B?Y0FGRXRRM2tYeXR0UlAyTmw4KzF5VjY2TjM3YTZtLzQ3SGJYN3NlV3IzdFBU?=
 =?utf-8?B?NUVYajVmbzNHWUhUZmRReUVHZkRmOXlBMCsyc3ozNEpmeTFaR1NscTc2VU13?=
 =?utf-8?B?NkNOMFo3dHBXVGVWTG9PU1FQU2QrdUM4K0QwS0JNOVJXaVV6L04wUXNnVGV5?=
 =?utf-8?B?a1pZdFhCYzF4ajIzd2JlQnpYbkhiakNnaDhwcmpvdnJRUTFlQWhMbS9GM0ZY?=
 =?utf-8?B?emhZcDdaOTFsYlQ2aEx4MWZxNCtuNmtIbUQ0NnNGMEIwSm8wS0lLR08yT1Rx?=
 =?utf-8?B?LzlQSno0THRYTXBMSnUwczBNdUZOaVBMVjVnTERlZUZVT3MxOVZudjAwS25z?=
 =?utf-8?B?dFVHOUlkVmVTVVNxcTRFTmxXeVNQazlmOUR3c1JUTFBHQ1plaGttc3llZmt5?=
 =?utf-8?B?VUxrbWFKK3Q4akkwZVd3VzFUV29JNFYycENLVjQzTC9PVnN6UWxsbm5MNFRv?=
 =?utf-8?B?Wjh1OEhyaGFVR2lwTmM0M3Q5MmFEOFV3VEM2emp6MWx3QTRzWlhWeWl6Tzlq?=
 =?utf-8?B?Tlk5SUhFSzFGL2V4Q25OQzF3UG1rS1VDajZqMmwvMU1ndHVBeGRPY2hUd3Z6?=
 =?utf-8?B?U2E1alVUTmhKeFRVZ3QxRjdoZ0k4MHNmYVlmNWdWNnFMVjIyTVZLeGx2YkNI?=
 =?utf-8?B?d2xrZXNaT0t3dkEvMm9QeEd0Y2tYWWpxOG9QNExmdlZpRFpBNEJJY0ZUOUE2?=
 =?utf-8?B?Ly8xZkhmYmZ0Nm8zZk5mQ2c4bXJMK2l2b3dEdVQwVkpjbDN6WWc0bHZNN3JH?=
 =?utf-8?B?YWZjTk12ZTZiWVBPaC8yNlM1YVlLR3F1RGxPWEY1UzIwS0d5NWRmdGR2SU9R?=
 =?utf-8?B?TG5BcnVLZ09qclpDYkJKak9xU09iZllPK3czM1FkMnpaZ0hSU0k3bkQzZ3BN?=
 =?utf-8?B?bUJJbDVYQnFQOGZoajVpUDIxQVdYbVJrUlh0Y2tiMUtvajdqek56Sk0wL3ZL?=
 =?utf-8?B?YmRFUnMrdlo0YzRmR0xvUUNHOWxNbVZqZU9xWnhtenhoc2dFVVlBVHQ1NUV3?=
 =?utf-8?B?RGV2cVNncGUrZWJhRVFsS3dpdmNIMkNBMGttWm10MCsremFPUFU2bzdaSGhI?=
 =?utf-8?B?QzhhdCtTTk9nMC9hQzV5OS94NElOMDd3cjVHQmpxZzdjeEJmdG1hUnZYYmlv?=
 =?utf-8?B?RWhlNnJkQXJUQ1ZxWCtiYWlWRS9HNEhQTzBMbVI0NCtNTFVaQXBLeGpjTnNL?=
 =?utf-8?B?aVRIUzFkZzFXNkorNkN1UDBETVRvQ1ErNmNWN1U4SzlOcGtsTTdxZC9XaTV3?=
 =?utf-8?B?eGdOejkvcHdYYmdEa1ptZ25aTEh0cmR3b3VsdlUvSTNodm5Mc1lqRTJhWXVo?=
 =?utf-8?B?YmNqMy9uM3E5R1pqN0c0Z3Rzb0R0dWl1RXptUDM4L3ZLMDVCYTJrTTdmMGZS?=
 =?utf-8?B?aUZ0WTBqSVk2SzhsVGw4SjZsNzFoNHdFclBaNkVnanlZclI1Sms3bGF6Yld4?=
 =?utf-8?B?WGRjWTFadWxOVzczcE8zS1ZpN2FsYkxuSkwyUTY3NjdUNjZEVk1GQVBrRFlJ?=
 =?utf-8?B?WHkxUW5xVGxMczgyRkZJUlI4Tzl5SnVGTGR2ZmdqV3RNZDh4cGRsU25zTjRQ?=
 =?utf-8?B?Ykd6ZVRKNGZsNC9ISGpVeEV1NitwTGxJQWFrSno2MW1FblNmbURVZWZGbHVx?=
 =?utf-8?B?K1lqUjU4NFU0TjJHaHU2cWNFaGdyZnE3WjVwY0ZiSWVxZEE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eWdPMS9RNk9HM3g5NzM0TUxtSHU3bzVEc3J2dkNLMi94R01udUZCS3kxQkhj?=
 =?utf-8?B?enZBaTdjMGJ1N2dTS200RVExT2MxSTVibS9VSCtkSCthMUI0LytBU2R1MDI1?=
 =?utf-8?B?MDN2YVFkN29ETzhURzBmTG13TzAyVUxBd0ttNkdQeEcxY2d2TGhPaVVUem1h?=
 =?utf-8?B?OTBvY3ZBbGwyb09wb2k5VC9ieHVOU3o2TDhTRUY3NHRKSGdhTEJxWUhBN1BF?=
 =?utf-8?B?bEYyQW9iWHB5aHBwaDN3dXNqMS96L1p0NlJXc2pOQkpZUmh1SHF6cnJFa1V3?=
 =?utf-8?B?Mi9NR0IxNjJ6bnk3L29tT3lLRFJadTFLczAwYVlEckZGOVZFcmpwcXpFeXlQ?=
 =?utf-8?B?M1NsVk5nR0tqc2ovbEhQYksycGdjUVRVUGNIN1NmYkR3dThYQ0RHSnQ2UVQx?=
 =?utf-8?B?LzRwbzVzSWI2Q25aaGN0SzZMNmp4N3VtcGVKWDBVUjFscm1EZTZCUjdMc1hs?=
 =?utf-8?B?cTlYZTlNMVJFYmljSEFqVVZoRkF2bkRiL1VZRFl3QXBHN09xOVo2a3pJN0Vx?=
 =?utf-8?B?N2RiUHg2TDlMS29wQmpjNzdIeTJrUHpRQ1hybjlHWDFhSUxjWDNHVzZNNE9t?=
 =?utf-8?B?MnlJNEtnRzBqR0lva1JWSi9EM0VvaTk4eFRNaVdXajJjbXdqanF4dDRlRWt2?=
 =?utf-8?B?bjNKY1ZJU1FxRlFnTURwdktlamswVE12dWVDK3pmQ1NnWnhQYkhDeCs4MCtQ?=
 =?utf-8?B?bndLSm5PbzIzeGN3d3lYb1VWN3pNUjZEQjRuNmtjSHgzQ3dWb0hWLzZobXNK?=
 =?utf-8?B?elREeUlyc2lpNGJUK0FJUjYvbTBqbnZqc21OSnRKRkYvRWRHWjVmVDFNMGNv?=
 =?utf-8?B?MjBPa1B4WmRjODBiRUQ0YWZrQ2I2U1ZPak1tVnNaVGtUaVlxczNkV3gyNVNK?=
 =?utf-8?B?WlhHa1M2VkpNYnoxd25sRDNtazNmMlFOakxyeG5UNE9xL1V6c1BuWXphU1Nv?=
 =?utf-8?B?aTQ0U2U5SFNqdlJEbVMvemJTc0tkUkJmMzBtVjdUK29DNTVWNy9RTmpRc016?=
 =?utf-8?B?K0dWMmNoOWFxU0RhYTZZMUJIeU9YanhLcjg2bmp4VGlubUhTbFFmZU1zSTds?=
 =?utf-8?B?ejNtdDcyR2RxeXk0YVhGcWZxSmxBenJKNDRKdjlxTjVsSEo1M29hYUtLMVdr?=
 =?utf-8?B?THBYM09wNS9iMHVSUE9CWTNNZ2Znbllpb2JhUVNGa2hZcTBlUHFTdmYvS0lq?=
 =?utf-8?B?eGhFT2pDVlNLYzJndTN4cVlQZjhjbjlIbE5nSGhWYnRWM1A2cEdHN0UrTTlD?=
 =?utf-8?B?cGtHb05YZ0E5T09tSDNOTWc5dkkvM2FaSDZ5dnl0R1FKQVVmWm5ZN2c2Y1Ja?=
 =?utf-8?B?TTNNYXh1NEo2S3o4YnFVTUFmQnpiTXBERE5DZ1ZMZjVwS3hUYVROcC96YUZq?=
 =?utf-8?B?RFUyMTlUS1o4cjBFTEN2aUFjRzJ4TlpOU0pkYUZhWXowZGxIeTg2bFNyS044?=
 =?utf-8?B?U1JDV3E4Y1ErSWJQSjFFbDlZLzR1VmVMSGgxOC8xbUNpN3VtY0pZNEEybmhN?=
 =?utf-8?B?VzJuUG5tcmpQOWkrcDhSRysxMlpXNEphUFNnZWdlVjlmNnVBOG1jMmFraVpP?=
 =?utf-8?B?R1QrRXErM0wxdTYxV3AvM3hZTk80ak1SZkhHenR0VjJSM25YUzJudVU4L1dq?=
 =?utf-8?B?T1lmcDAvNXdMcG5vZEZuWUtWaFh0UUdjcVFZZ2c2aVJTWktMMVJidkx4VEdS?=
 =?utf-8?B?M0p3bWYwUU0xMzV0c05hQ2VzUDY3R3dySmN1VC9kS2hoSHQ0emhxaCsyNkk3?=
 =?utf-8?B?MFFGYzF3QmozcU02V2Jaa2I1V1lGOExML0lYbVJoZDEva0kwQnRmTUdPaE12?=
 =?utf-8?B?dTlLam5XR1U3bmdJOWFTcytUZEcrTk1QQmplQVpBNUh1N2ttZHloK2JqcERW?=
 =?utf-8?B?V2pwUkwyc0crbGF4V0Y4TThxODE0MVNzc1RKWVJDbnRZb1dRSXpkWWZKRWxQ?=
 =?utf-8?B?UWFPWHFLZStKc2QwcEoxN3doM3l0NUlwc3QwUVYzVW1zZFdyb1BBd0dJV0lw?=
 =?utf-8?B?WnZFcVhYelZxRWRsa01ja1hBQzFnaTVPaTRnY0N3cWJpRW40MDZHTWpucFND?=
 =?utf-8?B?U0pmRHRJeDlJMy95dzdqSFZBQ3RmQXAzTG9EUXFwTnNYK0ViZWNCaWlPYlZM?=
 =?utf-8?B?aUttZndYQjZKQllONEtRZ1h3dkFpeUkyQ3gxWE9vRUJ2UktNQzBmMGdHbVdZ?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5257d701-4ca9-442f-1705-08de1117e192
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:05:40.2029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpEeZ9PyRTNbaEstjOG7m7iodBfdqpjNa85qNqtcsXMFRpHCUUfC7sc04POif1AGBpgTUqomM3TDGZiCw4lhXnLoI7iz8H1Tsrsbr6ML370=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4880
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=b9O/I9Gx c=1 sm=1 tr=0 ts=68f84a0d cx=c_pps
 a=y599upwrfiZ3HV94zaFOUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=OaDSxgosvDCSNFFRAlQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1QVoLdzNYnjEAjuGC1-TTuU7NQbw_obS
X-Proofpoint-ORIG-GUID: bAXsgNJjDLgvu2w9YCOy7gSNAS5d8yk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDAyMyBTYWx0ZWRfX7dRBhDCjDZvr
 siha8Gi8UbLv8LN27jGjKX2d9jnHcUeb4lAxkQi/W1QYr6Swj9kS3g91pD7/8zxwqwQHP1It43Y
 pjkN5iRpX0nfIkR0PrKIqwuO3If8CrU3xbvVvwiWUYVfuw+mOEi+/4iQTn66woxmDAbdtRSJ3i0
 uo4ePUQEiRBtSeTS1pfQWKTspdKxPenXXmytuCTMuYW5Znt6AJtUu+oSYbxa7FerL4RyfgMefQ/
 PErcHClsbPOIiX2VhOYg499isIsgAvlN+Qgc0YH2AKF1dMW6y/XOOUDoxyFMSU+zmuH2YhPimOQ
 GQZVlhzcBvwRlMTAK3Y5VVl8+/qCapFNdeg5Et9DVoqymggSn2twq+CWEVDRJVJIYTLs7IZToHv
 M7V+VsJ2+ZrVlb8kKtKyf90TyzSsZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510220023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59M2x1Ib2398617
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 03:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120880

On 10/22/25 11:02, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> what changed in v2 and then v3 ? and it does not seem to be rebased on
> master branch, it helps if the changes between
> versions are clearly documented and feedback is addressed.
The upstream defect number differs in comments between v2 and v3

https://gitlab.freedesktop.org/poppler/poppler/-/issues/1550 in v2


https://gitlab.freedesktop.org/poppler/poppler/-/issues/1551 in v3

V3 is the actual number


//Hongxu

> On Tue, Oct 21, 2025 at 7:59=E2=80=AFPM hongxu via lists.openembedded.o=
rg
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>> There is a racing issue in world build while multilib enabled:
>>
>> ...log.do_install...
>> CMake Error at utils/po/ca/cmake_install.cmake:46 (file):
>>    file INSTALL cannot find
>>    "TOPDIR/tmp/work/core2-32-wrs-linux/poppler/25.08.0/build/utils/po/=
ca/pdfsig.gmo":
>>    No such file or directory.
>> Call Stack (most recent call first):
>>    utils/po/cmake_install.cmake:47 (include)
>>    utils/cmake_install.cmake:243 (include)
>>    cmake_install.cmake:229 (include)
>> ...log.do_install...
>>
>> The issue has reported to upstream [1] and upstream tried to fix it [2=
],
>> but the issue still existed. The catalan translation of pdfsig is not
>> vital for poppler. So revert upstream commit "pdfsig: Catalan translat=
ion"
>> to workaround
>>
>> [1] https://gitlab.freedesktop.org/poppler/poppler/-/issues/1551
>> [2] https://gitlab.freedesktop.org/poppler/poppler/-/commit/053acd5d2b=
310c696993dc97072d1f2b3b1dd7ac
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   .../0001-workaround-build-racing.patch        | 43 +++++++++++++++++=
++
>>   .../poppler/poppler_25.08.0.bb                |  1 +
>>   2 files changed, 44 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-work=
around-build-racing.patch
>>
>> diff --git a/meta-oe/recipes-support/poppler/poppler/0001-workaround-b=
uild-racing.patch b/meta-oe/recipes-support/poppler/poppler/0001-workarou=
nd-build-racing.patch
>> new file mode 100644
>> index 0000000000..fdf4f7ff70
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/poppler/poppler/0001-workaround-build-ra=
cing.patch
>> @@ -0,0 +1,43 @@
>> +From 83ad73024c69d41fda302f39acf50c381684890e Mon Sep 17 00:00:00 200=
1
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Tue, 21 Oct 2025 02:39:36 -0700
>> +Subject: [PATCH] workaround build racing
>> +
>> +There is a racing issue in world build while multilib enabled:
>> +
>> +...log.do_install...
>> +CMake Error at utils/po/ca/cmake_install.cmake:46 (file):
>> +  file INSTALL cannot find
>> +  "TOPDIR/tmp/work/core2-32-wrs-linux/poppler/25.08.0/build/utils/po/=
ca/pdfsig.gmo":
>> +  No such file or directory.
>> +Call Stack (most recent call first):
>> +  utils/po/cmake_install.cmake:47 (include)
>> +  utils/cmake_install.cmake:243 (include)
>> +  cmake_install.cmake:229 (include)
>> +...log.do_install...
>> +
>> +Revert "pdfsig: Catalan translation" to workaround
>> +
>> +This reverts commit 99f5416d9bfb6a34bbc5cbcb368e258b98fd3f08.
>> +
>> +Upstream-Status: Inappropriate [Yocto specific]
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + utils/po/ca/CMakeLists.txt | 4 ----
>> + 1 file changed, 4 deletions(-)
>> + delete mode 100644 utils/po/ca/CMakeLists.txt
>> +
>> +diff --git a/utils/po/ca/CMakeLists.txt b/utils/po/ca/CMakeLists.txt
>> +deleted file mode 100644
>> +index 3225131c..00000000
>> +--- a/utils/po/ca/CMakeLists.txt
>> ++++ /dev/null
>> +@@ -1,4 +0,0 @@
>> +-get_filename_component(_lang ${CMAKE_CURRENT_SOURCE_DIR} NAME)
>> +-gettext_process_po_files(${_lang} ALL INSTALL_DESTINATION ${CMAKE_IN=
STALL_LOCALEDIR} PO_FILES
>> +-  pdfsig.po
>> +-)
>> +--
>> +2.49.0
>> +
>> diff --git a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb b/meta=
-oe/recipes-support/poppler/poppler_25.08.0.bb
>> index 45f94b0ae7..3b0b4b0e99 100644
>> --- a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
>> +++ b/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
>> @@ -7,6 +7,7 @@ SRC_URI =3D "http://poppler.freedesktop.org/${BP}.tar.=
xz \
>>              file://0001-Do-not-overwrite-all-our-build-flags.patch \
>>              file://basename-include.patch \
>>              file://0001-cmake-Do-not-use-isystem.patch \
>> +           file://0001-workaround-build-racing.patch \
>>              "
>>   SRC_URI[sha256sum] =3D "425ed4d4515a093bdcdbbaac6876f20617451edc710d=
f6a4fd6c45dd67eb418d"
>>
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#120878): https://lists.openembedded.org/g/openembe=
dded-devel/message/120878
>> Mute This Topic: https://lists.openembedded.org/mt/115886629/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


