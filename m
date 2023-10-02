Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EB3E748E9
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 15:53:54 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.131])
 by mx.groups.io with SMTP id smtpd.web10.85840.1696262030037517433
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 08:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=laO7knE7;
 spf=pass (domain: ni.com, ip: 40.107.220.131, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kG5Yo48Okg0uEqOGfZ09lGh5pNCaMvwvmvvS5h8MKSlSBZhFXYJDR4Sq7qPNTSYqR1Ton898JhNxlaNCOsr3kAFIRp8QlJY7jrKOpWsIqiI6i29e0dLznmCathLzHmPfXns2EMA++2eUObso5U5k0KuloSG8cjXAsx24fSDNTC8sCqsGcg9Evu7kbVxcSwQGWtUGSCicluRUiii1q9Lx6MMHegWZ8m29bzvuVr8eyEGjs+QF2e5nNNcuZ9z/ry+6CzhVSTPy7+gOnkzlpjMdxIA5fvai8wbJqvEeoprO2rpPnjS45maAu/Wp066uq3OCgpKYKug7DZafXRwAh4BCVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdSQn0w7yBoEhK6MX5WLBza4cPJJzxPw86hiyzCVuiM=;
 b=Gx3Dc7t89zoc8U6Oo2qRQgEV61p5sAqcU6XvWiNPsFidC+Uzip6WLRG7+VlEiohP/2TBzY7OIOwsNUw0Qo2EyIeLfiO8cTNqL2Ecs0sFH0/BJpsAdtIBAed0VFyrZOKHeSkCCfYJdA/NwCQQboXzlvdLN/M8+2ZuxHkbQPA3jOvGV6gqvYcbNuUUUjE8SXkuPoL7RSe1gFoQ1daAH7Oao0BPsLtPfpPdOnkLn1JlRY0e/l2gOv2SeiTJ3ZtzgRZ9oYkTVL9YWRMeoLQpbeWx8gitrZPFUacV6T5ZIhH8hjBHPDoQiaTPvwiMXP/9PLiBbwOilFU3SIE3G/tZUlYMmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdSQn0w7yBoEhK6MX5WLBza4cPJJzxPw86hiyzCVuiM=;
 b=laO7knE7tnBVcQKfSjwwyaT+q770fEhnxxB+V7N8nW4WoEL0dCiu9VtsA3Zs1/FqBhxqsEBJUNvvD2iW/LFhITLq8KSCa124HajgeKD4624F5oXD2kwYiEcOsWr3PHgYwhtfD/dufkHGcKOWrbt+dD+3giT7eab/EJZeTXS2990=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by CH2PR04MB6505.namprd04.prod.outlook.com (2603:10b6:610:67::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.24; Mon, 2 Oct
 2023 15:53:47 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::988f:efe8:8e8c:845a]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::988f:efe8:8e8c:845a%2]) with mapi id 15.20.6838.016; Mon, 2 Oct 2023
 15:53:47 +0000
Message-ID: <23d7986a-4bd8-4445-ac32-3f2d8fa98663@ni.com>
Date: Mon, 2 Oct 2023 11:53:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] bolt: disable CVE checking for this recipe
To: mikko.rapeli@linaro.org, Jeffrey Pautler <jeffrey.pautler@ni.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230929170731.749414-1-jeffrey.pautler@ni.com>
 <ZRqL7yT0ME00CakU@nuoska>
