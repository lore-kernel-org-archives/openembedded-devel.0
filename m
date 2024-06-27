Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4512C3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 15:23:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10712.1719501792990055515
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 08:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6908b1d4a2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R4emlR021673
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 08:23:12 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fvv93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 08:23:12 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45RFKiCn012493
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 08:23:11 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fvv92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 08:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTAksAt42artpaGqsvTnY1hSD728IJKLRkDOOZtZR/iZizAckBGeADA1TJm2OOE6zNo91up3hsTj/Ugj7lr78QmpirgTK4CdQ5qR/SIA+gH+yMFd+U0xSlqD2Q98s+7g7X9tzGeLtymsA6ssd7KdspGU5YSduxCheJSi4N/txqu7Ng73qaFlfrLImhjA38x5q/nCKUigpSzAhprUPN7dxIVltcogQqGSNj3q/q6uNVB5fW14BRbb1GsiEGQIfJkrIChxwrB3IDptSAyZxYZON3tEl0ZvA9OiB50zuzP+GLCiaosYgUM3oepplqNeS5Xzefy4qZaN2vdyFp4A5ExFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upnqNDClvMW6hM/YxVOT/vF9uF9tIP6litXFi3Hx3jQ=;
 b=GQd6obCuXOy0zV6Sta/cWBFkeBIifhIuRmVba6IxRJNryjevMfqoAGwD8l+HZujP3NFqg5pEHVxw9S4LFhoO56JkDvX+yJxV3cQVyIiTmsWgzsG6Jdp+41NM6PVDyqeXUYmPyxY38LUWbOBhUR3NyMlLIJSWJlcv9XcEvRELBG+iDNPcIsR7sk4NGFEOGzeh/WlcyrSP1jZawd26L8L59dqhBe90ZAwhyuyUdhWRHm7Ryv4OgqZSNiiKeKYTq9AegGd0bvYMgeL/QH/FPA9gfu9dr4b77UROpr4BMB4aVt8MfwdcNuIvDYPnvEZ/DZfTWSOqvxG556A7lWAq97PQhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Thu, 27 Jun
 2024 15:23:06 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 15:23:06 +0000
Content-Type: multipart/alternative;
 boundary="------------05ruL82IYirgO9yyz0D02Zxc"
Message-ID: <8aa2a066-1c00-44a9-bb54-f2fa89f87e49@windriver.com>
Date: Thu, 27 Jun 2024 11:23:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: AW: [oe] [meta-oe][PATCH] libee: remove recipe since libee is
 obsolete -- join the layer clean-up?
To: "Jonas Mark (BT-FS/ENG1-GRB)" <Mark.Jonas@de.bosch.com>,
        Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
        "Simoes Ricardo (BT-FS/ENG1.1-Ovr)" <Ricardo.Simoes@pt.bosch.com>
References: <20240625162048.666209-1-Randy.MacLeod@windriver.com>
 <CAMKF1sqreoZ4rtcSL0ODP2Hn4uXRs8gMzQsg8dkOeUJh=tMF+g@mail.gmail.com>
 <c2ed1746-11e0-41ff-be93-19f0b00ed1d2@windriver.com>
 <DU0PR10MB7076A24E8702AE99938CEA8AADD72@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <DU0PR10MB7076A24E8702AE99938CEA8AADD72@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
