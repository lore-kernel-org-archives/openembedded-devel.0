Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87612C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 08:37:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6597.1708677437653997013
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 00:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E/PyAvSR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2783f3eaa2=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N6JMsQ013563
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 08:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=aWxiw
	aRXEI2z2K6YYjnjcsI92LSR341F/VBEexFVkNE=; b=E/PyAvSRXkhlKLn0uIrQF
	Mnvhjf6WGsXpWa7Six3EqVlCilhRiFKx4OF+ZD2vm03K8rYESDkPqY3YRbdBwgGU
	wXVgCGUu71r43DRbYR3h4fJ0It6rtYh7PXVprrqLQj3+BSaeg3qamx1ka9hWfv3M
	+BLlTcaEKMZdtJ3dvWRn+otNtEZGaD+iTQjAztqIQfM7xgyKcPT59bMLRqYcVImX
	ecfmoExpfW8z5ltkasA9Iy2+OBXzUcP//XYXaFVB4Y2U1eaZvXcXQMnFmosjP6WC
	skcotfeVw9/9Xs9ELGfSpCeat/VgYpblDd8X9dgHlpt1J4YQxsUeQVlUrQqH7abt
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd217ax53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 08:37:16 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 00:37:13 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/4] nodejs: fix CVE-2024-22019
Date: Fri, 23 Feb 2024 08:36:17 +0000
Message-ID: <20240223083620.182565-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: I-QfHV4t8KvllQWRKr4t5OuHA8zpngWM
X-Proofpoint-ORIG-GUID: I-QfHV4t8KvllQWRKr4t5OuHA8zpngWM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 08:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109004

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability in Node.js HTTP servers allows an attacker to send a specially
crafted HTTP request with chunked encoding, leading to resource exhaustion and
denial of service (DoS). The server reads an unbounded number of bytes from a
single connection, exploiting the lack of limitations on chunk extension bytes.
The issue can cause CPU and network bandwidth exhaustion, bypassing standard
safeguards like timeouts and body size limits

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/CVE-2024-22019.patch        | 241 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.20.2.bb |   1 +
 2 files changed, 242 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch
