Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.11923.1597380447732430440
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 21:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: v3kveWsb2tStTxOyPW7oloIYNWuQNWhMUobFmX8/mx5FPrm0GAJ9mTFbufdzTQFN2hSKYi6afK
 i4c0efHq6X5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="142201796"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; 
   d="scan'208";a="142201796"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 21:47:22 -0700
IronPort-SDR: YRdHvI7aLZI8J2furKMljmtr94Sw190r1uaN6IGPVSGOkm1UKbIC/yV3w7WDzi+rzSxzXFFvwp
 QR+7JWjLVVsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,310,1592895600"; 
   d="scan'208";a="295649368"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by orsmga006.jf.intel.com with ESMTP; 13 Aug 2020 21:47:21 -0700
Received: from pgsmsx603.gar.corp.intel.com (10.108.199.138) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 14 Aug 2020 12:47:20 +0800
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 14 Aug 2020 12:47:20 +0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.186]) by
 PGSMSX104.gar.corp.intel.com ([169.254.3.42]) with mapi id 14.03.0439.000;
 Fri, 14 Aug 2020 12:47:20 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v2] ocl-icd: Upgrade to latest
Thread-Topic: [oe] [meta-oe][PATCH v2] ocl-icd: Upgrade to latest
Thread-Index: AQHWcH1Yk/VektO6qUysPxX/xjmza6k2ewKAgAAC4YCAAAcAAA==
Date: Fri, 14 Aug 2020 04:47:19 +0000
Message-ID: <af02ceb1c73fc4953dc03c33c777e390b8cfe1c1.camel@intel.com>
References: <20200812075055.3512737-1-raj.khem@gmail.com>
	 <e2199f620db08e5bd16d79b01f3c3df805676313.camel@intel.com>
	 <CAMKF1soNLXv0HEsAxonpJZzSSgMTCQu1h1_rP9BrQTgR0W76gg@mail.gmail.com>
