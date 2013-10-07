Return-Path: <eric@eukrea.com>
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mail.openembedded.org (Postfix) with ESMTP id 760E660FCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 23:32:15 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 3CFA49400B7;
	Tue,  8 Oct 2013 01:32:13 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 01:32:02 +0200
Message-Id: <1381188738-29468-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1381188738-29468-1-git-send-email-eric@eukrea.com>
References: <1381188738-29468-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH 02/18] cinematicexperience: add example
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
X-List-Received-Date: Mon, 07 Oct 2013 23:32:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes-qt/examples/cinematicexperience_1.0.bb | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 recipes-qt/examples/cinematicexperience_1.0.bb

diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/examples/cinematicexperience_1.0.bb
new file mode 100644
index 0000000..14ebf58
--- /dev/null
+++ b/recipes-qt/examples/cinematicexperience_1.0.bb
@@ -0,0 +1,37 @@
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


