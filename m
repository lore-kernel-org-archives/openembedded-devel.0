Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 100095 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Apr 2019 04:11:37 UTC
Received: from APC01-PU1-obe.outbound.protection.outlook.com
	(mail-oln040092254022.outbound.protection.outlook.com [40.92.254.22])
	by mail.openembedded.org (Postfix) with ESMTP id B24B17C349
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 04:11:37 +0000 (UTC)
Received: from PU1APC01FT020.eop-APC01.prod.protection.outlook.com
	(10.152.252.59) by PU1APC01HT024.eop-APC01.prod.protection.outlook.com
	(10.152.253.46) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1771.16;
	Tue, 16 Apr 2019 03:57:14 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM (10.152.252.58) by
	PU1APC01FT020.mail.protection.outlook.com (10.152.252.217) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1771.16 via Frontend Transport; Tue, 16 Apr 2019 03:57:14 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::a9fb:86c9:a1ef:59ec]) by PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::a9fb:86c9:a1ef:59ec%5]) with mapi id 15.20.1792.020;
	Tue, 16 Apr 2019 03:57:14 +0000
From: Alistair Francis <alistair@alistair23.me>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] python-obd: Add missing RDEPENDS
Thread-Index: AQHU9Ah5fGp/gjn9iUKl6DVEEs4ieA==
Date: Tue, 16 Apr 2019 03:57:14 +0000
Message-ID: <PSXP216MB0277F214F3614FFD52F0C113DD240@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0051.namprd06.prod.outlook.com
	(2603:10b6:a03:14b::28) To PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	(2603:1096:300:a::18)
x-incomingtopheadermarker: OriginalChecksum:8860F5A99B50241E2A349917BE46FF280871863BA9DC33B12E14D2672A3C8462;
	UpperCasedChecksum:F125C925ED704ED7286FAA3761235D8F27EE093F621245E3C48F035872BA51F8;
	SizeAsReceived:7437; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-tmn: [Gy0+8R+87ruRyvTMlruhyHeZy+Ykh+HFlIslHypnWXwcLEbqukK9pyDps9vkZDj0]
x-microsoft-original-message-id: <20190416035700.17102-1-alistair@alistair23.me>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
	SRVR:PU1APC01HT024; 
x-ms-traffictypediagnostic: PU1APC01HT024:
x-microsoft-antispam-message-info: n1XdG4Tu2b6Eddnj3erIGQz2ncTJ7GTlkK6UhDSayOszmV7WM19DlvyAs8SyMn8AZymc3qT7rRbfpiq7MwPHYcSVzDlLH2eaZ3JJGyNET8BlfJfdFJIN+RgSnzcQPxfzxuoS1IYAaFHv+/CTIB9pqa0t+86icjbZde0oSko8131/QxjGm4PNr6L5laLeqqhX
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d33e85-1965-47d2-2946-08d6c21f9c00
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2019 03:57:14.3340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT024
Subject: [PATCH] python-obd: Add missing RDEPENDS
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
X-List-Received-Date: Tue, 16 Apr 2019 04:11:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta-python/recipes-devtools/python/python-obd.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-obd.inc b/meta-pyth=
on/recipes-devtools/python/python-obd.inc
index f2caf6491..5621dba94 100644
--- a/meta-python/recipes-devtools/python/python-obd.inc
+++ b/meta-python/recipes-devtools/python/python-obd.inc
@@ -7,3 +7,5 @@ SRC_URI[md5sum] =3D "93e04f825e13b7ebc97d06b6a6407807"
 SRC_URI[sha256sum] =3D "4b1bac95df2faac571ebf444778e4d736d050d8ed7049023c0=
fc929a520eba6d"
=20
 inherit pypi
+
+RDEPENDS_${PN} =3D "${PYTHON_PN}-pyserial ${PYTHON_PN}-pint"
--=20
2.20.1


