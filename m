Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 157489 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Jun 2017 19:28:12 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0074.outbound.protection.outlook.com [104.47.40.74])
	by mail.openembedded.org (Postfix) with ESMTP id F22BB71AD6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 19:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=x7Pxhd4xga7c+NbhQN7tgnBnZVRVAej8fstMyN70hsE=;
	b=UPLFF1gg1biehbcXf3zyai295RKOlbQz3/iVwTUpvM/K7xKeP35pblDyBuvM3ZOA6925FA2cU3eB51Cd+K+SkK8+ZEbdWItthjPXuYvTMuWNJO/CAtSpjXPlcTmsgybVOmtWAQKEJdBJUdHkZy5NstUETn/BZdSzSZ/AMTKZRAg=
Received: from CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) by
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1178.14; Wed, 21 Jun 2017 18:55:08 +0000
Received: from CY4PR0101MB2935.prod.exchangelabs.com ([10.171.223.140]) by
	CY4PR0101MB2935.prod.exchangelabs.com ([10.171.223.140]) with mapi id
	15.01.1178.023; Wed, 21 Jun 2017 18:55:08 +0000
From: Martin Kelly <mkelly@xevo.com>
To: "martin.jansa@gmail.com" <martin.jansa@gmail.com>,
	"pauldotknopf@gmail.com" <pauldotknopf@gmail.com>
Thread-Topic: [oe] meta-qt5 nothing provides qtdeclarative-plugins
Thread-Index: AQHS6rp4oHBy1d/Y2ki6D4q3mjtmB6IvpYEAgAABHICAAAOSgA==
Date: Wed, 21 Jun 2017 18:55:08 +0000
Message-ID: <1498071273.4993.8.camel@xevo.com>
References: <CAKmWj-1-sXNeNBJpO1uzF+8q7sFjS3XO4m=hQL3CDa10T2H99w@mail.gmail.com>
	<CA+chaQe1aL95ioVkxrfaWvDz9LuyAJhr62gPiwt1caXgMatmqg@mail.gmail.com>
	<CAKmWj-3PvhwPsWSshn=Ud2BOoGYLc0YCRTZm8AmXxTzUS1_z2g@mail.gmail.com>
In-Reply-To: <CAKmWj-3PvhwPsWSshn=Ud2BOoGYLc0YCRTZm8AmXxTzUS1_z2g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=xevo.com;
x-originating-ip: [65.122.179.226]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR0101MB2933;
	7:BEmUqBcvcxcuqVCpnotlLtKVoCxSW3s7k16qLfT659fw7kZOZV1aD8UNRxjnOz5Ex23Ym34x/3IVTi3P6Hrw60R3uFylGnjgkSryZerdMDYojjBhtkTIT2AAvDPWaYhTpSv53b5pB6kY7YFFG55b5Vdu27/A0BZUvFsvvItNTmJaYE+OfPRDp+ECswXVoPg1V6lNP/34tVEm0VhSQDZQ4kFkkvNhFcQedDPRMaKpNNSKjV/L7o4ndeON/G7K0/GZdRHYLX8hzG1AsqEg4z9EKa3/LBo7esGuqb0pUnnlHRkrlYbp3MrUOQKnDNEiwEVbTMycz9p2EPEIaFNvOrjVVVC0Sa7KffPjMcIMnewzEOrjeoJbyKlhkqLhnX0SoU3zz2lByxqe3JqcWAftDUig14edPwarNACxlvOlD8BixrBOzJ4/3vCe5TTpmVIGTp2RBMTWbmQTS1AZpmEuOLk/XN8Sp24mu9pAlNWTMXbbkBt1rhOSaSvRpH2dS416ZC89uI3Ssy4nooe363PFJRcVel6kEA6CjbYIAO0VviZgG9iaYiFyTOKO34o3yx/mruaNGmadIrweotlFp5FbJ2sPXzJudIPcRd5VWTTXyLd2O52C5axMDqh6TfI4RIr4uyPsLf7ahG/gMqLwhwFopYQyiy75f029XqLO0vIItCiCqnaPvLostZkrHLeH1ZNVY8eWwRMrxam1BeGUWJbX+GzBNmH0bC9Q4/aWqLaFQoJdQtt50MWvKXD335tvWOe/SVUbbgbN3fFqnI5+1xu0+OUdUS5h0jl1Qn/0FDi6kcvVFnI=
