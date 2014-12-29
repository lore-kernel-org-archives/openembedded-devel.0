Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id DC59C7262E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 10:02:57 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so21552415wiv.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 02:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3N/kSNL4FoqxQkBdRD+Qv65xiDRyiB6H4FxhLXiYya0=;
	b=h23Hx2CMmVQGVa9tIRl5uJIMvoUNews4r680xGw0d5qzinsDeD9DIGnvXDhrdWZ1EK
	EwtEjHU2Et0XKkHeyqDg2n38pLsLvUzHl2Huo9fg6A+CLb3bO/OK+489pe4wEbxe7n7P
	fGcMVJ53Sqd20y9M5q8+hrG6vFYSNtEeeYKzo5JQoJNcE/0RABCMTCyRQyRvcnWp0SlT
	kIPFCcW41D51GCq/FaOi9gKTiVqtVLxdPFrqbI9QmRQnsqda86jANNlLC8qJx6Hd13g9
	ZFrQP5iD4Wv27HEUP5PdY7iN1KdOMZBQH7opVCkuDXiFZUjR4/xIhnw5/wUW1r31ffCG
	VwUA==
X-Received: by 10.180.19.193 with SMTP id h1mr94064418wie.10.1419847377258;
	Mon, 29 Dec 2014 02:02:57 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r3sm38877319wic.10.2014.12.29.02.02.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Dec 2014 02:02:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Dec 2014 11:03:03 +0100
Message-Id: <1419847383-10305-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [meta-efl][PATCH] meta-efl: use MIT & BSD license
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Dec 2014 10:03:02 -0000

* add & operator

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/efl.bbclass                               | 2 +-
 meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb         | 2 +-
 meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb | 2 +-
 meta-efl/recipes-efl/e17/e-wm.inc                          | 2 +-
 meta-efl/recipes-efl/e17/ephoto_svn.bb                     | 2 +-
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb         | 2 +-
 meta-efl/recipes-efl/e17/exquisite_svn.bb                  | 2 +-
 meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb       | 2 +-
 meta-efl/recipes-efl/e17/nonworking/emprint_svn.bb         | 2 +-
 meta-efl/recipes-efl/e17/nonworking/rage_svn.bb            | 2 +-
 meta-efl/recipes-efl/e17/terminology.inc                   | 2 +-
 meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb        | 2 +-
 meta-efl/recipes-efl/efl/edb_svn.bb                        | 2 +-
 meta-efl/recipes-efl/efl/edbus.inc                         | 2 +-
 meta-efl/recipes-efl/efl/efl.inc                           | 2 +-
 meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb  | 2 +-
 meta-efl/recipes-efl/efl/expedite.inc                      | 2 +-
 meta-efl/recipes-efl/efl/imlib2_git.bb                     | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
index fb96ef0..eb40e4b 100644
--- a/meta-efl/classes/efl.bbclass
+++ b/meta-efl/classes/efl.bbclass
@@ -1,5 +1,5 @@
 SECTION = "e/libs"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 DEPENDS += "pkgconfig-native"
 
 # revision 0d93ec84b30bc1bee2caaee72d667f87bc468a70 made SRCDATE and hence PV go backwards, so we need to up PE to unbreak builds and feeds :(
diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
index af32a35..ae1b8a6 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "b-and-w theme was default E17 theme before alpha3 and some people
 SECTION = "e/utils"
 DEPENDS = "edje-native"
 RDEPENDS_${PN} = "e-wm"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 # upstream was asked to include license infor in THEME dir
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
index 1bf5f1d..965e4e9 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "http://trac.enlightenment.org/e/wiki/Themes#Efenniht"
 DEPENDS = "edje-native"
 RDEPENDS_${PN} = "e-wm"
 RSUGGESTS_${PN} = "elementary-theme-efenniht"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 
 SRCREV = "${EFL_SRCREV}"
diff --git a/meta-efl/recipes-efl/e17/e-wm.inc b/meta-efl/recipes-efl/e17/e-wm.inc
index 0ff26ef..5e3f293 100644
--- a/meta-efl/recipes-efl/e17/e-wm.inc
+++ b/meta-efl/recipes-efl/e17/e-wm.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "The Enlightenment Window Manager Version 17"
 DEPENDS = "eet evas eina ecore edje efreet edbus eeze eio elementary libxcb xcb-util-keysyms"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 
diff --git a/meta-efl/recipes-efl/e17/ephoto_svn.bb b/meta-efl/recipes-efl/e17/ephoto_svn.bb
index 3255ab8..5cecda5 100644
--- a/meta-efl/recipes-efl/e17/ephoto_svn.bb
+++ b/meta-efl/recipes-efl/e17/ephoto_svn.bb
@@ -1,4 +1,4 @@
-LICENSE = "MIT GPL-3.0"
+LICENSE = "MIT & GPL-3.0"
 PV = "0.1.0+svnr${SRCREV}"
 PR = "${INC_PR}.0"
 
diff --git a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
index 5948e20..aad0646 100644
--- a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
+++ b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
@@ -1,5 +1,5 @@
 DDESCRIPTION = "A theme for exquisite"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 SECTION = "x11"
 DEPENDS = "edje-native"
