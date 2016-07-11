Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id A47B260797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 11:28:22 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r68so15173370qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 04:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=g3tGVZxS+8Ptd8zn36olOUqZYPLZnyrjNkktM9psIe0=;
	b=aB3wS8iR2NZbaDmK2xpOQ72xi2HaO92ezqyE4eH+YI8afhxST44IVyF8pILupsdQLV
	l6Yn16wLS4la3YGsuOJr8Urf7vhUCLtKBpz548S3jHhx3wgDcyfPRQxx5f3qfOwu/vq/
	PApTYqaaFNCWjLFcUXg6bDkuwuXreCGa5r6dJJoDXcvHNhoWEmbgpLv2tDGhvqATf8JN
	rpbp1Z+NOSRgwKgHC0x4EcltPzqXtgAWBLAPx2aDKdm4uIIu8KbDGZJmsTtinYm/Tzxo
	0/oA3ho8E3FhLkN1oMETR0OfHdwR87uyeRCJ+k3AxmF+J+cbX6YPbYroBheKmdzUZG6R
	wtvw==
X-Gm-Message-State: ALyK8tKxPvsYzHAUc9hsUNzfZJHAiBdR7dvKLyIZt/VhZ23dTYJ/xsKiQ/pBdKFpt0DDFg==
X-Received: by 10.55.88.65 with SMTP id m62mr25505512qkb.0.1468236502533;
	Mon, 11 Jul 2016 04:28:22 -0700 (PDT)
Received: from localhost ([177.100.227.79]) by smtp.gmail.com with ESMTPSA id
	l37sm1716583qte.41.2016.07.11.04.28.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 04:28:21 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 11 Jul 2016 08:28:15 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Jul 2016 08:28:12 -0300
Message-Id: <20160711112812.7758-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.9.0
Organization: O.S. Systems Software LTDA.
Cc: tom.hochstein@nxp.com, samuli.piippo@theqtcompany.com,
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
X-List-Received-Date: Mon, 11 Jul 2016 11:28:26 -0000

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

 recipes-qt/qt5/qtwayland_git.bb | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index e36d2c0..a00d471 100644
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
@@ -11,18 +13,20 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
-# wayland-native is already in wayland DEPENDS, but add it here
-# explicitly, because it's native wayland-scanner we're looking for
-# libxkbcommon isn't mandatory make it easier to remove by .bbappend
-# (e.g. for building qtwayland with danny which doesn't have libxkbcommon in oe-core).
-XKB_DEPENDS = "libxkbcommon xproto"
-DEPENDS += "qtbase qtdeclarative wayland wayland-native qtwayland-native ${XKB_DEPENDS} ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxcomposite', '', d)}"
+PACKAGECONFIG ?= " \
+    wayland-egl \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcompositor xkb glx', '', d)} \
+"
 
-QT_WAYLAND_CONFIG ?= "wayland-compositor"
-QT_WAYLAND_DEFINES ?= ""
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


