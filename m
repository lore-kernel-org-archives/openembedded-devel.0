Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2901.1794165958160411489
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so1682805e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165956; x=1794770756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SqIynJ9QfUr+xs2N0b6cLi4Ut5hE5veD6EV0O2oN4Xg=;
        b=HNZSqafqtihfBZSkc2eEbR7yr16SIonJhiYm7bp2m5jRzhGCyNeC6B611nwxBqe1r6
         oRcDYIyUarJ3InrNvFA7D9RfBs/mk0j2MgzV6lik9GlgMbVX1Mpw7qpaYLifb2GhXlKF
         2IhAFnk40VOIKeD1f6mFJAO2ODYBr5GVKDr9taYdqV/nb+XChJasslsVHBUGKjMndG4N
         0eXJQ5x1FBdmUwoVqPSZuL9P8x+Ukgi0fBqHA4o+k26cj9kYyV3q2P0VxjibA2+UFSAd
         Juh7VJuPL4+XJu92LfgOxfFquaCPFrln3Ig5XpTb2RV15wpmtteXBcjZN7IQfFTbInhH
         Fq/Q==
X-Gm-Message-State: APuU4Z+X4UYlEb6qEgHiFy2AotX0Oz9CtgrdBIy9ezrhjB9qo0TEDA01
	Nhe78sn5mVxQiI34jgfo/bHTJDus72o77bwZD12y6ro3KH4eFWcHg+ZcIobEtg==
X-Gm-Gg: AYBFou269aP3lao5zoveMTwxRqJLwMwdgfq6Jm6x0VnQxJqwFKJCkyNrCP0LUnTSPps
	5Z5yoa+7nIMmJMw9x8Y6m9HkjA2rsHRrtX8ihXSRHilYU0od3GDWUu5ORnNXN4ZGcz8xZXXuu5X
	KUoOQNrvOtr/NUc+VDPGGi2gk3s5yRsb2Fvs6TQtxJm3zLMdxnjx16SiOXgHc63VZkdikoCXazE
	GXzDjzYOgK7kP8gYm+tSi61GatQQADxl6WaskgWnw42miszEKu8FPYCGxZ6jp1LisWAmvCt7tRR
	b8+bnHf4Gm5deYxhOo2nAufcnJxOYkSkPSMnwnW99iBT+g60a3+sKAERByvnMwYcsg7zfXuG8mf
	ekaYpOpSZ0XM7kpxkXzhyQu414jBBMQA4quaLq7z9qxByHRToBbJgsMwnnXYHVClIkYms/7N8kc
	2qOM7YsVaODVFRPpBKftss9NAXBUGfKJvjzYoT4mc5+ZKIzmAGirvMc5fxMkcpWmK3XUiYQOpQk
	Vz/77YARBu3hifbYKLUKm2mgMquNKcxMAXzi13epmJUqg3QmmTT8QXSalWZiY0o/K3AuzdWtRZf
	SR0hplDEOKaGP6KK3t64STJlaB2y9np1DXV44OsK+dx9uLHIzD0nT+hCBee8sb9aw844QnXIMuX
	uhlPejSjuiJD6Tsh7P7v1abnuEaXRv16tDtuz6qfZw0NDBB2sGvQjAbrVhsVlbPhxEhE/98rTI1
	GI/Vo=
X-Received: by 2002:a05:600d:82ea:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4b943f76d81mr49378395e9.0.1794165956440;
        Sun, 08 Nov 2026 11:25:56 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1a517sm160930535e9.12.2026.11.08.11.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:25:56 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 6/6] python3-httpx2: add missing runtime dependencies
Date: Sun,  8 Nov 2026 20:25:49 +0100
Message-ID: <20261108192549.1082715-7-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192549.1082715-1-thomas@roosesweb.de>
References: <20261108192549.1082715-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132021
Content-Type: text/plain; charset="utf-8"

httpx2 requires httpcore2, anyio and truststore, so "import httpx2"
fails with "No module named 'httpcore2'". Home Assistant 2026.11 imports
httpx2 at startup and does not start without them.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 meta-python/recipes-devtools/python/python3-httpx2_2.16.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-httpx2_2.16.0.bb b/meta-python/recipes-devtools/python/python3-httpx2_2.16.0.bb
index fe4919bff2..5478522592 100644
--- a/meta-python/recipes-devtools/python/python3-httpx2_2.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx2_2.16.0.bb
@@ -15,8 +15,11 @@ DEPENDS += " \
 "
 
 RDEPENDS:${PN} += " \
+    python3-anyio \
     python3-core \
-    python3-logging \
     python3-h2 \
+    python3-httpcore2 \
     python3-idna \
+    python3-logging \
+    python3-truststore \
 "
-- 
2.56.0

