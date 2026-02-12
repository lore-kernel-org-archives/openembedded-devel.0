Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE086EB48F8
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 10:32:53 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39074.1770873690822979864
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 21:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fOynfV9p;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=19434; q=dns/txt;
  s=iport01; t=1770873690; x=1772083290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hZACpAF1mLHgzY9SGaI15kpu9zWk/aNl7EZIsuNkcOk=;
  b=fOynfV9pRhIN0OTL9TwroFLPDeslU6xPcJoRsILH+Uesf4ffGBMkADFm
   wIB/8TQ1v+UwpINMtoo1+JXJ+j1TB7xczgP0Xv3IdaXn227AWKrV+KEq6
   MDvaGef3ZWzZ6SpPgMH0P9vlF0vp4dohbzx5xa73cgbqIk2e5huxh2Gf6
   +6Iaoe0/Ey5O8/JEOEGRm+LU53uocj007cwCR89fWOB6dvkc8/8uZ78Nr
   K6OisAVoUI4ggXYEKRtGFJxgliACzlmXQSz5MItPECrelQ7v6EqyX2+EF
   9bx0EqhTnFmMslsggFmPH0l8/ujRbzCNbEf3ueR9lBcYwxjEqKQT7qKq3
   w==;
X-CSE-ConnectionGUID: WzRg/t3ORpyBwEM6bL9scA==
X-CSE-MsgGUID: Vm+4uuo5QTOG21EQ7DT6ig==
X-IPAS-Result: =?us-ascii?q?A0CwBgBQYo1p/4v/Ja1RCYJZghgwD3FeQ0mWSwOBE4pRk?=
 =?us-ascii?q?jYUgWsPAQEBDz0UBAEBhQcCjR0CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QsBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAEtEBwDAQIvIAsjCBmCKlgBg?=
 =?us-ascii?q?joDNgMRqG6BeTOBAYMoAT8CQ0/YRw2CUgELFAGBOIU7gnmFH1sYAYNZgR8nG?=
 =?us-ascii?q?xuBcoEVgnJ2gQWBGkIBAYE0EwGGXASCDRWBDoFkJw+RVEiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBCxsHBYgVD4kPeHCBIHIDCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?45LQYFBclArEwEqAReBAjQ2BQwYDgGTFhA7kgSBNZ5ocQoog3SMHo8+hXwaM?=
 =?us-ascii?q?4VbpRALmHuLJoJjhAmRVxNdhGiBaDyBRwsHcBU7gmcJSRkPjioOC4NegX+DF?=
 =?us-ascii?q?LxOJTICOgIHCwEBAwmRbC2BTgEB?=
IronPort-Data: A9a23:k38hTK5DJKVEDYIGrynXyQxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 mMXUWvXPareYmf8e4x1b96w/B9SvJDUx9BiQVdtrnxnZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+qUzBHf/g2QqajhNsfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eAp8i9aFrWkZ07
 e0yNx0oMBqn1vm96efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYeUrsUIMpWcOOAj3X4dTJRsl+9rqss6G+Vxwt0uFToGISLJ4HbGJQPwS50o
 Er4+ielHwwdaeWj7hXfq1+V2cPzwyL0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:bD6U0auBxx1cvrfwE1onxEm17skDcdV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmSTSa3BkXCF+xFK+qjgzJyV
X-Talos-CUID: 9a23:4/hXSm1t6lmDukSoeIeD5bxfJdIffTrBl1DqO16SFktMFrexGESb0fYx
X-Talos-MUID: 9a23:B0aYgwn5O5KWu6+KIJ1tdnpcMYQ0/rmpVXkxtrpc4uS9agBMZTaS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,286,1763424000"; 
   d="scan'208";a="665595927"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2026 05:21:29 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 8AD0F1800021E;
	Thu, 12 Feb 2026 05:21:29 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 38B48CC12A6; Wed, 11 Feb 2026 21:21:29 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-OE] [scarthgap] [PATCH 4/5] Nodejs 20.18.2: Fix CVE-2026-21637
Date: Wed, 11 Feb 2026 21:21:09 -0800
Message-ID: <20260212052114.3215220-4-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20260212052114.3215220-1-adongare@cisco.com>
References: <20260212052114.3215220-1-adongare@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 10:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124351

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/nodejs/node.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2026-21637
Type: Security Fix
CVE: CVE-2026-21637
Score: 7.5
Patch: https://github.com/nodejs/node/commit/25d6799df65c

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../nodejs/nodejs/CVE-2026-21637.patch        | 616 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.18.2.bb |   1 +
 2 files changed, 617 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-21637.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-21637.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-21637.patch
