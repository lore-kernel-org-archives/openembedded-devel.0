Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD29AC021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 17:19:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14277.1740503980890709576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 09:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4151b5491e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PDAenW025380
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 17:19:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y5j8bwmk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 17:19:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ny94ZblP7kManPHfiWjkpslbjktGnR40CCXCFVZAJ2HiOUbuflRxuIBbUVdso/hU/3CW3KoFdAfmM/79NNDnBkQQ/Pk/E+7bzfrPvFuRUmNngHtJ/R5VttrraPmIBIUAsOPhG0S9z5CFA2/+g1a7zMyup8U8aPkPo9J5BKQNIAwBkvFaVjrSDPxtGb+ULNrqBmuPLLh7D89sUmWoeXwOhbdLpIXE1thSh4buXiG7DfIdq/B5BNftZuOx4u8L+n85wbiIveGhFMtkjzzEwqOnZdeaImrfh/bHX/GTCsg9FkDZEGKWvwtWxOiTJXFgp8gHg6plIM2i2Ibk1Ojz8gymhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mGP30fq+wKhEmexb9+RFl3cFXK5fI57Bg0Jj3afhws=;
 b=rpG7YgXMGkzD72/gdiiP7dkzbGNbDqog6VGoRIw9BlSK/P5YKzDoDiUqwXxs4FEypaMU4y+xysp57ID2EwbfhOjjJgir2kESJ+FgqDH42gs9lCTRwbod9D1KLYaWivhT5E90C6xxX9aU/AiaEVb5EYHUHDzbS5JJZqCper/fhMfg+Z0sCQoJ4OKoopnN95cdPM7ojx+mgPhzjs7igIYLoDsgDUQm4uHUcW+6tPfOm3cZgABP12iWn2Dzx4WrsWxxrbqAyEqrLKjzMXyPkDGwapzT4zrvNACguU6U9GLdQZlCPAHJj64GVrYM/RCYMm8ow98eKoEY06MlGDibLwuzNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MN0PR11MB6157.namprd11.prod.outlook.com (2603:10b6:208:3cb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 17:19:36 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8489.018; Tue, 25 Feb 2025
 17:19:36 +0000
Content-Type: multipart/alternative;
 boundary="------------utKYG4Nb8fyzaIbMSFaVPwCM"
Message-ID: <baad5622-95a0-4f01-b517-da94db3dd7d7@windriver.com>
Date: Tue, 25 Feb 2025 12:19:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] rsyslog: update from 8.2408.0 to 8.2502.0
To: openembedded-devel@lists.openembedded.org
References: <18278300CAF1ABF2.15758@lists.openembedded.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <18278300CAF1ABF2.15758@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MN0PR11MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ee54ef-69e8-4d66-4b39-08dd55c0941e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dTdCVDJtTmp1UUNidW81SGw0WWlIUkUyN1VUTFRCNnF2ZHEzRWptNUFXMFJa?=
 =?utf-8?B?aTNLVk85bjEwaFdKVnpNRmlZV21EeCs1NUFjY0ZjUmN1bUdVeTM4dWNWTnJS?=
 =?utf-8?B?WFJ0VzNlSy9QMzFFQy91VFBJeW9rUkYrZDdoV0trQU45aGx5bVlPTlNzZkE3?=
 =?utf-8?B?SkF2c0FvTDBwWUZUZ2U3NWdmdkZnV2lUVHkxc25PM2M1RUpWL25NN3Z4Rlhh?=
 =?utf-8?B?dWJYczdDeUVrelllQkVYK3hGekk3ZE8zd3FIRGNWaFVMcjJUb1dxaU96RlE3?=
 =?utf-8?B?eC9MQUk4KzRsTU9uZkxhKy9adUZnWjBEb2UzNkh3U1djeHp6aVYycEhhK2Rn?=
 =?utf-8?B?UnZTZjZ6aUxOMk1qcG5DcEtVZXF3VTBqR3ZPSUdXb3hBL0U2ek9uZnNWdUt5?=
 =?utf-8?B?bUNwSktRVmg0dCtDRjRrT3l6V1psenZ0dTE0YWZVSGlITE9SV3VCNzJ3MWZm?=
 =?utf-8?B?Y21BSTBBMks2cDZDdFJQZWpPZURKUUZWMnpUOFRNTHFTVEx1SzBIRDJBZjly?=
 =?utf-8?B?dTJQY0x4T3QrZUUzN1VGVHR4M1MrTk83aGVlbGF4WlFzNk41Rzkyek8wckhG?=
 =?utf-8?B?TU00bUJtbW0xaXczR1Zxa1JHRFdyaWNtNmllaVptUkVDV2ZGdHlPTFlvYmRE?=
 =?utf-8?B?bE1tQ2dmK2I0aVowVnJDTHBLRDFxMTl0aFBtWUF1Y2VqOS9lU0hGUER6Wjll?=
 =?utf-8?B?UGdydUpqQ2o3MG94b1hMcktwa3N3aUpaS05kbFYyM1pGT005enNrQ2k3M2di?=
 =?utf-8?B?cXMyekxxZ1U1VVRlQURaeTQwaTNaV2dhdnYzWUM3ZG41dHVIcUVrVmpkM0Rz?=
 =?utf-8?B?OEJVZi95ZGJ5U3pBVkdPZ2lud3V0OExNM3A2cU9vWEhqMjdJOFRRaE84MFh3?=
 =?utf-8?B?SFpPWTd6K0txZitLMW1iQ2xoWFl2UDdhTFlWdTdWd1I3M3Vpa1Z1QU1rOFY3?=
 =?utf-8?B?S0dyTE4vVFdwMjNZVEpSaXI1WjJtUEd3NzJDWkJCZ1k5Q2RmUTVnOUVxL3Yw?=
 =?utf-8?B?NEx1RW9MdXVnOXRzTWN5SmNUalB5R3NMSUJyMlh2VTd6QVg0dHlvdkFvajdj?=
 =?utf-8?B?emF5UUJPYW1aazFKTndjb2ZaY2ROLzZrU0x3NHVUeEl2NmZlOGd2aUs2TmFY?=
 =?utf-8?B?K0s2Q0dvQm5QcWl4L2VoZWJJRUJKQ09LZS9iNTk3OGFXbjJ2U2pCWm9SYUhz?=
 =?utf-8?B?cnNIUWYzVWlnL0ZzUnNabWoxUWhxQkQ3NEwwekJYNno5Y2prbnduMlJwV1Rk?=
 =?utf-8?B?S0huM3NIQnRjYWZWTFN2MmZYdzZpOEsyelRVQ3ptV3Zsajc5Mmk5M0hLaW55?=
 =?utf-8?B?MkoyQzlROUkvVEprQTUxL1ltbnNWOUFva0R4Mnh1eFJicFRyd0Q2cE9QWHVv?=
 =?utf-8?B?NW13U1kxZlM2aFpwell3UnBOUXlvelBic3lBcUJIQkJWRG01VXpGU1owVW1G?=
 =?utf-8?B?eUl1OVloSTc2aklPamViaC8zMENYcXBHSzBTc3U3MWMrOTBQZnZDTnNYVVZp?=
 =?utf-8?B?MmRYZ1diNmhzWmpiR1NKWHNGSnJyOFR6TThKZFlmakpKVEpQc0Njb2Flc0xx?=
 =?utf-8?B?Qmk1OS9oNit1b1AyeEFXUG1hY2RNanVrK1N6VG5NM2I5ZDBZOS91ZVBhMFoz?=
 =?utf-8?B?eTNubGI5TUZqdm9NQmgwTlBqSDFlODFoTDI2cWs3emZOelNGam5JWmJ6a09k?=
 =?utf-8?B?MnpnNW5VVEdkeERtaThMNHZ6R2VUNnRFSXRqV09wVWJtWklnRVVsUUcrRzc4?=
 =?utf-8?B?QW82ditKVk15N1haT3lwZllkVDFkZG9SNlZ2QkxYS2s1N3pvZXFOTEVkVXZv?=
 =?utf-8?B?ekJRK2tDL0wyK0VXRUxBQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UTMrampQRHRRWE5BZ0pMWFg3SlFhL2xwVDJvV2V0Y0cvUlRYQkpBeGFRUk1l?=
 =?utf-8?B?eHVTKzZxN0ZaeFZab1R6NWJLUGlJWXNnQm9XZXlXeWIrNnpkQnNXald6anMw?=
 =?utf-8?B?VXVib3UrMm10eE1qRkcrNUF6MXhLSm9CRTdXQUNnTXBZaDBCYk5nOElCbGJK?=
 =?utf-8?B?dWZUbi8wN1pLTndVRVNqSjY1d3I3WlRXU1JHWXZMb2FrcjlSbURwOEhUaHJ5?=
 =?utf-8?B?dy9uREthWGdEdTBCWW1JUGxaaXhKRmJBK01TczVqZ0FBYVNySll3RE50aE5R?=
 =?utf-8?B?TG9ZRFBGd2x3dFpia29oNk9DQXpnODFMdGZjaGMzeHhPaG1Gb0JIWnhZeHdw?=
 =?utf-8?B?a0FvZFFBaExoM3dYRk1rOGJkWDdPWE1RR2Z2WVNTSUpscENvVldtbGNhRk4x?=
 =?utf-8?B?UWxmaU1qbklQTUc3dDErclhMWTdJeGhyNFNTOHJQZDgvdlZOcFFqQmJBRWpX?=
 =?utf-8?B?a3hHNTllSm54N0RwS2U5QVRHZE1mZVRPa3IvVFdXU3c5SWFRUDJlMis0K3JV?=
 =?utf-8?B?NWpVZXZ2Mncva0djekxKeFFPYTFWalEvRTJXSTlKemlOK2dOVUNkeVJzd005?=
 =?utf-8?B?U0hQNWc2UVhWbUxZaTNQd1FlQTVJbUxQaHpxWElVUEgrY1FmQ09jdGYreFBi?=
 =?utf-8?B?NUdlVEYwMDZPNkpUeTNlYkJrT0kzV1JRYng3UGUrNGFNU3BMUEVkYzFMYktv?=
 =?utf-8?B?RGY0eTVDUFdaV0tVcm52Y2NBRCthOGI3aXBBNWx6eVI0MlJBVHBNc21PS2Uz?=
 =?utf-8?B?aTlWbFN3VjVWS0hpQXFRMThndnFVaWVtcFhKTnR2K2VFMVl6dnFJVTlNQWFq?=
 =?utf-8?B?SUkxQVYyUEpZY1g4N0NWOWw0NVp5dk5FaWpmUGsvcVNkZ1FXR01zdXZXRHdj?=
 =?utf-8?B?ZUt2MHFKQjNla3NYcXBPS0tzekZsUmN2czVack0vVHNQaEMwWFk4YVpZcGlR?=
 =?utf-8?B?VHB1ZDRrL0Q1aGRDTllHNjhiWTFvTU5xL09teDBJd2RwQ2JuaGNPT253VXhS?=
 =?utf-8?B?RkttOXcreGhyL1FxZk5tRnVLbHlBRGRpa0hlalA2N2tYN3JoTm1jYStnOWhm?=
 =?utf-8?B?dHhxQ3ozWnBPelFsQVV6c1ZYbzd3K2RySUpEcXcrQXJ0L25pNW5tTEdITVJ0?=
 =?utf-8?B?czlrb05YUGZxK1V4Y0M4bUg1QzhCN3pCdmFPSXBIbVRTa1Y0WU1qMFFXd3Iw?=
 =?utf-8?B?ejdBekRRMTEyek4xZlhaU3NzRDVWUGh6M3RlY2FVUjlBd2tTT2U4THB2VE5C?=
 =?utf-8?B?SS85YXdEdVkrVzhjYVZENjh4KzI2THVaOHBHdDBNWkJJRlNLeXdaVUZ4VFdp?=
 =?utf-8?B?bDlQT3VoUVkxVjNkN1V5a1BRb0JrQ0VES1VCSU81UTJFNTM0RE81Mm1JVEtM?=
 =?utf-8?B?Z3lSNkdSQ0JpcDU5eXk1dXZlRFZsaUxzUWY3REgzQXpZUVc5T0RKaExxdEZ6?=
 =?utf-8?B?YlVhRUsxbWRDN0dMUVEyczRIZWNLY0FTc2VQVHM2VDk3UnJlZ0ppdi9ITDJi?=
 =?utf-8?B?N2xGaWZreEM2ZlVyZUNKSnQrV2pzbzF5ZU45cThtSDVueWxrWVk4UlZDR2xD?=
 =?utf-8?B?U1NWQlY1Q291TUZLQ2UxemJteVU2OGFjQXFtYmdWQkJHODYrTTV4K1liQTVo?=
 =?utf-8?B?WTdYOGNmMWU0engwckd6NHd1dk5HN3RTWUp6dkl1a1pQMHNTZmxQREhBYjFE?=
 =?utf-8?B?NjdZeWs1VElYZWJ2dXJOQ0ZSZko1NGp1R3F6OURtNUd3VFZlUmg4THZVUVRT?=
 =?utf-8?B?Uit5dVNSMzM5dzFIalFUQnNDTkFhYzFhTFEyK205aXZnMklYeGVxR0d1eXBF?=
 =?utf-8?B?MVB3R3A5NmNJQ09kZEEwSG9kcEVkWkhQWUhNajFuY3RnbDcxUS9RZlRueTBG?=
 =?utf-8?B?ZjR6cStzSWVtM3NKK1VxY2tmODNxU2JiRlhrWUUxRmg0RUVYeGMzZFRvZjJ1?=
 =?utf-8?B?V21LY3RuT3ZnVzlEQ3BCdWVuT3ZsbFY4ZUQydVJlTlJLWGFCSHMrNGczaWJ2?=
 =?utf-8?B?RmVPdEZPZWpBWDI2cmw0d0ZJTkNRaVpKZFh3MzIxREtoMXNna3VJY3MvTnk5?=
 =?utf-8?B?RzhxWXNTcVQ5cDFFYWRyVCt1ek9oK3MreW1MaGJGTVp3NXRUbFI4NDZIVEJv?=
 =?utf-8?B?WGtNYjJqWlFrQUQ5OUo1SEdqNFNzR3lSUHg5WmtvREc2aFFlUFpJWGZsWFEz?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ee54ef-69e8-4d66-4b39-08dd55c0941e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 17:19:36.4641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qp63wqzD+NkeDhlZzmiFuKKNhDZ46sNTLJYX4jbaEQcQ6mF7BTm83ceSk+Q+3WLuzGxR8cGUUph+GRiA/rc6C7g84yNg9ASxX0R5r1N0nAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6157
