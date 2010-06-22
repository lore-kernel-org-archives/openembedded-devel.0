Received: from infosrv.imms.de ([194.95.250.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thomas.elste@imms.de>) id 1OR1YK-0007Yy-1g
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 13:22:19 +0200
Received: from infosrv.imms.de (infosrv.imms.de [127.0.0.1])
	by IMSA (Postfix) with ESMTP id D5CFE260051
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 13:00:05 +0200 (CEST)
Received: from proxy.imms.de (proxy.imms.de [194.95.250.53])
	by infosrv.imms.de (Postfix) with ESMTP id DC34126004A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 13:00:04 +0200 (CEST)
Received: from pluto.imms.de ([172.16.10.24])
	by proxy.imms.de (8.13.8+Sun/8.13.8) with ESMTP id o5MB0CbE004363;
	Tue, 22 Jun 2010 13:00:12 +0200 (CEST)
From: Thomas Elste <thomas.elste@imms.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jun 2010 12:59:56 +0200
Message-Id: <1277204396-12287-1-git-send-email-thomas.elste@imms.de>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 194.95.250.51
X-SA-Exim-Mail-From: thomas.elste@imms.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
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
X-List-Received-Date: Tue, 22 Jun 2010 11:22:42 -0000

Add recipe for current version of Qwt. This new version uses qt4-classes
instead of palmtop. Different bb-files for Qt and Qt-Embedded
variant are provided. Qwt examples are also build. They get deployed in
extra packages.

Signed-off-by: Thomas Elste <thomas.elste@imms.de>
---
 recipes/qwt/qwt-e_5.2.1.bb |    8 ++++++++
 recipes/qwt/qwt.inc        |   33 +++++++++++++++++++++++++++++++++
 recipes/qwt/qwt_5.2.1.bb   |    8 ++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 recipes/qwt/qwt-e_5.2.1.bb
 create mode 100644 recipes/qwt/qwt.inc
 create mode 100644 recipes/qwt/qwt_5.2.1.bb

diff --git a/recipes/qwt/qwt-e_5.2.1.bb b/recipes/qwt/qwt-e_5.2.1.bb
new file mode 100644
index 0000000..09b31ed
--- /dev/null
+++ b/recipes/qwt/qwt-e_5.2.1.bb
@@ -0,0 +1,8 @@
+QWT_VARIANT = "e"
+require qwt.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI[md5sum] = "4a595b8db0ec3856b117836c1d60cb27"
+SRC_URI[sha256sum] = "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fbe88524eb698e11ac569f"
+
diff --git a/recipes/qwt/qwt.inc b/recipes/qwt/qwt.inc
new file mode 100644
index 0000000..6a9f9e0
--- /dev/null
+++ b/recipes/qwt/qwt.inc
@@ -0,0 +1,33 @@
+DESCRIPTION = "Qt Widget Extension for Technical Applications"
+HOMEPAGE = "http://qwt.sourceforge.net/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "GPL"
+INC_PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2"
+
+inherit qt4${QWT_VARIANT}
+
+EXTRA_OEMAKE = "${PARALLEL_MAKE}"
+
+do_configure_prepend() {
+        # set install path and doc path, enable examples
+        sed -i \
+                -e 's/\(INSTALLBASE *= \)\/usr.*/\1\/usr/' \
+                -e 's/\(doc.path.*\/\).*/\1share\/doc\/qwt-${PV}/' \
+                -e 's/#CONFIG     += QwtExamples/CONFIG += QwtExamples/' \
+                qwtconfig.pri
+}
+
+do_install() {
+        oe_runmake install INSTALL_ROOT=${D}
+        install -d ${D}${bindir}/qwt-examples
+        install examples/bin/* ${D}${bindir}/qwt-examples
+}
+
+PACKAGES =+ "${PN}-examples ${PN}-examples-dbg"
+FILES_${PN} = "${libdir}/*"
+FILES_${PN}-examples = "${bindir}/qwt-examples/*"
+FILES_${PN}-examples-dbg = "${bindir}/qwt-examples"
+
diff --git a/recipes/qwt/qwt_5.2.1.bb b/recipes/qwt/qwt_5.2.1.bb
new file mode 100644
index 0000000..a1142f0
--- /dev/null
+++ b/recipes/qwt/qwt_5.2.1.bb
@@ -0,0 +1,8 @@
+QWT_VARIANT = "x11"
+require qwt.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI[md5sum] = "4a595b8db0ec3856b117836c1d60cb27"
+SRC_URI[sha256sum] = "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fbe88524eb698e11ac569f"
+
-- 
1.7.1



