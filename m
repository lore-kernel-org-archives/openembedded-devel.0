Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D15A6701CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 14:10:06 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jun 2014 07:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,507,1400050800"; d="scan'208";a="447523693"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.96])
	by azsmga001.ch.intel.com with ESMTP; 19 Jun 2014 07:10:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 15:09:56 +0100
Message-Id: <d7e44620147a6f95d0a5d29fffc7438accc645fd.1403186612.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1403186612.git.paul.eggleton@linux.intel.com>
References: <cover.1403186612.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1403186612.git.paul.eggleton@linux.intel.com>
References: <cover.1403186612.git.paul.eggleton@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [meta-filesystems][PATCH v2 1/1] aufs-util: add new recipe
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
X-List-Received-Date: Thu, 19 Jun 2014 14:10:07 -0000

Introducing the aufs-util target recipe. This would be used in
conjuction with the aufs kernel feature to provide union mounts suitable
for live boot applications.

Only the target binaries are currently packages, with man pages,
libraries and other artifacts skipped in this initial integration.

(Integration work done by Bruce Ashfield <bruce.ashfield@windriver.com>
and Chen Qi <Qi.Chen@windriver.com> .)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...dd-tool-concept-to-Makefile-for-cross-com.patch |  29 +++
 .../aufs-util-don-t-strip-executables.patch        |  37 ++++
 .../recipes-utils/aufs-util/aufs-util/aufs_type.h  | 210 +++++++++++++++++++++
 .../recipes-utils/aufs-util/aufs-util_git.bb       |  53 ++++++
 4 files changed, 329 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch
