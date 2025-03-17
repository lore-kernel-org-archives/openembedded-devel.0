Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39814C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 06:06:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.45716.1742191576374911019
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 23:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=517168ab7a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H4iiSM020850;
	Sun, 16 Mar 2025 23:06:15 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d92jscgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 16 Mar 2025 23:06:14 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 16 Mar 2025 23:06:14 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 16 Mar 2025 23:06:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v4] protobuf: 4.25.5 -> 4.30.0
Date: Mon, 17 Mar 2025 14:06:12 +0800
Message-ID: <20250317060612.4111152-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMKF1spcbP58H+KjOHdkWOyicPAozdtM_02Q_PXTGDBK7cq0mQ@mail.gmail.com>
References: <CAMKF1spcbP58H+KjOHdkWOyicPAozdtM_02Q_PXTGDBK7cq0mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=QdRmvtbv c=1 sm=1 tr=0 ts=67d7bbd6 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=Twlkf-z8AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8
 a=InM8HypKDu392yxZR7oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-ORIG-GUID: P2shxiy5j1oOq09UqWBvnqKbAxr4tBEj
X-Proofpoint-GUID: P2shxiy5j1oOq09UqWBvnqKbAxr4tBEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_01,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 mlxscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503170043
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52H4iiSM020850
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 06:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116020

Refresh local patches
- 0001-Fix-build-on-mips-clang.patch
- 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch

Fix protobuf-native build failure with gcc 10

Changelog:
https://github.com/protocolbuffers/protobuf/releases/tag/v30.0

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Fix-build-on-mips-clang.patch        | 26 +++++++----
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 25 +++++------
 ...buf-native-build-failure-with-gcc-10.patch | 43 +++++++++++++++++++
 ...{protobuf_4.25.5.bb =3D> protobuf_4.30.0.bb} |  5 ++-
 4 files changed, 76 insertions(+), 23 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-p=
rotobuf-native-build-failure-with-gcc-10.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.5.bb =3D> protob=
uf_4.30.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on=
-mips-clang.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-b=
uild-on-mips-clang.patch
index 9f6116c4c4..6db22c26d3 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-c=
lang.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-c=
lang.patch
@@ -1,6 +1,6 @@
-From 08e46feb6553af670754e65d94c3bb6fcd4e0cf9 Mon Sep 17 00:00:00 2001
+From fd5a966a6385165506a1b84298465cbb9f44222d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 31 Oct 2021 23:39:44 -0700
+Date: Mon, 10 Mar 2025 19:59:19 -0700
 Subject: [PATCH] Fix build on mips/clang
=20
 clang13 crashes on mips, until its fixed upstream disable tailcall on
@@ -10,17 +10,25 @@ https://bugs.llvm.org/show_bug.cgi?id=3D52367
=20
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
=20
+diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/port=
_def.inc
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
-     !(defined(__NDK_MAJOR__) && __NDK_MAJOR <=3D 24)
+     !defined(_ARCH_PPC) && !defined(__wasm__) &&                      \
+     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__)
+ // Compilation fails on ARM32: b/195943306
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Mak=
efile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools=
/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch
index 7c4bf260eb..1b68c24c96 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
@@ -1,13 +1,12 @@
-From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2001
+From 9d50661003d78a4debfc7eda532f0b53df51fd7c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 28 Jun 2019 13:50:52 +0000
-Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix b=
uild
- with gold
+Date: Thu, 13 Mar 2025 10:54:01 +0800
+Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables
=20
 * move pkg-config call to separate variable, so that the final version
   of the whole command so it's shown in log.do_compile_ptest_base
 * add ../src/google/protobuf/.libs/timestamp.pb.o when linking
-  add_person_cpp otherwise it fails to link with gold:
+  add_person_cpp otherwise it fails:
   i686-oe-linux-g++  -m32 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3D=
sse --sysroot=3Dcore2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot -Wl,-O=
1 -Wl,--hash-style=3Dgnu -Wl,--as-needed add_person.cc addressbook.pb.cc =
-o add_person_cpp `pkg-config --cflags --libs protobuf`
   /tmp/cccjSJQs.o:addressbook.pb.cc:scc_info_Person_addressbook_2eproto:=
 error: undefined reference to 'scc_info_Timestamp_google_2fprotobuf_2fti=
