Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076D8C6FA8B
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:33:48 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.19183.1663590825459686992
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ot9ZC/6H;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id w2so16803879qtv.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=33N0CGoGcWeEGh961EwU4d8hjcRzbpmINF7jm49TMpw=;
        b=Ot9ZC/6HH231FNUnQWgJwGJXr/KQ8qi9WMQFhlzAvDaKEQOyqrHN6G4+4/q4MEHSrh
         6pE8H/7aS0UgQNRBIeCNiIn5AcCjl0HWoLrH10zAsXC+75UMSNLo6zn2eHB+T7hJneuD
         7m4F+TQJwUfQK4doaWRRxTqvq/F0jQVzdY1zdUoW/Fka2V7dli5rrg20XUVzfC3cMCe+
         E1qHC0jPhQ5mziF25Hk/RLagIvnDDoxOqiie+AYXIy68zR6bpgU88M+rtOC3OJpAWaZV
         Vp3D9ftDvHQo+XNCmBX8kMggtuQrWc88J6V8d4lpYG1tL40QbGUZw/TpqypUKFvtmOhW
         qz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=33N0CGoGcWeEGh961EwU4d8hjcRzbpmINF7jm49TMpw=;
        b=HNJ6AMZ/yhOheyyeE3CSnt1ORMVWSNJ59+t2A4dwyQMU4vUnkx41vNmqmpftUERSlI
         NUcYzZgElv8JkMHICcP8ACvKWgPh3uYPZLeieniD9mYyfXYX9KRhF8mpHZFL4cEAdpoX
         bphESTeyQgTHFvtaX7AspO/L/NZsR0kSbn5wglPDaE9dozZbf8sFycgRrvzWR8b3251H
         567hgRBM4M2JT4ebkIlRFUdPuruZ/VGBD51FGxuvU/eFlQ34jYiVSQPgy+fC6nTZI3cs
         9OX+sspyYlg1sHRCElwUSe69p1BioijEbg5EEMzWhDgOuy+27qf5XbX7s71xGVshYGrz
         1EGQ==
X-Gm-Message-State: ACrzQf2kBdYOAoWUODYzsHBgcW9rtPMl8QqF9z/DW3JqcV67mLABkC4/
	FRw/UjrdDeqxKGtechMs9mraEhFX3Gk=
X-Google-Smtp-Source: 
 AMsMyM7R36Hs789Ppjbv6VzcCwO+d08LcXNHkIgq3x2e07MDfV5sGflNk1SyvxFY4Xj84vNBunShlg==
X-Received: by 2002:a05:622a:120c:b0:35b:bbed:9b14 with SMTP id
 y12-20020a05622a120c00b0035bbbed9b14mr14766058qtx.652.1663590824102;
        Mon, 19 Sep 2022 05:33:44 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b6ed:2737:547c:2270])
        by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm12541040qkb.89.2022.09.19.05.33.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:33:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 01/11] nodejs-oe-cache-native: initial checkin
Date: Mon, 19 Sep 2022 08:33:28 -0400
Message-Id: 
 <035d9c61e81b32cb62706cfdbfae08b1bac7ae88.1663590728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663590728.git.akuster808@gmail.com>
References: <cover.1663590728.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:33:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98852

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
2.25.1


