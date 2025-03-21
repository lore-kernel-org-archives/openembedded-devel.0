Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E9FC35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 05:34:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14595.1742535259571345297
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 22:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=517513f68b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L4U1A4012184;
	Thu, 20 Mar 2025 22:34:18 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45eprrcncx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 20 Mar 2025 22:34:18 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 20 Mar 2025 22:34:17 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 20 Mar 2025 22:34:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH V5 1/2] protobuf: 4.25.5 -> 5.29.4
Date: Fri, 21 Mar 2025 13:34:14 +0800
Message-ID: <20250321053415.1875796-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=LZw86ifi c=1 sm=1 tr=0 ts=67dcfa5a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=Twlkf-z8AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=k-42gJp3AAAA:8
 a=X-PGBLIbrU-fZ1zkKJUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: 16r3m4CNNb96tZymczeA6oBuhya8_7JM
X-Proofpoint-ORIG-GUID: 16r3m4CNNb96tZymczeA6oBuhya8_7JM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210038
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52L4U1A4012184
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 05:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116162

Refresh local patches
- 0001-Fix-build-on-mips-clang.patch
- 0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch

Fix protobuf-native build failure with gcc 10

Fix dev-elf QA issue:
|ERROR: protobuf-5.29.4-r0 do_package_qa: QA Issue: -dev package protobuf=
-dev contains
non-symlink .so '/usr/lib/libutf8_range.so' [dev-elf]
|ERROR: protobuf-5.29.4-r0 do_package_qa: QA Issue: -dev package protobuf=
-dev contains
non-symlink .so '/usr/lib/libutf8_validity.so' [dev-elf]

Changelog:
https://github.com/protocolbuffers/protobuf/releases/tag/v29.4

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Fix-build-on-mips-clang.patch        | 26 +++++++----
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch | 31 +++++++------
 ...buf-native-build-failure-with-gcc-10.patch | 46 +++++++++++++++++++
 ...-add-version-marker-to-library-19009.patch | 43 +++++++++++++++++
 ...{protobuf_4.25.5.bb =3D> protobuf_5.29.4.bb} |  6 ++-
 5 files changed, 126 insertions(+), 26 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-p=
rotobuf-native-build-failure-with-gcc-10.patch
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_=
range-add-version-marker-to-library-19009.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.5.bb =3D> protob=
uf_5.29.4.bb} (95%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on=
-mips-clang.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-b=
uild-on-mips-clang.patch
index 9f6116c4c4..1e0d04dc8d 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-c=
lang.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-build-on-mips-c=
lang.patch
@@ -1,6 +1,6 @@
-From 08e46feb6553af670754e65d94c3bb6fcd4e0cf9 Mon Sep 17 00:00:00 2001
+From cd6c5f36c0dc38e4734b74b03923489b7bfb9aba Mon Sep 17 00:00:00 2001
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
+Rebase to v5.29.4
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- src/google/protobuf/port_def.inc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ src/google/protobuf/port_def.inc | 1 +
+ 1 file changed, 1 insertion(+)
=20
+diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/port=
_def.inc
+index 56f995e45..428d096b3 100644
 --- a/src/google/protobuf/port_def.inc
 +++ b/src/google/protobuf/port_def.inc
-@@ -255,6 +255,7 @@
+@@ -227,6 +227,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
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
index 7c4bf260eb..7a8906a9a4 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-r=
espect-CXX-LDFLAGS-variables-fix-.patch
@@ -1,13 +1,12 @@
-From e3fa241637ab5a7fa78c0d474802134cff75f91e Mon Sep 17 00:00:00 2001
+From f6a3554e37fb39f93e4b47a75318bbda53cfdb46 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 28 Jun 2019 13:50:52 +0000
-Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix b=
uild
- with gold
+Date: Thu, 20 Mar 2025 20:33:02 -0700
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
@@ -25,37 +24,39 @@ Upstream-Status: Pending
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
=20
+Rebase to 5.29.4
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  examples/Makefile | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
=20
 diff --git a/examples/Makefile b/examples/Makefile
-index ef7a4ef58..7206e14e1 100644
+index f7ee9b116..8cd1359e2 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
-@@ -2,6 +2,8 @@
+@@ -4,6 +4,8 @@
 =20
- .PHONY: all cpp java python clean
+ all: cpp java python
 =20
 +PROTOBUF :=3D $(shell pkg-config --cflags --libs protobuf)
 +
- all: cpp java python
-=20
  cpp:    add_person_cpp    list_people_cpp
-@@ -41,11 +43,11 @@ protoc_middleman_dart: addressbook.proto
+ dart:   add_person_dart   list_people_dart
+ go:     add_person_go     list_people_go
+@@ -46,11 +48,11 @@ protoc_middleman_ruby: addressbook.proto
 =20
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
 -	c++ -std=3Dc++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pk=
g-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp #$(CXX)=
 -std=3Dc++17 $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_c=
pp
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
 =20
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
 -	c++ -std=3Dc++14 list_people.cc addressbook.pb.cc -o list_people_cpp `=
pkg-config --cflags --libs protobuf`
-+	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp #$(CX=
X) -std=3Dc++17 $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_peop=
le_cpp
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.p=
b.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
 =20
  add_person_dart: add_person.dart protoc_middleman_dart
 =20
