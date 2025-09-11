Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE6ACA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 04:16:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38303.1757564204498597454
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Sep 2025 21:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FrPELata;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1349c2a0f0=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58B4AfX23261718
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Sep 2025 21:16:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=SaeNBgq/0vuXxv2Sh+G575
	n31IN7zEFnDmHDIVVVQHc=; b=FrPELata9NBptb3eAGVqOrQ7e6RZB6/krRAfgM
	3en83eUODhvk22mLVJWY7BPe+R8w/KQMC4hG7cxgwo/sIciPB/J2pylEikaGmb9D
	zcSRGjf1djiKMhzfsa2N7nMD0Kge+hKytfJ7y5YJ6w3lIfkRSIkx/DiN7JIToUHu
	Ntj2yqpRHY1IQn+moRbn8/quNzP8wA2lQKcBB42YBtD9sORt9uTLBZ37RfTaop5N
	+z/3+GmRT2rySr0qyk2EAwScDq2fdAJtqndWDTYAHmFUxUc+0FNO4NawQADFE48G
	r0c/m3vOCH+GHX4GmXk7iDKbhl1e1c9Ad7XB8GGMJ4cUcZXA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490g80d4yc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 21:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxwlvZNp6F76XslHRt3PyXzz51J356Bd6+LNuScCl520/e798Gpkh3RuOA3+fdSDiejNTmgYozh8mGTiP0rJ3dAz+ST5lEk8NfFYjambGLpSZ1TCeD0YqHVSBMUnV+TRlcqnVtfR2y/qcZqbBVfoWlE51alnMG3E4a6J1nEuPclBreAD9R8Z5pwsZ0ntwRm1yOLyt3CEDjl6UPslu6mOEkhnLtNpr0LyBKqB+3xhiKouxxdUwGJugJes13kCdwV3w65axAogIJfElJV85uIOgrxcnWLVGEpLIk7YRDrjUYAqMMmZjKUX+hEvp2ZfrK8BoGUdDtra4EtF0T5vRtixng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaeNBgq/0vuXxv2Sh+G575n31IN7zEFnDmHDIVVVQHc=;
 b=eDbaXghwOil6u9qKgUH9M0q9+KyP2IfSt4XNsP6o5p/1qNeRPiURBl76Ub5G8DPXAHZnQqQoRibua2oo9pJtRQ00DZMTOfX+MqpbeNIlQH8k43gK+agakKCxm0mh4m8gjjzGMXnC2GGFbE1xaBfYAEqKXzJO20HEZ6p5zzxh0GmvdSeprqqaZF4t0l5ECV729BFsPX6Up/fP6Aj4vPnqujx4JL/zs2ocJBUqQouSI9BeXcrszuzsixmsOItSmF/HqM5evXCS6cn2aYkOUlPTdFH2YcbRHgQm3eN6rYJ/wEIOEy4ExGHVvBE9OLfC3k6MWLz3qzQNTPYIqmK2spqUrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH3PPF73E424DB7.namprd11.prod.outlook.com (2603:10b6:518:1::d2e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 04:16:40 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 04:16:40 +0000
Content-Type: multipart/alternative;
 boundary="------------qFQHOHchJlGBppT2xD0utmmA"
Message-ID: <01c77da4-06b6-48c9-9a50-f49e96d0ebb5@windriver.com>
Date: Thu, 11 Sep 2025 12:16:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][walnascar][PATCH 2/2] libwnck3: fix build
 failure for lib32-libwnck3
