Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F9AC7EE39
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.3704.1684914790329649329
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ukb5DFFC;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-510f525e06cso1469173a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914789; x=1687506789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dwF6/K2FhJIjeipYWSyhNV+gWYr8sJy7pPixte5Vc8=;
        b=Ukb5DFFCM+ddVzUgUgEK2L79+AfIRDEAbPZv6GRK0fZoORNCE9IXHkOPjnYIlW0fGi
         WmWRoFpPtRbZWNuCXYdm+1u4xltj2Xhr10nlu6LFU45LFMeA1No0xW4m6XiQC1VZTR1K
         Dpvi8+fauiTtFzJkYSJpBr6ULSjWlldlYoYbwwHuL/KTGjCXzah/5f57PlZxSKvMRfuP
         3VHnDsXQEmD5L2zAQ21wfQfJgpoipG36lSXg2K7MBIBixcCDPuntg7CGK3m4K3Gna9+/
         b+OjllaWZCJf7YKw2hXTtB+6v+63TtCn7qgJ326BiqQYPnycg2oTRub/hznVjA2ZMH/6
         R/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914789; x=1687506789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dwF6/K2FhJIjeipYWSyhNV+gWYr8sJy7pPixte5Vc8=;
        b=CYYOBAC/keRgnFZdHbmVd67/yHT3iTrG6yF5laSDBn6uNWEsXTHloTNj2naQX8FD17
         rQiNV21bSuIi63fHTgdU6G9ANnl2Ge5r9bfec7RIf1EEAqLlvXx6zflvOKWMRbE5IdS8
         v0AWqwh3Mu0CK0jHnn0CaGq4oduw95Xy0M5q19s5qqydZJmHAezHHQEwWhf4qWDV2y2k
         AOQju5iGufQu8uF179psMckMtmC28BvjhqTK74hONS1n0jNBxCS3NUbX3D3fekEDn9Ve
         RJo2T+Kj7cRviy+LF4xoLQN475Qb05OP9ds8GiLjHkDfCCveVBIbMNe6SqGdx+jGGBYy
         Q4Ng==
X-Gm-Message-State: AC+VfDzLcoFetTiYuG50VVCuypvVhoUoq4xH0NdhmiyWmw/jaJIzXsjx
	fzk3QUaU9fElfpK5a+eIPg1F1pBtTiQ=
X-Google-Smtp-Source: ACHHUZ5Gv1Fgv7ceGxE7DaVzKDPLBzw7q6JQ3wn4yTYZ74u2GEZNeHYJxBP7Y/YhRJQfyJGNbAqYow==
X-Received: by 2002:a17:907:9708:b0:96f:4225:9009 with SMTP id jg8-20020a170907970800b0096f42259009mr18091471ejc.0.1684914788582;
        Wed, 24 May 2023 00:53:08 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k17-20020a1709063e1100b0096f641a4c01sm5435129eji.179.2023.05.24.00.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/20] plymouth: remove unused patch file
Date: Wed, 24 May 2023 09:52:44 +0200
Message-Id: <20230524075253.1033593-11-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102765

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=479b1455e37d49bc24f709bd2284effdb92686ab

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...001-systemd-switch-to-KillMode-mixed.patch | 43 -------------------
 1 file changed, 43 deletions(-)
 delete mode 100644 meta-oe/recipes-core/plymouth/files/0001-systemd-switch-to-KillMode-mixed.patch

diff --git a/meta-oe/recipes-core/plymouth/files/0001-systemd-switch-to-KillMode-mixed.patch b/meta-oe/recipes-core/plymouth/files/0001-systemd-switch-to-KillMode-mixed.patch
deleted file mode 100644
index eb1c8db21c..0000000000
--- a/meta-oe/recipes-core/plymouth/files/0001-systemd-switch-to-KillMode-mixed.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 9d0f8b2e7bc2d1d2b0900fcdf119bb9a2cc4f474 Mon Sep 17 00:00:00 2001
-From: Ray Strode <rstrode@redhat.com>
-Date: Tue, 25 Aug 2020 10:49:11 -0400
-Subject: [PATCH] systemd: switch to KillMode=mixed
-
-KillMode=none is deprecated, so we need to stop using it.
-
-For now, use `KillMode=mixed` and `IgnoreOnIsolate=true` instead.
-
-In the future, we should change plymouth to be able to exit and
-start again without restarting the active animation, but that's
-going to require some effort.
-
-https://gitlab.freedesktop.org/plymouth/plymouth/-/issues/123
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/plymouth/plymouth/-/commit/9d0f8b2e7bc2d1d2b0900fcdf119bb9a2cc4f474]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- systemd-units/plymouth-start.service.in | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/systemd-units/plymouth-start.service.in b/systemd-units/plymouth-start.service.in
-index 3d00cc6..830a62d 100644
---- a/systemd-units/plymouth-start.service.in
-+++ b/systemd-units/plymouth-start.service.in
-@@ -6,11 +6,12 @@ After=systemd-vconsole-setup.service systemd-udev-trigger.service systemd-udevd.
- Before=systemd-ask-password-plymouth.service
- ConditionKernelCommandLine=!plymouth.enable=0
- ConditionVirtualization=!container
-+IgnoreOnIsolate=true
- 
- [Service]
- ExecStart=@PLYMOUTH_DAEMON_DIR@/plymouthd --mode=boot --pid-file=@plymouthruntimedir@/pid --attach-to-session
- ExecStartPost=-@PLYMOUTH_CLIENT_DIR@/plymouth show-splash
- Type=forking
- RemainAfterExit=yes
--KillMode=none
-+KillMode=mixed
- SendSIGKILL=no
--- 
-2.17.1
-
-- 
2.40.1


