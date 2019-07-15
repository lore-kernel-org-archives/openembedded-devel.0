Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D09577ED62
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 05:55:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,493,1557158400"; d="scan'208";a="71445994"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jul 2019 13:55:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 05B104CDDB0D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:54:48 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 15 Jul 2019 13:55:03 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jul 2019 13:54:13 +0800
Message-ID: <20190715055413.17875-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 05B104CDDB0D.AD261
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] protobuf: upgrade 3.8.0 -> 3.9.0
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
X-List-Received-Date: Mon, 15 Jul 2019 05:55:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from protobuf_3.8.0.bb to protobuf_3.9.0.bb.

-protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch
 Removed since this is included in 3.9.0.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...s-map_util.h-to-list-of-installed-headers.patch | 52 ----------------------
 .../{protobuf_3.8.0.bb => protobuf_3.9.0.bb}       |  5 +--
 2 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.8.0.bb => protobuf_3.9.0.bb} (93%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch
deleted file mode 100644
index a160e5e..0000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From ea6e776e50971c89ad2293046b6ae2a6a9753c56 Mon Sep 17 00:00:00 2001
-From: Adam Cozzette <acozzette@google.com>
-Date: Thu, 6 Jun 2019 10:29:58 -0700
-Subject: [PATCH] Added stubs/map_util.h to list of installed headers
-
-This should fix issue #6186. I also had to remove a couple unnecessary
-const keywords in map_util.h because the no_warning_test was showing
-errors about those.
-
-Upstream-Status: Submitted [https://github.com/protocolbuffers/protobuf/pull/6223]
----
- src/Makefile.am                      | 1 +
- src/google/protobuf/stubs/map_util.h | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index be18ba76..1689e221 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -72,6 +72,7 @@ nobase_include_HEADERS =                                         \
-   google/protobuf/stubs/hash.h                                   \
-   google/protobuf/stubs/logging.h                                \
-   google/protobuf/stubs/macros.h                                 \
-+  google/protobuf/stubs/map_util.h                               \
-   google/protobuf/stubs/mutex.h                                  \
-   google/protobuf/stubs/once.h                                   \
-   google/protobuf/stubs/platform_macros.h                        \
-diff --git a/src/google/protobuf/stubs/map_util.h b/src/google/protobuf/stubs/map_util.h
-index 2313e1f5..b04d9d46 100644
---- a/src/google/protobuf/stubs/map_util.h
-+++ b/src/google/protobuf/stubs/map_util.h
-@@ -620,7 +620,7 @@ bool UpdateReturnCopy(Collection* const collection,
- // twice. Unlike UpdateReturnCopy this also does not come with the issue of an
- // undefined previous* in case new data was inserted.
- template <class Collection>
--typename Collection::value_type::second_type* const
-+typename Collection::value_type::second_type*
- InsertOrReturnExisting(Collection* const collection,
-                        const typename Collection::value_type& vt) {
-   std::pair<typename Collection::iterator, bool> ret = collection->insert(vt);
-@@ -633,7 +633,7 @@ InsertOrReturnExisting(Collection* const collection,
-
- // Same as above, except for explicit key and data.
- template <class Collection>
--typename Collection::value_type::second_type* const
-+typename Collection::value_type::second_type*
- InsertOrReturnExisting(
-     Collection* const collection,
-     const typename Collection::value_type::first_type& key,
---
-2.11.0
-
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.9.0.bb
similarity index 93%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.9.0.bb
index be5caa4..38e2286 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.8.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.9.0.bb
@@ -10,12 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS_append_class-target = " protobuf-native"
 
-SRCREV = "09745575a923640154bcf307fba8aedff47f240a"
+SRCREV = "6a59a2ad1f61d9696092f79b6d74368b4d7970a3"
 
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.8.x \
+SRC_URI = "git://github.com/google/protobuf.git;branch=3.9.x \
            file://run-ptest \
            file://0001-protobuf-fix-configure-error.patch \
-           file://0001-Added-stubs-map_util.h-to-list-of-installed-headers.patch \
            file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
 "
-- 
2.7.4




