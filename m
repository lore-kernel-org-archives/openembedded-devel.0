Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066B2C77B61
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 17:27:50 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.53])
 by mx.groups.io with SMTP id smtpd.web11.100713.1682962057952783465
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 10:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=dlSXbYad;
 spf=pass (domain: advantech.cz, ip: 40.107.255.53, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qe1uvpqOJRgyE1DDL2B00wGAS9dqO9cD3Ee5hE0JYyNm7INYB1VbPwclBDGxBuMM+A0/Hy9z38Yb09HL4crNfNlZL1H0S6Vlk6GSj5ACt1/DJDcBmeIN7bHlad6s5gEY1Nitn2LZQTBKQ2W1nq5q7uZf9lblMQEsLYTsGVCuFjLK8r55DdNlF1/PERIMmGV0P999kTh/qabWxTEACEqaz1HZsB7YipCPanQgz88Faz8cbVmYR3gi5VkxeDnthNSQLl6KmtYFMFRg2qfw4vHzbI1Fhq7wNPXr2GXelYq+U+CkF9zgPFWnCeUJdpjovn1crBPcAS/S3rMyNB3AWglH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jg5stvSSrOurqbCRicdGW0trzfvY1j4/PbSJXS7iYME=;
 b=dHWY84k2xt8b0qk7SvZIPDOkxfzzMoE6CJD7ZpEmOA63W4R8R/0MkaTLItYc9PwKwRAV08KnABycGHzqbOI/8wh2saY5/kddR9wyC856Kerq7/pZgVNiOYBNzWjW1GsakfNV2vHfOTgNozSABjDgoZu++OlnTbVsnb5Wvx43YzfpIU8oO1F8VgrGmwHAD05wVilKkxpLCt1y8hrcQrZfO/uuJUQ0vqgUvpRj9l39nxMzR3ByOjxv/NdYT0MkwSh1qWzPMHBf5MsfCVPMXWFuc9Cgi2eCBZoMH43mN17+jSJCpV88ub87pqPyKKBdet7jZabRGtSCzM9a8CuTh4vPnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jg5stvSSrOurqbCRicdGW0trzfvY1j4/PbSJXS7iYME=;
 b=dlSXbYadleqAuH3dWvwwKNVjiF9gu2YsoIMMw47BWtztS73mYtCApoTmiqDXIfVd19qgpEkKjVqXKmzY7E9YjyWbSpNm6eTelED65ZnBcXMAD7MmJhWX5+gHAIw6QJyKEsFB4XtuX7zPhW8rQohg9YnynrZCfeYYn9O6j9AYWxn4tFkF3CccF3OK4Tfzvmi3qkq8QwdkS48Nu62qMbgSbNpnLJFal3P2RvMKHIpM6xES5q0Tixpr+ZVhHRK4rx/pn4WIYzL7F68M8b2TwfCw9gEDq+wKniUGMRl5jj47xsvji9lBFwago8U+CUeXht81WETz5/zaSeO3/fPiHpPt9g==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SEZPR02MB6435.apcprd02.prod.outlook.com (2603:1096:101:129::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Mon, 1 May
 2023 17:27:30 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::624d:2113:5376:e9b2]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::624d:2113:5376:e9b2%7]) with mapi id 15.20.6363.019; Mon, 1 May 2023
 17:27:29 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gensio: fix QA issue: non -staticdev package with .a
 libraries
Thread-Topic: [meta-oe][PATCH] gensio: fix QA issue: non -staticdev package
 with .a libraries
Thread-Index: Adl8UjKle7eKr3ItQTGkKN8XR/EVuQ==
Date: Mon, 1 May 2023 17:27:29 +0000
Message-ID: 
 <TY2PR02MB3678A6029A41D34F58087A52816E9@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SEZPR02MB6435:EE_
x-ms-office365-filtering-correlation-id: 91c222dd-467c-4487-01f0-08db4a695725
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mwJAaDDovSipbjI5w+QxNI1CI68K9IdBEm4GJ5POQXxUkTbWolAfLe7MCi9PVJXUUrE3kY/7aVnC4Y3Y8oA2eXJJR4sbmF6UjhWvh+wAcDC46GbDDhrCYJ6KnW1ZlJVCM/Au2ctvVhhVpPDPX7zXof1oq2jjRWQxrPcQY7FgT35nBRu0rB3MLLTST63bTA7TZuSmO7USJI6h57w2BnIMc3LR9P2gKr0upNDAeHA5dbgasoO1DK/KZPR+vQaFJYG9emVelaph7uHDKXSijj3fTaa1Tecn9vWYqqJ+xr2BWCIU5v5RxuJUtddqQLcagzoYNlQQgFmObOO8Vfy2D72fHhyrFYPRsmfUdWV9hHssUkchyDpCAbuWT3q5+ii0eXGNKHedNfjZ1PrLQusvRMcjlUIstL95D5RhZA/HnXiTZl9BQvCGlS9U1vDro5AO+96Ixvz9I8LM66SReK/Vx87/rBKPDI0CXQh0rGm+2jpBPpbI6pEwj73noZRczPWoiPlZqoXiDHKwfFouTQ1Wp8kvKaF/fal1zwyexLGmxsnylvOiznEFqJDo8MSUy6or5lvs8Gkd358Z3oWCcHXkvXaZxoxvZhkcLJylMML99yuOpiKbxoSAZM/tcSKX70OUqDZsNgYJKY3R07TZCSbqws9iRpRDRsv5dFzSk70huAUDAL4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(39850400004)(396003)(376002)(451199021)(33656002)(5660300002)(2906002)(44832011)(4744005)(38070700005)(316002)(86362001)(55016003)(52536014)(66946007)(122000001)(38100700002)(8676002)(41300700001)(8936002)(66446008)(64756008)(66556008)(66476007)(6916009)(76116006)(186003)(6506007)(9686003)(26005)(7696005)(478600001)(71200400001)(142923001)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b0dOa3RRT1FjV2kvVXA5M3Myb0xJUEg2V1FRNWFuZnE3SEptRm9UeVhYN3hk?=
 =?utf-8?B?aVFPdDBoSTdtOFpHYVFPcFBGdXg1dDFpK3ZaU1VROVdBMTE4ZzNlalFSd0FU?=
 =?utf-8?B?S09yaDltWU91ZnF6bjg3SGRvci92NXd2MVVGTzNWblQ1Vk9LU2czcFZqYjJ5?=
 =?utf-8?B?d1QwN1BLK0ZlMy9QZGdCaWd6QUZXeGlod2lsV3JHcHJiMmVwWHM1S3hQWjNO?=
 =?utf-8?B?ZEkydUNvVGk5SU90OWc3K2ZGVmkrZXE2OUFPYklLazcwRy9CUW5MRzBZMnAz?=
 =?utf-8?B?UDdwdEg4aFdLZEtiV2FIUDEyU3pYd0Y2czVUWHVmY2pJM2VJbWhiZGhyL3Q5?=
 =?utf-8?B?WU5xd1EyUXMwQ1VtT1Q3Wkh1UGhYOFFzUkUxNFl2YkQ2TDRHaUR6NFlHK0pj?=
 =?utf-8?B?c3hReTJVZ29wdkNINXlFaGFNOWhEaDE1MERSSXdlTXBNeW1VVlhTUEcxWGZq?=
 =?utf-8?B?R21vV0JxUzVlREVla0hvOWJrSjZTRXhpa3RTVFBxTGhSR2xMU0xYZEVzTXZv?=
 =?utf-8?B?Wlo4ekE1M0V1Q2JzVnd3UVJ5Q2RzSXhFSEtxY3BuazBncldHalV3MG9aTzh1?=
 =?utf-8?B?TjJSVUw5ZEwwTGVSQTdiNituc3dJeXhkc2tuc08vSXlpcDQ2a3J2NUxIdTdw?=
 =?utf-8?B?RU0zZzI0ZkxQQkdmVWZIbWZ2ZnlWNFpqRkx1RDU1NXp4L1BsdVhZSkxJTE54?=
 =?utf-8?B?Zks5cXUwUFg3ME9mRlppV2syeXBLd2x1dGIzbnRhdG9xVmdGTXVPcmV3eDhG?=
 =?utf-8?B?REhLYnhseGZkVnNsbnZEa1BGckQ2eTRSVXNRcXNXS0dlVnV2RHJlaW5hL1Rp?=
 =?utf-8?B?MWRhbTNQT3FJVm5JYkZiTXJyUWdHeW1Rdjkrd09Td3FLLzRKMEFCdDkvZUNW?=
 =?utf-8?B?b0E1VUlmQjRwbDYvZXBscGRQZ2hjWmQ2b3dVeEJETDFkSUdRQ3Z3UVZyckt0?=
 =?utf-8?B?NnM2RThqQkw3TE5hMVRZaU53bEVGaWNEeVNDblpUMXlLTHVRQjVYTVdxdm5o?=
 =?utf-8?B?WXRTMFRxTElUL09UTXFWa2xPeldNcjhIdlFvZzE4Y2RqNEordzNEN2ViQlpL?=
 =?utf-8?B?S1VEUHQ5WDVDbEtwUVhnVEhhZlhRa2ZNcUdkaFVrQitJSEpCS2IrZXc5Zldq?=
 =?utf-8?B?OVNrMUVzQVV4QTUxaFBiUDJ3T25rUndvbkR4aEpLQkVIdVhkazZiTllpRVpy?=
 =?utf-8?B?aGNId3d3a0ZNR1FqRnBVNmFiYmc5NlJiVTRxcHF3ZUxSV2NtOGxscW9BazhJ?=
 =?utf-8?B?bE1JWjRBRU5wdlVRMkhBVTZaZlNVOFhUYzA0amloVkh4THFWVWU2N2c1TVk5?=
 =?utf-8?B?VkF6V2RPMytSQU9tdDkwcThONTdiTkJNMC9lTitXNnR3bk5JSG52SkRFcmRp?=
 =?utf-8?B?bGEvWkQ4bjJFaDlkTVlHQzUxbVI5T21SdHFjYnFYOFBHQ2s1NU5VR09oMXBo?=
 =?utf-8?B?MjVISVJmSGlDcTZJSFFHdUpNQit5YUw2S2piNG9PcFlxQ2NheHZHcHZkOWc3?=
 =?utf-8?B?MzJWQWpjY1R3RmNtR3Y5aFFTYmNsOER2c1EwK004T0FqNU5tanNOZ1RDd003?=
 =?utf-8?B?RyszTDhkOGhVbVJrVkFDeWpmVEFiNXJXLyt0T2pFc1hjWUxOSk1yK09PZTBL?=
 =?utf-8?B?eTdsM0sreG4xR2VFYTlNaUJJOGROTkszY0pVNlp3bXlLOUlKTnVsMTA1TnZ2?=
 =?utf-8?B?YzIrcTROSHhLbm52N3NMK050QXhIL0hqbCt2a3JzTFRBOWdyWmJpZ0lGMHFt?=
 =?utf-8?B?Z2VuNXBHQnR4OTRNcGJ5WnFDWHJnN3oyYjQ4ZFVwSE9WWDIyWkhEQ2pRWmYv?=
 =?utf-8?B?czg5em12THQzd1dSMnlYSFk4TlUxRjJpUVFMOGpVK2NGZmMvRHRKNUtXZHcr?=
 =?utf-8?B?VVhudkN2a2VYYzJmQ0pocHFYMnV3MFlIcGxSZXNqaDJlRUJnaFdJUkJSemZZ?=
 =?utf-8?B?bWtOc3Vvczc1UmNkek5TQ2RUUVlYQWcwMWFYTmlQdlhNSGVzc1M2U0NHMlcv?=
 =?utf-8?B?YUViblRqNHRBVlRucFpOMW94dXREWGxQYW9SYWdBYitMYy9pbHFJQU83MVll?=
 =?utf-8?B?ZWRmNnEvOFg2QU9ZWEx4VXJQcUp6TmZJVyt1Vm5oOVNlYUVKVEQ0cFgwb1RI?=
 =?utf-8?B?QnMwYjZPYm9xa0JRa29lSklyRk5uRHJrc1k0WlVVUFZlcWZGQ2ZYbWNrdDRP?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c222dd-467c-4487-01f0-08db4a695725
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2023 17:27:29.6875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OdVEpeKEB+DWLRYwx21ZDvetr4xTRa6u46pumVZYBAsOkB39hKm9ngrgHjwi9kGHnMyTeuGMYDQu5o3lN0aPnr0QldJxOtc8dEZ2atK+S34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB6435
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 17:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102243

