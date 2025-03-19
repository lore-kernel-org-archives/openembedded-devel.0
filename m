Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9917AC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 17:46:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1191.1742406372530046757
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 10:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51737d2239=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J6o1S7021106
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:46:12 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45eprrapn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:46:11 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52JHkBbx019126
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 10:46:11 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45eprrapn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 10:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5zTWkOHnTO4yHmOm7X4Ii3wChOi+vc1CJP8DrKju6pRj7Ec0XVOuD0Xn+97EY9DhHH6lWv471fssAnYmHVoMMuJHhfOiV3IoK1V0//79jlaNsrHv4ZlrRunoCj6stlGLt3gDjPevLaitgk3QHMsW7H+VJdSF0O/hVzT1Vl3rDcW4O4sl2f7jSFCnSYX0MtjWf8Df9eNIfatZiAHndWMxtjUOJwS4y6lu2RzsKmdh4Crq52RykCLX1JuXTlN8WnnqNjnHZ9YxvY4M7eeHqqtUR3Di6Kvqzr897RvYeyNgIis6mx5sB8/PbFwzOCS+ad4bjTjbtGdh5hCm5hEwjgAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVGZihaHjYb1HQeSXWh/xAs9C9ambAu9a2yujEU2Esc=;
 b=A4Th9RSUgnm8MIvNvUgKRC84Px5NmGocDyZzew2I5c/HkVKNIRZmcIdG91KWFM1hclCl/8kSvqoWiCrwGBxylWdi3yZ9mGj5Dx42LoWsttzFd/Gy1FIDaGzJboD/wz7vR1WaRCop2RGB5g7ROxmE5uI9msa0spX2/dFTaac6UCR2SdsgooiwjYRfDaojyoy630YJcPgM72G9ELFpC3iuzNtbAslQyy5+oSL3vQWGwr8TDPbXIQ69ezrrbx8ajMEsxJkaN6+fnN1SjKhYR4++GcMi0bekVuZfU2a1SMG0TrnYIKs/2AWW9nVhhCiHYjqIf79ZcDtUm3dJXEHpltHR7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH0PR11MB4949.namprd11.prod.outlook.com (2603:10b6:510:31::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 17:45:59 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 17:45:59 +0000
Content-Type: multipart/alternative;
 boundary="------------Eg7y0v0Qjw0fy08Bq4XRj8B8"
Message-ID: <10d699be-2918-4dd3-b892-ef87b8e0a7be@windriver.com>
Date: Wed, 19 Mar 2025 13:45:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v4] protobuf: 4.25.5 -> 4.30.0
To: hongxu.jia@eng.windriver.com, openembedded-devel@lists.openembedded.org,
        raj.khem@gmail.com
References: <CAMKF1spcbP58H+KjOHdkWOyicPAozdtM_02Q_PXTGDBK7cq0mQ@mail.gmail.com>
 <20250317060612.4111152-1-hongxu.jia@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250317060612.4111152-1-hongxu.jia@windriver.com>
X-ClientProxiedBy: PH0PR07CA0044.namprd07.prod.outlook.com
 (2603:10b6:510:e::19) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH0PR11MB4949:EE_
