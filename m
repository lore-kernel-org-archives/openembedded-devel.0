Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE08DC7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:01 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.9121.1685521553790362185
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ImUWHM7B;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3063433fa66so4017037f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521552; x=1688113552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVRr795Qmta6FarUEHn7UOo/2lphkGybd6uHL0EFxbI=;
        b=ImUWHM7BpC9ZKefL5Ger7DHyBz7Hgl+JTINrpvlZao+x+5uyaTusRzUHO/sv5xy3qH
         7/wArJkLCZuM2kNWe2iqbdmlB7z85EoqcK0nicKyrRxbRDDulSkQ3EwJUHekPyZMbPrr
         2+S4j1ne/JfcZjU8QcVdLpUs+i21RbNOUd0frtA8AnokJ34Xsrj5olt47A3/Fy0hPiu6
         1uggPzEoJXb+FFZ2qUcqodLMzb0Ud/DIjYpxLyTushxhKCs2clijyuM5j6e/yRh0EE69
         qUv8Hmd4ut3uBLBe/0wb7NNo3ajVl/HTyNwVkph8JUV+efub59h0BTObgLND0ZwBIw+W
         VrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521552; x=1688113552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVRr795Qmta6FarUEHn7UOo/2lphkGybd6uHL0EFxbI=;
        b=Tt++YGKvRI8rR38N4u+kAyEgTAa0lnblqOp9hMwsmqEGQuWWyM6MPYHsmyAJ0CVm7C
         VcAn+fa4M1J0bHE9zbaXXZMStmFLYHWxa06XtQGLMFczU006jB1qM0V9ULShmbhrRDSx
         UbJz98sslk8COmXqdwKNAWxsFpirhLKlTY8LyhPJBIKx7raKohjX0IP2tc9lT0sNUvPc
         chmCR+inri9cuj2Ug+8dHEhHVdKj3od24ddrNIR5iuPXIMAA00zpNt/nRafxgKb3JCGC
         auIhaaFgJPuO3FEEMyOlL+QTGwDeOpGgZ4DowF2CKSpaZ9n7Kv2QMxICgteuWzD1DWaO
         Z5bQ==
X-Gm-Message-State: AC+VfDxUErU9isg62Fl7wX4GVliA4Xt5CwKsthW2rk1PDbw0SjHJUMmb
	fLcjPye7UKj+nyW5VYTBeMjGAw==
X-Google-Smtp-Source: ACHHUZ69w+HAgFSpEJOedbtPPZ3z9wqBTq8ekyJxvOFZGJ4XXmYuOJj6Y24RTu0oWaCoEbplP+BkOQ==
X-Received: by 2002:a05:6000:12c1:b0:306:342a:6a01 with SMTP id l1-20020a05600012c100b00306342a6a01mr3560062wrx.47.1685521552365;
        Wed, 31 May 2023 01:25:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 042/149] python3-twofish: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:50 +0200
Message-Id: <20230531082437.10646-43-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102969

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
index f45772d50..a8ad4bbdf 100644
--- a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
@@ -15,3 +15,5 @@ SRC_URI[sha256sum] = "b09d8bb50d33b23ff34cafb1f9209f858f752935c6a5c901efb92a41ac
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += "python3-ctypes"
-- 
2.39.2


