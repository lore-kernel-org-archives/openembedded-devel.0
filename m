Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.134])
 by mx.groups.io with SMTP id smtpd.web11.3733.1628658220677600357
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 22:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=SnsMmz6U;
 spf=pass (domain: skidata.com, ip: 40.107.21.134, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8sFOfp2wub+d7D3bWjTfuspuC42Gc0NAGonSVcttFnVV1qW3C2OfgYZuMtnhxPFSg04EIX2kgvQTWkKmATwcegkvarpHJFpnRagwkx1S68gMBIsLg8yETUO8NXrjnCEFSJwty60CSAj024NR4i+w2m0jGIhov2y5VOUS4hAYm8OPTiowfhIpOQH4Qtd0IQMws1XmszctmKK7jfMiBY8kBBGb9Ts9cnWYv8hmKA08KW3JfSbM8xyl5IfkW19PNbMkeng88FkQrBMdykXquEdy+9ssXVAKPRTHbYzJojycjQ3pKneBPCq45r6IcyVuWChrwoo9PMMv6H7x+LtO5iG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOcZHreO54P0HErRVHDKx+6aVgyTiU6SRHeC4pIyvPg=;
 b=S5mSxLQhxnoDzd9xC937nt+uAyNEeIqtJSqfLQsuaLooXGicz376wMpW7EANjaD82pf+1fL9TsXWye3Td7Lus93gXA6HycxoJj1U9peFVOuyjHs/IVBL/4+1SfVa3QDzCJgGfziD/UK8UtFQqvUgh0reZHoUFD4w71Vw/UgDk1wCGv72pZh3iCx+Ek1Gyi5YS9dUoDIwPZTbeWuwH4LKqpTVIdFl1CeC9iiMwLCRXpQR8cm5tkJCb9p8ofEM84yzVNThynEcUW3qi+ls0cUmSU6ZZ8Iz/0P5thTamNZiZ4MK2bs+l0z/5ugUXbAyXpYJbUDigdj6oIqPHu5asukQzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOcZHreO54P0HErRVHDKx+6aVgyTiU6SRHeC4pIyvPg=;
 b=SnsMmz6Um7fLMcWGMBzghTgMuwHUrrB6Re/mAnDJweRpea464kqi/Db4aulX4tNP3VSZV7PVSie0O75f0Sotl0hwVLiTvHLRIBkW1mfxXKwBTC+QrB1HNfRF4qA+myR0PNc2vfaelsDxfE8I456UNMcgws/V6cgJxAhv7n2ibi+9Y+r+SxdjaQxiKXC2qEtR2bf2mfdV8YOj6nujhaQuZu8nToc5z2nd11SPdmiZC6dgXLOP0V3kmwYsg6ysM5wuXNhJ1pZ4JvRvvWvyL8L+sHNku0yAg9YK1LsStE3riMOqKdgmRsMffhBRJS9tNf22zOrBjHHZndYB5Uy+Hv4VAQ==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by VI1PR0501MB2461.eurprd05.prod.outlook.com (2603:10a6:800:6a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 05:03:37 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::ecf1:3be2:cf9a:a102]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::ecf1:3be2:cf9a:a102%7]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 05:03:36 +0000
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: "aj.bagwell@gmail.com" <aj.bagwell@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, AJ Bagwell
	<anthony.bagwell@hivehome.com>
Subject: Re: [oe] [meta-java][PATCH 0/2] Update to new override syntax
Thread-Topic: [oe] [meta-java][PATCH 0/2] Update to new override syntax
Thread-Index: AQHXjSDCvLffAptijEybilpTbAgODKtrL6EAgAADWgCAAo8+AA==
Date: Wed, 11 Aug 2021 05:03:36 +0000
Message-ID: <YRNaKOJwLS7Jn82h@ltleri2>
References: <20210809130938.12027-1-anthony.bagwell@hivehome.com>
 <YRExsJjpV70+43Ez@ltleri2> <e45796b1-f0dd-d1bf-54da-8e886810710f@bootlin.com>
