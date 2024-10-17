Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFF3D2F7FA
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 07:35:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43221.1729150512337243755
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 00:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0020234d96=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H7ONNh019894
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 07:35:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3eshm9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 07:35:11 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49H7ZA5d004866;
	Thu, 17 Oct 2024 07:35:10 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3eshm9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 07:35:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdxUuh1ggUKxKbfX6pSpW6cwKNVBRpyAjOahBhGvLQBW72FC6zPBVgPPPabzQsClbjKSYGU5DVqSRA0oggIz1Sabes0MmhkXbUDjEhaucYIxs87flGn+UuTI+XW1hKN6pKQN/BK0de7hJysHrT8pcF+nt2cfIvAGisx7C/Le0J6moXRE4jKVSS2m4AfbABaTeAESGmxz9wothOYFR23Yj0RwzfoJ4KSrJ/vfF3Ovoz6I4jf6/iZKKGGKMncPBkVbaQ6oxApssm3wtljBpQqQwPNnfro/fuISXanCmjAsJa2XcFQE6P75fxG0m8Ej528li2OtJffepltgxGmqSixU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZjMb5Om6ffdFG6XR0lRvPiqoNxXDmtLCiup55gTiig=;
 b=F49jeEdvOMVHvbvUMTlYUmZ69JvxfnYUsvoPVhnVsTZc5zeuq/vRk0C9AFxq2htgVjD+YyDrFFxrrCgXJbzHKb/ZqqCs/0hbGwEmkGnU/CYL1ZoYWNvE77zkrXnNbFFurYwTd7XsHK6ib8E/jkKfhO8rKpGczDHHRqn1fz9PRD5I7WkZfFaUgFuqJSa0ycf1HD00/O5WaB1vOxmAVR/XQ5C2ApfDgf3mIWgztOFzbJsyGxQ9oonyz9WVFchQ/bQbnAbU0ETIK7A9YKulA0B8f0tmYHjk2m+Tp8MkUuwGJXhl2uXXFYFxWu33cdsgjdfXKcWOpthO2c8ThDyxbv/W+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 07:35:08 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 07:35:07 +0000
