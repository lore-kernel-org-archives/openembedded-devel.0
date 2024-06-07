Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82513C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 07:56:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.36585.1717746992648421975
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jun 2024 00:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6888c8ef97=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4574jHKn001757
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Jun 2024 00:56:32 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfxwyx47y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 00:56:31 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4577uVpD018043;
	Fri, 7 Jun 2024 00:56:31 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfxwyx47x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 00:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3iOwEcquQnglLD/cVgeFIx/3XiUokiGPARb2yWyQOwoR6OfLpUIUnaX/l3LBir8k1g9BhZOuK/483sfJb/PV483ybkjBnJaTYleEgCrTyPOTilu4/6ONTnE/Ko/ktxyxW7wlLfMppacK9P4I/n+VM2T4At9kFbJz72y6hFP1E1b4zoc47X7chWqxRIV3YAQIMEfHyVs53JyicepdUYc8G3UbEd6DJdukNMTCdTC7lX6N9ax2tyEvAZz0vEXCUdnyGJcVg6BCs3tcTF37oJ6l57TjOpz+HipBoCKOcW/o7Z1Zfo6DDpr2/Lhs1ryIlDcIRrKjcp7bK9rTkDxeAVjJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPXe3t2Vtf4A89cmM8OrlXbUcb3z8t8Dymzrh4aulg4=;
 b=OC4x5usu1UylofiN6g2wg6zC/rJ5QUhaoeFGF6x6PDNSdwaA2UZFYz+/Rb3/g8C0vMV++rufFaGjYSs9S+JLWSG3tXBP7EQZjSah5q/zV5gSH6CuQ9CIl9BuRdPuvLHlIscMNCqR6mT9/wGAbvMiUXffRgVSwn18DaJv5rAt4nyBzmwvj22O2bX8Yao/7JKeESwLR9ohpwPYVHc8O3pTSPJZKfNG9VxpQbXkIf/CroBvUjVES3vMB9ho6TcwA8rnYPWQM4HI6Xk8oWB0ApUlhEev4JqOnTvjanDPtjdE/CgCmYtTbVFcffVu0nGuqZgG6hBCYh4AKnXz5XfproPpyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by CH3PR11MB8520.namprd11.prod.outlook.com (2603:10b6:610:1af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 07:56:27 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 07:56:26 +0000
Message-ID: <b3b42523-5dfa-44ba-a50f-e3bc0904fa95@windriver.com>
Date: Fri, 7 Jun 2024 15:56:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/4] uw-imap: fix compile errors of
 incompatible pointer type
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240606162307.972946-1-kai.kang@windriver.com>
 <20240606162307.972946-2-kai.kang@windriver.com>
 <CAMKF1sq_k6mYr5bp5J0kt0UO14wbtKyUeBox3iZkuZ9Vj6ztFg@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1sq_k6mYr5bp5J0kt0UO14wbtKyUeBox3iZkuZ9Vj6ztFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::13) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|CH3PR11MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: dd427cc7-3bec-45c3-64bd-08dc86c7553b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MG5NQS82MVFSZTdOclM0QW9TanB4SHFxbTF5alFYWUp5NzFpT2FPWlA1cHhy?=
 =?utf-8?B?Mlk5bUVINGV1Wkljdk1tcnVBeE5LRFppNjFBdnBWbWxyYTJDeTdBZG1ZWXJZ?=
 =?utf-8?B?MzNXVTBxUDJMdkg4akw0Y3JFYlpJRDBNeHZka2JlRFVBeU43VDR2ZExuK3pv?=
 =?utf-8?B?SWdiejNUZkxmM3VYWVNZZHMyMVNyaUpIS3hPVHlaSzNKNFlQbFBVSnVOZHgz?=
 =?utf-8?B?WGI4N0RYN09JTFYrUDA1UFcyclVQMDZheVJ5Tm5hSjZDMit0WS9kN1haeUho?=
 =?utf-8?B?dEQwa0RoRXUwKzkwQXdJZXdKclZGTDk1SkkxdEV5SHpYaGFwYS9QSkUvZjJU?=
 =?utf-8?B?eDVEaHFWemZBQ2phdXhmTlc1VW13RG5rbVBBdlJHT3J5RFd2c1UyTjErSm5O?=
 =?utf-8?B?UHFwQTdFK1lQaklwOWFDbzBRRDJhZVhLT1ovaHJTazA1dkYrTEN0VHZ6WWJt?=
 =?utf-8?B?MEl1Ymdyc3I1d2ZqalJUbzJXQ1Q0MDdHZUg5c3JaWHljK0UrRVpjRUJDaTAv?=
 =?utf-8?B?NHRuZ2E0MWkrYXZ0QkpjN1dGWElaM0UxcXRuQmxwanExTHNSZGo2VW5BdlJj?=
 =?utf-8?B?QysraERTeHBsY09Da0lRYUhpQzVGdzVHWU1kR3dLRHB3SUYvWHJNTHIvUURi?=
 =?utf-8?B?Mm1CWjNhcEhxNUJZMkFVR2tud21FaG5kU1hTY25lSStWVit3YVgwRi9sWmpn?=
 =?utf-8?B?ejVqMTRWTENiejFQM0pXdU9Qdk15YTluVjNqcXIxcG52bmpNbmZNVzRaMkFZ?=
 =?utf-8?B?SnNwaTlHZFcrSE1VMi96K25LZ0NldjBVS2tWcU1xNDFwOUtLMHdHeld3b1hB?=
 =?utf-8?B?WDBjeVMrdTI4SmZzVytNcnhBZVZ1QTgzbmpmTmUxSXZ0cmZ2akZ0SUV4MTBt?=
 =?utf-8?B?Q0g3WlVlK3d2YXE2VERBbU5kcVU0dnc1QUUzMW5EbEYrMk4rMlBvejRoRUlG?=
 =?utf-8?B?bldxcDJzRlhiR1htQU9lT2p5Sk5lRTFBRkVBTDlCcE8reGZpWFUzUW0yUCt2?=
 =?utf-8?B?ZndXcStkRXBmaXpyVHhsZTlPeUplNkJGWEl1ejhYRURIYWpuNjVtMUFxSTdV?=
 =?utf-8?B?QWV2MXExK1M5RDBDbGVBL1ZlZ1g5UG1WUTVwdmhTSTNsNTRxQ0hZUk5tQWJS?=
 =?utf-8?B?STBtNWlpc204aENuaDBraHdIcDVUcVlFRVlLUnQxREVzUU04cExwc2tRc09y?=
 =?utf-8?B?bTlHM3gxYVZZNXp6ckVUeldtaTFNOHU1QjFybW9kZTNXZ1IwL2hIUi9ZNTh0?=
 =?utf-8?B?NzhoOFhaNlNpdWlwQ0VhdWg1aXltemZXUzl3cjRPWjY0cWtXZklkSCtCV256?=
 =?utf-8?B?cFlwb1F0aEE2WFBsTmtNa3gvWkJpTnhINEw4R2Zmdm5Zbmd5dXhoT3R4T1E4?=
 =?utf-8?B?V3VTVFpheEJyM2tRdk4vK21TSG5DSDNUWS9nT05SOFlXQnRGbnl6eHRHY3Fp?=
 =?utf-8?B?TWErTGd0ZXpyVTR5eEk2cTZaeDB4YXl5dGV5ZHNFb2I3NHkrSzQ1VW1hd1BR?=
 =?utf-8?B?NmVZbTlacHJ5bkE5ckQ4cU9HTXZOQlVFQ1RjalA1NlFkb1d6TjdUVkZZTFZM?=
 =?utf-8?B?REUrZzJ5MlUzbnhWaGJMcmtIWmd1czVEZmNXODdyWUxRZVBDdkRlc21PRjdB?=
 =?utf-8?B?WjlTMEdRRWJ1RVREM0JNT1F2Q254RXBSMXVJK3g2VGpiTVJRU0Z5c0VMTGwz?=
 =?utf-8?B?cE1vOFQ4Vk9hTXg4M21ia2FXQUpydDdJQXRqZzFoQVZsTktQNDBYVUtnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2lJaXg5MGY1Y1BwTFZHWjdIaHAxdGJYQTRJUVR2OENnelhtWEIrblUxODNi?=
 =?utf-8?B?UWJvUFc4MkdPTnJYaEhTZzFxaDRDWVhUdGVlU0dqSDVZakgvZEVOUFZWN0tN?=
 =?utf-8?B?Mjgvbk9ubWUvQjR5NkJkNGMyaTlvNm1XRE11K2FMbEx0OXBzMDNUNzVNUFl4?=
 =?utf-8?B?VlFuUWVPVG41Q3pETmdPdElNY2pKMEVHYXpiN0JOc2orVmtvRGZ1eVdaOVFG?=
 =?utf-8?B?UVd1bWovYmV5ZDh6ZDJtZDV5K2thYjlHcUc5clpSWWl4RWQ2NEF5QlpDNDV4?=
 =?utf-8?B?L21QMm5VN1hHYlRscEloNllkSStUbXBHaFZDUTc4Q3gvSUhsNDY0WitDVkZL?=
 =?utf-8?B?NkNONFBieG9FYVIrWTZ0YUhJNTkzdytibjhPSERRR2VrZlRWeUlveGtRVVpj?=
 =?utf-8?B?YTNsTTd4dWJVYVFKUGEzczB4NnlkQW13V3BlaDVJalhMeDFpMW5abmxLMzlz?=
 =?utf-8?B?cWhQbm5NMktrZDlCLzE3T3BycXRhYUgzM0tiMEhvcGJ6YW11eTIxc3U0T3lJ?=
 =?utf-8?B?VEhxQnY2NGVacytYU2JGcDJlRWh2Q055d084Y2x0Z2NRWm0rczlwSUlXOGRZ?=
 =?utf-8?B?akJCV2ZKYk5wamFlR2Y0RyszN0FVVFM3SVc5MGZKa1lueHhkNEhHUGVwSUdE?=
 =?utf-8?B?ZFBoTHZoNkFSczE1WVVDWnhVdjBQT3k4Y000dlhNWTFkYmFpWk5tSjRRWFk4?=
 =?utf-8?B?RU56WU91MG5pY2Z6MzN6UHhsN3JPd1RYZGJkNHA3U29wT1ZWMldqc00rRkd6?=
 =?utf-8?B?VXpocmNhN3cvRVVObGdLMXhxcFlDL1BkUkN4RFJQUDJ6OFVvdlA5TTN1TEor?=
 =?utf-8?B?THlvN0VWZzlLSGVXV3BrUVlydTY2bUJkTDlRdXd5M0xhSWNaUXpEaTdCWnNy?=
 =?utf-8?B?a3VYQkhWN3R1WUxPUllQSm9QckZGaVV3blgycnJvMDJzbXJ3bHI0aFFzRE85?=
 =?utf-8?B?ZHVnb1ZQSTNVU05HU29yVnpsNk56cFpESGp6SEdGU2kxOGc5UWx1dlppUjVK?=
 =?utf-8?B?M2lTRWdhTDNFU3h4NGlWZjdWcTNWS3JucU1vaUpacGwyOGR3R0ZaZU90ZFNr?=
 =?utf-8?B?d2d0M0lUVDRkNkFyRXdxbGVaR0ZMRUpLNk81VkhUbzZyN2tjZ3Zza3A2WGZm?=
 =?utf-8?B?bE9TR1RBSXNCQndKV2RZSFJOT0U4c1VVVllUcVVtc0FHUXNxUnE4VTB1RVZX?=
 =?utf-8?B?Ymtoenc4SUJLRVoxMHZ6UUtLYVpmYXJiaS9PK2NEbjlOVVZPTFBSWnpvL3Jj?=
 =?utf-8?B?ZFY2S2VXdXBYVlZlVFVFZjBFMHNyRDI4VklDSU5KdlNaMHlBZ2RnM2xMbUU5?=
 =?utf-8?B?c3RsR3ZpeEgzNEtRUEZmaklid1p6dHJlcTNmSEpVNnpHZ1BuUElxYnZWd3lK?=
 =?utf-8?B?Qkd4YUVwUE9jdktDMW9mYy9UZkJQT3JUY1VQRVlRQ29nV0RFQmV2dm1xSURm?=
 =?utf-8?B?V2VweWE5OGsvMXRkYmFyekxYbk5pbXVNcW53anliZDZaZThNOFZ4RS9NU3JF?=
 =?utf-8?B?QzZjaVVEdFpYWDVrWFp2elBSTFFYcm5mR0h6VmVXdVBhUWM4dG54Ny9zbWJy?=
 =?utf-8?B?cy9PTmhNNVNLdmZyN0EvaFowOHFLWkhJOXk4aTIvNE9MWmVKWSttVFlBbFZW?=
 =?utf-8?B?ZkMrdTU1S0wrUlQ3RTFSa0Nsd05GVXE2blJqZ29QVGJvOERmcjdsNTNOT0pI?=
 =?utf-8?B?OVd6cks5aGRaTjk1cE9Lbm1HZGlFMk9GektJQ0ZnTXcvMDU2c0lXNnByMmRo?=
 =?utf-8?B?c0hJUnp2eTdiZTErSXJYc09pRWRBS20zenRucUl0VTNhSDNoamxVY3BDTUxH?=
 =?utf-8?B?L0VObm0xSm5HMVcwSVVXMmU3UW5NYkIrdnJLWEVGMHpWWG9peHBodks4UGVQ?=
 =?utf-8?B?YzlDc0h3TWoyVkE3VUg4QUZBcnM5eUd3UGZvMDZLbmxUWkw0UmNkNDJNZmJp?=
 =?utf-8?B?d2VxUFhIcUNqd2dzemJ0Vk4xZUFSNWpacC9NckNxTEwzV2NZdVRsbWlMYkRn?=
 =?utf-8?B?M2pvYXB5TTF3M3NEd1ZjMHF2ZUVmdTBVdjljZGVELy9oc05QZURPTFhNeTJI?=
 =?utf-8?B?bFJqUlZYRkttdzg5ZzN2T0ZwdVBodkpKamQyMlNvRENIOWFXOWlaRUQxVDlR?=
 =?utf-8?Q?GBKVhgPOVCYIW0+Vd45XoqJey?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd427cc7-3bec-45c3-64bd-08dc86c7553b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 07:56:26.8908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNVeKaeYLxwRmxjWkKO4RZ/1UuF/dn1BgguWCVQmxAiXhgEIjrl90s+cBI1lQyvJ8y5vUu0SpT8J74C51GuxEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8520
