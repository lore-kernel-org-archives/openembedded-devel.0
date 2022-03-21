Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FFFC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 01:21:39 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.25196.1647825698545455624
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 18:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22L1Larj017192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 18:21:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 20 Mar 2022 18:21:36 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 20 Mar 2022 18:21:36 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/2] mcelog: update from 175 to 180
Date: Sun, 20 Mar 2022 18:21:35 -0700
Message-ID: <20220321012136.188270-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 01:21:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96100

The patch has been merged upstream so drop it:
   f922739 test: avoid the pfa test hang

A LICENSE file was added, with the same terms, so update the
file and checksum. Change the HOMEPAGE link to https.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../0001-test-avoid-the-pfa-test-hang.patch   | 36 -------------------
 .../mcelog/{mcelog_175.bb => mcelog_180.bb}   |  7 ++--
 2 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mcelog/mcelog/0001-test-avoid-the-pfa-test-hang.patch
 rename meta-oe/recipes-support/mcelog/{mcelog_175.bb => mcelog_180.bb} (82%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog/0001-test-avoid-the-pfa-test-hang.patch b/meta-oe/recipes-support/mcelog/mcelog/0001-test-avoid-the-pfa-test-hang.patch
deleted file mode 100644
index 03bcc451d..000000000
--- a/meta-oe/recipes-support/mcelog/mcelog/0001-test-avoid-the-pfa-test-hang.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3765b3a4cabf76f55c1c126ac64780a8c117d1d9 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Tue, 12 Jan 2021 10:30:13 +0800
-Subject: [PATCH] test: avoid the pfa test hang
-
-Per [1], the pfa test needs to install page-types and the pfa test
-will hang forever if there is no page-types installed.
-
-Improve the test script to avoid the pfa test hang.
-
-[1] https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/tree/tests/pfa/PFA_test_howto?id=7b776a8c005b60572f49797e81287540f99fff1f
-
-Upstream-Status: Submitted [https://github.com/andikleen/mcelog/pull/87]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tests/test | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/tests/test b/tests/test
-index 020ae2b..320f57f 100755
---- a/tests/test
-+++ b/tests/test
-@@ -47,6 +47,9 @@ do
- 	# Inject mce records and run mcelog in parallel.
- 	# So that the mce records can be consumed by mcelog in time (avoid mce record overflow).
- 	./inject $conf &
-+	if [ "$1" = "pfa" ] ; then
-+		which page-types > /dev/null 2>&1 || continue
-+	fi
- 	$D ../../mcelog --foreground --daemon --debug-numerrors --config $conf --logfile $log >> result
- 
- 	# let triggers finish
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-support/mcelog/mcelog_175.bb b/meta-oe/recipes-support/mcelog/mcelog_180.bb
similarity index 82%
rename from meta-oe/recipes-support/mcelog/mcelog_175.bb
rename to meta-oe/recipes-support/mcelog/mcelog_180.bb
index bbe81a920..249e2421c 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_175.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_180.bb
@@ -2,18 +2,17 @@ SUMMARY = "mcelog daemon accounts memory and some other errors in various ways."
 DESCRIPTION = "mcelog is required by both 32bit x86 Linux kernels (since 2.6.30) \
 and 64bit Linux kernels (since early 2.6 kernel releases) to log machine checks \
 and should run on all Linux systems that need error handling."
-HOMEPAGE = "http://mcelog.org/"
+HOMEPAGE = "https://mcelog.org/"
 SECTION = "System Environment/Base"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;branch=master \
-    file://0001-test-avoid-the-pfa-test-hang.patch \
     file://run-ptest \
 "
 
-SRCREV = "7b776a8c005b60572f49797e81287540f99fff1f"
+SRCREV = "4146c9296a0cbd26f1c5e411cb44877f350053bd"
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://README.md;md5=74bb47b9a68850cb398665cf78b31de6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1


