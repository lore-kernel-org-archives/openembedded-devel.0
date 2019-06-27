Return-Path: <uol@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id A99797E8F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 13:39:08 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hgUcG-0000ZT-Cu; Thu, 27 Jun 2019 15:39:08 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hgUcC-0001n6-T5; Thu, 27 Jun 2019 15:39:04 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 15:38:59 +0200
Message-Id: <20190627133859.6843-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Cc: Maksim Sisov <msisov@igalia.com>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	=?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>
Subject: [meta-browser][PATCH] chromium-ozone-wayland: Stop depending on the system's wayland-scanner binary
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
X-List-Received-Date: Thu, 27 Jun 2019 13:39:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This commit re-applies the changes of the commit given below to the current
chromium-ozone-wayland recipe as they got lost in the meantime.

| commit cd88d7be61bc39726b8ecf7ddc19e6942bcf8cb4
| Author: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
| Date:   Thu May 2 12:08:54 2019 +0200
|
|     chromium-ozone-wayland: Stop depending on the system's wayland-scanner
|     binary
|
|     So far, we were using Chromium's default GN path for the system
|     wayland-scanner binary, "/usr/bin/wayland-scanner", which may not be present
|     at all and which should never be used anyway. Instead, we now point to the
|     version built by the wayland-native recipe.
|
|     Doing so of course requires depending on wayland-native in the first place,
|     and that requires adding back REQUIRED_DISTRO_FEATURES and a DEPENDS block
|     that got removed with no explanation when the recipe was updated to
|     M72 (commit 97876fab, "chromium: Update to 72.0.3626.81").
|
|     Fixes #241
|
|     Signed-off-by: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>

Fixes: 1f363e25cb7d ("chromium: Update to 74.0.3729.131")
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 .../chromium/chromium-ozone-wayland_75.0.3770.100.bb   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/recipes-browser/chromium/chromium-ozone-wayland_75.0.3770.100.bb b/recipes-browser/chromium/chromium-ozone-wayland_75.0.3770.100.bb
index 22afa52aec20..1e4ed2958d2d 100644
--- a/recipes-browser/chromium/chromium-ozone-wayland_75.0.3770.100.bb
+++ b/recipes-browser/chromium/chromium-ozone-wayland_75.0.3770.100.bb
@@ -31,6 +31,15 @@ SRC_URI += " \
         file://0001-ozone-wayland-Fix-method-prototype-match.patch \
 "
 
+REQUIRED_DISTRO_FEATURES = "wayland"
+
+DEPENDS += "\
+        libxkbcommon \
+        virtual/egl \
+        wayland \
+        wayland-native \
+"
+
 # Chromium can use v4l2 device for hardware accelerated video decoding. Make sure that
 # /dev/video-dec exists.
 PACKAGECONFIG[use-linux-v4l2] = "use_v4l2_codec=true use_v4lplugin=true use_linux_v4l2_only=true"
@@ -42,6 +51,7 @@ GN_ARGS += "\
         ozone_platform_headless=true \
         ozone_platform_wayland=true \
         ozone_platform_x11=false \
+        system_wayland_scanner_path="${STAGING_BINDIR_NATIVE}/wayland-scanner" \
         use_xkbcommon=true \
         use_system_libwayland=true \
         use_system_minigbm=true \
-- 
2.20.1


