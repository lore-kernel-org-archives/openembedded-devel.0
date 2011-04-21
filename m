Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCrF9-0001kG-3n
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Apr 2011 12:36:15 +0200
Received: by wwb17 with SMTP id 17so1612383wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2011 03:33:51 -0700 (PDT)
Received: by 10.216.68.17 with SMTP id k17mr1818238wed.109.1303382030633;
	Thu, 21 Apr 2011 03:33:50 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ed10sm1101513wbb.32.2011.04.21.03.33.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 03:33:50 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Apr 2011 12:33:20 +0200
Message-Id: <1303382002-23874-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 1/3] xserver-common 1.34: make it work with xserver-nodm-init
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
X-List-Received-Date: Thu, 21 Apr 2011 10:36:15 -0000

* Move SHR patches to main SRC_URI, they are generic and good enough for everyone
* Start x-window-manager
* Run through oe-stylize
* Remove duplicated LICENSE
* Add reconflicts with x11-common as well

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../xserver-common/xserver-common_1.34.bb          |   38 ++++++++++----------
 1 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index b994dfb..0d59ab7 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -1,14 +1,8 @@
 DESCRIPTION = "Common X11 scripts and support files"
-LICENSE = "GPL"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo fbset"
-PR = "r1"
 
-PACKAGE_ARCH = "all"
-
-RCONFLICTS_${PN} = "xserver-kdrive-common"
-RREPLACES_${PN} = "xserver-kdrive-common"
+PR = "r2"
 
 # we are using a gpe-style Makefile
 inherit gpe
@@ -19,20 +13,26 @@ SRC_URI[sha256sum] = "cd04c33418f776b1e13fcc7af3d6bd0c7cccd03fbabd7dbcd97f88166c
 SRC_URI_append = " \
                    file://gplv2-license.patch \
                    file://setDPI.sh \
-                   file://89xdgautostart.sh"
+                   file://89xdgautostart.sh \
+                   file://89xTs_Calibrate.xinput_calibrator.patch \
+                   file://90xXWindowManager.patch \
+                   file://Xserver.add.xserver-system.patch \
+                   file://Xserver.add.nocursor.for.gta.patch \
+                   file://Xserver.add.dpi.for.gta.patch \
+                   file://Xserver.n900.patch \
+"
 
-RDEPENDS_${PN}_append_shr = " xinput-calibrator "
-
-SRC_URI_append_shr = " file://89xTs_Calibrate.xinput_calibrator.patch \
-                       file://90xXWindowManager.patch \
-                       file://Xserver.add.nocursor.for.gta.patch \
-                       file://Xserver.add.xserver-system.patch \
-                       file://Xserver.add.dpi.for.gta.patch \
-		       file://Xserver.n900.patch"
 
 do_install_append() {
-	install -m 0755 "${WORKDIR}/setDPI.sh" "${D}/etc/X11/Xinit.d/50setdpi"
-	install -m 0755 "${WORKDIR}/89xdgautostart.sh" "${D}/etc/X11/Xsession.d/89xdgautostart"
-	sed -i 's:^BINDIR=.*$:BINDIR=${bindir}:' ${D}/etc/X11/xserver-common
+        install -m 0755 "${WORKDIR}/setDPI.sh" "${D}/etc/X11/Xinit.d/50setdpi"
+        install -m 0755 "${WORKDIR}/89xdgautostart.sh" "${D}/etc/X11/Xsession.d/89xdgautostart"
+        sed -i 's:^BINDIR=.*$:BINDIR=${bindir}:' ${D}/etc/X11/xserver-common
 }
 
+PACKAGE_ARCH = "all"
+
+RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo fbset xinput-calibrator"
+
+RCONFLICTS_${PN} = "xserver-kdrive-common x11-common"
+RREPLACES_${PN} = "xserver-kdrive-common x11-common"
+
-- 
1.6.6.1



