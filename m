Return-Path: <neena.busireddy@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0117.outbound.protection.outlook.com [207.46.100.117])
	by mail.openembedded.org (Postfix) with ESMTP id D069B60089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 20:30:57 +0000 (UTC)
Received: from BLUPR03MB471.namprd03.prod.outlook.com (10.141.78.145) by
	BLUPR03MB1378.namprd03.prod.outlook.com (0.163.81.12) with Microsoft
	SMTP Server (TLS) id 15.1.130.23; Wed, 8 Apr 2015 20:30:57 +0000
Received: from BY2PR03CA064.namprd03.prod.outlook.com (10.141.249.37) by
	BLUPR03MB471.namprd03.prod.outlook.com (10.141.78.145) with Microsoft
	SMTP Server (TLS) id 15.1.136.17; Wed, 8 Apr 2015 20:30:56 +0000
Received: from BN1AFFO11FD038.protection.gbl (2a01:111:f400:7c10::133) by
	BY2PR03CA064.outlook.office365.com (2a01:111:e400:2c5d::37) with
	Microsoft
	SMTP Server (TLS) id 15.1.130.23 via Frontend Transport; Wed, 8 Apr 2015
	20:30:55 +0000
Authentication-Results: spf=temperror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: TempError (protection.outlook.com: error in processing during
	lookup of freescale.com: DNS Timeout)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD038.mail.protection.outlook.com (10.58.52.242) with
	Microsoft SMTP Server (TLS) id 15.1.136.16 via Frontend Transport;
	Wed, 8 Apr 2015 20:30:53 +0000
Received: from bluemeany.am.freescale.net (bluemeany.am.freescale.net
	[10.81.16.144])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t38KUqv7020899; Wed, 8 Apr 2015 13:30:52 -0700
From: Neena Busireddy <neena.busireddy@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Apr 2015 15:30:47 -0500
Message-ID: <1428525047-18093-1-git-send-email-neena.busireddy@freescale.com>
X-Mailer: git-send-email 1.7.9.5
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(15395725005)(33646002)(19580405001)(450100001)(77156002)(50466002)(46102003)(48376002)(2351001)(229853001)(106466001)(86362001)(6806004)(19580395003)(110136001)(575784001)(104016003)(47776003)(87936001)(50986999)(15975445007)(92566002)(36756003)(77096005)(62966003)(50226001)(32563001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB471;
	H:tx30smr01.am.freescale.net; FPR:; SPF:TempError; MLV:sfv; MX:1;
	A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BLUPR03MB471;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BLUPR03MB1378; 
X-Microsoft-Antispam-PRVS: <BLUPR03MB471E6AEDD31EA54E7B57C29F5FC0@BLUPR03MB471.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BLUPR03MB471; BCL:0;
	PCL:0; RULEID:; SRVR:BLUPR03MB471; 
X-Forefront-PRVS: 0540846A1D
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2015 20:30:53.3868 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB471
X-OriginatorOrg: freescale.com
Subject: [meta-qt5][PATCH V2] qt5nmapper: Fix compatibility issue
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
X-List-Received-Date: Wed, 08 Apr 2015 20:30:58 -0000
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

This patch changes the string from onText to onTextstring which was introduced with Qt 5.3

Signed-off-by: Neena Busireddy <neena.busireddy@freescale.com>
---
 .../qt5nmapper/change-property-string.patch        |   26 ++++++++++++++++++++
 recipes-qt/examples/qt5nmapper_1.0.bb              |    3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/examples/qt5nmapper/change-property-string.patch

diff --git a/recipes-qt/examples/qt5nmapper/change-property-string.patch b/recipes-qt/examples/qt5nmapper/change-property-string.patch
new file mode 100644
index 0000000..c77a553
--- /dev/null
+++ b/recipes-qt/examples/qt5nmapper/change-property-string.patch
@@ -0,0 +1,26 @@
+qt5nmapper:  Change property string to onTextString 
+
+Upstream Status: Pending
+
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


