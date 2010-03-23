Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1Nu3Gf-0007Mu-CQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 13:31:50 +0100
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id 142AB687E6;
	Tue, 23 Mar 2010 15:27:02 +0300 (MSK)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1Nu38J-0000E1-Da; Tue, 23 Mar 2010 15:22:55 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Mar 2010 15:22:55 +0300
Message-Id: <1269346975-842-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1269346975-842-1-git-send-email-khimov@altell.ru>
References: <1269346975-842-1-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: 142AB687E6.06FE3
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] use PYTHON_SITEPACKAGES_DIR
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
X-List-Received-Date: Tue, 23 Mar 2010 12:31:54 -0000

Converted most of python site-packages references to PYTHON_SITEPACKAGES_DIR.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 classes/distutils-common-base.bbclass           |    8 ++++----
 classes/distutils.bbclass                       |   12 ++++++------
 recipes/avahi/avahi.inc                         |    4 ++--
 recipes/blueman/blueman_1.10.bb                 |    4 ++--
 recipes/blueman/blueman_1.21.bb                 |    4 ++--
 recipes/dtnrg/dtn_2.5.0.bb                      |    2 +-
 recipes/fetchmail/fetchmail_6.3.14.bb           |    4 ++--
 recipes/freesmartphone/frameworkd_git.bb        |    4 ++--
 recipes/gammu/gammu_1.26.1.bb                   |    8 +++-----
 recipes/gnome/gnome-games_2.24.3.bb             |    4 ++--
 recipes/gnome/gnome-menus_2.16.1.bb             |    6 +++---
 recipes/gnome/gnome-menus_2.22.2.bb             |    6 +++---
 recipes/gnome/gnome-menus_2.24.0.bb             |    6 +++---
 recipes/gnome/gnome-menus_2.26.0.bb             |    6 +++---
 recipes/gnome/gnome-menus_2.28.0.1.bb           |    6 +++---
 recipes/gnome/hippo-canvas_0.3.0.bb             |    6 +++---
 recipes/gnuradio/gnuradio-libusb-compat.inc     |   12 ++++++------
 recipes/gnuradio/gnuradio.inc                   |   12 ++++++------
 recipes/gpsd/gpsd.inc                           |    4 ++--
 recipes/iotop/iotop_0.2.1.bb                    |    4 ++--
 recipes/lowpan-tools/lowpan-tools_git.bb        |    4 ++--
 recipes/openbmap/openbmap-logger_0.2.0.bb       |   12 +++++++-----
 recipes/opencv/opencv_1.0.0.bb                  |    2 +-
 recipes/opencv/opencv_svn.bb                    |    2 +-
 recipes/openmoko-projects/paroli_git.bb         |    2 +-
 recipes/openmoko2/libmokoui2_svn.bb             |    6 +++---
 recipes/rpm/rpm-4.4.2.3.inc                     |    4 ++--
 recipes/sphyrna/sphyrna-python_svn.bb           |    4 ++--
 recipes/sugar/sugar-base_0.82.2.bb              |    2 +-
 recipes/sugar/sugar-base_0.83.2.bb              |    2 +-
 recipes/sugar/sugar-base_0.84.1.bb              |    2 +-
 recipes/sugar/sugar-presence-service_0.82.2.bb  |    4 ++--
 recipes/sugar/sugar-presence-service_0.84.0.bb  |    4 ++--
 recipes/usrp/usrp_0.12.bb                       |    4 ++--
 recipes/xapian/xapian-bindings-python_1.0.14.bb |    2 +-
 recipes/xfce-base/exo_0.3.105.bb                |    6 +++---
 recipes/zope/python-zopeinterface_3.5.1.bb      |    2 +-
 37 files changed, 93 insertions(+), 93 deletions(-)

diff --git a/classes/distutils-common-base.bbclass b/classes/distutils-common-base.bbclass
index b6dce7e..f66a5cd 100644
--- a/classes/distutils-common-base.bbclass
+++ b/classes/distutils-common-base.bbclass
@@ -12,10 +12,10 @@ FILES_${PN} = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 FILES_${PN}-dev += "\
   ${datadir}/pkgconfig \
   ${libdir}/pkgconfig \
-  ${libdir}/${PYTHON_DIR}/site-packages/*.la \
+  ${PYTHON_SITEPACKAGES_DIR}/*.la \
 "
 FILES_${PN}-dbg += "\
-  ${libdir}/${PYTHON_DIR}/site-packages/.debug \
-  ${libdir}/${PYTHON_DIR}/site-packages/*/.debug \
-  ${libdir}/${PYTHON_DIR}/site-packages/*/*/.debug \
+  ${PYTHON_SITEPACKAGES_DIR}/.debug \
+  ${PYTHON_SITEPACKAGES_DIR}/*/.debug \
+  ${PYTHON_SITEPACKAGES_DIR}/*/*/.debug \
 "
