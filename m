Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44571D44D4C
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 11:01:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43173.1730890914995260362
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 03:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1040f5e824=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A689KUm011827
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Nov 2024 03:01:54 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nfc34720-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 03:01:54 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A6B1sDO003841;
	Wed, 6 Nov 2024 03:01:54 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nfc3471y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 03:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZI8YUWeSLubekcUb83gv6n+67ybT1Oq5CKy+b3y1dYVvnfK1iv7GtIpw9UsUj+6jm/5Sr8OFZefEh99gE/wp4CRyFT6wf23WVlckt8kD54v3+EeCsC1iyJy5YqRsMoyjImcj5FI13r+f3Fh9a12MyTWOLTnqI8pLd3Pp/mnJ/d0F/FcNsX3f5FOOADDSygt3fSHPIX/cK8qDFxCfiSz9tox450mJjnnBIgXBy30wPeTmcSQ+M8fvlrDaAJRML6QPMV3t4sGE56nFxvgpqCh4Xc3LtJspqS+c/jtl6oCPOykJkJv+v3PrxXoIK8TKpW5XTY+1N/89gXd6SLiBvBjzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoz9FuXTBaO68SjD5E4957viDOyeVCNJv26kow5P+Cg=;
 b=Tr0Knq3tyScit8f5HMGX2MQldffcB4MWhnjiZ3gJ7Q/erB8s4VKkLQIE8472XgWFX1LJ4hkDOzxmRUw+KGeWgj/RZfH7/3bZ4WuRQ7YTNmNpfebK8lhP27LwDvHNKjDbewqFqR8vcr+xBTWdg5NTdNNSqZcb5MhPvSvEOuKqixoHoU9+pzXwzQk/ZoQjQG7qj3dsX556hN9WCgq1eP5Tm9x3mm7VzQtfncywcLN+oB7gKg2OOl3zeUdLDTVfT6pZT2pteAzkNGB+5ajxJSwadPRbBHCzJuzZ2TCaPqrAe9epBgNec9Gh6p2GIt8ViPKebiiC2rUwFnxfkQVimP/OaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 11:01:51 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 11:01:51 +0000
Message-ID: <4062de02-7e81-4a0a-b227-c64e92097648@windriver.com>
Date: Wed, 6 Nov 2024 19:01:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] parallel: Add recipe for GUN Parallel
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20241106103614.281919-1-peng.zhang1.cn@windriver.com>
 <CAOMZO5AJt0sdQroX6-9to1ERuJNg8Q+T_=0rG0-ekRd-2Cu1ew@mail.gmail.com>
