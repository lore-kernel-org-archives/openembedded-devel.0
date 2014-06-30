Return-Path: <neena.busireddy@freescale.com>
X-Greylist: delayed 857 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 Jun 2014 20:19:05 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0182.outbound.protection.outlook.com [207.46.163.182])
	by mail.openembedded.org (Postfix) with ESMTP id B8E9560424
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 20:19:05 +0000 (UTC)
Received: from DM2PR03CA004.namprd03.prod.outlook.com (10.141.52.152) by
	DM2PR03MB480.namprd03.prod.outlook.com (10.141.85.26) with Microsoft
	SMTP Server (TLS) id 15.0.974.11; Mon, 30 Jun 2014 20:04:47 +0000
Received: from BL2FFO11FD048.protection.gbl (2a01:111:f400:7c09::119) by
	DM2PR03CA004.outlook.office365.com (2a01:111:e400:2414::24) with
	Microsoft SMTP Server (TLS) id 15.0.974.11 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:47 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD048.mail.protection.outlook.com (10.173.161.210) with
	Microsoft SMTP Server (TLS) id 15.0.969.12 via Frontend Transport;
	Mon, 30 Jun 2014 20:04:47 +0000
Received: from bluemeany.am.freescale.net (bluemeany.am.freescale.net
	[10.81.16.144])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s5UK4kNJ031658; Mon, 30 Jun 2014 13:04:46 -0700
From: Neena Busireddy <neena.busireddy@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Jun 2014 15:04:27 -0500
Message-ID: <1404158675-20358-1-git-send-email-neena.busireddy@freescale.com>
X-Mailer: git-send-email 1.7.9.5
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(83322001)(2351001)(4396001)(104166001)(95666004)(104016002)(107046002)(83072002)(92566001)(15975445006)(74502001)(85306003)(92726001)(62966002)(80022001)(102836001)(19580395003)(229853001)(68736004)(76482001)(21056001)(50226001)(84676001)(44976005)(106466001)(105606002)(79102001)(50466002)(74662001)(64706001)(20776003)(87286001)(46102001)(48376002)(81542001)(87936001)(47776003)(6806004)(50986999)(93916002)(36756003)(89996001)(86362001)(16799955002)(97736001)(26826002)(77156001)(77982001)(31966008)(15202345003)(33646001)(99396002)(85852003)(81342001)(88136002);
	DIR:OUT; SFP:; SCL:1; SRVR:DM2PR03MB480;
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
Subject: [PATCH 0/8][meta-qt5]: Example recipes for Qt5 Demo.
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
X-List-Received-Date: Mon, 30 Jun 2014 20:19:12 -0000
Content-Type: text/plain

The following set of patches for recipes are intented for
the meta-qt5 layer.These recipes originated from the wandboard wiki page 
http://wiki.wandboard.org/index.php/Integrate_Qt5_into_yocto_sato_image_on_Wandboard
and we are currently using in our release testing.  
After these are approved we have package groups for 
these recipes we'll submit in a separate group.

