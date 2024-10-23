Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D600D2E009
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 02:15:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10605.1729649731538811403
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 19:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0026cced91=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N0r4Zw024694
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 19:15:31 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42c823v7v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 19:15:30 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49N2FUrp013683;
	Tue, 22 Oct 2024 19:15:30 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42c823v7v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 19:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3wTn6ILzwfTePs95zP9PPDK5BKW2E65aZ3VTfezgYmjkIrw+Hwvgak8yyO4cbIg3habGtCSqSYHmXu2U6dcvIdX8oin7YzeP1EUIkXOBETnP6fNTmKMNXHP6rrLs26Sw42ukRMg9+3CKRYL1lgDPKgbBrsYM49gGR6KOAe21VRNiIm6CpwhM2dH4tcZMALfS7TqTnwC99qdP0KgjpV2jDUtj69n93P6MAVvnPBrKu4N81w2zZLabKNu2oS2d2+Vp9+n9R8UcOKImiPp6+Wp8BTzmLWxghBXsz+SQ8Q1bJC0X7hoCTNdvgafzuN9+5kr0VqwaPvDftGfQGVRr/HnoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTL9f+AI0/obhY7WxrpRleoH4Iqki2nYUWm1pioPDZc=;
 b=N862SbWHhl51Ay4qzjs68z9xR7GfbYVGRrJTBQ6+iV0PoEt37DHW/WkbA2N0hAOr1BRTwo3A+7dXojRBduUeHWzUx1+SUQtsllyVnMq1+EvAcddg35nD+KLjs3rhnucVyLO4DEQwnbKzy5S5NzJzi/pmVcqJEDEFyURqQ7HyQMRoZoE7x2Yf9mjT/CiqhLx3CUeTi85/XMoLzh4KCzDN0Un/IiVdibRuCHhjcPoSg8ImLX8fwGsXjBithQJSprnTfMQ4YeDJXFwI/U1CkzeaZQjvVyIpjP7lDODO1/MhcMj5RDvwMmwGk6nqw6omU8QkdWNlb5xmeMHz4qrvF8SkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CY8PR11MB7730.namprd11.prod.outlook.com (2603:10b6:930:74::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 02:15:26 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 02:15:26 +0000
Message-ID: <573b9ed4-d62e-4967-a15f-63c21635ab85@windriver.com>
Date: Wed, 23 Oct 2024 10:15:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] mbedtls: Upgrade 3.6.1 -> 3.6.2
To: Khem Raj <raj.khem@gmail.com>, mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20241022101526.4114268-1-mingli.yu@windriver.com>
 <CAMKF1srbzr5Y=ojBORL27GunwUAbb1ezorbZ1fAuW3yueCW_fg@mail.gmail.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CAMKF1srbzr5Y=ojBORL27GunwUAbb1ezorbZ1fAuW3yueCW_fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0246.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::12) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|CY8PR11MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a784a8c-02ed-4975-4398-08dcf3088eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?LzJmMVFySDhUUmtrWEk0M1RVd2xaQzZ5QzUyVkh6djVscFhOOU03NkwvaTVp?=
 =?utf-8?B?WWlXMGZKaktqK0NQRzhvYis1eFdJVkIzNlVJcnJqUC9XczVwSS9TQ3p1UTVV?=
 =?utf-8?B?WFdwYTBjZVVZSGtNZVFwMzhyYWVMMVk2WVhvaUNHekpLY010ZThPKzc3bm82?=
 =?utf-8?B?OTNqYzFLazkwZkdZUUZROXdENWt5bWwvMnlVS1dWTTlueGZRVE8xL1lFUDh0?=
 =?utf-8?B?dFNLNzZ0QnlJSVg0Y2RPa0xpM2JCbXRmOUVKczl3TUNtM1R2aW9BRUJaK1ND?=
 =?utf-8?B?eG1aNEF2SmQwVldQMGFvU1FZazg4aERDalljVG1rMERNeklzbDNPYmExQk0y?=
 =?utf-8?B?MGlpMi9jdUZXN1d1cmwvS0tQUVdLRFpHWTFPbUZwUTlFb2FWNUIzaGlnZXhB?=
 =?utf-8?B?aFBPRUJlT1IvSHRKTjJpRm1rQTBVQ2xPWnZiRGk0NFpPKzNWM256R0ZOOENu?=
 =?utf-8?B?cWhGZUsrTTFyZGZBOXc3cVVvZE43RmNyTFJDaWlYM0JITmZRTGlFUmR2UGVP?=
 =?utf-8?B?VkIyTFNXYzl4QWZ3R1JiUHdVcmM2TGYxYVlpcXhjdHlpK1l0TlVxejlQUFVo?=
 =?utf-8?B?dUh5cnh6OWFaQm9DdTk4bXM0VlcyTHR4UXFsR0tRbTl3em1rNU9yclJ3cnIx?=
 =?utf-8?B?cGtrSEVXSlFxdDVMSEZKNEZWbVVhbURUNnRrUVpDNjV4MEJvZGpvYTdLT2Z2?=
 =?utf-8?B?VEg0SlVBUmNPWm9pcXdmVnlQSUZKT3ZocVlsZTZmUzhFa0FlZHE4MThMc3hq?=
 =?utf-8?B?cktKSzZpaFdMUmh5S1dSWk56SjF0MEtwMTRUV1h0SGR3aTNSQ1FMdGFoRWRk?=
 =?utf-8?B?SEtxT2ZFMkh2YkROU0M0RFdyUUxGVGkwQ0hvVGU4eCtLZ2FENGo3UmZEckk0?=
 =?utf-8?B?WlI0bUNuTVYxS2FmOWNQNG4xYWR0R29mdzJnemdjU3hHZndQZ2VxaU9tS2Nq?=
 =?utf-8?B?S1dpNjRGMm1OU2FPOUlzMS8yUzFHVFhKNjVYbWtQek1ZbnRxWml2Q0JVQVJY?=
 =?utf-8?B?ZE5yeEt3V1NxVGIvbk1WN0ZhL0RObWlUV2FRSEJQcXd2UE90dVRBTVVRcmVl?=
 =?utf-8?B?Qjlta0FnMG9YeWFPUnJHZDdyVmdneWl4aWkvd2M4RmVJdmJkU1Q4eTI3MFFI?=
 =?utf-8?B?RG1wRnlLU252TE5hTitZL3lzVXJrSmZlR2ZpTFk3QkFpWVc4bkp5N1hjQWRF?=
 =?utf-8?B?MkFMMmJrdnZMNnJmSFZ5WDg5Mk1McXJlRGtkTDBWem5wNHcrZkRId3JOQlZ1?=
 =?utf-8?B?TnU3ZlNtM0pTSFV5akFteGY3cG1zTDFUZHlsNUZoRUR4M01NL2pHOVF5aDk4?=
 =?utf-8?B?bENHQm1xSHQ0U3pDUzhwMzZURUtKK1BadzIvbzd6V3puZFJzeGtiZzRhbW1t?=
 =?utf-8?B?c2F0eXVZeXVQVEY3UElZSytzN0wvL2ZMV0JaWm4vNzhkbmtXZGwzQ3RSQXpL?=
 =?utf-8?B?RTVxNDV3cnBBQXg3Vy9NT0I0TXkzaUIvZVA3d2lieXhaKzlYNGdSS2wwVDV3?=
 =?utf-8?B?NXpldFVrSEFjYndKaEFkNk9Hb2lGWERYSE5RbUQzL1JHem1vbGVWZ25oTG9I?=
 =?utf-8?B?a3REcFVRM2Z1RjRWVzVrS1Mvc01CaGxsViszbDQxRFMyWmd2dk0yUDRtcDRu?=
 =?utf-8?B?OVN5eWk4V2pMVWZjeTFrVW5Ic09ZRmwwWlkyQ2ZHR3B0VGI1WWlqR1RWaWFF?=
 =?utf-8?B?MXEzNTY4M2RRTFl3aXppakJyU3RBcnpuYm1SbHFlenRkT3F6TWtmNlhmRmdw?=
 =?utf-8?Q?wLQFU0DsI41Mry+tiIHN/r5N1NY66DqMeDHjygV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a1hXSlFMT216N1NqNHAvd2pLVUZITlAyMnl2ZXFYQ0MzaFpNSkdFZW8yQnFW?=
 =?utf-8?B?M0ZXVHo4RWZYN25RcjNNUm9lZ3F4cXFTd2lsVWQzQU9KWjlCZExTVG1zSjc4?=
 =?utf-8?B?c2YwcWtuYjNTcXRIcHZjVzcvaFhJTG5HbklvQ2JMSDBhNnNZNnNqTnVPb015?=
 =?utf-8?B?U3o4T2xFY1JYSEszZXMwQTF6UnpZYWFXd1l3WFBnbGxRYmdrREpjZWltbjlm?=
 =?utf-8?B?eGJ5L1g4YW1YcDBTSmdjeHRCQ3pKWTBvWlFpbndSZTczam16aGFOZFBFUGpZ?=
 =?utf-8?B?R25zRm9sQTZSZlczT3RxY0JlK2RRNHd0TTdrZDNVOVVuVUhnTHk1S3RjcWMy?=
 =?utf-8?B?ZWVBZEpYNW1zYzkydzVTL05nQW9FenF6R1h4alZ1UXg3anMzcVF0eDI0eGYr?=
 =?utf-8?B?SUI3dzBXbEVmMXAxeGFaLzd6NzY5bG5mNEkvRTE3MnI2aW9LYUlLMTBhZWV1?=
 =?utf-8?B?WXpjdVcyQnVBSm5ReXl4V0Q5SjBsQWdVUlkrYS9hcFhjZTh3TWRqKzJOWXFt?=
 =?utf-8?B?dUFEV0d6ZFE5c0Y5ZzRRUjIvRGhjWW9IRTlzOGd4RGRsUXk2OGMxV3NDaGlX?=
 =?utf-8?B?OFV4UVFaSzNJaTc1QmtmRUF0YXg4dzEvdFNQdDl2MVovZWFtajJCNUZFRG5D?=
 =?utf-8?B?OFpvNk1QV2hBaGFQdWFVT0M1MmZzVmtSSENwamtOS1hKMzNrVG4rcC9wQUNB?=
 =?utf-8?B?anF3UFIxQUFRZnhtVWF6emYzYjh1TGVYVStmWEp1aDYzQi9KNGVWanpBZzdH?=
 =?utf-8?B?d1RQbkx4Tm1yNE9uMDI0MFkxbzhhcWdrWFRyVmN2akRHTVc5azBIcXNnNko5?=
 =?utf-8?B?RHdFd3ExMEJOWXZoYjZpNlVPTjVYRG55SElGaGVhS2pPUjhVWjlTN0EySWxY?=
 =?utf-8?B?WlFjajd4cDRBbVJUY25BY2ozMnVzaEdkMW8yTkNHdTJRelJQbjhBc0F6OVNG?=
 =?utf-8?B?UGtCdmdldmxoTk9Gdy9uZTZaMXNRWXBBVDl6RGFzK2N2MTRwNlN5Z0g1K1Nx?=
 =?utf-8?B?NUZqQzZFUGU0TlhEUzdWZjZ4L3hXY0pPaXNCSHhvVjRKMytSaXRBT0ljMzVh?=
 =?utf-8?B?UUhXaExjVE9ENHZZV29oQksxTlJJcHMyRnpiVW1TNkVTYTgrSWhSVFZ3WnFO?=
 =?utf-8?B?OHZDcXJQZmhpc2crSHFuM2Q1dXNKZU5oVFV0aVVIaGUyZ25RenJXWWdKV3c1?=
 =?utf-8?B?TDBNRlpCbkJza1RVTGJtQXZicmlyaWdXeW13dURVYW4wdEswS0VYemdtUXlt?=
 =?utf-8?B?VUJ0dW9ER3lWQ0VaVzFLb05HbVNkL2FGZUhybWJxQ0d6aDMrYXYrc0NKanJH?=
 =?utf-8?B?L2xzMFpuaXl2TEFJWFlyclRXSDhBRHpGcE00OEVpdUs5UDRBQmIreFhvdmhi?=
 =?utf-8?B?QXdtTC9WRXk1NlJNaVFiZUtiSnFVOXJZSkswSytEeDMyanowdmpPa01UZWl2?=
 =?utf-8?B?TWZ0bUxjYUFJK041RStWUktBNmlYZUxwclljMFBkQkdYMXFUVklnUFRkTFln?=
 =?utf-8?B?V0lTZG1sVDJkWll5OS9zRkZBY2xraWZRYmdpekRET01qNmdjWmFlWnJSYkhz?=
 =?utf-8?B?YUQ3TzFEWUhIMk9mVlk3RTVWZEovOVVxT0s4R2xYUmVQSjZFVGZOLy8xMk90?=
 =?utf-8?B?bXNRSjhVeVU4Q05DVTBrN2Q5K2krcWd5ZmZVWk5PVUF3eUdzOFRQU1F5UHg4?=
 =?utf-8?B?YWRYRTFMZWRZU3RrMDlCSDBqQkYwVmFjRzArN09kUUwxdC9yY3I5cmNaN295?=
 =?utf-8?B?STJyTSs2WmtXQmNsOWV0Sis4K21zOVRhOWRSMFhrcHltTE1vZk4xOEtWU0ZG?=
 =?utf-8?B?bHVYQW9VYnhOZEdNV0NlVSt4Z01oUFpoU3VySGZKRy9rTS96bitPM053YXB6?=
 =?utf-8?B?RXNkYnlqSjhMYURZdm5JUGtVSXB6Zml3cStqSXdHcWtWVFpscjg1OVloOVBj?=
 =?utf-8?B?cG9vc1h6N2tYaTROOHM4UHgvaUtTZkNUSzRhZWZ1dGRvOVoxazVXdnNwUlBM?=
 =?utf-8?B?VHFHbmZacE9sS1ZPbHVBWUZMcExiTExRUnRPRWVJRkE3czlMS090eC8xQ0tk?=
 =?utf-8?B?WWdVK3dMQlgzRTV2TDlyMC9Cb3J1bStOdmo5VkVuS1FCbldwbnAvMFVKdUl5?=
 =?utf-8?Q?VSLibMGw6UGaTYulDdLxV6x4W?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a784a8c-02ed-4975-4398-08dcf3088eb9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 02:15:26.2292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6D7jEo7LLUtA7XQgEeTNwEi4gnTFY0mVZE0qyyFR2x+dvdAI5UhUruEcavWQ4VflmUSh/gNWytzeaaXYEtjbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7730
