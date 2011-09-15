Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@eukrea.com>) id 1R48Y4-0004qm-34
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 11:48:01 +0200
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 49CA9CA8FEE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2011 11:42:43 +0200 (CEST)
Received: from PCDEV1.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id DB7C34B0114;
	Thu, 15 Sep 2011 11:42:38 +0200 (CEST)
From: Denis Carikli <denis@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 11:42:36 +0200
Message-Id: <1316079756-3038-1-git-send-email-denis@eukrea.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] qwt: import from openembedded.dev
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
X-List-Received-Date: Thu, 15 Sep 2011 09:48:01 -0000

The only change between openembedded.dev and meta-openembedded was
  the addition of LIC_FILES_CHKSUM

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb |    8 ++++++++
 meta-oe/recipes-qt/qwt/qwt.inc        |   33 +++++++++++++++++++++++++++++++++
 meta-oe/recipes-qt/qwt/qwt_5.2.1.bb   |    8 ++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb
 create mode 100644 meta-oe/recipes-qt/qwt/qwt.inc
 create mode 100644 meta-oe/recipes-qt/qwt/qwt_5.2.1.bb

diff --git a/meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb b/meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb
new file mode 100644
index 0000000..2f55061
--- /dev/null
+++ b/meta-oe/recipes-qt/qwt/qwt-e_5.2.1.bb
@@ -0,0 +1,8 @@
+inherit qt4e
+
+require qwt.inc
+
+SRC_URI[qwt.md5sum] = "4a595b8db0ec3856b117836c1d60cb27"
+SRC_URI[qwt.sha256sum] = "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fbe88524eb698e11ac569f"
+
+RPROVIDES_${PN}-dev = "libqwt-dev"
\ No newline at end of file
diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.inc
new file mode 100644
index 0000000..da1ed11
--- /dev/null
+++ b/meta-oe/recipes-qt/qwt/qwt.inc
@@ -0,0 +1,33 @@
+DESCRIPTION = "Qt Widget Extension for Technical Applications"
+SECTION = "libs"
+PRIORITY = "optional"
+
+# LGPLv2.1 + some exceptions
+LICENSE = "QWTv1.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dac2743472b0462ff3cfb4af42051c88"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt"
+
+S = "${WORKDIR}/qwt-${PV}"
+
+do_configure_prepend() {
+	sed -i -e 's:RELEASE_SUFFIX      = :RELEASE_SUFFIX      = ${QT_LIBINFIX}:' *.pri
+	sed -i -e s:lqwt:lqwt${QT_LIBINFIX}:g -e s:/usr/local/qwt-$\${QwtVersion}:${prefix}:g *.prf
+	sed -e 's/#CONFIG     += QwtExamples/CONFIG     += QwtExamples/g' -i qwtconfig.pri
+	sed -i -e s:/usr/local/qwt-${PV}:${D}${prefix}:g ${S}/*.pri
+}
+
+do_install() {
+	oe_runmake -e install
+	install -d ${D}${datadir}/doc/${PN}
+	mv ${D}${prefix}/doc/* ${D}${datadir}/doc/${PN}/
+	cd ${S}/examples
+	install -d ${D}/${bindir}
+	cd bin${QT_LIBINFIX}/
+	for i in * ; do
+		cp -pPR ${i} ${D}/${bindir}/${i}${QT_LIBINFIX}
+	done
+}
+
+PACKAGES_prepend = "${PN}-examples "
+FILES_${PN}-examples = "${bindir}/*"
diff --git a/meta-oe/recipes-qt/qwt/qwt_5.2.1.bb b/meta-oe/recipes-qt/qwt/qwt_5.2.1.bb
new file mode 100644
index 0000000..238a4fb
--- /dev/null
+++ b/meta-oe/recipes-qt/qwt/qwt_5.2.1.bb
@@ -0,0 +1,8 @@
+inherit qt4x11
+
+require qwt.inc
+
+SRC_URI[qwt.md5sum] = "4a595b8db0ec3856b117836c1d60cb27"
+SRC_URI[qwt.sha256sum] = "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fbe88524eb698e11ac569f"
+
+RPROVIDES_${PN}-dev = "libqwt-dev"
\ No newline at end of file
-- 
1.7.4.1



