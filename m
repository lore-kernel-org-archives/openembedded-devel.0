Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4523178233
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:35:14 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id z6so11829239pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 11:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NDLVWdHJwuLJUpjdBSuCkOLzxGj1Td0nItGnIAOOMwg=;
	b=fkYIch7yI3rgYrji2pXh4cGRrlgp+TdjWgoLxOCG4QtLDUd09fVE7eu6cOpHfS1SjZ
	cny/teptBd/dDACPIMCmrfgoG1GJSZnQSihzMA2Ji/XjfwwoBENXuMmZuNH6owATslCF
	2mb9yUa2HYqM+OSoNJx0nDD+x4OZNYhbfbOLL/sXQeu7xeZVisRs/klNdDat2FoIDzOT
	adhlYfn90A+wfBFZIqlQpEgkPvy+8KvCzTekrWbbDXAceR+l6Ao9yRAipj8rrn46FgBB
	jhzn3E8j5jn7S6EKm9A3M/yFUhEPpuJdpgCnqrTMQ6fDqA5YUnNdS19XpItxOdEosiEt
	Nt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NDLVWdHJwuLJUpjdBSuCkOLzxGj1Td0nItGnIAOOMwg=;
	b=iir3SXnLTBEajCS3cJ8xjU5aQx5jx88m01HEfunBSRjCGLKW1osBmtcfpnDcOKfYCK
	Qaq1lRejQtwHU8zapS5+Ucbfb21nKi38GBcY3WOCfZ1k8dT48j+xwwZOLBPD2XQK3p6m
	8AZmqKOk0+vMwdFhOpV9GJK/APcCQzhxE7PrEJKC9y8ThYLv5cSONCuB8qGGnDAyhGtG
	nmJpINsy/cdKlQFAdHShzVDGItTnF9TsTN7zWC+1eSOtIx/N8ZQ/MC70Cxx1uCml8h5F
	5ZLDhVK0O+6Mbm7dskHEm5PwPrXMiz4bWUjfujop5bvFgf9gXf3YxBF8yU4e9yFlWX8N
	xWtA==
X-Gm-Message-State: AIVw112XN7ynScJnXf6riWwrP5bk5SefjFTYJ7PmVpemOu6ClkmPp6O8
	61gh/3fMtSqmlkiW
X-Received: by 10.99.148.26 with SMTP id m26mr6839129pge.222.1500057315413;
	Fri, 14 Jul 2017 11:35:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	70sm18639581pft.104.2017.07.14.11.35.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 11:35:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jul 2017 11:34:56 -0700
Message-Id: <20170714183456.22548-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170714183456.22548-1-raj.khem@gmail.com>
References: <20170714183456.22548-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 6/6] aufs-util: Upgrade to 4.4 release
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
X-List-Received-Date: Fri, 14 Jul 2017 18:35:14 -0000

- Download aufs_type.h instead of housing a local copy
- Build uses paste utility from coreutils-native
- Replace hardcoded strip command with STRIP env varible
  helps in cross compiling

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-utils/aufs-util/aufs-util/aufs_type.h  | 419 ---------------------
 .../recipes-utils/aufs-util/aufs-util_git.bb       |  17 +-
 2 files changed, 10 insertions(+), 426 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h b/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h
