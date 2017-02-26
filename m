Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 441 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 26 Feb 2017 11:40:57 UTC
Received: from smtp02.mail.online.nl (smtp02.mail.online.nl [194.134.25.72])
	by mail.openembedded.org (Postfix) with ESMTP id 46ABD730F1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2017 11:40:57 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp02.mail.online.nl (Postfix) with ESMTP id 0A9151A0243;
	Sun, 26 Feb 2017 12:33:34 +0100 (CET)
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2017 12:33:28 +0100
Message-Id: <1488108808-30079-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][meta-filesystems] fuse: Remove unneeded RDEPENDS on util-linux-mount
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
X-List-Received-Date: Sun, 26 Feb 2017 11:41:01 -0000

Fuse claimed to need util-linux-mount at runtime, which isn't true. This
drags util-linux-mount into any image that uses fuse.

Encountered no problems with busybox's mount command and fuse (and never
had). Fuse doesn't call the "mount" program anywhere, so the dependency
doesn't make sense anyway.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
index 9a2dc11..153fcb4 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
@@ -29,9 +29,6 @@ DEPENDS = "gettext-native"
 
 PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
 
-# Fusermount requires features from the util-linux version of mount.
-RDEPENDS_${PN}_class-target += "util-linux-mount"
-
 RRECOMMENDS_${PN}_class-target = "kernel-module-fuse libulockmgr fuse-utils"
 
 FILES_${PN} += "${libdir}/libfuse.so.*"
-- 
2.1.4


