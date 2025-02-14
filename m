Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BE0C021A4
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 01:39:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10638.1739497182558066614
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 17:39:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4140fc9f5e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E1ZPuS008197
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 01:39:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwvdks97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 01:39:41 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51E1cWKD011990
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 01:39:40 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwvdks96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 01:39:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oor8KfUjw0U8QLlTgECTUwk5xZmRvN/wD1PxV/p50RsuZwn5VFz8G1ZNZLli7CnGa7hKtisQHgsAWCal4k2Im69lFkhPhvfZRepgc0uPjrbNQP3Kvpl1QRj4OEVzknbsBo3XIND8C9K7E1onrS91Ja/lD0ujJ6Vq2qzQjImvu67SPCu3B9GqY4bItTur443O7MBSbRHTHLkpTulrJFnNOHzF1ucN/VrR67lBP2JkaBh8cdmRmOPI5/TtsdwDvtIc7db4djFmGEu9d7tAYq35tRgFaKSLc9BFZ5dxRC9GRTc3TzRx4RAUnmu7y2ZfDKB6fFv1L7FIkKW/VdpT5iBEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GnVpn14zOpYfOzZDyhmhvZ9L46DxQC+PBWQ52vtIzjw=;
 b=O/gf7cpU8p5F8GKAXeKCGVfK6sH+UfrJhkOsCetjbcX3qKmaJY+22qB1kA2mPZj4Dei8tEbn1tQ/gHtUs0oqHDuiiqDhhJT+pzCecW04NecBWaxCsqWrVHagN6n4neo35RQefxOZBEbr5kGUl5vdnXvDS+6opyqZm8yLBqpnXCNKC6im+kkDTSkvbXz93JKhfC5lSpcHcdacwbi54tFGhWdB/6UF5lB3KUFTqWJSZulttJbJtfBmGm/3fgBr0oEBzzwBzsoPMPzQnpZzfyQeNssWNQJ+WIs5krYkdAgM7EUPtIu42wA6geqm7h2LU5FafqROU+TABMtf4OHp0jD7UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB6351.namprd11.prod.outlook.com (2603:10b6:8:cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 01:39:37 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 01:39:36 +0000
Content-Type: multipart/alternative;
 boundary="------------dtyt5o1VOeyfLgTREXU1w0i2"
Message-ID: <1a95a6c4-d66f-4c83-beb2-9a03010564d6@windriver.com>
Date: Thu, 13 Feb 2025 20:39:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] corosync: reproducibility issue
To: Khem Raj <raj.khem@gmail.com>, gavrosc@yahoo.com
Cc: openembedded-devel@lists.openembedded.org,
        Yoann Congal <yoann.congal@smile.fr>
References: <20250213215039.108265-1-gavrosc.ref@yahoo.com>
 <20250213215039.108265-1-gavrosc@yahoo.com>
 <CAMKF1soyUgrg50gFZhYoacssSaqb6Jf-EfC-Yzh0c3SmU1MwYg@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1soyUgrg50gFZhYoacssSaqb6Jf-EfC-Yzh0c3SmU1MwYg@mail.gmail.com>
