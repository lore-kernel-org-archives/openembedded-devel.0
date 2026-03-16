Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84847F506CC
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 13:05:23 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50073.1773666317261123766
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 06:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jW/omMli;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so4555377f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 06:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773666316; x=1774271116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lprv+DXnxWCtvb/pwNJnOaA9V4lJ8ZXtAeAql/qK9/8=;
        b=jW/omMlieFvKzn45Gl7QNpEMvHUrvLmcuGRJ7RRZP8887vKfgqeFvg6n193Gumk2yV
         T5NAY6iH9YDyDzNjxlJCMYz/fn95eKC0TDH5w+XByGpyAVubbvpqlvx7Zz6lAtfaMS5l
         rXWpWZbw81vYoQ4mdQIADyMaWrU/ouriyX0L4q3leFYOwF0iRqDmxCUpSCM5u2xPb+JF
         PxQchhjOz0oNRTkdYyugqXZjItHa07U926lEGBGl6M77kwtju6lTQk/zsQ671sFilTe6
         twTQPf7ywLg0pU1OpXMzUdvwbkE9CvAmoyd1XjMSMVY1JjJC3Iko79pk3w98gfSylAxQ
         wYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773666316; x=1774271116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lprv+DXnxWCtvb/pwNJnOaA9V4lJ8ZXtAeAql/qK9/8=;
        b=JLRJuXah0/v5zznMF+Sia367iaJIGf6JMVaym+q9hPBNbAOx1ZjPUFZA0bU1zHZ9p5
         NMxhA+G+rVR6vcB5DE/x0HYDpLyjXGM6ww93S1UKl3yyOCN1cQCV9kq+53avQcjCO5ZM
         bDwdl/WBpdJBBFiGjavnbq9pPFbr4QSn59wHy4Ses7gVs3JiBrhhsTEOkOeXHbvzoLMv
         +sQT2RICW6gIpC5df8vDTx9UYBSRJ9A4I0FD4S2hxV4YzUaYEELJN39oOj06LCNThoMq
         yKfuOP9GxJYjN9JmU/1qKUndLgUH8lGSeY7D/ziDyX/rvBHnQpevmpfLogC8yPsmJNVp
         Dcvw==
X-Gm-Message-State: AOJu0YxjddhDdzNtStltqmlsIiDTP1qW0fdBpeS4cjVzXbyWrCgTLBO/
	tv/kGeAJARcgWwOv4qYzkUn9FllSpqDNrHZFfIJxIOEx4gLrrViuxW8J/CeUNg==
X-Gm-Gg: ATEYQzwMSX4Ex2peVwd4WVJTtpOlviNAGIotGyT8XJPciRjKp9XYhSEo3vDLbvHiZHU
	RrbBzCktwAHESerIxV5CYc8+DSoc51tKbn5e54kHdz1SAm1DgVYbFysvKOzY5YFQ318AfRcvloA
	TMxE6ako2O0/tM+sUAGpQHtbWIPB6BbUrsz1Dluj7VsCckdS3nrzc6DWB6ENRurX9Kx8abM5sJo
	sjch9V9QqL97ZhC+mjsrVbX0g/IZY+Lk36nd/dbJqGwA7p+E9js6Tr5qCfzjYnVPLpzC/q6TCH3
	kv2nRYlc49e9+7SXYXH9zA7IWE/lS0x5ocCGcijz18LpeaGaUUX3AGiB8VQa2j09T/mmX4i4XEj
	aKkxlo/OtohoreFHYfwhl8IzcfFQPsjez+mR9oKni2CFpP7lMnnahA4URIl3LOBe2jaOqI2iouf
	RZAELBlBvXBl53sRdp7mXd
X-Received: by 2002:a5d:5f46:0:b0:43b:3eef:acdc with SMTP id ffacd0b85a97d-43b3eefad8dmr9914591f8f.31.1773666284272;
        Mon, 16 Mar 2026 06:04:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a0b2e2c71sm28723091f8f.22.2026.03.16.06.04.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:04:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] capnproto: patch CVE-2026-32239 and CVE-2026-32240
Date: Mon, 16 Mar 2026 14:04:42 +0100
Message-ID: <20260316130442.1291751-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 13:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125276

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-32239
https://nvd.nist.gov/vuln/detail/CVE-2026-32240

