Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A718FC433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 17:47:15 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.20619.1647798422447033695
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 10:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22KHl0UO005987
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 10:47:00 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 20 Mar 2022 10:47:00 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 20 Mar 2022 10:47:00 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] iperf3: upgrade from 3.9 to 3.11
Date: Sun, 20 Mar 2022 10:47:00 -0700
Message-ID: <20220320174700.40077-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 17:47:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96085

The copyright dates were exteneded to 2022 so the LICENSE hash changed.

Add some blank lines in the recipe to make it easier to read and
refresh the patches to eliminate patch fuzz warnings.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../0001-configure.ac-check-for-CPP-prog.patch       | 12 +++++-------
 .../iperf3/0002-Remove-pg-from-profile_CFLAGS.patch  |  8 +++-----
 .../iperf3/{iperf3_3.9.bb => iperf3_3.11.bb}         |  6 ++++--
 3 files changed, 12 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.9.bb => iperf3_3.11.bb} (89%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-configure.ac-check-for-CPP-prog.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-configure.ac-check-for-CPP-prog.patch
index 739fd20fc..09e3d9ca9 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-configure.ac-check-for-CPP-prog.patch
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-configure.ac-check-for-CPP-prog.patch
@@ -1,4 +1,4 @@
-From cc4499cd4cfcb655fc44c3f3571eee20663dafde Mon Sep 17 00:00:00 2001
+From 4801363fbff12bf1019aaf90142981702cecff92 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Wed, 3 Feb 2021 20:44:34 +0000
 Subject: [PATCH] configure.ac: check for CPP prog
@@ -10,22 +10,20 @@ Absence of check for CPP_PROG causes following build errors:
 
 Upstream-Status: Pending
 Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
+
 ---
  configure.ac | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/configure.ac b/configure.ac
-index 939cf0a..f75b398 100644
+index 53a4db4..3462b3e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -47,6 +47,7 @@ AC_CANONICAL_HOST
+@@ -48,6 +48,7 @@ AC_CANONICAL_HOST
  # Checks for tools: c compiler, ranlib (used for creating static libraries),
  # symlinks and libtool
  AC_PROG_CC
 +AC_PROG_CPP
  AC_PROG_RANLIB
  AC_PROG_LN_S
- AC_PROG_LIBTOOL
--- 
-2.17.1
-
+ LT_INIT
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
index 959e29389..7870261ee 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
@@ -1,4 +1,4 @@
-From 3ae408402635ea21ad90cd722c99ae3334376c91 Mon Sep 17 00:00:00 2001
+From 155ae12f7809e387a379703d8c09f227e430336d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 14 Jul 2017 13:00:16 -0700
 Subject: [PATCH] Remove -pg from profile_CFLAGS
@@ -7,12 +7,13 @@ musl fails to link with missing gcrt1.o
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
 ---
  src/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 5be8562..3881aa6 100644
+index 11d3e17..4058cff 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -58,9 +58,9 @@ if ENABLE_PROFILING
@@ -27,6 +28,3 @@ index 5be8562..3881aa6 100644
  endif
  
  # Specify the sources and various flags for the test cases
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb
similarity index 89%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb
index 47bf4d501..a6af23aec 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.9.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.11.bb
@@ -4,19 +4,21 @@ iperf is a tool for active measurements of the maximum achievable bandwidth \
 on IP networks. It supports tuning of various parameters related to timing, \
 protocols, and buffers. For each test it reports the bandwidth, loss, and \
 other parameters."
+
 HOMEPAGE = "http://software.es.net/iperf/"
 SECTION = "console/network"
 BUGTRACKER = "https://github.com/esnet/iperf/issues"
 AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
+
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b7fb682e9941a49f1214dcd7441410d7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=68ae8cfc577a2c8c51bb51e9628e80b7"
 
 SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            "
 
-SRCREV = "1f8fb13297f3e3e40169ebcd12e171167e394473"
+SRCREV = "76bd67f6e90e239a7686202d2b1b595159826d24"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1


