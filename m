Return-Path: <prvs=991f25a9b=Alistair.Francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id C2DD07D5B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554475741; x=1586011741;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=GpTBc77B+I0+Hf3UtWKtbJ/8cUSD1rUfaxTlVUg8Wx0=;
	b=U3t/MVvoo2oFMwC0zArNxSo763TEuUMZscidEjfxE02fT0+kSXRTi+Zh
	+1psfKO5k0eyzcLAiQJ6ugv5kw3zOYGw0GPnYpWh6ZkqHcH9WcIwF1+OF
	nyfJGocbMYDvpmDtL9OI+hB115O68wFMpIEHdXlLMsfYYE0BpsxpUkiEV
	oEZ7dwsj5fgFSAdrJ+NbATeKVA0ZiMx7mG7QRMY7c11bW8lQTKF7H/oI5
	8nSQTR/9jAbVd8NoGqBSpUQBxJc05HXTvbqzBGPE/MiZ8LS6PV9k+AfR3
	KClKtd+mMYaOvLoC0Av4TfEf4A3ybZQL1l70pcIE8fD0KkvX0T2o7Bi1B w==;
X-IronPort-AV: E=Sophos;i="5.60,313,1549900800"; d="scan'208";a="210852623"
Received: from mail-by2nam03lp2056.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.56])
	by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2019 22:41:55 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GpTBc77B+I0+Hf3UtWKtbJ/8cUSD1rUfaxTlVUg8Wx0=;
	b=MEdIC9FOqmPKKeCAiEivkwr3n+OCQHHa62wZnCYbndD8K7xH3kvdrg+8zs0IchDH2fDS1kZJGr2xZ3TRv1XKh5AjfqksAVbPZDDiAt8f330lrNA2SidRzMwem6pjanwygFVXlegKsc22d3fa3XX8xxfiHerJ5O8H2DiYWGiGHvI=
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
Thread-Topic: [PATCH v2 4/6] python3-pocketsphinx: Initial commit
Thread-Index: AQHU6721iJD/8p5BqkmoqUh4JhfZ/Q==
Date: Fri, 5 Apr 2019 14:41:53 +0000
Message-ID: <20190405144039.9121-4-alistair.francis@wdc.com>
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
x-ms-office365-filtering-correlation-id: 0ad78f83-dc22-4180-3162-08d6b9d4d822
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB3973; 
x-ms-traffictypediagnostic: BYAPR04MB3973:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB3973176D14451815A115E44D90510@BYAPR04MB3973.namprd04.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(136003)(396003)(346002)(366004)(199004)(189003)(446003)(86362001)(476003)(11346002)(316002)(2616005)(256004)(99286004)(66066001)(6116002)(3846002)(44832011)(76176011)(486006)(478600001)(102836004)(72206003)(26005)(2906002)(2501003)(71190400001)(386003)(6506007)(71200400001)(52116002)(14454004)(25786009)(2351001)(6916009)(4326008)(81166006)(68736007)(1076003)(36756003)(5660300002)(186003)(105586002)(106356001)(81156014)(8676002)(6512007)(5640700003)(6436002)(8936002)(50226002)(54906003)(53936002)(6486002)(305945005)(7736002)(97736004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB3973;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jlZYoC1Or49tTWN/O9v/ygjcDaJABoMUKIQUxiG9TxTP0YT4ybKeAIfISzD6VHl5rQ+6n7ZL3O7NA8Xud3uTHBz4EdJZbkPtT0qcuYTLw4cnOp3ZXCDRhzqgtPIsfwh+5936/wBQWW3wcKiy4MAx0peV5+t2t/JejtX2WuSNZKeYGSfDddATry0fMe69u/zf674nGSF5bnGnEFr1d+Zv4/yqJO33L/Je9tHynkdnA4PdZgaP7iFACvtW5/VLX3UycfiSrDiQSTmPaDo9i5rTMj0rIOIywwu/djSBvg57/iK//CN1TtqrI8dfxWuKm0s7SG/jbiqlCgp19FkWkB2AMFAajbxDp25E7UOXzNu3RZ0XzQWLY9JDUruKNBDuHWxWgQpGmL1X3bhvpCAvSyJcqX4y3y4Cx4PXnMrbnt+CDCw=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad78f83-dc22-4180-3162-08d6b9d4d822
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 14:41:53.4041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3973
Subject: [PATCH v2 4/6] python3-pocketsphinx: Initial commit
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