X-ClientProxiedBy: BYAPR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::23) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 777908cb-25d4-4cd8-150e-08dd4c9870ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a1JrS01Lcm1XMisyZWN3OEo3UE14dUlKcmFzbndWRWNiMWw5YzIzSmJWZlpO?=
 =?utf-8?B?YWNjRnlzYmZnVmI5WTlaVUdZR1lNVWhyMUh1VkVXQkg0ZjZQbFYxcWd0N1NW?=
 =?utf-8?B?dW5RWDd6cGpYc2ROS1lsVDRRRytRbjZKYVlHanJ5OGhXVDBZMjZqdXBLK0x5?=
 =?utf-8?B?eVJZWGliVW9rajlaVWtIRWE0aDhudENnNXkzaituMjlBT05zcGhLbEJERXZD?=
 =?utf-8?B?MWhiR3Z2Sk9BRk84VXdUZ1VsdUFyazlvTVNTTGhyb2JBK3FSTnFJaStyaWVM?=
 =?utf-8?B?aFhCa1BDV1Z1OWdQdlcxb1ZVVEttN2RwUzRmSUgvZS8yUDZzamFlZ25vZDNE?=
 =?utf-8?B?c2VLcGZhMVM2cU1zekhRN0hPS3orYlJma0FUeFhWRWk5aUdkU0h3eWhHanBj?=
 =?utf-8?B?SWxpS3l0R1F0dVVmTjZtMWZwYjFzQUhpZ29nYUw2eEJxNlhsVTM1cmRBMWda?=
 =?utf-8?B?MUIxcmFsbFJOUy92Uy9OU250QmZ0bVo2WDZrdnMyVTNidGVXandLaXRQakgr?=
 =?utf-8?B?WlRBTFU4aXRxdEVQREttc0g4bHZrOGd5N0pCS21tNTZ0aFA3Nmx5bGNscVl1?=
 =?utf-8?B?b3VnYnVPZzR5cEtEYjZvdmc2eG50VitSdnNWMkJEN0tMRllobjhXNFQyMWFr?=
 =?utf-8?B?MHlqQ3Zrdll5bXdGMjVmS3Mrak1IUmxuM1lTT3c4d3BuWnhVRzNsZ2Foek1w?=
 =?utf-8?B?dWpheXBBY3ZmQjVpeDV6WVNaMHpXOHcyNWNQQzZyNVVVck5MRXVZMUR1bzFF?=
 =?utf-8?B?QTBDdkpiUlowK3FUNGQ5elJOU0dVNWFCUUJQSFdNQS81OHUxWGlxNXpuem93?=
 =?utf-8?B?MDJOejJVT28zNi9PNnp6eGhkZ0pSbG12aFZJVjVsUHhrNHdNTE9Ca1BnVlJF?=
 =?utf-8?B?VmI0cFk4UnBrK1J6NVk0VzNGNXd6UDMvWHloVys1Uy80amtTRmdXcWxaQ0xV?=
 =?utf-8?B?TEhJaEZab0lPMFVGTkgzb0daWFdqU25tYmQvYm1IWE9HMHU2bm1UaUdCajhi?=
 =?utf-8?B?cUJVOGZwZ1MzQ2d4U0pSNk5IS1VhNkl6TE5wSlZ5VExTSU0zK1B6MW4zK0VM?=
 =?utf-8?B?TEVPSHdWVjVEWVR5U0VIengvZDEvbCswYkk1RjNLeGNEc3ZIcE9Pc2JkeGd1?=
 =?utf-8?B?NFR4MWZNUDdIcUhlcThoR0RKV2VrZnVYd1FManVVcTgxdUIxUzlWcUhZYlJT?=
 =?utf-8?B?Q3NON3RScW82ZnpLUGFWcU5MdjhjMm1LeUxpQzRuSVQyS2RCSnpYM2hBczR0?=
 =?utf-8?B?TFRyZyt1TG9IcmxlOEV1QmJkMW5vNUxhUGR5UjBCcTVDci9obHhzdkoxbC82?=
 =?utf-8?B?NzFXNXovMkFQMzdsMkhwdUF0VFB5TmUrTHF0c2FnRmF1blQ5U2pPcCs0cXM4?=
 =?utf-8?B?MTB1S2JWQ3F2S2dDS01nTDRNZUMyampmU0hqRllKUU5WbnlrOTdrbkdNYlpW?=
 =?utf-8?B?TC8wc2ZqQ1U4K294cHJwTWxDcGxYVno4Vmo0eXRoWFhINHgzcER1R0tkQ1B4?=
 =?utf-8?B?OHFDbThpM0dTb1NyUjdQMGdsMmhLbWNubTgvRFBoMGFlYWovWUZ4UWhQWGRk?=
 =?utf-8?B?VkJzSzNjL2ZORUpQMEQ2c3VBOTBuUjA1c0lzd0dxY2Y0YkdGSTliVFB4eFVN?=
 =?utf-8?B?eXdDMGNJdmgxb3JWUHhXK3M2ZGNmZHhWcm1pclc1V04zdTJISm1qdmdQUHRt?=
 =?utf-8?B?ZmkwYnQrTytaeXhqSXkxRlh6dWZublRSWE5xQWxNNGMyQW15dVk4UmluVE9K?=
 =?utf-8?B?QU92bUZvMXJTcFVvY3hWU0syMXBpdlc0UStVeldaeGZEY2sxdWgxM3FDVkdL?=
 =?utf-8?B?NlRTV0FNNUkwNjV2VFpEZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aE5HUTV2Ynh1WW5pSXJFYnZWZmJweER5SXJnSUpxeWI0MXd0NjY0bW1va21H?=
 =?utf-8?B?aVBqR29vSm1FbnRpNzJwZWI0Nlk2cWkyMVoxQmY2ZFBRcUkxYklGeHJVYzJX?=
 =?utf-8?B?VmRuK05PSkJIUzVWM0c0QllZMlJmbTkwdW5yYmJxdXlVY1Bhc1JkL3pxdHZB?=
 =?utf-8?B?VUt5ZHBTZkF2aS91TC81WWlhdFcxUVkvS3NnZm1EWDMrTUpORFhMQmhCSkk2?=
 =?utf-8?B?QlhubXNMRFFFd1BUY1lnSFVqY1pSSGZIWWRNYzZJSldQWkdBb0lZRmpKOEtl?=
 =?utf-8?B?ZE0xbUt5VllNbkNWVzZBRHkzS1hxbVg1NnY2RWZmS3NpV1Yra0pGbmt5anMr?=
 =?utf-8?B?Zk5IQkRlSDNSdzNXc2F3Y2VsRFQ1bVhYZmhvZ0kyWUp6Q0tmRno5akp3UkFD?=
 =?utf-8?B?L2ZiVURqMjNWWk1VK1VlNE1NcGU5ekhvbzRwZUN6dTlHc25YMTZQaXkzYTJ0?=
 =?utf-8?B?WEhCNUEvdUhhTGVGUVBMZ2JwRzlIWThjRFIwSzZ4Witsc2Mza3dudXdHYmFa?=
 =?utf-8?B?azZWKy9JZWYrTzRESlhBMWcxbmYxZjBSdkJZYnZUemtiYmwxOVFOMVJONGpy?=
 =?utf-8?B?a2NVaFpMYWIwSUtvdnVDNFNRSEdUdW81aGdFMk9odHZ1ZWEzUkJnSzR5c0Vl?=
 =?utf-8?B?ZWlMb1prandWOWZPaUFFSWJQZ2o1dUl6QUt1a0o0a29CaXNnanhUWU9saEJQ?=
 =?utf-8?B?eHUwbVJRUkxXM29NbW5zMnEzRVF2TzhhWEs1a2NBZFR6bGVGRjlpcVorS2wz?=
 =?utf-8?B?cHlWem5XbThrMjVzNnoyTzErNmJlbzZNWk9ZcFZYQ2RSWDVjcVEydk1LL3Ro?=
 =?utf-8?B?Z3lyL0xKMlFqZ0JNSldDWnB4WWQzT3prcytuZHNRWWlWYW9RamZ4MDEwMUNF?=
 =?utf-8?B?UXZaaitOdTZsdW1YWm9ybU1hd0MyNGNyeEg1RTJrbFcrdDdKOGZKanEwOGhw?=
 =?utf-8?B?Ty9NUCt0b2wrT21DRWNrQXptK0d3NmZzY0lIa3FVbnV5eHUzYWpTdVRsMVlM?=
 =?utf-8?B?V3VQT2xSbkhqSTZoR3NSZUxqcDhVWU1qQTZwZEhaWmc2amY0ZUZIN0Q4VnJa?=
 =?utf-8?B?SzhHeDgzMFZ5NlR4ZzgyYkVVV1dJOUJDZW4vbURrYkFuRUJOYXZLdlM0YWlt?=
 =?utf-8?B?OFpmSEE4TksySHBjRm03N3FOSjlHcjFoM2c0NTlOOTBTMUErM0NGWkFTcWtV?=
 =?utf-8?B?aDVuNlhjeklJU0dzS1ExbE4zRWg3dlRQOE9YaDUyWnFyUS84dFJuVzFyeWFj?=
 =?utf-8?B?SE9RQWNXRWpRQkY5V21yd2wyek95WDJQQzRSbU5teUcybmZMK0tTWTZiSzlN?=
 =?utf-8?B?YUQ4Yk9qVThyMzBscVoycVBkaGNDNnVlUjU1VWxCcWE0R3V0bjJrZ2xmSU5R?=
 =?utf-8?B?SFozUVlybnVQa3YrNE1QTWk0WlU3WXdJRjdBdFpGTi9nUVk3Q3RpTWtDSDUx?=
 =?utf-8?B?dzRtdFY0RjAydkNrVklzQ1k0WFVaQjdqYlVnRFk3MXlwK2l5cUdJbkI1L1BQ?=
 =?utf-8?B?U1JTVE1POTYrMEhWbjlCOVI1MnZOR1BKNHNEbVBZWk5aK0tWQXpPaTU0Q3I4?=
 =?utf-8?B?cm1URG4zZ0Z0Q3Z2N29sc0JiUE1sc21WTTZ1OXhkb25LNzJNK1g0bExkLzhI?=
 =?utf-8?B?RnNkcEcxZlFJQ05Ga2NDY1ZEUTVrQUlQWElSb2xXbGtmY1dpK1Zzcnk1ZWNO?=
 =?utf-8?B?SmRVWjErNDVCT0JtSVBRekQ4aEZRdVgzQWV6RDZPdXl1M3Y0a0FxbkRPR1h2?=
 =?utf-8?B?dGNtb2x3WS9Rd2FHSmpaK1FEYVd4Wjk3UkZyUzNaVGY3L3RxSlE2NEFmRkNu?=
 =?utf-8?B?SkVMUk1MN0N6aTgzaFgxZlVSWjlKVDFaTS9KS2hhVmVtenlCTFdOOEhGTVFq?=
 =?utf-8?B?OFNIbmVBRHlyUjBHanlKUXFnbkkvZ3BiRjNQK0JWZHBpdFhuWUdiK3pXeHNY?=
 =?utf-8?B?bkV6SGFjL3BHMDE1WG9kUWZaV2Z2ODJiR0dNa3poVEpWZG1NU2Y1dFhaUzV2?=
 =?utf-8?B?UWtLRkdHNVNIaHFIMkc5elU2ckJ5cTZRNW0weXRaVko1c0tCMWc2dFJhaWli?=
 =?utf-8?B?TytIWThNdXI3d2dtdllsaVVyQWw4MjEvWGxqRi82aUpNQkxuNGNvQVRHV1V2?=
 =?utf-8?B?aHdLa1paZXUvTGRGb1g0VVdKOCs2NVg2T3EycTF5K0JCZjBXZkxKbEcvc1RO?=
 =?utf-8?B?TWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777908cb-25d4-4cd8-150e-08dd4c9870ba
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 01:39:36.8104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUmD6QkGVoH10XMRoRPN8JoolVyyKe57cGh0GkvIgPXC92sw81Y8vpmD1pIaXCJRuGqZjYZvn0IQ4CVlhtd6U2FHRFqpnxj71xIWKIesXCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6351
X-Proofpoint-GUID: UIrZp5vO0BpKHPRE2yiF_pbRGAj_lEKF
X-Proofpoint-ORIG-GUID: Wb2hDLA6YsH9ZP8_odQl84kPsG7lUHbL
X-Authority-Analysis: v=2.4 cv=K5bYHzWI c=1 sm=1 tr=0 ts=67ae9edd cx=c_pps a=98TgpmV4a5moxWevO5qy4g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=CjxXgO3LAAAA:8 a=A1X0JdhQAAAA:8 a=pGLkceISAAAA:8 a=tb8PgT_MqxxyUZZcw9wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ePREqihQE32G9Dh7NzYA:9 a=sr10BLLmGiiypV8l:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_09,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502140009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 01:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115474

