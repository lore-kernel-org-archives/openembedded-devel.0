Received: from 31.mail-out.ovh.net ([213.186.62.10])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PdOG7-0004Qr-E4
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 15:34:39 +0100
Received: (qmail 19032 invoked by uid 503); 13 Jan 2011 15:08:39 -0000
Received: from b9.ovh.net (HELO mail173.ha.ovh.net) (213.186.33.59)
	by 31.mail-out.ovh.net with SMTP; 13 Jan 2011 15:08:39 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Jan 2011 16:34:05 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Jan 2011 16:34:03 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jan 2011 15:33:49 +0100
Message-Id: <1294929229-4495-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <4D2F0CAD.8000600@eukrea.com>
References: <4D2F0CAD.8000600@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 962362945508322633
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH v2] mtd-utils: add 1.4.1
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
X-List-Received-Date: Thu, 13 Jan 2011 14:34:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* latest stable version + a fix to mkubifs.
* switch to lzo2
* tested to generate ubi rootfs on the host.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
v2: switch 1.4.1 to lzo2, keep lzo for the older recipes

 .../mtd/mtd-utils-1.4.1/fix_heap_corruption.patch  |   95 ++++++++++++++++++++
 recipes/mtd/mtd-utils-native_1.1.0.bb              |    2 +
 recipes/mtd/mtd-utils-native_1.2.0+git.bb          |    2 +-
 recipes/mtd/mtd-utils-native_1.3.1.bb              |    2 +-
 recipes/mtd/mtd-utils-native_1.4.1.bb              |    3 +
 recipes/mtd/mtd-utils.inc                          |    2 +-
 recipes/mtd/mtd-utils_1.1.0.bb                     |    2 +
 recipes/mtd/mtd-utils_1.2.0+git.bb                 |    2 +-
 recipes/mtd/mtd-utils_1.3.1.bb                     |    2 +-
 recipes/mtd/mtd-utils_1.4.1.bb                     |   18 ++++
 10 files changed, 125 insertions(+), 5 deletions(-)
 create mode 100644 recipes/mtd/mtd-utils-1.4.1/fix_heap_corruption.patch
 create mode 100644 recipes/mtd/mtd-utils-native_1.4.1.bb
 create mode 100644 recipes/mtd/mtd-utils_1.4.1.bb

