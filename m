Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2708AC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 05:37:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.30386.1741757849766791259
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 22:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=516657e3b4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C3inSp029571
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 05:37:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0ga05we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 05:37:28 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52C5bS7L030744;
	Wed, 12 Mar 2025 05:37:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0ga05wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 05:37:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJZ2/k7Dc5tIrVoLiiqHIHhP3vsGj6j22GEDKibSCe0mtki4iCOWu9KOkT+pMH/RQteNF6oV3uZX/t2MGpS8SAh9PoXA36Mtez2Euvj8YvJf8zOJPhPMfiK9ZD4W7MkRBw1vrzu6EausJ5aqNQtFtre7MOqR9SlQEyGKYRBR6o2rD8YyePIl2pxF+DYcFHHjmE058OFHYHebMkuzoI8WKfJkwp1RWxcZRqP2QZHElt5bfDan88zfKqQaNCiwDDiz/dqdOuopCryExDAieG13Fhb9x3JWcAnDj6lCI8HhpnWhzAUOl6PbnDIVpjFPJ/c5D6j1p+PWcVOCkxd5CF6FzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZxFbK0l8QEdO9qx+ZruFW7rnHiNoTikIrlWQIjSXV8=;
 b=yWBaz9ZlGk+JtKYLvuQPLqr21yzAPa1LetGaA+pNXPEaWPu7R3PhAu3qOYtictDVkQ+U76ny7RzKLG3CgfgbqudEWPQVDHaNEIXV/4BqSMCZjhjcfWd4QkrUtu1/JI3aQkoFMdFMtfKREPX9145rwiXKUzA9WeEgVU/4+2RbdnQ5jltGpXtqQ06UMo3PSUXMOBQaPUsjkF8SFj5v13zKApIuZ+CXjCCOdeIOhIFUIp+bFVk729w3ekc6GpYZTFqdzDh/E8CzwIULeSh8zk7v+jCfk/z2wGL0iOWbLVGEZh1ayTS3RwUe27ofV4MVvK4/iFLUBJMl7NXHXQKj4CBTLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 05:37:26 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 05:37:26 +0000
