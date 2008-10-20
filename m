Received: from [193.12.106.18] (helo=mail.southpole.se)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jonas.bonn@gmail.com>) id 1KruZJ-0006ZR-LO
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 15:13:09 +0200
Received: from localhost.localdomain
	(ua-83-227-144-18.cust.bredbandsbolaget.se [83.227.144.18])
	by mail.southpole.se (Postfix) with ESMTPSA id 18F9F4ED12D;
	Mon, 20 Oct 2008 15:12:50 +0200 (CEST)
From: Jonas Bonn <jonas.bonn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2008 15:12:49 +0200
Message-Id: <1224508369-30155-1-git-send-email-jonas.bonn@gmail.com>
X-Mailer: git-send-email 1.5.6.3
Subject: [PATCH] File perms required when O_CREAT is used
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
X-List-Received-Date: Mon, 20 Oct 2008 13:13:09 -0000

On Ubuntu Intrepid, D_FORTIFY_SOURCE is enabled by default, thus
requiring file permissions when the O_CREAT flag is set on open.  This
patch remedies this for gcc-3.4.6.

Signed-off-by: Jonas Bonn <jonas.bonn@gmail.com>
---
 packages/gcc/gcc-3.4.6.inc                 |    3 ++-
 packages/gcc/gcc-3.4.6/O_CREAT-perms.patch |   11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 packages/gcc/gcc-3.4.6/O_CREAT-perms.patch

diff --git a/packages/gcc/gcc-3.4.6.inc b/packages/gcc/gcc-3.4.6.inc
index 1afd7a2..e90fe04 100644
--- a/packages/gcc/gcc-3.4.6.inc
+++ b/packages/gcc/gcc-3.4.6.inc
@@ -16,7 +16,8 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://always-fixincperm.patch;patch=1 \
 	   file://GCOV_PREFIX_STRIP-cross-profile_3.4.patch;patch=1 \
 	   file://zecke-xgcc-cpp.patch;patch=1 \
-	   file://gcc4-mtune-compat.patch;patch=1"
+	   file://gcc4-mtune-compat.patch;patch=1 \
+	   file://O_CREAT-perms.patch;patch=1"
 
 SRC_URI += "file://gcc34-configure.in.patch;patch=1"
 SRC_URI += "file://gcc34-thumb-support.patch;patch=1"
diff --git a/packages/gcc/gcc-3.4.6/O_CREAT-perms.patch b/packages/gcc/gcc-3.4.6/O_CREAT-perms.patch
new file mode 100644
index 0000000..1c3af2e
--- /dev/null
+++ b/packages/gcc/gcc-3.4.6/O_CREAT-perms.patch
@@ -0,0 +1,11 @@
+--- gcc-3.4.6/gcc/collect2.c.orig	2008-10-20 14:47:56.000000000 +0200
++++ gcc-3.4.6/gcc/collect2.c	2008-10-20 14:48:49.000000000 +0200
+@@ -1534,7 +1534,7 @@
+   if (redir)
+     {
+       /* Open response file.  */
+-      redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT);
++      redir_handle = open (redir, O_WRONLY | O_TRUNC | O_CREAT, 0644);
+ 
+       /* Duplicate the stdout and stderr file handles
+ 	 so they can be restored later.  */
-- 
1.5.6.3



