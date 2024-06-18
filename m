Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971C0C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 23:55:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9031.1718754937021796698
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jun 2024 16:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6899db8c63=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45INZFTZ012530
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 23:55:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yujbdr2da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 23:55:35 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45INtZqa007864;
	Tue, 18 Jun 2024 23:55:35 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yujbdr2d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 23:55:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1/3Cu7iemH51YCXPodga9olzJKU0qUtP56D5J8KHWM6D9KgReEKl2neu9UkQMJjaBgqsFlOjjPyWgdw26hvZIE3MLzauCLKgNeJKxNULHmXxzPw39a7YnfGDIhyB6rcLtvXUikynrezVyyNvW0K2U2u1/ATvs9rfiCAqL6pIv2saYSXBrFKUQ9SJJKLEqeD+tqieUDZG8CaBIalQL+hFR/CpSmBvEP8svEnFZF26Iff46gLKqk7H54VsJlqS96ha0UiQ64G8hasywDx0B76R+P5Ukanwmyas3XVKUFvAgaN1bdBFTrr4G437uDC3u7eCcDR20QBuCwRvzAd2AlT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDRpFtflE0eDZJ/oswlQ4Zmm+hZhj/fxrocj27bXWAs=;
 b=UZi3DDn3Az07noUQvhSo3f/8Pah8K0WeYxhTo4Xs1IB/C7//qfPfUWieFspckWZcfobYQdewZI4gIgt6a4PBQfichA9/TW51TE96jggo6qEZybEwfiGKDJ0O1AKb9zRRgayKQ1RWySRKZE6gmokzSVha8VVAC0fj19CMhZ/kxhpNJeqIlyp9yNzupKwtS3voSEAp1PPTeDPhjIowiuWdo2jMqr7mshbbejAI23Iry7Es9EWIAxCVLFzqMkP9HM41yZLW9vTIu6N0a54XrCDvzhYiWsq0zDqKFdxPCibHpAVolcqUmgi4a+p4noNHgingKV9CcC3dOBimgqwfh7VaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY8PR11MB7193.namprd11.prod.outlook.com (2603:10b6:930:91::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 23:55:31 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 23:55:30 +0000
Content-Type: multipart/alternative;
 boundary="------------HjJsI0ctCviOtDthAYpmh0SD"
Message-ID: <7193adf3-3f0a-4579-b1c5-336a59f859e7@windriver.com>
Date: Tue, 18 Jun 2024 19:55:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pyyaml-include:
 support native and nativesdk build
From: Randy MacLeod <randy.macleod@windriver.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: akuster808@gmail.com, openembedded-devel@lists.openembedded.org
References: <20240617191342.2360052-1-Randy.MacLeod@windriver.com>
 <CANx9H-DUPrkCGV9neBKQL+f-SkVyLzdooQnC2zt7BLPFA7bxwg@mail.gmail.com>
 <5f1edf15-1554-4d6d-a4cc-e1decd194da8@windriver.com>
