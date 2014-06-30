Return-Path: <neena.busireddy@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(dns-bn1lp0143.outbound.protection.outlook.com [207.46.163.143])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCC965C7C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 20:20:30 +0000 (UTC)
Received: from BLUPR03CA036.namprd03.prod.outlook.com (10.141.30.29) by
	BY2PR03MB474.namprd03.prod.outlook.com (10.141.141.149) with Microsoft
	SMTP Server (TLS) id 15.0.974.11; Mon, 30 Jun 2014 20:04:48 +0000
Received: from BL2FFO11FD042.protection.gbl (2a01:111:f400:7c09::196) by
	BLUPR03CA036.outlook.office365.com (2a01:111:e400:879::29) with
	Microsoft SMTP Server (TLS) id 15.0.974.11 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:47 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD042.mail.protection.outlook.com (10.173.161.138) with
	Microsoft SMTP Server (TLS) id 15.0.969.12 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:47 +0000
Received: from bluemeany.am.freescale.net (bluemeany.am.freescale.net
	[10.81.16.144])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s5UK4kNL031658; Mon, 30 Jun 2014 13:04:46 -0700
From: Neena Busireddy <neena.busireddy@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Jun 2014 15:04:29 -0500
Message-ID: <1404158675-20358-3-git-send-email-neena.busireddy@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
References: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(104166001)(81342001)(81542001)(106466001)(50466002)(80022001)(77982001)(79102001)(229853001)(107046002)(2351001)(21056001)(77156001)(105606002)(33646001)(95666004)(93916002)(20776003)(47776003)(104016002)(15202345003)(86362001)(74662001)(64706001)(575784001)(31966008)(85306003)(74502001)(92726001)(92566001)(99396002)(19580395003)(50986999)(76176999)(19580405001)(6806004)(87936001)(97736001)(87286001)(16799955002)(102836001)(26826002)(48376002)(88136002)(50226001)(76482001)(83322001)(89996001)(15975445006)(44976005)(84676001)(68736004)(4396001)(83072002)(36756003)(85852003)(62966002)(46102001);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB474;
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
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/8] qtsmarthome: Create recipe to demonstrate qt5 example.
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
X-List-Received-Date: Mon, 30 Jun 2014 20:20:32 -0000
Content-Type: text/plain

This is the Smarthome QML demo application showing interface
to control an automated house.

This recipe originated from the wandboard wiki page
http://wiki.wandboard.org/index.php/Integrate_Qt5_into_yocto_sato_image_on_Wandboard

Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>
---
 recipes-qt/examples/qtsmarthome_1.0.bb |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 recipes-qt/examples/qtsmarthome_1.0.bb

diff --git a/recipes-qt/examples/qtsmarthome_1.0.bb b/recipes-qt/examples/qtsmarthome_1.0.bb
new file mode 100644
index 0000000..f213f03
--- /dev/null
+++ b/recipes-qt/examples/qtsmarthome_1.0.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Qt5 smarthome QML demo application"
+DESCRIPTION = "This is the Smarthome QML demo application. It shows some user interfaces 
+for controlling an automated house"
+HOMEPAGE = "http://www.basyskom.com/news/143-demos-qt5-port.html"
+LICENSE = "LGPLv2.1+ & GFDL-1.2"
+LIC_FILES_CHKSUM = "file://COPYING.DOC;md5=ad1419ecc56e060eccf8184a87c4285f \
+                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+DEPENDS = "qtdeclarative qtgraphicaleffects"
+
+SRC_URI = "http://share.basyskom.com/demos/smarthome_src.tar.gz"
+SRC_URI[md5sum] = "883b0376239baec20ebec072e938a995"
+SRC_URI[sha256sum] = "fceaa813c33e462bad6c0383eaef81a6f6e586c15d1fa73898173b517fc1cda6"
+
+S = "${WORKDIR}/smarthome_src"
+
+require recipes-qt/qt5/qt5.inc
+
+do_install() {
+    install -d ${D}${datadir}/${P}
+    install -m 0755 ${B}/smarthome ${D}${datadir}/${P}   
+    cp -a ${S}/qml ${D}${datadir}/${P}  
+    cp -a ${S}/components ${D}${datadir}/${P}  
+}
+
+FILES_${PN}-dbg += "${datadir}/${P}/.debug"
+FILES_${PN} += "${datadir}"
+
+RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins"
-- 
1.7.9.5


