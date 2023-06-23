Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E954BEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:39:56 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.179.1687531186929721120
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=PyN3BdJR;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.45, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f86dbce369so905531e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531185; x=1690123185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/V26U/lHLhWFUDOkghOAK5Xorar0mpwdaNP+/i+d7ps=;
        b=PyN3BdJRsyHWra1p45KJtvfQMDsyxHWBWBDfLIYmtX0tijoJrGIy41nSPRr4icAI/B
         ne68wg6qe8vE+NzFDZV9qSa1Bdscsn8Y4SOxubByZHuKtMJMSOchzBMovmEjnA4vLJ28
         pGDHd9/CoT+imOke1hLgRVH3e0eLVoML53H/00WlVB3V0ub4Kzh9D0GdJ3ViOU4GAc4h
         FodfeIKrCmVcucNOKDvth8B96Wn3dJGBy5VIVFlm+oZrqt/OS4AzrPJilmOY/EqrBHVs
         6pt8w+Kc77X+ltnJmqyGhgvcM83TliYxaS2r13nO74KRE+dvl3GRwK1GJuBWNXySYR6s
         QDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531185; x=1690123185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V26U/lHLhWFUDOkghOAK5Xorar0mpwdaNP+/i+d7ps=;
        b=YyqwV4czgaAcFfMCsf3oUnWCDnP5ckrb01+cdy0SdJIVizqa2ZcBOKS0bJWkNzaRup
         jJdJ19Ksh4Sv4fZGJckjxKqL46lV87MYhgYiFSvV1kTzrmF1AwWoTk6bacqpwcPBtqp+
         ausRSceNfLOTQDWA9Dq8ZgudRRZW/Io9AI62TVH9ocUZkgzdOPbMf0aXA0m8qrsyesiP
         OSwdqt9B5YEWiRbkwy6xW5P7JdYPkmRdeH5caxq7PFFLjqrB9JVVHaUu+OPRdVuGc8Y2
         BPx5W/JAG7mF4+b48OrFy+36HbxsvWpSFyczt5dOeBExUpUdA+LNjVYSjuEuNd5KW2Iz
         k2lQ==
X-Gm-Message-State: AC+VfDzizXuG+m053zRxPkx07PTtU/+8365mC2ypQJHB+Z5UxFelu4xC
	jbktUTwfyxyAdnwsiHEsDyodpSWu8GAR8S4mpDQ=
X-Google-Smtp-Source: ACHHUZ5HK98R4KrmUsYapxc/4SifGoj0WWA7c+r4tr3WkAewCbAwW0+z3pb3ozPX9/vnpNyrrWyzoA==
X-Received: by 2002:a19:e34a:0:b0:4f8:4263:42f with SMTP id c10-20020a19e34a000000b004f84263042fmr13280912lfk.17.1687531185104;
        Fri, 23 Jun 2023 07:39:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:39:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 14/55] python3-et-xmlfile: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:38:40 +0200
Message-Id: <20230623143921.146338-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103510

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
index fbebf4869..50ae7fa5e 100644
--- a/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-et-xmlfile_1.1.0.bb
@@ -15,6 +15,7 @@ RDEPENDS:${PN} += " \
     python3-io \
     python3-pprint \
     python3-shell \
+    python3-xml \
 "
 
 inherit setuptools3 pypi
-- 
2.39.2


