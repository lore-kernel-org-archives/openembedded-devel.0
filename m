Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NCdR0-0001QK-9f
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 19:14:49 +0100
Received: by mail-gx0-f215.google.com with SMTP id 7so8873512gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 10:13:20 -0800 (PST)
Received: by 10.101.202.1 with SMTP id e1mr3941059anq.69.1258999999684;
	Mon, 23 Nov 2009 10:13:19 -0800 (PST)
Received: from localhost.localdomain ([200.184.118.130])
	by mx.google.com with ESMTPS id 9sm1559186ywf.5.2009.11.23.10.13.09
	(version=SSLv3 cipher=RC4-MD5); Mon, 23 Nov 2009 10:13:12 -0800 (PST)
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Nov 2009 15:06:25 -0300
Message-Id: <1258999585-10614-3-git-send-email-ricardo.salveti@openbossa.org>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1258999585-10614-1-git-send-email-ricardo.salveti@openbossa.org>
References: <1258999585-10614-1-git-send-email-ricardo.salveti@openbossa.org>
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/2] mamona-input-methods-git: bumping rev, fixing PV and using oe-stylize
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
X-List-Received-Date: Mon, 23 Nov 2009 18:14:49 -0000

Signed-off-by: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
---
 conf/distro/include/sane-srcrevs.inc       |    2 +-
 recipes/mamona/mamona-input-methods_git.bb |   58 ++++++++++++----------------
 2 files changed, 26 insertions(+), 34 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 42598c1..fa9795d 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -171,7 +171,7 @@ SRCREV_pn-llvm-gcc4 ?= "374"
 SRCREV_pn-llvm-gcc4-cross ?= "374"
 SRCREV_pn-madbutterfly ?= "ecd1842714b5e982f3138cbdd358517d57be6aa3"
 SRCREV_pn-maemo-mapper ?= "118"
-SRCREV_pn-mamona_input_methods ?= "7e6a8cc947689a045d0fba90015da599275347d9"
+SRCREV_pn-mamona-input-methods ?= "4a8f11973021b8b4f157f5743e00f9f9a3c4802b"
 SRCREV_pn-mamonaim-e-applet ?= "a1ba7e8a388ffce3cca92bad059cd801e7733a7a"
 SRCREV_pn-matchbox-config-gtk ?= "1614"
 SRCREV_pn-matchbox-desktop-2 ?= "2096"
diff --git a/recipes/mamona/mamona-input-methods_git.bb b/recipes/mamona/mamona-input-methods_git.bb
index ca89453..6b82697 100644
--- a/recipes/mamona/mamona-input-methods_git.bb
+++ b/recipes/mamona/mamona-input-methods_git.bb
@@ -3,21 +3,30 @@
 
 DESCRIPTION = "Mamona input methods"
 HOMEPAGE = "http://dev.openbossa.org/trac/mamona/wiki"
-LICENSE = "GPL"
 SECTION = "libs/inputmethods"
+LICENSE = "GPL"
 DEPENDS = "ecore gtk+"
-PR = "r4"
-
-PV = "0.1+git"
-
-inherit autotools pkgconfig lib_package
+RPROVIDES_${PN} = "libmamona-im0"
+RPROVIDES_${PN}-ecore = "libmamona-im-ecore"
+RPROVIDES_${PN}-gtk = "libmamona-im-gtk"
+PV = "0.1-${PR}+gitr${SRCREV}"
+PR = "r5"
+PE = "1"
 
 SRC_URI = "git://dev.openbossa.org/mamona/projects/mamona_input_methods.git;protocol=http"
 
 S = "${WORKDIR}/git"
 
-# Mamona IM
-RPROVIDES_${PN} = "libmamona-im0"
+inherit autotools_stage pkgconfig lib_package
+
+EXTRA_OECONF = "\
+        --enable-ecore-im \
+        --enable-gtk-im \
+        "
+
+do_configure_prepend() {
+        ./autogen.sh
+}
 
 # Ecore
 PACKAGES += "\
@@ -25,10 +34,13 @@ PACKAGES += "\
             ${PN}-ecore-dev \
             ${PN}-ecore-dbg \
         "
-RPROVIDES_${PN}-ecore = "libmamona-im-ecore"
-EXTRA_OECONF = "\
-            --enable-ecore-im \
+# GTK
+PACKAGES += "\
+            ${PN}-gtk \
+            ${PN}-gtk-dev \
+            ${PN}-gtk-dbg \
         "
+
 FILES_${PN}-ecore = "\
             ${libdir}/ecore/immodules/mamona-im-ecore-module.so \
         "
@@ -39,17 +51,6 @@ FILES_${PN}-ecore-dev = "\
 FILES_${PN}-ecore-dbg = "\
             ${libdir}/ecore/immodules/.debug \
         "
-
-# GTK
-PACKAGES += "\
-            ${PN}-gtk \
-            ${PN}-gtk-dev \
-            ${PN}-gtk-dbg \
-        "
-RPROVIDES_${PN}-gtk = "libmamona-im-gtk"
-EXTRA_OECONF += "\
-            --enable-gtk-im \
-        "
 FILES_${PN}-gtk = "\
             ${libdir}/gtk-2.0/*/immodules/mamona-im-gtk-module.so \
         "
@@ -61,18 +62,9 @@ FILES_${PN}-gtk-dbg = "\
             ${libdir}/gtk-2.0/*/immodules/.debug \
         "
 
-do_configure_prepend() {
-    ./autogen.sh
-}
-
-do_stage() {
-    autotools_stage_all
-}
-
 pkg_postinst_${PN}-gtk() {
-    gtk-query-immodules-2.0 > ${sysconfdir}/gtk-2.0/gtk.immodules
+        gtk-query-immodules-2.0 > ${sysconfdir}/gtk-2.0/gtk.immodules
 }
-
 pkg_postrm_${PN}-gtk() {
-    gtk-query-immodules-2.0 > ${sysconfdir}/gtk-2.0/gtk.immodules
+        gtk-query-immodules-2.0 > ${sysconfdir}/gtk-2.0/gtk.immodules
 }
-- 
1.6.5



