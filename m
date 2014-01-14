Return-Path: <ting.liu@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0186.outbound.messaging.microsoft.com [213.199.154.186])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7C46E20F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 03:57:55 +0000 (UTC)
Received: from mail171-db8-R.bigfish.com (10.174.8.238) by
	DB8EHSOBE001.bigfish.com (10.174.4.64) with Microsoft SMTP Server id
	14.1.225.22; Tue, 14 Jan 2014 03:57:55 +0000
Received: from mail171-db8 (localhost [127.0.0.1])	by
	mail171-db8-R.bigfish.com (Postfix) with ESMTP id 8C8036C0111	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 03:57:55 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21a7h1fc6hzz8275ch1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h2327h2336h2438h2461h1155h)
Received: from mail171-db8 (localhost.localdomain [127.0.0.1]) by mail171-db8
	(MessageSwitch) id 1389671873619011_25487;
	Tue, 14 Jan 2014 03:57:53 +0000 (UTC)
Received: from DB8EHSMHS017.bigfish.com (unknown [10.174.8.240])	by
	mail171-db8.bigfish.com (Postfix) with ESMTP id 88110240047;
	Tue, 14 Jan 2014 03:57:53 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS017.bigfish.com
	(10.174.4.27) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 14 Jan 2014 03:57:53 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 14 Jan 2014 03:57:02 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.70])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s0E3v11M007725; Mon, 13 Jan 2014 20:57:02 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Jan 2014 21:57:01 -0600
Message-ID: <1389671821-3268-2-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1389671821-3268-1-git-send-email-b28495@freescale.com>
References: <1389671821-3268-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH 2/2] libhugetbfs: add branch parameter and uprev to 6824d18
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
X-List-Received-Date: Tue, 14 Jan 2014 03:57:55 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 ...x-lib64-can-not-be-shiped-in-64bit-target.patch |    2 +-
 .../libhugetlbfs/libhugetlbfs_git.bb               |    8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/fix-lib64-can-not-be-shiped-in-64bit-target.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/fix-lib64-can-not-be-shiped-in-64bit-target.patch
index 1ab461c..676fa8a 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/fix-lib64-can-not-be-shiped-in-64bit-target.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/fix-lib64-can-not-be-shiped-in-64bit-target.patch
@@ -34,7 +34,7 @@ Signed-off-by: Guo Chunrong <B40290@freescale.com>
  ifeq ($(ARCH),aarch64)
 -CC64 = gcc
 +CC64 = $(CC)
- ELF64 = aarch64elf_linux
+ ELF64 = aarch64elf
 -TMPLIB64 = lib64
 +TMPLIB64 = lib
  CUSTOM_LDSCRIPTS = no
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index d29dee1..41fd0bd 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -5,11 +5,8 @@ LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "sysfsutils perl"
 RDEPENDS_${PN} += "python python-io python-lang python-subprocess python-resource"
 
-SRCREV = "49fedbe172343b3f7b39dc81bd2d81a18a34eb2f"
-SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
-    file://aarch64-support.patch \
-    file://aarch64-unit-test-fixes.patch \
-    file://add-PROT-NONE-to-the-mprotest-test.patch \
+SRCBRANCH = "next"
+SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code;branch=${SRCBRANCH} \
     file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
     file://libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
     file://fix-lib64-can-not-be-shiped-in-64bit-target.patch \
@@ -17,6 +14,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
     file://0001-install-perl-lib-to-directory-perl-instead-of-perl5.patch \
 "
+SRCREV = "6824d18d5f33fdab445a8eff147fcdb6361f5791"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.7



