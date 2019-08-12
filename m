Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 01E837E465
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 21:52:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7CLqD7F010360
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Aug 2019 14:52:29 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.10]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0468.000;
	Mon, 12 Aug 2019 14:52:17 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 1/1] php: zlib and zip support
Thread-Index: AQHVUUNC/vrmkq9WB0eliswKDId4Xab4XJIA//+wzAA=
Date: Mon, 12 Aug 2019 21:52:17 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84FA87E73E@ALA-MBD.corp.ad.wrs.com>
References: <20190812192220.238334-1-joe.slater@windriver.com>
	<d276d252-b4bd-8595-eeb8-4e1b649eca24@gmail.com>
In-Reply-To: <d276d252-b4bd-8595-eeb8-4e1b649eca24@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.118.13]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/1] php: zlib and zip support
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
X-List-Received-Date: Mon, 12 Aug 2019 21:52:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TWF5YmUgdGhlIG5hbWVzIGFyZSBjb25mdXNpbmcuICBJdCdzIHJlYWxseSB1c2VfbGliemlwX3pp
cCB2cyB1c2VfYnVuZGxlZF96aXAuICAgSm9lDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBha3VzdGVyODA4IDxha3VzdGVyODA4QGdtYWlsLmNvbT4gDQpTZW50OiBNb25kYXks
IEF1Z3VzdCAxMiwgMjAxOSAxMjozNCBQTQ0KVG86IFNsYXRlciwgSm9zZXBoIDxqb2Uuc2xhdGVy
QHdpbmRyaXZlci5jb20+OyBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIIDEvMV0gcGhwOiB6bGliIGFuZCB6
aXAgc3VwcG9ydA0KDQoNCg0KT24gOC8xMi8xOSAxMjoyMiBQTSwgSm9lIFNsYXRlciB3cm90ZToN
Cj4gQWRkIGJhY2sgemxpYiBzdXBwb3J0LiAgRGVmaW5lIHppcCBzdXBwb3J0IGJ1dCBkbyBub3Qg
ZW5hYmxlIGl0Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKb2UgU2xhdGVyIDxqb2Uuc2xhdGVyQHdp
bmRyaXZlci5jb20+DQo+IC0tLQ0KPiAgbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3BocC9waHAu
aW5jIHwgNyArKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcGhw
L3BocC5pbmMgDQo+IGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3BocC9waHAuaW5jDQo+IGlu
ZGV4IDMzYmNmMTIuLjA4MTczZWEgMTAwNjQ0DQo+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0
b29scy9waHAvcGhwLmluYw0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvcGhwL3Bo
cC5pbmMNCj4gQEAgLTU5LDcgKzU5LDcgQEAgRVhUUkFfT0VDT05GID0gIi0tZW5hYmxlLW1ic3Ry
aW5nIFwNCj4gICAgICAgICAgICAgICAgICAtLWVuYWJsZS1mcG0gXA0KPiAgICAgICAgICAgICAg
ICAgIC0td2l0aC1saWJkaXI9JHtiYXNlbGlifSBcDQo+ICAgICAgICAgICAgICAgICAgLS13aXRo
LWdldHRleHQ9JHtTVEFHSU5HX0xJQkRJUn0vLi4gXA0KPiAtICAgICAgICAgICAgICAgIC0td2l0
aC1saWJ6aXA9JHtTVEFHSU5HX0xJQkRJUn0vLi4gXA0KPiArICAgICAgICAgICAgICAgIC0td2l0
aC16bGliPSR7U1RBR0lOR19MSUJESVJ9Ly4uIFwNCj4gICAgICAgICAgICAgICAgICAtLXdpdGgt
aWNvbnY9JHtTVEFHSU5HX0xJQkRJUn0vLi4gXA0KPiAgICAgICAgICAgICAgICAgIC0td2l0aC1i
ejI9JHtTVEFHSU5HX0RJUl9UQVJHRVR9JHtleGVjX3ByZWZpeH0gXA0KPiAgICAgICAgICAgICAg
ICAgIA0KPiAtLXdpdGgtY29uZmlnLWZpbGUtcGF0aD0ke3N5c2NvbmZkaXJ9L3BocC9hcGFjaGUy
LXBocCR7UEhQX01BSk9SX1ZFUlNJDQo+IE9OfSBcIEBAIC04MSw2ICs4MSwxMSBAQCBQQUNLQUdF
Q09ORklHID8/PSAibXlzcWwgc3FsaXRlMyBpbWFwIG9wY2FjaGUgb3BlbnNzbCBcICAiDQo+ICBQ
QUNLQUdFQ09ORklHX2NsYXNzLW5hdGl2ZSA9ICIiDQo+ICANCj4gKyMgRm9yIHppcCwgc2VsZWN0
IG9uZSBvciBub25lLiAgb2xkemlwIHVzZXMgYSBidW5kbGVkIGxpYnJhcnkgYW5kIGlzIGRlcHJl
Y2F0ZWQuDQo+ICsjDQoNCkhvdyB3b3VsZCBJIGtub3cgd2hpY2ggaXMgb2xkIG9yIG5ldz8gaXMg
dGhlcmUgYSB2ZXJzaW9uIHJlZiB3ZSBjYW4gbWVudGlvbj8gaXMgaXQgYSBncGx2MiBvciBncGx2
MyB0aGluZz8NCg0KLWFybWluDQo+ICtQQUNLQUdFQ09ORklHW25ld3ppcF0gPSAiLS1lbmFibGUt
emlwIC0td2l0aC1saWJ6aXA9JHtTVEFHSU5HX0VYRUNQUkVGSVhESVJ9LCxsaWJ6aXAiDQo+ICtQ
QUNLQUdFQ09ORklHW29sZHppcF0gPSAiLS1lbmFibGUtemlwIC0td2l0aG91dC1saWJ6aXAsIg0K
PiArDQo+ICBQQUNLQUdFQ09ORklHW215c3FsXSA9ICItLXdpdGgtbXlzcWw9JHtTVEFHSU5HX0RJ
Ul9UQVJHRVR9JHtwcmVmaXh9IFwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIC0td2l0aC1t
eXNxbGk9JHtTVEFHSU5HX0JJTkRJUl9DUk9TU30vbXlzcWxfY29uZmlnIFwNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIA0KPiAtLXdpdGgtcGRvLW15c3FsPSR7U1RBR0lOR19CSU5ESVJfQ1JP
U1N9L215c3FsX2NvbmZpZyBcDQoNCg==