mestamp_2eproto'
   /tmp/cccjSJQs.o:addressbook.pb.cc:descriptor_table_addressbook_2eproto=
_deps: error: undefined reference to 'descriptor_table_google_2fprotobuf_=
2ftimestamp_2eproto'
@@ -25,12 +24,14 @@ Upstream-Status: Pending
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
=20
+Rebase to v4.30.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  examples/Makefile | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
=20
 diff --git a/examples/Makefile b/examples/Makefile
-index ef7a4ef58..7206e14e1 100644
+index 5290fdb03f..3b9545bf2a 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -2,6 +2,8 @@
@@ -42,20 +43,20 @@ index ef7a4ef58..7206e14e1 100644
  all: cpp java python
 =20
  cpp:    add_person_cpp    list_people_cpp
-@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
+@@ -46,11 +48,11 @@ protoc_middleman_ruby: addressbook.proto
 =20
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pk=
g-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(CXX)=
 -std=3Dc++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_c=
pp
+-	c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cf=
lags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
 =20
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o list_people_cpp `=
pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$(CX=
X) -std=3Dc++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_peop=
le_cpp
+-	c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --=
cflags --libs protobuf`
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
 =20
  add_person_dart: add_person.dart protoc_middleman_dart
 =20
---
+--=20
 2.34.1
=20
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf=
-native-build-failure-with-gcc-10.patch b/meta-oe/recipes-devtools/protob=
uf/protobuf/0001-fix-protobuf-native-build-failure-with-gcc-10.patch
new file mode 100644
index 0000000000..d7c9f38eff
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf-native=
-build-failure-with-gcc-10.patch
@@ -0,0 +1,43 @@
+From 03dabf4b153071ec1bdcd2c278461984cc6f1714 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Mar 2025 13:28:13 +0800
+Subject: [PATCH] fix protobuf-native build failure with gcc 10
+
+Build protobuf-native failed on ubuntu 20.04 which has gcc 10
+
+protobuf-native/4.30.0/git/src/google/protobuf/port_def.inc:105:48:
+error: static assertion failed: Protobuf only supports C+
+   =E2=86=AA +17 and newer.
+   |   105 | #define PROTOBUF_CPLUSPLUS_MIN(x) (__cplusplus >=3D x)
+   |       |                                   ~~~~~~~~~~~~~^~~~~
+   | /home/kraj01/yoe/build/tmp/work/x86_64-linux/protobuf-native/4.30.0=
/git/src/google/protobuf/port_def.inc:119:15:
+note: in expansion of macro =E2=80=98PROTOBUF_CPLUSPLUS_MIN=E2=80=99
+   |   119 | static_assert(PROTOBUF_CPLUSPLUS_MIN(201703L),
+   |       |               ^~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ae3c324..eda19aa 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -14,6 +14,10 @@ endif()
+ # Project
+ project(protobuf C CXX)
+=20
++set(CMAKE_CXX_STANDARD 17)
++set(CMAKE_CXX_STANDARD_REQUIRED ON)
++set(CMAKE_CXX_EXTENSIONS OFF)
++
+ if(protobuf_DEPRECATED_CMAKE_SUBDIRECTORY_USAGE)
+   if(CMAKE_PROJECT_NAME STREQUAL "protobuf")
+     get_filename_component(CMAKE_SOURCE_DIR ${CMAKE_SOURCE_DIR} DIRECTO=
RY)
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
index a470a7c643..0d6123dfa0 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.30.0.bb
@@ -14,11 +14,12 @@ LIC_FILES_CHKSUM =3D " \
 DEPENDS =3D "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target =3D " protobuf-native"
=20
-SRCREV =3D "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
+SRCREV =3D "d295af5c3002c08e1bfd9d7f9e175d0a4d015f1e"
=20
-SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D25.x=
;protocol=3Dhttps \
+SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D30.x=
;protocol=3Dhttps \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch \
+           file://0001-fix-protobuf-native-build-failure-with-gcc-10.pat=
ch \
            "
 SRC_URI:append:mips:toolchain-clang =3D " file://0001-Fix-build-on-mips-=
clang.patch "
 SRC_URI:append:mipsel:toolchain-clang =3D " file://0001-Fix-build-on-mip=
s-clang.patch "
--=20
2.34.1


