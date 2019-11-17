Return-Path: <jhofstee@victronenergy.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00132.outbound.protection.outlook.com [40.107.0.132])
	by mail.openembedded.org (Postfix) with ESMTP id 41F5E7F8DF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=n6fz6JIMAW9ls9VNYHmzVVQsrw0N35p2Rs5S5m8VEE/rJE0ixAUjOiTZ+Q/PzTHmmrBOWYCJAnG3Zjpqqk2ufh6nJU9VRZh+4yLPodl6oQ6SZQKRtBgdTZ1weHaKu7Y701uG3Gv+f6pka154HO/74IntifeOGn5NLYQrrrX9rpyAITeyCBSJvUUfy0wemU6eQrnEK4anMd8l1cxEDrT/MAHLI2cG5RrE8ANEsPw8GUy+kMOWqG/Pd8T+LdpP/v5TUX+sZPeGWteemPEcxqudk6eFEaHKbOK6BVo3+gR072RUJuWk4EMj9wO/Azf2xCn300iA+7BYb7gNRMS9k/6iww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Neyu3yQqVTHnq+yyJ8n20MbRNVN1+3VYwnSj+kHPt8g=;
	b=E6y8YNjEh8huVqnaqmwD5eR9BQL65VA5vts4X5VJyiki4+t12KRUstu/NOuGwrLDXsSJsqH/8RMpoIMjnoGJscMcYgUl1/KIG3JAEuELih+4DSgvcRHmKfRWJvf5LlwJ8BnDLcBfrVzsRzKfRSJuwceS6QYt1ufrq4oF4Mjg3ug60iZqEP3iv043x4z8GHAi1L7GJoztyawD2kQLRTtgFWCTfsNsg4Cd+z2KRw670SjqiN7a18WzvZsgIQDjZwdM6qUmiM4CZhSqDlLNfX2KeALcpbL5AXm0rpetK1AW7S2X7GGYmce01s1DkowYvdFYpj/+PKaOkvwSLV3xzIQCGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=victronenergy.com; dmarc=pass action=none
	header.from=victronenergy.com; dkim=pass header.d=victronenergy.com;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Neyu3yQqVTHnq+yyJ8n20MbRNVN1+3VYwnSj+kHPt8g=;
	b=PDamVsJhyM1p1heM7CjXkcwpv0INuftk3F7aHQ1NdGd/P/7JiMCT7Czn0Ye+EtgKegiTqK6vkMswV/pvRDxcfAVcjZ2M2Q63FP90pySMECNk3cD2/wpWfOAN9ldulDlbVeeUBIcpk6kxaHssSuDnq5Uo7j6C2vPvGbYS/EGAt3M=
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com (10.173.82.19) by
	VI1PR0701MB2814.eurprd07.prod.outlook.com (10.173.70.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.9; Sun, 17 Nov 2019 21:44:38 +0000
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com
	([fe80::dc67:84fb:5210:adb8]) by
	VI1PR0701MB2623.eurprd07.prod.outlook.com
	([fe80::dc67:84fb:5210:adb8%8]) with mapi id 15.20.2474.012;
	Sun, 17 Nov 2019 21:44:37 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt4][PATCH 0/2] fix qt4 for zeus
Thread-Index: AQHVnZA1pOVfbe9HvE2w/5DckYGk1A==
Date: Sun, 17 Nov 2019 21:44:37 +0000
Message-ID: <20191117214427.20073-1-jhofstee@victronenergy.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:1c01:3bc5:4e00:461c:a8ff:fee1:70b5]
x-clientproxiedby: AM0PR02CA0017.eurprd02.prod.outlook.com
	(2603:10a6:208:3e::30) To VI1PR0701MB2623.eurprd07.prod.outlook.com
	(2603:10a6:801:b::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99a1ba12-7de3-41f4-7fa2-08d76ba757cb
x-ms-traffictypediagnostic: VI1PR0701MB2814:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0701MB28140EEB1BA5922B134D9F70C0720@VI1PR0701MB2814.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02243C58C6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(136003)(376002)(396003)(366004)(39840400004)(199004)(189003)(6916009)(6506007)(305945005)(386003)(7736002)(478600001)(99286004)(102836004)(36756003)(50226002)(6512007)(52116002)(316002)(54906003)(2351001)(14454004)(4744005)(66946007)(66446008)(64756008)(66556008)(66476007)(2501003)(8676002)(81166006)(86362001)(46003)(1076003)(81156014)(6486002)(4326008)(256004)(186003)(8936002)(6436002)(486006)(5640700003)(5660300002)(71200400001)(6116002)(71190400001)(25786009)(2616005)(2906002)(476003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0701MB2814;
	H:VI1PR0701MB2623.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qkgQsY2Po2bnLpAGXzSNeftJbnBu5EG8U3swL+2l20slj535tfM4rBNhSScjlqzXCIBrVFYueUmDC/XhhrFw86lMLm420/y+BiAc0i99DmLXYdVg+FJrexLg8xMp7Bn6V7LgZk8RlVcaYfuuLbmAquQnXtZDCAX2Fcpjo4OSHeFPQieVqxuLBnP+vm+yFNWHUuRNytiKBHQUdROr80jFpAHVpM+YBQkhGgZBimvM/wa22AMsNDRCdCQ84O+njkqd2cBQpxuMia/jPGnHy6sE/VAOz7tqfwtn1kTzlMg7zn1/YbJjtQMJojmtiupcNzJoI3ckAEjneFY1iqmh/wXirGhsT+iOH9acRDU3ikS7vDihUSQu14dwA5NOzt/grJtyUrRPUbVAFXI2hln9I+N2w0uq184rIMp7eCSDXVLxAwWjMwOuObrWit+1alRC9WaS
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a1ba12-7de3-41f4-7fa2-08d76ba757cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2019 21:44:37.4948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fWA8OqwReLmpx70Fkzr3oEeunlgy/JoIcWvmmjmWaDxHGqEQ8/hgn9B5kXEzikbySx9YMeqyOgoBEFKXbL9/ZX5DB3NYsdsJMZi0WzU77ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2814
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, Adrian Bunk <bunk@stusta.de>
Subject: [meta-qt4][PATCH 0/2] fix qt4 for zeus
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
X-List-Received-Date: Sun, 17 Nov 2019 21:44:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Gcc 9.2 miscompiles the foreach resulting in broken applications.
This backports a fix from qt5 to make it work again. The fix is
not written for this issue, but it does solve it.

As a prepartion it includes some whitespace fixes, so the patches
are aligned in the SRC_URI.

Jeroen Hofstee (2):
  qt4: fix whitespace so it aligns
  qt4: updates for gcc 9.2

 recipes-qt4/qt4/nativesdk-qt4-tools.inc       |  2 +
 recipes-qt4/qt4/qt4-4.8.7.inc                 |  6 +-
 ...event-gcc-9.2-miscompiling-Q_FOREACH.patch | 78 ++++++++++++++++
 ...ence-some-loud-but-innocent-warnings.patch | 91 +++++++++++++++++++
 recipes-qt4/qt4/qt4-native.inc                | 12 ++-
 5 files changed, 182 insertions(+), 7 deletions(-)
 create mode 100644 recipes-qt4/qt4/qt4-4.8.7/0038-prevent-gcc-9.2-miscompi=
ling-Q_FOREACH.patch
 create mode 100644 recipes-qt4/qt4/qt4-4.8.7/0039-silence-some-loud-but-in=
nocent-warnings.patch

--=20
2.17.1


