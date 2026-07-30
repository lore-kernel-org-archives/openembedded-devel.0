Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF4FC55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 15:15:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14031.1785424533312213106
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 08:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BQtm5aWU;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so11042415e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 08:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785424531; x=1786029331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9zwiHqscNbitTD6YacX5ljcX6xJhBcruryj7RMJg9jo=;
        b=BQtm5aWUTkPVLD+KpoUnRCmGSRc8cikvRcfDw1HV3kxPfOK1m5LG1LKMNnY/PXN8Fl
         +Dn8JruVs9AfBVjRqZTRHfZOz5X0JzyZOGaNFtNhUMz+nSeCeAZ8e9ilc0GMDiQdPHyJ
         8IkVgRSJX6yWzhmtHNI905vnTHG2xA+i+C0yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424531; x=1786029331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9zwiHqscNbitTD6YacX5ljcX6xJhBcruryj7RMJg9jo=;
        b=K2zt53CXlXkzEulpqoO7HFZ7khTgOFeU1gPtgMZjBYX1bbTQdAySnrpGHgZ7bH0EhQ
         fOQ2GYIehj4IXrck5uNbXNUIqpSihhJ7UF+UwjEYztmqSYaNRMUov3ZQs5iP37RbJCGh
         rqHnP2CPHrD/c72mhntDNrLI9FjFEpSeef+77sOPtsYe/Gvn/tp02HFd3jgWGkHt3pJx
         x6rpfrLSRMbZu/QeCH0RiDg8tyoQdmHpLuZnTgH7E+zjrEtBkZ3GdyTYUlyUU9/GzlBa
         UhzpHDVAXps0rPE1Qqh335NErY0WuL2q7Vttr+4xFeh0xF45FDFLsx3VWImBAIxQQKMT
         kXVg==
X-Gm-Message-State: AOJu0YwQgqBSfQEZJHa/wmC07b8vGpXUuOm/UBJZsJ1kXv0ZEVGZd7gV
	h8RcA8Z/3FCO2LXA2SXu2X0YtcydPyoY/hgIMdl5oVEs6p5N/vgCJA0GX3g5VEzE9xPsUlw/Pzi
	9rnNE
X-Gm-Gg: AR+sD10rNxdBA0xPrCs7dWHvyxVCdE7GluGFt6X5KhBiAiHUgY4MwUERaX1YEL4BGWZ
	Ts+VrH3HMe7Mu2niJNpQw0fYlcKJLIfTtILOymQqJVSZAbzsxX9iNvHqd9qtl+oxqS6qDyw1jr0
	BMV0/i4GO7qXcgyCQYmtLDK11gLPvaeY99CL9GAD7Wkx/hFrNOHpq5uwY/iAhrGaC9HEmcDvFDo
	7FxqBpO+ZmuqyCqUZMAQOrSejlzPw6AWnJCbY3UIOdoVVQQEt5sfm+NRsBF2l/enj1Y1jIwGyXj
	qdUXD/mwMqU9zOlWMSt0J+QcPntRDhYZWYzJsGvxbaX+sQUI+1SVKGgdRyXvoo/keNz0C1ridLF
	JTTXO3G02IUJjcd2nsQCwEZCkxjm0pHqcj3zw+JxTnLBH1eUJ6QQ6XYwZfmvWjf/kClGYoW+dC3
	fLHqyZt/YlW50DcM7tqvWOC1s7/KadiIapcspin5ghF/sqB6l0QykPx+Vn7CB+49RU68ghLTfVg
	mZegWHtnBC/aafzrvh6QQfwTTE5ad+5+n1Vtozdldcm51xICYYHouQ8WK6YzvDktZLE4WEYovCv
	X9bj0pTI55w6Zw==
X-Received: by 2002:a05:600c:8b4c:b0:497:fee3:3622 with SMTP id 5b1f17b1804b1-49800eabad7mr34447375e9.33.1785424530852;
        Thu, 30 Jul 2026 08:15:30 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f0ecd4sm64044325e9.1.2026.07.30.08.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:15:30 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pika: Upgrade 1.4.1 -> 1.4.2
Date: Thu, 30 Jul 2026 18:15:27 +0300
Message-ID: <20260730151527.3241842-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730151527.3241842-1-leon.anavi@konsulko.com>
References: <20260730151527.3241842-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 15:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128572

Upgrade to release 1.4.2:

- Stop mutating global asyncio event loop policy on import
- Importing pika.adapters can break asyncio subprocesses on Windows

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pika_1.4.1.bb => python3-pika_1.4.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pika_1.4.1.bb => python3-pika_1.4.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.4.1.bb b/meta-python/recipes-devtools/python/python3-pika_1.4.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pika_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pika_1.4.2.bb
index e0313552d0..beb32240c5 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.4.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://pika.readthedocs.io"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=678ec81495ba50edf81e84e4f1aa69f3"
 
-SRC_URI[sha256sum] = "e851f3e4992adfbf8eb64e9b86d94e3382f92ba0200055abedbb29676b8e713b"
+SRC_URI[sha256sum] = "48d1f50297e76be4fc798fd5232d4d532d7a4758e51f7c0ae6c4004b9808a26b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


