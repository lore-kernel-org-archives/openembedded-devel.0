Return-Path: <B40290@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe010.messaging.microsoft.com [216.32.180.30])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC056CF0D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 09:06:53 +0000 (UTC)
Received: from mail7-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE001.bigfish.com (10.7.40.21) with Microsoft SMTP Server id
	14.1.225.22; Sat, 12 Oct 2013 09:06:52 +0000
Received: from mail7-va3 (localhost [127.0.0.1])	by mail7-va3-R.bigfish.com
	(Postfix) with ESMTP id 7206C2E0097	for
	<openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 09:06:52 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h1de097h8275bhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail7-va3 (localhost.localdomain [127.0.0.1]) by mail7-va3
	(MessageSwitch) id 1381568809804751_24129;
	Sat, 12 Oct 2013 09:06:49 +0000 (UTC)
Received: from VA3EHSMHS007.bigfish.com (unknown [10.7.14.254])	by
	mail7-va3.bigfish.com (Postfix) with ESMTP id B1BA922004B	for
	<openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 09:06:49 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS007.bigfish.com
	(10.7.99.17) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Sat, 12 Oct 2013 09:06:49 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Sat, 12 Oct 2013 09:06:48 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r9C96jhO013395;	Sat, 12 Oct 2013 02:06:46 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 12 Oct 2013 17:06:42 +0800
Message-ID: <1381568802-9845-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 2/3] libhugetlbfs: not use hard coded path in run_tests.py
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
X-List-Received-Date: Sat, 12 Oct 2013 09:06:54 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  *Hard coded path makes the script impossible to run out of source tree.
  *After 'make install', we can use hugeadm utility under DESTDIR.

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 ....py-not-use-hard-coded-path-.-obj-hugeadm.patch |   43 ++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |    1 +
 2 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
new file mode 100644
index 0000000..3082d7e
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
@@ -0,0 +1,43 @@
+From a85fc43243f8bfad12d306a4a0e230fb8b3e828a Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Wed, 21 Aug 2013 15:44:57 +0800
+Subject: [PATCH] run_test.py: not use hard coded path ../obj/hugeadm
+
+Hard coded path makes the script impossible to run out of source tree.
+After 'make install', we can use hugeadm utility under DESTDIR.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ tests/run_tests.py |   12 +++++++++++-
+ 1 files changed, 11 insertions(+), 1 deletions(-)
+
+diff --git a/tests/run_tests.py b/tests/run_tests.py
+index d9a6b35..a9bab8f 100755
+--- a/tests/run_tests.py
++++ b/tests/run_tests.py
+@@ -232,9 +232,19 @@ def get_pagesizes():
+     Use libhugetlbfs' hugeadm utility to get a list of page sizes that have
+     active mount points and at least one huge page allocated to the pool.
+     """
++    local_env = os.environ.copy()
++    local_env["PATH"] = "../obj:%s" % local_env.get("PATH", "")
+     sizes = set()
+     out = ""
+-    (rc, out) = bash("../obj/hugeadm --page-sizes")
++    try:
++        p = subprocess.Popen("hugeadm --page-sizes", shell=True, env=local_env, stdout=subprocess.PIPE)
++        rc = p.wait()
++    except KeyboardInterrupt:
++        return sizes
++    except OSError:
++        return sizes
++    out = p.stdout.read().strip()
++
+     if rc != 0 or out == "": return sizes
+ 
+     for size in out.split("\n"): sizes.add(int(size))
+-- 
+1.7.3.4
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 475c502..5b871e9 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
     file://fix-lib64-can-not-be-shiped-in-64bit-target.patch \
     file://tests-Makefile-install-static-4G-edge-testcases.patch \
+    file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.5.4



