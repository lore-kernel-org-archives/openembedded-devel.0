Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24663C3ABAB
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 21:03:05 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.123073.1726434175640414761
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 14:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nfgZ4rDt;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-371941bbfb0so2629818f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1726434173; x=1727038973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCjE7XKrucXaqpW8Ln1CTXfurj4NmAOVNst9y6LkX+M=;
        b=nfgZ4rDtkGusLvKigc6HvSBnGR2JBAUIExh/w+FQXb8j5aMfaVGukO/2aoX/qifDKd
         1UHd165REAggBYoBsqhFiHXQaVwL5soEXlIG5deBnTuWQLeR5/UrkV/X6zHRHAlwwb9T
         TskecV9V3TiZfderGLUy/LSLe+KNBQnMux5xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726434173; x=1727038973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCjE7XKrucXaqpW8Ln1CTXfurj4NmAOVNst9y6LkX+M=;
        b=Cs8NrbFxXP2DdPQl4Uujm68Zkr2w1ve8KrlQ/yRCVKWYVkFYj1HraAXc6VGw9p0EnC
         D2tiJVdc4gyEqIF1/rSfzin0waPs3eGxb9xFwXlrC+QbbnqaJqTG0/Zg48eV/ZcuAE00
         HSac3E1zMiK562cKZGQSwwijb4WjzfDhf+rBUQdRVidoZtfJF+hJF8X/JqPqnQSSaDgv
         KyqeZCBIYiizEduZ15yGjEId36DVH1CIgAtlMgmmIGFV7sPiivN0uvwnUVZCFe94ipkh
         9OSXY7VqOH5voC7Z4mtfIyC28HzHhShDtlGH+D1UOkZqD3gLFyD68NGBxbuke3YgqvfS
         m+/Q==
X-Gm-Message-State: AOJu0YyS6bxQu5eO84iL0CfU9o517pXjg8VvhGulm2L4GAZti1mOw1X/
	T9bQ7VrK5A3gFwYBFf5B+hJf0aT0R2FRzKrWunpM0wgNF+6DRQ9+nWXuylKflbmLOQx8z+Zhk9n
	e1ogA7g==
X-Google-Smtp-Source: AGHT+IEzIsuJSl64TZN/sM0CeO9l/VgxqpIJW2ZDC0InBo9ha884r8E5vE7ynpGFAs3hiVhzhveEkQ==
X-Received: by 2002:adf:ec07:0:b0:374:c07c:a49 with SMTP id ffacd0b85a97d-378c2d04c73mr7627110f8f.28.1726434172496;
        Sun, 15 Sep 2024 14:02:52 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73f62dasm5393362f8f.49.2024.09.15.14.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 14:02:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-filesystems][PATCH] non-repro-meta-filesystems: update known reproducible packages
Date: Sun, 15 Sep 2024 23:02:23 +0200
Message-Id: <20240915210222.2237434-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 21:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112316

From: Yoann Congal <yoann.congal@smile.fr>

Re-include packages that are seen reproducible in the last 3 AB runs:
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/41/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/42/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/43/steps/12/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-filesystems/conf/include/non-repro-meta-filesystems.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-filesystems/conf/include/non-repro-meta-filesystems.inc b/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
index 4975593277..509907d889 100644
--- a/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
+++ b/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
@@ -3,7 +3,4 @@
 KNOWN_NON_REPRO_META_FILESYSTEMS = " \
     e2tools-ptest \
     xfsprogs-doc \
-    zfs \
-    zfs-dbg \
-    zfs-dev \
 "

