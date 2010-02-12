Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NfwuH-00045q-4f
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 15:54:12 +0100
Received: (qmail 491 invoked by uid 813007); 12 Feb 2010 14:51:35 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 Feb 2010 14:51:35 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Feb 2010 15:51:22 +0100
Message-Id: <1265986283-28972-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1265986283-28972-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1265986283-28972-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] e2fsprogs: stop providing libblkid/libuuid/fsck - they are in util-linux-ng
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
X-List-Received-Date: Fri, 12 Feb 2010 14:54:12 -0000

There is a long story about moving components from e2fsprogs to
util-linux-ng and I will not write it here. But it happened and we
should follow.

The story in short is: kill libblkid, libuuid in this package, drop fsck
binary and use those which are in util-linux-ng. There are more and more
applications/libraries which require libblkid 2.xx - for example recent
HAL.

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/e2fsprogs/e2fsprogs_1.41.9.bb |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.9.bb b/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
index ada93bd..dd9aadb 100644
--- a/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
+++ b/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
@@ -1,6 +1,8 @@
 require e2fsprogs.inc
 
-DEPENDS += "gettext-native"
+DEPENDS += "gettext-native util-linux-ng"
+
+EXTRA_OECONF += " --disable-libuuid --disable-libblkid --disable-fsck"
 
 do_configure() {
         oe_runconf
@@ -33,22 +35,17 @@ do_stage () {
 # blkid used to be part of e2fsprogs but is useful outside, add it
 # as an RDEPENDS so that anything relying on it being in e2fsprogs
 # still works
-RDEPENDS_e2fsprogs = "e2fsprogs-blkid e2fsprogs-uuidgen e2fsprogs-badblocks"
+RDEPENDS_e2fsprogs = "util-linux-ng e2fsprogs-badblocks"
 
 FILES_${PN} += "${libdir}/e2initrd_helper"
 
-PACKAGES =+ "e2fsprogs-blkid e2fsprogs-uuidgen e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-fsck e2fsprogs-tune2fs e2fsprogs-badblocks"
-FILES_e2fsprogs-blkid = "${base_sbindir}/blkid.${PN}"
-FILES_e2fsprogs-uuidgen = "${bindir}/uuidgen"
-FILES_e2fsprogs-fsck = "${base_sbindir}/fsck.${PN}"
+PACKAGES =+ "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks"
 FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck.${PN} ${base_sbindir}/fsck.ext*.${PN}"
 FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs.${PN} ${base_sbindir}/mkfs.ext*.${PN}"
 FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label ${base_sbindir}/findfs"
 FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
 
 do_install_append () {
-	mv ${D}${base_sbindir}/fsck ${D}${base_sbindir}/fsck.${PN}
-	mv ${D}${base_sbindir}/blkid ${D}${base_sbindir}/blkid.${PN}
 	mv ${D}${base_sbindir}/e2fsck ${D}${base_sbindir}/e2fsck.${PN}
 	rm ${D}${base_sbindir}/fsck.ext2
 	rm ${D}${base_sbindir}/fsck.ext3
-- 
1.6.6.1





