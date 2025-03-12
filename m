Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83683C35FF4
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 01:00:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.26663.1741741194927125980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 17:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5166cf4169=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BN1J4j001408
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:59:54 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45au90094v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:59:54 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Mar 2025 17:59:53 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Mar 2025 17:59:53 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/9] googlebenchmark: upgrade 1.8.4 -> 1.9.1
Date: Wed, 12 Mar 2025 08:59:44 +0800
Message-ID: <20250312005952.1469547-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=HdAUTjE8 c=1 sm=1 tr=0 ts=67d0dc8a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=vie-ckCxkIC4C4lb9fMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: eqj0lwJ8TwaZeiSAtHikJeKiTiWynNVL
X-Proofpoint-GUID: eqj0lwJ8TwaZeiSAtHikJeKiTiWynNVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503120005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 01:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115897

From: Changqing Li <changqing.li@windriver.com>

* Remove following two patches, alreay included in 1.9.1
0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch
0002-cycleclock-Fix-type-conversion-to-match-function-ret.patch
* Change log
https://github.com/google/benchmark/releases

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ype-conversion-to-match-function-ret.patch | 33 -------------------
 ...ype-conversion-to-match-function-ret.patch | 32 ------------------
 ...mark_1.8.4.bb => googlebenchmark_1.9.1.bb} |  6 ++--
 3 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta-oe/recipes-support/googlebenchmark/googlebenchmark/0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch
 delete mode 100644 meta-oe/recipes-support/googlebenchmark/googlebenchmark/0002-cycleclock-Fix-type-conversion-to-match-function-ret.patch
 rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.8.4.bb => googlebenchmark_1.9.1.bb} (66%)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch b/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch
deleted file mode 100644
index 3017314abe..0000000000
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7f0e99af540a333108b92d792923ec7fc9e9fad9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 May 2024 20:14:54 -0700
-Subject: [PATCH] cycleclock: Fix type conversion to match function return type
- (#1794)
-
-fixes build with clang19
-
-src/cycleclock.h:208:52: error: implicit conversion changes signedness: 'uint64_t' (aka 'unsigned long long') to 'int64_t' (aka 'long long') [-Werror,-Wsign-conversion]
-  208 |   return (static_cast<uint64_t>(cycles_hi1) << 32) | cycles_lo;
-      |   ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
-1 error generated.
-
-Upstream-Status: Backport [https://github.com/google/benchmark/commit/7f0e99af540a333108b92d792923ec7fc9e9fad9]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cycleclock.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/cycleclock.h b/src/cycleclock.h
-index a25843760..c657414e5 100644
---- a/src/cycleclock.h
-+++ b/src/cycleclock.h
-@@ -205,7 +205,8 @@ inline BENCHMARK_ALWAYS_INLINE int64_t Now() {
-       "sub %0, zero, %0\n"
-       "and %1, %1, %0\n"
-       : "=r"(cycles_hi0), "=r"(cycles_lo), "=r"(cycles_hi1));
--  return (static_cast<uint64_t>(cycles_hi1) << 32) | cycles_lo;
-+  return static_cast<int64_t>((static_cast<uint64_t>(cycles_hi1) << 32) |
-+                              cycles_lo);
- #else
-   uint64_t cycles;
-   asm volatile("rdtime %0" : "=r"(cycles));
diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0002-cycleclock-Fix-type-conversion-to-match-function-ret.patch b/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0002-cycleclock-Fix-type-conversion-to-match-function-ret.patch
deleted file mode 100644
index cc22a7e8a9..0000000000
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0002-cycleclock-Fix-type-conversion-to-match-function-ret.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 54bca09aca6ccec41f852cb1f834463bc51290d0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 10 Jun 2024 21:45:22 -0700
-Subject: [PATCH] cycleclock: Fix type conversion to match function return type
- on riscv64
-
-Fixes builds with clang
-
-src/cycleclock.h:213:10: error: implicit conversion changes signedness: 'uint64_t' (aka 'unsigned long') to 'int64_t' (aka 'long') [-Werror,-Wsign-conversion]
-     213 |   return cycles;
-         |   ~~~~~~ ^~~~~~
-   1 error generated.
-
-Upstream-Status: Submitted [https://github.com/google/benchmark/pull/1802]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cycleclock.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/cycleclock.h b/src/cycleclock.h
-index c657414..bd62f5d 100644
---- a/src/cycleclock.h
-+++ b/src/cycleclock.h
-@@ -210,7 +210,7 @@ inline BENCHMARK_ALWAYS_INLINE int64_t Now() {
- #else
-   uint64_t cycles;
-   asm volatile("rdtime %0" : "=r"(cycles));
--  return cycles;
-+  return static_cast<int64_t>(cycles);
- #endif
- #elif defined(__e2k__) || defined(__elbrus__)
-   struct timeval tv;
diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.1.bb
similarity index 66%
rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb
rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.1.bb
index 706862f24a..adab241baa 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.1.bb
@@ -4,10 +4,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main \
-           file://0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch \
-           file://0002-cycleclock-Fix-type-conversion-to-match-function-ret.patch"
-SRCREV = "a4cf155615c63e019ae549e31703bf367df5b471"
+SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main"
+SRCREV = "c58e6d0710581e3a08d65c349664128a8d9a2461"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


