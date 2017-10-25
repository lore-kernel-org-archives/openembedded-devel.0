Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0072.outbound.protection.outlook.com
	[104.47.37.72])
	by mail.openembedded.org (Postfix) with ESMTP id AF6C777F76
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 18:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=IkU+57HC2T4DnJkmE84/fi6Tc6dvRgoROXCgVpBImFE=;
	b=uumej0QHMi1ynnm/QrPpytVoRoSNv0ysEmq79CUrozZkvC1YR4UMHEW7uspVeaNoeptOZeIf8lSX8+urzQA+VqqCXl0cpyRhcUZ4ddJzt7/OsvHPcsozr8Tf7ddROdPO1qHgjfef+5JFVjdK/dfObDYDhAgPwT/ZlmLlqIl0C/Y=
Received: from BL2PR02MB2163.namprd02.prod.outlook.com (10.167.97.25) by
	BL2PR02MB2162.namprd02.prod.outlook.com (10.167.97.24) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.178.6; Wed, 25 Oct 2017 18:55:08 +0000
Received: from BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::a426:106c:5e1:52a6]) by BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::a426:106c:5e1:52a6%13]) with mapi id 15.20.0178.007;
	Wed, 25 Oct 2017 18:55:08 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] whetstone_1.2.bb: Add whetstone benchmark
Thread-Index: AQHTTbf7o45XlwaajkWmLdqbTfIwfKL06gbQ
Date: Wed, 25 Oct 2017 18:55:08 +0000
Message-ID: <BL2PR02MB216397AA1B5FF66C56E9AC39B9440@BL2PR02MB2163.namprd02.prod.outlook.com>
References: <1508945869-2384-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1soZjsH=TPUDeBvJntJStZ=g2PzNp5QSwAYbtby81y6H0Q@mail.gmail.com>
In-Reply-To: <CAMKF1soZjsH=TPUDeBvJntJStZ=g2PzNp5QSwAYbtby81y6H0Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BL2PR02MB2162;
	6:920UW8019478Y2QYZH5mpOwRT810Vm/2CjJJu3eM5TtcbQ75jGmNdXMfn6hHIe7ZpeVsjZBluZ9UZNUSHomvqYNJ1BnIYRpTl2hvPSz8+IXP1i1sidmn99OUCbHsxpJkGO9fOcgfIj8ZEXbHTfRn+ODuzC7Q9HGqxa26Yppl7a0iv02ftp3lIqMq4CKaNzI+rJJwUluCvjhh16SAvAKGYnKhVAaCN102Ef5pzUzbmmMMo48LWaqIAnpwjl3Ku+rV84a7e5zVOYBTkmRSBOf6ofJJpo4Ekvx7fZbD4mxbXchechEBMdXV/cm+4fQhBUPxbgWg9Y+HFLp2J4zrT4kdVxQ0a9Krrb80QUjrRjYdJxc=;
	5:9RCpvqd0bYGW+R83kQSlEFa+0XPEyK1FuGdOn2k2jRJwIoF6gr2EKTvUg8A5/ZROx+0J1IvL1KGQz8sPoqtp6OJgAp8LUdm+/UOJH53QGoRYfhykf1gUw2P3/yUK3YTc7roRa3LT57CZbtqVcKoOjwzZQJ6yo4cWeJXV1JVlWaQ=;
	24:0aAomUPI79ccxlfq4y6PT0/lK0nvtOL+v2rq+8SQaUwOohDEsuDnJw6XYj2Hi+8VcKFy13rTRU/MJJX9vFEtjpUFv/qkp6liyOjJ/P6o7ps=;
	7:Cn/j9SbSPzgTLDPr9vlRogzf/B7qGP2ZMmS/ltVi9XJBAOoclAou4xJloxOxX2r4ff3g4LXu+CRBhkgK0ar0HGDalZAJM8039U3K0QYincwmyNfy0euRe5KQ3kKRa+MCyeX7CxWNm9+jj9ogx/M4MHUa7jfpCiv80+lKI2A0p8Fo5sgbJ365MB3CvQkgTJQpcTE2D68jjtVtZ9Ih4Axl/NeW+7VoPdePFQMYRdqYMgSqi2F3pXzYozXKuaPhOM6E
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: a4cf7f88-9743-46e7-f937-08d51bd9e99b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603199);
	SRVR:BL2PR02MB2162; 
