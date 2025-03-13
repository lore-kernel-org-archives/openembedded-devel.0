Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135B8C28B2F
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 03:17:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6475.1741835848355859758
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 20:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=516707848e=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D1wwAO000593;
	Thu, 13 Mar 2025 03:17:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0ga1fpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 13 Mar 2025 03:17:26 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 12 Mar 2025 20:17:25 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 12 Mar 2025 20:17:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [PATCH] protobuf: 4.25.5 -> 4.30.0
Date: Thu, 13 Mar 2025 11:17:22 +0800
Message-ID: <20250313031722.2954589-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313031722.2954589-1-hongxu.jia@windriver.com>
References: <20250313031722.2954589-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2t78_oGG-hZL9CA8Ekrv8am6vLcPQwNf
X-Proofpoint-ORIG-GUID: 2t78_oGG-hZL9CA8Ekrv8am6vLcPQwNf
X-Authority-Analysis: v=2.4 cv=ZrXtK87G c=1 sm=1 tr=0 ts=67d24e46 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=Twlkf-z8AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8
 a=NbgBM54gC2aFTEyWLUkA:9 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503130024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 03:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115948

Refresh local patches
- 0001-Fix-build-on-mips-clang.patch
- 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch

Changelog:
https://github.com/protocolbuffers/protobuf/releases/tag/v30.0

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Fix-build-on-mips-clang.patch        | 26 ++++++++++++-------
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 25 +++++++++---------
 ...{protobuf_4.25.5.bb => protobuf_4.30.0.bb} |  4 +--
 3 files changed, 32 insertions(+), 23 deletions(-)
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
index 7c4bf260eb..1b68c24c96 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
@@ -1,13 +1,12 @@
-From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2001
+From 9d50661003d78a4debfc7eda532f0b53df51fd7c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 28 Jun 2019 13:50:52 +0000
-Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
- with gold
+Date: Thu, 13 Mar 2025 10:54:01 +0800
+Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables
 
 * move pkg-config call to separate variable, so that the final version
   of the whole command so it's shown in log.do_compile_ptest_base
 * add ../src/google/protobuf/.libs/timestamp.pb.o when linking
-  add_person_cpp otherwise it fails to link with gold:
+  add_person_cpp otherwise it fails:
   i686-oe-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=core2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
   /tmp/cccjSJQs.o:addressbook.pb.cc:scc_info_Person_addressbook_2eproto: error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2ftimestamp_2eproto'
   /tmp/cccjSJQs.o:addressbook.pb.cc:descriptor_table_addressbook_2eproto_deps: error: undefined reference to 'descriptor_table_google_2fprotobuf_2ftimestamp_2eproto'
@@ -25,12 +24,14 @@ Upstream-Status: Pending
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 
+Rebase to v4.30.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  examples/Makefile | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index ef7a4ef58..7206e14e1 100644
+index 5290fdb03f..3b9545bf2a 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -2,6 +2,8 @@
@@ -42,20 +43,20 @@ index ef7a4ef58..7206e14e1 100644
  all: cpp java python
  
  cpp:    add_person_cpp    list_people_cpp
-@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
+@@ -46,11 +48,11 @@ protoc_middleman_ruby: addressbook.proto
  
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(CXX) -std=c++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
+-	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
  
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++14 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$(CXX) -std=c++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
+-	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
  
  add_person_dart: add_person.dart protoc_middleman_dart
  
---
+-- 
 2.34.1
 
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


