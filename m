Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmknx-0000oJ-Kb
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:37:37 +0100
Received: by mail-ee0-f53.google.com with SMTP id c50so3240590eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=aAamM6cquPVMac/nJE6vlVKPlpVxRveSrlUTmvTNN3k=;
	b=p+5D3vZoUnm45p0/76tIrcx+CakxKuQjfZsXxQp5FRIqAbViWMCIWay/NtShE6hQvv
	mSzszOy6Aei/hQ0ICGuXIs9RhSqhKeT0ofW7EKYpLKowo3d3tl/CedwRk7A52Lqc8QyA
	0+xJnB2AV64l0GhgSjfmg7rVutPquAg+/seLfJA7G57GZfjtqQOsy15CLlg+oEKUJBKD
	u6Rk8aPYm0I4yYkVmRguDg14A/gT2yQVYoV9ynUx0XQNpAf8EDkjOkJ40YRd85i8UAXW
	W5M65sVXWoWPEVSNKe9qdKvMvbm0Oz7Z8OD/dVD7mjBIo3pys+adyxppt6XysIP4e5kr
	XkzQ==
X-Received: by 10.14.225.4 with SMTP id y4mr47445350eep.6.1356265353315;
	Sun, 23 Dec 2012 04:22:33 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w3sm34606489eel.17.2012.12.23.04.22.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:22:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:29 +0100
Message-Id: <4b5cff547101ff5c2098bdf1821977463890c4ac.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/30] e-wm: add recipe for released tarball
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
X-List-Received-Date: Sun, 23 Dec 2012 12:37:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../conf/distro/include/efl-from-svn-recipes.inc   |   2 +
 meta-efl/recipes-efl/e17/e-wm.inc                  | 205 ++++++++++++++++++++
 meta-efl/recipes-efl/e17/e-wm_0.17.0.bb            |  16 ++
 meta-efl/recipes-efl/e17/e-wm_svn.bb               | 211 +--------------------
 4 files changed, 230 insertions(+), 204 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm.inc
 create mode 100644 meta-efl/recipes-efl/e17/e-wm_0.17.0.bb

diff --git a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
index 05dac91..23a8eae 100644
--- a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
@@ -1,6 +1,8 @@
 EFL_PREFERRED_VERSION ?= "1.7.4+svn%"
 EFL_PREFERRED_PYTHON_VERSION ?= "1.7.0+svn%"
 
+PREFERRED_VERSION_e-wm ?= "0.17.0+svnr%"
+
 PREFERRED_VERSION_ecore ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_ecore-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_edbus ?= "${EFL_PREFERRED_VERSION}"
