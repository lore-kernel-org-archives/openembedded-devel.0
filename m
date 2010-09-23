Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Oyrrs-0002hk-Dd
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 21:54:11 +0200
Received: by gwb1 with SMTP id 1so757989gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 12:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=tgcrV3AMOyYslaEFJvefS85n0vCMnczuok+gB3v88uo=;
	b=kgXS1fdyHlAHEur7saC9iK8WjeDDp5efZbYa1Tgly++L43uBZ2UODB+D+UbfoNKWrc
	vMI5Dkm1lLPQE/cRUXUsGeCjhSh7+mLH6sMtddmZaGCzTr4yonHzJ3JC5kPBGTfvj3Di
	mOjvVVz9w8vIVFQlrsPVGzml6yKcsS9txVNHs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mjC+miA+RPxcvUT5bZD1h0s46w85eqtmKaN+lLfUhwaLXG/5d/kx/MZFSKE+jge/vf
	JiJLBSZohAPT2OtLuCNeQAtER+7i9Yh948W2X0uwdtpz9a1vk/kV3HDniLdC2p4Cf9jo
	jQHewmz3yJ+0Fpq0XeTEUm3PgOIONtlLxZiEI=
Received: by 10.151.112.18 with SMTP id p18mr3362030ybm.339.1285271641656;
	Thu, 23 Sep 2010 12:54:01 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id q25sm1294122ybk.18.2010.09.23.12.53.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Sep 2010 12:54:00 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Sep 2010 14:41:36 -0500
Message-Id: <1285270897-3618-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285270897-3618-1-git-send-email-chase.maupin@ti.com>
References: <1285270897-3618-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCHv2 2/3] matrix-gui-e: updating to latest source revision
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
X-List-Received-Date: Thu, 23 Sep 2010 19:54:11 -0000

From: Jeff Lance <j-lance1@ti.com>

* Updated recipe to use the latest source revision 131
* Included platform support
* Removed init files from OE repository since they are now part
  of the matrix repository.
* Bumped SRCREV to 136 in version 2 of this patch

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-e/dm365-evm/init |   29 --------------------------
 recipes/ti/matrix-gui-e/init           |   35 --------------------------------
 recipes/ti/matrix-gui-e_svn.bb         |   25 ++++++++++++++++------
 3 files changed, 18 insertions(+), 71 deletions(-)
 delete mode 100755 recipes/ti/matrix-gui-e/dm365-evm/init
 delete mode 100755 recipes/ti/matrix-gui-e/init

diff --git a/recipes/ti/matrix-gui-e/dm365-evm/init b/recipes/ti/matrix-gui-e/dm365-evm/init
deleted file mode 100755
index d860ad9..0000000
--- a/recipes/ti/matrix-gui-e/dm365-evm/init
+++ /dev/null
@@ -1,29 +0,0 @@
-#! /bin/sh
-matrixgui="/usr/bin/matrix_guiE"
-GUI_OPTS="-qws -geometry 720x480+0+10 -display transformed:Rot0 /usr/share/matrix/html/menu_main.html"
-
-test -x "$matrixgui" || exit 0
-
-case "$1" in
-  start)
-
-    chvt 4
-
-    # switch to component 480p mode
-    echo 480P-60 > /sys/class/davinci_display/ch0/mode
-    echo COMPONENT > /sys/class/davinci_display/ch0/output
-    echo -n "Starting Matrix GUI application"
-    start-stop-daemon --start --quiet --background --pidfile /var/run/matrix-gui-e.pid --exec $matrixgui -- $GUI_OPTS
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping Matrix GUI application"
-    start-stop-daemon --stop --quiet --pidfile /var/run/matrix-gui-e.pid
-    echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/matrix-gui-e {start|stop}"
-    exit 1
-esac
-
-exit 0
diff --git a/recipes/ti/matrix-gui-e/init b/recipes/ti/matrix-gui-e/init
deleted file mode 100755
index 266fdca..0000000
--- a/recipes/ti/matrix-gui-e/init
+++ /dev/null
@@ -1,35 +0,0 @@
-#! /bin/sh
-
-matrixgui="/usr/bin/matrix_guiE"
-GUI_OPTS="-qws -display transformed:Rot90 /usr/share/matrix/html/menu_main.html"
-
-test -x "$matrixgui" || exit 0
-
-export TSLIB_TSDEVICE=/dev/input/touchscreen0
-export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
-
-case "$1" in
-  start)
-
-    chvt 4
-
-    if [ ! -f /etc/pointercal ] ; then
-        echo -n "Calibrating touchscreen (first time only)"
-        ts_calibrate
-        echo "."
-    fi
-    echo -n "Starting Matrix GUI application"
-    start-stop-daemon --start --quiet --background --pidfile /var/run/matrix-gui-e.pid --exec $matrixgui -- $GUI_OPTS
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping Matrix GUI application"
-    start-stop-daemon --stop --quiet --pidfile /var/run/matrix-gui-e.pid
-    echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/matrix-gui-e {start|stop}"
-    exit 1
-esac
-
-exit 0
diff --git a/recipes/ti/matrix-gui-e_svn.bb b/recipes/ti/matrix-gui-e_svn.bb
index 35abd25..5570d92 100644
--- a/recipes/ti/matrix-gui-e_svn.bb
+++ b/recipes/ti/matrix-gui-e_svn.bb
@@ -4,13 +4,19 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-SRCREV = "58"
-PV = "1.0"
-PR = "r16+svnr${SRCPV}"
+SRCREV = "136"
+PV = "1.1"
+PR = "r18+svnr${SRCPV}"
 
-SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' \
-	file://init \
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
 
@@ -18,13 +24,18 @@ INITSCRIPT_NAME = "matrix-gui-e"
 INITSCRIPT_PARAMS = "defaults 99"
 #INITSCRIPT_PARAMS = "start 99 3 . stop 99 3 ."
 
+CXXFLAGS_da850-omapl138-evm_append = " -DPlatform_omapl138 "
+CXXFLAGS_dm365_append = " -DPlatform_dm365 "
+PACKAGE_ARCH = ${MACHINE_ARCH}
+
 inherit qt4e update-rc.d
 
 do_install() {
 	install -d ${D}/${bindir}
 	install -m 0755 ${S}/matrix_gui ${D}/${bindir}/matrix_guiE
 	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-e
+	install -c -m 0755 ${S}/${PLATFORM}/etc/init ${D}${sysconfdir}/init.d/matrix-gui-e
+
 }
 
 RRECOMMENDS_${PN} = "qt4-embedded-plugin-mousedriver-tslib qt4-embedded-fonts"
-- 
1.7.0.4



