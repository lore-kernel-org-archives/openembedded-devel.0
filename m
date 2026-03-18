Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41477FCD0D8
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:28:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9209.1773822477955848350
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 01:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=L9XMD8AH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=753792e7cf=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I5f7iA1345601
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 08:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=MCLK6v9Cbe/JMFpuiVjNgk
	HNeUBa1cXabITfUknTXqU=; b=L9XMD8AHDzMQJqbFNakow59ljoU2gLyMI/Y+iE
	tUPf3hrfzlGQZKGjEZqKvuVUrjiBdVlB4DDdCVM1m4c6ify6EzUnXw0OzhEXzFPo
	IlWs7kRsVxroom0wsX2Km7aESEDeMT418JY6l0AegBJcOg8GNjqPWxTU9EpCkgWy
	K/zbGjJiIidH3WYsOC5eGhHthSQyQth9nPizld8P7JUcqRw15O4GLu5mmTJKN57j
	tfRYD1YmozoT6JbBXI9qpZ7YsmlLmlbQiWkCoaJffvQoiQo1iNLwkayYXmc5zvE0
	wSanjqGQbxGr18c2wRd6A6Sip5OI5S0g1MMTb0+HdpN6MmFg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010008.outbound.protection.outlook.com [52.101.193.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cxm66aedc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 08:27:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUcusJ6W1DyHt42DaxVYnO0IUUhIwJ9Fzu24xlGHxk6rjCLcePyx093z7GzezKQDaeRw7S+0p81HG+1biBxMMrY0lmvrWG8QOlkuZo0P4/WUdbcPsPXCbxfB6wP8/3geKt4iGEbriF0DxdCMfqOK0ipHkoSyxK5PYd5eFJp01nc8Z9pt2oJDBT2hcczgN0eQq7Y8w9PQf2QdUSq1QI5xYyHBAAoyUwYr3I/nRHyb9dV7tTOhW20UZ+hH8nt/HEG5RZdx7Tol3DdwJ/R0Tl6GwW0LKzA73UihYBfrFphRex3V1pj8cZbC5CfX/4lditY9adosEZvatxvIiNElpuIOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCLK6v9Cbe/JMFpuiVjNgkHNeUBa1cXabITfUknTXqU=;
 b=WnWvyzpx1vCk+pzjmJmEDnm4fKf2yVEZBoUh5KjcFuckdm2xsD+92HV/eAgte5RJpAhT+EIcYfGrNzoQXRFRMxoAoGz5WEWkemqwuLutZ5ljPKsiEZLc+d+22akYIa0zUn41PgcP4EdXPa2WnV6Y+vqrsn5ce7ybkOPQBMedYkDRL6Kob66u4i5drikDHX4gcmmbaYdCUhglbPrdg0wgHgdKhgHgt/wP5aVOkuhJjxtg7nZ3zTdQRjuu80/dAJR3IOXQMcqHiHM8i3hu1+0BX86FS5xsuQyTZpDjlBf7m1vCWayOtAuNF8bsuz/FkWKW+WU4ldgkBfwuN90jg6ytjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ2PR11MB8322.namprd11.prod.outlook.com (2603:10b6:a03:549::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 08:27:52 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 08:27:51 +0000
Content-Type: multipart/alternative;
 boundary="------------T0abBy6SYssXQlcQ8YRqhlXZ"
Message-ID: <c15d1fda-140f-41fd-8525-d88227336086@windriver.com>
Date: Wed, 18 Mar 2026 16:27:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH V2] dlt-daemon: upgrade 2.18.10 to 3.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260317093126.2796106-1-changqing.li@windriver.com>
 <CAMKF1sr-wqHNeh5Qxv8hUWE7nOajcRXuiyn54CFkUWYTLF150w@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1sr-wqHNeh5Qxv8hUWE7nOajcRXuiyn54CFkUWYTLF150w@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0210.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ2PR11MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 057ff465-744a-4f6c-e0db-08de84c83ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|56012099003|18002099003|22082099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	PxDwp+tVJSksp9sGvmEblzXjc13E17j8+AtSnn2rUnfJRq5dfm+LuogLepaVYNlKn1DJgysv/cHzPAtOoM9L4EhN7XOYew55C/Rok4Zq1RQzGl56YhGO/cIlt9KsGY5iFXNwlKeUuFUGd9+ZON6FXVB3Y0NEMM6ove19bW4sjBbvVkf+8xLOcrdH+Mbw6y53iY70QICmebFHn0l5Vsj/Y3ntZ8Lj+tP2cOBV0NG8EsvSodazGtPQ5AhX97xlSbT1PkdIvmD/QTRcZ96iU0YXvMt2p7CNVjpawTUKFCy5LHyTT5DXDGLpAXnncKJIG3khLGdwuugxaVoaD3coesbcpmvJUNGXjDXrZiF/Gv5l6hJ8GQUjg5imSChIrnVNmqbiKoYTWjsRwxWocWHrIt/5HM2PJrKnQdvobG3qc7LG7ruvlu6ysk/tTxxkpxXyixi8hO26gexCK9XG7QoW7wsG/C6a1aCOdp9dDWDkMJlyiUUqP3lf3+vWkKRxmaWENYOhw1AGpcTYRJewvHNl3jNp+gf6baylsNxBqC/y9HTdUFnuISNjR2SmOsCRYLPmM/8E/Q5pbKJjxlVUlLvXjFEk5AQLkG0vWeGpPRoOxDpI4B7GrgHL+C7SrEyyViKZ4G5CS0qucXhKycejOXHW44YGSibiBOvzIl8Gl2jRIVIFF/JFZUnTuZLwnKj8+H75TK9R
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(56012099003)(18002099003)(22082099003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eC85NmtYYkIxa3k3c3RsVVhaR3UvWTE2SG9ZakdsZ2FLb09SYWx1aGxialhS?=
 =?utf-8?B?NWNGeHM5RFVkZ3NVK0dWS2xJTkFENFFuZmh0dXlaRFR0N3BPYWdFK0d6MmpF?=
 =?utf-8?B?ejMxNjFSNTdUcUFBRVlicHh4ZFJKSklPbWFWUjdKUElEU1NVMFdNU1RGMGtt?=
 =?utf-8?B?eldhcGVBajlOdzRpNk9hNVZHT3hYaUUyQnBpQ1o2b2xJVnNoL1hNc01QSmhD?=
 =?utf-8?B?YlFSZStoNy84aGFUNi9qU1JVa0plTHRDNlI0anl0anA1VUk0SFNUWTVJTmtu?=
 =?utf-8?B?bk9KN2JraXo5SzhBQjFLNjR2SkRzeENvRUJJYTlpMTkzZjdVczJSMklwdUpz?=
 =?utf-8?B?ajBjQWVOZlJKMWJCVVVWUUFRQzM5dFBPTDNnQmlZQUNrNkE3akRZRnlkRlZF?=
 =?utf-8?B?cnFGaUgvZTFscTBraHdrdVA5cFUxRGlPZUdYZFg1MVdVOEluRkpISDdkSU9a?=
 =?utf-8?B?eTJ1NU9qUVUwdDBZMUVLTU9YTGFlUHJPUnBiNUZoczRRSThXR2YraGx2d05T?=
 =?utf-8?B?WXpHWE9tck44bU5wakE0dnlCRk9PWHdDaU11NnNKb1VCMDI2ZGRKeXlkRFB5?=
 =?utf-8?B?TmNXM2lLTGlSQTRLbEE4OHFqbnVSTEFCQzF0TFp6NmRwbFVNUTgrS3lyWGpm?=
 =?utf-8?B?UU1sblI0RTdPUEtOYkNucG1ETGJaOXdRTjdrdDBUcDNUc2x2eEJKcGlVVXc3?=
 =?utf-8?B?S0FLck1wTW1XcFQ3LzFKTzNvWS93VnBhVjVHY2hTdE55cGdnK3J0ZWdQZkh0?=
 =?utf-8?B?aHc5bE90UGxYanFaeHRoWWRlMWdwMXUvTFU3Yzh6OVY0NTNUVisrNnBhQ3I0?=
 =?utf-8?B?cWxXZldrZHcwRlJHVlhpaytpdk9WbVdhN2pnbGFUTnp1UzZmdFVUVkM4NitE?=
 =?utf-8?B?NGhsaTdBS292Q052cHlmTjMxdi95TUpLMFZFRzhxV1dMNjRhZ0xpQzZzYVhS?=
 =?utf-8?B?Q3FYV1g4UDRTMktJZUs0dlk2VW5SNDFxd0ljMi9YL0haMTVUOTE3RHNSR2Fn?=
 =?utf-8?B?ZVFURWxjWC9TbmIyYWJJOVUyYk5CODNiM1VJaTJ1MmhYQVR0YWEyOG5TOUMy?=
 =?utf-8?B?U1JaR3ZCeGhRdDkyMHpCTzRKaGROVTlWVWFkU0E5UmRBMlNWNXY0aDVWTitz?=
 =?utf-8?B?eTRsWHUxYmFNODdha2NMeXN2NUhacDgwZmROdzJPVTVyNUl4dGtqOXhCejlS?=
 =?utf-8?B?Mk4rUlhJTnIrd1ZUeVo4TjlnS2VOdUxWKytSQTJobytsQXA4RnYvZlE5T09F?=
 =?utf-8?B?L3dadDE1Q0FCMm15Z0dSV2N5bkZnczJYQUI5bldSUXBrVDE0SnlzTnFTVGt1?=
 =?utf-8?B?TkVrb3lTL1BMQnJBWmtsc1oyUE56ZGdkcTRqVENiUXZIZHpNeXdhR0MySzJC?=
 =?utf-8?B?N2pwSm1EZzZBMWpnWTBIUTdvR0lyRjN3K1l0QWQ4RkdLMUZvd3JrN1RuUUVm?=
 =?utf-8?B?MUtQMEtsdHVnaFdmaGgxa2E5MkhReDRHclBJbzR2ZHBHQWg0c2hMTVFQeEhG?=
 =?utf-8?B?ZUhBeVJ4RXB3ZEQxYnRrY1E4RWl4L3psWmRCL0dLWjBFWkFrOWZodXZPRUJP?=
 =?utf-8?B?NGFvWG96bkRjTkY1dXRmNnJGN0JFdHB4djlJQVQ2NkhjbVJDYm8rSzg1blVh?=
 =?utf-8?B?RVVOQ1JycDFiTUlXWDZIRUpkc2tXODRoVURYRzRNTmVuYWNhcTJtU25KdG90?=
 =?utf-8?B?NjBDYXg0U1pCV3B4YnRxUXk3ODBLWEtwd3p3akI1c3JDekRROW5PYjlGTDFJ?=
 =?utf-8?B?bFV4T3g2UW1GbTJEWjJpZkZvZ3VNOEtoSXc1Qmc3Y2hNbFVOdWlqM0lsQWNI?=
 =?utf-8?B?VWJKZTZuNnhWbDBFT1drUFByY3dtRTFWczVNVTNSM2hVemFRUXNGS3FMSG9t?=
 =?utf-8?B?WlpZdVNLRVRnc1pqRVkvVUFaSHFiUUFFZ2U0MnVoRmw3WGhlVC9lQzByTWJ2?=
 =?utf-8?B?cFlzVi9paEF1WXBialFFYy93WTZpTEVMZHZicGZSTTBGdFhEUW80ODJCVHgw?=
 =?utf-8?B?U3ZISmdmWFh4bG9pZTNhNFl5N1ZXa3NjSGdIRStPVk9ZVWs5UEZYVFcvM1do?=
 =?utf-8?B?amNEeFNPZXpKc1l0ekNlcVhSSUl5c3hmZlFIa0RITnlVRlFGN0t2azZ3NkYv?=
 =?utf-8?B?RVBucDVNa3RtczRhMzE2RVVVMW5QMHQ4dXliRkVDUTVvb1B0RzRwQ0t4VFNz?=
 =?utf-8?B?V216cmVyR0VISmtPNUtHVEVXNk1JVERkWm1vWlA2R09DTWpUWmQrdG94STA1?=
 =?utf-8?B?VE1QYXVKa25vTHdsMGd0V2pQK3NoS0Evak9XUFNXWEhKcDQvUFJGT2dTSTE0?=
 =?utf-8?B?V1k5dnZHYjhyNGNQTVEvbUlWSHlRT1l6N1JyY0haZlpHYk9tM21vYTlSS2tM?=
 =?utf-8?Q?wwjcHg8dRzAuzJ9I=3D?=
X-Exchange-RoutingPolicyChecked: 
	rxosmgdJWUjsLiLiv59/MR1edyyvTzl7AxWZpALpNC7r5LyHbSzn9EeJH2R3sN9gv0jfD5OzCPI3o0kOhtYpJ2Bi/2vunPb//SztNJu9wB2+cEBb/0ynjEGEMwDWstDihdC769HqD83WnwFaqbZ1y7m34KexZD+VBI+BagCCdrAEqiM4ypXDTCvu/SKILPGafrwd20mUl0QWG5bnN7sXB12h/T8sBwfjyztOTeX6eHDoBnNh7crB/zlU0wVdnRGSrV/ld+CLZqrVfatcz21ycn55nEuSE09c0e+Jw1p8ka4Q93/16TBjLocLLzgq5UTkgS9/WaSTKcUvFWFTo2yR6g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057ff465-744a-4f6c-e0db-08de84c83ead
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:27:51.8888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMvEp5IAF70XlCYZv6J8bTLPaeJqkotxUJRiXQcd1mQ1a/eV/HgP1/FrE87AjmPFOMhL/Zuewr7URhMoQZNwzuFbPRz2gsMRhOVJ0x9lg6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8322
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: vOP3gFpgKncVggBm4pbAGtgsfy95NFgL
X-Proofpoint-GUID: H4wmNXaMweb-QQk3IGbYqC64YVvBg8I2
X-Authority-Analysis: v=2.4 cv=fLk0HJae c=1 sm=1 tr=0 ts=69ba620c cx=c_pps
 a=97Y4xzKGYTGm8d2IOhb7pg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=ySjF6f4xAAAA:8 a=XMC4lU5bAAAA:20 a=aq5yWuOiAAAA:8
 a=0zhiEtMHAAAA:8 a=NEAV23lmAAAA:8 a=pQs5aej7AAAA:8 a=rPClnSe_AAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=xNf9USuDAAAA:8 a=Hcbv_Ovt8su9vCzIRFQA:9
 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o-rgSThERHL5mx4kWDsA:9 a=Aj_tSafrT4r6heaA:21 a=_W_S_7VecoQA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=SVe2G6S_LxxHVpu7-jkk:22
 a=Y14ZAb90kLroVcJnHI4s:22 a=v7CeC1Rd8Ef7gCqLsajQ:22 a=npGTQlmte4lqeLD-QWPy:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfX7gF9QlveA+dZ
 Ycz+at98LTiEbNX/OKpkvW89mk6mpjlFxsyftltI9vSRwSL3ZgNwQsKASUWez/RRbp+kSVM9Aym
 KcBW+od+sA4zB/8X39/+cw80UKxpY1Ia6H0p+KGjot2NrGgHPCyYPkLqWhzzcCBxYiCG+EMykbo
 CP3aTYHsdef+VHo5HZmqcHOYgTRhLsHRAMP6OSjYx0Cy90yUCLrPjd2iG6AF66XzoPr5IfpZuPa
 CRSNo//2dyKU7/pYyHCYL0Z1dYN9PSjwkxsuOy9UCFLqjM/3QNYZ5hNkzmKwz3pAJkLkBCBO/Ho
 Qpv9Uo5X+csDyt89LgbptW8qHEoQOb5Tdi6t5xG9WD8eoPw9BPXi9PMLhN6M5MmJH63qG67lahO
 71+Z8CNm7hP0IotBzaJ1WCB1WsIk1ttarj1VxYTZs3K1OHEqmV8oybPl7zxrxs1bLr7U8+nnGUP
 RddxTcyhCHVn5CvUp4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 08:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125350

--------------T0abBy6SYssXQlcQ8YRqhlXZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62I5f7iA1345601


On 3/18/26 12:53, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> fails to build see -=20
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867436/raw_i=
nline=20
> <https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/valky=
rie/api/v2/logs/5867436/raw_inline__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I=
-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JbynqUhHw$>

V3 has sent to fix this.

//Changqing

>
> On Tue, Mar 17, 2026 at 2:31=E2=80=AFAM Changqing Li via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8D=
EeN5lIJ9JYxIgSibw$>=20
> <changqing.li=20
> <https://urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!fmJmsX=
D2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9Jb=
_joH5vA$>=3Dwindriver.com@lists.openembedded.org>=20
> wrote:
>
>     Changes:
>     https://github.com/COVESA/dlt-daemon/releases
>     <https://urldefense.com/v3/__https://github.com/COVESA/dlt-daemon/r=
eleases__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwg=
KCnWjFUrDjJw65Kupu8DEeN5lIJ9JapAFWKQA$>
>
>     Remove patches already in 3.0.0:
>     544.patch
>     567.patch
>     0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
>     0003-allow-build-with-cmake-4.patch
>
>     Add patches to fix build failures
>     0001-Fix-compile-failure-related-to-gzlog.patch
>     0001-Fix-kinds-of-build-failure.patch
>     0001-Fix-build-failures.patch
>     0001-fix-build-failure-when-systemd-is-enabled.patch
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     ---
>     =C2=A0...e-DLT_WatchdogSec-can-be-set-by-user.patch |=C2=A0 40 --
>     =C2=A0.../dlt-daemon/0001-Fix-build-failures.patch=C2=A0 | 360 ++++=
+++++++++++
>     =C2=A0...Fix-compile-failure-related-to-gzlog.patch |=C2=A0 69 +++
>     =C2=A0.../0001-Fix-kinds-of-build-failure.patch=C2=A0 =C2=A0 =C2=A0=
| 174 +++++++
>     =C2=A0...uild-failure-when-systemd-is-enabled.patch | 423
>     ++++++++++++++++++
>     =C2=A0.../0003-allow-build-with-cmake-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 99 ----
>     =C2=A0.../dlt-daemon/dlt-daemon/544.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 80 ----
>     =C2=A0.../dlt-daemon/dlt-daemon/567.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 36 --
>     =C2=A0...-daemon_2.18.10.bb
>     <https://urldefense.com/v3/__http://daemon_2.18.10.bb__;!!AjveYdw8E=
vQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DE=
eN5lIJ9JaIo2DZSQ$>
>     =3D> dlt-daemon_3.0.0.bb
>     <https://urldefense.com/v3/__http://dlt-daemon_3.0.0.bb__;!!AjveYdw=
8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8=
DEeN5lIJ9JadOXRLnA$>}
>     |=C2=A0 11 +-
>     =C2=A09 files changed, 1032 insertions(+), 260 deletions(-)
>     =C2=A0delete mode 100644
>     meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-=
make-DLT_WatchdogSec-can-be-set-by-user.patch
>     =C2=A0create mode 100644
>     meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failu=
res.patch
>     =C2=A0create mode 100644
>     meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-fai=
lure-related-to-gzlog.patch
>     =C2=A0create mode 100644
>     meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-bu=
ild-failure.patch
>     =C2=A0create mode 100644
>     meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failu=
re-when-systemd-is-enabled.patch
>     =C2=A0delete mode 100644
>     meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-wit=
h-cmake-4.patch
>     =C2=A0delete mode 100644
>     meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
>     =C2=A0delete mode 100644
>     meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
>     =C2=A0rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.1=
0.bb
>     <https://urldefense.com/v3/__http://dlt-daemon_2.18.10.bb__;!!AjveY=
dw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kup=
u8DEeN5lIJ9JYcHKxqHg$>
>     =3D> dlt-daemon_3.0.0.bb
>     <https://urldefense.com/v3/__http://dlt-daemon_3.0.0.bb__;!!AjveYdw=
8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8=
DEeN5lIJ9JadOXRLnA$>}
>     (90%)
>
>     diff --git
>     a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-tx=
t-make-DLT_WatchdogSec-can-be-set-by-user.patch
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-tx=
t-make-DLT_WatchdogSec-can-be-set-by-user.patch
>     deleted file mode 100644
>     index 335872c40f..0000000000
>     ---
>     a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-tx=
t-make-DLT_WatchdogSec-can-be-set-by-user.patch
>     +++ /dev/null
>     @@ -1,40 +0,0 @@
>     -From bc03f142507da92add8ba325fdf8187d47a7d719 Mon Sep 17 00:00:00
>     2001
>     -From: Changqing Li <changqing.li@windriver.com>
>     -Date: Fri, 13 Dec 2024 16:37:24 +0800
>     -Subject: [PATCH] CMakeLists.txt: make DLT_WatchdogSec can be set
>     by user
>     -
>     -In my test env, WatchdogSec default value 2 is not enough, manuall=
y
>     -changed to 3 is ok. This makes dlt.service/dlt-system.service star=
t
>     -failed during boot time. So, make DLT_WatchdogSec can be set by
>     user, so
>     -user can set them to proper value at build time, then service can
>     start
>     -successfully in boot time.
>     -
>     -Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     -
>     -Upstream-Status: Backport
>     [https://github.com/COVESA/dlt-daemon/pull/720/commits/bc03f142507d=
a92add8ba325fdf8187d47a7d719
>     <https://urldefense.com/v3/__https://github.com/COVESA/dlt-daemon/p=
ull/720/commits/bc03f142507da92add8ba325fdf8187d47a7d719__;!!AjveYdw8EvQ!=
fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5=
lIJ9JajNR9qLg$>]
>     -
>     -Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     ----
>     - systemd/CMakeLists.txt | 8 ++++++--
>     - 1 file changed, 6 insertions(+), 2 deletions(-)
>     -
>     -diff --git a/systemd/CMakeLists.txt b/systemd/CMakeLists.txt
>     -index 16cbe86b5..659378d16 100644
>     ---- a/systemd/CMakeLists.txt
>     -+++ b/systemd/CMakeLists.txt
>     -@@ -18,10 +18,14 @@ if(WITH_SYSTEMD)
>     -=C2=A0 =C2=A0 =C2=A0set(SYSTEMD_CONFIGURATIONS_FILES_DIR ${SYSTEMD=
_UNITDIR} )
>     -
>     -=C2=A0 =C2=A0 =C2=A0if(WITH_SYSTEMD_WATCHDOG)
>     --=C2=A0 =C2=A0 =C2=A0 =C2=A0 set( DLT_WatchdogSec 2 )
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(NOT DEFINED DLT_WatchdogSec)
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set(DLT_WatchdogSec 2 C=
ACHE STRING "Watchdog timeout
>     in seconds")
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 endif()
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0message( STATUS "The systemd wat=
chdog is enabled -
>     timeout is set to ${DLT_WatchdogSec} seconds")
>     -=C2=A0 =C2=A0 =C2=A0else(WITH_SYSTEMD_WATCHDOG)
>     --=C2=A0 =C2=A0 =C2=A0 =C2=A0 set( DLT_WatchdogSec 0 )
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if(NOT DEFINED DLT_WatchdogSec)
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set(DLT_WatchdogS=
ec 0 CACHE STRING "Watchdog
>     timeout in seconds")
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 endif()
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0message( STATUS "The systemd wat=
chdog is disabled")
>     -=C2=A0 =C2=A0 =C2=A0endif(WITH_SYSTEMD_WATCHDOG)
>     diff --git
>     a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-fai=
lures.patch
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-fai=
lures.patch
>     new file mode 100644
>     index 0000000000..6cfa3a5482
>     --- /dev/null
>     +++
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-fai=
lures.patch
>     @@ -0,0 +1,360 @@
>     +From 4813b72cfe82062db41dd1d8cfa7069634d78d9e Mon Sep 17 00:00:00
>     2001
>     +From: Changqing Li <changqing.li@windriver.com>
>     +Date: Mon, 16 Mar 2026 13:28:40 +0800
>     +Subject: [PATCH] Fix build failures
>     +
>     +Fix the following similar build failures, some of the build failur=
e
>     +reproduced with arm64/riscv64, some of the build reproduced with
>     32bit
>     +x86/arm.
>     +
>     +dlt_daemon_common.c:2785:26: error: conversion to 'int8_t' {aka
>     'signed char'} from 'char' may change the sign of the result
>     [-Werror=3Dsign-conversion]
>     +
>     +src/tests/dlt-test-multi-process-client-v2.c:302:49: error:
>     format '%lld' expects argument of type 'long long int', but
>     argument 2 has type 'time_t' {aka 'long int'} [-Werror=3Dformat=3D]
>     +=C2=A0 302 |=C2=A0 =C2=A0 =C2=A0printf(" Time running (seconds)=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 : %lld\n",
>     time(NULL) - stats.first_message_time);
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~^ =C2=A0
>     =C2=A0~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=
=A0 =C2=A0
>     =C2=A0 =C2=A0 =C2=A0 |
>     +=C2=A0 =C2=A0 =C2=A0 | =C2=A0long long int=C2=A0 =C2=A0 time_t {ak=
a long int}
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %ld
>     +
>     +src/lib/dlt_user.c:5109:60: error: format '%lld' expects argument
>     of type 'long long int', but argument 4 has type '__off_t' {aka
>     'long int'} [-Werror=3Dformat=3D]
>     + 5109 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LO=
G_DEBUG, "%s: Current file
>     size=3D[%lld]\n", __func__,
>     +=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0~~~^
>     +=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 |
>     +=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 long long int
>     +=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0%ld
>     + 5110 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 st.st_size);
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __off_t {aka long int}
>     +
>     +Upstream-Status: Submitted
>     [https://github.com/COVESA/dlt-daemon/pull/827
>     <https://urldefense.com/v3/__https://github.com/COVESA/dlt-daemon/p=
ull/827__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwg=
KCnWjFUrDjJw65Kupu8DEeN5lIJ9JY-xUIJDA$>]
>     +
>     +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     +---
>     + src/daemon/dlt-daemon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++---
>     + src/daemon/dlt_daemon_client.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 32
>     ++++++++++----------
>     + src/daemon/dlt_daemon_common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +--
>     + src/lib/dlt_user.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++++------
>     + src/shared/dlt_common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-
>     + src/shared/dlt_multiple_files.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-
>     + src/tests/dlt-test-multi-process-client-v2.c |=C2=A0 8 ++---
>     + src/tests/dlt-test-multi-process-v2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-
>     + src/tests/dlt-test-multi-process.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-
>     + 9 files changed, 39 insertions(+), 39 deletions(-)
>     +
>     +diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
>     +index 523bf33..2ae5bc9 100644
>     +--- a/src/daemon/dlt-daemon.c
>     ++++ b/src/daemon/dlt-daemon.c
>     +@@ -457,7 +457,7 @@ int option_file_parser(DltDaemonLocal
>     *daemon_local)
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (n < 0 || (size_t)n >
>     sizeof(daemon_local->flags.loggingFilename)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_WARNING, "%s: snpri=
ntf
>     truncation/error(%ld) %s\n",
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__,=
 n, daemon_local->flags.loggingFilename);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__,=
 (long int)n,
>     daemon_local->flags.loggingFilename);
>     +=C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0daemon_local->flags.enableLoggingFileLimit =3D=
 false;
>     +=C2=A0 =C2=A0 =C2=A0daemon_local->flags.loggingFileSize =3D 250000=
;
>     +@@ -2501,7 +2501,7 @@ void dlt_daemon_exit_trigger()
>     +=C2=A0 =C2=A0 =C2=A0n =3D snprintf(tmp, DLT_PATH_MAX, "%s/dlt", dl=
tFifoBaseDir);
>     +=C2=A0 =C2=A0 =C2=A0if (n < 0 || (size_t)n > DLT_PATH_MAX) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_WARNING, "%s: snpri=
ntf
>     truncation/error(%ld) %s\n",
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__,=
 n, tmp);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__,=
 (long int)n, tmp);
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0(void)unlink(tmp);
>     +@@ -2878,8 +2878,8 @@ int dlt_daemon_log_internal(DltDaemon
>     *daemon, DltDaemonLocal *daemon_local,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_daemon_client_send(DLT_DAEMO=
N_SEND_TO_ALL,
>     daemon,daemon_local,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.headerbuffer,
>     sizeof(DltStorageHeader),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.headerbuffer +
>     sizeof(DltStorageHeader),
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (size_t)(msg.headersize -
>     (int32_t)sizeof(DltStorageHeader)),
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffer,
>     (size_t)msg.datasize, verbose);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (int)(msg.headersize -
>     (int32_t)sizeof(DltStorageHeader)),
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffer, (int)msg.datasize,
>     verbose);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(msg.databuffer);
>     +=C2=A0 =C2=A0 =C2=A0}else {
>     +diff --git a/src/daemon/dlt_daemon_client.c
>     b/src/daemon/dlt_daemon_client.c
>     +index 50d8f19..20a512b 100644
>     +--- a/src/daemon/dlt_daemon_client.c
>     ++++ b/src/daemon/dlt_daemon_client.c
>     +@@ -551,8 +551,8 @@ int
>     dlt_daemon_client_send_message_to_all_client(DltDaemon *daemon,
>     +=C2=A0 =C2=A0 =C2=A0return dlt_daemon_client_send(DLT_DAEMON_SEND_=
TO_ALL,
>     daemon, daemon_local,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0daem=
on_local->msg.headerbuffer,
>     sizeof(DltStorageHeader),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0daem=
on_local->msg.headerbuffer +
>     sizeof(DltStorageHeader),
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (size_t)(=
daemon_local->msg.headersize -
>     (int32_t)sizeof(DltStorageHeader)),
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 daemon_lo=
cal->msg.databuffer,
>     (size_t)daemon_local->msg.datasize, verbose);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (int)(dae=
mon_local->msg.headersize -
>     (int32_t)sizeof(DltStorageHeader)),
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 daemon_lo=
cal->msg.databuffer,
>     (int)daemon_local->msg.datasize, verbose);
>     +
>     + }
>     +
>     +@@ -771,8 +771,8 @@ int
>     dlt_daemon_client_send_control_message(int sock,
>     +=C2=A0 =C2=A0 =C2=A0if ((ret =3D
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_daemon_client=
_send(sock, daemon, daemon_local,
>     msg->headerbuffer, sizeof(DltStorageHeader),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg->he=
aderbuffer +
>     sizeof(DltStorageHeader),
>     +- (size_t)(msg->headersize - (int32_t)sizeof(DltStorageHeader)),
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg->databuff=
er,
>     (size_t)msg->datasize, verbose))) {
>     ++ (int)(msg->headersize - (int32_t)sizeof(DltStorageHeader)),
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg->databuff=
er,
>     (int)msg->datasize, verbose))) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_log(LOG_DEBUG,
>     "dlt_daemon_control_send_control_message: DLT message send to all
>     failed!.\n");
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +@@ -1919,7 +1919,7 @@ void dlt_daemon_control_get_log_info(int soc=
k,
>     +
>     +=C2=A0 =C2=A0 =C2=A0/* Allocate buffer for response message */
>     +=C2=A0 =C2=A0 =C2=A0resp.databuffer =3D (uint8_t *)malloc((size_t)=
resp.datasize);
>     +-=C2=A0 =C2=A0 resp.databuffersize =3D (size_t)resp.datasize;
>     ++=C2=A0 =C2=A0 resp.databuffersize =3D resp.datasize;
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (resp.databuffer =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_daemon_control_service_respo=
nse(sock,
>     +@@ -2572,7 +2572,7 @@ int
>     dlt_daemon_control_message_buffer_overflow(int sock,
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)ma=
lloc((size_t)msg.datasize);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.da=
tasize;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)
>     +@@ -2633,7 +2633,7 @@ int
>     dlt_daemon_control_message_buffer_overflow_v2(int sock,
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)ma=
lloc((size_t)msg.datasize);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.da=
tasize;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)
>     +@@ -2686,7 +2686,7 @@ void
>     dlt_daemon_control_service_response(int sock,
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)ma=
lloc((size_t)msg.datasize);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.da=
tasize;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)
>     +@@ -2732,7 +2732,7 @@ void
>     dlt_daemon_control_service_response_v2(int sock,
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)ma=
lloc((size_t)msg.datasize);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.da=
tasize;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)
>     +@@ -2779,7 +2779,7 @@ int
>     dlt_daemon_control_message_unregister_context(int sock,
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)ma=
lloc((size_t)msg.datasize);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.da=
tasize;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)
>     +@@ -2842,7 +2842,7 @@ int
>     dlt_daemon_control_message_unregister_context_v2(int sock,
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)ma=
lloc((size_t)msg.datasize);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.da=
tasize;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)
>     +@@ -2909,7 +2909,7 @@ int
>     dlt_daemon_control_message_connection_info(int sock,
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)ma=
lloc((size_t)msg.datasize);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.da=
tasize;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)
>     +@@ -2962,7 +2962,7 @@ int
>     dlt_daemon_control_message_connection_info_v2(int sock,
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)ma=
lloc((size_t)msg.datasize);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.da=
tasize;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)
>     +@@ -3010,7 +3010,7 @@ int dlt_daemon_control_message_timezone(int
>     sock, DltDaemon *daemon, DltDaemonLo
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)ma=
lloc((size_t)msg.datasize);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.da=
tasize;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)
>     +@@ -3072,7 +3072,7 @@ int
>     dlt_daemon_control_message_timezone_v2(int sock, DltDaemon
>     *daemon, DltDaemo
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)ma=
lloc((size_t)msg.datasize);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.da=
tasize;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)
>     +@@ -3127,7 +3127,7 @@ int dlt_daemon_control_message_marker(int
>     sock, DltDaemon *daemon, DltDaemonLoca
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg.databuffer =3D (uint8_t *)ma=
lloc((size_t)msg.datasize);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D (size_t)msg.da=
tasize;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.databuffersize =3D msg.datasize;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (msg.databuffer =3D=3D 0)
>     +diff --git a/src/daemon/dlt_daemon_common.c
>     b/src/daemon/dlt_daemon_common.c
>     +index 2f08c6a..65b264a 100644
>     +--- a/src/daemon/dlt_daemon_common.c
>     ++++ b/src/daemon/dlt_daemon_common.c
>     +@@ -2782,7 +2782,7 @@ int
>     dlt_daemon_user_send_log_state(DltDaemon *daemon,
>     DltDaemonApplication *app,
>     +=C2=A0 =C2=A0 =C2=A0if (dlt_user_set_userheader(&userheader,
>     DLT_USER_MESSAGE_LOG_STATE) < DLT_RETURN_OK)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
>     +
>     +-=C2=A0 =C2=A0 logstate.log_state =3D daemon->connectionState;
>     ++=C2=A0 =C2=A0 logstate.log_state =3D (int8_t)daemon->connectionSt=
ate;
>     +
>     +=C2=A0 =C2=A0 =C2=A0/* log to FIFO */
>     +=C2=A0 =C2=A0 =C2=A0ret =3D dlt_user_log_out2_with_timeout(app->us=
er_handle,
>     +@@ -2811,7 +2811,7 @@ int
>     dlt_daemon_user_send_log_state_v2(DltDaemon *daemon,
>     DltDaemonApplication *a
>     +=C2=A0 =C2=A0 =C2=A0if (dlt_user_set_userheader_v2(&userheader,
>     DLT_USER_MESSAGE_LOG_STATE) < DLT_RETURN_OK)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
>     +
>     +-=C2=A0 =C2=A0 logstate.log_state =3D daemon->connectionState;
>     ++=C2=A0 =C2=A0 logstate.log_state =3D (int8_t)daemon->connectionSt=
ate;
>     +
>     +=C2=A0 =C2=A0 =C2=A0/* log to FIFO */
>     +=C2=A0 =C2=A0 =C2=A0ret =3D dlt_user_log_out2_with_timeout(app->us=
er_handle,
>     +diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
>     +index 6d0098d..e432e26 100644
>     +--- a/src/lib/dlt_user.c
>     ++++ b/src/lib/dlt_user.c
>     +@@ -5106,8 +5106,8 @@ DltReturnValue
>     dlt_user_log_send_log(DltContextData *log, const int mtype, int *
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn DLT_RETURN_ERROR;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_vlog(LOG_DEBUG, "%s=
: Current file size=3D[%ld]\n",
>     __func__,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0st.st_size);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_vlog(LOG_DEBUG, "%s=
: Current file
>     size=3D[%lld]\n", __func__,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(long long int)st.st_size);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check filesize =
*/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Return error if=
 the file size has reached to
>     maximum */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int msg_s=
ize =3D (unsigned int)st.st_size +
>     (unsigned int)msg.headersize +
>     +@@ -5115,8 +5115,8 @@ DltReturnValue
>     dlt_user_log_send_log(DltContextData *log, const int mtype, int *
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msg_size > dlt=
_user.filesize_max) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_=
user_file_reach_max =3D true;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_=
vlog(LOG_ERR,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0"%s: File size (%ld bytes) reached to
>     defined maximum size (%d bytes)\n",
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0__func__, st.st_size,
>     dlt_user.filesize_max);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0"%s: File size (%lld bytes) reached to
>     defined maximum size (%d bytes)\n",
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0__func__, (long long int)st.st_size,
>     dlt_user.filesize_max);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_=
mutex_unlock();
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn DLT_RETURN_FILESZERR;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +@@ -5612,21 +5612,21 @@ DltReturnValue
>     dlt_user_log_send_log_v2(DltContextData *log, const int mtype, Dl
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn DLT_RETURN_ERROR;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_vlog(LOG_DEBUG, "%s=
: Current file size=3D[%ld]\n",
>     __func__,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0st.st_size);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_vlog(LOG_DEBUG, "%s=
: Current file
>     size=3D[%lld]\n", __func__,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(long long int)st.st_size);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check filesize =
*/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Return error if=
 the file size has reached to
>     maximum */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int msg_s=
ize =3D 0;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (st.st_size < 0=
 || st.st_size > UINT_MAX) {
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_vlog(=
LOG_ERR, "%s: File size (%ld bytes) is
>     invalid or too large for unsigned int\n", __func__, st.st_size);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlt_vlog(=
LOG_ERR, "%s: File size (%lld bytes) is
>     invalid or too large for unsigned int\n", __func__, (long long
>     int)st.st_size);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn DLT_RETURN_FILESZERR;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg_size =3D (unsi=
gned int)st.st_size + (unsigned int)
>     msg.headersizev2 + (unsigned int) log->size;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msg_size > dlt=
_user.filesize_max) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_=
user_file_reach_max =3D true;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_=
vlog(LOG_ERR,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0"%s: File size (%ld bytes) reached to
>     defined maximum size (%d bytes)\n",
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0__func__, st.st_size,
>     dlt_user.filesize_max);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0"%s: File size (%lld bytes) reached to
>     defined maximum size (%d bytes)\n",
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0__func__, (long long int)st.st_size,
>     dlt_user.filesize_max);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn DLT_RETURN_FILESZERR;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {
>     +diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
>     +index 6ad354b..aa0aaaa 100644
>     +--- a/src/shared/dlt_common.c
>     ++++ b/src/shared/dlt_common.c
>     +@@ -1220,7 +1220,7 @@ DltReturnValue
>     dlt_message_header_flags_v2(DltMessageV2 *msg, char *text, size_t
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (int i =3D 0; =
i<5; ++i){
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tt =3D=
 (tt << 8) | msg->headerextrav2.seconds[i];
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(text + strlen(=
text), textlength -
>     strlen(text), "%ld.%.9u ", tt, msg->headerextrav2.nanoseconds);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(text + strlen(=
text), textlength -
>     strlen(text), "%lld.%.9u ", (long long int)tt,
>     msg->headerextrav2.nanoseconds);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(text + st=
rlen(text), textlength -
>     strlen(text), "---------- ");
>     +diff --git a/src/shared/dlt_multiple_files.c
>     b/src/shared/dlt_multiple_files.c
>     +index c4019e5..65529ff 100644
>     +--- a/src/shared/dlt_multiple_files.c
>     ++++ b/src/shared/dlt_multiple_files.c
>     +@@ -257,7 +257,7 @@ ssize_t
>     multiple_files_buffer_get_total_size(const MultipleFilesRingBuffer
>     *file
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (((unsigned int=
)res < sizeof(filename)) && (res >
>     0)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errn=
o =3D 0;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
0 =3D=3D stat(filename, &status))
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 size +=3D status.st_size;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 size +=3D (ssize_t)status.st_size;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fprintf(stderr, "file %s cannot be stat-ed,
>     error=3D%s\n", filename, strerror(errno));
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +diff --git a/src/tests/dlt-test-multi-process-client-v2.c
>     b/src/tests/dlt-test-multi-process-client-v2.c
>     +index 2bb1158..ec99720 100644
>     +--- a/src/tests/dlt-test-multi-process-client-v2.c
>     ++++ b/src/tests/dlt-test-multi-process-client-v2.c
>     +@@ -299,10 +299,10 @@ void print_stats(s_statistics stats,
>     s_parameters params)
>     +=C2=A0 =C2=A0 =C2=A0printf(" Messages received=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0: %d\n",
>     stats.messages_received);
>     +=C2=A0 =C2=A0 =C2=A0printf(" Broken messages received=C2=A0 =C2=A0=
 =C2=A0 : %d\n",
>     stats.broken_messages_received);
>     +=C2=A0 =C2=A0 =C2=A0printf(" Bytes received=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : %d\n",
>     stats.bytes_received);
>     +-=C2=A0 =C2=A0 printf(" Time running (seconds)=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 : %ld\n", time(NULL)
>     - stats.first_message_time);
>     +-=C2=A0 =C2=A0 printf(" Throughput (msgs/sec)/(B/sec) : %ld/%ld\n"=
,
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats.messages_received =
/ ((time(NULL) -
>     stats.first_message_time) + 1),
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(stats.bytes_received) /=
 ((time(NULL) -
>     stats.first_message_time) + 1));
>     ++=C2=A0 =C2=A0 printf(" Time running (seconds)=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 : %lld\n", (long long
>     int)(time(NULL) - stats.first_message_time));
>     ++=C2=A0 =C2=A0 printf(" Throughput (msgs/sec)/(B/sec) : %lld/%lld\=
n",
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long long int)(stats.me=
ssages_received /
>     ((time(NULL) - stats.first_message_time) + 1)),
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long long int)((stats.b=
ytes_received) / ((time(NULL)
>     - stats.first_message_time) + 1)));
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (params.messages_left =3D=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (stats.broken_messages_receiv=
ed =3D=3D 0)
>     +diff --git a/src/tests/dlt-test-multi-process-v2.c
>     b/src/tests/dlt-test-multi-process-v2.c
>     +index 44a8622..1d3a54a 100644
>     +--- a/src/tests/dlt-test-multi-process-v2.c
>     ++++ b/src/tests/dlt-test-multi-process-v2.c
>     +@@ -393,7 +393,7 @@ void *do_logging(void *arg)
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sleep_time =3D mksleep_time(data=
->params.delay,
>     data->params.delay_fudge);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts.tv_sec =3D sleep_time / 10000=
00000;
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.tv_nsec =3D sleep_time % 100000000=
0;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.tv_nsec =3D (long int)(sleep_time =
% 1000000000);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nanosleep(&ts, NULL);
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +diff --git a/src/tests/dlt-test-multi-process.c
>     b/src/tests/dlt-test-multi-process.c
>     +index 016c8b4..00fb11c 100644
>     +--- a/src/tests/dlt-test-multi-process.c
>     ++++ b/src/tests/dlt-test-multi-process.c
>     +@@ -370,7 +370,7 @@ void *do_logging(void *arg)
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sleep_time =3D mksleep_time(data=
->params.delay,
>     data->params.delay_fudge);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts.tv_sec =3D sleep_time / 10000=
00000;
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.tv_nsec =3D sleep_time % 100000000=
0;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.tv_nsec =3D (long int)(sleep_time =
% 1000000000);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nanosleep(&ts, NULL);
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +--
>     +2.34.1
>     +
>     diff --git
>     a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-f=
ailure-related-to-gzlog.patch
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-f=
ailure-related-to-gzlog.patch
>     new file mode 100644
>     index 0000000000..f9692d9f4d
>     --- /dev/null
>     +++
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-f=
ailure-related-to-gzlog.patch
>     @@ -0,0 +1,69 @@
>     +From bee9bce043c72de1d27a4251333ace9fe66bcc74 Mon Sep 17 00:00:00
>     2001
>     +From: Changqing Li <changqing.li@windriver.com>
>     +Date: Thu, 12 Mar 2026 19:37:11 +0800
>     +Subject: [PATCH] Fix compile failure related to gzlog
>     +MIME-Version: 1.0
>     +Content-Type: text/plain; charset=3DUTF-8
>     +Content-Transfer-Encoding: 8bit
>     +
>     +* In commit [1], gzlog is changed from gzFile to gzFile*, this cau=
se
>     +=C2=A0 failure:
>     +/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:88:21:
>     error: passing argument 1 of =E2=80=98gzclose=E2=80=99 from incompa=
tible pointer
>     type [-Werror=3Dincompatible-pointer-types]
>     +=C2=A0 =C2=A088 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gzclose(data->g=
zlog);
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0~~~~^~~~~~~
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gzFile_s **
>     +compilation terminated due to -Wfatal-errors.
>     +
>     +so change gzlog back to gzFile, so that all the gzxxx function
>     can work
>     +well.
>     +
>     +* Change to gzFile causes the following failure, since fileno need
>     +=C2=A0 FILE*, according to code "config->gzlog =3D gzdopen(config-=
>fd,
>     mode)",
>     +=C2=A0 seems we don't need to use fileno, just use config->fd is o=
k.
>     +/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage_behavior.=
c:1133:48:
>     error: passing argument 1 of =E2=80=98fileno=E2=80=99 from incompat=
ible pointer
>     type [-Werror=3Dincompatible-pointer-types]
>     + 1133 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fsync(fileno(config->gzlog))
>     !=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 | ~~~~~~^~~~~~~
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |
>     +=C2=A0 =C2=A0 =C2=A0 | gzFile {aka struct gzFile_s *}
>     +compilation terminated due to -Wfatal-errors.
>     +
>     +[1]
>     https://github.com/COVESA/dlt-daemon/commit/543087ba98c103dc576edad=
eccf614c9dab1b9b3
>     <https://urldefense.com/v3/__https://github.com/COVESA/dlt-daemon/c=
ommit/543087ba98c103dc576edadeccf614c9dab1b9b3__;!!AjveYdw8EvQ!fmJmsXD2ak=
fD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JaBrNN=
zaA$>
>     +
>     +Upstream-Status: Submitted
>     [https://github.com/COVESA/dlt-daemon/pull/826
>     <https://urldefense.com/v3/__https://github.com/COVESA/dlt-daemon/p=
ull/826__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwg=
KCnWjFUrDjJw65Kupu8DEeN5lIJ9JZO3RdJBQ$>]
>     +
>     +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     +---
>     + src/offlinelogstorage/dlt_offline_logstorage.h=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 2 +-
>     + src/offlinelogstorage/dlt_offline_logstorage_behavior.c | 2 +-
>     + 2 files changed, 2 insertions(+), 2 deletions(-)
>     +
>     +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h
>     b/src/offlinelogstorage/dlt_offline_logstorage.h
>     +index fe38687..09ea5ce 100644
>     +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
>     ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
>     +@@ -217,7 +217,7 @@ struct DltLogStorageFilterConfig
>     +=C2=A0 =C2=A0 =C2=A0FILE *log;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* current open log file */
>     +=C2=A0 =C2=A0 =C2=A0int fd;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The file descriptor f=
or
>     the active log file */
>     + #ifdef DLT_LOGSTORAGE_USE_GZIP
>     +-=C2=A0 =C2=A0 gzFile *gzlog;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* current open gz log file */
>     ++=C2=A0 =C2=A0 gzFile gzlog;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* current open gz log file */
>     + #endif
>     +=C2=A0 =C2=A0 =C2=A0void *cache;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* log data cache */
>     +=C2=A0 =C2=A0 =C2=A0unsigned int specific_size;=C2=A0 =C2=A0 =C2=A0=
/* cache size used for
>     specific_size sync strategy */
>     +diff --git
>     a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>     b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>     +index f17fbb2..ff09c9e 100644
>     +--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>     ++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>     +@@ -1130,7 +1130,7 @@ int
>     dlt_logstorage_prepare_on_msg(DltLogStorageFilterConfig *config,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(config->sync =3D=3D DLT_LOGSTORAGE_SYNC_UNSET)) {
>     + #ifdef DLT_LOGSTORAGE_USE_GZIP
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (config->gzip_compression =3D=3D
>     DLT_LOGSTORAGE_GZIP_ON) {
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (fsync(fileno(config->gzlog)) !=3D 0) {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (fsync(config->fd) !=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno !=3D ENOSYS) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_ERR, "%s=
: failed to
>     sync gzip log file\n", __func__);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +--
>     +2.34.1
>     +
>     diff --git
>     a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-=
build-failure.patch
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-=
build-failure.patch
>     new file mode 100644
>     index 0000000000..403d1089e2
>     --- /dev/null
>     +++
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-=
build-failure.patch
>     @@ -0,0 +1,174 @@
>     +From 3d713358fe19ce02e7c580d26222ec2386c94bc9 Mon Sep 17 00:00:00
>     2001
>     +From: Changqing Li <changqing.li@windriver.com>
>     +Date: Thu, 12 Mar 2026 20:06:34 +0800
>     +Subject: [PATCH] Fix kinds of build failure
>     +MIME-Version: 1.0
>     +Content-Type: text/plain; charset=3DUTF-8
>     +Content-Transfer-Encoding: 8bit
>     +
>     +Fix kinds of build failures caused by -Werror=3Dsign-conversion,
>     +-Werror=3Dcast-qual, -Werror=3Dconversion etc.
>     +Eg:
>     +src/offlinelogstorage/dlt_offline_logstorage.h:129:49: error:
>     unsigned conversion from =E2=80=98int=E2=80=99 to =E2=80=98unsigned=
 int=E2=80=99 changes value
>     from =E2=80=98-1=E2=80=99 to =E2=80=984294967295=E2=80=99 [-Werror=3D=
sign-conversion]
>     +=C2=A0 129 | #define DLT_LOGSTORAGE_GZIP_ERROR=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-1 /*
>     error case */
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^
>     +/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:1303:36=
:
>     note: in expansion of macro =E2=80=98DLT_LOGSTORAGE_GZIP_ERROR=E2=80=
=99
>     + 1303 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config->gzip_compression =
=3D DLT_LOGSTORAGE_GZIP_ERROR;
>     +
>     +=C2=A0 =C2=A0 =C2=A0 | ^~~~~~~~~~~~~~~~~~~~~~~~~
>     +
>     +src/offlinelogstorage/dlt_offline_logstorage_behavior.c:851:16:
>     error: conversion from =E2=80=98z_size_t=E2=80=99 {aka =E2=80=98lon=
g unsigned int=E2=80=99} to
>     =E2=80=98int=E2=80=99 may change value [-Werror=3Dconversion]
>     +=C2=A0 851 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gzfwrite(ptr,=
 size, nmemb, config->gzlog);
>     +=C2=A0 =C2=A0 =C2=A0 | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     +
>     +src/console/dlt-control-common.c:922:25: error: cast discards
>     'const' qualifier from pointer target type [-Werror=3Dcast-qual]
>     +=C2=A0 922 |=C2=A0 =C2=A0 =C2=A0json_object_to_file((char*)filenam=
e, json_filter_obj);
>     +=C2=A0 =C2=A0 =C2=A0 |
>     +
>     +Use explicit type conversion to make the build can pass
>     +
>     +Upstream-Status: Submitted
>     [https://github.com/COVESA/dlt-daemon/pull/826
>     <https://urldefense.com/v3/__https://github.com/COVESA/dlt-daemon/p=
ull/826__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwg=
KCnWjFUrDjJw65Kupu8DEeN5lIJ9JZO3RdJBQ$>]
>     +
>     +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     +---
>     + src/console/dlt-control-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-
>     + src/daemon/dlt-daemon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4=
 ++--
>     + src/daemon/udp_connection/dlt_daemon_udp_socket.c=C2=A0 =C2=A0 =C2=
=A0 | 10
>     +++++-----
>     + src/examples/dlt-example-multicast-clientmsg-view.c=C2=A0 =C2=A0 =
| 8 ++++----
>     + src/offlinelogstorage/dlt_offline_logstorage.h=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 2 +-
>     + .../dlt_offline_logstorage_behavior.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--
>     + 6 files changed, 15 insertions(+), 15 deletions(-)
>     +
>     +diff --git a/src/console/dlt-control-common.c
>     b/src/console/dlt-control-common.c
>     +index 2aeea280..4f9e95b4 100644
>     +--- a/src/console/dlt-control-common.c
>     ++++ b/src/console/dlt-control-common.c
>     +@@ -919,7 +919,7 @@ DltReturnValue dlt_json_filter_save(DltFilter
>     *filter, const char *filename, int
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0printf("Saving current filter into '%s'\n", fi=
lename);
>     +-=C2=A0 =C2=A0 json_object_to_file((char*)filename, json_filter_ob=
j);
>     ++=C2=A0 =C2=A0 json_object_to_file(filename, json_filter_obj);
>     +
>     +=C2=A0 =C2=A0 =C2=A0return DLT_RETURN_OK;
>     + }
>     +diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
>     +index 97af1cd9..94024eb4 100644
>     +--- a/src/daemon/dlt-daemon.c
>     ++++ b/src/daemon/dlt-daemon.c
>     +@@ -867,7 +867,7 @@ int option_file_parser(DltDaemonLocal
>     *daemon_local)
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if ((longval =3D=3D
>     MULTICAST_CONNECTION_DISABLED)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (longval =3D=3D
>     MULTICAST_CONNECTION_ENABLED)) {
>     +- daemon_local->UDPConnectionSetup =3D longval;
>     ++ daemon_local->UDPConnectionSetup =3D (int)longval;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf("Option: %s=3D%s\n", token, =
value);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0else {
>     +@@ -884,7 +884,7 @@ int option_file_parser(DltDaemonLocal
>     *daemon_local)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else if (strcmp(token, "UDPMulticastIPPort")
>     =3D=3D 0)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{
>     +- daemon_local->UDPMulticastIPPort =3D strtol(value, NULL, 10);
>     ++ daemon_local->UDPMulticastIPPort =3D (int)strtol(value, NULL, 10=
);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}
>     + #endif
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else if (strcmp(token, "BindAddress") =3D=3D 0)
>     +diff --git a/src/daemon/udp_connection/dlt_daemon_udp_socket.c
>     b/src/daemon/udp_connection/dlt_daemon_udp_socket.c
>     +index 4c40cda8..b3408773 100644
>     +--- a/src/daemon/udp_connection/dlt_daemon_udp_socket.c
>     ++++ b/src/daemon/udp_connection/dlt_daemon_udp_socket.c
>     +@@ -66,7 +66,7 @@ void
>     dlt_daemon_udp_setmulticast_addr(DltDaemonLocal *daemon_local)
>     +=C2=A0 =C2=A0 =C2=A0struct sockaddr_in clientaddr;
>     +=C2=A0 =C2=A0 =C2=A0clientaddr.sin_family =3D AF_INET;
>     +=C2=A0 =C2=A0 =C2=A0inet_pton(AF_INET, daemon_local->UDPMulticastI=
PAddress,
>     &clientaddr.sin_addr);
>     +-=C2=A0 =C2=A0 clientaddr.sin_port =3D htons(daemon_local->UDPMult=
icastIPPort);
>     ++=C2=A0 =C2=A0 clientaddr.sin_port =3D
>     htons((uint16_t)daemon_local->UDPMulticastIPPort);
>     +=C2=A0 =C2=A0 =C2=A0memcpy(&g_udpmulticast_addr.clientaddr, &clien=
taddr,
>     sizeof(struct sockaddr_in));
>     +=C2=A0 =C2=A0 =C2=A0g_udpmulticast_addr.clientaddr_size =3D
>     sizeof(g_udpmulticast_addr.clientaddr);
>     +=C2=A0 =C2=A0 =C2=A0g_udpmulticast_addr.isvalidflag =3D ADDRESS_VA=
LID;
>     +@@ -224,17 +224,17 @@ void
>     dlt_daemon_udp_clientmsg_send(DltDaemonClientSockInfo *clientinfo,
>     +
>     +=C2=A0 =C2=A0 =C2=A0if ((clientinfo->isvalidflag =3D=3D ADDRESS_VA=
LID) &&
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(size1 > 0) && (size2 > 0)) {
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *data =3D (void *)calloc(size1 +=
 size2, sizeof(char));
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *data =3D (void *)calloc((size_t=
)(size1 + size2),
>     sizeof(char));
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (data =3D=3D NULL) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_ERR, =
"%s: calloc failure\n", __func__);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(data, data1, size1);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(data + size1, data2, size2);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(data, data1, (size_t)size1);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy((int*)data + size1, data2, (si=
ze_t)size2);
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sendto(g_udp_sock_fd, data, size1=
 + size2, 0,
>     (struct sockaddr *)&clientinfo->clientaddr,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sendto(g_udp_sock_fd, data, (size=
_t)(size1 + size2),
>     0, (struct sockaddr *)&clientinfo->clientaddr,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 clientinfo->clientaddr_size) < 0)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_ERR, =
"%s: Send UDP Packet Data
>     failed\n", __func__);
>     +
>     +diff --git a/src/examples/dlt-example-multicast-clientmsg-view.c
>     b/src/examples/dlt-example-multicast-clientmsg-view.c
>     +index c00537e5..f8920453 100644
>     +--- a/src/examples/dlt-example-multicast-clientmsg-view.c
>     ++++ b/src/examples/dlt-example-multicast-clientmsg-view.c
>     +@@ -74,9 +74,9 @@ int dlt_receiver_receive_socket_udp(struct
>     clientinfostruct *clientinfo, DltRece
>     +=C2=A0 =C2=A0 =C2=A0/* wait for data from socket */
>     +=C2=A0 =C2=A0 =C2=A0unsigned int addrlen =3D sizeof(clientinfo->ad=
dr);
>     +
>     +-=C2=A0 =C2=A0 if ((receiver->bytesRcvd =3D recvfrom(clientinfo->f=
d,
>     ++=C2=A0 =C2=A0 if ((receiver->bytesRcvd =3D (int32_t)recvfrom(clie=
ntinfo->fd,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0receiver->buf +
>     receiver->lastBytesRcvd,
>     +- receiver->buffersize - receiver->lastBytesRcvd,
>     ++ (size_t)(receiver->buffersize - receiver->lastBytesRcvd),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(struct sockaddr
>     *)&(clientinfo->addr), &addrlen))
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<=3D 0) {
>     +@@ -177,11 +177,11 @@ int main()
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_receiver_receive_socket_udp(=
&clientinfo,
>     &(clientinfo.receiver));
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (dlt_message_read(&msg, (u=
nsigned char
>     *)(clientinfo.receiver.buf),
>     +- clientinfo.receiver.bytesRcvd, 0, 0) =3D=3D DLT_MESSAGE_ERROR_OK=
) {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned
>     int)clientinfo.receiver.bytesRcvd, 0, 0) =3D=3D DLT_MESSAGE_ERROR_O=
K) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_receive_messag=
e_callback_udp(&msg);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dlt_receiver_r=
emove(&(clientinfo.receiver),
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.headersiz=
e +
>     msg.datasize - sizeof(DltStorageHeader))
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg.headersiz=
e +
>     msg.datasize - ((int32_t)(sizeof(DltStorageHeader))))
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D=
 DLT_RETURN_ERROR) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* R=
eturn value ignored */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_=
message_free(&msg, 0);
>     +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h
>     b/src/offlinelogstorage/dlt_offline_logstorage.h
>     +index 09ea5ce4..cfb70f33 100644
>     +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
>     ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
>     +@@ -192,7 +192,7 @@ struct DltLogStorageFilterConfig
>     +=C2=A0 =C2=A0 =C2=A0int overwrite;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Overwrite strategy */
>     +=C2=A0 =C2=A0 =C2=A0int skip;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Flag to skip file logging
>     if DISCARD_NEW */
>     +=C2=A0 =C2=A0 =C2=A0char *ecuid;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ECU identifier */
>     +-=C2=A0 =C2=A0 unsigned int gzip_compression;=C2=A0 /* Toggle if l=
og files
>     should be gzip compressed */
>     ++=C2=A0 =C2=A0 int gzip_compression;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Toggle if log files
>     should be gzip compressed */
>     +=C2=A0 =C2=A0 =C2=A0/* callback function for filter configurations=
 */
>     +=C2=A0 =C2=A0 =C2=A0int (*dlt_logstorage_prepare)(DltLogStorageFil=
terConfig *config,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DltLogStorageU=
serConfig
>     *file_config,
>     +diff --git
>     a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>     b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>     +index ff09c9eb..ae8f4442 100644
>     +--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>     ++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
>     +@@ -848,10 +848,10 @@ DLT_STATIC int
>     dlt_logstorage_write_to_log(void *ptr, size_t size, size_t nmemb,
>     + {
>     + #ifdef DLT_LOGSTORAGE_USE_GZIP
>     +=C2=A0 =C2=A0 =C2=A0if (config->gzip_compression =3D=3D DLT_LOGSTO=
RAGE_GZIP_ON) {
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gzfwrite(ptr, size, nmemb, con=
fig->gzlog);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (int)gzfwrite(ptr, size, nmemb=
, config->gzlog);
>     +=C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0else {
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fwrite(ptr, size, nmemb, confi=
g->log);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (int)fwrite(ptr, size, nmemb, =
config->log);
>     +=C2=A0 =C2=A0 =C2=A0}
>     + #else
>     +=C2=A0 =C2=A0 =C2=A0return (int)fwrite(ptr, size, nmemb, config->l=
og);
>     +--
>     +2.34.1
>     +
>     diff --git
>     a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-fai=
lure-when-systemd-is-enabled.patch
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-fai=
lure-when-systemd-is-enabled.patch
>     new file mode 100644
>     index 0000000000..d19a23cd9c
>     --- /dev/null
>     +++
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-fai=
lure-when-systemd-is-enabled.patch
>     @@ -0,0 +1,423 @@
>     +From 28322f951bb8510ddb4cf767426a67c81ce826ab Mon Sep 17 00:00:00
>     2001
>     +From: Changqing Li <changqing.li@windriver.com>
>     +Date: Tue, 17 Mar 2026 13:04:11 +0800
>     +Subject: [PATCH] fix build failure when systemd is enabled
>     +
>     +Fix build failures when -DWITH_SYSTEMD=3DON,
>     -DWITH_SYSTEMD_WATCHDOG=3DON,
>     +-DWITH_SYSTEMD_JOURNAL=3DON:
>     +Eg:
>     +src/system/dlt-system-syslog.c:91:39: error: conversion from
>     'int' to '__uint16_t' {aka 'short unsigned int'} may change value
>     [-Werror=3Dconversion]
>     +=C2=A0 =C2=A091 |=C2=A0 =C2=A0 =C2=A0syslog_addr.sin6_port =3D hto=
ns(opts.Port);
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0~~~~^~~~~
>     +
>     +src/system/dlt-system-logfile.c:74:21: error: conversion from
>     'size_t' {aka 'long unsigned int'} to 'int' may change value
>     [-Werror=3Dconversion]
>     +=C2=A0 =C2=A074 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b=
ytes =3D fread(buffer, 1, sizeof(buffer) - 1,
>     pFile);
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~
>     +
>     +src/daemon/dlt-daemon.c:5513:14: error: unused variable
>     'curr_time' [-Werror=3Dunused-variable]
>     + 5513 |=C2=A0 =C2=A0 =C2=A0uint32_t curr_time =3D 0U;
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~
>     +
>     +src/system/dlt-system-syslog.c:120:22: error: conversion from
>     'ssize_t' {aka 'long int'} to 'int' may change value
>     [-Werror=3Dconversion]
>     +=C2=A0 120 |=C2=A0 =C2=A0 =C2=A0int bytes_read =3D recvfrom(sock, =
recv_data,
>     RECV_BUF_SZ, 0,
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~
>     +
>     +src/system/dlt-system-logfile.c:76:23: error: comparison of
>     unsigned expression in '>=3D 0' is always true [-Werror=3Dtype-limi=
ts]
>     +=C2=A0 =C2=A076 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (bytes >=3D 0)
>     +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~
>     +
>     + src/system/dlt-system-filetransfer.c:727:56: error:
>     '__builtin___snprintf_chk' output may be truncated before the last
>     format cha=C2=A0 =C2=A0 racter [-Werror=3Dformat-truncation=3D]
>     + 10=C2=A0 =C2=A0727 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(tosend, length,
>     "%s/%s", opts->Directory[j], ie->name);
>     +
>     +src/system/dlt-system-filetransfer.c:153: error: declaration of
>     'len' shadows a previous local [-Werror=3Dshadow]
>     +
>     +Upstream-Status: Submitted
>     [https://github.com/COVESA/dlt-daemon/pull/828
>     <https://urldefense.com/v3/__https://github.com/COVESA/dlt-daemon/p=
ull/828__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwg=
KCnWjFUrDjJw65Kupu8DEeN5lIJ9JaNx5KJlQ$>]
>     +
>     +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     +---
>     + src/daemon/dlt-daemon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +----
>     + src/daemon/dlt_daemon_client.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-
>     + src/system/dlt-system-filetransfer.c=C2=A0 =C2=A0 =C2=A0| 43
>     +++++++++++++-----------
>     + src/system/dlt-system-journal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 2 +-
>     + src/system/dlt-system-logfile.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 4 +--
>     + src/system/dlt-system-process-handling.c |=C2=A0 2 +-
>     + src/system/dlt-system-processes.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-
>     + src/system/dlt-system-syslog.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 6 ++--
>     + src/system/dlt-system-watchdog.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 8 ++---
>     + systemd/3rdparty/sd-daemon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 5 +--
>     + 10 files changed, 40 insertions(+), 42 deletions(-)
>     +
>     +diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
>     +index ef42f89..8c318a4 100644
>     +--- a/src/daemon/dlt-daemon.c
>     ++++ b/src/daemon/dlt-daemon.c
>     +@@ -1620,7 +1620,7 @@ int main(int argc, char *argv[])
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0watchdogTimeoutSec=
onds =3D 30;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 daemon.watchdog_trigger_interval =3D =
watchdogTimeoutSeconds;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 daemon.watchdog_trigger_interval =3D =
(unsigned
>     int)watchdogTimeoutSeconds;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0daemon.watchdog_last_trigger_tim=
e =3D 0U;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_timer_fd(&daemon_local,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0watchdogTimeoutSeconds,
>     +@@ -5509,9 +5509,6 @@ int
>     dlt_daemon_send_ringbuffer_to_client(DltDaemon *daemon,
>     DltDaemonLocal *daem
>     +=C2=A0 =C2=A0 =C2=A0int ret;
>     +=C2=A0 =C2=A0 =C2=A0static uint8_t data[DLT_DAEMON_RCVBUFSIZE];
>     +=C2=A0 =C2=A0 =C2=A0int length;
>     +-#ifdef DLT_SYSTEMD_WATCHDOG_ENABLE
>     +-=C2=A0 =C2=A0 uint32_t curr_time =3D 0U;
>     +-#endif
>     +
>     +=C2=A0 =C2=A0 =C2=A0PRINT_FUNCTION_VERBOSE(verbose);
>     +
>     +@@ -5554,9 +5551,6 @@ int
>     dlt_daemon_send_ringbuffer_to_client_v2(DltDaemon *daemon,
>     DltDaemonLocal *d
>     +=C2=A0 =C2=A0 =C2=A0int ret;
>     +=C2=A0 =C2=A0 =C2=A0static uint8_t data[DLT_DAEMON_RCVBUFSIZE];
>     +=C2=A0 =C2=A0 =C2=A0int length;
>     +-#ifdef DLT_SYSTEMD_WATCHDOG_ENABLE
>     +-=C2=A0 =C2=A0 uint32_t curr_time =3D 0U;
>     +-#endif
>     +
>     +=C2=A0 =C2=A0 =C2=A0PRINT_FUNCTION_VERBOSE(verbose);
>     +
>     +diff --git a/src/daemon/dlt_daemon_client.c
>     b/src/daemon/dlt_daemon_client.c
>     +index 20a512b..681bf1e 100644
>     +--- a/src/daemon/dlt_daemon_client.c
>     ++++ b/src/daemon/dlt_daemon_client.c
>     +@@ -4690,7 +4690,7 @@ int
>     dlt_daemon_process_systemd_timer(DltDaemon *daemon,
>     +
>     +=C2=A0 =C2=A0 =C2=A0if ((daemon_local =3D=3D NULL) || (daemon =3D=3D=
 NULL) || (receiver
>     =3D=3D NULL)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_vlog(LOG_ERR, "%s: invalid p=
arameters", __func__);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return res;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (int)res;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0res =3D read(receiver->fd, &expir, sizeof(expi=
r));
>     +diff --git a/src/system/dlt-system-filetransfer.c
>     b/src/system/dlt-system-filetransfer.c
>     +index c082f22..6024a3e 100644
>     +--- a/src/system/dlt-system-filetransfer.c
>     ++++ b/src/system/dlt-system-filetransfer.c
>     +@@ -105,14 +105,14 @@ char *unique_name(char *src)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING("dlt-sy=
stem-filetransfer, creating unique
>     temporary file name."));
>     +=C2=A0 =C2=A0 =C2=A0time_t t =3D time(NULL);
>     +=C2=A0 =C2=A0 =C2=A0int ok;
>     +-=C2=A0 =C2=A0 uint32_t l =3D getFileSerialNumber(src, &ok) ^ t;
>     ++=C2=A0 =C2=A0 uint32_t l =3D (uint32_t)(getFileSerialNumber(src, =
&ok) ^ t);
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (!ok)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (char *)NULL;
>     +
>     +=C2=A0 =C2=A0 =C2=A0char *basename_f =3D basename(src);
>     +=C2=A0 =C2=A0 =C2=A0/* Length of ULONG_MAX + 1 */
>     +-=C2=A0 =C2=A0 int len =3D 11 + strlen(basename_f);
>     ++=C2=A0 =C2=A0 size_t len =3D 11 + strlen(basename_f);
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (len > NAME_MAX) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(dltsystem, DLT_LOG_WARN,
>     +@@ -155,7 +155,7 @@ void send_dumped_file(FiletransferOptions
>     const *opts, char *dst_tosend)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ((total - us=
ed) < (total / 2)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stru=
ct timespec t;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t.tv=
_sec =3D 0;
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.tv_nsec=
 =3D 1000000ul * opts->TimeoutBetweenLogs;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.tv_nsec=
 =3D (long int)(1000000ul * (unsigned
>     long)opts->TimeoutBetweenLogs);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nano=
sleep(&t, NULL);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_=
user_log_resend_buffer();
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlt_=
user_check_buffer(&total, &used);
>     +@@ -220,7 +220,7 @@ int compress_file_to(char *src, char *dst,
>     int level)
>     +=C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(buf);
>     +
>     +=C2=A0 =C2=A0 =C2=A0while (!feof(src_file)) {
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int read =3D fread(buf, 1, Z_CHUNK_SZ=
, src_file);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t read =3D fread(buf, 1, Z_CHUNK=
_SZ, src_file);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ferror(src_file)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(buf);
>     +@@ -230,7 +230,7 @@ int compress_file_to(char *src, char *dst,
>     int level)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gzwrite(dst_file, buf, read);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 gzwrite(dst_file, buf, (unsigned int)=
read);
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (remove(src) < 0)
>     +@@ -290,7 +290,7 @@ int send_one(char *src, FiletransferOptions
>     const *opts, int which)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *dst_tocompress;/*file whic=
h is going to be
>     compressed, the compressed one is named dst_tosend */
>     +
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strlen(fdir) + strlen(SUB=
DIR_COMPRESS) +
>     strlen(rn) + 3;/*the filename in .tocompress +2 for 2*"/", +1 for
>     \0 */
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(fdir) + strlen(=
SUBDIR_COMPRESS) +
>     strlen(rn) + 3;/*the filename in .tocompress +2 for 2*"/", +1 for
>     \0 */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst_tocompress =3D malloc(len);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(dst_tocompress);
>     +
>     +@@ -328,7 +328,7 @@ int send_one(char *src, FiletransferOptions
>     const *opts, int which)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*move it directly into "tosend"=
 */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(dltsystem, DLT_LOG_DEBUG=
,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_=
STRING("dlt-system-filetransfer, Moving file
>     to tmp directory."));
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strlen(fdir) + strlen(SUB=
DIR_TOSEND) +
>     strlen(rn) + 3;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(fdir) + strlen(=
SUBDIR_TOSEND) +
>     strlen(rn) + 3;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst_tosend =3D malloc(len);/*the=
 resulting filename in
>     .tosend +2 for 2*"/", +1 for \0 */
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(dst_tosend, len, "%s/%s=
/%s", fdir,
>     SUBDIR_TOSEND, rn);
>     +@@ -379,7 +379,7 @@ int flush_dir_send(FiletransferOptions const
>     *opts, const char *compress_dir, co
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(dltsystem,=
 DLT_LOG_DEBUG,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DLT_STRING("dlt-system-filetransfer, old
>     compressed file found in send directory:"),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DLT_STRING(dp->d_name));
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strlen(send=
_dir) + strlen(dp->d_name) + 2;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(s=
end_dir) + strlen(dp->d_name) + 2;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fn =3D malloc(len)=
;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(fn);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(fn, len, =
"%s/%s", send_dir, dp->d_name);
>     +@@ -394,10 +394,10 @@ int flush_dir_send(FiletransferOptions
>     const *opts, const char *compress_dir, co
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strn=
cpy(tmp, dp->d_name, strlen(dp->d_name) -
>     strlen(COMPRESS_EXTENSION));
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp[=
strlen(dp->d_name) -
>     strlen(COMPRESS_EXTENSION)] =3D '\0';
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D=
 strlen(tmp) + strlen(compress_dir) + 1
>     + 1;/*2 sizes + 1*"/" + \0 */
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *pat=
h_uncompressed =3D malloc(len);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t le=
ngth =3D strlen(tmp) +
>     strlen(compress_dir) + 1 + 1;/*2 sizes + 1*"/" + \0 */
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *pat=
h_uncompressed =3D malloc(length);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MALL=
OC_ASSERT(path_uncompressed);
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(=
path_uncompressed, len, "%s/%s",
>     compress_dir, tmp);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(=
path_uncompressed, length, "%s/%s",
>     compress_dir, tmp);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stru=
ct stat sb;
>     +
>     +@@ -475,7 +475,7 @@ int flush_dir_compress(FiletransferOptions
>     const *opts, int which, const char *c
>     +
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*compress file in=
to to_send dir */
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strlen(comp=
ress_dir) + strlen(dp->d_name) + 2;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(c=
ompress_dir) +
>     strlen(dp->d_name) + 2;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *cd_filename =
=3D malloc(len);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(cd_f=
ilename);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(cd_filena=
me, len, "%s/%s", compress_dir,
>     dp->d_name);
>     +@@ -526,7 +526,7 @@ int flush_dir_original(FiletransferOptions
>     const *opts, int which)
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(dltsystem,=
 DLT_LOG_DEBUG,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DLT_STRING("dlt-system-filetransfer, old
>     file found in directory."));
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strlen(sdir=
) + strlen(dp->d_name) + 2;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(s=
dir) + strlen(dp->d_name) + 2;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *fn =3D mallo=
c(len);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(fn);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(fn, len, =
"%s/%s", sdir, dp->d_name);
>     +@@ -564,7 +564,7 @@ int flush_dir(FiletransferOptions const
>     *opts, int which)
>     +
>     +=C2=A0 =C2=A0 =C2=A0char *compress_dir;
>     +=C2=A0 =C2=A0 =C2=A0char *send_dir;
>     +-=C2=A0 =C2=A0 int len =3D strlen(opts->Directory[which]) +
>     strlen(SUBDIR_COMPRESS) + 2;
>     ++=C2=A0 =C2=A0 size_t len =3D strlen(opts->Directory[which]) +
>     strlen(SUBDIR_COMPRESS) + 2;
>     +=C2=A0 =C2=A0 =C2=A0compress_dir =3D malloc (len);
>     +=C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(compress_dir);
>     +=C2=A0 =C2=A0 =C2=A0snprintf(compress_dir, len, "%s/%s", opts->Dir=
ectory[which],
>     SUBDIR_COMPRESS);
>     +@@ -625,7 +625,7 @@ int
>     init_filetransfer_dirs(DltSystemConfiguration *config)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*create subdirectories for proc=
essing the files */
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *subdirpath;
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D strlen(opts->Directory[i]=
) +
>     strlen(SUBDIR_COMPRESS) + 2;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =3D strlen(opts->Directory=
[i]) +
>     strlen(SUBDIR_COMPRESS) + 2;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subdirpath =3D malloc (len);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MALLOC_ASSERT(subdirpath);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(subdirpath, len, "%s/%s=
", opts->Directory[i],
>     SUBDIR_COMPRESS);
>     +@@ -699,7 +699,7 @@ int process_files(FiletransferOptions const
>     *opts)
>     +
>     +=C2=A0 =C2=A0 =C2=A0unsigned int i =3D 0;
>     +
>     +-=C2=A0 =C2=A0 while (i < (len - INOTIFY_SZ)) {
>     ++=C2=A0 =C2=A0 while (i < ((long unsigned int)len - INOTIFY_SZ)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct inotify_event *ie =3D (st=
ruct inotify_event *)&buf[i];
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ie->len > 0) {
>     +@@ -712,26 +712,29 @@ int process_files(FiletransferOptions const
>     *opts)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG_DEBUG,
>     + =C2=A0DLT_STRING("dlt-system-filetransfer, found new file."),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(ie->name))=
;
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 int length =3D strlen(opts->Directory[j])
>     + ie->len + 1;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 size_t length =3D
>     strlen(opts->Directory[j]) + strlen(ie->name) + 2;
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if (length > PATH_MAX) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(filetransferContext,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG=
_ERROR,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STR=
ING(
>     + =C2=A0"dlt-system-filetransfer: Very long path for file transfer.
>     Cancelling transfer! Length is: "),
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DLT_INT(lengt=
h));
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DLT_INT((int)=
length));
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0char *tosend =3D malloc(length);
>     ++#pragma GCC diagnostic push
>     ++#pragma GCC diagnostic ignored "-Wformat-truncation=3D"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0snprintf(tosend, length, "%s/%s",
>     opts->Directory[j], ie->name);
>     ++#pragma GCC diagnostic pop
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0send_one(tosend, opts, j);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0free(tosend);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 i +=3D INOTIFY_SZ + ie->len;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 i +=3D (unsigned int)INOTIFY_SZ + ie-=
>len;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     + #endif
>     +@@ -741,4 +744,4 @@ int process_files(FiletransferOptions const
>     *opts)
>     + void filetransfer_fd_handler(DltSystemConfiguration *config)
>     + {
>     +=C2=A0 =C2=A0 =C2=A0process_files(&(config->Filetransfer));
>     +-}
>     +\ No newline at end of file
>     ++}
>     +diff --git a/src/system/dlt-system-journal.c
>     b/src/system/dlt-system-journal.c
>     +index 366555b..9a55c3f 100644
>     +--- a/src/system/dlt-system-journal.c
>     ++++ b/src/system/dlt-system-journal.c
>     +@@ -393,7 +393,7 @@ void register_journal_fd(sd_journal **j,
>     struct pollfd *pollfd, int i,=C2=A0 DltSyste
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(strerro=
r(pollfd[i].fd)));
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j_tmp =3D NULL;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +-=C2=A0 =C2=A0 pollfd[i].events =3D sd_journal_get_events(j_tmp);
>     ++=C2=A0 =C2=A0 pollfd[i].events =3D (short)sd_journal_get_events(j=
_tmp);
>     +=C2=A0 =C2=A0 =C2=A0if(pollfd[i].events < 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(dltsystem, DLT_LOG_ERROR=
, DLT_STRING("Error
>     while getting journal events: "),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(strerro=
r(pollfd[i].events)));
>     +diff --git a/src/system/dlt-system-logfile.c
>     b/src/system/dlt-system-logfile.c
>     +index 941a3be..d31441c 100644
>     +--- a/src/system/dlt-system-logfile.c
>     ++++ b/src/system/dlt-system-logfile.c
>     +@@ -64,7 +64,7 @@ void send_file(LogFileOptions const *fileopt,
>     int n)
>     +=C2=A0 =C2=A0 =C2=A0FILE *pFile;
>     +=C2=A0 =C2=A0 =C2=A0DltContext context =3D logfileContext[n];
>     +=C2=A0 =C2=A0 =C2=A0char buffer[1024];
>     +-=C2=A0 =C2=A0 int bytes;
>     ++=C2=A0 =C2=A0 size_t bytes;
>     +=C2=A0 =C2=A0 =C2=A0int seq =3D 1;
>     +
>     +=C2=A0 =C2=A0 =C2=A0pFile =3D fopen((*fileopt).Filename[n], "r");
>     +@@ -73,7 +73,7 @@ void send_file(LogFileOptions const *fileopt,
>     int n)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (!feof(pFile)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes =3D fread(bu=
ffer, 1, sizeof(buffer) - 1, pFile);
>     +
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes >=3D 0)
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes =3D=3D (sizeo=
f(buffer) - 1))
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buff=
er[bytes] =3D 0;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buff=
er[0] =3D 0;
>     +diff --git a/src/system/dlt-system-process-handling.c
>     b/src/system/dlt-system-process-handling.c
>     +index 3e092d4..708e9e3 100644
>     +--- a/src/system/dlt-system-process-handling.c
>     ++++ b/src/system/dlt-system-process-handling.c
>     +@@ -201,7 +201,7 @@ int register_timer_fd(struct pollfd *pollfd,
>     int fdcnt)
>     + void timer_fd_handler(int fd, DltSystemConfiguration *config)
>     + {
>     +=C2=A0 =C2=A0 =C2=A0uint64_t timersElapsed =3D 0ULL;
>     +-=C2=A0 =C2=A0 int r =3D read(fd, &timersElapsed, 8U);=C2=A0 =C2=A0=
 // only needed to
>     reset fd event
>     ++=C2=A0 =C2=A0 int r =3D (int)read(fd, &timersElapsed, 8U);=C2=A0 =
=C2=A0 // only needed
>     to reset fd event
>     +=C2=A0 =C2=A0 =C2=A0if (r < 0)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(dltsystem, DLT_LOG_ERROR=
, DLT_STRING("Error
>     while reading timer fd: "),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(strerro=
r(r)));
>     +diff --git a/src/system/dlt-system-processes.c
>     b/src/system/dlt-system-processes.c
>     +index c35596c..b17b8ee 100644
>     +--- a/src/system/dlt-system-processes.c
>     ++++ b/src/system/dlt-system-processes.c
>     +@@ -72,7 +72,7 @@ void send_process(LogProcessOptions const
>     *popts, int n)
>     +=C2=A0 =C2=A0 =C2=A0struct dirent *dp;
>     +=C2=A0 =C2=A0 =C2=A0char filename[PATH_MAX];
>     +=C2=A0 =C2=A0 =C2=A0char buffer[1024];
>     +-=C2=A0 =C2=A0 int bytes;
>     ++=C2=A0 =C2=A0 size_t bytes;
>     +=C2=A0 =C2=A0 =C2=A0int found =3D 0;
>     +
>     +=C2=A0 =C2=A0 =C2=A0/* go through all process files in directory *=
/
>     +diff --git a/src/system/dlt-system-syslog.c
>     b/src/system/dlt-system-syslog.c
>     +index 59e9d3f..d6b1b8a 100644
>     +--- a/src/system/dlt-system-syslog.c
>     ++++ b/src/system/dlt-system-syslog.c
>     +@@ -88,7 +88,7 @@ int init_socket(SyslogOptions opts)
>     + #ifdef DLT_USE_IPv6
>     +=C2=A0 =C2=A0 =C2=A0syslog_addr.sin6_family =3D AF_INET6;
>     +=C2=A0 =C2=A0 =C2=A0syslog_addr.sin6_addr =3D in6addr_any;
>     +-=C2=A0 =C2=A0 syslog_addr.sin6_port =3D htons(opts.Port);
>     ++=C2=A0 =C2=A0 syslog_addr.sin6_port =3D htons((uint16_t)opts.Port=
);
>     + #else
>     +=C2=A0 =C2=A0 =C2=A0syslog_addr.sin_family =3D AF_INET;
>     +=C2=A0 =C2=A0 =C2=A0syslog_addr.sin_addr.s_addr =3D INADDR_ANY;
>     +@@ -117,7 +117,7 @@ int read_socket(int sock)
>     +=C2=A0 =C2=A0 =C2=A0struct sockaddr_in client_addr;
>     +=C2=A0 =C2=A0 =C2=A0socklen_t addr_len =3D sizeof(struct sockaddr_=
in);
>     +
>     +-=C2=A0 =C2=A0 int bytes_read =3D recvfrom(sock, recv_data, RECV_B=
UF_SZ, 0,
>     ++=C2=A0 =C2=A0 int bytes_read =3D (int)recvfrom(sock, recv_data, R=
ECV_BUF_SZ, 0,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct sockaddr *)&client_a=
ddr,
>     &addr_len);
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (bytes_read =3D=3D -1) {
>     +@@ -157,4 +157,4 @@ int register_syslog_fd(struct pollfd *pollfd,
>     int i, DltSystemConfiguration *con
>     + void syslog_fd_handler(int syslogSock)
>     + {
>     +=C2=A0 =C2=A0 =C2=A0read_socket(syslogSock);
>     +-}
>     +\ No newline at end of file
>     ++}
>     +diff --git a/src/system/dlt-system-watchdog.c
>     b/src/system/dlt-system-watchdog.c
>     +index 7ed1604..6334214 100644
>     +--- a/src/system/dlt-system-watchdog.c
>     ++++ b/src/system/dlt-system-watchdog.c
>     +@@ -56,7 +56,7 @@ int calculate_period(struct itimerspec *itval)
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0DLT_LOG(watchdogContext, DLT_LOG_DEBUG,
>     DLT_STRING("watchdogusec: "), DLT_STRING(watchdogUSec));
>     +-=C2=A0 =C2=A0 watchdogTimeoutSeconds =3D atoi(watchdogUSec);
>     ++=C2=A0 =C2=A0 watchdogTimeoutSeconds =3D (unsigned int)atoi(watch=
dogUSec);
>     +
>     +=C2=A0 =C2=A0 =C2=A0if (watchdogTimeoutSeconds <=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(str, 512, "systemd watc=
hdog timeout incorrect:
>     %u\n", watchdogTimeoutSeconds);
>     +@@ -78,9 +78,9 @@ int calculate_period(struct itimerspec *itval)
>     +=C2=A0 =C2=A0 =C2=A0sec =3D notifiyPeriodNSec / 1000000;
>     +=C2=A0 =C2=A0 =C2=A0ns =3D (notifiyPeriodNSec - (sec * 1000000)) *=
 1000;
>     +=C2=A0 =C2=A0 =C2=A0itval->it_interval.tv_sec =3D sec;
>     +-=C2=A0 =C2=A0 itval->it_interval.tv_nsec =3D ns;
>     ++=C2=A0 =C2=A0 itval->it_interval.tv_nsec =3D (long int)ns;
>     +=C2=A0 =C2=A0 =C2=A0itval->it_value.tv_sec =3D sec;
>     +-=C2=A0 =C2=A0 itval->it_value.tv_nsec =3D ns;
>     ++=C2=A0 =C2=A0 itval->it_value.tv_nsec =3D (long int)ns;
>     +
>     +=C2=A0 =C2=A0 =C2=A0return 0;
>     + }
>     +@@ -114,7 +114,7 @@ void watchdog_fd_handler(int fd)
>     + #endif
>     + {
>     +=C2=A0 =C2=A0 =C2=A0uint64_t timersElapsed =3D 0ULL;
>     +-=C2=A0 =C2=A0 int r =3D read(fd, &timersElapsed, 8U);=C2=A0 =C2=A0=
 // only needed to
>     reset fd event
>     ++=C2=A0 =C2=A0 int r =3D (int)read(fd, &timersElapsed, 8U);=C2=A0 =
=C2=A0 // only needed
>     to reset fd event
>     +=C2=A0 =C2=A0 =C2=A0if(r < 0)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_LOG(watchdogContext, DLT_LOG=
_ERROR,
>     DLT_STRING("Could not reset systemd watchdog. Exit with: "),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLT_STRING(strerro=
r(r)));
>     +diff --git a/systemd/3rdparty/sd-daemon.c
>     b/systemd/3rdparty/sd-daemon.c
>     +index de3f985..9fde8cc 100644
>     +--- a/systemd/3rdparty/sd-daemon.c
>     ++++ b/systemd/3rdparty/sd-daemon.c
>     +@@ -46,6 +46,7 @@
>     + #include <stdio.h>
>     + #include <stddef.h>
>     + #include <limits.h>
>     ++#include <stdint.h>
>     +
>     + #if defined(__linux__)
>     + #include <mqueue.h>
>     +@@ -456,12 +457,12 @@ _sd_export_ int sd_notify(int
>     unset_environment, const char *state) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sock=
addr.un.sun_path[0] =3D 0;
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&iovec, 0, sizeof(iovec))=
;
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 iovec.iov_base =3D (char*) state;
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 iovec.iov_base =3D (void *)(uintptr_t=
)state;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iovec.iov_len =3D strlen(state);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&msghdr, 0, sizeof(msghdr=
));
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msghdr.msg_name =3D &sockaddr;
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msghdr.msg_namelen =3D offsetof(struc=
t sockaddr_un,
>     sun_path) + strlen(e);
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 msghdr.msg_namelen =3D (socklen_t)(of=
fsetof(struct
>     sockaddr_un, sun_path) + strlen(e));
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msghdr.msg_namelen > sizeof(=
struct sockaddr_un))
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msgh=
dr.msg_namelen =3D sizeof(struct sockaddr_un);
>     +--
>     +2.34.1
>     +
>     diff --git
>     a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-w=
ith-cmake-4.patch
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-w=
ith-cmake-4.patch
>     deleted file mode 100644
>     index ac5fec5684..0000000000
>     ---
>     a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-w=
ith-cmake-4.patch
>     +++ /dev/null
>     @@ -1,99 +0,0 @@
>     -From ae23f2cccc169874d89903cad24bf36e19bef659 Mon Sep 17 00:00:00
>     2001
>     -From: Alper Ak <alperyasinak1@gmail.com>
>     -Date: Wed, 9 Jul 2025 18:18:33 +0300
>     -Subject: [PATCH] cmake: Set minimum required version to 3.5 for
>     CMake 4+
>     - compatibility
>     -
>     -Fix:
>     -
>     -| CMake Error at CMakeLists.txt:17 (cmake_minimum_required):
>     -|=C2=A0 =C2=A0Compatibility with CMake < 3.5 has been removed from=
 CMake.
>     -|
>     -|=C2=A0 =C2=A0Update the VERSION argument <min> value.=C2=A0 Or, u=
se the
>     <min>...<max> syntax
>     -|=C2=A0 =C2=A0to tell CMake that the project requires at least <mi=
n> but
>     has been updated
>     -|=C2=A0 =C2=A0to work with policies introduced by <max> or earlier.
>     -|
>     -|=C2=A0 =C2=A0Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try =
configuring
>     anyway.
>     -|
>     -|
>     -| -- Configuring incomplete, errors occurred!
>     -
>     -Upstream-Status: Submitted
>     [https://github.com/COVESA/dlt-daemon/pull/755
>     <https://urldefense.com/v3/__https://github.com/COVESA/dlt-daemon/p=
ull/755__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwg=
KCnWjFUrDjJw65Kupu8DEeN5lIJ9JYdy66ntg$>]
>     -
>     -Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
>     ----
>     - CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-
>     - examples/example1/CMakeLists.txt | 2 +-
>     - examples/example2/CMakeLists.txt | 2 +-
>     - examples/example3/CMakeLists.txt | 2 +-
>     - examples/example4/CMakeLists.txt | 2 +-
>     - 5 files changed, 5 insertions(+), 5 deletions(-)
>     -
>     -diff --git a/CMakeLists.txt b/CMakeLists.txt
>     -index 94185b8..2a0f619 100644
>     ---- a/CMakeLists.txt
>     -+++ b/CMakeLists.txt
>     -@@ -14,7 +14,7 @@
>     - #######
>     -
>     - # Set minimum Cmake version and setup policy behavior
>     --cmake_minimum_required(VERSION 3.3)
>     -+cmake_minimum_required(VERSION 3.5)
>     -
>     - if(${CMAKE_VERSION} VERSION_GREATER "3.20" OR ${CMAKE_VERSION}
>     VERSION_EQUAL "3.20")
>     -=C2=A0 =C2=A0 =C2=A0cmake_policy(SET CMP0115 OLD)
>     -diff --git a/examples/example1/CMakeLists.txt
>     b/examples/example1/CMakeLists.txt
>     -index 60644a1..44cd053 100644
>     ---- a/examples/example1/CMakeLists.txt
>     -+++ b/examples/example1/CMakeLists.txt
>     -@@ -17,7 +17,7 @@
>     - # DLT example implementation
>     - #
>     -
>     --cmake_minimum_required( VERSION 2.6 )
>     -+cmake_minimum_required( VERSION 3.5 )
>     - project( automotive-dlt-example1 )
>     -
>     - #
>     -diff --git a/examples/example2/CMakeLists.txt
>     b/examples/example2/CMakeLists.txt
>     -index 66a4f24..a8efbcf 100644
>     ---- a/examples/example2/CMakeLists.txt
>     -+++ b/examples/example2/CMakeLists.txt
>     -@@ -17,7 +17,7 @@
>     - # DLT example implementation
>     - #
>     -
>     --cmake_minimum_required( VERSION 2.6 )
>     -+cmake_minimum_required( VERSION 3.5 )
>     - project( automotive-dlt-example2 )
>     -
>     - #
>     -diff --git a/examples/example3/CMakeLists.txt
>     b/examples/example3/CMakeLists.txt
>     -index 45b7467..4d4958d 100644
>     ---- a/examples/example3/CMakeLists.txt
>     -+++ b/examples/example3/CMakeLists.txt
>     -@@ -17,7 +17,7 @@
>     - # DLT example implementation
>     - #
>     -
>     --cmake_minimum_required( VERSION 2.6 )
>     -+cmake_minimum_required( VERSION 3.5 )
>     - project( automotive-dlt-example3 )
>     -
>     - #
>     -diff --git a/examples/example4/CMakeLists.txt
>     b/examples/example4/CMakeLists.txt
>     -index 53a4fad..161c333 100644
>     ---- a/examples/example4/CMakeLists.txt
>     -+++ b/examples/example4/CMakeLists.txt
>     -@@ -17,7 +17,7 @@
>     - # DLT example implementation
>     - #
>     -
>     --cmake_minimum_required( VERSION 2.6 )
>     -+cmake_minimum_required( VERSION 3.5 )
>     - project( automotive-dlt-example4 )
>     -
>     - #
>     ---
>     -2.43.0
>     -
>     diff --git
>     a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
>     deleted file mode 100644
>     index 3699b8c83a..0000000000
>     --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
>     +++ /dev/null
>     @@ -1,80 +0,0 @@
>     -Upstream-Status: Submitted
>     [https://github.com/COVESA/dlt-daemon/pull/544
>     <https://urldefense.com/v3/__https://github.com/COVESA/dlt-daemon/p=
ull/544__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwg=
KCnWjFUrDjJw65Kupu8DEeN5lIJ9JYS6ETQbA$>]
>     -
>     -From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17 00:00:00
>     2001
>     -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>     -Date: Thu, 28 Sep 2023 12:54:23 +0200
>     -Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock build on
>     non amd64
>     - and i386 arcs
>     -
>     ----
>     - src/core_dump_handler/dlt_cdh.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 ++
>     - src/core_dump_handler/dlt_cdh_cpuinfo.c | 33
>     +++++++++++++++++++++++++
>     - src/core_dump_handler/dlt_cdh_crashid.c |=C2=A0 2 +-
>     - 3 files changed, 36 insertions(+), 1 deletion(-)
>     - create mode 100644 src/core_dump_handler/dlt_cdh_cpuinfo.c
>     -
>     -diff --git a/src/core_dump_handler/dlt_cdh.h
>     b/src/core_dump_handler/dlt_cdh.h
>     -index d572ecf3..8608c6c4 100644
>     ---- a/src/core_dump_handler/dlt_cdh.h
>     -+++ b/src/core_dump_handler/dlt_cdh.h
>     -@@ -55,6 +55,8 @@ typedef struct
>     -=C2=A0 =C2=A0 =C2=A0uint64_t pc;
>     -=C2=A0 =C2=A0 =C2=A0uint64_t ip;
>     -=C2=A0 =C2=A0 =C2=A0uint64_t lr;
>     -+=C2=A0 =C2=A0 uint64_t sp;
>     -+=C2=A0 =C2=A0 uint64_t fp;
>     -
>     - } cdh_registers_t;
>     -
>     -diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c
>     b/src/core_dump_handler/dlt_cdh_cpuinfo.c
>     -new file mode 100644
>     -index 00000000..03509fda
>     ---- /dev/null
>     -+++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c
>     -@@ -0,0 +1,33 @@
>     -+/*
>     -+ * SPDX license identifier: MPL-2.0
>     -+ *
>     -+ * Copyright (C) 2011-2015, BMW AG
>     -+ *
>     -+ * This file is part of COVESA Project DLT - Diagnostic Log and
>     Trace.
>     -+ *
>     -+ * This Source Code Form is subject to the terms of the
>     -+ * Mozilla Public License (MPL), v. 2.0.
>     -+ * If a copy of the MPL was not distributed with this file,
>     -+ * You can obtain one at http://mozilla.org/MPL/2.0/
>     <https://urldefense.com/v3/__http://mozilla.org/MPL/2.0/__;!!AjveYd=
w8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu=
8DEeN5lIJ9Jatfycmhg$>.
>     -+ *
>     -+ * For further information see http://www.covesa.org/
>     <https://urldefense.com/v3/__http://www.covesa.org/__;!!AjveYdw8EvQ=
!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN=
5lIJ9JYo80jTsg$>.
>     -+ */
>     -+
>     -+/*!
>     -+ * \author Gianfranco Costamagna <locutusofborg@debian.org>
>     -+ *
>     -+ * \copyright Copyright =C2=A9 2011-2015 BMW AG. \n
>     -+ * License MPL-2.0: Mozilla Public License version 2.0
>     http://mozilla.org/MPL/2.0/
>     <https://urldefense.com/v3/__http://mozilla.org/MPL/2.0/__;!!AjveYd=
w8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu=
8DEeN5lIJ9Jatfycmhg$>.
>     -+ *
>     -+ * \file dlt_cdh_cpuinfo.c
>     -+ */
>     -+
>     -+#include "dlt_cdh_cpuinfo.h"
>     -+
>     -+void get_registers(prstatus_t *prstatus, cdh_registers_t *registe=
rs)
>     -+{
>     -+/*=C2=A0 =C2=A0 struct user_regs_struct *ptr_reg =3D (struct
>     user_regs_struct *)prstatus->pr_reg;
>     -+
>     -+=C2=A0 =C2=A0 registers->pc =3D ptr_reg->pc;*/ /* [REG_PROC_COUNT=
ER]; */
>     -+
>     -+}
>     -diff --git a/src/core_dump_handler/dlt_cdh_crashid.c
>     b/src/core_dump_handler/dlt_cdh_crashid.c
>     -index bca44e0e..8dd98d70 100644
>     ---- a/src/core_dump_handler/dlt_cdh_crashid.c
>     -+++ b/src/core_dump_handler/dlt_cdh_crashid.c
>     -@@ -30,7 +30,7 @@
>     - #include <stdio.h>
>     - #include <string.h>
>     - #include <errno.h>
>     --#include <asm/prctl.h>
>     -+#include <sys/prctl.h>
>     - #include <inttypes.h>
>     -
>     - #include "dlt_cdh.h"
>     diff --git
>     a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
>     deleted file mode 100644
>     index fd36480456..0000000000
>     --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
>     +++ /dev/null
>     @@ -1,36 +0,0 @@
>     -Upstream-Status: Submitted
>     [https://github.com/COVESA/dlt-daemon/pull/567
>     <https://urldefense.com/v3/__https://github.com/COVESA/dlt-daemon/p=
ull/567__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwg=
KCnWjFUrDjJw65Kupu8DEeN5lIJ9JZFXNiuZg$>]
>     -
>     -From c84e48f6986054cf8b9459e608235b7bd1635746 Mon Sep 17 00:00:00
>     2001
>     -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>     -Date: Mon, 13 Nov 2023 12:37:23 +0100
>     -Subject: [PATCH] dlt_cdh:
>     -
>     -Make sure on 64 bit we read an ELF64 structure.
>     -Otherwise we get a read error, and the context file is missing
>     some good
>     -to know information
>     ----
>     - src/core_dump_handler/dlt_cdh.h | 7 +++++++
>     - 1 file changed, 7 insertions(+)
>     -
>     -diff --git a/src/core_dump_handler/dlt_cdh.h
>     b/src/core_dump_handler/dlt_cdh.h
>     -index 8608c6c4..3dac480a 100644
>     ---- a/src/core_dump_handler/dlt_cdh.h
>     -+++ b/src/core_dump_handler/dlt_cdh.h
>     -@@ -45,10 +45,17 @@
>     - #define CORE_FILE_PATTERN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
"%s/core.%d.%s.%d.gz"
>     - #define CONTEXT_FILE_PATTERN "%s/context.%d.%s.%d.txt"
>     -
>     -+#if ((__SIZEOF_POINTER) =3D=3D 4)
>     - #define ELF_Ehdr=C2=A0 =C2=A0 Elf32_Ehdr
>     - #define ELF_Phdr=C2=A0 =C2=A0 Elf32_Phdr
>     - #define ELF_Shdr=C2=A0 =C2=A0 Elf32_Shdr
>     - #define ELF_Nhdr=C2=A0 =C2=A0 Elf32_Nhdr
>     -+#else
>     -+#define ELF_Ehdr=C2=A0 =C2=A0 Elf64_Ehdr
>     -+#define ELF_Phdr=C2=A0 =C2=A0 Elf64_Phdr
>     -+#define ELF_Shdr=C2=A0 =C2=A0 Elf64_Shdr
>     -+#define ELF_Nhdr=C2=A0 =C2=A0 Elf64_Nhdr
>     -+#endif
>     -
>     - typedef struct
>     - {
>     diff --git
>     a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>     <https://urldefense.com/v3/__http://dlt-daemon_2.18.10.bb__;!!AjveY=
dw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kup=
u8DEeN5lIJ9JYcHKxqHg$>
>     b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
>     <https://urldefense.com/v3/__http://dlt-daemon_3.0.0.bb__;!!AjveYdw=
8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8=
DEeN5lIJ9JadOXRLnA$>
>     similarity index 90%
>     rename from
>     meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>     <https://urldefense.com/v3/__http://dlt-daemon_2.18.10.bb__;!!AjveY=
dw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kup=
u8DEeN5lIJ9JYcHKxqHg$>
>     rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
>     <https://urldefense.com/v3/__http://dlt-daemon_3.0.0.bb__;!!AjveYdw=
8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8=
DEeN5lIJ9JadOXRLnA$>
>     index 82edde6c9d..7f402b0e29 100644
>     --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>     <https://urldefense.com/v3/__http://dlt-daemon_2.18.10.bb__;!!AjveY=
dw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kup=
u8DEeN5lIJ9JYcHKxqHg$>
>     +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
>     <https://urldefense.com/v3/__http://dlt-daemon_3.0.0.bb__;!!AjveYdw=
8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8=
DEeN5lIJ9JadOXRLnA$>
>     @@ -17,12 +17,12 @@ DEPENDS =3D "zlib gzip-native json-c"
>     =C2=A0SRC_URI =3D
>     "git://github.com/COVESA/${BPN}.git;protocol=3Dhttps;branch=3Dmaste=
r
>     <https://urldefense.com/v3/__http://github.com/COVESA/$*7BBPN*7D.gi=
t;protocol=3Dhttps;branch=3Dmaster__;JSU!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEu=
B1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9Ja5QUQ8dg$>
>     \
>     file://0002-Don-t-execute-processes-as-a-specific-user.patch \
>     file://0004-Modify-systemd-config-directory.patch \
>     - file://544.patch \
>     - file://567.patch \
>     -
>     file://0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.=
patch
>     \
>     - file://0003-allow-build-with-cmake-4.patch \
>     + file://0001-Fix-compile-failure-related-to-gzlog.patch \
>     + file://0001-Fix-kinds-of-build-failure.patch \
>     + file://0001-Fix-build-failures.patch \
>     + file://0001-fix-build-failure-when-systemd-is-enabled.patch \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     -SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
>     +SRCREV =3D "f595ea29d1007ca1c3b2d1fd3a88adf7d3db6320"
>
>
>     =C2=A0PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES',
>     'systemd', ' systemd systemd-watchdog systemd-journal ', '', d)} \
>     @@ -71,4 +71,5 @@ FILES:${PN}-doc +=3D "${datadir}/dlt-filetransfer=
"
>
>     =C2=A0do_install:append() {
>     =C2=A0 =C2=A0 =C2=A0rm -f ${D}${bindir}/dlt-test-*
>     +=C2=A0 =C2=A0 sed -i -e 's:${RECIPE_SYSROOT}::g'
>     ${D}/usr/lib/pkgconfig/automotive-dlt.pc
>     =C2=A0}
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#125309):
>     https://lists.openembedded.org/g/openembedded-devel/message/125309
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/125309__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAop=
wZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JY_lTcpng$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/118361368/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1183=
61368/1997914__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBF=
G2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9Ja0U3hmEQ$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUY=
GEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JYLUGtJhw$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------T0abBy6SYssXQlcQ8YRqhlXZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62I5f7iA1345601

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/18/26 12:53, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sr-wqHNeh5Qxv8hUWE7nOajcR=
Xuiyn54CFkUWYTLF150w@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">fails to build see -&nbsp;<a href=3D"https://url=
defense.com/v3/__https://autobuilder.yoctoproject.org/valkyrie/api/v2/log=
s/5867436/raw_inline__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gU=
YGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JbynqUhHw$" moz-do-not-send=3D"t=
rue">https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867436/ra=
w_inline</a></div>
      </div>
    </blockquote>
    <p>V3 has sent to fix this.</p>
    <p>//Changqing</p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sr-wqHNeh5Qxv8hUWE7nOajcR=
Xuiyn54CFkUWYTLF150w@mail.gmail.com">
      <div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 17, 2026 at
            2:31=E2=80=AFAM Changqing Li via
            <a href=3D"https://urldefense.com/v3/__http://lists.openembed=
ded.org__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwg=
KCnWjFUrDjJw65Kupu8DEeN5lIJ9JYxIgSibw$" moz-do-not-send=3D"true">
              lists.openembedded.org</a> &lt;<a href=3D"https://urldefens=
e.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCA=
opwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9Jb_joH5vA$" moz-do-not=
-send=3D"true">changqing.li</a>=3D<a href=3D"mailto:windriver.com@lists.o=
penembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext"=
>windriver.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            Changes:<br>
            <a href=3D"https://urldefense.com/v3/__https://github.com/COV=
ESA/dlt-daemon/releases__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-=
3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JapAFWKQA$" rel=3D"noreferrer=
" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/COVESA/dl=
t-daemon/releases</a><br>
            <br>
            Remove patches already in 3.0.0:<br>
            544.patch<br>
            567.patch<br>
0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch<br>
            0003-allow-build-with-cmake-4.patch<br>
            <br>
            Add patches to fix build failures<br>
            0001-Fix-compile-failure-related-to-gzlog.patch<br>
            0001-Fix-kinds-of-build-failure.patch<br>
            0001-Fix-build-failures.patch<br>
            0001-fix-build-failure-when-systemd-is-enabled.patch<br>
            <br>
            Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.l=
i@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-=
txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;...e-DLT_WatchdogSec-can-be-set-by-user.patch |&nbsp; 4=
0 --<br>
            &nbsp;.../dlt-daemon/0001-Fix-build-failures.patch&nbsp; | 36=
0
            +++++++++++++++<br>
            &nbsp;...Fix-compile-failure-related-to-gzlog.patch |&nbsp; 6=
9 +++<br>
            &nbsp;.../0001-Fix-kinds-of-build-failure.patch&nbsp; &nbsp; =
&nbsp;| 174 +++++++<br>
            &nbsp;...uild-failure-when-systemd-is-enabled.patch | 423
            ++++++++++++++++++<br>
            &nbsp;.../0003-allow-build-with-cmake-4.patch&nbsp; &nbsp; &n=
bsp; &nbsp;|&nbsp; 99 ----<br>
            &nbsp;.../dlt-daemon/dlt-daemon/544.patch&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;|&nbsp; 80 ----<br>
            &nbsp;.../dlt-daemon/dlt-daemon/567.patch&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;|&nbsp; 36 --<br>
            &nbsp;...-<a href=3D"https://urldefense.com/v3/__http://daemo=
n_2.18.10.bb__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG=
2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JaIo2DZSQ$" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">daemon_2.18.10.bb</a>
            =3D&gt;
            <a href=3D"https://urldefense.com/v3/__http://dlt-daemon_3.0.=
0.bb__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCn=
WjFUrDjJw65Kupu8DEeN5lIJ9JadOXRLnA$" rel=3D"noreferrer" target=3D"_blank"=
 moz-do-not-send=3D"true">
              dlt-daemon_3.0.0.bb</a>} |&nbsp; 11 +-<br>
            &nbsp;9 files changed, 1032 insertions(+), 260 deletions(-)<b=
r>
            &nbsp;delete mode 100644
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-D=
LT_WatchdogSec-can-be-set-by-user.patch<br>
            &nbsp;create mode 100644
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failures.pa=
tch<br>
            &nbsp;create mode 100644
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failure-r=
elated-to-gzlog.patch<br>
            &nbsp;create mode 100644
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-fa=
ilure.patch<br>
            &nbsp;create mode 100644
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure-whe=
n-systemd-is-enabled.patch<br>
            &nbsp;delete mode 100644
meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cmak=
e-4.patch<br>
            &nbsp;delete mode 100644
            meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch<br>
            &nbsp;delete mode 100644
            meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch<br>
            &nbsp;rename meta-oe/recipes-extended/dlt-daemon/{<a href=3D"=
https://urldefense.com/v3/__http://dlt-daemon_2.18.10.bb__;!!AjveYdw8EvQ!=
fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5=
lIJ9JYcHKxqHg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">dlt-daemon_2.18.10.bb</a>
            =3D&gt; <a href=3D"https://urldefense.com/v3/__http://dlt-dae=
mon_3.0.0.bb__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG=
2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JadOXRLnA$" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">
              dlt-daemon_3.0.0.bb</a>} (90%)<br>
            <br>
            diff --git
a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make=
-DLT_WatchdogSec-can-be-set-by-user.patch
b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make=
-DLT_WatchdogSec-can-be-set-by-user.patch<br>
            deleted file mode 100644<br>
            index 335872c40f..0000000000<br>
            ---
a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make=
-DLT_WatchdogSec-can-be-set-by-user.patch<br>
            +++ /dev/null<br>
            @@ -1,40 +0,0 @@<br>
            -From bc03f142507da92add8ba325fdf8187d47a7d719 Mon Sep 17
            00:00:00 2001<br>
            -From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windri=
ver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">changqing.li@windriver.com</a>&gt;<br>
            -Date: Fri, 13 Dec 2024 16:37:24 +0800<br>
            -Subject: [PATCH] CMakeLists.txt: make DLT_WatchdogSec can
            be set by user<br>
            -<br>
            -In my test env, WatchdogSec default value 2 is not enough,
            manually<br>
            -changed to 3 is ok. This makes
            dlt.service/dlt-system.service start<br>
            -failed during boot time. So, make DLT_WatchdogSec can be
            set by user, so<br>
            -user can set them to proper value at build time, then
            service can start<br>
            -successfully in boot time.<br>
            -<br>
            -Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            -<br>
            -Upstream-Status: Backport [<a href=3D"https://urldefense.com=
/v3/__https://github.com/COVESA/dlt-daemon/pull/720/commits/bc03f142507da=
92add8ba325fdf8187d47a7d719__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopw=
ZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JajNR9qLg$" rel=3D"norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/COVES=
A/dlt-daemon/pull/720/commits/bc03f142507da92add8ba325fdf8187d47a7d719</a=
>]<br>
            -<br>
            -Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            ----<br>
            - systemd/CMakeLists.txt | 8 ++++++--<br>
            - 1 file changed, 6 insertions(+), 2 deletions(-)<br>
            -<br>
            -diff --git a/systemd/CMakeLists.txt
            b/systemd/CMakeLists.txt<br>
            -index 16cbe86b5..659378d16 100644<br>
            ---- a/systemd/CMakeLists.txt<br>
            -+++ b/systemd/CMakeLists.txt<br>
            -@@ -18,10 +18,14 @@ if(WITH_SYSTEMD)<br>
            -&nbsp; &nbsp; &nbsp;set(SYSTEMD_CONFIGURATIONS_FILES_DIR
            ${SYSTEMD_UNITDIR} )<br>
            - <br>
            -&nbsp; &nbsp; &nbsp;if(WITH_SYSTEMD_WATCHDOG)<br>
            --&nbsp; &nbsp; &nbsp; &nbsp; set( DLT_WatchdogSec 2 )<br>
            -+&nbsp; &nbsp; &nbsp; &nbsp; if(NOT DEFINED DLT_WatchdogSec)=
<br>
            -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; set(DLT_WatchdogS=
ec 2 CACHE STRING &quot;Watchdog
            timeout in seconds&quot;)<br>
            -+&nbsp; &nbsp; &nbsp; &nbsp; endif()<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;message( STATUS &quot;The =
systemd watchdog is enabled -
            timeout is set to ${DLT_WatchdogSec} seconds&quot;)<br>
            -&nbsp; &nbsp; &nbsp;else(WITH_SYSTEMD_WATCHDOG)<br>
            --&nbsp; &nbsp; &nbsp; &nbsp; set( DLT_WatchdogSec 0 )<br>
            -+&nbsp; &nbsp; &nbsp; &nbsp; if(NOT DEFINED DLT_WatchdogSec)=
<br>
            -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;set(DLT_Wat=
chdogSec 0 CACHE STRING &quot;Watchdog
            timeout in seconds&quot;)<br>
            -+&nbsp; &nbsp; &nbsp; &nbsp; endif()<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;message( STATUS &quot;The =
systemd watchdog is
            disabled&quot;)<br>
            -&nbsp; &nbsp; &nbsp;endif(WITH_SYSTEMD_WATCHDOG)<br>
            diff --git
a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failures.=
patch
b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failures.=
patch<br>
            new file mode 100644<br>
            index 0000000000..6cfa3a5482<br>
            --- /dev/null<br>
            +++
b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failures.=
patch<br>
            @@ -0,0 +1,360 @@<br>
            +From 4813b72cfe82062db41dd1d8cfa7069634d78d9e Mon Sep 17
            00:00:00 2001<br>
            +From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windri=
ver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">changqing.li@windriver.com</a>&gt;<br>
            +Date: Mon, 16 Mar 2026 13:28:40 +0800<br>
            +Subject: [PATCH] Fix build failures<br>
            +<br>
            +Fix the following similar build failures, some of the build
            failure<br>
            +reproduced with arm64/riscv64, some of the build reproduced
            with 32bit<br>
            +x86/arm.<br>
            +<br>
            +dlt_daemon_common.c:2785:26: error: conversion to 'int8_t'
            {aka 'signed char'} from 'char' may change the sign of the
            result [-Werror=3Dsign-conversion]<br>
            +<br>
            +src/tests/dlt-test-multi-process-client-v2.c:302:49: error:
            format '%lld' expects argument of type 'long long int', but
            argument 2 has type 'time_t' {aka 'long int'}
            [-Werror=3Dformat=3D]<br>
            +&nbsp; 302 |&nbsp; &nbsp; &nbsp;printf(&quot; Time running (=
seconds)&nbsp; &nbsp; &nbsp; &nbsp; :
            %lld\n&quot;, time(NULL) - stats.first_message_time);<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ~~~^&nbsp;
            &nbsp; &nbsp;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;long long int&nbsp; &nbsp; time_t {aka long int}<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; %ld<br>
            +<br>
            +src/lib/dlt_user.c:5109:60: error: format '%lld' expects
            argument of type 'long long int', but argument 4 has type
            '__off_t' {aka 'long int'} [-Werror=3Dformat=3D]<br>
            + 5109 |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dlt_v=
log(LOG_DEBUG, &quot;%s: Current file
            size=3D[%lld]\n&quot;, __func__,<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp;~~~^<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; |<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; long long int<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp;%ld<br>
            + 5110 |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; st.st_size);<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ~~~~~~~~~~<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; __off_t {aka long int}<br>
            +<br>
            +Upstream-Status: Submitted [<a href=3D"https://urldefense.co=
m/v3/__https://github.com/COVESA/dlt-daemon/pull/827__;!!AjveYdw8EvQ!fmJm=
sXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9=
JY-xUIJDA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://github.com/COVESA/dlt-daemon/pull/827</a>]<br>
            +<br>
            +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            +---<br>
            + src/daemon/dlt-daemon.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 8 ++---<br>
            + src/daemon/dlt_daemon_client.c&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;| 32
            ++++++++++----------<br>
            + src/daemon/dlt_daemon_common.c&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 4 +--<br>
            + src/lib/dlt_user.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 18
            +++++------<br>
            + src/shared/dlt_common.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 2 +-<br>
            + src/shared/dlt_multiple_files.c&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; |&nbsp; 2 +-<br>
            + src/tests/dlt-test-multi-process-client-v2.c |&nbsp; 8 ++--=
-<br>
            + src/tests/dlt-test-multi-process-v2.c&nbsp; &nbsp; &nbsp; &=
nbsp; |&nbsp; 2 +-<br>
            + src/tests/dlt-test-multi-process.c&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;|&nbsp; 2 +-<br>
            + 9 files changed, 39 insertions(+), 39 deletions(-)<br>
            +<br>
            +diff --git a/src/daemon/dlt-daemon.c
            b/src/daemon/dlt-daemon.c<br>
            +index 523bf33..2ae5bc9 100644<br>
            +--- a/src/daemon/dlt-daemon.c<br>
            ++++ b/src/daemon/dlt-daemon.c<br>
            +@@ -457,7 +457,7 @@ int option_file_parser(DltDaemonLocal
            *daemon_local)<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (n &lt; 0 || (size_t)n &gt;
            sizeof(daemon_local-&gt;flags.loggingFilename)) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dlt_vlog(LOG_WARNING, &quo=
t;%s: snprintf
            truncation/error(%ld) %s\n&quot;,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; __f=
unc__, n,
            daemon_local-&gt;flags.loggingFilename);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; __f=
unc__, (long int)n,
            daemon_local-&gt;flags.loggingFilename);<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp;daemon_local-&gt;flags.enableLoggingFile=
Limit =3D false;<br>
            +&nbsp; &nbsp; &nbsp;daemon_local-&gt;flags.loggingFileSize =3D=
 250000;<br>
            +@@ -2501,7 +2501,7 @@ void dlt_daemon_exit_trigger()<br>
            +&nbsp; &nbsp; &nbsp;n =3D snprintf(tmp, DLT_PATH_MAX, &quot;=
%s/dlt&quot;,
            dltFifoBaseDir);<br>
            +&nbsp; &nbsp; &nbsp;if (n &lt; 0 || (size_t)n &gt; DLT_PATH_=
MAX) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dlt_vlog(LOG_WARNING, &quo=
t;%s: snprintf
            truncation/error(%ld) %s\n&quot;,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; __f=
unc__, n, tmp);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; __f=
unc__, (long int)n, tmp);<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;(void)unlink(tmp);<br>
            +@@ -2878,8 +2878,8 @@ int dlt_daemon_log_internal(DltDaemon
            *daemon, DltDaemonLocal *daemon_local,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dlt_daemon_client_send(DLT=
_DAEMON_SEND_TO_ALL,
            daemon,daemon_local,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.headerbuffer,
            sizeof(DltStorageHeader),<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.headerbuffer +
            sizeof(DltStorageHeader),<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (size_t)(msg.headersize -
            (int32_t)sizeof(DltStorageHeader)),<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; msg.databuffer,
            (size_t)msg.datasize, verbose);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (int)(msg.headersize -
            (int32_t)sizeof(DltStorageHeader)),<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; msg.databuffer,
            (int)msg.datasize, verbose);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;free(msg.databuffer);<br>
            +&nbsp; &nbsp; &nbsp;}else {<br>
            +diff --git a/src/daemon/dlt_daemon_client.c
            b/src/daemon/dlt_daemon_client.c<br>
            +index 50d8f19..20a512b 100644<br>
            +--- a/src/daemon/dlt_daemon_client.c<br>
            ++++ b/src/daemon/dlt_daemon_client.c<br>
            +@@ -551,8 +551,8 @@ int
            dlt_daemon_client_send_message_to_all_client(DltDaemon
            *daemon,<br>
            +&nbsp; &nbsp; &nbsp;return dlt_daemon_client_send(DLT_DAEMON=
_SEND_TO_ALL,
            daemon, daemon_local,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;daemon_local-&gt;msg.headerbuffer,
            sizeof(DltStorageHeader),<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;daemon_local-&gt;msg.headerbuffer +
            sizeof(DltStorageHeader),<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (si=
ze_t)(daemon_local-&gt;msg.headersize -
            (int32_t)sizeof(DltStorageHeader)),<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dae=
mon_local-&gt;msg.databuffer,
            (size_t)daemon_local-&gt;msg.datasize, verbose);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (in=
t)(daemon_local-&gt;msg.headersize -
            (int32_t)sizeof(DltStorageHeader)),<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dae=
mon_local-&gt;msg.databuffer,
            (int)daemon_local-&gt;msg.datasize, verbose);<br>
            + <br>
            + }<br>
            + <br>
            +@@ -771,8 +771,8 @@ int
            dlt_daemon_client_send_control_message(int sock,<br>
            +&nbsp; &nbsp; &nbsp;if ((ret =3D<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dlt_daemon_=
client_send(sock, daemon,
            daemon_local, msg-&gt;headerbuffer,
            sizeof(DltStorageHeader),<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;m=
sg-&gt;headerbuffer +
            sizeof(DltStorageHeader),<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            (size_t)(msg-&gt;headersize -
            (int32_t)sizeof(DltStorageHeader)),<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; msg-&g=
t;databuffer,
            (size_t)msg-&gt;datasize, verbose))) {<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            (int)(msg-&gt;headersize -
            (int32_t)sizeof(DltStorageHeader)),<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; msg-&g=
t;databuffer,
            (int)msg-&gt;datasize, verbose))) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dlt_log(LOG_DEBUG,
            &quot;dlt_daemon_control_send_control_message: DLT message se=
nd
            to all failed!.\n&quot;);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return ret;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            +@@ -1919,7 +1919,7 @@ void
            dlt_daemon_control_get_log_info(int sock,<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;/* Allocate buffer for response message =
*/<br>
            +&nbsp; &nbsp; &nbsp;resp.databuffer =3D (uint8_t
            *)malloc((size_t)resp.datasize);<br>
            +-&nbsp; &nbsp; resp.databuffersize =3D (size_t)resp.datasize=
;<br>
            ++&nbsp; &nbsp; resp.databuffersize =3D resp.datasize;<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (resp.databuffer =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dlt_daemon_control_service=
_response(sock,<br>
            +@@ -2572,7 +2572,7 @@ int
            dlt_daemon_control_message_buffer_overflow(int sock,<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.databuffer =3D (uint8_=
t
            *)malloc((size_t)msg.datasize);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D (size_t)=
msg.datasize;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D msg.data=
size;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0)<br>
            +@@ -2633,7 +2633,7 @@ int
            dlt_daemon_control_message_buffer_overflow_v2(int sock,<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.databuffer =3D (uint8_=
t
            *)malloc((size_t)msg.datasize);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D (size_t)=
msg.datasize;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D msg.data=
size;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0)<br>
            +@@ -2686,7 +2686,7 @@ void
            dlt_daemon_control_service_response(int sock,<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.databuffer =3D (uint8_=
t
            *)malloc((size_t)msg.datasize);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D (size_t)=
msg.datasize;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D msg.data=
size;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0)<br>
            +@@ -2732,7 +2732,7 @@ void
            dlt_daemon_control_service_response_v2(int sock,<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.databuffer =3D (uint8_=
t
            *)malloc((size_t)msg.datasize);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D (size_t)=
msg.datasize;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D msg.data=
size;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0)<br>
            +@@ -2779,7 +2779,7 @@ int
            dlt_daemon_control_message_unregister_context(int sock,<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.databuffer =3D (uint8_=
t
            *)malloc((size_t)msg.datasize);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D (size_t)=
msg.datasize;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D msg.data=
size;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0)<br>
            +@@ -2842,7 +2842,7 @@ int
            dlt_daemon_control_message_unregister_context_v2(int sock,<br=
>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.databuffer =3D (uint8_=
t
            *)malloc((size_t)msg.datasize);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D (size_t)=
msg.datasize;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D msg.data=
size;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0)<br>
            +@@ -2909,7 +2909,7 @@ int
            dlt_daemon_control_message_connection_info(int sock,<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.databuffer =3D (uint8_=
t
            *)malloc((size_t)msg.datasize);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D (size_t)=
msg.datasize;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D msg.data=
size;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0)<br>
            +@@ -2962,7 +2962,7 @@ int
            dlt_daemon_control_message_connection_info_v2(int sock,<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.databuffer =3D (uint8_=
t
            *)malloc((size_t)msg.datasize);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D (size_t)=
msg.datasize;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D msg.data=
size;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0)<br>
            +@@ -3010,7 +3010,7 @@ int
            dlt_daemon_control_message_timezone(int sock, DltDaemon
            *daemon, DltDaemonLo<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.databuffer =3D (uint8_=
t
            *)malloc((size_t)msg.datasize);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D (size_t)=
msg.datasize;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D msg.data=
size;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0)<br>
            +@@ -3072,7 +3072,7 @@ int
            dlt_daemon_control_message_timezone_v2(int sock, DltDaemon
            *daemon, DltDaemo<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.databuffer =3D (uint8_=
t
            *)malloc((size_t)msg.datasize);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D (size_t)=
msg.datasize;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D msg.data=
size;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0)<br>
            +@@ -3127,7 +3127,7 @@ int
            dlt_daemon_control_message_marker(int sock, DltDaemon
            *daemon, DltDaemonLoca<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg.databuffer =3D (uint8_=
t
            *)malloc((size_t)msg.datasize);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D (size_t)=
msg.datasize;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; msg.databuffersize =3D msg.data=
size;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (msg.databuffer =3D=3D 0)<br>
            +diff --git a/src/daemon/dlt_daemon_common.c
            b/src/daemon/dlt_daemon_common.c<br>
            +index 2f08c6a..65b264a 100644<br>
            +--- a/src/daemon/dlt_daemon_common.c<br>
            ++++ b/src/daemon/dlt_daemon_common.c<br>
            +@@ -2782,7 +2782,7 @@ int
            dlt_daemon_user_send_log_state(DltDaemon *daemon,
            DltDaemonApplication *app,<br>
            +&nbsp; &nbsp; &nbsp;if (dlt_user_set_userheader(&amp;userhea=
der,
            DLT_USER_MESSAGE_LOG_STATE) &lt; DLT_RETURN_OK)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>
            + <br>
            +-&nbsp; &nbsp; logstate.log_state =3D daemon-&gt;connectionS=
tate;<br>
            ++&nbsp; &nbsp; logstate.log_state =3D
            (int8_t)daemon-&gt;connectionState;<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;/* log to FIFO */<br>
            +&nbsp; &nbsp; &nbsp;ret =3D
            dlt_user_log_out2_with_timeout(app-&gt;user_handle,<br>
            +@@ -2811,7 +2811,7 @@ int
            dlt_daemon_user_send_log_state_v2(DltDaemon *daemon,
            DltDaemonApplication *a<br>
            +&nbsp; &nbsp; &nbsp;if (dlt_user_set_userheader_v2(&amp;user=
header,
            DLT_USER_MESSAGE_LOG_STATE) &lt; DLT_RETURN_OK)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>
            + <br>
            +-&nbsp; &nbsp; logstate.log_state =3D daemon-&gt;connectionS=
tate;<br>
            ++&nbsp; &nbsp; logstate.log_state =3D
            (int8_t)daemon-&gt;connectionState;<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;/* log to FIFO */<br>
            +&nbsp; &nbsp; &nbsp;ret =3D
            dlt_user_log_out2_with_timeout(app-&gt;user_handle,<br>
            +diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c<br>
            +index 6d0098d..e432e26 100644<br>
            +--- a/src/lib/dlt_user.c<br>
            ++++ b/src/lib/dlt_user.c<br>
            +@@ -5106,8 +5106,8 @@ DltReturnValue
            dlt_user_log_send_log(DltContextData *log, const int mtype,
            int *<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;return DLT_RETURN_ERROR;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dlt_vlog(LOG_DEBU=
G, &quot;%s: Current file
            size=3D[%ld]\n&quot;, __func__,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;st.st_size);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dlt_vlog(LOG_DEBU=
G, &quot;%s: Current file
            size=3D[%lld]\n&quot;, __func__,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;(long long int)st.st_size);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Check fil=
esize */<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Return er=
ror if the file size has reached
            to maximum */<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int=
 msg_size =3D (unsigned
            int)st.st_size + (unsigned int)msg.headersize +<br>
            +@@ -5115,8 +5115,8 @@ DltReturnValue
            dlt_user_log_send_log(DltContextData *log, const int mtype,
            int *<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (msg_size=
 &gt; dlt_user.filesize_max) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;dlt_user_file_reach_max =3D true;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;dlt_vlog(LOG_ERR,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;%s: File size (%ld bytes)
            reached to defined maximum size (%d bytes)\n&quot;,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;__func__, st.st_size,
            dlt_user.filesize_max);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;%s: File size (%lld bytes)
            reached to defined maximum size (%d bytes)\n&quot;,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;__func__, (long long
            int)st.st_size, dlt_user.filesize_max);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;dlt_mutex_unlock();<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;return DLT_RETURN_FILESZERR;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +@@ -5612,21 +5612,21 @@ DltReturnValue
            dlt_user_log_send_log_v2(DltContextData *log, const int
            mtype, Dl<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;return DLT_RETURN_ERROR;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dlt_vlog(LOG_DEBU=
G, &quot;%s: Current file
            size=3D[%ld]\n&quot;, __func__,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;st.st_size);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dlt_vlog(LOG_DEBU=
G, &quot;%s: Current file
            size=3D[%lld]\n&quot;, __func__,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;(long long int)st.st_size);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Check fil=
esize */<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Return er=
ror if the file size has reached
            to maximum */<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int=
 msg_size =3D 0;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (st.st_si=
ze &lt; 0 || st.st_size &gt;
            UINT_MAX) {<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dlt=
_vlog(LOG_ERR, &quot;%s: File size (%ld
            bytes) is invalid or too large for unsigned int\n&quot;,
            __func__, st.st_size);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dlt=
_vlog(LOG_ERR, &quot;%s: File size (%lld
            bytes) is invalid or too large for unsigned int\n&quot;,
            __func__, (long long int)st.st_size);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;return DLT_RETURN_FILESZERR;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msg_size =3D=
 (unsigned int)st.st_size +
            (unsigned int) msg.headersizev2 + (unsigned int)
            log-&gt;size;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (msg_size=
 &gt; dlt_user.filesize_max) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;dlt_user_file_reach_max =3D true;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;dlt_vlog(LOG_ERR,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;%s: File size (%ld bytes)
            reached to defined maximum size (%d bytes)\n&quot;,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;__func__, st.st_size,
            dlt_user.filesize_max);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;%s: File size (%lld bytes)
            reached to defined maximum size (%d bytes)\n&quot;,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;__func__, (long long
            int)st.st_size, dlt_user.filesize_max);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;return DLT_RETURN_FILESZERR;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else {<br>
            +diff --git a/src/shared/dlt_common.c
            b/src/shared/dlt_common.c<br>
            +index 6ad354b..aa0aaaa 100644<br>
            +--- a/src/shared/dlt_common.c<br>
            ++++ b/src/shared/dlt_common.c<br>
            +@@ -1220,7 +1220,7 @@ DltReturnValue
            dlt_message_header_flags_v2(DltMessageV2 *msg, char *text,
            size_t<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (int i =3D=
 0; i&lt;5; ++i){<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;tt =3D (tt &lt;&lt; 8) |
            msg-&gt;headerextrav2.seconds[i];<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; snprintf(text + s=
trlen(text), textlength -
            strlen(text), &quot;%ld.%.9u &quot;, tt,
            msg-&gt;headerextrav2.nanoseconds);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; snprintf(text + s=
trlen(text), textlength -
            strlen(text), &quot;%lld.%.9u &quot;, (long long int)tt,
            msg-&gt;headerextrav2.nanoseconds);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;snprintf(tex=
t + strlen(text), textlength -
            strlen(text), &quot;---------- &quot;);<br>
            +diff --git a/src/shared/dlt_multiple_files.c
            b/src/shared/dlt_multiple_files.c<br>
            +index c4019e5..65529ff 100644<br>
            +--- a/src/shared/dlt_multiple_files.c<br>
            ++++ b/src/shared/dlt_multiple_files.c<br>
            +@@ -257,7 +257,7 @@ ssize_t
            multiple_files_buffer_get_total_size(const
            MultipleFilesRingBuffer *file<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (((unsign=
ed int)res &lt; sizeof(filename))
            &amp;&amp; (res &gt; 0)) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;errno =3D 0;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;if (0 =3D=3D stat(filename, &amp;status))<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; size +=3D status.st_size;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; size +=3D (ssize_t)status.st_size;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;else<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;fprintf(stderr, &quot;file %s cannot be
            stat-ed, error=3D%s\n&quot;, filename, strerror(errno));<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +diff --git a/src/tests/dlt-test-multi-process-client-v2.c
            b/src/tests/dlt-test-multi-process-client-v2.c<br>
            +index 2bb1158..ec99720 100644<br>
            +--- a/src/tests/dlt-test-multi-process-client-v2.c<br>
            ++++ b/src/tests/dlt-test-multi-process-client-v2.c<br>
            +@@ -299,10 +299,10 @@ void print_stats(s_statistics stats,
            s_parameters params)<br>
            +&nbsp; &nbsp; &nbsp;printf(&quot; Messages received&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: %d\n&quot;,
            stats.messages_received);<br>
            +&nbsp; &nbsp; &nbsp;printf(&quot; Broken messages received&n=
bsp; &nbsp; &nbsp; : %d\n&quot;,
            stats.broken_messages_received);<br>
            +&nbsp; &nbsp; &nbsp;printf(&quot; Bytes received&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : %d\n&quot;,
            stats.bytes_received);<br>
            +-&nbsp; &nbsp; printf(&quot; Time running (seconds)&nbsp; &n=
bsp; &nbsp; &nbsp; : %ld\n&quot;,
            time(NULL) - stats.first_message_time);<br>
            +-&nbsp; &nbsp; printf(&quot; Throughput (msgs/sec)/(B/sec) :=
 %ld/%ld\n&quot;,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stats.messages_rec=
eived / ((time(NULL) -
            stats.first_message_time) + 1),<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(stats.bytes_recei=
ved) / ((time(NULL) -
            stats.first_message_time) + 1));<br>
            ++&nbsp; &nbsp; printf(&quot; Time running (seconds)&nbsp; &n=
bsp; &nbsp; &nbsp; : %lld\n&quot;,
            (long long int)(time(NULL) - stats.first_message_time));<br>
            ++&nbsp; &nbsp; printf(&quot; Throughput (msgs/sec)/(B/sec) :=
 %lld/%lld\n&quot;,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(long long int)(st=
ats.messages_received /
            ((time(NULL) - stats.first_message_time) + 1)),<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(long long int)((s=
tats.bytes_received) /
            ((time(NULL) - stats.first_message_time) + 1)));<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (params.messages_left =3D=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (stats.broken_messages_=
received =3D=3D 0)<br>
            +diff --git a/src/tests/dlt-test-multi-process-v2.c
            b/src/tests/dlt-test-multi-process-v2.c<br>
            +index 44a8622..1d3a54a 100644<br>
            +--- a/src/tests/dlt-test-multi-process-v2.c<br>
            ++++ b/src/tests/dlt-test-multi-process-v2.c<br>
            +@@ -393,7 +393,7 @@ void *do_logging(void *arg)<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sleep_time =3D mksleep_tim=
e(data-&gt;params.delay,
            data-&gt;params.delay_fudge);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ts.tv_sec =3D sleep_time /=
 1000000000;<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; ts.tv_nsec =3D sleep_time % 100=
0000000;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; ts.tv_nsec =3D (long int)(sleep=
_time % 1000000000);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;nanosleep(&amp;ts, NULL);<=
br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +diff --git a/src/tests/dlt-test-multi-process.c
            b/src/tests/dlt-test-multi-process.c<br>
            +index 016c8b4..00fb11c 100644<br>
            +--- a/src/tests/dlt-test-multi-process.c<br>
            ++++ b/src/tests/dlt-test-multi-process.c<br>
            +@@ -370,7 +370,7 @@ void *do_logging(void *arg)<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sleep_time =3D mksleep_tim=
e(data-&gt;params.delay,
            data-&gt;params.delay_fudge);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ts.tv_sec =3D sleep_time /=
 1000000000;<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; ts.tv_nsec =3D sleep_time % 100=
0000000;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; ts.tv_nsec =3D (long int)(sleep=
_time % 1000000000);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;nanosleep(&amp;ts, NULL);<=
br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +-- <br>
            +2.34.1<br>
            +<br>
            diff --git
a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failure=
-related-to-gzlog.patch
b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failure=
-related-to-gzlog.patch<br>
            new file mode 100644<br>
            index 0000000000..f9692d9f4d<br>
            --- /dev/null<br>
            +++
b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-failure=
-related-to-gzlog.patch<br>
            @@ -0,0 +1,69 @@<br>
            +From bee9bce043c72de1d27a4251333ace9fe66bcc74 Mon Sep 17
            00:00:00 2001<br>
            +From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windri=
ver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">changqing.li@windriver.com</a>&gt;<br>
            +Date: Thu, 12 Mar 2026 19:37:11 +0800<br>
            +Subject: [PATCH] Fix compile failure related to gzlog<br>
            +MIME-Version: 1.0<br>
            +Content-Type: text/plain; charset=3DUTF-8<br>
            +Content-Transfer-Encoding: 8bit<br>
            +<br>
            +* In commit [1], gzlog is changed from gzFile to gzFile*,
            this cause<br>
            +&nbsp; failure:<br>
+/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:88:21:
            error: passing argument 1 of =E2=80=98gzclose=E2=80=99 from i=
ncompatible
            pointer type [-Werror=3Dincompatible-pointer-types]<br>
            +&nbsp; &nbsp;88 |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gzclose(d=
ata-&gt;gzlog);<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;~~~~^~~~~~~<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct gzFile_s **<br>
            +compilation terminated due to -Wfatal-errors.<br>
            +<br>
            +so change gzlog back to gzFile, so that all the gzxxx
            function can work<br>
            +well.<br>
            +<br>
            +* Change to gzFile causes the following failure, since
            fileno need<br>
            +&nbsp; FILE*, according to code &quot;config-&gt;gzlog =3D
            gzdopen(config-&gt;fd, mode)&quot;,<br>
            +&nbsp; seems we don't need to use fileno, just use config-&g=
t;fd
            is ok.<br>
+/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage_behavior.c:1133=
:48:
            error: passing argument 1 of =E2=80=98fileno=E2=80=99 from in=
compatible
            pointer type [-Werror=3Dincompatible-pointer-types]<br>
            + 1133 |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
            (fsync(fileno(config-&gt;gzlog)) !=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            ~~~~~~^~~~~~~<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            gzFile {aka struct gzFile_s *}<br>
            +compilation terminated due to -Wfatal-errors.<br>
            +<br>
            +[1] <a href=3D"https://urldefense.com/v3/__https://github.co=
m/COVESA/dlt-daemon/commit/543087ba98c103dc576edadeccf614c9dab1b9b3__;!!A=
jveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw6=
5Kupu8DEeN5lIJ9JaBrNNzaA$" rel=3D"noreferrer" target=3D"_blank" moz-do-no=
t-send=3D"true">
https://github.com/COVESA/dlt-daemon/commit/543087ba98c103dc576edadeccf61=
4c9dab1b9b3</a><br>
            +<br>
            +Upstream-Status: Submitted [<a href=3D"https://urldefense.co=
m/v3/__https://github.com/COVESA/dlt-daemon/pull/826__;!!AjveYdw8EvQ!fmJm=
sXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9=
JZO3RdJBQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://github.com/COVESA/dlt-daemon/pull/826</a>]<br>
            +<br>
            +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            +---<br>
            + src/offlinelogstorage/dlt_offline_logstorage.h&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; |
            2 +-<br>
            + src/offlinelogstorage/dlt_offline_logstorage_behavior.c |
            2 +-<br>
            + 2 files changed, 2 insertions(+), 2 deletions(-)<br>
            +<br>
            +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h
            b/src/offlinelogstorage/dlt_offline_logstorage.h<br>
            +index fe38687..09ea5ce 100644<br>
            +--- a/src/offlinelogstorage/dlt_offline_logstorage.h<br>
            ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h<br>
            +@@ -217,7 +217,7 @@ struct DltLogStorageFilterConfig<br>
            +&nbsp; &nbsp; &nbsp;FILE *log;&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* current open log
            file */<br>
            +&nbsp; &nbsp; &nbsp;int fd;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* The file desc=
riptor
            for the active log file */<br>
            + #ifdef DLT_LOGSTORAGE_USE_GZIP<br>
            +-&nbsp; &nbsp; gzFile *gzlog;&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; /* current open gz log
            file */<br>
            ++&nbsp; &nbsp; gzFile gzlog;&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* current open gz log
            file */<br>
            + #endif<br>
            +&nbsp; &nbsp; &nbsp;void *cache;&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* log data cache */<br>
            +&nbsp; &nbsp; &nbsp;unsigned int specific_size;&nbsp; &nbsp;=
 &nbsp;/* cache size used for
            specific_size sync strategy */<br>
            +diff --git
            a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
            b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
            +index f17fbb2..ff09c9e 100644<br>
            +---
            a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
            ++++
            b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
            +@@ -1130,7 +1130,7 @@ int
            dlt_logstorage_prepare_on_msg(DltLogStorageFilterConfig
            *config,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;(config-&gt;sync =3D=3D
            DLT_LOGSTORAGE_SYNC_UNSET)) {<br>
            + #ifdef DLT_LOGSTORAGE_USE_GZIP<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;if (config-&gt;gzip_compression =3D=3D
            DLT_LOGSTORAGE_GZIP_ON) {<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; if
            (fsync(fileno(config-&gt;gzlog)) !=3D 0) {<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; if (fsync(config-&gt;fd) !=3D 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (errno !=3D ENOSYS) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dlt_vlog(LOG_ER=
R, &quot;%s:
            failed to sync gzip log file\n&quot;, __func__);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +-- <br>
            +2.34.1<br>
            +<br>
            diff --git
a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-=
failure.patch
b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-=
failure.patch<br>
            new file mode 100644<br>
            index 0000000000..403d1089e2<br>
            --- /dev/null<br>
            +++
b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-build-=
failure.patch<br>
            @@ -0,0 +1,174 @@<br>
            +From 3d713358fe19ce02e7c580d26222ec2386c94bc9 Mon Sep 17
            00:00:00 2001<br>
            +From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windri=
ver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">changqing.li@windriver.com</a>&gt;<br>
            +Date: Thu, 12 Mar 2026 20:06:34 +0800<br>
            +Subject: [PATCH] Fix kinds of build failure<br>
            +MIME-Version: 1.0<br>
            +Content-Type: text/plain; charset=3DUTF-8<br>
            +Content-Transfer-Encoding: 8bit<br>
            +<br>
            +Fix kinds of build failures caused by
            -Werror=3Dsign-conversion,<br>
            +-Werror=3Dcast-qual, -Werror=3Dconversion etc.<br>
            +Eg:<br>
            +src/offlinelogstorage/dlt_offline_logstorage.h:129:49:
            error: unsigned conversion from =E2=80=98int=E2=80=99 to =E2=80=
=98unsigned int=E2=80=99
            changes value from =E2=80=98-1=E2=80=99 to =E2=80=98429496729=
5=E2=80=99
            [-Werror=3Dsign-conversion]<br>
            +&nbsp; 129 | #define DLT_LOGSTORAGE_GZIP_ERROR&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-1
            /* error case */<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^<br>
+/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:1303:36:
            note: in expansion of macro =E2=80=98DLT_LOGSTORAGE_GZIP_ERRO=
R=E2=80=99<br>
            + 1303 |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;config-&gt;gzip_com=
pression =3D
            DLT_LOGSTORAGE_GZIP_ERROR;<br>
            +<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;
            ^~~~~~~~~~~~~~~~~~~~~~~~~<br>
            +<br>
+src/offlinelogstorage/dlt_offline_logstorage_behavior.c:851:16: error:
            conversion from =E2=80=98z_size_t=E2=80=99 {aka =E2=80=98long=
 unsigned int=E2=80=99} to
            =E2=80=98int=E2=80=99 may change value [-Werror=3Dconversion]=
<br>
            +&nbsp; 851 |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return gzfwrit=
e(ptr, size, nmemb,
            config-&gt;gzlog);<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
            +<br>
            +src/console/dlt-control-common.c:922:25: error: cast
            discards 'const' qualifier from pointer target type
            [-Werror=3Dcast-qual]<br>
            +&nbsp; 922 |&nbsp; &nbsp; &nbsp;json_object_to_file((char*)f=
ilename,
            json_filter_obj);<br>
            +&nbsp; &nbsp; &nbsp; |<br>
            +<br>
            +Use explicit type conversion to make the build can pass<br>
            +<br>
            +Upstream-Status: Submitted [<a href=3D"https://urldefense.co=
m/v3/__https://github.com/COVESA/dlt-daemon/pull/826__;!!AjveYdw8EvQ!fmJm=
sXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9=
JZO3RdJBQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://github.com/COVESA/dlt-daemon/pull/826</a>]<br>
            +<br>
            +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            +---<br>
            + src/console/dlt-control-common.c&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp;
            2 +-<br>
            + src/daemon/dlt-daemon.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; |&nbsp;
            4 ++--<br>
            + src/daemon/udp_connection/dlt_daemon_udp_socket.c&nbsp; &nb=
sp; &nbsp; |
            10 +++++-----<br>
            + src/examples/dlt-example-multicast-clientmsg-view.c&nbsp; &=
nbsp; |&nbsp;
            8 ++++----<br>
            + src/offlinelogstorage/dlt_offline_logstorage.h&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;|&nbsp;
            2 +-<br>
            + .../dlt_offline_logstorage_behavior.c&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp;
            4 ++--<br>
            + 6 files changed, 15 insertions(+), 15 deletions(-)<br>
            +<br>
            +diff --git a/src/console/dlt-control-common.c
            b/src/console/dlt-control-common.c<br>
            +index 2aeea280..4f9e95b4 100644<br>
            +--- a/src/console/dlt-control-common.c<br>
            ++++ b/src/console/dlt-control-common.c<br>
            +@@ -919,7 +919,7 @@ DltReturnValue
            dlt_json_filter_save(DltFilter *filter, const char
            *filename, int<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;printf(&quot;Saving current filter into =
'%s'\n&quot;, filename);<br>
            +-&nbsp; &nbsp; json_object_to_file((char*)filename, json_fil=
ter_obj);<br>
            ++&nbsp; &nbsp; json_object_to_file(filename, json_filter_obj=
);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;return DLT_RETURN_OK;<br>
            + }<br>
            +diff --git a/src/daemon/dlt-daemon.c
            b/src/daemon/dlt-daemon.c<br>
            +index 97af1cd9..94024eb4 100644<br>
            +--- a/src/daemon/dlt-daemon.c<br>
            ++++ b/src/daemon/dlt-daemon.c<br>
            +@@ -867,7 +867,7 @@ int option_file_parser(DltDaemonLocal
            *daemon_local)<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;if ((longval =3D=3D
            MULTICAST_CONNECTION_DISABLED)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|| (longval =3D=3D
            MULTICAST_CONNECTION_ENABLED)) {<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            daemon_local-&gt;UDPConnectionSetup =3D longval;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            daemon_local-&gt;UDPConnectionSetup =3D (int)longval;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printf(&quot;Option: %s=3D%s\=
n&quot;,
            token, value);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;else {<br>
            +@@ -884,7 +884,7 @@ int option_file_parser(DltDaemonLocal
            *daemon_local)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;else if (strcmp(token,
            &quot;UDPMulticastIPPort&quot;) =3D=3D 0)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;{<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;
            daemon_local-&gt;UDPMulticastIPPort =3D strtol(value, NULL,
            10);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;
            daemon_local-&gt;UDPMulticastIPPort =3D (int)strtol(value,
            NULL, 10);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;}<br>
            + #endif<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;else if (strcmp(token, &quot;BindAddress&quot;)
            =3D=3D 0)<br>
            +diff --git
            a/src/daemon/udp_connection/dlt_daemon_udp_socket.c
            b/src/daemon/udp_connection/dlt_daemon_udp_socket.c<br>
            +index 4c40cda8..b3408773 100644<br>
            +--- a/src/daemon/udp_connection/dlt_daemon_udp_socket.c<br>
            ++++ b/src/daemon/udp_connection/dlt_daemon_udp_socket.c<br>
            +@@ -66,7 +66,7 @@ void
            dlt_daemon_udp_setmulticast_addr(DltDaemonLocal
            *daemon_local)<br>
            +&nbsp; &nbsp; &nbsp;struct sockaddr_in clientaddr;<br>
            +&nbsp; &nbsp; &nbsp;clientaddr.sin_family =3D AF_INET;<br>
            +&nbsp; &nbsp; &nbsp;inet_pton(AF_INET,
            daemon_local-&gt;UDPMulticastIPAddress,
            &amp;clientaddr.sin_addr);<br>
            +-&nbsp; &nbsp; clientaddr.sin_port =3D
            htons(daemon_local-&gt;UDPMulticastIPPort);<br>
            ++&nbsp; &nbsp; clientaddr.sin_port =3D
            htons((uint16_t)daemon_local-&gt;UDPMulticastIPPort);<br>
            +&nbsp; &nbsp; &nbsp;memcpy(&amp;g_udpmulticast_addr.clientad=
dr,
            &amp;clientaddr, sizeof(struct sockaddr_in));<br>
            +&nbsp; &nbsp; &nbsp;g_udpmulticast_addr.clientaddr_size =3D
            sizeof(g_udpmulticast_addr.clientaddr);<br>
            +&nbsp; &nbsp; &nbsp;g_udpmulticast_addr.isvalidflag =3D ADDR=
ESS_VALID;<br>
            +@@ -224,17 +224,17 @@ void
            dlt_daemon_udp_clientmsg_send(DltDaemonClientSockInfo
            *clientinfo,<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if ((clientinfo-&gt;isvalidflag =3D=3D A=
DDRESS_VALID)
            &amp;&amp;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(size1 &gt; 0) &amp;&amp; =
(size2 &gt; 0)) {<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; void *data =3D (void *)calloc(s=
ize1 + size2,
            sizeof(char));<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; void *data =3D (void *)calloc((=
size_t)(size1 +
            size2), sizeof(char));<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (data =3D=3D NULL) {<br=
>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dlt_vlog(LOG=
_ERR, &quot;%s: calloc failure\n&quot;,
            __func__);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; memcpy(data, data1, size1);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; memcpy(data + size1, data2, siz=
e2);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; memcpy(data, data1, (size_t)siz=
e1);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; memcpy((int*)data + size1, data=
2, (size_t)size2);<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; if (sendto(g_udp_sock_fd, data,=
 size1 + size2, 0,
            (struct sockaddr *)&amp;clientinfo-&gt;clientaddr,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; if (sendto(g_udp_sock_fd, data,=
 (size_t)(size1 +
            size2), 0, (struct sockaddr
            *)&amp;clientinfo-&gt;clientaddr,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; clientinfo-&gt;clientaddr_size) &lt; 0)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dlt_vlog(LOG=
_ERR, &quot;%s: Send UDP Packet Data
            failed\n&quot;, __func__);<br>
            + <br>
            +diff --git
            a/src/examples/dlt-example-multicast-clientmsg-view.c
            b/src/examples/dlt-example-multicast-clientmsg-view.c<br>
            +index c00537e5..f8920453 100644<br>
            +--- a/src/examples/dlt-example-multicast-clientmsg-view.c<br=
>
            ++++ b/src/examples/dlt-example-multicast-clientmsg-view.c<br=
>
            +@@ -74,9 +74,9 @@ int
            dlt_receiver_receive_socket_udp(struct clientinfostruct
            *clientinfo, DltRece<br>
            +&nbsp; &nbsp; &nbsp;/* wait for data from socket */<br>
            +&nbsp; &nbsp; &nbsp;unsigned int addrlen =3D sizeof(clientin=
fo-&gt;addr);<br>
            + <br>
            +-&nbsp; &nbsp; if ((receiver-&gt;bytesRcvd =3D
            recvfrom(clientinfo-&gt;fd,<br>
            ++&nbsp; &nbsp; if ((receiver-&gt;bytesRcvd =3D
            (int32_t)recvfrom(clientinfo-&gt;fd,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;receiver-&gt;buf +
            receiver-&gt;lastBytesRcvd,<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
            receiver-&gt;buffersize - receiver-&gt;lastBytesRcvd,<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
            (size_t)(receiver-&gt;buffersize -
            receiver-&gt;lastBytesRcvd),<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;0,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;(struct sockaddr
            *)&amp;(clientinfo-&gt;addr), &amp;addrlen))<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;=3D 0) {<br>
            +@@ -177,11 +177,11 @@ int main()<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dlt_receiver_receive_socke=
t_udp(&amp;clientinfo,
            &amp;(clientinfo.receiver));<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;while (dlt_message_read(&a=
mp;msg, (unsigned char
            *)(clientinfo.receiver.buf),<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            clientinfo.receiver.bytesRcvd, 0, 0) =3D=3D
            DLT_MESSAGE_ERROR_OK) {<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (unsigned
            int)clientinfo.receiver.bytesRcvd, 0, 0) =3D=3D
            DLT_MESSAGE_ERROR_OK) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dlt_receive_=
message_callback_udp(&amp;msg);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
            (dlt_receiver_remove(&amp;(clientinfo.receiver),<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; msg.he=
adersize +
            msg.datasize - sizeof(DltStorageHeader))<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; msg.he=
adersize +
            msg.datasize - ((int32_t)(sizeof(DltStorageHeader))))<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;=3D=3D DLT_RETURN_ERROR) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;/* Return value ignored */<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;dlt_message_free(&amp;msg, 0);<br>
            +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h
            b/src/offlinelogstorage/dlt_offline_logstorage.h<br>
            +index 09ea5ce4..cfb70f33 100644<br>
            +--- a/src/offlinelogstorage/dlt_offline_logstorage.h<br>
            ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h<br>
            +@@ -192,7 +192,7 @@ struct DltLogStorageFilterConfig<br>
            +&nbsp; &nbsp; &nbsp;int overwrite;&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* Overwrite strategy
            */<br>
            +&nbsp; &nbsp; &nbsp;int skip;&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* Flag to skip file
            logging if DISCARD_NEW */<br>
            +&nbsp; &nbsp; &nbsp;char *ecuid;&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* ECU identifier */<br>
            +-&nbsp; &nbsp; unsigned int gzip_compression;&nbsp; /* Toggl=
e if log files
            should be gzip compressed */<br>
            ++&nbsp; &nbsp; int gzip_compression;&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;/* Toggle if log files
            should be gzip compressed */<br>
            +&nbsp; &nbsp; &nbsp;/* callback function for filter configur=
ations */<br>
            +&nbsp; &nbsp; &nbsp;int
            (*dlt_logstorage_prepare)(DltLogStorageFilterConfig *config,<=
br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DltLogSt=
orageUserConfig
            *file_config,<br>
            +diff --git
            a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
            b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
            +index ff09c9eb..ae8f4442 100644<br>
            +---
            a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
            ++++
            b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c<br>
            +@@ -848,10 +848,10 @@ DLT_STATIC int
            dlt_logstorage_write_to_log(void *ptr, size_t size, size_t
            nmemb,<br>
            + {<br>
            + #ifdef DLT_LOGSTORAGE_USE_GZIP<br>
            +&nbsp; &nbsp; &nbsp;if (config-&gt;gzip_compression =3D=3D
            DLT_LOGSTORAGE_GZIP_ON) {<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; return gzfwrite(ptr, size, nmem=
b,
            config-&gt;gzlog);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; return (int)gzfwrite(ptr, size,=
 nmemb,
            config-&gt;gzlog);<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp;else {<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; return fwrite(ptr, size, nmemb,=
 config-&gt;log);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; return (int)fwrite(ptr, size, n=
memb,
            config-&gt;log);<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + #else<br>
            +&nbsp; &nbsp; &nbsp;return (int)fwrite(ptr, size, nmemb, con=
fig-&gt;log);<br>
            +-- <br>
            +2.34.1<br>
            +<br>
            diff --git
a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure-w=
hen-systemd-is-enabled.patch
b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure-w=
hen-systemd-is-enabled.patch<br>
            new file mode 100644<br>
            index 0000000000..d19a23cd9c<br>
            --- /dev/null<br>
            +++
b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure-w=
hen-systemd-is-enabled.patch<br>
            @@ -0,0 +1,423 @@<br>
            +From 28322f951bb8510ddb4cf767426a67c81ce826ab Mon Sep 17
            00:00:00 2001<br>
            +From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windri=
ver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">changqing.li@windriver.com</a>&gt;<br>
            +Date: Tue, 17 Mar 2026 13:04:11 +0800<br>
            +Subject: [PATCH] fix build failure when systemd is enabled<b=
r>
            +<br>
            +Fix build failures when -DWITH_SYSTEMD=3DON,
            -DWITH_SYSTEMD_WATCHDOG=3DON,<br>
            +-DWITH_SYSTEMD_JOURNAL=3DON:<br>
            +Eg:<br>
            +src/system/dlt-system-syslog.c:91:39: error: conversion
            from 'int' to '__uint16_t' {aka 'short unsigned int'} may
            change value [-Werror=3Dconversion]<br>
            +&nbsp; &nbsp;91 |&nbsp; &nbsp; &nbsp;syslog_addr.sin6_port =3D=
 htons(opts.Port);<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;~~~~^~~~~<br>
            +<br>
            +src/system/dlt-system-logfile.c:74:21: error: conversion
            from 'size_t' {aka 'long unsigned int'} to 'int' may change
            value [-Werror=3Dconversion]<br>
            +&nbsp; &nbsp;74 |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;bytes =3D fread(buffer, 1, sizeof(buffer)
            - 1, pFile);<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~<br>
            +<br>
            +src/daemon/dlt-daemon.c:5513:14: error: unused variable
            'curr_time' [-Werror=3Dunused-variable]<br>
            + 5513 |&nbsp; &nbsp; &nbsp;uint32_t curr_time =3D 0U;<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; ^~~~~~~~~<br>
            +<br>
            +src/system/dlt-system-syslog.c:120:22: error: conversion
            from 'ssize_t' {aka 'long int'} to 'int' may change value
            [-Werror=3Dconversion]<br>
            +&nbsp; 120 |&nbsp; &nbsp; &nbsp;int bytes_read =3D recvfrom(=
sock, recv_data,
            RECV_BUF_SZ, 0,<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~~~~~~<br>
            +<br>
            +src/system/dlt-system-logfile.c:76:23: error: comparison of
            unsigned expression in '&gt;=3D 0' is always true
            [-Werror=3Dtype-limits]<br>
            +&nbsp; &nbsp;76 |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;if (bytes &gt;=3D 0)<br>
            +&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~<br>
            +<br>
            + src/system/dlt-system-filetransfer.c:727:56: error:
            '__builtin___snprintf_chk' output may be truncated before
            the last format cha&nbsp; &nbsp; racter [-Werror=3Dformat-tru=
ncation=3D]<br>
            + 10&nbsp; &nbsp;727 |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;snprintf(tosend,
            length, &quot;%s/%s&quot;, opts-&gt;Directory[j], ie-&gt;name=
);<br>
            +<br>
            +src/system/dlt-system-filetransfer.c:153: error:
            declaration of 'len' shadows a previous local
            [-Werror=3Dshadow]<br>
            +<br>
            +Upstream-Status: Submitted [<a href=3D"https://urldefense.co=
m/v3/__https://github.com/COVESA/dlt-daemon/pull/828__;!!AjveYdw8EvQ!fmJm=
sXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9=
JaNx5KJlQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://github.com/COVESA/dlt-daemon/pull/828</a>]<br>
            +<br>
            +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
            +---<br>
            + src/daemon/dlt-daemon.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 8 +----<br>
            + src/daemon/dlt_daemon_client.c&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;|&nbsp; 2 +-<br>
            + src/system/dlt-system-filetransfer.c&nbsp; &nbsp; &nbsp;| 4=
3
            +++++++++++++-----------<br>
            + src/system/dlt-system-journal.c&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; |&nbsp; 2 +-<br>
            + src/system/dlt-system-logfile.c&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; |&nbsp; 4 +--<br>
            + src/system/dlt-system-process-handling.c |&nbsp; 2 +-<br>
            + src/system/dlt-system-processes.c&nbsp; &nbsp; &nbsp; &nbsp=
; |&nbsp; 2 +-<br>
            + src/system/dlt-system-syslog.c&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;|&nbsp; 6 ++--<br>
            + src/system/dlt-system-watchdog.c&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;|&nbsp; 8 ++---<br>
            + systemd/3rdparty/sd-daemon.c&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;|&nbsp; 5 +--<br>
            + 10 files changed, 40 insertions(+), 42 deletions(-)<br>
            +<br>
            +diff --git a/src/daemon/dlt-daemon.c
            b/src/daemon/dlt-daemon.c<br>
            +index ef42f89..8c318a4 100644<br>
            +--- a/src/daemon/dlt-daemon.c<br>
            ++++ b/src/daemon/dlt-daemon.c<br>
            +@@ -1620,7 +1620,7 @@ int main(int argc, char *argv[])<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;watchdogTime=
outSeconds =3D 30;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; daemon.watchdog_trigger_interva=
l =3D
            watchdogTimeoutSeconds;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; daemon.watchdog_trigger_interva=
l =3D (unsigned
            int)watchdogTimeoutSeconds;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;daemon.watchdog_last_trigg=
er_time =3D 0U;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;create_timer_fd(&amp;daemo=
n_local,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;watchdogTimeoutSeconds,<br>
            +@@ -5509,9 +5509,6 @@ int
            dlt_daemon_send_ringbuffer_to_client(DltDaemon *daemon,
            DltDaemonLocal *daem<br>
            +&nbsp; &nbsp; &nbsp;int ret;<br>
            +&nbsp; &nbsp; &nbsp;static uint8_t data[DLT_DAEMON_RCVBUFSIZ=
E];<br>
            +&nbsp; &nbsp; &nbsp;int length;<br>
            +-#ifdef DLT_SYSTEMD_WATCHDOG_ENABLE<br>
            +-&nbsp; &nbsp; uint32_t curr_time =3D 0U;<br>
            +-#endif<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;PRINT_FUNCTION_VERBOSE(verbose);<br>
            + <br>
            +@@ -5554,9 +5551,6 @@ int
            dlt_daemon_send_ringbuffer_to_client_v2(DltDaemon *daemon,
            DltDaemonLocal *d<br>
            +&nbsp; &nbsp; &nbsp;int ret;<br>
            +&nbsp; &nbsp; &nbsp;static uint8_t data[DLT_DAEMON_RCVBUFSIZ=
E];<br>
            +&nbsp; &nbsp; &nbsp;int length;<br>
            +-#ifdef DLT_SYSTEMD_WATCHDOG_ENABLE<br>
            +-&nbsp; &nbsp; uint32_t curr_time =3D 0U;<br>
            +-#endif<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;PRINT_FUNCTION_VERBOSE(verbose);<br>
            + <br>
            +diff --git a/src/daemon/dlt_daemon_client.c
            b/src/daemon/dlt_daemon_client.c<br>
            +index 20a512b..681bf1e 100644<br>
            +--- a/src/daemon/dlt_daemon_client.c<br>
            ++++ b/src/daemon/dlt_daemon_client.c<br>
            +@@ -4690,7 +4690,7 @@ int
            dlt_daemon_process_systemd_timer(DltDaemon *daemon,<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if ((daemon_local =3D=3D NULL) || (daemo=
n =3D=3D NULL) ||
            (receiver =3D=3D NULL)) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dlt_vlog(LOG_ERR, &quot;%s=
: invalid parameters&quot;,
            __func__);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; return res;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; return (int)res;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;res =3D read(receiver-&gt;fd, &amp;expir=
,
            sizeof(expir));<br>
            +diff --git a/src/system/dlt-system-filetransfer.c
            b/src/system/dlt-system-filetransfer.c<br>
            +index c082f22..6024a3e 100644<br>
            +--- a/src/system/dlt-system-filetransfer.c<br>
            ++++ b/src/system/dlt-system-filetransfer.c<br>
            +@@ -105,14 +105,14 @@ char *unique_name(char *src)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_STRING(&=
quot;dlt-system-filetransfer, creating
            unique temporary file name.&quot;));<br>
            +&nbsp; &nbsp; &nbsp;time_t t =3D time(NULL);<br>
            +&nbsp; &nbsp; &nbsp;int ok;<br>
            +-&nbsp; &nbsp; uint32_t l =3D getFileSerialNumber(src, &amp;=
ok) ^ t;<br>
            ++&nbsp; &nbsp; uint32_t l =3D (uint32_t)(getFileSerialNumber=
(src,
            &amp;ok) ^ t);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (!ok)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return (char *)NULL;<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;char *basename_f =3D basename(src);<br>
            +&nbsp; &nbsp; &nbsp;/* Length of ULONG_MAX + 1 */<br>
            +-&nbsp; &nbsp; int len =3D 11 + strlen(basename_f);<br>
            ++&nbsp; &nbsp; size_t len =3D 11 + strlen(basename_f);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (len &gt; NAME_MAX) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_LOG(dltsystem, DLT_LOG=
_WARN,<br>
            +@@ -155,7 +155,7 @@ void
            send_dumped_file(FiletransferOptions const *opts, char
            *dst_tosend)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;while ((tota=
l - used) &lt; (total / 2)) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;struct timespec t;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;t.tv_sec =3D 0;<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; t.t=
v_nsec =3D 1000000ul *
            opts-&gt;TimeoutBetweenLogs;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; t.t=
v_nsec =3D (long int)(1000000ul *
            (unsigned long)opts-&gt;TimeoutBetweenLogs);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;nanosleep(&amp;t, NULL);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;dlt_user_log_resend_buffer();<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;dlt_user_check_buffer(&amp;total,
            &amp;used);<br>
            +@@ -220,7 +220,7 @@ int compress_file_to(char *src, char
            *dst, int level)<br>
            +&nbsp; &nbsp; &nbsp;MALLOC_ASSERT(buf);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;while (!feof(src_file)) {<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; int read =3D fread(buf, 1, Z_CH=
UNK_SZ, src_file);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; size_t read =3D fread(buf, 1, Z=
_CHUNK_SZ, src_file);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ferror(src_file)) {<br=
>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;free(buf);<b=
r>
            +@@ -230,7 +230,7 @@ int compress_file_to(char *src, char
            *dst, int level)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<b=
r>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; gzwrite(dst_file, buf, read);<b=
r>
            ++&nbsp; &nbsp; &nbsp; &nbsp; gzwrite(dst_file, buf, (unsigne=
d int)read);<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (remove(src) &lt; 0)<br>
            +@@ -290,7 +290,7 @@ int send_one(char *src,
            FiletransferOptions const *opts, int which)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;char *dst_tocompress;/*fil=
e which is going to be
            compressed, the compressed one is named dst_tosend */<br>
            + <br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; int len =3D strlen(fdir) + strl=
en(SUBDIR_COMPRESS) +
            strlen(rn) + 3;/*the filename in .tocompress +2 for 2*&quot;/=
&quot;,
            +1 for \0 */<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; size_t len =3D strlen(fdir) +
            strlen(SUBDIR_COMPRESS) + strlen(rn) + 3;/*the filename in
            .tocompress +2 for 2*&quot;/&quot;, +1 for \0 */<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dst_tocompress =3D malloc(=
len);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MALLOC_ASSERT(dst_tocompre=
ss);<br>
            + <br>
            +@@ -328,7 +328,7 @@ int send_one(char *src,
            FiletransferOptions const *opts, int which)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*move it directly into &q=
uot;tosend&quot; */<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_LOG(dltsystem, DLT_LOG=
_DEBUG,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;DLT_STRING(&quot;dlt-system-filetransfer,
            Moving file to tmp directory.&quot;));<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; int len =3D strlen(fdir) + strl=
en(SUBDIR_TOSEND) +
            strlen(rn) + 3;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; size_t len =3D strlen(fdir) + s=
trlen(SUBDIR_TOSEND)
            + strlen(rn) + 3;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dst_tosend =3D malloc(len)=
;/*the resulting filename
            in .tosend +2 for 2*&quot;/&quot;, +1 for \0 */<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;snprintf(dst_tosend, len, =
&quot;%s/%s/%s&quot;, fdir,
            SUBDIR_TOSEND, rn);<br>
            +@@ -379,7 +379,7 @@ int flush_dir_send(FiletransferOptions
            const *opts, const char *compress_dir, co<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_LOG(dlts=
ystem, DLT_LOG_DEBUG,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;DLT_STRING(&quot;dlt-system-filetransfer,
            old compressed file found in send directory:&quot;),<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;DLT_STRING(dp-&gt;d_name));<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int len =3D strle=
n(send_dir) +
            strlen(dp-&gt;d_name) + 2;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_t len =3D st=
rlen(send_dir) +
            strlen(dp-&gt;d_name) + 2;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fn =3D mallo=
c(len);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MALLOC_ASSER=
T(fn);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;snprintf(fn,=
 len, &quot;%s/%s&quot;, send_dir,
            dp-&gt;d_name);<br>
            +@@ -394,10 +394,10 @@ int
            flush_dir_send(FiletransferOptions const *opts, const char
            *compress_dir, co<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;strncpy(tmp, dp-&gt;d_name,
            strlen(dp-&gt;d_name) - strlen(COMPRESS_EXTENSION));<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;tmp[strlen(dp-&gt;d_name) -
            strlen(COMPRESS_EXTENSION)] =3D '\0';<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int=
 len =3D strlen(tmp) +
            strlen(compress_dir) + 1 + 1;/*2 sizes + 1*&quot;/&quot; + \0=
 */<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cha=
r *path_uncompressed =3D malloc(len);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; siz=
e_t length =3D strlen(tmp) +
            strlen(compress_dir) + 1 + 1;/*2 sizes + 1*&quot;/&quot; + \0=
 */<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cha=
r *path_uncompressed =3D malloc(length);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;MALLOC_ASSERT(path_uncompressed);<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; snp=
rintf(path_uncompressed, len, &quot;%s/%s&quot;,
            compress_dir, tmp);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; snp=
rintf(path_uncompressed, length,
            &quot;%s/%s&quot;, compress_dir, tmp);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;struct stat sb;<br>
            + <br>
            +@@ -475,7 +475,7 @@ int
            flush_dir_compress(FiletransferOptions const *opts, int
            which, const char *c<br>
            + <br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*compress f=
ile into to_send dir */<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int len =3D strle=
n(compress_dir) +
            strlen(dp-&gt;d_name) + 2;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_t len =3D st=
rlen(compress_dir) +
            strlen(dp-&gt;d_name) + 2;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;char *cd_fil=
ename =3D malloc(len);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MALLOC_ASSER=
T(cd_filename);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;snprintf(cd_=
filename, len, &quot;%s/%s&quot;,
            compress_dir, dp-&gt;d_name);<br>
            +@@ -526,7 +526,7 @@ int
            flush_dir_original(FiletransferOptions const *opts, int
            which)<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_LOG(dlts=
ystem, DLT_LOG_DEBUG,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;DLT_STRING(&quot;dlt-system-filetransfer,
            old file found in directory.&quot;));<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int len =3D strle=
n(sdir) + strlen(dp-&gt;d_name)
            + 2;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size_t len =3D st=
rlen(sdir) +
            strlen(dp-&gt;d_name) + 2;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;char *fn =3D=
 malloc(len);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MALLOC_ASSER=
T(fn);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;snprintf(fn,=
 len, &quot;%s/%s&quot;, sdir,
            dp-&gt;d_name);<br>
            +@@ -564,7 +564,7 @@ int flush_dir(FiletransferOptions const
            *opts, int which)<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;char *compress_dir;<br>
            +&nbsp; &nbsp; &nbsp;char *send_dir;<br>
            +-&nbsp; &nbsp; int len =3D strlen(opts-&gt;Directory[which])=
 +
            strlen(SUBDIR_COMPRESS) + 2;<br>
            ++&nbsp; &nbsp; size_t len =3D strlen(opts-&gt;Directory[whic=
h]) +
            strlen(SUBDIR_COMPRESS) + 2;<br>
            +&nbsp; &nbsp; &nbsp;compress_dir =3D malloc (len);<br>
            +&nbsp; &nbsp; &nbsp;MALLOC_ASSERT(compress_dir);<br>
            +&nbsp; &nbsp; &nbsp;snprintf(compress_dir, len, &quot;%s/%s&=
quot;,
            opts-&gt;Directory[which], SUBDIR_COMPRESS);<br>
            +@@ -625,7 +625,7 @@ int
            init_filetransfer_dirs(DltSystemConfiguration *config)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*create subdirectories fo=
r processing the files
            */<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;char *subdirpath;<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; int len =3D strlen(opts-&gt;Dir=
ectory[i]) +
            strlen(SUBDIR_COMPRESS) + 2;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; size_t len =3D strlen(opts-&gt;=
Directory[i]) +
            strlen(SUBDIR_COMPRESS) + 2;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;subdirpath =3D malloc (len=
);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MALLOC_ASSERT(subdirpath);=
<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;snprintf(subdirpath, len, =
&quot;%s/%s&quot;,
            opts-&gt;Directory[i], SUBDIR_COMPRESS);<br>
            +@@ -699,7 +699,7 @@ int process_files(FiletransferOptions
            const *opts)<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;unsigned int i =3D 0;<br>
            + <br>
            +-&nbsp; &nbsp; while (i &lt; (len - INOTIFY_SZ)) {<br>
            ++&nbsp; &nbsp; while (i &lt; ((long unsigned int)len - INOTI=
FY_SZ)) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct inotify_event *ie =3D=
 (struct inotify_event
            *)&amp;buf[i];<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ie-&gt;len &gt; 0) {<b=
r>
            +@@ -712,26 +712,29 @@ int process_files(FiletransferOptions
            const *opts)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_LOG_DEBUG,<=
br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;DLT_STRING(&quot;dlt-system-filetransfer, found new fil=
e.&quot;),<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_STRING(ie-&=
gt;name));<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; int length =3D
            strlen(opts-&gt;Directory[j]) + ie-&gt;len + 1;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; size_t length =3D
            strlen(opts-&gt;Directory[j]) + strlen(ie-&gt;name) + 2;<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;if (length &gt; PATH_MAX) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_LOG(filetransferContext,<=
br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;D=
LT_LOG_ERROR,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;D=
LT_STRING(<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
            &nbsp;&quot;dlt-system-filetransfer: Very long path for file =
transfer.
            Cancelling transfer! Length is: &quot;),<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DLT_IN=
T(length));<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DLT_IN=
T((int)length));<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;char *tosend =3D malloc(length);<br>
            ++#pragma GCC diagnostic push<br>
            ++#pragma GCC diagnostic ignored &quot;-Wformat-truncation=3D=
&quot;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;snprintf(tosend, length, &quot;%s/%s&quot;,
            opts-&gt;Directory[j], ie-&gt;name);<br>
            ++#pragma GCC diagnostic pop<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;send_one(tosend, opts, j);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;free(tosend);<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; i +=3D INOTIFY_SZ + ie-&gt;len;=
<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; i +=3D (unsigned int)INOTIFY_SZ=
 + ie-&gt;len;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            + <br>
            + #endif<br>
            +@@ -741,4 +744,4 @@ int process_files(FiletransferOptions
            const *opts)<br>
            + void filetransfer_fd_handler(DltSystemConfiguration
            *config)<br>
            + {<br>
            +&nbsp; &nbsp; &nbsp;process_files(&amp;(config-&gt;Filetrans=
fer));<br>
            +-}<br>
            +\ No newline at end of file<br>
            ++}<br>
            +diff --git a/src/system/dlt-system-journal.c
            b/src/system/dlt-system-journal.c<br>
            +index 366555b..9a55c3f 100644<br>
            +--- a/src/system/dlt-system-journal.c<br>
            ++++ b/src/system/dlt-system-journal.c<br>
            +@@ -393,7 +393,7 @@ void register_journal_fd(sd_journal
            **j, struct pollfd *pollfd, int i,&nbsp; DltSyste<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_STRING(s=
trerror(pollfd[i].fd)));<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;j_tmp =3D NULL;<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            +-&nbsp; &nbsp; pollfd[i].events =3D sd_journal_get_events(j_=
tmp);<br>
            ++&nbsp; &nbsp; pollfd[i].events =3D
            (short)sd_journal_get_events(j_tmp);<br>
            +&nbsp; &nbsp; &nbsp;if(pollfd[i].events &lt; 0) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_LOG(dltsystem, DLT_LOG=
_ERROR,
            DLT_STRING(&quot;Error while getting journal events: &quot;),
            <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_STRING(s=
trerror(pollfd[i].events)));<br>
            +diff --git a/src/system/dlt-system-logfile.c
            b/src/system/dlt-system-logfile.c<br>
            +index 941a3be..d31441c 100644<br>
            +--- a/src/system/dlt-system-logfile.c<br>
            ++++ b/src/system/dlt-system-logfile.c<br>
            +@@ -64,7 +64,7 @@ void send_file(LogFileOptions const
            *fileopt, int n)<br>
            +&nbsp; &nbsp; &nbsp;FILE *pFile;<br>
            +&nbsp; &nbsp; &nbsp;DltContext context =3D logfileContext[n]=
;<br>
            +&nbsp; &nbsp; &nbsp;char buffer[1024];<br>
            +-&nbsp; &nbsp; int bytes;<br>
            ++&nbsp; &nbsp; size_t bytes;<br>
            +&nbsp; &nbsp; &nbsp;int seq =3D 1;<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;pFile =3D fopen((*fileopt).Filename[n], =
&quot;r&quot;);<br>
            +@@ -73,7 +73,7 @@ void send_file(LogFileOptions const
            *fileopt, int n)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;while (!feof(pFile)) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bytes =3D fr=
ead(buffer, 1, sizeof(buffer) - 1,
            pFile);<br>
            + <br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (bytes &gt;=3D=
 0)<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (bytes =3D=3D =
(sizeof(buffer) - 1))<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;buffer[bytes] =3D 0;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;buffer[0] =3D 0;<br>
            +diff --git a/src/system/dlt-system-process-handling.c
            b/src/system/dlt-system-process-handling.c<br>
            +index 3e092d4..708e9e3 100644<br>
            +--- a/src/system/dlt-system-process-handling.c<br>
            ++++ b/src/system/dlt-system-process-handling.c<br>
            +@@ -201,7 +201,7 @@ int register_timer_fd(struct pollfd
            *pollfd, int fdcnt)<br>
            + void timer_fd_handler(int fd, DltSystemConfiguration
            *config)<br>
            + {<br>
            +&nbsp; &nbsp; &nbsp;uint64_t timersElapsed =3D 0ULL;<br>
            +-&nbsp; &nbsp; int r =3D read(fd, &amp;timersElapsed, 8U);&n=
bsp; &nbsp; // only
            needed to reset fd event<br>
            ++&nbsp; &nbsp; int r =3D (int)read(fd, &amp;timersElapsed, 8=
U);&nbsp; &nbsp; //
            only needed to reset fd event<br>
            +&nbsp; &nbsp; &nbsp;if (r &lt; 0) <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_LOG(dltsystem, DLT_LOG=
_ERROR,
            DLT_STRING(&quot;Error while reading timer fd: &quot;),
            <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_STRING(s=
trerror(r)));<br>
            +diff --git a/src/system/dlt-system-processes.c
            b/src/system/dlt-system-processes.c<br>
            +index c35596c..b17b8ee 100644<br>
            +--- a/src/system/dlt-system-processes.c<br>
            ++++ b/src/system/dlt-system-processes.c<br>
            +@@ -72,7 +72,7 @@ void send_process(LogProcessOptions const
            *popts, int n)<br>
            +&nbsp; &nbsp; &nbsp;struct dirent *dp;<br>
            +&nbsp; &nbsp; &nbsp;char filename[PATH_MAX];<br>
            +&nbsp; &nbsp; &nbsp;char buffer[1024];<br>
            +-&nbsp; &nbsp; int bytes;<br>
            ++&nbsp; &nbsp; size_t bytes;<br>
            +&nbsp; &nbsp; &nbsp;int found =3D 0;<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;/* go through all process files in direc=
tory */<br>
            +diff --git a/src/system/dlt-system-syslog.c
            b/src/system/dlt-system-syslog.c<br>
            +index 59e9d3f..d6b1b8a 100644<br>
            +--- a/src/system/dlt-system-syslog.c<br>
            ++++ b/src/system/dlt-system-syslog.c<br>
            +@@ -88,7 +88,7 @@ int init_socket(SyslogOptions opts)<br>
            + #ifdef DLT_USE_IPv6<br>
            +&nbsp; &nbsp; &nbsp;syslog_addr.sin6_family =3D AF_INET6;<br=
>
            +&nbsp; &nbsp; &nbsp;syslog_addr.sin6_addr =3D in6addr_any;<b=
r>
            +-&nbsp; &nbsp; syslog_addr.sin6_port =3D htons(opts.Port);<b=
r>
            ++&nbsp; &nbsp; syslog_addr.sin6_port =3D htons((uint16_t)opt=
s.Port);<br>
            + #else<br>
            +&nbsp; &nbsp; &nbsp;syslog_addr.sin_family =3D AF_INET;<br>
            +&nbsp; &nbsp; &nbsp;syslog_addr.sin_addr.s_addr =3D INADDR_A=
NY;<br>
            +@@ -117,7 +117,7 @@ int read_socket(int sock)<br>
            +&nbsp; &nbsp; &nbsp;struct sockaddr_in client_addr;<br>
            +&nbsp; &nbsp; &nbsp;socklen_t addr_len =3D sizeof(struct soc=
kaddr_in);<br>
            + <br>
            +-&nbsp; &nbsp; int bytes_read =3D recvfrom(sock, recv_data,
            RECV_BUF_SZ, 0,<br>
            ++&nbsp; &nbsp; int bytes_read =3D (int)recvfrom(sock, recv_d=
ata,
            RECV_BUF_SZ, 0,<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(struct sockaddr
            *)&amp;client_addr, &amp;addr_len);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (bytes_read =3D=3D -1) {<br>
            +@@ -157,4 +157,4 @@ int register_syslog_fd(struct pollfd
            *pollfd, int i, DltSystemConfiguration *con<br>
            + void syslog_fd_handler(int syslogSock)<br>
            + {<br>
            +&nbsp; &nbsp; &nbsp;read_socket(syslogSock);<br>
            +-}<br>
            +\ No newline at end of file<br>
            ++}<br>
            +diff --git a/src/system/dlt-system-watchdog.c
            b/src/system/dlt-system-watchdog.c<br>
            +index 7ed1604..6334214 100644<br>
            +--- a/src/system/dlt-system-watchdog.c<br>
            ++++ b/src/system/dlt-system-watchdog.c<br>
            +@@ -56,7 +56,7 @@ int calculate_period(struct itimerspec
            *itval)<br>
            +&nbsp; &nbsp; &nbsp;}<br>
            +&nbsp; &nbsp; &nbsp;<br>
            +&nbsp; &nbsp; &nbsp;DLT_LOG(watchdogContext, DLT_LOG_DEBUG,
            DLT_STRING(&quot;watchdogusec: &quot;), DLT_STRING(watchdogUS=
ec));<br>
            +-&nbsp; &nbsp; watchdogTimeoutSeconds =3D atoi(watchdogUSec)=
;<br>
            ++&nbsp; &nbsp; watchdogTimeoutSeconds =3D (unsigned
            int)atoi(watchdogUSec);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp;if (watchdogTimeoutSeconds &lt;=3D 0) {<=
br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;snprintf(str, 512, &quot;s=
ystemd watchdog timeout
            incorrect: %u\n&quot;, watchdogTimeoutSeconds);<br>
            +@@ -78,9 +78,9 @@ int calculate_period(struct itimerspec
            *itval)<br>
            +&nbsp; &nbsp; &nbsp;sec =3D notifiyPeriodNSec / 1000000;<br>
            +&nbsp; &nbsp; &nbsp;ns =3D (notifiyPeriodNSec - (sec * 10000=
00)) * 1000;<br>
            +&nbsp; &nbsp; &nbsp;itval-&gt;it_interval.tv_sec =3D sec;<br=
>
            +-&nbsp; &nbsp; itval-&gt;it_interval.tv_nsec =3D ns;<br>
            ++&nbsp; &nbsp; itval-&gt;it_interval.tv_nsec =3D (long int)n=
s;<br>
            +&nbsp; &nbsp; &nbsp;itval-&gt;it_value.tv_sec =3D sec;<br>
            +-&nbsp; &nbsp; itval-&gt;it_value.tv_nsec =3D ns;<br>
            ++&nbsp; &nbsp; itval-&gt;it_value.tv_nsec =3D (long int)ns;<=
br>
            + <br>
            +&nbsp; &nbsp; &nbsp;return 0;<br>
            + }<br>
            +@@ -114,7 +114,7 @@ void watchdog_fd_handler(int fd)<br>
            + #endif<br>
            + {<br>
            +&nbsp; &nbsp; &nbsp;uint64_t timersElapsed =3D 0ULL;<br>
            +-&nbsp; &nbsp; int r =3D read(fd, &amp;timersElapsed, 8U);&n=
bsp; &nbsp; // only
            needed to reset fd event<br>
            ++&nbsp; &nbsp; int r =3D (int)read(fd, &amp;timersElapsed, 8=
U);&nbsp; &nbsp; //
            only needed to reset fd event<br>
            +&nbsp; &nbsp; &nbsp;if(r &lt; 0)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_LOG(watchdogContext, D=
LT_LOG_ERROR,
            DLT_STRING(&quot;Could not reset systemd watchdog. Exit with:=
 &quot;),
            <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DLT_STRING(s=
trerror(r)));<br>
            +diff --git a/systemd/3rdparty/sd-daemon.c
            b/systemd/3rdparty/sd-daemon.c<br>
            +index de3f985..9fde8cc 100644<br>
            +--- a/systemd/3rdparty/sd-daemon.c<br>
            ++++ b/systemd/3rdparty/sd-daemon.c<br>
            +@@ -46,6 +46,7 @@<br>
            + #include &lt;stdio.h&gt;<br>
            + #include &lt;stddef.h&gt;<br>
            + #include &lt;limits.h&gt;<br>
            ++#include &lt;stdint.h&gt;<br>
            + <br>
            + #if defined(__linux__)<br>
            + #include &lt;mqueue.h&gt;<br>
            +@@ -456,12 +457,12 @@ _sd_export_ int sd_notify(int
            unset_environment, const char *state) {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;sockaddr.un.sun_path[0] =3D 0;<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memset(&amp;iovec, 0, size=
of(iovec));<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; iovec.iov_base =3D (char*) stat=
e;<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; iovec.iov_base =3D (void *)(uin=
tptr_t)state;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iovec.iov_len =3D strlen(s=
tate);<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memset(&amp;msghdr, 0, siz=
eof(msghdr));<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msghdr.msg_name =3D &amp;s=
ockaddr;<br>
            +-&nbsp; &nbsp; &nbsp; &nbsp; msghdr.msg_namelen =3D offsetof=
(struct sockaddr_un,
            sun_path) + strlen(e);<br>
            ++&nbsp; &nbsp; &nbsp; &nbsp; msghdr.msg_namelen =3D (socklen=
_t)(offsetof(struct
            sockaddr_un, sun_path) + strlen(e));<br>
            + <br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (msghdr.msg_namelen &gt=
; sizeof(struct
            sockaddr_un))<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;msghdr.msg_namelen =3D sizeof(struct
            sockaddr_un);<br>
            +-- <br>
            +2.34.1<br>
            +<br>
            diff --git
a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cm=
ake-4.patch
b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cm=
ake-4.patch<br>
            deleted file mode 100644<br>
            index ac5fec5684..0000000000<br>
            ---
a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cm=
ake-4.patch<br>
            +++ /dev/null<br>
            @@ -1,99 +0,0 @@<br>
            -From ae23f2cccc169874d89903cad24bf36e19bef659 Mon Sep 17
            00:00:00 2001<br>
            -From: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com=
" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freete=
xt">alperyasinak1@gmail.com</a>&gt;<br>
            -Date: Wed, 9 Jul 2025 18:18:33 +0300<br>
            -Subject: [PATCH] cmake: Set minimum required version to 3.5
            for CMake 4+<br>
            - compatibility<br>
            -<br>
            -Fix:<br>
            -<br>
            -| CMake Error at CMakeLists.txt:17
            (cmake_minimum_required):<br>
            -|&nbsp; &nbsp;Compatibility with CMake &lt; 3.5 has been rem=
oved from
            CMake.<br>
            -|<br>
            -|&nbsp; &nbsp;Update the VERSION argument &lt;min&gt; value.=
&nbsp; Or, use
            the &lt;min&gt;...&lt;max&gt; syntax<br>
            -|&nbsp; &nbsp;to tell CMake that the project requires at lea=
st
            &lt;min&gt; but has been updated<br>
            -|&nbsp; &nbsp;to work with policies introduced by &lt;max&gt=
; or
            earlier.<br>
            -|<br>
            -|&nbsp; &nbsp;Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 t=
o try
            configuring anyway.<br>
            -|<br>
            -|<br>
            -| -- Configuring incomplete, errors occurred!<br>
            -<br>
            -Upstream-Status: Submitted [<a href=3D"https://urldefense.co=
m/v3/__https://github.com/COVESA/dlt-daemon/pull/755__;!!AjveYdw8EvQ!fmJm=
sXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9=
JYdy66ntg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://github.com/COVESA/dlt-daemon/pull/755</a>]<br>
            -<br>
            -Signed-off-by: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@=
gmail.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">alperyasinak1@gmail.com</a>&gt;<br>
            ----<br>
            - CMakeLists.txt&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;| 2 +-<br>
            - examples/example1/CMakeLists.txt | 2 +-<br>
            - examples/example2/CMakeLists.txt | 2 +-<br>
            - examples/example3/CMakeLists.txt | 2 +-<br>
            - examples/example4/CMakeLists.txt | 2 +-<br>
            - 5 files changed, 5 insertions(+), 5 deletions(-)<br>
            -<br>
            -diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
            -index 94185b8..2a0f619 100644<br>
            ---- a/CMakeLists.txt<br>
            -+++ b/CMakeLists.txt<br>
            -@@ -14,7 +14,7 @@<br>
            - #######<br>
            - <br>
            - # Set minimum Cmake version and setup policy behavior<br>
            --cmake_minimum_required(VERSION 3.3)<br>
            -+cmake_minimum_required(VERSION 3.5)<br>
            - <br>
            - if(${CMAKE_VERSION} VERSION_GREATER &quot;3.20&quot; OR
            ${CMAKE_VERSION} VERSION_EQUAL &quot;3.20&quot;)<br>
            -&nbsp; &nbsp; &nbsp;cmake_policy(SET CMP0115 OLD)<br>
            -diff --git a/examples/example1/CMakeLists.txt
            b/examples/example1/CMakeLists.txt<br>
            -index 60644a1..44cd053 100644<br>
            ---- a/examples/example1/CMakeLists.txt<br>
            -+++ b/examples/example1/CMakeLists.txt<br>
            -@@ -17,7 +17,7 @@<br>
            - # DLT example implementation<br>
            - #<br>
            - <br>
            --cmake_minimum_required( VERSION 2.6 )<br>
            -+cmake_minimum_required( VERSION 3.5 )<br>
            - project( automotive-dlt-example1 )<br>
            - <br>
            - #<br>
            -diff --git a/examples/example2/CMakeLists.txt
            b/examples/example2/CMakeLists.txt<br>
            -index 66a4f24..a8efbcf 100644<br>
            ---- a/examples/example2/CMakeLists.txt<br>
            -+++ b/examples/example2/CMakeLists.txt<br>
            -@@ -17,7 +17,7 @@<br>
            - # DLT example implementation<br>
            - #<br>
            - <br>
            --cmake_minimum_required( VERSION 2.6 )<br>
            -+cmake_minimum_required( VERSION 3.5 )<br>
            - project( automotive-dlt-example2 )<br>
            - <br>
            - #<br>
            -diff --git a/examples/example3/CMakeLists.txt
            b/examples/example3/CMakeLists.txt<br>
            -index 45b7467..4d4958d 100644<br>
            ---- a/examples/example3/CMakeLists.txt<br>
            -+++ b/examples/example3/CMakeLists.txt<br>
            -@@ -17,7 +17,7 @@<br>
            - # DLT example implementation<br>
            - #<br>
            - <br>
            --cmake_minimum_required( VERSION 2.6 )<br>
            -+cmake_minimum_required( VERSION 3.5 )<br>
            - project( automotive-dlt-example3 )<br>
            - <br>
            - #<br>
            -diff --git a/examples/example4/CMakeLists.txt
            b/examples/example4/CMakeLists.txt<br>
            -index 53a4fad..161c333 100644<br>
            ---- a/examples/example4/CMakeLists.txt<br>
            -+++ b/examples/example4/CMakeLists.txt<br>
            -@@ -17,7 +17,7 @@<br>
            - # DLT example implementation<br>
            - #<br>
            - <br>
            --cmake_minimum_required( VERSION 2.6 )<br>
            -+cmake_minimum_required( VERSION 3.5 )<br>
            - project( automotive-dlt-example4 )<br>
            - <br>
            - #<br>
            --- <br>
            -2.43.0<br>
            -<br>
            diff --git
            a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
            b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch<br=
>
            deleted file mode 100644<br>
            index 3699b8c83a..0000000000<br>
            ---
            a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch<br=
>
            +++ /dev/null<br>
            @@ -1,80 +0,0 @@<br>
            -Upstream-Status: Submitted [<a href=3D"https://urldefense.co=
m/v3/__https://github.com/COVESA/dlt-daemon/pull/544__;!!AjveYdw8EvQ!fmJm=
sXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9=
JYS6ETQbA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://github.com/COVESA/dlt-daemon/pull/544</a>]<br>
            -<br>
            -From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17
            00:00:00 2001<br>
            -From: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagna=
gianfranco@yahoo.it" target=3D"_blank" moz-do-not-send=3D"true" class=3D"=
moz-txt-link-freetext">costamagnagianfranco@yahoo.it</a>&gt;<br>
            -Date: Thu, 28 Sep 2023 12:54:23 +0200<br>
            -Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock
            build on non amd64<br>
            - and i386 arcs<br>
            -<br>
            ----<br>
            - src/core_dump_handler/dlt_cdh.h&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;|&nbsp; 2 ++<br>
            - src/core_dump_handler/dlt_cdh_cpuinfo.c | 33
            +++++++++++++++++++++++++<br>
            - src/core_dump_handler/dlt_cdh_crashid.c |&nbsp; 2 +-<br>
            - 3 files changed, 36 insertions(+), 1 deletion(-)<br>
            - create mode 100644 src/core_dump_handler/dlt_cdh_cpuinfo.c<=
br>
            -<br>
            -diff --git a/src/core_dump_handler/dlt_cdh.h
            b/src/core_dump_handler/dlt_cdh.h<br>
            -index d572ecf3..8608c6c4 100644<br>
            ---- a/src/core_dump_handler/dlt_cdh.h<br>
            -+++ b/src/core_dump_handler/dlt_cdh.h<br>
            -@@ -55,6 +55,8 @@ typedef struct<br>
            -&nbsp; &nbsp; &nbsp;uint64_t pc;<br>
            -&nbsp; &nbsp; &nbsp;uint64_t ip;<br>
            -&nbsp; &nbsp; &nbsp;uint64_t lr;<br>
            -+&nbsp; &nbsp; uint64_t sp;<br>
            -+&nbsp; &nbsp; uint64_t fp;<br>
            - <br>
            - } cdh_registers_t;<br>
            - <br>
            -diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c
            b/src/core_dump_handler/dlt_cdh_cpuinfo.c<br>
            -new file mode 100644<br>
            -index 00000000..03509fda<br>
            ---- /dev/null<br>
            -+++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c<br>
            -@@ -0,0 +1,33 @@<br>
            -+/*<br>
            -+ * SPDX license identifier: MPL-2.0<br>
            -+ *<br>
            -+ * Copyright (C) 2011-2015, BMW AG<br>
            -+ *<br>
            -+ * This file is part of COVESA Project DLT - Diagnostic
            Log and Trace.<br>
            -+ *<br>
            -+ * This Source Code Form is subject to the terms of the<br>
            -+ * Mozilla Public License (MPL), v. 2.0.<br>
            -+ * If a copy of the MPL was not distributed with this
            file,<br>
            -+ * You can obtain one at <a href=3D"https://urldefense.com/=
v3/__http://mozilla.org/MPL/2.0/__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-C=
CAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9Jatfycmhg$" rel=3D"n=
oreferrer" target=3D"_blank" moz-do-not-send=3D"true">
              http://mozilla.org/MPL/2.0/</a>.<br>
            -+ *<br>
            -+ * For further information see <a href=3D"https://urldefens=
e.com/v3/__http://www.covesa.org/__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-=
CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JYo80jTsg$" rel=3D"=
noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
              http://www.covesa.org/</a>.<br>
            -+ */<br>
            -+<br>
            -+/*!<br>
            -+ * \author Gianfranco Costamagna &lt;<a href=3D"mailto:locu=
tusofborg@debian.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">locutusofborg@debian.org</a>&gt;<br>
            -+ *<br>
            -+ * \copyright Copyright =C2=A9 2011-2015 BMW AG. \n<br>
            -+ * License MPL-2.0: Mozilla Public License version 2.0 <a h=
ref=3D"https://urldefense.com/v3/__http://mozilla.org/MPL/2.0/__;!!AjveYd=
w8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu=
8DEeN5lIJ9Jatfycmhg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">
              http://mozilla.org/MPL/2.0/</a>.<br>
            -+ *<br>
            -+ * \file dlt_cdh_cpuinfo.c<br>
            -+ */<br>
            -+<br>
            -+#include &quot;dlt_cdh_cpuinfo.h&quot;<br>
            -+<br>
            -+void get_registers(prstatus_t *prstatus, cdh_registers_t
            *registers)<br>
            -+{<br>
            -+/*&nbsp; &nbsp; struct user_regs_struct *ptr_reg =3D (struc=
t
            user_regs_struct *)prstatus-&gt;pr_reg;<br>
            -+<br>
            -+&nbsp; &nbsp; registers-&gt;pc =3D ptr_reg-&gt;pc;*/ /*
            [REG_PROC_COUNTER]; */<br>
            -+<br>
            -+}<br>
            -diff --git a/src/core_dump_handler/dlt_cdh_crashid.c
            b/src/core_dump_handler/dlt_cdh_crashid.c<br>
            -index bca44e0e..8dd98d70 100644<br>
            ---- a/src/core_dump_handler/dlt_cdh_crashid.c<br>
            -+++ b/src/core_dump_handler/dlt_cdh_crashid.c<br>
            -@@ -30,7 +30,7 @@<br>
            - #include &lt;stdio.h&gt;<br>
            - #include &lt;string.h&gt;<br>
            - #include &lt;errno.h&gt;<br>
            --#include &lt;asm/prctl.h&gt;<br>
            -+#include &lt;sys/prctl.h&gt;<br>
            - #include &lt;inttypes.h&gt;<br>
            - <br>
            - #include &quot;dlt_cdh.h&quot;<br>
            diff --git
            a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
            b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch<br=
>
            deleted file mode 100644<br>
            index fd36480456..0000000000<br>
            ---
            a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch<br=
>
            +++ /dev/null<br>
            @@ -1,36 +0,0 @@<br>
            -Upstream-Status: Submitted [<a href=3D"https://urldefense.co=
m/v3/__https://github.com/COVESA/dlt-daemon/pull/567__;!!AjveYdw8EvQ!fmJm=
sXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9=
JZFXNiuZg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://github.com/COVESA/dlt-daemon/pull/567</a>]<br>
            -<br>
            -From c84e48f6986054cf8b9459e608235b7bd1635746 Mon Sep 17
            00:00:00 2001<br>
            -From: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagna=
gianfranco@yahoo.it" target=3D"_blank" moz-do-not-send=3D"true" class=3D"=
moz-txt-link-freetext">costamagnagianfranco@yahoo.it</a>&gt;<br>
            -Date: Mon, 13 Nov 2023 12:37:23 +0100<br>
            -Subject: [PATCH] dlt_cdh:<br>
            -<br>
            -Make sure on 64 bit we read an ELF64 structure.<br>
            -Otherwise we get a read error, and the context file is
            missing some good<br>
            -to know information<br>
            ----<br>
            - src/core_dump_handler/dlt_cdh.h | 7 +++++++<br>
            - 1 file changed, 7 insertions(+)<br>
            -<br>
            -diff --git a/src/core_dump_handler/dlt_cdh.h
            b/src/core_dump_handler/dlt_cdh.h<br>
            -index 8608c6c4..3dac480a 100644<br>
            ---- a/src/core_dump_handler/dlt_cdh.h<br>
            -+++ b/src/core_dump_handler/dlt_cdh.h<br>
            -@@ -45,10 +45,17 @@<br>
            - #define CORE_FILE_PATTERN&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;&quot;%s/core.%d.%s.%d.gz&quot;<br>
            - #define CONTEXT_FILE_PATTERN&nbsp; &nbsp; &nbsp; &nbsp;
            &quot;%s/context.%d.%s.%d.txt&quot;<br>
            - <br>
            -+#if ((__SIZEOF_POINTER) =3D=3D 4)<br>
            - #define ELF_Ehdr&nbsp; &nbsp; Elf32_Ehdr<br>
            - #define ELF_Phdr&nbsp; &nbsp; Elf32_Phdr<br>
            - #define ELF_Shdr&nbsp; &nbsp; Elf32_Shdr<br>
            - #define ELF_Nhdr&nbsp; &nbsp; Elf32_Nhdr<br>
            -+#else<br>
            -+#define ELF_Ehdr&nbsp; &nbsp; Elf64_Ehdr<br>
            -+#define ELF_Phdr&nbsp; &nbsp; Elf64_Phdr<br>
            -+#define ELF_Shdr&nbsp; &nbsp; Elf64_Shdr<br>
            -+#define ELF_Nhdr&nbsp; &nbsp; Elf64_Nhdr<br>
            -+#endif<br>
            - <br>
            - typedef struct<br>
            - {<br>
            diff --git a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"h=
ttps://urldefense.com/v3/__http://dlt-daemon_2.18.10.bb__;!!AjveYdw8EvQ!f=
mJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5l=
IJ9JYcHKxqHg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">dlt-daemon_2.18.10.bb</a>
            b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"https://urld=
efense.com/v3/__http://dlt-daemon_3.0.0.bb__;!!AjveYdw8EvQ!fmJmsXD2akfD3V=
qMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JadOXRLnA$=
" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">dlt-daemo=
n_3.0.0.bb</a><br>
            similarity index 90%<br>
            rename from meta-oe/recipes-extended/dlt-daemon/<a href=3D"ht=
tps://urldefense.com/v3/__http://dlt-daemon_2.18.10.bb__;!!AjveYdw8EvQ!fm=
JmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lI=
J9JYcHKxqHg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">dlt-daemon_2.18.10.bb</a><br>
            rename to meta-oe/recipes-extended/dlt-daemon/<a href=3D"http=
s://urldefense.com/v3/__http://dlt-daemon_3.0.0.bb__;!!AjveYdw8EvQ!fmJmsX=
D2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9Ja=
dOXRLnA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">d=
lt-daemon_3.0.0.bb</a><br>
            index 82edde6c9d..7f402b0e29 100644<br>
            --- a/meta-oe/recipes-extended/dlt-daemon/<a href=3D"https://=
urldefense.com/v3/__http://dlt-daemon_2.18.10.bb__;!!AjveYdw8EvQ!fmJmsXD2=
akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JYcH=
KxqHg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">dlt=
-daemon_2.18.10.bb</a><br>
            +++ b/meta-oe/recipes-extended/dlt-daemon/<a href=3D"https://=
urldefense.com/v3/__http://dlt-daemon_3.0.0.bb__;!!AjveYdw8EvQ!fmJmsXD2ak=
fD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JadOXR=
LnA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">dlt-d=
aemon_3.0.0.bb</a><br>
            @@ -17,12 +17,12 @@ DEPENDS =3D &quot;zlib gzip-native json-c=
&quot;<br>
            &nbsp;SRC_URI =3D &quot;git://<a href=3D"https://urldefense.c=
om/v3/__http://github.com/COVESA/$*7BBPN*7D.git;protocol=3Dhttps;branch=3D=
master__;JSU!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2eg=
wgKCnWjFUrDjJw65Kupu8DEeN5lIJ9Ja5QUQ8dg$" rel=3D"noreferrer" target=3D"_b=
lank" moz-do-not-send=3D"true">github.com/COVESA/${BPN}.git;protocol=3Dht=
tps;branch=3Dmaster</a>
            \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class=3D"moz-txt-link-freetext" href=3D"file://0002-Don-t-=
execute-processes-as-a-specific-user.patch">file://0002-Don-t-execute-pro=
cesses-as-a-specific-user.patch</a>
            \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class=3D"moz-txt-link-freetext" href=3D"file://0004-Modify=
-systemd-config-directory.patch">file://0004-Modify-systemd-config-direct=
ory.patch</a> \<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt=
-link-freetext" href=3D"file://544.patch">file://544.patch</a> \<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt=
-link-freetext" href=3D"file://567.patch">file://567.patch</a> \<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-CMakeLists-t=
xt-make-DLT_WatchdogSec-can-be-set-by-user.patch">file://0001-CMakeLists-=
txt-make-DLT_WatchdogSec-can-be-set-by-user.patch</a>
            \<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt=
-link-freetext" href=3D"file://0003-allow-build-with-cmake-4.patch">file:=
//0003-allow-build-with-cmake-4.patch</a> \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-=
Fix-compile-failure-related-to-gzlog.patch">file://0001-Fix-compile-failu=
re-related-to-gzlog.patch</a> \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt=
-link-freetext" href=3D"file://0001-Fix-kinds-of-build-failure.patch">fil=
e://0001-Fix-kinds-of-build-failure.patch</a> \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt=
-link-freetext" href=3D"file://0001-Fix-build-failures.patch">file://0001=
-Fix-build-failures.patch</a> \<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-=
fix-build-failure-when-systemd-is-enabled.patch">file://0001-fix-build-fa=
ilure-when-systemd-is-enabled.patch</a>
            \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
            -SRCREV =3D &quot;0f2d4cfffada6f8448a2cb27995b38eb4271044f&qu=
ot;<br>
            +SRCREV =3D &quot;f595ea29d1007ca1c3b2d1fd3a88adf7d3db6320&qu=
ot;<br>
            <br>
            <br>
            &nbsp;PACKAGECONFIG ?=3D &quot;${@bb.utils.contains('DISTRO_F=
EATURES',
            'systemd', ' systemd systemd-watchdog systemd-journal ', '',
            d)} \<br>
            @@ -71,4 +71,5 @@ FILES:${PN}-doc +=3D
            &quot;${datadir}/dlt-filetransfer&quot;<br>
            <br>
            &nbsp;do_install:append() {<br>
            &nbsp; &nbsp; &nbsp;rm -f ${D}${bindir}/dlt-test-*<br>
            +&nbsp; &nbsp; sed -i -e 's:${RECIPE_SYSROOT}::g'
            ${D}/usr/lib/pkgconfig/automotive-dlt.pc<br>
            &nbsp;}<br>
            -- <br>
            2.34.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#125309): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-devel/message/125309=
__;!!AjveYdw8EvQ!fmJmsXD2akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFU=
rDjJw65Kupu8DEeN5lIJ9JY_lTcpng$" rel=3D"noreferrer" target=3D"_blank" moz=
-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-devel/message/125309</a><br=
>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/118361368/1997914__;!!AjveYdw8EvQ!fmJmsXD2ak=
fD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9Ja0U3h=
mEQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
              https://lists.openembedded.org/mt/118361368/1997914</a><br>
            Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
              openembedded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!fmJmsXD2=
akfD3VqMOEuB1I-CCAopwZL4-3gUYGEIUBFG2egwgKCnWjFUrDjJw65Kupu8DEeN5lIJ9JYLU=
GtJhw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
              https://lists.openembedded.org/g/openembedded-devel/unsub</=
a>
            [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" moz-=
do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com</=
a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------T0abBy6SYssXQlcQ8YRqhlXZ--

