Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B73D31A2F
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 09:22:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6481.1768382513161366541
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 01:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lnX7BISy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=547401f5f5=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E4crfW2676164
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 09:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Hkgxd07Cc9y5B9yj0vt+6rgXRAOdUEx5SijSglMrxn8=; b=
	lnX7BISyQft8cGk9leC3jq+mmmRtKqDpB+qg7jHFX3x2DToQBSOtVwLSNWa/vJ76
	01Cwe0DmnzN0cVDmFowSVZHl7fHUG5PSFKDytPIHswVOyWVceb7sw9v88tndcvZS
	UidPCfpi4JoSxpPATxlHEW22coN4Ddtwl2oSThnTzMs9Z07lUQF9HNl2MdK2WJRP
	dtT1t6taLO5kw87DtPkCzVTaH4lr+3zLu3UjRRBN7wwJ7ONP9JtmpI+Q+oxO2yb4
	ojGckptSbEzZPj50RmMMYvSmthx+irGFAS5hJOS4Jcas3zP0qpQmVnV0Hl2P/6Bl
	z/myHe64vYetMHYbV7jQnA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkdr2m8hw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 09:21:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUtkQf8gKevqQ4PSnaLdYW/8lq1eeCyFoghhccikpFV+RqdSZ8py4z4QPkX0jmRqLWELTgOoqWwqL07UvP2NZJvujaflPUYt0xdOg4Ok6J+J3dEVdigGoQn+O+Rq33tKLGAD2K5UZoF3XBjGAXdNmQS0t+mfLBO8jvuWQ/vYNVaewVCk1uAlhm+SQ+ho1ae0KCTuvhWZ5HAjvBiY8cu6uU+K9MomPSnKwb9bYcYbHKaQvIUZZN0UIbsqup6BBoEMZ7nSWk8LytYb03aRiNyYrl3ljxc8XKV1QCnlL6HjaCeS8MyaBOtJZ7AlSKLanXuFrg4+u5AvnJYQvKzEMtGJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hkgxd07Cc9y5B9yj0vt+6rgXRAOdUEx5SijSglMrxn8=;
 b=GWL25ub3uc27DMWkq/wvXiJKDQEzcgiXi6zMFcXrl/3BC3/qOpSA2ZQPwJI6nnEkDB8GKjTaCyQgRZo0TvJ58LxWp71Eoe+fDqw6JgBDMWisH6VucPMhoLzwLksG2QDADFvdiVsiIkNC0O/7e/t09fYwDRLzK5EQ+JsqTGG55S6TmSPV3tRHf8iqvEFR3XOui3hWAtO28fu4iHk+McJNqSWhquL1AjLDZrh9VzIU0n/eterl+h1qlj4znOn1FDfBBdi/2+gSUoxRW64BcO31O1kLYbj/DlG4+g4ZFBIIj25//oXPpG/ioix0Ch1NgNeR8HCGuM1wz8wDJn3/UZVOsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9)
 by SJ5PPF5B09F0799.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 09:21:49 +0000
Received: from CY5PR11MB6440.namprd11.prod.outlook.com
 ([fe80::90ea:c216:8cc7:3757]) by CY5PR11MB6440.namprd11.prod.outlook.com
 ([fe80::90ea:c216:8cc7:3757%5]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 09:21:49 +0000
Message-ID: <87d4894f-8db4-46b6-8c47-df82e3cdced7@windriver.com>
Date: Wed, 14 Jan 2026 17:21:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] nodejs: Make libuv related patch
 conditionally
