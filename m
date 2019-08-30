Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56D217F3E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 07:06:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7U76pfc001395
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 00:06:51 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 30 Aug 2019 00:06:50 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Aug 2019 15:06:47 +0800
Message-ID: <1567148808-286340-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567148808-286340-1-git-send-email-changqing.li@windriver.com>
References: <1567148808-286340-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH 2/3] ntfs-3g-ntfsprogs: support usrmerge
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
X-List-Received-Date: Fri, 30 Aug 2019 07:06:50 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../files/0001-Make-build-support-usrmerge.patch   | 43 ++++++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2017.3.23.bb                 |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-Make-build-support-usrmerge.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-Make-build-support-usrmerge.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-Make-build-support-usrmerge.patch
new file mode 100644
index 0000000..fce10b9
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-Make-build-support-usrmerge.patch
@@ -0,0 +1,43 @@
+From 33f678bf74367aab8ddc2858a9f7797455ea9b9f Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 29 Aug 2019 10:21:58 +0800
+Subject: [PATCH] Make build support usrmerge
+
+Upstream-Status: Inappropriate[oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ ntfsprogs/Makefile.am | 2 --
+ src/Makefile.am       | 3 ---
+ 2 files changed, 5 deletions(-)
+
+diff --git a/ntfsprogs/Makefile.am b/ntfsprogs/Makefile.am
+index f4f9d1b..1f6a673 100644
+--- a/ntfsprogs/Makefile.am
++++ b/ntfsprogs/Makefile.am
+@@ -165,8 +165,6 @@ extras:	libs $(EXTRA_PROGRAMS)
+ 
+ if ENABLE_MOUNT_HELPER
+ install-exec-hook:
+-	$(INSTALL) -d $(DESTDIR)/sbin
+-	$(LN_S) -f $(sbindir)/mkntfs $(DESTDIR)/sbin/mkfs.ntfs
+ 
+ install-data-hook:
+ 	$(INSTALL) -d $(DESTDIR)$(man8dir)
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 8d98408..d0a6a45 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -66,9 +66,6 @@ endif
+ 
+ if ENABLE_MOUNT_HELPER
+ install-exec-local:	install-rootbinPROGRAMS
+-	$(MKDIR_P) "$(DESTDIR)/sbin"
+-	$(LN_S) -f "$(rootbindir)/ntfs-3g" "$(DESTDIR)/sbin/mount.ntfs-3g"
+-	$(LN_S) -f "$(rootbindir)/lowntfs-3g" "$(DESTDIR)/sbin/mount.lowntfs-3g"
+ 
+ install-data-local:	install-man8
+ 	$(LN_S) -f ntfs-3g.8 "$(DESTDIR)$(man8dir)/mount.ntfs-3g.8"
+-- 
+2.7.4
+
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
index addb4d3..1559bfd 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
+           ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-Make-build-support-usrmerge.patch','',d)} \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[md5sum] = "d97474ae1954f772c6d2fa386a6f462c"
-- 
2.7.4


