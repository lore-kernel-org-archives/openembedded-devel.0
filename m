Received: from smtp204.alice.it ([82.57.200.100])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1RFWhG-0002dW-Fu
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Oct 2011 21:48:34 +0200
Received: from trisquel.workgroup (79.17.209.133) by smtp204.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4E8C216D003372F2; Sun, 16 Oct 2011 21:37:33 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Oct 2011 21:37:26 +0200
Message-Id: <1318793846-21368-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1313666756.4016.76.camel@mattotaupa>
References: <1313666756.4016.76.camel@mattotaupa>
Subject: [PATCH v2] lightmediascanner: Add version 0.4.3.0 (initial recipe)
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
X-List-Received-Date: Sun, 16 Oct 2011 19:48:34 -0000

From: pespin <pespin.shar@gmail.com>

* Recipe based on recipe v0.4.1.0 from oe.dev (http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/lightmediascanner/lightmediascanner_0.4.1.0.bb?id=99ed67320060c4b9f686328a22f68980c2154c62)

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 .../lightmediascanner/lightmediascanner_0.4.3.0.bb |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.3.0.bb

diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.3.0.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.3.0.bb
new file mode 100644
index 0000000..6736a97
--- /dev/null
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.3.0.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Lightweight media scanner meant to be used in not-so-powerful devices"
+AUTHOR = "ProFUSION"
+HOMEPAGE = "http://lms.garage.maemo.org/"
+SECTION = "libs/multimedia"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+DEPENDS = "sqlite3 flac"
+
+PR = "r0"
+
+SRC_URI = "https://garage.maemo.org/frs/download.php/9439/lightmediascanner-${PV}.tar.bz2"
+
+inherit autotools pkgconfig gettext
+
+do_install_append() {
+    install -d ${D}/${bindir}/
+    install -m 755 ${WORKDIR}/${PN}-${PV}/src/bin/.libs/test  ${D}/${bindir}/test-lms
+}
+
+PACKAGES =+ "${PN}-test"
+
+FILES_${PN}-test = "${bindir}/test-lms"
+
+FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
+
+SRC_URI[md5sum] = "188ff5188cfa0f2504a42934c969cb77"
+SRC_URI[sha256sum] = "bdbe76655ad212b936fb3cf6a9ca725e318ddeb57cd7d950d9c8409297d3b0da"
+
-- 
1.7.4.1