X-MS-Office365-Filtering-Correlation-Id: 829125a1-c6d0-4f74-caa9-08dd670de8a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aTlScDh5dmZzc09SZUpJVFJjRHI1dS85V08vNGt0UThONzU1RWVOYVprTWNk?=
 =?utf-8?B?QXhCV2dsQmVsMVJHWjE0a3crYlRlc0k1VG50QXlJdmpVWU13d1J2SFJwT09q?=
 =?utf-8?B?SkNiTFVvRFhCZUE2NkM1bnJUdFJRVUMvK0FBUEdmZzFSL2JMRjZRU1dxejBB?=
 =?utf-8?B?eHdSeDlQMVlWaURONmdHZnNYaG4xeHZUc2NKNVBDRXdKbmhlWERYRWhIOFI2?=
 =?utf-8?B?ZkQ4RllTdHg0M21BTzRubEZVa2NxOVU5MUdBaTJzWUEzbDBmaDE2Y0g4MWJU?=
 =?utf-8?B?eWlHcHk0RHYxTDRrYjlnYUZLWWxFVlg0Y1ZCbjN3b2dBVTQ5cmxkZWJZVE1t?=
 =?utf-8?B?YmNpZjhuSVlhSnVLc0xKZENmOE9EMldyUEJNdFNRb0V1WUhYZ1RTYUZpTzFT?=
 =?utf-8?B?Tlh0RC9YenZQRk4rY2pDemsvVlZhNDl2SnVSdHlSVVpZdWdMUDAvdUR0Tk1Y?=
 =?utf-8?B?ZWRraXM1d3BBUm5sbjFBZzY2eHBRc3dGb1FVN3RGeXBWRlJKWHZCSnNWRzZl?=
 =?utf-8?B?cUNFSEluQ2RoQndQTjlpRkgrVk11V0tva3RFTkJRbUlOQy9TYkF3MW53WG5J?=
 =?utf-8?B?UWlsdFBJUW8zR3pUSlhrREtZWForSm5leHVLTTA2Ujg2c20vdHM4VU9Vc0cw?=
 =?utf-8?B?L25DOFNOb0FpS2dLS1cwYVorSjZxdUVKcGZVcWd4TDNJQk5CdkR2Wm9Wd0ti?=
 =?utf-8?B?djlYb1NWK2tpeWM2YVUxT3BHVGt2bmwwVEoxeHgzNjBxTFdVc1ZLdFEvNWxL?=
 =?utf-8?B?UDZsZFQ0UXZCUGtYdXVZeDlBVnR1Q2lZbUxPbWtRSHdwS2FhOVh0ZzdaNG1p?=
 =?utf-8?B?dkh0OWU2M1ZCZnZvSUN5cXhFSkFsSy9EMDBDQlFqOTRPLzNTSWtOa04wcDZP?=
 =?utf-8?B?RFdZYW0ydFJGczdoMndDbHpMMlB4cFp6ZGIvSkljQjI0bnZTazNZQ3V2VnhE?=
 =?utf-8?B?b1FnSjRUZW5NbHpJa21VMG5BZHQxRDVwM3VXOEJyR2dvOWdRR2l2R1NmeHVY?=
 =?utf-8?B?bkNGaDB2RjJrM1dmeVdqYUsvWHhEV3pIN0dUaTlUMTN5RjNEem9NQVB3Nkx5?=
 =?utf-8?B?elU1QjJCOWJQVC9WUzU1akFvSkhJK0dSRzdFQ1ZaYkxmUUNrWkRvb1NidmN2?=
 =?utf-8?B?OXhzY2w4aytyZlBxeDNqODQwRlRnQk5hTmRKSFp1Q2Erc0M1VXpsVlc2eEZG?=
 =?utf-8?B?eTdDQjhjK1hmTXM3M043TXU3MStYMFArUGgvUnd6cm1qb2RYKzBEd2UyTmxn?=
 =?utf-8?B?dkRBZFFnUHdMUi8zVlhXTzBLSFM4bVYvUGJQTWg2Y0VucGNmTC92bHpaZlpJ?=
 =?utf-8?B?ejUyMFpYMDY3RXhMZTBLNUpjcjc1SWJoeFoyandKMUozNFZ2a3lPTlFLT0o0?=
 =?utf-8?B?YkVxN29xRW42cjdMeHcwVlQyZ1Btc1lxcHh2cS9oRzNTdW1GWjZyME40RUZm?=
 =?utf-8?B?MjR1S3lkYkZwdHVOVjhmRFBaODJGMkFtK0pZTDBEaHF0Y29obTV2S2Z4OER4?=
 =?utf-8?B?a25QMTF6a3BkTVpJM09qZytLVVk5L1dJYTA5WmI3UUpaUlpyQWpoalllM1lQ?=
 =?utf-8?B?Q2Y4UDFiM3dQQlJDWHlYWm55eTNDN3c4dVdhVHQ4c3dZQyt4eXBXT3pVT3l3?=
 =?utf-8?B?cFNxR0svSUlqbXoza0xMQW9KaC94RmpRLzZkbXNQV3BKSEpOMjI5djdNenlD?=
 =?utf-8?B?MXZ6OElHdVBwUWtSNE5lUllRTDRSS3BVZjVIUEhPRzByR3ZyczBpclpIanZC?=
 =?utf-8?B?M1pzdGRJUkRPNVRoWEt2Z2JQbXNIcXJBZlIzY2pBYW1JcC9NY3UxeHV3em9C?=
 =?utf-8?B?TWRpVUduZUFDWkxGbERsdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXpqalZ1YTFaa2ZCSG0xK0hFZmoyakxmS3FaTmo4aXhCZWhWSWNpSmZSY0VM?=
 =?utf-8?B?RHNWQ1Bjckc0dUowSUx0bEhLa2JnWmZsRHI3RVlBR3A0MXoweFFESThXaFNY?=
 =?utf-8?B?VHA0UWI5ekN1eW5lL01ERXNhRzBTVFRzWHlkYzUwa25LODhsSEJONWdPK20w?=
 =?utf-8?B?THJ4K3NaQkxuQ3EyeW12ZlF4WiswTDA2QnJNcG5xeTNmelppRWh5NGduMHI1?=
 =?utf-8?B?QUlkKzQxSHQxbGl2VUVPQXVtUDc4bWJ6eFVZR2V5clhEakVXaDVzVkd3VFhE?=
 =?utf-8?B?WE5DdFo4cm9BOWZqLy9oc0c3djZlOTIwbEZuY0FJL1FaT0hTOWdBSEpEejNx?=
 =?utf-8?B?WC9vZzErQktzSEZvd0s2UnlWbU1JYklaZjVEa0dzUE9nYlY5N1h0dCtnOHgy?=
 =?utf-8?B?RTl6akNJbTQySjNkY0RrRCt1dkw1akpBV3hjNlJadTF1eFY1R1RIMndZQXc4?=
 =?utf-8?B?T2NibnF1SWsrQzVTTE52UXVySDh0Y2pGRCtncWttZjI3eVBoeGxrU2lYZ0Vk?=
 =?utf-8?B?YTlTQytSbXg3RngyYkdxT20rckFGZk1IVmhCeHo2VWJWWDBFa3Z4VlE4Z2FG?=
 =?utf-8?B?Q0dLdVBzKzlCdERKWnRWWVZha3BRM1A4UGF3UEYwVDhoNy9VcHhVaUhOWllt?=
 =?utf-8?B?TithT0JBaTdUR3RkVXJldEM4QStQMzVwN2RUaWY2N1cvQ2hrbmpvUC9zSE9I?=
 =?utf-8?B?UnNBRWRJRE1YQTBLZ0Rva0xVdWl5MW1ZWHlUdGlmcU4xZjQrMW5WK1pEMXo5?=
 =?utf-8?B?aVZ4VTFyTG93MWJFV3NmTXBrT2ZsaHllRnpNS01UQmVTc0ZrMUlaNXVzSWx4?=
 =?utf-8?B?Nll5RHNSRkNxK2xpSW5ONnlWUkRsYnR2ek9NOWhIeE9LSUZ4dWROOGhTRkRD?=
 =?utf-8?B?eThFK1NpNHpvaG9vZStpMGVkck1aL1lYaC9KR3U2a0xDVjFlSFBjNXNWbkJz?=
 =?utf-8?B?Z1QrVFJOaVcvQnRtNzZVdFYzTWpBaXZqWURnbVBzVDhCSDIxMFhoUVRGZjlF?=
 =?utf-8?B?L2JGMjJ2MGcvWCtzV0loZzlEd3p1Smg4MDRreVIwcWpyZlArZWtBS3MwUHRH?=
 =?utf-8?B?b0VGa1h0TE5JYmVMb21NaCtjd0tvUTNRK1pJK3NtSmdxOEg5VXNZNjNIcktL?=
 =?utf-8?B?T0lvcVlRSjl5MDU1VHZNekhKZlZtNC8rSjZ4d1d5NHY2MUxSM1ZyWEx6b3Ey?=
 =?utf-8?B?SG5sVVVaWnNHR2FlQzRvbFdUUEhkTUVpVmpzR1VPaHU3Q0k3SzNBTXo2YWNX?=
 =?utf-8?B?REw3bGJBVkRWS2RjS256c3VrTHRYV1ZUVHNlelRTcGdoaHkvZHpEeXhzWXZE?=
 =?utf-8?B?RXNNMWhiaDVTTkZNaHNNL3J3NGhlc2V3ZFdFQ2VwUzhhRXhFY1h0Um5ZVE9t?=
 =?utf-8?B?YUwvaVhORGt2S1M3SHI2WG93ek85QVV5VmtQS2dGcnlTZmQ1cnE4QWtDdG54?=
 =?utf-8?B?dFQ3bnM3emxuanhoNFRGM3BnWFlNTEZRNjBoUzVwVEYzUDRWaDdoUUE5ZFR6?=
 =?utf-8?B?QTFTZ3hySVMwS0plK2dxL0xOUS9pQ2MrUG8yc0RPNUNCNDFTT2ViNXliZzc0?=
 =?utf-8?B?eFZCeis4cGlValBTM2JmTXMyc3h0OE1lNjBRM2JrSWVDYnVGK0xZajhKancx?=
 =?utf-8?B?UDZHV1ZoZ2swenh2N250MUtJVmxDdXNYYnhrTFkzS2lGTWFZTXpmL0lnZWYr?=
 =?utf-8?B?cTZiQnFhTnZYSVdKcjhGU3ZsQkhTczJCQU9IRGhjS3BtRmJxQ3FsNlNWaXZm?=
 =?utf-8?B?NlZEcTB6dDNBU3kwOFkvWlk2TElxYTVCeUlMVFZKK3pUSTZBdzlJM055MmlJ?=
 =?utf-8?B?dGJVelR3dStSTUhmK3pVVmpjSFk3cHF4VEkrYlJ6STlaZVRDck1nR3FOM1J4?=
 =?utf-8?B?Q05uRis5YzdISUtFUWlpL0U5ZzlqQ280cW9LaVFxQ2V3Tkk5SU5mbS92YmJE?=
 =?utf-8?B?VlBhSWFVc1c0bmg4Zncwd1Z2bXZ3Sm9TU1ZBY05mNWhnaUkwZXJVNUJaMWNm?=
 =?utf-8?B?b1Z4Ym1ENkdQRGs3ekJ1aGRVU1YzWDNLeVVVdzJzemZaN2dMY3p0WDdQSlEv?=
 =?utf-8?B?MndZeFU2dmRiQitYS01VVlBzcFlLZmJaVWp3Y21ZaHlIWmIyOGI5alRNWEc3?=
 =?utf-8?B?ak90ZERHRUlkSUlTMUd0NS9KZFVJdG56VHlRQ1dTUE5NTnUydU5TR3NnSXBS?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 829125a1-c6d0-4f74-caa9-08dd670de8a8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 17:45:59.3975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uh3ISsZ7CbG91hSHeHyskbZL+pmj9S2HNGTq7i4KzygzzQ/89apsfhqHUSsW/kbCF2VbMTk2rnXp40/Fuoz17P10QN0MRtg0QfT/uIO1Zqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4949