x-ms-traffictypediagnostic: BL2PR02MB2162:
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592);
x-microsoft-antispam-prvs: <BL2PR02MB2162A6FA5C97381C3F1D5412B9440@BL2PR02MB2162.namprd02.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(3231020)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123558100)(20161123555025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BL2PR02MB2162; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BL2PR02MB2162; 
x-forefront-prvs: 0471B73328
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(189002)(199003)(24454002)(13464003)(316002)(14454004)(229853002)(6246003)(2906002)(66066001)(97736004)(5250100002)(2900100001)(53936002)(1720100001)(72206003)(966005)(478600001)(9686003)(81166006)(68736007)(6306002)(8676002)(81156014)(99286003)(25786009)(55016002)(74316002)(305945005)(7736002)(106356001)(50986999)(33656002)(105586002)(54356999)(76176999)(7696004)(8936002)(101416001)(4326008)(5660300001)(189998001)(19273905006)(3846002)(6506006)(39060400002)(6436002)(3280700002)(3660700001)(6116002)(2950100002)(102836003)(6916009)(86362001)(53546010)(563064011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR02MB2162;
	H:BL2PR02MB2163.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cf7f88-9743-46e7-f937-08d51bd9e99b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2017 18:55:08.2865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR02MB2162
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] whetstone_1.2.bb: Add whetstone benchmark
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
X-List-Received-Date: Wed, 25 Oct 2017 18:55:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0
bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyNSwgMjAx
NyAxMDozNyBBTQ0KPiBUbzogTWFuanVrdW1hciBIYXJ0aGlrb3RlIE1hdGhhIDxNQU5KVUtVTUB4
aWxpbnguY29tPg0KPiBDYzogb3BlbmVtYmVkZWQtZGV2ZWwgPG9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFU
Q0hdIHdoZXRzdG9uZV8xLjIuYmI6IEFkZCB3aGV0c3RvbmUgYmVuY2htYXJrDQo+IA0KPiBPbiBX
ZWQsIE9jdCAyNSwgMjAxNyBhdCA4OjM3IEFNLCBNYW5qdWt1bWFyIE1hdGhhIDxtYW5qdWt1bWFy
LmhhcnRoaWtvdGUtDQo+IG1hdGhhQHhpbGlueC5jb20+IHdyb3RlOg0KPiA+IFRoZSBXaGV0c3Rv
bmUgYmVuY2htYXJrIGlzIGEgc3ludGhldGljIGJlbmNobWFyayBmb3IgZXZhbHVhdGluZyB0aGUN
Cj4gPiBwZXJmb3JtYW5jZSBvZiBjb21wdXRlcnMuDQo+ID4NCj4gPiBodHRwczovL2VuLndpa2lw
ZWRpYS5vcmcvd2lraS9XaGV0c3RvbmVfKGJlbmNobWFyaykNCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IE1hbmp1a3VtYXIgTWF0aGENCj4gPiA8bWFuanVrdW1hci5oYXJ0aGlrb3RlLW1hdGhhQHhp
bGlueC5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEtb2UvcmVjaXBlcy1iZW5jaG1hcmsvd2hldHN0
b25lL3doZXRzdG9uZV8xLjIuYmIgfCAxOA0KPiA+ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQN
Cj4gPiBtZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL3doZXRzdG9uZS93aGV0c3RvbmVfMS4yLmJi
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWJlbmNobWFyay93aGV0c3Rv
bmUvd2hldHN0b25lXzEuMi5iYg0KPiA+IGIvbWV0YS1vZS9yZWNpcGVzLWJlbmNobWFyay93aGV0
c3RvbmUvd2hldHN0b25lXzEuMi5iYg0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5k
ZXggMDAwMDAwMC4uMmUwMWUxZg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9tZXRhLW9l
L3JlY2lwZXMtYmVuY2htYXJrL3doZXRzdG9uZS93aGV0c3RvbmVfMS4yLmJiDQo+ID4gQEAgLTAs
MCArMSwxOCBAQA0KPiA+ICtERVNDUklQVElPTiA9ICJDUFUgYmVuY2htYXJrIHRvIG1lYXN1cmUg
ZmxvYXRpbmcgcG9pbnQgcGVyZm9ybWFuY2UiDQo+ID4gK0xJQ0VOU0UgPSAiUEQiDQo+ID4gK0xJ
Q19GSUxFU19DSEtTVU0gPSJmaWxlOi8vJHtDT1JFQkFTRX0vbWV0YS9maWxlcy9jb21tb24tDQo+
IGxpY2Vuc2VzL1BEO21kNT1iMzU5N2QxMjk0Njg4MWUxM2NiM2I1NDhkMTE3Mzg1MSINCj4gPiAr
DQo+IA0KPiBVc2UgQ09NTU9OX0xJQ0VOU0VfRElSIGluc3RlYWQgb2YgQ09SRUJBU0UNCj4gDQo+
ID4gK1NSQ19VUkkgPSAiaHR0cDovL3d3dy5uZXRsaWIub3JnL2JlbmNobWFyay93aGV0c3RvbmUu
YyINCj4gPiArU1JDX1VSSVttZDVzdW1dID0gImQ4ZWIyY2Q3MTA0YmI1YTEyZDYxNGFjNmQzZjFm
OWZiIg0KPiA+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiMzMzZTRjZWNhMDQyYzE0NmY2M2Vl
YzYwNTU3M2QxNmFlOGIwNzE2NmNiYzQ0YTE3YmVjMWVhOTdjNmYxZWZiZiINCj4gPiArDQo+ID4g
K1MgPSAiJHtXT1JLRElSfSINCj4gPiArDQo+ID4gK2RvX2NvbXBpbGUgKCkgew0KPiA+ICsgICAg
ICAgJHtDQ30gJHtDRkxBR1N9ICR7TERGTEFHU30gJHtTRUxFQ1RFRF9PUFRJTUlaQVRJT059IC1P
ZmFzdCAtbw0KPiA+ICt3aGV0c3RvbmUgd2hldHN0b25lLmMgLWxtIH0NCj4gDQo+IFNFTEVDVEVE
X09QVElNSVpBVElPTiBpcyBhbHJlYWR5IHBvdXJlZCBpbnRvIENGTEFHUw0KDQpXaWxsIHNlbmQg
djIgd2l0aCBjaGFuZ2VzDQoNClRoYW5rcywNCk1hbmp1DQoNCj4gPiArDQo+ID4gK2RvX2luc3Rh
bGwgKCkgew0KPiA+ICsgICAgICAgaW5zdGFsbCAtRG0gMDc1NSB3aGV0c3RvbmUgJHtEfSR7Ymlu
ZGlyfS93aGV0c3RvbmUgfQ0KPiA+ICsNCj4gPiAtLQ0KPiA+IDIuNy40DQo+ID4NCj4gPiAtLQ0K
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4g
T3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+IE9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg==

