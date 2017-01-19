Return-Path: <herve.jourdain@neuf.fr>
X-Greylist: delayed 586 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Jan 2017 13:17:57 UTC
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.20])
	by mail.openembedded.org (Postfix) with ESMTP id A623471B2F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 13:17:57 +0000 (UTC)
Received: from localhost.localdomain (36-225-57-150.dynamic-ip.hinet.net
	[36.225.57.150])
	by msfrf2634.sfr.fr (SMTP Server) with ESMTP id 231E51C0010B0;
	Thu, 19 Jan 2017 14:08:10 +0100 (CET)
Received: from localhost.localdomain (36-225-57-150.dynamic-ip.hinet.net
	[36.225.57.150])	(using TLSv1.2
	with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2634.sfr.fr (SMTP Server) with ESMTPSA;
	Thu, 19 Jan 2017 14:08:08 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2017 21:07:47 +0800
Message-Id: <1484831267-76876-1-git-send-email-herve.jourdain@neuf.fr>
X-Mailer: git-send-email 2.7.4
X-sfr-mailing: LEGIT
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] Minor improvements: configure complains it can't find oe-device-extra.pri, and add libxkbcommon in the dependencies
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
X-List-Received-Date: Thu, 19 Jan 2017 13:17:59 -0000

During configure, it complains it can't find oe-device-extra.pri, but it doesn't result in any error. Fix it, though, just in case.
In qtwayland, xkb should be optional, but it's not for the moment, so add it to the dependencies.

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
---
 recipes-qt/qt5/qtbase_git.bb    | 3 +++
 recipes-qt/qt5/qtwayland_git.bb | 1 +
 2 files changed, 4 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 6541973..258c7ed 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -173,6 +173,9 @@ do_configure() {
         ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
     fi
 
+    # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory" during configuration
+    touch ${S}/mkspecs/oe-device-extra.pri
+
     ${S}/configure -v \
         -opensource -confirm-license \
         -sysroot ${STAGING_DIR_TARGET} \
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index e315924..51421d5 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = " \
 
 #FIXME: xkb should be optional; we add it here to fix the build error without it
 #       (https://bugreports.qt.io/browse/QTBUG-54851)
+DEPENDS += "libxkbcommon"
 PACKAGECONFIG ?= " \
     compositor-api \
     wayland-egl \
-- 
2.7.4