Content-Language: en-CA
In-Reply-To: <5f1edf15-1554-4d6d-a4cc-e1decd194da8@windriver.com>
X-ClientProxiedBy: YQBPR01CA0123.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::23) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY8PR11MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a7ec18-c074-4880-d4e4-08dc8ff22281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|4022899006|366013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eWZYcWtySHdGUDNhMlFlWElzQVlpbWxkcFkrd3ZTRTBKOG1MeStqKzNzbk91?=
 =?utf-8?B?akh2aVBCUnk4TzNHdHVkcXRNYjVqazI0Wm9QR3pwVXdRcVJZSHVNdlRQdlpC?=
 =?utf-8?B?dXpnNFRSZmU3VSt2QmUzSVNWUHFBVTlIRlo3MDRrNXZzZnZGS2VyVExZT2tB?=
 =?utf-8?B?Rmx0bVltR3dQeDFuYmRleXNKdlFNMU5lRDgxMkNhNEJBU0I5SlBWZkYvaWRQ?=
 =?utf-8?B?UXVTUzBNa01uN29wemZ5cVRnaUYrMWRrY1BGRE5FQXEyejNaQXpkd3QvcTJU?=
 =?utf-8?B?Y0ZzMHJhNzZmNnY1d3dUZkNHRjBYOUQ5NHF2SEc3d1B4V1liVnJVcXM5NW5j?=
 =?utf-8?B?L0ZXNW9CR20rMzNzUjdIODgwNC83cy9uYUhMRDF2UG12Y1RWQ3dIZGJRYUZv?=
 =?utf-8?B?V2J3M0JKWk9JUFFSNkFWNm1tMW13Z0JnUlhTWnQ1WlQ1SEdPem8wVUthaGIr?=
 =?utf-8?B?TGplakpRL041N2xNSkx5UStxT2NBK2hoenBaVENTOHluQWJoUXN5cXBUY0s5?=
 =?utf-8?B?WENzcWNGd2FHUHhrRUhnemxTblVDNkhvL2JKbmQyYWQzNkszWWxSU1VxTEhC?=
 =?utf-8?B?Ti94eHRlKyt3NnRTU3dxS0l2U1pXdWlDNXBsZkdYTndtbXlLSHVEdkF6YkhP?=
 =?utf-8?B?ZkEwRWs5S1B2b3FnZ25XSmowV1dHWE9nd0pTNUE3Lzk0Sk43bUV6RzlJRnhy?=
 =?utf-8?B?UUMvdEx6UGJVUk9IOUxhWThyMVhKeXBUczRibkd2Q0NveWdxZmpWRjV3NXpE?=
 =?utf-8?B?b1Z5TVdRT0J3eWlPRlVUMVlrZzNkcC92TTFNcWp5VDFLbC8yajd3MlJjVDU5?=
 =?utf-8?B?aTNPdVBMTlBMRjNBa0Q0ZHVsTE1sSmVpdFNnaWNWOFZZZmZWUlF5UXFDbXF4?=
 =?utf-8?B?K2FnbSt5U2EzUnJCSjVqcnpXeUx1aEtLR1VnTnR4RlZlVkgvVnNFa0cyb0cv?=
 =?utf-8?B?QTRLYWtlMHFTdkprSXZxL1dOQ0pya2hBWFN1YVVsZEoyaytxOW1IZVkyRjlC?=
 =?utf-8?B?QTQ0OFFBdkJZaXg4a2dYZHRLRFVQcjU3ZFhvM2RPRndaaXlOTlV5SGE3SXRQ?=
 =?utf-8?B?dVBWZDZpL3ZqT2JlbzdOYTE1cUVjN2MvcEZVVnNEYjhLdlR5emtzUms3Ym5s?=
 =?utf-8?B?c01uZ3ZNS0pGOUc0YXJxMGFXQWh3THdMYjcxZlJ4OTl5RjVJdlB4UXZ3R0xx?=
 =?utf-8?B?MyttNUNQekNjTUpIc2o0dmpLaUQ3ZDZmTDNEVDlNSnR2WkZSSjNQR1lBQjJG?=
 =?utf-8?B?b0MvdUhJWTA2Snlhd2MrWm8vTlhSMTd4U3Vzd3BtMThheTdhYXFMOFNlcmNu?=
 =?utf-8?B?KysrMnhRdktVOEJiMmZlcDhkSnBCK0s2MnZHcmJlMW9Pb1I3ZDhLQ1VSd004?=
 =?utf-8?B?dHJ1MUd1Z3czRjhRRHhaam9iaVoxQ3NsRjVFZGFKZ0N4WGdkRE8va3llQTcr?=
 =?utf-8?B?dXdQVld2bFBjQ1hEYXFEM0hDV1M2aUFZSUFHUXBVaHZmSHV3Umg0ckRuMis0?=
 =?utf-8?B?SVlkS0p0YWZVVnpDTksxaEdJcU42K2VQMVNJdkpseE0xU3pOM2tkbDk0U0Nh?=
 =?utf-8?B?RE1QaVpxZXdDeE4rMHVxKzcvd3pMdnlXeTdNVlhad1MxNElWTnhtelk4Qkgv?=
 =?utf-8?B?Nkl0eUlpMitRMXp1eW5iRll3OXhqTzRSbDUyZUVTV1NYVFpGRGZXSFBYU2Ix?=
 =?utf-8?B?WkdXbFIwaXdvSm40MUZKZ0pab05jelNUQ0dkQjJld0M2WEtMV0x6M3ZnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(4022899006)(366013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T0QzL2FHQ21Fb3FCdThYYnRXd2hweUxHT1BUYy91cVN5aTBya3lCdGRrdlJx?=
 =?utf-8?B?MkROQXJiOVplRFhPNGI5SVVXME9FZlNIR2VUK2M0bFhYUnQxSXQyaXRyWUpS?=
 =?utf-8?B?Z1ZNNGRtVnprUyt2T3RhZk91UmdrWXljWlVuSWc0SFUxdkVoTko1U3B6UktG?=
 =?utf-8?B?ejNnWEtQS0ZyQTQ3aXIwY2ZOaHVaRzR2MElPUElNOUx2bkxlVUpoNEpvZHBZ?=
 =?utf-8?B?OTNXUnJTaEdJQVFJRSszS3RsbUQ2UDdNZjJwQ0ZBb2JwTjVJL3RGZEJNTFJr?=
 =?utf-8?B?YjdBRWZETm5xamtIc1k5Qi9tZmdxcXA0eUZGbjlBeUMva05KZUozRm1RYjNB?=
 =?utf-8?B?b3JaQzhhT2t5c3lEc1BaU3V4T2NXQ3VJSGVBNzBRN2FWZGdzYzhRakdvYWd2?=
 =?utf-8?B?Zlh6VENiclo2ZUFCZmpmZWlHbnViZVdjVDh2cVIzeVlweW5Pd2ZlSk5WM0lD?=
 =?utf-8?B?RkowanplVEMvQ3lYbUpnZ3VIVTFkbkI4Vkt2UGlyTmN4TXNzUlVFYVV4OGlZ?=
 =?utf-8?B?YU8zYzl1WVdsa05CWnJyd0tpMnAvMHpDbnlyS3IxZlp5RW92aERKY1FkSzQ5?=
 =?utf-8?B?OUM2clhzZXBQMzNzUDlrcjQwNUtwSVhlVU1sMDMrUmFOUFpEblNaSjh6OVBX?=
 =?utf-8?B?c0RBYmtkUkJubFQ5RFJXMFE4UEQwU2xCeHUxM2pNREVrZlp0KzJHOVhzZlI4?=
 =?utf-8?B?VzV6Qll3clVLcy9oeWE3YTRkMXdVOFMrdEx4elNyV1p4eGpQREYvL2Vzd2FM?=
 =?utf-8?B?eVA5RTY2TjZTSkxmbUVqalpOWE5XYlp0VjlGNjgzZDFyTHJ1OGJpM1NRR3NS?=
 =?utf-8?B?VmZnU2xteEo0dTlpdW92MlN3c0ZjR2F1VEV6Y09Ba2crR2tkTVByZENxUHNG?=
 =?utf-8?B?RGkvV21Ta0Q4c3AwN0Z3aCthcm03RTVkemVNM2h2dHRCZm9xdHBJM0hrSmwr?=
 =?utf-8?B?dkRkSFp6cVl5RkJOQjJLeUljQzBOVnhlNVIwS1FuZWwxclFraWE0QlkyWFRp?=
 =?utf-8?B?ajRFOXM3OVVISyt6QlpWVU9sU1hNU2M1TzNCM3ZIQzVDdXVOczlhamlqUTV5?=
 =?utf-8?B?YzFURUM5MUVnM1RpRmNkK1I5THZnaWV6cUFJcjZKMVVidUhVbFRtaWV1M2R4?=
 =?utf-8?B?RWR4VElxbjlGbjRBdHorNlQ2UE11OXBpa0x2U3RQZ1E2VVI2M2FSL1N1VXBG?=
 =?utf-8?B?OVVYUkN4VHd0N0xaaS94bXBQOFRlTzR5K0Mvekk1a2sxTyt2TllTL2ZPT2k3?=
 =?utf-8?B?cERNcExFTFFGbDNSaWZaOFU3MTQzU0luOWFadVB1amphOGxNT20vbjg0aGZI?=
 =?utf-8?B?UUVGR0hYa3RRSy9NU2hscXVFOU0rSzhhREQ1THZSZUFGUk9hajRPNU4yclAz?=
 =?utf-8?B?TXlqUnJpUGVuNkp4SFJKMldpM0dnam5Uc3lqRkU5cEZNaWhGUjlPdGxsQk5y?=
 =?utf-8?B?dWtNYldnODl0K1pHazFVWHluS2dSTGFZRnJxV1E1cVJhd0FUOXdtbEJIUjNK?=
 =?utf-8?B?cDlnYjFKamNZTTBSbjRvWkdQRWZiTFpXSjd5bkxvYllkdG9xVlhjdXhORVNL?=
 =?utf-8?B?cnFKc3RtZTkwUWZzRlpQRjIvNHllRll2R1kxOHdPY3orZXViaDFKN0Y0cmtE?=
 =?utf-8?B?bUR2M2oxNklEbGNMd3ppaHczS1NZeVp5ZXVod3BKQUQxaTZYTjJvRnZPN3hQ?=
 =?utf-8?B?emgvVGlqQkJqcktaUWFsMUFxMDBCUzV4azdYTXJSR2NKTkFPenNrdmMwZTV0?=
 =?utf-8?B?bVRUYWxZbklSbENTNW5ZeURNQURmbStaTHdCcTZCa01FcXdybHBHMG1DdDA5?=
 =?utf-8?B?dnoxQndpU2JHNDVFVVd0amxtaFBPdVpUYVJhbjd3UEYwNDVmYU9qV3hkN2Q0?=
 =?utf-8?B?ZzA1ZFVTaUlFYkczN28wRmJyMzZkaGpwYnNHODN4WjFTZU1oZnFNVFBvVWRz?=
 =?utf-8?B?TFhtdzlkQVB4MGM0eERGMEpvaVFtN3RYVitvcjlzcG44Q1VwbVc4aDQ5b0JO?=
 =?utf-8?B?eDZ2RmNLVit3OHB4K05kZXF5dGFnMXZva2Z5U3AvNitBSGh6cHJ2QmxtOTlt?=
 =?utf-8?B?dmFVd3FLQis4UmRGVWM1S2xTRVpNakFjU0xtS2V1d0xaTWFVSTRXMGdZY2VL?=
 =?utf-8?B?MWxrNTJHT1NzYWVFOUFlQk0xcEQ4K0k5LzFiMlI2azdQbDVUNDdTVzVSQWZq?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a7ec18-c074-4880-d4e4-08dc8ff22281
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 23:55:30.4874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tt6Rn7y3MKmLYQ9H9JWhDJCg6XD5Aom2X2D3mRKyOJvyzBAZVWx1xnkO+e7ff0gJL4karN2QW75HTHoCof1KVBB+Yg8974PT3ufnN+8dAF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7193
X-Proofpoint-ORIG-GUID: znxO_iVEkLM6Bnts1ibDH47XRjuRXAFm
X-Proofpoint-GUID: Zc5Xi4MxuqP5EBrbJWTPsIwKS27Eif9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_06,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406180175
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jun 2024 23:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110958

--------------HjJsI0ctCviOtDthAYpmh0SD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45INZFTZ012530

On 2024-06-17 9:22 p.m., Randy MacLeod wrote:
> On 2024-06-17 7:36 p.m., Tim Orling wrote:
>> Master already has this, so it is a backport request.
>>
>> Randy, I assume you verified both targets build without issue.
> I did test on master but didn't for scarthgap since it would=20
> "obviously work"!
>
> Famous last words...
>
> On my PopOS (ubu-22.04 - ish) host:
>
> |=20
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/work/x86=
_64-linux/cmake-native/3.28.3/build/Bootstrap.cmk/cmake:=20
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/sysroots=
-uninative/x86_64-linux/usr/lib/libstdc++.so.6:=20
> version `CXXABI_1.3.15' not found (required by=20
> /media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/work/x86=
_64-linux/cmake-native/3.28.3/build/Bootstrap.cmk/cmake)
> | ---------------------------------------------
> | Error when bootstrapping CMake:
> | Problem while running initial CMake
> | ---------------------------------------------
> | WARNING: exit code 11 from a shell command.
> ERROR: Task=20
> (/media/rmacleod/gitter/rmacleod/src/distro/yocto/poky.git/meta/recipes=
-devtools/cmake/cmake-native_3.28.3.bb:do_configure)=20
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 485 tasks of which 0 didn't need to be=20
> rerun and 1 failed.
>
>
Summary:

1. both native and nativesdk build fine when I remove a custom native=20
toolchain!
2. The commit for master hasn't merged yet so I'll wait for that before=20
sending v2.


Details for Tim with one question:

That -native build problem was due to having a custom gcc in /usr/local.=20
Oops!

python3-pyyaml-include-native builds fine using the distro's gcc :

=E2=9D=AF /usr/bin/gcc --version
gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0


The nativesdk- python3-pyyaml-include build succeeds too but there was=20
one warning that I'm unsure about:

 =C2=A0=C2=A0 Building target platforms: x86_64_nativesdk-pokysdk-linux
 =C2=A0=C2=A0 Building for target x86_64_nativesdk-pokysdk-linux
 =C2=A0=C2=A0 Processing files:=20
nativesdk-python3-pyyaml-include-1.3.2-r0.x86_64_nativesdk
 =C2=A0=C2=A0 warning: Ignoring invalid regex=20
^((${prefix}/=3DLIB=3D|usr/share)/pkgconfig/.*.pc|usr/bin/pkg-config)$ <-=
---
 =C2=A0=C2=A0 Finding=C2=A0 Provides:
 =C2=A0=C2=A0 Finding=C2=A0 Requires(interp):
 =C2=A0=C2=A0 Finding=C2=A0 Requires(rpmlib):
 =C2=A0=C2=A0 ...


That happens when running rpmbuild... ah, here's the source:

=E2=9D=AF rg pkgconfig=20
/.../tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pyyaml-inc=
lude/1.3.2/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/fileattrs
/.../tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pyyaml-inc=
lude/1.3.2/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/fileattrs/pkgc=
onfig.attr
1:%__pkgconfig_provides=C2=A0=C2=A0=C2=A0 %{_rpmconfigdir}/pkgconfigdeps.=
sh --provides
2:%__pkgconfig_requires=C2=A0=C2=A0=C2=A0 %{_rpmconfigdir}/pkgconfigdeps.=
sh --requires
3:%__pkgconfig_path=20
^((%{_libdir}|%{_datadir})/pkgconfig/.*\.pc|%{_bindir}/pkg-config)$

which is likely from rpm-native/usr/lib/rpm/fileattrs/pkgconfig.attr

and so not specific to this change it would seem.

We should still fix it, but the pkgconfig.attr line has been around in=20
rpm for > 10 years.

Tim,

I'm out of time for today.
Is it easy for you to find out if this warning is something that works=20
well in Fedora but generates a warning in YP?



I don't usually worry about how rpm packaging works in detail so this=20
was fun and I got to use strace! ;-)


../Randy


> I'll try that on a supported distro and re-submit adding a comment=20
> about it being a backport.
> I'm busy most of the week so it may be a while.
>
> Thanks for asking Tim and sorry for the noise.
>
> ../Randy
>
>>
>>
>> On Mon, Jun 17, 2024 at 12:13=E2=80=AFPM Randy MacLeod via=20
>> lists.openembedded.org=20
>> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw=
8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvka=
zy3jSHZJsReCax2W-Q$>=20
>> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>>     From: Randy MacLeod <Randy.MacLeod@windriver.com>
>>
>>     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>     ---
>>     =C2=A0.../recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
>>     <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.b=
b__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_=
RMZ0yqELoYvkazy3jSHZJsRdX0IWwxQ$>
>>     =C2=A0 =C2=A0| 2 +-
>>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>>     diff --git
>>     a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2=
.bb
>>     <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.b=
b__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_=
RMZ0yqELoYvkazy3jSHZJsRdX0IWwxQ$>
>>     b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2=
.bb
>>     <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.b=
b__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_=
RMZ0yqELoYvkazy3jSHZJsRdX0IWwxQ$>
>>     index 3a5bd99a7..309d0ac59 100644
>>     ---
>>     a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2=
.bb
>>     <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.b=
b__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_=
RMZ0yqELoYvkazy3jSHZJsRdX0IWwxQ$>
>>     +++
>>     b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2=
.bb
>>     <https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.b=
b__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_=
RMZ0yqELoYvkazy3jSHZJsRdX0IWwxQ$>
>>     @@ -26,4 +26,4 @@ RDEPENDS:${PN}-ptest +=3D " \
>>     =C2=A0 =C2=A0 =C2=A0python3-pytest \
>>     =C2=A0 =C2=A0 =C2=A0python3-unittest-automake-output \
>>     =C2=A0"
>>     -
>>     +BBCLASSEXTEND =3D "native nativesdk"
>>     --=20
>>     2.34.1
>>
>>
>>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>     Links: You receive all messages sent to this group.
>>     View/Reply Online (#110943):
>>     https://lists.openembedded.org/g/openembedded-devel/message/110943
>>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/open=
embedded-devel/message/110943__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCL=
EV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRdaJIdgGQ$>
>>     Mute This Topic:
>>     https://lists.openembedded.org/mt/106727475/924729
>>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/106=
727475/924729__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1=
ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd-fviFOQ$>
>>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>>     Unsubscribe:
>>     https://lists.openembedded.org/g/openembedded-devel/unsub
>>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/open=
embedded-devel/unsub__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4R=
keZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd659LC0Q$>
>>     [ticotimo@gmail.com]
>>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------HjJsI0ctCviOtDthAYpmh0SD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45INZFTZ012530

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-06-17 9:22 p.m., Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:5f1edf15-1554-4d6d-a4cc-e1decd1=
94da8@windriver.com">
     =20
      <div class=3D"moz-cite-prefix">On 2024-06-17 7:36 p.m., Tim Orling
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:CANx9H-DUPrkCGV9neBKQL+f-SkVy=
LzdooQnC2zt7BLPFA7bxwg@mail.gmail.com">
       =20
        <div dir=3D"auto">Master already has this, so it is a backport
          request.</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Randy, I assume you verified both targets build
          without issue.</div>
      </blockquote>
      I did test on master but didn't for scarthgap since it would
      &quot;obviously work&quot;!<br>
      <p>Famous last words...</p>
      <p>On my PopOS (ubu-22.04 - ish) host:</p>
      <p>|
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/work/x86_6=
4-linux/cmake-native/3.28.3/build/Bootstrap.cmk/cmake:
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/sysroots-u=
ninative/x86_64-linux/usr/lib/libstdc++.so.6:
        version `CXXABI_1.3.15' not found (required by
/media/rmacleod/gitter/rmacleod/src/distro/yocto/b/inc-nat/tmp/work/x86_6=
4-linux/cmake-native/3.28.3/build/Bootstrap.cmk/cmake)<br>
        | ---------------------------------------------<br>
        | Error when bootstrapping CMake:<br>
        | Problem while running initial CMake<br>
        | ---------------------------------------------<br>
        | WARNING: exit code 11 from a shell command.<br>
        ERROR: Task
(/media/rmacleod/gitter/rmacleod/src/distro/yocto/poky.git/meta/recipes-d=
evtools/cmake/cmake-native_3.28.3.bb:do_configure)
        failed with exit code '1'<br>
        NOTE: Tasks Summary: Attempted 485 tasks of which 0 didn't need
        to be rerun and 1 failed.<br>
      </p>
      <p><br>
      </p>
    </blockquote>
    <p>Summary:</p>
    <p>1. both native and nativesdk build fine when I remove a custom
      native toolchain!<br>
      2. The commit for master hasn't merged yet so I'll wait for that
      before sending v2.<br>
    </p>
    <p><br>
    </p>
    <p>Details for Tim with one question:<br>
      <br>
    </p>
    <p>That -native build problem was due to having a custom gcc in
      /usr/local. Oops!<br>
    </p>
    <p>python3-pyyaml-include-native builds fine using the distro's gcc
      :</p>
    <p>=E2=9D=AF /usr/bin/gcc --version<br>
      gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0<br>
    </p>
    <p><br>
    </p>
    <p>The nativesdk- python3-pyyaml-include build succeeds too but
      there was one warning that I'm unsure about:<br>
      <br>
      &nbsp;&nbsp; Building target platforms: x86_64_nativesdk-pokysdk-li=
