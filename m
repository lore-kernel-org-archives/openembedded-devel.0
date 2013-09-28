Return-Path: <stefan@datenfreihafen.org>
Received: from sirius.lasnet.de (sirius.lasnet.de [78.47.116.19])
	by mail.openembedded.org (Postfix) with ESMTP id 777CF6CA7C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 22:25:27 +0000 (UTC)
Received: from host-78-149-139-187.as13285.net ([78.149.139.187]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69 #1)
	id 1VQ2x3-00011r-LP by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Sun, 29 Sep 2013 00:25:28 +0200
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.80)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1VQ2x3-0000dB-Hr; Sat, 28 Sep 2013 23:25:25 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Sep 2013 23:25:18 +0100
Message-Id: <1380407119-2352-5-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
References: <1380407119-2352-1-git-send-email-stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: [PATCH 5/6] meta-framework-qt5: Cleanup packaging and enable dbus activation.
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
X-List-Received-Date: Sat, 28 Sep 2013 22:25:28 -0000

* Move pkgconfig files, headers and spec files into dev.
* Cleanup packaging rules
* Enable dbus activation to start maliit server on demand
---
 recipes-qt/maliit/maliit-framework-qt5_git.bb | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index 4f2da19..be3b1c1 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -31,23 +31,19 @@ RRECOMMENDS_${PN} = "maliit-plugins-qt5"
 
 FILES_${PN} += "\
     ${libdir}/*.so* \
-    ${libdir}/pkgconfig \
-    ${libdir}/qt5 \
-    ${bindir}/maliit-server \
-    ${includedir}/maliit \
+    ${bindir} \
     ${datadir}/applications/maliit-server.desktop \
+    ${datadir}/dbus-1 \
 "
 
 FILES_${PN}-dbg += "\
     ${libdir}/maliit-framework-tests \
 "
 
-FILES_${PN}-dev += "${datadir}"
-
-FILES_${PN}-gtk +="\
-    ${bindir}/maliit-exampleapp-gtk* \
-    \
-    ${libdir}/gtk-*/*/immodules/libim-maliit.so\
+FILES_${PN}-dev += "\
+    ${includedir}/maliit \
+    ${libdir}/pkgconfig \
+    ${libdir}/qt5 \
 "
 
 EXTRA_QMAKEVARS_PRE = "\
@@ -62,6 +58,7 @@ EXTRA_QMAKEVARS_PRE = "\
     CONFIG+=nosdk \
     CONFIG+=nodoc \
     CONFIG+=noxcb \
+    CONFIG+=enable-dbus-activation \
 "
 
 EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
-- 
1.8.4.rc3


