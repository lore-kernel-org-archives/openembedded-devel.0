Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LkHs3-0000Cd-Al
	for openembedded-devel@openembedded.org; Thu, 19 Mar 2009 14:01:29 +0100
Received: (qmail 18188 invoked by uid 813007); 19 Mar 2009 13:00:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Mar 2009 13:00:18 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Mar 2009 14:00:15 +0100
Message-Id: <1237467616-4745-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <1237467616-4745-2-git-send-email-marcin@juszkiewicz.com.pl>
References: <1237467616-4745-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1237467616-4745-2-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=AWL, BAYES_50, NO_DNS_FOR_FROM,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] mtd-utils: unify recipes, move mkfs.ubifs into separate package
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
X-List-Received-Date: Thu, 19 Mar 2009 13:01:33 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

mtd-utils package do not depend on libraries other then libc and libgcc
now (ubifs depends on lzo and e2fsprogs)
---
 recipes/mtd/mtd-utils.inc          |   83 +++++++++++++++++++++++++++++++++
 recipes/mtd/mtd-utils_1.1.0.bb     |   48 ++-----------------
 recipes/mtd/mtd-utils_1.2.0+git.bb |   89 +++---------------------------------
 3 files changed, 95 insertions(+), 125 deletions(-)
 create mode 100644 recipes/mtd/mtd-utils.inc

