Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4937319F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 17:00:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7DH0ZBd017005
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 10:00:38 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.10]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0468.000;
	Tue, 13 Aug 2019 10:00:34 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Adrian Bunk <bunk@stusta.de>
Thread-Topic: [oe] [meta-oe][PATCH 1/1] php: zlib and zip support
Thread-Index: AQHVUUNC/vrmkq9WB0eliswKDId4Xab49/WAgABWeiA=
Date: Tue, 13 Aug 2019 17:00:33 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84FA87EF1C@ALA-MBD.corp.ad.wrs.com>
References: <20190812192220.238334-1-joe.slater@windriver.com>
	<20190813045003.GA5396@localhost>
In-Reply-To: <20190813045003.GA5396@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.117.223]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 13 Aug 2019 17:00:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhdCdzIHByb2JhYmx5IGJlc3QuICBUaGUgYnVuZGxlZCB3YXkgd29uJ3QgYmUgc3VwcG9ydGVk
IGF0IHNvbWUgZnV0dXJlIGRhdGUsIGFueXdheS4gICAgICBKb2UNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IEFkcmlhbiBCdW5rIDxidW5rQHN0dXN0YS5kZT4gDQpTZW50OiBN
b25kYXksIEF1Z3VzdCAxMiwgMjAxOSA5OjUwIFBNDQpUbzogU2xhdGVyLCBKb3NlcGggPGpvZS5z
bGF0ZXJAd2luZHJpdmVyLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtvZV0gW21ldGEtb2VdW1BBVENIIDEvMV0gcGhwOiB6
bGliIGFuZCB6aXAgc3VwcG9ydA0KDQpPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCAxMjoyMjoyMFBN
IC0wNzAwLCBKb2UgU2xhdGVyIHdyb3RlOg0KPiBBZGQgYmFjayB6bGliIHN1cHBvcnQuICBEZWZp
bmUgemlwIHN1cHBvcnQgYnV0IGRvIG5vdCBlbmFibGUgaXQuDQo+Li4uDQo+ICsjIEZvciB6aXAs
IHNlbGVjdCBvbmUgb3Igbm9uZS4gIG9sZHppcCB1c2VzIGEgYnVuZGxlZCBsaWJyYXJ5IGFuZCBp
cyBkZXByZWNhdGVkLg0KPiArIw0KPiArUEFDS0FHRUNPTkZJR1tuZXd6aXBdID0gIi0tZW5hYmxl
LXppcCAtLXdpdGgtbGliemlwPSR7U1RBR0lOR19FWEVDUFJFRklYRElSfSwsbGliemlwIg0KPiAr
UEFDS0FHRUNPTkZJR1tvbGR6aXBdID0gIi0tZW5hYmxlLXppcCAtLXdpdGhvdXQtbGliemlwLCIN
Cj4uLi4NCg0KQW55IHJlYXNvbiB3aHkgdGhpcyBjYW4ndCBiZSBQQUNLQUdFQ09ORklHW3ppcF0g
Zm9yIHRoZSBleHRlcm5hbCBsaWJ6aXAgb25seSB3aXRob3V0IGFueSBvcHRpb24gZm9yIHRoZSBi
dW5kbGVkIGxpYnJhcnk/DQoNCkJ1bmRsZWQgbGlicmFyaWVzIGFyZSB1c3VhbGx5IGJlaGluZCBv
biBzZWN1cml0eSBmaXhlcywgYW5kIHBocCBpcyBhIHNvZnR3YXJlIHdoZXJlIHRoaXMgdGVuZHMg
dG8gbWF0dGVyLg0KDQpjdQ0KQWRyaWFuDQoNCi0tIA0KDQogICAgICAgIklzIHRoZXJlIG5vdCBw
cm9taXNlIG9mIHJhaW4/IiBMaW5nIFRhbiBhc2tlZCBzdWRkZW5seSBvdXQNCiAgICAgICAgb2Yg
dGhlIGRhcmtuZXNzLiBUaGVyZSBoYWQgYmVlbiBuZWVkIG9mIHJhaW4gZm9yIG1hbnkgZGF5cy4N
CiAgICAgICAiT25seSBhIHByb21pc2UsIiBMYW8gRXIgc2FpZC4NCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFBlYXJsIFMuIEJ1Y2sgLSBEcmFnb24gU2VlZA0KDQo=

