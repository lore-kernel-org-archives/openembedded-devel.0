Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED4AC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 20:35:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7213.1702413320250605106
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 12:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WUoe/z+b;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c3f68b69aso33932005e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 12:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702413318; x=1703018118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7zl2CTwBl/xf5oBgB4yXrrJaR4MfwktyacW0H2eBQ14=;
        b=WUoe/z+bLjHaUtOGKDcvAiiWL1S3KcdYhGiWWBS6JIRSpsyJZO1R+kzTD5eecOuYEi
         vt3nWp4G7RKA09KuCQ52aKGYH4OIs6lNXsBwG4EaYdk395etva/+4J2lcnLxGiyzmH7P
         eCEkq6XqJn2jlVnjDs46i3x3MwEAyQn5xTivvYR7kAq8G0oD0TFqAsxu9T2aMaeNYcKL
         tXHGvuxwcOTCRQW3BjRJXRoSLovby+JEh2zlwyIjtRku3vbpJtsXHA3svZJc68O3vCen
         7RLUElTotmTvN0G0ocdTLcHyUFJYKx/dLykEJAeIDa+4MY8qxXAklyo+7izBk0YBbXZi
         dhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702413318; x=1703018118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zl2CTwBl/xf5oBgB4yXrrJaR4MfwktyacW0H2eBQ14=;
        b=TbWTztnXweLuNrBI+kk0BR5njba+bbzxCs84g8UzedGeeXfNKN7wPd04Yf5pqdiUAm
         uEriu7JoU+f2ZAeaBhCCd48lWeGhsbT7wCw1ojD5H1LZkErqGk7gjMH6/OWGcHZekdP8
         3i+TGjHFaD80Q/dNZIeDP+Re7IdVlCTZ/HF3HX+wk230NaB9YZo/YQqrhMw/GRk/WN3T
         dcuY12COlcZNMqo9eUw6KP0BIu796OoNLYLd2WD3bHwPKdIjfK44KqYmNuI+cV/oMrTf
         20kb9vhKZtB02e2Fg0iEemYYtTr+jnO+tgdNOEP4lJtChETFDYBCGVQgfW/Q0pRG24Sh
         bCOQ==
X-Gm-Message-State: AOJu0YxeRIM6PL5t0a+WEbJX4Iz5Eb/6ijFJL0rEwtlhXIMFfB+5urNq
	71sEk8rj+1QhNX1rYdeOoMLCdtVLEq7/jA==
X-Google-Smtp-Source: AGHT+IHuFFfen6nq5ZuAdwt4vWRKUIORfD1F5h7dFGF6izx6f94vQuXnKh+zeykrPTnY6u7vjeUq/A==
X-Received: by 2002:a05:600c:4f87:b0:40c:3e9f:c777 with SMTP id n7-20020a05600c4f8700b0040c3e9fc777mr3457206wmq.62.1702413317944;
        Tue, 12 Dec 2023 12:35:17 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b0040c490db950sm7554730wmq.47.2023.12.12.12.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 12:35:17 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH 1/4] libbytesize: Removed unnecessary setting of B 
Date: Tue, 12 Dec 2023 23:35:06 +0300
Message-Id: <20231212203509.902175-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 20:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107341

Supports out of tree builds

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
index 28e40f66e..daa01bfc3 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
@@ -7,7 +7,6 @@ SECTION = "devel/lib"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 S = "${WORKDIR}/git"
-B = "${S}"
 
 SRCREV = "6e83cc6f6dff4f126fc79284e0c3c1c50123380d"
 SRC_URI = "git://github.com/storaged-project/libbytesize;branch=main;protocol=https"
-- 
2.25.1


