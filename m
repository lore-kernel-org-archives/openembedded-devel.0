Return-Path: <Jianchuan.Wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7674971B89
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:03:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9Q83uo3006959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2016 01:03:57 -0700 (PDT)
Received: from PEK-JWANG7-D1.wrs.com (128.224.162.170) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Oct 2016 01:03:55 -0700
From: <jianchuan.wang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Oct 2016 16:03:54 +0800
Message-ID: <1477469034-23992-1-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] netmap: Rename the _count to _recount for kernel v4.8
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
X-List-Received-Date: Wed, 26 Oct 2016 08:03:58 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Rename the _count to _recount since Adjusting the member of struct page
in the kernel v4.8

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 ...0001-netmap-Rename-the-_conut-to-_recount.patch | 31 ++++++++++++++++++++++
 .../recipes-kernel/netmap/netmap-modules_git.bb    |  2 ++
 .../recipes-kernel/netmap/netmap_git.bb            |  2 --
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-kernel/netmap/files/0001-netmap-Rename-the-_conut-to-_recount.patch

diff --git a/meta-networking/recipes-kernel/netmap/files/0001-netmap-Rename-the-_conut-to-_recount.patch b/meta-networking/recipes-kernel/netmap/files/0001-netmap-Rename-the-_conut-to-_recount.patch
new file mode 100644
index 0000000..4a92a13
--- /dev/null
+++ b/meta-networking/recipes-kernel/netmap/files/0001-netmap-Rename-the-_conut-to-_recount.patch
@@ -0,0 +1,31 @@
+From 3de3d534c0b85f2d0378f699160e1a026a7317a7 Mon Sep 17 00:00:00 2001
+From: Jianchuan Wang <jianchuan.wang@windriver.com>
+Date: Wed, 26 Oct 2016 03:11:27 -0400
+Subject: [PATCH] netmap: Rename the _conut to _recount
+
+Rename the _count into _refcount since Adjusting the member of
+struct page in the kernel v4.8.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+---
+ LINUX/bsd_glue.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/LINUX/bsd_glue.h b/LINUX/bsd_glue.h
+index 9a116a0..8df6838 100644
+--- a/LINUX/bsd_glue.h
++++ b/LINUX/bsd_glue.h
+@@ -130,7 +130,7 @@ struct net_device_ops {
+ 	do {						  \
+ 		int i_;					  \
+ 		for (i_ = 1; i_ < (1 << (order)); i_++)	  \
+-			atomic_set(&(page)[i_]._count, 1);\
++			atomic_set(&(page)[i_]._refcount, 1);\
+ 	} while (0)
+ #endif /* HAVE_SPLIT_PAGE */
+ 
+-- 
+2.8.1
+
diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index e9eea56..009f9bc 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -44,6 +44,8 @@ python __anonymous () {
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
 
+SRC_URI += "file://0001-netmap-Rename-the-_conut-to-_recount.patch"
+
 do_configure () {
     cd ${S}/LINUX
     ./configure ${EXTRA_OECONF}
diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-networking/recipes-kernel/netmap/netmap_git.bb
index 667e7cc..a5bc57a 100644
--- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
@@ -33,5 +33,3 @@ FILES_${PN} += "${bindir}"
 RDEPENDS_${PN} = "kernel-module-netmap"
 RRECOMMENDS_${PN} = "kernel-module-netmap"
 
-# http://errors.yoctoproject.org/Errors/Details/69733/
-PNBLACKLIST[netmap] ?= "BROKEN: Tries to build kernel module and fails, either it should be disabled or there should be dependency on kernel like in netmap-modules"
-- 
2.7.4