X-ClientProxiedBy: YT4PR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::17) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e392330-3bb6-45c4-a389-08dc96bd0b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MjhSVTVWUExIamtwZFFHbDhrOXRYNHoxY2I5c1dkeGZIcnQreVNTZk05VTdn?=
 =?utf-8?B?bldYaEg4YUNLdU9taFlzd1lQVVdUaVhFbTNHMWsvRmcrOEgvQURUSm9wak9P?=
 =?utf-8?B?V3N3dW9pR3VjbzFuQ1h2YlN2blBhOFQ3YnljUXM3SzVIWEhXVm0wVlM2YVVH?=
 =?utf-8?B?QmVPcFBhZnZ3SEh5SnIvdlRzdHUwbEdYc21mZ2VWUFVPam1lUUJoNkZMVHBB?=
 =?utf-8?B?Vm93K2tuc3RiVlVTRElaQnRoY0lIWUVQSkQvU05nV3l5R1MrSFZDV1BobGVo?=
 =?utf-8?B?QTBuVHJXTnl1aVBRa2hPMkF4bDJ6WnBzR1ByWHJSTlMxd1d2OXFPRFlBajZ4?=
 =?utf-8?B?RC9FVGIxeXJmdStqZnlOOU9mVTQwSzJ3Y1dsa29qbjViQWV2bzBZZkV1aXZC?=
 =?utf-8?B?SkpPcGNBSGhuL2JlSWx3bVNTVnZJMkNSdzBsTm1zQzArb2VCSkplZzhxQWJF?=
 =?utf-8?B?RitPalcvQzR5SFhSYzZGdlNvMy9UT1VJaTFpOG1lR0J3Q1Y1ek5EOC9zb3ZR?=
 =?utf-8?B?WFBTOXdYa2ZQeDVReUw4N2s0dS90TThJZGpkeVE4SWJWdHRDTzZ0RGlCdHhM?=
 =?utf-8?B?NVZqM3RRTE9NUTdKaGducnNQK1dOblZZemFwYkRwTGJNeWZIYWJ3YUV5WWkv?=
 =?utf-8?B?bit2cldpL0NqSElTTmpXNzJIWUdtQnpRWE1EWE9DSVVxSUhiUWx3MDMySVIy?=
 =?utf-8?B?MisySEduQ1c4aHRYVHBSTGM5Y3RiSFNxdXFuVHRHaFZ4UFpNcnhRUnIzUk5H?=
 =?utf-8?B?b2M2UmxxY3BrWUNOMDFuWDFEWXhSWlQ3NUJQUUUvTi9VdFRTMm1kVENTemE5?=
 =?utf-8?B?QWVPaUdMTUxhaVZqTWJPVUFoWVBFV0ZiNEw4Y3ExUEVVcE5ZRCtCbHA3RHRS?=
 =?utf-8?B?a0JvcDl0K1J4V1pRMjV1RUFsNS9VZkdvY3ZpeTRlSjlVMCtmV2lQVldMdVN2?=
 =?utf-8?B?Q0U3Y2szazNqYkpDRkJmUmNXa1g1VFZjK204VnU3a212RWtQaDFHaU9ueGVv?=
 =?utf-8?B?NldrMHhDME1JSEdRbmhNdTMxM2V6Q0Y2SFk2MStBWWhPSkZ0UCtkbHRDOUhr?=
 =?utf-8?B?dGFwZmVwWXVVSFhCaHFWLzQ5cm5YOXVnUzdkOStNVlBpbkN3dWtJcGdmdzVt?=
 =?utf-8?B?VjdmYlhOYktFc0dHV3dyeGdNZUFpbG9oSk1OQytkWm45aWhyYmt2TDMvSU5F?=
 =?utf-8?B?TTF0a3cwSXVrajdLLzVScVk5V3FlSkZsUFp2NkdlcEpXRTBoTXdDZkJNaWo1?=
 =?utf-8?B?ODlJRG1JTEJDUDU1ajZYWi9mc3I2azBoc25GdGdKMzdiTlU0dGNlZC96OFRx?=
 =?utf-8?B?bE4yQmJIKzV4TmJ0Q09aaUM3Ull0enM5TUF4anZlckJnM201NTZZRWQ2ZjNQ?=
 =?utf-8?B?TEh5TzRJSVdNWHNsdS9MQ0lrNlJBUFc5Mk5KRFUwZjZuZ1lNQnNLM2hIeTh0?=
 =?utf-8?B?WnlWbjA3d1FmYzBLYVFqU2VkQS83eVp3S0cxZzM0MDhHUjlsSUx6M0tiS0ht?=
 =?utf-8?B?eXhVQ1h2RXBkWGNrM2RDcitYK2NiN29MSWJqaVBUbHFIZWQxN21zQll5UGFo?=
 =?utf-8?B?NUo5RDAwdE9qR2EwTTlIalBNR1FCSDN4b0hlRkR1QVhkdksrWXkrNENaWXBL?=
 =?utf-8?B?MEp6MlVZakNhQjRtbVpRck1DMSs0am82b3BXU3lVMEd1dEpyRnRmTUlWRFRs?=
 =?utf-8?B?elJ5T2hzME5MMFBjQmhUQXFkdE1xZGQ0a2dQMFFNZitLb0ZUc2szbkQzR0U0?=
 =?utf-8?Q?J/DzdG3NCDSflKzFWg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TmhDVlE3ZHpEQi9HMlBNTVBvcUdtZk1iKzFpMGVvUWNIbTM1TjJxdnZXTWRO?=
 =?utf-8?B?czVjNFVKNHZIS2djR1ZpdWlSdG5MVExiYkVjc3l0cUFsVklFMW1TcllEZUV0?=
 =?utf-8?B?OFUzNGdDS0haVFlYY1pLUVFtSFNWSE9oNkJTcUxjOUNYRDN6WXMrNldoRkor?=
 =?utf-8?B?TzRGcDMyZnM0NkpjeEYza1FwQ0h6UzNNMEZaMVpCTWF1TFZ4d2pRbzhqOXFn?=
 =?utf-8?B?byt0VUVyMlhTV1BWbWpadjBQWXJIekVUZHVNb2ZoeXdrTWUzQzJMeVNWcnZS?=
 =?utf-8?B?ME5yeUdhNWdid0VlSlFFOUlTcW1LNVdzcitnMTN6bGI0WmdjeTZRVlVKdnJq?=
 =?utf-8?B?SWExci9UZWY1RkJNT2ZpUUV1MHc4QkRNblYrMlY3TmoxRmdsL2lLMWRvZW1k?=
 =?utf-8?B?dTJDa2hTQkJ4d09YbHFpQUhjelJxWTBoSTVqR21WanlsSDlyWnpIY0EyYlEz?=
 =?utf-8?B?NDdNYm5yQ3A1K2gxNHAwcUFjb0JjQklXazExVnFKTlR5VEMvczBjdGtYbTFm?=
 =?utf-8?B?c3N1TXhOR2IzUHdxRCt4OFdFeTVRd2VjNFd1dTFlM3A5RkJVRUh1ME9YTUhS?=
 =?utf-8?B?YmllVHM4aUFFR2gvTGNUcXR3ZVpsTWNXMCtkbVE3ODNCUWRNY1I5bXcxTDQr?=
 =?utf-8?B?QjAxaC9ZcHFUVjlDbFFtSDBwalkyOVpkVk45QmJub0VIejZaN2xzWjlkc1Mx?=
 =?utf-8?B?ejQzclJmTUpLcXpPaVVHRTBFSmJ5MkJleEpMN0tIZnN6bExLQ3I4cVJveEts?=
 =?utf-8?B?eVJyRjRxOXhoZHFxMmxiMUxpc1VaaXJxTlFvdWY1aTNQNVV3ZklmcTJrT1JV?=
 =?utf-8?B?OEFJNERNNWlLc0F1UHRWa21pTTRPR3BvMi8yNE82U0I3bVNFajJ5V004enVs?=
 =?utf-8?B?bWh0dmdSaDkrMC94bitOWVVjSjkwZFBjM3JmR0FtUHhGK2FLek91d05OcTBF?=
 =?utf-8?B?VEUvejd2ZEgyMEt2UVFsZW40WVExaDk3S0doay9LM1pVYUlFY0FZYmt0VnVx?=
 =?utf-8?B?TWhYNVlUSW96cVdVaWZWUkRvTzFzSE43OWR5TXNnWGJ2dUdTWWVZNVVCNFls?=
 =?utf-8?B?c0xLL0RqakFTT0wyc0VPM1pwYlV5aDgvcGJHK0lXeFcwZ1ZvMkw4UHVFNmpn?=
 =?utf-8?B?MFFGRFFWdXhTL1JqSC9lbVhGb2dzZWxTcmhVY2lWTWNocCtOWUYyMitUelV5?=
 =?utf-8?B?aFBRbklJejRlK0NJNFh4SS9rKzVlSFJOWHpaOTJhUEFEcERFOGduZTk0NEs2?=
 =?utf-8?B?Rk4rWmY4ZmtqSktIUUlmOTZla1lnSzl0dnRheDNEWWkyU2pMY2Y0bGVJQmw3?=
 =?utf-8?B?U1FGVWZNODA4R1k0TmpmOTdzb21FZE1JS1FNWHFUUFNINnppbHJxMkRDSUU3?=
 =?utf-8?B?c1Raa3FlTExSSEpIem9CUEtKemJiMWJPWC9TSEprOStsTXF1bDlIKzN5Qy9q?=
 =?utf-8?B?WFBiZ3FnUWEyQTZvVUFxRk1hT3J0NVlvQVR3cWJxM3ZVUjY4ZUhpSGxpZEtM?=
 =?utf-8?B?MnNNNjhOeFc3b1BrL3BVWHJ2dDNCVHh6eGZISmtjMmNyUlNES3VoZ01UVzZJ?=
 =?utf-8?B?dWp5L3Q4VFZXT0Y1WUNpdTdnTDROb29xNGNrcTlVVGRLMXJlWk1DU3h5UW1C?=
 =?utf-8?B?UnJsTEJCV2ovNUp2YnN5Yll6Y0lQRFJEU0h0Y1V1STVmbkF5YlVMTEl4VnNk?=
 =?utf-8?B?eVpGb3A5K0JRWFl3dURnQUZHSjR4Um1XaFdocjJRR2ZWUjBnWXdHSE9tTmpK?=
 =?utf-8?B?S3ZEdHJGdGFoSXU4L3pvRHJNMUJrQmpFb3dGVmFkbVV3bzY4V3pDbGk4M294?=
 =?utf-8?B?R3hHRWl2dDF6d1EwVVZYak1QQlRudnJJd2huZ1plSFZCS014YXlkYmpxRTZU?=
 =?utf-8?B?SXovQTRUdVhTWjJ2RENKYitBQkdoUGdYY1dGRG5FNDRFS1Q2VStGcGMvdHdS?=
 =?utf-8?B?bUY5Q0VHZWgrZ1h0VEdPMndRV2liUVNaTUlTaGpRK1p5bWt4d3VRcGRmUWxt?=
 =?utf-8?B?T0FnYTdqRWJUUG9SaVA5STRMWWRWVE80eEtDaE9BYXREUVN2anlEdXVGWExp?=
 =?utf-8?B?cGdtUWdEdExZdXlCSEhMMDZ6S2NFZ01BRTR2OHdnS2R3UldWbzkvWWNoZ0JP?=
 =?utf-8?B?YUk2L1Y5UDNSVEZveUcrZ1R2dUE1SnRDbWlPdFNkS0F1SjB1SzBMckVZamR2?=
 =?utf-8?B?TWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e392330-3bb6-45c4-a389-08dc96bd0b39
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 15:23:06.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGTwU/4nRTpitSb34DcYWblX2Zy+M+pepB9004bdnuB8Qh3nxMtkw1rPYRRnDIiYlka+Es1I6yyOuWrRESH9KYC5v8TVOodzhxNeCid28aU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
X-Proofpoint-GUID: s8dbTG2-9doHBNebEDCRe1GGsnqBTYIQ
X-Proofpoint-ORIG-GUID: Gw2IlJobfTc2xfKOY8Q1Pi7kc_iX12T4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_11,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406270116
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 15:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111127

