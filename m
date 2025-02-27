Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDB1C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 03:14:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2869.1740626081448913582
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 19:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4153b328b7=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R2mmU1002414
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 03:14:40 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451pub9k7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 03:14:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 26 Feb 2025 19:14:39 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 26 Feb 2025 19:14:38 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] abseil-cpp: upgrade 20240722.0 -> 20250127.0
Date: Thu, 27 Feb 2025 11:14:37 +0800
Message-ID: <20250227031437.3580059-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=S9sjwJsP c=1 sm=1 tr=0 ts=67bfd8a0 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=J_Yf4bcsfNkuTo6Hu0YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WZ_Z02iP1fML2Idalae8M7uObkdpTAFF
X-Proofpoint-ORIG-GUID: WZ_Z02iP1fML2Idalae8M7uObkdpTAFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_01,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2502270023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 03:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115683

From: Changqing Li <changqing.li@windriver.com>

Upgrade to the latest new LTS release, release note:
https://github.com/abseil/abseil-cpp/releases?page=1

* drop 0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch,
already include in this LTS release
* Include security fix for CVE-2025-0838

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-virtual-dtor-in-the-flags-are-neede.patch | 30 -------------------
 ...20240722.0.bb => abseil-cpp_20250127.0.bb} |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240722.0.bb => abseil-cpp_20250127.0.bb} (90%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch
deleted file mode 100644
index 9a4fc0b43f..0000000000
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9cb5e5d15c142e5cc43a2c1db87c8e4e5b6d38a5 Mon Sep 17 00:00:00 2001
-From: Derek Mauro <dmauro@google.com>
-Date: Mon, 5 Aug 2024 07:35:05 -0700
-Subject: [PATCH] Don't match -Wnon-virtual-dtor in the "flags are needed to
- suppress warnings in headers". It should fall through to the "don't impose
- our warnings on others" case. Do this by matching on "-Wno-*" instead of
- "-Wno*".
-
-Fixes #1737
-
-PiperOrigin-RevId: 659548798
-Change-Id: I49d7ba7ddcd7be30f946fca90ba9be467181e854
-Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/9cb5e5d15c142e5cc43a2c1db87c8e4e5b6d38a5]
----
- CMake/AbseilHelpers.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMake/AbseilHelpers.cmake b/CMake/AbseilHelpers.cmake
-index b177e590..3c4c92fe 100644
---- a/CMake/AbseilHelpers.cmake
-+++ b/CMake/AbseilHelpers.cmake
-@@ -195,7 +195,7 @@ function(absl_cc_library)
-         # specified platform. Filter both of them out before the successor
-         # reaches the "^-m" filter.
-         set(skip_next_cflag ON)
--      elseif(${cflag} MATCHES "^(-Wno|/wd)")
-+      elseif(${cflag} MATCHES "^(-Wno-|/wd)")
-         # These flags are needed to suppress warnings that might fire in our headers.
-         set(PC_CFLAGS "${PC_CFLAGS} ${cflag}")
-       elseif(${cflag} MATCHES "^(-W|/w[1234eo])")
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.0.bb
similarity index 90%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.0.bb
index 4bfc2100e4..88e20c0577 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.0.bb
@@ -7,14 +7,13 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-SRCREV = "4447c7562e3bc702ade25105912dce503f0c4010"
-BRANCH = "lts_2024_07_22"
+SRCREV = "9ac7062b1860d895fb5a8cbf58c3e9ef8f674b5f"
+BRANCH = "lts_2025_01_27"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
            file://0004-abseil-ppc-fixes.patch \
-           file://0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


