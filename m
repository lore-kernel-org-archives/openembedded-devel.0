Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E02A0C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 07:13:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.3533.1665385995310474908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 00:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ppdHIk1u;
 spf=pass (domain: linaro.org, ip: 209.85.221.45,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f45.google.com with SMTP id bu30so15602857wrb.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 00:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i/k+Qk7iub9pelA3mKVcOdFku2zcnueWWzJkIXmPmG0=;
        b=ppdHIk1uQZVXFdo1eACRQRvIq4aTxIKIfl3Xz5bZE0+F7sBAUpIW99G6s0fKyMv5ra
         +fXfHgHlipTkRX/k4jwSGIpwUc6c8yUs1eUrSRMH2xdUrf05imGe0+YiI57IxOZHfWcz
         GL70IdQU1Ml8kKW2wssCDZ2HAkNrLs/qUmKwne0akmSCgRAJtDKnL1k9TO9qAPG6vPTq
         zLtbM2SMNnwvjJQI2gRZGkwL9OIvdc5CsSMwXsi9yibO5kKUJbQNgtwA171zQ3uvT9qJ
         kRvBE4fEUeyl9SDg5NS6aor/a+ekfaiKloq5cFJZBsZb+w1VJGdF4mw2hW6ChMyVGonL
         WPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/k+Qk7iub9pelA3mKVcOdFku2zcnueWWzJkIXmPmG0=;
        b=SlVHzfa51TGHa1HSEad7P8oA0eTrHdXQ4t43hSFv9ULgNw0D8C9zE/8Sh24dPJ+ogE
         EmK/lAKU4RGYmpflpClPIIJX8KOTmqWv0QmW82wI+EQ6TOQk8ugecGnE+aG/njN3NwO0
         Co5TnlT82dNeeFqhQgqyLFWPThjWoAQ5WrLrKJ/COKaDHXMZwsYi05uCzWt+RVvGi1pu
         XmnTVstJe237dUep37vML7XsSrDZOsMQNJrbIkPNCR+LvMZBL1Xgypbi1qF/MJbFdK4M
         /jrubUgGn8v563DX8PyjBqUvHZLjDhsMZw7n3W31X05H1Q2ztz6IduKSEvdDGjXQL2vH
         lVcg==
X-Gm-Message-State: ACrzQf25JzGBMOGTPJKqGeQZOSre0FD/Ggyz3jedRFfcCet1gHji2j5H
	R57DHpJjvnWj2fCmchErC6GKyCN+kBSZLGQS
X-Google-Smtp-Source: 
 AMsMyM6jrCwIoEhD7yhmlbO/eMiFpoBENK2ml1jaHCvwIgpAg8kKd9llFMH91pKkbvxPeUTCzUKBGQ==
X-Received: by 2002:a05:6000:178a:b0:22e:d215:4099 with SMTP id
 e10-20020a056000178a00b0022ed2154099mr9047107wrg.79.1665385993023;
        Mon, 10 Oct 2022 00:13:13 -0700 (PDT)
Received: from qcom-hackbox.linaro.org ([2a01:4f8:171:26db::2])
        by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b003b4c979e6bcsm15961823wmq.10.2022.10.10.00.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 00:13:12 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-python2][PATCH] layer.conf: switch to langdale
Date: Mon, 10 Oct 2022 07:12:57 +0000
Message-Id: <20221010071257.3762545-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 07:13:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99115

To ensure that this branch can still be used with OE-core.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 38ef579..781884c 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -14,7 +14,7 @@ LAYERVERSION_meta-python2 = "1"
 
 LAYERDEPENDS_meta-python2 = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python2 = "kirkstone"
+LAYERSERIES_COMPAT_meta-python2 = "langdale"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.30.2


