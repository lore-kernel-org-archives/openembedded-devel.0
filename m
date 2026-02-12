Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0EEEB48F9
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 10:32:53 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38879.1770873688848250541
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 21:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MksSKr6j;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14792; q=dns/txt;
  s=iport01; t=1770873688; x=1772083288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nb3v8mWlBDe0G4s3CqTz2KtcIDIQCYX5dAp+ncI6SgM=;
  b=MksSKr6jWHYXyJhG8qv2ExnQA8oymli5SOZth763wfi4OkSXn/EKp+qv
   x1B5JpaZTIsZDe5Zkwuz+CngJnDvvbW0s9ggrqVxOurcV/fA+q3R1KbgP
   LpK53Kt7X7bXkh2Oxvn+m7djtVmtD3d6I0CcUlg1uoFRX6okr7/PMHCaf
   a+Nwr8lHk1Y3P7qsvaelTKy5DQKuVA0pk2SQoMK0qtZQ5p60/0CK/xw6u
   sEDdBkBcwzf3YYsbU5pGe5/zyFTlB8zQwgeRSHq53kZbyABeD7rPnZ/od
   eXN+tThe60KbSN9+7v6gfIsNRk5CIvmf7Cvrc6o63HJ7xCktQE4Ga3QRD
   Q==;
X-CSE-ConnectionGUID: p3HX75khThWHokkMV8mQTw==
X-CSE-MsgGUID: 7oGARGHWS4WR5cgWw1b2xA==
X-IPAS-Result: =?us-ascii?q?A0CrBgBQYo1p/5T/Ja1aglmCSA9xXkNJlksDgn6IZpI2g?=
 =?us-ascii?q?X8PAQEBDz0UBAEBhQcCjR0CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDMgEYAS0QHAMBAi8gCyMIGYMCAYI6AzYDE?=
 =?us-ascii?q?ahugiyBAYMoAT8CQ0/YRw2CUgELFAGBOIU7gnmFH1sYAYR4JxsbgXKEB3aBB?=
 =?us-ascii?q?YEaQgEBiCQEgiKBDoFkJw+RVEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBCxsHBYgVD4kPeHCBIHIDCxgNSBEsNxQbBD5uB45LQYIzWiETASoBUF8UC?=
 =?us-ascii?q?ggjCwIDDBhOklcTB5I1oB1xCiiDdIwejz4BhXsaM4QEgVeSPpJSC5h7iyaCY?=
 =?us-ascii?q?4QJkSsHInOEaIFoPIFHCwdwFYMiCUkZD444g2mBf4MUvE4lMgI6AgcLAQEDC?=
 =?us-ascii?q?ZFsLYFOAQE?=
IronPort-Data: A9a23:S6sxpq5cd9PSGDjaNxSSuQxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 msXW2+OOvbbMWCke9wgYIm29BxQvMKHnYJqGVZv+yswZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+qUzBHf/g2QqajhNsfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eJdY4yrkqAmFy9
 cM4LzMOSy7TgtuK3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEfUrsUIMpWcOOAj3X4dTJRsl+9rqss6G+Vxwt0uFToGISLJoTbFZ0Jzi50o
 EqZ+EvQOD46C+fD9gDY+X2TmbbFxzPSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:1BirCKGpKooNI/j/pLqE78eALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHPxOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJSXzLbLfCFHZQGQ2njfL+od
X-Talos-CUID: 9a23:sTssamxm6HocXtM/GauxBgUMQeAVLSDezEvQHG+/CmVMdu2QcGOPrfY=
X-Talos-MUID: 9a23:HTgz0QuWLwSFDR9YXM2n2zZNHf1Hw5uVVH83zJ4JhNbdP3ZgEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,286,1763424000"; 
   d="scan'208";a="664098048"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2026 05:21:27 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 9C06118000152;
	Thu, 12 Feb 2026 05:21:27 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 49725CC12A6; Wed, 11 Feb 2026 21:21:27 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-OE] [scarthgap] [PATCH 2/5] Nodejs 20.18.2: Fix CVE-2025-55130
