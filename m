Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6284.1792568770666945038
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 00:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Y8e0pcoJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.84.74, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXyNmDcWB63b442eV++7B+n4r7tmlZEB5LMe94hxl4LX+F2RiQ5snmmebdFnZ0Q86UzKL1qUUZCDVQKdXSf3i+LGCKUT6D+pQRPi/eMAHd/D7ChASS0xBvsrGTNymXxHV16+DrbTMiueAFg8fWrhJwXLP7RJf1Tmy9RQ17sicrCA6kV834QaE17viDJqR7ChdEJmUUzwbh0JcI3ynGDIFr62g8/1/Fu0jRgmJItuAShqYAJc4t+2DecA7Xr7ItWRT84H/7HtzKj/CcMLArhEk6TFqggwma47gQHFj2nTIWHV0A86k8erO06AcK9Kr5U1qOBSM7Ib1EcLOGTfywYHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFm3ccDSEApHZytxB9tu2kydWoPaIj5oo8NSG4DzPv0=;
 b=xAf55b7fbkyZvwS0CSrvXHdN3HWx7Kgdvbin/2ZuQFz5jEX92lEGq41C3S32/7LTyLHoQdW/s8ByXz692nnqoz3qHzzEEC91Jb8n+Use+5eEfBYsRby74xJHQTGSiLWD/aeBcApGMgw9Q5t7KnrX1GTZ8eMcGVcRUD+RK2SP1ARhCacc3oH4K8g//JQPaVxKRRq241moC2S7W1fA5MKsqn1/N/SIbl+jdHpDJ1s3M+R/1wxjMyP1SmVnSZFGW9v0zcQK2RoThfA2pBPgw2XAASuKfGQl/DyS4XM1jgvEwKedKZrl4yrdpNCuOlLvAQi6irS4KvtODjMBoLfrHnD+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFm3ccDSEApHZytxB9tu2kydWoPaIj5oo8NSG4DzPv0=;
 b=Y8e0pcoJPIaLMjns/yNlXLqqOP3lfjTNcY/LdxbKJhgmCygx97HwQ8Joi3I1vem2boyqmq0fuaxTMsyL35I2vQ/oyCYcBiG16djR5BpaEVFvUWbP898/peBIcwJm9lRmehEDBuY5+Avkdt4CvX8LxlCTDTPEk6uSCW9+knQc96l6m6b12TGJIS4NBN4Nq4vtEQogGx+GJLz9ytGC292Ifd8PYuVT7LqCq84QOJZxC1mazCMZIRN0qMC1W8vLun9bijT3fzfBHO1UPvKeGM9oaSnR2BQ5Iwyb3Aa3RZHV6vqsKBP5hzOory1MqIsvPtFPvE5OZHIsD1DdJeJr5kfaew==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AS8PR06MB8197.eurprd06.prod.outlook.com (2603:10a6:20b:3c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 07:46:06 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 07:46:06 +0000
Message-ID: <4bbc9069-46fa-4f27-ae76-f49c7c9ae7b6@vaisala.com>
Date: Wed, 21 Oct 2026 10:46:05 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCHv2] pkcs11-provider: upgrade 1.2 -> 1.3
To: ankur.tyagi85@gmail.com
CC: openembedded-devel@lists.openembedded.org
References: <20261020134852.1679078-1-niko.mauno@vaisala.com>
 <CADySD0H_MkUebPR1yWPH3tdUTWZZFzfKGOabKEwJtx_o4TnJ_Q@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CADySD0H_MkUebPR1yWPH3tdUTWZZFzfKGOabKEwJtx_o4TnJ_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MM0P280CA0042.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:b::7)
 To AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AS8PR06MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 11eda8c8-a7e1-4fc2-b6a2-08df2f475d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|4022899009|3023799007|261009223027099003|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 8GD2txBPUXWpw+E8tQJzj72dVSIVcnq+9XCX4HKvht5Xf5NSe9MdkzRMnQ+q5BIhfogUMkU0pAmlsBcO4geUQR3ZuKMXjso4p9ltvNOHTEeufMrQXmnAF2zm+MXRUnzLFRQQ63ucJS2ATxTHsD+I6RqVr5tF2D/R8haLfYKX5K6wcEkUXadvqUVjms/OlgS+aI3wg1znOaKwCKSI6StHlcYLfGPFe+jjBJxQGnbi47CvIAeTWNj7K/Pt7kqMVIbnecz3WS/a4giUFLHVaYMCIrjWM0ki1HM4DfBuGsiRaq41Omlu982oXaWdnv9yQdfDURmhtL5BerV75B4U1Jf4HZcCNFMi6yOAJEumnJzZe8hfGBAyf3nP29h94zQrqTyih2Ix6qj7JaKzM4U6cB2Snivn7RTf5ZWfUnZRQB7NaT5HQ3cDg6cnwDMhEMTPZ3utUwl8zr6KeG5Kow8AhkGSkOSnO+8y+ZHbY3vf5GUUXE5oai6ubdZ4rFoa9XLetiC6ai/zjDlB6HNercb+OVUIP3kUHLKRKUCQYo/Xszq30wiMWfg8l100J8h8nKakrxFRN/gKNtwJuPUIZYDVxeimurfWJRrOm6tRqZTluQXMR1OE0qTAoMySWJTQrE7zWScX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4022899009)(3023799007)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gCcbtANkdevSFZiQiZPig0UT5SRh1g+KeC3+xJ6vAufh92b0Ri07GW7qxVhU?=
 =?us-ascii?Q?kHVIsapqFIXfRWRePm/oPUfvPjf2w6qtbysSOd7MhtBb67LgUqRftkaUBCLr?=
 =?us-ascii?Q?wdkqPFXgyql8kXVWYpX1/gzgy9oReEvZ2Po4kFZOeCdfSDC7elq6Sler2DR0?=
 =?us-ascii?Q?ksHLqSUms9tAKwo3T+S/PKTUHeYZhSDcbdDtvOVsHpkEHONPxsf4ZvMcdwzR?=
 =?us-ascii?Q?YIGC7yGKw6Lem4ZW0q/HZp8nHNEEFRV6S8UcOpr8X2CT0vrHdB4RoPsPKXPw?=
 =?us-ascii?Q?AJ7vQKkmLj+zDsvCPO5ultZMKsdl9scVoaGhn3iJaaTpntZAA6mwQ91njTG+?=
 =?us-ascii?Q?6HZvF2dyvzZFhOTggV3JShUQiHP9ofICtxNOJyf1JjSm86MV99yKx71S5LIf?=
 =?us-ascii?Q?a5DY0tIciHtFl3jdC8VXFRKH5Dj2HQr0zF86/7OJL0ZbyBcGyhuVnZc88HEo?=
 =?us-ascii?Q?6SwF2rA7Pic9xJzz4ja8h0njBKV31R2LhBDFQdcM/xF46k2VHUNQDsDCfmva?=
 =?us-ascii?Q?ajgj8xlSA6KWAHlql9ztPLeAm/4U0aZNVnK7g3Znpv0vA0BL5etjgR3q3IPS?=
 =?us-ascii?Q?V4W4/AmBK7UrWVcp8b2/Od+la1Bjc59PwFBgyhazqOV3qGx8KB7PuUch4DKj?=
 =?us-ascii?Q?ePIiP12E4NjP+IxX/QKLTYQwYMIfDa0zEDrksTiYmbQjSd0za1aqprv8YSla?=
 =?us-ascii?Q?tUgEPtlq3pl2H5YvcLE/rbtLVYjvyYDydEHZ+5I/49n/06ThSLR91tCcvFXI?=
 =?us-ascii?Q?WWbl6RqwZAl19U8xoYUTUpUESwKROaM9vdek3xYU9OmKvNdXA8jrEf7ecz4G?=
 =?us-ascii?Q?77oXICpb/quabMhOrSTdhpKwXrBmwWzTElGWXG2mPOS2GpHVhXV98S8GyTTJ?=
 =?us-ascii?Q?5cMZG3l2ieVnIpRT3Fx5KpY3Kf5sAt3Zsz4ZtGs/sAXGnRureEAfMRB4On7Q?=
 =?us-ascii?Q?nz2zRiBiHJVusx0Fs3YVBgh1xMTIr6AiI03GHsiNEJmT1gHf44Rwnn4IK05y?=
 =?us-ascii?Q?Qcm5VPJDlRwNvppQwmh8iPTKi3qY/4NxoIXQckiSkM9obiLQQDfiVCxCMwH7?=
 =?us-ascii?Q?/ZGGkUAlLrU/nH48jv6+AX8rh8wTRIJcXxI12N0Sm8L+vPdDXQpA0Tsq4zEf?=
 =?us-ascii?Q?FwbilKIE+KIMigNdIH3EHvnV5PHcm5FtuLdc2zrJwWvkcrK2F9jE+27szCMP?=
 =?us-ascii?Q?d2/UsOxeWGuDOKFGwqkASQh0LJYn2IGw/b+EOWS5mmoqPkS3AOY8b66vDncA?=
 =?us-ascii?Q?KyA5u0eebVELB9whD/u0bp9g1Qhw9z13RE4ZWSfGOkT3brKvgG00D7hzxZGt?=
 =?us-ascii?Q?eMujoCt9gf/uEDpzlE7UgQeSSDn3G6TWHO482VoEW60EmeyI3S2ldxKauGC1?=
 =?us-ascii?Q?mrgZjuvlU8QKSn5Qk+hofO9XTsO78KIp3L5mfN2jM+8qTq71O0NoyttiDThT?=
 =?us-ascii?Q?rro+bCrMXrkTwdv7XKsfgXnlpvZAZf7iabfRYEmXHYIkzK2tt0Zz6s9lmDCm?=
 =?us-ascii?Q?W/2nTSn+ikAn3JudEvB0Wy4dS0eQFr3Vc6me+9RgbE2mRUE7Y7+qOcVTJL/U?=
 =?us-ascii?Q?nTzxW+hTb2tjdsrc4UA6P7epyM9c6JC1yI9bm+cHd9NIJY3Sb5D1j8mZkFh8?=
 =?us-ascii?Q?IuTFVB+vU20L3JVQCwjzd62qREJ7KGr/C5qFSzkbNHf+/Oi/mHx8Aj3uYgKW?=
 =?us-ascii?Q?1FBsJPAwjvlKvO/pAM9ZTwOZz6ZAc81QXCT/bbulimC93FGPTVAQgmbH+71w?=
 =?us-ascii?Q?Ex5+ORNEQA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11eda8c8-a7e1-4fc2-b6a2-08df2f475d75
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 07:46:06.7792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rFsUC/azi5hwaLm0zVVqhMIauVD9bGijodOSQxZuYAIJfzmqi/U0s2V3vUpXVMEcyWqlIGlz2X7VRBx73hoZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8197
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 07:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131185

