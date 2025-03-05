Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD482C282D3
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 09:49:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9840.1741168151790961860
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 01:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51590ea975=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52557aPv007362
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Mar 2025 09:49:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux0fhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 09:49:10 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5259jfkV026705
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Mar 2025 09:49:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456cux0fhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 09:49:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1p9MkBgUE9BseMCUe5wnRbz2XL7ehYhCL+Cir18Z35lhcrccO0j3hSftSi63APPv0dVpC9s4zfMMVvGlPdy9bCOyCPRqQSi4RaC+sDLBdwgN0pPczOIIT6IW/MsrOMBbtN2n8gzIJ3qCXDwNc5P2st2ntl/l+AwghN+ZPNx5xIesCLZW/lOPelwdjB8mNVqiSXoZzoS9ulc7j99Fq604HtZiPi5Ro5bZiQV91frHIp8I2qDNlA65SnUxEBX6J7NQlSRS1RlM9kx6xHqdS0Haij9xrtL8FK5v8WyK7i5AICv+Qu2Jc4IjII707g7yvz242K7Gm3jPvzkkZELB+AmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z64b13U3vZgRb7M4OcfwB+iOVQF5m28ss/E+rPxZ8k=;
 b=tIZzmcf4BeUCoMzwWYCHa+xzBTTYR7v8RBgNUQ9vPvpf8qi6a6a9w0ZGm2ruUfLyoPISE9+ff62+KhH5FYUtjW0koOgCJOTqZlfRb5XfX/01hNfcReVHDnMsFNxkr0ECKIeekSS/jWUqai8AZA4K0MBsX93o42wChfVJzJvS46OPf/z41u1xglk04Q+K1yjDNUsPQ0nqWhlDAaEIqVK7J43W1fVAd9MiPSyLS7QtvPZ23wdyMWLuobF2KFr8ECtxRXbBCpV73SzFuVuaQlYfYvk8JH9QdvaWGPNE3ui9i1eEP5oMRtKU6Tu88doXKJGtsjXbk6Zlp9uomwiV+Dz0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Wed, 5 Mar
 2025 09:49:05 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%7]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 09:49:04 +0000
Message-ID: <748811bc-1506-47e5-8fd5-1bec55b6ed47@windriver.com>
Date: Wed, 5 Mar 2025 17:48:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] thin-provisioning-tools: 1.0.13 ->
 1.0.14
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250225034557.2148517-1-liezhi.yang@windriver.com>
 <20250225034557.2148517-2-liezhi.yang@windriver.com>
 <CA+chaQc87vMUKzdBsCe5amkpMuqsbgwQaM+F+uN6SknWvS=uJQ@mail.gmail.com>
 <1de5ac33-7f40-4cb8-9b0f-d95c5139870f@windriver.com>
 <1829DA21520CC898.4104@lists.openembedded.org>
 <CA+chaQe-645LjGQVU-kZtDJcHH892zRRZxa8Fn6uEmHcsMXKpQ@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CA+chaQe-645LjGQVU-kZtDJcHH892zRRZxa8Fn6uEmHcsMXKpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|PH0PR11MB5191:EE_
