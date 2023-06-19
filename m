Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9691AC001DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:33 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.7362.1687180949602160712
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=aLER4U6I;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3112c11fdc9so1632652f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180948; x=1689772948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zVwbBmRe3wqNRGrTnqdCpzPcbwgOCpznIpz7u2vYic=;
        b=aLER4U6IqhqrS4Sm5iQcB/jEZ+f3qmwXO4xx0VuBz3IrCZieJlV5m1PQBr27mxMK89
         nC83TOz2r0j4lJuH2lkHbuaKET4jwnZ9oteY/Kyb6XyK6emkqf4SfTT1WkYgfLasuO3Y
         6P6/QL3eUnkgJKYJQH9wYpAmOHw5X7WTVAtLwSvPR8oiVqrTQLDjZ26cNqUsewz6W/r1
         74m56P7+4ytdrjXEpOIl/Pxd5zNDRR/W0n2du8/qGynmeNy45zPbFVa3WeAUGEOlvtVT
         maYnoyPCYluxZcU8ZN2doBD9j0TlRsejLbs8bjXofngFbxoGtfTslwQvHhjmiHPEFSid
         ksww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180948; x=1689772948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zVwbBmRe3wqNRGrTnqdCpzPcbwgOCpznIpz7u2vYic=;
        b=iLYkkvrhQUE7NtB2PgH6wT0ZZo7dHEQRBQURCObXZ1nop2BUbJEwnqcnGNWJJbho8a
         i5x3wmjLdU9IDnxW9B/QInmOeRngv2y0gi7k8ngB3tu0GZtWfOZSfUoqihHbgXEHmNWR
         RMk5mSEPky/R715NuSKpOxssZ4LAG86TTrthhFQvDkQh1964q79f6wgRr0Y2xDPHPCvK
         /UXiTS75/9VzqgY7eAiYb7rl64IHLo2yNSKFhXY+HvUe6M9OAPYI/bjFSTayUqY0cNk4
         7482Wmip/A4kMVNOBQQ0JuOdIL0r9AKFAK0yGaveW/wa4mvDTFPoVF53BSvbdy3B+Zz8
         bD8A==
X-Gm-Message-State: AC+VfDzZ874e2SbqW8WMAiT+swtFx56uX45Jv3FkIBZl5KKdO4QFYteY
	0kOLu8RkE62e/2bcbgrbZhNBLQ==
X-Google-Smtp-Source: ACHHUZ7GftLQkaNmAKyaC7GqxXihuCz0Y+iVBj+GGagfVHYv9O/+hffHBerDgl+9t9aEsVsGwOV0uw==
X-Received: by 2002:adf:f30f:0:b0:309:3a1e:fc54 with SMTP id i15-20020adff30f000000b003093a1efc54mr5918000wro.7.1687180948141;
        Mon, 19 Jun 2023 06:22:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 09/54] python3-path: fix coding style
Date: Mon, 19 Jun 2023 15:21:29 +0200
Message-Id: <20230619132214.213417-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103393

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN and make indentation consistent.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-path_16.6.0.bb        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.6.0.bb b/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
index 479177ed7..51b6574e0 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 SRC_URI[sha256sum] = "bea3816e1d54f4e33aac78d2031a0b0ed2f95e69db85b45d51f17df97071da69"
 
 SRC_URI += "\
-        file://run-ptest \
+    file://run-ptest \
 "
 
 inherit pypi python_setuptools_build_meta ptest
@@ -13,11 +13,11 @@ inherit pypi python_setuptools_build_meta ptest
 DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
-        ${PYTHON_PN}-appdirs \
+    python3-appdirs \
 "
 RDEPENDS:${PN}-ptest += " \
-        ${PYTHON_PN}-pytest \
-        ${PYTHON_PN}-unittest-automake-output \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 BBCLASSEXTEND = "nativesdk native"
-- 
2.39.2


