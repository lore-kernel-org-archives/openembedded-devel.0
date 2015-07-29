Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8ECE176280
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 06:52:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99017993"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2015 14:56:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6T6or4c002398
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:50:53 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Wed, 29 Jul 2015 14:52:44 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] dracut: upgrade 38 -> 43
Thread-Index: AQHQycfYetW9a+TkwUuZeTTvtai28Z3xeIYAgACJlyA=
Date: Wed, 29 Jul 2015 06:52:43 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E87391102C@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1438180112-4185-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<55B874C2.9040007@windriver.com>
In-Reply-To: <55B874C2.9040007@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] dracut: upgrade 38 -> 43
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jul 2015 06:52:54 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hcnRpbjoNCg0KUGxlYXNlIGRyb3AgdGhpcyBwYXRjaCwgc2luY2UgS2FpIGZyb20gV2lu
ZHJpdmVyIGhhcyBzZW50IHBhdGNoIHRvIHVwZ3JhZGUgZHJhY3V0IGFscmVhZHkuIDopDQoNClRo
YW5rcywNCkxpDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVt
YmVkZGVkLWRldmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBbbWFpbHRvOm9w
ZW5lbWJlZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFs
ZiBPZg0KPiBLYW5nIEthaQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMjksIDIwMTUgMjozOCBQ
TQ0KPiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIXSBkcmFjdXQ6IHVwZ3JhZGUgMzggLT4gNDMN
Cj4gDQo+IEhpIFhpbiwNCj4gDQo+IEkgaGFkIHNlbnQgdGhlIHBhdGNoIHRvIHVwZ3JhZGUgZHJh
Y3V0IGFscmVhZHkuDQo+IA0KPiBUaGFua3MsDQo+IEthaQ0KPiANCj4gT24gMjAxNeW5tDA35pyI
Mjnml6UgMjI6MjgsIExpIHhpbiB3cm90ZToNCj4gPiBGcm9tOiB6aGFuZ3BhbnBhbiA8emhhbmdw
cC1mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWmhhbmcgUGFu
cGFuPHpoYW5ncHAtZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgIG1ldGEtaW5p
dHJhbWZzL3JlY2lwZXMtZGV2dG9vbHMvZHJhY3V0L2RyYWN1dF9naXQuYmIgfCA2ICsrKy0tLQ0K
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhLWluaXRyYW1mcy9yZWNpcGVzLWRldnRvb2xzL2RyYWN1
dC9kcmFjdXRfZ2l0LmJiDQo+IGIvbWV0YS1pbml0cmFtZnMvcmVjaXBlcy1kZXZ0b29scy9kcmFj
dXQvZHJhY3V0X2dpdC5iYg0KPiA+IGluZGV4IDc3YzEzN2MuLjY1YTU1MTUgMTAwNjQ0DQo+ID4g
LS0tIGEvbWV0YS1pbml0cmFtZnMvcmVjaXBlcy1kZXZ0b29scy9kcmFjdXQvZHJhY3V0X2dpdC5i
Yg0KPiA+ICsrKyBiL21ldGEtaW5pdHJhbWZzL3JlY2lwZXMtZGV2dG9vbHMvZHJhY3V0L2RyYWN1
dF9naXQuYmINCj4gPiBAQCAtNSwxMCArNSwxMCBAQCBMSUNFTlNFID0gIkdQTHYyIg0KPiA+ICAg
TElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNl
NDQ4NmE4MGZkYWY0YTQyNjMiDQo+ID4NCj4gPiAgIFBFID0gIjEiDQo+ID4gLVBWID0gIjAzOCIN
Cj4gPiArUFYgPSAiMDQzIg0KPiA+DQo+ID4gLSMgdjAzOCB0YWcNCj4gPiAtU1JDUkVWID0gIjI2
N2ExMDlhODE3MTVjODk1N2YxNDY1OTU5M2RlYjdiNjI1NWQ0MGUiDQo+ID4gKyMgdjA0MyB0YWcN
Cj4gPiArU1JDUkVWID0gImVhYjAzNTQwY2Q2OTVkOTQwMDYyYWY1YjU1YzAyZTg4MjlhYWE1MjYi
DQo+ID4gICBTUkNfVVJJID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vYm9vdC9kcmFj
dXQvZHJhY3V0LmdpdCINCj4gPg0KPiA+ICAgUyA9ICIke1dPUktESVJ9L2dpdCINCj4gDQo+IA0K
PiAtLQ0KPiBSZWdhcmRzLA0KPiBOZWlsIHwgS2FpIEthbmcNCj4gDQo+IC0tDQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1k
ZXZlbCBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuZW1iZWRkZWQtZGV2ZWwNCg==