X-MS-Office365-Filtering-Correlation-Id: 01aefa9e-f938-450b-a243-08dd5bcaf72b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cjhtRVBKN1I2TGhyTmhtVm5EUExibFU5TEFBbjNyUGdNL1BnazVNSUZrRW1F?=
 =?utf-8?B?MHFkaW13bGVJQzJBVGRSWVNsYW50aE1hSkpYZStPRnh0THBJdUtoaFFONGdr?=
 =?utf-8?B?MnRYNjRDTDdmdk9HK0tLcDdBOXhuT3padlM5azhkNzJya2orYm1YeWpxU1hO?=
 =?utf-8?B?c0tIdW9RK3ZHcW16Q0xqMHI5RmpleXV2SnVudUU1U1JRenhHaXhTemo4M04w?=
 =?utf-8?B?SDd4d05XRWVvRXRYME91Q2RKc3huZ2pqWDZWODViaWp1a0Z6TkMxNk95c2lr?=
 =?utf-8?B?R0kvOTQ4My82ZEVUai9ZUWNNSHhhMWZmc2Q1YmpBcTFzMHhwNmorb1RrV2dS?=
 =?utf-8?B?VmR5TlhlWGZEY1pmQ2kvbi9CVTJtRXRyZ1MwcDZDZ1FwTkloSkdJM0h1RW9a?=
 =?utf-8?B?SzM4Q0NDU2JJQkRYM3p0WnlXZlRlRlUrWHpvaVMwamI2MU9JRWhhUTZBaVYy?=
 =?utf-8?B?eUVaNEpEN3ZrSDRxbEVlQ2xsRnM0NSs0eFZsUGdqYXNUSFBSVjM3bk9Jd2R2?=
 =?utf-8?B?dkI0OTZkcFA2cjV3eExsUXBtSW9BUE9rMWdRM1BPZVhqZGp4NmluZDBDdlVt?=
 =?utf-8?B?TEsrME13bDIrbFpVNDFsYVdHZkxtNktZTHhXdFl0a202d0JZL2tXbWJrYWtz?=
 =?utf-8?B?am1kRlhnY3JhSUlKWDVWMmQydzhZM2tKQ2RLem1vZHNpNW0zOHRMeHpCS2NJ?=
 =?utf-8?B?allnSWJLRVlYL2RaUkpBbkdqL1NNUlhVMDMyK1JlK3RlNWpPVWd4MXBhb1dM?=
 =?utf-8?B?LzZvNTdpMGg5YllCa3NZWE9JbGNLT3djdnoyQTJwNXNJbUxNWjhTb1FMeENi?=
 =?utf-8?B?Q1orNHo0WkpVd21VbXlrQ2hDeTY1SHFXbkMybVVmYTZWSWdidmx6V0RwRXp5?=
 =?utf-8?B?SmxNSlRXMC9DbmlSaTh4TmlOSVBOeTZ6RVNtb09VNHUwK1lvRWxiL0N0NEx0?=
 =?utf-8?B?ZFhMMk1zbVQrd0RGeEw1N3BRMDI3SVVoTDUzdUJTQU9MUDBWdW92SHRYaC9N?=
 =?utf-8?B?bExhSVlMa1k0Z09oK05oa1VYZDQvRXBIblBsR2hXUFlVSFFHYURXVkFkOHFu?=
 =?utf-8?B?VFQ4ZDd6dWFHRE9FQmdnU0FKS3FEK0x6VE8wWHlKT3NwUWZDYmptVjA3ekg4?=
 =?utf-8?B?K0RtQ1JKSjkwWjUyM3lGa0ZqMjJXRjJsNmxnRGFIOC8ycThnZVpGbmRjN2p1?=
 =?utf-8?B?emhSd2xscFFzZEVBY3RvVWpUeFcrSEdqK0hlVVhUY0VHT1p0VkM2S3cyMzdM?=
 =?utf-8?B?UEUwazQreFNKdDNpRGxYL1RzL2l4Ky9UdllCZW81ZS9pTDR3UXIrWVU3QnRx?=
 =?utf-8?B?cDlDRGRaMFc3czJJWThJcnU4Vml5V1UvNEVJczIyQTRtU1MyVHp0VFE5bmhv?=
 =?utf-8?B?MjVFdFlTdkp5R1N0THVUdEY4amVOVnRteXlLbDBTMVFWNlRESE5GdkkwdjZC?=
 =?utf-8?B?WUoyY0tCYUQ3bUY1YUZlNUVkb0QyNVhhREx4R2NOci9VOE4rYmt0OVhRVHlB?=
 =?utf-8?B?cldIaU9JMXdtazFMcDlKbkNVaFJYdEl3dUtrRDRqV2dndWdCVEJuMGpqeEdB?=
 =?utf-8?B?aHpSSXVOcTBiMjRQZEYrUUdINEl2M1BtUVV4WmlPcjk1RFd6WXJiOHFRTWNB?=
 =?utf-8?B?eDZCbzNBS1lObEN0WE5ReEJ5cmlIVnQxZkE0cVNsS2RsM0tPVkVJTUhRQzRG?=
 =?utf-8?B?U1FjL1BSZ2RpUXJ5blRFRjdNM2tFS3hGcE1WVk1senFrL1lxcDFzVlJma3B4?=
 =?utf-8?B?bkxOOEZVQisrT1hRRXR6ZGJ2MkorM21YZ05RUmM2V1lNYWNzUVQ0NDlJNkli?=
 =?utf-8?B?N3dpMHFMVk1IWFA2amF2QT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGVyM3plcUQ0Rkc4TUIrWFA5TXAxOS9KM2lwLzJxS0h1NUtURjMva1FVVXoy?=
 =?utf-8?B?YURnTUpqTldBYjJ1LzBUbXZHMjZ2aDlGMDQ2T0hHOVNDUXMrNGhDaTIvb2RO?=
 =?utf-8?B?dmU5S2gwMXh6UVI1dndNQnNXTW5HOHpkZHBVdW1ya0R1eGY4cXY4QThCWlht?=
 =?utf-8?B?S3JsQnFZS2UyS0JxYytKUzVwbzZiSStKd0t4MTQ5ZUlBY1B5L25TemJGcUhR?=
 =?utf-8?B?TW1DMzJKQlNkT1dCa1ZUV0d0OUN2U1ZPK2RGdFkwenZCMnoxK1Z3TjA5TVl2?=
 =?utf-8?B?S29aOFZVcE1tdGNpZkczcTNoTnVWSWhlVU14dVYvQVZENGtGMHZpRUtuVk5a?=
 =?utf-8?B?MmpQOUNmbTFxaDhwZXdmMmEzQmErUlB1K28yU21wZ0pEUzMrWjkzMGhCY3Yz?=
 =?utf-8?B?VVhuMURBYk9iZ3Zacm1YV2FQSForMXpyM0NNYUVIVjVzMEFoamc1aWNEQThu?=
 =?utf-8?B?b2pnRVk5N2h1cnNBVHV0c3Z4MDlMSjVIQnFhVjA2bXh6UExaNmpWeW9RaGRS?=
 =?utf-8?B?NmllcVNsZ3pJYU43YXlRN2kxelBWRHh0am5uenJQYVh4THV2RU1MclF1MHA5?=
 =?utf-8?B?b1BlMWN4UG5nNVFwL1ExUDNSeUZGRnZBWEJTcVdVajFCTXZBdkRzaW9QYzlJ?=
 =?utf-8?B?QnRWTk1PQjI5VEp3ZFJENHBnY0d5Ylh6bUZEMVllRTZQWnphNHpDSHFOcmZB?=
 =?utf-8?B?aVllb0s1MnlTM09GSVh3cS8wL1J6L1hvOHlJSTNHc1ZWTnVKNG9GNjVPeUNs?=
 =?utf-8?B?cUN3V0VXUVlnMTVKNzY3Qm82bkFkcHVkT25UWnlNRjBYZUNDNGNIUURCVFVU?=
 =?utf-8?B?Y1RYbzIraXZ1bjhyZEpSa3hwTUZ1MEZIM3E5WWt4Q3NOMEduMlFDZVJUZUEv?=
 =?utf-8?B?THlLVEFlcjBONzJnT05ta2UvaDNHbzVDU1J5MHhYR3pXNGRrZGNwZm9BbTdB?=
 =?utf-8?B?THNzb0JQenhEY2JwekV1cFpzRWU2WlhmNDVEWFc5QnVQdEdjbjlqKzh4Ym1I?=
 =?utf-8?B?eGwwZStaaE1URXk5MjZ2bUUxR0xEbW9QVEJJeTd0YUZIYnEyRDErT2tIZGll?=
 =?utf-8?B?YWtPVlRhZmJNYXpzcmhTZG9qYzMyMzBqbjJHa2RFZTR6Mk9ldDR3alhPYWpC?=
 =?utf-8?B?cGJ4Y0NFbW1VanBPSVB0emMwSDdGc29pZnFxMXV4dUxTRW5wUG0xS0ZKOFdS?=
 =?utf-8?B?N3lKcGdPTHV2VDYyZ01jaXBkUHJVb3kxa2hvNm9RVFdtNDRIMGNBZnYwci81?=
 =?utf-8?B?RkVwYkc2Q3hhREdDVUx4NTdVTlgyOFVsenE5ZDFadFBqSllwMzJUckhlVXpL?=
 =?utf-8?B?U3Z1RytjZ0tJSlhiT1Jra1Z2bjBVdXYrMmJua0FCWXE1VHdHS0pTRlY5Q0hv?=
 =?utf-8?B?VTJ2dEFoVFJBTDdXZGNUejN0QU9XVUJkQTMxWklkekxPdFN0aWMrZEJ4SFV4?=
 =?utf-8?B?dFdCbzUrVW9VbTZFSDZNU3JXNlo5YVdTUk1wMDZNb254bVJEd1JVYUhhVmRo?=
 =?utf-8?B?QW1TNUNtbk1NemdoUmt0WWNBUTNqdnhOc2FPNEdWNmMwOFd5MXJ3cit4cE4z?=
 =?utf-8?B?M3V2SWVjdmxSZzBEN3gvYzB3TUJEcnVsRGtidStBUDJ3ZmJBOEpKYnNsUWV2?=
 =?utf-8?B?M1ZhYXJJRlREZUIvM08yY1B0NGthejZjYlVOVGxNR2N1S2Z1b0NRbmZCeUJa?=
 =?utf-8?B?M2EwWFJSam1SSFR4RzE2WVAvQVBHYkhGNDNGSW1PV3VmeXdsaURqYWNMaTJK?=
 =?utf-8?B?VDhSNG41a1gyY3E0LzdQUWNiZThNbFhNd1k2MU94TWVCOHZIT1JQbTREY2c4?=
 =?utf-8?B?UHNGVTdZaEhZWVBtaDJjUjJBZ2NwZjIwd2ZDVnJyTC8vNGNvMUVMV052YUkx?=
 =?utf-8?B?K1dlVXJvSVNpM2lqb0Q4NVBMQUtGWDVLc1JkU29sci9NRXpzSjVDVjBmOWpF?=
 =?utf-8?B?Rmc1Wm9sb2xGbjViT0d1UE9PZ3ZUcnJ3dTNSZlhzZVFqU2RDaEQ4cjNkZVpq?=
 =?utf-8?B?NmNZYjdpSnUwZGpBbW5PbHJ1WVNySXlkV2xNQzVMYkdXYW1TYXVpZWNpT0Zk?=
 =?utf-8?B?Z29FS0FsRFpScTlnM2NyR3FwMCtlL01KanRDdUUrbkpWNGNsRDhSK1FlcTZo?=
 =?utf-8?B?UldCeXc4YVBXQ1ZIdnVTMUQxOEFDZTY1QURHaC9nbG5hSS9Ob1UyVDNBUnpo?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01aefa9e-f938-450b-a243-08dd5bcaf72b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:49:04.8124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5Aoo0PFD4LoM2NiwzGFcqsWYj+uX7BnYJUPoQRQgrRKfgVrL3oQ8FTAVIt+59QP3kdM9xrvaGsOXYE+FS23iJEtCjxAbhdG+qIkVul2kQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5191
