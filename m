Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.82])
 by mx.groups.io with SMTP id smtpd.web09.4188.1630161626104591226
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 07:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=yr0IpTsT;
 spf=pass (domain: vaisala.com, ip: 40.107.3.82, mailfrom: vesa.jaaskelainen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atlyDdZhM6HrAuV97LxK+u6bCQYz7cw2C+2yuEuNlkXTfuE6i8MpZIcSFlh3YQIwtSiOR28xaSoPmJrKqNn2cc8cFrfmq9A9Ja79BtWv2hqeZFk9YySpWa9MAbLcksnd/2nQe3e/mvgYWWHBvmUNlT7LqBKv/5R9C5bmXV85TEFubxI8mpeRPwmQ6jGcqAdsm6rPoJariuQkXKzuX5k2Wq6R4yfuh+pjiqTkRz04E1ETNQ64VfLooxZGRgC12UXbcdxmTiTVIjEwujeNf5Iirxdgcr1Bv/1VFekrqYXzEsIf+5xCypTzOI31Ow9NJe9dxsErQTVT7mhAIyEGqT2qLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBYfDESA/SkDT35fZ+kXdKOdC/QHYzAx6lAU+Y7V7Ko=;
 b=GP0hq7sYB6LoQBXMkj0HPcONwoLN4Bro4/6YaBKKN6qw+6/BXUCp0FCs/kUFc1whPNHiHGJ7bX60xpbToj+tXW143QRge5F6k60UtJytbjXtZCZhjKKU6w+AopQ9Jra4ZVr4sf7D03wC3cfCYj6ek31FPDpj8rssPHBz/Qs/Lr8AzIhK6tOSJfg9j8p0fwHEKsCwXdv+ECyl2PpA1tjIcOWLkR0HTQBbPXkmfX403bxUtH0HL37V7rU2+fZwTgYiizcWMfh5qWTEzhEkmcyaENMQ47eVN33G/Ljo5lztBlJ4+3cDYb9+fNG32xftFOlp/o1OkvHvhwFcsFe/w4unGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBYfDESA/SkDT35fZ+kXdKOdC/QHYzAx6lAU+Y7V7Ko=;
 b=yr0IpTsTf9hj6qv0z8v0B4+6f6QQyV06823D5dBiEXdatotGQiN1K0KTPMMdzt+gZM2u/1papPypFit6gYhs5XbjlKrmnhKIQUj4wuxKRDDIgN2/gV1h2ISX3zq9VS4z7N08k0u/1RxIE+a5EvRepEh1HvuBo9QWbvzizzYNDa0/ahv01HM3wZ4XRmQxfCe5eSEI7eKaAiKnPEtUGMFVuUBxN2xyNQ6Z6tGrT/4vUV1iP2QZGote0pqQGAZ6OZv0iyFcxrs3rONrF1YVh/1R2NBHnWSzN1L6QUS/qjdO494HqywKk+JYGZzXfiXSd7wgC0XrEpyDCgDnFvjMevTpJQ==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com (2603:10a6:7:17::28)
 by HE1PR0601MB2315.eurprd06.prod.outlook.com (2603:10a6:3:93::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Sat, 28 Aug
 2021 14:40:22 +0000
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4]) by HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4%3]) with mapi id 15.20.4436.019; Sat, 28 Aug 2021
 14:40:22 +0000
Subject: Re: [oe] [meta-oe][PATCH] opensc: Upgrade to 0.22.0
To: Khem Raj <raj.khem@gmail.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20210828112458.247264-1-vesa.jaaskelainen@vaisala.com>
 <dc1dc48f-2fa8-cf4c-02fa-7d727e83ad19@gmail.com>
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>
Message-ID: <a3e9adbd-bbdd-2bae-4dae-ebe99ea74a82@vaisala.com>
Date: Sat, 28 Aug 2021 17:40:07 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <dc1dc48f-2fa8-cf4c-02fa-7d727e83ad19@gmail.com>
X-ClientProxiedBy: HE1PR0902CA0022.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::32) To HE1PR0602MB3241.eurprd06.prod.outlook.com
 (2603:10a6:7:17::28)