diff --git a/recipes/mtd/mtd-utils-1.4.1/fix_heap_corruption.patch b/recipes/mtd/mtd-utils-1.4.1/fix_heap_corruption.patch
new file mode 100644
index 0000000..5ce3a53
--- /dev/null
+++ b/recipes/mtd/mtd-utils-1.4.1/fix_heap_corruption.patch
@@ -0,0 +1,95 @@
+From d8f0ae2f26898f652ad3af4536b5d0e4db37714f Mon Sep 17 00:00:00 2001
+From: Kevin Cernekee <cernekee@gmail.com>
+Date: Wed, 22 Sep 2010 16:01:59 -0700
+Subject: [PATCH] mkfs.ubifs: Fix heap corruption on LEB overrun
+
+If max_leb_cnt (-c option) is set too low, set_lprops() will corrupt
+the heap and may result in a scary looking crash:
+
+$ bin/mkfs.ubifs -U -r romfs -o ubifs.img -m 512 -e 15360 -c 39
+Error: max_leb_cnt too low (241 needed)
+*** glibc detected *** bin/mkfs.ubifs: double free or corruption (!prev): 0x088fe070 ***
+======= Backtrace: =========
+/lib32/libc.so.6(+0x6c231)[0xf75fb231]
+/lib32/libc.so.6(+0x6dab8)[0xf75fcab8]
+/lib32/libc.so.6(cfree+0x6d)[0xf75ffb9d]
+bin/mkfs.ubifs[0x804e801]
+bin/mkfs.ubifs[0x804e94b]
+bin/mkfs.ubifs[0x804e99d]
+/lib32/libc.so.6(__libc_start_main+0xe6)[0xf75a5bd6]
+bin/mkfs.ubifs(__fxstat64+0x55)[0x80491e1]
+======= Memory map: ========
+08048000-0805d000 r-xp 00000000 08:08 10012045                           /work/bin/mkfs.ubifs
+0805d000-0805e000 rwxp 00015000 08:08 10012045                           /work/bin/mkfs.ubifs
+088fe000-08945000 rwxp 00000000 00:00 0                                  [heap]
+f73e1000-f73fe000 r-xp 00000000 08:05 2228842                            /usr/lib32/libgcc_s.so.1
+f73fe000-f73ff000 r-xp 0001c000 08:05 2228842                            /usr/lib32/libgcc_s.so.1
+f73ff000-f7400000 rwxp 0001d000 08:05 2228842                            /usr/lib32/libgcc_s.so.1
+f7400000-f7421000 rwxp 00000000 00:00 0
+f7421000-f7500000 ---p 00000000 00:00 0
+f751c000-f758f000 rwxp 00000000 00:00 0
+f758f000-f76e2000 r-xp 00000000 08:05 426288                             /lib32/libc-2.11.1.so
+f76e2000-f76e3000 ---p 00153000 08:05 426288                             /lib32/libc-2.11.1.so
+f76e3000-f76e5000 r-xp 00153000 08:05 426288                             /lib32/libc-2.11.1.so
+f76e5000-f76e6000 rwxp 00155000 08:05 426288                             /lib32/libc-2.11.1.so
+f76e6000-f76e9000 rwxp 00000000 00:00 0
+f76e9000-f770d000 r-xp 00000000 08:05 426296                             /lib32/libm-2.11.1.so
+f770d000-f770e000 r-xp 00023000 08:05 426296                             /lib32/libm-2.11.1.so
+f770e000-f770f000 rwxp 00024000 08:05 426296                             /lib32/libm-2.11.1.so
+f772a000-f772c000 rwxp 00000000 00:00 0
+f772c000-f772d000 r-xp 00000000 00:00 0                                  [vdso]
+f772d000-f7749000 r-xp 00000000 08:05 6062081                            /lib32/ld-2.11.1.so
+f7749000-f774a000 r-xp 0001b000 08:05 6062081                            /lib32/ld-2.11.1.so
+f774a000-f774b000 rwxp 0001c000 08:05 6062081                            /lib32/ld-2.11.1.so
+ffb58000-ffb6d000 rwxp 00000000 00:00 0                                  [stack]
+Aborted
+
+New code aborts cleanly, and still calculates the number of LEBs
+required:
+
+$ bin/mkfs.ubifs -U -r romfs -o tmp/ubifs.img -m 512 -e 15360 -c 39
+Error: max_leb_cnt too low (241 needed)
+$ echo $?
+255
+$ bin/mkfs.ubifs -U -r romfs -o tmp/ubifs.img -m 512 -e 15360 -c 240
+Error: max_leb_cnt too low (241 needed)
+$ bin/mkfs.ubifs -U -r romfs -o tmp/ubifs.img -m 512 -e 15360 -c 241
+$
+
+Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
+Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
+---
+ mkfs.ubifs/mkfs.ubifs.c |   10 +++++-----
+ 1 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
+index eeb5e42..ec38f0e 100644
+--- a/mkfs.ubifs/mkfs.ubifs.c
++++ b/mkfs.ubifs/mkfs.ubifs.c
+@@ -929,9 +929,11 @@ static void set_lprops(int lnum, int offs, int flags)
+ 	dirty = c->leb_size - free - ALIGN(offs, 8);
+ 	dbg_msg(3, "LEB %d free %d dirty %d flags %d", lnum, free, dirty,
+ 		flags);
+-	c->lpt[i].free = free;
+-	c->lpt[i].dirty = dirty;
+-	c->lpt[i].flags = flags;
++	if (i < c->main_lebs) {
++		c->lpt[i].free = free;
++		c->lpt[i].dirty = dirty;
++		c->lpt[i].flags = flags;
++	}
+ 	c->lst.total_free += free;
+ 	c->lst.total_dirty += dirty;
+ 	if (flags & LPROPS_INDEX)
+@@ -1943,8 +1945,6 @@ static int finalize_leb_cnt(void)
+ {
+ 	c->leb_cnt = head_lnum;
+ 	if (c->leb_cnt > c->max_leb_cnt)
+-		/* TODO: in this case it segfaults because buffer overruns - we
+-		 * somewhere allocate smaller buffers - fix */
+ 		return err_msg("max_leb_cnt too low (%d needed)", c->leb_cnt);
+ 	c->main_lebs = c->leb_cnt - c->main_first;
+ 	if (verbose) {
+-- 
+1.7.2.3
+
diff --git a/recipes/mtd/mtd-utils-native_1.1.0.bb b/recipes/mtd/mtd-utils-native_1.1.0.bb
index 6f9d71e..edaeff0 100644
--- a/recipes/mtd/mtd-utils-native_1.1.0.bb
+++ b/recipes/mtd/mtd-utils-native_1.1.0.bb
@@ -1,2 +1,4 @@
 require mtd-utils_${PV}.bb
 require mtd-utils-native.inc
+
+DEPENDS += "lzo-native"
diff --git a/recipes/mtd/mtd-utils-native_1.2.0+git.bb b/recipes/mtd/mtd-utils-native_1.2.0+git.bb
index 74ba439..472d743 100644
--- a/recipes/mtd/mtd-utils-native_1.2.0+git.bb
+++ b/recipes/mtd/mtd-utils-native_1.2.0+git.bb
@@ -1,3 +1,3 @@
 require mtd-utils_${PV}.bb
 require mtd-utils-native.inc
-DEPENDS += "util-linux-ng-native"
+DEPENDS += "util-linux-ng-native lzo-native"
diff --git a/recipes/mtd/mtd-utils-native_1.3.1.bb b/recipes/mtd/mtd-utils-native_1.3.1.bb
index 74ba439..472d743 100644
--- a/recipes/mtd/mtd-utils-native_1.3.1.bb
+++ b/recipes/mtd/mtd-utils-native_1.3.1.bb
@@ -1,3 +1,3 @@
 require mtd-utils_${PV}.bb
 require mtd-utils-native.inc
-DEPENDS += "util-linux-ng-native"
+DEPENDS += "util-linux-ng-native lzo-native"
diff --git a/recipes/mtd/mtd-utils-native_1.4.1.bb b/recipes/mtd/mtd-utils-native_1.4.1.bb
new file mode 100644
index 0000000..4208a4b
--- /dev/null
+++ b/recipes/mtd/mtd-utils-native_1.4.1.bb
@@ -0,0 +1,3 @@
+require mtd-utils_${PV}.bb
+require mtd-utils-native.inc
+DEPENDS += "util-linux-ng-native lzo2-native"
diff --git a/recipes/mtd/mtd-utils.inc b/recipes/mtd/mtd-utils.inc
index 319fd9a..74c4cf0 100644
--- a/recipes/mtd/mtd-utils.inc
+++ b/recipes/mtd/mtd-utils.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Tools for managing memory technology devices."
 SECTION = "base"
-DEPENDS = "zlib lzo"
+DEPENDS = "zlib"
 HOMEPAGE = "http://www.linux-mtd.infradead.org/"
 LICENSE = "GPLv2"
 PR = "r0"
diff --git a/recipes/mtd/mtd-utils_1.1.0.bb b/recipes/mtd/mtd-utils_1.1.0.bb
index 00aee3d..87f3615 100644
--- a/recipes/mtd/mtd-utils_1.1.0.bb
+++ b/recipes/mtd/mtd-utils_1.1.0.bb
@@ -2,6 +2,8 @@ require mtd-utils.inc
 
 PR = "r4"
 
+DEPENDS += "lzo"
+
 SRC_URI += "file://add-exclusion-to-mkfs-jffs2-git.patch \
 	    file://fix-ignoreerrors-git.patch \
 	    file://lzo_1x.patch"
diff --git a/recipes/mtd/mtd-utils_1.2.0+git.bb b/recipes/mtd/mtd-utils_1.2.0+git.bb
index 4d73c83..04cf2f2 100644
--- a/recipes/mtd/mtd-utils_1.2.0+git.bb
+++ b/recipes/mtd/mtd-utils_1.2.0+git.bb
@@ -1,6 +1,6 @@
 require mtd-utils.inc
 
-DEPENDS += "util-linux-ng"
+DEPENDS += "util-linux-ng lzo"
 PR = "r4"
 
 ARM_INSTRUCTION_SET = "arm"
diff --git a/recipes/mtd/mtd-utils_1.3.1.bb b/recipes/mtd/mtd-utils_1.3.1.bb
index 75ff7b9..7b9d624 100644
--- a/recipes/mtd/mtd-utils_1.3.1.bb
+++ b/recipes/mtd/mtd-utils_1.3.1.bb
@@ -1,6 +1,6 @@
 require mtd-utils.inc
 
-DEPENDS += "util-linux-ng"
+DEPENDS += "util-linux-ng lzo"
 
 PARALLEL_MAKE = ""
 ARM_INSTRUCTION_SET = "arm"
diff --git a/recipes/mtd/mtd-utils_1.4.1.bb b/recipes/mtd/mtd-utils_1.4.1.bb
new file mode 100644
index 0000000..948fce1
--- /dev/null
+++ b/recipes/mtd/mtd-utils_1.4.1.bb
@@ -0,0 +1,18 @@
+require mtd-utils.inc
+
+DEPENDS += "util-linux-ng lzo2"
+
+PARALLEL_MAKE = ""
+ARM_INSTRUCTION_SET = "arm"
+
+# This is the default package, thus we lock to a specific git version so 
+# upstream changes will not break builds.
+
+TAG = "v${PV}"
+
+SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=${TAG} \
+	   file://add-exclusion-to-mkfs-jffs2-git-2.patch \
+	   file://fix_heap_corruption.patch \
+	  "
+
+S = "${WORKDIR}/git/"
-- 
1.6.3.3



