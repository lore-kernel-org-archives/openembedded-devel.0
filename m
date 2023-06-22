Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45E8EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 14:58:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13583.1687445917391065475
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jun 2023 07:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=svMKz5nS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55378c4034=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35MBEhKV028451
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 07:58:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:from:to:cc:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=fbaJzvnB5PWFSpljRzNHEG5M48byEurDgF5NtfJtv4c=; b=
	svMKz5nSKSloiut9IWWO7jTYMUuekYcx1jihIatW14qzSlMojW/iZv4sclHoJ6GP
	RSmar59emrQl9RMscmQ354Q0v/3fpAhGLR75wivkoVukRswvJ3v4NlFwIzMmdxRa
	J9/FwC1n9QevAMPZhZfljbFDD8/pGFndREI4f8EaHgGYdj77ZpPqUMkUXVNeZ6EG
	3/OURKnJHZ8A6yVpPEVodK6mdWbwxRMahkeWuKJT5uJHRZaaAAuSr+CUOgFrHEwP
	DzZxqQucGueZlCq9D3he8iVPJo/BUUTuGMrX6rzOBKfCI5V1QAv33dN5Nz5Gd24n
	1rzUXhovjGXuXxN47Yu8rg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rcdctggav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 07:58:36 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 35MEn7Za016590
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 07:58:36 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rcdctggat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 07:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoomTv6HadcHf9blA5BlxirJOHIsQPlPrgXx7Z7suwNUJPoAUMF9s2b+cAZS2FuQu40j4HCoXOYUKtgyxoFVknHOOhwvIZNsSA82eivg2WQLmgcOVBYnWwqSJjGiRR0Jcz46KdqFbbYOCVfs0bWs7GuiuvYt1HovL3ByYYcmDt7TUZsvM9Z40iJ6aGt+H+39oyCfEVrZZZu+ipclo5KfcL2NCIDzVtzvX3Cy3+ug4YJmWQGL6+CY2NmPMRHy51y3m41oYrKej/CamI7tyd43jt0MasJ6muSSRY5qXvHTtlaErR7EGfn8YmHzaW5f8C0YKCeKQpGkkVzNlDYJAzRdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbaJzvnB5PWFSpljRzNHEG5M48byEurDgF5NtfJtv4c=;
 b=DuYQ6fHI7D0pqvccgNoqqPGr+WahefhHraf0+bOkO0Iz2fXX0X/MXCFyVbf17j4bHKiCyu3HU7Z2kllatGQ40FZKgwZXIMxvGKldw5aSXuz0JyurwgnR4DTklBZ2/6UwjucOkVkxtWpWnfzbXnQixKnFLdxHP5zUqgDSh/qI8AgRfHTyHx32AhvxxTSo3NBn0nUlMb1prN84MhuQzFMuEyYwgWUMywdzUAXeutnFYr0W9pTBF2BeN+MzMU47nG9+eJRA6P3JwisKpDbdIXTcwNyXGYwctIcYDfMKZE1M4vlnV/BloeA4Hep54A2gm+Wi49BtTo+yIojSWX/l5WmX5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 14:58:34 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::6d5f:a33b:c280:2981]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::6d5f:a33b:c280:2981%4]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 14:58:34 +0000
Message-ID: <81225342-ea96-da5a-04e0-68fdd2d85d8c@windriver.com>
Date: Thu, 22 Jun 2023 20:25:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/1] opencv: fix for
 CVE-2023-2618
From: "Mali, Narpat" <narpat.mali@windriver.com>
To: openembedded-devel@lists.openembedded.org,
        akuster808 <akuster808@gmail.com>
Cc: hari.gpillai@windriver.com
References: <17621A69EF96117F.8048@lists.openembedded.org>
 <5d2fda9c-c993-1d26-f36e-e75a42571a37@windriver.com>
