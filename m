Return-Path: <hnje@triax.com>
X-Greylist: delayed 10868 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Dec 2018 16:36:21 UTC
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80135.outbound.protection.outlook.com [40.107.8.135])
	by mail.openembedded.org (Postfix) with ESMTP id 451FB6C483
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 16:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triax.onmicrosoft.com; 
	s=selector1-triax-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hOSyJDvE2YuoPrIQYVHSwo7f2O2yaQmSRkTQpTdq5tE=;
	b=ikRxEwppYapHgvM1LQLkvVqaHOtJxlj/xqBtMw2cB6dAElRuU0HPJ6epZ1kGA+iK/dPr4wtSYdMOm45bVGj8n1mRgVLmQzoTBb4mlwRaOM5LA/t17GgHBuxUE09U27MApcK/SilfQpZFFEEC/ZWgWVY5OSJLPb2zddCkz0t1z/c=
Received: from AM0PR09MB2626.eurprd09.prod.outlook.com (20.177.110.218) by
	AM0PR09MB2881.eurprd09.prod.outlook.com (20.178.202.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Tue, 18 Dec 2018 08:13:32 +0000
Received: from AM0PR09MB2626.eurprd09.prod.outlook.com
	([fe80::f5a6:6422:faab:6668]) by
	AM0PR09MB2626.eurprd09.prod.outlook.com
	([fe80::f5a6:6422:faab:6668%3]) with mapi id 15.20.1425.023;
	Tue, 18 Dec 2018 08:13:32 +0000
From: "Henrik Nymann Jensen (HNJE)" <hnje@triax.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] sharutils 4.15.2: BBCLASSEXTEND to native and
	nativesdk
Thread-Index: AQHUlqmRrjvpAo7EBkqP0P/FRp6JXw==
Date: Tue, 18 Dec 2018 08:13:32 +0000
Message-ID: <20181218081322.2894-1-hnje@triax.com>
Accept-Language: en-150, da-DK, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P194CA0006.EURP194.PROD.OUTLOOK.COM
	(2603:10a6:209:90::19) To AM0PR09MB2626.eurprd09.prod.outlook.com
	(2603:10a6:208:e2::26)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=hnje@triax.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.106.123.182]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM0PR09MB2881;
	6:eSPY/up5Pd9pKqmqh5tvV/UobzSp6UZtvY5JJCrau2tI2i0PHlGvCCP/J/PC7ikIWdzHNlpEwVGmcp2gbQdqVwzSxVcvfo8TegOKBb6fDr63CwAMHc44jT7WbePLPECUlTBsSMY61QyUCPqKkNqWPbWRpJKtzw0asDfbRozaU6pr2ELuOtyc6i1M3AXd2g5q0CbSkBm+8NQIW4Frs52cFV7H06TJMFJGPNlAh1t2eO8tNB/IeV0oEUk5u4Q7cZ2UUZs4IXDkBg3humjc1KMGweAOoDLVS4N9bmabnE6wLb/GAm/rk+xFNOUVKfhsoLM6OnzqxcNNeCHAh1DpK5gx47forOkWoMbhfCLkxN9ZarSmizwD7cBfl38jCb/ekEFW4wSLYVCPe2yQ+Ju8knz4mSC0WIsFqda/E9vzc85RvgKQhQkz/f0uH3TBG1tyDqNJO28tZiVjiimCq0WBdMgSbQ==;
	5:+QFrA5BrpBklOPcx6EZdwaGEIjyHOXUE5hpe6OxK7/GFNZW+KU57u696sQadZabzmA4Aai2/r00Rzi3Jnx3ErqYVpomlMuJzw+mGnTigNaGQqRm0lofZQyRieyEL16kEF0kiM9Q7HBqVp/KHdi2bjgJutAf0C0cbxVBOXUbDKbk=;
	7:jkwoKXZSVDYd+bC+jtITqlIlme78GFtBkDT13EErE5WPwMCVQ6Q6n+gMywuToqeR8wqvR8PldFWuDd9w4Q7thQllcq2NhuIHgiKX1NuuUTx++brLvOcepRnwkX8ijphaEwTSEGtKOxhLC2rJ64JlMA==
x-ms-office365-filtering-correlation-id: 18266f1c-8b57-4407-b79b-08d664c0b35d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR09MB2881; 
X-MS-TrafficTypeDiagnostic: AM0PR09MB2881:|AM0PR09MB2881:
x-microsoft-antispam-prvs: <AM0PR09MB2881D25556A61EF53E192A25CABD0@AM0PR09MB2881.eurprd09.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3231475)(944501520)(52105112)(93006095)(93001095)(3002001)(10201501046)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:AM0PR09MB2881; BCL:0; PCL:0; RULEID:; SRVR:AM0PR09MB2881; 
x-forefront-prvs: 08902E536D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(39850400004)(396003)(376002)(346002)(199004)(189003)(316002)(6436002)(6486002)(36756003)(68736007)(99286004)(6916009)(7736002)(71190400001)(106356001)(71200400001)(2351001)(1076003)(53936002)(476003)(2616005)(105586002)(97736004)(25786009)(478600001)(14454004)(486006)(256004)(2501003)(102836004)(386003)(4326008)(186003)(6506007)(305945005)(52116002)(66066001)(81156014)(86362001)(81166006)(2906002)(8676002)(6512007)(8936002)(26005)(5660300001)(5640700003)(107886003)(6116002)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR09MB2881;
	H:AM0PR09MB2626.eurprd09.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: triax.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: iyFYsSZX8AJGld9VhvMk+NdUqpb5e+Ge5qWzM0BUXtMX0MXocay24k0cpk3JD4giWA3w7TPOGFbAPwHFSirvuBZ8tDs5cCIV/vCLXxj4OwnStq30w6MuzfQVAg8A99CUVZo5PXBqFDpX59IPeN/d8VcmBsUzXKPIpySpVQ0VdEWsmXD+Bi4vc7Gv5IZ+9UcYduKLTFt/Lb4h65hYJHvxpCQ26LnvTLsm4AQTZMxPyDJ3I8AI60UHtEiN7girYTqSWtmiq5zpDh+vWLeTwZkj8OCHDLerMAML8xwSWMFGjSRNy3RWo8j83LeSH8LgdjGR
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 18266f1c-8b57-4407-b79b-08d664c0b35d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2018 08:13:32.8234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0e4fd38b-2bbd-4850-8e60-c136d92e69d6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2881
X-Microsoft-Exchange-Diagnostics: 1; AM0PR09MB2881;
	23:J15U5f6s0BFnlGU7rUSFNVERDgicD6ZMXPiU4V7ZJjaE5D6te0HlvJfbLGx30mLs8ThCP1xLmGnr5g8dBKFWRclIDVBfLW/r1NRJvN7DrX1BbBIN5Nh87oEyO8xPhBnqudxV1fFvlhnY8WxtNd44nA==
X-OriginatorOrg: triax.com
Subject: [meta-oe][PATCH] sharutils 4.15.2: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Wed, 19 Dec 2018 16:36:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Henrik Nymann Jensen <hnje@triax.com>
---
 meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-o=
e/recipes-support/sharutils/sharutils_4.15.2.bb
index c12289b5d..dca42676d 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -20,3 +20,5 @@ do_install_append() {
         rmdir --ignore-fail-on-non-empty ${D}${libdir}
     fi
 }
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.19.2