x-ms-office365-filtering-correlation-id: 043d4457-bb8a-4b4e-2723-08d4b8d709b9
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500055)(300135000095)(300000501055)(300135300095)(22001)(300000502055)(300135100095)(2017030254075)(300000503055)(300135400095)(201703131423075)(201703031133081)(201702281549075)(300000504055)(300135200095)(300000505055)(300135600095);
	SRVR:CY4PR0101MB2933; 
x-ms-traffictypediagnostic: CY4PR0101MB2933:
x-microsoft-antispam-prvs: <CY4PR0101MB2933CAA610A85950633FACE6ABDA0@CY4PR0101MB2933.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(264703809997249)(17755550239193); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(100000703101)(100105400095)(6041248)(20161123558100)(20161123560025)(20161123562025)(20161123555025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2933; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2933; 
x-forefront-prvs: 0345CFD558
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39410400002)(39400400002)(39450400003)(39830400002)(377454003)(24454002)(377424004)(478600001)(1720100001)(6246003)(38730400002)(4326008)(53936002)(2900100001)(54356999)(33646002)(229853002)(122556002)(50986999)(25786009)(36756003)(66066001)(68736007)(76176999)(2950100002)(6512007)(189998001)(54906002)(6306002)(103116003)(6436002)(2501003)(6506006)(102836003)(3846002)(6116002)(99286003)(8936002)(81166006)(575784001)(8676002)(966005)(305945005)(86362001)(7736002)(14454004)(5660300001)(39060400002)(3660700001)(2906002)(6486002)(77096006)(3280700002)(53546010);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2933;
	H:CY4PR0101MB2935.prod.exchangelabs.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2017 18:55:08.4039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2933
