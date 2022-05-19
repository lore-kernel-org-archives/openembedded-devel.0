Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2758C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 10:23:28 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web12.5899.1652955797254527310
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 03:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=Bp19ueiN;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JANFtm621511
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 12:23:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1652955795;
	bh=LZ7r9p8OmG9Wn9gY39XzaYdYGMNpljmvGvgOX9jF4z0=; l=3579;
	h=From:To:Cc:Subject:Date;
	b=Bp19ueiN0rP0+gSvV/9LAgc19NA/NOXihVwWm5cis6JP5PDIOFq6FGRzvqMENxfUF
	 DHmyt2PuVIScf6FnaSB+qi7uzF886Y2fV6XwPHxNWbHas+2RTaobQ0xt2K/Dn0jW6i
	 PHPAI/1lwIqYDTR34kTmovC3PlwYTpmP+RZa/dFhgpYdjEGyd2knUEsvfIYt10KfXw
	 VSXBxUAJuKotU4T7IOlC9E7vJJm7QwyN8dAf1NkEed000QnyNzxg0vZRwbB4mEzi8+
	 p5roUH2h69BoLLrBB2HIM82vSDgfdbKDIZ5ocjSJSMhRS+lB7PKiFgXN3Pn/aTGZlk
	 HNTZBz0aky3Qw==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 24JANDo72314393
	for <openembedded-devel@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Thu, 19 May 2022 12:23:13 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 30CE2D430B6; Thu, 19 May 2022 12:23:11 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 24JANAtD856628
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 19 May 2022 12:23:11 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nrdJG-004MdC-Sb;
	Thu, 19 May 2022 12:23:10 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [meta-oe] nodejs-oe-cache-native: initial checkin
Date: Thu, 19 May 2022 12:23:07 +0200
Message-Id: <20220519102307.1040263-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 10:23:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97186

This implements an 'npm cache add' like functionality but allows to
specify the key of the data and sets metadata which are required to
find the data.

It is used to cache information as done during 'npm install'.

Keyformat and metadata are nodejs version specific.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 .../nodejs/nodejs-oe-cache-16.14/oe-npm-cache | 77 +++++++++++++++++++
 .../nodejs/nodejs-oe-cache-native_16.14.bb    | 21 +++++
 2 files changed, 98 insertions(+)
 create mode 100755 meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
new file mode 100755
index 000000000..f59620764
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
@@ -0,0 +1,77 @@
+#!/usr/bin/env node
+
+/// Usage: oe-npm-cache <cache-dir> <type> <key> <file-name>
+///    <type> ... meta - metainformation about package
+///               tgz  - tarball
+
+const process = require("node:process");
+
+module.paths.unshift("@@libdir@@/node_modules/npm/node_modules");
+
+const cacache = require('cacache')
+const fs = require('fs')
+
+// argv[0] is 'node', argv[1] is this script
+const cache_dir = process.argv[2]
+const type      = process.argv[3]
+const key       = process.argv[4]
+const file      = process.argv[5]
+
+const data = fs.readFileSync(file)
+
+// metadata content is highly nodejs dependent; when cache entries are not
+// found, place debug statements in 'make-fetch-happen/lib/cache/policy.js'
+// (CachePolicy::satisfies())
+const xlate = {
+    'meta': {
+	'key_prefix': 'make-fetch-happen:request-cache:',
+	'metadata': function() {
+	    return {
+		time: Date.now(),
+		url:  key,
+		reqHeaders: {
+		    'accept': 'application/vnd.npm.install-v1+json; q=1.0, application/json; q=0.8, */*',
+		},
+		resHeaders: {
+		    "content-type": "application/json",
+		    "status": 200,
+		},
+		options: {
+		    compress: true,
+		}
+	    };
+	},
+    },
+
+    'tgz': {
+	'key_prefix': 'make-fetch-happen:request-cache:',
+	'metadata': function() {
+	    return {
+		time: Date.now(),
+		url:  key,
+		reqHeaders: {
+		    'accept': '*/*',
+		},
+		resHeaders: {
+		    "content-type": "application/octet-stream",
+		    "status": 200,
+		},
+		options: {
+		    compress: true,
+		},
+	    };
+	},
+    },
+};
+
+const info = xlate[type];
+let opts = {}
+
+if (info.metadata) {
+    opts['metadata'] = info.metadata();
+}
+
+cacache.put(cache_dir, info.key_prefix + key, data, opts)
+    .then(integrity => {
+	console.log(`Saved content of ${key} (${file}).`);
+})
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
new file mode 100644
index 000000000..a61dd5018
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "OE helper for manipulating npm cache"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+
+SRC_URI = "\
+    file://oe-npm-cache \
+"
+
+inherit native
+
+B = "${WORKDIR}/build"
+
+do_configure() {
+    sed -e 's!@@libdir@@!${libdir}!g' < '${WORKDIR}/oe-npm-cache' > '${B}/oe-npm-cache'
+}
+
+do_install() {
+    install -D -p -m 0755 ${B}/oe-npm-cache ${D}${bindir}/oe-npm-cache
+}
+
+RDEPENDS:${PN} = "nodejs-native"
-- 
2.36.1


