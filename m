Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9667AC05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 18:37:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19317.1675449466862956538
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Feb 2023 10:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Wb29KgVN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1398862e34=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313HYG8c030430
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Feb 2023 10:37:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=A3PuFdf3hUeKFk2XepCEFrZr53/pHt79Bd8GNjCmvf8=;
 b=Wb29KgVNxU90glgHtBSRcutehCtI7R+zeuAHv/vvocz1whxLA7XTR77DJH3bpFv7nawT
 6rgaUA8lUPPK/9nOuP58jFyXA+AksoaJk0YCW5g0CPT9E4Qh2/TdD8mcwyq3cTfCG8wI
 GNF9xBDmTaRMadzhOqgIrQM5lzskUnnmB0xb++eVlbVbnZUdd6RQP11R/gebypnM3P9y
 vwhHV26U/0tURpOmyVOEWrJYAtm7I/eEEIn+0duJ3qRTTS3ro999jP6FcXfcS3f6B0ny
 xoWQL/w+HWill72rp1+ieClePl8YoVVCIRUWOQLGXDmcIpZSfPcWhwfpDcuhYF5AQ/V7 cA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nfqn42gm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 10:37:46 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 313Ibjrj026180
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Feb 2023 10:37:45 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nfqn42gm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 10:37:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToUeL6ExpAXR12ywvwIQyVushcYPZ3ZrmxKA3s2OlIfQ0rl8iuVuUqi+aZun2IuoW/HAKijPnimKsrwO3T9mxw5FoeVaIwJl5e7KMckoYxF34pxX1UH7pGQeTtdnDsZRjcmKAciu/H6KGA3fyQM9KOg38flVDDSDW5S4NW8tOSG9SSVsS72wXJ87UZFSmaXmQTkRbFrRtGbF2JQIefxPuAjtT3JMH4LWDZfgbBE1AFQnR3+EVgYmilONL/YrVoTRvA4jWcOD1V0Fjxf2MyWR2mwdshRupKQ/2z4umvKyeKUsMoow5hnloxO+LPh72evLwPjYVDekisPGz3GDDgOhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3PuFdf3hUeKFk2XepCEFrZr53/pHt79Bd8GNjCmvf8=;
 b=EhcDyuqIOAJxnkKdIkrB0fiv3MktPWnHWM2NVya0TDHf9+ty8TdsCiBguRX7Aa9pjHHqINz2aSPMQU7gRh+BdAMMfO/4tBIG73rBWWqI3UGFsh8jr5qmMShybnzhOKDP30lNKaceGkJusvqaFFGiRrLpiAMo/5dthFXEH0pI7lNy2tjKvFKIioXEx3Y89s31MtrZA4Gk+iYTf/3LF/Lsz6Bdes8W/FNz/3wJq4qcYf+TQIXBmreLU5X4vsmFT4DMHHDw1DENtY2SqY8wy5NJTQ4AUcdkqG42W2sfq+Jm4C+wLcGDFg4zQdnN144+4ulf4mv8QwcoJp5ml/QamU1+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB5534.namprd11.prod.outlook.com (2603:10b6:5:391::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 18:37:42 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d%5]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 18:37:42 +0000
Content-Type: multipart/alternative;
 boundary="------------cK455HTMp00B0BoJeWrqsie0"
Message-ID: <c698b344-1b87-fa9a-59fc-692167fb6cd5@windriver.com>
Date: Fri, 3 Feb 2023 13:37:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][kirkstone][PATCH 3/6] python3-pillow: upgrade
 9.2.0 -> 9.3.0
Content-Language: en-CA
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
 <20230131230851.2785067-3-Randy.MacLeod@windriver.com>
 <06197dd2-46e8-ffba-c703-681cee51b14c@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <06197dd2-46e8-ffba-c703-681cee51b14c@gmail.com>