Cc: "cflaat@medxchange.com" <cflaat@medxchange.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: meta-qt5 nothing provides qtdeclarative-plugins
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
X-List-Received-Date: Wed, 21 Jun 2017 19:28:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCA2FF0F0E373E4BBE7B1BFCECF69797@prod.exchangelabs.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE3LTA2LTIxIGF0IDE0OjQxIC0wNDAwLCBQYXVsIEtub3BmIHdyb3RlOg0KPiBJ
J20gbm90IGZhbWlsaWFyIHdpdGggdGhlIHF0NSBidWlsZCBwcm9jZXNzLiBEbyB5b3Uga25vdyB3
aGF0DQo+IFBBQ0tBR0VDT05GSUcNCj4gSSBuZWVkIHRvIGVuYWJsZT8NCj4gDQo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9tZXRhLXF0NS9tZXRhLXF0NS9ibG9iLzNhZTg2Y2IvcmVjaXBlcy1xdC9xdDUv
cXRiYQ0KPiBzZV9naXQuYmINCj4gDQoNCllvdSBuZWVkIHFtbC1kZWJ1Zy4gU2VlIHRoaXMgdGhy
ZWFkIGZvciBtb3JlIGRldGFpbHM6DQoNCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9waXBlcm1haWwvYXV0b21vdGl2ZS1kaXNjdXNzaW9ucy8yMDE3DQotTWF5LzAwNDAyNi5odG1s
DQoNCkZyb20gdGhlIHRocmVhZCwgaWYgeW91IGRvbid0IG5lZWQgdGhlIHFtbHRvb2xpbmcgcGx1
Z2luLCB0aGVuIEkNCmJlbGlldmUgeW91IGNhbiBqdXN0IGRyb3AgeW91ciBkZXBlbmRlbmN5IG9u
IHF0ZGVjbGFyYXRpdmUtcGx1Z2lucywgYW5kDQp0aGUgZXJyb3Igd2lsbCBnbyBhd2F5Lg0KDQo+
IE9uIFdlZCwgSnVuIDIxLCAyMDE3IGF0IDI6MzcgUE0sIE1hcnRpbiBKYW5zYSA8bWFydGluLmph
bnNhQGdtYWlsLmNvbQ0KPiA+DQo+IHdyb3RlOg0KPiANCj4gPiBNeSBndWVzcyBpcyB0aGF0IHlv
dSdyZSBtaXNzaW5nIGEgZmV3IHF0YmFzZSBQQUNLQUdFQ09ORklHcy4NCj4gPiANCj4gPiBPbiBX
ZWQsIEp1biAyMSwgMjAxNyBhdCA4OjE1IFBNLCBQYXVsIEtub3BmIDxwYXVsZG90a25vcGZAZ21h
aWwuY29tDQo+ID4gPg0KPiA+IHdyb3RlOg0KPiA+IA0KPiA+ID4gV2hlbiBJIHRyeSB0byB1c2Ug
InBhY2thZ2Vncm91cC1xdDUtcXRjcmVhdG9yLWRlYnVnIiwgSSBnZXQgdGhpcw0KPiA+ID4gZXJy
b3IuDQo+ID4gPiANCj4gPiA+IG5vdGhpbmcgcHJvdmlkZXMgcXRkZWNsYXJhdGl2ZS1wbHVnaW5z
IG5lZWRlZCBieQ0KPiA+ID4gcGFja2FnZWdyb3VwLXF0NS1xdGNyZWF0b3ItZGVidWctMS4wLXIw
Lm5vYXJjaA0KPiA+ID4gDQo+ID4gPiBJIGFtIHVzaW5nIHBva3kvcHlybywgd2l0aCBtZXRhLXF0
NS9tYXN0ZXINCj4gPiA+ICgzYWU4NmNiMzJlZGQxNDQ5ZjcwMmUwYTA5NDkyOWFlOWIyMWNlMTkx
KS4NCj4gPiA+IA0KPiA+ID4gSSBjaGVja2VkIHRoZSBidWlsZC93b3Jrc3BhY2UgZGlyZWN0b3J5
IGZvciB0aGlzIHJlY2lwZSwgYW5kDQo+ID4gPiBpbmRlZWQsIG5vDQo+ID4gPiBmaWxlcyBhcmUg
YmVpbmcgcHV0IGludG8gdGhlIHF0ZGVjbGFyYXRpdmUtcGx1Z2lucyBwYWNrYWdlLiBUaGUNCj4g
PiA+IGJ1aWxkDQo+ID4gPiBkaXJlY3RvcnkgY29udGFpbnMgbm8gcGx1Z2lucyBkaXJlY3Rvcnku
DQo+ID4gPiANCj4gPiA+IEkgY2hlY2tlZCB0aGUgbW9ydHkgYnJhbmNoIGFuZCBzb21lDQo+ID4g
PiAicGx1Z2lucy9xbWx0b29saW5nL2xpYnFtbGRiZ18qIi5zbyINCj4gPiA+IGZpbGVzIHdlcmUg
YmVpbmcgcGxhY2VkIGluc2lkZSBvZiB0aGUgInF0ZGVjbGFyYXRpdmUtcGx1Z2lucyINCj4gPiA+
IHBhY2thZ2UuDQo+ID4gPiANCj4gPiA+IERvZXMgdGhlICJwYWNrYWdlZ3JvdXAtcXQ1LXF0Y3Jl
YXRvci1kZWJ1ZyIgbmVlZCB0byByZW1vdmUgdGhlDQo+ID4gPiAicXRkZWNsYXJhdGl2ZS1wbHVn
aW5zIiBkZXBlbmRlbmN5LCBvciBkb2VzIHRoZSBxdGRlY2xhcmF0aXZlDQo+ID4gPiByZWNpcGUg
bmVlZA0KPiA+ID4gdG8gYmUgZml4ZXMgdG8gaW5jbHVkZSBwbHVnaW5zIGluIHRoZSBidWlsZCBv
dXRwdXQ/DQo+ID4gPiAtLQ0KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gPiA+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4g
PiA+IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBodHRw
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1k
ZXZlbA0KPiA+ID4gDQo+ID4gDQo+ID4gDQo=

