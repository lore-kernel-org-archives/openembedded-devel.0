Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15156C001B3
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:14 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.7428.1687180987118863254
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=KCDi37TG;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.43, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f86a7a5499so2003062e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180985; x=1689772985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvNxztIufpGejwga39A13HR0pTuvQYg4b3Y2x3BSmfc=;
        b=KCDi37TGrw7kknlCpTsCdFWMm67+1PywGWUR0nMwDXeGKfG6nR1W5dfQVsn4RZmTp6
         CBIdVYY7fgXVENO4FmcSDGcmPt2I+rnIy39HeuUCaNzTWI3KTWQ5wV3KaEjgrXjqNZsS
         O0tk+s9F5VDfITlzy8m6G/LnAOb3EHWnq/hdFZr03WHtL5baVfDmXVnzSYlDtvSmJllB
         MojsoMtGbqB5tghXSThFWVwGwCJ2HiWj+co6a+yGlnIwHMMT0B6i4cNb80tefUO7UQRF
         +toVtXtE3iy4tAoA3Ww28iEeBzOjdaNQ6N2oYxM4N8xviwvZT4hVH+p+9vh+xCh6orCV
         KGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180985; x=1689772985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvNxztIufpGejwga39A13HR0pTuvQYg4b3Y2x3BSmfc=;
        b=aQKnVLhgRw/Ve2J9wi1DFHEvFvf7ZJungTwyoGuR9++B8JVH2GfzH++EatnNZfNrqX
         d0NQToxsW47YxixjqPpTc5A9KOrSRdXxDD9v6I19zD55R1fn0dbU2Tc4MKG3nsrjqP7R
         27OQSU08TpX2qhPjleSymyKaL3BFbX47R535ky+JPpH/mo2uuq2IWF5zwOSZsevEiJM7
         85JzgGJjA61BIeHJNtNPrUQIhFv85Chm9B5oS5yw2G0Wxlj5Vs+3c+m/zfNJGeFv3LnT
         rrzfYd5/aB7D6tVfDYyvaa/Euzsa1rYTW+noSA3zo0aDpC63fvxffpoABMBIPPP0MoOf
         IvpA==
X-Gm-Message-State: AC+VfDxItM6tOEG3hUmiruGT9UzTPALy1NvJViejqn5PnTv+lKmeYL6d
	QSLE2ILj3F/Tx6fa1OUfM3v2VA==
X-Google-Smtp-Source: ACHHUZ4DFswZTUiiO0w0bSmcnTdp3Jdro8X3RhuMS2V2KS7PUCk+FYbfz+xwqGYkII/1N9A/QShhhg==
X-Received: by 2002:a19:6451:0:b0:4f8:752f:df48 with SMTP id b17-20020a196451000000b004f8752fdf48mr934880lfj.29.1687180985492;
        Mon, 19 Jun 2023 06:23:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 43/54] python3-configobj: fix coding style
Date: Mon, 19 Jun 2023 15:22:03 +0200
Message-Id: <20230619132214.213417-44-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103427

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Stop using PYTHON_PN, fix whitespaces.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-configobj_5.0.8.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
index b8b5e6f89..fa9424a51 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
@@ -8,6 +8,6 @@ SRC_URI[sha256sum] = "6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "\
-	${PYTHON_PN}-six \
+RDEPENDS:${PN} += " \
+    python3-six \
 "
-- 
2.39.2


