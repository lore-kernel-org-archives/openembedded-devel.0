Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2A9C2BA1B
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 07:36:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3401.1741678557590158165
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 00:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5165e225bd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B2bWIj028891
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:35:57 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b4134jr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:35:56 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Mar 2025 00:35:55 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Mar 2025 00:35:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] xmlrpc-c: 1.60.03 -> 1.64.0
Date: Tue, 11 Mar 2025 15:35:53 +0800
Message-ID: <20250311073553.2173455-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311073553.2173455-1-hongxu.jia@windriver.com>
References: <20250311073553.2173455-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=JYNGrVKV c=1 sm=1 tr=0 ts=67cfe7dc cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=e2xPdjVqIiTLJWnnQtYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: iVKIlNQ5HkPAH-cC4jzB5ChjiiTbUhOy
X-Proofpoint-GUID: iVKIlNQ5HkPAH-cC4jzB5ChjiiTbUhOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503110050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115847

Refresh local patches:
- 0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch
- 0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...rver_abyss-Fix-build-with-clang-libc.patch | 16 +++--
 ...nsuring-Sequential-Execution-of-rm-a.patch | 59 +++++--------------
 ...xmlrpc-c_1.60.03.bb => xmlrpc-c_1.64.0.bb} |  4 +-
 3 files changed, 29 insertions(+), 50 deletions(-)
 rename meta-oe/recipes-devtools/xmlrpc-c/{xmlrpc-c_1.60.03.bb => xmlrpc-c_1.64.0.bb} (93%)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch
index be83b0166c..531f0d45fb 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch
@@ -1,6 +1,6 @@
-From dba3c5bf34ed530fd41ed50968825af2158f142e Mon Sep 17 00:00:00 2001
+From 371c59c6135f53a6892c415bf9450c32e7ca3523 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 29 Jan 2019 13:31:39 -0800
+Date: Mon, 10 Mar 2025 20:25:02 -0700
 Subject: [PATCH] test/cpp/server_abyss: Fix build with clang/libc++
 
 /mnt/a/yoe/workspace/sources/xmlrpc-c/test/cpp/server_abyss.cpp:87:14: error: assigning to 'int' from incompatible type '__bind<int
@@ -10,10 +10,15 @@ Subject: [PATCH] test/cpp/server_abyss: Fix build with clang/libc++
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Rebase to 1.64.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- test/cpp/server_abyss.cpp | 56 +++++++++++++++++++--------------------
- 1 file changed, 28 insertions(+), 28 deletions(-)
+ test/cpp/server_abyss.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/test/cpp/server_abyss.cpp b/test/cpp/server_abyss.cpp
+index c1b44995..14faf5a5 100644
 --- a/test/cpp/server_abyss.cpp
 +++ b/test/cpp/server_abyss.cpp
 @@ -85,7 +85,7 @@ public:
@@ -25,3 +30,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          
          if (rc != 0) {
              closesock(this->fd);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch
index 152667661e..15e088965f 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch
@@ -1,7 +1,8 @@
-From c9bd05e8f0ad805b81625cfa717d06071cfd9b48 Mon Sep 17 00:00:00 2001
+From e246247aceb3ac0fd7491b1ee34a049dd44f5025 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 16 Oct 2024 22:52:38 -0700
-Subject: [PATCH] unix-common.mk: Avoid race condition between mutliple make calls running in parallel
+Date: Mon, 10 Mar 2025 20:26:29 -0700
+Subject: [PATCH] unix-common.mk: Avoid race condition between mutliple make
+ calls running in parallel
 
 With high parallel execution, it results in race condition where
 its trying to create symlink while the original symlink while rm is
@@ -29,50 +30,14 @@ but I don't see any changes which should cause this in the git since
 1.59.01, but the gentoo bug report is against 1.54.06 already.
 
 martin@jama /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable $ grep -A 1 lib/libutil++/Makefile after-clean-j1.log
-make -C libutil++/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil++/Makefile \
-    all 
+make -C libutil++/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/lib/libutil++/Makefile \
+    all
 --
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil++/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil++/Makefile \
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/lib/libutil++/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/lib/libutil++/Makefile \
     libxmlrpc_util++.so
 
-martin@jama /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable $ grep -A 1 lib/libutil/Makefile after-clean-j1.log
-make -C libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
-    all 
 --
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
-    libxmlrpc_util.so
---
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
-    libxmlrpc_util.so
---
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
-    libxmlrpc_util.so
---
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
-    libxmlrpc_util.so
---
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
-    libxmlrpc_util.so
---
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
-    libxmlrpc_util.so
---
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
-    libxmlrpc_util.so
---
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
-    libxmlrpc_util.so
---
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
-    libxmlrpc_util.so
---
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
-    libxmlrpc_util.so
---
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
-    libxmlrpc_util.so
---
-make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/stable/lib/libutil/Makefile \
+make -C /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/lib/libutil/ -f /OE/build/oe-core/tmp/work/core2-64-oe-linux/xmlrpc-c/1.60.03/git/lib/libutil/Makefile \
     libxmlrpc_util.so
 
 Similar error reported here [1]
@@ -82,12 +47,15 @@ Similar error reported here [1]
 Upstream-Status: Pending
 Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Rebase to 1.64.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  unix-common.mk | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/unix-common.mk b/unix-common.mk
-index 6954faf5..983c48cd 100644
+index 6954faf5..e15a4f5c 100644
 --- a/unix-common.mk
 +++ b/unix-common.mk
 @@ -62,14 +62,12 @@ SHLIB_CMD = $(CCLD) $(LADD) $(LDFLAGS_SHLIB) -o $@ $^
@@ -107,3 +75,6 @@ index 6954faf5..983c48cd 100644
  
  .PHONY: $(SHLIB_INSTALL_TARGETS)
  .PHONY: install-shared-libraries
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
similarity index 93%
rename from meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
rename to meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
index 0e0385ab29..62ba0f53e6 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
@@ -10,8 +10,8 @@ SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
            file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
            file://0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch \
            "
-# one more commit after Release 1.60.03 in the Stable series
-SRCREV = "a823b0bb5cf0a4dbd34f929cbfdfb0439c5d9b0e"
+# one more commit after Release 1.64.0 in the Stable series
+SRCREV = "8ce36bce2438df9b02fcaafd19efa90a56426601"
 
 S = "${WORKDIR}/git/stable"
 
-- 
2.34.1


