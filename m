Return-Path: <eric@eukrea.com>
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mail.openembedded.org (Postfix) with ESMTP id 437816007B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 08:12:07 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp4-g21.free.fr (Postfix) with ESMTP id AC98F4C8069
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 10:12:05 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Sep 2013 10:12:15 +0200
Message-Id: <1379923935-28909-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gnokii: add 0.6.31
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
X-List-Received-Date: Mon, 23 Sep 2013 08:12:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- was backported from oe-classic and upgraded to last version
- X11 configuration is not tested

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../recipes-connectivity/gnokii/gnokii_0.6.31.bb   | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb

diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
new file mode 100644
index 0000000..511eaa3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Cellphone tools and driver software"
+SECTION = "console/network"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "http://www.gnokii.org/download/gnokii/gnokii-${PV}.tar.bz2"
+
+DEPENDS = "glib-2.0"
+X11DEPENDS = " libxpm gtk+"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[x11] = "--with-x-toolkit=gtk,--without-x,${X11DEPENDS}"
+
+inherit autotools pkgconfig
+
+PACKAGES += "libgnokii libgnokii-dev"
+
+EXTRA_OECONF = "--without-x --disable-smsd"
+
+FILES_${PN} = "${bindir} ${sbindir}"
+FILES_libgnokii-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
+                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
+	        /lib/*.a /lib/*.o ${datadir}/aclocal"
+FILES_${PN}-dev = ""
+FILES_libgnokii = "${libdir}/libgnokii.so.*"
+
+SRC_URI[md5sum] = "d9627f4a1152d3ea7806df4532850d5f"
+SRC_URI[sha256sum] = "8f5a083b05c1a66a3402ca5cd80084e14c2c0632c991bb53b03c78e9adb02501"
-- 
1.8.4.rc3


