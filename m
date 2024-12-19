Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1DCE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 08:48:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.125821.1734598082712739563
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 00:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=208319dcd1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ7emok018466
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 00:48:02 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43hadq58bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 00:48:02 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 19 Dec 2024 00:48:01 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 19 Dec 2024 00:48:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 3/3] android-tools: fix warning: library search path "/usr/lib/p7zip" is unsafe for cross-compilation
Date: Thu, 19 Dec 2024 16:47:58 +0800
Message-ID: <20241219084758.3809790-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219084758.3809790-1-hongxu.jia@windriver.com>
References: <20241219084758.3809790-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GhSABy8hqIUdUKSujesX3pLHToUsnbKq
X-Authority-Analysis: v=2.4 cv=INT4ChvG c=1 sm=1 tr=0 ts=6763ddc2 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=_iH6NxeTAAAA:8 a=WRqpFvC3lshAPw7ZbAUA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=zZzRKORMDKZaSe7LaTAy:22
X-Proofpoint-GUID: GhSABy8hqIUdUKSujesX3pLHToUsnbKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_03,2024-12-18_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 08:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114382

Refresh local patch to remove '-L/usr/lib/p7zip'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...difications-to-make-it-build-in-yoct.patch | 29 ++++++++++++-------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
index b719acec4..fd2a092bd 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
@@ -1,4 +1,4 @@
-From fe211cbc305a9316c1d4da2f086d6a50f1c92188 Mon Sep 17 00:00:00 2001
+From 194513bababa9707ec54bc7119613a0d5eca9f79 Mon Sep 17 00:00:00 2001
 From: Etienne Cordonnier <ecordonnier@snap.com>
 Date: Fri, 17 Mar 2023 10:33:11 +0100
 Subject: [PATCH] android-tools: modifications to make it build in yocto
@@ -12,26 +12,28 @@ Subject: [PATCH] android-tools: modifications to make it build in yocto
 
 Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
 
----
-Upstream-Status: Pending
+- fix warning: library search path "/usr/lib/p7zip" is unsafe for cross-compilation
 
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
  debian/external/boringssl/libcrypto.mk         |  1 +
  debian/system/core/append2simg.mk              |  2 +-
  debian/system/core/fastboot.mk                 |  2 +-
  debian/system/core/img2simg.mk                 |  2 +-
- debian/system/core/libbacktrace.mk             |  8 ++++----
+ debian/system/core/libbacktrace.mk             | 10 ++++------
  debian/system/core/libbase.mk                  |  5 +++--
  debian/system/core/libcutils.mk                |  5 +++--
  debian/system/core/liblog.mk                   |  3 ++-
  debian/system/core/libsparse.mk                |  5 +++--
- debian/system/core/libutils.mk                 |  2 +-
+ debian/system/core/libutils.mk                 |  4 ++--
  debian/system/core/libziparchive.mk            |  5 +++--
  debian/system/core/simg2img.mk                 |  2 +-
  debian/system/core/simg2simg.mk                |  2 +-
  frameworks/native/libs/adbd_auth/adbd_auth.cpp |  2 ++
  system/core/adb/adb_listeners.cpp              | 12 ++++++------
  system/core/adb/transport_local.cpp            |  2 +-
- 16 files changed, 34 insertions(+), 26 deletions(-)
+ 16 files changed, 35 insertions(+), 29 deletions(-)
 
 diff --git a/debian/external/boringssl/libcrypto.mk b/debian/external/boringssl/libcrypto.mk
 index c0ea54f4..b3a77bfd 100644
@@ -85,7 +87,7 @@ index 11adf014..8baf5ba5 100644
    -llog \
    -lpthread \
 diff --git a/debian/system/core/libbacktrace.mk b/debian/system/core/libbacktrace.mk
-index e3411d76..86e69874 100644
+index e3411d76..e7dd984c 100644
 --- a/debian/system/core/libbacktrace.mk
 +++ b/debian/system/core/libbacktrace.mk
 @@ -1,4 +1,4 @@
@@ -94,9 +96,11 @@ index e3411d76..86e69874 100644
  
  NAME = libbacktrace
  
-@@ -83,10 +84,9 @@ CPPFLAGS += \
+@@ -81,12 +81,10 @@ CPPFLAGS += \
+   -Isystem/core/libunwindstack/include \
+ 
  LDFLAGS += \
-   -L/usr/lib/p7zip \
+-  -L/usr/lib/p7zip \
    -Ldebian/out/system/core \
 -  -Wl,-rpath=/usr/lib/p7zip \
 -  -Wl,-rpath=/usr/lib/$(DEB_HOST_MULTIARCH)/android \
@@ -107,7 +111,7 @@ index e3411d76..86e69874 100644
    -lbase \
    -llog \
    -lpthread \
-@@ -101,7 +101,7 @@ endif
+@@ -101,7 +99,7 @@ endif
  build: $(OBJECTS_CXX) $(OBJECTS_ASSEMBLY) debian/out/external/libunwind/libunwind.a
  	mkdir -p debian/out/system/core
  	$(CXX) $^ -o debian/out/system/core/$(NAME).so.0 $(LDFLAGS)
@@ -216,7 +220,7 @@ index c2b2694c..2da12b8e 100644
  $(OBJECTS): %.o: %.cpp
  	$(CXX) -c -o $@ $< $(CXXFLAGS) $(CPPFLAGS)
 diff --git a/debian/system/core/libutils.mk b/debian/system/core/libutils.mk
-index c37b1d2d..332492c1 100644
+index c37b1d2d..0c748c8b 100644
 --- a/debian/system/core/libutils.mk
 +++ b/debian/system/core/libutils.mk
 @@ -1,4 +1,4 @@
@@ -373,3 +377,6 @@ index c7261860..5988ec4d 100644
      auto it = local_transports.find(adb_port);
      if (it == local_transports.end()) {
          return nullptr;
+-- 
+2.34.1
+
-- 
2.34.1


