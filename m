Return-Path: <prvs=991f25a9b=Alistair.Francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id D625C7D5C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554475741; x=1586011741;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=w0BLJuDgpFAOiKVw0LJjV8VX+x+f337RDeagNp5geac=;
	b=eB9aFgR1wktZNFe0jlUSkWPGOzIJSwfPSdOn1gW9rW0DRSJzpG22SljE
	vlc8HNFPOPqAhOcPwgFll+vALbSaZVOpgFTNWLHu+fjI16HfH4lvKV8KT
	LJuB6SbprCq4zPaT5XCnL+XvhB5FpQkI/U7Ejc8HP7uBHHPfPsgBFEtAj
	rG4QidoT4s7Oa82/XfptKBAwWshdyaWA9G0nEl34cwF2VEXf2wunoPCET
	fVViKPmj67dg1vVaKFUKe1mqm0h05iwg0nG7mdvQplg5UiP8UNLlsUDu0
	D1c0QkGP5ZJ0PRX/Zc810I6aQZLSTNPED1dMPjBS3bAF0zbZQA/oY7+Ls g==;
X-IronPort-AV: E=Sophos;i="5.60,313,1549900800"; d="scan'208";a="210852624"
Received: from mail-by2nam03lp2055.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.55])
	by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2019 22:41:55 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=w0BLJuDgpFAOiKVw0LJjV8VX+x+f337RDeagNp5geac=;
	b=otKX4lb5kiXTqT80ppWXT4hoZhoLg0qlsSCwAdkDeB8o7KgQ79FPmTC1TNxC82QaSpTAnyfZsRQQJC7BApLoZu1+z6A0a4y/sCj8DJVF9xa3+o1CsmoBtGKVURMGV+hcW9EajpcpzZvIswbL1DiwE8gA7oryqUHgTyq7OJdWA0Q=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB3973.namprd04.prod.outlook.com (52.135.215.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.16; Fri, 5 Apr 2019 14:41:54 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 5 Apr 2019 14:41:54 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH v2 5/6] python3-xxhash: Initial commit
Thread-Index: AQHU6722YAWi/Si5KU+6AXcHUgzwkw==
Date: Fri, 5 Apr 2019 14:41:54 +0000
Message-ID: <20190405144039.9121-5-alistair.francis@wdc.com>
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
x-ms-office365-filtering-correlation-id: 7c42e545-f915-4d8b-9054-08d6b9d4d875
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB3973; 
x-ms-traffictypediagnostic: BYAPR04MB3973:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB39739DFFA2EB7F317FD04CAD90510@BYAPR04MB3973.namprd04.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(136003)(396003)(346002)(366004)(199004)(189003)(446003)(86362001)(476003)(11346002)(316002)(2616005)(256004)(99286004)(66066001)(6116002)(3846002)(44832011)(76176011)(486006)(478600001)(102836004)(72206003)(26005)(2906002)(2501003)(71190400001)(386003)(6506007)(71200400001)(52116002)(14454004)(25786009)(2351001)(6916009)(4326008)(81166006)(68736007)(1076003)(36756003)(5660300002)(186003)(105586002)(106356001)(81156014)(8676002)(6512007)(5640700003)(6436002)(8936002)(50226002)(54906003)(53936002)(6486002)(305945005)(7736002)(97736004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB3973;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 06EBnxeLqvHy6AGM/wtWXCuRpS+rNkLEZNQP1e/QgkDPQt28lPoB7Ey0FjdYA58hKuyGvYzPPn2av8viPkWyats1SJi3YEc7k91ecaDB+Uca29j59Mxf/HCBciH8BC8fzKaQLyYMkGyZaaqckkWi3k336QFXhh188XxcmvQjWz9QOr7qHeM53PwwnDzAXnU07zDQYrey9cjcaC2PqdgTf/JqczRu8ehU5HNrCSg5NJ2N5JAtaqF518B8d/Taj5L1DzsQ/uuWwgsaIiX6srhiihGJWLexhrL+u07bFGAvOS6QZYm0hQ9YsHGmGvDNvJh5N/XWvoJIJE7XAXNJmUNqsxBuDURminLL0DXeLrogawufiaKcne7Qrpn0QJ0a9ygExYpnGkPfGzWwq/ZPOTKxjD5qe9vQwRDLWJ7j08Nwf2Y=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c42e545-f915-4d8b-9054-08d6b9d4d875
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 14:41:54.4679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3973
Subject: [PATCH v2 5/6] python3-xxhash: Initial commit
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
X-List-Received-Date: Fri, 05 Apr 2019 14:49:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29t
Pg0KLS0tDQogbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXh4aGFz
aC5pbmMgICAgICB8IDcgKysrKysrKw0KIC4uLi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXh4aGFzaF8xLjMuMC5iYiAgICAgICAgfCAyICsrDQogMiBmaWxlcyBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uLXh4aGFzaC5pbmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1w
eXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy14eGhhc2hfMS4zLjAuYmINCg0K
ZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi14
eGhhc2guaW5jIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXh4
aGFzaC5pbmMNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAuLjlkZjQ1MjBm
Nw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uLXh4aGFzaC5pbmMNCkBAIC0wLDAgKzEsNyBAQA0KK1NVTU1BUlkgPSAieHhoYXNo
IGlzIGEgUHl0aG9uIGJpbmRpbmcgZm9yIHRoZSB4eEhhc2ggbGlicmFyeSBieSBZYW5uIENvbGxl
dC4iDQorU0VDVElPTiA9ICJkZXZlbC9weXRob24iDQorTElDRU5TRSA9ICJCU0QiDQorTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZDJjNmRiNTg4N2NjNmIyZmFjOGI3MDFk
NjRjYjg0NDIiDQorDQorU1JDX1VSSVttZDVzdW1dID0gImE0Mjg5YWEwMTgzOWYzZWExZmI5ODky
OWQ5MTMxMDAxIg0KK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmZTIxZjIzYTlkMDU0MjhjNzU0NjE3
OTBiNjcwZjJiZjE1ZjUwYTYzMmQ2YzE3MWE3ZTdiNTg4MjY5YzYxOWU2Ig0KZGlmZiAtLWdpdCBh
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMteHhoYXNoXzEuMy4w
LmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy14eGhhc2hf
MS4zLjAuYmINCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAuLjc2YmM0MWEx
MQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy14eGhhc2hfMS4zLjAuYmINCkBAIC0wLDAgKzEsMiBAQA0KK3JlcXVpcmUgcHl0
aG9uLXh4aGFzaC5pbmMNCitpbmhlcml0IHB5cGkgc2V0dXB0b29sczMNCi0tIA0KMi4yMS4wDQoN
Cg==