To: skandigraun@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250910152923.859295-1-skandigraun@gmail.com>
 <20250910152923.859295-2-skandigraun@gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <20250910152923.859295-2-skandigraun@gmail.com>
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH3PPF73E424DB7:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a46f032-c89e-465d-fb6a-08ddf0ea01ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|13003099007|8096899003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bVVDa2NCNC9JYTBMQ0MyTWxWV2hHYUx3empDU3ljejI4b0RiRmhEV3BBQ2p1?=
 =?utf-8?B?dWZvQnVBWEZhSE50U3BIRCsyMlRkNFJlQUxIbWVvaXArTzJPS3c5dWFibXll?=
 =?utf-8?B?QlVKSzhDQmVId3RaU2tFN2s2T0RFczUvUU80bGRnNVBNRmp6bnVnVGdIQ2F6?=
 =?utf-8?B?T0c2UnFReFkrRlk2K1BRZFNMbmk3RjlOSnpVVlhROFY5YndMclNTQWl0Q0xF?=
 =?utf-8?B?NGovekt3T205bG0zbzl6MDc0Z1BTMkg0MURMUVlFaXFhMlNqS3N1bXZRV3o2?=
 =?utf-8?B?cFRVKzRZNHVZUEtDM0p1RHRlbld0OHNoQldVMmNLVTVWVzk1WHVpcmFqclJP?=
 =?utf-8?B?b3lpMWlzZTVjMUQ5eFdnb29LNVZ4Y3cyeEsyeWsyd1lCNXk3QWI3YU5BZDN1?=
 =?utf-8?B?OXJCdHpJdWlrNGNhMk9YWVlFSm1SWXJ5a1ZoVjIwbXFzbkVpODNkc21LM2Zq?=
 =?utf-8?B?c1pxNURtTVNIbjlnQnEzYUxDZ2xUTDY0MTRzYmc5aHlyeHNjVm8veUFQUGtE?=
 =?utf-8?B?QTBGQldBRFozZzh2Z2p3Nm9uTmlsZmFpMUljQnVkaFRmd0JybHVqSWZheGFJ?=
 =?utf-8?B?dnVEd2Nzd25FQXhJS1dDMVJ0Q2dYaDRIK0p0V0taVHZ1ZG5IMkpXTjNta1Na?=
 =?utf-8?B?L0N3ejQ3SmRSV2E3cXlmYndLR1ZUdnpCbnI0YXRubnVyVXVXMmY1QWJaTW5J?=
 =?utf-8?B?ZjhncU0vMng2RVN3YUlQQ0Q1bVg2L2ZXTXFMb2gxc3dkYXhBVW4zMmtWTFhs?=
 =?utf-8?B?TFQ5MUwyRkNGUGozcWdRSlVVZjExNzVyQ0ZuM2EyaGRxL2NLR0h1bTR1cVBw?=
 =?utf-8?B?OUg2VzNIUjQ3WFZMdFUwaE5Rd3BqYktaTWhLM09MY3ZPUFNVZGQzR1RKMTFw?=
 =?utf-8?B?TzkxUkpkd0FpWlBheFJIOWkrd21EN1JORVkzNFhpcGwvK25heWhMNmIvT1Jv?=
 =?utf-8?B?SzJWekhjUHlRZGc4WVZTaTl4WjZSdGx0aHNaYjZ3NElaUEVVK0xKd05vOENM?=
 =?utf-8?B?c3ZkQlBCdVR5bWJ5YXJlM1VJWWlvdWFoSndSZXRGSUVCTGtlRExROU5INkVC?=
 =?utf-8?B?RFdkcWMvUWZiSllsSUdGa3BRdmdCSnovWlJNb1hVWkFROG5uSEFMd092MURt?=
 =?utf-8?B?NGRGSG9CZ3IxRHpNdDZuSEhNTHJsUHdsRDBuMlMvdkE2SXh4dldYT29qdFJG?=
 =?utf-8?B?c1lSdHFROUtEdzlUOU5pQUhNTUZETno0VXNaM3NEZElSSlVzNjRSK3FWVEty?=
 =?utf-8?B?RC9VdWRSekFNUEFIaU4wcDNiUVFqd0pUWUNCRmIza2NVVmIva3ZaM0l1Zmhp?=
 =?utf-8?B?aW4yWll2Uk1XMzE1N2EyNnVVRjFkQ3JzdDRkUDNZNHlXNGJHNHA5ZzRhcG81?=
 =?utf-8?B?KzRPNHVER0VPTytMQ1FUWjhqbGVMN0RiSFI2c3VkYWpiSTBYOXh1ZXZmY2Uw?=
 =?utf-8?B?UWJSN1dmL0s1WmsyUDExN0xJN1FWWkFpV3V4ZnJFSUdOSFZvR205dGdMZ2d5?=
 =?utf-8?B?RXlreTN3VVA3VWhmTWFsUTZ4RUVIMmVJaDd3aUpaMzErdllieEpndy9tOTh5?=
 =?utf-8?B?djN0Q29lNlBEMkVUcTd0bjlxY0ZBci92NWtnQVJYSkZaMXdrUnUvbG9Cakw5?=
 =?utf-8?B?VUEwUk15ek9qWFV5SDlnVElWOXNqY3lBZjE3TjRyNk9EOHBXRkJPcUxZNE51?=
 =?utf-8?B?RTJRc1BSQ3lXaEprVVFGK01FS3BDdXdRVWQveDdUeHFpcXpYbnVXMGNTSW5y?=
 =?utf-8?B?UGJqdnltOHNUWlBSQ0liMm9VOWJYTnFUVk5RazllQU56Sys4T0U2NWttUVM2?=
 =?utf-8?B?Z2hwV2l5YXliRkNhaDk0K0QvWk5UMVhjN3RDcXNocWJsSHkxM0NuZWxWbXpQ?=
 =?utf-8?Q?kLdz6fqloAE5M?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVZlcEJoT2syZzhNa2t4SUhJQ1pQS0x2TGVFalJjNmtEckpXaWx6M25tUnV0?=
 =?utf-8?B?MjhPa2tCdHp3YUtLaWFLVHZLNHdFWTMzeTVFWis4YjNOTG8vc05jbVBIb0NZ?=
 =?utf-8?B?eW5OZUk2Yjh6K2VXeE9XbTBVTXdaWXpEc1ArUlg3NTNjbEFodDM4UHZoeTQz?=
 =?utf-8?B?TmJXV3pPdWVoZk1OQkVrZ2wrK0prQ3F4Zmg3SzhsRU9EUVBtbHRzaGY5YnlP?=
 =?utf-8?B?YkVBNHRZbElQemY2TTA4K1ZXUWx2akthUVh6OEhKdjU0TGFOWFo4dVNuK0lq?=
 =?utf-8?B?WHRjc3dMck5vOUZkRHg0TVJNQlBESFhONHhZZi83aDdnVXJXTCttTWprREV5?=
 =?utf-8?B?L2phSHp5Z3I4YnBwQWp2bzFHdTJKaW5JSDBkVXpWVFJVWjgyaGRMNElsa1Rm?=
 =?utf-8?B?NDV0WE5FNDF5NExOQVNFNW0zcFVPTWUrbTVZSVZPNHBGajlsdHE1S0FibDBl?=
 =?utf-8?B?SXA3cmNncFB5dmZ5aVVIREtDTWFSSmlDdlBPTXJXSmVzZXA3SmZ6Y2NpenhP?=
 =?utf-8?B?VFNyeXVQa3YzdVZMUlV0M2NxQVhCY3JLYTlSOGtUeG1idHNzZ2ZrWjlzMnIw?=
 =?utf-8?B?ZWN5M0ptVE9QdHlyOFV6S21YME9GaWFYczk3Tk9Sb3BpYVdONndnZ3ZjMDFH?=
 =?utf-8?B?d2xzR3kvVS93WUhlMWhhdFIzZ1ArdFVuVVd2ekZNc2Yyb0tvdi9WWHY5UVVk?=
 =?utf-8?B?SkVoMm4rMWZqNTF6YjFEaHJMalBkb0ZmSWZ1SndjbU50TXk1aWVYeVRYM1oz?=
 =?utf-8?B?YVRiZlBmNFQ1eEdzZldVWHZUOFVVMEE3QXlHV0trS3IyeXFZYk5CNVljVnBk?=
 =?utf-8?B?NkVtTWcwdkZmOUJ4Tmd2RTY1WTJaaktXU0x0c0diNUVtcHJUa245TGo0ejdp?=
 =?utf-8?B?TlJUc0ZYcDUwYzdkV2hQcFdVZ2xiZEZhNmQvNXFtWlBhL0tuTWNVaXZVWWg0?=
 =?utf-8?B?THJ3empYYWpHV1FjVlY3WnJFdHI5ZUVYcEpJY0gxeDhEWE1IV3N0ZWtIZHU0?=
 =?utf-8?B?TC8wUTdMWWYwUXNML2hUV01jZXZIWjlqcFo3OCsyU2ZDdG5EYTFhRTlJN0dB?=
 =?utf-8?B?TG5xem9IMy9vbXdDMkRXemRMSER1Mk9VZHpHNkFmczg2aWxZYU9mdU9pb25E?=
 =?utf-8?B?TnBDZkNsTjlRTzM5QU9mcTlGbU44SG1sVDIwb3pDeHZlL0pCWjN2dnBzb3Rq?=
 =?utf-8?B?UndBYlhtcldTWUJ6TnVtOTRxRmQ5dGg5N2pLWFZCMkxRbTExRG1jVWxCcDVR?=
 =?utf-8?B?dFBwaW95UExwTnVEYmNIbHg1Smt0dHBxU1g5a01SUHJKb1B1UFJ4MGYzblkv?=
 =?utf-8?B?cUxhSjNleVlhOG5lZ0RleEtGRjZsRW1CSERiN21HbEcwUDlxSmF3Y2FXaWFj?=
 =?utf-8?B?RFEvQnJnaDJwOWdUM3lBK1BpYk9WUlROek44MHRLcVk5TVdDa3FSZCtFWmhK?=
 =?utf-8?B?UG9CSTR5V3pxVVRrbmsvOHJ3S05acm05RlhvWG1IQXNxa2lpZ3hhNzFYR2hK?=
 =?utf-8?B?bHpXK2FucDVwcFJKYnpRSU14cmd0djVQSzBzejBQa0lEbE5zMTJWNEhGeVlr?=
 =?utf-8?B?VlpOb0J6bzFLVVYrN1UzRkVYelB4a0oxbVFza2E4S0Nlci9UdThMZmtwVUtu?=
 =?utf-8?B?Q0RTaWZjeDRVRWpPbU5ZcEVHVHo4WElTL3U3ZGpEeHBTS2ptRnJTcFgvRHRC?=
 =?utf-8?B?WnIvUEhsczZacVM0N0pveFBlL3N3RTBGOHQ4R2t6a1RHaVlYOGhNN1pvRUNv?=
 =?utf-8?B?N1ltUk9HUlV4Umszd3ZMaXBvNjZsRjBEWDdZc2M4NnRzS0N0MjVzMFlJRm4y?=
 =?utf-8?B?dGF3VGowVUZIT2pTV2VNYitlM01TekFiUEJWMHFBRGhDK0JhMGlMZG9SRjI4?=
 =?utf-8?B?bFMzUWo3ckw3QUJZb3NqNVVLV0dvMXo4QW81NTdyRUtxRzhDMnNFWXhiNkhv?=
 =?utf-8?B?TFg0aVdIcFErRjN0SXhLM1BRY2FsSzVuZlRqVjJPQ3V5YUc3a0pxRituRUMr?=
 =?utf-8?B?NUlNVENoTUlaMElaemJTUFowUDg2TW5kSzdhZENOTlJXTWZ6UG1tTzh5Q1NF?=
 =?utf-8?B?cjVldDU3WWt3aWgzdGZKVXQ5cy84UUh5Vm9MWE1ZaEd3U1Zsb29RelJyWGIz?=
 =?utf-8?B?QU5aZG5JWm5lbzNXb205S0grait0dzhxVVdvTGhVV0lqZFlRK29JYWtRa2Iw?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a46f032-c89e-465d-fb6a-08ddf0ea01ab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 04:16:40.0760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0Au+fOv+gAX33HnUgYAdurFOIde1JKDBByP9iNQvVoJwZOHXQdgBi0rJUi6Cusu3YX4TKXS6zpAUwjjn7u43GGOxZKaBcaEL9pu4I/1IzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF73E424DB7
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 9XaI4GGyJk_D3SooWyJKU_DWuBWIuRzD
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=68c24d2b cx=c_pps
 a=Hxg71G30CNBv6xsSWT+A2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=GNEw3xDRAAAA:8 a=dpE0qD23TEfWF_n-lN8A:9 a=QEXdDO2ut3YA:10
 a=LVVdaqqDU9W9cF4QaU8A:9 a=RQEihLXzm3ccql4n:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Gbt7yw0KH3r5R2uzA50C:22
