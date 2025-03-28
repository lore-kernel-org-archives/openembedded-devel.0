Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963A8C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:54:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7624.1743155640258350097
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51826d0eb3=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S69tac005457
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 09:53:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1q3q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 09:53:59 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52S9rwtY008493;
	Fri, 28 Mar 2025 09:53:58 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1q3q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 09:53:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zo24iA6Ckha9VrXUPdyXyIS8qpCbm7CTNf751z79tI+hQI9VbFpfLJj1O1eY4erIiRXxI1M7H/DDI2kE737uALNEilXOH16HDnnPtgmeXov5JLHchHjDGXCQUNi9+dcIvsX8QgjUJHmK9ActZBZVGJQSmQlfh7cp9oT29YsViAE9xIkh3BEqPN6bEep3BzdhJjht/6aulliyjZ/7kf5DtU0Ne4uK1IqEtG2AE7GyyPnLsMVP3NeB5I+TbWxOU22YC0Y18d/bQpQ2cJ806I3jRQxFzXiBZ216DTKFqtVPO9YmK1bc1QKG+142sH3FvoDZAVBabWVaRfbtFodAmu4VHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WA2E0TZGui3FFqIWMWVkm9Xaw7LyOhrZj6uZX2XTmuA=;
 b=OFRBSzY1fsm0RuJWibTKmKIHZauiQNwoMQmXhr1Cb1cv0OebdWgNTCSm2nWpssGrLVLu5G0Focg/L9qZD4Fe23CZxxa1YQqJbqLBtNSLjZzNq2hjJSmhDIadY5co4U+LoEUuhYIj3b2Mlm9JUqOwoEmWTdmXImXgXbtO9DnkpyqLFbR7AV41EzioCMTgX0Nq3pTANvXgk4oG7ku+M3AloqScHzJbYTaVwQ+DZw1gVNoJVCCq6XWJV8KDArixQBsQz5FjbLXF9IjojWcssOQwVrXZ5U/eGmr02h1ptrWQV429jOnbHUIoA1TYKKuH+VcGykz5qlYqgkVuLtcWFaGlSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 09:53:56 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 09:53:56 +0000
