Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OynAQ-0002FM-Le
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 16:53:00 +0200
Received: by gyg8 with SMTP id 8so418380gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 07:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=dCmbnJMY/xV5ZKRYGEZNRbuTZra5xU9ItHCYNd8DODw=;
	b=xK5XzkDKiEeQi36DF31OR7yFmoEHNNKD/i8DQKfqP80vx4fGiS4wodAAQn1Nm9+UEq
	lwUNRiIBzy79u7+Yp1UIaatrz/m3Zz3MZQIfBdiYeU9YanNyG4nBganGFM2BcfKTrfkP
	nyBDzVZGtzqP6Gchm2DsW1dMSOAEMeWjtiwcA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=kuGX0zUXt9ou86CvNCTDpZx31/FLF+StivQZlAy0XVOQ3XsVlukCnIglbgNXtv0IuS
	VlShOU75PMGHgUsMfKvYXCEmZO9G8qPk6Am6CQHLjmqaH3GOkvdMaLzIXJa6d/64oHaW
	xiE/1eL9m/wj4ktBQF1n/Wq0x18alwrazmpA8=
Received: by 10.100.232.8 with SMTP id e8mr2166369anh.42.1285253570254;
	Thu, 23 Sep 2010 07:52:50 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x33sm1534575ana.33.2010.09.23.07.52.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Sep 2010 07:52:48 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Sep 2010 09:40:29 -0500
Message-Id: <1285252829-31313-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCHv2 3/3] matrix-gui: updating to use latest source revision
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Sep 2010 14:53:00 -0000

From: Jeff Lance <j-lance1@ti.com>

* Use latest source revision 131
* Add platform support for multiple platforms
* Remove un-used files from SRC_URI and repository.
    * init files are now part of the matrix repository
    * matrix-gui.desktop is now part of the matrix repository
    * the cursor override patch is now in the matrix sources

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 .../0001-Disable-cursor-override-for-X11.patch     |   27 ------------------
 recipes/ti/matrix-gui/dm365-evm/init               |   26 -----------------
 recipes/ti/matrix-gui/init                         |   24 ----------------
 recipes/ti/matrix-gui/matrix-gui.desktop           |    7 ----
 recipes/ti/matrix-gui_svn.bb                       |   30 ++++++++++++-------
 5 files changed, 19 insertions(+), 95 deletions(-)
 delete mode 100644 recipes/ti/matrix-gui/0001-Disable-cursor-override-for-X11.patch
 delete mode 100644 recipes/ti/matrix-gui/dm365-evm/init
 delete mode 100644 recipes/ti/matrix-gui/init
 delete mode 100644 recipes/ti/matrix-gui/matrix-gui.desktop