X-Proofpoint-ORIG-GUID: AU8THb80upWP3Ces0Z_r9Nf5r3AOcbNC
X-Proofpoint-GUID: AU8THb80upWP3Ces0Z_r9Nf5r3AOcbNC
X-Authority-Analysis: v=2.4 cv=U+ZoDfru c=1 sm=1 tr=0 ts=67bdfbab cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=HqkB1E_ulsV8yy5iQQwA:9 a=QEXdDO2ut3YA:10 a=zH8ZvrO9uYEWziTFVyAA:9 a=o4kt2h6UtjTBqOzt:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250107
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 17:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115586

--------------utKYG4Nb8fyzaIbMSFaVPwCM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-25 12:16 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> Update rsyslog from 8.2408.0 to 8.2502.0.
>
> Full Changelog:
>     https://github.com/rsyslog/rsyslog/blob/v8-stable/ChangeLog
>
> ptest results did not change from 2408:
>    TOTAL: 469
>    PASS:  464
>    SKIP:    5
>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   .../rsyslog/{rsyslog_8.2408.0.bb => rsyslog_8.2502.0.bb}          | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2408.0.bb => rsyslog_8.2502.0.bb} (100%)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2502.0.bb
> similarity index 100%
> rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
> rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2502.0.bb
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115585):https://lists.openembedded.org/g/openembedded-devel/message/115585
> Mute This Topic:https://lists.openembedded.org/mt/111380922/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
Ignore this, I have uncommited changes that I need to add.


-- 
# Randy MacLeod
# Wind River Linux

--------------utKYG4Nb8fyzaIbMSFaVPwCM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-02-25 12:16 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:18278300CAF1ABF2.15758@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Update rsyslog from 8.2408.0 to 8.2502.0.

Full Changelog:
   <a class="moz-txt-link-freetext" href="https://github.com/rsyslog/rsyslog/blob/v8-stable/ChangeLog">https://github.com/rsyslog/rsyslog/blob/v8-stable/ChangeLog</a>

ptest results did not change from 2408:
  TOTAL: 469
  PASS:  464
  SKIP:    5

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 .../rsyslog/{rsyslog_8.2408.0.bb =&gt; rsyslog_8.2502.0.bb}          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2408.0.bb =&gt; rsyslog_8.2502.0.bb} (100%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2502.0.bb
similarity index 100%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2502.0.bb
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#115585): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/115585">https://lists.openembedded.org/g/openembedded-devel/message/115585</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/111380922/3616765">https://lists.openembedded.org/mt/111380922/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p>Ignore this, I have uncommited changes that I need to add.</p>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------utKYG4Nb8fyzaIbMSFaVPwCM--

