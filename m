Return-Path: <B40290@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe002.messaging.microsoft.com [65.55.88.12])
	by mail.openembedded.org (Postfix) with ESMTP id 48E2B6CDAC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 09:00:00 +0000 (UTC)
Received: from mail243-tx2-R.bigfish.com (10.9.14.249) by
	TX2EHSOBE009.bigfish.com (10.9.40.29) with Microsoft SMTP Server id
	14.1.225.22; Sat, 12 Oct 2013 09:00:00 +0000
Received: from mail243-tx2 (localhost [127.0.0.1])	by
	mail243-tx2-R.bigfish.com (Postfix) with ESMTP id E36C616C0102	for
	<openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 09:00:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h1de097h8275bhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail243-tx2 (localhost.localdomain [127.0.0.1]) by mail243-tx2
	(MessageSwitch) id 1381568398913104_13525;
	Sat, 12 Oct 2013 08:59:58 +0000 (UTC)
Received: from TX2EHSMHS038.bigfish.com (unknown [10.9.14.251])	by
	mail243-tx2.bigfish.com (Postfix) with ESMTP id DB2071E80041	for
	<openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 08:59:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS038.bigfish.com
	(10.9.99.138) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Sat, 12 Oct 2013 08:59:53 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Sat, 12 Oct 2013 08:59:52 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r9C8xn3W010033;	Sat, 12 Oct 2013 01:59:50 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 12 Oct 2013 16:59:43 +0800
Message-ID: <1381568383-18676-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 1/3] libhugetlbfs: install static 4G-edge testcases
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
X-List-Received-Date: Sat, 12 Oct 2013 09:00:00 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

   *TESTS_64 is empty, install will fail due to missing file operand.

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../libhugetlbfs/files/install64-fix.patch         |   20 --------------------
 ...Makefile-install-static-4G-edge-testcases.patch |   17 +++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |    2 +-
 3 files changed, 18 insertions(+), 21 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/install64-fix.patch
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/install64-fix.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/install64-fix.patch
deleted file mode 100644
index 9652c3d..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/install64-fix.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Inappropriate [oe-core specific]
-
-TESTS_64 is empty, install will fail due to missing file operand
-
-
-Signed-off-by: Chunrong Guo <B40290@freescale.com>
-
-Index: git/tests/Makefile
-===================================================================
---- git.orig/tests/Makefile
-+++ git/tests/Makefile
-@@ -292,7 +292,7 @@ obj64/install:
- 	$(INSTALL) -m 755 wrapper-utils.sh $(DESTDIR)$(INST_TESTSDIR64)/obj64
- 	$(INSTALL) -m 755 $(HELPERS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
- 	$(INSTALL) -m 755 $(HELPER_LIBS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
--	$(INSTALL) -m 755 $(TESTS_64:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
-+#	$(INSTALL) -m 755 $(TESTS_64:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
- 	$(INSTALL) -m 755 run_tests.py $(DESTDIR)$(INST_TESTSDIR64)
- 
- install: $(OBJDIRS:%=%/install)
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch
new file mode 100644
index 0000000..249f6e1
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Submitted
+
+TESTS_64 is empty, install will fail due to missing file operand
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+
+--- a/tests/Makefileold	2013-10-12 02:32:55.262391998 -0500
++++ b/tests/Makefile	2013-10-12 02:33:45.929394722 -0500
+@@ -292,7 +292,7 @@
+ 	$(INSTALL) -m 755 wrapper-utils.sh $(DESTDIR)$(INST_TESTSDIR64)/obj64
+ 	$(INSTALL) -m 755 $(HELPERS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
+ 	$(INSTALL) -m 755 $(HELPER_LIBS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
+-	$(INSTALL) -m 755 $(TESTS_64:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
++	$(INSTALL) -m 755 $(TESTS_64_STATIC:%=obj64/%_static) $(DESTDIR)$(INST_TESTSDIR64)/obj64
+ 	$(INSTALL) -m 755 run_tests.py $(DESTDIR)$(INST_TESTSDIR64)
+ 
+ install: $(OBJDIRS:%=%/install)
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 7835300..475c502 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -10,10 +10,10 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://aarch64-support.patch \
     file://aarch64-unit-test-fixes.patch \
     file://add-PROT-NONE-to-the-mprotest-test.patch \
-    file://install64-fix.patch \
     file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
     file://libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
     file://fix-lib64-can-not-be-shiped-in-64bit-target.patch \
+    file://tests-Makefile-install-static-4G-edge-testcases.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.5.4



