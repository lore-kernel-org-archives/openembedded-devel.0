Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C070C7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.9062.1685521539879067627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=NXbCISTt;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f6e72a1464so40237745e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521538; x=1688113538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVNB6WrLgvLWFOKg80lXB1CZ0Oh5/sn/0XwQSSJke0c=;
        b=NXbCISTtSZGiyUop4eGbZVZSqhX3Yw5ReMO8QytzM6MD9O9njnkitDa2r/yDbXVgkx
         5kUNhT2XXf+1TYxSDxEMcpUaYLvpIv15Z18zRHY798hHLlJoLAq2D18xy0JMXvxKS4xI
         34BQGB3qEA9CtOlN5MMd1ZKuyb6D9ZEeSOG6n5LtvxH13aPoLxvEcXyjfFmTiDuxNm2O
         SkKEuHQGOrRQ7d3te8m9XW+qPfQJj+x/ZPk1ZJXh8fOpxhPVrOe+wGQEmWOLy97oiBAP
         4HFp/rv/mNEMAk7fwiIS0WPbqtdew9GenTM59WILKxNi+LWeixhLUfQ91YjfhmJoPc2q
         PfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521538; x=1688113538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVNB6WrLgvLWFOKg80lXB1CZ0Oh5/sn/0XwQSSJke0c=;
        b=XUnoZl7j+ZtmVV9PZfPjD3zX9LXbuuS6XE4+hBZKMJUVAuN1vzfCugKdd/xaQox7FC
         mo5CkqnCw5HGmdEMOg6BWSjSAkn+7jcbkhK8ixfs8RxWHjFd3u2CCqh4YMB8FsSZ6c4L
         YDTnnRMRmcesH3yiwFStB0qou6Vr/iX/On99J9JuaFA3oqk9tJOrc+cJ8TE+Jw754+1V
         GryFHFJDnRTvYBNlwd4Zlo5bzABF/oNUVtYKNMcwlqwqo8MLmMuC5PIJFWVSQRw05rlF
         QAYdSg0wt2EezEiP4vR8PbhLyq3iQXrk9N4ExiDL2U8ZF/2iI4p3A91gsAd6mHnET5fT
         35Dw==
X-Gm-Message-State: AC+VfDwWzVwau7TcYtE1BtzTaWracWShYcJ678DoDpFQ1du38iNgVb3d
	y4aH2jigPy8RCsE4bmJPNE323g==
X-Google-Smtp-Source: ACHHUZ68XCN8FqjxjqEvfgwSjH59ad4lt7ZvKUToiPrE+SX4vInNGZuVFJIvEmxXwVu5swp1yGtZjA==
X-Received: by 2002:adf:e84d:0:b0:2f2:9198:f0f with SMTP id d13-20020adfe84d000000b002f291980f0fmr3409967wrn.10.1685521538429;
        Wed, 31 May 2023 01:25:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 030/149] python3-pure-eval: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:38 +0200
Message-Id: <20230531082437.10646-31-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102957

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-pure-eval_0.2.2.bb       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.2.bb b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.2.bb
index d2aaa3db4..66e4673a7 100644
--- a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.2.bb
@@ -9,3 +9,8 @@ PYPI_PACKAGE = "pure_eval"
 inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "2b45320af6dfaa1750f543d714b6d1c520a1688dec6fd24d339063ce0aaa9ac3"
+
+RDEPENDS:${PN} += " \
+    python3-datetime \
+    python3-numbers \
+"
-- 
2.39.2


