Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11249.1793278605074353222
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 05:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=N1VdVwNT;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1724276f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793278603; x=1793883403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zU+gqZwiSA07AchNW5vc0Le+3SKfGCLiG1yjiry6CAM=;
        b=N1VdVwNTEVIzo2JegkyBv1mJX2h+VjVCtddvl85SXboaIjhWISAQnaZYlGkPCTsfHE
         T2Mc+lDueJSXBFTrjFOxHwDwHqta+iHtWdOvleNrTD63iR2F+tonY+MGQDLi39clMaCm
         bsWA0VuBnB5LtWPGu/Wv/tPEYu/4ZQCXo8u2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278603; x=1793883403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zU+gqZwiSA07AchNW5vc0Le+3SKfGCLiG1yjiry6CAM=;
        b=k8iE0THOmfmyVq6r9iMT6E3XONdba4+HfE09vIWlOXPpZfoONfWF9N0CvxPDvEEtBB
         tAWIsGLq8jtZFVueRB7YYc+kQlvCGd6kbC2RWKhOJUXYb+o7nBJfjK4+MdhdiuVl0fQM
         j9UBO2Zk4WXlK1111YKW000jbIj7L6+qvJ7Ok8032mbx7SsyFRRNo+0+obu4LuzWUTRu
         5NTJeRjf5hssza+t8s+tVt3c7wTAutKLbbML3HHkbZnwtKDnRjr77T17jlhhJrknftzn
         x3aiEBcxED5g33kEefEuMS8kV3qgOeedOjJE8NdE448EMyU/KB+ffvC/0Qo3wV5dJjz3
         lgxA==
X-Gm-Message-State: AFq9FYKrKsNcAev+xKKwPTWXtiKDnRoFJCnzZdqNtUjPhPBfB13twVm9
	rEL3tw7tl50P7DrZjNwG1XmAHrxdMNDWotuqUM80+ApmU9GlXdOFjC+9V0DMWmDXtJd+k2/3PeY
	bRxXe
X-Gm-Gg: AYBFou2gEMPdr4Ti3mxMY+ckzsyUP5afkoEyL7wXFYjW2GerLQH4TJw/2u7TIN7IZ/J
	3jjrENBxFiy9hbHVpVGdQIXFlvuasBKp2FM3RcQgisjxSUi+SGZ/6pi/dwAUUkq2FFWnnHhoPlg
	AQwhltpVFgAGVjXayXVhTr0N3cbbVwL02nnK/XZlMVOP67Fly8cVo426dYRm4Cjmn7lNbnUQm3I
	ndjbdgdnXLpWvIEgGv/SzgQKe7JHWE+CNiuytk/MZEkOlz4vY5Wt7cGTgzsZql1Y9SZ+14pc+rP
	uioe4la9KDnpm/Twco03r/bVZ6MxPxBIp40zu5ZQFkYEhgghYv0ipxUcwb4QWnXCwxXrPA+wz5M
	0Ix5AyppIXRDYqgOhRrOfbSJrUrkm1761VnTCkpaD/ITL30cKSeVXZJkLzDiEZhWzcFCqB6CK4i
	0Zhe6yzNgCWlIn7vhMsg8aBSjR8ILX877y4v0OCk4Jzvg6GPNqqM/YkbuJguq6rrsm+siziI6Vy
	M2jLcFPfiI70GMrt5aWYAWT0DDVmJBsLJcW2SWSwjB7EaE0Mm2pA/+wfa5ORz2xSeul3UxLJ9P7
	MP1/BOIg28A6wn5kDl+xrGsWX1mLbWn2fxGzq6jty0+Df1x449bJjP+pynxVUtMWwXvfnHtOQu6
	y2Q8Pl5+WuWnD0lmwSXV4a8ceYRUaYp4vS9EtSrnf4VGbDKb1I8k41po=
X-Received: by 2002:a5d:5e01:0:b0:48d:ffcb:28e1 with SMTP id ffacd0b85a97d-48e5d2e7531mr12631442f8f.11.1793278603305;
        Thu, 29 Oct 2026 05:56:43 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm36160335f8f.28.2026.10.29.05.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:56:42 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2 4/4] python3-starlette: Upgrade 1.6.0 -> 1.10.0
Date: Thu, 29 Oct 2026 14:56:37 +0200
Message-ID: <20261029125637.811856-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029125637.811856-1-leon.anavi@konsulko.com>
References: <20261029125637.811856-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 12:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131663
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

