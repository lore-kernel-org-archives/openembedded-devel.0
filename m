Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE98F783EC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 09:51:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8D9p5Ba022536
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 02:51:05 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 13 Sep 2017 02:51:04 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Sep 2017 17:38:21 +0800
Message-ID: <20170913093821.12746-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libpng12: add it back from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2017 09:51:05 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

libpng12 is removed from oe-core. But lsb test 5.0 still requires
libpng12. So add it back.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb

diff --git a/meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb b/meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb
new file mode 100644
index 000000000..9f74f5fdb
--- /dev/null
+++ b/meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb
@@ -0,0 +1,36 @@
+SUMMARY = "PNG image format decoding library"
+HOMEPAGE = "http://www.libpng.org/"
+SECTION = "libs"
+LICENSE = "Libpng"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=597b8a91994a3e27ae6aa79bf02677d9 \
+                    file://png.h;beginline=19;endline=109;md5=166406397718925b660f0033f7558ef7"
+DEPENDS = "zlib"
+
+PN = "libpng12"
+S = "${WORKDIR}/libpng-${PV}"
+
+SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "307052e5e8af97b82b17b64fb1b3677a"
+SRC_URI[sha256sum] = "0f4620e11fa283fedafb474427c8e96bf149511a1804bdc47350963ae5cf54d8"
+
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libpng/files/libpng12/"
+UPSTREAM_CHECK_REGEX = "/libpng12/(?P<pver>(\d+[\.\-_]*)+)/"
+
+BINCONFIG_GLOB = "${PN}-config"
+
+inherit autotools binconfig pkgconfig
+
+do_install_append() {
+	# The follow link files link to corresponding png12*.h and libpng12* files
+	# They conflict with higher verison, so drop them
+	rm ${D}/${includedir}/png.h
+	rm ${D}/${includedir}/pngconf.h
+
+	rm ${D}/${libdir}/libpng.la
+	rm ${D}/${libdir}/libpng.so
+	rm ${D}/${libdir}/libpng.a || true
+	rm ${D}/${libdir}/pkgconfig/libpng.pc
+
+	rm ${D}/${bindir}/libpng-config
+}
-- 
2.14.1