Message-ID: <824f78eb-9de1-459b-b934-73adf806f7ef@windriver.com>
Date: Thu, 17 Oct 2024 15:35:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/3] tomlplusplus: Add ptest support
Content-Language: en-US
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20241012100147.618578-1-mingli.yu@windriver.com>
 <20241012100147.618578-2-mingli.yu@windriver.com>
 <CAMKF1sp_GqfxcDnExPfi+sh6PuyrZoQpOrf48mYqfiC_sjr61Q@mail.gmail.com>
 <5fa70fce-33a6-477d-a988-0e4063e5d0e1@windriver.com>
 <CAMKF1soKVFA=z9HG6AkKO9wudOTjUCXFgry46EtRkwFdsQkufA@mail.gmail.com>
 <17FE3E9DA0225DA0.4702@lists.openembedded.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <17FE3E9DA0225DA0.4702@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::6) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA2PR11MB4793:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f44340-33f5-44a3-706e-08dcee7e3968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RHd3bjI0emZKWVhZWVROTzhOcGtTWU5zYWVEcmhTU1NXdXFKdkJzekJGL0tr?=
 =?utf-8?B?cThwUjVhWGJvUnM5ZExyREJ4VWZySjREanBjNnZROG1hcFBTNjZEK3ZMRWNV?=
 =?utf-8?B?WWlOaVRaVzZQcnZ1ZHBNaDBEcXNRTlNMME56ZUE0c2drOWdPbEQ5T3ExV3BI?=
 =?utf-8?B?UHltTVRndEJEVVlHNWpYMFlSeTNiQXZGazZ6dUtDSFYydG9XY0lVWGF4d0xO?=
 =?utf-8?B?VHpXbHpLWjVNZCtrRjlyVlpQSk5ockFtQTZSRGhsNUtzSVhsR2JDSTNpRlJX?=
 =?utf-8?B?QnVldTJWNm9lbnZkbktySWhsNnVpMnlFcElrNVp0NFNDWjFTM0E1dkYvaGxH?=
 =?utf-8?B?ZHBWZ2NjZVR0UVBreVpFT3lSU0Q0RmM4MUMzeWpLOUI1SVhUQ21yRnF0d3k2?=
 =?utf-8?B?eHY3NXdzRmdEM0l4dGRuS0U2S3MreU9USDVZQmg1clBxVjh6NEdsTURmdHdM?=
 =?utf-8?B?aFpCc0toUzRWUDF6RHg3OFVnTjFPQzZQaVBIb3dEdHdOSGFGSWVkNjQvQ3FM?=
 =?utf-8?B?Z2dINm9FWjlCSCsyS0JPdVdtS3hHK1UveTNQMENwSFlKRjhCUkNzcEttb1Zi?=
 =?utf-8?B?ZlhwTzJ2Uno0ZHFzcnRrWE1mcm9lUmR6cXd3d2cwV1ZhL2VSQWVXU0xZUTFC?=
 =?utf-8?B?MVM4SWI5b3JKbnNDWHNHMGFDbkx6OERTM3JqblVjYlFxSVBSVXFWa0JZdW9H?=
 =?utf-8?B?Qm94VnpOQUg3SU5HcDdLUHN4c2Q0aEs5ZDVLOEpENmQvY3dUTWt0SlR5R01P?=
 =?utf-8?B?QXlSWDFXM2hRR0ZsUlpQV3VPUkFIRkgxVWoxUi9Xd0puQ0djT3BvVkRCazJz?=
 =?utf-8?B?bU5OZVVNaUpkYXphUzF4ODRoQ05FS01wQm11YjZpRkxiTWtsTm1CLzRNaGtm?=
 =?utf-8?B?N3RjOHltZDVuVytsZkZXSnlYeHRPRmdpTlRHeG84dFJuMFNVdG9adGR0VCtU?=
 =?utf-8?B?cXp6WUpZU3Flb2xJcGo1OGxYRUpZMXZuUUU0MGk0WUVJTkFUajhRQnZwdmsv?=
 =?utf-8?B?NnFKaFJDUDFRN2N4WXpxNkJya2F3Y21mNGxoN0k5aEIyQWpRTGxwQUpMblRh?=
 =?utf-8?B?NGFGcXBDTGFaV0xrN2Q4MjRmUkJsaGhiNitkeVAwMmozT3RhcmtBQXRPSjFa?=
 =?utf-8?B?a2lNbmpOYmZXVi9kbkJocldrSGR5ZktDdTlvN0FTcThUUFowZFM4enJTb09S?=
 =?utf-8?B?dE0rZ2NORkIvOVFVbzlaTGI1c3Mxd2Nab1R0MElyd0lhVVJ2VlMxcm5yT3Nj?=
 =?utf-8?B?ZGhWclFsSjYvTkR3bHF6cG1JTjFqQnV5aHpYS2hMYy9TQ1lZZDBoZkROaHhp?=
 =?utf-8?B?WlBHZ1hSNUgwMTFvSkxUd2NUd3lpV3hDOTdocDdDb2pwN0d4czBpRFNKa0lN?=
 =?utf-8?B?WkJOMXl5VWRsRVpFTE1CSnRhRjlKWk1VSW1GU0QzSko4SVlLSDFOelBBcS92?=
 =?utf-8?B?OE9td0dtRHZ5SWhjTG5GaGpOaGZxOFRtQmMrRmQvOWVGOVQ1Y3BFQmN0N3Bm?=
 =?utf-8?B?U0VlRFEwQkdkVlcwRkRkMVczNTJFdXZzTGhvTE5aYnRLcEgxYlE4aG1rd2RG?=
 =?utf-8?B?U2p5WDlCRmpaOUNXS1hTNWdGb053TkVzUWhOSGNuL3RxQWpVbk9VeXF2bGho?=
 =?utf-8?B?UU9sTC9lNkRobWF2Uko3c29sU2x2ek9IZEZnRTZuUVVDeG1zUWRVQk8xWmVB?=
 =?utf-8?Q?CpddlOG5duqpqjIlULeU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVFVa0FlZFozRVZJVHNaYnBuanI0Q1VnMEYrQityeHZUb2JSV01iYlFVdndu?=
 =?utf-8?B?VkV3SUxrRUJhL1dkSEx2cXhQZ3Babk5TRm9YVE51ZUp3c0E1RFVaMFZBeHhL?=
 =?utf-8?B?aHU1NVRTK0NvR0VnTzJ2L1l6TWRpY1VUbGd6d3RleUFzVmJYRlZRRk5CUUd6?=
 =?utf-8?B?TEhreHVJVlUrVXhhQTJzcDZRY2N4Sjg2U0ZoMGJ2N3hOMnNuWkFyeG9wVXdK?=
 =?utf-8?B?RTNscTJvM2VCRmRvU3U4T0UxdnFhNmZVaW8wS0tnYVBhTDZmbnJyaGs4T1p5?=
 =?utf-8?B?K2c4dmFCOUo1YlVhSXhOZFp5OG5sRTZkZXlwcjJ1WkZmUDc5ME5rQTdBczA4?=
 =?utf-8?B?R21mSTd6T1FCMUR4dVZXNlZyaUxOVE1ENjlPRGtUNDBJMXppMFZoMnl5d21F?=
 =?utf-8?B?MFk1d1N4MlJrNFArazh0QitsVDMwbEtwbkQxNC9XNlpnWDcxRCtYazF1QUdq?=
 =?utf-8?B?QitMQmZ5RVdoN1NROVltaVVGS3VyMVppcWp3U3RaeFkrRnM4ZTdoK1ZjOFgz?=
 =?utf-8?B?elZhM3prSnhESkNRZ1EvYVBteGR0Y3ZTTWJvelI4NG5ZME43S1FDRDJaWlM5?=
 =?utf-8?B?a200RDJxNjQzckpZM2pYbUNzYlV1WERxNG9IRG9ka1ZBOGlpR0xzVm9vNEYv?=
 =?utf-8?B?VjVtSXVlK0E0VkFYZDZCKzlEd1Yxa3BlSmY0ZlVsclZCSkhVVTgxQS85UWJo?=
 =?utf-8?B?Y0hMenRSZXBGbjd3NDZ2em53MVFVVDQwdVh2MlZDWTZibGZ5K1gza2l5amJI?=
 =?utf-8?B?MzFxZTBhUUVyTC9hVFU1VDdpTWtQVis3cDlxajgrRjhtS1NtQldKMmoxOXFk?=
 =?utf-8?B?TGhyTTZnK0wrMXdyTWwzdi9JSGVkUmN1RFU5dWVKSXJ5Mng2ZmhiYjhFUE5s?=
 =?utf-8?B?SlJVQ2JZWjRtSm80aG1ZSTIwdHd4bllpNTFFWEs2WjluMlBwNmN0aWc0VFhk?=
 =?utf-8?B?bkFhT0hXeTRsZGpyU2QzeDZkbUlodnkzdnRQMGZsdHhwYUExb0ZBT1M0UE5W?=
 =?utf-8?B?d1NEejZRWldlSTcrUzBzekdGNjdQckFpelVvYWZQZFV1QVBPRkVENHNqa0NZ?=
 =?utf-8?B?ckMram1GZk9CaThlalM4bGw0dUtYbkFmMy91Zm1ZKzhESlk1QTlkenl4WXpT?=
 =?utf-8?B?OWFveUt4a3Bwc2FXOFZKc1VCNzh1MVRQUjJxeG5YQjFOUzRYMHZUbVNkelEy?=
 =?utf-8?B?aVF0RUxaNUlxNWJYUDB3ZXVRVlVYY0JVL2hZWEh3YWowaU8vMlovTUJiSW95?=
 =?utf-8?B?cTd4dlFUTEFLN2YxRUZMQzNUZHJwTnRrWGRadGJtMWRPaktiZ0UxSkY2aEZT?=
 =?utf-8?B?alFZTHJRVk1Wa0c0Ry9SR1I3YzVzVWh3eFRBQ0pkSjVNRHBBR2dCbDZ4N2Jp?=
 =?utf-8?B?eE5ZUGFOc2hSaTNTMkJERnFpdEoyekErbVRSS3ZvWTJ0UkhjSDBkZVhZY0Vr?=
 =?utf-8?B?QTd2NnRrRVpTR3BUVHBzclh1VEdVSUE3eTB2ZDFyQ1pmZ1F3TmZ3dmVnaHJw?=
 =?utf-8?B?L2ZSbjhLaE1pb1VsZ2syd2ZrTURQYk0zMVg3NlJPZWhNSVcxTnBVVlRqdnlW?=
 =?utf-8?B?clE3TVQ1TDZ2ODg1azFSZVpWVzVHV3laM3hLS0dlR3lQR3NudEk4TnB1OUNR?=
 =?utf-8?B?aGdFU1RWZElTaHVkYnNibjBBSlR4dmhSckFMT2NiYTNkckt5bHBkclRza0k4?=
 =?utf-8?B?dmJ0bEdoUVdzSWRSQjZuK1lYVktWUm1YWW04QkdkMk9CZE8yNUFuREk5WWJL?=
 =?utf-8?B?ZWJnYlByNDRWdWVyR3ROTFpOOVYxZXgxb0pROWVHZ3ZaeGtjVjlJcnJrNys3?=
 =?utf-8?B?MnVYUzRRblM2azZWK284Q2Vkb2t4c1ZaNjdFOHlwZ2hjRGQrUDJGcTdFT2RS?=
 =?utf-8?B?K29oV21NK3MwZUdRR3drUmZNUkZwSGdTODBaOGJSNmNlUXBZcXllVWR3U0hT?=
 =?utf-8?B?UkdNR1BBb3FLaEpUTzJVNDc4RkVwdk9vMitLNDFScnIwV2wzTkkvK0MzS043?=
 =?utf-8?B?bVVJRU5YWkFFZzVaSFM1MU5HaFpUSkNoWTFSWncwQlp2aWszVkx2K0djQ1Vx?=
 =?utf-8?B?bk5hTXBqQjZ1TGVUdVFDWUJyQnlDVFh2blc2VmNnVU1qeVVqR2c3U1ErblhL?=
 =?utf-8?Q?grAql3U0+8UzG4nyKJ2QDGY0n?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f44340-33f5-44a3-706e-08dcee7e3968
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 07:35:07.8812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6V9dtiiZynAYBQ47iDWLqoncetJtGcaUFVud5I0cnAXeJuGa/DCShOs95It9orNSLmYgA2n/jt2RLeZomRvnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4793
X-Proofpoint-GUID: vQVconu1UhTOlIItgY460njNRN0_ZROm
X-Proofpoint-ORIG-GUID: qTTqP6S5LIDnUnzaIAQrIdoP2gUoFvwl
X-Authority-Analysis: v=2.4 cv=cPWysUeN c=1 sm=1 tr=0 ts=6710be2f cx=c_pps a=wXDgSYWbwZencpnnUUTq5g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=l1-WZR0qAAAA:8
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=z8vU8Gr3U-nLPclttLsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Qm0ypj1B_joA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=J0NmAbttn3WFok5z7_lE:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_06,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410170050
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49H7ONNh019894
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 07:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112962