X-Authority-Analysis: v=2.4 cv=UrgxNPwB c=1 sm=1 tr=0 ts=67185c42 cx=c_pps a=/1KN1z/xraQh0Fnb7pnMZA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=AlcqTsvy5AhoH0IYLYIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: N_1szpq9P1Q0gWeBhnnAwTAODlH7kHR7
X-Proofpoint-GUID: sbiZER8HM4N3tXH7P_79uF74TfreiiEP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_01,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410230011
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49N0r4Zw024694
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 02:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113138



On 10/22/24 22:11, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On Tue, Oct 22, 2024 at 3:15=E2=80=AFAM Yu, Mingli via lists.openembedd=
ed.org
> <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Mbed TLS 3.6.2 provides the fix for a security vulnerability [1].
>>
>>   # ./run-ptest
>> PASS: test_suite_aes.cbc
>> PASS: test_suite_aes.cfb
>> PASS: test_suite_aes.ctr
>> PASS: test_suite_aes.ecb
>> PASS: test_suite_aes.ofb
>> PASS: test_suite_aes.rest
>> PASS: test_suite_aes.xts
>> PASS: test_suite_alignment
>> PASS: test_suite_aria
>> [snip]
>>
>> [1] https://github.com/Mbed-TLS/mbedtls/releases
>>
>=20
> Other than commit msg how is it different from prior patch
> https://lore.kernel.org/openembedded-devel/20241021093900.3891154-1-yi.=
zhao@windriver.com/T/#u
> ?
> its also from your colleague at WRS

