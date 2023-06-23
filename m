Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074ABC001DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.193.1687531191697611687
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=Gz/ioGX9;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f900cd3f96so8822125e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531190; x=1690123190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytIQ581RNTNTFHKmiOB6/MI45UzpvSdpkK/8kX+tFvU=;
        b=Gz/ioGX9PavAj02tCQYO1LiHYLdAOkTOEyS5xoGcNw4OguYiMmEvI8zCOVyPq0HYbD
         iOYDVQC0TN74vyUdv7mE27ATsTnAVpdtqfP4waxrOXHI457xanthd22U+6q8zyPsLFjg
         rBtdMR8kYI9vCDzNSqtTp7OI0gA/126MEYzBcQOJOb0UB22TmHn5g5apSaHQr8nTJPlS
         Lqi0AYYrnKOwA6p6mf513PYHChCTA1YIR2wgtjBLWc9QHYDkBwG+kdM5qD5f5pXQioqB
         WkhMOeBVoPCIwFJ6w6PgiMalXoJRkmMU6Yomn22+0yl5SgEZMlgG9RrC4Vh8A/FNz/Bh
         iT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531190; x=1690123190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytIQ581RNTNTFHKmiOB6/MI45UzpvSdpkK/8kX+tFvU=;
        b=XV/qDK6HbxBdb87FpvP8G20slANH8n60wqDtx6xtkCHSES/13JQTxi62KbYnHEfsaz
         vQJd4cwYtO7rymQdfRy8RHOokl0kXjLyRQpxhufJqg+K1i+oK6tpi30sk//jtmsRsKye
         1EK2XkolMClPlbLf7OP6IL9D45Qn2nTUhtqwKx2GtL1oCFsDMQFZu0zNFLJEmMR17lkc
         yC4wXJ/tRv9sG3fU6kueZd9NKFVuvVed0tjsI/G8xLieK2+3IMOBjdQUXbvMs/z8Pzvq
         UH5RQULLUm9Bl1QxKgZ+9isrlhIGDj7wkvKjVgJG8J3WI02Mlu+XGj4J/CWYCxjvpuP9
         GCAw==
X-Gm-Message-State: AC+VfDzIv2wwmhdYKtWQBAwP08VXE2dkJeHdWVvqmiXcb2UHDL3nvE+u
	Px75Kjhw22qfm9gEj+aizSkN3w==
X-Google-Smtp-Source: ACHHUZ4YCAQ6IsSZ5p3IDuXbFVVvZ215xuXpXBzxhPfdmMgyVnWQH9vcnW0/pMggcxJrP8kcwXcD6g==
X-Received: by 2002:a1c:7c0f:0:b0:3fa:7ebd:e1ee with SMTP id x15-20020a1c7c0f000000b003fa7ebde1eemr759692wmc.32.1687531190219;
        Fri, 23 Jun 2023 07:39:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 19/55] python3-isodate: stop using PYTHON_PN
Date: Fri, 23 Jun 2023 16:38:45 +0200
Message-Id: <20230623143921.146338-20-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103515

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2 so use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
index 2a5dcfca3..722ea3af3 100644
--- a/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-isodate_0.6.1.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "48c5881de7e8b0a0d648cb024c8062dc84e7b840ed81e864c7614fd3c1
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-six \
+    python3-six \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