Content-Language: en-US
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <ZRqL7yT0ME00CakU@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: QR2P297CA0001.MEXP297.PROD.OUTLOOK.COM
 (2603:10b6:3d0:6a::19) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|CH2PR04MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e49162-a4ce-4659-3916-08dbc35fc366
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mgn8wuUgR8Ra9AoIq2T0ULc76R+zp93Crk6e1csDbAUY5i4ithNBW9db5P9j67BhmNuuAgOF2/TOU9gLvkNEcZ+Pmm7CyKPUixQXEgZGvRmojuBBeC4Qh4Tpeaqw8cYBVunZSVU7Lz7908xy7nZ1Nylf4d/C4P6wSWVM9CC/KEEN5Dt5oPxHJOszpm69Rau/AO0/WJs2uDhYKomteCGQ06Kh4Ln3sNb3sHRO2ZZOG5E+gP0gqmPT3HHNykzfwn9TVfpMx+spHydeDL1u+GEuJZl5dxbBgDZ1gQbo1bxKugoMNvq6QLwF1/MqwfJdGMXoZs2rECUIMYVJW/YLcvlsXRVt3WYpDSk9BZi0acRD1QAYbdhqshyUDKlk1BERiiVEwjGrqVvfxBTxqOdK+LRX8+6UgYr0km93jkW2DGwfjAMdGpiXjEN1WO9I0YKwsMy9SB2jyz8ilb+lbC04AUA1f9YuTuNOytQdmvzyHPEzQHXeoYdFZ261xm2HOm9IZtRwMCOYe846pFLOWtKZfhZcrS5d3kRyxgbNbmXFzG6sikLS9BmPHeCbulbAlmsBQCcuNiFGsd5L2/5WZLgNYizDaHIEdIuatt5ssL53wkZAT8pWiNab9dM+qG+QAx11d3WaYY345hSl+XYKpohtj6hzxQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(53546011)(6506007)(6666004)(6486002)(966005)(36916002)(478600001)(83380400001)(2616005)(6512007)(26005)(2906002)(41300700001)(66946007)(66556008)(316002)(6636002)(66476007)(37006003)(5660300002)(8676002)(8936002)(6862004)(4326008)(36756003)(44832011)(86362001)(31696002)(38100700002)(66899024)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzlBWU1OaHR6Qk9vZndzS01WQjdIL2hOanR4VVNzdUpCYkt2Qml4NGpmdlVs?=
 =?utf-8?B?amd4eWRzQndGOTQveGo1b2dBclJqWlFhWmc1V3loQ0F0SXB2VW5oeXdDdDFx?=
 =?utf-8?B?YlZidHV0dFdkQ0IxUGdEZ3RsTWhTbmVoeEZqTm1rZU5TL0ZkZWRXL1lLQWVC?=
 =?utf-8?B?RE9tM3VmMEJ1SG03NmxOR2o5VzVqcFBXNmxjZis4MG05N1hqeDJ4WDBFRmdH?=
 =?utf-8?B?RmJDeG5NcnluR3dQd1NVNTZ5WW4vZXZ0ZWh1QzNFTkRmMXZEMjA0Sjg0SU1O?=
 =?utf-8?B?d2p5TU9SSENadGQ3Y0I5eGN1elRyVFErbUVFaUlTa01XVThSaDRyWWxYL2FT?=
 =?utf-8?B?MU9LZE1mMVluZ29HRENHdFJQK1I5UEw5VXkwL2YyZWgzVVVZVjZOVTFCUjht?=
 =?utf-8?B?REdpbzFxN2dETENKbUh6K2lpeC9EVlZxV3kwbUM2aks5Sm9nZ2IzdHNJTVVJ?=
 =?utf-8?B?alYrdGQwVjB6Y3FJN0xpQWx0Y096Sm40Ynk4NUphQ0Z1Y2gySWpFOCtjaXhn?=
 =?utf-8?B?dml5WUFQaklLTEdLWk5JNmVIeHdtY2gzdGQrNzdua0tONGhsdlpjWmozczFX?=
 =?utf-8?B?N0NFNmw1aGpaUDdBRWFFQUx0T3g0dDdZY1o5OEZqUThrNi82S0pPNmdxL0tk?=
 =?utf-8?B?dThjQXQ1YWt4b0JrUDVrb25Va3RtL1NaaFN5UHdNd25MaFZ6bmhOaTVvcWJW?=
 =?utf-8?B?T21JTHo5K2Zibmp2dmNqcEpLakp3L1pzUkV0dkZoRVRaZDI3Q1E1N05yUmdK?=
 =?utf-8?B?R2htc2hZa2pPMmdnR2x6VERSWEN2aHhwVlFFb2pMbGVxT2UrYzV6bnk4cFp2?=
 =?utf-8?B?ZWUvUjhLUEc3dURVNzBhTFVjVnZiSGdKZHQ0L2p6UmFCa3JuRnI2R2ZlNCtp?=
 =?utf-8?B?SVEzNUhNSytRcG5YaW80SGtLbVBzR0FiWUlsK1dNNEJ1Qy9rWVRaOXJHV29D?=
 =?utf-8?B?RURWUlZaOFoveU1KbXVDNjVyL2lNdmVDRTY1OUhWUEhBYi9ndzVKN3RDQmN1?=
 =?utf-8?B?UlZrSmc0aHB0eHBqOUEwbm5LSUxMbzBpZzlzeGtkQTBRRG1MdDV3Q0creG1X?=
 =?utf-8?B?anAyRmVqRWVsY0VwWloyU2pYMDlGNEhEdWhJWjlDQmlqRU9lOTBqOVlQZE9G?=
 =?utf-8?B?YUp0a0xKUlM4OXpCNGVQTzhHSnJoL1JIOEhJdVdna2JvSnJZMVhXdkVOMXBk?=
 =?utf-8?B?R3FqNVpyVWtVWHRhSmpCV3FmcGdzbEVwSHA2UDhUWmJXMmxSUk44UXYzQ0ll?=
 =?utf-8?B?WTY2ZVcyL0luLzBLYm1zYzhIcnRxSGRIejJySWhEbytyd25lTEdDekp6R3pY?=
 =?utf-8?B?c1BxUFV0R0FkcDVVdGthZVVKL1FVU0JsWmlidzcvR2FXUWlhc0t1MGRoa0d6?=
 =?utf-8?B?eHhMM0gwdlBkZTdKMXk5bnE2dUNGVkh3dlN2VmpkN3lqdTQvK2FYak9YUE1N?=
 =?utf-8?B?NWNjZ1ZpY2JzM0FLeXVweWw3ZWF0MTNNdE1vMHg0ZFdGN25GaEFWMmd6cTZM?=
 =?utf-8?B?anZib0tJTFkwa0dWVVRUbmVIaktrR0tEdDBaNWwwc3Z1bmtqYmZ4eTZGdFFh?=
 =?utf-8?B?c2hIeTlSUFlYVnRpb1lwbGhiWU9oeHUrVHlna2dZRmU4dFVkRUxTOHFGZXFT?=
 =?utf-8?B?WVV1MXZKRlRLblE3a1JnVG1MMnIzeHRnN2JnbTZac0xadk1iaVlLWEwyTFEx?=
 =?utf-8?B?eFZJSVdsSnd5UUwzSk1rRnNZRjQyWHFIRkNCcXVoOWwvelZRVy9tdmI0aTgv?=
 =?utf-8?B?ZFR6UUJJRHNHR0I5NXpPRGpVY0FVZW5SenV5MENKZHJoQXd0TE9OSUhTVHNj?=
 =?utf-8?B?cUJ5N2tYUEtINS9tREdKcWFBeUpzQ3Y5MHBNL3Zqb1luSGMycHgrbS95bjVD?=
 =?utf-8?B?NStQeUlKOFdvbjBmN3BrczV5OVBxQUtyN2lCbGxEWnB4MjhETEIxejRuNUNo?=
 =?utf-8?B?SURVajJWRkhhSGl5MFgxUmZFaXFzTWJZZWo1OFdCaTIxcllJdWhmWk1jNm5u?=
 =?utf-8?B?aHVSN2RHc09QYS9vTjdoTm9pK2lGSHhJZUMwdmhsWjZuYUtNQTZBUVUrbmZH?=
 =?utf-8?B?WXRrZFdoTFVwWnFTSjMwdWQ3OG9wY3Exd05WaXJVUUo0OE1vc3RndkdmYTVx?=
 =?utf-8?Q?QP8r8Gez4c2ZAHrUc59jDMnIZ?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e49162-a4ce-4659-3916-08dbc35fc366
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:53:47.5416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdbuewMti6rfb3xBpZYfdhUp9N1RYgZw+RjhGeOQ/swe2b2M67raQIu63x+gHSSrOcjBzLx+WVUoygS3ww/HdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6505
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 15:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105305