Content-Language: en-US
In-Reply-To: <5d2fda9c-c993-1d26-f36e-e75a42571a37@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY3PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::18) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|MN2PR11MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6ced24-db8a-430c-f779-08db73312661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gPmuUQ5EH6gbGgVP8FBx5prWJw1Sz2TwX+s4WospISIpxXcOiy1qhFWMsKNaME/Veeh4OmIjhVgjLOIGLt/Zn2YK+DmyvlfAI4ym0AY83rF6A06Hd90AwGY77sbITscBwgSdwI/MmF+X7ih6hVbmZ0fV005PGcNkPFf6l2h+fQUX1aKpDUrAOXNtG+RfrtADaaA/v3t3VzbCy1SsCjl/H2+Rp7hm4DwVj+v8ocissGkVsXbz6e95f5adn5ZLLhHqyeYFLtJOgZUZBNbbkzdupg19sFdwCttb5Yf5onTCeGd6dP1mzdqCtVBM3WBMfJS5X0E9gVNJ0LrKbo2dyKl/i1Nc0qIHlmD57YKspbIUnWEABIaU8IxYqR5KfSnV31oui3Fp12rXkmYoWtPtI+ShDhpA63HgcwPUr/vbBecQOLeW218lBsUk7J0UY1FjBOwvFXYe6ykvPHFyWeXIQ/VN32yWMWRKY45pZO6WrdG2Gedx9t69zLRFOoJWnIl1RT428Z1ROFnFRWLrVAqvtwcSbHNGGw/vdYTnV9LbmM/V0pj+N4Vrg8/oME3hxqX9hbHs2WjP+zI9Xofd216vHNigxjy2GZypiqRzhaaB4iGTjbLj8sUrKPuf+plx7FQ8w8Xh05HVBwJxlw6GivUXta8J9J4lWRzE85xVwpYrpnihxXg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39850400004)(451199021)(478600001)(107886003)(53546011)(83380400001)(5660300002)(6506007)(6486002)(966005)(31686004)(66946007)(4326008)(8676002)(41300700001)(66556008)(66476007)(6916009)(8936002)(2906002)(36756003)(186003)(26005)(6512007)(38100700002)(66899021)(316002)(2616005)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QjQ5YTdZY042UlRGVXRibWExRFJpNWV3dyt5T3JyWHhOdXVGM1p0RmZOK2hZ?=
 =?utf-8?B?amRqTEF5Uk9mb1U3anpFWnZ5ekJPSloxUVIzOHJ5R3RkTm5IRWhhRnN3RXFv?=
 =?utf-8?B?TTF2YlJPcXA2MERabnZxQkhMTjRGZVA0ekl1emRxRXRPWmM5UndvMVJYeHJR?=
 =?utf-8?B?QytGLzRNWDB6b1ZwWkp5ZVFzZ1VZM0JMZmxvOTkxVVhNVmxOMHNNNUFnSk5K?=
 =?utf-8?B?enNwZGpzaWcrTzhpd3RoZm00S1lyR25XU1NoQVJxNUozbmlNc05zTGgrbGdX?=
 =?utf-8?B?dGVBejZyYU9OemtMc3kxVFM0SUl3MTQ5bXBYTTlESXdqQXgrR0E3OStpd0p1?=
 =?utf-8?B?YlNTMjAwd2tPa0tGRXB1clJ0VVpPWTFGQzhvY2JBcHJzdzFQR2wwQ2IyaWho?=
 =?utf-8?B?dEJCSS9XeGpYVzlCMm9Bd0dsR3BCNGFNemh2Sm5wRUtqdlVNQVZjOUVCQ2FX?=
 =?utf-8?B?bERqVkNuNDRZL1lSN2FLaFNwWkRPdXRRVVJqS2dmeTJhNVhzTXE4RE1zbFRP?=
 =?utf-8?B?RlBHalA3QXlTSGk0c1dlejVzV3VDTFA1Um5ma1o1VkJOY0lIa3R6elJwTGNI?=
 =?utf-8?B?WHo5NnRvb3h2N1hGR0tHWW16OEN6MzlJSmZNWDdHV2Z6TUVvY3JXbFpNa3N6?=
 =?utf-8?B?S3dVUm55dzdmNlF5Z2xOYW9UcFgxNFJ6VXhVTjJiNUpOd0RPelJwRjJWTjQ0?=
 =?utf-8?B?TGVTdWZKd0luWE9HaVBVM2NVYW1abW1LZERjQmpHNkJ1ZVNhK280S3ZoeFpC?=
 =?utf-8?B?N1hyTWdiZmtORk5WUFBDaG9tVllTTWdkaCtFY2pBT1B4UnBiRldTY1VTQ3dr?=
 =?utf-8?B?cVhLRWZGWWhrbUYvT0gvQllJdmxta280L1ZEM3hGc200NENaSlJLVllGbVVH?=
 =?utf-8?B?Q3JxVVN2Wi93L1MxYW13V0JCTlFkSHhEdFcxajVBVFN0V1JZckdUcGhzTVg2?=
 =?utf-8?B?Q3JCODBPUjVyL3JtZGJYN1hCUGJrMWlORmREemw2bm5vMkxGWlNsaEkwY3FO?=
 =?utf-8?B?d01pYUoxZlRwZVpieEQ1dDhqa1NSeXpPVU8wRUZkY3N4NXp2ZzlpM1JXM1RR?=
 =?utf-8?B?eitmRkhXamcwSDhMa3NLOTliclQzZUpUdTU3Y0lwVWE3c2hNYkVMY2NUL1N6?=
 =?utf-8?B?KzZ1Q1p1V2x4VEhyR1hVYnZSZXl1OWxjSDFJdzdjcjFPM3BzMUJuUmxYcXoz?=
 =?utf-8?B?Mkp4T0JSdS9YV0w5amVnbkhnSlBDMjNUdGpLc2FvdGZxME53WERmeGNWcEpI?=
 =?utf-8?B?YVF0SWdBS0VqTGlDUWY3ZHdqVlYwRzVlbFFlaGc0cDY4T1dxVmJrNm03QzdQ?=
 =?utf-8?B?aDdaL041OUpUVHlJUTY1Ryt1cVFMUVc5akNmMGQxOEtTQVhySkw2c0M0bGY4?=
 =?utf-8?B?QnBGdkM5WU5OZDUzdVNkMnE4MG91TEY2Y0NhYnlzRHBFSkVZT0I2MnE2T2Z2?=
 =?utf-8?B?M3dLeWdaWklYVVhKOFY4Mnk2VG5CWGw3ZnA4UVRZWk5aM0dRaUg4VDFNUXpY?=
 =?utf-8?B?clU5SHFrREIyMXlBTUVKcGRFNHp0bmJvN3gzYWZydlM4S2t0a1VZcGZSMWU4?=
 =?utf-8?B?VEx3V3NxbndSdEVYbE4wRERHT21JYXZXamlUQUFqS2lKTmRDQnlOT1pKTFhq?=
 =?utf-8?B?bmpIS1RIWk9QVGJrQVpIbzZxWjcrN2hvSjVzNUk0WUpDWXdYWkJlNVZna0pO?=
 =?utf-8?B?aE5zODZDQTF1T1ozTSt2V3ZDVkU5M3YwZmh6K0xqNURhSE1rZFdkSFZiVWRL?=
 =?utf-8?B?bzJRUzRYV3JwVHdKL0IzajBwYTNRNEVLTlFZU3hGNThzdkZQQ2Q2S01JeDd0?=
 =?utf-8?B?eWgveEpKdG9pZU5HUHRxUG5zN2hSMjhyd2x6N3JNSFFJTm90OG1IRjRVaEYz?=
 =?utf-8?B?UXhOdS9BRXc3Ynl6c0ZBZWQxdksxK0FiUDBOVXExS0NCaFlCWWhycjdXcnhF?=
 =?utf-8?B?K0M2SjZ2YitzeHZLWjNYWjFYeEdPZVBiZGNUZmEvc1A0Z0gxQVRFd0U3bkZF?=
 =?utf-8?B?YmVMbVR5bmdrandHd240QTJobjA1bStub2dMRHFHcXRTWW5IUGZtUnlTSnhM?=
 =?utf-8?B?MWV3N0RvREY5QjJGZlV2MnFsdFpaT2dqWUJVT0JqZC9mam9zQXd0bXF1ZTh5?=
 =?utf-8?B?czZOQWxuOHhqT2hoY2F0OE9jeVN6VTl4TEoxU3B0ZElkb2U4WnBiMG9TRGhp?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6ced24-db8a-430c-f779-08db73312661
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 14:58:33.9873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTKhJWOGaIXM9OCzblHF6pOMi2BoxXybOeVfDU2bVVrDH33lwm7ON8pt1rxJoAvMzfDScyQBYKEYnrHQAcDlRSQHHyGmmzEtZvSZL2w/yXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
X-Proofpoint-ORIG-GUID: 74kxThfzIbBIx0NAVg0obMDP_5X6LzUN
X-Proofpoint-GUID: l2fnOFaoy52t0KWhTjVC7OKr03Knho-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_10,2023-06-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2305260000
 definitions=main-2306220127
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35MBEhKV028451
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 14:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103490

