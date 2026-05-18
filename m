Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FB9CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 03:17:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.670.1779074228388652596
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 20:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pYCY8eeU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95988fd937=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I25Ko0299316
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 03:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=vi79N5H3jQg12I7AnuzTliIaPgAgY/Tu5dSTkPfVrfM=; b=pYCY8eeUUsVj
	TJr7YL9sAeK/CidiRsixBllgr/zTVJHpUIj7MAOEpzZKzXHP8x61w0FKvaWd0oZh
	K2sNkWtPec1ty0VFewN13LzD65YCXaLMaw9tsBjSdRZHquMA3JbATPinVjV92luk
	C6QaA1abnrsFkWPpjS/lX+jT4cjLXrCxNtrbcbxtKVzjx5hQ+qzT2DcQWlWnOG6a
	jCltJe1zaztQ5wqg1xLkiCBKj3c8ei/XWP2gZlLHrOIckDWrK6JMQoeraez73xwl
	NpXhy8fTTHLGLOqIVLeC7RPcVtxT73WOgrdMn0m9kAdL7H1DjbQUZjHBkOhGU8FB
	nH36Q5K45Q==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf1hcs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 03:17:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOah87GtSKzSsQFrgXR6HMTHAFHGGm3AuK182kLMng+h6Gxbs/1bEJU+45sMTUXu/2TmJPkXwVt9ntJRy2LfJJeZQW2vQP5akjAZ5lzId0JhWXgnVX+/eDlkFkdFAiwElFZDOQFFbmAErWI1FSFaglucRusFufR5D59ycF8PRtEUh1GTW9sj6tVPM0OqAxUzfC/VYXCL1I1mmLq+eQyvqKyqHdwDW1Z8D7/wWcIHzto5wzGYIVcJV8RXYwxeSD/cZaAn2C/+suiwu7S8t1sCvbSjXwFw6eKWC1Bna1hD+ewkcV0+q7gj5eGvcC1NyesIEeVUXWtqq8hNoRg3RQ8HsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vi79N5H3jQg12I7AnuzTliIaPgAgY/Tu5dSTkPfVrfM=;
 b=IOnyp5CSlC1O4riolCxF6SRM78c7oxLRvQdp9+plmbpx27s4bA7PgIY/TgXlp+Yd/1WefPHQZ/bUFx2jX/AT1POnAYt0tN7Y4dt8SxMJu6RuoQlBH52kBAiKWfxqmI+ZXzjZLX0hXM2TU7kQl5+vx3C4ZCAMQU7qSrncXNBUBbeA3i9L58fEx+3KMNmQZS3HBWCjxmDRGFn611z1JqKIpieczeUtKKyMePEXt6Nxuh45guk/06gVDziYqWdmGWM+PIg6493vTRSOr+YY40SLpZd+MfQnahaspZvnGpU5Y4Yfjr2h9Bgyx7oqDtn75zXKDclApCUYzZ8Jss1vPsTSmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16)
 by MW5PR11MB5884.namprd11.prod.outlook.com (2603:10b6:303:1a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 03:17:03 +0000
Received: from SN7PR11MB7601.namprd11.prod.outlook.com
 ([fe80::b3c9:47a7:4653:5a6]) by SN7PR11MB7601.namprd11.prod.outlook.com
 ([fe80::b3c9:47a7:4653:5a6%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 03:17:03 +0000
Message-ID: <545ad21c-6abb-42de-9197-7f6f31ef9812@windriver.com>
Date: Mon, 18 May 2026 11:16:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] 7zip: update CVE_STATUS for
 fixed-version
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <meta-oe/recipes-extended/7zip/7zip_26.01.bb>
 <20260515055334.466550-1-hongxu.jia@windriver.com>
 <AS8PR10MB50732B434D0036674E59D126FD042@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <AS8PR10MB50732B434D0036674E59D126FD042@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0046.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::17) To SN7PR11MB7601.namprd11.prod.outlook.com
 (2603:10b6:806:34a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7601:EE_|MW5PR11MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bfda89b-662a-469f-e18e-08deb48beebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	qtGujtg1zB8E7Mv0uZ6xnXfOv4UZHE/mHDOXcZJ81qHdLdr/abcUr4KSHVGfQ8ZvqNSB3t/aKER5DKf89D7jzHXcGvx8GuxK2PkLBajJcLu0R7MnVjiHRCFgjGu0qQ216Dqu6hXFTy3kRWxd4rurNdztrTYHWXx+5bVR4tE1/fKOqXUzz37Ij4B8V+ZwX0epJXU5CwtQHzRNzgtqYRV1qM0aN73rSnT82L2KdaFWh/xW1eoy5Xx0ixqmZcUMX0c9oE2Ah8FoIYauN3DMAyjDWot3uHx6+IWcAzK5YOV96aaFqy76aw8rIT0jq8qmGJPqF9ON+KA8EUjjqi9wujzc626Kp1twwqZpcwSoJ5rVMjvh/3RCtVkuQaZnZOeL3wzcawMlr3GZTR2zYFMYDSZ4g2jfll1YfskOSADKBTvyw+oIzTibhoBOamDSP0r33phmVYIrzXwl2rsVsn9a9uESiqTsvRGEXAI17Yr9Tsp9PwcfQD1+iXKjpJNjefUVtFMXfeqB0eFoxhK2nINgu6mn01QyJXCk7oh0iF6XgiA3/bgWmXs2qYGwP9x5vTS58nbjpOTSoKMPA5xCQ0WrRhDml4QuGeNPAJMVACb9vKPkWxD83MnhGzhCXuPuWUhmc0MZWwyYgTHDHL0RqiVL4bQjZw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7601.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjRCNWVRNE5ZdlZXL2ZvdlIvRkk1NVJCTHdUVlk2L0xzV04zbklYdG5ZYWR5?=
 =?utf-8?B?SkJIN1NiRk8veTVxUzdqbGNRRWxnTUhOME9Vc2grVGU1VkVaUHhqRC9WRTA4?=
 =?utf-8?B?Rlo4d0p0cHdqNTRaY0RVUThBSzl3d2s1NHRRRnZOQkZCQkxJSVdDRzlqY3o3?=
 =?utf-8?B?clRyZERjZ25pTHQyZGhCYWZLczdTdm5iS2F0NjBDYTkramN0V3lxcWEzNGJM?=
 =?utf-8?B?WnE0T2RzcmF3eW1XWmVibjdDNGorSTd1cVJkNVMwQ3FuUjdaQjQ0SzBkLzha?=
 =?utf-8?B?Q0htWFdoeUlFMnJ0ZHNmbERlNG92NUZpM3NDdkM4WDRTdVJmcXBvV1R0OXJQ?=
 =?utf-8?B?V1FXOUxqOUNoa0U3cG9LbTB3NkEzMFkrbmxsbFphM0hOSk1PR3pSNmk0Z1Vx?=
 =?utf-8?B?U1dodjlpdzBVYkFuSzN2dW90T3R4RVUwd3FJeWxQRllkdEVWMS9NeUpvVDly?=
 =?utf-8?B?NkJnWEdpZFV2RUhnQ0IrVW1JcWZVaExKa1ZXMGlPd1lCYjdKbmZBQXJoNjEr?=
 =?utf-8?B?V0Z0K3lBQ2hKVzkxVWZkUE95VWlJcFBubVJBVGdLL2NJeVlNVmg1cW5OMDN4?=
 =?utf-8?B?b2I5NVNTWlc2WHdDZHcrVkpRVlB4SkNhVTBhNDJ4OG9TVkRsakZOazlxQ1Na?=
 =?utf-8?B?NmVsTCtwKzBOMFY5OEx1OGdjandRbkhQaEJLMFJNT1pYUlNHU0gvWXIyQ21v?=
 =?utf-8?B?UFA4czY4RDU0NFdxWWlxT1BBc0VEVDBWVy9aN2dwV1dnQXdoaVVYTG5MbHJl?=
 =?utf-8?B?M3VHclZhdnRiY0wzc3NIekd2WXA2akNmUVczM2NZK0pDbm1FVUlJME1SRlU2?=
 =?utf-8?B?N2NJTlpxdTU4VUxqQlUzYm5qNGNhNmZsTEhCOFZadmRJait4Uy9HVzNJMjFX?=
 =?utf-8?B?ZXVDOXZkS3BXTDZLMThzRFo2ZGlERjZSeVh6TWI3ZmtkNExoanM5Y205cHhu?=
 =?utf-8?B?RngwU2drNFl3T0dwQmRlYUV0SHVweUlDYjRDanMrM0lkV3h6bU1VUWRPOXAz?=
 =?utf-8?B?VGR1WUFqaEU4UDkraE9ocmdSSEdYSXBvV2FWSnc5NmdjUzQzSmtSV0xGVUhL?=
 =?utf-8?B?TlNPMzlOUGN4K1Z1NE81ZFo5TjdBOXZCZktQdVIxSGtzZ1o4ZE9MamU5dkpE?=
 =?utf-8?B?WnErSS9JSm9kWkx2a01vNFlvY04yQXhtRFYxK0FXSlhaOUt3T2lzYVNpRGg4?=
 =?utf-8?B?aTh2VkV4bW1GVlBwZmJGSkhvWWk0bXJxc0xwUkZFOERnYVd5d1Q4SUNTWW9V?=
 =?utf-8?B?OUZ2U0tnVHJhZUgzaDFHb2J0RXJqM0hKejN5RjZFejR6QjVudHVZT0NRbnpK?=
 =?utf-8?B?Tk9uTWVxNDhOa2VvT1RPNUFzOUdyeFVLOGtkSThvRjM1dTNUd1hLZjFHL3My?=
 =?utf-8?B?VmRpbUFoRFV3Z3RKT282ZzZhUmt2Q3ZkdFk2N3YxMHVha1lPQS9YVVBNdWgx?=
 =?utf-8?B?eGRkL21mcmVxWGw0S1VZWVc2T1RDeUFWd056bjRkZ0djbm1TV0ZCTnlsZWhC?=
 =?utf-8?B?Ky9JcTRoVTFnSVFnbUVXVGh5VnJ5YzFSc3Jrb1VpQ1l0QkZZOWkzKzB1blhl?=
 =?utf-8?B?RWZoeW9UOEtLdkt6T09DUmJPbmZiMkZndFltZi84TE9JenhKaDc3SlFrMk1x?=
 =?utf-8?B?WHh5am1CQ1Y5clM1YVIyanJPYkNhTGg1RjlnQ1VhbkFNNUdyTWZERzJSb0t0?=
 =?utf-8?B?Sk9zOXVBQ1E4U25VKzNzM1E5aGdjK21hczNicmJPRmNsa0NPODJRWHcwdTVG?=
 =?utf-8?B?ODlEL3hTVy91angycUJ1OUMzcVZEUXFDSDhqUlIxK3FSMXRQdEI3SjlES0Zl?=
 =?utf-8?B?ZVNZN0N2M3p2RklTV2hzeFgyYVJ0UUYySitqeG1YYTZBM3piekNsOW9GSllP?=
 =?utf-8?B?cVA2OU5HUDRxdG5YVW10dTlpZ3lQTEtUMDUzZlVBUTI4NnFUak5DRzd1NVBQ?=
 =?utf-8?B?WHhob0FUTW56dkc2N3I4Kzh2RnZ2Mlcvb0U1aXpZT0NvdUNpQ0tMbFZ4WVQ3?=
 =?utf-8?B?UURhZHJ2MmZvbEoxbHUvUXVzS1RKMGRvQ3BYSk9Wa292N3pHWmtDMTd0akpH?=
 =?utf-8?B?ZElMNVhvWkcyUU9ic1RxaklHNHNZdG9HVHNlODkyL1ZYeXFyWldpajI2WFRu?=
 =?utf-8?B?RGlCRlVUWnJiV2lHZlViVytZK1kzQWdZWFRGdHFCR2pveWZNRXIxVFAzblpZ?=
 =?utf-8?B?L2ZPUm5hamN2bFdXUHJnRlB2UnQ4WlZvWWJaaktmUG5xa2ZsQTAvNGRNejFZ?=
 =?utf-8?B?UTgwdHl1emZEcEpXK1FERi9EcHkwU3I1TnhYSG5HUDJWRzNwUXRTSjRlZUov?=
 =?utf-8?B?Y0FDS2t0d0xhYVMvdkhnakkwS1ZJZXR2Mi9maTFpelJhckNHMHdndz09?=
X-Exchange-RoutingPolicyChecked: 
	bLNMuaiyeOZgMbpml1bQkKMNEeFizSWEnJcwE1FUIBf42YsOi6FdzK6Ud5LH9mVdpwHM5Ad1LmtiQWhBbKpjmtCSTc1n14BfgJfQrNZt7D+kBQjBGqwVkv5t++J3kLtRFBaeBRBahsaCngbzZajF1kdIl3o4FshB+eoB9s6rWtzoPGJXDoOny5UP8FgWRdkh7PApkvcu+kAve5S9BpscjSrbi6Fn7Z++AAgUs8hti5LWzPP+VlxnCpj4F1sm8APmQhvkasJ2lwEp6AEVvvIvT6CyqwKaupD2f/IMwd76TVvFQQRRz+VfqAf9UJwfZqhmghF/Oio8MRnh9foemmwKKg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfda89b-662a-469f-e18e-08deb48beebf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7601.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 03:17:03.4578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOiBML3XJ84Mr1j7cy+pOhSx0IWNxdbmXig+gIgGlBMbJZX7XpqQVqYJkEgpodsq5zP0gGffd+OZofd0sDPf0+8JyNG8yjSPNXVb1NyOP+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5884
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: cwC7kzn3OcdWT1P2ynPh6U-p0pDCTNVJ
X-Proofpoint-GUID: -7-Fb7Q1sMyX5QBFc9xd5v-wxsVHZ7X7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAyOSBTYWx0ZWRfXzcW4yidn82ET
 9sDJNAOGGh0fjN9pVaV1tsnCnqrmnguFE3yLe+wWeuM/mWi0uJ0qSELXmhPXQbUL2wPrPigL/I5
 NDrVWurKfElCHEIdafJRU4A46uZ03uhPJnMFZHtGfuLVxyFNzOXQO1nJcptn+0aOZRhRGRbdH0o
 ofXORXMpFqxVtFOVNcyeLnYvZAz2nqDBKK8VwMIq+ZpIS+nYz4hpzryF9pgSTtKP+QNCpIvfBBa
 5PpkGYB+GyqqDrvHC7YiO/KhLO1VOCuzpgChyBuMtg4B3BFGHIJoqf3yz9VswFf2S3WRDd4lJYG
 aHYC2uNI31bQKPXIxc8GNgbXLA2Zl6c7iqliLw2QXi6IjMvjwPcVrymoHEGW69RXHbxa6FkUl2n
 mTmKqpgDdEVs1Rtv/4Y1/if97j9yA8s6vx9knRQjC+jBHIK30leoM6mO6+WRhZ4PRtx0aRbAud3
 kxr7RpF23o/T1tUUZRA==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0a84b3 cx=c_pps
 a=0NiyxO+pn7gKe2yT6URb/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=PYnjg3YJAAAA:8 a=FP58Ms26AAAA:8 a=fZPMF-2OAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=CIlIEKTY-wdCvqzCojcA:9 a=QEXdDO2ut3YA:10
 a=O9lCZVmNj_uBxb2n18d4:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 03:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127047

On 5/15/26 16:19, Marko, Peter wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hello,
>
> what is the purpose of this patch?
> All these CVEs are already marked as fixed in sbom cve reports.

Yes, you are right, these CVEs has been marked as fixed-version or no 
version-not-in-range

please drop this patch

//Hongxu

> Peter
>
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of hongxu via lists.openembedded.org
>> Sent: Friday, May 15, 2026 7:54 AM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-oe][PATCH v2] 7zip: update CVE_STATUS for fixed-version
>>
>> These CVEs was fixed in current 7zip version
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta-oe/recipes-extended/7zip/7zip_26.01.bb | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/meta-oe/recipes-extended/7zip/7zip_26.01.bb b/meta-oe/recipes-
>> extended/7zip/7zip_26.01.bb
>> index 61be89c7ba..6da5b08347 100644
>> --- a/meta-oe/recipes-extended/7zip/7zip_26.01.bb
>> +++ b/meta-oe/recipes-extended/7zip/7zip_26.01.bb
>> @@ -68,3 +68,15 @@ RPROVIDES:${PN} += "lib7z.so()(64bit) 7z lib7z.so"
>>   RPROVIDES:${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
>>
>>   BBCLASSEXTEND = "native nativesdk"
>> +
>> +# https://nvd.nist.gov/vuln/detail/CVE-2022-47111
>> +CVE_STATUS[CVE-2022-47111] = "fixed-version: The issue was found in 7-Zip
>> 22.01. Some later versions are unaffected."
>> +# https://nvd.nist.gov/vuln/detail/CVE-2022-47112
>> +CVE_STATUS[CVE-2022-47112] = "fixed-version: The issue was found in 7-Zip
>> 22.01. Some later versions are unaffected."
>> +# https://sourceforge.net/p/sevenzip/patches/417/
>> +# https://www.appsecure.security/vulnerability-database/cve-2023-40481
>> +CVE_STATUS[CVE-2023-40481] = "fixed-version: That bug was fixed in v23.00."
>> +# https://www.appsecure.security/vulnerability-database/CVE-2023-52168
>> +CVE_STATUS[CVE-2023-52168] = "fixed-version: A high-severity vulnerability
>> identified in the NtfsHandler.cpp NTFS handler of 7-Zip prior to version 24.01."
>> +# https://www.appsecure.security/vulnerability-database/CVE-2023-52169
>> +CVE_STATUS[CVE-2023-52169] = "fixed-version: Relates to the NtfsHandler.cpp
>> NTFS handler in 7-Zip, affecting versions prior to 24.01."
>> --
>> 2.34.1



