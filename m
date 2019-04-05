Return-Path: <prvs=991f25a9b=Alistair.Francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id AC0997D5C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554475741; x=1586011741;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=6p0FwbjV3MRhuCcXX12KacbM7z6aQ83+/8mz4QNa2/w=;
	b=qEt06NzOsKF9yyygvujUx+lBONlB/6E6uIPuWmWvVzF+07KXJ8p9MVuv
	jj1zCB381aQFM7jOGnqS/fopeR2Wir6HsVyhY0tISiNf0UdLfYU5I1Loq
	XXrOeKec2ubQeseFupigbn4jIwQvaG/gWznqJQCnb37DRqHBfYtIclOmD
	yxzBTGLihhQ0t2bPtfozJpnEuw/THdz3JRG3j6OVzoD8tdIIxsTikH1+V
	blzGaCfHh14MTWvfK/Xg62ufRlyOJS8cUOouFyBX7A5Hyc/3qycy+a1Ix
	wtenbSmfIEcypGQdJcX0CVNCP9xVdK90fhTh0QuEEygjlDv2hxtHLVFq6 Q==;
X-IronPort-AV: E=Sophos;i="5.60,313,1549900800"; d="scan'208";a="210852622"
Received: from mail-by2nam03lp2057.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.57])
	by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2019 22:41:54 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6p0FwbjV3MRhuCcXX12KacbM7z6aQ83+/8mz4QNa2/w=;
	b=P+O71JbVNG8JwsXEo3t94WsnJBemRttBcDSQtsJg0uVZTH4c9fIfxV3XxFNhav6zVbF4TI2Kg9C1FWrITRTo81WMEAMVzd6lnURMsKoLZJXBoeqLu+I0FQ0Nw6yd+e43W/eENbzu9HkP95mlDrxQt0iRUyeaIR3F/zWqAlKabAQ=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB3973.namprd04.prod.outlook.com (52.135.215.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.16; Fri, 5 Apr 2019 14:41:53 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 5 Apr 2019 14:41:53 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH v2 3/6] python3-pyfann2: Initial commit
Thread-Index: AQHU67211v1Egmsdt0utdj1kZiHHCQ==
Date: Fri, 5 Apr 2019 14:41:52 +0000
Message-ID: <20190405144039.9121-3-alistair.francis@wdc.com>
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
x-ms-office365-filtering-correlation-id: b4b964da-9116-4bd2-85d9-08d6b9d4d7d7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB3973; 
x-ms-traffictypediagnostic: BYAPR04MB3973:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB3973BBF2F7C3CAF9907E3BF790510@BYAPR04MB3973.namprd04.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(136003)(396003)(346002)(366004)(199004)(189003)(446003)(86362001)(476003)(11346002)(316002)(2616005)(256004)(99286004)(66066001)(6116002)(3846002)(44832011)(76176011)(486006)(478600001)(102836004)(72206003)(26005)(2906002)(2501003)(71190400001)(386003)(6506007)(71200400001)(52116002)(14454004)(25786009)(2351001)(6916009)(4326008)(81166006)(68736007)(1076003)(36756003)(5660300002)(186003)(105586002)(106356001)(81156014)(8676002)(6512007)(5640700003)(6436002)(8936002)(50226002)(54906003)(53936002)(6486002)(305945005)(7736002)(97736004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB3973;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ASCV9KLt2qsiZMMtUWm51Wk5yRmzK693+Mq8z/nKOqojsnZ+WmUteG75bzabf9tK83PZkWm7OM30JOhTQSPl1O9tJELyzH/u7tc1qKEdY7r9syc24jf2kt5W1fNB47D1gwAsNJcMj5LxUxlRiITOgpYmvIt93bRcPQtIi8Zlvpw8In7yiqD5M9Vt51SSJ1ikhopVRmbqVXDFoyZGEkKZdUHvpxkPXehonMJYJqOkpeIcTXUV9p7oF4B0rpP7l+X7N0WFGAfcv8F/sdmAtMvQXkx1bm/g2FXNNYB3dZb8JV+zzcEu2jBjqE4ev4DleGIaWkzgdAHlkweoLYNcZQYWoJEvzbOTNYUDla4XrAV0o6dFqH8yPFdlCh962YFvoLMKWb0y5tZDVXVidQkOhtdXFhw/hq2zxS/wwwDCGbBfo1E=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b964da-9116-4bd2-85d9-08d6b9d4d7d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 14:41:52.8617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3973
Subject: [PATCH v2 3/6] python3-pyfann2: Initial commit
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

