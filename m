Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CBBC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 06:51:48 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.13027.1669099902101585755
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Nov 2022 22:51:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout06.t-online.de (Postfix) with SMTP id 39AF9AA3C
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 07:51:40 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.106]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oxN85-3gr5cX0; Tue, 22 Nov 2022 07:51:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv2] spirv-cross: upgrade; fix build
Date: Tue, 22 Nov 2022 07:51:28 +0100
Message-Id: <20221122065128.373201-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669099897-177F3EA1-52F7A350/0/0 CLEAN NORMAL
X-TOI-MSGID: 380b9ab2-f0f1-4604-b344-b086c41d6a69
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 06:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99681

This updates spirv-cross to the latest release
 - use cmake and build shared.
 - get pc files created for use with pkgconfig

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...Add-install-PHONY-target-in-Makefile.patch | 31 ------------
 ...0001-Avoid-pessimizing-std-move-3124.patch | 50 -------------------
 ...STALL_LIBDIR-in-installed-CMake-file.patch | 35 -------------
 .../spir/spirv-shader-generator_git.bb        | 18 ++-----
 4 files changed, 5 insertions(+), 129 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/spir/files/0001-Add-install-=
PHONY-target-in-Makefile.patch
 delete mode 100644 meta-oe/recipes-graphics/spir/files/0001-Avoid-pessim=
izing-std-move-3124.patch
 delete mode 100644 meta-oe/recipes-graphics/spir/files/0001-Respect-CMAK=
E_INSTALL_LIBDIR-in-installed-CMake-file.patch