deleted file mode 100644
index c948033a4..000000000
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util/aufs_type.h
+++ /dev/null
@@ -1,419 +0,0 @@
-/*
- * Copyright (C) 2005-2015 Junjiro R. Okajima
- *
- * This program, aufs is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef __AUFS_TYPE_H__
-#define __AUFS_TYPE_H__
-
-#define AUFS_NAME	"aufs"
-
-#ifdef __KERNEL__
-/*
- * define it before including all other headers.
- * sched.h may use pr_* macros before defining "current", so define the
- * no-current version first, and re-define later.
- */
-#define pr_fmt(fmt)	AUFS_NAME " %s:%d: " fmt, __func__, __LINE__
-#include <linux/sched.h>
-#undef pr_fmt
-#define pr_fmt(fmt) \
-		AUFS_NAME " %s:%d:%.*s[%d]: " fmt, __func__, __LINE__, \
-		(int)sizeof(current->comm), current->comm, current->pid
-#else
-#include <stdint.h>
-#include <sys/types.h>
-#endif /* __KERNEL__ */
-
-#include <linux/limits.h>
-
-#define AUFS_VERSION	"3.18-20150406"
-
-/* todo? move this to linux-2.6.19/include/magic.h */
-#define AUFS_SUPER_MAGIC	('a' << 24 | 'u' << 16 | 'f' << 8 | 's')
-
-/* ---------------------------------------------------------------------- */
-
-#ifdef CONFIG_AUFS_BRANCH_MAX_127
-typedef int8_t aufs_bindex_t;
-#define AUFS_BRANCH_MAX 127
-#else
-typedef int16_t aufs_bindex_t;
-#ifdef CONFIG_AUFS_BRANCH_MAX_511
-#define AUFS_BRANCH_MAX 511
-#elif defined(CONFIG_AUFS_BRANCH_MAX_1023)
-#define AUFS_BRANCH_MAX 1023
-#elif defined(CONFIG_AUFS_BRANCH_MAX_32767)
-#define AUFS_BRANCH_MAX 32767
-#endif
-#endif
-
-#ifdef __KERNEL__
-#ifndef AUFS_BRANCH_MAX
-#error unknown CONFIG_AUFS_BRANCH_MAX value
-#endif
-#endif /* __KERNEL__ */
-
-/* ---------------------------------------------------------------------- */
-
-#define AUFS_FSTYPE		AUFS_NAME
-
-#define AUFS_ROOT_INO		2
-#define AUFS_FIRST_INO		11
-
-#define AUFS_WH_PFX		".wh."
-#define AUFS_WH_PFX_LEN		((int)sizeof(AUFS_WH_PFX) - 1)
-#define AUFS_WH_TMP_LEN		4
-/* a limit for rmdir/rename a dir and copyup */
-#define AUFS_MAX_NAMELEN	(NAME_MAX \
-				- AUFS_WH_PFX_LEN * 2	/* doubly whiteouted */\
-				- 1			/* dot */\
-				- AUFS_WH_TMP_LEN)	/* hex */
-#define AUFS_XINO_FNAME		"." AUFS_NAME ".xino"
-#define AUFS_XINO_DEFPATH	"/tmp/" AUFS_XINO_FNAME
-#define AUFS_XINO_DEF_SEC	30 /* seconds */
-#define AUFS_XINO_DEF_TRUNC	45 /* percentage */
-#define AUFS_DIRWH_DEF		3
-#define AUFS_RDCACHE_DEF	10 /* seconds */
-#define AUFS_RDCACHE_MAX	3600 /* seconds */
-#define AUFS_RDBLK_DEF		512 /* bytes */
-#define AUFS_RDHASH_DEF		32
-#define AUFS_WKQ_NAME		AUFS_NAME "d"
-#define AUFS_MFS_DEF_SEC	30 /* seconds */
-#define AUFS_MFS_MAX_SEC	3600 /* seconds */
-#define AUFS_FHSM_CACHE_DEF_SEC	30 /* seconds */
-#define AUFS_PLINK_WARN		50 /* number of plinks in a single bucket */
-
-/* pseudo-link maintenace under /proc */
-#define AUFS_PLINK_MAINT_NAME	"plink_maint"
-#define AUFS_PLINK_MAINT_DIR	"fs/" AUFS_NAME
-#define AUFS_PLINK_MAINT_PATH	AUFS_PLINK_MAINT_DIR "/" AUFS_PLINK_MAINT_NAME
-
-#define AUFS_DIROPQ_NAME	AUFS_WH_PFX ".opq" /* whiteouted doubly */
-#define AUFS_WH_DIROPQ		AUFS_WH_PFX AUFS_DIROPQ_NAME
-
-#define AUFS_BASE_NAME		AUFS_WH_PFX AUFS_NAME
-#define AUFS_PLINKDIR_NAME	AUFS_WH_PFX "plnk"
-#define AUFS_ORPHDIR_NAME	AUFS_WH_PFX "orph"
-
-/* doubly whiteouted */
-#define AUFS_WH_BASE		AUFS_WH_PFX AUFS_BASE_NAME
-#define AUFS_WH_PLINKDIR	AUFS_WH_PFX AUFS_PLINKDIR_NAME
-#define AUFS_WH_ORPHDIR		AUFS_WH_PFX AUFS_ORPHDIR_NAME
-
-/* branch permissions and attributes */
-#define AUFS_BRPERM_RW		"rw"
-#define AUFS_BRPERM_RO		"ro"
-#define AUFS_BRPERM_RR		"rr"
-#define AUFS_BRATTR_COO_REG	"coo_reg"
-#define AUFS_BRATTR_COO_ALL	"coo_all"
-#define AUFS_BRATTR_FHSM	"fhsm"
-#define AUFS_BRATTR_UNPIN	"unpin"
-#define AUFS_BRATTR_ICEX	"icex"
-#define AUFS_BRATTR_ICEX_SEC	"icexsec"
-#define AUFS_BRATTR_ICEX_SYS	"icexsys"
-#define AUFS_BRATTR_ICEX_TR	"icextr"
-#define AUFS_BRATTR_ICEX_USR	"icexusr"
-#define AUFS_BRATTR_ICEX_OTH	"icexoth"
-#define AUFS_BRRATTR_WH		"wh"
-#define AUFS_BRWATTR_NLWH	"nolwh"
-#define AUFS_BRWATTR_MOO	"moo"
-
-#define AuBrPerm_RW		1		/* writable, hardlinkable wh */
-#define AuBrPerm_RO		(1 << 1)	/* readonly */
-#define AuBrPerm_RR		(1 << 2)	/* natively readonly */
-#define AuBrPerm_Mask		(AuBrPerm_RW | AuBrPerm_RO | AuBrPerm_RR)
-
-#define AuBrAttr_COO_REG	(1 << 3)	/* copy-up on open */
-#define AuBrAttr_COO_ALL	(1 << 4)
-#define AuBrAttr_COO_Mask	(AuBrAttr_COO_REG | AuBrAttr_COO_ALL)
-
-#define AuBrAttr_FHSM		(1 << 5)	/* file-based hsm */
-#define AuBrAttr_UNPIN		(1 << 6)	/* rename-able top dir of
-						   branch. meaningless since
-						   linux-3.18-rc1 */
-
-/* ignore error in copying XATTR */
-#define AuBrAttr_ICEX_SEC	(1 << 7)
-#define AuBrAttr_ICEX_SYS	(1 << 8)
-#define AuBrAttr_ICEX_TR	(1 << 9)
-#define AuBrAttr_ICEX_USR	(1 << 10)
-#define AuBrAttr_ICEX_OTH	(1 << 11)
-#define AuBrAttr_ICEX		(AuBrAttr_ICEX_SEC	\
-				 | AuBrAttr_ICEX_SYS	\
-				 | AuBrAttr_ICEX_TR	\
-				 | AuBrAttr_ICEX_USR	\
-				 | AuBrAttr_ICEX_OTH)
-
-#define AuBrRAttr_WH		(1 << 12)	/* whiteout-able */
-#define AuBrRAttr_Mask		AuBrRAttr_WH
-
-#define AuBrWAttr_NoLinkWH	(1 << 13)	/* un-hardlinkable whiteouts */
-#define AuBrWAttr_MOO		(1 << 14)	/* move-up on open */
-#define AuBrWAttr_Mask		(AuBrWAttr_NoLinkWH | AuBrWAttr_MOO)
-
-#define AuBrAttr_CMOO_Mask	(AuBrAttr_COO_Mask | AuBrWAttr_MOO)
-
-/* #warning test userspace */
-#ifdef __KERNEL__
-#ifndef CONFIG_AUFS_FHSM
-#undef AuBrAttr_FHSM
-#define AuBrAttr_FHSM		0
-#endif
-#ifndef CONFIG_AUFS_XATTR
-#undef	AuBrAttr_ICEX
-#define AuBrAttr_ICEX		0
-#undef	AuBrAttr_ICEX_SEC
-#define AuBrAttr_ICEX_SEC	0
-#undef	AuBrAttr_ICEX_SYS
-#define AuBrAttr_ICEX_SYS	0
-#undef	AuBrAttr_ICEX_TR
-#define AuBrAttr_ICEX_TR	0
-#undef	AuBrAttr_ICEX_USR
-#define AuBrAttr_ICEX_USR	0
-#undef	AuBrAttr_ICEX_OTH
-#define AuBrAttr_ICEX_OTH	0
-#endif
-#endif
-
-/* the longest combination */
-/* AUFS_BRATTR_ICEX and AUFS_BRATTR_ICEX_TR don't affect here */
-#define AuBrPermStrSz	sizeof(AUFS_BRPERM_RW			\
-			       "+" AUFS_BRATTR_COO_REG		\
-			       "+" AUFS_BRATTR_FHSM		\
-			       "+" AUFS_BRATTR_UNPIN		\
-			       "+" AUFS_BRATTR_ICEX_SEC		\
-			       "+" AUFS_BRATTR_ICEX_SYS		\
-			       "+" AUFS_BRATTR_ICEX_USR		\
-			       "+" AUFS_BRATTR_ICEX_OTH		\
-			       "+" AUFS_BRWATTR_NLWH)
-
-typedef struct {
-	char a[AuBrPermStrSz];
-} au_br_perm_str_t;
-
-static inline int au_br_writable(int brperm)
-{
-	return brperm & AuBrPerm_RW;
-}
-
-static inline int au_br_whable(int brperm)
-{
-	return brperm & (AuBrPerm_RW | AuBrRAttr_WH);
-}
-
-static inline int au_br_wh_linkable(int brperm)
-{
-	return !(brperm & AuBrWAttr_NoLinkWH);
-}
-
-static inline int au_br_cmoo(int brperm)
-{
-	return brperm & AuBrAttr_CMOO_Mask;
-}
-
-static inline int au_br_fhsm(int brperm)
-{
-	return brperm & AuBrAttr_FHSM;
-}
-
-/* ---------------------------------------------------------------------- */
-
-/* ioctl */
-enum {
-	/* readdir in userspace */
-	AuCtl_RDU,
-	AuCtl_RDU_INO,
-
-	AuCtl_WBR_FD,	/* pathconf wrapper */
-	AuCtl_IBUSY,	/* busy inode */
-	AuCtl_MVDOWN,	/* move-down */
-	AuCtl_BR,	/* info about branches */
-	AuCtl_FHSM_FD	/* connection for fhsm */
-};
-
-/* borrowed from linux/include/linux/kernel.h */
-#ifndef ALIGN
-#define ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a)-1)
-#define __ALIGN_MASK(x, mask)	(((x)+(mask))&~(mask))
-#endif
-
-/* borrowed from linux/include/linux/compiler-gcc3.h */
-#ifndef __aligned
-#define __aligned(x)			__attribute__((aligned(x)))
-#endif
-
-#ifdef __KERNEL__
-#ifndef __packed
-#define __packed			__attribute__((packed))
-#endif
-#endif
-
-struct au_rdu_cookie {
-	uint64_t	h_pos;
-	int16_t		bindex;
-	uint8_t		flags;
-	uint8_t		pad;
-	uint32_t	generation;
-} __aligned(8);
-
-struct au_rdu_ent {
-	uint64_t	ino;
-	int16_t		bindex;
-	uint8_t		type;
-	uint8_t		nlen;
-	uint8_t		wh;
-	char		name[0];
-} __aligned(8);
-
-static inline int au_rdu_len(int nlen)
-{
-	/* include the terminating NULL */
-	return ALIGN(sizeof(struct au_rdu_ent) + nlen + 1,
-		     sizeof(uint64_t));
-}
-
-union au_rdu_ent_ul {
-	struct au_rdu_ent	*e;
-	uint64_t			ul;
-};
-
-enum {
-	AufsCtlRduV_SZ,
-	AufsCtlRduV_End
-};
-
-struct aufs_rdu {
-	/* input */
-	union {
-		uint64_t	sz;	/* AuCtl_RDU */
-		uint64_t	nent;	/* AuCtl_RDU_INO */
-	};
-	union au_rdu_ent_ul	ent;
-	uint16_t		verify[AufsCtlRduV_End];
-
-	/* input/output */
-	uint32_t		blk;
-
-	/* output */
-	union au_rdu_ent_ul	tail;
-	/* number of entries which were added in a single call */
-	uint64_t		rent;
-	uint8_t			full;
-	uint8_t			shwh;
-
-	struct au_rdu_cookie	cookie;
-} __aligned(8);
-
-/* ---------------------------------------------------------------------- */
-
-struct aufs_wbr_fd {
-	uint32_t	oflags;
-	int16_t		brid;
-} __aligned(8);
-
-/* ---------------------------------------------------------------------- */
-
-struct aufs_ibusy {
-	uint64_t	ino, h_ino;
-	int16_t		bindex;
-} __aligned(8);
-
-/* ---------------------------------------------------------------------- */
-
-/* error code for move-down */
-/* the actual message strings are implemented in aufs-util.git */
-enum {
-	EAU_MVDOWN_OPAQUE = 1,
-	EAU_MVDOWN_WHITEOUT,
-	EAU_MVDOWN_UPPER,
-	EAU_MVDOWN_BOTTOM,
-	EAU_MVDOWN_NOUPPER,
-	EAU_MVDOWN_NOLOWERBR,
-	EAU_Last
-};
-
-/* flags for move-down */
-#define AUFS_MVDOWN_DMSG	1
-#define AUFS_MVDOWN_OWLOWER	(1 << 1)	/* overwrite lower */
-#define AUFS_MVDOWN_KUPPER	(1 << 2)	/* keep upper */
-#define AUFS_MVDOWN_ROLOWER	(1 << 3)	/* do even if lower is RO */
-#define AUFS_MVDOWN_ROLOWER_R	(1 << 4)	/* did on lower RO */
-#define AUFS_MVDOWN_ROUPPER	(1 << 5)	/* do even if upper is RO */
-#define AUFS_MVDOWN_ROUPPER_R	(1 << 6)	/* did on upper RO */
-#define AUFS_MVDOWN_BRID_UPPER	(1 << 7)	/* upper brid */
-#define AUFS_MVDOWN_BRID_LOWER	(1 << 8)	/* lower brid */
-#define AUFS_MVDOWN_FHSM_LOWER	(1 << 9)	/* find fhsm attr for lower */
-#define AUFS_MVDOWN_STFS	(1 << 10)	/* req. stfs */
-#define AUFS_MVDOWN_STFS_FAILED	(1 << 11)	/* output: stfs is unusable */
-#define AUFS_MVDOWN_BOTTOM	(1 << 12)	/* output: no more lowers */
-
-/* index for move-down */
-enum {
-	AUFS_MVDOWN_UPPER,
-	AUFS_MVDOWN_LOWER,
-	AUFS_MVDOWN_NARRAY
-};
-
-/*
- * additional info of move-down
- * number of free blocks and inodes.
- * subset of struct kstatfs, but smaller and always 64bit.
- */
-struct aufs_stfs {
-	uint64_t	f_blocks;
-	uint64_t	f_bavail;
-	uint64_t	f_files;
-	uint64_t	f_ffree;
-};
-
-struct aufs_stbr {
-	int16_t			brid;	/* optional input */
-	int16_t			bindex;	/* output */
-	struct aufs_stfs	stfs;	/* output when AUFS_MVDOWN_STFS set */
-} __aligned(8);
-
-struct aufs_mvdown {
-	uint32_t		flags;			/* input/output */
-	struct aufs_stbr	stbr[AUFS_MVDOWN_NARRAY]; /* input/output */
-	int8_t			au_errno;		/* output */
-} __aligned(8);
-
-/* ---------------------------------------------------------------------- */
-
-union aufs_brinfo {
-	/* PATH_MAX may differ between kernel-space and user-space */
-	char	_spacer[4096];
-	struct {
-		int16_t	id;
-		int	perm;
-		char	path[0];
-	};
-} __aligned(8);
-
-/* ---------------------------------------------------------------------- */
-
-#define AuCtlType		'A'
-#define AUFS_CTL_RDU		_IOWR(AuCtlType, AuCtl_RDU, struct aufs_rdu)
-#define AUFS_CTL_RDU_INO	_IOWR(AuCtlType, AuCtl_RDU_INO, struct aufs_rdu)
-#define AUFS_CTL_WBR_FD		_IOW(AuCtlType, AuCtl_WBR_FD, \
-				     struct aufs_wbr_fd)
-#define AUFS_CTL_IBUSY		_IOWR(AuCtlType, AuCtl_IBUSY, struct aufs_ibusy)
-#define AUFS_CTL_MVDOWN		_IOWR(AuCtlType, AuCtl_MVDOWN, \
-				      struct aufs_mvdown)
-#define AUFS_CTL_BRINFO		_IOW(AuCtlType, AuCtl_BR, union aufs_brinfo)
-#define AUFS_CTL_FHSM_FD	_IOW(AuCtlType, AuCtl_FHSM_FD, int)
-
-#endif /* __AUFS_TYPE_H__ */
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 1e8677574..66f560c37 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -4,37 +4,40 @@ HOMEPAGE = "http://aufs.sourceforge.net/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
-DEPENDS = "aufs-util-native"
+DEPENDS = "coreutils-native aufs-util-native"
 DEPENDS_class-native = ""
 