diff --git a/recipes/ti/matrix-gui/0001-Disable-cursor-override-for-X11.patch b/recipes/ti/matrix-gui/0001-Disable-cursor-override-for-X11.patch
deleted file mode 100644
index 61eba44..0000000
--- a/recipes/ti/matrix-gui/0001-Disable-cursor-override-for-X11.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b0e91f703ffdcc73f854a672ec16ebbf21293c9c Mon Sep 17 00:00:00 2001
-From: Chase Maupin <chase.maupin@ti.com>
-Date: Mon, 24 May 2010 12:51:49 -0500
-Subject: [PATCH] Disable cursor override for X11
-
-* Disable the cursor override option for using the matrix_gui
-  program with X11.
----
- main.cpp |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/main.cpp b/main.cpp
-index 978e327..1f55e94 100644
---- a/main.cpp
-+++ b/main.cpp
-@@ -43,7 +43,7 @@ int main(int argc, char * argv[])
- {
-     QApplication matrix(argc, argv);
-     QApplication::setStyle(new CustomStyle);
--    QApplication::setOverrideCursor(QCursor(Qt::BlankCursor));
-+//    QApplication::setOverrideCursor(QCursor(Qt::BlankCursor));
- 
-     // Create a new window to display a web page.
-     MainWindow * pWindow = new MainWindow(0, QString(argv[1]), true);
--- 
-1.6.0.4
-
diff --git a/recipes/ti/matrix-gui/dm365-evm/init b/recipes/ti/matrix-gui/dm365-evm/init
deleted file mode 100644
index 3aadc1e..0000000
--- a/recipes/ti/matrix-gui/dm365-evm/init
+++ /dev/null
@@ -1,26 +0,0 @@
-#! /bin/sh
-matrixgui="/usr/bin/matrix_gui"
-GUI_OPTS="-geometry 720x480+0+10 -display transformed:Rot0 /usr/share/matrix/html/menu_main.html"
-
-test -x "$matrixgui" || exit 0
-
-case "$1" in
-  start)
-    # switch to component 480p mode
-    echo 480P-60 > /sys/class/davinci_display/ch0/mode
-    echo COMPONENT > /sys/class/davinci_display/ch0/output
-    echo -n "Starting Matrix GUI application"
-    start-stop-daemon --start --quiet --background --pidfile /var/run/matrix-gui.pid --exec $matrixgui -- $GUI_OPTS
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping Matrix GUI application"
-    start-stop-daemon --stop --quiet --pidfile /var/run/matrix-gui.pid
-    echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/matrix-gui {start|stop}"
-    exit 1
-esac
-
-exit 0
diff --git a/recipes/ti/matrix-gui/init b/recipes/ti/matrix-gui/init
deleted file mode 100644
index 40b6512..0000000
--- a/recipes/ti/matrix-gui/init
+++ /dev/null
@@ -1,24 +0,0 @@
-#! /bin/sh
-
-matrixgui="/usr/bin/matrix_gui"
-GUI_OPTS="/usr/share/matrix/html/menu_main.html"
-
-test -x "$matrixgui" || exit 0
-
-case "$1" in
-  start)
-    echo -n "Starting Matrix GUI application"
-    start-stop-daemon --start --quiet --background --pidfile /var/run/matrix-gui.pid --exec $matrixgui -- $GUI_OPTS
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping Matrix GUI application"
-    start-stop-daemon --stop --quiet --pidfile /var/run/matrix-gui.pid
-    echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/matrix-gui {start|stop}"
-    exit 1
-esac
-
-exit 0
diff --git a/recipes/ti/matrix-gui/matrix-gui.desktop b/recipes/ti/matrix-gui/matrix-gui.desktop
deleted file mode 100644
index 52b5831..0000000
--- a/recipes/ti/matrix-gui/matrix-gui.desktop
+++ /dev/null
@@ -1,7 +0,0 @@
-[Desktop Entry]
-Name=Matrix GUI
-Comment=Start the Matrix GUI application
-Exec=/usr/bin/matrix_gui /usr/share/matrix/html/menu_main.html
-Terminal=false
-Type=Application
-X-GNOME-Autostart-enabled=true
diff --git a/recipes/ti/matrix-gui_svn.bb b/recipes/ti/matrix-gui_svn.bb
index 4bfe7c2..843e1c5 100644
--- a/recipes/ti/matrix-gui_svn.bb
+++ b/recipes/ti/matrix-gui_svn.bb
@@ -4,27 +4,35 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-SRCREV = "58"
-PV = "1.0"
-PR = "r14+svnr${SRCPV}"
+SRCREV = "131"
+PV = "1.1"
+PR = "r15+svnr${SRCPV}"
 
-SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' \
-    file://0001-Disable-cursor-override-for-X11.patch \
-	file://init \
-    file://matrix-gui.desktop \
-"
+PLATFORM_dm365 = "dm365"
+PLATFORM_da850-omapl138-evm = "omapl138"
+PLATFORM_omap3evm = "omap3530"
+PLATFORM_dm37x-evm = "dm3730"
+PLATFORM_am37x-evm = "am3715"
+PLATFORM_beagleboard = "am3715"
+PLATFORM ?= "<UNDEFINED>"
+
+SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' "
 
 S = "${WORKDIR}/trunk"
 
+CXXFLAGS_da850-omapl138-evm_append = " -DPlatform_omapl138 "
+CXXFLAGS_dm365_append = " -DPlatform_dm365 "
+PACKAGE_ARCH = ${MACHINE_ARCH}
+
 inherit qt4x11
 
 do_install() {
 	install -d ${D}/${bindir}
 	install -m 0755 ${S}/matrix_gui ${D}/${bindir}
 	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui
-    install -d ${D}/${sysconfdir}/xdg/autostart
-    install -m 0755 ${WORKDIR}/matrix-gui.desktop ${D}/${sysconfdir}/xdg/autostart
+	install -c -m 0755 ${S}/${PLATFORM}/etc/x11/init ${D}${sysconfdir}/init.d/matrix-gui
+	install -d ${D}/${sysconfdir}/xdg/autostart
+	install -m 0755 ${S}/${PLATFORM}/etc/x11/matrix-gui.desktop ${D}/${sysconfdir}/xdg/autostart
 }
 
 FILES_${PN}-autostart = "${sysconfdir}/xdg/autostart/matrix-gui.desktop"
-- 
1.7.0.4



