Return-Path: <prvs=989330698=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 20AA47D41E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 23:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554334421; x=1585870421;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=6p0FwbjV3MRhuCcXX12KacbM7z6aQ83+/8mz4QNa2/w=;
	b=WqOhOUM/juuSLW1zenT6usMIYx9IUuyjzxFKfdquhyAcKdAdse6KgLpI
	4mU6CWOSl7CGD1TE3S4lc7HgTo4H7XIfyRg/SMUWEoyRRPfkAzJYfkCt2
	lg0xVsRUADOQm9YrLebVjwJIh0hT4wEYBom035aPht6Ok25QvtWUpOfBq
	eNTF9CfCPsMEkce5aeKDqwiCITAjwkYsFio1jb8LikfqD6Jo2xjVWZoFx
	hlj8t91YHrzTC6ZdrPCKHcSIw2inC/9xhahIFjXEV89klct+Kx7OrqRol
	dgWz24fk/qOn3hkjJUT+W/z7mO36JDEX+uxQa/lvjra9e00u4clpp879W A==;
X-IronPort-AV: E=Sophos;i="5.60,306,1549900800"; d="scan'208";a="104935956"
Received: from mail-dm3nam03lp2053.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.53])
	by ob1.hgst.iphmx.com with ESMTP; 04 Apr 2019 07:26:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6p0FwbjV3MRhuCcXX12KacbM7z6aQ83+/8mz4QNa2/w=;
	b=Yn+Y4gAODChVQgGiPvVbaygp7fR5rqooUXg85JhgKVZNiUyqPcqKkYFFdgmRJBFWdq221OBe0ztQjHJ4FjW8gK+W6BxGHNrlfcCFntR1nbeedCBiZH79A42ZmcRAnEx8SPAks0PzA1FBzy+E5Ma6gmEEn5YBLW8DPOYdvX2UvRE=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB6085.namprd04.prod.outlook.com (20.178.234.31) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.13; Wed, 3 Apr 2019 23:26:33 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Wed, 3 Apr 2019 23:26:33 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 3/6] python3-pyfann2: Initial commit