X-Proofpoint-GUID: lOfoiCwpL0sSF32HuVLl8EuBK8e2TYfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDAzNSBTYWx0ZWRfX/OmG4kX7n+XO
 wuO52iDevnKHAtC4DkZR8oNLuq8tI8mDDKjWvmJTKF67cUNSwytsBuQJNiVDhY4lmjmvndZpUgk
 3gYAAQpV6Zf6WlBCv3ZDLVQ02pcV1DcgjJn4XCzrUCY8TBPWCqXJDBJdNjVzWzMHifkQZ0x+9+u
 UR2Gr9snrwCM2X7RTXEORqYZqAvGWZIS6cBY/0W51gK7uPK2YtCtVnWEPmKJSgjuWFiIzFNU08W
 AoyCjoBxqLWJWOdx+pMQd/+nwZTlOJPEbRmF3Gg5U70oiC9a5/7ahwNs6gO5l1bwZqQZR5NjwNY
 juVNlaqVO6iHQK1H8dmtFu4by8EGesl5yMbD11X+obazpPhaffRFgDO/gGLdkE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 04:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119352

--------------qFQHOHchJlGBppT2xD0utmmA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/10/25 23:29, Gyorgy Sarvari via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> From: Changqing Li<changqing.li@windriver.com>
>
> Refresh patch for fix build issue
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> Signed-off-by: Gyorgy Sarvari<skandigraun@gmail.com>
> ---
>   ...caused-by-OE-core-changes-to-startup.patch | 33 +++++++++++--------
>   1 file changed, 20 insertions(+), 13 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
> index 91e23c785b..0328202f1b 100644
> --- a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
> +++ b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
> @@ -1,4 +1,4 @@
> -From 1df0f4ae8fd54bc1ae940dfafa701c84d068674d Mon Sep 17 00:00:00 2001
> +From fd075074182f756e2872569925f70f5f4e2386c2 Mon Sep 17 00:00:00 2001
>   From: Koen Kooi<koen@dominion.thruhere.net>
>   Date: Sun, 25 May 2025 12:24:16 +0000
>   Subject: [PATCH] Fix build issue caused by OE-core changes to
> @@ -21,23 +21,30 @@ It is caused by a patch of startup-notification in oe-core which is backported f
>   Upstream-Status: Inappropriate [oe-specific]
>
>   Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> +
> +Refresh the patch
> +Don't use explicit type cast to avoid truncation, use long long for tv_sec.