Message-ID: <9a7011de-0600-425f-b42a-64d2450731b7@windriver.com>
Date: Fri, 28 Mar 2025 17:53:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] openvpn: renew the
 sample keys
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
References: <20250328090156.635557-1-haixiao.yan.cn@eng.windriver.com>
 <CAMSfU+7JDnenTb7tF+ZJipDekr6SsWT-WzRon1PASPNQWb-xoQ@mail.gmail.com>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <CAMSfU+7JDnenTb7tF+ZJipDekr6SsWT-WzRon1PASPNQWb-xoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0132.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::15) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SJ2PR11MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d0994b-dc30-45ba-937a-08dd6dde748e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c3cvRWNvcVhUTFNvNGFIQmM3N3ZUNDB3aTVNM0UrQVJncTUrMG0zTC9ZT3dC?=
 =?utf-8?B?Smlzd1BtS2N5TzRIblEydVJlMlBZNEdVYXdYUXlxbGR6ZEY0MS84RlVxdW45?=
 =?utf-8?B?KzVOTGJhSEc0c3BqOW03dElIODlraTYyV3VQUVd4MERMYXh0c21zcnFSWjFx?=
 =?utf-8?B?aEY1dXJFT2lWTnQ1Wi9DV0V3ZDhBQW1LNVpkVFVGd3I2d3A1bXZuTlBBWDkx?=
 =?utf-8?B?MlA2KzlMZmxCRERBVlVNbTd0V0ZDU0NOVUVTWWpDSTNlUXozeGtwNjlSMVBJ?=
 =?utf-8?B?TldxQmZBeWFoeEc1U3VDVmVIMHY0dFV5ZGRRajMyY0s0UHMxcjFjalcwcncr?=
 =?utf-8?B?Q0VDd2lRcTRuV09sVXR6Yzh4Z0o3RXhWK25veTc0eGM0ZVN3VzhUMldsZHJH?=
 =?utf-8?B?dHRNMzBJM1JucWUwNkV5eFBVa1haYkRBeDFqTkxmTnNjNEl6L3A5Q0d1OUV0?=
 =?utf-8?B?RTcyRXBQSHpnbENzVWxCcWo1T21nS0JkQWtYUHovU2ZhZFE5SHc2MmR2QmhY?=
 =?utf-8?B?ZVhsN0RrUVJmRnVGcElEWXFqNGF3L2ZYaXN2em5zRFRydFZOYnh0NjRVTGRR?=
 =?utf-8?B?Ym15T2QzN2dkRDQvTWhkMFI2aER2Tml4ajV6T1JDbnBaelRNUVNrQ1BPZ280?=
 =?utf-8?B?dUtiUFRRR3RhcDdFWWNUTDdyRGJJTFIrWE5EUUFRcWZPNURzK2tXSVd6bTNJ?=
 =?utf-8?B?dFNodWxYcUREenlZVFlteTVIdno4Y05QdG1zd1dHV2FIS3hNWGcvQzJFTTFy?=
 =?utf-8?B?TGRnSHh2a2F3NjJaakJVaXZhRVMvem0vajRLUzNNNXFqUHZYVEk4L3lCQ0w4?=
 =?utf-8?B?U3BVN05NVTRZZ1RRSFY2Mk1KcGhtazdvWU5Wb2JsL0VxM01SQU9QQncrVVJn?=
 =?utf-8?B?cWpOQUJWNVMyK2NsZVlUNjBZNVVRcUl3Z1VwL1NQekErQWVpUDdmamVjbE4z?=
 =?utf-8?B?VmpEOCtNTzdua0hoR1FaN0xOaWZhNURMU0xmZEIwMTZxbWJybkVSUnhEZkZR?=
 =?utf-8?B?TDVJblNxR3dSZDVPdWNoRno1UXk5K3FUMVpwSk1FZDVHS1lmcFNpcFpnSkFj?=
 =?utf-8?B?T0tCWnkwQ1AzSDdVWVJseVMxcGIxeVR3b3FOa0tjM2UrdlRxTWphSWlhall3?=
 =?utf-8?B?SHRCVkwxZGV0azgyaDYyZlFTdS9tR2dRcFNxZWo2ZDRneTFjbXQvQUV6bnc5?=
 =?utf-8?B?RDBwc0xJTFlYNEFUWkM5dHVPRzBGaWd2bGpWbm9iUEozOGt4RVZkMWpCVFQw?=
 =?utf-8?B?YlJqMUFMYVFYbjI5c3FjTlFrNldtRUhWM000TEpIQWl2N3NtbnVQdGtPbDM1?=
 =?utf-8?B?d1Mwc3lubTdCZTZUeldIT3pBd3UvR1REQ1UzSmRpazNIZG1mMFRKY3NHa0oz?=
 =?utf-8?B?ZFcvdkRDRTExN1JiL2VJMnlyK0g3M1pFcSt5V202VUtldXhmR21ORUM1RVM4?=
 =?utf-8?B?UFA0VmE5YTBnTDkxdVg0VEhGa2ZvWUlQODcvL2UwWkV6VUNzSXZ6VDA3WjVC?=
 =?utf-8?B?Tm9NS0VCSkZPdEY4Zk9rUlMyb0ZwMklvYVpDQWV2OFVrdFE2T2N3aWxvRmdt?=
 =?utf-8?B?L1N5bVVaOGdpeWZJb0c4NjVpN21wZjBQcmwzd3RKaW10VnB6czdvWExVVkdP?=
 =?utf-8?B?R0dSTFluWjRaekxQSVZMT000Zy8xU3NvTGRJTE1jaVgwS0lYNUZKZVVuNGxY?=
 =?utf-8?B?ZncrMXNCUzgyNWdHRkNsbWlhN2xRNW15QlRDSlR0UkZpazIrVXgyRXdiVWZl?=
 =?utf-8?B?MXJkN3UxK25UZUpoODJQdEE5QjBQTXN1SCtQMUlNdkVKQ1dYc2ZHSGl5WWdY?=
 =?utf-8?B?UjRXSTVRakFtZE5VTUlydz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFR6R2pvYUQyc3FMMFAvekxqRERXVkZTWUdlQnRMdUVVbmlGbkNnU3VEbGww?=
 =?utf-8?B?bmhrODV6TFZFNThzL21ENVpZY1FxQXBkejJvYmtHU0NJckd2dzBlWWl0V0Jw?=
 =?utf-8?B?NDJKQ1d3UGhDbEcrUDdGVVIwM2lJdUlodCs4QWl0WFd6eCtmNGh4dXVCeTE1?=
 =?utf-8?B?VzJyOVQrTENHVkRtS2FrdkZJbzRxdFRqd2pTWXlXN0dVM2Ntck1zWmlhYkx2?=
 =?utf-8?B?SnlzRkdlYVR3Q1ZCL0djdVNQeHZRcEpYUGhrekdwTFhWNXJFTjNyQTRvKzZv?=
 =?utf-8?B?aGgweFRkaUFhZVZJR0dVV2N4TTRwSTFYVFYxaGRqbGo0WnF6dzhYLzNDKzF2?=
 =?utf-8?B?eUhYSURuNno3cURzWW54YzdpZWdmVTZuNDVmZ3NuY0FlTmFzRWs4dVBNRXBp?=
 =?utf-8?B?ekN5S2hwVjYvV2xvZnVtNlkxdEp5OENISjAzcHRqU1gvWWdOOTdPdWF2aXRr?=
 =?utf-8?B?aXpmZDhWbjNoWjhYWExzOUxRank1WktDN3QybmxydHJZTzZmNEVYUzU3SFNq?=
 =?utf-8?B?emhsS05vclE3Q2poZHMvTm9RTTBvcFNpeTVnNWFOL2I2NW96dDZJTVR2ZTZV?=
 =?utf-8?B?Qk1kSVhSdnZuU2R4YytvdmRKTUNHeENhakppUjFUbFY3Rkxnb2RuMzZPOUt0?=
 =?utf-8?B?RDNTQUg4ZDhDN3dadmZjR0RQMU5oaHRqM0dLT1ppQUNTbVVaUmdOR0ZWaEZX?=
 =?utf-8?B?N2I3YXlLTmUwZE9jMmRHU1ZZejNxOThNeEU2K3lUaTZwOE5UTWZYMmdDK3hX?=
 =?utf-8?B?aXJZcHpKQ0NlOG5OVHFRM1VGWmVpbXRTa3hOWWJGVUVwT3BNT2g4QzNUWXk1?=
 =?utf-8?B?VW9VdjdMdUI2VGd5TDBMbmZxRWJieUs1dEs0RCtWMFFpUE9iZUV1SDBtZVlo?=
 =?utf-8?B?cWJLOTd4Nkt2b1BiOEtuZkNaQytWWTNON1Y1NDNLWTd6UEZtV1VYQWhlWnNJ?=
 =?utf-8?B?OFRMeHBFcE56UnhINEUvSzZ2aTFaRmxNNzBPR2VsUmZwOUtGaEJCU21WUUs0?=
 =?utf-8?B?VmpYK2NIVlAxaHJRTDd0a0swTkRjWHliVWYzQW5NTWIzSjVrSDg1blZWRFQv?=
 =?utf-8?B?OHhrbjVvK3p5cVpya0RuWEpMSXdFQ3d2aHNaZ3U2LzVwRC81YXFrY245eVhL?=
 =?utf-8?B?TnQvY1QvbDYwY1dPZ2hwSEE0VzBBMGl5NFBCdDBKMWJyWXdSMjhQYnpscU9w?=
 =?utf-8?B?dVF6MmlDN0V2enlPTUY1WEhXYkErU1ZtT0w1bWhXYUMwRzJKdUY0WWM1d1gy?=
 =?utf-8?B?TUJ4T013bkluUXBkSTU1czg4RFp2ajlCZ0pRenhTc0xmak0wVUkzcFprbTFj?=
 =?utf-8?B?emhodVNGM01Eb1VHUng4ZlBvVUd5akJPZnFHMkpZaE9JSUxoc05kenQ3R3I1?=
 =?utf-8?B?YVo0RHlaY21vUWxqSGMxaERvVWZPTTljaFEvQ3JyWnVYS0FZZGFhTTdDYkJG?=
 =?utf-8?B?UGVNU3hEY2M1cmdIbnd4cXRCZzA2QldLUVZNQnBTcW1hNmR0d05BRHlLaldv?=
 =?utf-8?B?RW50TkVBd1FCaUVKODlmZ2c1aklYVEwvdHNhUDYyTWhBU0dxRzBwU21rYlQz?=
 =?utf-8?B?NWZrM3ZWM1hzOWVkbnJaQUVuNVlPU2dkVURTTWFOMklVWm1abmNKQ3I5bUdh?=
 =?utf-8?B?YndJZnN3VzJUMnppZWdjenRqNGpyQU8vbTNER2Mrcnh5NG5DRkRYZnNYa3kv?=
 =?utf-8?B?S0pNcUpMeUJvYkNpbCtIY0pzYlBiVENrVm5uRHFMemVWZUt1MlA5M3E5VHJl?=
 =?utf-8?B?cUkwbU1pclpCZ09WTmJQMURld0M4NDlkU3AzTlNWSUFlcmZySEUrcXlSUEJ1?=
 =?utf-8?B?TjFveDVrSVJFeWlaWGlKczMxendNUXczN3lJZTU0RXI5bEpKOC94VE40NTJo?=
 =?utf-8?B?YitjRE8rSEhpSVFMMFdMMUhJS2tlcUxrZ1hIb1VubWxGUlZSa1BzSWQ3MHZx?=
 =?utf-8?B?bnNmcTAwcW9JcGZSWFhteVFjTHJRbEhBSXhnYVloZlA1TkRDdUJSaHB0K1Jl?=
 =?utf-8?B?TGE3WG5KV1BvSlp1OU5BNkpYcmd3Mlo2ZzZhU1d1T2lBb0t1YmJaOTBlVXRH?=
 =?utf-8?B?eERHZk1NQ1NDWlpneVk2aWtwcnpHSjg1dUhORU44M1lReGp4QlRWZGpteVBy?=
 =?utf-8?B?KzJUR1hCOWoyQ1FSemtiL0Q2NktQdnRsQ21SZitEeS9PYUxvNTYyT1AzK3VF?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d0994b-dc30-45ba-937a-08dd6dde748e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 09:53:56.4492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZInJi4M6H0vKD5CwBhKXDaQNxsH8rGECI+SFWJ28pdVfjegDzp2evjTgStfBJe4rnQSQPAn1ki+P/7ypFZVezMk38t0CdGasmDlZG0ULDZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8421
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e671b7 cx=c_pps a=r2a4NctkKoQReJT0uaIV7w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=Q4-j1AaZAAAA:8 a=hrX7nugpAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=9gK4UEqLAAAA:8 a=9dNbsytUAAAA:8 a=uDo-SIiEAAAA:8 a=y_DwuYRQj_bGYPjKd_oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a7hg5nYsa2Ta-5Qc2wJl:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Q1RLv2d2K-DeJgb8p1rq:22 a=gPpeecpFUKP6j8iU7U-x:22 a=Rkhf4GTZPwEC63LfVcCP:22
X-Proofpoint-GUID: 9XGRgQdHVj_OVESeIUJg8TrkcuorhCZ_
X-Proofpoint-ORIG-GUID: tiCQMvPQT_rojlSRfnhOqfqFA9wfgJ5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280067
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52S69tac005457
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 09:54:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116351


