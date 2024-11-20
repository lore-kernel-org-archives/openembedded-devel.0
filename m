Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 729EDD6E2D2
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 08:22:32 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.9026.1732090938019022702
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 00:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P/XkUffy;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cfa9979cd1so1128524a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 00:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732090936; x=1732695736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUWx3EdiWgyBLZ4M6VK6pi7S3SvHgVss07h3BTmXFg0=;
        b=P/XkUffylAMa9d/5vE73r9h7e+IANxfRFcjLrK+ISF6hyF6ZUi7dMOnYinNYoYDkPy
         F1NSz0PcN2Naz6yEAva1xIb8/ZlMOHjgoffBrT8NDsfby5mMqML3wkaxskb1wuFXdHlV
         jsmHNUlO7DGmZvZFv9wbF/L4rHTsv1ox7Hh9pUNL81W7Rgfviz4s4+zz56MymWtfc+XB
         IgSGK46iBFcZmQl9qUUyHLQIji89n6SLrrkbGwiyPfvJiI53gZ9aLXDR/Mc9LysL8zWE
         NDYt7Pun1gMEiY5v94aEMCeMO1oofOp2WNvmdcVDh3eEvZsT87tl8aU1+Tk2FSyQA9YG
         LWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732090936; x=1732695736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qUWx3EdiWgyBLZ4M6VK6pi7S3SvHgVss07h3BTmXFg0=;
        b=akpL+LKwoFsg/nijn0CEHknn8gJ2b8InTRioaQv6i5c2p/UwsGGroDzz/182OGF8sp
         W3R6KkNqrTE1g0gChGjcBDt5fwIPLpjv37cbM3YRNhBUKNPuzBf80kggPmo2qK/VMeGB
         EO+M4Q3tftb9/0ylRZojcfH6K8cawwIlyD4paLOmGvD72tVoR4yI2Dh4grHRz+3okweK
         TLB9srV7ZbCZ5aWQaxdgHt86zJZEUXN9lwVfQqcxS/N3GoC1kPrHFFIMG5hYpbu4NOtt
         RzD0hKGtevuMx10EAHfa0ITGHMawTOVr7bNoW85aREuQJBBC7aPLmbrzF2H+FvmmGsRW
         ipbA==
X-Gm-Message-State: AOJu0YzX/sGLX9SknOnFtzZ2lb+cQCS8M7yWD2N5m2xlonsI5OmNS57p
	PEnhH00KXD7ps13aB/R0/TIcy8Vh6maNJmwBmIo77WDhuy8PcvdMXiqo/A==
X-Google-Smtp-Source: AGHT+IHtIajmzKkmWT89iUdK98XMGQaZRpiN1MQ7k0TC3HBdWhFeT7nBZcStI8g+zHIv6x+Cf0jjqQ==
X-Received: by 2002:a05:6402:909:b0:5cf:bd79:4cee with SMTP id 4fb4d7f45d1cf-5cff39ebe82mr1678626a12.7.1732090936078;
        Wed, 20 Nov 2024 00:22:16 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cff454fc39sm547110a12.88.2024.11.20.00.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 00:22:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][styhead][PATCH 2/2] python3-alembic: upgrade 1.13.2 -> 1.13.3
Date: Wed, 20 Nov 2024 09:22:08 +0100
Message-ID: <20241120082208.1619368-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120082208.1619368-1-martin.jansa@gmail.com>
References: <20241120082208.1619368-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 08:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113924

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Render if_exists and if_not_exists parameters in CreateTableOp, CreateIndexOp,
  DropTableOp and DropIndexOp in an autogenerate context.
- Enhance version_locations parsing to handle paths containing newlines.
- Added support for Operations.create_table.if_not_exists and
  Operations.drop_table.if_exists, adding similar functionality to render
  IF [NOT] EXISTS for table operations in a similar way as with indexes.
- The pin for setuptools<69.3 in pyproject.toml has been removed.

MJ:
https://git.openembedded.org/meta-openembedded/commit/?h=styhead&id=4441545a5dc75120bb4e839d71c6f8fc500e917f
was backported into styhead causing:

| ERROR Missing dependencies:
|       setuptools<69.3,>=61.0
| WARNING: exit code 1 from a shell command.

this upgrade resolves this issue (see last item in changelog)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../{python3-alembic_1.13.2.bb => python3-alembic_1.13.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.13.2.bb => python3-alembic_1.13.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
index 5a276539d6..f046c3ebcd 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=00f8f5c8aab58c3e1cd61525a6675174"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1ff0ae32975f4fd96028c39ed9bb3c867fe3af956bd7bb37343b54c9fe7445ef"
+SRC_URI[sha256sum] = "203503117415561e203aa14541740643a611f641517f0209fcae63e9fa09f1a2"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.47.0


