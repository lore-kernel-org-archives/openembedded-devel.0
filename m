Return-Path: <kwangsub.kim@qt.io>
X-Greylist: delayed 83913 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Feb 2018 08:11:02 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0127.outbound.protection.outlook.com [104.47.0.127])
	by mail.openembedded.org (Postfix) with ESMTP id 470EC784EB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=S5AIbaAfNreB2h7dgKTXeyTHmzms8uWwm3gL+cqTSL0=;
	b=NYlfbJ05R7gY4p/OQAQdS1OHlG3K1dnczalmwjZ1SUhUdhyk4GrZgK9Ww3E7K25Sh3nlRrTE3kuUlSkvE0DRWD1cqg2WfBN3Xbs+ZOMBUVCJl2PZStUNYxaPcITy0nggUkin/HaBMqOPWi3h1JiEFm75RPq0GxdmONDXtzo9k8M=
Received: from HE1PR0202MB2491.eurprd02.prod.outlook.com (10.168.183.137) by
	HE1PR0202MB2506.eurprd02.prod.outlook.com (10.168.183.140) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.506.18;
	Tue, 20 Feb 2018 07:39:16 +0000
Received: from HE1PR0202MB2491.eurprd02.prod.outlook.com
	([fe80::6469:f629:e6b6:b57a]) by
	HE1PR0202MB2491.eurprd02.prod.outlook.com
	([fe80::6469:f629:e6b6:b57a%14]) with mapi id 15.20.0506.021;
	Tue, 20 Feb 2018 07:39:16 +0000
From: Kwangsub Kim <kwangsub.kim@qt.io>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-qt5][PATCH v2] qtbase: add a config option to
	optimize for size
Thread-Index: AQHTqV8qb74Ce8f+bk+ioGOp7yU6wKOrocAAgAHeKwA=
Date: Tue, 20 Feb 2018 07:39:16 +0000
Message-ID: <B2794334-CD7F-4E09-9E3B-51AB564E3A04@qt.io>
References: <1519030401-9299-1-git-send-email-kwangsub.kim@qt.io>
	<CA+chaQfbgo2cG1zJ+UmBRWGaKu6vUy4Kod7SSOZk7=ZhjzF5SQ@mail.gmail.com>
In-Reply-To: <CA+chaQfbgo2cG1zJ+UmBRWGaKu6vUy4Kod7SSOZk7=ZhjzF5SQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=kwangsub.kim@qt.io; 
x-originating-ip: [175.195.156.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0202MB2506;
	7:oEBULFcL2z/jyJ3xC4cZVAz6bCYWFGTY4gK10TyUytD7MtfZ5vKPWavsYj/X7WRHaTu8RyHDO5cdzQtgdEPZ0CVzJatLUWKkWYptzVj5HoUlXEvD8NNc8QPbz00/Eml1Z9FI6etYyeuNs79XuncNl+Sz7gjEufTWFb6ezfFApCCWiGnySE8cBKZ/Lee4MQBA7ctFK1AH+MGfWmj9rpPo2x6LLN7XWj4bdJiOCTH5s1BDlbFjpKbvpeo0/+a27qJW
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 59bd2391-61df-4356-5bff-08d578350b80
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
	SRVR:HE1PR0202MB2506; 
x-ms-traffictypediagnostic: HE1PR0202MB2506:
x-microsoft-antispam-prvs: <HE1PR0202MB250629D30D92D8708B8D90FA86CF0@HE1PR0202MB2506.eurprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(278428928389397)(85827821059158)(264703809997249)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3231101)(944501161)(3002001)(6041288)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(6072148)(201708071742011);
	SRVR:HE1PR0202MB2506; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0202MB2506; 
x-forefront-prvs: 05891FB07F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39850400004)(366004)(396003)(376002)(39380400002)(189003)(199004)(6306002)(53936002)(54896002)(236005)(68736007)(6512007)(5250100002)(606006)(6916009)(2950100002)(186003)(14454004)(3280700002)(8936002)(26005)(33656002)(3660700001)(2906002)(6436002)(106356001)(82746002)(36756003)(966005)(3846002)(6116002)(81166006)(8676002)(81156014)(102836004)(6506007)(53546011)(229853002)(53386004)(9326002)(66066001)(76176011)(83716003)(478600001)(33896004)(59450400001)(74482002)(99286004)(6246003)(86362001)(39060400002)(2900100001)(25786009)(316002)(4326008)(5660300001)(7736002)(6486002)(97736004)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0202MB2506;
	H:HE1PR0202MB2491.eurprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
