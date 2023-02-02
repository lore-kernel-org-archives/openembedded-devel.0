Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EE3C61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 12:59:36 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.13777.1675342766756937463
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Feb 2023 04:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cxUjFosM;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id f10so1683564qtv.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Feb 2023 04:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1cEhNv+6Wtapu1Jb7TieKS3WHJZHt6xdH7QaYAw8ik=;
        b=cxUjFosMD4Lt8DahEmiNvRLZ9Va13R/v3djVwp0AXJOuvM0az7mHsKfnRE15UCiyaK
         oMcT93aSMRExQSKS8CUwvdYZHUhrudgypVGkvxkhm/Ke8yA1PV5+/oWWkZLPlfJb8Ijg
         LkwIuw/cKHcLfgdVruP5Vd5INvRMpTkvqtNXLqZ3TfPULh9e6fzYinT/e5E6C7SGBIoH
         RHrPOnqpbZT+v8ZQ/O2jol0+ydE90+6u1qI3SnNmQ9/EFz5kYIKXy3ajr6f7ez66mAx3
         X1XapBWYQ6BV0zENuvhIwkJXgwf937qEsiO/yNxLXgXWtZtQJYXKcEGAt+szrv9oU5yW
         NHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1cEhNv+6Wtapu1Jb7TieKS3WHJZHt6xdH7QaYAw8ik=;
        b=mUoUblBEd9JYc5jTi0iiLz7OeB3ZF/uYaClfeciJlJYpwkZpMdASyg0/XiZ57homR6
         CF5/O7bXiGn8ViiJFtHeOss99udAFt/lTCXGJm64iNoSCj7ugL5o0Bt4NAqzlMLK3dIh
         Wx9NIv3axQKIsshnvdCbI2gj9TtbJX1vNENIPfvUtNcR2LV5+01wVGj7CpenJPKdSGn7
         KvR5qlsDtk8iXz4h2QjhwV8uvwBn+pq6T2P17+Ljvk2yCzNpwvyhJzaAHiCIyFo2IC3g
         hZBbJbiaNMpfMVynEodm7vOik6jQaIlhnNhqf34ej+lYCNg8LJ+ib+Md8a2s5sJVN8Cx
         SPMA==
X-Gm-Message-State: AO0yUKXwNuVJKOtPUlon5zr17DOJseSA3lh7NwMP34S5lnfAHq5TE2Ea
	v4SPx5n9BSmwfzpSltStiz3zIUdxchA=
X-Google-Smtp-Source: AK7set+hHe5CVdL0NXCfh2/Uyw14GWOkhLwX+CYQ1aLvDB4asVmq6BS9PSpbm2w3XOiqcaohq3Pcmg==
X-Received: by 2002:ac8:5ac8:0:b0:3b8:6b4c:aba8 with SMTP id d8-20020ac85ac8000000b003b86b4caba8mr10856074qtd.39.1675342765728;
        Thu, 02 Feb 2023 04:59:25 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:7fef:553c:2dc6:747b])
        by smtp.gmail.com with ESMTPSA id 3-20020ac856e3000000b003b86c0046a0sm7181004qtu.20.2023.02.02.04.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 04:59:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] nodejs-oe-cache-native: initial checkin
Date: Thu,  2 Feb 2023 07:59:24 -0500
Message-Id: <20230202125924.3771885-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Feb 2023 12:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100913

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

This implements an 'npm cache add' like functionality but allows to
specify the key of the data and sets metadata which are required to
find the data.

It is used to cache information as done during 'npm install'.

Keyformat and metadata are nodejs version specific.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 035d9c61e81b32cb62706cfdbfae08b1bac7ae88)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


