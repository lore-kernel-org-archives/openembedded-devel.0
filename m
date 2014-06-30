Return-Path: <neena.busireddy@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0207.outbound.protection.outlook.com [207.46.163.207])
	by mail.openembedded.org (Postfix) with ESMTP id E67A6609C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 20:19:26 +0000 (UTC)
Received: from BLUPR03CA037.namprd03.prod.outlook.com (10.141.30.30) by
	BL2PR03MB466.namprd03.prod.outlook.com (10.141.92.17) with Microsoft
	SMTP Server (TLS) id 15.0.969.15; Mon, 30 Jun 2014 20:04:48 +0000
Received: from BL2FFO11FD040.protection.gbl (2a01:111:f400:7c09::106) by
	BLUPR03CA037.outlook.office365.com (2a01:111:e400:879::30) with
	Microsoft SMTP Server (TLS) id 15.0.974.11 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:47 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD040.mail.protection.outlook.com (10.173.161.136) with
	Microsoft SMTP Server (TLS) id 15.0.969.12 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:47 +0000
Received: from bluemeany.am.freescale.net (bluemeany.am.freescale.net
	[10.81.16.144])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s5UK4kNQ031658; Mon, 30 Jun 2014 13:04:46 -0700
From: Neena Busireddy <neena.busireddy@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Jun 2014 15:04:34 -0500
Message-ID: <1404158675-20358-8-git-send-email-neena.busireddy@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
References: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(86362001)(48376002)(50466002)(44976005)(89996001)(19580395003)(76176999)(104166001)(92566001)(15975445006)(64706001)(62966002)(81342001)(31966008)(19580405001)(81542001)(50226001)(16799955002)(85852003)(80022001)(88136002)(15395725005)(102836001)(47776003)(20776003)(99396002)(83072002)(21056001)(105606002)(83322001)(84676001)(36756003)(95666004)(104016002)(46102001)(26826002)(68736004)(87286001)(77156001)(97736001)(85306003)(575784001)(6806004)(4396001)(106466001)(93916002)(74502001)(74662001)(79102001)(50986999)(87936001)(77982001)(33646001)(2351001)(76482001)(15202345003)(92726001)(229853001)(107046002);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB466;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0258E7CCD4
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.168.50
	as permitted sender) receiver=; client-ip=192.88.168.50;
	helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=neena.busireddy@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH 7/8] quitindicators: Create recipe to demonstrate qt5 example.
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
X-List-Received-Date: Mon, 30 Jun 2014 20:19:28 -0000
Content-Type: text/plain

This example shows the implementation of QUITIndicators components.

This recipe originated from the wandboard wiki page
http://wiki.wandboard.org/index.php/Integrate_Qt5_into_yocto_sato_image_on_Wandboard

Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>
---
 recipes-qt/examples/quitindicators_1.0.1.bb |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 recipes-qt/examples/quitindicators_1.0.1.bb

diff --git a/recipes-qt/examples/quitindicators_1.0.1.bb b/recipes-qt/examples/quitindicators_1.0.1.bb
new file mode 100644
index 0000000..19a861a
--- /dev/null
+++ b/recipes-qt/examples/quitindicators_1.0.1.bb
@@ -0,0 +1,25 @@
+SUMMARY = "QUItIndicators components with few usage examples"
+HOMEPAGE = "http://quitcoding.com/?page=work#cinex"
+LICENSE = "CC-BY-3.0"
+LIC_FILES_CHKSUM = "file://README;beginline=38;endline=45;md5=9a4a88358260db32391eda6ebe7562e5"
+
+DEPENDS = "qtdeclarative qtgraphicaleffects"
+
+SRC_URI = "http://quitcoding.com/download/QUItIndicators_1.0.1.tar.gz"
+SRC_URI[md5sum] = "85ec60b553e181c55b331a9921d1b9a0"
+SRC_URI[sha256sum] = "db84112adbde9b6f28c129e8fb37a6912f4bc34bed18e57f570fb78ea0cb6ae2"
+
+S = "${WORKDIR}/QUItIndicators_1.0.1"
+
+require recipes-qt/qt5/qt5.inc
+
+do_install() {
+    install -d ${D}${datadir}/${P}
+    install -m 0755 ${B}/QUItIndicators ${D}${datadir}/${P}  
+    cp -a ${S}/qml ${D}${datadir}/${P}  
+}
+
+FILES_${PN}-dbg += "${datadir}/${P}/.debug"
+FILES_${PN} += "${datadir}"
+
+RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins"
-- 
1.7.9.5