On 10/2/23 05:22, Mikko Rapeli via lists.openembedded.org wrote:
> Hi,
>
> On Fri, Sep 29, 2023 at 12:07:31PM -0500, Jeffrey Pautler wrote:
>> This bolt product does not currently have an entry in the CVE database.
>> However, the default cve-check logic that maps recipes to products in
>> the CVE database is incorrectly matching this package to a different
>> bolt product made by bolt-cms. As a result, CVE checking incorrectly
>> reports CVEs for that product for this package.
>>
>> Signed-off-by: Jeffrey Pautler <jeffrey.pautler@ni.com>
>> ---
>>   meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
>> index b6ad6337c..583cc6378 100644
>> --- a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
>> +++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
>> @@ -12,6 +12,8 @@ SRCREV = "5a8a5866a847561566499847d46a97c612b4e6dd"
>>   
>>   S = "${WORKDIR}/git"
>>   
>> +CVE_CHECK_SKIP_RECIPE = "${PN}"
> I think this is wrong and dangerous for anyone who in the future tries to use
> cve checker for this recipe. Instead, set the CVE product with vendor correctly
> so that other products/vendors don't mix the results? Hopefully any new CVEs
> in the future will set the same vendor and product.

Are you suggesting that he set the string to something like...
`cpe:*:a:freedesktop:bolt:*`

on the hopes that, if the Free Desktop folks open a CPE in the future, 
that it will match?

>
> Cheers,
>
> -Mikko
>
>>   inherit cmake pkgconfig meson features_check
>>   
>>   FILES:${PN} += "${datadir}/dbus-1/* \
>> -- 
>> 2.34.1
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105303): https://lists.openembedded.org/g/openembedded-devel/message/105303
> Mute This Topic: https://lists.openembedded.org/mt/101662068/3616788
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.stewart@ni.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


