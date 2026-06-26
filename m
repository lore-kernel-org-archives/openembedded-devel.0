Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA030C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:10:17 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37211.1782486611374275444
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm2 header.b=iGLc958M;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=WnQi0BLD;
 spf=pass (domain: schnwalter.eu, ip: 202.12.124.159, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9F0827A016D;
	Fri, 26 Jun 2026 11:10:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 26 Jun 2026 11:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1782486610; x=
	1782573010; bh=HP2ZclSJLt09a/5AjT9vniUNBDrxpVAH3+mJCqghhZE=; b=i
	GLc958MINP6lbK1ITg9p5vyARE8m4ofgib10VFaGBjxa092nlZiJmgTLrgT4UGVs
	PS7R/+TNaTyJs12pnHzwipoZ0oDQmEXTW04oMVFrRgOYcMilKmSLppMKUPZPqlR2
	2/DHfx2XdF6EegyIh5AtY/3cHc1T+QQO9XqpxaR694ADiZ9IfRjg3z9AFeeAckKn
	bit8nw/1FMjDrRtrX4Lcor/ihxuPJPsHqjoMLkbi6Ez7UeiUprQuCd+C0bFOuvCW
	vsq9GMehvjijMwj0nvq6vRrGHUU+f9LjN2fJWOr2U23KdP4fd/aotm3M/B40jnjq
	m6P3QTVXv5+m+p5t0H95Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1782486610; x=1782573010; bh=HP2ZclSJLt09a/5AjT9vniUNBDrx
	pVAH3+mJCqghhZE=; b=WnQi0BLDrWaYop+0+mZmpirPNnl5i6OOWP3pbZnPFUqa
	5mrojMtBw+iVgFJwwZwTlbYIZGVNfLRnJOImvATem8sGmLnWOix+L8WiMVIFl+fc
	U1YyvKaV+4K7xueLEM9Q/ep/JRGsIhpzTL9TIzVY/jyYL/YbgnWHFVSwlLt+Dstt
	RiRGpwBw+yuccNt4mQBBIVSLwtqYkc5nxiVlSXDyfelsZYOegMBTQhKHLgc3tsFU
	KzWKVk1wrX9gtpwzjlymJ3xsbkRtwbD14A3iTIjPavI1ZMNsGAB0NxRhmktBXj1l
	oqAmhADJM4kyC6+hbJWQaMmk8THK63g92kuxYoLG7g==
X-ME-Sender: <xms:UpY-arAObPO4k4aUJjKaZ4m5qhX9QFtyATFP6Pd0dv5D22O6RzcVfQ>
    <xme:UpY-angACL3FfjBVtaDy5s6pdb8IHW1hD7tb1_BZJT3jobmCuRqRVln2Y9avoPs5i
    -n5iRLm4fgOXbt6AmiObxaqlGmrf6l2HNAhXhKpLnZlA06q2q6rFQ>
X-ME-Received: <xmr:UpY-akP5vF-PedBLJu2gjSvFXPmJaR_0jrpiLD3lE_xzqQrInYAY3Lw4XiuosYL9iBgQ9g>
X-ME-Proxy-Cause: dmFkZTF50sWUfrVbGTaminQ6jMMxdFm/dhcxM+MB7MORaphq20OEUd0+Z5038quj3fXA1S
    vfzq5YwQ1jfT5y0d7FYsuK1j9Y4c7+47+6Up8DB8RWlVnuvXRbYpvZemnKBpJezQ/VFTlX
    Prt8sC5IRaEtzjDzkHsr8xpTooguXbDI578NKHFRfv2MNtEoUMC2MNzk1TZVFAGk0iwEbg
    mRKCDTDBsnJOPH2Ae+efROGp4pkxUIe/dk8f/O7MhW3tNQWS528OIUJ8s0GaFPrZPIYCUd
    7J4DUTBLd8oUfQnAp5hVviBUFFjg1T4NBbtB6svWxYrcDiuDi0fOIFw3iMM1ns1PRYgahA
    orlDNK+XhI8OvrDeSKOOgdUNEhHZ1DDftWWdMVNWQH0XVTb2QIm1+/Xva45XllPS8qEVWt
    kSE5HcoVILbMshMUTsc97wKfFEr8lOa0BVdyCm5HrwyzBRhIDK79V6hVSES8um9NqFrC+k
    SzUuVD5ZLXQer6b0w7uUBQYQatbt/rPv66qlqXHnRG2fo/AmlGKZdPdaZ+30jOkNj3d36f
    bS1wVsf0uXAEsNP+vCJxhUgFzkda63ZhOPqwt8jkWiQESnxw3Iy3b1/JOBxet+St/sU0rk
    PX7lozgaXlZrnxLKboSM8ppZatSOf3tsEm70AjnG+oW01MBk2zDDsqksOFbg
X-ME-Proxy: <xmx:UpY-ao6cBpcT1vt7CWDGjLUVkqmhPjhscP8Q68FdIt7PBpL9YmJugA>
    <xmx:UpY-ai26Jp8m2A14OmZK_4GvvBMnpTwJ18jboImURLu4_LoHutfs7Q>
    <xmx:UpY-apae1dPDxAqVTWyqspPs6X32-56wFtDD2RAnziF3nMlheKY4sg>
    <xmx:UpY-aqD8S0CspaLNUkAtDchOGkQHQdoZm_G1DBOLuKTWvnu01xLLow>
    <xmx:UpY-avmczjcJi2snkFu9gLcChGvM9zWO6Jc9U-XqMvu7_eH257sxlgxx>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Jun 2026 11:10:09 -0400 (EDT)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Fri, 26 Jun 2026 18:09:57 +0300
Subject: [meta-oe][PATCH] zbar: upgrade 89e7900d85dd -> 0.23.93
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-upgrade-zbar-v1-1-b06f7acc6e24@schnwalter.eu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxG4asgz7WUZnChV0EMAf6CkQrIgaoCc
 XfSMn7DeztFmCLSM9vJ8NGo05hwv2XU9GHswNomk3denHjhde4stOCtDsa5K1C4RJEHpWQ2vPT
 735XV5bjWA5rl9yjfWAJPqOg4TrPGW8R5AAAA
X-Change-ID: 20260626-upgrade-zbar-809e90ade667
To: openembedded-devel@lists.openembedded.org
Cc: Walter Werner Schneider <contact@schnwalter.eu>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782486609; l=7551;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=bHkdWnwHbkgzhjdoJu6vzTTAakK8Ug9tFL+CZfnViH0=;
 b=M+Wh272UYeOLdybSDmqIaSBXF8Y1jagEI6XkfwCDV66ypXiadu5OFSBObixWXBW2IE8EcQ6p2
 ed90m/5JsfpAq7gNX31pePukuqJu9yZ12EQF4Guvl74eUY9oBDGIohr
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 15:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127801

Upgrade zbar from 89e7900d85dd (2020-12-31) to 0.23.93 (2024-01-09).

Removed all patches because they have been merged upstream.

Enabled pthread integration by default and renamed configs to match
upstream.

Tested the python API and gstreamer integration, I wasn't able to test
any of the various package configs that are related to GUIs because I
don't have a access to boards with displays.

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
 .../zbar/0001-qt-Create-subdir-in-Makefile.patch   | 37 -------------------
 .../0002-zbarcam-Create-subdir-in-Makefile.patch   | 42 ----------------------
 .../zbar/{zbar_git.bb => zbar_0.23.93.bb}          | 29 +++++++--------
 3 files changed, 12 insertions(+), 96 deletions(-)

diff --git a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
deleted file mode 100644
index 3d8c07f02b..0000000000
--- a/meta-oe/recipes-support/zbar/zbar/0001-qt-Create-subdir-in-Makefile.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 9c67f377477a07495a712f478eabfa8d33164c45 Mon Sep 17 00:00:00 2001
-From: Daniel Gomez <dagmcr@gmail.com>
-Date: Sun, 17 Jan 2021 23:32:51 +0100
-Subject: [PATCH 1/2] qt: Create subdir in Makefile
-
-Create builddir/qt subdir when --with-qt5 is enabled.
-
-Fixes the following error:
-
-moc -Iqt -DQT_WIDGETS_LIB -DQT_GUI_LIB -DQT_CORE_LIB
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore
--I../git/include ../git/include/zbar/QZBar.h -o qt/moc_QZBar.cpp
-moc: Cannot create qt/moc_QZBar.cpp
-make: *** [Makefile:2459: qt/moc_QZBar.cpp] Error 1
-
-Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
----
-Upstream-Status: Pending
-
- qt/Makefile.am.inc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/qt/Makefile.am.inc b/qt/Makefile.am.inc
-index b099c2b..c98fbeb 100644
---- a/qt/Makefile.am.inc
-+++ b/qt/Makefile.am.inc
-@@ -15,4 +15,5 @@ qt/moc_%.cpp: qt/%.h
- 	$(MOC) $(qt_libzbarqt_la_CPPFLAGS) $< -o $@
- 
- qt/moc_%.cpp: include/zbar/%.h
-+	@$(mkdir_p) qt 2>/dev/null
- 	$(MOC) $(qt_libzbarqt_la_CPPFLAGS) $< -o $@
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch b/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
deleted file mode 100644
index 9030ed88f2..0000000000
--- a/meta-oe/recipes-support/zbar/zbar/0002-zbarcam-Create-subdir-in-Makefile.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From fe751929ccc8fd75e350ed6db9d28d04bd31fc79 Mon Sep 17 00:00:00 2001
-From: Daniel Gomez <dagmcr@gmail.com>
-Date: Sun, 17 Jan 2021 23:33:19 +0100
-Subject: [PATCH 2/2] zbarcam: Create subdir in Makefile
-
-Create builddir/zbarcam when --with-qt5 is enabled.
-
-Fixes the following error:
-
-moc -i -Izbarcam -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB
--DQT_CORE_LIB
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtWidgets
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtX11Extras
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtGui
--I/var/lib/yocto/gallium/tmp_20210113/work/znver1-poky-linux/zbar/0.23.1+gitAUTOINC+89e7900d85-r0/recipe-sysroot/usr/include/QtCore
--I../git/include ../git/zbarcam/zbarcam-qt.cpp -o
-zbarcam/moc_zbarcam_qt.h
-moc: Cannot create zbarcam/moc_zbarcam_qt.h
-make: *** [Makefile:2438: zbarcam/moc_zbarcam_qt.h] Error 1
-
-Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
----
-Upstream-Status: Pending
-
- zbarcam/Makefile.am.inc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/zbarcam/Makefile.am.inc b/zbarcam/Makefile.am.inc
-index b6de82c..e90c50c 100644
---- a/zbarcam/Makefile.am.inc
-+++ b/zbarcam/Makefile.am.inc
-@@ -28,6 +28,7 @@ DISTCLEANFILES += $(nodist_zbarcam_zbarcam_qt_SOURCES) zbarcam/moc_zbarcam_qt.h
- 
- 
- zbarcam/moc_zbarcam_qt.h: zbarcam/zbarcam-qt.cpp
-+	@$(mkdir_p) zbarcam 2>/dev/null
- 	$(MOC) -i $(zbarcam_zbarcam_qt_CPPFLAGS) $< -o $@
- endif
- 
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-support/zbar/zbar_0.23.93.bb
similarity index 62%
rename from meta-oe/recipes-support/zbar/zbar_git.bb
rename to meta-oe/recipes-support/zbar/zbar_0.23.93.bb
index 053e0161d7..36a9a5c827 100644
--- a/meta-oe/recipes-support/zbar/zbar_git.bb
+++ b/meta-oe/recipes-support/zbar/zbar_0.23.93.bb
@@ -9,41 +9,36 @@ SECTION = "graphics"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5e9ee833a2118adc7d8b5ea38e5b1cef"
 
-SRC_URI = "git://github.com/mchehab/zbar.git;branch=master;protocol=https \
-    file://0001-qt-Create-subdir-in-Makefile.patch \
-    file://0002-zbarcam-Create-subdir-in-Makefile.patch \
-"
-SRCREV = "89e7900d85dd54ef351a7ed582aec6a5a5d7fa37"
-
-PV = "0.23.1+git"
+SRC_URI = "git://github.com/mchehab/zbar.git;branch=master;protocol=https;tag=${PV}"
+SRCREV = "bb05ec54eec57f8397cb13fb9161372a281a1219"
 
 DEPENDS += "xmlto-native"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    video \
 "
 
-PACKAGECONFIG ??= "video"
-
 inherit autotools pkgconfig gettext \
-    ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gtk3', 'gobject-introspection',	'', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '', d)}
+    ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gtk', 'gobject-introspection', '', d)}
 
-PACKAGECONFIG[x11] = "--with-x, --without-x, libxv"
+PACKAGECONFIG[x11] = ",, libxext libxv"
 PACKAGECONFIG[video] = "--enable-video, --disable-video, v4l-utils libv4l"
 PACKAGECONFIG[jpeg] = "--with-jpeg, --without-jpeg, jpeg"
-PACKAGECONFIG[python3] = "--with-python=auto, --without-python, python3"
-PACKAGECONFIG[gtk3] = "--with-gtk=gtk3, --without-gtk, gtk+3"
-PACKAGECONFIG[qt5] = "--with-qt5, --without-qt5, qtbase qtbase-native qtx11extras qtsvg, qtbase"
+PACKAGECONFIG[python] = "--with-python=auto, --without-python, python3"
+PACKAGECONFIG[gtk] = "--with-gtk=auto, --without-gtk, gtk+3"
+PACKAGECONFIG[qt] = "--with-qt, --without-qt, qtbase qtbase-native qtx11extras qtsvg, qtbase"
 PACKAGECONFIG[imagemagick] = "--with-imagemagick, --without-imagemagick, imagemagick"
 
+EXTRA_OECONF += "--enable-pthread"
+
 FILES:${PN} += "${bindir} \
     ${@bb.utils.contains('DEPENDS', 'python3-native', '${libdir}', '', d)} \
 "
 
 CPPFLAGS:append = "\
-    ${@bb.utils.contains('PACKAGECONFIG', 'qt5', '\
+    ${@bb.utils.contains('PACKAGECONFIG', 'qt', '\
     -I${STAGING_INCDIR}/QtX11Extras \
     -I${STAGING_INCDIR}/dbus-1.0 \
     -I${STAGING_LIBDIR}/dbus-1.0/include \

---
base-commit: d8cb988be342bc887d71ae68ede38cc013e552ea
change-id: 20260626-upgrade-zbar-809e90ade667

Best regards,
--  
Walter Werner Schneider <contact@schnwalter.eu>


