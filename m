Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id C9AEE6067D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 19:38:56 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q11so4224629qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 12:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=6evspe+ZoTdyyGJTaSaQ+oESTrVDmYT0U8yUfy0EuAQ=;
	b=KfUSNCkVRnGeFYTZw8frQRhnLMd9QSOcUwZRs5TWK+XGKFDsIavv9TK2dJpgnleoM8
	Ymbt85Eoo8XJ4NmIA0fCs25Ev+1ClYA7c2WUlE5LoKob4gKsPGHD3DC+p9th0kIEyzPj
	23uRDld9g63h8r9l/4z93vVL0WS4dGpJeTzEuD0QZcx4m0kasSsFtECIKhDjlavqwvl/
	qA/er7yqwJzOLT/1wefqASQlDm9suYahwdX7bT5hR3HUHNhX9PlHO7ojMsVxXng9nCIH
	8OxG9W9ei6jrOIU6RmNisx16h07iuB5J+wGMVS9aInAte0QfM/nZhLvUPWq8g0c9/e6T
	Avqg==
X-Gm-Message-State: ALyK8tKRMim4++LHsZ7hAMYxCtNqYYLRgP7cSr6FPCXBC1zQhrinhjDLjtAsyG78nUiMFQ==
X-Received: by 10.237.36.112 with SMTP id s45mr71518540qtc.7.1469129937035;
	Thu, 21 Jul 2016 12:38:57 -0700 (PDT)
Received: from localhost ([177.100.227.79]) by smtp.gmail.com with ESMTPSA id
	m11sm5203523qke.36.2016.07.21.12.38.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jul 2016 12:38:56 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 21 Jul 2016 16:38:48 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Jul 2016 16:38:47 -0300
Message-Id: <20160721193847.7875-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.9.0
Organization: O.S. Systems Software LTDA.
Cc: tom.hochstein@nxp.com, samuli.piippo@theqtcompany.com, junzhu@nxp.com,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5 PATCH v4] qtwayland: Rework recipe to allow PACKAGECONFIG use
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
X-List-Received-Date: Thu, 21 Jul 2016 19:38:56 -0000

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
index e36d2c0..a073b6f 100644
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
+PACKAGECONFIG[compositor-api] = "CONFIG+=config_wayland_compositor CONFIG+=done_config_wayland_compositor,CONFIG+=done_config_wayland_compositor"
+PACKAGECONFIG[xcompositor] = "CONFIG+=config_xcomposite CONFIG+=done_config_xcomposite,libxcomposite,CONFIG+=done_config_xcomposite,libxcomposite"
+PACKAGECONFIG[glx] = "CONFIG+=config_glx CONFIG+=done_config_glx,CONFIG+=done_config_glx,virtual/mesa"
+PACKAGECONFIG[xkb] = "CONFIG+=config_xkbcommon CONFIG+=done_config_xkbcommon,CONFIG+=done_config_xkbcommon,libxkbcommon xproto"
+PACKAGECONFIG[wayland-egl] = "CONFIG+=config_wayland_egl CONFIG+=done_config_wayland_egl,CONFIG+=done_config_wayland_egl,virtual/egl"
+PACKAGECONFIG[brcm-egl] = "CONFIG+=config_brcm_egl CONFIG+=done_config_brcm_egl,CONFIG+=done_config_brcm_egl,virtual/egl"
+PACKAGECONFIG[drm-egl] = "CONFIG+=config_drm_egl CONFIG+=done_config_drm_egl,CONFIG+=done_config_drm_egl,libdrm virtual/egl"
+PACKAGECONFIG[libhybris-egl] = "CONFIG+=config_libhybris_egl_server CONFIG+=done_config_libhybris_egl_server,CONFIG+=done_config_libhybris_egl_server,libhybris"
 
-EXTRA_QMAKEVARS_PRE += "CONFIG+=${QT_WAYLAND_CONFIG}"
-EXTRA_QMAKEVARS_PRE += "DEFINES+=${QT_WAYLAND_DEFINES}"
+EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
 FILES_${PN}-plugins += " \
     ${OE_QMAKE_PATH_PLUGINS}/*/*/*${SOLIBSDEV} \
-- 
2.9.0