-SRCREV = "bdfcc0dcfc6113146e928f85145dbd2cf9b0e080"
-SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs3.18 \
+SRCREV = "89afb1806c3d2eed8db2666ae254b77518ae3ceb"
+SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs4.4 \
+           https://raw.githubusercontent.com/sfjro/aufs4-linux/aufs4.4/include/uapi/linux/aufs_type.h;name=aufs_type \
            file://aufs-util-don-t-strip-executables.patch \
            file://aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch \
-           file://aufs_type.h \
 "
+SRC_URI[aufs_type.md5sum] = "f7b4a255dcb55fe7b0967f5f59b44f19"
+SRC_URI[aufs_type.sha256sum] = "85bc8e4c1a94a7d526c382e4b047b4256cab8c4a65fc0396291707ad9a327a18"
 
-PV = "3.14+git${SRCPV}"
+PV = "4.4+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 export HOSTCC = "${BUILD_CC}"
-
 do_configure_prepend() {
    # Replace sbin,bin paths with bitbake environment
    sed -i -e 's;install_sbin: Tgt = ${DESTDIR}/sbin;install_sbin: Tgt = ${DESTDIR}/${base_sbindir};' \
           -e 's;install_ubin: Tgt = ${DESTDIR}/usr/sbin;install_sbin: Tgt = ${DESTDIR}/${bindir};' \
 	  ${S}/Makefile
+   sed -i -e 's;strip -R;${STRIP} -R;' ${S}/libau/Makefile
 }
 
 do_configure_append () {
     install -d ${S}/include/linux/
     cp ${WORKDIR}/aufs_type.h ${S}/include/linux/
+    sed -i -e 's;__user;;' ${S}/include/linux/aufs_type.h
 }
 
 do_configure_append_class-target () {
     for i in ver c2sh c2tmac; do
-        cp ${STAGING_BINDIR_NATIVE}/aufs-util-*/$i ${B}
+        cp ${STAGING_BINDIR_NATIVE}/aufs-util-${PV}/$i ${B}
     done
 }
 
-- 
2.13.3