On 3/28/2025 5:21 PM, Yoann Congal wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Hello,
>
> Le=C2=A0ven. 28 mars 2025 =C3=A0=C2=A010:02, Yan, Haixiao (CN) via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!cD524xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD-XZyeDXvwpY540ouIW6_td12AAXsz9tj=
DLI-CCHiR7_Qg36QZo-HnS_GA$>=20
> <Haixiao.Yan.CN=20
> <https://urldefense.com/v3/__http://Haixiao.Yan.CN__;!!AjveYdw8EvQ!cD52=
4xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD-XZyeDXvwpY540ouIW6_td12AAXsz9tjDLI-CCHi=
R7_Qg36QZqembjLHg$>=3Dwindriver.com@lists.openembedded.org>=20
> a =C3=A9crit=C2=A0:
>
>     From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
>     Renew the sample keys to fix the test issue:
>     WARNING: Your certificate has expired!
>
>     The renewed sample keys from [1] contain binary files which can't
>     be patched
>     by quilt, so archive the files into
>     sample-keys-renew-for-the-next-10-years.tar.gz.
>
>     [1] https://github.com/OpenVPN/openvpn/commit/98e70e7
>     <https://urldefense.com/v3/__https://github.com/OpenVPN/openvpn/com=
mit/98e70e7__;!!AjveYdw8EvQ!cD524xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD-XZyeDXv=
wpY540ouIW6_td12AAXsz9tjDLI-CCHiR7_Qg36QZq5QocnCw$>
>
>     Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
>     ---
>     =C2=A0...mple-keys-renew-for-the-next-10-years.tar.gz | Bin 0 -> 28=
118
>     bytes
>
>
> That patch does not apply :
> =C2=A0$ b4 shazam 20250328090156.635557-1-haixiao.yan.cn@eng.windriver.=
com
> Grabbing thread from=20
> lore.kernel.org/all/20250328090156.635557-1-haixiao.yan.cn%40eng.windri=
ver.com/t.mbox.gz=20
> <https://urldefense.com/v3/__http://lore.kernel.org/all/20250328090156.=
635557-1-haixiao.yan.cn*40eng.windriver.com/t.mbox.gz__;JQ!!AjveYdw8EvQ!c=
D524xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD-XZyeDXvwpY540ouIW6_td12AAXsz9tjDLI-C=
CHiR7_Qg36QZpQo1klSw$>
> Checking for newer revisions
> Grabbing search results from lore.kernel.org=20
> <https://urldefense.com/v3/__http://lore.kernel.org__;!!AjveYdw8EvQ!cD5=
24xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD-XZyeDXvwpY540ouIW6_td12AAXsz9tjDLI-CCH=
iR7_Qg36QZoEHtJI1w$>
> Analyzing 1 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
> =C2=A0 [PATCH] openvpn: renew the sample keys
> ---
> Total patches: 1
> ---
> Applying: openvpn: renew the sample keys
> Patch failed at 0001 openvpn: renew the sample keys
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> error: cannot apply binary patch to=20
> 'meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-=
the-next-10-years.tar.gz'=20
> without full index line
> error:=20
> meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-t=
he-next-10-years.tar.gz:=20
> patch does not apply
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
>
> Look at the patch, it does not contain any data for the tar.gz file.=20
> Maybe use the "--binary" option for git-send-email/git-format-patch?