diff --git a/meta-efl/recipes-efl/e17/e-wm.inc b/meta-efl/recipes-efl/e17/e-wm.inc
new file mode 100644
index 0000000..61c21d4
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm.inc
@@ -0,0 +1,205 @@
+DESCRIPTION = "The Enlightenment Window Manager Version 17"
+DEPENDS = "eet evas eina ecore edje efreet edbus eeze eio elementary libxcb xcb-util-keysyms"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
+SRCNAME = "e"
+INC_PR = "r11"
+
+inherit e update-alternatives gettext
+S = "${WORKDIR}/${SRCNAME}"
+
+EXTRA_OECONF = "\
+  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
+  --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
+  --x-includes=${STAGING_INCDIR}/X11 \
+  --x-libraries=${STAGING_LIBDIR} \
+  --enable-simple-x11 \
+"
+
+do_configure_prepend() {
+    autopoint || true
+}
+
+do_install_append() {
+    # customising - should rather make this simple upstream
+    install -m 755 ${WORKDIR}/enlightenment_start.oe ${D}/${bindir}
+
+    # security reasons, e-wm checks that in runtime
+    # xinit[418]: ERROR: CONFIGURATION FILE HAS BAD PERMISSIONS
+    chmod 600 ${D}/${sysconfdir}/enlightenment/sysactions.conf
+
+    install -d ${D}/${datadir}/applications/
+    install -m 644 ${S}/src/modules/fileman/module.desktop ${D}/${datadir}/applications/efm.desktop
+    sed "s#Type=Link#Type=Application#g" -i ${D}/${datadir}/applications/efm.desktop
+    echo "Exec=enlightenment_remote -efm-open-dir" >> ${D}/${datadir}/applications/efm.desktop
+    echo "Terminal=false" >> ${D}/${datadir}/applications/efm.desktop
+    echo "Categories=Application;" >> ${D}/${datadir}/applications/efm.desktop
+    echo "StartupNotify=true" >> ${D}/${datadir}/applications/efm.desktop
+    install -d ${D}/${datadir}/icons/
+    install -m 644 ${S}/data/themes/img/O/icon_icon_theme.png ${D}/${datadir}/icons/e-module-fileman.png
+
+    install -d ${D}/${sysconfdir}/xdg/menus
+    install -m 644 ${WORKDIR}/applications.menu ${D}/${sysconfdir}/xdg/menus/
+    for I in `find ${D}/${libdir}/enlightenment -name "*.a" -print`; do rm -f $I; done
+    for I in `find ${D}/${libdir}/enlightenment -name "*.la" -print`; do rm -f $I; done
+
+    # work around for issue caused in r78978, more infor in:
+    # http://sourceforge.net/mailarchive/forum.php?thread_name=20121118194904.GA3438%40jama.jama.net&forum_name=enlightenment-devel
+    mv ${D}/${libdir}/enlightenment/modules/policies ${D}/${libdir}/enlightenment/modules/illume2/ \
+      || echo "illume2 policies are in correct place now"
+    mv ${D}/${libdir}/enlightenment/modules/keyboards ${D}/${libdir}/enlightenment/modules/illume2/ \
+      || echo "illume2 keyboards are in correct place now"
+}
+
+RDEPENDS_${PN} += "\
+  shared-mime-info \
+  mime-support \
+  setxkbmap \
+  edje-utils \
+  ${PN}-utils \
+  dbus-x11 \
+  evas-loader-png \
+  evas-loader-jpeg \
+  evas-loader-gif \
+  evas-generic-loader-svg \
+"
+
+# Uclibc build don't have 'glibc-utils'
+RDEPENDS_${PN}_append_libc-glibc = " glibc-utils "
+
+# The systray module used to be external, but is part of e-wm now
+RREPLACES_${PN} = "systray"
+
+RREPLACES_${PN}-config-mobile = "${PN}-config-illume2"
+RCONFLICTS_${PN}-config-mobile = "${PN}-config-illume2"
+RPROVIDES_${PN}-config-mobile = "${PN}-config-illume2"
+
+PACKAGES =+ "\
+  ${PN}-config-default \
+  ${PN}-config-mobile \
+  ${PN}-config-minimalist \
+  ${PN}-config-netbook \
+  ${PN}-config-scaleable \
+  ${PN}-config-standard \
+  ${PN}-theme-default \
+  ${PN}-background-dark-gradient \
+  ${PN}-background-light-gradient \
+  ${PN}-backgrounds \
+  ${PN}-images \
+  ${PN}-icons \
+  ${PN}-other \
+  ${PN}-input-methods \
+  ${PN}-sysactions \
+  ${PN}-utils \
+  ${PN}-menu \
+  efm-desktop-icon \
+  illume-keyboard-default-alpha \
+  illume-keyboard-default-numeric \
+  illume-keyboard-default-terminal \
+"
+
+ESYSACTIONS ?= "${PN}-sysactions"
+
+RRECOMMENDS_${PN} = "\
+  ${PN}-config-default \
+  ${PN}-images \
+  ${PN}-icons \
+  ${PN}-other \
+  ${PN}-input-methods \
+  ${ESYSACTIONS} \
+"
+
+FILES_${PN} = "\
+  ${bindir}/* \
+  ${libdir}/enlightenment/utils/* \
+  ${libdir}/enlightenment/modules/*/*.* \
+  ${libdir}/enlightenment/modules/*/*/* \
+  ${libdir}/enlightenment/modules/*/*/.order \
+  ${libdir}/enlightenment/modules/keyboards/ignore_built_in_keyboards \
+  ${libdir}/enlightenment/*plugins/*/*/* \
+  ${libdir}/enlightenment/preload/e_precache.so \
+  ${datadir}/enlightenment/data/icons \
+  ${datadir}/enlightenment/data/favorites \
+  ${datadir}/enlightenment/data/input_methods \
+  ${datadir}/enlightenment/data/config/profile.cfg \
+  ${datadir}/enlightenment/AUTHORS \
+  ${datadir}/enlightenment/COPYING \
+  ${datadir}/xsessions/enlightenment.desktop \
+  ${sysconfdir}/xdg \
+"
+
+FILES_${PN}-config-default = "${datadir}/enlightenment/data/config/default"
+FILES_${PN}-config-mobile = "${datadir}/enlightenment/data/config/mobile"
+FILES_${PN}-config-minimalist = "${datadir}/enlightenment/data/config/minimalist"
+FILES_${PN}-config-netbook = "${datadir}/enlightenment/data/config/netbook"
+FILES_${PN}-config-scaleable = "${datadir}/enlightenment/data/config/scaleable"
+FILES_${PN}-config-standard = "${datadir}/enlightenment/data/config/standard"
+FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
+FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
+FILES_${PN}-background-dark-gradient = "${datadir}/enlightenment/data/backgrounds/Dark_Gradient.edj"
+FILES_${PN}-background-light-gradient = "${datadir}/enlightenment/data/backgrounds/Light_Gradient.edj"
+FILES_${PN}-backgrounds = "${datadir}/enlightenment/data/backgrounds/*.edj"
+FILES_${PN}-images = "${datadir}/enlightenment/data/images ${datadir}/enlightenment/data/flags"
+FILES_${PN}-icons = "${datadir}/enlightenment/data/icons"
+FILES_${PN}-other = "${datadir}/enlightenment/data/other"
+FILES_${PN}-input-methods = "${datadir}/enlightenment/data/input_methods"
+FILES_${PN}-sysactions = "${sysconfdir}/enlightenment/sysactions.conf"
+FILES_${PN}-utils = "${libdir}/enlightenment/utils/*"
+FILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
+
+FILES_efm-desktop-icon = "\
+  ${datadir}/applications/efm.desktop \
+  ${datadir}/applications/enlightenment_filemanager.desktop \
+  ${datadir}/icons/e-module-fileman.png \
+"
+
+KEYBOARDS_DIR="${libdir}/enlightenment/modules/illume-keyboard/keyboards"
+FILES_illume-keyboard-default-alpha = "\
+  ${KEYBOARDS_DIR}/Default.kbd \
+  ${KEYBOARDS_DIR}/alpha.png \
+"
+FILES_illume-keyboard-default-numeric = "\
+  ${KEYBOARDS_DIR}/Numbers.kbd \
+  ${KEYBOARDS_DIR}/numeric.png \
+"
+FILES_illume-keyboard-default-terminal = "\
+  ${KEYBOARDS_DIR}/Terminal.kbd \
+  ${KEYBOARDS_DIR}/qwerty.png \
+"
+
+RRECOMMENDS_${PN}-config-default = "${PN}-theme-default"
+RRECOMMENDS_${PN}-config-mobile = "\
+  illume-keyboard-default-alpha \
+  illume-keyboard-default-numeric \
+  illume-keyboard-default-terminal \
+"
+
+RRECOMMENDS_${PN}-config-minimalist = "\
+  ${PN}-background-light-gradient \
+  ${PN}-theme-default \
+"
+RRECOMMENDS_${PN}-config-netbook = "\
+  ${PN}-background-dark-gradient \
+  ${PN}-theme-default \
+"
+RRECOMMENDS_${PN}-config-scaleable = "${PN}-theme-default"
+RRECOMMENDS_${PN}-config-standard = "${PN}-theme-default"
+
+FILES_${PN}-dbg += "\
+  ${libdir}/enlightenment/modules/*/*/.debug/ \
+  ${libdir}/enlightenment/modules/policies/.debug/ \
+  ${libdir}/enlightenment/preload/.debug/ \
+  ${libdir}/enlightenment/utils/.debug/ \
+  ${libdir}/enlightenment/*plugins/*/*/.debug \
+"
+
+FILES_${PN}-doc += "\
+  ${datadir}/enlightenment/doc \
+"
+
+CONFFILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
+CONFFILES_${PN}-sysactions = "/etc/enlightenment/sysactions.conf"
+
+ALTERNATIVE_${PN} = "x-window-manager"
+ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/enlightenment_start.oe"
+ALTERNATIVE_PRIORITY[x-window-manager] = "16"
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.17.0.bb b/meta-efl/recipes-efl/e17/e-wm_0.17.0.bb
new file mode 100644
index 0000000..f12072c
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm_0.17.0.bb
@@ -0,0 +1,16 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRCNAME = "enlightenment"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+  file://enlightenment_start.oe \
+  file://applications.menu \
+"
+
+SRC_URI[md5sum] = "b2824849c2c56d80fdc11c1f2171d4ec"
+SRC_URI[sha256sum] = "469a493c6f7fb2599912edb5ec17181554187c2845bb5290878f1eba9e04b258"
diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index abee301..22eb821 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -1,13 +1,12 @@
-DESCRIPTION = "The Enlightenment Window Manager Version 17"
-DEPENDS = "eet evas eina ecore edje efreet edbus eeze eio elementary libxcb xcb-util-keysyms"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
-SRCNAME = "e"
-PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r10"
+require ${BPN}.inc
+
+PV = "0.17.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
+
+DEFAULT_PREFERENCE = "-1"
+
 SRCREV = "${EFL_SRCREV}"
 