Backport the patch that is referenced by the NVD advisories.
(Same patch for both vulnerabilities)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../CVE-2026-32239_CVE-2026-32240.patch       | 160 ++++++++++++++++++
 .../capnproto/capnproto_0.9.2.bb              |   1 +
 2 files changed, 161 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-32240.patch

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-32240.patch b/meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-32240.patch
new file mode 100644
index 0000000000..bc48251c70
--- /dev/null
+++ b/meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-32240.patch
@@ -0,0 +1,160 @@
+From 6e5ee24ad92687a56a26ae596da45dc6c2f902c0 Mon Sep 17 00:00:00 2001
+From: Kenton Varda <kenton@cloudflare.com>
+Date: Tue, 10 Mar 2026 18:16:14 -0500
+Subject: [PATCH] Fix HTTP body size integer overflow bugs.
+
+The KJ-HTTP library was discovered to have two bugs related to integer overflows while handling message body sizes:
+1. A negative `Content-Length` value was converted to unsigned, treating it as an impossibly large length instead.
+2. When using `Transfer-Encoding: chunked`, if a chunk's size parsed to a value of 2^64 or larger, it would be truncated to a 64-bit integer.
+
+In theory, these bugs could enable HTTP request/response smuggling, although it would require integration with a proxy that has bugs of its own.
+
+For more details, see (in a future commit): security-advisories/2026-03-10-1-http-size-validation.md
+
+CVE: CVE-2026-32239 CVE-2026-32240
+Upstream-Status: Backport [https://github.com/capnproto/capnproto/commit/2744b3c012b4aa3c31cefb61ec656829fa5c0e36]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ c++/src/kj/compat/http-test.c++ | 64 +++++++++++++++++++++++++++++++++
+ c++/src/kj/compat/http.c++      | 28 +++++++++++----
+ 2 files changed, 86 insertions(+), 6 deletions(-)
+
+diff --git a/c++/src/kj/compat/http-test.c++ b/c++/src/kj/compat/http-test.c++
+index 87395534..80689eb4 100644
+--- a/c++/src/kj/compat/http-test.c++
++++ b/c++/src/kj/compat/http-test.c++
+@@ -2617,6 +2617,70 @@ KJ_TEST("HttpServer invalid method") {
+   KJ_EXPECT(expectedResponse == response, expectedResponse, response);
+ }
+ 
++KJ_TEST("HttpServer rejects negative Content-Length") {
++  KJ_HTTP_TEST_SETUP_IO;
++  kj::TimerImpl timer(kj::origin<kj::TimePoint>());
++  auto pipe = KJ_HTTP_TEST_CREATE_2PIPE;
++
++  HttpHeaderTable table;
++  BrokenHttpService service;
++  HttpServer server(timer, table, service, {
++    .canceledUploadGraceBytes = 1024 * 1024,
++  });
++
++  auto listenTask = server.listenHttp(kj::mv(pipe.ends[0]));
++
++  auto msg =
++      "POST / HTTP/1.1\r\n"
++      "Content-Length: -1\r\n"
++      "\r\n"
++      "foo"_kj.asBytes();
++
++  auto writePromise = pipe.ends[1]->write(msg.begin(), msg.size());
++  auto response = pipe.ends[1]->readAllText().wait(waitScope);
++
++  // The server should reject the negative Content-Length. The KJ_FAIL_REQUIRE in getEntityBody()
++  // gets caught by the server loop and turned into a 500 error.
++  KJ_EXPECT(response.startsWith("HTTP/1.1 500 Internal Server Error"), response);
++
++  KJ_EXPECT(writePromise.poll(waitScope));
++  writePromise.catch_([](kj::Exception&&) {}).wait(waitScope);
++}
++
++KJ_TEST("HttpServer rejects chunked body with overflowing chunk size") {
++  KJ_HTTP_TEST_SETUP_IO;
++  kj::TimerImpl timer(kj::origin<kj::TimePoint>());
++  auto pipe = KJ_HTTP_TEST_CREATE_2PIPE;
++
++  HttpHeaderTable table;
++  BrokenHttpService service;
++  HttpServer server(timer, table, service, {
++    .canceledUploadGraceBytes = 1024 * 1024,
++  });
++
++  auto listenTask = server.listenHttp(kj::mv(pipe.ends[0]));
++
++  // 17 hex digits: 0x10000000000000000 = 2^64, which overflows uint64_t.
++  auto msg =
++      "POST / HTTP/1.1\r\n"
++      "Transfer-Encoding: chunked\r\n"
++      "\r\n"
++      "10000000000000000\r\n"
++      "x\r\n"
++      "0\r\n"
++      "\r\n"_kj.asBytes();
++
++  auto writePromise = pipe.ends[1]->write(msg.begin(), msg.size());
++  auto response = pipe.ends[1]->readAllText().wait(waitScope);
++
++  // The chunk size overflow causes a KJ_REQUIRE failure during body reading, which the server
++  // catches and turns into a 500 error.
++  KJ_EXPECT(response.startsWith("HTTP/1.1 500 Internal Server Error"), response);
++
++  KJ_EXPECT(writePromise.poll(waitScope));
++  writePromise.catch_([](kj::Exception&&) {}).wait(waitScope);
++}
++
+ // Ensure that HttpServerSettings can continue to be constexpr.
+ KJ_UNUSED static constexpr HttpServerSettings STATIC_CONSTEXPR_SETTINGS {};
+ 
+diff --git a/c++/src/kj/compat/http.c++ b/c++/src/kj/compat/http.c++
+index f8bacf4e..cbe97d2f 100644
+--- a/c++/src/kj/compat/http.c++
++++ b/c++/src/kj/compat/http.c++
+@@ -1186,16 +1186,20 @@ public:
+ 
+       uint64_t value = 0;
+       for (char c: text) {
++        uint64_t digit;
+         if ('0' <= c && c <= '9') {
+-          value = value * 16 + (c - '0');
++          digit = c - '0';
+         } else if ('a' <= c && c <= 'f') {
+-          value = value * 16 + (c - 'a' + 10);
++          digit = c - 'a' + 10;
+         } else if ('A' <= c && c <= 'F') {
+-          value = value * 16 + (c - 'A' + 10);
++          digit = c - 'A' + 10;
+         } else {
+           KJ_FAIL_REQUIRE("invalid HTTP chunk size", text, text.asBytes()) { break; }
+           return value;
+         }
++        KJ_REQUIRE(value <= (uint64_t(kj::maxValue) >> 4),
++            "HTTP chunk size overflow", text, text.asBytes()) { break; }
++        value = value * 16 + digit;
+       }
+ 
+       return value;
+@@ -1672,7 +1676,15 @@ kj::Own<kj::AsyncInputStream> HttpInputStreamImpl::getEntityBody(
+       // Body elided.
+       kj::Maybe<uint64_t> length;
+       KJ_IF_MAYBE(cl, headers.get(HttpHeaderId::CONTENT_LENGTH)) {
+-        length = strtoull(cl->cStr(), nullptr, 10);
++        // Validate that the Content-Length is a non-negative integer. Note that strtoull() accepts
++        // leading '-' signs and silently converts negative values to large unsigned values, so we
++        // must explicitly check for a leading digit.
++        char* end;
++        uint64_t parsedValue = strtoull(cl->cStr(), &end, 10);
++        if ((*cl)[0] >= '0' && (*cl)[0] <= '9' && end > cl->begin() && *end == '\0') {
++          length = parsedValue;
++        }
++        // If invalid, we just leave `length` as nullptr, since the body is elided anyway.
+       } else if (headers.get(HttpHeaderId::TRANSFER_ENCODING) == nullptr) {
+         // HACK: Neither Content-Length nor Transfer-Encoding header in response to HEAD request.
+         //   Propagate this fact with a 0 expected body length.
+@@ -1716,12 +1728,16 @@ kj::Own<kj::AsyncInputStream> HttpInputStreamImpl::getEntityBody(
+     //   "Content-Length: 5, 5, 5". Hopefully no one actually does that...
+     char* end;
+     uint64_t length = strtoull(cl->cStr(), &end, 10);
+-    if (end > cl->begin() && *end == '\0') {
++    // Note that strtoull() accepts leading '-' signs and silently converts negative values to
++    // large unsigned values, so we must explicitly check for a leading digit.
++    if ((*cl)[0] >= '0' && (*cl)[0] <= '9' && end > cl->begin() && *end == '\0') {
+       // #5
+       return kj::heap<HttpFixedLengthEntityReader>(*this, length);
+     } else {
+       // #4 (bad content-length)
+-      KJ_FAIL_REQUIRE("invalid Content-Length header value", *cl);
++      KJ_FAIL_REQUIRE("invalid Content-Length header value", *cl) { break; }
++      // To pass the -fno-exceptions test (but KJ-HTTP is really not safe to use in that mode).
++      return kj::heap<HttpNullEntityReader>(*this, uint64_t(0));
+     }
+   }
+ 
diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.9.2.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.9.2.bb
index d114ad0c63..8f62efa967 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.9.2.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.9.2.bb
@@ -6,6 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https \
+           file://CVE-2026-32239_CVE-2026-32240.patch;patchdir=.. \
            "
 SRCREV = "0274bf17374df912ea834687c667bed33bd318db"
 