diff --git a/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-t=
arget-in-Makefile.patch b/meta-oe/recipes-graphics/spir/files/0001-Add-in=
stall-PHONY-target-in-Makefile.patch
deleted file mode 100644
index 78598ea1e..000000000
--- a/meta-oe/recipes-graphics/spir/files/0001-Add-install-PHONY-target-i=
n-Makefile.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8d9870b66c3cfcf12ce7e8e013946e2a215bb722 Mon Sep 17 00:00:00 2001
-From: Ankit Navik <ankit.tarot@gmail.com>
-Date: Sat, 22 Dec 2018 19:16:02 +0530
-Subject: [PATCH] Add install PHONY target in Makefile
-
----
- Makefile | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 0564b65..0993372 100644
---- a/Makefile
-+++ b/Makefile
-@@ -35,7 +35,13 @@ $(STATIC_LIB): $(OBJECTS)
- %.o: %.cpp
- 	$(CXX) -c -o $@ $< $(CXXFLAGS) -MMD
-=20
-+install:
-+	mkdir -p $(TARGET_DIR_BIN)
-+	mkdir -p $(TARGET_DIR_LIB)
-+	cp $(TARGET) $(TARGET_DIR_BIN)/
-+	cp $(STATIC_LIB) $(TARGET_DIR_LIB)/
-+
- clean:
- 	rm -f $(TARGET) $(OBJECTS) $(CLI_OBJECTS) $(STATIC_LIB) $(DEPS)
-=20
--.PHONY: clean
-+.PHONY: all install clean
---=20
-2.7.4
-
diff --git a/meta-oe/recipes-graphics/spir/files/0001-Avoid-pessimizing-s=
td-move-3124.patch b/meta-oe/recipes-graphics/spir/files/0001-Avoid-pessi=
mizing-std-move-3124.patch
deleted file mode 100644
index 9b48cdcd0..000000000
--- a/meta-oe/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move=
-3124.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 4fffcd275b50d08b54b0411679ead98970651bad Mon Sep 17 00:00:00 2001
-From: David Neto <dneto@google.com>
-Date: Fri, 27 Dec 2019 12:05:58 -0500
-Subject: [PATCH] Avoid pessimizing std::move (#3124)
-
-Should fix a warning
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Tools/c=
ommit/8aa423930db37e37086665efcc55944d577c06e5]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/opt/pass_fixture.h | 9 +++------
- 1 file changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/test/opt/pass_fixture.h b/test/opt/pass_fixture.h
-index 53fb206f..64c089d8 100644
---- a/test/opt/pass_fixture.h
-+++ b/test/opt/pass_fixture.h
-@@ -60,8 +60,7 @@ class PassTest : public TestT {
-   // from pass Process() function.
-   std::tuple<std::vector<uint32_t>, Pass::Status> OptimizeToBinary(
-       Pass* pass, const std::string& original, bool skip_nop) {
--    context_ =3D
--        std::move(BuildModule(env_, consumer_, original, assemble_optio=
ns_));
-+    context_ =3D BuildModule(env_, consumer_, original, assemble_option=
s_);
-     EXPECT_NE(nullptr, context()) << "Assembling failed for shader:\n"
-                                   << original << std::endl;
-     if (!context()) {
-@@ -197,8 +196,7 @@ class PassTest : public TestT {
-   // messages.
-   template <typename PassT, typename... Args>
-   void SinglePassRunAndFail(const std::string& original, Args&&... args=
) {
--    context_ =3D
--        std::move(BuildModule(env_, consumer_, original, assemble_optio=
ns_));
-+    context_ =3D BuildModule(env_, consumer_, original, assemble_option=
s_);
-     EXPECT_NE(nullptr, context()) << "Assembling failed for shader:\n"
-                                   << original << std::endl;
-     std::ostringstream errs;
-@@ -235,8 +233,7 @@ class PassTest : public TestT {
-   void RunAndCheck(const std::string& original, const std::string& expe=
cted) {
-     assert(manager_->NumPasses());
-=20
--    context_ =3D
--        std::move(BuildModule(env_, nullptr, original, assemble_options=
_));
-+    context_ =3D BuildModule(env_, nullptr, original, assemble_options_=
);
-     ASSERT_NE(nullptr, context());
-=20
-     context()->set_preserve_bindings(OptimizerOptions()->preserve_bindi=
ngs_);
---=20
-2.24.1
-
diff --git a/meta-oe/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTA=
LL_LIBDIR-in-installed-CMake-file.patch b/meta-oe/recipes-graphics/spir/f=
iles/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
deleted file mode 100644
index 5d37da8fe..000000000
--- a/meta-oe/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBD=
IR-in-installed-CMake-file.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From caf59c46ea5dc49e4dbf756c642b03e52c1b5468 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Dec 2019 07:02:24 -0800
-Subject: [PATCH] Respect CMAKE_INSTALL_LIBDIR in installed CMake files
-
-Upstream-Status: Submitted [https://github.com/google/effcee/pull/36]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt        | 1 +
- effcee/CMakeLists.txt | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
---- a/external/effcee/CMakeLists.txt
-+++ b/external/effcee/CMakeLists.txt
-@@ -27,6 +27,7 @@ endif()
-=20
- include(cmake/setup_build.cmake)
- include(cmake/utils.cmake)
-+include(GNUInstallDirs)
-=20
- add_subdirectory(third_party)
- add_subdirectory(effcee)
---- a/external/effcee/effcee/CMakeLists.txt
-+++ b/external/effcee/effcee/CMakeLists.txt
-@@ -14,8 +14,8 @@ install(
-   DESTINATION
-     include/effcee)
- install(TARGETS effcee
--  LIBRARY DESTINATION lib
--  ARCHIVE DESTINATION lib)
-+  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
-=20
- if(EFFCEE_BUILD_TESTING)
-   add_executable(effcee-test
diff --git a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb =
b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
index bf0a5947b..bf3070701 100644
--- a/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-shader-generator_git.bb
@@ -5,18 +5,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f=
14655fc854ddc3c6bd57"
 SECTION =3D "graphics"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "ed16b3e69985feaf565efbecea70a1cc2fca2a58"
-SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=3Dmast=
er;protocol=3Dhttps \
-	file://0001-Add-install-PHONY-target-in-Makefile.patch \
-"
+SRCREV =3D "f09ba2777714871bddb70d049878af34b94fa54d"
+SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Cross.git;branch=3Dmast=
er;protocol=3Dhttps"
+inherit cmake pkgconfig
=20
-EXTRA_OEMAKE +=3D 'TARGET_DIR_LIB=3D"${D}${libdir}"'=20
-EXTRA_OEMAKE +=3D 'TARGET_DIR_BIN=3D"${D}${bindir}"'
+EXTRA_OECMAKE =3D "-DSPIRV_CROSS_SHARED=3DON"
=20
-do_compile () {
-	cd ${S} && oe_runmake
-}
-
-do_install () {
-	cd ${S} && oe_runmake install
-}
+FILES:${PN} +=3D "${datadir}"
--=20
2.34.1


