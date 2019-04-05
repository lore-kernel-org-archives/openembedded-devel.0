Return-Path: <prvs=991f25a9b=Alistair.Francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id C6C176C4DA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554502107; x=1586038107;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=y2j0cMfhJmE8TqtrFZ6c9Q7NzmlR/asYs3YcM2eXNSc=;
	b=ID1XJ0J7kFWOc3Tt9sioWLNnNmnTOnqU9mY3qg2dT5ykGqMeaj9cUfTf
	+u2nK3P9I8sXKqc2h/9w+4F9dpW0/Cqe1XFOh0V5YWLvLY3JuA0E4DrXK
	sKdYQWfXiVfH7q76R/eZxWJAVJBbyAeXlJsGVbbcyrz8mXGhbkpUYkpS6
	wspZKxspsJHLRzFZ5zbeQ3OZFewUntamLnl9eQPGrKs3NB9oRaR6Sjhz9
	n3Hxs9xrWJAeTnWqDDpnA32zDvGiOW4F2VJReFgSVuz9V1OQjUErxT4tD
	zr/liz1SUFwJIAzST/J/fJFrRoRfsoIzkIOK8Hzi9wntMTfQ0WpvxrQWz A==;
X-IronPort-AV: E=Sophos;i="5.60,313,1549900800"; d="scan'208";a="110175346"
Received: from mail-sn1nam01lp2052.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.52])
	by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2019 06:08:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y2j0cMfhJmE8TqtrFZ6c9Q7NzmlR/asYs3YcM2eXNSc=;
	b=BnOq/skC7Ol6OZkNs3O+k+UyRlivvla7deoXPUjNntwM1vNl0VgY42JKVz/azxFi648RS2J8MUvGfCr6ZcY3J/6dJOBze5XW6Bsfo4gSbbpIzSOeZdkL2D0g5X5n9T6/YBgGare61a5tmWhTg/tuFYZdRcWnsCeBOL3PIuzSIA0=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5959.namprd04.prod.outlook.com (20.178.232.207) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.15; Fri, 5 Apr 2019 22:08:22 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 5 Apr 2019 22:08:22 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH] python-cryptography: Bump from 2.4.1 to
	2.6.1