new file mode 100644
index 0000000000..cdf23af7c1
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-21637.patch
@@ -0,0 +1,616 @@
+From ba66644cc25154598c4c3988abf812022e32b8e4 Mon Sep 17 00:00:00 2001
+From: Matteo Collina <hello@matteocollina.com>
+Date: Mon, 22 Dec 2025 18:25:33 +0100
+Subject: [PATCH 4/6] tls: route callback exceptions through error handlers
+
+Wrap pskCallback and ALPNCallback invocations in try-catch blocks
+to route exceptions through owner.destroy() instead of letting them
+become uncaught exceptions. This prevents remote attackers from
+crashing TLS servers or causing resource exhaustion.
+
+Fixes: https://hackerone.com/reports/3473882
+PR-URL: https://github.com/nodejs-private/node-private/pull/782
+PR-URL: https://github.com/nodejs-private/node-private/pull/796
+Reviewed-By: Matteo Collina <matteo.collina@gmail.com>
+CVE-ID: CVE-2026-21637
+
+CVE: CVE-2026-21637
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/25d6799df65c]
+
+(cherry picked from commit 25d6799df65cd08f5fd057cae23e00a81bf33757)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ lib/_tls_wrap.js                              | 157 ++++----
+ test/parallel/test-tls-alpn-server-client.js  |  32 +-
+ ...ls-psk-alpn-callback-exception-handling.js | 334 ++++++++++++++++++
+ 3 files changed, 442 insertions(+), 81 deletions(-)
+ create mode 100644 test/parallel/test-tls-psk-alpn-callback-exception-handling.js
+
+diff --git a/lib/_tls_wrap.js b/lib/_tls_wrap.js
+index 4eb7b7ffa69..c3e48a6cbc8 100644
+--- a/lib/_tls_wrap.js
++++ b/lib/_tls_wrap.js
+@@ -233,39 +233,44 @@ function callALPNCallback(protocolsBuffer) {
+   const handle = this;
+   const socket = handle[owner_symbol];
+
+-  const servername = handle.getServername();
++  try {
++    const servername = handle.getServername();
+
+-  // Collect all the protocols from the given buffer:
+-  const protocols = [];
+-  let offset = 0;
+-  while (offset < protocolsBuffer.length) {
+-    const protocolLen = protocolsBuffer[offset];
+-    offset += 1;
++    // Collect all the protocols from the given buffer:
++    const protocols = [];
++    let offset = 0;
++    while (offset < protocolsBuffer.length) {
++      const protocolLen = protocolsBuffer[offset];
++      offset += 1;
+
+-    const protocol = protocolsBuffer.slice(offset, offset + protocolLen);
+-    offset += protocolLen;
++      const protocol = protocolsBuffer.slice(offset, offset + protocolLen);
++      offset += protocolLen;
+
+-    protocols.push(protocol.toString('ascii'));
+-  }
++      protocols.push(protocol.toString('ascii'));
++    }
+
+-  const selectedProtocol = socket[kALPNCallback]({
+-    servername,
+-    protocols,
+-  });
++    const selectedProtocol = socket[kALPNCallback]({
++      servername,
++      protocols,
++    });
+
+-  // Undefined -> all proposed protocols rejected
+-  if (selectedProtocol === undefined) return undefined;
++    // Undefined -> all proposed protocols rejected
++    if (selectedProtocol === undefined) return undefined;
+
+-  const protocolIndex = protocols.indexOf(selectedProtocol);
+-  if (protocolIndex === -1) {
+-    throw new ERR_TLS_ALPN_CALLBACK_INVALID_RESULT(selectedProtocol, protocols);
+-  }
+-  let protocolOffset = 0;
+-  for (let i = 0; i < protocolIndex; i++) {
+-    protocolOffset += 1 + protocols[i].length;
+-  }
++    const protocolIndex = protocols.indexOf(selectedProtocol);
++    if (protocolIndex === -1) {
++      throw new ERR_TLS_ALPN_CALLBACK_INVALID_RESULT(selectedProtocol, protocols);
++    }
++    let protocolOffset = 0;
++    for (let i = 0; i < protocolIndex; i++) {
++      protocolOffset += 1 + protocols[i].length;
++    }
+
+-  return protocolOffset;
++    return protocolOffset;
++  } catch (err) {
++    socket.destroy(err);
++    return undefined;
++  }
+ }
+
+ function requestOCSP(socket, info) {
+@@ -372,63 +377,75 @@ function onnewsession(sessionId, session) {
+
+ function onPskServerCallback(identity, maxPskLen) {
+   const owner = this[owner_symbol];
+-  const ret = owner[kPskCallback](owner, identity);
+-  if (ret == null)
+-    return undefined;
+
+-  let psk;
+-  if (isArrayBufferView(ret)) {
+-    psk = ret;
+-  } else {
+-    if (typeof ret !== 'object') {
+-      throw new ERR_INVALID_ARG_TYPE(
+-        'ret',
+-        ['Object', 'Buffer', 'TypedArray', 'DataView'],
+-        ret,
++  try {
++    const ret = owner[kPskCallback](owner, identity);
++    if (ret == null)
++      return undefined;
++
++    let psk;
++    if (isArrayBufferView(ret)) {
++      psk = ret;
++    } else {
++      if (typeof ret !== 'object') {
++        throw new ERR_INVALID_ARG_TYPE(
++          'ret',
++          ['Object', 'Buffer', 'TypedArray', 'DataView'],
++          ret,
++        );
++      }
++      psk = ret.psk;
++      validateBuffer(psk, 'psk');
++    }
++
++    if (psk.length > maxPskLen) {
++      throw new ERR_INVALID_ARG_VALUE(
++        'psk',
++        psk,
++        `Pre-shared key exceeds ${maxPskLen} bytes`,
+       );
+     }
+-    psk = ret.psk;
+-    validateBuffer(psk, 'psk');
+-  }
+
+-  if (psk.length > maxPskLen) {
+-    throw new ERR_INVALID_ARG_VALUE(
+-      'psk',
+-      psk,
+-      `Pre-shared key exceeds ${maxPskLen} bytes`,
+-    );
++    return psk;
++  } catch (err) {
++    owner.destroy(err);
++    return undefined;
+   }
+-
+-  return psk;
+ }
+
+ function onPskClientCallback(hint, maxPskLen, maxIdentityLen) {
+   const owner = this[owner_symbol];
+-  const ret = owner[kPskCallback](hint);
+-  if (ret == null)
+-    return undefined;
+
+-  validateObject(ret, 'ret');
++  try {
++    const ret = owner[kPskCallback](hint);
++    if (ret == null)
++      return undefined;
++
++    validateObject(ret, 'ret');
++
++    validateBuffer(ret.psk, 'psk');
++    if (ret.psk.length > maxPskLen) {
++      throw new ERR_INVALID_ARG_VALUE(
++        'psk',
++        ret.psk,
++        `Pre-shared key exceeds ${maxPskLen} bytes`,
++      );
++    }
+
+-  validateBuffer(ret.psk, 'psk');
+-  if (ret.psk.length > maxPskLen) {
+-    throw new ERR_INVALID_ARG_VALUE(
+-      'psk',
+-      ret.psk,
+-      `Pre-shared key exceeds ${maxPskLen} bytes`,
+-    );
+-  }
++    validateString(ret.identity, 'identity');
++    if (Buffer.byteLength(ret.identity) > maxIdentityLen) {
++      throw new ERR_INVALID_ARG_VALUE(
++        'identity',
++        ret.identity,
++        `PSK identity exceeds ${maxIdentityLen} bytes`,
++      );
++    }
+
+-  validateString(ret.identity, 'identity');
+-  if (Buffer.byteLength(ret.identity) > maxIdentityLen) {
+-    throw new ERR_INVALID_ARG_VALUE(
+-      'identity',
+-      ret.identity,
+-      `PSK identity exceeds ${maxIdentityLen} bytes`,
+-    );
++    return { psk: ret.psk, identity: ret.identity };
++  } catch (err) {
++    owner.destroy(err);
++    return undefined;
+   }
+-
+-  return { psk: ret.psk, identity: ret.identity };
+ }
+
+ function onkeylog(line) {
+diff --git a/test/parallel/test-tls-alpn-server-client.js b/test/parallel/test-tls-alpn-server-client.js
+index 8f1a4b8e439..1ef32ca5938 100644
+--- a/test/parallel/test-tls-alpn-server-client.js
++++ b/test/parallel/test-tls-alpn-server-client.js
+@@ -252,25 +252,35 @@ function TestALPNCallback() {
+ function TestBadALPNCallback() {
+   // Server always returns a fixed invalid value:
+   const serverOptions = {
++    key: loadPEM('agent2-key'),
++    cert: loadPEM('agent2-cert'),
+     ALPNCallback: common.mustCall(() => 'http/5')
+   };
+
+-  const clientsOptions = [{
+-    ALPNProtocols: ['http/1', 'h2'],
+-  }];
++  const server = tls.createServer(serverOptions);
+
+-  process.once('uncaughtException', common.mustCall((error) => {
++  // Error should be emitted via tlsClientError, not as uncaughtException
++  server.on('tlsClientError', common.mustCall((error, socket) => {
+     assert.strictEqual(error.code, 'ERR_TLS_ALPN_CALLBACK_INVALID_RESULT');
++    socket.destroy();
+   }));
+
+-  runTest(clientsOptions, serverOptions, function(results) {
+-    // Callback returns 'http/5' => doesn't match client ALPN => error & reset
+-    assert.strictEqual(results[0].server, undefined);
+-    const allowedErrors = ['ECONNRESET', 'ERR_SSL_TLSV1_ALERT_NO_APPLICATION_PROTOCOL'];
+-    assert.ok(allowedErrors.includes(results[0].client.error.code), `'${results[0].client.error.code}' was not one of ${allowedErrors}.`);
++  server.listen(0, serverIP, common.mustCall(() => {
++    const client = tls.connect({
++      port: server.address().port,
++      host: serverIP,
++      rejectUnauthorized: false,
++      ALPNProtocols: ['http/1', 'h2'],
++    }, common.mustNotCall());
+
+-    TestALPNOptionsCallback();
+-  });
++    client.on('error', common.mustCall((err) => {
++      // Client gets reset when server handles error via tlsClientError
++      const allowedErrors = ['ECONNRESET', 'ERR_SSL_TLSV1_ALERT_NO_APPLICATION_PROTOCOL'];
++      assert.ok(allowedErrors.includes(err.code), `'${err.code}' was not one of ${allowedErrors}.`);
++      server.close();
++      TestALPNOptionsCallback();
++    }));
++  }));
+ }
+
+ function TestALPNOptionsCallback() {
+diff --git a/test/parallel/test-tls-psk-alpn-callback-exception-handling.js b/test/parallel/test-tls-psk-alpn-callback-exception-handling.js
+new file mode 100644
+index 00000000000..93bf7396d2a
+--- /dev/null
++++ b/test/parallel/test-tls-psk-alpn-callback-exception-handling.js
+@@ -0,0 +1,334 @@
++'use strict';
++
++// This test verifies that exceptions in pskCallback and ALPNCallback are
++// properly routed through tlsClientError instead of becoming uncaught
++// exceptions. This is a regression test for a vulnerability where callback
++// validation errors would bypass all standard TLS error handlers.
++//
++// The vulnerability allows remote attackers to crash TLS servers or cause
++// resource exhaustion (file descriptor leaks) when pskCallback or ALPNCallback
++// throw exceptions during validation.
++
++const common = require('../common');
++
++if (!common.hasCrypto)
++  common.skip('missing crypto');
++
++const assert = require('assert');
++const { describe, it } = require('node:test');
++const tls = require('tls');
++const fixtures = require('../common/fixtures');
++
++const CIPHERS = 'PSK+HIGH';
++const TEST_TIMEOUT = 5000;
++
++// Helper to create a promise that rejects on uncaughtException or timeout
++function createTestPromise() {
++  const { promise, resolve, reject } = Promise.withResolvers();
++  let settled = false;
++
++  const cleanup = () => {
++    if (!settled) {
++      settled = true;
++      process.removeListener('uncaughtException', onUncaught);
++      clearTimeout(timeout);
++    }
++  };
++
++  const onUncaught = (err) => {
++    cleanup();
++    reject(new Error(
++      `Uncaught exception instead of tlsClientError: ${err.code || err.message}`
++    ));
++  };
++
++  const timeout = setTimeout(() => {
++    cleanup();
++    reject(new Error('Test timed out - tlsClientError was not emitted'));
++  }, TEST_TIMEOUT);
++
++  process.on('uncaughtException', onUncaught);
++
++  return {
++    resolve: (value) => {
++      cleanup();
++      resolve(value);
++    },
++    reject: (err) => {
++      cleanup();
++      reject(err);
++    },
++    promise,
++  };
++}
++
++describe('TLS callback exception handling', () => {
++
++  // Test 1: PSK server callback returning invalid type should emit tlsClientError
++  it('pskCallback returning invalid type emits tlsClientError', async (t) => {
++    const server = tls.createServer({
++      ciphers: CIPHERS,
++      pskCallback: () => {
++        // Return invalid type (string instead of object/Buffer)
++        return 'invalid-should-be-object-or-buffer';
++      },
++      pskIdentityHint: 'test-hint',
++    });
++
++    t.after(() => server.close());
++
++    const { promise, resolve, reject } = createTestPromise();
++
++    server.on('tlsClientError', common.mustCall((err, socket) => {
++      try {
++        assert.ok(err instanceof Error);
++        assert.strictEqual(err.code, 'ERR_INVALID_ARG_TYPE');
++        socket.destroy();
++        resolve();
++      } catch (e) {
++        reject(e);
++      }
++    }));
++
++    server.on('secureConnection', common.mustNotCall(() => {
++      reject(new Error('secureConnection should not fire'));
++    }));
++
++    await new Promise((res) => server.listen(0, res));
++
++    const client = tls.connect({
++      port: server.address().port,
++      host: '127.0.0.1',
++      ciphers: CIPHERS,
++      checkServerIdentity: () => {},
++      pskCallback: () => ({
++        psk: Buffer.alloc(32),
++        identity: 'test-identity',
++      }),
++    });
++
++    client.on('error', () => {});
++
++    await promise;
++  });
++
++  // Test 2: PSK server callback throwing should emit tlsClientError
++  it('pskCallback throwing emits tlsClientError', async (t) => {
++    const server = tls.createServer({
++      ciphers: CIPHERS,
++      pskCallback: () => {
++        throw new Error('Intentional callback error');
++      },
++      pskIdentityHint: 'test-hint',
++    });
++
++    t.after(() => server.close());
++
++    const { promise, resolve, reject } = createTestPromise();
++
++    server.on('tlsClientError', common.mustCall((err, socket) => {
++      try {
++        assert.ok(err instanceof Error);
++        assert.strictEqual(err.message, 'Intentional callback error');
++        socket.destroy();
++        resolve();
++      } catch (e) {
++        reject(e);
++      }
++    }));
++
++    server.on('secureConnection', common.mustNotCall(() => {
++      reject(new Error('secureConnection should not fire'));
++    }));
++
++    await new Promise((res) => server.listen(0, res));
++
++    const client = tls.connect({
++      port: server.address().port,
++      host: '127.0.0.1',
++      ciphers: CIPHERS,
++      checkServerIdentity: () => {},
++      pskCallback: () => ({
++        psk: Buffer.alloc(32),
++        identity: 'test-identity',
++      }),
++    });
++
++    client.on('error', () => {});
++
++    await promise;
++  });
++
++  // Test 3: ALPN callback returning non-matching protocol should emit tlsClientError
++  it('ALPNCallback returning invalid result emits tlsClientError', async (t) => {
++    const server = tls.createServer({
++      key: fixtures.readKey('agent2-key.pem'),
++      cert: fixtures.readKey('agent2-cert.pem'),
++      ALPNCallback: () => {
++        // Return a protocol not in the client's list
++        return 'invalid-protocol-not-in-list';
++      },
++    });
++
++    t.after(() => server.close());
++
++    const { promise, resolve, reject } = createTestPromise();
++
++    server.on('tlsClientError', common.mustCall((err, socket) => {
++      try {
++        assert.ok(err instanceof Error);
++        assert.strictEqual(err.code, 'ERR_TLS_ALPN_CALLBACK_INVALID_RESULT');
++        socket.destroy();
++        resolve();
++      } catch (e) {
++        reject(e);
++      }
++    }));
++
++    server.on('secureConnection', common.mustNotCall(() => {
++      reject(new Error('secureConnection should not fire'));
++    }));
++
++    await new Promise((res) => server.listen(0, res));
++
++    const client = tls.connect({
++      port: server.address().port,
++      host: '127.0.0.1',
++      rejectUnauthorized: false,
++      ALPNProtocols: ['http/1.1', 'h2'],
++    });
++
++    client.on('error', () => {});
++
++    await promise;
++  });
++
++  // Test 4: ALPN callback throwing should emit tlsClientError
++  it('ALPNCallback throwing emits tlsClientError', async (t) => {
++    const server = tls.createServer({
++      key: fixtures.readKey('agent2-key.pem'),
++      cert: fixtures.readKey('agent2-cert.pem'),
++      ALPNCallback: () => {
++        throw new Error('Intentional ALPN callback error');
++      },
++    });
++
++    t.after(() => server.close());
++
++    const { promise, resolve, reject } = createTestPromise();
++
++    server.on('tlsClientError', common.mustCall((err, socket) => {
++      try {
++        assert.ok(err instanceof Error);
++        assert.strictEqual(err.message, 'Intentional ALPN callback error');
++        socket.destroy();
++        resolve();
++      } catch (e) {
++        reject(e);
++      }
++    }));
++
++    server.on('secureConnection', common.mustNotCall(() => {
++      reject(new Error('secureConnection should not fire'));
++    }));
++    await new Promise((res) => server.listen(0, res));
++
++    const client = tls.connect({
++      port: server.address().port,
++      host: '127.0.0.1',
++      rejectUnauthorized: false,
++      ALPNProtocols: ['http/1.1'],
++    });
++
++    client.on('error', () => {});
++
++    await promise;
++  });
++
++  // Test 5: PSK client callback returning invalid type should emit error event
++  it('client pskCallback returning invalid type emits error', async (t) => {
++    const PSK = Buffer.alloc(32);
++
++    const server = tls.createServer({
++      ciphers: CIPHERS,
++      pskCallback: () => PSK,
++      pskIdentityHint: 'test-hint',
++    });
++
++    t.after(() => server.close());
++
++    const { promise, resolve, reject } = createTestPromise();
++
++    server.on('secureConnection', common.mustNotCall(() => {
++      reject(new Error('secureConnection should not fire'));
++    }));
++
++    await new Promise((res) => server.listen(0, res));
++
++    const client = tls.connect({
++      port: server.address().port,
++      host: '127.0.0.1',
++      ciphers: CIPHERS,
++      checkServerIdentity: () => {},
++      pskCallback: () => {
++        // Return invalid type - should cause validation error
++        return 'invalid-should-be-object';
++      },
++    });
++
++    client.on('error', common.mustCall((err) => {
++      try {
++        assert.ok(err instanceof Error);
++        assert.strictEqual(err.code, 'ERR_INVALID_ARG_TYPE');
++        resolve();
++      } catch (e) {
++        reject(e);
++      }
++    }));
++
++    await promise;
++  });
++
++  // Test 6: PSK client callback throwing should emit error event
++  it('client pskCallback throwing emits error', async (t) => {
++    const PSK = Buffer.alloc(32);
++
++    const server = tls.createServer({
++      ciphers: CIPHERS,
++      pskCallback: () => PSK,
++      pskIdentityHint: 'test-hint',
++    });
++
++    t.after(() => server.close());
++
++    const { promise, resolve, reject } = createTestPromise();
++
++    server.on('secureConnection', common.mustNotCall(() => {
++      reject(new Error('secureConnection should not fire'));
++    }));
++
++    await new Promise((res) => server.listen(0, res));
++
++    const client = tls.connect({
++      port: server.address().port,
++      host: '127.0.0.1',
++      ciphers: CIPHERS,
++      checkServerIdentity: () => {},
++      pskCallback: () => {
++        throw new Error('Intentional client PSK callback error');
++      },
++    });
++
++    client.on('error', common.mustCall((err) => {
++      try {
++        assert.ok(err instanceof Error);
++        assert.strictEqual(err.message, 'Intentional client PSK callback error');
++        resolve();
++      } catch (e) {
++        reject(e);
++      }
++    }));
++
++    await promise;
++  });
++});
+--
+2.43.7
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
index 779c70dbd0..68eb40bc1d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://CVE-2025-55132.patch \
            file://CVE-2025-55130.patch \
            file://CVE-2025-59466.patch \
+           file://CVE-2026-21637.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.44.1


