Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17965C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 10:58:24 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8232.1783940302573855405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2026 03:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=R3BPq2lT;
 spf=pass (domain: est.tech, ip: 52.101.65.58, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5hpLIe8qBWfPa+9+iwnChYapsJCNmPPLTpHlBIJeX0HlSqWo+ovrhl7fiEkrL4ir1porv9c28ISBOYO0+ggcez7x5so8UCU1tTCkphuUo+Vp1RuJy7B9hak1nziTYgjwwZE0Il0pmOc38oPkbjpTgEbrqk/G/TRZ/6TUqWAZUBElhqS/N6nEiyLdbSJwJk/0GKT1wKQZ/YPOjpdBrFZj7lt+mLi2GxO4aRtS1PsS5760/rJfGHtnhCwcYrZf/cmKtKZbpETPc+fkTNrdAAFa52I3HbtqibUrKpDdlwwqtZuV6dlFCmQCvp+RQsQl1ImEbQ26ODii81Bv2X17oGQ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKemeKdH0+42mH36Rf52XPZvUEs0A8yO+AA2V19Y+Bw=;
 b=TJwq5dc2n2UafQRrC4NM/NS9jJUNsUO2T7GKgT7sNUrdKHA+AJKqv7p4tQ4xLmBKeRblkEs5XsELmjhZ5Z+2lyPaqD5A+IEMj7DZwy+fg4QidppsloNIK7WGicV0OvaS+rj3uc1TlzSSb70qmoJTfS4z3H1LjBCoFGL9tNuc4GvKNwb7XSYDZGmzVZzEJCrV2/CFwJLEsdoiFA+yFnl/KccmznyWfIa3LhGpsrjpo00n+WaZmr1P+enAYJ5mguCRE7smNs3iEcySSJQEMLHW7SGzuUPXXe9e5KYdus4Tqny1aO9gfGYf2UZtGCV4JV9UIRM95SyAQaSzdJ1tG5mIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKemeKdH0+42mH36Rf52XPZvUEs0A8yO+AA2V19Y+Bw=;
 b=R3BPq2lTf34eAzV+3VRnrpwtLzZgesij0RdMXhjv1Yq2uuq9GDXYSuHFHInfcNDCPjzCH5lty5Acoq6hNgu7A8cbK4qxkeRJoEppRAv/wkQeGr6LmMKlcqmIeJ5SkEPGAKCo7Vyi9jXsMfqOyMnc7l7kzbDfJ6RKvcXaoZyRI0mjSceYNj0RSSaPQL9AIiuDqPCxcP3NrHYiW3m9vyFt0yB7La7GAiPd5ZySO9HRm+VNeOphkG5CClLrhg0YqGoOgWe4Cu1JqDFutw+CRu8kQMEbfV6NqE9TA7enWxveZ8VDfzym46dkb9s/hhqi99/0I7dWirrr7ETJ4zQ7lYFcrg==
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by AM7P189MB0728.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:112::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Mon, 13 Jul
 2026 10:58:18 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0223.008; Mon, 13 Jul 2026
 10:58:18 +0000
From: =?utf-8?B?Um9sYW5kIEtvdsOhY3M=?= <roland.kovacs@est.tech>
To: "priyansh.jain@oss.qualcomm.com" <priyansh.jain@oss.qualcomm.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Patch submission not appearing in archives/Patchwork
Thread-Topic: [oe] Patch submission not appearing in archives/Patchwork
Thread-Index: AQHdErI5KcRzN006dkGSLljfzCHPb7ZrR6CA
Date: Mon, 13 Jul 2026 10:58:18 +0000
Message-ID: <91fd9d6f76127d31594f7986e3fe8d13b08e4546.camel@est.tech>
References: <e16a2043-8a2f-42cd-95d7-468c0bf351c1@oss.qualcomm.com>
In-Reply-To: <e16a2043-8a2f-42cd-95d7-468c0bf351c1@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB0725:EE_|AM7P189MB0728:EE_
x-ms-office365-filtering-correlation-id: 68045e93-aeb7-493b-5850-08dee0cda582
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|366016|4022899009|376014|38070700021|22082099003|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 lIRREPuM/+XcvIAL96skx/XYVKOw7IDZFZGHjmGZg3MpPvtSbQWTQ0psEu6zC5LxQHKB51UYc6SSsReDIGZawEtdgXMC0xQapDHMWLtF5Nv9MXOLL8Tve5v1FmWu/Y+TPWwxueY5Fqq2gbLxrwTRWjF46z+qpM9locicPOG9Xz+xYWqbohFDSeu3GjdKbkfgP4H22UlG9K/i6xv51AgIiSwubgyYhsbU9qxbQhk6dAjN99zHzMH6QPQ7V2lgDV0HYN5EV7TH0OzQWqc+ImkMeRMjRJH8i251/B93XZTEyxIRcXAWZw/DkgaZ3qu1uIOblHQPrw0iXd8TM0Vr9BAGCdfQtKHvHiULuW93TS6l9cOxwZSGRTpmgPaq+wj1Gmatsb6EmfOQ8IGOMDZ9VtFgAZEVIXTC4dJC7z120+LBmlnTs8gs/sfkSmSCq1AxV0FAV4MBQaIhuDUAhMAyYIXHRC+m3S7prDJLQZCOwHuX2BOvNatvY6P7XSnQsa5w7uSjwC54MD5HOG2XO+VccdlmJeLLEM3r/1Fja763sqrKaOUXPhwRMClJvxqabx71uMWrU9SSZz/UabdYQAXgKUq2FTd2HT4GQh0FyL3iV1tuTcVI+myV4OV3oxLyRE2mOpqrHsO65qBtMWI4tEEtGeOr93WmPd8DRqb8D8GG/9woOos=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(4022899009)(376014)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b3BMYngxRGVKRkZ5YmxoOE93M29OanNTN3dLZk9FV1hodTZwa2o5b3AzUzNk?=
 =?utf-8?B?NnUvMkFwVkU4NXViMXVNVzBuenk1Smc5V09QS3lJUm5kNDU1ZUI1SXVsOThW?=
 =?utf-8?B?cW02ZWtIeGhTclZDanlVbFBxanowdHdtY3J4SEErdzE0RndYNzZSbmJEemVR?=
 =?utf-8?B?YS9US1pIODZPWW9oc3NMUXY3bGt2MGxFZjV3ZjZQNC9kWWVQSGtrV2czL0Zm?=
 =?utf-8?B?TldmczBodnZwS2dUcFlyWE82WThrbk1WaENlR1EzQUNOczdaRDVONm80Nk13?=
 =?utf-8?B?OWNGbjV5V2hKS2ZyUXYrSndMUEJuamdlekhaWEJmL2VqcGdJdURGcW5vRGxo?=
 =?utf-8?B?Q3hYS1dieUV5Qnp3Sy9CK1BtZG43R2daNFgzMTBoMi8xVWYwOXlhK1dxY1A0?=
 =?utf-8?B?OG85ZVAwTXlFWWR3K0FTc1k3TlExbXc2UDZCSjcwM3pneWNhT0tFdXdkV0dZ?=
 =?utf-8?B?WmJzM2M0SFIwVVhra1FSRWVBZlFJVnJIK09wZkdCSllXSVlkMlRHczZEVWNp?=
 =?utf-8?B?UHcvZTQ5VVdieFU3dkRQWGkva29BVG10NmdhbFIxZjVZelIrYkRKaVNHZG9m?=
 =?utf-8?B?cjJwUlNnbGc4NFdXT1cxZ0hzUm9JMVdiMG1KT25LazBEUXZXL1JKM3RVdDVD?=
 =?utf-8?B?TzNnS3c0YXRFRXppbUl6SmtQNXdBTG9DNkhvSTlzL0U5MkNDWDNWZGErZ3hm?=
 =?utf-8?B?azlNaFdzeWpORVJ5WWdnUU95ZGhLVDdObHRQaXlmSDZUNDJab0M4VFRHd29I?=
 =?utf-8?B?dGRRci9YYklGeW1pRGxvdGpqSElaZVk3KytabW53SGNqeUZINjVYSVhYZytp?=
 =?utf-8?B?ZTBia0NuSHZnbDYrQ3ZWR1FIa1ZVRmRzdld1VGJtNDhGYlFwbXU5NWlrYmRM?=
 =?utf-8?B?a3ltbEpFRlBJMEJZclJmTjJnc1lrVkxQVnBpeXB5aitwZFlqazMvaHRZdGZz?=
 =?utf-8?B?RitvZlAyY081OUdqVHVCUXgzNFV1ZCtxMkQ3NWpkZGcrbzY3Z3lWRFhVcXVF?=
 =?utf-8?B?Ri9XbnFEd2h3QUVXTThuMXk5QUYvNWVWQ0NETTZGTzIwSzNGc3RzclZJRmt3?=
 =?utf-8?B?dXZpbks5THNRK3dnK3lqRC9ZWnpLZVFMQVlaN1E2RFI3N0g5OEw0ZFdXZHk3?=
 =?utf-8?B?ZDdwZHlkeHBMMmxjZ1pLU0VmYkltK1QvZTRYVVlLbTBxN0lHNmhYV09PdVRx?=
 =?utf-8?B?R1JhanI5VjYxY296SFBQRlhCbis0R3VPeVROV01xM0d3NnkxVm42MHkxMjJv?=
 =?utf-8?B?b2VSMDJYQUFHQmxQam1JNFVCUktoMHFjVW9kWVh0S0pnT3UwVXh6a00vL1pp?=
 =?utf-8?B?dy9tNDVSa05sYm43dXYwa05Ra1JCYnNlV2M3bmE3bHFaUmRKRHVsaER5dm9u?=
 =?utf-8?B?WmcwVldiUHRaRFRwcjBwZFR6eTlRckRvZE1yOW5TelUvc0VpdCt2NXZMaWR0?=
 =?utf-8?B?YzlpTi94VjVpVk8yZXRmVjFOMmlJMzIybloyQlNLcHQ2TXlKbFVPMzgrODdV?=
 =?utf-8?B?Z2xwTW9EYWFCUVluTkRKd2ZraTN5Q2RxaDd4SWZocE4wU0xZa0czU25UZHBs?=
 =?utf-8?B?R1pMMmkvL1UrTzE3THNERzZ6YVkvRit2em01OWlML2VUbFBFZVg2bHBndzh0?=
 =?utf-8?B?TDdvQWhNT2o4NkhGckRoMWc5L0hKZW90UDB4SDM3d25pdENLSUIxVW1CMEQ1?=
 =?utf-8?B?WUs2SXdQaHNySFE1OS9WN3NNWjh2YS81ZGpsYkd4Y08yNU1ZUzVidmNoYzhq?=
 =?utf-8?B?UVpIOXVqUDh0U2lFWnJyZnkvZ2hNMWhlK0ZYZmtOTy9jcHFmTktlRmNQNUg1?=
 =?utf-8?B?cklEempObHIvQzZ0UGh2Y0Zic3luVnFhNzg4c3o1Qlprc1VaOHRFQXNIK0ti?=
 =?utf-8?B?UlhlZmc4Vm5XS2llWFpvQVArUCtEUTgwK09mRGVQL0RPUFEwcTVFak16ZVNn?=
 =?utf-8?B?dFNpaDdPOUdYeU8zenpFWUhJZzg1ZXk0aTdpNUsza29nWVBhYjQya0VQbG1Q?=
 =?utf-8?B?cDJhbGswVW1GWFdRRVNYTlV6eVgzTGNWeTlJRHhBbWhDQ1hNMVpUdThPT3lW?=
 =?utf-8?B?aTNZcW1tTlltdytiTDlvaUV5VU1DNU9QSC9lc1htdDR0SnEwUXFsaVQ0MkRW?=
 =?utf-8?B?NmV0djg0VUhaYzJIYXh2VVYyZEVKOVdDSldZYUh5NWZvQXlIMXRyOWVpeGtE?=
 =?utf-8?B?dkZUSm52cnNTRWltVGRBZFQ1eFZLWTBwTmxFbnpHYTVoTXlyZ3RVRmVPUngv?=
 =?utf-8?B?a3BrOERIbUNkd2Q3R3NVRXl4K3BuL2RhQVp3TFN6aTc2YVhHQzdFcGJ3RDNh?=
 =?utf-8?B?UWpKMjRuUlZsMXhXM3FFdEQ2Q0FHTUJmSjRHTXlYd0VTREFyYnBtdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E14D401EEA4B01459A595B350E52163B@EURP189.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 68045e93-aeb7-493b-5850-08dee0cda582
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 10:58:18.0386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qI5DpcehRoDZ/nBaGLCMARYUHch5vVDxL8jKOUiQoZ+TV7lNuXFb17XBcQkBTpcf7kcQHS1fBPy0JKDgeoKwKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0728
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 10:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128157

T24gTW9uLCAyMDI2LTA3LTEzIGF0IDE0OjA5ICswNTMwLCBQcml5YW5zaCBKYWluIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBIaSwNCj4gDQo+IEkgc3VibWl0dGVkIHRoZSBm
b2xsb3dpbmcgcGF0Y2ggb24gMjAyNi0wNy0xMCB1c2luZyBnaXQtc2VuZC1lbWFpbDoNCj4gDQo+
IFN1YmplY3Q6IFtQQVRDSF0gdGhlcm1hbGQ6IHVwZ3JhZGUgdG8gMi41LjEyDQo+IE1lc3NhZ2Ut
SUQ6IDwyMDI2MDcxMDA4NDAyMy4zNTcxNTMzLTEtcHJpeWFuc2guamFpbkBvc3MucXVhbGNvbW0u
Y29tPg0KPiANCj4gVGhlIHBhdGNoIGRvZXMgbm90IGFwcGVhciBpbiB0aGUgbWFpbGluZyBsaXN0
IGFyY2hpdmVzIG9yIFBhdGNod29yay4NCj4gQ291bGQgeW91IHBsZWFzZSBjaGVjayB3aGV0aGVy
IGl0IGlzIGJlaW5nIGhlbGQgZm9yIG1vZGVyYXRpb24gb3Igd2FzDQo+IHJlamVjdGVkPw0KPiAN
Cj4gVGhhbmtzLA0KPiBQcml5YW5zaCBKYWluDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4N
Cj4gVmlldy9SZXBseSBPbmxpbmUgKCMxMjgxNTMpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMjgxNTMNCj4gTXV0ZSBUaGlzIFRv
cGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTIwMjQ2NzI5Lzk4OTcwNzQN
Cj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWLCoFtyb2xhbmQua292YWNzQGVzdC50ZWNoXQ0KPiAtPS09
LT0tPS09LT0tPS09LT0tPS09LQ0KDQpIaSBQcml5YW5zaCwNCg0KSXNuJ3QgdGhpcyB5b3VyIHBh
dGNoIG9uIFBhdGNod29yaz8NCmh0dHBzOi8vcGF0Y2h3b3JrLnlvY3RvcHJvamVjdC5vcmcvcHJv
amVjdC9vZS9wYXRjaC8yMDI2MDcxMDA4NDAyMy4zNTcxNTMzLTEtcHJpeWFuc2guamFpbkBvc3Mu
cXVhbGNvbW0uY29tLw0KDQpodHRwczovL3BhdGNod29yay55b2N0b3Byb2plY3Qub3JnL3Byb2pl
Y3Qvb2UvbGlzdC8/c2VyaWVzPSZzdWJtaXR0ZXI9MTY2NSZzdGF0ZT0mcT0mYXJjaGl2ZT0mZGVs
ZWdhdGU9DQoNCkFyZSB5b3UgbG9va2luZyBhdCB0aGUgd3JvbmcgcGF0Y2h3b3JrIGxpc3QgYnkg
YWNjaWRlbnQ/IDopDQpBcyB5b3UgY2FuIHNlZSBpbiB0aGUgbGluayB0aGUgL3Byb2plY3Qvb2Ug
Zm9yIG1ldGEtb3BlbmVtYmVkZGVkIHZzIC9wcm9qZWN0L29lLWNvcmUgZm9yDQpvcGVuZW1iZWRk
ZWQtY29yZSBtYWlsaW5nIGxpc3QuDQoNCkNoZWVycywNCglSb2xhbmQNCg==