Thread-Index: AQHU6/wUD03wEJ3Cfk6rPpW0bQH53w==
Date: Fri, 5 Apr 2019 22:08:21 +0000
Message-ID: <20190405220711.12794-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR11CA0082.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::23) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fd1dfd5-c113-45e1-a31b-08d6ba1336f3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5959; 
x-ms-traffictypediagnostic: BYAPR04MB5959:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5959C7548D67DD4A082A337190510@BYAPR04MB5959.namprd04.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(36756003)(478600001)(5640700003)(6512007)(50226002)(4326008)(53936002)(6916009)(256004)(99286004)(6436002)(2501003)(72206003)(6486002)(8676002)(52116002)(86362001)(81156014)(81166006)(54906003)(2906002)(25786009)(316002)(6116002)(8936002)(97736004)(3846002)(2351001)(105586002)(26005)(7736002)(1076003)(102836004)(6506007)(386003)(5660300002)(186003)(106356001)(44832011)(476003)(14454004)(66066001)(68736007)(71200400001)(2616005)(486006)(305945005)(71190400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5959;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /5DSuP/eBdp/J7GPbrC7Sh6a43RBL3UrAZ88wt2q0MtvkBvHqR/ClHCTD+S0tJOy+Dru0WFP/AlKPgu4zYUbOU2n+aTteYN7ZcK0gMqYaBN7Qoftjaabk7cB5eHyqsEdKeMFYe6OTn1fwWmZ8whcs2WZ/5eTcUJdNkxO+EGlqv3KeJIXOWLj8UDceQYzMDatgZ7pBkTQbvpIdJJgsBUj3ziRvoFg7xbWIpBShtUckn2DSlinpFlsh3NyWdg46Jnbf2Vsox8amx2SbKqxn4GSI2vHCKbpv4Aj1i2yT8GdbqHCiNSqUQTBnXLOIffJbTAi2h6owz19w5EKsLPVYRKYStyDoMunoRVhUoMos7773u3dGnvb6Xbwl2sBonRmU/4PUEsVdD6t86+ukApik9/OwXultPD7wiEx2cbKZQ9lBTk=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd1dfd5-c113-45e1-a31b-08d6ba1336f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 22:08:22.1064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5959
Subject: [meta-python][PATCH] python-cryptography: Bump from 2.4.1 to 2.6.1
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
X-List-Received-Date: Fri, 05 Apr 2019 22:08:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29t
Pg0KLS0tDQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jcnlwdG9ncmFwaHkt
dmVjdG9ycy5pbmMgICB8IDQgKystLQ0KIC4uLi12ZWN0b3JzXzIuNC4xLmJiID0+IHB5dGhvbi1j
cnlwdG9ncmFwaHktdmVjdG9yc18yLjYuMS5iYn0gfCAwDQogbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uLWNyeXB0b2dyYXBoeS5pbmMgICB8IDQgKystLQ0KIC4uLmhv
bi1jcnlwdG9ncmFwaHlfMi40LjEuYmIgPT4gcHl0aG9uLWNyeXB0b2dyYXBoeV8yLjYuMS5iYn0g
fCAwDQogLi4udmVjdG9yc18yLjQuMS5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3Jz
XzIuNi4xLmJifSB8IDANCiAuLi5uMy1jcnlwdG9ncmFwaHlfMi40LjEuYmIgPT4gcHl0aG9uMy1j
cnlwdG9ncmFwaHlfMi42LjEuYmJ9IHwgMA0KIDYgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KIHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi97cHl0aG9uLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzIuNC4xLmJiID0+IHB5dGhvbi1j
cnlwdG9ncmFwaHktdmVjdG9yc18yLjYuMS5iYn0gKDEwMCUpDQogcmVuYW1lIG1ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24tY3J5cHRvZ3JhcGh5XzIuNC4xLmJiID0+
IHB5dGhvbi1jcnlwdG9ncmFwaHlfMi42LjEuYmJ9ICgxMDAlKQ0KIHJlbmFtZSBtZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18y
LjQuMS5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzIuNi4xLmJifSAoMTAwJSkN
CiByZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY3J5
cHRvZ3JhcGh5XzIuNC4xLmJiID0+IHB5dGhvbjMtY3J5cHRvZ3JhcGh5XzIuNi4xLmJifSAoMTAw
JSkNCg0KZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbi1jcnlwdG9ncmFwaHktdmVjdG9ycy5pbmMgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24tY3J5cHRvZ3JhcGh5LXZlY3RvcnMuaW5jDQppbmRleCAwNDE3M2Yw
NjcuLjBkOTYzODg0NSAxMDA2NDQNCi0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbi1jcnlwdG9ncmFwaHktdmVjdG9ycy5pbmMNCisrKyBiL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jcnlwdG9ncmFwaHktdmVjdG9ycy5pbmMN
CkBAIC04LDggKzgsOCBAQCBERVBFTkRTICs9ICIgXA0KICAgICAke1BZVEhPTl9QTn0tY3J5cHRv
Z3JhcGh5IFwNCiAiDQogDQotU1JDX1VSSVttZDVzdW1dID0gImU3ZjQ0YjE2NzhlMzA3MWUyMDQ0
YTMyZjdjMzUzZDE0Ig0KLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4MjlkNDNlODA2NjA1NmRlOGVh
N2I4YWQzMTFkYjc5ZTQ3ZDhkNjU4ZTIzZDVmNWZjNGIwMjQ1YTFiM2JhYTc0Ig0KK1NSQ19VUklb
bWQ1c3VtXSA9ICJmOGIxNjY2NTJlN2E5ZDY2OGI4NTFiMjhlNDQxNzA1NyINCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMDNmMzgxMTVkY2NiMjY2ZGQ5NjUzOGY5NDA2NzQ0MmE4Nzc5MzJjMjMyMjY2
MWJkYzViZjI1MDJjNzY2NThhZiINCiANCiBQWVBJX1BBQ0tBR0UgPSAiY3J5cHRvZ3JhcGh5X3Zl
Y3RvcnMiDQogDQpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzIuNC4xLmJiIGIvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzIuNi4xLmJi
DQpzaW1pbGFyaXR5IGluZGV4IDEwMCUNCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jcnlwdG9ncmFwaHktdmVjdG9yc18yLjQuMS5iYg0KcmVu
YW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jcnlwdG9n
cmFwaHktdmVjdG9yc18yLjYuMS5iYg0KZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jcnlwdG9ncmFwaHkuaW5jIGIvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWNyeXB0b2dyYXBoeS5pbmMNCmluZGV4IDJjMWFj
MWM5Zi4uOGEzNjQxMTZkIDEwMDY0NA0KLS0tIGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uLWNyeXB0b2dyYXBoeS5pbmMNCisrKyBiL21ldGEtcHl0aG9uL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jcnlwdG9ncmFwaHkuaW5jDQpAQCAtMTAsOCArMTAs
OCBAQCBERVBFTkRTICs9ICIgXA0KICAgICAke1BZVEhPTl9QTn0tc2l4IFwNCiAiDQogDQotU1JD
X1VSSVttZDVzdW1dID0gIjQ2NGYxODBmZjY0NjIyNzYwY2NhNzE2N2Y5N2IzZmY0Ig0KLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJlODViNDEwODg1YWRkYWViMzFhODY3ZWFiY2VmYzllZjRhN2U5MDRh
ZDQ1ZWFjOWU2MGE3NjNhNTRiMjQ0NjI2Ig0KK1NSQ19VUklbbWQ1c3VtXSA9ICI0MDFjYzgyNjhm
ODk0OTY2NDNkYTNmN2E0OGViNGU4ZSINCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjZjODIxY2Jl
YjY4M2ZhY2I5NjYwNDVlMjA2NDMwMzAyOWQ1NzJhODdlZTY5Y2E1YTFiZjU0YmY1NWY5M2NhNiIN
CiANCiBSREVQRU5EU18ke1BOfSArPSAiIFwNCiAgICAgJHtQWVRIT05fUE59LWNmZmkgXA0KZGlm
ZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jcnlw
dG9ncmFwaHlfMi40LjEuYmIgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24tY3J5cHRvZ3JhcGh5XzIuNi4xLmJiDQpzaW1pbGFyaXR5IGluZGV4IDEwMCUNCnJlbmFt
ZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jcnlwdG9n
cmFwaHlfMi40LjEuYmINCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24tY3J5cHRvZ3JhcGh5XzIuNi4xLmJiDQpkaWZmIC0tZ2l0IGEvbWV0YS1weXRo
b24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18y
LjQuMS5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5
cHRvZ3JhcGh5LXZlY3RvcnNfMi42LjEuYmINCnNpbWlsYXJpdHkgaW5kZXggMTAwJQ0KcmVuYW1l
IGZyb20gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9n
cmFwaHktdmVjdG9yc18yLjQuMS5iYg0KcmVuYW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMi42LjEuYmINCmRpZmYg
LS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeV8yLjQuMS5iYiBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY3J5cHRvZ3JhcGh5XzIuNi4xLmJiDQpzaW1pbGFyaXR5IGluZGV4IDEwMCUNCnJlbmFt
ZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRv
Z3JhcGh5XzIuNC4xLmJiDQpyZW5hbWUgdG8gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHlfMi42LjEuYmINCi0tIA0KMi4yMS4wDQoNCg==

