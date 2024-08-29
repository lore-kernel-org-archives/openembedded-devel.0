Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425FBC7115E
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 02:09:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3409.1724897349980439437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 19:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99718ad060=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T0lAwk014141
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 02:09:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 419pw1hh1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 02:09:08 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47T298Uf001430;
	Thu, 29 Aug 2024 02:09:08 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 419pw1hh1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 02:09:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuqTL/LLlApdc55oEHS+aUdBU5rcOQFaZPyr9hJw0q8TDr35rWT8ecs3ZD6bXVuS7BD/4fouIQNCkK5n4HBH2319k4g7HDfFSV19EP8jRDK+Vi06E94dT2+2B8LcJAKCl1og0xuOj10j+WtjJEGrSmA49RB/prn3nVP/6LCdeLCYpKgjl6I5pKbDx3+7g+fwcJ9erHNFx6aXo8WdMYR0ocq02WFKZrA11wjQtgxspPUQBqWz7q3cwO3Pba3vUcO8JrWgZEmacbTEswzv143eTn/rAolG/D1WPWONDqc/7KnE6hDfAT6wJ+0moj1imZBDWQ9fgAnwnTnFdF7TKae8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DsseE0rJ79Vax8oO69eUtQC4s6aAZ0sBzJExVIS+0w=;
 b=qIyfxFZKoAVwesfdTvCy9mOAHjJacRKv7YflNuNFWJjpW9BgqW2meFxSwZwlHZIxr/6c0o/4dtkbNU7vfUJFyfetpcy9Lbj3S/h08QlxBGw3VzbQbxmIZL4KTbKSRgC/Bx1R4D+FxT8FF0a4eePTetSocaE/jM5nhkdjsUZq9MPmNRgWUaRs/zAfMpG2rFefRpSCtS7SiTqUl3kgLDKTFc0laxG7S7m1WldyvW6zxV/wHXLMHcGfuk3oezxPElsrPHG5JjbXVaoXdBQZL7dqKaPsDl4PDEhQEw0sPNeQpvp4tlc1mG519c0RBUULQXVpQxuTOUM2begVGJm8+QrUyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 02:09:04 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%4]) with mapi id 15.20.7897.014; Thu, 29 Aug 2024
 02:09:03 +0000
Message-ID: <09f5b93f-b493-4177-826e-21a1d1c5b600@windriver.com>
Date: Thu, 29 Aug 2024 10:08:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] mariadb: File conflicts for
 multilib
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
References: <20240822015200.2788239-1-guocai.he.cn@windriver.com>
 <b66d3acf-773b-4a8d-9f75-356cd1e3dded@gmail.com>
