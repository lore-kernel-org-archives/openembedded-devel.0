Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC240C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:21 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9074.1685521580684463591
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=E4tpZQ5f;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3078cc99232so5206300f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521579; x=1688113579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ4TNBV+vjPI4iIh2im5ENUXN86pSluTHqhLjoY81p0=;
        b=E4tpZQ5f8ByvzJWV/rWVBTAUXAA3+rjOitABN/ScGobAcyTbx36u9nFzgKr58v331p
         P17XUNj0JITcjVckIWUsB/fwFEMUpCj5/i1wgnO/D+Sc2dEPdKitaP5s3GjIuk1twKjt
         hDMLmibjhyZpbzSooADs8nxX8ViAwk5rsJICjc029exH0uTlb2Vre7/PQl2x+AciHl6T
         oII52+lpTbuXJVIHrDDqeBpk6LfRbKAss0NyDTiSJONA3q/6VYhrbaOK70yYB3bDOTju
         NJGwV+hjWBOc1BZcj+ROIhY5ngbcwQON9lA2qsiERJbVagzWmXv9HQ/JU9Qjaa9Ubj57
         IZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521579; x=1688113579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJ4TNBV+vjPI4iIh2im5ENUXN86pSluTHqhLjoY81p0=;
        b=DAuZy4ZzKYJps0NACQymzzYnwI4Glj3y62TCUHVoEMI3Fus5FTP1PEjwfmFDt/Yrrv
         AI3tOQkrPWMOqn7IKdO0WcAikzH7s99aspDlJ3PP77MnfLamiifmz5GKZe14UowhHRul
         eT0h2p6+6JmkT5faAbSb6LMS4Q5I6S9gFBrNEs/pL15k3lQxMPxX2wgyhzSO5hFn7mEF
         XX6bXVnSyeZQ9WS8B8G5e4cl76eI896NViTFLYTTPcAvJkwac3tFQn4lDZWwT8wSYcYk
         8gDR2GC6inxkHvGA4CVyWOy2wSgL7UMmGb+FfaXIQ/A19pKzew6fLoRLlYjjXu2nCcL8
         FF8Q==
X-Gm-Message-State: AC+VfDz5nc50y0ZpGafP2QENnBKNJKMYCEVzdeIFv0HjvGMqqX3b9gvj
	UuXifJbrBFZuBtYpirm14p02Jw==
X-Google-Smtp-Source: ACHHUZ6MzfvQrKNYMRULs8ThZgIFye9oNljRaLK9RlQOEWnjuJAozXD+euL1eB0auAiOiwOQ9fr/rg==
X-Received: by 2002:a5d:654a:0:b0:30a:b3c4:3b8d with SMTP id z10-20020a5d654a000000b0030ab3c43b8dmr4236711wrv.41.1685521579278;
        Wed, 31 May 2023 01:26:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 065/149] python3-fcntl: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:13 +0200
Message-Id: <20230531082437.10646-66-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102992

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
index 2720f3ed9..8c192d296 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
@@ -12,6 +12,7 @@ RDEPENDS:${PN} += " \
     python3-distutils \
     python3-io \
     python3-json \
+    python3-fcntl \
     python3-logging \
     python3-multiprocessing \
     python3-pickle \
-- 
2.39.2


