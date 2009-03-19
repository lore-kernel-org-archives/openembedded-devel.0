Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LkHs3-0000Cb-6q
	for openembedded-devel@openembedded.org; Thu, 19 Mar 2009 14:01:23 +0100
Received: (qmail 18174 invoked by uid 813007); 19 Mar 2009 13:00:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Mar 2009 13:00:17 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Mar 2009 14:00:14 +0100
Message-Id: <1237467616-4745-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <1237467616-4745-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1237467616-4745-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=AWL, BAYES_50, NO_DNS_FOR_FROM,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] mtd: dropped 1.0.0(+git) versions
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
X-List-Received-Date: Thu, 19 Mar 2009 13:01:24 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

---
 recipes/mtd/mtd-utils-native_1.0.0+git.bb |    3 --
 recipes/mtd/mtd-utils-native_1.0.0.bb     |    2 -
 recipes/mtd/mtd-utils_1.0.0+git.bb        |   51 -----------------------------
 recipes/mtd/mtd-utils_1.0.0.bb            |   19 -----------
 4 files changed, 0 insertions(+), 75 deletions(-)
 delete mode 100644 recipes/mtd/mtd-utils-native_1.0.0+git.bb
 delete mode 100644 recipes/mtd/mtd-utils-native_1.0.0.bb
 delete mode 100644 recipes/mtd/mtd-utils_1.0.0+git.bb
 delete mode 100644 recipes/mtd/mtd-utils_1.0.0.bb

diff --git a/recipes/mtd/mtd-utils-native_1.0.0+git.bb b/recipes/mtd/mtd-utils-native_1.0.0+git.bb
deleted file mode 100644
index 6e310cb..0000000
--- a/recipes/mtd/mtd-utils-native_1.0.0+git.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require mtd-utils_${PV}.bb
-require mtd-utils-native.inc
-
diff --git a/recipes/mtd/mtd-utils-native_1.0.0.bb b/recipes/mtd/mtd-utils-native_1.0.0.bb
deleted file mode 100644
index 6f9d71e..0000000
--- a/recipes/mtd/mtd-utils-native_1.0.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require mtd-utils_${PV}.bb
-require mtd-utils-native.inc
diff --git a/recipes/mtd/mtd-utils_1.0.0+git.bb b/recipes/mtd/mtd-utils_1.0.0+git.bb
deleted file mode 100644
index b325bb0..0000000
--- a/recipes/mtd/mtd-utils_1.0.0+git.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-DESCRIPTION = "Tools for managing memory technology devices."
-SECTION = "base"
-DEPENDS = "zlib lzo"
-HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-LICENSE = "GPLv2"
-PR = "r8"
-
-# This is the default package, thus we lock to a specific git version so 
-# upstream changes will not break builds.
-
-TAG = "9845d92440bd87739c89edd000fd6e0c47fab185"
-# As of 2007/27/07, see http://git.infradead.org/?p=mtd-utils.git;a=shortlog
-
-SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=${TAG} \
-           file://add-exclusion-to-mkfs-jffs2-git.patch;patch=1 \
-	   file://fix-ignoreerrors-git.patch;patch=1 \
-	   file://lzo_1x.patch;patch=1"
-
-S = "${WORKDIR}/git/"
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
-
diff --git a/recipes/mtd/mtd-utils_1.0.0.bb b/recipes/mtd/mtd-utils_1.0.0.bb
deleted file mode 100644
index 0ebb47f..0000000
--- a/recipes/mtd/mtd-utils_1.0.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Tools for managing memory technology devices."
-SECTION = "base"
-DEPENDS = "zlib"
-HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-LICENSE = "GPLv2"
-PR = "r0"
-
-# RP/kergoth: Builds seem to break with recent mtd-utils
-# Can't pin down the exact problems
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.0.0.tar.gz"
-S = "${WORKDIR}/mtd-utils-${PV}"
-
-CFLAGS_prepend = "-I${WORKDIR}/mtd-utils-${PV}/include "
-
-do_install() {
-	oe_runmake install DESTDIR=${D}
-}
-- 
1.6.2.1





