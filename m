Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23233.1794814545574045602
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DgAFwaQ5;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso32711035e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814544; x=1795419344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wf2OSIgY1P9Mwb3XGkYPUEfHDnBJ4mNiavCwGbyLGN4=;
        b=DgAFwaQ56BO13+A50uqENcAp86R1AQHJeQS4yniH4fTqHIBjRtBT4uvUkE/vBJkb2g
         FkrK6IiTHzUOUZOQiYQZRRNwAHNsrlLQll6N8DF7YuIvZYoVVgZgoVa/V2d7RRJCrFXc
         ltzfcLABk4aM13ySWLIBkTftAdpYnv46k47FU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814544; x=1795419344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wf2OSIgY1P9Mwb3XGkYPUEfHDnBJ4mNiavCwGbyLGN4=;
        b=yOs+bPgKur4Zv0TiK1ZzYHzHeFyiReUj9R/3PZOoydbvtg7dHUMd7LtU0D8zTi5Swo
         BHTcOM8ph2WB3ChnwPEL/WSKqa7J75M29XOiw+v3e2W2Oa0lD6hVr2uj4fTWGYpD4hWu
         U61EmKJD21zBPsYagTjoHiwxCilRBjZ2lpbyJktYeoxWG30ttcbgYu40IXW8LbbjYD5a
         ix1GZQaGJKXkeBFtOusvKbcM4g36VKAhugsgbUrBvxuCZoquAjBkwA+e8asO7QFMU4Ve
         DNH+xVwIdKCt0r8M+9aiN6+PjVDEh/TLR5T8W7qqC7A07d/MP9CbkKVPifAagwAJQVEX
         D9zQ==
X-Gm-Message-State: APuU4Z9x3Qavo+l1WuhDD8cZDPE5DAEA9uSFDt1MS2C/onIE2oVTNP2F
	crCC4x7y1mb2hpNiF/2HzG1+Z35Hm7DLMCJwg4Mp71GmqRBA71y/XnpQ2LXOR6uVYh4PrI0sBg6
	y/TSQ
X-Gm-Gg: AYBFou0MhuKhnL3Xo8gAbppzqMrl8pd4mgSBzYorqi9c2JGFfy7a6WHA2ssqMiAPAdl
	UtHqntotCKuYSeoC955isIQ6QPexB2GHYdwcHC/yn8EwdE4xbHS6aY4UCTblT0CmGfaTTEOW0u6
	BRRvHeeCeRpz3Ey0LGSTKG7M/VNb1kh5gSqU1VJP8z8eiIfUs2p1blF6k+pDCxmXbKIowC3pA9O
	8CF9vJd544UUeCspg/Ajy0Gd20g5He+aYGOPbxmKiW14zC2A33/htvBu8zfoMYCIKdTidGqkPOq
	HhiCjLilM/wQv5b97S04mJCKGcDsyfMldib7ts5JN6e8MasCHVPClZm1OshV4UY/ELAMvjjq1mE
	y1qVGvjfcji4cETXfc6GuXZWiMFGjL+c+/YAXKvlMh8AmiPDBcbvPBt3BwK59uw2Xa9re9GmD+d
	t4ArXKvox+rufRh9qyH8GNVUrtYQ++ENoSXU3wjSKnmuAiKvg9VoHpZAy45RXY0nC9PI6ALBIHK
	w2Z6CIVtNmZGxCXQxdP5Bh0C3b9msSFAltKH3JwLQL3sjn07Y8hAoj01G6L8+ivXbIoFUHapzbz
	M1kCYyhwGGOfia4ZAWODN99h8gt93ziF+1VZk9Wfo00nescmnTUFCufUa96/z8eNzx7DHMdpgWd
	/0Qf738whuvcDdDCItNJ5peoPHqjvHvj/HX7Ps+4myl9Ar5Xq3UDOtg==
X-Received: by 2002:a05:600c:4ecd:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4bb5599d31bmr210406655e9.0.1794814543939;
        Sun, 15 Nov 2026 23:35:43 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/24] python3-pybase64: Upgrade 1.5.1 -> 1.5.2
Date: Mon, 16 Nov 2026 09:35:18 +0200
Message-ID: <20261116073532.880420-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132439
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.5.2:

- feat: publish wheels for PyPy 3.12 & GraalPy 3.13
- fix: keep deprecated altchars handling when decoding with
  padded=False
- Bump version to 1.5.2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pybase64_1.5.1.bb => python3-pybase64_1.5.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybase64_1.5.1.bb => python3-pybase64_1.5.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pybase64_1.5.1.bb b/meta-python/recipes-devtools/python/python3-pybase64_1.5.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pybase64_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pybase64_1.5.2.bb
index 19a8e094a3..6621d4711c 100644
--- a/meta-python/recipes-devtools/python/python3-pybase64_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybase64_1.5.2.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5042ea9bdb8e0560ebab12bceefcd3f7"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "aa924f7c2e90349d472d7d57c3680de8d222a32c2d3d07f922ab2f60516e478d"
+SRC_URI[sha256sum] = "e7bc140306325a61cb7bd18b78fbf800df6aecaa9928023b7f7425b680a7601e"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

