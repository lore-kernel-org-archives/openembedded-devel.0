Return-Path: <neena.busireddy@freescale.com>
X-Greylist: delayed 1046 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Apr 2015 19:02:22 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0107.outbound.protection.outlook.com [65.55.169.107])
	by mail.openembedded.org (Postfix) with ESMTP id 02B6460089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 19:02:22 +0000 (UTC)
Received: from CH1PR03CA001.namprd03.prod.outlook.com (10.255.156.146) by
	DM2PR03MB480.namprd03.prod.outlook.com (10.141.85.26) with Microsoft
	SMTP Server (TLS) id 15.1.136.17; Wed, 8 Apr 2015 18:29:54 +0000
Received: from BY2FFO11FD013.protection.gbl (10.255.156.132) by
	CH1PR03CA001.outlook.office365.com (10.255.156.146) with Microsoft SMTP
	Server (TLS) id 15.1.130.23 via Frontend Transport;
	Wed, 8 Apr 2015 18:29:53 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD013.mail.protection.outlook.com (10.1.14.75) with Microsoft
	SMTP Server (TLS) id 15.1.142.12 via Frontend Transport;
	Wed, 8 Apr 2015 18:29:53 +0000
Received: from bluemeany.am.freescale.net (bluemeany.am.freescale.net
	[10.81.16.144])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t38ITpkp022746; Wed, 8 Apr 2015 11:29:52 -0700
From: Neena Busireddy <neena.busireddy@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Apr 2015 13:29:46 -0500
Message-ID: <1428517786-17717-1-git-send-email-neena.busireddy@freescale.com>
X-Mailer: git-send-email 1.7.9.5
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(106466001)(104016003)(110136001)(105606002)(36756003)(92566002)(33646002)(229853001)(2351001)(86362001)(48376002)(50466002)(6806004)(575784001)(77156002)(450100001)(62966003)(19580405001)(19580395003)(50226001)(15395725005)(47776003)(85426001)(46102003)(50986999)(87936001)(15975445007)(77096005)(32563001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR03MB480;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR03MB480;
X-Microsoft-Antispam-PRVS: <DM2PR03MB48062DBB44C308D4E1F81C6F5FC0@DM2PR03MB480.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:DM2PR03MB480; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR03MB480; 
X-Forefront-PRVS: 0540846A1D
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2015 18:29:53.2996 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR03MB480
Subject: [meta-qt5][PATCH] qt5nmapper: Fix compatibility issue
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
X-List-Received-Date: Wed, 08 Apr 2015 19:02:23 -0000
Content-Type: text/plain

qt5nmapper app fails to run with the following error:

file:///usr/share/qt5nmapper-1.0/Qt5_NMapper.qml:34:5: Type Panel unavailable
         Panel {
         ^
file:///usr/share/qt5nmapper-1.0/content/Panel.qml:118:9: Type Switch unavailable
             Switch {
             ^
file:///usr/share/qt5nmapper-1.0/content/Switch.qml:8:21: Cannot assign a value to a signal (expecting a script to be run)
         property string onText: "On"

This patch changes the string from onText to onTextstring which was
introduced with Qt 5.3

Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>
---
 .../qt5nmapper/change-property-string.patch        |   22 ++++++++++++++++++++
 recipes-qt/examples/qt5nmapper_1.0.bb              |    3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/examples/qt5nmapper/change-property-string.patch

diff --git a/recipes-qt/examples/qt5nmapper/change-property-string.patch b/recipes-qt/examples/qt5nmapper/change-property-string.patch
new file mode 100644
index 0000000..0471706
--- /dev/null
+++ b/recipes-qt/examples/qt5nmapper/change-property-string.patch
@@ -0,0 +1,22 @@
+diff --git a/content_org/Switch.qml b/content/Switch.qml
+index 08a2cba..a8b8b26 100644
+--- a/content_org/Switch.qml
++++ b/content/Switch.qml
+@@ -5,7 +5,7 @@ Item {
+ 
+     property alias text: textItem.text
+     property bool checked: false
+-    property string onText: "On"
++    property string onTextString: "On"
+     property string offText: "Off"
+ 
+     QtObject {
+@@ -76,7 +76,7 @@ Item {
+             color: "#000000"
+             font.pixelSize: 18
+             font.bold: true
+-            text: onText
++            text: onTextString
+         }
+         Text {
+             anchors.verticalCenter: parent.verticalCenter
diff --git a/recipes-qt/examples/qt5nmapper_1.0.bb b/recipes-qt/examples/qt5nmapper_1.0.bb
index 9b1b727..77cb067 100644
--- a/recipes-qt/examples/qt5nmapper_1.0.bb
+++ b/recipes-qt/examples/qt5nmapper_1.0.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://README;beginline=47;endline=58;md5=9fb5bf76d564bc5381
 
 DEPENDS = "qtdeclarative qtgraphicaleffects"
 
-SRC_URI = "http://quitcoding.com/download/Qt5_NMapper_1.0.tgz"
+SRC_URI = "http://quitcoding.com/download/Qt5_NMapper_1.0.tgz \
+           file://change-property-string.patch"
 SRC_URI[md5sum] = "dafc425280144d8e286788e75a0dba0f"
 SRC_URI[sha256sum] = "607fbf4c448f00d3c563f9ef8a582bcb6e8fe550e80b56bf8d9127a417faa53b"
 
-- 
1.7.9.5


