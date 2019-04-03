Return-Path: <prvs=989330698=Alistair.Francis@wdc.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Apr 2019 23:33:38 UTC
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id C53B97D41E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 23:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554334421; x=1585870421;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=Yn7bnmTL2BgBcUxFAXGl9TjIGj9OFhUbNYX2h/RCLDU=;
	b=o1ZV/HdFbLh2ah+cVq8ZaNF0pMFK+ATQXECJvMeUOm/j+imXdmgF9ujn
	51A/47LjlCh0VdcCcdoO92w7+ibY3SLLw3088yHcKP8uFLWyfiWVStHfO
	oVNHxFfBepvFO88l7P6uDJPOoZk6ldXTjunCkMFZoE6Pk6ps7VfMi2wqr
	K8MiKuyngLGuwAnmsDZAuF2k/epRULk7kjRJKYecZdntx0G74bDrK/Jgr
	losq005/AoHMZj1Br/64/SKmxFc+BmUEkOcJFr28xysXgDMwjtxtnM9CL
	nNrViizNm+X3eOyNFID2t69J6gUdDKtWZYPfmBMuIvKzkCoWHrjDBUA4M g==;
X-IronPort-AV: E=Sophos;i="5.60,306,1549900800"; d="scan'208";a="104935953"
Received: from mail-dm3nam03lp2053.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.53])
	by ob1.hgst.iphmx.com with ESMTP; 04 Apr 2019 07:26:34 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Yn7bnmTL2BgBcUxFAXGl9TjIGj9OFhUbNYX2h/RCLDU=;
	b=QjLGfwnTfH2kf8u+eUbTg/eZAhOwlw5kG5E5vTb2EtR/Hwgdty0vs+qqqzlsoIIpSgv1EI/d0Fwdmo1c85tM0D8xI4uTvEcSgm3NDAjMde1h+9uYx1sCe5oxNmyHCkex1mPHUX1I99WNygNsv1gWrgUaTV2VRLP3mvPcEi2c5f0=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB6085.namprd04.prod.outlook.com (20.178.234.31) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.13; Wed, 3 Apr 2019 23:26:31 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Wed, 3 Apr 2019 23:26:31 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 1/6] python3-pyaudio: Initial commit
Thread-Index: AQHU6nSrod9f2hPqkUq+sAd4Z1Gewg==
Date: Wed, 3 Apr 2019 23:26:31 +0000
Message-ID: <20190403232520.27463-1-alistair.francis@wdc.com>
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
x-ms-office365-filtering-correlation-id: 8f76f1ce-c286-4bd8-d5f1-08d6b88bcde9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR04MB6085; 
x-ms-traffictypediagnostic: BYAPR04MB6085:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB608543772C293850BFCEEC9890570@BYAPR04MB6085.namprd04.prod.outlook.com>
x-forefront-prvs: 0996D1900D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(346002)(376002)(396003)(136003)(366004)(39860400002)(189003)(199004)(316002)(2616005)(476003)(486006)(54906003)(52116002)(3846002)(186003)(99286004)(386003)(6506007)(6116002)(66066001)(26005)(36756003)(8936002)(4326008)(7736002)(50226002)(25786009)(102836004)(97736004)(81166006)(81156014)(8676002)(305945005)(6916009)(2351001)(2906002)(106356001)(105586002)(6486002)(14454004)(86362001)(5640700003)(53936002)(6512007)(256004)(5660300002)(2501003)(71190400001)(1076003)(44832011)(72206003)(6436002)(71200400001)(478600001)(68736007)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB6085;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Fk+JTmjCGPBTKBvqMF7zNYf5UfVlt/V8JHRF0Xf17+l1JFzqjOeuCgj6XOSui+yxRyJLG+zisVau2bTm/sI0jm/Y1o7nLHnc4Bazb/jVy7bEM9m76OiQlqNHjyBZC0IBBY/kjh8/u+GKtzt91vIWEg09ujlPYg6LJtHdN4/klDjqok3rQlwac/kJnm0EnZOWcmrEi8Rqn+AQ9gAd7l9Md0J+lzq+GASKvzY973zgOSoVCbvGSDiLtd+NibCu6fj5BiAqTMcO5cf1r02IVBH+3JISvM8xY9OP470y+TXGXaFPC180DQB1i4BHNjTc3gxIUEbEBR1t1GKzQtqzDkm/CWEYUWkTvP6SYoxWzF0laYOn8XuQzpmRLdciAdoedA9OUOGU4pgsNH8IHcWGe0Mbx8L7BVBrJUvHLSgM1/8WirI=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f76f1ce-c286-4bd8-d5f1-08d6b88bcde9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2019 23:26:31.6954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6085
Subject: [meta-python][PATCH 1/6] python3-pyaudio: Initial commit
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
X-List-Received-Date: Wed, 03 Apr 2019 23:33:38 -0000
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

