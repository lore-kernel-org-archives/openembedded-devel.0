Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4FFF013FD
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 12:32:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49408.1773664340717084905
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 05:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q1umWfl0;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so4451195f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 05:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773664339; x=1774269139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPT+98jlsmRSjGzOcD+ew3n+A5sSg+dc37Ru0YLxSOk=;
        b=Q1umWfl0r8CQVmZTgHQmigKoIIZEYerftTnxCP+aGbqz7RoQG+mmf08Wn3OyLSkB/O
         sx0WEYRJX3nIShSvJZ4rs6UseGZK4k5j8bqWurJ0raDUmvtrTi1oJJaB3VAPFsVk2VXU
         6RDkeMLWcBOTffIG6vmPTAtXNdY16EGs0z+Pq77TNbKU9c/ovLsbCP+7xCPwOjosFb7h
         mEfUdwNLh/mxTOS24z5wJqj4CR9DTVjTm0au5S7wxsNNlinVvM7qut7aJjS2kqTcFq6P
         YFCvq4Ke98rMas+xIttUmE3Vkyh3ktbCWDffwhmM6oHPYFHmieVUaduD16gBAODUjgQP
         jWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773664339; x=1774269139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPT+98jlsmRSjGzOcD+ew3n+A5sSg+dc37Ru0YLxSOk=;
        b=a1vlEV6ZPX2BlAtxaeJZzvHcEPb8GsvmtQ0KwRAatXrOvRW3I23PF4E84hYAe87xJG
         dHSg+fmzMsRzklqv7O26XNybfq4M7zUAXzjSHkgCeh5xfRP1/+aINQwnskoPuROSmmjQ
         6sBRHOfzVahadyJBIXi2NlVOYqmM5QmoeLP29i9levEiATIGh11jwffX3bZWwrCuMw3T
         VxpVhyKbzlkKjZbJBb6g6xzLdxtLf7b82nB3XBU5GpRr8CxzvN3UtXbZB+0Y1aJevAHd
         L0FcXMzgPm2qtD/j9jcsRLK8o3RCnNUmsgJmIO45vEU4r6xOgLM3jcRubT1i84izlRtI
         /JbA==
X-Gm-Message-State: AOJu0Yyg1EZQOad9jrn4GZKkqsEijUMUy0hwHbH7RsGbKzLmxZH4sUOZ
	jMhh1HlFD0U7fgbeyaNKqIAC1AZxopkSyPH0oWiIcBBUcfYn0iLjunAQhymtyA==
X-Gm-Gg: ATEYQzwdcGHa6KNv4oxUvj0I+/2XGVNZxGg5Yc/7C85B5qTjWvLdtNJ6d188NB7Q7W4
	DMghUT22m4FhcYY4qTiUurQ+5SF1T2UoHxtxszIiL0iOazd3cXf94SnscZsCHlWkS9xK7HHrX0+
	0Aizg3FrB5hL18iQlDrcNDmhxjr69LqcA78qgvt55/l/6fx1DrAkf9N8k+dU007U27Xkb7kjPsy
	kh0SX75SpAKfKVGUiDr+qhiiXnj45XuUiSKRpms8ai4ZM2g0NcaBiRkoYE4P+aLy7rzNGJ9C5Je
	TGwaT0/2dNfAsHw3OL+njD+PGBmAHOsgHFzTGxS996q/k7kE5RdAGymyVpeK+b9ilv6VQnz7JtA
	2/CFJSFjuErFgsPuCEkScduMg4cmhYIzRnZWuEDQJejRSbHwuKB8ILWuXX8VCnnWqfXsvWZLkKR
	34XyWKWss99DCb1QBvjo7h
X-Received: by 2002:a05:6000:4012:b0:43b:433f:48a9 with SMTP id ffacd0b85a97d-43b433f4a42mr7367633f8f.15.1773664338637;
        Mon, 16 Mar 2026 05:32:18 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm42392947f8f.20.2026.03.16.05.32.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:32:18 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH] capnproto: patch CVE-2026-32239 and CVE-2026-32240
Date: Mon, 16 Mar 2026 13:32:17 +0100
Message-ID: <20260316123217.1179942-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 12:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125274

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-32239
https://nvd.nist.gov/vuln/detail/CVE-2026-32240

Backport the patch that is referenced by the NVD advisories.
(Same patch for both vulnerabilities)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../CVE-2026-32239_CVE-2026-32240.patch       | 160 ++++++++++++++++++
 .../capnproto/capnproto_1.0.2.bb              |   4 +-
 2 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-32240.patch

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-32240.patch b/meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-32240.patch
new file mode 100644
index 0000000000..803a0d55ad
--- /dev/null
+++ b/meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-32240.patch
@@ -0,0 +1,160 @@
+From 0e77b95c0829c83a31be5e219aee2a4e3f9895a7 Mon Sep 17 00:00:00 2001
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
+index f10ff8d1..daf08992 100644
+--- a/c++/src/kj/compat/http-test.c++
++++ b/c++/src/kj/compat/http-test.c++
+@@ -4038,6 +4038,70 @@ KJ_TEST("HttpServer invalid method") {
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
+index aae47ad1..da705e66 100644
+--- a/c++/src/kj/compat/http.c++
++++ b/c++/src/kj/compat/http.c++
+@@ -1406,16 +1406,20 @@ public:
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
+@@ -1942,7 +1946,15 @@ kj::Own<kj::AsyncInputStream> HttpInputStreamImpl::getEntityBody(
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
+         // HACK: Neither Content-Length nor Transfer-Encoding header in response to HEAD
+         //   request. Propagate this fact with a 0 expected body length.
+@@ -1991,12 +2003,16 @@ kj::Own<kj::AsyncInputStream> HttpInputStreamImpl::getEntityBody(
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
diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
index 0ea243fd20..22c4b7cd0a 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
@@ -6,7 +6,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https \
-           file://0001-Export-binaries-only-for-native-build.patch"
+           file://0001-Export-binaries-only-for-native-build.patch \
+           file://CVE-2026-32239_CVE-2026-32240.patch;patchdir=.. \
+           "
 SRCREV = "1a0e12c0a3ba1f0dbbad45ddfef555166e0a14fc"
 
 S = "${UNPACKDIR}/${BP}/c++"

