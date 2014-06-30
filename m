Return-Path: <neena.busireddy@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0235.outbound.protection.outlook.com [207.46.163.235])
	by mail.openembedded.org (Postfix) with ESMTP id 4B07865C7C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 20:20:08 +0000 (UTC)
Received: from BLUPR03CA033.namprd03.prod.outlook.com (10.141.30.26) by
	BLUPR03MB470.namprd03.prod.outlook.com (10.141.78.142) with Microsoft
	SMTP Server (TLS) id 15.0.959.24; Mon, 30 Jun 2014 20:04:47 +0000
Received: from BL2FFO11FD009.protection.gbl (2a01:111:f400:7c09::132) by
	BLUPR03CA033.outlook.office365.com (2a01:111:e400:879::26) with
	Microsoft SMTP Server (TLS) id 15.0.974.11 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:47 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD009.mail.protection.outlook.com (10.173.161.15) with
	Microsoft SMTP Server (TLS) id 15.0.969.12 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:47 +0000
Received: from bluemeany.am.freescale.net (bluemeany.am.freescale.net
	[10.81.16.144])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s5UK4kNK031658; Mon, 30 Jun 2014 13:04:46 -0700
From: Neena Busireddy <neena.busireddy@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Jun 2014 15:04:28 -0500
Message-ID: <1404158675-20358-2-git-send-email-neena.busireddy@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
References: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(76482001)(85852003)(93916002)(104016002)(85306003)(33646001)(86362001)(15202345003)(575784001)(76176999)(95666004)(6806004)(106466001)(16799955002)(68736004)(79102001)(74502001)(80022001)(48376002)(19580395003)(15975445006)(62966002)(104166001)(4396001)(50226001)(21056001)(87936001)(81342001)(87286001)(92726001)(84676001)(20776003)(88136002)(97736001)(50466002)(64706001)(19580405001)(77982001)(74662001)(50986999)(46102001)(47776003)(44976005)(105606002)(83072002)(26826002)(92566001)(89996001)(31966008)(36756003)(99396002)(81542001)(2351001)(83322001)(229853001)(107046002)(77156001)(102836001);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR03MB470;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0258E7CCD4
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.168.50
	as permitted sender) receiver=; client-ip=192.88.168.50;
	helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=neena.busireddy@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/8] qt5everywheredemo: Create recipe to demonstrate qt5 example.
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
X-List-Received-Date: Mon, 30 Jun 2014 20:20:10 -0000
Content-Type: text/plain

Qt5 Everywhere Demo provides a quick tour of Qt 5.0, primarily
focusing on its graphical capabilities.

This recipe originated from the wandboard wiki page
http://wiki.wandboard.org/index.php/Integrate_Qt5_into_yocto_sato_image_on_Wandboard

Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>
---
 recipes-qt/examples/qt5everywheredemo_1.0.bb |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 recipes-qt/examples/qt5everywheredemo_1.0.bb

diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/examples/qt5everywheredemo_1.0.bb
new file mode 100644
index 0000000..4f7022c
--- /dev/null
+++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Qt5 everywhere demo"
+DESCRIPTION = "Quick tour of Qt 5.0, primarily focusing on its graphical capabilities."
+HOMEPAGE = "https://qt.gitorious.org/qt-labs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://main.cpp;md5=1187cb795a0f96bce64e63dd1a67dc2b"
+
+DEPENDS = "qtdeclarative qtgraphicaleffects"
+
+SRCREV = "9a868f96ee63c21ceda890d8dfc9d33f093d1b6d"
+SRC_URI = "git://gitorious.org/qt-labs/qt5-everywhere-demo.git"
+
+S = "${WORKDIR}/git/QtDemo"
+
+require recipes-qt/qt5/qt5.inc
+
+do_install() {
+    install -d ${D}${datadir}/${P}
+    install -m 0755 ${B}/QtDemo ${D}${datadir}/${P}   
+    cp -a ${S}/qml ${D}${datadir}/${P}  
+}
+
+FILES_${PN}-dbg += "${datadir}/${P}/.debug"
+FILES_${PN} += "${datadir}"
+
+RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins"
-- 
1.7.9.5


