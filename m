Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKou6-00073V-4C
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 11:43:26 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1839288fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 02:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=+fbTSbfSi3paHaxOC83bF2FS1X0bda9vhlPAFxkI2iY=;
	b=wtEXzuOM4hcIGz0zbJIDnlz0YIdNhqm+Q9yZjasWrJ+l6Cofl65qaKxXd1cj0dNUO0
	J3L007/5qFDKzVxcpSs8mevyJLNDMPU+3wWTkL9XH5f+KGrVyklsV13i0W0SqW2f/gQ4
	Bor67aMnXjVTOe/SLdHOLXHwrpnp3HNStRiEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RHl3QjL5mi92S7S7SMrxFPSU45vL7clqFAOfc9ZnXkHnfFaEX1g1kKGMzI43GNoGWB
	n1+5Sp/pv6Z9GXUYP1KMGeBPg1FjuZaxwaHkjaRy7yA/xbI+iI6Iqji9mGdKS7e4dMT6
	USzgkaE7irFCvEmcxRNbzfWvOb5CHjDlFiK6A=
Received: by 10.223.85.155 with SMTP id o27mr1418806fal.109.1305279639698;
	Fri, 13 May 2011 02:40:39 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id o10sm770754faa.43.2011.05.13.02.40.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 02:40:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2011 11:40:09 +0200
Message-Id: <1305279609-31395-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <1305279609-31395-1-git-send-email-Martin.Jansa@gmail.com>
References: <1305279609-31395-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] xinput-calibrator: drop older versions
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
X-List-Received-Date: Fri, 13 May 2011 09:43:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xinput-calibrator.desktop                      |   11 ------
 .../xinput_calibrator_once.sh                      |   11 ------
 ...orgPrint.cpp-fix-miny-and-maxx-printing-o.patch |   36 --------------------
 recipes/xinput-calibrator/xinput-calibrator.inc    |    8 ----
 .../xinput-calibrator/xinput-calibrator_0.5.0.bb   |   19 ----------
 .../xinput-calibrator/xinput-calibrator_0.6.0.bb   |   18 ----------
 .../xinput-calibrator/xinput-calibrator_0.6.1.bb   |   16 ---------
 recipes/xinput-calibrator/xinput-calibrator_git.bb |   20 -----------
 8 files changed, 0 insertions(+), 139 deletions(-)
 delete mode 100644 recipes/xinput-calibrator/xinput-calibrator-0.5.0/xinput-calibrator.desktop
 delete mode 100644 recipes/xinput-calibrator/xinput-calibrator-0.5.0/xinput_calibrator_once.sh
 delete mode 100644 recipes/xinput-calibrator/xinput-calibrator-0.6.0/0001-calibratorXorgPrint.cpp-fix-miny-and-maxx-printing-o.patch
 delete mode 100644 recipes/xinput-calibrator/xinput-calibrator.inc
 delete mode 100644 recipes/xinput-calibrator/xinput-calibrator_0.5.0.bb
 delete mode 100644 recipes/xinput-calibrator/xinput-calibrator_0.6.0.bb
 delete mode 100644 recipes/xinput-calibrator/xinput-calibrator_0.6.1.bb
 delete mode 100644 recipes/xinput-calibrator/xinput-calibrator_git.bb

