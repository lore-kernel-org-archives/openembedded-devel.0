Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id E35EE7E6BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 10:23:18 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5HANJZ3023875
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 12:23:19 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.117.28])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x5HANHKq001759;
	Mon, 17 Jun 2019 12:23:17 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id E084310D1262;
	Mon, 17 Jun 2019 12:23:16 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2019 12:23:04 +0200
Message-Id: <20190617102305.20150-2-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190617102305.20150-1-pascal.bach@siemens.com>
References: <20190617102305.20150-1-pascal.bach@siemens.com>
Subject: [meta-oe][PATCHv4 2/3] protobuf-c: add patch for protobuf 3 compatibility
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
X-List-Received-Date: Mon, 17 Jun 2019 10:23:19 -0000

There is no release yet of protobuf-c that is compatible with protobuf 3.
Master is already patched so this is just a straight backport of this patch.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../protobuf-c/protobuf3-compatibility.patch       | 55 ++++++++++++++++++++++
 .../recipes-devtools/protobuf/protobuf-c_1.3.1.bb  |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibility.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibility.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibility.patch
new file mode 100644
index 000000000..35914952d
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf3-compatibility.patch
@@ -0,0 +1,55 @@
+From 7456d1621223d425b8a3fd74e435a79c046169fb Mon Sep 17 00:00:00 2001
+From: Robert Edmonds <edmonds@users.noreply.github.com>
+Date: Wed, 10 Apr 2019 20:47:48 -0400
+Subject: [PATCH] t/generated-code2/cxx-generate-packed-data.cc: Fix build
+ failure on newer protobuf
+
+ Upstream-Status: Backport [https://github.com/protobuf-c/protobuf-c/pull/369]
+
+google::protobuf::Message::Reflection has been removed in newer versions
+of protobuf. The replacement is google::protobuf::Reflection.
+
+protobuf in commit 779f61c6a3ce02a119e28e802f229e61b69b9046 ("Integrate
+recent changes from google3.", from August 2008) changed the following
+in message.h:
+
+    @@ -336,7 +337,8 @@ class LIBPROTOBUF_EXPORT Message {
+
+       // Introspection ---------------------------------------------------
+
+    -  class Reflection;  // Defined below.
+    +  // Typedef for backwards-compatibility.
+    +  typedef google::protobuf::Reflection Reflection;
+
+The "typedef for backwards-compatibility" apparently lasted ten years
+until protobuf commit 6bbe197e9c1b6fc38cbdc45e3bf83fa7ced792a3
+("Down-integrate from google3.", from August 2018) which finally removed
+the typedef:
+
+    @@ -327,8 +344,6 @@ class LIBPROTOBUF_EXPORT Message : public MessageLite {
+
+       // Introspection ---------------------------------------------------
+
+    -  // Typedef for backwards-compatibility.
+    -  typedef google::protobuf::Reflection Reflection;
+
+This commit updates the only use of this typedef (in the test suite) to
+directly refer to the replacement, google::protobuf::Reflection. This
+fixes the build failure in the test suite.
+---
+ t/generated-code2/cxx-generate-packed-data.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/t/generated-code2/cxx-generate-packed-data.cc b/t/generated-code2/cxx-generate-packed-data.cc
+index 4fd3e25..0865d2e 100644
+--- a/t/generated-code2/cxx-generate-packed-data.cc
++++ b/t/generated-code2/cxx-generate-packed-data.cc
+@@ -998,7 +998,7 @@ static void dump_test_packed_repeated_enum (void)
+ static void dump_test_unknown_fields (void)
+ {
+   EmptyMess mess;
+-  const google::protobuf::Message::Reflection *reflection = mess.GetReflection();
++  const google::protobuf::Reflection *reflection = mess.GetReflection();
+   google::protobuf::UnknownFieldSet *fs = reflection->MutableUnknownFields(&mess);
+
+ #if GOOGLE_PROTOBUF_VERSION >= 2001000
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
index 7ef030092..1d1782306 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
@@ -15,7 +15,9 @@ DEPENDS = "protobuf-native protobuf"
 PV .= "+git${SRCPV}"
 SRCREV = "269771b4b45d3aba04e59569f53600003db8d9ff"
 
-SRC_URI = "git://github.com/protobuf-c/protobuf-c.git"
+SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
+           file://protobuf3-compatibility.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.11.0


