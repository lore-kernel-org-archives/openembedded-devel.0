Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6E5972F18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 08:38:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3O8cI0x013286
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 01:38:19 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 01:38:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Apr 2017 04:38:17 -0400
Message-ID: <1493023097-80545-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH] ntfs-3g-ntfsprogs: fix install failed while host dir not exist
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
X-List-Received-Date: Mon, 24 Apr 2017 08:38:18 -0000
Content-Type: text/plain

While cross compiling, if the dir of "$(rootlibdir)" and "$(libdir)"
(such as "/usr/lib64") do not exist on host system, the do_instal failed.
-----------------------
make[3]: Entering directory `tmp/work/core2-64-wrs-linux/ntfs-3g-ntfsprogs/2017.3.23-r0/build/libntfs-3g'
if [ ! "/usr/lib64" -ef "/usr/lib64" ]; then \
    mv -f "tmp/work/core2-64-wrs-linux/ntfs-3g-ntfsprogs/2017.3.23-r0/image//usr/lib64"/libntfs-3g.so* \
        "tmp/work/core2-64-wrs-linux/ntfs-3g-ntfsprogs/2017.3.23-r0/image//usr/lib64";  \
fi
mv:...are the same file
-----------------------

Use `=' rather than `-ef' to compare them, the cross compile does not
care about host dir.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...Makefile.am-fix-install-failed-while-host.patch | 52 ++++++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2017.3.23.bb                 |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch
new file mode 100644
index 0000000..7b8eec7
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch
@@ -0,0 +1,52 @@
+From 575591caf1e8972f765885679b76787ef92de77b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 24 Apr 2017 04:24:10 -0400
+Subject: [PATCH] libntfs-3g/Makefile.am: fix install failed while host dir not exist
+
+While cross compiling, if the dir of "$(rootlibdir)" and "$(libdir)"
+(such as "/usr/lib64") do not exist on host system, the do_instal failed.
+-----------------------
+make[3]: Entering directory `tmp/work/core2-64-wrs-linux/ntfs-3g-ntfsprogs/2017.3.23-r0/build/libntfs-3g'
+if [ ! "/usr/lib64" -ef "/usr/lib64" ]; then \
+    mv -f "tmp/work/core2-64-wrs-linux/ntfs-3g-ntfsprogs/2017.3.23-r0/image//usr/lib64"/libntfs-3g.so* \
+        "tmp/work/core2-64-wrs-linux/ntfs-3g-ntfsprogs/2017.3.23-r0/image//usr/lib64";  \
+fi
+mv:...are the same file
+-----------------------
+
+Use `=' rather than `-ef' to compare them, the cross compile does not
+care about host dir.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libntfs-3g/Makefile.am | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libntfs-3g/Makefile.am b/libntfs-3g/Makefile.am
+index d6b150e..806109d 100644
+--- a/libntfs-3g/Makefile.am
++++ b/libntfs-3g/Makefile.am
+@@ -59,15 +59,15 @@ endif
+ # And create ldscript or symbolic link from /usr
+ install-exec-hook: install-rootlibLTLIBRARIES
+ if INSTALL_LIBRARY
+-	if [ ! "$(rootlibdir)" -ef "$(libdir)" ]; then \
++	if [ "$(rootlibdir)" != "$(libdir)" ]; then \
+ 		$(MV) -f "$(DESTDIR)/$(libdir)"/libntfs-3g.so* "$(DESTDIR)/$(rootlibdir)";  \
+ 	fi
+ if GENERATE_LDSCRIPT
+-	if [ ! "$(rootlibdir)" -ef "$(libdir)" ]; then \
++	if [ "$(rootlibdir)" != "$(libdir)" ]; then \
+ 		$(install_sh_PROGRAM) "libntfs-3g.script.so" "$(DESTDIR)/$(libdir)/libntfs-3g.so"; \
+ 	fi
+ else
+-	if [ ! "$(rootlibdir)" -ef "$(libdir)" ]; then \
++	if [ "$(rootlibdir)" != "$(libdir)" ]; then \
+ 		$(LN_S) "$(rootlibdir)/libntfs-3g.so" "$(DESTDIR)/$(libdir)/libntfs-3g.so"; \
+ 	fi
+ endif
+-- 
+2.8.1
+
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
index 63627de..9e77766 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
@@ -6,7 +6,9 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz"
+SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
+           file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
+"
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[md5sum] = "d97474ae1954f772c6d2fa386a6f462c"
 SRC_URI[sha256sum] = "3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5"
-- 
2.8.1