VGhpcyBmaXhlcyBhIGJ1bmNoIG9mIHRoZSBmb2xsb3dpbmcgZXJyb3JzOg0KRVJST1I6IGdlbnNp
by0yLjYuNC1yMCBkb19wYWNrYWdlX3FhOiBRQSBJc3N1ZTogbm9uIC1zdGF0aWNkZXYgcGFja2Fn
ZSBjb250YWlucyBzdGF0aWMgLmEgbGlicmFyeTogZ2Vuc2lvIHBhdGggJy91c3IvbGliZXhlYy9n
ZW5zaW8vMi42LjQvbGliZ2Vuc2lvX3h4eC5hJw0KDQpTaWduZWQtb2ZmLWJ5OiBQZXRyIEdvdHRo
YXJkIDxwZXRyLmdvdHRoYXJkQGFkdmFudGVjaC5jej4NCi0tLQ0KIG1ldGEtb2UvcmVjaXBlcy1j
b25uZWN0aXZpdHkvZ2Vuc2lvL2dlbnNpb18yLjYuNC5iYiB8IDIgKysNCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2dlbnNpby9nZW5zaW9fMi42LjQuYmIgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2dlbnNpby9nZW5zaW9fMi42LjQuYmINCmluZGV4IGM2MWFkYjFkZmQuLjU4MjFjMmMxZGYg
MTAwNjQ0DQotLS0gYS9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2dlbnNpby9nZW5zaW9f
Mi42LjQuYmINCisrKyBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvZ2Vuc2lvL2dlbnNp
b18yLjYuNC5iYg0KQEAgLTIyLDMgKzIyLDUgQEAgUEFDS0FHRUNPTkZJR1tzd2lnXSA9ICItLXdp
dGgtc3dpZywtLXdpdGhvdXQtc3dpZywgc3dpZyINCiBFWFRSQV9PRUNPTkYgPSAiLS13aXRob3V0
LXB5dGhvbiINCiANCiBSREVQRU5EUzoke1BOfSArPSAiYmFzaCINCisNCitGSUxFUzoke1BOfS1z
dGF0aWNkZXYgKz0gIiR7bGliZXhlY2Rpcn0vZ2Vuc2lvLyR7UFZ9L2xpYmdlbnNpb18qLmEiDQot
LSANCjIuMzQuMQ0KDQo=

