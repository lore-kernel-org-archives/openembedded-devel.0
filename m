Return-Path: <prvs=989330698=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3807D429
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 23:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554334421; x=1585870421;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=GpTBc77B+I0+Hf3UtWKtbJ/8cUSD1rUfaxTlVUg8Wx0=;
	b=TtsxNmEqmDAPPJrL6daXZxWYF2vrE5iQu1oGnddiuOaZi2JUPo9mKu0U
	5FGwfIGK6y9dzU3zXoRfgih0hOH9Nm+1+fOUePD7nk6f91t7B00S4QfAw
	yzLOMhh4ihbykyocF6UMd98bOq4GGk4sI1vRipI9kym3eT3Lrlq+XzNGs
	gDh+FOwAZKD7qNYuxc3MMAIZKtFKqk8KZD4nuB8B9dXMvdbJVa9q5pUH1
	/8K6qb1hNtG/URRktN9xijxNJ7RwMKZsyzi9Hhf1+nOu0zRw/6ITbLxHn
	Bz+7fqkZrgy1ZKdBDcpm13zj13YZgK0UfmVJBrxTMlN7xaXXeh6cwcJo6 g==;
X-IronPort-AV: E=Sophos;i="5.60,306,1549900800"; d="scan'208";a="104935957"
Received: from mail-dm3nam03lp2053.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.53])
	by ob1.hgst.iphmx.com with ESMTP; 04 Apr 2019 07:26:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GpTBc77B+I0+Hf3UtWKtbJ/8cUSD1rUfaxTlVUg8Wx0=;
	b=Sf0HSRO72AnNetzTLqtsA8KAtpgr6OFaKxMj0TyxQPadHaFizU1dEUWIkT/MXRgZr9YWS9AfIN/PoG/hT4pbSEkPe0jNH61IYG9c9H0vF0U9ByoeK/WZ7AAqVruci9sVm3FtRU2TpXPnJGJDmnJyn6rEQCdyzrOu6e49cqgbNls=
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
Thread-Topic: [meta-python][PATCH 4/6] python3-pocketsphinx: Initial commit
Thread-Index: AQHU6nSs1OvnzQiHvky1QhCy9YJBig==
Date: Wed, 3 Apr 2019 23:26:33 +0000
Message-ID: <20190403232520.27463-4-alistair.francis@wdc.com>
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
x-ms-office365-filtering-correlation-id: 7116e95c-7874-4c31-ec59-08d6b88bcebd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR04MB6085; 
x-ms-traffictypediagnostic: BYAPR04MB6085:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB60854C3AACA89A15DE84510D90570@BYAPR04MB6085.namprd04.prod.outlook.com>
x-forefront-prvs: 0996D1900D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(396003)(136003)(366004)(39860400002)(189003)(199004)(316002)(2616005)(446003)(476003)(486006)(11346002)(54906003)(76176011)(52116002)(3846002)(186003)(99286004)(386003)(6506007)(6116002)(66066001)(26005)(36756003)(8936002)(4326008)(7736002)(50226002)(25786009)(102836004)(97736004)(81166006)(81156014)(8676002)(305945005)(6916009)(2351001)(2906002)(106356001)(105586002)(6486002)(14454004)(86362001)(5640700003)(53936002)(6512007)(256004)(5660300002)(2501003)(71190400001)(1076003)(44832011)(72206003)(6436002)(71200400001)(478600001)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB6085;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gZ9DRcWQ2u+Irfnkr6x81DqhDIJpsEi0k3lJEtmGEuTCbRXNYefg/xiE5+1yhJ4fnQyv1j324L5Z+VMbNAu7d5lJu5FiT3qtO3V8cX8wO/z3iR02XHVNU271qiuNWtozhSgUQvynwRnKgP1xDt/ZYL1jV1dnphBoz6uTht/g8LmySfqCu95/chiD0kBRY38SurCmCIad83Hmr0ECta1b6yoECJAFmK09DRl2kIbi/xPNZcLVZPkCltiEoNf+AXLX7L/6RdgJOToiPsQkRDk5lB0UAMyy6FdJxTuk+HZFe3i/LyCjI+HJLFKerbVSkfuClc/LijJN2wkb4MVtsI0m+94DCloPvSpWz7iBzbxr3dTcMRLYi1/IXFZh4pUmae8MTWByraY6QHRHUggyYm0fkU+S2oDZgdq1TFenctSF7sU=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7116e95c-7874-4c31-ec59-08d6b88bcebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2019 23:26:33.0433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6085
Subject: [meta-python][PATCH 4/6] python3-pocketsphinx: Initial commit
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
Pg0KLS0tDQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1wb2NrZXRzcGhpbngu
aW5jICAgICAgfCA5ICsrKysrKysrKw0KIC4uLi9weXRob24vcHl0aG9uMy1wb2NrZXRzcGhpbnhf
MC4xLjAuYmIgICAgICAgICAgICAgICAgIHwgMiArKw0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24tcG9ja2V0c3BoaW54LmluYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBt
ZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBvY2tldHNwaGlueF8w
LjEuMC5iYg0KDQpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uLXBvY2tldHNwaGlueC5pbmMgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24tcG9ja2V0c3BoaW54LmluYw0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmlu
ZGV4IDAwMDAwMDAwMC4uNGM4NDhiNmRkDQotLS0gL2Rldi9udWxsDQorKysgYi9tZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcG9ja2V0c3BoaW54LmluYw0KQEAgLTAs
MCArMSw5IEBADQorU1VNTUFSWSA9ICJUaGlzIHBhY2thZ2UgcHJvdmlkZXMgYSBweXRob24gaW50
ZXJmYWNlIHRvIENNVSBTcGhpbnhiYXNlIGFuZCBQb2NrZXRzcGhpbnggbGlicmFyaWVzIGNyZWF0
ZWQgd2l0aCBTV0lHIGFuZCBTZXR1cHRvb2xzLiINCitTRUNUSU9OID0gImRldmVsL3B5dGhvbiIN
CitMSUNFTlNFID0gIkJTRCINCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT04MjZlYmRhNzg3ZWI0OGU3OGFlYzI2MjRmOWZhYmE3MiINCisNCitTUkNfVVJJW21kNXN1bV0g
PSAiYzBmMmJmZDU0YmM0YzQzOGMzYmI2NDgyNWY1N2Q1NzUiDQorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjJjYzQ5M2VkNDhjMTMwMWUwZDJlNjliMTM3ZGM2NDZjMmY4Y2FjYTE5MGVmNGJjZTYxODM2
ZWFjOTZkMTc5NmYiDQorDQorREVQRU5EUyArPSAic3dpZy1uYXRpdmUiDQpkaWZmIC0tZ2l0IGEv
bWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2NrZXRzcGhpbnhf
MC4xLjAuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBv
Y2tldHNwaGlueF8wLjEuMC5iYg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAw
MC4uMjI3NWQxYjUwDQotLS0gL2Rldi9udWxsDQorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBvY2tldHNwaGlueF8wLjEuMC5iYg0KQEAgLTAsMCArMSwy
IEBADQorcmVxdWlyZSBweXRob24tcG9ja2V0c3BoaW54LmluYw0KK2luaGVyaXQgcHlwaSBzZXR1
cHRvb2xzMw0KLS0gDQoyLjIxLjANCg0K

