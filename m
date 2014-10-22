Return-Path: <Hongjun.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35B7260097
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 09:57:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9M9vTvX012353
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 02:57:30 -0700 (PDT)
Received: from pek-lpgtest9.wrs.com (128.224.153.89) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 22 Oct 2014 02:57:29 -0700
From: Hongjun Yang <Hongjun.Yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Oct 2014 17:57:27 +0800
Message-ID: <1413971847-8154-1-git-send-email-Hongjun.Yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] tree: Add a new package
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
X-List-Received-Date: Wed, 22 Oct 2014 09:57:34 -0000
Content-Type: text/plain

From: "Hongjun.Yang" <hongjun.yang@windriver.com>

Add tree command, some test scripts need it.

Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>

---
 .../tree/tree-1.7.0/fix-cross-env.patch            | 32 ++++++++++++++++++++++
 meta-oe/recipes-support/tree/tree_1.7.0.bb         | 16 +++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
 create mode 100644 meta-oe/recipes-support/tree/tree_1.7.0.bb

diff --git a/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
new file mode 100644
index 0000000..ccdf635
--- /dev/null
+++ b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
@@ -0,0 +1,32 @@
+From 7ad835ae0c2b2b311002fda0be2dbf8f17c5a3d5 Mon Sep 17 00:00:00 2001
+From: "Hongjun.Yang" <hongjun.yang@windriver.com>
+Date: Wed, 22 Oct 2014 11:05:35 +0800
+Subject: [PATCH] fix the install path change the install path for cross
+ compile environment.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index e91f1f6..776f1f3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -22,9 +22,9 @@ CC=gcc
+ 
+ VERSION=1.7.0
+ TREE_DEST=tree
+-BINDIR=${prefix}/bin
++BINDIR=${DESTDIR}/${prefix}/bin
+ MAN=tree.1
+-MANDIR=${prefix}/man/man1
++MANDIR=${DESTDIR}/${prefix}/man/man1
+ OBJS=tree.o unix.o html.o xml.o json.o hash.o color.o
+ 
+ # Uncomment options below for your particular OS:
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/tree/tree_1.7.0.bb b/meta-oe/recipes-support/tree/tree_1.7.0.bb
new file mode 100644
index 0000000..b7fc43b
--- /dev/null
+++ b/meta-oe/recipes-support/tree/tree_1.7.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "This is a handy little utility to display a tree view of directories."
+HOMEPAGE = "http://mama.indstate.edu/users/ice/tree/"
+LICENSE="GPLv2"
+SECTION = "console/utils"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
+
+inherit autotools-brokensep
+
+FILES_${PN}-doc += "${prefix}/man"
+
+SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/tree-1.7.0.tgz \
+	   file://fix-cross-env.patch \
+	  "
+
+SRC_URI[md5sum] = "abe3e03e469c542d8e157cdd93f4d8a6"
+SRC_URI[sha256sum] = "6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12"
-- 
1.9.1


