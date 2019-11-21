Return-Path: <jlu@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 274957E507
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 12:28:48 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iXlGx-0005Vc-80; Thu, 21 Nov 2019 13:09:19 +0100
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iXlGw-0007HH-Ux; Thu, 21 Nov 2019 13:09:18 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Nov 2019 13:09:09 +0100
Message-Id: <20191121120913.23013-2-jlu@pengutronix.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121120913.23013-1-jlu@pengutronix.de>
References: <20191121120913.23013-1-jlu@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/6] pcsc-lite: add support for native builds
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
X-List-Received-Date: Thu, 21 Nov 2019 12:28:48 -0000
Content-Transfer-Encoding: 8bit

This is needed as a dependency when using SoftHSM from the PKCS#11
OpenSSL engine for code singing.

Add a udev PACKAGECONFIG, as this is only useful on the target. Also
don't RRECOMMEND ccid for the native variant.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
index a87c228a8374..33f7f839cb1b 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
@@ -9,7 +9,6 @@ LICENSE_${PN}-dbg = "BSD & GPLv3+"
 LICENSE_${PN}-spy = "GPLv3+"
 LICENSE_${PN}-spy-dev = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
-DEPENDS = "udev"
 
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
 SRC_URI[md5sum] = "c20650a36062ab1689f37f3302c988f2"
@@ -19,19 +18,21 @@ inherit autotools systemd pkgconfig
 
 EXTRA_OECONF = " \
     --disable-libusb \
-    --enable-libudev \
     --enable-usbdropdir=${libdir}/pcsc/drivers \
 "
 
 S = "${WORKDIR}/pcsc-lite-${PV}"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} udev"
+PACKAGECONFIG_class-native ??= ""
 
 PACKAGECONFIG[systemd]  = ",--disable-libsystemd,systemd,"
+PACKAGECONFIG[udev] = "--enable-libudev,--disable-libudev,udev"
 
 PACKAGES = "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy ${PN}-spy-dev"
 
 RRECOMMENDS_${PN} = "ccid"
+RRECOMMENDS_${PN}_class-native = ""
 
 FILES_${PN} = "${sbindir}/pcscd"
 FILES_${PN}-lib = "${libdir}/libpcsclite*${SOLIBS}"
@@ -50,3 +51,5 @@ RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "pcscd.socket"
 RDEPENDS_${PN}-spy +="python"
+
+BBCLASSEXTEND="native"
-- 
2.24.0