Gentle Reminder !!

On 15-06-2023 20:34, Mali, Narpat wrote:
> Reminder.
>
> On 24-05-2023 19:53, Narpat Mali via lists.openembedded.org wrote:
>> From: Narpat Mali <narpat.mali@windriver.com>
>>
>> A vulnerability, which was classified as problematic, has been found
>> in OpenCV wechat_qrcode Module up to 4.7.0. Affected by this issue is
>> the function DecodedBitStreamParser::decodeHanziSegment of the file
>> qrcode/decoder/decoded_bit_stream_parser.cpp. The manipulation leads
>> to memory leak. The attack may be launched remotely. The name of the
>> patch is 2b62ff6181163eea029ed1cab11363b4996e9cd6. It is recommended
>> to apply a patch to fix this issue. The identifier of this vulnerabili=
ty
>> is VDB-228548.
>>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>> =C2=A0 .../opencv/opencv/CVE-2023-2618.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 32 +++++++++++++++++++
>> =C2=A0 .../recipes-support/opencv/opencv_4.5.5.bb=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
>> =C2=A0 2 files changed, 33 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch
>>
>> diff --git=20
>> a/meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch=20
>> b/meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch
>> new file mode 100644
>> index 0000000000..4cd3003e3c
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/opencv/opencv/CVE-2023-2618.patch
>> @@ -0,0 +1,32 @@
>> +From 2b62ff6181163eea029ed1cab11363b4996e9cd6 Mon Sep 17 00:00:00 200=
1
>> +From: Nano <nanoapezlk@gmail.com>
>> +Date: Thu, 27 Apr 2023 17:38:35 +0800
>> +Subject: [PATCH] fix(wechat_qrcode): fixed memory leaks
>> +
>> +CVE: CVE-2023-2618
>> +
>> +Upstream-Status: Backport=20
>> [https://github.com/opencv/opencv_contrib/pull/3484/commits/2b62ff6181=
163eea029ed1cab11363b4996e9cd6]
>> +
>> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> +---
>> + .../src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp=C2=A0=C2=A0=
 | 5 ++++-