-inherit e update-alternatives gettext
 S = "${WORKDIR}/${SRCNAME}"
 
 SRC_URI = "\
@@ -15,199 +14,3 @@ SRC_URI = "\
   file://enlightenment_start.oe \
   file://applications.menu \
 "
-
-EXTRA_OECONF = "\
-  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-  --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
-  --x-includes=${STAGING_INCDIR}/X11 \
-  --x-libraries=${STAGING_LIBDIR} \
-  --enable-simple-x11 \
-"
-
-do_configure_prepend() {
-    autopoint || true
-}
-
-do_install_append() {
-    # customising - should rather make this simple upstream
-    install -m 755 ${WORKDIR}/enlightenment_start.oe ${D}/${bindir}
-
-    # security reasons, e-wm checks that in runtime
-    # xinit[418]: ERROR: CONFIGURATION FILE HAS BAD PERMISSIONS
-    chmod 600 ${D}/${sysconfdir}/enlightenment/sysactions.conf
-
-    install -d ${D}/${datadir}/applications/
-    install -m 644 ${S}/src/modules/fileman/module.desktop ${D}/${datadir}/applications/efm.desktop
-    sed "s#Type=Link#Type=Application#g" -i ${D}/${datadir}/applications/efm.desktop
-    echo "Exec=enlightenment_remote -efm-open-dir" >> ${D}/${datadir}/applications/efm.desktop
-    echo "Terminal=false" >> ${D}/${datadir}/applications/efm.desktop
-    echo "Categories=Application;" >> ${D}/${datadir}/applications/efm.desktop
-    echo "StartupNotify=true" >> ${D}/${datadir}/applications/efm.desktop
-    install -d ${D}/${datadir}/icons/
-    install -m 644 ${S}/data/themes/img/O/icon_icon_theme.png ${D}/${datadir}/icons/e-module-fileman.png
-
-    install -d ${D}/${sysconfdir}/xdg/menus
-    install -m 644 ${WORKDIR}/applications.menu ${D}/${sysconfdir}/xdg/menus/
-    for I in `find ${D}/${libdir}/enlightenment -name "*.a" -print`; do rm -f $I; done
-    for I in `find ${D}/${libdir}/enlightenment -name "*.la" -print`; do rm -f $I; done
-
-    # work around for issue caused in r78978, more infor in:
-    # http://sourceforge.net/mailarchive/forum.php?thread_name=20121118194904.GA3438%40jama.jama.net&forum_name=enlightenment-devel
-    mv ${D}/${libdir}/enlightenment/modules/policies ${D}/${libdir}/enlightenment/modules/illume2/ \
-      || echo "illume2 policies are in correct place now"
-    mv ${D}/${libdir}/enlightenment/modules/keyboards ${D}/${libdir}/enlightenment/modules/illume2/ \
-      || echo "illume2 keyboards are in correct place now"
-}
-
-RDEPENDS_${PN} += "\
-  shared-mime-info \
-  mime-support \
-  setxkbmap \
-  edje-utils \
-  ${PN}-utils \
-  dbus-x11 \
-  evas-loader-png \
-  evas-loader-jpeg \
-  evas-loader-gif \
-  evas-generic-loader-svg \
-"
-
-# Uclibc build don't have 'glibc-utils'
-RDEPENDS_${PN}_append_libc-glibc = " glibc-utils "
-
-# The systray module used to be external, but is part of e-wm now
-RREPLACES_${PN} = "systray"
-
-RREPLACES_${PN}-config-mobile = "${PN}-config-illume2"
-RCONFLICTS_${PN}-config-mobile = "${PN}-config-illume2"
-RPROVIDES_${PN}-config-mobile = "${PN}-config-illume2"
-
-PACKAGES =+ "\
-  ${PN}-config-default \
-  ${PN}-config-mobile \
-  ${PN}-config-minimalist \
-  ${PN}-config-netbook \
-  ${PN}-config-scaleable \
-  ${PN}-config-standard \
-  ${PN}-theme-default \
-  ${PN}-background-dark-gradient \
-  ${PN}-background-light-gradient \
-  ${PN}-backgrounds \
-  ${PN}-images \
-  ${PN}-icons \
-  ${PN}-other \
-  ${PN}-input-methods \
-  ${PN}-sysactions \
-  ${PN}-utils \
-  ${PN}-menu \
-  efm-desktop-icon \
-  illume-keyboard-default-alpha \
-  illume-keyboard-default-numeric \
-  illume-keyboard-default-terminal \
-"
-
-ESYSACTIONS ?= "${PN}-sysactions"
-
-RRECOMMENDS_${PN} = "\
-  ${PN}-config-default \
-  ${PN}-images \
-  ${PN}-icons \
-  ${PN}-other \
-  ${PN}-input-methods \
-  ${ESYSACTIONS} \
-"
-
-FILES_${PN} = "\
-  ${bindir}/* \
-  ${libdir}/enlightenment/utils/* \
-  ${libdir}/enlightenment/modules/*/*.* \
-  ${libdir}/enlightenment/modules/*/*/* \
-  ${libdir}/enlightenment/modules/*/*/.order \
-  ${libdir}/enlightenment/modules/keyboards/ignore_built_in_keyboards \
-  ${libdir}/enlightenment/*plugins/*/*/* \
-  ${libdir}/enlightenment/preload/e_precache.so \
-  ${datadir}/enlightenment/data/icons \
-  ${datadir}/enlightenment/data/favorites \
-  ${datadir}/enlightenment/data/input_methods \
-  ${datadir}/enlightenment/data/config/profile.cfg \
-  ${datadir}/enlightenment/AUTHORS \
-  ${datadir}/enlightenment/COPYING \
-  ${datadir}/xsessions/enlightenment.desktop \
-  ${sysconfdir}/xdg \
-"
-
-FILES_${PN}-config-default = "${datadir}/enlightenment/data/config/default"
-FILES_${PN}-config-mobile = "${datadir}/enlightenment/data/config/mobile"
-FILES_${PN}-config-minimalist = "${datadir}/enlightenment/data/config/minimalist"
-FILES_${PN}-config-netbook = "${datadir}/enlightenment/data/config/netbook"
-FILES_${PN}-config-scaleable = "${datadir}/enlightenment/data/config/scaleable"
-FILES_${PN}-config-standard = "${datadir}/enlightenment/data/config/standard"
-FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
-FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
-FILES_${PN}-background-dark-gradient = "${datadir}/enlightenment/data/backgrounds/Dark_Gradient.edj"
-FILES_${PN}-background-light-gradient = "${datadir}/enlightenment/data/backgrounds/Light_Gradient.edj"
-FILES_${PN}-backgrounds = "${datadir}/enlightenment/data/backgrounds/*.edj"
-FILES_${PN}-images = "${datadir}/enlightenment/data/images ${datadir}/enlightenment/data/flags"
-FILES_${PN}-icons = "${datadir}/enlightenment/data/icons"
-FILES_${PN}-other = "${datadir}/enlightenment/data/other"
-FILES_${PN}-input-methods = "${datadir}/enlightenment/data/input_methods"
-FILES_${PN}-sysactions = "${sysconfdir}/enlightenment/sysactions.conf"
-FILES_${PN}-utils = "${libdir}/enlightenment/utils/*"
-FILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
-
-FILES_efm-desktop-icon = "\
-  ${datadir}/applications/efm.desktop \
-  ${datadir}/applications/enlightenment_filemanager.desktop \
-  ${datadir}/icons/e-module-fileman.png \
-"
-
-KEYBOARDS_DIR="${libdir}/enlightenment/modules/illume-keyboard/keyboards"
-FILES_illume-keyboard-default-alpha = "\
-  ${KEYBOARDS_DIR}/Default.kbd \
-  ${KEYBOARDS_DIR}/alpha.png \
-"
-FILES_illume-keyboard-default-numeric = "\
-  ${KEYBOARDS_DIR}/Numbers.kbd \
-  ${KEYBOARDS_DIR}/numeric.png \
-"
-FILES_illume-keyboard-default-terminal = "\
-  ${KEYBOARDS_DIR}/Terminal.kbd \
-  ${KEYBOARDS_DIR}/qwerty.png \
-"
-
-RRECOMMENDS_${PN}-config-default = "${PN}-theme-default"
-RRECOMMENDS_${PN}-config-mobile = "\
-  illume-keyboard-default-alpha \
-  illume-keyboard-default-numeric \
-  illume-keyboard-default-terminal \
-"
-
-RRECOMMENDS_${PN}-config-minimalist = "\
-  ${PN}-background-light-gradient \
-  ${PN}-theme-default \
-"
-RRECOMMENDS_${PN}-config-netbook = "\
-  ${PN}-background-dark-gradient \
-  ${PN}-theme-default \
-"
-RRECOMMENDS_${PN}-config-scaleable = "${PN}-theme-default"
-RRECOMMENDS_${PN}-config-standard = "${PN}-theme-default"
-
-FILES_${PN}-dbg += "\
-  ${libdir}/enlightenment/modules/*/*/.debug/ \
-  ${libdir}/enlightenment/modules/policies/.debug/ \
-  ${libdir}/enlightenment/preload/.debug/ \
-  ${libdir}/enlightenment/utils/.debug/ \
-  ${libdir}/enlightenment/*plugins/*/*/.debug \
-"
-
-FILES_${PN}-doc += "\
-  ${datadir}/enlightenment/doc \
-"
-
-CONFFILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
-CONFFILES_${PN}-sysactions = "/etc/enlightenment/sysactions.conf"
-
-ALTERNATIVE_${PN} = "x-window-manager"
-ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/enlightenment_start.oe"
-ALTERNATIVE_PRIORITY[x-window-manager] = "16"
-- 
1.8.0.2



