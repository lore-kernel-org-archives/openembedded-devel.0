Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 421 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Nov 2016 11:19:02 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id AAECB71A79
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 11:19:02 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 1E117B80910; Wed, 30 Nov 2016 12:11:58 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 12:11:58 +0100
Message-Id: <1480504318-6582-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480504318-6582-1-git-send-email-obi@opendreambox.org>
References: <1480504318-6582-1-git-send-email-obi@opendreambox.org>
Subject: [meta-qt5][PATCH 2/2] qtbase: Remove comments about ICU and QtWebKit
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
X-List-Received-Date: Wed, 30 Nov 2016 11:19:03 -0000

QtWebKit doesn't depend on icu in qtbase. It just didn't enable
it manually before.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes-qt/qt5/qtbase_git.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 223383d..6541973 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -37,10 +37,6 @@ DEPENDS += "qtbase-native"
 RDEPENDS_${PN}-tools += "perl"
 
 # separate some parts of PACKAGECONFIG which are often changed
-# be aware that you need to add icu to build qtwebkit, default
-# PACKAGECONFIG is kept rather minimal for people who don't need
-# stuff like webkit (and it's easier to add options than remove)
-
 PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
 PACKAGECONFIG_FB ?= "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
 PACKAGECONFIG_X11 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb xsync xshape xrender xrandr xfixes xinput2 xcursor glib xkb', '', d)}"
@@ -124,7 +120,6 @@ PACKAGECONFIG[directfb] = "-directfb,-no-directfb,directfb"
 PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
 PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
 PACKAGECONFIG[kms] = "-kms,-no-kms,virtual/mesa virtual/egl"
-# needed for qtwebkit
 PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
 PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
 PACKAGECONFIG[openssl] = "-openssl,-no-openssl,openssl,libssl"
-- 
2.7.4


