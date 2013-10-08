Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6816ADA2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 08:47:38 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 4DDBCA6308
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 10:47:37 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 10:47:26 +0200
Message-Id: <1381222066-2737-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH v2 01/21] cinematicexperience: add example
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
X-List-Received-Date: Tue, 08 Oct 2013 08:47:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

for more informations on this demo :
http://kgronholm.blogspot.fr/2012/08/qt5-cinematic-experience.html
http://quitcoding.com/?page=work#cinex

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/examples/cinematicexperience_1.0.bb | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 recipes-qt/examples/cinematicexperience_1.0.bb

diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/examples/cinematicexperience_1.0.bb
new file mode 100644
index 0000000..3fa6f06
--- /dev/null
+++ b/recipes-qt/examples/cinematicexperience_1.0.bb
@@ -0,0 +1,40 @@
+SUMMARY = "Qt5 technology demo"
+DESCRIPTION = "Cinematic Experience collects many of the new Qt5 QtQuick 2.0 features into the same UX demo application. It uses particles, sprites, path animation, custom shaders etc. features which Qt5 introduces for QML UIs."
+HOMEPAGE = "http://quitcoding.com/?page=work#cinex"
+LICENSE = "CC-BY-3.0"
+LIC_FILES_CHKSUM = "file://README;beginline=38;endline=50;md5=51babd597624b70752069953876aaa18"
+
+SRC_URI = "http://quitcoding.com/download/Qt5_CinematicExperience_rpi_1.0.tgz"
+
+SRC_URI[md5sum] = "935a5db0a6b2a72c67236e72f52be7d1"
+SRC_URI[sha256sum] = "0dd602983ced5f7c0cfd5ad0fbfe2b0b7e3c9ff715e4ef23eef818ccc2b6c60b"
+
+S = "${WORKDIR}/Qt5_CinematicExperience_rpi_${PV}/"
+
+# other version available for small screens
+#SRC_URI = "http://quitcoding.com/download/Qt5_CinematicExperience_1.0.tgz"
+#SRC_URI[md5sum] = "1c4f9bf5411c985fc5d3dbfc5d826a29"
+#SRC_URI[sha256sum] = "0e547e0259667915a24e84ade5efdcd0c553f81786734452c2c8dbce19a19f44"
+#S = "${WORKDIR}/Qt5_CinematicExperience_${PV}/"
+
+DEPENDS = "qtdeclarative qtgraphicaleffects"
+RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins"
+
+require recipes-qt/qt5/qt5.inc
+
+do_install() {
+    install -d ${D}${datadir}/${P}
+    install -m 0755 ${B}/Qt5_CinematicExperience ${D}${datadir}/${P}
+    cp -a ${S}/content ${D}${datadir}/${P}
+    install -m 0644 ${S}/Qt5_CinematicExperience.qml ${D}${datadir}/${P}
+
+    install -d ${D}${bindir}
+    echo "#!/bin/sh" > ${D}${bindir}/Qt5_CinematicExperience
+    echo "export QML_IMPORT_PATH=${datadir}/${P}" >> ${D}${bindir}/Qt5_CinematicExperience
+    echo "export QML2_IMPORT_PATH=${datadir}/${P}" >> ${D}${bindir}/Qt5_CinematicExperience
+    echo "${datadir}/${P}/Qt5_CinematicExperiencea \$* " >> ${D}${bindir}/Qt5_CinematicExperience
+    chmod +x ${D}${bindir}/Qt5_CinematicExperience
+}
+
+FILES_${PN}-dbg += "${datadir}/${P}/.debug"
+FILES_${PN} += "${datadir}"
-- 
1.8.4.rc3


