Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 7440 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Jul 2019 15:44:41 UTC
Received: from APC01-PU1-obe.outbound.protection.outlook.com
	(mail-oln040092254103.outbound.protection.outlook.com
	[40.92.254.103])
	by mail.openembedded.org (Postfix) with ESMTP id EAA5B7EF25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 15:44:41 +0000 (UTC)
Received: from PU1APC01HT019.eop-APC01.prod.protection.outlook.com
	(2a01:111:e400:7ebe::361) by
	SG2APC01HT024.eop-APC01.prod.protection.outlook.com
	(2a01:111:e400:7ebd::402) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18;
	Wed, 10 Jul 2019 15:28:45 +0000
Received: from PU1APC01FT047.eop-APC01.prod.protection.outlook.com
	(10.152.252.57) by PU1APC01HT019.eop-APC01.prod.protection.outlook.com
	(10.152.253.105) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18;
	Wed, 10 Jul 2019 05:06:37 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM (10.152.252.52) by
	PU1APC01FT047.mail.protection.outlook.com (10.152.253.23) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.18 via Frontend Transport; Wed, 10 Jul 2019 05:06:37 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::dddc:7a04:f102:c82c]) by PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::dddc:7a04:f102:c82c%2]) with mapi id 15.20.2052.020;
	Wed, 10 Jul 2019 05:06:37 +0000
From: Alistair Francis <alistair@alistair23.me>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] gpsd: Fix the systemd service run paths
Thread-Index: AQHVNt1AtX/FsxJfck+hlolRiexhnw==
Date: Wed, 10 Jul 2019 05:06:37 +0000
Message-ID: <PSXP216MB02773C783B9B89F34738D122DDF00@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0003.namprd13.prod.outlook.com
	(2603:10b6:a03:180::16) To PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	(2603:1096:300:a::18)
x-incomingtopheadermarker: OriginalChecksum:0D8210CF26A916982A0A6747C9EB7A46518381AC91FF391BEE2DA0FC37E4CA28;
	UpperCasedChecksum:1EABF71AFBC614DB563C7704F45B6F5589BBA7DDB1BC53F812F526274F402723;
	SizeAsReceived:7549; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-tmn: [9C+laKDTckkMfKQl2/QNpGHVM50vrJYvAjr+OZ+iMUzeNR2OPtYyg1UdKyCJ/hUl]
x-microsoft-original-message-id: <20190710050622.11464-1-alistair@alistair23.me>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
	SRVR:PU1APC01HT019; 
X-MS-TrafficTypeDiagnostic: PU1APC01HT019:|PU1APC01HT019:|SG2APC01HT024:
x-microsoft-antispam-message-info: TKv0t7w38zVFI22hgXup9q2SVDMZN8aRdwnzm16mS7DVS2B6tA7xtbUE7eA6A8ZeIogrMJiOAXbhcYNHGpSf1VLPlPxFrt6t6CKYEBGLosRqU9adi6RaF23G3dAe/u3BudBusILW3BBKcmj+sI5hWWyiBmlFyhz/rzWIxaTRaD473xEZm3S203dKcNf5F/+h
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 596e61d0-f7fa-4072-de44-08d704f46274
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 05:06:37.5439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT019
X-OriginatorOrg: outlook.com
Subject: [meta-oe][PATCH] gpsd: Fix the systemd service run paths
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
X-List-Received-Date: Wed, 10 Jul 2019 15:44:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Make sure that we call gpsd from /usr instead of /usr/local.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb b/meta-oe/recip=
es-navigation/gpsd/gpsd_3.18.1.bb
index 22097e3aa..cd31c5b0f 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
@@ -84,7 +84,9 @@ do_install_append() {
     #support for systemd
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/systemd/${BPN}.service ${D}${systemd_unitdir}/sys=
tem/${BPN}.service
+    sed -i -e 's,/usr/local,/usr,g' ${D}${systemd_unitdir}/system/${BPN}.s=
ervice
     install -m 0644 ${S}/systemd/${BPN}ctl@.service ${D}${systemd_unitdir}=
/system/${BPN}ctl@.service
+    sed -i -e 's,/usr/local,/usr,g' ${D}${systemd_unitdir}/system/${BPN}ct=
l@.service
     install -m 0644 ${S}/systemd/${BPN}.socket ${D}${systemd_unitdir}/syst=
em/${BPN}.socket
 }
=20
--=20
2.21.0


