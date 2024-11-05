Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DC0D40D04
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 23:16:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33995.1730848553751591737
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 15:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1039f3e000=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5NEhEp011467
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Nov 2024 23:15:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42n9a0ks7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 23:15:52 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A5NFqtr014803
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Nov 2024 23:15:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42n9a0ks7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 23:15:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfnkLmCSKlQMqBOaaE9Sc42+Q3JPrxwoDbx6HGbhnHQbajwTXpRLe5qPvZdyHJSJlOVIuEkTuge2yNTyprZIec5myQ0xL9uDtxF9zb74NzegUy45mjlMNpvHbaf09V/GbSCuVMDtGr0lQ9JCGyCn1JT7EDQlYf6N3h5RnfyOfbvjercOIcjmmC1s95gj6PWG9xQN273Z1aA465BA2gRKt2zGHLa3RMFkDf0OTKIuzvbdf86gVy8n4AXBg6yI5aKSApzWZgZ9deYFEB6b64Jk9ISJ5WwBcY4atEEuQ9XljbJyXfvy9nzoZxSD+2C/XZtgp9E4mocvPB8UU9d3vc5aPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIiCgUiMyiIlq4OiB4GvpXQjmnurovIKEqPh+rC2gM8=;
 b=qDju8/bkNaQwSawcbE0ZDtSkB+NRvqRvOLPmBPoCY+i9TpYzLyAkMmy/VjZWcWs11FW6HoMjh0bO+hQMMIsByHqH1X7TQ16QFFauVyRJa6szbl2enL+UANyPAMf1h9ZNQqOsJ1GOOLM0UqFDaOe12X5LnMHtahgJs0nBg0mSl7Pa577xmFY1epaYSOxnarT0oKYIwnn9bzG7BAUpYfnKgj9tU+NmULPBXiHuv5pPLtAy4lWHnP+XpaQR6nyKH3G3OEguVf9aY1OyeM+Q8FciR6kB4x2e62OWy9MdmwpkraytxdtdmaNyyHskAdCJHfGm/YcqfCYXyFkShDOFQdyvFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 23:15:46 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 23:15:46 +0000
Message-ID: <950fae77-cccc-4785-a930-a42c86571d5e@windriver.com>
Date: Wed, 6 Nov 2024 07:15:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] parallel: Add recipe for GUN Parallel
To: Rasmus Villemoes <ravi@prevas.dk>,
        openembedded-devel@lists.openembedded.org
References: <20241105101028.2967192-1-peng.zhang1.cn@windriver.com>
 <877c9ihrc0.fsf@prevas.dk>
