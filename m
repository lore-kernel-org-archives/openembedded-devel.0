Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 390 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Jan 2016 16:06:32 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.197])
	by mail.openembedded.org (Postfix) with ESMTP id 0BAEA6057B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 16:06:32 +0000 (UTC)
Received: from [216.82.241.132] by server-5.bemta-8.messagelabs.com id
	4D/C2-09301-2079A865; Mon, 04 Jan 2016 16:00:02 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-4.tower-45.messagelabs.com!1451923201!10505775!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 7.35.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20656 invoked from network); 4 Jan 2016 16:00:02 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-4.tower-45.messagelabs.com with SMTP;
	4 Jan 2016 16:00:02 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 4 Jan 2016 16:59:55 +0100
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.248.2; Mon, 4 Jan 2016 16:59:55 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jan 2016 16:59:54 +0100
Message-ID: <1451923194-60100-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-AntiSpam-Interceptor-Info: protection disabled
Subject: [meta-qt5][master][jethro][PATCH] qtconnectivity, qtsystems: fix bluetooth support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jan 2016 16:06:34 -0000
Content-Type: text/plain

QMAKE_CACHE_EVAL is only used in qtwebengine and qtwebkit, but not in
the rest of the QT5 packages, so use EXTRA_QMAKEVARS_PRE to pass the
packageconfig options to the do_configure task.

Also generalize bluetooth support so it can be used not only with bluez4
but with bluez5 as well.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 recipes-qt/qt5/qtconnectivity_git.bb | 9 ++++++---
 recipes-qt/qt5/qtsystems_git.bb      | 9 ++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index b1e155e2b48d..f677f7107465 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -13,11 +13,14 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[bluez4] = "OE_BLUEZ_ENABLED,,bluez4"
+inherit bluetooth
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
+PACKAGECONFIG[bluez] = "CONFIG+=OE_BLUEZ_ENABLED,,${BLUEZ}"
+
+EXTRA_QMAKEVARS_PRE += "${EXTRA_OECONF}"
 
 do_configure_prepend() {
-    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
     # disable bluez test if it isn't enabled by PACKAGECONFIG
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 27d2bff37b51..9d9d245d2d09 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -11,11 +11,14 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative udev gconf"
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[bluez4] = "OE_BLUEZ_ENABLED,,bluez4"
+inherit bluetooth
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
+PACKAGECONFIG[bluez] = "CONFIG+=OE_BLUEZ_ENABLED,,${BLUEZ}"
+
+EXTRA_QMAKEVARS_PRE += "${EXTRA_OECONF}"
 
 do_configure_prepend() {
-    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
     # disable bluez test if it isn't enabled by PACKAGECONFIG
     sed -i 's/^    qtCompileTest(bluez)/    OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtsystems.pro
 }