On 10/20/26 10:52 PM, Ankur Tyagi via lists.openembedded.org wrote:
> On Wed, Oct 21, 2026 at 2:49=E2=80=AFAM Niko Mauno via lists.openembedded=
.org
> <niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
...
>> diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2=
.bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.bb
>> similarity index 73%
>> rename from meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.=
bb
>> rename to meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.bb
>> index d95706d9e3..f7936d3756 100644
>> --- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
>> +++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.bb
>=20
> Upstream is now using major.minor.patch scheme, I think we should
> rename it as "pkcs11-provider_1.3.0.bb"

Indeed so, seems it changed since 1.1.
Thanks for spotting! Will rename.

>> @@ -6,7 +6,7 @@ the PKCS#11 Cryptographic Token Interface\
>>   This code targets version 3.1 of the interface but should be backwards=
 \
>>   compatible to previous versions as well.\
>>   "
>> -HOMEPAGE =3D "https://github.com/latchset/pkcs11-provider"
>> +HOMEPAGE =3D "https://github.com/openssl-projects/pkcs11-provider"
>>   SECTION =3D "libs"
>>   LICENSE =3D "Apache-2.0"
>>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db53b787444a60266932bd270d1c=
f2d45"
>> @@ -15,11 +15,9 @@ DEPENDS =3D "\
>>       p11-kit \
>>   "
>>
>> -SRCREV =3D "c7a5c8b62a0ff012b16574f01651254ef7e664ee"
>> +SRCREV =3D "b55b94344af87a058fd84d6e15390760a5585b1d"
>>
>> -SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protoco=
l=3Dhttps"
>> -
>> -SRC_URI +=3D "file://0001-Fix-i686-build-failures-in-cipher.c.patch"
>> +SRC_URI =3D "git://github.com/openssl-projects/${BPN}.git;branch=3Dmain=
;protocol=3Dhttps"
>=20
> And if agree to rename, then can please also include tag=3Dv${PV} in the =
SRC_URI

Thanks Ankur, duly added in v3 I just sent.
-Niko

>>
>>   inherit meson pkgconfig
>>
>> --
>> 2.47.3
>>
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#131178): https://lists.openembedded.org/g/openembedd=
ed-devel/message/131178
>> Mute This Topic: https://lists.openembedded.org/mt/121849116/3618471
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
niko.mauno@vaisala.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