In-Reply-To: <CAMKF1soNLXv0HEsAxonpJZzSSgMTCQu1h1_rP9BrQTgR0W76gg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.70.141]
MIME-Version: 1.0
Return-Path: anuj.mittal@intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <528FB46792ADF74E9823850D3EA049A3@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA4LTEzIGF0IDIxOjIyIC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
VGh1LCBBdWcgMTMsIDIwMjAgYXQgOToxMiBQTSBBbnVqIE1pdHRhbCA8YW51ai5taXR0YWxAaW50
ZWwuY29tPg0KPiB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjAtMDgtMTIgYXQgMDA6NTAgLTA3MDAs
IEtoZW0gUmFqIHdyb3RlOg0KPiA+ID4gTGljZW5zZS1VcGRhdGU6IFVwZGF0ZSBjb3B5cmlnaHRz
IFsxXQ0KPiA+ID4gDQo+ID4gPiBJbnN0YWxsIENML2NsX2ljZC5oIGFzIGl0cyBuZWVkZWQgYnkg
b3BlbmNsLWljZC1sb2FkZXINCj4gPiA+IA0KPiA+ID4gRG8gbm90IHByb3ZpZGUgbGliT3BlbkNM
LnNvIHRoZXNlIGFyZSBhbHJ3YWR5IHByb3ZpZGVkIGJ5IE9wZW5DTA0KPiA+ID4gMS4yDQo+ID4g
PiBJbnN0YWxsYWJsZSBDbGllbnQgRHJpdmVyDQo+ID4gDQo+ID4gQXJlbid0IGJvdGggb2YgdGhl
c2UgZGlmZmVyZW50IGltcGxlbWVudGF0aW9ucyBvZiBsaWJPcGVuQ0w/DQo+ID4gUHJvamVjdA0K
PiA+IGRlcGVuZGluZyBvbiBvY2wtaWNkIHNob3VsZG4ndCBuZWVkIHRvIGRlcGVuZCBvbiBvcGVu
Y2wtaWNkLWxvYWRlcg0KPiA+IEkNCj4gPiB0aGluay4NCj4gDQo+IHllcyB0aGV5IGFyZSBkaWZm
ZXJlbnQsIGZvciBtZXRhLW9lIGtocm9ub3MgaW1wbGVtZW50YXRpb24gaXMNCj4gZGVmYXVsdC4N
Cg0KSSBhbSBub3Qgc3VyZSB3aGF0IHRoYXQgbWVhbnMuIFNob3VsZG4ndCBjaG9vc2luZyB0aGUg
aW1wbGVtZW50YXRpb24gYmUNCmVpdGhlciBhIGRpc3RybyBvciBhIHBhY2thZ2UgZGVjaXNpb24/
DQoNCkl0IGxvb2tzIGxpa2UgdGhpcyB3YXMgZG9uZSBiZWNhdXNlIGEgREVQRU5EUyB3YXMgYWRk
ZWQgaW4gb3BlbmNsLWljZC0NCmxvYWRlciBvbiBvY2wtaWNkLiBUaGF0IERFUEVORFMgSSBiZWxp
ZXZlIGlzIGluY29ycmVjdCBhbmQgdGhpcyByZWNpcGUNCmRvZXMgbm90IG5lZWQgdG8gaW5zdGFs
bCB0aGF0IGhlYWRlciBhbmQgcmVtb3ZlIHRoZSBsaWJyYXJ5IC4uLg0KDQpUaGFua3MsDQoNCkFu
dWoNCg0KPiA+IFRoYW5rcywNCj4gPiANCj4gPiBBbnVqDQo+ID4gDQo+ID4gPiBbMV0NCj4gPiA+
IGh0dHBzOi8vZ2l0aHViLmNvbS9PQ0wtZGV2L29jbC1pY2QvY29tbWl0LzM5MjAyMDU3MzZhZmJi
Njc3MjllOWM3M2M3YjRjNmZkYjNmY2IzMjcjZGlmZi03MTE2ZWYwNzA1ODg1MzQzYzllMWIyMTcx
YTA2YmUwZQ0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiB2MjogRml4IGxpYnJhcnkgY29uZmxpY3RzIGFu
ZCBsaWNlbnNlIGNoZWNrc3Vtcw0KPiA+ID4gDQo+ID4gPiAgbWV0YS1vZS9yZWNpcGVzLWNvcmUv
b3BlbmNsL29jbC1pY2RfZ2l0LmJiIHwgMTAgKysrKysrKystLQ0KPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYg
LS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtY29yZS9vcGVuY2wvb2NsLWljZF9naXQuYmIgYi9tZXRh
LQ0KPiA+ID4gb2UvcmVjaXBlcy1jb3JlL29wZW5jbC9vY2wtaWNkX2dpdC5iYg0KPiA+ID4gaW5k
ZXggZDE0ZWM1M2UzZC4uYTY1Yzc2MThiOCAxMDA2NDQNCj4gPiA+IC0tLSBhL21ldGEtb2UvcmVj
aXBlcy1jb3JlL29wZW5jbC9vY2wtaWNkX2dpdC5iYg0KPiA+ID4gKysrIGIvbWV0YS1vZS9yZWNp
cGVzLWNvcmUvb3BlbmNsL29jbC1pY2RfZ2l0LmJiDQo+ID4gPiBAQCAtMywxMiArMywxMiBAQCBE
RVNDUklQVElPTiA9ICJPcGVuIFNvdXJjZSBhbHRlcm5hdGl2ZSB0bw0KPiA+ID4gdmVuZG9yDQo+
ID4gPiBzcGVjaWZpYyBPcGVuQ0wgSUNEIGxvYWRlcnMuIg0KPiA+ID4gDQo+ID4gPiAgIyBUaGUg
TElDRU5TRSBpcyBCU0QgMi1DbGF1c2UgIlNpbXBsaWZpZWQiIExpY2Vuc2UNCj4gPiA+ICBMSUNF
TlNFID0gIkJTRC0yLUNsYXVzZSINCj4gPiA+IC1MSUNfRklMRVNfQ0hLU1VNID0NCj4gPiA+ICJm
aWxlOi8vQ09QWUlORzttZDU9MjMyMjU3YmJmNzMyMDMyMDcyNWNhOTUyOWQzNzgyYWIiDQo+ID4g
PiArTElDX0ZJTEVTX0NIS1NVTSA9DQo+ID4gPiAiZmlsZTovL0NPUFlJTkc7bWQ1PTEyMzhkNWJj
Y2JiNmJkYTMwNjU0ZTQ4ZGNjMGE1NTRiIg0KPiA+ID4gDQo+ID4gPiAgU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL09DTC1kZXYvb2NsLWljZC5naXQ7cHJvdG9jb2w9aHR0cHMiDQo+ID4gPiAN
Cj4gPiA+ICBQViA9ICIyLjIuMTIrZ2l0JHtTUkNQVn0iDQo+ID4gPiAtU1JDUkVWID0gImFmNzlh
ZWJlNDY0OWYzMGRiZDcxMWMxYmY2ZmM2NjFlYWM2ZTVmMDEiDQo+ID4gPiArU1JDUkVWID0gImE5
ZTU3YjE5OWZmMWU4ZDAzZmEzZTVjNTNjNTU0NGRlM2RjNzJmZTYiDQo+ID4gPiANCj4gPiA+ICBT
ID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiA+ID4gDQo+ID4gPiBAQCAtMTYsNCArMTYsMTAgQEAgaW5o
ZXJpdCBhdXRvdG9vbHMNCj4gPiA+IA0KPiA+ID4gIERFUEVORFMgPSAicnVieS1uYXRpdmUiDQo+
ID4gPiANCj4gPiA+ICsNCj4gPiA+ICtkb19pbnN0YWxsX2FwcGVuZCgpIHsNCj4gPiA+ICsgICAg
aW5zdGFsbCAtRG0gMDY0NCAke1N9L2tocm9ub3MtaGVhZGVycy9DTC9jbF9pY2QuaA0KPiA+ID4g
JHtEfSR7aW5jbHVkZWRpcn0vQ0wvY2xfaWNkLmgNCj4gPiA+ICsgICAgcm0gLXJmICR7RH0ke2xp
YmRpcn0vbGliT3BlbkNMLnNvKg0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICBCQkNMQVNTRVhU
RU5EID0gIm5hdGl2ZSINCj4gPiA+IA0KPiA+IA0K
