Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BC7C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.9060.1685521533015281553
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=t/mv5LF6;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f6dbe3c230so56143655e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521531; x=1688113531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzpEYrCmNf/LFIUgQUQjsaPESP/RT5uFPtnRXXO/dAA=;
        b=t/mv5LF6BfxREv0Vmhjefd8jhxKpTtMAwl1SUCc0NS7Y1b4l+1KUp17w6Dp2LqjwjH
         nzVUdUkaqW9usu9MsDCROhHcREmQT8q1tsDVPI1TYVMEnQtaTt5HZ+71Avzf4qN2qkFU
         tO1ul8RU9Ab+qw829psv/3TD/LXRZjX/UAbZLqu3xfLYmI4TSMto8KYhPz/CuB1QW7YT
         QneaQcNDQtSaCjblrwaOxpysCsN+bA1YAhAAtDUkVAPW7thNSYHc0dlvtmtY831UOMjj
         GJrHPbJsE7EaFLfUfQFcN2aSJQEd7HH5VOGLq6kd/Jd8ULRd00NQN5SIsQ4hZVDsIjtP
         Pgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521531; x=1688113531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzpEYrCmNf/LFIUgQUQjsaPESP/RT5uFPtnRXXO/dAA=;
        b=WjRouTUdsXGooipi5dae5QFuPJXks2j2ovvIw2Rpng7pKxiEVe8df8f7R/zuqMJZhE
         9gC2BOpVN+VMo9NbctRVHXuAUolqgbqBN4D0OHmVmrBPgAl7VvW6bgdzQZbpS55ip76+
         /uatkVX+EMrEdBeenrQH/VdZzKEkTTR58sGK6oMe0oLuQv9aHg4pVaLyUiUrwyJiQZY7
         xkWqiU/afZhbxuuQLIINmE7owVGxBo01w2T+puJuKdKL5DCqXDniK19rXhEVYFQucRGe
         hLaDwx8XF1OE228m+7cEWYj+aIDMSsbRyiQawvz3sm5XwKYT04XGz47mr9xBm5obBsQx
         aCZg==
X-Gm-Message-State: AC+VfDw7Womwr+9ROeGP2vOT808WQKRhS3lulNaktkr+hWwK/pQmQwyv
	mVNiH4aG+dLzHkSULk5LOhq1R9decZPNw7tylDs=
X-Google-Smtp-Source: ACHHUZ672KdJsu0F+AShk0EGOhWVS6nmpWo5N8Blq/pn8QBlJlEqlmsPGAaJ70AYHX5uVYwaW0xxOw==
X-Received: by 2002:a1c:f710:0:b0:3f6:8f5:f9e4 with SMTP id v16-20020a1cf710000000b003f608f5f9e4mr3966816wmh.35.1685521531566;
        Wed, 31 May 2023 01:25:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 023/149] python3-pykwalify: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:31 +0200
Message-Id: <20230531082437.10646-24-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102951

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
index 01196d864..d94051df8 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
@@ -13,6 +13,7 @@ inherit setuptools3 pypi
 RDEPENDS:${PN} = "\
     python3-dateutil \
     python3-docopt \
+    python3-logging \
     python3-ruamel-yaml \
 "
 
-- 
2.39.2