X-Authority-Analysis: v=2.4 cv=LZw86ifi c=1 sm=1 tr=0 ts=67db02e3 cx=c_pps a=smr7v+wKk2SgYJk0SwJNKg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=Twlkf-z8AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8 a=Oc9UjyKx5MfZ1AxhdC0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pDh4GxP4s1Bw4taJw8kA:9 a=2hqsGl0JsAPQF73k:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=-74SuR6ZdpOK_LpdRCUo:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: wyMtdfGhpNc5aRlQpids-OW45khad7pq
X-Proofpoint-ORIG-GUID: wdODfftVcQej3q7S5q2Jv5sGrVENesu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503190120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 17:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116098

--------------Eg7y0v0Qjw0fy08Bq4XRj8B8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52J6o1S7021106

On 2025-03-17 2:06 a.m., hongxu via lists.openembedded.org wrote:
> Refresh local patches
> - 0001-Fix-build-on-mips-clang.patch
> - 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
>
> Fix protobuf-native build failure with gcc 10
>
> Changelog:
> https://github.com/protocolbuffers/protobuf/releases/tag/v30.0
>
> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
> ---
>   .../0001-Fix-build-on-mips-clang.patch        | 26 +++++++----
>   ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 25 +++++------
>   ...buf-native-build-failure-with-gcc-10.patch | 43 ++++++++++++++++++=
+
>   ...{protobuf_4.25.5.bb =3D> protobuf_4.30.0.bb} |  5 ++-


