Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4C9C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 17:05:58 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.54])
 by mx.groups.io with SMTP id smtpd.web10.78.1709744749376768601
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 09:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=HYfV7LUk;
 spf=pass (domain: axis.com, ip: 40.107.13.54, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5rFD3BFuXkq4OY9jWvpbdaCkaZw+mZYKKrRmIFT3elS1GWyW+FSIfvZfAAH2RHpSeWx9a+3KLMQNhhd7jq0NGNrzRKySbx85FImtFTdRFpiqriY6Nz7IoDvZlyC6avofqnl9CYLfg81QQXPSJkfQKZH+x3+Hwq0+J6egAla+McCsyX83O9La0r+7uYOLHysZ/I0nf/CkRpy7nD2Lj3sfitpwsyHr4jSrdE3CYf6P3HKd7wU7hlXqAOjQb6Zl97UeqsM1264rhzXf+Fcbpu5e7PJXziWsxR520LSXUqmzEu8tDz3+070Ot1aCPZmbic43W2CIzMNaIghC7sM2YjJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8q0aqVXl8c6a0wu5GTkmThp37511yOxdOOOmMIXGWg=;
 b=oCkR75CNLS10KWJS4/CqiglOk5V3G6YxSkjzGKkOmCG72+Ty8OOA/Aq3BPPGORiG7QgAukpAy7RIZUYxaSaZ+6EZ7EUuHLSNGdLvan01PhrU5QyoUAl36JzlS4x1GhsTS46sa+euwsAlumnIgCqt4HoZy3XhcZwrfcPkYJas1FICj5+HksVqFoAwqoBzBFVjUqLVdgbNj6nQNiQLc/m2Sx7MX2Zo9HLDDeZF1vTtthrlLxbX9WSL0NCcEquVDgiKZ/+wgg4FKhuUf9e+QdyBoA3+J4nbvGPkvMzv9TKIah5ICFWWyBDp52TA8jnCCiJouLXpFJp3R755zoPv10gvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8q0aqVXl8c6a0wu5GTkmThp37511yOxdOOOmMIXGWg=;
 b=HYfV7LUkRi0X/dpqruKkYataLb4KL/aInbxDmTLbmCQhOWYvresOHGsakp9vJdYfQW1gNGeP4SknZhL9IIWJNniCSxG5NkcmgsQwp1iGCXuCwwA16WxG2eV+e4PLhT1SRpq+YWARR8ToIYdY8+OCRiCkhP+w4QSY8YtbYPbZh4A=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB8329.eurprd02.prod.outlook.com (2603:10a6:150:54::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 17:05:43 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 17:05:43 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/2] abseil-cpp: A little clean-up
Thread-Topic: [oe] [meta-oe][PATCH 1/2] abseil-cpp: A little clean-up
Thread-Index: AQHab+ZHriv6BItYXUCOwQ3iXVbtS7Eq8T0g
Date: Wed, 6 Mar 2024 17:05:43 +0000
Message-ID: 
 <DB5PR02MB10213D1EB1AE82DB0D9332DC5EF212@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240306162737.1722284-1-pkj@axis.com>
 <CAMKF1sqZhEby8gOYZSukdMT4DoCGnNPsCAuCn2KqpVqTBqpnQw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqZhEby8gOYZSukdMT4DoCGnNPsCAuCn2KqpVqTBqpnQw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB8329:EE_
x-ms-office365-filtering-correlation-id: 8a4eae00-5891-4696-9643-08dc3dffa880
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3VVf2zAE/dy91sUY0NKedeKOx/3plgrh8p0y+bZx4K8JCvF4m7DZYJCMzX1BggC5yhzFTa/jIAOo5cqvpfSU4RQp7JsMhFixSBQC5I2WO0i4uq5YOCx8mrvVZnV5Cn609JDeystOXzrOJG4ip8m7phW9OsumWwe3GduSaF05ejbTufUGjwMsg/lTxGGahqAMnALlIrpnzPTwQ5U5Ty8s6KGn+S3UsbPLU7OPyUDZ7JDKgQe2FznDQXMf1MG0uRoGHTXyFS42fmcYO8/N6wK4y79AoF5Q9gT9IRR1By2AA1zj8nMYlV8VFHUr5yOavuhRSRGlyyJ/VLDWY+xJQy7icSJx0mLc4cjjVz8zMd6sFbwNodvRkmVYlWyhEq6NDdDGDlmPc/DowekmUgOurw5TCnE5OxbiRpfEAt8RHa3srUyZNSSqJp7yoNH7FqNmtlI6sqEPAacK1m46Ii2VUUjvHl7j4YP5C9J5zVAvYw+XvEPlUSFpScoYE7CiYWOc2kTg2TjHXNhMZfONptJwPMmMPXW6IL56+X1rvhno5a18wrz3pfpWVfGzr88CNvUyLZko/T0FAknWEgzyB9if2pAa/+2hyDQlGouWv+kgeEtg4RYTscbBx4EmVKhqTzm2AiE3vOTzNvqRUGeNy7GJ1MSiNA0Tq/3LUL+khRoeXFQjeGM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b1F5YzROS0QxWjVwTXNTb1JkV1phL3FCdkUwdnZaM3k3WXNSTFZ1S1A1ZWFM?=
 =?utf-8?B?YVVTamcyUDFVV0N5NHMxMmhQd3N0a0l3cGZCYlFDUVBQY1hNbGcrdkdMTlZa?=
 =?utf-8?B?YUNER3cxOGsrdnYzY3k5RTN5N09KYnlMM1kxeS9KTlZxR2FaV0JnbWdDM3Nx?=
 =?utf-8?B?Mk1FQ0Rxa0JsWUc2bnd3Yy8zSDkxOXJWTUdWZXBPeTVtQkZJNndqV1p6S0V4?=
 =?utf-8?B?RVhCTndPOVYybGxIL09pazVFM3lBWVM0b1plTnhYOXBVQW14VGFaditmUHBE?=
 =?utf-8?B?Zk0vUWZsa3BOaFRrWWhDMHBTd1N0bFVjK2FFRGhnMkN4T0hVZ1o5SWVJdGhC?=
 =?utf-8?B?SUtNbFQ5RHdCaFF2MVZuK0RsdzNMMHVDMHZhM1FOa1NPejFlQjFnYVlFUHBx?=
 =?utf-8?B?elRHWmFYNVhlUGhia0w4MGxIK3dBZUVYakNsSklaaEl6VjQ3ZXlpNjJwRW1U?=
 =?utf-8?B?UTY2THp2S0IzbUZrMFdMRDRyREhIQlpDdStuMXM5OFcwK3pmMUZrNm0vN0Zm?=
 =?utf-8?B?M0lnOWEvQzQrRU1aQ01PVjROM0VCSTZLUmVDRHlqdlZyM2p0cDBVZnhSY0dj?=
 =?utf-8?B?Myt3aVQxTkV4NHNybW05VW1Ga0tMMjdYajEzL09xMVV0T1hENkZhYVg4WnhF?=
 =?utf-8?B?c0ZVaUpMV1Bhdm1LR2dGOVQrOElFQitMZlZpZVR4emg0Wk1vd3lWVkhxMEY1?=
 =?utf-8?B?VjYySlU5MS9NOUZFVC9TelhIVWJ2VVJGZGd4N2ExQXNmMU5MbHNmYTVJbXdH?=
 =?utf-8?B?ZTUyeHB2amhRKzlVWFUzNzlCTmVLVTBtMVJzNFVOaUc2OStrQi9RUk9PcDNY?=
 =?utf-8?B?TWFDOWtWbWRERkxsZzB2eEtjbzkrRjRHY0gxU2Jmd2tlY2JhZW5ISW9RNk5J?=
 =?utf-8?B?VFc3dDNDQ2EzTVc4aUdqU3c1UTQ4aTZPcHZWdDFoUmZIYmxiNUh0SDdYWjBy?=
 =?utf-8?B?N1dwbGdxRGpQSmI4RmtEWENmREpFbXBESXhlNnFGVTFOanV0SHFPUG5pQi8v?=
 =?utf-8?B?MmswcUFTM3BrMUQvR0pSV1JOOHJBaDFlMVJleHptalFqVmUyM25zZGtlWVF6?=
 =?utf-8?B?ZTJJVzRaMGN1WXR2eSs3QlpzTHhoWmZzU1Nwa1JJa2p6VGtPN2JlYndoUmJw?=
 =?utf-8?B?VzkrN3RRL2tQQWRSczhuMm9jNHNmeE05cnBOZitid00yRlI1QURxR3BRdmNj?=
 =?utf-8?B?UTdDeU93bFF2bjA1b1JIWi85cktaZlR0ZDUyaEI0ZXlaUEhJcXJyS3VDK2RD?=
 =?utf-8?B?VFEyYUpGOWFLS1IrZXNpYU9WaTNwZ2RIdTZNZXJ0MzJ5UWtjMHkxOGRrWWp4?=
 =?utf-8?B?aHFwQitFZmwybEE4Yzg4TTJDcUlCcWd3U29Lek1WQkIwSGFxWWs3L3dhWHBE?=
 =?utf-8?B?WVJ1K3Z1K1drd1UvaEZ0VkRKQkc3empHU05YbkxjRktHV1BqWXVDZm1jMENO?=
 =?utf-8?B?QUo2QVFsVmVaeHJWSzNkMUx3VndYb2hzU29RNTZWcFN0dEFSYUdFMGxXWFpD?=
 =?utf-8?B?Z1AxN2phaFBORmx2d0ZnZVhhaHNNaXRNQlZOV211eU5rWFNRTlBPUjBIWmJx?=
 =?utf-8?B?cWl1dytTZlM0Zjc0TVhvY3FRbnY1L1Zhd1FwRVk3aWRRQkgvaS8zWVIyb29i?=
 =?utf-8?B?Y2R2VGIrTnQyZjZUenQxdW9lLzU3UmNXV2lTNWgvbThYb3RTbjRpTVo5Vlk1?=
 =?utf-8?B?ZmZpdk1IbDVaS2x1S0hRMVpYbTBlb0VQWXh4ak1qMWpYUEVrYlcrRG5WVGEz?=
 =?utf-8?B?MldyYUVXUGxPNFBqemdodTVUUk1IT2l4MHVyS1AwcUZxVjh6ZndOTEdPUE42?=
 =?utf-8?B?WHRCUU9IdlhnNUJCT3NpRzR5QXA2ekFnWUxJdHlaRW1xd3EwMDc2aGFzWlFm?=
 =?utf-8?B?RXU3TlhyQ1lLaitpUUFlNi9QZzNWaUEzNUdGQ09qRnlYek1VbGU0d3NpMm5r?=
 =?utf-8?B?c1FRa2piSVlFT0ZaK3NyUWRHaStQQUNxSmx1eGRiSHBTU1Z3QVlPUldaQlBa?=
 =?utf-8?B?d2c2dGdwZXVlcGo4L0NoMEVvTHQ4Wk1vSVZCVXJ0bnhEUzZRUXJ5S1hWd05n?=
 =?utf-8?B?dEdEalNYWWJvNzh0NkFCODU1R0ZGdWFid2JveG95QjlHZjRGbnZCRlFDRlBk?=
 =?utf-8?Q?+7yE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4eae00-5891-4696-9643-08dc3dffa880
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 17:05:43.2592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zgHNZc6hamk3GGe56zhDn5XFWXC4r9iElXxPYoCga195RaBUEpAeEfynNzDIR9X2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8329
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 17:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109173

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgS2hlbSBSYWoNCj4gU2VudDogZGVuIDYgbWFycyAy
MDI0IDE3OjQ5DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBh
eGlzLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRDSCAxLzJdIGFic2VpbC1jcHA6IEEg
bGl0dGxlIGNsZWFuLXVwDQo+IA0KPiBXaGljaCBicmFuY2ggaXMgaXQgaW50ZW5kZWQgZm9yPywg
aWYgaXQgaXMgbWFzdGVyIHRoZW4gYWx3YXlzIHJlYmFzZQ0KPiBhbmQgdGVzdCBwYXRjaGVzIG9u
IGxhdGVzdCBtYXN0ZXIgb3IgbWFzdGVyLW5leHQsIG90aGVyd2lzZSBhZGQgdGhlDQo+IG5hbWUg
b2YgYnJhbmNoIGluIHN1YmplY3QgcHJlZml4DQo+IG1ha2VzIGl0IGVhc3kgZm9yIG1haW50YWlu
ZXJzIHRvIHJvdXRlIHRoZSBwYXRjaC4NCg0KSXQgX2lzXyBiYXNlZCBvbiBjdXJyZW50IG1hc3Rl
ci4gSSBkbyBub3QgdXNlIG1hc3Rlci1uZXh0IGFzIEkgYXNzdW1lIA0KaXQgdG8gYmUgYSB3b3Jr
IGluIHByb2dyZXNzIHVudGlsIGl0IGlzIG1lcmdlZCB0byBtYXN0ZXIuDQoNCi8vUGV0ZXINCg0K
PiANCj4gT24gV2VkLCBNYXIgNiwgMjAyNCBhdCA4OjI34oCvQU0gUGV0ZXIgS2plbGxlcnN0ZWR0
IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gKiBSZW1vdmUg
QVNORUVERUQ6Y2xhc3MtbmF0aXZlIGFuZCBBU05FRURFRDpjbGFzcy1uYXRpdmVzZGsgYXMgdGhl
eSBtYWtlDQo+ID4gICBubyBkaWZmZXJlbmNlIHNpbmNlICR7QVNORUVERUR9IGlzIG9ubHkgYWRk
ZWQgdG8gVEFSR0VUX0xERkxBR1MuDQo+ID4gKiBSZW1vdmUgYWRkaXRpb25zIHRvIEZJTEVTOiR7
UE59LWRldiBzaW5jZSB0aGUgYWRkZWQgcGF0aHMgYXJlIGFscmVhZHkNCj4gPiAgIGFkZGVkIGJ5
IGRlZmF1bHQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVsbGVyc3RlZHQgPHBl
dGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3JlY2lwZXMtZGV2
dG9vbHMvYWJzZWlsLWNwcC9hYnNlaWwtY3BwXzIwMjMwODAyLjEuYmIgfCA5ICsrLS0tLS0tLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNlaWwtY3BwL2Fi
c2VpbC1jcHBfMjAyMzA4MDIuMS5iYiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNlaWwt
Y3BwL2Fic2VpbC1jcHBfMjAyMzA4MDIuMS5iYg0KPiA+IGluZGV4IDFjZTZmZjNmYy4uNjY3Njkz
YTRjIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNlaWwtY3Bw
L2Fic2VpbC1jcHBfMjAyMzA4MDIuMS5iYg0KPiA+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0
b29scy9hYnNlaWwtY3BwL2Fic2VpbC1jcHBfMjAyMzA4MDIuMS5iYg0KPiA+IEBAIC0xLDcgKzEs
NyBAQA0KPiA+ICBTVU1NQVJZID0gIkFic2VpbCBpcyBhIGNwcCBsaWJyYXJ5IGxpa2UgU1RMIg0K
PiA+ICBERVNDUklQVElPTiA9ICJBYnNlaWwgcHJvdmlkZXMgcGllY2VzIG1pc3NpbmcgZnJvbSB0
aGUgQysrIHN0YW5kYXJkLiBDb250YWlucyBcDQo+ID4gIGFkZGl0aW9uYWwgdXNlZnVsIGxpYnJh
cmllcyBsaWtlIGFsZ29yaXRobSwgY29udGFpbmVyLCBkZWJ1Z2dpbmcsIGhhc2gsIG1lbW9yeSwg
XA0KPiA+IC1tZXRhLCBudW1lcmljLCBzdHJpbmdzLCBzeW5jaHJvbml6YXRpb24sIHRpbWUsIHR5
cGVzIGFuZCB1dGlsaXR5Ig0KPiA+ICttZXRhLCBudW1lcmljLCBzdHJpbmdzLCBzeW5jaHJvbml6
YXRpb24sIHRpbWUsIHR5cGVzIGFuZCB1dGlsaXR5LiINCj4gPiAgSE9NRVBBR0UgPSAiaHR0cHM6
Ly9hYnNlaWwuaW8vIg0KPiA+ICBTRUNUSU9OID0gImxpYnMiDQo+ID4gIExJQ0VOU0UgPSAiQXBh
Y2hlLTIuMCINCj4gPiBAQCAtMTksOSArMTksNiBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5j
b20vYWJzZWlsL2Fic2VpbC1jcHA7YnJhbmNoPSR7QlJBTkNIfTtwcm90b2NvbD1odHRwcyBcDQo+
ID4NCj4gPiAgUyA9ICIke1dPUktESVJ9L2dpdCINCj4gPg0KPiA+IC1BU05FRURFRDpjbGFzcy1u
YXRpdmUgPSAiIg0KPiA+IC1BU05FRURFRDpjbGFzcy1uYXRpdmVzZGsgPSAiIg0KPiA+IC0NCj4g
PiAgaW5oZXJpdCBjbWFrZQ0KPiA+DQo+ID4gIEVYVFJBX09FQ01BS0UgPSAiLURCVUlMRF9TSEFS
RURfTElCUz1PTiBcDQo+ID4gQEAgLTI5LDggKzI2LDYgQEAgRVhUUkFfT0VDTUFLRSA9ICItREJV
SUxEX1NIQVJFRF9MSUJTPU9OIFwNCj4gPiAgICAgICAgICAgICAgICAgICAtREFCU0xfRU5BQkxF
X0lOU1RBTEw9T04gXA0KPiA+ICAgICAgICAgICAgICAgICAgIg0KPiA+DQo+ID4gLUJCQ0xBU1NF
WFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayINCj4gPiAtDQo+ID4gIFNZU1JPT1RfRElSUzphcHBl
bmQ6Y2xhc3MtbmF0aXZlc2RrOm1pbmd3MzIgPSAiICR7YmluZGlyfSINCj4gPg0KPiA+IC1GSUxF
Uzoke1BOfS1kZXYgKz0gIiR7aW5jbHVkZWRpcn0gJHtsaWJkaXJ9L2NtYWtlICR7bGliZGlyfS9w
a2djb25maWciDQo+ID4gK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayINCj4gPg0K
PiA+DQo+ID4NCg==

