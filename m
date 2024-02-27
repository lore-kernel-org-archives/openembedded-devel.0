Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA66BC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 02:18:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3791.1709000285349806604
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Feb 2024 18:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iduqk2qE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27871ec9df=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R1M8k4003074
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 18:18:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=phOKO
	O+VJDfYnI8m5aagXD3yK++ukt7q3+VkWkKI4Pg=; b=iduqk2qEJpeTGHUsgY6xL
	GawPZoQGgdhCK9pAUAM4mcR3997s9b/u+3AWI68cN8W4+xUII0vNhZVoH2yXc9OT
	tEFR9nVj+Yj8KgespiKo8nB5jFN0wutdZ5el6KA+kP5uAg7UJLzE/qhChBs0uzJC
	og5jEklNhKCi93HcFRkFP0EGOQztld/gOkww6EesG9J6/YJm4FHhswWn+3TAVrnJ
	OZo+d9jDtewHWpUKa0D6Fi03jKhXzJ4laTa643vOj6o49HFVBo6DYs8rvAs+eFdd
	k7hH2Le+Esiiib35oMVrF8VNPPqzJLNnASbP4iGz2oU4o+hRxtgNzfLkAq2MlocB
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm42e37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 18:18:04 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 18:18:02 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH V2 1/1] nodejs: fix CVE-2024-22019
Date: Tue, 27 Feb 2024 02:17:50 +0000
Message-ID: <20240227021750.3377640-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 48TFXLX-KUJEid0iDV9sUtXWKGQ8moPE
X-Proofpoint-GUID: 48TFXLX-KUJEid0iDV9sUtXWKGQ8moPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 02:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109037

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/CVE-2024-22019.patch        | 556 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.20.2.bb |   1 +
 2 files changed, 557 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch
new file mode 100644
index 000000000..ca1c7981c
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2024-22019.patch
@@ -0,0 +1,556 @@
+From 911cb33cdadab57a75f97186290ea8f3903a6171 Mon Sep 17 00:00:00 2001
+From: Paolo Insogna <paolo@cowtech.it>
+Date: Tue, 9 Jan 2024 18:10:04 +0100
+Subject: [PATCH] http: add maximum chunk extension size
+
+PR-URL: https://github.com/nodejs-private/node-private/pull/520
+Refs: https://github.com/nodejs-private/node-private/pull/518
+
+CVE-ID: CVE-2024-22019
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/911cb33cdadab57a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ deps/llhttp/CMakeLists.txt                    |   2 +-
+ deps/llhttp/include/llhttp.h                  |   7 +-
+ deps/llhttp/src/api.c                         |   7 +
+ deps/llhttp/src/llhttp.c                      | 122 ++++++++++++++--
+ doc/api/errors.md                             |  12 ++
+ lib/_http_server.js                           |   8 ++
+ src/node_http_parser.cc                       |  20 ++-
+ .../test-http-chunk-extensions-limit.js       | 131 ++++++++++++++++++
+ tools/update-llhttp.sh                        |   2 +-
+ 9 files changed, 292 insertions(+), 19 deletions(-)
+ create mode 100644 test/parallel/test-http-chunk-extensions-limit.js
+
+diff --git a/deps/llhttp/CMakeLists.txt b/deps/llhttp/CMakeLists.txt
+index d038203..747564a 100644
+--- a/deps/llhttp/CMakeLists.txt
++++ b/deps/llhttp/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ cmake_minimum_required(VERSION 3.5.1)
+ cmake_policy(SET CMP0069 NEW)
+
+-project(llhttp VERSION 6.0.11)
++project(llhttp VERSION 6.1.0)
+ include(GNUInstallDirs)
+
+ set(CMAKE_C_STANDARD 99)
+diff --git a/deps/llhttp/include/llhttp.h b/deps/llhttp/include/llhttp.h
+index 2da66f1..78f27ab 100644
+--- a/deps/llhttp/include/llhttp.h
++++ b/deps/llhttp/include/llhttp.h
+@@ -2,8 +2,8 @@
+ #define INCLUDE_LLHTTP_H_
+
+ #define LLHTTP_VERSION_MAJOR 6
+-#define LLHTTP_VERSION_MINOR 0
+-#define LLHTTP_VERSION_PATCH 11
++#define LLHTTP_VERSION_MINOR 1
++#define LLHTTP_VERSION_PATCH 0
+
+ #ifndef LLHTTP_STRICT_MODE
+ # define LLHTTP_STRICT_MODE 0
+@@ -348,6 +348,9 @@ struct llhttp_settings_s {
+    */
+   llhttp_cb      on_headers_complete;
+
++  /* Possible return values 0, -1, HPE_USER */
++  llhttp_data_cb on_chunk_parameters;
++
+   /* Possible return values 0, -1, HPE_USER */
+   llhttp_data_cb on_body;
+
+diff --git a/deps/llhttp/src/api.c b/deps/llhttp/src/api.c
+index c4ce197..d3065b3 100644
+--- a/deps/llhttp/src/api.c
++++ b/deps/llhttp/src/api.c
+@@ -355,6 +355,13 @@ int llhttp__on_chunk_header(llhttp_t* s, const char* p, const char* endp) {
+ }
+
+
++int llhttp__on_chunk_parameters(llhttp_t* s, const char* p, const char* endp) {
++  int err;
++  SPAN_CALLBACK_MAYBE(s, on_chunk_parameters, p, endp - p);
++  return err;
++}
++
++
+ int llhttp__on_chunk_complete(llhttp_t* s, const char* p, const char* endp) {
+   int err;
+   CALLBACK_MAYBE(s, on_chunk_complete);
+diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c
+index 5e7c5d1..5eb19f6 100644
+--- a/deps/llhttp/src/llhttp.c
++++ b/deps/llhttp/src/llhttp.c
+@@ -340,6 +340,8 @@ enum llparse_state_e {
+   s_n_llhttp__internal__n_invoke_is_equal_content_length,
+   s_n_llhttp__internal__n_chunk_size_almost_done,
+   s_n_llhttp__internal__n_chunk_parameters,
++  s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters,
++  s_n_llhttp__internal__n_chunk_parameters_ows,
+   s_n_llhttp__internal__n_chunk_size_otherwise,
+   s_n_llhttp__internal__n_chunk_size,
+   s_n_llhttp__internal__n_chunk_size_digit,
+@@ -539,6 +541,10 @@ int llhttp__on_body(
+     llhttp__internal_t* s, const unsigned char* p,
+     const unsigned char* endp);
+
++int llhttp__on_chunk_parameters(
++    llhttp__internal_t* s, const unsigned char* p,
++    const unsigned char* endp);
++
+ int llhttp__on_status(
+     llhttp__internal_t* s, const unsigned char* p,
+     const unsigned char* endp);
+@@ -1226,8 +1232,7 @@ static llparse_state_t llhttp__internal__run(
+           goto s_n_llhttp__internal__n_chunk_parameters;
+         }
+         case 2: {
+-          p++;
+-          goto s_n_llhttp__internal__n_chunk_size_almost_done;
++	  goto s_n_llhttp__internal__n_span_end_llhttp__on_chunk_parameters;
+         }
+         default: {
+           goto s_n_llhttp__internal__n_error_10;
+@@ -1236,6 +1241,34 @@ static llparse_state_t llhttp__internal__run(
+       /* UNREACHABLE */;
+       abort();
+     }
++    case s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters:
++    s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters: {
++      if (p == endp) {
++        return s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters;
++      }
++      state->_span_pos0 = (void*) p;
++      state->_span_cb0 = llhttp__on_chunk_parameters;
++      goto s_n_llhttp__internal__n_chunk_parameters;
++      /* UNREACHABLE */;
++      abort();
++    }
++    case s_n_llhttp__internal__n_chunk_parameters_ows:
++    s_n_llhttp__internal__n_chunk_parameters_ows: {
++      if (p == endp) {
++        return s_n_llhttp__internal__n_chunk_parameters_ows;
++      }
++      switch (*p) {
++        case ' ': {
++          p++;
++          goto s_n_llhttp__internal__n_chunk_parameters_ows;
++        }
++        default: {
++          goto s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters;
++        }
++      }
++      /* UNREACHABLE */;
++      abort();
++    }
+     case s_n_llhttp__internal__n_chunk_size_otherwise:
+     s_n_llhttp__internal__n_chunk_size_otherwise: {
+       if (p == endp) {
+@@ -1246,13 +1279,9 @@ static llparse_state_t llhttp__internal__run(
+           p++;
+           goto s_n_llhttp__internal__n_chunk_size_almost_done;
+         }
+-        case ' ': {
+-          p++;
+-          goto s_n_llhttp__internal__n_chunk_parameters;
+-        }
+         case ';': {
+           p++;
+-          goto s_n_llhttp__internal__n_chunk_parameters;
++          goto s_n_llhttp__internal__n_chunk_parameters_ows;
+         }
+         default: {
+           goto s_n_llhttp__internal__n_error_11;
+@@ -6074,6 +6103,24 @@ static llparse_state_t llhttp__internal__run(
+     /* UNREACHABLE */;
+     abort();
+   }
++  s_n_llhttp__internal__n_span_end_llhttp__on_chunk_parameters: {
++    const unsigned char* start;
++    int err;
++
++    start = state->_span_pos0;
++    state->_span_pos0 = NULL;
++    err = llhttp__on_chunk_parameters(state, start, p);
++    if (err != 0) {
++      state->error = err;
++      state->error_pos = (const char*) (p + 1);
++      state->_current = (void*) (intptr_t) s_n_llhttp__internal__n_chunk_size_almost_done;
++      return s_error;
++    }
++    p++;
++    goto s_n_llhttp__internal__n_chunk_size_almost_done;
++    /* UNREACHABLE */;
++    abort();
++  }
+   s_n_llhttp__internal__n_error_10: {
+     state->error = 0x2;
+     state->reason = "Invalid character in chunk parameters";
+@@ -8441,6 +8488,8 @@ enum llparse_state_e {
+   s_n_llhttp__internal__n_invoke_is_equal_content_length,
+   s_n_llhttp__internal__n_chunk_size_almost_done,
+   s_n_llhttp__internal__n_chunk_parameters,
++  s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters,
++  s_n_llhttp__internal__n_chunk_parameters_ows,
+   s_n_llhttp__internal__n_chunk_size_otherwise,
+   s_n_llhttp__internal__n_chunk_size,
+   s_n_llhttp__internal__n_chunk_size_digit,
+@@ -8635,6 +8684,10 @@ int llhttp__on_body(
+     llhttp__internal_t* s, const unsigned char* p,
+     const unsigned char* endp);
+
++int llhttp__on_chunk_parameters(
++    llhttp__internal_t* s, const unsigned char* p,
++    const unsigned char* endp);
++
+ int llhttp__on_status(
+     llhttp__internal_t* s, const unsigned char* p,
+     const unsigned char* endp);
+@@ -9299,8 +9352,7 @@ static llparse_state_t llhttp__internal__run(
+           goto s_n_llhttp__internal__n_chunk_parameters;
+         }
+         case 2: {
+-          p++;
+-          goto s_n_llhttp__internal__n_chunk_size_almost_done;
++	  goto s_n_llhttp__internal__n_span_end_llhttp__on_chunk_parameters;
+         }
+         default: {
+           goto s_n_llhttp__internal__n_error_6;
+@@ -9309,6 +9361,34 @@ static llparse_state_t llhttp__internal__run(
+       /* UNREACHABLE */;
+       abort();
+     }
++    case s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters:
++    s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters: {
++      if (p == endp) {
++        return s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters;
++      }
++      state->_span_pos0 = (void*) p;
++      state->_span_cb0 = llhttp__on_chunk_parameters;
++      goto s_n_llhttp__internal__n_chunk_parameters;
++      /* UNREACHABLE */;
++      abort();
++    }
++    case s_n_llhttp__internal__n_chunk_parameters_ows:
++    s_n_llhttp__internal__n_chunk_parameters_ows: {
++      if (p == endp) {
++        return s_n_llhttp__internal__n_chunk_parameters_ows;
++      }
++      switch (*p) {
++        case ' ': {
++          p++;
++          goto s_n_llhttp__internal__n_chunk_parameters_ows;
++        }
++        default: {
++          goto s_n_llhttp__internal__n_span_start_llhttp__on_chunk_parameters;
++        }
++      }
++      /* UNREACHABLE */;
++      abort();
++    }
+     case s_n_llhttp__internal__n_chunk_size_otherwise:
+     s_n_llhttp__internal__n_chunk_size_otherwise: {
+       if (p == endp) {
+@@ -9319,13 +9399,9 @@ static llparse_state_t llhttp__internal__run(
+           p++;
+           goto s_n_llhttp__internal__n_chunk_size_almost_done;
+         }
+-        case ' ': {
+-          p++;
+-          goto s_n_llhttp__internal__n_chunk_parameters;
+-        }
+         case ';': {
+           p++;
+-          goto s_n_llhttp__internal__n_chunk_parameters;
++          goto s_n_llhttp__internal__n_chunk_parameters_ows;
+         }
+         default: {
+           goto s_n_llhttp__internal__n_error_7;
+@@ -13951,6 +14027,24 @@ static llparse_state_t llhttp__internal__run(
+     /* UNREACHABLE */;
+     abort();
+   }
++  s_n_llhttp__internal__n_span_end_llhttp__on_chunk_parameters: {
++    const unsigned char* start;
++    int err;
++
++    start = state->_span_pos0;
++    state->_span_pos0 = NULL;
++    err = llhttp__on_chunk_parameters(state, start, p);
++    if (err != 0) {
++      state->error = err;
++      state->error_pos = (const char*) (p + 1);
++      state->_current = (void*) (intptr_t) s_n_llhttp__internal__n_chunk_size_almost_done;
++      return s_error;
++    }
++    p++;
++    goto s_n_llhttp__internal__n_chunk_size_almost_done;
++    /* UNREACHABLE */;
++    abort();
++  }
+   s_n_llhttp__internal__n_error_6: {
+     state->error = 0x2;
+     state->reason = "Invalid character in chunk parameters";
+diff --git a/doc/api/errors.md b/doc/api/errors.md
+index dcf8744..a76bfe5 100644
+--- a/doc/api/errors.md
++++ b/doc/api/errors.md
+@@ -3043,6 +3043,18 @@ malconfigured clients, if more than 8 KiB of HTTP header data is received then
+ HTTP parsing will abort without a request or response object being created, and
+ an `Error` with this code will be emitted.
+
++<a id="HPE_CHUNK_EXTENSIONS_OVERFLOW"></a>
++
++### `HPE_CHUNK_EXTENSIONS_OVERFLOW`
++
++<!-- YAML
++added: REPLACEME
++-->
++
++Too much data was received for a chunk extensions. In order to protect against
++malicious or malconfigured clients, if more than 16 KiB of data is received
++then an `Error` with this code will be emitted.
++
+ <a id="HPE_UNEXPECTED_CONTENT_LENGTH"></a>
+
+ ### `HPE_UNEXPECTED_CONTENT_LENGTH`
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
+index 74f3248..b92e848 100644
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
++        "HPE_CHUNK_EXTENSIONS_OVERFLOW:Chunk extensions overflow");
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
+@@ -921,6 +938,7 @@ const llhttp_settings_t Parser::settings = {
+   Proxy<DataCall, &Parser::on_header_field>::Raw,
+   Proxy<DataCall, &Parser::on_header_value>::Raw,
+   Proxy<Call, &Parser::on_headers_complete>::Raw,
++  Proxy<DataCall, &Parser::on_chunk_extension>::Raw,
+   Proxy<DataCall, &Parser::on_body>::Raw,
+   Proxy<Call, &Parser::on_message_complete>::Raw,
+   Proxy<Call, &Parser::on_chunk_header>::Raw,
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
+diff --git a/tools/update-llhttp.sh b/tools/update-llhttp.sh
+index 12e2f46..a95eef1 100755
+--- a/tools/update-llhttp.sh
++++ b/tools/update-llhttp.sh
+@@ -59,5 +59,5 @@ echo ""
+ echo "Please git add llhttp, commit the new version:"
+ echo ""
+ echo "$ git add -A deps/llhttp"
+-echo "$ git commit -m \"deps: update nghttp2 to $LLHTTP_VERSION\""
++echo "$ git commit -m \"deps: update llhttp to $LLHTTP_VERSION\""
+ echo ""
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


