Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PBwS3-0007Eg-Jg
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 23:25:33 +0200
Received: (qmail 2186 invoked by uid 503); 29 Oct 2010 21:03:50 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 29 Oct 2010 21:03:49 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Oct 2010 23:24:47 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 29 Oct 2010 23:24:46 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Oct 2010 23:25:43 +0200
Message-Id: <1288387543-1277-7-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1288387543-1277-6-git-send-email-eric@eukrea.com>
References: <1288387543-1277-1-git-send-email-eric@eukrea.com>
	<1288387543-1277-2-git-send-email-eric@eukrea.com>
	<1288387543-1277-3-git-send-email-eric@eukrea.com>
	<1288387543-1277-4-git-send-email-eric@eukrea.com>
	<1288387543-1277-5-git-send-email-eric@eukrea.com>
	<1288387543-1277-6-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4295871096254606671
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 7/7] qwt: add qwt 5.2.1
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
X-List-Received-Date: Fri, 29 Oct 2010 21:25:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

this recipe compiles the latest stable version of the
QT Widgets for Technical Applications against qt4-embedded.
A specific package was created for the example applications.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/qwt/qwt_5.2.1.bb |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 recipes/qwt/qwt_5.2.1.bb

diff --git a/recipes/qwt/qwt_5.2.1.bb b/recipes/qwt/qwt_5.2.1.bb
new file mode 100644
index 0000000..aecee9e
--- /dev/null
+++ b/recipes/qwt/qwt_5.2.1.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Qt Widget Extension for Technical Applications"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "QWT+LGPL"
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}/${PV}/${PN}-${PV}.tar.bz2 \
+          "
+
+inherit qt4e
+
+do_configure_prepend() {
+        sed -e 's#/usr/local/qwt-5.2.1#/usr#g' -i qwtconfig.pri
+        sed -e 's/#CONFIG     += QwtExamples/CONFIG     += QwtExamples/g' -i qwtconfig.pri
+}
+do_install() {
+        make install INSTALL_ROOT=${D}
+        cd examples
+        install -d ${D}/${bindir}
+        cp -pPR bin/* ${D}/${bindir}
+        install -d ${D}/${docdir}/${PN}-${PV}
+        mv ${D}/usr/doc/html/* ${D}/${docdir}/${PN}-${PV}
+        install -d ${D}${mandir}/
+        mv ${D}/usr/doc/man/* ${D}${mandir}/
+}
+
+PACKAGES += "${PN}-examples"
+
+FILES_${PN}-examples = "${bindir}/*"
+FILES_${PN} = "${libdir}/*.so.*"
+
+SRC_URI[md5sum] = "4a595b8db0ec3856b117836c1d60cb27"
+SRC_URI[sha256sum] = "e2b8bb755404cb3dc99e61f3e2d7262152193488f5fbe88524eb698e11ac569f"
-- 
1.6.3.3



