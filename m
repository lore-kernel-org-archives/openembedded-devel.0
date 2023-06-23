Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446F5C3DA41
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:27 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.216.1687531221181358234
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=tCBcFf60;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f9b0f139feso8982965e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531219; x=1690123219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rc5YxXVWCziJyAIzmh9LR6bEraCSTXLNc6o7E/xpAWI=;
        b=tCBcFf606jct3oyVOdY899vY8wkQTB7Zo1pZPf34J7AoJohZfrtL1ddF16Jj2yHcOX
         krSvoSCnc8GOfoekyqw9G8Q8cM3uXqp9jneIAQJ+JGI9B7LjrMC+4gGb201dpG0IdBXa
         YIRWxDzfOyLOQ1y3X88TiK23kHVk8GhcU0CIRvsGAHssNladvMf/D9CztQr0vMNT9YdD
         b28Am+ZR0QkUSMW4dgNvuS0ETV09KX21YbwHTaR5ceMFviwP+JwQ8OctvEG8IT62GGZl
         HpTM21itAe5RhZnbaply6rA4YQCmfqrfMs241RPSa/v+ZCB9QOiSrlyiz7AByfBZ+iio
         WP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531219; x=1690123219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rc5YxXVWCziJyAIzmh9LR6bEraCSTXLNc6o7E/xpAWI=;
        b=JC730AoZvArFoEoBfbtopPSr21sOY9VUtq7HFT9L/hBiq0Tpyx5VRsy6cshVnuyxfh
         ZkCyFofM8QOs1oTmmP0YeRewtcPew/ubCnOXraJHs/q6Z5mVgWp8xbabm3+OlqtHuxeP
         sc3OgmocvYl9nMw8xCKf5Kg/s1NMvyZXDC59YdW4cdNEX7+Zndl7Sc809akSyhyig00y
         BKUJDD9aaR5H4//ML67MOjlnSvTZNncoCSyh1l2ZaA4vmf8Yrq14fpS0qVM4qHEAyDPz
         3j98oKoF/s0AoVtGVK2nbo3YlGuQDsIjX5p0DuHMwDXTdefCPkzAYMqtUNzZpTM+gMUi
         oXtw==
X-Gm-Message-State: AC+VfDyuMSirhKoRDZHGhsG2rcgOegfjcyyntyhTRsspvgvj2o37N5ly
	tOKqBc2JpbFZg0kgrxbqMpkXJWem+c6ZmdEtj04=
X-Google-Smtp-Source: ACHHUZ5dII4HD+bJ65oRhFzLIqdnMwWh5CPxTpwIdaauPwxSF78dUoJG383uPCmDVdiH4rX3VeUOZg==
X-Received: by 2002:a05:600c:294a:b0:3f9:b950:56a8 with SMTP id n10-20020a05600c294a00b003f9b95056a8mr8449888wmd.25.1687531219703;
        Fri, 23 Jun 2023 07:40:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 46/55] python3-configshell-fb: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:12 +0200
Message-Id: <20230623143921.146338-47-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103542

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-configshell-fb_1.1.29.bb                | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
index 2bb196c20..7a7ecd753 100644
--- a/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
+++ b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
@@ -14,4 +14,9 @@ S = "${WORKDIR}/git"
 inherit setuptools3
 PIP_INSTALL_PACKAGE = "configshell_fb"
 
-RDEPENDS:${PN} += "python3-modules python3-fcntl python3-six"
+RDEPENDS:${PN} += " \
+    python3-fcntl \
+    python3-modules \
+    python3-pyparsing \
+    python3-six \
+"
-- 
2.39.2