Content-Language: en-US
From: guocai he <guocai.he.cn@windriver.com>
In-Reply-To: <b66d3acf-773b-4a8d-9f75-356cd1e3dded@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To SN6PR11MB2671.namprd11.prod.outlook.com
 (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|MW4PR11MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: b284a671-9d49-4d95-da47-08dcc7cf8db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2ZUeUxFSEFnaGtQTXpmUEViS3ZmQVk2QWRYamRTQ29YNU5WV1puSHNycERa?=
 =?utf-8?B?aGlCdmRud2dEemtRampiSVRhRmlGV1RvZWRpTGpPd0kzaEpoa3hWblNaNGZX?=
 =?utf-8?B?K2FRakEyVFJNTUVqV056R01tVjRyUEJsOERjU0t1ZGRqUnFsVTVyd3lqWE5F?=
 =?utf-8?B?RU1SYkx3dkZmZEpGUmNTNHB5cHU1QXhQU0JKM2tNUmRJVm1vcDRRYTBRZlh2?=
 =?utf-8?B?cWY0MkFuMGZQdzVqajdBSnJmWnpLKzAybEtvdHR1cWRWRE1IZmlmdWlqUjdF?=
 =?utf-8?B?eE50QURpRkVKbnd1ZURhV1NWK1NxM3pKR1Nqb0NFcWlUaXV6ZEk2ZCt4M2Fx?=
 =?utf-8?B?cU9KVmFGR1FmL3NZc2RxZm1BYmZzeHo3NGkrdnpZd0M4NzM5ZVovZWNvK3Z6?=
 =?utf-8?B?cDJTM3RzNUNRVnRzbitwdmV3TExQMzhOSW5iOVUxWTlDSEFHc2d1dXdrQ2hG?=
 =?utf-8?B?YW0rTUg3UjRkWWlMUEZoc3VZWllTenVSVG1iMElsUkI3NjJqTEJ5QkIwQjZn?=
 =?utf-8?B?NXRMOWR5L2lzaGlNVE8zNlFHc09vcWkrbVowVVdERGcyM1RNTWNoZzJUdDU4?=
 =?utf-8?B?bEJoY0VZSDRVNkZsanJ5Q2RSZlVIMVdLMHFLVXdwaUJBTUtJcmMvc3NXRzAx?=
 =?utf-8?B?V0dzV1RpcTVxTTkwRk15MmthanRsRzVuNk5uN2tEMkx2Y0tNZWZzbG1JaWNR?=
 =?utf-8?B?bE15bEJ1bVBFYnJuSHcvd1huU00xU1ljTTdpREthVG5jc3ozOE85Ukh3NTFG?=
 =?utf-8?B?eGFnWHUrSWFSVDVNVFhBU3JCZEtjdksyU2o4YzNOcUtTOUdQcmlFa05kRmp0?=
 =?utf-8?B?OFdmOUdndnhxbXlrQkFneXBicEFRbkJNeVBOTlYxc2RqMmpPckZEVW0xSy9O?=
 =?utf-8?B?azFMTUJIbVQ0UzMvQnpPWVhOQTRBKzVxQzF5b3lqb1pxYkpaaWpHNndTNUVr?=
 =?utf-8?B?UWU2V2V4OEdmSEl3citoUTJRSTR6c3lvUEpWMkNYK2NVcjErZEFaQ1ZheS83?=
 =?utf-8?B?Ryswd2szMmRoRHdYelVya0JxUFU2UmtRbDJiTFZmUm0xdlhWSVY4cEszdnZp?=
 =?utf-8?B?Q2lOVlN6NmQwWEhvcm9Dc3JVdDJpb0JLZnhiYjB3OHh0em5uN2Rib3dzek5W?=
 =?utf-8?B?L2dWUmdobm9qdVNFRWVDS1J1TDF5ci9CaURwai9MS1dPNFFpZ2M0UUF6UFZL?=
 =?utf-8?B?cDkyMk90bHozeWJkc21LejZ3Ym9VWVJFL21YMHRiY3hQdmJOejNSRUE4RjVE?=
 =?utf-8?B?YUFONWZRb1VoRmUyZDlsYU5kc3BUOUJhYXNXUTNIb3ZkNG5rMmgxVjBHNVFH?=
 =?utf-8?B?bXh0OVY3dytzaXk3OGlmNC96QkNUQlc2ZmpMYWFwbVRGbWhQaFdCS3FrQWpy?=
 =?utf-8?B?d1hvWXlncktZeUFmakVkdWRrejMybVVSV3U0NndHcm5qc3ZSSUszL2JxUUJ1?=
 =?utf-8?B?RmVHd05HOHRRbVJBZUlGVDBjU0Izdm5PT1dxMU95UXM0ZW05SEIramFFRENT?=
 =?utf-8?B?K29ZMk5od3V6WVl4WmxZaXVVYnBGMnB3d0JWVkR1NmZGVkErV2V3T0VrY2V0?=
 =?utf-8?B?Q29kZ2hyOHpCTDRZaW0zb09HbGxhdEpDK04vRm9zeDNlYmhKZFRYa2hGOE1W?=
 =?utf-8?B?MUhXcjE4bnViVE5TWlFMbmtvL0JwaVhtcjdqVmtJbDkrM3d3Q1MrVWc2Zy9n?=
 =?utf-8?B?WUxwUnAzWUYzaDVqb2pkV3BsWjl1Z3pXRWN5NWkvc2c5dlBneHVmcXRlV1ho?=
 =?utf-8?Q?7+V5QDBsn1e2gi+JmA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmYrQUR4cGdEZS9LZFdvMDNPeG9wMzZkbFEwbjdiSUJCZDB3Zlk3V2tWQ3hU?=
 =?utf-8?B?MDR1TlVBWmJvQTZHRWJZR2NWQjhpcGlNbW5JT2pVbTM4S2NzT3VQbkh1dzdM?=
 =?utf-8?B?MG83ZDRDVnFJTWhNNitHNTE5RFBXYnNnay93N3V0UjFhN2xjNXVmSlM5eDVJ?=
 =?utf-8?B?U2U5ZFUwTVFuSmcyeXpOcTBMdURVMDZrQjhLZG9oVHJ1YUt4N2g1WVEvVDNo?=
 =?utf-8?B?VzUyZWxjeEtZUWJHTm9pL1RJQXhEL2RadmlmeG51MlB2dHpTV3RiTWtKR2tt?=
 =?utf-8?B?Z3NYdzNqc1VFOW0vTHRRZ250UDlOdVFZSlN4ajJBdmVNaFQyeUgwVEdabDda?=
 =?utf-8?B?NlZSUG5mR3lnR3JNdElkS0lHUDg0TDdtNmFpb1Zpdnd1UlVtaTJOVTVYYlUx?=
 =?utf-8?B?T0oyQ2ZSZHZIQnJkTEx3dVZHeU5TQVd0QUtwR1dZZ1A0RFROVEZnWmE0RGd5?=
 =?utf-8?B?YXlHK2UrYW9jYmtLc0VFZDd2NCtVK3QxU2pPYVJOYWNJTHFoN3lXOXREem9P?=
 =?utf-8?B?dHVmNlhEZDNDdUV6T0lmTVRuYkNlUEFyWHhGTUdRREJQWE9ZWkdtL3VWcE1a?=
 =?utf-8?B?dmxwd2FnS2JJR2xIWjdhaUtoN2dKZWJocGFTd3o1dUozUmpoR3ZwVTN1MTF5?=
 =?utf-8?B?NFZ0U1A1WGZBemFJd0dFNlVCQ3pVZWxmaUpheDQyeTRtYkVSYjg5WXNESkdB?=
 =?utf-8?B?S2RSdURCRUxJbkdXQnU2VjBKVmVZTUVOend4VklWa2tMNkNEdXgrck1JSVRa?=
 =?utf-8?B?N0JiZnFiYkd5L1dCODEzcTZtMDdlZ3A5cGlOQWpJTHBKaVVndDlZUUZzK2NH?=
 =?utf-8?B?aVJWWEhRUjJHVUdybzVmU2hXSEZvRWFuOVlLR2crY0JRSmNLRTR2cmtBaGt6?=
 =?utf-8?B?QjV6ckdYdjZvWW5hV1ZadVlUTDdKeUpyeFptWkhWaGxuZ2NLaUxXM1BKOVov?=
 =?utf-8?B?UEh6dWJVMlpYSVdGUHg3ajZpaUlHbjluSmxWRTNrS3h5VkVZdzVEUGFGOXhO?=
 =?utf-8?B?VGxHUkdCdzhpdWw2aHNmblB5SE12TVZEb3pINnVRNW1temdONVRrS0k2dldr?=
 =?utf-8?B?cE1NTlBvTlVITDN6U05SVVFsdFNVMnlkdGM4ZUgxOW1QaXBGc1N2Ykl0R3ZD?=
 =?utf-8?B?RTJ2dDZqRVZqRys0NVY1RHZyQy8xUFdLb0VvSWhzMXhxaUUzU2lreFVpeHJU?=
 =?utf-8?B?YVp4N3BJa1ZIbEl5eFo2UFVBbDY0bDRXZTNXSWhrZDRoc0pXeEtPb1R2L1ZU?=
 =?utf-8?B?djFXTDUrT3I3RlZuTUZCMlpPK2hkRU1RRE9EbjZpOFE2bUU5b0ttZi83T0tr?=
 =?utf-8?B?YkFMWHYxaUtINDFVUXBUTGF2bFBuQmFYSGJjT3YyOW5lNzdDWVdzK25KVUpS?=
 =?utf-8?B?YkhVOWM5Z05LN1BpSys5bEo3elYramNvaDBPL3gzT2V1TG45eEczY3BnRHNu?=
 =?utf-8?B?ZlYvOVNrMGZDazhCcFI0dnplbHI4REtPU3J1SVNZbzVPRVdTUzZqczJ6QU1J?=
 =?utf-8?B?RzlTQzdvLzY3ejBpR3NkWkE0T2k4S2g1SnZyMGRwazdaYkZ6VTRBRU00NzU5?=
 =?utf-8?B?OWppN29pRnVKL25lZXduR0lWcW9kUWZUUTAwYTJQQVJBcm1ySUk2QXVZVGxp?=
 =?utf-8?B?UzBVQk1KVTBMdk1FcEtUZ0Vtcm1sbFlrS0RQYW5xVk4yL3JuYmxDVG9MOVNx?=
 =?utf-8?B?YVpGaTUvdnVjYjI4NHhMR1B4TnBYZkgwSkY3TVJjeWp0WXM5VVUyUXRROTJK?=
 =?utf-8?B?aHlkeGpnL1hqTmxlclZZWlc5cDN2aWJPMmVCZFIra0pDV0ZTa3hJWDhPbkxP?=
 =?utf-8?B?MXdPUUhJWGFiZlo2QlA5c2dtenIxRmY0K0tZSDRzT0k0b1I4czIzSEpQNjNP?=
 =?utf-8?B?RXdMWmhhV0ZnSmVMNlp0Y0lkZ0szOWhSZmtZL3dDU0pmT1JJa3NNa2xKdzR5?=
 =?utf-8?B?UFB1bWZFb21qSXB3M1E5Z0dlK0lYaVE2ZnNqb3I4N1RadzNZSzVrR1JUdzBY?=
 =?utf-8?B?dmt4UStYM1EwelYvL3htZVFZc3lrWUF3dEo5M1M3aXZDcFV5UGNpV2lnNSs3?=
 =?utf-8?B?MDNLRVBjdlcwaG95L3QvT3pQbGdUSEJ4UmxnRU9PVis3K0tIdDBwWVl3Qzkw?=
 =?utf-8?B?dEJQM1pHcGhKVi9WYW5TL24wWitEOU8yRnNIUWg4SWxOS3psb3I1bXNXV2hG?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b284a671-9d49-4d95-da47-08dcc7cf8db3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 02:09:03.1308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxZLLipicmW6d5zgImjZLIlcPBrUHz1PARvd6OWqRjkKRlqrVh5PM1wNnYXCfYhckssBTc6vNoCruJxxgaidd063ex7HyrdzSOpUsu6dmLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
X-Authority-Analysis: v=2.4 cv=LP40Q4W9 c=1 sm=1 tr=0 ts=66cfd844 cx=c_pps a=WCFCujto17ieNoiWBJjljg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=C3ic7-duxkVx971dtlgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: SSVXykMMKfhKvdI-9B1hONJbS9wQJTvp
X-Proofpoint-GUID: vkM1zWyjQ_gTBPMp3uH4PjGONZ93qMTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_01,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408290015
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47T0lAwk014141
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 02:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112031

Yes,this changes need to check into master and scarthgap.

It have been checked into master at Aug 22.

Khem:

it also need to check into scarthgap.

Thanks very much.

-guocai

On 8/26/24 03:24, akuster808 wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> On 8/21/24 9:52 PM, guocai he via lists.openembedded.org wrote:
>> From: Guocai He <guocai.he.cn@windriver.com>
>>
>> File conflicts between attempted installs of mariadb and lib32-mariadb
>
> do these changes need to go into Master first?
>
> - armin
>>
>> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
>> ---
>> =C2=A0 meta-oe/recipes-dbs/mysql/mariadb.inc | 7 +++++--
>> =C2=A0 1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc=20
>> b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> index 51dd4e8d4..32a6022ba 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -33,10 +33,12 @@ UPSTREAM_CHECK_URI =3D=20
>> "https://github.com/MariaDB/server/tags"
>>
>> =C2=A0 BINCONFIG_GLOB =3D "mysql_config"
>>
>> -inherit cmake gettext binconfig update-rc.d systemd multilib_script=20
>> pkgconfig
>> +inherit cmake gettext binconfig update-rc.d systemd multilib_script=20
>> multilib_header pkgconfig
>>
>> =C2=A0 MULTILIB_SCRIPTS =3D "${PN}-server:${bindir}/mariadbd-safe \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PN}-setupdb:${bindir}/mar=
iadb-install-db"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PN}-setupdb:${bindir}/mar=
iadb-install-db \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libmysqlclient-dev:${bindir=
}/mysql_config \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>
>> =C2=A0 INITSCRIPT_PACKAGES =3D "${PN}-server ${PN}-setupdb"
>> =C2=A0 INITSCRIPT_NAME:${PN}-server =3D "mysqld"
>> @@ -160,6 +162,7 @@ mariadb_sysroot_preprocess () {
>>
>> =C2=A0 do_install() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake 'DESTDIR=3D${D}' install
>> +=C2=A0=C2=A0=C2=A0 oe_multilib_header mysql/mariadb_version.h=20
>> mysql/server/my_config.h mysql/server/private/config.h
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/${sysconfdir}/init.d
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${UNPACKDIR}/my.cnf ${D=
}/${sysconfdir}/
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#111898):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/111898
>> Mute This Topic: https://lists.openembedded.org/mt/108031502/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [akuster808@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