--------------dtyt5o1VOeyfLgTREXU1w0i2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51E1ZPuS008197


Thanks for the patch Christos!



On 2025-02-13 5:08 p.m., Khem Raj wrote:
> On Thu, Feb 13, 2025 at 1:51=E2=80=AFPM Christos Gavros via
> lists.openembedded.org<gavrosc=3Dyahoo.com@lists.openembedded.org>
> wrote:
>> Corosync is not reproducible due to change of value
>> in NETSNMP_SYS_CONTACT which is set in net-snmp:
>> NETSNMP_SYS_CONTACT =3D "$ME@$LOC"
>> $ME =3D whoami
>> $LOC assigned domain name from /etc/resolv.conf
>>
>> Use build in'--with-sys-contact' to overwrite it
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/30/=
steps/28/logs/stdio
>>
>> CC: Yoann Congal<yoann.congal@smile.fr>
>> CC: Randy MacLeod<randy.macleod@windriver.com>
>> Signed-off-by: Christos Gavros<gavrosc@yahoo.com>
>> ---
>>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4=
.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>> index d4945e482d..b364edc065 100644
>> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
>> @@ -63,6 +63,7 @@ EXTRA_OECONF =3D " \
>>       --with-persistent-directory=3D${localstatedir}/lib/net-snmp \
>>       --with-endianness=3D${@oe.utils.conditional('SITEINFO_ENDIANNESS=
', 'le', 'little', 'big', d)} \
>>       --with-mib-modules=3D'${MIB_MODULES}' \
>> +    --with-sys-contact=3D'no-contact-set@example.com' \
> I wonder if it could be made configurable by distros ?