Neena Busireddy (8):
  qt5everywheredemo: Create recipe to demonstrate qt5 example.
  qtsmarthome: Create recipe to demonstrate qt5 example.
  qt5ledscreen: Create recipe to demonstrate qt5 example.
  qt5nmapcarousedemo: Create recipe to demonstrate qt5 example.
  qt5nmapper: Create recipe to demonstrate qt5 example.
  quitbattery: Create recipe to demonstrate qt5 example.
  quitindicators: Create recipe to demonstrate qt5 example.
  qt5-demo-extrafiles: Create recipe to include extrafiles for qt5
    demo.

 recipes-qt/demo-extrafiles/qt5-demo-extrafiles.bb  |   69 ++++++++++++++++++++
 .../demo-extrafiles/qt5-demo-extrafiles/LICENSE    |    1 +
 .../cinematicexperience.desktop                    |    9 +++
 .../qt5-demo-extrafiles/cinematicexperience.png    |  Bin 0 -> 33226 bytes
 .../qt5-demo-extrafiles/hellogl_es2.desktop        |    9 +++
 .../qt5-demo-extrafiles/hellogl_es2.png            |  Bin 0 -> 9971 bytes
 .../qt5-demo-extrafiles/hellowindow.desktop        |    9 +++
 .../qt5-demo-extrafiles/hellowindow.png            |  Bin 0 -> 6875 bytes
 .../qt5-demo-extrafiles/qt5basket.desktop          |    9 +++
 .../qt5-demo-extrafiles/qt5basket.png              |  Bin 0 -> 17467 bytes
 .../qt5-demo-extrafiles/qt5everywheredemo.desktop  |    9 +++
 .../qt5-demo-extrafiles/qt5everywheredemo.png      |  Bin 0 -> 18075 bytes
 .../qt5-demo-extrafiles/qt5launchdemo.desktop      |    9 +++
 .../qt5-demo-extrafiles/qt5launchdemo.png          |  Bin 0 -> 10801 bytes
 .../qt5-demo-extrafiles/qt5nesting.desktop         |    9 +++
 .../qt5-demo-extrafiles/qt5nesting.png             |  Bin 0 -> 8976 bytes
 .../qt5-demo-extrafiles/qt5nmapcarousedemo.desktop |    9 +++
 .../qt5-demo-extrafiles/qt5nmapcarousedemo.png     |  Bin 0 -> 20649 bytes
 .../qt5-demo-extrafiles/qt5nmapper.desktop         |    9 +++
 .../qt5-demo-extrafiles/qt5nmapper.png             |  Bin 0 -> 25774 bytes
 .../qt5-demo-extrafiles/qt5solarsystem.desktop     |    9 +++
 .../qt5-demo-extrafiles/qt5solarsystem.png         |  Bin 0 -> 9784 bytes
 .../qt5-demo-extrafiles/qtledbillboard.desktop     |    9 +++
 .../qt5-demo-extrafiles/qtledbillboard.png         |  Bin 0 -> 16610 bytes
 .../qt5-demo-extrafiles/qtledcombo.desktop         |    9 +++
 .../qt5-demo-extrafiles/qtledcombo.png             |  Bin 0 -> 24452 bytes
 .../qt5-demo-extrafiles/qtsmarthome.desktop        |    9 +++
 .../qt5-demo-extrafiles/qtsmarthome.png            |  Bin 0 -> 19986 bytes
 .../qt5-demo-extrafiles/quitbattery.desktop        |    9 +++
 .../qt5-demo-extrafiles/quitbattery.png            |  Bin 0 -> 16812 bytes
 .../qt5-demo-extrafiles/quitindicators.desktop     |    9 +++
 .../qt5-demo-extrafiles/quitindicators.png         |  Bin 0 -> 22063 bytes
 recipes-qt/examples/qt5everywheredemo_1.0.bb       |   25 +++++++
 recipes-qt/examples/qt5ledscreen_1.0.bb            |   24 +++++++
 recipes-qt/examples/qt5nmapcarousedemo_1.0.bb      |   29 ++++++++
 recipes-qt/examples/qt5nmapper_1.0.bb              |   28 ++++++++
 recipes-qt/examples/qtsmarthome_1.0.bb             |   29 ++++++++
 recipes-qt/examples/quitbattery_1.0.0.bb           |   26 ++++++++
 recipes-qt/examples/quitindicators_1.0.1.bb        |   25 +++++++
 39 files changed, 391 insertions(+)
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles.bb
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/LICENSE
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/cinematicexperience.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/cinematicexperience.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/hellogl_es2.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/hellogl_es2.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/hellowindow.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/hellowindow.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5basket.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5basket.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5everywheredemo.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5everywheredemo.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5launchdemo.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5launchdemo.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5nesting.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5nesting.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5nmapcarousedemo.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5nmapcarousedemo.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5nmapper.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5nmapper.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5solarsystem.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qt5solarsystem.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qtledbillboard.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qtledbillboard.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qtledcombo.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qtledcombo.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qtsmarthome.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/qtsmarthome.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/quitbattery.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/quitbattery.png
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/quitindicators.desktop
 create mode 100644 recipes-qt/demo-extrafiles/qt5-demo-extrafiles/quitindicators.png
 create mode 100644 recipes-qt/examples/qt5everywheredemo_1.0.bb
 create mode 100644 recipes-qt/examples/qt5ledscreen_1.0.bb
 create mode 100644 recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
 create mode 100644 recipes-qt/examples/qt5nmapper_1.0.bb
 create mode 100644 recipes-qt/examples/qtsmarthome_1.0.bb
 create mode 100644 recipes-qt/examples/quitbattery_1.0.0.bb
 create mode 100644 recipes-qt/examples/quitindicators_1.0.1.bb

-- 
1.7.9.5


