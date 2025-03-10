Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57338C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 07:01:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31539.1741590105036282890
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 00:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5164e40432=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A6e1vu024568
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 07:01:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458cv8sq7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 07:01:44 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52A71hZU024943
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 07:01:43 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458cv8sq7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 07:01:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONTVCBXNyP1xAnlPFU+fqwzRY8na1DMJTGUafKUeI7+50AQampPEl0fZ4+oN+Z+W1wQP1Y4O0p2/vTxpleSBZKe1BEcV32+mvgJbaNDvjRc/yr1jtupxgLBAE52mHBrmF9Ocj9Fd6cpoAbicssIHCsNo+REiO/Ui4hfYjYkr23r+TobhRB4WOkMwlJLjv8oafPnpyMEMrGvTlc8tpuT6beg65hQl48Z83q1IrYpOBAk49wzNXybFCBDyl2bZBdaM47anAafqzV14THNu6CtIXTzu21beF6pLL0avXbrM9mPqXAHR7jw8FHZ8sYqtJLJrd2UG72kmXuz/cMa1Lk+KUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/+hsyXHoYIlp5aPjqhShJh5gZ8kphd7orJWVm6hj/4=;
 b=dgeQWtXO6qUFQE7L/3huUeTSkNL4VykmYUzL5oWEOAQN7/3GdDcdLncfizIjmFVWxvRrJqvXRLQhb6TzfXi9Vgb+Z8XDFnzSZZnRCRQXM1CMY4qMDAnWiAPiZPfuGgYl+kImA+tN5anMbasfAW3U7DCT7FpT2IjF3da9ZxMh4MoW6viqPJqE3s2jnHbbFtjJH+4Q5r6pKjsxnYxCGayQLbonCi1o8+NFkSYNlPBW0cHc8XMpon36v8BPHZYfETjCPEaYxVEeYpNkvW6LcFpOY9ycCdu6b6rqJwVVrNkuJAcntdNJZCL5IB/4dIn1/Rzf6H0cX6xRVgcbtvRDd6rYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.26; Mon, 10 Mar 2025 07:01:39 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:01:39 +0000
