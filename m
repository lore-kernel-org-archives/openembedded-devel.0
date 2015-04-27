Return-Path: <kirgene@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9464465CAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 19:41:42 +0000 (UTC)
Received: by labbd9 with SMTP id bd9so88132052lab.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oR4drfFKWyOCb7CkYX6kOb6d9fvm2I8tKoZM1RhUbM4=;
	b=dfeiiVmgGy6ErrtDbFJYxJMVJvPRdOmP5bwa1qjqrl9NBhL0Q5zxTC93gY+Ubq092f
	Lms1R3fODP7C42Ry8rkZ58xlk/zGif1bxhjbRzZyxWvmK8qqYlocBrz/u29/d3fR4pEf
	QN+qc1ycdYyCEarJtGGMln8CfaPfSLmvyjKYURI6x87ujgfuD/8EoKBwZllGZC1fu2uy
	nHD4LGRZcFMvbBKKc5eQ9BooO0YAv9mxCv5ezYo/gGbgRFqgm6sknnJ/chwU7PBH/7WD
	pnGjzpYIl9gtuyB2j3V4c9eP6cSVUvkM2UccwpyjAISNqrGrubeFq3EOa0LqE2tJSXNv
	g82A==
X-Received: by 10.112.219.201 with SMTP id pq9mr11520768lbc.109.1430163702900; 
	Mon, 27 Apr 2015 12:41:42 -0700 (PDT)
Received: from localhost.localdomain ([194.44.84.130])
	by mx.google.com with ESMTPSA id jl4sm4997000lbc.14.2015.04.27.12.41.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 12:41:41 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 22:41:36 +0300
Message-Id: <1430163696-7491-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [meta-filesystems][PATCH] aufs-util: upgrade to v3.14.
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
X-List-Received-Date: Mon, 27 Apr 2015 19:41:45 -0000

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 .../aufs-util-don-t-strip-executables.patch        |   4 +-
 .../recipes-utils/aufs-util/aufs-util/aufs_type.h  | 239 +++++++++++++++++++--
 .../recipes-utils/aufs-util/aufs-util_git.bb       |   6 +-
 3 files changed, 229 insertions(+), 20 deletions(-)

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch
index 48727e6..fe2a6a5 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs-util-don-t-strip-executables.patch
@@ -27,8 +27,8 @@ index 2f905ad..e0c6dcd 100644
  ver_test: ver
  	./ver
  
--${Bin}: LDFLAGS += -static -s
-+${Bin}: LDFLAGS += -static
+-${Bin}: override LDFLAGS += -static -s
++${Bin}: override LDFLAGS += -static
  ${Bin}: LDLIBS = -L. -lautil
  ${BinObj}: %.o: %.c ${LibUtilHdr} ${LibUtil}
  
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h
index cb439ba..c948033 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2005-2013 Junjiro R. Okajima
+ * Copyright (C) 2005-2015 Junjiro R. Okajima
  *
  * This program, aufs is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -12,8 +12,7 @@
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef __AUFS_TYPE_H__
@@ -21,12 +20,26 @@
 
 #define AUFS_NAME	"aufs"
 
+#ifdef __KERNEL__
+/*
+ * define it before including all other headers.
+ * sched.h may use pr_* macros before defining "current", so define the
+ * no-current version first, and re-define later.
+ */
+#define pr_fmt(fmt)	AUFS_NAME " %s:%d: " fmt, __func__, __LINE__
+#include <linux/sched.h>
+#undef pr_fmt
+#define pr_fmt(fmt) \
+		AUFS_NAME " %s:%d:%.*s[%d]: " fmt, __func__, __LINE__, \
+		(int)sizeof(current->comm), current->comm, current->pid
+#else
 #include <stdint.h>
 #include <sys/types.h>
+#endif /* __KERNEL__ */
 
 #include <linux/limits.h>
 
-#define AUFS_VERSION	"3.8-20130325"
+#define AUFS_VERSION	"3.18-20150406"
 
 /* todo? move this to linux-2.6.19/include/magic.h */
 #define AUFS_SUPER_MAGIC	('a' << 24 | 'u' << 16 | 'f' << 8 | 's')
@@ -47,6 +60,11 @@ typedef int16_t aufs_bindex_t;
 #endif
 #endif
 
+#ifdef __KERNEL__
+#ifndef AUFS_BRANCH_MAX
+#error unknown CONFIG_AUFS_BRANCH_MAX value
+#endif
+#endif /* __KERNEL__ */
 
 /* ---------------------------------------------------------------------- */
 
@@ -58,15 +76,15 @@ typedef int16_t aufs_bindex_t;
 #define AUFS_WH_PFX		".wh."
 #define AUFS_WH_PFX_LEN		((int)sizeof(AUFS_WH_PFX) - 1)
 #define AUFS_WH_TMP_LEN		4