X-Proofpoint-GUID: YmLBrpQQkSlKCAQEbEpUsBQYZDHIGh9P
X-Proofpoint-ORIG-GUID: 8bInMCIDkc3Vecnpws0hp19G36v4JcnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2405170001 definitions=main-2406070055
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4574jHKn001757
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 07:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110762

On 6/7/24 00:29, Khem Raj wrote:
> this patch is good cleanup patch please submit it upstream as well.

It seems uw-imap project has been stalled and no upstream to submit.=20
Other uw-imap
patches have 'Pending' status too.

Regards,
Kai

>
> On Thu, Jun 6, 2024 at 9:23=E2=80=AFAM Kai Kang via lists.openembedded.=
org
> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Fix compile errors when gcc option '-Wincompatible-pointer-types' set:
>>
>> mx.c: In function 'mx_setdate':
>> mx.c:1286:15: error: passing argument 2 of 'utime' from incompatible p=
ointer type [-Wincompatible-pointer-types]
>>   1286 |   utime (file,tp);              /* set the times */
>>        |               ^~
>>        |               |
>>        |               time_t * {aka long int *}
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   ...-imap-fix-incompatible-pointer-types.patch | 354 ++++++++++++++++=
++
>>   .../recipes-devtools/uw-imap/uw-imap_2007f.bb |   1 +
>>   2 files changed, 355 insertions(+)
>>   create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-=
fix-incompatible-pointer-types.patch
>>
>> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-inco=
mpatible-pointer-types.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/u=
w-imap-fix-incompatible-pointer-types.patch
>> new file mode 100644
>> index 000000000..7146fbbeb
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-incompatibl=
e-pointer-types.patch
>> @@ -0,0 +1,354 @@
>> +Fix compile errors when gcc option '-Wincompatible-pointer-types' set=
:
>> +
>> +mx.c: In function 'mx_setdate':
>> +mx.c:1286:15: error: passing argument 2 of 'utime' from incompatible =
pointer type [-Wincompatible-pointer-types]
>> + 1286 |   utime (file,tp);              /* set the times */
>> +      |               ^~
>> +      |               |
>> +      |               time_t * {aka long int *}
>> +
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +---
>> + src/osdep/unix/mbx.c       |  12 ++++++------
>> + src/osdep/unix/mh.c        |   2 +-
>> + src/osdep/unix/mmdf.c      |  10 +++++-----
>> + src/osdep/unix/mtx.c       |  16 ++++++++--------
>> + src/osdep/unix/mx.c        |   2 +-
>> + src/osdep/unix/tenex.c     |  16 ++++++++--------
>> + src/osdep/unix/unix.c      |  10 +++++-----
>> + 7 files changed, 34 insertions(+), 34 deletions(-)
>> +
>> +diff --git a/src/osdep/unix/mbx.c b/src/osdep/unix/mbx.c
>> +index c8a45a5..0a587fe 100644
>> +--- a/src/osdep/unix/mbx.c
>> ++++ b/src/osdep/unix/mbx.c
>> +@@ -302,7 +302,7 @@ int mbx_isvalid (MAILSTREAM **stream,char *name,c=
har *tmp,int *ld,char *lock,
>> +     if (sbuf.st_ctime > sbuf.st_atime) {
>> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
>> +       tp[1] =3D sbuf.st_mtime;
>> +-      utime (tmp,tp);         /* set the times */
>> ++      utime (tmp, (const struct utimbuf *)tp);                /* set=
 the times */
>> +     }
>> +   }
>> +                               /* in case INBOX but not mbx format */
>> +@@ -776,7 +776,7 @@ void mbx_flag (MAILSTREAM *stream,char *sequence,=
char *flag,long flags)
>> +        stream->user_flags[LOCAL->ffuserflag]) || (oldpid !=3D LOCAL-=
>lastpid))
>> +       mbx_update_header (stream);
>> +     tp[0] =3D time (0);         /* make sure read comes after all th=
at */
>> +-    utime (stream->mailbox,tp);
>> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
>> +   }
>> +   if (LOCAL->ld >=3D 0) {               /* unlock now */
>> +     unlockfd (LOCAL->ld,LOCAL->lock);
>> +@@ -1075,7 +1075,7 @@ long mbx_copy (MAILSTREAM *stream,char *sequenc=
e,char *mailbox,long options)
>> +                               /* else preserve \Marked status */
>> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : t=
ime(0);
>> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
>> +-  utime (file,tp);            /* set the times */
>> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
>> +   close (fd);                 /* close the file */
>> +   MM_NOCRITICAL (stream);     /* release critical */
>> +   unlockfd (ld,lock);         /* release exclusive parse/append perm=
ission */
>> +@@ -1213,7 +1213,7 @@ long mbx_append (MAILSTREAM *stream,char *mailb=
ox,append_t af,void *data)
>> +                               /* else preserve \Marked status */
>> +     else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime :=
 time(0);
>> +     tp[1] =3D sbuf.st_mtime;    /* preserve mtime */
>> +-    utime (file,tp);          /* set the times */
>> ++    utime (file, (const struct utimbuf *)tp);         /* set the tim=
es */
>> +     fclose (df);              /* close the file */
>> +     MM_NOCRITICAL (dstream);  /* release critical */
>> +   }
>> +@@ -1446,7 +1446,7 @@ long mbx_parse (MAILSTREAM *stream)
>> +     time_t tp[2];
>> +     tp[0] =3D time (0);
>> +     tp[1] =3D LOCAL->filetime;
>> +-    utime (stream->mailbox,tp);
>> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
>> +   }
>> +   stream->silent =3D silent;    /* can pass up events now */
>> +   mail_exists (stream,nmsgs); /* notify upper level of new mailbox s=
ize */
>> +@@ -1814,7 +1814,7 @@ unsigned long mbx_rewrite (MAILSTREAM *stream,u=
nsigned long *reclaimed,
>> +   fstat (LOCAL->fd,&sbuf);    /* get new write time */
>> +   tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>> +   tp[0] =3D time (0);           /* reset atime to now */
>> +-  utime (stream->mailbox,tp);
>> ++  utime (stream->mailbox, (const struct utimbuf *)tp);
>> +   unlockfd (ld,lock);         /* release exclusive parse/append perm=
ission */
>> +                               /* notify upper level of new mailbox s=
ize */
>> +   mail_exists (stream,stream->nmsgs);
>> +diff --git a/src/osdep/unix/mh.c b/src/osdep/unix/mh.c
>> +index 9264624..26f3539 100644
>> +--- a/src/osdep/unix/mh.c
>> ++++ b/src/osdep/unix/mh.c
>> +@@ -1279,5 +1279,5 @@ void mh_setdate (char *file,MESSAGECACHE *elt)
>> +   time_t tp[2];
>> +   tp[0] =3D time (0);           /* atime is now */
>> +   tp[1] =3D mail_longdate (elt);        /* modification time */
>> +-  utime (file,tp);            /* set the times */
>> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
>> + }
>> +diff --git a/src/osdep/unix/mmdf.c b/src/osdep/unix/mmdf.c
>> +index e962434..c0adbee 100644
>> +--- a/src/osdep/unix/mmdf.c
>> ++++ b/src/osdep/unix/mmdf.c
>> +@@ -379,7 +379,7 @@ long mmdf_isvalid (char *name,char *tmp)
>> +       if ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.s=
t_atime)) {
>> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
>> +       tp[1] =3D sbuf.st_mtime;
>> +-      utime (file,tp);        /* set the times */
>> ++      utime (file, (const struct utimbuf *)tp);       /* set the tim=
es */
>> +       }
>> +     }
>> +   }
>> +@@ -1131,7 +1131,7 @@ long mmdf_copy (MAILSTREAM *stream,char *sequen=
ce,char *mailbox,long options)
>> +   else tp[0] =3D                        /* else preserve \Marked sta=
tus */
>> +        ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.st_=
atime)) ?
>> +        sbuf.st_atime : tp[1];
>> +-  utime (file,tp);            /* set the times */
>> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
>> +   mmdf_unlock (fd,NIL,&lock); /* unlock and close mailbox */
>> +   if (tstream) {              /* update last UID if we can */
>> +     MMDFLOCAL *local =3D (MMDFLOCAL *) tstream->local;
>> +@@ -1292,7 +1292,7 @@ long mmdf_append (MAILSTREAM *stream,char *mail=
box,append_t af,void *data)
>> +     ret =3D NIL;                        /* return error */
>> +   }
>> +   else tp[0] =3D tp[1] - 1;     /* set atime to now-1 if successful =
copy */
>> +-  utime (file,tp);            /* set the times */
>> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
>> +   fclose (sf);                        /* done with scratch file */
>> +                               /* force UIDVALIDITY assignment now */
>> +   if (tstream && !tstream->uid_validity) tstream->uid_validity =3D t=
ime (0);
>> +@@ -1550,7 +1550,7 @@ void mmdf_unlock (int fd,MAILSTREAM *stream,DOT=
LOCK *lock)
>> +     }
>> +     else now =3D 0;             /* no time change needed */
>> +                               /* set the times, note change */
>> +-    if (now && !utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1=
];
>> ++    if (now && !utime (stream->mailbox, (const struct utimbuf *)tp))=
 LOCAL->filetime =3D tp[1];