x-microsoft-antispam-message-info: c4/GNjySXG5P8I9P56kB2R5F7A7Gc1vMZKYf1KsO1b1TzkRH9jHbWIKbN2M1HOMjA6MPThXItmN1+LhrSUM574sZ4sWizjAKsX+djpNWWGH12YlNNcI3oG1eiuS9L40QIEIiBhtWrpgDMijLMVlXvHOJahPphZOnlnVsQIM0IbQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bd2391-61df-4356-5bff-08d578350b80
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2018 07:39:16.3104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0202MB2506
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
X-List-Received-Date: Tue, 20 Feb 2018 08:11:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWFydGluLA0KDQpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suDQpJIGZhaWxlZCB0byBmaW5k
IGEgcmlnaHQgd2F5IHRvIGFkZCB0aGUgaW5saW5lIGZ1bmN0aW9uLiBUaGF04oCZcyB3aHkgSSBh
ZGRlZCBuZXcgdmFyaWFibGUuIEkgdHJpZWQgdG8gdXBkYXRlIGxpa2UgYmVsb3cgYnV0IGl0IGNh
dXNlZCBhIHN5bnRheCBlcnJvci4gVGhlIGZ1bmN0aW9uIChiYi51dGlscy5jb250YWlucykgd2Fz
IG5vdCBldmFsdWF0ZWQgYW5kIGp1c3QgY29waWVkIGFzIGEgc3RyaW5nLiBDb3VsZCB5b3Uga2lu
ZGx5IGFkdmlzZSBtZSB0byBmaXggdGhpcz8NCg0KUEFDS0FHRUNPTkZJR1tvcHRpbWl6ZS1zaXpl
XSA9ICItb3B0aW1pemUtc2l6ZSwke0BiYi51dGlscy5jb250YWlucygnU0VMRUNURURfT1BUSU1J
WkFUSU9OJywgJy1PcycsICctb3B0aW1pemUtc2l6ZScsICcnLCBkKX0iDQoNCkJlc3QgcmVnYXJk
cywNCkt3YW5nc3ViDQoNCkZyb206IE1hcnRpbiBKYW5zYSA8bWFydGluLmphbnNhQGdtYWlsLmNv
bT4NCkRhdGU6IE1vbmRheSwgMTkgRmVicnVhcnkgMjAxOCBhdCA5OjA3IFBNDQpUbzogS3dhbmdz
dWIgS2ltIDxrd2FuZ3N1Yi5raW1AcXQuaW8+DQpDYzogb3BlbmVtYmVkZGVkLWRldmVsIDxvcGVu
ZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbb2Vd
IFttZXRhLXF0NV1bUEFUQ0ggdjJdIHF0YmFzZTogYWRkIGEgY29uZmlnIG9wdGlvbiB0byBvcHRp
bWl6ZSBmb3Igc2l6ZQ0KDQpUaGlzIGRvZXNuJ3QgbWFrZSBzZW5zZS4NCg0KTGVhdmUgUEFDS0FH
RUNPTkZJR1tvcHRpbWl6ZS1zaXplXSBhcyBpdCB3YXMgaW4gdjIgYW5kIGFkZCAke0BiYi51dGls
cy5jb250YWlucygnU0VMRUNURURfT1BUSU1JWkFUSU9OJywgJy1PcycsICdvcHRpbWl6ZS1zaXpl
JywgJycsIGQpfSB0byBkZWZhdWx0IFBBQ0tBR0VDT05GSUcgdmFsdWUuDQoNCg0KT24gTW9uLCBG
ZWIgMTksIDIwMTggYXQgOTo1MyBBTSwgS3dhbmdzdWIgS2ltIDxrd2FuZ3N1Yi5raW1AcXQuaW88
bWFpbHRvOmt3YW5nc3ViLmtpbUBxdC5pbz4+IHdyb3RlOg0KVGhlICctb3B0aW1pemUtc2l6ZScg
b3B0aW9uIHdvdWxkIGVuYWJsZSB0aGUgY29tcGlsZXIgdG8gb3B0aW1pemUNCmZvciBzaXplIGlu
c3RlYWQgb2Ygc3BlZWQuIElmIHRoZSBnbG9iYWwgY29tcGlsZXIgb3B0aW9uIGFscmVhZHkNCmlu
Y2x1ZGVkICctT3MnLCB0aGlzIG9wdGlvbiB3b3VsZCBiZSBlbmFibGVkIGJ5IGRlZmF1bHQuDQoN
Ckl0IHdvdWxkIGFmZmVjdCB0aGUgd2hvbGUgUXQgbGlicmFyaWVzIGFuZCBRdCBhcHBsaWNhdGlv
bnMgYXMgd2VsbC4NClRoaXMgZmVhdHVyZSBpcyBhdmFpbGFibGUgaW4gUXQgNS45Ky4NCg0KU2ln
bmVkLW9mZi1ieTogS3dhbmdzdWIgS2ltIDxrd2FuZ3N1Yi5raW1AcXQuaW88bWFpbHRvOmt3YW5n
c3ViLmtpbUBxdC5pbz4+DQotLS0NCiByZWNpcGVzLXF0L3F0NS9xdGJhc2VfZ2l0LmJiPGh0dHA6
Ly9xdGJhc2VfZ2l0LmJiPiB8IDMgKysrDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQ0KDQpkaWZmIC0tZ2l0IGEvcmVjaXBlcy1xdC9xdDUvcXRiYXNlX2dpdC5iYjxodHRwOi8vcXRi
YXNlX2dpdC5iYj4gYi9yZWNpcGVzLXF0L3F0NS9xdGJhc2VfZ2l0LmJiPGh0dHA6Ly9xdGJhc2Vf
Z2l0LmJiPg0KaW5kZXggNGYzYWRlMi4uMjA4YTc1NSAxMDA2NDQNCi0tLSBhL3JlY2lwZXMtcXQv
cXQ1L3F0YmFzZV9naXQuYmI8aHR0cDovL3F0YmFzZV9naXQuYmI+DQorKysgYi9yZWNpcGVzLXF0
L3F0NS9xdGJhc2VfZ2l0LmJiPGh0dHA6Ly9xdGJhc2VfZ2l0LmJiPg0KQEAgLTE0Nyw2ICsxNDcs
OSBAQCBQQUNLQUdFQ09ORklHW3dpZGdldHNdID0gIi13aWRnZXRzLC1uby13aWRnZXRzIg0KIFBB
Q0tBR0VDT05GSUdbbGlicHJveHldID0gIi1saWJwcm94eSwtbm8tbGlicHJveHksbGlicHJveHki
DQogUEFDS0FHRUNPTkZJR1tsaWJpbnB1dF0gPSAiLWxpYmlucHV0LC1uby1saWJpbnB1dCxsaWJp
bnB1dCINCiBQQUNLQUdFQ09ORklHW2pvdXJuYWxkXSA9ICItam91cm5hbGQsLW5vLWpvdXJuYWxk
LHN5c3RlbWQiDQorUEFDS0FHRUNPTkZJR1tvcHRpbWl6ZS1zaXplXSA9ICItb3B0aW1pemUtc2l6
ZSwke1FUX0RFRkFVTFRfT1BUSU1JWkFUSU9OX0ZPUl9TSVpFfSINCisNCitRVF9ERUZBVUxUX09Q
VElNSVpBVElPTl9GT1JfU0laRSA9ICIke0BiYi51dGlscy5jb250YWlucygnU0VMRUNURURfT1BU
SU1JWkFUSU9OJywgJy1PcycsICctb3B0aW1pemUtc2l6ZScsICcnLCBkKX0iDQoNCiBRVF9DT05G
SUdfRkxBR1NfR09MRCA9ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywg
J2xkLWlzLWdvbGQnLCAnLXVzZS1nb2xkLWxpbmtlcicsICctbm8tdXNlLWdvbGQtbGlua2VyJywg
ZCl9Ig0KIFFUX0NPTkZJR19GTEFHUyArPSAiIFwNCi0tDQoyLjcuNA0KDQotLQ0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCk9wZW5lbWJlZGRlZC1kZXZl
bCBtYWlsaW5nIGxpc3QNCk9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PG1haWx0bzpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCmh0dHA6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWRl
dmVsDQoNCg==

