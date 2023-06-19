Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15178C001DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:14 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.7390.1687180986042300020
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=4i5FPeb7;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3110a5f2832so3387768f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180984; x=1689772984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2P+b3SinEgWfzktVTTinG6FLz4mbyoofycGhpLD4GwE=;
        b=4i5FPeb7MCTQE6kUG458KOLL+c+W8ClYu+K+V6MyDegeXr44zXoCg+24p4U4tk9/cH
         c6TGTCYPQ3CMUXRai4/V1RgTscrCEIqbBcB333wV2mIZ3OQoAlExxigESXJM6iRSrKKd
         moAbjvTOEa8z8wAF29OJOk2Slw+yZ5JmPlsZJPKYJkjUWIAAp70TOFUYjE/WZEMJuGug
         CfnrcAYeifCTM8ZxfKpNSNQ/GwRAl8yysqLyW67jJNOII+qhe6+32/Ggfh6N34FNmo/q
         cJIMjRuGY8iPnM3dD+9J6TWhBD6nv9Wa0J98PfzcagiiVyQrnEUC0PLYnh4NAcOis1oZ
         7+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180984; x=1689772984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2P+b3SinEgWfzktVTTinG6FLz4mbyoofycGhpLD4GwE=;
        b=HLRm8BlUTcAt+uLevEgep3++YcRx3NX4P2pf6Ow4VKsAprjR9ymMoX/sgG7nfqSXkZ
         6ClqRLzUxOVeNUdoB5WaMZmtjbvMqUOcu0uSEhHkSmdxqKXm6+ExluG+I2X5echVaamY
         9C/kZBXdKkYydVk86klY9ufFapsTgTkEl448bwP1YrM7Snh1mwFFY/uuzwOTidl/8a0w
         CgK+VYZhizpLFNQftmvzExNPalp/RMqKO6hZDs7nuKdM0iBVqZErq4S/gdcYCAw8kHsG
         vo3R0GJAblE3MqhAkpysggqoNdhwkpUy/5W9xQze8n5Izd78+KWwPXCzQNwDxHBHLBqq
         AhbQ==
X-Gm-Message-State: AC+VfDzglF1JOeWDcx0m6y72jU0EVokk+pGVFZVXTa1iDHY0dXZYhoSB
	XSvNKJnF7zLPJ/f5EoyW0s4wZw==
X-Google-Smtp-Source: ACHHUZ7a6/SZDWydDaBFdnmxZ9JImayHS9tbtdzw3enVRDmtyLh5QytGZqpY98UwiVpvy1JN8hqZEQ==
X-Received: by 2002:a5d:6692:0:b0:311:108c:1fe6 with SMTP id l18-20020a5d6692000000b00311108c1fe6mr12952239wru.33.1687180984643;
        Mon, 19 Jun 2023 06:23:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:23:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 42/54] python3-colorzero: add missing run-time dependencies
Date: Mon, 19 Jun 2023 15:22:02 +0200
Message-Id: <20230619132214.213417-43-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103426

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-colorzero_2.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb b/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
index 1a331d13f..fc1615e67 100644
--- a/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
@@ -7,7 +7,10 @@ HOMEPAGE = " https://github.com/waveform80/colorzero "
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ae6c62710c0646f3c60d1ad812ea9bf9"
 
-RDEPENDS:${PN} = "python3-image"
+RDEPENDS:${PN} += " \
+    python3-image \
+    python3-numbers \
+"
 
 SRC_URI[sha256sum] = "e7d5a5c26cd0dc37b164ebefc609f388de24f8593b659191e12d85f8f9d5eb58"
 
-- 
2.39.2


