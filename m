Return-Path: <stefan@datenfreihafen.org>
Received: from sirius.lasnet.de (sirius.lasnet.de [78.47.116.19])
	by mail.openembedded.org (Postfix) with ESMTP id 48E746A918
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 22:25:26 +0000 (UTC)
Received: from host-78-149-139-187.as13285.net ([78.149.139.187]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69 #1)
	id 1VQ2x3-00011p-1c by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Sun, 29 Sep 2013 00:25:27 +0200
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.80)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1VQ2x2-0000d6-Vq; Sat, 28 Sep 2013 23:25:25 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Sep 2013 23:25:17 +0100
Message-Id: <1380407119-2352-4-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
References: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: [PATCH 4/6] maliit-*-qt5: Adjust MKSPEC path
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
X-List-Received-Date: Sat, 28 Sep 2013 22:25:27 -0000

---
 recipes-qt/maliit/maliit-framework-qt5_git.bb | 7 ++++---
 recipes-qt/maliit/maliit-plugins-qt5_git.bb   | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index 7b336ff..4f2da19 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -54,7 +54,7 @@ EXTRA_QMAKEVARS_PRE = "\
     PREFIX=${prefix} \
     LIBDIR=${libdir} \
     QT_IM_PLUGIN_PATH=${libdir}/qt4/plugins/inputmethods \
-    MALIIT_INSTALL_PRF=${datadir}/qt4/mkspecs/features \
+    MALIIT_INSTALL_PRF=${QMAKE_MKSPEC_PATH}/mkspecs/features \
     SCHEMADIR=${sysconfdir}/gconf/schemas \
     CONFIG+=disable-gconf \
     CONFIG+=disable-gtk-cache-update \
@@ -68,8 +68,9 @@ EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
 
 do_install_append() {
     #Fix absolute paths
-    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4/mkspecs/features/maliit-framework.prf
-    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4/mkspecs/features/maliit-plugins.prf
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/lib/qt5/mkspecs/features/maliit-framework.prf
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/lib/qt5/mkspecs/features/maliit-plugins.prf
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/usr/lib/qt5/mkspecs/features/maliit-defines.prf
 
     install -d ${D}${datadir}/applications
     install -m 644 ${WORKDIR}/maliit-server.desktop ${D}${datadir}/applications
diff --git a/recipes-qt/maliit/maliit-plugins-qt5_git.bb b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
index 9d5b0e2..6b019ef 100644
--- a/recipes-qt/maliit/maliit-plugins-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-plugins-qt5_git.bb
@@ -23,6 +23,7 @@ PV = "0.99.0+git${SRCPV}"
 
 EXTRA_QMAKEVARS_PRE = "\
     PREFIX=${prefix} \
+    MALIIT_INSTALL_PRF=${QMAKE_MKSPEC_PATH}/mkspecs/features \
     LIBDIR=${libdir} \
     CONFIG+=nodoc \
 "
-- 
1.8.4.rc3