diff --git a/recipes/mtd/mtd-utils.inc b/recipes/mtd/mtd-utils.inc
new file mode 100644
index 0000000..dcf0e7c
--- /dev/null
+++ b/recipes/mtd/mtd-utils.inc
@@ -0,0 +1,83 @@
+DESCRIPTION = "Tools for managing memory technology devices."
+SECTION = "base"
+DEPENDS = "zlib lzo"
+HOMEPAGE = "http://www.linux-mtd.infradead.org/"
+LICENSE = "GPLv2"
+PR = "r0"
+
+SRC_URI = "ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-${PV}.tar.bz2"
+
+S = "${WORKDIR}/mtd-utils-${PV}"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR'"
+
+do_stage () {
+	install -d ${STAGING_INCDIR}/mtd
+	for f in ${S}/include/mtd/*.h; do
+		install -m 0644 $f ${STAGING_INCDIR}/mtd/
+	done
+	for binary in ${mtd_utils}; do
+		install -m 0755 $binary ${STAGING_BINDIR}
+	done
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -d ${D}${includedir}/mtd
+	for binary in ${mtd_utils}; do
+		install -m 0755 $binary ${D}${bindir}
+	done
+	for f in ${S}/include/mtd/*.h; do
+		install -m 0644 $f ${D}${includedir}/mtd
+	done
+}
+
+mtd_utils = " docfdisk \
+	doc_loadbios \
+	flashcp \
+	flash_erase \
+	flash_eraseall \
+	flash_info \
+	flash_lock \
+	flash_otp_dump \
+	flash_otp_info \
+	flash_unlock \
+	ftl_check \
+	ftl_format \
+	jffs2dump \
+	mkfs.jffs2 \
+	mtd_debug \
+	nanddump \
+	nandtest \
+	nandwrite \
+	nftldump \
+	nftl_format \
+	recv_image \
+	rfddump \
+	rfdformat \
+	serve_image \
+	sumtool \
+	mkfs.ubifs/mkfs.ubifs \
+	ubi-utils/bin2nand \
+	ubi-utils/mkbootenv \
+	ubi-utils/nand2bin \
+	ubi-utils/pddcustomize \
+	ubi-utils/pfi2bin \
+	ubi-utils/pfiflash \
+	ubi-utils/ubigen \
+	ubi-utils/ubimirror \
+	ubi-utils/unubi \
+	ubi-utils/new-utils/ubiattach \
+	ubi-utils/new-utils/ubicrc32 \
+	ubi-utils/new-utils/ubidetach \
+	ubi-utils/new-utils/ubiformat \
+	ubi-utils/new-utils/ubimkvol \
+	ubi-utils/new-utils/ubinfo \
+	ubi-utils/new-utils/ubinize \
+	ubi-utils/new-utils/ubirmvol \
+	ubi-utils/new-utils/ubiupdatevol"
+
+PACKAGES =+ "mkfs-jffs mkfs-jffs2 mkfs-ubifs"
+FILES_mkfs-jffs = "${bindir}/mkfs.jffs"
+FILES_mkfs-jffs2 = "${bindir}/mkfs.jffs2"
+FILES_mkfs-ubifs = "${bindir}/mkfs.ubifs"
diff --git a/recipes/mtd/mtd-utils_1.1.0.bb b/recipes/mtd/mtd-utils_1.1.0.bb
index e585cf5..e226391 100644
--- a/recipes/mtd/mtd-utils_1.1.0.bb
+++ b/recipes/mtd/mtd-utils_1.1.0.bb
@@ -1,45 +1,7 @@
-DESCRIPTION = "Tools for managing memory technology devices."
-SECTION = "base"
-DEPENDS = "zlib lzo"
-HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-LICENSE = "GPLv2"
-PR = "r3"
+require mtd-utils.inc
 
-SRC_URI = "ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-${PV}.tar.bz2 \
-           file://add-exclusion-to-mkfs-jffs2-git.patch;patch=1 \
-	   file://fix-ignoreerrors-git.patch;patch=1 \
-	   file://lzo_1x.patch;patch=1"
-
-S = "${WORKDIR}/mtd-utils-${PV}/"
-
-EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR'"
-
-do_stage () {
-	install -d ${STAGING_INCDIR}/mtd
-	for f in ${S}/include/mtd/*.h; do
-		install -m 0644 $f ${STAGING_INCDIR}/mtd/
-	done
-	for binary in ${mtd_utils}; do
-		install -m 0755 $binary ${STAGING_BINDIR}
-	done
-}
-
-mtd_utils = "ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
-             mkfs.jffs ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info mtd_debug \
-             flashcp nandwrite jffs2dump sumtool"
-
-do_install () {
-	install -d ${D}${bindir}
-	install -d ${D}${includedir}/mtd
-	for binary in ${mtd_utils}; do
-		install -m 0755 $binary ${D}${bindir}
-	done
-	for f in ${S}/include/mtd/*.h; do
-		install -m 0644 $f ${D}${includedir}/mtd
-	done
-}
-
-PACKAGES =+ "mkfs-jffs mkfs-jffs2"
-FILES_mkfs-jffs = "${bindir}/mkfs.jffs"
-FILES_mkfs-jffs2 = "${bindir}/mkfs.jffs2"
+PR = "r4"
 
+SRC_URI += "file://add-exclusion-to-mkfs-jffs2-git.patch;patch=1 \
+	    file://fix-ignoreerrors-git.patch;patch=1 \
+	    file://lzo_1x.patch;patch=1"
diff --git a/recipes/mtd/mtd-utils_1.2.0+git.bb b/recipes/mtd/mtd-utils_1.2.0+git.bb
index 04b8b29..06cbf1b 100644
--- a/recipes/mtd/mtd-utils_1.2.0+git.bb
+++ b/recipes/mtd/mtd-utils_1.2.0+git.bb
@@ -1,9 +1,7 @@
-DESCRIPTION = "Tools for managing memory technology devices."
-SECTION = "base"
-DEPENDS = "e2fsprogs-libs zlib lzo"
-HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-LICENSE = "GPLv2"
-PR = "r3"
+require mtd-utils.inc
+
+DEPENDS += "e2fsprogs-libs"
+PR = "r4"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -19,84 +17,11 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=${TAG} \
 
 S = "${WORKDIR}/git/"
 
-EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR'"
-
 do_configure_prepend() {
 	for i in $(find . -name "Makefile") ; do
 		sed -i -e s:lzo2:lzo:g $i
 	done
-	sed -i -e s:lzo/::g mkfs.ubifs/compr.c
-}
-
-do_stage () {
-	install -d ${STAGING_INCDIR}/mtd
-	for f in ${S}/include/mtd/*.h; do
-		install -m 0644 $f ${STAGING_INCDIR}/mtd/
-	done
-	for binary in ${mtd_utils}; do
-		install -m 0755 $binary ${STAGING_BINDIR}
-	done
+	if [ -e mkfs.ubifs/compr.c ]; then
+		sed -i -e s:lzo/::g mkfs.ubifs/compr.c
+	fi
 }
-
-mtd_utils = " docfdisk \
-	doc_loadbios \
-	flashcp \
-	flash_erase \
-	flash_eraseall \
-	flash_info \
-	flash_lock \
-	flash_otp_dump \
-	flash_otp_info \
-	flash_unlock \
-	ftl_check \
-	ftl_format \
-	jffs2dump \
-	mkfs.jffs2 \
-	mtd_debug \
-	nanddump \
-	nandtest \
-	nandwrite \
-	nftldump \
-	nftl_format \
-	recv_image \
-	rfddump \
-	rfdformat \
-	serve_image \
-	sumtool \
-	mkfs.ubifs/mkfs.ubifs \
-	ubi-utils/bin2nand \
-	ubi-utils/mkbootenv \
-	ubi-utils/nand2bin \
-	ubi-utils/pddcustomize \
-	ubi-utils/pfi2bin \
-	ubi-utils/pfiflash \
-	ubi-utils/ubigen \
-	ubi-utils/ubimirror \
-	ubi-utils/unubi \
-	ubi-utils/new-utils/ubiattach \
-	ubi-utils/new-utils/ubicrc32 \
-	ubi-utils/new-utils/ubidetach \
-	ubi-utils/new-utils/ubiformat \
-	ubi-utils/new-utils/ubimkvol \
-	ubi-utils/new-utils/ubinfo \
-	ubi-utils/new-utils/ubinize \
-	ubi-utils/new-utils/ubirmvol \
-	ubi-utils/new-utils/ubiupdatevol"
-
-
-
-do_install () {
-	install -d ${D}${bindir}
-	install -d ${D}${includedir}/mtd
-	for binary in ${mtd_utils}; do
-		install -m 0755 $binary ${D}${bindir}
-	done
-	for f in ${S}/include/mtd/*.h; do
-		install -m 0644 $f ${D}${includedir}/mtd
-	done
-}
-
-PACKAGES =+ "mkfs-jffs mkfs-jffs2"
-FILES_mkfs-jffs = "${bindir}/mkfs.jffs"
-FILES_mkfs-jffs2 = "${bindir}/mkfs.jffs2"
-
-- 
1.6.2.1