so make :

no-contact-set@example.com
  be a variable NET_SNMP_SYS_CONTACT or similar and assigned with '=3D?'
and use it in the --with-sys-contact.

Please try that and see if it works for you Christos.
If it does, send a v2.

../Randy

>
>>   "
>>
>>   MIB_MODULES =3D ""
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#115471):https://lists.openembedded.org/g/openembed=
ded-devel/message/115471
>> Mute This Topic:https://lists.openembedded.org/mt/111171727/1997914
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------dtyt5o1VOeyfLgTREXU1w0i2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51E1ZPuS008197

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">
      <p><br>
      </p>
      <p>Thanks for the patch Christos!<br>
      </p>
      <p><br>
      </p>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2025-02-13 5:08 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soyUgrg50gFZhYoacssSaqb6J=
f-EfC-Yzh0c3SmU1MwYg@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Thu, Feb 13, 2025 at 1:51=
=E2=80=AFPM Christos Gavros via
lists.openembedded.org <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
gavrosc=3Dyahoo.com@lists.openembedded.org">&lt;gavrosc=3Dyahoo.com@lists=
.openembedded.org&gt;</a>
wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">Corosync is not reproducib=
le due to change of value
in NETSNMP_SYS_CONTACT which is set in net-snmp:
NETSNMP_SYS_CONTACT =3D &quot;$ME@$LOC&quot;
$ME =3D whoami
$LOC assigned domain name from /etc/resolv.conf

