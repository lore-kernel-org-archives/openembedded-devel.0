Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23241.1794814555849131861
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RyTVA+h/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so24618455e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814554; x=1795419354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdujiq0lLhTQm2yf+pZCPpETNgHaodFCnRG/A8kD5E8=;
        b=RyTVA+h/SDECe38/LwPhUlBwR9ctRkUymljVkqX4suCz3WmQTQFLjPx8fYcdlC0c1z
         yK/KfG5E2RAiDhM3ReAiHIBBxlQZv65xuXeKcBHHNpFaSYBqdJN6QuFmhF4PRuUhXEJ1
         Gmeh/7eHnj/XznPgBIQyJy4vhmmxoBqdydUTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814554; x=1795419354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdujiq0lLhTQm2yf+pZCPpETNgHaodFCnRG/A8kD5E8=;
        b=FhJ2Xn6jZztf8wLXXAGQAA3kw86fM0f5vwDy3d+qfOmvVZKh5k5nDkvlZBbKLMCqwM
         eKbRJ2D2L1kYnXLSZObAZVNKPc3KsIyDVuibQVz52UuwGrS8KiQiCiSeDlo0TKitfu8x
         UD6Hr5gUmdlK33Ec8TVnQrcBBjg64bzSMcRQXLSFXhacGsooms12exArHZd1f39eKxhu
         qVUx6tovRBgySfgFwW0x1GPlN3JqzGfwuZVO9JSz9nfS4fG9YVH+fbsxVhSexSL2n1lM
         Nf4ymOYe+jR+Wi5jHXtMVg2lahQ3WOanmV9XFUry+2co+gPNZxSw/EPnzxsUpGv9dwsK
         EuNg==
X-Gm-Message-State: APuU4Z+X/0DajLHmzESBZ1QmYw+FA1Mw+kFHNj0eUZ3T/jl44SLA25sv
	JHUEQ5rClBCI4ZbdrTZGepoTQElO+kz2MlmrViFouVjBqf0uFqSPhsRAnQP07mG4hUlmFhrK5sR
	Wl85e
X-Gm-Gg: AYBFou0hHgZr6jlcrfnXscRxBZO/9V79dadgNMMf9tehCYhPaoIryHRWRTJfaAtfW8o
	mvRlpKpFA94frU03YIn2Bn7NieBG3btz1YE7Z7Z+Q89NpOBNnFlYmoESjDIQM6CTyfKzWl66/rU
	YdNCsPaM+6DAkKikPnq/Ptde9kKi1vkOTrV1SkKhwsjdKTUrSvvl7rIExddZHdvgv9+MyQzU38Q
	Sg9voJzOWgRGvegHXWAKl5ZSzCDobcW9GdarEuEcSQNNq3ESBn9VL9dEn5BzVNL3cb4mO0yf+vr
	ydzVUkgbUL6Hgwg0ox5l6Kc4eBaQDaMRBTeAmyD8wG8Vhw5KV2c9UXhw8LvLv4NrXGHlU6PIng7
	cxqjmre9fqy4UzFzT3tW4B1FF9izxWvXdDBhJwc2Y7j3A9ra/QUlOXSomMNRa6StyCW4PLM3cVn
	eEEo/HaHn4B0XoHKan/ydVPrKxvB4rcYD3U4cqIPPuYclBSpK6bVmVBhJlfz8tgpXezubTrMQkT
	5o7JtYPWHmchcT/2a+dbcQTlIqHVuI9HlKtESfAlyXnQUaA6VWuCARJucf4YouBpLb2iVFnmonE
	IycKkxt03nwJxnykntiEjQdEIB3vcDzdsVe0Vh0hRbyAADA3dj54N9v3R88dDe1DDk4fu+qQHzP
	U81K2w/ya+XNTwqvQ5PIR0XXJnfDdTvaI98On4dQ/YxkjMPqkLBTIdQ==
X-Received: by 2002:a05:600c:8708:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb55a7ece6mr212588285e9.12.1794814554161;
        Sun, 15 Nov 2026 23:35:54 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:53 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 23/24] python3-pytest-httpserver: Upgrade 1.2.0 -> 1.2.1
Date: Mon, 16 Nov 2026 09:35:30 +0200
Message-ID: <20261116073532.880420-23-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132451
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.2.1:

What's Changed:

- Check server errors when a request context exits
- Add opt-in case-insensitive header value matcher
- docs: add release note for case-insensitive header value matcher
- Match parsed form fields in request expectations
- remove support for werkzeug < 2.3.0
- docs: explain percent encoding in query matchers
- Add support for Python 3.15, drop support for Python 3.9 and
  3.10.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...t-httpserver_1.2.0.bb => python3-pytest-httpserver_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-httpserver_1.2.0.bb => python3-pytest-httpserver_1.2.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.2.0.bb b/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.2.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-httpserver_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-httpserver_1.2.1.bb
index d98525fff7..5903bcec31 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.2.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/csernazs/pytest-httpserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7f54416ccc5478427995b27e5ef38e92"
 
-SRC_URI[sha256sum] = "d07744ce2efaafa0575ed3081d416b999c773b09e84aa95065138bedc3e12352"
+SRC_URI[sha256sum] = "fbad14449e1acfacf24a4d6e2de3211a8654597f03e296af4a833b51836467bc"
 
 inherit pypi python_poetry_core ptest-python-pytest
 
-- 
2.47.3

