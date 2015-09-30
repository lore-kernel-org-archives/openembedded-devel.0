Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 59B4A77016
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 19:57:22 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so77770838wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 12:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sQn7WpuZcoPFIrPImdyCkU0UvIdlQVYlUHa+GF5chJ8=;
	b=dJh62hQHWJnsaQanKbjaBFhwE6NUQTP++yAITDH7UbOMpgM+DluQ8PZ2G4bS8ILsXg
	GmWWLGDSLJp2gXm6bvC/sTn5YO9uzRSaOvJKlNPWMNxocWJGR1j+inyL+ct9C/mkzVSX
	5pXKRxjxHK2Z/clZz9TNHQ3fmdu6SPG8SXE8j7DeBAd7HZ/Fj+7/mBeWRcFIV/7Z2lQL
	acOiij7McuWZhUmUdpv29bSLEgQ8upIqB3FXfucKS5QotV8mfD0KQoBlvYZ/C9Y/C/G/
	75T9ntwjg0dRwQrb+JtGzUfVD3kB87VwyBuGmTXqbEY4Y9taeD6DkpIA/mCNO05LiOsb
	iWsA==
X-Received: by 10.180.24.72 with SMTP id s8mr31584303wif.49.1443643042000;
	Wed, 30 Sep 2015 12:57:22 -0700 (PDT)
Received: from lenovobook.localdomain
	(ipbcc29dfc.dynamic.kabel-deutschland.de. [188.194.157.252])
	by smtp.googlemail.com with ESMTPSA id
	gc19sm2395326wic.19.2015.09.30.12.57.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Sep 2015 12:57:21 -0700 (PDT)
From: Johannes Pointner <h4nn35.work@gmail.com>
X-Google-Original-From: Johannes Pointner <johannes.pointner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Sep 2015 21:57:13 +0200
Message-Id: <1443643033-16565-1-git-send-email-johannes.pointner@gmail.com>
X-Mailer: git-send-email 2.6.0
Subject: [[PATCH][meta-qt5]] maliit-framework-qt5: fixed paths and enabled qt5-inputcontext
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
X-List-Received-Date: Wed, 30 Sep 2015 19:57:25 -0000

*Fixes paths for qt5 and enables qt5-inputcontext.

Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
---
 recipes-qt/maliit/maliit-framework-qt5_git.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index 975892d..03bd6ed 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -20,9 +20,6 @@ GTKIMMODULES_PACKAGES = "${PN}-gtk"
 
 DEPENDS = "qtdeclarative"
 
-# FIXME: Do we need something like this with qt5?
-#RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
-
 RRECOMMENDS_${PN} = "maliit-plugins-qt5"
 
 FILES_${PN} += "\
@@ -30,10 +27,12 @@ FILES_${PN} += "\
     ${bindir} \
     ${datadir}/applications/maliit-server.desktop \
     ${datadir}/dbus-1 \
+    ${libdir}/qt5/plugins/platforminputcontexts \
 "
 
 FILES_${PN}-dbg += "\
     ${libdir}/maliit-framework-tests \
+    ${libdir}/qt5/plugins/platforminputcontexts/.debug \
 "
 
 FILES_${PN}-dev += "\
@@ -46,7 +45,7 @@ EXTRA_QMAKEVARS_PRE = "\
     PREFIX=${prefix} \
     LIBDIR=${libdir} \
     DATADIR=${datadir} \
-    QT_IM_PLUGIN_PATH=${libdir}/qt4/plugins/inputmethods \
+    QT_INSTALL_PLUGINS=${libdir}/qt5/plugins \
     MALIIT_INSTALL_PRF=${QMAKE_MKSPEC_PATH}/mkspecs/features \
     SCHEMADIR=${sysconfdir}/gconf/schemas \
     CONFIG+=disable-gconf \
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
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}/${QT_DIR_NAME}/mkspecs/features/maliit-framework.prf
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}/${QT_DIR_NAME}/mkspecs/features/maliit-plugins.prf
 
     install -d ${D}${datadir}/applications
     install -m 644 ${WORKDIR}/maliit-server.desktop ${D}${datadir}/applications
-- 
2.6.0