On 10/14/24 14:42, Yu, Mingli wrote:
>=20
>=20
> On 10/14/24 10:36, Khem Raj wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
=20
>> and know the content is safe.
>>
>> On Sun, Oct 13, 2024 at 7:31=E2=80=AFPM Yu, Mingli <mingli.yu@windrive=
r.com>=20
>> wrote:
>>>
>>> Hi Khem,
>>>
>>> On 10/14/24 00:18, Khem Raj wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the=20
>>>> sender and know the content is safe.
>>>>
>>>> ptests seems to be failing for qemux86-64 - =20
>>>> https://snips.sh/f/PWrmTR3-bm
>>>
>>> I didn't reproduce the issue locally as below:
>>>
>>> root@qemux86-64:/usr/lib64/tomlplusplus/ptest# ./run-ptest
>>> PASS: tomlplusplus_odr_test
>>> PASS: tomlplusplus_tests
>>
>> Did you build and run with meta-oe-image-ptest-tomlplusplus ?
>> secondly, I ran with image built with clang compiler
>=20
> Yes, I have tested with "$ bitbake meta-oe-image-ptest-tomlplusplus=20
> -ctestimage" and it succeeded as below:
> $ bitbake meta-oe-image-ptest-tomlplusplus -ctestimage
> [snip]
> Output from runqemu:
> runqemu - INFO - Received signal: 15
> runqemu - INFO - Cleaning up
> runqemu - INFO - Host uptime: 10209822.71
>=20
> tput: No value for $TERM and no -T specified
>=20
> RESULTS:
> RESULTS - parselogs.ParseLogsTest.test_get_context: PASSED (0.00s)
> RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (2.02s)
> RESULTS - ping.PingTest.test_ping: PASSED (0.01s)
> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: PASSED (0.=
36s)
> RESULTS - ssh.SSHTest.test_ssh: PASSED (0.50s)
> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED=
=20
> (0.00s)
> SUMMARY:
> meta-oe-image-ptest-tomlplusplus () - Ran 6 tests in 2.892s
> meta-oe-image-ptest-tomlplusplus - OK - All required tests passed=20
> (successes=3D4, skipped=3D1, failures=3D0, errors=3D0)
> NOTE: Tasks Summary: Attempted 1430 tasks of which 1429 didn't need to=20
> be rerun and all succeeded.
>=20
>=20
> $ tail -2 conf/local.conf
> TOOLCHAIN =3D "clang"
> IMAGE_CLASSES +=3D "testimage"
>=20
> Could you help to provide your local.conf to help to reproduce the issu=
e?

