Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28449CD6E4A
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 07:08:59 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2129.1780124918283855572
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2026 00:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=kPeW3Vft;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id 08629E5B8
	for <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 09:08:36 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.169.166]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wTDoA-4UKF8L0; Sat, 30 May 2026 09:08:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] jsoncpp: add a backport patch to fix build with gcc16
Date: Sat, 30 May 2026 09:08:23 +0200
Message-ID: <20260530070830.1495792-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1780124915-C27FB8E9-7C719272/0/0 CLEAN NORMAL
X-TOI-MSGID: 48d6115d-9b3f-47d1-8eed-1a2707a12dcd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1780124915; i=f_l_k@t-online.de;
	bh=L/Jkoa2BkYI84X2gkWUqzQN7YFv+VSWIHYA056tzFTQ=;
	h=From:To:Subject:Date;
	b=kPeW3VftobtQMLRlP/Z4zkyEYHzapgqMlFMbdPXqL1IPGbtuoP0NGtxAv6JdrQiee
	 hM1S/xf5aS0Ifg07u/zp9OAlEpadBQko57GXXaIwVIvrGqtzzsAFgUmUmrpFIEMd8S
	 JM1AU9T1mGHf4Y9CjTA2Av1YSgH9XZ5KSTHGW6KvNnDahQSkMirfYEkMnItR6krkMP
	 6gxDmVPdaYSfQWEMxZvIDTQBUgTUUDotayhKtqnIMohQ/XsrGUJYmhwvgyXKQRwiRL
	 7g7VohJU+LC8Qu2K6yRLiituKu8MXkfBUcEe6sP4HPHFvkyGUP7A0APo69RfG5KUK9
	 8BTPUHt3y/9SA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 07:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127292

Partially backport https://github.com/open-source-parsers/jsoncpp/commit/=
71d46ca38e90dc902e8178ba484af4f27fa11947.patch

This fixes build with gcc 16

Upstream-Status: Backport [https://github.com/open-source-parsers/jsoncpp=
/commit/71d46ca38e90dc902e8178ba484af4f27fa11947]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...6ca38e90dc902e8178ba484af4f27fa11947.patch | 59 +++++++++++++++++++
 .../recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90=
dc902e8178ba484af4f27fa11947.patch

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90dc902e8=
178ba484af4f27fa11947.patch b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/71=
d46ca38e90dc902e8178ba484af4f27fa11947.patch
new file mode 100644
index 0000000000..3f7ca7bd66
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/71d46ca38e90dc902e8178ba48=
4af4f27fa11947.patch
@@ -0,0 +1,59 @@
+From 71d46ca38e90dc902e8178ba484af4f27fa11947 Mon Sep 17 00:00:00 2001
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
+---
+ .github/workflows/cmake.yml |  2 +-
+ src/test_lib_json/main.cpp  | 12 +++++++-----
+ 2 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/src/test_lib_json/main.cpp b/src/test_lib_json/main.cpp
+index 501aba10e..08731f66a 100644
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
index 354f4e9115..bf91f8eff4 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
@@ -16,6 +16,7 @@ PE =3D "1"
 SRCREV =3D "3455302847cf1e4671f1d8f5fa953fd46a7b1404"
 SRC_URI =3D "git://github.com/open-source-parsers/jsoncpp;branch=3Dmaste=
r;protocol=3Dhttps;tag=3D${PV} \
            file://0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-166=
8-1.patch \
+           file://71d46ca38e90dc902e8178ba484af4f27fa11947.patch \
            file://run-ptest \
            "
=20
--=20
2.54.0