Ping Khem:
 =C2=A0=C2=A0=C2=A0 Does that fix the ubu-20.04 problem?

Also, Hongxu, should the python package also be updated?

=E2=9D=AF fd protobuf_4
meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb

../Randy


>   4 files changed, 76 insertions(+), 23 deletions(-)
>   create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-fi=
x-protobuf-native-build-failure-with-gcc-10.patch
>   rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.5.bb =3D> pro=
tobuf_4.30.0.bb} (97%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-=
on-mips-clang.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix=
-build-on-mips-clang.patch
> index 9f6116c4c4..6db22c26d3 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips=
-clang.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips=
-clang.patch
> @@ -1,6 +1,6 @@
> -From 08e46feb6553af670754e65d94c3bb6fcd4e0cf9 Mon Sep 17 00:00:00 2001
> +From fd5a966a6385165506a1b84298465cbb9f44222d Mon Sep 17 00:00:00 2001
>   From: Khem Raj<raj.khem@gmail.com>
> -Date: Sun, 31 Oct 2021 23:39:44 -0700
> +Date: Mon, 10 Mar 2025 19:59:19 -0700
>   Subject: [PATCH] Fix build on mips/clang
>  =20
>   clang13 crashes on mips, until its fixed upstream disable tailcall on
> @@ -10,17 +10,25 @@https://bugs.llvm.org/show_bug.cgi?id=3D52367
>  =20
>   Upstream-Status: Inappropriate [Clang workaround]
>   Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Rebase to v4.30.0
> +Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>   ---
> - src/google/protobuf/port_def.inc | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + src/google/protobuf/port_def.inc | 1 +
> + 1 file changed, 1 insertion(+)
>  =20
> +diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/po=
rt_def.inc
> +index 35f49afb4..e9597af0d 100644
>   --- a/src/google/protobuf/port_def.inc
>   +++ b/src/google/protobuf/port_def.inc
> -@@ -255,6 +255,7 @@
> +@@ -222,6 +222,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
>    #error PROTOBUF_TAILCALL was previously defined
>    #endif
> - #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) && \
> + #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) && =
 \
>   +    !defined(__mips__) && \
> -     !defined(_ARCH_PPC) && !defined(__wasm__) &&                 \
> -     !(defined(_MSC_VER) && defined(_M_IX86)) &&                  \
> -     !(defined(__NDK_MAJOR__) && __NDK_MAJOR <=3D 24)
> +     !defined(_ARCH_PPC) && !defined(__wasm__) &&                     =
 \
> +     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__)
> + // Compilation fails on ARM32: b/195943306
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-M=
akefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtoo=
ls/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables=
-fix-.patch
> index 7c4bf260eb..1b68c24c96 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile=
-respect-CXX-LDFLAGS-variables-fix-.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile=
-respect-CXX-LDFLAGS-variables-fix-.patch
> @@ -1,13 +1,12 @@
> -From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2001
> +From 9d50661003d78a4debfc7eda532f0b53df51fd7c Mon Sep 17 00:00:00 2001
>   From: Martin Jansa<Martin.Jansa@gmail.com>
> -Date: Fri, 28 Jun 2019 13:50:52 +0000
> -Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix=
 build
