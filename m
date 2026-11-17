Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13217.1794901983841341405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 23:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=S0LppjYC;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so27542145e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 23:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794901982; x=1795506782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SqVyFGgj2ebbYfHuCHeF7ZlXySNvD4fdQtfA7hzZtxA=;
        b=S0LppjYCHM88rvLlNq0TsgBI8NPaF2KPZobX1Kg63FwfdxBf5uLZy2yT2AFFq41VM/
         A7QfQ0zRbad7kAd0SnwfTwyPg+FOaFOhOEyHoFjwCp5DddG/LS6oTo9VMvd4Y6AfPtwQ
         OxJ5LJUTi7yITj9nWNa0WA2dX8E+SjI2tf2oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901982; x=1795506782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqVyFGgj2ebbYfHuCHeF7ZlXySNvD4fdQtfA7hzZtxA=;
        b=xVbUpDyd64YdFYkkD6pmE4JVLtd94tYPH/ktDtsTR/GJDpC8FhUQPqIADSdUUPVJr9
         GRwgYr6XCFNb/4QjHk9Dhvh9E/rR4olGV+yt01LfV1EG7zcnKKn6wVfZOiJLdAeZHIBI
         8iFqVKR6BPOyNrT1M5RU+2Krbf8X0/teJnNS4JPbPhhIO4Cn8uToRYQqBAW65dEJrrcI
         X2rZsfo9zI0fqbSrFz95FufdxIUxo2BxaEngnIeEbLfWP6P/5xzlS7KV6jA6yHkjp0Ii
         zaLyfyGhao+W9nHWA1SU9PEc5+3ExN7aBphDpzV1XjYj9/Vxwr2h7dFrSYr66NwB8Jr7
         PNCA==
X-Gm-Message-State: APuU4Z9xIry98KpB9c9VzqYbtfneKLut0K7klCZ561mr81Z9zmgv/t1A
	7ll9EdevFdaBgGloNPOdQ6KHuedS0igPva333sVeCOycq69ZtCBP4vnnkyiNDj2/HbSr6MJOLVv
	mjxBC
X-Gm-Gg: AYBFou1JDeEHVSALImfhq4c8U6hxRDaryEGIykb326RBJGY5h+h4KFWAnnTYBeD71qA
	zY/1dRo2C2D4V/KAfYspp/UQ7cq2xYIfl5dFKGobZ5KTRHMYc9U0hK2ZKruhoZSHaiG3IFKlt/z
	RqDfk3Y7nrM9ucai/22qeOd/QGuYMBCwEyoC3XK3rHsMHWr8txBlonCrapU7BoGbBDAg8Ko9b2v
	5EkbCQ/rC8Q0SHd7V4sPJL4p2IKbFIl5As43W1u0ZJDqO+7v2awG9/1VqdBJQs/oTdjLAy2h0oq
	EbRFrt2rRxl3poszgRkeLy4Edg1ZlTLIxtFjMAfZTW/OaeNMNSVoMEnTXYjd1i6IcokdbivmoJ0
	drjm09rRifUNjjw9yKiZ4G0ik8jikIMZ0CkvycT2Yh/mMD/914lzZtD7okSqyb7++QSw3y9p7fv
	XRnY7hjE4lzQP06D0SRU7Fq1ECbEouqpUsh5rYvxXByrKUB7MvBuHhZZD0g0i2QC+xpNKXQmkVR
	5qAix8nBvfOJoQgP24eWiCd1Shzb6EqnuHp/QUkyLLugWKGKvBhNHjbKxiNSnxve62wI9SEjqcD
	i+RyywpbYHk35R/KB3YwQWEcavpCh/jN3egVcPs5B28/u2Q0KDCi/im9LPoqeZF8Yh9/3+OgMyX
	itNyh3Pu3oMdHoDEbsLD34YFqn4nPUadLrMFdqK5kTpUyy48DiSQw0g==
X-Received: by 2002:a05:600c:698d:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb55a3e341mr262876455e9.5.1794901981857;
        Mon, 16 Nov 2026 23:53:01 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783c2650sm54072995e9.14.2026.11.16.23.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:53:01 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-httpcore2: Upgrade 2.16.0 -> 2.16.2
Date: Tue, 17 Nov 2026 09:52:55 +0200
Message-ID: <20261117075259.3922364-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 07:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132571
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.16.2:

Type aliases evaluate at runtime again:

httpx2 and httpcore2 2.16.2 are a patch release with one fix. You will
notice it if your code, or a library you depend on, uses the aliases in
httpx2._types inside a runtime typing construct. On 2.16.1, import
mistralai.client failed on Python 3.11 to 3.13.

- Optional[QueryParamTypes] and QueryParamTypes | None work again.
  In 2.16.1 URLTypes, QueryParamTypes, HeaderTypes,
  CookieTypes, TimeoutTypes, ProxyTypes and AuthTypes were strings.
  Optional[...] raised SyntaxError for QueryParamTypes and
  HeaderTypes, and | None raised TypeError for all seven. They are
  Union[...] objects again, as in 2.16.0.

httpcore2 has no changes. It is bumped to stay in lockstep with httpx2.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-httpcore2_2.16.0.bb => python3-httpcore2_2.16.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpcore2_2.16.0.bb => python3-httpcore2_2.16.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-httpcore2_2.16.0.bb b/meta-python/recipes-devtools/python/python3-httpcore2_2.16.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-httpcore2_2.16.0.bb
rename to meta-python/recipes-devtools/python/python3-httpcore2_2.16.2.bb
index 03718729c1..b2a72c3949 100644
--- a/meta-python/recipes-devtools/python/python3-httpcore2_2.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httpcore2_2.16.2.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/pydantic/httpx2"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=77c5a523c15d4a5887b081bba41ca110"
 
-SRC_URI[sha256sum] = "c72cd0413563b17e1cd8354677dff887466f8ec2551679759e93126534428643"
+SRC_URI[sha256sum] = "6c519d0f7b44f7269fa9bbb4d2763db395a4a2370f046d8e8e0a4b38227815d2"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