In-Reply-To: <e45796b1-f0dd-d1bf-54da-8e886810710f@bootlin.com>
Accept-Language: en-AT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1480e493-592d-47e1-a641-08d95c85607c
x-ms-traffictypediagnostic: VI1PR0501MB2461:
x-microsoft-antispam-prvs: 
 <VI1PR0501MB246168CF84171D545847AF9BF0F89@VI1PR0501MB2461.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5OnkG28UA1Mrnmfb70i+sdLaYBhaB4XfJeyEYJgp9SMVS1Bm0BaTY2VuN+O/eUY/groyfAHlQC8mAApLCezvfasUCfzWR8JG8K8B7QgOLq01DpSgWpQOgcXbnWRSl3lbQnNH4hyL0tYUZZuJ06gG6J5IL4IWSz+4UU02hgC+g880aDguTXy8kkdWjP5nwPKuo95OSHUtUNnzHpHdp6GIrnbxlOBzWfW8UuAFvv1yGnSrWV54ixutvMyFAtDF15oweMiGHh2OX4iX+TpYIzdt5YLvtFMZEVuilf+rn8dKn9Ku5TO7Kcr/gXgKuwc+7FS0FQFapRInHFAQwEwa9cx/WVkrP8stOWIEHgIVfo6gVOPe08MspOXc4RcZqVGX2QMntrjayOx2Ok7pE8Jdt9PEEbZm6fBzAfvK9yDnQ15/Juk/XzvpSdCoDlUToBjgdk3C8HgAeM/XT3I/PtsUafmpKeagK3CzHEPJnygpamUJYq+7jOxcUOhl5tMJConKFvRd4z71WTPLEfTPrGdrTo1NWG7xvVNxPIUUSVM6wt3ycdGfz1D/A8/asfZ+eY/KU319kFhxbDiPPRXfFxW/1qPfPvNq1S3lNjkynS5968kFXErAPA9hnLvl2Vumw2p0Bw5gYQXdKOmYRRd6IwHKSMktlGXejGzq2tSmfKvAKMmBNuBeOUVAJ2jEgAne7hB0oREZ5yZpz+MLGgRvqngf1quOcg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(6916009)(26005)(33716001)(66446008)(8676002)(6506007)(53546011)(2906002)(66946007)(64756008)(66476007)(66556008)(91956017)(8936002)(478600001)(76116006)(71200400001)(4326008)(54906003)(6512007)(4744005)(83380400001)(86362001)(5660300002)(9686003)(186003)(6486002)(38070700005)(316002)(15650500001)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OEJ2ZFZ0QzMyeTNiTnpEWE8rZkk4NDZ4Vmp2RUFRNHZxeG01a2tUMHREc1Yv?=
 =?utf-8?B?TUxzQmRkUktnTTdqdzlYUkx3NmNlREN2QVNNaXZqSEQwaTVQdEZNU096TmVG?=
 =?utf-8?B?ZUZjSkYzLy9QUXdLWUlzeitmU21lc0FQeUwrbHAwMVltV3pKNGZxZ2xkWE4w?=
 =?utf-8?B?VzNnT1YvZUk0blRHK3hFNTJTMXFHOVhoV3U0S1JUR0VONXdQS2VnenNkZWx6?=
 =?utf-8?B?c0dKRmNvUlFQTGNicTkzWkJPaEIvSUhOUjlaREJzd01SZlpuSGFBczNvSXJI?=
 =?utf-8?B?bERLR1ZpVDc2Ymk2U1ZrNEttVkdwQ0hoYmVjRTByS1RzS0wzdkwvK2tqZG9D?=
 =?utf-8?B?cGhBM0taZUZ3WEprUnpuZ1JEQzd1Z1AxaWRha1VJTE90NWRUUG1xWHAyOHFF?=
 =?utf-8?B?MVhvUnhGL2lMaXVWWmhzUmszc1laNUZtNnNGLzZwY1JEd3hZNlZJaGtwUkIw?=
 =?utf-8?B?RDE0emFGZVhCb3p3T0lmRVNrYnl0N2U0MUZUbnoySDVwWXovdm9NT2hpRG1Q?=
 =?utf-8?B?cXE1K0RIU09KYnZ4UTB5MWk5MGZXL3l6QUU5QkgvOEhPdm1FaDJOUDNJelFx?=
 =?utf-8?B?MGtoK3EyZmdsWHA5VDU2cVhtdVhINVp3T3ovQ25SOWpUbXdVcUxqZkxtOXd1?=
 =?utf-8?B?Nld5QnpYWEpBLytDSU1iWkRkVGdyek1FRjdZQ0RwUUdnVGdwVHZnUHdpOXA4?=
 =?utf-8?B?dzdFZUg3MFJubWF6OEZodzJsREREUlZXVXVWUDd1dTVNVjNkcHBXTjkwK1p4?=
 =?utf-8?B?Mm12Qm5oRXlwSENXcWxHOUErUnN1WVVwL1BrMzJUZ0pOencyeTBWQkhpWVJW?=
 =?utf-8?B?OW11blRUSjJoWU0wRTkyZzE1ZWxPcmUwMkxFZEFZV1FDczF1SUVTMzV4djEz?=
 =?utf-8?B?dXU3RThubGVOZUdhMDVjbEdWZmtuR09zVkIyTHdyU1dMVnBkRE9QMHB5d2pC?=
 =?utf-8?B?aHFtV2ZsTEZpK0dId3VleGpBdHNUbFJoanY0Y0UvS3VQTHRYZ3dZN285MllT?=
 =?utf-8?B?dWpKYVR6QUtmR0JjMmp0cmVabVZVVzlPSkNkTmtIbEhaUjFEWWs0aE5JbG5V?=
 =?utf-8?B?bWY3UklEWnhhcFpWdVVONUlyaWc2ZEdCVXpiVFYxWEFhaVk0MEpCOUtrV1pD?=
 =?utf-8?B?Zk1MdzRQcmhVcnFoaUJQUThiam5qN1dXN1pnVlliQzVYLzFSVG5QNVZRY2pw?=
 =?utf-8?B?TmpEM2ttVDhSUVcwUi94TnllV2lDRlJtUTQwL0pRYTFoTlpMUWlhU0JXU0N3?=
 =?utf-8?B?VW5sZlRBT29oYzlUcE9wejNVcWJQNlp2TlVmbkFTc3J0TVFjWjRNY1ZkTVdY?=
 =?utf-8?B?TlhMUVZ3YUh2YjhpUWpiNlAwQzhzK0thQld5RVhYUjJPZmRGNjBJRWozNzJH?=
 =?utf-8?B?WFlxTFVSS1M2ZElqUUJUSGdzWXpWalJiT2ZzZkVEakZTMVBCc251OG5OcFZB?=
 =?utf-8?B?Nkw0ODhiWDA2b1VLNFlhcFdSYVV2OTUzK3VGL3d6dzhQMUlWKzhTYUdoSXdK?=
 =?utf-8?B?SW40bDYxNmFsT0ZkWGZrSGszY3Z6T0FicU1VMmNvZzhkUmxpM1FlWG11dnVt?=
 =?utf-8?B?RU9rUFNtMFo4Y2Zyd0wwSTBjckdTOXBKcVJlb1YxcFMwdnYvVm9FYm5Jby9h?=
 =?utf-8?B?MEJJQW5MWThGanZodHNoTi9GUjMvSmQwZi9USUlxdzFwaURXUWFhQXBNRjhP?=
 =?utf-8?B?ay9TZ1VYOVZxRzRmckM3UklHb1hta3Y4K25xeHdYVUYra0FSbmE0NHlZdzRo?=
 =?utf-8?Q?aJCYrFaFr0w2yfX5ZhZPwvUmEnGdn7tllTLF66e?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1480e493-592d-47e1-a641-08d95c85607c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 05:03:36.6702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ItgBpNQgjKRIjbXfo85z1fqCz1ijYTqwxYKeiLwy+WZcWW/G9qZItKinx1B0sKLuP2MBDxGigp/9mPVi6x/cVgWcHOdeLkIFGUm4sTwF7+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0501MB2461
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7EF0B67D9464043ABE78F15CF4AD587@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgTWljaGFlbCwNCg0KT24gTW9uLCBBdWcgMDksIDIwMjEgYXQgMDM6NTg6MjRQTSArMDIwMCwg
TWljaGFlbCBPcGRlbmFja2VyIHdyb3RlOg0KPiBIaSBSaWNoYXJkIChsb25nIHRpbWUgbm8gc2Vl
ISkNCg0KVGhhdCdzIHRydWUuLi4gTG9va2luZyBmb3J3YXJkIHRvIHRoZSBuZXh0IEVMQyBzb21l
d2hlcmUgaW4gRXVyb3BlIHRvDQptZWV0IGFnYWluIPCfmIkNCg0KPiBPbiA4LzkvMjEgMzo0NiBQ
TSwgUmljaGFyZCBMZWl0bmVyIHdyb3RlOg0KPiA+IE9uIE1vbiwgQXVnIDA5LCAyMDIxIGF0IDAy
OjA5OjM2UE0gKzAxMDAsIEFudGhvbnkgQmFnd2VsbCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyB3cm90ZToNCj4gPj4gVGhpcyBjb25zaXN0cyBvZiB0d28gY29tbWl0cywgdGhlIGZpcnN0IGlz
IHRoZSByZXN1bHQgb2YgcnVubmluZyB0aGUNCj4gPj4gYXV0b21hdGljIG1pZ3JhdGlvbiBzY3Jp
cHQsIHRoZSBzZWNvbmQgaXMgY2xlYW5pbmcgdXAgc29tZSBwbGFjZXMNCj4gPj4gd2hlcmUgaXQg
d2FzIG92ZXIgemVhbG91cy4NCj4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4gPg0KPiA+IEZv
ciB3aGljaCByZWxlYXNlcyBkb2VzIHRoaXMgbmV3IG92ZXJyaWRlIHN5bnRheCB3b3JrPyBob25p
c3RlciBvbmx5Pw0KPiANCj4gTm8sIGl0IHdpbGwgYWxzbyBiZSBzdXBwb3J0ZWQgaW4gdGhlIHVw
Y29taW5nIEJpdEJha2UgdXBkYXRlcyB0bw0KPiBEdW5mZWxsLCBHYXRlc2dhcnRoIGFuZCBIYXJk
a25vdHQsIGlmIEkgdW5kZXJzdG9vZCBjb3JyZWN0bHkuIFRob3NlIHdpbGwNCj4gc3VwcG9ydCBi
b3RoIHN5bnRheGVzLCBzbyB0aGV5IGRvbid0IGJyZWFrIGV4aXN0aW5nIGxheWVycy4NCg0KR3Jl
YXQuIFRoYW5rcyBmb3IgdGhhdCBmZWVkYmFjay4NCg0KSSdsbCBhcHBseSB0aG9zZSBjb21taXRz
IHRvIG1hc3Rlci1uZXh0IGFuZCBkbyBzb21lIHRlc3RzIPCfkY0NCg0KcmVnYXJkcztybA0KDQo+
IA0KPiBDaGVlcnMsDQo+IE1pY2hhZWwu
