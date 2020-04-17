Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.7268.1587120404796486993
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2020 03:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=jPSKHOv2;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=4134; q=dns/txt; s=axis-central1;
  t=1587120405; x=1618656405;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pKpt/OZ1zbaiAkSGrCVzuNZvWOi6w1pDVdJdcoeeoEc=;
  b=jPSKHOv2WXoQih+gRfWyg3KTvWNgNE/2pmjKU6ZnljffpTiGgqM/mi5Y
   zvx8efivm8ciDX4ZM6qHqbBwTLe208UtMprp6t+TnSnXUgoxIOztnOi23
   hLEQ2xFDVOLX1B2yMRgr+n3sCjhU1gJKyQZH0XB7e/BBxOGrnQF8gIpa6
   Vgt5eqXtPe4XabphIKuNSGeRDUe6+4YsTz7ZxBsBGk2MhA+cnaB44vGl5
   Erl1ADymalEyK0TC+LKXqtrKg1z3SYYoH0oBQo1HzzhunRLQew924CNlK
   Mepjuah1JBwLC/Llu202bBu9WWBrLosXegVWQQg8mvgtPSh0jZDr4mU5W
   A==;
IronPort-SDR: lht0Wjq+W921KCj8DdPAeRhCPSNMkFMXjve51k5pMBruYwiYXxS72CQe6W8pJ/ree9wWto53ko
 sGc+oES7FdUjj/CXpOuwxh8LOrn2lADgiF0AFrvPPICkOCz9DADDVobgVaiR0A4+QidoHDVVEs
 IXuZWDWiQHyjxBTWIw6e+VJBc3mrBonyO7QKUk4Oeux2T24TmcA2Y5vWtR/tsbH70pSI5iXSYg
 mSAC3qJ+0tpMmqaX775Yzcc0RNW5o2C9KQs6cwCmBQHChUj6oLOKme1dUbslkFFB64gvt/mUf6
 FHI=
X-IronPort-AV: E=Sophos;i="5.72,394,1580770800"; 
   d="scan'208";a="7740891"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, Trevor Gamblin
	<trevor.gamblin@windriver.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 -> 2.4.43
Thread-Topic: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 -> 2.4.43
Thread-Index: AQHWEpXYxKygSqEqHUC20YBFrX3QUKh5FBWAgAAZiACAAZ2lkIAA0ceAgAApWoCAAVvNAA==
Date: Fri, 17 Apr 2020 10:46:41 +0000
Message-ID: <54a3fe458efc404d99acae09c7492aa0@XBOX03.axis.com>
References: <20200414194933.31798-1-trevor.gamblin@windriver.com>
 <CAMKF1sps=ihwMcTFkSBTSdtZDbGEfotpjbje9hhdaAkv=g4X9w@mail.gmail.com>
 <695157d6-c8d1-dca0-df48-cd5d233da330@windriver.com>
 <07865a3bea714ee88fb74d336ab10831@XBOX03.axis.com>
 <3a8a31f8-893a-0fc9-505c-f3bc389d0b31@windriver.com>
 <CAMKF1spSh1aZGfaEkfeqFS5ERPwbTgksJ83ZQ0wtf9D=HbNDug@mail.gmail.com>
