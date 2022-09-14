Return-Path: <paulo@eero.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD27BC6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 14:21:34 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web12.7006.1663165288399007120
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 07:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@eero.com header.s=google header.b=SQZG+a4v;
 spf=pass (domain: eero.com, ip: 209.85.160.42, mailfrom: paulo@eero.com)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so31612298fac.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eero.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TW7GJTq7OEvoTT8C0qSweL93VrkoW3BdWTdSvXEXhgg=;
        b=SQZG+a4vvQz6ar9XKx1yzjYWRPM7DPKSSbfAa5xg0bYGkOmsQzoQz0Cb+vXpjTyGB6
         sDtikOa/Ao0R59OgRpCZ+6xj65Oh276PrM/IAKCzwJcArZyA9vQyRTZc7tMpZuCnEn7Z
         nNSQYUkP74xHLpg2hPosLnBRjO0dbKLpsn0rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TW7GJTq7OEvoTT8C0qSweL93VrkoW3BdWTdSvXEXhgg=;
        b=rwRd/HfG7cfTqqxIRsjoyqo70MVWKugo3UywY9EcBgCwolvYDT3b5ILwxkbpoIGv6m
         OFaDWa+Mz54QnIMRRh6KMVG4FdR853htznvGzvTKmBwJxEAv9a4qOcIEUpPkVs+7G4uv
         Q4ltEa9P+CDj4QNutg3yWn69Uz+i7EZt8mGW3UJrXB84k6Ey2+FuLcNes/glgJH2ZSGL
         2iBJaYQRPMQGY7jkeHPKKxZPDnTRHnxzN5JYCiFEmrpCVsRvE2jZeyGsmLwXhuUV6HC9
         jf9Dfvyxqcsf0LryAa9nLgBvHRwmbPDNxcEUcTJvTeeOlqHZaVNGoaLwhr4xJzq4ZnjD
         qRsA==
X-Gm-Message-State: ACgBeo0QtYzm5dp4kefyps8CbSsqCbmiRQ1lHFA6cWKwmzeeo2ai8efZ
	k10xARNKmjtbmUXR+/kd3dp6hHOVh/NqkSC/
X-Google-Smtp-Source: 
 AA6agR7tMvRaigO5eDQc282vaNLlSKeBiQGM5nUeMlu1L2qZ7Wp3IlYREbpyosCsaLlnsSd0lySg+Q==
X-Received: by 2002:a05:6871:14e:b0:127:3f08:4599 with SMTP id
 z14-20020a056871014e00b001273f084599mr2386029oab.183.1663165287567;
        Wed, 14 Sep 2022 07:21:27 -0700 (PDT)
Received: from u21976b924a5851.ant.amazon.com
 (200-148-117-104.dsl.telesp.net.br. [200.148.117.104])
        by smtp.gmail.com with ESMTPSA id
 5-20020a9d0d85000000b0063975d170a8sm7262899ots.7.2022.09.14.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:21:27 -0700 (PDT)
From: paulo@eero.com
To: openembedded-devel@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][add-npm-commit-from-main-to-kirkstone]
  nodejs-oe-cache-native: initial checkin
Date: Wed, 14 Sep 2022 10:21:20 -0400
Message-Id: <20220914142120.53537-1-paulo@eero.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 14:21:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98804

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

This implements an 'npm cache add' like functionality but allows to
specify the key of the data and sets metadata which are required to
find the data.

It is used to cache information as done during 'npm install'.

Keyformat and metadata are nodejs version specific.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.17.1


