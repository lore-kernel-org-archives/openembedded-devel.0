Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0097EC001B3
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.182.1687531189659811029
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=iXw7Vdlo;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fa798cf204so10524465e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531188; x=1690123188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOeewYQh5Eg1m4wZ3qsgO7KaJ3ldnjD8g3md6N579ro=;
        b=iXw7VdloCkNYp32jz0Brtk0kRFyv2oVJ2+8qTpXzezKO6Jtuek9qGPcRo2ZCfR4bwL
         +tkUsSzpnO/4MXFpcdtX7TFgPG/y7pLD9kGr1tPcP9ubJrzrFtkoEsv7Iia6MwJWU25+
         7Qx/MpQQT0dWKmCCCTLPV5CNOzXCelj7N6QEj11c8tpOAa32/JRsXxabgLUPPuCMnYKB
         uy3y4h/VLckxWkm2Is2Ij9GdZ05EWls99voJM1HHSBLX+nhzivj3peapjzfAatymqmPv
         9pmJF2bM1EkLq01tahL9rWIog8T+k9qP0J4F9TPDA65GWB9q/XBwfVIIJ5C9hn2lKCB2
         VTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531188; x=1690123188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOeewYQh5Eg1m4wZ3qsgO7KaJ3ldnjD8g3md6N579ro=;
        b=GR0Xqdm+bDBEKn/oXLieoT76L2P8wmYgmGWbyz4pTehoF4zoZv/mljLT+HMIAL2Pmc
         m97jzVBGTDf6kXHgv/18U69eP0AXXZps3Znj25S9f/A/LJ7+HLFJ4oQwOD/u3ivOhGx2
         BKI0r1kHxPqjYhwT2oEr7GKRGDJgeR8wrKhL+2RABNgYB9nW8P0izkVbPmHx5jDiGB3D
         +6jFyGzmtzfA4VacopwUDmyoA7biUXrSswDw64a9a+4+ccvQAR4PqIIdkDssgQti/Dfw
         2JXToVOMFyTg1Zsb4SMtGfGC6ugqMGhK6z6xgjjVgkq6BTGo17A9b9v7IbU9YSwlAxol
         rydw==
X-Gm-Message-State: AC+VfDzePMRJnWIkOZycpE6CXvu1J3x2jtzbsZj7c/cTVGjGdp4PnJOE
	H28d8GJS3F9JNe8V8nwqbxb4B04Oqdwv1iEpZ6M=
X-Google-Smtp-Source: ACHHUZ5PkYDWgLgYJFCpTcmFpkEffp8upQzbOyWCGiOjwsE/ZsdprliNlOqOZeFOhJl3ikJyACZz9g==
X-Received: by 2002:a7b:c314:0:b0:3f6:53a:6665 with SMTP id k20-20020a7bc314000000b003f6053a6665mr22940100wmj.19.1687531188203;
        Fri, 23 Jun 2023 07:39:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 17/55] python3-isort: fix coding style
Date: Fri, 23 Jun 2023 16:38:43 +0200
Message-Id: <20230623143921.146338-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103513

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN and fix white spaces.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-isort_5.12.0.bb                 | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
index 6d7b20f3a..03d7a529c 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.12.0.bb
@@ -8,13 +8,13 @@ SRC_URI[sha256sum] = "8bef7dde241278824a6d83f44a544709b065191b95b6e50894bdc722fc
 
 inherit pypi python_poetry_core
 
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-profile \
-    ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-difflib \
+RDEPENDS:${PN} += " \
+    python3-datetime \
+    python3-difflib \
+    python3-numbers \
+    python3-pprint \
+    python3-profile \
+    python3-shell \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