In-Reply-To: <CAMKF1spSh1aZGfaEkfeqFS5ERPwbTgksJ83ZQ0wtf9D=HbNDug@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBkZW4gMTYgYXByaWwgMjAyMCAxNzo0OQ0KPiBUbzogVHJldm9y
IEdhbWJsaW4gPHRyZXZvci5nYW1ibGluQHdpbmRyaXZlci5jb20+DQo+IENjOiBQZXRlciBLamVs
bGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT47IG9wZW5lbWJlZGVkLWRldmVs
DQo+IDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gU3ViamVj
dDogUmU6IFtvZV0gW21ldGEtd2Vic2VydmVyXVtQQVRDSF0gYXBhY2hlMjogdXBncmFkZSAyLjQu
NDEgLT4NCj4gMi40LjQzDQo+IA0KPiBPbiBUaHUsIEFwciAxNiwgMjAyMCBhdCA2OjIxIEFNIFRy
ZXZvciBHYW1ibGluDQo+IDx0cmV2b3IuZ2FtYmxpbkB3aW5kcml2ZXIuY29tPiB3cm90ZToNCj4g
Pg0KPiA+IE9uIDQvMTUvMjAgNzowMiBQTSwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+
ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPj4gRnJvbTogb3BlbmVtYmVkZGVk
LWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gPiA+PiBkZXZl
bEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgVHJldm9yIEdhbWJsaW4NCj4g
PiA+PiBTZW50OiBkZW4gMTUgYXByaWwgMjAyMCAwMjoxMA0KPiA+ID4+IFRvOiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPg0KPiA+ID4+IENjOiBvcGVuZW1iZWRlZC1kZXZlbCA8b3BlbmVt
YmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+ID4gPj4gU3ViamVjdDogUmU6
IFtvZV0gW21ldGEtd2Vic2VydmVyXVtQQVRDSF0gYXBhY2hlMjogdXBncmFkZSAyLjQuNDEgLT4N
Cj4gPiA+PiAyLjQuNDMNCj4gPiA+Pg0KPiA+ID4+IE9uIDQvMTQvMjAgNjozOCBQTSwgS2hlbSBS
YWogd3JvdGU6DQo+ID4gPj4+IGFwYWNoZS13ZWJzb2NrZXRzIGRvZXMgbm90IGxpa2UgaXQNCj4g
PiA+Pj4NCj4gPiA+Pj4gaHR0cHM6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0
YWlscy80MDM3NzEvDQo+ID4gPj4NCj4gPiA+PiBUaGFua3MsIHdpbGwgdGFrZSBhIGxvb2sgYXQg
aXQgYW5kIHJlLXNlbmQuDQo+ID4gPg0KPiA+ID4gSXQgYXBwZWFycyB0aGV5IGhhdmUgYWRkZWQg
Y3Jvc3MgY29tcGlsYXRpb24gc3VwcG9ydCB0byBhcHhzLCBidXQNCj4gPiA+IGl0IGNsYXNoZXMg
d2l0aCB0aGUgY2hhbmdlcyBkb25lIGluIE9FIHRvIG1ha2UgaXQgc3VwcG9ydCBjcm9zcw0KPiA+
ID4gY29tcGlsYXRpb24uIEkgdHJpZWQgdG8gc29sdmUgaXQgYnkgYmFzaWNhbGx5IHJlbW92aW5n
IHRoZSBPRQ0KPiA+ID4gY2hhbmdlcywgYnV0IGl0IHdhcyBub3QgYXMgc2ltcGxlIGFzIHRoYXQu
IEluIHRoZSBlbmQgd2Ugd29ya2VkDQo+ID4gPiBhcm91bmQgaXQgd2l0aCB0aGlzIHF1aWNrIGZp
eDoNCj4gPiA+DQo+ID4gPiBhcGFjaGVfc3lzcm9vdF9wcmVwcm9jZXNzX2FwcGVuZCgpIHsNCj4g
PiA+ICAgICAgICAgICMgRGlzYWJsZSBhcHhzJyBidWlsdCBpbiBjcm9zcyBjb21waWxhdGlvbiBz
dXBwb3J0IGFuZCByZWx5IG9uIHdoYXQgdGhlDQo+ID4gPiAgICAgICAgICAjIHJlY2lwZSBzZXRz
IHVwLg0KPiA+ID4gICAgICAgICAgc2VkIC1pICdzISRkZXN0ZGlyID0gLiohJGRlc3RkaXIgPSAi
IjshJyAke1NZU1JPT1RfREVTVERJUn0ke2JpbmRpcl9jcm9zc3NjcmlwdHN9L2FweHMNCj4gPiA+
IH0NCj4gPiA+DQo+ID4gPiBIb3dldmVyLCBJIGhvcGUgeW91IGNhbiBjb21lIHVwIHdpdGggYSBi
ZXR0ZXIgc29sdXRpb24gdGhhdA0KPiA+ID4gYWN0dWFsbHkgbWFrZXMgdXNlIG9mIHdoYXQgdGhl
eSBkaWQgdXBzdHJlYW0gYW5kIHRodXMgbGVzc2VuDQo+ID4gPiB0aGUgY2hhbmdlcyB0aGF0IGhh
dmUgdG8gYmUgYXBwbGllZCBieSBPRS4NCj4gPg0KPiA+IEhpIFBldGVyLA0KPiA+DQo+ID4gSXJv
bmljYWxseSBJJ20gc2VlaW5nIHlvdXIgZW1haWwganVzdCBhcyBJIHN1Ym1pdCBhIHYyIHJldmVy
dGluZyB0aGVpcg0KPiA+IGNyb3NzLWNvbXBpbGF0aW9uIGNoYW5nZXMuIEkgd2Fzbid0IGFibGUg
dG8gZmluZCBhIGJldHRlciB3b3JrYXJvdW5kDQo+ID4gdGhhbiBqdXN0IHJldmVydGluZyB0aGUg
ZGVzdGRpciBzdHVmZiB0aGF0IHRoZXkgYWRkZWQsIGJ1dCBJIGRpZCBpdCB2aWENCj4gPiBhIHBh
dGNoIGZpbGUgaW5zdGVhZCBvZiB3aXRoaW4gdGhlIHJlY2lwZSBpdHNlbGYuIEkgZG8gbGlrZSB5
b3VyDQo+ID4gYXBwcm9hY2ggYmV0dGVyIHRob3VnaCwgYXMgaXQgYXZvaWRzIGFkZGluZyBhIHBh
dGNoIGZpbGUgdGhhdCdsbCBoYXZlDQo+ID4gdG8gYmUgbWFpbnRhaW5lZC4gRG8geW91IHdhbnQg
dG8gc3VibWl0IHlvdXIgZml4IGluIGxpZXUgb2YgbWluZT8NCj4gDQo+IHllYWggSSB0aGluayBy
ZXZlcnQgaXMgbGFzdCByZXNvcnQuIFNvIGxldHMgc2VlIGlmIHdlIGNhbiBmaXggaXQNCg0KV2Vs
bCwgbXkgc29sdXRpb24ganVzdCBkaXNhYmxlcyB0aGUgdXBzdHJlYW0gY2hhbmdlLCBzbyBpdCBk
b2Vzbid0IA0KcmVhbGx5IG1ha2UgdXNlIG9mIGl0LiBJIHRoaW5rIGEgcGF0Y2ggaXMgYmV0dGVy
IHRoYW4gdGhlIHF1aWNrIHNlZCANCmZpeCBJIGRpZCBzaW5jZSBpdCBtZWFucyB0aGVyZSBpcyBj
b250ZXh0IHRvIHRoZSBjaGFuZ2UuIEhvd2V2ZXIsIA0KeW91IGRvbid0IG5lZWQgdG8gcmV2ZXJ0
IGFsbCBvZiB0aGUgdXBzdHJlYW0gY2hhbmdlLiBKdXN0IGNvbW1lbnRpbmcgDQpvdXQgdGhlc2Ug
bGluZXMgd291bGQgZG86DQoNCm15ICRkZGkgPSByaW5kZXgoJDAsICJAZXhwX2JpbmRpckAiKTsN
CmlmICgkZGRpID49IDApIHsNCiAgJGRlc3RkaXIgPSBzdWJzdHIoJDAsIDAsICRkZGkpOw0KfQ0K
DQpUaGF0IHNob3VsZCBpbXByb3ZlIHRoZSBjaGFuY2Ugb2YgdGhlIHBhdGNoIGNvbnRpbnVpbmcg
dG8gYXBwbHkgZm9yIA0KZnV0dXJlIHZlcnNpb25zIG9mIGFwYWNoZS4NCg0KLy9QZXRlcg0KDQo=