>> +   }
>> +   flock (fd,LOCK_UN);         /* release flock'ers */
>> +   if (!stream) close (fd);    /* close the file if no stream */
>> +@@ -2393,7 +2393,7 @@ long mmdf_rewrite (MAILSTREAM *stream,unsigned =
long *nexp,DOTLOCK *lock,
>> +                               /* set atime to now, mtime a second ea=
rlier */
>> +     tp[1] =3D (tp[0] =3D time (0)) - 1;
>> +                               /* set the times, note change */
>> +-    if (!utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1];
>> ++    if (!utime (stream->mailbox, (const struct utimbuf *)tp)) LOCAL-=
>filetime =3D tp[1];
>> +     close (LOCAL->fd);                /* close and reopen file */
>> +     if ((LOCAL->fd =3D open (stream->mailbox,O_RDWR,
>> +                          (long) mail_parameters (NIL,GET_MBXPROTECTI=
ON,NIL)))
>> +diff --git a/src/osdep/unix/mtx.c b/src/osdep/unix/mtx.c
>> +index 8e6f76e..f64142b 100644
>> +--- a/src/osdep/unix/mtx.c
>> ++++ b/src/osdep/unix/mtx.c
>> +@@ -196,7 +196,7 @@ int mtx_isvalid (char *name,char *tmp)
>> +       if (sbuf.st_ctime > sbuf.st_atime) {
>> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
>> +       tp[1] =3D sbuf.st_mtime;
>> +-      utime (file,tp);        /* set the times */
>> ++      utime (file, (const struct utimbuf *)tp);       /* set the tim=
es */
>> +       }
>> +     }
>> +   }
>> +@@ -565,7 +565,7 @@ void mtx_flag (MAILSTREAM *stream,char *sequence,=
char *flag,long flags)
>> +     fstat (LOCAL->fd,&sbuf);  /* get current write time */
>> +     tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>> +     tp[0] =3D time (0);         /* make sure read comes after all th=
at */
>> +-    utime (stream->mailbox,tp);
>> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
>> +   }
>> + }
>> +
>> +@@ -834,7 +834,7 @@ long mtx_expunge (MAILSTREAM *stream,char *sequen=
ce,long options)
>> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
>> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>> +       tp[0] =3D time (0);               /* reset atime to now */
>> +-      utime (stream->mailbox,tp);
>> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
>> +       MM_NOCRITICAL (stream); /* release critical */
>> +                               /* notify upper level of new mailbox s=
ize */
>> +       mail_exists (stream,stream->nmsgs);
>> +@@ -929,7 +929,7 @@ long mtx_copy (MAILSTREAM *stream,char *sequence,=
char *mailbox,long options)
>> +                               /* else preserve \Marked status */
>> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : t=
ime(0);
>> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
>> +-  utime (file,tp);            /* set the times */
>> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
>> +   close (fd);                 /* close the file */
>> +   unlockfd (ld,lock);         /* release exclusive parse/append perm=
ission */
>> +   MM_NOCRITICAL (stream);     /* release critical */
>> +@@ -946,7 +946,7 @@ long mtx_copy (MAILSTREAM *stream,char *sequence,=
char *mailbox,long options)
>> +       fstat (LOCAL->fd,&sbuf);        /* get current write time */
>> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>> +       tp[0] =3D time (0);               /* make sure atime remains g=
reater */
>> +-      utime (stream->mailbox,tp);
>> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
>> +     }
>> +   }
>> +   if (ret && mail_parameters (NIL,GET_COPYUID,NIL))
>> +@@ -1062,7 +1062,7 @@ long mtx_append (MAILSTREAM *stream,char *mailb=
ox,append_t af,void *data)
>> +                               /* else preserve \Marked status */
>> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : t=
ime(0);
>> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
>> +-  utime (file,tp);            /* set the times */
>> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
>> +   fclose (df);                        /* close the file */
>> +   unlockfd (ld,lock);         /* release exclusive parse/append perm=
ission */
>> +   MM_NOCRITICAL (stream);     /* release critical */
>> +@@ -1212,7 +1212,7 @@ long mtx_parse (MAILSTREAM *stream)
>> +     time_t tp[2];
>> +     tp[0] =3D time (0);
>> +     tp[1] =3D LOCAL->filetime;
>> +-    utime (stream->mailbox,tp);
>> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
>> +   }
>> +   stream->silent =3D silent;    /* can pass up events now */
>> +   mail_exists (stream,nmsgs); /* notify upper level of new mailbox s=
ize */
>> +@@ -1312,7 +1312,7 @@ void mtx_update_status (MAILSTREAM *stream,unsi=
gned long msgno,long syncflag)
>> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
>> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>> +       tp[0] =3D time (0);               /* make sure read is later *=
/
>> +-      utime (stream->mailbox,tp);
>> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
>> +     }
>> +   }
>> + }
>> +diff --git a/src/osdep/unix/mx.c b/src/osdep/unix/mx.c
>> +index b5c5adf..4146409 100644
>> +--- a/src/osdep/unix/mx.c
>> ++++ b/src/osdep/unix/mx.c
>> +@@ -1283,5 +1283,5 @@ void mx_setdate (char *file,MESSAGECACHE *elt)
>> +   time_t tp[2];
>> +   tp[0] =3D time (0);           /* atime is now */
>> +   tp[1] =3D mail_longdate (elt);        /* modification time */
>> +-  utime (file,tp);            /* set the times */
>> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
>> + }
>> +diff --git a/src/osdep/unix/tenex.c b/src/osdep/unix/tenex.c
>> +index eee61fb..622da61 100644
>> +--- a/src/osdep/unix/tenex.c
>> ++++ b/src/osdep/unix/tenex.c
>> +@@ -203,7 +203,7 @@ int tenex_isvalid (char *name,char *tmp)
>> +       if (sbuf.st_ctime > sbuf.st_atime) {
>> +       tp[0] =3D sbuf.st_atime;  /* preserve atime and mtime */
>> +       tp[1] =3D sbuf.st_mtime;
>> +-      utime (file,tp);        /* set the times */
>> ++      utime (file, (const struct utimbuf *)tp);       /* set the tim=
es */
>> +       }
>> +     }
>> +   }
>> +@@ -654,7 +654,7 @@ void tenex_flag (MAILSTREAM *stream,char *sequenc=
e,char *flag,long flags)
>> +     fstat (LOCAL->fd,&sbuf);  /* get current write time */
>> +     tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>> +     tp[0] =3D time (0);         /* make sure read comes after all th=
at */
>> +-    utime (stream->mailbox,tp);
>> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
>> +   }
>> + }
>> +
>> +@@ -924,7 +924,7 @@ long tenex_expunge (MAILSTREAM *stream,char *sequ=
ence,long options)
>> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
>> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>> +       tp[0] =3D time (0);               /* reset atime to now */
>> +-      utime (stream->mailbox,tp);
>> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
>> +       MM_NOCRITICAL (stream); /* release critical */
>> +                               /* notify upper level of new mailbox s=
ize */
>> +       mail_exists (stream,stream->nmsgs);
>> +@@ -1019,7 +1019,7 @@ long tenex_copy (MAILSTREAM *stream,char *seque=
nce,char *mailbox,long options)
>> +                               /* else preserve \Marked status */
>> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : t=
ime(0);
>> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
>> +-  utime (file,tp);            /* set the times */
>> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
>> +   close (fd);                 /* close the file */
>> +   unlockfd (ld,lock);         /* release exclusive parse/append perm=
ission */
>> +   MM_NOCRITICAL (stream);     /* release critical */
>> +@@ -1036,7 +1036,7 @@ long tenex_copy (MAILSTREAM *stream,char *seque=
nce,char *mailbox,long options)
>> +       fstat (LOCAL->fd,&sbuf);        /* get current write time */
>> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>> +       tp[0] =3D time (0);               /* make sure atime remains g=
reater */
>> +-      utime (stream->mailbox,tp);
>> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
>> +     }
>> +   }
>> +   if (ret && mail_parameters (NIL,GET_COPYUID,NIL))
>> +@@ -1159,7 +1159,7 @@ long tenex_append (MAILSTREAM *stream,char *mai=
lbox,append_t af,void *data)
>> +                               /* else preserve \Marked status */
>> +   else tp[0] =3D (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : t=
ime(0);
>> +   tp[1] =3D sbuf.st_mtime;      /* preserve mtime */
>> +-  utime (file,tp);            /* set the times */
>> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
>> +   fclose (df);                        /* close the file */
>> +   unlockfd (ld,lock);         /* release exclusive parse/append perm=
ission */
>> +   MM_NOCRITICAL (stream);     /* release critical */
>> +@@ -1324,7 +1324,7 @@ long tenex_parse (MAILSTREAM *stream)
>> +     time_t tp[2];
>> +     tp[0] =3D time (0);
>> +     tp[1] =3D LOCAL->filetime;
>> +-    utime (stream->mailbox,tp);
>> ++    utime (stream->mailbox, (const struct utimbuf *)tp);
>> +   }
>> +   stream->silent =3D silent;    /* can pass up events now */
>> +   mail_exists (stream,nmsgs); /* notify upper level of new mailbox s=
ize */
>> +@@ -1424,7 +1424,7 @@ void tenex_update_status (MAILSTREAM *stream,un=
signed long msgno,long syncflag)
>> +       fstat (LOCAL->fd,&sbuf);        /* get new write time */
>> +       tp[1] =3D LOCAL->filetime =3D sbuf.st_mtime;
>> +       tp[0] =3D time (0);               /* make sure read is later *=
/
>> +-      utime (stream->mailbox,tp);
>> ++      utime (stream->mailbox, (const struct utimbuf *)tp);
>> +     }
>> +   }
>> + }
>> +diff --git a/src/osdep/unix/unix.c b/src/osdep/unix/unix.c
>> +index 86be3f9..012dc83 100644
>> +--- a/src/osdep/unix/unix.c
>> ++++ b/src/osdep/unix/unix.c
>> +@@ -232,7 +232,7 @@ DRIVER *unix_valid (char *name)
>> +       if ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.s=
t_atime)) {
>> +       tp[0] =3D sbuf.st_atime;  /* yes, preserve atime and mtime */
>> +       tp[1] =3D sbuf.st_mtime;
>> +-      utime (file,tp);        /* set the times */
>> ++      utime (file, (const struct utimbuf *)tp);       /* set the tim=
es */
>> +       }
>> +     }
>> +   }
>> +@@ -999,7 +999,7 @@ long unix_copy (MAILSTREAM *stream,char *sequence=
,char *mailbox,long options)
>> +   else tp[0] =3D                        /* else preserve \Marked sta=
tus */
>> +        ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.st_=
atime)) ?
>> +        sbuf.st_atime : tp[1];
>> +-  utime (file,tp);            /* set the times */
>> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
>> +   unix_unlock (fd,NIL,&lock); /* unlock and close mailbox */
>> +   if (tstream) {              /* update last UID if we can */
>> +     UNIXLOCAL *local =3D (UNIXLOCAL *) tstream->local;
>> +@@ -1160,7 +1160,7 @@ long unix_append (MAILSTREAM *stream,char *mail=
box,append_t af,void *data)
>> +     ret =3D NIL;                        /* return error */
>> +   }
>> +   else tp[0] =3D tp[1] - 1;     /* set atime to now-1 if successful =
copy */
>> +-  utime (file,tp);            /* set the times */
>> ++  utime (file, (const struct utimbuf *)tp);           /* set the tim=
es */
>> +   fclose (sf);                        /* done with scratch file */
>> +                               /* force UIDVALIDITY assignment now */
>> +   if (tstream && !tstream->uid_validity) tstream->uid_validity =3D t=
ime (0);
>> +@@ -1425,7 +1425,7 @@ void unix_unlock (int fd,MAILSTREAM *stream,DOT=
LOCK *lock)
>> +     }
>> +     else now =3D 0;             /* no time change needed */
>> +                               /* set the times, note change */
>> +-    if (now && !utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1=
];
>> ++    if (now && !utime (stream->mailbox, (const struct utimbuf *)tp))=
 LOCAL->filetime =3D tp[1];