Sorry for the noise!
I didn't notice the patch from Yi when I sent this patch.

Please ignore this patch.

Thanks,

>=20
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../mbedtls/{mbedtls_3.6.1.bb =3D> mbedtls_3.6.2.bb}              | =
2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.1.b=
b =3D> mbedtls_3.6.2.bb} (98%)
>>
>> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.=
1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
>> similarity index 98%
>> rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1=
.bb
>> rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.b=
b
>> index 62c3add2a5..168ee1b5de 100644
>> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
>> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
>> @@ -27,7 +27,7 @@ SRC_URI =3D "git://github.com/Mbed-TLS/mbedtls.git;p=
rotocol=3Dhttps;branch=3Dmbedtls-3
>>          git://github.com/Mbed-TLS/mbedtls-framework.git;protocol=3Dht=
tps;branch=3Dmain;destsuffix=3Dgit/framework;name=3Dframework \
>>          file://run-ptest"
>>
>> -SRCREV =3D "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
>> +SRCREV =3D "107ea89daaefb9867ea9121002fbbdf926780e98"
>>   SRCREV_framework =3D "94599c0e3b5036e086446a51a3f79640f70f22f6"
>>   SRCREV_FORMAT .=3D "_framework"
>>
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#113089): https://lists.openembedded.org/g/openembe=
dded-devel/message/113089
>> Mute This Topic: https://lists.openembedded.org/mt/109149384/3618448
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [mingli.yu@eng.windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

