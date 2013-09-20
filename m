Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob14.myregisteredsite.com
	(atl4mhob14.myregisteredsite.com [209.17.115.52])
	by mail.openembedded.org (Postfix) with ESMTP id F0D8D6B389
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2013 09:00:49 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob14.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r8K90pwh007970 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2013 05:00:51 -0400
Received: (qmail 5125 invoked by uid 0); 20 Sep 2013 09:00:51 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 20 Sep 2013 09:00:50 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Sep 2013 11:00:40 +0200
Message-Id: <1379667640-2763-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] fuse-exfat, ntfs-3g-ntfsprogs: Move util-linux-mount to RRECOMMENDS
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
X-List-Received-Date: Fri, 20 Sep 2013 09:00:51 -0000

Soften the dependency to allow distros to use another mount provider
like busybox instead of being forced to use util-linux-mount.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 .../fuse-exfat/fuse-exfat_1.0.1.bb                 |    2 +-
 .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb
index d29dc0a..f984c4b 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.0.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${DEBIAN_MIRROR}/main/f/fuse-exfat/fuse-exfat_${PV}.orig.tar.gz \
 "
 DEPENDS = "fuse virtual/libc"
-RDEPENDS_${PN} += "util-linux-mount"
+RRECOMMENDS_${PN} = "util-linux-mount"
 
 inherit scons
 
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
index e084187..c1392cc 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
@@ -23,7 +23,8 @@ EXTRA_OEMAKE = "LDCONFIG=echo"
 PACKAGES =+ "ntfs-3g ntfsprogs libntfs-3g"
 
 FILES_ntfs-3g = "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g* ${base_sbindir}/mount.ntfs"
-RDEPENDS_ntfs-3g += "fuse util-linux-mount"
+RDEPENDS_ntfs-3g += "fuse"
+RRECOMMENDS_ntfs-3g = "util-linux-mount"
 
 FILES_ntfsprogs = "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
 FILES_libntfs-3g = "${libdir}/*${SOLIBS}"
-- 
1.7.9.5


