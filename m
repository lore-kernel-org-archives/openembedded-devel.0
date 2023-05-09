Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E28DC7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:46:01 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.26257.1683618329522266094
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mdXhI7DN;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f139de8cefso32203028e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683618351; x=1686210351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9ZjdB0she1vQIHABCu00XxxzsCMjsDa8P0KE4DPcFw=;
        b=mdXhI7DNn1BEjPX1sahk7DdWhgfJMZh7YFvmfPnm8bQjEUt/mDG+k9guG+Eqza9i9O
         SNwcEvYDXnr6dimZl7XbWEGk9Rt/BotbOXNy+kG1feMaQidLiEjOXdqahTiaN7+Ts3fu
         J7c2pqlu5Qz976umaUpQkRuTm6f7h2RV/i3XwXHqs1YzwNFXnOr5thcyjwJvty5FJ5lE
         nODZdNGxUxfoKLFXpSK81K1pOoWdT5bvIuWdfemc/LxUH8Zhjq3EDp1R6cLL8dsTtRzP
         uf6wV16kquH/QvPNfNnJ3mlnYB/BGcAS0MRrOJbd2/0Esy5frJd7EzIketEpVuM9TbPc
         yXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683618351; x=1686210351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9ZjdB0she1vQIHABCu00XxxzsCMjsDa8P0KE4DPcFw=;
        b=IZ/TwwX44Xap6LgbDyqV2ol6RKS8gpfOvmhYhqTTsuQitQsMrLga9ceAqZ7P20sYeA
         fg5SgQhPUwq3OIgSyqfUI9hkLVyZn+6o1eFqCTprhLsDWPboO8RC0GUS7klG9B6/WRdc
         YcW4F+Uxpoi0lz4+FG3JFxbABZ98JGv5TwXUG0T+cWuvdNNn4nN/arFL+D+XuY/LKYnx
         7GCDu16+koJmP0sD8iEgCofxr5YgPsd3E4FvqynwsWkDuP8cPoUY31czBk27XaTtKbRd
         2rGxqF1Jpe7er1jY7U4PUv1n/GeRmaF9AU9l2KYExoYUENIgQuWcjOEStz9lFMRD0pgj
         89GA==
X-Gm-Message-State: AC+VfDzRjlZfYqnDHdp6spf18qf/6zga1TZmwkcOK6xjJjAo3JsNwvPF
	5lpMx4dQmmpPGomwRhkHnjJX12XsBJQ=
X-Google-Smtp-Source: ACHHUZ6SMgvmLatlJo4QPnyHvTwNKeQXob3bWj4WhDYWIyvo8F/ennI/lJGmAFfswQwup4B3L+E5Vg==
X-Received: by 2002:a05:651c:ba0:b0:2ad:90bf:a5a9 with SMTP id bg32-20020a05651c0ba000b002ad90bfa5a9mr484847ljb.1.1683618350771;
        Tue, 09 May 2023 00:45:50 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com ([2a00:801:724:fbaf:9ccd:45e1:5af6:d3a6])
        by smtp.gmail.com with ESMTPSA id x13-20020a2e9c8d000000b002ac833114besm1458623lji.47.2023.05.09.00.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:45:50 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: francesco.dolcini@toradex.com,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH 2/2] libusbgx: fix device hot-plug use case
Date: Tue,  9 May 2023 09:45:09 +0200
Message-Id: <20230509074509.7362-4-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509074509.7362-1-liu.ming50@gmail.com>
References: <20230509074509.7362-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102488

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Upon hot-plugging device (resp. un-plugging host) dwc3_gadget_init()
does nicely get executed. However, for an actual gadget to get started,
it also requires the libusbgx dance as well. Instead of only doing this
upon boot aka after multi-user.target (which is fine only if the device
is already there at boot), execute it after usb-gadget.target. This
ensures dwc3_gadget_start() gets executed also during hot-plugging.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
index 74541d3c2..e2aa95a52 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
@@ -6,4 +6,4 @@ Type=oneshot
 ExecStart=/usr/bin/gadget-start
 
 [Install]
-WantedBy=multi-user.target
+WantedBy=usb-gadget.target
-- 
2.25.1


