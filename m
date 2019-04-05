Return-Path: <prvs=991f25a9b=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id A905B7C603
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 17:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554485897; x=1586021897;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=GsQpqQoPFZt4Ynq2eUqc1fJFuJUquXtC67x6Gpzgiz8=;
	b=XLOW1w3i2GxVbmcgv7N5kUDspFtdQaCA+nheCY6g2SPZzBhv4O+mqgOk
	IyGQz7j1/4kOLvFCntbgMWuQLN25MlsflqVk0wV/QMDDigGdnljdYO/t/
	P685MPkfsC3+DUPyHWzK2fvjrIxkKPPKuYLjbBbkYbBaj+ZKhmzqziCLr
	ir76rtJscxM3X664yfW3aqTeiPdwBvcKsAmPKQzlTk5nnb6ziNWyE+bCV
	MW46/wJE9Tt84x86L0KdOC+TT4PAafm9fFNLfMZetzP+z+jw69i9d/XTT
	cMsRhtkUz0WjKejzwNDu4E2HWlQEvBl9g8SxSFiF5Ln3gpsmq/4Puvgj0 g==;
X-IronPort-AV: E=Sophos;i="5.60,313,1549900800"; d="scan'208";a="105093356"
Received: from mail-co1nam05lp2056.outbound.protection.outlook.com (HELO
	NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.56])
	by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2019 01:38:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GsQpqQoPFZt4Ynq2eUqc1fJFuJUquXtC67x6Gpzgiz8=;
	b=H0aheaSTUBp297H/hiQ1ynLmD7p6h8qo1CTnfrhgTGZb+Bw7sqO/Alvn18JuQa7a/84x4kmPvyru8QL+LNnURwfYPYiT7z5UUbqou9jLtusxQdEqDb3GgLsM7j/uLkHu+nzg5nGm8x0C9UBYGyKDIMY6rJyhfp3GZf2iJ7T8FTU=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5447.namprd04.prod.outlook.com (20.178.51.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1750.20; Fri, 5 Apr 2019 17:38:14 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 5 Apr 2019 17:38:14 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH v3 2/6] libfann: Initial commit
Thread-Index: AQHU69ZYKQmPmmRmskepL4YmZxUe4w==
Date: Fri, 5 Apr 2019 17:38:14 +0000
Message-ID: <20190405173706.1707-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR07CA0101.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::42) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ccaf496-6e73-471e-fca5-08d6b9ed7b30
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR04MB5447; 
x-ms-traffictypediagnostic: BYAPR04MB5447:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5447DFAB4608DA02C17C73DD90510@BYAPR04MB5447.namprd04.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39860400002)(396003)(376002)(136003)(346002)(189003)(199004)(7736002)(71200400001)(53936002)(102836004)(478600001)(316002)(4326008)(6486002)(6506007)(305945005)(6116002)(186003)(105586002)(2906002)(6436002)(5660300002)(5640700003)(3846002)(8676002)(81156014)(2501003)(256004)(86362001)(68736007)(54906003)(36756003)(6512007)(2616005)(476003)(6306002)(1076003)(71190400001)(52116002)(99286004)(81166006)(97736004)(14454004)(8936002)(25786009)(6916009)(2351001)(72206003)(106356001)(386003)(50226002)(66066001)(44832011)(486006)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5447;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JZv5KS5Oibd53qtkkL+iFCdjm7oIUj3FfHCCEyxC/lxwrq4V8LuJOIe3N3yZ818xW+xXL43e8B8WsjYLa2LoceXBabYZwddiQ4QgQs4ciXMouVqmW8/T3rw5GhU4yKZnT/ViIDfxPMvue6lIlbOtAL7ttMHnuZKowXWCKCf75uuXMF6h5eRWhyuYU+TBDiKPRIN+QzLssWtbLE8og8IEY1mkhfdPTXQv+aC271oPD+xee0uc5//AKUwUDiAehE8zOvyWU6yYnj1K6vBfLbqvZ3folf4TYqL7loiOYSnc0syNuTiDxH9ieKwJOWCu95NehR+hGE7FaRNh+AbM/qmntMwX8O/qyTGk4TVLbCWO0SFijjH4HJI45gBOD8uzKIYu6gyYwRzsfPyr013kzZeoub1eMAh3ujULnbpPqqtv2Vw=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccaf496-6e73-471e-fca5-08d6b9ed7b30
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 17:38:14.8722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5447
Subject: [PATCH v3 2/6] libfann: Initial commit
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
X-List-Received-Date: Fri, 05 Apr 2019 17:38:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VXNlIHRoZSBjdXJyZW50IG1hc3RlciBicmFuY2ggaW5zdGVhZCBvZiB0aGUgbGFzdCByZWxlYXNl
IGluIDIwMTMuDQoNClNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZy
YW5jaXNAd2RjLmNvbT4NCi0tLQ0KIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYmZhbm4vbGli
ZmFubl9naXQuYmIgfCAxNSArKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9s
aWJmYW5uL2xpYmZhbm5fZ2l0LmJiDQoNCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3Vw
cG9ydC9saWJmYW5uL2xpYmZhbm5fZ2l0LmJiIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbGli
ZmFubi9saWJmYW5uX2dpdC5iYg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAw
MC4uOTQzYmRjOGM5DQotLS0gL2Rldi9udWxsDQorKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9saWJmYW5uL2xpYmZhbm5fZ2l0LmJiDQpAQCAtMCwwICsxLDE1IEBADQorU1VNTUFSWSA9ICJG
YXN0IEFydGlmaWNpYWwgTmV1cmFsIE5ldHdvcmsgKEZBTk4pIExpYnJhcnkiDQorREVTQ1JJUFRJ
T04gPSAiRmFzdCBBcnRpZmljaWFsIE5ldXJhbCBOZXR3b3JrIChGQU5OKSBMaWJyYXJ5IGlzIGEg
ZnJlZSBvcGVuIHNvdXJjZSBuZXVyYWwgbmV0d29yayBsaWJyYXJ5LCB3aGljaCBpbXBsZW1lbnRz
IG11bHRpbGF5ZXIgYXJ0aWZpY2lhbCBuZXVyYWwgbmV0d29ya3MgaW4gQyB3aXRoIHN1cHBvcnQg
Zm9yIGJvdGggZnVsbHkgY29ubmVjdGVkIGFuZCBzcGFyc2VseSBjb25uZWN0ZWQgbmV0d29ya3Mu
Ig0KK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9saWJmYW5uL2Zhbm4iDQorU0VDVElP
TiA9ICJsaWJzL2RldmVsIg0KKw0KK0xJQ0VOU0UgPSAiTEdQTHYyLjEiDQorTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9ZjE0NTk5YTJmMDg5ZjZmZjhjOTdlMmJhYTRl
M2Q1NzUiDQorDQoraW5oZXJpdCBjbWFrZQ0KKw0KK1NSQ1JFViA9ICI3ZWMxZmM3ZTViZDczNGYx
ZDNjODliMDk1ZTYzMGU4M2M4NmI5YmUxIg0KK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9s
aWJmYW5uL2Zhbm4uZ2l0O2JyYW5jaD1tYXN0ZXIgXA0KKyAgICAgICAgICAiDQorDQorUyA9ICIk
e1dPUktESVJ9L2dpdCINCi0tIA0KMi4yMS4wDQoNCg==

