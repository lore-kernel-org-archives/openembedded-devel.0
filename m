Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1987B772F3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 16:17:37 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so143796289wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 08:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KW0GFd5MDn/G4iUAaaBXOaFbxIPek1kk4IoLLFRJMOY=;
	b=Taf8qZrX4zW3zmOcou7PWnCnc1iUNcjO7kyaFtB+xePbYKDFXMg9qqqIWSyiBMHoUZ
	w+BWJC40lD/aENT/JlxoXm3//D6QuJg026uxaPJ4hSN0wKRuQvmRRaalW59SkYfEoEya
	QRp3btudZPXVOTF20uC2bXrBsd2HaIKjW6lbk2cW+e7enefKJvqq53TyuANK0r8lb/2r
	BRdJ0Ep0tS17ReJAgBzbGOvShJ/aevFgLGHRyUsHycJAd2khwjIaoNka38u+JLYRHC4u
	eP2tOB1NIBqwyjtRLacJ4pyCHdIBeZU8YlGXxr37f0d27PU/h2llpm8KinxR+kATWslc
	jgZA==
X-Received: by 10.28.139.18 with SMTP id n18mr15243968wmd.63.1447604256862;
	Sun, 15 Nov 2015 08:17:36 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl4sm22963470wjd.17.2015.11.15.08.17.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Nov 2015 08:17:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Nov 2015 17:17:33 +0100
Message-Id: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-oe 1/8] qt-mobility: fix dependencies and PACKAGECONFIG
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
X-List-Received-Date: Sun, 15 Nov 2015 16:17:39 -0000

* this isn't proper fix, just to silence various QA issues
* nobody cares about qt-mobility, this is just last step before adding
  PNBLACKLIST for this (or moving it to separate meta-qt4)
* "Fixes"
  qt-mobility-embedded-1.2.0: qt-mobility-embedded: invalid PACKAGECONFIG: bluez5 [invalid-packageconfig]
  qt-mobility-x11-1.2.0: qt-mobility-x11: invalid PACKAGECONFIG: bluez5 [invalid-packageconfig]
  qt-mobility doesn't really support bluez5, so we'll just silence the
  QA warning, existing PACKAGECONFIGs for bluez4 and pulseaudio are
  useless as well, because without disable option both are still
  autodetected from ssysroot
* "Fixes"
  WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on glib-2.0, but it isn't a build dependency?
  WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on gstreamer, but it isn't a build dependency?
  WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on libasound, but it isn't a build dependency?
  WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on libgstapp-0.10, but it isn't a build dependency?
  WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on libgstvideo-0.10, but it isn't a build dependency?
  WARN: qt-mobility-x11: qt-mobility-x11 rdepends on glib-2.0, but it isn't a build dependency?
  WARN: qt-mobility-x11: qt-mobility-x11 rdepends on gstreamer, but it isn't a build dependency?
  WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libasound, but it isn't a build dependency?
  WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libgstapp-0.10, but it isn't a build dependency?
  WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libgstinterfaces-0.10, but it isn't a build dependency?
  WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libgstvideo-0.10, but it isn't a build dependency?
  WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libxext, but it isn't a build dependency?
  WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libxv, but it isn't a build dependency?
  but it adds dependency on meta-multimedia layer (which isn't in meta-oe dependencies),
  so it's not correct, but won't make things worse then they already are since
  qt-mobility was moved from oe-core, hopefully it will move to separate meta-qt4
  soon. gstreamer was already in DEPENDS, but DEPENDS was overwritten by
  qt-mobility_1.2.0.inc which was included later, also drop qt4* dependencies
  because these are already taken care of in qt4(e).bbclass.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qt-mobility/qt-mobility-embedded_1.2.0.bb |  1 -
 meta-oe/recipes-qt/qt-mobility/qt-mobility-x11_1.2.0.bb      |  2 +-
 meta-oe/recipes-qt/qt-mobility/qt-mobility_1.2.0.inc         | 11 ++++++++++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-qt/qt-mobility/qt-mobility-embedded_1.2.0.bb b/meta-oe/recipes-qt/qt-mobility/qt-mobility-embedded_1.2.0.bb
index 998de2a..355f183 100644
--- a/meta-oe/recipes-qt/qt-mobility/qt-mobility-embedded_1.2.0.bb
+++ b/meta-oe/recipes-qt/qt-mobility/qt-mobility-embedded_1.2.0.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Mobile device API extensions for Qt/Embedded 4.x"
-DEPENDS = "qt4-embedded"
 SECTION = "libs"
 qtm_embedded := "embedded"
 qtm_dir = "qtopia"
diff --git a/meta-oe/recipes-qt/qt-mobility/qt-mobility-x11_1.2.0.bb b/meta-oe/recipes-qt/qt-mobility/qt-mobility-x11_1.2.0.bb
index e7e4b3c..380e3cb 100644
--- a/meta-oe/recipes-qt/qt-mobility/qt-mobility-x11_1.2.0.bb
+++ b/meta-oe/recipes-qt/qt-mobility/qt-mobility-x11_1.2.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Mobile device API extensions for Qt/X11 4.x"
-DEPENDS = "qt4-x11-free"
+DEPENDS = "libxv libxext"
 SECTION = "x11/libs"
 qtm_embedded := ""
 qtm_dir = "qt4"
diff --git a/meta-oe/recipes-qt/qt-mobility/qt-mobility_1.2.0.inc b/meta-oe/recipes-qt/qt-mobility/qt-mobility_1.2.0.inc
index 56631bb..377d9c7 100644
--- a/meta-oe/recipes-qt/qt-mobility/qt-mobility_1.2.0.inc
+++ b/meta-oe/recipes-qt/qt-mobility/qt-mobility_1.2.0.inc
@@ -1,11 +1,20 @@
 HOMEPAGE = "http://qt-project.org/"
-DEPENDS = "gstreamer util-linux"
+
+# This creates the dependency on meta-multimedia, which is wrong, but hopefully
+# this will be moved to separate meta-qt4 soon
+DEPENDS += "gstreamer util-linux alsa-lib gst-plugins-base"
 
 inherit bluetooth
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
+# This is all wrong, but nobody cares about qt-mobility anymore
+# add bluez5 just to silence:
+# qt-mobility-embedded-1.2.0: qt-mobility-embedded: invalid PACKAGECONFIG: bluez5 [invalid-packageconfig]
+# qt-mobility-x11-1.2.0: qt-mobility-x11: invalid PACKAGECONFIG: bluez5 [invalid-packageconfig]
+# but without --disable options it still autodetects bluez and pulseaudio from sysroot
 PACKAGECONFIG[bluez4] = ",,bluez4"
+PACKAGECONFIG[bluez5] = ",,bluez5"
 PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
 
 LICENSE = "LGPLv2.1"
-- 
2.6.3