>> + 1 file changed, 4 insertions(+), 1 deletion(-)
>> +
>> +diff --git=20
>> a/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_pa=
rser.cpp=20
>> b/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_pa=
rser.cpp=20
>>
>> +index b3a0a69c..f02435d5 100644
>> +---=20
>> a/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_pa=
rser.cpp
>> ++++=20
>> b/modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_pa=
rser.cpp
>> +@@ -127,7 +127,10 @@ void=20
>> DecodedBitStreamParser::decodeHanziSegment(Ref<BitSource> bits_,=20
>> string& re
>> +=C2=A0=C2=A0=C2=A0=C2=A0 while (count > 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Each 13 bits enco=
des a 2-byte character
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int twoBytes =3D bit=
s.readBits(13, err_handler);
>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err_handler.ErrCode()=
) return;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err_handler.ErrCode()=
) {
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
elete[] buffer;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn;
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int assembledTwoByte=
s =3D ((twoBytes / 0x060) << 8) |=20
>> (twoBytes % 0x060);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (assembledTwoByte=
s < 0x003BF) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 // In the 0xA1A1 to 0xAAFE range
>> +--
>> +2.40.0
>> diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb=20
>> b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
>> index e4fb676f7e..f98fec72b1 100644
>> --- a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
>> +++ b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
>> @@ -52,6 +52,7 @@ SRC_URI =3D=20
>> "git://github.com/opencv/opencv.git;name=3Dopencv;branch=3Dmaster;prot=
ocol
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://download.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://0001-Make-ts-module-external.patch \
>> file://0001-core-vsx-update-vec_absd-workaround-condition.patch \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://C=
VE-2023-2618.patch;patchdir=3D../contrib \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> =C2=A0 SRC_URI:append:riscv64 =3D "=20
>> file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=3D../contrib=
"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#102780):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/102780
>> Mute This Topic: https://lists.openembedded.org/mt/99109738/7199376
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [narpat.mali@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

