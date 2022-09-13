Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBA6C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 15:34:50 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.6278.1663083273772230668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 08:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LrNEuRoD;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id l14so28433346eja.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=QjI+IVMBF2WnzKi2pz5M1ZO0L0Bgo6pyuzd07XWD4Yo=;
        b=LrNEuRoDMnOB/3pVY4/jkf2MrO0b4OfA/Q0ASrnASO4A3QUDEjJc1Lrc1ZVfA4Z5eN
         ODyD1v7sU5Ja9mf2DTD/lwB6JyLBbiACdr8u9FCrgTAgOBSAm341A7VR9aw5ZxUvhzDS
         e9NYlT/YVR8m3jZVfyzALIAOoq1GHtzCWAJ6TUVeKO/5p/W+uyQFSG5Nw5vJXVnqFigE
         WhUr3nQjjBWn2IJCXV0Z1mucF4AjBqVJNYoZ4EhRhZ125B32wRwpVsuEn5pKgu6EWcKP
         1Y+A0iRaQCsfHDf0k+rs0eWWiTWlxoi92oE3htGLJA4QCWNJqD92CJvkcDtH4HAbwckV
         uZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=QjI+IVMBF2WnzKi2pz5M1ZO0L0Bgo6pyuzd07XWD4Yo=;
        b=7N0YvE6SXIqy+IfIPwvd6CFNN8+Qk1maJKKodwKaFFWIGt+9LmKZcJ9QiwrTqXTZG+
         1/2MnzJpSkmEmHxiRPzlYmYK3oKTo/vpwXFCcyzlPs4+aU2d/8umKZeE3Mk5kVDZugkj
         mBOeO9QWWhSDGT0jJyTCQUsPLlOnYNau6kR5iP3h4XvT0xDFW7SF8tkptymsBhd4WrpV
         7b2VNAzFzBS/k9Z/3FCetFi2hCQFNUC+pQVWAix/gxG5Twi9KWo3zGJjsTjwwbAkyx5r
         +e71EOwzkQEF1pxayrGV6EfKMlcvAKuf+dfJM8TIbswf/BYKCViNrUND7dJvj4tn3uWJ
         iitw==
X-Gm-Message-State: ACgBeo39xAitARr3tGI2IOOFfzJKofSWOXf40qm+iq6PlyM4JJ3gst/9
	SOGvJpkrr52w/QswPLyeazY/9POknhg=
X-Google-Smtp-Source: 
 AA6agR4gfpz06J90mtfy++eWPwZSydd2Ij0pBAp2F2QJ+5a+j4fIYov4LjMP2SW/H3RO15sqE8QaVQ==
X-Received: by 2002:a17:907:16a3:b0:779:fad6:3253 with SMTP id
 hc35-20020a17090716a300b00779fad63253mr14312599ejc.453.1663083272158;
        Tue, 13 Sep 2022 08:34:32 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a170906c19100b0073dbc35a0desm6188944ejz.100.2022.09.13.08.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 08:34:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone] nodejs-oe-cache-native: initial checkin
Date: Tue, 13 Sep 2022 17:34:28 +0200
Message-Id: <20220913153428.1610984-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 15:34:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98787

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
index 0000000000..f596207648
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
index 0000000000..a61dd5018f
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
2.37.3


