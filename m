Return-Path: <neena.busireddy@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0140.outbound.protection.outlook.com [207.46.163.140])
	by mail.openembedded.org (Postfix) with ESMTP id 21A5365C7C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 20:19:37 +0000 (UTC)
Received: from BL2PR03MB467.namprd03.prod.outlook.com (10.141.92.23) by
	BL2PR03MB354.namprd03.prod.outlook.com (10.141.89.22) with Microsoft
	SMTP Server (TLS) id 15.0.974.11; Mon, 30 Jun 2014 20:04:54 +0000
Received: from CH1PR03CA001.namprd03.prod.outlook.com (10.255.156.146) by
	BL2PR03MB467.namprd03.prod.outlook.com (10.141.92.23) with Microsoft
	SMTP Server (TLS) id 15.0.974.11; Mon, 30 Jun 2014 20:04:51 +0000
Received: from BN1AFFO11FD017.protection.gbl (10.255.156.132) by
	CH1PR03CA001.outlook.office365.com (10.255.156.146) with Microsoft SMTP
	Server (TLS) id 15.0.974.11 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:50 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD017.mail.protection.outlook.com (10.58.52.77) with Microsoft
	SMTP Server (TLS) id 15.0.969.12 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:50 +0000
Received: from bluemeany.am.freescale.net (bluemeany.am.freescale.net
	[10.81.16.144])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s5UK4kNM031658; Mon, 30 Jun 2014 13:04:46 -0700
From: Neena Busireddy <neena.busireddy@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Jun 2014 15:04:30 -0500
Message-ID: <1404158675-20358-4-git-send-email-neena.busireddy@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
References: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(79102001)(77982001)(16799955002)(93916002)(48376002)(46102001)(85306003)(99396002)(85852003)(36756003)(89996001)(77156001)(88136002)(575784001)(86362001)(15202345003)(50986999)(76176999)(104016002)(95666004)(50466002)(229853001)(74502001)(74662001)(92566001)(4396001)(33646001)(31966008)(83072002)(97736001)(62966002)(47776003)(64706001)(15395725005)(102836001)(20776003)(80022001)(21056001)(84676001)(6806004)(107046002)(68736004)(19580405001)(105606002)(50226001)(87286001)(15975445006)(83322001)(81342001)(81542001)(104166001)(44976005)(92726001)(26826002)(106466001)(76482001)(2351001)(87936001)(19580395003);
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
Subject: [PATCH 3/8] qt5ledscreen: Create recipe to demonstrate qt5 example.
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
X-List-Received-Date: Mon, 30 Jun 2014 20:19:38 -0000
Content-Type: text/plain

This is demonstration of simple LedScreen Component utilizing Qt5 QML.

This recipe originated from the wandboard wiki page
http://wiki.wandboard.org/index.php/Integrate_Qt5_into_yocto_sato_image_on_Wandboard

Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>
---
 recipes-qt/examples/qt5ledscreen_1.0.bb |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 recipes-qt/examples/qt5ledscreen_1.0.bb

diff --git a/recipes-qt/examples/qt5ledscreen_1.0.bb b/recipes-qt/examples/qt5ledscreen_1.0.bb
new file mode 100644
index 0000000..e16c557
--- /dev/null
+++ b/recipes-qt/examples/qt5ledscreen_1.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "QT5 LedScreen"
+DESCRIPTION = "This is LedScreen Qt5 QML component"
+HOMEPAGE = "http://quitcoding.com/?page=work#cinex"
+LICENSE = "CC-BY-3.0"
+LIC_FILES_CHKSUM = "file://README.txt;md5=fe07f4a0be40fe88f8c7ceaca63a28b5"
+
+DEPENDS = "qtdeclarative qtgraphicaleffects"
+
+SRC_URI = "http://quitcoding.com/download/ledscreen_1.0.tgz"
+SRC_URI[md5sum] = "8fc482d5a8b16f43f022c9a282f305b8"
+SRC_URI[sha256sum] = "fa4759b70a5fa148a901a3f9a659f7bd2503d73774022012bded880dffa0d15c"
+
+S = "${WORKDIR}/ledscreen_1.0"
+
+do_install() {
+    install -d ${D}${datadir}/${P}
+    #install -m 0755 ${B}/QUItBattery ${D}${datadir}/${P}  
+    cp -ar ${S}/* ${D}${datadir}/${P}  
+}
+
+FILES_${PN}-dbg += "${datadir}/${P}/.debug"
+FILES_${PN} += "${datadir}"
+
+RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins"
-- 
1.7.9.5


