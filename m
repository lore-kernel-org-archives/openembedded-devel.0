Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id D99777EB97
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 11:10:46 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x62BAkxh029333
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Jul 2019 13:10:47 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.117.127])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x62BAikH019877;
	Tue, 2 Jul 2019 13:10:44 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 7286210D496A;
	Tue,  2 Jul 2019 13:10:44 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2019 13:10:32 +0200
Message-Id: <20190702111032.999-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] protobuf: 1.3.1 -> 1.3.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jul 2019 11:10:47 -0000

The patch can be dropped as it is included in this release.
Also drop the +git suffix as the version matches the version exactly.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../protobuf-c/protobuf3-compatibility.patch       | 55 ----------------------
 .../{protobuf-c_1.3.1.bb => protobuf-c_1.3.2.bb}   |  4 +-
 2 files changed, 1 insertion(+), 58 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibility.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.3.1.bb => protobuf-c_1.3.2.bb} (90%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibility.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibility.patch
deleted file mode 100644
index 35914952d..000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibility.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 7456d1621223d425b8a3fd74e435a79c046169fb Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Wed, 10 Apr 2019 20:47:48 -0400
-Subject: [PATCH] t/generated-code2/cxx-generate-packed-data.cc: Fix build
- failure on newer protobuf
-
- Upstream-Status: Backport [https://github.com/protobuf-c/protobuf-c/pull/369]
-
-google::protobuf::Message::Reflection has been removed in newer versions
-of protobuf. The replacement is google::protobuf::Reflection.
-
-protobuf in commit 779f61c6a3ce02a119e28e802f229e61b69b9046 ("Integrate
-recent changes from google3.", from August 2008) changed the following
-in message.h:
-
-    @@ -336,7 +337,8 @@ class LIBPROTOBUF_EXPORT Message {
-
-       // Introspection ---------------------------------------------------
-
-    -  class Reflection;  // Defined below.
-    +  // Typedef for backwards-compatibility.
-    +  typedef google::protobuf::Reflection Reflection;
-
-The "typedef for backwards-compatibility" apparently lasted ten years
-until protobuf commit 6bbe197e9c1b6fc38cbdc45e3bf83fa7ced792a3
-("Down-integrate from google3.", from August 2018) which finally removed
-the typedef:
-
-    @@ -327,8 +344,6 @@ class LIBPROTOBUF_EXPORT Message : public MessageLite {
-
-       // Introspection ---------------------------------------------------
-
-    -  // Typedef for backwards-compatibility.
-    -  typedef google::protobuf::Reflection Reflection;
-
-This commit updates the only use of this typedef (in the test suite) to
-directly refer to the replacement, google::protobuf::Reflection. This
-fixes the build failure in the test suite.
----
- t/generated-code2/cxx-generate-packed-data.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/t/generated-code2/cxx-generate-packed-data.cc b/t/generated-code2/cxx-generate-packed-data.cc
-index 4fd3e25..0865d2e 100644
---- a/t/generated-code2/cxx-generate-packed-data.cc
-+++ b/t/generated-code2/cxx-generate-packed-data.cc
-@@ -998,7 +998,7 @@ static void dump_test_packed_repeated_enum (void)
- static void dump_test_unknown_fields (void)
- {
-   EmptyMess mess;
--  const google::protobuf::Message::Reflection *reflection = mess.GetReflection();
-+  const google::protobuf::Reflection *reflection = mess.GetReflection();
-   google::protobuf::UnknownFieldSet *fs = reflection->MutableUnknownFields(&mess);
-
- #if GOOGLE_PROTOBUF_VERSION >= 2001000
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
similarity index 90%
rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
index 1d1782306..6d1ffc3f4 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
@@ -12,11 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cb901168715f4782a2b06c3ddaefa558"
 
 DEPENDS = "protobuf-native protobuf"
 
-PV .= "+git${SRCPV}"
-SRCREV = "269771b4b45d3aba04e59569f53600003db8d9ff"
+SRCREV = "1390409f4ee4e26d0635310995b516eb702c3f9e"
 
 SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
-           file://protobuf3-compatibility.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.11.0


