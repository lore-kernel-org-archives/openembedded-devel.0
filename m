Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518A5FA3734
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 11:29:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3572.1767353345947408038
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jan 2026 03:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KZ7B59TZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso107848795e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 03:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767353344; x=1767958144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B170RpxkF+sZMal/PDUqsXKmlUa8eapl6/r6LUpLW4Q=;
        b=KZ7B59TZp6d76HEBm9iWVNpVWQFr3YbDlW/EpGGwhhcdGMWzmQLBzWPJzPPPThUXI7
         G9TNeFipy9mex6Qqna5XWAYtvAqyVH80Yqak4GnJ5yPhw/RLtGa1xwTDuZnVf8NO84Yu
         LVLjTMLi4wCPdnlwJSTnyh2DZqDwkePgbyQBmiIPEiybLhBp24pWvkosjV5aBIS7kqsZ
         K+InJhoDM7gmx4WpFhxKVgYonR+4o6BHXiUB0VDJxtQJCiiUjQreH12UvLdKOx4E/wOT
         7L+szpOT6NFRkTdPLLWTmaZU2aLns56TJjy1wFHJ5rJsqJ2qTed3kZugHS589lMetDD1
         NEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767353344; x=1767958144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B170RpxkF+sZMal/PDUqsXKmlUa8eapl6/r6LUpLW4Q=;
        b=GcueZ6AkVcU8VSdiENaSh72xlsHPDWVglLFtbwiBy8Xupkjyq6qRkOYgXcZXaajtrL
         +zzkHZ/8xYP2DJ+pC6uVH4Yd5sBVhmJLS3ixhas1Zxu1fuy4GvdiG3+Iuhlq671npsR/
         +rKILZuSeAsJpvIhmAqd4YBUPZ2nasWyWnH7Cz9KFkuUdQoSvykNeGwWvJ8kz4Ogi76J
         UTE2ePyyMOSyZiFtoHDhQopPuqGABz9arbPPH4vU9HmjUd/pDy3iZkAm5ivFcQ43jxu6
         cbzmrrErOrtiyThP0wfiuFjSYEXWnfcHhvdQ6rTXdJ5KIqsRqezIMwpjhTa9ZCIehVvS
         05SQ==
X-Gm-Message-State: AOJu0YwVD8gqW8nugZ5mpOHfIl8j0lrQT/tDd+SpuIXQGaikf4g7oZRy
	iooTGLC3aTGIRHECXugcNAgNDRDhZLB/J0+fym0eScqHCe8BiyLeeR0oDnDsbQ==
X-Gm-Gg: AY/fxX6wAcwrjzteYU2xsKB6EplGz87v4B13zGEYjso/L49I1/Ar04ncgFC0H+KjvsW
	fKBJi+F446IdiFLHfYhZdmYqUkBBJhTFGWaikKRv0LcjWbiLBR6seUwSxE01cJE4kSfrmWFyFBy
	MOyeLGbzc8vsnIILpKFsEKXolFFFcEMxH4HUDfI9xVWiKgSDNub9ReueLIBBIcw2YSmb7glHKR8
	SBxN2ppDoaOVyljKA/4c6jo2e/ShuG76W91bNye01QMyY9/qyvn+5zK7ETe0iSb7f8fgeszMuDJ
	GTXU0y00J1/ZqKMDteo1fblyR9kf1lmr/q0Q8SHnJPrzjKGPGDtP26ohdTXlGfkWeod+PuLbKpm
	60ivjpWB7m92SS6meHCBJI7ZW3HD9luxbu+nW0L0SK5hH/8wTpCallhVExwAKxv+tpk7CSoyWy2
	Xtn+ln4VTB
X-Google-Smtp-Source: AGHT+IGwVNcWvdKye1rPaPMVfkx7nPtwEHi0rSwuTGDFC6JR0o1TjWE4pCHSvpFvDFVdqhk1gc/t4g==
X-Received: by 2002:a05:600c:3487:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-47d1955b739mr565243645e9.1.1767353344167;
        Fri, 02 Jan 2026 03:29:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea22674sm85562757f8f.10.2026.01.02.03.29.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:29:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] nodejs: patch CVE-2023-39333
Date: Fri,  2 Jan 2026 12:28:57 +0100
Message-ID: <20260102112900.1800006-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102112900.1800006-1-skandigraun@gmail.com>
References: <20260102112900.1800006-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 11:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123092

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-39333

Backport the patch that mentions this CVE ID explicitly in its
commit message. 

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nodejs/nodejs/CVE-2023-39333.patch        | 57 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.20.2.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-39333.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-39333.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-39333.patch
new file mode 100644
index 0000000000..3cea4e1c23
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-39333.patch
@@ -0,0 +1,57 @@
+From 217a3dba7b2bfc94534c19e48a35bb9282367be2 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 6 Aug 2023 10:41:33 +0000
+Subject: [PATCH] module: fix code injection through export names
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+From: Tobias Nießen <tniessen@tnie.de>
+
+createDynamicModule() properly escapes import names, but not export
+names. In WebAssembly, any string is a valid export name. Importing a
+WebAssembly module that uses a non-identifier export name leads to
+either a syntax error in createDynamicModule() or to code injection,
+that is, to the evaluation of almost arbitrary JavaScript code outside
+of the WebAssembly module.
+
+To address this issue, adopt the same mechanism in createExport() that
+createImport() already uses. Add tests for both exports and imports.
+
+PR-URL: https://github.com/nodejs-private/node-private/pull/461
+Backport-PR-URL: https://github.com/nodejs-private/node-private/pull/489
+Reviewed-By: Rafael Gonzaga <rafael.nunu@hotmail.com>
+CVE-ID: CVE-2023-39333
+
+CVE: CVE-2023-39333
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/f5c90b2951ca8ce8e47136ef073a1778edcad15d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ lib/internal/modules/esm/create_dynamic_module.js | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/lib/internal/modules/esm/create_dynamic_module.js b/lib/internal/modules/esm/create_dynamic_module.js
+index f7c2008..c99da19 100644
+--- a/lib/internal/modules/esm/create_dynamic_module.js
++++ b/lib/internal/modules/esm/create_dynamic_module.js
+@@ -18,13 +18,13 @@ function createImport(impt, index) {
+ import.meta.imports[${imptPath}] = $import_${index};`;
+ }
+ 
+-function createExport(expt) {
+-  const name = `${expt}`;
+-  return `let $${name};
+-export { $${name} as ${name} };
+-import.meta.exports.${name} = {
+-  get: () => $${name},
+-  set: (v) => $${name} = v,
++function createExport(expt, index) {
++  const nameStringLit = JSONStringify(expt);
++  return `let $export_${index};
++export { $export_${index} as ${nameStringLit} };
++import.meta.exports[${nameStringLit}] = {
++  get: () => $export_${index},
++  set: (v) => $export_${index} = v,
+ };`;
+ }
+ 
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index b2872bfd98..2feec12f21 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://CVE-2024-22019.patch \
            file://CVE-2024-22025.patch \
            file://CVE-2023-46809.patch \
+           file://CVE-2023-39333.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \

