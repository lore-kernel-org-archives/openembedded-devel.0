Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F22AC636D3
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 18:40:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.62269.1675708823285548051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 10:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Six3WTGb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1401d9383d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 316Cj31J023584
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Feb 2023 18:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=P2ccSyFXo2q61w/IXpK443svxMbmU2n5I/p3tpxWBJA=;
 b=Six3WTGbKuUCV8+7g1Ys7d8+ZQB/fsBIf1rvRYGkUUj5XMkzpXuCLgjw0dWvMOZDUrC/
 UcNJ+pJ+52gpHtVVCsbSozGtAGimZJ0jIkQp6T+KCQ4Z9TgAnj7DmOcqUaO9NxCus7QK
 R+yuoKaxfvpwELO+Jeb1fwaQRkeAYtEI2vrsADdweQ9/MnPkAFwSsKHqgUPf80t2dJZT
 BnJIFlU292j7S9VPyUv76J1p9mOzgQSGxNByZiu9Z6LnsRB/Q6M8Ru55sWx4TLsPx0K1
 D6gzz5dLH3sQ9NhMAERoyRxdYgJLaEyuIff2MCCEyuwyW6vGgHXl4hHXyUoV5b19BlGO SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhebaa1cu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 18:40:22 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 316IeLO8012443
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Feb 2023 18:40:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhebaa1ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 18:40:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqIUIe34f87CYWZXDIVpy0zkcbtVN5953VAFrEoUavKTNsW+SlRnxj4F3/RwDjTTtkQAPJ17fEbqhuGDpu5NhvBzGvfCbrSrimpIiqJN2HMWjuSf+Bvy220JhDF3kN2cVuCb6EDDeJLdnKRG5gBPgtWwpOqPHGWxlGx9hBVhFowMKRLancSVRwZex3zCa9U8nnbz+gVB9foLDFY8B8m/jLFqXTvo5964Xwk3QY2yYY/GVZH+Z3cgCsTwSUoZRRR0KIibV2ZiaiplC/zwQKTpApP4XmwM6WhEiKQNNzul+50nTUA/72AQIFiSlBQIwLrjzcIaOvoMoH6+hg/1D6qvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2ccSyFXo2q61w/IXpK443svxMbmU2n5I/p3tpxWBJA=;
 b=IX3dTdqbFCIMjJnHz8xBNKQVzLLgisD1Tg3npQw8KaBP8WNNDDOMzUq45+vYBssC2t6YWk+QvE6BQuInsq2XcLb9ZMzaX3JQv76kDe4OkCWkrh5eW+px1z3UXfxwgPg0wib/C/sRqJfHJpNeYKdHY3UVvXqW0c+JLRYeXg7iHZvtu7RdA1z5XxEbVSHtdJ2NoyzCNEqDybMZ6yIQycPdzuGDP4PEYKkbUwbzhwHiIa5/RBHNQQ45K6mBn8IfPASNHqZlk6e+0Q0gt4ydRNl6Eo5p7+/pUaqprEVI16l/ZbBIEaEdlvlW1AXUa0gXtkUgfV7px/DWdMOR6Kzuh0X9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by IA1PR11MB6074.namprd11.prod.outlook.com (2603:10b6:208:3d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 18:40:18 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d%5]) with mapi id 15.20.6064.035; Mon, 6 Feb 2023
 18:40:18 +0000
Content-Type: multipart/alternative;
 boundary="------------w8IAPD4H18iOGHjwuvEJROrY"
Message-ID: <b94f9e72-d21f-833c-6ceb-f41b6829ec8f@windriver.com>
Date: Mon, 6 Feb 2023 13:40:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][kirkstone][PATCH 6/6] python3-pillow: Add
 distutils, unixadmin for ptest
