Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329EAC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 21:10:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.57774.1723497022032605281
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 14:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8954c110e7=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CHekQG001818
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 21:10:21 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40wy6528uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 21:10:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVq9q2hN67fB8byfuZHKz5uHwrXeKjd7MJES+Ht20vODuNJ2p1I0sozqyYTKYV33iyur2oRFNBNkAZFsxGWx75MbgycUjnyGf2yGRBSBRw6DJHUuYOG7+lwvt6Wcpa0LLgfUt6cVTWHnanb+RYHrcTPHUL6POGjZVAMTWsPR8aBT3LGsE4r0eMLktpddpc/z/lpM4Bga1DaV7Ql65fISjIcjGkyBt/uCsjIk62xESHm2XuglDIdBER3eag6knLKjDSJIwTXzEEye34aaggXcELv2Z00JKqyLh9OnrL+ZRgPElAmd7d+ETgh/8I2KkAbsGS8FlycwozDNVGXS6ySEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MC3eaNYZYDz8DoKGrQpvkkprMJqb2Bh3/wvCenOBV3o=;
 b=OgbwA9Wtpv65WKrukJ5841RFZXI2QMWxJedoYwRzJ8pBImJZ+rcz/vZgc5OUkMFOD7fjVDZcyT42GySl2N4dW2krb+xX16KqMH+4PJd5HPcCKOaozX/5MVt7Bjp6mZCG0eDyxSuWgdj5eX6hPlKdW6QCVTciQFwxxpl39GMd1ISpRZzo+AFMAnj7Z8N9ZHS7dDb4i3lnujnizjM/JlQJTyvDnqdO5jreVuijkcJ/v0WJA/Ot73MKtkiYuG3OTnYJcB8rJ5FGdSCC+tOQOWvB21jjhUTnkr46HgDBqjk7cFud8yQKU4ybYgPnXG+Yla2w4I8H1aqBfVeWlVoXqysMtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM4PR11MB5312.namprd11.prod.outlook.com (2603:10b6:5:393::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Mon, 12 Aug
 2024 21:10:15 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 21:10:15 +0000
Content-Type: multipart/alternative;
 boundary="------------WFrERjyigIxUeJF2YRiqL07C"
Message-ID: <d9727b04-11aa-40db-91ae-e5f387fe30ee@windriver.com>
Date: Mon, 12 Aug 2024 17:10:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] liblinebreak: remove obsolete library
To: openembedded-devel@lists.openembedded.org
References: <17EB126C55268C5F.10903@lists.openembedded.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <17EB126C55268C5F.10903@lists.openembedded.org>
X-ClientProxiedBy: YQBPR0101CA0209.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::9) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM4PR11MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: a4aa0929-a916-4d3d-ea00-08dcbb132925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bE1zaGFzeGZhVjZpd2hyS3dCUXVtcUJ5QzRUZXFhTElRWDVsRWphTTdtYjNV?=
 =?utf-8?B?Q3VIdDhMVXZqUHNSZXptaWJCUlg5TGpCd2hjV2c4YXBUS1F6aG9zV3hDTHBr?=
 =?utf-8?B?WlZKb3BsdXpURGlGQ0oxNVBKbDhYdFNkdnFseTYyMnhhWHBHS1pXb0pNMVdl?=
 =?utf-8?B?OElIVnFQcHhwNHVyM1JBeGRzK1h2OUZEc1lNVzdacTh1V2ppYnl3cS8yR2hy?=
 =?utf-8?B?UEZodEpFREg2ZkEzQ053SjVjVlVSbHVHSWp5bW9pRE5HZ2FyanRrR0x4aDFX?=
 =?utf-8?B?SG80WHg4UlZVSURJSWo1RENqSXJjTW4xZ3hlVGhLOE1tMGQ3YXFZcngzanJj?=
 =?utf-8?B?amJtaktsc1NYdVNHRnR3NGxUQi9RRm1sL1RZU1E1OW9ISVA4RytoVnQyTnBm?=
 =?utf-8?B?Sk10L2xTL3FoSWl6Yml5Z1BRbVpwMHpVVFE2bndTQ0hqSjcvbHZnb1A3Unl6?=
 =?utf-8?B?SEJTelRKZGoxU3I5UVJUamZhUFdwUnBqVFZONDFjeTUzQkx3NWlFVzZ3UG1H?=
 =?utf-8?B?MjUvZ0FuZ210aHZhSzVyQzFFMExaamhqclQ4ajNmVC95VUhIMVhIMzBEYUMv?=
 =?utf-8?B?WmNCUlJUUGlHdXUwZ003endZS3BheTJXWnZ3NHdqN2pJQ1V1d2tZUDJEUlRO?=
 =?utf-8?B?bjdBVEprRE5kN29wOURaMWV3bGJlbjRIL3hCaWZ0dlc5a3JORUFKT052NDR3?=
 =?utf-8?B?VHFiSlIvcVV6dUh4K29pUnRaRnpMcnQycXlxbUFYallKdDZ5b0E4UWZTRnI5?=
 =?utf-8?B?WDkxMVFuTmZ5ZFNFTkxtUENNaDNRbGR1R0hyZ0VOYk9id3plVkR5VjJmVFNL?=
 =?utf-8?B?enlLa0N6Q0htKzVLUitWMWRvdmJZSXpNdXVUd3I3REtJSW8vQ3BYZzljbXBM?=
 =?utf-8?B?dWltY2RnbEkzV0VjeS9xZW9rMGZRdDdTU21ORTdTeHV1OUV3bDhUd3RSbTEv?=
 =?utf-8?B?TkxsREZmMG84ckp3N0ZIQ051NGpRZ3c3QW9Va291WVdia2RzNFdHQXgySXRq?=
 =?utf-8?B?d0Q5dFcxUU1xUjRSdU94SGw1Yk1CMWpHT1JKazVyV2IwZkxpSUdyRC9rREtT?=
 =?utf-8?B?cmhVdDVjTG02UEo4WEhzL3ZDVEdEeW1ScUZaOWNyWlFteXF3a0x1N3pBZHhV?=
 =?utf-8?B?VlRpRFhrNFF3dFcrN3pFNFgwR1U0RGFjQ2QvOEhOSEJSeEZNM2c4Ry9UNFJO?=
 =?utf-8?B?TitUaklDcjdEQW1Na3VRRjlIdEl0MW5uRXNOUXlYT2N2QzA2aFFKSFI1b3hZ?=
 =?utf-8?B?U1VKc1gzQ1FDKy82MDdYcDArem14M01aWUVzTjJnODZQVE0wVUpDN3RRUXZx?=
 =?utf-8?B?dGNCVjVCVEtveUl6MVk4MzA3TFlUMkI2cnJDM2luQVlucFpFSXQxLzBjdEM3?=
 =?utf-8?B?RUtQcTVMVGVBcGVxa2RMSEowdGdZTitJb3pSODRrQk11NWpLcmtXWkxBZmZE?=
 =?utf-8?B?dzBoSnNsVzUwUHZCQ0xxelpzM3czMGNZNDFKTFlvNDlWOFBrRDQ3RXR6c2Qw?=
 =?utf-8?B?TnhlQXpyT0dZcGdhSGRuejlUcTdLUHVTbXJBRENvNWkvRkUrckhjK2Zzcmxy?=
 =?utf-8?B?U1NURFpUeVpoaW1TN0s4Q2tTTFlMSXFkb3c2NnR0WklUTE1sajhJZWoxYVlG?=
 =?utf-8?B?bTZPZGh1SjJ0SUloTEhBakM3SEVuSG1BTzFwbHZyU3JWbjhjUGJrMktzS3BT?=
 =?utf-8?B?UzIweGxKM2hTUzBSRHdxYWVTU0MyY1FZRmZaOTBuRTl2bVREcFdpZmdMVEI4?=
 =?utf-8?Q?hnMh93/a4RgCWkExaUtv/jU/VcxQiuzF/K0EQ+5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWRqdW5CZFg3VlRzeDlYVC85eVRqSW5IM0tQV1llRm43OTBUN05JMzVYL2Rk?=
 =?utf-8?B?K2FSZ3pjeHFRRUhYUHBBTzdOSFNQdWhDekY0SUorVUJEQ1J5U0VqaGdHeEFj?=
 =?utf-8?B?Q21RYVNIS2FTTWFCdjJWMWVOYUtNZUtCVzBIRGUxQ3hWNUx2RUdGRzVEMmg4?=
 =?utf-8?B?Zk53OWlrVkM2bzlwemRUdjJ1bFV3V0R4ZW9Bb1dtanNCYzg5RGdsYkNYeHhL?=
 =?utf-8?B?c1pHd3IveXlTQ0xvTWI2MVVZRWliU2dpTE5LaldSYjRXNENUVm5PS0VySDc2?=
 =?utf-8?B?OUUzZFJpWUZFR0NCR1dqMDdreXJMejlCT3dLQ0dJS3lkN3ZlOVZudTZUOWVr?=
 =?utf-8?B?empoSmxTRGtBVTB2R0Zvc2F0azlxRkk2TDF6WGNRVy9xSXc2MFpWQ2NySk9l?=
 =?utf-8?B?OG54bmlIQkg3UEoyVjYzTE9ZdTMvOU9PckVVNFNGQzdoTmZNTXRyWDljMFBs?=
 =?utf-8?B?MFJpb2pvRnlPNHlpN3R4RUFvTklzVWhLSi93bFFjeS9ydWFqRzVDbHFMQVNk?=
 =?utf-8?B?d0MrdTdXVy9hQmR6bklxVVNqZk1TUFNQODdMcmVZU2NHUVBWTHkvU203a2VY?=
 =?utf-8?B?bmgyb1RaSGE2bWNuWW5LNXBmeTVkaGViVzNIc0JWVCtBSi9NVVBMMUdKdUtU?=
 =?utf-8?B?ODdtd3pKbTZ1ZU9qZVBPTGJpRSsvMHQ0cVVzRzJwTzllbWpGVDNDdiszT2RW?=
 =?utf-8?B?VW9aWjA5bnhsTkNsd3ZJdEthb2pZcFpkTjB2TGNWVnVRMmNuNDdUS2IxOUxW?=
 =?utf-8?B?SjBJRXppbjkxSDFwMmZ0MmdGUkNSOUo4amxHdktQemNxNXFraXczRTIvQ2dP?=
 =?utf-8?B?bzNFeVZXUktVZjNjbmNheVhxZzZES2p0R1JNNEZrWWFXK3lrVmQwUDJMUmZa?=
 =?utf-8?B?Sy8ySnRVcEZISTIxenc4UEN6UzFMbVpPUWZYdFJwNGtNWVdUcTNlNUx0cUdE?=
 =?utf-8?B?NnRSNU9xekhHT1IxdXVkeXBpSFNlRllxOWpRWVBzSFRtNWFvaEYydk03YkZz?=
 =?utf-8?B?MmFlMTgwdk5VZHp2VkJCMVJ1VE9lZisxdDdkQThlaEMyQ294dnVrdDFwY3g0?=
 =?utf-8?B?UDlIYm84S1o1UlREbmhBSkxBZzFhSGFzSlFQZ1FISWtORGV1V0wwcTZHcW1C?=
 =?utf-8?B?OUVtM2ZSTnhxMk9WQzZRcmhJbU1lQWMwVFBHMnM4UkhqbmF1UG83NXYyaVdH?=
 =?utf-8?B?bmdkaUJoZlZWMFJxQUdjTzJrSXZzdEplU1kvZGYxZWFxOUo0R2pQTDFoWFAz?=
 =?utf-8?B?U2FpZkM4TkpaK21Ia01rWkNmY2V0c2ZTeUlnWjhFQVFLVGloUVRQY2Q3Z1M4?=
 =?utf-8?B?b3MxNzFKQXNuZjM5aVowaE1pVUFFUm0wRjdIa0V1YWdVYml2WnRnaXBuNWZq?=
 =?utf-8?B?TUNKT0ZKUnlBUWFaRGpVV2t6WmlHSDBWQ3Jka0lNY2Q0dWVUNktqVW5WSDVX?=
 =?utf-8?B?LytTTDV0SEJ1cjl0OFpzQUVRL0g0WEJmazJRYlJQZHhOL1A5V0cwUkJlOHgx?=
 =?utf-8?B?c2gxaXlaTmpyRHh3R0NEUWR0SlJRcTZDaUdlWkIwTEtOWjBBWkg3R1pOV3A2?=
 =?utf-8?B?aVVxeU5xVmxhS1BKYi9oQU5BU1NRYzFZaENkU0thV0ltUHhhSWt6TzRva1JL?=
 =?utf-8?B?S00wQyszSTlqTUlTTWxDUVhyTkUwNkx2YU1NT28zeDhvMGw2NWEvODhLcnFV?=
 =?utf-8?B?Ymw4Q09EOXBzcWVPSTZoY3l0NVhoUWlDTEFtalZ6NERTNEhVaXBIbGs4V3Y2?=
 =?utf-8?B?ZUVJTE5USlgrekVXV0JPRjBNcGZKbzJzK3Z6bGFaUXBpVTd6L0ovMEJvUGh5?=
 =?utf-8?B?L1JRSTZjaGNLeUlmbjFBTU5Gd1YrQ0ZaYldKRTNjK1lob2d6TmNiMUFXQkVk?=
 =?utf-8?B?a3JKMnpIQXZWcER4NGNnZm4zbEV3R2hEVUZYYXdxRjViRWswNTlBMHdwYm12?=
 =?utf-8?B?SmM1TVc5bE5UeXFXSnF1bStQSHJKSE9PU09XaUw5eEo3Y0NLN1FvK1dqcFp2?=
 =?utf-8?B?d2JTSFRxcHJPSlF3ZnJ4TDJoejJlZThhQXFyNlY5VmgrZDRGVVZaMGdzbG0y?=
 =?utf-8?B?bGtaRldYSzZLN0JTeG44ZjhkWnFlUEhlM2J5STFpanFPb0dqZUF0SEQ0U1pJ?=
 =?utf-8?B?ZHdJY01UVmF3enNrV2VIVitqdkFJK3JzMzEyZnhvbHNNeWNaSE5hQU11bkxO?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4aa0929-a916-4d3d-ea00-08dcbb132925
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 21:10:14.9867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7Hmd7ylwHoxxyVGGA+Kp5yaZC+7UJ/nPR02/jeuTxAJKStDVVP9Ka2Z3wBv+gZY1y6srH4h1A6POR4zmCqvBcRT8N9N/tz+lYqLPRi3zVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5312
X-Proofpoint-ORIG-GUID: FhiZOfa0feReWIW8zIUoIQtbtJlMeeyi
X-Proofpoint-GUID: FhiZOfa0feReWIW8zIUoIQtbtJlMeeyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408120156
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 21:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111781

