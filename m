Return-Path: <prvs=989330698=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 74E427D42E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 23:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554334422; x=1585870422;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=w0BLJuDgpFAOiKVw0LJjV8VX+x+f337RDeagNp5geac=;
	b=GEzLayIq6Eo67pZ2fOYasKp+nPkdHr64ZEL5lhU2XUjy4BCDmH4HCRb0
	3+9Ylxld57+uf0V9gw/Eti28TwZF72zQqVaeoJXVIG3rhflpgWPWBbMrK
	60/aAb+zb1T7XfDp20ijDwcuDXMfX4Ecw7bcJrajSpn5Pv0PHBFwUl7Ta
	yXrbPONw3aRCT06b+tGiZZLmBPZckkVei9E/9mY+TL8XwNSs8z68Upr8L
	t0w53WcpJWY4JeZdAK2x+SViH7+GdBa+HfRdMZ3OKWot+TYGumboTBQ/f
	KMzsS83U9HrRMNlj3SqRDdIoH7VReJ2Zgw05f05fxBKs5ogQ1pztdn/Ms Q==;
X-IronPort-AV: E=Sophos;i="5.60,306,1549900800"; d="scan'208";a="104935958"
Received: from mail-dm3nam03lp2053.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.53])
	by ob1.hgst.iphmx.com with ESMTP; 04 Apr 2019 07:26:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=w0BLJuDgpFAOiKVw0LJjV8VX+x+f337RDeagNp5geac=;
	b=onE+dIGT4XFf3hAJTGjNOt/tQM21wuiHcsLKC27N5TEBI4PeAPjlKmb+kuUGjF/1fKBl5zc3A5BLyMw1A+iOIoyru9R8DYgDYKjosOQLdntGtD20mu6W7sZPWVnw+bP+Cb14Fveps+157aHUXPU5kQgDFTTbD7MhFV1mUKBtTHo=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB6085.namprd04.prod.outlook.com (20.178.234.31) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.13; Wed, 3 Apr 2019 23:26:34 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Wed, 3 Apr 2019 23:26:34 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 5/6] python3-xxhash: Initial commit
Thread-Index: AQHU6nSstzTHjbGjCU+GOveW4PVEFw==
Date: Wed, 3 Apr 2019 23:26:33 +0000
Message-ID: <20190403232520.27463-5-alistair.francis@wdc.com>
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
x-ms-office365-filtering-correlation-id: 807eab61-bb60-44a2-e459-08d6b88bcef4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR04MB6085; 
x-ms-traffictypediagnostic: BYAPR04MB6085:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB60855710795E1A804932225490570@BYAPR04MB6085.namprd04.prod.outlook.com>
x-forefront-prvs: 0996D1900D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(396003)(136003)(366004)(39860400002)(189003)(199004)(316002)(2616005)(446003)(476003)(486006)(11346002)(54906003)(76176011)(52116002)(3846002)(186003)(99286004)(386003)(6506007)(6116002)(66066001)(26005)(36756003)(8936002)(4326008)(7736002)(50226002)(25786009)(102836004)(97736004)(81166006)(81156014)(8676002)(305945005)(6916009)(2351001)(2906002)(106356001)(105586002)(6486002)(14454004)(86362001)(5640700003)(53936002)(6512007)(256004)(5660300002)(2501003)(71190400001)(1076003)(44832011)(72206003)(6436002)(71200400001)(478600001)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB6085;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9t8CBDWQ+zIf7amSow6r9+DixAb2ywHomAOiQQ0vxveSlc2F6Z+pmWMxhLKyf4yNxrXUO38r8nX8G5WrsIKy39vGLF7dxCjAn4OFdPv+eUWAmWXCsvJoqwcZ5s5CuxxCjW7k/6DkUe1eHfQ0z5WSPzHcRplsIOON7sosUE43ImC7CPlIhrrZQO09c1UJzRz1Q50GH/VcwLQmTe3s+/oFxWdQN4ZT59CUagqbcSI6jSUHkAE/ggcxXHtFHKidrBeZXgqSOFwI2OelxZdnRVJkUzBvcQYwRnsqp7wQS7fpLWQckA9TbPw7Q0+CvPWxlRklws+lf3xXcQHN04E7f8XcCuioRdmrg2khMhMqfR5tvGmYaGJiRXjx6TeZ8FIVBbYUrNQ4JVwe1GFgGErN24VvloVLKKELegXKHOwOkPRbgvw=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807eab61-bb60-44a2-e459-08d6b88bcef4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2019 23:26:33.4406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6085
Subject: [meta-python][PATCH 5/6] python3-xxhash: Initial commit
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