-/* a limit for rmdir/rename a dir */
+/* a limit for rmdir/rename a dir and copyup */
 #define AUFS_MAX_NAMELEN	(NAME_MAX \
 				- AUFS_WH_PFX_LEN * 2	/* doubly whiteouted */\
 				- 1			/* dot */\
 				- AUFS_WH_TMP_LEN)	/* hex */
 #define AUFS_XINO_FNAME		"." AUFS_NAME ".xino"
 #define AUFS_XINO_DEFPATH	"/tmp/" AUFS_XINO_FNAME
-#define AUFS_XINO_TRUNC_INIT	64 /* blocks */
-#define AUFS_XINO_TRUNC_STEP	4  /* blocks */
+#define AUFS_XINO_DEF_SEC	30 /* seconds */
+#define AUFS_XINO_DEF_TRUNC	45 /* percentage */
 #define AUFS_DIRWH_DEF		3
 #define AUFS_RDCACHE_DEF	10 /* seconds */
 #define AUFS_RDCACHE_MAX	3600 /* seconds */
@@ -75,7 +93,8 @@ typedef int16_t aufs_bindex_t;
 #define AUFS_WKQ_NAME		AUFS_NAME "d"
 #define AUFS_MFS_DEF_SEC	30 /* seconds */
 #define AUFS_MFS_MAX_SEC	3600 /* seconds */
-#define AUFS_PLINK_WARN		100 /* number of plinks */
+#define AUFS_FHSM_CACHE_DEF_SEC	30 /* seconds */
+#define AUFS_PLINK_WARN		50 /* number of plinks in a single bucket */
 
 /* pseudo-link maintenace under /proc */
 #define AUFS_PLINK_MAINT_NAME	"plink_maint"
@@ -98,8 +117,117 @@ typedef int16_t aufs_bindex_t;
 #define AUFS_BRPERM_RW		"rw"
 #define AUFS_BRPERM_RO		"ro"
 #define AUFS_BRPERM_RR		"rr"
+#define AUFS_BRATTR_COO_REG	"coo_reg"
+#define AUFS_BRATTR_COO_ALL	"coo_all"
+#define AUFS_BRATTR_FHSM	"fhsm"
+#define AUFS_BRATTR_UNPIN	"unpin"
+#define AUFS_BRATTR_ICEX	"icex"
+#define AUFS_BRATTR_ICEX_SEC	"icexsec"
+#define AUFS_BRATTR_ICEX_SYS	"icexsys"
+#define AUFS_BRATTR_ICEX_TR	"icextr"
+#define AUFS_BRATTR_ICEX_USR	"icexusr"
+#define AUFS_BRATTR_ICEX_OTH	"icexoth"
 #define AUFS_BRRATTR_WH		"wh"
 #define AUFS_BRWATTR_NLWH	"nolwh"
