Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFB4C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 01:22:33 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.2772.1646184153371380061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DHcJRQgw;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so440628pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 17:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dYVbLdrMpQOanYQddVZdWsWqitirs+qE1HuksbM1x5o=;
        b=DHcJRQgwTyrntizoO6etpLlQ8Xib+mIrkfl6GtmykqohoCf95tvGfazPXdLaXUgUDP
         f8GiacEX/FdAR70BDfCujW0/nAnl2CuklwBQzpLmTrWkxjeSrbTSPD7u+1XE9ZX48Akb
         hhqbfkYCoYUxmMTB4UtjWh4ecsGU/jLFIs4OAYRIO8E08xZfJrImOsSD0rc5CO10gZfI
         R8RhH6ToCvz86o4Kp3pdxqkOocdETypMZqp4IEUn6zafif5/uYRHblKypFJX9EGCAFs+
         eebLVrmw+N1PCsS6b5cZ4M6i4EzqSWfX7YWIa/zapMmpFg3InUgU+tTZgWySwxF8XpfB
         XDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dYVbLdrMpQOanYQddVZdWsWqitirs+qE1HuksbM1x5o=;
        b=0aWGYgdTdILsIrkF5S+EIb57f0x6wxYkrF9RCiWfNQxCmJ77i0iInc9FIDsRGATwuB
         BTf46/pgn0Uh9RfQoPwR/+awJ8N85v/uV2A3JORNBqCj0vfEGErIzoJQ3E/KAgbaO+bT
         Vq87hfgkNnonW623KpqmCIgcnR898nDa6AezJ/xpbd6hNuD8Rku5W2KaK7ERFv9Bj469
         8nAgQCKUYZrznfbDDA5FcbyruKGPYiGBzZQwkBBOfkiKxPRuXh+uEekMOTKw8jWaEuXO
         8Z9dmsjS+8Rc1BPNo2nSTLITZ6Nag2+gBWOl/4g4da2gc/x33lT2AflWRpooaUNQjS+M
         Ykww==
X-Gm-Message-State: AOAM532VWehFFc5NATGV7u+WDNVhjfOw4MYn9fjJOMI+73zWHZIX9EGV
	zZ8IrQCTT+yBvPycWkaNhwuwNpbFQ/PaSw==
X-Google-Smtp-Source: 
 ABdhPJy4exMYXk2QoLnGw79n/7sJ7uzeeFiTtsNipjUKeBweKo/v9fWNWYwxuH8mIHSEwTpIUv99PA==
X-Received: by 2002:a17:90a:b307:b0:1bd:37f3:f0fc with SMTP id
 d7-20020a17090ab30700b001bd37f3f0fcmr15272545pjr.132.1646184152656;
        Tue, 01 Mar 2022 17:22:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 h12-20020a056a00218c00b004c3a2450acasm19681487pfi.147.2022.03.01.17.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 17:22:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/4] poetry-core: Define PIP_INSTALL_PACKAGE
Date: Tue,  1 Mar 2022 17:22:28 -0800
Message-Id: <20220302012228.2337827-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302012228.2337827-1-raj.khem@gmail.com>
References: <20220302012228.2337827-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 01:22:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95675

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
index 0941af9ff9..8ac9ed2be3 100644
--- a/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-poetry-core_1.0.8.bb
@@ -22,6 +22,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=104d5c3c653aeededf4076773aa4c236 \
 SRC_URI[sha256sum] = "951fc7c1f8d710a94cb49019ee3742125039fc659675912ea614ac2aa405b118"
 
 inherit pip_install_wheel python3native python3-dir pypi setuptools3-base
+PIP_INSTALL_PACKAGE = "poetry_core"
 
 RDEPENDS:${PN}:append:class-target = "\
     python3-compression \
-- 
2.35.1


