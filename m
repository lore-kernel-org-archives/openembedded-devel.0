Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id A1B3F770AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 18:02:40 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so2196876wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 11:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=f4qtnbjlOK8xZdVoD2MSKsNaC6Yoaguz+cMd+3GMG5Y=;
	b=SoLJWfS5EUGX563rzh7N5ujnNh6/xmxBFT9GYcm2Sy3wIynDuclfU0lmIDWHk8jfJ6
	T8h7T28svBJ34YTMv7F12aG33kB2d2SFzUR+Xgv9VaW2PzxGVRrd/4nDVT6twyo/gF+P
	mycDcK2d3m9bbJoDLUYSQmF9C0WlrcrUZuhgIChMWC8KCPtC/oQSUz+D/83vBfeDB5fJ
	LlkCmpCylk4nAVFN69tGabJts8vyfKX02IpDqczVsSEqsM5JBtJo2/jYh38GlmHf56J5
	MeRkkeyQ2S0NV+yquQuG2pYP9rSfitG7cB9KpROd3M1UrScX1zcUS60HuNbo8NuniMz2
	kYVQ==
X-Received: by 10.194.52.106 with SMTP id s10mr11352718wjo.35.1443722560051;
	Thu, 01 Oct 2015 11:02:40 -0700 (PDT)
Received: from lenovobook.localdomain
	(ipbcc29dfc.dynamic.kabel-deutschland.de. [188.194.157.252])
	by smtp.googlemail.com with ESMTPSA id
	gc19sm4335648wic.19.2015.10.01.11.02.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Oct 2015 11:02:39 -0700 (PDT)
From: Johannes Pointner <h4nn35.work@gmail.com>
X-Google-Original-From: Johannes Pointner <johannes.pointner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 20:02:38 +0200
Message-Id: <1443722558-8165-1-git-send-email-johannes.pointner@gmail.com>
X-Mailer: git-send-email 2.6.0
Subject: [[PATCH v2][meta-qt5]] maliit-framework-qt5: fixed paths and enabled qt5-inputcontext
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
X-List-Received-Date: Thu, 01 Oct 2015 18:02:41 -0000

*Fixes paths for qt5 using qmake5_paths variables and enables qt5-inputcontext.

Changes in v2:
- inherit qmake5_paths and use variables from there as Martin suggested

Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
---
 recipes-qt/maliit/maliit-framework-qt5_git.bb | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index 975892d..62a7209 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://wiki.maliit.org/Main_Page"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
 
-inherit qmake5
+inherit qmake5 qmake5_paths
 
 SRC_URI = "git://github.com/maliit/framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
@@ -20,9 +20,6 @@ GTKIMMODULES_PACKAGES = "${PN}-gtk"
 
 DEPENDS = "qtdeclarative"
 
-# FIXME: Do we need something like this with qt5?
-#RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
-
 RRECOMMENDS_${PN} = "maliit-plugins-qt5"
 
 FILES_${PN} += "\
@@ -30,24 +27,26 @@ FILES_${PN} += "\
     ${bindir} \
     ${datadir}/applications/maliit-server.desktop \
     ${datadir}/dbus-1 \
+    ${OE_QMAKE_PATH_PLUGINS}/platforminputcontexts \
 "
 
 FILES_${PN}-dbg += "\
     ${libdir}/maliit-framework-tests \
+    ${OE_QMAKE_PATH_PLUGINS}/platforminputcontexts/.debug \
 "
 
 FILES_${PN}-dev += "\
     ${includedir}/maliit \
     ${libdir}/pkgconfig \
-    ${libdir}/qt5/mkspecs \
+    ${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs \
 "
 
 EXTRA_QMAKEVARS_PRE = "\
-    PREFIX=${prefix} \
-    LIBDIR=${libdir} \
-    DATADIR=${datadir} \
-    QT_IM_PLUGIN_PATH=${libdir}/qt4/plugins/inputmethods \
-    MALIIT_INSTALL_PRF=${QMAKE_MKSPEC_PATH}/mkspecs/features \
+    PREFIX=${OE_QMAKE_PATH_PREFIX} \
+    LIBDIR=${OE_QMAKE_PATH_LIBS} \
+    DATADIR=${OE_QMAKE_PATH_DATA} \
+    QT_INSTALL_PLUGINS=${OE_QMAKE_PATH_PLUGINS} \
+    MALIIT_INSTALL_PRF=${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/features \
     SCHEMADIR=${sysconfdir}/gconf/schemas \
     CONFIG+=disable-gconf \
     CONFIG+=disable-gtk-cache-update \
@@ -56,14 +55,15 @@ EXTRA_QMAKEVARS_PRE = "\
     CONFIG+=nodoc \
     CONFIG+=noxcb \
     CONFIG+=enable-dbus-activation \
+    CONFIG+=qt5-inputcontext \
 "
 
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
 
 do_install_append() {
     #Fix absolute paths
-    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}${QT_DIR_NAME}/mkspecs/features/maliit-framework.prf
-    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}${QT_DIR_NAME}/mkspecs/features/maliit-plugins.prf
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/features/maliit-framework.prf
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/features/maliit-plugins.prf
 
     install -d ${D}${datadir}/applications
     install -m 644 ${WORKDIR}/maliit-server.desktop ${D}${datadir}/applications
-- 
2.6.0


