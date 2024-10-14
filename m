Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0595DCF259D
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 02:31:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45583.1728873093300298965
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 19:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00176287e7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E2VWo0003470;
	Mon, 14 Oct 2024 02:31:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 428hkyg9f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 02:31:32 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49E2VV15003462;
	Mon, 14 Oct 2024 02:31:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 428hkyg9f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 02:31:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcgXjJ0mtRfkfLSbSJ+R0aiQR0+zjhv3qEwypRQWhYUH6YM5usU9W+L7Hba4SjAThnG1zWDZAiiLQRcdGpI7z8qZFJVISlXpntwlTTWdlXTfd5p7KSLhu77k9ozcv4lpNog6HV8qqI2pD1qYxEFZ4sP9079QF1Riww8jmU2Cx+JsyaVYO40MbLDqaDf9uZV+ZuVDBkeLfEUQ4Dmj+loZmZa8GGBz5I5oqxyD24yast5ziRACy5CNufBz0QY+aN1DSPI6Ew2ySJov4/TbQ9vDFVy6m69ZpKw9yxyNXJ1U6VcYIiLFts4AnTHHW4w3tKT26oG9Q3EUqz3EeCTYSHWrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fz+l15EuzNx1Kmla6ijtP8nMHq4U535GhccVv2KcZAQ=;
 b=xhMVJKLijEu6QrmqQYI5l95NfzkbPBIpmzwzpL0iJQjSdp/Ab/K2xWTal8/bZfOUszzO7hARMRcCSswjUO2GZtflDejFgO4YEc9pcq6O0DR2h0WhCDHkjcgr3f4j94LMDxczAoSCfAseIeP+7ArCfF70rRM0lFhuxlRcWS6pxykLsXStVcy8lw0Gottvj7V/vZYNcoIyZHfzyqng1D0tJ8fyixbE7kOaMSSen2C1Tky8hjrHWOreRpWhlqcnxQaY+IV7lxLHBX1HxVS1LetMe5nH6eF3mTHYeha7snc5tI1mpWLeV1B46R4N1VSZQX6AmQy8RBHi/1/CMw2XqxG1BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Mon, 14 Oct
 2024 02:31:27 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 02:31:26 +0000
