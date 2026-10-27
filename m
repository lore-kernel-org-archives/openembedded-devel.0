Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14858.1793092884888062933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=itRxSd6R;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so24396545e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092883; x=1793697683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nh8wVbmwJkojF2dw2H5jROsBdNwlBxp0/zZU40/yM6c=;
        b=itRxSd6RcUOPwT57J4DxNNLZ3ohicuvWCweBB3rX3lvonTjaCRzT85mCMwQH4Zqkyt
         fR6THxDhi9LGsfR5oknCOvXbK/KJmAoG6NpPy/WJMsruBVr4Sz08mMDWTZCb3VA73CA0
         abRohDUprrecwyncwl/DDU+17voOthTxq4ERE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092883; x=1793697683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nh8wVbmwJkojF2dw2H5jROsBdNwlBxp0/zZU40/yM6c=;
        b=X3/3M8M0yyTb35MxuPluJTuMd0DRwEXk8cK7hXL8tgs1YNtpA/oPRFpptBDkIHqFPj
         6AE6tIbYau/CeI+tjRREmkTZHq8OE4dS/CqThvYLLHHM+IaPzwa0h9piVbBM54T3NefB
         9NtDAIgswdefwlF0EgS3UptPHy4ZzAf3iQ09aWelOfo76DLOyarphQeLdbYSmb/CoOPt
         ld+S/s26E4ORKjP1N6ZEmgyINnTZp63HqQktb6kX50+rYIWNI5C03lPSNzOTjdUpUtuS
         9JgZaMHuXxra10RRSac1EwRvYtBEMd/qPziGVice96XgPYT2P1nsdyy8ny1l9EM0uMtz
         /LtA==
X-Gm-Message-State: AFq9FYL8irneXj/3L70ucr3TyFgQfGoFU0cWUGxn2SbpG4YveCGhqHTt
	tfY3uB+6og8p0LbFFjEulF3E6rTWMwzy6wbm1qETUOMCWriw6NGZCFZkvj+guGSyfbdOkk85dFa
	4hHKV
X-Gm-Gg: AYBFou0JhMEj/mc5FS2X+m8KAcH1Br3pCW+5mIeKLl0ONKWNpX65+vJo2308u8ABjzj
	b8OXm9r7GZi9p6kZV7VePRMz0Hz1Etnwq/nWzzcGl2zqS1dhHSdsy4nfclSh1ghUTZ5bSrprn5B
	d2Q7L7WYo0er8AixARuf2LhOciqYerNKdQ/SKpEH6a5+86xRdkfYDAMfBYx827mjjuP7N791P7/
	aUuJj/yldhJOoP9M3OvCQWSP8MdCG6R25nIloFHFRcU79PGf1f/b0uJPA0mKhPSR7NjL8ViIOeV
	Xx9Tq62N+Ztpsr4SXOQICbadRQA5+NKgWFc0PS267QqrCMfs92/0z7z/Wq+W9EzWgkZj1NPkBrA
	+frbI4Ngs2UEHHNwJbtQwHsU1DTn/tqTSfNbnSC7DqzWWUM/LdpWNPMvGMBvLn2UEYi2z+TM4hr
	Rmcltes7woumMSd5tsnhBiTFUCpON0ZUln7Yz50W/hCcYFCrRZTnuft2GkBEFK6fIV+mGlEgIT8
	PCCjyUHFO9k5USvhjfSS2s5Cq74+WUSrlFsWjo91/idFokMSoTqOI8BkokeYjIfck2NLCCE6M9e
	y7WXdlEIdo0xzh+1GGYvnTacdhXUZyQKp1fH8pC5aXF9bSNvpJyBBRLy/sr3ukUED3zrxUEkItc
	DgbqK
X-Received: by 2002:a05:600c:4f89:b0:4a1:f688:a5d5 with SMTP id 5b1f17b1804b1-4a35acb1cacmr185378375e9.23.1793092883079;
        Tue, 27 Oct 2026 02:21:23 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:22 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 43/61] python3-starlette: Upgrade 1.6.0 -> 1.10.0
Date: Tue, 27 Oct 2026 11:20:10 +0200
Message-ID: <20261027092028.782979-43-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131507
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

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-starlette_1.6.0.bb => python3-starlette_1.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_1.6.0.bb => python3-starlette_1.10.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_1.6.0.bb b/meta-python/recipes-devtools/python/python3-starlette_1.10.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-starlette_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-starlette_1.10.0.bb
index 45ba3a5311..dcd103bd87 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_1.10.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "d4e3ac5e546444960c710297a3c9fc3f7ebae1b7e963f3d36173b49da535be9b"
+SRC_URI[sha256sum] = "b8399098d4c1e3522734f7235dc79b1fc967f96cf139c81e0fa30479e0685f9b"
 
 inherit pypi python_hatchling ptest
 
-- 
2.47.3

