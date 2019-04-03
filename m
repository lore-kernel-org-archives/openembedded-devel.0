Return-Path: <prvs=989330698=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id EE2087D429
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 23:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554334421; x=1585870421;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=kZEDMJvit7eOfFIPyVeeeBcbSHZnZfaH1Ka4wAnH2j8=;
	b=C5zpOMA61vDYzJKOjuQbUsgoA/s4rSW3iOahxeJ/YE5TxCmk8EFwPQOX
	DbPS/tQNScfFLmTtyNJgiISyiYch2JhTeR83BtynWRftAuLUa7fKwxp5p
	v6l1+Fip3ODF1J/BV4Ll0+NvDjzX4zeHinb2eMvW1lZFkWH0deUMm7t4O
	qwE+xMvxO3U5xeUv4XClGDtsEQKi/cYXB6FkDhgYu7L9/s6uuA5bN63iC
	QR2zSolR9GXGgq0CPuqEwpL7O0dbVx03WWueC4KHXcjgXtD1EIJwhkLnG
	7WnNfzhezguHPbA8jrF7lCr0bNR+xEr3qddzhw/uX+HrmM3/2QRVVFRb1 w==;
X-IronPort-AV: E=Sophos;i="5.60,306,1549900800"; d="scan'208";a="104935955"
Received: from mail-dm3nam03lp2053.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.53])
	by ob1.hgst.iphmx.com with ESMTP; 04 Apr 2019 07:26:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kZEDMJvit7eOfFIPyVeeeBcbSHZnZfaH1Ka4wAnH2j8=;
	b=EKJ0rbgOkO5vEf5kchhdUy3VEJcMrYg/OXt4inbMGB0ZN/cAO/tIF6J/3eirXNzyiou2cGAKetEx1gh58dvRa9d0YKlzpbOE/E1vv+H52lsxyYvObLjnu2HricuSeTpJiN7hl8m3+yxpkdKcBWFCsvGMlFQE4nmo03xxtAUiuUo=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB6085.namprd04.prod.outlook.com (20.178.234.31) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.13; Wed, 3 Apr 2019 23:26:32 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Wed, 3 Apr 2019 23:26:32 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 2/6] libfann: Initial commit
Thread-Index: AQHU6nSrZYUaDgdxWk+G4EDHzksPFw==
Date: Wed, 3 Apr 2019 23:26:32 +0000
Message-ID: <20190403232520.27463-2-alistair.francis@wdc.com>
References: <20190403232520.27463-1-alistair.francis@wdc.com>
In-Reply-To: <20190403232520.27463-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR04CA0009.namprd04.prod.outlook.com
	(2603:10b6:a03:40::22) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fae21118-b379-4117-108f-08d6b88bce27
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR04MB6085; 
x-ms-traffictypediagnostic: BYAPR04MB6085:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB6085E4BC6C1ACCA08F417CCC90570@BYAPR04MB6085.namprd04.prod.outlook.com>
x-forefront-prvs: 0996D1900D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(396003)(136003)(366004)(39860400002)(189003)(199004)(316002)(2616005)(446003)(476003)(486006)(11346002)(54906003)(76176011)(52116002)(3846002)(186003)(99286004)(386003)(6506007)(6116002)(66066001)(26005)(36756003)(8936002)(4326008)(7736002)(50226002)(25786009)(102836004)(97736004)(81166006)(81156014)(8676002)(305945005)(6916009)(2351001)(2906002)(106356001)(105586002)(6486002)(14454004)(86362001)(5640700003)(53936002)(6306002)(6512007)(256004)(5660300002)(2501003)(71190400001)(1076003)(44832011)(72206003)(6436002)(71200400001)(478600001)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB6085;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Lnq85C4Fq4w2hGpSvnM3gbgWD8UbPUqMzTtj8w2v3KLQ0o/YzYSLFHFZbRR3fPveqrmQFZKs1HQ+pGb3z0FsRqcoo8PSEyRYh9hX04/UOHoC2LPR+WexuNbi2uKFbqaF0c/9kR6cWnTN+pnvMQYf/jmV0BpfV+1QxcgSnJAaQH2ulT/Cs9Ago15Ss25ZVROv3BHgCA9kZe5HBfmmiDS+/smPOfwGQcRqmUGaEeESml7h1pAaIGFsenpiZ4cZvbxJewruFpm74o6Cv9ei7SSAaFODYgZ0WS9AIEOvksUOEEZHJwPw3SLCusGRREAtr3tGMBvNp/gQAGzFQtYfjGYDiRHHla4/b/GIO0AWw/9+szsd2FLucMbRSlOWlWu70mm4tdcFaLnrZjbcW1fDqdGf+LFqtLJZya4GTIr0axmUZmg=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae21118-b379-4117-108f-08d6b88bce27
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2019 23:26:32.2638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6085
Subject: [meta-oe][PATCH 2/6] libfann: Initial commit
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
X-List-Received-Date: Wed, 03 Apr 2019 23:33:39 -0000
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
MC4uODdkNzkwMmJiDQotLS0gL2Rldi9udWxsDQorKysgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9saWJmYW5uL2xpYmZhbm5fZ2l0LmJiDQpAQCAtMCwwICsxLDE1IEBADQorU1VNTUFSWSA9ICJG
YXN0IEFydGlmaWNpYWwgTmV1cmFsIE5ldHdvcmsgKEZBTk4pIExpYnJhcnkiDQorREVTQ1JJUFRJ
T04gPSAiRmFzdCBBcnRpZmljaWFsIE5ldXJhbCBOZXR3b3JrIChGQU5OKSBMaWJyYXJ5IGlzIGEg
ZnJlZSBvcGVuIHNvdXJjZSBuZXVyYWwgbmV0d29yayBsaWJyYXJ5LCB3aGljaCBpbXBsZW1lbnRz
IG11bHRpbGF5ZXIgYXJ0aWZpY2lhbCBuZXVyYWwgbmV0d29ya3MgaW4gQyB3aXRoIHN1cHBvcnQg
Zm9yIGJvdGggZnVsbHkgY29ubmVjdGVkIGFuZCBzcGFyc2VseSBjb25uZWN0ZWQgbmV0d29ya3Mu
Ig0KK0hPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9saWJmYW5uL2Zhbm4iDQorU0VDVElP
TiA9ICJsaWJzL2RldmVsIg0KKw0KK0xJQ0VOU0UgPSAiTEdQTHYyLjEiDQorTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9ZjE0NTk5YTJmMDg5ZjZmZjhjOTdlMmJhYTRl
M2Q1NzUiDQorDQoraW5oZXJpdCBjbWFrZQ0KKw0KK1NSQ1JFViA9ICIke0FVVE9SRVZ9Ig0KK1NS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saWJmYW5uL2Zhbm4uZ2l0O2JyYW5jaD1tYXN0ZXIg
XA0KKyAgICAgICAgICAiDQorDQorUyA9ICIke1dPUktESVJ9L2dpdCINCi0tIA0KMi4yMS4wDQoN
Cg==