diff --git a/recipes/xinput-calibrator/xinput-calibrator-0.5.0/xinput-calibrator.desktop b/recipes/xinput-calibrator/xinput-calibrator-0.5.0/xinput-calibrator.desktop
deleted file mode 100644
index 813d7c1..0000000
--- a/recipes/xinput-calibrator/xinput-calibrator-0.5.0/xinput-calibrator.desktop
+++ /dev/null
@@ -1,11 +0,0 @@
-[Desktop Entry]
-Name=Calibrate Xinput Touchscreen
-Name[de]=Xinput Touchscreen Kalibrieren
-Comment=Run the calibration tool for Xinput touchscreens
-Encoding=UTF-8
-Exec=/usr/bin/xinput_calibrator
-Terminal=false
-Type=Application
-Icon=calibrate
-StartupNotify=true
-Categories=System;Settings;
diff --git a/recipes/xinput-calibrator/xinput-calibrator-0.5.0/xinput_calibrator_once.sh b/recipes/xinput-calibrator/xinput-calibrator-0.5.0/xinput_calibrator_once.sh
deleted file mode 100644
index 82fcfc6..0000000
--- a/recipes/xinput-calibrator/xinput-calibrator-0.5.0/xinput_calibrator_once.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-if [ -e /etc/pointercal.xinput ] ; then
-  echo Using calibration data stored in /etc/pointercal.xinput
-  . /etc/pointercal.xinput
-else
-  CAL=`/usr/bin/xinput_calibrator | tee /etc/pointercal.xinput.log | grep xinput| sed 's/^ //g; s/$/;/g'`
-  if [ ! -z "$CAL" ] ; then
-    echo $CAL > /etc/pointercal.xinput
-    echo Calibration data stored in /etc/pointercal.xinput
-  fi
-fi
diff --git a/recipes/xinput-calibrator/xinput-calibrator-0.6.0/0001-calibratorXorgPrint.cpp-fix-miny-and-maxx-printing-o.patch b/recipes/xinput-calibrator/xinput-calibrator-0.6.0/0001-calibratorXorgPrint.cpp-fix-miny-and-maxx-printing-o.patch
deleted file mode 100644
index fa03147..0000000
--- a/recipes/xinput-calibrator/xinput-calibrator-0.6.0/0001-calibratorXorgPrint.cpp-fix-miny-and-maxx-printing-o.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 383a3a8523814d1b108d2dc1ed812f80d6c9f050 Mon Sep 17 00:00:00 2001
-From: Mario Domenech Goulart <mario@ossystems.com.br>
-Date: Thu, 11 Mar 2010 11:05:18 -0300
-Subject: [PATCH] calibratorXorgPrint.cpp: fix miny and maxx printing order for UDEV and HAL
-
-
-Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
----
- src/calibrator/calibratorXorgPrint.cpp |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/calibrator/calibratorXorgPrint.cpp b/src/calibrator/calibratorXorgPrint.cpp
-index 92d297a..1f74de0 100644
---- a/src/calibrator/calibratorXorgPrint.cpp
-+++ b/src/calibrator/calibratorXorgPrint.cpp
-@@ -69,7 +69,7 @@ bool CalibratorXorgPrint::finish_data(const XYinfo new_axys, int swap_xy)
- \tENV{x11_options.miny}=\"%d\"\n\
- \tENV{x11_options.maxx}=\"%d\"\n\
- \tENV{x11_options.maxy}=\"%d\"\n"
--         , new_axys.x_min, new_axys.x_max, new_axys.y_min, new_axys.y_max);
-+         , new_axys.x_min, new_axys.y_min, new_axys.x_max, new_axys.y_max);
-     if (swap_xy != 0)
-         printf("\tENV{x11_options.swapxy}=\"%d\"\n", swap_xy);
-     printf("\tLABEL=\"xorg_touchscreen_end\"\n");
-@@ -81,7 +81,7 @@ bool CalibratorXorgPrint::finish_data(const XYinfo new_axys, int swap_xy)
- \t  <merge key=\"input.x11_options.miny\" type=\"string\">%d</merge>\n\
- \t  <merge key=\"input.x11_options.maxx\" type=\"string\">%d</merge>\n\
- \t  <merge key=\"input.x11_options.maxy\" type=\"string\">%d</merge>\n"
--         , new_axys.x_min, new_axys.x_max, new_axys.y_min, new_axys.y_max);
-+         , new_axys.x_min, new_axys.y_min, new_axys.x_max, new_axys.y_max);
-     if (swap_xy != 0)
-         printf("\t  <merge key=\"input.x11_options.swapxy\" type=\"string\">%d</merge>\n", swap_xy);
-     printf("\t</match>\n");
--- 
-1.6.3.3.444.g4ecbc
-
diff --git a/recipes/xinput-calibrator/xinput-calibrator.inc b/recipes/xinput-calibrator/xinput-calibrator.inc
deleted file mode 100644
index 357b0e5..0000000
--- a/recipes/xinput-calibrator/xinput-calibrator.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-DESCRIPTION = "A generic touchscreen calibration program for X.Org"
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
-LICENSE = "MIT/X11"
-DEPENDS = "virtual/libx11 libxi"
-RDEPENDS_${PN} = "xinput pointercal-xinput"
-INC_PR = "r7"
-
-inherit autotools
diff --git a/recipes/xinput-calibrator/xinput-calibrator_0.5.0.bb b/recipes/xinput-calibrator/xinput-calibrator_0.5.0.bb
deleted file mode 100644
index ba04865..0000000
--- a/recipes/xinput-calibrator/xinput-calibrator_0.5.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require xinput-calibrator.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git \
-           file://xinput-calibrator.desktop \
-           file://xinput_calibrator_once.sh \
-"
-
-SRCREV = "1c715824334c5d33085dba02f195c9720c2883b5"
-S = "${WORKDIR}/git/"
-
-do_install() {
-        install -d ${D}${bindir}
-        install -m 0755 src/xinput_calibrator_x11 ${D}${bindir}/xinput_calibrator
-        install -m 0755 ${WORKDIR}/xinput_calibrator_once.sh ${D}${bindir}/xinput_calibrator_once.sh
-        install -d ${D}${datadir}/applications/
-        install -m 0755 ${WORKDIR}/xinput-calibrator.desktop ${D}${datadir}/applications/xinput-calibrator.desktop
-}
diff --git a/recipes/xinput-calibrator/xinput-calibrator_0.6.0.bb b/recipes/xinput-calibrator/xinput-calibrator_0.6.0.bb
deleted file mode 100644
index 06f46d0..0000000
--- a/recipes/xinput-calibrator/xinput-calibrator_0.6.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xinput-calibrator.inc
-
-SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git \
-           file://0001-calibratorXorgPrint.cpp-fix-miny-and-maxx-printing-o.patch"
-
-SRCREV = "d6e01d780001948f55006698e8e9e48c12894810"
-S = "${WORKDIR}/git/"
-
-PR = "${INC_PR}.0"
-
-do_install_append() {
-        install -d ${D}${bindir}
-        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
-        ln -s ${bindir}/xinput_calibrator_x11 ${D}${bindir}/xinput_calibrator
-        install -d ${D}${datadir}/applications/
-        install -m 0755 scripts/xinput_calibrator.desktop ${D}${datadir}/applications/xinput-calibrator.desktop
-        install -m 0755 scripts/xinput_calibrator_get_hal_calibration.sh ${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
-}
diff --git a/recipes/xinput-calibrator/xinput-calibrator_0.6.1.bb b/recipes/xinput-calibrator/xinput-calibrator_0.6.1.bb
deleted file mode 100644
index 7dc6f29..0000000
--- a/recipes/xinput-calibrator/xinput-calibrator_0.6.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require xinput-calibrator.inc
-
-SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git"
-
-SRCREV = "d2ce98b3f638667dd64b6d718721379b2dc750a7"
-PR = "${INC_PR}.0"
-S = "${WORKDIR}/git/"
-
-do_install_append() {
-        install -d ${D}${bindir}
-        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
-        ln -s ${bindir}/xinput_calibrator_x11 ${D}${bindir}/xinput_calibrator
-        install -d ${D}${datadir}/applications/
-        install -m 0755 scripts/xinput_calibrator.desktop ${D}${datadir}/applications/xinput-calibrator.desktop
-        install -m 0755 scripts/xinput_calibrator_get_hal_calibration.sh ${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
-}
diff --git a/recipes/xinput-calibrator/xinput-calibrator_git.bb b/recipes/xinput-calibrator/xinput-calibrator_git.bb
deleted file mode 100644
index c6188e6..0000000
--- a/recipes/xinput-calibrator/xinput-calibrator_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require xinput-calibrator.inc
-
-PV = "0.6.0+gitr${SRCPV}"
-PR = "${INC_PR}.0"
-
-SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git;branch=misclick"
-
-SRCREV = "496d4401731c6e5ed550e446cc2fc4b12d999ad8"
-S = "${WORKDIR}/git/"
-
-do_install_append() {
-        install -d ${D}${bindir}
-        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
-        ln -s ${bindir}/xinput_calibrator_x11 ${D}${bindir}/xinput_calibrator
-        install -d ${D}${datadir}/applications/
-        install -m 0755 scripts/xinput_calibrator.desktop ${D}${datadir}/applications/xinput-calibrator.desktop
-}
-
-# remove this after misclick branch is well-tested and merged to master
-DEFAULT_PREFERENCE = "-1"
-- 
1.7.5.rc3