Or could you help to provide the reproduce steps based on poky?

Thanks,

>=20
> Thanks,
>=20
>>
>>>
>>> Anyway, I will look into this then.
>>>
>>> Thanks,
>>>
>>>>
>>>> bitbake meta-oe-image-ptest-tomlplusplus
>>>> bitbake meta-oe-image-ptest-tomlplusplus -ctestimage
>>>>
>>>> On Sat, Oct 12, 2024 at 3:01=E2=80=AFAM Yu, Mingli via lists.openemb=
edded.org
>>>> <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>>>>>
>>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>>
>>>>> =C2=A0=C2=A0 # ./run-ptest
>>>>> PASS: tomlplusplus_odr_test
>>>>> PASS: tomlplusplus_tests
>>>>>
>>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>>> ---
>>>>> =C2=A0=C2=A0 .../recipes-devtools/tomlplusplus/files/run-ptest | 12=
 ++++++++++++
>>>>> =C2=A0=C2=A0 .../tomlplusplus/tomlplusplus_git.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15=20
>>>>> +++++++++++++--
>>>>> =C2=A0=C2=A0 2 files changed, 25 insertions(+), 2 deletions(-)
>>>>> =C2=A0=C2=A0 create mode 100755=20
>>>>> meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
>>>>>
>>>>> diff --git a/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest=20
>>>>> b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
>>>>> new file mode 100755
>>>>> index 000000000..4f682c5eb
>>>>> --- /dev/null
>>>>> +++ b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
>>>>> @@ -0,0 +1,12 @@
>>>>> +#!/bin/sh
>>>>> +
>>>>> +cd tests
>>>>> +for atest in tomlplusplus_* ; do
>>>>> +=C2=A0=C2=A0=C2=A0 rm -rf tests.log
>>>>> +=C2=A0=C2=A0=C2=A0 ./${atest} > tests.log 2>&1
>>>>> +=C2=A0=C2=A0=C2=A0 if [ $? =3D 0 ] ; then
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "PASS: ${atest}"
>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "FAIL: ${atest}"
>>>>> +=C2=A0=C2=A0=C2=A0 fi
>>>>> +done
>>>>> diff --git=20
>>>>> a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb=20
>>>>> b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>>>>> index 0e8202bdc..245c309a2 100644
>>>>> --- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>>>>> +++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>>>>> @@ -3,7 +3,9 @@ HOMEPAGE =3D "https://github.com/marzer/tomlplusplu=
s"
>>>>> =C2=A0=C2=A0 LICENSE =3D "MIT"
>>>>> =C2=A0=C2=A0 LIC_FILES_CHKSUM =3D=20
>>>>> "file://LICENSE;md5=3D90960f22c10049c117d56ed2ee5ee167"
>>>>>
>>>>> -SRC_URI =3D=20
>>>>> "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttps;branch=3D=
master"
>>>>> +SRC_URI =3D=20
>>>>> "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttps;branch=3D=
master \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:=
//run-ptest \
>>>>> +"
>>>>>
>>>>> =C2=A0=C2=A0 PV =3D "3.4.0"
>>>>> =C2=A0=C2=A0 SRCREV =3D "30172438cee64926dc41fdd9c11fb3ba5b2ba9de"
>>>>> @@ -11,4 +13,13 @@ S =3D "${WORKDIR}/git"
>>>>>
>>>>> =C2=A0=C2=A0 DEPENDS =3D "cmake-native"
>>>>>
>>>>> -inherit meson
>>>>> +inherit meson ptest
>>>>> +
>>>>> +EXTRA_OEMESON +=3D=20
>>>>> "-Dbuild_tests=3D${@bb.utils.contains("DISTRO_FEATURES", "ptest",=20
>>>>> "true", "false", d)} \
>>>>> +"
>>>>> +
>>>>> +do_install_ptest () {
>>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${PTEST_PATH}/tests
>>>>> +=C2=A0=C2=A0=C2=A0 cp ${B}/tests/tomlplusplus_odr_test ${D}${PTEST=
_PATH}/tests
>>>>> +=C2=A0=C2=A0=C2=A0 cp ${B}/tests/tomlplusplus_tests ${D}${PTEST_PA=
TH}/tests
>>>>> +}
>>>>> --=20
>>>>> 2.34.1
>>>>>
>>>>>
>>>>>
>>>>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112847): https://lists.openembedded.org/g/openembed=
ded-devel/message/112847
> Mute This Topic: https://lists.openembedded.org/mt/108964413/3618448
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[mingli.yu@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