--------------WFrERjyigIxUeJF2YRiqL07C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-08-12 3:38 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> liblinebreak has no users in meta-oe or in the layer index:
>     https://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Aliblinebreak
> so remove it.
>
> The upstream is has not been maintained for some time:
>     https://vimgadgets.sourceforge.net/liblinebreak/
> and they say that liblinebreak has been superceded by libunibreak,
> an equivalent library that works in more languages:
>     https://vimgadgets.sourceforge.net/libunibreak/
>
> Since there are no users of liblinebreak, libunibreak was not packaged.
>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-oe.bb          |  1 -
>   .../liblinebreak/liblinebreak_1.2.bb               | 14 --------------

Oops, I forgot to update. Drop this, v2 coming.

../Randy

>   2 files changed, 15 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index e11afcd4e..f9b3e742a 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -816,7 +816,6 @@ RDEPENDS:packagegroup-meta-oe-support ="\
>       lockdev \
>       logwarn \
>       libjs-sizzle \
> -    liblinebreak \
>       mailcap \
>       liboauth \
>       mg \
> diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
> deleted file mode 100644
> index 539b58bc5..000000000
> --- a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION = "Liblinebreak is an implementation of the line breaking algorithm as described in Unicode 5.1.0 Standard Annex 14, Revision 22"
> -HOMEPAGE ="http://vimgadgets.sourceforge.net/liblinebreak/"
> -SECTION = "libs"
> -LICENSE = "Zlib"
> -LIC_FILES_CHKSUM ="file://LICENCE;md5=3715191da62bafb5cfc4ff36195b2ec3"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}/liblinebreak-${PV}.tar.gz"
> -SRC_URI[md5sum] = "d18039259001ccb24b5dd4648c49c5ad"
> -SRC_URI[sha256sum] = "9efcb0cb1afc75ad1e92d2b2dbf4d9c77b072d6656c5f1a150af8b718d0c7b76"
> -
> -UPSTREAM_CHECK_URI ="https://sourceforge.net/projects/vimgadgets/files/liblinebreak/"
> -UPSTREAM_CHECK_REGEX = "${BPN}/(?P<pver>\d+(\.\d+)+)"
> -
> -inherit autotools
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111776):https://lists.openembedded.org/g/openembedded-devel/message/111776
> Mute This Topic:https://lists.openembedded.org/mt/107863665/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------WFrERjyigIxUeJF2YRiqL07C
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-08-12 3:38 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17EB126C55268C5F.10903@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

