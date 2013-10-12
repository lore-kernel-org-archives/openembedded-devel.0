Return-Path: <B40290@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe003.messaging.microsoft.com [213.199.154.206])
	by mail.openembedded.org (Postfix) with ESMTP id E42A86CF0D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 09:20:04 +0000 (UTC)
Received: from mail2-am1-R.bigfish.com (10.3.201.252) by
	AM1EHSOBE015.bigfish.com (10.3.207.137) with Microsoft SMTP Server id
	14.1.225.22; Sat, 12 Oct 2013 09:20:05 +0000
Received: from mail2-am1 (localhost [127.0.0.1])	by mail2-am1-R.bigfish.com
	(Postfix) with ESMTP id 87C6F26038F	for
	<openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 09:20:05 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h1de097h8275bhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail2-am1 (localhost.localdomain [127.0.0.1]) by mail2-am1
	(MessageSwitch) id 1381569603455427_12504;
	Sat, 12 Oct 2013 09:20:03 +0000 (UTC)
Received: from AM1EHSMHS002.bigfish.com (unknown [10.3.201.239])	by
	mail2-am1.bigfish.com (Postfix) with ESMTP id 6B4CD3A00BE	for
	<openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 09:20:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS002.bigfish.com
	(10.3.207.102) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Sat, 12 Oct 2013 09:20:03 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Sat, 12 Oct 2013 09:20:01 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r9C9Jwqu016479;	Sat, 12 Oct 2013 02:20:00 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 12 Oct 2013 17:19:53 +0800
Message-ID: <1381569593-30893-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 3/3] libhugetlbfs: install perl lib to directory perl instead of perl5
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
X-List-Received-Date: Sat, 12 Oct 2013 09:20:06 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

   *libhugetlbfs depends on perl, and perl installs a directory 'perl'
    and make a symlink 'perl5' to it. So just install perl libs in
    libhugetlbfs to directory 'perl' instead of 'perl5'. This can avoid
    the following error:
    | CalledProcessError: Command 'tar -cf - -C .../perl/5.14.3-r1/sysroot-destdir
    | -ps . | tar -xf - -C .../tmp/sysroots/t4240qds'
    | returned non-zero exit status 2 with output
    | tar: ./usr/lib/perl5: Cannot create symlink to `perl': File exists
    | tar: Exiting with failure status due to previous errors

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 ...rl-lib-to-directory-perl-instead-of-perl5.patch |   39 ++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |    4 +-
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch
new file mode 100644
index 0000000..0b8d0e4
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Inappropriate [oe-core specific]
+
+libhugetlbfs depends on perl, and perl installs a directory 'perl'
+and make a symlink 'perl5' to it. So just install perl libs in
+libhugetlbfs to directory 'perl' instead of 'perl5'. This can avoid
+the following error:
+| CalledProcessError: Command 'tar -cf - -C .../perl/5.14.3-r1/sysroot-destdir
+| -ps . | tar -xf - -C .../tmp/sysroots/t4240qds'
+| returned non-zero exit status 2 with output
+| tar: ./usr/lib/perl5: Cannot create symlink to `perl': File exists
+| tar: Exiting with failure status due to previous errors
+
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+
+--- a/Makefileold	2013-10-11 23:07:31.759421318 -0500
++++ b/Makefile	2013-10-11 23:08:01.935571122 -0500
+@@ -173,17 +173,17 @@
+ DOCDIR = $(PREFIX)/share/doc/libhugetlbfs
+ 
+ ifdef CC32
+-PMDIR = $(PREFIX)/lib/perl5/TLBC
++PMDIR = $(PREFIX)/lib/perl/TLBC
+ endif
+ 
+ ifdef CC64
+ ifeq ($(ARCH),x86_64)
+-PMDIR = $(PREFIX)/lib/perl5/TLBC
++PMDIR = $(PREFIX)/lib/perl/TLBC
+ else
+ ifeq ($(ARCH),aarch64)
+-PMDIR = $(PREFIX)/lib/perl5/TLBC
++PMDIR = $(PREFIX)/lib/perl/TLBC
+ else
+-PMDIR = $(PREFIX)/lib64/perl5/TLBC
++PMDIR = $(PREFIX)/lib64/perl/TLBC
+ endif
+ endif
+ endif
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 5b871e9..24480c3 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://fix-lib64-can-not-be-shiped-in-64bit-target.patch \
     file://tests-Makefile-install-static-4G-edge-testcases.patch \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
+    file://0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -43,10 +44,9 @@ do_install() {
 
 PARALLEL_MAKE_pn-${PN} = ""
 
-PACKAGES =+ "${PN}-perl ${PN}-tests ${PN}-perl5"
+PACKAGES =+ "${PN}-perl ${PN}-tests "
 FILES_${PN}-dbg += "${libdir}/libhugetlbfs/tests/obj32/.debug ${libdir}/libhugetlbfs/tests/obj64/.debug"
 FILES_${PN}-perl = "${libdir}/perl"
-FILES_${PN}-perl5 = "${libdir}/perl5 "
 FILES_${PN}-tests += "/opt/libhugetlbfs/tests"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
1.7.5.4



