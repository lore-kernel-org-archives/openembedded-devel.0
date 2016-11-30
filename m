Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9D871A77
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 11:51:25 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 9811FB81F65; Wed, 30 Nov 2016 12:51:23 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 12:51:22 +0100
Message-Id: <1480506683-17990-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] libcdio-paranoia: new recipe for 10.2+0.93.1
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
X-List-Received-Date: Wed, 30 Nov 2016 11:51:27 -0000

Since libcdio 0.90, libcdio-paranoia is a separate project.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../libcdio/libcdio-paranoia_10.2+0.93+1.bb        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+0.93+1.bb

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+0.93+1.bb b/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+0.93+1.bb
new file mode 100644
index 0000000..82a16cc
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+0.93+1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "library to read digital audio CDs with error correction"
+HOMEPAGE = "http://www.gnu.org/software/libcdio/"
+SECTION = "libs"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "libcdio"
+
+SRC_URI = "${GNU_MIRROR}/libcdio/${BP}.tar.bz2"
+SRC_URI[md5sum] = "0255aa50e660db7f2c39658b9c565814"
+SRC_URI[sha256sum] = "ec1d9b1d5a28cc042f2cb33a7cc0a2b5ce5525f102bc4c15db1fac322559a493"
+
+inherit autotools pkgconfig
+
+PACKAGES += "${PN}-utils"
+
+FILES_${PN} = "${libdir}/${BPN}${SOLIB}"
+FILES_${PN}-utils = "${bindir}/*"
+
+python libcdio_split_packages() {
+    libdir = d.expand('${libdir}')
+    do_split_packages(d, libdir, '^lib(.*)\.so\..*', 'lib%s', 'libcdio %s library', extra_depends='', allow_links=True)
+}
+
+PACKAGESPLITFUNCS =+ "libcdio_split_packages"
-- 
2.7.4