X-Proofpoint-GUID: nT9wsEA0j9tAfo3TLOdIVrPYJ6ExzumK
X-Authority-Analysis: v=2.4 cv=ddB63WXe c=1 sm=1 tr=0 ts=67c81e16 cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=4V1w2jamwfv46CPfP6gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QG2_Rp5WRQzS9VxpHeWAHfEWuza_nOBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050078
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52557aPv007362
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 09:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115747



On 3/5/25 17:16, Martin Jansa wrote:
> Here is the lib32-thin-provisioning-tools build failure with
> qemuarm64-multilib (from the oe-core:
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djans=
a/master&id=3D13bdeecb4b54fde63444edbeaaa23bea9cc7b40b
> )
>=20
> http://errors.yoctoproject.org/Errors/Details/845300/

Thanks, I can reproduce the error with MACHINE =3D "qemux86-64-multilib",=
 thanks=20
for fixing it.

// Robert

>=20
> On Wed, Mar 5, 2025 at 9:16=E2=80=AFAM Martin Jansa via lists.openembed=
ded.org
> <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> On Wed, Mar 5, 2025 at 8:58=E2=80=AFAM Robert Yang <liezhi.yang@windri=
ver.com> wrote:
>>>
>>>>> +
>>>>> +export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir=
}"
>>>>
>>>> This path won't be correct for multilib builds where target ${libdir=
}
>>>> might be e.g. /usr/lib32 while native libdir is /usr/lib.
>>>>
>>>> Is there a reason why you haven't used STAGING_LIBDIR_NATIVE variabl=
e
>>>> which uses correct ${libdir_native}?
>>>
>>> I copied it from meta-oe/recipes-core/uutils-coreutils/uutils-coreuti=
ls_0.0.29.bb.
>>
>> Hi,
>>
>> ok, will send fix for uutils-coreutils as well (will check why it
>> wasn't shown in my world builds yet).
>>
>>> How can I reproduce the multilib errors, please? I tried to build
>>> lib32-thin-provisioning-tools with poky, it works well.
>>>
>>> local.conf:
>>>
>>> MACHINE =3D "qemux86-64"
>>> require conf/multilib.conf
>>> MULTILIBS =3D "multilib:lib32"
>>> DEFAULTTUNE:virtclass-multilib-lib32 =3D "x86"
>>
>> What is STAGING_LIBDIR_NATIVE and libdir in
>> lib32-thin-provisioning-tools for you?
>>
>> Try to add:
>> BASELIB =3D "lib32"
>>
>> that's what we're using with:
>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djan=
sa/master&id=3D13bdeecb4b54fde63444edbeaaa23bea9cc7b40b
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#115744): https://lists.openembedded.org/g/openembe=
dded-devel/message/115744
>> Mute This Topic: https://lists.openembedded.org/mt/111371873/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

