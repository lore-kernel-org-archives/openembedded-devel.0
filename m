Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1ObHtW-0006nU-3l
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 20:50:25 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 0DB3680C537; Tue, 20 Jul 2010 20:45:07 +0200 (CEST)
Received: from localhost (p5489DD67.dip.t-dialin.net [84.137.221.103])
	by gravedo.de (Postfix) with ESMTPSA id 4A57480C537;
	Tue, 20 Jul 2010 20:45:06 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jul 2010 20:44:55 +0200
Message-Id: <1279651497-20918-3-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
References: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] lvm2.inc: add patch to fix building
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
X-List-Received-Date: Tue, 20 Jul 2010 18:50:26 -0000

lvm2 fails to build cause there is a include of limits.h missing. The patch adds the
include to the relevant file of the lvm2 source.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/lvm2/files/include-limits.patch |   13 +++++++++++++
 recipes/lvm2/lvm2.inc                   |    3 ++-
 2 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 recipes/lvm2/files/include-limits.patch

diff --git a/recipes/lvm2/files/include-limits.patch b/recipes/lvm2/files/include-limits.patch
new file mode 100644
index 0000000..4987766
--- /dev/null
+++ b/recipes/lvm2/files/include-limits.patch
@@ -0,0 +1,13 @@
+diff -rpN LVM2.2.01.15-orig/lib/locking/cluster_locking.c LVM2.2.01.15/lib/locking/cluster_locking.c
+*** LVM2.2.01.15-orig/lib/locking/cluster_locking.c	2010-03-16 20:16:45.806355964 +0100
+--- LVM2.2.01.15/lib/locking/cluster_locking.c	2010-03-16 20:19:08.946345762 +0100
+***************
+*** 29,34 ****
+--- 29,35 ----
+  #include <sys/socket.h>
+  #include <sys/un.h>
+  #include <unistd.h>
++ #include <limits.h>
+  
+  #ifndef CLUSTER_LOCKING_INTERNAL
+  int lock_resource(struct cmd_context *cmd, const char *resource, int flags);
diff --git a/recipes/lvm2/lvm2.inc b/recipes/lvm2/lvm2.inc
index a7e37b5..080f5ea 100644
--- a/recipes/lvm2/lvm2.inc
+++ b/recipes/lvm2/lvm2.inc
@@ -6,7 +6,8 @@ INC_PR = "r2"
 
 S = "${WORKDIR}/LVM2.${PV}"
 SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
-           file://crosscompile_fix.patch"
+           file://crosscompile_fix.patch \
+           file://include-limits.patch"
 
 # Unset user/group to unbreak install.
 EXTRA_OECONF = "--with-user= --with-group= --disable-o_direct"
-- 
1.7.0.4