Return-Path: vesa.jaaskelainen@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (87.92.181.210) by HE1PR0902CA0022.eurprd09.prod.outlook.com (2603:10a6:3:e5::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend Transport; Sat, 28 Aug 2021 14:40:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00e48322-4be8-4469-c1be-08d96a31c389
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2315:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0601MB231504328A3E5F7C497956A1EDC99@HE1PR0601MB2315.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qx6YatSnv7Mhz/McsJkjFPl8cHrhTIjVAqgMKamqcIJ4raOsCwdRgRHN7zQ0PUxOyAICQnT5vEVA9+vzC/RDC26+y3JNdB/gmJWCucrdj94O4kTucctbzcWsUhm4F10qRjjRYsqVPjN/B71O2vkI0P0vIX0778J9caCLRwIMwTCgjctvx31iZ/t5kNfQJCQcF0qQ75tleEbynUNaXXsosTL4PfDaShcvPcPOVK/96wOfHHaxT1F73UzrxAFTTc27dJIJ9GYHD3MymFnuTBYkr0OBd4pxRjkVmBpT8RuUNNnlYtIf9gzFMfCO0fnzfaZ2fmlmB0wmHc3mlVl+GReDp8G9TRLk2AV6ZQLF19TENspimIpIyOGLgQvkzpX1B7ZpNNRuBi0Nsor1+KPvgxs7Qgd9A1T9BijKiHog36E+e/cHRoRbQYUEcT1eM9ZiGUH7mnkOR2zriqE9yxTowuA9/+scT0TG8XoIlPnOG3o2KNCAjKAb6yev8ysk8cEyCEjId3647uE3M6GEpY0VVhKwKi2RHB34VkLbeuvhE/kjun4t3DGjJbDIuMcLJynLs2BS26GyTk7k6wxchX6rlvWuTo9KI4etFIb2CTt4MqHyiiNW7gL38BylCCtZrL/DVynKs0c6Z6ZK8wSSNLOUAstUdhn8JtRcFajK6ynXSdvylk/S9gUdxycrC2Y2FFoNLQ0OVR/2PlUFZ08n7ZbI+Y04tiTea/OX5zf0CkxaZfKzsdH8f4OsbSZcSApwdm6oigTCzk9sWusuvrQJln3MhUtoa3p9DCgHwYhO2QYK0PzyEgvEZIZtZQML0fP3vKiW1Of/+rDmO+OUgJ0tTSHM78ZZvYHLVJ1g3GnCD4LUcWmNllo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3241.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(346002)(396003)(376002)(966005)(52116002)(8936002)(478600001)(85182001)(83380400001)(186003)(26005)(45080400002)(31686004)(66556008)(6666004)(8676002)(6486002)(53546011)(36756003)(66476007)(2616005)(31696002)(16576012)(38100700002)(38350700002)(2906002)(956004)(316002)(110136005)(5660300002)(85202003)(66946007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nseANY3bOOayRSiRVIqIh0g9fV/ZghabmfzIjIVt3+XH6TvAQBo3Ijz6LIo+?=
 =?us-ascii?Q?tB+U1p5+CGE0uYj1uKKuqCFiQH4me0Wf3fixCFD8rmaiFMa2KLMOL1PcOAq+?=
 =?us-ascii?Q?UYLZUCeECp6MPDtVDk0yjivOLWHeBG5FG+UEaFb6EknPvQx62+0oQvr3UrrC?=
 =?us-ascii?Q?6iFuDbhfJ1+i+5/SeHBDiS/fHcoDOXPvTC9Gr2vMChdcgwnLzVgw7HDaaf4u?=
 =?us-ascii?Q?NRJXBNPpcU2p8BiOUASa1oEJDpZooHkrZsGAVJKd3VlXXz5RSoexAkLPhQSG?=
 =?us-ascii?Q?Mj0wQ4MiTP8Kad/zIG4ccuUG2++2bG3aJza1AaEOMxRwYRL2gJv+IxLJCJ4e?=
 =?us-ascii?Q?YsR0mQIum9a7iqfBRS+XVa5R/Zy8PsOXM4UP5wKrrCrIoZo6pPUm7Ox1Yzft?=
 =?us-ascii?Q?LI5VM+6xed3rEyYcJot6Xw0imU/oR4aWtFYd/7Htp/obNw+eAqK+myD0U2EH?=
 =?us-ascii?Q?JuS07P0DdjJ1B1Aka/K0pN1lT+6MMo143l9fULyUbqBg2NMNbODYDWbCWGIM?=
 =?us-ascii?Q?FCyCiaHw8Cjkqd4yaSusuYgSADOMx4L0RSbJiw/sZ1smB8kW85ZDQrbznMDK?=
 =?us-ascii?Q?II4+9oBTdCncR03vsJ3uvgIZBrtAD1FQS7mu5TufVKqt8o0y/rkS0S075J5I?=
 =?us-ascii?Q?eN1P5WqojVtmS+rxnUuXaVCXmTa68CKeYccCn4VRKLxDiLOxNGWx5eecGrQh?=
 =?us-ascii?Q?uKX1FyTtl/mXpnbVIwRY6RqvWMwal1rdFHRsJZ3vhpmIpB4Oj4DfzFCSnz2L?=
 =?us-ascii?Q?O2qD/w9P560UCLB+jDgdI41q50JsqHabRSsvXy2r2hByier6Dqc+H2BIiPEj?=
 =?us-ascii?Q?P2BtEW/a7I+b2ygmCqXxsHzogiAeL+nJcQ/O4P71lyx6kTCBvQTtohi3xdvz?=
 =?us-ascii?Q?YR6p3y7cJFbGMwwMRhhsaJxCq8XY/Or5qqvzBII9zODENttcKDol5xMu7Csa?=
 =?us-ascii?Q?nYmNpmdBg/jeikJHbLRevfRxrbln7pIBQhPU/od/8xIVjaU1qVkAztQCDvRU?=
 =?us-ascii?Q?e09vJ42zqZyvLb9uceJDpyClq5lEoTHrqaEQH9iwiHT/stVjc+XZkOqWf1U7?=
 =?us-ascii?Q?xFvximP31Ecvzl42XSDKkTus4GvEjMKHrtxvqFgoBe+gCBwc0S/MIG02JkzI?=
 =?us-ascii?Q?rFBJ1Jb2jvHx5G+5+uNdmDOV+0mnqaUcw1ckw3uz6T1s0rwHiiwGR5OyIp/T?=
 =?us-ascii?Q?DZhToz4MDIHmUKsTdvgdNGBFN66wPh8CrCQjr9+wppYFZ7nhLVWVFozlx25N?=
 =?us-ascii?Q?YA+3bv8NU+42XvvWJSLYwUvI2poiH0SHvGdHDzcHCLGbnxt4d6UpYLF79WDJ?=
 =?us-ascii?Q?vL/mbLhbRoeKERAbEZ1CZ03T?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e48322-4be8-4469-c1be-08d96a31c389
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB3241.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 14:40:21.6892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXAI7umQShXSyP7EoHPq/nI6GG7ba4GPwI9q0U/xU2vVzukp/EuKd/1v6fPraMi/yCossc5ZRwMpaJqqP0SORwrWSkS0+slPelN9roNk/sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2315
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi All,

On 2021-08-28 17:15, Khem Raj wrote:
> its already updated to 0.22.0 with
> https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.o=
penembedded.org%2Fmeta-openembedded%2Ftree%2Fmeta-oe%2Frecipes-support%2Fop=
ensc%2Fopensc_0.22.0.bb%3Fid%3D6a0c9ea9d3d91a5d2125f335922d1956b7d81f3e&amp=
;data=3D04%7C01%7Cvesa.jaaskelainen%40vaisala.com%7C79cc1819a7294b22bc4d08d=
96a2e54ac%7C6d7393e041f54c2e9b124c2be5da5c57%7C0%7C0%7C637657569502839193%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C1000&amp;sdata=3DPviMamQllyJ0qwgXgjPRxFqI7kV0GFyJN4BdJL92x=
3M%3D&amp;reserved=3D0

Oh well -- seem that my mirror was 5 days old :|

Sorry for the noise.

Thanks,
Vesa J=C3=A4=C3=A4skel=C3=A4inen

>=20
> On 8/28/21 4:24 AM, Vesa J=C3=A4=C3=A4skel=C3=A4inen wrote:
>> Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisa=
la.com>
>> ---
>>    .../opensc/{opensc_0.21.0.bb =3D> opensc_0.22.0.bb}             | 4 +=
+--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>    rename meta-oe/recipes-support/opensc/{opensc_0.21.0.bb =3D> opensc_0=
.22.0.bb} (95%)
>>
