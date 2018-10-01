Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6C0A7949D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Oct 2018 10:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1A67318136;
	Mon,  1 Oct 2018 12:26:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id z52PG5zB396t; Mon,  1 Oct 2018 12:26:43 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1049E18242;
	Mon,  1 Oct 2018 12:26:43 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE9AF1E0AA;
	Mon,  1 Oct 2018 12:26:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2D5C1E0A9;
	Mon,  1 Oct 2018 12:26:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon,  1 Oct 2018 12:26:42 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id D6B642527;
	Mon,  1 Oct 2018 12:26:42 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 1 Oct 2018 12:26:42 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 1 Oct 2018 12:26:42 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 1 Oct 2018 12:26:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>, "S. Lockwood-Childs"
	<sjl@vctlabs.com>, Khem Raj <raj.khem@gmail.com>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] libldb: add pam to
	REQUIRED_DISTRO_FEATURES
Thread-Index: AQHUV8hvrnrfSJTeL0GEOY5SlkE2mqUKMHcA
Date: Mon, 1 Oct 2018 10:26:42 +0000
Message-ID: <8d3122b1673b4d07979f67b179ce707c@XBOX02.axis.com>
References: <20180927140251.4556-1-Martin.Jansa@gmail.com>
	<20180928201454.GW594@vctlabs.com>
	<CAMKF1srXgYGFi6_Qc8sUQaK4sNR0fqpq150oeivxRocN53Rw+A@mail.gmail.com>
	<20180928210816.GX594@vctlabs.com>
	<CA+chaQdG9vsvs11RGrsCEnS07H-X9+DS8wf5fixJasWdZvC+yA@mail.gmail.com>