Content-Language: en-CA
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
 <20230131230851.2785067-6-Randy.MacLeod@windriver.com>
 <097ee929-7d48-c925-60bc-a1147510e811@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <097ee929-7d48-c925-60bc-a1147510e811@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|IA1PR11MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: a14ed395-72ab-4fe7-9c74-08db08719855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CIEW+evZQll8oeaOHruTdfTD9odhgW1RgceCNvayN23BZJMokDoq4XvKJBjGsBkK6d6LUOWspAbondycXEkA/2px1dwp440/2/5tMWf+R0slG3wrd3NXwGVlSCUMrnXninQIA7kRac0mpUxxBR+RNnj7V08pXdXP+13Mx+PC6Qb2eQNt1FaZSJNFm8ru9kKwRsbrbZiloRws8jmK2fto9J5PvEx4psGYBE+RjMo+l4mnJ5eO0kDss2fNrXU4yz2I/vBTZJjcpDfX3wzf72sInQZLu3bNzFbnCdXn5j0i2QMNZQdXOXn5zu08vGfxQsbbn0EQWDONgzFrXs07HE/s2bkzbmvGDvuqhy1YteH6McAmQi0m53+ses1+D4mcU6bztqVsH8ocu5Sf6ly598xddP/1NCnF+YinEHYcjyz/crF2w8/8GfNd5FvjiseN/2X/JtGJLoq10sXqGfo26hJLf+M7RYa6/1X4j4A3xtOvvyywl4WWH2d9ABeiUnHfNeiEHLw6lIMQxSdkfyxm/lsMIhEbvtlVFWgWQP1Q0MnZRntyND1xktoR+r6d2pEczjlN899uCKRd3Amli02pYY0X9skBjJKHZog6oiRG10HvWwXTimB6OAvv5iwxsVo/AdyUFWMHZOK56U5KloCwfRTstwu6CHqlGML+Oe9DL+m4CQvlCQfHSboAPjiByiT0hZnlhE2K/NOJbokq8c3x75TLdoh3OyixNOByusFTovfcB59jE8+/vHkQ+0UQHzeqkO3TJ+3pZxHFZiE2ZFIJEnHDKR7b+HbMVSFRen7ux27plM4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(451199018)(36756003)(38100700002)(966005)(66556008)(66476007)(8676002)(66946007)(166002)(316002)(6512007)(26005)(6486002)(53546011)(6666004)(6506007)(5660300002)(186003)(33964004)(86362001)(83380400001)(8936002)(2616005)(478600001)(41300700001)(31696002)(66899018)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WEppalNqVmswcjNqd2E5czJFS2g0VlRwV1FiUEo5VEEyZlVibnlMWmZad0pH?=
 =?utf-8?B?akxZZ3VtVlB1WktVaWoxQjRSc3VIY3p0SUNhNXVQYVk3T0pjWHgvS1pUZkQ3?=
 =?utf-8?B?Lyt6VFBsVkFjRWR0SXZCdlE1UWhFd3hkdytDQ2tZRUIwdmtSU2k0ZURLT0c0?=
 =?utf-8?B?eW1Ec3A1Z3plMGZHMVRjcUt6SnV5c3dXd2c3dFdvS2txZWN2TytoRVZRc0tp?=
 =?utf-8?B?NUlsY0YwdXVFb0JjL1pock1RYmE5K090anIzMytSZVR2Rllld1B6Z1V1Y0tX?=
 =?utf-8?B?SWUybkl2RjlVL24vQ2ZWQ2YyalEvdzNCMjQ5Rk9QOXRQVll1QkpVTTRYdGJ2?=
 =?utf-8?B?bThXd2lBUGs1Y2xzWlIzMDVrc1J2cVFvQ2JRWm44OEdmcFEvaHBHaVlIUDZM?=
 =?utf-8?B?NVJBWHBYR0pLMDZKNCtJYUtIU2lSQjZKTWhOYnBvTDV3QU16N3plRit1cjZW?=
 =?utf-8?B?SjVVcjlqbG9qQ0RobHFxdEN4b3lxVG9WM0g2b0tRTTdhckZ4TWw5TzhXL0xS?=
 =?utf-8?B?UzVaK2paL1FCUUlQZkJMbUdlTWZQUWdLNFBMbFJma3BaWU9SVmV2OFY3NFBr?=
 =?utf-8?B?aTFoOUtNSmFDbEV2djk3UDlFZGcvWGVUeENHS1QxTkdIQ0tvaE1iRVJtUEtU?=
 =?utf-8?B?UEZZbnA1U1JRUVREUzJ1OW9pZzA3T2g2MXFPVGp3N1V6YWtvOUJMaFhqdTJj?=
 =?utf-8?B?c1M5YXNDSjNPUmJYUTY4UnhDaFUyeGMxYklmRkpBTGsvZVdUQmo4Q2tTdnJv?=
 =?utf-8?B?OXlueU1pSWdubFNmMlBJK3dJMGRQcnRPL053bmxVWTNHTnl5ME9BdU1JbXNR?=
 =?utf-8?B?Rm9sZHgrdEpPdE5LTG82RTZsTkRqR2RiTEVPSW5JOGw5WTdmZ0R2bGl2R2Vt?=
 =?utf-8?B?emRsZVVGdGdoYVFtUWZCUVcrVDNTdWZTMFh2UmxLZ3VmSjlQLytySmtIQ2Rv?=
 =?utf-8?B?NjVhKy9OSzZzK0t4aHdrblNHdVR4aE5UVDFHa1B3MWIvdUZLQ0NVbktXeWF4?=
 =?utf-8?B?NEJ0L1lEbTBUZWk4NGd1WStDMGQzSmRic1ErQXk5SG5CeHFpQUI1Tk9hbHNr?=
 =?utf-8?B?NXVBNHRTMEs4MG1qNGJVK2pOWnAzY0VDWTJ6N3lXOU9kT1E3akt3TWNNTk95?=
 =?utf-8?B?eEhGYTIvUFA5MklEVjl3YVVGeGt0d0hBdC9oT2hlOXdTaGp6ejd6bGtOQmJP?=
 =?utf-8?B?K0V2Z2RRYVVYZ09jRng0ZlA5Wnlhb29LWHNac2NDTmh5ekJKZm90QzBOeEJw?=
 =?utf-8?B?all5S2VKOGZpZkc1NDVwUDgyYTNZTjZxeGF5dWFpWC8vY1RoL0V1LzhIZno2?=
 =?utf-8?B?SmFxWGhXYnZidTlqSTNNSjRTMTMrZlJaSzZwVTVpSFAyMTliZ3l0WjlwMWE0?=
 =?utf-8?B?bVh6N0NKaSsrSGlxN0RpS2RxRTJiN2NBL1VLUUZKakFHb0FZaTRnWGtzM1A3?=
 =?utf-8?B?UmlZT0JzTGtTWndvMWQrSUtQRzMxem1rbDFDT2NlcXBDWVVFSjBhZm1YMjBU?=
 =?utf-8?B?SlpLYVFBbjhXbnJrZWNOMTEzSm80OVVEcGJYcjlSM0VVdG5XSldUNTFMOUJ1?=
 =?utf-8?B?MDlDanU5emNlbENhZUhydGttYlBDK1hndmNOU1oxV1pRcGJSWllrdUtBb2Fm?=
 =?utf-8?B?RmFVNitxNXEwalJvelZmaEdRMDZKaWVyRkRhUDZJVDViUXg5YWpOamdOV1Ri?=
 =?utf-8?B?UmNETjFqVG9keng1M1RncFFGUGFDTiswYWVNaUg3VXFkd3hnaklCS1M2QnVZ?=
 =?utf-8?B?S0FwdkVwazFzcklhZng1M2RmWFdGZGt3ZDJ3WnhRSndXVk0ySVE4QXlkZGdE?=
 =?utf-8?B?R3cxcWNwQVRiTDhpaW9zOUllekJ4K1c1WUkzc051OW5uK2pzakhCWGtmOFJ5?=
 =?utf-8?B?T09ZcmQrWC8rNjdudkw4NG9DTjBxL2xXemRwVllLZERPWHZHbkZZS3hSZkRG?=
 =?utf-8?B?cHBFTEU2cERRQ2J2Rkt1d1I5cHI3S0lYRTM3cEhnVkdHd2VaL3J4S2dhUHhG?=
 =?utf-8?B?TE1NN0J0NHQwL1lsYnlicWJ3M29uZEhRdTZ2VjNiaGpYZFRJQU1ScGx2R2ww?=
 =?utf-8?B?a2RHU3h6V3VZMUJvWHpXRXlUZlNYQXpiMFVLTjJ1a3lhOXZQdFZkRzVYam5r?=
 =?utf-8?B?ZjZUdnpqMkxJOWt6NnFqUERCeWpkZlZWOXFsVkJ2M1M4QWRJbG1mUXcrZzVM?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a14ed395-72ab-4fe7-9c74-08db08719855
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 18:40:18.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSNM4oYKNx75gLU8ru6N7uqYxP29cf2UlzwnHirHdMVAgJqm4FQcG2qT9pAdFs2pijqlzqxC3WNuW9D6MZzJoycjQlYm6LegvBUuAHdJ9lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6074
X-Proofpoint-ORIG-GUID: 0AHZYzue746NoYkvUxFELvsHQgEyIHUu
X-Proofpoint-GUID: AJlnEmMFvLmD6FYlbSmAlscKSs1rXmJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302060162
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 18:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100945

