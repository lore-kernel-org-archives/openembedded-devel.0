Return-Path: <prvs=991f25a9b=Alistair.Francis@wdc.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 Apr 2019 14:48:59 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 874807D5B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554475741; x=1586011741;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=Yn7bnmTL2BgBcUxFAXGl9TjIGj9OFhUbNYX2h/RCLDU=;
	b=qkllxzlx303CB2SXgWXX0Vu/1dPJ2saRt/VAeXVnenFy6Uegq1gRnpSQ
	wDn4ntc62MPGjtn83JuHpc62fwrG5ITwydQ1F15zcH/x6O6gEZxttZmL9
	wWsL82yX05Mkv+dT1ZHmdVWTp8SUb1dKzjVLuH5w/TVQM4OYYmPlx/jjc
	c9WSE+BL/S8hj/1+FQLgxVQFu4jyQc23M8NxCBgNHnUbuIblffEtnK42T
	GTdt/mXtr8aMdAF9okNlv+x9/ttyDHUxxZYiyvjol81Msne23A5T/1cwB
	6qnAcRfuYgt2W+X3aGjvgrT6QEw5X9sQn/1L8FtwVSKUnhqtw5B5O1pHN Q==;
X-IronPort-AV: E=Sophos;i="5.60,313,1549900800"; d="scan'208";a="210852620"
Received: from mail-by2nam03lp2057.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.57])
	by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2019 22:41:54 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Yn7bnmTL2BgBcUxFAXGl9TjIGj9OFhUbNYX2h/RCLDU=;
	b=BMkMS2Ff0PZHLGsJ2GZsoXi+aTEQEkDSmqujR0Xgg/qIqpske2LJrlvfAYgwtqv4sPrll+e1a5fCzLD99ItCQx74vmEPTqq3ZUr7vjm9XxXudhCmG12wXQSNQIDyjKuEfb6JbT12v4wFv8kI3FP0B3I79r71ftNN7pbGi7wRudA=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB3973.namprd04.prod.outlook.com (52.135.215.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.16; Fri, 5 Apr 2019 14:41:51 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 5 Apr 2019 14:41:51 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH v2 1/6] python3-pyaudio: Initial commit
Thread-Index: AQHU6720NS6U+qd6/U+JZqqXiobxlA==
Date: Fri, 5 Apr 2019 14:41:51 +0000
Message-ID: <20190405144039.9121-1-alistair.francis@wdc.com>
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
x-ms-office365-filtering-correlation-id: ef02b602-dd2d-4dbd-3511-08d6b9d4d735
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB3973; 
x-ms-traffictypediagnostic: BYAPR04MB3973:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB3973EEC7D8B346D759B7D40E90510@BYAPR04MB3973.namprd04.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(136003)(396003)(346002)(366004)(199004)(189003)(86362001)(476003)(316002)(2616005)(256004)(99286004)(66066001)(6116002)(3846002)(44832011)(486006)(478600001)(102836004)(72206003)(26005)(2906002)(2501003)(71190400001)(386003)(6506007)(71200400001)(52116002)(14454004)(25786009)(2351001)(6916009)(4326008)(81166006)(68736007)(1076003)(36756003)(5660300002)(186003)(105586002)(106356001)(81156014)(8676002)(6512007)(5640700003)(6436002)(8936002)(50226002)(54906003)(53936002)(6486002)(305945005)(7736002)(97736004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB3973;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RboEa485NB6g+WmcG5tIfnrZZ7X7s0+BtSmoiCsLEfxF1fAsQyBbPv/kwRshhsmABPfaU0yFdAiyvBADaOpskBfBbid3YM3J0CSI8dYZyAFvR4qYsfG1D7EsVz1+kXDq68r9zYs99kI5W4uSxFso9+K4H/mpDHJ683eS3sJbNygYHFgyitgSaXDY70UcAElEZJHxzlS8zUorA4mkks1g6aYeU00fkQis+NxD1EciJqYasoEWQowdH1zPaytotvmqd+DIfpJuWg3K7uCi55OYC8MyeZxvG738anYo/yAXlrqs+6I2dMW2FNLVB2w8q3rZmFxq+KklxvTZIALMqkEgDnte3JOzYxP64GRV9A9TEi4wu69n/L/zJYVnq0++Oa6NXOxJjqR1F+P3Of+I+7RolC72Z9ZMCxD8+OQtKYfCD+I=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef02b602-dd2d-4dbd-3511-08d6b9d4d735
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 14:41:51.7680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3973
Subject: [PATCH v2 1/6] python3-pyaudio: Initial commit
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
Pg0KLS0tDQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1weWF1ZGlvLmluYyAg
ICAgIHwgMTMgKysrKysrKysrKysrKw0KIC4uLi9weXRob24vcHl0aG9uMy1weWF1ZGlvXzAuMi4x
MS5iYiAgICAgICAgICAgICAgICB8ICAyICsrDQogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRp
b25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbi1weWF1ZGlvLmluYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXB5dGhv
bi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXVkaW9fMC4yLjExLmJiDQoNCmRp
ZmYgLS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcHlh
dWRpby5pbmMgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcHlh
dWRpby5pbmMNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAuLjBkM2RkYjFh
NQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uLXB5YXVkaW8uaW5jDQpAQCAtMCwwICsxLDEzIEBADQorU1VNTUFSWSA9ICJQeUF1
ZGlvIHByb3ZpZGVzIFB5dGhvbiBiaW5kaW5ncyBmb3IgUG9ydEF1ZGlvLCB0aGUgY3Jvc3MtcGxh
dGZvcm0gYXVkaW8gSS9PIGxpYnJhcnkiDQorU0VDVElPTiA9ICJkZXZlbC9weXRob24iDQorTElD
RU5TRSA9ICJNSVQiDQorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1FO21kNT0yODg3
OTNjMmI5YjA1YmQ2N2FiYmQyYThmNWQxNDRmNyINCisNCitQWVBJX1BBQ0tBR0UgPSAiUHlBdWRp
byINCisNCitTUkNfVVJJW21kNXN1bV0gPSAiN2U0Yzg4MTM5Mjg0MDMzZjY3YjQzMzZjNzRlZGEz
YjgiDQorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkzYmZkZTMwZTBiNjRlNjNhNDZmMmZkNzdlODVj
NDFmZDUxMTgyYTRhMzQxM2Q5ZWRmYWY5ZmZhYTI2ZWZiNzQiDQorDQorREVQRU5EUyArPSAicG9y
dGF1ZGlvLXYxOSINCisNCitSREVQRU5EU18ke1BOfSArPSAicG9ydGF1ZGlvLXYxOSINCmRpZmYg
LS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXVk
aW9fMC4yLjExLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weWF1ZGlvXzAuMi4xMS5iYg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAw
MC4uYWJiMDFiZjY5DQotLS0gL2Rldi9udWxsDQorKysgYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXVkaW9fMC4yLjExLmJiDQpAQCAtMCwwICsxLDIgQEAN
CityZXF1aXJlIHB5dGhvbi1weWF1ZGlvLmluYw0KK2luaGVyaXQgcHlwaSBzZXR1cHRvb2xzMw0K
LS0gDQoyLjIxLjANCg0K