> - with gold
> +Date: Thu, 13 Mar 2025 10:54:01 +0800
> +Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables
>  =20
>   * move pkg-config call to separate variable, so that the final versio=
n
>     of the whole command so it's shown in log.do_compile_ptest_base
>   * add ../src/google/protobuf/.libs/timestamp.pb.o when linking
> -  add_person_cpp otherwise it fails to link with gold:
> +  add_person_cpp otherwise it fails:
>     i686-oe-linux-g++  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpma=
th=3Dsse --sysroot=3Dcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -=
Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed add_person.cc addressbook.p=
b.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
>     /tmp/cccjSJQs.o:addressbook.pb.cc:scc_info_Person_addressbook_2epro=
to: error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2=
ftimestamp_2eproto'
>     /tmp/cccjSJQs.o:addressbook.pb.cc:descriptor_table_addressbook_2epr=
oto_deps: error: undefined reference to 'descriptor_table_google_2fprotob=
uf_2ftimestamp_2eproto'
> @@ -25,12 +24,14 @@ Upstream-Status: Pending
>   Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>   Signed-off-by: Leon Anavi<leon.anavi@konsulko.com>
>  =20
> +Rebase to v4.30.0
> +Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>   ---
>    examples/Makefile | 6 ++++--
>    1 file changed, 4 insertions(+), 2 deletions(-)
>  =20
>   diff --git a/examples/Makefile b/examples/Makefile
> -index ef7a4ef58..7206e14e1 100644
> +index 5290fdb03f..3b9545bf2a 100644
>   --- a/examples/Makefile
>   +++ b/examples/Makefile
>   @@ -2,6 +2,8 @@
> @@ -42,20 +43,20 @@ index ef7a4ef58..7206e14e1 100644
>    all: cpp java python
>   =20
>    cpp:    add_person_cpp    list_people_cpp
> -@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
> +@@ -46,11 +48,11 @@ protoc_middleman_ruby: addressbook.proto
>   =20
>    add_person_cpp: add_person.cc protoc_middleman
>    	pkg-config --cflags protobuf  # fails if protobuf is not installed
> --	c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o add_person_cpp `=
pkg-config --cflags --libs protobuf`
> -+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp=
.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(CX=
X) -std=3Dc++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person=
_cpp
> +-	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --=
cflags --libs protobuf`
> ++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp=
.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
>   =20
>    list_people_cpp: list_people.cc protoc_middleman
>    	pkg-config --cflags protobuf  # fails if protobuf is not installed
> --	c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o list_people_cpp=
 `pkg-config --cflags --libs protobuf`
> -+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp=
.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$(=
CXX) -std=3Dc++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_pe=
ople_cpp
> +-	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config =
--cflags --libs protobuf`
> ++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp=
.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
>   =20
>    add_person_dart: add_person.dart protoc_middleman_dart
>   =20
> ---
> +--
>   2.34.1
>  =20
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protob=
uf-native-build-failure-with-gcc-10.patch b/meta-oe/recipes-devtools/prot=
obuf/protobuf/0001-fix-protobuf-native-build-failure-with-gcc-10.patch
> new file mode 100644
> index 0000000000..d7c9f38eff
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf-nati=
ve-build-failure-with-gcc-10.patch
> @@ -0,0 +1,43 @@
> +From 03dabf4b153071ec1bdcd2c278461984cc6f1714 Mon Sep 17 00:00:00 2001
> +From: Khem Raj<raj.khem@gmail.com>
> +Date: Mon, 17 Mar 2025 13:28:13 +0800
> +Subject: [PATCH] fix protobuf-native build failure with gcc 10
> +
> +Build protobuf-native failed on ubuntu 20.04 which has gcc 10
> +
> +protobuf-native/4.30.0/git/src/google/protobuf/port_def.inc:105:48:
> +error: static assertion failed: Protobuf only supports C+
> +   =E2=86=AA +17 and newer.
> +   |   105 | #define PROTOBUF_CPLUSPLUS_MIN(x) (__cplusplus >=3D x)
> +   |       |                                   ~~~~~~~~~~~~~^~~~~
> +   | /home/kraj01/yoe/build/tmp/work/x86_64-linux/protobuf-native/4.30=
.0/git/src/google/protobuf/port_def.inc:119:15:
> +note: in expansion of macro =E2=80=98PROTOBUF_CPLUSPLUS_MIN=E2=80=99
> +   |   119 | static_assert(PROTOBUF_CPLUSPLUS_MIN(201703L),
> +   |       |               ^~~~~~~~~~~~~~~~~~~~~~
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
> +---
> + CMakeLists.txt | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index ae3c324..eda19aa 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -14,6 +14,10 @@ endif()
> + # Project
> + project(protobuf C CXX)
> +
> ++set(CMAKE_CXX_STANDARD 17)
> ++set(CMAKE_CXX_STANDARD_REQUIRED ON)
> ++set(CMAKE_CXX_EXTENSIONS OFF)
> ++
> + if(protobuf_DEPRECATED_CMAKE_SUBDIRECTORY_USAGE)
> +   if(CMAKE_PROJECT_NAME STREQUAL "protobuf")
> +     get_filename_component(CMAKE_SOURCE_DIR ${CMAKE_SOURCE_DIR} DIREC=
TORY)
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/met=
a-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> similarity index 97%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> index a470a7c643..0d6123dfa0 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
> @@ -14,11 +14,12 @@ LIC_FILES_CHKSUM =3D " \
>   DEPENDS =3D "zlib abseil-cpp jsoncpp"
>   DEPENDS:append:class-target =3D " protobuf-native"
>  =20
> -SRCREV =3D "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
> +SRCREV =3D "d295af5c3002c08e1bfd9d7f9e175d0a4d015f1e"
>  =20
> -SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D25=
.x;protocol=3Dhttps \
> +SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D30=
.x;protocol=3Dhttps \
>              file://run-ptest \
>              file://0001-examples-Makefile-respect-CXX-LDFLAGS-variable=
s-fix-.patch \
> +file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch \
>              "
>   SRC_URI:append:mips:toolchain-clang =3D" file://0001-Fix-build-on-mip=
s-clang.patch "
>   SRC_URI:append:mipsel:toolchain-clang =3D" file://0001-Fix-build-on-m=
ips-clang.patch "
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116020):https://lists.openembedded.org/g/openembedd=
ed-devel/message/116020
> Mute This Topic:https://lists.openembedded.org/mt/111744582/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------Eg7y0v0Qjw0fy08Bq4XRj8B8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52J6o1S7021106

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-03-17 2:06 a.m., hongxu via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20250317060612.4111152-1-hongxu=
.jia@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">Refresh local patches
- 0001-Fix-build-on-mips-clang.patch
- 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch

Fix protobuf-native build failure with gcc 10

Changelog:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/protocolbuf=
fers/protobuf/releases/tag/v30.0">https://github.com/protocolbuffers/prot=
obuf/releases/tag/v30.0</a>

Signed-off-by: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 .../0001-Fix-build-on-mips-clang.patch        | 26 +++++++----
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 25 +++++------
 ...buf-native-build-failure-with-gcc-10.patch | 43 +++++++++++++++++++
 ...{protobuf_4.25.5.bb =3D&gt; protobuf_4.30.0.bb} |  5 ++-</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Ping Khem:<br>
      &nbsp;&nbsp;&nbsp; Does that fix the ubu-20.04 problem?<br>
      <br>
      Also, Hongxu, should the python package also be updated?<br>
      <br>
      =E2=9D=AF fd protobuf_4<br>
      meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb<br>
      meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20250317060612.4111152-1-hongxu=
.jia@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
 4 files changed, 76 insertions(+), 23 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-p=
rotobuf-native-build-failure-with-gcc-10.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.5.bb =3D&gt; pro=
tobuf_4.30.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on=
-mips-clang.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-b=
uild-on-mips-clang.patch
index 9f6116c4c4..6db22c26d3 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-c=
lang.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-c=
lang.patch
@@ -1,6 +1,6 @@
-From 08e46feb6553af670754e65d94c3bb6fcd4e0cf9 Mon Sep 17 00:00:00 2001
+From fd5a966a6385165506a1b84298465cbb9f44222d Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raj.khe=
m@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
-Date: Sun, 31 Oct 2021 23:39:44 -0700
+Date: Mon, 10 Mar 2025 19:59:19 -0700
 Subject: [PATCH] Fix build on mips/clang