Hi, Gyorgy

Sorry to say that this patch need to update according to the following 
commit:

https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=15a204024dcc87ab16bdd24a8c52fab5287c2e0f

Regards

Changqing

> +
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +
>   ---
> - libwnck/tasklist.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + libwnck/tasklist.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
>
>   diff --git a/libwnck/tasklist.c b/libwnck/tasklist.c
> -index 7418f89..460e11d 100644
> +index 7418f89..f0f30b2 100644
>   --- a/libwnck/tasklist.c
>   +++ b/libwnck/tasklist.c
> -@@ -5031,7 +5031,7 @@ sequence_timeout_callback (void *user_data)
> -       WnckTask *task = WNCK_TASK (tmp->data);
> -
> -       sn_startup_sequence_get_last_active_time (task->startup_sequence,
> --                                                &tv_sec, &tv_usec);
> -+                                                (time_t *) &tv_sec, &tv_usec);
> -
> -       elapsed = (now - (tv_sec * G_USEC_PER_SEC + tv_usec)) / 1000.0;
> +@@ -5019,7 +5019,8 @@ sequence_timeout_callback (void *user_data)
> +   WnckTasklist *tasklist = user_data;
> +   GList *tmp;
> +   gint64 now;
> +-  long tv_sec, tv_usec;
> ++  long long tv_sec;
> ++  long tv_usec;
> +   double elapsed;
>
> +   now = g_get_real_time ();
>   --
> -2.33.0
> +2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119349):https://lists.openembedded.org/g/openembedded-devel/message/119349
> Mute This Topic:https://lists.openembedded.org/mt/115171723/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------qFQHOHchJlGBppT2xD0utmmA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/10/25 23:29, Gyorgy Sarvari via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250910152923.859295-2-skandigraun@gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Refresh patch for fix build issue

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
Signed-off-by: Gyorgy Sarvari <a class="moz-txt-link-rfc2396E" href="mailto:skandigraun@gmail.com">&lt;skandigraun@gmail.com&gt;</a>
---
 ...caused-by-OE-core-changes-to-startup.patch | 33 +++++++++++--------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
