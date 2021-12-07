Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72873C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 17:16:14 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.92.70.18])
 by mx.groups.io with SMTP id smtpd.web12.46.1638897373641996251
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 09:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=hgmr1NDp;
 spf=pass (domain: outlook.com, ip: 40.92.70.18,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krsOGiSOuOgMohWqu36I7OOijoJwewAfUSy6wo5m4Afss8o1lwCRoemlrSEcthNEhMztSOX6O6mOGE1iXjFc/DZ7HyulgBSFiLtCocd+IGxO9N7Y7ynDc6ZkZEqPsMs8vBLmZqET2SM3n9Nm+eq686OB0bxsFnkxMaMUn4FQCIjden62zB0Dg3wbTLRXK707cOUWHAbnlDVQtnWlfmZSeSgv6lJWlYxX3jIc/0FxOLfqFsCz5Sv44zHDqRG670/NdNuyycp/knfAbDas/wWnXZW4Zfyms+9mV2VsV+kq3Uqz+BMIsPYIewlNJastCleKozxXyDdqYE0rHfFV89Sj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUWkWtCiskdKagspF3LzNyrXqfAO7UEGwvHJnWTKq1Q=;
 b=KJbCHtOQsexdN3dSYlU28DpP0c+l4mWMncCOmwNe34KvxjOEprn+92iwsBvFWgWRCLr/b37ey2NdU1/SryYd40qkzc/h4iZT4+hRRpIA3zRcyxLzCEdaHnK7PnCAub6bq6aACwvrMiXD9PYsI3asCkAOHTi6RICPGN/fzNzWKNXvzm2FJz7FT6iyvz5oxmK4K6ya7SNv8TyoGh3Trr45rERq5zA0Wx0/PeMlVld0blIhZmsINRgFdMLsiNLB4g0bHh9h/FE4xIaSQ+jBSnu+hgWryo0swpXr7w46W6pxceC8t4RH7VNqlZsfHW3A2W9wSTJ5kA9RMFnG3NonTzDuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUWkWtCiskdKagspF3LzNyrXqfAO7UEGwvHJnWTKq1Q=;
 b=hgmr1NDpqgmiV3j391/gW6xbJCLqayISp8TlX2bDKJ2NwF7gzj4RASERPxMsun+FdxqLcXlGKMuxrct5FYMqdSCKyMWLL1XGKr0RZoSV1EB2iyBUsGmEG53ck/x2piMzJ3RvNlqJDs+zhL0rr1qf34gsWtPWVqgTAxjtfnR2tDgD6lAC3AlPtQfR8IEDYoCE17h+I2xrrMi09rYjRYK86J3MxoQGLKT/BOnqt85VcQI67imV7rYXoBZKhxJ00muZ6b7BTKAv2qbTeIko1usxFDbx8taAYBmgvkLgsN/RcGl3S05emsJm1EAo9n8LMM2LMgtjm/U0yKPdM2uN1/ln8A==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2595.eurprd09.prod.outlook.com (2603:10a6:208:e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 7 Dec
 2021 17:16:11 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4778.011; Tue, 7 Dec 2021
 17:16:11 +0000
Subject: Re: [oe] [meta-oe][PATCH] freerdp: Use DEPENDS:append
To: Marek Vasut <marex@denx.de>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
References: <20211207113954.8959-1-marex@denx.de>
 <CA+chaQdiPbPXXOdw7PBfivuvw-fXZYeBAvDQM2NGL7h_Gr0ULQ@mail.gmail.com>
 <4a4bd8ca-9fae-c03a-acf1-d25fc44a84dd@denx.de>
 <CANNYZj-w7xB2r-FvXKbj88CNO5ibxnF1MfmN2z+p-j+_-HNLvg@mail.gmail.com>
 <d2604e80-3f82-d955-f0d0-620bea1ecbb0@denx.de>
 <CANNYZj95pzj8Q85BfbFim=h+rvPW86-Wm=Bqh=+j+JKBmWnf3g@mail.gmail.com>
 <c7ee5abb-cdd5-4286-3c2a-a0533a003af6@denx.de>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642DBE011BE6DC32FD856EAA86E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 7 Dec 2021 18:16:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c7ee5abb-cdd5-4286-3c2a-a0533a003af6@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [AsSRrGs2D92ccRd4/8dwgZc55yGu2/iwSZs9QlnKWL2DlgnA6QhFo1nIikZ0fw3S]
X-ClientProxiedBy: AM0PR01CA0123.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::28) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <f4209a28-e5ec-79c5-2265-82cdfd8b88b0@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aef63359-f8a2-4366-788e-08d9b9a54411
X-MS-TrafficTypeDiagnostic: AM0PR09MB2595:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NQ7TialU5SRVvGbvTWsxYvQXbSrRuGF41LA42KDVXPzYIjKpw25P4fp1+bZYvnqVhr9RW7Exk0pIX6eMAT0KSSHpiWxyuPePb8teDrygk3l4Di/NnXnEcfDY62rScSfvVnIdXgrxjsT4Tr6j04vH/C047VuFZ7ILGxWCRZdLgF82ajt0rXObN5LPZiFZBai9pIwfBJfPm2DyauEVMlrIfXD/nJZ7x6o+f+U18d0zY/MJ9bepeE8q1+97D1vrgzGe2uVlKxmM+Jcg49g3WURUuPcx1AA2yeI1fss0p7uKCTI78U0BT06jhvZNXy8CpkkpNlPltv+0Hrw/zEQuNDQ/bO2ekIyzx0fTECUPIqQJmGT8jzn3AufcADIYCsaCuwY1W4vzIxpCwhZ8JMegPtv+NuW3mYeUyPaAcx6Le/Rx7KvFNwvkdE9HR2DTeppvthSzgXhLiHxHuTR7uUfHfvArxEpB/3/jnvOpLlI+AUewORjKHvf/EFrYY2JkZ5gRHgtybsYToW9YpJKyU5k4IoO3YscafVtiJTvpGEh3yMubuw2M7v2HSthcVLMB7QC6D2beK2Wpc1sGCUFiHoq1oNDKXlgG2zjJq7AR3JHE6h7Zli/s2XUAtPlJPK9wXdV4YQO4
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Vld5TTZWTUVXQ0VTMDJyZGxiUU9SbUYyelhMNVp0UlF2U1JURkl4cFFKN3lo?=
 =?utf-8?B?U0ZHTHZZeEwrM0RmYkRMdWwxckJkK1FZT0h3aVpwajFqU2g4c0c1SmZBQXVa?=
 =?utf-8?B?My9TZTQwa1pTRU1WSFJNdVo0R3hPODFpWTd2RFpVSWtPNnIrR2JxZ1Bkc0U1?=
 =?utf-8?B?eUdIelZVM1hvZHRrMmlWQUFpQTVpTUZaUEhDN2Z3b3lRSC9Sa3Y4MzRxQVdZ?=
 =?utf-8?B?RGN1cTBPVnB3azBMd0FnbTFsRUNiQTRQSlFOb2NaYmFqd3k2b2t4Y3N5ZWRz?=
 =?utf-8?B?MDZ4VHJSaE9xalJmdGNUaTU0OWlLcDd0cUVlNUVZRUxiR2FWeVlZeWFaWjRC?=
 =?utf-8?B?TnhqZE9PdCtyN0tlL0loWmRiQzhDOCtWSFlmdUJkK2hCbEkvSVNPUDJWbVp5?=
 =?utf-8?B?MVdudTRBRnhKUXhNR1I0c3lPekFCRVUyam5kOEg5WkpCNGg3QzMvMFlXQ2w1?=
 =?utf-8?B?c1ZsREsvSmV2OE5EblI5ZmRyYmhWTVNaaC9mODRYOUlsQVU5c1hFVUc2cUlG?=
 =?utf-8?B?bDhHbTY1ck1waDBqY0NocEoxWmozbXhKWmN2UXBqU2ltM1V4cWFJcjMzemQ0?=
 =?utf-8?B?ZmpmSmlIUmcvNzJtZGIvOVhpOWNBZWxqdjczdzNiSlRzL2s1QWJvSnV4U2R5?=
 =?utf-8?B?NnRZWW14QTMrZkZqOEg3VEhYTGhaVUZjbHBNWEpXSndyRGw2S0tPM1hDZk43?=
 =?utf-8?B?bXRnN3lsQWRTN3JiZWlZcGkvZlN0UzlteVpCSnVxN0x2SEJkYWltVmx2S2NC?=
 =?utf-8?B?VVNmd21XSkhNNjkzUkRjSVpDYW01ZUwramVDOGhXOFNlKzI1MHBKY3d5djVl?=
 =?utf-8?B?ZUdqNVhiTTA1eERYSUdOQVp1Qzk5eUIxbkEzaHZyQmppNXFMcG9hK1RpR3hL?=
 =?utf-8?B?bFFNaW96dDV2aTlGYWFCVGN4VkRYODNOQVoxSWxIWDg0UFB1cU5uQ09YUWVL?=
 =?utf-8?B?aFVIRnJudXlSdUk1NWZMTXVoZ2hmbFFBWnJpaTZJRXl6RHZqbCs3QU5yUmx1?=
 =?utf-8?B?TmQ4S2lOVDBzL1VTNWR6by9PRU1wM0RWMGFvMlFBWDBTbTNFb1JFNG5VRDRm?=
 =?utf-8?B?S0FrU0FOUG5IT3BBR3laTGc1WWdBc2RXZnREbGlBRmlkWUQvaWJCS3cySTBv?=
 =?utf-8?B?b0JHaHZBTmNZcDdaL2pRbUNsL2Y2MDZaT2MvTE5kZ0VGdnBpYmtUbWRUM2VX?=
 =?utf-8?B?WjFwTU8wSkVPT1VDN1YweDdVNWE3UzNOSUNXeVJtRXJ3L25nSXZWN09GcDRh?=
 =?utf-8?B?c1AwRmlDUmVNaE5sRDNiNHV0ajI3T25EeDlIVVY2RkswMEg5cU5EakEwWEs1?=
 =?utf-8?B?K0Y5T0JiRjZUVGRINnNEMmlPUnpjMk0zWmFPY3REK0IrUGQyMER6L2huT1Nh?=
 =?utf-8?B?WE80Unl6YmdneUE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aef63359-f8a2-4366-788e-08d9b9a54411
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 17:16:11.5342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2595
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 17:16:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94241

I added something to the oe-arch ML [1] - please let's discuss the issue 
and all of the implications there

[1] https://lists.openembedded.org/g/openembedded-architecture/message/1372

On 07.12.21 14:35, Marek Vasut wrote:
> On 12/7/21 14:33, Alexander Kanavin wrote:
>> On Tue, 7 Dec 2021 at 14:27, Marek Vasut <marex@denx.de> wrote:
>>
>>>>> And as far as I can tell, bitbake can stick something into DEPENDS
>>>>> before it parses this recipe, so the :append is valid.
>>>>>
>>>>> Furthermore, git grep through oe-core already indicates a few recipes
>>>>> which use DEPENDS:append.
>>>
>>> I believe the warning is valid, see above ?
>>>
>>
>> The linter is an obsessive pedant, and is not actually always right, 
>> that's
>> why I want its author to comment :)
>> 'DEPENDS = ... ' is used throughout all layers, and doesn't seem to cause
>> much grief, so why fix it here specifically, is there an actual issue?
> 
> I believe it would be a good idea to start fixing it all over the place. 
> So yes, let's wait for Konrad.