Content-Language: en-US
From: "Zhang, Peng (Paul) (CN)" <peng.zhang1.cn@windriver.com>
In-Reply-To: <877c9ihrc0.fsf@prevas.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0198.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::7) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|LV8PR11MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c40b857-db5f-4429-6f88-08dcfdefc685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WUNJY3hOSUxlN1U5RzBHTzJxaGR5TlpZYWVNamcrN1dZV3Jhc1Qyc1Y0dERH?=
 =?utf-8?B?a0JqZkczSnh4UUpnOW1Eb0dXbmp0SFlHZ3o5YjVqZFhuKy93VktEQnBUUG02?=
 =?utf-8?B?bExpREE4bHI4bk5tV3BWTU10WTIwTjZxRVJKeUlXMkdUZmY1S0dsRmVQTWVS?=
 =?utf-8?B?SkVzQmNuSUo1VTl5ejlnRHR3TWdlK1Zwc2ZYbnBha1dIZzhWRFdldUsza1U5?=
 =?utf-8?B?emk3a1FBWlBUWnFGbkZ1aklwVjVJVkFtV2ZZbzcwOFBCczlITFNnTFg2TzZB?=
 =?utf-8?B?TFB3Z1pWdWJScXN4ZVJMdm5MeTc0clE1RU00SnNlTFVRRnNOeDlmUktuT2xx?=
 =?utf-8?B?OVBmOFVibER1bCtBcnpKR2lSWC9QM0haaytadlJQOFJHTi9ncGl1eFlDcWtQ?=
 =?utf-8?B?Uk5CazdhUFVIbHd3aVlMbzV2Q0Y2endBMG92aDRxajV3N1BBU04xQlFCWUFW?=
 =?utf-8?B?RGNiT2dzRHQyeVRhZnE5dGVoRncxOHBWU2EzN09KbTJYMzc2YzF3K3lRN0Uv?=
 =?utf-8?B?VU83aGN2M21tQS92d083VFdRSWVkUGdvTzlrQVkrcnhUR0FobVN4WTNBTU5H?=
 =?utf-8?B?NWRIaHYwU1RDaHRmRzlXazVsSTI5NEZURit1UjhGUTlOcTBEN3dHS3h4c2hi?=
 =?utf-8?B?RXhRZVg4T3FQcnIxaldFUnllT1I0eXcxNjd6dTh3am9HRnpjcnRiS0w5NEhM?=
 =?utf-8?B?eDU2SnkyTzI0YzZDN0hOTGNISXU4ZFhYRUZycE1qelBWQlhzZHFYcEdnRDRi?=
 =?utf-8?B?cWZlRG52bEZudE51MW1qRHhLLzdWcm1jdzU1czRPenNKVzFLdTBQczNSYmZ5?=
 =?utf-8?B?c1luei9lM3kySTIwaHdQSlczY1g0aSswZDFOV0hIY3BjemswRHJqTVRNeWJX?=
 =?utf-8?B?R3lKUVZWZGdDTjdxdGZqcG9pOGxVZEpVRWcwWnVkQmdjNVdsR1BNZ0tRVkJK?=
 =?utf-8?B?VzhMSCtnWHJQUElPNzFvQXUzVkl0MWxEMjZKVnNXQVFZaGt4N29Zb1B3Y3Rw?=
 =?utf-8?B?S25MRlRkNTJDSEpDanZLYzJaRjByUjZybzN6QVRTYzNwVm43SExLUjZzMXVV?=
 =?utf-8?B?QXFRMVV0MFZLZXRJNlhJaHJiZkRzTitxVkV0c29qRVNEdDY2Y0crbWhPR0kx?=
 =?utf-8?B?MnRjekdZMXlkZERmVjRjU0pHOVFqNjl1RC8vcUxmWkdaa2hnWUYyYm5DWjdW?=
 =?utf-8?B?TnNvbGJ6cVJkdjN3K29sRGxITGExZm9zazJwNFYyS0ExdkVsaDN0UHlaMlJE?=
 =?utf-8?B?ell5Y1V1TUI3akRIWnhxRXdVN09teVBTSU9xL3dSNmhNMmo3OFBqMjFzMEds?=
 =?utf-8?B?R1J5TFhCR1Nta1JPV0VpSXBBdzhPZ091bUF0NWcxL1NhY09iTzVRcm8zY3dU?=
 =?utf-8?B?WEhnV3FkR3hTa2ZIMW1rRTduWVNlNmxYdXExWEpCWVBHRGw5TVpYUFo3ckNn?=
 =?utf-8?B?R2NvbW1HRnFYSnlOZXB1Q3A5KzdsTVVxcmZuUncrcjArcG1OMmw0alVPZm13?=
 =?utf-8?B?ZG5CaUlWWXNCOFU0L3lWK3ZSa2FrSTlCWnBVbmZaWGxMV0VMVG9xYUgyc3hD?=
 =?utf-8?B?Q0FVNDRBeUZObGFPVUJSMkhDRWo2dEU4UnN6Wm1WR3ZDYThQSkFxZkVwMUVM?=
 =?utf-8?B?a0Z1cGNzTTBwUFRzR3FhbGw5WmE4S01Cc3FLZHpxcU1EdStRMFgzOUNOVWdq?=
 =?utf-8?B?WFlKajdRNERqNkViMmRnUm9RMUIzWStnSVp1MDlrOVF2R3Q4U1NGU1phWE1B?=
 =?utf-8?Q?MdSmLzh+xGau4rhIL0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEZMcGhzaFh2WTVtUStuZ24wb1o2M2tXNGx0dDBZVmcreCtmYVFBazVvclFO?=
 =?utf-8?B?Qm04UDhHMzYzTGZicytCUDVuRzMzN0FMYTBLT1dZY0QzQjUxdkwvN0s0RWdC?=
 =?utf-8?B?MTR4UW5ZMGI1SlhYNWZTcm11VnZBQWwrUzNzRitWbGxqRjdUaHhTczJ3VGlq?=
 =?utf-8?B?S2ZJRk5scFhOQ1VuRDNnV0tGU0ZRUjNLdTM0THkwdFA2aHNZRDUvb3RBWExH?=
 =?utf-8?B?QktKaHFxbytrREQrbm04d1NJYU1ObyszSHYrMmNrVzZ4N29PNEhMb3dHN215?=
 =?utf-8?B?OUgyVFJwdG5tbDlPVEVremR6cXMwUWZobkwrMVpnQzRyTElMTnFYUXBJTnZW?=
 =?utf-8?B?a1VJZEJaZGppU29CdUFnbWZSZzBFdmpmU1Nld1ZXQmNHVTJMWkxlcllaVWRp?=
 =?utf-8?B?NzhQR1czVjk4VjZrK3k0eEFXL0lrZGNyQUlLVVFaTXVUbkhsUmpwWmZ4TkQr?=
 =?utf-8?B?Q2V0WS9EY1ZReHgwcGw4TDZVT0J0M2I5cU1ZbkxNajlqSzM0K2FWd1F2RTVY?=
 =?utf-8?B?QUdwbnlZbEpTNWxMMWNUbmkxT09tajlPWlJteXhpVEJYeXlZdUxLcEEySm40?=
 =?utf-8?B?WitWN25DNnpsbGRGb05TbGFVaE5SSytVTU0xK2NjT1dwcmE2ZHVFYVBzOTVD?=
 =?utf-8?B?NEFta3RtUGhUaWpZcGRZc1E2TVBaUTVvVStKRVRTTGFtc3NacnE2a1MxVEY3?=
 =?utf-8?B?Y3NzZEtUdXpzMVJNU1VLbEs1MklPWEFyZWR4OFJIS3NHNmQ2SStnME45eWp5?=
 =?utf-8?B?eXZocC8wNEtocENiRXNuR0NuT0hGTUV3ZHplZmYwRmhGalNJSDN1YU1SSTZH?=
 =?utf-8?B?dXBTWHljNnE0bzIxQ1RvWW80dE9mU0dNbXY4cU96SnhVc3VFcmg0OHFONXRR?=
 =?utf-8?B?bXkwdUxCb0FtYXNjRTZiVVIxS0U2cmxkMGRnYmVYTTdpcTZTaU40OW1LU09E?=
 =?utf-8?B?RVNNblVqNlUxeUs5Zld5bXVaWVZxNFBCS2o3Vk5Fb2dwMlBxK1RNbUh2R0N3?=
 =?utf-8?B?cU9wUzg2WVRmMXI3MDhteHFFaVlZMmh6dmNWeWx4Rk1qVTdEWEpnM29PeVZW?=
 =?utf-8?B?ZVpOTHpCQzZqWTNTS0E1V3J0S2FuenZFYkZ2RU5qcytXUzJmdmFqS2JLaTk0?=
 =?utf-8?B?MksrUkZpR2xHNmQ1UEwzWllCVmlJUUwzSmFNMSt1WDFrN1FjOGUrZTlsVzdM?=
 =?utf-8?B?ak5BMlArOGxldVp4cU1ITVVwbzlXRjhsRytiMXNBdW1MeklULzdDbGdFcXIy?=
 =?utf-8?B?dTl6Q1JmZWRjeDZERWVZQ01DMkQ0UzR4bnhwK1F0bWoxKzd3eEhjVzFjczB4?=
 =?utf-8?B?QjhoYitFUUxDUTdxVXZGdk9PVHlHMFJ6Q3Nxb244N2x4TStLYndwNURxRDYv?=
 =?utf-8?B?VHRKbjVGVzNST09zbllLeVM3ZFNKb2xuaWFRc09XV3poM2o4VUROdjYwYkcv?=
 =?utf-8?B?UVMvakRrZ3EyeDBsRHJiejZ5Ym5DWWQxR2RrNzlvSk9HQUlJcWk5djBDTHE2?=
 =?utf-8?B?VXJqSEpUdmEzU0paSFJsQkEyQ2RDYnhyOXhPVmw2QmZURWRpcVA4KzBFR2Zs?=
 =?utf-8?B?dnlSaFVRODk0MXIzSXNrcCtrRlFRSDJBc29UNnU5U2Y4MWtJVU90alNNN0lw?=
 =?utf-8?B?ek9CR0NMWnRRY3pyY1ZEYiszMkZEbHhLbWszY3hadHJHN0pTQlB6cnA1RXRF?=
 =?utf-8?B?elROdXo3N1J0d1YyajE4OUtmc281UG5CKzZqZDJPQWJXcDVoZjJpRWl1dit6?=
 =?utf-8?B?L3VUUEdkdmNPc3IrZ0RFU20zSm1VSnlkRXRKa3FkOEs4UWxsb0YvUzVMVko1?=
 =?utf-8?B?Y1JmVVFVSG8zT2pURU81MTQxOEtON0RTRFNnV29kdTdwR3g5eG0xeTkyNnF4?=
 =?utf-8?B?S2NOVUZkK205ODZPTXQzTDI0WDU0bUtrbEowYlNDbHZjdnpQN3hWbVhtak9p?=
 =?utf-8?B?ZWlmQTdxZlN3ZDlLa1Vwc0dvRUo3SVlJRWpqVVFaUC9pa1ZLWGdxSW1td0VX?=
 =?utf-8?B?eXlWbnExVE9YdFN6WUl6RVNKSnhoUXVZdWxYNWhqckttUFJGNnQySWZDQys2?=
 =?utf-8?B?bmtTTk9pbGliOXZDdTVQall2d0xPUjhYT2J5TEx4QnNOY0ZHSUxrNjZEMFhG?=
 =?utf-8?B?c1lmTlhxK29PbGIzLzQ4MDdkZExSMENDTVFiWmZsNmtsR2NIdnQ0UWVpSkkx?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c40b857-db5f-4429-6f88-08dcfdefc685
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 23:15:45.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XueDO62BtxZFfAu4eF+fgyO16QV7/MREhKPDVVXxp2IS3N7/Ng7wDAg0pwMduIR8WI8blZYLi6CMRqEnFnJHWMtIiHfhaE3nK4fzodL84YM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
X-Authority-Analysis: v=2.4 cv=H7mJwPYi c=1 sm=1 tr=0 ts=672aa728 cx=c_pps a=R19XVbJ/69TrMGWtO/A4Aw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=aw_f5NwdnZiEFQ-lUL0A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QlSnx-sBoPDWPdG2fWffTKGUdhvEus0s
X-Proofpoint-GUID: EGmnQzy5vzOQuO2itWpNyBBPQI2QQ363
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_07,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411050181
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 23:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113680


On 11/5/2024 7:07 PM, Rasmus Villemoes wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, Nov 05 2024, "peng.zhang1.cn via lists.openembedded.org" <peng.zhang1.cn=windriver.com@lists.openembedded.org> wrote:
>
>> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>>
>> This recipe adds the parallel package, a shell tool for executing jobs
>> in parallel using one or more computers.
> I often use GNU parallel, and might find some use for it on an embedded
> target, so makes sense to me. However
>
>> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>> ---
>>   .../parallel/parallel_20150322.bb             | 22 +++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644
>> meta-oe/recipes-extended/parallel/parallel_20150322.bb
> Why such an old version? It's not a dead project, there was a release
> just a few weeks ago. If it's because of some dependencies that the
> newer releases have grown and which are hard/impossible to satisfy in
> oe, that should be mentioned in the commit message.
The first version I used was 20150322, which was already quite 
user-friendly and straightforward to compile and deploy. Given that this 
is the initial version of OE, I prioritized getting it working first, 
with plans to upgrade as new features or requirements arise in future 
iterations.
> Rasmus