X-ClientProxiedBy: SA9PR13CA0128.namprd13.prod.outlook.com
 (2603:10b6:806:27::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB5534:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e880b31-01a5-4dd3-6af4-08db0615bc0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	43Umq8WaLdeRhCc/gBi08GqNp+ISZWY320M5+LPkt9AGoJ2St3QD/VFoglXhuekVtYgMQFgUYcUyguMkCacuUVPQ7xgzloVInslXPNRC1qct7Z4y2+CQB2MHExzBwsgZFflzcOYkfS4kC1wisFQwq8YtLIGD/DO4S91bWGrs2FJ8tWXRQv7ZEANiWmoSk1gEQsWh5htczvlV/wDefrg5dvQCo6XZw94I+7J/BdNxB2p3A5WTNSD9UEkmdMsuYtYWq8SHFdQdRcWfAjkfrNQMmVZ7w05isZCOt5kK53960AW9S0kjfTBqjkBIKcYVIQm35taVQtm6/265LLB9Fsu0TLQE82EOCO0jUxHQQVCAED30I+DXpSbzv0E3POA3dL9CLxu/rbKaEajb4GKrJJvpMGuCcrqOy926ISDHS03Dv1njhkf/Rm+b3sBe0QWb35WX454uJC5ZTuESY6DPUK4Q/Qlsxzcro6SSw3y3/g+DCQYo10dmoQuLRdydIUnrNrgtyUEtUil+ou4t4Eu58Ao+sEV3Aax50MXYkiJcyShbzpIP4iz4aCnP9snpr2ERceaYTfQ36qtQSsyqXXP9ckic02aE2CTNsCOdoKB+EuJr5S4728j3B3pBORbAiBvaTL28+N/OTv+0fVtBjBAYktrT0oLe8Nwb//oMF2XMch3qMsIiO3dFvkNo4f5zxHBkkvR66i2evJjqQxrOw78M/jFHg3Fgmd7JuSKN5ZJ3TxBnW43rJm209EHL1da+vAzj6UqWQRqB7HdyPNC/TJ0MlHmQKHjndEGL37Gid06HkROArxRLhC61adk1bFddtLGPZ7Gv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39850400004)(346002)(396003)(366004)(451199018)(30864003)(5660300002)(8936002)(36756003)(2906002)(316002)(66946007)(66556008)(8676002)(66476007)(41300700001)(6486002)(166002)(38100700002)(966005)(26005)(186003)(33964004)(2616005)(86362001)(83380400001)(31696002)(53546011)(6506007)(6666004)(478600001)(6512007)(66899018)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUptMFRIdlFxM21UZjdDTUJEa3RvS2cwOG11NFJCQnlBcitMWGJJSm0raVhJ?=
 =?utf-8?B?SlZVRngyVXZlZWcxSmp6dStQYStrZ1VwamNOSnAva25SaTNCdmxlMi9OM09k?=
 =?utf-8?B?dzRyVGlOcXV5QXQ0eUNWYXB4WDVjWWZDNWZlQzBlSStjZFF1V0NtektCdTNV?=
 =?utf-8?B?aEw2MTljbVVSZVppbHk4YitlSnluUXIzVGJIc1Bzc1NldHZUeXB6dnQwOVdt?=
 =?utf-8?B?U0ZVNzJSZWt4VnZBL3YwOGNaR21uRUVXQTMrZldBMzVVNWxsU0VoWkFFSVRz?=
 =?utf-8?B?blhXaU9XQVQ0L3Z2YnpHeGVkRU53U2VRTFNNMStvQUtqdkNBQ3hVRy9wMExG?=
 =?utf-8?B?USt3cjcweDhpNEpNcUJCWER0YitRc2hlQ2JiZGdUalhYY3FLdkxvN2hoMWdZ?=
 =?utf-8?B?dStZLzU0QW54MDBSeE90RlNuNDgrYkMrU3pDVzZicjZkVlZGc1J4SCtEM1NO?=
 =?utf-8?B?ei9HMU91TzJJN3V5R0txVTdPaVMxM3pqdEQ3K2l5bExQZm05cE1rWjRZdGJH?=
 =?utf-8?B?QyttZHZKbndWRFFqNjhEaWs0Tk5tTkRiU2U2VkJoYVBNN2NpMmtLQzRNZHBM?=
 =?utf-8?B?cEhvU1ZjKzYveWNoQS83MkxRQUZOMWpPdUNvdWJKQm5ubzc0UFQ4V2NBOTY4?=
 =?utf-8?B?dzVQNmppTzMxTTJ6ZlgzVkUwZ2tESWtMQWFGNjA4djZWdkFGU1BQVytDbTRQ?=
 =?utf-8?B?Zk5nZlozYkJwZnQvVHkwTC9XcytLY2xIcnR6Y1JBeGtCbTRKc1ZoTEhFUWlT?=
 =?utf-8?B?WGhVaHFNVTBhT3R6N0ZUcWxiKy9zcjNIZllGS0xxK04wSE1GaWRkL1Nya29J?=
 =?utf-8?B?Z1hSU3NaZGRXVldoM0pMTDY2ajloR3ZPa0FnK2o0N0FDUWtoVEcyM2lhcmRU?=
 =?utf-8?B?R25zSGx0NkpPcm9NenpmOURISllEK3dpZElHUTRVOWN3dGV1cGJpclM0US81?=
 =?utf-8?B?bU5yZlFiSzNWNVhJeHErMkwvR09xalF5YXJBOHJpYllIY0ZrTFRkZ2VYWGo3?=
 =?utf-8?B?d0o4aENSa3gyUGlPSkQya3U1S25jUGhiaG5wTVV4U2FmMlVnNFFLbXhtdXRF?=
 =?utf-8?B?VjB5cnJ1OWEydWE4c2t5NC92ZDh4cWVzZ081M1AzK0JLNW1CekkveVkyK29K?=
 =?utf-8?B?ZnNyUjlSODYybHVOZ1h1ekFKSmh4cGVwVFFGRWVUc3ZZWW8wTjhVZjZwU3BB?=
 =?utf-8?B?ZnF3bEpTazVCNC9nSmR0NWZxNmh5ekdOZjRWWlFaMzJGeThXK3d4ZUJucDNp?=
 =?utf-8?B?UEc5UVl4TE9jbWhucmprNWdMV2lpOUlCVmhsbmRIMWM0Q3NBeTlXUmhQUVJu?=
 =?utf-8?B?emNGODc3OTMzUEZ5eHFFRTREandZZWJsNUJNREZPcWdaZWd6VzluRlBxTzRn?=
 =?utf-8?B?bnYvZER2UHNmZkloYWFScjZvcDRZdEtxcUhHalNKRlo0cHlneHdvVUprWGNh?=
 =?utf-8?B?cW91dER0eTIwQjN3aEI0L3FGLzQvcEIzYTVCZkZTTThkOUNWVG0yVnBWSGZl?=
 =?utf-8?B?ZGMyS3RpdFRDZ1hsSTFkRmJFWXZ1dlBuTEROdXJLOUtQTFhuWWswSHRaNlVT?=
 =?utf-8?B?YnJUZEV4bEVwL0o5MkMwYmJEMUk2bHg5QkdRc3VvVFU2WG5CbHdzVHR4YkJB?=
 =?utf-8?B?MHA2SXBEd055S05OK04xSzVNM2JkcmFnN1JMMjJBNklVOUlMUER4d1J5UjJ1?=
 =?utf-8?B?WlVYYWRWTkNRZFc3N3JsTjRJTEd2cnRKRFRsaXRVSUNjSDJCUjBVbU9IZUZR?=
 =?utf-8?B?MFMwVjM1d3RvUHVlVzE1V0Vja2FsaEFoY1VDTlpSdkppZFE5RVQyaTV0aFNx?=
 =?utf-8?B?eWZEZUFOZ3NBVytoQWd4QlA0Um04N3dBSlVGU3AvYnZtR3Y2UGlnRjVXNGs4?=
 =?utf-8?B?ZkVoVkVRUWtraXdmQytvSTdPc24vcXlFYVErNWtvMjBlQmtZcHJvQUNkTXFh?=
 =?utf-8?B?THpvbDNrVHJFSGhFR09yOUlGS1Zhc2xtbW9WTm9COVdXNTFGYkJRWVBQSnRr?=
 =?utf-8?B?NTZ5QWZsU1VvMEp4SHV3dXdmbGxGN0hlRlE3SVNuWXRrVjIzT2JlMU1sVWVt?=
 =?utf-8?B?NGpxMUcvWE8waGxmcEswUER0a2tQTkk1bDZGVS96bUZaMzUyNmlEY253d3lo?=
 =?utf-8?B?ZUhwOGxlNVlCRUZMcFc4Vm95ekFxQjhzQUdsRGhLenNBNFY3UnFUK0RwOVVM?=
 =?utf-8?Q?AR6b+ud5D4IPAEKI6ljVcEQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e880b31-01a5-4dd3-6af4-08db0615bc0f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 18:37:42.4295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9uEcQaVo6ZeGe055EZPHmO5ABMHOtJeMyTP6VtXimAaLgqbFMexzzkU8qk2QDvOv9Kvw1Y4pYnkIVHjAZrK91ojdbJSlaW8bTyVmguTPrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5534
X-Proofpoint-ORIG-GUID: DwqFh89ugP-15cK_Ymba7D7cufiQ7tUT
X-Proofpoint-GUID: tbqqoWtTABoCIqn_OXc-KjUJlVwAYoEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_17,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 phishscore=0 mlxscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030171
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 18:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100926

--------------cK455HTMp00B0BoJeWrqsie0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 313HYG8c030430

On 2023-02-01 08:35, akuster808 wrote:
> Hello Randy,
>
> On 1/31/23 6:08 PM, Randy MacLeod wrote:
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> Changelog:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 Limit SAMPLESPERPIXEL to avoid runtime DOS #6=
700 [wiredfool]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Initialize libtiff buffer when saving #6699 [=
radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Inline fname2char to fix memory leak #6329 [n=
ulano]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Fix memory leaks related to text features #63=
30 [nulano]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Use double quotes for version check on old CP=
ython on Windows=20
>> #6695 [hugovk]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Remove backup implementation of Round for Win=
dows platforms=20
>> #6693 [cgohlke]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed set_variation_by_name offset #6445 [rad=
arhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Fix malloc in _imagingft.c:font_setvaraxes #6=
690 [cgohlke]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Release Python GIL when converting images usi=
ng matrix=20
>> operations #6418 [hmaarrfk]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Added ExifTags enums #6630 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Do not modify previous frame when calculating=
 delta in PNG #6683=20
