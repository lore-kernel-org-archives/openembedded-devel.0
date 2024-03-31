Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA993CD128A
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 15:31:55 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.18934.1711899112499568434
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Mar 2024 08:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FrI6bSuu;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-29df3333d30so2433740a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Mar 2024 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711899111; x=1712503911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mfxGJvFPJt76ACBtRA9uPzoaeQmjyjJy6W1lGXc4ViM=;
        b=FrI6bSuu6IJ6a1TZx7FmzljYd18sTq9BMgPrfs+4KjWwGuIFfTYTsIphzwh+q0cX5T
         2TgGC5bxnnY4AkftKF+WOlbN6zWiqaVOXxjpiyJbYlmKzzmEtzeg3XiPrW3hZ7ONQfcS
         0LuhwqfQajRqJug/vWdyZwvm2p9PA4YkCq78C8m2j5yAJiU2p5HrwZ3mPPL4o4anpTsF
         5BSNlfcq+0JUGZGX7fGSOc5TgJFF1bVRNUTTIvI3108brgokgt7153tJcqKYunZk5phk
         xsGAujbyuFDOeJG8sqwqVJH6zk/JhgeZtrSBhH3D7W9blAH+Y5HvuDkrrc2S0e4n2Kg4
         uN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711899111; x=1712503911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfxGJvFPJt76ACBtRA9uPzoaeQmjyjJy6W1lGXc4ViM=;
        b=lz+uy62GPS75ymQbIIVaBAVaO1nUD5TQoIC36n0SpQXWkDg1pc4atveQJ2ZG6WbqTz
         yWNCpeTG9kqimqUppSlpmqXY+lc0W5QtAp3584vN883994z+yA82JHxqNNHMV6Roqwy/
         fydmsaLuZKz2BxWUQ7wEQNyZ4pfcz0JPmwJftYd2RS+KIZrB0yvjBTMbdbxCq9X2rqCl
         QNxaSCFjnXmL4y31a7eRHxZx7ggqWYQR3jEbSCYy4vMNApOdlp/Qm0EJB6R6A3zAqv0d
         /a8DdXbamoOGmSK/9psYLKhqc+yxG7r2VzR8Hn8LQsNjDCAgzVbm3reHLPQA2oX9Qllc
         C20Q==
X-Gm-Message-State: AOJu0YzgfwtTBnSyZojQzm6m1QJHK42r4UTwPQKKcOMKjKlYD+nyisEz
	KuWwn/nadT2BaYAIJBuJ/nn16WykYPfZZQt/PkOyZlaHNuCY1PFfg0i8zIXt
X-Google-Smtp-Source: AGHT+IF924htEqnrIiMaVpzWSCPQY4mnaLJB65Csm9/4BRf4o2ciMjQPRxw1s/Rw0nHY+/FDpk/lXA==
X-Received: by 2002:a17:90a:5416:b0:2a2:2d11:c63b with SMTP id z22-20020a17090a541600b002a22d11c63bmr1879591pjh.31.1711899111310;
        Sun, 31 Mar 2024 08:31:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::dfbb])
        by smtp.gmail.com with ESMTPSA id gm3-20020a17090b100300b002a232d495f0sm1350753pjb.29.2024.03.31.08.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 08:31:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] meta-python-image-ptest: Use 2G RAM for some demanding tests
Date: Sun, 31 Mar 2024 08:31:48 -0700
Message-ID: <20240331153148.324399-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Mar 2024 15:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109690

scrypt/fastjsonschema/pillow run into OOM on some qemu
architectures e.g. RISCV64. Raise the memory to be atleast 2G
for running these ptest images

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-core/images/meta-python-image-ptest.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-core/images/meta-python-image-ptest.bb b/meta-python/recipes-core/images/meta-python-image-ptest.bb
index 9c542855a2..002bd7a39e 100644
--- a/meta-python/recipes-core/images/meta-python-image-ptest.bb
+++ b/meta-python/recipes-core/images/meta-python-image-ptest.bb
@@ -27,6 +27,10 @@ IMAGE_ROOTFS_EXTRA_SPACE = "324288"
 QB_MEM = "-m 1024"
 # If a particular ptest needs more memory, it can be customized:
 #QB_MEM:virtclass-mcextend-<pn> = "-m 4096"
+# python3-scrypt ptests run into OOMs on RISCV64 qemu
+QB_MEM:virtclass-mcextend-python3-scrypt = "-m 2048"
+QB_MEM:virtclass-mcextend-python3-fastjsonschema = "-m 2048"
+QB_MEM:virtclass-mcextend-python3-pillow = "-m 2048"
 
 TEST_SUITES = "ping ssh parselogs ptest"
 
-- 
2.44.0


