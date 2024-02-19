Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C8CC54787
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 21:48:27 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.1110.1708379302273768681
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 13:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c02b993a5aso2867447b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 13:48:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379301; x=1708984101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gf8kUIwpOWtHu/MeERXYxUQFQk3h+Lvx5iZsgXr8dsQ=;
        b=Ai20JqbclTD7Blt46awjAIopqBXaQans/4IYG7AlxsOU0NkA/nNzNnr0fkXKn+EQeA
         n+E1Qmh7xzHylP26F/Wy7mgbRlDJhWzYhlEP6ecyfozgAd66/v6sSMcQ3E3bkUEs9EhT
         MayrUx/rLUElb7zl/lvupwB15etiQuXL2IEvLzmKtYNlJrSzdpWWWwVJdehj8NkPWll1
         JCR0jMd3OmVAmdtuGH25/IZYZXH1jrtfGMfq2KrUMRpdgg63tJ2AZDK6XqN2fwSDS6ji
         YvUuM9+D/v0cz1BLvxgutHppxjGoIqm1QyvFRN8LRMkviZ8q2VpdePwi+UMJ5ZtARp4g
         n1GA==
X-Gm-Message-State: AOJu0Yw+w+jyDX5zKsb6p8t922IPzvzZpRbdy2LrzSOxCjzQGOGYnpnr
	3U/+bb1WEkfydlzPqc7TvujS60bCqXYiJT6WY7/CAXHv8twyrj6zEKsKKzoMgKo=
X-Google-Smtp-Source: AGHT+IGG8rHGQc9DMB4AxEleN5PTBzFEThEDOQmA/EgbfzX4l8GqmmzVxKqgN2zJWieULk8Ex933Uw==
X-Received: by 2002:a05:6808:2e87:b0:3c1:41fc:d012 with SMTP id gt7-20020a0568082e8700b003c141fcd012mr13910548oib.34.1708379300760;
        Mon, 19 Feb 2024 13:48:20 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bw10-20020a056808244a00b003c03fde4611sm994747oib.2.2024.02.19.13.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:48:19 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 7/8] python-inotify: re-enable working ptests for the package
Date: Mon, 19 Feb 2024 21:48:00 +0000
Message-Id: <20240219214801.1514843-7-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219214801.1514843-1-derek@asterius.io>
References: <20240219214801.1514843-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 21:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108892

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 2733280e6..5e4e5d45a 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -21,6 +21,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-gunicorn \
     python3-html2text \
     python3-inflection \
+    python3-inotify \
     python3-intervals \
     python3-ipy \
     python3-iso3166 \
@@ -75,7 +76,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-dnspython \
     python3-fastjsonschema \
     python3-gpiod \
-    python3-inotify \
     python3-license-expression \
     python3-ordered-set \
     python3-pillow \
-- 
2.34.1


