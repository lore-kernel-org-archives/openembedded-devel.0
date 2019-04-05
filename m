Return-Path: <prvs=991f25a9b=Alistair.Francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 99BAD7D5C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554475741; x=1586011741;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=kZEDMJvit7eOfFIPyVeeeBcbSHZnZfaH1Ka4wAnH2j8=;
	b=kLuMC45iN6f/NNR7SB0jpeqAeio72Mc7k+R9xth3tXNSxE4zFhfYZA+a
	9RBjHj8jxK7L4dGelYG2AgBRwvWhTB4gV7h02B/ecF8VmwuSTlsvOWQDP
	xzY0gjoLcTfm3f3QuvNTzhai3ToT1VEqQbWEpnpr6Rg5aE2b5ZNsphRnr
	YtWDSoR0pb+wpe2RnmvrBV3w36CT19BtknjuxAYFkbhzwuD6Bxg2T+TKH
	u05mtbAj8udiUetLmkuj8Gu2iIb460wkKcyWcJJRmj0wORmfd+avoDVbh
	zGHplsTzFyq7ozgAG189MnWo0mw2H7fNMDvnW9udWAkeZ2kymHLBugaiQ A==;
X-IronPort-AV: E=Sophos;i="5.60,313,1549900800"; d="scan'208";a="210852619"
Received: from mail-by2nam03lp2057.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.57])
	by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2019 22:41:54 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kZEDMJvit7eOfFIPyVeeeBcbSHZnZfaH1Ka4wAnH2j8=;
	b=DqMa8SwkqitmTcEWbng9lk1fPfYy7YYOYnMTPHj+SrZC6oStrHBnwbUZXaSev1UHij3JRI8PpglHUTp9WKcmzbo/ncLEgDjSBo+tCdMVZHl3WCfWBMID0D1vkBnHWNcmhV3/kcp+7SsTM12uwRc3KiJTez80z2DgPJF2nAIaE6o=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB3973.namprd04.prod.outlook.com (52.135.215.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.16; Fri, 5 Apr 2019 14:41:52 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 5 Apr 2019 14:41:52 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH v2 2/6] libfann: Initial commit
Thread-Index: AQHU6721+A6CH40rbUqgglQlrKNBUA==
Date: Fri, 5 Apr 2019 14:41:52 +0000
Message-ID: <20190405144039.9121-2-alistair.francis@wdc.com>
References: <20190405144039.9121-1-alistair.francis@wdc.com>
In-Reply-To: <20190405144039.9121-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR08CA0028.namprd08.prod.outlook.com
	(2603:10b6:a03:100::41) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e47bcd67-da1e-457f-5936-08d6b9d4d77e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB3973; 
x-ms-traffictypediagnostic: BYAPR04MB3973:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB3973531FFA1BA101FA225F0890510@BYAPR04MB3973.namprd04.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(136003)(396003)(346002)(366004)(199004)(189003)(446003)(86362001)(476003)(11346002)(316002)(2616005)(256004)(99286004)(66066001)(6116002)(3846002)(44832011)(76176011)(486006)(478600001)(102836004)(72206003)(26005)(2906002)(2501003)(71190400001)(386003)(6506007)(71200400001)(52116002)(14454004)(25786009)(2351001)(6916009)(4326008)(81166006)(68736007)(1076003)(36756003)(5660300002)(186003)(105586002)(106356001)(81156014)(8676002)(6512007)(6306002)(5640700003)(6436002)(8936002)(50226002)(54906003)(53936002)(6486002)(305945005)(7736002)(97736004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB3973;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QKR0hh92u0Pi+0jlOAsUPiw8T7MhCVWp+PCJhZ5Rk8hJpbiyplt7yjZpbLHl0FJDbxCOSvFPf27ufwcJfvngH7+HK2GuYvlRWgbtT8LiRLW723gXnXg46EjjcMPCOgHMSF1JHqnRNuZFreM3JComwBSZW5uTTREKRMaAze5SVcNxB/Dbrxa/pyRerMvL0fFtFe1jic/gp3VKhwhMKkE/ll34IT2JZtakFqzeYR59BA6dKA53dw9LajZrPbhJW5E+jnxw0pYKLbsXVU9Toy+KYWGOSopUQ2fxUojetAfG/mReWLqiCYi3vzb6/G0RL/aYF0rJKDPx2KizDFpTL8HUmSwjM/3fXhEm37VCxG0BE9Ik4QaTwE5Aho8XQoeRhByQpwzYALevh7bqLlIE40/2Wu6Sl83B6UxqdWpjuNBoz8E=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e47bcd67-da1e-457f-5936-08d6b9d4d77e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 14:41:52.3093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3973
Subject: [PATCH v2 2/6] libfann: Initial commit
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
X-List-Received-Date: Fri, 05 Apr 2019 14:48:59 -0000
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