+#define AUFS_BRWATTR_MOO	"moo"
+
+#define AuBrPerm_RW		1		/* writable, hardlinkable wh */
+#define AuBrPerm_RO		(1 << 1)	/* readonly */
+#define AuBrPerm_RR		(1 << 2)	/* natively readonly */
+#define AuBrPerm_Mask		(AuBrPerm_RW | AuBrPerm_RO | AuBrPerm_RR)
+
+#define AuBrAttr_COO_REG	(1 << 3)	/* copy-up on open */
+#define AuBrAttr_COO_ALL	(1 << 4)
+#define AuBrAttr_COO_Mask	(AuBrAttr_COO_REG | AuBrAttr_COO_ALL)
+
+#define AuBrAttr_FHSM		(1 << 5)	/* file-based hsm */
+#define AuBrAttr_UNPIN		(1 << 6)	/* rename-able top dir of
+						   branch. meaningless since
+						   linux-3.18-rc1 */
+
+/* ignore error in copying XATTR */
+#define AuBrAttr_ICEX_SEC	(1 << 7)
+#define AuBrAttr_ICEX_SYS	(1 << 8)
+#define AuBrAttr_ICEX_TR	(1 << 9)
+#define AuBrAttr_ICEX_USR	(1 << 10)
+#define AuBrAttr_ICEX_OTH	(1 << 11)
+#define AuBrAttr_ICEX		(AuBrAttr_ICEX_SEC	\
+				 | AuBrAttr_ICEX_SYS	\
+				 | AuBrAttr_ICEX_TR	\
+				 | AuBrAttr_ICEX_USR	\
+				 | AuBrAttr_ICEX_OTH)
+
+#define AuBrRAttr_WH		(1 << 12)	/* whiteout-able */
+#define AuBrRAttr_Mask		AuBrRAttr_WH
+
+#define AuBrWAttr_NoLinkWH	(1 << 13)	/* un-hardlinkable whiteouts */
+#define AuBrWAttr_MOO		(1 << 14)	/* move-up on open */
+#define AuBrWAttr_Mask		(AuBrWAttr_NoLinkWH | AuBrWAttr_MOO)
+
+#define AuBrAttr_CMOO_Mask	(AuBrAttr_COO_Mask | AuBrWAttr_MOO)
+
+/* #warning test userspace */
+#ifdef __KERNEL__
+#ifndef CONFIG_AUFS_FHSM
+#undef AuBrAttr_FHSM
+#define AuBrAttr_FHSM		0
+#endif
+#ifndef CONFIG_AUFS_XATTR
+#undef	AuBrAttr_ICEX
+#define AuBrAttr_ICEX		0
+#undef	AuBrAttr_ICEX_SEC
+#define AuBrAttr_ICEX_SEC	0
+#undef	AuBrAttr_ICEX_SYS
+#define AuBrAttr_ICEX_SYS	0
+#undef	AuBrAttr_ICEX_TR
+#define AuBrAttr_ICEX_TR	0
+#undef	AuBrAttr_ICEX_USR
+#define AuBrAttr_ICEX_USR	0
+#undef	AuBrAttr_ICEX_OTH
+#define AuBrAttr_ICEX_OTH	0
+#endif
+#endif
+
+/* the longest combination */
+/* AUFS_BRATTR_ICEX and AUFS_BRATTR_ICEX_TR don't affect here */
+#define AuBrPermStrSz	sizeof(AUFS_BRPERM_RW			\
+			       "+" AUFS_BRATTR_COO_REG		\
+			       "+" AUFS_BRATTR_FHSM		\
+			       "+" AUFS_BRATTR_UNPIN		\
+			       "+" AUFS_BRATTR_ICEX_SEC		\
+			       "+" AUFS_BRATTR_ICEX_SYS		\
+			       "+" AUFS_BRATTR_ICEX_USR		\
+			       "+" AUFS_BRATTR_ICEX_OTH		\
+			       "+" AUFS_BRWATTR_NLWH)
+
+typedef struct {
+	char a[AuBrPermStrSz];
+} au_br_perm_str_t;
+
+static inline int au_br_writable(int brperm)
+{
+	return brperm & AuBrPerm_RW;
+}
+
+static inline int au_br_whable(int brperm)
+{
+	return brperm & (AuBrPerm_RW | AuBrRAttr_WH);
+}
+
+static inline int au_br_wh_linkable(int brperm)
+{
+	return !(brperm & AuBrWAttr_NoLinkWH);
+}
+
+static inline int au_br_cmoo(int brperm)
+{
+	return brperm & AuBrAttr_CMOO_Mask;
+}
+
+static inline int au_br_fhsm(int brperm)
+{
+	return brperm & AuBrAttr_FHSM;
+}
 
 /* ---------------------------------------------------------------------- */
 
@@ -109,11 +237,11 @@ enum {
 	AuCtl_RDU,
 	AuCtl_RDU_INO,
 
-	/* pathconf wrapper */
-	AuCtl_WBR_FD,
-
-	/* busy inode */
-	AuCtl_IBUSY
+	AuCtl_WBR_FD,	/* pathconf wrapper */
+	AuCtl_IBUSY,	/* busy inode */
+	AuCtl_MVDOWN,	/* move-down */
+	AuCtl_BR,	/* info about branches */
+	AuCtl_FHSM_FD	/* connection for fhsm */
 };
 
 /* borrowed from linux/include/linux/kernel.h */
