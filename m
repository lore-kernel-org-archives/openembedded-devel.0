Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89453E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 09:39:00 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.15647.1736329138208213186
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jan 2025 01:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=e9wXAcby;
 spf=pass (domain: konsulko.com, ip: 209.85.208.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d27243ba8bso30894204a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 01:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736329136; x=1736933936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sqgj+BXJlHKHgS2x7kCvjlUY/Cs013rQWOoI7VFboj0=;
        b=e9wXAcbyG6k7MW7KJbNrmcF8hlHg5/e99TpEUY6Kch6II9pA5YoLWJ3UUs6M86mqJw
         vw35hVjTx1iaWTj46idgLvqf8LywGOluF6Zget97fIzWvghXHRMmwiCtx0joaPMvMXmr
         Kbxvmc4FQN2vGeA+C61yVdWxhvz7zVIs3d2jQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329136; x=1736933936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sqgj+BXJlHKHgS2x7kCvjlUY/Cs013rQWOoI7VFboj0=;
        b=DiPZ0pWZEXnWWduxovCeVK6OM84R5V5+z+6fOEsrEevO+Jyx7O62WVdoVWN/xPwA1Q
         Ci6WAb+er46cJLE7d5XvwNArGuYsx9F8VhPiMxFWnURkmnBknzNFWX1fioETRHlW2E4n
         7XLfJrVLJ99zy6jyQcv06UxGAiMCPZn/GwNLcp+CX1kGEHu+OORuYrlEKbfSulVNYvzG
         Niqy1Nk1BwQu8q0wLw7Zh3OKAKrZ86I/PckTbM6CGNvvIAfxAapwKKxZnarfsqvTXcq9
         yS2jJSBhdLbNiMlxk7o+J4Pd0nuBXTvSkkGesjbJU//xSM45CTE6hJg8kMYRQT6bczmG
         BzDg==
X-Gm-Message-State: AOJu0YxCsUJYMtS/SlEb9l3+5aHB43KAQNCJQQGoM8evtqPW76rN6vZW
	xYyCzXLIqa0E1/cIoJqMnb4I1JKc04S3R85sXJhf6SdMV2PyzUY2z9BS8AAic2O6AJmdsBXN64J
	M
X-Gm-Gg: ASbGncv5VWNoJnyd2sXL9Xs2cx0K/E2R5Qiiwo1xZGwZl38I1oItls1VvN/KGROgrSW
	PvGwMLtMOX1/STsRpM7yO626WDjIMXeZMF4xO+8v6p5na2fvZCkEK8euQJyEF8Vxyrl7YrVxydZ
	U5uGEAnrzNjO9M1PPAOV9fOwvEVhi8dS3ztKsgGNRZEE6tk0tvfX5q7WQODtlAiQqYUrxZCJkzJ
	d1wzJ8htnSekK28fwUnf6pF5YRRc+edqI/bxVahJQfwg0KPnDmpXnhqtVILzHEcO+Fw9To=
X-Google-Smtp-Source: AGHT+IFTYXLbpZg/hVX3I7oCSv+pIzdfCpq89hERMkaw7Vh5/qxMUAKoulCtWW7g/RiAqjiV64lCUw==
X-Received: by 2002:a05:6402:3604:b0:5d3:cfd0:8d46 with SMTP id 4fb4d7f45d1cf-5d972e6ade1mr1811378a12.30.1736329136280;
        Wed, 08 Jan 2025 01:38:56 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f496sm25179772a12.34.2025.01.08.01.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:38:55 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-marshmallow: Upgrade 3.23.3 -> 3.24.1
Date: Wed,  8 Jan 2025 11:38:48 +0200
Message-Id: <20250108093851.1560110-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108093851.1560110-1-leon.anavi@konsulko.com>
References: <20250108093851.1560110-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 09:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114738

Upgrade to release 3.24.1:

- Typing: Fix typing for class_registry.get_class

From release 3.24.0:

- Typing: Improve typings in marshmallow.fields
- Typing: Replace type comments with inline typings
- Typing: Fix type hint for nested parameter of Nested

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-marshmallow_3.23.3.bb => python3-marshmallow_3.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.23.3.bb => python3-marshmallow_3.24.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.23.3.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.24.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.23.3.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.24.1.bb
index 3e01575df1..0d41e223dd 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.23.3.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.24.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "d586c8685ebdb80bf754e1f96e3f305aaf30951f1fc69175b977453633467e76"
+SRC_URI[sha256sum] = "efdcb656ac8788f0e3d1d938f8dc0f237bf1a99aff8f6dfbffa594981641cea0"
 
 inherit python_flit_core pypi ptest
 
-- 
2.39.5


