Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BEDC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 12:27:05 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.6762.1654086416976810081
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UXktiyhK;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id i185so1772611pge.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j40NStAKf6hVoguXeP1YcXYd2F25Dhg/biLZShiJim4=;
        b=UXktiyhKxlWbWsozI797TeOJ2/HTQadenktAS0Z7UAYAmSH2s126CQc+B5YNmcVQje
         ew3UgPUXzZ4Ks/+k1mCzr+xl3M64Nc4pbn1w4hWgeKKAfiwJhYlXJvaKSlC7wrRxgbyd
         ck5Ppxxjvpyg9WuwYK4yRKNxDeCDxa0w84TUa9tnp5jsFYNr9TNF6YLNycmyI8wcxIi1
         wa+9dcaMISpKDZvgpcyLERdckfFlETV9O5UwKgkqwegq2Ej6KqcL4jUwTIQyJMcPp/iW
         vv/n2b56tnbOevgzEFqJlOhtX5biUBi1LmQgtAdUHUNt3Nyv2ypd/U+4EjySKyZoIz0U
         TpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j40NStAKf6hVoguXeP1YcXYd2F25Dhg/biLZShiJim4=;
        b=c/2/HBllIkBDmBxmidVnne40ga6bUIE7Fpn3FgNNseQtMi6D7mrwaxomjXpZ6cF+RW
         0Ck1LGADBXcUeG82XVCyEsa6tr29luYWh+jpcqrleCxyTNRRws0WPpBlTkekRlpVoU25
         cx+jwBNkwvDrlMQ7U1mMpTM3oImOcZxnOOGvgEeIAJA51o/7cxFSgR/0G/11mGtqBSIC
         wgJthaiVYMjSZS8EAaDiZ29+1KU/1jr/zlUbyHjT4UMxaD2Ey6SdYU7F114+qCppHLxN
         arQX8ZwEq7oOH4dgsUJ9tGT2PpPwMFjL8U/wN2o6hvVjuHcPOjkwsTV0E14vBfHiiz8P
         /OQg==
X-Gm-Message-State: AOAM532rl4vPqT2ENvKVLcGNgvwCyqHKKeabWV07NCK/PDauAi0wmG8o
	Q9EGFZCJ1D4A1jNyHbRBNil+T6bebCM3ZQ==
X-Google-Smtp-Source: 
 ABdhPJwMTM8eCHkqnP6Ax+G58y+Kn6ZPEmeNXl/1FGXQBRPBwdj/XKuoyTfnNfBfan1asR70v/AMCQ==
X-Received: by 2002:a63:5843:0:b0:3fc:34b5:8278 with SMTP id
 i3-20020a635843000000b003fc34b58278mr9868206pgm.249.1654086416161;
        Wed, 01 Jun 2022 05:26:56 -0700 (PDT)
Received: from localhost.localdomain ([103.85.9.215])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm1401006plm.191.2022.06.01.05.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:26:55 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	raj.khem@gmail.com,
	Tim Orling <ticotimo@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-python][dunfell][PATCH 8/9] python3-pillow: fix wheel build
Date: Wed,  1 Jun 2022 17:55:26 +0530
Message-Id: <20220601122527.19987-8-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
References: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jun 2022 12:27:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97366

From: Tim Orling <ticotimo@gmail.com>

Recipe does not inherit pypi nor would PN resolve to the name of the
wheel so we must set PIP_INSTALL_PACKAGE appropriately.

The recipe also builds its wheel in ${S}/dist so we must set
PIP_INSTALL_DIST_PATH appropriately.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit b56940049dfa1968d5e0325ea3b2fe024a3aa34b)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
index e522269927..346071d1ca 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
@@ -13,6 +13,9 @@ SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
 
 inherit setuptools3
 
+PIP_INSTALL_PACKAGE = "Pillow"
+PIP_INSTALL_DIST_PATH = "${S}/dist"
+
 DEPENDS += " \
     zlib \
     jpeg \
-- 
2.17.1