@@ -127,6 +255,11 @@ enum {
 #define __aligned(x)			__attribute__((aligned(x)))
 #endif
 
+#ifdef __KERNEL__
+#ifndef __packed
+#define __packed			__attribute__((packed))
+#endif
+#endif
 
 struct au_rdu_cookie {
 	uint64_t	h_pos;
@@ -145,7 +278,7 @@ struct au_rdu_ent {
 	char		name[0];
 } __aligned(8);
 
-static __inline__ int au_rdu_len(int nlen)
+static inline int au_rdu_len(int nlen)
 {
 	/* include the terminating NULL */
 	return ALIGN(sizeof(struct au_rdu_ent) + nlen + 1,
@@ -153,7 +286,7 @@ static __inline__ int au_rdu_len(int nlen)
 }
 
 union au_rdu_ent_ul {
-	struct au_rdu_ent *e;
+	struct au_rdu_ent	*e;
 	uint64_t			ul;
 };
 
@@ -200,11 +333,87 @@ struct aufs_ibusy {
 
 /* ---------------------------------------------------------------------- */
 
+/* error code for move-down */
+/* the actual message strings are implemented in aufs-util.git */
+enum {
+	EAU_MVDOWN_OPAQUE = 1,
+	EAU_MVDOWN_WHITEOUT,
+	EAU_MVDOWN_UPPER,
+	EAU_MVDOWN_BOTTOM,
+	EAU_MVDOWN_NOUPPER,
+	EAU_MVDOWN_NOLOWERBR,
+	EAU_Last
+};
+
+/* flags for move-down */
+#define AUFS_MVDOWN_DMSG	1
+#define AUFS_MVDOWN_OWLOWER	(1 << 1)	/* overwrite lower */
+#define AUFS_MVDOWN_KUPPER	(1 << 2)	/* keep upper */
+#define AUFS_MVDOWN_ROLOWER	(1 << 3)	/* do even if lower is RO */
+#define AUFS_MVDOWN_ROLOWER_R	(1 << 4)	/* did on lower RO */
+#define AUFS_MVDOWN_ROUPPER	(1 << 5)	/* do even if upper is RO */
+#define AUFS_MVDOWN_ROUPPER_R	(1 << 6)	/* did on upper RO */
+#define AUFS_MVDOWN_BRID_UPPER	(1 << 7)	/* upper brid */
+#define AUFS_MVDOWN_BRID_LOWER	(1 << 8)	/* lower brid */
+#define AUFS_MVDOWN_FHSM_LOWER	(1 << 9)	/* find fhsm attr for lower */
+#define AUFS_MVDOWN_STFS	(1 << 10)	/* req. stfs */
+#define AUFS_MVDOWN_STFS_FAILED	(1 << 11)	/* output: stfs is unusable */
+#define AUFS_MVDOWN_BOTTOM	(1 << 12)	/* output: no more lowers */
+
+/* index for move-down */
+enum {
+	AUFS_MVDOWN_UPPER,
+	AUFS_MVDOWN_LOWER,
+	AUFS_MVDOWN_NARRAY
+};
+
+/*
+ * additional info of move-down
+ * number of free blocks and inodes.
+ * subset of struct kstatfs, but smaller and always 64bit.
+ */
+struct aufs_stfs {
+	uint64_t	f_blocks;
+	uint64_t	f_bavail;
+	uint64_t	f_files;
+	uint64_t	f_ffree;
+};
+
+struct aufs_stbr {
+	int16_t			brid;	/* optional input */
+	int16_t			bindex;	/* output */
+	struct aufs_stfs	stfs;	/* output when AUFS_MVDOWN_STFS set */
+} __aligned(8);
+
+struct aufs_mvdown {
+	uint32_t		flags;			/* input/output */
+	struct aufs_stbr	stbr[AUFS_MVDOWN_NARRAY]; /* input/output */
+	int8_t			au_errno;		/* output */
+} __aligned(8);
+
+/* ---------------------------------------------------------------------- */
+
+union aufs_brinfo {
+	/* PATH_MAX may differ between kernel-space and user-space */
+	char	_spacer[4096];
+	struct {
+		int16_t	id;
+		int	perm;
+		char	path[0];
+	};
+} __aligned(8);
+
+/* ---------------------------------------------------------------------- */
+
 #define AuCtlType		'A'
 #define AUFS_CTL_RDU		_IOWR(AuCtlType, AuCtl_RDU, struct aufs_rdu)
 #define AUFS_CTL_RDU_INO	_IOWR(AuCtlType, AuCtl_RDU_INO, struct aufs_rdu)
 #define AUFS_CTL_WBR_FD		_IOW(AuCtlType, AuCtl_WBR_FD, \
 				     struct aufs_wbr_fd)
 #define AUFS_CTL_IBUSY		_IOWR(AuCtlType, AuCtl_IBUSY, struct aufs_ibusy)
+#define AUFS_CTL_MVDOWN		_IOWR(AuCtlType, AuCtl_MVDOWN, \
+				      struct aufs_mvdown)
+#define AUFS_CTL_BRINFO		_IOW(AuCtlType, AuCtl_BR, union aufs_brinfo)
+#define AUFS_CTL_FHSM_FD	_IOW(AuCtlType, AuCtl_FHSM_FD, int)
 
 #endif /* __AUFS_TYPE_H__ */
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index db3cd59..8980980 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -7,14 +7,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 DEPENDS = "aufs-util-native"
 DEPENDS_class-native = ""
 
-SRCREV = "f29056fe396d56fc2a06a96312feabaebbe14c59"
-SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs3.0 \
+SRCREV = "b59a2167a135ceea37581ee33997de278cf8a30a"
+SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs3.14 \
            file://aufs-util-don-t-strip-executables.patch \
            file://aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch \
            file://aufs_type.h \
 "
 
-PV = "3.0+git${SRCPV}"
+PV = "3.14+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