Message-ID: <388ca5e6-0384-42ca-9f1d-3ed83b2ec644@windriver.com>
Date: Mon, 10 Mar 2025 15:01:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone][meta-networking][PATCH] net-snmp: fix memory
 leak
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <1825C99274128577.23135@lists.openembedded.org>
Content-Language: en-US
From: "Wang, Jinfeng (CN)" <jinfeng.wang.cn@windriver.com>
In-Reply-To: <1825C99274128577.23135@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2P153CA0029.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::16)
 To DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|IA1PR11MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: 97bb9693-cc9d-4ce2-dbec-08dd5fa167dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eCsxaVZZaVlMYmQ3WTNOMkpnNm9rVjB4bHgrNjFiZVBtK1RTR24vc2QrcUlD?=
 =?utf-8?B?ZjdNYUJJMEF1MEltaXNlUnYwNlhaS3JZeUF4STRqWjVYUXRBa1VHNnlmbG5z?=
 =?utf-8?B?aDIvV2dFOFFsQ2NLZkdlTjJSVGJ3WWdWdHpHWkcvTENob2RTRXU5bHJSM2dD?=
 =?utf-8?B?N3ZTRW40OFVqc2xxaDVPUG10ZldpS3dHckxNUmpMV0RxOTYyUngzRjd3bWpW?=
 =?utf-8?B?cnJJOGtGaUg5RUlSNlhRUllEc1ZpRVVBZmNVRTJDWW1xT3lXVGZJOVNNTzFO?=
 =?utf-8?B?bDFPTTk2SC82MmVzRGFDMmplQ2RBWi9MMVhzZWRJSlpTd3FuK2srbFFobTR2?=
 =?utf-8?B?YVZjckovalpUMjUwa3RHc1krRE5EU1ltbDZqdEdZbXE2cXNjdnBmMXhCZ3Ry?=
 =?utf-8?B?K3A4dmN6bGhkOG9jblBQQjBpbXNtMm9TamJ1cWU1WmJkOXFaSnVVM3dTekRx?=
 =?utf-8?B?SWpFMW1UU3RtN0Y4ZGlRK1VMT1ZXVkRCemxCbFdyWUkycnB5blZaWWQ1NGlZ?=
 =?utf-8?B?a3pzL3lRYUZTbURVUk9vblNjUllHeXVkbmdtWFliRDBDYWR5MmM1RDlaK0ZF?=
 =?utf-8?B?aFRhMFNpbUJGeDhyKy9EdTZ3RUE4OVNVTXZ6Yy9RV2RZTTh4bE5QQUoxblRi?=
 =?utf-8?B?bEpqejVuRS8ya0s3bjJtZzR6WWVNQm1LMnRmNUwxQ0RETndwLzZiK01Kejlh?=
 =?utf-8?B?OC9GMkxNZ1NrQTFaczNaUmFRUnlIN1Q3NDMrVWZYaUdiRDBkczRVY3NGZ3Nq?=
 =?utf-8?B?ZzlDM0tzUTdOK3hwdkNZRW1QbUFYVndicDQ3d0szcWhlRm1wMWV1WUlFT1JP?=
 =?utf-8?B?L1VNNXNTWXZpK1NhRGsyalltZFhKc2NESGVjMmJrcllvK3M5K0RoTFFzRG1r?=
 =?utf-8?B?OFpBSW1jaTVqZ2hVNno3ekxjN0JDcDQ1aS9yam5FM3ZKZmZzQmdVUDIxS2R5?=
 =?utf-8?B?d3FCUnY4VmpzOVRrUnR3Zm1tMHM2QStyNkUwNHFqSFZOdThDRzlXQlVCbk1l?=
 =?utf-8?B?NVJ4eFJLTXZ0NHBEQzl6a1RNVytuU2FlV0hFM0QxTndwT0ZxNXZKMjZ2ZG1a?=
 =?utf-8?B?ejh6VzVGMTZ6VHJYMi9waWRDS3JBTm1jTGpBZUtqTEd5ZzFpNTVSMEFublIx?=
 =?utf-8?B?RWNkelpKbUh0RHplWnZZN0ZTK3JZVTYxRjRxbmNpWVI3T0V1MVA3YTVkQjFX?=
 =?utf-8?B?aTlublhmMjdoaDNDdUd1WDlGYXNsRXRGckxLNFhwY2lHSHhCN28zazhQL1ps?=
 =?utf-8?B?aTFjUlZUckMyYjYvMHdibXJkRFFOZjVWSEI3aUNCUFVkNDduL3JzeTZBNFNr?=
 =?utf-8?B?MlhCaThsd2loTzlteEFsdHlaN2xHRXRCM3h2bGwvUkxoZ3ZIejBaSFZOOVYr?=
 =?utf-8?B?TzNEMmdYZXVKV1QwL3p0dHlMcjB1WVJGaU1MSmh4RFEzWmlEczkwNGMzUHRO?=
 =?utf-8?B?dTF0YkJ6a1B3UFE3emhoeW1FWWI4K0JQMVdYK2Q5cjFZYkhrSXozaTVJWk1T?=
 =?utf-8?B?T2dGSjMvRTVZWm9jREw3Uk56Wm5NMlh5RUZya3U3TEU4ak95UFV3OWl1dkpJ?=
 =?utf-8?B?OWJVcm94MEhFRGZaZk11WXFpSVVjVzZKOFpBcDZvNDNKRC9BdWRtQzJwZW93?=
 =?utf-8?B?eDI0NnJ4YklTSFlVK2lXNTFFZ0wvWE1OQUc2My9DUXU0TDZwK1lwaWJJMk9F?=
 =?utf-8?B?T0FPOGJCWjBqemRRSTZHcVJxbkpaWW4vNE1KWlh3QVdlam5CVE1PcmJjWWk5?=
 =?utf-8?B?M2dTL00zUjZDa1FOc0xtSnFiVVk3NFZ1d05hSHJTTUFUdzhQdzdtMy9Xa0tv?=
 =?utf-8?B?S1RvQktRTVZlei9hd21tdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aFIremJVaTBERE9RZzBkeGUxenhXVWE0cEIzakpQYjlZbXJCeTl4aGJXbUpK?=
 =?utf-8?B?NndieFhMdFNsU01GTzh2UVNoWVBzRU92S2x4V2RRZlhLaGlFNkltOXFpbE9l?=
 =?utf-8?B?bWdPR09SaFJna2daWFZjanhwTGxTRy9oMDJ1d3VZYVhtNmhMcHpSUkkrK3Vo?=
 =?utf-8?B?bGlXNEgwSXVXQzZidzA0dDhkZjNWQW5GSFgrbytVS0FQb0hCZTJVVGRJM1VI?=
 =?utf-8?B?ZWFOaWxTSkdHSWc0SjFqNWtwOWU2NnN2LzloZTREUnZXbkJOV21VK3hiTVpR?=
 =?utf-8?B?S1BvL0UwNzZKVWNBbnE1d2x1ZXB3UHNwMmVQNkRQcnVHaGhkVDlEZ0VwQkpo?=
 =?utf-8?B?Yk9sWE05d2JzNHAwdk94K05GNnhDbzVYdGtnaUNEZEdYVHNjY3lSREFJSjF5?=
 =?utf-8?B?b3JKeHVPZ0U1UzNVNDByWFV6QkNjaG55UTRqV1J2eHllYWE2V0ZGMmhXdzVD?=
 =?utf-8?B?MXhKU0xSa21iV1dWMVdhT0t0RUlSTmlaNDdMTlFkZUZUK2hkM21JcEtkMVV6?=
 =?utf-8?B?OElEK21TWnFSVVJXMnExT0tya2IwMnkrb0JGSzYyL01RdTBCbk0zaUFlWWRt?=
 =?utf-8?B?bXlsTm9BTkpVeGVsYmFIRzRvNlhSdGRkQ3c4Ym5vd2ZHNmp0ak5DYnZRdjNs?=
 =?utf-8?B?elBSMjFjd0pNNmdJRDdBMGhySUN4dXRZQmczeEd5cEJDZWp3YW1JckZQY0xC?=
 =?utf-8?B?Ly9JaDJwTkM0bjhhWkxpWHk3Y0VLb28vTE5TSUVQZzN1ejlycDBxYmM0K2Zo?=
 =?utf-8?B?NWFZbnJNS2hCc05PUDkzNlY2U3V6NVVnbnJHaVRub2ZqcWRWYXRmUGFXcTVx?=
 =?utf-8?B?SmhRVnBzcWJheG5NSDdjUGlzSkdUZmtUeTBKcEVaT0dpSmkybk5udVRpWUh6?=
 =?utf-8?B?emI3YUg3d3ZzM1lPSVZ6bUFwZWkvZlpqZUZRcUZwZkpOeGp5TzQvRjZYR0Vy?=
 =?utf-8?B?MWpzc0R4aERTbDhPMU5UWmx4dnp3VWc1SzVmK0w5Yi96Z09hSG90RVVtbWRx?=
 =?utf-8?B?UzhIUEJEamM5czhTRGRkc0hLaEtKMWdIY0FhYUMrbGl6TFNRVnNwck9nMmpM?=
 =?utf-8?B?bFBzcHFvSTlyNHBBRHJBemVNb1ZCN09pNUIxVzlnaWhna0lRTld0OW5pNXdt?=
 =?utf-8?B?TkdJQTVjMGhGcUt2UkhyeTZTb1JIZlNzWjlHTGR3L013WlNSeUhMeGUrSXE5?=
 =?utf-8?B?cEVHOHNkRVVjZDFKVnlxd1FxMUo3OUlZY3JOUmtUVXdBQm5OOUNVRzNRV1Zu?=
 =?utf-8?B?dE13S2dRYkRWN0Q2bkhVNWhOazcyemxDQ24ydnpyR0p1ZHN6cm9HUXFPelZx?=
 =?utf-8?B?RC96NXZuUW5oamJwWFYyVkltMHVLWXJLbVJsWnhYcjAxcVlhRVJVS1VpcGU4?=
 =?utf-8?B?eVltenFUU2JWbUpWZW8xVys4RHBPcS9zeldabGxTcjZPZTY3bWJha3o3R0N4?=
 =?utf-8?B?WFk2ZTA1UmMxTXVpRUV4b0VUUjNIVGJsSzRxSytTT2krT3h5SWx2aXUrMDRz?=
 =?utf-8?B?QXBMSmRnL2p4ZEp4MHNhc05QczFvUkFxY3QrZ016SEN4dU5hNEsvenVHM2E2?=
 =?utf-8?B?OEtJdzVSdnlRWkNhOS9GbUxNTm9ZL1FaMmxqZGV3dmNZRXZMNGk3WEc4ZlBj?=
 =?utf-8?B?Vi9rNTNXQUdCNFZRcDZ1d0pYdDZRTjZWTHhBTUoxc0d0UjFqSmloM1FySnBq?=
 =?utf-8?B?VDFocXNBTWlDdDZTVzE2WmFDdm8vUWowaFltTGpZTThyRE1LMy9FaU56M0ww?=
 =?utf-8?B?TlM4bUcybDEzUDRXdmlENGptZlF0RGovYjVNb3gwZDVLSFdpWEpndy9xWldz?=
 =?utf-8?B?d0J6VEowQVFzU3lZV3dpNWlRaFJxc1VDTTFXY1dydkxZVGRlWWt0SkJrdk1w?=
 =?utf-8?B?YTd4NGpqc21hZFU5dnF2OHFpTmJwd2ZYRFF3T1BJWVhlVTdzb0oveEUzY0ky?=
 =?utf-8?B?Y0lheklsZUdEZnJDRmV5UXhYYmMwSG1ZVHNucGk1OEtGKzBuK3FLK2NWRjhj?=
 =?utf-8?B?ellqWTk0ZExWOUMzdWM2eHJ2Y3h3TzhvQkdSVzNnL3N1SUROaFpsZENLUUky?=
 =?utf-8?B?K283N1dDY2MrZU4zM1NyVlRBV3RqVFEvTnFnQm5Dbi9qdGIxbTZtL0p2OGVJ?=
 =?utf-8?B?Qk1iK3c3V25ZUTdqajlaTEk3VTEzNkxieVlVSUtWUERYMEhFbTJwZUJwcXhi?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bb9693-cc9d-4ce2-dbec-08dd5fa167dd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:01:39.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zPk7lJMjrohq0MrOQ/to93anQrAKwl7vUOEg31yr5kPRtAV1VKkddeTG9NNEgfe2/TPi65ezZHXMiGVS1nri6xXMlaegwZS2KBBtzcKuvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6218