index 91e23c785b..0328202f1b 100644
--- a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
+++ b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
@@ -1,4 +1,4 @@
-From 1df0f4ae8fd54bc1ae940dfafa701c84d068674d Mon Sep 17 00:00:00 2001
+From fd075074182f756e2872569925f70f5f4e2386c2 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <a class="moz-txt-link-rfc2396E" href="mailto:koen@dominion.thruhere.net">&lt;koen@dominion.thruhere.net&gt;</a>
 Date: Sun, 25 May 2025 12:24:16 +0000
 Subject: [PATCH] Fix build issue caused by OE-core changes to
@@ -21,23 +21,30 @@ It is caused by a patch of startup-notification in oe-core which is backported f
 Upstream-Status: Inappropriate [oe-specific]

 Signed-off-by: Koen Kooi <a class="moz-txt-link-rfc2396E" href="mailto:koen@dominion.thruhere.net">&lt;koen@dominion.thruhere.net&gt;</a>
+
+Refresh the patch
+Don't use explicit type cast to avoid truncation, use long long for tv_sec.</pre>
    </blockquote>
    <p>Hi, Gyorgy</p>
    <p>Sorry to say that this patch need to update according to the
      following commit: <br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded/commit/?h=master-next&amp;id=15a204024dcc87ab16bdd24a8c52fab5287c2e0f">https://git.openembedded.org/meta-openembedded/commit/?h=master-next&amp;id=15a204024dcc87ab16bdd24a8c52fab5287c2e0f</a></p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:20250910152923.859295-2-skandigraun@gmail.com">
      <pre wrap="" class="moz-quote-pre">
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+
 ---
