Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571D0C0015E
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:37 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.213.1687531226985134192
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=Nd6xH7cP;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.49, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f86d8a8fd4so950192e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531225; x=1690123225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pBpvlsjfGf02WyNtINdAsUTRuQS0o/7FAcoOoLn+HA=;
        b=Nd6xH7cP3AVJA+SZSyVg0gWgDyUM3UV1sDnMhtDTzx5JpcfyeH9i9gU+D/CS0oZjcU
         pIeNrj2LnVVZOuDyP2EXgYPuLYAXitsvirNPvneqp21MoZP6UupJ/009o3ByDfajhQuT
         ec84O+0wmoixcoaF45BA4gGRRvRMaFvbfITJXwrFeqjWUQ7VyTZvvv1KCEo3li+gBzWA
         PdEToKdL6sfC/bVLwN7YxZhu8hAVcvR8MFT3IjrZWsviyHRU1dDk9d3quvPp3RYfYLSW
         XhlVMCrEZ8pJE8TXuTGTiqydqYpMoVshBxtiXE/bCF/LRZtmr6zEwShIl8l1wNFEwzbU
         qXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531225; x=1690123225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pBpvlsjfGf02WyNtINdAsUTRuQS0o/7FAcoOoLn+HA=;
        b=h1GOWHizvV4YK2V10+pz7tKZSFhS1tZ6sKJUPLJFCfpA+UdWOILD5IrBoEQqxcv/hL
         ABK/zgvcean8Zx3VYwXwyS1yJ1YeJV/ntsHvg0FtNvboZzo7jEX8VSAsioOHX73nMUuh
         1d0CvbviLFlppZURKci30RBqriEoWHAI2TRm8OUxNyIRTJTss69KgH/bQQKqS8keGK45
         jHNP+e8E8+euxKR+//0f+zMh9QBzoe12zeRpcA/FbwFihpT9Kq73cetwb8FO3IlVgmsF
         0Lw8opguJFNthL4sES9LClNeL/n3F6+Q/zS9W29uzPkM8d7x3AZi0SKMZWkYBPeVf12/
         pKbQ==
X-Gm-Message-State: AC+VfDx45keHiR/tQe+IGnTIzuU2qcA0PL8gb7fjdfRc2EGwGeiHrd63
	nQYX7sGOD7O5tnuqoGGW34GeZA==
X-Google-Smtp-Source: ACHHUZ5e3Wto4DzgFT/kTPvPNqcnpArM+/S8ZWSizR1EIsUJU+oe2GGz1TN/3lceHVmAgTOdjLQRFw==
X-Received: by 2002:a05:6512:118d:b0:4f8:5e11:2cbc with SMTP id g13-20020a056512118d00b004f85e112cbcmr15960286lfr.36.1687531225162;
        Fri, 23 Jun 2023 07:40:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 51/55] python3-tzlocal: fix coding style
Date: Fri, 23 Jun 2023 16:39:17 +0200
Message-Id: <20230623143921.146338-52-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103547

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN, order RDEPENDS alphabetically, fix whitespaces.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-tzlocal_5.0.1.bb        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
index 43649bf73..97f4f410e 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_5.0.1.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "46eb99ad4bdb71f3f72b7d24f4267753e240944ecfc16f25d2719ba898
 
 inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} += "\
-	${PYTHON_PN}-pytz-deprecation-shim \
-        ${PYTHON_PN}-datetime \
+RDEPENDS:${PN} += " \
+    python3-datetime \
+    python3-pytz-deprecation-shim \
 "
-- 
2.39.2


