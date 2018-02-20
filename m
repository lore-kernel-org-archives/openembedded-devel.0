Return-Path: <kwangsub.kim@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0097.outbound.protection.outlook.com [104.47.2.97])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE257865E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9UO3Eo+EjLR+MDH137vxsM8j6lllmatiO37X+A9BsW0=;
	b=d4OqGRKGM6QCmWaNvCEpJXt1oHAD9Dnqj8sWfxKicIGhVFo4NZ9/YpxC50rmUQh/RMr0BHP3WJFWw6KgUt6vVExypyAkb12VbC5NaZmZbJoLiYPF1C/Ld4VduU7DcG1zTYom54iEdhlYnYvbG+pBnvATsNc2hAKGd2MplZeFBsE=
Received: from HE1PR0202MB2491.eurprd02.prod.outlook.com (10.168.183.137) by
	HE1PR0202MB2684.eurprd02.prod.outlook.com (10.168.185.7) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.506.18; Tue, 20 Feb 2018 12:00:24 +0000
Received: from HE1PR0202MB2491.eurprd02.prod.outlook.com
	([fe80::6469:f629:e6b6:b57a]) by
	HE1PR0202MB2491.eurprd02.prod.outlook.com
	([fe80::6469:f629:e6b6:b57a%14]) with mapi id 15.20.0506.021;
	Tue, 20 Feb 2018 12:00:24 +0000
From: Kwangsub Kim <kwangsub.kim@qt.io>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-qt5][PATCH v2] qtbase: add a config option to
	optimize for size
Thread-Index: AQHTqV8qb74Ce8f+bk+ioGOp7yU6wKOrocAAgAHeKwD//5H1AIAAtwWA
Date: Tue, 20 Feb 2018 12:00:24 +0000
Message-ID: <E9A2FC4D-0C66-4A9E-A0BC-FD9F7360D388@qt.io>
References: <1519030401-9299-1-git-send-email-kwangsub.kim@qt.io>
	<CA+chaQfbgo2cG1zJ+UmBRWGaKu6vUy4Kod7SSOZk7=ZhjzF5SQ@mail.gmail.com>
	<B2794334-CD7F-4E09-9E3B-51AB564E3A04@qt.io>
	<CA+chaQffOATO2cZbZBR5u=YSO6T74icL7W2hA88bZ0SwX25rAA@mail.gmail.com>
In-Reply-To: <CA+chaQffOATO2cZbZBR5u=YSO6T74icL7W2hA88bZ0SwX25rAA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=kwangsub.kim@qt.io; 
x-originating-ip: [175.195.156.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0202MB2684;
	7:4o5yWK4R/joxL+DVYL8Hf82fRXS3eVdmDEJIFoRKAz6QuoMq7OSVUNfnmZOG3hyNSjz+bOIJPp7QqdN3m9KPiuWP3dMu8IjVzaiDDWipUrQnYSS8/DumNX/bJ/VYw+IwLD6J+Vx4LmUwcAHNbLQ4IKxzUBSAqcZWkurDmaqKW4AgMcn9LYjr8nNxjxXdTCgSHg7zJ7yPdK/USyjQl1NaV0v/i3pmlhZMaZ9IZ523GcQLG4wlzlQ83pPqJsNISB/9
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 42f6bf4c-1729-4048-e754-08d57859869f
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:HE1PR0202MB2684; 
x-ms-traffictypediagnostic: HE1PR0202MB2684:
x-microsoft-antispam-prvs: <HE1PR0202MB268448664CD20BF2B8A5640786CF0@HE1PR0202MB2684.eurprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(278428928389397)(85827821059158)(264703809997249)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3231101)(944501161)(3002001)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(20161123562045)(6072148)(201708071742011);
	SRVR:HE1PR0202MB2684; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0202MB2684; 
