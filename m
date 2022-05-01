Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B41C433F5
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:27:09 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.145.1651422424802487543
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nTIfsA5k;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id t13so10090753pgn.8
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=taRtsX98OSqy0yUmszLg28cHjwuM9qWXF5zCF7bhnLs=;
        b=nTIfsA5kn15qKJjgL6gOZfr/0/7PCXB0CIdbfH22qquv32f4VzZyAmuNebavgV91kl
         Cqw6/ZPoPcHvaZvhYPTMR0M0fNiallcYd745AFh8jvfWWzIHRlmDP2e7fQ0rL12RpzwY
         pnr2BUJvMD0f5Emdz5OoyZBm0G66SxJWiFyqQPGzFYobT9MJmpHWoKm+sfYxUAFJSJIR
         rAcUlHtvCXBVMqwLyWZ8r2Ixf3pCltZdaM2ffKIbxUEaFde8Xa5tLtOW2KLjkkrNQUPE
         0VsgjqyTwJOOatzHYTK4q6/SDWEpyT4AyDibIAOsXw875GVGfBS2bOKIUgZ45qLXffHs
         kUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=taRtsX98OSqy0yUmszLg28cHjwuM9qWXF5zCF7bhnLs=;
        b=1c9dpofr0OtscuT+w0FQL4DL13Gbcp+JOTGRlUUMIQ7SR6/3Lq+Om/Z7Lifxn0eM/F
         kELPi0cXIj/vrdYCxGAQs4WzwcDOwF0sZLi62s+OJksPQWAvPKkAmPtym9W88fs+he1H
         CLJZCMiYVzAWu/u4HLcuXKMm1eywrDmB7tB6Z8/prF+VCwi4fRtkcZk/DVU4cHrf45/J
         X9nqqj8B2rrzhHjnp6imoVp1Z9P1PotXne0AdDqgvB/UB5ffKuBXNXgG59PHYDAiMvK+
         O4iFfWCz3a2vQc8oNQlPQnUQFFaFqN64h1RIC18eEE2fNWtKlJTfgfZ6qRb+s3IReCHI
         EvUg==
X-Gm-Message-State: AOAM530eWwOyYBabqwYKMtNGB+A2A6ZDHM9x3VXT6DsAWp4ndWXA+u+z
	1pooU94s3bOrfYW1nNMX23mqJZucV6l9gQ==
X-Google-Smtp-Source: 
 ABdhPJwLo/5zPYr0mz4XXzPCG0rVK5IYbtCyjs7vFv1WXuKUq3xbqDKhCCpYXNK1lwzEZrZvWBHL9w==
X-Received: by 2002:a05:6a00:1943:b0:4cb:79c9:fa48 with SMTP id
 s3-20020a056a00194300b004cb79c9fa48mr7828324pfk.47.1651422423951;
        Sun, 01 May 2022 09:27:03 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:9a0c:5968:29f0:efcf])
        by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b0015e8d4eb243sm3063569plc.141.2022.05.01.09.27.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:27:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 10/10] meta-networking: drop meta-python layer
 depends
Date: Sun,  1 May 2022 09:26:43 -0700
Message-Id: <20220501162643.513646-11-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501162643.513646-1-akuster808@gmail.com>
References: <20220501162643.513646-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 16:27:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96922

With of a bit of pkg shifting to other layers, we can break
the need of this layer to depend on meta-python

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/conf/layer.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index a4f622a8cb..3df1a59db1 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -15,7 +15,6 @@ LAYERVERSION_networking-layer = "1"
 
 LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
-LAYERDEPENDS_networking-layer += "meta-python"
 
 LAYERSERIES_COMPAT_networking-layer = "kirkstone langdale"
 
-- 
2.25.1


