Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AE1EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.200.1687531200433171141
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=sRVvdXvg;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fa71db4208so8209985e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531199; x=1690123199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lArj0ekEtjj4m36tzFDhTHqHOnNNEYnPMQDYmlVH7Ro=;
        b=sRVvdXvgsUwIYnkMz/aLqnTpuUsKK37l6zdsLUKt13gik2Y/wX0zSh1QDZ7003DoIX
         q0renOrPMsZWoD59cr+akevhefUij4DRKkqnSk0669kSA9ttCjZpk0uQqcyQ6kKec+cm
         pTd2BRvnvnKu91YZkVwZcO63J9bBME95SUcPSS0Zz9oUJem15GPgGOzJTYzXw5byPRRQ
         FT5KZmPOmjUEM+wz/bCXJoHHI7qMoqviyMs7NZUDkqbp8JkyPzEzxxT+Kky4gAs53HU0
         I2fu1sHaEtcmEw41+aqcsSPer0dpwuAqXfC7qV1HgQxMtod8SkfIS3fRg73u9TTRNypg
         BiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531199; x=1690123199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lArj0ekEtjj4m36tzFDhTHqHOnNNEYnPMQDYmlVH7Ro=;
        b=eO6npVD0MctN+yEFkQMu+1vbFZdVonN39NPOKfgpzbXdxId8huqOMwwm71TdL1uIoF
         wZQi8STKv8Dlp2h0TaETfOKLlyt0RHo8RgiP8VXVuPXnG2iwrztZJFEgu2BaYWM2+Dxp
         pNyv/WQpqkLT0VbtnuDTharBejjD12NA5hoqRCKIb5RehgjQ6DgHFeirw7rxvpqoQtfm
         eRoqiRdKVCFC1k7Kw8c/3DaFYrMpvuW/Z8JvPhv5DcIxuh4JozFkbjaAEbOHKGZEglSk
         I46NTkBpa3npR7Go0zKulZ0TyQFEMCqyUWx00RQUYfLSGdCozcH8l3AbIVDDRU8dB/Qk
         kLKg==
X-Gm-Message-State: AC+VfDwiLEzRJo7jdaVeQ4Gchfr3IQk2n9JtfFGTkCDcXVCG7dqNa7fS
	Wn7hDcIdR2U5BH+5G3ambmzG2PCUqvcxofVmVX8=
X-Google-Smtp-Source: ACHHUZ7JPGYKZgjFyc0eS5n0S4W6ZnbCKat7llq/hN6LQFsQLV58lLK02ncKTz6chciHYytGYaV/9w==
X-Received: by 2002:a05:600c:3797:b0:3f8:f749:efae with SMTP id o23-20020a05600c379700b003f8f749efaemr4120953wmr.33.1687531199015;
        Fri, 23 Jun 2023 07:39:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 27/55] python3-flask-mail: stop using PYTHON_PN
Date: Fri, 23 Jun 2023 16:38:53 +0200
Message-Id: <20230623143921.146338-28-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103523

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2 so use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
index e568f7fac..aaf02a23b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
@@ -11,4 +11,4 @@ PYPI_PACKAGE = "Flask-Mail"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "${PYTHON_PN}-flask"
+RDEPENDS:${PN} = "python3-flask"
-- 
2.39.2


