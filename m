Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 13430601E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jun 2015 12:54:50 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so105026491wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jun 2015 05:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vULJak5ORyJayODkQOETZp9dyq1kdTMAOmXfPRqZuI0=;
	b=Yo+04yVwMfNNGKg+bzT+u4rzzAz5fU75XZbNb1tSuhJ6h07dkkfgtOOjvXZ3KZTnnk
	BE7KI91PqckCr5vPzJ6e4sTLE70XbyeOXAAOUOjN9weov9pNwTOHpAStaThIlBhpannE
	pSIxIzdPwQ/I7B2kxapFTjNZKtwCx/s0Rbu3hrrwXX4Jdjzr4zhsZj2S6KzdJLhC5vgw
	Qo1WVq/RNBaIb+kqiuhn9iXVuzurynJaEPmb42D2/kVq0jeqNVNUKkC6W0u6IxncavXd
	6QGKhRN/ZQV2lZyHKdsMYsSuz1zvwmc7RnyampC6j5k9bxXWuh1PbQTBs7fb5Y53orym
	lu4w==
X-Received: by 10.180.11.225 with SMTP id t1mr3220545wib.94.1435064090773;
	Tue, 23 Jun 2015 05:54:50 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	gw7sm22299389wib.15.2015.06.23.05.54.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jun 2015 05:54:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jun 2015 14:54:54 +0200
Message-Id: <1435064094-19617-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.4
Cc: Martin Jansa <martin.jansa@lge.com>
Subject: [meta-oe][master][fido][PATCH] nodejs: fix no-registry option
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jun 2015 12:54:53 -0000

From: Martin Jansa <martin.jansa@lge.com>

* https://github.com/npm/npm/issues/3691
* https://github.com/npm/npm/issues/5509

Signed-off-by: Martin Jansa <martin.jansa@lge.com>
---
 .../nodejs/nodejs/no-registry.patch                | 59 ++++++++++++++++++++++
 meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb   |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/no-registry.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/no-registry.patch b/meta-oe/recipes-devtools/nodejs/nodejs/no-registry.patch
new file mode 100644
index 0000000..ed24738
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/no-registry.patch
@@ -0,0 +1,59 @@
+Bugfix for --no-registry in nodejs-v0.12.2
+
+diff -u -r node-v0.12.2_def/deps/npm/lib/cache/caching-client.js node-v0.12.2/deps/npm/lib/cache/caching-client.js
+--- node-v0.12.2_def/deps/npm/lib/cache/caching-client.js	2015-04-01 01:13:01.000000000 +0300
++++ node-v0.12.2/deps/npm/lib/cache/caching-client.js	2015-05-18 00:47:10.738599686 +0300
+@@ -67,6 +67,22 @@
+   var cacheBase = cacheFile(npm.config.get("cache"))(uri)
+   var cachePath = path.join(cacheBase, ".cache.json")
+ 
++  if (parsed.host === "noregistry") (function() {
++    var stat = null
++    var file = npm.config.get("cache") + parsed.pathname + "/.cache.json"
++    try {
++      stat = fs.statSync(cachePath)
++    } catch (ex) {}
++    if (!stat) try {
++      stat = fs.statSync(file) 
++      cachePath = file
++    } catch (ex) {
++      stat = "Registry not defined and registry files not found: \"" +
++             cachePath + "\", \"" + file + "\"."
++      throw new Error(stat)
++    }
++  })()
++
+   // If the GET is part of a write operation (PUT or DELETE), then
+   // skip past the cache entirely, but still save the results.
+   if (uri.match(/\?write=true$/)) {
+@@ -83,12 +99,17 @@
+         }
+         catch (ex) {
+           data = null
++          if (parsed.host === "noregistry")
++            throw new Error("File \"" + cachePath+"\"" + " corrupted.")
+         }
+ 
+         params.stat = stat
+         params.data = data
+ 
+-        get_.call(client, uri, cachePath, params, cb)
++        if (parsed.host === "noregistry")
++          cb(null, data, JSON.stringify(data), { statusCode : 304 })
++        else
++          get_.call(client, uri, cachePath, params, cb)
+       })
+     }
+     else {
+diff -u -r node-v0.12.2_def/deps/npm/lib/utils/map-to-registry.js node-v0.12.2/deps/npm/lib/utils/map-to-registry.js
+--- node-v0.12.2_def/deps/npm/lib/utils/map-to-registry.js	2015-04-01 01:13:01.000000000 +0300
++++ node-v0.12.2/deps/npm/lib/utils/map-to-registry.js	2015-05-18 01:15:10.030569613 +0300
+@@ -45,6 +45,8 @@
+ 
+   log.silly("mapToRegistry", "registry", registry)
+ 
++  if (!registry) return cb(null, "http://noregistry/" + name, {})
++
+   var auth = config.getCredentialsByURI(registry)
+ 
+   // normalize registry URL so resolution doesn't drop a piece of registry URL
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb
index 81b8c0d..cc4a5ce 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb
@@ -7,6 +7,7 @@ DEPENDS = "openssl"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
     file://enable-armv5e-build.patch \
+    file://no-registry.patch \
 "
 SRC_URI[md5sum] = "c2b4deea212c0b7c2f86368c65fab312"
 SRC_URI[sha256sum] = "3298d0997613a04ac64343e8316da134d04588132554ae402eb344e3369ec912"
-- 
2.4.4


