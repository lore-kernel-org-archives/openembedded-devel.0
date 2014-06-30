Return-Path: <neena.busireddy@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0206.outbound.protection.outlook.com [207.46.163.206])
	by mail.openembedded.org (Postfix) with ESMTP id 8A72460CEB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 20:19:12 +0000 (UTC)
Received: from BL2PR03MB467.namprd03.prod.outlook.com (10.141.92.23) by
	BL2PR03MB260.namprd03.prod.outlook.com (10.255.231.27) with Microsoft
	SMTP Server (TLS) id 15.0.974.11; Mon, 30 Jun 2014 20:04:49 +0000
Received: from BLUPR03CA034.namprd03.prod.outlook.com (10.141.30.27) by
	BL2PR03MB467.namprd03.prod.outlook.com (10.141.92.23) with Microsoft
	SMTP Server (TLS) id 15.0.974.11; Mon, 30 Jun 2014 20:04:48 +0000
Received: from BN1BFFO11FD031.protection.gbl (2a01:111:f400:7c10::1:128) by
	BLUPR03CA034.outlook.office365.com (2a01:111:e400:879::27) with
	Microsoft SMTP Server (TLS) id 15.0.974.11 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:47 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD031.mail.protection.outlook.com (10.58.144.94) with
	Microsoft SMTP Server (TLS) id 15.0.969.12 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:47 +0000
Received: from bluemeany.am.freescale.net (bluemeany.am.freescale.net
	[10.81.16.144])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s5UK4kNP031658; Mon, 30 Jun 2014 13:04:46 -0700
From: Neena Busireddy <neena.busireddy@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Jun 2014 15:04:33 -0500
Message-ID: <1404158675-20358-7-git-send-email-neena.busireddy@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
References: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(79102001)(77982001)(16799955002)(93916002)(48376002)(46102001)(85306003)(99396002)(85852003)(36756003)(89996001)(77156001)(88136002)(86362001)(15202345003)(50986999)(76176999)(104016002)(95666004)(50466002)(229853001)(74502001)(74662001)(92566001)(4396001)(33646001)(31966008)(83072002)(97736001)(62966002)(47776003)(64706001)(15395725005)(102836001)(20776003)(80022001)(21056001)(84676001)(6806004)(107046002)(68736004)(19580405001)(105606002)(50226001)(87286001)(15975445006)(83322001)(81342001)(81542001)(104166001)(44976005)(92726001)(26826002)(106466001)(76482001)(2351001)(87936001)(19580395003);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB467;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0258E7CCD4
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.168.50
	as permitted sender) receiver=; client-ip=192.88.168.50;
	helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=neena.busireddy@freescale.com; 
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-OriginatorOrg: freescale.com
Subject: [PATCH 6/8] quitbattery: Create recipe to demonstrate qt5 example.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jun 2014 20:19:15 -0000
Content-Type: text/plain

This example demonstrates how QUItBattery could behave
in different situations.

This recipe originated from the wandboard wiki page
http://wiki.wandboard.org/index.php/Integrate_Qt5_into_yocto_sato_image_on_Wandboard

Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>
---
 recipes-qt/examples/quitbattery_1.0.0.bb |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 recipes-qt/examples/quitbattery_1.0.0.bb

diff --git a/recipes-qt/examples/quitbattery_1.0.0.bb b/recipes-qt/examples/quitbattery_1.0.0.bb
new file mode 100644
index 0000000..ea218d7
--- /dev/null
+++ b/recipes-qt/examples/quitbattery_1.0.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "QT5 QUItBattery"
+DESCRIPTION = "This package contains QUItBatteryComponent with few usage examples"
+HOMEPAGE = "http://quitcoding.com/?page=work#cinex"
+LICENSE = "CC-BY-3.0"
+LIC_FILES_CHKSUM = "file://README;beginline=37;endline=46;md5=6df4bcb7f9092d42a84f32eacb61bdc4"
+
+DEPENDS = "qtdeclarative qtgraphicaleffects"
+
+SRC_URI = "http://quitcoding.com/download/QUItBattery_1.0.0.tar.gz"
+SRC_URI[md5sum] = "7c7babc1086491b116b01d154b6163fd"
+SRC_URI[sha256sum] = "38dcb7630553c397f9d8a53c6411b1a6237956ed8dd4859e01487b1dd8f37873"
+
+S = "${WORKDIR}/QUItBattery_1.0.0"
+
+require recipes-qt/qt5/qt5.inc
+
+do_install() {
+    install -d ${D}${datadir}/${P}
+    install -m 0755 ${B}/QUItBattery ${D}${datadir}/${P}  
+    cp -a ${S}/qml ${D}${datadir}/${P}  
+}
+
+FILES_${PN}-dbg += "${datadir}/${P}/.debug"
+FILES_${PN} += "${datadir}"
+
+RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins"
-- 
1.7.9.5


