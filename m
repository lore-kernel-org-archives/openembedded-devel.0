Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6356160589
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 19:44:47 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id c52so1271164qte.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 12:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=s5SV6ThYOhW/h777EI/zFloJaxEaDzzcL1/MmLZqs8s=;
	b=YS4LfOgkCS7RPpFM9Aswd94kbt6/w089EXHPlD6tGpVSY4UwHibXADxXKSMr8+s+Te
	fJrUKIcVY6sokdDEnkaYDQOmqE9FPOm60peGgyU9BE89MyBsbHb7lD1HyNcKbHq5tvHI
	xTUQm2ekibzMJBn8CM1qkidXjjM6VSI5mcxrRQjRYI8HZylZln/XLHRrpj+Qz2r/A3v8
	7+4cupwElUWnQhIbu3/VMANcdcVeHEZyJ/s9Bdk0KGfYyQ+/pEVgX3R2O2oBvxFdjthN
	xjG8iRdqlCNXyKhQGMMoimy3X/PFXvTmNAZ+0hcDG26yqShljqs/8SdrPP4PS0EN8iCg
	hGaA==
X-Gm-Message-State: ALyK8tK9NS+gNYjq7XTQM+a0nrAxmWRLLKtamJxW/G7LW3ed6mlE/Qxt4e7DOB7L6myA1Q==
X-Received: by 10.237.55.65 with SMTP id i59mr66210365qtb.62.1468957488102;
	Tue, 19 Jul 2016 12:44:48 -0700 (PDT)
Received: from localhost ([177.100.227.79]) by smtp.gmail.com with ESMTPSA id
	c23sm2276336qtc.45.2016.07.19.12.44.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jul 2016 12:44:47 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 19 Jul 2016 16:44:40 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jul 2016 16:44:37 -0300
Message-Id: <20160719194437.26785-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.9.0
Organization: O.S. Systems Software LTDA.
Cc: tom.hochstein@nxp.com, samuli.piippo@theqtcompany.com, junzhu@nxp.com,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5 PATCH] qtwayland: Rework recipe to allow PACKAGECONFIG use
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
X-List-Received-Date: Tue, 19 Jul 2016 19:44:50 -0000

The Qt Wayland uses some modules which can be enabled/disabled
depending on users needs, however this must be deterministic. So we
now use PACKAGECONFIG to enable/disable those features. Following
options are available:

 - xcompositor
 - glx
 - xkb
 - wayland-egl
 - brcm-egl
 - drm-egl
 - libhybris-egl

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Add compositor-api and enable it by default
- Add xkb by default or the build fails badly (FIXME)

 recipes-qt/qt5/qtwayland_git.bb | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index e36d2c0..01641c1 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -1,6 +1,8 @@
 require qt5.inc
 require qt5-git.inc
 
+DEPENDS += "qtbase qtdeclarative wayland wayland-native qtwayland-native"
+
 # There are no LGPLv3-only licensed files in this component.
 LICENSE = "BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
@@ -11,18 +13,25 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
-# wayland-native is already in wayland DEPENDS, but add it here
-# explicitly, because it's native wayland-scanner we're looking for
-# libxkbcommon isn't mandatory make it easier to remove by .bbappend
-# (e.g. for building qtwayland with danny which doesn't have libxkbcommon in oe-core).
-XKB_DEPENDS = "libxkbcommon xproto"
-DEPENDS += "qtbase qtdeclarative wayland wayland-native qtwayland-native ${XKB_DEPENDS} ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxcomposite', '', d)}"
+#FIXME: xkb should be optional; we add it here to fix the build error without it
+#       (https://bugreports.qt.io/browse/QTBUG-54851)
+PACKAGECONFIG ?= " \
+    compositor-api \
+    wayland-egl \
+    xkb \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcompositor xkb glx', '', d)} \
+"
 
-QT_WAYLAND_CONFIG ?= "wayland-compositor"
-QT_WAYLAND_DEFINES ?= ""
+PACKAGECONFIG[compositor-api] = "CONFIG+=config_wayland_compositor,CONFIG+=done_config_wayland_compositor"
+PACKAGECONFIG[xcompositor] = "CONFIG+=config_xcomposite,CONFIG+=done_config_xcomposite,libxcomposite"
+PACKAGECONFIG[glx] = "CONFIG+=config_glx,CONFIG+=done_config_glx,virtual/mesa"
+PACKAGECONFIG[xkb] = "CONFIG+=config_xkbcommon,CONFIG+=done_config_xkbcommon,libxkbcommon xproto"
+PACKAGECONFIG[wayland-egl] = "CONFIG+=config_wayland_egl,CONFIG+=done_config_wayland_egl,virtual/egl"
+PACKAGECONFIG[brcm-egl] = "CONFIG+=config_brcm_egl,CONFIG+=done_config_brcm_egl,virtual/egl"
+PACKAGECONFIG[drm-egl] = "CONFIG+=config_drm_egl,CONFIG+=done_config_drm_egl,libdrm virtual/egl"
+PACKAGECONFIG[libhybris-egl] = "CONFIG+=config_libhybris_egl_server,CONFIG+=done_config_libhybris_egl_server,libhybris"
 
-EXTRA_QMAKEVARS_PRE += "CONFIG+=${QT_WAYLAND_CONFIG}"
-EXTRA_QMAKEVARS_PRE += "DEFINES+=${QT_WAYLAND_DEFINES}"
+EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
 FILES_${PN}-plugins += " \
     ${OE_QMAKE_PATH_PLUGINS}/*/*/*${SOLIBSDEV} \
-- 
2.9.0