=20
 clang13 crashes on mips, until its fixed upstream disable tailcall on
@@ -10,17 +10,25 @@ <a class=3D"moz-txt-link-freetext" href=3D"https://bu=
gs.llvm.org/show_bug.cgi?id=3D52367">https://bugs.llvm.org/show_bug.cgi?i=
d=3D52367</a>
=20
 Upstream-Status: Inappropriate [Clang workaround]
 Signed-off-by: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+
+Rebase to v4.30.0
+Signed-off-by: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
 ---
- src/google/protobuf/port_def.inc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ src/google/protobuf/port_def.inc | 1 +
+ 1 file changed, 1 insertion(+)
=20
+diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/port=
_def.inc
+index 35f49afb4..e9597af0d 100644
 --- a/src/google/protobuf/port_def.inc
 +++ b/src/google/protobuf/port_def.inc
-@@ -255,6 +255,7 @@
+@@ -222,6 +222,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
  #error PROTOBUF_TAILCALL was previously defined
  #endif
- #if __has_cpp_attribute(clang::musttail) &amp;&amp; !defined(__arm__) &=
amp;&amp; \
+ #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) &amp;&amp; !defined(__arm_=
_) &amp;&amp;  \
 +    !defined(__mips__) &amp;&amp; \
-     !defined(_ARCH_PPC) &amp;&amp; !defined(__wasm__) &amp;&amp;       =
          \
-     !(defined(_MSC_VER) &amp;&amp; defined(_M_IX86)) &amp;&amp;        =
          \
-     !(defined(__NDK_MAJOR__) &amp;&amp; __NDK_MAJOR &lt;=3D 24)
+     !defined(_ARCH_PPC) &amp;&amp; !defined(__wasm__) &amp;&amp;       =
               \
+     !(defined(_MSC_VER) &amp;&amp; defined(_M_IX86)) &amp;&amp; !define=
d(__i386__)
+ // Compilation fails on ARM32: b/195943306
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Mak=
efile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools=
/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch
index 7c4bf260eb..1b68c24c96 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
@@ -1,13 +1,12 @@
-From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2001
+From 9d50661003d78a4debfc7eda532f0b53df51fd7c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Mar=
tin.Jansa@gmail.com">&lt;Martin.Jansa@gmail.com&gt;</a>
-Date: Fri, 28 Jun 2019 13:50:52 +0000
-Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix b=
uild
- with gold
+Date: Thu, 13 Mar 2025 10:54:01 +0800
+Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables
=20
 * move pkg-config call to separate variable, so that the final version
   of the whole command so it's shown in log.do_compile_ptest_base
 * add ../src/google/protobuf/.libs/timestamp.pb.o when linking
-  add_person_cpp otherwise it fails to link with gold:
+  add_person_cpp otherwise it fails:
   i686-oe-linux-g++  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3D=
sse --sysroot=3Dcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,-O=
1 -Wl,--hash-style=3Dgnu -Wl,--as-needed add_person.cc addressbook.pb.cc =
-o add_person_cpp `pkg-config --cflags --libs protobuf`
   /tmp/cccjSJQs.o:addressbook.pb.cc:scc_info_Person_addressbook_2eproto:=
 error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2fti=
mestamp_2eproto'
   /tmp/cccjSJQs.o:addressbook.pb.cc:descriptor_table_addressbook_2eproto=
_deps: error: undefined reference to 'descriptor_table_google_2fprotobuf_=
2ftimestamp_2eproto'
@@ -25,12 +24,14 @@ Upstream-Status: Pending
 Signed-off-by: Martin Jansa <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:Martin.Jansa@gmail.com">&lt;Martin.Jansa@gmail.com&gt;</a>
 Signed-off-by: Leon Anavi <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
=20
+Rebase to v4.30.0
+Signed-off-by: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
 ---
  examples/Makefile | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
=20
 diff --git a/examples/Makefile b/examples/Makefile
-index ef7a4ef58..7206e14e1 100644
+index 5290fdb03f..3b9545bf2a 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -2,6 +2,8 @@
@@ -42,20 +43,20 @@ index ef7a4ef58..7206e14e1 100644
  all: cpp java python
 =20
  cpp:    add_person_cpp    list_people_cpp
