Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 971706C455
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jan 2019 10:17:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x09AHDlG028839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jan 2019 02:17:13 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.249]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0415.000;
	Wed, 9 Jan 2019 02:17:12 -0800
From: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] pmdk: fix install error
Thread-Index: AQHUp+NdqedK10XUdkWS1jyEzHU+hqWnPC6A//98DbA=
Date: Wed, 9 Jan 2019 10:17:12 +0000
Message-ID: <597B109EC20B76429F71A8A97770610D129ED63A@ALA-MBD.corp.ad.wrs.com>
References: <20190109061610.34471-1-yongxin.liu@windriver.com>
	<CAMKF1sqOE7M7boiRNyqjtNXJxECv5bZyD2SG9MXNOwet+8ZJdw@mail.gmail.com>
In-Reply-To: <CAMKF1sqOE7M7boiRNyqjtNXJxECv5bZyD2SG9MXNOwet+8ZJdw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.171]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] pmdk: fix install error
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
X-List-Received-Date: Wed, 09 Jan 2019 10:17:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiBbbWFpbHRvOnJh
ai5raGVtQGdtYWlsLmNvbV0NCj4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDksIDIwMTkgMTg6
MDYNCj4gVG86IExpdSwgWW9uZ3hpbg0KPiBDYzogb3BlbmVtYmVkZWQtZGV2ZWwNCj4gU3ViamVj
dDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIXSBwbWRrOiBmaXggaW5zdGFsbCBlcnJvcg0KPiAN
Cj4gT24gVHVlLCBKYW4gOCwgMjAxOSBhdCAxMDoyMCBQTSBZb25neGluIExpdSA8eW9uZ3hpbi5s
aXVAd2luZHJpdmVyLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiAuc28gZmlsZXMgYXJlIG5vdCBn
ZW5lcmF0ZWQgaW4gdXNyL2xvY2FsL2xpYi8gYnV0IGluIHVzci9sb2NhbC9saWI2NC4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFlvbmd4aW4gTGl1IDx5b25neGluLmxpdUB3aW5kcml2ZXIuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBtZXRhLW9lL3JlY2lwZXMtZXh0ZW5kZWQvcG1kay9wbWRrXzEuNC4y
LmJiIHwgNCArKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVk
L3BtZGsvcG1ka18xLjQuMi5iYiBiL21ldGEtDQo+IG9lL3JlY2lwZXMtZXh0ZW5kZWQvcG1kay9w
bWRrXzEuNC4yLmJiDQo+ID4gaW5kZXggM2RhMjJhOTcwLi5hZjIyMjlmMWMgMTAwNjQ0DQo+ID4g
LS0tIGEvbWV0YS1vZS9yZWNpcGVzLWV4dGVuZGVkL3BtZGsvcG1ka18xLjQuMi5iYg0KPiA+ICsr
KyBiL21ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9wbWRrL3BtZGtfMS40LjIuYmINCj4gPiBAQCAt
NDMsMTAgKzQzLDEwIEBAIGRvX2luc3RhbGwoKSB7DQo+ID4gICAgICAgICBtdiAke0R9L3Vzci9s
b2NhbC9iaW4vZGF4aW8gJHtEfSR7YmluZGlyfS8NCj4gPg0KPiA+ICAgICAgICAgaW5zdGFsbCAt
ZCAke0R9JHtsaWJkaXJ9DQo+ID4gLSAgICAgICBtdiAke0R9L3Vzci9sb2NhbC9saWIvKnNvKiAk
e0R9JHtsaWJkaXJ9Lw0KPiA+ICsgICAgICAgbXYgJHtEfS91c3IvbG9jYWwvbGliNjQvKnNvKiAk
e0R9JHtsaWJkaXJ9Lw0KPiA+DQo+IA0KPiBJIHdvbmRlciBpZiB0aGlzIHNob3VsZCBiZSB1c2lu
ZyAvdXNyL2xvY2FsLyR7YmFzZV9saWJkaXJ9IGhlcmUNCg0KU2luY2UgJHtiYXNlX2xpYmRpcn0g
aXMgIi9saWI2NCIsIHNob3VsZCB3ZSB1c2UgIi91c3IvbG9jYWwke2Jhc2VfbGliZGlyfSIgPw0K
T3IgaXQgaXMgZmluZSB0byBnbyB3aXRoICIvdXNyL2xvY2FsLy9saWI2NCIgYWZ0ZXIgcGFyc2lu
Zz8NCg0KDQpUaGFua3MsDQpZb25neGluDQoNCj4gPiAgICAgICAgIGluc3RhbGwgLWQgJHtEfSR7
bGliZGlyfS9wa2djb25maWcNCj4gPiAtICAgICAgIG12ICR7RH0vdXNyL2xvY2FsL2xpYi9wa2dj
b25maWcvKi5wYyAke0R9JHtsaWJkaXJ9L3BrZ2NvbmZpZy8NCj4gPiArICAgICAgIG12ICR7RH0v
dXNyL2xvY2FsL2xpYjY0L3BrZ2NvbmZpZy8qLnBjICR7RH0ke2xpYmRpcn0vcGtnY29uZmlnLw0K
PiA+DQo+ID4gICAgICAgICBpbnN0YWxsIC1kICR7RH0ke2luY2x1ZGVkaXJ9DQo+ID4gICAgICAg
ICBtdiAke0R9L3Vzci9sb2NhbC9pbmNsdWRlLyogJHtEfSR7aW5jbHVkZWRpcn0vDQo+ID4gLS0N
Cj4gPiAyLjE0LjQNCj4gPg0KPiA+IC0tDQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gPiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0
DQo+ID4gT3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBodHRw
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1k
ZXZlbA0K