Date: Wed, 11 Feb 2026 21:21:07 -0800
Message-ID: <20260212052114.3215220-2-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260212052114.3215220-1-adongare@cisco.com>
References: <20260212052114.3215220-1-adongare@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 10:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124349

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/nodejs/node.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55130
Type: Security Fix
CVE: CVE-2025-55130
Score: 9.1
Patch: https://github.com/nodejs/node/commit/6b4849583ad6

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../nodejs/nodejs/CVE-2025-55130.patch        | 315 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.18.2.bb |   1 +
 2 files changed, 316 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-55130.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-55130.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-55130.patch
new file mode 100644
index 0000000000..2e0b1a0fa7
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2025-55130.patch
@@ -0,0 +1,315 @@
+From b64d87994164e965a46f4144ea59a01e76c30efd Mon Sep 17 00:00:00 2001
+From: RafaelGSS <rafael.nunu@hotmail.com>
+Date: Mon, 10 Nov 2025 19:27:51 -0300
+Subject: [PATCH] lib,permission: require full read and write to symlink APIs
+
+Refs: https://hackerone.com/reports/3417819
+Signed-off-by: RafaelGSS <rafael.nunu@hotmail.com>
+PR-URL: https://github.com/nodejs-private/node-private/pull/760
+Reviewed-By: Matteo Collina <matteo.collina@gmail.com>
+CVE-ID: CVE-2025-55130
+
+CVE: CVE-2025-55130
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/6b4849583ad6]
+
+(cherry picked from commit 6b4849583ad655d96365d9c665dcdb7912b67e2c)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ lib/fs.js                                     | 34 ++++++-------------
+ lib/internal/fs/promises.js                   | 20 +++--------
+ .../permission/fs-symlink-target-write.js     | 18 ++--------
+ test/fixtures/permission/fs-symlink.js        | 18 ++++++++--
+ .../test-permission-fs-symlink-relative.js    | 10 +++---
+ test/parallel/test-permission-fs-symlink.js   | 14 ++++++++
+ 6 files changed, 52 insertions(+), 62 deletions(-)
+
+diff --git a/lib/fs.js b/lib/fs.js
+index 9206a18663c..4f9ff6da371 100644
+--- a/lib/fs.js
++++ b/lib/fs.js
+@@ -59,7 +59,6 @@ const {
+ } = constants;
+
+ const pathModule = require('path');
+-const { isAbsolute } = pathModule;
+ const { isArrayBufferView } = require('internal/util/types');
+
+ const binding = internalBinding('fs');
+@@ -1744,18 +1743,12 @@ function symlink(target, path, type_, callback_) {
+   const type = (typeof type_ === 'string' ? type_ : null);
+   const callback = makeCallback(arguments[arguments.length - 1]);
+
+-  if (permission.isEnabled()) {
+-    // The permission model's security guarantees fall apart in the presence of
+-    // relative symbolic links. Thus, we have to prevent their creation.
+-    if (BufferIsBuffer(target)) {
+-      if (!isAbsolute(BufferToString(target))) {
+-        callback(new ERR_ACCESS_DENIED('relative symbolic link target'));
+-        return;
+-      }
+-    } else if (typeof target !== 'string' || !isAbsolute(toPathIfFileURL(target))) {
+-      callback(new ERR_ACCESS_DENIED('relative symbolic link target'));
+-      return;
+-    }
++  // Due to the nature of Node.js runtime, symlinks has different edge cases that can bypass
++  // the permission model security guarantees. Thus, this API is disabled unless fs.read
++  // and fs.write permission has been given.
++  if (permission.isEnabled() && !permission.has('fs')) {
++    callback(new ERR_ACCESS_DENIED('fs.symlink API requires full fs.read and fs.write permissions.'));
++    return;
+   }
+
+   target = getValidatedPath(target, 'target');
+@@ -1815,16 +1808,11 @@ function symlinkSync(target, path, type) {
+     }
+   }
+
+-  if (permission.isEnabled()) {
+-    // The permission model's security guarantees fall apart in the presence of
+-    // relative symbolic links. Thus, we have to prevent their creation.
+-    if (BufferIsBuffer(target)) {
+-      if (!isAbsolute(BufferToString(target))) {
+-        throw new ERR_ACCESS_DENIED('relative symbolic link target');
+-      }
+-    } else if (typeof target !== 'string' || !isAbsolute(toPathIfFileURL(target))) {
+-      throw new ERR_ACCESS_DENIED('relative symbolic link target');
+-    }
++  // Due to the nature of Node.js runtime, symlinks has different edge cases that can bypass
++  // the permission model security guarantees. Thus, this API is disabled unless fs.read
++  // and fs.write permission has been given.
++  if (permission.isEnabled() && !permission.has('fs')) {
++    throw new ERR_ACCESS_DENIED('fs.symlink API requires full fs.read and fs.write permissions.');
+   }
+
+   target = getValidatedPath(target, 'target');
+diff --git a/lib/internal/fs/promises.js b/lib/internal/fs/promises.js
+index 8314cf29a85..f734f93d763 100644
+--- a/lib/internal/fs/promises.js
++++ b/lib/internal/fs/promises.js
+@@ -17,7 +17,6 @@ const {
+   Symbol,
+   Uint8Array,
+   FunctionPrototypeBind,
+-  uncurryThis,
+ } = primordials;
+
+ const { fs: constants } = internalBinding('constants');
+@@ -31,8 +30,6 @@ const {
+
+ const binding = internalBinding('fs');
+ const { Buffer } = require('buffer');
+-const { isBuffer: BufferIsBuffer } = Buffer;
+-const BufferToString = uncurryThis(Buffer.prototype.toString);
+
+ const {
+   codes: {
+@@ -88,8 +85,6 @@ const {
+   kValidateObjectAllowNullable,
+ } = require('internal/validators');
+ const pathModule = require('path');
+-const { isAbsolute } = pathModule;
+-const { toPathIfFileURL } = require('internal/url');
+ const {
+   kEmptyObject,
+   lazyDOMException,
+@@ -983,16 +978,11 @@ async function symlink(target, path, type_) {
+     }
+   }
+
+-  if (permission.isEnabled()) {
+-    // The permission model's security guarantees fall apart in the presence of
+-    // relative symbolic links. Thus, we have to prevent their creation.
+-    if (BufferIsBuffer(target)) {
+-      if (!isAbsolute(BufferToString(target))) {
+-        throw new ERR_ACCESS_DENIED('relative symbolic link target');
+-      }
+-    } else if (typeof target !== 'string' || !isAbsolute(toPathIfFileURL(target))) {
+-      throw new ERR_ACCESS_DENIED('relative symbolic link target');
+-    }
++  // Due to the nature of Node.js runtime, symlinks has different edge cases that can bypass
++  // the permission model security guarantees. Thus, this API is disabled unless fs.read
++  // and fs.write permission has been given.
++  if (permission.isEnabled() && !permission.has('fs')) {
++    throw new ERR_ACCESS_DENIED('fs.symlink API requires full fs.read and fs.write permissions.');
+   }
+
+   target = getValidatedPath(target, 'target');
+diff --git a/test/fixtures/permission/fs-symlink-target-write.js b/test/fixtures/permission/fs-symlink-target-write.js
+index c17d674d59e..6e07bfa838e 100644
+--- a/test/fixtures/permission/fs-symlink-target-write.js
++++ b/test/fixtures/permission/fs-symlink-target-write.js
+@@ -26,8 +26,7 @@ const writeOnlyFolder = process.env.WRITEONLYFOLDER;
+     fs.symlinkSync(path.join(readOnlyFolder, 'file'), path.join(readWriteFolder, 'link-to-read-only'), 'file');
+   }, common.expectsError({
+     code: 'ERR_ACCESS_DENIED',
+-    permission: 'FileSystemWrite',
+-    resource: path.toNamespacedPath(path.join(readOnlyFolder, 'file')),
++    message: 'fs.symlink API requires full fs.read and fs.write permissions.',
+   }));
+   assert.throws(() => {
+     fs.linkSync(path.join(readOnlyFolder, 'file'), path.join(readWriteFolder, 'link-to-read-only'));
+@@ -37,18 +36,6 @@ const writeOnlyFolder = process.env.WRITEONLYFOLDER;
+     resource: path.toNamespacedPath(path.join(readOnlyFolder, 'file')),
+   }));
+
+-  // App will be able to symlink to a writeOnlyFolder
+-  fs.symlink(path.join(readWriteFolder, 'file'), path.join(writeOnlyFolder, 'link-to-read-write'), 'file', (err) => {
+-    assert.ifError(err);
+-    // App will won't be able to read the symlink
+-    fs.readFile(path.join(writeOnlyFolder, 'link-to-read-write'), common.expectsError({
+-      code: 'ERR_ACCESS_DENIED',
+-      permission: 'FileSystemRead',
+-    }));
+-
+-    // App will be able to write to the symlink
+-    fs.writeFile(path.join(writeOnlyFolder, 'link-to-read-write'), 'some content', common.mustSucceed());
+-  });
+   fs.link(path.join(readWriteFolder, 'file'), path.join(writeOnlyFolder, 'link-to-read-write2'), (err) => {
+     assert.ifError(err);
+     // App will won't be able to read the link
+@@ -66,8 +53,7 @@ const writeOnlyFolder = process.env.WRITEONLYFOLDER;
+     fs.symlinkSync(path.join(readWriteFolder, 'file'), path.join(readOnlyFolder, 'link-to-read-only'), 'file');
+   }, common.expectsError({
+     code: 'ERR_ACCESS_DENIED',
+-    permission: 'FileSystemWrite',
+-    resource: path.toNamespacedPath(path.join(readOnlyFolder, 'link-to-read-only')),
++    message: 'fs.symlink API requires full fs.read and fs.write permissions.',
+   }));
+   assert.throws(() => {
+     fs.linkSync(path.join(readWriteFolder, 'file'), path.join(readOnlyFolder, 'link-to-read-only'));
+diff --git a/test/fixtures/permission/fs-symlink.js b/test/fixtures/permission/fs-symlink.js
+index 4cf3b45f0eb..ba60f7811bd 100644
+--- a/test/fixtures/permission/fs-symlink.js
++++ b/test/fixtures/permission/fs-symlink.js
+@@ -54,7 +54,6 @@ const symlinkFromBlockedFile = process.env.EXISTINGSYMLINK;
+     fs.readFileSync(blockedFile);
+   }, common.expectsError({
+     code: 'ERR_ACCESS_DENIED',
+-    permission: 'FileSystemRead',
+   }));
+   assert.throws(() => {
+     fs.appendFileSync(blockedFile, 'data');
+@@ -68,7 +67,6 @@ const symlinkFromBlockedFile = process.env.EXISTINGSYMLINK;
+     fs.symlinkSync(regularFile, blockedFolder + '/asdf', 'file');
+   }, common.expectsError({
+     code: 'ERR_ACCESS_DENIED',
+-    permission: 'FileSystemWrite',
+   }));
+   assert.throws(() => {
+     fs.linkSync(regularFile, blockedFolder + '/asdf');
+@@ -82,7 +80,6 @@ const symlinkFromBlockedFile = process.env.EXISTINGSYMLINK;
+     fs.symlinkSync(blockedFile, path.join(__dirname, '/asdf'), 'file');
+   }, common.expectsError({
+     code: 'ERR_ACCESS_DENIED',
+-    permission: 'FileSystemRead',
+   }));
+   assert.throws(() => {
+     fs.linkSync(blockedFile, path.join(__dirname, '/asdf'));
+@@ -90,4 +87,19 @@ const symlinkFromBlockedFile = process.env.EXISTINGSYMLINK;
+     code: 'ERR_ACCESS_DENIED',
+     permission: 'FileSystemRead',
+   }));
++}
++
++// fs.symlink API is blocked by default
++{
++  assert.throws(() => {
++    fs.symlinkSync(regularFile, regularFile);
++  }, common.expectsError({
++    message: 'fs.symlink API requires full fs.read and fs.write permissions.',
++    code: 'ERR_ACCESS_DENIED',
++  }));
++
++  fs.symlink(regularFile, regularFile, common.expectsError({
++    message: 'fs.symlink API requires full fs.read and fs.write permissions.',
++    code: 'ERR_ACCESS_DENIED',
++  }));
+ }
+\ No newline at end of file
+diff --git a/test/parallel/test-permission-fs-symlink-relative.js b/test/parallel/test-permission-fs-symlink-relative.js
+index 4cc7d920593..9080f16c663 100644
+--- a/test/parallel/test-permission-fs-symlink-relative.js
++++ b/test/parallel/test-permission-fs-symlink-relative.js
+@@ -1,4 +1,4 @@
+-// Flags: --experimental-permission --allow-fs-read=* --allow-fs-write=*
++// Flags: --experimental-permission --allow-fs-read=*
+ 'use strict';
+
+ const common = require('../common');
+@@ -10,7 +10,7 @@ const { symlinkSync, symlink, promises: { symlink: symlinkAsync } } = require('f
+
+ const error = {
+   code: 'ERR_ACCESS_DENIED',
+-  message: /relative symbolic link target/,
++  message: /symlink API requires full fs\.read and fs\.write permissions/,
+ };
+
+ for (const targetString of ['a', './b/c', '../d', 'e/../f', 'C:drive-relative', 'ntfs:alternate']) {
+@@ -27,14 +27,14 @@ for (const targetString of ['a', './b/c', '../d', 'e/../f', 'C:drive-relative',
+   }
+ }
+
+-// Absolute should not throw
++// Absolute should throw too
+ for (const targetString of [path.resolve('.')]) {
+   for (const target of [targetString, Buffer.from(targetString)]) {
+     for (const path of [__filename]) {
+       symlink(target, path, common.mustCall((err) => {
+         assert(err);
+-        assert.strictEqual(err.code, 'EEXIST');
+-        assert.match(err.message, /file already exists/);
++        assert.strictEqual(err.code, error.code);
++        assert.match(err.message, error.message);
+       }));
+     }
+   }
+diff --git a/test/parallel/test-permission-fs-symlink.js b/test/parallel/test-permission-fs-symlink.js
+index c7d753c267c..268a8ecb9aa 100644
+--- a/test/parallel/test-permission-fs-symlink.js
++++ b/test/parallel/test-permission-fs-symlink.js
+@@ -21,15 +21,26 @@ const commonPathWildcard = path.join(__filename, '../../common*');
+ const blockedFile = fixtures.path('permission', 'deny', 'protected-file.md');
+ const blockedFolder = tmpdir.resolve('subdirectory');
+ const symlinkFromBlockedFile = tmpdir.resolve('example-symlink.md');
++const allowedFolder = tmpdir.resolve('allowed-folder');
++const traversalSymlink = path.join(allowedFolder, 'deep1', 'deep2', 'deep3', 'gotcha');
+
+ {
+   tmpdir.refresh();
+   fs.mkdirSync(blockedFolder);
++  // Create deep directory structure for path traversal test
++  fs.mkdirSync(allowedFolder);
++  fs.writeFileSync(path.resolve(allowedFolder, '../protected-file.md'), 'protected');
++  fs.mkdirSync(path.join(allowedFolder, 'deep1'));
++  fs.mkdirSync(path.join(allowedFolder, 'deep1', 'deep2'));
++  fs.mkdirSync(path.join(allowedFolder, 'deep1', 'deep2', 'deep3'));
+ }
+
+ {
+   // Symlink previously created
++  // fs.symlink API is allowed when full-read and full-write access
+   fs.symlinkSync(blockedFile, symlinkFromBlockedFile);
++  // Create symlink for path traversal test - symlink points to parent directory
++  fs.symlinkSync(allowedFolder, traversalSymlink);
+ }
+
+ {
+@@ -38,6 +49,7 @@ const symlinkFromBlockedFile = tmpdir.resolve('example-symlink.md');
+     [
+       '--experimental-permission',
+       `--allow-fs-read=${file}`, `--allow-fs-read=${commonPathWildcard}`, `--allow-fs-read=${symlinkFromBlockedFile}`,
++      `--allow-fs-read=${allowedFolder}`,
+       `--allow-fs-write=${symlinkFromBlockedFile}`,
+       file,
+     ],
+@@ -47,6 +59,8 @@ const symlinkFromBlockedFile = tmpdir.resolve('example-symlink.md');
+         BLOCKEDFOLDER: blockedFolder,
+         BLOCKEDFILE: blockedFile,
+         EXISTINGSYMLINK: symlinkFromBlockedFile,
++        TRAVERSALSYMLINK: traversalSymlink,
++        ALLOWEDFOLDER: allowedFolder,
+       },
+     }
+   );
+--
+2.43.7
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
index 67574a2ec1..7c97c7282c 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-src-fix-build-with-GCC-15.patch \
            file://run-ptest \
            file://CVE-2025-55132.patch \
+           file://CVE-2025-55130.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.44.1