nux<br>
      &nbsp;&nbsp; Building for target x86_64_nativesdk-pokysdk-linux<br>
      &nbsp;&nbsp; Processing files:
      nativesdk-python3-pyyaml-include-1.3.2-r0.x86_64_nativesdk<br>
      &nbsp;&nbsp; warning: Ignoring invalid regex
^((${prefix}/=3DLIB=3D|usr/share)/pkgconfig/.*.pc|usr/bin/pkg-config)$&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &lt;----<br>
      &nbsp;&nbsp; Finding&nbsp; Provides: <br>
      &nbsp;&nbsp; Finding&nbsp; Requires(interp): <br>
      &nbsp;&nbsp; Finding&nbsp; Requires(rpmlib): <br>
      &nbsp;&nbsp; ...</p>
    <p><br>
    </p>
    <p>That happens when running rpmbuild... ah, here's the source:<br>
    </p>
    <p>=E2=9D=AF rg pkgconfig
/.../tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pyyaml-inc=
lude/1.3.2/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/fileattrs<br>
/.../tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pyyaml-inc=
lude/1.3.2/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/fileattrs/pkgc=
onfig.attr<br>
      1:%__pkgconfig_provides&nbsp;&nbsp;&nbsp; %{_rpmconfigdir}/pkgconfi=