--------------05ruL82IYirgO9yyz0D02Zxc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45R4emlR021673

On 2024-06-27 9:27 a.m., Jonas Mark (BT-FS/ENG1-GRB) wrote:
> Hi Randy and Khem,
>
>> # keep update directfb2 ?
>> /tmp/meta-oe.log:2016 recipes-graphics/directfb/directfb_1.7.7.bb
> Please do not drop directfb. We actively use that in a long lifetime pr=
oduct which we will actively maintain for the next years to come.
Good to know. I'll leave it alone.
>
> Whether directfb2 will really take off, IMHO, only time will show.

Yeah, I'll keep an eye on it for now.

Thanks,

../Randy


>
> Cheers,
> Mark
>
>
> Building Technologies, Panel Software Fire (BT-FIR/ENG1-Grb)
> Bosch Sicherheitssysteme GmbH | Postfach 11 11 | 85626 Grasbrunn | GERM=
ANY |www.boschsecurity.com
>
> Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118
> Aufsichtsratsvorsitzender: Frank Meyer; Gesch=C3=A4ftsf=C3=BChrung: Tho=
mas Quante, Peter L=C3=B6ffler, Henrik Siegle, Peter von Wartenberg


--=20
# Randy MacLeod
# Wind River Linux

--------------05ruL82IYirgO9yyz0D02Zxc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45R4emlR021673

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-06-27 9:27 a.m., Jonas Mark
      (BT-FS/ENG1-GRB) wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:DU0PR10MB7076A24E8702AE99938CEA=
