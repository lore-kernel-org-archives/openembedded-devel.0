Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 654FF7F2A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 01:27:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7G1R1Pv020893
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 18:27:01 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.10]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0468.000;
	Thu, 15 Aug 2019 18:27:00 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][V2][PATCH 1/1] php: zlib and zip support
Thread-Index: AQHVU7AoUwUqG37LNEGopzRTGL6ouKb9SHMA//+vbjA=
Date: Fri, 16 Aug 2019 01:26:59 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84FA881765@ALA-MBD.corp.ad.wrs.com>
References: <20190815212652.207154-1-joe.slater@windriver.com>
	<966ec52b-04f0-877e-dbad-6a0ff5627a05@windriver.com>
In-Reply-To: <966ec52b-04f0-877e-dbad-6a0ff5627a05@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.118.107]
MIME-Version: 1.0
Subject: Re: [meta-oe][V2][PATCH 1/1] php: zlib and zip support
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
X-List-Received-Date: Fri, 16 Aug 2019 01:27:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB0aGluayB0aGUgY3VycmVudCBjb25maWcgZG9lcyBub3QgZW5hYmxlIGVpdGhlciB6bGliIG9y
IHppcC4gIEl0IGRlZmluZXMgLS13aXRoLWxpYnppcCwgYnV0IGRvZXMgbm90IGVuYWJsZSBpdCB3
aXRoIC0tZW5hYmxlLXppcC4gIEl0IGFsc28gZG9lcyBub3QgZGVmaW5lIC0td2l0aC16bGliLCBz
byB3ZSBsb3NlIHRoYXQuDQoNClRoZSBvcmlnaW5hbCBjb25jZXJuIHdhcyB0aGF0IHBob3Jvbml4
LXRlc3Qtc3VpdGUgd291bGQgcHV0IG91dCBhIG1lc3NhZ2UgYXQgcnVudGltZSB0aGF0IGl0IG5l
ZWRlZCBwaHAgemlwLiAgSSB0aGluayB0aGlzIG1lc3NhZ2UgaXMgd3JvbmcgYW5kIGFsbCBpdCBu
ZWVkcyBpcyB6bGliLiAgU28sIEkgZGVjaWRlZCB0byBicmluZyBib3RoIGJhY2sgYnV0IG5vdCBl
bmFibGUgemlwIGJlY2F1c2UgaXQgbmVlZHMgYW4gZXh0cmEgcGFja2FnZS4gIFRoZSAib2xkIiB3
YXkgb2Ygc3VwcG9ydGluZyBwaHAgemlwIHVzZWQgYSBidW5kbGVkIGxpYnJhcnkuICBUaGF0IHdh
eSBoYXMgYmVlbiBkZXByZWNhdGVkLCBzbyBpZiB3ZSB3YW50IHppcCwgd2UgbmVlZCBsaWJ6aXAu
DQoNClRoaXMgcGF0Y2ggaXMgYWltZWQgYXQgaGVscGluZyBwaG9yb25peC10ZXN0LXN1aXRlIGFu
ZCBlYXNpbmcgcGhwIHppcCBzdXBwb3J0IHNob3VsZCBzb21lb25lIGRlc2lyZSB0byBhZGQgdGhh
dCB2aWEgUEFDS0FHRUNPTkZJRy4gIEkgd291bGQgYmUgaGFwcHkgdG8gcHV0IHppcCBpbnRvIHRo
ZSBkZWZhdWx0IGNvbmZpZywgYnV0IHdobyByZWFsbHkgbmVlZHMgaXQ/DQoNCkpvZQ0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTWFjTGVvZCwgUmFuZHkgPFJhbmR5Lk1hY0xl
b2RAd2luZHJpdmVyLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgQXVndXN0IDE1LCAyMDE5IDQ6MDEg
UE0NClRvOiBTbGF0ZXIsIEpvc2VwaCA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPjsgb3BlbmVt
YmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbbWV0YS1v
ZV1bVjJdW1BBVENIIDEvMV0gcGhwOiB6bGliIGFuZCB6aXAgc3VwcG9ydA0KDQpPbiA4LzE1LzE5
IDU6MjYgUE0sIEpvZSBTbGF0ZXIgd3JvdGU6DQo+IEFkZCBiYWNrIHpsaWIgc3VwcG9ydC4gIERl
ZmluZSB6aXAgc3VwcG9ydCBidXQgZG8gbm90IGVuYWJsZSBpdC4NCg0KQ2FuIHlvdSBleHBsYWlu
IHdoYXQgdGhhdCBhY2hpZXZlcy4NCiBGcm9tIHRoZSBjaGFuZ2UgaXQgbG9va3MgbGlrZSB5b3Ug
aGF2ZSBkdXBsaWNhdGVkIHRoZSBkZWZhdWx0IGNvbmZpZyBhbmQgYWRkZWQgYSBQQUNLQUdFQ09O
RklHLiBXaHkgZG8geW91IG5lZWQgYm90aD8NCg0KLi4vUmFuZHkNCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+ICAgbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL3BocC9waHAuaW5jIHwgNCArKystDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9waHAvcGhwLmluYyANCj4gYi9tZXRhLW9lL3JlY2lw
ZXMtZGV2dG9vbHMvcGhwL3BocC5pbmMNCj4gaW5kZXggMzNiY2YxMi4uYjYzZWQ0YyAxMDA2NDQN
Cj4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3BocC9waHAuaW5jDQo+ICsrKyBiL21l
dGEtb2UvcmVjaXBlcy1kZXZ0b29scy9waHAvcGhwLmluYw0KPiBAQCAtNTksNyArNTksNyBAQCBF
WFRSQV9PRUNPTkYgPSAiLS1lbmFibGUtbWJzdHJpbmcgXA0KPiAgICAgICAgICAgICAgICAgICAt
LWVuYWJsZS1mcG0gXA0KPiAgICAgICAgICAgICAgICAgICAtLXdpdGgtbGliZGlyPSR7YmFzZWxp
Yn0gXA0KPiAgICAgICAgICAgICAgICAgICAtLXdpdGgtZ2V0dGV4dD0ke1NUQUdJTkdfTElCRElS
fS8uLiBcDQo+IC0gICAgICAgICAgICAgICAgLS13aXRoLWxpYnppcD0ke1NUQUdJTkdfTElCRElS
fS8uLiBcDQo+ICsgICAgICAgICAgICAgICAgLS13aXRoLXpsaWI9JHtTVEFHSU5HX0xJQkRJUn0v
Li4gXA0KPiAgICAgICAgICAgICAgICAgICAtLXdpdGgtaWNvbnY9JHtTVEFHSU5HX0xJQkRJUn0v
Li4gXA0KPiAgICAgICAgICAgICAgICAgICAtLXdpdGgtYnoyPSR7U1RBR0lOR19ESVJfVEFSR0VU
fSR7ZXhlY19wcmVmaXh9IFwNCj4gICAgICAgICAgICAgICAgICAgDQo+IC0td2l0aC1jb25maWct
ZmlsZS1wYXRoPSR7c3lzY29uZmRpcn0vcGhwL2FwYWNoZTItcGhwJHtQSFBfTUFKT1JfVkVSU0lP
Tn0gXCBAQCAtODEsNiArODEsOCBAQCBQQUNLQUdFQ09ORklHID8/PSAibXlzcWwgc3FsaXRlMyBp
bWFwIG9wY2FjaGUgb3BlbnNzbCBcDQo+ICAgIg0KPiAgIFBBQ0tBR0VDT05GSUdfY2xhc3MtbmF0
aXZlID0gIiINCj4gICANCj4gK1BBQ0tBR0VDT05GSUdbemlwXSA9ICItLWVuYWJsZS16aXAgLS13
aXRoLWxpYnppcD0ke1NUQUdJTkdfRVhFQ1BSRUZJWERJUn0sLGxpYnppcCINCj4gKw0KPiAgIFBB
Q0tBR0VDT05GSUdbbXlzcWxdID0gIi0td2l0aC1teXNxbD0ke1NUQUdJTkdfRElSX1RBUkdFVH0k
e3ByZWZpeH0gXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgIC0td2l0aC1teXNxbGk9JHtT
VEFHSU5HX0JJTkRJUl9DUk9TU30vbXlzcWxfY29uZmlnIFwNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICANCj4gLS13aXRoLXBkby1teXNxbD0ke1NUQUdJTkdfQklORElSX0NST1NTfS9teXNx
bF9jb25maWcgXA0KPiANCg0KDQotLQ0KIyBSYW5keSBNYWNMZW9kDQojIFdpbmQgUml2ZXIgTGlu
dXgNCg==

