Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob05.myregisteredsite.com
	(atl4mhob05.myregisteredsite.com [209.17.115.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0619160289
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2013 09:37:40 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.204])
	by atl4mhob05.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r8C9bgbr006534 for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2013 05:37:42 -0400
Received: (qmail 15518 invoked by uid 0); 12 Sep 2013 09:37:42 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 12 Sep 2013 09:37:41 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2013 11:37:35 +0200
Message-Id: <1378978655-2635-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] ntfs-3g-ntfsprogs does not rdepend on util-linux-mount
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
X-List-Received-Date: Thu, 12 Sep 2013 09:37:42 -0000

ntfs-3g-ntfsprogs has no runtime dependency on util-linux-mount, for
example busybox mount will also do just fine. It might be less useful
without any mount program, but that's not the same as depending on it.

The dependency broke several images because util-linux-mount behaves
differently than busybox mount, resulting in failure to mount ext2/3
volumes and network shares on user's systems.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
index e084187..a34a791 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
@@ -5,6 +5,7 @@ PROVIDES = "ntfsprogs ntfs-3g"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
+PR = "r1"
 
 SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz"
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
@@ -23,7 +24,7 @@ EXTRA_OEMAKE = "LDCONFIG=echo"
 PACKAGES =+ "ntfs-3g ntfsprogs libntfs-3g"
 
 FILES_ntfs-3g = "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g* ${base_sbindir}/mount.ntfs"
-RDEPENDS_ntfs-3g += "fuse util-linux-mount"
+RDEPENDS_ntfs-3g += "fuse"
 
 FILES_ntfsprogs = "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
 FILES_libntfs-3g = "${libdir}/*${SOLIBS}"
-- 
1.7.9.5