---
-2.34.1
+--=20
+2.25.1
=20
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf=
-native-build-failure-with-gcc-10.patch b/meta-oe/recipes-devtools/protob=
uf/protobuf/0001-fix-protobuf-native-build-failure-with-gcc-10.patch
new file mode 100644
index 0000000000..2edba6b7eb
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-fix-protobuf-native=
-build-failure-with-gcc-10.patch
@@ -0,0 +1,46 @@
+From 213f29fb63473304db098b3d12a0393fd50e4914 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Mar 2025 13:28:13 +0800
+Subject: [PATCH] fix protobuf-native build failure with gcc 10
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
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
+index e90cb8aa2..3ffac1307 100644
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
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-a=
dd-version-marker-to-library-19009.patch b/meta-oe/recipes-devtools/proto=
buf/protobuf/0001-utf8_range-add-version-marker-to-library-19009.patch
new file mode 100644
index 0000000000..e58fdc1d19
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-utf8_range-add-vers=
ion-marker-to-library-19009.patch
@@ -0,0 +1,43 @@
+From fd020ef700dbf2d324aecd087b8fcb6ff329feb6 Mon Sep 17 00:00:00 2001
+From: Jan Engelhardt <jengelh@inai.de>
+Date: Thu, 21 Nov 2024 11:30:17 -0800
+Subject: [PATCH] utf8_range: add version marker to library (#19009)
+
+Unversioned libraries / libraries without due ABI indicators are not all=
owed in certain Linux distributions because it precludes the concurrent p=
resence of multiple versions.
+
+If you have both /usr/lib/libprotobuf-lite.so.28.3.0 and /usr/lib/libpro=
tobuf-lite.so.29.0.0, both of them want libutf8_validity.so, but if the A=
BI is different between utf8_range 28 and utf8_range 29, that's a problem.
+
+Closes #19009
+
+COPYBARA_INTEGRATE_REVIEW=3Dhttps://github.com/protocolbuffers/protobuf/=
pull/19009 from jengelh:master 1a5f8682be2f2b84da07fcdd32474baae8088959
+PiperOrigin-RevId: 698855702
+
+Upstream-Status: Backport [https://github.com/protocolbuffers/protobuf/c=
ommit/ced605d0e6a7ad20985375b596b2ca6720e07737]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ third_party/utf8_range/CMakeLists.txt | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/third_party/utf8_range/CMakeLists.txt b/third_party/utf8_ra=
nge/CMakeLists.txt
+index 4276b97290..e054893c63 100644
+--- a/third_party/utf8_range/CMakeLists.txt
++++ b/third_party/utf8_range/CMakeLists.txt
+@@ -19,6 +19,15 @@ add_library (utf8_range
+ # A heavier-weight C++ wrapper that supports Abseil.
+ add_library (utf8_validity utf8_validity.cc utf8_range.c)
+=20
++set_target_properties(utf8_range PROPERTIES
++  VERSION ${protobuf_VERSION}
++  OUTPUT_NAME ${LIB_PREFIX}utf8_range
++)
++set_target_properties(utf8_validity PROPERTIES
++  VERSION ${protobuf_VERSION}
++  OUTPUT_NAME ${LIB_PREFIX}utf8_validity
++)
++
+ # Load Abseil dependency.
+ if (NOT TARGET absl::strings)
+   if (NOT ABSL_ROOT_DIR)
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
similarity index 95%
rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
index a470a7c643..777378369e 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
@@ -14,11 +14,13 @@ LIC_FILES_CHKSUM =3D " \
 DEPENDS =3D "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target =3D " protobuf-native"
=20
-SRCREV =3D "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
+SRCREV =3D "1be1c9d0ea6efa2a25bd7b76186844d1669be78a"
=20
-SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D25.x=
;protocol=3Dhttps \
+SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D29.x=
;protocol=3Dhttps \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch \
+           file://0001-fix-protobuf-native-build-failure-with-gcc-10.pat=
ch \
+           file://0001-utf8_range-add-version-marker-to-library-19009.pa=
tch \
            "
 SRC_URI:append:mips:toolchain-clang =3D " file://0001-Fix-build-on-mips-=
clang.patch "
 SRC_URI:append:mipsel:toolchain-clang =3D " file://0001-Fix-build-on-mip=
s-clang.patch "
--=20
2.34.1