gdeps.sh
      --provides<br>
      2:%__pkgconfig_requires&nbsp;&nbsp;&nbsp; %{_rpmconfigdir}/pkgconfi=
gdeps.sh
      --requires<br>
      3:%__pkgconfig_path&nbsp;&nbsp;&nbsp;
      ^((%{_libdir}|%{_datadir})/pkgconfig/.*\.pc|%{_bindir}/pkg-config)$=
<br>
      <br>
    </p>
    <p>which is likely from
      rpm-native/usr/lib/rpm/fileattrs/pkgconfig.attr</p>
    <p>and so not specific to this change it would seem.<br>
      <br>
      We should still fix it, but the pkgconfig.attr line has been
      around in rpm for &gt; 10 years.<br>
    </p>
    <p>Tim,<br>
    </p>
    <p>I'm out of time for today.<br>
      Is it easy for you to find out if this warning is something that
      works well in Fedora but generates a warning in YP?</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>I don't usually worry about how rpm packaging works in detail so
      this was fun and I got to use strace! ;-) <br>
    </p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:5f1edf15-1554-4d6d-a4cc-e1decd1=
94da8@windriver.com">
      <p> </p>
      <p>I'll try that on a supported distro and re-submit adding a
        comment about it being a backport.<br>
        I'm busy most of the week so it may be a while.</p>
      <p>Thanks for asking Tim and sorry for the noise.<br>
      </p>
      <p>../Randy<br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:CANx9H-DUPrkCGV9neBKQL+f-SkVy=
