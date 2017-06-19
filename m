Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0051.outbound.protection.outlook.com [104.47.41.51])
	by mail.openembedded.org (Postfix) with ESMTP id 972AE78208
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 22:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=m1vO7PhR6eZH6ifkYr/EgR6sJGC0IC/31dY97RDcqqo=;
	b=wOvCD6nG4kIhLMtyFgpvmrP6Gq7rpNXNHbvlwScrbGqPnxRnKJDJCElCur6LTlyNG0QOxZPEnJA3rY/9lRbi3FA96muswtsVGn6HCsw3bZhZmPZdI1OOMK6uIk82PgZSNF1xH3xXNAuvX3xEdVvUz0qxMOdYf3NzhWABgf/vopM=
Received: from CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) by
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1178.14; Mon, 19 Jun 2017 22:02:55 +0000
Received: from CY4PR0101MB2935.prod.exchangelabs.com ([10.171.223.140]) by
	CY4PR0101MB2935.prod.exchangelabs.com ([10.171.223.140]) with mapi id
	15.01.1178.018; Mon, 19 Jun 2017 22:02:55 +0000
From: Martin Kelly <mkelly@xevo.com>
To: "dvhart@vmware.com" <dvhart@vmware.com>
Thread-Topic: [oe] [meta-oe][PATCH 00/14] new recipe: open-vm-tools recipe
Thread-Index: AQHS5ur7XFtwXtprf0C6+LiDAMtdgaIswZyA
Date: Mon, 19 Jun 2017 22:02:55 +0000
Message-ID: <1497909741.4988.2.camel@xevo.com>
References: <B110778A-770D-46DC-9394-09B1919F6C51@vmware.com>
In-Reply-To: <B110778A-770D-46DC-9394-09B1919F6C51@vmware.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vmware.com; dkim=none (message not signed)
	header.d=none; vmware.com; dmarc=none action=none header.from=xevo.com; 
x-originating-ip: [65.122.179.226]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR0101MB2933;
	7:yXvAkWKAQ50B1WhSUWqoppUffssyaqgcPYI1UVk5XjTfv9mwZVfdKOl3QU3s5BsdJ7GzsDHDH27Sr9bgY6uGQkkZ1shK7o6lPo+5gTqGkkUzyhBMIRR37kJ92UMtHAhx/SVQYclC0D+zNvtwF1YKHikX/eqpGBFIM3CwEvONrb756bSP9WeceOXvbTSVYX5T/M+/SU5LqBNvBNFzbwnXIyxladlXTHP4l2hZgZ9UQf2wms8vVpXWMrsQL4aGx04uuCQGzlMqb318GcWpWXQOOHZ3nFXeyVv9hSkjnwe8MclmZOVDwXLKsCMApMSoO0hv3/6jyvdrl4hj+br8oBMhWI+RvLkjd2rQ5W0hF7XNrOEoscAGFI1+DXooGVtKDfJ4izGVf6iAmaiBBG5VmCCWtZnc3G12EovqLGSPbcXRUU8v35SOt2Y5UqKSnsGxZXfS90z+3tZ5lN9qmqrC4ILjyZcYxEc5JcB051HAysYi8L91Pl/2Rt5WQaoLzPwFVZcILgLT9gELLtCyfHLRTFs7ivFc9Kzd+tiBC2qmlzxSFCrY5PoX6mjI24xQaMfwDyJsre4r9GCInUmXXzKNYeONZzI4lVtYrC5au9kXBgfn+E/Q+RrhUJQIR+x6r2padZq5QykVup0Q7r2Kubf4xX+g5YOjIM52Qjqq+XYLyiMcJYbnUkf37XnzuO42NunPg0kM3tEuhqU2L02WGq/umutcz9IID8IpfpT9hm0aoJSbKRw0W8/RxW473PbizVOQr7CbVEUelyQkPuZzETiiqePWKqRFhndXLaTTvLnA6XCLdjA=
x-ms-office365-filtering-correlation-id: 4afc72d4-3249-4974-3a16-08d4b75ef03d
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081)(201702281549075);
	SRVR:CY4PR0101MB2933; 
