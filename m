Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7F071A8F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 11:51:26 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id B6F90B80910; Wed, 30 Nov 2016 12:51:23 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 12:51:23 +0100
Message-Id: <1480506683-17990-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480506683-17990-1-git-send-email-obi@opendreambox.org>
References: <1480506683-17990-1-git-send-email-obi@opendreambox.org>
Subject: [meta-oe][PATCH 2/2] libcdio: clean up recipe
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

Fix description, use packageconfig, use packagesplitfuncs.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb
index f21f914..99e6a84 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb
@@ -1,25 +1,28 @@
-ESCRIPTION = "The GNU Compact Disc Input and Control library (libcdio) contains a library for CD-ROM and CD image access."
+SUMMARY = "The GNU Compact Disc Input and Control library (libcdio) contains a library for CD-ROM and CD image access."
 HOMEPAGE = "http://www.gnu.org/software/libcdio/"
 SECTION = "libs"
-
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "ncurses"
-
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "d154476feaac5a7b5f180e83eaf3d689"
 SRC_URI[sha256sum] = "4972cd22fd8d0e8bff922d35c7a645be0db0ab0e7b3dfaecc9cd8272429d6975"
 
 inherit autotools pkgconfig
 
+PACKAGECONFIG ??= "cdda-player"
+PACKAGECONFIG[cdda-player] = "--with-cdda-player,--without-cdda-player,ncurses"
+PACKAGECONFIG[cddb] = "--enable-cddb,--disable-cddb,libcddb"
+PACKAGECONFIG[vcd-info] = "--enable-vcd-info,--disable-vcd-info,vcdimager"
+
 PACKAGES += "${PN}-utils"
 
-FILES_${PN} = "${libdir}/${PN}${SOLIB}"
+FILES_${PN} = "${libdir}/${BPN}${SOLIB}"
 FILES_${PN}-utils = "${bindir}/*"
 
-python populate_packages_prepend () {
-    glibdir = d.expand('${libdir}')
-    do_split_packages(d, glibdir, '^lib(.*)\.so\..*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
+python libcdio_split_packages() {
+    libdir = d.expand('${libdir}')
+    do_split_packages(d, libdir, '^lib(.*)\.so\..*', 'lib%s', 'libcdio %s library', extra_depends='', allow_links=True)
 }
 
+PACKAGESPLITFUNCS =+ "libcdio_split_packages"
-- 
2.7.4


