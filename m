Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB34D6FF84
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 16:16:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7VGG2S7023200
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Aug 2016 09:16:02 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 31 Aug 2016 09:16:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Aug 2016 12:15:56 -0400
Message-ID: <24ab261599e8f219cee2e01070330071fa57e2b0.1472659887.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1472659887.git.hongxu.jia@windriver.com>
References: <cover.1472659887.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] lvm2: tweak MODPROBE_CMD for cross compile
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
X-List-Received-Date: Wed, 31 Aug 2016 16:16:08 -0000
Content-Type: text/plain

Lvm uses variable MODPROBE_CMD at runtime, so build time detection of modprobe
is incorrect.
------
|lvm lvcreate --thinpool wrl/pool00 --size 5556m --config  devices
{ preferred_names=["^/dev/mapper/", "^/dev/md/", "^/dev/sd"]
filter=["r|/loop1$|","r|/loop2$|","r|/loop3$|","r|/loop4$|","r|/loop5$|","r|/loop6$|","r|/loop7$|"] }
|tmp/sysroots/x86_64-linux/usr/bin/modprobe: execvp failed: No such file or directory
|tmp/sysroots/x86_64-linux/usr/bin/modprobe failed: 2
------

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc              |  3 ++
 ...0005-tweak-MODPROBE_CMD-for-cross-compile.patch | 38 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0005-tweak-MODPROBE_CMD-for-cross-compile.patch

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 3a5e1c4..e452f11 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -11,6 +11,7 @@ SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://0002-use-PTHREAD_MUTEX_RECURSIVE-instead-of-PTHREAD_MUTEX.patch \
            file://0003-Guard-use-of-mallinfo-with-__GLIBC__.patch \
            file://0004-include-fcntl.h-for-O_-defines-and-fcntl-signature.patch \
+           file://0005-tweak-MODPROBE_CMD-for-cross-compile.patch \
            "
 
 S = "${WORKDIR}/LVM2.${PV}"
@@ -39,6 +40,8 @@ EXTRA_OECONF = "--with-user= \
                 --with-systemdsystemunitdir=${systemd_system_unitdir} \
 "
 
+CACHED_CONFIGUREVARS += "MODPROBE_CMD=${base_sbindir}/modprobe"
+
 do_install_append() {
     # Install machine specific configuration file
     install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0005-tweak-MODPROBE_CMD-for-cross-compile.patch b/meta-oe/recipes-support/lvm2/lvm2/0005-tweak-MODPROBE_CMD-for-cross-compile.patch
new file mode 100644
index 0000000..8db320d
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0005-tweak-MODPROBE_CMD-for-cross-compile.patch
@@ -0,0 +1,38 @@
+From 72866782f83c8cf85b10017df461128af90cae6e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 30 Aug 2016 22:33:47 -0400
+Subject: [PATCH] tweak MODPROBE_CMD for cross compile
+
+Lvm uses variable MODPROBE_CMD at runtime, so build time detection of modprobe
+is incorrect.
+------
+|lvm lvcreate --thinpool wrl/pool00 --size 5556m --config  devices
+{ preferred_names=["^/dev/mapper/", "^/dev/md/", "^/dev/sd"]
+filter=["r|/loop1$|","r|/loop2$|","r|/loop3$|","r|/loop4$|","r|/loop5$|","r|/loop6$|","r|/loop7$|"] }
+|tmp/sysroots/x86_64-linux/usr/bin/modprobe: execvp failed: No such file or directory
+|tmp/sysroots/x86_64-linux/usr/bin/modprobe failed: 2
+------
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.in | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 8e04782..77681b0 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1779,8 +1779,6 @@ if test "$UDEV_SYNC" = yes; then
+ fi
+ 
+ ################################################################################
+-AC_PATH_TOOL(MODPROBE_CMD, modprobe)
+-
+ if test -n "$MODPROBE_CMD"; then
+ 	AC_DEFINE_UNQUOTED([MODPROBE_CMD], ["$MODPROBE_CMD"], [The path to 'modprobe', if available.])
+ fi
+-- 
+2.8.1
+
-- 
2.8.1


