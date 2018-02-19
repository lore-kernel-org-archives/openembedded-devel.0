Return-Path: <kwangsub.kim@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0106.outbound.protection.outlook.com [104.47.2.106])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4DE784F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2018 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JAF8Frl0mastKk2fNAs3vEF4IgfFtXzyHLhyYXWSOOI=;
	b=Ppn2n75pKdJOAkoQFXOmtje36cADk4YxGDOBhJoYuXRPRoPMJRHvAEs4i0D9AbVswwam4aGJ0W6tOFxP/I4TWL6kc1i0N5/KaF9WnHHUzQDbbBTx1rGvBUyXZbzSIPOKJhBcqbwmo17fDuf1F0vueUqpt3rrHzDo5o3HzrWGYCM=
Received: from HE1PR0202MB2491.eurprd02.prod.outlook.com (10.168.183.137) by
	HE1PR0202MB2652.eurprd02.prod.outlook.com (10.168.184.144) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.506.18;
	Mon, 19 Feb 2018 07:18:54 +0000
Received: from HE1PR0202MB2491.eurprd02.prod.outlook.com
	([fe80::6469:f629:e6b6:b57a]) by
	HE1PR0202MB2491.eurprd02.prod.outlook.com
	([fe80::6469:f629:e6b6:b57a%14]) with mapi id 15.20.0506.021;
	Mon, 19 Feb 2018 07:18:54 +0000
From: Kwangsub Kim <kwangsub.kim@qt.io>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt5][PATCH] qtbase: add a config option to optimize
	for size
Thread-Index: AQHTp/SPWlDEduu5QEyNX8zEnJ5GK6OpZPyAgAKFwIA=
Date: Mon, 19 Feb 2018 07:18:52 +0000
Message-ID: <47022AA3-C340-485C-8BE1-A23A69001DE8@qt.io>
References: <1518874632-22199-1-git-send-email-kwangsub.kim@qt.io>
	<1f1d405a-33ea-980b-994f-c0e83a2e7c48@gmail.com>
In-Reply-To: <1f1d405a-33ea-980b-994f-c0e83a2e7c48@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=kwangsub.kim@qt.io; 
x-originating-ip: [175.195.156.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0202MB2652;
	7:g00c0v+ZaIKd9hCiivD9YH1fCuWUs4CdUZE+9sA1BU0apzhut4J8A7LWVo5Oni2ccgyc6BPpVGHM2lpZ/RU3/hSZRk4z9vdjuRhkm9bv6HomhmDSTKm/nN8b51DTOwmW3hhsSWK97CBKN3nD3UHsbDMSibebOhd1gEpY48em4p60gc9D4WSfbAvN9YVGloDOKVDb5rVIOrJ3JXIjKbfDkrYIyyoqwStMck6Do29dhQXIf6qtw0wefiBmFSMwkTKU
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: f77ff8e8-a60b-4471-083c-08d577690897
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
	SRVR:HE1PR0202MB2652; 
x-ms-traffictypediagnostic: HE1PR0202MB2652:
x-microsoft-antispam-prvs: <HE1PR0202MB26524B1D1601366E92C4114086C80@HE1PR0202MB2652.eurprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(278428928389397)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3231101)(944501161)(3002001)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011);
	SRVR:HE1PR0202MB2652; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0202MB2652; 
