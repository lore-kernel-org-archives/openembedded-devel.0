Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11123.1793278388304592213
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 05:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Lx/kiP1Q;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so17650065e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793278386; x=1793883186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zU+gqZwiSA07AchNW5vc0Le+3SKfGCLiG1yjiry6CAM=;
        b=Lx/kiP1QV1Uc9wII2TaKLczpqHJbvjU88q0yf122ShftwpQvN4gG+PQQuErySIjoZX
         sD2I2IYWcif0k452fWPhtdXdwalLfoJroERKHhErLK5MW4sUpLFUKYAxc9C23PlRe/rx
         HmyV9te0L87rqFo8mlAS26auEINmOoAWqtrCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278386; x=1793883186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zU+gqZwiSA07AchNW5vc0Le+3SKfGCLiG1yjiry6CAM=;
        b=NRZADZNhcv5LlA/GIbT7uMGYg9UlXQ5TkNkTJ3ipvy+kCAYfY33zPZU4tyxcbo6GE7
         EpCnsdVNEVdD4KsCCwVa2uwA1NGRf5F83yr5Eb5+DTSQjhBjgnu8BnrNmkZ+0PrUxye6
         jKgv/+OFTIe4yKaIX4cv+uajKVvlkWf0OaOziqfbf1n7o0kSBwRB9hUbmDFIofZxAMs9
         Af8lZ8eApCxwrD7HtKPrvuEYyo1DNWf+sldOD67ed33HbvwdPZGGhrZNbDjYAiMAysm0
         mepXRrIfiLpXzheuwWzC7jvBgQbAs8hPBQBSERIx0XCzzf8xl27qc/hiKial9c05AEbZ
         qV0A==
X-Gm-Message-State: AFq9FYJga39xIgyC78RXLKIHTQbKt9HoaZSkVkCRvEFYtXu5cSr13Qdd
	ukc738zpPclgDbfm8wfBuWiLyA0NsQm92p8DIauY0HDl6WBkOZ+gr85hZnNLyx5fZj5EF0ND25e
	1MNqP
X-Gm-Gg: AYBFou2MRprKertFSMdRik0l2YajUxkxiv8D/Nsrlg/I9DxruKh2Co/x/xu1E5d3WcM
	lppz2uGsLmDLxD94RNFM8WZ6ckwJY8CX/iG7EXoxptjVhNrE0dR/ci2sPxR5VJZN15bIaZpXrJc
	UiBYbapxR3178YHV09QrDXbRmAMCU7Ro3ZPPTQq5y3LTrfiHJ6zZueJtAQ7Ov6HQdPy+p/YU4Wk
	lMM5rU8hDxzCmYhX5/ZGydWmRLOypcOq4BZMHJuieQY5/Ugq8XyXj0t8wjx/jInm3XNcHw+Y1eA
	xht2yzNLGXYEbnO4ojOxzYw1sbcJeypviP1MC7Mx2AtfAsDJLHvOyZ8R/dcDVQMixxBnCni1Wz0
	IvgyIiYS2dOn9AVU28KXkdf5g6GurM4SrvQxnfq5Ts84/io76ve0YYfg41zffSYWAJLcUNtwgff
	aVDBH/6fhVhhSOozxXP5GGJU0hTu7JUCtbdauIo+u4Jxg2GVY4gMDSFs5P2wy4YxNhxilznpqTW
	JEB5t5zeVyRnAQdA6fsXAng/2HNp7LyWudUXQa4GPwjH0xQJwkMtuqxY51sQ8Dl/ZcxtGf6lUkN
	A4zfkgfwIxvXN//f5h2l7cFE3FoAGHD8Bf8cA6kyI7TBQK9n93MnueX/zNw9cifvwaxSyQ7iv0s
	e61BdhT0xaH2us8iMatQF0wO8ZsOINQnAA48+wjpFeLxTsVgvX6OM2w==
X-Received: by 2002:a05:600c:3b24:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4a966c41c8dmr126089755e9.8.1793278386356;
        Thu, 29 Oct 2026 05:53:06 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f4188f4sm61465685e9.4.2026.10.29.05.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:53:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-starlette: Upgrade 1.6.0 -> 1.10.0
