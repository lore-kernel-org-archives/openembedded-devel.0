Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1BEB8789BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Mar 2018 21:53:26 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 188so532464wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2018 13:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Db3KOAWx1oSTehTpAeT2vbHsEXoI7imz/VW/o355Bkw=;
	b=UCjGcu3/izaZxU/QWRwnijdO4uvstBBimuE9bCrEkXtQDVy5y0x2YPa58orQpMeHKI
	S5Wi8nhjVUC+Yp0UaKzwBmz0/kpJtNrP5vrZbrF8wo6ElTihTXzta5HvBlR+yp4etRmP
	QOaoWa+/o3px5exH/ZIxA16QP9koebJ5uIwtiFIVbcjBMLsyiG6sPj97cORTRiBeVjkA
	qrC14kP0bP/AGrLaNjS/yH9Ujj3bOVYjnNPLxkwhSO8h6ja2sbjjyIJPrlH89d9PgWhj
	z5tcK3X2VBNeyuQkcIuwqU6iR92z1n9crgUmowewhZmCsIOD2ZwS/44H0nqjgrJZ8aET
	tTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Db3KOAWx1oSTehTpAeT2vbHsEXoI7imz/VW/o355Bkw=;
	b=CHJUQUmoiJ12YE+m9YlbxaVq/a3fLp2Jtr3tE+0NAr7hqfPr/bjWbQBM3OqzqIHXep
	YRaigYWIA6DJXArfY7cELt/spgrJg8y4GWCH0YQVxDs9hTox50ASSvGDFiO9MqZdwZ/J
	qJ2+i/lVAc9twwjuP2TyDowbOyZ1XIVT1Qi7RRGiqMj2vlfbt/gnJf7B9CpA2AnvbpGA
	cHviRSm0fgubedDm4iZhpdopaXt4cizRwNwjshzphLU2TPt3eA01Xbv9E+qwij+CBK3k
	h9pJWNUZdPkvQswW+DIVCVnI1+/H3Ku83TVNgdqn7nH9ps8N29KdWFq/Z64soIQvOMzw
	sGdA==
X-Gm-Message-State: APf1xPAtoM9fcSfw8pMfs9oa5J4mpY4blnCfgjSRsxD1sNnvgB5sjpbv
	FoX1F6fqgBvOA1KDUbEqeaO3MA==
X-Google-Smtp-Source: AG47ELtt9GjWC2vU0YeD+d8h9D3bk6YrR7ahScZsjJHj0D6RA5+q+gkpeqnG0AXEDznqYZEIY29kyQ==
X-Received: by 10.80.182.141 with SMTP id d13mr33725606ede.250.1520546007698; 
	Thu, 08 Mar 2018 13:53:27 -0800 (PST)
Received: from wsadrian2.lan97.ffah.ch (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	l91sm1721100ede.50.2018.03.08.13.53.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Mar 2018 13:53:26 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2018 22:53:00 +0100
Message-Id: <20180308215300.4206-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [meta-oe][PATCH] libiio: update and improve recipe
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
X-List-Received-Date: Thu, 08 Mar 2018 21:53:28 -0000

* Update to latest version 0.14.
* Make depends on avahi, libusb1 and libxml2 optional by
  PACKAGECONFIG or DISTRO flags.
* Install iiod.service file

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 32 ++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index d66ac58d5..ba380ed30 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -4,21 +4,41 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
-SRCREV = "08f947d5e40600259bb698c3b95538e9f2bfecc2"
-PV = "0.8+git${SRCPV}"
+SRCREV = "fa82974d8bd1fded78e630ab71a7ded1b11d0e33"
+PV = "0.14+git${SRCPV}"
 
-SRC_URI = "git://github.com/analogdevicesinc/libiio.git"
+SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "flex-native bison-native avahi libaio libusb1 libxml2"
+inherit cmake pythonnative systemd
 
-inherit cmake pythonnative
+DEPENDS = " \
+    flex-native bison-native libaio \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
+"
+
+EXTRA_OECMAKE = " \
+    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
+    -DUDEV_RULES_INSTALL_DIR=${nonarch_base_libdir}/udev/rules.d \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=ON -DSYSTEMD_UNIT_INSTALL_DIR=${systemd_system_unitdir}', '', d)} \
+"
+
+PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND"
+
+PACKAGECONFIG[USB_BACKEND] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
+PACKAGECONFIG[NETWORK_BACKEND] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
 
 PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python"
 
 RDEPENDS_${PN}-python = "${PN} python-ctypes python-stringold"
 
-FILES_${PN}-iiod = "${sbindir}/iiod"
+FILES_${PN}-iiod = " \
+    ${sbindir}/iiod \
+    ${systemd_system_unitdir}/iiod.service \
+"
 FILES_${PN}-tests = "${bindir}"
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+
+SYSTEMD_PACKAGES = "${PN}-iiod"
+SYSTEMD_SERVICE_${PN}-iiod = "iiod.service"
-- 
2.14.3


