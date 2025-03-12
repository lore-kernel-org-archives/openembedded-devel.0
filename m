Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36E8C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 08:17:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.32013.1741767445614585990
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 01:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5166ffa0c4=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C7V3Jf002868
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 08:17:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0emra8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 08:17:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvZKuKKwnSHMh87shq7Z6MqdlW+VyvFegHuM4/tR8LryCH+ap8avv1+tExMJZPnnEVg1bxxcypuUCzNnhtsNTiXaFgnWZ5ltX7QA+1fMyVeD27OgrOY/CiTv0DE8PPYFd93Xxjvmgyv46iahCBDm/VzMema/PJxvVxwrmL4WQL49BjiSjxOs9r2NcHASlOtltgXJ4GNqnV10MKyxlIoI1hwY3GyW3v/tDGDDbb8J940xBFmUOtVYK7wnmHoGs8qsNMarYglSrtijlKIeITLCBj6khJh7BZaTPLfBNv6uK0QlbUzeDx4sWpvPs+QCgwW+vMuHHDhv5qu89XPqM7sYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLbKgSddIEiG1Kzqc8/qPBsi8GgOG105F2SRFSJD47U=;
 b=C9WrDKjmZ5uVZl1pIVCde/eAfCxdsO3VOqK+qcK4eQMYfOIRC7llE3wKtzO14SJZtpdum7acGEdudVmdHLcSffA0VjmjzcWNP2VU2M2q1TCXu0aTQQF2jVyhZWILz/mDZYPJl6M/WKlWTp8IBR87Pr5UC383TxzV20yFekEKNdWu5g2sdlAE2hmxEw/zDLzGgYDTGD9c9D5SnWOdLa2TMtxiA2kIkqHys4HT5yTeUvBTsqi3q9VSd8LTqsfFAK2h3ShuMkRrEHTwUCcfGYUY3YMQIigy2TB/zGYaT0h5QDi+jdZdacJOJhSK1k7mP3yfrMUk8YHM5aDkhXwsOV4v7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 SN7PR11MB6852.namprd11.prod.outlook.com (2603:10b6:806:2a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 08:17:21 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:17:20 +0000
Message-ID: <da5b94df-7153-4e2d-9f28-261d5f97c940@windriver.com>
Date: Wed, 12 Mar 2025 16:17:14 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: "Wang, Jinfeng (CN)" <jinfeng.wang.cn@windriver.com>
Subject: [kirkstone] netcat0.7.1 segfault
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|SN7PR11MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 9471c3b3-2632-4ee7-af7b-08dd613e4f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R2NDTzlvallCNFFxaWkzaWFTYTh1WTBTazdWbWhJN2paK1dUYlNWRHZMbFdS?=
 =?utf-8?B?ZDhhamtsSjNUOUNveWFNRDFnWlgvcGVZdlZGY2sya09YV1lqV09LdTRpdW9J?=
 =?utf-8?B?NWMrVTY3enptNkZwVWpIbWY1ZzN6NXltRE5FelFSRnlHaHNKQXVzV3FqSyts?=
 =?utf-8?B?WmNaL0QyVU54WmdTR0MxcitTYTQvSEFOREoydDdjY0c2aDFHaWRiRUNWWTIv?=
 =?utf-8?B?V2UzQW0xWjJ0bkVKSk9KbkZNK3QyZkREeVZnamxzdmVhVlBMQTZCSFFNTkRp?=
 =?utf-8?B?QXZwS1IvN3lzNk9ycEhXcEtDNGpPR3pkb0xiUE5pTEZRN3JZVWs1MHd5VVFo?=
 =?utf-8?B?cktldkQwWm9JOUV5dUVkY0hTUnQyTFZOVmxXbGVmc3FQeHlLY3Rzb3Myd3lt?=
 =?utf-8?B?K2dieFJLUjhGU1ZpSnFLN2pRdC9iTWxtbGxWZStYQkFFU1lKSlFTQUNKOHdr?=
 =?utf-8?B?K3VZRVlOczJ5MEpYcEJwQVFxSTVkQm5VSU5yNk1qcE1oTHIwLy9ZZ2ZWNUtH?=
 =?utf-8?B?UmY1aTdxS0JYREdWUTNVTWdYeDd4OVZTZnZBWU45R0dKYURKeXk4VlRJRW9U?=
 =?utf-8?B?V3AyZXdqTGhwWUg1N1YwM1BEYk8yYm9mU0c5Q0psVkhmMER5VU5Bd3RjbzVt?=
 =?utf-8?B?bDcyT2lRTDZDN2lOWUREbXFlYUVZZVExOVpnOFdZS3JFSXI2OEdTTlFkSGdU?=
 =?utf-8?B?QVV3YldMWGVuM3FVNTB1K0ZHL05wODJheit0c2pyZUxBajBTWkZ4R3hLL3dG?=
 =?utf-8?B?RWIxWXhTTkRvanBrNXdDcm1SUE5CU2Rvc2Z4dlpBUmNTNlQrOEhKK1RTTTJr?=
 =?utf-8?B?QzUreXRMcmlCYWRQS1BObXVxZjhEQnQ3dHE3bU1XZlJlNk5xd3p6aDc1bFFl?=
 =?utf-8?B?WDBpcDR1YUZNOElSS2w1MWxXTVgzbUN2cXFPNk96OURDMU9jNlB4RTJWOS83?=
 =?utf-8?B?MTJxOUhiaVJyRkJpbmQveXhIdmppcWtyUmpuTnF1Q2h6N21QSkFvcjY1NjFS?=
 =?utf-8?B?ekc1ZDdlaEZuOTRRc2R4R0VPRDBwMUZ2M1c4dTNwUG1FTHMzQm4rTXhaMUk4?=
 =?utf-8?B?WTZvMS80UTZvaWhpZkhkYVArdXliSk9GcDVuK05HWVZCc1I4R2hTdStiMGpp?=
 =?utf-8?B?SVVDVkxVcjg2eXNhR054Z2RPTDR4L3lPWTdOR1c3d0VJYmIwR2F0ZFI4WHBo?=
 =?utf-8?B?TGtWL0kyRjl2QkdqY3FYbm1rdVdha0I5MGgvVUdrb05kZm9SS1czU01LUGJi?=
 =?utf-8?B?cTZWZzVYcHBwUklYTUltaU4xb0dCK0VTL040VDcwQXJaUXowaG82eXp0NmMy?=
 =?utf-8?B?ZXJjaG1PaEFCdDJUK0QrSmpEUHVhbVdLZjNxMG0rSzVEZXJqZDZuSW5KY3E0?=
 =?utf-8?B?K3hBbTcvWWo3MEpya3hHQlBEekdRQjhmWHZkYytGQ3dWOHZzTWVUR1ZhNXNu?=
 =?utf-8?B?dTZxaTNZNlNrVDM2ci9nMFlNM2xFWjIzUjdwRVF6UUJjbEhsK3VCSm9vV2ZL?=
 =?utf-8?B?VytSZmFidmxpWmhpemIzZVVTZ1llb3U5UnJ5U3V3TEZqYXZzeWRYSlRxR3Qz?=
 =?utf-8?B?eHlNbVpSbnpTLzdBbkFNdXBucEFlL2hBekJCVXA1ZWZYZGpLYlJvTzZUWTNi?=
 =?utf-8?B?R3hDM0pOMy9DUUx3T2hlYVIyU0hsdFBOQTFVMHFpYTdoNXQ4b3VXYUYwbExX?=
 =?utf-8?B?cEo2bGo1bWQvYkVDWDBQdDZ5ZForclczVGdhMzBLRWIwRXlwcnVLWXJLTyto?=
 =?utf-8?B?SE9keFRhZzBnY2VZM0k5dWVPaXRzU1R0WjNUS2p0TForVG4zNURQK2lrbTdB?=
 =?utf-8?B?QkZqVnpmcXpWZnMvWU9sdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emFCOWpJdFJkeUNFek5wT25jMVljalhZNmZOZFBNTE9DdHZvZU1ObXl5UVN5?=
 =?utf-8?B?SlByOVdkaDd3VFJqQ0VRckM0cXZyZjNqTyszV0dROUM2QWhFUXdML0R4YWVv?=
 =?utf-8?B?UUhWZ01PbTdTa2NOVFUxa3pmc0JEVnJMWXlLbU9NMFk4eDJ1SC90VGRvWFRo?=
 =?utf-8?B?L2V3SHkwd3FGZk1CTDEwU09XZFNyK1BSMmwvWUpkRWtsMkpYRXRGeUg5eGl3?=
 =?utf-8?B?MUVzY1FCZWdONkhoV1ptUTh6TmZLUTVibG5Bd2Y4eDJObm1TWmFVbE91OSt3?=
 =?utf-8?B?TFZuVTRrZXFZK1BFeXp1U0IybHRJR09FbEZDSkdNL1Ftb0lIZURKQnZlSjNs?=
 =?utf-8?B?Ynp6aGxGeXVSTkUwVldBNXU0elpHN0puc3o2QXZSNWpDTGZ5Nkd5dENSSVFN?=
 =?utf-8?B?VFZqMGJ0aUtUa1VpUGtCK1EzS29IcXc1NmNzL1h4bGgvcldiK1FaMmpFejRO?=
 =?utf-8?B?ZjJ2a3pmZUtXQ2YwTFFwUHB5R01hRDgvOEVsYnlMWHdocCt5TThqQlltR0Nh?=
 =?utf-8?B?bXllempBUjZFU01sdkNDMXlKMlFuSmEyM0N2TTlmYUdVNzNzWXU1VUR5UXVT?=
 =?utf-8?B?QTcxZXkrWU9RWTZlejloVnJ5MG56WHJxTGM4RGUwS2RQUlUxc0h4d0VSb0E1?=
 =?utf-8?B?VFpYeGhWbzVHZHNKa09uMi9QbVdTU0txeUNpNFFjei9VM216VjJkUUVSSG9G?=
 =?utf-8?B?NDZhZnBjMHRBY25YaUJmQmFZZ3ZQTDdoeWpoa0lieHlrWFBsRHYyUGlhMU1F?=
 =?utf-8?B?TUFhaXltZEhrbGlycFc2U2lQNDdiNHJYT0lQRnV1TVNObjVqZ2hpNVE5U25k?=
 =?utf-8?B?bVBBQWp5K0p0YTMwYVgrUkZoWmNCTit2SEViZWF1bGgrRzczMnhhSHh6SUUx?=
 =?utf-8?B?c0gybXpvNEZ5c1A3ZDRKYjQ4MytLeHBNZGR0OHBwRm9KK0E0SSthRm5rOFRG?=
 =?utf-8?B?M1BTalUxUFlOcmhaWDZYek1XVmpNR081aGZWeWRJV2pmV0hsbSt3NU1mUmw2?=
 =?utf-8?B?U1dCN2RoNzI4aEhzaHVmcFRZV1J4Q24wbU9BZ1pydlltV3JUNm5lMWdZQlE3?=
 =?utf-8?B?Q0VqV3pEUnoxelBXbk02K1hoLzZZYXBrMFlIV3k4K2gyUjFod3o3Tm4vajFa?=
 =?utf-8?B?Ujk2a3JGejFuaE85eE1KNWJldVQxVzh4R3NPcXQ1TURMdG9ZcnVxcDdwdis2?=
 =?utf-8?B?VE5OSWFsUEVsWlkxSVl0MkV1bE5Ed3lQcGxmQjRCdmNwRG9laUFXUTg5RlUx?=
 =?utf-8?B?ZExFNzh2OERpRzAzWjB0ZFdWRlRLUVpKODJSbllCQjkvOUdyY0gzRTBtV2w1?=
 =?utf-8?B?V0EzQkV2QnV3QzE3RkZzeDFVNnBUMnQyVzJ3Um9La3pJY3NxYVJ3OEpLSHFs?=
 =?utf-8?B?bjJjUDdKQ29TeDVNczNDMndydFVSQzhKSVVWSlBhUEd1NWtCTHF0dzgrK2gx?=
 =?utf-8?B?cElOQVg2T2RFOUFFeWhoNkxzOWM5Y1JJNEpZQUkxUjZzcnYzaDdBQ2NqdUZC?=
 =?utf-8?B?alIzcE80bXRPVG5kbW91d3VmMHVxVVBzZ0hYelNxUzg4NE9EcUVsd21KNFpE?=
 =?utf-8?B?V1YxZ0F6MXU4YWY1eHV3SVZGRVFBZk9icjVnODVvTHBhVmthNHFnUW9vdjZs?=
 =?utf-8?B?RHBGMTNzZ0dlcnNzbjcxbGJLRk5rMisxNk56SVBZaUd4TkhnQlJzZ0dFellB?=
 =?utf-8?B?NElXbW8zVWY2cWZvcnR5SXhCREQ1Yi9UNW5KZ2htelhMWGhFdXdnTk9RbFZE?=
 =?utf-8?B?SnNwSStLc2lqZTY5TFBtTnVBK1hTT1JRTWVaVHNyZDRMTGZqS0lOcnNLQTFX?=
 =?utf-8?B?RElublhEb2xwUXRuY1VoWFFiYU9MYWJSdGxWWHJWbXdOdGxzVk91MHhTR3gv?=
 =?utf-8?B?MjJTc1psTURZOTI1SklDV3ZHRWJhR094MU9wckJaVVJpaU11ZTJjcG8wQmoy?=
 =?utf-8?B?UGRuL1R1MzVjemhBUzBWSFhXVDZRditPU1EvVnJXblpNQ3hscm43TndvcDQw?=
 =?utf-8?B?R0x2ajVQSHhDV2dUUmpiR2Fkemdjc1R2Smo5SkZjcllOV1A5VEFFR3pFOFZE?=
 =?utf-8?B?ZE42cTVmRXJaLzJmTDVuMjlUaDA2OVZWUENSY2h4OE04VFAxUjZ0RGc2NWdh?=
 =?utf-8?B?Qk1RTExmL2Fwa3hWcC9MTXYvU0hMY1ZvSVpaQk1Yc0pOVitqSExlK2ZnQkZ3?=
 =?utf-8?B?a2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9471c3b3-2632-4ee7-af7b-08dd613e4f5a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 08:17:20.7170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEHHdLJiyZQIciYCXVuUyVy52rfHvLAwCx5c728qMKYej3ltOIrs2h3PvgQTERIhnx2JNfewNPRLPcO4DIPJ/IAAsdXUcDBs+ffuxSzUsHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6852
X-Authority-Analysis: v=2.4 cv=J6Gq7BnS c=1 sm=1 tr=0 ts=67d14314 cx=c_pps a=clyc6YhGvfCRRXf4btgSWw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=90G2FcIJJQEvbxH3YaIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: VXjDT4chLs8LYnb0PMuV2ZqjLPnb1ZLA
X-Proofpoint-ORIG-GUID: VXjDT4chLs8LYnb0PMuV2ZqjLPnb1ZLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503120055
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0a-0064b401.pphosted.com id 52C7V3Jf002868
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 08:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115916

SGkgYWxsLA0KDQogwqBJIGZvdW5kIHRoZXJlIGlzIGEgc2VnbWVudCBmYXVsdCBpbiBnbnUg
bmV0Y2F0IDAuNy4xLiBJIGNhbiByZXByb2R1Y2UgDQppdCBpbiBraXJrc3RvbmUuDQoNCg0K
IMKgIHJvb3RAcWVtdXg4Ni02NDp+IyBuZXRjYXQgLW5sdnAgMTIzNDcgLVQNCkNvbm5lY3Rp
b24gZnJvbSAxMjcuMC4wLjE6NTIyMzYNClvCoMKgIDg3LjI1Mjg3OV0gbmV0Y2F0WzI0Ml06
IHNlZ2ZhdWx0IGF0IDU1YjkzMTBlMDAwMCBpcCAwMDAwNTViOTMxMGI5ZDNlIA0Kc3AgMDAw
MDdmZmNhYzBmYTUzMCBlcnJvciA2IGluIG5ldGNhdFs1NWI5MzEwYjUwMDArNTAwMF0NClvC
oMKgIDg3LjI1NDA1MV0gQ29kZTogZTggNTcgYjYgZmYgZmYgMzEgZjYgODMgYzMgMDEgMzkg
ZGQgN2UgNjggNDggNjMgYzMgDQo0MSAwZiBiNiA1NCAwNSAwMCA0OCA2MyAwNSBiMiA0NSAw
MCAwMCA4MCBmYSBmZiA3NCAwNCA4NSBjMCA3NCBlMCA4ZCA0OCANCjAxIDw0MT4gODggMTQg
MDYgNDQgOGQgNjYgMDEgODUNClNlZ21lbnRhdGlvbiBmYXVsdA0KDQoNClJlcHJvZHVjZSBz
dGVwcyBhcmUgYXMgYmVsb3dzOg0KDQogwqDCoCAxLiBnaXQgY2xvbmUgaHR0cHM6Ly9naXQu
b3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZA0KIMKgwqDCoCBnaXQgY2hlY2tv
dXQga2lya3N0b25lDQoNCiDCoMKgwqAgZ2l0IGNsb25lIGh0dHBzOi8vZ2l0LnlvY3RvcHJv
amVjdC5vcmcvcG9reQ0KIMKgwqDCoCBnaXQgY2hlY2tvdXQga2lya3N0b25lDQogwqDCoMKg
IGNkIHBva3kNCiDCoMKgwqAgc291cmNlIG9lLWluaXQtYnVpbGQtZW52DQogwqDCoMKgIGJp
dGJha2UtbGF5ZXJzIGFkZC1sYXllciANCi9teWRpci93b3Jrc3BhY2UvcG9reTIyL21ldGEt
b3BlbmVtYmVkZGVkL21ldGEtb2UvDQogwqDCoMKgIGJpdGJha2UtbGF5ZXJzIGFkZC1sYXll
ciANCi9teWRpci93b3Jrc3BhY2UvcG9reTIyL21ldGEtb3BlbmVtYmVkZGVkL21ldGEtcHl0
aG9uLw0KIMKgwqDCoCBiaXRiYWtlLWxheWVycyBhZGQtbGF5ZXIgDQovbXlkaXIvd29ya3Nw
YWNlL3Bva3kyMi9tZXRhLW9wZW5lbWJlZGRlZC9tZXRhLW5ldHdvcmtpbmcvDQoNCiDCoMKg
wqAgdmkgY29uZi9sb2NhbC5jb25mDQogwqDCoMKgwqDCoMKgIElOSVRfTUFOQUdFUj0nc3lz
dGVtZCcNCiDCoMKgwqDCoMKgwqAgRVhUUkFfSU1BR0VfRkVBVFVSRVMgKz0gInBhY2thZ2Ut
bWFuYWdlbWVudCBkZWJ1Zy10d2Vha3MiDQogwqDCoMKgwqDCoMKgIEJCX05VTUJFUl9USFJF
QURTID0gIjMyIg0KIMKgwqDCoMKgwqDCoCBQQVJBTExFTF9NQUtFID0gIi1qIDE2Ig0KIMKg
wqDCoMKgwqDCoCBJTUFHRV9JTlNUQUxMOmFwcGVuZCA9ICIgbmV0Y2F0IHNzaCINCg0KIMKg
wqDCoCBiaXRiYWtlIGNvcmUtaW1hZ2UtbWluaW1hbA0KDQogwqDCoMKgIDIuIyMjb24gdGhl
IHRhcmdldCBydW46DQogwqDCoMKgIG5ldGNhdCAtbmx2cCAxMjM0NyAtVA0KDQogwqDCoMKg
IHNzaCBsb2dpbjoNCiDCoMKgwqAgcnVuIHRoZSBmb2xsb3dpbmcgdGVzdC5weToNCg0KIMKg
wqDCoMKgwqDCoCBpbXBvcnQgc29ja2V0DQoNCiDCoMKgwqDCoMKgwqAgUkhPU1QgPSAiMTI3
LjAuMC4xIg0KIMKgwqDCoMKgwqDCoCBSUE9SVCA9IDEyMzQ3DQoNCiDCoMKgwqDCoMKgwqAg
cHJpbnQoIlsrXSBDb25uZWN0aW5nIHRvICVzOiVkIiAlIChSSE9TVCwgUlBPUlQpKQ0KIMKg
wqDCoMKgwqDCoCBzID0gc29ja2V0LmNyZWF0ZV9jb25uZWN0aW9uKChSSE9TVCwgUlBPUlQp
KQ0KIMKgwqDCoMKgwqDCoCBzLnNlbmQoYiJceEZGIikgIyBUZWxuZXQgY29udHJvbCBjaGFy
YWN0ZXINCiDCoMKgwqDCoMKgwqAgcHJpbnQoIlsrXSBUZWxuZXQgY29udHJvbCBjaGFyYWN0
ZXIgc2VudCIpDQogwqDCoMKgwqDCoMKgIHByaW50KCJbaV0gU3RhcnRpbmciKQ0KIMKgwqDC
oMKgwqDCoCB0cnk6DQogwqDCoMKgwqDCoMKgwqDCoMKgwqAgaSA9IDANCiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB3aGlsZSBUcnVlOiAjIExvb3AgdW50aWwgaXQgY3Jhc2hlcw0KIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaSArPSAxDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzLnNlbmQoYiJceDMwIikNCiDCoMKgwqDCoMKgwqAgZXhjZXB0Og0KIMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHByaW50KCJbK10gR05VIE5ldGNhdCBjcmFzaGVkIG9uIGl0ZXJh
dGlvbjogJWQiICUgaSkNCg0KDQpBbnkgc3VnZ2VzdGlvbj8NCg0KDQpSZWdhcmRzLA0KDQpK
aW5mZW5nDQoNCg==

