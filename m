Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6013107BCD6
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 18:19:10 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22628.1773425938076563670
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 11:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=ZD0xBwCh;
 spf=pass (domain: axis.com, ip: 52.101.70.41, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gY4iYnxwC+CZCqXGWv/28PrX8cgOmITjnLp2YB6KeUtAvTKatOZy+3CAdUPYzyp6TfcbJU+SdoZ1rDCmpIYcCT/aIM0+O1Zfz9MrU88p3kpQCigg5kaZ07yPLqHai1ARH8uaiJEmjGQBKfPOPg5pX52wv5xN0dphSNddhH1Ty4Kx8vanWLJJZKlJVBJQ7o8HwJeDrCFhj4OK0GzfK56+dGrLslN6LlhaYxUBLqvZSwYOL0PfJb+nTrz3LwxuGQM51idWj7NHNTRh4fOABhYnyoNO20mJZR5llxHmdcT04OdBKp+FAjHsaBPXwlT+cRA4iKY49XHK3DNeUA75PO5Nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9h0U9T66j8oxujKcu9uZfysy9oo3gZjt8StAQFqSrc=;
 b=dxeHl1ZqCHjCGKProp37MgQFuaKkKxK5Zj9kqVpPBpOcKKUoFRNFbB34lWYxcP8QQyFTfPrn2DS3a5XBsFtw6/ZvsQuPVWamrADJcMcngprq6hMvu9FnN9nS/5Kjnsz8RyVi+lfqOMwHbGu7qVlEbLByG2ncMUbsbnHtT6bEDcKfj6OcHg3gQw8dY+uXdwNOBeGznh5GUeXV3w9PcjapJVVcq3kllb6XAvPSVVTKQSbUNlrGIWljNF0nWXFAnygcq2AoyE2E8/N+LuBUOTF3OJqOzlD27hEh7vy6crmdhjiP3repLfccytpfzFXY+tuIpT31HxKMv8y0P8cU89dELw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9h0U9T66j8oxujKcu9uZfysy9oo3gZjt8StAQFqSrc=;
 b=ZD0xBwChTqHyfFdnc7e4a43JlLdY4FXZJYWTNw8ZvuGLUOIviR4jOkcxN0h0JyDWMo0Ly10i/68E4ygAG7AJBg2sLsWkwkD1afYTMgCkbP/5oEeXUpIajkiMBMjA5jKJbhsUI1hcjMk3BnyT1FzWqisAgMMBixJc8LZV4PuWzCE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB7029.eurprd02.prod.outlook.com (2603:10a6:20b:2ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 18:18:54 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 18:18:54 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>,
	"skandigraun@gmail.com" <skandigraun@gmail.com>
CC: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] cxx: Add cxx recipe
Thread-Topic: [oe] [meta-oe][PATCH] cxx: Add cxx recipe
Thread-Index: AQHcsJSgyCyA/nMWaEKu8+N1ca0yu7WoAvkAgAAhJgCABKUN4A==
Date: Fri, 13 Mar 2026 18:18:54 +0000
Message-ID: 
 <DB5PR02MB1021349A303B20831AB1F09E7EF45A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260310134815.374345-1-Deepesh.Varatharajan@windriver.com>
 <1f68cd24-b5ab-406a-b245-1c0d9b592367@gmail.com>
 <CADySD0HYvcqYqhkHcXtLo-6A+HUaqo_L4S129Qu-AjPbVeB+Xw@mail.gmail.com>
In-Reply-To: 
 <CADySD0HYvcqYqhkHcXtLo-6A+HUaqo_L4S129Qu-AjPbVeB+Xw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB7029:EE_
x-ms-office365-filtering-correlation-id: 48af0bd7-2101-4b0c-1b35-08de812cfc1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: 
 CO6FMsuN/Fj/uNuG3NI4UE3q9KFb4U8vF+xvqcM6GEJFE0eP3hxWCIyW6OCCuNbc4pF4ZzCY3Aoe+Xw5DDl2bm5i3j+trjNOdMqCoEIL5+tn8Crv/nPP4GTkrM2sn3XZiCC/O+zZ829Zk/A989iTDZaTFGnhpE58q9998lxdBwFkfQqRvgnGVDKdkYB6+TLQh4cuypB8FsQa+7PbSavPGBb+h/EYsjsm+0aeORXC/1kuAvNebIgrhQyzIAyxhm/08ryVOwMO8lsGB3kXdqxEZi5GajDv8GB924OdtARegb6zH0JDhhZycNXhj7HNoGlYkFt2RD4blcodxBApdenOetwAJLy5o/iGSxfI8NP12iUIpsWKEodct6UIqPkGdMt1kLCzWVDJceOxh67Dh0MVrn3kuZRUPnbv/GRaJkzQj1w6R/zgupK7eREjXBQSVoNMnzeKGOb6kORGvYy2xuFuHY735Ol7gSgEy1s7ieKOsj3AdUnTPZKoQIGzvymkQCIZLXJCeFcNiy2MRckrcy29iyiDb/wMrfmImcCm0IY0cThmTwDWnI5Qc46NXS914ylhUdWRynncAqcPCRuCSmJjcnAURRPd7bI0CHpkn8rvC8qt2iMcqiyRjc2nUUb0AZq4MkUeuUibU1UPyMr78qDX3kSd6n4zGfimQN7kroSn7hpiugzy/kEhZdm0ay3wTsf9q3EnyIPcm4LG3r+30hMzfW0owRoj1JZPegYSM2BAjEVFfpnG1VZS7QcM66nY3B+l
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aEFhMTMzM1Zrc2RWZWlzalJXWWtFc29icTMzcXkyZTZYeVNkOVVRcEpjekZv?=
 =?utf-8?B?eERaUVdGQUI5NUJaWkM4UHExcmJ2cWozb0tVcFY5M1U5TU9PaExycFpnVE9w?=
 =?utf-8?B?QVI3TTQ4K3RNc2QzSFBYRUJ5MGQ0Tlo1cEhuKzRONmtteDhiemlHYzZiUHFP?=
 =?utf-8?B?NmsxS1JFa3lUcGh3c2xxUE1Sb09LejZ0T1JidVlpMW5adjZFeTdISHJRMEhY?=
 =?utf-8?B?cFEvWUo3Y1FxZnpTdjhWcG50czVKWWdxVHlGckt2Y0xSSzZLR2ZqOWcyRTJv?=
 =?utf-8?B?L1ZtZkJNcGdkVDNJSklON05VZ2tnZ2l2QzlGL01aOVZ1UUlrbVdBZ3gzTVBU?=
 =?utf-8?B?bjUzM0VUQkpaVEk4MU9pT1ZwTVM5SjU3azIrZnMybjAzTUNwVzllUUl4M1Z1?=
 =?utf-8?B?bWFBbUhibmFWOFpBOXRaUFJjbkw4S3AyR1F3S0xSb29sa1BCRUhXWkx2QjEy?=
 =?utf-8?B?emcvTUxUUXlsQ241SVdEMHVOM1ZlQmhMRlNuRUMxQlU5S0wrenpJRG9xWFVN?=
 =?utf-8?B?TUZFMEpSNUtXd3M1ZzV4MDF5MENaeW8wdmRKc2hIaWFmU3AwdE5qT21MS3F5?=
 =?utf-8?B?MnZ4MGJkcEMrWmdCTUlRclQzVEdqdHd2OVphbGJqTW1sekZmSUhpUkRUdHVM?=
 =?utf-8?B?bHQ5WGlmUVhmK2NKeGZyRFdZcGJ4VjN0YzIxTGJLTGVUYmU0bFlWby9wYXlK?=
 =?utf-8?B?ckVlOXNwVm1VNFliM0J4L0RzV3g1bUEzQ1A1RVdndFdyZzloclFSTWlySitE?=
 =?utf-8?B?YnhSUURFVVRSTmZuOGxWbXRqbFhwaEwzZFdiay9WU2Y2RWR1cVpLMUZEWVV2?=
 =?utf-8?B?cGNEaFA3K05UZVcrNDFURy85Y1NBMElKR3hMRG0xU044YVQxZk4xZEJrL1BQ?=
 =?utf-8?B?VGNPQ1UvK1pldEtHdTBoQ3l1MThCL0ZQY0xkVThTdFNzYTU2QVFSRTI2M2d3?=
 =?utf-8?B?NGY0cGxjVnpmWlBvMFlNWnJBT0ZndXFaQ0tCdVNqc1ByS0dXQ0p1L2VhZThK?=
 =?utf-8?B?aXhybmJFMHFtK21mRTM1eWNsb2hVZTRaYWx1REZBVmo5UUc1SmdqNGpha1dB?=
 =?utf-8?B?aGxoR1VKZXpHRzFzZFJHZmxiZEpsU1NjOU9od1h3cTVjZUo1NWpEZEcwK3c2?=
 =?utf-8?B?RzMxcHd5ZUN2OVEwSElQMmFEUUJBaFI1SzV1c0syYmFQNnJDRHNKaWxhRFhP?=
 =?utf-8?B?MFBEUytYQjdPT1M4SDZERWJFM1RaSGhuQWx5aHoxT3A2ZDNXRmREd0MyZ0Fa?=
 =?utf-8?B?NldwODB3YXZucmUzNWlzbHpYek90NmQvS1dselJXcm42bUx0V2xXVmNXclIw?=
 =?utf-8?B?OU1oTkhvSHdmK0NwVnhwSnQ5QkZBUXZoQWVSVnBsUzN4Q1NoRTJsa2NDQnJl?=
 =?utf-8?B?WjdmRWtqRzJKcmVMMGw0Z0V3T2Q2Y0c4bVNDTzQ3WVZDaDRETG5UdFlKL3Fj?=
 =?utf-8?B?NS9uMENzRDBJdFltTk5BMzlnT01EVStVQ1Q0SFpkWW1saFo5ZWRETHcvc2s3?=
 =?utf-8?B?VUFibG9HQkF3YXpqaGswd3pYSTVYOVhQdm50WXhEb0JvNk45eFdMWjlFV1Y3?=
 =?utf-8?B?NFVUazB6dVpVSUNaVU9ZSWZzdUpXWWhTaWNHMXkyRTZVcEJOQTl0WVo3cVRa?=
 =?utf-8?B?cEFNQ1MzTWRRdlpGRGV6L1NXTWFyUkZTM3praVJhbU16eHB6c1V2bExscXNU?=
 =?utf-8?B?YVR3Q3NySkdBTFdNRm4wNzNvNmdLUVhmNklFZnBrS29HcmxYSWlCcWNMeHRT?=
 =?utf-8?B?cnZwbWRTdDR4Y2RHd09oY21qN05tSENtT0ZrS3FNUCtXS0xZank3aWU5d3hF?=
 =?utf-8?B?NnFMZGNVTFZSTDFxelpxZFBWSTdKYThwVGF4a2VHL1hkVGpOcjEzbXBTb1lW?=
 =?utf-8?B?aGM3bzJzZU9MQlVzRnlJbnZEeDNFUjY2NjFMd0NKWXYyVTFQWk1TWW42YTdZ?=
 =?utf-8?B?WXBSNEdkNWRoYUlFbVk2TGNpMDVFckR2bmtBYkF6OEkzVXA2ZXJMTjFtZUdL?=
 =?utf-8?B?YWZzWVFaNGI3QSsrcHUzTXZ0c3Q5Wi81QVZiU3pkZEhxMzdmQTJuVnNZakJs?=
 =?utf-8?B?MktDM3NNdWtEbUE3SFdXcE9aUlE4dzJmTXhxbVdNbmMwd1NzSSt3VmlsK1hF?=
 =?utf-8?B?dFdpN0x1T0NuTUVKTlZaU3VBdUlKaW5KaHE1NkhqbnB0QzJYYjFXcFFsaW83?=
 =?utf-8?B?MnZscmRBK21yem1GNHgwdDRZK0w3dXdSTk5HMUtSeXRyZWY1NUFxUHF0YUlN?=
 =?utf-8?Q?6dfVnoBEuzq37uhnqb//0cOQ+mRUSJ8qjBktRCQz7Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48af0bd7-2101-4b0c-1b35-08de812cfc1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 18:18:54.1336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bnjnWRTWN9nlAcvnoN8dXgSFzYOElw6Qkr8IowiLEeLpNw64HrrmfvYgMpM3Qw2X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 18:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125192

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBBbmt1ciBUeWFnaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTZW50OiBkZW4gMTAgbWFycyAyMDI2IDIwOjE4DQo+IFRvOiBza2FuZGlncmF1bkBn
bWFpbC5jb20NCj4gQ2M6IGRlZXBlc2gudmFyYXRoYXJhamFuQHdpbmRyaXZlci5jb207IG9wZW5l
bWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbb2Vd
IFttZXRhLW9lXVtQQVRDSF0gY3h4OiBBZGQgY3h4IHJlY2lwZQ0KPiANCj4gT24gV2VkLCBNYXIg
MTEsIDIwMjYgYXQgNjoxOeKAr0FNIEd5b3JneSBTYXJ2YXJpIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxza2FuZGlncmF1bj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+ID4NCj4gPiBPbiAzLzEwLzI2IDE0OjQ4LCBWYXJhdGhhcmFqYW4sIERlZXBlc2ggdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gPiBGcm9tOiBEZWVwZXNoIFZhcmF0
aGFyYWphbiA8RGVlcGVzaC5WYXJhdGhhcmFqYW5Ad2luZHJpdmVyLmNvbT4NCj4gPiA+DQo+ID4g
PiBBZGQgYSByZWNpcGUgZm9yIHRoZSBjeHggY3JhdGUsIHdoaWNoIHByb3ZpZGVzIGEgc2FmZSBh
bmQgZWZmaWNpZW50DQo+ID4gPiBicmlkZ2UgZm9yIGludGVyb3BlcmFiaWxpdHkgYmV0d2VlbiBS
dXN0IGFuZCBDKysgY29kZS4gSXQgYWxsb3dzDQo+ID4gPiBkZWZpbmluZyB0aGUgRkZJIGJvdW5k
YXJ5IGluIGEgc2hhcmVkIFJ1c3QgbW9kdWxlIGFuZCBnZW5lcmF0ZXMNCj4gPiA+IGNvbXBhdGli
bGUgYmluZGluZ3MgZm9yIGJvdGggbGFuZ3VhZ2VzIGR1cmluZyB0aGUgYnVpbGQgcHJvY2Vzcy4N
Cj4gPiA+DQo+ID4gPiBUaGUgY3JhdGUgaXMgaW1wbGVtZW50ZWQgaW4gUnVzdCBhbmQgc3VwcG9y
dHMgemVyby1vdmVyaGVhZCBGRkkgd2l0aA0KPiA+ID4gY29tbW9uIFJ1c3QgYW5kIEMrKyBzdGFu
ZGFyZCBsaWJyYXJ5IHR5cGVzLg0KPiA+ID4NCj4gPiA+IE1vcmUgaW5mb3JtYXRpb246IGh0dHBz
Oi8vY3JhdGVzLmlvL2NyYXRlcy9jeHgNCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEZWVw
ZXNoIFZhcmF0aGFyYWphbiA8RGVlcGVzaC5WYXJhdGhhcmFqYW5Ad2luZHJpdmVyLmNvbT4NCj4g
PiA+IC0tLQ0KPiA+ID4gIG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jeHgvY3h4LWNyYXRlcy5p
bmMgfCAxMzAgKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ICBtZXRhLW9lL3JlY2lwZXMtZGV2
dG9vbHMvY3h4L2N4eF8xLjAuMTk0LmJiIHwgIDM0ICsrKysrDQo+ID4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxNjQgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9l
L3JlY2lwZXMtZGV2dG9vbHMvY3h4L2N4eC1jcmF0ZXMuaW5jDQo+ID4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9jeHgvY3h4XzEuMC4xOTQuYmINCj4gPiA+
DQo+ID4NCj4gPiBUaGlzIGlzIG1vc3RseSBqdXN0IGEgdGhvdWdodCwgSSBkb24ndCBpbnRlbmQg
dGhpcyBhcyBhIGJsb2NrZXIgb2YgdGhpcw0KPiA+IHBhdGNoLiBNYXliZSBhIGxvdWQgdGhvdWdo
dCwgb3IgYSBxdWljay1kaXNjdXNzaW9uIHN0YXJ0ZXI/DQo+ID4NCj4gPiBjeHggaXMgcHJldHR5
IGdlbmVyaWMgbmFtZSwgSSBmaW5kIGl0IGhhcmQgdG8gZ3Vlc3MgdGhhdCBpdCdzIGEgUnVzdA0K
PiA+IGxpYnJhcnkgZm9yIEZGSS4NCj4gPg0KPiA+IERlYmlhbiBwcmVmaXhlcyB0aGlzIChhbmQg
c2ltaWxhciBwYWNrYWdlcykgd2l0aCBsaWJydXN0IC0gdGhpcyBvbmUgaXMNCj4gPiBjYWxsZWQg
bGlicnVzdC1jeHguIEZlZG9yYSBjYWxscyBpdCBydXN0LWN4eC4gKFRob3VnaCBPcGVuU3VzZSBq
dXN0DQo+ID4gY2FsbHMgaXQgY3h4IC0gSSBndWVzcyB0aGVyZSBpcyBhY2NlcHRlZCBubyBzdGFu
ZGFyZCkNCj4gPiBXaGF0IGlmIHdlIHdvdWxkIGZvbGxvdyBEZWJpYW4gb3IgRmVkb3JhIG5hbWlu
ZyB3aXRoIHN1Y2ggUnVzdA0KPiA+IGxpYnJhcmllcywgc2ltaWxhciB0byB3aGF0IGlzIGRvbmUg
d2l0aCBtYW55IFB5dGhvbiBhbmQgUGVybCByZWNpcGVzPyBJDQo+ID4gaW1hZ2luZSB0aGF0IG92
ZXIgdGltZSB0aGVyZSB3aWxsIGJlIG1vcmUgc2ltaWxhciByZWNpcGVzLg0KPiA+DQo+IA0KPiBI
YWQgc2ltaWxhciB0aG91Z2h0cyB3aGVuIEkgcmVhZCB0aGUgcmVjaXBlIG5hbWUuDQo+IEFub3Ro
ZXIgaWRlYSBpcyB0byB1c2UgImN4eC1jcmF0ZXMiIG5hbWUgZm9yIGJvdGgsIGluYyBhbmQgYmIg
ZmlsZXMuDQoNCk5vLCB0aGF0IGlzIGEgYmFkIGlkZWEuIFRoZSAtY3JhdGVzLmluYyBmaWxlcyB0
aWUgaW50byB0aGUgc2ltaWxhciANCmZpbGVzIGZvciBHbywgaS5lLiwgLWdvLW1vZHMuaW5jIGFu
ZCAtbGljZW5zZXMuaW5jLiBBbmQgSSBleHBlY3QgdGhhdCANCmluIHRoZSBmdXR1cmUgdGhlcmUg
d2lsbCBhbHNvIGJlIC1saWNlbnNlcy5pbmMgZmlsZXMgZm9yIHRoZSBSdXN0IA0KcmVjaXBlcy4N
Cg0KLy9QZXRlcg0KDQo=