--------------w8IAPD4H18iOGHjwuvEJROrY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 316Cj31J023584

On 2023-02-06 12:19, akuster808 wrote:
> Randy,
>
> On 1/31/23 6:08 PM, Randy MacLeod wrote:
>> ptest results:
>> =C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D 3600 passed, 324 skipped, 2 xfai=
led, 1 xpassed in 74.41s=20
>> (0:01:14) =3D=3D=3D=3D=3D=3D
>> for qemux86-64 with 2 GB RAM which is the same as seen on master.
>
> Did I miss the patch for master?

This patch wasn't required for master, I'm not sure why offhand.

../Randy

>
> -armin
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>> =C2=A0 meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb | 2=
 ++
>> =C2=A0 1 file changed, 2 insertions(+)
>>
>> diff --git=20
>> a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb=20
>> b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
>> index 68c81029c..5a466778c 100644
>> --- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
>> @@ -38,11 +38,13 @@ RDEPENDS:${PN}-ptest +=3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jpeg-tools \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libwebp \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-core \
>> +=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-distutils \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-image \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-mmap \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-pytest \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-pytest-timeout \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-resource \
>> +=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-unixadmin\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tk \
>> =C2=A0 "
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#100895):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/100895
>> Mute This Topic: https://lists.openembedded.org/mt/96664650/3616698
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

