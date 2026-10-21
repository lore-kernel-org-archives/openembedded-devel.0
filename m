Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8868.1792580501201362667
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=O5ae23GF;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so680799a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580499; x=1793185299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3e5XFwZLleDpSpTqp3zT1R1rf6huQDCQySqh6XOHEw8=;
        b=O5ae23GFFkt2ImSZFYPAIf8zpRuBhtVgJgb3SMeQfzbWCdLUoZGQ2I6XlhYHHXNqNH
         0+z4gYOnN7lcq6HXg/liDNMpc1RyNInP+5XCWHgYKBcoGYS5R0JLHbIj+MFK9C5z3ia8
         iwCPxp3U7mQUA466RfT3QSwUcURg5jVfnFFEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580499; x=1793185299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3e5XFwZLleDpSpTqp3zT1R1rf6huQDCQySqh6XOHEw8=;
        b=lwQRGlxq9MwnkMHX7nSncSbD1PP6K+fpbDiH9WenEs+rSsI6X2KOW0yTMUXQPixgT2
         Fy8Na1JhizGTCmRIcm5QCzs+8LyB2/tDKrmOMg7yX7IMRYly9NdT8JAt6c1iymSrOHeK
         +hZ/DRdLQkmvse5DOa4/ggWovnY8qAEVH1H2Qvdjs/TRGiusa88p3SWMekEN425ySrRl
         YJZjISq//mG0yuM/xdnfk8CVWYvvRSPUCcx/ioRjxYJBuHekv7zSVKkcrb3MtHBswpFA
         KmpsJLx7URpEzW83+zgUIEsXc+VVDhpguduzokMgZQfSjLOelUAkFVz+JzIuzAHGSdND
         0v6g==
X-Gm-Message-State: AFq9FYLMzHq+M4A3OJTWSt4RnCvtGIKFEbCrtMuOV4Kn5dbGoIh/rSIR
	EcwM4wpW/DFQSFbGqIQ3+wCa9eBYN44rHeGbXRoliBgYWLVQU6zdegPGSE1axPQy6VbmBwOJSiQ
	0pFVd
X-Gm-Gg: AYBFou29k96996stFQGiG89ngfiP8XAYlwZPab3nzyexEKJ/jnGxDWQiq54Pj5qL4Lc
	Gje0x5TZkoZhaNbpsPu0IlcNU36z20zRkRQTaD13xr8pn5ih6P6/bCnnkJmu/UqvkxCoMH+i2yU
	C3f0oX9Zo5ULnBkYXMYQuCqFewlvmT522DEbPv1vrBzDT7kFbrHja0VqylbjLXFIzEcPP4vPhb6
	/YujjWr6TGwL03PnDmwkbxE5C6uuSagknamG5tpLm8HNkK4McDuNa1NykTRX+dAtWPJfDMtNoqB
	E86RddsEZ8fY/t7ZU7Yvjc+W/vPp0uD1U/ptLKlu99eyRQN5b42EjHYoPwze09D5CuzRtVBJB5q
	aLtQ1h7jh9OL8wzsj78PE0DfeKryJc2emXRfMkkzcSmjmPU+SUbUg0+55pwosG0F/F2kKjMM4I7
	QB65BKE5t0nMKc4gJEmopad3nvDBfyFZQK0ObYaJwr3Oh7CBz97mPLMAAEHY/FOHLRZyBhy/TQP
	0BPxcYVflb2bH6hFoePhXGAA3Hwa4mFJBjRnzfPGzeREuoUfk0w9W8P7aKCl9KkJDj67ozM5qkq
	j/mihu0lOlWfkzL9zoxCrGUZxbF+/5IJTYbK2QRMQfupozwQiHHz8N7ddAHGpCc9yyFq1Kfj6QP
	JhXIq
X-Received: by 2002:a05:6402:2105:b0:6ac:5de8:ab5c with SMTP id 4fb4d7f45d1cf-6b408ea04f0mr1165376a12.10.1792580499229;
        Wed, 21 Oct 2026 04:01:39 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:38 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 17/36] python3-httpx2: Upgrade 2.12.0 -> 2.15.1
Date: Wed, 21 Oct 2026 14:00:41 +0300
Message-ID: <20261021110103.1943456-17-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131276
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.15.1:

Highlights:

- Flat CPU usage for long-lived clients on Linux:

On Linux, the default SSL context is now configured once instead of
on every handshake. With OpenSSL older than 3.4, each handshake
added a duplicate certificate lookup path, so CPU usage per request
grew over the lifetime of a reused client. Certificate verification
is unchanged, and Windows and macOS still use truststore.

httpx2:

Fixed:

- Configure the default SSL context once on Linux, instead of on
  every handshake. With OpenSSL older than 3.4, CPU usage grew over
  the lifetime of a reused client (#1253).

httpcore2:

Fixed:

- Configure the default SSL context once on Linux, instead of on
  every handshake. With OpenSSL older than 3.4, CPU usage grew over
  the lifetime of a reused client (#1253).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-httpx2_2.12.0.bb => python3-httpx2_2.15.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpx2_2.12.0.bb => python3-httpx2_2.15.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-httpx2_2.12.0.bb b/meta-python/recipes-devtools/python/python3-httpx2_2.15.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-httpx2_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-httpx2_2.15.1.bb
index 0d16318a47..f6427c31ac 100644
--- a/meta-python/recipes-devtools/python/python3-httpx2_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx2_2.15.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "The next generation HTTP client."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=166cfc32dc0986f87a7e950553b52e5e"
 
-SRC_URI[sha256sum] = "7631fe9887a8a2275f4a2540e053aa670fcc50742864a9ae7c66e609fdcf12cf"
+SRC_URI[sha256sum] = "ff75485308fbe441e75b1218546e4e78d884df41e1a9741c1f79335ed8fcfef7"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