x-ms-traffictypediagnostic: CY4PR0101MB2933:
x-microsoft-antispam-prvs: <CY4PR0101MB293330BEDC84FAF696CF91F8ABC40@CY4PR0101MB2933.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(100000703101)(100105400095)(3002001)(93006095)(93001095)(6041248)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(20161123555025)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2933; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2933; 
x-forefront-prvs: 0343AC1D30
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39400400002)(39450400003)(39410400002)(39830400002)(174874002)(377454003)(53754006)(24454002)(377424004)(6486002)(36756003)(6512007)(6436002)(77096006)(122556002)(230783001)(39060400002)(102836003)(3846002)(2900100001)(1730700003)(8676002)(50986999)(76176999)(54356999)(81166006)(2950100002)(6916009)(5660300001)(6116002)(53936002)(14454004)(7736002)(6306002)(5640700003)(966005)(54906002)(305945005)(4326008)(99286003)(6506006)(3660700001)(478600001)(6246003)(189998001)(103116003)(38730400002)(8936002)(110136004)(33646002)(2906002)(53546009)(2351001)(3280700002)(229853002)(25786009)(86362001)(2501003)(66066001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2933;
	H:CY4PR0101MB2935.prod.exchangelabs.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2017 22:02:55.0315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2933
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 00/14] new recipe: open-vm-tools recipe
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
X-List-Received-Date: Mon, 19 Jun 2017 22:02:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <20BB16B1DD82F448A8171E9E6EFF059E@prod.exchangelabs.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE3LTA2LTE2IGF0IDIxOjUzICswMDAwLCBEYXJyZW4gSGFydCB3cm90ZToNCj4g
T24gMDYvMDkvMjAxNyAwMzoyMiBQTSwgTWFydGluIEtlbGx5IHdyb3RlOg0KPiA+IEhpIGFsbCwN
Cj4gPiANCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIGEgbmV3IHJlY2lwZSBmb3IgT3BlbiBW
TSBUb29scyB0byBtZXRhLW9lLg0KPiA+IFRoaXMgcmVjaXBlIGlzIGludmFsdWFibGUgZm9yIHVz
aW5nIE9wZW5lbWJlZGRlZCB3aXRoIFZNV2FyZSwgYXMNCj4gPiB3aXRob3V0IHRoZSB0b29scywg
cGVyZm9ybWFuY2UgaXMgdmVyeSBzbG93Lg0KPiA+IE1vcmUgaW5mb3JtYXRpb24gYWJvdXQgT3Bl
biBWTSBUb29scyBjYW4gYmUgZm91bmQgaGVyZToNCj4gPiANCj4gPiANCj4gPiBodHRwczovL2dp
dGh1Yi5jb20vdm13YXJlL29wZW4tdm0tdG9vbHMNCj4gPiANCj4gPiANCj4gPiANCj4gPiBQbGVh
c2Ugbm90ZSB0aGF0LCBhcyBtZW50aW9uZWQgaW4gdGhlIGZpcnN0IGNvbW1pdCwgdGhpcyByZWNp
cGUgaXMNCj4gPiBtb2RpZmllZCBmcm9tIHRoZSByZWNpcGUgb3JpZ2luYWxseSBmb3VuZCBpbiB0
aGUgT3Blbi1Td2l0Y2gNCj4gPiByZXBvc2l0b3J5LiBUaGUgZmlyc3QgcGF0Y2ggaXMgZGlyZWN0
bHkgZnJvbSB0aGF0IHJlcG9zaXRvcnksIGFuZA0KPiA+IHRoZSBmb2xsb3dpbmcgcGF0Y2hlcyBh
cmUgbW9kaWZpY2F0aW9ucyB0byBpdC4NCj4gDQo+IEhpIGFsbCwNCj4gDQo+IFBsZWFzZSBmb3Jn
aXZlIG1lIGlmIHRoaXMgZG9lc27igJl0IGxhbmQgb24gdGhlIG1haWxpbmcgbGlzdCBxdWl0ZQ0K
PiByaWdodC4gSSBhbSBubyBsb25nZXIgc3Vic2NyaWJlZCB0byB0aGlzIGxpc3QgYW5kIHJlcGx5
aW5nIGZyb20gd2ViDQo+IGFyY2hpdmVzIGNhbiBiZSBoaXQgYW5kIG1pc3MuDQo+IA0KPiBJIHdh
bnRlZCB0byByZWFjaCBvdXQgYW5kIHNheSBpdOKAmXMgZ3JlYXQgdG8gc2VlIHRoaXMgcmVjaXBl
IGJlaW5nDQo+IHN1Ym1pdHRlZCB0byBtZXRhLW9lLCBhbmQgbmljZSB3b3JrIHVwZGF0aW5nIHRo
ZSByZWNpcGUgbWV0YS1kYXRhLg0KPiANCj4gSWYgdGhlcmUgaXMgc29tZXRoaW5nIHdlIGNhbiBk
byB0byBoZWxwIG1ha2UgdGhpcyBlYXNpZXIgdG8gbWFpbnRhaW4sDQo+IHN1cHBvcnQsIGV0Yywg
cGxlYXNlIGRvbuKAmXQgaGVzaXRhdGUgdG8gcmVhY2ggb3V0IHRvIG1lLiBJIG5vdGljZWQsDQo+
IGZvciBleGFtcGxlLCB0aGVyZSBhcmUgYSBmZXcgcGF0Y2hlcyB0byBkZWFsIHdpdGggZGVwcmVj
YXRlZCBsaWJyYXJ5DQo+IGNhbGxzIGFuZCB0aGUgT0UgYnVpbGQgZW52aXJvbm1lbnQuDQo+IA0K
DQpUaGFua3MsIHdpbGwgZG8uIFRoZXJlJ3MgYSBmZXcgcGF0Y2hlcyB0aGF0IHNob3VsZCBwcm9i
YWJseSBnbyB1cHN0cmVhbQ0KaWYgdGhleSdyZSBub3QgYWxyZWFkeSBwcmVzZW50IGluIHNvbWUg
b3RoZXIgZm9ybS4NCg0KPiBGaW5hbGx54oCmIGFzIHRoZSBhdXRob3Igb2Ygc2VuZC1wdWxsLXJl
cXVlc3QsIEkgaGF2ZSB0byBjb25mZXNzIGENCj4gdHdpbmdlIG9mIGd1aWx0IHdoZW4gaXQgZmFp
bGVkIHlvdSBNYXJ0aW4uIElmIHlvdSB3YW50IHRvIHNlbmQgbWUNCj4gZGV0YWlscyBvbiBob3cg
eW91IHJhbiBpdCBhbmQgdGhlIGRldGFpbHMgb2YgdGhlIGZhaWx1cmUsIEnigJlkIGJlDQo+IGhh
cHB5IHRvIGxvb2sgaW50byBpdC4NCj4gDQo+IE9uZSBwb3NzaWJpbGl0eSBpcyB0aGF0IHlvdXIg
bG9jYWwgYnJhbmNoIGRpZG7igJl0IG1hdGNoIHRoZSByZW1vdGUNCj4gYnJhbmNoLiBBbm90aGVy
IHBvc3NpYmlsaXR5IGlzIHRoYXQgaXQgaXNu4oCZdCBwYXJzaW5nIHRoZSBHaXRIdWINCj4gcmVw
b3NpdG9yeSBsb2NhdGlvbiBjb3JyZWN0bHksIGFuZCB0aGF0IG1heSBuZWVkIHVwZGF0aW5nLg0K
PiANCg0KVGhhbmtzOyBhcyB5b3UgbWF5IGhhdmUgc2VlbiwgSSBuZWVkIHRvIG1ha2UgYSBmZXcg
Y2hhbmdlcyBkdWUgdG8NCmlzc3VlcyB0aGF0IE1hcnRpbiBKYW5zYSBmb3VuZC4gSSB3aWxsIHRy
eSBzZW5kLXB1bGwtcmVxdWVzdCBhZ2FpbiBhbmQNCnNlbmQgeW91IGRldGFpbHMgYWJvdXQgYW55
IGlzc3VlcyBJIGhpdC4NCg0KPiBUaGFua3MsDQo+IA0KPiAtLQ0KPiBEYXJyZW4gSGFydA0KPiBE
aXJlY3RvciAvIE9wZW4gU291cmNlIEFyY2hpdGVjdA0KPiBWTXdhcmUgT3BlbiBTb3VyY2UgVGVj
aG5vbG9neSBDZW50ZXINCj4g

