Return-Path: <pn@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id A2E8078745
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 17:04:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3zm6Rw216cz1r19k;
	Tue, 20 Feb 2018 18:05:00 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3zm6Rw1XP8z1qqkQ;
	Tue, 20 Feb 2018 18:05:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id zrGnUOmq3FyS; Tue, 20 Feb 2018 18:04:59 +0100 (CET)
X-Auth-Info: uubYLEHp8PlSAMzfk4JHdSVXw5e0dmR1XBlaCsMkwpM=
Received: from xpert.denx.de (unknown [62.91.23.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 20 Feb 2018 18:04:59 +0100 (CET)
From: Parthiban Nallathambi <pn@denx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Feb 2018 18:04:43 +0100
Message-Id: <20180220170444.10057-1-pn@denx.de>
X-Mailer: git-send-email 2.14.3
Cc: lusus@denx.de, ch@denx.de
Subject: [PATCH] nodejs: Remove unreferenced patches
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
X-List-Received-Date: Tue, 20 Feb 2018 17:05:00 -0000

From: Jonathan Liu <net147@gmail.com>

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...isable-running-gyp-files-for-bundled-deps.patch | 29 -----------
 .../nodejs/nodejs/no-registry.patch                | 59 ----------------------
 2 files changed, 88 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/no-registry.patch

diff --git a/meta-oe/recipes-devtools/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
deleted file mode 100644
index 324a4683d..000000000
--- a/meta-oe/recipes-devtools/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c2aff16cc196a61f4ab1cdae4a91c7926123c239 Mon Sep 17 00:00:00 2001
-From: Zuzana Svetlikova <zsvetlik@redhat.com>
-Date: Thu, 27 Apr 2017 14:25:42 +0200
-Subject: [PATCH] Disable running gyp on shared deps
-
----
- Makefile | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 0a217bd893..e1229ad07f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -79,10 +79,9 @@ $(NODE_G_EXE): config.gypi out/Makefile
- 	$(MAKE) -C out BUILDTYPE=Debug V=$(V)
- 	if [ ! -r $@ -o ! -L $@ ]; then ln -fs out/Debug/$(NODE_EXE) $@; fi
- 
--out/Makefile: common.gypi deps/uv/uv.gyp deps/http_parser/http_parser.gyp \
--              deps/zlib/zlib.gyp deps/v8/gypfiles/toolchain.gypi \
--              deps/v8/gypfiles/features.gypi deps/v8/src/v8.gyp node.gyp \
--              config.gypi
-+out/Makefile: common.gypi deps/http_parser/http_parser.gyp \
-+              deps/v8/gypfiles/toolchain.gypi deps/v8/gypfiles/features.gypi \
-+			  deps/v8/src/v8.gyp node.gyp config.gypi
- 	$(PYTHON) tools/gyp_node.py -f make
- 
- config.gypi: configure
--- 
-2.12.2
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/no-registry.patch b/meta-oe/recipes-devtools/nodejs/nodejs/no-registry.patch
deleted file mode 100644
index ed2473897..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/no-registry.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Bugfix for --no-registry in nodejs-v0.12.2
-
-diff -u -r node-v0.12.2_def/deps/npm/lib/cache/caching-client.js node-v0.12.2/deps/npm/lib/cache/caching-client.js
---- node-v0.12.2_def/deps/npm/lib/cache/caching-client.js	2015-04-01 01:13:01.000000000 +0300
-+++ node-v0.12.2/deps/npm/lib/cache/caching-client.js	2015-05-18 00:47:10.738599686 +0300
-@@ -67,6 +67,22 @@
-   var cacheBase = cacheFile(npm.config.get("cache"))(uri)
-   var cachePath = path.join(cacheBase, ".cache.json")
- 
-+  if (parsed.host === "noregistry") (function() {
-+    var stat = null
-+    var file = npm.config.get("cache") + parsed.pathname + "/.cache.json"
-+    try {
-+      stat = fs.statSync(cachePath)
-+    } catch (ex) {}
-+    if (!stat) try {
-+      stat = fs.statSync(file) 
-+      cachePath = file
-+    } catch (ex) {
-+      stat = "Registry not defined and registry files not found: \"" +
-+             cachePath + "\", \"" + file + "\"."
-+      throw new Error(stat)
-+    }
-+  })()
-+
-   // If the GET is part of a write operation (PUT or DELETE), then
-   // skip past the cache entirely, but still save the results.
-   if (uri.match(/\?write=true$/)) {
-@@ -83,12 +99,17 @@
-         }
-         catch (ex) {
-           data = null
-+          if (parsed.host === "noregistry")
-+            throw new Error("File \"" + cachePath+"\"" + " corrupted.")
-         }
- 
-         params.stat = stat
-         params.data = data
- 
--        get_.call(client, uri, cachePath, params, cb)
-+        if (parsed.host === "noregistry")
-+          cb(null, data, JSON.stringify(data), { statusCode : 304 })
-+        else
-+          get_.call(client, uri, cachePath, params, cb)
-       })
-     }
-     else {
-diff -u -r node-v0.12.2_def/deps/npm/lib/utils/map-to-registry.js node-v0.12.2/deps/npm/lib/utils/map-to-registry.js
---- node-v0.12.2_def/deps/npm/lib/utils/map-to-registry.js	2015-04-01 01:13:01.000000000 +0300
-+++ node-v0.12.2/deps/npm/lib/utils/map-to-registry.js	2015-05-18 01:15:10.030569613 +0300
-@@ -45,6 +45,8 @@
- 
-   log.silly("mapToRegistry", "registry", registry)
- 
-+  if (!registry) return cb(null, "http://noregistry/" + name, {})
-+
-   var auth = config.getCredentialsByURI(registry)
- 
-   // normalize registry URL so resolution doesn't drop a piece of registry URL
-- 
2.14.3


