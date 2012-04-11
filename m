Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SI6wt-0004eU-MB
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2012 01:27:40 +0200
Received: (qmail 5215 invoked by uid 1003); 11 Apr 2012 23:11:40 -0000
Received: from unknown (HELO localhost.localdomain)
	(philip@balister.org@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	11 Apr 2012 23:11:40 -0000
From: philip@balister.org
To: openembedded-devel@openembedded.org
Date: Wed, 11 Apr 2012 16:11:30 -0700
Message-Id: <1334185891-25460-5-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1334185891-25460-1-git-send-email-philip@balister.org>
References: <1334185891-25460-1-git-send-email-philip@balister.org>
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe 4/5] gnuradio : Update to version 3.5.3.
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
X-List-Received-Date: Wed, 11 Apr 2012 23:27:40 -0000

From: Philip Balister <philip@opensdr.com>

Signed-off-by: Philip Balister <philip@opensdr.com>
---
 .../recipes-connectivity/gnuradio/gnuradio_git.bb  |   79 ++++++++++++++++++--
 1 files changed, 71 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
index d5e297d..ae8ebca 100644
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
@@ -1,18 +1,81 @@
-require gnuradio.inc
+DESCRIPTION = "GNU Radio"
+URL = "http://gnuradio.org"
+SECTION =  "apps"
+PRIORITY = "optional"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "${INC_PR}.0"
-PV = "3.4.0-${PR}+gitr${SRCREV}"
+PR = "r0"
 
-SRCREV = "62768eedf8f68680ef3a672a27025227e22ccbb0"
+DEPENDS = "uhd gsl fftwf python alsa-lib boost cppunit \
+           swig-native python-numpy python-pygtk orc qt4-x11-free qwt"
+
+inherit distutils-base cmake pkgconfig
+
+export BUILD_SYS
+export HOST_SYS="${MULTIMACH_TARGET_SYS}"
+
+RDEPENDS_${PN} = "python-core python-audio python-threading python-codecs \
+                  python-lang python-textutils python-shell python-pickle \
+                  python-compiler python-pkgutil python-pydoc python-mmap \
+                  python-netclient python-difflib \
+                  python-pprint python-numpy python-pygtk python-lxml \
+                 "
+
+C_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+#do_configure_append() {
+#	find ${S} -name Makefile | xargs sed -i s:'-I${STAGING_INCDIR_NATIVE'::g
+#	find ${S} -name Makefile | xargs sed -i s:'-L${STAGING_LIBDIR_NATIVE'::g
+#}
+
+do_configure_prepend() {
+	${BUILD_CC} ${S}/gr-vocoder/lib/codec2/generate_codebook.c -o ${S}/gr-vocoder/lib/generate_codebook -lm
+	echo "ADD_EXECUTABLE(generate_codebook IMPORTED)" >${S}/gr-vocoder/lib/generate_codebook.txt
+	echo "SET_PROPERTY(TARGET generate_codebook APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)" >>${S}/gr-vocoder/lib/generate_codebook.txt
+	echo 'SET_TARGET_PROPERTIES(generate_codebook PROPERTIES IMPORTED_LOCATION_RELEASE "${S}/gr-vocoder/lib/generate_codebook")' >>${S}/gr-vocoder/lib/generate_codebook.txt
+}
+
+do_compile_prepend() {
+	cp ${S}/gr-vocoder/lib/codec2/defines.h ${OECMAKE_BUILDPATH}/gr-vocoder/lib/codec2
+}
+
+PACKAGES =+ "\
+  ${PN}-examples \
+  ${PN}-grc \
+"
+
+FILES_${PN}-grc = "${datadir}/gnuradio/grc"
+
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/*"
+FILES_${PN} += "${datadir}/gnuradio/*"
+# The following needs fixing upstream
+FILES_${PN} += "${prefix}/etc/gnuradio/*"
+
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \
+                    ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \
+		   "
+FILES_${PN}-examples = "${datadir}/gnuradio/examples"
+
+PV = "3.5.3"
+
+FILESPATHPKG_prepend = "gnuradio-git:"
+
+SRCREV = "f621a52f779381cfe550b4278b83e701a747944c"
 
 # Make it easy to test against developer repos and branches
 GIT_REPO = "gnuradio.git"
-GIT_BRANCH = "next"
+GIT_BRANCH = "master"
 
 SRC_URI = "git://gnuradio.org/git/${GIT_REPO};branch=${GIT_BRANCH};protocol=http \
-           file://0001-volk-Remove-all-traces-of-volk-from-configure-for-OE.patch \
-           file://0001-buildsys-don-t-add-usr-include-and-usr-lib-to-config.patch \
-          "
+"
 
 S="${WORKDIR}/git"
 
+OECMAKE_BUILDPATH = "${S}/build"
+OECMAKE_SOURCEPATH = "${S}"
+
+EXTRA_OECMAKE = "-DENABLE_GR_ATSC=FALSE -DENABLE_GR_QTGUI=ON -DENABLE_GR_WXGUI=OFF -DENABLE_GR_VIDEO_SDL=OFF -DQT_HEADERS_DIR=${STAGING_INCDIR}/qt4 -DQT_QTCORE_INCLUDE_DIR=${STAGING_INCDIR}/qt4/QtCore -DQT_LIBRARY_DIR=${STAGING_LIBDIR} -DQT_QTCORE_LIBRARY_RELEASE=${STAGING_LIBDIR}/libQtCore.so -DQT_QTGUI_LIBRARY_RELEASE=${STAGING_LIBDIR}/libQtGui.so -DENABLE_GR_FCD=OFF -DIMPORT_EXECUTABLES=${S}/gr-vocoder/lib/generate_codebook.txt"
+
+EXTRA_OEMAKE = "-C ${OECMAKE_BUILDPATH}"
+
-- 
1.7.7.6



