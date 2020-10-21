Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.8538.1603268490980702855
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 01:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1kV9N9-0007fE-LG; Wed, 21 Oct 2020 10:21:27 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1kV9N9-00050Z-Bp; Wed, 21 Oct 2020 10:21:27 +0200
From: "Ulrich ?lmann" <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-oe][PATCH v2] usb-modeswitch, usb-modeswitch-data: fix usrmerge
Date: Wed, 21 Oct 2020 10:21:14 +0200
Message-Id: <20201021082114.18927-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
v1 --> v2: As UDEVDIR is only used in the install target of usb-modeswitch's
           Makefile the correct approach seems to be to move the assignment of
           UDEVDIR from EXTRA_OEMAKE to the call of "oe_runmake ... install" in
           do_install().

Detailed range-diff of v2 against v1:
1:  1ea8560eba42 ! 1:  0fd505d26a1e usb-modeswitch, usb-modeswitch-data: fix usrmerge
    @@ meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb: SRC_URI[
                      ${datadir}/usb_modeswitch"
     
      ## meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb ##
    -@@ meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb: inherit pkgconfig systemd
    +@@ meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb: RDEPENDS_${PN} = "tcl"
    + RRECOMMENDS_${PN} = "usb-modeswitch-data"
      
    - SYSTEMD_SERVICE_${PN} = "usb_modeswitch@.service"
    - 
    --EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
    -+EXTRA_OEMAKE = "TCL=${bindir}/tclsh UDEVDIR=${D}/${nonarch_base_libdir}/udev"
    - 
    - FILES_${PN} = "${bindir} ${sysconfdir} ${nonarch_base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
    - RDEPENDS_${PN} = "tcl"
    + do_install() {
    +-    oe_runmake DESTDIR=${D} install
    ++    oe_runmake DESTDIR=${D} UDEVDIR=${D}/${nonarch_base_libdir}/udev install
    +     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
    +         install -d ${D}/${systemd_unitdir}/system
    +         install -m 644 ${S}/usb_modeswitch@.service ${D}/${systemd_unitdir}/system

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

