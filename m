Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DE0C7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:11 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.9128.1685521563710639262
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=Y7ep4Shg;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-30ae5f2ac94so3875826f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521562; x=1688113562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ito2hS3sSlenRHbJOB+QHsN1jJl1b34L5L668DQUM6A=;
        b=Y7ep4ShgZ7UrFnCHVdtuqsFVGqCtSH0aAtqXfQoBg2FcoxICoDbMlVxCB7mxo20m5Y
         AoGLhPIYKGwSojqppJvoKczFFO17MwLusQsip2L+KScebJ/Tu3qgl/pUDdEBWWNhio7M
         zuJY2UVbuxOB3bhPs3afoAzld/Sr3gRnBX+42B6QFH158ys2JygrEjadYkAEwa2343JR
         Y6qdy14gs3djbYIV518/dHVjaWlazvLOOWxH9mS2GEJeBanIuMy1BWMUvKREVMlUFb89
         NJQYls/K4gc5TTQEoe8GAaXFtIU9Wmek9aVSEg0g7GiXdtn+0uK5Sskf8+pYDMAH0pBw
         XrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521562; x=1688113562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ito2hS3sSlenRHbJOB+QHsN1jJl1b34L5L668DQUM6A=;
        b=PmZ9VrtvYTR/lRNal5jKBr/pZLFPoczjk8liwFFwGta1NvT/qgIWBS66O7/U/G5UHo
         1FSdAuQslt2xm5aSFl3wCJIYMv09IpctPnULRHjOEKCCYWuDcfIRvwi7OTOpMBtm7ShI
         4B73GqWExRmRzdf4TX93QBoSWwA0Y0PE8FbAZh5Wwcq2CcSquWKhrELiTeBWjS70l/o2
         YHF7xR1mpvUV2EVvgV8IW2Aw5KgPS0HbETNNSCKdOycYS0AKaORz3AdFMfbdqKPruWaO
         nvu7jEfxPbjf2zgTXvSZNos9z5pB48NSQ2fMjgeGYk22cBCj/4KHLpetfU2gjbe+CALv
         SqSQ==
X-Gm-Message-State: AC+VfDxt8xDdh8SO+mQcaGvBJTxUTGA7HXHthg0m12F6htXSIB6WH3gH
	pYAt+VuTgG2u9UC6lBZJOwkKiQ==
X-Google-Smtp-Source: ACHHUZ5g6tf+5Ndyq9w+zK0vwj52q8QCmnfSfNpIrlRukTfX9z2TYoLXTT+ytpObfK9JlwZHoQ3HKg==
X-Received: by 2002:a5d:6ac1:0:b0:307:14a6:ef97 with SMTP id u1-20020a5d6ac1000000b0030714a6ef97mr3529309wrw.67.1685521562269;
        Wed, 31 May 2023 01:26:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 051/149] python3-typeguard: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:59 +0200
Message-Id: <20230531082437.10646-52-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102978

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-typeguard_4.0.0.bb       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.0.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.0.0.bb
index 54ba6120a..ca17e2b13 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.0.0.bb
@@ -11,6 +11,11 @@ SRC_URI += " \
         file://run-ptest \
 "
 
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-unittest \
+"
+
 RDEPENDS:${PN}-ptest += " \
         ${PYTHON_PN}-pytest \
         ${PYTHON_PN}-typing-extensions \
-- 
2.39.2


