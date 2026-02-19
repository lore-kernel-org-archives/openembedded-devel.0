Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBD3E9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 10:09:04 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10630.1771495743180442482
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 02:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pQducnfd;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48375f1defeso5560665e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 02:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771495741; x=1772100541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/FjUPQZsKQMRSRyhRIOrOKDXMN79bDDmKi3r08D3q8=;
        b=pQducnfdYT9urRM1BPzy0ahkZtzVRkyWByEok8pCKtPDJTNEruEHJSn1UsumGzSwX9
         nitKr2UWRxosqdc+EISnxo4z6BQJF1vtqd4ikX7zBIPqeg2Tp6LDHOJMiRGCZoNKgctb
         WNVIJU5xfUImt0eW5o3NA0WL+gdyFC2qd4NXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771495741; x=1772100541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N/FjUPQZsKQMRSRyhRIOrOKDXMN79bDDmKi3r08D3q8=;
        b=H633pnKOuJlmD75zBx01Up7zowEwWgYH9hGeFklAAaOhvX4MqeWNpydkjC/QGGU1x5
         DbYL9nNmpCmIzhygvSd5RjNaC3KjHgZp4OdGozoKv+0mdYySQK3UkJ8KvML9q7o3LeNI
         91IysaiXQ70X3M5wyKFQYwrrOZUam+qh0EQptrzx6RhkGuivIlYOfATztEvE/EhD+a0F
         180BTAO7HdRAjAi+/aMY5uWz2uYdoawEN4YJDe3lIiKftJZS9JFqJDsS6Djy86FHqPwg
         IK5TLURPZJ3YQW2+Pwf5OdjgPLN3c6WeNMhJEr42nWju3r3wfZj1rbZtjgCxhkapABZ/
         ygWg==
X-Gm-Message-State: AOJu0Yz82Lavi7pz66cI/DlAUSDgWW3YEdjFCBTXTqxFGNDl9kIiGGkA
	ouPtulV90/JYXTw+a9pwLam24k7X7e8q0Sz5mREm3h2T1HoF5yE8JIqC20pHsdjvxRFexmYQ4mc
	GCWpl
X-Gm-Gg: AZuq6aJG+C0/58fri6toTeQxX55ptq0BG0RP6QDrYeE76fharKUxNp2ngEo0tMw6lz5
	wU4ynJP1knQz62bC5soxvodrQEKTFSM1Lkl0QkBABTRlTjsfsM72rZ2WR6uJurOQHv/XLvMWMKw
	4juN4d+PmVgp8P+8q7+rohxh1WGyXyZ1sXBS+6Hh1rP2xhBcUKt6iShHpbmPgIh9gjxZ8Ly2YKM
	Ld6fPlsRDA4NPPTjLtisIp3BY+MeBtUlOOTKtU0YcUl20ipge8nLUabUbHJbh5W1xjtWS3UD8CV
	w4Toa0ZeqteJUaltiOKSPqogQWCe72EKPqiauii0tL23FnKjqVYxdofxiia400aEDS2Yh4qmKqk
	qVaJcK1s9v/o3W3JbWK2Ds8uEUwT3pWUDqkCLibOl9BUzH8c7Y7GumEtCEymvrFwP4NNeb3exnL
	F+h2t4uJszrRkkPdeGswkqRZ1xL5eJaywtUuv2
X-Received: by 2002:a05:600c:3b01:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-48398a678e6mr79496225e9.3.1771495740991;
        Thu, 19 Feb 2026 02:09:00 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5ebd1bsm712340465e9.6.2026.02.19.02.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:09:00 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-socketio: Upgrade 5.11.2 -> 5.16.1
Date: Thu, 19 Feb 2026 12:08:56 +0200
Message-ID: <20260219100857.3498767-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219100857.3498767-1-leon.anavi@konsulko.com>
References: <20260219100857.3498767-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 10:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124502

Upgrade to release 5.16.1:

- Use configured JSON module in managers
- Admin UI fixes: remove duplicate tasks, report transport upgrades
- Switch to Furo documentation template
- Add Python free-threading to CI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-socketio_5.11.2.bb => python3-socketio_5.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.11.2.bb => python3-socketio_5.16.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.11.2.bb b/meta-python/recipes-devtools/python/python3-socketio_5.16.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-socketio_5.11.2.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.16.1.bb
index 4251a81d6c..10372e83cc 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.16.1.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8"
 
 inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE = "python-socketio"
+PYPI_PACKAGE = "python_socketio"
 
-SRC_URI[sha256sum] = "ae6a1de5c5209ca859dc574dccc8931c4be17ee003e74ce3b8d1306162bb4a37"
+SRC_URI[sha256sum] = "f863f98eacce81ceea2e742f6388e10ca3cdd0764be21d30d5196470edf5ea89"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"
-- 
2.47.3