LzdooQnC2zt7BLPFA7bxwg@mail.gmail.com">
        <div dir=3D"auto"><br>
        </div>
        <div><br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 17, 2024 at
              12:13=E2=80=AFPM Randy MacLeod via <a href=3D"https://urlde=
fense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!aw5nRqXmGOpT=
n-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsReCax2W-=
Q$" moz-do-not-send=3D"true">lists.openembedded.org</a>
              &lt;randy.macleod=3D<a href=3D"mailto:windriver.com@lists.o=
penembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext"=
>windriver.com@lists.openembedded.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)">From:
              Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver=
.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fr=
eetext">Randy.MacLeod@windriver.com</a>&gt;<br>
              <br>
              Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.Ma=
cLeod@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"=
moz-txt-link-freetext">Randy.MacLeod@windriver.com</a>&gt;<br>
              Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">raj.khem@gmail.com</a>&gt;<br>
              ---<br>
              &nbsp;.../recipes-devtools/python/<a href=3D"https://urldef=
ense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveYdw8EvQ!aw5n=
RqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJs=
RdX0IWwxQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>python3-pyyaml-include_1.3.2.bb</a>&nbsp;
              &nbsp; &nbsp;| 2 +-<br>
              &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
              <br>
              diff --git a/meta-python/recipes-devtools/python/<a href=3D=