- libwnck/tasklist.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ libwnck/tasklist.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)

 diff --git a/libwnck/tasklist.c b/libwnck/tasklist.c
-index 7418f89..460e11d 100644
+index 7418f89..f0f30b2 100644
 --- a/libwnck/tasklist.c
 +++ b/libwnck/tasklist.c
-@@ -5031,7 +5031,7 @@ sequence_timeout_callback (void *user_data)
-       WnckTask *task = WNCK_TASK (tmp-&gt;data);
-
-       sn_startup_sequence_get_last_active_time (task-&gt;startup_sequence,
--                                                &amp;tv_sec, &amp;tv_usec);
-+                                                (time_t *) &amp;tv_sec, &amp;tv_usec);
-
-       elapsed = (now - (tv_sec * G_USEC_PER_SEC + tv_usec)) / 1000.0;
+@@ -5019,7 +5019,8 @@ sequence_timeout_callback (void *user_data)
+   WnckTasklist *tasklist = user_data;
+   GList *tmp;
+   gint64 now;
+-  long tv_sec, tv_usec;
++  long long tv_sec;
++  long tv_usec;
+   double elapsed;

+   now = g_get_real_time ();
 --
-2.33.0
+2.34.1

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#119349): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/119349">https://lists.openembedded.org/g/openembedded-devel/message/119349</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115171723/3616873">https://lists.openembedded.org/mt/115171723/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------qFQHOHchJlGBppT2xD0utmmA--