new file mode 100644
index 000000000..26fd2ff87
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch
@@ -0,0 +1,241 @@
+From 03a5c34a829742f1c47b68f831b2940af44addf6 Mon Sep 17 00:00:00 2001
+From: Paolo Insogna <paolo@cowtech.it>
+Date: Wed, 3 Jan 2024 07:23:15 +0100
+Subject: [PATCH] http: add maximum chunk extension size
+
+PR-URL: https://github.com/nodejs-private/node-private/pull/518
+Fixes: https://hackerone.com/reports/2233486
+Reviewed-By: Matteo Collina <matteo.collina@gmail.com>
+Reviewed-By: Marco Ippolito <marcoippolito54@gmail.com>
+Reviewed-By: Rafael Gonzaga <rafael.nunu@hotmail.com>
+
+CVE-ID: CVE-2024-22019
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/03a5c34a829742f]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/_http_server.js                           |   8 ++
+ src/node_http_parser.cc                       |  19 ++-
+ .../test-http-chunk-extensions-limit.js       | 131 ++++++++++++++++++
+ 3 files changed, 157 insertions(+), 1 deletion(-)
+ create mode 100644 test/parallel/test-http-chunk-extensions-limit.js
+
+diff --git a/lib/_http_server.js b/lib/_http_server.js
+index 4e23266..263bb52 100644
+--- a/lib/_http_server.js
++++ b/lib/_http_server.js
+@@ -706,6 +706,11 @@ const requestHeaderFieldsTooLargeResponse = Buffer.from(
+   `HTTP/1.1 431 ${STATUS_CODES[431]}\r\n` +
+   'Connection: close\r\n\r\n', 'ascii'
+ );
++const requestChunkExtensionsTooLargeResponse = Buffer.from(
++  `HTTP/1.1 413 ${STATUS_CODES[413]}\r\n` +
++  'Connection: close\r\n\r\n', 'ascii',
++);
++
+ function socketOnError(e) {
+   // Ignore further errors
+   this.removeListener('error', socketOnError);
+@@ -719,6 +724,9 @@ function socketOnError(e) {
+         case 'HPE_HEADER_OVERFLOW':
+           response = requestHeaderFieldsTooLargeResponse;
+           break;
++	case 'HPE_CHUNK_EXTENSIONS_OVERFLOW':
++          response = requestChunkExtensionsTooLargeResponse;
++          break;
+         case 'ERR_HTTP_REQUEST_TIMEOUT':
+           response = requestTimeoutResponse;
+           break;
+diff --git a/src/node_http_parser.cc b/src/node_http_parser.cc
+index 74f3248..a137fd7 100644
+--- a/src/node_http_parser.cc
++++ b/src/node_http_parser.cc
+@@ -79,6 +79,8 @@ const uint32_t kOnExecute = 5;
+ const uint32_t kOnTimeout = 6;
+ // Any more fields than this will be flushed into JS
+ const size_t kMaxHeaderFieldsCount = 32;
++// Maximum size of chunk extensions
++const size_t kMaxChunkExtensionsSize = 16384;
+
+ const uint32_t kLenientNone = 0;
+ const uint32_t kLenientHeaders = 1 << 0;
+@@ -206,6 +208,7 @@ class Parser : public AsyncWrap, public StreamListener {
+
+   int on_message_begin() {
+     num_fields_ = num_values_ = 0;
++    chunk_extensions_nread_ = 0;
+     url_.Reset();
+     status_message_.Reset();
+     header_parsing_start_time_ = uv_hrtime();
+@@ -443,9 +446,22 @@ class Parser : public AsyncWrap, public StreamListener {
+     return 0;
+   }
+
+-  // Reset nread for the next chunk
++  int on_chunk_extension(const char* at, size_t length) {
++    chunk_extensions_nread_ += length;
++
++    if (chunk_extensions_nread_ > kMaxChunkExtensionsSize) {
++      llhttp_set_error_reason(&parser_,
++          "HPE_CHUNK_EXTENSIONS_OVERFLOW:Chunk extensions overflow");
++      return HPE_USER;
++    }
++
++    return 0;
++  }
++
++  // Reset nread for the next chunk and also reset the extensions counter
+   int on_chunk_header() {
+     header_nread_ = 0;
++    chunk_extensions_nread_ = 0;
+     return 0;
+   }
+
+@@ -887,6 +903,7 @@ class Parser : public AsyncWrap, public StreamListener {
+   const char* current_buffer_data_;
+   bool pending_pause_ = false;
+   uint64_t header_nread_ = 0;
++  uint64_t chunk_extensions_nread_ = 0;
+   uint64_t max_http_header_size_;
+   uint64_t headers_timeout_;
+   uint64_t header_parsing_start_time_ = 0;
+diff --git a/test/parallel/test-http-chunk-extensions-limit.js b/test/parallel/test-http-chunk-extensions-limit.js
+new file mode 100644
+index 0000000..6868b3d
+--- /dev/null
++++ b/test/parallel/test-http-chunk-extensions-limit.js
+@@ -0,0 +1,131 @@
++'use strict';
++
++const common = require('../common');
++const http = require('http');
++const net = require('net');
++const assert = require('assert');
++
++// Verify that chunk extensions are limited in size when sent all together.
++{
++  const server = http.createServer((req, res) => {
++    req.on('end', () => {
++      res.writeHead(200, { 'Content-Type': 'text/plain' });
++      res.end('bye');
++    });
++
++    req.resume();
++  });
++
++  server.listen(0, () => {
++    const sock = net.connect(server.address().port);
++    let data = '';
++
++    sock.on('data', (chunk) => data += chunk.toString('utf-8'));
++
++    sock.on('end', common.mustCall(function() {
++      assert.strictEqual(data, 'HTTP/1.1 413 Payload Too Large\r\nConnection: close\r\n\r\n');
++      server.close();
++    }));
++
++    sock.end('' +
++      'GET / HTTP/1.1\r\n' +
++      'Host: localhost:8080\r\n' +
++      'Transfer-Encoding: chunked\r\n\r\n' +
++      '2;' + 'A'.repeat(20000) + '=bar\r\nAA\r\n' +
++      '0\r\n\r\n'
++    );
++  });
++}
++
++// Verify that chunk extensions are limited in size when sent in intervals.
++{
++  const server = http.createServer((req, res) => {
++    req.on('end', () => {
++      res.writeHead(200, { 'Content-Type': 'text/plain' });
++      res.end('bye');
++    });
++
++    req.resume();
++  });
++
++  server.listen(0, () => {
++    const sock = net.connect(server.address().port);
++    let remaining = 20000;
++    let data = '';
++
++    const interval = setInterval(
++      () => {
++        if (remaining > 0) {
++          sock.write('A'.repeat(1000));
++        } else {
++          sock.write('=bar\r\nAA\r\n0\r\n\r\n');
++          clearInterval(interval);
++        }
++
++        remaining -= 1000;
++      },
++      common.platformTimeout(20),
++    ).unref();
++
++    sock.on('data', (chunk) => data += chunk.toString('utf-8'));
++
++    sock.on('end', common.mustCall(function() {
++      assert.strictEqual(data, 'HTTP/1.1 413 Payload Too Large\r\nConnection: close\r\n\r\n');
++      server.close();
++    }));
++
++    sock.write('' +
++    'GET / HTTP/1.1\r\n' +
++    'Host: localhost:8080\r\n' +
++    'Transfer-Encoding: chunked\r\n\r\n' +
++    '2;'
++    );
++  });
++}
++
++// Verify the chunk extensions is correctly reset after a chunk
++{
++  const server = http.createServer((req, res) => {
++    req.on('end', () => {
++      res.writeHead(200, { 'content-type': 'text/plain', 'connection': 'close', 'date': 'now' });
++      res.end('bye');
++    });
++
++    req.resume();
++  });
++
++  server.listen(0, () => {
++    const sock = net.connect(server.address().port);
++    let data = '';
++
++    sock.on('data', (chunk) => data += chunk.toString('utf-8'));
++
++    sock.on('end', common.mustCall(function() {
++      assert.strictEqual(
++        data,
++        'HTTP/1.1 200 OK\r\n' +
++        'content-type: text/plain\r\n' +
++        'connection: close\r\n' +
++        'date: now\r\n' +
++        'Transfer-Encoding: chunked\r\n' +
++        '\r\n' +
++        '3\r\n' +
++        'bye\r\n' +
++        '0\r\n' +
++        '\r\n',
++      );
++
++      server.close();
++    }));
++
++    sock.end('' +
++      'GET / HTTP/1.1\r\n' +
++      'Host: localhost:8080\r\n' +
++      'Transfer-Encoding: chunked\r\n\r\n' +
++      '2;' + 'A'.repeat(10000) + '=bar\r\nAA\r\n' +
++      '2;' + 'A'.repeat(10000) + '=bar\r\nAA\r\n' +
++      '2;' + 'A'.repeat(10000) + '=bar\r\nAA\r\n' +
++      '0\r\n\r\n'
++    );
++  });
++}
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index 16593a0fe..b786c0273 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
            file://0001-Nodejs-Fixed-pipes-DeprecationWarning.patch \
            file://CVE-2022-25883.patch \
+           file://CVE-2024-22019.patch \
            "
 SRC_URI:append:class-target = " \
            file://0001-Using-native-binaries.patch \
-- 
2.40.0