"https://urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!A=
jveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqE=
LoYvkazy3jSHZJsRdX0IWwxQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-no=
t-send=3D"true">python3-pyyaml-include_1.3.2.bb</a>
              b/meta-python/recipes-devtools/python/<a href=3D"https://ur=
ldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveYdw8EvQ!=
aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jS=
HZJsRdX0IWwxQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">python3-pyyaml-include_1.3.2.bb</a><br>
              index 3a5bd99a7..309d0ac59 100644<br>
              --- a/meta-python/recipes-devtools/python/<a href=3D"https:=
//urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveYdw8=
EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkaz=
y3jSHZJsRdX0IWwxQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">python3-pyyaml-include_1.3.2.bb</a><br>
              +++ b/meta-python/recipes-devtools/python/<a href=3D"https:=
//urldefense.com/v3/__http://python3-pyyaml-include_1.3.2.bb__;!!AjveYdw8=
EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkaz=
y3jSHZJsRdX0IWwxQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">python3-pyyaml-include_1.3.2.bb</a><br>
              @@ -26,4 +26,4 @@ RDEPENDS:${PN}-ptest +=3D &quot; \<br>
              &nbsp; &nbsp; &nbsp;python3-pytest \<br>
              &nbsp; &nbsp; &nbsp;python3-unittest-automake-output \<br>
              &nbsp;&quot;<br>
              -<br>
              +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#110943): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/1109=
43__;!!AjveYdw8EvQ!aw5nRqXmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ=
_RMZ0yqELoYvkazy3jSHZJsRdaJIdgGQ$" rel=3D"noreferrer" target=3D"_blank" m=
oz-do-not-send=3D"true">https://lists.openembedded.org/g/openembedded-dev=
el/message/110943</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/106727475/924729__;!!AjveYdw8EvQ!aw5nRqXmG=
OpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd-fv=
iFOQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http=
s://lists.openembedded.org/mt/106727475/924729</a><br>
              Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@l=
ists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openemb=
edded-devel+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!aw5nRq=
XmGOpTn-N6VdrwlGFDwCLEV6UZpm4RkeZQPm1ZwM19UTcOiQ_RMZ0yqELoYvkazy3jSHZJsRd=
659LC0Q$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">h=
ttps://lists.openembedded.org/g/openembedded-devel/unsub</a>
              [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">ticotimo@gmail.com=
</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </blockquote>
      <p><br>
      </p>
      <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------HjJsI0ctCviOtDthAYpmh0SD--