Content-Language: en-US
From: Peng Zhang <peng.zhang1.cn@windriver.com>
In-Reply-To: <CAOMZO5AJt0sdQroX6-9to1ERuJNg8Q+T_=0rG0-ekRd-2Cu1ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::11) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f57687-f3c3-4c31-fb17-08dcfe526a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UmpiZjlkSHcvOU5OZHQ0TS9heW9oa0RXVFVpN1puMjMyQlljZ2l3NEpabWpH?=
 =?utf-8?B?V0YxUmRlMEFYYVFlOFB4MHkvcFZWT1hlUDNUYTZ0OG9VYkxEM2IzZzFXdzRx?=
 =?utf-8?B?RDViQ1JWaTEycXQ0cmgwQWRMcmp5VHJsRVdLTEF1UDlTTU1kTjlkU003S0J2?=
 =?utf-8?B?NlVCa1ZwNlJDUEpadVRlUWlGbmFrazNpbzBXSXBXRHdsdzNWNXFiSXltWnFX?=
 =?utf-8?B?QjhaMnhDbkVDWU5GZ2ZUOFU4UXhYaGdtd2s3SXk4NDhuV1pKeXJBREhNY0cx?=
 =?utf-8?B?NVZYam5NTktNMHBJTktjeUZ3bHNOdXlGcHZtYXNPN3phQ2EwWVdObGxqekRU?=
 =?utf-8?B?NHUzSnM4TVppaGw0S1NKRWxGZGJyZjVPRGs5b0xLekJrWjJlcEZVUG5sck1Z?=
 =?utf-8?B?cUpobXJiSWU5WnlQY0RzNjAwR1R0UDRTZkxacjRQcmJVTmdHZW54UHdqcklY?=
 =?utf-8?B?V1NFM3VBaFR1T3FObm5XMk9ldnZ6REUydEE3U3NRRzdwQmUxcmpERW9NbHYy?=
 =?utf-8?B?L0lVODNsODBrcVpYSHFzQk1xUm5JUG9Fb0xmN3d0VDRoMy9RU1Z5K3h3REpX?=
 =?utf-8?B?eTA1RUxZM2ZYTUJMT1lNMm9kNVd2ay8rWEgvMVBKMWJOR2QybHUvemU2RkZF?=
 =?utf-8?B?d2U2WGdmZjF1b1ljbkRvSTJBVXg4c2Y2QURFR2hMZjJBbk5GdmlyemZROEps?=
 =?utf-8?B?ZkdLN3Y2S1pkM1pqQXR1aTh1SlllSFIwdnlkY1h5YWhTT3ZxSnZFblNhUGJI?=
 =?utf-8?B?b0Y3VTZIL3RyWEtwZ3RRSTdETm5ScU1rZVQ3RnhWZXpIRW53dk9Ga04wdjZl?=
 =?utf-8?B?elJHQmRRK2V3OHlSaVllMWFCenBZckF1QUdzTGt1MDl0bUZKRlVqVWpldUV6?=
 =?utf-8?B?QkJtcjZzbVdiak5mcEx5dGgvSlBiSWVBT2JXNlExOGJncFhpenl6MnpuSnBv?=
 =?utf-8?B?YWJ6K0dXNVQwb2toS1NQQ1dpQzdVU0hINXJEMXRZTXUzc0NiaVVnWkpIWVBp?=
 =?utf-8?B?dXpxU2xFeGZGM1VQUVM4YzQyTm8vT3o1Smpsa3VHQ3FWVDZJdlBOUEd4R3J6?=
 =?utf-8?B?RFduUnZXTThkVFczT3JvSzFqekhWNHVQRldRcDFrNlNta3R4VVNwVXZNWGQx?=
 =?utf-8?B?VEN0NzU0VmlsQ21EaGJGOFM4ZVJiU0dPRUdYb2dYenZvakhvNHNyT0pZU25U?=
 =?utf-8?B?dHhXbTFMeEpQejJJMVFWdVFXYVlqRmdOYlFNL1lBQ1QzRU1RV2U2WkNOdnpt?=
 =?utf-8?B?MERpbUV3VEFpazlGdm9wTlhNTUlxenVOVlhEN09ZaWE0U05DUmhzbERhM2w3?=
 =?utf-8?B?bjFPekpUYUd2UDlwZm9GNlNqc2svcDVGM3RFVG9LelpZUXpqN2tycjlDbGFD?=
 =?utf-8?B?NEh6eG8yeUlhdWZyOG02TzNmYStiR3NsWXR2dWF0Uk5la0V6bzhyVFJENk14?=
 =?utf-8?B?Z0F0TmJLQ3BpMWF1TFl2cURSRHV2VEdrRjBQSUNjZCs1WUkxN2JER0lhZ1Zw?=
 =?utf-8?B?V0s1Y2FDQ1dMR0w2MERkdnQ5Qzc4bnNCc2JFb29zdWJtUk9VZlB1QVMweE0r?=
 =?utf-8?B?Y2xYODNvalp2aE9YMnJiU2ZIRDVBbUgzRmRYN09XUHZESmJxZFJCQUdzdXBm?=
 =?utf-8?B?TkNpYzNGOG5QZ0xUT3p4MHU2cHorUjJNQTgwZW1qcWVHQjZFd2tnZnAvL2xW?=
 =?utf-8?B?WEFpakFIMFJsbzluSEhSSmNBNERIRDllZDJlRXJOTTRLRDBJY0xvZ3JRczRJ?=
 =?utf-8?Q?oFL9aHWoTEIp0URzSOOMNf2aZtzTtEknP4jdNEZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SCs1THdZL3E2Q0l5VFlCNTR5V29TZVVwZngvdm51QlhaSUNlM1dDM3pFZVRh?=
 =?utf-8?B?d2IwRmhoeE8zWE5qdGgwVnk3QWhuZHo2K0JyN2d5SWoySHpmY1JmTyt2eWpq?=
 =?utf-8?B?SmhBV3l0L2dxMS93UUhla0ZoamRUbjJOcWcvWG5NL0Z1a1dqU3lwK2ZibzBS?=
 =?utf-8?B?OG84akNZS2dPZjk0K00vUllEREhmY1FQaExkTnpodkhlRHBDckhCcnE4SW1p?=
 =?utf-8?B?QzR2UCtIZ1U0YkF4SEYrSThSVTFmaWd1UjVVcmt4V1lJaDI5ZzVjSE5qL0hu?=
 =?utf-8?B?NVlhWXovdllPbnV6Y3BUeEtBOWtVcVJJc0dVQnIxN3Z5VmZFekkvZ2xkaHlv?=
 =?utf-8?B?RUQwN3pYbThRNmxxTVgvZXRwT2VlaFA3SzZjWXAybS9FdWlwZVhKUFZ1NFlX?=
 =?utf-8?B?KzRBaGt3ZnRRR095TjAweDRVcVlXcm9JWkhmdEZCNWFOR2QwSnBWYll1VFRC?=
 =?utf-8?B?U2gyUXViMzJMVEF4N09YdStURTd3VFJBSldhUGtJU3BIeUlydkhRRDBRMWN5?=
 =?utf-8?B?UUpSa1ZQWXZ3dXZCcklmNHFoR2xsWW4xUjZYUEY0b2lOS1RYTnNCWnRiWFlN?=
 =?utf-8?B?RytlRk5NTEdtL0o3VitVWmUybWJFa0lzcEZIUzUvRTNndEhNTTlmLzFXMWtw?=
 =?utf-8?B?bTNNSzhXRmtLRlZHMDl1aE55OUhlVUxnREtJanNuOXA1eGF1bExRc1YrNmti?=
 =?utf-8?B?UXhUNUJYdk1yQjR4a2tib3g4Z3doNzRyQU9idGh3WkZSeXg3R2lQSXE4UEl3?=
 =?utf-8?B?TitIY0F4MXFkemVxc0U0Z3YvSVdrb1pmNTdnU29FNWV3NlZiRXBaWWxQYldY?=
 =?utf-8?B?SkZnVm5XTVlFSkdUTVFGaGszNG02Z3JMTjNsMitoek9PdXBJc0UrUVR3STQ1?=
 =?utf-8?B?cGh6S1FmWFFxQXVEdWdTbW9JdFduTWVtOFlIc2FNUElOZmRkbWozajFyUUJy?=
 =?utf-8?B?TlJwWUxmS01lWHhxMU9QQmxXVjRNYlFvVGpSYlFVaUNEeHIwcFo1MDVKRXB3?=
 =?utf-8?B?MzBrTTlkOGpHRlZrOWgzdjljYXdxb0FNNUVFeStlbisxSlM4c1haWFErOFpy?=
 =?utf-8?B?M3JzRGVMbHg5alNTMjE1S0F1bXlsckdOSXNBSWVhQitoT0p3SlhJdm1UNnY2?=
 =?utf-8?B?ZFROUWNzeHdRL2RUZ08vNUtQL3NnOU9NRDRGbFNRdmc0UENaRXlab2JFcHZH?=
 =?utf-8?B?RjNnYjNIdDFhTDA1SDQ3NjVQN2g3T2xDVGtWVnBHczBPZTR4dS9Ba2FjdjFj?=
 =?utf-8?B?OFd2eU1maXZrbHNhV2Y5OSs2cU9KZXNSV1J1T01tN3diV0M5REc2d0p3UHBi?=
 =?utf-8?B?bjJROGRZMjVUV3RPRFpraHFlTm8wVFRlVFZpOFRkcUVnSGUzSmVIYjAvYkhE?=
 =?utf-8?B?VWFleDJkUThpcnA0SjVWYkRBVSs5eUMzZE83SkUzZ1ZQUmQ3SVh0U1pqWnB5?=
 =?utf-8?B?aCs0TVA0ZDdWZ3hzQTFZYmJGcm1PRlBhckIwQVJ1Z0c2dmhDZDV5N3V4QXFw?=
 =?utf-8?B?ckJwTWdoUThYeGpGUGFsWkNmdmluUjRLMG9PQW9iMzhyNnU1Ky9HNitCZDNG?=
 =?utf-8?B?SGdSbnkxRWhLVjRqRFhVZEdwNENWaTJGcnpTcklvc1dHTUtaVHZnajhuU2Y1?=
 =?utf-8?B?algwVG51RmE2dUZ0T2VuR1FVNnZBRlMrR3VmRWpxVTRaTnh4U3NoYnlGOUR6?=
 =?utf-8?B?MUdIYVQxWEZQcCt5YnZLNXlKcGpPSGoveEFUbW5FZnBSemZoQm9ReFBzKzFS?=
 =?utf-8?B?Rko4c0UwSzBqMmdPYzRrQXp4QzNnQk9GN2R5QmN5YTA5UnJqQmV2NkpVdnZW?=
 =?utf-8?B?OE5EWEJBR1JqUFFCcGs4eVVTOUtDMWFIbWxrSGNha1ZkU2pzMThua2FEQnJB?=
 =?utf-8?B?Umg0MDlINW0wMmhSRXFqYkgyV3Q0dS9rdDdOamRnSFUrNGdnVFR4alJuS1dt?=
 =?utf-8?B?RUNxVEkwSjRyUk41d3p4L3oxdW4yd2dxSzl6T01KeXBoWWZsYVNvcWJ4Vy9Z?=
 =?utf-8?B?dktoWGNON01vbEdLQnlyTFczd1RzSXIzU1NhaVZUb3RBUFBMMkd5U0RoRkhX?=
 =?utf-8?B?OGJhM0N5b01GaEgydlVUak5DTEdIRU96Zm9IMjE5QmEwdlFOdnVuWFJqZUc3?=
 =?utf-8?B?V2NTOUNXYmY0aWN4OWtOTEcrdGw3Y0t4UjZ4Rmoxcllpd1I2M0tURXdUbGQ0?=
 =?utf-8?B?Z0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f57687-f3c3-4c31-fb17-08dcfe526a97
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:01:51.1789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEJSEmug0k38zF+R6oLK9rNr+0Vlr0g9CJS127m/vyBUdCvNwb0jOsyfu7/q93otiMzeJL9NfBSkJUYbLaQXnvogCA5KnwvE7OadHCzIqQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
X-Authority-Analysis: v=2.4 cv=T7feTOKQ c=1 sm=1 tr=0 ts=672b4ca2 cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=E2-_i-b6RozpX3mYwtsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: gPE3fUZNducJ9yWHknZAEDBgoM8A5iFv
X-Proofpoint-ORIG-GUID: 4cP4B9EePJtKA78FyGmkF4yKi_apYHLc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411060090
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4A689KUm011827
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 11:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113738


=E5=9C=A8 11/6/24 18:38, Fabio Estevam =E5=86=99=E9=81=93:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Nov 6, 2024 at 7:36=E2=80=AFAM Zhang, Peng (Paul) (CN) via
> lists.openembedded.org
> <peng.zhang1.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>>
>> This recipe adds the parallel package, a shell tool for executing jobs
>> in parallel using one or more computers.
>>
>> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> There is a typo in the Subject: GUN -> GNU.

Thanks very much, corrected v3 sent.

//peng


