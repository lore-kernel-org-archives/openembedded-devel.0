Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0459C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:01 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.9123.1685521559289439414
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=OogH3RQG;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30c2b83b2f0so89641f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521558; x=1688113558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpzwyP8n1vQ3d4m6pAiLf7MjUz2qWSch5L6zti3t4hI=;
        b=OogH3RQGXlHD/81BbLNyJEoQqTVg1nqAeD0gnzRR/Fao0NHBWjE9u/1dAyC7lXTSoP
         +Q2eoLf0JeiH/AfhUFK5baMnA+EmPau15vsMYe/2snmUZvWsmiHHaiO968GQjeb/Xj40
         sMu9P3o01EdvphBCVv5yVwBOGLexNAXFP1pM3Jt3M7dl8ALPkO9iXaY3zVgZK5BiMnQ5
         kVcp9WHnX2CCiYrPAj5bQEUDe6qBAqcBllpjCany9nRDZTTxnS0RNZ3xzc3bsOjbI89q
         mON1w4Sh/Rf0EPGwrHmxlBFlHGBvFBSzOch6n/2slOHfQ0RLJkGv5KNC5X9wHcP3hG4+
         wGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521558; x=1688113558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpzwyP8n1vQ3d4m6pAiLf7MjUz2qWSch5L6zti3t4hI=;
        b=lA8rtjy1pe7ylTXVL2WVwbhLiEwbWKdMmLYdG+D2314i2jKakQ8/PsJLuzenYSpIMK
         3AIMaMHWbBGShpQghVPwYHIex/KFzB9HWj1azMtlZOYFejkgwI1BeEI7lfXL/+Z9LOVE
         qD0fsciiLLdAXF7SIbv+XvwLYp5kdTXQu9iOAdTdfZ9Ruh8eDy56ZSNigFmrcsLXn4OV
         Xo3NUHzAD1vEUPq2ovc+cfndPmx/+gTfXw67wtj9RLupWk/8mh4NwDiQEgMhJksa509n
         VDgTZKVK5yejfAZdyarvtgIwvDRXYy9T+BUUsl618OEROgUDQ0Wk9/GqrMEk5QbJMVjl
         sWtA==
X-Gm-Message-State: AC+VfDyN33lgIKUa9F1DxN4vAROiG4a5vvMebZ+FoyLENQS9ADRs8lRD
	kyKy3+S631PsbkcQ9YIYQC4c1CFZ23cQ+82n34A=
X-Google-Smtp-Source: ACHHUZ5PRrXFJ6MhovLHYMckQL0/Ozvu2S7KdJv51/THvUOYTCNuXpD+WsRvNK2VCGo3tPATh3il8Q==
X-Received: by 2002:a5d:58cf:0:b0:306:cfba:3c32 with SMTP id o15-20020a5d58cf000000b00306cfba3c32mr3033697wrf.48.1685521557899;
        Wed, 31 May 2023 01:25:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 047/149] python3-websockets: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:55 +0200
Message-Id: <20230531082437.10646-48-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102974

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb b/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb
index b22d993cb..e6971c829 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_11.0.3.bb
@@ -12,4 +12,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} = " \
     python3-asyncio \
+    python3-profile \
 "
-- 
2.39.2


