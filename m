Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SQOLJ-0006Qx-U4
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 May 2012 21:39:05 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 May 2012 21:29:13 +0200
Message-Id: <1336159753-10759-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] xfsprogs: misc fixes for recipe
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
X-List-Received-Date: Fri, 04 May 2012 19:39:06 -0000

* Only libhandle's license is the LGPLv2.1, all tools are
  licensed under the GPLv2.
* Create seperate package for libhandle.
* Create seperate packages for mkfs.xfs and fsck.xfs
  to save space.
* Use real license file for LIC_FILES_CHKSUM.
* Fix libhandle.so symlink.
* Remove unneeded symlinks from ${base_libdir}

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb |   31 ++++++++++----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
index 3830887..3bc4897 100644
--- a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
+++ b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "XFS Filesystem Utilities"
 HOMEPAGE = "http://oss.sgi.com/projects/xfs"
 SECTION = "base"
-LICENSE = "LGPL2.1"
-
-LIC_FILES_CHKSUM = "file://Makefile;endline=3;md5=def2844770bb44eba37bc9ca8610fad4"
-
+LICENSE = "GPLv2"
+LICENSE_libhandle = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
 DEPENDS = "util-linux"
+PR = "r1"
 
 SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz \
 	file://remove-install-as-user.patch \
@@ -15,8 +15,13 @@ SRC_URI[sha256sum] = "e150914210ac5fd29c098ef0fd94bdec51d2fb231cf9faa765c16ec6d7
 
 inherit autotools
 
-FILES_${PN}-dev += "${base_libdir}/libhandle.la \
-                    ${base_libdir}/libhandle.so"
+PACKAGES =+ "${PN}-fsck ${PN}-mkfs libhandle"
+
+RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs"
+
+FILES_${PN}-fsck = "${base_sbindir}/fsck.xfs"
+FILES_${PN}-mkfs = "${base_sbindir}/mkfs.xfs"
+FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
 
 EXTRA_OECONF = "--enable-gettext=no"
 do_configure () {
@@ -34,13 +39,9 @@ do_install () {
 	oe_runmake install
 	# needed for xfsdump
 	oe_runmake install-dev
-	# replace extra links to /usr/lib with relative links (otherwise autotools_prepackage_lamangler fails to read nonexistent link)
-	rm -f ${D}/${base_libdir}/libhandle.la
-	rm -f ${D}/${base_libdir}/libhandle.a
-	ln -s ../usr/lib/libhandle.la ${D}/${base_libdir}/libhandle.la
-	ln -s ../usr/lib/libhandle.a ${D}/${base_libdir}/libhandle.a
-
-	# and link from /usr/lib/libhandle.so to /lib/libhandle.so
-	rm -f ${D}/${libdir}/libhandle.so
-	ln -s ../../lib/libhandle.a ${D}/${libdir}/libhandle.so
+	rm ${D}${base_libdir}/libhandle.a
+	rm ${D}${base_libdir}/libhandle.la
+	rm ${D}${base_libdir}/libhandle.so
+	rm ${D}${libdir}/libhandle.so
+	ln -s ../..${base_libdir}/libhandle.so.1 ${D}${libdir}/libhandle.so
 }
-- 
1.7.9.5



