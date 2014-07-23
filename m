Return-Path: <coldnew.tw@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD1A70836
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 08:52:18 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id fp1so1250050pdb.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 01:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QfuhZeNMLIRxkaYHhGAwNCb8CKCr0Yfr96cY0djToIQ=;
	b=Zb0Kx/Bl9Ni2ofGJAJ549osNY0YI2+x4zPEA09jge3T8H64yy/1lJle0SbzYero85I
	ckd+suQ70M3zEzbjpuaDYwv8egvsFO9aijp1/FhAyb1OA0LDedODeX4bMqm7CQehwFUw
	XTyrH1WZGolWrcV3Z/hDTrsnXeGKqgGF83JB6tN8srOE4k7sM2lQLiUhB1K069EhPmA1
	7EI+U2Zb/7dq6vDvBuSWO1zW+5q3iIPY4ylzGfNC7DcJIw/fUJWjfL4QIReIx+FBe+HR
	8bOI5W1NcFiI1YeUquLmEiPSZBOS7pFDnrw3S3jK7cFBV+MRXVNjEOw7YtNSehaKXivs
	E7Wg==
X-Received: by 10.66.235.134 with SMTP id um6mr18623021pac.129.1406105540110; 
	Wed, 23 Jul 2014 01:52:20 -0700 (PDT)
Received: from localhost.localdomain
	(219-84-253-160-adsl-tai.dynamic.so-net.net.tw. [219.84.253.160])
	by mx.google.com with ESMTPSA id fo2sm1640745pbb.53.2014.07.23.01.52.18
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Jul 2014 01:52:19 -0700 (PDT)
From: coldnew <coldnew.tw@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Jul 2014 16:52:13 +0800
Message-Id: <1406105533-78428-1-git-send-email-coldnew.tw@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [meta-qt5][PATCH] cinematicexperience: fix qt5.3 compatibility
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
X-List-Received-Date: Wed, 23 Jul 2014 08:52:20 -0000

cinematicexperience will run failed on Qt5.3 and Qt5.3.1, error message
as below

------------------------------------------------------------
Qt5_CinematicExperience.qml:26:5: Type MainView unavailable
         MainView {
         ^
/content/MainView.qml:241:9: Type SettingsView unavailable
             SettingsView {
             ^
/content/SettingsView.qml:88:13: Type Switch unavailable
                 Switch {
                 ^
/content/Switch.qml:9:21: Cannot assign a value to a signal (expecting a script to be run)
         property string onText: "On"

                         ^

------------------------------------------------------------

This patch fix this issue and make cinematicexperience can run on qt5.3.

ref: http://wickwire2099.blogspot.tw/2014/05/qt-530-qt5-cinematic-experience.html

Signed-off-by: coldnew <coldnew.tw@gmail.com>
---
 .../fix_qt5_3_compatibility.patch                  | 48 ++++++++++++++++++++++
 recipes-qt/examples/cinematicexperience_1.0.bb     |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 recipes-qt/examples/cinematicexperience/fix_qt5_3_compatibility.patch

diff --git a/recipes-qt/examples/cinematicexperience/fix_qt5_3_compatibility.patch b/recipes-qt/examples/cinematicexperience/fix_qt5_3_compatibility.patch
new file mode 100644
index 0000000..fc132ec
--- /dev/null
+++ b/recipes-qt/examples/cinematicexperience/fix_qt5_3_compatibility.patch
@@ -0,0 +1,48 @@
+Index: Qt5_CinematicExperience_rpi_1.0/content/SettingsView.qml
+===================================================================
+--- Qt5_CinematicExperience_rpi_1.0.orig/content/SettingsView.qml
++++ Qt5_CinematicExperience_rpi_1.0/content/SettingsView.qml
+@@ -127,8 +127,8 @@ Item {
+             Switch {
+                 text: "Do you l-o-v-e colors?"
+                 checked: settings.showColors
+-                onText: "Yes"
+-                offText: "No!"
++                textON: "Yes"
++                textOFF: "No!"
+                 onCheckedChanged: {
+                     settings.showColors = checked;
+                 }
+Index: Qt5_CinematicExperience_rpi_1.0/content/Switch.qml
+===================================================================
+--- Qt5_CinematicExperience_rpi_1.0.orig/content/Switch.qml
++++ Qt5_CinematicExperience_rpi_1.0/content/Switch.qml
+@@ -6,8 +6,8 @@ Item {
+ 
+     property alias text: textItem.text
+     property bool checked: false
+-    property string onText: "On"
+-    property string offText: "Off"
++    property string textON: "On"
++    property string textOFF: "Off"
+ 
+     QtObject {
+         id: priv
+@@ -120,7 +120,7 @@ Item {
+             color: "#000000"
+             font.pixelSize: 18
+             font.bold: true
+-            text: onText
++            text: textON
+         }
+         Text {
+             anchors.verticalCenter: parent.verticalCenter
+@@ -129,7 +129,7 @@ Item {
+             color: "#ffffff"
+             font.pixelSize: 18
+             font.bold: true
+-            text: offText
++            text: textOFF
+         }
+ 
+         Image {
diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/examples/cinematicexperience_1.0.bb
index 9ee5532..116127f 100644
--- a/recipes-qt/examples/cinematicexperience_1.0.bb
+++ b/recipes-qt/examples/cinematicexperience_1.0.bb
@@ -5,6 +5,7 @@ LICENSE = "CC-BY-3.0"
 LIC_FILES_CHKSUM = "file://README;beginline=38;endline=50;md5=51babd597624b70752069953876aaa18"
 
 SRC_URI = "http://quitcoding.com/download/Qt5_CinematicExperience_rpi_1.0.tgz"
+SRC_URI += "file://fix_qt5_3_compatibility.patch"
 
 SRC_URI[md5sum] = "935a5db0a6b2a72c67236e72f52be7d1"
 SRC_URI[sha256sum] = "0dd602983ced5f7c0cfd5ad0fbfe2b0b7e3c9ff715e4ef23eef818ccc2b6c60b"
-- 
1.9.2


