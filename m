Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LvvR1-0006gd-H2
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 17:29:27 +0200
Received: (qmail 21661 invoked by uid 813007); 20 Apr 2009 15:25:08 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Apr 2009 15:25:08 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Apr 2009 17:24:57 +0200
Message-Id: <1240241104-21935-5-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
In-Reply-To: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Carsten Haitzler <raster@openmoko.org>
Subject: [STABLE][PATCH 1/1] e2fsprogs: fix compile to use 3 args so it works.
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
X-List-Received-Date: Mon, 20 Apr 2009 15:29:28 -0000

From: Carsten Haitzler <raster@openmoko.org>

---
 .../e2fsprogs/e2fsprogs-1.38/file-open-mode.patch  |   11 +++++++++++
 recipes/e2fsprogs/e2fsprogs-native_1.38.bb         |    5 +++--
 recipes/e2fsprogs/e2fsprogs_1.38.bb                |    5 +++--
 3 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 recipes/e2fsprogs/e2fsprogs-1.38/file-open-mode.patch

diff --git a/recipes/e2fsprogs/e2fsprogs-1.38/file-open-mode.patch b/recipes/e2fsprogs/e2fsprogs-1.38/file-open-mode.patch
new file mode 100644
index 0000000..97679d6
--- /dev/null
+++ b/recipes/e2fsprogs/e2fsprogs-1.38/file-open-mode.patch
@@ -0,0 +1,11 @@
+--- e2fsprogs-1.38/lib/ext2fs/ismounted.c~	2005-06-06 06:05:22.000000000 +1000
++++ e2fsprogs-1.38/lib/ext2fs/ismounted.c	2009-04-03 15:07:35.000000000 +1100
+@@ -147,7 +147,7 @@
+ is_root:
+ #define TEST_FILE "/.ismount-test-file"		
+ 		*mount_flags |= EXT2_MF_ISROOT;
+-		fd = open(TEST_FILE, O_RDWR|O_CREAT);
++		fd = open(TEST_FILE, O_RDWR|O_CREAT, S_IRUSR|S_IWUSR);
+ 		if (fd < 0) {
+ 			if (errno == EROFS)
+ 				*mount_flags |= EXT2_MF_READONLY;
diff --git a/recipes/e2fsprogs/e2fsprogs-native_1.38.bb b/recipes/e2fsprogs/e2fsprogs-native_1.38.bb
index 388c519..af49b0d 100644
--- a/recipes/e2fsprogs/e2fsprogs-native_1.38.bb
+++ b/recipes/e2fsprogs/e2fsprogs-native_1.38.bb
@@ -2,11 +2,12 @@ SECTION = "base"
 require e2fsprogs.inc
 inherit native
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://no-hardlinks.patch;patch=1 \
 	    file://mkinstalldirs.patch;patch=1 \
-	   "
+            file://file-open-mode.patch;patch=1 \
+            "
 
 EXTRA_OECONF = ""
 
diff --git a/recipes/e2fsprogs/e2fsprogs_1.38.bb b/recipes/e2fsprogs/e2fsprogs_1.38.bb
index 5687556..8ec469a 100644
--- a/recipes/e2fsprogs/e2fsprogs_1.38.bb
+++ b/recipes/e2fsprogs/e2fsprogs_1.38.bb
@@ -1,10 +1,11 @@
 require e2fsprogs.inc
 
-PR = "r19"
+PR = "r20"
 
 SRC_URI += "file://no-hardlinks.patch;patch=1 \
 	    file://mkinstalldirs.patch;patch=1 \
-	   "
+            file://file-open-mode.patch;patch=1 \
+           "
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
1.6.2.3





