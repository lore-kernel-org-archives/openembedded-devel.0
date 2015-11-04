Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (unknown [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6080B75A31
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 07:39:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA47dLPV002354
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 3 Nov 2015 23:39:21 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 3 Nov 2015 23:39:21 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Nov 2015 15:39:17 +0800
Message-ID: <1446622757-28389-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] wipe: add version 0.23
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
X-List-Received-Date: Wed, 04 Nov 2015 07:39:24 -0000
Content-Type: text/plain

Wipe is a little command for securely erasing files from magnetic media.

We do not support native, because wipe needs root permission.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/support-cross-compile-for-linux.patch    | 36 ++++++++++++++++++++++
 meta-oe/recipes-extended/wipe/wipe_git.bb          | 28 +++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-extended/wipe/files/support-cross-compile-for-linux.patch
 create mode 100644 meta-oe/recipes-extended/wipe/wipe_git.bb

diff --git a/meta-oe/recipes-extended/wipe/files/support-cross-compile-for-linux.patch b/meta-oe/recipes-extended/wipe/files/support-cross-compile-for-linux.patch
new file mode 100644
index 0000000..fb3aee8
--- /dev/null
+++ b/meta-oe/recipes-extended/wipe/files/support-cross-compile-for-linux.patch
@@ -0,0 +1,36 @@
+From 35f14bd5aba2ed6cee258e11eab42c408afc04d0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 4 Nov 2015 02:29:05 -0500
+Subject: [PATCH] Makefile: support cross compile for linux
+
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 17d9758..9e74cdf 100644
+--- a/Makefile
++++ b/Makefile
+@@ -41,7 +41,7 @@
+ # Linux 2.0.x
+ #
+ 
+-CC_LINUX=gcc
++CC_LINUX=$(CC)
+ CCO_LINUX=-Wall -DHAVE_DEV_URANDOM -DHAVE_OSYNC -DHAVE_STRCASECMP -DHAVE_RANDOM -DWEAK_RC6 -DSYNC_WAITS_FOR_SYNC -DFIND_DEVICE_SIZE_BY_BLKGETSIZE -DSIXTYFOUR -D__USE_LARGEFILE -D_FILE_OFFSET_BITS=64
+ # default should be to turn off debugging and to turn on optimization.
+ #CCO_LINUX+=-O9 -pipe -fomit-frame-pointer -finline-functions -funroll-loops -fstrength-reduce
+@@ -185,6 +185,7 @@ clean	:
+ 		rm -f wipe $(OBJECTS) wipe.tr-asc.1 version.h
+ 
+ install:
+-	install -m755 -o root -g root wipe $(DESTDIR)/usr/bin
++	[ -e $(DESTDIR)$(bindir) ] || mkdir -p $(DESTDIR)$(bindir)
++	install -m755 -o root -g root wipe $(DESTDIR)$(bindir)
+ 
+ .PHONY: always clean install
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/wipe/wipe_git.bb b/meta-oe/recipes-extended/wipe/wipe_git.bb
new file mode 100644
index 0000000..e946d06
--- /dev/null
+++ b/meta-oe/recipes-extended/wipe/wipe_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = "A UNIX tool for secure deletion"
+DESCRIPTION = "Wipe is a little command for securely erasing files from \
+magnetic media. It compiles under various unix platforms, \
+including Linux 2. * , (Open, Net, Free)BSD, aix 4.1, SunOS \
+5.5.1, Solaris 2.6. wipe is released under the GPL. Pre-compiled \
+packages are available on most Linux distributions. \
+Under Debian, the package name is wipe"
+HOMEPAGE = "http://lambda-diode.com/software/wipe/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "git://github.com/berke/wipe.git;branch=master \
+           file://support-cross-compile-for-linux.patch \
+          "
+SRCREV = "d9c100c9cd0b1cbbe4359e4d6c9a035d11e7597c"
+PV = "0.23+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "linux"
+
+do_install() {
+	make install DESTDIR=${D}
+}
+
+do_configure[noexec] = "1"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.9.1


