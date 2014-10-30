Return-Path: <Hongjun.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BDE7065C87
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 13:24:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9UDOO9R019910
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 06:24:24 -0700 (PDT)
Received: from pek-lpgtest9.wrs.com (128.224.153.89) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 30 Oct 2014 06:24:23 -0700
From: Hongjun Yang <Hongjun.Yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Oct 2014 21:24:22 +0800
Message-ID: <1414675462-19999-1-git-send-email-Hongjun.Yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH V3] tree: Add a new package
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
X-List-Received-Date: Thu, 30 Oct 2014 13:24:29 -0000
Content-Type: text/plain

From: "Hongjun.Yang" <hongjun.yang@windriver.com>

Add tree command, some ptest cases need it.

Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>

---
 .../tree/tree-1.7.0/fix-cross-env.patch            | 36 ++++++++++++++++++++++
 meta-oe/recipes-support/tree/tree_1.7.0.bb         | 16 ++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
 create mode 100644 meta-oe/recipes-support/tree/tree_1.7.0.bb

diff --git a/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
new file mode 100644
index 0000000..d0118f6
--- /dev/null
+++ b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
@@ -0,0 +1,36 @@
+From 945a5861bb19a34d31119bc38f813513296ce2ad Mon Sep 17 00:00:00 2001
+From: "Hongjun.Yang" <hongjun.yang@windriver.com>
+Date: Thu, 30 Oct 2014 20:38:06 +0800
+Subject: [PATCH] Fix the cross-compiling issue
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index e91f1f6..e496a52 100644
+--- a/Makefile
++++ b/Makefile
+@@ -18,13 +18,13 @@
+ 
+ prefix = /usr
+ 
+-CC=gcc
++#CC=gcc
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
index 0000000..c1c3a8b
--- /dev/null
+++ b/meta-oe/recipes-support/tree/tree_1.7.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "This is a handy little utility to display a tree view of directories."
+HOMEPAGE = "http://mama.indstate.edu/users/ice/tree/"
+SECTION = "console/utils"
+LICENSE="GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
+
+inherit autotools-brokensep
+
+SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/tree-1.7.0.tgz \
+	   file://fix-cross-env.patch \
+	  "
+
+SRC_URI[md5sum] = "abe3e03e469c542d8e157cdd93f4d8a6"
+SRC_URI[sha256sum] = "6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12"
+
+FILES_${PN}-doc += "${prefix}/man"
-- 
1.9.1


