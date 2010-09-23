Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Oyrru-0002i1-7E
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 21:54:16 +0200
Received: by gyg8 with SMTP id 8so552994gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 12:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=sPhm57exxe46tL6zWSW+9NVApD2e+tmDTaBCHYIms80=;
	b=QW95hAK5WMoX6DQl2WJApgsYXI/rh1st1zKd00vaVukL94agUZ9Vup4dkd7cv6Dbfg
	uiYLIWbSdMDEIHlIBQ0hZztObgY7gxOHqPWzvFFalPKA6qM0pLuQMEhmBb8MMu1AnHpI
	DXg2gu15MWUX3XSaU57f4NYX1Fwev9CwqDbos=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DJm/uF4Dy7R2hANPJXSPwtoOf/IwfBxZJyzioxnfE8wx4rq0VwNBp2agyqCm3MGqnv
	LtUoAZX3Ww8Xiqk8kvsrQv1IJp7C0P3Ac2fdtTvhsVQTJSUyQL/Ai0uAok4MXrhtVU3E
	0yqpR++JNS1uCI1v2eEFbu6R7n1alt0H0kuGw=
Received: by 10.150.199.3 with SMTP id w3mr3547802ybf.342.1285271643645;
	Thu, 23 Sep 2010 12:54:03 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id q25sm1294122ybk.18.2010.09.23.12.54.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Sep 2010 12:54:03 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Sep 2010 14:41:37 -0500
Message-Id: <1285270897-3618-3-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285270897-3618-1-git-send-email-chase.maupin@ti.com>
References: <1285270897-3618-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCHv3 3/3] matrix-gui: updating to use latest source revision
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
X-List-Received-Date: Thu, 23 Sep 2010 19:54:16 -0000

From: Jeff Lance <j-lance1@ti.com>

* Use latest source revision 131
* Add platform support for multiple platforms
* Remove un-used files from SRC_URI and repository.
    * init files are now part of the matrix repository
    * matrix-gui.desktop is now part of the matrix repository
    * the cursor override patch is now in the matrix sources
* Bumped SRCREV to 136 in version 3 of this patch

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
index 4bfe7c2..f52294d 100644
--- a/recipes/ti/matrix-gui_svn.bb
+++ b/recipes/ti/matrix-gui_svn.bb
@@ -4,27 +4,35 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-SRCREV = "58"
-PV = "1.0"
-PR = "r14+svnr${SRCPV}"
+SRCREV = "136"
+PV = "1.1"
+PR = "r16+svnr${SRCPV}"
 
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