liblinebreak has no users in meta-oe or in the layer index:
   <a class="moz-txt-link-freetext" href="https://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Aliblinebreak">https://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Aliblinebreak</a>
so remove it.

The upstream is has not been maintained for some time:
   <a class="moz-txt-link-freetext" href="https://vimgadgets.sourceforge.net/liblinebreak/">https://vimgadgets.sourceforge.net/liblinebreak/</a>
and they say that liblinebreak has been superceded by libunibreak,
an equivalent library that works in more languages:
   <a class="moz-txt-link-freetext" href="https://vimgadgets.sourceforge.net/libunibreak/">https://vimgadgets.sourceforge.net/libunibreak/</a>

Since there are no users of liblinebreak, libunibreak was not packaged.

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 .../packagegroups/packagegroup-meta-oe.bb          |  1 -
 .../liblinebreak/liblinebreak_1.2.bb               | 14 --------------</pre>
    </blockquote>
    <p>Oops, I forgot to update. Drop this, v2 coming.</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:17EB126C55268C5F.10903@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">
 2 files changed, 15 deletions(-)
 delete mode 100644 meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e11afcd4e..f9b3e742a 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -816,7 +816,6 @@ RDEPENDS:packagegroup-meta-oe-support =&quot;\
     lockdev \
     logwarn \
     libjs-sizzle \
