Received: from mail-we0-f174.google.com ([74.125.82.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2QoM-00048K-1w
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 19:30:34 +0100
Received: by mail-we0-f174.google.com with SMTP id r6so5079330wey.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 10:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=QXYAQXQfTkcisIeBEjuVOuFYedgj544n9aoQYvwXPEc=;
	b=t0WUICon9V7Rk/OSpkXvk8WnFELIZH7s4ccmSpHh8uGv3a+xdcE4G/Z/HK1vKfzD2J
	m2lx37hX1ASg0pWw5lB6hKbkhnEwPmxjvGq02dNrSrmAKGJkg4XB3+Ctk7uza4OOyFNU
	lkc+IJFrYrNWJ/gcOXr7JKuJqqAiwGOdd41mZzCgYhlvDbjucGFnW0Z8fncm+u6HdFBY
	z11oZgbEbuy9OBuSco64LKuNupBGpVz3F+d3KJ2ko8D/mzAXS66q701k76Fm6IMKvIf3
	4nGOzL8bPT3eJKmzNRJ6JJ9RIdeYo+vsILfPs1z58GGNZiNsdmDthWsFSA3C5d8Hi31z
	9txw==
X-Received: by 10.194.235.6 with SMTP id ui6mr37191700wjc.12.1360001685436;
	Mon, 04 Feb 2013 10:14:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id be1sm23130408wib.10.2013.02.04.10.14.43
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 10:14:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 18:14:42 +0100
Message-Id: <1359998082-2773-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [RFC][meta-oe] ttf: introduce update-fonts bbclass and change all ttf recipes to use it
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
X-List-Received-Date: Mon, 04 Feb 2013 18:30:36 -0000

* without this ttf.inc had to set RRECOMMENDS and
  postinst/postrm without PN suffix to cover all
  subpackages created in ttf recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/update-fonts.bbclass               | 40 ++++++++++++++++++++++
 .../ttf-fonts/ttf-arphic-uming_20080216.bb         |  8 ++---
 .../recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb  |  8 ++---
 .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |  6 ++--
 .../recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb | 13 +++----
 .../ttf-fonts/ttf-hunkyfonts_0.3.0.bb              |  7 ++--
 .../ttf-fonts/ttf-liberation_0.2.bb                |  6 ++--
 .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |  6 +++-
 .../ttf-fonts/ttf-sazanami_20040629.bb             | 11 +++---
 .../ttf-fonts/ttf-ubuntu-font-family_0.80.bb       |  4 +--
 .../ttf-fonts/ttf-wqy-zenhei_0.6.26.bb             |  3 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf.inc         | 16 +--------
 12 files changed, 81 insertions(+), 47 deletions(-)
 create mode 100644 meta-oe/classes/update-fonts.bbclass

diff --git a/meta-oe/classes/update-fonts.bbclass b/meta-oe/classes/update-fonts.bbclass
new file mode 100644
index 0000000..cbed6b0
--- /dev/null
+++ b/meta-oe/classes/update-fonts.bbclass
@@ -0,0 +1,40 @@
+
+update_fonts_postinst() {
+    if [ -z "$D" ]; then
+        update-fonts
+    fi
+}
+
+# the same but keep it separate for now
+update_fonts_postrm() {
+    if [ -z "$D" ]; then
+        update-fonts
+    fi
+}
+
+python populate_packages_append () {
+    update_fonts_pkgs = d.getVar('UPDATE_FONTS_PACKAGES', True).split()
+
+    for pkg in update_fonts_pkgs:
+        postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+        if not postinst:
+            postinst = '#!/bin/sh\n'
+        postinst += d.getVar('update_fonts_postinst', True)
+        d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+        postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+        if not postrm:
+            postrm = '#!/bin/sh\n'
+        postrm += d.getVar('update_fonts_postrm', True)
+        d.setVar('pkg_postrm_%s' % pkg, postrm)
+
+        d.appendVar('RDEPENDS_%s' % pkg, 'font-update-common')
+}
+
+python __anonymous() {
+    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        updatefonts_check = d.getVar('UPDATE_FONTS_PACKAGES')
+        if not updatefonts_check:
+            bb_filename = d.getVar('FILE')
+            raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits update-fonts but doesn't set UPDATE_FONTS_PACKAGES" % bb_filename
+}
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index 97b67b2..06e06ca 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -4,16 +4,16 @@ LICENSE = "Arphic Public License"
 LIC_FILES_CHKSUM = "file://README;md5=62be011094b7865ddc4d1a648444d31a"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES_${PN} = "virtual-chinese-font"
-PR = "r4"
+PR = "r5"
 
-SRC_URI = \
-"http://archive.ubuntu.com/ubuntu/pool/main/t/ttf-arphic-uming/ttf-arphic-uming_0.2.${PV}.1.orig.tar.gz"
+UPDATE_FONTS_PACKAGES = "${PN}"
+
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/t/ttf-arphic-uming/ttf-arphic-uming_0.2.${PV}.1.orig.tar.gz"
 S = "${WORKDIR}"
 
 require ttf.inc
 
 FILES_${PN} = "${datadir}"
 
-
 SRC_URI[md5sum] = "d219fcaf953f3eb1889399955a00379f"
 SRC_URI[sha256sum] = "8038a6db9e832456d5da5559aff8d15130243be1091bf24f3243503a6f1bda98"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
index d7b3977..eead861 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
@@ -5,14 +5,14 @@ HOMEPAGE = "http://dejavu.sourceforge.net/wiki/"
 LICENSE = "Bitstream Vera"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/dejavu-fonts-ttf-${PV}/LICENSE;md5=9f867da7a73fad2715291348e80d0763"
 
-# all subpackages except ${PN}-dbg and ${PN}-common itself rdepends on ${PN}-common
+# all subpackages except ${PN}-common itself rdepends on ${PN}-common
 RDEPENDS_${PN}-sans = "${PN}-common"
 RDEPENDS_${PN}-sans-mono = "${PN}-common"
 RDEPENDS_${PN}-sans-condensed = "${PN}-common"
 RDEPENDS_${PN}-serif = "${PN}-common"
 RDEPENDS_${PN}-serif-condensed = "${PN}-common"
 RDEPENDS_${PN}-common = ""
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.bz2 \
            file://30-dejavu-aliases.conf"
@@ -24,14 +24,14 @@ do_install_append () {
 	install -m 0644 ${WORKDIR}/30-dejavu-aliases.conf ${D}${sysconfdir}/fonts/conf.d/
 }
 
-PACKAGES = "${PN}-dbg \
+PACKAGES = "\
             ${PN}-sans \
             ${PN}-sans-mono \
             ${PN}-sans-condensed \
             ${PN}-serif \
             ${PN}-serif-condensed \
             ${PN}-common"
-RRECOMMENDS_${PN}-dbg = ""
+UPDATE_FONTS_PACKAGES = "${PN}-sans ${PN}-sans-mono ${PN}-sans-condensed ${PN}-serif ${PN}-serif-condensed"
 
 FILES_${PN}-sans            = "${datadir}/fonts/truetype/DejaVuSans.ttf ${datadir}/fonts/truetype/DejaVuSans-*.ttf"
 FILES_${PN}-sans-mono       = "${datadir}/fonts/truetype/DejaVuSansMono*.ttf"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
index 2c3bf2e..1a04a5f 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
@@ -6,7 +6,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.txt;md5=83544262a86f1f1ec761e75897df92bc"
 SRCREV = "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
 PV = "0.1+gitr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://github.com/android/platform_frameworks_base.git;protocol=git;branch=master"
 
@@ -16,9 +16,9 @@ do_install_prepend() {
 	rm ${S}/Ahem.ttf MTLc3m.ttf DroidSansArabic.ttf DroidSansThai.ttf Clockopia.ttf MTLmr3m.ttf DroidSansHebrew.ttf DroidSansFallbackLegacy.ttf # we're not packaging it
 }
 
-PACKAGES = "${PN}-dbg ttf-droid-sans ttf-droid-sans-mono \
+PACKAGES = "ttf-droid-sans ttf-droid-sans-mono \
             ttf-droid-sans-fallback ttf-droid-sans-japanese ttf-droid-serif"
-RRECOMMENDS_${PN}-dbg = ""
+UPDATE_FONTS_PACKAGES = "ttf-droid-sans ttf-droid-sans-mono ttf-droid-sans-fallback ttf-droid-sans-japanese ttf-droid-serif"
 
 FILES_ttf-droid-sans = "${datadir}/fonts/truetype/DroidSans.ttf ${datadir}/fonts/truetype/DroidSans-Bold.ttf"
 FILES_ttf-droid-sans-mono = "${datadir}/fonts/truetype/DroidSansMono.ttf"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
index 3c49e24..1e21e14 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
@@ -6,7 +6,7 @@ LICENSE = "OFL"
 LICENSE_URL = "http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&item_id=OFL"
 LIC_FILES_CHKSUM = "file://OFL;md5=33a5bf7b98a9c0ae87430760ba762295 \
 "
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/t/ttf-gentium/ttf-gentium_${PV}.orig.tar.gz "
 
@@ -22,15 +22,16 @@ do_install_append() {
 
 }
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-alt"
+PACKAGES = "${PN} ${PN}-alt"
+UPDATE_FONTS_PACKAGES = "${PN} ${PN}-alt"
 
-FILES_ttf-gentium-alt = "${datadir}/fonts/truetype/GenAI*.ttf \
-                         ${datadir}/fonts/truetype/GenAR*.ttf \
-			 ${datadir}/doc/ttf-gentium-alt/*"
+FILES_${PN}-alt = "${datadir}/fonts/truetype/GenAI*.ttf \
+                   ${datadir}/fonts/truetype/GenAR*.ttf \
+                   ${datadir}/doc/ttf-gentium-alt/*"
 
 FILES_${PN} = "${datadir}/fonts/truetype/GenI*.ttf \
                ${datadir}/fonts/truetype/GenR*.ttf \
-	       ${datadir}/doc/ttf-gentium/*"
+               ${datadir}/doc/ttf-gentium/*"
 
 SRC_URI[md5sum] = "4c3e6ae586be277537ebb68f2a45b883"
 SRC_URI[sha256sum] = "4746c04c9a4ad9e0788a38e0a2f81919a630d8070ceabc89f156b6d41d8ceb37"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
index 4a23451..1f77211 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
@@ -4,14 +4,15 @@ DESCRIPTION = "Hunky fonts - TTF Version"
 HOMEPAGE = "http://sourceforge.net/projects/hunkyfonts"
 LICENSE = "LGPL"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=7fbc338309ac38fefcd64b04bb903e34"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
 
 S = "${WORKDIR}/hunkyfonts-${PV}/TTF/"
 
-PACKAGES = "${PN}-dbg ttf-hunky-sans ttf-hunky-serif"
-RRECOMMENDS_${PN}-dbg = ""
+PACKAGES = "ttf-hunky-sans ttf-hunky-serif"
+UPDATE_FONTS_PACKAGES = "ttf-hunky-sans ttf-hunky-serif"
+
 FILES_ttf-hunky-sans = "${datadir}/fonts/truetype/HunkySans*.ttf"
 FILES_ttf-hunky-serif = "${datadir}/fonts/truetype/HunkySerif*.ttf"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
index c0d77fd..901b8b2 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://License.txt;md5=5b171c5100029d884fcea21d9a2b7543 \
 "
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://fedorahosted.org/liberation-fonts/export/807b6dfd069b998cd9b4d3158da98817ef23c79d/F-9/liberation-fonts-ttf-3.tar.gz"
 S = "${WORKDIR}/liberation-fonts-${PV}"
 
-PACKAGES = "${PN}-dbg ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
-RRECOMMENDS_${PN}-dbg = ""
+PACKAGES = "ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
+UPDATE_FONTS_PACKAGES = "ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
 
 FILES_ttf-liberation-mono  = "${datadir}/fonts/truetype/*Mono*"
 FILES_ttf-liberation-sans  = "${datadir}/fonts/truetype/*Sans*"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index 9103dab..33f5771 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -6,7 +6,7 @@ LICENSE = "${PN}"
 LIC_FILES_CHKSUM = "file://LICENSE_E;md5=ac161e96eda00db9a3aec7870b5d9658 \
                     file://LICENSE_J;md5=a120ca8d7c8e4a475d5277c9aeb95221 \
 "
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://osdn.dl.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}.tar.gz"
 S = "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
@@ -14,8 +14,12 @@ S = "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
 python populate_packages_prepend() {
     plugindir = d.expand('${datadir}/fonts/ttf-mplus/')
     do_split_packages(d, plugindir, '^(.*)\.ttf$', 'ttf-%s', 'TTF Font %s', extra_depends = "ttf-common")
+    d.setVar('UPDATE_FONTS_PACKAGES', packages)
 }
 
+# for update-fonts.bbclass sake only, replaced later in populate_packages_prepend
+UPDATE_FONTS_PACKAGES = "${PN}"
+
 do_install() {
 	install -d ${D}${datadir}/fonts/ttf-mplus
 	install -m 0644 *.ttf ${D}${datadir}/fonts/ttf-mplus/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index 3c4cb26..d982c11 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -9,17 +9,18 @@ LICENSE = "Public domain"
 LIC_FILES_CHKSUM = "file://README;md5=97d739900be6e852830f55aa3c07d4a0"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES_${PN} = "virtual-japanese-font"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-20040629.tar.bz2"
 S = "${WORKDIR}/sazanami-20040629"
 
-PACKAGES = "${PN}-dbg ttf-sazanami-gothic ttf-sazanami-mincho"
-RRECOMMENDS_${PN}-dbg = ""
+PACKAGES = "ttf-sazanami-gothic ttf-sazanami-mincho"
+UPDATE_FONTS_PACKAGES = "ttf-sazanami-gothic ttf-sazanami-mincho"
+
 FILES_ttf-sazanami-gothic = "${datadir}/fonts/truetype/sazanami-gothic.ttf \
-			     ${datadir}/doc/ttf-sazanami-gothic/README"
+                             ${datadir}/doc/ttf-sazanami-gothic/README"
 FILES_ttf-sazanami-mincho = "${datadir}/fonts/truetype/sazanami-mincho.ttf \
-			     ${datadir}/doc/ttf-sazanami-mincho/README"
+                             ${datadir}/doc/ttf-sazanami-mincho/README"
 
 do_install_append() {
 	# README contains the redistribution license
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
index 08d79a1..8d99259 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
@@ -13,8 +13,8 @@ SRC_URI[sha256sum] = "107170099bbc3beae8602b97a5c423525d363106c3c24f787d43e09811
 
 S = "${WORKDIR}/ubuntu-font-family-${PV}"
 
-PACKAGES = "${PN}-dbg ttf-ubuntu-mono ttf-ubuntu-sans"
-RRECOMMENDS_${PN}-dbg = ""
+PACKAGES = "ttf-ubuntu-mono ttf-ubuntu-sans"
+UPDATE_FONTS_PACKAGES = "ttf-ubuntu-mono ttf-ubuntu-sans"
 
 FILES_ttf-ubuntu-mono  = "${datadir}/fonts/truetype/*Mono*"
 FILES_ttf-ubuntu-sans  = "${datadir}/fonts/truetype/Ubuntu-*"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
index d8c88d5..0263301 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
@@ -5,7 +5,7 @@ AUTHOR = "Qianqian Fang and The WenQuanYi Project Contributors"
 HOMEPAGE = "http://wqy.sourceforge.net/en/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf540fc7d35b5777e36051280b3a911c"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}-0.tar.gz"
 S = "${WORKDIR}/wqy-zenhei"
@@ -17,6 +17,7 @@ do_install_append () {
 }
 
 PACKAGES = "${PN}"
+UPDATE_FONTS_PACKAGES = "${PN}"
 
 FILES_${PN} = "${datadir}/fonts ${sysconfdir}"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
index d48f692..70283be 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
@@ -1,7 +1,5 @@
 DESCRIPTION ?= "TrueType font package ${PN}"
 SECTION = "fonts"
-# don't use RRECOMMENDS_${PN} here because sometimes each font is packaged to separate package and each one needs this dep to call update-fonts
-RRECOMMENDS += "font-update-common"
 
 # we don't need a compiler nor a c library for these fonts
 INHIBIT_DEFAULT_DEPS = "1"
@@ -11,16 +9,4 @@ do_install() {
     find ./ -name '*.tt[cf]' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
 }
 
-pkg_postinst_append() {
-    if [ -z "$D" ]; then
-        update-fonts
-    fi
-}
-
-pkg_postrm_append() {
-    if [ -z "$D" ]; then
-        update-fonts
-    fi
-}
-
-inherit allarch
+inherit allarch update-fonts
-- 
1.8.1.2



