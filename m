Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BC1CCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 17:02:07 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1890.1792170125165888054
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2026 10:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RlJvIiKg;
 spf=pass (domain: mvista.com, ip: 74.125.82.170, mailfrom: rsangam@mvista.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso284955eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 10:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1792170124; x=1792774924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVllKAggxPlIAPhK75vGTKA3LG/twl9L0Z4bMQ/OsPU=;
        b=RlJvIiKgiUCnmbDXI/ht6KbwHu3Ncz+ByAbr4d/jDXqSPN49JuG0beieyV62l9WXrv
         +++6w7PTJNGbXVuCPjtOVDAdO1F2FCAbKedfE3AkDWAQknJ09bc7mcgM9Rlt2/bKfisQ
         tyrqvFyYXqv1JYEFoo3uqDXEkqVtlN4BB5lIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170124; x=1792774924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVllKAggxPlIAPhK75vGTKA3LG/twl9L0Z4bMQ/OsPU=;
        b=MuicSRrDmR+V83NfRPbOfce6ZwZLnEKMFJ8hAQU5s0az9Epb0Dicmn98ggnjpOSwOr
         t/ptpaQYV2pk/wGY3ds8WAgvxa5fg0f0s2mbqotXu7C1kEKVN54lI1lPpTxaY9k207gc
         g+dnQHObob/5nVIahuNjfYL+NU6OJVdU8Y5OWLHWXVoxBKBCpdNlIosrBvmwQpdD8UfJ
         vRXB/xTVkKhvngNxB5hw4VGl53gVADNR4W9IFXpJo/rcOkJWNaTx+kTfBs5VqBf5nhEo
         Nt2BrRQPchcxo6yVhiAj3qlV7jMfV/PxS4Nc7uE4549OJBrYAqmytpxk+W7uuP/PCahV
         hS9A==
X-Gm-Message-State: AFq9FYKnGKz6/hJFmh5nQ2+ojGRaF3RXxMTTViWBSacqo3CMn3VlItxz
	Mryd/2GujSCo6sfKkc6GztNAXf3JvybA9bBQBsdPX/vhfjcVH5t/5mNFjooZ+AZRvvAy+vNulM6
	A8mWUrTc=
X-Gm-Gg: AYBFou190ftm+hHiStPvAD7RoQf1IhOkMRVYIPhICvvibbHoHZqemlRnEPQ8e3nngpI
	hupXsYmhav12UbTTupEmx49pxz4zSXCldG05NDGa3D+McQaI91VpH1VSLqQlePGui2/t4KiGpH0
	D0UXCpYhR7NyBW5qQpW7gtrfEy7f3ergZ3g7QgnM9qqZ+x911BxHRFBysetFBvJU8dHZZxdvmNz
	oASNSV7280QvyJjVytlgNna6qe88FrErLGfHR07McNCgOpzxDKW3f2C5NDhdqMagkm/QQPZmYI+
	NfXSCFAumoJE61av18i23xrpZqaMZI4Ulzc96Uz5Qg62dBuqq/mk7hEBBsIZScIJWr431oRkv+0
	RwWbGE2pr6dr7Y8XoYclW0DJ55PWabdN/3HhILAg5J2aqhYWTFhJFuWZuWItEwQwd6Ob2ht6NFN
	DUwEapdk53t3+wY7QB9mjCbxKTtaXsrFWAan042p6/WyF0M2AQ0E3xEg8ZtD7I1vWh6LLNYXu/w
	BcX/I4=
X-Received: by 2002:a05:693c:66d2:20b0:359:43c5:ebe5 with SMTP id 5a478bee46e88-361a2b3a111mr448966eec.38.1792170123986;
        Fri, 16 Oct 2026 10:02:03 -0700 (PDT)
Received: from MVIN00040.mvista.com ([49.207.221.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm8381333eec.4.2026.10.16.10.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:02:01 -0700 (PDT)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [meta-oe][scarthgap][PATCH] nodejs: Security fix for CVE-2026-48619
Date: Fri, 16 Oct 2026 22:31:53 +0530
Message-Id: <20261016170153.30354-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 17:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131080

Pick patch from [1] also mentioned at Debian tracker in [2]

[1] https://github.com/nodejs/node/commit/c79968e108002c2394bdb9e9cefb2c8c8cc202f8
[2] https://security-tracker.debian.org/tracker/CVE-2026-48619

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../nodejs/nodejs/CVE-2026-48619.patch        | 253 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.20.2.bb |   1 +
 2 files changed, 254 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48619.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48619.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48619.patch
new file mode 100644
index 0000000000..41377642bb
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48619.patch
@@ -0,0 +1,253 @@
+From c79968e108002c2394bdb9e9cefb2c8c8cc202f8 Mon Sep 17 00:00:00 2001
+From: Matteo Collina <hello@matteocollina.com>
+Date: Sun, 19 Apr 2026 16:48:43 +0200
+Subject: [PATCH] http2: cap originSet size to prevent unbounded memory
+growth
+
+A malicious HTTP/2 server can send repeated ORIGIN frames with unique
+origins, causing unbounded growth of the client-side originSet for the
+lifetime of the session. Cap the set at 128 entries; once full, new
+origins from ORIGIN frames are silently dropped.
+
+Ref: https://hackerone.com/reports/3676863
+PR-URL: https://github.com/nodejs-private/node-private/pull/855
+Reviewed-By: Antoine du Hamel <duhamelantoine1995@gmail.com>
+Refs: https://hackerone.com/reports/3676863
+
+CVE: CVE-2026-48619
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/c79968e108002c2394bdb9e9cefb2c8c8cc202f8]
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ doc/api/errors.md                             |  11 ++
+ doc/api/http2.md                              |   2 +
+ lib/internal/errors.js                        |   2 +
+ lib/internal/http2/core.js                    |  17 ++-
+ .../test-http2-origin-set-max-size.mjs        | 110 ++++++++++++++++++
+ 5 files changed, 141 insertions(+), 1 deletion(-)
+ create mode 100644 test/parallel/test-http2-origin-set-max-size.mjs
+
+diff --git a/doc/api/errors.md b/doc/api/errors.md
+index d6ead7e2..95fa835e 100644
+--- a/doc/api/errors.md
++++ b/doc/api/errors.md
+@@ -1729,6 +1729,17 @@ added: v15.14.0
+ The limit of acceptable invalid HTTP/2 protocol frames sent by the peer,
+ as specified through the `maxSessionInvalidFrames` option, has been exceeded.
+ 
++<a id="ERR_HTTP2_TOO_MANY_ORIGINS"></a>
++
++### `ERR_HTTP2_TOO_MANY_ORIGINS`
++
++<!-- YAML
++added: REPLACEME
++-->
++
++The number of uniq origin sent by the server has exceeded the value defined in
++`options.maxOriginSetSize`.
++
+ <a id="ERR_HTTP2_TRAILERS_ALREADY_SENT"></a>
+ 
+ ### `ERR_HTTP2_TRAILERS_ALREADY_SENT`
+diff --git a/doc/api/http2.md b/doc/api/http2.md
+index 4598b15a..6cf75b80 100644
+--- a/doc/api/http2.md
++++ b/doc/api/http2.md
+@@ -3186,6 +3186,8 @@ changes:
+     This is similar to [`server.maxHeadersCount`][] or
+     [`request.maxHeadersCount`][] in the `node:http` module. The minimum value
+     is `1`. **Default:** `128`.
++  * `maxOriginSetSize` {number} Sets the maximum number of uniq origin the sever
++    can send via ORIGIN frames. **Default:** `128`.
+   * `maxOutstandingPings` {number} Sets the maximum number of outstanding,
+     unacknowledged pings. **Default:** `10`.
+   * `maxReservedRemoteStreams` {number} Sets the maximum number of reserved push
+diff --git a/lib/internal/errors.js b/lib/internal/errors.js
+index 9d6c5ca9..d68a2f7c 100644
+--- a/lib/internal/errors.js
++++ b/lib/internal/errors.js
+@@ -1315,6 +1315,8 @@ E('ERR_HTTP2_STREAM_SELF_DEPENDENCY',
+ E('ERR_HTTP2_TOO_MANY_CUSTOM_SETTINGS',
+   'Number of custom settings exceeds MAX_ADDITIONAL_SETTINGS', Error);
+ E('ERR_HTTP2_TOO_MANY_INVALID_FRAMES', 'Too many invalid HTTP/2 frames', Error);
++E('ERR_HTTP2_TOO_MANY_ORIGINS',
++  'The server sent more ORIGIN frames than the allowed number of %s', Error);
+ E('ERR_HTTP2_TRAILERS_ALREADY_SENT',
+   'Trailing headers have already been sent', Error);
+ E('ERR_HTTP2_TRAILERS_NOT_READY',
+diff --git a/lib/internal/http2/core.js b/lib/internal/http2/core.js
+index ebd7abb1..38a33dd0 100644
+--- a/lib/internal/http2/core.js
++++ b/lib/internal/http2/core.js
+@@ -101,6 +101,7 @@ const {
+     ERR_HTTP2_STREAM_ERROR,
+     ERR_HTTP2_STREAM_SELF_DEPENDENCY,
+     ERR_HTTP2_TOO_MANY_CUSTOM_SETTINGS,
++    ERR_HTTP2_TOO_MANY_ORIGINS,
+     ERR_HTTP2_TRAILERS_ALREADY_SENT,
+     ERR_HTTP2_TRAILERS_NOT_READY,
+     ERR_HTTP2_UNSUPPORTED_PROTOCOL,
+@@ -237,6 +238,7 @@ const kInit = Symbol('init');
+ const kInfoHeaders = Symbol('sent-info-headers');
+ const kLocalSettings = Symbol('local-settings');
+ const kNativeFields = Symbol('kNativeFields');
++const kMaxOriginSetSize = Symbol('max-ORIGIN-set-size');
+ const kOptions = Symbol('options');
+ const kOwner = owner_symbol;
+ const kOrigin = Symbol('origin');
+@@ -674,8 +676,13 @@ function onOrigin(origins) {
+   if (!session.encrypted || session.destroyed)
+     return undefined;
+   const originSet = initOriginSet(session);
+-  for (let n = 0; n < origins.length; n++)
++  for (let n = 0; n < origins.length; n++) {
++    if (originSet.size >= session[kMaxOriginSetSize]) {
++      session.destroy(new ERR_HTTP2_TOO_MANY_ORIGINS(session[kMaxOriginSetSize]));
++      return;
++    }
+     originSet.add(origins[n]);
++  }
+   session.emit('origin', origins);
+ }
+ 
+@@ -3331,6 +3338,13 @@ function connect(authority, options, listener) {
+   assertIsObject(options, 'options');
+   options = { ...options };
+ 
++  let { maxOriginSetSize } = options;
++  if (maxOriginSetSize != null) {
++    validateNumber(maxOriginSetSize, 'options.maxOriginSetSize', 0);
++  } else {
++    maxOriginSetSize = 128;
++  }
++
+   assertIsArray(options.remoteCustomSettings, 'options.remoteCustomSettings');
+   if (options.remoteCustomSettings) {
+     options.remoteCustomSettings = [ ...options.remoteCustomSettings ];
+@@ -3377,6 +3391,7 @@ function connect(authority, options, listener) {
+ 
+   session[kAuthority] = `${options.servername || host}:${port}`;
+   session[kProtocol] = protocol;
++  session[kMaxOriginSetSize] = maxOriginSetSize;
+ 
+   if (typeof listener === 'function')
+     session.once('connect', listener);
+diff --git a/test/parallel/test-http2-origin-set-max-size.mjs b/test/parallel/test-http2-origin-set-max-size.mjs
+new file mode 100644
+index 00000000..08bdf1ed
+--- /dev/null
++++ b/test/parallel/test-http2-origin-set-max-size.mjs
+@@ -0,0 +1,110 @@
++import {
++  expectsError,
++  hasCrypto,
++  mustCall,
++  mustNotCall,
++  mustSucceed,
++  skip,
++} from '../common/index.mjs';
++import * as fixtures from '../common/fixtures.mjs';
++import assert from 'node:assert';
++
++if (!hasCrypto)
++  skip('missing crypto');
++
++const {
++  createSecureServer,
++  connect,
++} = await import('node:http2');
++
++const key = fixtures.readKey('agent8-key.pem', 'binary');
++const cert = fixtures.readKey('agent8-cert.pem', 'binary');
++const ca = fixtures.readKey('fake-startcom-root-cert.pem', 'binary');
++
++const server = createSecureServer({ key, cert });
++server.on('stream', (stream) => {
++  stream.respond();
++  stream.end('ok');
++});
++server.on('session', (session) => {
++  let i = 0;
++  const timer = setInterval(() => {
++    try {
++      session.origin(...Array.from({ length: 10 }, () => `https://o${i++}.example.com`));
++    } catch {
++      clearInterval(timer);
++    }
++  }, 10);
++
++  session.on('close', () => {
++    clearInterval(timer);
++  });
++});
++
++await new Promise((resolve) => server.listen(0, resolve));
++
++// Test fantasist values
++[Symbol(), '0', 1n, {}, [], true, false, /s/, () => {}].forEach((maxOriginSetSize) => {
++  assert.throws(
++    () => connect(`https://localhost:${server.address().port}`, { ca, maxOriginSetSize }),
++    { code: 'ERR_INVALID_ARG_TYPE' },
++  );
++});
++[NaN, -1].forEach((maxOriginSetSize) => {
++  assert.throws(
++    () => connect(`https://localhost:${server.address().port}`, { ca, maxOriginSetSize }),
++    { code: 'ERR_OUT_OF_RANGE' },
++  );
++});
++
++await new Promise((resolve) => server.getConnections(mustSucceed((count) => {
++  assert.strictEqual(count, 0);
++  resolve();
++})));
++
++// Test default value
++await new Promise((resolve) => {
++  const client = connect(`https://localhost:${server.address().port}`, { ca });
++
++  client.on('origin', mustCall(12)); // Default value is 128, the first 12 frames should pass, the 13th one should error
++  client.on('error', expectsError({
++    code: 'ERR_HTTP2_TOO_MANY_ORIGINS',
++  }));
++  client.on('goaway', mustNotCall());
++  client.on('close', resolve);
++
++  client.request().resume();
++});
++
++// Test non-default values
++await Promise.all([-0, 9, 1.5].map((maxOriginSetSize) => new Promise((resolve) => {
++  const client = connect(`https://localhost:${server.address().port}`, { ca, maxOriginSetSize });
++
++  client.on('origin', mustNotCall()); // The server send 10 origins on the first frame, that's already too many.
++  client.on('error', expectsError({
++    code: 'ERR_HTTP2_TOO_MANY_ORIGINS',
++  }));
++  client.on('goaway', mustNotCall());
++  client.on('close', resolve);
++
++  client.request().resume();
++})));
++
++
++// Test values higher than the default value
++await Promise.all([512, Infinity].map((maxOriginSetSize) => new Promise((resolve) => {
++  const client = connect(`https://localhost:${server.address().port}`, { ca, maxOriginSetSize });
++
++  client.on('origin', mustCall(() => {
++    if (client.originSet.length > 128) {
++      client.destroy();
++    }
++  }, 13));
++  client.on('error', mustNotCall());
++  client.on('goaway', mustNotCall());
++  client.on('close', resolve);
++
++  client.request().resume();
++})));
++
++server.close();
+-- 
+2.44.4
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb
index 4badec2135..710ed988d3 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.20.2.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Revert-stop-using-deprecated-ares_query.patch \
            file://run-ptest \
            file://CVE-2026-48617.patch \
+           file://CVE-2026-48619.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.34.1


