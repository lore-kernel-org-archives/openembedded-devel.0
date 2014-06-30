Return-Path: <neena.busireddy@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0144.outbound.protection.outlook.com [207.46.163.144])
	by mail.openembedded.org (Postfix) with ESMTP id C0209609C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 20:19:24 +0000 (UTC)
Received: from BN3PR0301CA0050.namprd03.prod.outlook.com (25.160.152.146) by
	BY2PR03MB475.namprd03.prod.outlook.com (10.141.141.150) with Microsoft
	SMTP Server (TLS) id 15.0.974.11; Mon, 30 Jun 2014 20:04:48 +0000
Received: from BN1AFFO11FD034.protection.gbl (2a01:111:f400:7c10::113) by
	BN3PR0301CA0050.outlook.office365.com (2a01:111:e400:401e::18) with
	Microsoft SMTP Server (TLS) id 15.0.974.11 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:47 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD034.mail.protection.outlook.com (10.58.52.158) with
	Microsoft SMTP Server (TLS) id 15.0.969.12 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:47 +0000
Received: from bluemeany.am.freescale.net (bluemeany.am.freescale.net
	[10.81.16.144])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s5UK4kNN031658; Mon, 30 Jun 2014 13:04:46 -0700
From: Neena Busireddy <neena.busireddy@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Jun 2014 15:04:31 -0500
Message-ID: <1404158675-20358-5-git-send-email-neena.busireddy@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
References: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(979002)(6009001)(189002)(199002)(26826002)(21056001)(15202345003)(86362001)(31966008)(102836001)(79102001)(74662001)(575784001)(93916002)(81542001)(104016002)(76482001)(105606002)(2351001)(107046002)(85306003)(16799955002)(74502001)(92726001)(92566001)(62966002)(106466001)(95666004)(50466002)(15975445006)(19580405001)(44976005)(88136002)(6806004)(80022001)(46102001)(77982001)(83322001)(81342001)(19580395003)(84676001)(89996001)(87286001)(87936001)(83072002)(85852003)(76176999)(97736001)(50986999)(99396002)(33646001)(64706001)(47776003)(20776003)(104166001)(15395725005)(68736004)(48376002)(229853001)(77156001)(50226001)(4396001)(36756003)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB475;
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
Subject: [PATCH 4/8] qt5nmapcarousedemo: Create recipe to demonstrate qt5 example.
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
X-List-Received-Date: Mon, 30 Jun 2014 20:19:25 -0000
Content-Type: text/plain

Qt5 Nmapcarousel demonstrates the normal mapping technique using Qt5

This recipe originated from the wandboard wiki page
http://wiki.wandboard.org/index.php/Integrate_Qt5_into_yocto_sato_image_on_Wandboard

Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>
---
 recipes-qt/examples/qt5nmapcarousedemo_1.0.bb |   29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 recipes-qt/examples/qt5nmapcarousedemo_1.0.bb

diff --git a/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb b/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
new file mode 100644
index 0000000..40265de
--- /dev/null
+++ b/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
@@ -0,0 +1,29 @@
+SUMMARY = "NMap Carousel application is demonstrating the 
+normal mapping technique using Qt5"
+DESCRIPTION = "Normal mapping is used for making the icons 
+appear 3D with lighting and shadows"
+HOMEPAGE = "http://quitcoding.com/?page=work#cinex"
+LICENSE = "CC-BY-3.0"
+LIC_FILES_CHKSUM = "file://README;beginline=44;endline=55;md5=3a9db934c393a0cf198cbe7e73ebec86"
+
+DEPENDS = "qtdeclarative qtgraphicaleffects"
+
+SRC_URI = "http://quitcoding.com/download/Qt5_NMap_CarouselDemo_1.0.tgz"
+SRC_URI[md5sum] = "c1b4568cdbb6b3af4ca10c5a90aa8128"
+SRC_URI[sha256sum] = "445da212074a10a432f4508d125814212bbe7a967bfa47b015b92dfac6bfd65f"
+
+S = "${WORKDIR}/Qt5_NMap_CarouselDemo_1.0"
+
+require recipes-qt/qt5/qt5.inc
+
+do_install() {
+    install -d ${D}${datadir}/${P}
+    install -m 0755 ${B}/Qt5_NMap_CarouselDemo ${D}${datadir}/${P}  
+    cp ${S}/Qt5_NMap_CarouselDemo.qml ${D}${datadir}/${P}  
+    cp -a ${S}/content ${D}${datadir}/${P}  
+}
+
+FILES_${PN}-dbg += "${datadir}/${P}/.debug"
+FILES_${PN} += "${datadir}"
+
+RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins"
-- 
1.7.9.5


