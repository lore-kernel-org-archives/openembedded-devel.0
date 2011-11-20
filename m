Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RSEO1-0007nm-6G
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Nov 2011 21:53:14 +0100
Received: (qmail invoked by alias); 20 Nov 2011 20:46:44 -0000
Received: from p5B0A3816.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.56.22]
	by mail.gmx.net (mp068) with SMTP; 20 Nov 2011 21:46:44 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+Y0612o0+Yp3zzWNPsa/HXr2ZR1h3phFLCpjOJuv
	TjMKWQ3QHAjZIw
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Nov 2011 21:46:40 +0100
Message-Id: <1321822001-3647-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1321822001-3647-1-git-send-email-schnitzeltony@gmx.de>
References: <1321822001-3647-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe 2/3] libnl: add 3.23
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
X-List-Received-Date: Sun, 20 Nov 2011 20:53:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* fixes networkmanager default route issue
* to make wpa-supplicant build, links to include files and shared libs were
  added since wpa-supplicant expects old libnl-2 locations. Should libnl-3
  move to oe-core, this woraround should be fixed at wpa-supplicant.
* the command line interface (cli) applications were added at libnl-cli packet.
  This seems correct because EXTRA_OECONF += "--disable-cli" creates empty
  package libnl-cli without affecting other packages.
* build tested from scratch & run tested on overo with iw 3.2 /
  wpa-supplicant 0.7.3 / networkmanager 0.9.2.

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-oe/recipes-support/libnl/libnl_3.2.3.bb |   46 ++++++++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/libnl/libnl_3.2.3.bb

diff --git a/meta-oe/recipes-support/libnl/libnl_3.2.3.bb b/meta-oe/recipes-support/libnl/libnl_3.2.3.bb
new file mode 100644
index 0000000..190ea4c
--- /dev/null
+++ b/meta-oe/recipes-support/libnl/libnl_3.2.3.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "libnl is a library for applications dealing with netlink sockets."
+HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
+SECTION = "libs/network"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
+
+DEPENDS = "flex-native bison-native"
+
+SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "dbbb44801e833cf9ca4fdc943f2a58ee"
+SRC_URI[sha256sum] = "69f4a360350ea61f2c988f947c251995c04093c74743eae9eeffba85846ef007"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+    # make wpa-supplicant happy
+    # TODO: when moving to oe-core fix at wpa-supplicant
+    # (e.g src/drivers/drivers.mak)
+    cd ${D}${includedir}
+    ln -sf libnl3/netlink netlink
+    cd ${D}${libdir}
+    ln -sf libnl-3.so.200 libnl.so
+    ln -sf libnl-3.so.200 libnl.so.3
+    ln -sf libnl-genl-3.so.200 libnl-genl.so
+    ln -sf libnl-genl-3.so.200 libnl-genl.so.3
+}
+
+FILES_${PN} = "${libdir}/libnl-3.so.* \
+               ${libdir}/libnl.so.* \
+               ${sysconfdir}"
+FILES_${PN}-dbg += "${libdir}/libnl/cli/*/.debug"
+FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.so \
+                    ${libdir}/libnl/cli/*/*.la"
+FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
+
+PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl"
+FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
+                     ${libdir}/libnl/cli/*/*.so.* \
+                     ${sbindir}/nl-*"
+FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
+FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
+FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
+                     ${libdir}/libnl-genl.so.*"
+
-- 
1.7.4.4



