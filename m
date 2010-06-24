Received: from infosrv.imms.de ([194.95.250.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thomas.elste@imms.de>) id 1ORiTc-0003dB-E9
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 11:12:22 +0200
Received: from infosrv.imms.de (infosrv.imms.de [127.0.0.1])
	by IMSA (Postfix) with ESMTP id 563EB260056
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 11:07:27 +0200 (CEST)
Received: from proxy.imms.de (proxy.imms.de [194.95.250.53])
	by infosrv.imms.de (Postfix) with ESMTP id 2D73B260051
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 11:07:27 +0200 (CEST)
Received: from pluto.imms.de ([172.16.10.24])
	by proxy.imms.de (8.13.8+Sun/8.13.8) with ESMTP id o5O97ZAc013351;
	Thu, 24 Jun 2010 11:07:37 +0200 (CEST)
From: Thomas Elste <thomas.elste@imms.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jun 2010 11:06:14 +0200
Message-Id: <1277370374-4677-2-git-send-email-thomas.elste@imms.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1277370374-4677-1-git-send-email-thomas.elste@imms.de>
References: <1277370374-4677-1-git-send-email-thomas.elste@imms.de>
X-SA-Exim-Connect-IP: 194.95.250.51
X-SA-Exim-Mail-From: thomas.elste@imms.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] qwt: Add version 5.2.1
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
X-List-Received-Date: Thu, 24 Jun 2010 09:13:02 -0000

Add recipe for current version of Qwt. This new version uses qt4-classes
instead of palmtop. Different bb-files for Qt and Qt-Embedded
variant are provided. Qwt examples are also build. They get deployed in
extra packages.

Signed-off-by: Thomas Elste <thomas.elste@imms.de>
---
 recipes/qwt/qwt-e_5.2.1.bb |   10 ++++++++++
 recipes/qwt/qwt.inc        |   35 +++++++++++++++++++++++++++++++++++
 recipes/qwt/qwt_5.2.1.bb   |   10 ++++++++++
 3 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100644 recipes/qwt/qwt-e_5.2.1.bb
 create mode 100644 recipes/qwt/qwt.inc
 create mode 100644 recipes/qwt/qwt_5.2.1.bb

diff --git a/recipes/qwt/qwt-e_5.2.1.bb b/recipes/qwt/qwt-e_5.2.1.bb
new file mode 100644
index 0000000..95bb31f
--- /dev/null
+++ b/recipes/qwt/qwt-e_5.2.1.bb
@@ -0,0 +1,10 @@
+QWT_VARIANT = "E"
+inherit qt4e
+require qwt.inc
+RDEPENDS_${PN}-examples += "qt4-embedded-fonts"
+
+PR = "${INC_PR}.1"
+
+SRC_URI[md5sum] = "4a595b8db0ec3856b117836c1d60cb27"
+SRC_URI[sha256sum] = "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fbe88524eb698e11ac569f"
+
diff --git a/recipes/qwt/qwt.inc b/recipes/qwt/qwt.inc
new file mode 100644
index 0000000..09ceb56
--- /dev/null
+++ b/recipes/qwt/qwt.inc
@@ -0,0 +1,35 @@
+DESCRIPTION = "Qt Widget Extension for Technical Applications"
+HOMEPAGE = "http://qwt.sourceforge.net/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "GPL"
+INC_PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2"
+
+S = "${WORKDIR}/qwt-${PV}"
+
+EXTRA_OEMAKE = "${PARALLEL_MAKE}"
+
+do_configure_prepend() {
+        # set install and doc path, set lib suffix, enable examples
+        sed -i \
+                -e 's/\(INSTALLBASE *= \)\/usr.*/\1\/usr/' \
+                -e 's/\(doc.path.*\/\).*/\1share\/doc\/qwt-${PV}/' \
+                -e 's/\(RELEASE_SUFFIX *=\).*/\1 ${QWT_VARIANT}/' \
+                -e 's/#CONFIG     += QwtExamples/CONFIG += QwtExamples/' \
+                qwtconfig.pri
+}
+
+do_install() {
+        oe_runmake install INSTALL_ROOT=${D}
+        rm ${D}${libdir}/libqwt${QWT_VARIANT}.so
+        install -d ${D}${bindir}/qwt${QWT_VARIANT}-examples
+        install examples/bin${QWT_VARIANT}/* ${D}${bindir}/qwt${QWT_VARIANT}-examples
+}
+
+PACKAGES =+ "${PN}-examples ${PN}-examples-dbg"
+FILES_${PN} = "${libdir}/*"
+FILES_${PN}-examples = "${bindir}/qwt${QWT_VARIANT}-examples/*"
+FILES_${PN}-examples-dbg = "${bindir}/qwt${QWT_VARIANT}-examples"
+
diff --git a/recipes/qwt/qwt_5.2.1.bb b/recipes/qwt/qwt_5.2.1.bb
new file mode 100644
index 0000000..4f59d16
--- /dev/null
+++ b/recipes/qwt/qwt_5.2.1.bb
@@ -0,0 +1,10 @@
+QWT_VARIANT = 
+inherit qt4x11
+require qwt.inc
+RDEPENDS_${PN}-examples += "qt4-fonts"
+
+PR = "${INC_PR}.1"
+
+SRC_URI[md5sum] = "4a595b8db0ec3856b117836c1d60cb27"
+SRC_URI[sha256sum] = "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fbe88524eb698e11ac569f"
+
-- 
1.7.1