diff --git a/classes/distutils.bbclass b/classes/distutils.bbclass
index 4d1fc8c..3a0f2c7 100644
--- a/classes/distutils.bbclass
+++ b/classes/distutils.bbclass
@@ -16,7 +16,7 @@ distutils_do_compile() {
 }
 
 distutils_stage_headers() {
-        install -d ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR}/site-packages
+        install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/python setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         oefatal "python setup.py install_headers execution failed."
@@ -25,18 +25,18 @@ distutils_stage_headers() {
 distutils_stage_all() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
-        install -d ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR}/site-packages
-        PYTHONPATH=${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR}/site-packages \
+        install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
+        PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         oefatal "python setup.py install (stage) execution failed."
 }
 
 distutils_do_install() {
-        install -d ${D}${libdir}/${PYTHON_DIR}/site-packages
+        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
-        PYTHONPATH=${D}/${libdir}/${PYTHON_DIR}/site-packages \
+        PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/python setup.py install ${DISTUTILS_INSTALL_ARGS} || \
         oefatal "python setup.py install execution failed."
@@ -57,7 +57,7 @@ distutils_do_install() {
             done
         fi
 
-        rm -f ${D}${libdir}/${PYTHON_DIR}/site-packages/easy-install.pth
+        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
         
         #
         # FIXME: Bandaid against wrong datadir computation
diff --git a/recipes/avahi/avahi.inc b/recipes/avahi/avahi.inc
index cefb2be..150fa99 100644
--- a/recipes/avahi/avahi.inc
+++ b/recipes/avahi/avahi.inc
@@ -14,7 +14,7 @@ RDEPENDS_avahi-autoipd += "update-rc.d"
 SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
 	   file://00avahi-autoipd file://99avahi-autoipd"
 
-inherit autotools pkgconfig update-rc.d
+inherit autotools pkgconfig update-rc.d python-dir
 # handle update-rc.d RDEPENDS manually, we don't need it on
 # anything but avahi-daemon and avahi-autoipd
 RDEPENDS_append = ""
@@ -52,7 +52,7 @@ FILES_avahi-utils = "${bindir}/avahi-*"
 FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
                        ${sysconfdir}/avahi/avahi-autoipd.action \
                        ${sysconfdir}/udhcpc.d/*avahi-autoipd"
-FILES_python-avahi = "${libdir}/python*/site-packages/avahi/*"
+FILES_python-avahi = "${PYTHON_SITEPACKAGES_DIR}/avahi/*"
 FILES_avahi-discover = "${bindir}/avahi-discover \
                         ${datadir}/applications/avahi-discover.desktop \
                         ${datadir}/avahi/interfaces/avahi-discover.glade"
diff --git a/recipes/blueman/blueman_1.10.bb b/recipes/blueman/blueman_1.10.bb
index 6130902..e382a8b 100644
--- a/recipes/blueman/blueman_1.10.bb
+++ b/recipes/blueman/blueman_1.10.bb
@@ -7,7 +7,7 @@ RDEPENDS = "python-dbus python-pygobject python dbus bluez4 python-pygtk python-
 
 PR = "r1"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig python-dir
 
 EXTRA_OECONF += "--with-no-runtime-deps-check"
 
@@ -18,7 +18,7 @@ SRC_URI = "\
 	http://download.tuxfamily.org/blueman/blueman-${PV}.tar.gz\
 	"
 
-FILES_${PN}-dbg += "${libdir}/python2.6/site-packages/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
 FILES_${PN} += "${libdir} ${datadir}"
 
 do_configure_prepend() {
diff --git a/recipes/blueman/blueman_1.21.bb b/recipes/blueman/blueman_1.21.bb
index 744c053..066e156 100644
--- a/recipes/blueman/blueman_1.21.bb
+++ b/recipes/blueman/blueman_1.21.bb
@@ -15,7 +15,7 @@ PR = "r1"
 
 SRC_URI = "http://download.tuxfamily.org/blueman/blueman-${PV}.tar.gz"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig python-dir
 
 EXTRA_OECONF += "--with-no-runtime-deps-check"
 
@@ -24,7 +24,7 @@ do_configure_prepend() {
     sed -i "s/py_exec_prefix=.*$/py_exec_prefix=\"${@"${STAGING_DIR_TARGET}".replace("/","\/")}\/usr\"/" ${S}/acinclude.m4
 }
 
-FILES_${PN}-dbg += "${libdir}/python2.6/site-packages/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
 FILES_${PN} += "${libdir} ${datadir}"
 
 BLUEZ_LIBS = "-L${libdir} -lbluetooth"
diff --git a/recipes/dtnrg/dtn_2.5.0.bb b/recipes/dtnrg/dtn_2.5.0.bb
index 7dc6fc5..e63b789 100644
--- a/recipes/dtnrg/dtn_2.5.0.bb
+++ b/recipes/dtnrg/dtn_2.5.0.bb
@@ -59,7 +59,7 @@ FILES_python-dtn = "${libdir}/${PYTHON_DIR}"
 RDEPENDS_python-dtn = "python-core dtn-lib"
 
 FILES_${PN}-dbg += "\
-  ${libdir}/${PYTHON_DIR}/site-packages/.debug \
+  ${PYTHON_SITEPACKAGES_DIR}/.debug \
   ${libdir}/.debug \
   ${bindir}/.debug \
 "
diff --git a/recipes/fetchmail/fetchmail_6.3.14.bb b/recipes/fetchmail/fetchmail_6.3.14.bb
index 1934f74..e3aa408 100644
--- a/recipes/fetchmail/fetchmail_6.3.14.bb
+++ b/recipes/fetchmail/fetchmail_6.3.14.bb
@@ -14,9 +14,9 @@ SRC_URI = "http://download.berlios.de/fetchmail/${PN}-${PV}.tar.bz2;name=src \
 SRC_URI[src.md5sum] = "86d3cfbce151881d8bf76a1efd5bda6a"
 SRC_URI[src.sha256sum] = "8657f786f5af1857ddb3b50203e6cde2efad43f49828973cbb22f6d431208607"
 
-inherit autotools gettext
+inherit autotools gettext python-dir
 
 FILES_${PN} = "${bindir}/fetchmail"
 PACKAGES += "${PN}conf"
-FILES_${PN}conf = "${libdir}/python*/site-packages/fetchmailconf.py* ${bindir}/fetchmailconf"
+FILES_${PN}conf = "${PYTHON_SITEPACKAGES_DIR}/fetchmailconf.py* ${bindir}/fetchmailconf"
 rdepends_${PN}conf = "${PN}"
diff --git a/recipes/freesmartphone/frameworkd_git.bb b/recipes/freesmartphone/frameworkd_git.bb
index 04f5e13..47e3523 100644
--- a/recipes/freesmartphone/frameworkd_git.bb
+++ b/recipes/freesmartphone/frameworkd_git.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL"
 PV = "0.9.5.9+gitr${SRCREV}"
 PR = "r3"
 
-inherit distutils update-rc.d
+inherit distutils update-rc.d python-dir
 
 INITSCRIPT_NAME = "frameworkd"
 INITSCRIPT_PARAMS = "defaults 29"
@@ -100,4 +100,4 @@ CONFFILES_${PN}-config = "\
 
 PACKAGE_ARCH_${PN} = "${BASE_PACKAGE_ARCH}"
 FILES_${PN} += "${sysconfdir}/dbus-1 ${sysconfdir}/freesmartphone ${sysconfdir}/init.d ${datadir}"
-FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/framework/subsystems/*/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/framework/subsystems/*/.debug"
diff --git a/recipes/gammu/gammu_1.26.1.bb b/recipes/gammu/gammu_1.26.1.bb
index ec8ef74..c9f8ba8 100644
--- a/recipes/gammu/gammu_1.26.1.bb
+++ b/recipes/gammu/gammu_1.26.1.bb
@@ -10,12 +10,10 @@ SRC_URI = "http://dl.cihar.com/gammu/releases/gammu-${PV}.tar.bz2"
 
 inherit distutils-common-base cmake
 
-PYTHON_DIR = "${@python_dir(d)}"
-
 do_configure() {
     cd ${S}
     sed -i 's@^cmake [^$]*\$@cmake -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_TARGET} $@' configure
-    sed -i 's@\${PYTHON_SITEDIR}@${libdir}/${PYTHON_DIR}/site-packages@g' python/gammu/CMakeLists.txt
+    sed -i 's@\${PYTHON_SITEDIR}@${PYTHON_SITEPACKAGES_DIR}@g' python/gammu/CMakeLists.txt
     ./configure --prefix=${prefix} --enable-shared --enable-backup
 }
 
@@ -35,7 +33,7 @@ PACKAGES =+ "${PN}-smsd libgammu libgsmsd python-${PN}"
 FILES_${PN} = "${bindir}/gammu ${bindir}/jadmaker ${sysconfdir}/bash_completion.d/gammu"
 FILES_${PN}-smsd = "${bindir}/gammu-smsd*"
 FILES_${PN}-dev += "${bindir}/gammu-config ${libdir}/*.so"
-FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/.debug ${libdir}/python*/site-packages/gammu/.debug"
+FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/.debug ${PYTHON_SITEPACKAGES_DIR}/gammu/.debug"
 FILES_libgammu = "${libdir}/libGammu.so.*"
 FILES_libgsmsd = "${libdir}/libgsmsd.so.*"
-FILES_python-${PN} = "${libdir}/${PYTHON_DIR}/site-packages/gammu/*.??"
+FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/gammu/*.??"
diff --git a/recipes/gnome/gnome-games_2.24.3.bb b/recipes/gnome/gnome-games_2.24.3.bb
index f290f61..2fed74b 100644
--- a/recipes/gnome/gnome-games_2.24.3.bb
+++ b/recipes/gnome/gnome-games_2.24.3.bb
@@ -213,7 +213,7 @@ FILES_gnome-games-glchess = "${bindir}/glchess \
 				${datadir}/pixmaps/gnome-glchess.png \
 				${datadir}/applications/glchess.desktop \
 				${sysconfdir}/gconf/schemas/glchess.schemas \
-				${libdir}/python2.5/site-packages/glchess"
+				${PYTHON_SITEPACKAGES_DIR}/glchess"
 
 PACKAGES =+ "gnome-games-sudoku"
 DESCRIPTION_gnome-games-sudoku = "GNOME sudoku"
@@ -226,4 +226,4 @@ FILES_gnome-games-sudoku = "${bindir}/gnome-sudoku \
 				${datadir}/gnome-sudoku \
 				${datadir}/pixmaps/gnome-sudoku.png \
 				${datadir}/applications/gnome-sudoku.desktop \
-				${libdir}/python2.5/site-packages/gnome_sudoku"
+				${PYTHON_SITEPACKAGES_DIR}/gnome_sudoku"
diff --git a/recipes/gnome/gnome-menus_2.16.1.bb b/recipes/gnome/gnome-menus_2.16.1.bb
index 1307c02..16ca59c 100644
--- a/recipes/gnome/gnome-menus_2.16.1.bb
+++ b/recipes/gnome/gnome-menus_2.16.1.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 
 PR = "r1"
 
-inherit gnome pkgconfig
+inherit gnome pkgconfig python-dir
 
 do_stage() {
 autotools_stage_all
@@ -12,6 +12,6 @@ autotools_stage_all
 PACKAGES += "${PN}-python"
 FILES_${PN} += "${datadir}/desktop-directories/"
 FILES_${PN}-python = "${libdir}/python*"
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/*/.debug \
-                    ${libdir}/python*/site-packages/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
+                    ${PYTHON_SITEPACKAGES_DIR}/.debug"
 
diff --git a/recipes/gnome/gnome-menus_2.22.2.bb b/recipes/gnome/gnome-menus_2.22.2.bb
index 5837e7f..8596f1f 100644
--- a/recipes/gnome/gnome-menus_2.22.2.bb
+++ b/recipes/gnome/gnome-menus_2.22.2.bb
@@ -1,7 +1,7 @@
 DEPENDS = "python gnome-vfs libxml2 gconf popt gtk+"
 LICENSE = "GPL"
 
-inherit gnome pkgconfig
+inherit gnome pkgconfig python-dir
 
 do_stage() {
 autotools_stage_all
@@ -10,6 +10,6 @@ autotools_stage_all
 PACKAGES += "${PN}-python"
 FILES_${PN} += "${datadir}/desktop-directories/"
 FILES_${PN}-python = "${libdir}/python*"
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/*/.debug \
-                    ${libdir}/python*/site-packages/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
+                    ${PYTHON_SITEPACKAGES_DIR}/.debug"
 
diff --git a/recipes/gnome/gnome-menus_2.24.0.bb b/recipes/gnome/gnome-menus_2.24.0.bb
index 5837e7f..8596f1f 100644
--- a/recipes/gnome/gnome-menus_2.24.0.bb
+++ b/recipes/gnome/gnome-menus_2.24.0.bb
@@ -1,7 +1,7 @@
 DEPENDS = "python gnome-vfs libxml2 gconf popt gtk+"
 LICENSE = "GPL"
 
-inherit gnome pkgconfig
+inherit gnome pkgconfig python-dir
 
 do_stage() {
 autotools_stage_all
@@ -10,6 +10,6 @@ autotools_stage_all
 PACKAGES += "${PN}-python"
 FILES_${PN} += "${datadir}/desktop-directories/"
 FILES_${PN}-python = "${libdir}/python*"
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/*/.debug \
-                    ${libdir}/python*/site-packages/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
+                    ${PYTHON_SITEPACKAGES_DIR}/.debug"
 
diff --git a/recipes/gnome/gnome-menus_2.26.0.bb b/recipes/gnome/gnome-menus_2.26.0.bb
index 5837e7f..8596f1f 100644
--- a/recipes/gnome/gnome-menus_2.26.0.bb
+++ b/recipes/gnome/gnome-menus_2.26.0.bb
@@ -1,7 +1,7 @@
 DEPENDS = "python gnome-vfs libxml2 gconf popt gtk+"
 LICENSE = "GPL"
 
-inherit gnome pkgconfig
+inherit gnome pkgconfig python-dir
 
 do_stage() {
 autotools_stage_all
@@ -10,6 +10,6 @@ autotools_stage_all
 PACKAGES += "${PN}-python"
 FILES_${PN} += "${datadir}/desktop-directories/"
 FILES_${PN}-python = "${libdir}/python*"
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/*/.debug \
-                    ${libdir}/python*/site-packages/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
+                    ${PYTHON_SITEPACKAGES_DIR}/.debug"
 
diff --git a/recipes/gnome/gnome-menus_2.28.0.1.bb b/recipes/gnome/gnome-menus_2.28.0.1.bb
index 72fc810..461d3eb 100644
--- a/recipes/gnome/gnome-menus_2.28.0.1.bb
+++ b/recipes/gnome/gnome-menus_2.28.0.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 
 DEPENDS = "python gnome-vfs libxml2 gconf popt gtk+"
 
-inherit gnome pkgconfig
+inherit gnome pkgconfig python-dir
 
 do_stage() {
 	autotools_stage_all
@@ -13,6 +13,6 @@ do_stage() {
 PACKAGES += "${PN}-python"
 FILES_${PN} += "${datadir}/desktop-directories/"
 FILES_${PN}-python = "${libdir}/python*"
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/*/.debug \
-                    ${libdir}/python*/site-packages/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
+                    ${PYTHON_SITEPACKAGES_DIR}/.debug"
 
diff --git a/recipes/gnome/hippo-canvas_0.3.0.bb b/recipes/gnome/hippo-canvas_0.3.0.bb
index 2c6da44..1e24377 100644
--- a/recipes/gnome/hippo-canvas_0.3.0.bb
+++ b/recipes/gnome/hippo-canvas_0.3.0.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2"
 
 DEPENDS = "librsvg python-pygtk2"
 
-inherit gnome
+inherit gnome python-dir
 
 DEPENDS += "librsvg"
 
@@ -17,7 +17,7 @@ do_stage() {
         autotools_stage_all
 }
 
-FILES_${PN} += "${libdir}/python*/site-packages"
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
 
 
diff --git a/recipes/gnuradio/gnuradio-libusb-compat.inc b/recipes/gnuradio/gnuradio-libusb-compat.inc
index 8a0ca54..516775b 100644
--- a/recipes/gnuradio/gnuradio-libusb-compat.inc
+++ b/recipes/gnuradio/gnuradio-libusb-compat.inc
@@ -22,7 +22,7 @@ EXTRA_OECONF = " \
   --enable-gr-audio-oss \
   --enable-mblock \
   --disable-html-docs \
-  --with-pythondir=/usr/lib/${PYTHON_DIR}/site-packages \
+  --with-pythondir=${PYTHON_SITEPACKAGES_DIR} \
   PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR} \
 "
 
@@ -99,12 +99,12 @@ FILES_libgnuradio-core = "${libdir}/libgnuradio-core.so.* ${sysconfdir}/gnuradio
 FILES_libgnuradio-core-qa = "${libdir}/libgnuradio-core-qa.so.*"
 FILES_libgromnithread = "${libdir}/libgromnithread.so*"
 
-FILES_${PN} += "${libdir}/python*/site-packages/gnuradio/*"
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/gnuradio/.debug \
-                    ${libdir}/python*/site-packages/gnuradio/*/.debug \
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/*"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \
+                    ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \
 		   "
 
-FILES_gnuradio-usrp = "${libdir}/python*/site-packages/usrp/* \
+FILES_gnuradio-usrp = "${PYTHON_SITEPACKAGES_DIR}/usrp/* \
                        ${bindir}/usrp* \
                        ${datadir}/usrp/*/*"
-FILES_gnuradio-usrp-dbg = "${libdir}/python*/site-packages/usrp/.debug"
+FILES_gnuradio-usrp-dbg = "${PYTHON_SITEPACKAGES_DIR}/usrp/.debug"
diff --git a/recipes/gnuradio/gnuradio.inc b/recipes/gnuradio/gnuradio.inc
index d1d0c12..6eaf119 100644
--- a/recipes/gnuradio/gnuradio.inc
+++ b/recipes/gnuradio/gnuradio.inc
@@ -21,7 +21,7 @@ EXTRA_OECONF = " \
   --enable-gr-audio-oss \
   --enable-mblock \
   --disable-html-docs \
-  --with-pythondir=/usr/lib/${PYTHON_DIR}/site-packages \
+  --with-pythondir=${PYTHON_SITEPACKAGES_DIR} \
   PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR} \
 "
 
@@ -79,12 +79,12 @@ FILES_libgnuradio-core = "${libdir}/libgnuradio-core.so.* ${sysconfdir}/gnuradio
 FILES_libgnuradio-core-qa = "${libdir}/libgnuradio-core-qa.so.*"
 FILES_libgromnithread = "${libdir}/libgromnithread.so*"
 
-FILES_${PN} += "${libdir}/python*/site-packages/gnuradio/*"
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/gnuradio/.debug \
-                    ${libdir}/python*/site-packages/gnuradio/*/.debug \
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/*"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \
+                    ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \
 		   "
 
-FILES_gnuradio-usrp = "${libdir}/python*/site-packages/usrp/* \
+FILES_gnuradio-usrp = "${PYTHON_SITEPACKAGES_DIR}/usrp/* \
                        ${bindir}/usrp* \
                        ${datadir}/usrp/*/*"
-FILES_gnuradio-usrp-dbg = "${libdir}/python*/site-packages/usrp/.debug"
+FILES_gnuradio-usrp-dbg = "${PYTHON_SITEPACKAGES_DIR}/usrp/.debug"
diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
index 85bb36b..536e20b 100644
--- a/recipes/gpsd/gpsd.inc
+++ b/recipes/gpsd/gpsd.inc
@@ -16,7 +16,7 @@ SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=gpsd \
            file://gpsd \
            file://60-gpsd.rules"
 			   
-inherit autotools_stage update-rc.d
+inherit autotools_stage update-rc.d python-dir
 
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
@@ -83,6 +83,6 @@ FILES_gps-utils = "${bindir}/*"
 RDEPENDS_gps-utils = "python-pygps"
 
 DESCRIPTION_python-pygps = "Python bindings to gpsd"
-FILES_python-pygps = "${libdir}/*/site-packages/*"
+FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python-pygps = "python-core python-curses gpsd"
 
diff --git a/recipes/iotop/iotop_0.2.1.bb b/recipes/iotop/iotop_0.2.1.bb
index 5f85f59..6d0424f 100644
--- a/recipes/iotop/iotop_0.2.1.bb
+++ b/recipes/iotop/iotop_0.2.1.bb
@@ -9,6 +9,6 @@ SRC_URI = "http://guichaz.free.fr/iotop/files/${PN}-${PV}.tar.bz2"
 inherit distutils
 
 do_install_append() {
-    rm -f ${D}${libdir}/${PYTHON_DIR}/site-packages/site.pyo
-    rm -f ${D}${libdir}/${PYTHON_DIR}/site-packages/site.py
+    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.pyo
+    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py
 }
diff --git a/recipes/lowpan-tools/lowpan-tools_git.bb b/recipes/lowpan-tools/lowpan-tools_git.bb
index 78b6fa2..f05d60a 100644
--- a/recipes/lowpan-tools/lowpan-tools_git.bb
+++ b/recipes/lowpan-tools/lowpan-tools_git.bb
@@ -12,9 +12,9 @@ FILES_${PN} = "${sbindir}/iz ${sbindir}/izconfig \
                ${bindir}/izchat ${bindir}/izlisten ${sbindir}/izcoordinator \
                ${sbindir}/izattach ${libdir}/ip/link_wpan.so"
 FILES_${PN}-dbg += "${libdir}/ip/.debug/link_wpan.so"
-FILES_${PN}-tests = "${libexecdir}/lowpan-tools ${libdir}/python*/site-packages"
+FILES_${PN}-tests = "${libexecdir}/lowpan-tools ${PYTHON_SITEPACKAGES_DIR}"
 FILES_${PN}-tests-dbg = "${libexecdir}/lowpan-tools/.debug"
 
 EXTRA_OECONF = "--disable-manpages"
 
-inherit autotools_stage
+inherit autotools_stage python-dir
diff --git a/recipes/openbmap/openbmap-logger_0.2.0.bb b/recipes/openbmap/openbmap-logger_0.2.0.bb
index 72e6644..f2fff6e 100644
--- a/recipes/openbmap/openbmap-logger_0.2.0.bb
+++ b/recipes/openbmap/openbmap-logger_0.2.0.bb
@@ -4,9 +4,11 @@ DEPENDS = "python python-dbus python-pygobject python-pygtk libglade"
 RDEPENDS = "python-subprocess python-netclient python-math python-core python-io"
 PR = "r1"
 
+inherit python-dir
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/myposition/openbmap-logger-${PV}.tar.gz"
 
-FILES_${PN} += "${datadir}/openBmap/* ${libdir}/python2.6/site-packages/openbmap/*"
+FILES_${PN} += "${datadir}/openBmap/* ${PYTHON_SITEPACKAGES_DIR}/openbmap/*"
 
 do_configure () {
     :
@@ -19,10 +21,10 @@ do_compile () {
 do_install () {
     install -d ${D}${bindir}
     install -m 0755 openBmapGTK ${D}${bindir}/
-    install -d ${D}${libdir}/python2.6/site-packages/openbmap/
-    install -m 0644 openbmap/__init__.py ${D}${libdir}/python2.6/site-packages/openbmap/
-    install -m 0644 openbmap/logger.py ${D}${libdir}/python2.6/site-packages/openbmap/
-    install -m 0644 openbmap/Upload.py ${D}${libdir}/python2.6/site-packages/openbmap/
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/openbmap/
+    install -m 0644 openbmap/__init__.py ${D}${PYTHON_SITEPACKAGES_DIR}/openbmap/
+    install -m 0644 openbmap/logger.py ${D}${PYTHON_SITEPACKAGES_DIR}/openbmap/
+    install -m 0644 openbmap/Upload.py ${D}${PYTHON_SITEPACKAGES_DIR}/openbmap/
     install -d ${D}${datadir}/pixmaps
     install -d ${D}${datadir}/applications
     install -d ${D}${datadir}/openBmap
diff --git a/recipes/opencv/opencv_1.0.0.bb b/recipes/opencv/opencv_1.0.0.bb
index e973700..7658b2b 100644
--- a/recipes/opencv/opencv_1.0.0.bb
+++ b/recipes/opencv/opencv_1.0.0.bb
@@ -60,7 +60,7 @@ FILES_${PN}-dbg += "${libdir}/.debug"
 FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
 
 DESCRIPTION_python-opencv = "Python bindings to opencv"
-FILES_python-opencv = "${libdir}/*/site-packages/*"
+FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python-opencv = "python-core"
 
 do_stage() {
diff --git a/recipes/opencv/opencv_svn.bb b/recipes/opencv/opencv_svn.bb
index f502618..1e63e1f 100644
--- a/recipes/opencv/opencv_svn.bb
+++ b/recipes/opencv/opencv_svn.bb
@@ -64,7 +64,7 @@ FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
 
 INSANE_SKIP_python-opencv = True
 DESCRIPTION_python-opencv = "Python bindings to opencv"
-FILES_python-opencv = "${libdir}/*/site-packages/*"
+FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python-opencv = "python-core"
 
 do_stage_append() {
diff --git a/recipes/openmoko-projects/paroli_git.bb b/recipes/openmoko-projects/paroli_git.bb
index 4b4c9ad..5845cdc 100644
--- a/recipes/openmoko-projects/paroli_git.bb
+++ b/recipes/openmoko-projects/paroli_git.bb
@@ -35,7 +35,7 @@ do_configure_append() {
 	# fix absolute etc reference
 	sed -i "s|/etc/|../../etc/|" ${S}/setup.py
 	sed -i "s|prefix,|'../../usr/',|" ${S}/setup.py
-	sed -i "s|core/|/usr/lib/python2.6/site-packages/|" ${S}/scripts/paroli
+	sed -i "s|core/|${PYTHON_SITEPACKAGES_DIR}/|" ${S}/scripts/paroli
 	sed -i "s|services|/usr/share/paroli/services|" ${S}/scripts/paroli.fso.cfg
 	sed -i "s|applications|/usr/share/paroli/applications|" ${S}/scripts/paroli.fso.cfg
 }
diff --git a/recipes/openmoko2/libmokoui2_svn.bb b/recipes/openmoko2/libmokoui2_svn.bb
index 97f7eb1..97d715c 100644
--- a/recipes/openmoko2/libmokoui2_svn.bb
+++ b/recipes/openmoko2/libmokoui2_svn.bb
@@ -5,7 +5,7 @@ SRCREV = "4695"
 PV = "0.1.0+svnr${SRCPV}"
 PR = "r5"
 
-inherit openmoko2
+inherit openmoko2 python-dir
 
 SRC_URI += "\
 	file://configure.patch;patch=1 \
@@ -22,6 +22,6 @@ do_configure_prepend() {
 do_stage() {
         autotools_stage_all
 }
-FILES_${PN} += "${libdir}/python2.6/site-packages/mokoui.*"
-FILES_${PN}-dbg += "${libdir}/python2.6/site-packages/.debug/"
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/mokoui.*"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
 FILES_${PN}-dev += "/usr/share/vala/vapi/"
diff --git a/recipes/rpm/rpm-4.4.2.3.inc b/recipes/rpm/rpm-4.4.2.3.inc
index eef308f..22e9734 100644
--- a/recipes/rpm/rpm-4.4.2.3.inc
+++ b/recipes/rpm/rpm-4.4.2.3.inc
@@ -12,7 +12,7 @@ SRC_URI = "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.4.2.3.tar.gz \
 	   file://missingok.patch;patch=1;pnum=0 \
 	   file://extcond.patch;patch=1;pnum=0"
 
-inherit autotools
+inherit autotools python-dir
 
 S = "${WORKDIR}/rpm-${PV}"
 
@@ -21,7 +21,7 @@ ARM_INSTRUCTION_SET = "arm"
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
 PACKAGES += "python-rpm"
-FILES_python-rpm = "${libdir}/python*/site-packages/rpm/_*"
+FILES_python-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/_*"
 
 # Handle the db MUTEX settings here, the POSIX library is
 # the default - "POSIX/pthreads/library".
diff --git a/recipes/sphyrna/sphyrna-python_svn.bb b/recipes/sphyrna/sphyrna-python_svn.bb
index a78a1d1..1e3c412 100644
--- a/recipes/sphyrna/sphyrna-python_svn.bb
+++ b/recipes/sphyrna/sphyrna-python_svn.bb
@@ -9,12 +9,12 @@ SRC_URI = "svn://projects.linuxtogo.org/svn;module=sphyrna"
 
 S = "${WORKDIR}/sphyrna"
 
-inherit autotools
+inherit autotools python-dir
 
 PACKAGES = "${PN}-dbg sphyrna-console sphyrna-python"
 
 FILES_sphyrna-console = "${bindir}/hhconsole"
-FILES_sphyrna-python = "${bindir}/decode.py ${libdir}/python*/site-packages/sphyrna/*"
+FILES_sphyrna-python = "${bindir}/decode.py ${PYTHON_SITEPACKAGES_DIR}/sphyrna/*"
 
 PACKAGE_ARCH_sphyrna-python = "all"
 RDEPENDS_sphyrna-python = "python-core python-re"
diff --git a/recipes/sugar/sugar-base_0.82.2.bb b/recipes/sugar/sugar-base_0.82.2.bb
index 15c4e11..82cbe5e 100644
--- a/recipes/sugar/sugar-base_0.82.2.bb
+++ b/recipes/sugar/sugar-base_0.82.2.bb
@@ -45,7 +45,7 @@ FILES_${PN} += "${datadir}/${PN} \
 		${datadir}/dbus-1 \
 		${sysconfdir} "
 
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/sugar/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/sugar/.debug"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
diff --git a/recipes/sugar/sugar-base_0.83.2.bb b/recipes/sugar/sugar-base_0.83.2.bb
index cb4c055..911b84c 100644
--- a/recipes/sugar/sugar-base_0.83.2.bb
+++ b/recipes/sugar/sugar-base_0.83.2.bb
@@ -45,7 +45,7 @@ FILES_${PN} += "${datadir}/${PN} \
 		${datadir}/dbus-1 \
 		${sysconfdir} "
 
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/sugar/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/sugar/.debug"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
diff --git a/recipes/sugar/sugar-base_0.84.1.bb b/recipes/sugar/sugar-base_0.84.1.bb
index 090e924..0a1d7ef 100644
--- a/recipes/sugar/sugar-base_0.84.1.bb
+++ b/recipes/sugar/sugar-base_0.84.1.bb
@@ -47,7 +47,7 @@ FILES_${PN} += "${datadir}/${PN} \
                 ${datadir}/dbus-1 \
                 ${sysconfdir} "
 
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/sugar/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/sugar/.debug"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
diff --git a/recipes/sugar/sugar-presence-service_0.82.2.bb b/recipes/sugar/sugar-presence-service_0.82.2.bb
index 0e9b171..914434e 100644
--- a/recipes/sugar/sugar-presence-service_0.82.2.bb
+++ b/recipes/sugar/sugar-presence-service_0.82.2.bb
@@ -18,9 +18,9 @@ FILES_${PN} += "${datadir}/${PN} \
 		${datadir}/xsessions \
 		${datadir}/dbus-1 \
 		${sysconfdir} \
-		${libdir}/python*/site-packages/"
+		${PYTHON_SITEPACKAGES_DIR}/"
 
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/*/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug"
 
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
diff --git a/recipes/sugar/sugar-presence-service_0.84.0.bb b/recipes/sugar/sugar-presence-service_0.84.0.bb
index 56b7e45..f52c0ef 100644
--- a/recipes/sugar/sugar-presence-service_0.84.0.bb
+++ b/recipes/sugar/sugar-presence-service_0.84.0.bb
@@ -19,9 +19,9 @@ FILES_${PN} += "${datadir}/${PN} \
                 ${datadir}/xsessions \
                 ${datadir}/dbus-1 \
                 ${sysconfdir} \
-                ${libdir}/python*/site-packages/"
+                ${PYTHON_SITEPACKAGES_DIR}/"
 
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/*/.debug"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug"
 
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
diff --git a/recipes/usrp/usrp_0.12.bb b/recipes/usrp/usrp_0.12.bb
index 6302080..3415765 100644
--- a/recipes/usrp/usrp_0.12.bb
+++ b/recipes/usrp/usrp_0.12.bb
@@ -14,7 +14,7 @@ SRC_URI_append_omap5912osk = "file://usb11.patch;patch=1"
 
 S = "${WORKDIR}/usrp-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig python-dir
 
 CXXFLAGS_powerpc += "-lstdc++"
 
@@ -37,5 +37,5 @@ do_stage () {
 }
 
 PACKAGES += "python-pyusrp-dbg python-pyusrp"
-FILES_python-pyusrp-dbg += "${libdir}/python*/site-packages/.debug"
+FILES_python-pyusrp-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
 FILES_python-pyusrp = "${libdir}/python*"
diff --git a/recipes/xapian/xapian-bindings-python_1.0.14.bb b/recipes/xapian/xapian-bindings-python_1.0.14.bb
index 1180936..1743547 100644
--- a/recipes/xapian/xapian-bindings-python_1.0.14.bb
+++ b/recipes/xapian/xapian-bindings-python_1.0.14.bb
@@ -33,7 +33,7 @@ do_compile() {
 # workaround for bad installation destination and removal of fake .py? files
 do_install_append() {
         mv ${D}/${STAGING_DIR_HOST}/usr/* ${D}/usr/
-        rm ${D}/usr/lib/python2.6/site-packages/xapian.py?
+        rm ${D}/${PYTHON_SITEPACKAGES_DIR}/xapian.py?
 }
 
 do_stage () {
diff --git a/recipes/xfce-base/exo_0.3.105.bb b/recipes/xfce-base/exo_0.3.105.bb
index ab3b2a2..81c00f9 100644
--- a/recipes/xfce-base/exo_0.3.105.bb
+++ b/recipes/xfce-base/exo_0.3.105.bb
@@ -3,7 +3,7 @@ DEPENDS = "libxfce4util hal liburi-perl-native python-native cairo"
 SECTION = "x11"
 PR = "r1"
 
-inherit xfce46
+inherit xfce46 python-dir
 
 XFCE_VERSION = "4.6.1"
 
@@ -23,8 +23,8 @@ do_stage() {
 }
 
 FILES_${PN} += "${datadir}/xfce4/ \
-                ${libdir}/python*/site-packages/* \
+                ${PYTHON_SITEPACKAGES_DIR}/* \
                 ${prefix}/share/pygtk/2.0/defs/exo-0.3/exo.defs \
 "
 
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/*/.debug/*"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug/*"
diff --git a/recipes/zope/python-zopeinterface_3.5.1.bb b/recipes/zope/python-zopeinterface_3.5.1.bb
index 2ef606c..2099862 100644
--- a/recipes/zope/python-zopeinterface_3.5.1.bb
+++ b/recipes/zope/python-zopeinterface_3.5.1.bb
@@ -12,4 +12,4 @@ PR = "r1"
 SRC_URI = "http://pypi.python.org/packages/source/z/zope.interface/zope.interface-${PV}.tar.gz"
 S = "${WORKDIR}/zope.interface-${PV}"
 
-FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*.egg/*/*/.debug"  
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*.egg/*/*/.debug"  
-- 
1.5.6.5