To: Khem Raj <raj.khem@gmail.com>, mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20260112082438.1529670-1-mingli.yu@windriver.com>
 <CAMKF1sq+LMsEcU8Vfi_nf_Xui4jDvpsrPaee-=0OU05h_nTgBA@mail.gmail.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CAMKF1sq+LMsEcU8Vfi_nf_Xui4jDvpsrPaee-=0OU05h_nTgBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: KU2P306CA0014.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::8) To CY5PR11MB6440.namprd11.prod.outlook.com
 (2603:10b6:930:33::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6440:EE_|SJ5PPF5B09F0799:EE_
X-MS-Office365-Filtering-Correlation-Id: 953f7ec8-3a58-4a58-50fe-08de534e585b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UkVWUFhnYTI3aVpYRzg3ZlN4aFkzQi9IeWo0bzJPTHFLRTZlWnRUZ1BhMXpz?=
 =?utf-8?B?aWcvRFlJU0d5c2tVUHZtZWtTTysrcGIwSnVtS28vOUQxMUh2bEcza0U0V2Qy?=
 =?utf-8?B?VmFYd1BrNU1VTXlWZE51am83QWprb3lzODdWMEZuR0gyeTRGWDdYendQUkpK?=
 =?utf-8?B?dWIrNk13ZFo0VFFMNFBJVmVBbGl6ZkJzc3k0VXkxb2V6S0hGd3dUWDFUZThu?=
 =?utf-8?B?UWhldnRhL0ZWZ2JIZEsrcmpnaXFLWWxka1BmbWZpTXpKcXJoQW5pZGkrVVZl?=
 =?utf-8?B?bytaSkU3SllLN0cvV205Vk1iOGtKaGg3TVpPcUxFakU0RjkyK1ZoTitaUkhN?=
 =?utf-8?B?eCt4Y0xkRWpEV2lKQVlpbVBYYVcvTW0wNTdkd0V3dDNHNGlSQUVQUzhWRE13?=
 =?utf-8?B?dkxrMFZxNEJ1Y2haNkcwRjNQM2NHNEhBOVluenBxUmZWUURKaFl3dE5Da052?=
 =?utf-8?B?WXp4YjNPTDQ1WTFBaGVtOVRhdDB2dTJFMVk1WDRhVTNFblY2cWZXMVpPOWNO?=
 =?utf-8?B?eXZmMnhzREZEenZmbE5nalB4WVo5eVR6WW10MnRLanhnR05sK0xwbHhReWZD?=
 =?utf-8?B?aG1PeUtieGVrZFU3T3paNEEvcFRpMERzcU9kTU1vWCswelFRaVI4WUNYQW1t?=
 =?utf-8?B?Q1VsTzJHNDgyclFYQTJMZHB3VkMrNnpQbFZ3bVEwb0JWNFBsdkpKNEhiTis1?=
 =?utf-8?B?b1Z3SjNjb2lramdieUIwSUNzckd5cGUxU25tWk5ZWVl5MkluMGlXVmJjYWYr?=
 =?utf-8?B?OFVTTE50OWc2emVnMzlMTXpiRThwNGUzQ2l2M0owbDFTTTIrT01GbCtneXlh?=
 =?utf-8?B?akZpUWYxS1k5TlhQc1JtRFYrTWZMYlp2cElBV3Avc2xIUW9TRXd4UUdTeWg0?=
 =?utf-8?B?YVZMNXJ6T0I2WmxzTTBTS3EwY3hadTlsVFd5Y0kyWjZXZkpFV1ozNndiTlV4?=
 =?utf-8?B?RzRmUFB3ZUwzeS9lWkgvcUhOOC9ibzJCREpDb3ZGY2FOZG9ubjJHTllNdmpN?=
 =?utf-8?B?cWgvOXU3QWtkZW4rRWozK3JpNHVkN1pjd09IWUoxc0dKdGpVY0ppWVpadGRE?=
 =?utf-8?B?T0VuU3dFZ3NZVzZVYzAzZXNyMEpNRHU4dEROM3piUWV5TjZqdUVaOE1Rdm5P?=
 =?utf-8?B?MFErT1k5MmVmeUNRQjhuWWJOWjA3QVZjdmEzeTBYSUR1d0p4SFo4TVBoOGR3?=
 =?utf-8?B?MVhtZlhTS0FMWlZmZmtwNmVuUkhyWWY1UG1KZGs2NEFLR0FYMzNGWkdyMXJh?=
 =?utf-8?B?R2kvVlNNUzBpVVQ3MU00OHlKR2NHNlpTUHZHdXJMN1RLbXRMVXdwMDNicFdK?=
 =?utf-8?B?WFloRFlwMkxNU2tzWHV1TklNaTZJL3NURGVrVkJUMlVsRjU0cFl0VTRiVjlV?=
 =?utf-8?B?ZW9DK1VYb1hPUXBOSUluWEdCNE51SitxNHRUU05GQ0k1QWdKUEJHVithc2da?=
 =?utf-8?B?cG13K2ZSTDF5RktKUWhVTUM3NmZTOERjbXBrZWZxcy9vMHJuR0NlTzFlNG5k?=
 =?utf-8?B?cEQ0QTBWZ05TTTVOTW5mL0RPZ3hnVDFjaHBlSm9aWmpsVWJqdXZZZFFBR2gx?=
 =?utf-8?B?Qk5KSHJodFRERWxSbG9EdSswSm9SZlN5OVhtcUlwS3ZqUGlNV01WVzNGdERr?=
 =?utf-8?B?bWFGSWJoc0hvTStCQXF5cGVBUHEwVW4wNlBVOEkxb3NmT3oxQkQvMzZJcnlt?=
 =?utf-8?B?eStheENJL2creHoxTGRVOG9CUWxSVC9BS290MEp6RGF5S2ZlR05hL0tRZ1hN?=
 =?utf-8?B?eFhBYkdBTm9jWFNYNHVkTzEza2JMKzVxT1dMMElXUi91cXpJOHJuUHBBRjBH?=
 =?utf-8?B?anFZTjNCSkgzdENmT1VPeUpzWVdKaCtNZlVHUzFwV2lwMEFKWGIyWlowanFw?=
 =?utf-8?B?a09MditiL0lCY3dJNmJtbDBucEtzeWtQTXlNcUIxK2FVeGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6440.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azNpV2E5TisvRGhhT2hSN0N5TVUvcUJBblNQRmFOTWh1L1UrV0RjZS83THJy?=
 =?utf-8?B?bjFOWmxaL3h2YWp0TStLRnd5eFNjSFpkYkhNd09GUHBYYkozVHZLZUV0cjFO?=
 =?utf-8?B?bFhRQTV1TTJZeE9ZcUdEdmFPUk1zQkhNbUl3aWdqYUpKTzRweUxMU1dSdkJa?=
 =?utf-8?B?akpFUWQydmQxVkRwMVkzeWRPWFY5L3JKSGc2L1JVNzBxbDlqbTdvM0JXUU5X?=
 =?utf-8?B?NjBETjRhcElDdW1EeGVMZjZZSVlOSmR5QnFrdHlRQll4Y3lTWnZOQUVRMlZq?=
 =?utf-8?B?SDg1bCtGbEpLQ1hrcitVZzZnaUdVME96WVFTVmQ3YU1YRTJpUXpLSkxnMWhD?=
 =?utf-8?B?NlJmVGtRa0x3NFMzU1hpRzZocy9GMWE0Unp3M1BlNzB6RjU2V1lqeHlER004?=
 =?utf-8?B?QlNuc1pocCtwN3M2QWs4Zm16MUREZThrRExkTEtRWmtMajZWUzY1aDNnczVv?=
 =?utf-8?B?NFc5dUF3bHRuZE5iRERoalRaYTh5cmpMR1FDd2hQZUdCMjNOODBpUGNJa1M0?=
 =?utf-8?B?emZmUnhkQWN3bVpEUlFKUzJGNENRaWNkMGhFVXhDM2VmUjdWYUd6K0VZQkdI?=
 =?utf-8?B?ak5GRTVTeklEaVVOYjZ1UkJEYXExZXJvY1dLWUZUOWRBQjNLeHB2YWpFaGp0?=
 =?utf-8?B?MTk1U0JZV0Y3enJLVGpPWjNhVmRqQ1l5ZVNUUGtqUHVjQTBIMmJ0M1ZuM0ZH?=
 =?utf-8?B?R3JiTWtDTkp3VDdPVXZnRmFPRTgwU2VXRTM0eTlNQU9UNzBHUXhrUlJSdWcz?=
 =?utf-8?B?NHZJTE1jTlJ0Y3BycVl6dG1FNmJJa1JQd3lpVTdORHFFVkl6VXpoK083ZzlQ?=
 =?utf-8?B?a2MyNUpRSGYraEkxK2ljdS96SUhnSWN6bGI5eXZ6cElKczc5WEM3M2dIV1p4?=
 =?utf-8?B?R0tQRUlwTVBTWks2RmVHN2lzeFovb2FPdmpBZkhQRk00SGZwWkZTZDVyb3dx?=
 =?utf-8?B?bUlqK3JPaTFucVRTR0NXWjdBWXVtb3pNSUVhb28yT1NXbjhxMXdEOVhuTzFI?=
 =?utf-8?B?bGN0WUVwWTRGa3hGZ08ydHdGZ1h2QnhycGN4QVIrTDd3ZGVwRWFKd3dKRFNy?=
 =?utf-8?B?Z3l3cWhYMVljNXRrRXN0cE95ZzhPbUdObHVZUWtja3JQQnVFK3Jic2VkZ0JB?=
 =?utf-8?B?MW9JdVN6eC8yekV4ei9IallqVytDWnlqblZ3TjBQQU1YenlFbWE2MU1hRFMv?=
 =?utf-8?B?MVhST21kQ2FCd2x4V3RlM2k4bnZkSFdKUnMxMEk4bmRJSzRqSUQxdk1EZktB?=
 =?utf-8?B?anRIODJDWE01c0RJN1FLRERxbDZQWDltVThjdzNXREJxcXN1YVc3TTNPZThx?=
 =?utf-8?B?dUp6RWlSZHpBekcyQlFGMk53MUh1a3Rnc1VsME9TMXk1YWdweHpyOU0xcFRJ?=
 =?utf-8?B?SUNKY013SUEyY3B1bDFvREYwUDkwa2F3cTBURDdmenRVUm9sTno5TmczbUcx?=
 =?utf-8?B?VWg3VGhscm5nR2dsWFo0OFQrTXYwOG5YSVBmTkNDbmRqcTFrSXJuSmNNT3hY?=
 =?utf-8?B?ckFmMXA2Q2p0NzFBWHNLOW5uT0NSeHF2Mkt1WU9neHBDYTVCdlZ0bUNPSXhN?=
 =?utf-8?B?dUFMeDZjc2tOZWFLUndWeTM1a3B2UU5ERkJaSmF0ODhUOWE4U2xCU01kRGk2?=
 =?utf-8?B?VHhOYUFmeWV0clgwRWh5RXBieDVmVUxqVVQvZDloSzcxQkdMR0RhRzBiaVQ3?=
 =?utf-8?B?WXhkRXVQajlhRlExdm5FRDZYdVJCblNVRFBza0dJZ0Q4ZlVxamNnRDd6OHFW?=
 =?utf-8?B?VFI1UlVBN3dHZGxZclJjdmRDVzFTS3lXSDUwZkdMTWx0VHVkY3hHTS9PWXJM?=
 =?utf-8?B?bm8rK25xa3lsbjJINzQ5WHkxcHpkczA4NkhtRE9YVGZjOHl6bG1qVGJ3SXRW?=
 =?utf-8?B?ZTM1NWlabEZyQTU2dFlseU81RDIvcUpSR0x5aDJ5SXFqckhjMTJQRUhocjVz?=
 =?utf-8?B?SmltbVJjdFV3Ym5ET2xXVm5mME1tOWoyR1Y4Y1k3R1RKdXQ1UmlFWFlXTUtK?=
 =?utf-8?B?angrd0VzQ0ZZMlFuRFpudmJPKzYybW5oNGdmRDFwdFVtOTJ6SXpXK3hjQzZ5?=
 =?utf-8?B?RkZkUWFwamhnNWlJL2hnWjBZQ01uNnJLYnZzejdjb1MrMTNuazJGZEFXNzcz?=
 =?utf-8?B?emk0ZmJValV2TURvd2N0eDJ3VzBVbmhwYjVtMTBGeFNzbTZmMCtKZ2VKRmFW?=
 =?utf-8?B?WEN6dnRhQlBpbTRWL3N0UGowRmRlUzRJb1phU1lpTlo5S09rLzdUL1JqRlE1?=
 =?utf-8?B?Vi82MjQ3THhOTTd3R1B0bHl3RW5ZZi9FUTZuTUJKdkV4NmJHRXVEcmJ1RkpE?=
 =?utf-8?B?WlVqdnhsb2JUQTIyckhuSU0yN3huY3p2N1l3azhGRWptMkluL05SZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 953f7ec8-3a58-4a58-50fe-08de534e585b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6440.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 09:21:49.0638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3JWqs96lv7uep/MjcfkoabXHJztu9RCVysWIyXMVr1pi8TYdsw0ghJvCvfWDUiD3In6yPtlrMCid1k6eCjN1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5B09F0799
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: J29O5QeTYj5PpMxhZ2o_X9_2RyrxLB1X
X-Authority-Analysis: v=2.4 cv=fLo0HJae c=1 sm=1 tr=0 ts=6967602f cx=c_pps
 a=awRqKgK+okXhs1gjjWqUCg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=uherdBYGAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=-LCu6K_DAAAA:8 a=pGLkceISAAAA:8 a=XV6bz1v7eVk2KoeafvUA:9 a=lqcHg5cX4UMA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=z2U-W3hJrleVIN9YIjzO:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: r7m6f7vmGjtIU1H0Ay2ENOlGpil8KIRV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3NSBTYWx0ZWRfXxRa8s+ADFvpp
 xQKzfEQA0077j1Iz1uCWnpsEdd8ahdQ2nCVWpX0gDBovbRkhMNNltDO7P155UotZvfVY0nOqWTk
 85dqQh7FhvELAJW2YWKptakEnJQPuqmH8CLlEJChMLIgx4l46cIjT3pfIxvuBHeOo5TVCzz/Rc+
 2MPPHhvV+wIGAytdueEWzv1DibcaOBGCoHHE1/pe5hcD8b2SkxAl/nteFnA0/w0rScCSLbsd37O
 kIEDJg8fc99CEy8armGvzPBLHKCnV3HXvQfQCdYmyVcBFiX+iaJNiL4ceGuZfYrpM3Q6RIvErS+
 3m1ECJgyxLywSLu6t5SRqydLl46e+fjBpCslSCqUztN4YpdEJa89BsGhh3xMivutlWUIUxaNHJA
 9CBvgFr3Lk0f6Ug/EJG8IE7Iw9XSwEWg4VA5ZwV3sDNJp34/f9OgjczXCvCMXAO6YQ1Ms9WSDxp
 1UgI2bX5Pt7MhnAI7uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140075
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60E4crfW2676164
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 09:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123451



On 1/13/26 00:55, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> I wonder if its better to change
>=20
> do_unpack[postfuncs] +=3D "prune_sources"
>=20
> to
>=20
> do_patch[postfuncs] +=3D "prune_sources"

Thanks! v2 is sent.

Thanks,

>=20
> conditional patching is error prone=C2=A0on upgrades etc.
>=20
> On Mon, Jan 12, 2026 at 12:24=E2=80=AFAM Yu, Mingli via lists.openembed=
ded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!=20
> AjveYdw8EvQ!=20
> atf9U9V_2svgNttYDO8_sNqJD6NpEHqRjsj18Xphq2sHlO6OmcEKalaZ5gfxD-=20
> urjGmwlhvcB67Rl-LRUMebt9s$>=20
> <mingli.yu=3Deng.windriver.com@lists.openembedded.org=20
> <mailto:eng.windriver.com@lists.openembedded.org>> wrote:
>=20
>     From: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>=20
>     Fixes:
>      =C2=A0 ERROR: nodejs-22.21.1-r0 do_patch: Applying patch '0001-dep=
s-
>     disable-io_uring-support-in-libuv.patch' on target directory '/
>     build/tmp/work/core2-32-poky-linux/nodejs/22.21.1/sources/node-v22.=
21.1'
>      =C2=A0 CmdError('quilt --quiltrc /build/tmp/work/core2-32-poky-lin=
ux/
>     nodejs/22.21.1/recipe-sysroot-native/etc/quiltrc push', 0, "stdout:
>     Applying patch 0001-deps-disable-io_uring-support-in-libuv.patch
>      =C2=A0 can't find file to patch at input line 27
>=20
>     The sources which related to libuv as deps/uv/ are removed when
>     depends on
>     libuv.
>=20
>     So make the 0001-deps-disable-io_uring-support-in-libuv.patch
>     conditionally
>     to fix the gap.
>=20
>     Signed-off-by: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>     ---
>      =C2=A0meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb <https://
>     urldefense.com/v3/__http://nodejs_22.21.1.bb__;!!AjveYdw8EvQ!
>     atf9U9V_2svgNttYDO8_sNqJD6NpEHqRjsj18Xphq2sHlO6OmcEKalaZ5gfxD-
>     urjGmwlhvcB67Rl-LRCOHDgpo$> | 2 +-
>      =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
>     diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
>     <https://urldefense.com/v3/__http://nodejs_22.21.1.bb__;!!
>     AjveYdw8EvQ!
>     atf9U9V_2svgNttYDO8_sNqJD6NpEHqRjsj18Xphq2sHlO6OmcEKalaZ5gfxD-
>     urjGmwlhvcB67Rl-LRCOHDgpo$> b/meta-oe/recipes-devtools/nodejs/
>     nodejs_22.21.1.bb <https://urldefense.com/v3/__http://
>     nodejs_22.21.1.bb__;!!AjveYdw8EvQ!
>     atf9U9V_2svgNttYDO8_sNqJD6NpEHqRjsj18Xphq2sHlO6OmcEKalaZ5gfxD-
>     urjGmwlhvcB67Rl-LRCOHDgpo$>
>     index ccaf9f7bb2..489fcbde45 100644
>     --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb <https://
>     urldefense.com/v3/__http://nodejs_22.21.1.bb__;!!AjveYdw8EvQ!
>     atf9U9V_2svgNttYDO8_sNqJD6NpEHqRjsj18Xphq2sHlO6OmcEKalaZ5gfxD-
>     urjGmwlhvcB67Rl-LRCOHDgpo$>
>     +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb <https://
>     urldefense.com/v3/__http://nodejs_22.21.1.bb__;!!AjveYdw8EvQ!
>     atf9U9V_2svgNttYDO8_sNqJD6NpEHqRjsj18Xphq2sHlO6OmcEKalaZ5gfxD-
>     urjGmwlhvcB67Rl-LRCOHDgpo$>
>     @@ -27,7 +27,7 @@ SRC_URI =3D "https://nodejs.org/dist/v${PV}/node-
>     v${PV}.tar.xz <https://urldefense.com/v3/__https://nodejs.org/dist/
>     v$*7BPV*7D/node-v$*7BPV*7D.tar.xz__;JSUlJQ!!AjveYdw8EvQ!
>     atf9U9V_2svgNttYDO8_sNqJD6NpEHqRjsj18Xphq2sHlO6OmcEKalaZ5gfxD-
>     urjGmwlhvcB67Rl-LRlmfLbcQ$> \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://system-c-ares.pat=
ch \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-liftoff-Corr=
ect-function-signatures.patch \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libatomic.patch \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-deps-disable-=
io_uring-support-in-libuv.patch \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains('PAC=
KAGECONFIG', 'libuv', '',
>     'file://0001-deps-disable-io_uring-support-in-libuv.patch', d)} \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-positional-a=
rgs.patch \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-custom-env.p=
atch \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-remove=
-redundant-mXX-flags-for-V8.patch \
>     --=20
>     2.34.1
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#123364): https://lists.openembedded.org/g/
>     openembedded-devel/message/123364 <https://urldefense.com/v3/
>     __https://lists.openembedded.org/g/openembedded-devel/
>     message/123364__;!!AjveYdw8EvQ!
>     atf9U9V_2svgNttYDO8_sNqJD6NpEHqRjsj18Xphq2sHlO6OmcEKalaZ5gfxD-
>     urjGmwlhvcB67Rl-LRjFU997g$>
>     Mute This Topic: https://lists.openembedded.org/mt/117220566/199791=
4
>     <https://urldefense.com/v3/__https://lists.openembedded.org/
>     mt/117220566/1997914__;!!AjveYdw8EvQ!
>     atf9U9V_2svgNttYDO8_sNqJD6NpEHqRjsj18Xphq2sHlO6OmcEKalaZ5gfxD-
>     urjGmwlhvcB67Rl-LRbKNBBT4$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/
>     unsub <https://urldefense.com/v3/__https://lists.openembedded.org/g=
/
>     openembedded-devel/unsub__;!!AjveYdw8EvQ!
>     atf9U9V_2svgNttYDO8_sNqJD6NpEHqRjsj18Xphq2sHlO6OmcEKalaZ5gfxD-
>     urjGmwlhvcB67Rl-LRhQb1BOc$> [raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


