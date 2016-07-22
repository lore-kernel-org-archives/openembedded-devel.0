Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8BDF46067D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 16:51:40 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q8so9019940qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 09:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=lP3iV6PI+DbugJmOFTIYWr179oBHUPW7aND83LAELZM=;
	b=kbPMZTpYh+zKlqyoMaBB3+pfJNUQtBN8Gq12V0nBhunzvNqHwil15ekx5ahHBT/InU
	782cmeMUVHPEkUZqlIro1L6qoFDz1D+qY4iIu1dxKjgTn84WYSo+DznRpl51gJHsgy/w
	TBsUGy63jMPIov86j9Z+qpm7rhKNsOdAHXyWnYr+m5RrwbGk3S3v1kFQwaQCe3G9bf5g
	SRXFIzAPHUHs5iMiPIc0g4BDhNjhMsi6dsS/I0rZkMmtxVHFWMRh/WNBP/4c/nrOjqm/
	gzjOhx8jCCm7oqa8VufE/J9uIU8inFR7X1h1YzyMFPxTKm/ad5pdM8PKcZfPrOl5M1EE
	7FKw==
X-Gm-Message-State: AEkoousqWvCXJ3hruSmlvAfRfOZC/xA8YMPjgZIO+oyG0idYjbvYUK7Bc9ZndQl/hzuENg==
X-Received: by 10.55.89.197 with SMTP id n188mr5948979qkb.169.1469206301636;
	Fri, 22 Jul 2016 09:51:41 -0700 (PDT)
Received: from localhost ([177.100.227.79]) by smtp.gmail.com with ESMTPSA id
	f135sm7788365qke.37.2016.07.22.09.51.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jul 2016 09:51:40 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 22 Jul 2016 13:51:33 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Jul 2016 13:51:32 -0300
Message-Id: <20160722165132.26441-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.9.0
Organization: O.S. Systems Software LTDA.
Cc: tom.hochstein@nxp.com, samuli.piippo@theqtcompany.com, junzhu@nxp.com,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5 PATCH v5] qtwayland: Rework recipe to allow PACKAGECONFIG use
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
X-List-Received-Date: Fri, 22 Jul 2016 16:51:43 -0000

The Qt Wayland uses some modules which can be enabled/disabled
depending on users needs, however this must be deterministic. So we
now use PACKAGECONFIG to enable/disable those features. Following
options are available:

 - brcm-egl
 - compositor-api
 - drm-egl
 - glx
 - libhybris-egl
 - wayland-egl
 - xcompositor
 - xkb

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5:
- Add compositor-api to the commit log (Tom)
- Rework compositor-api enablement (Tom)
- Fix xcompositor flags (Tom)
- Fix drm-egl flags (Tom)

Changes in v4:
- Use done_config_<foo> for enable case. This is need so the test is
  skipped otherwise in case it fails, it may remove the feature and
  the support for it would not be enabled, causing a problem in
  determinism.

Changes in v2:
- Add compositor-api and enable it by default
- Add xkb by default or the build fails badly (FIXME)

 recipes-qt/qt5/qtwayland_git.bb | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index e36d2c0..df42f30 100644
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
+PACKAGECONFIG[compositor-api] = "CONFIG+=wayland-compositor"
+PACKAGECONFIG[xcompositor] = "CONFIG+=config_xcomposite CONFIG+=done_config_xcomposite,CONFIG+=done_config_xcomposite,libxcomposite"
+PACKAGECONFIG[glx] = "CONFIG+=config_glx CONFIG+=done_config_glx,CONFIG+=done_config_glx,virtual/mesa"
+PACKAGECONFIG[xkb] = "CONFIG+=config_xkbcommon CONFIG+=done_config_xkbcommon,CONFIG+=done_config_xkbcommon,libxkbcommon xproto"
+PACKAGECONFIG[wayland-egl] = "CONFIG+=config_wayland_egl CONFIG+=done_config_wayland_egl,CONFIG+=done_config_wayland_egl,virtual/egl"
+PACKAGECONFIG[brcm-egl] = "CONFIG+=config_brcm_egl CONFIG+=done_config_brcm_egl,CONFIG+=done_config_brcm_egl,virtual/egl"
+PACKAGECONFIG[drm-egl] = "CONFIG+=config_drm_egl_server CONFIG+=done_config_drm_egl_server,CONFIG+=done_config_drm_egl_server,libdrm virtual/egl"
+PACKAGECONFIG[libhybris-egl] = "CONFIG+=config_libhybris_egl_server CONFIG+=done_config_libhybris_egl_server,CONFIG+=done_config_libhybris_egl_server,libhybris"
 
-EXTRA_QMAKEVARS_PRE += "CONFIG+=${QT_WAYLAND_CONFIG}"
-EXTRA_QMAKEVARS_PRE += "DEFINES+=${QT_WAYLAND_DEFINES}"
+EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
 FILES_${PN}-plugins += " \
     ${OE_QMAKE_PATH_PLUGINS}/*/*/*${SOLIBSDEV} \
-- 
2.9.0


