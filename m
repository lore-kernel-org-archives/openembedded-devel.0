Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0067.outbound.protection.outlook.com [157.55.234.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2682E6E6B1;
	Wed, 11 May 2016 19:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=WzbN6aVpQAx0UR+PrBHawjllnQTyqX3O2Mat2YEQIo8=;
	b=JTeAMntxlOqTo+1hlk0i4e+RJI/+CFYWyYVMkztT1I7R6Yw/aGbyFmbTP3JV5+OAm21uSXv3pn0iedct7D4lMojaS7XspXYp74HJ5/Q9z9bnMBE9dYpkZboA4VlTCsOhUlNfwilAOWqsX/8MJ1jjUyDwD1ObP6q+J1PvT7mZp+A=
Received: from VI1PR04MB1583.eurprd04.prod.outlook.com (10.164.84.141) by
	VI1PR04MB1581.eurprd04.prod.outlook.com (10.164.84.139) with Microsoft
	SMTP Server (TLS) id 15.1.497.12; Wed, 11 May 2016 19:03:06 +0000
Received: from VI1PR04MB1583.eurprd04.prod.outlook.com ([10.164.84.141]) by
	VI1PR04MB1583.eurprd04.prod.outlook.com ([10.164.84.141]) with mapi id
	15.01.0492.016; Wed, 11 May 2016 19:03:06 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] proposal: replace GLUT with FreeGLUT
Thread-Index: AdGq54YcQBQPfsyrS+qvQPveYmH1oAAHWCiAACyDpVA=
Date: Wed, 11 May 2016 19:03:05 +0000
Message-ID: <VI1PR04MB1583D3D7058F8A2309BC645991720@VI1PR04MB1583.eurprd04.prod.outlook.com>
References: <VI1PR04MB1583BDC40DA6D580FE8F6C3591710@VI1PR04MB1583.eurprd04.prod.outlook.com>
	<CAJTo0LY9C+-hkUxT5yTQkfMF5kggDByFabzxP-PEC=WzC9=_6A@mail.gmail.com>
In-Reply-To: <CAJTo0LY9C+-hkUxT5yTQkfMF5kggDByFabzxP-PEC=WzC9=_6A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.168.49]
x-ms-office365-filtering-correlation-id: e5f732a3-7ef3-4f05-6c21-08d379cee2b2
x-microsoft-exchange-diagnostics: 1; VI1PR04MB1581;
	5:mY4IhqmVlUTj6H9hIWnuN+bJiVDoR6GEzBgfrKjyAAVpBEYSt1iZLpFBZjxZMq0rh4jTs0QmEeNCNc92pWtIgxdSjQfc/3QoHOrE3Jz25xel+tz5Cwxhe2A2+gD2gqvskVvwaz4FGWnbvB5k9kx/1A==;
	24:RB1j5dQCtxO3oglWZlAbldKqHhOZi2qV3dARMDCIdquDUS5ZoK0uSMGPx7388nXatLg+ce4/wtO13g1gQfLGt4m04eFM7gWddinXcbwyACI=;
	7:a4QeUVXQxkQNv4YlgPW/g5KjVsV4vJuSZf1bhOkDohgAyP4lD9utyKoJy3a9GX3I3EkPde2pHALZqJUE35abNFPEdWtVMHhpf1wLcqo6QDHF62UAI+wLVLkSozoU6lWEWEP4QbioAUnXJR8RIIyVCVW5mSkdJy7cYJTKrOyWp05SZhDx8Kn8w3ucIrbsrZP2
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB1581;
x-microsoft-antispam-prvs: <VI1PR04MB1581659BEFD30AA17B3E334591720@VI1PR04MB1581.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:VI1PR04MB1581; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB1581; 
x-forefront-prvs: 0939529DE2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(24454002)(87936001)(189998001)(19625215002)(6116002)(9686002)(18717965001)(8936002)(54356999)(790700001)(50986999)(81166006)(586003)(4326007)(10400500002)(102836003)(3846002)(2906002)(19300405004)(1220700001)(19580405001)(122556002)(19580395003)(76176999)(11100500001)(76576001)(19609705001)(5008740100001)(86362001)(16236675004)(345774005)(5002640100001)(9326002)(15975445007)(5003600100002)(77096005)(33656002)(110136002)(3660700001)(2950100001)(2900100001)(92566002)(66066001)(3280700002)(19617315012)(74316001)(5004730100002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB1581;
	H:VI1PR04MB1583.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2016 19:03:06.0283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB1581
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] proposal: replace GLUT with FreeGLUT
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
X-List-Received-Date: Wed, 11 May 2016 19:03:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KT24gMTAgTWF5IDIwMTYgYXQgMTk6MTIsIE5lZW5hIEJ1c2lyZWRkeSA8bmVl
bmFyZWRkeS5idXNpcmVkZHlAbnhwLmNvbTxtYWlsdG86bmVlbmFyZWRkeS5idXNpcmVkZHlAbnhw
LmNvbT4+IHdyb3RlOg0KR0xVVCBpcyBkZWFkIHVwc3RyZWFtIGZvciBhbG1vc3QgdGhyZWUgeWVh
cnMgbm93ICggaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9tZXNhL2dsdXQvICApIGFuZCBp
dCBtYWtlcyBzZW5zZSB0byByZXBsYWNlIEdMVVQgd2l0aCBGcmVlR0xVVCAuDQpTb21lIG9mIHRo
ZSByZWFzb25zIHRvIHJlcGxhY2Ugd2l0aCBGcmVlR0xVVCBhcmUgbGlzdGVkIGhlcmUgOg0KaHR0
cDovL2ZyZWVnbHV0LnNvdXJjZWZvcmdlLm5ldC8NCg0KQWxzbywgY3VycmVudCBtZXNhLWdsdXQg
cmVjaXBlIGRvZXMgbm90IGdlbmVyYXRlIEdMVVQgbGlicmFyeS4gSSB0ZXN0ZWQgdGhpcyB3aGVu
IEkgZW5hYmxlZCBHTFVUIGluIG1lc2EtZGVtb3MuDQoNCkkgZGlzY3Vzc2VkIHRoaXMgaXNzdWUg
d2l0aCBPdGF2aW8gYW5kIGhlIHN1Z2dlc3RlZCB0byByZXBsYWNlIEdMVVQgd2l0aCBGcmVlR0xV
VCBhbmQgdXBncmFkZSBtZXNhLWRlbW9zIHRvIDguMy4NCg0KWW91IG1pZ2h0IHdhbnQgdG8gQ0Mg
b2UtZGV2ZWwgdG9vLCBhcyBtZXNhLWdsdXQgaXMgcGFydCBvZiBtZXRhLW9lLg0KDQpJJ20gc3Vy
cHJpc2VkIHRoYXQgbWVzYS1nbHV0IGRvZXNuJ3QgYnVpbGQgdGhlIGdsdXQgbGlicmFyeSwgYnV0
IEkgaGF2ZSBubyBpbnRlcmVzdCBpbiBnbHV0IHNvIHlvdSBjYW4gZG8gd2hhdGV2ZXIgeW91IHdh
bnQgaW4gbXkgb3Bpbmlvbi4gOikNCg0KWyBDQyBpbmcgb2UtZGV2ZWwgXQ0KDQpUaGFuayB5b3Ug
Zm9yIHlvdXIgY29tbWVudHMuIEkgd2lsbCBzZW5kIHBhdGNoZXMgZm9yIEZyZWVHTFVULg0KDQpU
aGFua3MsDQpOZWVuYQ0K