x-forefront-prvs: 0588B2BD96
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39380400002)(39840400004)(396003)(346002)(366004)(376002)(189003)(199004)(2950100002)(2900100001)(76176011)(6486002)(7736002)(74482002)(105586002)(6436002)(68736007)(106356001)(25786009)(5660300001)(3280700002)(26005)(99286004)(186003)(3660700001)(66066001)(1720100001)(39060400002)(81156014)(33656002)(14454004)(478600001)(966005)(5250100002)(102836004)(305945005)(81166006)(8936002)(8676002)(110136005)(316002)(2501003)(2906002)(97736004)(229853002)(6306002)(6512007)(53936002)(36756003)(3846002)(6116002)(82746002)(53546011)(86362001)(6506007)(83716003)(6246003)(33896004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0202MB2652;
	H:HE1PR0202MB2491.eurprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
x-microsoft-antispam-message-info: NEIAZmf9w/KTum9GasDtnRSRL/L1Ohb8YdBc0hhpCwWOxile6+NN9I4IV+YY9MjEqsby0gBMrVAlPeejEv3VW0M1MDGOeze4rr6qhoTz57YV/aUwXTe44sPRa3X5WUi2+W0yzXyk9o+Fpl1F3yKq72fGN6ScEiXInrPnRadwdig=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-Network-Message-Id: f77ff8e8-a60b-4471-083c-08d577690897
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2018 07:18:53.5617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0202MB2652
Subject: Re: [meta-qt5][PATCH] qtbase: add a config option to optimize for size
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
X-List-Received-Date: Mon, 19 Feb 2018 14:52:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DBE7B82F406AD4180C0D84CB31F781F@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgS2hlbSwNCg0KVGhhdOKAmXMgYSBnb29kIHBvaW50LiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3
Lg0KSSB3aWxsIHB1dCB0aGUgdXBkYXRlZCBwYXRjaCB0aGF0IGNoZWNrcyBTRUxFQ1RFRF9PUFRJ
TUlaQVRJT04gYW5kIGRldGVybWluZXMgdGhlIGRlZmF1bHQgb3B0aW9uLiBQbGVhc2UgaGF2ZSBh
IGxvb2sgaWYgaXTigJlzIGFjY2VwdGFibGUuDQoNCkJSLA0KS3dhbmdzdWINCg0KT24gMTgvMDIv
MjAxOCwgMTE6MTEgQU0sIEtoZW0gUmFqIHdyb3RlOg0KDQogICAgT24gMi8xNy8xOCA1OjM3IEFN
LCBLd2FuZ3N1YiBLaW0gd3JvdGU6DQogICAgPiBUaGUgJy1vcHRpbWl6ZS1zaXplJyBvcHRpb24g
d291bGQgZW5hYmxlIHRoZSBjb21waWxlciB0byBvcHRpbWl6ZQ0KICAgID4gZm9yIHNpemUgaW5z
dGVhZCBvZiBzcGVlZC4gSXQgd291bGQgYWZmZWN0IHRoZSB3aG9sZSBRdCBsaWJyYXJpZXMNCiAg
ICA+IGFuZCBRdCBhcHBsaWNhdGlvbnMgYXMgd2VsbC4NCiAgICA+IA0KICAgID4gVGhpcyBmZWF0
dXJlIGlzIGF2YWlsYWJsZSBpbiBRdCA1LjkrLg0KICAgID4gDQogICAgPiBTaWduZWQtb2ZmLWJ5
OiBLd2FuZ3N1YiBLaW0gPGt3YW5nc3ViLmtpbUBxdC5pbz4NCiAgICA+IC0tLQ0KICAgID4gICBy
ZWNpcGVzLXF0L3F0NS9xdGJhc2VfZ2l0LmJiIHwgMSArDQogICAgPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQ0KICAgID4gDQogICAgPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1xdC9x
dDUvcXRiYXNlX2dpdC5iYiBiL3JlY2lwZXMtcXQvcXQ1L3F0YmFzZV9naXQuYmINCiAgICA+IGlu
ZGV4IDRmM2FkZTIuLjhkZGE2YTIgMTAwNjQ0DQogICAgPiAtLS0gYS9yZWNpcGVzLXF0L3F0NS9x
dGJhc2VfZ2l0LmJiDQogICAgPiArKysgYi9yZWNpcGVzLXF0L3F0NS9xdGJhc2VfZ2l0LmJiDQog
ICAgPiBAQCAtOTAsNiArOTAsNyBAQCBQQUNLQUdFQ09ORklHW3JlbGVhc2VdID0gIi1yZWxlYXNl
LC1kZWJ1ZyINCiAgICA+ICAgUEFDS0FHRUNPTkZJR1tkZWJ1Z10gPSAiIg0KICAgID4gICBQQUNL
QUdFQ09ORklHW2RldmVsb3Blcl0gPSAiLWRldmVsb3Blci1idWlsZCINCiAgICA+ICAgUEFDS0FH
RUNPTkZJR1txbWwtZGVidWddID0gIi1xbWwtZGVidWcsLW5vLXFtbC1kZWJ1ZyINCiAgICA+ICtQ
QUNLQUdFQ09ORklHW29wdGltaXplLXNpemVdID0gIi1vcHRpbWl6ZS1zaXplIg0KICAgIA0KICAg
IFdlIGFsc28gaGF2ZSBnbG9iYWwgY29tcGlsZXIgb3B0aW9ucyB3aGljaCB3aWxsIGJlIHBhc3Nl
ZCBpbi4gU28gcGVyaGFwcyANCiAgICBpdCBzaG91bGQgY2hlY2sgZm9yIC1PcyBpbiBTRUxFQ1RF
RF9PUFRJTUlaQVRJT04gYW5kIGVuYWJsZSB0aGlzIA0KICAgIHBhY2thZ2Vjb25maWcgYnkgZGVm
YXVsdCBpZiBmb3VuZC4NCiAgICANCiAgICA+ICAgUEFDS0FHRUNPTkZJR1tzbV0gPSAiLXNtLC1u
by1zbSINCiAgICA+ICAgUEFDS0FHRUNPTkZJR1t0ZXN0c10gPSAiLW1ha2UgdGVzdHMsLW5vbWFr
ZSB0ZXN0cyINCiAgICA+ICAgUEFDS0FHRUNPTkZJR1tleGFtcGxlc10gPSAiLW1ha2UgZXhhbXBs
ZXMgLWNvbXBpbGUtZXhhbXBsZXMsLW5vbWFrZSBleGFtcGxlcyINCiAgICA+IA0KICAgIC0tIA0K
ICAgIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQogICAg
T3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdA0KICAgIE9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQogICAgaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCiAgICANCg0K