-    liblinebreak \
     mailcap \
     liboauth \
     mg \
diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
deleted file mode 100644
index 539b58bc5..000000000
--- a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = &quot;Liblinebreak is an implementation of the line breaking algorithm as described in Unicode 5.1.0 Standard Annex 14, Revision 22&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://vimgadgets.sourceforge.net/liblinebreak/">&quot;http://vimgadgets.sourceforge.net/liblinebreak/&quot;</a>
-SECTION = &quot;libs&quot;
-LICENSE = &quot;Zlib&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=3715191da62bafb5cfc4ff36195b2ec3">&quot;file://LICENCE;md5=3715191da62bafb5cfc4ff36195b2ec3&quot;</a>
-
-SRC_URI = &quot;${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}/liblinebreak-${PV}.tar.gz&quot;
-SRC_URI[md5sum] = &quot;d18039259001ccb24b5dd4648c49c5ad&quot;
-SRC_URI[sha256sum] = &quot;9efcb0cb1afc75ad1e92d2b2dbf4d9c77b072d6656c5f1a150af8b718d0c7b76&quot;
-
-UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://sourceforge.net/projects/vimgadgets/files/liblinebreak/">&quot;https://sourceforge.net/projects/vimgadgets/files/liblinebreak/&quot;</a>
-UPSTREAM_CHECK_REGEX = &quot;${BPN}/(?P&lt;pver&gt;\d+(\.\d+)+)&quot;
-
-inherit autotools
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#111776): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/111776">https://lists.openembedded.org/g/openembedded-devel/message/111776</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/107863665/3616765">https://lists.openembedded.org/mt/107863665/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------WFrERjyigIxUeJF2YRiqL07C--

