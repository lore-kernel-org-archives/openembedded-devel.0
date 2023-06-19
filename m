Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB2BC3DA40
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:43 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.7409.1687180963137600004
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=nJFyOGYk;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-307d58b3efbso2570125f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180961; x=1689772961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBJQwLw41lnnf4j9n85tizdA5x7KTwMGFRs2qPVLS6M=;
        b=nJFyOGYkNOz9IZVZtFlJEW8/1bqPIwoPRCVsx/L62T1e6iQcr/i6xr0yxCJVsoM3Su
         jY1mcYLOJFUrwx5M2WgP7dL/9bjnnrBRCOrHID+PIzCRTHBkoj1+Mkm+BpSc1Xw8kLOY
         Hd7D1aDfpGySjySmLObnNCjH0BuigasHOG+gJimQuC99iL9bTSuL9jxikZSEmPRso//W
         PRhJE2a6zJXN0Zb+VQAJE7uWvCd5q2EDw4sDAO722OIEGHyVNx0X4h/ywQaPfQGtigZj
         bGM1gP+Tdq7uYprX+j2kvW665prCVgQAEv1T1IRcbV1j8taC1sDzEuJPY1oOrDolrHo7
         Lbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180961; x=1689772961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBJQwLw41lnnf4j9n85tizdA5x7KTwMGFRs2qPVLS6M=;
        b=hEhWr8ooDX4dTmhHpZRc/TPKLvpoHqFc/WgEkgG4+9lix51ySZh79LbNvr2wJUDr2n
         PkU7RmCEMW89ym45nD07ZhKQa1tOAGbrB86s/Ia5YX43y6oFEwtyzpvYVpQ6jqVZQTkD
         hTMLiUuNWi70w0Zxyt0lMTB5E2tILVNAYPaNWCNEc8Qxn1wC0EyIKny313vlzDrUuH2l
         6bbmUAqqmlfqmUJlW73A89lJUn+lwGbIEPL714stOb3g6vc8rUQzB+9ikZ767lUSv9iN
         z56ViuJhMFTvw+cpCJ7Y7kzThzEx8rGXfuwRBtAIWnjj+UHRErk3pVD+Fez0j6BnX+fJ
         JSnw==
X-Gm-Message-State: AC+VfDyjPJgRF4Y8I6ZTT827sCZchRCLrjhPuRE2UiPWRfkNpdIt+bgl
	+258/O3KcF21MKXBqf44EMGfgg==
X-Google-Smtp-Source: ACHHUZ6jiRWm7zEOYQ6DHOvsimdKiJUliAMquskxxVROgk8fIM0s7QOGO4kfsBZqlj67u3VUjapxmw==
X-Received: by 2002:a5d:58c7:0:b0:30e:45ac:810e with SMTP id o7-20020a5d58c7000000b0030e45ac810emr6396718wrf.36.1687180961697;
        Mon, 19 Jun 2023 06:22:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 21/54] python3-hpack: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:21:41 +0200
Message-Id: <20230619132214.213417-22-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103405

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
index afba98e4b..0297cb8c2 100644
--- a/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
+++ b/meta-python/recipes-connectivity/python-hpack/python3-hpack_4.0.0.bb
@@ -8,3 +8,5 @@ SRC_URI[md5sum] = "27e01514ef06dc9fa0798d3dcb7de47c"
 SRC_URI[sha256sum] = "fc41de0c63e687ebffde81187a948221294896f6bdc0ae2312708df339430095"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-logging"
-- 
2.39.2


