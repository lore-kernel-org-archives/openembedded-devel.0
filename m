Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C1AC3DA41
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:57 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.196.1687531194143244704
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=FzLLCo47;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f8fb0e7709so9093065e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531192; x=1690123192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNTc1XeJP4nB7NNgqPFp+J2URTz5gzK5D/kywteCEY0=;
        b=FzLLCo47yHx0mjeSf1om5sWC4w/urFkJhsg7jC1Y5cyHgcKzvTawixuNB5ibjqlR8z
         GlQ7Ew1Poy7jI4vwmSy9lvogdMr8qrdK+cgNIf+jW13gB141l2FsQ0N4i+eIocrMbDaL
         rcM8gLgAYrjJTmqyE1qS3hra5OthV/sHaCiV+D78gsZgmPVDKNQDimeXv61yH7MeiRjN
         qbyaUd4J15CLo5+moOFBDrysvyt/pPNqGqdKqEOUaN7MDQt8i23RDy+M8ugO0onVrhIZ
         hwhCN6+yU5f8wWYhyaaCQTT9MSP+UBxTX9+vGlSg3HmCf+UW9Y9jJZ6hlOrtLc1rCbne
         YVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531192; x=1690123192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNTc1XeJP4nB7NNgqPFp+J2URTz5gzK5D/kywteCEY0=;
        b=Yg/+IdL/iU98nSBoxI0oBpHzQ+MXLY3rfxhkabwBJsuoMoSb6mF71ocG9Aozmfkr8U
         iwmHeuF6AHFLGOznS++3CLqDYc/E1vPi6Ldc/eUTNoCwQ/2/nGW/n2VcbdFt5Hr0EDwp
         HGbBCroucQXHTFaLTPJh+9HhRgvdVa2BvLeoPsXzI61BBIIaZk7eeuttnMoUsozHf7JP
         fOoSGqCXDrGzln9MPQ+372qUjJtQKJsQm8H+Qbe2pgfX6a9fJtqZm93nH0ClGvDzzUtG
         TyBCQYIAtZx+FA3rcpphya42l6Ow3QBQLl4jkPDuT5Jiqw92gHZ/uoL/53PzxNqfA75H
         uHEw==
X-Gm-Message-State: AC+VfDzs9sCS87fKTf/8lTT04ZKkmOCoDwhLIXPWaVkGAA+J/ddaS2qu
	3tISy5nzcTvQMFLZx7L2GqFEt9auQZD6eLnnmS8=
X-Google-Smtp-Source: ACHHUZ7uaIZ9fMh5i5GP0WKg/dgvYPclv0QAr2fI3ivAJv5b+osW79WNbnd34oDg/Xzv61RA2m46OA==
X-Received: by 2002:a7b:c4da:0:b0:3f8:f67d:912d with SMTP id g26-20020a7bc4da000000b003f8f67d912dmr16650580wmk.16.1687531192633;
        Fri, 23 Jun 2023 07:39:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 21/55] python-idna-ssl: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:47 +0200
Message-Id: <20230623143921.146338-22-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103517

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python-idna-ssl.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-idna-ssl.inc b/meta-python/recipes-devtools/python/python-idna-ssl.inc
index e74bbd7c6..356a3873e 100644
--- a/meta-python/recipes-devtools/python/python-idna-ssl.inc
+++ b/meta-python/recipes-devtools/python/python-idna-ssl.inc
@@ -8,3 +8,8 @@ SRC_URI[sha256sum] = "a933e3bb13da54383f9e8f35dc4f9cb9eb9b3b78c6b36f311254d6d0d9
 
 PYPI_PACKAGE = "idna-ssl"
 inherit pypi
+
+RDEPENDS:${PN} += " \
+    python3-idna \
+    python3-io \
+"
-- 
2.39.2


