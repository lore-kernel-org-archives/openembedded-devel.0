Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28428C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 17:04:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1171.1743181451179950947
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 10:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6182d079f8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SG133T026656
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 10:04:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg47cka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 10:04:10 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 28 Mar 2025 10:04:09 -0700
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Fri, 28 Mar 2025 10:04:09 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] iperf2: upgrade 2.0.13 -> 2.2.1
Date: Fri, 28 Mar 2025 13:04:08 -0400
Message-ID: <20250328170408.334249-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=HZwUTjE8 c=1 sm=1 tr=0 ts=67e6d68a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ZUewT2-OccQ2_HBMdosA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: cNYEb3xJ13weWOMvSxJsxvQC8wRAvBZN
X-Proofpoint-ORIG-GUID: cNYEb3xJ13weWOMvSxJsxvQC8wRAvBZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 17:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116357

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Release notes:
https://sourceforge.net/p/iperf2/code/ci/2-2-1/tree/NEWS.md

Drop the stdbool patch. It seems to have been fixed upstream by:
   ae0284e4   2020-10-22   Replace DAST_CHECK_BOOL with AC_HEADER_STDBOOL

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...nition-considering-stdbool.h-being-p.patch | 60 -------------------
 .../{iperf2_2.0.13.bb => iperf2_2.2.1.bb}     |  3 +-
 2 files changed, 1 insertion(+), 62 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch
 rename meta-oe/recipes-benchmark/iperf2/{iperf2_2.0.13.bb => iperf2_2.2.1.bb} (79%)

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch b/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch
deleted file mode 100644
index dc3b85f8ef..0000000000
--- a/meta-oe/recipes-benchmark/iperf2/iperf2/0001-Detect-bool-definition-considering-stdbool.h-being-p.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 6df092a4153c6c37cfaddcabf2cd25a910a7f6e1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Sep 2019 15:40:52 -0700
-Subject: [PATCH] Detect bool definition considering stdbool.h being present
-
-This helps in defining the value correctly on different platforms e.g.
-clang/libc++ depends on the definition coming from stdbool.h
-current builds fail to compile therefore
-
-TMPDIR/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/iperf2/2.0.13-r0/recipe-sysroot/usr/include/c++/v1/type_traits:742:29: error: redefinition of '__libcpp_is_integral<int>'
-template <>          struct __libcpp_is_integral<int>                : public true_type {};
-                            ^~~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- m4/dast.m4 | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
---- a/m4/dast.m4
-+++ b/m4/dast.m4
-@@ -11,7 +11,12 @@ AH_TEMPLATE([false])
- 
- AC_DEFUN(DAST_CHECK_BOOL, [
- 
--AC_CHECK_SIZEOF(bool)
-+if test "$ac_cv_header_stdbool_h" = yes; then
-+  AC_CHECK_SIZEOF(bool,,[#include <stdbool.h>])
-+else
-+  AC_CHECK_SIZEOF(bool)
-+fi
-+
- if test "$ac_cv_sizeof_bool" = 0 ; then
-   AC_DEFINE(bool, int)
- fi
---- a/configure.ac
-+++ b/configure.ac
-@@ -113,7 +113,7 @@ AC_SEARCH_LIBS([socket], [socket], [],
- 
- dnl Checks for header files.
- AC_HEADER_STDC
--AC_CHECK_HEADERS([arpa/inet.h libintl.h net/ethernet.h net/if.h linux/ip.h linux/udp.h linux/if_packet.h linux/filter.h netdb.h netinet/in.h stdlib.h string.h strings.h sys/socket.h sys/time.h syslog.h unistd.h signal.h ifaddrs.h])
-+AC_CHECK_HEADERS([arpa/inet.h libintl.h net/ethernet.h net/if.h linux/ip.h linux/udp.h linux/if_packet.h linux/filter.h netdb.h netinet/in.h stdbool.h stdlib.h string.h strings.h sys/socket.h sys/time.h syslog.h unistd.h signal.h ifaddrs.h])
- 
- dnl ===================================================================
- dnl Checks for typedefs, structures
---- a/include/util.h
-+++ b/include/util.h
-@@ -56,7 +56,9 @@
- #ifdef HAVE_CONFIG_H
-     #include "config.h"
- #endif
--
-+#ifdef HAVE_STDBOOL_H
-+# include <stdbool.h>
-+#endif
- #ifdef __cplusplus
- extern "C" {
- #endif
diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
similarity index 79%
rename from meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
rename to meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
index 7b3d23a53f..a439616ba4 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
@@ -5,10 +5,9 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e136a7b2560d80bcbf0d9b3e1356ecff"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/iperf-${PV}.tar.gz \
-           file://0001-Detect-bool-definition-considering-stdbool.h-being-p.patch \
 "
 
-SRC_URI[sha256sum] = "c88adec966096a81136dda91b4bd19c27aae06df4d45a7f547a8e50d723778ad"
+SRC_URI[sha256sum] = "754ab0a7e28033dbea81308ef424bc7df4d6e2fe31b60cc536b61b51fefbd8fb"
 
 S = "${WORKDIR}/iperf-${PV}"
 
-- 
2.34.1