X-Proofpoint-ORIG-GUID: -6tmSh9Vuu1VvmGIDd8ZuLaOYzKcSG0W
X-Authority-Analysis: v=2.4 cv=QbKcvtbv c=1 sm=1 tr=0 ts=67ce8e58 cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ThMX_IV2AAAA:8 a=3PwQUCPZx3LQbaIIRccA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=0jcnvs3wCqEDeep41k2a:22
X-Proofpoint-GUID: TXnwX2VRZ4VXHjokmDODlM0sZ2qNzM5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_02,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503100054
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52A6e1vu024568
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 07:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115819

Sorry for interupt.

Please revert my patch.


After I rebase the latest codes from kirkstone. I found my patch had a=20
bad character. This caused net-snmp do_patch failure.

After some tries, I still failed to resolve this.


The cherry-pick in my side picked copyright change. But after sending=20
the patch via git send-mail, the character changed.

Sorry again.


Thanks.

Jinfeng


On 2/20/2025 10:27 AM, Wang, Jinfeng (CN) via lists.openembedded.org wrot=
e:
> From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>
> Backport patch [1] to fix memory leak by freeing tclist
> [1] https://github.com/net-snmp/net-snmp/commit/4bd0d9a8a2860c2c46307ae=
f5ee1ccc69f7e3b62
>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---
>   ...bs-fix-memory-leak-by-freeing-tclist.patch | 40 ++++++++++++++++++=
+
>   .../net-snmp/net-snmp_5.9.3.bb                |  1 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-u=
nload_all_mibs-fix-memory-leak-by-freeing-tclist.patch b/meta-networking/=
recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-fix-memory-leak-=
by-freeing-tclist.patch
> new file mode 100644
> index 0000000000..3632881501
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_a=
ll_mibs-fix-memory-leak-by-freeing-tclist.patch
> @@ -0,0 +1,40 @@
> +From 4bd0d9a8a2860c2c46307aef5ee1ccc69f7e3b62 Mon Sep 17 00:00:00 2001
> +From: JanSoundhouse <jan.sondhauss@wago.com>
> +Date: Mon, 5 Sep 2022 11:25:58 +0200
> +Subject: [PATCH] unload_all_mibs: fix memory leak by freeing tclist
> +
> +tclist is always allocated in netsnmp_init_mib_internals, when doing m=
ultiple init_snmp("")/snmp_shutdown("") this memory is never free'd.
> +
> +Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit=
/4bd0d9a8a2860c2c46307aef5ee1ccc69f7e3b62]
> +
> +Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> +---
> + snmplib/parse.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/snmplib/parse.c b/snmplib/parse.c
> +index b3e2f3ae5c..71bdf75ff8 100644
> +--- a/snmplib/parse.c
> ++++ b/snmplib/parse.c
> +@@ -28,7 +28,7 @@ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERF=
ORMANCE OF THIS
> + SOFTWARE.
> + ******************************************************************/
> + /*
> +- * Copyright =EF=BF=BD 2003 Sun Microsystems, Inc. All rights reserve=
d.
> ++ * Copyright =C2=A9 2003 Sun Microsystems, Inc. All rights reserved.
> +  * Use is subject to license terms specified in the COPYING file
> +  * distributed with the Net-SNMP package.
> +  */
> +@@ -4215,7 +4215,8 @@ unload_all_mibs(void)
> +         if (ptc->description)
> +             free(ptc->description);
> +     }
> +-    memset(tclist, 0, tc_alloc * sizeof(struct tc));
> ++    SNMP_FREE(tclist);
> ++    tc_alloc =3D 0;
> +
> +     memset(buckets, 0, sizeof(buckets));
> +     memset(nbuckets, 0, sizeof(nbuckets));
> +--
> +2.34.1
> +
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.=
bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
> index eb8e1599fb..88466c94b4 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
> @@ -27,6 +27,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-=
${PV}.tar.gz \
>              file://reproducibility-have-printcap.patch \
>              file://0001-ac_add_search_path.m4-keep-consistent-between-=
32bit.patch \
>              file://CVE-2022-44792-CVE-2022-44793.patch \
> +           file://0001-unload_all_mibs-fix-memory-leak-by-freeing-tcli=
st.patch \
>              "
>   SRC_URI[sha256sum] =3D "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998d=
be02f9462a413a2ef0a"
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115527): https://lists.openembedded.org/g/openembed=
ded-devel/message/115527
> Mute This Topic: https://lists.openembedded.org/mt/111282761/8617462
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Jinfeng.Wang.CN@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

