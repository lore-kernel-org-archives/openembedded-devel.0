Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SI2CC-0001Ys-Ol
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 20:23:08 +0200
Received: by wibhm17 with SMTP id hm17so3971901wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 11:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=6809Wx2JaLBZe8VZY4SPbi7xuLVTbrintP+A+LDYMTs=;
	b=e7bJ6wtSajB+nHYc9KRDjlPpKtyr/VJOHwcQQK1lqlEb9emq6QNVz1bLIEOfg5GUDc
	/ZEDaJuFSPOiUEaJhhcfSa7WTUFAR62uVEVvxbXYgZmOL0DfIyZIkedvJJDdtOSTWFK7
	IohtTlalKEN/gAD2cXJPnOdU/CU3sFdlzEJFZTO6ambEd8ZI4E217/LrTx/YfR8dZZ6X
	TWONJKAvrnbqm/yolF/j+bcGl1hurjh/ph5/OBNDyn5LRNn6MdaNsAzkhR74r7hR7zaM
	tO67oL1TbnZd/56t9H1wtZolXPfQFAvt2TDhc7ZWQKI7RV9K/00NXIzGIqfseh9SkQp0
	32zA==
Received: by 10.180.88.164 with SMTP id bh4mr8693216wib.22.1334168029559;
	Wed, 11 Apr 2012 11:13:49 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm12097739wib.7.2012.04.11.11.13.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 11:13:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Apr 2012 20:13:44 +0200
Message-Id: <1334168024-27789-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQnauIWvzQQPujcv29KD5W+SPxDc6D3rpE4pc8BmK70wOKJ5lfyjt15tai8Y4mERQpMltwWo
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe] xinput-calibrator 0.7.5: run xinput_calibrator_once.sh using XDG autostart mechanism
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
X-List-Received-Date: Wed, 11 Apr 2012 18:23:08 -0000

This runs when the session starts so after the DM. Not a great solution, but at least it will popup a calibration dialog automatically and restore calibration on subsequent sessions.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../xinput-calibrator-autostart.desktop            |    8 ++++++++
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    7 ++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator-autostart.desktop

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator-autostart.desktop b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator-autostart.desktop
new file mode 100644
index 0000000..3f3d613
--- /dev/null
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator-autostart.desktop
@@ -0,0 +1,8 @@
+[Desktop Entry]
+Name=Calibrate Touchscreen
+Exec=xinput_calibrator_once.sh
+Terminal=false
+Type=Application
+Icon=xinput_calibrator
+StartupNotify=true
+Categories=System;Settings;
diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
index d823e0e..a50a0cf 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
@@ -4,13 +4,14 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
 DEPENDS = "virtual/libx11 libxi"
 
-PR = "r4"
+PR = "r5"
 
 inherit autotools systemd
 
 SRC_URI = "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz \
            file://0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch \
            file://xinput-calibrator.service \
+           file://xinput-calibrator-autostart.desktop \
 "
 SRC_URI[md5sum] = "20da0a2055a5a75962add8c6b44f60fa"
 SRC_URI[sha256sum] = "baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971"
@@ -23,10 +24,14 @@ EXTRA_OECONF += "--with-gui=x11"
 do_install_append() {
         install -d ${D}${bindir}
         install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
+
+        install -d ${D}${sysconfdir}/xdg/autostart
+        install -m 0644 ${WORKDIR}/xinput-calibrator-autostart.desktop ${D}${sysconfdir}/xdg/autostart
 }
 
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE = "${PN}.service"
 
+FILES_${PN} += "${sysconfdir}/xdg/autostart"
 RDEPENDS_${PN} = "xinput"
 RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
1.7.2.5



