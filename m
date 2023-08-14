Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660C4C001B0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 08:41:12 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.103194.1692002469142219371
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Aug 2023 01:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PI5Zk9z9;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so6392119e87.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 01:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692002467; x=1692607267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jSZCC9Xyh9mw9MB3sVZiBoux/NY5GYta64GobJ+qAqM=;
        b=PI5Zk9z9bRiZdBF7JIY6aSL29pryJJkGceI54TBZPCJZ37qOt8LAKDXTcOPmZoikPk
         npiPCQoPjSWPeOeHY8Mt6FKh5cCkQGrmJPoPM7IQHtzmMYWu2D0MzJEQY20SK9nZ9ZyL
         wOTI7Dnv+tKdDFPInM4qoyn5ufzWOqMYGqwnR5FnPsV1Ulx0b6V6e6p80Czk9fBp4Bv5
         Oc7tUwemopu0Qlr+j9LfAw5ZRSw3v8J25fob/TfQynQUBUZFuFNQjf47wDjNRiYrOxYL
         AI9AU7YrEtqF/FdHzRK9Yf9Es0DYE2MMewpdudeDifcoZEGYezRK/zFVvhZXxwq98ZRK
         HskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692002467; x=1692607267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSZCC9Xyh9mw9MB3sVZiBoux/NY5GYta64GobJ+qAqM=;
        b=LG7Xvf0Sh9+YESFbjM1HOCJKJ4mvi4YmfvhDCJr3KiT93UQ51nxNVVhx7qkg6UrhQ3
         zdojWrMkU9Pqw+qV/gfJEhPjznD3pNacRx8bLxAgjaFmAIDmEL/GhIUcZn+nQe8yA6Uk
         EVlRVHFkZpmiLM6onahPs3CrJ06HAf1m2LHmwJYIAbrssXNDMsxF/tlYNbuPmtjruu3g
         047AnlJNM3mfsevOz41/1kuAQi6fx6/sTUvbCMk1FdHw5EPnm4eNw1rvLFU7FvyYSZJK
         pHfVuRqUhpKqwfx4D5cHK5pw7AgParUdzaJuCM2jaf7QEad0Vh8fS9XGWDWB+W8JFUeT
         hJiQ==
X-Gm-Message-State: AOJu0Yyac0rPJoAdEfKMvt+W+VrgOpKKJ7rLn0ZO+8xn30fZ7OvvtwTx
	XwHAqch/y7rhEfE0DiAo8FTsG55x+bE=
X-Google-Smtp-Source: AGHT+IHpgcSWqp5Wiz2yf0+hNx1yHyvPSFN7KKGezr9hPGsHQt8+jU8pZd+fG/UjRIPYiIHDgD4xqQ==
X-Received: by 2002:ac2:4ecc:0:b0:4fb:9d61:db4d with SMTP id p12-20020ac24ecc000000b004fb9d61db4dmr5350520lfr.18.1692002466738;
        Mon, 14 Aug 2023 01:41:06 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id n11-20020a19550b000000b004fb99da37e3sm1872302lfe.220.2023.08.14.01.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 01:41:06 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH] libusbgx: usbgx.service: use Type=oneshot
Date: Mon, 14 Aug 2023 10:41:03 +0200
Message-Id: <20230814084103.10932-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 08:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104348

From: Ming Liu <liu.ming50@gmail.com>

A regression was introduced by commit:
```
commit 48bc4b2d5e4688bac10bcca26657a5fe660b93ab
Author: Ming Liu <liu.ming50@gmail.com>
Date:   Tue May 9 13:36:20 2023 +0200

    libusbgx: fix some systemd service conditions

    Let usbgx.service require and run after sys-kernel-config.mount.

    Use "Type=simple" rather than "Type=oneshot", this ensures
    usbgx.service would not hang on failures, failures could happen in
    many conditions, like if the end user has manually configured
    something in configfs, or start usbgx.service twice, or someting
    wrong in /etc/default/usbgx or /etc/usbgx/*.schema.

    Signed-off-by: Ming Liu <liu.ming50@gmail.com>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>
```

In the case when 'Type=simple' is set, 'ExecStartPost=' will execute
right after the process in 'ExecStart=' is started, but we need it
execute after the last 'ExecStart=' process exited successfully, so
change back to "Type=oneshot".

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
index ba92f1ab8..d7d394cfe 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
@@ -4,7 +4,7 @@ Requires=sys-kernel-config.mount
 After=sys-kernel-config.mount
 
 [Service]
-Type=simple
+Type=oneshot
 ExecStart=/usr/bin/gadget-start
 
 [Install]
-- 
2.25.1


