Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA10EB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:53 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.7381.1687180972168145692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=eUPR74ZH;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3112f2b9625so1858932f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180970; x=1689772970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcTsHXprrXBV5XpDzdocrF4ZW+TTGJ/VAS1ZjlQeWv4=;
        b=eUPR74ZHptpGajJflMxnVjtcrsbDbVu9lOKDtDPs3QUKVLeQIt0qUSVxDoZiOHd5FO
         kH76xLkJ9LhROFt42Wz879yiYlwTBwjz3XFQkTq3WtmtDXcx/7ZnslqyVkZPojcEtr2y
         I+/EX9IFrQ96GReP2mw2bw3r1Up2y8HgksJ7z9AjvOtZdGd73HsJZ//KbntjchHYIwM8
         4BDYE+Dq31rJmIqkbOvrAHFhh2TStkPXz+zIvtJsXQvKpBA0REIhXZrXzgA/LlpxKCsg
         V2IXkeimIoYQd9C89PmY3wr0Nq0zGKnj5NgJ2ag1DyEYUhNJZrDRaQp53W8/mw1/3gFz
         18Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180970; x=1689772970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcTsHXprrXBV5XpDzdocrF4ZW+TTGJ/VAS1ZjlQeWv4=;
        b=N42Pw8ngiioz6vbvX7pCg5nulxIm1r0ykrLgJtMiiQp6l7w6g2ScIz2FgLzyVkp/GV
         74dKqrJhMdVYORl7dtSdbwS8b97B3XF0z2LAPw6QTIGb0DRZx/Pp+woNei6o2//1LrxW
         UeZp2MstpR0W5paN77SSgtnM9YjjAmwg6t3t+PpAhoPlk3Xfn261kgHoh+gvFNZjC8k6
         Qi/tFk32ca8Q5mCPAbShkELM15xUoiDK2REgcgqEy1sCdilpmO56F0ZbhUTApFLD4RyY
         jIJEou3oqssFRot0XPpPn7uvVrpQXx5ozgVG1ht/MxXR3Ph0/aIfYiTohgmxtnc2dkwm
         R8OQ==
X-Gm-Message-State: AC+VfDyAvvne2DZjgBIKKVzBPckEkfpbePIyx2/H5lC5Z5sntvzxj9XE
	1xTK61kBxA7HbDw7NlBrDOSCfg==
X-Google-Smtp-Source: ACHHUZ4iAFk5939zHuC6bAsSTCMTGEJAOjb10126Dfs53rquxxm/m7EJQh3o1jdE309iqCYKH5NoJA==
X-Received: by 2002:adf:cc92:0:b0:309:4988:7f83 with SMTP id p18-20020adfcc92000000b0030949887f83mr6347402wrj.20.1687180970732;
        Mon, 19 Jun 2023 06:22:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 29/54] python3-flask-sijax: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:49 +0200
Message-Id: <20230619132214.213417-30-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103413

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python-flask-sijax.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-sijax.inc b/meta-python/recipes-devtools/python/python-flask-sijax.inc
index 036cf7c3b..239c843fc 100644
--- a/meta-python/recipes-devtools/python/python-flask-sijax.inc
+++ b/meta-python/recipes-devtools/python/python-flask-sijax.inc
@@ -5,4 +5,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=266adc7b911b7c84b837bf77196e1ba6"
 
 PYPI_PACKAGE = "Flask-Sijax"
-RDEPENDS:${PN} += "python3-sijax"
+RDEPENDS:${PN} += " \
+    python3-flask \
+    python3-sijax \
+    python3-werkzeug \
+"
-- 
2.39.2


