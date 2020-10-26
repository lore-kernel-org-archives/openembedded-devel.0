Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web08.9244.1603692021292964901
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2020 23:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1kWvYI-0006Gu-LN; Mon, 26 Oct 2020 07:00:18 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1kWvYH-0007d0-8x; Mon, 26 Oct 2020 07:00:17 +0100
From: "Ulrich ?lmann" <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-oe][dunfell][PATCH] usb-modeswitch, usb-modeswitch-data: fix usrmerge
Date: Mon, 26 Oct 2020 07:00:17 +0100
Message-Id: <20201026060017.29276-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 50a487fc0b0123b154db73f79bbb18b23eb234f0)
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 .../usb-modeswitch/usb-modeswitch-data_20191128.bb            | 4 ++--
 .../recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
index 938c0f9c26bd..ca970e59bb3a 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
@@ -11,9 +11,9 @@ SRC_URI[md5sum] = "e8fce7eb949cbe16c61fb71bade4cc17"
 SRC_URI[sha256sum] = "3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9"
 
 do_install() {
-    oe_runmake install DESTDIR=${D}
+    oe_runmake install DESTDIR=${D} RULESDIR=${D}/${nonarch_base_libdir}/udev/rules.d
 }
 
 RDEPENDS_${PN} = "usb-modeswitch (>= 2.4.0)"
-FILES_${PN} += "${base_libdir}/udev/rules.d/ \
+FILES_${PN} += "${nonarch_base_libdir}/udev/rules.d/ \
                 ${datadir}/usb_modeswitch"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
index baad340908ac..6a5287af4959 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
@@ -19,7 +19,7 @@ RDEPENDS_${PN} = "tcl"
 RRECOMMENDS_${PN} = "usb-modeswitch-data"
 
 do_install() {
-    oe_runmake DESTDIR=${D} install
+    oe_runmake DESTDIR=${D} UDEVDIR=${D}/${nonarch_base_libdir}/udev install
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}/${systemd_unitdir}/system
         install -m 644 ${S}/usb_modeswitch@.service ${D}/${systemd_unitdir}/system
-- 
2.28.0

