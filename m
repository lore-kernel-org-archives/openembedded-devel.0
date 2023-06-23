Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3702BC001B3
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:17 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.205.1687531212536285391
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=pRHxK9Y3;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f9bece8d1bso9275895e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531211; x=1690123211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6A5ky8pD2NP5EsqaLLI2a21g5Js69afU7FDwvgY5wkY=;
        b=pRHxK9Y3nHEoXV8HLLGXjQOfjI8bHpfEbtR6NSCvE/KSUNuOzYnjWmcQriwtyGoBPj
         SHEmSkqvvGYZ5vRmFWGhBxgkMmihFhT62RAd14PI7o6iH+WuhDCaCMlVAO6aiYi8KnJt
         s/aErtX8JMCmLCQ5z1lagjqwIOXifYv971ypvZgPyCQQSbZSQgdtgx5qQSQHewLQYy6E
         AN7bYCc8xn7Zww/A1W7iacZkxe6KHb+XbHPHzeEpUAvFQ81DWqDfj3wEC7XMrclLrhSI
         0GH0OTLxFZvF9rOBhtjl53IfrPWdN2n3CW4qPn6Moaxb5u/9EMyNDKfGwvGyl0s58etL
         yKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531211; x=1690123211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6A5ky8pD2NP5EsqaLLI2a21g5Js69afU7FDwvgY5wkY=;
        b=NxbnNp06eqde0TsW1woIfcCudH+a+xse0cJPWnIxTcSfhvzP+Fr1duai4ekwLCNQcl
         w1SlAi70yH+UDvUcvrDeFXXm3rRrN927Va46xBOcLDZuWWV2AqjFWLPGDK5qSiGIlqHc
         g64mY8eRQ+poFEbxLD2MDPNeFBwzpmBP5pvzTFSBrVy+ARyf9FoP5OgT/ObMlj/Z0kOy
         TTKPueamE9QJc8dLP9y+O20svTcwE7afoJgfI+CIMXxwjdddusGkM4JHVLPTZ4m0txFz
         r+VI2wrBWE+PQvx9Z3voUXeXYou1wJwK/osyVonCV/w9yTRwgUZuLxivk0GAv0XvDLIw
         Gr6w==
X-Gm-Message-State: AC+VfDwF/zkhw+kaK9oi8DLl40G1zW3sB8YyAjbuZQWupxFG+DAA0fbO
	e+x4L5KaqK4WXjiluDSswRixoRh1iFCBBKvfv1I=
X-Google-Smtp-Source: ACHHUZ7ZffabsBBF/VJsAl5VeJJl063yP45vWLG3MEp8ZH5dpHnt+24iBotIiFWqdSbuIcZBsskbuQ==
X-Received: by 2002:a1c:7419:0:b0:3f9:b79d:a5fa with SMTP id p25-20020a1c7419000000b003f9b79da5famr8553165wmc.16.1687531211045;
        Fri, 23 Jun 2023 07:40:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 38/55] python3-binwalk: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:04 +0200
Message-Id: <20230623143921.146338-39-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103534

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-binwalk_2.3.3.bb      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
index 362efa275..1a55a3e4a 100644
--- a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
@@ -14,4 +14,10 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
-RDEPENDS:${PN} += "python3-core"
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-logging \
+    python3-netserver \
+    python3-setuptools \
+    python3-stringold \
+"
-- 
2.39.2