>> +   }
>> +   flock (fd,LOCK_UN);         /* release flock'ers */
>> +   if (!stream) close (fd);    /* close the file if no stream */
>> +@@ -2251,7 +2251,7 @@ long unix_rewrite (MAILSTREAM *stream,unsigned =
long *nexp,DOTLOCK *lock,
>> +                               /* set atime to now, mtime a second ea=
rlier */
>> +     tp[1] =3D (tp[0] =3D time (0)) - 1;
>> +                               /* set the times, note change */
>> +-    if (!utime (stream->mailbox,tp)) LOCAL->filetime =3D tp[1];
>> ++    if (!utime (stream->mailbox, (const struct utimbuf *)tp)) LOCAL-=
>filetime =3D tp[1];
>> +     close (LOCAL->fd);                /* close and reopen file */
>> +     if ((LOCAL->fd =3D open (stream->mailbox,O_RDWR,
>> +                          (long) mail_parameters (NIL,GET_MBXPROTECTI=
ON,NIL)))
>> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-=
oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
>> index 17faa3aa6..7e3bddb58 100644
>> --- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
>> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
>> @@ -16,6 +16,7 @@ SRC_URI =3D "https://fossies.org/linux/misc/old/imap=
-${PV}.tar.gz \
>>              file://0002-tmail-Include-ctype.h-for-isdigit.patch \
>>              file://0001-Fix-Wincompatible-function-pointer-types.patc=
h \
>>              file://uw-imap-newer-tls.patch \
>> +           file://uw-imap-fix-incompatible-pointer-types.patch \
>>              "
>>
>>   SRC_URI[md5sum] =3D "2126fd125ea26b73b20f01fcd5940369"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110750): https://lists.openembedded.org/g/openembe=
dded-devel/message/110750
>> Mute This Topic: https://lists.openembedded.org/mt/106526690/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