v2 has been sent.

Thanks.

>
> Regards,
>
>     =C2=A0.../recipes-support/openvpn/openvpn_2.5.11.bb
>     <https://urldefense.com/v3/__http://openvpn_2.5.11.bb__;!!AjveYdw8E=
vQ!cD524xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD-XZyeDXvwpY540ouIW6_td12AAXsz9tjD=
LI-CCHiR7_Qg36QZpLWq-ouw$>
>     =C2=A0|=C2=A0 =C2=A01 +
>     =C2=A02 files changed, 1 insertion(+)
>     =C2=A0create mode 100644
>     meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-f=
or-the-next-10-years.tar.gz
>
>     diff --git
>     a/meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew=
-for-the-next-10-years.tar.gz
>     b/meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew=
-for-the-next-10-years.tar.gz
>     new file mode 100644
>     index 000000000000..a79e6e4d1576
>     Binary files /dev/null and
>     b/meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew=
-for-the-next-10-years.tar.gz
>     differ
>     diff --git
>     a/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
>     <https://urldefense.com/v3/__http://openvpn_2.5.11.bb__;!!AjveYdw8E=
vQ!cD524xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD-XZyeDXvwpY540ouIW6_td12AAXsz9tjD=
LI-CCHiR7_Qg36QZpLWq-ouw$>
>     b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
>     <https://urldefense.com/v3/__http://openvpn_2.5.11.bb__;!!AjveYdw8E=
vQ!cD524xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD-XZyeDXvwpY540ouIW6_td12AAXsz9tjD=
LI-CCHiR7_Qg36QZpLWq-ouw$>
>     index 810a60308b80..6aed4145ec00 100644
>     --- a/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
>     <https://urldefense.com/v3/__http://openvpn_2.5.11.bb__;!!AjveYdw8E=
vQ!cD524xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD-XZyeDXvwpY540ouIW6_td12AAXsz9tjD=
LI-CCHiR7_Qg36QZpLWq-ouw$>
>     +++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
>     <https://urldefense.com/v3/__http://openvpn_2.5.11.bb__;!!AjveYdw8E=
vQ!cD524xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD-XZyeDXvwpY540ouIW6_td12AAXsz9tjD=
LI-CCHiR7_Qg36QZpLWq-ouw$>
>     @@ -11,6 +11,7 @@ SRC_URI =3D
>     "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz
>     <https://urldefense.com/v3/__http://swupdate.openvpn.org/community/=
releases/$*7BBP*7D.tar.gz__;JSU!!AjveYdw8EvQ!cD524xFCK387RwSxzAg2cGnCVz9v=
mZd5QUCeD-XZyeDXvwpY540ouIW6_td12AAXsz9tjDLI-CCHiR7_Qg36QZoOOT71bg$>
>     \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvpn \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvpn@.service \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvpn-volatile.c=
onf \
>     + =C2=A0file://sample-keys-renew-for-the-next-10-years.tar.gz \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
>     =C2=A0UPSTREAM_CHECK_URI =3D "https://openvpn.net/community-downloa=
ds
>     <https://urldefense.com/v3/__https://openvpn.net/community-download=
s__;!!AjveYdw8EvQ!cD524xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD-XZyeDXvwpY540ouIW=
6_td12AAXsz9tjDLI-CCHiR7_Qg36QZp5pa6n2w$>"
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#116347):
>     https://lists.openembedded.org/g/openembedded-devel/message/116347
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/116347__;!!AjveYdw8EvQ!cD524xFCK387RwSxzAg2cGnCVz9v=
mZd5QUCeD-XZyeDXvwpY540ouIW6_td12AAXsz9tjDLI-CCHiR7_Qg36QZqtYcMHeQ$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/111950963/4316185
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1119=
50963/4316185__;!!AjveYdw8EvQ!cD524xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD-XZyeD=
XvwpY540ouIW6_td12AAXsz9tjDLI-CCHiR7_Qg36QZpp9cN-PQ$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!cD524xFCK387RwSxzAg2cGnCVz9vmZd5QUCeD=
-XZyeDXvwpY540ouIW6_td12AAXsz9tjDLI-CCHiR7_Qg36QZpzoB2bVA$>
>     [yoann.congal@smile.fr]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> Yoann Congal
> Smile ECS

