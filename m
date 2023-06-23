Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F114FC001DF
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:46 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.173.1687531183805611490
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=WWL074oJ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fa79605a3bso7396695e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531182; x=1690123182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvG98+OLHuC8tOs8R6M50JcrJXIZNT1gN6fIdDu9DKg=;
        b=WWL074oJvTAqI56e6/hd1ed+qS/ObPVmPwS0Ou+3dC7R2Ix1gU66yippMmEqw4jtkC
         0L+RivegCWzOu+9qaENrMag6IqysKL1+SesEyw1NjQL3pEzE0KhneEKa1J5PY1EQUo90
         3vCWydynL4vEVtnP8nmwwCdea4JyUrr4zZSmNMpMGAqjByODa/+IfRDeTd8NF+GedfyR
         MMHyZIfmqRXcMRJsWg9GAkHtHScNCpMjlgzK5Ha7zgYOy71TVSqJJPnseMnEJclzTnA/
         XB9hCmZp8bMb7qOwMTLOQyTmLBY5iHUe6dkU1kZaH3coN0tm6J6aRxSREBO63Yudhf9+
         BXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531182; x=1690123182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvG98+OLHuC8tOs8R6M50JcrJXIZNT1gN6fIdDu9DKg=;
        b=j5iLGvVHPhVR/7ib5ERo4zuj/x+/9oB+UAuFGlyH7LgvCSQYjh4iDqdvjUjLRn03PL
         zF8jjijsEiHbQrQ88MxcYpwgQV97q2vFO/uZ3PwKtR1fvXuEUdhkxTk+mji2JzZC8UAY
         S65dNfx7WXbZ0a0yj2CqniOLYGwAvlhfEko2HyaklGlQ/bw4s+L6H+cUYCFcAjx1/WFX
         gISBScLiLUsmCLnSuoHLEjGSZAJ6+t06KUpRNpa3AJ89oAUuBZrEJsqo7/EZ9icl9jqJ
         CqlqLVLOoRjs9r38e6JsxHtm9HVWhG2WWXLhHOcWsiJPd6ywDlueu4lEqE5pzEpUauKC
         /BAQ==
X-Gm-Message-State: AC+VfDz7MlTctr7kDLd3VQzvNVhAc+nlkVG/JUJBXOsJwztDMY3TwOFH
	9VLTCpW3tvoDejXzwDVh6X/2UQ==
X-Google-Smtp-Source: ACHHUZ5F3uJTc0hgk/M4rpIlZfaN0bqfdUci973qk+Wp1p4AQ9J6LMIEOGgJ5QVgwBkwiUxbRs4/Og==
X-Received: by 2002:a05:600c:4e92:b0:3fa:7515:902e with SMTP id f18-20020a05600c4e9200b003fa7515902emr4664418wmq.16.1687531182371;
        Fri, 23 Jun 2023 07:39:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 11/55] python3-path: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:37 +0200
Message-Id: <20230623143921.146338-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103507

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-path_16.6.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.6.0.bb b/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
index 51b6574e0..095f906f0 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
@@ -14,6 +14,10 @@ DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
     python3-appdirs \
+    python3-crypt \
+    python3-io \
+    python3-numbers \
+    python3-shell \
 "
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
-- 
2.39.2


