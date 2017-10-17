Return-Path: <net147@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 58FDD782D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:49:30 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id v78so1339166pgb.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 05:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2wl4j0a8zkBCnxL+g1GQL9xu090u9jztSX0HRivoOk4=;
	b=UkNaS3hNgJTycsI3h9TQbKJYE3l0wdyak26hdII7yuEVxy4Imb7mvxT3mX2gEVKHPN
	QqtsR4Cx/L+2LeH5ThbW/o0tmrT49VLvTfJEHDdWp29iW/NOfNgwp7D5xRoMvdE3ip7B
	lKQjJJqo82xt2ts3jcg7UiAQIj5gxcmnIQ5yccUpKvKQhqry4nV/opcHjMDGYxMZHm5D
	gZRJPgvNMt/Ayei11O1bN3EwxusFqxIx3lUgQvrpZqyAmJm77m1eHr7Cgm4Pnxq6LUXu
	kdw85buJSbBtOsevh8wca4ASihjZtSjhCoffsSuHFC7L29YHzgHs5I+aR8IsxIa3czFk
	iT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2wl4j0a8zkBCnxL+g1GQL9xu090u9jztSX0HRivoOk4=;
	b=Usu5lFdbI8IQEcRCcDV2Gd0WYZomClDLc/eO7MfcRl29DNbUJi3/94Db/HnRMk+e3g
	woRMrfgHYLQo4OnRyTVXrHdpYH4mA7rNwZ7GRB7l/5TbWTgj2zFLpUPRB12mBsYn1uxL
	BGcF+GrbcPLfGCGBApnauuTxCNXqGJ/7oAJ3Sl/2KQ+UQmiaQd2kGWugx8S35AdT2SrZ
	6ThSCakicxYkt7xPxEIPn6Edhs+d3WqINK92WpPTUfV9rY/rrcZIt1fvpg/5yG0SJ1Za
	lO7oUHS85NVgtjMmD1sXNyaFXhU391RaNBjZw7LmD/Dm77aQhFV08yBni6X5E+tq5ukU
	VNwQ==
X-Gm-Message-State: AMCzsaWiKkusp6vYmX/WYBZ6tOlBo6SuLtYztD3fi5sWiLlSRdkuo98c
	dnzhblKUOMvwYiQMoI+Kb9w=
X-Google-Smtp-Source: AOwi7QDUNukAwuWGQIITXPB1I8/Ys3FWt87VOWNBo7YBdo9jNcr4N3fvPDKA1EsjMGYeO4A4fRSjYQ==
X-Received: by 10.98.217.214 with SMTP id b83mr11393792pfl.144.1508244571886; 
	Tue, 17 Oct 2017 05:49:31 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	p12sm17425095pgn.90.2017.10.17.05.49.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 17 Oct 2017 05:49:31 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Oct 2017 23:50:09 +1100
Message-Id: <20171017125009.15273-1-net147@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [meta-oe][PATCH] nodejs: Remove unreferenced patches
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
X-List-Received-Date: Tue, 17 Oct 2017 12:49:31 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
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
2.14.2


