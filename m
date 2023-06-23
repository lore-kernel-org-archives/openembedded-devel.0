Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329FEC0015E
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:17 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.204.1687531211362729541
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=BmFXYdcK;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.43, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f865f0e16cso916801e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531209; x=1690123209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR6XW7flIsx14c+SthcS0r2Gev+52bwFSqtj7HMP3N8=;
        b=BmFXYdcKykXjODR8Xu7kYzv0GZuFvpsvXylB5YuQzNTko61c2pUrqLjs39OVBqESe6
         PGJvF6TtY/FERtlRZ1K0XGGzGSFRAPUYdmudYtN6e8my2Sl9HIgHYsHbGGqpzZnmhuAx
         pN9Ky/cAvs+7cxaiQqrOgZZL7yn2WkLCjXMvVEfYTIZ6lsYL3o03nGutkcoyMVZ3weAS
         aZUHRShgD/JBZru01ul9Rqe9M7hcUcTdE5n/+Wfz4xNybJNUfgFZEG+l+aOS3tOQ18Ov
         z5bF1lGr2vY7rL/MsRChQTlx60tXrzGcBiW+QLEexAggA6RzZC3DQjLhlGv7vj8IPS7n
         Tr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531209; x=1690123209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AR6XW7flIsx14c+SthcS0r2Gev+52bwFSqtj7HMP3N8=;
        b=I4CuI72qJBw0EYbOUiTLmPmWbj81+ry18/l9rhChKalt+TMWeQUqEX+ldV1Vto+bZk
         9BOo7j+Ha5ASXNCjllLgD5qT1itRYbRMe86RY9hnyxg9amhifohaUsxn+ccEmCyNp6xG
         ssrzmCNZRuSIHCKc+MttO0COkkU8txJ6+n88COKS7QLksvzVBgp7D58ZDfOObUzhvQ6H
         s5Ii+gt10TT/TG80BNEGoFiaLpt0fFZ7AaxHg5XVB0kaKgMXbJhv+mX90BL99211aAPS
         N159Q02voPFGpIuXXh3nioxVZLmLL1+NwTzipNNRI27w3OTRwVGRYysgGpNw5qRcpuxF
         nu3w==
X-Gm-Message-State: AC+VfDyUhjCavnCPGLj2/VV8rSthKAaoHbYdTBiJCPKePLFV3B5Abrmx
	QW7/rGk2bNK3//zi1P+TOmet6ZFcB6p9cWGCaeo=
X-Google-Smtp-Source: ACHHUZ4CBLKUoLJ6tOkzRDOhaVJkWKCm7cG/eZbvfhVaD8XkythRoDLGKTYXbUsBgcRvMnxO6Pe2lQ==
X-Received: by 2002:ac2:5b46:0:b0:4f6:3677:54e with SMTP id i6-20020ac25b46000000b004f63677054emr12553591lfp.36.1687531209631;
        Fri, 23 Jun 2023 07:40:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 37/55] python3-betamax: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:03 +0200
Message-Id: <20230623143921.146338-38-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103533

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-betamax_0.8.1.bb        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
index e3c5e7a3a..feb9ab3e2 100644
--- a/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-betamax_0.8.1.bb
@@ -13,9 +13,13 @@ SRC_URI[sha256sum] = "5bf004ceffccae881213fb722f34517166b84a34919b92ffc14d1dbd05
 
 inherit pypi setuptools3 ptest
 
+RDEPENDS:${PN} += " \
+    python3-requests \
+    python3-unittest \
+"
+
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
-	${PYTHON_PN}-requests \
 "
 
 do_install_ptest() {
-- 
2.39.2