new file mode 100644
index 0000000..5c35586
--- /dev/null
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch
@@ -0,0 +1,29 @@
+Subject: [PATCH] aufs-util: add tool concept to Makefile for cross compiling
+ purpose
+
+In a cross compilation environment, c2sh, c2tmac and ver need to be created first.
+Add a tools target to Makefile to allow for this.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 2f905ad..49c3cd5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -85,7 +85,7 @@ aufs.5: aufs.in.5 c2tmac
+ 	chmod a-w $@
+ 
+ c2sh c2tmac ver: CC = ${HOSTCC}
+-.INTERMEDIATE: c2sh c2tmac ver
++tools: c2sh c2tmac ver
+ 
+ Install = install -o root -g root -p
+ install_sbin: File = auibusy auplink mount.aufs umount.aufs
+-- 
+1.7.9.5
+
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch
new file mode 100644
index 0000000..48727e6
--- /dev/null
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch
@@ -0,0 +1,37 @@
+From 244863eca77fcaa1187884836c3e28d6b6d1504a Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Tue, 9 Apr 2013 18:50:34 -0700
+Subject: [PATCH] aufs-util: don't strip executables
+
+By default, aufs-util strips its binaries. This produces QA warnings
+as follows:
+
+   WARNING: File '/sbin/mount.aufs' from aufs-util was already stripped, this will prevent future debugging!
+   WARNING: File '/sbin/auplink' from aufs-util was already stripped, this will prevent future debugging!
+   WARNING: File '/sbin/umount.aufs' from aufs-util was already stripped, this will prevent future debugging!
+   WARNING: File '/sbin/auibusy' from aufs-util was already stripped, this will prevent future debugging!
+   WARNING: File '/usr/lib/libau.so.2.6' from aufs-util was already stripped, this will prevent future debugging!
+
+To prevent this, we remove -s from LDFLAGS.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 2f905ad..e0c6dcd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -56,7 +56,7 @@ all: ver_test ${Man} ${Bin} ${Etc}
+ ver_test: ver
+ 	./ver
+ 
+-${Bin}: LDFLAGS += -static -s
++${Bin}: LDFLAGS += -static
+ ${Bin}: LDLIBS = -L. -lautil
+ ${BinObj}: %.o: %.c ${LibUtilHdr} ${LibUtil}
+ 
+-- 
+1.7.10.4
+
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h
new file mode 100644
index 0000000..cb439ba
--- /dev/null
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h
@@ -0,0 +1,210 @@
+/*
+ * Copyright (C) 2005-2013 Junjiro R. Okajima
+ *
+ * This program, aufs is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ */
+
+#ifndef __AUFS_TYPE_H__
+#define __AUFS_TYPE_H__
+
+#define AUFS_NAME	"aufs"
+
+#include <stdint.h>
+#include <sys/types.h>
+
+#include <linux/limits.h>
+
+#define AUFS_VERSION	"3.8-20130325"
+
+/* todo? move this to linux-2.6.19/include/magic.h */
+#define AUFS_SUPER_MAGIC	('a' << 24 | 'u' << 16 | 'f' << 8 | 's')
+
+/* ---------------------------------------------------------------------- */
+
+#ifdef CONFIG_AUFS_BRANCH_MAX_127
+typedef int8_t aufs_bindex_t;
+#define AUFS_BRANCH_MAX 127
+#else
+typedef int16_t aufs_bindex_t;
+#ifdef CONFIG_AUFS_BRANCH_MAX_511
+#define AUFS_BRANCH_MAX 511
+#elif defined(CONFIG_AUFS_BRANCH_MAX_1023)
+#define AUFS_BRANCH_MAX 1023
+#elif defined(CONFIG_AUFS_BRANCH_MAX_32767)
+#define AUFS_BRANCH_MAX 32767
+#endif
+#endif
+
+
+/* ---------------------------------------------------------------------- */
+
+#define AUFS_FSTYPE		AUFS_NAME
+
+#define AUFS_ROOT_INO		2
+#define AUFS_FIRST_INO		11
+
+#define AUFS_WH_PFX		".wh."
+#define AUFS_WH_PFX_LEN		((int)sizeof(AUFS_WH_PFX) - 1)
+#define AUFS_WH_TMP_LEN		4
+/* a limit for rmdir/rename a dir */
+#define AUFS_MAX_NAMELEN	(NAME_MAX \
+				- AUFS_WH_PFX_LEN * 2	/* doubly whiteouted */\
+				- 1			/* dot */\
+				- AUFS_WH_TMP_LEN)	/* hex */
+#define AUFS_XINO_FNAME		"." AUFS_NAME ".xino"
+#define AUFS_XINO_DEFPATH	"/tmp/" AUFS_XINO_FNAME
+#define AUFS_XINO_TRUNC_INIT	64 /* blocks */
+#define AUFS_XINO_TRUNC_STEP	4  /* blocks */
+#define AUFS_DIRWH_DEF		3
+#define AUFS_RDCACHE_DEF	10 /* seconds */
+#define AUFS_RDCACHE_MAX	3600 /* seconds */
+#define AUFS_RDBLK_DEF		512 /* bytes */
+#define AUFS_RDHASH_DEF		32
+#define AUFS_WKQ_NAME		AUFS_NAME "d"
+#define AUFS_MFS_DEF_SEC	30 /* seconds */
+#define AUFS_MFS_MAX_SEC	3600 /* seconds */
+#define AUFS_PLINK_WARN		100 /* number of plinks */
+
+/* pseudo-link maintenace under /proc */
+#define AUFS_PLINK_MAINT_NAME	"plink_maint"
+#define AUFS_PLINK_MAINT_DIR	"fs/" AUFS_NAME
+#define AUFS_PLINK_MAINT_PATH	AUFS_PLINK_MAINT_DIR "/" AUFS_PLINK_MAINT_NAME
+
+#define AUFS_DIROPQ_NAME	AUFS_WH_PFX ".opq" /* whiteouted doubly */
+#define AUFS_WH_DIROPQ		AUFS_WH_PFX AUFS_DIROPQ_NAME
+
+#define AUFS_BASE_NAME		AUFS_WH_PFX AUFS_NAME
+#define AUFS_PLINKDIR_NAME	AUFS_WH_PFX "plnk"
+#define AUFS_ORPHDIR_NAME	AUFS_WH_PFX "orph"
+
+/* doubly whiteouted */
+#define AUFS_WH_BASE		AUFS_WH_PFX AUFS_BASE_NAME
+#define AUFS_WH_PLINKDIR	AUFS_WH_PFX AUFS_PLINKDIR_NAME
+#define AUFS_WH_ORPHDIR		AUFS_WH_PFX AUFS_ORPHDIR_NAME
+
+/* branch permissions and attributes */
+#define AUFS_BRPERM_RW		"rw"
+#define AUFS_BRPERM_RO		"ro"
+#define AUFS_BRPERM_RR		"rr"
+#define AUFS_BRRATTR_WH		"wh"
+#define AUFS_BRWATTR_NLWH	"nolwh"
+
+/* ---------------------------------------------------------------------- */
+
+/* ioctl */
+enum {
+	/* readdir in userspace */
+	AuCtl_RDU,
+	AuCtl_RDU_INO,
+
+	/* pathconf wrapper */
+	AuCtl_WBR_FD,
+
+	/* busy inode */
+	AuCtl_IBUSY
+};
+
+/* borrowed from linux/include/linux/kernel.h */
+#ifndef ALIGN
+#define ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a)-1)
+#define __ALIGN_MASK(x, mask)	(((x)+(mask))&~(mask))
+#endif
+
+/* borrowed from linux/include/linux/compiler-gcc3.h */
+#ifndef __aligned
+#define __aligned(x)			__attribute__((aligned(x)))
+#endif
+
+
+struct au_rdu_cookie {
+	uint64_t	h_pos;
+	int16_t		bindex;
+	uint8_t		flags;
+	uint8_t		pad;
+	uint32_t	generation;
+} __aligned(8);
+
+struct au_rdu_ent {
+	uint64_t	ino;
+	int16_t		bindex;
+	uint8_t		type;
+	uint8_t		nlen;
+	uint8_t		wh;
+	char		name[0];
+} __aligned(8);
+
+static __inline__ int au_rdu_len(int nlen)
+{
+	/* include the terminating NULL */
+	return ALIGN(sizeof(struct au_rdu_ent) + nlen + 1,
+		     sizeof(uint64_t));
+}
+
+union au_rdu_ent_ul {
+	struct au_rdu_ent *e;
+	uint64_t			ul;
+};
+
+enum {
+	AufsCtlRduV_SZ,
+	AufsCtlRduV_End
+};
+
+struct aufs_rdu {
+	/* input */
+	union {
+		uint64_t	sz;	/* AuCtl_RDU */
+		uint64_t	nent;	/* AuCtl_RDU_INO */
+	};
+	union au_rdu_ent_ul	ent;
+	uint16_t		verify[AufsCtlRduV_End];
+
+	/* input/output */
+	uint32_t		blk;
+
+	/* output */
+	union au_rdu_ent_ul	tail;
+	/* number of entries which were added in a single call */
+	uint64_t		rent;
+	uint8_t			full;
+	uint8_t			shwh;
+
+	struct au_rdu_cookie	cookie;
+} __aligned(8);
+
+/* ---------------------------------------------------------------------- */
+
+struct aufs_wbr_fd {
+	uint32_t	oflags;
+	int16_t		brid;
+} __aligned(8);
+
+/* ---------------------------------------------------------------------- */
+
+struct aufs_ibusy {
+	uint64_t	ino, h_ino;
+	int16_t		bindex;
+} __aligned(8);
+
+/* ---------------------------------------------------------------------- */
+
+#define AuCtlType		'A'
+#define AUFS_CTL_RDU		_IOWR(AuCtlType, AuCtl_RDU, struct aufs_rdu)
+#define AUFS_CTL_RDU_INO	_IOWR(AuCtlType, AuCtl_RDU_INO, struct aufs_rdu)
+#define AUFS_CTL_WBR_FD		_IOW(AuCtlType, AuCtl_WBR_FD, \
+				     struct aufs_wbr_fd)
+#define AUFS_CTL_IBUSY		_IOWR(AuCtlType, AuCtl_IBUSY, struct aufs_ibusy)
+
+#endif /* __AUFS_TYPE_H__ */
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
new file mode 100644
index 0000000..48c5456
--- /dev/null
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -0,0 +1,53 @@
+SUMMARY = "Tools for managing AUFS mounts"
+SECTION = "base"
+HOMEPAGE = "http://aufs.sourceforge.net/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
+
+DEPENDS = "aufs-util-native"
+DEPENDS_class-native = ""
+
+SRCREV = "f29056fe396d56fc2a06a96312feabaebbe14c59"
+SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs3.9 \
+           file://aufs-util-don-t-strip-executables.patch \
+           file://aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch \
+           file://aufs_type.h \
+"
+
+PV = "3.9+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+do_configure_append () {
+    install -d ${S}/include/linux/
+    cp ${WORKDIR}/aufs_type.h ${S}/include/linux/
+}
+
+do_configure_append_class-target () {
+    for i in ver c2sh c2tmac; do
+        cp ${STAGING_BINDIR_NATIVE}/aufs-util-${PV}/$i ./
+    done
+}
+
+do_compile () {
+    oe_runmake CPPFLAGS="-I${S}/include -I${S}/libau"
+}
+
+do_compile_class-native () {
+    oe_runmake tools CPPFLAGS="-I${S}/include -I${S}/libau"
+}
+
+do_install () {
+    oe_runmake 'DESTDIR=${D}' install_sbin install_ubin install_etc
+}
+
+do_install_class-native () {
+    install -d ${D}${bindir}/aufs-util-${PV}
+    for i in ver c2sh c2tmac; do
+        install -m 755 $i ${D}${bindir}/aufs-util-${PV}/$i
+    done
+}
+
+RRECOMMENDS_${PN} += "kernel-module-aufs"
+
+BBCLASSEXTEND = "native"
-- 
1.9.3


