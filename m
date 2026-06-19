Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9E6CD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 19:29:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49167.1781894701701446120
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2026 11:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=qO4pIJTd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 67D8B1A01EF
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 18:44:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 250C4601B7
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 18:44:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28C71106C892C;
	Fri, 19 Jun 2026 20:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781894698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=R0++F0S3SngT31GVZAx1THrQuNwxYSwRrZF16sRwvjA=;
	b=qO4pIJTdsrbPsajeAC1z/vTq6MZ+JZkdukVfcJFbdfHwgZoLN96Cwd/27BLGc1FUZHgz+A
	9FUd4+cxJ3/MvLV/4C9w2Qt+6/oE9YlFV7AUjmnA9J3DCo3SICzr7guyKG74x540anApG1
	kipXJeg0tYfOrWWsokVKkbdJwpB4ZBzT8uDrR6W2opVtIBOp3cmIX8owaTvgG7eJpYxYWd
	JwXzpZiW5rdN+i6bQGlHiwQL3c1e1whttk8FQyA+3QrNTRbWAYgx7i1pd/nQ56YRv4bER+
	E1dm+faPCqAkNIRUNlHxMEsGaLrSQIGgAI0rquTfreKRMKn2/ZYWfiMWQayDsg==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [meta-oe][wrynose][PATCH] jsoncpp: fix GCC 16 (and Clang 22) build failure with u8 string literals
Date: Fri, 19 Jun 2026 20:44:43 +0200
Message-ID: <20260619184443.408195-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 19:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127683

This issue is known upstream: https://github.com/open-source-parsers/json=
cpp/issues/1684

Backport the corresponding fix, which is available from v1.9.8.

It reproduces with Clang 22.1.8 (from oe-core's master) as well, not
only GCC 16.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 ...build-failure-with-u8-string-literal.patch | 73 +++++++++++++++++++
 .../recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-fix-GCC=
-16-C-20-build-failure-with-u8-string-literal.patch

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-fix-GCC-16-C-2=
0-build-failure-with-u8-string-literal.patch b/meta-oe/recipes-devtools/j=
soncpp/jsoncpp/0001-fix-GCC-16-C-20-build-failure-with-u8-string-literal.=
patch
new file mode 100644
index 0000000000..c27255653a
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-fix-GCC-16-C-20-build=
-failure-with-u8-string-literal.patch
@@ -0,0 +1,73 @@
+From 143dd23261bc41d929d3603d0d502b2415bebbe4 Mon Sep 17 00:00:00 2001
+From: Jordan Bayles <bayles.jordan@gmail.com>
+Date: Thu, 14 May 2026 15:57:53 -0700
+Subject: [PATCH] fix: GCC 16 / C++20 build failure with u8 string litera=
ls
+ (#1685)
+
+* fix: GCC 16 / C++20 build failure with u8 string literals (#1684)
+
+In C++20, the `u8""` string literal prefix was changed to evaluate to `c=
onst char8_t[]` instead of `const char[]`. This caused compilation errors=
 when these literals were implicitly converted to `std::string` or passed=
 to functions expecting `const char*`.
+
+This commit adds `reinterpret_cast<const char*>` around the `u8` string =
literals in the test suite to resolve the build errors while maintaining =
the intended UTF-8 semantics.
+
+Additionally, this adds C++20 to the GitHub Actions CMake test matrix to=
 ensure we don't regress on newer standards.
+
+Fixes #1684
+
+* style: run clang-format
+
+Upstream-Status: Backport [https://github.com/open-source-parsers/jsoncp=
p/commit/71d46ca38e90dc902e8178ba484af4f27fa11947]
+---
+ .github/workflows/cmake.yml |  1 +
+ src/test_lib_json/main.cpp  | 12 +++++++-----
+ 2 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/.github/workflows/cmake.yml b/.github/workflows/cmake.yml
+index 91f387a..375fa90 100644
+--- a/.github/workflows/cmake.yml
++++ b/.github/workflows/cmake.yml
+@@ -8,6 +8,7 @@ jobs:
+       fail-fast: false
+       matrix:
+         os: [ubuntu-latest, windows-latest, macos-latest]
++        cxx_standard: [11, 17, 20]
+        =20
+     steps:
+       - name: checkout project
+diff --git a/src/test_lib_json/main.cpp b/src/test_lib_json/main.cpp
+index d6938c1..1144409 100644
+--- a/src/test_lib_json/main.cpp
++++ b/src/test_lib_json/main.cpp
+@@ -1993,7 +1993,8 @@ JSONTEST_FIXTURE_LOCAL(ValueTest, StaticString) {
+=20
+ JSONTEST_FIXTURE_LOCAL(ValueTest, WideString) {
+   // https://github.com/open-source-parsers/jsoncpp/issues/756
+-  const std::string uni =3D u8"\u5f0f\uff0c\u8fdb"; // "=E5=BC=8F=EF=BC=
=8C=E8=BF=9B"
++  const std::string uni =3D
++      reinterpret_cast<const char*>(u8"\u5f0f\uff0c\u8fdb"); // "=E5=BC=
=8F=EF=BC=8C=E8=BF=9B"
+   std::string styled;
+   {
+     Json::Value v;
+@@ -3109,9 +3110,9 @@ JSONTEST_FIXTURE_LOCAL(ReaderTest, strictModeParse=
Number) {
+ }
+=20
+ JSONTEST_FIXTURE_LOCAL(ReaderTest, parseChineseWithOneError) {
+-  checkParse(R"({ "pr)"
+-             u8"\u4f50\u85e4" // =E4=BD=90=E8=97=A4
+-             R"(erty" :: "value" })",
++  checkParse(reinterpret_cast<const char*>(R"({ "pr)"
++                                           u8"\u4f50\u85e4" // =E4=BD=90=
=E8=97=A4
++                                           R"(erty" :: "value" })"),
+              {{18, 19, "Syntax error: value, object or array expected."=
}},
+              "* Line 1, Column 19\n  Syntax error: value, object or arr=
ay "
+              "expected.\n");
+@@ -3223,7 +3224,8 @@ JSONTEST_FIXTURE_LOCAL(CharReaderTest, parseString=
) {
+     bool ok =3D reader->parse(doc, doc + std::strlen(doc), &root, &errs=
);
+     JSONTEST_ASSERT(ok);
+     JSONTEST_ASSERT(errs.empty());
+-    JSONTEST_ASSERT_EQUAL(u8"\u8A2a", root[0].asString()); // "=E8=A8=AA=
"
++    JSONTEST_ASSERT_EQUAL(reinterpret_cast<const char*>(u8"\u8A2a"),
++                          root[0].asString()); // "=E8=A8=AA"
+   }
+   {
+     char const doc[] =3D R"([ "\uD801" ])";
diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb b/meta-oe/=
recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
index 354f4e9115..6e931f15d1 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
@@ -17,6 +17,7 @@ SRCREV =3D "3455302847cf1e4671f1d8f5fa953fd46a7b1404"
 SRC_URI =3D "git://github.com/open-source-parsers/jsoncpp;branch=3Dmaste=
r;protocol=3Dhttps;tag=3D${PV} \
            file://0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-166=
8-1.patch \
            file://run-ptest \
+           file://0001-fix-GCC-16-C-20-build-failure-with-u8-string-lite=
ral.patch \
            "
=20
 inherit cmake ptest
--=20
2.47.0


