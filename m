Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54862.1795444521464931870
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 06:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2119929f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 06:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444520; x=1796049320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hT/MJ/yTCJZta9xf8AJRABEhhPnMPlMcUax8MlBxiq8=;
        b=F+ojrMb8t8F6Zp729gwDs0tQEFg/sjhtjJTjgQsuVnRqEPFEQuTF3G3cmYjx1fG6Ql
         C+Pjk8BTv/HBeBVSxj2dL5bfpUxTb73bGLXKi7zcM6IkBV8XLTfUSVRw9zTiWwle30C1
         jnnu8doHAtqcz4NQuAGp50JS/DYUKbtxhvF4mnFsFSnRWQ83ogzaGOtCsr1E2GjrsE+8
         EDpcS1GiSbI+rdBWYV1ICrXoCNjLR5XraIaWxvq15rfZIDdQOEKYKfOg/8hy3nF9f8IS
         j8zN/KNtMrFjJNiMXZGozbTTWWAe4tHrrF1D/liRJRBe6ejdv8ADi1ymIT25D1F5TQaI
         9Aag==
X-Gm-Message-State: APuU4Z96bMy0rJYru0eyVRY5DlXWTw2EPysVwEg/vrlFvcq+rLKiJesD
	F55v00p2zHqcgfP3EnvNdAaUbfWmql0+2aAX33dwwTMxv81wCrYEdRPk6NR/Hw==
X-Gm-Gg: AZFdTZfd2yiz1zQwE+vCsAno0Zv+5w1Wx8qrZuhtGRSZj2eJmVuTisj6ATDZzEFfvCj
	HJfqSlOgod4zgOXGoTnCzdD3z4lOaASkaQhRa8lM08zUcjRyHI98isE10c+z8C4eVw4Z7K6QE4a
	7YuTdPj5eS98dElNT/IEAL1iRYdwcxvM8zVYapGNgneDbfzv/hUFgLLUXMl2VROOY2eMpPs6UzV
	nyILiLEfegodjhFvTVkIndGC3fXHduFpPxcXyqUO+H1T+g28GtfCme+hDyYyH66ciidZzp1j42Z
	EEklES/yxj0HEocn70F2AydqrDlnusWX0Is1gpJ/Ce0nn/N6Gij6XelxjPYQFTZwdLmjr73skZM
	YOLc9BkAkIaWoCy0/NqNgWvB1gM5UUMO4OlzhbPfLmwhSwfUCdaxTEssDo911EI0xR06pfyO1OC
	e6bVloJn6Y8WjOwPQU/MitI9vMWXMTmknvyZQxIVChiWdxgxGYoKve3mPs72LzZOvu8oFE35tcI
	GPO6Y0rgdwRMxm9D5a9qXMHXlr1+LkPwrjzHUXUZKA2TjDwcGf3XlTtldCdQBp5K47cG9j2Jn7X
	77ypIvDXc0yY2TzJ9ya+5mDCSSkKglOJfr/4N0yI9iT4B/4B1NHCDZ7WhHApxgyw1cCFQCZrZj8
	iEBgB2yQ/Z413MNWIn2N4Pi7CpEPUPjFgemgFzTOGQ2BBR0E9M3MSxABWyP2N+kY/D8c2QfdrlZ
	zNYQs=
X-Received: by 2002:a05:6000:29d2:b0:4aa:1100:72a4 with SMTP id ffacd0b85a97d-4abb400af07mr15623979f8f.34.1795444519467;
        Mon, 23 Nov 2026 06:35:19 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm25565929f8f.24.2026.11.23.06.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:35:19 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH] python3-dateutil: add python3-zoneinfo to RDEPENDS
Date: Mon, 23 Nov 2026 15:35:06 +0100
Message-ID: <20261123143506.3985065-1-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132900
Content-Type: text/plain; charset="utf-8"

dateutil 4.0.0 imports zoneinfo in dateutil/tz/_tzpath.py, which
dateutil/tz/__init__.py imports. Without python3-zoneinfo in the image,
"import dateutil.tz" fails with "No module named 'zoneinfo'"; seen in
the ptests of python3-blinkpy (meta-homeassistant), which imports it.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---

Tested on top of master 2b551b71ca for qemux86-64: with this change the
ptests of python3-blinkpy (248 passed) and python3-gql (717 passed) from
meta-homeassistant pass; without it, blinkpy fails with "No module named
'zoneinfo'".

AI disclosure: the change and the commit message were written with
Claude Code (Claude Opus 5.5), as the AI-Generated tag says. I reviewed
the change, ran the tests above and can answer for it.

 meta-python/recipes-devtools/python/python3-dateutil_4.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-dateutil_4.0.0.bb b/meta-python/recipes-devtools/python/python3-dateutil_4.0.0.bb
index fc7297401f..47a1040bc5 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_4.0.0.bb
@@ -20,6 +20,7 @@ RDEPENDS:${PN} = "\
     python3-numbers \
     python3-stringold \
     python3-tzdata \
+    python3-zoneinfo \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.56.1

