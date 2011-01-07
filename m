Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PbK9w-0006YQ-Oh
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 22:47:45 +0100
Received: (qmail 10248 invoked by uid 503); 7 Jan 2011 21:19:26 -0000
Received: from b9.ovh.net (HELO mail421.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 7 Jan 2011 21:19:25 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Jan 2011 23:47:19 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 7 Jan 2011 23:47:18 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jan 2011 22:47:15 +0100
Message-Id: <1294436836-28074-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1294436836-28074-1-git-send-email-eric@eukrea.com>
References: <1294436836-28074-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9936629629558631754
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 2/3] dosfstools: update to latest 3.0.11
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
X-List-Received-Date: Fri, 07 Jan 2011 21:47:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

3.0.10 :
bugfix in LFN handling, fixes false positives with bad filenames
3.0.11 :
bugfix for s390x, better error message ifdevices can't be opened

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/dosfstools/dosfstools_3.0.11.bb |   28 ++++++++++++++++++++++++++++
 recipes/dosfstools/dosfstools_3.0.9.bb  |   28 ----------------------------
 2 files changed, 28 insertions(+), 28 deletions(-)
 create mode 100644 recipes/dosfstools/dosfstools_3.0.11.bb
 delete mode 100644 recipes/dosfstools/dosfstools_3.0.9.bb

diff --git a/recipes/dosfstools/dosfstools_3.0.11.bb b/recipes/dosfstools/dosfstools_3.0.11.bb
new file mode 100644
index 0000000..1717157
--- /dev/null
+++ b/recipes/dosfstools/dosfstools_3.0.11.bb
@@ -0,0 +1,28 @@
+# dosfstools OE build file
+# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+DESCRIPTION = "DOS FAT Filesystem Utilities"
+
+SECTION = "base"
+PRIORITY = "optional"
+LICENSE = "GPLv3"
+
+DEFAULT_PREFERENCE = "-1"
+
+PR = "r1"
+
+SRC_URI = "http://www.daniel-baumann.ch/software/dosfstools/dosfstools-${PV}.tar.bz2 \
+	"
+# output of getconf LFS_CFLAGS
+#
+CFLAGS_append = ' -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
+CFLAGS_append_libc-uclibc = ' ${@base_contains("DISTRO_FEATURES", "largefile", "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64", "", d)}'
+
+do_install () {
+	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${sbindir}" \
+		   "MANDIR=${D}${mandir}/man8" install
+}
+
+SRC_URI[md5sum] = "8d2211d5bd813164e20740e7c852aa06"
+SRC_URI[sha256sum] = "94b27a0f53f4aa86b0c049eb26df7a681ec6c31bc352c57d3ac53881bcfcd9a8"
diff --git a/recipes/dosfstools/dosfstools_3.0.9.bb b/recipes/dosfstools/dosfstools_3.0.9.bb
deleted file mode 100644
index 676c751..0000000
--- a/recipes/dosfstools/dosfstools_3.0.9.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-# dosfstools OE build file
-# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-DESCRIPTION = "DOS FAT Filesystem Utilities"
-
-SECTION = "base"
-PRIORITY = "optional"
-LICENSE = "GPLv3"
-
-DEFAULT_PREFERENCE = "-1"
-
-PR = "r1"
-
-SRC_URI = "http://www.daniel-baumann.ch/software/dosfstools/dosfstools-${PV}.tar.bz2 \
-	"
-# output of getconf LFS_CFLAGS
-#
-CFLAGS_append = ' -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
-CFLAGS_append_libc-uclibc = ' ${@base_contains("DISTRO_FEATURES", "largefile", "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64", "", d)}'
-
-do_install () {
-	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${sbindir}" \
-		   "MANDIR=${D}${mandir}/man8" install
-}
-
-SRC_URI[md5sum] = "7f159ec44d3b9c502904bab0236050e4"
-SRC_URI[sha256sum] = "3f63676faeac507e909d84c8920ddb6597da1eb688577c2fc9c756b821d0458f"
-- 
1.6.3.3