In-Reply-To: <CA+chaQdG9vsvs11RGrsCEnS07H-X9+DS8wf5fixJasWdZvC+yA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-networking][PATCH] libldb: add pam to	REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 01 Oct 2018 10:26:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T2ssIHNvIGFmdGVyIHJlYWRpbmcgdGhlIHRocmVhZCBtZW50aW9uZWQgYmVsb3csIHRoZSBhY3R1
YWwgcHJvYmxlbQ0Kc2VlbXMgdG8gYmUgdGhhdCBpZiBsaWJwYW0gaGFzICBiZWVuIGJ1aWx0IChl
LmcuLCBiZWNhdXNlIHBhbSBpcyANCmluY2x1ZGVkIGluIERJU1RST19GRUFUVVJFUyksIHRoZW4g
c2FtYmEgd2lsbCBsaW5rIHdpdGggaXQgZXZlbiBpZiANCi0td2l0aG91dC1wYW0gaXMgc3BlY2lm
aWVkPyBUaGlzIHNlZW1zIGxpa2Ugc29tZXRoaW5nIHRoYXQgY2FuIGJlIA0KZml4ZWQuIEJlY2F1
c2Ugd2hlbiBidWlsZGluZyB3aXRob3V0IHBhbSBpbiBESVNUUk9fRkVBVFVSRVMgKGFzIHdlIA0K
ZG8pLCB0aGVuIGl0IGRvZXMgbm90IHNlZW0gdG8gYmUgYSBwcm9ibGVtIHRvIGJ1aWxkIHNhbWJh
IHdpdGggDQotLXdpdGhvdXQtcGFtIGFuZCBoYXZpbmcgaXQgd29yayBhcyBleHBlY3RlZC4gSW4g
b3VyIGNhc2UsIHRoZSANClJFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICJwYW0iIGluIHRoZSBz
YW1iYSByZWNpcGUgaXMgbW9yZSBvZiBhIA0KcHJvYmxlbS4uLg0KDQovL1BldGVyDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRldmVsLWJvdW5j
ZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbC1ib3VuY2Vz
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBNYXJ0aW4gSmFuc2ENCj4gU2Vu
dDogZGVuIDI5IHNlcHRlbWJlciAyMDE4IDA5OjQ1DQo+IFRvOiBTLiBMb2Nrd29vZC1DaGlsZHMg
PHNqbEB2Y3RsYWJzLmNvbT47IEtoZW0gUmFqDQo+IDxyYWoua2hlbUBnbWFpbC5jb20+OyBvcGVu
ZW1iZWRkZWQtZGV2ZWwgPG9wZW5lbWJlZGRlZC0NCj4gZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4NCj4gU3ViamVjdDogUmU6IFtvZV0gW21ldGEtbmV0d29ya2luZ11bUEFUQ0hdIGxpYmxk
YjogYWRkIHBhbSB0bw0KPiBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMNCj4gDQo+IEl0IGRlcGVu
ZHMgb24gcGFtIERJU1RST19GRUFUVVJFUywgYmVjYXVzZSBpdCBkZXBlbmRzIG9uIGxpYnBhbSBz
aW5jZToNCj4gY29tbWl0IGE5NTcyNmRmNGJiMWM4OThkYTdlNGQ0ZGJmOWUyODQ2OTE0MDYxZTQN
Cj4gQXV0aG9yOiBBbmRyZWFzIE3DvGxsZXIgPHNjaG5pdHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+
DQo+IERhdGU6ICAgU2F0IFNlcCAxNyAxMjowNDo0MiAyMDE2ICswMjAwDQo+IA0KPiAgICAgc2Ft
YmE6IHJlcGxhY2UgcGFtIHBhY2thZ2Vjb25maWcgYnkgaGFyZCBkZXBlbmRlbmN5DQo+IA0KPiAg
ICAgc2FtYmEgbGlua3MgYWdhaW5zdCBsaWJwYW0gZXZlbiBpZiBwYW0gaXMgbm90IGluIHBhY2th
Z2Vjb25maWcgYW5kDQo+IGxpYnBhbSB3YXMNCj4gICAgIGJ1aWx0IGJlZm9yZS4gVGhpcyBwYXRj
aCBhdm9pZCB0aGlzIGZsb2F0aW5nIGRlcGVuZGVuY3kgLSBvdGhlcg0KPiBzb2x1dGlvbiBjb3Vs
ZA0KPiAgICAgbm90IGJlIGZvdW5kLiBGb3IgdGhvc2Ugd2hvIHdhbnQgcGFja2FnZWNvbmZpZyBi
YWNrLCBzZWUgZGlzY3Vzc2lvbg0KPiBpYXQNCj4gWzFdIGZvcg0KPiAgICAgZnVydGhlciBpbnNw
aXJhdGlvbi4NCj4gDQo+ICAgICBbMV0NCj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
cGlwZXJtYWlsL29wZW5lbWJlZGRlZC1kZXZlbC8yMDE2LQ0KPiBTZXB0ZW1iZXIvMTA5MTQzLmh0
bWwNCj4gDQo+ICAgICBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE3DvGxsZXIgPHNjaG5pdHplbHRv
bnlAZ29vZ2xlbWFpbC5jb20+DQo+ICAgICBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSmFuc2EgPE1h
cnRpbi5KYW5zYUBnbWFpbC5jb20+DQo+ICAgICBTaWduZWQtb2ZmLWJ5OiBKb2UgTWFjRG9uYWxk
IDxqb2VfbWFjZG9uYWxkQG1lbnRvci5jb20+DQo+IA0KPiANCj4gT24gRnJpLCBTZXAgMjgsIDIw
MTggYXQgMTE6MDQgUE0gUy4gTG9ja3dvb2QtQ2hpbGRzIDxzamxAdmN0bGFicy5jb20+DQo+IHdy
b3RlOg0KPiANCj4gPiBPbiBGcmksIFNlcCAyOCwgMjAxOCBhdCAwMToyMzoyNVBNIC0wNzAwLCBL
aGVtIFJhaiB3cm90ZToNCj4gPiA+IE9uIEZyaSwgU2VwIDI4LCAyMDE4IGF0IDE6MTkgUE0gUy4g
TG9ja3dvb2QtQ2hpbGRzDQo+IDxzamxAdmN0bGFicy5jb20+DQo+ID4gd3JvdGU6DQo+ID4gPiA+
DQo+ID4gPiA+IENvdWxkIHlvdSBleHBsYWluIGNvbW1pdCAwZGI5Njk3ZGM2YjhjIGEgbGl0dGxl
IGJpdCwgd2hlcmUgbGlicGFtDQo+ID4gYmVjYW1lIGENCj4gPiA+ID4gZGlzdHJvIHJlcXVpcmVt
ZW50IGZvciBzYW1iYSBpdHNlbGY/IEknbSBub3Qgc3VyZSB3aHkgcGFtIGlzIGENCj4gaGFyZA0K
PiA+ID4gPiByZXF1aXJlbWVudCwgcmF0aGVyIHRoYW4gYmVpbmcgUEFDS0FHRUNPTkZJRyBvcHRp
b24uIEkgaGF2ZW4ndA0KPiB0cmllZA0KPiA+IHRoZSBzZXJ2ZXINCj4gPiA+ID4gaXBrIGJ1aWx0
IHdpdGggLS13aXRob3V0LXBhbSBidXQgdGhlIGNsaWVudC1zaWRlIHBpZWNlcyBhcmUNCj4gY2Vy
dGFpbmx5DQo+ID4gdXNlZnVsLg0KPiA+ID4gPiBJJ3ZlIGdvdCBhIGJiYXBwZW5kIHRvIG92ZXJy
aWRlIHRoZSBwYW0gZm9yY2luZywgYW5kIHdhcyBqdXN0DQo+ID4gd29uZGVyaW5nIGlmDQo+ID4g
PiA+IHRoaXMgY2hhbmdlIG1pZ2h0IGJlIHVwc3RyZWFtYWJsZS4NCj4gPiA+DQo+ID4gPiBpdHMg
bGFjayBvZiBmaW5lIGdyYWluZWQgcGFja2FnaW5nIHRoYXQgdGhpcyB3YXMgbmVlZGVkLiBJZiB5
b3UgY2FuDQo+ID4gPiBzb3J0IHRoaXMgb3V0IHRoZW4gSSBhbSBhbGwgZWFycw0KPiA+DQo+ID4g
V2hhdCBhcmUgdGhlIHBhY2thZ2luZyBwcm9ibGVtcyB0byBiZSBzb2x2ZWQgd2hlbiBwYW0gc3Vw
cG9ydCBpcw0KPiBkaXNhYmxlZD8NCj4gPg0KPiA+IExpa2UgSSBzYWlkIHdlJ3JlIG9ubHkgcnVu
bmluZyB0aGUgY2xpZW50LXNpZGUgc3R1ZmYgc28gZmFyLCBzbyBJJ20NCj4gPiBndWVzc2luZw0K
PiA+IHRoZSBwcm9ibGVtcyBjYW1lIHVwIGluIHNlcnZlci1zaWRlIHBhY2thZ2VzLiBUaGVyZSB3
ZXJlIG5vIGJ1aWxkDQo+IGVycm9ycw0KPiA+IGZyb20NCj4gPiAtLXdpdGhvdXQtcGFtIGF0IGxl
YXN0Lg0KPiA+DQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBPbiBUaHUsIFNlcCAyNywgMjAxOCBh
dCAwMjowMjo1MVBNICswMDAwLCBNYXJ0aW4gSmFuc2Egd3JvdGU6DQo+ID4gPiA+ID4gKiBkZXBl
bmRlbmN5IG9uIHNhbWJhIHdhcyBhZGRlZCByZWNlbnRseSBpbjoNCj4gPiA+ID4gPiAgIGxpYmxk
YjogQWRkIHNhbWJhIHRvIHJkZXBzIGZvciBweWxkYg0KPiA+ID4gPiA+ICAgc28gbm93IHdlIG5l
ZWQgdG8gbWF0Y2ggc2FtYmEgcmVzdHJpY3Rpb24gdG8gcHJldmVudDoNCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IEVSUk9SOiBOb3RoaW5nIFJQUk9WSURFUyAnc2FtYmEnIChidXQNCj4gPiBtZXRhLW9l
L21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvbGlibGRiL2xpYmxkYl8xLjQuMS5iYg0K
PiBSREVQRU5EUw0KPiA+IG9uIG9yIG90aGVyd2lzZSByZXF1aXJlcyBpdCkNCj4gPiA+ID4gPiBz
YW1iYSB3YXMgc2tpcHBlZDogbWlzc2luZyByZXF1aXJlZCBkaXN0cm8gZmVhdHVyZSAncGFtJyAo
bm90DQo+IGluDQo+ID4gRElTVFJPX0ZFQVRVUkVTKQ0KPiA+ID4gPiA+IE5PVEU6IFJ1bnRpbWUg
dGFyZ2V0ICdzYW1iYScgaXMgdW5idWlsZGFibGUsIHJlbW92aW5nLi4uDQo+ID4gPiA+ID4gTWlz
c2luZyBvciB1bmJ1aWxkYWJsZSBkZXBlbmRlbmN5IGNoYWluIHdhczogWydzYW1iYSddDQo+ID4g
PiA+ID4gRVJST1I6IFJlcXVpcmVkIGJ1aWxkIHRhcmdldCAnbWV0YS13b3JsZC1wa2dkYXRhJyBo
YXMgbm8NCj4gYnVpbGRhYmxlDQo+ID4gcHJvdmlkZXJzLg0KPiA+ID4gPiA+IE1pc3Npbmcgb3Ig
dW5idWlsZGFibGUgZGVwZW5kZW5jeSBjaGFpbiB3YXM6IFsnbWV0YS13b3JsZC0NCj4gcGtnZGF0
YScsDQo+ID4gJ2xpYmxkYicsICdzYW1iYSddDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBNYXJ0aW4gSmFuc2EgPE1hcnRpbi5KYW5zYUBnbWFpbC5jb20+DQo+ID4gPiA+ID4g
LS0tDQo+ID4gPiA+ID4gIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvbGlibGRiL2xp
YmxkYl8xLjQuMS5iYiB8IDMgKystDQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IGRpZmYgLS1naXQg
YS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy0NCj4gc3VwcG9ydC9saWJsZGIvbGlibGRiXzEuNC4x
LmJiDQo+ID4gYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2xpYmxkYi9saWJsZGJf
MS40LjEuYmINCj4gPiA+ID4gPiBpbmRleCA5OWU2MmY2NmJiLi4zYzdlNTQ1NWU5IDEwMDY0NA0K
PiA+ID4gPiA+IC0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvbGlibGRiL2xp
YmxkYl8xLjQuMS5iYg0KPiA+ID4gPiA+ICsrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1
cHBvcnQvbGlibGRiL2xpYmxkYl8xLjQuMS5iYg0KPiA+ID4gPiA+IEBAIC0zNSw3ICszNSw4IEBA
IExJQ19GSUxFU19DSEtTVU0gPQ0KPiA+ICJmaWxlOi8vcHlsZGIuaDtlbmRsaW5lPTI0O21kNT1k
ZmJkMjM4Y2VjYWQ3Njk1N2Y3Zjg2MGZiZTlhZGENCj4gPiA+ID4gPiAgU1JDX1VSSVttZDVzdW1d
ID0gIjE1OWExYjFhNTZkY2NjZjQxMGQxYmJhOTExYmU2MDc2Ig0KPiA+ID4gPiA+ICBTUkNfVVJJ
W3NoYTI1NnN1bV0gPQ0KPiA+ICIyZGYxM2FhMjViMzc2YjMxNGNlMjQxODJjMzc2OTE5NTkwMTk1
MjNkZTNjYzUzNTZjNDBjMWEzMzNiMDg5MGEyIg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gLWluaGVy
aXQgd2FmLXNhbWJhDQo+ID4gPiA+ID4gK2luaGVyaXQgd2FmLXNhbWJhIGRpc3Ryb19mZWF0dXJl
c19jaGVjaw0KPiA+ID4gPiA+ICtSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAicGFtIg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gIFMgPSAiJHtXT1JLRElSfS9sZGItJHtQVn0iDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+IDIuMTcuMQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gLS0N
Cj4gPiA+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiA+ID4gPiA+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gPiA+ID4gPiBP
cGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gPiA+IGh0dHA6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLQ0K
PiBkZXZlbA0KPiA+ID4gPiAtLQ0KPiA+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPiA+ID4gPiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBs
aXN0DQo+ID4gPiA+IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
ID4gPiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bmVtYmVkZGVkLWRldmVsDQo+ID4NCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdA0K
PiBPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBodHRwOi8vbGlz
dHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0K