Use build in'--with-sys-contact' to overwrite it

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/87/builds/30/steps/28/logs/stdio">https://auto=
builder.yoctoproject.org/valkyrie/#/builders/87/builds/30/steps/28/logs/s=
tdio</a>

CC: Yoann Congal <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:yoann.=
congal@smile.fr">&lt;yoann.congal@smile.fr&gt;</a>
CC: Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy=
.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a>
Signed-off-by: Christos Gavros <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:gavrosc@yahoo.com">&lt;gavrosc@yahoo.com&gt;</a>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index d4945e482d..b364edc065 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -63,6 +63,7 @@ EXTRA_OECONF =3D &quot; \
     --with-persistent-directory=3D${localstatedir}/lib/net-snmp \
     --with-endianness=3D${@oe.utils.conditional('SITEINFO_ENDIANNESS', '=
le', 'little', 'big', d)} \
     --with-mib-modules=3D'${MIB_MODULES}' \
+    --with-sys-contact=3D'<a class=3D"moz-txt-link-abbreviated" href=3D"=
mailto:no-contact-set@example.com">no-contact-set@example.com</a>' \
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">I wonder if it could be made=
 configurable by distros ?</pre>
    </blockquote>
    <p>so make :</p>
    <pre wrap=3D"" class=3D"moz-quote-pre"><a class=3D"moz-txt-link-abbre=
viated" href=3D"mailto:no-contact-set@example.com">no-contact-set@example=
.com
</a>
 be a variable NET_SNMP_SYS_CONTACT or similar and assigned with '=3D?'
and use it in the --with-sys-contact.

Please try that and see if it works for you Christos.
If it does, send a v2.

../Randy

</pre>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soyUgrg50gFZhYoacssSaqb6J=
f-EfC-Yzh0c3SmU1MwYg@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre"> &quot;

 MIB_MODULES =3D &quot;&quot;
--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#115471): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/115471">https:=
//lists.openembedded.org/g/openembedded-devel/message/115471</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/111171727/1997914">https://lists.openembedded.org/mt=
/111171727/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------dtyt5o1VOeyfLgTREXU1w0i2--