diff --git a/meta-efl/recipes-efl/e17/exquisite_svn.bb b/meta-efl/recipes-efl/e17/exquisite_svn.bb
index dc46a94..8f2d25d 100644
--- a/meta-efl/recipes-efl/e17/exquisite_svn.bb
+++ b/meta-efl/recipes-efl/e17/exquisite_svn.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A psplash replacement for display"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14defa372a91118e755133bc8e6aff83"
 DEPENDS = "eet evas ecore embryo edje"
 PV = "0.0.1+svnr${SRCPV}"
diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
index 55f3282..6f81b6b 100644
--- a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
+++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
@@ -9,7 +9,7 @@ SRCREV = "4064489f359a1addf572089b582f317dff5f50e1"
 PV = "0.0+gitr${SRCPV}"
 PE = "1"
 PR = "r5"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 
 PACKAGES = "\
diff --git a/meta-efl/recipes-efl/e17/nonworking/emprint_svn.bb b/meta-efl/recipes-efl/e17/nonworking/emprint_svn.bb
index 777e302..6c2abdc 100644
--- a/meta-efl/recipes-efl/e17/nonworking/emprint_svn.bb
+++ b/meta-efl/recipes-efl/e17/nonworking/emprint_svn.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Emprint is a utility for taking screenshots of the entire screen, a specific window, or a specific region."
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 DEPENDS = "imlib2 virtual/libx11 ecore evas edje eina"
 PV = "0.0.1+svnr${SRCPV}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
diff --git a/meta-efl/recipes-efl/e17/nonworking/rage_svn.bb b/meta-efl/recipes-efl/e17/nonworking/rage_svn.bb
index 3cf576f..da51ae6 100644
--- a/meta-efl/recipes-efl/e17/nonworking/rage_svn.bb
+++ b/meta-efl/recipes-efl/e17/nonworking/rage_svn.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Rage is a media center application based on EFL"
 AUTHOR = "Carsten 'The Rasterman' Haitzler"
 HOMEPAGE = "http://www.rasterman.com"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 DEPENDS = "emotion evas ecore edje"
 SECTION = "x11/multimedia"
diff --git a/meta-efl/recipes-efl/e17/terminology.inc b/meta-efl/recipes-efl/e17/terminology.inc
index 9dd2264..bec2c0a 100644
--- a/meta-efl/recipes-efl/e17/terminology.inc
+++ b/meta-efl/recipes-efl/e17/terminology.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "Enlightenment Terminal Emulator"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9a8682b561bdfa219d59483a679ed80a"
 DEPENDS = "evas ecore edje elementary eina eet emotion"
 
diff --git a/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb b/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
index 17f668b..657adcd 100644
--- a/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
+++ b/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
@@ -3,7 +3,7 @@ SECTION = "x11/data"
 SRCREV = "38fdd9bb0d8296e984bb6443466801eea6f62f00"
 PV = "1.0+gitr${SRCPV}"
 PE = "1"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/meta-efl/recipes-efl/efl/edb_svn.bb b/meta-efl/recipes-efl/efl/edb_svn.bb
index a895cb3..7c6abda 100644
--- a/meta-efl/recipes-efl/efl/edb_svn.bb
+++ b/meta-efl/recipes-efl/efl/edb_svn.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Edb is the Enlightenment database library"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8a7c08df3bc3280208b959be7215c25 \
                     file://COPYING-PLAIN;md5=f59cacc08235a546b0c34a5422133035"
 
diff --git a/meta-efl/recipes-efl/efl/edbus.inc b/meta-efl/recipes-efl/efl/edbus.inc
index 7b11af5..03d0ee5 100644
--- a/meta-efl/recipes-efl/efl/edbus.inc
+++ b/meta-efl/recipes-efl/efl/edbus.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "DBus and HAL convenience wrappers for EFL"
 DEPENDS = "dbus ecore eina"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=550b8cea13dacc4bf00508a8cce1074c"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 05fe1bd..d870fdb 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -1,5 +1,5 @@
 SUMMARY = "EFL"
-LICENSE = "MIT BSD LGPL-2.1"
+LICENSE = "MIT & BSD & LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a1809a807e39dd48ddcf7be98477d130"
 
 DEPENDS_class-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native"
diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
index fa635c0..494e743 100644
--- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
@@ -8,7 +8,7 @@ SECTION = "e/utils"
 HOMEPAGE = "http://trac.enlightenment.org/e/wiki/Themes#Efenniht"
 DEPENDS = "edje-native"
 RSUGGESTS_${PN} = "e-wm-theme-illume-efenniht"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 
 SRCREV_THM_REV ?= "${EFL_SRCREV}"
diff --git a/meta-efl/recipes-efl/efl/expedite.inc b/meta-efl/recipes-efl/efl/expedite.inc
index 30ba063..60e8597 100644
--- a/meta-efl/recipes-efl/efl/expedite.inc
+++ b/meta-efl/recipes-efl/efl/expedite.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Expedite is a comprehensive benchmarking suite for Evas"
 DEPENDS = "eet evas libsdl"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d70bc65d46237e4ef386beebe7d0fe5b"
 
 INC_PR = "r0"
diff --git a/meta-efl/recipes-efl/efl/imlib2_git.bb b/meta-efl/recipes-efl/efl/imlib2_git.bb
index 8c6ac66..355b334 100644
--- a/meta-efl/recipes-efl/efl/imlib2_git.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A graphic library for file loading, saving, rendering, and manipulation"
-LICENSE = "MIT BSD"
+LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 DEPENDS = "freetype libpng jpeg virtual/libx11 libxext"
-- 
2.2.1