Date: Thu, 29 Oct 2026 14:53:03 +0200
Message-ID: <20261029125303.811460-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 12:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131659
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.10.0:

Leaner URL-encoded form parsing:

Starlette 1.10.0 parses URL-encoded forms with less memory and CPU, no
longer drops the last field when a stream ends early, and lets you
compare FormData that holds several uploads under one key.

- Forms with many fields parse faster and use less memory (#3724).
  FormParser builds each field in the parser callbacks instead of
  queueing every event and replaying it. On CodSpeed, 1000 fields
  went from 42.8 ms to 34.9 ms and from 63.5 KB to 54.5 KB, and the
  max_fields limit case went from 6,880 B to 864 B.
- The last field is kept when the request stream ends without an
  empty chunk (#3599). The parser is now finalized once the stream
  is exhausted, so custom streams that never yield a final b"" no
  longer lose their last field.
- FormData with repeated uploads can be compared (#3619). Comparing
  two FormData objects with several UploadFile values under the
  same key used to raise TypeError.

Behaviour changes:

- Multidict equality keeps the order of values under a repeated key
  (#3619). Keys can still appear in any order, but
  QueryParams("a=1&a=2") and QueryParams("a=2&a=1") are no longer
  equal, matching what getlist() returns.
- starlette.formparsers.FormMessage is deprecated (#3724). The
  parser no longer uses it, and FormParser.messages is gone.
  Calling FormMessage(...) emits a StarletteDeprecationWarning.

Routing and URL generation:

- Path parameter values that look like a placeholder are kept as
  they are (#3725). url_path_for("route", category="{id}", id="42")
  on /{category}/{id} now returns /{id}/42 instead of /42/42.
  Substitution also got faster, from 549 ns to 520 ns with two
  parameters and from 1,078 ns to 779 ns with five.
- Route matching does less work per request (#3665, #3722). Match
  members are compared by identity, cutting up to 4.9% of the
  instructions per dispatch in the routing benchmarks.
- WSGIMiddleware strips root_path only at a path segment boundary
  (#3718). A request to /application under a root_path of /app no
  longer becomes /lication.
- FloatConvertor reports NaN and infinity correctly (#3716). NaN
  was reported as a negative float.

Middleware, responses and config:

- Handled exceptions no longer keep requests alive (#3205).
  Starlette clears the traceback after an exception handler runs,
  so an exception instance reused across requests, such as a
  module-level HTTPException, no longer pins per-request objects in
  memory.
- Middlewares accept http.response.start without headers (#3721).
  BaseHTTPMiddleware, GZipMiddleware and SessionMiddleware default
  the omitted field to an empty list instead of raising KeyError.
- FileResponse ignores Range on methods other than GET and HEAD
  (#3679). A POST endpoint that returns a file now sends the full
  file, as RFC 9110 requires.
- Config strips one pair of matching outer quotes from env file
  values (#3720). KEY='say "hi"' now reads as say "hi" instead of
  say "hi.

Extend the ptest runtime dependencies to fix test cases from
tests/middleware/test_opentelemetry.py.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-starlette_1.6.0.bb => python3-starlette_1.10.0.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_1.6.0.bb => python3-starlette_1.10.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_1.6.0.bb b/meta-python/recipes-devtools/python/python3-starlette_1.10.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-starlette_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-starlette_1.10.0.bb
index 45ba3a5311..d8d19053c6 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_1.10.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "d4e3ac5e546444960c710297a3c9fc3f7ebae1b7e963f3d36173b49da535be9b"
+SRC_URI[sha256sum] = "b8399098d4c1e3522734f7235dc79b1fc967f96cf139c81e0fa30479e0685f9b"
 
 inherit pypi python_hatchling ptest
 
@@ -30,6 +30,9 @@ RDEPENDS:${PN}-ptest += " \
         python3-unittest-automake-output \
         python3-pyyaml \
         python3-httpx2 \
+        python3-opentelemetry-api \
+        python3-opentelemetry-sdk \
+        python3-opentelemetry-semantic-conventions \
 "
 
 do_install_ptest() {
-- 
2.47.3