Message-ID: <95e9c398-375c-4862-8c76-5122424c853e@windriver.com>
Date: Wed, 12 Mar 2025 13:37:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] minizip: Add new recipe
To: Khem Raj <raj.khem@gmail.com>, mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20250312033439.2958141-1-mingli.yu@eng.windriver.com>
 <CAMKF1srf3Gs+TesLXd=oC-pL95SQq5-UBP5HREWcmaicM1N3=Q@mail.gmail.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CAMKF1srf3Gs+TesLXd=oC-pL95SQq5-UBP5HREWcmaicM1N3=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::15) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DM4PR11MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: bffecaa8-337f-4df3-6c61-08dd6127f894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZFZySFordmNvbVFXdWMxalJTbHJhc2JtMHhFUDNJUlVIZmxOVWJYeFNrYTd3?=
 =?utf-8?B?RlZWUWx3ZkpubnN6VUJubVYyaXlUV3lJRmlhOGNzYlE0dEJ3NllkMjlseWZ1?=
 =?utf-8?B?NS9Jay9RNXNvcS9WK0c0OGYydk94RTRKb0d4NnhJcjZPTmczT1d5N2lPR1A3?=
 =?utf-8?B?QUhTZ0lBNXd2MEZKZjYrM3lxZE5pSjlmWUk2YmJWU2w2aEsvcVM1MStDd1hj?=
 =?utf-8?B?REU5L0pFYjdLVHk0YVZGR2grbHhVMGczb0xWdVRpWElIMWpubDVlVHJDQnl6?=
 =?utf-8?B?ODRCRlhvc2lUcC9LekVzUFVoUjV3L2xyVjFnc3llaWd3RkFTWTVkcC9ZWXJZ?=
 =?utf-8?B?S2VyVjZNdkdzRXNidFVmY0p0UnIxY01JMXNPdVpuZVJDakJGTUlxbE1oNGxY?=
 =?utf-8?B?eUJYR1BLUmowMkZ4ZmRIY2JVeGFSWjUxclUzem9GeXNjZmE0d2N2NUQvWUVW?=
 =?utf-8?B?ckJQdGlzbUsrZ1NrVWc1SEZZTlMxTDI4M1h2MU1kMGhuZTFkRTVVdlVjMnNv?=
 =?utf-8?B?YWFYMENzeGZtaUZCZmp0ZEtMSUxBWGVDUVJtNTB0QWZ2ZU53akJyQ01XaHdF?=
 =?utf-8?B?a1dLT3VNU0oxMjFXYU5wQWN5ODRwa05LSTNsaHVtRE1iWmdlU1NVdTBiVXBy?=
 =?utf-8?B?Mm1qVzU0S1B3Mzc2Wkl1WXg2MUVEb3BhS2FZb21vS3pHVGdxcTFLdVNxUzJL?=
 =?utf-8?B?TStaa3FKaWRsZ0FBVEp0NXhvWWhmUnl5aGtCODVUNGpaQzNnMnBKRnN6cUNK?=
 =?utf-8?B?amUwMGgwdFN6dGN2QUZXK2JZUGVpS2IrYkhmMnk1TjFWZnBCRjN3RU56NzJE?=
 =?utf-8?B?NXU5OFA5bzBvQnh6MkRtd05yQzRIWExrdzJJR1dlWnh1Y21rOG5WKytUVE9F?=
 =?utf-8?B?c0tjZkRuc2tWd08rZEYrWXNjYnBXSmhvazR1ZDRkRnBidEdUR2owd3VwNHU4?=
 =?utf-8?B?OEZNMlBwQWJROWpzM09EUEZZak9pZzdDQS8rN0NOMlNvVVN4M1JtSmpLRW9F?=
 =?utf-8?B?aXovZVpneVhqdjkweWo1NVhlTE13NU5mNnZNd1JMV2p0ZDFHOHR3RkJqVnhU?=
 =?utf-8?B?czJBUklYMi9pM1ZrckhzQ0phN2lLQ2V6UnZIQjR3Zk1GMWhLUS9wbGFVVFNO?=
 =?utf-8?B?bU43dFVYWlBuV2ZKemplRHg4Y3ZZT1djdXVKQkY4ckpsZmJPNEI4RUNUaEto?=
 =?utf-8?B?T0hvVXJsUlJWZGtXWTJKbzBQRmRyajJKSEJ0cjYvbS9MVmxNT2VnS0gwa1FB?=
 =?utf-8?B?cTJzV3BPSVNtS0o2cWhUR3BuVzNNcWJuRzFDMDhCNGVmaC9GQTJ3c1RpT2g2?=
 =?utf-8?B?VHRjR1VuK1NrZktUdFdydGdRY3IrbTJXVW1Wb3kxRjE0TW9Ta21EZGVnZGRB?=
 =?utf-8?B?VW44K3BMeXJ4YWx6dFU0ODh6YU13a0M2V1FmWkhSdWlWRWRleWFlTTNrbFQz?=
 =?utf-8?B?SFl1V3lyamZZTVVKTXNXbUl1UlVFNTlHbzJwZkhheWNNZ1Z2N2R3UWtVZFZK?=
 =?utf-8?B?U3l3OHdCQUdyV2VoZWV1RExYR3ZqbHZVTGRSb1NoZGRoWmFCdVo4bjdxWW0w?=
 =?utf-8?B?ZW5SM1BpemNEejV6bDUxZ2dOY2VBdnI2QnRabHczMFhZNGtzRDJia2dBVnNV?=
 =?utf-8?B?Q1NjYWJ0SWttZ0FQK0daU0wyc0dmN2VBemcrc2l2Y05wSTNGNER1TTA4a3Vq?=
 =?utf-8?B?Uk10aE8zbklRWTBJK0Z2NXdQZ1Y2bUk2a1c5WitYYmFMdFdFYnlLY2lsNUYr?=
 =?utf-8?B?bnh2L2ZpQjN0UzcrQzJHVWZ5a296NjVPQUF1Kytad3hxblBXY0pyVzNld1Fi?=
 =?utf-8?B?TU9wZ2k3NmU3VElPME9qZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ai81elowRXNvM3liR0hSNk5WME0xNUd4R29LT3BzOFFZSTRIKzMvaUNhTk5J?=
 =?utf-8?B?NitxYkxyMHpQZ0VMT3AxSFlvdExCZUJPY1VpS0IycW9MMjZwTW5GU1RZcFY1?=
 =?utf-8?B?RVJNR2toc2xtRXozaG8zejFQRlVwSVNDUnI5Qi9RYzJVQU9MeTdTeTYzNCs4?=
 =?utf-8?B?UncrbXpRUWhhaEVTRzVteVpoQmpJZVRHQ1dxdVozS084QUJvZ3NWQ3JoRnc3?=
 =?utf-8?B?M2V3dmRRcE5YY2Z5R2o1ck05STNJcGQ0QU4weFV3ZG53MUZHNnkzZGtvOWFW?=
 =?utf-8?B?T0pDb0tqS3hobGFlYjc5ZmVYNDh4bGU1MDAyUUt1YzcxVEtWdlFSRzhDd2p5?=
 =?utf-8?B?eGZoRXBHTndicVdXU1F2MkRZVVhxdXhoUXE3Mnl3SHRrWHFQRVRyN1Q1WnNj?=
 =?utf-8?B?ekV0K2Jva1E4aHZUQ3hUaXhZQnZzNENxMGxuaTZlNnlLbFNaRGtGZXYrTFAz?=
 =?utf-8?B?d0ptbU1xUnlwUWtlR1ZseGV4bUs2bHQzalVrc3VJZ3hWWWovVW9LTmdYK1Fp?=
 =?utf-8?B?Vm04eEJqeHRrc0xOdXVYNTRpNFpkaU1maklDQWZWUmRERXc0aXhhSkMrSXQ3?=
 =?utf-8?B?cWhId1J1emtqb3JHMlhvSnJsQThhZVozNHd0RlJCdW5lc3hCQU5iWXNJUHhB?=
 =?utf-8?B?NzdBa0NqSU1rcEprNDZqQmpVVWl0aHFpcmR4d2dnYlVYNkJrQURpWVZLd1k2?=
 =?utf-8?B?TGNkZU9zSjFmeXVjQ0FOYjhpdDdNRHdpT0NnZGtJUFJIdEJwYkhYUmRSckRH?=
 =?utf-8?B?SGVIUDdORUhUN2pENHVHemkxOHJJR2FFWS9sMlJVT2VaZ1FXUmwwNWpBUlRO?=
 =?utf-8?B?N3hFRmFra2tVc0hqQVFkdFYyZmlSb2ZhL1h6WWkydEJOemxCWFNRdHBmOXh5?=
 =?utf-8?B?ZUhmUXhDeDN2a0JydUtxTTYxS3ZZVUxMWWxuaTdFZUV3Z2thNVZxNVZROEFR?=
 =?utf-8?B?TUlHdFhVMTBRZyt6ejJ1Qjd4Y0NjSTYyc2dlRzdKRU94M1Iweldpb01EcDVP?=
 =?utf-8?B?bEFVVk9LSjBqY3RpcHIreUlUMGRjOFhuOU5mN3kwRVU0MEluU1ZaRzh6a2M3?=
 =?utf-8?B?ZkRsRnNaak9hSWwwWDJVQzlCT1cyMHlpNHBwaWgvbXJ4T1JxcmJpTXl6TEpY?=
 =?utf-8?B?b0xVWDRsVjg5YnJqTHlHNHdHdUFZQWVnWkF6YzkyQTBnUkZqRzdaSDR0VHhF?=
 =?utf-8?B?VlQvRzZlNkNXdk8wWXhZZHhXRTRVYm9hdmxubnI2MDlQUStkZ2dWaEdoT0FB?=
 =?utf-8?B?cDgra2NNY0R3VCtwQmt6cUQySkJvRlJjRnc0THNxblJYNFVFSE9FSzlpY041?=
 =?utf-8?B?STRDU1VWaVQ4ck12OTFjb3J5OEtBUnQvVVNNT2c1VEpTWWo5dnVyRm96SS80?=
 =?utf-8?B?YWJWeWRLSTZjelR2ZjdueU5GWGFqclZibWZtNXlIbW5zVjJhWFRLSFI5OXJl?=
 =?utf-8?B?VkZyQW92TDdhdDkxNWh6R0ZnNkFlOVltUHE1UStWdm1FTm43T1BUUkY3ai96?=
 =?utf-8?B?bnFMY1JTS1UwaWtRY0tKaWNLSytONyswOUxtYXFqQ3ZMTklPbnFxWSt5Vzk2?=
 =?utf-8?B?MUJkNTZobnpLby81cHQ2RkNWLzYya1BvSFZoeXpjUWYzQjlUZDZ4NFN2ZG1v?=
 =?utf-8?B?b3ZLR1RtZnVGZXpzYkhFdmdvaG05MEhQYmxFTXNmdWVmSXU5YURkOGZnSGFP?=
 =?utf-8?B?bnpLVkpuSHMwRkt0UHpWeHJiRE1hSUVvTFRPQkRoZGNvMFhvOFJ1YWJLWnp0?=
 =?utf-8?B?T3NOYmVWdkNEL1BtS2NEOHZwZUdHcnJ4aEt0Vyt5dHBMQUJJUTF3RTg5akRH?=
 =?utf-8?B?bjI5VXh1L1pjazcybWdzQ0xrdEJCUFg2Ym1rcDJxUlhCUndXUXdVN1JubUNL?=
 =?utf-8?B?SVZjWXZ3TnRDckdDVGlSQVVidUJhem1YRlNCekNOTWIweSs0emRka3R4Mkx5?=
 =?utf-8?B?VEdLQkJJQzFCVlhucEpmdHM0N1NsWmNDZjVtY2N4Uks4SUVsRW9nVEk1SGtN?=
 =?utf-8?B?UEVsUWFkYWIvRzU5ZGhoMG1XUGFONHVOZ09mYkE0Q2N4dk02REhnUUhBb0lW?=
 =?utf-8?B?dlY4NXc0SVVZSE82YkZ1a2dvTzhQei9YQzhwMXNQdEVIaytpckZnRXhHZDMr?=
 =?utf-8?B?Rm8rbk11TGhtSzU4WTRvSjJkNnlUVHJFZHVZeWlOYjJKUDFyazk0bVhvVXg0?=
 =?utf-8?B?MGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bffecaa8-337f-4df3-6c61-08dd6127f894
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 05:37:26.0480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52LiXv8CVbiZV1CboY1QJzjLkZks0LGdn436RsnD/Ke652B18KlvtigdAHYHrqPJtBkhm4Yo9+80Ws+rplV0Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
X-Proofpoint-GUID: uthlCFoZEUPEVlRjM6t4e9EP0Fpiodpa
X-Proofpoint-ORIG-GUID: cRAxzFB91R1BmQ_OWDrnXw1M3pmD7lm9
X-Authority-Analysis: v=2.4 cv=ZrXtK87G c=1 sm=1 tr=0 ts=67d11d98 cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=WNDY76dxAAAA:8 a=NEAV23lmAAAA:8 a=mdjDh3HbAAAA:8 a=fXms6y0vAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ZC9YdClcck2zP1chpnIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=hjw_Cx-fSxMA:10 a=HFDSX3BADwN2sFIQuyTb:22
 a=oWgShKPB4MB-ORB2x0Yq:22 a=c6Zb8eaUoX5VaqycxFvw:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503120038
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52C3inSp029571
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 05:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115910