Message-ID: <5fa70fce-33a6-477d-a988-0e4063e5d0e1@windriver.com>
Date: Mon, 14 Oct 2024 10:31:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/3] tomlplusplus: Add ptest support
To: Khem Raj <raj.khem@gmail.com>, mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20241012100147.618578-1-mingli.yu@windriver.com>
 <20241012100147.618578-2-mingli.yu@windriver.com>
 <CAMKF1sp_GqfxcDnExPfi+sh6PuyrZoQpOrf48mYqfiC_sjr61Q@mail.gmail.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CAMKF1sp_GqfxcDnExPfi+sh6PuyrZoQpOrf48mYqfiC_sjr61Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To PH0PR11MB5014.namprd11.prod.outlook.com
 (2603:10b6:510:31::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: b42ff0bb-933b-4a43-bc08-08dcebf84c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T1BndTBZOGl3N1h6VHVqTGRIeHNvR09PQnZWRmMxMWJUdHoyanhXRjNiNzNz?=
 =?utf-8?B?OGRDWUVyYlRzdE05T2k3VmJmakRLVUlFODdGeG1qOVN3WHNnWkw1YXh4UGVO?=
 =?utf-8?B?OWFJMkE0S2ZVeWVnWFVRbCtPcWxTbzQ3UDFlUFU5am5aSWthNkFxN0VIUUFu?=
 =?utf-8?B?KzV3M1NDR1R5R3FTS0JoN1l2MmJEaGt4dzJBa05CSEhxV1BVSncvblVYNmIr?=
 =?utf-8?B?ZytsZjNoSjNLdk1CSTdrVzkrSVVsU0pBQ01RMGF2bng2YjE5UUEySExyKzlw?=
 =?utf-8?B?Mk40VXY2NkhOT0pROUYxT0x2Q3NHNk04aE40bS94Z2ZBN0lvQmMzbTFIRTZC?=
 =?utf-8?B?MnBwSUxSdlgxUWVOUjhCaGk1T1R2WVdCWjl3clUrekQwYzZaWVEzNjM4bU0r?=
 =?utf-8?B?ajFTZlVyT1pwV1hjQ2tydSsvRDdSNklyRjl2cVNxcGI5VUw1MlVTNDJrdlhI?=
 =?utf-8?B?TGFDZ2FDSVRETWEzOVJrM0lSUldVc28xeS9xZEw0eitid2UzK283VUZBdDZV?=
 =?utf-8?B?a1M0eTBWUlY5VU5JZkJTVUhFdTFxVXgwUDhVNDIycExQUzI4aVd5SDhyOVZO?=
 =?utf-8?B?bUZWMDdVa0RQd1Z4dStSZGQ1YjY3NURqU3hpZ252YXFtNDdxVU50VUxETktJ?=
 =?utf-8?B?US9jNWRwN0JKUVBrWEpHN0o4Z3pXeUc0U0lsZkJ0M0tlbE1DajdUWVlqQU9y?=
 =?utf-8?B?cEJOWDg0dVJkVUNZWUxNb1VHK2liVE9kdEdzamcwTzd4YVd2eHBhYVpjdENq?=
 =?utf-8?B?Y1RPTW05VFhiOXVab0VMNlhQZ05kRkhSWVUwR2J6TlVXWWhiSGZOS3orRW5o?=
 =?utf-8?B?WW15SVc4d2ZXVStSajB2dFZJNDRIMDdCcGZZY3ZlTEZ2ZGREUWdScVZEcXVV?=
 =?utf-8?B?RkxNZGNVbWZVK3dDV2pOdDFTTy96UVpjeHAwcGRyVC9OL0ZRdHArM3kyMCtt?=
 =?utf-8?B?Sjg2amVYYXllcFhLdkkwOUpQZSt3MmMvVlFGWTZyNjZtd3k2NS9zMjlFcEFm?=
 =?utf-8?B?a0doZnpmYjUxUjlxbFJvYVNvenRoTmExQUJ1WjdCMkF3ZkJXUDBMUTFxamEy?=
 =?utf-8?B?Ymhrd0d5aXR6Z1EzUHR5SVg2Uy9UT2d1aVhWRWhybUtBb0VjaDBoTE1XajJh?=
 =?utf-8?B?ZGk1YWswNjlKbVViTnRUa2MyRFlOK1l4eGtzeTdJajFtNGJJRElsMnd5N2pw?=
 =?utf-8?B?bTlCb3FMMnkyRlJTV0k0YVNPRWlyWjV3SHdYOHVQTkphK0U5QXFEQ0lLV2VR?=
 =?utf-8?B?NnFaRmZxQ21rMzhpYnd3bThsd0VQK0dkM1RueWJ4ZmlhZGEzM2ZEbWxXcnhW?=
 =?utf-8?B?STk5bDFqUGplTzlPN0NSSlMzN3RYU2dFMGRFTDNBVU8xR1hnWC9DUkc1WG1a?=
 =?utf-8?B?aUtpWkxrUjNzaG14a2JCcVRyR3k0SDJXU2gyMDBUalZOUUZ4NUpBVVpyVFZC?=
 =?utf-8?B?eHhhM0V3K3R4cTRqZjRiUVVNTERTeGJ0anpUZWlrVzBrQm4wMFRVOWpBaENp?=
 =?utf-8?B?ZENORUlaSC9lOVlKckJGVzRDMUh6dlZIakgyMGkyRnhTQnEvSHVlcVNicjZm?=
 =?utf-8?B?ZGJRTnY1dWlIV00yNVJKOHc2ZGxpWGlyK1hlK2VSdVhkL3MzVC82Nk9Idy9T?=
 =?utf-8?Q?+hVaEx4m+3GE4Szry/cMdMBGH0oKrRBy0S5ZnDgvemFY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OE9JYS9SZFZic3ZKU2dIRHdET2NYZGlQRVhNMkE4T1ViMW42K2VBbkRKOVdY?=
 =?utf-8?B?ZmFkUi9rTjFhQm9OeFk5TjdUSlRZZ0QxaTBydHpnQ2xYMmZqYmZQODQyYnY1?=
 =?utf-8?B?S0dIaGR2YTYrRkRkdXMvdENBNHZVQWljWFZOcVA4emVKM0RsbHlDNUt4WWdz?=
 =?utf-8?B?dTN1SmdMWjhiUkVFaGlzUFVndUkxb0pUNi9mTmg1djdESkgrTDNpQTFqTUFl?=
 =?utf-8?B?M3J4eEkycmVqNklBUUxFQlB2dHAzNjRzR3d3Nis3N2c5SFl3SXd6TTd2YkZ3?=
 =?utf-8?B?bmZ3MzFzVm01K1hvbVlXS3M0NStHTW51UVEvaXhGa2kzbmlBMXY0MWoxa0RT?=
 =?utf-8?B?c2w3NTRyYzYvd3FNN3ZhdlQxdEp0bnFmK3RRY1NmQ3J0L29NaEVjSnRuZ2Fx?=
 =?utf-8?B?WkVjK3J2bC96UlZVQkFCSUJLQVZ4RjVuWEZsRDRvZ2w2UlpEZnhkMjNSQWFO?=
 =?utf-8?B?QW00d1hSRkRaNGNTWk9ZajhVZHhhN2dycCtQeTkzNUxUTnU4Mi9hdjRYK3VJ?=
 =?utf-8?B?Z2xKTTduYXlGbHNaZG9mOGgyMUQ4Unh5aVYvM2lsZzhUS3puMG9halMvKzRK?=
 =?utf-8?B?VDlaSDBmMU1LT0ZIVkJTT3VSSUlFT0ErUFYyeHk5L1ZUZ1FJZSsrLzNiTy9k?=
 =?utf-8?B?MUcrQWt4eHNXMHlvN3NIb0J0YmxnMzlSd1dNclZXVEYxRnhiakxEVFhKS3dI?=
 =?utf-8?B?aFBhSG5oRVZTVTJWb0d1c0NQM2dRbFVqblNUMENjbE9mYTRWNm81L1U4UlpQ?=
 =?utf-8?B?RlE3NHJYTyt3VndwdUhuYmo3bXJDcWdqWkhac1Zta0dWZFBDL0JuQWlVcTRJ?=
 =?utf-8?B?ZFgxeWNldFUrUW43Wk5IY1JvZW9USEdrK2k0QmVBNlB1emx2cllSMmpBaVhW?=
 =?utf-8?B?eWdJM09vK3UyTDIyUXM2RU4wU3ZZTG93R283WHM5Mm1TVFdrMXV0TGFvdkdU?=
 =?utf-8?B?VC9IWGFhbUw0Wk9Ia3d6bFRLbmRrQW9SZFBLQzRkMmVVdC8vem1URkRJb1Jq?=
 =?utf-8?B?VUFRekhzOXJYVVRJS2N6ZWlrL0xsYno1UElSK2xOeFY4NmtRVHc1WG8ramhz?=
 =?utf-8?B?YlpKMXZWRFJETENOczgyZ3I4KytlcExPck8veUlHZ1Y2UlNJTWRyZzFSUTdp?=
 =?utf-8?B?R0VpaC9kWTlWRC9HUDVqWk1GRFJRTWZiUTRIQnM5T2FkcXFiRkJiOHNSZS9q?=
 =?utf-8?B?UXRGRHNOb3lGT2ZaZG03SkJNMEZIc2h2cEZFdUNCeWhBQ3NZTjJwNDVubFV2?=
 =?utf-8?B?cDhBeitZZDk1RUVONklHYjVrUDZIWkphTlRDZXFPMWNRUTV0SElrazZtWDM1?=
 =?utf-8?B?bDVtOXNqS2hhYmppem9RUlBCMWUwNzFiL3VIV0Q4N2p3ZmNJNUVlRVM4azhi?=
 =?utf-8?B?WDhyTlBwSGJhMnJxdlRlb25jWmhGYUhySnNNaThsK2pKYU1kanRHS3hGZHIr?=
 =?utf-8?B?WFpjRTFEcERmdVc4ZEpmSkJrMzRUMTdMWUJncTJKMXowaUxvMGhYQmlmOCs2?=
 =?utf-8?B?WjZScy9lTzV6dHcveExKL29XWW5VYWY4cHl1SzkxOXc2dmxaanBrOU9DZVlD?=
 =?utf-8?B?amkxcnE3dzN0OTk0OEJLTngxMFJJUFh5K3pobXdNNmRaeWROY1YrQ3RaOWtl?=
 =?utf-8?B?V2ZNQkxSYkU4SU9OemdlL1ZpcUZGMGZGbEM2RXhXT1dLeS9ublJ4REczc05z?=
 =?utf-8?B?d3R5NndtenNVT2dOZk5LMHRaYXhOMUQyWHdzZnI2UGZwbEl5d0lYZVNKU2pP?=
 =?utf-8?B?aGJSMFVROWdlTThFS1UwWWFFQ1pGWjcrM09pei9DOGw0bzBRQXhqdno4NGZR?=
 =?utf-8?B?RE8xYUxEdHhHZ2xrT0VXMjlrSEJJY2Q5ZFNaWjJZeVRwdkJ6TlpzbWsvLzlO?=
 =?utf-8?B?ZTZwTGlzS0ZoNWVQdFJPeXIreU5HWUczVk9xNVd6K010cGFzY1R2bnFXUkFu?=
 =?utf-8?B?SjVGUHVtNEVYd1hzSm9JendNcDdOcmFiV3l4dzR2OWZJUnVObmdsU0g2bVVJ?=
 =?utf-8?B?bWF3M2JOS3ZGaEs4a0l2aHFJMHhIalIwZDJLQ3RPTGpWVWEyTVMzNVU0WVI3?=
 =?utf-8?B?UTAya2tSS0RQQ2t4MUZqTmc3RGVSdTdGU25JSDBhZEdDU2JER0xYKzdocnUz?=
 =?utf-8?Q?BD0MCPDGgLJyDU2oD+BQgMLCK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42ff0bb-933b-4a43-bc08-08dcebf84c8d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 02:31:26.7328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OSgyUn1Y7mjM2bxuX8NsdQ2IDeNm+gPlK7s2tugQBCre38ieRKkNYveAU/DS6yat2L4XM+cMmJ8inSPXyykJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
X-Proofpoint-GUID: M-eZC76OR9lJajbKwktdiLJvEC13qijq
X-Authority-Analysis: v=2.4 cv=e59USrp/ c=1 sm=1 tr=0 ts=670c8284 cx=c_pps a=AHWEOuZXH7ukEk4XErmcRg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=l1-WZR0qAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=EbGhiMRmCDyEETos5K0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Qm0ypj1B_joA:10 a=J0NmAbttn3WFok5z7_lE:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BMmhUcyecNhxVVXi9cOJ1prZcw5llhBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410140017
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49E2VWo0003470
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 02:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112844

Hi Khem,

On 10/14/24 00:18, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> ptests seems to be failing for qemux86-64 -  https://snips.sh/f/PWrmTR3=
-bm

I didn't reproduce the issue locally as below:

root@qemux86-64:/usr/lib64/tomlplusplus/ptest# ./run-ptest
PASS: tomlplusplus_odr_test
PASS: tomlplusplus_tests

Anyway, I will look into this then.

Thanks,

>=20
> bitbake meta-oe-image-ptest-tomlplusplus
> bitbake meta-oe-image-ptest-tomlplusplus -ctestimage
>=20
> On Sat, Oct 12, 2024 at 3:01=E2=80=AFAM Yu, Mingli via lists.openembedd=
ed.org
> <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>>   # ./run-ptest
>> PASS: tomlplusplus_odr_test
>> PASS: tomlplusplus_tests
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../recipes-devtools/tomlplusplus/files/run-ptest | 12 ++++++++++++
>>   .../tomlplusplus/tomlplusplus_git.bb              | 15 +++++++++++++=
--
>>   2 files changed, 25 insertions(+), 2 deletions(-)
>>   create mode 100755 meta-oe/recipes-devtools/tomlplusplus/files/run-p=
test
>>
>> diff --git a/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest b/m=
eta-oe/recipes-devtools/tomlplusplus/files/run-ptest
>> new file mode 100755
>> index 000000000..4f682c5eb
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
>> @@ -0,0 +1,12 @@
>> +#!/bin/sh
>> +
>> +cd tests
>> +for atest in tomlplusplus_* ; do
>> +    rm -rf tests.log
>> +    ./${atest} > tests.log 2>&1
>> +    if [ $? =3D 0 ] ; then
>> +        echo "PASS: ${atest}"
>> +    else
>> +        echo "FAIL: ${atest}"
>> +    fi
>> +done
>> diff --git a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb=
 b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>> index 0e8202bdc..245c309a2 100644
>> --- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>> +++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
>> @@ -3,7 +3,9 @@ HOMEPAGE =3D "https://github.com/marzer/tomlplusplus"
>>   LICENSE =3D "MIT"
>>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D90960f22c10049c117d56ed2e=
e5ee167"
>>
>> -SRC_URI =3D "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttp=
s;branch=3Dmaster"
>> +SRC_URI =3D "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttp=
s;branch=3Dmaster \
>> +           file://run-ptest \
>> +"
>>
>>   PV =3D "3.4.0"
>>   SRCREV =3D "30172438cee64926dc41fdd9c11fb3ba5b2ba9de"
>> @@ -11,4 +13,13 @@ S =3D "${WORKDIR}/git"
>>
>>   DEPENDS =3D "cmake-native"
>>
>> -inherit meson
>> +inherit meson ptest
>> +
>> +EXTRA_OEMESON +=3D "-Dbuild_tests=3D${@bb.utils.contains("DISTRO_FEAT=
URES", "ptest", "true", "false", d)} \
>> +"
>> +
>> +do_install_ptest () {
>> +    install -d ${D}${PTEST_PATH}/tests
>> +    cp ${B}/tests/tomlplusplus_odr_test ${D}${PTEST_PATH}/tests
>> +    cp ${B}/tests/tomlplusplus_tests ${D}${PTEST_PATH}/tests
>> +}
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#112828): https://lists.openembedded.org/g/openembe=
dded-devel/message/112828
>> Mute This Topic: https://lists.openembedded.org/mt/108964413/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