--------------w8IAPD4H18iOGHjwuvEJROrY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-02-06 12:19, akuster808 wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:097ee929-7d48-c925-60bc-a1147510e811@gmail.com">Randy,
      <br>
      <br>
      On 1/31/23 6:08 PM, Randy MacLeod wrote:
      <br>
      <blockquote type="cite">ptest results:
        <br>
        &nbsp;&nbsp;&nbsp; ====== 3600 passed, 324 skipped, 2 xfailed, 1 xpassed in
        74.41s (0:01:14) ======
        <br>
        for qemux86-64 with 2 GB RAM which is the same as seen on
        master.
        <br>
      </blockquote>
      <br>
      Did I miss the patch for master?
      <br>
    </blockquote>
    <p>This patch wasn't required for master, I'm not sure why offhand.</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:097ee929-7d48-c925-60bc-a1147510e811@gmail.com">
      <br>
      -armin
      <br>
      <blockquote type="cite">
        <br>
        Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb |
        2 ++
        <br>
        &nbsp; 1 file changed, 2 insertions(+)
        <br>
        <br>
        diff --git
        a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
        b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
        <br>
        index 68c81029c..5a466778c 100644
        <br>
        ---
        a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
        <br>
        +++
        b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
        <br>
        @@ -38,11 +38,13 @@ RDEPENDS:${PN}-ptest += &quot; \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jpeg-tools \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libwebp \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-core \
        <br>
        +&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-distutils \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-image \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-mmap \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-pytest \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-pytest-timeout \
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-resource \
        <br>
        +&nbsp;&nbsp;&nbsp; ${PYTHON_PN}-unixadmin\
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tk \
        <br>
        &nbsp; &quot;
        <br>
        &nbsp; <br>
        -=-=-=-=-=-=-=-=-=-=-=-
        <br>
        Links: You receive all messages sent to this group.
        <br>
        View/Reply Online (#100895):
        <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/100895">https://lists.openembedded.org/g/openembedded-devel/message/100895</a>
        <br>
        Mute This Topic:
        <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/96664650/3616698">https://lists.openembedded.org/mt/96664650/3616698</a>
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

--------------w8IAPD4H18iOGHjwuvEJROrY--

