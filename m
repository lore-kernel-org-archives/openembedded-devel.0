Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44005C3DA4E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:56:36 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.562.1692287788393911443
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 08:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ek8rtKmN;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-565f9b2f626so1403920a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 08:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692287787; x=1692892587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MFfObZLm3HwySHgQEpyDjVvyFADw6GXQALV/ZuLYxfc=;
        b=ek8rtKmNTldLT0PpqOgQ2ny9xeIevdDZslMuklB66mAzpRbq5Ff1Qfg4ROe00iCePf
         Y5VdylfF57R7+ncBWv0bfQRJ5ykoXBrQYzeRWSGgyqIEdgn6CEHpUEgw7e0GosHSM4Yh
         ZwSKBAhwmhDNXFwRqcA0lV84SMIz2n6XfyggXf/K7IJmYzpqyEd9MTBGvj/101Nijgq2
         u7AuR+C8xBQpLkMQ0YGe4mxugyaYDOz/9/+kAylsWVLskoLM2Os+8jugIOxFsmcNniW3
         mV5TBbPnSXhf1T0uGjnWny/JGC0UP0lOM93+nzS37yKprK5mtQzM3wddm9VcXQj52k6l
         vQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692287787; x=1692892587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFfObZLm3HwySHgQEpyDjVvyFADw6GXQALV/ZuLYxfc=;
        b=Q/T7L/5WcckcAJstdrCz/+xJ6ENA8FUdjQzEbL6wGtgHzB5tcnhEBH7vCeWpkx9o9t
         nn+XFq1yVwmKGNqi2FS6co6GN92nMb+JoVpcEyhGzd5yjFa3ZO+ncBb37wDL76gnZ7kR
         dS2ySozhQAsiS/Gsz5XtcOoQ8PY8Q1qQsfBN461hJs6Zwx65dz7nFuPIJFgPGaw2jkgh
         y8ugoU1/g15BxDS9K4Job1qMYmTbzQwVzo2MhLxHFjNs/uYN6aWM+hPMLJFkqgQgsiiV
         1XYq9FK118tnrhWDPB9wgC+FE/d02A55SnJQUePLiXlGRAxTFL42217M6iZRG1nyOnyv
         TcKA==
X-Gm-Message-State: AOJu0YySIa93fN2EX39QtfP5LVkE2KkfgeLhTJUfjIAWu2zNIIadIuSm
	zBzbi8YA2AEXcTdRcNyI+Bj85q95kjL+Kg==
X-Google-Smtp-Source: AGHT+IGYhBFPenoP7vgayAKjDz9W4XzgEMVSPdFiUGShBV8ALNQdyX2/QPNyhIFsdvzb9eXb6/Tjyw==
X-Received: by 2002:a17:90a:d489:b0:269:154b:6290 with SMTP id s9-20020a17090ad48900b00269154b6290mr4538614pju.24.1692287787468;
        Thu, 17 Aug 2023 08:56:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id ng17-20020a17090b1a9100b0026b3f76a063sm1728155pjb.44.2023.08.17.08.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 08:56:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Kirk Hays <kirk.hays@biamp.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] jack: Drop dependency on readline
Date: Thu, 17 Aug 2023 08:56:24 -0700
Message-ID: <20230817155624.464947-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 15:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104472

From: Kirk Hays <kirk.hays@biamp.com>

Since Jack version 1.19.22, "readline" is no longer used [1]

[1] https://jackaudio.org/news/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/jack/jack_1.19.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
index b85b7993d0..104b946c68 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
     file://common/jack/jack.h;beginline=1;endline=19;md5=6b736ed6b810592b135480a5e853392e \
 "
 
-DEPENDS = "libsamplerate0 libsndfile1 readline"
+DEPENDS = "libsamplerate0 libsndfile1"
 
 SRC_URI = "git://github.com/jackaudio/jack2.git;branch=master;protocol=https"
 SRCREV = "4f58969432339a250ce87fe855fb962c67d00ddb"
-- 
2.41.0