-@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
+@@ -46,11 +48,11 @@ protoc_middleman_ruby: addressbook.proto
 =20
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pk=
g-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(CXX)=
 -std=3Dc++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_c=
pp
+-	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cf=
lags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
 =20
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o list_people_cpp `=
pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$(CX=
X) -std=3Dc++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_peop=
le_cpp
+-	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --=
cflags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
 =20
  add_person_dart: add_person.dart protoc_middleman_dart
 =20
---
+--=20
 2.34.1
=20
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf=
-native-build-failure-with-gcc-10.patch b/meta-oe/recipes-devtools/protob=
uf/protobuf/0001-fix-protobuf-native-build-failure-with-gcc-10.patch
new file mode 100644
index 0000000000..d7c9f38eff
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf-native=
-build-failure-with-gcc-10.patch
@@ -0,0 +1,43 @@
+From 03dabf4b153071ec1bdcd2c278461984cc6f1714 Mon Sep 17 00:00:00 2001
+From: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raj.khe=
m@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+Date: Mon, 17 Mar 2025 13:28:13 +0800
+Subject: [PATCH] fix protobuf-native build failure with gcc 10
+
+Build protobuf-native failed on ubuntu 20.04 which has gcc 10
+
+protobuf-native/4.30.0/git/src/google/protobuf/port_def.inc:105:48:
+error: static assertion failed: Protobuf only supports C+
+   =E2=86=AA +17 and newer.
+   |   105 | #define PROTOBUF_CPLUSPLUS_MIN(x) (__cplusplus &gt;=3D x)
+   |       |                                   ~~~~~~~~~~~~~^~~~~
+   | /home/kraj01/yoe/build/tmp/work/x86_64-linux/protobuf-native/4.30.0=
/git/src/google/protobuf/port_def.inc:119:15:
+note: in expansion of macro =E2=80=98PROTOBUF_CPLUSPLUS_MIN=E2=80=99
+   |   119 | static_assert(PROTOBUF_CPLUSPLUS_MIN(201703L),
+   |       |               ^~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+Signed-off-by: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+---
+ CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ae3c324..eda19aa 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -14,6 +14,10 @@ endif()
+ # Project
+ project(protobuf C CXX)
+=20
++set(CMAKE_CXX_STANDARD 17)
++set(CMAKE_CXX_STANDARD_REQUIRED ON)
++set(CMAKE_CXX_EXTENSIONS OFF)
++
+ if(protobuf_DEPRECATED_CMAKE_SUBDIRECTORY_USAGE)
+   if(CMAKE_PROJECT_NAME STREQUAL &quot;protobuf&quot;)
+     get_filename_component(CMAKE_SOURCE_DIR ${CMAKE_SOURCE_DIR} DIRECTO=
RY)
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
index a470a7c643..0d6123dfa0 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
@@ -14,11 +14,12 @@ LIC_FILES_CHKSUM =3D &quot; \
 DEPENDS =3D &quot;zlib abseil-cpp jsoncpp&quot;
 DEPENDS:append:class-target =3D &quot; protobuf-native&quot;
=20
-SRCREV =3D &quot;9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014&quot;
+SRCREV =3D &quot;d295af5c3002c08e1bfd9d7f9e175d0a4d015f1e&quot;
=20
-SRC_URI =3D &quot;git://github.com/protocolbuffers/protobuf.git;branch=3D=
25.x;protocol=3Dhttps \
+SRC_URI =3D &quot;git://github.com/protocolbuffers/protobuf.git;branch=3D=
30.x;protocol=3Dhttps \
            <a class=3D"moz-txt-link-freetext" href=3D"file://run-ptest">=
file://run-ptest</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-exampl=
es-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch">file://0001-example=
s-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-fix-pr=
otobuf-native-build-failure-with-gcc-10.patch">file://0001-fix-protobuf-n=
ative-build-failure-with-gcc-10.patch</a> \
            &quot;
 SRC_URI:append:mips:toolchain-clang =3D <a class=3D"moz-txt-link-rfc2396=
E" href=3D"file://0001-Fix-build-on-mips-clang.patch">&quot; file://0001-=
Fix-build-on-mips-clang.patch &quot;</a>
 SRC_URI:append:mipsel:toolchain-clang =3D <a class=3D"moz-txt-link-rfc23=
96E" href=3D"file://0001-Fix-build-on-mips-clang.patch">&quot; file://000=
1-Fix-build-on-mips-clang.patch &quot;</a>
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#116020): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/116020">https:=
//lists.openembedded.org/g/openembedded-devel/message/116020</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/111744582/3616765">https://lists.openembedded.org/mt=
/111744582/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Eg7y0v0Qjw0fy08Bq4XRj8B8--

