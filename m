Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOUzC-0003jU-TJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 16:52:43 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so5609381wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=W9erNHLXRVd81N80FnsUvuk7hHvdu6ztac2PkQlzgRo=;
	b=Mhyy7IkVb39EE/3qhFKYcc5yKzLPZVVr/IRR/X9UFQTdqS6JUHtl9x3BeyPkq9DCha
	HOB2oGoIWG0+ktVn3yoO5Fa31eYaSaek7hxD0L/9NkeOzjb8mrhCypQa6X5m6CElsAoY
	BGU1CPja2jO1ASY4Kd2zhLESQfGzdKQjo6xD3S5tQBDFcJhPGjeAgRe/xjiHOaqI8/sW
	24HGx89vifzRS8BxwVRsdFbcgKdVL0picXcUNoC4qlb2uJ9bVOE/TK5E6aFITHXYxgXG
	wBk1MdGV6lPal+npDs2jqqpvgWRpwjF0Dv7nrwYw3QrAFSyy9BgbRPLiH5KnKN73gU4b
	wVWw==
Received: by 10.180.19.71 with SMTP id c7mr4642278wie.2.1350484764845;
	Wed, 17 Oct 2012 07:39:24 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-94.unitymediagroup.de. [109.91.251.94])
	by mx.google.com with ESMTPS id b7sm24575128wiz.3.2012.10.17.07.39.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 07:39:23 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2012 16:37:52 +0200
Message-Id: <1350484672-9330-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe] maliit-framework: Clean up recipe and use gtk-immodules-cache.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 14:52:46 -0000

To be merged after gtk-immodules-cache.bbclass hits oe-core

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../recipes-support/maliit/maliit-framework_git.bb |   32 +++++---------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index 3f50d1b..534a3c8 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://wiki.maliit.org/Main_Page"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
 
-inherit autotools qt4x11
+inherit autotools qt4x11 gtk-immodules-cache
 
 
 SRC_URI = "git://gitorious.org/maliit/maliit-framework.git;branch=master \
@@ -16,9 +16,8 @@ SRCREV = "750842dec74a9b17dca91ef779c4fc5a43c4d9dc"
 PV = "0.92.3+git${SRCPV}"
 
 
-PACKAGES =+ "\
-    ${PN}-gtk \
-    "
+PACKAGES =+ "${PN}-gtk"
+GTKIMMODULES_PACKAGES = "${PN}-gtk"
 
 # Maliit needs Qt configured with -accessibility, a patch for that was already sent and will get merged in post 1.2.
 RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
@@ -58,29 +57,12 @@ EXTRA_QMAKEVARS_PRE = "\
     CONFIG+=local-install \
     "
 
-do_install() {
-    cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
+EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
 
+do_install_append() {
     #Fix absolute paths
-    cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-framework.prf
-    cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-plugins.prf
-}
-
-
-
-# Update the inputmethod modules in gtk
-pkg_postinst_${PN}-gtk() {
-if [ "x$D" != "x" ]; then
-    exit 1
-fi
-gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
-}
-
-pkg_postrm_${PN}-gtk() {
-if [ "x$D" != "x" ]; then
-    exit 1
-fi
-gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4/mkspecs/features/maliit-framework.prf
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4/mkspecs/features/maliit-plugins.prf
 }
 
 S= "${WORKDIR}/git"
-- 
1.7.9.5



