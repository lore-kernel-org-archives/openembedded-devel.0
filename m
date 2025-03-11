Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1ECDC28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 07:35:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3400.1741678557077613643
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 00:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5165e225bd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B2bWIi028891
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:35:56 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b4134jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:35:55 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Mar 2025 00:35:54 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Mar 2025 00:35:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] protobuf: 4.25.5 -> 4.30.0
Date: Tue, 11 Mar 2025 15:35:52 +0800
Message-ID: <20250311073553.2173455-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=JYNGrVKV c=1 sm=1 tr=0 ts=67cfe7dc cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=Twlkf-z8AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8
 a=DxYfrP5jb0lbfklFTBEA:9 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-ORIG-GUID: u9us9YBF_e_v_o0caWBcuemNzdIJRip-
X-Proofpoint-GUID: u9us9YBF_e_v_o0caWBcuemNzdIJRip-
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
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115846

Refresh local patches
- 0001-Fix-build-on-mips-clang.patch
- 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch

Changelog:
https://github.com/protocolbuffers/protobuf/releases/tag/v30.0

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Fix-build-on-mips-clang.patch        | 26 +++++++++++-------
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 27 ++++++++++---------
 ...{protobuf_4.25.5.bb => protobuf_4.30.0.bb} |  4 +--
 3 files changed, 33 insertions(+), 24 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.5.bb => protobuf_4.30.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
index 9f6116c4c4..6db22c26d3 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-clang.patch
@@ -1,6 +1,6 @@
-From 08e46feb6553af670754e65d94c3bb6fcd4e0cf9 Mon Sep 17 00:00:00 2001
+From fd5a966a6385165506a1b84298465cbb9f44222d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 31 Oct 2021 23:39:44 -0700
+Date: Mon, 10 Mar 2025 19:59:19 -0700
 Subject: [PATCH] Fix build on mips/clang
 
 clang13 crashes on mips, until its fixed upstream disable tailcall on
@@ -10,17 +10,25 @@ https://bugs.llvm.org/show_bug.cgi?id=52367
 
 Upstream-Status: Inappropriate [Clang workaround]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Rebase to v4.30.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- src/google/protobuf/port_def.inc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ src/google/protobuf/port_def.inc | 1 +
+ 1 file changed, 1 insertion(+)
 
+diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/port_def.inc
+index 35f49afb4..e9597af0d 100644
 --- a/src/google/protobuf/port_def.inc
 +++ b/src/google/protobuf/port_def.inc
-@@ -255,6 +255,7 @@
+@@ -222,6 +222,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
  #error PROTOBUF_TAILCALL was previously defined
  #endif
- #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) && \
+ #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) &&  \
 +    !defined(__mips__) && \
-     !defined(_ARCH_PPC) && !defined(__wasm__) &&                 \
-     !(defined(_MSC_VER) && defined(_M_IX86)) &&                  \
-     !(defined(__NDK_MAJOR__) && __NDK_MAJOR <= 24)
+     !defined(_ARCH_PPC) && !defined(__wasm__) &&                      \
+     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__)
+ // Compilation fails on ARM32: b/195943306
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
index 7c4bf260eb..95a48017b1 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
@@ -1,6 +1,6 @@
-From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2001
+From fe2d9a1df45fd2082fab717f21557fcdc0cab082 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 28 Jun 2019 13:50:52 +0000
+Date: Mon, 10 Mar 2025 20:05:47 -0700
 Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
  with gold
 
@@ -25,12 +25,14 @@ Upstream-Status: Pending
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 
+Rebase to v4.30.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- examples/Makefile | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
+ examples/Makefile | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index ef7a4ef58..7206e14e1 100644
+index 5290fdb03..523532f35 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -2,6 +2,8 @@
@@ -42,20 +44,19 @@ index ef7a4ef58..7206e14e1 100644
  all: cpp java python
  
  cpp:    add_person_cpp    list_people_cpp
-@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
- 
+@@ -47,10 +49,11 @@ protoc_middleman_ruby: addressbook.proto
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(CXX) -std=c++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
+ 	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
  
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++14 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$(CXX) -std=c++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
+-	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
  
  add_person_dart: add_person.dart protoc_middleman_dart
  
---
-2.34.1
+-- 
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
index a470a7c643..f899a1dc07 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
@@ -14,9 +14,9 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
+SRCREV = "d295af5c3002c08e1bfd9d7f9e175d0a4d015f1e"
 
-SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https \
+SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=30.x;protocol=https \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
            "
-- 
2.34.1


