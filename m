Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10AFC28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 23:54:37 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.20664.1742082875225773093
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Mar 2025 16:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3Q4WD6EK;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43690d4605dso5946075e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 16:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742082873; x=1742687673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0t+VME6DX3D4MdgM2W9uLrEtf7nMWTbBy09rUzmlJwM=;
        b=3Q4WD6EKKKBe8L2jhCFOfZ+W7sQmqrxv0qXQIR2B0nAG8MIpxNSbo33O4KVqllSeOT
         Hieqln2I5dP1qU7iinyXw4Nq5VIiYr03We9XzRXzgf20umxeTkZ/6etQaC4sE3HqrMcC
         WuzpwiSneLlLsAazqWA31CERLlDsiKbf/c1XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742082873; x=1742687673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0t+VME6DX3D4MdgM2W9uLrEtf7nMWTbBy09rUzmlJwM=;
        b=Lg5ahs/je7ps3bi61EpBix8Ry2aKUq+QaDqkQbL0VkEyw9p8zlE726qzJLhbRTbIUs
         F6ApY1U4WbEBgThSrXrknTnU2zNAmvM3ndxYexJz+W2Qtz9HUZLcFgTSnxoeWndBHDMJ
         2jTB8ymDWp8Ak9m8ncN9Q431Hpc86K96e6x5l+qzJfhad3s2k5XIeLbG+iCpUqssSTlr
         5WS/9w/et7XxTohXNCuqO0ylCZmWP7rM6rUJDHZUDOSHP+0LPV7LJPe0di1P3Pqf/YiG
         N8ArOwq56Z0uZYbdGO4NgDgjWq1jgOtGtveXFMas/U+Dg/E/SxqYNYnKwfcVj9oQKViS
         cW6A==
X-Gm-Message-State: AOJu0YykehyMZ15uj5qfMDynHsml0wL2vP0I4HGNSv4RDvveq8+fT8Oy
	a/V0ib9VcFxn5pTDNrF3zaZfLiQCKvktepR8Wf/jRWNh6Pg/1oNSLQP3g2wlclWlx2OeYyHclJ3
	7
X-Gm-Gg: ASbGncvQ7IcMm9UJYzxJgbyRiseLQZ29JToN/nVzC32cYryFAgIjRh7rCO7bR3516jw
	Uw6arnakuNfXeNgxFB4HHapCRVe9FQAui91UNazXRUutk+QIFpPlG9XDGUkbQrWq5yvx/e2+gZM
	ZEVjkmOFkxlVR0Vr2Gx1M1+5yXAgf05HjZO3GXuau3oq72WU2lMbvgR9Rdyp6/tuaoz2o6B3/qq
	AVKOFfS2CF2zknxfxETtGibTYOKmRLjqoFm3ETuzOdtVje951ZiKVHyhQ12EdEwdJpalKsiiITR
	vka6X41uxGzf0hjx1UJbbisFofcEcHBqLWajMZoId4tfmNqUYIkPDgE7v+2SHWyZ6wQZlMd4TdG
	b6Bvcs9DX9HoKmtp0AEqC3QunyezhjeVUMlvLj4zfLUnijRwXMQhoS0iqHF4Dqw==
X-Google-Smtp-Source: AGHT+IEvKjQUkVa1+K8jcxShZ8otR6jZ3QhvS3JqXxtLea+P6NmJKh5HQrmn5jkcQElZgrNZYjNZbQ==
X-Received: by 2002:a05:600c:4eca:b0:43d:bb9:ad00 with SMTP id 5b1f17b1804b1-43d1ecc7d78mr96582415e9.15.1742082873041;
        Sat, 15 Mar 2025 16:54:33 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef0002cff7470e58ff5dc.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:2cff:7470:e58f:f5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe2a263sm63503585e9.22.2025.03.15.16.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 16:54:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] reproducibility: Mark fsverity, libsdl2 packages as known non-reproducible
Date: Sun, 16 Mar 2025 00:54:26 +0100
Message-Id: <20250315235426.2876555-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Mar 2025 23:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116001

From: Yoann Congal <yoann.congal@smile.fr>

From AB run:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/36/steps/32/logs/stdio

Diffoscope output is at:
https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reproducible-20250315-8_7ama2q/packages/diff-html/

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/conf/include/non-repro-meta-oe.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index 88dcedc268..b012c49310 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -24,6 +24,8 @@ KNOWN_NON_REPRO_META_OE = " \
     evemu-tools-python \
     fbgrab-doc \
     fluentbit-src \
+    fsverity-utils-dbg \
+    fsverity-utils-staticdev \
     fvwm-dbg \
     fvwm-doc \
     fvwm-extra \
@@ -59,12 +61,15 @@ KNOWN_NON_REPRO_META_OE = " \
     libck-doc \
     libdbus-cxx-dev \
     libforms \
+    libfsverity0 \
     libhugetlbfs-doc \
     libiio-src \
     libjcat-dbg \
     libjcat-ptest \
     librelp-dbg \
     librelp-ptest \
+    libsdl2-compat \
+    libsdl2-compat-dbg \
     libthrift-c-glib-zlib-src \
     libvncserver-dev \
     libwebsockets-testapps \