8AADD72@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM">
      <pre class=3D"moz-quote-pre" wrap=3D"">Hi Randy and Khem,

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D""># keep update directfb2 ?
/tmp/meta-oe.log:2016 recipes-graphics/directfb/directfb_1.7.7.bb =20
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">Please do not drop directfb.=
 We actively use that in a long lifetime product which we will actively m=
aintain for the next years to come.</pre>
    </blockquote>
    Good to know. I'll leave it alone.<br>
    <blockquote type=3D"cite" cite=3D"mid:DU0PR10MB7076A24E8702AE99938CEA=
8AADD72@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Whether directfb2 will really take off, IMHO, only time will show.</pre>
    </blockquote>
    <p>Yeah, I'll keep an eye on it for now.</p>
    <p>Thanks,</p>
    <p>../Randy<br>
    </p>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:DU0PR10MB7076A24E8702AE99938CEA=
8AADD72@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Cheers,
Mark


Building Technologies, Panel Software Fire (BT-FIR/ENG1-Grb)
Bosch Sicherheitssysteme GmbH | Postfach 11 11 | 85626 Grasbrunn | GERMAN=
Y | <a class=3D"moz-txt-link-abbreviated" href=3D"http://www.boschsecurit=
y.com">www.boschsecurity.com</a>

Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118
Aufsichtsratsvorsitzender: Frank Meyer; Gesch=C3=A4ftsf=C3=BChrung: Thoma=
s Quante, Peter L=C3=B6ffler, Henrik Siegle, Peter von Wartenberg
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------05ruL82IYirgO9yyz0D02Zxc--

