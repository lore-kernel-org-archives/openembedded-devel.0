Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED97A76B69
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:36:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7OFaGTi028208
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Aug 2015 08:36:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 24 Aug 2015 08:36:16 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 24 Aug 2015 23:31:54 +0800
Message-ID: <1440430315-10963-4-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440430315-10963-1-git-send-email-kai.kang@windriver.com>
References: <1440430315-10963-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] ltrace: 7.2 -> 7.3
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
X-List-Received-Date: Mon, 24 Aug 2015 15:36:20 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade ltrace from 7.2 to 7.3.

* update SRC_URI and SRCREV
* drop backport patch 0001-In-Linux-backend-initialize-linkmap-struct.patch
* fix error when compile with gcc 5.2

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...n-Linux-backend-initialize-linkmap-struct.patch | 31 ------------------
 ...-ltrace-fix-gcc-5-logical-not-parentheses.patch | 38 ++++++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  8 ++---
 3 files changed, 42 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-In-Linux-backend-initialize-linkmap-struct.patch
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical-not-parentheses.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-In-Linux-backend-initialize-linkmap-struct.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-In-Linux-backend-initialize-linkmap-struct.patch
deleted file mode 100644
index 13609c1..0000000
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-In-Linux-backend-initialize-linkmap-struct.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From efd12cfb10ccd2c612838c0e22069554ce60637c Mon Sep 17 00:00:00 2001
-From: Petr Machata <pmachata@redhat.com>
-Date: Wed, 2 Jan 2013 16:01:43 +0100
-Subject: [PATCH] In Linux backend, initialize linkmap struct
-
-GCC 4.7.2 -m32 -Os gives the following (spurious) warning:
-proc.c: In function 'crawl_linkmap':
-proc.c:544:25: error: 'rlm.l_addr' may be used uninitialized in this
-
-Upstream-Status: Backport
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- sysdeps/linux-gnu/proc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sysdeps/linux-gnu/proc.c b/sysdeps/linux-gnu/proc.c
-index 6e01d28..d69c985 100644
---- a/sysdeps/linux-gnu/proc.c
-+++ b/sysdeps/linux-gnu/proc.c
-@@ -484,7 +484,7 @@ crawl_linkmap(struct process *proc, struct lt_r_debug_64 *dbg)
- 	arch_addr_t addr = (arch_addr_t)(uintptr_t)dbg->r_map;
- 
- 	while (addr != 0) {
--		struct lt_link_map_64 rlm;
-+		struct lt_link_map_64 rlm = {};
- 		if (lm_fetcher(proc)(proc, addr, &rlm) < 0) {
- 			debug(2, "Unable to read link map");
- 			return;
--- 
-2.3.5
-
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical-not-parentheses.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
new file mode 100644
index 0000000..681c43d
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
@@ -0,0 +1,38 @@
+From 876fe5680d77800426f8c4c5680a235732d722e6 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Mon, 24 Aug 2015 17:37:54 +0800
+Subject: [PATCH] ltrace: fix gcc 5 logical not parentheses
+
+Upstream-Status: Pending
+
+Build ltrace with gcc 5.2, it fails with:
+
+error: logical not is only applied to the left hand side of comparison
+[-Werror=logical-not-parentheses]
+   if (!need_data(data, offset, SIZE / 8) < 0)  \
+                                             ^
+
+Function need_data just return 0 on success and -1 if fail. So it is ok
+to just test if (need_data(data, offset, SIZE / 8) < 0).
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ ltrace-elf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ltrace-elf.c b/ltrace-elf.c
+index c571d2a..7fe830f 100644
+--- a/ltrace-elf.c
++++ b/ltrace-elf.c
+@@ -218,7 +218,7 @@ need_data(Elf_Data *data, GElf_Xword offset, GElf_Xword size)
+ 	int								\
+ 	NAME(Elf_Data *data, GElf_Xword offset, uint##SIZE##_t *retp)	\
+ 	{								\
+-		if (!need_data(data, offset, SIZE / 8) < 0)		\
++		if (need_data(data, offset, SIZE / 8) < 0)		\
+ 			return -1;					\
+ 									\
+ 		if (data->d_buf == NULL) /* NODATA section */ {		\
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index f9f1684..d8d037e 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -10,15 +10,15 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 PE = "1"
-PV = "7.2+git${SRCPV}"
-SRCREV = "f44b28421979cec88d6d6a778fc27a8cd514f508"
+PV = "7.3+git${SRCPV}"
+SRCREV = "37ecc41b58be3dbdd79592a76e331b5b371e4f81"
 
 DEPENDS = "elfutils"
 RDEPENDS_${PN} = "elfutils"
-SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git \
+SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=ltrace-0.7 \
            file://ltrace-0.7.2-unused-typedef.patch \
            file://configure-allow-to-disable-selinux-support.patch \
-           file://0001-In-Linux-backend-initialize-linkmap-struct.patch \
+           file://0001-ltrace-fix-gcc-5-logical-not-parentheses.patch \
           "
 S = "${WORKDIR}/git"
 
-- 
1.9.1


