Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9cjz-0007eY-2K
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 15:02:59 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1747506bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 05:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1kb0wsRV5mE+Gqx0G2wD6zRRVnUEXhZPgihY2EClF80=;
	b=ufIK8eLlJ5GYY9vU8O48vBjSSEk0uS62LvfXy4eR63rifBVTrtCmQRWdIPGXACkXR6
	e1bs2s1v88iItOFHdMXFxcX+Rw9aWaANisoxV08ZJeEe9RNawsLJEKCigCVYiIgZaHqu
	f9mJ+sT03v5fWh3UO+GrEk67Jy5VHcyxYlSCc=
Received: by 10.204.155.90 with SMTP id r26mr4851706bkw.391.1317387452148;
	Fri, 30 Sep 2011 05:57:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s13sm4876239bkb.11.2011.09.30.05.57.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 05:57:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 14:56:41 +0200
Message-Id: <18675311ad0d68a7998f8360930615fa56ef657a.1317387144.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
References: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317387144.git.Martin.Jansa@gmail.com>
References: <cover.1317387144.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 05/15] recipes: use allarch instead of PACKAGE_ARCH = all
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
X-List-Received-Date: Fri, 30 Sep 2011 13:02:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../e17/e-wm-theme-illume-efenniht_svn.bb          |    4 +-
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |   22 +-------------------
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |    5 +--
 .../efl/elementary-theme-efenniht_svn.bb           |    5 +--
 .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |    6 +---
 .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |    5 +--
 meta-oe/recipes-core/udev/udev-extra-rules.bb      |    6 ++--
 .../recipes-navigation/navit/navit-icons_svn.bb    |    7 +----
 meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb |    7 ++---
 9 files changed, 19 insertions(+), 48 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
index 804f670..aaa2e14 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
@@ -4,13 +4,13 @@ HOMEPAGE = "http://trac.enlightenment.org/e/wiki/Themes#Efenniht"
 DEPENDS = "edje-native"
 RDEPENDS_${PN} = "e-wm"
 RSUGGESTS_${PN} = "elementary-theme-efenniht"
-PACKAGE_ARCH = "all"
 LICENSE = "MIT/BSD"
 
 SRCREV = "${EFL_SRCREV}"
 PV = "0.0+svnr${SRCPV}"
+PR = "r1"
 
-inherit e-base
+inherit e-base allarch
 
 SRCNAME = "efenniht"
 SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};proto=http"
diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 2d0f44d..55c9874 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2667a0f4120372ea91f7467cdff4095f"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r19"
+PR = "r20"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -95,26 +95,6 @@ RRECOMMENDS_${PN} = "\
   ${ESYSACTIONS} \
 "
 
-PACKAGE_ARCH_${PN}-config-default = "all"
-PACKAGE_ARCH_${PN}-config-illume2 = "all"
-PACKAGE_ARCH_${PN}-config-minimalist = "all"
-PACKAGE_ARCH_${PN}-config-netbook = "all"
-PACKAGE_ARCH_${PN}-config-scaleable = "all"
-PACKAGE_ARCH_${PN}-config-standard = "all"
-PACKAGE_ARCH_${PN}-theme-default = "all"
-PACKAGE_ARCH_${PN}-background-dark-gradient = "all"
-PACKAGE_ARCH_${PN}-background-light-gradient = "all"
-PACKAGE_ARCH_${PN}-images = "all"
-PACKAGE_ARCH_${PN}-icons = "all"
-PACKAGE_ARCH_${PN}-other = "all"
-PACKAGE_ARCH_${PN}-input-methods = "all"
-PACKAGE_ARCH_${PN}-sysactions = "all"
-PACKAGE_ARCH_${PN}-menu = "all"
-PACKAGE_ARCH_efm-desktop-icon = "all"
-PACKAGE_ARCH_illume-keyboard-default-alpha = "all"
-PACKAGE_ARCH_illume-keyboard-default-numeric = "all"
-PACKAGE_ARCH_illume-keyboard-default-terminal = "all"
-
 FILES_${PN} = "\
   ${bindir}/* \
   ${libdir}/enlightenment/utils/* \
diff --git a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
index ba16190..fa394f7 100644
--- a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
+++ b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
@@ -3,10 +3,10 @@ LICENSE = "MIT/BSD"
 SECTION = "x11"
 DEPENDS = "edje-native"
 PV = "1.0+svnr${SRCPV}"
-PR = "r6"
+PR = "r7"
 SRCREV = "${EFL_SRCREV}"
 
-inherit e-base update-alternatives
+inherit e-base update-alternatives allarch
 
 ALTERNATIVE_NAME = "exquisite-config"
 ALTERNATIVE_LINK = "${sysconfdir}/exquisite/config"
@@ -29,6 +29,5 @@ do_install() {
     echo 'THEME="-t illume"' > ${D}${sysconfdir}/exquisite/config-illume
 }
 
-PACKAGE_ARCH = "all"
 CONFFILES_${PN} = "${sysconfdir}/exquisite/config-illume"
 FILES_${PN} = "${sysconfdir}/exquisite ${datadir}/exquisite/data/themes"
diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
index 68d9ee3..1cf7bd5 100644
--- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
@@ -3,7 +3,6 @@ SECTION = "e/utils"
 HOMEPAGE = "http://trac.enlightenment.org/e/wiki/Themes#Efenniht"
 DEPENDS = "edje-native"
 RSUGGESTS_${PN} = "e-wm-theme-illume-efenniht"
-PACKAGE_ARCH = "all"
 LICENSE = "MIT/BSD"
 
 SRCREV_THM_REV ?= "${EFL_SRCREV}"
@@ -11,9 +10,9 @@ SRCREV_ELM_REV ?= "${EFL_SRCREV}"
 
 SRCREV_FORMAT = "THM_REV"
 PV = "0.0+svnr${SRCPV}"
-PACKAGE_ARCH = "all"
+PR = "r1"
 
-inherit e-base
+inherit e-base allarch
 
 SRCNAME = "efenniht"
 SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};proto=http;name=THM_REV"
diff --git a/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb b/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
index 1934cdb..db43267 100644
--- a/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
+++ b/meta-gnome/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
@@ -6,15 +6,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426"
 
 SECTION = "unknown"
-inherit gnome
+inherit gnome allarch
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://icon-theme.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
         file://index.theme"
 
-PACKAGE_ARCH = "all"
-
 FILES_${PN} += "${datadir}/icons"
 
 do_install_append () {
diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index d0bc699..f40d355 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "GNOME themes"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b543dc97eb7594d026af39d9b54204b"
 
+PR = "r1"
+
 SECTION = "x11/gnome"
 DEPENDS = "gtk-engines icon-naming-utils icon-naming-utils-native glib-2.0 intltool-native"
 RDEPENDS_${PN} = "gnome-icon-theme"
@@ -14,9 +16,6 @@ do_configure_prepend() {
 	sed -i -e 's:`$PKG_CONFIG --variable=program_path icon-naming-utils`:${STAGING_DIR_NATIVE}${libexecdir}:g' configure.in
 }
 
-# allarch doesn't work, it tests the compiler
-PACKAGE_ARCH = "all"
-
 PACKAGES =+ " gnome-theme-crux gnome-theme-highcontrast gnome-theme-highcontrastinverse gnome-theme-highcontrastlargeprint gnome-theme-highcontrastlargeprintinverse gnome-theme-largeprint gnome-theme-mist"
 FILES_gnome-theme-crux = "${datadir}/themes/Crux ${datadir}/icons/Crux"
 FILES_gnome-theme-highcontrast = "${datadir}/themes/HighContrast ${datadir}/icons/HighContrast"
diff --git a/meta-oe/recipes-core/udev/udev-extra-rules.bb b/meta-oe/recipes-core/udev/udev-extra-rules.bb
index dfd4080..ec3f017 100644
--- a/meta-oe/recipes-core/udev/udev-extra-rules.bb
+++ b/meta-oe/recipes-core/udev/udev-extra-rules.bb
@@ -2,7 +2,9 @@ DESCRIPTION = "Extra udev rules"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r2"
+inherit allarch
+
+PR = "r3"
 
 SRC_URI = " \
        file://automount.rules \
@@ -31,5 +33,3 @@ do_install() {
 
 FILES_${PN} = "${sysconfdir}/udev"
 RDEPENDS_${PN} = "udev"
-PACKAGE_ARCH = "all"
-
diff --git a/meta-oe/recipes-navigation/navit/navit-icons_svn.bb b/meta-oe/recipes-navigation/navit/navit-icons_svn.bb
index 116ff43..8688d0c 100644
--- a/meta-oe/recipes-navigation/navit/navit-icons_svn.bb
+++ b/meta-oe/recipes-navigation/navit/navit-icons_svn.bb
@@ -5,17 +5,14 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/GPL-2;md5=751419260aa954499f7abaabaa882bbe
 SECTION = "x11/applications"
 DEPENDS = "glib-2.0 gtk+ imagemagick-native librsvg-native"
 
-#only icons present in the package
-PACKAGE_ARCH = "all"
-
 PV = "0.1.0+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 EXTRA_OECONF = "--disable-binding-python --disable-gui-sdl --disable-samplemap --enable-avoid-float --enable-avoid-unaligned  --enable-svg2png-scaling-flag=32 --disable-speech-speech-dispatcher"
 
 S = "${WORKDIR}/xpm"
 
-inherit autotools
+inherit autotools allarch
 
 FILES_${PN} = " /usr/share/navit/xpm/"
 
diff --git a/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb b/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb
index de1893d..c9b9113 100644
--- a/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb
+++ b/meta-oe/recipes-support/iso-codes/iso-codes_1.4.bb
@@ -1,13 +1,12 @@
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=fbc093901857fcd118f065f900982c24"
 
-PACKAGE_ARCH = "all"
+PR = "r1"
+
 SRC_URI = "ftp://pkg-isocodes.alioth.debian.org/pub/pkg-isocodes/iso-codes-${PV}.tar.bz2"
 SRC_URI[md5sum] = "4073466e57df23d39721513219e4f7ae"
 SRC_URI[sha256sum] = "0a7cf177c25b3f0d77c60a5f1149aab9e03ba70f69bac70138a867efe19a1d97"
 
-inherit autotools
+inherit autotools allarch
 
 FILES_${PN} += "${datadir}/xml/"
-PACKAGE_ARCH = "all"
-
-- 
1.7.6.1



