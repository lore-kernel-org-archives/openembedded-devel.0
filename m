Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B588F506C3
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 12:37:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49276.1773664661828341028
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 05:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eoxcP0qB;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so1220741f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 05:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773664660; x=1774269460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gK+197MgOfFHyBMguv6Rradeyu9H3IV8KlLBzol2JK0=;
        b=eoxcP0qBS6oYwKorLv2UcT16T+P243vOzbPpx4B7NpBo5CKw9BfHN/iFFfonpo1hXf
         YM/jp+4Z/PZLDlYb6hpMo4IvAfHks+N5/6EgDBQ28YLSXriypJUjFvd0uSKgs2lAOB1I
         b+MP+jB0ZAYxHGydD/EL3pzrTNGkOMYOiI9SokTAGbblt9AO4j4ui3z/StR1xSut3V2m
         qp690OPtrpi5Mdxx+IxeFNIiUvotxeMNHuQfgqKhTzvwp8xHra03WrmMZILQ/+Boq/eE
         +8kECxDfWK+hcV/OrJusIM1rZlZl4QDhgWV0sThK5kX1cYSHTmWSD6iw21Tr6gx2D7bE
         NG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773664660; x=1774269460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gK+197MgOfFHyBMguv6Rradeyu9H3IV8KlLBzol2JK0=;
        b=bU6WQ76+F8YC64Onk6SuIAqugNCWZkPM+DIKvPkC0BYeWZCp3MVptisNjb3IPXXIh5
         /wdsN7lE/DLMT4WPJq2eXaviOfMsREy1YXggwH449WSR1g1eLuqlaP3ngKnsIu+OHceJ
         JcJnRe4c/Gq4ihjAqdvDlbpQmw2CXvsJIjtNDiPWXbty1SGZ6PyS6y+wqWfc7nI6tBBs
         um0LGwKUIaQNq6xJop4+O0XtFutEpOLbbNxy+3xFwcMpdIdEQ8P0ZLKFys0UXnNi2bNF
         3pnbGD/8cdrvnJkQdMU9g/AiYKCDwfaLwF4CqHqHR8O7P24tNMENRs/35tk1a+LHmlJ+
         v/8A==
X-Gm-Message-State: AOJu0Yw+4tJiSupvY+kSf3UjylAtW8r5Hrd+7RZliR/vTov4I009LHuv
	W1sNSPhy5nb2p5oO1Weeoyg8RBD7DQDchuacDncXlEyWUJzlRjUox63JAuwF+A==
X-Gm-Gg: ATEYQzwKXXjbU8AvJPzlPc40OlS+1S1JqwIBrHXgWHZS5dcufrGKCGdDdf3eJh2lM8Z
	JXt9wOSz8EUKdK/Z2ep5s7HPo7cBNM9imQ00YyM0dmizZ+/K9w4if2T8vgNk7tPPLJNIXIemer3
	I1d9lZ63xeGyZuXzAEgY3IfqUInxJcjuwwtYoC1JdPMJW1faugbH/gtzTWQfM8T0Py/KvbaZMTZ
	dOf2gqPKPX3ZcvEM7KxOviT+5YWyfh7dSEy1j2zDgQKPx8Z3d5LUHFSpFNIAuGy+uM8PPorbdiM
	sz67t4o0L7zbFE0ilLB+bo7T5WfnFY/UPGUvdRQumnttVfb9472SUjh5hi36rxL7jc9oCFOtGGT
	FmwgUGhWUgnnH39Lidc3kGBjPi4Tc7J840AQYtY861v53abWV3Vb0c+Yy7MOeFQ1ivQ0iiinir2
	3bgNNcWegG9Bk2R2lExbD+
X-Received: by 2002:a05:6000:24c2:b0:439:bb46:7457 with SMTP id ffacd0b85a97d-439fe192ab8mr33169427f8f.16.1773664659939;
        Mon, 16 Mar 2026 05:37:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm42285083f8f.31.2026.03.16.05.37.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:37:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] capnproto: patch CVE-2026-32239 and CVE-2026-32240
Date: Mon, 16 Mar 2026 13:37:38 +0100
Message-ID: <20260316123738.1202965-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 12:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125275

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
index 0000000000..5b0f472a8c
--- /dev/null
+++ b/meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-32240.patch
@@ -0,0 +1,160 @@
+From 01766b0d9a94721d687545a745333a06a610cb28 Mon Sep 17 00:00:00 2001
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
index cb4aef5224..1eaa04f484 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
@@ -5,7 +5,9 @@ SECTION = "console/tools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
-SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https"
+SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https \
+           file://CVE-2026-32239_CVE-2026-32240.patch;patchdir=.. \
+           "
 SRCREV = "1a0e12c0a3ba1f0dbbad45ddfef555166e0a14fc"
 
 S = "${WORKDIR}/git/c++"

