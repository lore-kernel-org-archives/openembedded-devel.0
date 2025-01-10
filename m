Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F6FE7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 17:58:31 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.25869.1736531901789805693
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 09:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=t3oMbB3C;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38a34e8410bso1286772f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 09:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736531900; x=1737136700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Zv4zZlzRChHjWj5qKRfM6tDBQnd9YoKWlJFdvOXCXk=;
        b=t3oMbB3CY4OmwjE4gpBKV5tOr/6gBGxQ6IibiBMQ875EUtkeVP2AGoFmW2dlq6QfBg
         CN45bNgiQ+F501oEwZx69ztRnQWaNO9ng70gkWVwAJDQTMCyKuB6EQB+dt4sRMTpjyIg
         e1Ak5pdltt+ECuKcm35y9JHq+r1I0ZfwEG+1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736531900; x=1737136700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Zv4zZlzRChHjWj5qKRfM6tDBQnd9YoKWlJFdvOXCXk=;
        b=jrkkop4P2DBMTv9g1U9aPdmVpnnLL6+iM1WugdJAvB7GedB0QfJfbhMhsXooJwbVcQ
         nX3G/om/HZaPsPEPgTVhHA8F5y979xQQu8ew34qsGGDsTxSJMHZPjZ2Lo6rQIFz3/i/O
         tb/NWm1ZfgrRBXt+n11ZFGIEqPsH5tmpVyTQQ2Mj2mVea7R4kKe+N5u6dikl0A0GKLKw
         xrfZCgQEwSe6c5F5ifiyFHK3v+ennCL3Uzuq+NVn7p8lUdJEHiKs/FuYjsgRqAf/kM60
         0UsrLnS/XaF6RrK+/9ZZt4xVKKoK29WBVVcnixNOkwuOy6ACuLL/g5xQjw+GW+kwGklC
         5zaA==
X-Gm-Message-State: AOJu0Yx6MsD/niWBh2PP7xx2kzi3E2uQgHJL4HzEtB53JO3BFiIjsUhG
	aU2plnWvSgyx8WxohyyL9vM4feDguJK/cWzCEolAe5wfz6iE7YIl1y/WjIewZjLXDr4MZiwwi3f
	v
X-Gm-Gg: ASbGncvODSQzF0eQBmkz5vsiI2WYpiw2Y6deC4WsWnnXD2FpfCH4WPdLVsMN5G/T1EZ
	r5jstR9ozX4XQX/KqZWF9xgti34V7NHtNNYFAajknstn36kdjD7R3heCChRCd7LbwFDHdC1C3DT
	LFNB9DH+f96bQtTFf9G5KufGoZjKQk7kv5cM0K/8FE8OJ/PYOZMf4g7FLYSgHtPPp3BQLgly1Yu
	KbQdmp1M7fySJ8/zND7GvSoVuJzgJPnFllEZxyTQ3iz0yZUTu5Vfy9CHQWmxCaOFFL57X4=
X-Google-Smtp-Source: AGHT+IHRpDj8C9ZjZtrr1ZarN4Brq4RED151DPgqRC7cs/93Lv/hPYzZ1NJBwaujRCFtOopUnrmVvw==
X-Received: by 2002:a05:6000:2c5:b0:386:930:fad4 with SMTP id ffacd0b85a97d-38a872dec5fmr8647507f8f.19.1736531899940;
        Fri, 10 Jan 2025 09:58:19 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e8bea5sm93116095e9.31.2025.01.10.09.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 09:58:19 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-cachecontrol: Upgrade 0.14.1 -> 0.14.2
Date: Fri, 10 Jan 2025 19:58:14 +0200
Message-Id: <20250110175814.3601819-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110175814.3601819-1-leon.anavi@konsulko.com>
References: <20250110175814.3601819-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 17:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114787

Upgrade to release 0.14.2:

- Eliminate a race condition when overwriting cache entries.
- Fix a requests object leak when doing caching on a streamed
  response.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-cachecontrol_0.14.1.bb => python3-cachecontrol_0.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.14.1.bb => python3-cachecontrol_0.14.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.1.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cachecontrol_0.14.1.bb
rename to meta-python/recipes-devtools/python/python3-cachecontrol_0.14.2.bb
index c06c090e79..2687eed75e 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.14.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/CacheControl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=12;endline=12;md5=e2fd6ddcf506e08972d5ba4b93c0022e"
 
-SRC_URI[sha256sum] = "06ef916a1e4eb7dba9948cdfc9c76e749db2e02104a9a1277e8b642591a0f717"
+SRC_URI[sha256sum] = "7d47d19f866409b98ff6025b6a0fca8e4c791fb31abbd95f622093894ce903a2"
 
 inherit pypi python_poetry_core
 
-- 
2.39.5