x-forefront-prvs: 05891FB07F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39380400002)(376002)(396003)(366004)(39850400004)(189003)(199004)(5250100002)(74482002)(6512007)(6436002)(54896002)(236005)(6306002)(2906002)(97736004)(106356001)(2900100001)(83716003)(86362001)(966005)(82746002)(606006)(76176011)(99286004)(316002)(3280700002)(93886005)(36756003)(14454004)(4326008)(6916009)(2950100002)(5660300001)(3660700001)(53386004)(81166006)(6246003)(81156014)(25786009)(8936002)(102836004)(53546011)(6506007)(6486002)(33896004)(59450400001)(8676002)(53936002)(39060400002)(105586002)(7736002)(478600001)(6116002)(3846002)(66066001)(68736007)(186003)(26005)(33656002)(9326002)(229853002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0202MB2684;
	H:HE1PR0202MB2491.eurprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
x-microsoft-antispam-message-info: BWXvD8X08lV+Qv3vJn/xLcrqqhesX8mIJA2Tl6gOIrzJXZN/ixIDxgE41lzjGzxlmPrAK3kj5teE3q6VRWQ5PuQWYhv9AWUPaMkGYu9k7YzPpPNqznfE+/2j21INI8iKhvEm5+O8WcPv71OTZwIkY0Muh/xw443R2edC3JsHyx4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f6bf4c-1729-4048-e754-08d57859869f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2018 12:00:24.7435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0202MB2684
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2] qtbase: add a config option to optimize for size
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Feb 2018 15:32:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCk5vdyBJIGdvdCB0byBrbm93IHRoZSBtZWFuaW5nIG9mIHlvdXIgcmVzcG9uc2UuIEkg
aGFkIHRyaWVkIHRvIHNvbHZlIHRoZSBwcm9ibGVtIHdpdGggUEFDS0FHRUNPTkZJR1tvcHRpbWl6
ZS1zaXplXSBvbmx5LiBJIHdpbGwgc2VuZCB0aGUgdXBkYXRlZCBwYXRjaCBzb29uLg0KVGhhbmtz
IGZvciB5b3VyIGFkdmljZS4NCg0KQmVzdCByZWdhcmRzLA0KS3dhbmdzdWINCg0KRnJvbTogTWFy
dGluIEphbnNhIDxtYXJ0aW4uamFuc2FAZ21haWwuY29tPg0KRGF0ZTogVHVlc2RheSwgMjAgRmVi
cnVhcnkgMjAxOCBhdCA3OjA1IFBNDQpUbzogS3dhbmdzdWIgS2ltIDxrd2FuZ3N1Yi5raW1AcXQu
aW8+DQpDYzogb3BlbmVtYmVkZGVkLWRldmVsIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLXF0NV1bUEFUQ0ggdjJdIHF0
YmFzZTogYWRkIGEgY29uZmlnIG9wdGlvbiB0byBvcHRpbWl6ZSBmb3Igc2l6ZQ0KDQpIaSwNCg0K
dGhhdCdzIG5vdCB3aGF0IGlzIHdyb25nIHdpdGggdGhpcy4NCg0KV2hhdCB5b3UncmUgZG9pbmcg
aXM6DQpQQUNLQUdFQ09ORklHW29wdGltaXplLXNpemVdID0gIi1vcHRpbWl6ZS1zaXplLC1vcHRp
bWl6ZS1zaXplIg0Kd2hlbiAtT3MgaXMgZW5hYmxlZCBhbmQNClBBQ0tBR0VDT05GSUdbb3B0aW1p
emUtc2l6ZV0gPSAiLW9wdGltaXplLXNpemUiDQp3aGVuIGl0IGlzbid0IGJ1dCwgdGhhdCdzIG5v
dCBob3cgUEFDS0FHRUNPTkZJRyBpcyB1c2VkIGJ5IGFueSBzYW5lIHBlcnNvbi4NCg0KDQpXaGF0
IHlvdSBzaG91bGQgZG8gaXMgdG8ga2VlcDoNClBBQ0tBR0VDT05GSUdbb3B0aW1pemUtc2l6ZV0g
PSAiLW9wdGltaXplLXNpemUiDQoNCg0KDQphcyBpdCB3YXMgYW5kIGFkZDoNCiR7QGJiLnV0aWxz
LmNvbnRhaW5zKCdTRUxFQ1RFRF9PUFRJTUlaQVRJT04nLCAnLU9zJywgJ29wdGltaXplLXNpemUn
LCAnJywgZCl9DQoNCmluIGRlZmF1bHQgUEFDS0FHRUNPTkZJRyB2YXJpYWJsZSAoc2VhcmNoICJQ
QUNLQUdFQ09ORklHID89ICIgXCIsIG9yIHlvdSBjYW4gYWRkIGl0IHRvIFBBQ0tBR0VDT05GSUdf
REVGQVVMVCB2YXJpYWJsZSkuDQoNCg0KUmVnYXJkcywNCg0KT24gVHVlLCBGZWIgMjAsIDIwMTgg
YXQgODozOSBBTSwgS3dhbmdzdWIgS2ltIDxrd2FuZ3N1Yi5raW1AcXQuaW88bWFpbHRvOmt3YW5n
c3ViLmtpbUBxdC5pbz4+IHdyb3RlOg0KSGkgTWFydGluLA0KDQpUaGFua3MgZm9yIHlvdXIgZmVl
ZGJhY2suDQpJIGZhaWxlZCB0byBmaW5kIGEgcmlnaHQgd2F5IHRvIGFkZCB0aGUgaW5saW5lIGZ1
bmN0aW9uLiBUaGF04oCZcyB3aHkgSSBhZGRlZCBuZXcgdmFyaWFibGUuIEkgdHJpZWQgdG8gdXBk
YXRlIGxpa2UgYmVsb3cgYnV0IGl0IGNhdXNlZCBhIHN5bnRheCBlcnJvci4gVGhlIGZ1bmN0aW9u
IChiYi51dGlscy5jb250YWlucykgd2FzIG5vdCBldmFsdWF0ZWQgYW5kIGp1c3QgY29waWVkIGFz
IGEgc3RyaW5nLiBDb3VsZCB5b3Uga2luZGx5IGFkdmlzZSBtZSB0byBmaXggdGhpcz8NCg0KUEFD
S0FHRUNPTkZJR1tvcHRpbWl6ZS1zaXplXSA9ICItb3B0aW1pemUtc2l6ZSwke0BiYi51dGlscy5j
b250YWlucygnU0VMRUNURURfT1BUSU1JWkFUSU9OJywgJy1PcycsICctb3B0aW1pemUtc2l6ZScs
ICcnLCBkKX0iDQoNCkJlc3QgcmVnYXJkcywNCkt3YW5nc3ViDQoNCkZyb206IE1hcnRpbiBKYW5z
YSA8bWFydGluLmphbnNhQGdtYWlsLmNvbTxtYWlsdG86bWFydGluLmphbnNhQGdtYWlsLmNvbT4+
DQpEYXRlOiBNb25kYXksIDE5IEZlYnJ1YXJ5IDIwMTggYXQgOTowNyBQTQ0KVG86IEt3YW5nc3Vi
IEtpbSA8a3dhbmdzdWIua2ltQHF0LmlvPG1haWx0bzprd2FuZ3N1Yi5raW1AcXQuaW8+Pg0KQ2M6
IG9wZW5lbWJlZGRlZC1kZXZlbCA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc8bWFpbHRvOm9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPj4N
ClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLXF0NV1bUEFUQ0ggdjJdIHF0YmFzZTogYWRkIGEgY29u
ZmlnIG9wdGlvbiB0byBvcHRpbWl6ZSBmb3Igc2l6ZQ0KDQpUaGlzIGRvZXNuJ3QgbWFrZSBzZW5z
ZS4NCg0KTGVhdmUgUEFDS0FHRUNPTkZJR1tvcHRpbWl6ZS1zaXplXSBhcyBpdCB3YXMgaW4gdjIg
YW5kIGFkZCAke0BiYi51dGlscy5jb250YWlucygnU0VMRUNURURfT1BUSU1JWkFUSU9OJywgJy1P
cycsICdvcHRpbWl6ZS1zaXplJywgJycsIGQpfSB0byBkZWZhdWx0IFBBQ0tBR0VDT05GSUcgdmFs
dWUuDQoNCg0KT24gTW9uLCBGZWIgMTksIDIwMTggYXQgOTo1MyBBTSwgS3dhbmdzdWIgS2ltIDxr
d2FuZ3N1Yi5raW1AcXQuaW88bWFpbHRvOmt3YW5nc3ViLmtpbUBxdC5pbz4+IHdyb3RlOg0KVGhl
ICctb3B0aW1pemUtc2l6ZScgb3B0aW9uIHdvdWxkIGVuYWJsZSB0aGUgY29tcGlsZXIgdG8gb3B0
aW1pemUNCmZvciBzaXplIGluc3RlYWQgb2Ygc3BlZWQuIElmIHRoZSBnbG9iYWwgY29tcGlsZXIg
b3B0aW9uIGFscmVhZHkNCmluY2x1ZGVkICctT3MnLCB0aGlzIG9wdGlvbiB3b3VsZCBiZSBlbmFi
bGVkIGJ5IGRlZmF1bHQuDQoNCkl0IHdvdWxkIGFmZmVjdCB0aGUgd2hvbGUgUXQgbGlicmFyaWVz
IGFuZCBRdCBhcHBsaWNhdGlvbnMgYXMgd2VsbC4NClRoaXMgZmVhdHVyZSBpcyBhdmFpbGFibGUg
aW4gUXQgNS45Ky4NCg0KU2lnbmVkLW9mZi1ieTogS3dhbmdzdWIgS2ltIDxrd2FuZ3N1Yi5raW1A
cXQuaW88bWFpbHRvOmt3YW5nc3ViLmtpbUBxdC5pbz4+DQotLS0NCiByZWNpcGVzLXF0L3F0NS9x
dGJhc2VfZ2l0LmJiPGh0dHA6Ly9xdGJhc2VfZ2l0LmJiPiB8IDMgKysrDQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvcmVjaXBlcy1xdC9xdDUvcXRiYXNl
X2dpdC5iYjxodHRwOi8vcXRiYXNlX2dpdC5iYj4gYi9yZWNpcGVzLXF0L3F0NS9xdGJhc2VfZ2l0
LmJiPGh0dHA6Ly9xdGJhc2VfZ2l0LmJiPg0KaW5kZXggNGYzYWRlMi4uMjA4YTc1NSAxMDA2NDQN
Ci0tLSBhL3JlY2lwZXMtcXQvcXQ1L3F0YmFzZV9naXQuYmI8aHR0cDovL3F0YmFzZV9naXQuYmI+
DQorKysgYi9yZWNpcGVzLXF0L3F0NS9xdGJhc2VfZ2l0LmJiPGh0dHA6Ly9xdGJhc2VfZ2l0LmJi
Pg0KQEAgLTE0Nyw2ICsxNDcsOSBAQCBQQUNLQUdFQ09ORklHW3dpZGdldHNdID0gIi13aWRnZXRz
LC1uby13aWRnZXRzIg0KIFBBQ0tBR0VDT05GSUdbbGlicHJveHldID0gIi1saWJwcm94eSwtbm8t
bGlicHJveHksbGlicHJveHkiDQogUEFDS0FHRUNPTkZJR1tsaWJpbnB1dF0gPSAiLWxpYmlucHV0
LC1uby1saWJpbnB1dCxsaWJpbnB1dCINCiBQQUNLQUdFQ09ORklHW2pvdXJuYWxkXSA9ICItam91
cm5hbGQsLW5vLWpvdXJuYWxkLHN5c3RlbWQiDQorUEFDS0FHRUNPTkZJR1tvcHRpbWl6ZS1zaXpl
XSA9ICItb3B0aW1pemUtc2l6ZSwke1FUX0RFRkFVTFRfT1BUSU1JWkFUSU9OX0ZPUl9TSVpFfSIN
CisNCitRVF9ERUZBVUxUX09QVElNSVpBVElPTl9GT1JfU0laRSA9ICIke0BiYi51dGlscy5jb250
YWlucygnU0VMRUNURURfT1BUSU1JWkFUSU9OJywgJy1PcycsICctb3B0aW1pemUtc2l6ZScsICcn
LCBkKX0iDQoNCiBRVF9DT05GSUdfRkxBR1NfR09MRCA9ICIke0BiYi51dGlscy5jb250YWlucygn
RElTVFJPX0ZFQVRVUkVTJywgJ2xkLWlzLWdvbGQnLCAnLXVzZS1nb2xkLWxpbmtlcicsICctbm8t
dXNlLWdvbGQtbGlua2VyJywgZCl9Ig0KIFFUX0NPTkZJR19GTEFHUyArPSAiIFwNCi0tDQoyLjcu
NA0KDQotLQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Ck9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCk9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPG1haWx0bzpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4NCmh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbmVtYmVkZGVkLWRldmVsDQoNCg0K