>> [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Added support for reading BMP images with RLE=
4 compression #6674=20
>> [npjg, radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Decode JPEG compressed BLP1 data in original =
mode #6678 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Added GPS TIFF tag info #6661 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Added conversion between RGB/RGBA/RGBX and LA=
B #6647 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Do not attempt normalization if mode is alrea=
dy normal #6644=20
>> [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed seeking to an L frame in a GIF #6576 [r=
adarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Consider all frames when selecting mode for P=
NG save_all #6610=20
>> [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Don't reassign crc on ChunkStream close #6627=
 [wiredfool,=20
>> radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Raise a warning if NumPy failed to raise an e=
rror during=20
>> conversion #6594 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Show all frames in ImageShow #6611 [radarhere=
]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Allow FLI palette chunk to not be first #6626=
 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 If first GIF frame has transparency for RGB_A=
LWAYS loading=20
>> strategy, use RGBA mode #6592 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Round box position to integer when pasting em=
bedded color #6517=20
>> [radarhere, nulano]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Removed EXIF prefix when saving WebP #6582 [r=
adarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Pad IM palette to 768 bytes when saving #6579=
 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Added DDS BC6H reading #6449 [ShadelessFox, R=
EDxEYE, radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Added support for opening WhiteIsZero 16-bit =
integer TIFF images=20
>> #6642 [JayWiz, radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Raise an error when allocating translucent co=
lor to RGB palette=20
>> #6654 [jsbueno, radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Added reading of TIFF child images #6569 [rad=
arhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Improved ImageOps palette handling #6596 [Pos=
osikTeam, radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Defer parsing of palette into colors #6567 [r=
adarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Apply transparency to P images in ImageTk.Pho=
toImage #6559=20
>> [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Use rounding in ImageOps contain() and pad() =
#6522=20
>> [bibinhashley, radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed GIF remapping to palette with duplicate=
 entries #6548=20
>> [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Allow remap_palette() to return an image with=
 less than 256=20
>> palette entries #6543 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Corrected BMP and TGA palette size when savin=
g #6500 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Do not call load() before draft() in Image.th=
umbnail #6539=20
>> [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Copy palette when converting from P to PA #64=
97 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Allow RGB and RGBA values for PA image putpix=
el #6504 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Removed support for tkinter in PyPy before Py=
thon 3.6 #6551=20
>> [nulano]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Do not use CCITTFaxDecode filter if libtiff i=
s not available=20
>> #6518 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Fallback to not using mmap if buffer is not l=
arge enough #6510=20
>> [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed writing bytes as ASCII tag #6493 [radar=
here]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Open 1 bit EPS in mode 1 #6499 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Removed support for tkinter before Python 1.5=
.2 #6549 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Allow default ImageDraw font to be set #6484 =
[radarhere, hugovk]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Save 1 mode PDF using CCITTFaxDecode filter #=
6470 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Added support for RGBA PSD images #6481 [rada=
rhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Parse orientation from XMP tag contents #6463=
 [bigcat88, radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Added support for reading ATI1/ATI2 (BC4/BC5)=
 DDS images #6457=20
>> [REDxEYE, radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Do not clear GIF tile when checking number of=
 frames #6455=20
>> [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Support saving multiple MPO frames #6444 [rad=
arhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Do not double quote Pillow version for setupt=
ools >=3D 60 #6450=20
>> [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Added ABGR BMP mask mode #6436 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Fixed PSDraw rectangle #6429 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Raise ValueError if PNG sRGB chunk is truncat=
ed #6431 [radarhere]
>> =C2=A0=C2=A0=C2=A0=C2=A0 Handle missing Python executable in ImageShow=
 on macOS #6416=20
>> [bryant1410, radarhere]
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Whats missing here are the dependency needs for kirkstone:
> harfbuzz to 4.4.1
> libtiff to 4.4.0

Hi Armin,

Thanks for the comments, I think an update could make sense but really=20
I'm after CVE fixes so I won't argue.
A CVE patch=C2=A0 was posted for dunfell and it's a one-liner so I'll tak=
e=20
that for kirkstone and send a patch.


If you'd like to help me understand your concerns, since I haven't=20
worked with python modules much,
you could answer the questions below but they aren't relevant now.


Why do you think we need those versions? I don't see them called out in=20
the logs above or

in any release notes for pillow and the tests work...

Harfbuzz is mentioned as being needed for libraqm

https://pillow.readthedocs.io/en/latest/installation.html#external-librar=
ies

but there's no recipe for libraqm yet and so it's not a requirement it=20
seems:

b/pillow$ grep Requiring=20
tmp-glibc/work/core2-64-oe-linux/python3-pillow/9.4.0-r0/temp/log.do_comp=
ile
Requiring zlib
Requiring jpeg
Requiring tiff
Requiring freetype
Requiring lcms
Requiring jpeg2000

>
> neither version exists in kirkstone.
>
> and it appears to be adding a lot of new features.

Yeah, IMO it's a reasonable update because of the semantic versioning=20
approach
followed by pillow, specifically:

https://pillow.readthedocs.io/en/stable/releasenotes/versioning.html#vers=
ioning

 =C2=A0- MINOR version when you add functionality in a backwards compatib=
le=20
manner,

but you're the maintainer so I'll send a patch next week.

../Randy


> =C2=A0 Per our stable branch process, this update does not qualify to b=
e=20
> included.
>
> BR,
> Armin
>> ---
>> =C2=A0 .../{python3-pillow_9.2.0.bb =3D> python3-pillow_9.3.0.bb}=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>> =C2=A0 rename meta-python/recipes-devtools/python/{python3-pillow_9.2.=
0.bb=20
>> =3D> python3-pillow_9.3.0.bb} (86%)
>>
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb=20
>> b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
>> similarity index 86%
>> rename from meta-python/recipes-devtools/python/python3-pillow_9.2.0.b=
b
>> rename to meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
>> index 454d61a48..11f545160 100644
>> --- a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
>> @@ -5,7 +5,7 @@ HOMEPAGE =3D "https://pillow.readthedocs.io"
>> =C2=A0 LICENSE =3D "MIT"
>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3Dad081a0aede51e89f8da13333a8fb849"
>> =C2=A0 -SRC_URI =3D=20
>> "git://github.com/python-pillow/Pillow.git;branch=3D9.2.x;protocol=3Dh=
ttps \
>> +SRC_URI =3D=20
>> "git://github.com/python-pillow/Pillow.git;branch=3Dmain;protocol=3Dht=
tps \
>> file://0001-support-cross-compiling.patch \
>> file://0001-explicitly-set-compile-options.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> @@ -39,4 +39,4 @@ RPROVIDES:${PN} +=3D "python3-imaging"
>> =C2=A0 =C2=A0 BBCLASSEXTEND =3D "native"
>> =C2=A0 -SRCREV =3D "58acec3312fb8671c9d84829197e1c8150085589"
>> +SRCREV =3D "d594f4cb8dc47fb0c69ae58d9fff86faae4515bd"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#100894):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/100894
>> Mute This Topic: https://lists.openembedded.org/mt/96664649/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [akuster808@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

--=20
# Randy MacLeod
# Wind River Linux

--------------cK455HTMp00B0BoJeWrqsie0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-02-01 08:35, akuster808 wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:06197dd2-46e8-ffba-c703-681cee51b14c@gmail.com">Hello
      Randy,
      <br>
      <br>
      On 1/31/23 6:08 PM, Randy MacLeod wrote:
      <br>
      <blockquote type="cite">From: Wang Mingyu
        <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
        <br>
        <br>
        Changelog:
        <br>
        =========
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Limit SAMPLESPERPIXEL to avoid runtime DOS #6700
        [wiredfool]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Initialize libtiff buffer when saving #6699 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Inline fname2char to fix memory leak #6329 [nulano]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Fix memory leaks related to text features #6330 [nulano]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Use double quotes for version check on old CPython on
        Windows #6695 [hugovk]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Remove backup implementation of Round for Windows platforms
        #6693 [cgohlke]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Fixed set_variation_by_name offset #6445 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Fix malloc in _imagingft.c:font_setvaraxes #6690 [cgohlke]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Release Python GIL when converting images using matrix
        operations #6418 [hmaarrfk]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Added ExifTags enums #6630 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Do not modify previous frame when calculating delta in PNG
        #6683 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Added support for reading BMP images with RLE4 compression
        #6674 [npjg, radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Decode JPEG compressed BLP1 data in original mode #6678
        [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Added GPS TIFF tag info #6661 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Added conversion between RGB/RGBA/RGBX and LAB #6647
        [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Do not attempt normalization if mode is already normal
        #6644 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Fixed seeking to an L frame in a GIF #6576 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Consider all frames when selecting mode for PNG save_all
        #6610 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Don't reassign crc on ChunkStream close #6627 [wiredfool,
        radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Raise a warning if NumPy failed to raise an error during
        conversion #6594 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Show all frames in ImageShow #6611 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Allow FLI palette chunk to not be first #6626 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; If first GIF frame has transparency for RGB_ALWAYS loading
        strategy, use RGBA mode #6592 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Round box position to integer when pasting embedded color
        #6517 [radarhere, nulano]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Removed EXIF prefix when saving WebP #6582 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Pad IM palette to 768 bytes when saving #6579 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Added DDS BC6H reading #6449 [ShadelessFox, REDxEYE,
        radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Added support for opening WhiteIsZero 16-bit integer TIFF
        images #6642 [JayWiz, radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Raise an error when allocating translucent color to RGB
        palette #6654 [jsbueno, radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Added reading of TIFF child images #6569 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Improved ImageOps palette handling #6596 [PososikTeam,
        radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Defer parsing of palette into colors #6567 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Apply transparency to P images in ImageTk.PhotoImage #6559
        [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Use rounding in ImageOps contain() and pad() #6522
        [bibinhashley, radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Fixed GIF remapping to palette with duplicate entries #6548
        [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Allow remap_palette() to return an image with less than 256
        palette entries #6543 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Corrected BMP and TGA palette size when saving #6500
        [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Do not call load() before draft() in Image.thumbnail #6539
        [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Copy palette when converting from P to PA #6497 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Allow RGB and RGBA values for PA image putpixel #6504
        [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Removed support for tkinter in PyPy before Python 3.6 #6551
        [nulano]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Do not use CCITTFaxDecode filter if libtiff is not
        available #6518 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Fallback to not using mmap if buffer is not large enough
        #6510 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Fixed writing bytes as ASCII tag #6493 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Open 1 bit EPS in mode 1 #6499 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Removed support for tkinter before Python 1.5.2 #6549
        [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Allow default ImageDraw font to be set #6484 [radarhere,
        hugovk]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Save 1 mode PDF using CCITTFaxDecode filter #6470
        [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Added support for RGBA PSD images #6481 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Parse orientation from XMP tag contents #6463 [bigcat88,
        radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Added support for reading ATI1/ATI2 (BC4/BC5) DDS images
        #6457 [REDxEYE, radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Do not clear GIF tile when checking number of frames #6455
        [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Support saving multiple MPO frames #6444 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Do not double quote Pillow version for setuptools &gt;= 60
        #6450 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Added ABGR BMP mask mode #6436 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Fixed PSDraw rectangle #6429 [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Raise ValueError if PNG sRGB chunk is truncated #6431
        [radarhere]
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Handle missing Python executable in ImageShow on macOS
        #6416 [bryant1410, radarhere]
        <br>
        <br>
        Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
        <br>
        Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
        <br>
      </blockquote>
      <br>
      Whats missing here are the dependency needs for kirkstone:
      <br>
      harfbuzz to 4.4.1
      <br>
      libtiff to 4.4.0
      <br>
    </blockquote>
    <p>Hi Armin,</p>
    <p>Thanks for the comments, I think an update could make sense but
      really I'm after CVE fixes so I won't argue.<br>
      A CVE patch&nbsp; was posted for dunfell and it's a one-liner so I'll
      take that for kirkstone and send a patch.</p>
    <p><br>
    </p>
    <p>If you'd like to help me understand your concerns, since I
      haven't worked with python modules much, <br>
      you could answer the questions below but they aren't relevant now.</p>
    <p><br>
    </p>
    <p>Why do you think we need those versions? I don't see them called
      out in the logs above or</p>
    <p>in any release notes for pillow and the tests work...</p>
    <p>Harfbuzz is mentioned as being needed for libraqm <br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://pillow.readthedocs.io/en/latest/installation.html#external-libraries">https://pillow.readthedocs.io/en/latest/installation.html#external-libraries</a><br>
    </p>
    <p>but there's no recipe for libraqm yet and so it's not a
      requirement it seems:<br>
    </p>
    <p>b/pillow$ grep Requiring
tmp-glibc/work/core2-64-oe-linux/python3-pillow/9.4.0-r0/temp/log.do_compile<br>
      Requiring zlib<br>
      Requiring jpeg<br>
      Requiring tiff<br>
      Requiring freetype<br>
      Requiring lcms<br>
      Requiring jpeg2000<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:06197dd2-46e8-ffba-c703-681cee51b14c@gmail.com">
      <br>
      neither version exists in kirkstone.
      <br>
      <br>
      and it appears to be adding a lot of new features.</blockquote>
    <p>Yeah, IMO it's a reasonable update because of the semantic
      versioning approach<br>
      followed by pillow, specifically:</p>
    <p><a class="moz-txt-link-freetext" href="https://pillow.readthedocs.io/en/stable/releasenotes/versioning.html#versioning">https://pillow.readthedocs.io/en/stable/releasenotes/versioning.html#versioning</a><br>
    </p>
    <p>&nbsp;- MINOR version when you add functionality in a backwards
      compatible manner,<br>
    </p>
    <p>but you're the maintainer so I'll send a patch next week.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:06197dd2-46e8-ffba-c703-681cee51b14c@gmail.com">&nbsp; Per
      our stable branch process, this update does not qualify to be
      included.
      <br>
      <br>
      BR,
      <br>
      Armin
      <br>
      <blockquote type="cite">---
        <br>
        &nbsp; .../{python3-pillow_9.2.0.bb =&gt;
        python3-pillow_9.3.0.bb}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 ++--
        <br>
        &nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)
        <br>
        &nbsp; rename
        meta-python/recipes-devtools/python/{python3-pillow_9.2.0.bb
        =&gt; python3-pillow_9.3.0.bb} (86%)
        <br>
        <br>
        diff --git
        a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
        b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
        <br>
        similarity index 86%
        <br>
        rename from
        meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
        <br>
        rename to
        meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
        <br>
        index 454d61a48..11f545160 100644
        <br>
        ---
        a/meta-python/recipes-devtools/python/python3-pillow_9.2.0.bb
        <br>
        +++
        b/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
        <br>
        @@ -5,7 +5,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pillow.readthedocs.io">&quot;https://pillow.readthedocs.io&quot;</a>
        <br>
        &nbsp; LICENSE = &quot;MIT&quot;
        <br>
        &nbsp; LIC_FILES_CHKSUM =
        <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849">&quot;file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849&quot;</a>
        <br>
        &nbsp; -SRC_URI =
        &quot;git://github.com/python-pillow/Pillow.git;branch=9.2.x;protocol=https
        \
        <br>
        +SRC_URI =
        &quot;git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
        \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="file://0001-support-cross-compiling.patch">file://0001-support-cross-compiling.patch</a> \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="file://0001-explicitly-set-compile-options.patch">file://0001-explicitly-set-compile-options.patch</a> \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;
        <br>
        @@ -39,4 +39,4 @@ RPROVIDES:${PN} += &quot;python3-imaging&quot;
        <br>
        &nbsp; &nbsp; BBCLASSEXTEND = &quot;native&quot;
        <br>
        &nbsp; -SRCREV = &quot;58acec3312fb8671c9d84829197e1c8150085589&quot;
        <br>
        +SRCREV = &quot;d594f4cb8dc47fb0c69ae58d9fff86faae4515bd&quot;
        <br>
        <br>
        -=-=-=-=-=-=-=-=-=-=-=-
        <br>
        Links: You receive all messages sent to this group.
        <br>
        View/Reply Online (#100894):
        <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/100894">https://lists.openembedded.org/g/openembedded-devel/message/100894</a>
        <br>
        Mute This Topic:
        <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/96664649/3616698">https://lists.openembedded.org/mt/96664649/3616698</a>
        <br>
        Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
        <br>
        Unsubscribe:
        <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a>
        [<a class="moz-txt-link-abbreviated" href="mailto:akuster808@gmail.com">akuster808@gmail.com</a>]
        <br>
        -=-=-=-=-=-=-=-=-=-=-=-
        <br>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------cK455HTMp00B0BoJeWrqsie0--