Hi Khem,

On 3/12/25 11:45, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> its in meta-qt6, why do we want to promote it here into meta-oe ?

Sorry for the noise!

Adding the minizip recipe to a common layer such as meta-openembedded=20
may be convenient for user who don't want to depend on other layer such=20
as meta-qt6(https://code.qt.io/cgit/yocto/meta-qt6.git/).

Thanks,
Mingli

>=20
> On Tue, Mar 11, 2025 at 8:34=E2=80=AFPM Yu, Mingli via lists.openembedd=
ed.org
> <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> minizip [1] uses zlib [2] to support compressed archives.
>>
>> minizip is not part of zlib, but is included in the zlib
>> distribution [1] as a third-party contribution in the contrib
>> directory.
>>
>> [1] https://github.com/madler/zlib/tree/master/contrib/minizip
>> [2] https://github.com/madler/zlib/tree/master
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta-oe/recipes-core/minizip/minizip_1.3.1.bb | 23 +++++++++++++++++=
++
>>   1 file changed, 23 insertions(+)
>>   create mode 100644 meta-oe/recipes-core/minizip/minizip_1.3.1.bb
>>
>> diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb b/meta-oe/r=
ecipes-core/minizip/minizip_1.3.1.bb
>> new file mode 100644
>> index 0000000000..c9c92ad6bd
>> --- /dev/null
>> +++ b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
>> @@ -0,0 +1,23 @@
>> +SUMMARY =3D "Minizip Compression Library"
>> +DESCRIPTION =3D "Minizip is a general-purpose, patent-free, lossless =
data compression \
>> +library which is used by many different programs."
>> +HOMEPAGE =3D "http://www.winimage.com/zLibDll/minizip.html"
>> +SECTION =3D "libs"
>> +LICENSE =3D "Zlib"
>> +LIC_FILES_CHKSUM =3D "file://zip.h;beginline=3D14;endline=3D30;md5=3D=
8eaa8535a3a1a2296b303f40f75385e7"
>> +
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/libpng/zlib/${PV}/zlib-${PV}.tar.g=
z"
>> +UPSTREAM_CHECK_URI =3D "http://zlib.net/"
>> +
>> +S =3D "${WORKDIR}/zlib-${PV}/contrib/minizip"
>> +
>> +SRC_URI[sha256sum] =3D "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585=
b91eefb60f03b72df23"
>> +
>> +PACKAGECONFIG ??=3D "demos"
>> +PACKAGECONFIG[demos] =3D "--enable-demos=3Dyes,,,"
>> +
>> +DEPENDS =3D "zlib"
>> +
>> +inherit autotools
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#115908): https://lists.openembedded.org/g/openembe=
dded-devel/message/115908
>> Mute This Topic: https://lists.openembedded.org/mt/111654243/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

