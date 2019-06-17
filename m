Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 7E37C605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 10:23:16 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5HANGFH023707
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 12:23:16 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.117.28])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x5HANE99019489;
	Mon, 17 Jun 2019 12:23:14 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 250A010D1262;
	Mon, 17 Jun 2019 12:23:14 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2019 12:23:03 +0200
Message-Id: <20190617102305.20150-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCHv4 1/3] protobuf: 3.6.1 -> 3.8.0
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
X-List-Received-Date: Mon, 17 Jun 2019 10:23:17 -0000

Simple update to latest release

The patch is needed to make python3-protobuf compile
as otherwise a file it expects is missing.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...s-map_util.h-to-list-of-installed-headers.patch | 52 ++++++++++++++++++++++
 .../{protobuf_3.6.1.bb => protobuf_3.8.0.bb}       |  7 ++-
 2 files changed, 55 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.6.1.bb => protobuf_3.8.0.bb} (93%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch
new file mode 100644
index 000000000..a160e5e97
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch
@@ -0,0 +1,52 @@
+From ea6e776e50971c89ad2293046b6ae2a6a9753c56 Mon Sep 17 00:00:00 2001
+From: Adam Cozzette <acozzette@google.com>
+Date: Thu, 6 Jun 2019 10:29:58 -0700
+Subject: [PATCH] Added stubs/map_util.h to list of installed headers
+
+This should fix issue #6186. I also had to remove a couple unnecessary
+const keywords in map_util.h because the no_warning_test was showing
+errors about those.
+
+Upstream-Status: Submitted [https://github.com/protocolbuffers/protobuf/pull/6223]
+---
+ src/Makefile.am                      | 1 +
+ src/google/protobuf/stubs/map_util.h | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index be18ba76..1689e221 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -72,6 +72,7 @@ nobase_include_HEADERS =                                         \
+   google/protobuf/stubs/hash.h                                   \
+   google/protobuf/stubs/logging.h                                \
+   google/protobuf/stubs/macros.h                                 \
++  google/protobuf/stubs/map_util.h                               \
+   google/protobuf/stubs/mutex.h                                  \
+   google/protobuf/stubs/once.h                                   \
+   google/protobuf/stubs/platform_macros.h                        \
+diff --git a/src/google/protobuf/stubs/map_util.h b/src/google/protobuf/stubs/map_util.h
+index 2313e1f5..b04d9d46 100644
+--- a/src/google/protobuf/stubs/map_util.h
++++ b/src/google/protobuf/stubs/map_util.h
+@@ -620,7 +620,7 @@ bool UpdateReturnCopy(Collection* const collection,
+ // twice. Unlike UpdateReturnCopy this also does not come with the issue of an
+ // undefined previous* in case new data was inserted.
+ template <class Collection>
+-typename Collection::value_type::second_type* const
++typename Collection::value_type::second_type*
+ InsertOrReturnExisting(Collection* const collection,
+                        const typename Collection::value_type& vt) {
+   std::pair<typename Collection::iterator, bool> ret = collection->insert(vt);
+@@ -633,7 +633,7 @@ InsertOrReturnExisting(Collection* const collection,
+
+ // Same as above, except for explicit key and data.
+ template <class Collection>
+-typename Collection::value_type::second_type* const
++typename Collection::value_type::second_type*
+ InsertOrReturnExisting(
+     Collection* const collection,
+     const typename Collection::value_type::first_type& key,
+--
+2.11.0
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
similarity index 93%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
index cf72d9ca7..476d1e309 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
@@ -10,13 +10,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS_append_class-target = " protobuf-native"
 
-PV .= "+git${SRCPV}"
+SRCREV = "09745575a923640154bcf307fba8aedff47f240a"
 
-SRCREV = "48cb18e5c419ddd23d9badcfe4e9df7bde1979b2"
-
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.6.x \
+SRC_URI = "git://github.com/google/protobuf.git;branch=3.8.x \
            file://run-ptest \
            file://0001-protobuf-fix-configure-error.patch \
+           file://0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
2.11.0


