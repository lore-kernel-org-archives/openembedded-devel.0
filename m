Received: from ey-out-1920.google.com ([74.125.78.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O1eKz-0005zv-DV
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 13:31:28 +0200
Received: by ey-out-1920.google.com with SMTP id 26so452012eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 04:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=p7JbTPtWLG9weqa9OpDuAJfftSr4OGNjpqSrQyl749c=;
	b=gcBkdoP1X1wsBeppR6aq+oAsC3xs3S+dAfyuHPGJTGn7PFN3ZoXrYVsN4C+6lUylMp
	UsnneO4cVNc6u8A76T47jlj7HSnPQtwHE8cNzq6uPWopfVRb3k6DwMMphJCYEqaUd7Cd
	MUMXNZwMNiZVVz7Mf/j8ZSmuAjIBbBhpGO7Xw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ur12pZxDsV5EdHi/st4Ir/Ewn5CJ/qF047PHdWvXZ7Mt+ycP13c9wGDv53g8T+AN3o
	9awjGPN3kmuxevr5YlVYIe2zueJzDHnx2CR8G4PEaknyqswUfUgccdrkjp+cAqilVA2C
	5/Bte//NmeEqENurCrDItPYP9n+mNmS6jtYmA=
Received: by 10.102.170.16 with SMTP id s16mr3033251mue.16.1271158080383;
	Tue, 13 Apr 2010 04:28:00 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w5sm4932663mue.24.2010.04.13.04.27.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Apr 2010 04:28:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Apr 2010 13:23:54 +0200
Message-Id: <1271157835-27308-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
References: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 74.125.78.147
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/6] shr recipes: use SRCPV in git recipes
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
X-List-Received-Date: Tue, 13 Apr 2010 11:31:29 -0000

* recipes probably used only in SHR distribution
* usually without PE bump, because nobody complained that we were
  bumping SRCREV without PV changes and we were using SRCPV in our branch
  before

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/gpe-icons/gpe-theme-neo_git.bb             |    2 +-
 recipes/obsolete/shr/alsa-scenarii-shr_git.bb      |    2 +-
 recipes/obsolete/shr/etk-theme-neo_git.bb          |    2 +-
 recipes/obsolete/shr/etk-theme-shr_git.bb          |    2 +-
 .../libframeworkd-phonegui-efl-theme-neo_git.bb    |    2 +-
 .../shr/libframeworkd-phonegui-efl2_git.bb         |    2 +-
 .../obsolete/shr/libframeworkd-phonegui-efl_git.bb |    2 +-
 recipes/obsolete/shr/libframeworkd-phonegui_git.bb |    2 +-
 recipes/obsolete/shr/shr-contacts_git.bb           |    2 +-
 recipes/obsolete/shr/shr-dialer_git.bb             |    2 +-
 recipes/obsolete/shr/shr-messages_git.bb           |    2 +-
 recipes/pyphonelog/pyphonelog_git.bb               |    2 +-
 recipes/python/python-phoneutils_git.bb            |    2 +-
 recipes/shr/e-wm-config-illume-shr_git.bb          |    2 +-
 recipes/shr/e-wm-config-illume2-shr_git.bb         |    2 +-
 recipes/shr/e-wm-menu-shr_git.bb                   |    2 +-
 recipes/shr/e-wm-sysactions-shr_git.bb             |    2 +-
 recipes/shr/e-wm-theme-illume-gry_git.bb           |    2 +-
 recipes/shr/e-wm-theme-illume-neo_git.bb           |    2 +-
 recipes/shr/e-wm-theme-illume-niebiee_git.bb       |    2 +-
 recipes/shr/e-wm-theme-illume-shr_git.bb           |    2 +-
 recipes/shr/e-wm-theme-illume-sixteen_git.bb       |    2 +-
 recipes/shr/elementary-theme-gry_git.bb            |    2 +-
 recipes/shr/elementary-theme-neo_git.bb            |    2 +-
 recipes/shr/elementary-theme-niebiee_git.bb        |    2 +-
 recipes/shr/elementary-theme-o2_git.bb             |    2 +-
 recipes/shr/elementary-theme-sixteen_git.bb        |    2 +-
 recipes/shr/frameworkd-config-shr_git.bb           |    2 +-
 recipes/shr/gtk-theme-neo_git.bb                   |    2 +-
 recipes/shr/icon-theme-neo_git.bb                  |    2 +-
 recipes/shr/libmodulo_git.bb                       |    2 +-
 recipes/shr/libphone-ui-shr_git.bb                 |    2 +-
 recipes/shr/libphone-ui_git.bb                     |    2 +-
 recipes/shr/libphone-utils_git.bb                  |    2 +-
 recipes/shr/ologicd_git.bb                         |    2 +-
 recipes/shr/phonefsod_git.bb                       |    2 +-
 recipes/shr/phoneui-apps_git.bb                    |    2 +-
 recipes/shr/phoneui-shr-theme-neo_git.bb           |    2 +-
 recipes/shr/phoneui-shr-theme-o2_git.bb            |    2 +-
 recipes/shr/phoneuid_git.bb                        |    2 +-
 recipes/shr/shr-config_git.bb                      |    2 +-
 recipes/shr/shr-e-gadgets_git.bb                   |    2 +-
 recipes/shr/shr-installer_git.bb                   |    2 +-
 recipes/shr/shr-settings_git.bb                    |    2 +-
 recipes/shr/shr-specs_git.bb                       |    2 +-
 recipes/shr/shr-splash-theme-dontpanic_git.bb      |    2 +-
 recipes/shr/shr-splash-theme-handy_git.bb          |    2 +-
 recipes/shr/shr-splash-theme-logo_git.bb           |    2 +-
 recipes/shr/shr-splash-theme-niebiee_git.bb        |    2 +-
 recipes/shr/shr-splash-theme-simple_git.bb         |    2 +-
 recipes/shr/shr-splash-theme-tux_git.bb            |    2 +-
 recipes/shr/shr-splash_git.bb                      |    2 +-
 recipes/shr/shr-theme-gtk-e17lookalike_git.bb      |    2 +-
 recipes/shr/shr-theme_git.bb                       |    2 +-
 recipes/shr/shr-today_git.bb                       |    2 +-
 recipes/shr/shr-wizard_git.bb                      |    2 +-
 56 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/recipes/gpe-icons/gpe-theme-neo_git.bb b/recipes/gpe-icons/gpe-theme-neo_git.bb
index f0f4e0f..1de7fba 100644
--- a/recipes/gpe-icons/gpe-theme-neo_git.bb
+++ b/recipes/gpe-icons/gpe-theme-neo_git.bb
@@ -5,7 +5,7 @@ RSUGGESTS = "gpe-filemanager gpe-sketchbook elementary-theme-neo e-wm-theme-illu
 LICENSE = "unknown"
 
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "0.2-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.2-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "${INC_PR}.2"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/obsolete/shr/alsa-scenarii-shr_git.bb b/recipes/obsolete/shr/alsa-scenarii-shr_git.bb
index cb21e2a..35bf569 100644
--- a/recipes/obsolete/shr/alsa-scenarii-shr_git.bb
+++ b/recipes/obsolete/shr/alsa-scenarii-shr_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Package for the different scenarios used by Openmoko"
 SECTION = "openmoko/base"
 SRCREV = "8e89c8dbae569a08cac246a3805fca20988c0ad1"
-PV = "1.0+gitr${SRCREV}"
+PV = "1.0+gitr${SRCPV}"
 PR = "r4"
 
 COMPATIBLE_MACHINE = "(om-gta01|om-gta02|htcdream)"
diff --git a/recipes/obsolete/shr/etk-theme-neo_git.bb b/recipes/obsolete/shr/etk-theme-neo_git.bb
index ab028b1..42fcf70 100644
--- a/recipes/obsolete/shr/etk-theme-neo_git.bb
+++ b/recipes/obsolete/shr/etk-theme-neo_git.bb
@@ -5,7 +5,7 @@ RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo gpe-theme-
 LICENSE = "unknown"
 
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "0.2-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.2-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r4"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/obsolete/shr/etk-theme-shr_git.bb b/recipes/obsolete/shr/etk-theme-shr_git.bb
index 764955e..610b3e1 100644
--- a/recipes/obsolete/shr/etk-theme-shr_git.bb
+++ b/recipes/obsolete/shr/etk-theme-shr_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "etk SHR theme"
 LICENSE = "MIT BSD"
-PV = "1.1.1-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "1.1.1-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r2"
 
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
diff --git a/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb b/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb
index 15dcc2f..b94914e 100644
--- a/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb
+++ b/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb
@@ -6,7 +6,7 @@ RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo etk-theme-
 LICENSE = "unknown"
 
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "0.2-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.2-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r3"
 
 require libframeworkd-phonegui-efl-theme.inc
diff --git a/recipes/obsolete/shr/libframeworkd-phonegui-efl2_git.bb b/recipes/obsolete/shr/libframeworkd-phonegui-efl2_git.bb
index 9d4d74e..302c58f 100644
--- a/recipes/obsolete/shr/libframeworkd-phonegui-efl2_git.bb
+++ b/recipes/obsolete/shr/libframeworkd-phonegui-efl2_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "frameworkd EFL phonegui 2"
 SECTION = "e/apps"
 DEPENDS += " dbus-glib libframeworkd-glib libframeworkd-phonegui etk evas ecore edje edje-native elementary"
-PV = "0.0.1+gitr${SRCREV}"
+PV = "0.0.1+gitr${SRCPV}"
 PR = "r2"
 
 SRCREV = "917226025c67b75def91e98ea923c2e550474a5b"
diff --git a/recipes/obsolete/shr/libframeworkd-phonegui-efl_git.bb b/recipes/obsolete/shr/libframeworkd-phonegui-efl_git.bb
index 34f9692..c75eaab 100644
--- a/recipes/obsolete/shr/libframeworkd-phonegui-efl_git.bb
+++ b/recipes/obsolete/shr/libframeworkd-phonegui-efl_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://shr-project.org/"
 LICENSE = "GPL"
 SECTION = "e/apps"
 DEPENDS += " dbus-glib libframeworkd-glib libframeworkd-phonegui etk evas ecore edje edje-native elementary"
-PV = "0.0.3+gitr${SRCREV}"
+PV = "0.0.3+gitr${SRCPV}"
 PR = "r36"
 
 require libframeworkd-phonegui-efl-theme.inc
diff --git a/recipes/obsolete/shr/libframeworkd-phonegui_git.bb b/recipes/obsolete/shr/libframeworkd-phonegui_git.bb
index b11f039..29d22a9 100644
--- a/recipes/obsolete/shr/libframeworkd-phonegui_git.bb
+++ b/recipes/obsolete/shr/libframeworkd-phonegui_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Frameworkd phonegui library"
 HOMEPAGE = "http://shr-project.org/"
 LICENSE = "GPL"
 SECTION = "libs"
-PV = "0.0.2+gitr${SRCREV}"
+PV = "0.0.2+gitr${SRCPV}"
 PR = "r10"
 
 DEPENDS="glib-2.0 dbus-glib libframeworkd-glib libphone-utils"
diff --git a/recipes/obsolete/shr/shr-contacts_git.bb b/recipes/obsolete/shr/shr-contacts_git.bb
index 6a22831..ae18feb 100644
--- a/recipes/obsolete/shr/shr-contacts_git.bb
+++ b/recipes/obsolete/shr/shr-contacts_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://shr-project.org/"
 LICENSE = "GPL"
 SECTION = "x11/applications"
 DEPENDS += "dbus-glib libframeworkd-glib libframeworkd-phonegui"
-PV = "0.0.2+gitr${SRCREV}"
+PV = "0.0.2+gitr${SRCPV}"
 PR = "r6"
 
 inherit pkgconfig autotools
diff --git a/recipes/obsolete/shr/shr-dialer_git.bb b/recipes/obsolete/shr/shr-dialer_git.bb
index 816f9d8..f1e9cd3 100644
--- a/recipes/obsolete/shr/shr-dialer_git.bb
+++ b/recipes/obsolete/shr/shr-dialer_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://shr-project.org/"
 LICENSE = "GPL"
 SECTION = "x11/applications"
 DEPENDS += "dbus-glib libframeworkd-glib libframeworkd-phonegui"
-PV = "0.0.2+gitr${SRCREV}"
+PV = "0.0.2+gitr${SRCPV}"
 PR = "r9"
 
 inherit pkgconfig autotools
diff --git a/recipes/obsolete/shr/shr-messages_git.bb b/recipes/obsolete/shr/shr-messages_git.bb
index cb8fc81..35db6c6 100644
--- a/recipes/obsolete/shr/shr-messages_git.bb
+++ b/recipes/obsolete/shr/shr-messages_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://shr-project.org/"
 LICENSE = "GPL"
 SECTION = "x11/applications"
 DEPENDS += "dbus-glib libframeworkd-glib libframeworkd-phonegui"
-PV = "0.0.2+gitr${SRCREV}"
+PV = "0.0.2+gitr${SRCPV}"
 PR = "r8"
 
 inherit pkgconfig autotools
diff --git a/recipes/pyphonelog/pyphonelog_git.bb b/recipes/pyphonelog/pyphonelog_git.bb
index 16ed035..68c72e3 100644
--- a/recipes/pyphonelog/pyphonelog_git.bb
+++ b/recipes/pyphonelog/pyphonelog_git.bb
@@ -9,7 +9,7 @@ inherit distutils
 
 S = "${WORKDIR}/git"
 SRCREV = "7672065334cb64e890cfb86d0236f4c36d595e4b"
-PV = "0.17.0+gitr${SRCREV}"
+PV = "0.17.0+gitr${SRCPV}"
 PR = "r0"
 SRC_URI = "git://shr.bearstech.com/repo/pyphonelog.git;protocol=http"
 FILES_${PN} += "${datadir}/applications/phonelog.desktop \
diff --git a/recipes/python/python-phoneutils_git.bb b/recipes/python/python-phoneutils_git.bb
index 2c6fca1..1cf705a 100644
--- a/recipes/python/python-phoneutils_git.bb
+++ b/recipes/python/python-phoneutils_git.bb
@@ -4,7 +4,7 @@ DEPENDS = "libphone-utils python-cython-native python-pyrex-native"
 RDEPENDS = "libphone-utils"
 
 SRCREV = "8a7c719e0c3f1f8c10f77f17422da02d7177f0dd"
-PV = "0.0.2+gitr${SRCREV}"
+PV = "0.0.2+gitr${SRCPV}"
 PR = "r2"
 
 SRC_URI = "git://git.shr-project.org/repo/libphone-utils.git;protocol=http;branch=master"
diff --git a/recipes/shr/e-wm-config-illume-shr_git.bb b/recipes/shr/e-wm-config-illume-shr_git.bb
index 2f38545..522f7cb 100644
--- a/recipes/shr/e-wm-config-illume-shr_git.bb
+++ b/recipes/shr/e-wm-config-illume-shr_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/utils"
 DEPENDS = "eet"
 LICENSE = "MIT BSD"
 SRCREV = "285e2f0a92fc47d9a739c5a1a936124b6e6fa819"
-PV = "1.2+gitr${SRCREV}"
+PV = "1.2+gitr${SRCPV}"
 
 inherit e
 
diff --git a/recipes/shr/e-wm-config-illume2-shr_git.bb b/recipes/shr/e-wm-config-illume2-shr_git.bb
index bc9a3f7..7f978eb 100644
--- a/recipes/shr/e-wm-config-illume2-shr_git.bb
+++ b/recipes/shr/e-wm-config-illume2-shr_git.bb
@@ -4,7 +4,7 @@ DEPENDS = "eet"
 LICENSE = "MIT BSD"
 RDEPENDS = "shr-e-gadgets"
 SRCREV = "1b6bd24e828455f56c26b2f5cbbf2d16838cace8"
-PV = "1.2+gitr${SRCREV}"
+PV = "1.2+gitr${SRCPV}"
 
 inherit e
 
diff --git a/recipes/shr/e-wm-menu-shr_git.bb b/recipes/shr/e-wm-menu-shr_git.bb
index 2924557..d6232ac 100644
--- a/recipes/shr/e-wm-menu-shr_git.bb
+++ b/recipes/shr/e-wm-menu-shr_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "illume SHR applications.menu config"
 SECTION = "e/utils"
 LICENSE = "MIT BSD"
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "1.1-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "1.1-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r1"
 
 RCONFLICTS_${PN} = "e-wm-menu"
diff --git a/recipes/shr/e-wm-sysactions-shr_git.bb b/recipes/shr/e-wm-sysactions-shr_git.bb
index 38d01a5..075d02b 100644
--- a/recipes/shr/e-wm-sysactions-shr_git.bb
+++ b/recipes/shr/e-wm-sysactions-shr_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "illume SHR sysactions config"
 SECTION = "e/utils"
 LICENSE = "MIT BSD"
 SRCREV = "bbcec18f0ebd47e4f6eea88b9b774edf7400e752"
-PV = "1.1-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "1.1-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r4"
 
 RPROVIDES_${PN} = "e-wm-sysactions"
diff --git a/recipes/shr/e-wm-theme-illume-gry_git.bb b/recipes/shr/e-wm-theme-illume-gry_git.bb
index 16f3482..3d5a5fd 100644
--- a/recipes/shr/e-wm-theme-illume-gry_git.bb
+++ b/recipes/shr/e-wm-theme-illume-gry_git.bb
@@ -7,7 +7,7 @@ RRECOMMENDS = "elementary-theme-gry"
 LICENCE = "unknown"
 
 SRCREV = "a0a974b1e1150aefdf29e8f0ac471a2a60e62532"
-PV = "0.3-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.3-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r1"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/e-wm-theme-illume-neo_git.bb b/recipes/shr/e-wm-theme-illume-neo_git.bb
index ca1b3ab..43705c8 100644
--- a/recipes/shr/e-wm-theme-illume-neo_git.bb
+++ b/recipes/shr/e-wm-theme-illume-neo_git.bb
@@ -8,7 +8,7 @@ RSUGGESTS = "elementary-theme-neo gtk-theme-neo gpe-theme-neo icon-theme-neo"
 LICENCE = "unknown"
 
 SRCREV = "820f4d41531ad6f790615b6a7312a60e30e99fdc"
-PV = "0.1-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.1-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r3"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/e-wm-theme-illume-niebiee_git.bb b/recipes/shr/e-wm-theme-illume-niebiee_git.bb
index d91aa89..3695c01 100644
--- a/recipes/shr/e-wm-theme-illume-niebiee_git.bb
+++ b/recipes/shr/e-wm-theme-illume-niebiee_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/utils"
 DEPENDS = "edje-native"
 LICENSE = "MIT BSD"
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "0.1-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.1-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/e-wm-theme-illume-shr_git.bb b/recipes/shr/e-wm-theme-illume-shr_git.bb
index 491626c..b6354d5 100644
--- a/recipes/shr/e-wm-theme-illume-shr_git.bb
+++ b/recipes/shr/e-wm-theme-illume-shr_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/utils"
 DEPENDS = "edje-native"
 LICENSE = "MIT BSD"
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "1.1-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "1.1-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r6"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/e-wm-theme-illume-sixteen_git.bb b/recipes/shr/e-wm-theme-illume-sixteen_git.bb
index bdce640..5c06d5c 100644
--- a/recipes/shr/e-wm-theme-illume-sixteen_git.bb
+++ b/recipes/shr/e-wm-theme-illume-sixteen_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/utils"
 DEPENDS = "edje-native"
 LICENSE = "MIT BSD"
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "0.1-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.1-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/elementary-theme-gry_git.bb b/recipes/shr/elementary-theme-gry_git.bb
index 5721a76..8b4ed4d 100644
--- a/recipes/shr/elementary-theme-gry_git.bb
+++ b/recipes/shr/elementary-theme-gry_git.bb
@@ -7,7 +7,7 @@ RRECOMMENDS = "e-wm-theme-illume-gry"
 LICENSE = "unknown"
 
 SRCREV = "2b62d1c9b02da047071105a7b5695acd6c6dbcca"
-PV = "0.8-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.8-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r1"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master \
diff --git a/recipes/shr/elementary-theme-neo_git.bb b/recipes/shr/elementary-theme-neo_git.bb
index ff31044..a7080d4 100644
--- a/recipes/shr/elementary-theme-neo_git.bb
+++ b/recipes/shr/elementary-theme-neo_git.bb
@@ -7,7 +7,7 @@ RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo gpe-theme-
 LICENSE = "unknown"
 
 SRCREV = "fb377425e69ce1fc13f5094801b96836203e8154"
-PV = "0.5-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.5-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r1"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master \
diff --git a/recipes/shr/elementary-theme-niebiee_git.bb b/recipes/shr/elementary-theme-niebiee_git.bb
index 6e9bae3..f744893 100644
--- a/recipes/shr/elementary-theme-niebiee_git.bb
+++ b/recipes/shr/elementary-theme-niebiee_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/utils"
 DEPENDS = "edje-native"
 LICENSE = "MIT BSD"
 SRCREV = "2ac643cc273d144bb731a8cbb8ec6b3615de43a0"
-PV = "0.1-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.1-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/elementary-theme-o2_git.bb b/recipes/shr/elementary-theme-o2_git.bb
index 45e37e6..54a7f81 100644
--- a/recipes/shr/elementary-theme-o2_git.bb
+++ b/recipes/shr/elementary-theme-o2_git.bb
@@ -7,7 +7,7 @@ RSUGGESTS = "phoneui-shr-theme-o2"
 LICENSE = "unknown"
 
 SRCREV = "b5eb3134850c277ad8ae1a960b03ff4a509278a8"
-PV = "0.1-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.1-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master \
diff --git a/recipes/shr/elementary-theme-sixteen_git.bb b/recipes/shr/elementary-theme-sixteen_git.bb
index 5c89d2e..abb2fa7 100644
--- a/recipes/shr/elementary-theme-sixteen_git.bb
+++ b/recipes/shr/elementary-theme-sixteen_git.bb
@@ -3,7 +3,7 @@ SECTION = "e/utils"
 DEPENDS = "edje-native"
 LICENSE = "MIT BSD"
 SRCREV = "2ac643cc273d144bb731a8cbb8ec6b3615de43a0"
-PV = "0.1-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.1-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r2"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/frameworkd-config-shr_git.bb b/recipes/shr/frameworkd-config-shr_git.bb
index 181bde3..f25e60d 100644
--- a/recipes/shr/frameworkd-config-shr_git.bb
+++ b/recipes/shr/frameworkd-config-shr_git.bb
@@ -9,7 +9,7 @@ SRCREV_pn-frameworkd-config-shr_FSO_REV ?= "f751f2724eea23d0ca050bdf2672f9011ae0
 SRCREV_pn-frameworkd-config-shr_SHR_REV ?= "cdf5b5f3d8f37d6d91e1eb8d9cf07d034291df87"
 
 SRCREV_FORMAT = "FSO_REV-SHR_REV"
-PV = "0.9.5.9+gitr${SRCREV}"
+PV = "0.9.5.9+gitr${SRCPV}"
 PR = "r8"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/framework.git;protocol=git;branch=master;name=FSO_REV \
diff --git a/recipes/shr/gtk-theme-neo_git.bb b/recipes/shr/gtk-theme-neo_git.bb
index 94f9b9f..d979e24 100644
--- a/recipes/shr/gtk-theme-neo_git.bb
+++ b/recipes/shr/gtk-theme-neo_git.bb
@@ -6,7 +6,7 @@ RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gpe-theme-neo icon-theme
 LICENSE = "unknown"
 
 SRCREV = "f847105c5ef5d488a4bce0c0a85d572c3509d56f"
-PV = "0.2-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.2-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r5"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/icon-theme-neo_git.bb b/recipes/shr/icon-theme-neo_git.bb
index b989472..ff2bfb9 100644
--- a/recipes/shr/icon-theme-neo_git.bb
+++ b/recipes/shr/icon-theme-neo_git.bb
@@ -7,7 +7,7 @@ RSUGGESTS = "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo gpe-theme-
 LICENSE = "unknown"
 
 SRCREV = "f847105c5ef5d488a4bce0c0a85d572c3509d56f"
-PV = "0.2-${EFL_SRCREV}+gitr${SRCREV}"
+PV = "0.2-${EFL_SRCREV}+gitr${SRCPV}"
 PR = "r3"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/libmodulo_git.bb b/recipes/shr/libmodulo_git.bb
index 0386d40..49146da 100644
--- a/recipes/shr/libmodulo_git.bb
+++ b/recipes/shr/libmodulo_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Modulo is a lightweight component container that supports Inversion Of Control, also commonly called Dependency Injection"
 SECTION = "libs"
 SRCREV = "7d2f657d248bd86377e66c329aa6826459d406da"
-PV = "0.0.1+gitr${SRCREV}"
+PV = "0.0.1+gitr${SRCPV}"
 PR = "r1"
 
 inherit autotools autotools_stage pkgconfig vala
diff --git a/recipes/shr/libphone-ui-shr_git.bb b/recipes/shr/libphone-ui-shr_git.bb
index 8854ceb..d764a48 100644
--- a/recipes/shr/libphone-ui-shr_git.bb
+++ b/recipes/shr/libphone-ui-shr_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SHR default module for the Phone UI daemon"
 SECTION = "e/apps"
 DEPENDS += " dbus-glib libframeworkd-glib libphone-ui evas ecore edje edje-native elementary"
 SRCREV = "2106165a2be62053f9d0019d50813823a84b8421"
-PV = "0.0.0+gitr${SRCREV}"
+PV = "0.0.0+gitr${SRCPV}"
 PR = "r5"
 
 SRC_URI = "git://shr.bearstech.com/repo/libphone-ui-shr.git;protocol=http;branch=master"
diff --git a/recipes/shr/libphone-ui_git.bb b/recipes/shr/libphone-ui_git.bb
index ccc6808..20f1e05 100644
--- a/recipes/shr/libphone-ui_git.bb
+++ b/recipes/shr/libphone-ui_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://shr-project.org/"
 LICENSE = "GPL"
 SECTION = "libs"
 SRCREV = "08ccc9710b1f33c93cc8f1c20be9c658ef5040dd"
-PV = "0.0.0+gitr${SRCREV}"
+PV = "0.0.0+gitr${SRCPV}"
 PR = "r0"
 
 DEPENDS="glib-2.0 dbus-glib libframeworkd-glib libphone-utils alsa-lib"
diff --git a/recipes/shr/libphone-utils_git.bb b/recipes/shr/libphone-utils_git.bb
index f842ccd..88d5d4b 100644
--- a/recipes/shr/libphone-utils_git.bb
+++ b/recipes/shr/libphone-utils_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "phone-utils library"
 SECTION = "libs"
 SRCREV = "3eb7242866543a266bd43a048d05b1a674ce94cf"
-PV = "0.0.2+gitr${SRCREV}"
+PV = "0.0.2+gitr${SRCPV}"
 PR = "r2"
 
 DEPENDS="glib-2.0"
diff --git a/recipes/shr/ologicd_git.bb b/recipes/shr/ologicd_git.bb
index e38e405..aaf8620 100644
--- a/recipes/shr/ologicd_git.bb
+++ b/recipes/shr/ologicd_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = ""
 SECTION = "libs"
 SRCREV = "4a32af91a9479ebd4d1d39057354ac9904d74cbb"
-PV = "0.0.1+gitr${SRCREV}"
+PV = "0.0.1+gitr${SRCPV}"
 PR = "r0"
 
 inherit autotools
diff --git a/recipes/shr/phonefsod_git.bb b/recipes/shr/phonefsod_git.bb
index 8b9a4b0..66cfd12 100644
--- a/recipes/shr/phonefsod_git.bb
+++ b/recipes/shr/phonefsod_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 SECTION = "x11/applications"
 DEPENDS += " dbus-glib libframeworkd-glib sqlite3 shr-specs"
 SRCREV = "de3eab1df1682cb41abfd105bb6767fedfbbf7b4"
-PV = "0.0.0+gitr${SRCREV}"
+PV = "0.0.0+gitr${SRCPV}"
 PR = "r4"
 
 SRC_URI = "git://git.shr-project.org/repo/phonefsod.git;protocol=http;branch=master"
diff --git a/recipes/shr/phoneui-apps_git.bb b/recipes/shr/phoneui-apps_git.bb
index 7db24dc..bb7558f 100644
--- a/recipes/shr/phoneui-apps_git.bb
+++ b/recipes/shr/phoneui-apps_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 SECTION = "x11/applications"
 DEPENDS += "dbus-glib"
 SRCREV = "d349e764400d7a4eaaa12f359d6c64b3ca55faaf"
-PV = "0.0.0+gitr${SRCREV}"
+PV = "0.0.0+gitr${SRCPV}"
 PR = "r1"
 
 inherit pkgconfig autotools
diff --git a/recipes/shr/phoneui-shr-theme-neo_git.bb b/recipes/shr/phoneui-shr-theme-neo_git.bb
index 7f67911..3efa82b 100644
--- a/recipes/shr/phoneui-shr-theme-neo_git.bb
+++ b/recipes/shr/phoneui-shr-theme-neo_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "edje-native"
 RDEPENDS = "libphone-ui-shr"
 RSUGGESTS = "e-wm-theme-illume-neo gtk-theme-neo icon-theme-neo elementary-theme-neo"
 SRCREV = "df522dfc585fc0ad83e7164f451d15fb770c524b"
-PV = "0.1+gitr${SRCREV}"
+PV = "0.1+gitr${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/phoneui-shr-theme-o2_git.bb b/recipes/shr/phoneui-shr-theme-o2_git.bb
index 369c4a1..a30a795 100644
--- a/recipes/shr/phoneui-shr-theme-o2_git.bb
+++ b/recipes/shr/phoneui-shr-theme-o2_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "edje-native"
 RDEPENDS = "libphone-ui-shr"
 RSUGGESTS = "elementary-theme-o2"
 SRCREV = "5093da3ca27bb50388ac3277d8685a38772d7f48"
-PV = "0.1+gitr${SRCREV}"
+PV = "0.1+gitr${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/phoneuid_git.bb b/recipes/shr/phoneuid_git.bb
index 1ecf077..e188f30 100644
--- a/recipes/shr/phoneuid_git.bb
+++ b/recipes/shr/phoneuid_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 SECTION = "x11/applications"
 DEPENDS += " dbus-glib libframeworkd-glib libphone-ui sqlite3 shr-specs"
 SRCREV = "30e063783b4b3fe5a411e7739d76dc85129452aa"
-PV = "0.0.0+gitr${SRCREV}"
+PV = "0.0.0+gitr${SRCPV}"
 PR = "r6"
 
 RREPLACES_${PN} = "shr-today"
diff --git a/recipes/shr/shr-config_git.bb b/recipes/shr/shr-config_git.bb
index fd78695..08434ff 100644
--- a/recipes/shr/shr-config_git.bb
+++ b/recipes/shr/shr-config_git.bb
@@ -5,7 +5,7 @@ LICENSE  = "GPLv2"
 DEPENDS = "vala-native elementary libeflvala"
 SECTION = "x11/application"
 SRCREV = "37dd7ac950e2bfd438801faf34c29fccfdbbaccf"
-PV = "0.0.2+gitr${SRCREV}"
+PV = "0.0.2+gitr${SRCPV}"
 PR = "r5"
 
 EXTRA_OECONF="--enable-vapidir=${STAGING_DATADIR}/vala/vapi"
diff --git a/recipes/shr/shr-e-gadgets_git.bb b/recipes/shr/shr-e-gadgets_git.bb
index acef09b..f5b3675 100644
--- a/recipes/shr/shr-e-gadgets_git.bb
+++ b/recipes/shr/shr-e-gadgets_git.bb
@@ -6,7 +6,7 @@ RDEPENDS = "e-wm"
 SECTION = "x11/application"
 
 SRCREV = "c23dda5f81ed3c6d785617696fb009adb5594a55"
-PV = "0.0.0+gitr${SRCREV}"
+PV = "0.0.0+gitr${SRCPV}"
 
 inherit autotools
 
diff --git a/recipes/shr/shr-installer_git.bb b/recipes/shr/shr-installer_git.bb
index 2b90847..8823cba 100644
--- a/recipes/shr/shr-installer_git.bb
+++ b/recipes/shr/shr-installer_git.bb
@@ -6,7 +6,7 @@ RDEPENDS = "python-elementary python-dbus python-core python-edbus packagekit"
 SECTION = "x11/application"
 
 SRCREV = "8608816ea1a1ac14b6e9faaa3685dd2b6450e889"
-PV = "0.0.2+gitr${SRCREV}"
+PV = "0.0.2+gitr${SRCPV}"
 PR = "r0"
 
 inherit setuptools
diff --git a/recipes/shr/shr-settings_git.bb b/recipes/shr/shr-settings_git.bb
index 507be0f..02cc18f 100644
--- a/recipes/shr/shr-settings_git.bb
+++ b/recipes/shr/shr-settings_git.bb
@@ -6,7 +6,7 @@ RDEPENDS = "python-elementary python-dbus python-codecs python-shell python-pyrt
 SECTION = "x11/application"
 SRCREV = "b6aed65934cf047f1abd3d8f630d87f900422c38"
 PE = "1"
-PV = "0.1.1+gitr${SRCREV}"
+PV = "0.1.1+gitr${SRCPV}"
 PR = "r9"
 
 inherit setuptools
diff --git a/recipes/shr/shr-specs_git.bb b/recipes/shr/shr-specs_git.bb
index 9546552..d257b26 100644
--- a/recipes/shr/shr-specs_git.bb
+++ b/recipes/shr/shr-specs_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://shr-project.org/"
 LICENSE = "BSD"
 SECTION = "devel/specifications"
 SRCREV = "d8f0dc85f1a7a6c0c6d24755f3770a55229621ae"
-PV = "0.0.0+gitr${SRCREV}"
+PV = "0.0.0+gitr${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-specs.git;protocol=http;branch=master"
diff --git a/recipes/shr/shr-splash-theme-dontpanic_git.bb b/recipes/shr/shr-splash-theme-dontpanic_git.bb
index bc7f072..ee26fb2 100644
--- a/recipes/shr/shr-splash-theme-dontpanic_git.bb
+++ b/recipes/shr/shr-splash-theme-dontpanic_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SHR splash screen - DON'T PANIC theme"
 SECTION = "x11/data"
 LICENSE = "MIT BSD"
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "1.2+gitr${SRCREV}"
+PV = "1.2+gitr${SRCPV}"
 PR = "r6"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/shr-splash-theme-handy_git.bb b/recipes/shr/shr-splash-theme-handy_git.bb
index ac72e8c..170a2bd 100644
--- a/recipes/shr/shr-splash-theme-handy_git.bb
+++ b/recipes/shr/shr-splash-theme-handy_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SHR splash screen - handy theme"
 SECTION = "x11/data"
 LICENSE = "MIT BSD"
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "1.2+gitr${SRCREV}"
+PV = "1.2+gitr${SRCPV}"
 PR = "r3"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/shr-splash-theme-logo_git.bb b/recipes/shr/shr-splash-theme-logo_git.bb
index da645fe..6d838b4 100644
--- a/recipes/shr/shr-splash-theme-logo_git.bb
+++ b/recipes/shr/shr-splash-theme-logo_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SHR splash screen - SHR logo theme"
 SECTION = "x11/data"
 LICENSE = "MIT BSD"
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "0.1+gitr${SRCREV}"
+PV = "0.1+gitr${SRCPV}"
 PR = "r1"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/shr-splash-theme-niebiee_git.bb b/recipes/shr/shr-splash-theme-niebiee_git.bb
index 100d9ea..0a4f266 100644
--- a/recipes/shr/shr-splash-theme-niebiee_git.bb
+++ b/recipes/shr/shr-splash-theme-niebiee_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SHR splash screen - extremely blue Niebiee theme"
 SECTION = "x11/data"
 LICENSE = "MIT BSD"
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "1.2+gitr${SRCREV}"
+PV = "1.2+gitr${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/shr-splash-theme-simple_git.bb b/recipes/shr/shr-splash-theme-simple_git.bb
index 5c18e43..f873a30 100644
--- a/recipes/shr/shr-splash-theme-simple_git.bb
+++ b/recipes/shr/shr-splash-theme-simple_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SHR splash screen - simple SHR theme"
 SECTION = "x11/data"
 LICENSE = "MIT BSD"
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "1.2+gitr${SRCREV}"
+PV = "1.2+gitr${SRCPV}"
 PR = "r6"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/shr-splash-theme-tux_git.bb b/recipes/shr/shr-splash-theme-tux_git.bb
index 05d5baa..b7c513d 100644
--- a/recipes/shr/shr-splash-theme-tux_git.bb
+++ b/recipes/shr/shr-splash-theme-tux_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SHR splash screen - SHR Tux theme"
 SECTION = "x11/data"
 LICENSE = "MIT BSD"
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "0.1+gitr${SRCREV}"
+PV = "0.1+gitr${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/shr-splash_git.bb b/recipes/shr/shr-splash_git.bb
index 6d0e92f..7686dc4 100644
--- a/recipes/shr/shr-splash_git.bb
+++ b/recipes/shr/shr-splash_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SHR splash screen"
 SECTION = "x11/data"
 LICENSE = "MIT BSD"
 SRCREV = "0375bf2b66a053dd490774004c56b5d949f02ac8"
-PV = "1.2+gitr${SRCREV}"
+PV = "1.2+gitr${SRCPV}"
 PR = "r5"
 DEPENDS = "virtual/shr-splash-theme"
 RRECOMMENDS = "virtual/shr-splash-theme"
diff --git a/recipes/shr/shr-theme-gtk-e17lookalike_git.bb b/recipes/shr/shr-theme-gtk-e17lookalike_git.bb
index efd8857..7004262 100644
--- a/recipes/shr/shr-theme-gtk-e17lookalike_git.bb
+++ b/recipes/shr/shr-theme-gtk-e17lookalike_git.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A gtk theme that looks like e17"
 LICENSE = "MIT BSD"
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "0.1.1+gitr${SRCREV}"
+PV = "0.1.1+gitr${SRCPV}"
 PR = "r5"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/shr/shr-theme_git.bb b/recipes/shr/shr-theme_git.bb
index 16e5444..52a9b3c 100644
--- a/recipes/shr/shr-theme_git.bb
+++ b/recipes/shr/shr-theme_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 SECTION = "x11/data"
 
 SRCREV = "730da87ad75c814c16c856ca138605d985b6efdb"
-PV = "0.0.2+gitr${SRCREV}"
+PV = "0.0.2+gitr${SRCPV}"
 PR = "r2"
 
 inherit autotools
diff --git a/recipes/shr/shr-today_git.bb b/recipes/shr/shr-today_git.bb
index cd8ccd6..439dd77 100644
--- a/recipes/shr/shr-today_git.bb
+++ b/recipes/shr/shr-today_git.bb
@@ -6,7 +6,7 @@ RDEPENDS = "python-edje python-dbus python-edbus python-ecore"
 SECTION = "x11/applications"
 
 SRCREV = "7b69649a9df0e85f0c0f7985fd1d93543c3b11e2"
-PV = "0.0.1+gitr${SRCREV}"
+PV = "0.0.1+gitr${SRCPV}"
 PR = "r2"
 
 inherit distutils
diff --git a/recipes/shr/shr-wizard_git.bb b/recipes/shr/shr-wizard_git.bb
index 7554fe3..aed5820 100644
--- a/recipes/shr/shr-wizard_git.bb
+++ b/recipes/shr/shr-wizard_git.bb
@@ -5,7 +5,7 @@ DEPENDS = "e-wm"
 RDEPENDS = "python-elementary shr-settings python-phoneutils e-wm python-dbus python-edbus"
 SECTION = "x11/application"
 SRCREV = "24450cba257e7057045ad576530f158a03bd0f8b"
-PV = "0.0.0+gitr${SRCREV}"
+PV = "0.0.0+gitr${SRCPV}"
 PR = "r1"
 
 inherit autotools
-- 
1.7.0.4