Thread-Index: AQHU6nSshwU7REIjsEmAqrrf6Us7Dg==
Date: Wed, 3 Apr 2019 23:26:32 +0000
Message-ID: <20190403232520.27463-3-alistair.francis@wdc.com>
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
x-ms-office365-filtering-correlation-id: ae721aff-f1f7-4b4a-f219-08d6b88bce7d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR04MB6085; 
x-ms-traffictypediagnostic: BYAPR04MB6085:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB60850E47658A07A9A29C338790570@BYAPR04MB6085.namprd04.prod.outlook.com>
x-forefront-prvs: 0996D1900D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(396003)(136003)(366004)(39860400002)(189003)(199004)(316002)(2616005)(446003)(476003)(486006)(11346002)(54906003)(76176011)(52116002)(3846002)(186003)(99286004)(386003)(6506007)(6116002)(66066001)(26005)(36756003)(8936002)(4326008)(7736002)(50226002)(25786009)(102836004)(97736004)(81166006)(81156014)(8676002)(305945005)(6916009)(2351001)(2906002)(106356001)(105586002)(6486002)(14454004)(86362001)(5640700003)(53936002)(6512007)(256004)(5660300002)(2501003)(71190400001)(1076003)(44832011)(72206003)(6436002)(71200400001)(478600001)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB6085;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V2MGWYgMintgXM4XV8Am20cFRWVnZs/4vQxeOS8EyDRwIM4p76qMHY/0PZAavz69GNErWwjowgg0v3xDV9xp4/AQo3OcwbPDEPl+ZkVuH6bwkUTLIED6Umxx1cp28oVbFzlfNr7smegjqEi4gZL6JTDiJcBsuzJnpoG4vyGI0G/h0Y4N9bMOgnM5DrbeduzrzgXModNPtMgDAXj99vDyp/jymgaIhQshedmNpxtYClce4DcMEz2k+2+/f0yY+a6i7HFQ5U11ECX1yxPfGZkjgFq6qG73Z0l8C+uLtzIRs+cnrEMi+juuGDhZ1fHdOuQ4a4UxZBO69U2uIedXMBOzzWBApqt/snwKrGGxQZ8c6HBYPveWrTYpBRI4vPpVQYCJ/OJYRgdEHs12ol3tPMnGqgFGaBz8fcQsaSbMF+P6IaI=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae721aff-f1f7-4b4a-f219-08d6b88bce7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2019 23:26:32.6811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6085
Subject: [meta-python][PATCH 3/6] python3-pyfann2: Initial commit
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
Pg0KLS0tDQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1mYW5uMi5pbmMgIHwg
IDkgKysrKysrDQogLi4uYXJkY29kZS1zd2lnLWFuZC1mYW5uMi1iaW5hcnktbG9jYXRpLnBhdGNo
IHwgMjggKysrKysrKysrKysrKysrKysrKw0KIC4uLi9weXRob24vcHl0aG9uMy1mYW5uMl8xLjEu
Mi5iYiAgICAgICAgICAgICB8ICA0ICsrKw0KIDMgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9u
cygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24tZmFubjIuaW5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmFubjIvMDAwMS1zZXR1cC5weS1Eb24tdC1o
YXJkY29kZS1zd2lnLWFuZC1mYW5uMi1iaW5hcnktbG9jYXRpLnBhdGNoDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmFubjJf
MS4xLjIuYmINCg0KZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbi1mYW5uMi5pbmMgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24tZmFubjIuaW5jDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAw
Li5jNDE1YjM1YTkNCi0tLSAvZGV2L251bGwNCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbi1mYW5uMi5pbmMNCkBAIC0wLDAgKzEsOSBAQA0KK1NVTU1BUlkg
PSAiUHl0aG9uIGJpbmRpbmdzIGZvciBGYXN0IEFydGlmaWNpYWwgTmV1cmFsIE5ldHdvcmtzIDIu
Mi4wIChGQU5OID49IDIuMi4wKSINCitTRUNUSU9OID0gImRldmVsL3B5dGhvbiINCitMSUNFTlNF
ID0gIkxHUEx2MiINCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1jNzNi
OTQzZGM3NWY2ZjY1ZTAwN2M1NmFjNjUxNWM4ZiINCisNCitTUkNfVVJJW21kNXN1bV0gPSAiMGI4
NWI0MTgwMTg3NDZkNjNlZDY2YjU1NDY1Njk3YTkiDQorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNk
Y2EwYTY1YWQ0OGUwODMyMDY3MmFmZmUzOGMzZGQ0ZWExNWUyNzgyMWU1ZTFkYjlmYTJiMzQyOTli
ZGQ0MWUiDQorDQorREVQRU5EUyArPSAic3dpZy1uYXRpdmUgbGliZmFubiINCmRpZmYgLS1naXQg
YS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZhbm4yLzAwMDEt
c2V0dXAucHktRG9uLXQtaGFyZGNvZGUtc3dpZy1hbmQtZmFubjItYmluYXJ5LWxvY2F0aS5wYXRj
aCBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmFubjIvMDAw
MS1zZXR1cC5weS1Eb24tdC1oYXJkY29kZS1zd2lnLWFuZC1mYW5uMi1iaW5hcnktbG9jYXRpLnBh
dGNoDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwLi5jYmM4MzhmMGUNCi0t
LSAvZGV2L251bGwNCisrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZmFubjIvMDAwMS1zZXR1cC5weS1Eb24tdC1oYXJkY29kZS1zd2lnLWFuZC1mYW5uMi1i
aW5hcnktbG9jYXRpLnBhdGNoDQpAQCAtMCwwICsxLDI4IEBADQorRnJvbSA4NTMwN2Y1OTJjN2Ni
ODdhZjE2MmNjYTRiMTIxYjg3NDEwOGI3NzU0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KK0Zy
b206IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4NCitEYXRlOiBU
dWUsIDIgQXByIDIwMTkgMTE6MjU6MTUgLTA3MDANCitTdWJqZWN0OiBbUEFUQ0hdIHNldHVwLnB5
OiBEb24ndCBoYXJkY29kZSBzd2lnIGFuZCBmYW5uMiBiaW5hcnkgbG9jYXRpb25zDQorDQorVXBz
dHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9uXQ0KK1NpZ25lZC1vZmYt
Ynk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4NCistLS0NCisg
c2V0dXAucHkgfCA1ICstLS0tDQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBk
ZWxldGlvbnMoLSkNCisNCitkaWZmIC0tZ2l0IGEvc2V0dXAucHkgYi9zZXR1cC5weQ0KK2luZGV4
IDM3YWY3YzcuLjhlNDE2ZjIgMTAwNzU1DQorLS0tIGEvc2V0dXAucHkNCisrKysgYi9zZXR1cC5w
eQ0KK0BAIC04MSwxMSArODEsOCBAQCBkZWYgZmluZF9zd2lnKCk6DQorIA0KKyBkZWYgYnVpbGRf
c3dpZygpOg0KKyAgICAgJycnUnVuIFNXSUcgd2l0aCBzcGVjaWZpZWQgcGFyYW1ldGVycycnJw0K
Ky0gICAgcHJpbnQoIkxvb2tpbmcgZm9yIEZBTk4gbGlicy4uLiIpDQorLSAgICBmaW5kX2Zhbm4o
KQ0KKy0gICAgcHJpbnQoInJ1bm5pbmcgU1dJRy4uLiIpDQorICAgICBzd2lnX2JpbiA9IGZpbmRf
c3dpZygpDQorLSAgICBzd2lnX2NtZCA9IFtzd2lnX2JpbiwgJy1jKysnLCAnLXB5dGhvbicsICdm
YW5uMi9mYW5uMi5pJ10NCisrICAgIHN3aWdfY21kID0gWydzd2lnJywgJy1jKysnLCAnLXB5dGhv
bicsICdmYW5uMi9mYW5uMi5pJ10NCisgICAgIHN1YnByb2Nlc3MuUG9wZW4oc3dpZ19jbWQpLndh
aXQoKQ0KKyANCisgaWYgInNkaXN0IiBub3QgaW4gc3lzLmFyZ3Y6DQpkaWZmIC0tZ2l0IGEvbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1mYW5uMl8xLjEuMi5iYiBi
L21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmFubjJfMS4xLjIu
YmINCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAuLmEwNGM5NjFmNA0KLS0t
IC9kZXYvbnVsbA0KKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1mYW5uMl8xLjEuMi5iYg0KQEAgLTAsMCArMSw0IEBADQorcmVxdWlyZSBweXRob24tZmFu
bjIuaW5jDQoraW5oZXJpdCBweXBpIHNldHVwdG9vbHMzDQorDQorU1JDX1VSSSArPSAiIGZpbGU6
Ly8wMDAxLXNldHVwLnB5LURvbi10LWhhcmRjb2RlLXN3aWctYW5kLWZhbm4yLWJpbmFyeS1sb2Nh
dGkucGF0Y2giDQotLSANCjIuMjEuMA0KDQo=

